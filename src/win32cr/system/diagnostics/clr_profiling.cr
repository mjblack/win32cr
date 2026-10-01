require "./../../foundation.cr"
require "./../win_rt/metadata.cr"
require "./../com.cr"

module Win32cr::System::Diagnostics::ClrProfiling
  extend self
  alias FunctionIDMapper = Proc(LibC::UIntPtrT, Win32cr::Foundation::BOOL*, LibC::UIntPtrT)

  alias FunctionIDMapper2 = Proc(LibC::UIntPtrT, Void*, Win32cr::Foundation::BOOL*, LibC::UIntPtrT)

  alias FunctionEnter = Proc(LibC::UIntPtrT, Void)

  alias FunctionLeave = Proc(LibC::UIntPtrT, Void)

  alias FunctionTailcall = Proc(LibC::UIntPtrT, Void)

  alias FunctionEnter2 = Proc(LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Void)

  alias FunctionLeave2 = Proc(LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Void)

  alias FunctionTailcall2 = Proc(LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Void)

  alias FunctionEnter3 = Proc(Win32cr::System::Diagnostics::ClrProfiling::FunctionIDOrClientID, Void)

  alias FunctionLeave3 = Proc(Win32cr::System::Diagnostics::ClrProfiling::FunctionIDOrClientID, Void)

  alias FunctionTailcall3 = Proc(Win32cr::System::Diagnostics::ClrProfiling::FunctionIDOrClientID, Void)

  alias FunctionEnter3WithInfo = Proc(Win32cr::System::Diagnostics::ClrProfiling::FunctionIDOrClientID, LibC::UIntPtrT, Void)

  alias FunctionLeave3WithInfo = Proc(Win32cr::System::Diagnostics::ClrProfiling::FunctionIDOrClientID, LibC::UIntPtrT, Void)

  alias FunctionTailcall3WithInfo = Proc(Win32cr::System::Diagnostics::ClrProfiling::FunctionIDOrClientID, LibC::UIntPtrT, Void)

  alias StackSnapshotCallback = Proc(LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt8*, Void*, Win32cr::Foundation::HRESULT)

  alias ObjectReferenceCallback = Proc(LibC::UIntPtrT, LibC::UIntPtrT*, Void*, Win32cr::Foundation::BOOL)

  alias EventPipeProviderCallback = Proc(UInt8*, UInt32, UInt8, UInt64, UInt64, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FILTER_DATA*, Void*, Void)


  enum CorDebugIlToNativeMappingTypes
    NO_MAPPING = -1_i32
    PROLOG = -2_i32
    EPILOG = -3_i32
  end
  enum COR_PRF_SNAPSHOT_INFO
    COR_PRF_SNAPSHOT_DEFAULT = 0_i32
    COR_PRF_SNAPSHOT_REGISTER_CONTEXT = 1_i32
    COR_PRF_SNAPSHOT_X86_OPTIMIZED = 2_i32
  end
  enum COR_PRF_STATIC_TYPE
    COR_PRF_FIELD_NOT_A_STATIC = 0_i32
    COR_PRF_FIELD_APP_DOMAIN_STATIC = 1_i32
    COR_PRF_FIELD_THREAD_STATIC = 2_i32
    COR_PRF_FIELD_CONTEXT_STATIC = 4_i32
    COR_PRF_FIELD_RVA_STATIC = 8_i32
  end
  enum COR_PRF_MONITOR
    COR_PRF_MONITOR_NONE = 0_i32
    COR_PRF_MONITOR_FUNCTION_UNLOADS = 1_i32
    COR_PRF_MONITOR_CLASS_LOADS = 2_i32
    COR_PRF_MONITOR_MODULE_LOADS = 4_i32
    COR_PRF_MONITOR_ASSEMBLY_LOADS = 8_i32
    COR_PRF_MONITOR_APPDOMAIN_LOADS = 16_i32
    COR_PRF_MONITOR_JIT_COMPILATION = 32_i32
    COR_PRF_MONITOR_EXCEPTIONS = 64_i32
    COR_PRF_MONITOR_GC = 128_i32
    COR_PRF_MONITOR_OBJECT_ALLOCATED = 256_i32
    COR_PRF_MONITOR_THREADS = 512_i32
    COR_PRF_MONITOR_REMOTING = 1024_i32
    COR_PRF_MONITOR_CODE_TRANSITIONS = 2048_i32
    COR_PRF_MONITOR_ENTERLEAVE = 4096_i32
    COR_PRF_MONITOR_CCW = 8192_i32
    COR_PRF_MONITOR_REMOTING_COOKIE = 17408_i32
    COR_PRF_MONITOR_REMOTING_ASYNC = 33792_i32
    COR_PRF_MONITOR_SUSPENDS = 65536_i32
    COR_PRF_MONITOR_CACHE_SEARCHES = 131072_i32
    COR_PRF_ENABLE_REJIT = 262144_i32
    COR_PRF_ENABLE_INPROC_DEBUGGING = 524288_i32
    COR_PRF_ENABLE_JIT_MAPS = 1048576_i32
    COR_PRF_DISABLE_INLINING = 2097152_i32
    COR_PRF_DISABLE_OPTIMIZATIONS = 4194304_i32
    COR_PRF_ENABLE_OBJECT_ALLOCATED = 8388608_i32
    COR_PRF_MONITOR_CLR_EXCEPTIONS = 16777216_i32
    COR_PRF_MONITOR_ALL = 17301503_i32
    COR_PRF_ENABLE_FUNCTION_ARGS = 33554432_i32
    COR_PRF_ENABLE_FUNCTION_RETVAL = 67108864_i32
    COR_PRF_ENABLE_FRAME_INFO = 134217728_i32
    COR_PRF_ENABLE_STACK_SNAPSHOT = 268435456_i32
    COR_PRF_USE_PROFILE_IMAGES = 536870912_i32
    COR_PRF_DISABLE_TRANSPARENCY_CHECKS_UNDER_FULL_TRUST = 1073741824_i32
    COR_PRF_DISABLE_ALL_NGEN_IMAGES = -2147483648_i32
    COR_PRF_ALL = -1879048193_i32
    COR_PRF_REQUIRE_PROFILE_IMAGE = 536877056_i32
    COR_PRF_ALLOWABLE_AFTER_ATTACH = 268763902_i32
    COR_PRF_ALLOWABLE_NOTIFICATION_PROFILER = -1310512257_i32
    COR_PRF_MONITOR_IMMUTABLE = -285684736_i32
  end
  enum COR_PRF_HIGH_MONITOR
    COR_PRF_HIGH_MONITOR_NONE = 0_i32
    COR_PRF_HIGH_ADD_ASSEMBLY_REFERENCES = 1_i32
    COR_PRF_HIGH_IN_MEMORY_SYMBOLS_UPDATED = 2_i32
    COR_PRF_HIGH_MONITOR_DYNAMIC_FUNCTION_UNLOADS = 4_i32
    COR_PRF_HIGH_DISABLE_TIERED_COMPILATION = 8_i32
    COR_PRF_HIGH_BASIC_GC = 16_i32
    COR_PRF_HIGH_MONITOR_GC_MOVED_OBJECTS = 32_i32
    COR_PRF_HIGH_REQUIRE_PROFILE_IMAGE = 0_i32
    COR_PRF_HIGH_MONITOR_LARGEOBJECT_ALLOCATED = 64_i32
    COR_PRF_HIGH_MONITOR_EVENT_PIPE = 128_i32
    COR_PRF_HIGH_MONITOR_PINNEDOBJECT_ALLOCATED = 256_i32
    COR_PRF_HIGH_ALLOWABLE_AFTER_ATTACH = 246_i32
    COR_PRF_HIGH_ALLOWABLE_NOTIFICATION_PROFILER = 254_i32
    COR_PRF_HIGH_MONITOR_IMMUTABLE = 8_i32
  end
  enum COR_PRF_MISC
    PROFILER_PARENT_UNKNOWN = -3_i32
    PROFILER_GLOBAL_CLASS = -2_i32
    PROFILER_GLOBAL_MODULE = -1_i32
  end
  enum COR_PRF_JIT_CACHE
    COR_PRF_CACHED_FUNCTION_FOUND = 0_i32
    COR_PRF_CACHED_FUNCTION_NOT_FOUND = 1_i32
  end
  enum COR_PRF_TRANSITION_REASON
    COR_PRF_TRANSITION_CALL = 0_i32
    COR_PRF_TRANSITION_RETURN = 1_i32
  end
  enum COR_PRF_SUSPEND_REASON
    COR_PRF_SUSPEND_OTHER = 0_i32
    COR_PRF_SUSPEND_FOR_GC = 1_i32
    COR_PRF_SUSPEND_FOR_APPDOMAIN_SHUTDOWN = 2_i32
    COR_PRF_SUSPEND_FOR_CODE_PITCHING = 3_i32
    COR_PRF_SUSPEND_FOR_SHUTDOWN = 4_i32
    COR_PRF_SUSPEND_FOR_INPROC_DEBUGGER = 6_i32
    COR_PRF_SUSPEND_FOR_GC_PREP = 7_i32
    COR_PRF_SUSPEND_FOR_REJIT = 8_i32
    COR_PRF_SUSPEND_FOR_PROFILER = 9_i32
  end
  enum COR_PRF_RUNTIME_TYPE
    COR_PRF_DESKTOP_CLR = 1_i32
    COR_PRF_CORE_CLR = 2_i32
  end
  enum COR_PRF_REJIT_FLAGS
    COR_PRF_REJIT_BLOCK_INLINING = 1_i32
    COR_PRF_REJIT_INLINING_CALLBACKS = 2_i32
  end
  enum COR_PRF_EVENTPIPE_PARAM_TYPE
    COR_PRF_EVENTPIPE_OBJECT = 1_i32
    COR_PRF_EVENTPIPE_BOOLEAN = 3_i32
    COR_PRF_EVENTPIPE_CHAR = 4_i32
    COR_PRF_EVENTPIPE_SBYTE = 5_i32
    COR_PRF_EVENTPIPE_BYTE = 6_i32
    COR_PRF_EVENTPIPE_INT16 = 7_i32
    COR_PRF_EVENTPIPE_UINT16 = 8_i32
    COR_PRF_EVENTPIPE_INT32 = 9_i32
    COR_PRF_EVENTPIPE_UINT32 = 10_i32
    COR_PRF_EVENTPIPE_INT64 = 11_i32
    COR_PRF_EVENTPIPE_UINT64 = 12_i32
    COR_PRF_EVENTPIPE_SINGLE = 13_i32
    COR_PRF_EVENTPIPE_DOUBLE = 14_i32
    COR_PRF_EVENTPIPE_DECIMAL = 15_i32
    COR_PRF_EVENTPIPE_DATETIME = 16_i32
    COR_PRF_EVENTPIPE_GUID = 17_i32
    COR_PRF_EVENTPIPE_STRING = 18_i32
    COR_PRF_EVENTPIPE_ARRAY = 19_i32
  end
  enum COR_PRF_EVENTPIPE_LEVEL
    COR_PRF_EVENTPIPE_LOGALWAYS = 0_i32
    COR_PRF_EVENTPIPE_CRITICAL = 1_i32
    COR_PRF_EVENTPIPE_ERROR = 2_i32
    COR_PRF_EVENTPIPE_WARNING = 3_i32
    COR_PRF_EVENTPIPE_INFORMATIONAL = 4_i32
    COR_PRF_EVENTPIPE_VERBOSE = 5_i32
  end
  enum COR_PRF_HANDLE_TYPE
    COR_PRF_HANDLE_TYPE_WEAK = 1_i32
    COR_PRF_HANDLE_TYPE_STRONG = 2_i32
    COR_PRF_HANDLE_TYPE_PINNED = 3_i32
  end
  enum COR_PRF_GC_ROOT_KIND
    COR_PRF_GC_ROOT_STACK = 1_i32
    COR_PRF_GC_ROOT_FINALIZER = 2_i32
    COR_PRF_GC_ROOT_HANDLE = 3_i32
    COR_PRF_GC_ROOT_OTHER = 0_i32
  end
  enum COR_PRF_GC_ROOT_FLAGS
    COR_PRF_GC_ROOT_PINNING = 1_i32
    COR_PRF_GC_ROOT_WEAKREF = 2_i32
    COR_PRF_GC_ROOT_INTERIOR = 4_i32
    COR_PRF_GC_ROOT_REFCOUNTED = 8_i32
  end
  enum COR_PRF_FINALIZER_FLAGS
    COR_PRF_FINALIZER_CRITICAL = 1_i32
  end
  enum COR_PRF_GC_GENERATION
    COR_PRF_GC_GEN_0 = 0_i32
    COR_PRF_GC_GEN_1 = 1_i32
    COR_PRF_GC_GEN_2 = 2_i32
    COR_PRF_GC_LARGE_OBJECT_HEAP = 3_i32
    COR_PRF_GC_PINNED_OBJECT_HEAP = 4_i32
  end
  enum COR_PRF_CLAUSE_TYPE
    COR_PRF_CLAUSE_NONE = 0_i32
    COR_PRF_CLAUSE_FILTER = 1_i32
    COR_PRF_CLAUSE_CATCH = 2_i32
    COR_PRF_CLAUSE_FINALLY = 3_i32
  end
  enum COR_PRF_GC_REASON
    COR_PRF_GC_INDUCED = 1_i32
    COR_PRF_GC_OTHER = 0_i32
  end
  enum COR_PRF_MODULE_FLAGS
    COR_PRF_MODULE_DISK = 1_i32
    COR_PRF_MODULE_NGEN = 2_i32
    COR_PRF_MODULE_DYNAMIC = 4_i32
    COR_PRF_MODULE_COLLECTIBLE = 8_i32
    COR_PRF_MODULE_RESOURCE = 16_i32
    COR_PRF_MODULE_FLAT_LAYOUT = 32_i32
    COR_PRF_MODULE_WINDOWS_RUNTIME = 64_i32
  end
  enum COR_PRF_CODEGEN_FLAGS
    COR_PRF_CODEGEN_DISABLE_INLINING = 1_i32
    COR_PRF_CODEGEN_DISABLE_ALL_OPTIMIZATIONS = 2_i32
  end

  @[Extern]
  struct COR_IL_MAP
    property oldOffset : UInt32
    property newOffset : UInt32
    property fAccurate : Win32cr::Foundation::BOOL
    def initialize(@oldOffset : UInt32, @newOffset : UInt32, @fAccurate : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct COR_DEBUG_IL_TO_NATIVE_MAP
    property ilOffset : UInt32
    property nativeStartOffset : UInt32
    property nativeEndOffset : UInt32
    def initialize(@ilOffset : UInt32, @nativeStartOffset : UInt32, @nativeEndOffset : UInt32)
    end
  end

  @[Extern(union: true)]
  struct FunctionIDOrClientID
    property functionID : LibC::UIntPtrT
    property clientID : LibC::UIntPtrT
    def initialize(@functionID : LibC::UIntPtrT, @clientID : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct COR_PRF_FUNCTION_ARGUMENT_RANGE
    property startAddress : LibC::UIntPtrT
    property length : UInt32
    def initialize(@startAddress : LibC::UIntPtrT, @length : UInt32)
    end
  end

  @[Extern]
  struct COR_PRF_FUNCTION_ARGUMENT_INFO
    property numRanges : UInt32
    property totalArgumentSize : UInt32
    property ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE[1]
    def initialize(@numRanges : UInt32, @totalArgumentSize : UInt32, @ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE[1])
    end
  end

  @[Extern]
  struct COR_PRF_CODE_INFO
    property startAddress : LibC::UIntPtrT
    property size : LibC::UIntPtrT
    def initialize(@startAddress : LibC::UIntPtrT, @size : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct COR_PRF_FUNCTION
    property functionId : LibC::UIntPtrT
    property reJitId : LibC::UIntPtrT
    def initialize(@functionId : LibC::UIntPtrT, @reJitId : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct COR_PRF_ASSEMBLY_REFERENCE_INFO
    property pbPublicKeyOrToken : Void*
    property cbPublicKeyOrToken : UInt32
    property szName : Win32cr::Foundation::PWSTR
    property pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*
    property pbHashValue : Void*
    property cbHashValue : UInt32
    property dwAssemblyRefFlags : UInt32
    def initialize(@pbPublicKeyOrToken : Void*, @cbPublicKeyOrToken : UInt32, @szName : Win32cr::Foundation::PWSTR, @pMetaData : Win32cr::System::WinRT::Metadata::ASSEMBLYMETADATA*, @pbHashValue : Void*, @cbHashValue : UInt32, @dwAssemblyRefFlags : UInt32)
    end
  end

  @[Extern]
  struct COR_PRF_METHOD
    property moduleId : LibC::UIntPtrT
    property methodId : UInt32
    def initialize(@moduleId : LibC::UIntPtrT, @methodId : UInt32)
    end
  end

  @[Extern]
  struct COR_PRF_EVENTPIPE_PROVIDER_CONFIG
    property providerName : Win32cr::Foundation::PWSTR
    property keywords : UInt64
    property loggingLevel : UInt32
    property filterData : Win32cr::Foundation::PWSTR
    def initialize(@providerName : Win32cr::Foundation::PWSTR, @keywords : UInt64, @loggingLevel : UInt32, @filterData : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct COR_PRF_EVENTPIPE_PARAM_DESC
    property type__ : UInt32
    property elementType : UInt32
    property name : Win32cr::Foundation::PWSTR
    def initialize(@type__ : UInt32, @elementType : UInt32, @name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct COR_PRF_EVENT_DATA
    property ptr : UInt64
    property size : UInt32
    property reserved : UInt32
    def initialize(@ptr : UInt64, @size : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct COR_PRF_FILTER_DATA
    property ptr : UInt64
    property size : UInt32
    property type__ : UInt32
    def initialize(@ptr : UInt64, @size : UInt32, @type__ : UInt32)
    end
  end

  @[Extern]
  struct COR_PRF_GC_GENERATION_RANGE
    property generation : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION
    property rangeStart : LibC::UIntPtrT
    property rangeLength : LibC::UIntPtrT
    property rangeLengthReserved : LibC::UIntPtrT
    def initialize(@generation : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION, @rangeStart : LibC::UIntPtrT, @rangeLength : LibC::UIntPtrT, @rangeLengthReserved : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct COR_PRF_NONGC_HEAP_RANGE
    property rangeStart : LibC::UIntPtrT
    property rangeLength : LibC::UIntPtrT
    property rangeLengthReserved : LibC::UIntPtrT
    def initialize(@rangeStart : LibC::UIntPtrT, @rangeLength : LibC::UIntPtrT, @rangeLengthReserved : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct COR_PRF_EX_CLAUSE_INFO
    property clauseType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CLAUSE_TYPE
    property programCounter : LibC::UIntPtrT
    property framePointer : LibC::UIntPtrT
    property shadowStackPointer : LibC::UIntPtrT
    def initialize(@clauseType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CLAUSE_TYPE, @programCounter : LibC::UIntPtrT, @framePointer : LibC::UIntPtrT, @shadowStackPointer : LibC::UIntPtrT)
    end
  end

  @[Extern]

  record ICorProfilerCallbackVtable,
    query_interface : Proc(ICorProfilerCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback*, UInt32),
    release : Proc(ICorProfilerCallback*, UInt32),
    initialize__ : Proc(ICorProfilerCallback*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback, lpVtbl : ICorProfilerCallbackVtable* do
    GUID = LibC::GUID.new(0x176fbed1_u32, 0xa55c_u16, 0x4796_u16, StaticArray[0x98_u8, 0xca_u8, 0xa9_u8, 0xda_u8, 0xe_u8, 0xf8_u8, 0x83_u8, 0xe7_u8])
    def query_interface(this : ICorProfilerCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end

  end

  @[Extern]

  record ICorProfilerCallback2Vtable,
    query_interface : Proc(ICorProfilerCallback2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback2*, UInt32),
    release : Proc(ICorProfilerCallback2*, UInt32),
    initialize__ : Proc(ICorProfilerCallback2*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback2*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback2*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback2*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback2*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback2*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback2*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback2*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback2*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback2*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback2*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback2*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback2*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback2*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback2, lpVtbl : ICorProfilerCallback2Vtable* do
    GUID = LibC::GUID.new(0x8a8cc829_u32, 0xccf2_u16, 0x49fe_u16, StaticArray[0xbb_u8, 0xae_u8, 0xf_u8, 0x2_u8, 0x22_u8, 0x28_u8, 0x7_u8, 0x1a_u8])
    def query_interface(this : ICorProfilerCallback2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback2*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback2*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback2*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback2*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback2*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback2*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback2*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback2*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback2*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback2*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback2*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback2*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback2*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback2*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback2*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback2*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback2*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback2*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback2*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback2*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback2*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback2*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback2*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback2*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback2*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback2*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback2*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback2*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback2*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback2*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback2*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback2*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback2*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback2*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback2*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback2*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback2*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback2*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback2*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback2*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback2*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback2*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback2*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback2*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback2*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback2*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback2*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end

  end

  @[Extern]

  record ICorProfilerCallback3Vtable,
    query_interface : Proc(ICorProfilerCallback3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback3*, UInt32),
    release : Proc(ICorProfilerCallback3*, UInt32),
    initialize__ : Proc(ICorProfilerCallback3*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback3*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback3*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback3*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback3*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback3*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback3*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback3*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback3*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback3*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback3*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback3*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback3*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback3*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback3*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback3, lpVtbl : ICorProfilerCallback3Vtable* do
    GUID = LibC::GUID.new(0x4fd2ed52_u32, 0x7731_u16, 0x4b8d_u16, StaticArray[0x94_u8, 0x69_u8, 0x3_u8, 0xd2_u8, 0xcc_u8, 0x30_u8, 0x86_u8, 0xc5_u8])
    def query_interface(this : ICorProfilerCallback3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback3*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback3*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback3*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback3*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback3*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback3*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback3*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback3*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback3*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback3*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback3*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback3*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback3*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback3*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback3*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback3*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback3*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback3*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback3*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback3*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback3*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback3*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback3*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback3*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback3*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback3*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback3*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback3*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback3*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback3*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback3*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback3*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback3*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback3*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback3*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback3*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback3*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback3*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback3*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback3*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback3*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback3*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback3*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback3*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback3*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback3*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback3*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback3*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end

  end

  @[Extern]

  record ICorProfilerCallback4Vtable,
    query_interface : Proc(ICorProfilerCallback4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback4*, UInt32),
    release : Proc(ICorProfilerCallback4*, UInt32),
    initialize__ : Proc(ICorProfilerCallback4*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback4*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback4*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback4*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback4*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback4*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback4*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback4*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback4*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback4*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback4, lpVtbl : ICorProfilerCallback4Vtable* do
    GUID = LibC::GUID.new(0x7b63b2e3_u32, 0x107d_u16, 0x4d48_u16, StaticArray[0xb2_u8, 0xf6_u8, 0xf6_u8, 0x1e_u8, 0x22_u8, 0x94_u8, 0x70_u8, 0xd2_u8])
    def query_interface(this : ICorProfilerCallback4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback4*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback4*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback4*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback4*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback4*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback4*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback4*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback4*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback4*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback4*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback4*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback4*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback4*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback4*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback4*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback4*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback4*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback4*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback4*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback4*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback4*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback4*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback4*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback4*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback4*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback4*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback4*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback4*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback4*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback4*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback4*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback4*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback4*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback4*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback4*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback4*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback4*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback4*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback4*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback4*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback4*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback4*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback4*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback4*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback4*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback4*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end

  end

  @[Extern]

  record ICorProfilerCallback5Vtable,
    query_interface : Proc(ICorProfilerCallback5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback5*, UInt32),
    release : Proc(ICorProfilerCallback5*, UInt32),
    initialize__ : Proc(ICorProfilerCallback5*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback5*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback5*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback5*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback5*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback5*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback5*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback5*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback5*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback5*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback5, lpVtbl : ICorProfilerCallback5Vtable* do
    GUID = LibC::GUID.new(0x8dfba405_u32, 0x8c9f_u16, 0x45f8_u16, StaticArray[0xbf_u8, 0xfa_u8, 0x83_u8, 0xb1_u8, 0x4c_u8, 0xef_u8, 0x78_u8, 0xb5_u8])
    def query_interface(this : ICorProfilerCallback5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback5*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback5*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback5*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback5*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback5*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback5*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback5*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback5*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback5*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback5*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback5*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback5*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback5*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback5*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback5*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback5*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback5*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback5*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback5*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback5*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback5*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback5*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback5*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback5*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback5*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback5*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback5*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback5*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback5*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback5*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback5*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback5*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback5*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback5*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback5*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback5*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback5*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback5*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback5*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback5*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback5*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback5*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback5*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback5*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback5*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback5*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback5*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end

  end

  @[Extern]

  record ICorProfilerCallback6Vtable,
    query_interface : Proc(ICorProfilerCallback6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback6*, UInt32),
    release : Proc(ICorProfilerCallback6*, UInt32),
    initialize__ : Proc(ICorProfilerCallback6*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback6*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback6*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback6*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback6*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback6*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback6*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback6*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback6*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback6*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_references : Proc(ICorProfilerCallback6*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback6, lpVtbl : ICorProfilerCallback6Vtable* do
    GUID = LibC::GUID.new(0xfc13df4b_u32, 0x4448_u16, 0x4f4f_u16, StaticArray[0x95_u8, 0xc_u8, 0xba_u8, 0x8d_u8, 0x19_u8, 0xd0_u8, 0xc_u8, 0x36_u8])
    def query_interface(this : ICorProfilerCallback6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback6*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback6*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback6*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback6*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback6*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback6*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback6*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback6*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback6*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback6*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback6*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback6*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback6*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback6*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback6*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback6*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback6*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback6*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback6*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback6*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback6*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback6*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback6*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback6*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback6*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback6*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback6*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback6*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback6*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback6*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback6*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback6*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback6*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback6*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback6*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback6*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback6*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback6*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback6*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback6*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback6*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback6*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback6*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback6*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback6*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback6*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback6*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end
    def get_assembly_references(this : ICorProfilerCallback6*, wszAssemblyPath : Win32cr::Foundation::PWSTR, pAsmRefProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_references.call(this, wszAssemblyPath, pAsmRefProvider)
    end

  end

  @[Extern]

  record ICorProfilerCallback7Vtable,
    query_interface : Proc(ICorProfilerCallback7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback7*, UInt32),
    release : Proc(ICorProfilerCallback7*, UInt32),
    initialize__ : Proc(ICorProfilerCallback7*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback7*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback7*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback7*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback7*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback7*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback7*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback7*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback7*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback7*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_references : Proc(ICorProfilerCallback7*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    module_in_memory_symbols_updated : Proc(ICorProfilerCallback7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback7, lpVtbl : ICorProfilerCallback7Vtable* do
    GUID = LibC::GUID.new(0xf76a2dba_u32, 0x1d52_u16, 0x4539_u16, StaticArray[0x86_u8, 0x6c_u8, 0x2a_u8, 0xa5_u8, 0x18_u8, 0xf9_u8, 0xef_u8, 0xc3_u8])
    def query_interface(this : ICorProfilerCallback7*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback7*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback7*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback7*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback7*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback7*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback7*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback7*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback7*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback7*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback7*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback7*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback7*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback7*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback7*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback7*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback7*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback7*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback7*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback7*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback7*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback7*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback7*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback7*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback7*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback7*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback7*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback7*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback7*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback7*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback7*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback7*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback7*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback7*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback7*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback7*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback7*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback7*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback7*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback7*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback7*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback7*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback7*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback7*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback7*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback7*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback7*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback7*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback7*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end
    def get_assembly_references(this : ICorProfilerCallback7*, wszAssemblyPath : Win32cr::Foundation::PWSTR, pAsmRefProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_references.call(this, wszAssemblyPath, pAsmRefProvider)
    end
    def module_in_memory_symbols_updated(this : ICorProfilerCallback7*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_in_memory_symbols_updated.call(this, moduleId)
    end

  end

  @[Extern]

  record ICorProfilerCallback8Vtable,
    query_interface : Proc(ICorProfilerCallback8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback8*, UInt32),
    release : Proc(ICorProfilerCallback8*, UInt32),
    initialize__ : Proc(ICorProfilerCallback8*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback8*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback8*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback8*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback8*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback8*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback8*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback8*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback8*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback8*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_references : Proc(ICorProfilerCallback8*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    module_in_memory_symbols_updated : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_started : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_finished : Proc(ICorProfilerCallback8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback8, lpVtbl : ICorProfilerCallback8Vtable* do
    GUID = LibC::GUID.new(0x5bed9b15_u32, 0xc079_u16, 0x4d47_u16, StaticArray[0xbf_u8, 0xe2_u8, 0x21_u8, 0x5a_u8, 0x14_u8, 0xc_u8, 0x7_u8, 0xe0_u8])
    def query_interface(this : ICorProfilerCallback8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback8*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback8*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback8*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback8*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback8*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback8*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback8*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback8*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback8*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback8*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback8*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback8*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback8*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback8*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback8*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback8*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback8*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback8*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback8*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback8*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback8*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback8*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback8*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback8*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback8*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback8*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback8*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback8*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback8*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback8*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback8*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback8*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback8*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback8*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback8*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback8*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback8*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback8*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback8*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback8*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback8*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback8*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback8*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback8*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback8*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end
    def get_assembly_references(this : ICorProfilerCallback8*, wszAssemblyPath : Win32cr::Foundation::PWSTR, pAsmRefProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_references.call(this, wszAssemblyPath, pAsmRefProvider)
    end
    def module_in_memory_symbols_updated(this : ICorProfilerCallback8*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_in_memory_symbols_updated.call(this, moduleId)
    end
    def dynamic_method_jit_compilation_started(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL, pILHeader : UInt8*, cbILHeader : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_started.call(this, functionId, fIsSafeToBlock, pILHeader, cbILHeader)
    end
    def dynamic_method_jit_compilation_finished(this : ICorProfilerCallback8*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end

  end

  @[Extern]

  record ICorProfilerCallback9Vtable,
    query_interface : Proc(ICorProfilerCallback9*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback9*, UInt32),
    release : Proc(ICorProfilerCallback9*, UInt32),
    initialize__ : Proc(ICorProfilerCallback9*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback9*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback9*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback9*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback9*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback9*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback9*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback9*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback9*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback9*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_references : Proc(ICorProfilerCallback9*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    module_in_memory_symbols_updated : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_started : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_finished : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    dynamic_method_unloaded : Proc(ICorProfilerCallback9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback9, lpVtbl : ICorProfilerCallback9Vtable* do
    GUID = LibC::GUID.new(0x27583ec3_u32, 0xc8f5_u16, 0x482f_u16, StaticArray[0x80_u8, 0x52_u8, 0x19_u8, 0x4b_u8, 0x8c_u8, 0xe4_u8, 0x70_u8, 0x5a_u8])
    def query_interface(this : ICorProfilerCallback9*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback9*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback9*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback9*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback9*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback9*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback9*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback9*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback9*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback9*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback9*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback9*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback9*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback9*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback9*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback9*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback9*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback9*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback9*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback9*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback9*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback9*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback9*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback9*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback9*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback9*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback9*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback9*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback9*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback9*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback9*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback9*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback9*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback9*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback9*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback9*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback9*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback9*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback9*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback9*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback9*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback9*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback9*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback9*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback9*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback9*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback9*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback9*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end
    def get_assembly_references(this : ICorProfilerCallback9*, wszAssemblyPath : Win32cr::Foundation::PWSTR, pAsmRefProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_references.call(this, wszAssemblyPath, pAsmRefProvider)
    end
    def module_in_memory_symbols_updated(this : ICorProfilerCallback9*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_in_memory_symbols_updated.call(this, moduleId)
    end
    def dynamic_method_jit_compilation_started(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL, pILHeader : UInt8*, cbILHeader : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_started.call(this, functionId, fIsSafeToBlock, pILHeader, cbILHeader)
    end
    def dynamic_method_jit_compilation_finished(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def dynamic_method_unloaded(this : ICorProfilerCallback9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_unloaded.call(this, functionId)
    end

  end

  @[Extern]

  record ICorProfilerCallback10Vtable,
    query_interface : Proc(ICorProfilerCallback10*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback10*, UInt32),
    release : Proc(ICorProfilerCallback10*, UInt32),
    initialize__ : Proc(ICorProfilerCallback10*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback10*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback10*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback10*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback10*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback10*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback10*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback10*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback10*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback10*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_references : Proc(ICorProfilerCallback10*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    module_in_memory_symbols_updated : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_started : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_finished : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    dynamic_method_unloaded : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    event_pipe_event_delivered : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, UInt32, UInt32, UInt32, UInt8*, UInt32, UInt8*, LibC::GUID*, LibC::GUID*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_provider_created : Proc(ICorProfilerCallback10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback10, lpVtbl : ICorProfilerCallback10Vtable* do
    GUID = LibC::GUID.new(0xcec5b60e_u32, 0xc69c_u16, 0x495f_u16, StaticArray[0x87_u8, 0xf6_u8, 0x84_u8, 0xd2_u8, 0x8e_u8, 0xe1_u8, 0x6f_u8, 0xfb_u8])
    def query_interface(this : ICorProfilerCallback10*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback10*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback10*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback10*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback10*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback10*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback10*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback10*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback10*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback10*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback10*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback10*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback10*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback10*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback10*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback10*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback10*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback10*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback10*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback10*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback10*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback10*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback10*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback10*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback10*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback10*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback10*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback10*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback10*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback10*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback10*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback10*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback10*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback10*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback10*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback10*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback10*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback10*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback10*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback10*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback10*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback10*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback10*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback10*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback10*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback10*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback10*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback10*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end
    def get_assembly_references(this : ICorProfilerCallback10*, wszAssemblyPath : Win32cr::Foundation::PWSTR, pAsmRefProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_references.call(this, wszAssemblyPath, pAsmRefProvider)
    end
    def module_in_memory_symbols_updated(this : ICorProfilerCallback10*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_in_memory_symbols_updated.call(this, moduleId)
    end
    def dynamic_method_jit_compilation_started(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL, pILHeader : UInt8*, cbILHeader : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_started.call(this, functionId, fIsSafeToBlock, pILHeader, cbILHeader)
    end
    def dynamic_method_jit_compilation_finished(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def dynamic_method_unloaded(this : ICorProfilerCallback10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_unloaded.call(this, functionId)
    end
    def event_pipe_event_delivered(this : ICorProfilerCallback10*, provider : LibC::UIntPtrT, eventId : UInt32, eventVersion : UInt32, cbMetadataBlob : UInt32, metadataBlob : UInt8*, cbEventData : UInt32, eventData : UInt8*, pActivityId : LibC::GUID*, pRelatedActivityId : LibC::GUID*, eventThread : LibC::UIntPtrT, numStackFrames : UInt32, stackFrames : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_event_delivered.call(this, provider, eventId, eventVersion, cbMetadataBlob, metadataBlob, cbEventData, eventData, pActivityId, pRelatedActivityId, eventThread, numStackFrames, stackFrames)
    end
    def event_pipe_provider_created(this : ICorProfilerCallback10*, provider : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_provider_created.call(this, provider)
    end

  end

  @[Extern]

  record ICorProfilerCallback11Vtable,
    query_interface : Proc(ICorProfilerCallback11*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerCallback11*, UInt32),
    release : Proc(ICorProfilerCallback11*, UInt32),
    initialize__ : Proc(ICorProfilerCallback11*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    app_domain_creation_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_creation_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    app_domain_shutdown_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_load_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_load_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    assembly_unload_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    assembly_unload_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_load_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_load_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_unload_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    module_unload_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    module_attached_to_assembly : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_load_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    class_unload_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    class_unload_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    function_unload_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_compilation_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_compilation_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    jit_cached_function_search_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE, Win32cr::Foundation::HRESULT),
    jit_function_pitched : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    jit_inlining : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    thread_created : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_destroyed : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    thread_assigned_to_os_thread : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_started : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    remoting_client_sending_message : Proc(ICorProfilerCallback11*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_receiving_reply : Proc(ICorProfilerCallback11*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_client_invocation_finished : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    remoting_server_receiving_message : Proc(ICorProfilerCallback11*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_started : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    remoting_server_invocation_returned : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    remoting_server_sending_reply : Proc(ICorProfilerCallback11*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unmanaged_to_managed_transition : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    managed_to_unmanaged_transition : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_started : Proc(ICorProfilerCallback11*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON, Win32cr::Foundation::HRESULT),
    runtime_suspend_finished : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    runtime_suspend_aborted : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    runtime_resume_started : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    runtime_resume_finished : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    runtime_thread_suspended : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    runtime_thread_resumed : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    moved_references : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_allocated : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    objects_allocated_by_class : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    object_references : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    root_references : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    exception_thrown : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_enter : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_function_leave : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    exception_search_filter_enter : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_search_filter_leave : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    exception_search_catcher_found : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_enter : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_os_handler_leave : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_enter : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_function_leave : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_enter : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_unwind_finally_leave : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    exception_catcher_enter : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    exception_catcher_leave : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    com_classic_v_table_created : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    com_classic_v_table_destroyed : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_found : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    exception_clr_catcher_execute : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    thread_name_changed : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    garbage_collection_started : Proc(ICorProfilerCallback11*, Int32, Win32cr::Foundation::BOOL*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON, Win32cr::Foundation::HRESULT),
    surviving_references : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    garbage_collection_finished : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    finalizeable_object_queued : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    root_references2 : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    handle_created : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    handle_destroyed : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    initialize_for_attach : Proc(ICorProfilerCallback11*, Void*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    profiler_attach_complete : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    profiler_detach_succeeded : Proc(ICorProfilerCallback11*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_re_jit_parameters : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::HRESULT),
    re_jit_compilation_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    re_jit_error : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    moved_references2 : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    surviving_references2 : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    conditional_weak_table_element_references : Proc(ICorProfilerCallback11*, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_references : Proc(ICorProfilerCallback11*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    module_in_memory_symbols_updated : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_started : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    dynamic_method_jit_compilation_finished : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    dynamic_method_unloaded : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    event_pipe_event_delivered : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, UInt32, UInt32, UInt32, UInt8*, UInt32, UInt8*, LibC::GUID*, LibC::GUID*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_provider_created : Proc(ICorProfilerCallback11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    load_as_notification_only : Proc(ICorProfilerCallback11*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerCallback11, lpVtbl : ICorProfilerCallback11Vtable* do
    GUID = LibC::GUID.new(0x42350846_u32, 0xaaed_u16, 0x47f7_u16, StaticArray[0xb1_u8, 0x28_u8, 0xfd_u8, 0xc_u8, 0x98_u8, 0x88_u8, 0x1c_u8, 0xde_u8])
    def query_interface(this : ICorProfilerCallback11*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerCallback11*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerCallback11*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ICorProfilerCallback11*, pICorProfilerInfoUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pICorProfilerInfoUnk)
    end
    def shutdown(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end
    def app_domain_creation_started(this : ICorProfilerCallback11*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_started.call(this, appDomainId)
    end
    def app_domain_creation_finished(this : ICorProfilerCallback11*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_creation_finished.call(this, appDomainId, hrStatus)
    end
    def app_domain_shutdown_started(this : ICorProfilerCallback11*, appDomainId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_started.call(this, appDomainId)
    end
    def app_domain_shutdown_finished(this : ICorProfilerCallback11*, appDomainId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.app_domain_shutdown_finished.call(this, appDomainId, hrStatus)
    end
    def assembly_load_started(this : ICorProfilerCallback11*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_started.call(this, assemblyId)
    end
    def assembly_load_finished(this : ICorProfilerCallback11*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_load_finished.call(this, assemblyId, hrStatus)
    end
    def assembly_unload_started(this : ICorProfilerCallback11*, assemblyId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_started.call(this, assemblyId)
    end
    def assembly_unload_finished(this : ICorProfilerCallback11*, assemblyId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.assembly_unload_finished.call(this, assemblyId, hrStatus)
    end
    def module_load_started(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_started.call(this, moduleId)
    end
    def module_load_finished(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_load_finished.call(this, moduleId, hrStatus)
    end
    def module_unload_started(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_started.call(this, moduleId)
    end
    def module_unload_finished(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_unload_finished.call(this, moduleId, hrStatus)
    end
    def module_attached_to_assembly(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT, assembly_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_attached_to_assembly.call(this, moduleId, assembly_id)
    end
    def class_load_started(this : ICorProfilerCallback11*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_started.call(this, classId)
    end
    def class_load_finished(this : ICorProfilerCallback11*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_load_finished.call(this, classId, hrStatus)
    end
    def class_unload_started(this : ICorProfilerCallback11*, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_started.call(this, classId)
    end
    def class_unload_finished(this : ICorProfilerCallback11*, classId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.class_unload_finished.call(this, classId, hrStatus)
    end
    def function_unload_started(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.function_unload_started.call(this, functionId)
    end
    def jit_compilation_started(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_started.call(this, functionId, fIsSafeToBlock)
    end
    def jit_compilation_finished(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def jit_cached_function_search_started(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, pbUseCachedFunction : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_started.call(this, functionId, pbUseCachedFunction)
    end
    def jit_cached_function_search_finished(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, result : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_JIT_CACHE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_cached_function_search_finished.call(this, functionId, result)
    end
    def jit_function_pitched(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_function_pitched.call(this, functionId)
    end
    def jit_inlining(this : ICorProfilerCallback11*, callerId : LibC::UIntPtrT, calleeId : LibC::UIntPtrT, pfShouldInline : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.jit_inlining.call(this, callerId, calleeId, pfShouldInline)
    end
    def thread_created(this : ICorProfilerCallback11*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_created.call(this, threadId)
    end
    def thread_destroyed(this : ICorProfilerCallback11*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_destroyed.call(this, threadId)
    end
    def thread_assigned_to_os_thread(this : ICorProfilerCallback11*, managedThreadId : LibC::UIntPtrT, osThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_assigned_to_os_thread.call(this, managedThreadId, osThreadId)
    end
    def remoting_client_invocation_started(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_started.call(this)
    end
    def remoting_client_sending_message(this : ICorProfilerCallback11*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_sending_message.call(this, pCookie, fIsAsync)
    end
    def remoting_client_receiving_reply(this : ICorProfilerCallback11*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_receiving_reply.call(this, pCookie, fIsAsync)
    end
    def remoting_client_invocation_finished(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_client_invocation_finished.call(this)
    end
    def remoting_server_receiving_message(this : ICorProfilerCallback11*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_receiving_message.call(this, pCookie, fIsAsync)
    end
    def remoting_server_invocation_started(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_started.call(this)
    end
    def remoting_server_invocation_returned(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_invocation_returned.call(this)
    end
    def remoting_server_sending_reply(this : ICorProfilerCallback11*, pCookie : LibC::GUID*, fIsAsync : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remoting_server_sending_reply.call(this, pCookie, fIsAsync)
    end
    def unmanaged_to_managed_transition(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmanaged_to_managed_transition.call(this, functionId, reason)
    end
    def managed_to_unmanaged_transition(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_TRANSITION_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.managed_to_unmanaged_transition.call(this, functionId, reason)
    end
    def runtime_suspend_started(this : ICorProfilerCallback11*, suspendReason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_SUSPEND_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_started.call(this, suspendReason)
    end
    def runtime_suspend_finished(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_finished.call(this)
    end
    def runtime_suspend_aborted(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_suspend_aborted.call(this)
    end
    def runtime_resume_started(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_started.call(this)
    end
    def runtime_resume_finished(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_resume_finished.call(this)
    end
    def runtime_thread_suspended(this : ICorProfilerCallback11*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_suspended.call(this, threadId)
    end
    def runtime_thread_resumed(this : ICorProfilerCallback11*, threadId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.runtime_thread_resumed.call(this, threadId)
    end
    def moved_references(this : ICorProfilerCallback11*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def object_allocated(this : ICorProfilerCallback11*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_allocated.call(this, objectId, classId)
    end
    def objects_allocated_by_class(this : ICorProfilerCallback11*, cClassCount : UInt32, classIds : LibC::UIntPtrT*, cObjects : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.objects_allocated_by_class.call(this, cClassCount, classIds, cObjects)
    end
    def object_references(this : ICorProfilerCallback11*, objectId : LibC::UIntPtrT, classId : LibC::UIntPtrT, cObjectRefs : UInt32, objectRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.object_references.call(this, objectId, classId, cObjectRefs, objectRefIds)
    end
    def root_references(this : ICorProfilerCallback11*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references.call(this, cRootRefs, rootRefIds)
    end
    def exception_thrown(this : ICorProfilerCallback11*, thrownObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_thrown.call(this, thrownObjectId)
    end
    def exception_search_function_enter(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_enter.call(this, functionId)
    end
    def exception_search_function_leave(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_function_leave.call(this)
    end
    def exception_search_filter_enter(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_enter.call(this, functionId)
    end
    def exception_search_filter_leave(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_filter_leave.call(this)
    end
    def exception_search_catcher_found(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_search_catcher_found.call(this, functionId)
    end
    def exception_os_handler_enter(this : ICorProfilerCallback11*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_enter.call(this, __unused)
    end
    def exception_os_handler_leave(this : ICorProfilerCallback11*, __unused : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_os_handler_leave.call(this, __unused)
    end
    def exception_unwind_function_enter(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_enter.call(this, functionId)
    end
    def exception_unwind_function_leave(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_function_leave.call(this)
    end
    def exception_unwind_finally_enter(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_enter.call(this, functionId)
    end
    def exception_unwind_finally_leave(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_unwind_finally_leave.call(this)
    end
    def exception_catcher_enter(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, objectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_enter.call(this, functionId, objectId)
    end
    def exception_catcher_leave(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_catcher_leave.call(this)
    end
    def com_classic_v_table_created(this : ICorProfilerCallback11*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*, cSlots : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_created.call(this, wrappedClassId, implementedIID, pVTable, cSlots)
    end
    def com_classic_v_table_destroyed(this : ICorProfilerCallback11*, wrappedClassId : LibC::UIntPtrT, implementedIID : LibC::GUID*, pVTable : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_classic_v_table_destroyed.call(this, wrappedClassId, implementedIID, pVTable)
    end
    def exception_clr_catcher_found(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_found.call(this)
    end
    def exception_clr_catcher_execute(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exception_clr_catcher_execute.call(this)
    end
    def thread_name_changed(this : ICorProfilerCallback11*, threadId : LibC::UIntPtrT, cchName : UInt32, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_name_changed.call(this, threadId, cchName, name)
    end
    def garbage_collection_started(this : ICorProfilerCallback11*, cGenerations : Int32, generationCollected : Win32cr::Foundation::BOOL*, reason : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_REASON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_started.call(this, cGenerations, generationCollected, reason)
    end
    def surviving_references(this : ICorProfilerCallback11*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def garbage_collection_finished(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.garbage_collection_finished.call(this)
    end
    def finalizeable_object_queued(this : ICorProfilerCallback11*, finalizerFlags : UInt32, objectID : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalizeable_object_queued.call(this, finalizerFlags, objectID)
    end
    def root_references2(this : ICorProfilerCallback11*, cRootRefs : UInt32, rootRefIds : LibC::UIntPtrT*, rootKinds : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_KIND*, rootFlags : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_ROOT_FLAGS*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.root_references2.call(this, cRootRefs, rootRefIds, rootKinds, rootFlags, rootIds)
    end
    def handle_created(this : ICorProfilerCallback11*, handleId : LibC::UIntPtrT, initialObjectId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_created.call(this, handleId, initialObjectId)
    end
    def handle_destroyed(this : ICorProfilerCallback11*, handleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_destroyed.call(this, handleId)
    end
    def initialize_for_attach(this : ICorProfilerCallback11*, pCorProfilerInfoUnk : Void*, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_attach.call(this, pCorProfilerInfoUnk, pvClientData, cbClientData)
    end
    def profiler_attach_complete(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_attach_complete.call(this)
    end
    def profiler_detach_succeeded(this : ICorProfilerCallback11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.profiler_detach_succeeded.call(this)
    end
    def re_jit_compilation_started(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_started.call(this, functionId, rejitId, fIsSafeToBlock)
    end
    def get_re_jit_parameters(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT, methodId : UInt32, pFunctionControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jit_parameters.call(this, moduleId, methodId, pFunctionControl)
    end
    def re_jit_compilation_finished(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, rejitId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_compilation_finished.call(this, functionId, rejitId, hrStatus, fIsSafeToBlock)
    end
    def re_jit_error(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT, methodId : UInt32, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_jit_error.call(this, moduleId, methodId, functionId, hrStatus)
    end
    def moved_references2(this : ICorProfilerCallback11*, cMovedObjectIDRanges : UInt32, oldObjectIDRangeStart : LibC::UIntPtrT*, newObjectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.moved_references2.call(this, cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength)
    end
    def surviving_references2(this : ICorProfilerCallback11*, cSurvivingObjectIDRanges : UInt32, objectIDRangeStart : LibC::UIntPtrT*, cObjectIDRangeLength : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.surviving_references2.call(this, cSurvivingObjectIDRanges, objectIDRangeStart, cObjectIDRangeLength)
    end
    def conditional_weak_table_element_references(this : ICorProfilerCallback11*, cRootRefs : UInt32, keyRefIds : LibC::UIntPtrT*, valueRefIds : LibC::UIntPtrT*, rootIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.conditional_weak_table_element_references.call(this, cRootRefs, keyRefIds, valueRefIds, rootIds)
    end
    def get_assembly_references(this : ICorProfilerCallback11*, wszAssemblyPath : Win32cr::Foundation::PWSTR, pAsmRefProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_references.call(this, wszAssemblyPath, pAsmRefProvider)
    end
    def module_in_memory_symbols_updated(this : ICorProfilerCallback11*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.module_in_memory_symbols_updated.call(this, moduleId)
    end
    def dynamic_method_jit_compilation_started(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, fIsSafeToBlock : Win32cr::Foundation::BOOL, pILHeader : UInt8*, cbILHeader : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_started.call(this, functionId, fIsSafeToBlock, pILHeader, cbILHeader)
    end
    def dynamic_method_jit_compilation_finished(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT, hrStatus : Win32cr::Foundation::HRESULT, fIsSafeToBlock : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_jit_compilation_finished.call(this, functionId, hrStatus, fIsSafeToBlock)
    end
    def dynamic_method_unloaded(this : ICorProfilerCallback11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dynamic_method_unloaded.call(this, functionId)
    end
    def event_pipe_event_delivered(this : ICorProfilerCallback11*, provider : LibC::UIntPtrT, eventId : UInt32, eventVersion : UInt32, cbMetadataBlob : UInt32, metadataBlob : UInt8*, cbEventData : UInt32, eventData : UInt8*, pActivityId : LibC::GUID*, pRelatedActivityId : LibC::GUID*, eventThread : LibC::UIntPtrT, numStackFrames : UInt32, stackFrames : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_event_delivered.call(this, provider, eventId, eventVersion, cbMetadataBlob, metadataBlob, cbEventData, eventData, pActivityId, pRelatedActivityId, eventThread, numStackFrames, stackFrames)
    end
    def event_pipe_provider_created(this : ICorProfilerCallback11*, provider : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_provider_created.call(this, provider)
    end
    def load_as_notification_only(this : ICorProfilerCallback11*, pbNotificationOnly : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_as_notification_only.call(this, pbNotificationOnly)
    end

  end

  @[Extern]

  record ICorProfilerInfoVtable,
    query_interface : Proc(ICorProfilerInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo*, UInt32),
    release : Proc(ICorProfilerInfo*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo, lpVtbl : ICorProfilerInfoVtable* do
    GUID = LibC::GUID.new(0x28b5557d_u32, 0x3f3f_u16, 0x48b4_u16, StaticArray[0x90_u8, 0xb2_u8, 0x5f_u8, 0x9e_u8, 0xea_u8, 0x2f_u8, 0x6c_u8, 0x48_u8])
    def query_interface(this : ICorProfilerInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end

  end

  @[Extern]

  record ICorProfilerInfo2Vtable,
    query_interface : Proc(ICorProfilerInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo2*, UInt32),
    release : Proc(ICorProfilerInfo2*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo2*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo2*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo2*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo2*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo2*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo2*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo2*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo2*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo2*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo2*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo2, lpVtbl : ICorProfilerInfo2Vtable* do
    GUID = LibC::GUID.new(0xcc0935cd_u32, 0xa518_u16, 0x487d_u16, StaticArray[0xb0_u8, 0xbb_u8, 0xa9_u8, 0x32_u8, 0x14_u8, 0xe6_u8, 0x54_u8, 0x78_u8])
    def query_interface(this : ICorProfilerInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo2*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo2*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo2*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo2*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo2*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo2*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo2*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo2*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo2*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo2*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo2*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo2*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo2*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo2*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo2*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo2*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo2*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo2*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo2*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo2*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo2*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo2*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo2*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo2*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo2*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo2*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo2*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo2*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo2*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo2*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo2*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo2*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo2*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo2*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo2*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo2*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo2*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo2*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo2*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end

  end

  @[Extern]

  record ICorProfilerInfo3Vtable,
    query_interface : Proc(ICorProfilerInfo3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo3*, UInt32),
    release : Proc(ICorProfilerInfo3*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo3*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo3*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo3*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo3*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo3*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo3*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo3*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo3*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo3*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo3*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo3*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo3*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo3*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo3*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo3*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo3*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo3, lpVtbl : ICorProfilerInfo3Vtable* do
    GUID = LibC::GUID.new(0xb555ed4f_u32, 0x452a_u16, 0x4e54_u16, StaticArray[0x8b_u8, 0x39_u8, 0xb5_u8, 0x36_u8, 0xb_u8, 0xad_u8, 0x32_u8, 0xa0_u8])
    def query_interface(this : ICorProfilerInfo3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo3*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo3*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo3*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo3*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo3*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo3*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo3*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo3*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo3*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo3*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo3*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo3*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo3*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo3*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo3*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo3*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo3*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo3*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo3*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo3*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo3*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo3*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo3*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo3*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo3*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo3*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo3*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo3*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo3*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo3*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo3*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo3*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo3*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo3*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo3*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo3*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo3*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo3*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo3*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo3*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo3*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo3*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end

  end

  @[Extern]

  record ICorProfilerObjectEnumVtable,
    query_interface : Proc(ICorProfilerObjectEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerObjectEnum*, UInt32),
    release : Proc(ICorProfilerObjectEnum*, UInt32),
    skip : Proc(ICorProfilerObjectEnum*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(ICorProfilerObjectEnum*, Win32cr::Foundation::HRESULT),
    clone : Proc(ICorProfilerObjectEnum*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ICorProfilerObjectEnum*, UInt32*, Win32cr::Foundation::HRESULT),
    next__ : Proc(ICorProfilerObjectEnum*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerObjectEnum, lpVtbl : ICorProfilerObjectEnumVtable* do
    GUID = LibC::GUID.new(0x2c6269bd_u32, 0x2d13_u16, 0x4321_u16, StaticArray[0xae_u8, 0x12_u8, 0x66_u8, 0x86_u8, 0x36_u8, 0x5f_u8, 0xd6_u8, 0xaf_u8])
    def query_interface(this : ICorProfilerObjectEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerObjectEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerObjectEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def skip(this : ICorProfilerObjectEnum*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : ICorProfilerObjectEnum*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : ICorProfilerObjectEnum*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def get_count(this : ICorProfilerObjectEnum*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcelt)
    end
    def next__(this : ICorProfilerObjectEnum*, celt : UInt32, objects : LibC::UIntPtrT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, objects, pceltFetched)
    end

  end

  @[Extern]

  record ICorProfilerFunctionEnumVtable,
    query_interface : Proc(ICorProfilerFunctionEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerFunctionEnum*, UInt32),
    release : Proc(ICorProfilerFunctionEnum*, UInt32),
    skip : Proc(ICorProfilerFunctionEnum*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(ICorProfilerFunctionEnum*, Win32cr::Foundation::HRESULT),
    clone : Proc(ICorProfilerFunctionEnum*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ICorProfilerFunctionEnum*, UInt32*, Win32cr::Foundation::HRESULT),
    next__ : Proc(ICorProfilerFunctionEnum*, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerFunctionEnum, lpVtbl : ICorProfilerFunctionEnumVtable* do
    GUID = LibC::GUID.new(0xff71301a_u32, 0xb994_u16, 0x429d_u16, StaticArray[0xa1_u8, 0xb_u8, 0xb3_u8, 0x45_u8, 0xa6_u8, 0x52_u8, 0x80_u8, 0xef_u8])
    def query_interface(this : ICorProfilerFunctionEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerFunctionEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerFunctionEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def skip(this : ICorProfilerFunctionEnum*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : ICorProfilerFunctionEnum*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : ICorProfilerFunctionEnum*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def get_count(this : ICorProfilerFunctionEnum*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcelt)
    end
    def next__(this : ICorProfilerFunctionEnum*, celt : UInt32, ids : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ids, pceltFetched)
    end

  end

  @[Extern]

  record ICorProfilerModuleEnumVtable,
    query_interface : Proc(ICorProfilerModuleEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerModuleEnum*, UInt32),
    release : Proc(ICorProfilerModuleEnum*, UInt32),
    skip : Proc(ICorProfilerModuleEnum*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(ICorProfilerModuleEnum*, Win32cr::Foundation::HRESULT),
    clone : Proc(ICorProfilerModuleEnum*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ICorProfilerModuleEnum*, UInt32*, Win32cr::Foundation::HRESULT),
    next__ : Proc(ICorProfilerModuleEnum*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerModuleEnum, lpVtbl : ICorProfilerModuleEnumVtable* do
    GUID = LibC::GUID.new(0xb0266d75_u32, 0x2081_u16, 0x4493_u16, StaticArray[0xaf_u8, 0x7f_u8, 0x2_u8, 0x8b_u8, 0xa3_u8, 0x4d_u8, 0xb8_u8, 0x91_u8])
    def query_interface(this : ICorProfilerModuleEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerModuleEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerModuleEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def skip(this : ICorProfilerModuleEnum*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : ICorProfilerModuleEnum*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : ICorProfilerModuleEnum*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def get_count(this : ICorProfilerModuleEnum*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcelt)
    end
    def next__(this : ICorProfilerModuleEnum*, celt : UInt32, ids : LibC::UIntPtrT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ids, pceltFetched)
    end

  end

  @[Extern]

  record IMethodMallocVtable,
    query_interface : Proc(IMethodMalloc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMethodMalloc*, UInt32),
    release : Proc(IMethodMalloc*, UInt32),
    alloc : Proc(IMethodMalloc*, UInt32, Void*)


  @[Extern]
  record IMethodMalloc, lpVtbl : IMethodMallocVtable* do
    GUID = LibC::GUID.new(0xa0efb28b_u32, 0x6ee2_u16, 0x4d7b_u16, StaticArray[0xb9_u8, 0x83_u8, 0xa7_u8, 0x5e_u8, 0xf7_u8, 0xbe_u8, 0xed_u8, 0xb8_u8])
    def query_interface(this : IMethodMalloc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMethodMalloc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMethodMalloc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alloc(this : IMethodMalloc*, cb : UInt32) : Void*
      @lpVtbl.try &.value.alloc.call(this, cb)
    end

  end

  @[Extern]

  record ICorProfilerFunctionControlVtable,
    query_interface : Proc(ICorProfilerFunctionControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerFunctionControl*, UInt32),
    release : Proc(ICorProfilerFunctionControl*, UInt32),
    set_codegen_flags : Proc(ICorProfilerFunctionControl*, UInt32, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerFunctionControl*, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerFunctionControl*, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerFunctionControl, lpVtbl : ICorProfilerFunctionControlVtable* do
    GUID = LibC::GUID.new(0xf0963021_u32, 0xe1ea_u16, 0x4732_u16, StaticArray[0x85_u8, 0x81_u8, 0xe0_u8, 0x1b_u8, 0xb_u8, 0xd3_u8, 0xc0_u8, 0xc6_u8])
    def query_interface(this : ICorProfilerFunctionControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerFunctionControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerFunctionControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_codegen_flags(this : ICorProfilerFunctionControl*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_codegen_flags.call(this, flags)
    end
    def set_il_function_body(this : ICorProfilerFunctionControl*, cbNewILMethodHeader : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, cbNewILMethodHeader, pbNewILMethodHeader)
    end
    def set_il_instrumented_code_map(this : ICorProfilerFunctionControl*, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, cILMapEntries, rgILMapEntries)
    end

  end

  @[Extern]

  record ICorProfilerInfo4Vtable,
    query_interface : Proc(ICorProfilerInfo4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo4*, UInt32),
    release : Proc(ICorProfilerInfo4*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo4*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo4*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo4*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo4*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo4*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo4*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo4*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo4*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo4*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo4*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo4*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo4*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo4*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo4*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo4*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo4*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo4*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo4*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo4*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo4*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo4*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo4*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo4*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo4, lpVtbl : ICorProfilerInfo4Vtable* do
    GUID = LibC::GUID.new(0xd8fdcaa_u32, 0x6257_u16, 0x47bf_u16, StaticArray[0xb1_u8, 0xbf_u8, 0x94_u8, 0xda_u8, 0xc8_u8, 0x84_u8, 0x66_u8, 0xee_u8])
    def query_interface(this : ICorProfilerInfo4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo4*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo4*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo4*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo4*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo4*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo4*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo4*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo4*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo4*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo4*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo4*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo4*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo4*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo4*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo4*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo4*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo4*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo4*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo4*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo4*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo4*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo4*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo4*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo4*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo4*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo4*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo4*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo4*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo4*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo4*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo4*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo4*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo4*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo4*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo4*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo4*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo4*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo4*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo4*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo4*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo4*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo4*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo4*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo4*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo4*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo4*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo4*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo4*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo4*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end

  end

  @[Extern]

  record ICorProfilerInfo5Vtable,
    query_interface : Proc(ICorProfilerInfo5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo5*, UInt32),
    release : Proc(ICorProfilerInfo5*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo5*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo5*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo5*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo5*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo5*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo5*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo5*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo5*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo5*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo5*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo5*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo5*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo5*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo5*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo5*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo5*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo5*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo5*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo5*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo5*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo5*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo5*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo5*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo5*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo5*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo5*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo5, lpVtbl : ICorProfilerInfo5Vtable* do
    GUID = LibC::GUID.new(0x7602928_u32, 0xce38_u16, 0x4b83_u16, StaticArray[0x81_u8, 0xe7_u8, 0x74_u8, 0xad_u8, 0xaf_u8, 0x78_u8, 0x12_u8, 0x14_u8])
    def query_interface(this : ICorProfilerInfo5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo5*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo5*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo5*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo5*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo5*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo5*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo5*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo5*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo5*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo5*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo5*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo5*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo5*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo5*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo5*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo5*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo5*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo5*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo5*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo5*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo5*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo5*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo5*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo5*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo5*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo5*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo5*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo5*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo5*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo5*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo5*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo5*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo5*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo5*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo5*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo5*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo5*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo5*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo5*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo5*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo5*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo5*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo5*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo5*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo5*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo5*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo5*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo5*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo5*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo5*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo5*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end

  end

  @[Extern]

  record ICorProfilerInfo6Vtable,
    query_interface : Proc(ICorProfilerInfo6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo6*, UInt32),
    release : Proc(ICorProfilerInfo6*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo6*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo6*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo6*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo6*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo6*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo6*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo6*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo6*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo6*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo6*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo6*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo6*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo6*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo6*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo6*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo6*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo6*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo6*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo6*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo6*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo6*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo6*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo6*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo6*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo6*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo6*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo6, lpVtbl : ICorProfilerInfo6Vtable* do
    GUID = LibC::GUID.new(0xf30a070d_u32, 0xbffb_u16, 0x46a7_u16, StaticArray[0xb1_u8, 0xd8_u8, 0x87_u8, 0x81_u8, 0xef_u8, 0x7b_u8, 0x69_u8, 0x8a_u8])
    def query_interface(this : ICorProfilerInfo6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo6*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo6*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo6*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo6*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo6*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo6*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo6*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo6*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo6*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo6*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo6*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo6*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo6*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo6*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo6*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo6*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo6*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo6*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo6*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo6*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo6*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo6*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo6*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo6*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo6*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo6*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo6*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo6*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo6*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo6*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo6*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo6*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo6*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo6*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo6*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo6*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo6*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo6*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo6*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo6*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo6*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo6*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo6*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo6*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo6*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo6*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo6*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo6*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo6*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo6*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo6*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo6*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end

  end

  @[Extern]

  record ICorProfilerInfo7Vtable,
    query_interface : Proc(ICorProfilerInfo7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo7*, UInt32),
    release : Proc(ICorProfilerInfo7*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo7*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo7*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo7*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo7*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo7*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo7*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo7*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo7*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo7*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo7*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo7*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo7*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo7*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo7*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo7*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo7*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo7*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo7*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo7*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo7*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo7*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo7*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo7*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo7*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo7*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo7*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo7, lpVtbl : ICorProfilerInfo7Vtable* do
    GUID = LibC::GUID.new(0x9aeecc0d_u32, 0x63e0_u16, 0x4187_u16, StaticArray[0x8c_u8, 0x0_u8, 0xe3_u8, 0x12_u8, 0xf5_u8, 0x3_u8, 0xf6_u8, 0x63_u8])
    def query_interface(this : ICorProfilerInfo7*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo7*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo7*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo7*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo7*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo7*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo7*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo7*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo7*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo7*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo7*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo7*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo7*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo7*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo7*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo7*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo7*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo7*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo7*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo7*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo7*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo7*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo7*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo7*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo7*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo7*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo7*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo7*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo7*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo7*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo7*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo7*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo7*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo7*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo7*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo7*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo7*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo7*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo7*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo7*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo7*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo7*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo7*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo7*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo7*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo7*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo7*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo7*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo7*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo7*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo7*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo7*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo7*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo7*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo7*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end

  end

  @[Extern]

  record ICorProfilerInfo8Vtable,
    query_interface : Proc(ICorProfilerInfo8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo8*, UInt32),
    release : Proc(ICorProfilerInfo8*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo8*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo8*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo8*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo8*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo8*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo8*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo8*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo8*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo8*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo8*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo8*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo8*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo8*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo8*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo8*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo8*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo8*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo8*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo8*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo8*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo8*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo8*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo8*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo8, lpVtbl : ICorProfilerInfo8Vtable* do
    GUID = LibC::GUID.new(0xc5ac80a6_u32, 0x782e_u16, 0x4716_u16, StaticArray[0x80_u8, 0x44_u8, 0x39_u8, 0x59_u8, 0x8c_u8, 0x60_u8, 0xcf_u8, 0xbf_u8])
    def query_interface(this : ICorProfilerInfo8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo8*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo8*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo8*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo8*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo8*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo8*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo8*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo8*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo8*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo8*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo8*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo8*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo8*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo8*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo8*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo8*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo8*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo8*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo8*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo8*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo8*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo8*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo8*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo8*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo8*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo8*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo8*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo8*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo8*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo8*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo8*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo8*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo8*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo8*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo8*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo8*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo8*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo8*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo8*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo8*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo8*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo8*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo8*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo8*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo8*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo8*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo8*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo8*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo8*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo8*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo8*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo8*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo8*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end

  end

  @[Extern]

  record ICorProfilerInfo9Vtable,
    query_interface : Proc(ICorProfilerInfo9*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo9*, UInt32),
    release : Proc(ICorProfilerInfo9*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo9*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo9*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo9*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo9*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo9*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo9*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo9*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo9*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo9*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo9*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo9*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo9*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo9*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo9*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo9*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo9*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo9*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo9*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo9*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo9*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo9*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo9*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo9*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo9*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo9*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo9*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_native_code_start_addresses : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping3 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    get_code_info4 : Proc(ICorProfilerInfo9*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo9, lpVtbl : ICorProfilerInfo9Vtable* do
    GUID = LibC::GUID.new(0x8170db_u32, 0xf8cc_u16, 0x4796_u16, StaticArray[0x9a_u8, 0x51_u8, 0xdc_u8, 0x8a_u8, 0xa0_u8, 0xb4_u8, 0x70_u8, 0x12_u8])
    def query_interface(this : ICorProfilerInfo9*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo9*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo9*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo9*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo9*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo9*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo9*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo9*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo9*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo9*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo9*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo9*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo9*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo9*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo9*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo9*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo9*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo9*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo9*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo9*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo9*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo9*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo9*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo9*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo9*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo9*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo9*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo9*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo9*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo9*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo9*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo9*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo9*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo9*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo9*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo9*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo9*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo9*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo9*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo9*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo9*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo9*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo9*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo9*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo9*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo9*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo9*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo9*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo9*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo9*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo9*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo9*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo9*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo9*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo9*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo9*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end
    def get_native_code_start_addresses(this : ICorProfilerInfo9*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeStartAddresses : UInt32, pcCodeStartAddresses : UInt32*, codeStartAddresses : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_code_start_addresses.call(this, functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses)
    end
    def get_il_to_native_mapping3(this : ICorProfilerInfo9*, pNativeCodeStartAddress : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping3.call(this, pNativeCodeStartAddress, cMap, pcMap, map)
    end
    def get_code_info4(this : ICorProfilerInfo9*, pNativeCodeStartAddress : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info4.call(this, pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos)
    end

  end

  @[Extern]

  record ICorProfilerInfo10Vtable,
    query_interface : Proc(ICorProfilerInfo10*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo10*, UInt32),
    release : Proc(ICorProfilerInfo10*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo10*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo10*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo10*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo10*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo10*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo10*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo10*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo10*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo10*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo10*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo10*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo10*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo10*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo10*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo10*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo10*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo10*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo10*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo10*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo10*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo10*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo10*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo10*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo10*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo10*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo10*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_native_code_start_addresses : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping3 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    get_code_info4 : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    enumerate_object_references : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, Void*, Win32cr::Foundation::HRESULT),
    is_frozen_object : Proc(ICorProfilerInfo10*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_loh_object_size_threshold : Proc(ICorProfilerInfo10*, UInt32*, Win32cr::Foundation::HRESULT),
    request_re_jit_with_inliners : Proc(ICorProfilerInfo10*, UInt32, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_runtime : Proc(ICorProfilerInfo10*, Win32cr::Foundation::HRESULT),
    resume_runtime : Proc(ICorProfilerInfo10*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo10, lpVtbl : ICorProfilerInfo10Vtable* do
    GUID = LibC::GUID.new(0x2f1b5152_u32, 0xc869_u16, 0x40c9_u16, StaticArray[0xaa_u8, 0x5f_u8, 0x3a_u8, 0xbe_u8, 0x2_u8, 0x6b_u8, 0xd7_u8, 0x20_u8])
    def query_interface(this : ICorProfilerInfo10*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo10*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo10*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo10*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo10*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo10*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo10*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo10*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo10*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo10*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo10*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo10*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo10*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo10*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo10*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo10*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo10*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo10*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo10*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo10*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo10*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo10*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo10*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo10*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo10*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo10*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo10*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo10*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo10*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo10*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo10*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo10*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo10*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo10*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo10*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo10*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo10*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo10*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo10*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo10*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo10*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo10*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo10*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo10*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo10*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo10*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo10*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo10*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo10*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo10*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo10*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end
    def get_native_code_start_addresses(this : ICorProfilerInfo10*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeStartAddresses : UInt32, pcCodeStartAddresses : UInt32*, codeStartAddresses : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_code_start_addresses.call(this, functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses)
    end
    def get_il_to_native_mapping3(this : ICorProfilerInfo10*, pNativeCodeStartAddress : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping3.call(this, pNativeCodeStartAddress, cMap, pcMap, map)
    end
    def get_code_info4(this : ICorProfilerInfo10*, pNativeCodeStartAddress : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info4.call(this, pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def enumerate_object_references(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_object_references.call(this, objectId, callback, clientData)
    end
    def is_frozen_object(this : ICorProfilerInfo10*, objectId : LibC::UIntPtrT, pbFrozen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_frozen_object.call(this, objectId, pbFrozen)
    end
    def get_loh_object_size_threshold(this : ICorProfilerInfo10*, pThreshold : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_loh_object_size_threshold.call(this, pThreshold)
    end
    def request_re_jit_with_inliners(this : ICorProfilerInfo10*, dwRejitFlags : UInt32, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit_with_inliners.call(this, dwRejitFlags, cFunctions, moduleIds, methodIds)
    end
    def suspend_runtime(this : ICorProfilerInfo10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_runtime.call(this)
    end
    def resume_runtime(this : ICorProfilerInfo10*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_runtime.call(this)
    end

  end

  @[Extern]

  record ICorProfilerInfo11Vtable,
    query_interface : Proc(ICorProfilerInfo11*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo11*, UInt32),
    release : Proc(ICorProfilerInfo11*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo11*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo11*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo11*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo11*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo11*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo11*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo11*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo11*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo11*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo11*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo11*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo11*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo11*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo11*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo11*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo11*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo11*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo11*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo11*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo11*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo11*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo11*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo11*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo11*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo11*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo11*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_native_code_start_addresses : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping3 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    get_code_info4 : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    enumerate_object_references : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, Void*, Win32cr::Foundation::HRESULT),
    is_frozen_object : Proc(ICorProfilerInfo11*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_loh_object_size_threshold : Proc(ICorProfilerInfo11*, UInt32*, Win32cr::Foundation::HRESULT),
    request_re_jit_with_inliners : Proc(ICorProfilerInfo11*, UInt32, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_runtime : Proc(ICorProfilerInfo11*, Win32cr::Foundation::HRESULT),
    resume_runtime : Proc(ICorProfilerInfo11*, Win32cr::Foundation::HRESULT),
    get_environment_variable_a : Proc(ICorProfilerInfo11*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_environment_variable : Proc(ICorProfilerInfo11*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo11, lpVtbl : ICorProfilerInfo11Vtable* do
    GUID = LibC::GUID.new(0x6398876_u32, 0x8987_u16, 0x4154_u16, StaticArray[0xb6_u8, 0x21_u8, 0x40_u8, 0xa0_u8, 0xd_u8, 0x6e_u8, 0x4d_u8, 0x4_u8])
    def query_interface(this : ICorProfilerInfo11*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo11*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo11*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo11*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo11*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo11*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo11*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo11*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo11*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo11*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo11*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo11*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo11*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo11*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo11*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo11*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo11*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo11*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo11*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo11*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo11*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo11*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo11*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo11*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo11*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo11*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo11*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo11*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo11*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo11*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo11*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo11*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo11*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo11*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo11*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo11*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo11*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo11*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo11*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo11*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo11*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo11*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo11*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo11*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo11*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo11*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo11*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo11*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo11*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo11*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo11*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end
    def get_native_code_start_addresses(this : ICorProfilerInfo11*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeStartAddresses : UInt32, pcCodeStartAddresses : UInt32*, codeStartAddresses : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_code_start_addresses.call(this, functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses)
    end
    def get_il_to_native_mapping3(this : ICorProfilerInfo11*, pNativeCodeStartAddress : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping3.call(this, pNativeCodeStartAddress, cMap, pcMap, map)
    end
    def get_code_info4(this : ICorProfilerInfo11*, pNativeCodeStartAddress : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info4.call(this, pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def enumerate_object_references(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_object_references.call(this, objectId, callback, clientData)
    end
    def is_frozen_object(this : ICorProfilerInfo11*, objectId : LibC::UIntPtrT, pbFrozen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_frozen_object.call(this, objectId, pbFrozen)
    end
    def get_loh_object_size_threshold(this : ICorProfilerInfo11*, pThreshold : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_loh_object_size_threshold.call(this, pThreshold)
    end
    def request_re_jit_with_inliners(this : ICorProfilerInfo11*, dwRejitFlags : UInt32, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit_with_inliners.call(this, dwRejitFlags, cFunctions, moduleIds, methodIds)
    end
    def suspend_runtime(this : ICorProfilerInfo11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_runtime.call(this)
    end
    def resume_runtime(this : ICorProfilerInfo11*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_runtime.call(this)
    end
    def get_environment_variable_a(this : ICorProfilerInfo11*, szName : Win32cr::Foundation::PWSTR, cchValue : UInt32, pcchValue : UInt32*, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_environment_variable_a.call(this, szName, cchValue, pcchValue, szValue)
    end
    def set_environment_variable(this : ICorProfilerInfo11*, szName : Win32cr::Foundation::PWSTR, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment_variable.call(this, szName, szValue)
    end

  end

  @[Extern]

  record ICorProfilerInfo12Vtable,
    query_interface : Proc(ICorProfilerInfo12*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo12*, UInt32),
    release : Proc(ICorProfilerInfo12*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo12*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo12*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo12*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo12*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo12*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo12*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo12*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo12*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo12*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo12*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo12*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo12*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo12*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo12*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo12*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo12*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo12*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo12*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo12*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo12*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo12*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo12*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo12*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo12*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo12*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo12*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_native_code_start_addresses : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping3 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    get_code_info4 : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    enumerate_object_references : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, Void*, Win32cr::Foundation::HRESULT),
    is_frozen_object : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_loh_object_size_threshold : Proc(ICorProfilerInfo12*, UInt32*, Win32cr::Foundation::HRESULT),
    request_re_jit_with_inliners : Proc(ICorProfilerInfo12*, UInt32, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_runtime : Proc(ICorProfilerInfo12*, Win32cr::Foundation::HRESULT),
    resume_runtime : Proc(ICorProfilerInfo12*, Win32cr::Foundation::HRESULT),
    get_environment_variable_a : Proc(ICorProfilerInfo12*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_environment_variable : Proc(ICorProfilerInfo12*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    event_pipe_start_session : Proc(ICorProfilerInfo12*, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG*, Win32cr::Foundation::BOOL, UInt64*, Win32cr::Foundation::HRESULT),
    event_pipe_add_provider_to_session : Proc(ICorProfilerInfo12*, UInt64, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG, Win32cr::Foundation::HRESULT),
    event_pipe_stop_session : Proc(ICorProfilerInfo12*, UInt64, Win32cr::Foundation::HRESULT),
    event_pipe_create_provider : Proc(ICorProfilerInfo12*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_get_provider_info : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    event_pipe_define_event : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, Win32cr::Foundation::PWSTR, UInt32, UInt64, UInt32, UInt32, UInt8, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PARAM_DESC*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_write_event : Proc(ICorProfilerInfo12*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENT_DATA*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo12, lpVtbl : ICorProfilerInfo12Vtable* do
    GUID = LibC::GUID.new(0x27b24ccd_u32, 0x1cb1_u16, 0x47c5_u16, StaticArray[0x96_u8, 0xee_u8, 0x98_u8, 0x19_u8, 0xd_u8, 0xc3_u8, 0x9_u8, 0x59_u8])
    def query_interface(this : ICorProfilerInfo12*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo12*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo12*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo12*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo12*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo12*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo12*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo12*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo12*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo12*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo12*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo12*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo12*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo12*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo12*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo12*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo12*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo12*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo12*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo12*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo12*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo12*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo12*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo12*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo12*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo12*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo12*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo12*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo12*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo12*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo12*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo12*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo12*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo12*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo12*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo12*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo12*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo12*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo12*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo12*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo12*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo12*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo12*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo12*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo12*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo12*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo12*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo12*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo12*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo12*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo12*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo12*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo12*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end
    def get_native_code_start_addresses(this : ICorProfilerInfo12*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeStartAddresses : UInt32, pcCodeStartAddresses : UInt32*, codeStartAddresses : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_code_start_addresses.call(this, functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses)
    end
    def get_il_to_native_mapping3(this : ICorProfilerInfo12*, pNativeCodeStartAddress : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping3.call(this, pNativeCodeStartAddress, cMap, pcMap, map)
    end
    def get_code_info4(this : ICorProfilerInfo12*, pNativeCodeStartAddress : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info4.call(this, pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def enumerate_object_references(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_object_references.call(this, objectId, callback, clientData)
    end
    def is_frozen_object(this : ICorProfilerInfo12*, objectId : LibC::UIntPtrT, pbFrozen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_frozen_object.call(this, objectId, pbFrozen)
    end
    def get_loh_object_size_threshold(this : ICorProfilerInfo12*, pThreshold : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_loh_object_size_threshold.call(this, pThreshold)
    end
    def request_re_jit_with_inliners(this : ICorProfilerInfo12*, dwRejitFlags : UInt32, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit_with_inliners.call(this, dwRejitFlags, cFunctions, moduleIds, methodIds)
    end
    def suspend_runtime(this : ICorProfilerInfo12*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_runtime.call(this)
    end
    def resume_runtime(this : ICorProfilerInfo12*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_runtime.call(this)
    end
    def get_environment_variable_a(this : ICorProfilerInfo12*, szName : Win32cr::Foundation::PWSTR, cchValue : UInt32, pcchValue : UInt32*, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_environment_variable_a.call(this, szName, cchValue, pcchValue, szValue)
    end
    def set_environment_variable(this : ICorProfilerInfo12*, szName : Win32cr::Foundation::PWSTR, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment_variable.call(this, szName, szValue)
    end
    def event_pipe_start_session(this : ICorProfilerInfo12*, cProviderConfigs : UInt32, pProviderConfigs : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG*, requestRundown : Win32cr::Foundation::BOOL, pSession : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_start_session.call(this, cProviderConfigs, pProviderConfigs, requestRundown, pSession)
    end
    def event_pipe_add_provider_to_session(this : ICorProfilerInfo12*, session : UInt64, providerConfig : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_add_provider_to_session.call(this, session, providerConfig)
    end
    def event_pipe_stop_session(this : ICorProfilerInfo12*, session : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_stop_session.call(this, session)
    end
    def event_pipe_create_provider(this : ICorProfilerInfo12*, providerName : Win32cr::Foundation::PWSTR, pProvider : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_create_provider.call(this, providerName, pProvider)
    end
    def event_pipe_get_provider_info(this : ICorProfilerInfo12*, provider : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, providerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_get_provider_info.call(this, provider, cchName, pcchName, providerName)
    end
    def event_pipe_define_event(this : ICorProfilerInfo12*, provider : LibC::UIntPtrT, eventName : Win32cr::Foundation::PWSTR, eventID : UInt32, keywords : UInt64, eventVersion : UInt32, level : UInt32, opcode : UInt8, needStack : Win32cr::Foundation::BOOL, cParamDescs : UInt32, pParamDescs : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PARAM_DESC*, pEvent : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_define_event.call(this, provider, eventName, eventID, keywords, eventVersion, level, opcode, needStack, cParamDescs, pParamDescs, pEvent)
    end
    def event_pipe_write_event(this : ICorProfilerInfo12*, event : LibC::UIntPtrT, cData : UInt32, data : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENT_DATA*, pActivityId : LibC::GUID*, pRelatedActivityId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_write_event.call(this, event, cData, data, pActivityId, pRelatedActivityId)
    end

  end

  @[Extern]

  record ICorProfilerInfo13Vtable,
    query_interface : Proc(ICorProfilerInfo13*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo13*, UInt32),
    release : Proc(ICorProfilerInfo13*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo13*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo13*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo13*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo13*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo13*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo13*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo13*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo13*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo13*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo13*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo13*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo13*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo13*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo13*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo13*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo13*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo13*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo13*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo13*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo13*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_native_code_start_addresses : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping3 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    get_code_info4 : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    enumerate_object_references : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, Void*, Win32cr::Foundation::HRESULT),
    is_frozen_object : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_loh_object_size_threshold : Proc(ICorProfilerInfo13*, UInt32*, Win32cr::Foundation::HRESULT),
    request_re_jit_with_inliners : Proc(ICorProfilerInfo13*, UInt32, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_runtime : Proc(ICorProfilerInfo13*, Win32cr::Foundation::HRESULT),
    resume_runtime : Proc(ICorProfilerInfo13*, Win32cr::Foundation::HRESULT),
    get_environment_variable_a : Proc(ICorProfilerInfo13*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_environment_variable : Proc(ICorProfilerInfo13*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    event_pipe_start_session : Proc(ICorProfilerInfo13*, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG*, Win32cr::Foundation::BOOL, UInt64*, Win32cr::Foundation::HRESULT),
    event_pipe_add_provider_to_session : Proc(ICorProfilerInfo13*, UInt64, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG, Win32cr::Foundation::HRESULT),
    event_pipe_stop_session : Proc(ICorProfilerInfo13*, UInt64, Win32cr::Foundation::HRESULT),
    event_pipe_create_provider : Proc(ICorProfilerInfo13*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_get_provider_info : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    event_pipe_define_event : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::Foundation::PWSTR, UInt32, UInt64, UInt32, UInt32, UInt8, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PARAM_DESC*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_write_event : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENT_DATA*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    create_handle : Proc(ICorProfilerInfo13*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_HANDLE_TYPE, Void***, Win32cr::Foundation::HRESULT),
    destroy_handle : Proc(ICorProfilerInfo13*, Void**, Win32cr::Foundation::HRESULT),
    get_object_id_from_handle : Proc(ICorProfilerInfo13*, Void**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo13, lpVtbl : ICorProfilerInfo13Vtable* do
    GUID = LibC::GUID.new(0x6e6c7ee2_u32, 0x701_u16, 0x4ec2_u16, StaticArray[0x9d_u8, 0x29_u8, 0x2e_u8, 0x87_u8, 0x33_u8, 0xb6_u8, 0x69_u8, 0x34_u8])
    def query_interface(this : ICorProfilerInfo13*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo13*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo13*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo13*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo13*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo13*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo13*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo13*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo13*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo13*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo13*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo13*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo13*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo13*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo13*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo13*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo13*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo13*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo13*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo13*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo13*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo13*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo13*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo13*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo13*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo13*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo13*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo13*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo13*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo13*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo13*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo13*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo13*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo13*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo13*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo13*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo13*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo13*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo13*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo13*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo13*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo13*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo13*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo13*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo13*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo13*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo13*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo13*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo13*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo13*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo13*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo13*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo13*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end
    def get_native_code_start_addresses(this : ICorProfilerInfo13*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeStartAddresses : UInt32, pcCodeStartAddresses : UInt32*, codeStartAddresses : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_code_start_addresses.call(this, functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses)
    end
    def get_il_to_native_mapping3(this : ICorProfilerInfo13*, pNativeCodeStartAddress : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping3.call(this, pNativeCodeStartAddress, cMap, pcMap, map)
    end
    def get_code_info4(this : ICorProfilerInfo13*, pNativeCodeStartAddress : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info4.call(this, pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def enumerate_object_references(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_object_references.call(this, objectId, callback, clientData)
    end
    def is_frozen_object(this : ICorProfilerInfo13*, objectId : LibC::UIntPtrT, pbFrozen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_frozen_object.call(this, objectId, pbFrozen)
    end
    def get_loh_object_size_threshold(this : ICorProfilerInfo13*, pThreshold : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_loh_object_size_threshold.call(this, pThreshold)
    end
    def request_re_jit_with_inliners(this : ICorProfilerInfo13*, dwRejitFlags : UInt32, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit_with_inliners.call(this, dwRejitFlags, cFunctions, moduleIds, methodIds)
    end
    def suspend_runtime(this : ICorProfilerInfo13*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_runtime.call(this)
    end
    def resume_runtime(this : ICorProfilerInfo13*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_runtime.call(this)
    end
    def get_environment_variable_a(this : ICorProfilerInfo13*, szName : Win32cr::Foundation::PWSTR, cchValue : UInt32, pcchValue : UInt32*, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_environment_variable_a.call(this, szName, cchValue, pcchValue, szValue)
    end
    def set_environment_variable(this : ICorProfilerInfo13*, szName : Win32cr::Foundation::PWSTR, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment_variable.call(this, szName, szValue)
    end
    def event_pipe_start_session(this : ICorProfilerInfo13*, cProviderConfigs : UInt32, pProviderConfigs : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG*, requestRundown : Win32cr::Foundation::BOOL, pSession : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_start_session.call(this, cProviderConfigs, pProviderConfigs, requestRundown, pSession)
    end
    def event_pipe_add_provider_to_session(this : ICorProfilerInfo13*, session : UInt64, providerConfig : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_add_provider_to_session.call(this, session, providerConfig)
    end
    def event_pipe_stop_session(this : ICorProfilerInfo13*, session : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_stop_session.call(this, session)
    end
    def event_pipe_create_provider(this : ICorProfilerInfo13*, providerName : Win32cr::Foundation::PWSTR, pProvider : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_create_provider.call(this, providerName, pProvider)
    end
    def event_pipe_get_provider_info(this : ICorProfilerInfo13*, provider : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, providerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_get_provider_info.call(this, provider, cchName, pcchName, providerName)
    end
    def event_pipe_define_event(this : ICorProfilerInfo13*, provider : LibC::UIntPtrT, eventName : Win32cr::Foundation::PWSTR, eventID : UInt32, keywords : UInt64, eventVersion : UInt32, level : UInt32, opcode : UInt8, needStack : Win32cr::Foundation::BOOL, cParamDescs : UInt32, pParamDescs : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PARAM_DESC*, pEvent : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_define_event.call(this, provider, eventName, eventID, keywords, eventVersion, level, opcode, needStack, cParamDescs, pParamDescs, pEvent)
    end
    def event_pipe_write_event(this : ICorProfilerInfo13*, event : LibC::UIntPtrT, cData : UInt32, data : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENT_DATA*, pActivityId : LibC::GUID*, pRelatedActivityId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_write_event.call(this, event, cData, data, pActivityId, pRelatedActivityId)
    end
    def create_handle(this : ICorProfilerInfo13*, object : LibC::UIntPtrT, type__ : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_HANDLE_TYPE, pHandle : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_handle.call(this, object, type__, pHandle)
    end
    def destroy_handle(this : ICorProfilerInfo13*, handle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_handle.call(this, handle)
    end
    def get_object_id_from_handle(this : ICorProfilerInfo13*, handle : Void**, pObject : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_id_from_handle.call(this, handle, pObject)
    end

  end

  @[Extern]

  record ICorProfilerInfo14Vtable,
    query_interface : Proc(ICorProfilerInfo14*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerInfo14*, UInt32),
    release : Proc(ICorProfilerInfo14*, UInt32),
    get_class_from_object : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_from_token : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_mask : Proc(ICorProfilerInfo14*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_from_ip : Proc(ICorProfilerInfo14*, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_handle_from_thread : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_object_size : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    is_array_class : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::CorElementType*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_current_thread_id : Proc(ICorProfilerInfo14*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_class_id_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    get_function_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask : Proc(ICorProfilerInfo14*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*, Win32cr::Foundation::HRESULT),
    set_function_id_mapper : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*, Win32cr::Foundation::HRESULT),
    get_token_and_meta_data_from_function : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::GUID*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_module_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_meta_data : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_il_function_body : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    get_il_function_body_allocator : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    set_il_function_body : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    get_app_domain_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_assembly_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_function_re_jit : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    force_gc : Proc(ICorProfilerInfo14*, Win32cr::Foundation::HRESULT),
    set_il_instrumented_code_map : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_interface : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    get_inproc_inspection_i_this_thread : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_context : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    begin_inproc_debugging : Proc(ICorProfilerInfo14*, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    end_inproc_debugging : Proc(ICorProfilerInfo14*, UInt32, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    do_stack_snapshot : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, UInt32, Void*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks2 : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*, Win32cr::Foundation::HRESULT),
    get_function_info2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt32*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_string_layout : Proc(ICorProfilerInfo14*, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_layout : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_class_id_info2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, LibC::UIntPtrT*, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_code_info2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_class_from_token_and_type_args : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_function_from_token_and_type_args : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, UInt32, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_module_frozen_objects : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_array_object_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Int32*, UInt8**, Win32cr::Foundation::HRESULT),
    get_box_class_layout : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    get_thread_app_domain : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rva_static_address : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_app_domain_static_address : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_thread_static_address : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_context_static_address : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_static_field_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*, Win32cr::Foundation::HRESULT),
    get_generation_bounds : Proc(ICorProfilerInfo14*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_object_generation : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*, Win32cr::Foundation::HRESULT),
    get_notified_exception_clause_info : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    request_profiler_detach : Proc(ICorProfilerInfo14*, UInt32, Win32cr::Foundation::HRESULT),
    set_function_id_mapper2 : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, Void*, Win32cr::Foundation::HRESULT),
    get_string_layout2 : Proc(ICorProfilerInfo14*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3 : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*, Win32cr::Foundation::HRESULT),
    set_enter_leave_function_hooks3_with_info : Proc(ICorProfilerInfo14*, Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*, Win32cr::Foundation::HRESULT),
    get_function_enter3_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*, Win32cr::Foundation::HRESULT),
    get_function_leave3_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*, Win32cr::Foundation::HRESULT),
    get_function_tailcall3_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enum_modules : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_information : Proc(ICorProfilerInfo14*, UInt16*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, UInt16*, UInt16*, UInt16*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_thread_static_address2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    get_app_domains_containing_module : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_module_info2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt8**, UInt32, UInt32*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_threads : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    initialize_current_thread : Proc(ICorProfilerInfo14*, Win32cr::Foundation::HRESULT),
    request_re_jit : Proc(ICorProfilerInfo14*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    request_revert : Proc(ICorProfilerInfo14*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_code_info3 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    get_function_from_ip2 : Proc(ICorProfilerInfo14*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_re_jiti_ds : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    enum_ji_ted_functions2 : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    get_object_size2 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_event_mask2 : Proc(ICorProfilerInfo14*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_event_mask2 : Proc(ICorProfilerInfo14*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    enum_ngen_module_methods_inlining_this_method : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    apply_meta_data : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    get_in_memory_symbols_length : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32*, Win32cr::Foundation::HRESULT),
    read_in_memory_symbols : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    is_function_dynamic : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_from_ip3 : Proc(ICorProfilerInfo14*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_dynamic_function_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt8**, UInt32*, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_native_code_start_addresses : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, LibC::UIntPtrT, UInt32, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_il_to_native_mapping3 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*, Win32cr::Foundation::HRESULT),
    get_code_info4 : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*, Win32cr::Foundation::HRESULT),
    enumerate_object_references : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, Void*, Win32cr::Foundation::HRESULT),
    is_frozen_object : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_loh_object_size_threshold : Proc(ICorProfilerInfo14*, UInt32*, Win32cr::Foundation::HRESULT),
    request_re_jit_with_inliners : Proc(ICorProfilerInfo14*, UInt32, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_runtime : Proc(ICorProfilerInfo14*, Win32cr::Foundation::HRESULT),
    resume_runtime : Proc(ICorProfilerInfo14*, Win32cr::Foundation::HRESULT),
    get_environment_variable_a : Proc(ICorProfilerInfo14*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_environment_variable : Proc(ICorProfilerInfo14*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    event_pipe_start_session : Proc(ICorProfilerInfo14*, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG*, Win32cr::Foundation::BOOL, UInt64*, Win32cr::Foundation::HRESULT),
    event_pipe_add_provider_to_session : Proc(ICorProfilerInfo14*, UInt64, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG, Win32cr::Foundation::HRESULT),
    event_pipe_stop_session : Proc(ICorProfilerInfo14*, UInt64, Win32cr::Foundation::HRESULT),
    event_pipe_create_provider : Proc(ICorProfilerInfo14*, Win32cr::Foundation::PWSTR, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_get_provider_info : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    event_pipe_define_event : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::Foundation::PWSTR, UInt32, UInt64, UInt32, UInt32, UInt8, Win32cr::Foundation::BOOL, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PARAM_DESC*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    event_pipe_write_event : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENT_DATA*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    create_handle : Proc(ICorProfilerInfo14*, LibC::UIntPtrT, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_HANDLE_TYPE, Void***, Win32cr::Foundation::HRESULT),
    destroy_handle : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    get_object_id_from_handle : Proc(ICorProfilerInfo14*, Void**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    enumerate_non_gc_objects : Proc(ICorProfilerInfo14*, Void**, Win32cr::Foundation::HRESULT),
    get_non_gc_heap_bounds : Proc(ICorProfilerInfo14*, UInt32, UInt32*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_NONGC_HEAP_RANGE*, Win32cr::Foundation::HRESULT),
    event_pipe_create_provider2 : Proc(ICorProfilerInfo14*, Win32cr::Foundation::PWSTR, Win32cr::System::Diagnostics::ClrProfiling::EventPipeProviderCallback*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerInfo14, lpVtbl : ICorProfilerInfo14Vtable* do
    GUID = LibC::GUID.new(0xf460e352_u32, 0xd76d_u16, 0x4fe9_u16, StaticArray[0x83_u8, 0x5f_u8, 0xf6_u8, 0xaf_u8, 0x9d_u8, 0x6e_u8, 0x86_u8, 0x2d_u8])
    def query_interface(this : ICorProfilerInfo14*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerInfo14*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerInfo14*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_class_from_object(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_object.call(this, objectId, pClassId)
    end
    def get_class_from_token(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, typeDef : UInt32, pClassId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token.call(this, moduleId, typeDef, pClassId)
    end
    def get_code_info(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, pStart : UInt8**, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info.call(this, functionId, pStart, pcSize)
    end
    def get_event_mask(this : ICorProfilerInfo14*, pdwEvents : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask.call(this, pdwEvents)
    end
    def get_function_from_ip(this : ICorProfilerInfo14*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip.call(this, ip, pFunctionId)
    end
    def get_function_from_token(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, token : UInt32, pFunctionId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token.call(this, moduleId, token, pFunctionId)
    end
    def get_handle_from_thread(this : ICorProfilerInfo14*, threadId : LibC::UIntPtrT, phThread : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_handle_from_thread.call(this, threadId, phThread)
    end
    def get_object_size(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, pcSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size.call(this, objectId, pcSize)
    end
    def is_array_class(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, pBaseElemType : Win32cr::System::WinRT::Metadata::CorElementType*, pBaseClassId : LibC::UIntPtrT*, pcRank : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_array_class.call(this, classId, pBaseElemType, pBaseClassId, pcRank)
    end
    def get_thread_info(this : ICorProfilerInfo14*, threadId : LibC::UIntPtrT, pdwWin32ThreadId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_info.call(this, threadId, pdwWin32ThreadId)
    end
    def get_current_thread_id(this : ICorProfilerInfo14*, pThreadId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_thread_id.call(this, pThreadId)
    end
    def get_class_id_info(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info.call(this, classId, pModuleId, pTypeDefToken)
    end
    def get_function_info(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info.call(this, functionId, pClassId, pModuleId, pToken)
    end
    def set_event_mask(this : ICorProfilerInfo14*, dwEvents : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask.call(this, dwEvents)
    end
    def set_enter_leave_function_hooks(this : ICorProfilerInfo14*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def set_function_id_mapper(this : ICorProfilerInfo14*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper.call(this, pFunc)
    end
    def get_token_and_meta_data_from_function(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, riid : LibC::GUID*, ppImport : Void**, pToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_meta_data_from_function.call(this, functionId, riid, ppImport, pToken)
    end
    def get_module_info(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId)
    end
    def get_module_meta_data(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, dwOpenFlags : UInt32, riid : LibC::GUID*, ppOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_meta_data.call(this, moduleId, dwOpenFlags, riid, ppOut)
    end
    def get_il_function_body(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, methodId : UInt32, ppMethodHeader : UInt8**, pcbMethodSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body.call(this, moduleId, methodId, ppMethodHeader, pcbMethodSize)
    end
    def get_il_function_body_allocator(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_function_body_allocator.call(this, moduleId, ppMalloc)
    end
    def set_il_function_body(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, methodid : UInt32, pbNewILMethodHeader : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_function_body.call(this, moduleId, methodid, pbNewILMethodHeader)
    end
    def get_app_domain_info(this : ICorProfilerInfo14*, appDomainId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pProcessId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_info.call(this, appDomainId, cchName, pcchName, szName, pProcessId)
    end
    def get_assembly_info(this : ICorProfilerInfo14*, assemblyId : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAppDomainId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_info.call(this, assemblyId, cchName, pcchName, szName, pAppDomainId, pModuleId)
    end
    def set_function_re_jit(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_re_jit.call(this, functionId)
    end
    def force_gc(this : ICorProfilerInfo14*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_gc.call(this)
    end
    def set_il_instrumented_code_map(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, fStartJit : Win32cr::Foundation::BOOL, cILMapEntries : UInt32, rgILMapEntries : Win32cr::System::Diagnostics::ClrProfiling::COR_IL_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_il_instrumented_code_map.call(this, functionId, fStartJit, cILMapEntries, rgILMapEntries)
    end
    def get_inproc_inspection_interface(this : ICorProfilerInfo14*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_interface.call(this, ppicd)
    end
    def get_inproc_inspection_i_this_thread(this : ICorProfilerInfo14*, ppicd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inproc_inspection_i_this_thread.call(this, ppicd)
    end
    def get_thread_context(this : ICorProfilerInfo14*, threadId : LibC::UIntPtrT, pContextId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_context.call(this, threadId, pContextId)
    end
    def begin_inproc_debugging(this : ICorProfilerInfo14*, fThisThreadOnly : Win32cr::Foundation::BOOL, pdwProfilerContext : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_inproc_debugging.call(this, fThisThreadOnly, pdwProfilerContext)
    end
    def end_inproc_debugging(this : ICorProfilerInfo14*, dwProfilerContext : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_inproc_debugging.call(this, dwProfilerContext)
    end
    def get_il_to_native_mapping(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping.call(this, functionId, cMap, pcMap, map)
    end
    def do_stack_snapshot(this : ICorProfilerInfo14*, thread : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::StackSnapshotCallback*, infoFlags : UInt32, clientData : Void*, context : UInt8*, contextSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_stack_snapshot.call(this, thread, callback, infoFlags, clientData, context, contextSize)
    end
    def set_enter_leave_function_hooks2(this : ICorProfilerInfo14*, pFuncEnter : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter2*, pFuncLeave : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave2*, pFuncTailcall : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks2.call(this, pFuncEnter, pFuncLeave, pFuncTailcall)
    end
    def get_function_info2(this : ICorProfilerInfo14*, funcId : LibC::UIntPtrT, frameInfo : LibC::UIntPtrT, pClassId : LibC::UIntPtrT*, pModuleId : LibC::UIntPtrT*, pToken : UInt32*, cTypeArgs : UInt32, pcTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_info2.call(this, funcId, frameInfo, pClassId, pModuleId, pToken, cTypeArgs, pcTypeArgs, typeArgs)
    end
    def get_string_layout(this : ICorProfilerInfo14*, pBufferLengthOffset : UInt32*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout.call(this, pBufferLengthOffset, pStringLengthOffset, pBufferOffset)
    end
    def get_class_layout(this : ICorProfilerInfo14*, classID : LibC::UIntPtrT, rFieldOffset : Win32cr::System::WinRT::Metadata::COR_FIELD_OFFSET*, cFieldOffset : UInt32, pcFieldOffset : UInt32*, pulClassSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_layout.call(this, classID, rFieldOffset, cFieldOffset, pcFieldOffset, pulClassSize)
    end
    def get_class_id_info2(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, pModuleId : LibC::UIntPtrT*, pTypeDefToken : UInt32*, pParentClassId : LibC::UIntPtrT*, cNumTypeArgs : UInt32, pcNumTypeArgs : UInt32*, typeArgs : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_id_info2.call(this, classId, pModuleId, pTypeDefToken, pParentClassId, cNumTypeArgs, pcNumTypeArgs, typeArgs)
    end
    def get_code_info2(this : ICorProfilerInfo14*, functionID : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info2.call(this, functionID, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_class_from_token_and_type_args(this : ICorProfilerInfo14*, moduleID : LibC::UIntPtrT, typeDef : UInt32, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pClassID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_class_from_token_and_type_args.call(this, moduleID, typeDef, cTypeArgs, typeArgs, pClassID)
    end
    def get_function_from_token_and_type_args(this : ICorProfilerInfo14*, moduleID : LibC::UIntPtrT, funcDef : UInt32, classId : LibC::UIntPtrT, cTypeArgs : UInt32, typeArgs : LibC::UIntPtrT*, pFunctionID : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_token_and_type_args.call(this, moduleID, funcDef, classId, cTypeArgs, typeArgs, pFunctionID)
    end
    def enum_module_frozen_objects(this : ICorProfilerInfo14*, moduleID : LibC::UIntPtrT, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_frozen_objects.call(this, moduleID, ppEnum)
    end
    def get_array_object_info(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, cDimensions : UInt32, pDimensionSizes : UInt32*, pDimensionLowerBounds : Int32*, ppData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_array_object_info.call(this, objectId, cDimensions, pDimensionSizes, pDimensionLowerBounds, ppData)
    end
    def get_box_class_layout(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_box_class_layout.call(this, classId, pBufferOffset)
    end
    def get_thread_app_domain(this : ICorProfilerInfo14*, threadId : LibC::UIntPtrT, pAppDomainId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_app_domain.call(this, threadId, pAppDomainId)
    end
    def get_rva_static_address(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, fieldToken : UInt32, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rva_static_address.call(this, classId, fieldToken, ppAddress)
    end
    def get_app_domain_static_address(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domain_static_address.call(this, classId, fieldToken, appDomainId, ppAddress)
    end
    def get_thread_static_address(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, fieldToken : UInt32, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address.call(this, classId, fieldToken, threadId, ppAddress)
    end
    def get_context_static_address(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, fieldToken : UInt32, contextId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_static_address.call(this, classId, fieldToken, contextId, ppAddress)
    end
    def get_static_field_info(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, fieldToken : UInt32, pFieldInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_STATIC_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_static_field_info.call(this, classId, fieldToken, pFieldInfo)
    end
    def get_generation_bounds(this : ICorProfilerInfo14*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generation_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def get_object_generation(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, range : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_GC_GENERATION_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_generation.call(this, objectId, range)
    end
    def get_notified_exception_clause_info(this : ICorProfilerInfo14*, pinfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EX_CLAUSE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notified_exception_clause_info.call(this, pinfo)
    end
    def enum_ji_ted_functions(this : ICorProfilerInfo14*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions.call(this, ppEnum)
    end
    def request_profiler_detach(this : ICorProfilerInfo14*, dwExpectedCompletionMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_profiler_detach.call(this, dwExpectedCompletionMilliseconds)
    end
    def set_function_id_mapper2(this : ICorProfilerInfo14*, pFunc : Win32cr::System::Diagnostics::ClrProfiling::FunctionIDMapper2*, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_function_id_mapper2.call(this, pFunc, clientData)
    end
    def get_string_layout2(this : ICorProfilerInfo14*, pStringLengthOffset : UInt32*, pBufferOffset : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string_layout2.call(this, pStringLengthOffset, pBufferOffset)
    end
    def set_enter_leave_function_hooks3(this : ICorProfilerInfo14*, pFuncEnter3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3*, pFuncLeave3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3*, pFuncTailcall3 : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3.call(this, pFuncEnter3, pFuncLeave3, pFuncTailcall3)
    end
    def set_enter_leave_function_hooks3_with_info(this : ICorProfilerInfo14*, pFuncEnter3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionEnter3WithInfo*, pFuncLeave3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionLeave3WithInfo*, pFuncTailcall3WithInfo : Win32cr::System::Diagnostics::ClrProfiling::FunctionTailcall3WithInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_enter_leave_function_hooks3_with_info.call(this, pFuncEnter3WithInfo, pFuncLeave3WithInfo, pFuncTailcall3WithInfo)
    end
    def get_function_enter3_info(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pcbArgumentInfo : UInt32*, pArgumentInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_enter3_info.call(this, functionId, eltInfo, pFrameInfo, pcbArgumentInfo, pArgumentInfo)
    end
    def get_function_leave3_info(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*, pRetvalRange : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_FUNCTION_ARGUMENT_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_leave3_info.call(this, functionId, eltInfo, pFrameInfo, pRetvalRange)
    end
    def get_function_tailcall3_info(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, eltInfo : LibC::UIntPtrT, pFrameInfo : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_tailcall3_info.call(this, functionId, eltInfo, pFrameInfo)
    end
    def enum_modules(this : ICorProfilerInfo14*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_modules.call(this, ppEnum)
    end
    def get_runtime_information(this : ICorProfilerInfo14*, pClrInstanceId : UInt16*, pRuntimeType : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_RUNTIME_TYPE*, pMajorVersion : UInt16*, pMinorVersion : UInt16*, pBuildNumber : UInt16*, pQFEVersion : UInt16*, cchVersionString : UInt32, pcchVersionString : UInt32*, szVersionString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_information.call(this, pClrInstanceId, pRuntimeType, pMajorVersion, pMinorVersion, pBuildNumber, pQFEVersion, cchVersionString, pcchVersionString, szVersionString)
    end
    def get_thread_static_address2(this : ICorProfilerInfo14*, classId : LibC::UIntPtrT, fieldToken : UInt32, appDomainId : LibC::UIntPtrT, threadId : LibC::UIntPtrT, ppAddress : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_static_address2.call(this, classId, fieldToken, appDomainId, threadId, ppAddress)
    end
    def get_app_domains_containing_module(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, cAppDomainIds : UInt32, pcAppDomainIds : UInt32*, appDomainIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_domains_containing_module.call(this, moduleId, cAppDomainIds, pcAppDomainIds, appDomainIds)
    end
    def get_module_info2(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, ppBaseLoadAddress : UInt8**, cchName : UInt32, pcchName : UInt32*, szName : Win32cr::Foundation::PWSTR, pAssemblyId : LibC::UIntPtrT*, pdwModuleFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_info2.call(this, moduleId, ppBaseLoadAddress, cchName, pcchName, szName, pAssemblyId, pdwModuleFlags)
    end
    def enum_threads(this : ICorProfilerInfo14*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threads.call(this, ppEnum)
    end
    def initialize_current_thread(this : ICorProfilerInfo14*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_current_thread.call(this)
    end
    def request_re_jit(this : ICorProfilerInfo14*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit.call(this, cFunctions, moduleIds, methodIds)
    end
    def request_revert(this : ICorProfilerInfo14*, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*, status : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_revert.call(this, cFunctions, moduleIds, methodIds, status)
    end
    def get_code_info3(this : ICorProfilerInfo14*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info3.call(this, functionID, reJitId, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def get_function_from_ip2(this : ICorProfilerInfo14*, ip : UInt8*, pFunctionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip2.call(this, ip, pFunctionId, pReJitId)
    end
    def get_re_jiti_ds(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, cReJitIds : UInt32, pcReJitIds : UInt32*, reJitIds : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_re_jiti_ds.call(this, functionId, cReJitIds, pcReJitIds, reJitIds)
    end
    def get_il_to_native_mapping2(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping2.call(this, functionId, reJitId, cMap, pcMap, map)
    end
    def enum_ji_ted_functions2(this : ICorProfilerInfo14*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ji_ted_functions2.call(this, ppEnum)
    end
    def get_object_size2(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, pcSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_size2.call(this, objectId, pcSize)
    end
    def get_event_mask2(this : ICorProfilerInfo14*, pdwEventsLow : UInt32*, pdwEventsHigh : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_mask2.call(this, pdwEventsLow, pdwEventsHigh)
    end
    def set_event_mask2(this : ICorProfilerInfo14*, dwEventsLow : UInt32, dwEventsHigh : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_mask2.call(this, dwEventsLow, dwEventsHigh)
    end
    def enum_ngen_module_methods_inlining_this_method(this : ICorProfilerInfo14*, inlinersModuleId : LibC::UIntPtrT, inlineeModuleId : LibC::UIntPtrT, inlineeMethodId : UInt32, incompleteData : Win32cr::Foundation::BOOL*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ngen_module_methods_inlining_this_method.call(this, inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum)
    end
    def apply_meta_data(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_meta_data.call(this, moduleId)
    end
    def get_in_memory_symbols_length(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, pCountSymbolBytes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_in_memory_symbols_length.call(this, moduleId, pCountSymbolBytes)
    end
    def read_in_memory_symbols(this : ICorProfilerInfo14*, moduleId : LibC::UIntPtrT, symbolsReadOffset : UInt32, pSymbolBytes : UInt8*, countSymbolBytes : UInt32, pCountSymbolBytesRead : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_in_memory_symbols.call(this, moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead)
    end
    def is_function_dynamic(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, isDynamic : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_function_dynamic.call(this, functionId, isDynamic)
    end
    def get_function_from_ip3(this : ICorProfilerInfo14*, ip : UInt8*, functionId : LibC::UIntPtrT*, pReJitId : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_from_ip3.call(this, ip, functionId, pReJitId)
    end
    def get_dynamic_function_info(this : ICorProfilerInfo14*, functionId : LibC::UIntPtrT, moduleId : LibC::UIntPtrT*, ppvSig : UInt8**, pbSig : UInt32*, cchName : UInt32, pcchName : UInt32*, wszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dynamic_function_info.call(this, functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName)
    end
    def get_native_code_start_addresses(this : ICorProfilerInfo14*, functionID : LibC::UIntPtrT, reJitId : LibC::UIntPtrT, cCodeStartAddresses : UInt32, pcCodeStartAddresses : UInt32*, codeStartAddresses : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_native_code_start_addresses.call(this, functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses)
    end
    def get_il_to_native_mapping3(this : ICorProfilerInfo14*, pNativeCodeStartAddress : LibC::UIntPtrT, cMap : UInt32, pcMap : UInt32*, map : Win32cr::System::Diagnostics::ClrProfiling::COR_DEBUG_IL_TO_NATIVE_MAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_il_to_native_mapping3.call(this, pNativeCodeStartAddress, cMap, pcMap, map)
    end
    def get_code_info4(this : ICorProfilerInfo14*, pNativeCodeStartAddress : LibC::UIntPtrT, cCodeInfos : UInt32, pcCodeInfos : UInt32*, codeInfos : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_CODE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_code_info4.call(this, pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos)
    end
    def enumerate_object_references(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, callback : Win32cr::System::Diagnostics::ClrProfiling::ObjectReferenceCallback, clientData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_object_references.call(this, objectId, callback, clientData)
    end
    def is_frozen_object(this : ICorProfilerInfo14*, objectId : LibC::UIntPtrT, pbFrozen : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_frozen_object.call(this, objectId, pbFrozen)
    end
    def get_loh_object_size_threshold(this : ICorProfilerInfo14*, pThreshold : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_loh_object_size_threshold.call(this, pThreshold)
    end
    def request_re_jit_with_inliners(this : ICorProfilerInfo14*, dwRejitFlags : UInt32, cFunctions : UInt32, moduleIds : LibC::UIntPtrT*, methodIds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_re_jit_with_inliners.call(this, dwRejitFlags, cFunctions, moduleIds, methodIds)
    end
    def suspend_runtime(this : ICorProfilerInfo14*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_runtime.call(this)
    end
    def resume_runtime(this : ICorProfilerInfo14*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_runtime.call(this)
    end
    def get_environment_variable_a(this : ICorProfilerInfo14*, szName : Win32cr::Foundation::PWSTR, cchValue : UInt32, pcchValue : UInt32*, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_environment_variable_a.call(this, szName, cchValue, pcchValue, szValue)
    end
    def set_environment_variable(this : ICorProfilerInfo14*, szName : Win32cr::Foundation::PWSTR, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_environment_variable.call(this, szName, szValue)
    end
    def event_pipe_start_session(this : ICorProfilerInfo14*, cProviderConfigs : UInt32, pProviderConfigs : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG*, requestRundown : Win32cr::Foundation::BOOL, pSession : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_start_session.call(this, cProviderConfigs, pProviderConfigs, requestRundown, pSession)
    end
    def event_pipe_add_provider_to_session(this : ICorProfilerInfo14*, session : UInt64, providerConfig : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PROVIDER_CONFIG) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_add_provider_to_session.call(this, session, providerConfig)
    end
    def event_pipe_stop_session(this : ICorProfilerInfo14*, session : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_stop_session.call(this, session)
    end
    def event_pipe_create_provider(this : ICorProfilerInfo14*, providerName : Win32cr::Foundation::PWSTR, pProvider : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_create_provider.call(this, providerName, pProvider)
    end
    def event_pipe_get_provider_info(this : ICorProfilerInfo14*, provider : LibC::UIntPtrT, cchName : UInt32, pcchName : UInt32*, providerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_get_provider_info.call(this, provider, cchName, pcchName, providerName)
    end
    def event_pipe_define_event(this : ICorProfilerInfo14*, provider : LibC::UIntPtrT, eventName : Win32cr::Foundation::PWSTR, eventID : UInt32, keywords : UInt64, eventVersion : UInt32, level : UInt32, opcode : UInt8, needStack : Win32cr::Foundation::BOOL, cParamDescs : UInt32, pParamDescs : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENTPIPE_PARAM_DESC*, pEvent : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_define_event.call(this, provider, eventName, eventID, keywords, eventVersion, level, opcode, needStack, cParamDescs, pParamDescs, pEvent)
    end
    def event_pipe_write_event(this : ICorProfilerInfo14*, event : LibC::UIntPtrT, cData : UInt32, data : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_EVENT_DATA*, pActivityId : LibC::GUID*, pRelatedActivityId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_write_event.call(this, event, cData, data, pActivityId, pRelatedActivityId)
    end
    def create_handle(this : ICorProfilerInfo14*, object : LibC::UIntPtrT, type__ : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_HANDLE_TYPE, pHandle : Void***) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_handle.call(this, object, type__, pHandle)
    end
    def destroy_handle(this : ICorProfilerInfo14*, handle : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_handle.call(this, handle)
    end
    def get_object_id_from_handle(this : ICorProfilerInfo14*, handle : Void**, pObject : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_id_from_handle.call(this, handle, pObject)
    end
    def enumerate_non_gc_objects(this : ICorProfilerInfo14*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_non_gc_objects.call(this, ppEnum)
    end
    def get_non_gc_heap_bounds(this : ICorProfilerInfo14*, cObjectRanges : UInt32, pcObjectRanges : UInt32*, ranges : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_NONGC_HEAP_RANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_non_gc_heap_bounds.call(this, cObjectRanges, pcObjectRanges, ranges)
    end
    def event_pipe_create_provider2(this : ICorProfilerInfo14*, providerName : Win32cr::Foundation::PWSTR, pCallback : Win32cr::System::Diagnostics::ClrProfiling::EventPipeProviderCallback*, pProvider : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.event_pipe_create_provider2.call(this, providerName, pCallback, pProvider)
    end

  end

  @[Extern]

  record ICorProfilerMethodEnumVtable,
    query_interface : Proc(ICorProfilerMethodEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerMethodEnum*, UInt32),
    release : Proc(ICorProfilerMethodEnum*, UInt32),
    skip : Proc(ICorProfilerMethodEnum*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(ICorProfilerMethodEnum*, Win32cr::Foundation::HRESULT),
    clone : Proc(ICorProfilerMethodEnum*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ICorProfilerMethodEnum*, UInt32*, Win32cr::Foundation::HRESULT),
    next__ : Proc(ICorProfilerMethodEnum*, UInt32, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_METHOD*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerMethodEnum, lpVtbl : ICorProfilerMethodEnumVtable* do
    GUID = LibC::GUID.new(0xfccee788_u32, 0x88_u16, 0x454b_u16, StaticArray[0xa8_u8, 0x11_u8, 0xc9_u8, 0x9f_u8, 0x29_u8, 0x8d_u8, 0x19_u8, 0x42_u8])
    def query_interface(this : ICorProfilerMethodEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerMethodEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerMethodEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def skip(this : ICorProfilerMethodEnum*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : ICorProfilerMethodEnum*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : ICorProfilerMethodEnum*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def get_count(this : ICorProfilerMethodEnum*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcelt)
    end
    def next__(this : ICorProfilerMethodEnum*, celt : UInt32, elements : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_METHOD*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, elements, pceltFetched)
    end

  end

  @[Extern]

  record ICorProfilerThreadEnumVtable,
    query_interface : Proc(ICorProfilerThreadEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerThreadEnum*, UInt32),
    release : Proc(ICorProfilerThreadEnum*, UInt32),
    skip : Proc(ICorProfilerThreadEnum*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(ICorProfilerThreadEnum*, Win32cr::Foundation::HRESULT),
    clone : Proc(ICorProfilerThreadEnum*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ICorProfilerThreadEnum*, UInt32*, Win32cr::Foundation::HRESULT),
    next__ : Proc(ICorProfilerThreadEnum*, UInt32, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerThreadEnum, lpVtbl : ICorProfilerThreadEnumVtable* do
    GUID = LibC::GUID.new(0x571194f7_u32, 0x25ed_u16, 0x419f_u16, StaticArray[0xaa_u8, 0x8b_u8, 0x70_u8, 0x16_u8, 0xb3_u8, 0x15_u8, 0x97_u8, 0x1_u8])
    def query_interface(this : ICorProfilerThreadEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerThreadEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerThreadEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def skip(this : ICorProfilerThreadEnum*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : ICorProfilerThreadEnum*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : ICorProfilerThreadEnum*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def get_count(this : ICorProfilerThreadEnum*, pcelt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, pcelt)
    end
    def next__(this : ICorProfilerThreadEnum*, celt : UInt32, ids : LibC::UIntPtrT*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, ids, pceltFetched)
    end

  end

  @[Extern]

  record ICorProfilerAssemblyReferenceProviderVtable,
    query_interface : Proc(ICorProfilerAssemblyReferenceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorProfilerAssemblyReferenceProvider*, UInt32),
    release : Proc(ICorProfilerAssemblyReferenceProvider*, UInt32),
    add_assembly_reference : Proc(ICorProfilerAssemblyReferenceProvider*, Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_ASSEMBLY_REFERENCE_INFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorProfilerAssemblyReferenceProvider, lpVtbl : ICorProfilerAssemblyReferenceProviderVtable* do
    GUID = LibC::GUID.new(0x66a78c24_u32, 0x2eef_u16, 0x4f65_u16, StaticArray[0xb4_u8, 0x5f_u8, 0xdd_u8, 0x1d_u8, 0x80_u8, 0x38_u8, 0xbf_u8, 0x3c_u8])
    def query_interface(this : ICorProfilerAssemblyReferenceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorProfilerAssemblyReferenceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorProfilerAssemblyReferenceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_assembly_reference(this : ICorProfilerAssemblyReferenceProvider*, pAssemblyRefInfo : Win32cr::System::Diagnostics::ClrProfiling::COR_PRF_ASSEMBLY_REFERENCE_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_assembly_reference.call(this, pAssemblyRefInfo)
    end

  end

end