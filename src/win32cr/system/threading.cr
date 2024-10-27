require "./../foundation.cr"
require "./system_services.cr"
require "./kernel.cr"
require "./../security.cr"
require "./system_information.cr"

module Win32cr::System::Threading
  alias TimerQueueHandle = LibC::IntPtrT
  alias PTP_POOL = LibC::IntPtrT
  alias NamespaceHandle = LibC::IntPtrT
  alias BoundaryDescriptorHandle = LibC::IntPtrT
  alias LPPROC_THREAD_ATTRIBUTE_LIST = Void*
  alias LPTHREAD_START_ROUTINE = Proc(Void*, UInt32)*

  alias PINIT_ONCE_FN = Proc(Win32cr::System::Threading::RTL_RUN_ONCE*, Void*, Void**, Win32cr::Foundation::BOOL)*

  alias PTIMERAPCROUTINE = Proc(Void*, UInt32, UInt32, Void)*

  alias PTP_WIN32_IO_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Void*, UInt32, LibC::UIntPtrT, Win32cr::System::Threading::TP_IO*, Void)*

  alias PRTL_UMS_SCHEDULER_ENTRY_POINT = Proc(Win32cr::System::SystemServices::RTL_UMS_SCHEDULER_REASON, LibC::UIntPtrT, Void*, Void)*

  alias WAITORTIMERCALLBACK = Proc(Void*, Win32cr::Foundation::BOOLEAN, Void)*

  alias PFLS_CALLBACK_FUNCTION = Proc(Void*, Void)*

  alias PTP_SIMPLE_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Void)*

  alias PTP_CLEANUP_GROUP_CANCEL_CALLBACK = Proc(Void*, Void*, Void)*

  alias PTP_WORK_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Win32cr::System::Threading::TP_WORK*, Void)*

  alias PTP_TIMER_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Win32cr::System::Threading::TP_TIMER*, Void)*

  alias PTP_WAIT_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Win32cr::System::Threading::TP_WAIT*, UInt32, Void)*

  alias LPFIBER_START_ROUTINE = Proc(Void*, Void)*

  alias PPS_POST_PROCESS_INIT_ROUTINE = Proc(Void)*

  WAIT_OBJECT_0 = 0_u32
  WAIT_ABANDONED = 128_u32
  WAIT_ABANDONED_0 = 128_u32
  WAIT_IO_COMPLETION = 192_u32
  PRIVATE_NAMESPACE_FLAG_DESTROY = 1_u32
  PROC_THREAD_ATTRIBUTE_REPLACE_VALUE = 1_u32
  THREAD_POWER_THROTTLING_CURRENT_VERSION = 1_u32
  THREAD_POWER_THROTTLING_EXECUTION_SPEED = 1_u32
  THREAD_POWER_THROTTLING_VALID_FLAGS = 1_u32
  PME_CURRENT_VERSION = 1_u32
  PME_FAILFAST_ON_COMMIT_FAIL_DISABLE = 0_u32
  PME_FAILFAST_ON_COMMIT_FAIL_ENABLE = 1_u32
  PROCESS_POWER_THROTTLING_CURRENT_VERSION = 1_u32
  PROCESS_POWER_THROTTLING_EXECUTION_SPEED = 1_u32
  PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION = 4_u32
  PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND = 1_u32
  PROCESS_LEAP_SECOND_INFO_VALID_FLAGS = 1_u32
  INIT_ONCE_CHECK_ONLY = 1_u32
  INIT_ONCE_ASYNC = 2_u32
  INIT_ONCE_INIT_FAILED = 4_u32
  INIT_ONCE_CTX_RESERVED_BITS = 2_u32
  CONDITION_VARIABLE_LOCKMODE_SHARED = 1_u32
  MUTEX_MODIFY_STATE = 1_u32
  CREATE_MUTEX_INITIAL_OWNER = 1_u32
  CREATE_WAITABLE_TIMER_MANUAL_RESET = 1_u32
  CREATE_WAITABLE_TIMER_HIGH_RESOLUTION = 2_u32
  SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY = 1_u32
  SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY = 2_u32
  SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE = 4_u32
  PROC_THREAD_ATTRIBUTE_PARENT_PROCESS = 131072_u32
  PROC_THREAD_ATTRIBUTE_HANDLE_LIST = 131074_u32
  PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY = 196611_u32
  PROC_THREAD_ATTRIBUTE_PREFERRED_NODE = 131076_u32
  PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR = 196613_u32
  PROC_THREAD_ATTRIBUTE_UMS_THREAD = 196614_u32
  PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY = 131079_u32
  PROC_THREAD_ATTRIBUTE_SECURITY_CAPABILITIES = 131081_u32
  PROC_THREAD_ATTRIBUTE_PROTECTION_LEVEL = 131083_u32
  PROC_THREAD_ATTRIBUTE_PSEUDOCONSOLE = 131094_u32
  PROC_THREAD_ATTRIBUTE_MACHINE_TYPE = 131097_u32
  PROC_THREAD_ATTRIBUTE_ENABLE_OPTIONAL_XSTATE_FEATURES = 196635_u32
  PROC_THREAD_ATTRIBUTE_WIN32K_FILTER = 131088_u32
  PROC_THREAD_ATTRIBUTE_JOB_LIST = 131085_u32
  PROC_THREAD_ATTRIBUTE_CHILD_PROCESS_POLICY = 131086_u32
  PROC_THREAD_ATTRIBUTE_ALL_APPLICATION_PACKAGES_POLICY = 131087_u32
  PROC_THREAD_ATTRIBUTE_DESKTOP_APP_POLICY = 131090_u32
  PROC_THREAD_ATTRIBUTE_MITIGATION_AUDIT_POLICY = 131096_u32
  PROC_THREAD_ATTRIBUTE_COMPONENT_FILTER = 131098_u32

  @[Flags]
  enum THREAD_CREATION_FLAGS : UInt32
    THREAD_CREATE_RUN_IMMEDIATELY = 0_u32
    THREAD_CREATE_SUSPENDED = 4_u32
    STACK_SIZE_PARAM_IS_A_RESERVATION = 65536_u32
  end
  enum THREAD_PRIORITY
    THREAD_MODE_BACKGROUND_BEGIN = 65536_i32
    THREAD_MODE_BACKGROUND_END = 131072_i32
    THREAD_PRIORITY_ABOVE_NORMAL = 1_i32
    THREAD_PRIORITY_BELOW_NORMAL = -1_i32
    THREAD_PRIORITY_HIGHEST = 2_i32
    THREAD_PRIORITY_IDLE = -15_i32
    THREAD_PRIORITY_MIN = -2_i32
    THREAD_PRIORITY_LOWEST = -2_i32
    THREAD_PRIORITY_NORMAL = 0_i32
    THREAD_PRIORITY_TIME_CRITICAL = 15_i32
  end
  @[Flags]
  enum WORKER_THREAD_FLAGS : UInt32
    WT_EXECUTEDEFAULT = 0_u32
    WT_EXECUTEINIOTHREAD = 1_u32
    WT_EXECUTEINPERSISTENTTHREAD = 128_u32
    WT_EXECUTEINWAITTHREAD = 4_u32
    WT_EXECUTELONGFUNCTION = 16_u32
    WT_EXECUTEONLYONCE = 8_u32
    WT_TRANSFER_IMPERSONATION = 256_u32
    WT_EXECUTEINTIMERTHREAD = 32_u32
  end
  @[Flags]
  enum CREATE_EVENT : UInt32
    CREATE_EVENT_INITIAL_SET = 2_u32
    CREATE_EVENT_MANUAL_RESET = 1_u32
  end
  enum CREATE_PROCESS_LOGON_FLAGS : UInt32
    LOGON_WITH_PROFILE = 1_u32
    LOGON_NETCREDENTIALS_ONLY = 2_u32
  end
  enum PROCESS_AFFINITY_AUTO_UPDATE_FLAGS : UInt32
    PROCESS_AFFINITY_DISABLE_AUTO_UPDATE = 0_u32
    PROCESS_AFFINITY_ENABLE_AUTO_UPDATE = 1_u32
  end
  @[Flags]
  enum PROCESS_DEP_FLAGS : UInt32
    PROCESS_DEP_ENABLE = 1_u32
    PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION = 2_u32
    PROCESS_DEP_NONE = 0_u32
  end
  enum PROCESS_NAME_FORMAT : UInt32
    PROCESS_NAME_WIN32 = 0_u32
    PROCESS_NAME_NATIVE = 1_u32
  end
  enum PROCESSOR_FEATURE_ID : UInt32
    PF_ARM_64BIT_LOADSTORE_ATOMIC = 25_u32
    PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE = 24_u32
    PF_ARM_EXTERNAL_CACHE_AVAILABLE = 26_u32
    PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE = 27_u32
    PF_ARM_VFP_32_REGISTERS_AVAILABLE = 18_u32
    PF_3DNOW_INSTRUCTIONS_AVAILABLE = 7_u32
    PF_CHANNELS_ENABLED = 16_u32
    PF_COMPARE_EXCHANGE_DOUBLE = 2_u32
    PF_COMPARE_EXCHANGE128 = 14_u32
    PF_COMPARE64_EXCHANGE128 = 15_u32
    PF_FASTFAIL_AVAILABLE = 23_u32
    PF_FLOATING_POINT_EMULATED = 1_u32
    PF_FLOATING_POINT_PRECISION_ERRATA = 0_u32
    PF_MMX_INSTRUCTIONS_AVAILABLE = 3_u32
    PF_NX_ENABLED = 12_u32
    PF_PAE_ENABLED = 9_u32
    PF_RDTSC_INSTRUCTION_AVAILABLE = 8_u32
    PF_RDWRFSGSBASE_AVAILABLE = 22_u32
    PF_SECOND_LEVEL_ADDRESS_TRANSLATION = 20_u32
    PF_SSE3_INSTRUCTIONS_AVAILABLE = 13_u32
    PF_VIRT_FIRMWARE_ENABLED = 21_u32
    PF_XMMI_INSTRUCTIONS_AVAILABLE = 6_u32
    PF_XMMI64_INSTRUCTIONS_AVAILABLE = 10_u32
    PF_XSAVE_ENABLED = 17_u32
    PF_ARM_V8_INSTRUCTIONS_AVAILABLE = 29_u32
    PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE = 30_u32
    PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE = 31_u32
    PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE = 34_u32
  end
  enum GET_GUI_RESOURCES_FLAGS : UInt32
    GR_GDIOBJECTS = 0_u32
    GR_GDIOBJECTS_PEAK = 2_u32
    GR_USEROBJECTS = 1_u32
    GR_USEROBJECTS_PEAK = 4_u32
  end
  @[Flags]
  enum STARTUPINFOW_FLAGS : UInt32
    STARTF_FORCEONFEEDBACK = 64_u32
    STARTF_FORCEOFFFEEDBACK = 128_u32
    STARTF_PREVENTPINNING = 8192_u32
    STARTF_RUNFULLSCREEN = 32_u32
    STARTF_TITLEISAPPID = 4096_u32
    STARTF_TITLEISLINKNAME = 2048_u32
    STARTF_UNTRUSTEDSOURCE = 32768_u32
    STARTF_USECOUNTCHARS = 8_u32
    STARTF_USEFILLATTRIBUTE = 16_u32
    STARTF_USEHOTKEY = 512_u32
    STARTF_USEPOSITION = 4_u32
    STARTF_USESHOWWINDOW = 1_u32
    STARTF_USESIZE = 2_u32
    STARTF_USESTDHANDLES = 256_u32
  end
  enum MEMORY_PRIORITY : UInt32
    MEMORY_PRIORITY_VERY_LOW = 1_u32
    MEMORY_PRIORITY_LOW = 2_u32
    MEMORY_PRIORITY_MEDIUM = 3_u32
    MEMORY_PRIORITY_BELOW_NORMAL = 4_u32
    MEMORY_PRIORITY_NORMAL = 5_u32
  end
  enum PROCESS_PROTECTION_LEVEL : UInt32
    PROTECTION_LEVEL_WINTCB_LIGHT = 0_u32
    PROTECTION_LEVEL_WINDOWS = 1_u32
    PROTECTION_LEVEL_WINDOWS_LIGHT = 2_u32
    PROTECTION_LEVEL_ANTIMALWARE_LIGHT = 3_u32
    PROTECTION_LEVEL_LSA_LIGHT = 4_u32
    PROTECTION_LEVEL_WINTCB = 5_u32
    PROTECTION_LEVEL_CODEGEN_LIGHT = 6_u32
    PROTECTION_LEVEL_AUTHENTICODE = 7_u32
    PROTECTION_LEVEL_PPL_APP = 8_u32
    PROTECTION_LEVEL_NONE = 4294967294_u32
  end
  enum POWER_REQUEST_CONTEXT_FLAGS : UInt32
    POWER_REQUEST_CONTEXT_DETAILED_STRING = 2_u32
    POWER_REQUEST_CONTEXT_SIMPLE_STRING = 1_u32
  end
  @[Flags]
  enum THREAD_ACCESS_RIGHTS : UInt32
    THREAD_TERMINATE = 1_u32
    THREAD_SUSPEND_RESUME = 2_u32
    THREAD_GET_CONTEXT = 8_u32
    THREAD_SET_CONTEXT = 16_u32
    THREAD_SET_INFORMATION = 32_u32
    THREAD_QUERY_INFORMATION = 64_u32
    THREAD_SET_THREAD_TOKEN = 128_u32
    THREAD_IMPERSONATE = 256_u32
    THREAD_DIRECT_IMPERSONATION = 512_u32
    THREAD_SET_LIMITED_INFORMATION = 1024_u32
    THREAD_QUERY_LIMITED_INFORMATION = 2048_u32
    THREAD_RESUME = 4096_u32
    THREAD_ALL_ACCESS = 2097151_u32
    THREAD_DELETE = 65536_u32
    THREAD_READ_CONTROL = 131072_u32
    THREAD_WRITE_DAC = 262144_u32
    THREAD_WRITE_OWNER = 524288_u32
    THREAD_SYNCHRONIZE = 1048576_u32
    THREAD_STANDARD_RIGHTS_REQUIRED = 983040_u32
  end
  @[Flags]
  enum PROCESS_CREATION_FLAGS : UInt32
    DEBUG_PROCESS = 1_u32
    DEBUG_ONLY_THIS_PROCESS = 2_u32
    CREATE_SUSPENDED = 4_u32
    DETACHED_PROCESS = 8_u32
    CREATE_NEW_CONSOLE = 16_u32
    NORMAL_PRIORITY_CLASS = 32_u32
    IDLE_PRIORITY_CLASS = 64_u32
    HIGH_PRIORITY_CLASS = 128_u32
    REALTIME_PRIORITY_CLASS = 256_u32
    CREATE_NEW_PROCESS_GROUP = 512_u32
    CREATE_UNICODE_ENVIRONMENT = 1024_u32
    CREATE_SEPARATE_WOW_VDM = 2048_u32
    CREATE_SHARED_WOW_VDM = 4096_u32
    CREATE_FORCEDOS = 8192_u32
    BELOW_NORMAL_PRIORITY_CLASS = 16384_u32
    ABOVE_NORMAL_PRIORITY_CLASS = 32768_u32
    INHERIT_PARENT_AFFINITY = 65536_u32
    INHERIT_CALLER_PRIORITY = 131072_u32
    CREATE_PROTECTED_PROCESS = 262144_u32
    EXTENDED_STARTUPINFO_PRESENT = 524288_u32
    PROCESS_MODE_BACKGROUND_BEGIN = 1048576_u32
    PROCESS_MODE_BACKGROUND_END = 2097152_u32
    CREATE_SECURE_PROCESS = 4194304_u32
    CREATE_BREAKAWAY_FROM_JOB = 16777216_u32
    CREATE_PRESERVE_CODE_AUTHZ_LEVEL = 33554432_u32
    CREATE_DEFAULT_ERROR_MODE = 67108864_u32
    CREATE_NO_WINDOW = 134217728_u32
    PROFILE_USER = 268435456_u32
    PROFILE_KERNEL = 536870912_u32
    PROFILE_SERVER = 1073741824_u32
    CREATE_IGNORE_SYSTEM_DEFAULT = 2147483648_u32
  end
  @[Flags]
  enum PROCESS_ACCESS_RIGHTS : UInt32
    PROCESS_TERMINATE = 1_u32
    PROCESS_CREATE_THREAD = 2_u32
    PROCESS_SET_SESSIONID = 4_u32
    PROCESS_VM_OPERATION = 8_u32
    PROCESS_VM_READ = 16_u32
    PROCESS_VM_WRITE = 32_u32
    PROCESS_DUP_HANDLE = 64_u32
    PROCESS_CREATE_PROCESS = 128_u32
    PROCESS_SET_QUOTA = 256_u32
    PROCESS_SET_INFORMATION = 512_u32
    PROCESS_QUERY_INFORMATION = 1024_u32
    PROCESS_SUSPEND_RESUME = 2048_u32
    PROCESS_QUERY_LIMITED_INFORMATION = 4096_u32
    PROCESS_SET_LIMITED_INFORMATION = 8192_u32
    PROCESS_ALL_ACCESS = 2097151_u32
    PROCESS_DELETE = 65536_u32
    PROCESS_READ_CONTROL = 131072_u32
    PROCESS_WRITE_DAC = 262144_u32
    PROCESS_WRITE_OWNER = 524288_u32
    PROCESS_SYNCHRONIZE = 1048576_u32
    PROCESS_STANDARD_RIGHTS_REQUIRED = 983040_u32
  end
  enum QUEUE_USER_APC_FLAGS
    QUEUE_USER_APC_FLAGS_NONE = 0_i32
    QUEUE_USER_APC_FLAGS_SPECIAL_USER_APC = 1_i32
  end
  enum THREAD_INFORMATION_CLASS
    ThreadMemoryPriority = 0_i32
    ThreadAbsoluteCpuPriority = 1_i32
    ThreadDynamicCodePolicy = 2_i32
    ThreadPowerThrottling = 3_i32
    ThreadInformationClassMax = 4_i32
  end
  enum PROCESS_INFORMATION_CLASS
    ProcessMemoryPriority = 0_i32
    ProcessMemoryExhaustionInfo = 1_i32
    ProcessAppMemoryInfo = 2_i32
    ProcessInPrivateInfo = 3_i32
    ProcessPowerThrottling = 4_i32
    ProcessReservedValue1 = 5_i32
    ProcessTelemetryCoverageInfo = 6_i32
    ProcessProtectionLevelInfo = 7_i32
    ProcessLeapSecondInfo = 8_i32
    ProcessMachineTypeInfo = 9_i32
    ProcessInformationClassMax = 10_i32
  end
  @[Flags]
  enum MACHINE_ATTRIBUTES : UInt32
    UserEnabled = 1_u32
    KernelEnabled = 2_u32
    Wow64Container = 4_u32
  end
  enum PROCESS_MEMORY_EXHAUSTION_TYPE
    PMETypeFailFastOnCommitFailure = 0_i32
    PMETypeMax = 1_i32
  end
  enum AVRT_PRIORITY
    AVRT_PRIORITY_VERYLOW = -2_i32
    AVRT_PRIORITY_LOW = -1_i32
    AVRT_PRIORITY_NORMAL = 0_i32
    AVRT_PRIORITY_HIGH = 1_i32
    AVRT_PRIORITY_CRITICAL = 2_i32
  end
  enum PROCESS_MITIGATION_POLICY
    ProcessDEPPolicy = 0_i32
    ProcessASLRPolicy = 1_i32
    ProcessDynamicCodePolicy = 2_i32
    ProcessStrictHandleCheckPolicy = 3_i32
    ProcessSystemCallDisablePolicy = 4_i32
    ProcessMitigationOptionsMask = 5_i32
    ProcessExtensionPointDisablePolicy = 6_i32
    ProcessControlFlowGuardPolicy = 7_i32
    ProcessSignaturePolicy = 8_i32
    ProcessFontDisablePolicy = 9_i32
    ProcessImageLoadPolicy = 10_i32
    ProcessSystemCallFilterPolicy = 11_i32
    ProcessPayloadRestrictionPolicy = 12_i32
    ProcessChildProcessPolicy = 13_i32
    ProcessSideChannelIsolationPolicy = 14_i32
    ProcessUserShadowStackPolicy = 15_i32
    ProcessRedirectionTrustPolicy = 16_i32
    MaxProcessMitigationPolicy = 17_i32
  end
  enum RTL_UMS_THREAD_INFO_CLASS
    UmsThreadInvalidInfoClass = 0_i32
    UmsThreadUserContext = 1_i32
    UmsThreadPriority = 2_i32
    UmsThreadAffinity = 3_i32
    UmsThreadTeb = 4_i32
    UmsThreadIsSuspended = 5_i32
    UmsThreadIsTerminated = 6_i32
    UmsThreadMaxInfoClass = 7_i32
  end
  enum TP_CALLBACK_PRIORITY
    TP_CALLBACK_PRIORITY_HIGH = 0_i32
    TP_CALLBACK_PRIORITY_NORMAL = 1_i32
    TP_CALLBACK_PRIORITY_LOW = 2_i32
    TP_CALLBACK_PRIORITY_INVALID = 3_i32
    TP_CALLBACK_PRIORITY_COUNT = 3_i32
  end
  enum PROC_THREAD_ATTRIBUTE_NUM : UInt32
    ProcThreadAttributeParentProcess = 0_u32
    ProcThreadAttributeHandleList = 2_u32
    ProcThreadAttributeGroupAffinity = 3_u32
    ProcThreadAttributePreferredNode = 4_u32
    ProcThreadAttributeIdealProcessor = 5_u32
    ProcThreadAttributeUmsThread = 6_u32
    ProcThreadAttributeMitigationPolicy = 7_u32
    ProcThreadAttributeSecurityCapabilities = 9_u32
    ProcThreadAttributeProtectionLevel = 11_u32
    ProcThreadAttributeJobList = 13_u32
    ProcThreadAttributeChildProcessPolicy = 14_u32
    ProcThreadAttributeAllApplicationPackagesPolicy = 15_u32
    ProcThreadAttributeWin32kFilter = 16_u32
    ProcThreadAttributeSafeOpenPromptOriginClaim = 17_u32
    ProcThreadAttributeDesktopAppPolicy = 18_u32
    ProcThreadAttributePseudoConsole = 22_u32
    ProcThreadAttributeMitigationAuditPolicy = 24_u32
    ProcThreadAttributeMachineType = 25_u32
    ProcThreadAttributeComponentFilter = 26_u32
    ProcThreadAttributeEnableOptionalXStateFeatures = 27_u32
  end
  enum PROCESSINFOCLASS
    ProcessBasicInformation = 0_i32
    ProcessDebugPort = 7_i32
    ProcessWow64Information = 26_i32
    ProcessImageFileName = 27_i32
    ProcessBreakOnTermination = 29_i32
  end
  enum THREADINFOCLASS
    ThreadIsIoPending = 16_i32
    ThreadNameInformation = 38_i32
  end

  @[Extern]
  record TP_CALLBACK_INSTANCE
  @[Extern]
  record TP_WORK
  @[Extern]
  record TP_TIMER
  @[Extern]
  record TP_WAIT
  @[Extern]
  record TP_IO
  @[Extern]
  record REASON_CONTEXT,
    version : UInt32,
    flags : Win32cr::System::Threading::POWER_REQUEST_CONTEXT_FLAGS,
    reason : Reason_e__Union do

    # Nested Type Reason_e__Union
    @[Extern(union: true)]
    record Reason_e__Union,
      detailed : Detailed_e__Struct,
      simple_reason_string : Win32cr::Foundation::PWSTR do

      # Nested Type Detailed_e__Struct
      @[Extern]
      record Detailed_e__Struct,
        localized_reason_module : Win32cr::Foundation::HINSTANCE,
        localized_reason_id : UInt32,
        reason_string_count : UInt32,
        reason_strings : Win32cr::Foundation::PWSTR*

    end

  end

  @[Extern]
  record PROCESS_INFORMATION,
    hProcess : Win32cr::Foundation::HANDLE,
    hThread : Win32cr::Foundation::HANDLE,
    dwProcessId : UInt32,
    dwThreadId : UInt32

  @[Extern]
  record STARTUPINFOA,
    cb : UInt32,
    lpReserved : Win32cr::Foundation::PSTR,
    lpDesktop : Win32cr::Foundation::PSTR,
    lpTitle : Win32cr::Foundation::PSTR,
    dwX : UInt32,
    dwY : UInt32,
    dwXSize : UInt32,
    dwYSize : UInt32,
    dwXCountChars : UInt32,
    dwYCountChars : UInt32,
    dwFillAttribute : UInt32,
    dwFlags : Win32cr::System::Threading::STARTUPINFOW_FLAGS,
    wShowWindow : UInt16,
    cbReserved2 : UInt16,
    lpReserved2 : UInt8*,
    hStdInput : Win32cr::Foundation::HANDLE,
    hStdOutput : Win32cr::Foundation::HANDLE,
    hStdError : Win32cr::Foundation::HANDLE

  @[Extern]
  record STARTUPINFOW,
    cb : UInt32,
    lpReserved : Win32cr::Foundation::PWSTR,
    lpDesktop : Win32cr::Foundation::PWSTR,
    lpTitle : Win32cr::Foundation::PWSTR,
    dwX : UInt32,
    dwY : UInt32,
    dwXSize : UInt32,
    dwYSize : UInt32,
    dwXCountChars : UInt32,
    dwYCountChars : UInt32,
    dwFillAttribute : UInt32,
    dwFlags : Win32cr::System::Threading::STARTUPINFOW_FLAGS,
    wShowWindow : UInt16,
    cbReserved2 : UInt16,
    lpReserved2 : UInt8*,
    hStdInput : Win32cr::Foundation::HANDLE,
    hStdOutput : Win32cr::Foundation::HANDLE,
    hStdError : Win32cr::Foundation::HANDLE

  @[Extern]
  record MEMORY_PRIORITY_INFORMATION,
    memory_priority : Win32cr::System::Threading::MEMORY_PRIORITY

  @[Extern]
  record THREAD_POWER_THROTTLING_STATE,
    version : UInt32,
    control_mask : UInt32,
    state_mask : UInt32

  @[Extern]
  record APP_MEMORY_INFORMATION,
    available_commit : UInt64,
    private_commit_usage : UInt64,
    peak_private_commit_usage : UInt64,
    total_commit_usage : UInt64

  @[Extern]
  record PROCESS_MACHINE_INFORMATION,
    process_machine : UInt16,
    res0 : UInt16,
    machine_attributes : Win32cr::System::Threading::MACHINE_ATTRIBUTES

  @[Extern]
  record PROCESS_MEMORY_EXHAUSTION_INFO,
    version : UInt16,
    reserved : UInt16,
    type__ : Win32cr::System::Threading::PROCESS_MEMORY_EXHAUSTION_TYPE,
    value : LibC::UIntPtrT

  @[Extern]
  record PROCESS_POWER_THROTTLING_STATE,
    version : UInt32,
    control_mask : UInt32,
    state_mask : UInt32

  @[Extern]
  record PROCESS_PROTECTION_LEVEL_INFORMATION,
    protection_level : Win32cr::System::Threading::PROCESS_PROTECTION_LEVEL

  @[Extern]
  record PROCESS_LEAP_SECOND_INFO,
    flags : UInt32,
    reserved : UInt32

  @[Extern]
  record PROCESS_DYNAMIC_EH_CONTINUATION_TARGET,
    target_address : LibC::UIntPtrT,
    flags : LibC::UIntPtrT

  @[Extern]
  record PROCESS_DYNAMIC_EH_CONTINUATION_TARGETS_INFORMATION,
    number_of_targets : UInt16,
    reserved : UInt16,
    reserved2 : UInt32,
    targets : Win32cr::System::Threading::PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*

  @[Extern]
  record PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE,
    base_address : LibC::UIntPtrT,
    size : LibC::UIntPtrT,
    flags : UInt32

  @[Extern]
  record PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGES_INFORMATION,
    number_of_ranges : UInt16,
    reserved : UInt16,
    reserved2 : UInt32,
    ranges : Win32cr::System::Threading::PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*

  @[Extern]
  record IO_COUNTERS,
    read_operation_count : UInt64,
    write_operation_count : UInt64,
    other_operation_count : UInt64,
    read_transfer_count : UInt64,
    write_transfer_count : UInt64,
    other_transfer_count : UInt64

  @[Extern(union: true)]
  record RTL_RUN_ONCE,
    ptr : Void*

  @[Extern]
  record RTL_BARRIER,
    reserved1 : UInt32,
    reserved2 : UInt32,
    reserved3 : LibC::UIntPtrT[2],
    reserved4 : UInt32,
    reserved5 : UInt32

  @[Extern]
  record RTL_CRITICAL_SECTION_DEBUG,
    type__ : UInt16,
    creator_back_trace_index : UInt16,
    critical_section : Win32cr::System::Threading::RTL_CRITICAL_SECTION*,
    process_locks_list : Win32cr::System::Kernel::LIST_ENTRY,
    entry_count : UInt32,
    contention_count : UInt32,
    flags : UInt32,
    creator_back_trace_index_high : UInt16,
    spare_word : UInt16

  @[Extern]
  record RTL_CRITICAL_SECTION,
    debug_info : Win32cr::System::Threading::RTL_CRITICAL_SECTION_DEBUG*,
    lock_count : Int32,
    recursion_count : Int32,
    owning_thread : Win32cr::Foundation::HANDLE,
    lock_semaphore : Win32cr::Foundation::HANDLE,
    spin_count : LibC::UIntPtrT

  @[Extern]
  record RTL_SRWLOCK,
    ptr : Void*

  @[Extern]
  record RTL_CONDITION_VARIABLE,
    ptr : Void*

  @[Extern]
  record TP_POOL_STACK_INFORMATION,
    stack_reserve : LibC::UIntPtrT,
    stack_commit : LibC::UIntPtrT

  @[Extern]
  record TP_CALLBACK_ENVIRON_V3,
    version : UInt32,
    pool : Win32cr::System::Threading::PTP_POOL,
    cleanup_group : LibC::IntPtrT,
    cleanup_group_cancel_callback : Win32cr::System::Threading::PTP_CLEANUP_GROUP_CANCEL_CALLBACK,
    race_dll : Void*,
    activation_context : LibC::IntPtrT,
    finalization_callback : Win32cr::System::Threading::PTP_SIMPLE_CALLBACK,
    u : U_e__union,
    callback_priority : Win32cr::System::Threading::TP_CALLBACK_PRIORITY,
    size : UInt32 do

    # Nested Type U_e__union
    @[Extern(union: true)]
    record U_e__union,
      flags : UInt32,
      s : S_e__struct do

      # Nested Type S_e__struct
      @[Extern]
      record S_e__struct,
        _bitfield : UInt32

    end


    # Nested Type ACTIVATION_CONTEXT
    @[Extern]
    record ACTIVATION_CONTEXT
  end

  @[Extern]
  record UMS_SCHEDULER_STARTUP_INFO,
    ums_version : UInt32,
    completion_list : Void*,
    scheduler_proc : Win32cr::System::Threading::PRTL_UMS_SCHEDULER_ENTRY_POINT,
    scheduler_param : Void*

  @[Extern]
  record UMS_SYSTEM_THREAD_INFORMATION,
    ums_version : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      thread_ums_flags : UInt32 do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        _bitfield : UInt32

    end

  end

  @[Extern]
  record STARTUPINFOEXA,
    startup_info : Win32cr::System::Threading::STARTUPINFOA,
    lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST

  @[Extern]
  record STARTUPINFOEXW,
    startup_info : Win32cr::System::Threading::STARTUPINFOW,
    lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST

  @[Extern]
  record PEB_LDR_DATA,
    reserved1 : UInt8[8],
    reserved2 : Void*[3],
    in_memory_order_module_list : Win32cr::System::Kernel::LIST_ENTRY

  @[Extern]
  record RTL_USER_PROCESS_PARAMETERS,
    reserved1 : UInt8[16],
    reserved2 : Void*[10],
    image_path_name : Win32cr::Foundation::UNICODE_STRING,
    command_line : Win32cr::Foundation::UNICODE_STRING

  @[Extern]
  record PEB,
    reserved1 : UInt8[2],
    being_debugged : UInt8,
    reserved2 : UInt8*,
    reserved3 : Void*[2],
    ldr : Win32cr::System::Threading::PEB_LDR_DATA*,
    process_parameters : Win32cr::System::Threading::RTL_USER_PROCESS_PARAMETERS*,
    reserved4 : Void*[3],
    atl_thunk_s_list_ptr : Void*,
    reserved5 : Void*,
    reserved6 : UInt32,
    reserved7 : Void*,
    reserved8 : UInt32,
    atl_thunk_s_list_ptr32 : UInt32,
    reserved9 : Void*[45],
    reserved10 : UInt8[96],
    post_process_init_routine : Win32cr::System::Threading::PPS_POST_PROCESS_INIT_ROUTINE,
    reserved11 : UInt8[128],
    reserved12 : Void**,
    session_id : UInt32

  @[Extern]
  record PROCESS_BASIC_INFORMATION,
    reserved1 : Void*,
    peb_base_address : Win32cr::System::Threading::PEB*,
    reserved2 : Void*[2],
    unique_process_id : LibC::UIntPtrT,
    reserved3 : Void*

  @[Link("kernel32")]
  @[Link("vertdll")]
  @[Link("advapi32")]
  @[Link("api-ms-win-core-wow64-l1-1-1")]
  @[Link("avrt")]
  @[Link("user32")]
  @[Link("ntdll")]
  lib C
    fun GetProcessWorkingSetSize(hProcess : Win32cr::Foundation::HANDLE, lpMinimumWorkingSetSize : LibC::UIntPtrT*, lpMaximumWorkingSetSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun SetProcessWorkingSetSize(hProcess : Win32cr::Foundation::HANDLE, dwMinimumWorkingSetSize : LibC::UIntPtrT, dwMaximumWorkingSetSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun FlsAlloc(lpCallback : Win32cr::System::Threading::PFLS_CALLBACK_FUNCTION) : UInt32

    fun FlsGetValue(dwFlsIndex : UInt32) : Void*

    fun FlsSetValue(dwFlsIndex : UInt32, lpFlsData : Void*) : Win32cr::Foundation::BOOL

    fun FlsFree(dwFlsIndex : UInt32) : Win32cr::Foundation::BOOL

    fun IsThreadAFiber : Win32cr::Foundation::BOOL

    fun InitializeSRWLock(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    fun ReleaseSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    fun ReleaseSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    fun AcquireSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    fun AcquireSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    fun TryAcquireSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Win32cr::Foundation::BOOLEAN

    fun TryAcquireSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Win32cr::Foundation::BOOLEAN

    fun InitializeCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # Commented out due to being part of LibC
    #fun EnterCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # Commented out due to being part of LibC
    #fun LeaveCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # Commented out due to being part of LibC
    #fun InitializeCriticalSectionAndSpinCount(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32) : Win32cr::Foundation::BOOL

    fun InitializeCriticalSectionEx(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun SetCriticalSectionSpinCount(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32) : UInt32

    # Commented out due to being part of LibC
    #fun TryEnterCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun DeleteCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    fun InitOnceInitialize(init_once : Win32cr::System::Threading::RTL_RUN_ONCE*) : Void

    fun InitOnceExecuteOnce(init_once : Win32cr::System::Threading::RTL_RUN_ONCE*, init_fn : Win32cr::System::Threading::PINIT_ONCE_FN, parameter : Void*, context : Void**) : Win32cr::Foundation::BOOL

    fun InitOnceBeginInitialize(lpInitOnce : Win32cr::System::Threading::RTL_RUN_ONCE*, dwFlags : UInt32, fPending : Win32cr::Foundation::BOOL*, lpContext : Void**) : Win32cr::Foundation::BOOL

    fun InitOnceComplete(lpInitOnce : Win32cr::System::Threading::RTL_RUN_ONCE*, dwFlags : UInt32, lpContext : Void*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun InitializeConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void

    # Commented out due to being part of LibC
    #fun WakeConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void

    # Commented out due to being part of LibC
    #fun WakeAllConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void

    # Commented out due to being part of LibC
    #fun SleepConditionVariableCS(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*, critical_section : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    fun SleepConditionVariableSRW(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*, srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*, dwMilliseconds : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    fun SetEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun ResetEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun ReleaseSemaphore(hSemaphore : Win32cr::Foundation::HANDLE, lReleaseCount : Int32, lpPreviousCount : Int32*) : Win32cr::Foundation::BOOL

    fun ReleaseMutex(hMutex : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun WaitForSingleObject(hHandle : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32) : UInt32

    fun SleepEx(dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    fun WaitForSingleObjectEx(hHandle : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    fun WaitForMultipleObjectsEx(nCount : UInt32, lpHandles : Win32cr::Foundation::HANDLE*, bWaitAll : Win32cr::Foundation::BOOL, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    fun CreateMutexA(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInitialOwner : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    fun CreateMutexW(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInitialOwner : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun OpenMutexW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun CreateEventA(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, bInitialState : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    fun CreateEventW(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, bInitialState : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun OpenEventA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    fun OpenEventW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun OpenSemaphoreW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun OpenWaitableTimerW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun SetWaitableTimerEx(hTimer : Win32cr::Foundation::HANDLE, lpDueTime : Win32cr::Foundation::LARGE_INTEGER*, lPeriod : Int32, pfnCompletionRoutine : Win32cr::System::Threading::PTIMERAPCROUTINE, lpArgToCompletionRoutine : Void*, wake_context : Win32cr::System::Threading::REASON_CONTEXT*, tolerable_delay : UInt32) : Win32cr::Foundation::BOOL

    fun SetWaitableTimer(hTimer : Win32cr::Foundation::HANDLE, lpDueTime : Win32cr::Foundation::LARGE_INTEGER*, lPeriod : Int32, pfnCompletionRoutine : Win32cr::System::Threading::PTIMERAPCROUTINE, lpArgToCompletionRoutine : Void*, fResume : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun CancelWaitableTimer(hTimer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun CreateMutexExA(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun CreateMutexExW(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun CreateEventExA(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR, dwFlags : Win32cr::System::Threading::CREATE_EVENT, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun CreateEventExW(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Threading::CREATE_EVENT, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun CreateSemaphoreExW(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun CreateWaitableTimerExW(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpTimerName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun EnterSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun InitializeSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*, lTotalThreads : Int32, lSpinCount : Int32) : Win32cr::Foundation::BOOL

    fun DeleteSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun Sleep(dwMilliseconds : UInt32) : Void

    fun WaitOnAddress(address : Void*, compare_address : Void*, address_size : LibC::UIntPtrT, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    fun WakeByAddressSingle(address : Void*) : Void

    fun WakeByAddressAll(address : Void*) : Void

    fun WaitForMultipleObjects(nCount : UInt32, lpHandles : Win32cr::Foundation::HANDLE*, bWaitAll : Win32cr::Foundation::BOOL, dwMilliseconds : UInt32) : UInt32

    fun CreateSemaphoreW(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun CreateWaitableTimerW(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    fun InitializeSListHead(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Void

    fun InterlockedPopEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun InterlockedPushEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list_entry : Win32cr::System::Kernel::SLIST_ENTRY*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun InterlockedPushListSListEx(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list : Win32cr::System::Kernel::SLIST_ENTRY*, list_end : Win32cr::System::Kernel::SLIST_ENTRY*, count : UInt32) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun InterlockedFlushSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    fun QueryDepthSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : UInt16

    # Commented out due to being part of LibC
    #fun QueueUserAPC(pfnAPC : Win32cr::Foundation::PAPCFUNC, hThread : Win32cr::Foundation::HANDLE, dwData : LibC::UIntPtrT) : UInt32

    fun QueueUserAPC2(apc_routine : Win32cr::Foundation::PAPCFUNC, thread : Win32cr::Foundation::HANDLE, data : LibC::UIntPtrT, flags : Win32cr::System::Threading::QUEUE_USER_APC_FLAGS) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetProcessTimes(hProcess : Win32cr::Foundation::HANDLE, lpCreationTime : Win32cr::Foundation::FILETIME*, lpExitTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetCurrentProcess : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    #fun GetCurrentProcessId : UInt32

    # Commented out due to being part of LibC
    #fun ExitProcess(uExitCode : UInt32) : Void

    # Commented out due to being part of LibC
    #fun TerminateProcess(hProcess : Win32cr::Foundation::HANDLE, uExitCode : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetExitCodeProcess(hProcess : Win32cr::Foundation::HANDLE, lpExitCode : UInt32*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun SwitchToThread : Win32cr::Foundation::BOOL

    fun CreateThread(lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : Win32cr::System::Threading::THREAD_CREATION_FLAGS, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE

    fun CreateRemoteThread(hProcess : Win32cr::Foundation::HANDLE, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : UInt32, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    #fun GetCurrentThread : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    #fun GetCurrentThreadId : UInt32

    fun OpenThread(dwDesiredAccess : Win32cr::System::Threading::THREAD_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, dwThreadId : UInt32) : Win32cr::Foundation::HANDLE

    fun SetThreadPriority(hThread : Win32cr::Foundation::HANDLE, nPriority : Win32cr::System::Threading::THREAD_PRIORITY) : Win32cr::Foundation::BOOL

    fun SetThreadPriorityBoost(hThread : Win32cr::Foundation::HANDLE, bDisablePriorityBoost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun GetThreadPriorityBoost(hThread : Win32cr::Foundation::HANDLE, pDisablePriorityBoost : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetThreadPriority(hThread : Win32cr::Foundation::HANDLE) : Int32

    fun ExitThread(dwExitCode : UInt32) : Void

    fun TerminateThread(hThread : Win32cr::Foundation::HANDLE, dwExitCode : UInt32) : Win32cr::Foundation::BOOL

    fun GetExitCodeThread(hThread : Win32cr::Foundation::HANDLE, lpExitCode : UInt32*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun SuspendThread(hThread : Win32cr::Foundation::HANDLE) : UInt32

    # Commented out due to being part of LibC
    #fun ResumeThread(hThread : Win32cr::Foundation::HANDLE) : UInt32

    fun TlsAlloc : UInt32

    fun TlsGetValue(dwTlsIndex : UInt32) : Void*

    fun TlsSetValue(dwTlsIndex : UInt32, lpTlsValue : Void*) : Win32cr::Foundation::BOOL

    fun TlsFree(dwTlsIndex : UInt32) : Win32cr::Foundation::BOOL

    fun CreateProcessA(lpApplicationName : Win32cr::Foundation::PSTR, lpCommandLine : Win32cr::Foundation::PSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : Win32cr::System::Threading::PROCESS_CREATION_FLAGS, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun CreateProcessW(lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : Win32cr::System::Threading::PROCESS_CREATION_FLAGS, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    fun SetProcessShutdownParameters(dwLevel : UInt32, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun GetProcessVersion(process_id : UInt32) : UInt32

    fun GetStartupInfoW(lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*) : Void

    fun CreateProcessAsUserW(hToken : Win32cr::Foundation::HANDLE, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    fun SetThreadToken(thread : Win32cr::Foundation::HANDLE*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun OpenProcessToken(process_handle : Win32cr::Foundation::HANDLE, desired_access : Win32cr::Security::TOKEN_ACCESS_MASK, token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun OpenThreadToken(thread_handle : Win32cr::Foundation::HANDLE, desired_access : Win32cr::Security::TOKEN_ACCESS_MASK, open_as_self : Win32cr::Foundation::BOOL, token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun SetPriorityClass(hProcess : Win32cr::Foundation::HANDLE, dwPriorityClass : Win32cr::System::Threading::PROCESS_CREATION_FLAGS) : Win32cr::Foundation::BOOL

    fun GetPriorityClass(hProcess : Win32cr::Foundation::HANDLE) : UInt32

    # Commented out due to being part of LibC
    #fun SetThreadStackGuarantee(stack_size_in_bytes : UInt32*) : Win32cr::Foundation::BOOL

    fun GetProcessId(process : Win32cr::Foundation::HANDLE) : UInt32

    fun GetThreadId(thread : Win32cr::Foundation::HANDLE) : UInt32

    fun FlushProcessWriteBuffers : Void

    fun GetProcessIdOfThread(thread : Win32cr::Foundation::HANDLE) : UInt32

    fun InitializeProcThreadAttributeList(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, dwAttributeCount : UInt32, dwFlags : UInt32, lpSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun DeleteProcThreadAttributeList(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST) : Void

    fun UpdateProcThreadAttribute(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, dwFlags : UInt32, attribute : LibC::UIntPtrT, lpValue : Void*, cbSize : LibC::UIntPtrT, lpPreviousValue : Void*, lpReturnSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun SetProcessDynamicEHContinuationTargets(process : Win32cr::Foundation::HANDLE, number_of_targets : UInt16, targets : Win32cr::System::Threading::PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*) : Win32cr::Foundation::BOOL

    fun SetProcessDynamicEnforcedCetCompatibleRanges(process : Win32cr::Foundation::HANDLE, number_of_ranges : UInt16, ranges : Win32cr::System::Threading::PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*) : Win32cr::Foundation::BOOL

    fun SetProcessAffinityUpdateMode(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_AFFINITY_AUTO_UPDATE_FLAGS) : Win32cr::Foundation::BOOL

    fun QueryProcessAffinityUpdateMode(hProcess : Win32cr::Foundation::HANDLE, lpdwFlags : Win32cr::System::Threading::PROCESS_AFFINITY_AUTO_UPDATE_FLAGS*) : Win32cr::Foundation::BOOL

    fun CreateRemoteThreadEx(hProcess : Win32cr::Foundation::HANDLE, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : UInt32, lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    #fun GetCurrentThreadStackLimits(low_limit : LibC::UIntPtrT*, high_limit : LibC::UIntPtrT*) : Void

    fun GetProcessMitigationPolicy(hProcess : Win32cr::Foundation::HANDLE, mitigation_policy : Win32cr::System::Threading::PROCESS_MITIGATION_POLICY, lpBuffer : Void*, dwLength : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun SetProcessMitigationPolicy(mitigation_policy : Win32cr::System::Threading::PROCESS_MITIGATION_POLICY, lpBuffer : Void*, dwLength : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun GetThreadTimes(hThread : Win32cr::Foundation::HANDLE, lpCreationTime : Win32cr::Foundation::FILETIME*, lpExitTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun OpenProcess(dwDesiredAccess : Win32cr::System::Threading::PROCESS_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, dwProcessId : UInt32) : Win32cr::Foundation::HANDLE

    fun IsProcessorFeaturePresent(processor_feature : Win32cr::System::Threading::PROCESSOR_FEATURE_ID) : Win32cr::Foundation::BOOL

    fun GetProcessHandleCount(hProcess : Win32cr::Foundation::HANDLE, pdwHandleCount : UInt32*) : Win32cr::Foundation::BOOL

    fun GetCurrentProcessorNumber : UInt32

    fun SetThreadIdealProcessorEx(hThread : Win32cr::Foundation::HANDLE, lpIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*, lpPreviousIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Win32cr::Foundation::BOOL

    fun GetThreadIdealProcessorEx(hThread : Win32cr::Foundation::HANDLE, lpIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Win32cr::Foundation::BOOL

    fun GetCurrentProcessorNumberEx(proc_number : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Void

    fun GetProcessPriorityBoost(hProcess : Win32cr::Foundation::HANDLE, pDisablePriorityBoost : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun SetProcessPriorityBoost(hProcess : Win32cr::Foundation::HANDLE, bDisablePriorityBoost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun GetThreadIOPendingFlag(hThread : Win32cr::Foundation::HANDLE, lpIOIsPending : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetSystemTimes(lpIdleTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    fun GetThreadInformation(hThread : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREAD_INFORMATION_CLASS, thread_information : Void*, thread_information_size : UInt32) : Win32cr::Foundation::BOOL

    fun SetThreadInformation(hThread : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREAD_INFORMATION_CLASS, thread_information : Void*, thread_information_size : UInt32) : Win32cr::Foundation::BOOL

    fun IsProcessCritical(hProcess : Win32cr::Foundation::HANDLE, critical : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun SetProtectedPolicy(policy_guid : LibC::GUID*, policy_value : LibC::UIntPtrT, old_policy_value : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun QueryProtectedPolicy(policy_guid : LibC::GUID*, policy_value : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun SetThreadIdealProcessor(hThread : Win32cr::Foundation::HANDLE, dwIdealProcessor : UInt32) : UInt32

    fun SetProcessInformation(hProcess : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESS_INFORMATION_CLASS, process_information : Void*, process_information_size : UInt32) : Win32cr::Foundation::BOOL

    fun GetProcessInformation(hProcess : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESS_INFORMATION_CLASS, process_information : Void*, process_information_size : UInt32) : Win32cr::Foundation::BOOL

    fun GetProcessDefaultCpuSets(process : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32, required_id_count : UInt32*) : Win32cr::Foundation::BOOL

    fun SetProcessDefaultCpuSets(process : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32) : Win32cr::Foundation::BOOL

    fun GetThreadSelectedCpuSets(thread : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32, required_id_count : UInt32*) : Win32cr::Foundation::BOOL

    fun SetThreadSelectedCpuSets(thread : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32) : Win32cr::Foundation::BOOL

    fun CreateProcessAsUserA(hToken : Win32cr::Foundation::HANDLE, lpApplicationName : Win32cr::Foundation::PSTR, lpCommandLine : Win32cr::Foundation::PSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    fun GetProcessShutdownParameters(lpdwLevel : UInt32*, lpdwFlags : UInt32*) : Win32cr::Foundation::BOOL

    fun GetProcessDefaultCpuSetMasks(process : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL

    fun SetProcessDefaultCpuSetMasks(process : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16) : Win32cr::Foundation::BOOL

    fun GetThreadSelectedCpuSetMasks(thread : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL

    fun SetThreadSelectedCpuSetMasks(thread : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16) : Win32cr::Foundation::BOOL

    fun GetMachineTypeAttributes(machine : UInt16, machine_type_attributes : Win32cr::System::Threading::MACHINE_ATTRIBUTES*) : Win32cr::Foundation::HRESULT

    # Commented out due to being part of LibC
    #fun SetThreadDescription(hThread : Win32cr::Foundation::HANDLE, lpThreadDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun GetThreadDescription(hThread : Win32cr::Foundation::HANDLE, ppszThreadDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun QueueUserWorkItem(function : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, context : Void*, flags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL

    fun UnregisterWaitEx(wait_handle : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun CreateTimerQueue : Win32cr::Foundation::HANDLE

    fun CreateTimerQueueTimer(phNewTimer : Win32cr::Foundation::HANDLE*, timer_queue : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, flags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL

    fun ChangeTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE, due_time : UInt32, period : UInt32) : Win32cr::Foundation::BOOL

    fun DeleteTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun DeleteTimerQueue(timer_queue : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun DeleteTimerQueueEx(timer_queue : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun CreateThreadpool(reserved : Void*) : Win32cr::System::Threading::PTP_POOL

    fun SetThreadpoolThreadMaximum(ptpp : Win32cr::System::Threading::PTP_POOL, cthrdMost : UInt32) : Void

    fun SetThreadpoolThreadMinimum(ptpp : Win32cr::System::Threading::PTP_POOL, cthrdMic : UInt32) : Win32cr::Foundation::BOOL

    fun SetThreadpoolStackInformation(ptpp : Win32cr::System::Threading::PTP_POOL, ptpsi : Win32cr::System::Threading::TP_POOL_STACK_INFORMATION*) : Win32cr::Foundation::BOOL

    fun QueryThreadpoolStackInformation(ptpp : Win32cr::System::Threading::PTP_POOL, ptpsi : Win32cr::System::Threading::TP_POOL_STACK_INFORMATION*) : Win32cr::Foundation::BOOL

    fun CloseThreadpool(ptpp : Win32cr::System::Threading::PTP_POOL) : Void

    fun CreateThreadpoolCleanupGroup : LibC::IntPtrT

    fun CloseThreadpoolCleanupGroupMembers(ptpcg : LibC::IntPtrT, fCancelPendingCallbacks : Win32cr::Foundation::BOOL, pvCleanupContext : Void*) : Void

    fun CloseThreadpoolCleanupGroup(ptpcg : LibC::IntPtrT) : Void

    fun SetEventWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, evt : Win32cr::Foundation::HANDLE) : Void

    fun ReleaseSemaphoreWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, sem : Win32cr::Foundation::HANDLE, crel : UInt32) : Void

    fun ReleaseMutexWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, mut : Win32cr::Foundation::HANDLE) : Void

    fun LeaveCriticalSectionWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, pcs : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    fun FreeLibraryWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, mod : Win32cr::Foundation::HINSTANCE) : Void

    fun CallbackMayRunLong(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*) : Win32cr::Foundation::BOOL

    fun DisassociateCurrentThreadFromCallback(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*) : Void

    fun TrySubmitThreadpoolCallback(pfns : Win32cr::System::Threading::PTP_SIMPLE_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::Foundation::BOOL

    fun CreateThreadpoolWork(pfnwk : Win32cr::System::Threading::PTP_WORK_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_WORK*

    fun SubmitThreadpoolWork(pwk : Win32cr::System::Threading::TP_WORK*) : Void

    fun WaitForThreadpoolWorkCallbacks(pwk : Win32cr::System::Threading::TP_WORK*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    fun CloseThreadpoolWork(pwk : Win32cr::System::Threading::TP_WORK*) : Void

    fun CreateThreadpoolTimer(pfnti : Win32cr::System::Threading::PTP_TIMER_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_TIMER*

    fun SetThreadpoolTimer(pti : Win32cr::System::Threading::TP_TIMER*, pftDueTime : Win32cr::Foundation::FILETIME*, msPeriod : UInt32, msWindowLength : UInt32) : Void

    fun IsThreadpoolTimerSet(pti : Win32cr::System::Threading::TP_TIMER*) : Win32cr::Foundation::BOOL

    fun WaitForThreadpoolTimerCallbacks(pti : Win32cr::System::Threading::TP_TIMER*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    fun CloseThreadpoolTimer(pti : Win32cr::System::Threading::TP_TIMER*) : Void

    fun CreateThreadpoolWait(pfnwa : Win32cr::System::Threading::PTP_WAIT_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_WAIT*

    fun SetThreadpoolWait(pwa : Win32cr::System::Threading::TP_WAIT*, h : Win32cr::Foundation::HANDLE, pftTimeout : Win32cr::Foundation::FILETIME*) : Void

    fun WaitForThreadpoolWaitCallbacks(pwa : Win32cr::System::Threading::TP_WAIT*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    fun CloseThreadpoolWait(pwa : Win32cr::System::Threading::TP_WAIT*) : Void

    fun CreateThreadpoolIo(fl : Win32cr::Foundation::HANDLE, pfnio : Win32cr::System::Threading::PTP_WIN32_IO_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_IO*

    fun StartThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void

    fun CancelThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void

    fun WaitForThreadpoolIoCallbacks(pio : Win32cr::System::Threading::TP_IO*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    fun CloseThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void

    fun SetThreadpoolTimerEx(pti : Win32cr::System::Threading::TP_TIMER*, pftDueTime : Win32cr::Foundation::FILETIME*, msPeriod : UInt32, msWindowLength : UInt32) : Win32cr::Foundation::BOOL

    fun SetThreadpoolWaitEx(pwa : Win32cr::System::Threading::TP_WAIT*, h : Win32cr::Foundation::HANDLE, pftTimeout : Win32cr::Foundation::FILETIME*, reserved : Void*) : Win32cr::Foundation::BOOL

    fun IsWow64Process(hProcess : Win32cr::Foundation::HANDLE, wow64_process : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun Wow64SetThreadDefaultGuestMachine(machine : UInt16) : UInt16

    fun IsWow64Process2(hProcess : Win32cr::Foundation::HANDLE, pProcessMachine : UInt16*, pNativeMachine : UInt16*) : Win32cr::Foundation::BOOL

    fun Wow64SuspendThread(hThread : Win32cr::Foundation::HANDLE) : UInt32

    fun CreatePrivateNamespaceW(lpPrivateNamespaceAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PWSTR) : Win32cr::System::Threading::NamespaceHandle

    fun OpenPrivateNamespaceW(lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PWSTR) : Win32cr::System::Threading::NamespaceHandle

    fun ClosePrivateNamespace(handle : Win32cr::System::Threading::NamespaceHandle, flags : UInt32) : Win32cr::Foundation::BOOLEAN

    fun CreateBoundaryDescriptorW(name : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::System::Threading::BoundaryDescriptorHandle

    fun AddSIDToBoundaryDescriptor(boundary_descriptor : Win32cr::Foundation::HANDLE*, required_sid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun DeleteBoundaryDescriptor(boundary_descriptor : Win32cr::System::Threading::BoundaryDescriptorHandle) : Void

    fun GetNumaHighestNodeNumber(highest_node_number : UInt32*) : Win32cr::Foundation::BOOL

    fun GetNumaNodeProcessorMaskEx(node : UInt16, processor_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL

    fun GetNumaNodeProcessorMask2(node_number : UInt16, processor_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, processor_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL

    fun GetNumaProximityNodeEx(proximity_id : UInt32, node_number : UInt16*) : Win32cr::Foundation::BOOL

    fun GetProcessGroupAffinity(hProcess : Win32cr::Foundation::HANDLE, group_count : UInt16*, group_array : UInt16*) : Win32cr::Foundation::BOOL

    fun GetThreadGroupAffinity(hThread : Win32cr::Foundation::HANDLE, group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL

    fun SetThreadGroupAffinity(hThread : Win32cr::Foundation::HANDLE, group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*, previous_group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL

    fun AvSetMmThreadCharacteristicsA(task_name : Win32cr::Foundation::PSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    fun AvSetMmThreadCharacteristicsW(task_name : Win32cr::Foundation::PWSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    fun AvSetMmMaxThreadCharacteristicsA(first_task : Win32cr::Foundation::PSTR, second_task : Win32cr::Foundation::PSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    fun AvSetMmMaxThreadCharacteristicsW(first_task : Win32cr::Foundation::PWSTR, second_task : Win32cr::Foundation::PWSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    fun AvRevertMmThreadCharacteristics(avrt_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun AvSetMmThreadPriority(avrt_handle : Win32cr::Foundation::HANDLE, priority : Win32cr::System::Threading::AVRT_PRIORITY) : Win32cr::Foundation::BOOL

    fun AvRtCreateThreadOrderingGroup(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL

    fun AvRtCreateThreadOrderingGroupExA(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*, task_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun AvRtCreateThreadOrderingGroupExW(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*, task_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun AvRtJoinThreadOrderingGroup(context : Win32cr::Foundation::HANDLE*, thread_ordering_guid : LibC::GUID*, before : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun AvRtWaitOnThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun AvRtLeaveThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun AvRtDeleteThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun AvQuerySystemResponsiveness(avrt_handle : Win32cr::Foundation::HANDLE, system_responsiveness_value : UInt32*) : Win32cr::Foundation::BOOL

    fun AttachThreadInput(idAttach : UInt32, idAttachTo : UInt32, fAttach : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun WaitForInputIdle(hProcess : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32) : UInt32

    fun GetGuiResources(hProcess : Win32cr::Foundation::HANDLE, uiFlags : Win32cr::System::Threading::GET_GUI_RESOURCES_FLAGS) : UInt32

    fun IsImmersiveProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun SetProcessRestrictionExemption(fEnableExemption : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun GetProcessAffinityMask(hProcess : Win32cr::Foundation::HANDLE, lpProcessAffinityMask : LibC::UIntPtrT*, lpSystemAffinityMask : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    fun SetProcessAffinityMask(hProcess : Win32cr::Foundation::HANDLE, dwProcessAffinityMask : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun GetProcessIoCounters(hProcess : Win32cr::Foundation::HANDLE, lpIoCounters : Win32cr::System::Threading::IO_COUNTERS*) : Win32cr::Foundation::BOOL

    fun SwitchToFiber(lpFiber : Void*) : Void

    fun DeleteFiber(lpFiber : Void*) : Void

    fun ConvertFiberToThread : Win32cr::Foundation::BOOL

    fun CreateFiberEx(dwStackCommitSize : LibC::UIntPtrT, dwStackReserveSize : LibC::UIntPtrT, dwFlags : UInt32, lpStartAddress : Win32cr::System::Threading::LPFIBER_START_ROUTINE, lpParameter : Void*) : Void*

    fun ConvertThreadToFiberEx(lpParameter : Void*, dwFlags : UInt32) : Void*

    fun CreateFiber(dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPFIBER_START_ROUTINE, lpParameter : Void*) : Void*

    fun ConvertThreadToFiber(lpParameter : Void*) : Void*

    fun CreateUmsCompletionList(ums_completion_list : Void**) : Win32cr::Foundation::BOOL

    fun DequeueUmsCompletionListItems(ums_completion_list : Void*, wait_time_out : UInt32, ums_thread_list : Void**) : Win32cr::Foundation::BOOL

    fun GetUmsCompletionListEvent(ums_completion_list : Void*, ums_completion_event : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun ExecuteUmsThread(ums_thread : Void*) : Win32cr::Foundation::BOOL

    fun UmsThreadYield(scheduler_param : Void*) : Win32cr::Foundation::BOOL

    fun DeleteUmsCompletionList(ums_completion_list : Void*) : Win32cr::Foundation::BOOL

    fun GetCurrentUmsThread : Void*

    fun GetNextUmsListItem(ums_context : Void*) : Void*

    fun QueryUmsThreadInformation(ums_thread : Void*, ums_thread_info_class : Win32cr::System::Threading::RTL_UMS_THREAD_INFO_CLASS, ums_thread_information : Void*, ums_thread_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL

    fun SetUmsThreadInformation(ums_thread : Void*, ums_thread_info_class : Win32cr::System::Threading::RTL_UMS_THREAD_INFO_CLASS, ums_thread_information : Void*, ums_thread_information_length : UInt32) : Win32cr::Foundation::BOOL

    fun DeleteUmsThreadContext(ums_thread : Void*) : Win32cr::Foundation::BOOL

    fun CreateUmsThreadContext(lpUmsThread : Void**) : Win32cr::Foundation::BOOL

    fun EnterUmsSchedulingMode(scheduler_startup_info : Win32cr::System::Threading::UMS_SCHEDULER_STARTUP_INFO*) : Win32cr::Foundation::BOOL

    fun GetUmsSystemThreadInformation(thread_handle : Win32cr::Foundation::HANDLE, system_thread_info : Win32cr::System::Threading::UMS_SYSTEM_THREAD_INFORMATION*) : Win32cr::Foundation::BOOL

    fun SetThreadAffinityMask(hThread : Win32cr::Foundation::HANDLE, dwThreadAffinityMask : LibC::UIntPtrT) : LibC::UIntPtrT

    fun SetProcessDEPPolicy(dwFlags : Win32cr::System::Threading::PROCESS_DEP_FLAGS) : Win32cr::Foundation::BOOL

    fun GetProcessDEPPolicy(hProcess : Win32cr::Foundation::HANDLE, lpFlags : UInt32*, lpPermanent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun PulseEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun WinExec(lpCmdLine : Win32cr::Foundation::PSTR, uCmdShow : UInt32) : UInt32

    fun CreateSemaphoreA(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    fun CreateSemaphoreExA(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    fun QueryFullProcessImageNameA(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_NAME_FORMAT, lpExeName : UInt8*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryFullProcessImageNameW(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_NAME_FORMAT, lpExeName : UInt16*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    fun GetStartupInfoA(lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*) : Void

    fun CreateProcessWithLogonW(lpUsername : Win32cr::Foundation::PWSTR, lpDomain : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, dwLogonFlags : Win32cr::System::Threading::CREATE_PROCESS_LOGON_FLAGS, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    fun CreateProcessWithTokenW(hToken : Win32cr::Foundation::HANDLE, dwLogonFlags : Win32cr::System::Threading::CREATE_PROCESS_LOGON_FLAGS, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    fun RegisterWaitForSingleObject(phNewWaitObject : Win32cr::Foundation::HANDLE*, hObject : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, context : Void*, dwMilliseconds : UInt32, dwFlags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL

    fun UnregisterWait(wait_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun SetTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, prefer_io : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    fun CreatePrivateNamespaceA(lpPrivateNamespaceAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PSTR) : Win32cr::System::Threading::NamespaceHandle

    fun OpenPrivateNamespaceA(lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PSTR) : Win32cr::System::Threading::NamespaceHandle

    fun CreateBoundaryDescriptorA(name : Win32cr::Foundation::PSTR, flags : UInt32) : Win32cr::System::Threading::BoundaryDescriptorHandle

    fun AddIntegrityLabelToBoundaryDescriptor(boundary_descriptor : Win32cr::Foundation::HANDLE*, integrity_label : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    fun GetActiveProcessorGroupCount : UInt16

    fun GetMaximumProcessorGroupCount : UInt16

    fun GetActiveProcessorCount(group_number : UInt16) : UInt32

    fun GetMaximumProcessorCount(group_number : UInt16) : UInt32

    fun GetNumaProcessorNode(processor : UInt8, node_number : UInt8*) : Win32cr::Foundation::BOOL

    fun GetNumaNodeNumberFromHandle(hFile : Win32cr::Foundation::HANDLE, node_number : UInt16*) : Win32cr::Foundation::BOOL

    fun GetNumaProcessorNodeEx(processor : Win32cr::System::Kernel::PROCESSOR_NUMBER*, node_number : UInt16*) : Win32cr::Foundation::BOOL

    fun GetNumaNodeProcessorMask(node : UInt8, processor_mask : UInt64*) : Win32cr::Foundation::BOOL

    fun GetNumaAvailableMemoryNode(node : UInt8, available_bytes : UInt64*) : Win32cr::Foundation::BOOL

    fun GetNumaAvailableMemoryNodeEx(node : UInt16, available_bytes : UInt64*) : Win32cr::Foundation::BOOL

    fun GetNumaProximityNode(proximity_id : UInt32, node_number : UInt8*) : Win32cr::Foundation::BOOL

    fun NtQueryInformationProcess(process_handle : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESSINFOCLASS, process_information : Void*, process_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun NtQueryInformationThread(thread_handle : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREADINFOCLASS, thread_information : Void*, thread_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun NtSetInformationThread(thread_handle : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREADINFOCLASS, thread_information : Void*, thread_information_length : UInt32) : Win32cr::Foundation::NTSTATUS

  end
end