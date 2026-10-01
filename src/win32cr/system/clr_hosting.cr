require "./com.cr"
require "./../foundation.cr"
require "./variant.cr"
require "./threading.cr"
require "./io.cr"
require "./../security.cr"
require "./diagnostics/debug.cr"

module Win32cr::System::ClrHosting
  extend self
  alias FLockClrVersionCallback = Proc(Win32cr::Foundation::HRESULT)

  alias FExecuteInAppDomainCallback = Proc(Void*, Win32cr::Foundation::HRESULT)

  alias PTLS_CALLBACK_FUNCTION = Proc(Void*, Void)

  alias CLRCreateInstanceFnPtr = Proc(LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)

  alias CreateInterfaceFnPtr = Proc(LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)

  alias CallbackThreadSetFnPtr = Proc(Win32cr::Foundation::HRESULT)

  alias CallbackThreadUnsetFnPtr = Proc(Win32cr::Foundation::HRESULT)

  alias RuntimeLoadedCallbackFnPtr = Proc(Void*, Win32cr::System::ClrHosting::CallbackThreadSetFnPtr, Win32cr::System::ClrHosting::CallbackThreadUnsetFnPtr, Void)

  DEPRECATED_CLR_API_MESG = "This API has been deprecated. Refer to https://go.microsoft.com/fwlink/?LinkId=143720 for more details."
  CLR_MAJOR_VERSION = 4_u32
  CLR_MINOR_VERSION = 0_u32
  CLR_BUILD_VERSION = 22220_u32
  CLR_ASSEMBLY_MAJOR_VERSION = 4_u32
  CLR_ASSEMBLY_MINOR_VERSION = 0_u32
  CLR_ASSEMBLY_BUILD_VERSION = 0_u32
  BucketParamsCount = 10_u32
  BucketParamLength = 255_u32
  LIBID_mscoree = LibC::GUID.new(0x5477469e_u32, 0x83b1_u16, 0x11d2_u16, StaticArray[0x8b_u8, 0x49_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb7_u8, 0xc9_u8, 0xc4_u8])
  CLSID_CLRStrongName = LibC::GUID.new(0xb79b0acd_u32, 0xf5cd_u16, 0x409b_u16, StaticArray[0xb5_u8, 0xa5_u8, 0xa1_u8, 0x62_u8, 0x44_u8, 0x61_u8, 0xb_u8, 0x92_u8])
  CLSID_CLRMetaHost = LibC::GUID.new(0x9280188d_u32, 0xe8e_u16, 0x4867_u16, StaticArray[0xb3_u8, 0xc_u8, 0x7f_u8, 0xa8_u8, 0x38_u8, 0x84_u8, 0xe8_u8, 0xde_u8])
  CLSID_CLRMetaHostPolicy = LibC::GUID.new(0x2ebcd49a_u32, 0x1b47_u16, 0x4a61_u16, StaticArray[0xb1_u8, 0x3a_u8, 0x4a_u8, 0x3_u8, 0x70_u8, 0x1e_u8, 0x59_u8, 0x4b_u8])
  CLSID_CLRDebugging = LibC::GUID.new(0xbacc578d_u32, 0xfbdd_u16, 0x48a4_u16, StaticArray[0x96_u8, 0x9f_u8, 0x2_u8, 0xd9_u8, 0x32_u8, 0xb7_u8, 0x46_u8, 0x34_u8])
  CLSID_CLRDebuggingLegacy = LibC::GUID.new(0xdf8395b5_u32, 0xa4ba_u16, 0x450b_u16, StaticArray[0xa7_u8, 0x7c_u8, 0xa9_u8, 0xa4_u8, 0x77_u8, 0x62_u8, 0xc5_u8, 0x20_u8])
  CLSID_CLRProfiling = LibC::GUID.new(0xbd097ed8_u32, 0x733e_u16, 0x43fe_u16, StaticArray[0x8e_u8, 0xd7_u8, 0xa9_u8, 0x5f_u8, 0xf9_u8, 0xa8_u8, 0x44_u8, 0x8c_u8])

  CLSID_ComCallUnmarshal = LibC::GUID.new(0x3f281000_u32, 0xe95a_u16, 0x11d2_u16, StaticArray[0x88_u8, 0x6b_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x86_u8, 0x9f_u8, 0x4_u8])

  CLSID_ComCallUnmarshalV4 = LibC::GUID.new(0x45fb4600_u32, 0xe6e8_u16, 0x4928_u16, StaticArray[0xb2_u8, 0x5e_u8, 0x50_u8, 0x47_u8, 0x6f_u8, 0xf7_u8, 0x94_u8, 0x25_u8])

  CLSID_CorRuntimeHost = LibC::GUID.new(0xcb2f6723_u32, 0xab3a_u16, 0x11d2_u16, StaticArray[0x9c_u8, 0x40_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xa3_u8, 0xa_u8, 0x3e_u8])

  CLSID_CLRRuntimeHost = LibC::GUID.new(0x90f1a06e_u32, 0x7712_u16, 0x4762_u16, StaticArray[0x86_u8, 0xb5_u8, 0x7a_u8, 0x5e_u8, 0xba_u8, 0x6b_u8, 0xdb_u8, 0x2_u8])

  CLSID_TypeNameFactory = LibC::GUID.new(0xb81ff171_u32, 0x20f3_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xcc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb0_u8, 0x5_u8, 0x25_u8])

  enum COR_GC_STAT_TYPES
    COR_GC_COUNTS = 1_i32
    COR_GC_MEMORYUSAGE = 2_i32
  end
  enum COR_GC_THREAD_STATS_TYPES
    COR_GC_THREAD_HAS_PROMOTED_BYTES = 1_i32
  end
  enum HOST_TYPE
    HOST_TYPE_DEFAULT = 0_i32
    HOST_TYPE_APPLAUNCH = 1_i32
    HOST_TYPE_CORFLAG = 2_i32
  end
  enum STARTUP_FLAGS
    STARTUP_CONCURRENT_GC = 1_i32
    STARTUP_LOADER_OPTIMIZATION_MASK = 6_i32
    STARTUP_LOADER_OPTIMIZATION_SINGLE_DOMAIN = 2_i32
    STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN = 4_i32
    STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN_HOST = 6_i32
    STARTUP_LOADER_SAFEMODE = 16_i32
    STARTUP_LOADER_SETPREFERENCE = 256_i32
    STARTUP_SERVER_GC = 4096_i32
    STARTUP_HOARD_GC_VM = 8192_i32
    STARTUP_SINGLE_VERSION_HOSTING_INTERFACE = 16384_i32
    STARTUP_LEGACY_IMPERSONATION = 65536_i32
    STARTUP_DISABLE_COMMITTHREADSTACK = 131072_i32
    STARTUP_ALWAYSFLOW_IMPERSONATION = 262144_i32
    STARTUP_TRIM_GC_COMMIT = 524288_i32
    STARTUP_ETW = 1048576_i32
    STARTUP_ARM = 4194304_i32
  end
  enum CLSID_RESOLUTION_FLAGS
    CLSID_RESOLUTION_DEFAULT = 0_i32
    CLSID_RESOLUTION_REGISTERED = 1_i32
  end
  enum RUNTIME_INFO_FLAGS
    RUNTIME_INFO_UPGRADE_VERSION = 1_i32
    RUNTIME_INFO_REQUEST_IA64 = 2_i32
    RUNTIME_INFO_REQUEST_AMD64 = 4_i32
    RUNTIME_INFO_REQUEST_X86 = 8_i32
    RUNTIME_INFO_DONT_RETURN_DIRECTORY = 16_i32
    RUNTIME_INFO_DONT_RETURN_VERSION = 32_i32
    RUNTIME_INFO_DONT_SHOW_ERROR_DIALOG = 64_i32
    RUNTIME_INFO_IGNORE_ERROR_MODE = 4096_i32
    RUNTIME_INFO_REQUEST_ARM64 = 8192_i32
  end
  enum APPDOMAIN_SECURITY_FLAGS
    APPDOMAIN_SECURITY_DEFAULT = 0_i32
    APPDOMAIN_SECURITY_SANDBOXED = 1_i32
    APPDOMAIN_SECURITY_FORBID_CROSSAD_REVERSE_PINVOKE = 2_i32
    APPDOMAIN_FORCE_TRIVIAL_WAIT_OPERATIONS = 8_i32
  end
  enum EMemoryAvailable
    Ememoryavailablelow = 1_i32
    Ememoryavailableneutral = 2_i32
    Ememoryavailablehigh = 3_i32
  end
  enum EMemoryCriticalLevel
    Etaskcritical = 0_i32
    Eappdomaincritical = 1_i32
    Eprocesscritical = 2_i32
  end
  enum WAIT_OPTION
    WAIT_MSGPUMP = 1_i32
    WAIT_ALERTABLE = 2_i32
    WAIT_NOTINDEADLOCK = 4_i32
  end
  enum MALLOC_TYPE
    MALLOC_THREADSAFE = 1_i32
    MALLOC_EXECUTABLE = 2_i32
  end
  enum ETaskType
    TT_DEBUGGERHELPER = 1_i32
    TT_GC = 2_i32
    TT_FINALIZER = 4_i32
    TT_THREADPOOL_TIMER = 8_i32
    TT_THREADPOOL_GATE = 16_i32
    TT_THREADPOOL_WORKER = 32_i32
    TT_THREADPOOL_IOCOMPLETION = 64_i32
    TT_ADUNLOAD = 128_i32
    TT_USER = 256_i32
    TT_THREADPOOL_WAIT = 512_i32
    TT_UNKNOWN = -2147483648_i32
  end
  enum ESymbolReadingPolicy
    Esymbolreadingnever = 0_i32
    Esymbolreadingalways = 1_i32
    Esymbolreadingfulltrustonly = 2_i32
  end
  enum ECustomDumpFlavor
    DUMP_FLAVOR_Mini = 0_i32
    DUMP_FLAVOR_CriticalCLRState = 1_i32
    DUMP_FLAVOR_NonHeapCLRState = 2_i32
    DUMP_FLAVOR_Default = 0_i32
  end
  enum ECustomDumpItemKind
    DUMP_ITEM_None = 0_i32
  end
  enum BucketParameterIndex
    Parameter1 = 0_i32
    Parameter2 = 1_i32
    Parameter3 = 2_i32
    Parameter4 = 3_i32
    Parameter5 = 4_i32
    Parameter6 = 5_i32
    Parameter7 = 6_i32
    Parameter8 = 7_i32
    Parameter9 = 8_i32
    InvalidBucketParamIndex = 9_i32
  end
  enum EClrOperation
    OPR_ThreadAbort = 0_i32
    OPR_ThreadRudeAbortInNonCriticalRegion = 1_i32
    OPR_ThreadRudeAbortInCriticalRegion = 2_i32
    OPR_AppDomainUnload = 3_i32
    OPR_AppDomainRudeUnload = 4_i32
    OPR_ProcessExit = 5_i32
    OPR_FinalizerRun = 6_i32
    MaxClrOperation = 7_i32
  end
  enum EClrFailure
    FAIL_NonCriticalResource = 0_i32
    FAIL_CriticalResource = 1_i32
    FAIL_FatalRuntime = 2_i32
    FAIL_OrphanedLock = 3_i32
    FAIL_StackOverflow = 4_i32
    FAIL_AccessViolation = 5_i32
    FAIL_CodeContract = 6_i32
    MaxClrFailure = 7_i32
  end
  enum EClrUnhandledException
    Eruntimedeterminedpolicy = 0_i32
    Ehostdeterminedpolicy = 1_i32
  end
  enum EPolicyAction
    Enoaction = 0_i32
    Ethrowexception = 1_i32
    Eabortthread = 2_i32
    Erudeabortthread = 3_i32
    Eunloadappdomain = 4_i32
    Erudeunloadappdomain = 5_i32
    Eexitprocess = 6_i32
    Efastexitprocess = 7_i32
    Erudeexitprocess = 8_i32
    Edisableruntime = 9_i32
    MaxPolicyAction = 10_i32
  end
  enum EClrEvent
    Event_DomainUnload = 0_i32
    Event_ClrDisabled = 1_i32
    Event_MDAFired = 2_i32
    Event_StackOverflow = 3_i32
    MaxClrEvent = 4_i32
  end
  enum StackOverflowType
    SO_Managed = 0_i32
    SO_ClrEngine = 1_i32
    SO_Other = 2_i32
  end
  enum ECLRAssemblyIdentityFlags
    CLR_ASSEMBLY_IDENTITY_FLAGS_DEFAULT = 0_i32
  end
  enum EHostBindingPolicyModifyFlags
    HOST_BINDING_POLICY_MODIFY_DEFAULT = 0_i32
    HOST_BINDING_POLICY_MODIFY_CHAIN = 1_i32
    HOST_BINDING_POLICY_MODIFY_REMOVE = 2_i32
    HOST_BINDING_POLICY_MODIFY_MAX = 3_i32
  end
  enum EBindPolicyLevels
    Epolicylevelnone = 0_i32
    Epolicylevelretargetable = 1_i32
    Epolicyunifiedtoclr = 2_i32
    Epolicylevelapp = 4_i32
    Epolicylevelpublisher = 8_i32
    Epolicylevelhost = 16_i32
    Epolicyleveladmin = 32_i32
    Epolicyportability = 64_i32
  end
  enum EHostApplicationPolicy
    HOST_APPLICATION_BINDING_POLICY = 1_i32
  end
  enum EApiCategories
    Enochecks = 0_i32
    Esynchronization = 1_i32
    Esharedstate = 2_i32
    Eexternalprocessmgmt = 4_i32
    Eselfaffectingprocessmgmt = 8_i32
    Eexternalthreading = 16_i32
    Eselfaffectingthreading = 32_i32
    Esecurityinfrastructure = 64_i32
    Eui = 128_i32
    Emayleakonabort = 256_i32
    Eall = 511_i32
  end
  enum EInitializeNewDomainFlags
    Einitializenewdomainflags_none = 0_i32
    Einitializenewdomainflags_nosecuritychanges = 2_i32
  end
  enum EContextType
    Ecurrentcontext = 0_i32
    Erestrictedcontext = 1_i32
  end
  enum METAHOST_POLICY_FLAGS
    METAHOST_POLICY_HIGHCOMPAT = 0_i32
    METAHOST_POLICY_APPLY_UPGRADE_POLICY = 8_i32
    METAHOST_POLICY_EMULATE_EXE_LAUNCH = 16_i32
    METAHOST_POLICY_SHOW_ERROR_DIALOG = 32_i32
    METAHOST_POLICY_USE_PROCESS_IMAGE_PATH = 64_i32
    METAHOST_POLICY_ENSURE_SKU_SUPPORTED = 128_i32
    METAHOST_POLICY_IGNORE_ERROR_MODE = 4096_i32
  end
  enum METAHOST_CONFIG_FLAGS
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_UNSET = 0_i32
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_TRUE = 1_i32
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_FALSE = 2_i32
    METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_MASK = 3_i32
  end
  enum CLR_DEBUGGING_PROCESS_FLAGS
    CLR_DEBUGGING_MANAGED_EVENT_PENDING = 1_i32
    CLR_DEBUGGING_MANAGED_EVENT_DEBUGGER_LAUNCH = 2_i32
  end

  @[Extern]
  struct COR_GC_STATS
    property flags : UInt32
    property explicit_gc_count : LibC::UIntPtrT
    property gen_collections_taken : LibC::UIntPtrT[3]
    property committed_k_bytes : LibC::UIntPtrT
    property reserved_k_bytes : LibC::UIntPtrT
    property gen0_heap_size_k_bytes : LibC::UIntPtrT
    property gen1_heap_size_k_bytes : LibC::UIntPtrT
    property gen2_heap_size_k_bytes : LibC::UIntPtrT
    property large_object_heap_size_k_bytes : LibC::UIntPtrT
    property k_bytes_promoted_from_gen0 : LibC::UIntPtrT
    property k_bytes_promoted_from_gen1 : LibC::UIntPtrT
    def initialize(@flags : UInt32, @explicit_gc_count : LibC::UIntPtrT, @gen_collections_taken : LibC::UIntPtrT[3], @committed_k_bytes : LibC::UIntPtrT, @reserved_k_bytes : LibC::UIntPtrT, @gen0_heap_size_k_bytes : LibC::UIntPtrT, @gen1_heap_size_k_bytes : LibC::UIntPtrT, @gen2_heap_size_k_bytes : LibC::UIntPtrT, @large_object_heap_size_k_bytes : LibC::UIntPtrT, @k_bytes_promoted_from_gen0 : LibC::UIntPtrT, @k_bytes_promoted_from_gen1 : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct COR_GC_THREAD_STATS
    property per_thread_allocation : UInt64
    property flags : UInt32
    def initialize(@per_thread_allocation : UInt64, @flags : UInt32)
    end
  end

  @[Extern]
  struct CustomDumpItem
    property itemKind : Win32cr::System::ClrHosting::ECustomDumpItemKind
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pReserved : LibC::UIntPtrT
    def initialize(@pReserved : LibC::UIntPtrT)
    end
    end

    def initialize(@itemKind : Win32cr::System::ClrHosting::ECustomDumpItemKind, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct BucketParameters
    property fInited : Win32cr::Foundation::BOOL
    property pszEventTypeName : UInt16[255]
    property pszParams : UInt16[2550]
    def initialize(@fInited : Win32cr::Foundation::BOOL, @pszEventTypeName : UInt16[255], @pszParams : UInt16[2550])
    end
  end

  @[Extern]
  struct MDAInfo
    property lpMDACaption : Win32cr::Foundation::PWSTR
    property lpMDAMessage : Win32cr::Foundation::PWSTR
    property lpStackTrace : Win32cr::Foundation::PWSTR
    def initialize(@lpMDACaption : Win32cr::Foundation::PWSTR, @lpMDAMessage : Win32cr::Foundation::PWSTR, @lpStackTrace : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct StackOverflowInfo
    property soType : Win32cr::System::ClrHosting::StackOverflowType
    property pExceptionInfo : Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*
    def initialize(@soType : Win32cr::System::ClrHosting::StackOverflowType, @pExceptionInfo : Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*)
    end
  end

  @[Extern]
  struct AssemblyBindInfo
    property dwAppDomainId : UInt32
    property lpReferencedIdentity : Win32cr::Foundation::PWSTR
    property lpPostPolicyIdentity : Win32cr::Foundation::PWSTR
    property ePolicyLevel : UInt32
    def initialize(@dwAppDomainId : UInt32, @lpReferencedIdentity : Win32cr::Foundation::PWSTR, @lpPostPolicyIdentity : Win32cr::Foundation::PWSTR, @ePolicyLevel : UInt32)
    end
  end

  @[Extern]
  struct ModuleBindInfo
    property dwAppDomainId : UInt32
    property lpAssemblyIdentity : Win32cr::Foundation::PWSTR
    property lpModuleName : Win32cr::Foundation::PWSTR
    def initialize(@dwAppDomainId : UInt32, @lpAssemblyIdentity : Win32cr::Foundation::PWSTR, @lpModuleName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct CLR_DEBUGGING_VERSION
    property wStructVersion : UInt16
    property wMajor : UInt16
    property wMinor : UInt16
    property wBuild : UInt16
    property wRevision : UInt16
    def initialize(@wStructVersion : UInt16, @wMajor : UInt16, @wMinor : UInt16, @wBuild : UInt16, @wRevision : UInt16)
    end
  end

  @[Extern]

  record IGCHostVtable,
    query_interface : Proc(IGCHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGCHost*, UInt32),
    release : Proc(IGCHost*, UInt32),
    set_gc_startup_limits : Proc(IGCHost*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    collect : Proc(IGCHost*, Int32, Win32cr::Foundation::HRESULT),
    get_stats : Proc(IGCHost*, Win32cr::System::ClrHosting::COR_GC_STATS*, Win32cr::Foundation::HRESULT),
    get_thread_stats : Proc(IGCHost*, UInt32*, Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*, Win32cr::Foundation::HRESULT),
    set_virtual_mem_limit : Proc(IGCHost*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGCHost, lpVtbl : IGCHostVtable* do
    GUID = LibC::GUID.new(0xfac34f6e_u32, 0xdcd_u16, 0x47b5_u16, StaticArray[0x80_u8, 0x21_u8, 0x53_u8, 0x1b_u8, 0xc5_u8, 0xec_u8, 0xca_u8, 0x63_u8])
    def query_interface(this : IGCHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGCHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGCHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_gc_startup_limits(this : IGCHost*, segment_size : UInt32, max_gen0_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_startup_limits.call(this, segment_size, max_gen0_size)
    end
    def collect(this : IGCHost*, generation : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect.call(this, generation)
    end
    def get_stats(this : IGCHost*, pStats : Win32cr::System::ClrHosting::COR_GC_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stats.call(this, pStats)
    end
    def get_thread_stats(this : IGCHost*, pFiberCookie : UInt32*, pStats : Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_stats.call(this, pFiberCookie, pStats)
    end
    def set_virtual_mem_limit(this : IGCHost*, sztMaxVirtualMemMB : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_virtual_mem_limit.call(this, sztMaxVirtualMemMB)
    end

  end

  @[Extern]

  record IGCHost2Vtable,
    query_interface : Proc(IGCHost2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGCHost2*, UInt32),
    release : Proc(IGCHost2*, UInt32),
    set_gc_startup_limits : Proc(IGCHost2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    collect : Proc(IGCHost2*, Int32, Win32cr::Foundation::HRESULT),
    get_stats : Proc(IGCHost2*, Win32cr::System::ClrHosting::COR_GC_STATS*, Win32cr::Foundation::HRESULT),
    get_thread_stats : Proc(IGCHost2*, UInt32*, Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*, Win32cr::Foundation::HRESULT),
    set_virtual_mem_limit : Proc(IGCHost2*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    set_gc_startup_limits_ex : Proc(IGCHost2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGCHost2, lpVtbl : IGCHost2Vtable* do
    GUID = LibC::GUID.new(0xa1d70cec_u32, 0x2dbe_u16, 0x4e2f_u16, StaticArray[0x92_u8, 0x91_u8, 0xfd_u8, 0xf8_u8, 0x14_u8, 0x38_u8, 0xa1_u8, 0xdf_u8])
    def query_interface(this : IGCHost2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGCHost2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGCHost2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_gc_startup_limits(this : IGCHost2*, segment_size : UInt32, max_gen0_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_startup_limits.call(this, segment_size, max_gen0_size)
    end
    def collect(this : IGCHost2*, generation : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect.call(this, generation)
    end
    def get_stats(this : IGCHost2*, pStats : Win32cr::System::ClrHosting::COR_GC_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stats.call(this, pStats)
    end
    def get_thread_stats(this : IGCHost2*, pFiberCookie : UInt32*, pStats : Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_stats.call(this, pFiberCookie, pStats)
    end
    def set_virtual_mem_limit(this : IGCHost2*, sztMaxVirtualMemMB : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_virtual_mem_limit.call(this, sztMaxVirtualMemMB)
    end
    def set_gc_startup_limits_ex(this : IGCHost2*, segment_size : LibC::UIntPtrT, max_gen0_size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_startup_limits_ex.call(this, segment_size, max_gen0_size)
    end

  end

  @[Extern]

  record IObjectHandleVtable,
    query_interface : Proc(IObjectHandle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectHandle*, UInt32),
    release : Proc(IObjectHandle*, UInt32),
    unwrap : Proc(IObjectHandle*, Win32cr::System::Variant::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IObjectHandle, lpVtbl : IObjectHandleVtable* do
    GUID = LibC::GUID.new(0xc460e2b4_u32, 0xe199_u16, 0x412a_u16, StaticArray[0x84_u8, 0x56_u8, 0x84_u8, 0xdc_u8, 0x3e_u8, 0x48_u8, 0x38_u8, 0xc3_u8])
    def query_interface(this : IObjectHandle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectHandle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectHandle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def unwrap(this : IObjectHandle*, ppv : Win32cr::System::Variant::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unwrap.call(this, ppv)
    end

  end

  @[Extern]

  record IAppDomainBindingVtable,
    query_interface : Proc(IAppDomainBinding*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppDomainBinding*, UInt32),
    release : Proc(IAppDomainBinding*, UInt32),
    on_app_domain : Proc(IAppDomainBinding*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAppDomainBinding, lpVtbl : IAppDomainBindingVtable* do
    GUID = LibC::GUID.new(0x5c2b07a7_u32, 0x1e98_u16, 0x11d3_u16, StaticArray[0x87_u8, 0x2f_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xed_u8, 0xd_u8])
    def query_interface(this : IAppDomainBinding*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppDomainBinding*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppDomainBinding*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_app_domain(this : IAppDomainBinding*, pAppdomain : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_domain.call(this, pAppdomain)
    end

  end

  @[Extern]

  record IGCThreadControlVtable,
    query_interface : Proc(IGCThreadControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGCThreadControl*, UInt32),
    release : Proc(IGCThreadControl*, UInt32),
    thread_is_blocking_for_suspension : Proc(IGCThreadControl*, Win32cr::Foundation::HRESULT),
    suspension_starting : Proc(IGCThreadControl*, Win32cr::Foundation::HRESULT),
    suspension_ending : Proc(IGCThreadControl*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGCThreadControl, lpVtbl : IGCThreadControlVtable* do
    GUID = LibC::GUID.new(0xf31d1788_u32, 0xc397_u16, 0x4725_u16, StaticArray[0x87_u8, 0xa5_u8, 0x6a_u8, 0xf3_u8, 0x47_u8, 0x2c_u8, 0x27_u8, 0x91_u8])
    def query_interface(this : IGCThreadControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGCThreadControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGCThreadControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def thread_is_blocking_for_suspension(this : IGCThreadControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_is_blocking_for_suspension.call(this)
    end
    def suspension_starting(this : IGCThreadControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspension_starting.call(this)
    end
    def suspension_ending(this : IGCThreadControl*, generation : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspension_ending.call(this, generation)
    end

  end

  @[Extern]

  record IGCHostControlVtable,
    query_interface : Proc(IGCHostControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGCHostControl*, UInt32),
    release : Proc(IGCHostControl*, UInt32),
    request_virtual_mem_limit : Proc(IGCHostControl*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGCHostControl, lpVtbl : IGCHostControlVtable* do
    GUID = LibC::GUID.new(0x5513d564_u32, 0x8374_u16, 0x4cb9_u16, StaticArray[0xae_u8, 0xd9_u8, 0x0_u8, 0x83_u8, 0xf4_u8, 0x16_u8, 0xa_u8, 0x1d_u8])
    def query_interface(this : IGCHostControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGCHostControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGCHostControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_virtual_mem_limit(this : IGCHostControl*, sztMaxVirtualMemMB : LibC::UIntPtrT, psztNewMaxVirtualMemMB : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_virtual_mem_limit.call(this, sztMaxVirtualMemMB, psztNewMaxVirtualMemMB)
    end

  end

  @[Extern]

  record ICorThreadpoolVtable,
    query_interface : Proc(ICorThreadpool*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorThreadpool*, UInt32),
    release : Proc(ICorThreadpool*, UInt32),
    cor_register_wait_for_single_object : Proc(ICorThreadpool*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HANDLE, Win32cr::System::Threading::WAITORTIMERCALLBACK, Void*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_unregister_wait : Proc(ICorThreadpool*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_queue_user_work_item : Proc(ICorThreadpool*, Win32cr::System::Threading::LPTHREAD_START_ROUTINE, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_create_timer : Proc(ICorThreadpool*, Win32cr::Foundation::HANDLE*, Win32cr::System::Threading::WAITORTIMERCALLBACK, Void*, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_change_timer : Proc(ICorThreadpool*, Win32cr::Foundation::HANDLE, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_delete_timer : Proc(ICorThreadpool*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_bind_io_completion_callback : Proc(ICorThreadpool*, Win32cr::Foundation::HANDLE, Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE, Win32cr::Foundation::HRESULT),
    cor_call_or_queue_user_work_item : Proc(ICorThreadpool*, Win32cr::System::Threading::LPTHREAD_START_ROUTINE, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    cor_set_max_threads : Proc(ICorThreadpool*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    cor_get_max_threads : Proc(ICorThreadpool*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    cor_get_available_threads : Proc(ICorThreadpool*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorThreadpool, lpVtbl : ICorThreadpoolVtable* do
    GUID = LibC::GUID.new(0x84680d3a_u32, 0xb2c1_u16, 0x46e8_u16, StaticArray[0xac_u8, 0xc2_u8, 0xdb_u8, 0xc0_u8, 0xa3_u8, 0x59_u8, 0x15_u8, 0x9a_u8])
    def query_interface(this : ICorThreadpool*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorThreadpool*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorThreadpool*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def cor_register_wait_for_single_object(this : ICorThreadpool*, phNewWaitObject : Win32cr::Foundation::HANDLE*, hWaitObject : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, context : Void*, timeout : UInt32, executeOnlyOnce : Win32cr::Foundation::BOOL, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_register_wait_for_single_object.call(this, phNewWaitObject, hWaitObject, callback, context, timeout, executeOnlyOnce, result)
    end
    def cor_unregister_wait(this : ICorThreadpool*, hWaitObject : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_unregister_wait.call(this, hWaitObject, completion_event, result)
    end
    def cor_queue_user_work_item(this : ICorThreadpool*, function : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, context : Void*, executeOnlyOnce : Win32cr::Foundation::BOOL, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_queue_user_work_item.call(this, function, context, executeOnlyOnce, result)
    end
    def cor_create_timer(this : ICorThreadpool*, phNewTimer : Win32cr::Foundation::HANDLE*, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_create_timer.call(this, phNewTimer, callback, parameter, due_time, period, result)
    end
    def cor_change_timer(this : ICorThreadpool*, timer : Win32cr::Foundation::HANDLE, due_time : UInt32, period : UInt32, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_change_timer.call(this, timer, due_time, period, result)
    end
    def cor_delete_timer(this : ICorThreadpool*, timer : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_delete_timer.call(this, timer, completion_event, result)
    end
    def cor_bind_io_completion_callback(this : ICorThreadpool*, fileHandle : Win32cr::Foundation::HANDLE, callback : Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_bind_io_completion_callback.call(this, fileHandle, callback)
    end
    def cor_call_or_queue_user_work_item(this : ICorThreadpool*, function : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, context : Void*, result : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_call_or_queue_user_work_item.call(this, function, context, result)
    end
    def cor_set_max_threads(this : ICorThreadpool*, max_worker_threads : UInt32, max_io_completion_threads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_set_max_threads.call(this, max_worker_threads, max_io_completion_threads)
    end
    def cor_get_max_threads(this : ICorThreadpool*, max_worker_threads : UInt32*, max_io_completion_threads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_get_max_threads.call(this, max_worker_threads, max_io_completion_threads)
    end
    def cor_get_available_threads(this : ICorThreadpool*, available_worker_threads : UInt32*, available_io_completion_threads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cor_get_available_threads.call(this, available_worker_threads, available_io_completion_threads)
    end

  end

  @[Extern]

  record IDebuggerThreadControlVtable,
    query_interface : Proc(IDebuggerThreadControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebuggerThreadControl*, UInt32),
    release : Proc(IDebuggerThreadControl*, UInt32),
    thread_is_blocking_for_debugger : Proc(IDebuggerThreadControl*, Win32cr::Foundation::HRESULT),
    release_all_runtime_threads : Proc(IDebuggerThreadControl*, Win32cr::Foundation::HRESULT),
    start_blocking_for_debugger : Proc(IDebuggerThreadControl*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebuggerThreadControl, lpVtbl : IDebuggerThreadControlVtable* do
    GUID = LibC::GUID.new(0x23d86786_u32, 0xbb5_u16, 0x4774_u16, StaticArray[0x8f_u8, 0xb5_u8, 0xe3_u8, 0x52_u8, 0x2a_u8, 0xdd_u8, 0x62_u8, 0x46_u8])
    def query_interface(this : IDebuggerThreadControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebuggerThreadControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebuggerThreadControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def thread_is_blocking_for_debugger(this : IDebuggerThreadControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_is_blocking_for_debugger.call(this)
    end
    def release_all_runtime_threads(this : IDebuggerThreadControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_all_runtime_threads.call(this)
    end
    def start_blocking_for_debugger(this : IDebuggerThreadControl*, dwUnused : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_blocking_for_debugger.call(this, dwUnused)
    end

  end

  @[Extern]

  record IDebuggerInfoVtable,
    query_interface : Proc(IDebuggerInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDebuggerInfo*, UInt32),
    release : Proc(IDebuggerInfo*, UInt32),
    is_debugger_attached : Proc(IDebuggerInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDebuggerInfo, lpVtbl : IDebuggerInfoVtable* do
    GUID = LibC::GUID.new(0xbf24142d_u32, 0xa47d_u16, 0x4d24_u16, StaticArray[0xa6_u8, 0x6d_u8, 0x8c_u8, 0x21_u8, 0x41_u8, 0x94_u8, 0x4e_u8, 0x44_u8])
    def query_interface(this : IDebuggerInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDebuggerInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDebuggerInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_debugger_attached(this : IDebuggerInfo*, pbAttached : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_debugger_attached.call(this, pbAttached)
    end

  end

  @[Extern]

  record ICorConfigurationVtable,
    query_interface : Proc(ICorConfiguration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorConfiguration*, UInt32),
    release : Proc(ICorConfiguration*, UInt32),
    set_gc_thread_control : Proc(ICorConfiguration*, Void*, Win32cr::Foundation::HRESULT),
    set_gc_host_control : Proc(ICorConfiguration*, Void*, Win32cr::Foundation::HRESULT),
    set_debugger_thread_control : Proc(ICorConfiguration*, Void*, Win32cr::Foundation::HRESULT),
    add_debugger_special_thread : Proc(ICorConfiguration*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorConfiguration, lpVtbl : ICorConfigurationVtable* do
    GUID = LibC::GUID.new(0x5c2b07a5_u32, 0x1e98_u16, 0x11d3_u16, StaticArray[0x87_u8, 0x2f_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0xed_u8, 0xd_u8])
    def query_interface(this : ICorConfiguration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorConfiguration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorConfiguration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_gc_thread_control(this : ICorConfiguration*, pGCThreadControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_thread_control.call(this, pGCThreadControl)
    end
    def set_gc_host_control(this : ICorConfiguration*, pGCHostControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_host_control.call(this, pGCHostControl)
    end
    def set_debugger_thread_control(this : ICorConfiguration*, pDebuggerThreadControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_debugger_thread_control.call(this, pDebuggerThreadControl)
    end
    def add_debugger_special_thread(this : ICorConfiguration*, dwSpecialThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_debugger_special_thread.call(this, dwSpecialThreadId)
    end

  end

  @[Extern]

  record ICorRuntimeHostVtable,
    query_interface : Proc(ICorRuntimeHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICorRuntimeHost*, UInt32),
    release : Proc(ICorRuntimeHost*, UInt32),
    create_logical_thread_state : Proc(ICorRuntimeHost*, Win32cr::Foundation::HRESULT),
    delete_logical_thread_state : Proc(ICorRuntimeHost*, Win32cr::Foundation::HRESULT),
    switch_in_logical_thread_state : Proc(ICorRuntimeHost*, UInt32*, Win32cr::Foundation::HRESULT),
    switch_out_logical_thread_state : Proc(ICorRuntimeHost*, UInt32**, Win32cr::Foundation::HRESULT),
    locks_held_by_logical_thread : Proc(ICorRuntimeHost*, UInt32*, Win32cr::Foundation::HRESULT),
    map_file : Proc(ICorRuntimeHost*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HMODULE*, Win32cr::Foundation::HRESULT),
    get_configuration : Proc(ICorRuntimeHost*, Void**, Win32cr::Foundation::HRESULT),
    start : Proc(ICorRuntimeHost*, Win32cr::Foundation::HRESULT),
    stop : Proc(ICorRuntimeHost*, Win32cr::Foundation::HRESULT),
    create_domain : Proc(ICorRuntimeHost*, Win32cr::Foundation::PWSTR, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_default_domain : Proc(ICorRuntimeHost*, Void**, Win32cr::Foundation::HRESULT),
    enum_domains : Proc(ICorRuntimeHost*, Void**, Win32cr::Foundation::HRESULT),
    next_domain : Proc(ICorRuntimeHost*, Void*, Void**, Win32cr::Foundation::HRESULT),
    close_enum : Proc(ICorRuntimeHost*, Void*, Win32cr::Foundation::HRESULT),
    create_domain_ex : Proc(ICorRuntimeHost*, Win32cr::Foundation::PWSTR, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_domain_setup : Proc(ICorRuntimeHost*, Void**, Win32cr::Foundation::HRESULT),
    create_evidence : Proc(ICorRuntimeHost*, Void**, Win32cr::Foundation::HRESULT),
    unload_domain : Proc(ICorRuntimeHost*, Void*, Win32cr::Foundation::HRESULT),
    current_domain : Proc(ICorRuntimeHost*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICorRuntimeHost, lpVtbl : ICorRuntimeHostVtable* do
    GUID = LibC::GUID.new(0xcb2f6722_u32, 0xab3a_u16, 0x11d2_u16, StaticArray[0x9c_u8, 0x40_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xa3_u8, 0xa_u8, 0x3e_u8])
    def query_interface(this : ICorRuntimeHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICorRuntimeHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICorRuntimeHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_logical_thread_state(this : ICorRuntimeHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_logical_thread_state.call(this)
    end
    def delete_logical_thread_state(this : ICorRuntimeHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_logical_thread_state.call(this)
    end
    def switch_in_logical_thread_state(this : ICorRuntimeHost*, pFiberCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_in_logical_thread_state.call(this, pFiberCookie)
    end
    def switch_out_logical_thread_state(this : ICorRuntimeHost*, pFiberCookie : UInt32**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_out_logical_thread_state.call(this, pFiberCookie)
    end
    def locks_held_by_logical_thread(this : ICorRuntimeHost*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locks_held_by_logical_thread.call(this, pCount)
    end
    def map_file(this : ICorRuntimeHost*, hFile : Win32cr::Foundation::HANDLE, hMapAddress : Win32cr::Foundation::HMODULE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_file.call(this, hFile, hMapAddress)
    end
    def get_configuration(this : ICorRuntimeHost*, pConfiguration : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_configuration.call(this, pConfiguration)
    end
    def start(this : ICorRuntimeHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this)
    end
    def stop(this : ICorRuntimeHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def create_domain(this : ICorRuntimeHost*, pwzFriendlyName : Win32cr::Foundation::PWSTR, pIdentityArray : Void*, pAppDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_domain.call(this, pwzFriendlyName, pIdentityArray, pAppDomain)
    end
    def get_default_domain(this : ICorRuntimeHost*, pAppDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_domain.call(this, pAppDomain)
    end
    def enum_domains(this : ICorRuntimeHost*, hEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_domains.call(this, hEnum)
    end
    def next_domain(this : ICorRuntimeHost*, hEnum : Void*, pAppDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next_domain.call(this, hEnum, pAppDomain)
    end
    def close_enum(this : ICorRuntimeHost*, hEnum : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_enum.call(this, hEnum)
    end
    def create_domain_ex(this : ICorRuntimeHost*, pwzFriendlyName : Win32cr::Foundation::PWSTR, pSetup : Void*, pEvidence : Void*, pAppDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_domain_ex.call(this, pwzFriendlyName, pSetup, pEvidence, pAppDomain)
    end
    def create_domain_setup(this : ICorRuntimeHost*, pAppDomainSetup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_domain_setup.call(this, pAppDomainSetup)
    end
    def create_evidence(this : ICorRuntimeHost*, pEvidence : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_evidence.call(this, pEvidence)
    end
    def unload_domain(this : ICorRuntimeHost*, pAppDomain : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload_domain.call(this, pAppDomain)
    end
    def current_domain(this : ICorRuntimeHost*, pAppDomain : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.current_domain.call(this, pAppDomain)
    end

  end

  @[Extern]

  record ICLRMemoryNotificationCallbackVtable,
    query_interface : Proc(ICLRMemoryNotificationCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRMemoryNotificationCallback*, UInt32),
    release : Proc(ICLRMemoryNotificationCallback*, UInt32),
    on_memory_notification : Proc(ICLRMemoryNotificationCallback*, Win32cr::System::ClrHosting::EMemoryAvailable, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRMemoryNotificationCallback, lpVtbl : ICLRMemoryNotificationCallbackVtable* do
    GUID = LibC::GUID.new(0x47eb8e57_u32, 0x846_u16, 0x4546_u16, StaticArray[0xaf_u8, 0x76_u8, 0x6f_u8, 0x42_u8, 0xfc_u8, 0xfc_u8, 0x26_u8, 0x49_u8])
    def query_interface(this : ICLRMemoryNotificationCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRMemoryNotificationCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRMemoryNotificationCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_memory_notification(this : ICLRMemoryNotificationCallback*, eMemoryAvailable : Win32cr::System::ClrHosting::EMemoryAvailable) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_memory_notification.call(this, eMemoryAvailable)
    end

  end

  @[Extern]

  record IHostMallocVtable,
    query_interface : Proc(IHostMalloc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostMalloc*, UInt32),
    release : Proc(IHostMalloc*, UInt32),
    alloc : Proc(IHostMalloc*, LibC::UIntPtrT, Win32cr::System::ClrHosting::EMemoryCriticalLevel, Void**, Win32cr::Foundation::HRESULT),
    debug_alloc : Proc(IHostMalloc*, LibC::UIntPtrT, Win32cr::System::ClrHosting::EMemoryCriticalLevel, UInt8*, Int32, Void**, Win32cr::Foundation::HRESULT),
    free : Proc(IHostMalloc*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostMalloc, lpVtbl : IHostMallocVtable* do
    GUID = LibC::GUID.new(0x1831991c_u32, 0xcc53_u16, 0x4a31_u16, StaticArray[0xb2_u8, 0x18_u8, 0x4_u8, 0xe9_u8, 0x10_u8, 0x44_u8, 0x64_u8, 0x79_u8])
    def query_interface(this : IHostMalloc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostMalloc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostMalloc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alloc(this : IHostMalloc*, cbSize : LibC::UIntPtrT, eCriticalLevel : Win32cr::System::ClrHosting::EMemoryCriticalLevel, ppMem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alloc.call(this, cbSize, eCriticalLevel, ppMem)
    end
    def debug_alloc(this : IHostMalloc*, cbSize : LibC::UIntPtrT, eCriticalLevel : Win32cr::System::ClrHosting::EMemoryCriticalLevel, pszFileName : UInt8*, iLineNo : Int32, ppMem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.debug_alloc.call(this, cbSize, eCriticalLevel, pszFileName, iLineNo, ppMem)
    end
    def free(this : IHostMalloc*, pMem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free.call(this, pMem)
    end

  end

  @[Extern]

  record IHostMemoryManagerVtable,
    query_interface : Proc(IHostMemoryManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostMemoryManager*, UInt32),
    release : Proc(IHostMemoryManager*, UInt32),
    create_malloc : Proc(IHostMemoryManager*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    virtual_alloc : Proc(IHostMemoryManager*, Void*, LibC::UIntPtrT, UInt32, UInt32, Win32cr::System::ClrHosting::EMemoryCriticalLevel, Void**, Win32cr::Foundation::HRESULT),
    virtual_free : Proc(IHostMemoryManager*, Void*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::HRESULT),
    virtual_query : Proc(IHostMemoryManager*, Void*, Void*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    virtual_protect : Proc(IHostMemoryManager*, Void*, LibC::UIntPtrT, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_memory_load : Proc(IHostMemoryManager*, UInt32*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    register_memory_notification_callback : Proc(IHostMemoryManager*, Void*, Win32cr::Foundation::HRESULT),
    needs_virtual_address_space : Proc(IHostMemoryManager*, Void*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    acquired_virtual_address_space : Proc(IHostMemoryManager*, Void*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    released_virtual_address_space : Proc(IHostMemoryManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostMemoryManager, lpVtbl : IHostMemoryManagerVtable* do
    GUID = LibC::GUID.new(0x7bc698d1_u32, 0xf9e3_u16, 0x4460_u16, StaticArray[0x9c_u8, 0xde_u8, 0xd0_u8, 0x42_u8, 0x48_u8, 0xe9_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IHostMemoryManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostMemoryManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostMemoryManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_malloc(this : IHostMemoryManager*, dwMallocType : UInt32, ppMalloc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_malloc.call(this, dwMallocType, ppMalloc)
    end
    def virtual_alloc(this : IHostMemoryManager*, pAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : UInt32, flProtect : UInt32, eCriticalLevel : Win32cr::System::ClrHosting::EMemoryCriticalLevel, ppMem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.virtual_alloc.call(this, pAddress, dwSize, flAllocationType, flProtect, eCriticalLevel, ppMem)
    end
    def virtual_free(this : IHostMemoryManager*, lpAddress : Void*, dwSize : LibC::UIntPtrT, dwFreeType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.virtual_free.call(this, lpAddress, dwSize, dwFreeType)
    end
    def virtual_query(this : IHostMemoryManager*, lpAddress : Void*, lpBuffer : Void*, dwLength : LibC::UIntPtrT, pResult : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.virtual_query.call(this, lpAddress, lpBuffer, dwLength, pResult)
    end
    def virtual_protect(this : IHostMemoryManager*, lpAddress : Void*, dwSize : LibC::UIntPtrT, flNewProtect : UInt32, pflOldProtect : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.virtual_protect.call(this, lpAddress, dwSize, flNewProtect, pflOldProtect)
    end
    def get_memory_load(this : IHostMemoryManager*, pMemoryLoad : UInt32*, pAvailableBytes : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_memory_load.call(this, pMemoryLoad, pAvailableBytes)
    end
    def register_memory_notification_callback(this : IHostMemoryManager*, pCallback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_memory_notification_callback.call(this, pCallback)
    end
    def needs_virtual_address_space(this : IHostMemoryManager*, startAddress : Void*, size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.needs_virtual_address_space.call(this, startAddress, size)
    end
    def acquired_virtual_address_space(this : IHostMemoryManager*, startAddress : Void*, size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquired_virtual_address_space.call(this, startAddress, size)
    end
    def released_virtual_address_space(this : IHostMemoryManager*, startAddress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.released_virtual_address_space.call(this, startAddress)
    end

  end

  @[Extern]

  record ICLRTaskVtable,
    query_interface : Proc(ICLRTask*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRTask*, UInt32),
    release : Proc(ICLRTask*, UInt32),
    switch_in : Proc(ICLRTask*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    switch_out : Proc(ICLRTask*, Win32cr::Foundation::HRESULT),
    get_mem_stats : Proc(ICLRTask*, Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*, Win32cr::Foundation::HRESULT),
    reset : Proc(ICLRTask*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    exit_task : Proc(ICLRTask*, Win32cr::Foundation::HRESULT),
    abort : Proc(ICLRTask*, Win32cr::Foundation::HRESULT),
    rude_abort : Proc(ICLRTask*, Win32cr::Foundation::HRESULT),
    needs_priority_scheduling : Proc(ICLRTask*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    yield_task : Proc(ICLRTask*, Win32cr::Foundation::HRESULT),
    locks_held : Proc(ICLRTask*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_task_identifier : Proc(ICLRTask*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRTask, lpVtbl : ICLRTaskVtable* do
    GUID = LibC::GUID.new(0x28e66a4a_u32, 0x9906_u16, 0x4225_u16, StaticArray[0xb2_u8, 0x31_u8, 0x91_u8, 0x87_u8, 0xc3_u8, 0xeb_u8, 0x86_u8, 0x11_u8])
    def query_interface(this : ICLRTask*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRTask*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRTask*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def switch_in(this : ICLRTask*, threadHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_in.call(this, threadHandle)
    end
    def switch_out(this : ICLRTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_out.call(this)
    end
    def get_mem_stats(this : ICLRTask*, memUsage : Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mem_stats.call(this, memUsage)
    end
    def reset(this : ICLRTask*, fFull : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, fFull)
    end
    def exit_task(this : ICLRTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exit_task.call(this)
    end
    def abort(this : ICLRTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def rude_abort(this : ICLRTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rude_abort.call(this)
    end
    def needs_priority_scheduling(this : ICLRTask*, pbNeedsPriorityScheduling : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.needs_priority_scheduling.call(this, pbNeedsPriorityScheduling)
    end
    def yield_task(this : ICLRTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.yield_task.call(this)
    end
    def locks_held(this : ICLRTask*, pLockCount : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locks_held.call(this, pLockCount)
    end
    def set_task_identifier(this : ICLRTask*, asked : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_task_identifier.call(this, asked)
    end

  end

  @[Extern]

  record ICLRTask2Vtable,
    query_interface : Proc(ICLRTask2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRTask2*, UInt32),
    release : Proc(ICLRTask2*, UInt32),
    switch_in : Proc(ICLRTask2*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    switch_out : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT),
    get_mem_stats : Proc(ICLRTask2*, Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*, Win32cr::Foundation::HRESULT),
    reset : Proc(ICLRTask2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    exit_task : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT),
    abort : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT),
    rude_abort : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT),
    needs_priority_scheduling : Proc(ICLRTask2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    yield_task : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT),
    locks_held : Proc(ICLRTask2*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    set_task_identifier : Proc(ICLRTask2*, UInt64, Win32cr::Foundation::HRESULT),
    begin_prevent_async_abort : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT),
    end_prevent_async_abort : Proc(ICLRTask2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRTask2, lpVtbl : ICLRTask2Vtable* do
    GUID = LibC::GUID.new(0x28e66a4a_u32, 0x9906_u16, 0x4225_u16, StaticArray[0xb2_u8, 0x31_u8, 0x91_u8, 0x87_u8, 0xc3_u8, 0xeb_u8, 0x86_u8, 0x12_u8])
    def query_interface(this : ICLRTask2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRTask2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRTask2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def switch_in(this : ICLRTask2*, threadHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_in.call(this, threadHandle)
    end
    def switch_out(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_out.call(this)
    end
    def get_mem_stats(this : ICLRTask2*, memUsage : Win32cr::System::ClrHosting::COR_GC_THREAD_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mem_stats.call(this, memUsage)
    end
    def reset(this : ICLRTask2*, fFull : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this, fFull)
    end
    def exit_task(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exit_task.call(this)
    end
    def abort(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def rude_abort(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rude_abort.call(this)
    end
    def needs_priority_scheduling(this : ICLRTask2*, pbNeedsPriorityScheduling : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.needs_priority_scheduling.call(this, pbNeedsPriorityScheduling)
    end
    def yield_task(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.yield_task.call(this)
    end
    def locks_held(this : ICLRTask2*, pLockCount : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.locks_held.call(this, pLockCount)
    end
    def set_task_identifier(this : ICLRTask2*, asked : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_task_identifier.call(this, asked)
    end
    def begin_prevent_async_abort(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prevent_async_abort.call(this)
    end
    def end_prevent_async_abort(this : ICLRTask2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_prevent_async_abort.call(this)
    end

  end

  @[Extern]

  record IHostTaskVtable,
    query_interface : Proc(IHostTask*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostTask*, UInt32),
    release : Proc(IHostTask*, UInt32),
    start : Proc(IHostTask*, Win32cr::Foundation::HRESULT),
    alert : Proc(IHostTask*, Win32cr::Foundation::HRESULT),
    join : Proc(IHostTask*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_priority : Proc(IHostTask*, Int32, Win32cr::Foundation::HRESULT),
    get_priority : Proc(IHostTask*, Int32*, Win32cr::Foundation::HRESULT),
    set_clr_task : Proc(IHostTask*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostTask, lpVtbl : IHostTaskVtable* do
    GUID = LibC::GUID.new(0xc2275828_u32, 0xc4b1_u16, 0x4b55_u16, StaticArray[0x82_u8, 0xc9_u8, 0x92_u8, 0x13_u8, 0x5f_u8, 0x74_u8, 0xdf_u8, 0x1a_u8])
    def query_interface(this : IHostTask*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostTask*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostTask*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : IHostTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this)
    end
    def alert(this : IHostTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alert.call(this)
    end
    def join(this : IHostTask*, dwMilliseconds : UInt32, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.join.call(this, dwMilliseconds, option)
    end
    def set_priority(this : IHostTask*, newPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, newPriority)
    end
    def get_priority(this : IHostTask*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pPriority)
    end
    def set_clr_task(this : IHostTask*, pCLRTask : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clr_task.call(this, pCLRTask)
    end

  end

  @[Extern]

  record ICLRTaskManagerVtable,
    query_interface : Proc(ICLRTaskManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRTaskManager*, UInt32),
    release : Proc(ICLRTaskManager*, UInt32),
    create_task : Proc(ICLRTaskManager*, Void**, Win32cr::Foundation::HRESULT),
    get_current_task : Proc(ICLRTaskManager*, Void**, Win32cr::Foundation::HRESULT),
    set_ui_locale : Proc(ICLRTaskManager*, UInt32, Win32cr::Foundation::HRESULT),
    set_locale : Proc(ICLRTaskManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_current_task_type : Proc(ICLRTaskManager*, Win32cr::System::ClrHosting::ETaskType*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRTaskManager, lpVtbl : ICLRTaskManagerVtable* do
    GUID = LibC::GUID.new(0x4862efbe_u32, 0x3ae5_u16, 0x44f8_u16, StaticArray[0x8f_u8, 0xeb_u8, 0x34_u8, 0x61_u8, 0x90_u8, 0xee_u8, 0x8a_u8, 0x34_u8])
    def query_interface(this : ICLRTaskManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRTaskManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRTaskManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_task(this : ICLRTaskManager*, pTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, pTask)
    end
    def get_current_task(this : ICLRTaskManager*, pTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_task.call(this, pTask)
    end
    def set_ui_locale(this : ICLRTaskManager*, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_ui_locale.call(this, lcid)
    end
    def set_locale(this : ICLRTaskManager*, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_locale.call(this, lcid)
    end
    def get_current_task_type(this : ICLRTaskManager*, pTaskType : Win32cr::System::ClrHosting::ETaskType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_task_type.call(this, pTaskType)
    end

  end

  @[Extern]

  record IHostTaskManagerVtable,
    query_interface : Proc(IHostTaskManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostTaskManager*, UInt32),
    release : Proc(IHostTaskManager*, UInt32),
    get_current_task : Proc(IHostTaskManager*, Void**, Win32cr::Foundation::HRESULT),
    create_task : Proc(IHostTaskManager*, UInt32, Win32cr::System::Threading::LPTHREAD_START_ROUTINE, Void*, Void**, Win32cr::Foundation::HRESULT),
    sleep : Proc(IHostTaskManager*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    switch_to_task : Proc(IHostTaskManager*, UInt32, Win32cr::Foundation::HRESULT),
    set_ui_locale : Proc(IHostTaskManager*, UInt32, Win32cr::Foundation::HRESULT),
    set_locale : Proc(IHostTaskManager*, UInt32, Win32cr::Foundation::HRESULT),
    call_needs_host_hook : Proc(IHostTaskManager*, LibC::UIntPtrT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    leave_runtime : Proc(IHostTaskManager*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    enter_runtime : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    reverse_leave_runtime : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    reverse_enter_runtime : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    begin_delay_abort : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    end_delay_abort : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    begin_thread_affinity : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    end_thread_affinity : Proc(IHostTaskManager*, Win32cr::Foundation::HRESULT),
    set_stack_guarantee : Proc(IHostTaskManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_stack_guarantee : Proc(IHostTaskManager*, UInt32*, Win32cr::Foundation::HRESULT),
    set_clr_task_manager : Proc(IHostTaskManager*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostTaskManager, lpVtbl : IHostTaskManagerVtable* do
    GUID = LibC::GUID.new(0x997ff24c_u32, 0x43b7_u16, 0x4352_u16, StaticArray[0x86_u8, 0x67_u8, 0xd_u8, 0xc0_u8, 0x4f_u8, 0xaf_u8, 0xd3_u8, 0x54_u8])
    def query_interface(this : IHostTaskManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostTaskManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostTaskManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_task(this : IHostTaskManager*, pTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_task.call(this, pTask)
    end
    def create_task(this : IHostTaskManager*, dwStackSize : UInt32, pStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, pParameter : Void*, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_task.call(this, dwStackSize, pStartAddress, pParameter, ppTask)
    end
    def sleep(this : IHostTaskManager*, dwMilliseconds : UInt32, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sleep.call(this, dwMilliseconds, option)
    end
    def switch_to_task(this : IHostTaskManager*, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.switch_to_task.call(this, option)
    end
    def set_ui_locale(this : IHostTaskManager*, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_ui_locale.call(this, lcid)
    end
    def set_locale(this : IHostTaskManager*, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_locale.call(this, lcid)
    end
    def call_needs_host_hook(this : IHostTaskManager*, target : LibC::UIntPtrT, pbCallNeedsHostHook : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.call_needs_host_hook.call(this, target, pbCallNeedsHostHook)
    end
    def leave_runtime(this : IHostTaskManager*, target : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.leave_runtime.call(this, target)
    end
    def enter_runtime(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enter_runtime.call(this)
    end
    def reverse_leave_runtime(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reverse_leave_runtime.call(this)
    end
    def reverse_enter_runtime(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reverse_enter_runtime.call(this)
    end
    def begin_delay_abort(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_delay_abort.call(this)
    end
    def end_delay_abort(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_delay_abort.call(this)
    end
    def begin_thread_affinity(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_thread_affinity.call(this)
    end
    def end_thread_affinity(this : IHostTaskManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_thread_affinity.call(this)
    end
    def set_stack_guarantee(this : IHostTaskManager*, guarantee : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stack_guarantee.call(this, guarantee)
    end
    def get_stack_guarantee(this : IHostTaskManager*, pGuarantee : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stack_guarantee.call(this, pGuarantee)
    end
    def set_clr_task_manager(this : IHostTaskManager*, ppManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clr_task_manager.call(this, ppManager)
    end

  end

  @[Extern]

  record IHostThreadpoolManagerVtable,
    query_interface : Proc(IHostThreadpoolManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostThreadpoolManager*, UInt32),
    release : Proc(IHostThreadpoolManager*, UInt32),
    queue_user_work_item : Proc(IHostThreadpoolManager*, Win32cr::System::Threading::LPTHREAD_START_ROUTINE, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_max_threads : Proc(IHostThreadpoolManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_threads : Proc(IHostThreadpoolManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_available_threads : Proc(IHostThreadpoolManager*, UInt32*, Win32cr::Foundation::HRESULT),
    set_min_threads : Proc(IHostThreadpoolManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_min_threads : Proc(IHostThreadpoolManager*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostThreadpoolManager, lpVtbl : IHostThreadpoolManagerVtable* do
    GUID = LibC::GUID.new(0x983d50e2_u32, 0xcb15_u16, 0x466b_u16, StaticArray[0x80_u8, 0xfc_u8, 0x84_u8, 0x5d_u8, 0xc6_u8, 0xe8_u8, 0xc5_u8, 0xfd_u8])
    def query_interface(this : IHostThreadpoolManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostThreadpoolManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostThreadpoolManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def queue_user_work_item(this : IHostThreadpoolManager*, function : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, context : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.queue_user_work_item.call(this, function, context, flags)
    end
    def set_max_threads(this : IHostThreadpoolManager*, dwMaxWorkerThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_threads.call(this, dwMaxWorkerThreads)
    end
    def get_max_threads(this : IHostThreadpoolManager*, pdwMaxWorkerThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_threads.call(this, pdwMaxWorkerThreads)
    end
    def get_available_threads(this : IHostThreadpoolManager*, pdwAvailableWorkerThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_threads.call(this, pdwAvailableWorkerThreads)
    end
    def set_min_threads(this : IHostThreadpoolManager*, dwMinIOCompletionThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_threads.call(this, dwMinIOCompletionThreads)
    end
    def get_min_threads(this : IHostThreadpoolManager*, pdwMinIOCompletionThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_threads.call(this, pdwMinIOCompletionThreads)
    end

  end

  @[Extern]

  record ICLRIoCompletionManagerVtable,
    query_interface : Proc(ICLRIoCompletionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRIoCompletionManager*, UInt32),
    release : Proc(ICLRIoCompletionManager*, UInt32),
    on_complete : Proc(ICLRIoCompletionManager*, UInt32, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRIoCompletionManager, lpVtbl : ICLRIoCompletionManagerVtable* do
    GUID = LibC::GUID.new(0x2d74ce86_u32, 0xb8d6_u16, 0x4c84_u16, StaticArray[0xb3_u8, 0xa7_u8, 0x97_u8, 0x68_u8, 0x93_u8, 0x3b_u8, 0x3c_u8, 0x12_u8])
    def query_interface(this : ICLRIoCompletionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRIoCompletionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRIoCompletionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_complete(this : ICLRIoCompletionManager*, dwErrorCode : UInt32, number_of_bytes_transferred : UInt32, pvOverlapped : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_complete.call(this, dwErrorCode, number_of_bytes_transferred, pvOverlapped)
    end

  end

  @[Extern]

  record IHostIoCompletionManagerVtable,
    query_interface : Proc(IHostIoCompletionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostIoCompletionManager*, UInt32),
    release : Proc(IHostIoCompletionManager*, UInt32),
    create_io_completion_port : Proc(IHostIoCompletionManager*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    close_io_completion_port : Proc(IHostIoCompletionManager*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    set_max_threads : Proc(IHostIoCompletionManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_threads : Proc(IHostIoCompletionManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_available_threads : Proc(IHostIoCompletionManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_host_overlapped_size : Proc(IHostIoCompletionManager*, UInt32*, Win32cr::Foundation::HRESULT),
    set_clr_io_completion_manager : Proc(IHostIoCompletionManager*, Void*, Win32cr::Foundation::HRESULT),
    initialize_host_overlapped : Proc(IHostIoCompletionManager*, Void*, Win32cr::Foundation::HRESULT),
    bind : Proc(IHostIoCompletionManager*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    set_min_threads : Proc(IHostIoCompletionManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_min_threads : Proc(IHostIoCompletionManager*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostIoCompletionManager, lpVtbl : IHostIoCompletionManagerVtable* do
    GUID = LibC::GUID.new(0x8bde9d80_u32, 0xec06_u16, 0x41d6_u16, StaticArray[0x83_u8, 0xe6_u8, 0x22_u8, 0x58_u8, 0xe_u8, 0xff_u8, 0xcc_u8, 0x20_u8])
    def query_interface(this : IHostIoCompletionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostIoCompletionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostIoCompletionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_io_completion_port(this : IHostIoCompletionManager*, phPort : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_io_completion_port.call(this, phPort)
    end
    def close_io_completion_port(this : IHostIoCompletionManager*, hPort : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_io_completion_port.call(this, hPort)
    end
    def set_max_threads(this : IHostIoCompletionManager*, dwMaxIOCompletionThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_threads.call(this, dwMaxIOCompletionThreads)
    end
    def get_max_threads(this : IHostIoCompletionManager*, pdwMaxIOCompletionThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_threads.call(this, pdwMaxIOCompletionThreads)
    end
    def get_available_threads(this : IHostIoCompletionManager*, pdwAvailableIOCompletionThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_available_threads.call(this, pdwAvailableIOCompletionThreads)
    end
    def get_host_overlapped_size(this : IHostIoCompletionManager*, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_overlapped_size.call(this, pcbSize)
    end
    def set_clr_io_completion_manager(this : IHostIoCompletionManager*, pManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clr_io_completion_manager.call(this, pManager)
    end
    def initialize_host_overlapped(this : IHostIoCompletionManager*, pvOverlapped : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_host_overlapped.call(this, pvOverlapped)
    end
    def bind(this : IHostIoCompletionManager*, hPort : Win32cr::Foundation::HANDLE, hHandle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind.call(this, hPort, hHandle)
    end
    def set_min_threads(this : IHostIoCompletionManager*, dwMinIOCompletionThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_threads.call(this, dwMinIOCompletionThreads)
    end
    def get_min_threads(this : IHostIoCompletionManager*, pdwMinIOCompletionThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_threads.call(this, pdwMinIOCompletionThreads)
    end

  end

  @[Extern]

  record ICLRDebugManagerVtable,
    query_interface : Proc(ICLRDebugManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRDebugManager*, UInt32),
    release : Proc(ICLRDebugManager*, UInt32),
    begin_connection : Proc(ICLRDebugManager*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_connection_tasks : Proc(ICLRDebugManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    end_connection : Proc(ICLRDebugManager*, UInt32, Win32cr::Foundation::HRESULT),
    set_dacl : Proc(ICLRDebugManager*, Win32cr::Security::ACL*, Win32cr::Foundation::HRESULT),
    get_dacl : Proc(ICLRDebugManager*, Win32cr::Security::ACL**, Win32cr::Foundation::HRESULT),
    is_debugger_attached : Proc(ICLRDebugManager*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_symbol_reading_policy : Proc(ICLRDebugManager*, Win32cr::System::ClrHosting::ESymbolReadingPolicy, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRDebugManager, lpVtbl : ICLRDebugManagerVtable* do
    GUID = LibC::GUID.new(0xdcaec6_u32, 0x2ac0_u16, 0x43a9_u16, StaticArray[0xac_u8, 0xf9_u8, 0x1e_u8, 0x36_u8, 0xc1_u8, 0x39_u8, 0xb1_u8, 0xd_u8])
    def query_interface(this : ICLRDebugManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRDebugManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRDebugManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_connection(this : ICLRDebugManager*, dwConnectionId : UInt32, szConnectionName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_connection.call(this, dwConnectionId, szConnectionName)
    end
    def set_connection_tasks(this : ICLRDebugManager*, id : UInt32, dwCount : UInt32, ppCLRTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_connection_tasks.call(this, id, dwCount, ppCLRTask)
    end
    def end_connection(this : ICLRDebugManager*, dwConnectionId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_connection.call(this, dwConnectionId)
    end
    def set_dacl(this : ICLRDebugManager*, pacl : Win32cr::Security::ACL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dacl.call(this, pacl)
    end
    def get_dacl(this : ICLRDebugManager*, pacl : Win32cr::Security::ACL**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_dacl.call(this, pacl)
    end
    def is_debugger_attached(this : ICLRDebugManager*, pbAttached : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_debugger_attached.call(this, pbAttached)
    end
    def set_symbol_reading_policy(this : ICLRDebugManager*, policy : Win32cr::System::ClrHosting::ESymbolReadingPolicy) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_symbol_reading_policy.call(this, policy)
    end

  end

  @[Extern]

  record ICLRErrorReportingManagerVtable,
    query_interface : Proc(ICLRErrorReportingManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRErrorReportingManager*, UInt32),
    release : Proc(ICLRErrorReportingManager*, UInt32),
    get_bucket_parameters_for_current_exception : Proc(ICLRErrorReportingManager*, Win32cr::System::ClrHosting::BucketParameters*, Win32cr::Foundation::HRESULT),
    begin_custom_dump : Proc(ICLRErrorReportingManager*, Win32cr::System::ClrHosting::ECustomDumpFlavor, UInt32, Win32cr::System::ClrHosting::CustomDumpItem*, UInt32, Win32cr::Foundation::HRESULT),
    end_custom_dump : Proc(ICLRErrorReportingManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRErrorReportingManager, lpVtbl : ICLRErrorReportingManagerVtable* do
    GUID = LibC::GUID.new(0x980d2f1a_u32, 0xbf79_u16, 0x4c08_u16, StaticArray[0x81_u8, 0x2a_u8, 0xbb_u8, 0x97_u8, 0x78_u8, 0x92_u8, 0x8f_u8, 0x78_u8])
    def query_interface(this : ICLRErrorReportingManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRErrorReportingManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRErrorReportingManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_bucket_parameters_for_current_exception(this : ICLRErrorReportingManager*, pParams : Win32cr::System::ClrHosting::BucketParameters*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bucket_parameters_for_current_exception.call(this, pParams)
    end
    def begin_custom_dump(this : ICLRErrorReportingManager*, dwFlavor : Win32cr::System::ClrHosting::ECustomDumpFlavor, dwNumItems : UInt32, items : Win32cr::System::ClrHosting::CustomDumpItem*, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_custom_dump.call(this, dwFlavor, dwNumItems, items, dwReserved)
    end
    def end_custom_dump(this : ICLRErrorReportingManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_custom_dump.call(this)
    end

  end

  @[Extern]

  record IHostCrstVtable,
    query_interface : Proc(IHostCrst*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostCrst*, UInt32),
    release : Proc(IHostCrst*, UInt32),
    enter : Proc(IHostCrst*, UInt32, Win32cr::Foundation::HRESULT),
    leave : Proc(IHostCrst*, Win32cr::Foundation::HRESULT),
    try_enter : Proc(IHostCrst*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_spin_count : Proc(IHostCrst*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostCrst, lpVtbl : IHostCrstVtable* do
    GUID = LibC::GUID.new(0x6df710a6_u32, 0x26a4_u16, 0x4a65_u16, StaticArray[0x8c_u8, 0xd5_u8, 0x72_u8, 0x37_u8, 0xb8_u8, 0xbd_u8, 0xa8_u8, 0xdc_u8])
    def query_interface(this : IHostCrst*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostCrst*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostCrst*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enter(this : IHostCrst*, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enter.call(this, option)
    end
    def leave(this : IHostCrst*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.leave.call(this)
    end
    def try_enter(this : IHostCrst*, option : UInt32, pbSucceeded : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.try_enter.call(this, option, pbSucceeded)
    end
    def set_spin_count(this : IHostCrst*, dwSpinCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_spin_count.call(this, dwSpinCount)
    end

  end

  @[Extern]

  record IHostAutoEventVtable,
    query_interface : Proc(IHostAutoEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostAutoEvent*, UInt32),
    release : Proc(IHostAutoEvent*, UInt32),
    wait : Proc(IHostAutoEvent*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set : Proc(IHostAutoEvent*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostAutoEvent, lpVtbl : IHostAutoEventVtable* do
    GUID = LibC::GUID.new(0x50b0cfce_u32, 0x4063_u16, 0x4278_u16, StaticArray[0x96_u8, 0x73_u8, 0xe5_u8, 0xcb_u8, 0x4e_u8, 0xd0_u8, 0xbd_u8, 0xb8_u8])
    def query_interface(this : IHostAutoEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostAutoEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostAutoEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait(this : IHostAutoEvent*, dwMilliseconds : UInt32, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwMilliseconds, option)
    end
    def set(this : IHostAutoEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set.call(this)
    end

  end

  @[Extern]

  record IHostManualEventVtable,
    query_interface : Proc(IHostManualEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostManualEvent*, UInt32),
    release : Proc(IHostManualEvent*, UInt32),
    wait : Proc(IHostManualEvent*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IHostManualEvent*, Win32cr::Foundation::HRESULT),
    set : Proc(IHostManualEvent*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostManualEvent, lpVtbl : IHostManualEventVtable* do
    GUID = LibC::GUID.new(0x1bf4ec38_u32, 0xaffe_u16, 0x4fb9_u16, StaticArray[0x85_u8, 0xa6_u8, 0x52_u8, 0x52_u8, 0x68_u8, 0xf1_u8, 0x5b_u8, 0x54_u8])
    def query_interface(this : IHostManualEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostManualEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostManualEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait(this : IHostManualEvent*, dwMilliseconds : UInt32, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwMilliseconds, option)
    end
    def reset(this : IHostManualEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def set(this : IHostManualEvent*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set.call(this)
    end

  end

  @[Extern]

  record IHostSemaphoreVtable,
    query_interface : Proc(IHostSemaphore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostSemaphore*, UInt32),
    release : Proc(IHostSemaphore*, UInt32),
    wait : Proc(IHostSemaphore*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    release_semaphore : Proc(IHostSemaphore*, Int32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostSemaphore, lpVtbl : IHostSemaphoreVtable* do
    GUID = LibC::GUID.new(0x855efd47_u32, 0xcc09_u16, 0x463a_u16, StaticArray[0xa9_u8, 0x7d_u8, 0x16_u8, 0xac_u8, 0xab_u8, 0x88_u8, 0x26_u8, 0x61_u8])
    def query_interface(this : IHostSemaphore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostSemaphore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostSemaphore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def wait(this : IHostSemaphore*, dwMilliseconds : UInt32, option : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait.call(this, dwMilliseconds, option)
    end
    def release_semaphore(this : IHostSemaphore*, lReleaseCount : Int32, lpPreviousCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_semaphore.call(this, lReleaseCount, lpPreviousCount)
    end

  end

  @[Extern]

  record ICLRSyncManagerVtable,
    query_interface : Proc(ICLRSyncManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRSyncManager*, UInt32),
    release : Proc(ICLRSyncManager*, UInt32),
    get_monitor_owner : Proc(ICLRSyncManager*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    create_rw_lock_owner_iterator : Proc(ICLRSyncManager*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    get_rw_lock_owner_next : Proc(ICLRSyncManager*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    delete_rw_lock_owner_iterator : Proc(ICLRSyncManager*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRSyncManager, lpVtbl : ICLRSyncManagerVtable* do
    GUID = LibC::GUID.new(0x55ff199d_u32, 0xad21_u16, 0x48f9_u16, StaticArray[0xa1_u8, 0x6c_u8, 0xf2_u8, 0x4e_u8, 0xbb_u8, 0xb8_u8, 0x72_u8, 0x7d_u8])
    def query_interface(this : ICLRSyncManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRSyncManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRSyncManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_monitor_owner(this : ICLRSyncManager*, cookie : LibC::UIntPtrT, ppOwnerHostTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_monitor_owner.call(this, cookie, ppOwnerHostTask)
    end
    def create_rw_lock_owner_iterator(this : ICLRSyncManager*, cookie : LibC::UIntPtrT, pIterator : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rw_lock_owner_iterator.call(this, cookie, pIterator)
    end
    def get_rw_lock_owner_next(this : ICLRSyncManager*, iterator : LibC::UIntPtrT, ppOwnerHostTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rw_lock_owner_next.call(this, iterator, ppOwnerHostTask)
    end
    def delete_rw_lock_owner_iterator(this : ICLRSyncManager*, iterator : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_rw_lock_owner_iterator.call(this, iterator)
    end

  end

  @[Extern]

  record IHostSyncManagerVtable,
    query_interface : Proc(IHostSyncManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostSyncManager*, UInt32),
    release : Proc(IHostSyncManager*, UInt32),
    set_clr_sync_manager : Proc(IHostSyncManager*, Void*, Win32cr::Foundation::HRESULT),
    create_crst : Proc(IHostSyncManager*, Void**, Win32cr::Foundation::HRESULT),
    create_crst_with_spin_count : Proc(IHostSyncManager*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_auto_event : Proc(IHostSyncManager*, Void**, Win32cr::Foundation::HRESULT),
    create_manual_event : Proc(IHostSyncManager*, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_monitor_event : Proc(IHostSyncManager*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    create_rw_lock_writer_event : Proc(IHostSyncManager*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    create_rw_lock_reader_event : Proc(IHostSyncManager*, Win32cr::Foundation::BOOL, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT),
    create_semaphore_a : Proc(IHostSyncManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostSyncManager, lpVtbl : IHostSyncManagerVtable* do
    GUID = LibC::GUID.new(0x234330c7_u32, 0x5f10_u16, 0x4f20_u16, StaticArray[0x96_u8, 0x15_u8, 0x51_u8, 0x22_u8, 0xda_u8, 0xb7_u8, 0xa0_u8, 0xac_u8])
    def query_interface(this : IHostSyncManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostSyncManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostSyncManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_clr_sync_manager(this : IHostSyncManager*, pManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clr_sync_manager.call(this, pManager)
    end
    def create_crst(this : IHostSyncManager*, ppCrst : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_crst.call(this, ppCrst)
    end
    def create_crst_with_spin_count(this : IHostSyncManager*, dwSpinCount : UInt32, ppCrst : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_crst_with_spin_count.call(this, dwSpinCount, ppCrst)
    end
    def create_auto_event(this : IHostSyncManager*, ppEvent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_auto_event.call(this, ppEvent)
    end
    def create_manual_event(this : IHostSyncManager*, bInitialState : Win32cr::Foundation::BOOL, ppEvent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_manual_event.call(this, bInitialState, ppEvent)
    end
    def create_monitor_event(this : IHostSyncManager*, cookie : LibC::UIntPtrT, ppEvent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_monitor_event.call(this, cookie, ppEvent)
    end
    def create_rw_lock_writer_event(this : IHostSyncManager*, cookie : LibC::UIntPtrT, ppEvent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rw_lock_writer_event.call(this, cookie, ppEvent)
    end
    def create_rw_lock_reader_event(this : IHostSyncManager*, bInitialState : Win32cr::Foundation::BOOL, cookie : LibC::UIntPtrT, ppEvent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rw_lock_reader_event.call(this, bInitialState, cookie, ppEvent)
    end
    def create_semaphore_a(this : IHostSyncManager*, dwInitial : UInt32, dwMax : UInt32, ppSemaphore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_semaphore_a.call(this, dwInitial, dwMax, ppSemaphore)
    end

  end

  @[Extern]

  record ICLRPolicyManagerVtable,
    query_interface : Proc(ICLRPolicyManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRPolicyManager*, UInt32),
    release : Proc(ICLRPolicyManager*, UInt32),
    set_default_action : Proc(ICLRPolicyManager*, Win32cr::System::ClrHosting::EClrOperation, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT),
    set_timeout : Proc(ICLRPolicyManager*, Win32cr::System::ClrHosting::EClrOperation, UInt32, Win32cr::Foundation::HRESULT),
    set_action_on_timeout : Proc(ICLRPolicyManager*, Win32cr::System::ClrHosting::EClrOperation, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT),
    set_timeout_and_action : Proc(ICLRPolicyManager*, Win32cr::System::ClrHosting::EClrOperation, UInt32, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT),
    set_action_on_failure : Proc(ICLRPolicyManager*, Win32cr::System::ClrHosting::EClrFailure, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT),
    set_unhandled_exception_policy : Proc(ICLRPolicyManager*, Win32cr::System::ClrHosting::EClrUnhandledException, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRPolicyManager, lpVtbl : ICLRPolicyManagerVtable* do
    GUID = LibC::GUID.new(0x7d290010_u32, 0xd781_u16, 0x45da_u16, StaticArray[0xa6_u8, 0xf8_u8, 0xaa_u8, 0x5d_u8, 0x71_u8, 0x1a_u8, 0x73_u8, 0xe_u8])
    def query_interface(this : ICLRPolicyManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRPolicyManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRPolicyManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_default_action(this : ICLRPolicyManager*, operation : Win32cr::System::ClrHosting::EClrOperation, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_action.call(this, operation, action)
    end
    def set_timeout(this : ICLRPolicyManager*, operation : Win32cr::System::ClrHosting::EClrOperation, dwMilliseconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_timeout.call(this, operation, dwMilliseconds)
    end
    def set_action_on_timeout(this : ICLRPolicyManager*, operation : Win32cr::System::ClrHosting::EClrOperation, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_action_on_timeout.call(this, operation, action)
    end
    def set_timeout_and_action(this : ICLRPolicyManager*, operation : Win32cr::System::ClrHosting::EClrOperation, dwMilliseconds : UInt32, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_timeout_and_action.call(this, operation, dwMilliseconds, action)
    end
    def set_action_on_failure(this : ICLRPolicyManager*, failure : Win32cr::System::ClrHosting::EClrFailure, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_action_on_failure.call(this, failure, action)
    end
    def set_unhandled_exception_policy(this : ICLRPolicyManager*, policy : Win32cr::System::ClrHosting::EClrUnhandledException) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_unhandled_exception_policy.call(this, policy)
    end

  end

  @[Extern]

  record IHostPolicyManagerVtable,
    query_interface : Proc(IHostPolicyManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostPolicyManager*, UInt32),
    release : Proc(IHostPolicyManager*, UInt32),
    on_default_action : Proc(IHostPolicyManager*, Win32cr::System::ClrHosting::EClrOperation, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT),
    on_timeout : Proc(IHostPolicyManager*, Win32cr::System::ClrHosting::EClrOperation, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT),
    on_failure : Proc(IHostPolicyManager*, Win32cr::System::ClrHosting::EClrFailure, Win32cr::System::ClrHosting::EPolicyAction, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostPolicyManager, lpVtbl : IHostPolicyManagerVtable* do
    GUID = LibC::GUID.new(0x7ae49844_u32, 0xb1e3_u16, 0x4683_u16, StaticArray[0xba_u8, 0x7c_u8, 0x1e_u8, 0x82_u8, 0x12_u8, 0xea_u8, 0x3b_u8, 0x79_u8])
    def query_interface(this : IHostPolicyManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostPolicyManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostPolicyManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_default_action(this : IHostPolicyManager*, operation : Win32cr::System::ClrHosting::EClrOperation, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_default_action.call(this, operation, action)
    end
    def on_timeout(this : IHostPolicyManager*, operation : Win32cr::System::ClrHosting::EClrOperation, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_timeout.call(this, operation, action)
    end
    def on_failure(this : IHostPolicyManager*, failure : Win32cr::System::ClrHosting::EClrFailure, action : Win32cr::System::ClrHosting::EPolicyAction) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_failure.call(this, failure, action)
    end

  end

  @[Extern]

  record IActionOnCLREventVtable,
    query_interface : Proc(IActionOnCLREvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActionOnCLREvent*, UInt32),
    release : Proc(IActionOnCLREvent*, UInt32),
    on_event : Proc(IActionOnCLREvent*, Win32cr::System::ClrHosting::EClrEvent, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IActionOnCLREvent, lpVtbl : IActionOnCLREventVtable* do
    GUID = LibC::GUID.new(0x607be24b_u32, 0xd91b_u16, 0x4e28_u16, StaticArray[0xa2_u8, 0x42_u8, 0x61_u8, 0x87_u8, 0x1c_u8, 0xe5_u8, 0x6e_u8, 0x35_u8])
    def query_interface(this : IActionOnCLREvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActionOnCLREvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActionOnCLREvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_event(this : IActionOnCLREvent*, event : Win32cr::System::ClrHosting::EClrEvent, data : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event.call(this, event, data)
    end

  end

  @[Extern]

  record ICLROnEventManagerVtable,
    query_interface : Proc(ICLROnEventManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLROnEventManager*, UInt32),
    release : Proc(ICLROnEventManager*, UInt32),
    register_action_on_event : Proc(ICLROnEventManager*, Win32cr::System::ClrHosting::EClrEvent, Void*, Win32cr::Foundation::HRESULT),
    unregister_action_on_event : Proc(ICLROnEventManager*, Win32cr::System::ClrHosting::EClrEvent, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLROnEventManager, lpVtbl : ICLROnEventManagerVtable* do
    GUID = LibC::GUID.new(0x1d0e0132_u32, 0xe64f_u16, 0x493d_u16, StaticArray[0x92_u8, 0x60_u8, 0x2_u8, 0x5c_u8, 0xe_u8, 0x32_u8, 0xc1_u8, 0x75_u8])
    def query_interface(this : ICLROnEventManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLROnEventManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLROnEventManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_action_on_event(this : ICLROnEventManager*, event : Win32cr::System::ClrHosting::EClrEvent, pAction : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_action_on_event.call(this, event, pAction)
    end
    def unregister_action_on_event(this : ICLROnEventManager*, event : Win32cr::System::ClrHosting::EClrEvent, pAction : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_action_on_event.call(this, event, pAction)
    end

  end

  @[Extern]

  record IHostGCManagerVtable,
    query_interface : Proc(IHostGCManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostGCManager*, UInt32),
    release : Proc(IHostGCManager*, UInt32),
    thread_is_blocking_for_suspension : Proc(IHostGCManager*, Win32cr::Foundation::HRESULT),
    suspension_starting : Proc(IHostGCManager*, Win32cr::Foundation::HRESULT),
    suspension_ending : Proc(IHostGCManager*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostGCManager, lpVtbl : IHostGCManagerVtable* do
    GUID = LibC::GUID.new(0x5d4ec34e_u32, 0xf248_u16, 0x457b_u16, StaticArray[0xb6_u8, 0x3_u8, 0x25_u8, 0x5f_u8, 0xaa_u8, 0xba_u8, 0xd_u8, 0x21_u8])
    def query_interface(this : IHostGCManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostGCManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostGCManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def thread_is_blocking_for_suspension(this : IHostGCManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.thread_is_blocking_for_suspension.call(this)
    end
    def suspension_starting(this : IHostGCManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspension_starting.call(this)
    end
    def suspension_ending(this : IHostGCManager*, generation : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspension_ending.call(this, generation)
    end

  end

  @[Extern]

  record ICLRAssemblyReferenceListVtable,
    query_interface : Proc(ICLRAssemblyReferenceList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRAssemblyReferenceList*, UInt32),
    release : Proc(ICLRAssemblyReferenceList*, UInt32),
    is_string_assembly_reference_in_list : Proc(ICLRAssemblyReferenceList*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    is_assembly_reference_in_list : Proc(ICLRAssemblyReferenceList*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRAssemblyReferenceList, lpVtbl : ICLRAssemblyReferenceListVtable* do
    GUID = LibC::GUID.new(0x1b2c9750_u32, 0x2e66_u16, 0x4bda_u16, StaticArray[0x8b_u8, 0x44_u8, 0xa_u8, 0x64_u8, 0x2c_u8, 0x5c_u8, 0xd7_u8, 0x33_u8])
    def query_interface(this : ICLRAssemblyReferenceList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRAssemblyReferenceList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRAssemblyReferenceList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_string_assembly_reference_in_list(this : ICLRAssemblyReferenceList*, pwzAssemblyName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_string_assembly_reference_in_list.call(this, pwzAssemblyName)
    end
    def is_assembly_reference_in_list(this : ICLRAssemblyReferenceList*, pName : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_assembly_reference_in_list.call(this, pName)
    end

  end

  @[Extern]

  record ICLRReferenceAssemblyEnumVtable,
    query_interface : Proc(ICLRReferenceAssemblyEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRReferenceAssemblyEnum*, UInt32),
    release : Proc(ICLRReferenceAssemblyEnum*, UInt32),
    get : Proc(ICLRReferenceAssemblyEnum*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRReferenceAssemblyEnum, lpVtbl : ICLRReferenceAssemblyEnumVtable* do
    GUID = LibC::GUID.new(0xd509cb5d_u32, 0xcf32_u16, 0x4876_u16, StaticArray[0xae_u8, 0x61_u8, 0x67_u8, 0x77_u8, 0xc_u8, 0xf9_u8, 0x19_u8, 0x73_u8])
    def query_interface(this : ICLRReferenceAssemblyEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRReferenceAssemblyEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRReferenceAssemblyEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get(this : ICLRReferenceAssemblyEnum*, dwIndex : UInt32, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, dwIndex, pwzBuffer, pcchBufferSize)
    end

  end

  @[Extern]

  record ICLRProbingAssemblyEnumVtable,
    query_interface : Proc(ICLRProbingAssemblyEnum*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRProbingAssemblyEnum*, UInt32),
    release : Proc(ICLRProbingAssemblyEnum*, UInt32),
    get : Proc(ICLRProbingAssemblyEnum*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRProbingAssemblyEnum, lpVtbl : ICLRProbingAssemblyEnumVtable* do
    GUID = LibC::GUID.new(0xd0c5fb1f_u32, 0x416b_u16, 0x4f97_u16, StaticArray[0x81_u8, 0xf4_u8, 0x7a_u8, 0xc7_u8, 0xdc_u8, 0x24_u8, 0xdd_u8, 0x5d_u8])
    def query_interface(this : ICLRProbingAssemblyEnum*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRProbingAssemblyEnum*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRProbingAssemblyEnum*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get(this : ICLRProbingAssemblyEnum*, dwIndex : UInt32, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, dwIndex, pwzBuffer, pcchBufferSize)
    end

  end

  @[Extern]

  record ICLRAssemblyIdentityManagerVtable,
    query_interface : Proc(ICLRAssemblyIdentityManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRAssemblyIdentityManager*, UInt32),
    release : Proc(ICLRAssemblyIdentityManager*, UInt32),
    get_clr_assembly_reference_list : Proc(ICLRAssemblyIdentityManager*, Win32cr::Foundation::PWSTR*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_binding_identity_from_file : Proc(ICLRAssemblyIdentityManager*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_binding_identity_from_stream : Proc(ICLRAssemblyIdentityManager*, Void*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_referenced_assemblies_from_file : Proc(ICLRAssemblyIdentityManager*, Win32cr::Foundation::PWSTR, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_referenced_assemblies_from_stream : Proc(ICLRAssemblyIdentityManager*, Void*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_probing_assemblies_from_reference : Proc(ICLRAssemblyIdentityManager*, UInt32, UInt32, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    is_strongly_named : Proc(ICLRAssemblyIdentityManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRAssemblyIdentityManager, lpVtbl : ICLRAssemblyIdentityManagerVtable* do
    GUID = LibC::GUID.new(0x15f0a9da_u32, 0x3ff6_u16, 0x4393_u16, StaticArray[0x9d_u8, 0xa9_u8, 0xfd_u8, 0xfd_u8, 0x28_u8, 0x4e_u8, 0x69_u8, 0x72_u8])
    def query_interface(this : ICLRAssemblyIdentityManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRAssemblyIdentityManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRAssemblyIdentityManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_clr_assembly_reference_list(this : ICLRAssemblyIdentityManager*, ppwzAssemblyReferences : Win32cr::Foundation::PWSTR*, dwNumOfReferences : UInt32, ppReferenceList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clr_assembly_reference_list.call(this, ppwzAssemblyReferences, dwNumOfReferences, ppReferenceList)
    end
    def get_binding_identity_from_file(this : ICLRAssemblyIdentityManager*, pwzFilePath : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_binding_identity_from_file.call(this, pwzFilePath, dwFlags, pwzBuffer, pcchBufferSize)
    end
    def get_binding_identity_from_stream(this : ICLRAssemblyIdentityManager*, pStream : Void*, dwFlags : UInt32, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_binding_identity_from_stream.call(this, pStream, dwFlags, pwzBuffer, pcchBufferSize)
    end
    def get_referenced_assemblies_from_file(this : ICLRAssemblyIdentityManager*, pwzFilePath : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pExcludeAssembliesList : Void*, ppReferenceEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_referenced_assemblies_from_file.call(this, pwzFilePath, dwFlags, pExcludeAssembliesList, ppReferenceEnum)
    end
    def get_referenced_assemblies_from_stream(this : ICLRAssemblyIdentityManager*, pStream : Void*, dwFlags : UInt32, pExcludeAssembliesList : Void*, ppReferenceEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_referenced_assemblies_from_stream.call(this, pStream, dwFlags, pExcludeAssembliesList, ppReferenceEnum)
    end
    def get_probing_assemblies_from_reference(this : ICLRAssemblyIdentityManager*, dwMachineType : UInt32, dwFlags : UInt32, pwzReferenceIdentity : Win32cr::Foundation::PWSTR, ppProbingAssemblyEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_probing_assemblies_from_reference.call(this, dwMachineType, dwFlags, pwzReferenceIdentity, ppProbingAssemblyEnum)
    end
    def is_strongly_named(this : ICLRAssemblyIdentityManager*, pwzAssemblyIdentity : Win32cr::Foundation::PWSTR, pbIsStronglyNamed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_strongly_named.call(this, pwzAssemblyIdentity, pbIsStronglyNamed)
    end

  end

  @[Extern]

  record ICLRHostBindingPolicyManagerVtable,
    query_interface : Proc(ICLRHostBindingPolicyManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRHostBindingPolicyManager*, UInt32),
    release : Proc(ICLRHostBindingPolicyManager*, UInt32),
    modify_application_policy : Proc(ICLRHostBindingPolicyManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    evaluate_policy : Proc(ICLRHostBindingPolicyManager*, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRHostBindingPolicyManager, lpVtbl : ICLRHostBindingPolicyManagerVtable* do
    GUID = LibC::GUID.new(0x4b3545e7_u32, 0x1856_u16, 0x48c9_u16, StaticArray[0xa8_u8, 0xba_u8, 0x24_u8, 0xb2_u8, 0x1a_u8, 0x75_u8, 0x3c_u8, 0x9_u8])
    def query_interface(this : ICLRHostBindingPolicyManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRHostBindingPolicyManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRHostBindingPolicyManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def modify_application_policy(this : ICLRHostBindingPolicyManager*, pwzSourceAssemblyIdentity : Win32cr::Foundation::PWSTR, pwzTargetAssemblyIdentity : Win32cr::Foundation::PWSTR, pbApplicationPolicy : UInt8*, cbAppPolicySize : UInt32, dwPolicyModifyFlags : UInt32, pbNewApplicationPolicy : UInt8*, pcbNewAppPolicySize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_application_policy.call(this, pwzSourceAssemblyIdentity, pwzTargetAssemblyIdentity, pbApplicationPolicy, cbAppPolicySize, dwPolicyModifyFlags, pbNewApplicationPolicy, pcbNewAppPolicySize)
    end
    def evaluate_policy(this : ICLRHostBindingPolicyManager*, pwzReferenceIdentity : Win32cr::Foundation::PWSTR, pbApplicationPolicy : UInt8*, cbAppPolicySize : UInt32, pwzPostPolicyReferenceIdentity : Win32cr::Foundation::PWSTR, pcchPostPolicyReferenceIdentity : UInt32*, pdwPoliciesApplied : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.evaluate_policy.call(this, pwzReferenceIdentity, pbApplicationPolicy, cbAppPolicySize, pwzPostPolicyReferenceIdentity, pcchPostPolicyReferenceIdentity, pdwPoliciesApplied)
    end

  end

  @[Extern]

  record ICLRGCManagerVtable,
    query_interface : Proc(ICLRGCManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRGCManager*, UInt32),
    release : Proc(ICLRGCManager*, UInt32),
    collect : Proc(ICLRGCManager*, Int32, Win32cr::Foundation::HRESULT),
    get_stats : Proc(ICLRGCManager*, Win32cr::System::ClrHosting::COR_GC_STATS*, Win32cr::Foundation::HRESULT),
    set_gc_startup_limits : Proc(ICLRGCManager*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRGCManager, lpVtbl : ICLRGCManagerVtable* do
    GUID = LibC::GUID.new(0x54d9007e_u32, 0xa8e2_u16, 0x4885_u16, StaticArray[0xb7_u8, 0xbf_u8, 0xf9_u8, 0x98_u8, 0xde_u8, 0xee_u8, 0x4f_u8, 0x2a_u8])
    def query_interface(this : ICLRGCManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRGCManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRGCManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def collect(this : ICLRGCManager*, generation : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect.call(this, generation)
    end
    def get_stats(this : ICLRGCManager*, pStats : Win32cr::System::ClrHosting::COR_GC_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stats.call(this, pStats)
    end
    def set_gc_startup_limits(this : ICLRGCManager*, segment_size : UInt32, max_gen0_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_startup_limits.call(this, segment_size, max_gen0_size)
    end

  end

  @[Extern]

  record ICLRGCManager2Vtable,
    query_interface : Proc(ICLRGCManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRGCManager2*, UInt32),
    release : Proc(ICLRGCManager2*, UInt32),
    collect : Proc(ICLRGCManager2*, Int32, Win32cr::Foundation::HRESULT),
    get_stats : Proc(ICLRGCManager2*, Win32cr::System::ClrHosting::COR_GC_STATS*, Win32cr::Foundation::HRESULT),
    set_gc_startup_limits : Proc(ICLRGCManager2*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_gc_startup_limits_ex : Proc(ICLRGCManager2*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRGCManager2, lpVtbl : ICLRGCManager2Vtable* do
    GUID = LibC::GUID.new(0x603b793_u32, 0xa97a_u16, 0x4712_u16, StaticArray[0x9c_u8, 0xb4_u8, 0xc_u8, 0xd1_u8, 0xc7_u8, 0x4c_u8, 0xf_u8, 0x7c_u8])
    def query_interface(this : ICLRGCManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRGCManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRGCManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def collect(this : ICLRGCManager2*, generation : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect.call(this, generation)
    end
    def get_stats(this : ICLRGCManager2*, pStats : Win32cr::System::ClrHosting::COR_GC_STATS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_stats.call(this, pStats)
    end
    def set_gc_startup_limits(this : ICLRGCManager2*, segment_size : UInt32, max_gen0_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_startup_limits.call(this, segment_size, max_gen0_size)
    end
    def set_gc_startup_limits_ex(this : ICLRGCManager2*, segment_size : LibC::UIntPtrT, max_gen0_size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gc_startup_limits_ex.call(this, segment_size, max_gen0_size)
    end

  end

  @[Extern]

  record IHostAssemblyStoreVtable,
    query_interface : Proc(IHostAssemblyStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostAssemblyStore*, UInt32),
    release : Proc(IHostAssemblyStore*, UInt32),
    provide_assembly : Proc(IHostAssemblyStore*, Win32cr::System::ClrHosting::AssemblyBindInfo*, UInt64*, UInt64*, Void**, Void**, Win32cr::Foundation::HRESULT),
    provide_module : Proc(IHostAssemblyStore*, Win32cr::System::ClrHosting::ModuleBindInfo*, UInt32*, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostAssemblyStore, lpVtbl : IHostAssemblyStoreVtable* do
    GUID = LibC::GUID.new(0x7b102a88_u32, 0x3f7f_u16, 0x496d_u16, StaticArray[0x8f_u8, 0xa2_u8, 0xc3_u8, 0x53_u8, 0x74_u8, 0xe0_u8, 0x1a_u8, 0xf3_u8])
    def query_interface(this : IHostAssemblyStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostAssemblyStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostAssemblyStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def provide_assembly(this : IHostAssemblyStore*, pBindInfo : Win32cr::System::ClrHosting::AssemblyBindInfo*, pAssemblyId : UInt64*, pContext : UInt64*, ppStmAssemblyImage : Void**, ppStmPDB : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.provide_assembly.call(this, pBindInfo, pAssemblyId, pContext, ppStmAssemblyImage, ppStmPDB)
    end
    def provide_module(this : IHostAssemblyStore*, pBindInfo : Win32cr::System::ClrHosting::ModuleBindInfo*, pdwModuleId : UInt32*, ppStmModuleImage : Void**, ppStmPDB : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.provide_module.call(this, pBindInfo, pdwModuleId, ppStmModuleImage, ppStmPDB)
    end

  end

  @[Extern]

  record IHostAssemblyManagerVtable,
    query_interface : Proc(IHostAssemblyManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostAssemblyManager*, UInt32),
    release : Proc(IHostAssemblyManager*, UInt32),
    get_non_host_store_assemblies : Proc(IHostAssemblyManager*, Void**, Win32cr::Foundation::HRESULT),
    get_assembly_store : Proc(IHostAssemblyManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostAssemblyManager, lpVtbl : IHostAssemblyManagerVtable* do
    GUID = LibC::GUID.new(0x613dabd7_u32, 0x62b2_u16, 0x493e_u16, StaticArray[0x9e_u8, 0x65_u8, 0xc1_u8, 0xe3_u8, 0x2a_u8, 0x1e_u8, 0xc_u8, 0x5e_u8])
    def query_interface(this : IHostAssemblyManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostAssemblyManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostAssemblyManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_non_host_store_assemblies(this : IHostAssemblyManager*, ppReferenceList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_non_host_store_assemblies.call(this, ppReferenceList)
    end
    def get_assembly_store(this : IHostAssemblyManager*, ppAssemblyStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_store.call(this, ppAssemblyStore)
    end

  end

  @[Extern]

  record IHostControlVtable,
    query_interface : Proc(IHostControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostControl*, UInt32),
    release : Proc(IHostControl*, UInt32),
    get_host_manager : Proc(IHostControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_app_domain_manager : Proc(IHostControl*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostControl, lpVtbl : IHostControlVtable* do
    GUID = LibC::GUID.new(0x2ca073c_u32, 0x7079_u16, 0x4860_u16, StaticArray[0x88_u8, 0xa_u8, 0xc2_u8, 0xf7_u8, 0xa4_u8, 0x49_u8, 0xc9_u8, 0x91_u8])
    def query_interface(this : IHostControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_host_manager(this : IHostControl*, riid : LibC::GUID*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_host_manager.call(this, riid, ppObject)
    end
    def set_app_domain_manager(this : IHostControl*, dwAppDomainID : UInt32, pUnkAppDomainManager : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_app_domain_manager.call(this, dwAppDomainID, pUnkAppDomainManager)
    end

  end

  @[Extern]

  record ICLRControlVtable,
    query_interface : Proc(ICLRControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRControl*, UInt32),
    release : Proc(ICLRControl*, UInt32),
    get_clr_manager : Proc(ICLRControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_app_domain_manager_type : Proc(ICLRControl*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRControl, lpVtbl : ICLRControlVtable* do
    GUID = LibC::GUID.new(0x9065597e_u32, 0xd1a1_u16, 0x4fb2_u16, StaticArray[0xb6_u8, 0xba_u8, 0x7e_u8, 0x1f_u8, 0xce_u8, 0x23_u8, 0xf_u8, 0x61_u8])
    def query_interface(this : ICLRControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_clr_manager(this : ICLRControl*, riid : LibC::GUID*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clr_manager.call(this, riid, ppObject)
    end
    def set_app_domain_manager_type(this : ICLRControl*, pwzAppDomainManagerAssembly : Win32cr::Foundation::PWSTR, pwzAppDomainManagerType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_app_domain_manager_type.call(this, pwzAppDomainManagerAssembly, pwzAppDomainManagerType)
    end

  end

  @[Extern]

  record ICLRRuntimeHostVtable,
    query_interface : Proc(ICLRRuntimeHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRRuntimeHost*, UInt32),
    release : Proc(ICLRRuntimeHost*, UInt32),
    start : Proc(ICLRRuntimeHost*, Win32cr::Foundation::HRESULT),
    stop : Proc(ICLRRuntimeHost*, Win32cr::Foundation::HRESULT),
    set_host_control : Proc(ICLRRuntimeHost*, Void*, Win32cr::Foundation::HRESULT),
    get_clr_control : Proc(ICLRRuntimeHost*, Void**, Win32cr::Foundation::HRESULT),
    unload_app_domain : Proc(ICLRRuntimeHost*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    execute_in_app_domain : Proc(ICLRRuntimeHost*, UInt32, Win32cr::System::ClrHosting::FExecuteInAppDomainCallback, Void*, Win32cr::Foundation::HRESULT),
    get_current_app_domain_id : Proc(ICLRRuntimeHost*, UInt32*, Win32cr::Foundation::HRESULT),
    execute_application : Proc(ICLRRuntimeHost*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, UInt32, Win32cr::Foundation::PWSTR*, Int32*, Win32cr::Foundation::HRESULT),
    execute_in_default_app_domain : Proc(ICLRRuntimeHost*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRRuntimeHost, lpVtbl : ICLRRuntimeHostVtable* do
    GUID = LibC::GUID.new(0x90f1a06c_u32, 0x7712_u16, 0x4762_u16, StaticArray[0x86_u8, 0xb5_u8, 0x7a_u8, 0x5e_u8, 0xba_u8, 0x6b_u8, 0xdb_u8, 0x2_u8])
    def query_interface(this : ICLRRuntimeHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRRuntimeHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRRuntimeHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : ICLRRuntimeHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this)
    end
    def stop(this : ICLRRuntimeHost*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def set_host_control(this : ICLRRuntimeHost*, pHostControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_host_control.call(this, pHostControl)
    end
    def get_clr_control(this : ICLRRuntimeHost*, pCLRControl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clr_control.call(this, pCLRControl)
    end
    def unload_app_domain(this : ICLRRuntimeHost*, dwAppDomainId : UInt32, fWaitUntilDone : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unload_app_domain.call(this, dwAppDomainId, fWaitUntilDone)
    end
    def execute_in_app_domain(this : ICLRRuntimeHost*, dwAppDomainId : UInt32, pCallback : Win32cr::System::ClrHosting::FExecuteInAppDomainCallback, cookie : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_in_app_domain.call(this, dwAppDomainId, pCallback, cookie)
    end
    def get_current_app_domain_id(this : ICLRRuntimeHost*, pdwAppDomainId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_app_domain_id.call(this, pdwAppDomainId)
    end
    def execute_application(this : ICLRRuntimeHost*, pwzAppFullName : Win32cr::Foundation::PWSTR, dwManifestPaths : UInt32, ppwzManifestPaths : Win32cr::Foundation::PWSTR*, dwActivationData : UInt32, ppwzActivationData : Win32cr::Foundation::PWSTR*, pReturnValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_application.call(this, pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, pReturnValue)
    end
    def execute_in_default_app_domain(this : ICLRRuntimeHost*, pwzAssemblyPath : Win32cr::Foundation::PWSTR, pwzTypeName : Win32cr::Foundation::PWSTR, pwzMethodName : Win32cr::Foundation::PWSTR, pwzArgument : Win32cr::Foundation::PWSTR, pReturnValue : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_in_default_app_domain.call(this, pwzAssemblyPath, pwzTypeName, pwzMethodName, pwzArgument, pReturnValue)
    end

  end

  @[Extern]

  record ICLRHostProtectionManagerVtable,
    query_interface : Proc(ICLRHostProtectionManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRHostProtectionManager*, UInt32),
    release : Proc(ICLRHostProtectionManager*, UInt32),
    set_protected_categories : Proc(ICLRHostProtectionManager*, Win32cr::System::ClrHosting::EApiCategories, Win32cr::Foundation::HRESULT),
    set_eager_serialize_grant_sets : Proc(ICLRHostProtectionManager*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRHostProtectionManager, lpVtbl : ICLRHostProtectionManagerVtable* do
    GUID = LibC::GUID.new(0x89f25f5c_u32, 0xceef_u16, 0x43e1_u16, StaticArray[0x9c_u8, 0xfa_u8, 0xa6_u8, 0x8c_u8, 0xe8_u8, 0x63_u8, 0xaa_u8, 0xac_u8])
    def query_interface(this : ICLRHostProtectionManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRHostProtectionManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRHostProtectionManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_protected_categories(this : ICLRHostProtectionManager*, categories : Win32cr::System::ClrHosting::EApiCategories) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_protected_categories.call(this, categories)
    end
    def set_eager_serialize_grant_sets(this : ICLRHostProtectionManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_eager_serialize_grant_sets.call(this)
    end

  end

  @[Extern]

  record ICLRDomainManagerVtable,
    query_interface : Proc(ICLRDomainManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRDomainManager*, UInt32),
    release : Proc(ICLRDomainManager*, UInt32),
    set_app_domain_manager_type : Proc(ICLRDomainManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::ClrHosting::EInitializeNewDomainFlags, Win32cr::Foundation::HRESULT),
    set_properties_for_default_app_domain : Proc(ICLRDomainManager*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRDomainManager, lpVtbl : ICLRDomainManagerVtable* do
    GUID = LibC::GUID.new(0x270d00a2_u32, 0x8e15_u16, 0x4d0b_u16, StaticArray[0xad_u8, 0xeb_u8, 0x37_u8, 0xbc_u8, 0x3e_u8, 0x47_u8, 0xdf_u8, 0x77_u8])
    def query_interface(this : ICLRDomainManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRDomainManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRDomainManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_app_domain_manager_type(this : ICLRDomainManager*, wszAppDomainManagerAssembly : Win32cr::Foundation::PWSTR, wszAppDomainManagerType : Win32cr::Foundation::PWSTR, dwInitializeDomainFlags : Win32cr::System::ClrHosting::EInitializeNewDomainFlags) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_app_domain_manager_type.call(this, wszAppDomainManagerAssembly, wszAppDomainManagerType, dwInitializeDomainFlags)
    end
    def set_properties_for_default_app_domain(this : ICLRDomainManager*, nProperties : UInt32, pwszPropertyNames : Win32cr::Foundation::PWSTR*, pwszPropertyValues : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_properties_for_default_app_domain.call(this, nProperties, pwszPropertyNames, pwszPropertyValues)
    end

  end

  @[Extern]

  record ITypeNameVtable,
    query_interface : Proc(ITypeName*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeName*, UInt32),
    release : Proc(ITypeName*, UInt32),
    get_name_count : Proc(ITypeName*, UInt32*, Win32cr::Foundation::HRESULT),
    get_names : Proc(ITypeName*, UInt32, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_argument_count : Proc(ITypeName*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_arguments : Proc(ITypeName*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_modifier_length : Proc(ITypeName*, UInt32*, Win32cr::Foundation::HRESULT),
    get_modifiers : Proc(ITypeName*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_assembly_name : Proc(ITypeName*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITypeName, lpVtbl : ITypeNameVtable* do
    GUID = LibC::GUID.new(0xb81ff171_u32, 0x20f3_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xcc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb0_u8, 0x5_u8, 0x22_u8])
    def query_interface(this : ITypeName*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeName*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeName*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_name_count(this : ITypeName*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_name_count.call(this, pCount)
    end
    def get_names(this : ITypeName*, count : UInt32, rgbszNames : Win32cr::Foundation::BSTR*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_names.call(this, count, rgbszNames, pCount)
    end
    def get_type_argument_count(this : ITypeName*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_argument_count.call(this, pCount)
    end
    def get_type_arguments(this : ITypeName*, count : UInt32, rgpArguments : Void**, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_arguments.call(this, count, rgpArguments, pCount)
    end
    def get_modifier_length(this : ITypeName*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_modifier_length.call(this, pCount)
    end
    def get_modifiers(this : ITypeName*, count : UInt32, rgModifiers : UInt32*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_modifiers.call(this, count, rgModifiers, pCount)
    end
    def get_assembly_name(this : ITypeName*, rgbszAssemblyNames : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assembly_name.call(this, rgbszAssemblyNames)
    end

  end

  @[Extern]

  record ITypeNameBuilderVtable,
    query_interface : Proc(ITypeNameBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeNameBuilder*, UInt32),
    release : Proc(ITypeNameBuilder*, UInt32),
    open_generic_arguments : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    close_generic_arguments : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    open_generic_argument : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    close_generic_argument : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    add_name : Proc(ITypeNameBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    add_pointer : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    add_by_ref : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    add_sz_array : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT),
    add_array : Proc(ITypeNameBuilder*, UInt32, Win32cr::Foundation::HRESULT),
    add_assembly_spec : Proc(ITypeNameBuilder*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    to_string : Proc(ITypeNameBuilder*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    clear : Proc(ITypeNameBuilder*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITypeNameBuilder, lpVtbl : ITypeNameBuilderVtable* do
    GUID = LibC::GUID.new(0xb81ff171_u32, 0x20f3_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xcc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb0_u8, 0x5_u8, 0x23_u8])
    def query_interface(this : ITypeNameBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeNameBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeNameBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open_generic_arguments(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_generic_arguments.call(this)
    end
    def close_generic_arguments(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_generic_arguments.call(this)
    end
    def open_generic_argument(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_generic_argument.call(this)
    end
    def close_generic_argument(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_generic_argument.call(this)
    end
    def add_name(this : ITypeNameBuilder*, szName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_name.call(this, szName)
    end
    def add_pointer(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_pointer.call(this)
    end
    def add_by_ref(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_by_ref.call(this)
    end
    def add_sz_array(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_sz_array.call(this)
    end
    def add_array(this : ITypeNameBuilder*, rank : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_array.call(this, rank)
    end
    def add_assembly_spec(this : ITypeNameBuilder*, szAssemblySpec : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_assembly_spec.call(this, szAssemblySpec)
    end
    def to_string(this : ITypeNameBuilder*, pszStringRepresentation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.to_string.call(this, pszStringRepresentation)
    end
    def clear(this : ITypeNameBuilder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]

  record ITypeNameFactoryVtable,
    query_interface : Proc(ITypeNameFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITypeNameFactory*, UInt32),
    release : Proc(ITypeNameFactory*, UInt32),
    parse_type_name : Proc(ITypeNameFactory*, Win32cr::Foundation::PWSTR, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_type_name_builder : Proc(ITypeNameFactory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITypeNameFactory, lpVtbl : ITypeNameFactoryVtable* do
    GUID = LibC::GUID.new(0xb81ff171_u32, 0x20f3_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xcc_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb0_u8, 0x5_u8, 0x21_u8])
    def query_interface(this : ITypeNameFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITypeNameFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITypeNameFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def parse_type_name(this : ITypeNameFactory*, szName : Win32cr::Foundation::PWSTR, pError : UInt32*, ppTypeName : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.parse_type_name.call(this, szName, pError, ppTypeName)
    end
    def get_type_name_builder(this : ITypeNameFactory*, ppTypeBuilder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_name_builder.call(this, ppTypeBuilder)
    end

  end

  @[Extern]

  record IApartmentCallbackVtable,
    query_interface : Proc(IApartmentCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApartmentCallback*, UInt32),
    release : Proc(IApartmentCallback*, UInt32),
    do_callback : Proc(IApartmentCallback*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IApartmentCallback, lpVtbl : IApartmentCallbackVtable* do
    GUID = LibC::GUID.new(0x178e5337_u32, 0x1528_u16, 0x4591_u16, StaticArray[0xb1_u8, 0xc9_u8, 0x1c_u8, 0x6e_u8, 0x48_u8, 0x46_u8, 0x86_u8, 0xd8_u8])
    def query_interface(this : IApartmentCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApartmentCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApartmentCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def do_callback(this : IApartmentCallback*, pFunc : LibC::UIntPtrT, pData : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_callback.call(this, pFunc, pData)
    end

  end

  @[Extern]

  record IManagedObjectVtable,
    query_interface : Proc(IManagedObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManagedObject*, UInt32),
    release : Proc(IManagedObject*, UInt32),
    get_serialized_buffer : Proc(IManagedObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_object_identity : Proc(IManagedObject*, Win32cr::Foundation::BSTR*, Int32*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IManagedObject, lpVtbl : IManagedObjectVtable* do
    GUID = LibC::GUID.new(0xc3fcc19e_u32, 0xa970_u16, 0x11d2_u16, StaticArray[0x8b_u8, 0x5a_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0xb7_u8, 0xc9_u8, 0xc4_u8])
    def query_interface(this : IManagedObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManagedObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManagedObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_serialized_buffer(this : IManagedObject*, pBSTR : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialized_buffer.call(this, pBSTR)
    end
    def get_object_identity(this : IManagedObject*, pBSTRGUID : Win32cr::Foundation::BSTR*, app_domain_id : Int32*, pCCW : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_identity.call(this, pBSTRGUID, app_domain_id, pCCW)
    end

  end

  @[Extern]

  record ICatalogServicesVtable,
    query_interface : Proc(ICatalogServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICatalogServices*, UInt32),
    release : Proc(ICatalogServices*, UInt32),
    autodone : Proc(ICatalogServices*, Win32cr::Foundation::HRESULT),
    not_autodone : Proc(ICatalogServices*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICatalogServices, lpVtbl : ICatalogServicesVtable* do
    GUID = LibC::GUID.new(0x4c6be1e_u32, 0x1db1_u16, 0x4058_u16, StaticArray[0xab_u8, 0x7a_u8, 0x70_u8, 0xc_u8, 0xcc_u8, 0xfb_u8, 0xf2_u8, 0x54_u8])
    def query_interface(this : ICatalogServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICatalogServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICatalogServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def autodone(this : ICatalogServices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.autodone.call(this)
    end
    def not_autodone(this : ICatalogServices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.not_autodone.call(this)
    end

  end

  @[Extern]

  record IHostSecurityContextVtable,
    query_interface : Proc(IHostSecurityContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostSecurityContext*, UInt32),
    release : Proc(IHostSecurityContext*, UInt32),
    capture : Proc(IHostSecurityContext*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostSecurityContext, lpVtbl : IHostSecurityContextVtable* do
    GUID = LibC::GUID.new(0x7e573ce4_u32, 0x343_u16, 0x4423_u16, StaticArray[0x98_u8, 0xd7_u8, 0x63_u8, 0x18_u8, 0x34_u8, 0x8a_u8, 0x1d_u8, 0x3c_u8])
    def query_interface(this : IHostSecurityContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostSecurityContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostSecurityContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def capture(this : IHostSecurityContext*, ppClonedContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.capture.call(this, ppClonedContext)
    end

  end

  @[Extern]

  record IHostSecurityManagerVtable,
    query_interface : Proc(IHostSecurityManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHostSecurityManager*, UInt32),
    release : Proc(IHostSecurityManager*, UInt32),
    impersonate_logged_on_user : Proc(IHostSecurityManager*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    revert_to_self : Proc(IHostSecurityManager*, Win32cr::Foundation::HRESULT),
    open_thread_token : Proc(IHostSecurityManager*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    set_thread_token : Proc(IHostSecurityManager*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    get_security_context : Proc(IHostSecurityManager*, Win32cr::System::ClrHosting::EContextType, Void**, Win32cr::Foundation::HRESULT),
    set_security_context : Proc(IHostSecurityManager*, Win32cr::System::ClrHosting::EContextType, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IHostSecurityManager, lpVtbl : IHostSecurityManagerVtable* do
    GUID = LibC::GUID.new(0x75ad2468_u32, 0xa349_u16, 0x4d02_u16, StaticArray[0xa7_u8, 0x64_u8, 0x76_u8, 0xa6_u8, 0x8a_u8, 0xee_u8, 0xc_u8, 0x4f_u8])
    def query_interface(this : IHostSecurityManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHostSecurityManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHostSecurityManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def impersonate_logged_on_user(this : IHostSecurityManager*, hToken : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.impersonate_logged_on_user.call(this, hToken)
    end
    def revert_to_self(this : IHostSecurityManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revert_to_self.call(this)
    end
    def open_thread_token(this : IHostSecurityManager*, dwDesiredAccess : UInt32, bOpenAsSelf : Win32cr::Foundation::BOOL, phThreadToken : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_thread_token.call(this, dwDesiredAccess, bOpenAsSelf, phThreadToken)
    end
    def set_thread_token(this : IHostSecurityManager*, hToken : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thread_token.call(this, hToken)
    end
    def get_security_context(this : IHostSecurityManager*, eContextType : Win32cr::System::ClrHosting::EContextType, ppSecurityContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_context.call(this, eContextType, ppSecurityContext)
    end
    def set_security_context(this : IHostSecurityManager*, eContextType : Win32cr::System::ClrHosting::EContextType, pSecurityContext : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_context.call(this, eContextType, pSecurityContext)
    end

  end

  @[Extern]

  record ICLRAppDomainResourceMonitorVtable,
    query_interface : Proc(ICLRAppDomainResourceMonitor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRAppDomainResourceMonitor*, UInt32),
    release : Proc(ICLRAppDomainResourceMonitor*, UInt32),
    get_current_allocated : Proc(ICLRAppDomainResourceMonitor*, UInt32, UInt64*, Win32cr::Foundation::HRESULT),
    get_current_survived : Proc(ICLRAppDomainResourceMonitor*, UInt32, UInt64*, UInt64*, Win32cr::Foundation::HRESULT),
    get_current_cpu_time : Proc(ICLRAppDomainResourceMonitor*, UInt32, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRAppDomainResourceMonitor, lpVtbl : ICLRAppDomainResourceMonitorVtable* do
    GUID = LibC::GUID.new(0xc62de18c_u32, 0x2e23_u16, 0x4aea_u16, StaticArray[0x84_u8, 0x23_u8, 0xb4_u8, 0xc_u8, 0x1f_u8, 0xc5_u8, 0x9e_u8, 0xae_u8])
    def query_interface(this : ICLRAppDomainResourceMonitor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRAppDomainResourceMonitor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRAppDomainResourceMonitor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_allocated(this : ICLRAppDomainResourceMonitor*, dwAppDomainId : UInt32, pBytesAllocated : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_allocated.call(this, dwAppDomainId, pBytesAllocated)
    end
    def get_current_survived(this : ICLRAppDomainResourceMonitor*, dwAppDomainId : UInt32, pAppDomainBytesSurvived : UInt64*, pTotalBytesSurvived : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_survived.call(this, dwAppDomainId, pAppDomainBytesSurvived, pTotalBytesSurvived)
    end
    def get_current_cpu_time(this : ICLRAppDomainResourceMonitor*, dwAppDomainId : UInt32, pMilliseconds : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_cpu_time.call(this, dwAppDomainId, pMilliseconds)
    end

  end

  @[Extern]

  record ICLRMetaHostVtable,
    query_interface : Proc(ICLRMetaHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRMetaHost*, UInt32),
    release : Proc(ICLRMetaHost*, UInt32),
    get_runtime : Proc(ICLRMetaHost*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_version_from_file : Proc(ICLRMetaHost*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    enumerate_installed_runtimes : Proc(ICLRMetaHost*, Void**, Win32cr::Foundation::HRESULT),
    enumerate_loaded_runtimes : Proc(ICLRMetaHost*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT),
    request_runtime_loaded_notification : Proc(ICLRMetaHost*, Win32cr::System::ClrHosting::RuntimeLoadedCallbackFnPtr, Win32cr::Foundation::HRESULT),
    query_legacy_v2_runtime_binding : Proc(ICLRMetaHost*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    exit_process : Proc(ICLRMetaHost*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRMetaHost, lpVtbl : ICLRMetaHostVtable* do
    GUID = LibC::GUID.new(0xd332db9e_u32, 0xb9b3_u16, 0x4125_u16, StaticArray[0x82_u8, 0x7_u8, 0xa1_u8, 0x48_u8, 0x84_u8, 0xf5_u8, 0x32_u8, 0x16_u8])
    def query_interface(this : ICLRMetaHost*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRMetaHost*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRMetaHost*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_runtime(this : ICLRMetaHost*, pwzVersion : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppRuntime : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime.call(this, pwzVersion, riid, ppRuntime)
    end
    def get_version_from_file(this : ICLRMetaHost*, pwzFilePath : Win32cr::Foundation::PWSTR, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version_from_file.call(this, pwzFilePath, pwzBuffer, pcchBuffer)
    end
    def enumerate_installed_runtimes(this : ICLRMetaHost*, ppEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_installed_runtimes.call(this, ppEnumerator)
    end
    def enumerate_loaded_runtimes(this : ICLRMetaHost*, hndProcess : Win32cr::Foundation::HANDLE, ppEnumerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enumerate_loaded_runtimes.call(this, hndProcess, ppEnumerator)
    end
    def request_runtime_loaded_notification(this : ICLRMetaHost*, pCallbackFunction : Win32cr::System::ClrHosting::RuntimeLoadedCallbackFnPtr) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_runtime_loaded_notification.call(this, pCallbackFunction)
    end
    def query_legacy_v2_runtime_binding(this : ICLRMetaHost*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_legacy_v2_runtime_binding.call(this, riid, ppUnk)
    end
    def exit_process(this : ICLRMetaHost*, iExitCode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.exit_process.call(this, iExitCode)
    end

  end

  @[Extern]

  record ICLRMetaHostPolicyVtable,
    query_interface : Proc(ICLRMetaHostPolicy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRMetaHostPolicy*, UInt32),
    release : Proc(ICLRMetaHostPolicy*, UInt32),
    get_requested_runtime : Proc(ICLRMetaHostPolicy*, Win32cr::System::ClrHosting::METAHOST_POLICY_FLAGS, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, UInt32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRMetaHostPolicy, lpVtbl : ICLRMetaHostPolicyVtable* do
    GUID = LibC::GUID.new(0xe2190695_u32, 0x77b2_u16, 0x492e_u16, StaticArray[0x8e_u8, 0x14_u8, 0xc4_u8, 0xb3_u8, 0xa7_u8, 0xfd_u8, 0xd5_u8, 0x93_u8])
    def query_interface(this : ICLRMetaHostPolicy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRMetaHostPolicy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRMetaHostPolicy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_requested_runtime(this : ICLRMetaHostPolicy*, dwPolicyFlags : Win32cr::System::ClrHosting::METAHOST_POLICY_FLAGS, pwzBinary : Win32cr::Foundation::PWSTR, pCfgStream : Void*, pwzVersion : Win32cr::Foundation::PWSTR, pcchVersion : UInt32*, pwzImageVersion : Win32cr::Foundation::PWSTR, pcchImageVersion : UInt32*, pdwConfigFlags : UInt32*, riid : LibC::GUID*, ppRuntime : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_requested_runtime.call(this, dwPolicyFlags, pwzBinary, pCfgStream, pwzVersion, pcchVersion, pwzImageVersion, pcchImageVersion, pdwConfigFlags, riid, ppRuntime)
    end

  end

  @[Extern]

  record ICLRProfilingVtable,
    query_interface : Proc(ICLRProfiling*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRProfiling*, UInt32),
    release : Proc(ICLRProfiling*, UInt32),
    attach_profiler : Proc(ICLRProfiling*, UInt32, UInt32, LibC::GUID*, Win32cr::Foundation::PWSTR, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRProfiling, lpVtbl : ICLRProfilingVtable* do
    GUID = LibC::GUID.new(0xb349abe3_u32, 0xb56f_u16, 0x4689_u16, StaticArray[0xbf_u8, 0xcd_u8, 0x76_u8, 0xbf_u8, 0x39_u8, 0xd8_u8, 0x88_u8, 0xea_u8])
    def query_interface(this : ICLRProfiling*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRProfiling*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRProfiling*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def attach_profiler(this : ICLRProfiling*, dwProfileeProcessID : UInt32, dwMillisecondsMax : UInt32, pClsidProfiler : LibC::GUID*, wszProfilerPath : Win32cr::Foundation::PWSTR, pvClientData : Void*, cbClientData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.attach_profiler.call(this, dwProfileeProcessID, dwMillisecondsMax, pClsidProfiler, wszProfilerPath, pvClientData, cbClientData)
    end

  end

  @[Extern]

  record ICLRDebuggingLibraryProviderVtable,
    query_interface : Proc(ICLRDebuggingLibraryProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRDebuggingLibraryProvider*, UInt32),
    release : Proc(ICLRDebuggingLibraryProvider*, UInt32),
    provide_library : Proc(ICLRDebuggingLibraryProvider*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HMODULE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRDebuggingLibraryProvider, lpVtbl : ICLRDebuggingLibraryProviderVtable* do
    GUID = LibC::GUID.new(0x3151c08d_u32, 0x4d09_u16, 0x4f9b_u16, StaticArray[0x88_u8, 0x38_u8, 0x28_u8, 0x80_u8, 0xbf_u8, 0x18_u8, 0xfe_u8, 0x51_u8])
    def query_interface(this : ICLRDebuggingLibraryProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRDebuggingLibraryProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRDebuggingLibraryProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def provide_library(this : ICLRDebuggingLibraryProvider*, pwszFileName : Win32cr::Foundation::PWSTR, dwTimestamp : UInt32, dwSizeOfImage : UInt32, phModule : Win32cr::Foundation::HMODULE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.provide_library.call(this, pwszFileName, dwTimestamp, dwSizeOfImage, phModule)
    end

  end

  @[Extern]

  record ICLRDebuggingVtable,
    query_interface : Proc(ICLRDebugging*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRDebugging*, UInt32),
    release : Proc(ICLRDebugging*, UInt32),
    open_virtual_process : Proc(ICLRDebugging*, UInt64, Void*, Void*, Win32cr::System::ClrHosting::CLR_DEBUGGING_VERSION*, LibC::GUID*, Void**, Win32cr::System::ClrHosting::CLR_DEBUGGING_VERSION*, Win32cr::System::ClrHosting::CLR_DEBUGGING_PROCESS_FLAGS*, Win32cr::Foundation::HRESULT),
    can_unload_now : Proc(ICLRDebugging*, Win32cr::Foundation::HMODULE, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRDebugging, lpVtbl : ICLRDebuggingVtable* do
    GUID = LibC::GUID.new(0xd28f3c5a_u32, 0x9634_u16, 0x4206_u16, StaticArray[0xa5_u8, 0x9_u8, 0x47_u8, 0x75_u8, 0x52_u8, 0xee_u8, 0xfb_u8, 0x10_u8])
    def query_interface(this : ICLRDebugging*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRDebugging*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRDebugging*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def open_virtual_process(this : ICLRDebugging*, moduleBaseAddress : UInt64, pDataTarget : Void*, pLibraryProvider : Void*, pMaxDebuggerSupportedVersion : Win32cr::System::ClrHosting::CLR_DEBUGGING_VERSION*, riidProcess : LibC::GUID*, ppProcess : Void**, pVersion : Win32cr::System::ClrHosting::CLR_DEBUGGING_VERSION*, pdwFlags : Win32cr::System::ClrHosting::CLR_DEBUGGING_PROCESS_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_virtual_process.call(this, moduleBaseAddress, pDataTarget, pLibraryProvider, pMaxDebuggerSupportedVersion, riidProcess, ppProcess, pVersion, pdwFlags)
    end
    def can_unload_now(this : ICLRDebugging*, hModule : Win32cr::Foundation::HMODULE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_unload_now.call(this, hModule)
    end

  end

  @[Extern]

  record ICLRRuntimeInfoVtable,
    query_interface : Proc(ICLRRuntimeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRRuntimeInfo*, UInt32),
    release : Proc(ICLRRuntimeInfo*, UInt32),
    get_version_string : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    get_runtime_directory : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    is_loaded : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    load_error_string : Proc(ICLRRuntimeInfo*, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Int32, Win32cr::Foundation::HRESULT),
    load_library_a : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HMODULE*, Win32cr::Foundation::HRESULT),
    get_proc_address : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT),
    get_interface : Proc(ICLRRuntimeInfo*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    is_loadable : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_default_startup_flags : Proc(ICLRRuntimeInfo*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_default_startup_flags : Proc(ICLRRuntimeInfo*, UInt32*, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    bind_as_legacy_v2_runtime : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::HRESULT),
    is_started : Proc(ICLRRuntimeInfo*, Win32cr::Foundation::BOOL*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRRuntimeInfo, lpVtbl : ICLRRuntimeInfoVtable* do
    GUID = LibC::GUID.new(0xbd39d1d2_u32, 0xba2f_u16, 0x486a_u16, StaticArray[0x89_u8, 0xb0_u8, 0xb4_u8, 0xb0_u8, 0xcb_u8, 0x46_u8, 0x68_u8, 0x91_u8])
    def query_interface(this : ICLRRuntimeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRRuntimeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRRuntimeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version_string(this : ICLRRuntimeInfo*, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version_string.call(this, pwzBuffer, pcchBuffer)
    end
    def get_runtime_directory(this : ICLRRuntimeInfo*, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBuffer : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_directory.call(this, pwzBuffer, pcchBuffer)
    end
    def is_loaded(this : ICLRRuntimeInfo*, hndProcess : Win32cr::Foundation::HANDLE, pbLoaded : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_loaded.call(this, hndProcess, pbLoaded)
    end
    def load_error_string(this : ICLRRuntimeInfo*, iResourceID : UInt32, pwzBuffer : Win32cr::Foundation::PWSTR, pcchBuffer : UInt32*, iLocaleID : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_error_string.call(this, iResourceID, pwzBuffer, pcchBuffer, iLocaleID)
    end
    def load_library_a(this : ICLRRuntimeInfo*, pwzDllName : Win32cr::Foundation::PWSTR, phndModule : Win32cr::Foundation::HMODULE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_library_a.call(this, pwzDllName, phndModule)
    end
    def get_proc_address(this : ICLRRuntimeInfo*, pszProcName : Win32cr::Foundation::PSTR, ppProc : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_proc_address.call(this, pszProcName, ppProc)
    end
    def get_interface(this : ICLRRuntimeInfo*, rclsid : LibC::GUID*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_interface.call(this, rclsid, riid, ppUnk)
    end
    def is_loadable(this : ICLRRuntimeInfo*, pbLoadable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_loadable.call(this, pbLoadable)
    end
    def set_default_startup_flags(this : ICLRRuntimeInfo*, dwStartupFlags : UInt32, pwzHostConfigFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_startup_flags.call(this, dwStartupFlags, pwzHostConfigFile)
    end
    def get_default_startup_flags(this : ICLRRuntimeInfo*, pdwStartupFlags : UInt32*, pwzHostConfigFile : Win32cr::Foundation::PWSTR, pcchHostConfigFile : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_startup_flags.call(this, pdwStartupFlags, pwzHostConfigFile, pcchHostConfigFile)
    end
    def bind_as_legacy_v2_runtime(this : ICLRRuntimeInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_as_legacy_v2_runtime.call(this)
    end
    def is_started(this : ICLRRuntimeInfo*, pbStarted : Win32cr::Foundation::BOOL*, pdwStartupFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_started.call(this, pbStarted, pdwStartupFlags)
    end

  end

  @[Extern]

  record ICLRStrongNameVtable,
    query_interface : Proc(ICLRStrongName*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRStrongName*, UInt32),
    release : Proc(ICLRStrongName*, UInt32),
    get_hash_from_assembly_file : Proc(ICLRStrongName*, Win32cr::Foundation::PSTR, UInt32*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_hash_from_assembly_file_w : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_hash_from_blob : Proc(ICLRStrongName*, UInt8*, UInt32, UInt32*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_hash_from_file : Proc(ICLRStrongName*, Win32cr::Foundation::PSTR, UInt32*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_hash_from_file_w : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_hash_from_handle : Proc(ICLRStrongName*, Win32cr::Foundation::HANDLE, UInt32*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_compare_assemblies : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_free_buffer : Proc(ICLRStrongName*, UInt8*, Win32cr::Foundation::HRESULT),
    strong_name_get_blob : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_get_blob_from_image : Proc(ICLRStrongName*, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_get_public_key : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_hash_size : Proc(ICLRStrongName*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_key_delete : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    strong_name_key_gen : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_key_gen_ex : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt32, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_key_install : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    strong_name_signature_generation : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_signature_generation_ex : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    strong_name_signature_size : Proc(ICLRStrongName*, UInt8*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_signature_verification : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_signature_verification_ex : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOLEAN, UInt8*, Win32cr::Foundation::HRESULT),
    strong_name_signature_verification_from_image : Proc(ICLRStrongName*, UInt8*, UInt32, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_token_from_assembly : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_token_from_assembly_ex : Proc(ICLRStrongName*, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    strong_name_token_from_public_key : Proc(ICLRStrongName*, UInt8*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRStrongName, lpVtbl : ICLRStrongNameVtable* do
    GUID = LibC::GUID.new(0x9fd93ccf_u32, 0x3280_u16, 0x4391_u16, StaticArray[0xb3_u8, 0xa9_u8, 0x96_u8, 0xe1_u8, 0xcd_u8, 0xe7_u8, 0x7c_u8, 0x8d_u8])
    def query_interface(this : ICLRStrongName*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRStrongName*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRStrongName*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_hash_from_assembly_file(this : ICLRStrongName*, pszFilePath : Win32cr::Foundation::PSTR, piHashAlg : UInt32*, pbHash : UInt8*, cchHash : UInt32, pchHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_from_assembly_file.call(this, pszFilePath, piHashAlg, pbHash, cchHash, pchHash)
    end
    def get_hash_from_assembly_file_w(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, piHashAlg : UInt32*, pbHash : UInt8*, cchHash : UInt32, pchHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_from_assembly_file_w.call(this, pwzFilePath, piHashAlg, pbHash, cchHash, pchHash)
    end
    def get_hash_from_blob(this : ICLRStrongName*, pbBlob : UInt8*, cchBlob : UInt32, piHashAlg : UInt32*, pbHash : UInt8*, cchHash : UInt32, pchHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_from_blob.call(this, pbBlob, cchBlob, piHashAlg, pbHash, cchHash, pchHash)
    end
    def get_hash_from_file(this : ICLRStrongName*, pszFilePath : Win32cr::Foundation::PSTR, piHashAlg : UInt32*, pbHash : UInt8*, cchHash : UInt32, pchHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_from_file.call(this, pszFilePath, piHashAlg, pbHash, cchHash, pchHash)
    end
    def get_hash_from_file_w(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, piHashAlg : UInt32*, pbHash : UInt8*, cchHash : UInt32, pchHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_from_file_w.call(this, pwzFilePath, piHashAlg, pbHash, cchHash, pchHash)
    end
    def get_hash_from_handle(this : ICLRStrongName*, hFile : Win32cr::Foundation::HANDLE, piHashAlg : UInt32*, pbHash : UInt8*, cchHash : UInt32, pchHash : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_from_handle.call(this, hFile, piHashAlg, pbHash, cchHash, pchHash)
    end
    def strong_name_compare_assemblies(this : ICLRStrongName*, pwzAssembly1 : Win32cr::Foundation::PWSTR, pwzAssembly2 : Win32cr::Foundation::PWSTR, pdwResult : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_compare_assemblies.call(this, pwzAssembly1, pwzAssembly2, pdwResult)
    end
    def strong_name_free_buffer(this : ICLRStrongName*, pbMemory : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_free_buffer.call(this, pbMemory)
    end
    def strong_name_get_blob(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, pbBlob : UInt8*, pcbBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_get_blob.call(this, pwzFilePath, pbBlob, pcbBlob)
    end
    def strong_name_get_blob_from_image(this : ICLRStrongName*, pbBase : UInt8*, dwLength : UInt32, pbBlob : UInt8*, pcbBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_get_blob_from_image.call(this, pbBase, dwLength, pbBlob, pcbBlob)
    end
    def strong_name_get_public_key(this : ICLRStrongName*, pwzKeyContainer : Win32cr::Foundation::PWSTR, pbKeyBlob : UInt8*, cbKeyBlob : UInt32, ppbPublicKeyBlob : UInt8**, pcbPublicKeyBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_get_public_key.call(this, pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbPublicKeyBlob, pcbPublicKeyBlob)
    end
    def strong_name_hash_size(this : ICLRStrongName*, ulHashAlg : UInt32, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_hash_size.call(this, ulHashAlg, pcbSize)
    end
    def strong_name_key_delete(this : ICLRStrongName*, pwzKeyContainer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_key_delete.call(this, pwzKeyContainer)
    end
    def strong_name_key_gen(this : ICLRStrongName*, pwzKeyContainer : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ppbKeyBlob : UInt8**, pcbKeyBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_key_gen.call(this, pwzKeyContainer, dwFlags, ppbKeyBlob, pcbKeyBlob)
    end
    def strong_name_key_gen_ex(this : ICLRStrongName*, pwzKeyContainer : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwKeySize : UInt32, ppbKeyBlob : UInt8**, pcbKeyBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_key_gen_ex.call(this, pwzKeyContainer, dwFlags, dwKeySize, ppbKeyBlob, pcbKeyBlob)
    end
    def strong_name_key_install(this : ICLRStrongName*, pwzKeyContainer : Win32cr::Foundation::PWSTR, pbKeyBlob : UInt8*, cbKeyBlob : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_key_install.call(this, pwzKeyContainer, pbKeyBlob, cbKeyBlob)
    end
    def strong_name_signature_generation(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, pwzKeyContainer : Win32cr::Foundation::PWSTR, pbKeyBlob : UInt8*, cbKeyBlob : UInt32, ppbSignatureBlob : UInt8**, pcbSignatureBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_generation.call(this, pwzFilePath, pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbSignatureBlob, pcbSignatureBlob)
    end
    def strong_name_signature_generation_ex(this : ICLRStrongName*, wszFilePath : Win32cr::Foundation::PWSTR, wszKeyContainer : Win32cr::Foundation::PWSTR, pbKeyBlob : UInt8*, cbKeyBlob : UInt32, ppbSignatureBlob : UInt8**, pcbSignatureBlob : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_generation_ex.call(this, wszFilePath, wszKeyContainer, pbKeyBlob, cbKeyBlob, ppbSignatureBlob, pcbSignatureBlob, dwFlags)
    end
    def strong_name_signature_size(this : ICLRStrongName*, pbPublicKeyBlob : UInt8*, cbPublicKeyBlob : UInt32, pcbSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_size.call(this, pbPublicKeyBlob, cbPublicKeyBlob, pcbSize)
    end
    def strong_name_signature_verification(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, dwInFlags : UInt32, pdwOutFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_verification.call(this, pwzFilePath, dwInFlags, pdwOutFlags)
    end
    def strong_name_signature_verification_ex(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, fForceVerification : Win32cr::Foundation::BOOLEAN, pfWasVerified : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_verification_ex.call(this, pwzFilePath, fForceVerification, pfWasVerified)
    end
    def strong_name_signature_verification_from_image(this : ICLRStrongName*, pbBase : UInt8*, dwLength : UInt32, dwInFlags : UInt32, pdwOutFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_verification_from_image.call(this, pbBase, dwLength, dwInFlags, pdwOutFlags)
    end
    def strong_name_token_from_assembly(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, ppbStrongNameToken : UInt8**, pcbStrongNameToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_token_from_assembly.call(this, pwzFilePath, ppbStrongNameToken, pcbStrongNameToken)
    end
    def strong_name_token_from_assembly_ex(this : ICLRStrongName*, pwzFilePath : Win32cr::Foundation::PWSTR, ppbStrongNameToken : UInt8**, pcbStrongNameToken : UInt32*, ppbPublicKeyBlob : UInt8**, pcbPublicKeyBlob : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_token_from_assembly_ex.call(this, pwzFilePath, ppbStrongNameToken, pcbStrongNameToken, ppbPublicKeyBlob, pcbPublicKeyBlob)
    end
    def strong_name_token_from_public_key(this : ICLRStrongName*, pbPublicKeyBlob : UInt8*, cbPublicKeyBlob : UInt32, ppbStrongNameToken : UInt8**, pcbStrongNameToken : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_token_from_public_key.call(this, pbPublicKeyBlob, cbPublicKeyBlob, ppbStrongNameToken, pcbStrongNameToken)
    end

  end

  @[Extern]

  record ICLRStrongName2Vtable,
    query_interface : Proc(ICLRStrongName2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRStrongName2*, UInt32),
    release : Proc(ICLRStrongName2*, UInt32),
    strong_name_get_public_key_ex : Proc(ICLRStrongName2*, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8**, UInt32*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    strong_name_signature_verification_ex2 : Proc(ICLRStrongName2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOLEAN, UInt8*, UInt32, UInt8*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRStrongName2, lpVtbl : ICLRStrongName2Vtable* do
    GUID = LibC::GUID.new(0xc22ed5c5_u32, 0x4b59_u16, 0x4975_u16, StaticArray[0x90_u8, 0xeb_u8, 0x85_u8, 0xea_u8, 0x55_u8, 0xc0_u8, 0x6_u8, 0x9b_u8])
    def query_interface(this : ICLRStrongName2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRStrongName2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRStrongName2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def strong_name_get_public_key_ex(this : ICLRStrongName2*, pwzKeyContainer : Win32cr::Foundation::PWSTR, pbKeyBlob : UInt8*, cbKeyBlob : UInt32, ppbPublicKeyBlob : UInt8**, pcbPublicKeyBlob : UInt32*, uHashAlgId : UInt32, uReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_get_public_key_ex.call(this, pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbPublicKeyBlob, pcbPublicKeyBlob, uHashAlgId, uReserved)
    end
    def strong_name_signature_verification_ex2(this : ICLRStrongName2*, wszFilePath : Win32cr::Foundation::PWSTR, fForceVerification : Win32cr::Foundation::BOOLEAN, pbEcmaPublicKey : UInt8*, cbEcmaPublicKey : UInt32, pfWasVerified : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_signature_verification_ex2.call(this, wszFilePath, fForceVerification, pbEcmaPublicKey, cbEcmaPublicKey, pfWasVerified)
    end

  end

  @[Extern]

  record ICLRStrongName3Vtable,
    query_interface : Proc(ICLRStrongName3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICLRStrongName3*, UInt32),
    release : Proc(ICLRStrongName3*, UInt32),
    strong_name_digest_generate : Proc(ICLRStrongName3*, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    strong_name_digest_sign : Proc(ICLRStrongName3*, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt8*, UInt32, UInt32, UInt8**, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    strong_name_digest_embed : Proc(ICLRStrongName3*, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICLRStrongName3, lpVtbl : ICLRStrongName3Vtable* do
    GUID = LibC::GUID.new(0x22c7089b_u32, 0xbbd3_u16, 0x414a_u16, StaticArray[0xb6_u8, 0x98_u8, 0x21_u8, 0xf_u8, 0x26_u8, 0x3f_u8, 0x1f_u8, 0xed_u8])
    def query_interface(this : ICLRStrongName3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICLRStrongName3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICLRStrongName3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def strong_name_digest_generate(this : ICLRStrongName3*, wszFilePath : Win32cr::Foundation::PWSTR, ppbDigestBlob : UInt8**, pcbDigestBlob : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_digest_generate.call(this, wszFilePath, ppbDigestBlob, pcbDigestBlob, dwFlags)
    end
    def strong_name_digest_sign(this : ICLRStrongName3*, wszKeyContainer : Win32cr::Foundation::PWSTR, pbKeyBlob : UInt8*, cbKeyBlob : UInt32, pbDigestBlob : UInt8*, cbDigestBlob : UInt32, hashAlgId : UInt32, ppbSignatureBlob : UInt8**, pcbSignatureBlob : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_digest_sign.call(this, wszKeyContainer, pbKeyBlob, cbKeyBlob, pbDigestBlob, cbDigestBlob, hashAlgId, ppbSignatureBlob, pcbSignatureBlob, dwFlags)
    end
    def strong_name_digest_embed(this : ICLRStrongName3*, wszFilePath : Win32cr::Foundation::PWSTR, pbSignatureBlob : UInt8*, cbSignatureBlob : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.strong_name_digest_embed.call(this, wszFilePath, pbSignatureBlob, cbSignatureBlob)
    end

  end

  def getCORSystemDirectory(pbuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetCORSystemDirectory(pbuffer, cchBuffer, dwLength)
    {% end %}
  end

  def getCORVersion(pbBuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetCORVersion(pbBuffer, cchBuffer, dwLength)
    {% end %}
  end

  def getFileVersion(szFilename : Win32cr::Foundation::PWSTR, szBuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetFileVersion(szFilename, szBuffer, cchBuffer, dwLength)
    {% end %}
  end

  def getCORRequiredVersion(pbuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetCORRequiredVersion(pbuffer, cchBuffer, dwLength)
    {% end %}
  end

  def getRequestedRuntimeInfo(pExe : Win32cr::Foundation::PWSTR, pwszVersion : Win32cr::Foundation::PWSTR, pConfigurationFile : Win32cr::Foundation::PWSTR, startupFlags : UInt32, runtimeInfoFlags : UInt32, pDirectory : Win32cr::Foundation::PWSTR, dwDirectory : UInt32, dwDirectoryLength : UInt32*, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwlength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetRequestedRuntimeInfo(pExe, pwszVersion, pConfigurationFile, startupFlags, runtimeInfoFlags, pDirectory, dwDirectory, dwDirectoryLength, pVersion, cchBuffer, dwlength)
    {% end %}
  end

  def getRequestedRuntimeVersion(pExe : Win32cr::Foundation::PWSTR, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetRequestedRuntimeVersion(pExe, pVersion, cchBuffer, dwLength)
    {% end %}
  end

  def corBindToRuntimeHost(pwszVersion : Win32cr::Foundation::PWSTR, pwszBuildFlavor : Win32cr::Foundation::PWSTR, pwszHostConfigFile : Win32cr::Foundation::PWSTR, pReserved : Void*, startupFlags : UInt32, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CorBindToRuntimeHost(pwszVersion, pwszBuildFlavor, pwszHostConfigFile, pReserved, startupFlags, rclsid, riid, ppv)
    {% end %}
  end

  def corBindToRuntimeEx(pwszVersion : Win32cr::Foundation::PWSTR, pwszBuildFlavor : Win32cr::Foundation::PWSTR, startupFlags : UInt32, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CorBindToRuntimeEx(pwszVersion, pwszBuildFlavor, startupFlags, rclsid, riid, ppv)
    {% end %}
  end

  def corBindToRuntimeByCfg(pCfgStream : Void*, reserved : UInt32, startupFlags : UInt32, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CorBindToRuntimeByCfg(pCfgStream, reserved, startupFlags, rclsid, riid, ppv)
    {% end %}
  end

  def corBindToRuntime(pwszVersion : Win32cr::Foundation::PWSTR, pwszBuildFlavor : Win32cr::Foundation::PWSTR, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CorBindToRuntime(pwszVersion, pwszBuildFlavor, rclsid, riid, ppv)
    {% end %}
  end

  def corBindToCurrentRuntime(pwszFileName : Win32cr::Foundation::PWSTR, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CorBindToCurrentRuntime(pwszFileName, rclsid, riid, ppv)
    {% end %}
  end

  def clrCreateManagedInstance(pTypeName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppObject : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.ClrCreateManagedInstance(pTypeName, riid, ppObject)
    {% end %}
  end

  def corMarkThreadInThreadPool : Void
    {% if !flag?(:docs) %}
    C.CorMarkThreadInThreadPool
    {% end %}
  end

  def runDll32ShimW(hwnd : Win32cr::Foundation::HWND, hinst : Win32cr::Foundation::HINSTANCE, lpszCmdLine : Win32cr::Foundation::PWSTR, nCmdShow : Int32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.RunDll32ShimW(hwnd, hinst, lpszCmdLine, nCmdShow)
    {% end %}
  end

  def loadLibraryShim(szDllName : Win32cr::Foundation::PWSTR, szVersion : Win32cr::Foundation::PWSTR, pvReserved : Void*, phModDll : Win32cr::Foundation::HMODULE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadLibraryShim(szDllName, szVersion, pvReserved, phModDll)
    {% end %}
  end

  def callFunctionShim(szDllName : Win32cr::Foundation::PWSTR, szFunctionName : Win32cr::Foundation::PSTR, lpvArgument1 : Void*, lpvArgument2 : Void*, szVersion : Win32cr::Foundation::PWSTR, pvReserved : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CallFunctionShim(szDllName, szFunctionName, lpvArgument1, lpvArgument2, szVersion, pvReserved)
    {% end %}
  end

  def getRealProcAddress(pwszProcName : Win32cr::Foundation::PSTR, ppv : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetRealProcAddress(pwszProcName, ppv)
    {% end %}
  end

  def corExitProcess(exitCode : Int32) : Void
    {% if !flag?(:docs) %}
    C.CorExitProcess(exitCode)
    {% end %}
  end

  def loadStringRC(iResouceID : UInt32, szBuffer : Win32cr::Foundation::PWSTR, iMax : Int32, bQuiet : Int32) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadStringRC(iResouceID, szBuffer, iMax, bQuiet)
    {% end %}
  end

  def loadStringRCEx(lcid : UInt32, iResouceID : UInt32, szBuffer : Win32cr::Foundation::PWSTR, iMax : Int32, bQuiet : Int32, pcwchUsed : Int32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LoadStringRCEx(lcid, iResouceID, szBuffer, iMax, bQuiet, pcwchUsed)
    {% end %}
  end

  def lockClrVersion(hostCallback : Win32cr::System::ClrHosting::FLockClrVersionCallback, pBeginHostSetup : Win32cr::System::ClrHosting::FLockClrVersionCallback*, pEndHostSetup : Win32cr::System::ClrHosting::FLockClrVersionCallback*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.LockClrVersion(hostCallback, pBeginHostSetup, pEndHostSetup)
    {% end %}
  end

  def createDebuggingInterfaceFromVersion(iDebuggerVersion : Int32, szDebuggeeVersion : Win32cr::Foundation::PWSTR, ppCordb : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CreateDebuggingInterfaceFromVersion(iDebuggerVersion, szDebuggeeVersion, ppCordb)
    {% end %}
  end

  def getVersionFromProcess(hProcess : Win32cr::Foundation::HANDLE, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetVersionFromProcess(hProcess, pVersion, cchBuffer, dwLength)
    {% end %}
  end

  def corLaunchApplication(dwClickOnceHost : Win32cr::System::ClrHosting::HOST_TYPE, pwzAppFullName : Win32cr::Foundation::PWSTR, dwManifestPaths : UInt32, ppwzManifestPaths : Win32cr::Foundation::PWSTR*, dwActivationData : UInt32, ppwzActivationData : Win32cr::Foundation::PWSTR*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CorLaunchApplication(dwClickOnceHost, pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, lpProcessInformation)
    {% end %}
  end

  def getRequestedRuntimeVersionForCLSID(rclsid : LibC::GUID*, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*, dwResolutionFlags : Win32cr::System::ClrHosting::CLSID_RESOLUTION_FLAGS) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetRequestedRuntimeVersionForCLSID(rclsid, pVersion, cchBuffer, dwLength, dwResolutionFlags)
    {% end %}
  end

  def getCLRIdentityManager(riid : LibC::GUID*, ppManager : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GetCLRIdentityManager(riid, ppManager)
    {% end %}
  end

  def cLRCreateInstance(clsid : LibC::GUID*, riid : LibC::GUID*, ppInterface : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.CLRCreateInstance(clsid, riid, ppInterface)
    {% end %}
  end

  @[Link("mscoree")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun GetCORSystemDirectory(pbuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetCORVersion(pbBuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetFileVersion(szFilename : Win32cr::Foundation::PWSTR, szBuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetCORRequiredVersion(pbuffer : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetRequestedRuntimeInfo(pExe : Win32cr::Foundation::PWSTR, pwszVersion : Win32cr::Foundation::PWSTR, pConfigurationFile : Win32cr::Foundation::PWSTR, startupFlags : UInt32, runtimeInfoFlags : UInt32, pDirectory : Win32cr::Foundation::PWSTR, dwDirectory : UInt32, dwDirectoryLength : UInt32*, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwlength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetRequestedRuntimeVersion(pExe : Win32cr::Foundation::PWSTR, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorBindToRuntimeHost(pwszVersion : Win32cr::Foundation::PWSTR, pwszBuildFlavor : Win32cr::Foundation::PWSTR, pwszHostConfigFile : Win32cr::Foundation::PWSTR, pReserved : Void*, startupFlags : UInt32, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorBindToRuntimeEx(pwszVersion : Win32cr::Foundation::PWSTR, pwszBuildFlavor : Win32cr::Foundation::PWSTR, startupFlags : UInt32, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorBindToRuntimeByCfg(pCfgStream : Void*, reserved : UInt32, startupFlags : UInt32, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorBindToRuntime(pwszVersion : Win32cr::Foundation::PWSTR, pwszBuildFlavor : Win32cr::Foundation::PWSTR, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorBindToCurrentRuntime(pwszFileName : Win32cr::Foundation::PWSTR, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ClrCreateManagedInstance(pTypeName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppObject : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorMarkThreadInThreadPool : Void

    # :nodoc:
    fun RunDll32ShimW(hwnd : Win32cr::Foundation::HWND, hinst : Win32cr::Foundation::HINSTANCE, lpszCmdLine : Win32cr::Foundation::PWSTR, nCmdShow : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadLibraryShim(szDllName : Win32cr::Foundation::PWSTR, szVersion : Win32cr::Foundation::PWSTR, pvReserved : Void*, phModDll : Win32cr::Foundation::HMODULE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CallFunctionShim(szDllName : Win32cr::Foundation::PWSTR, szFunctionName : Win32cr::Foundation::PSTR, lpvArgument1 : Void*, lpvArgument2 : Void*, szVersion : Win32cr::Foundation::PWSTR, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetRealProcAddress(pwszProcName : Win32cr::Foundation::PSTR, ppv : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorExitProcess(exitCode : Int32) : Void

    # :nodoc:
    fun LoadStringRC(iResouceID : UInt32, szBuffer : Win32cr::Foundation::PWSTR, iMax : Int32, bQuiet : Int32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadStringRCEx(lcid : UInt32, iResouceID : UInt32, szBuffer : Win32cr::Foundation::PWSTR, iMax : Int32, bQuiet : Int32, pcwchUsed : Int32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LockClrVersion(hostCallback : Win32cr::System::ClrHosting::FLockClrVersionCallback, pBeginHostSetup : Win32cr::System::ClrHosting::FLockClrVersionCallback*, pEndHostSetup : Win32cr::System::ClrHosting::FLockClrVersionCallback*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CreateDebuggingInterfaceFromVersion(iDebuggerVersion : Int32, szDebuggeeVersion : Win32cr::Foundation::PWSTR, ppCordb : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVersionFromProcess(hProcess : Win32cr::Foundation::HANDLE, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CorLaunchApplication(dwClickOnceHost : Win32cr::System::ClrHosting::HOST_TYPE, pwzAppFullName : Win32cr::Foundation::PWSTR, dwManifestPaths : UInt32, ppwzManifestPaths : Win32cr::Foundation::PWSTR*, dwActivationData : UInt32, ppwzActivationData : Win32cr::Foundation::PWSTR*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetRequestedRuntimeVersionForCLSID(rclsid : LibC::GUID*, pVersion : Win32cr::Foundation::PWSTR, cchBuffer : UInt32, dwLength : UInt32*, dwResolutionFlags : Win32cr::System::ClrHosting::CLSID_RESOLUTION_FLAGS) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetCLRIdentityManager(riid : LibC::GUID*, ppManager : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CLRCreateInstance(clsid : LibC::GUID*, riid : LibC::GUID*, ppInterface : Void**) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end