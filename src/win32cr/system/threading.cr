require "../foundation.cr"
require "../system/systemservices.cr"
require "../system/kernel.cr"
require "../security.cr"
require "../system/systeminformation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:vertdll.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:onecore.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("vertdll")]
@[Link("advapi32")]
@[Link("onecore")]
@[Link("user32")]
{% end %}
lib LibWin32
  alias TimerQueueHandle = LibC::IntPtrT
  alias PTP_POOL = LibC::IntPtrT
  alias NamespaceHandle = LibC::IntPtrT
  alias BoundaryDescriptorHandle = LibC::IntPtrT
  alias LPPROC_THREAD_ATTRIBUTE_LIST = Void*

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

  type TP_CALLBACK_INSTANCE = Void
  type TP_WORK = Void
  type TP_TIMER = Void
  type TP_WAIT = Void
  type TP_IO = Void
  type TP_CALLBACK_ENVIRON_V3_ACTIVATION_CONTEXT = Void

  alias LPTHREAD_START_ROUTINE = Proc(Void*, UInt32)
  alias PINIT_ONCE_FN = Proc(RTL_RUN_ONCE*, Void*, Void**, LibC::BOOL)
  alias PTIMERAPCROUTINE = Proc(Void*, UInt32, UInt32, Void)
  alias PTP_WIN32_IO_CALLBACK = Proc(TP_CALLBACK_INSTANCE*, Void*, Void*, UInt32, LibC::UINT_PTR, TP_IO*, Void)
  alias PRTL_UMS_SCHEDULER_ENTRY_POINT = Proc(RTL_UMS_SCHEDULER_REASON, LibC::UINT_PTR, Void*, Void)
  alias WAITORTIMERCALLBACK = Proc(Void*, BOOLEAN, Void)
  alias PFLS_CALLBACK_FUNCTION = Proc(Void*, Void)
  alias PTP_SIMPLE_CALLBACK = Proc(TP_CALLBACK_INSTANCE*, Void*, Void)
  alias PTP_CLEANUP_GROUP_CANCEL_CALLBACK = Proc(Void*, Void*, Void)
  alias PTP_WORK_CALLBACK = Proc(TP_CALLBACK_INSTANCE*, Void*, TP_WORK*, Void)
  alias PTP_TIMER_CALLBACK = Proc(TP_CALLBACK_INSTANCE*, Void*, TP_TIMER*, Void)
  alias PTP_WAIT_CALLBACK = Proc(TP_CALLBACK_INSTANCE*, Void*, TP_WAIT*, UInt32, Void)
  alias LPFIBER_START_ROUTINE = Proc(Void*, Void)
  alias PPS_POST_PROCESS_INIT_ROUTINE = Proc(Void)


  enum THREAD_CREATION_FLAGS : UInt32
    THREAD_CREATE_RUN_IMMEDIATELY = 0
    THREAD_CREATE_SUSPENDED = 4
    STACK_SIZE_PARAM_IS_A_RESERVATION = 65536
  end

  enum THREAD_PRIORITY : Int32
    THREAD_MODE_BACKGROUND_BEGIN = 65536
    THREAD_MODE_BACKGROUND_END = 131072
    THREAD_PRIORITY_ABOVE_NORMAL = 1
    THREAD_PRIORITY_BELOW_NORMAL = -1
    THREAD_PRIORITY_HIGHEST = 2
    THREAD_PRIORITY_IDLE = -15
    THREAD_PRIORITY_MIN = -2
    THREAD_PRIORITY_LOWEST = -2
    THREAD_PRIORITY_NORMAL = 0
    THREAD_PRIORITY_TIME_CRITICAL = 15
  end

  enum WORKER_THREAD_FLAGS : UInt32
    WT_EXECUTEDEFAULT = 0
    WT_EXECUTEINIOTHREAD = 1
    WT_EXECUTEINPERSISTENTTHREAD = 128
    WT_EXECUTEINWAITTHREAD = 4
    WT_EXECUTELONGFUNCTION = 16
    WT_EXECUTEONLYONCE = 8
    WT_TRANSFER_IMPERSONATION = 256
    WT_EXECUTEINTIMERTHREAD = 32
  end

  enum CREATE_EVENT : UInt32
    CREATE_EVENT_INITIAL_SET = 2
    CREATE_EVENT_MANUAL_RESET = 1
  end

  enum CREATE_PROCESS_LOGON_FLAGS : UInt32
    LOGON_WITH_PROFILE = 1
    LOGON_NETCREDENTIALS_ONLY = 2
  end

  enum PROCESS_AFFINITY_AUTO_UPDATE_FLAGS : UInt32
    PROCESS_AFFINITY_DISABLE_AUTO_UPDATE = 0
    PROCESS_AFFINITY_ENABLE_AUTO_UPDATE = 1
  end

  enum PROCESS_DEP_FLAGS : UInt32
    PROCESS_DEP_ENABLE = 1
    PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION = 2
    PROCESS_DEP_NONE = 0
  end

  enum PROCESS_NAME_FORMAT : UInt32
    PROCESS_NAME_WIN32 = 0
    PROCESS_NAME_NATIVE = 1
  end

  enum PROCESSOR_FEATURE_ID : UInt32
    PF_ARM_64BIT_LOADSTORE_ATOMIC = 25
    PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE = 24
    PF_ARM_EXTERNAL_CACHE_AVAILABLE = 26
    PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE = 27
    PF_ARM_VFP_32_REGISTERS_AVAILABLE = 18
    PF_3DNOW_INSTRUCTIONS_AVAILABLE = 7
    PF_CHANNELS_ENABLED = 16
    PF_COMPARE_EXCHANGE_DOUBLE = 2
    PF_COMPARE_EXCHANGE128 = 14
    PF_COMPARE64_EXCHANGE128 = 15
    PF_FASTFAIL_AVAILABLE = 23
    PF_FLOATING_POINT_EMULATED = 1
    PF_FLOATING_POINT_PRECISION_ERRATA = 0
    PF_MMX_INSTRUCTIONS_AVAILABLE = 3
    PF_NX_ENABLED = 12
    PF_PAE_ENABLED = 9
    PF_RDTSC_INSTRUCTION_AVAILABLE = 8
    PF_RDWRFSGSBASE_AVAILABLE = 22
    PF_SECOND_LEVEL_ADDRESS_TRANSLATION = 20
    PF_SSE3_INSTRUCTIONS_AVAILABLE = 13
    PF_VIRT_FIRMWARE_ENABLED = 21
    PF_XMMI_INSTRUCTIONS_AVAILABLE = 6
    PF_XMMI64_INSTRUCTIONS_AVAILABLE = 10
    PF_XSAVE_ENABLED = 17
    PF_ARM_V8_INSTRUCTIONS_AVAILABLE = 29
    PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE = 30
    PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE = 31
    PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE = 34
  end

  enum GET_GUI_RESOURCES_FLAGS : UInt32
    GR_GDIOBJECTS = 0
    GR_GDIOBJECTS_PEAK = 2
    GR_USEROBJECTS = 1
    GR_USEROBJECTS_PEAK = 4
  end

  enum STARTUPINFOW_FLAGS : UInt32
    STARTF_FORCEONFEEDBACK = 64
    STARTF_FORCEOFFFEEDBACK = 128
    STARTF_PREVENTPINNING = 8192
    STARTF_RUNFULLSCREEN = 32
    STARTF_TITLEISAPPID = 4096
    STARTF_TITLEISLINKNAME = 2048
    STARTF_UNTRUSTEDSOURCE = 32768
    STARTF_USECOUNTCHARS = 8
    STARTF_USEFILLATTRIBUTE = 16
    STARTF_USEHOTKEY = 512
    STARTF_USEPOSITION = 4
    STARTF_USESHOWWINDOW = 1
    STARTF_USESIZE = 2
    STARTF_USESTDHANDLES = 256
  end

  enum MEMORY_PRIORITY : UInt32
    MEMORY_PRIORITY_VERY_LOW = 1
    MEMORY_PRIORITY_LOW = 2
    MEMORY_PRIORITY_MEDIUM = 3
    MEMORY_PRIORITY_BELOW_NORMAL = 4
    MEMORY_PRIORITY_NORMAL = 5
  end

  enum PROCESS_PROTECTION_LEVEL : UInt32
    PROTECTION_LEVEL_WINTCB_LIGHT = 0
    PROTECTION_LEVEL_WINDOWS = 1
    PROTECTION_LEVEL_WINDOWS_LIGHT = 2
    PROTECTION_LEVEL_ANTIMALWARE_LIGHT = 3
    PROTECTION_LEVEL_LSA_LIGHT = 4
    PROTECTION_LEVEL_WINTCB = 5
    PROTECTION_LEVEL_CODEGEN_LIGHT = 6
    PROTECTION_LEVEL_AUTHENTICODE = 7
    PROTECTION_LEVEL_PPL_APP = 8
    PROTECTION_LEVEL_NONE = 4294967294
  end

  enum POWER_REQUEST_CONTEXT_FLAGS : UInt32
    POWER_REQUEST_CONTEXT_DETAILED_STRING = 2
    POWER_REQUEST_CONTEXT_SIMPLE_STRING = 1
  end

  enum THREAD_ACCESS_RIGHTS : UInt32
    THREAD_TERMINATE = 1
    THREAD_SUSPEND_RESUME = 2
    THREAD_GET_CONTEXT = 8
    THREAD_SET_CONTEXT = 16
    THREAD_SET_INFORMATION = 32
    THREAD_QUERY_INFORMATION = 64
    THREAD_SET_THREAD_TOKEN = 128
    THREAD_IMPERSONATE = 256
    THREAD_DIRECT_IMPERSONATION = 512
    THREAD_SET_LIMITED_INFORMATION = 1024
    THREAD_QUERY_LIMITED_INFORMATION = 2048
    THREAD_RESUME = 4096
    THREAD_ALL_ACCESS = 2097151
    THREAD_DELETE = 65536
    THREAD_READ_CONTROL = 131072
    THREAD_WRITE_DAC = 262144
    THREAD_WRITE_OWNER = 524288
    THREAD_SYNCHRONIZE = 1048576
    THREAD_STANDARD_RIGHTS_REQUIRED = 983040
  end

  enum PROCESS_CREATION_FLAGS : UInt32
    DEBUG_PROCESS = 1
    DEBUG_ONLY_THIS_PROCESS = 2
    CREATE_SUSPENDED = 4
    DETACHED_PROCESS = 8
    CREATE_NEW_CONSOLE = 16
    NORMAL_PRIORITY_CLASS = 32
    IDLE_PRIORITY_CLASS = 64
    HIGH_PRIORITY_CLASS = 128
    REALTIME_PRIORITY_CLASS = 256
    CREATE_NEW_PROCESS_GROUP = 512
    CREATE_UNICODE_ENVIRONMENT = 1024
    CREATE_SEPARATE_WOW_VDM = 2048
    CREATE_SHARED_WOW_VDM = 4096
    CREATE_FORCEDOS = 8192
    BELOW_NORMAL_PRIORITY_CLASS = 16384
    ABOVE_NORMAL_PRIORITY_CLASS = 32768
    INHERIT_PARENT_AFFINITY = 65536
    INHERIT_CALLER_PRIORITY = 131072
    CREATE_PROTECTED_PROCESS = 262144
    EXTENDED_STARTUPINFO_PRESENT = 524288
    PROCESS_MODE_BACKGROUND_BEGIN = 1048576
    PROCESS_MODE_BACKGROUND_END = 2097152
    CREATE_SECURE_PROCESS = 4194304
    CREATE_BREAKAWAY_FROM_JOB = 16777216
    CREATE_PRESERVE_CODE_AUTHZ_LEVEL = 33554432
    CREATE_DEFAULT_ERROR_MODE = 67108864
    CREATE_NO_WINDOW = 134217728
    PROFILE_USER = 268435456
    PROFILE_KERNEL = 536870912
    PROFILE_SERVER = 1073741824
    CREATE_IGNORE_SYSTEM_DEFAULT = 2147483648
  end

  enum PROCESS_ACCESS_RIGHTS : UInt32
    PROCESS_TERMINATE = 1
    PROCESS_CREATE_THREAD = 2
    PROCESS_SET_SESSIONID = 4
    PROCESS_VM_OPERATION = 8
    PROCESS_VM_READ = 16
    PROCESS_VM_WRITE = 32
    PROCESS_DUP_HANDLE = 64
    PROCESS_CREATE_PROCESS = 128
    PROCESS_SET_QUOTA = 256
    PROCESS_SET_INFORMATION = 512
    PROCESS_QUERY_INFORMATION = 1024
    PROCESS_SUSPEND_RESUME = 2048
    PROCESS_QUERY_LIMITED_INFORMATION = 4096
    PROCESS_SET_LIMITED_INFORMATION = 8192
    PROCESS_ALL_ACCESS = 2097151
    PROCESS_DELETE = 65536
    PROCESS_READ_CONTROL = 131072
    PROCESS_WRITE_DAC = 262144
    PROCESS_WRITE_OWNER = 524288
    PROCESS_SYNCHRONIZE = 1048576
    PROCESS_STANDARD_RIGHTS_REQUIRED = 983040
  end

  enum QUEUE_USER_APC_FLAGS : Int32
    QUEUE_USER_APC_FLAGS_NONE = 0
    QUEUE_USER_APC_FLAGS_SPECIAL_USER_APC = 1
  end

  enum THREAD_INFORMATION_CLASS : Int32
    ThreadMemoryPriority = 0
    ThreadAbsoluteCpuPriority = 1
    ThreadDynamicCodePolicy = 2
    ThreadPowerThrottling = 3
    ThreadInformationClassMax = 4
  end

  enum PROCESS_INFORMATION_CLASS : Int32
    ProcessMemoryPriority = 0
    ProcessMemoryExhaustionInfo = 1
    ProcessAppMemoryInfo = 2
    ProcessInPrivateInfo = 3
    ProcessPowerThrottling = 4
    ProcessReservedValue1 = 5
    ProcessTelemetryCoverageInfo = 6
    ProcessProtectionLevelInfo = 7
    ProcessLeapSecondInfo = 8
    ProcessMachineTypeInfo = 9
    ProcessInformationClassMax = 10
  end

  enum MACHINE_ATTRIBUTES : UInt32
    UserEnabled = 1
    KernelEnabled = 2
    Wow64Container = 4
  end

  enum PROCESS_MEMORY_EXHAUSTION_TYPE : Int32
    PMETypeFailFastOnCommitFailure = 0
    PMETypeMax = 1
  end

  enum PROCESS_MITIGATION_POLICY : Int32
    ProcessDEPPolicy = 0
    ProcessASLRPolicy = 1
    ProcessDynamicCodePolicy = 2
    ProcessStrictHandleCheckPolicy = 3
    ProcessSystemCallDisablePolicy = 4
    ProcessMitigationOptionsMask = 5
    ProcessExtensionPointDisablePolicy = 6
    ProcessControlFlowGuardPolicy = 7
    ProcessSignaturePolicy = 8
    ProcessFontDisablePolicy = 9
    ProcessImageLoadPolicy = 10
    ProcessSystemCallFilterPolicy = 11
    ProcessPayloadRestrictionPolicy = 12
    ProcessChildProcessPolicy = 13
    ProcessSideChannelIsolationPolicy = 14
    ProcessUserShadowStackPolicy = 15
    ProcessRedirectionTrustPolicy = 16
    MaxProcessMitigationPolicy = 17
  end

  enum RTL_UMS_THREAD_INFO_CLASS : Int32
    UmsThreadInvalidInfoClass = 0
    UmsThreadUserContext = 1
    UmsThreadPriority = 2
    UmsThreadAffinity = 3
    UmsThreadTeb = 4
    UmsThreadIsSuspended = 5
    UmsThreadIsTerminated = 6
    UmsThreadMaxInfoClass = 7
  end

  enum TP_CALLBACK_PRIORITY : Int32
    TP_CALLBACK_PRIORITY_HIGH = 0
    TP_CALLBACK_PRIORITY_NORMAL = 1
    TP_CALLBACK_PRIORITY_LOW = 2
    TP_CALLBACK_PRIORITY_INVALID = 3
    TP_CALLBACK_PRIORITY_COUNT = 3
  end

  enum PROCESSINFOCLASS : Int32
    ProcessBasicInformation = 0
    ProcessDebugPort = 7
    ProcessWow64Information = 26
    ProcessImageFileName = 27
    ProcessBreakOnTermination = 29
  end

  enum THREADINFOCLASS : Int32
    ThreadIsIoPending = 16
    ThreadNameInformation = 38
  end

  union REASON_CONTEXT_Reason_e__Union
    detailed : REASON_CONTEXT_Reason_e__Union_Detailed_e__Struct
    simple_reason_string : LibC::LPWSTR
  end
  union RTL_RUN_ONCE
    ptr : Void*
  end
  union TP_CALLBACK_ENVIRON_V3_u_e__Union
    flags : UInt32
    s : TP_CALLBACK_ENVIRON_V3_u_e__Union_s_e__Struct
  end
  union UMS_SYSTEM_THREAD_INFORMATION_Anonymous_e__Union
    anonymous : UMS_SYSTEM_THREAD_INFORMATION_Anonymous_e__Union_Anonymous_e__Struct
    thread_ums_flags : UInt32
  end

  struct REASON_CONTEXT
    version : UInt32
    flags : POWER_REQUEST_CONTEXT_FLAGS
    reason : REASON_CONTEXT_Reason_e__Union
  end
  struct REASON_CONTEXT_Reason_e__Union_Detailed_e__Struct
    localized_reason_module : HINSTANCE
    localized_reason_id : UInt32
    reason_string_count : UInt32
    reason_strings : LibC::LPWSTR*
  end
  struct PROCESS_INFORMATION
    h_process : LibC::HANDLE
    h_thread : LibC::HANDLE
    dw_process_id : UInt32
    dw_thread_id : UInt32
  end
  struct STARTUPINFOA
    cb : UInt32
    lp_reserved : PSTR
    lp_desktop : PSTR
    lp_title : PSTR
    dw_x : UInt32
    dw_y : UInt32
    dw_x_size : UInt32
    dw_y_size : UInt32
    dw_x_count_chars : UInt32
    dw_y_count_chars : UInt32
    dw_fill_attribute : UInt32
    dw_flags : STARTUPINFOW_FLAGS
    w_show_window : UInt16
    cb_reserved2 : UInt16
    lp_reserved2 : UInt8*
    h_std_input : LibC::HANDLE
    h_std_output : LibC::HANDLE
    h_std_error : LibC::HANDLE
  end
  struct STARTUPINFOW
    cb : UInt32
    lp_reserved : LibC::LPWSTR
    lp_desktop : LibC::LPWSTR
    lp_title : LibC::LPWSTR
    dw_x : UInt32
    dw_y : UInt32
    dw_x_size : UInt32
    dw_y_size : UInt32
    dw_x_count_chars : UInt32
    dw_y_count_chars : UInt32
    dw_fill_attribute : UInt32
    dw_flags : STARTUPINFOW_FLAGS
    w_show_window : UInt16
    cb_reserved2 : UInt16
    lp_reserved2 : UInt8*
    h_std_input : LibC::HANDLE
    h_std_output : LibC::HANDLE
    h_std_error : LibC::HANDLE
  end
  struct MEMORY_PRIORITY_INFORMATION
    memory_priority : MEMORY_PRIORITY
  end
  struct THREAD_POWER_THROTTLING_STATE
    version : UInt32
    control_mask : UInt32
    state_mask : UInt32
  end
  struct APP_MEMORY_INFORMATION
    available_commit : UInt64
    private_commit_usage : UInt64
    peak_private_commit_usage : UInt64
    total_commit_usage : UInt64
  end
  struct PROCESS_MACHINE_INFORMATION
    process_machine : UInt16
    res0 : UInt16
    machine_attributes : MACHINE_ATTRIBUTES
  end
  struct PROCESS_MEMORY_EXHAUSTION_INFO
    version : UInt16
    reserved : UInt16
    type : PROCESS_MEMORY_EXHAUSTION_TYPE
    value : LibC::UINT_PTR
  end
  struct PROCESS_POWER_THROTTLING_STATE
    version : UInt32
    control_mask : UInt32
    state_mask : UInt32
  end
  struct PROCESS_PROTECTION_LEVEL_INFORMATION
    protection_level : PROCESS_PROTECTION_LEVEL
  end
  struct PROCESS_LEAP_SECOND_INFO
    flags : UInt32
    reserved : UInt32
  end
  struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGET
    target_address : LibC::UINT_PTR
    flags : LibC::UINT_PTR
  end
  struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGETS_INFORMATION
    number_of_targets : UInt16
    reserved : UInt16
    reserved2 : UInt32
    targets : PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*
  end
  struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE
    base_address : LibC::UINT_PTR
    size : LibC::UINT_PTR
    flags : UInt32
  end
  struct PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGES_INFORMATION
    number_of_ranges : UInt16
    reserved : UInt16
    reserved2 : UInt32
    ranges : PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*
  end
  struct IO_COUNTERS
    read_operation_count : UInt64
    write_operation_count : UInt64
    other_operation_count : UInt64
    read_transfer_count : UInt64
    write_transfer_count : UInt64
    other_transfer_count : UInt64
  end
  struct RTL_BARRIER
    reserved1 : UInt32
    reserved2 : UInt32
    reserved3 : LibC::UINT_PTR[2]*
    reserved4 : UInt32
    reserved5 : UInt32
  end
  struct RTL_CRITICAL_SECTION_DEBUG
    type : UInt16
    creator_back_trace_index : UInt16
    critical_section : RTL_CRITICAL_SECTION*
    process_locks_list : LIST_ENTRY
    entry_count : UInt32
    contention_count : UInt32
    flags : UInt32
    creator_back_trace_index_high : UInt16
    spare_word : UInt16
  end
  struct RTL_CRITICAL_SECTION
    debug_info : RTL_CRITICAL_SECTION_DEBUG*
    lock_count : Int32
    recursion_count : Int32
    owning_thread : LibC::HANDLE
    lock_semaphore : LibC::HANDLE
    spin_count : LibC::UINT_PTR
  end
  struct RTL_SRWLOCK
    ptr : Void*
  end
  struct RTL_CONDITION_VARIABLE
    ptr : Void*
  end
  struct TP_POOL_STACK_INFORMATION
    stack_reserve : LibC::UINT_PTR
    stack_commit : LibC::UINT_PTR
  end
  struct TP_CALLBACK_ENVIRON_V3
    version : UInt32
    pool : PTP_POOL
    cleanup_group : LibC::IntPtrT
    cleanup_group_cancel_callback : PTP_CLEANUP_GROUP_CANCEL_CALLBACK
    race_dll : Void*
    activation_context : LibC::IntPtrT
    finalization_callback : PTP_SIMPLE_CALLBACK
    u : TP_CALLBACK_ENVIRON_V3_u_e__Union
    callback_priority : TP_CALLBACK_PRIORITY
    size : UInt32
  end
  struct TP_CALLBACK_ENVIRON_V3_u_e__Union_s_e__Struct
    _bitfield : UInt32
  end
  struct UMS_SCHEDULER_STARTUP_INFO
    ums_version : UInt32
    completion_list : Void*
    scheduler_proc : PRTL_UMS_SCHEDULER_ENTRY_POINT
    scheduler_param : Void*
  end
  struct UMS_SYSTEM_THREAD_INFORMATION
    ums_version : UInt32
    anonymous : UMS_SYSTEM_THREAD_INFORMATION_Anonymous_e__Union
  end
  struct UMS_SYSTEM_THREAD_INFORMATION_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct STARTUPINFOEXA
    startup_info : STARTUPINFOA
    lp_attribute_list : LPPROC_THREAD_ATTRIBUTE_LIST
  end
  struct STARTUPINFOEXW
    startup_info : STARTUPINFOW
    lp_attribute_list : LPPROC_THREAD_ATTRIBUTE_LIST
  end
  struct PEB_LDR_DATA
    reserved1 : UInt8[8]*
    reserved2 : Void[3]**
    in_memory_order_module_list : LIST_ENTRY
  end
  struct RTL_USER_PROCESS_PARAMETERS
    reserved1 : UInt8[16]*
    reserved2 : Void[10]**
    image_path_name : UNICODE_STRING
    command_line : UNICODE_STRING
  end
  struct PEB
    reserved1 : UInt8[2]*
    being_debugged : UInt8
    reserved2 : UInt8[0]*
    reserved3 : Void[2]**
    ldr : PEB_LDR_DATA*
    process_parameters : RTL_USER_PROCESS_PARAMETERS*
    reserved4 : Void[3]**
    atl_thunk_s_list_ptr : Void*
    reserved5 : Void*
    reserved6 : UInt32
    reserved7 : Void*
    reserved8 : UInt32
    atl_thunk_s_list_ptr32 : UInt32
    reserved9 : Void[45]**
    reserved10 : UInt8[96]*
    post_process_init_routine : PPS_POST_PROCESS_INIT_ROUTINE
    reserved11 : UInt8[128]*
    reserved12 : Void[0]**
    session_id : UInt32
  end
  struct PROCESS_BASIC_INFORMATION
    reserved1 : Void*
    peb_base_address : PEB*
    reserved2 : Void[2]**
    unique_process_id : LibC::UINT_PTR
    reserved3 : Void*
  end


  # Params # hprocess : LibC::HANDLE [In],lpminimumworkingsetsize : LibC::UINT_PTR* [In],lpmaximumworkingsetsize : LibC::UINT_PTR* [In]
  fun GetProcessWorkingSetSize(hprocess : LibC::HANDLE, lpminimumworkingsetsize : LibC::UINT_PTR*, lpmaximumworkingsetsize : LibC::UINT_PTR*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwminimumworkingsetsize : LibC::UINT_PTR [In],dwmaximumworkingsetsize : LibC::UINT_PTR [In]
  fun SetProcessWorkingSetSize(hprocess : LibC::HANDLE, dwminimumworkingsetsize : LibC::UINT_PTR, dwmaximumworkingsetsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # lpcallback : PFLS_CALLBACK_FUNCTION [In]
  fun FlsAlloc(lpcallback : PFLS_CALLBACK_FUNCTION) : UInt32

  # Params # dwflsindex : UInt32 [In]
  fun FlsGetValue(dwflsindex : UInt32) : Void*

  # Params # dwflsindex : UInt32 [In],lpflsdata : Void* [In]
  fun FlsSetValue(dwflsindex : UInt32, lpflsdata : Void*) : LibC::BOOL

  # Params # dwflsindex : UInt32 [In]
  fun FlsFree(dwflsindex : UInt32) : LibC::BOOL

  # Params # 
  fun IsThreadAFiber : LibC::BOOL

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun InitializeSRWLock(srwlock : RTL_SRWLOCK*)

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun ReleaseSRWLockExclusive(srwlock : RTL_SRWLOCK*)

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun ReleaseSRWLockShared(srwlock : RTL_SRWLOCK*)

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun AcquireSRWLockExclusive(srwlock : RTL_SRWLOCK*)

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun AcquireSRWLockShared(srwlock : RTL_SRWLOCK*)

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun TryAcquireSRWLockExclusive(srwlock : RTL_SRWLOCK*) : BOOLEAN

  # Params # srwlock : RTL_SRWLOCK* [In]
  fun TryAcquireSRWLockShared(srwlock : RTL_SRWLOCK*) : BOOLEAN

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In]
  fun InitializeCriticalSection(lpcriticalsection : RTL_CRITICAL_SECTION*)

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In]
  # Commented out because function is part of Lib C
  #fun EnterCriticalSection(lpcriticalsection : RTL_CRITICAL_SECTION*)

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In]
  # Commented out because function is part of Lib C
  #fun LeaveCriticalSection(lpcriticalsection : RTL_CRITICAL_SECTION*)

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In],dwspincount : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun InitializeCriticalSectionAndSpinCount(lpcriticalsection : RTL_CRITICAL_SECTION*, dwspincount : UInt32) : LibC::BOOL

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In],dwspincount : UInt32 [In],flags : UInt32 [In]
  fun InitializeCriticalSectionEx(lpcriticalsection : RTL_CRITICAL_SECTION*, dwspincount : UInt32, flags : UInt32) : LibC::BOOL

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In],dwspincount : UInt32 [In]
  fun SetCriticalSectionSpinCount(lpcriticalsection : RTL_CRITICAL_SECTION*, dwspincount : UInt32) : UInt32

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In]
  # Commented out because function is part of Lib C
  #fun TryEnterCriticalSection(lpcriticalsection : RTL_CRITICAL_SECTION*) : LibC::BOOL

  # Params # lpcriticalsection : RTL_CRITICAL_SECTION* [In]
  # Commented out because function is part of Lib C
  #fun DeleteCriticalSection(lpcriticalsection : RTL_CRITICAL_SECTION*)

  # Params # initonce : RTL_RUN_ONCE* [In]
  fun InitOnceInitialize(initonce : RTL_RUN_ONCE*)

  # Params # initonce : RTL_RUN_ONCE* [In],initfn : PINIT_ONCE_FN [In],parameter : Void* [In],context : Void** [In]
  fun InitOnceExecuteOnce(initonce : RTL_RUN_ONCE*, initfn : PINIT_ONCE_FN, parameter : Void*, context : Void**) : LibC::BOOL

  # Params # lpinitonce : RTL_RUN_ONCE* [In],dwflags : UInt32 [In],fpending : LibC::BOOL* [In],lpcontext : Void** [In]
  fun InitOnceBeginInitialize(lpinitonce : RTL_RUN_ONCE*, dwflags : UInt32, fpending : LibC::BOOL*, lpcontext : Void**) : LibC::BOOL

  # Params # lpinitonce : RTL_RUN_ONCE* [In],dwflags : UInt32 [In],lpcontext : Void* [In]
  fun InitOnceComplete(lpinitonce : RTL_RUN_ONCE*, dwflags : UInt32, lpcontext : Void*) : LibC::BOOL

  # Params # conditionvariable : RTL_CONDITION_VARIABLE* [In]
  # Commented out because function is part of Lib C
  #fun InitializeConditionVariable(conditionvariable : RTL_CONDITION_VARIABLE*)

  # Params # conditionvariable : RTL_CONDITION_VARIABLE* [In]
  # Commented out because function is part of Lib C
  #fun WakeConditionVariable(conditionvariable : RTL_CONDITION_VARIABLE*)

  # Params # conditionvariable : RTL_CONDITION_VARIABLE* [In]
  # Commented out because function is part of Lib C
  #fun WakeAllConditionVariable(conditionvariable : RTL_CONDITION_VARIABLE*)

  # Params # conditionvariable : RTL_CONDITION_VARIABLE* [In],criticalsection : RTL_CRITICAL_SECTION* [In],dwmilliseconds : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun SleepConditionVariableCS(conditionvariable : RTL_CONDITION_VARIABLE*, criticalsection : RTL_CRITICAL_SECTION*, dwmilliseconds : UInt32) : LibC::BOOL

  # Params # conditionvariable : RTL_CONDITION_VARIABLE* [In],srwlock : RTL_SRWLOCK* [In],dwmilliseconds : UInt32 [In],flags : UInt32 [In]
  fun SleepConditionVariableSRW(conditionvariable : RTL_CONDITION_VARIABLE*, srwlock : RTL_SRWLOCK*, dwmilliseconds : UInt32, flags : UInt32) : LibC::BOOL

  # Params # hevent : LibC::HANDLE [In]
  fun SetEvent(hevent : LibC::HANDLE) : LibC::BOOL

  # Params # hevent : LibC::HANDLE [In]
  fun ResetEvent(hevent : LibC::HANDLE) : LibC::BOOL

  # Params # hsemaphore : LibC::HANDLE [In],lreleasecount : Int32 [In],lppreviouscount : Int32* [In]
  fun ReleaseSemaphore(hsemaphore : LibC::HANDLE, lreleasecount : Int32, lppreviouscount : Int32*) : LibC::BOOL

  # Params # hmutex : LibC::HANDLE [In]
  fun ReleaseMutex(hmutex : LibC::HANDLE) : LibC::BOOL

  # Params # hhandle : LibC::HANDLE [In],dwmilliseconds : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun WaitForSingleObject(hhandle : LibC::HANDLE, dwmilliseconds : UInt32) : UInt32

  # Params # dwmilliseconds : UInt32 [In],balertable : LibC::BOOL [In]
  fun SleepEx(dwmilliseconds : UInt32, balertable : LibC::BOOL) : UInt32

  # Params # hhandle : LibC::HANDLE [In],dwmilliseconds : UInt32 [In],balertable : LibC::BOOL [In]
  fun WaitForSingleObjectEx(hhandle : LibC::HANDLE, dwmilliseconds : UInt32, balertable : LibC::BOOL) : UInt32

  # Params # ncount : UInt32 [In],lphandles : LibC::HANDLE* [In],bwaitall : LibC::BOOL [In],dwmilliseconds : UInt32 [In],balertable : LibC::BOOL [In]
  fun WaitForMultipleObjectsEx(ncount : UInt32, lphandles : LibC::HANDLE*, bwaitall : LibC::BOOL, dwmilliseconds : UInt32, balertable : LibC::BOOL) : UInt32

  # Params # lpmutexattributes : SECURITY_ATTRIBUTES* [In],binitialowner : LibC::BOOL [In],lpname : PSTR [In]
  fun CreateMutexA(lpmutexattributes : SECURITY_ATTRIBUTES*, binitialowner : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # lpmutexattributes : SECURITY_ATTRIBUTES* [In],binitialowner : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun CreateMutexW(lpmutexattributes : SECURITY_ATTRIBUTES*, binitialowner : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun OpenMutexW(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # lpeventattributes : SECURITY_ATTRIBUTES* [In],bmanualreset : LibC::BOOL [In],binitialstate : LibC::BOOL [In],lpname : PSTR [In]
  fun CreateEventA(lpeventattributes : SECURITY_ATTRIBUTES*, bmanualreset : LibC::BOOL, binitialstate : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # lpeventattributes : SECURITY_ATTRIBUTES* [In],bmanualreset : LibC::BOOL [In],binitialstate : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun CreateEventW(lpeventattributes : SECURITY_ATTRIBUTES*, bmanualreset : LibC::BOOL, binitialstate : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : PSTR [In]
  fun OpenEventA(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun OpenEventW(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun OpenSemaphoreW(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lptimername : LibC::LPWSTR [In]
  fun OpenWaitableTimerW(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lptimername : LibC::LPWSTR) : LibC::HANDLE

  # Params # htimer : LibC::HANDLE [In],lpduetime : LARGE_INTEGER* [In],lperiod : Int32 [In],pfncompletionroutine : PTIMERAPCROUTINE [In],lpargtocompletionroutine : Void* [In],wakecontext : REASON_CONTEXT* [In],tolerabledelay : UInt32 [In]
  fun SetWaitableTimerEx(htimer : LibC::HANDLE, lpduetime : LARGE_INTEGER*, lperiod : Int32, pfncompletionroutine : PTIMERAPCROUTINE, lpargtocompletionroutine : Void*, wakecontext : REASON_CONTEXT*, tolerabledelay : UInt32) : LibC::BOOL

  # Params # htimer : LibC::HANDLE [In],lpduetime : LARGE_INTEGER* [In],lperiod : Int32 [In],pfncompletionroutine : PTIMERAPCROUTINE [In],lpargtocompletionroutine : Void* [In],fresume : LibC::BOOL [In]
  fun SetWaitableTimer(htimer : LibC::HANDLE, lpduetime : LARGE_INTEGER*, lperiod : Int32, pfncompletionroutine : PTIMERAPCROUTINE, lpargtocompletionroutine : Void*, fresume : LibC::BOOL) : LibC::BOOL

  # Params # htimer : LibC::HANDLE [In]
  fun CancelWaitableTimer(htimer : LibC::HANDLE) : LibC::BOOL

  # Params # lpmutexattributes : SECURITY_ATTRIBUTES* [In],lpname : PSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In]
  fun CreateMutexExA(lpmutexattributes : SECURITY_ATTRIBUTES*, lpname : PSTR, dwflags : UInt32, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lpmutexattributes : SECURITY_ATTRIBUTES* [In],lpname : LibC::LPWSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In]
  fun CreateMutexExW(lpmutexattributes : SECURITY_ATTRIBUTES*, lpname : LibC::LPWSTR, dwflags : UInt32, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lpeventattributes : SECURITY_ATTRIBUTES* [In],lpname : PSTR [In],dwflags : CREATE_EVENT [In],dwdesiredaccess : UInt32 [In]
  fun CreateEventExA(lpeventattributes : SECURITY_ATTRIBUTES*, lpname : PSTR, dwflags : CREATE_EVENT, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lpeventattributes : SECURITY_ATTRIBUTES* [In],lpname : LibC::LPWSTR [In],dwflags : CREATE_EVENT [In],dwdesiredaccess : UInt32 [In]
  fun CreateEventExW(lpeventattributes : SECURITY_ATTRIBUTES*, lpname : LibC::LPWSTR, dwflags : CREATE_EVENT, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lpsemaphoreattributes : SECURITY_ATTRIBUTES* [In],linitialcount : Int32 [In],lmaximumcount : Int32 [In],lpname : LibC::LPWSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In]
  fun CreateSemaphoreExW(lpsemaphoreattributes : SECURITY_ATTRIBUTES*, linitialcount : Int32, lmaximumcount : Int32, lpname : LibC::LPWSTR, dwflags : UInt32, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lptimerattributes : SECURITY_ATTRIBUTES* [In],lptimername : LibC::LPWSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In]
  fun CreateWaitableTimerExW(lptimerattributes : SECURITY_ATTRIBUTES*, lptimername : LibC::LPWSTR, dwflags : UInt32, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # lpbarrier : RTL_BARRIER* [In],dwflags : UInt32 [In]
  fun EnterSynchronizationBarrier(lpbarrier : RTL_BARRIER*, dwflags : UInt32) : LibC::BOOL

  # Params # lpbarrier : RTL_BARRIER* [In],ltotalthreads : Int32 [In],lspincount : Int32 [In]
  fun InitializeSynchronizationBarrier(lpbarrier : RTL_BARRIER*, ltotalthreads : Int32, lspincount : Int32) : LibC::BOOL

  # Params # lpbarrier : RTL_BARRIER* [In]
  fun DeleteSynchronizationBarrier(lpbarrier : RTL_BARRIER*) : LibC::BOOL

  # Params # dwmilliseconds : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun Sleep(dwmilliseconds : UInt32)

  # Params # address : Void* [In],compareaddress : Void* [In],addresssize : LibC::UINT_PTR [In],dwmilliseconds : UInt32 [In]
  fun WaitOnAddress(address : Void*, compareaddress : Void*, addresssize : LibC::UINT_PTR, dwmilliseconds : UInt32) : LibC::BOOL

  # Params # address : Void* [In]
  fun WakeByAddressSingle(address : Void*)

  # Params # address : Void* [In]
  fun WakeByAddressAll(address : Void*)

  # Params # ncount : UInt32 [In],lphandles : LibC::HANDLE* [In],bwaitall : LibC::BOOL [In],dwmilliseconds : UInt32 [In]
  fun WaitForMultipleObjects(ncount : UInt32, lphandles : LibC::HANDLE*, bwaitall : LibC::BOOL, dwmilliseconds : UInt32) : UInt32

  # Params # lpsemaphoreattributes : SECURITY_ATTRIBUTES* [In],linitialcount : Int32 [In],lmaximumcount : Int32 [In],lpname : LibC::LPWSTR [In]
  fun CreateSemaphoreW(lpsemaphoreattributes : SECURITY_ATTRIBUTES*, linitialcount : Int32, lmaximumcount : Int32, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # lptimerattributes : SECURITY_ATTRIBUTES* [In],bmanualreset : LibC::BOOL [In],lptimername : LibC::LPWSTR [In]
  fun CreateWaitableTimerW(lptimerattributes : SECURITY_ATTRIBUTES*, bmanualreset : LibC::BOOL, lptimername : LibC::LPWSTR) : LibC::HANDLE

  # Params # listhead : SLIST_HEADER* [In]
  fun InitializeSListHead(listhead : SLIST_HEADER*)

  # Params # listhead : SLIST_HEADER* [In]
  fun InterlockedPopEntrySList(listhead : SLIST_HEADER*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In],listentry : SLIST_ENTRY* [In]
  fun InterlockedPushEntrySList(listhead : SLIST_HEADER*, listentry : SLIST_ENTRY*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In],list : SLIST_ENTRY* [In],listend : SLIST_ENTRY* [In],count : UInt32 [In]
  fun InterlockedPushListSListEx(listhead : SLIST_HEADER*, list : SLIST_ENTRY*, listend : SLIST_ENTRY*, count : UInt32) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In]
  fun InterlockedFlushSList(listhead : SLIST_HEADER*) : SLIST_ENTRY*

  # Params # listhead : SLIST_HEADER* [In]
  fun QueryDepthSList(listhead : SLIST_HEADER*) : UInt16

  # Params # pfnapc : PAPCFUNC [In],hthread : LibC::HANDLE [In],dwdata : LibC::UINT_PTR [In]
  fun QueueUserAPC(pfnapc : PAPCFUNC, hthread : LibC::HANDLE, dwdata : LibC::UINT_PTR) : UInt32

  # Params # apcroutine : PAPCFUNC [In],thread : LibC::HANDLE [In],data : LibC::UINT_PTR [In],flags : QUEUE_USER_APC_FLAGS [In]
  fun QueueUserAPC2(apcroutine : PAPCFUNC, thread : LibC::HANDLE, data : LibC::UINT_PTR, flags : QUEUE_USER_APC_FLAGS) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpcreationtime : FILETIME* [In],lpexittime : FILETIME* [In],lpkerneltime : FILETIME* [In],lpusertime : FILETIME* [In]
  # Commented out because function is part of Lib C
  #fun GetProcessTimes(hprocess : LibC::HANDLE, lpcreationtime : FILETIME*, lpexittime : FILETIME*, lpkerneltime : FILETIME*, lpusertime : FILETIME*) : LibC::BOOL

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetCurrentProcess : LibC::HANDLE

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetCurrentProcessId : UInt32

  # Params # uexitcode : UInt32 [In]
  fun ExitProcess(uexitcode : UInt32)

  # Params # hprocess : LibC::HANDLE [In],uexitcode : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun TerminateProcess(hprocess : LibC::HANDLE, uexitcode : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpexitcode : UInt32* [In]
  # Commented out because function is part of Lib C
  #fun GetExitCodeProcess(hprocess : LibC::HANDLE, lpexitcode : UInt32*) : LibC::BOOL

  # Params # 
  # Commented out because function is part of Lib C
  #fun SwitchToThread : LibC::BOOL

  # Params # lpthreadattributes : SECURITY_ATTRIBUTES* [In],dwstacksize : LibC::UINT_PTR [In],lpstartaddress : LPTHREAD_START_ROUTINE [In],lpparameter : Void* [In],dwcreationflags : THREAD_CREATION_FLAGS [In],lpthreadid : UInt32* [In]
  fun CreateThread(lpthreadattributes : SECURITY_ATTRIBUTES*, dwstacksize : LibC::UINT_PTR, lpstartaddress : LPTHREAD_START_ROUTINE, lpparameter : Void*, dwcreationflags : THREAD_CREATION_FLAGS, lpthreadid : UInt32*) : LibC::HANDLE

  # Params # hprocess : LibC::HANDLE [In],lpthreadattributes : SECURITY_ATTRIBUTES* [In],dwstacksize : LibC::UINT_PTR [In],lpstartaddress : LPTHREAD_START_ROUTINE [In],lpparameter : Void* [In],dwcreationflags : UInt32 [In],lpthreadid : UInt32* [In]
  fun CreateRemoteThread(hprocess : LibC::HANDLE, lpthreadattributes : SECURITY_ATTRIBUTES*, dwstacksize : LibC::UINT_PTR, lpstartaddress : LPTHREAD_START_ROUTINE, lpparameter : Void*, dwcreationflags : UInt32, lpthreadid : UInt32*) : LibC::HANDLE

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetCurrentThread : LibC::HANDLE

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetCurrentThreadId : UInt32

  # Params # dwdesiredaccess : THREAD_ACCESS_RIGHTS [In],binherithandle : LibC::BOOL [In],dwthreadid : UInt32 [In]
  fun OpenThread(dwdesiredaccess : THREAD_ACCESS_RIGHTS, binherithandle : LibC::BOOL, dwthreadid : UInt32) : LibC::HANDLE

  # Params # hthread : LibC::HANDLE [In],npriority : THREAD_PRIORITY [In]
  fun SetThreadPriority(hthread : LibC::HANDLE, npriority : THREAD_PRIORITY) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],bdisablepriorityboost : LibC::BOOL [In]
  fun SetThreadPriorityBoost(hthread : LibC::HANDLE, bdisablepriorityboost : LibC::BOOL) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],pdisablepriorityboost : LibC::BOOL* [In]
  fun GetThreadPriorityBoost(hthread : LibC::HANDLE, pdisablepriorityboost : LibC::BOOL*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In]
  fun GetThreadPriority(hthread : LibC::HANDLE) : Int32

  # Params # dwexitcode : UInt32 [In]
  fun ExitThread(dwexitcode : UInt32)

  # Params # hthread : LibC::HANDLE [In],dwexitcode : UInt32 [In]
  fun TerminateThread(hthread : LibC::HANDLE, dwexitcode : UInt32) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],lpexitcode : UInt32* [In]
  fun GetExitCodeThread(hthread : LibC::HANDLE, lpexitcode : UInt32*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In]
  fun SuspendThread(hthread : LibC::HANDLE) : UInt32

  # Params # hthread : LibC::HANDLE [In]
  fun ResumeThread(hthread : LibC::HANDLE) : UInt32

  # Params # 
  fun TlsAlloc : UInt32

  # Params # dwtlsindex : UInt32 [In]
  fun TlsGetValue(dwtlsindex : UInt32) : Void*

  # Params # dwtlsindex : UInt32 [In],lptlsvalue : Void* [In]
  fun TlsSetValue(dwtlsindex : UInt32, lptlsvalue : Void*) : LibC::BOOL

  # Params # dwtlsindex : UInt32 [In]
  fun TlsFree(dwtlsindex : UInt32) : LibC::BOOL

  # Params # lpapplicationname : PSTR [In],lpcommandline : PSTR [In],lpprocessattributes : SECURITY_ATTRIBUTES* [In],lpthreadattributes : SECURITY_ATTRIBUTES* [In],binherithandles : LibC::BOOL [In],dwcreationflags : PROCESS_CREATION_FLAGS [In],lpenvironment : Void* [In],lpcurrentdirectory : PSTR [In],lpstartupinfo : STARTUPINFOA* [In],lpprocessinformation : PROCESS_INFORMATION* [In]
  fun CreateProcessA(lpapplicationname : PSTR, lpcommandline : PSTR, lpprocessattributes : SECURITY_ATTRIBUTES*, lpthreadattributes : SECURITY_ATTRIBUTES*, binherithandles : LibC::BOOL, dwcreationflags : PROCESS_CREATION_FLAGS, lpenvironment : Void*, lpcurrentdirectory : PSTR, lpstartupinfo : STARTUPINFOA*, lpprocessinformation : PROCESS_INFORMATION*) : LibC::BOOL

  # Params # lpapplicationname : LibC::LPWSTR [In],lpcommandline : LibC::LPWSTR [In],lpprocessattributes : SECURITY_ATTRIBUTES* [In],lpthreadattributes : SECURITY_ATTRIBUTES* [In],binherithandles : LibC::BOOL [In],dwcreationflags : PROCESS_CREATION_FLAGS [In],lpenvironment : Void* [In],lpcurrentdirectory : LibC::LPWSTR [In],lpstartupinfo : STARTUPINFOW* [In],lpprocessinformation : PROCESS_INFORMATION* [In]
  # Commented out because function is part of Lib C
  #fun CreateProcessW(lpapplicationname : LibC::LPWSTR, lpcommandline : LibC::LPWSTR, lpprocessattributes : SECURITY_ATTRIBUTES*, lpthreadattributes : SECURITY_ATTRIBUTES*, binherithandles : LibC::BOOL, dwcreationflags : PROCESS_CREATION_FLAGS, lpenvironment : Void*, lpcurrentdirectory : LibC::LPWSTR, lpstartupinfo : STARTUPINFOW*, lpprocessinformation : PROCESS_INFORMATION*) : LibC::BOOL

  # Params # dwlevel : UInt32 [In],dwflags : UInt32 [In]
  fun SetProcessShutdownParameters(dwlevel : UInt32, dwflags : UInt32) : LibC::BOOL

  # Params # processid : UInt32 [In]
  fun GetProcessVersion(processid : UInt32) : UInt32

  # Params # lpstartupinfo : STARTUPINFOW* [In]
  fun GetStartupInfoW(lpstartupinfo : STARTUPINFOW*)

  # Params # htoken : LibC::HANDLE [In],lpapplicationname : LibC::LPWSTR [In],lpcommandline : LibC::LPWSTR [In],lpprocessattributes : SECURITY_ATTRIBUTES* [In],lpthreadattributes : SECURITY_ATTRIBUTES* [In],binherithandles : LibC::BOOL [In],dwcreationflags : UInt32 [In],lpenvironment : Void* [In],lpcurrentdirectory : LibC::LPWSTR [In],lpstartupinfo : STARTUPINFOW* [In],lpprocessinformation : PROCESS_INFORMATION* [In]
  fun CreateProcessAsUserW(htoken : LibC::HANDLE, lpapplicationname : LibC::LPWSTR, lpcommandline : LibC::LPWSTR, lpprocessattributes : SECURITY_ATTRIBUTES*, lpthreadattributes : SECURITY_ATTRIBUTES*, binherithandles : LibC::BOOL, dwcreationflags : UInt32, lpenvironment : Void*, lpcurrentdirectory : LibC::LPWSTR, lpstartupinfo : STARTUPINFOW*, lpprocessinformation : PROCESS_INFORMATION*) : LibC::BOOL

  # Params # thread : LibC::HANDLE* [In],token : LibC::HANDLE [In]
  fun SetThreadToken(thread : LibC::HANDLE*, token : LibC::HANDLE) : LibC::BOOL

  # Params # processhandle : LibC::HANDLE [In],desiredaccess : TOKEN_ACCESS_MASK [In],tokenhandle : LibC::HANDLE* [In]
  fun OpenProcessToken(processhandle : LibC::HANDLE, desiredaccess : TOKEN_ACCESS_MASK, tokenhandle : LibC::HANDLE*) : LibC::BOOL

  # Params # threadhandle : LibC::HANDLE [In],desiredaccess : TOKEN_ACCESS_MASK [In],openasself : LibC::BOOL [In],tokenhandle : LibC::HANDLE* [In]
  fun OpenThreadToken(threadhandle : LibC::HANDLE, desiredaccess : TOKEN_ACCESS_MASK, openasself : LibC::BOOL, tokenhandle : LibC::HANDLE*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwpriorityclass : PROCESS_CREATION_FLAGS [In]
  fun SetPriorityClass(hprocess : LibC::HANDLE, dwpriorityclass : PROCESS_CREATION_FLAGS) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In]
  fun GetPriorityClass(hprocess : LibC::HANDLE) : UInt32

  # Params # stacksizeinbytes : UInt32* [In]
  # Commented out because function is part of Lib C
  #fun SetThreadStackGuarantee(stacksizeinbytes : UInt32*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In]
  fun GetProcessId(process : LibC::HANDLE) : UInt32

  # Params # thread : LibC::HANDLE [In]
  fun GetThreadId(thread : LibC::HANDLE) : UInt32

  # Params # 
  fun FlushProcessWriteBuffers

  # Params # thread : LibC::HANDLE [In]
  fun GetProcessIdOfThread(thread : LibC::HANDLE) : UInt32

  # Params # lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST [In],dwattributecount : UInt32 [In],dwflags : UInt32 [In],lpsize : LibC::UINT_PTR* [In]
  fun InitializeProcThreadAttributeList(lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST, dwattributecount : UInt32, dwflags : UInt32, lpsize : LibC::UINT_PTR*) : LibC::BOOL

  # Params # lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST [In]
  fun DeleteProcThreadAttributeList(lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST)

  # Params # lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST [In],dwflags : UInt32 [In],attribute : LibC::UINT_PTR [In],lpvalue : Void* [In],cbsize : LibC::UINT_PTR [In],lppreviousvalue : Void* [In],lpreturnsize : LibC::UINT_PTR* [In]
  fun UpdateProcThreadAttribute(lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST, dwflags : UInt32, attribute : LibC::UINT_PTR, lpvalue : Void*, cbsize : LibC::UINT_PTR, lppreviousvalue : Void*, lpreturnsize : LibC::UINT_PTR*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],numberoftargets : UInt16 [In],targets : PROCESS_DYNAMIC_EH_CONTINUATION_TARGET* [In]
  fun SetProcessDynamicEHContinuationTargets(process : LibC::HANDLE, numberoftargets : UInt16, targets : PROCESS_DYNAMIC_EH_CONTINUATION_TARGET*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],numberofranges : UInt16 [In],ranges : PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE* [In]
  fun SetProcessDynamicEnforcedCetCompatibleRanges(process : LibC::HANDLE, numberofranges : UInt16, ranges : PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwflags : PROCESS_AFFINITY_AUTO_UPDATE_FLAGS [In]
  fun SetProcessAffinityUpdateMode(hprocess : LibC::HANDLE, dwflags : PROCESS_AFFINITY_AUTO_UPDATE_FLAGS) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpdwflags : PROCESS_AFFINITY_AUTO_UPDATE_FLAGS* [In]
  fun QueryProcessAffinityUpdateMode(hprocess : LibC::HANDLE, lpdwflags : PROCESS_AFFINITY_AUTO_UPDATE_FLAGS*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpthreadattributes : SECURITY_ATTRIBUTES* [In],dwstacksize : LibC::UINT_PTR [In],lpstartaddress : LPTHREAD_START_ROUTINE [In],lpparameter : Void* [In],dwcreationflags : UInt32 [In],lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST [In],lpthreadid : UInt32* [In]
  fun CreateRemoteThreadEx(hprocess : LibC::HANDLE, lpthreadattributes : SECURITY_ATTRIBUTES*, dwstacksize : LibC::UINT_PTR, lpstartaddress : LPTHREAD_START_ROUTINE, lpparameter : Void*, dwcreationflags : UInt32, lpattributelist : LPPROC_THREAD_ATTRIBUTE_LIST, lpthreadid : UInt32*) : LibC::HANDLE

  # Params # lowlimit : LibC::UINT_PTR* [In],highlimit : LibC::UINT_PTR* [In]
  # Commented out because function is part of Lib C
  #fun GetCurrentThreadStackLimits(lowlimit : LibC::UINT_PTR*, highlimit : LibC::UINT_PTR*)

  # Params # hprocess : LibC::HANDLE [In],mitigationpolicy : PROCESS_MITIGATION_POLICY [In],lpbuffer : Void* [In],dwlength : LibC::UINT_PTR [In]
  fun GetProcessMitigationPolicy(hprocess : LibC::HANDLE, mitigationpolicy : PROCESS_MITIGATION_POLICY, lpbuffer : Void*, dwlength : LibC::UINT_PTR) : LibC::BOOL

  # Params # mitigationpolicy : PROCESS_MITIGATION_POLICY [In],lpbuffer : Void* [In],dwlength : LibC::UINT_PTR [In]
  fun SetProcessMitigationPolicy(mitigationpolicy : PROCESS_MITIGATION_POLICY, lpbuffer : Void*, dwlength : LibC::UINT_PTR) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],lpcreationtime : FILETIME* [In],lpexittime : FILETIME* [In],lpkerneltime : FILETIME* [In],lpusertime : FILETIME* [In]
  fun GetThreadTimes(hthread : LibC::HANDLE, lpcreationtime : FILETIME*, lpexittime : FILETIME*, lpkerneltime : FILETIME*, lpusertime : FILETIME*) : LibC::BOOL

  # Params # dwdesiredaccess : PROCESS_ACCESS_RIGHTS [In],binherithandle : LibC::BOOL [In],dwprocessid : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun OpenProcess(dwdesiredaccess : PROCESS_ACCESS_RIGHTS, binherithandle : LibC::BOOL, dwprocessid : UInt32) : LibC::HANDLE

  # Params # processorfeature : PROCESSOR_FEATURE_ID [In]
  fun IsProcessorFeaturePresent(processorfeature : PROCESSOR_FEATURE_ID) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],pdwhandlecount : UInt32* [In]
  fun GetProcessHandleCount(hprocess : LibC::HANDLE, pdwhandlecount : UInt32*) : LibC::BOOL

  # Params # 
  fun GetCurrentProcessorNumber : UInt32

  # Params # hthread : LibC::HANDLE [In],lpidealprocessor : PROCESSOR_NUMBER* [In],lppreviousidealprocessor : PROCESSOR_NUMBER* [In]
  fun SetThreadIdealProcessorEx(hthread : LibC::HANDLE, lpidealprocessor : PROCESSOR_NUMBER*, lppreviousidealprocessor : PROCESSOR_NUMBER*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],lpidealprocessor : PROCESSOR_NUMBER* [In]
  fun GetThreadIdealProcessorEx(hthread : LibC::HANDLE, lpidealprocessor : PROCESSOR_NUMBER*) : LibC::BOOL

  # Params # procnumber : PROCESSOR_NUMBER* [In]
  fun GetCurrentProcessorNumberEx(procnumber : PROCESSOR_NUMBER*)

  # Params # hprocess : LibC::HANDLE [In],pdisablepriorityboost : LibC::BOOL* [In]
  fun GetProcessPriorityBoost(hprocess : LibC::HANDLE, pdisablepriorityboost : LibC::BOOL*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],bdisablepriorityboost : LibC::BOOL [In]
  fun SetProcessPriorityBoost(hprocess : LibC::HANDLE, bdisablepriorityboost : LibC::BOOL) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],lpioispending : LibC::BOOL* [In]
  fun GetThreadIOPendingFlag(hthread : LibC::HANDLE, lpioispending : LibC::BOOL*) : LibC::BOOL

  # Params # lpidletime : FILETIME* [In],lpkerneltime : FILETIME* [In],lpusertime : FILETIME* [In]
  fun GetSystemTimes(lpidletime : FILETIME*, lpkerneltime : FILETIME*, lpusertime : FILETIME*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],threadinformationclass : THREAD_INFORMATION_CLASS [In],threadinformation : Void* [In],threadinformationsize : UInt32 [In]
  fun GetThreadInformation(hthread : LibC::HANDLE, threadinformationclass : THREAD_INFORMATION_CLASS, threadinformation : Void*, threadinformationsize : UInt32) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],threadinformationclass : THREAD_INFORMATION_CLASS [In],threadinformation : Void* [In],threadinformationsize : UInt32 [In]
  fun SetThreadInformation(hthread : LibC::HANDLE, threadinformationclass : THREAD_INFORMATION_CLASS, threadinformation : Void*, threadinformationsize : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],critical : LibC::BOOL* [In]
  fun IsProcessCritical(hprocess : LibC::HANDLE, critical : LibC::BOOL*) : LibC::BOOL

  # Params # policyguid : Guid* [In],policyvalue : LibC::UINT_PTR [In],oldpolicyvalue : LibC::UINT_PTR* [In]
  fun SetProtectedPolicy(policyguid : Guid*, policyvalue : LibC::UINT_PTR, oldpolicyvalue : LibC::UINT_PTR*) : LibC::BOOL

  # Params # policyguid : Guid* [In],policyvalue : LibC::UINT_PTR* [In]
  fun QueryProtectedPolicy(policyguid : Guid*, policyvalue : LibC::UINT_PTR*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],dwidealprocessor : UInt32 [In]
  fun SetThreadIdealProcessor(hthread : LibC::HANDLE, dwidealprocessor : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],processinformationclass : PROCESS_INFORMATION_CLASS [In],processinformation : Void* [In],processinformationsize : UInt32 [In]
  fun SetProcessInformation(hprocess : LibC::HANDLE, processinformationclass : PROCESS_INFORMATION_CLASS, processinformation : Void*, processinformationsize : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],processinformationclass : PROCESS_INFORMATION_CLASS [In],processinformation : Void* [In],processinformationsize : UInt32 [In]
  fun GetProcessInformation(hprocess : LibC::HANDLE, processinformationclass : PROCESS_INFORMATION_CLASS, processinformation : Void*, processinformationsize : UInt32) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],cpusetids : UInt32* [In],cpusetidcount : UInt32 [In],requiredidcount : UInt32* [In]
  fun GetProcessDefaultCpuSets(process : LibC::HANDLE, cpusetids : UInt32*, cpusetidcount : UInt32, requiredidcount : UInt32*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],cpusetids : UInt32* [In],cpusetidcount : UInt32 [In]
  fun SetProcessDefaultCpuSets(process : LibC::HANDLE, cpusetids : UInt32*, cpusetidcount : UInt32) : LibC::BOOL

  # Params # thread : LibC::HANDLE [In],cpusetids : UInt32* [In],cpusetidcount : UInt32 [In],requiredidcount : UInt32* [In]
  fun GetThreadSelectedCpuSets(thread : LibC::HANDLE, cpusetids : UInt32*, cpusetidcount : UInt32, requiredidcount : UInt32*) : LibC::BOOL

  # Params # thread : LibC::HANDLE [In],cpusetids : UInt32* [In],cpusetidcount : UInt32 [In]
  fun SetThreadSelectedCpuSets(thread : LibC::HANDLE, cpusetids : UInt32*, cpusetidcount : UInt32) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In],lpapplicationname : PSTR [In],lpcommandline : PSTR [In],lpprocessattributes : SECURITY_ATTRIBUTES* [In],lpthreadattributes : SECURITY_ATTRIBUTES* [In],binherithandles : LibC::BOOL [In],dwcreationflags : UInt32 [In],lpenvironment : Void* [In],lpcurrentdirectory : PSTR [In],lpstartupinfo : STARTUPINFOA* [In],lpprocessinformation : PROCESS_INFORMATION* [In]
  fun CreateProcessAsUserA(htoken : LibC::HANDLE, lpapplicationname : PSTR, lpcommandline : PSTR, lpprocessattributes : SECURITY_ATTRIBUTES*, lpthreadattributes : SECURITY_ATTRIBUTES*, binherithandles : LibC::BOOL, dwcreationflags : UInt32, lpenvironment : Void*, lpcurrentdirectory : PSTR, lpstartupinfo : STARTUPINFOA*, lpprocessinformation : PROCESS_INFORMATION*) : LibC::BOOL

  # Params # lpdwlevel : UInt32* [In],lpdwflags : UInt32* [In]
  fun GetProcessShutdownParameters(lpdwlevel : UInt32*, lpdwflags : UInt32*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],cpusetmasks : GROUP_AFFINITY* [In],cpusetmaskcount : UInt16 [In],requiredmaskcount : UInt16* [In]
  fun GetProcessDefaultCpuSetMasks(process : LibC::HANDLE, cpusetmasks : GROUP_AFFINITY*, cpusetmaskcount : UInt16, requiredmaskcount : UInt16*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],cpusetmasks : GROUP_AFFINITY* [In],cpusetmaskcount : UInt16 [In]
  fun SetProcessDefaultCpuSetMasks(process : LibC::HANDLE, cpusetmasks : GROUP_AFFINITY*, cpusetmaskcount : UInt16) : LibC::BOOL

  # Params # thread : LibC::HANDLE [In],cpusetmasks : GROUP_AFFINITY* [In],cpusetmaskcount : UInt16 [In],requiredmaskcount : UInt16* [In]
  fun GetThreadSelectedCpuSetMasks(thread : LibC::HANDLE, cpusetmasks : GROUP_AFFINITY*, cpusetmaskcount : UInt16, requiredmaskcount : UInt16*) : LibC::BOOL

  # Params # thread : LibC::HANDLE [In],cpusetmasks : GROUP_AFFINITY* [In],cpusetmaskcount : UInt16 [In]
  fun SetThreadSelectedCpuSetMasks(thread : LibC::HANDLE, cpusetmasks : GROUP_AFFINITY*, cpusetmaskcount : UInt16) : LibC::BOOL

  # Params # machine : UInt16 [In],machinetypeattributes : MACHINE_ATTRIBUTES* [In]
  fun GetMachineTypeAttributes(machine : UInt16, machinetypeattributes : MACHINE_ATTRIBUTES*) : HRESULT

  # Params # hthread : LibC::HANDLE [In],lpthreaddescription : LibC::LPWSTR [In]
  fun SetThreadDescription(hthread : LibC::HANDLE, lpthreaddescription : LibC::LPWSTR) : HRESULT

  # Params # hthread : LibC::HANDLE [In],ppszthreaddescription : LibC::LPWSTR* [In]
  fun GetThreadDescription(hthread : LibC::HANDLE, ppszthreaddescription : LibC::LPWSTR*) : HRESULT

  # Params # function : LPTHREAD_START_ROUTINE [In],context : Void* [In],flags : WORKER_THREAD_FLAGS [In]
  fun QueueUserWorkItem(function : LPTHREAD_START_ROUTINE, context : Void*, flags : WORKER_THREAD_FLAGS) : LibC::BOOL

  # Params # waithandle : LibC::HANDLE [In],completionevent : LibC::HANDLE [In]
  fun UnregisterWaitEx(waithandle : LibC::HANDLE, completionevent : LibC::HANDLE) : LibC::BOOL

  # Params # 
  fun CreateTimerQueue : LibC::HANDLE

  # Params # phnewtimer : LibC::HANDLE* [In],timerqueue : LibC::HANDLE [In],callback : WAITORTIMERCALLBACK [In],parameter : Void* [In],duetime : UInt32 [In],period : UInt32 [In],flags : WORKER_THREAD_FLAGS [In]
  fun CreateTimerQueueTimer(phnewtimer : LibC::HANDLE*, timerqueue : LibC::HANDLE, callback : WAITORTIMERCALLBACK, parameter : Void*, duetime : UInt32, period : UInt32, flags : WORKER_THREAD_FLAGS) : LibC::BOOL

  # Params # timerqueue : LibC::HANDLE [In],timer : LibC::HANDLE [In],duetime : UInt32 [In],period : UInt32 [In]
  fun ChangeTimerQueueTimer(timerqueue : LibC::HANDLE, timer : LibC::HANDLE, duetime : UInt32, period : UInt32) : LibC::BOOL

  # Params # timerqueue : LibC::HANDLE [In],timer : LibC::HANDLE [In],completionevent : LibC::HANDLE [In]
  fun DeleteTimerQueueTimer(timerqueue : LibC::HANDLE, timer : LibC::HANDLE, completionevent : LibC::HANDLE) : LibC::BOOL

  # Params # timerqueue : LibC::HANDLE [In]
  fun DeleteTimerQueue(timerqueue : LibC::HANDLE) : LibC::BOOL

  # Params # timerqueue : LibC::HANDLE [In],completionevent : LibC::HANDLE [In]
  fun DeleteTimerQueueEx(timerqueue : LibC::HANDLE, completionevent : LibC::HANDLE) : LibC::BOOL

  # Params # reserved : Void* [In]
  fun CreateThreadpool(reserved : Void*) : PTP_POOL

  # Params # ptpp : PTP_POOL [In],cthrdmost : UInt32 [In]
  fun SetThreadpoolThreadMaximum(ptpp : PTP_POOL, cthrdmost : UInt32)

  # Params # ptpp : PTP_POOL [In],cthrdmic : UInt32 [In]
  fun SetThreadpoolThreadMinimum(ptpp : PTP_POOL, cthrdmic : UInt32) : LibC::BOOL

  # Params # ptpp : PTP_POOL [In],ptpsi : TP_POOL_STACK_INFORMATION* [In]
  fun SetThreadpoolStackInformation(ptpp : PTP_POOL, ptpsi : TP_POOL_STACK_INFORMATION*) : LibC::BOOL

  # Params # ptpp : PTP_POOL [In],ptpsi : TP_POOL_STACK_INFORMATION* [In]
  fun QueryThreadpoolStackInformation(ptpp : PTP_POOL, ptpsi : TP_POOL_STACK_INFORMATION*) : LibC::BOOL

  # Params # ptpp : PTP_POOL [In]
  fun CloseThreadpool(ptpp : PTP_POOL)

  # Params # 
  fun CreateThreadpoolCleanupGroup : LibC::IntPtrT

  # Params # ptpcg : LibC::IntPtrT [In],fcancelpendingcallbacks : LibC::BOOL [In],pvcleanupcontext : Void* [In]
  fun CloseThreadpoolCleanupGroupMembers(ptpcg : LibC::IntPtrT, fcancelpendingcallbacks : LibC::BOOL, pvcleanupcontext : Void*)

  # Params # ptpcg : LibC::IntPtrT [In]
  fun CloseThreadpoolCleanupGroup(ptpcg : LibC::IntPtrT)

  # Params # pci : TP_CALLBACK_INSTANCE* [In],evt : LibC::HANDLE [In]
  fun SetEventWhenCallbackReturns(pci : TP_CALLBACK_INSTANCE*, evt : LibC::HANDLE)

  # Params # pci : TP_CALLBACK_INSTANCE* [In],sem : LibC::HANDLE [In],crel : UInt32 [In]
  fun ReleaseSemaphoreWhenCallbackReturns(pci : TP_CALLBACK_INSTANCE*, sem : LibC::HANDLE, crel : UInt32)

  # Params # pci : TP_CALLBACK_INSTANCE* [In],mut : LibC::HANDLE [In]
  fun ReleaseMutexWhenCallbackReturns(pci : TP_CALLBACK_INSTANCE*, mut : LibC::HANDLE)

  # Params # pci : TP_CALLBACK_INSTANCE* [In],pcs : RTL_CRITICAL_SECTION* [In]
  fun LeaveCriticalSectionWhenCallbackReturns(pci : TP_CALLBACK_INSTANCE*, pcs : RTL_CRITICAL_SECTION*)

  # Params # pci : TP_CALLBACK_INSTANCE* [In],mod : HINSTANCE [In]
  fun FreeLibraryWhenCallbackReturns(pci : TP_CALLBACK_INSTANCE*, mod : HINSTANCE)

  # Params # pci : TP_CALLBACK_INSTANCE* [In]
  fun CallbackMayRunLong(pci : TP_CALLBACK_INSTANCE*) : LibC::BOOL

  # Params # pci : TP_CALLBACK_INSTANCE* [In]
  fun DisassociateCurrentThreadFromCallback(pci : TP_CALLBACK_INSTANCE*)

  # Params # pfns : PTP_SIMPLE_CALLBACK [In],pv : Void* [In],pcbe : TP_CALLBACK_ENVIRON_V3* [In]
  fun TrySubmitThreadpoolCallback(pfns : PTP_SIMPLE_CALLBACK, pv : Void*, pcbe : TP_CALLBACK_ENVIRON_V3*) : LibC::BOOL

  # Params # pfnwk : PTP_WORK_CALLBACK [In],pv : Void* [In],pcbe : TP_CALLBACK_ENVIRON_V3* [In]
  fun CreateThreadpoolWork(pfnwk : PTP_WORK_CALLBACK, pv : Void*, pcbe : TP_CALLBACK_ENVIRON_V3*) : TP_WORK*

  # Params # pwk : TP_WORK* [In]
  fun SubmitThreadpoolWork(pwk : TP_WORK*)

  # Params # pwk : TP_WORK* [In],fcancelpendingcallbacks : LibC::BOOL [In]
  fun WaitForThreadpoolWorkCallbacks(pwk : TP_WORK*, fcancelpendingcallbacks : LibC::BOOL)

  # Params # pwk : TP_WORK* [In]
  fun CloseThreadpoolWork(pwk : TP_WORK*)

  # Params # pfnti : PTP_TIMER_CALLBACK [In],pv : Void* [In],pcbe : TP_CALLBACK_ENVIRON_V3* [In]
  fun CreateThreadpoolTimer(pfnti : PTP_TIMER_CALLBACK, pv : Void*, pcbe : TP_CALLBACK_ENVIRON_V3*) : TP_TIMER*

  # Params # pti : TP_TIMER* [In],pftduetime : FILETIME* [In],msperiod : UInt32 [In],mswindowlength : UInt32 [In]
  fun SetThreadpoolTimer(pti : TP_TIMER*, pftduetime : FILETIME*, msperiod : UInt32, mswindowlength : UInt32)

  # Params # pti : TP_TIMER* [In]
  fun IsThreadpoolTimerSet(pti : TP_TIMER*) : LibC::BOOL

  # Params # pti : TP_TIMER* [In],fcancelpendingcallbacks : LibC::BOOL [In]
  fun WaitForThreadpoolTimerCallbacks(pti : TP_TIMER*, fcancelpendingcallbacks : LibC::BOOL)

  # Params # pti : TP_TIMER* [In]
  fun CloseThreadpoolTimer(pti : TP_TIMER*)

  # Params # pfnwa : PTP_WAIT_CALLBACK [In],pv : Void* [In],pcbe : TP_CALLBACK_ENVIRON_V3* [In]
  fun CreateThreadpoolWait(pfnwa : PTP_WAIT_CALLBACK, pv : Void*, pcbe : TP_CALLBACK_ENVIRON_V3*) : TP_WAIT*

  # Params # pwa : TP_WAIT* [In],h : LibC::HANDLE [In],pfttimeout : FILETIME* [In]
  fun SetThreadpoolWait(pwa : TP_WAIT*, h : LibC::HANDLE, pfttimeout : FILETIME*)

  # Params # pwa : TP_WAIT* [In],fcancelpendingcallbacks : LibC::BOOL [In]
  fun WaitForThreadpoolWaitCallbacks(pwa : TP_WAIT*, fcancelpendingcallbacks : LibC::BOOL)

  # Params # pwa : TP_WAIT* [In]
  fun CloseThreadpoolWait(pwa : TP_WAIT*)

  # Params # fl : LibC::HANDLE [In],pfnio : PTP_WIN32_IO_CALLBACK [In],pv : Void* [In],pcbe : TP_CALLBACK_ENVIRON_V3* [In]
  fun CreateThreadpoolIo(fl : LibC::HANDLE, pfnio : PTP_WIN32_IO_CALLBACK, pv : Void*, pcbe : TP_CALLBACK_ENVIRON_V3*) : TP_IO*

  # Params # pio : TP_IO* [In]
  fun StartThreadpoolIo(pio : TP_IO*)

  # Params # pio : TP_IO* [In]
  fun CancelThreadpoolIo(pio : TP_IO*)

  # Params # pio : TP_IO* [In],fcancelpendingcallbacks : LibC::BOOL [In]
  fun WaitForThreadpoolIoCallbacks(pio : TP_IO*, fcancelpendingcallbacks : LibC::BOOL)

  # Params # pio : TP_IO* [In]
  fun CloseThreadpoolIo(pio : TP_IO*)

  # Params # pti : TP_TIMER* [In],pftduetime : FILETIME* [In],msperiod : UInt32 [In],mswindowlength : UInt32 [In]
  fun SetThreadpoolTimerEx(pti : TP_TIMER*, pftduetime : FILETIME*, msperiod : UInt32, mswindowlength : UInt32) : LibC::BOOL

  # Params # pwa : TP_WAIT* [In],h : LibC::HANDLE [In],pfttimeout : FILETIME* [In],reserved : Void* [In]
  fun SetThreadpoolWaitEx(pwa : TP_WAIT*, h : LibC::HANDLE, pfttimeout : FILETIME*, reserved : Void*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],wow64process : LibC::BOOL* [In]
  fun IsWow64Process(hprocess : LibC::HANDLE, wow64process : LibC::BOOL*) : LibC::BOOL

  # Params # machine : UInt16 [In]
  fun Wow64SetThreadDefaultGuestMachine(machine : UInt16) : UInt16

  # Params # hprocess : LibC::HANDLE [In],pprocessmachine : UInt16* [In],pnativemachine : UInt16* [In]
  fun IsWow64Process2(hprocess : LibC::HANDLE, pprocessmachine : UInt16*, pnativemachine : UInt16*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In]
  fun Wow64SuspendThread(hthread : LibC::HANDLE) : UInt32

  # Params # lpprivatenamespaceattributes : SECURITY_ATTRIBUTES* [In],lpboundarydescriptor : Void* [In],lpaliasprefix : LibC::LPWSTR [In]
  fun CreatePrivateNamespaceW(lpprivatenamespaceattributes : SECURITY_ATTRIBUTES*, lpboundarydescriptor : Void*, lpaliasprefix : LibC::LPWSTR) : NamespaceHandle

  # Params # lpboundarydescriptor : Void* [In],lpaliasprefix : LibC::LPWSTR [In]
  fun OpenPrivateNamespaceW(lpboundarydescriptor : Void*, lpaliasprefix : LibC::LPWSTR) : NamespaceHandle

  # Params # handle : NamespaceHandle [In],flags : UInt32 [In]
  fun ClosePrivateNamespace(handle : NamespaceHandle, flags : UInt32) : BOOLEAN

  # Params # name : LibC::LPWSTR [In],flags : UInt32 [In]
  fun CreateBoundaryDescriptorW(name : LibC::LPWSTR, flags : UInt32) : BoundaryDescriptorHandle

  # Params # boundarydescriptor : LibC::HANDLE* [In],requiredsid : PSID [In]
  fun AddSIDToBoundaryDescriptor(boundarydescriptor : LibC::HANDLE*, requiredsid : PSID) : LibC::BOOL

  # Params # boundarydescriptor : BoundaryDescriptorHandle [In]
  fun DeleteBoundaryDescriptor(boundarydescriptor : BoundaryDescriptorHandle)

  # Params # highestnodenumber : UInt32* [In]
  fun GetNumaHighestNodeNumber(highestnodenumber : UInt32*) : LibC::BOOL

  # Params # node : UInt16 [In],processormask : GROUP_AFFINITY* [In]
  fun GetNumaNodeProcessorMaskEx(node : UInt16, processormask : GROUP_AFFINITY*) : LibC::BOOL

  # Params # nodenumber : UInt16 [In],processormasks : GROUP_AFFINITY* [In],processormaskcount : UInt16 [In],requiredmaskcount : UInt16* [In]
  fun GetNumaNodeProcessorMask2(nodenumber : UInt16, processormasks : GROUP_AFFINITY*, processormaskcount : UInt16, requiredmaskcount : UInt16*) : LibC::BOOL

  # Params # proximityid : UInt32 [In],nodenumber : UInt16* [In]
  fun GetNumaProximityNodeEx(proximityid : UInt32, nodenumber : UInt16*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],groupcount : UInt16* [In],grouparray : UInt16* [In]
  fun GetProcessGroupAffinity(hprocess : LibC::HANDLE, groupcount : UInt16*, grouparray : UInt16*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],groupaffinity : GROUP_AFFINITY* [In]
  fun GetThreadGroupAffinity(hthread : LibC::HANDLE, groupaffinity : GROUP_AFFINITY*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],groupaffinity : GROUP_AFFINITY* [In],previousgroupaffinity : GROUP_AFFINITY* [In]
  fun SetThreadGroupAffinity(hthread : LibC::HANDLE, groupaffinity : GROUP_AFFINITY*, previousgroupaffinity : GROUP_AFFINITY*) : LibC::BOOL

  # Params # idattach : UInt32 [In],idattachto : UInt32 [In],fattach : LibC::BOOL [In]
  fun AttachThreadInput(idattach : UInt32, idattachto : UInt32, fattach : LibC::BOOL) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwmilliseconds : UInt32 [In]
  fun WaitForInputIdle(hprocess : LibC::HANDLE, dwmilliseconds : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],uiflags : GET_GUI_RESOURCES_FLAGS [In]
  fun GetGuiResources(hprocess : LibC::HANDLE, uiflags : GET_GUI_RESOURCES_FLAGS) : UInt32

  # Params # hprocess : LibC::HANDLE [In]
  fun IsImmersiveProcess(hprocess : LibC::HANDLE) : LibC::BOOL

  # Params # fenableexemption : LibC::BOOL [In]
  fun SetProcessRestrictionExemption(fenableexemption : LibC::BOOL) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpprocessaffinitymask : LibC::UINT_PTR* [In],lpsystemaffinitymask : LibC::UINT_PTR* [In]
  fun GetProcessAffinityMask(hprocess : LibC::HANDLE, lpprocessaffinitymask : LibC::UINT_PTR*, lpsystemaffinitymask : LibC::UINT_PTR*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwprocessaffinitymask : LibC::UINT_PTR [In]
  fun SetProcessAffinityMask(hprocess : LibC::HANDLE, dwprocessaffinitymask : LibC::UINT_PTR) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpiocounters : IO_COUNTERS* [In]
  fun GetProcessIoCounters(hprocess : LibC::HANDLE, lpiocounters : IO_COUNTERS*) : LibC::BOOL

  # Params # lpfiber : Void* [In]
  fun SwitchToFiber(lpfiber : Void*)

  # Params # lpfiber : Void* [In]
  fun DeleteFiber(lpfiber : Void*)

  # Params # 
  fun ConvertFiberToThread : LibC::BOOL

  # Params # dwstackcommitsize : LibC::UINT_PTR [In],dwstackreservesize : LibC::UINT_PTR [In],dwflags : UInt32 [In],lpstartaddress : LPFIBER_START_ROUTINE [In],lpparameter : Void* [In]
  fun CreateFiberEx(dwstackcommitsize : LibC::UINT_PTR, dwstackreservesize : LibC::UINT_PTR, dwflags : UInt32, lpstartaddress : LPFIBER_START_ROUTINE, lpparameter : Void*) : Void*

  # Params # lpparameter : Void* [In],dwflags : UInt32 [In]
  fun ConvertThreadToFiberEx(lpparameter : Void*, dwflags : UInt32) : Void*

  # Params # dwstacksize : LibC::UINT_PTR [In],lpstartaddress : LPFIBER_START_ROUTINE [In],lpparameter : Void* [In]
  fun CreateFiber(dwstacksize : LibC::UINT_PTR, lpstartaddress : LPFIBER_START_ROUTINE, lpparameter : Void*) : Void*

  # Params # lpparameter : Void* [In]
  fun ConvertThreadToFiber(lpparameter : Void*) : Void*

  # Params # umscompletionlist : Void** [In]
  fun CreateUmsCompletionList(umscompletionlist : Void**) : LibC::BOOL

  # Params # umscompletionlist : Void* [In],waittimeout : UInt32 [In],umsthreadlist : Void** [In]
  fun DequeueUmsCompletionListItems(umscompletionlist : Void*, waittimeout : UInt32, umsthreadlist : Void**) : LibC::BOOL

  # Params # umscompletionlist : Void* [In],umscompletionevent : LibC::HANDLE* [In]
  fun GetUmsCompletionListEvent(umscompletionlist : Void*, umscompletionevent : LibC::HANDLE*) : LibC::BOOL

  # Params # umsthread : Void* [In]
  fun ExecuteUmsThread(umsthread : Void*) : LibC::BOOL

  # Params # schedulerparam : Void* [In]
  fun UmsThreadYield(schedulerparam : Void*) : LibC::BOOL

  # Params # umscompletionlist : Void* [In]
  fun DeleteUmsCompletionList(umscompletionlist : Void*) : LibC::BOOL

  # Params # 
  fun GetCurrentUmsThread : Void*

  # Params # umscontext : Void* [In]
  fun GetNextUmsListItem(umscontext : Void*) : Void*

  # Params # umsthread : Void* [In],umsthreadinfoclass : RTL_UMS_THREAD_INFO_CLASS [In],umsthreadinformation : Void* [In],umsthreadinformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun QueryUmsThreadInformation(umsthread : Void*, umsthreadinfoclass : RTL_UMS_THREAD_INFO_CLASS, umsthreadinformation : Void*, umsthreadinformationlength : UInt32, returnlength : UInt32*) : LibC::BOOL

  # Params # umsthread : Void* [In],umsthreadinfoclass : RTL_UMS_THREAD_INFO_CLASS [In],umsthreadinformation : Void* [In],umsthreadinformationlength : UInt32 [In]
  fun SetUmsThreadInformation(umsthread : Void*, umsthreadinfoclass : RTL_UMS_THREAD_INFO_CLASS, umsthreadinformation : Void*, umsthreadinformationlength : UInt32) : LibC::BOOL

  # Params # umsthread : Void* [In]
  fun DeleteUmsThreadContext(umsthread : Void*) : LibC::BOOL

  # Params # lpumsthread : Void** [In]
  fun CreateUmsThreadContext(lpumsthread : Void**) : LibC::BOOL

  # Params # schedulerstartupinfo : UMS_SCHEDULER_STARTUP_INFO* [In]
  fun EnterUmsSchedulingMode(schedulerstartupinfo : UMS_SCHEDULER_STARTUP_INFO*) : LibC::BOOL

  # Params # threadhandle : LibC::HANDLE [In],systemthreadinfo : UMS_SYSTEM_THREAD_INFORMATION* [In]
  fun GetUmsSystemThreadInformation(threadhandle : LibC::HANDLE, systemthreadinfo : UMS_SYSTEM_THREAD_INFORMATION*) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In],dwthreadaffinitymask : LibC::UINT_PTR [In]
  fun SetThreadAffinityMask(hthread : LibC::HANDLE, dwthreadaffinitymask : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # dwflags : PROCESS_DEP_FLAGS [In]
  fun SetProcessDEPPolicy(dwflags : PROCESS_DEP_FLAGS) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpflags : UInt32* [In],lppermanent : LibC::BOOL* [In]
  fun GetProcessDEPPolicy(hprocess : LibC::HANDLE, lpflags : UInt32*, lppermanent : LibC::BOOL*) : LibC::BOOL

  # Params # hevent : LibC::HANDLE [In]
  fun PulseEvent(hevent : LibC::HANDLE) : LibC::BOOL

  # Params # lpcmdline : PSTR [In],ucmdshow : UInt32 [In]
  fun WinExec(lpcmdline : PSTR, ucmdshow : UInt32) : UInt32

  # Params # lpsemaphoreattributes : SECURITY_ATTRIBUTES* [In],linitialcount : Int32 [In],lmaximumcount : Int32 [In],lpname : PSTR [In]
  fun CreateSemaphoreA(lpsemaphoreattributes : SECURITY_ATTRIBUTES*, linitialcount : Int32, lmaximumcount : Int32, lpname : PSTR) : LibC::HANDLE

  # Params # lpsemaphoreattributes : SECURITY_ATTRIBUTES* [In],linitialcount : Int32 [In],lmaximumcount : Int32 [In],lpname : PSTR [In],dwflags : UInt32 [In],dwdesiredaccess : UInt32 [In]
  fun CreateSemaphoreExA(lpsemaphoreattributes : SECURITY_ATTRIBUTES*, linitialcount : Int32, lmaximumcount : Int32, lpname : PSTR, dwflags : UInt32, dwdesiredaccess : UInt32) : LibC::HANDLE

  # Params # hprocess : LibC::HANDLE [In],dwflags : PROCESS_NAME_FORMAT [In],lpexename : UInt8* [In],lpdwsize : UInt32* [In]
  fun QueryFullProcessImageNameA(hprocess : LibC::HANDLE, dwflags : PROCESS_NAME_FORMAT, lpexename : UInt8*, lpdwsize : UInt32*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwflags : PROCESS_NAME_FORMAT [In],lpexename : Char* [In],lpdwsize : UInt32* [In]
  fun QueryFullProcessImageNameW(hprocess : LibC::HANDLE, dwflags : PROCESS_NAME_FORMAT, lpexename : Char*, lpdwsize : UInt32*) : LibC::BOOL

  # Params # lpstartupinfo : STARTUPINFOA* [In]
  fun GetStartupInfoA(lpstartupinfo : STARTUPINFOA*)

  # Params # lpusername : LibC::LPWSTR [In],lpdomain : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],dwlogonflags : CREATE_PROCESS_LOGON_FLAGS [In],lpapplicationname : LibC::LPWSTR [In],lpcommandline : LibC::LPWSTR [In],dwcreationflags : UInt32 [In],lpenvironment : Void* [In],lpcurrentdirectory : LibC::LPWSTR [In],lpstartupinfo : STARTUPINFOW* [In],lpprocessinformation : PROCESS_INFORMATION* [In]
  fun CreateProcessWithLogonW(lpusername : LibC::LPWSTR, lpdomain : LibC::LPWSTR, lppassword : LibC::LPWSTR, dwlogonflags : CREATE_PROCESS_LOGON_FLAGS, lpapplicationname : LibC::LPWSTR, lpcommandline : LibC::LPWSTR, dwcreationflags : UInt32, lpenvironment : Void*, lpcurrentdirectory : LibC::LPWSTR, lpstartupinfo : STARTUPINFOW*, lpprocessinformation : PROCESS_INFORMATION*) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In],dwlogonflags : CREATE_PROCESS_LOGON_FLAGS [In],lpapplicationname : LibC::LPWSTR [In],lpcommandline : LibC::LPWSTR [In],dwcreationflags : UInt32 [In],lpenvironment : Void* [In],lpcurrentdirectory : LibC::LPWSTR [In],lpstartupinfo : STARTUPINFOW* [In],lpprocessinformation : PROCESS_INFORMATION* [In]
  fun CreateProcessWithTokenW(htoken : LibC::HANDLE, dwlogonflags : CREATE_PROCESS_LOGON_FLAGS, lpapplicationname : LibC::LPWSTR, lpcommandline : LibC::LPWSTR, dwcreationflags : UInt32, lpenvironment : Void*, lpcurrentdirectory : LibC::LPWSTR, lpstartupinfo : STARTUPINFOW*, lpprocessinformation : PROCESS_INFORMATION*) : LibC::BOOL

  # Params # phnewwaitobject : LibC::HANDLE* [In],hobject : LibC::HANDLE [In],callback : WAITORTIMERCALLBACK [In],context : Void* [In],dwmilliseconds : UInt32 [In],dwflags : WORKER_THREAD_FLAGS [In]
  fun RegisterWaitForSingleObject(phnewwaitobject : LibC::HANDLE*, hobject : LibC::HANDLE, callback : WAITORTIMERCALLBACK, context : Void*, dwmilliseconds : UInt32, dwflags : WORKER_THREAD_FLAGS) : LibC::BOOL

  # Params # waithandle : LibC::HANDLE [In]
  fun UnregisterWait(waithandle : LibC::HANDLE) : LibC::BOOL

  # Params # timerqueue : LibC::HANDLE [In],callback : WAITORTIMERCALLBACK [In],parameter : Void* [In],duetime : UInt32 [In],period : UInt32 [In],preferio : LibC::BOOL [In]
  fun SetTimerQueueTimer(timerqueue : LibC::HANDLE, callback : WAITORTIMERCALLBACK, parameter : Void*, duetime : UInt32, period : UInt32, preferio : LibC::BOOL) : LibC::HANDLE

  # Params # lpprivatenamespaceattributes : SECURITY_ATTRIBUTES* [In],lpboundarydescriptor : Void* [In],lpaliasprefix : PSTR [In]
  fun CreatePrivateNamespaceA(lpprivatenamespaceattributes : SECURITY_ATTRIBUTES*, lpboundarydescriptor : Void*, lpaliasprefix : PSTR) : NamespaceHandle

  # Params # lpboundarydescriptor : Void* [In],lpaliasprefix : PSTR [In]
  fun OpenPrivateNamespaceA(lpboundarydescriptor : Void*, lpaliasprefix : PSTR) : NamespaceHandle

  # Params # name : PSTR [In],flags : UInt32 [In]
  fun CreateBoundaryDescriptorA(name : PSTR, flags : UInt32) : BoundaryDescriptorHandle

  # Params # boundarydescriptor : LibC::HANDLE* [In],integritylabel : PSID [In]
  fun AddIntegrityLabelToBoundaryDescriptor(boundarydescriptor : LibC::HANDLE*, integritylabel : PSID) : LibC::BOOL

  # Params # 
  fun GetActiveProcessorGroupCount : UInt16

  # Params # 
  fun GetMaximumProcessorGroupCount : UInt16

  # Params # groupnumber : UInt16 [In]
  fun GetActiveProcessorCount(groupnumber : UInt16) : UInt32

  # Params # groupnumber : UInt16 [In]
  fun GetMaximumProcessorCount(groupnumber : UInt16) : UInt32

  # Params # processor : UInt8 [In],nodenumber : UInt8* [In]
  fun GetNumaProcessorNode(processor : UInt8, nodenumber : UInt8*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],nodenumber : UInt16* [In]
  fun GetNumaNodeNumberFromHandle(hfile : LibC::HANDLE, nodenumber : UInt16*) : LibC::BOOL

  # Params # processor : PROCESSOR_NUMBER* [In],nodenumber : UInt16* [In]
  fun GetNumaProcessorNodeEx(processor : PROCESSOR_NUMBER*, nodenumber : UInt16*) : LibC::BOOL

  # Params # node : UInt8 [In],processormask : UInt64* [In]
  fun GetNumaNodeProcessorMask(node : UInt8, processormask : UInt64*) : LibC::BOOL

  # Params # node : UInt8 [In],availablebytes : UInt64* [In]
  fun GetNumaAvailableMemoryNode(node : UInt8, availablebytes : UInt64*) : LibC::BOOL

  # Params # node : UInt16 [In],availablebytes : UInt64* [In]
  fun GetNumaAvailableMemoryNodeEx(node : UInt16, availablebytes : UInt64*) : LibC::BOOL

  # Params # proximityid : UInt32 [In],nodenumber : UInt8* [In]
  fun GetNumaProximityNode(proximityid : UInt32, nodenumber : UInt8*) : LibC::BOOL

  # Params # processhandle : LibC::HANDLE [In],processinformationclass : PROCESSINFOCLASS [In],processinformation : Void* [In],processinformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun NtQueryInformationProcess(processhandle : LibC::HANDLE, processinformationclass : PROCESSINFOCLASS, processinformation : Void*, processinformationlength : UInt32, returnlength : UInt32*) : NTSTATUS

  # Params # threadhandle : LibC::HANDLE [In],threadinformationclass : THREADINFOCLASS [In],threadinformation : Void* [In],threadinformationlength : UInt32 [In],returnlength : UInt32* [In]
  fun NtQueryInformationThread(threadhandle : LibC::HANDLE, threadinformationclass : THREADINFOCLASS, threadinformation : Void*, threadinformationlength : UInt32, returnlength : UInt32*) : NTSTATUS

  # Params # threadhandle : LibC::HANDLE [In],threadinformationclass : THREADINFOCLASS [In],threadinformation : Void* [In],threadinformationlength : UInt32 [In]
  fun NtSetInformationThread(threadhandle : LibC::HANDLE, threadinformationclass : THREADINFOCLASS, threadinformation : Void*, threadinformationlength : UInt32) : NTSTATUS
end
