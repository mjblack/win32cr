require "./../foundation.cr"
require "./system_information.cr"
require "./system_services.cr"
require "./kernel.cr"
require "./../security.cr"

module Win32cr::System::Threading
  extend self
  alias TimerQueueHandle = LibC::IntPtrT
  alias PTP_POOL = LibC::IntPtrT
  alias NamespaceHandle = LibC::IntPtrT
  alias BoundaryDescriptorHandle = LibC::IntPtrT
  alias LPPROC_THREAD_ATTRIBUTE_LIST = Void*
  alias LPTHREAD_START_ROUTINE = Proc(Void*, UInt32)

  alias PINIT_ONCE_FN = Proc(Win32cr::System::Threading::RTL_RUN_ONCE*, Void*, Void**, Win32cr::Foundation::BOOL)

  alias PTIMERAPCROUTINE = Proc(Void*, UInt32, UInt32, Void)

  alias PTP_WIN32_IO_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Void*, UInt32, LibC::UIntPtrT, Win32cr::System::Threading::TP_IO*, Void)

  alias PRTL_UMS_SCHEDULER_ENTRY_POINT = Proc(Win32cr::System::SystemServices::RTL_UMS_SCHEDULER_REASON, LibC::UIntPtrT, Void*, Void)

  alias WAITORTIMERCALLBACK = Proc(Void*, Win32cr::Foundation::BOOLEAN, Void)

  alias PFLS_CALLBACK_FUNCTION = Proc(Void*, Void)

  alias PTP_SIMPLE_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Void)

  alias PTP_CLEANUP_GROUP_CANCEL_CALLBACK = Proc(Void*, Void*, Void)

  alias PTP_WORK_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Win32cr::System::Threading::TP_WORK*, Void)

  alias PTP_TIMER_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Win32cr::System::Threading::TP_TIMER*, Void)

  alias PTP_WAIT_CALLBACK = Proc(Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, Void*, Win32cr::System::Threading::TP_WAIT*, UInt32, Void)

  alias LPFIBER_START_ROUTINE = Proc(Void*, Void)

  alias PPS_POST_PROCESS_INIT_ROUTINE = Proc(Void)

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
  enum SYNCHRONIZATION_ACCESS_RIGHTS : UInt32
    EVENT_ALL_ACCESS = 2031619_u32
    EVENT_MODIFY_STATE = 2_u32
    MUTEX_ALL_ACCESS = 2031617_u32
    MUTEX_MODIFY_STATE = 1_u32
    SEMAPHORE_ALL_ACCESS = 2031619_u32
    SEMAPHORE_MODIFY_STATE = 2_u32
    TIMER_ALL_ACCESS = 2031619_u32
    TIMER_MODIFY_STATE = 2_u32
    TIMER_QUERY_STATE = 1_u32
    SYNCHRONIZATION_DELETE = 65536_u32
    SYNCHRONIZATION_READ_CONTROL = 131072_u32
    SYNCHRONIZATION_WRITE_DAC = 262144_u32
    SYNCHRONIZATION_WRITE_OWNER = 524288_u32
    SYNCHRONIZATION_SYNCHRONIZE = 1048576_u32
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
  struct TP_CALLBACK_INSTANCE
    def initialize()
    end
  end

  @[Extern]
  struct TP_WORK
    def initialize()
    end
  end

  @[Extern]
  struct TP_TIMER
    def initialize()
    end
  end

  @[Extern]
  struct TP_WAIT
    def initialize()
    end
  end

  @[Extern]
  struct TP_IO
    def initialize()
    end
  end

  @[Extern]
  struct REASON_CONTEXT
    property version : UInt32
    property flags : Win32cr::System::Threading::POWER_REQUEST_CONTEXT_FLAGS
    property reason : Reason_e__Union_

    # Nested Type Reason_e__Union_
    @[Extern(union: true)]
    struct Reason_e__Union_
    property detailed : Detailed_e__Struct_
    property simple_reason_string : Win32cr::Foundation::PWSTR

      # Nested Type Detailed_e__Struct_
      @[Extern]
      struct Detailed_e__Struct_
    property localized_reason_module : Win32cr::Foundation::HINSTANCE
    property localized_reason_id : UInt32
    property reason_string_count : UInt32
    property reason_strings : Win32cr::Foundation::PWSTR*
    def initialize(@localized_reason_module : Win32cr::Foundation::HINSTANCE, @localized_reason_id : UInt32, @reason_string_count : UInt32, @reason_strings : Win32cr::Foundation::PWSTR*)
    end
      end

    def initialize(@detailed : Detailed_e__Struct_, @simple_reason_string : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@version : UInt32, @flags : Win32cr::System::Threading::POWER_REQUEST_CONTEXT_FLAGS, @reason : Reason_e__Union_)
    end
  end

  @[Extern]
  struct PROCESS_INFORMATION
    property hProcess : Win32cr::Foundation::HANDLE
    property hThread : Win32cr::Foundation::HANDLE
    property dwProcessId : UInt32
    property dwThreadId : UInt32
    def initialize(@hProcess : Win32cr::Foundation::HANDLE, @hThread : Win32cr::Foundation::HANDLE, @dwProcessId : UInt32, @dwThreadId : UInt32)
    end
  end

  @[Extern]
  struct STARTUPINFOA
    property cb : UInt32
    property lpReserved : Win32cr::Foundation::PSTR
    property lpDesktop : Win32cr::Foundation::PSTR
    property lpTitle : Win32cr::Foundation::PSTR
    property dwX : UInt32
    property dwY : UInt32
    property dwXSize : UInt32
    property dwYSize : UInt32
    property dwXCountChars : UInt32
    property dwYCountChars : UInt32
    property dwFillAttribute : UInt32
    property dwFlags : Win32cr::System::Threading::STARTUPINFOW_FLAGS
    property wShowWindow : UInt16
    property cbReserved2 : UInt16
    property lpReserved2 : UInt8*
    property hStdInput : Win32cr::Foundation::HANDLE
    property hStdOutput : Win32cr::Foundation::HANDLE
    property hStdError : Win32cr::Foundation::HANDLE
    def initialize(@cb : UInt32, @lpReserved : Win32cr::Foundation::PSTR, @lpDesktop : Win32cr::Foundation::PSTR, @lpTitle : Win32cr::Foundation::PSTR, @dwX : UInt32, @dwY : UInt32, @dwXSize : UInt32, @dwYSize : UInt32, @dwXCountChars : UInt32, @dwYCountChars : UInt32, @dwFillAttribute : UInt32, @dwFlags : Win32cr::System::Threading::STARTUPINFOW_FLAGS, @wShowWindow : UInt16, @cbReserved2 : UInt16, @lpReserved2 : UInt8*, @hStdInput : Win32cr::Foundation::HANDLE, @hStdOutput : Win32cr::Foundation::HANDLE, @hStdError : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct STARTUPINFOW
    property cb : UInt32
    property lpReserved : Win32cr::Foundation::PWSTR
    property lpDesktop : Win32cr::Foundation::PWSTR
    property lpTitle : Win32cr::Foundation::PWSTR
    property dwX : UInt32
    property dwY : UInt32
    property dwXSize : UInt32
    property dwYSize : UInt32
    property dwXCountChars : UInt32
    property dwYCountChars : UInt32
    property dwFillAttribute : UInt32
    property dwFlags : Win32cr::System::Threading::STARTUPINFOW_FLAGS
    property wShowWindow : UInt16
    property cbReserved2 : UInt16
    property lpReserved2 : UInt8*
    property hStdInput : Win32cr::Foundation::HANDLE
    property hStdOutput : Win32cr::Foundation::HANDLE
    property hStdError : Win32cr::Foundation::HANDLE
    def initialize(@cb : UInt32, @lpReserved : Win32cr::Foundation::PWSTR, @lpDesktop : Win32cr::Foundation::PWSTR, @lpTitle : Win32cr::Foundation::PWSTR, @dwX : UInt32, @dwY : UInt32, @dwXSize : UInt32, @dwYSize : UInt32, @dwXCountChars : UInt32, @dwYCountChars : UInt32, @dwFillAttribute : UInt32, @dwFlags : Win32cr::System::Threading::STARTUPINFOW_FLAGS, @wShowWindow : UInt16, @cbReserved2 : UInt16, @lpReserved2 : UInt8*, @hStdInput : Win32cr::Foundation::HANDLE, @hStdOutput : Win32cr::Foundation::HANDLE, @hStdError : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct MEMORY_PRIORITY_INFORMATION
    property memory_priority : Win32cr::System::Threading::MEMORY_PRIORITY
    def initialize(@memory_priority : Win32cr::System::Threading::MEMORY_PRIORITY)
    end
  end

  @[Extern]
  struct THREAD_POWER_THROTTLING_STATE
    property version : UInt32
    property control_mask : UInt32
    property state_mask : UInt32
    def initialize(@version : UInt32, @control_mask : UInt32, @state_mask : UInt32)
    end
  end

  @[Extern]
  struct APP_MEMORY_INFORMATION
    property available_commit : UInt64
    property private_commit_usage : UInt64
    property peak_private_commit_usage : UInt64
    property total_commit_usage : UInt64
    def initialize(@available_commit : UInt64, @private_commit_usage : UInt64, @peak_private_commit_usage : UInt64, @total_commit_usage : UInt64)
    end
  end

  @[Extern]
  struct PROCESS_MACHINE_INFORMATION
    property process_machine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE
    property res0 : UInt16
    property machine_attributes : Win32cr::System::Threading::MACHINE_ATTRIBUTES
    def initialize(@process_machine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE, @res0 : UInt16, @machine_attributes : Win32cr::System::Threading::MACHINE_ATTRIBUTES)
    end
  end

  @[Extern]
  struct PROCESS_MEMORY_EXHAUSTION_INFO
    property version : UInt16
    property reserved : UInt16
    property type__ : Win32cr::System::Threading::PROCESS_MEMORY_EXHAUSTION_TYPE
    property value : LibC::UIntPtrT
    def initialize(@version : UInt16, @reserved : UInt16, @type__ : Win32cr::System::Threading::PROCESS_MEMORY_EXHAUSTION_TYPE, @value : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct PROCESS_POWER_THROTTLING_STATE
    property version : UInt32
    property control_mask : UInt32
    property state_mask : UInt32
    def initialize(@version : UInt32, @control_mask : UInt32, @state_mask : UInt32)
    end
  end

  @[Extern]
  struct PROCESS_PROTECTION_LEVEL_INFORMATION
    property protection_level : Win32cr::System::Threading::PROCESS_PROTECTION_LEVEL
    def initialize(@protection_level : Win32cr::System::Threading::PROCESS_PROTECTION_LEVEL)
    end
  end

  @[Extern]
  struct PROCESS_LEAP_SECOND_INFO
    property flags : UInt32
    property reserved : UInt32
    def initialize(@flags : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGET
    property target_address : LibC::UIntPtrT
    property flags : LibC::UIntPtrT
    def initialize(@target_address : LibC::UIntPtrT, @flags : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGETS_INFORMATION
    property number_of_targets : UInt16
    property reserved : UInt16
    property reserved2 : UInt32
    property targets : Win32cr::System::Threading::PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*
    def initialize(@number_of_targets : UInt16, @reserved : UInt16, @reserved2 : UInt32, @targets : Win32cr::System::Threading::PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*)
    end
  end

  @[Extern]
  struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE
    property base_address : LibC::UIntPtrT
    property size : LibC::UIntPtrT
    property flags : UInt32
    def initialize(@base_address : LibC::UIntPtrT, @size : LibC::UIntPtrT, @flags : UInt32)
    end
  end

  @[Extern]
  struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGES_INFORMATION
    property number_of_ranges : UInt16
    property reserved : UInt16
    property reserved2 : UInt32
    property ranges : Win32cr::System::Threading::PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*
    def initialize(@number_of_ranges : UInt16, @reserved : UInt16, @reserved2 : UInt32, @ranges : Win32cr::System::Threading::PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*)
    end
  end

  @[Extern]
  struct IO_COUNTERS
    property read_operation_count : UInt64
    property write_operation_count : UInt64
    property other_operation_count : UInt64
    property read_transfer_count : UInt64
    property write_transfer_count : UInt64
    property other_transfer_count : UInt64
    def initialize(@read_operation_count : UInt64, @write_operation_count : UInt64, @other_operation_count : UInt64, @read_transfer_count : UInt64, @write_transfer_count : UInt64, @other_transfer_count : UInt64)
    end
  end

  @[Extern(union: true)]
  struct RTL_RUN_ONCE
    property ptr : Void*
    def initialize(@ptr : Void*)
    end
  end

  @[Extern]
  struct RTL_BARRIER
    property reserved1 : UInt32
    property reserved2 : UInt32
    property reserved3 : LibC::UIntPtrT[2]
    property reserved4 : UInt32
    property reserved5 : UInt32
    def initialize(@reserved1 : UInt32, @reserved2 : UInt32, @reserved3 : LibC::UIntPtrT[2], @reserved4 : UInt32, @reserved5 : UInt32)
    end
  end

  @[Extern]
  struct RTL_CRITICAL_SECTION_DEBUG
    property type__ : UInt16
    property creator_back_trace_index : UInt16
    property critical_section : Win32cr::System::Threading::RTL_CRITICAL_SECTION*
    property process_locks_list : Win32cr::System::Kernel::LIST_ENTRY
    property entry_count : UInt32
    property contention_count : UInt32
    property flags : UInt32
    property creator_back_trace_index_high : UInt16
    property spare_word : UInt16
    def initialize(@type__ : UInt16, @creator_back_trace_index : UInt16, @critical_section : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, @process_locks_list : Win32cr::System::Kernel::LIST_ENTRY, @entry_count : UInt32, @contention_count : UInt32, @flags : UInt32, @creator_back_trace_index_high : UInt16, @spare_word : UInt16)
    end
  end

  @[Extern]
  struct RTL_CRITICAL_SECTION
    property debug_info : Win32cr::System::Threading::RTL_CRITICAL_SECTION_DEBUG*
    property lock_count : Int32
    property recursion_count : Int32
    property owning_thread : Win32cr::Foundation::HANDLE
    property lock_semaphore : Win32cr::Foundation::HANDLE
    property spin_count : LibC::UIntPtrT
    def initialize(@debug_info : Win32cr::System::Threading::RTL_CRITICAL_SECTION_DEBUG*, @lock_count : Int32, @recursion_count : Int32, @owning_thread : Win32cr::Foundation::HANDLE, @lock_semaphore : Win32cr::Foundation::HANDLE, @spin_count : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct RTL_SRWLOCK
    property ptr : Void*
    def initialize(@ptr : Void*)
    end
  end

  @[Extern]
  struct RTL_CONDITION_VARIABLE
    property ptr : Void*
    def initialize(@ptr : Void*)
    end
  end

  @[Extern]
  struct TP_POOL_STACK_INFORMATION
    property stack_reserve : LibC::UIntPtrT
    property stack_commit : LibC::UIntPtrT
    def initialize(@stack_reserve : LibC::UIntPtrT, @stack_commit : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct TP_CALLBACK_ENVIRON_V3
    property version : UInt32
    property pool : Win32cr::System::Threading::PTP_POOL
    property cleanup_group : LibC::IntPtrT
    property cleanup_group_cancel_callback : Win32cr::System::Threading::PTP_CLEANUP_GROUP_CANCEL_CALLBACK
    property race_dll : Void*
    property activation_context : LibC::IntPtrT
    property finalization_callback : Win32cr::System::Threading::PTP_SIMPLE_CALLBACK
    property u : U_e__union_
    property callback_priority : Win32cr::System::Threading::TP_CALLBACK_PRIORITY
    property size : UInt32

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property flags : UInt32
    property s : S_e__struct_

      # Nested Type S_e__struct_
      @[Extern]
      struct S_e__struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@flags : UInt32, @s : S_e__struct_)
    end
    end


    # Nested Type ACTIVATION_CONTEXT_
    @[Extern]
    struct ACTIVATION_CONTEXT_
    def initialize()
    end
    end

    def initialize(@version : UInt32, @pool : Win32cr::System::Threading::PTP_POOL, @cleanup_group : LibC::IntPtrT, @cleanup_group_cancel_callback : Win32cr::System::Threading::PTP_CLEANUP_GROUP_CANCEL_CALLBACK, @race_dll : Void*, @activation_context : LibC::IntPtrT, @finalization_callback : Win32cr::System::Threading::PTP_SIMPLE_CALLBACK, @u : U_e__union_, @callback_priority : Win32cr::System::Threading::TP_CALLBACK_PRIORITY, @size : UInt32)
    end
  end

  @[Extern]
  struct UMS_SCHEDULER_STARTUP_INFO
    property ums_version : UInt32
    property completion_list : Void*
    property scheduler_proc : Win32cr::System::Threading::PRTL_UMS_SCHEDULER_ENTRY_POINT
    property scheduler_param : Void*
    def initialize(@ums_version : UInt32, @completion_list : Void*, @scheduler_proc : Win32cr::System::Threading::PRTL_UMS_SCHEDULER_ENTRY_POINT, @scheduler_param : Void*)
    end
  end

  @[Extern]
  struct UMS_SYSTEM_THREAD_INFORMATION
    property ums_version : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property thread_ums_flags : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @thread_ums_flags : UInt32)
    end
    end

    def initialize(@ums_version : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct STARTUPINFOEXA
    property startup_info : Win32cr::System::Threading::STARTUPINFOA
    property lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST
    def initialize(@startup_info : Win32cr::System::Threading::STARTUPINFOA, @lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST)
    end
  end

  @[Extern]
  struct STARTUPINFOEXW
    property startup_info : Win32cr::System::Threading::STARTUPINFOW
    property lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST
    def initialize(@startup_info : Win32cr::System::Threading::STARTUPINFOW, @lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST)
    end
  end

  @[Extern]
  struct PEB_LDR_DATA
    property reserved1 : UInt8[8]
    property reserved2 : Void*[3]
    property in_memory_order_module_list : Win32cr::System::Kernel::LIST_ENTRY
    def initialize(@reserved1 : UInt8[8], @reserved2 : Void*[3], @in_memory_order_module_list : Win32cr::System::Kernel::LIST_ENTRY)
    end
  end

  @[Extern]
  struct RTL_USER_PROCESS_PARAMETERS
    property reserved1 : UInt8[16]
    property reserved2 : Void*[10]
    property image_path_name : Win32cr::Foundation::UNICODE_STRING
    property command_line : Win32cr::Foundation::UNICODE_STRING
    def initialize(@reserved1 : UInt8[16], @reserved2 : Void*[10], @image_path_name : Win32cr::Foundation::UNICODE_STRING, @command_line : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct PEB
    property reserved1 : UInt8[2]
    property being_debugged : UInt8
    property reserved2 : UInt8*
    property reserved3 : Void*[2]
    property ldr : Win32cr::System::Threading::PEB_LDR_DATA*
    property process_parameters : Win32cr::System::Threading::RTL_USER_PROCESS_PARAMETERS*
    property reserved4 : Void*[3]
    property atl_thunk_s_list_ptr : Void*
    property reserved5 : Void*
    property reserved6 : UInt32
    property reserved7 : Void*
    property reserved8 : UInt32
    property atl_thunk_s_list_ptr32 : UInt32
    property reserved9 : Void*[45]
    property reserved10 : UInt8[96]
    property post_process_init_routine : Win32cr::System::Threading::PPS_POST_PROCESS_INIT_ROUTINE
    property reserved11 : UInt8[128]
    property reserved12 : Void**
    property session_id : UInt32
    def initialize(@reserved1 : UInt8[2], @being_debugged : UInt8, @reserved2 : UInt8*, @reserved3 : Void*[2], @ldr : Win32cr::System::Threading::PEB_LDR_DATA*, @process_parameters : Win32cr::System::Threading::RTL_USER_PROCESS_PARAMETERS*, @reserved4 : Void*[3], @atl_thunk_s_list_ptr : Void*, @reserved5 : Void*, @reserved6 : UInt32, @reserved7 : Void*, @reserved8 : UInt32, @atl_thunk_s_list_ptr32 : UInt32, @reserved9 : Void*[45], @reserved10 : UInt8[96], @post_process_init_routine : Win32cr::System::Threading::PPS_POST_PROCESS_INIT_ROUTINE, @reserved11 : UInt8[128], @reserved12 : Void**, @session_id : UInt32)
    end
  end

  @[Extern]
  struct PROCESS_BASIC_INFORMATION
    property reserved1 : Void*
    property peb_base_address : Win32cr::System::Threading::PEB*
    property reserved2 : Void*[2]
    property unique_process_id : LibC::UIntPtrT
    property reserved3 : Void*
    def initialize(@reserved1 : Void*, @peb_base_address : Win32cr::System::Threading::PEB*, @reserved2 : Void*[2], @unique_process_id : LibC::UIntPtrT, @reserved3 : Void*)
    end
  end

  def getProcessWorkingSetSize(hProcess : Win32cr::Foundation::HANDLE, lpMinimumWorkingSetSize : LibC::UIntPtrT*, lpMaximumWorkingSetSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.GetProcessWorkingSetSize(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize)
  end

  def setProcessWorkingSetSize(hProcess : Win32cr::Foundation::HANDLE, dwMinimumWorkingSetSize : LibC::UIntPtrT, dwMaximumWorkingSetSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.SetProcessWorkingSetSize(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize)
  end

  def flsAlloc(lpCallback : Win32cr::System::Threading::PFLS_CALLBACK_FUNCTION) : UInt32
    C.FlsAlloc(lpCallback)
  end

  def flsGetValue(dwFlsIndex : UInt32) : Void*
    C.FlsGetValue(dwFlsIndex)
  end

  def flsSetValue(dwFlsIndex : UInt32, lpFlsData : Void*) : Win32cr::Foundation::BOOL
    C.FlsSetValue(dwFlsIndex, lpFlsData)
  end

  def flsFree(dwFlsIndex : UInt32) : Win32cr::Foundation::BOOL
    C.FlsFree(dwFlsIndex)
  end

  def isThreadAFiber : Win32cr::Foundation::BOOL
    C.IsThreadAFiber
  end

  def initializeSRWLock(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void
    C.InitializeSRWLock(srw_lock)
  end

  def releaseSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void
    C.ReleaseSRWLockExclusive(srw_lock)
  end

  def releaseSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void
    C.ReleaseSRWLockShared(srw_lock)
  end

  def acquireSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void
    C.AcquireSRWLockExclusive(srw_lock)
  end

  def acquireSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void
    C.AcquireSRWLockShared(srw_lock)
  end

  def tryAcquireSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Win32cr::Foundation::BOOLEAN
    C.TryAcquireSRWLockExclusive(srw_lock)
  end

  def tryAcquireSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Win32cr::Foundation::BOOLEAN
    C.TryAcquireSRWLockShared(srw_lock)
  end

  def initializeCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void
    C.InitializeCriticalSection(lpCriticalSection)
  end

  #def enterCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void
    #C.EnterCriticalSection(lpCriticalSection)
  #end

  #def leaveCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void
    #C.LeaveCriticalSection(lpCriticalSection)
  #end

  #def initializeCriticalSectionAndSpinCount(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32) : Win32cr::Foundation::BOOL
    #C.InitializeCriticalSectionAndSpinCount(lpCriticalSection, dwSpinCount)
  #end

  def initializeCriticalSectionEx(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL
    C.InitializeCriticalSectionEx(lpCriticalSection, dwSpinCount, flags)
  end

  def setCriticalSectionSpinCount(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32) : UInt32
    C.SetCriticalSectionSpinCount(lpCriticalSection, dwSpinCount)
  end

  #def tryEnterCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Win32cr::Foundation::BOOL
    #C.TryEnterCriticalSection(lpCriticalSection)
  #end

  #def deleteCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void
    #C.DeleteCriticalSection(lpCriticalSection)
  #end

  def initOnceInitialize(init_once : Win32cr::System::Threading::RTL_RUN_ONCE*) : Void
    C.InitOnceInitialize(init_once)
  end

  def initOnceExecuteOnce(init_once : Win32cr::System::Threading::RTL_RUN_ONCE*, init_fn : Win32cr::System::Threading::PINIT_ONCE_FN, parameter : Void*, context : Void**) : Win32cr::Foundation::BOOL
    C.InitOnceExecuteOnce(init_once, init_fn, parameter, context)
  end

  def initOnceBeginInitialize(lpInitOnce : Win32cr::System::Threading::RTL_RUN_ONCE*, dwFlags : UInt32, fPending : Win32cr::Foundation::BOOL*, lpContext : Void**) : Win32cr::Foundation::BOOL
    C.InitOnceBeginInitialize(lpInitOnce, dwFlags, fPending, lpContext)
  end

  def initOnceComplete(lpInitOnce : Win32cr::System::Threading::RTL_RUN_ONCE*, dwFlags : UInt32, lpContext : Void*) : Win32cr::Foundation::BOOL
    C.InitOnceComplete(lpInitOnce, dwFlags, lpContext)
  end

  #def initializeConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void
    #C.InitializeConditionVariable(condition_variable)
  #end

  #def wakeConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void
    #C.WakeConditionVariable(condition_variable)
  #end

  #def wakeAllConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void
    #C.WakeAllConditionVariable(condition_variable)
  #end

  #def sleepConditionVariableCS(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*, critical_section : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL
    #C.SleepConditionVariableCS(condition_variable, critical_section, dwMilliseconds)
  #end

  def sleepConditionVariableSRW(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*, srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*, dwMilliseconds : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL
    C.SleepConditionVariableSRW(condition_variable, srw_lock, dwMilliseconds, flags)
  end

  def setEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetEvent(hEvent)
  end

  def resetEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.ResetEvent(hEvent)
  end

  def releaseSemaphore(hSemaphore : Win32cr::Foundation::HANDLE, lReleaseCount : Int32, lpPreviousCount : Int32*) : Win32cr::Foundation::BOOL
    C.ReleaseSemaphore(hSemaphore, lReleaseCount, lpPreviousCount)
  end

  def releaseMutex(hMutex : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.ReleaseMutex(hMutex)
  end

  #def waitForSingleObject(hHandle : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32) : UInt32
    #C.WaitForSingleObject(hHandle, dwMilliseconds)
  #end

  def sleepEx(dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32
    C.SleepEx(dwMilliseconds, bAlertable)
  end

  def waitForSingleObjectEx(hHandle : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32
    C.WaitForSingleObjectEx(hHandle, dwMilliseconds, bAlertable)
  end

  def waitForMultipleObjectsEx(nCount : UInt32, lpHandles : Win32cr::Foundation::HANDLE*, bWaitAll : Win32cr::Foundation::BOOL, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32
    C.WaitForMultipleObjectsEx(nCount, lpHandles, bWaitAll, dwMilliseconds, bAlertable)
  end

  def createMutexA(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInitialOwner : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.CreateMutexA(lpMutexAttributes, bInitialOwner, lpName)
  end

  def createMutexW(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInitialOwner : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.CreateMutexW(lpMutexAttributes, bInitialOwner, lpName)
  end

  def openMutexW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenMutexW(dwDesiredAccess, bInheritHandle, lpName)
  end

  def createEventA(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, bInitialState : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.CreateEventA(lpEventAttributes, bManualReset, bInitialState, lpName)
  end

  def createEventW(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, bInitialState : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.CreateEventW(lpEventAttributes, bManualReset, bInitialState, lpName)
  end

  def openEventA(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.OpenEventA(dwDesiredAccess, bInheritHandle, lpName)
  end

  def openEventW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenEventW(dwDesiredAccess, bInheritHandle, lpName)
  end

  def openSemaphoreW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenSemaphoreW(dwDesiredAccess, bInheritHandle, lpName)
  end

  def openWaitableTimerW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenWaitableTimerW(dwDesiredAccess, bInheritHandle, lpTimerName)
  end

  def setWaitableTimerEx(hTimer : Win32cr::Foundation::HANDLE, lpDueTime : Win32cr::Foundation::LARGE_INTEGER*, lPeriod : Int32, pfnCompletionRoutine : Win32cr::System::Threading::PTIMERAPCROUTINE, lpArgToCompletionRoutine : Void*, wake_context : Win32cr::System::Threading::REASON_CONTEXT*, tolerable_delay : UInt32) : Win32cr::Foundation::BOOL
    C.SetWaitableTimerEx(hTimer, lpDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine, wake_context, tolerable_delay)
  end

  #def setWaitableTimer(hTimer : Win32cr::Foundation::HANDLE, lpDueTime : Win32cr::Foundation::LARGE_INTEGER*, lPeriod : Int32, pfnCompletionRoutine : Win32cr::System::Threading::PTIMERAPCROUTINE, lpArgToCompletionRoutine : Void*, fResume : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    #C.SetWaitableTimer(hTimer, lpDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine, fResume)
  #end

  #def cancelWaitableTimer(hTimer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    #C.CancelWaitableTimer(hTimer)
  #end

  def createMutexExA(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateMutexExA(lpMutexAttributes, lpName, dwFlags, dwDesiredAccess)
  end

  def createMutexExW(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateMutexExW(lpMutexAttributes, lpName, dwFlags, dwDesiredAccess)
  end

  def createEventExA(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR, dwFlags : Win32cr::System::Threading::CREATE_EVENT, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateEventExA(lpEventAttributes, lpName, dwFlags, dwDesiredAccess)
  end

  def createEventExW(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Threading::CREATE_EVENT, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateEventExW(lpEventAttributes, lpName, dwFlags, dwDesiredAccess)
  end

  def createSemaphoreExW(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateSemaphoreExW(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName, dwFlags, dwDesiredAccess)
  end

  #def createWaitableTimerExW(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpTimerName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    #C.CreateWaitableTimerExW(lpTimerAttributes, lpTimerName, dwFlags, dwDesiredAccess)
  #end

  def enterSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.EnterSynchronizationBarrier(lpBarrier, dwFlags)
  end

  def initializeSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*, lTotalThreads : Int32, lSpinCount : Int32) : Win32cr::Foundation::BOOL
    C.InitializeSynchronizationBarrier(lpBarrier, lTotalThreads, lSpinCount)
  end

  def deleteSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*) : Win32cr::Foundation::BOOL
    C.DeleteSynchronizationBarrier(lpBarrier)
  end

  #def sleep(dwMilliseconds : UInt32) : Void
    #C.Sleep(dwMilliseconds)
  #end

  def waitOnAddress(address : Void*, compare_address : Void*, address_size : LibC::UIntPtrT, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL
    C.WaitOnAddress(address, compare_address, address_size, dwMilliseconds)
  end

  def wakeByAddressSingle(address : Void*) : Void
    C.WakeByAddressSingle(address)
  end

  def wakeByAddressAll(address : Void*) : Void
    C.WakeByAddressAll(address)
  end

  def waitForMultipleObjects(nCount : UInt32, lpHandles : Win32cr::Foundation::HANDLE*, bWaitAll : Win32cr::Foundation::BOOL, dwMilliseconds : UInt32) : UInt32
    C.WaitForMultipleObjects(nCount, lpHandles, bWaitAll, dwMilliseconds)
  end

  def createSemaphoreW(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.CreateSemaphoreW(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName)
  end

  def createWaitableTimerW(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.CreateWaitableTimerW(lpTimerAttributes, bManualReset, lpTimerName)
  end

  def initializeSListHead(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Void
    C.InitializeSListHead(list_head)
  end

  def interlockedPopEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.InterlockedPopEntrySList(list_head)
  end

  def interlockedPushEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list_entry : Win32cr::System::Kernel::SLIST_ENTRY*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.InterlockedPushEntrySList(list_head, list_entry)
  end

  def interlockedPushListSListEx(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list : Win32cr::System::Kernel::SLIST_ENTRY*, list_end : Win32cr::System::Kernel::SLIST_ENTRY*, count : UInt32) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.InterlockedPushListSListEx(list_head, list, list_end, count)
  end

  def interlockedFlushSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*
    C.InterlockedFlushSList(list_head)
  end

  def queryDepthSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : UInt16
    C.QueryDepthSList(list_head)
  end

  #def queueUserAPC(pfnAPC : Win32cr::Foundation::PAPCFUNC, hThread : Win32cr::Foundation::HANDLE, dwData : LibC::UIntPtrT) : UInt32
    #C.QueueUserAPC(pfnAPC, hThread, dwData)
  #end

  def queueUserAPC2(apc_routine : Win32cr::Foundation::PAPCFUNC, thread : Win32cr::Foundation::HANDLE, data : LibC::UIntPtrT, flags : Win32cr::System::Threading::QUEUE_USER_APC_FLAGS) : Win32cr::Foundation::BOOL
    C.QueueUserAPC2(apc_routine, thread, data, flags)
  end

  #def getProcessTimes(hProcess : Win32cr::Foundation::HANDLE, lpCreationTime : Win32cr::Foundation::FILETIME*, lpExitTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL
    #C.GetProcessTimes(hProcess, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime)
  #end

  #def getCurrentProcess : Win32cr::Foundation::HANDLE
    #C.GetCurrentProcess
  #end

  #def getCurrentProcessId : UInt32
    #C.GetCurrentProcessId
  #end

  #def exitProcess(uExitCode : UInt32) : Void
    #C.ExitProcess(uExitCode)
  #end

  #def terminateProcess(hProcess : Win32cr::Foundation::HANDLE, uExitCode : UInt32) : Win32cr::Foundation::BOOL
    #C.TerminateProcess(hProcess, uExitCode)
  #end

  #def getExitCodeProcess(hProcess : Win32cr::Foundation::HANDLE, lpExitCode : UInt32*) : Win32cr::Foundation::BOOL
    #C.GetExitCodeProcess(hProcess, lpExitCode)
  #end

  #def switchToThread : Win32cr::Foundation::BOOL
    #C.SwitchToThread
  #end

  def createThread(lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : Win32cr::System::Threading::THREAD_CREATION_FLAGS, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE
    C.CreateThread(lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId)
  end

  def createRemoteThread(hProcess : Win32cr::Foundation::HANDLE, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : UInt32, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE
    C.CreateRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId)
  end

  #def getCurrentThread : Win32cr::Foundation::HANDLE
    #C.GetCurrentThread
  #end

  #def getCurrentThreadId : UInt32
    #C.GetCurrentThreadId
  #end

  def openThread(dwDesiredAccess : Win32cr::System::Threading::THREAD_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, dwThreadId : UInt32) : Win32cr::Foundation::HANDLE
    C.OpenThread(dwDesiredAccess, bInheritHandle, dwThreadId)
  end

  def setThreadPriority(hThread : Win32cr::Foundation::HANDLE, nPriority : Win32cr::System::Threading::THREAD_PRIORITY) : Win32cr::Foundation::BOOL
    C.SetThreadPriority(hThread, nPriority)
  end

  def setThreadPriorityBoost(hThread : Win32cr::Foundation::HANDLE, bDisablePriorityBoost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetThreadPriorityBoost(hThread, bDisablePriorityBoost)
  end

  def getThreadPriorityBoost(hThread : Win32cr::Foundation::HANDLE, pDisablePriorityBoost : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetThreadPriorityBoost(hThread, pDisablePriorityBoost)
  end

  def getThreadPriority(hThread : Win32cr::Foundation::HANDLE) : Int32
    C.GetThreadPriority(hThread)
  end

  def exitThread(dwExitCode : UInt32) : Void
    C.ExitThread(dwExitCode)
  end

  def terminateThread(hThread : Win32cr::Foundation::HANDLE, dwExitCode : UInt32) : Win32cr::Foundation::BOOL
    C.TerminateThread(hThread, dwExitCode)
  end

  def getExitCodeThread(hThread : Win32cr::Foundation::HANDLE, lpExitCode : UInt32*) : Win32cr::Foundation::BOOL
    C.GetExitCodeThread(hThread, lpExitCode)
  end

  #def suspendThread(hThread : Win32cr::Foundation::HANDLE) : UInt32
    #C.SuspendThread(hThread)
  #end

  #def resumeThread(hThread : Win32cr::Foundation::HANDLE) : UInt32
    #C.ResumeThread(hThread)
  #end

  #def tlsAlloc : UInt32
    #C.TlsAlloc
  #end

  #def tlsGetValue(dwTlsIndex : UInt32) : Void*
    #C.TlsGetValue(dwTlsIndex)
  #end

  #def tlsSetValue(dwTlsIndex : UInt32, lpTlsValue : Void*) : Win32cr::Foundation::BOOL
    #C.TlsSetValue(dwTlsIndex, lpTlsValue)
  #end

  def tlsFree(dwTlsIndex : UInt32) : Win32cr::Foundation::BOOL
    C.TlsFree(dwTlsIndex)
  end

  def createProcessA(lpApplicationName : Win32cr::Foundation::PSTR, lpCommandLine : Win32cr::Foundation::PSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : Win32cr::System::Threading::PROCESS_CREATION_FLAGS, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL
    C.CreateProcessA(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
  end

  #def createProcessW(lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : Win32cr::System::Threading::PROCESS_CREATION_FLAGS, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL
    #C.CreateProcessW(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
  #end

  def setProcessShutdownParameters(dwLevel : UInt32, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.SetProcessShutdownParameters(dwLevel, dwFlags)
  end

  def getProcessVersion(process_id : UInt32) : UInt32
    C.GetProcessVersion(process_id)
  end

  def getStartupInfoW(lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*) : Void
    C.GetStartupInfoW(lpStartupInfo)
  end

  def createProcessAsUserW(hToken : Win32cr::Foundation::HANDLE, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL
    C.CreateProcessAsUserW(hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
  end

  def setThreadToken(thread : Win32cr::Foundation::HANDLE*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.SetThreadToken(thread, token)
  end

  def openProcessToken(process_handle : Win32cr::Foundation::HANDLE, desired_access : Win32cr::Security::TOKEN_ACCESS_MASK, token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.OpenProcessToken(process_handle, desired_access, token_handle)
  end

  def openThreadToken(thread_handle : Win32cr::Foundation::HANDLE, desired_access : Win32cr::Security::TOKEN_ACCESS_MASK, open_as_self : Win32cr::Foundation::BOOL, token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.OpenThreadToken(thread_handle, desired_access, open_as_self, token_handle)
  end

  def setPriorityClass(hProcess : Win32cr::Foundation::HANDLE, dwPriorityClass : Win32cr::System::Threading::PROCESS_CREATION_FLAGS) : Win32cr::Foundation::BOOL
    C.SetPriorityClass(hProcess, dwPriorityClass)
  end

  def getPriorityClass(hProcess : Win32cr::Foundation::HANDLE) : UInt32
    C.GetPriorityClass(hProcess)
  end

  #def setThreadStackGuarantee(stack_size_in_bytes : UInt32*) : Win32cr::Foundation::BOOL
    #C.SetThreadStackGuarantee(stack_size_in_bytes)
  #end

  def getProcessId(process : Win32cr::Foundation::HANDLE) : UInt32
    C.GetProcessId(process)
  end

  def getThreadId(thread : Win32cr::Foundation::HANDLE) : UInt32
    C.GetThreadId(thread)
  end

  def flushProcessWriteBuffers : Void
    C.FlushProcessWriteBuffers
  end

  def getProcessIdOfThread(thread : Win32cr::Foundation::HANDLE) : UInt32
    C.GetProcessIdOfThread(thread)
  end

  def initializeProcThreadAttributeList(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, dwAttributeCount : UInt32, dwFlags : UInt32, lpSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.InitializeProcThreadAttributeList(lpAttributeList, dwAttributeCount, dwFlags, lpSize)
  end

  def deleteProcThreadAttributeList(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST) : Void
    C.DeleteProcThreadAttributeList(lpAttributeList)
  end

  def updateProcThreadAttribute(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, dwFlags : UInt32, attribute : LibC::UIntPtrT, lpValue : Void*, cbSize : LibC::UIntPtrT, lpPreviousValue : Void*, lpReturnSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.UpdateProcThreadAttribute(lpAttributeList, dwFlags, attribute, lpValue, cbSize, lpPreviousValue, lpReturnSize)
  end

  def setProcessDynamicEHContinuationTargets(process : Win32cr::Foundation::HANDLE, number_of_targets : UInt16, targets : Win32cr::System::Threading::PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*) : Win32cr::Foundation::BOOL
    C.SetProcessDynamicEHContinuationTargets(process, number_of_targets, targets)
  end

  def setProcessDynamicEnforcedCetCompatibleRanges(process : Win32cr::Foundation::HANDLE, number_of_ranges : UInt16, ranges : Win32cr::System::Threading::PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*) : Win32cr::Foundation::BOOL
    C.SetProcessDynamicEnforcedCetCompatibleRanges(process, number_of_ranges, ranges)
  end

  def setProcessAffinityUpdateMode(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_AFFINITY_AUTO_UPDATE_FLAGS) : Win32cr::Foundation::BOOL
    C.SetProcessAffinityUpdateMode(hProcess, dwFlags)
  end

  def queryProcessAffinityUpdateMode(hProcess : Win32cr::Foundation::HANDLE, lpdwFlags : Win32cr::System::Threading::PROCESS_AFFINITY_AUTO_UPDATE_FLAGS*) : Win32cr::Foundation::BOOL
    C.QueryProcessAffinityUpdateMode(hProcess, lpdwFlags)
  end

  def createRemoteThreadEx(hProcess : Win32cr::Foundation::HANDLE, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : UInt32, lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE
    C.CreateRemoteThreadEx(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpAttributeList, lpThreadId)
  end

  #def getCurrentThreadStackLimits(low_limit : LibC::UIntPtrT*, high_limit : LibC::UIntPtrT*) : Void
    #C.GetCurrentThreadStackLimits(low_limit, high_limit)
  #end

  def getProcessMitigationPolicy(hProcess : Win32cr::Foundation::HANDLE, mitigation_policy : Win32cr::System::Threading::PROCESS_MITIGATION_POLICY, lpBuffer : Void*, dwLength : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.GetProcessMitigationPolicy(hProcess, mitigation_policy, lpBuffer, dwLength)
  end

  def setProcessMitigationPolicy(mitigation_policy : Win32cr::System::Threading::PROCESS_MITIGATION_POLICY, lpBuffer : Void*, dwLength : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.SetProcessMitigationPolicy(mitigation_policy, lpBuffer, dwLength)
  end

  def getThreadTimes(hThread : Win32cr::Foundation::HANDLE, lpCreationTime : Win32cr::Foundation::FILETIME*, lpExitTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL
    C.GetThreadTimes(hThread, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime)
  end

  #def openProcess(dwDesiredAccess : Win32cr::System::Threading::PROCESS_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, dwProcessId : UInt32) : Win32cr::Foundation::HANDLE
    #C.OpenProcess(dwDesiredAccess, bInheritHandle, dwProcessId)
  #end

  def isProcessorFeaturePresent(processor_feature : Win32cr::System::Threading::PROCESSOR_FEATURE_ID) : Win32cr::Foundation::BOOL
    C.IsProcessorFeaturePresent(processor_feature)
  end

  def getProcessHandleCount(hProcess : Win32cr::Foundation::HANDLE, pdwHandleCount : UInt32*) : Win32cr::Foundation::BOOL
    C.GetProcessHandleCount(hProcess, pdwHandleCount)
  end

  def getCurrentProcessorNumber : UInt32
    C.GetCurrentProcessorNumber
  end

  def setThreadIdealProcessorEx(hThread : Win32cr::Foundation::HANDLE, lpIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*, lpPreviousIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Win32cr::Foundation::BOOL
    C.SetThreadIdealProcessorEx(hThread, lpIdealProcessor, lpPreviousIdealProcessor)
  end

  def getThreadIdealProcessorEx(hThread : Win32cr::Foundation::HANDLE, lpIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Win32cr::Foundation::BOOL
    C.GetThreadIdealProcessorEx(hThread, lpIdealProcessor)
  end

  def getCurrentProcessorNumberEx(proc_number : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Void
    C.GetCurrentProcessorNumberEx(proc_number)
  end

  def getProcessPriorityBoost(hProcess : Win32cr::Foundation::HANDLE, pDisablePriorityBoost : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetProcessPriorityBoost(hProcess, pDisablePriorityBoost)
  end

  def setProcessPriorityBoost(hProcess : Win32cr::Foundation::HANDLE, bDisablePriorityBoost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetProcessPriorityBoost(hProcess, bDisablePriorityBoost)
  end

  def getThreadIOPendingFlag(hThread : Win32cr::Foundation::HANDLE, lpIOIsPending : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetThreadIOPendingFlag(hThread, lpIOIsPending)
  end

  def getSystemTimes(lpIdleTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL
    C.GetSystemTimes(lpIdleTime, lpKernelTime, lpUserTime)
  end

  def getThreadInformation(hThread : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREAD_INFORMATION_CLASS, thread_information : Void*, thread_information_size : UInt32) : Win32cr::Foundation::BOOL
    C.GetThreadInformation(hThread, thread_information_class, thread_information, thread_information_size)
  end

  def setThreadInformation(hThread : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREAD_INFORMATION_CLASS, thread_information : Void*, thread_information_size : UInt32) : Win32cr::Foundation::BOOL
    C.SetThreadInformation(hThread, thread_information_class, thread_information, thread_information_size)
  end

  def isProcessCritical(hProcess : Win32cr::Foundation::HANDLE, critical : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.IsProcessCritical(hProcess, critical)
  end

  def setProtectedPolicy(policy_guid : LibC::GUID*, policy_value : LibC::UIntPtrT, old_policy_value : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.SetProtectedPolicy(policy_guid, policy_value, old_policy_value)
  end

  def queryProtectedPolicy(policy_guid : LibC::GUID*, policy_value : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.QueryProtectedPolicy(policy_guid, policy_value)
  end

  def setThreadIdealProcessor(hThread : Win32cr::Foundation::HANDLE, dwIdealProcessor : UInt32) : UInt32
    C.SetThreadIdealProcessor(hThread, dwIdealProcessor)
  end

  def setProcessInformation(hProcess : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESS_INFORMATION_CLASS, process_information : Void*, process_information_size : UInt32) : Win32cr::Foundation::BOOL
    C.SetProcessInformation(hProcess, process_information_class, process_information, process_information_size)
  end

  def getProcessInformation(hProcess : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESS_INFORMATION_CLASS, process_information : Void*, process_information_size : UInt32) : Win32cr::Foundation::BOOL
    C.GetProcessInformation(hProcess, process_information_class, process_information, process_information_size)
  end

  def getProcessDefaultCpuSets(process : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32, required_id_count : UInt32*) : Win32cr::Foundation::BOOL
    C.GetProcessDefaultCpuSets(process, cpu_set_ids, cpu_set_id_count, required_id_count)
  end

  def setProcessDefaultCpuSets(process : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32) : Win32cr::Foundation::BOOL
    C.SetProcessDefaultCpuSets(process, cpu_set_ids, cpu_set_id_count)
  end

  def getThreadSelectedCpuSets(thread : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32, required_id_count : UInt32*) : Win32cr::Foundation::BOOL
    C.GetThreadSelectedCpuSets(thread, cpu_set_ids, cpu_set_id_count, required_id_count)
  end

  def setThreadSelectedCpuSets(thread : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32) : Win32cr::Foundation::BOOL
    C.SetThreadSelectedCpuSets(thread, cpu_set_ids, cpu_set_id_count)
  end

  def createProcessAsUserA(hToken : Win32cr::Foundation::HANDLE, lpApplicationName : Win32cr::Foundation::PSTR, lpCommandLine : Win32cr::Foundation::PSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL
    C.CreateProcessAsUserA(hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
  end

  def getProcessShutdownParameters(lpdwLevel : UInt32*, lpdwFlags : UInt32*) : Win32cr::Foundation::BOOL
    C.GetProcessShutdownParameters(lpdwLevel, lpdwFlags)
  end

  def getProcessDefaultCpuSetMasks(process : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL
    C.GetProcessDefaultCpuSetMasks(process, cpu_set_masks, cpu_set_mask_count, required_mask_count)
  end

  def setProcessDefaultCpuSetMasks(process : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16) : Win32cr::Foundation::BOOL
    C.SetProcessDefaultCpuSetMasks(process, cpu_set_masks, cpu_set_mask_count)
  end

  def getThreadSelectedCpuSetMasks(thread : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL
    C.GetThreadSelectedCpuSetMasks(thread, cpu_set_masks, cpu_set_mask_count, required_mask_count)
  end

  def setThreadSelectedCpuSetMasks(thread : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16) : Win32cr::Foundation::BOOL
    C.SetThreadSelectedCpuSetMasks(thread, cpu_set_masks, cpu_set_mask_count)
  end

  def getMachineTypeAttributes(machine : UInt16, machine_type_attributes : Win32cr::System::Threading::MACHINE_ATTRIBUTES*) : Win32cr::Foundation::HRESULT
    C.GetMachineTypeAttributes(machine, machine_type_attributes)
  end

  #def setThreadDescription(hThread : Win32cr::Foundation::HANDLE, lpThreadDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    #C.SetThreadDescription(hThread, lpThreadDescription)
  #end

  def getThreadDescription(hThread : Win32cr::Foundation::HANDLE, ppszThreadDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.GetThreadDescription(hThread, ppszThreadDescription)
  end

  def queueUserWorkItem(function : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, context : Void*, flags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL
    C.QueueUserWorkItem(function, context, flags)
  end

  def unregisterWaitEx(wait_handle : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.UnregisterWaitEx(wait_handle, completion_event)
  end

  def createTimerQueue : Win32cr::Foundation::HANDLE
    C.CreateTimerQueue
  end

  def createTimerQueueTimer(phNewTimer : Win32cr::Foundation::HANDLE*, timer_queue : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, flags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL
    C.CreateTimerQueueTimer(phNewTimer, timer_queue, callback, parameter, due_time, period, flags)
  end

  def changeTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE, due_time : UInt32, period : UInt32) : Win32cr::Foundation::BOOL
    C.ChangeTimerQueueTimer(timer_queue, timer, due_time, period)
  end

  def deleteTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.DeleteTimerQueueTimer(timer_queue, timer, completion_event)
  end

  def deleteTimerQueue(timer_queue : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.DeleteTimerQueue(timer_queue)
  end

  def deleteTimerQueueEx(timer_queue : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.DeleteTimerQueueEx(timer_queue, completion_event)
  end

  def createThreadpool(reserved : Void*) : Win32cr::System::Threading::PTP_POOL
    C.CreateThreadpool(reserved)
  end

  def setThreadpoolThreadMaximum(ptpp : Win32cr::System::Threading::PTP_POOL, cthrdMost : UInt32) : Void
    C.SetThreadpoolThreadMaximum(ptpp, cthrdMost)
  end

  def setThreadpoolThreadMinimum(ptpp : Win32cr::System::Threading::PTP_POOL, cthrdMic : UInt32) : Win32cr::Foundation::BOOL
    C.SetThreadpoolThreadMinimum(ptpp, cthrdMic)
  end

  def setThreadpoolStackInformation(ptpp : Win32cr::System::Threading::PTP_POOL, ptpsi : Win32cr::System::Threading::TP_POOL_STACK_INFORMATION*) : Win32cr::Foundation::BOOL
    C.SetThreadpoolStackInformation(ptpp, ptpsi)
  end

  def queryThreadpoolStackInformation(ptpp : Win32cr::System::Threading::PTP_POOL, ptpsi : Win32cr::System::Threading::TP_POOL_STACK_INFORMATION*) : Win32cr::Foundation::BOOL
    C.QueryThreadpoolStackInformation(ptpp, ptpsi)
  end

  def closeThreadpool(ptpp : Win32cr::System::Threading::PTP_POOL) : Void
    C.CloseThreadpool(ptpp)
  end

  def createThreadpoolCleanupGroup : LibC::IntPtrT
    C.CreateThreadpoolCleanupGroup
  end

  def closeThreadpoolCleanupGroupMembers(ptpcg : LibC::IntPtrT, fCancelPendingCallbacks : Win32cr::Foundation::BOOL, pvCleanupContext : Void*) : Void
    C.CloseThreadpoolCleanupGroupMembers(ptpcg, fCancelPendingCallbacks, pvCleanupContext)
  end

  def closeThreadpoolCleanupGroup(ptpcg : LibC::IntPtrT) : Void
    C.CloseThreadpoolCleanupGroup(ptpcg)
  end

  def setEventWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, evt : Win32cr::Foundation::HANDLE) : Void
    C.SetEventWhenCallbackReturns(pci, evt)
  end

  def releaseSemaphoreWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, sem : Win32cr::Foundation::HANDLE, crel : UInt32) : Void
    C.ReleaseSemaphoreWhenCallbackReturns(pci, sem, crel)
  end

  def releaseMutexWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, mut : Win32cr::Foundation::HANDLE) : Void
    C.ReleaseMutexWhenCallbackReturns(pci, mut)
  end

  def leaveCriticalSectionWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, pcs : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void
    C.LeaveCriticalSectionWhenCallbackReturns(pci, pcs)
  end

  def freeLibraryWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, mod : Win32cr::Foundation::HINSTANCE) : Void
    C.FreeLibraryWhenCallbackReturns(pci, mod)
  end

  def callbackMayRunLong(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*) : Win32cr::Foundation::BOOL
    C.CallbackMayRunLong(pci)
  end

  def disassociateCurrentThreadFromCallback(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*) : Void
    C.DisassociateCurrentThreadFromCallback(pci)
  end

  def trySubmitThreadpoolCallback(pfns : Win32cr::System::Threading::PTP_SIMPLE_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::Foundation::BOOL
    C.TrySubmitThreadpoolCallback(pfns, pv, pcbe)
  end

  def createThreadpoolWork(pfnwk : Win32cr::System::Threading::PTP_WORK_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_WORK*
    C.CreateThreadpoolWork(pfnwk, pv, pcbe)
  end

  def submitThreadpoolWork(pwk : Win32cr::System::Threading::TP_WORK*) : Void
    C.SubmitThreadpoolWork(pwk)
  end

  def waitForThreadpoolWorkCallbacks(pwk : Win32cr::System::Threading::TP_WORK*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void
    C.WaitForThreadpoolWorkCallbacks(pwk, fCancelPendingCallbacks)
  end

  def closeThreadpoolWork(pwk : Win32cr::System::Threading::TP_WORK*) : Void
    C.CloseThreadpoolWork(pwk)
  end

  def createThreadpoolTimer(pfnti : Win32cr::System::Threading::PTP_TIMER_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_TIMER*
    C.CreateThreadpoolTimer(pfnti, pv, pcbe)
  end

  def setThreadpoolTimer(pti : Win32cr::System::Threading::TP_TIMER*, pftDueTime : Win32cr::Foundation::FILETIME*, msPeriod : UInt32, msWindowLength : UInt32) : Void
    C.SetThreadpoolTimer(pti, pftDueTime, msPeriod, msWindowLength)
  end

  def isThreadpoolTimerSet(pti : Win32cr::System::Threading::TP_TIMER*) : Win32cr::Foundation::BOOL
    C.IsThreadpoolTimerSet(pti)
  end

  def waitForThreadpoolTimerCallbacks(pti : Win32cr::System::Threading::TP_TIMER*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void
    C.WaitForThreadpoolTimerCallbacks(pti, fCancelPendingCallbacks)
  end

  def closeThreadpoolTimer(pti : Win32cr::System::Threading::TP_TIMER*) : Void
    C.CloseThreadpoolTimer(pti)
  end

  def createThreadpoolWait(pfnwa : Win32cr::System::Threading::PTP_WAIT_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_WAIT*
    C.CreateThreadpoolWait(pfnwa, pv, pcbe)
  end

  def setThreadpoolWait(pwa : Win32cr::System::Threading::TP_WAIT*, h : Win32cr::Foundation::HANDLE, pftTimeout : Win32cr::Foundation::FILETIME*) : Void
    C.SetThreadpoolWait(pwa, h, pftTimeout)
  end

  def waitForThreadpoolWaitCallbacks(pwa : Win32cr::System::Threading::TP_WAIT*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void
    C.WaitForThreadpoolWaitCallbacks(pwa, fCancelPendingCallbacks)
  end

  def closeThreadpoolWait(pwa : Win32cr::System::Threading::TP_WAIT*) : Void
    C.CloseThreadpoolWait(pwa)
  end

  def createThreadpoolIo(fl : Win32cr::Foundation::HANDLE, pfnio : Win32cr::System::Threading::PTP_WIN32_IO_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_IO*
    C.CreateThreadpoolIo(fl, pfnio, pv, pcbe)
  end

  def startThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void
    C.StartThreadpoolIo(pio)
  end

  def cancelThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void
    C.CancelThreadpoolIo(pio)
  end

  def waitForThreadpoolIoCallbacks(pio : Win32cr::System::Threading::TP_IO*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void
    C.WaitForThreadpoolIoCallbacks(pio, fCancelPendingCallbacks)
  end

  def closeThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void
    C.CloseThreadpoolIo(pio)
  end

  def setThreadpoolTimerEx(pti : Win32cr::System::Threading::TP_TIMER*, pftDueTime : Win32cr::Foundation::FILETIME*, msPeriod : UInt32, msWindowLength : UInt32) : Win32cr::Foundation::BOOL
    C.SetThreadpoolTimerEx(pti, pftDueTime, msPeriod, msWindowLength)
  end

  def setThreadpoolWaitEx(pwa : Win32cr::System::Threading::TP_WAIT*, h : Win32cr::Foundation::HANDLE, pftTimeout : Win32cr::Foundation::FILETIME*, reserved : Void*) : Win32cr::Foundation::BOOL
    C.SetThreadpoolWaitEx(pwa, h, pftTimeout, reserved)
  end

  def isWow64Process(hProcess : Win32cr::Foundation::HANDLE, wow64_process : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.IsWow64Process(hProcess, wow64_process)
  end

  def wow64SetThreadDefaultGuestMachine(machine : UInt16) : UInt16
    C.Wow64SetThreadDefaultGuestMachine(machine)
  end

  def isWow64Process2(hProcess : Win32cr::Foundation::HANDLE, pProcessMachine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE*, pNativeMachine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE*) : Win32cr::Foundation::BOOL
    C.IsWow64Process2(hProcess, pProcessMachine, pNativeMachine)
  end

  def wow64SuspendThread(hThread : Win32cr::Foundation::HANDLE) : UInt32
    C.Wow64SuspendThread(hThread)
  end

  def createPrivateNamespaceW(lpPrivateNamespaceAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PWSTR) : Win32cr::System::Threading::NamespaceHandle
    C.CreatePrivateNamespaceW(lpPrivateNamespaceAttributes, lpBoundaryDescriptor, lpAliasPrefix)
  end

  def openPrivateNamespaceW(lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PWSTR) : Win32cr::System::Threading::NamespaceHandle
    C.OpenPrivateNamespaceW(lpBoundaryDescriptor, lpAliasPrefix)
  end

  def closePrivateNamespace(handle : Win32cr::System::Threading::NamespaceHandle, flags : UInt32) : Win32cr::Foundation::BOOLEAN
    C.ClosePrivateNamespace(handle, flags)
  end

  def createBoundaryDescriptorW(name : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::System::Threading::BoundaryDescriptorHandle
    C.CreateBoundaryDescriptorW(name, flags)
  end

  def addSIDToBoundaryDescriptor(boundary_descriptor : Win32cr::Foundation::HANDLE*, required_sid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddSIDToBoundaryDescriptor(boundary_descriptor, required_sid)
  end

  def deleteBoundaryDescriptor(boundary_descriptor : Win32cr::System::Threading::BoundaryDescriptorHandle) : Void
    C.DeleteBoundaryDescriptor(boundary_descriptor)
  end

  def getNumaHighestNodeNumber(highest_node_number : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNumaHighestNodeNumber(highest_node_number)
  end

  def getNumaNodeProcessorMaskEx(node : UInt16, processor_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL
    C.GetNumaNodeProcessorMaskEx(node, processor_mask)
  end

  def getNumaNodeProcessorMask2(node_number : UInt16, processor_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, processor_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL
    C.GetNumaNodeProcessorMask2(node_number, processor_masks, processor_mask_count, required_mask_count)
  end

  def getNumaProximityNodeEx(proximity_id : UInt32, node_number : UInt16*) : Win32cr::Foundation::BOOL
    C.GetNumaProximityNodeEx(proximity_id, node_number)
  end

  def getProcessGroupAffinity(hProcess : Win32cr::Foundation::HANDLE, group_count : UInt16*, group_array : UInt16*) : Win32cr::Foundation::BOOL
    C.GetProcessGroupAffinity(hProcess, group_count, group_array)
  end

  def getThreadGroupAffinity(hThread : Win32cr::Foundation::HANDLE, group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL
    C.GetThreadGroupAffinity(hThread, group_affinity)
  end

  def setThreadGroupAffinity(hThread : Win32cr::Foundation::HANDLE, group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*, previous_group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL
    C.SetThreadGroupAffinity(hThread, group_affinity, previous_group_affinity)
  end

  def avSetMmThreadCharacteristicsA(task_name : Win32cr::Foundation::PSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE
    C.AvSetMmThreadCharacteristicsA(task_name, task_index)
  end

  def avSetMmThreadCharacteristicsW(task_name : Win32cr::Foundation::PWSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE
    C.AvSetMmThreadCharacteristicsW(task_name, task_index)
  end

  def avSetMmMaxThreadCharacteristicsA(first_task : Win32cr::Foundation::PSTR, second_task : Win32cr::Foundation::PSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE
    C.AvSetMmMaxThreadCharacteristicsA(first_task, second_task, task_index)
  end

  def avSetMmMaxThreadCharacteristicsW(first_task : Win32cr::Foundation::PWSTR, second_task : Win32cr::Foundation::PWSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE
    C.AvSetMmMaxThreadCharacteristicsW(first_task, second_task, task_index)
  end

  def avRevertMmThreadCharacteristics(avrt_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.AvRevertMmThreadCharacteristics(avrt_handle)
  end

  def avSetMmThreadPriority(avrt_handle : Win32cr::Foundation::HANDLE, priority : Win32cr::System::Threading::AVRT_PRIORITY) : Win32cr::Foundation::BOOL
    C.AvSetMmThreadPriority(avrt_handle, priority)
  end

  def avRtCreateThreadOrderingGroup(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL
    C.AvRtCreateThreadOrderingGroup(context, period, thread_ordering_guid, timeout)
  end

  def avRtCreateThreadOrderingGroupExA(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*, task_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.AvRtCreateThreadOrderingGroupExA(context, period, thread_ordering_guid, timeout, task_name)
  end

  def avRtCreateThreadOrderingGroupExW(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*, task_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.AvRtCreateThreadOrderingGroupExW(context, period, thread_ordering_guid, timeout, task_name)
  end

  def avRtJoinThreadOrderingGroup(context : Win32cr::Foundation::HANDLE*, thread_ordering_guid : LibC::GUID*, before : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.AvRtJoinThreadOrderingGroup(context, thread_ordering_guid, before)
  end

  def avRtWaitOnThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.AvRtWaitOnThreadOrderingGroup(context)
  end

  def avRtLeaveThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.AvRtLeaveThreadOrderingGroup(context)
  end

  def avRtDeleteThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.AvRtDeleteThreadOrderingGroup(context)
  end

  def avQuerySystemResponsiveness(avrt_handle : Win32cr::Foundation::HANDLE, system_responsiveness_value : UInt32*) : Win32cr::Foundation::BOOL
    C.AvQuerySystemResponsiveness(avrt_handle, system_responsiveness_value)
  end

  def attachThreadInput(idAttach : UInt32, idAttachTo : UInt32, fAttach : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.AttachThreadInput(idAttach, idAttachTo, fAttach)
  end

  def waitForInputIdle(hProcess : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32) : UInt32
    C.WaitForInputIdle(hProcess, dwMilliseconds)
  end

  def getGuiResources(hProcess : Win32cr::Foundation::HANDLE, uiFlags : Win32cr::System::Threading::GET_GUI_RESOURCES_FLAGS) : UInt32
    C.GetGuiResources(hProcess, uiFlags)
  end

  def isImmersiveProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.IsImmersiveProcess(hProcess)
  end

  def setProcessRestrictionExemption(fEnableExemption : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetProcessRestrictionExemption(fEnableExemption)
  end

  def getProcessAffinityMask(hProcess : Win32cr::Foundation::HANDLE, lpProcessAffinityMask : LibC::UIntPtrT*, lpSystemAffinityMask : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.GetProcessAffinityMask(hProcess, lpProcessAffinityMask, lpSystemAffinityMask)
  end

  def setProcessAffinityMask(hProcess : Win32cr::Foundation::HANDLE, dwProcessAffinityMask : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.SetProcessAffinityMask(hProcess, dwProcessAffinityMask)
  end

  def getProcessIoCounters(hProcess : Win32cr::Foundation::HANDLE, lpIoCounters : Win32cr::System::Threading::IO_COUNTERS*) : Win32cr::Foundation::BOOL
    C.GetProcessIoCounters(hProcess, lpIoCounters)
  end

  def switchToFiber(lpFiber : Void*) : Void
    C.SwitchToFiber(lpFiber)
  end

  def deleteFiber(lpFiber : Void*) : Void
    C.DeleteFiber(lpFiber)
  end

  def convertFiberToThread : Win32cr::Foundation::BOOL
    C.ConvertFiberToThread
  end

  def createFiberEx(dwStackCommitSize : LibC::UIntPtrT, dwStackReserveSize : LibC::UIntPtrT, dwFlags : UInt32, lpStartAddress : Win32cr::System::Threading::LPFIBER_START_ROUTINE, lpParameter : Void*) : Void*
    C.CreateFiberEx(dwStackCommitSize, dwStackReserveSize, dwFlags, lpStartAddress, lpParameter)
  end

  def convertThreadToFiberEx(lpParameter : Void*, dwFlags : UInt32) : Void*
    C.ConvertThreadToFiberEx(lpParameter, dwFlags)
  end

  def createFiber(dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPFIBER_START_ROUTINE, lpParameter : Void*) : Void*
    C.CreateFiber(dwStackSize, lpStartAddress, lpParameter)
  end

  def convertThreadToFiber(lpParameter : Void*) : Void*
    C.ConvertThreadToFiber(lpParameter)
  end

  def createUmsCompletionList(ums_completion_list : Void**) : Win32cr::Foundation::BOOL
    C.CreateUmsCompletionList(ums_completion_list)
  end

  def dequeueUmsCompletionListItems(ums_completion_list : Void*, wait_time_out : UInt32, ums_thread_list : Void**) : Win32cr::Foundation::BOOL
    C.DequeueUmsCompletionListItems(ums_completion_list, wait_time_out, ums_thread_list)
  end

  def getUmsCompletionListEvent(ums_completion_list : Void*, ums_completion_event : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL
    C.GetUmsCompletionListEvent(ums_completion_list, ums_completion_event)
  end

  def executeUmsThread(ums_thread : Void*) : Win32cr::Foundation::BOOL
    C.ExecuteUmsThread(ums_thread)
  end

  def umsThreadYield(scheduler_param : Void*) : Win32cr::Foundation::BOOL
    C.UmsThreadYield(scheduler_param)
  end

  def deleteUmsCompletionList(ums_completion_list : Void*) : Win32cr::Foundation::BOOL
    C.DeleteUmsCompletionList(ums_completion_list)
  end

  def getCurrentUmsThread : Void*
    C.GetCurrentUmsThread
  end

  def getNextUmsListItem(ums_context : Void*) : Void*
    C.GetNextUmsListItem(ums_context)
  end

  def queryUmsThreadInformation(ums_thread : Void*, ums_thread_info_class : Win32cr::System::Threading::RTL_UMS_THREAD_INFO_CLASS, ums_thread_information : Void*, ums_thread_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL
    C.QueryUmsThreadInformation(ums_thread, ums_thread_info_class, ums_thread_information, ums_thread_information_length, return_length)
  end

  def setUmsThreadInformation(ums_thread : Void*, ums_thread_info_class : Win32cr::System::Threading::RTL_UMS_THREAD_INFO_CLASS, ums_thread_information : Void*, ums_thread_information_length : UInt32) : Win32cr::Foundation::BOOL
    C.SetUmsThreadInformation(ums_thread, ums_thread_info_class, ums_thread_information, ums_thread_information_length)
  end

  def deleteUmsThreadContext(ums_thread : Void*) : Win32cr::Foundation::BOOL
    C.DeleteUmsThreadContext(ums_thread)
  end

  def createUmsThreadContext(lpUmsThread : Void**) : Win32cr::Foundation::BOOL
    C.CreateUmsThreadContext(lpUmsThread)
  end

  def enterUmsSchedulingMode(scheduler_startup_info : Win32cr::System::Threading::UMS_SCHEDULER_STARTUP_INFO*) : Win32cr::Foundation::BOOL
    C.EnterUmsSchedulingMode(scheduler_startup_info)
  end

  def getUmsSystemThreadInformation(thread_handle : Win32cr::Foundation::HANDLE, system_thread_info : Win32cr::System::Threading::UMS_SYSTEM_THREAD_INFORMATION*) : Win32cr::Foundation::BOOL
    C.GetUmsSystemThreadInformation(thread_handle, system_thread_info)
  end

  def setThreadAffinityMask(hThread : Win32cr::Foundation::HANDLE, dwThreadAffinityMask : LibC::UIntPtrT) : LibC::UIntPtrT
    C.SetThreadAffinityMask(hThread, dwThreadAffinityMask)
  end

  def setProcessDEPPolicy(dwFlags : Win32cr::System::Threading::PROCESS_DEP_FLAGS) : Win32cr::Foundation::BOOL
    C.SetProcessDEPPolicy(dwFlags)
  end

  def getProcessDEPPolicy(hProcess : Win32cr::Foundation::HANDLE, lpFlags : UInt32*, lpPermanent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetProcessDEPPolicy(hProcess, lpFlags, lpPermanent)
  end

  def pulseEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.PulseEvent(hEvent)
  end

  def winExec(lpCmdLine : Win32cr::Foundation::PSTR, uCmdShow : UInt32) : UInt32
    C.WinExec(lpCmdLine, uCmdShow)
  end

  def createSemaphoreA(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.CreateSemaphoreA(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName)
  end

  def createSemaphoreExA(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateSemaphoreExA(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName, dwFlags, dwDesiredAccess)
  end

  def queryFullProcessImageNameA(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_NAME_FORMAT, lpExeName : UInt8*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.QueryFullProcessImageNameA(hProcess, dwFlags, lpExeName, lpdwSize)
  end

  def queryFullProcessImageNameW(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_NAME_FORMAT, lpExeName : UInt16*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL
    C.QueryFullProcessImageNameW(hProcess, dwFlags, lpExeName, lpdwSize)
  end

  def getStartupInfoA(lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*) : Void
    C.GetStartupInfoA(lpStartupInfo)
  end

  def createProcessWithLogonW(lpUsername : Win32cr::Foundation::PWSTR, lpDomain : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, dwLogonFlags : Win32cr::System::Threading::CREATE_PROCESS_LOGON_FLAGS, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL
    C.CreateProcessWithLogonW(lpUsername, lpDomain, lpPassword, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
  end

  def createProcessWithTokenW(hToken : Win32cr::Foundation::HANDLE, dwLogonFlags : Win32cr::System::Threading::CREATE_PROCESS_LOGON_FLAGS, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL
    C.CreateProcessWithTokenW(hToken, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
  end

  def registerWaitForSingleObject(phNewWaitObject : Win32cr::Foundation::HANDLE*, hObject : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, context : Void*, dwMilliseconds : UInt32, dwFlags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL
    C.RegisterWaitForSingleObject(phNewWaitObject, hObject, callback, context, dwMilliseconds, dwFlags)
  end

  def unregisterWait(wait_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.UnregisterWait(wait_handle)
  end

  def setTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, prefer_io : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE
    C.SetTimerQueueTimer(timer_queue, callback, parameter, due_time, period, prefer_io)
  end

  def createPrivateNamespaceA(lpPrivateNamespaceAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PSTR) : Win32cr::System::Threading::NamespaceHandle
    C.CreatePrivateNamespaceA(lpPrivateNamespaceAttributes, lpBoundaryDescriptor, lpAliasPrefix)
  end

  def openPrivateNamespaceA(lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PSTR) : Win32cr::System::Threading::NamespaceHandle
    C.OpenPrivateNamespaceA(lpBoundaryDescriptor, lpAliasPrefix)
  end

  def createBoundaryDescriptorA(name : Win32cr::Foundation::PSTR, flags : UInt32) : Win32cr::System::Threading::BoundaryDescriptorHandle
    C.CreateBoundaryDescriptorA(name, flags)
  end

  def addIntegrityLabelToBoundaryDescriptor(boundary_descriptor : Win32cr::Foundation::HANDLE*, integrity_label : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL
    C.AddIntegrityLabelToBoundaryDescriptor(boundary_descriptor, integrity_label)
  end

  def getActiveProcessorGroupCount : UInt16
    C.GetActiveProcessorGroupCount
  end

  def getMaximumProcessorGroupCount : UInt16
    C.GetMaximumProcessorGroupCount
  end

  def getActiveProcessorCount(group_number : UInt16) : UInt32
    C.GetActiveProcessorCount(group_number)
  end

  def getMaximumProcessorCount(group_number : UInt16) : UInt32
    C.GetMaximumProcessorCount(group_number)
  end

  def getNumaProcessorNode(processor : UInt8, node_number : UInt8*) : Win32cr::Foundation::BOOL
    C.GetNumaProcessorNode(processor, node_number)
  end

  def getNumaNodeNumberFromHandle(hFile : Win32cr::Foundation::HANDLE, node_number : UInt16*) : Win32cr::Foundation::BOOL
    C.GetNumaNodeNumberFromHandle(hFile, node_number)
  end

  def getNumaProcessorNodeEx(processor : Win32cr::System::Kernel::PROCESSOR_NUMBER*, node_number : UInt16*) : Win32cr::Foundation::BOOL
    C.GetNumaProcessorNodeEx(processor, node_number)
  end

  def getNumaNodeProcessorMask(node : UInt8, processor_mask : UInt64*) : Win32cr::Foundation::BOOL
    C.GetNumaNodeProcessorMask(node, processor_mask)
  end

  def getNumaAvailableMemoryNode(node : UInt8, available_bytes : UInt64*) : Win32cr::Foundation::BOOL
    C.GetNumaAvailableMemoryNode(node, available_bytes)
  end

  def getNumaAvailableMemoryNodeEx(node : UInt16, available_bytes : UInt64*) : Win32cr::Foundation::BOOL
    C.GetNumaAvailableMemoryNodeEx(node, available_bytes)
  end

  def getNumaProximityNode(proximity_id : UInt32, node_number : UInt8*) : Win32cr::Foundation::BOOL
    C.GetNumaProximityNode(proximity_id, node_number)
  end

  def ntQueryInformationProcess(process_handle : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESSINFOCLASS, process_information : Void*, process_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.NtQueryInformationProcess(process_handle, process_information_class, process_information, process_information_length, return_length)
  end

  def ntQueryInformationThread(thread_handle : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREADINFOCLASS, thread_information : Void*, thread_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS
    C.NtQueryInformationThread(thread_handle, thread_information_class, thread_information, thread_information_length, return_length)
  end

  def ntSetInformationThread(thread_handle : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREADINFOCLASS, thread_information : Void*, thread_information_length : UInt32) : Win32cr::Foundation::NTSTATUS
    C.NtSetInformationThread(thread_handle, thread_information_class, thread_information, thread_information_length)
  end

  @[Link("kernel32")]
  @[Link("vertdll")]
  @[Link("advapi32")]
  @[Link("avrt")]
  @[Link("user32")]
  @[Link("ntdll")]
  lib C
    # :nodoc:
    fun GetProcessWorkingSetSize(hProcess : Win32cr::Foundation::HANDLE, lpMinimumWorkingSetSize : LibC::UIntPtrT*, lpMaximumWorkingSetSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessWorkingSetSize(hProcess : Win32cr::Foundation::HANDLE, dwMinimumWorkingSetSize : LibC::UIntPtrT, dwMaximumWorkingSetSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FlsAlloc(lpCallback : Win32cr::System::Threading::PFLS_CALLBACK_FUNCTION) : UInt32

    # :nodoc:
    fun FlsGetValue(dwFlsIndex : UInt32) : Void*

    # :nodoc:
    fun FlsSetValue(dwFlsIndex : UInt32, lpFlsData : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FlsFree(dwFlsIndex : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsThreadAFiber : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeSRWLock(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    # :nodoc:
    fun ReleaseSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    # :nodoc:
    fun ReleaseSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    # :nodoc:
    fun AcquireSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    # :nodoc:
    fun AcquireSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Void

    # :nodoc:
    fun TryAcquireSRWLockExclusive(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun TryAcquireSRWLockShared(srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun InitializeCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun EnterCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun LeaveCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun InitializeCriticalSectionAndSpinCount(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeCriticalSectionEx(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetCriticalSectionSpinCount(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwSpinCount : UInt32) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun TryEnterCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun DeleteCriticalSection(lpCriticalSection : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # :nodoc:
    fun InitOnceInitialize(init_once : Win32cr::System::Threading::RTL_RUN_ONCE*) : Void

    # :nodoc:
    fun InitOnceExecuteOnce(init_once : Win32cr::System::Threading::RTL_RUN_ONCE*, init_fn : Win32cr::System::Threading::PINIT_ONCE_FN, parameter : Void*, context : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitOnceBeginInitialize(lpInitOnce : Win32cr::System::Threading::RTL_RUN_ONCE*, dwFlags : UInt32, fPending : Win32cr::Foundation::BOOL*, lpContext : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitOnceComplete(lpInitOnce : Win32cr::System::Threading::RTL_RUN_ONCE*, dwFlags : UInt32, lpContext : Void*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun InitializeConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun WakeConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun WakeAllConditionVariable(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SleepConditionVariableCS(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*, critical_section : Win32cr::System::Threading::RTL_CRITICAL_SECTION*, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SleepConditionVariableSRW(condition_variable : Win32cr::System::Threading::RTL_CONDITION_VARIABLE*, srw_lock : Win32cr::System::Threading::RTL_SRWLOCK*, dwMilliseconds : UInt32, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ResetEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReleaseSemaphore(hSemaphore : Win32cr::Foundation::HANDLE, lReleaseCount : Int32, lpPreviousCount : Int32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ReleaseMutex(hMutex : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun WaitForSingleObject(hHandle : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32) : UInt32

    # :nodoc:
    fun SleepEx(dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun WaitForSingleObjectEx(hHandle : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun WaitForMultipleObjectsEx(nCount : UInt32, lpHandles : Win32cr::Foundation::HANDLE*, bWaitAll : Win32cr::Foundation::BOOL, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun CreateMutexA(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInitialOwner : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateMutexW(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInitialOwner : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenMutexW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateEventA(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, bInitialState : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateEventW(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, bInitialState : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenEventA(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenEventW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenSemaphoreW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenWaitableTimerW(dwDesiredAccess : Win32cr::System::Threading::SYNCHRONIZATION_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetWaitableTimerEx(hTimer : Win32cr::Foundation::HANDLE, lpDueTime : Win32cr::Foundation::LARGE_INTEGER*, lPeriod : Int32, pfnCompletionRoutine : Win32cr::System::Threading::PTIMERAPCROUTINE, lpArgToCompletionRoutine : Void*, wake_context : Win32cr::System::Threading::REASON_CONTEXT*, tolerable_delay : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetWaitableTimer(hTimer : Win32cr::Foundation::HANDLE, lpDueTime : Win32cr::Foundation::LARGE_INTEGER*, lPeriod : Int32, pfnCompletionRoutine : Win32cr::System::Threading::PTIMERAPCROUTINE, lpArgToCompletionRoutine : Void*, fResume : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CancelWaitableTimer(hTimer : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateMutexExA(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateMutexExW(lpMutexAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateEventExA(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PSTR, dwFlags : Win32cr::System::Threading::CREATE_EVENT, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateEventExW(lpEventAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpName : Win32cr::Foundation::PWSTR, dwFlags : Win32cr::System::Threading::CREATE_EVENT, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateSemaphoreExW(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CreateWaitableTimerExW(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpTimerName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun EnterSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*, lTotalThreads : Int32, lSpinCount : Int32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteSynchronizationBarrier(lpBarrier : Win32cr::System::Threading::RTL_BARRIER*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun Sleep(dwMilliseconds : UInt32) : Void

    # :nodoc:
    fun WaitOnAddress(address : Void*, compare_address : Void*, address_size : LibC::UIntPtrT, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WakeByAddressSingle(address : Void*) : Void

    # :nodoc:
    fun WakeByAddressAll(address : Void*) : Void

    # :nodoc:
    fun WaitForMultipleObjects(nCount : UInt32, lpHandles : Win32cr::Foundation::HANDLE*, bWaitAll : Win32cr::Foundation::BOOL, dwMilliseconds : UInt32) : UInt32

    # :nodoc:
    fun CreateSemaphoreW(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateWaitableTimerW(lpTimerAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bManualReset : Win32cr::Foundation::BOOL, lpTimerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun InitializeSListHead(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Void

    # :nodoc:
    fun InterlockedPopEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun InterlockedPushEntrySList(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list_entry : Win32cr::System::Kernel::SLIST_ENTRY*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun InterlockedPushListSListEx(list_head : Win32cr::System::Kernel::SLIST_HEADER*, list : Win32cr::System::Kernel::SLIST_ENTRY*, list_end : Win32cr::System::Kernel::SLIST_ENTRY*, count : UInt32) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun InterlockedFlushSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : Win32cr::System::Kernel::SLIST_ENTRY*

    # :nodoc:
    fun QueryDepthSList(list_head : Win32cr::System::Kernel::SLIST_HEADER*) : UInt16

    # Commented out due to being part of LibC
    # :nodoc:
    #fun QueueUserAPC(pfnAPC : Win32cr::Foundation::PAPCFUNC, hThread : Win32cr::Foundation::HANDLE, dwData : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun QueueUserAPC2(apc_routine : Win32cr::Foundation::PAPCFUNC, thread : Win32cr::Foundation::HANDLE, data : LibC::UIntPtrT, flags : Win32cr::System::Threading::QUEUE_USER_APC_FLAGS) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetProcessTimes(hProcess : Win32cr::Foundation::HANDLE, lpCreationTime : Win32cr::Foundation::FILETIME*, lpExitTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetCurrentProcess : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetCurrentProcessId : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun ExitProcess(uExitCode : UInt32) : Void

    # Commented out due to being part of LibC
    # :nodoc:
    #fun TerminateProcess(hProcess : Win32cr::Foundation::HANDLE, uExitCode : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetExitCodeProcess(hProcess : Win32cr::Foundation::HANDLE, lpExitCode : UInt32*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SwitchToThread : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateThread(lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : Win32cr::System::Threading::THREAD_CREATION_FLAGS, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateRemoteThread(hProcess : Win32cr::Foundation::HANDLE, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : UInt32, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetCurrentThread : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetCurrentThreadId : UInt32

    # :nodoc:
    fun OpenThread(dwDesiredAccess : Win32cr::System::Threading::THREAD_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, dwThreadId : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetThreadPriority(hThread : Win32cr::Foundation::HANDLE, nPriority : Win32cr::System::Threading::THREAD_PRIORITY) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadPriorityBoost(hThread : Win32cr::Foundation::HANDLE, bDisablePriorityBoost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadPriorityBoost(hThread : Win32cr::Foundation::HANDLE, pDisablePriorityBoost : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadPriority(hThread : Win32cr::Foundation::HANDLE) : Int32

    # :nodoc:
    fun ExitThread(dwExitCode : UInt32) : Void

    # :nodoc:
    fun TerminateThread(hThread : Win32cr::Foundation::HANDLE, dwExitCode : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetExitCodeThread(hThread : Win32cr::Foundation::HANDLE, lpExitCode : UInt32*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SuspendThread(hThread : Win32cr::Foundation::HANDLE) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun ResumeThread(hThread : Win32cr::Foundation::HANDLE) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun TlsAlloc : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun TlsGetValue(dwTlsIndex : UInt32) : Void*

    # Commented out due to being part of LibC
    # :nodoc:
    #fun TlsSetValue(dwTlsIndex : UInt32, lpTlsValue : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TlsFree(dwTlsIndex : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateProcessA(lpApplicationName : Win32cr::Foundation::PSTR, lpCommandLine : Win32cr::Foundation::PSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : Win32cr::System::Threading::PROCESS_CREATION_FLAGS, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CreateProcessW(lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : Win32cr::System::Threading::PROCESS_CREATION_FLAGS, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessShutdownParameters(dwLevel : UInt32, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessVersion(process_id : UInt32) : UInt32

    # :nodoc:
    fun GetStartupInfoW(lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*) : Void

    # :nodoc:
    fun CreateProcessAsUserW(hToken : Win32cr::Foundation::HANDLE, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadToken(thread : Win32cr::Foundation::HANDLE*, token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenProcessToken(process_handle : Win32cr::Foundation::HANDLE, desired_access : Win32cr::Security::TOKEN_ACCESS_MASK, token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenThreadToken(thread_handle : Win32cr::Foundation::HANDLE, desired_access : Win32cr::Security::TOKEN_ACCESS_MASK, open_as_self : Win32cr::Foundation::BOOL, token_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetPriorityClass(hProcess : Win32cr::Foundation::HANDLE, dwPriorityClass : Win32cr::System::Threading::PROCESS_CREATION_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetPriorityClass(hProcess : Win32cr::Foundation::HANDLE) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetThreadStackGuarantee(stack_size_in_bytes : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessId(process : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun GetThreadId(thread : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun FlushProcessWriteBuffers : Void

    # :nodoc:
    fun GetProcessIdOfThread(thread : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun InitializeProcThreadAttributeList(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, dwAttributeCount : UInt32, dwFlags : UInt32, lpSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteProcThreadAttributeList(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST) : Void

    # :nodoc:
    fun UpdateProcThreadAttribute(lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, dwFlags : UInt32, attribute : LibC::UIntPtrT, lpValue : Void*, cbSize : LibC::UIntPtrT, lpPreviousValue : Void*, lpReturnSize : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessDynamicEHContinuationTargets(process : Win32cr::Foundation::HANDLE, number_of_targets : UInt16, targets : Win32cr::System::Threading::PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessDynamicEnforcedCetCompatibleRanges(process : Win32cr::Foundation::HANDLE, number_of_ranges : UInt16, ranges : Win32cr::System::Threading::PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessAffinityUpdateMode(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_AFFINITY_AUTO_UPDATE_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryProcessAffinityUpdateMode(hProcess : Win32cr::Foundation::HANDLE, lpdwFlags : Win32cr::System::Threading::PROCESS_AFFINITY_AUTO_UPDATE_FLAGS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateRemoteThreadEx(hProcess : Win32cr::Foundation::HANDLE, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, lpParameter : Void*, dwCreationFlags : UInt32, lpAttributeList : Win32cr::System::Threading::LPPROC_THREAD_ATTRIBUTE_LIST, lpThreadId : UInt32*) : Win32cr::Foundation::HANDLE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetCurrentThreadStackLimits(low_limit : LibC::UIntPtrT*, high_limit : LibC::UIntPtrT*) : Void

    # :nodoc:
    fun GetProcessMitigationPolicy(hProcess : Win32cr::Foundation::HANDLE, mitigation_policy : Win32cr::System::Threading::PROCESS_MITIGATION_POLICY, lpBuffer : Void*, dwLength : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessMitigationPolicy(mitigation_policy : Win32cr::System::Threading::PROCESS_MITIGATION_POLICY, lpBuffer : Void*, dwLength : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadTimes(hThread : Win32cr::Foundation::HANDLE, lpCreationTime : Win32cr::Foundation::FILETIME*, lpExitTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun OpenProcess(dwDesiredAccess : Win32cr::System::Threading::PROCESS_ACCESS_RIGHTS, bInheritHandle : Win32cr::Foundation::BOOL, dwProcessId : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun IsProcessorFeaturePresent(processor_feature : Win32cr::System::Threading::PROCESSOR_FEATURE_ID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessHandleCount(hProcess : Win32cr::Foundation::HANDLE, pdwHandleCount : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentProcessorNumber : UInt32

    # :nodoc:
    fun SetThreadIdealProcessorEx(hThread : Win32cr::Foundation::HANDLE, lpIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*, lpPreviousIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadIdealProcessorEx(hThread : Win32cr::Foundation::HANDLE, lpIdealProcessor : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentProcessorNumberEx(proc_number : Win32cr::System::Kernel::PROCESSOR_NUMBER*) : Void

    # :nodoc:
    fun GetProcessPriorityBoost(hProcess : Win32cr::Foundation::HANDLE, pDisablePriorityBoost : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessPriorityBoost(hProcess : Win32cr::Foundation::HANDLE, bDisablePriorityBoost : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadIOPendingFlag(hThread : Win32cr::Foundation::HANDLE, lpIOIsPending : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSystemTimes(lpIdleTime : Win32cr::Foundation::FILETIME*, lpKernelTime : Win32cr::Foundation::FILETIME*, lpUserTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadInformation(hThread : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREAD_INFORMATION_CLASS, thread_information : Void*, thread_information_size : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadInformation(hThread : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREAD_INFORMATION_CLASS, thread_information : Void*, thread_information_size : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsProcessCritical(hProcess : Win32cr::Foundation::HANDLE, critical : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProtectedPolicy(policy_guid : LibC::GUID*, policy_value : LibC::UIntPtrT, old_policy_value : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryProtectedPolicy(policy_guid : LibC::GUID*, policy_value : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadIdealProcessor(hThread : Win32cr::Foundation::HANDLE, dwIdealProcessor : UInt32) : UInt32

    # :nodoc:
    fun SetProcessInformation(hProcess : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESS_INFORMATION_CLASS, process_information : Void*, process_information_size : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessInformation(hProcess : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESS_INFORMATION_CLASS, process_information : Void*, process_information_size : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessDefaultCpuSets(process : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32, required_id_count : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessDefaultCpuSets(process : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadSelectedCpuSets(thread : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32, required_id_count : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadSelectedCpuSets(thread : Win32cr::Foundation::HANDLE, cpu_set_ids : UInt32*, cpu_set_id_count : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateProcessAsUserA(hToken : Win32cr::Foundation::HANDLE, lpApplicationName : Win32cr::Foundation::PSTR, lpCommandLine : Win32cr::Foundation::PSTR, lpProcessAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpThreadAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, bInheritHandles : Win32cr::Foundation::BOOL, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessShutdownParameters(lpdwLevel : UInt32*, lpdwFlags : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessDefaultCpuSetMasks(process : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessDefaultCpuSetMasks(process : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadSelectedCpuSetMasks(thread : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadSelectedCpuSetMasks(thread : Win32cr::Foundation::HANDLE, cpu_set_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, cpu_set_mask_count : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetMachineTypeAttributes(machine : UInt16, machine_type_attributes : Win32cr::System::Threading::MACHINE_ATTRIBUTES*) : Win32cr::Foundation::HRESULT

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetThreadDescription(hThread : Win32cr::Foundation::HANDLE, lpThreadDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetThreadDescription(hThread : Win32cr::Foundation::HANDLE, ppszThreadDescription : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun QueueUserWorkItem(function : Win32cr::System::Threading::LPTHREAD_START_ROUTINE, context : Void*, flags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterWaitEx(wait_handle : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateTimerQueue : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateTimerQueueTimer(phNewTimer : Win32cr::Foundation::HANDLE*, timer_queue : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, flags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ChangeTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE, due_time : UInt32, period : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, timer : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteTimerQueue(timer_queue : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteTimerQueueEx(timer_queue : Win32cr::Foundation::HANDLE, completion_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateThreadpool(reserved : Void*) : Win32cr::System::Threading::PTP_POOL

    # :nodoc:
    fun SetThreadpoolThreadMaximum(ptpp : Win32cr::System::Threading::PTP_POOL, cthrdMost : UInt32) : Void

    # :nodoc:
    fun SetThreadpoolThreadMinimum(ptpp : Win32cr::System::Threading::PTP_POOL, cthrdMic : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadpoolStackInformation(ptpp : Win32cr::System::Threading::PTP_POOL, ptpsi : Win32cr::System::Threading::TP_POOL_STACK_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryThreadpoolStackInformation(ptpp : Win32cr::System::Threading::PTP_POOL, ptpsi : Win32cr::System::Threading::TP_POOL_STACK_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CloseThreadpool(ptpp : Win32cr::System::Threading::PTP_POOL) : Void

    # :nodoc:
    fun CreateThreadpoolCleanupGroup : LibC::IntPtrT

    # :nodoc:
    fun CloseThreadpoolCleanupGroupMembers(ptpcg : LibC::IntPtrT, fCancelPendingCallbacks : Win32cr::Foundation::BOOL, pvCleanupContext : Void*) : Void

    # :nodoc:
    fun CloseThreadpoolCleanupGroup(ptpcg : LibC::IntPtrT) : Void

    # :nodoc:
    fun SetEventWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, evt : Win32cr::Foundation::HANDLE) : Void

    # :nodoc:
    fun ReleaseSemaphoreWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, sem : Win32cr::Foundation::HANDLE, crel : UInt32) : Void

    # :nodoc:
    fun ReleaseMutexWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, mut : Win32cr::Foundation::HANDLE) : Void

    # :nodoc:
    fun LeaveCriticalSectionWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, pcs : Win32cr::System::Threading::RTL_CRITICAL_SECTION*) : Void

    # :nodoc:
    fun FreeLibraryWhenCallbackReturns(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*, mod : Win32cr::Foundation::HINSTANCE) : Void

    # :nodoc:
    fun CallbackMayRunLong(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DisassociateCurrentThreadFromCallback(pci : Win32cr::System::Threading::TP_CALLBACK_INSTANCE*) : Void

    # :nodoc:
    fun TrySubmitThreadpoolCallback(pfns : Win32cr::System::Threading::PTP_SIMPLE_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateThreadpoolWork(pfnwk : Win32cr::System::Threading::PTP_WORK_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_WORK*

    # :nodoc:
    fun SubmitThreadpoolWork(pwk : Win32cr::System::Threading::TP_WORK*) : Void

    # :nodoc:
    fun WaitForThreadpoolWorkCallbacks(pwk : Win32cr::System::Threading::TP_WORK*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    # :nodoc:
    fun CloseThreadpoolWork(pwk : Win32cr::System::Threading::TP_WORK*) : Void

    # :nodoc:
    fun CreateThreadpoolTimer(pfnti : Win32cr::System::Threading::PTP_TIMER_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_TIMER*

    # :nodoc:
    fun SetThreadpoolTimer(pti : Win32cr::System::Threading::TP_TIMER*, pftDueTime : Win32cr::Foundation::FILETIME*, msPeriod : UInt32, msWindowLength : UInt32) : Void

    # :nodoc:
    fun IsThreadpoolTimerSet(pti : Win32cr::System::Threading::TP_TIMER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WaitForThreadpoolTimerCallbacks(pti : Win32cr::System::Threading::TP_TIMER*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    # :nodoc:
    fun CloseThreadpoolTimer(pti : Win32cr::System::Threading::TP_TIMER*) : Void

    # :nodoc:
    fun CreateThreadpoolWait(pfnwa : Win32cr::System::Threading::PTP_WAIT_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_WAIT*

    # :nodoc:
    fun SetThreadpoolWait(pwa : Win32cr::System::Threading::TP_WAIT*, h : Win32cr::Foundation::HANDLE, pftTimeout : Win32cr::Foundation::FILETIME*) : Void

    # :nodoc:
    fun WaitForThreadpoolWaitCallbacks(pwa : Win32cr::System::Threading::TP_WAIT*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    # :nodoc:
    fun CloseThreadpoolWait(pwa : Win32cr::System::Threading::TP_WAIT*) : Void

    # :nodoc:
    fun CreateThreadpoolIo(fl : Win32cr::Foundation::HANDLE, pfnio : Win32cr::System::Threading::PTP_WIN32_IO_CALLBACK, pv : Void*, pcbe : Win32cr::System::Threading::TP_CALLBACK_ENVIRON_V3*) : Win32cr::System::Threading::TP_IO*

    # :nodoc:
    fun StartThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void

    # :nodoc:
    fun CancelThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void

    # :nodoc:
    fun WaitForThreadpoolIoCallbacks(pio : Win32cr::System::Threading::TP_IO*, fCancelPendingCallbacks : Win32cr::Foundation::BOOL) : Void

    # :nodoc:
    fun CloseThreadpoolIo(pio : Win32cr::System::Threading::TP_IO*) : Void

    # :nodoc:
    fun SetThreadpoolTimerEx(pti : Win32cr::System::Threading::TP_TIMER*, pftDueTime : Win32cr::Foundation::FILETIME*, msPeriod : UInt32, msWindowLength : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadpoolWaitEx(pwa : Win32cr::System::Threading::TP_WAIT*, h : Win32cr::Foundation::HANDLE, pftTimeout : Win32cr::Foundation::FILETIME*, reserved : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsWow64Process(hProcess : Win32cr::Foundation::HANDLE, wow64_process : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun Wow64SetThreadDefaultGuestMachine(machine : UInt16) : UInt16

    # :nodoc:
    fun IsWow64Process2(hProcess : Win32cr::Foundation::HANDLE, pProcessMachine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE*, pNativeMachine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun Wow64SuspendThread(hThread : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun CreatePrivateNamespaceW(lpPrivateNamespaceAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PWSTR) : Win32cr::System::Threading::NamespaceHandle

    # :nodoc:
    fun OpenPrivateNamespaceW(lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PWSTR) : Win32cr::System::Threading::NamespaceHandle

    # :nodoc:
    fun ClosePrivateNamespace(handle : Win32cr::System::Threading::NamespaceHandle, flags : UInt32) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun CreateBoundaryDescriptorW(name : Win32cr::Foundation::PWSTR, flags : UInt32) : Win32cr::System::Threading::BoundaryDescriptorHandle

    # :nodoc:
    fun AddSIDToBoundaryDescriptor(boundary_descriptor : Win32cr::Foundation::HANDLE*, required_sid : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteBoundaryDescriptor(boundary_descriptor : Win32cr::System::Threading::BoundaryDescriptorHandle) : Void

    # :nodoc:
    fun GetNumaHighestNodeNumber(highest_node_number : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaNodeProcessorMaskEx(node : UInt16, processor_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaNodeProcessorMask2(node_number : UInt16, processor_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*, processor_mask_count : UInt16, required_mask_count : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaProximityNodeEx(proximity_id : UInt32, node_number : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessGroupAffinity(hProcess : Win32cr::Foundation::HANDLE, group_count : UInt16*, group_array : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetThreadGroupAffinity(hThread : Win32cr::Foundation::HANDLE, group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadGroupAffinity(hThread : Win32cr::Foundation::HANDLE, group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*, previous_group_affinity : Win32cr::System::SystemInformation::GROUP_AFFINITY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvSetMmThreadCharacteristicsA(task_name : Win32cr::Foundation::PSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun AvSetMmThreadCharacteristicsW(task_name : Win32cr::Foundation::PWSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun AvSetMmMaxThreadCharacteristicsA(first_task : Win32cr::Foundation::PSTR, second_task : Win32cr::Foundation::PSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun AvSetMmMaxThreadCharacteristicsW(first_task : Win32cr::Foundation::PWSTR, second_task : Win32cr::Foundation::PWSTR, task_index : UInt32*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun AvRevertMmThreadCharacteristics(avrt_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvSetMmThreadPriority(avrt_handle : Win32cr::Foundation::HANDLE, priority : Win32cr::System::Threading::AVRT_PRIORITY) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtCreateThreadOrderingGroup(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtCreateThreadOrderingGroupExA(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*, task_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtCreateThreadOrderingGroupExW(context : Win32cr::Foundation::HANDLE*, period : Win32cr::Foundation::LARGE_INTEGER*, thread_ordering_guid : LibC::GUID*, timeout : Win32cr::Foundation::LARGE_INTEGER*, task_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtJoinThreadOrderingGroup(context : Win32cr::Foundation::HANDLE*, thread_ordering_guid : LibC::GUID*, before : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtWaitOnThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtLeaveThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvRtDeleteThreadOrderingGroup(context : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AvQuerySystemResponsiveness(avrt_handle : Win32cr::Foundation::HANDLE, system_responsiveness_value : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AttachThreadInput(idAttach : UInt32, idAttachTo : UInt32, fAttach : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WaitForInputIdle(hProcess : Win32cr::Foundation::HANDLE, dwMilliseconds : UInt32) : UInt32

    # :nodoc:
    fun GetGuiResources(hProcess : Win32cr::Foundation::HANDLE, uiFlags : Win32cr::System::Threading::GET_GUI_RESOURCES_FLAGS) : UInt32

    # :nodoc:
    fun IsImmersiveProcess(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessRestrictionExemption(fEnableExemption : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessAffinityMask(hProcess : Win32cr::Foundation::HANDLE, lpProcessAffinityMask : LibC::UIntPtrT*, lpSystemAffinityMask : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessAffinityMask(hProcess : Win32cr::Foundation::HANDLE, dwProcessAffinityMask : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessIoCounters(hProcess : Win32cr::Foundation::HANDLE, lpIoCounters : Win32cr::System::Threading::IO_COUNTERS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SwitchToFiber(lpFiber : Void*) : Void

    # :nodoc:
    fun DeleteFiber(lpFiber : Void*) : Void

    # :nodoc:
    fun ConvertFiberToThread : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateFiberEx(dwStackCommitSize : LibC::UIntPtrT, dwStackReserveSize : LibC::UIntPtrT, dwFlags : UInt32, lpStartAddress : Win32cr::System::Threading::LPFIBER_START_ROUTINE, lpParameter : Void*) : Void*

    # :nodoc:
    fun ConvertThreadToFiberEx(lpParameter : Void*, dwFlags : UInt32) : Void*

    # :nodoc:
    fun CreateFiber(dwStackSize : LibC::UIntPtrT, lpStartAddress : Win32cr::System::Threading::LPFIBER_START_ROUTINE, lpParameter : Void*) : Void*

    # :nodoc:
    fun ConvertThreadToFiber(lpParameter : Void*) : Void*

    # :nodoc:
    fun CreateUmsCompletionList(ums_completion_list : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DequeueUmsCompletionListItems(ums_completion_list : Void*, wait_time_out : UInt32, ums_thread_list : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUmsCompletionListEvent(ums_completion_list : Void*, ums_completion_event : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ExecuteUmsThread(ums_thread : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UmsThreadYield(scheduler_param : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteUmsCompletionList(ums_completion_list : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentUmsThread : Void*

    # :nodoc:
    fun GetNextUmsListItem(ums_context : Void*) : Void*

    # :nodoc:
    fun QueryUmsThreadInformation(ums_thread : Void*, ums_thread_info_class : Win32cr::System::Threading::RTL_UMS_THREAD_INFO_CLASS, ums_thread_information : Void*, ums_thread_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetUmsThreadInformation(ums_thread : Void*, ums_thread_info_class : Win32cr::System::Threading::RTL_UMS_THREAD_INFO_CLASS, ums_thread_information : Void*, ums_thread_information_length : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteUmsThreadContext(ums_thread : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateUmsThreadContext(lpUmsThread : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnterUmsSchedulingMode(scheduler_startup_info : Win32cr::System::Threading::UMS_SCHEDULER_STARTUP_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetUmsSystemThreadInformation(thread_handle : Win32cr::Foundation::HANDLE, system_thread_info : Win32cr::System::Threading::UMS_SYSTEM_THREAD_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadAffinityMask(hThread : Win32cr::Foundation::HANDLE, dwThreadAffinityMask : LibC::UIntPtrT) : LibC::UIntPtrT

    # :nodoc:
    fun SetProcessDEPPolicy(dwFlags : Win32cr::System::Threading::PROCESS_DEP_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessDEPPolicy(hProcess : Win32cr::Foundation::HANDLE, lpFlags : UInt32*, lpPermanent : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PulseEvent(hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WinExec(lpCmdLine : Win32cr::Foundation::PSTR, uCmdShow : UInt32) : UInt32

    # :nodoc:
    fun CreateSemaphoreA(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateSemaphoreExA(lpSemaphoreAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lInitialCount : Int32, lMaximumCount : Int32, lpName : Win32cr::Foundation::PSTR, dwFlags : UInt32, dwDesiredAccess : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun QueryFullProcessImageNameA(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_NAME_FORMAT, lpExeName : UInt8*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun QueryFullProcessImageNameW(hProcess : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::Threading::PROCESS_NAME_FORMAT, lpExeName : UInt16*, lpdwSize : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetStartupInfoA(lpStartupInfo : Win32cr::System::Threading::STARTUPINFOA*) : Void

    # :nodoc:
    fun CreateProcessWithLogonW(lpUsername : Win32cr::Foundation::PWSTR, lpDomain : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, dwLogonFlags : Win32cr::System::Threading::CREATE_PROCESS_LOGON_FLAGS, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateProcessWithTokenW(hToken : Win32cr::Foundation::HANDLE, dwLogonFlags : Win32cr::System::Threading::CREATE_PROCESS_LOGON_FLAGS, lpApplicationName : Win32cr::Foundation::PWSTR, lpCommandLine : Win32cr::Foundation::PWSTR, dwCreationFlags : UInt32, lpEnvironment : Void*, lpCurrentDirectory : Win32cr::Foundation::PWSTR, lpStartupInfo : Win32cr::System::Threading::STARTUPINFOW*, lpProcessInformation : Win32cr::System::Threading::PROCESS_INFORMATION*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterWaitForSingleObject(phNewWaitObject : Win32cr::Foundation::HANDLE*, hObject : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, context : Void*, dwMilliseconds : UInt32, dwFlags : Win32cr::System::Threading::WORKER_THREAD_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnregisterWait(wait_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetTimerQueueTimer(timer_queue : Win32cr::Foundation::HANDLE, callback : Win32cr::System::Threading::WAITORTIMERCALLBACK, parameter : Void*, due_time : UInt32, period : UInt32, prefer_io : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreatePrivateNamespaceA(lpPrivateNamespaceAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PSTR) : Win32cr::System::Threading::NamespaceHandle

    # :nodoc:
    fun OpenPrivateNamespaceA(lpBoundaryDescriptor : Void*, lpAliasPrefix : Win32cr::Foundation::PSTR) : Win32cr::System::Threading::NamespaceHandle

    # :nodoc:
    fun CreateBoundaryDescriptorA(name : Win32cr::Foundation::PSTR, flags : UInt32) : Win32cr::System::Threading::BoundaryDescriptorHandle

    # :nodoc:
    fun AddIntegrityLabelToBoundaryDescriptor(boundary_descriptor : Win32cr::Foundation::HANDLE*, integrity_label : Win32cr::Foundation::PSID) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetActiveProcessorGroupCount : UInt16

    # :nodoc:
    fun GetMaximumProcessorGroupCount : UInt16

    # :nodoc:
    fun GetActiveProcessorCount(group_number : UInt16) : UInt32

    # :nodoc:
    fun GetMaximumProcessorCount(group_number : UInt16) : UInt32

    # :nodoc:
    fun GetNumaProcessorNode(processor : UInt8, node_number : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaNodeNumberFromHandle(hFile : Win32cr::Foundation::HANDLE, node_number : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaProcessorNodeEx(processor : Win32cr::System::Kernel::PROCESSOR_NUMBER*, node_number : UInt16*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaNodeProcessorMask(node : UInt8, processor_mask : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaAvailableMemoryNode(node : UInt8, available_bytes : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaAvailableMemoryNodeEx(node : UInt16, available_bytes : UInt64*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNumaProximityNode(proximity_id : UInt32, node_number : UInt8*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun NtQueryInformationProcess(process_handle : Win32cr::Foundation::HANDLE, process_information_class : Win32cr::System::Threading::PROCESSINFOCLASS, process_information : Void*, process_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtQueryInformationThread(thread_handle : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREADINFOCLASS, thread_information : Void*, thread_information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun NtSetInformationThread(thread_handle : Win32cr::Foundation::HANDLE, thread_information_class : Win32cr::System::Threading::THREADINFOCLASS, thread_information : Void*, thread_information_length : UInt32) : Win32cr::Foundation::NTSTATUS

  end
end