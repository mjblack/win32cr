require "./../../foundation.cr"
require "./../time.cr"
require "./../com.cr"
require "./../../security.cr"

module Win32cr::System::Diagnostics::Etw
  extend self
  alias TDH_HANDLE = LibC::IntPtrT
  alias PROCESSTRACE_HANDLE = UInt64
  alias CONTROLTRACE_HANDLE = UInt64
  alias RELOGSTREAM_HANDLE = UInt64
  alias PEVENT_TRACE_BUFFER_CALLBACKW = Proc(Win32cr::System::Diagnostics::Etw::EVENT_TRACE_LOGFILEW*, UInt32)

  alias PEVENT_TRACE_BUFFER_CALLBACKA = Proc(Win32cr::System::Diagnostics::Etw::EVENT_TRACE_LOGFILEA*, UInt32)

  alias PEVENT_CALLBACK = Proc(Win32cr::System::Diagnostics::Etw::EVENT_TRACE*, Void)

  alias PEVENT_RECORD_CALLBACK = Proc(Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, Void)

  alias WMIDPREQUEST = Proc(Win32cr::System::Diagnostics::Etw::WMIDPREQUESTCODE, Void*, UInt32*, Void*, UInt32)

  alias PENABLECALLBACK = Proc(LibC::GUID*, Win32cr::System::Diagnostics::Etw::ENABLECALLBACK_ENABLED_STATE, UInt8, UInt64, UInt64, Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*, Void*, Void)

  ALPCGuid = "45d8cccd-539f-4b72-a8b7-5c683142609a"
  DiskIoGuid = "3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c"
  EventTraceConfigGuid = "01853a65-418f-4f36-aefc-dc0f1d2fd235"
  FileIoGuid = "90cbdc39-4a3e-11d1-84f4-0000f80464e3"
  ImageLoadGuid = "2cb15d1d-5fc1-11d2-abe1-00a0c911f518"
  PageFaultGuid = "3d6fa8d3-fe05-11d0-9dda-00c04fd7ba7c"
  PerfInfoGuid = "ce1dbfb4-137e-4da6-87b0-3f59aa102cbc"
  ProcessGuid = "3d6fa8d0-fe05-11d0-9dda-00c04fd7ba7c"
  RegistryGuid = "ae53722e-c863-11d2-8659-00c04fa321a1"
  SplitIoGuid = "d837ca92-12b9-44a5-ad6a-3a65b3578aa8"
  TcpIpGuid = "9a280ac0-c8e0-11d1-84e2-00c04fb998a2"
  ThreadGuid = "3d6fa8d1-fe05-11d0-9dda-00c04fd7ba7c"
  UdpIpGuid = "bf3a50c5-a9c9-4988-a005-2df0b7c80f80"
  WNODE_FLAG_ALL_DATA = 1_u32
  WNODE_FLAG_SINGLE_INSTANCE = 2_u32
  WNODE_FLAG_SINGLE_ITEM = 4_u32
  WNODE_FLAG_EVENT_ITEM = 8_u32
  WNODE_FLAG_FIXED_INSTANCE_SIZE = 16_u32
  WNODE_FLAG_TOO_SMALL = 32_u32
  WNODE_FLAG_INSTANCES_SAME = 64_u32
  WNODE_FLAG_STATIC_INSTANCE_NAMES = 128_u32
  WNODE_FLAG_INTERNAL = 256_u32
  WNODE_FLAG_USE_TIMESTAMP = 512_u32
  WNODE_FLAG_PERSIST_EVENT = 1024_u32
  WNODE_FLAG_EVENT_REFERENCE = 8192_u32
  WNODE_FLAG_ANSI_INSTANCENAMES = 16384_u32
  WNODE_FLAG_METHOD_ITEM = 32768_u32
  WNODE_FLAG_PDO_INSTANCE_NAMES = 65536_u32
  WNODE_FLAG_TRACED_GUID = 131072_u32
  WNODE_FLAG_LOG_WNODE = 262144_u32
  WNODE_FLAG_USE_GUID_PTR = 524288_u32
  WNODE_FLAG_USE_MOF_PTR = 1048576_u32
  WNODE_FLAG_NO_HEADER = 2097152_u32
  WNODE_FLAG_SEND_DATA_BLOCK = 4194304_u32
  WNODE_FLAG_VERSIONED_PROPERTIES = 8388608_u32
  WNODE_FLAG_SEVERITY_MASK = 4278190080_u32
  WMIREG_FLAG_EXPENSIVE = 1_u32
  WMIREG_FLAG_INSTANCE_LIST = 4_u32
  WMIREG_FLAG_INSTANCE_BASENAME = 8_u32
  WMIREG_FLAG_INSTANCE_PDO = 32_u32
  WMIREG_FLAG_REMOVE_GUID = 65536_u32
  WMIREG_FLAG_RESERVED1 = 131072_u32
  WMIREG_FLAG_RESERVED2 = 262144_u32
  WMIREG_FLAG_TRACED_GUID = 524288_u32
  WMIREG_FLAG_TRACE_CONTROL_GUID = 4096_u32
  WMIREG_FLAG_EVENT_ONLY_GUID = 64_u32
  WMI_GUIDTYPE_TRACECONTROL = 0_u32
  WMI_GUIDTYPE_TRACE = 1_u32
  WMI_GUIDTYPE_DATA = 2_u32
  WMI_GUIDTYPE_EVENT = 3_u32
  WMIGUID_QUERY = 1_u32
  WMIGUID_SET = 2_u32
  WMIGUID_NOTIFICATION = 4_u32
  WMIGUID_READ_DESCRIPTION = 8_u32
  WMIGUID_EXECUTE = 16_u32
  TRACELOG_CREATE_REALTIME = 32_u32
  TRACELOG_CREATE_ONDISK = 64_u32
  TRACELOG_GUID_ENABLE = 128_u32
  TRACELOG_ACCESS_KERNEL_LOGGER = 256_u32
  TRACELOG_LOG_EVENT = 512_u32
  TRACELOG_CREATE_INPROC = 512_u32
  TRACELOG_ACCESS_REALTIME = 1024_u32
  TRACELOG_REGISTER_GUIDS = 2048_u32
  TRACELOG_JOIN_GROUP = 4096_u32
  WMI_GLOBAL_LOGGER_ID = 1_u32
  MAX_PAYLOAD_PREDICATES = 8_u32
  EventTraceGuid = "68fdd900-4a3e-11d1-84f4-0000f80464e3"
  SystemTraceControlGuid = "9e814aad-3204-11d2-9a82-006008a86939"
  DefaultTraceSecurityGuid = "0811c1af-7a07-4a06-82ed-869455cdf713"
  PrivateLoggerNotificationGuid = "3595ab5c-042a-4c8e-b942-2d059bfeb1b1"
  SystemIoFilterProviderGuid = "fbd09363-9e22-4661-b8bf-e7a34b535b8c"
  SystemObjectProviderGuid = "febd7460-3d1d-47eb-af49-c9eeb1e146f2"
  SystemPowerProviderGuid = "c134884a-32d5-4488-80e5-14ed7abb8269"
  SystemHypervisorProviderGuid = "bafa072a-918a-4bed-b622-bc152097098f"
  SystemLockProviderGuid = "721ddfd3-dacc-4e1e-b26a-a2cb31d4705a"
  SystemConfigProviderGuid = "fef3a8b6-318d-4b67-a96a-3b0f6b8f18fe"
  SystemCpuProviderGuid = "c6c5265f-eae8-4650-aae4-9d48603d8510"
  SystemSchedulerProviderGuid = "599a2a76-4d91-4910-9ac7-7d33f2e97a6c"
  SystemProfileProviderGuid = "bfeb0324-1cee-496f-a409-2ac2b48a6322"
  SystemIoProviderGuid = "3d5c43e3-0f1c-4202-b817-174c0070dc79"
  SystemMemoryProviderGuid = "82958ca9-b6cd-47f8-a3a8-03ae85a4bc24"
  SystemRegistryProviderGuid = "16156bd9-fab4-4cfa-a232-89d1099058e3"
  SystemProcessProviderGuid = "151f55dc-467d-471f-83b5-5f889d46ff66"
  SystemAlpcProviderGuid = "fcb9baaf-e529-4980-92e9-ced1a6aadfdf"
  SystemSyscallProviderGuid = "434286f7-6f1b-45bb-b37e-95f623046c7c"
  SystemInterruptProviderGuid = "d4bbee17-b545-4888-858b-744169015b25"
  SystemTimerProviderGuid = "4f061568-e215-499f-ab2e-eda0ae890a5b"
  KERNEL_LOGGER_NAMEW = "NT Kernel Logger"
  GLOBAL_LOGGER_NAMEW = "GlobalLogger"
  EVENT_LOGGER_NAMEW = "EventLog"
  DIAG_LOGGER_NAMEW = "DiagLog"
  KERNEL_LOGGER_NAMEA = "NT Kernel Logger"
  GLOBAL_LOGGER_NAMEA = "GlobalLogger"
  EVENT_LOGGER_NAMEA = "EventLog"
  DIAG_LOGGER_NAMEA = "DiagLog"
  MAX_MOF_FIELDS = 16_u32
  SYSTEM_EVENT_TYPE = 1_u32
  EVENT_TRACE_TYPE_INFO = 0_u32
  EVENT_TRACE_TYPE_START = 1_u32
  EVENT_TRACE_TYPE_END = 2_u32
  EVENT_TRACE_TYPE_STOP = 2_u32
  EVENT_TRACE_TYPE_DC_START = 3_u32
  EVENT_TRACE_TYPE_DC_END = 4_u32
  EVENT_TRACE_TYPE_EXTENSION = 5_u32
  EVENT_TRACE_TYPE_REPLY = 6_u32
  EVENT_TRACE_TYPE_DEQUEUE = 7_u32
  EVENT_TRACE_TYPE_RESUME = 7_u32
  EVENT_TRACE_TYPE_CHECKPOINT = 8_u32
  EVENT_TRACE_TYPE_SUSPEND = 8_u32
  EVENT_TRACE_TYPE_WINEVT_SEND = 9_u32
  EVENT_TRACE_TYPE_WINEVT_RECEIVE = 240_u32
  TRACE_LEVEL_NONE = 0_u32
  TRACE_LEVEL_CRITICAL = 1_u32
  TRACE_LEVEL_FATAL = 1_u32
  TRACE_LEVEL_ERROR = 2_u32
  TRACE_LEVEL_WARNING = 3_u32
  TRACE_LEVEL_INFORMATION = 4_u32
  TRACE_LEVEL_VERBOSE = 5_u32
  TRACE_LEVEL_RESERVED6 = 6_u32
  TRACE_LEVEL_RESERVED7 = 7_u32
  TRACE_LEVEL_RESERVED8 = 8_u32
  TRACE_LEVEL_RESERVED9 = 9_u32
  EVENT_TRACE_TYPE_LOAD = 10_u32
  EVENT_TRACE_TYPE_TERMINATE = 11_u32
  EVENT_TRACE_TYPE_IO_READ = 10_u32
  EVENT_TRACE_TYPE_IO_WRITE = 11_u32
  EVENT_TRACE_TYPE_IO_READ_INIT = 12_u32
  EVENT_TRACE_TYPE_IO_WRITE_INIT = 13_u32
  EVENT_TRACE_TYPE_IO_FLUSH = 14_u32
  EVENT_TRACE_TYPE_IO_FLUSH_INIT = 15_u32
  EVENT_TRACE_TYPE_IO_REDIRECTED_INIT = 16_u32
  EVENT_TRACE_TYPE_MM_TF = 10_u32
  EVENT_TRACE_TYPE_MM_DZF = 11_u32
  EVENT_TRACE_TYPE_MM_COW = 12_u32
  EVENT_TRACE_TYPE_MM_GPF = 13_u32
  EVENT_TRACE_TYPE_MM_HPF = 14_u32
  EVENT_TRACE_TYPE_MM_AV = 15_u32
  EVENT_TRACE_TYPE_SEND = 10_u32
  EVENT_TRACE_TYPE_RECEIVE = 11_u32
  EVENT_TRACE_TYPE_CONNECT = 12_u32
  EVENT_TRACE_TYPE_DISCONNECT = 13_u32
  EVENT_TRACE_TYPE_RETRANSMIT = 14_u32
  EVENT_TRACE_TYPE_ACCEPT = 15_u32
  EVENT_TRACE_TYPE_RECONNECT = 16_u32
  EVENT_TRACE_TYPE_CONNFAIL = 17_u32
  EVENT_TRACE_TYPE_COPY_TCP = 18_u32
  EVENT_TRACE_TYPE_COPY_ARP = 19_u32
  EVENT_TRACE_TYPE_ACKFULL = 20_u32
  EVENT_TRACE_TYPE_ACKPART = 21_u32
  EVENT_TRACE_TYPE_ACKDUP = 22_u32
  EVENT_TRACE_TYPE_GUIDMAP = 10_u32
  EVENT_TRACE_TYPE_CONFIG = 11_u32
  EVENT_TRACE_TYPE_SIDINFO = 12_u32
  EVENT_TRACE_TYPE_SECURITY = 13_u32
  EVENT_TRACE_TYPE_DBGID_RSDS = 64_u32
  EVENT_TRACE_TYPE_REGCREATE = 10_u32
  EVENT_TRACE_TYPE_REGOPEN = 11_u32
  EVENT_TRACE_TYPE_REGDELETE = 12_u32
  EVENT_TRACE_TYPE_REGQUERY = 13_u32
  EVENT_TRACE_TYPE_REGSETVALUE = 14_u32
  EVENT_TRACE_TYPE_REGDELETEVALUE = 15_u32
  EVENT_TRACE_TYPE_REGQUERYVALUE = 16_u32
  EVENT_TRACE_TYPE_REGENUMERATEKEY = 17_u32
  EVENT_TRACE_TYPE_REGENUMERATEVALUEKEY = 18_u32
  EVENT_TRACE_TYPE_REGQUERYMULTIPLEVALUE = 19_u32
  EVENT_TRACE_TYPE_REGSETINFORMATION = 20_u32
  EVENT_TRACE_TYPE_REGFLUSH = 21_u32
  EVENT_TRACE_TYPE_REGKCBCREATE = 22_u32
  EVENT_TRACE_TYPE_REGKCBDELETE = 23_u32
  EVENT_TRACE_TYPE_REGKCBRUNDOWNBEGIN = 24_u32
  EVENT_TRACE_TYPE_REGKCBRUNDOWNEND = 25_u32
  EVENT_TRACE_TYPE_REGVIRTUALIZE = 26_u32
  EVENT_TRACE_TYPE_REGCLOSE = 27_u32
  EVENT_TRACE_TYPE_REGSETSECURITY = 28_u32
  EVENT_TRACE_TYPE_REGQUERYSECURITY = 29_u32
  EVENT_TRACE_TYPE_REGCOMMIT = 30_u32
  EVENT_TRACE_TYPE_REGPREPARE = 31_u32
  EVENT_TRACE_TYPE_REGROLLBACK = 32_u32
  EVENT_TRACE_TYPE_REGMOUNTHIVE = 33_u32
  EVENT_TRACE_TYPE_CONFIG_CPU = 10_u32
  EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK = 11_u32
  EVENT_TRACE_TYPE_CONFIG_LOGICALDISK = 12_u32
  EVENT_TRACE_TYPE_CONFIG_NIC = 13_u32
  EVENT_TRACE_TYPE_CONFIG_VIDEO = 14_u32
  EVENT_TRACE_TYPE_CONFIG_SERVICES = 15_u32
  EVENT_TRACE_TYPE_CONFIG_POWER = 16_u32
  EVENT_TRACE_TYPE_CONFIG_NETINFO = 17_u32
  EVENT_TRACE_TYPE_CONFIG_OPTICALMEDIA = 18_u32
  EVENT_TRACE_TYPE_CONFIG_IRQ = 21_u32
  EVENT_TRACE_TYPE_CONFIG_PNP = 22_u32
  EVENT_TRACE_TYPE_CONFIG_IDECHANNEL = 23_u32
  EVENT_TRACE_TYPE_CONFIG_NUMANODE = 24_u32
  EVENT_TRACE_TYPE_CONFIG_PLATFORM = 25_u32
  EVENT_TRACE_TYPE_CONFIG_PROCESSORGROUP = 26_u32
  EVENT_TRACE_TYPE_CONFIG_PROCESSORNUMBER = 27_u32
  EVENT_TRACE_TYPE_CONFIG_DPI = 28_u32
  EVENT_TRACE_TYPE_CONFIG_CI_INFO = 29_u32
  EVENT_TRACE_TYPE_CONFIG_MACHINEID = 30_u32
  EVENT_TRACE_TYPE_CONFIG_DEFRAG = 31_u32
  EVENT_TRACE_TYPE_CONFIG_MOBILEPLATFORM = 32_u32
  EVENT_TRACE_TYPE_CONFIG_DEVICEFAMILY = 33_u32
  EVENT_TRACE_TYPE_CONFIG_FLIGHTID = 34_u32
  EVENT_TRACE_TYPE_CONFIG_PROCESSOR = 35_u32
  EVENT_TRACE_TYPE_CONFIG_VIRTUALIZATION = 36_u32
  EVENT_TRACE_TYPE_CONFIG_BOOT = 37_u32
  EVENT_TRACE_TYPE_OPTICAL_IO_READ = 55_u32
  EVENT_TRACE_TYPE_OPTICAL_IO_WRITE = 56_u32
  EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH = 57_u32
  EVENT_TRACE_TYPE_OPTICAL_IO_READ_INIT = 58_u32
  EVENT_TRACE_TYPE_OPTICAL_IO_WRITE_INIT = 59_u32
  EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH_INIT = 60_u32
  EVENT_TRACE_TYPE_FLT_PREOP_INIT = 96_u32
  EVENT_TRACE_TYPE_FLT_POSTOP_INIT = 97_u32
  EVENT_TRACE_TYPE_FLT_PREOP_COMPLETION = 98_u32
  EVENT_TRACE_TYPE_FLT_POSTOP_COMPLETION = 99_u32
  EVENT_TRACE_TYPE_FLT_PREOP_FAILURE = 100_u32
  EVENT_TRACE_TYPE_FLT_POSTOP_FAILURE = 101_u32
  EVENT_TRACE_FLAG_DEBUG_EVENTS = 4194304_u32
  EVENT_TRACE_FLAG_EXTENSION = 2147483648_u32
  EVENT_TRACE_FLAG_FORWARD_WMI = 1073741824_u32
  EVENT_TRACE_FLAG_ENABLE_RESERVE = 536870912_u32
  EVENT_TRACE_FILE_MODE_NONE = 0_u32
  EVENT_TRACE_FILE_MODE_SEQUENTIAL = 1_u32
  EVENT_TRACE_FILE_MODE_CIRCULAR = 2_u32
  EVENT_TRACE_FILE_MODE_APPEND = 4_u32
  EVENT_TRACE_REAL_TIME_MODE = 256_u32
  EVENT_TRACE_DELAY_OPEN_FILE_MODE = 512_u32
  EVENT_TRACE_BUFFERING_MODE = 1024_u32
  EVENT_TRACE_PRIVATE_LOGGER_MODE = 2048_u32
  EVENT_TRACE_ADD_HEADER_MODE = 4096_u32
  EVENT_TRACE_USE_GLOBAL_SEQUENCE = 16384_u32
  EVENT_TRACE_USE_LOCAL_SEQUENCE = 32768_u32
  EVENT_TRACE_RELOG_MODE = 65536_u32
  EVENT_TRACE_USE_PAGED_MEMORY = 16777216_u32
  EVENT_TRACE_FILE_MODE_NEWFILE = 8_u32
  EVENT_TRACE_FILE_MODE_PREALLOCATE = 32_u32
  EVENT_TRACE_NONSTOPPABLE_MODE = 64_u32
  EVENT_TRACE_SECURE_MODE = 128_u32
  EVENT_TRACE_USE_KBYTES_FOR_SIZE = 8192_u32
  EVENT_TRACE_PRIVATE_IN_PROC = 131072_u32
  EVENT_TRACE_MODE_RESERVED = 1048576_u32
  EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING = 268435456_u32
  EVENT_TRACE_SYSTEM_LOGGER_MODE = 33554432_u32
  EVENT_TRACE_ADDTO_TRIAGE_DUMP = 2147483648_u32
  EVENT_TRACE_STOP_ON_HYBRID_SHUTDOWN = 4194304_u32
  EVENT_TRACE_PERSIST_ON_HYBRID_SHUTDOWN = 8388608_u32
  EVENT_TRACE_INDEPENDENT_SESSION_MODE = 134217728_u32
  EVENT_TRACE_COMPRESSED_MODE = 67108864_u32
  EVENT_TRACE_CONTROL_INCREMENT_FILE = 4_u32
  EVENT_TRACE_CONTROL_CONVERT_TO_REALTIME = 5_u32
  TRACE_MESSAGE_PERFORMANCE_TIMESTAMP = 16_u32
  TRACE_MESSAGE_POINTER32 = 64_u32
  TRACE_MESSAGE_POINTER64 = 128_u32
  TRACE_MESSAGE_FLAG_MASK = 65535_u32
  EVENT_TRACE_USE_PROCTIME = 1_u32
  EVENT_TRACE_USE_NOCPUTIME = 2_u32
  TRACE_HEADER_FLAG_USE_TIMESTAMP = 512_u32
  TRACE_HEADER_FLAG_TRACED_GUID = 131072_u32
  TRACE_HEADER_FLAG_LOG_WNODE = 262144_u32
  TRACE_HEADER_FLAG_USE_GUID_PTR = 524288_u32
  TRACE_HEADER_FLAG_USE_MOF_PTR = 1048576_u32
  SYSTEM_ALPC_KW_GENERAL = 1_u64
  SYSTEM_CONFIG_KW_SYSTEM = 1_u64
  SYSTEM_CONFIG_KW_GRAPHICS = 2_u64
  SYSTEM_CONFIG_KW_STORAGE = 4_u64
  SYSTEM_CONFIG_KW_NETWORK = 8_u64
  SYSTEM_CONFIG_KW_SERVICES = 16_u64
  SYSTEM_CONFIG_KW_PNP = 32_u64
  SYSTEM_CONFIG_KW_OPTICAL = 64_u64
  SYSTEM_CPU_KW_CONFIG = 1_u64
  SYSTEM_CPU_KW_CACHE_FLUSH = 2_u64
  SYSTEM_CPU_KW_SPEC_CONTROL = 4_u64
  SYSTEM_HYPERVISOR_KW_PROFILE = 1_u64
  SYSTEM_HYPERVISOR_KW_CALLOUTS = 2_u64
  SYSTEM_HYPERVISOR_KW_VTL_CHANGE = 4_u64
  SYSTEM_INTERRUPT_KW_GENERAL = 1_u64
  SYSTEM_INTERRUPT_KW_CLOCK_INTERRUPT = 2_u64
  SYSTEM_INTERRUPT_KW_DPC = 4_u64
  SYSTEM_INTERRUPT_KW_DPC_QUEUE = 8_u64
  SYSTEM_INTERRUPT_KW_WDF_DPC = 16_u64
  SYSTEM_INTERRUPT_KW_WDF_INTERRUPT = 32_u64
  SYSTEM_INTERRUPT_KW_IPI = 64_u64
  SYSTEM_IO_KW_DISK = 1_u64
  SYSTEM_IO_KW_DISK_INIT = 2_u64
  SYSTEM_IO_KW_FILENAME = 4_u64
  SYSTEM_IO_KW_SPLIT = 8_u64
  SYSTEM_IO_KW_FILE = 16_u64
  SYSTEM_IO_KW_OPTICAL = 32_u64
  SYSTEM_IO_KW_OPTICAL_INIT = 64_u64
  SYSTEM_IO_KW_DRIVERS = 128_u64
  SYSTEM_IO_KW_CC = 256_u64
  SYSTEM_IO_KW_NETWORK = 512_u64
  SYSTEM_IOFILTER_KW_GENERAL = 1_u64
  SYSTEM_IOFILTER_KW_INIT = 2_u64
  SYSTEM_IOFILTER_KW_FASTIO = 4_u64
  SYSTEM_IOFILTER_KW_FAILURE = 8_u64
  SYSTEM_LOCK_KW_SPINLOCK = 1_u64
  SYSTEM_LOCK_KW_SPINLOCK_COUNTERS = 2_u64
  SYSTEM_LOCK_KW_SYNC_OBJECTS = 4_u64
  SYSTEM_MEMORY_KW_GENERAL = 1_u64
  SYSTEM_MEMORY_KW_HARD_FAULTS = 2_u64
  SYSTEM_MEMORY_KW_ALL_FAULTS = 4_u64
  SYSTEM_MEMORY_KW_POOL = 8_u64
  SYSTEM_MEMORY_KW_MEMINFO = 16_u64
  SYSTEM_MEMORY_KW_PFSECTION = 32_u64
  SYSTEM_MEMORY_KW_MEMINFO_WS = 64_u64
  SYSTEM_MEMORY_KW_HEAP = 128_u64
  SYSTEM_MEMORY_KW_WS = 256_u64
  SYSTEM_MEMORY_KW_CONTMEM_GEN = 512_u64
  SYSTEM_MEMORY_KW_VIRTUAL_ALLOC = 1024_u64
  SYSTEM_MEMORY_KW_FOOTPRINT = 2048_u64
  SYSTEM_MEMORY_KW_SESSION = 4096_u64
  SYSTEM_MEMORY_KW_REFSET = 8192_u64
  SYSTEM_MEMORY_KW_VAMAP = 16384_u64
  SYSTEM_MEMORY_KW_NONTRADEABLE = 32768_u64
  SYSTEM_OBJECT_KW_GENERAL = 1_u64
  SYSTEM_OBJECT_KW_HANDLE = 2_u64
  SYSTEM_POWER_KW_GENERAL = 1_u64
  SYSTEM_POWER_KW_HIBER_RUNDOWN = 2_u64
  SYSTEM_POWER_KW_PROCESSOR_IDLE = 4_u64
  SYSTEM_POWER_KW_IDLE_SELECTION = 8_u64
  SYSTEM_POWER_KW_PPM_EXIT_LATENCY = 16_u64
  SYSTEM_PROCESS_KW_GENERAL = 1_u64
  SYSTEM_PROCESS_KW_INSWAP = 2_u64
  SYSTEM_PROCESS_KW_FREEZE = 4_u64
  SYSTEM_PROCESS_KW_PERF_COUNTER = 8_u64
  SYSTEM_PROCESS_KW_WAKE_COUNTER = 16_u64
  SYSTEM_PROCESS_KW_WAKE_DROP = 32_u64
  SYSTEM_PROCESS_KW_WAKE_EVENT = 64_u64
  SYSTEM_PROCESS_KW_DEBUG_EVENTS = 128_u64
  SYSTEM_PROCESS_KW_DBGPRINT = 256_u64
  SYSTEM_PROCESS_KW_JOB = 512_u64
  SYSTEM_PROCESS_KW_WORKER_THREAD = 1024_u64
  SYSTEM_PROCESS_KW_THREAD = 2048_u64
  SYSTEM_PROCESS_KW_LOADER = 4096_u64
  SYSTEM_PROFILE_KW_GENERAL = 1_u64
  SYSTEM_PROFILE_KW_PMC_PROFILE = 2_u64
  SYSTEM_REGISTRY_KW_GENERAL = 1_u64
  SYSTEM_REGISTRY_KW_HIVE = 2_u64
  SYSTEM_REGISTRY_KW_NOTIFICATION = 4_u64
  SYSTEM_SCHEDULER_KW_XSCHEDULER = 1_u64
  SYSTEM_SCHEDULER_KW_DISPATCHER = 2_u64
  SYSTEM_SCHEDULER_KW_KERNEL_QUEUE = 4_u64
  SYSTEM_SCHEDULER_KW_SHOULD_YIELD = 8_u64
  SYSTEM_SCHEDULER_KW_ANTI_STARVATION = 16_u64
  SYSTEM_SCHEDULER_KW_LOAD_BALANCER = 32_u64
  SYSTEM_SCHEDULER_KW_AFFINITY = 64_u64
  SYSTEM_SCHEDULER_KW_PRIORITY = 128_u64
  SYSTEM_SCHEDULER_KW_IDEAL_PROCESSOR = 256_u64
  SYSTEM_SCHEDULER_KW_CONTEXT_SWITCH = 512_u64
  SYSTEM_SCHEDULER_KW_COMPACT_CSWITCH = 1024_u64
  SYSTEM_SYSCALL_KW_GENERAL = 1_u64
  SYSTEM_TIMER_KW_GENERAL = 1_u64
  SYSTEM_TIMER_KW_CLOCK_TIMER = 2_u64
  SYSTEM_MEMORY_POOL_FILTER_ID = 1_u32
  ETW_NULL_TYPE_VALUE = 0_u32
  ETW_OBJECT_TYPE_VALUE = 1_u32
  ETW_STRING_TYPE_VALUE = 2_u32
  ETW_SBYTE_TYPE_VALUE = 3_u32
  ETW_BYTE_TYPE_VALUE = 4_u32
  ETW_INT16_TYPE_VALUE = 5_u32
  ETW_UINT16_TYPE_VALUE = 6_u32
  ETW_INT32_TYPE_VALUE = 7_u32
  ETW_UINT32_TYPE_VALUE = 8_u32
  ETW_INT64_TYPE_VALUE = 9_u32
  ETW_UINT64_TYPE_VALUE = 10_u32
  ETW_CHAR_TYPE_VALUE = 11_u32
  ETW_SINGLE_TYPE_VALUE = 12_u32
  ETW_DOUBLE_TYPE_VALUE = 13_u32
  ETW_BOOLEAN_TYPE_VALUE = 14_u32
  ETW_DECIMAL_TYPE_VALUE = 15_u32
  ETW_GUID_TYPE_VALUE = 101_u32
  ETW_ASCIICHAR_TYPE_VALUE = 102_u32
  ETW_ASCIISTRING_TYPE_VALUE = 103_u32
  ETW_COUNTED_STRING_TYPE_VALUE = 104_u32
  ETW_POINTER_TYPE_VALUE = 105_u32
  ETW_SIZET_TYPE_VALUE = 106_u32
  ETW_HIDDEN_TYPE_VALUE = 107_u32
  ETW_BOOL_TYPE_VALUE = 108_u32
  ETW_COUNTED_ANSISTRING_TYPE_VALUE = 109_u32
  ETW_REVERSED_COUNTED_STRING_TYPE_VALUE = 110_u32
  ETW_REVERSED_COUNTED_ANSISTRING_TYPE_VALUE = 111_u32
  ETW_NON_NULL_TERMINATED_STRING_TYPE_VALUE = 112_u32
  ETW_REDUCED_ANSISTRING_TYPE_VALUE = 113_u32
  ETW_REDUCED_STRING_TYPE_VALUE = 114_u32
  ETW_SID_TYPE_VALUE = 115_u32
  ETW_VARIANT_TYPE_VALUE = 116_u32
  ETW_PTVECTOR_TYPE_VALUE = 117_u32
  ETW_WMITIME_TYPE_VALUE = 118_u32
  ETW_DATETIME_TYPE_VALUE = 119_u32
  ETW_REFRENCE_TYPE_VALUE = 120_u32
  TRACE_PROVIDER_FLAG_LEGACY = 1_u32
  TRACE_PROVIDER_FLAG_PRE_ENABLE = 2_u32
  KERNEL_LOGGER_NAME = "NT Kernel Logger"
  GLOBAL_LOGGER_NAME = "GlobalLogger"
  EVENT_LOGGER_NAME = "EventLog"
  ENABLE_TRACE_PARAMETERS_VERSION = 1_u32
  ENABLE_TRACE_PARAMETERS_VERSION_2 = 2_u32
  EVENT_MIN_LEVEL = 0_u32
  EVENT_MAX_LEVEL = 255_u32
  EVENT_ACTIVITY_CTRL_GET_ID = 1_u32
  EVENT_ACTIVITY_CTRL_SET_ID = 2_u32
  EVENT_ACTIVITY_CTRL_CREATE_ID = 3_u32
  EVENT_ACTIVITY_CTRL_GET_SET_ID = 4_u32
  EVENT_ACTIVITY_CTRL_CREATE_SET_ID = 5_u32
  MAX_EVENT_DATA_DESCRIPTORS = 128_u32
  MAX_EVENT_FILTER_DATA_SIZE = 1024_u32
  MAX_EVENT_FILTER_PAYLOAD_SIZE = 4096_u32
  MAX_EVENT_FILTER_EVENT_NAME_SIZE = 4096_u32
  MAX_EVENT_FILTERS_COUNT = 13_u32
  MAX_EVENT_FILTER_PID_COUNT = 8_u32
  MAX_EVENT_FILTER_EVENT_ID_COUNT = 64_u32
  EVENT_FILTER_TYPE_NONE = 0_u32
  EVENT_FILTER_TYPE_SCHEMATIZED = 2147483648_u32
  EVENT_FILTER_TYPE_SYSTEM_FLAGS = 2147483649_u32
  EVENT_FILTER_TYPE_TRACEHANDLE = 2147483650_u32
  EVENT_FILTER_TYPE_PID = 2147483652_u32
  EVENT_FILTER_TYPE_EXECUTABLE_NAME = 2147483656_u32
  EVENT_FILTER_TYPE_PACKAGE_ID = 2147483664_u32
  EVENT_FILTER_TYPE_PACKAGE_APP_ID = 2147483680_u32
  EVENT_FILTER_TYPE_PAYLOAD = 2147483904_u32
  EVENT_FILTER_TYPE_EVENT_ID = 2147484160_u32
  EVENT_FILTER_TYPE_EVENT_NAME = 2147484672_u32
  EVENT_FILTER_TYPE_STACKWALK = 2147487744_u32
  EVENT_FILTER_TYPE_STACKWALK_NAME = 2147491840_u32
  EVENT_FILTER_TYPE_STACKWALK_LEVEL_KW = 2147500032_u32
  EVENT_FILTER_TYPE_CONTAINER = 2147516416_u32
  EVENT_DATA_DESCRIPTOR_TYPE_NONE = 0_u32
  EVENT_DATA_DESCRIPTOR_TYPE_EVENT_METADATA = 1_u32
  EVENT_DATA_DESCRIPTOR_TYPE_PROVIDER_METADATA = 2_u32
  EVENT_DATA_DESCRIPTOR_TYPE_TIMESTAMP_OVERRIDE = 3_u32
  EVENT_WRITE_FLAG_NO_FAULTING = 1_u32
  EVENT_WRITE_FLAG_INPRIVATE = 2_u32
  EVENT_HEADER_EXT_TYPE_RELATED_ACTIVITYID = 1_u32
  EVENT_HEADER_EXT_TYPE_SID = 2_u32
  EVENT_HEADER_EXT_TYPE_TS_ID = 3_u32
  EVENT_HEADER_EXT_TYPE_INSTANCE_INFO = 4_u32
  EVENT_HEADER_EXT_TYPE_STACK_TRACE32 = 5_u32
  EVENT_HEADER_EXT_TYPE_STACK_TRACE64 = 6_u32
  EVENT_HEADER_EXT_TYPE_PEBS_INDEX = 7_u32
  EVENT_HEADER_EXT_TYPE_PMC_COUNTERS = 8_u32
  EVENT_HEADER_EXT_TYPE_PSM_KEY = 9_u32
  EVENT_HEADER_EXT_TYPE_EVENT_KEY = 10_u32
  EVENT_HEADER_EXT_TYPE_EVENT_SCHEMA_TL = 11_u32
  EVENT_HEADER_EXT_TYPE_PROV_TRAITS = 12_u32
  EVENT_HEADER_EXT_TYPE_PROCESS_START_KEY = 13_u32
  EVENT_HEADER_EXT_TYPE_CONTROL_GUID = 14_u32
  EVENT_HEADER_EXT_TYPE_QPC_DELTA = 15_u32
  EVENT_HEADER_EXT_TYPE_CONTAINER_ID = 16_u32
  EVENT_HEADER_EXT_TYPE_STACK_KEY32 = 17_u32
  EVENT_HEADER_EXT_TYPE_STACK_KEY64 = 18_u32
  EVENT_HEADER_EXT_TYPE_MAX = 19_u32
  EVENT_HEADER_PROPERTY_XML = 1_u32
  EVENT_HEADER_PROPERTY_FORWARDED_XML = 2_u32
  EVENT_HEADER_PROPERTY_LEGACY_EVENTLOG = 4_u32
  EVENT_HEADER_PROPERTY_RELOGGABLE = 8_u32
  EVENT_HEADER_FLAG_EXTENDED_INFO = 1_u32
  EVENT_HEADER_FLAG_PRIVATE_SESSION = 2_u32
  EVENT_HEADER_FLAG_STRING_ONLY = 4_u32
  EVENT_HEADER_FLAG_TRACE_MESSAGE = 8_u32
  EVENT_HEADER_FLAG_NO_CPUTIME = 16_u32
  EVENT_HEADER_FLAG_32_BIT_HEADER = 32_u32
  EVENT_HEADER_FLAG_64_BIT_HEADER = 64_u32
  EVENT_HEADER_FLAG_DECODE_GUID = 128_u32
  EVENT_HEADER_FLAG_CLASSIC_HEADER = 256_u32
  EVENT_HEADER_FLAG_PROCESSOR_INDEX = 512_u32
  EVENT_ENABLE_PROPERTY_SID = 1_u32
  EVENT_ENABLE_PROPERTY_TS_ID = 2_u32
  EVENT_ENABLE_PROPERTY_STACK_TRACE = 4_u32
  EVENT_ENABLE_PROPERTY_PSM_KEY = 8_u32
  EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0 = 16_u32
  EVENT_ENABLE_PROPERTY_PROVIDER_GROUP = 32_u32
  EVENT_ENABLE_PROPERTY_ENABLE_KEYWORD_0 = 64_u32
  EVENT_ENABLE_PROPERTY_PROCESS_START_KEY = 128_u32
  EVENT_ENABLE_PROPERTY_EVENT_KEY = 256_u32
  EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE = 512_u32
  EVENT_ENABLE_PROPERTY_ENABLE_SILOS = 1024_u32
  EVENT_ENABLE_PROPERTY_SOURCE_CONTAINER_TRACKING = 2048_u32
  PROCESS_TRACE_MODE_REAL_TIME = 256_u32
  PROCESS_TRACE_MODE_RAW_TIMESTAMP = 4096_u32
  PROCESS_TRACE_MODE_EVENT_RECORD = 268435456_u32
  CLSID_TraceRelogger = "7b40792d-05ff-44c4-9058-f440c71f17d4"

  CLSID_CTraceRelogger = LibC::GUID.new(0x7b40792d_u32, 0x5ff_u16, 0x44c4_u16, StaticArray[0x90_u8, 0x58_u8, 0xf4_u8, 0x40_u8, 0xc7_u8, 0x1f_u8, 0x17_u8, 0xd4_u8])

  @[Flags]
  enum TRACE_MESSAGE_FLAGS : UInt32
    TRACE_MESSAGE_COMPONENTID = 4_u32
    TRACE_MESSAGE_GUID = 2_u32
    TRACE_MESSAGE_SEQUENCE = 1_u32
    TRACE_MESSAGE_SYSTEMINFO = 32_u32
    TRACE_MESSAGE_TIMESTAMP = 8_u32
  end
  enum ENABLECALLBACK_ENABLED_STATE : UInt32
    EVENT_CONTROL_CODE_DISABLE_PROVIDER = 0_u32
    EVENT_CONTROL_CODE_ENABLE_PROVIDER = 1_u32
    EVENT_CONTROL_CODE_CAPTURE_STATE = 2_u32
  end
  enum EVENT_TRACE_CONTROL : UInt32
    EVENT_TRACE_CONTROL_FLUSH = 3_u32
    EVENT_TRACE_CONTROL_QUERY = 0_u32
    EVENT_TRACE_CONTROL_STOP = 1_u32
    EVENT_TRACE_CONTROL_UPDATE = 2_u32
  end
  @[Flags]
  enum EVENT_TRACE_FLAG : UInt32
    EVENT_TRACE_FLAG_ALPC = 1048576_u32
    EVENT_TRACE_FLAG_CSWITCH = 16_u32
    EVENT_TRACE_FLAG_DBGPRINT = 262144_u32
    EVENT_TRACE_FLAG_DISK_FILE_IO = 512_u32
    EVENT_TRACE_FLAG_DISK_IO = 256_u32
    EVENT_TRACE_FLAG_DISK_IO_INIT = 1024_u32
    EVENT_TRACE_FLAG_DISPATCHER = 2048_u32
    EVENT_TRACE_FLAG_DPC = 32_u32
    EVENT_TRACE_FLAG_DRIVER = 8388608_u32
    EVENT_TRACE_FLAG_FILE_IO = 33554432_u32
    EVENT_TRACE_FLAG_FILE_IO_INIT = 67108864_u32
    EVENT_TRACE_FLAG_IMAGE_LOAD = 4_u32
    EVENT_TRACE_FLAG_INTERRUPT = 64_u32
    EVENT_TRACE_FLAG_JOB = 524288_u32
    EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS = 8192_u32
    EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS = 4096_u32
    EVENT_TRACE_FLAG_NETWORK_TCPIP = 65536_u32
    EVENT_TRACE_FLAG_NO_SYSCONFIG = 268435456_u32
    EVENT_TRACE_FLAG_PROCESS = 1_u32
    EVENT_TRACE_FLAG_PROCESS_COUNTERS = 8_u32
    EVENT_TRACE_FLAG_PROFILE = 16777216_u32
    EVENT_TRACE_FLAG_REGISTRY = 131072_u32
    EVENT_TRACE_FLAG_SPLIT_IO = 2097152_u32
    EVENT_TRACE_FLAG_SYSTEMCALL = 128_u32
    EVENT_TRACE_FLAG_THREAD = 2_u32
    EVENT_TRACE_FLAG_VAMAP = 32768_u32
    EVENT_TRACE_FLAG_VIRTUAL_ALLOC = 16384_u32
  end
  enum WMIDPREQUESTCODE
    WMI_GET_ALL_DATA = 0_i32
    WMI_GET_SINGLE_INSTANCE = 1_i32
    WMI_SET_SINGLE_INSTANCE = 2_i32
    WMI_SET_SINGLE_ITEM = 3_i32
    WMI_ENABLE_EVENTS = 4_i32
    WMI_DISABLE_EVENTS = 5_i32
    WMI_ENABLE_COLLECTION = 6_i32
    WMI_DISABLE_COLLECTION = 7_i32
    WMI_REGINFO = 8_i32
    WMI_EXECUTE_METHOD = 9_i32
    WMI_CAPTURE_STATE = 10_i32
  end
  enum ETW_COMPRESSION_RESUMPTION_MODE
    EtwCompressionModeRestart = 0_i32
    EtwCompressionModeNoDisable = 1_i32
    EtwCompressionModeNoRestart = 2_i32
  end
  enum ETW_PMC_COUNTER_OWNER_TYPE
    EtwPmcOwnerFree = 0_i32
    EtwPmcOwnerUntagged = 1_i32
    EtwPmcOwnerTagged = 2_i32
    EtwPmcOwnerTaggedWithSource = 3_i32
  end
  enum TRACE_QUERY_INFO_CLASS
    TraceGuidQueryList = 0_i32
    TraceGuidQueryInfo = 1_i32
    TraceGuidQueryProcess = 2_i32
    TraceStackTracingInfo = 3_i32
    TraceSystemTraceEnableFlagsInfo = 4_i32
    TraceSampledProfileIntervalInfo = 5_i32
    TraceProfileSourceConfigInfo = 6_i32
    TraceProfileSourceListInfo = 7_i32
    TracePmcEventListInfo = 8_i32
    TracePmcCounterListInfo = 9_i32
    TraceSetDisallowList = 10_i32
    TraceVersionInfo = 11_i32
    TraceGroupQueryList = 12_i32
    TraceGroupQueryInfo = 13_i32
    TraceDisallowListQuery = 14_i32
    TraceInfoReserved15 = 15_i32
    TracePeriodicCaptureStateListInfo = 16_i32
    TracePeriodicCaptureStateInfo = 17_i32
    TraceProviderBinaryTracking = 18_i32
    TraceMaxLoggersQuery = 19_i32
    TraceLbrConfigurationInfo = 20_i32
    TraceLbrEventListInfo = 21_i32
    TraceMaxPmcCounterQuery = 22_i32
    TraceStreamCount = 23_i32
    TraceStackCachingInfo = 24_i32
    TracePmcCounterOwners = 25_i32
    TraceUnifiedStackCachingInfo = 26_i32
    MaxTraceSetInfoClass = 27_i32
  end
  enum ETW_PROCESS_HANDLE_INFO_TYPE
    EtwQueryPartitionInformation = 1_i32
    EtwQueryPartitionInformationV2 = 2_i32
    EtwQueryLastDroppedTimes = 3_i32
    EtwQueryProcessHandleInfoMax = 4_i32
  end
  enum EVENT_INFO_CLASS
    EventProviderBinaryTrackInfo = 0_i32
    EventProviderSetReserved1 = 1_i32
    EventProviderSetTraits = 2_i32
    EventProviderUseDescriptorType = 3_i32
    MaxEventInfo = 4_i32
  end
  enum ETW_PROVIDER_TRAIT_TYPE
    EtwProviderTraitTypeGroup = 1_i32
    EtwProviderTraitDecodeGuid = 2_i32
    EtwProviderTraitTypeMax = 3_i32
  end
  enum EVENTSECURITYOPERATION
    EventSecuritySetDACL = 0_i32
    EventSecuritySetSACL = 1_i32
    EventSecurityAddDACL = 2_i32
    EventSecurityAddSACL = 3_i32
    EventSecurityMax = 4_i32
  end
  enum MAP_FLAGS
    EVENTMAP_INFO_FLAG_MANIFEST_VALUEMAP = 1_i32
    EVENTMAP_INFO_FLAG_MANIFEST_BITMAP = 2_i32
    EVENTMAP_INFO_FLAG_MANIFEST_PATTERNMAP = 4_i32
    EVENTMAP_INFO_FLAG_WBEM_VALUEMAP = 8_i32
    EVENTMAP_INFO_FLAG_WBEM_BITMAP = 16_i32
    EVENTMAP_INFO_FLAG_WBEM_FLAG = 32_i32
    EVENTMAP_INFO_FLAG_WBEM_NO_MAP = 64_i32
  end
  enum MAP_VALUETYPE
    EVENTMAP_ENTRY_VALUETYPE_ULONG = 0_i32
    EVENTMAP_ENTRY_VALUETYPE_STRING = 1_i32
  end
  enum TDH_IN_TYPE_
    TDH_INTYPE_NULL = 0_i32
    TDH_INTYPE_UNICODESTRING = 1_i32
    TDH_INTYPE_ANSISTRING = 2_i32
    TDH_INTYPE_INT8 = 3_i32
    TDH_INTYPE_UINT8 = 4_i32
    TDH_INTYPE_INT16 = 5_i32
    TDH_INTYPE_UINT16 = 6_i32
    TDH_INTYPE_INT32 = 7_i32
    TDH_INTYPE_UINT32 = 8_i32
    TDH_INTYPE_INT64 = 9_i32
    TDH_INTYPE_UINT64 = 10_i32
    TDH_INTYPE_FLOAT = 11_i32
    TDH_INTYPE_DOUBLE = 12_i32
    TDH_INTYPE_BOOLEAN = 13_i32
    TDH_INTYPE_BINARY = 14_i32
    TDH_INTYPE_GUID = 15_i32
    TDH_INTYPE_POINTER = 16_i32
    TDH_INTYPE_FILETIME = 17_i32
    TDH_INTYPE_SYSTEMTIME = 18_i32
    TDH_INTYPE_SID = 19_i32
    TDH_INTYPE_HEXINT32 = 20_i32
    TDH_INTYPE_HEXINT64 = 21_i32
    TDH_INTYPE_MANIFEST_COUNTEDSTRING = 22_i32
    TDH_INTYPE_MANIFEST_COUNTEDANSISTRING = 23_i32
    TDH_INTYPE_RESERVED24 = 24_i32
    TDH_INTYPE_MANIFEST_COUNTEDBINARY = 25_i32
    TDH_INTYPE_COUNTEDSTRING = 300_i32
    TDH_INTYPE_COUNTEDANSISTRING = 301_i32
    TDH_INTYPE_REVERSEDCOUNTEDSTRING = 302_i32
    TDH_INTYPE_REVERSEDCOUNTEDANSISTRING = 303_i32
    TDH_INTYPE_NONNULLTERMINATEDSTRING = 304_i32
    TDH_INTYPE_NONNULLTERMINATEDANSISTRING = 305_i32
    TDH_INTYPE_UNICODECHAR = 306_i32
    TDH_INTYPE_ANSICHAR = 307_i32
    TDH_INTYPE_SIZET = 308_i32
    TDH_INTYPE_HEXDUMP = 309_i32
    TDH_INTYPE_WBEMSID = 310_i32
  end
  enum TDH_OUT_TYPE_
    TDH_OUTTYPE_NULL = 0_i32
    TDH_OUTTYPE_STRING = 1_i32
    TDH_OUTTYPE_DATETIME = 2_i32
    TDH_OUTTYPE_BYTE = 3_i32
    TDH_OUTTYPE_UNSIGNEDBYTE = 4_i32
    TDH_OUTTYPE_SHORT = 5_i32
    TDH_OUTTYPE_UNSIGNEDSHORT = 6_i32
    TDH_OUTTYPE_INT = 7_i32
    TDH_OUTTYPE_UNSIGNEDINT = 8_i32
    TDH_OUTTYPE_LONG = 9_i32
    TDH_OUTTYPE_UNSIGNEDLONG = 10_i32
    TDH_OUTTYPE_FLOAT = 11_i32
    TDH_OUTTYPE_DOUBLE = 12_i32
    TDH_OUTTYPE_BOOLEAN = 13_i32
    TDH_OUTTYPE_GUID = 14_i32
    TDH_OUTTYPE_HEXBINARY = 15_i32
    TDH_OUTTYPE_HEXINT8 = 16_i32
    TDH_OUTTYPE_HEXINT16 = 17_i32
    TDH_OUTTYPE_HEXINT32 = 18_i32
    TDH_OUTTYPE_HEXINT64 = 19_i32
    TDH_OUTTYPE_PID = 20_i32
    TDH_OUTTYPE_TID = 21_i32
    TDH_OUTTYPE_PORT = 22_i32
    TDH_OUTTYPE_IPV4 = 23_i32
    TDH_OUTTYPE_IPV6 = 24_i32
    TDH_OUTTYPE_SOCKETADDRESS = 25_i32
    TDH_OUTTYPE_CIMDATETIME = 26_i32
    TDH_OUTTYPE_ETWTIME = 27_i32
    TDH_OUTTYPE_XML = 28_i32
    TDH_OUTTYPE_ERRORCODE = 29_i32
    TDH_OUTTYPE_WIN32ERROR = 30_i32
    TDH_OUTTYPE_NTSTATUS = 31_i32
    TDH_OUTTYPE_HRESULT = 32_i32
    TDH_OUTTYPE_CULTURE_INSENSITIVE_DATETIME = 33_i32
    TDH_OUTTYPE_JSON = 34_i32
    TDH_OUTTYPE_UTF8 = 35_i32
    TDH_OUTTYPE_PKCS7_WITH_TYPE_INFO = 36_i32
    TDH_OUTTYPE_CODE_POINTER = 37_i32
    TDH_OUTTYPE_DATETIME_UTC = 38_i32
    TDH_OUTTYPE_REDUCEDSTRING = 300_i32
    TDH_OUTTYPE_NOPRINT = 301_i32
  end
  enum PROPERTY_FLAGS
    PropertyStruct = 1_i32
    PropertyParamLength = 2_i32
    PropertyParamCount = 4_i32
    PropertyWBEMXmlFragment = 8_i32
    PropertyParamFixedLength = 16_i32
    PropertyParamFixedCount = 32_i32
    PropertyHasTags = 64_i32
    PropertyHasCustomSchema = 128_i32
  end
  enum DECODING_SOURCE
    DecodingSourceXMLFile = 0_i32
    DecodingSourceWbem = 1_i32
    DecodingSourceWPP = 2_i32
    DecodingSourceTlg = 3_i32
    DecodingSourceMax = 4_i32
  end
  enum TEMPLATE_FLAGS
    TEMPLATE_EVENT_DATA = 1_i32
    TEMPLATE_USER_DATA = 2_i32
    TEMPLATE_CONTROL_GUID = 4_i32
  end
  enum PAYLOAD_OPERATOR
    PAYLOADFIELD_EQ = 0_i32
    PAYLOADFIELD_NE = 1_i32
    PAYLOADFIELD_LE = 2_i32
    PAYLOADFIELD_GT = 3_i32
    PAYLOADFIELD_LT = 4_i32
    PAYLOADFIELD_GE = 5_i32
    PAYLOADFIELD_BETWEEN = 6_i32
    PAYLOADFIELD_NOTBETWEEN = 7_i32
    PAYLOADFIELD_MODULO = 8_i32
    PAYLOADFIELD_CONTAINS = 20_i32
    PAYLOADFIELD_DOESNTCONTAIN = 21_i32
    PAYLOADFIELD_IS = 30_i32
    PAYLOADFIELD_ISNOT = 31_i32
    PAYLOADFIELD_INVALID = 32_i32
  end
  enum EVENT_FIELD_TYPE
    EventKeywordInformation = 0_i32
    EventLevelInformation = 1_i32
    EventChannelInformation = 2_i32
    EventTaskInformation = 3_i32
    EventOpcodeInformation = 4_i32
    EventInformationMax = 5_i32
  end
  enum TDH_CONTEXT_TYPE
    TDH_CONTEXT_WPP_TMFFILE = 0_i32
    TDH_CONTEXT_WPP_TMFSEARCHPATH = 1_i32
    TDH_CONTEXT_WPP_GMT = 2_i32
    TDH_CONTEXT_POINTERSIZE = 3_i32
    TDH_CONTEXT_PDB_PATH = 4_i32
    TDH_CONTEXT_MAXIMUM = 5_i32
  end

  @[Extern]
  struct WNODE_HEADER
    property buffer_size : UInt32
    property provider_id : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property guid : LibC::GUID
    property client_context : UInt32
    property flags : UInt32

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property count_lost : UInt32
    property kernel_handle : Win32cr::Foundation::HANDLE
    property time_stamp : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@count_lost : UInt32, @kernel_handle : Win32cr::Foundation::HANDLE, @time_stamp : Win32cr::Foundation::LARGE_INTEGER)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property historical_context : UInt64
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property version : UInt32
    property linkage : UInt32
    def initialize(@version : UInt32, @linkage : UInt32)
    end
      end

    def initialize(@historical_context : UInt64, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@buffer_size : UInt32, @provider_id : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @guid : LibC::GUID, @client_context : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct OFFSETINSTANCEDATAANDLENGTH
    property offset_instance_data : UInt32
    property length_instance_data : UInt32
    def initialize(@offset_instance_data : UInt32, @length_instance_data : UInt32)
    end
  end

  @[Extern]
  struct WNODE_ALL_DATA
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property data_block_offset : UInt32
    property instance_count : UInt32
    property offset_instance_name_offsets : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property fixed_instance_size : UInt32
    property offset_instance_data_and_length : Win32cr::System::Diagnostics::Etw::OFFSETINSTANCEDATAANDLENGTH*
    def initialize(@fixed_instance_size : UInt32, @offset_instance_data_and_length : Win32cr::System::Diagnostics::Etw::OFFSETINSTANCEDATAANDLENGTH*)
    end
    end

    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @data_block_offset : UInt32, @instance_count : UInt32, @offset_instance_name_offsets : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WNODE_SINGLE_INSTANCE
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property offset_instance_name : UInt32
    property instance_index : UInt32
    property data_block_offset : UInt32
    property size_data_block : UInt32
    property variable_data : UInt8*
    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @offset_instance_name : UInt32, @instance_index : UInt32, @data_block_offset : UInt32, @size_data_block : UInt32, @variable_data : UInt8*)
    end
  end

  @[Extern]
  struct WNODE_SINGLE_ITEM
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property offset_instance_name : UInt32
    property instance_index : UInt32
    property item_id : UInt32
    property data_block_offset : UInt32
    property size_data_item : UInt32
    property variable_data : UInt8*
    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @offset_instance_name : UInt32, @instance_index : UInt32, @item_id : UInt32, @data_block_offset : UInt32, @size_data_item : UInt32, @variable_data : UInt8*)
    end
  end

  @[Extern]
  struct WNODE_METHOD_ITEM
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property offset_instance_name : UInt32
    property instance_index : UInt32
    property method_id : UInt32
    property data_block_offset : UInt32
    property size_data_block : UInt32
    property variable_data : UInt8*
    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @offset_instance_name : UInt32, @instance_index : UInt32, @method_id : UInt32, @data_block_offset : UInt32, @size_data_block : UInt32, @variable_data : UInt8*)
    end
  end

  @[Extern]
  struct WNODE_EVENT_ITEM
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER)
    end
  end

  @[Extern]
  struct WNODE_EVENT_REFERENCE
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property target_guid : LibC::GUID
    property target_data_block_size : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property target_instance_index : UInt32
    property target_instance_name : UInt16*
    def initialize(@target_instance_index : UInt32, @target_instance_name : UInt16*)
    end
    end

    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @target_guid : LibC::GUID, @target_data_block_size : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WNODE_TOO_SMALL
    property wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property size_needed : UInt32
    def initialize(@wnode_header : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @size_needed : UInt32)
    end
  end

  @[Extern]
  struct WMIREGGUIDW
    property guid : LibC::GUID
    property flags : UInt32
    property instance_count : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property instance_name_list : UInt32
    property base_name_offset : UInt32
    property pdo : LibC::UIntPtrT
    property instance_info : LibC::UIntPtrT
    def initialize(@instance_name_list : UInt32, @base_name_offset : UInt32, @pdo : LibC::UIntPtrT, @instance_info : LibC::UIntPtrT)
    end
    end

    def initialize(@guid : LibC::GUID, @flags : UInt32, @instance_count : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WMIREGINFOW
    property buffer_size : UInt32
    property next_wmi_reg_info : UInt32
    property registry_path : UInt32
    property mof_resource_name : UInt32
    property guid_count : UInt32
    property wmi_reg_guid : Win32cr::System::Diagnostics::Etw::WMIREGGUIDW*
    def initialize(@buffer_size : UInt32, @next_wmi_reg_info : UInt32, @registry_path : UInt32, @mof_resource_name : UInt32, @guid_count : UInt32, @wmi_reg_guid : Win32cr::System::Diagnostics::Etw::WMIREGGUIDW*)
    end
  end

  @[Extern]
  struct EVENT_TRACE_HEADER
    property size : UInt16
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property thread_id : UInt32
    property process_id : UInt32
    property time_stamp : Win32cr::Foundation::LARGE_INTEGER
    property anonymous3 : Anonymous3_e__Union_
    property anonymous4 : Anonymous4_e__Union_

    # Nested Type Anonymous4_e__Union_
    @[Extern(union: true)]
    struct Anonymous4_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property processor_time : UInt64
    property anonymous2 : Anonymous2_e__Struct_

      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property client_context : UInt32
    property flags : UInt32
    def initialize(@client_context : UInt32, @flags : UInt32)
    end
      end


      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property kernel_time : UInt32
    property user_time : UInt32
    def initialize(@kernel_time : UInt32, @user_time : UInt32)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @processor_time : UInt64, @anonymous2 : Anonymous2_e__Struct_)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property version : UInt32
    property class__ : Class_e__Struct_

      # Nested Type Class_e__Struct_
      @[Extern]
      struct Class_e__Struct_
    property type__ : UInt8
    property level : UInt8
    property version : UInt16
    def initialize(@type__ : UInt8, @level : UInt8, @version : UInt16)
    end
      end

    def initialize(@version : UInt32, @class__ : Class_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property field_type_flags : UInt16
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property header_type : UInt8
    property marker_flags : UInt8
    def initialize(@header_type : UInt8, @marker_flags : UInt8)
    end
      end

    def initialize(@field_type_flags : UInt16, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property guid : LibC::GUID
    property guid_ptr : UInt64
    def initialize(@guid : LibC::GUID, @guid_ptr : UInt64)
    end
    end

    def initialize(@size : UInt16, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @thread_id : UInt32, @process_id : UInt32, @time_stamp : Win32cr::Foundation::LARGE_INTEGER, @anonymous3 : Anonymous3_e__Union_, @anonymous4 : Anonymous4_e__Union_)
    end
  end

  @[Extern]
  struct EVENT_INSTANCE_HEADER
    property size : UInt16
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property thread_id : UInt32
    property process_id : UInt32
    property time_stamp : Win32cr::Foundation::LARGE_INTEGER
    property reg_handle : UInt64
    property instance_id : UInt32
    property parent_instance_id : UInt32
    property anonymous3 : Anonymous3_e__Union_
    property parent_reg_handle : UInt64

    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property processor_time : UInt64
    property anonymous2 : Anonymous2_e__Struct_

      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property event_id : UInt32
    property flags : UInt32
    def initialize(@event_id : UInt32, @flags : UInt32)
    end
      end


      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property kernel_time : UInt32
    property user_time : UInt32
    def initialize(@kernel_time : UInt32, @user_time : UInt32)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @processor_time : UInt64, @anonymous2 : Anonymous2_e__Struct_)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property version : UInt32
    property class__ : Class_e__Struct_

      # Nested Type Class_e__Struct_
      @[Extern]
      struct Class_e__Struct_
    property type__ : UInt8
    property level : UInt8
    property version : UInt16
    def initialize(@type__ : UInt8, @level : UInt8, @version : UInt16)
    end
      end

    def initialize(@version : UInt32, @class__ : Class_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property field_type_flags : UInt16
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property header_type : UInt8
    property marker_flags : UInt8
    def initialize(@header_type : UInt8, @marker_flags : UInt8)
    end
      end

    def initialize(@field_type_flags : UInt16, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@size : UInt16, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @thread_id : UInt32, @process_id : UInt32, @time_stamp : Win32cr::Foundation::LARGE_INTEGER, @reg_handle : UInt64, @instance_id : UInt32, @parent_instance_id : UInt32, @anonymous3 : Anonymous3_e__Union_, @parent_reg_handle : UInt64)
    end
  end

  @[Extern]
  struct MOF_FIELD
    property data_ptr : UInt64
    property length : UInt32
    property data_type : UInt32
    def initialize(@data_ptr : UInt64, @length : UInt32, @data_type : UInt32)
    end
  end

  @[Extern]
  struct TRACE_LOGFILE_HEADER
    property buffer_size : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property provider_version : UInt32
    property number_of_processors : UInt32
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property timer_resolution : UInt32
    property maximum_file_size : UInt32
    property log_file_mode : UInt32
    property buffers_written : UInt32
    property anonymous2 : Anonymous2_e__Union_
    property logger_name : Win32cr::Foundation::PWSTR
    property log_file_name : Win32cr::Foundation::PWSTR
    property time_zone : Win32cr::System::Time::TIME_ZONE_INFORMATION
    property boot_time : Win32cr::Foundation::LARGE_INTEGER
    property perf_freq : Win32cr::Foundation::LARGE_INTEGER
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property reserved_flags : UInt32
    property buffers_lost : UInt32

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property log_instance_guid : LibC::GUID
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property start_buffers : UInt32
    property pointer_size : UInt32
    property events_lost : UInt32
    property cpu_speed_in_m_hz : UInt32
    def initialize(@start_buffers : UInt32, @pointer_size : UInt32, @events_lost : UInt32, @cpu_speed_in_m_hz : UInt32)
    end
      end

    def initialize(@log_instance_guid : LibC::GUID, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property version : UInt32
    property version_detail : VersionDetail_e__Struct_

      # Nested Type VersionDetail_e__Struct_
      @[Extern]
      struct VersionDetail_e__Struct_
    property major_version : UInt8
    property minor_version : UInt8
    property sub_version : UInt8
    property sub_minor_version : UInt8
    def initialize(@major_version : UInt8, @minor_version : UInt8, @sub_version : UInt8, @sub_minor_version : UInt8)
    end
      end

    def initialize(@version : UInt32, @version_detail : VersionDetail_e__Struct_)
    end
    end

    def initialize(@buffer_size : UInt32, @anonymous1 : Anonymous1_e__Union_, @provider_version : UInt32, @number_of_processors : UInt32, @end_time : Win32cr::Foundation::LARGE_INTEGER, @timer_resolution : UInt32, @maximum_file_size : UInt32, @log_file_mode : UInt32, @buffers_written : UInt32, @anonymous2 : Anonymous2_e__Union_, @logger_name : Win32cr::Foundation::PWSTR, @log_file_name : Win32cr::Foundation::PWSTR, @time_zone : Win32cr::System::Time::TIME_ZONE_INFORMATION, @boot_time : Win32cr::Foundation::LARGE_INTEGER, @perf_freq : Win32cr::Foundation::LARGE_INTEGER, @start_time : Win32cr::Foundation::LARGE_INTEGER, @reserved_flags : UInt32, @buffers_lost : UInt32)
    end
  end

  @[Extern]
  struct TRACE_LOGFILE_HEADER32
    property buffer_size : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property provider_version : UInt32
    property number_of_processors : UInt32
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property timer_resolution : UInt32
    property maximum_file_size : UInt32
    property log_file_mode : UInt32
    property buffers_written : UInt32
    property anonymous2 : Anonymous2_e__Union_
    property logger_name : UInt32
    property log_file_name : UInt32
    property time_zone : Win32cr::System::Time::TIME_ZONE_INFORMATION
    property boot_time : Win32cr::Foundation::LARGE_INTEGER
    property perf_freq : Win32cr::Foundation::LARGE_INTEGER
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property reserved_flags : UInt32
    property buffers_lost : UInt32

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property log_instance_guid : LibC::GUID
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property start_buffers : UInt32
    property pointer_size : UInt32
    property events_lost : UInt32
    property cpu_speed_in_m_hz : UInt32
    def initialize(@start_buffers : UInt32, @pointer_size : UInt32, @events_lost : UInt32, @cpu_speed_in_m_hz : UInt32)
    end
      end

    def initialize(@log_instance_guid : LibC::GUID, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property version : UInt32
    property version_detail : VersionDetail_e__Struct_

      # Nested Type VersionDetail_e__Struct_
      @[Extern]
      struct VersionDetail_e__Struct_
    property major_version : UInt8
    property minor_version : UInt8
    property sub_version : UInt8
    property sub_minor_version : UInt8
    def initialize(@major_version : UInt8, @minor_version : UInt8, @sub_version : UInt8, @sub_minor_version : UInt8)
    end
      end

    def initialize(@version : UInt32, @version_detail : VersionDetail_e__Struct_)
    end
    end

    def initialize(@buffer_size : UInt32, @anonymous1 : Anonymous1_e__Union_, @provider_version : UInt32, @number_of_processors : UInt32, @end_time : Win32cr::Foundation::LARGE_INTEGER, @timer_resolution : UInt32, @maximum_file_size : UInt32, @log_file_mode : UInt32, @buffers_written : UInt32, @anonymous2 : Anonymous2_e__Union_, @logger_name : UInt32, @log_file_name : UInt32, @time_zone : Win32cr::System::Time::TIME_ZONE_INFORMATION, @boot_time : Win32cr::Foundation::LARGE_INTEGER, @perf_freq : Win32cr::Foundation::LARGE_INTEGER, @start_time : Win32cr::Foundation::LARGE_INTEGER, @reserved_flags : UInt32, @buffers_lost : UInt32)
    end
  end

  @[Extern]
  struct TRACE_LOGFILE_HEADER64
    property buffer_size : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property provider_version : UInt32
    property number_of_processors : UInt32
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property timer_resolution : UInt32
    property maximum_file_size : UInt32
    property log_file_mode : UInt32
    property buffers_written : UInt32
    property anonymous2 : Anonymous2_e__Union_
    property logger_name : UInt64
    property log_file_name : UInt64
    property time_zone : Win32cr::System::Time::TIME_ZONE_INFORMATION
    property boot_time : Win32cr::Foundation::LARGE_INTEGER
    property perf_freq : Win32cr::Foundation::LARGE_INTEGER
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property reserved_flags : UInt32
    property buffers_lost : UInt32

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property log_instance_guid : LibC::GUID
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property start_buffers : UInt32
    property pointer_size : UInt32
    property events_lost : UInt32
    property cpu_speed_in_m_hz : UInt32
    def initialize(@start_buffers : UInt32, @pointer_size : UInt32, @events_lost : UInt32, @cpu_speed_in_m_hz : UInt32)
    end
      end

    def initialize(@log_instance_guid : LibC::GUID, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property version : UInt32
    property version_detail : VersionDetail_e__Struct_

      # Nested Type VersionDetail_e__Struct_
      @[Extern]
      struct VersionDetail_e__Struct_
    property major_version : UInt8
    property minor_version : UInt8
    property sub_version : UInt8
    property sub_minor_version : UInt8
    def initialize(@major_version : UInt8, @minor_version : UInt8, @sub_version : UInt8, @sub_minor_version : UInt8)
    end
      end

    def initialize(@version : UInt32, @version_detail : VersionDetail_e__Struct_)
    end
    end

    def initialize(@buffer_size : UInt32, @anonymous1 : Anonymous1_e__Union_, @provider_version : UInt32, @number_of_processors : UInt32, @end_time : Win32cr::Foundation::LARGE_INTEGER, @timer_resolution : UInt32, @maximum_file_size : UInt32, @log_file_mode : UInt32, @buffers_written : UInt32, @anonymous2 : Anonymous2_e__Union_, @logger_name : UInt64, @log_file_name : UInt64, @time_zone : Win32cr::System::Time::TIME_ZONE_INFORMATION, @boot_time : Win32cr::Foundation::LARGE_INTEGER, @perf_freq : Win32cr::Foundation::LARGE_INTEGER, @start_time : Win32cr::Foundation::LARGE_INTEGER, @reserved_flags : UInt32, @buffers_lost : UInt32)
    end
  end

  @[Extern]
  struct EVENT_INSTANCE_INFO
    property reg_handle : Win32cr::Foundation::HANDLE
    property instance_id : UInt32
    def initialize(@reg_handle : Win32cr::Foundation::HANDLE, @instance_id : UInt32)
    end
  end

  @[Extern]
  struct EVENT_TRACE_PROPERTIES
    property wnode : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property buffer_size : UInt32
    property minimum_buffers : UInt32
    property maximum_buffers : UInt32
    property maximum_file_size : UInt32
    property log_file_mode : UInt32
    property flush_timer : UInt32
    property enable_flags : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_FLAG
    property anonymous : Anonymous_e__Union_
    property number_of_buffers : UInt32
    property free_buffers : UInt32
    property events_lost : UInt32
    property buffers_written : UInt32
    property log_buffers_lost : UInt32
    property real_time_buffers_lost : UInt32
    property logger_thread_id : Win32cr::Foundation::HANDLE
    property log_file_name_offset : UInt32
    property logger_name_offset : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property age_limit : Int32
    property flush_threshold : Int32
    def initialize(@age_limit : Int32, @flush_threshold : Int32)
    end
    end

    def initialize(@wnode : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @buffer_size : UInt32, @minimum_buffers : UInt32, @maximum_buffers : UInt32, @maximum_file_size : UInt32, @log_file_mode : UInt32, @flush_timer : UInt32, @enable_flags : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_FLAG, @anonymous : Anonymous_e__Union_, @number_of_buffers : UInt32, @free_buffers : UInt32, @events_lost : UInt32, @buffers_written : UInt32, @log_buffers_lost : UInt32, @real_time_buffers_lost : UInt32, @logger_thread_id : Win32cr::Foundation::HANDLE, @log_file_name_offset : UInt32, @logger_name_offset : UInt32)
    end
  end

  @[Extern]
  struct EVENT_TRACE_PROPERTIES_V2
    property wnode : Win32cr::System::Diagnostics::Etw::WNODE_HEADER
    property buffer_size : UInt32
    property minimum_buffers : UInt32
    property maximum_buffers : UInt32
    property maximum_file_size : UInt32
    property log_file_mode : UInt32
    property flush_timer : UInt32
    property enable_flags : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_FLAG
    property anonymous1 : Anonymous1_e__Union_
    property number_of_buffers : UInt32
    property free_buffers : UInt32
    property events_lost : UInt32
    property buffers_written : UInt32
    property log_buffers_lost : UInt32
    property real_time_buffers_lost : UInt32
    property logger_thread_id : Win32cr::Foundation::HANDLE
    property log_file_name_offset : UInt32
    property logger_name_offset : UInt32
    property anonymous2 : Anonymous2_e__Union_
    property filter_desc_count : UInt32
    property filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*
    property anonymous3 : Anonymous3_e__Union_

    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property anonymous : Anonymous_e__Struct_
    property v2_options : UInt64

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @v2_options : UInt64)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property anonymous : Anonymous_e__Struct_
    property v2_control : UInt32

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @v2_control : UInt32)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property age_limit : Int32
    property flush_threshold : Int32
    def initialize(@age_limit : Int32, @flush_threshold : Int32)
    end
    end

    def initialize(@wnode : Win32cr::System::Diagnostics::Etw::WNODE_HEADER, @buffer_size : UInt32, @minimum_buffers : UInt32, @maximum_buffers : UInt32, @maximum_file_size : UInt32, @log_file_mode : UInt32, @flush_timer : UInt32, @enable_flags : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_FLAG, @anonymous1 : Anonymous1_e__Union_, @number_of_buffers : UInt32, @free_buffers : UInt32, @events_lost : UInt32, @buffers_written : UInt32, @log_buffers_lost : UInt32, @real_time_buffers_lost : UInt32, @logger_thread_id : Win32cr::Foundation::HANDLE, @log_file_name_offset : UInt32, @logger_name_offset : UInt32, @anonymous2 : Anonymous2_e__Union_, @filter_desc_count : UInt32, @filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*, @anonymous3 : Anonymous3_e__Union_)
    end
  end

  @[Extern]
  struct TRACE_GUID_REGISTRATION
    property guid : LibC::GUID*
    property reg_handle : Win32cr::Foundation::HANDLE
    def initialize(@guid : LibC::GUID*, @reg_handle : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct TRACE_GUID_PROPERTIES
    property guid : LibC::GUID
    property guid_type : UInt32
    property logger_id : UInt32
    property enable_level : UInt32
    property enable_flags : UInt32
    property is_enable : Win32cr::Foundation::BOOLEAN
    def initialize(@guid : LibC::GUID, @guid_type : UInt32, @logger_id : UInt32, @enable_level : UInt32, @enable_flags : UInt32, @is_enable : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct ETW_BUFFER_CONTEXT
    property anonymous : Anonymous_e__Union_
    property logger_id : UInt16

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property processor_index : UInt16

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property processor_number : UInt8
    property alignment : UInt8
    def initialize(@processor_number : UInt8, @alignment : UInt8)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @processor_index : UInt16)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @logger_id : UInt16)
    end
  end

  @[Extern]
  struct TRACE_ENABLE_INFO
    property is_enabled : UInt32
    property level : UInt8
    property reserved1 : UInt8
    property logger_id : UInt16
    property enable_property : UInt32
    property reserved2 : UInt32
    property match_any_keyword : UInt64
    property match_all_keyword : UInt64
    def initialize(@is_enabled : UInt32, @level : UInt8, @reserved1 : UInt8, @logger_id : UInt16, @enable_property : UInt32, @reserved2 : UInt32, @match_any_keyword : UInt64, @match_all_keyword : UInt64)
    end
  end

  @[Extern]
  struct TRACE_PROVIDER_INSTANCE_INFO
    property next_offset : UInt32
    property enable_count : UInt32
    property pid : UInt32
    property flags : UInt32
    def initialize(@next_offset : UInt32, @enable_count : UInt32, @pid : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct TRACE_GUID_INFO
    property instance_count : UInt32
    property reserved : UInt32
    def initialize(@instance_count : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PROFILE_SOURCE_INFO
    property next_entry_offset : UInt32
    property source : UInt32
    property min_interval : UInt32
    property max_interval : UInt32
    property reserved : UInt64
    property description : UInt16*
    def initialize(@next_entry_offset : UInt32, @source : UInt32, @min_interval : UInt32, @max_interval : UInt32, @reserved : UInt64, @description : UInt16*)
    end
  end

  @[Extern]
  struct ETW_PMC_COUNTER_OWNER
    property owner_type : Win32cr::System::Diagnostics::Etw::ETW_PMC_COUNTER_OWNER_TYPE
    property profile_source : UInt32
    property owner_tag : UInt32
    def initialize(@owner_type : Win32cr::System::Diagnostics::Etw::ETW_PMC_COUNTER_OWNER_TYPE, @profile_source : UInt32, @owner_tag : UInt32)
    end
  end

  @[Extern]
  struct ETW_PMC_COUNTER_OWNERSHIP_STATUS
    property processor_number : UInt32
    property number_of_counters : UInt32
    property counter_owners : Win32cr::System::Diagnostics::Etw::ETW_PMC_COUNTER_OWNER*
    def initialize(@processor_number : UInt32, @number_of_counters : UInt32, @counter_owners : Win32cr::System::Diagnostics::Etw::ETW_PMC_COUNTER_OWNER*)
    end
  end

  @[Extern]
  struct EVENT_TRACE
    property header : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_HEADER
    property instance_id : UInt32
    property parent_instance_id : UInt32
    property parent_guid : LibC::GUID
    property mof_data : Void*
    property mof_length : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property client_context : UInt32
    property buffer_context : Win32cr::System::Diagnostics::Etw::ETW_BUFFER_CONTEXT
    def initialize(@client_context : UInt32, @buffer_context : Win32cr::System::Diagnostics::Etw::ETW_BUFFER_CONTEXT)
    end
    end

    def initialize(@header : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_HEADER, @instance_id : UInt32, @parent_instance_id : UInt32, @parent_guid : LibC::GUID, @mof_data : Void*, @mof_length : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct EVENT_TRACE_LOGFILEW
    property log_file_name : Win32cr::Foundation::PWSTR
    property logger_name : Win32cr::Foundation::PWSTR
    property current_time : Int64
    property buffers_read : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property current_event : Win32cr::System::Diagnostics::Etw::EVENT_TRACE
    property logfile_header : Win32cr::System::Diagnostics::Etw::TRACE_LOGFILE_HEADER
    property buffer_callback : Win32cr::System::Diagnostics::Etw::PEVENT_TRACE_BUFFER_CALLBACKW
    property buffer_size : UInt32
    property filled : UInt32
    property events_lost : UInt32
    property anonymous2 : Anonymous2_e__Union_
    property is_kernel_trace : UInt32
    property context : Void*

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property log_file_mode : UInt32
    property process_trace_mode : UInt32
    def initialize(@log_file_mode : UInt32, @process_trace_mode : UInt32)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property event_callback : Win32cr::System::Diagnostics::Etw::PEVENT_CALLBACK
    property event_record_callback : Win32cr::System::Diagnostics::Etw::PEVENT_RECORD_CALLBACK
    def initialize(@event_callback : Win32cr::System::Diagnostics::Etw::PEVENT_CALLBACK, @event_record_callback : Win32cr::System::Diagnostics::Etw::PEVENT_RECORD_CALLBACK)
    end
    end

    def initialize(@log_file_name : Win32cr::Foundation::PWSTR, @logger_name : Win32cr::Foundation::PWSTR, @current_time : Int64, @buffers_read : UInt32, @anonymous1 : Anonymous1_e__Union_, @current_event : Win32cr::System::Diagnostics::Etw::EVENT_TRACE, @logfile_header : Win32cr::System::Diagnostics::Etw::TRACE_LOGFILE_HEADER, @buffer_callback : Win32cr::System::Diagnostics::Etw::PEVENT_TRACE_BUFFER_CALLBACKW, @buffer_size : UInt32, @filled : UInt32, @events_lost : UInt32, @anonymous2 : Anonymous2_e__Union_, @is_kernel_trace : UInt32, @context : Void*)
    end
  end

  @[Extern]
  struct EVENT_TRACE_LOGFILEA
    property log_file_name : Win32cr::Foundation::PSTR
    property logger_name : Win32cr::Foundation::PSTR
    property current_time : Int64
    property buffers_read : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property current_event : Win32cr::System::Diagnostics::Etw::EVENT_TRACE
    property logfile_header : Win32cr::System::Diagnostics::Etw::TRACE_LOGFILE_HEADER
    property buffer_callback : Win32cr::System::Diagnostics::Etw::PEVENT_TRACE_BUFFER_CALLBACKA
    property buffer_size : UInt32
    property filled : UInt32
    property events_lost : UInt32
    property anonymous2 : Anonymous2_e__Union_
    property is_kernel_trace : UInt32
    property context : Void*

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property log_file_mode : UInt32
    property process_trace_mode : UInt32
    def initialize(@log_file_mode : UInt32, @process_trace_mode : UInt32)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property event_callback : Win32cr::System::Diagnostics::Etw::PEVENT_CALLBACK
    property event_record_callback : Win32cr::System::Diagnostics::Etw::PEVENT_RECORD_CALLBACK
    def initialize(@event_callback : Win32cr::System::Diagnostics::Etw::PEVENT_CALLBACK, @event_record_callback : Win32cr::System::Diagnostics::Etw::PEVENT_RECORD_CALLBACK)
    end
    end

    def initialize(@log_file_name : Win32cr::Foundation::PSTR, @logger_name : Win32cr::Foundation::PSTR, @current_time : Int64, @buffers_read : UInt32, @anonymous1 : Anonymous1_e__Union_, @current_event : Win32cr::System::Diagnostics::Etw::EVENT_TRACE, @logfile_header : Win32cr::System::Diagnostics::Etw::TRACE_LOGFILE_HEADER, @buffer_callback : Win32cr::System::Diagnostics::Etw::PEVENT_TRACE_BUFFER_CALLBACKA, @buffer_size : UInt32, @filled : UInt32, @events_lost : UInt32, @anonymous2 : Anonymous2_e__Union_, @is_kernel_trace : UInt32, @context : Void*)
    end
  end

  @[Extern]
  struct ENABLE_TRACE_PARAMETERS_V1
    property version : UInt32
    property enable_property : UInt32
    property control_flags : UInt32
    property source_id : LibC::GUID
    property enable_filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*
    def initialize(@version : UInt32, @enable_property : UInt32, @control_flags : UInt32, @source_id : LibC::GUID, @enable_filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*)
    end
  end

  @[Extern]
  struct ENABLE_TRACE_PARAMETERS
    property version : UInt32
    property enable_property : UInt32
    property control_flags : UInt32
    property source_id : LibC::GUID
    property enable_filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*
    property filter_desc_count : UInt32
    def initialize(@version : UInt32, @enable_property : UInt32, @control_flags : UInt32, @source_id : LibC::GUID, @enable_filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*, @filter_desc_count : UInt32)
    end
  end

  @[Extern]
  struct CLASSIC_EVENT_ID
    property event_guid : LibC::GUID
    property type__ : UInt8
    property reserved : UInt8[7]
    def initialize(@event_guid : LibC::GUID, @type__ : UInt8, @reserved : UInt8[7])
    end
  end

  @[Extern]
  struct TRACE_STACK_CACHING_INFO
    property enabled : Win32cr::Foundation::BOOLEAN
    property cache_size : UInt32
    property bucket_count : UInt32
    def initialize(@enabled : Win32cr::Foundation::BOOLEAN, @cache_size : UInt32, @bucket_count : UInt32)
    end
  end

  @[Extern]
  struct TRACE_PROFILE_INTERVAL
    property source : UInt32
    property interval : UInt32
    def initialize(@source : UInt32, @interval : UInt32)
    end
  end

  @[Extern]
  struct TRACE_VERSION_INFO
    property etw_trace_processing_version : UInt32
    property reserved : UInt32
    def initialize(@etw_trace_processing_version : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct TRACE_PERIODIC_CAPTURE_STATE_INFO
    property capture_state_frequency_in_seconds : UInt32
    property provider_count : UInt16
    property reserved : UInt16
    def initialize(@capture_state_frequency_in_seconds : UInt32, @provider_count : UInt16, @reserved : UInt16)
    end
  end

  @[Extern]
  struct ETW_TRACE_PARTITION_INFORMATION
    property partition_id : LibC::GUID
    property parent_id : LibC::GUID
    property qpc_offset_from_root : Int64
    property partition_type : UInt32
    def initialize(@partition_id : LibC::GUID, @parent_id : LibC::GUID, @qpc_offset_from_root : Int64, @partition_type : UInt32)
    end
  end

  @[Extern]
  struct ETW_TRACE_PARTITION_INFORMATION_V2
    property qpc_offset_from_root : Int64
    property partition_type : UInt32
    property partition_id : Win32cr::Foundation::PWSTR
    property parent_id : Win32cr::Foundation::PWSTR
    def initialize(@qpc_offset_from_root : Int64, @partition_type : UInt32, @partition_id : Win32cr::Foundation::PWSTR, @parent_id : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct EVENT_DATA_DESCRIPTOR
    property ptr : UInt64
    property size : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property reserved : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property type__ : UInt8
    property reserved1 : UInt8
    property reserved2 : UInt16
    def initialize(@type__ : UInt8, @reserved1 : UInt8, @reserved2 : UInt16)
    end
      end

    def initialize(@reserved : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@ptr : UInt64, @size : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct EVENT_DESCRIPTOR
    property id : UInt16
    property version : UInt8
    property channel : UInt8
    property level : UInt8
    property opcode : UInt8
    property task : UInt16
    property keyword : UInt64
    def initialize(@id : UInt16, @version : UInt8, @channel : UInt8, @level : UInt8, @opcode : UInt8, @task : UInt16, @keyword : UInt64)
    end
  end

  @[Extern]
  struct EVENT_FILTER_DESCRIPTOR
    property ptr : UInt64
    property size : UInt32
    property type__ : UInt32
    def initialize(@ptr : UInt64, @size : UInt32, @type__ : UInt32)
    end
  end

  @[Extern]
  struct EVENT_FILTER_HEADER
    property id : UInt16
    property version : UInt8
    property reserved : UInt8[5]
    property instance_id : UInt64
    property size : UInt32
    property next_offset : UInt32
    def initialize(@id : UInt16, @version : UInt8, @reserved : UInt8[5], @instance_id : UInt64, @size : UInt32, @next_offset : UInt32)
    end
  end

  @[Extern]
  struct EVENT_FILTER_EVENT_ID
    property filter_in : Win32cr::Foundation::BOOLEAN
    property reserved : UInt8
    property count : UInt16
    property events : UInt16*
    def initialize(@filter_in : Win32cr::Foundation::BOOLEAN, @reserved : UInt8, @count : UInt16, @events : UInt16*)
    end
  end

  @[Extern]
  struct EVENT_FILTER_EVENT_NAME
    property match_any_keyword : UInt64
    property match_all_keyword : UInt64
    property level : UInt8
    property filter_in : Win32cr::Foundation::BOOLEAN
    property name_count : UInt16
    property names : UInt8*
    def initialize(@match_any_keyword : UInt64, @match_all_keyword : UInt64, @level : UInt8, @filter_in : Win32cr::Foundation::BOOLEAN, @name_count : UInt16, @names : UInt8*)
    end
  end

  @[Extern]
  struct EVENT_FILTER_LEVEL_KW
    property match_any_keyword : UInt64
    property match_all_keyword : UInt64
    property level : UInt8
    property filter_in : Win32cr::Foundation::BOOLEAN
    def initialize(@match_any_keyword : UInt64, @match_all_keyword : UInt64, @level : UInt8, @filter_in : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct EVENT_HEADER_EXTENDED_DATA_ITEM
    property reserved1 : UInt16
    property ext_type : UInt16
    property anonymous : Anonymous_e__Struct_
    property data_size : UInt16
    property data_ptr : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
    end

    def initialize(@reserved1 : UInt16, @ext_type : UInt16, @anonymous : Anonymous_e__Struct_, @data_size : UInt16, @data_ptr : UInt64)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_INSTANCE
    property instance_id : UInt32
    property parent_instance_id : UInt32
    property parent_guid : LibC::GUID
    def initialize(@instance_id : UInt32, @parent_instance_id : UInt32, @parent_guid : LibC::GUID)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_RELATED_ACTIVITYID
    property related_activity_id : LibC::GUID
    def initialize(@related_activity_id : LibC::GUID)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_TS_ID
    property session_id : UInt32
    def initialize(@session_id : UInt32)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_STACK_TRACE32
    property match_id : UInt64
    property address : UInt32*
    def initialize(@match_id : UInt64, @address : UInt32*)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_STACK_TRACE64
    property match_id : UInt64
    property address : UInt64*
    def initialize(@match_id : UInt64, @address : UInt64*)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_STACK_KEY32
    property match_id : UInt64
    property stack_key : UInt32
    property padding : UInt32
    def initialize(@match_id : UInt64, @stack_key : UInt32, @padding : UInt32)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_STACK_KEY64
    property match_id : UInt64
    property stack_key : UInt64
    def initialize(@match_id : UInt64, @stack_key : UInt64)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_PEBS_INDEX
    property pebs_index : UInt64
    def initialize(@pebs_index : UInt64)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_PMC_COUNTERS
    property counter : UInt64*
    def initialize(@counter : UInt64*)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_PROCESS_START_KEY
    property process_start_key : UInt64
    def initialize(@process_start_key : UInt64)
    end
  end

  @[Extern]
  struct EVENT_EXTENDED_ITEM_EVENT_KEY
    property key : UInt64
    def initialize(@key : UInt64)
    end
  end

  @[Extern]
  struct EVENT_HEADER
    property size : UInt16
    property header_type : UInt16
    property flags : UInt16
    property event_property : UInt16
    property thread_id : UInt32
    property process_id : UInt32
    property time_stamp : Win32cr::Foundation::LARGE_INTEGER
    property provider_id : LibC::GUID
    property event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR
    property anonymous : Anonymous_e__Union_
    property activity_id : LibC::GUID

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property processor_time : UInt64

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property kernel_time : UInt32
    property user_time : UInt32
    def initialize(@kernel_time : UInt32, @user_time : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @processor_time : UInt64)
    end
    end

    def initialize(@size : UInt16, @header_type : UInt16, @flags : UInt16, @event_property : UInt16, @thread_id : UInt32, @process_id : UInt32, @time_stamp : Win32cr::Foundation::LARGE_INTEGER, @provider_id : LibC::GUID, @event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR, @anonymous : Anonymous_e__Union_, @activity_id : LibC::GUID)
    end
  end

  @[Extern]
  struct EVENT_RECORD
    property event_header : Win32cr::System::Diagnostics::Etw::EVENT_HEADER
    property buffer_context : Win32cr::System::Diagnostics::Etw::ETW_BUFFER_CONTEXT
    property extended_data_count : UInt16
    property user_data_length : UInt16
    property extended_data : Win32cr::System::Diagnostics::Etw::EVENT_HEADER_EXTENDED_DATA_ITEM*
    property user_data : Void*
    property user_context : Void*
    def initialize(@event_header : Win32cr::System::Diagnostics::Etw::EVENT_HEADER, @buffer_context : Win32cr::System::Diagnostics::Etw::ETW_BUFFER_CONTEXT, @extended_data_count : UInt16, @user_data_length : UInt16, @extended_data : Win32cr::System::Diagnostics::Etw::EVENT_HEADER_EXTENDED_DATA_ITEM*, @user_data : Void*, @user_context : Void*)
    end
  end

  @[Extern]
  struct EVENT_MAP_ENTRY
    property output_offset : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property value : UInt32
    property input_offset : UInt32
    def initialize(@value : UInt32, @input_offset : UInt32)
    end
    end

    def initialize(@output_offset : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct EVENT_MAP_INFO
    property name_offset : UInt32
    property flag : Win32cr::System::Diagnostics::Etw::MAP_FLAGS
    property entry_count : UInt32
    property anonymous : Anonymous_e__Union_
    property map_entry_array : Win32cr::System::Diagnostics::Etw::EVENT_MAP_ENTRY*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property map_entry_value_type : Win32cr::System::Diagnostics::Etw::MAP_VALUETYPE
    property format_string_offset : UInt32
    def initialize(@map_entry_value_type : Win32cr::System::Diagnostics::Etw::MAP_VALUETYPE, @format_string_offset : UInt32)
    end
    end

    def initialize(@name_offset : UInt32, @flag : Win32cr::System::Diagnostics::Etw::MAP_FLAGS, @entry_count : UInt32, @anonymous : Anonymous_e__Union_, @map_entry_array : Win32cr::System::Diagnostics::Etw::EVENT_MAP_ENTRY*)
    end
  end

  @[Extern]
  struct EVENT_PROPERTY_INFO
    property flags : Win32cr::System::Diagnostics::Etw::PROPERTY_FLAGS
    property name_offset : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property anonymous3 : Anonymous3_e__Union_
    property anonymous4 : Anonymous4_e__Union_

    # Nested Type Anonymous4_e__Union_
    @[Extern(union: true)]
    struct Anonymous4_e__Union_
    property reserved : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@reserved : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property count : UInt16
    property countPropertyIndex : UInt16
    def initialize(@count : UInt16, @countPropertyIndex : UInt16)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property nonStructType : Nonstructtype_
    property structType : Structtype_
    property customSchemaType : Customschematype_

      # Nested Type Customschematype_
      @[Extern]
      struct Customschematype_
    property in_type : UInt16
    property out_type : UInt16
    property custom_schema_offset : UInt32
    def initialize(@in_type : UInt16, @out_type : UInt16, @custom_schema_offset : UInt32)
    end
      end


      # Nested Type Nonstructtype_
      @[Extern]
      struct Nonstructtype_
    property in_type : UInt16
    property out_type : UInt16
    property map_name_offset : UInt32
    def initialize(@in_type : UInt16, @out_type : UInt16, @map_name_offset : UInt32)
    end
      end


      # Nested Type Structtype_
      @[Extern]
      struct Structtype_
    property struct_start_index : UInt16
    property num_of_struct_members : UInt16
    property padding : UInt32
    def initialize(@struct_start_index : UInt16, @num_of_struct_members : UInt16, @padding : UInt32)
    end
      end

    def initialize(@nonStructType : Nonstructtype_, @structType : Structtype_, @customSchemaType : Customschematype_)
    end
    end


    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property length : UInt16
    property lengthPropertyIndex : UInt16
    def initialize(@length : UInt16, @lengthPropertyIndex : UInt16)
    end
    end

    def initialize(@flags : Win32cr::System::Diagnostics::Etw::PROPERTY_FLAGS, @name_offset : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @anonymous3 : Anonymous3_e__Union_, @anonymous4 : Anonymous4_e__Union_)
    end
  end

  @[Extern]
  struct TRACE_EVENT_INFO
    property provider_guid : LibC::GUID
    property event_guid : LibC::GUID
    property event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR
    property decoding_source : Win32cr::System::Diagnostics::Etw::DECODING_SOURCE
    property provider_name_offset : UInt32
    property level_name_offset : UInt32
    property channel_name_offset : UInt32
    property keywords_name_offset : UInt32
    property task_name_offset : UInt32
    property opcode_name_offset : UInt32
    property event_message_offset : UInt32
    property provider_message_offset : UInt32
    property binary_xml_offset : UInt32
    property binary_xml_size : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property property_count : UInt32
    property top_level_property_count : UInt32
    property anonymous3 : Anonymous3_e__Union_
    property event_property_info_array : Win32cr::System::Diagnostics::Etw::EVENT_PROPERTY_INFO*

    # Nested Type Anonymous3_e__Union_
    @[Extern(union: true)]
    struct Anonymous3_e__Union_
    property flags : Win32cr::System::Diagnostics::Etw::TEMPLATE_FLAGS
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@flags : Win32cr::System::Diagnostics::Etw::TEMPLATE_FLAGS, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property event_name_offset : UInt32
    property activity_id_name_offset : UInt32
    def initialize(@event_name_offset : UInt32, @activity_id_name_offset : UInt32)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property event_attributes_offset : UInt32
    property related_activity_id_name_offset : UInt32
    def initialize(@event_attributes_offset : UInt32, @related_activity_id_name_offset : UInt32)
    end
    end

    def initialize(@provider_guid : LibC::GUID, @event_guid : LibC::GUID, @event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR, @decoding_source : Win32cr::System::Diagnostics::Etw::DECODING_SOURCE, @provider_name_offset : UInt32, @level_name_offset : UInt32, @channel_name_offset : UInt32, @keywords_name_offset : UInt32, @task_name_offset : UInt32, @opcode_name_offset : UInt32, @event_message_offset : UInt32, @provider_message_offset : UInt32, @binary_xml_offset : UInt32, @binary_xml_size : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @property_count : UInt32, @top_level_property_count : UInt32, @anonymous3 : Anonymous3_e__Union_, @event_property_info_array : Win32cr::System::Diagnostics::Etw::EVENT_PROPERTY_INFO*)
    end
  end

  @[Extern]
  struct PROPERTY_DATA_DESCRIPTOR
    property property_name : UInt64
    property array_index : UInt32
    property reserved : UInt32
    def initialize(@property_name : UInt64, @array_index : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PAYLOAD_FILTER_PREDICATE
    property field_name : Win32cr::Foundation::PWSTR
    property compare_op : UInt16
    property value : Win32cr::Foundation::PWSTR
    def initialize(@field_name : Win32cr::Foundation::PWSTR, @compare_op : UInt16, @value : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PROVIDER_FILTER_INFO
    property id : UInt8
    property version : UInt8
    property message_offset : UInt32
    property reserved : UInt32
    property property_count : UInt32
    property event_property_info_array : Win32cr::System::Diagnostics::Etw::EVENT_PROPERTY_INFO*
    def initialize(@id : UInt8, @version : UInt8, @message_offset : UInt32, @reserved : UInt32, @property_count : UInt32, @event_property_info_array : Win32cr::System::Diagnostics::Etw::EVENT_PROPERTY_INFO*)
    end
  end

  @[Extern]
  struct PROVIDER_FIELD_INFO
    property name_offset : UInt32
    property description_offset : UInt32
    property value : UInt64
    def initialize(@name_offset : UInt32, @description_offset : UInt32, @value : UInt64)
    end
  end

  @[Extern]
  struct PROVIDER_FIELD_INFOARRAY
    property number_of_elements : UInt32
    property field_type : Win32cr::System::Diagnostics::Etw::EVENT_FIELD_TYPE
    property field_info_array : Win32cr::System::Diagnostics::Etw::PROVIDER_FIELD_INFO*
    def initialize(@number_of_elements : UInt32, @field_type : Win32cr::System::Diagnostics::Etw::EVENT_FIELD_TYPE, @field_info_array : Win32cr::System::Diagnostics::Etw::PROVIDER_FIELD_INFO*)
    end
  end

  @[Extern]
  struct TRACE_PROVIDER_INFO
    property provider_guid : LibC::GUID
    property schema_source : UInt32
    property provider_name_offset : UInt32
    def initialize(@provider_guid : LibC::GUID, @schema_source : UInt32, @provider_name_offset : UInt32)
    end
  end

  @[Extern]
  struct PROVIDER_ENUMERATION_INFO
    property number_of_providers : UInt32
    property reserved : UInt32
    property trace_provider_info_array : Win32cr::System::Diagnostics::Etw::TRACE_PROVIDER_INFO*
    def initialize(@number_of_providers : UInt32, @reserved : UInt32, @trace_provider_info_array : Win32cr::System::Diagnostics::Etw::TRACE_PROVIDER_INFO*)
    end
  end

  @[Extern]
  struct PROVIDER_EVENT_INFO
    property number_of_events : UInt32
    property reserved : UInt32
    property event_descriptors_array : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*
    def initialize(@number_of_events : UInt32, @reserved : UInt32, @event_descriptors_array : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*)
    end
  end

  @[Extern]
  struct TDH_CONTEXT
    property parameter_value : UInt64
    property parameter_type : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT_TYPE
    property parameter_size : UInt32
    def initialize(@parameter_value : UInt64, @parameter_type : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT_TYPE, @parameter_size : UInt32)
    end
  end

  @[Extern]
  record ITraceEventVtbl,
    query_interface : Proc(ITraceEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITraceEvent*, UInt32),
    release : Proc(ITraceEvent*, UInt32),
    clone : Proc(ITraceEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_user_context : Proc(ITraceEvent*, Void**, Win32cr::Foundation::HRESULT),
    get_event_record : Proc(ITraceEvent*, Win32cr::System::Diagnostics::Etw::EVENT_RECORD**, Win32cr::Foundation::HRESULT),
    set_payload : Proc(ITraceEvent*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    set_event_descriptor : Proc(ITraceEvent*, Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, Win32cr::Foundation::HRESULT),
    set_process_id : Proc(ITraceEvent*, UInt32, Win32cr::Foundation::HRESULT),
    set_processor_index : Proc(ITraceEvent*, UInt32, Win32cr::Foundation::HRESULT),
    set_thread_id : Proc(ITraceEvent*, UInt32, Win32cr::Foundation::HRESULT),
    set_thread_times : Proc(ITraceEvent*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    set_activity_id : Proc(ITraceEvent*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_time_stamp : Proc(ITraceEvent*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT),
    set_provider_id : Proc(ITraceEvent*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITraceEvent, lpVtbl : ITraceEventVtbl* do
    GUID = LibC::GUID.new(0x8cc97f40_u32, 0x9028_u16, 0x4ff3_u16, StaticArray[0x9b_u8, 0x62_u8, 0x7d_u8, 0x1f_u8, 0x79_u8, 0xca_u8, 0x7b_u8, 0xcb_u8])
    def query_interface(this : ITraceEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITraceEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITraceEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : ITraceEvent*, new_event : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, new_event)
    end
    def get_user_context(this : ITraceEvent*, user_context : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_user_context.call(this, user_context)
    end
    def get_event_record(this : ITraceEvent*, event_record : Win32cr::System::Diagnostics::Etw::EVENT_RECORD**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_record.call(this, event_record)
    end
    def set_payload(this : ITraceEvent*, payload : UInt8*, payload_size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_payload.call(this, payload, payload_size)
    end
    def set_event_descriptor(this : ITraceEvent*, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_event_descriptor.call(this, event_descriptor)
    end
    def set_process_id(this : ITraceEvent*, process_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_process_id.call(this, process_id)
    end
    def set_processor_index(this : ITraceEvent*, processor_index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_processor_index.call(this, processor_index)
    end
    def set_thread_id(this : ITraceEvent*, thread_id : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thread_id.call(this, thread_id)
    end
    def set_thread_times(this : ITraceEvent*, kernel_time : UInt32, user_time : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_thread_times.call(this, kernel_time, user_time)
    end
    def set_activity_id(this : ITraceEvent*, activity_id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_activity_id.call(this, activity_id)
    end
    def set_time_stamp(this : ITraceEvent*, time_stamp : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_time_stamp.call(this, time_stamp)
    end
    def set_provider_id(this : ITraceEvent*, provider_id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_provider_id.call(this, provider_id)
    end

  end

  @[Extern]
  record ITraceEventCallbackVtbl,
    query_interface : Proc(ITraceEventCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITraceEventCallback*, UInt32),
    release : Proc(ITraceEventCallback*, UInt32),
    on_begin_process_trace : Proc(ITraceEventCallback*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_finalize_process_trace : Proc(ITraceEventCallback*, Void*, Win32cr::Foundation::HRESULT),
    on_event : Proc(ITraceEventCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITraceEventCallback, lpVtbl : ITraceEventCallbackVtbl* do
    GUID = LibC::GUID.new(0x3ed25501_u32, 0x593f_u16, 0x43e9_u16, StaticArray[0x8f_u8, 0x38_u8, 0x3a_u8, 0xb4_u8, 0x6f_u8, 0x5a_u8, 0x4a_u8, 0x52_u8])
    def query_interface(this : ITraceEventCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITraceEventCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITraceEventCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_begin_process_trace(this : ITraceEventCallback*, header_event : Void*, relogger : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_process_trace.call(this, header_event, relogger)
    end
    def on_finalize_process_trace(this : ITraceEventCallback*, relogger : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_finalize_process_trace.call(this, relogger)
    end
    def on_event(this : ITraceEventCallback*, event : Void*, relogger : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event.call(this, event, relogger)
    end

  end

  @[Extern]
  record ITraceReloggerVtbl,
    query_interface : Proc(ITraceRelogger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITraceRelogger*, UInt32),
    release : Proc(ITraceRelogger*, UInt32),
    add_logfile_trace_stream : Proc(ITraceRelogger*, Win32cr::Foundation::BSTR, Void*, Win32cr::System::Diagnostics::Etw::RELOGSTREAM_HANDLE*, Win32cr::Foundation::HRESULT),
    add_realtime_trace_stream : Proc(ITraceRelogger*, Win32cr::Foundation::BSTR, Void*, Win32cr::System::Diagnostics::Etw::RELOGSTREAM_HANDLE*, Win32cr::Foundation::HRESULT),
    register_callback : Proc(ITraceRelogger*, Void*, Win32cr::Foundation::HRESULT),
    inject : Proc(ITraceRelogger*, Void*, Win32cr::Foundation::HRESULT),
    create_event_instance : Proc(ITraceRelogger*, Win32cr::System::Diagnostics::Etw::RELOGSTREAM_HANDLE, UInt32, Void**, Win32cr::Foundation::HRESULT),
    process_trace : Proc(ITraceRelogger*, Win32cr::Foundation::HRESULT),
    set_output_filename : Proc(ITraceRelogger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_compression_mode : Proc(ITraceRelogger*, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::HRESULT),
    cancel : Proc(ITraceRelogger*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITraceRelogger, lpVtbl : ITraceReloggerVtbl* do
    GUID = LibC::GUID.new(0xf754ad43_u32, 0x3bcc_u16, 0x4286_u16, StaticArray[0x80_u8, 0x9_u8, 0x9c_u8, 0x5d_u8, 0xa2_u8, 0x14_u8, 0xe8_u8, 0x4e_u8])
    def query_interface(this : ITraceRelogger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITraceRelogger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITraceRelogger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_logfile_trace_stream(this : ITraceRelogger*, logfile_name : Win32cr::Foundation::BSTR, user_context : Void*, trace_handle : Win32cr::System::Diagnostics::Etw::RELOGSTREAM_HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_logfile_trace_stream.call(this, logfile_name, user_context, trace_handle)
    end
    def add_realtime_trace_stream(this : ITraceRelogger*, logger_name : Win32cr::Foundation::BSTR, user_context : Void*, trace_handle : Win32cr::System::Diagnostics::Etw::RELOGSTREAM_HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_realtime_trace_stream.call(this, logger_name, user_context, trace_handle)
    end
    def register_callback(this : ITraceRelogger*, callback : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_callback.call(this, callback)
    end
    def inject(this : ITraceRelogger*, event : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.inject.call(this, event)
    end
    def create_event_instance(this : ITraceRelogger*, trace_handle : Win32cr::System::Diagnostics::Etw::RELOGSTREAM_HANDLE, flags : UInt32, event : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_event_instance.call(this, trace_handle, flags, event)
    end
    def process_trace(this : ITraceRelogger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_trace.call(this)
    end
    def set_output_filename(this : ITraceRelogger*, logfile_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_filename.call(this, logfile_name)
    end
    def set_compression_mode(this : ITraceRelogger*, compression_mode : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_compression_mode.call(this, compression_mode)
    end
    def cancel(this : ITraceRelogger*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  def startTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE*, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.StartTraceW(trace_handle, instance_name, properties)
  end

  def startTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE*, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.StartTraceA(trace_handle, instance_name, properties)
  end

  def stopTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.StopTraceW(trace_handle, instance_name, properties)
  end

  def stopTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.StopTraceA(trace_handle, instance_name, properties)
  end

  def queryTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.QueryTraceW(trace_handle, instance_name, properties)
  end

  def queryTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.QueryTraceA(trace_handle, instance_name, properties)
  end

  def updateTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.UpdateTraceW(trace_handle, instance_name, properties)
  end

  def updateTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.UpdateTraceA(trace_handle, instance_name, properties)
  end

  def flushTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.FlushTraceW(trace_handle, instance_name, properties)
  end

  def flushTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR
    C.FlushTraceA(trace_handle, instance_name, properties)
  end

  def controlTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*, control_code : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_CONTROL) : Win32cr::Foundation::WIN32_ERROR
    C.ControlTraceW(trace_handle, instance_name, properties, control_code)
  end

  def controlTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*, control_code : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_CONTROL) : Win32cr::Foundation::WIN32_ERROR
    C.ControlTraceA(trace_handle, instance_name, properties, control_code)
  end

  def queryAllTracesW(property_array : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES**, property_array_count : UInt32, logger_count : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    C.QueryAllTracesW(property_array, property_array_count, logger_count)
  end

  def queryAllTracesA(property_array : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES**, property_array_count : UInt32, logger_count : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    C.QueryAllTracesA(property_array, property_array_count, logger_count)
  end

  def enableTrace(enable : UInt32, enable_flag : UInt32, enable_level : UInt32, control_guid : LibC::GUID*, trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE) : Win32cr::Foundation::WIN32_ERROR
    C.EnableTrace(enable, enable_flag, enable_level, control_guid, trace_handle)
  end

  def enableTraceEx(provider_id : LibC::GUID*, source_id : LibC::GUID*, trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, is_enabled : UInt32, level : UInt8, match_any_keyword : UInt64, match_all_keyword : UInt64, enable_property : UInt32, enable_filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR
    C.EnableTraceEx(provider_id, source_id, trace_handle, is_enabled, level, match_any_keyword, match_all_keyword, enable_property, enable_filter_desc)
  end

  def enableTraceEx2(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, provider_id : LibC::GUID*, control_code : UInt32, level : UInt8, match_any_keyword : UInt64, match_all_keyword : UInt64, timeout : UInt32, enable_parameters : Win32cr::System::Diagnostics::Etw::ENABLE_TRACE_PARAMETERS*) : Win32cr::Foundation::WIN32_ERROR
    C.EnableTraceEx2(trace_handle, provider_id, control_code, level, match_any_keyword, match_all_keyword, timeout, enable_parameters)
  end

  def enumerateTraceGuidsEx(trace_query_info_class : Win32cr::System::Diagnostics::Etw::TRACE_QUERY_INFO_CLASS, in_buffer : Void*, in_buffer_size : UInt32, out_buffer : Void*, out_buffer_size : UInt32, return_length : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    C.EnumerateTraceGuidsEx(trace_query_info_class, in_buffer, in_buffer_size, out_buffer, out_buffer_size, return_length)
  end

  def traceSetInformation(session_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, information_class : Win32cr::System::Diagnostics::Etw::TRACE_QUERY_INFO_CLASS, trace_information : Void*, information_length : UInt32) : Win32cr::Foundation::WIN32_ERROR
    C.TraceSetInformation(session_handle, information_class, trace_information, information_length)
  end

  def traceQueryInformation(session_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, information_class : Win32cr::System::Diagnostics::Etw::TRACE_QUERY_INFO_CLASS, trace_information : Void*, information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    C.TraceQueryInformation(session_handle, information_class, trace_information, information_length, return_length)
  end

  def createTraceInstanceId(reg_handle : Win32cr::Foundation::HANDLE, inst_info : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_INFO*) : Win32cr::Foundation::WIN32_ERROR
    C.CreateTraceInstanceId(reg_handle, inst_info)
  end

  def traceEvent(trace_handle : UInt64, event_trace : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_HEADER*) : Win32cr::Foundation::WIN32_ERROR
    C.TraceEvent(trace_handle, event_trace)
  end

  def traceEventInstance(trace_handle : UInt64, event_trace : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_HEADER*, inst_info : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_INFO*, parent_inst_info : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_INFO*) : UInt32
    C.TraceEventInstance(trace_handle, event_trace, inst_info, parent_inst_info)
  end

  def registerTraceGuidsW(request_address : Win32cr::System::Diagnostics::Etw::WMIDPREQUEST, request_context : Void*, control_guid : LibC::GUID*, guid_count : UInt32, trace_guid_reg : Win32cr::System::Diagnostics::Etw::TRACE_GUID_REGISTRATION*, mof_image_path : Win32cr::Foundation::PWSTR, mof_resource_name : Win32cr::Foundation::PWSTR, registration_handle : UInt64*) : UInt32
    C.RegisterTraceGuidsW(request_address, request_context, control_guid, guid_count, trace_guid_reg, mof_image_path, mof_resource_name, registration_handle)
  end

  def registerTraceGuidsA(request_address : Win32cr::System::Diagnostics::Etw::WMIDPREQUEST, request_context : Void*, control_guid : LibC::GUID*, guid_count : UInt32, trace_guid_reg : Win32cr::System::Diagnostics::Etw::TRACE_GUID_REGISTRATION*, mof_image_path : Win32cr::Foundation::PSTR, mof_resource_name : Win32cr::Foundation::PSTR, registration_handle : UInt64*) : UInt32
    C.RegisterTraceGuidsA(request_address, request_context, control_guid, guid_count, trace_guid_reg, mof_image_path, mof_resource_name, registration_handle)
  end

  def enumerateTraceGuids(guid_properties_array : Win32cr::System::Diagnostics::Etw::TRACE_GUID_PROPERTIES**, property_array_count : UInt32, guid_count : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    C.EnumerateTraceGuids(guid_properties_array, property_array_count, guid_count)
  end

  def unregisterTraceGuids(registration_handle : UInt64) : UInt32
    C.UnregisterTraceGuids(registration_handle)
  end

  def getTraceLoggerHandle(buffer : Void*) : UInt64
    C.GetTraceLoggerHandle(buffer)
  end

  def getTraceEnableLevel(trace_handle : UInt64) : UInt8
    C.GetTraceEnableLevel(trace_handle)
  end

  def getTraceEnableFlags(trace_handle : UInt64) : UInt32
    C.GetTraceEnableFlags(trace_handle)
  end

  def openTraceW(logfile : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_LOGFILEW*) : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE
    C.OpenTraceW(logfile)
  end

  def processTrace(handle_array : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE*, handle_count : UInt32, start_time : Win32cr::Foundation::FILETIME*, end_time : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::WIN32_ERROR
    C.ProcessTrace(handle_array, handle_count, start_time, end_time)
  end

  def closeTrace(trace_handle : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE) : Win32cr::Foundation::WIN32_ERROR
    C.CloseTrace(trace_handle)
  end

  def queryTraceProcessingHandle(processing_handle : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE, information_class : Win32cr::System::Diagnostics::Etw::ETW_PROCESS_HANDLE_INFO_TYPE, in_buffer : Void*, in_buffer_size : UInt32, out_buffer : Void*, out_buffer_size : UInt32, return_length : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    C.QueryTraceProcessingHandle(processing_handle, information_class, in_buffer, in_buffer_size, out_buffer, out_buffer_size, return_length)
  end

  def openTraceA(logfile : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_LOGFILEA*) : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE
    C.OpenTraceA(logfile)
  end

  def setTraceCallback(pGuid : LibC::GUID*, event_callback : Win32cr::System::Diagnostics::Etw::PEVENT_CALLBACK) : Win32cr::Foundation::WIN32_ERROR
    C.SetTraceCallback(pGuid, event_callback)
  end

  def removeTraceCallback(pGuid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    C.RemoveTraceCallback(pGuid)
  end

  def traceMessage(logger_handle : UInt64, message_flags : Win32cr::System::Diagnostics::Etw::TRACE_MESSAGE_FLAGS, message_guid : LibC::GUID*, message_number : UInt16) : Win32cr::Foundation::WIN32_ERROR
    C.TraceMessage(logger_handle, message_flags, message_guid, message_number)
  end

  def traceMessageVa(logger_handle : UInt64, message_flags : Win32cr::System::Diagnostics::Etw::TRACE_MESSAGE_FLAGS, message_guid : LibC::GUID*, message_number : UInt16, message_arg_list : Int8*) : Win32cr::Foundation::WIN32_ERROR
    C.TraceMessageVa(logger_handle, message_flags, message_guid, message_number, message_arg_list)
  end

  def eventRegister(provider_id : LibC::GUID*, enable_callback : Win32cr::System::Diagnostics::Etw::PENABLECALLBACK, callback_context : Void*, reg_handle : UInt64*) : UInt32
    C.EventRegister(provider_id, enable_callback, callback_context, reg_handle)
  end

  def eventUnregister(reg_handle : UInt64) : UInt32
    C.EventUnregister(reg_handle)
  end

  def eventSetInformation(reg_handle : UInt64, information_class : Win32cr::System::Diagnostics::Etw::EVENT_INFO_CLASS, event_information : Void*, information_length : UInt32) : UInt32
    C.EventSetInformation(reg_handle, information_class, event_information, information_length)
  end

  def eventEnabled(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*) : Win32cr::Foundation::BOOLEAN
    C.EventEnabled(reg_handle, event_descriptor)
  end

  def eventProviderEnabled(reg_handle : UInt64, level : UInt8, keyword : UInt64) : Win32cr::Foundation::BOOLEAN
    C.EventProviderEnabled(reg_handle, level, keyword)
  end

  def eventWrite(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, user_data_count : UInt32, user_data : Win32cr::System::Diagnostics::Etw::EVENT_DATA_DESCRIPTOR*) : UInt32
    C.EventWrite(reg_handle, event_descriptor, user_data_count, user_data)
  end

  def eventWriteTransfer(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, activity_id : LibC::GUID*, related_activity_id : LibC::GUID*, user_data_count : UInt32, user_data : Win32cr::System::Diagnostics::Etw::EVENT_DATA_DESCRIPTOR*) : UInt32
    C.EventWriteTransfer(reg_handle, event_descriptor, activity_id, related_activity_id, user_data_count, user_data)
  end

  def eventWriteEx(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, filter : UInt64, flags : UInt32, activity_id : LibC::GUID*, related_activity_id : LibC::GUID*, user_data_count : UInt32, user_data : Win32cr::System::Diagnostics::Etw::EVENT_DATA_DESCRIPTOR*) : UInt32
    C.EventWriteEx(reg_handle, event_descriptor, filter, flags, activity_id, related_activity_id, user_data_count, user_data)
  end

  def eventWriteString(reg_handle : UInt64, level : UInt8, keyword : UInt64, string : Win32cr::Foundation::PWSTR) : UInt32
    C.EventWriteString(reg_handle, level, keyword, string)
  end

  def eventActivityIdControl(control_code : UInt32, activity_id : LibC::GUID*) : UInt32
    C.EventActivityIdControl(control_code, activity_id)
  end

  def eventAccessControl(guid : LibC::GUID*, operation : UInt32, sid : Win32cr::Foundation::PSID, rights : UInt32, allow_or_deny : Win32cr::Foundation::BOOLEAN) : UInt32
    C.EventAccessControl(guid, operation, sid, rights, allow_or_deny)
  end

  def eventAccessQuery(guid : LibC::GUID*, buffer : Win32cr::Security::PSECURITY_DESCRIPTOR, buffer_size : UInt32*) : UInt32
    C.EventAccessQuery(guid, buffer, buffer_size)
  end

  def eventAccessRemove(guid : LibC::GUID*) : UInt32
    C.EventAccessRemove(guid)
  end

  def tdhCreatePayloadFilter(provider_guid : LibC::GUID*, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, event_match_any : Win32cr::Foundation::BOOLEAN, payload_predicate_count : UInt32, payload_predicates : Win32cr::System::Diagnostics::Etw::PAYLOAD_FILTER_PREDICATE*, payload_filter : Void**) : UInt32
    C.TdhCreatePayloadFilter(provider_guid, event_descriptor, event_match_any, payload_predicate_count, payload_predicates, payload_filter)
  end

  def tdhDeletePayloadFilter(payload_filter : Void**) : UInt32
    C.TdhDeletePayloadFilter(payload_filter)
  end

  def tdhAggregatePayloadFilters(payload_filter_count : UInt32, payload_filter_ptrs : Void**, event_match_all_flags : Win32cr::Foundation::BOOLEAN*, event_filter_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*) : UInt32
    C.TdhAggregatePayloadFilters(payload_filter_count, payload_filter_ptrs, event_match_all_flags, event_filter_descriptor)
  end

  def tdhCleanupPayloadEventFilterDescriptor(event_filter_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*) : UInt32
    C.TdhCleanupPayloadEventFilterDescriptor(event_filter_descriptor)
  end

  def tdhGetEventInformation(event : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, tdh_context_count : UInt32, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, buffer : Win32cr::System::Diagnostics::Etw::TRACE_EVENT_INFO*, buffer_size : UInt32*) : UInt32
    C.TdhGetEventInformation(event, tdh_context_count, tdh_context, buffer, buffer_size)
  end

  def tdhGetEventMapInformation(pEvent : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, pMapName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::System::Diagnostics::Etw::EVENT_MAP_INFO*, pBufferSize : UInt32*) : UInt32
    C.TdhGetEventMapInformation(pEvent, pMapName, pBuffer, pBufferSize)
  end

  def tdhGetPropertySize(pEvent : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, tdh_context_count : UInt32, pTdhContext : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, property_data_count : UInt32, pPropertyData : Win32cr::System::Diagnostics::Etw::PROPERTY_DATA_DESCRIPTOR*, pPropertySize : UInt32*) : UInt32
    C.TdhGetPropertySize(pEvent, tdh_context_count, pTdhContext, property_data_count, pPropertyData, pPropertySize)
  end

  def tdhGetProperty(pEvent : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, tdh_context_count : UInt32, pTdhContext : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, property_data_count : UInt32, pPropertyData : Win32cr::System::Diagnostics::Etw::PROPERTY_DATA_DESCRIPTOR*, buffer_size : UInt32, pBuffer : UInt8*) : UInt32
    C.TdhGetProperty(pEvent, tdh_context_count, pTdhContext, property_data_count, pPropertyData, buffer_size, pBuffer)
  end

  def tdhEnumerateProviders(pBuffer : Win32cr::System::Diagnostics::Etw::PROVIDER_ENUMERATION_INFO*, pBufferSize : UInt32*) : UInt32
    C.TdhEnumerateProviders(pBuffer, pBufferSize)
  end

  def tdhEnumerateProvidersForDecodingSource(filter : Win32cr::System::Diagnostics::Etw::DECODING_SOURCE, buffer : Win32cr::System::Diagnostics::Etw::PROVIDER_ENUMERATION_INFO*, bufferSize : UInt32, bufferRequired : UInt32*) : UInt32
    C.TdhEnumerateProvidersForDecodingSource(filter, buffer, bufferSize, bufferRequired)
  end

  def tdhQueryProviderFieldInformation(pGuid : LibC::GUID*, event_field_value : UInt64, event_field_type : Win32cr::System::Diagnostics::Etw::EVENT_FIELD_TYPE, pBuffer : Win32cr::System::Diagnostics::Etw::PROVIDER_FIELD_INFOARRAY*, pBufferSize : UInt32*) : UInt32
    C.TdhQueryProviderFieldInformation(pGuid, event_field_value, event_field_type, pBuffer, pBufferSize)
  end

  def tdhEnumerateProviderFieldInformation(pGuid : LibC::GUID*, event_field_type : Win32cr::System::Diagnostics::Etw::EVENT_FIELD_TYPE, pBuffer : Win32cr::System::Diagnostics::Etw::PROVIDER_FIELD_INFOARRAY*, pBufferSize : UInt32*) : UInt32
    C.TdhEnumerateProviderFieldInformation(pGuid, event_field_type, pBuffer, pBufferSize)
  end

  def tdhEnumerateProviderFilters(guid : LibC::GUID*, tdh_context_count : UInt32, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, filter_count : UInt32*, buffer : Win32cr::System::Diagnostics::Etw::PROVIDER_FILTER_INFO**, buffer_size : UInt32*) : UInt32
    C.TdhEnumerateProviderFilters(guid, tdh_context_count, tdh_context, filter_count, buffer, buffer_size)
  end

  def tdhLoadManifest(manifest : Win32cr::Foundation::PWSTR) : UInt32
    C.TdhLoadManifest(manifest)
  end

  def tdhLoadManifestFromMemory(pData : Void*, cbData : UInt32) : UInt32
    C.TdhLoadManifestFromMemory(pData, cbData)
  end

  def tdhUnloadManifest(manifest : Win32cr::Foundation::PWSTR) : UInt32
    C.TdhUnloadManifest(manifest)
  end

  def tdhUnloadManifestFromMemory(pData : Void*, cbData : UInt32) : UInt32
    C.TdhUnloadManifestFromMemory(pData, cbData)
  end

  def tdhFormatProperty(event_info : Win32cr::System::Diagnostics::Etw::TRACE_EVENT_INFO*, map_info : Win32cr::System::Diagnostics::Etw::EVENT_MAP_INFO*, pointer_size : UInt32, property_in_type : UInt16, property_out_type : UInt16, property_length : UInt16, user_data_length : UInt16, user_data : UInt8*, buffer_size : UInt32*, buffer : Win32cr::Foundation::PWSTR, user_data_consumed : UInt16*) : UInt32
    C.TdhFormatProperty(event_info, map_info, pointer_size, property_in_type, property_out_type, property_length, user_data_length, user_data, buffer_size, buffer, user_data_consumed)
  end

  def tdhOpenDecodingHandle(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE*) : UInt32
    C.TdhOpenDecodingHandle(handle)
  end

  def tdhSetDecodingParameter(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*) : UInt32
    C.TdhSetDecodingParameter(handle, tdh_context)
  end

  def tdhGetDecodingParameter(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*) : UInt32
    C.TdhGetDecodingParameter(handle, tdh_context)
  end

  def tdhGetWppProperty(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, event_record : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, property_name : Win32cr::Foundation::PWSTR, buffer_size : UInt32*, buffer : UInt8*) : UInt32
    C.TdhGetWppProperty(handle, event_record, property_name, buffer_size, buffer)
  end

  def tdhGetWppMessage(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, event_record : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, buffer_size : UInt32*, buffer : UInt8*) : UInt32
    C.TdhGetWppMessage(handle, event_record, buffer_size, buffer)
  end

  def tdhCloseDecodingHandle(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE) : UInt32
    C.TdhCloseDecodingHandle(handle)
  end

  def tdhLoadManifestFromBinary(binary_path : Win32cr::Foundation::PWSTR) : UInt32
    C.TdhLoadManifestFromBinary(binary_path)
  end

  def tdhEnumerateManifestProviderEvents(provider_guid : LibC::GUID*, buffer : Win32cr::System::Diagnostics::Etw::PROVIDER_EVENT_INFO*, buffer_size : UInt32*) : UInt32
    C.TdhEnumerateManifestProviderEvents(provider_guid, buffer, buffer_size)
  end

  def tdhGetManifestEventInformation(provider_guid : LibC::GUID*, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, buffer : Win32cr::System::Diagnostics::Etw::TRACE_EVENT_INFO*, buffer_size : UInt32*) : UInt32
    C.TdhGetManifestEventInformation(provider_guid, event_descriptor, buffer, buffer_size)
  end

  def cveEventWrite(cve_id : Win32cr::Foundation::PWSTR, additional_details : Win32cr::Foundation::PWSTR) : Int32
    C.CveEventWrite(cve_id, additional_details)
  end

  @[Link("advapi32")]
  @[Link("tdh")]
  lib C
    # :nodoc:
    fun StartTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE*, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun StartTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE*, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun StopTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun StopTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun QueryTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun QueryTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun UpdateTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun UpdateTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun FlushTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun FlushTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun ControlTraceW(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PWSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*, control_code : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_CONTROL) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun ControlTraceA(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, instance_name : Win32cr::Foundation::PSTR, properties : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES*, control_code : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_CONTROL) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun QueryAllTracesW(property_array : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES**, property_array_count : UInt32, logger_count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun QueryAllTracesA(property_array : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_PROPERTIES**, property_array_count : UInt32, logger_count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun EnableTrace(enable : UInt32, enable_flag : UInt32, enable_level : UInt32, control_guid : LibC::GUID*, trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun EnableTraceEx(provider_id : LibC::GUID*, source_id : LibC::GUID*, trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, is_enabled : UInt32, level : UInt8, match_any_keyword : UInt64, match_all_keyword : UInt64, enable_property : UInt32, enable_filter_desc : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun EnableTraceEx2(trace_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, provider_id : LibC::GUID*, control_code : UInt32, level : UInt8, match_any_keyword : UInt64, match_all_keyword : UInt64, timeout : UInt32, enable_parameters : Win32cr::System::Diagnostics::Etw::ENABLE_TRACE_PARAMETERS*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun EnumerateTraceGuidsEx(trace_query_info_class : Win32cr::System::Diagnostics::Etw::TRACE_QUERY_INFO_CLASS, in_buffer : Void*, in_buffer_size : UInt32, out_buffer : Void*, out_buffer_size : UInt32, return_length : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun TraceSetInformation(session_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, information_class : Win32cr::System::Diagnostics::Etw::TRACE_QUERY_INFO_CLASS, trace_information : Void*, information_length : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun TraceQueryInformation(session_handle : Win32cr::System::Diagnostics::Etw::CONTROLTRACE_HANDLE, information_class : Win32cr::System::Diagnostics::Etw::TRACE_QUERY_INFO_CLASS, trace_information : Void*, information_length : UInt32, return_length : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun CreateTraceInstanceId(reg_handle : Win32cr::Foundation::HANDLE, inst_info : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_INFO*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun TraceEvent(trace_handle : UInt64, event_trace : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_HEADER*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun TraceEventInstance(trace_handle : UInt64, event_trace : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_HEADER*, inst_info : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_INFO*, parent_inst_info : Win32cr::System::Diagnostics::Etw::EVENT_INSTANCE_INFO*) : UInt32

    # :nodoc:
    fun RegisterTraceGuidsW(request_address : Win32cr::System::Diagnostics::Etw::WMIDPREQUEST, request_context : Void*, control_guid : LibC::GUID*, guid_count : UInt32, trace_guid_reg : Win32cr::System::Diagnostics::Etw::TRACE_GUID_REGISTRATION*, mof_image_path : Win32cr::Foundation::PWSTR, mof_resource_name : Win32cr::Foundation::PWSTR, registration_handle : UInt64*) : UInt32

    # :nodoc:
    fun RegisterTraceGuidsA(request_address : Win32cr::System::Diagnostics::Etw::WMIDPREQUEST, request_context : Void*, control_guid : LibC::GUID*, guid_count : UInt32, trace_guid_reg : Win32cr::System::Diagnostics::Etw::TRACE_GUID_REGISTRATION*, mof_image_path : Win32cr::Foundation::PSTR, mof_resource_name : Win32cr::Foundation::PSTR, registration_handle : UInt64*) : UInt32

    # :nodoc:
    fun EnumerateTraceGuids(guid_properties_array : Win32cr::System::Diagnostics::Etw::TRACE_GUID_PROPERTIES**, property_array_count : UInt32, guid_count : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun UnregisterTraceGuids(registration_handle : UInt64) : UInt32

    # :nodoc:
    fun GetTraceLoggerHandle(buffer : Void*) : UInt64

    # :nodoc:
    fun GetTraceEnableLevel(trace_handle : UInt64) : UInt8

    # :nodoc:
    fun GetTraceEnableFlags(trace_handle : UInt64) : UInt32

    # :nodoc:
    fun OpenTraceW(logfile : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_LOGFILEW*) : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE

    # :nodoc:
    fun ProcessTrace(handle_array : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE*, handle_count : UInt32, start_time : Win32cr::Foundation::FILETIME*, end_time : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun CloseTrace(trace_handle : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun QueryTraceProcessingHandle(processing_handle : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE, information_class : Win32cr::System::Diagnostics::Etw::ETW_PROCESS_HANDLE_INFO_TYPE, in_buffer : Void*, in_buffer_size : UInt32, out_buffer : Void*, out_buffer_size : UInt32, return_length : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun OpenTraceA(logfile : Win32cr::System::Diagnostics::Etw::EVENT_TRACE_LOGFILEA*) : Win32cr::System::Diagnostics::Etw::PROCESSTRACE_HANDLE

    # :nodoc:
    fun SetTraceCallback(pGuid : LibC::GUID*, event_callback : Win32cr::System::Diagnostics::Etw::PEVENT_CALLBACK) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun RemoveTraceCallback(pGuid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun TraceMessage(logger_handle : UInt64, message_flags : Win32cr::System::Diagnostics::Etw::TRACE_MESSAGE_FLAGS, message_guid : LibC::GUID*, message_number : UInt16) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun TraceMessageVa(logger_handle : UInt64, message_flags : Win32cr::System::Diagnostics::Etw::TRACE_MESSAGE_FLAGS, message_guid : LibC::GUID*, message_number : UInt16, message_arg_list : Int8*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun EventRegister(provider_id : LibC::GUID*, enable_callback : Win32cr::System::Diagnostics::Etw::PENABLECALLBACK, callback_context : Void*, reg_handle : UInt64*) : UInt32

    # :nodoc:
    fun EventUnregister(reg_handle : UInt64) : UInt32

    # :nodoc:
    fun EventSetInformation(reg_handle : UInt64, information_class : Win32cr::System::Diagnostics::Etw::EVENT_INFO_CLASS, event_information : Void*, information_length : UInt32) : UInt32

    # :nodoc:
    fun EventEnabled(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun EventProviderEnabled(reg_handle : UInt64, level : UInt8, keyword : UInt64) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun EventWrite(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, user_data_count : UInt32, user_data : Win32cr::System::Diagnostics::Etw::EVENT_DATA_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun EventWriteTransfer(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, activity_id : LibC::GUID*, related_activity_id : LibC::GUID*, user_data_count : UInt32, user_data : Win32cr::System::Diagnostics::Etw::EVENT_DATA_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun EventWriteEx(reg_handle : UInt64, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, filter : UInt64, flags : UInt32, activity_id : LibC::GUID*, related_activity_id : LibC::GUID*, user_data_count : UInt32, user_data : Win32cr::System::Diagnostics::Etw::EVENT_DATA_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun EventWriteString(reg_handle : UInt64, level : UInt8, keyword : UInt64, string : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun EventActivityIdControl(control_code : UInt32, activity_id : LibC::GUID*) : UInt32

    # :nodoc:
    fun EventAccessControl(guid : LibC::GUID*, operation : UInt32, sid : Win32cr::Foundation::PSID, rights : UInt32, allow_or_deny : Win32cr::Foundation::BOOLEAN) : UInt32

    # :nodoc:
    fun EventAccessQuery(guid : LibC::GUID*, buffer : Win32cr::Security::PSECURITY_DESCRIPTOR, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun EventAccessRemove(guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun TdhCreatePayloadFilter(provider_guid : LibC::GUID*, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, event_match_any : Win32cr::Foundation::BOOLEAN, payload_predicate_count : UInt32, payload_predicates : Win32cr::System::Diagnostics::Etw::PAYLOAD_FILTER_PREDICATE*, payload_filter : Void**) : UInt32

    # :nodoc:
    fun TdhDeletePayloadFilter(payload_filter : Void**) : UInt32

    # :nodoc:
    fun TdhAggregatePayloadFilters(payload_filter_count : UInt32, payload_filter_ptrs : Void**, event_match_all_flags : Win32cr::Foundation::BOOLEAN*, event_filter_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun TdhCleanupPayloadEventFilterDescriptor(event_filter_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_FILTER_DESCRIPTOR*) : UInt32

    # :nodoc:
    fun TdhGetEventInformation(event : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, tdh_context_count : UInt32, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, buffer : Win32cr::System::Diagnostics::Etw::TRACE_EVENT_INFO*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun TdhGetEventMapInformation(pEvent : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, pMapName : Win32cr::Foundation::PWSTR, pBuffer : Win32cr::System::Diagnostics::Etw::EVENT_MAP_INFO*, pBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun TdhGetPropertySize(pEvent : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, tdh_context_count : UInt32, pTdhContext : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, property_data_count : UInt32, pPropertyData : Win32cr::System::Diagnostics::Etw::PROPERTY_DATA_DESCRIPTOR*, pPropertySize : UInt32*) : UInt32

    # :nodoc:
    fun TdhGetProperty(pEvent : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, tdh_context_count : UInt32, pTdhContext : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, property_data_count : UInt32, pPropertyData : Win32cr::System::Diagnostics::Etw::PROPERTY_DATA_DESCRIPTOR*, buffer_size : UInt32, pBuffer : UInt8*) : UInt32

    # :nodoc:
    fun TdhEnumerateProviders(pBuffer : Win32cr::System::Diagnostics::Etw::PROVIDER_ENUMERATION_INFO*, pBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun TdhEnumerateProvidersForDecodingSource(filter : Win32cr::System::Diagnostics::Etw::DECODING_SOURCE, buffer : Win32cr::System::Diagnostics::Etw::PROVIDER_ENUMERATION_INFO*, bufferSize : UInt32, bufferRequired : UInt32*) : UInt32

    # :nodoc:
    fun TdhQueryProviderFieldInformation(pGuid : LibC::GUID*, event_field_value : UInt64, event_field_type : Win32cr::System::Diagnostics::Etw::EVENT_FIELD_TYPE, pBuffer : Win32cr::System::Diagnostics::Etw::PROVIDER_FIELD_INFOARRAY*, pBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun TdhEnumerateProviderFieldInformation(pGuid : LibC::GUID*, event_field_type : Win32cr::System::Diagnostics::Etw::EVENT_FIELD_TYPE, pBuffer : Win32cr::System::Diagnostics::Etw::PROVIDER_FIELD_INFOARRAY*, pBufferSize : UInt32*) : UInt32

    # :nodoc:
    fun TdhEnumerateProviderFilters(guid : LibC::GUID*, tdh_context_count : UInt32, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*, filter_count : UInt32*, buffer : Win32cr::System::Diagnostics::Etw::PROVIDER_FILTER_INFO**, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun TdhLoadManifest(manifest : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun TdhLoadManifestFromMemory(pData : Void*, cbData : UInt32) : UInt32

    # :nodoc:
    fun TdhUnloadManifest(manifest : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun TdhUnloadManifestFromMemory(pData : Void*, cbData : UInt32) : UInt32

    # :nodoc:
    fun TdhFormatProperty(event_info : Win32cr::System::Diagnostics::Etw::TRACE_EVENT_INFO*, map_info : Win32cr::System::Diagnostics::Etw::EVENT_MAP_INFO*, pointer_size : UInt32, property_in_type : UInt16, property_out_type : UInt16, property_length : UInt16, user_data_length : UInt16, user_data : UInt8*, buffer_size : UInt32*, buffer : Win32cr::Foundation::PWSTR, user_data_consumed : UInt16*) : UInt32

    # :nodoc:
    fun TdhOpenDecodingHandle(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE*) : UInt32

    # :nodoc:
    fun TdhSetDecodingParameter(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*) : UInt32

    # :nodoc:
    fun TdhGetDecodingParameter(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, tdh_context : Win32cr::System::Diagnostics::Etw::TDH_CONTEXT*) : UInt32

    # :nodoc:
    fun TdhGetWppProperty(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, event_record : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, property_name : Win32cr::Foundation::PWSTR, buffer_size : UInt32*, buffer : UInt8*) : UInt32

    # :nodoc:
    fun TdhGetWppMessage(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE, event_record : Win32cr::System::Diagnostics::Etw::EVENT_RECORD*, buffer_size : UInt32*, buffer : UInt8*) : UInt32

    # :nodoc:
    fun TdhCloseDecodingHandle(handle : Win32cr::System::Diagnostics::Etw::TDH_HANDLE) : UInt32

    # :nodoc:
    fun TdhLoadManifestFromBinary(binary_path : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun TdhEnumerateManifestProviderEvents(provider_guid : LibC::GUID*, buffer : Win32cr::System::Diagnostics::Etw::PROVIDER_EVENT_INFO*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun TdhGetManifestEventInformation(provider_guid : LibC::GUID*, event_descriptor : Win32cr::System::Diagnostics::Etw::EVENT_DESCRIPTOR*, buffer : Win32cr::System::Diagnostics::Etw::TRACE_EVENT_INFO*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun CveEventWrite(cve_id : Win32cr::Foundation::PWSTR, additional_details : Win32cr::Foundation::PWSTR) : Int32

  end
end