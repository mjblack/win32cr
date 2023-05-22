require "../foundation.cr"
require "../system/com.cr"
require "../system/ole.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:loadperf.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:pdh.dll")]
lib LibWin32
  alias PerfProviderHandle = LibC::IntPtrT
  alias PerfQueryHandle = LibC::IntPtrT

  MAX_COUNTER_PATH = 256_u32
  PDH_MAX_COUNTER_NAME = 1024_u32
  PDH_MAX_INSTANCE_NAME = 1024_u32
  PDH_MAX_COUNTER_PATH = 2048_u32
  PDH_MAX_DATASOURCE_PATH = 1024_u32
  H_WBEM_DATASOURCE = -1_i32
  PDH_MAX_SCALE = 7_i32
  PDH_MIN_SCALE = -7_i32
  PDH_NOEXPANDCOUNTERS = 1_u32
  PDH_NOEXPANDINSTANCES = 2_u32
  PDH_REFRESHCOUNTERS = 4_u32
  PDH_LOG_TYPE_RETIRED_BIN = 3_u32
  PDH_LOG_TYPE_TRACE_KERNEL = 4_u32
  PDH_LOG_TYPE_TRACE_GENERIC = 5_u32
  PERF_PROVIDER_USER_MODE = 0_u32
  PERF_PROVIDER_KERNEL_MODE = 1_u32
  PERF_PROVIDER_DRIVER = 2_u32
  PERF_COUNTERSET_FLAG_MULTIPLE = 2_u32
  PERF_COUNTERSET_FLAG_AGGREGATE = 4_u32
  PERF_COUNTERSET_FLAG_HISTORY = 8_u32
  PERF_COUNTERSET_FLAG_INSTANCE = 16_u32
  PERF_COUNTERSET_SINGLE_INSTANCE = 0_u32
  PERF_COUNTERSET_MULTI_INSTANCES = 2_u32
  PERF_COUNTERSET_SINGLE_AGGREGATE = 4_u32
  PERF_AGGREGATE_MAX = 4_u32
  PERF_ATTRIB_BY_REFERENCE = 1_u64
  PERF_ATTRIB_NO_DISPLAYABLE = 2_u64
  PERF_ATTRIB_NO_GROUP_SEPARATOR = 4_u64
  PERF_ATTRIB_DISPLAY_AS_REAL = 8_u64
  PERF_ATTRIB_DISPLAY_AS_HEX = 16_u64
  PERF_WILDCARD_COUNTER = 4294967295_u32
  PERF_MAX_INSTANCE_NAME = 1024_u32
  PERF_ADD_COUNTER = 1_u32
  PERF_REMOVE_COUNTER = 2_u32
  PERF_ENUM_INSTANCES = 3_u32
  PERF_COLLECT_START = 5_u32
  PERF_COLLECT_END = 6_u32
  PERF_FILTER = 9_u32
  PERF_DATA_VERSION = 1_u32
  PERF_DATA_REVISION = 1_u32
  PERF_NO_INSTANCES = -1_i32
  PERF_METADATA_MULTIPLE_INSTANCES = -2_i32
  PERF_METADATA_NO_INSTANCES = -3_i32
  PERF_SIZE_DWORD = 0_u32
  PERF_SIZE_LARGE = 256_u32
  PERF_SIZE_ZERO = 512_u32
  PERF_SIZE_VARIABLE_LEN = 768_u32
  PERF_TYPE_NUMBER = 0_u32
  PERF_TYPE_COUNTER = 1024_u32
  PERF_TYPE_TEXT = 2048_u32
  PERF_TYPE_ZERO = 3072_u32
  PERF_NUMBER_HEX = 0_u32
  PERF_NUMBER_DECIMAL = 65536_u32
  PERF_NUMBER_DEC_1000 = 131072_u32
  PERF_COUNTER_VALUE = 0_u32
  PERF_COUNTER_RATE = 65536_u32
  PERF_COUNTER_FRACTION = 131072_u32
  PERF_COUNTER_BASE = 196608_u32
  PERF_COUNTER_ELAPSED = 262144_u32
  PERF_COUNTER_QUEUELEN = 327680_u32
  PERF_COUNTER_HISTOGRAM = 393216_u32
  PERF_COUNTER_PRECISION = 458752_u32
  PERF_TEXT_UNICODE = 0_u32
  PERF_TEXT_ASCII = 65536_u32
  PERF_TIMER_TICK = 0_u32
  PERF_TIMER_100NS = 1048576_u32
  PERF_OBJECT_TIMER = 2097152_u32
  PERF_DELTA_COUNTER = 4194304_u32
  PERF_DELTA_BASE = 8388608_u32
  PERF_INVERSE_COUNTER = 16777216_u32
  PERF_MULTI_COUNTER = 33554432_u32
  PERF_DISPLAY_NO_SUFFIX = 0_u32
  PERF_DISPLAY_PER_SEC = 268435456_u32
  PERF_DISPLAY_PERCENT = 536870912_u32
  PERF_DISPLAY_SECONDS = 805306368_u32
  PERF_DISPLAY_NOSHOW = 1073741824_u32
  PERF_COUNTER_HISTOGRAM_TYPE = 2147483648_u32
  PERF_NO_UNIQUE_ID = -1_i32
  MAX_PERF_OBJECTS_IN_QUERY_FUNCTION = 64_i32
  WINPERF_LOG_NONE = 0_u32
  WINPERF_LOG_USER = 1_u32
  WINPERF_LOG_DEBUG = 2_u32
  WINPERF_LOG_VERBOSE = 3_u32
  LIBID_SystemMonitor = "1b773e42-2509-11cf-942f-008029004347"
  DIID_DICounterItem = "c08c4ff2-0e2e-11cf-942c-008029004347"
  DIID_DILogFileItem = "8d093ffc-f777-4917-82d1-833fbc54c58f"
  DIID_DISystemMonitor = "13d73d81-c32e-11cf-9398-00aa00a3ddea"
  DIID_DISystemMonitorInternal = "194eb242-c32c-11cf-9398-00aa00a3ddea"
  DIID_DISystemMonitorEvents = "84979930-4ab3-11cf-943a-008029004347"
  PDH_CSTATUS_VALID_DATA = 0_i32
  PDH_CSTATUS_NEW_DATA = 1_i32
  PDH_CSTATUS_NO_MACHINE = -2147481648_i32
  PDH_CSTATUS_NO_INSTANCE = -2147481647_i32
  PDH_MORE_DATA = -2147481646_i32
  PDH_CSTATUS_ITEM_NOT_VALIDATED = -2147481645_i32
  PDH_RETRY = -2147481644_i32
  PDH_NO_DATA = -2147481643_i32
  PDH_CALC_NEGATIVE_DENOMINATOR = -2147481642_i32
  PDH_CALC_NEGATIVE_TIMEBASE = -2147481641_i32
  PDH_CALC_NEGATIVE_VALUE = -2147481640_i32
  PDH_DIALOG_CANCELLED = -2147481639_i32
  PDH_END_OF_LOG_FILE = -2147481638_i32
  PDH_ASYNC_QUERY_TIMEOUT = -2147481637_i32
  PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE = -2147481636_i32
  PDH_UNABLE_MAP_NAME_FILES = -2147480619_i32
  PDH_PLA_VALIDATION_WARNING = -2147480589_i32
  PDH_CSTATUS_NO_OBJECT = -1073738824_i32
  PDH_CSTATUS_NO_COUNTER = -1073738823_i32
  PDH_CSTATUS_INVALID_DATA = -1073738822_i32
  PDH_MEMORY_ALLOCATION_FAILURE = -1073738821_i32
  PDH_INVALID_HANDLE = -1073738820_i32
  PDH_INVALID_ARGUMENT = -1073738819_i32
  PDH_FUNCTION_NOT_FOUND = -1073738818_i32
  PDH_CSTATUS_NO_COUNTERNAME = -1073738817_i32
  PDH_CSTATUS_BAD_COUNTERNAME = -1073738816_i32
  PDH_INVALID_BUFFER = -1073738815_i32
  PDH_INSUFFICIENT_BUFFER = -1073738814_i32
  PDH_CANNOT_CONNECT_MACHINE = -1073738813_i32
  PDH_INVALID_PATH = -1073738812_i32
  PDH_INVALID_INSTANCE = -1073738811_i32
  PDH_INVALID_DATA = -1073738810_i32
  PDH_NO_DIALOG_DATA = -1073738809_i32
  PDH_CANNOT_READ_NAME_STRINGS = -1073738808_i32
  PDH_LOG_FILE_CREATE_ERROR = -1073738807_i32
  PDH_LOG_FILE_OPEN_ERROR = -1073738806_i32
  PDH_LOG_TYPE_NOT_FOUND = -1073738805_i32
  PDH_NO_MORE_DATA = -1073738804_i32
  PDH_ENTRY_NOT_IN_LOG_FILE = -1073738803_i32
  PDH_DATA_SOURCE_IS_LOG_FILE = -1073738802_i32
  PDH_DATA_SOURCE_IS_REAL_TIME = -1073738801_i32
  PDH_UNABLE_READ_LOG_HEADER = -1073738800_i32
  PDH_FILE_NOT_FOUND = -1073738799_i32
  PDH_FILE_ALREADY_EXISTS = -1073738798_i32
  PDH_NOT_IMPLEMENTED = -1073738797_i32
  PDH_STRING_NOT_FOUND = -1073738796_i32
  PDH_UNKNOWN_LOG_FORMAT = -1073738794_i32
  PDH_UNKNOWN_LOGSVC_COMMAND = -1073738793_i32
  PDH_LOGSVC_QUERY_NOT_FOUND = -1073738792_i32
  PDH_LOGSVC_NOT_OPENED = -1073738791_i32
  PDH_WBEM_ERROR = -1073738790_i32
  PDH_ACCESS_DENIED = -1073738789_i32
  PDH_LOG_FILE_TOO_SMALL = -1073738788_i32
  PDH_INVALID_DATASOURCE = -1073738787_i32
  PDH_INVALID_SQLDB = -1073738786_i32
  PDH_NO_COUNTERS = -1073738785_i32
  PDH_SQL_ALLOC_FAILED = -1073738784_i32
  PDH_SQL_ALLOCCON_FAILED = -1073738783_i32
  PDH_SQL_EXEC_DIRECT_FAILED = -1073738782_i32
  PDH_SQL_FETCH_FAILED = -1073738781_i32
  PDH_SQL_ROWCOUNT_FAILED = -1073738780_i32
  PDH_SQL_MORE_RESULTS_FAILED = -1073738779_i32
  PDH_SQL_CONNECT_FAILED = -1073738778_i32
  PDH_SQL_BIND_FAILED = -1073738777_i32
  PDH_CANNOT_CONNECT_WMI_SERVER = -1073738776_i32
  PDH_PLA_COLLECTION_ALREADY_RUNNING = -1073738775_i32
  PDH_PLA_ERROR_SCHEDULE_OVERLAP = -1073738774_i32
  PDH_PLA_COLLECTION_NOT_FOUND = -1073738773_i32
  PDH_PLA_ERROR_SCHEDULE_ELAPSED = -1073738772_i32
  PDH_PLA_ERROR_NOSTART = -1073738771_i32
  PDH_PLA_ERROR_ALREADY_EXISTS = -1073738770_i32
  PDH_PLA_ERROR_TYPE_MISMATCH = -1073738769_i32
  PDH_PLA_ERROR_FILEPATH = -1073738768_i32
  PDH_PLA_SERVICE_ERROR = -1073738767_i32
  PDH_PLA_VALIDATION_ERROR = -1073738766_i32
  PDH_PLA_ERROR_NAME_TOO_LONG = -1073738764_i32
  PDH_INVALID_SQL_LOG_FORMAT = -1073738763_i32
  PDH_COUNTER_ALREADY_IN_QUERY = -1073738762_i32
  PDH_BINARY_LOG_CORRUPT = -1073738761_i32
  PDH_LOG_SAMPLE_TOO_SMALL = -1073738760_i32
  PDH_OS_LATER_VERSION = -1073738759_i32
  PDH_OS_EARLIER_VERSION = -1073738758_i32
  PDH_INCORRECT_APPEND_TIME = -1073738757_i32
  PDH_UNMATCHED_APPEND_COUNTER = -1073738756_i32
  PDH_SQL_ALTER_DETAIL_FAILED = -1073738755_i32
  PDH_QUERY_PERF_DATA_TIMEOUT = -1073738754_i32
  PLA_CAPABILITY_LOCAL = 268435456_u32
  PLA_CAPABILITY_V1_SVC = 1_u32
  PLA_CAPABILITY_V1_SESSION = 2_u32
  PLA_CAPABILITY_V1_SYSTEM = 4_u32
  PLA_CAPABILITY_LEGACY_SESSION = 8_u32
  PLA_CAPABILITY_LEGACY_SVC = 16_u32
  PLA_CAPABILITY_AUTOLOGGER = 32_u32
  S_PDH = "04d66358-c4a1-419b-8023-23b73902de2c"
  DataCollectorSet = LibC::GUID.new(0x3837521_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  TraceSession = LibC::GUID.new(0x383751c_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  TraceSessionCollection = LibC::GUID.new(0x3837530_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  TraceDataProvider = LibC::GUID.new(0x3837513_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  TraceDataProviderCollection = LibC::GUID.new(0x3837511_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  DataCollectorSetCollection = LibC::GUID.new(0x3837525_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  LegacyDataCollectorSet = LibC::GUID.new(0x3837526_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  LegacyDataCollectorSetCollection = LibC::GUID.new(0x3837527_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  LegacyTraceSession = LibC::GUID.new(0x3837528_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  LegacyTraceSessionCollection = LibC::GUID.new(0x3837529_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  ServerDataCollectorSet = LibC::GUID.new(0x3837531_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  ServerDataCollectorSetCollection = LibC::GUID.new(0x3837532_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  SystemDataCollectorSet = LibC::GUID.new(0x3837546_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  SystemDataCollectorSetCollection = LibC::GUID.new(0x3837547_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  BootTraceSession = LibC::GUID.new(0x3837538_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  BootTraceSessionCollection = LibC::GUID.new(0x3837539_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  SystemMonitor = LibC::GUID.new(0xc4d2d8e0_u32, 0xd1dd_u16, 0x11ce_u16, StaticArray[0x94_u8, 0xf_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  CounterItem = LibC::GUID.new(0xc4d2d8e0_u32, 0xd1dd_u16, 0x11ce_u16, StaticArray[0x94_u8, 0xf_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x48_u8])
  Counters = LibC::GUID.new(0xb2b066d2_u32, 0x2aac_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2f_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  LogFileItem = LibC::GUID.new(0x16ec5be8_u32, 0xdf93_u16, 0x4237_u16, StaticArray[0x94_u8, 0xe4_u8, 0x9e_u8, 0xe9_u8, 0x18_u8, 0x11_u8, 0x1d_u8, 0x71_u8])
  LogFiles = LibC::GUID.new(0x2735d9fd_u32, 0xf6b9_u16, 0x4f19_u16, StaticArray[0xa5_u8, 0xd9_u8, 0xe2_u8, 0xd0_u8, 0x68_u8, 0x58_u8, 0x4b_u8, 0xc5_u8])
  CounterItem2 = LibC::GUID.new(0x43196c62_u32, 0xc31f_u16, 0x4ce3_u16, StaticArray[0xa0_u8, 0x2e_u8, 0x79_u8, 0xef_u8, 0xe0_u8, 0xf6_u8, 0xa5_u8, 0x25_u8])
  SystemMonitor2 = LibC::GUID.new(0x7f30578c_u32, 0x5f38_u16, 0x4612_u16, StaticArray[0xac_u8, 0xfe_u8, 0x6e_u8, 0xd0_u8, 0x4c_u8, 0x7b_u8, 0x7a_u8, 0xf8_u8])
  AppearPropPage = LibC::GUID.new(0xe49741e9_u32, 0x93a8_u16, 0x4ab1_u16, StaticArray[0x8e_u8, 0x96_u8, 0xbf_u8, 0x44_u8, 0x82_u8, 0x28_u8, 0x2e_u8, 0x9c_u8])
  GeneralPropPage = LibC::GUID.new(0xc3e5d3d2_u32, 0x1a03_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2d_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  GraphPropPage = LibC::GUID.new(0xc3e5d3d3_u32, 0x1a03_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2d_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  SourcePropPage = LibC::GUID.new(0xcf32aa1_u32, 0x7571_u16, 0x11d0_u16, StaticArray[0x93_u8, 0xc4_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
  CounterPropPage = LibC::GUID.new(0xcf948561_u32, 0xede8_u16, 0x11ce_u16, StaticArray[0x94_u8, 0x1e_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])

  alias PLA_CABEXTRACT_CALLBACK = Proc(LibC::LPWSTR, Void*, Void)
  alias PERFLIBREQUEST = Proc(UInt32, Void*, UInt32, UInt32)
  alias PERF_MEM_ALLOC = Proc(LibC::UINT_PTR, Void*, Void*)
  alias PERF_MEM_FREE = Proc(Void*, Void*, Void)
  alias PM_OPEN_PROC = Proc(LibC::LPWSTR, UInt32)
  alias PM_COLLECT_PROC = Proc(LibC::LPWSTR, Void**, UInt32*, UInt32*, UInt32)
  alias PM_CLOSE_PROC = Proc(UInt32)
  alias CounterPathCallBack = Proc(LibC::UINT_PTR, Int32)


  enum PERF_DETAIL : UInt32
    PERF_DETAIL_NOVICE = 100
    PERF_DETAIL_ADVANCED = 200
    PERF_DETAIL_EXPERT = 300
    PERF_DETAIL_WIZARD = 400
  end

  enum REAL_TIME_DATA_SOURCE_ID_FLAGS : UInt32
    DATA_SOURCE_REGISTRY = 1
    DATA_SOURCE_WBEM = 4
  end

  enum PDH_PATH_FLAGS : UInt32
    PDH_PATH_WBEM_RESULT = 1
    PDH_PATH_WBEM_INPUT = 2
    PDH_PATH_WBEM_NONE = 0
  end

  enum PDH_FMT : UInt32
    PDH_FMT_DOUBLE = 512
    PDH_FMT_LARGE = 1024
    PDH_FMT_LONG = 256
  end

  enum PDH_LOG_TYPE : UInt32
    PDH_LOG_TYPE_UNDEFINED = 0
    PDH_LOG_TYPE_CSV = 1
    PDH_LOG_TYPE_SQL = 7
    PDH_LOG_TYPE_TSV = 2
    PDH_LOG_TYPE_BINARY = 8
    PDH_LOG_TYPE_PERFMON = 6
  end

  enum PDH_LOG : UInt32
    PDH_LOG_READ_ACCESS = 65536
    PDH_LOG_WRITE_ACCESS = 131072
    PDH_LOG_UPDATE_ACCESS = 262144
  end

  enum PDH_SELECT_DATA_SOURCE_FLAGS : UInt32
    PDH_FLAGS_FILE_BROWSER_ONLY = 1
    PDH_FLAGS_NONE = 0
  end

  enum PDH_DLL_VERSION : UInt32
    PDH_CVERSION_WIN50 = 1280
    PDH_VERSION = 1283
  end

  enum PERF_COUNTER_AGGREGATE_FUNC : UInt32
    PERF_AGGREGATE_UNDEFINED = 0
    PERF_AGGREGATE_TOTAL = 1
    PERF_AGGREGATE_AVG = 2
    PERF_AGGREGATE_MIN = 3
  end

  enum DataCollectorType : Int32
    Plaperformancecounter = 0
    Platrace = 1
    Placonfiguration = 2
    Plaalert = 3
    Plaapitrace = 4
  end

  enum FileFormat : Int32
    Placommaseparated = 0
    Platabseparated = 1
    Plasql = 2
    Plabinary = 3
  end

  enum AutoPathFormat : Int32
    Planone = 0
    Plapattern = 1
    Placomputer = 2
    Plamonthdayhour = 256
    Plaserialnumber = 512
    Playeardayofyear = 1024
    Playearmonth = 2048
    Playearmonthday = 4096
    Playearmonthdayhour = 8192
    Plamonthdayhourminute = 16384
  end

  enum DataCollectorSetStatus : Int32
    Plastopped = 0
    Plarunning = 1
    Placompiling = 2
    Plapending = 3
    Plaundefined = 4
  end

  enum ClockType : Int32
    Platimestamp = 0
    Plaperformance = 1
    Plasystem = 2
    Placycle = 3
  end

  enum StreamMode : Int32
    Plafile = 1
    Plarealtime = 2
    Plaboth = 3
    Plabuffering = 4
  end

  enum CommitMode : Int32
    Placreatenew = 1
    Plamodify = 2
    Placreateormodify = 3
    Plaupdaterunninginstance = 16
    Plaflushtrace = 32
    Plavalidateonly = 4096
  end

  enum ValueMapType : Int32
    Plaindex = 1
    Plaflag = 2
    Plaflagarray = 3
    Plavalidation = 4
  end

  enum WeekDays : Int32
    Plarunonce = 0
    Plasunday = 1
    Plamonday = 2
    Platuesday = 4
    Plawednesday = 8
    Plathursday = 16
    Plafriday = 32
    Plasaturday = 64
    Plaeveryday = 127
  end

  enum ResourcePolicy : Int32
    Pladeletelargest = 0
    Pladeleteoldest = 1
  end

  enum DataManagerSteps : Int32
    Placreatereport = 1
    Plarunrules = 2
    Placreatehtml = 4
    Plafolderactions = 8
    Plaresourcefreeing = 16
  end

  enum FolderActionSteps : Int32
    Placreatecab = 1
    Pladeletedata = 2
    Plasendcab = 4
    Pladeletecab = 8
    Pladeletereport = 16
  end

  enum PerfRegInfoType : Int32
    PERF_REG_COUNTERSET_STRUCT = 1
    PERF_REG_COUNTER_STRUCT = 2
    PERF_REG_COUNTERSET_NAME_STRING = 3
    PERF_REG_COUNTERSET_HELP_STRING = 4
    PERF_REG_COUNTER_NAME_STRINGS = 5
    PERF_REG_COUNTER_HELP_STRINGS = 6
    PERF_REG_PROVIDER_NAME = 7
    PERF_REG_PROVIDER_GUID = 8
    PERF_REG_COUNTERSET_ENGLISH_NAME = 9
    PERF_REG_COUNTER_ENGLISH_NAMES = 10
  end

  enum PerfCounterDataType : Int32
    PERF_ERROR_RETURN = 0
    PERF_SINGLE_COUNTER = 1
    PERF_MULTIPLE_COUNTERS = 2
    PERF_MULTIPLE_INSTANCES = 4
    PERF_COUNTERSET = 6
  end

  enum DisplayTypeConstants : Int32
    Sysmonlinegraph = 1
    Sysmonhistogram = 2
    Sysmonreport = 3
    Sysmonchartarea = 4
    Sysmonchartstackedarea = 5
  end

  enum ReportValueTypeConstants : Int32
    Sysmondefaultvalue = 0
    Sysmoncurrentvalue = 1
    Sysmonaverage = 2
    Sysmonminimum = 3
    Sysmonmaximum = 4
  end

  enum DataSourceTypeConstants : Int32
    Sysmonnulldatasource = -1
    Sysmoncurrentactivity = 1
    Sysmonlogfiles = 2
    Sysmonsqllog = 3
  end

  enum SysmonFileType : Int32
    Sysmonfilehtml = 1
    Sysmonfilereport = 2
    Sysmonfilecsv = 3
    Sysmonfiletsv = 4
    Sysmonfileblg = 5
    Sysmonfileretiredblg = 6
    Sysmonfilegif = 7
  end

  enum SysmonDataType : Int32
    Sysmondataavg = 1
    Sysmondatamin = 2
    Sysmondatamax = 3
    Sysmondatatime = 4
    Sysmondatacount = 5
  end

  enum SysmonBatchReason : Int32
    Sysmonbatchnone = 0
    Sysmonbatchaddfiles = 1
    Sysmonbatchaddcounters = 2
    Sysmonbatchaddfilesautocounters = 3
  end

union PDH_FMT_COUNTERVALUE_Anonymous_e__Union
  long_value : Int32
  double_value : Float64
  large_value : Int64
  ansi_string_value : PSTR
  wide_string_value : LibC::LPWSTR
end
union PDH_COUNTER_INFO_A_Anonymous_e__Union
  data_item_path : PDH_DATA_ITEM_PATH_ELEMENTS_A
  counter_path : PDH_COUNTER_PATH_ELEMENTS_A
  anonymous : PDH_COUNTER_INFO_A_Anonymous_e__Union_Anonymous_e__Struct
end
union PDH_COUNTER_INFO_W_Anonymous_e__Union
  data_item_path : PDH_DATA_ITEM_PATH_ELEMENTS_W
  counter_path : PDH_COUNTER_PATH_ELEMENTS_W
  anonymous : PDH_COUNTER_INFO_W_Anonymous_e__Union_Anonymous_e__Struct
end
union PDH_LOG_SERVICE_QUERY_INFO_A_Anonymous_e__Union
  anonymous1 : PDH_LOG_SERVICE_QUERY_INFO_A_Anonymous_e__Union_Anonymous1_e__Struct
  anonymous2 : PDH_LOG_SERVICE_QUERY_INFO_A_Anonymous_e__Union_Anonymous2_e__Struct
end
union PDH_LOG_SERVICE_QUERY_INFO_W_Anonymous_e__Union
  anonymous1 : PDH_LOG_SERVICE_QUERY_INFO_W_Anonymous_e__Union_Anonymous1_e__Struct
  anonymous2 : PDH_LOG_SERVICE_QUERY_INFO_W_Anonymous_e__Union_Anonymous2_e__Struct
end

  struct PERF_COUNTERSET_INFO
    counter_set_guid : Guid
    provider_guid : Guid
    num_counters : UInt32
    instance_type : UInt32
  end
  struct PERF_COUNTER_INFO
    counter_id : UInt32
    type : UInt32
    attrib : UInt64
    size : UInt32
    detail_level : UInt32
    scale : Int32
    offset : UInt32
  end
  struct PERF_COUNTERSET_INSTANCE
    counter_set_guid : Guid
    dw_size : UInt32
    instance_id : UInt32
    instance_name_offset : UInt32
    instance_name_size : UInt32
  end
  struct PERF_COUNTER_IDENTITY
    counter_set_guid : Guid
    buffer_size : UInt32
    counter_id : UInt32
    instance_id : UInt32
    machine_offset : UInt32
    name_offset : UInt32
    reserved : UInt32
  end
  struct PERF_PROVIDER_CONTEXT
    context_size : UInt32
    reserved : UInt32
    control_callback : PERFLIBREQUEST
    mem_alloc_routine : PERF_MEM_ALLOC
    mem_free_routine : PERF_MEM_FREE
    p_mem_context : Void*
  end
  struct PERF_INSTANCE_HEADER
    size : UInt32
    instance_id : UInt32
  end
  struct PERF_COUNTERSET_REG_INFO
    counter_set_guid : Guid
    counter_set_type : UInt32
    detail_level : UInt32
    num_counters : UInt32
    instance_type : UInt32
  end
  struct PERF_COUNTER_REG_INFO
    counter_id : UInt32
    type : UInt32
    attrib : UInt64
    detail_level : UInt32
    default_scale : Int32
    base_counter_id : UInt32
    perf_time_id : UInt32
    perf_freq_id : UInt32
    multi_id : UInt32
    aggregate_func : PERF_COUNTER_AGGREGATE_FUNC
    reserved : UInt32
  end
  struct PERF_STRING_BUFFER_HEADER
    dw_size : UInt32
    dw_counters : UInt32
  end
  struct PERF_STRING_COUNTER_HEADER
    dw_counter_id : UInt32
    dw_offset : UInt32
  end
  struct PERF_COUNTER_IDENTIFIER
    counter_set_guid : Guid
    status : UInt32
    size : UInt32
    counter_id : UInt32
    instance_id : UInt32
    index : UInt32
    reserved : UInt32
  end
  struct PERF_DATA_HEADER
    dw_total_size : UInt32
    dw_num_counters : UInt32
    perf_time_stamp : Int64
    perf_time100_n_sec : Int64
    perf_freq : Int64
    system_time : SYSTEMTIME
  end
  struct PERF_COUNTER_HEADER
    dw_status : UInt32
    dw_type : PerfCounterDataType
    dw_size : UInt32
    reserved : UInt32
  end
  struct PERF_MULTI_INSTANCES
    dw_total_size : UInt32
    dw_instances : UInt32
  end
  struct PERF_MULTI_COUNTERS
    dw_size : UInt32
    dw_counters : UInt32
  end
  struct PERF_COUNTER_DATA
    dw_data_size : UInt32
    dw_size : UInt32
  end
  struct PERF_DATA_BLOCK
    signature : Char[4]*
    little_endian : UInt32
    version : UInt32
    revision : UInt32
    total_byte_length : UInt32
    header_length : UInt32
    num_object_types : UInt32
    default_object : Int32
    system_time : SYSTEMTIME
    perf_time : LARGE_INTEGER
    perf_freq : LARGE_INTEGER
    perf_time100n_sec : LARGE_INTEGER
    system_name_length : UInt32
    system_name_offset : UInt32
  end
  struct PERF_OBJECT_TYPE
    total_byte_length : UInt32
    definition_length : UInt32
    header_length : UInt32
    object_name_title_index : UInt32
    object_name_title : UInt32
    object_help_title_index : UInt32
    object_help_title : UInt32
    detail_level : UInt32
    num_counters : UInt32
    default_counter : Int32
    num_instances : Int32
    code_page : UInt32
    perf_time : LARGE_INTEGER
    perf_freq : LARGE_INTEGER
  end
  struct PERF_COUNTER_DEFINITION
    byte_length : UInt32
    counter_name_title_index : UInt32
    counter_name_title : UInt32
    counter_help_title_index : UInt32
    counter_help_title : UInt32
    default_scale : Int32
    detail_level : UInt32
    counter_type : UInt32
    counter_size : UInt32
    counter_offset : UInt32
  end
  struct PERF_INSTANCE_DEFINITION
    byte_length : UInt32
    parent_object_title_index : UInt32
    parent_object_instance : UInt32
    unique_id : Int32
    name_offset : UInt32
    name_length : UInt32
  end
  struct PERF_COUNTER_BLOCK
    byte_length : UInt32
  end
  struct PDH_RAW_COUNTER
    c_status : UInt32
    time_stamp : FILETIME
    first_value : Int64
    second_value : Int64
    multi_count : UInt32
  end
  struct PDH_RAW_COUNTER_ITEM_A
    sz_name : PSTR
    raw_value : PDH_RAW_COUNTER
  end
  struct PDH_RAW_COUNTER_ITEM_W
    sz_name : LibC::LPWSTR
    raw_value : PDH_RAW_COUNTER
  end
  struct PDH_FMT_COUNTERVALUE
    c_status : UInt32
    anonymous : PDH_FMT_COUNTERVALUE_Anonymous_e__Union
  end
  struct PDH_FMT_COUNTERVALUE_ITEM_A
    sz_name : PSTR
    fmt_value : PDH_FMT_COUNTERVALUE
  end
  struct PDH_FMT_COUNTERVALUE_ITEM_W
    sz_name : LibC::LPWSTR
    fmt_value : PDH_FMT_COUNTERVALUE
  end
  struct PDH_STATISTICS
    dw_format : UInt32
    count : UInt32
    min : PDH_FMT_COUNTERVALUE
    max : PDH_FMT_COUNTERVALUE
    mean : PDH_FMT_COUNTERVALUE
  end
  struct PDH_COUNTER_PATH_ELEMENTS_A
    sz_machine_name : PSTR
    sz_object_name : PSTR
    sz_instance_name : PSTR
    sz_parent_instance : PSTR
    dw_instance_index : UInt32
    sz_counter_name : PSTR
  end
  struct PDH_COUNTER_PATH_ELEMENTS_W
    sz_machine_name : LibC::LPWSTR
    sz_object_name : LibC::LPWSTR
    sz_instance_name : LibC::LPWSTR
    sz_parent_instance : LibC::LPWSTR
    dw_instance_index : UInt32
    sz_counter_name : LibC::LPWSTR
  end
  struct PDH_DATA_ITEM_PATH_ELEMENTS_A
    sz_machine_name : PSTR
    object_guid : Guid
    dw_item_id : UInt32
    sz_instance_name : PSTR
  end
  struct PDH_DATA_ITEM_PATH_ELEMENTS_W
    sz_machine_name : LibC::LPWSTR
    object_guid : Guid
    dw_item_id : UInt32
    sz_instance_name : LibC::LPWSTR
  end
  struct PDH_COUNTER_INFO_A
    dw_length : UInt32
    dw_type : UInt32
    c_version : UInt32
    c_status : UInt32
    l_scale : Int32
    l_default_scale : Int32
    dw_user_data : LibC::UINT_PTR
    dw_query_user_data : LibC::UINT_PTR
    sz_full_path : PSTR
    anonymous : PDH_COUNTER_INFO_A_Anonymous_e__Union
    sz_explain_text : PSTR
    data_buffer : UInt32[0]*
  end
  struct PDH_COUNTER_INFO_A_Anonymous_e__Union_Anonymous_e__Struct
    sz_machine_name : PSTR
    sz_object_name : PSTR
    sz_instance_name : PSTR
    sz_parent_instance : PSTR
    dw_instance_index : UInt32
    sz_counter_name : PSTR
  end
  struct PDH_COUNTER_INFO_W
    dw_length : UInt32
    dw_type : UInt32
    c_version : UInt32
    c_status : UInt32
    l_scale : Int32
    l_default_scale : Int32
    dw_user_data : LibC::UINT_PTR
    dw_query_user_data : LibC::UINT_PTR
    sz_full_path : LibC::LPWSTR
    anonymous : PDH_COUNTER_INFO_W_Anonymous_e__Union
    sz_explain_text : LibC::LPWSTR
    data_buffer : UInt32[0]*
  end
  struct PDH_COUNTER_INFO_W_Anonymous_e__Union_Anonymous_e__Struct
    sz_machine_name : LibC::LPWSTR
    sz_object_name : LibC::LPWSTR
    sz_instance_name : LibC::LPWSTR
    sz_parent_instance : LibC::LPWSTR
    dw_instance_index : UInt32
    sz_counter_name : LibC::LPWSTR
  end
  struct PDH_TIME_INFO
    start_time : Int64
    end_time : Int64
    sample_count : UInt32
  end
  struct PDH_RAW_LOG_RECORD
    dw_structure_size : UInt32
    dw_record_type : PDH_LOG_TYPE
    dw_items : UInt32
    raw_bytes : UInt8[0]*
  end
  struct PDH_LOG_SERVICE_QUERY_INFO_A
    dw_size : UInt32
    dw_flags : UInt32
    dw_log_quota : UInt32
    sz_log_file_caption : PSTR
    sz_default_dir : PSTR
    sz_base_file_name : PSTR
    dw_file_type : UInt32
    dw_reserved : UInt32
    anonymous : PDH_LOG_SERVICE_QUERY_INFO_A_Anonymous_e__Union
  end
  struct PDH_LOG_SERVICE_QUERY_INFO_A_Anonymous_e__Union_Anonymous1_e__Struct
    pdl_auto_name_interval : UInt32
    pdl_auto_name_units : UInt32
    pdl_command_filename : PSTR
    pdl_counter_list : PSTR
    pdl_auto_name_format : UInt32
    pdl_sample_interval : UInt32
    pdl_log_start_time : FILETIME
    pdl_log_end_time : FILETIME
  end
  struct PDH_LOG_SERVICE_QUERY_INFO_A_Anonymous_e__Union_Anonymous2_e__Struct
    tl_number_of_buffers : UInt32
    tl_minimum_buffers : UInt32
    tl_maximum_buffers : UInt32
    tl_free_buffers : UInt32
    tl_buffer_size : UInt32
    tl_events_lost : UInt32
    tl_logger_thread_id : UInt32
    tl_buffers_written : UInt32
    tl_log_handle : UInt32
    tl_log_file_name : PSTR
  end
  struct PDH_LOG_SERVICE_QUERY_INFO_W
    dw_size : UInt32
    dw_flags : UInt32
    dw_log_quota : UInt32
    sz_log_file_caption : LibC::LPWSTR
    sz_default_dir : LibC::LPWSTR
    sz_base_file_name : LibC::LPWSTR
    dw_file_type : UInt32
    dw_reserved : UInt32
    anonymous : PDH_LOG_SERVICE_QUERY_INFO_W_Anonymous_e__Union
  end
  struct PDH_LOG_SERVICE_QUERY_INFO_W_Anonymous_e__Union_Anonymous1_e__Struct
    pdl_auto_name_interval : UInt32
    pdl_auto_name_units : UInt32
    pdl_command_filename : LibC::LPWSTR
    pdl_counter_list : LibC::LPWSTR
    pdl_auto_name_format : UInt32
    pdl_sample_interval : UInt32
    pdl_log_start_time : FILETIME
    pdl_log_end_time : FILETIME
  end
  struct PDH_LOG_SERVICE_QUERY_INFO_W_Anonymous_e__Union_Anonymous2_e__Struct
    tl_number_of_buffers : UInt32
    tl_minimum_buffers : UInt32
    tl_maximum_buffers : UInt32
    tl_free_buffers : UInt32
    tl_buffer_size : UInt32
    tl_events_lost : UInt32
    tl_logger_thread_id : UInt32
    tl_buffers_written : UInt32
    tl_log_handle : UInt32
    tl_log_file_name : LibC::LPWSTR
  end
  struct PDH_BROWSE_DLG_CONFIG_HW
    _bitfield : UInt32
    h_wnd_owner : HANDLE
    h_data_source : LibC::IntPtrT
    sz_return_path_buffer : LibC::LPWSTR
    cch_return_path_length : UInt32
    p_call_back : CounterPathCallBack
    dw_call_back_arg : LibC::UINT_PTR
    call_back_status : Int32
    dw_default_detail_level : PERF_DETAIL
    sz_dialog_box_caption : LibC::LPWSTR
  end
  struct PDH_BROWSE_DLG_CONFIG_HA
    _bitfield : UInt32
    h_wnd_owner : HANDLE
    h_data_source : LibC::IntPtrT
    sz_return_path_buffer : PSTR
    cch_return_path_length : UInt32
    p_call_back : CounterPathCallBack
    dw_call_back_arg : LibC::UINT_PTR
    call_back_status : Int32
    dw_default_detail_level : PERF_DETAIL
    sz_dialog_box_caption : PSTR
  end
  struct PDH_BROWSE_DLG_CONFIG_W
    _bitfield : UInt32
    h_wnd_owner : HANDLE
    sz_data_source : LibC::LPWSTR
    sz_return_path_buffer : LibC::LPWSTR
    cch_return_path_length : UInt32
    p_call_back : CounterPathCallBack
    dw_call_back_arg : LibC::UINT_PTR
    call_back_status : Int32
    dw_default_detail_level : PERF_DETAIL
    sz_dialog_box_caption : LibC::LPWSTR
  end
  struct PDH_BROWSE_DLG_CONFIG_A
    _bitfield : UInt32
    h_wnd_owner : HANDLE
    sz_data_source : PSTR
    sz_return_path_buffer : PSTR
    cch_return_path_length : UInt32
    p_call_back : CounterPathCallBack
    dw_call_back_arg : LibC::UINT_PTR
    call_back_status : Int32
    dw_default_detail_level : PERF_DETAIL
    sz_dialog_box_caption : PSTR
  end


  struct IDataCollectorSetVTbl
    query_interface : Proc(IDataCollectorSet*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataCollectorSet*, UInt32)
    release : Proc(IDataCollectorSet*, UInt32)
    get_type_info_count : Proc(IDataCollectorSet*, UInt32*, HRESULT)
    get_type_info : Proc(IDataCollectorSet*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDataCollectorSet*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDataCollectorSet*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collectors : Proc(IDataCollectorSet*, IDataCollectorCollection*, HRESULT)
    get_duration : Proc(IDataCollectorSet*, UInt32*, HRESULT)
    put_duration : Proc(IDataCollectorSet*, UInt32, HRESULT)
    get_description : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_description : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_description_unresolved : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_display_name : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_display_name : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_display_name_unresolved : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_keywords : Proc(IDataCollectorSet*, SAFEARRAY**, HRESULT)
    put_keywords : Proc(IDataCollectorSet*, SAFEARRAY*, HRESULT)
    get_latest_output_location : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_latest_output_location : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_name : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_output_location : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_root_path : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_root_path : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_segment : Proc(IDataCollectorSet*, Int16*, HRESULT)
    put_segment : Proc(IDataCollectorSet*, Int16, HRESULT)
    get_segment_max_duration : Proc(IDataCollectorSet*, UInt32*, HRESULT)
    put_segment_max_duration : Proc(IDataCollectorSet*, UInt32, HRESULT)
    get_segment_max_size : Proc(IDataCollectorSet*, UInt32*, HRESULT)
    put_segment_max_size : Proc(IDataCollectorSet*, UInt32, HRESULT)
    get_serial_number : Proc(IDataCollectorSet*, UInt32*, HRESULT)
    put_serial_number : Proc(IDataCollectorSet*, UInt32, HRESULT)
    get_server : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_status : Proc(IDataCollectorSet*, DataCollectorSetStatus*, HRESULT)
    get_subdirectory : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_subdirectory : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_subdirectory_format : Proc(IDataCollectorSet*, AutoPathFormat*, HRESULT)
    put_subdirectory_format : Proc(IDataCollectorSet*, AutoPathFormat, HRESULT)
    get_subdirectory_format_pattern : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_subdirectory_format_pattern : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_task : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_task : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_task_run_as_self : Proc(IDataCollectorSet*, Int16*, HRESULT)
    put_task_run_as_self : Proc(IDataCollectorSet*, Int16, HRESULT)
    get_task_arguments : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_task_arguments : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_task_user_text_arguments : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_task_user_text_arguments : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_schedules : Proc(IDataCollectorSet*, IScheduleCollection*, HRESULT)
    get_schedules_enabled : Proc(IDataCollectorSet*, Int16*, HRESULT)
    put_schedules_enabled : Proc(IDataCollectorSet*, Int16, HRESULT)
    get_user_account : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_xml : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    get_security : Proc(IDataCollectorSet*, UInt8*, HRESULT)
    put_security : Proc(IDataCollectorSet*, UInt8, HRESULT)
    get_stop_on_completion : Proc(IDataCollectorSet*, Int16*, HRESULT)
    put_stop_on_completion : Proc(IDataCollectorSet*, Int16, HRESULT)
    get_data_manager : Proc(IDataCollectorSet*, IDataManager*, HRESULT)
    set_credentials : Proc(IDataCollectorSet*, UInt8, UInt8, HRESULT)
    query : Proc(IDataCollectorSet*, UInt8, UInt8, HRESULT)
    commit : Proc(IDataCollectorSet*, UInt8, UInt8, CommitMode, IValueMap*, HRESULT)
    delete : Proc(IDataCollectorSet*, HRESULT)
    start : Proc(IDataCollectorSet*, Int16, HRESULT)
    stop : Proc(IDataCollectorSet*, Int16, HRESULT)
    set_xml : Proc(IDataCollectorSet*, UInt8, IValueMap*, HRESULT)
    set_value : Proc(IDataCollectorSet*, UInt8, UInt8, HRESULT)
    get_value : Proc(IDataCollectorSet*, UInt8, UInt8*, HRESULT)
  end

  struct IDataCollectorSet
    lpVtbl : IDataCollectorSetVTbl*
  end

  struct IDataManagerVTbl
    query_interface : Proc(IDataManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataManager*, UInt32)
    release : Proc(IDataManager*, UInt32)
    get_type_info_count : Proc(IDataManager*, UInt32*, HRESULT)
    get_type_info : Proc(IDataManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDataManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDataManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_enabled : Proc(IDataManager*, Int16*, HRESULT)
    put_enabled : Proc(IDataManager*, Int16, HRESULT)
    get_check_before_running : Proc(IDataManager*, Int16*, HRESULT)
    put_check_before_running : Proc(IDataManager*, Int16, HRESULT)
    get_min_free_disk : Proc(IDataManager*, UInt32*, HRESULT)
    put_min_free_disk : Proc(IDataManager*, UInt32, HRESULT)
    get_max_size : Proc(IDataManager*, UInt32*, HRESULT)
    put_max_size : Proc(IDataManager*, UInt32, HRESULT)
    get_max_folder_count : Proc(IDataManager*, UInt32*, HRESULT)
    put_max_folder_count : Proc(IDataManager*, UInt32, HRESULT)
    get_resource_policy : Proc(IDataManager*, ResourcePolicy*, HRESULT)
    put_resource_policy : Proc(IDataManager*, ResourcePolicy, HRESULT)
    get_folder_actions : Proc(IDataManager*, IFolderActionCollection*, HRESULT)
    get_report_schema : Proc(IDataManager*, UInt8*, HRESULT)
    put_report_schema : Proc(IDataManager*, UInt8, HRESULT)
    get_report_file_name : Proc(IDataManager*, UInt8*, HRESULT)
    put_report_file_name : Proc(IDataManager*, UInt8, HRESULT)
    get_rule_target_file_name : Proc(IDataManager*, UInt8*, HRESULT)
    put_rule_target_file_name : Proc(IDataManager*, UInt8, HRESULT)
    get_events_file_name : Proc(IDataManager*, UInt8*, HRESULT)
    put_events_file_name : Proc(IDataManager*, UInt8, HRESULT)
    get_rules : Proc(IDataManager*, UInt8*, HRESULT)
    put_rules : Proc(IDataManager*, UInt8, HRESULT)
    run : Proc(IDataManager*, DataManagerSteps, UInt8, IValueMap*, HRESULT)
    extract : Proc(IDataManager*, UInt8, UInt8, HRESULT)
  end

  struct IDataManager
    lpVtbl : IDataManagerVTbl*
  end

  struct IFolderActionVTbl
    query_interface : Proc(IFolderAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFolderAction*, UInt32)
    release : Proc(IFolderAction*, UInt32)
    get_type_info_count : Proc(IFolderAction*, UInt32*, HRESULT)
    get_type_info : Proc(IFolderAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFolderAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFolderAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_age : Proc(IFolderAction*, UInt32*, HRESULT)
    put_age : Proc(IFolderAction*, UInt32, HRESULT)
    get_size : Proc(IFolderAction*, UInt32*, HRESULT)
    put_size : Proc(IFolderAction*, UInt32, HRESULT)
    get_actions : Proc(IFolderAction*, FolderActionSteps*, HRESULT)
    put_actions : Proc(IFolderAction*, FolderActionSteps, HRESULT)
    get_send_cab_to : Proc(IFolderAction*, UInt8*, HRESULT)
    put_send_cab_to : Proc(IFolderAction*, UInt8, HRESULT)
  end

  struct IFolderAction
    lpVtbl : IFolderActionVTbl*
  end

  struct IFolderActionCollectionVTbl
    query_interface : Proc(IFolderActionCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFolderActionCollection*, UInt32)
    release : Proc(IFolderActionCollection*, UInt32)
    get_type_info_count : Proc(IFolderActionCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IFolderActionCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFolderActionCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFolderActionCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IFolderActionCollection*, UInt32*, HRESULT)
    get_item : Proc(IFolderActionCollection*, VARIANT, IFolderAction*, HRESULT)
    get__new_enum : Proc(IFolderActionCollection*, IUnknown*, HRESULT)
    add : Proc(IFolderActionCollection*, IFolderAction, HRESULT)
    remove : Proc(IFolderActionCollection*, VARIANT, HRESULT)
    clear : Proc(IFolderActionCollection*, HRESULT)
    add_range : Proc(IFolderActionCollection*, IFolderActionCollection, HRESULT)
    create_folder_action : Proc(IFolderActionCollection*, IFolderAction*, HRESULT)
  end

  struct IFolderActionCollection
    lpVtbl : IFolderActionCollectionVTbl*
  end

  struct IDataCollectorVTbl
    query_interface : Proc(IDataCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataCollector*, UInt32)
    release : Proc(IDataCollector*, UInt32)
    get_type_info_count : Proc(IDataCollector*, UInt32*, HRESULT)
    get_type_info : Proc(IDataCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDataCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDataCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collector_set : Proc(IDataCollector*, IDataCollectorSet*, HRESULT)
    put_data_collector_set : Proc(IDataCollector*, IDataCollectorSet, HRESULT)
    get_data_collector_type : Proc(IDataCollector*, DataCollectorType*, HRESULT)
    get_file_name : Proc(IDataCollector*, UInt8*, HRESULT)
    put_file_name : Proc(IDataCollector*, UInt8, HRESULT)
    get_file_name_format : Proc(IDataCollector*, AutoPathFormat*, HRESULT)
    put_file_name_format : Proc(IDataCollector*, AutoPathFormat, HRESULT)
    get_file_name_format_pattern : Proc(IDataCollector*, UInt8*, HRESULT)
    put_file_name_format_pattern : Proc(IDataCollector*, UInt8, HRESULT)
    get_latest_output_location : Proc(IDataCollector*, UInt8*, HRESULT)
    put_latest_output_location : Proc(IDataCollector*, UInt8, HRESULT)
    get_log_append : Proc(IDataCollector*, Int16*, HRESULT)
    put_log_append : Proc(IDataCollector*, Int16, HRESULT)
    get_log_circular : Proc(IDataCollector*, Int16*, HRESULT)
    put_log_circular : Proc(IDataCollector*, Int16, HRESULT)
    get_log_overwrite : Proc(IDataCollector*, Int16*, HRESULT)
    put_log_overwrite : Proc(IDataCollector*, Int16, HRESULT)
    get_name : Proc(IDataCollector*, UInt8*, HRESULT)
    put_name : Proc(IDataCollector*, UInt8, HRESULT)
    get_output_location : Proc(IDataCollector*, UInt8*, HRESULT)
    get_index : Proc(IDataCollector*, Int32*, HRESULT)
    put_index : Proc(IDataCollector*, Int32, HRESULT)
    get_xml : Proc(IDataCollector*, UInt8*, HRESULT)
    set_xml : Proc(IDataCollector*, UInt8, IValueMap*, HRESULT)
    create_output_location : Proc(IDataCollector*, Int16, UInt8*, HRESULT)
  end

  struct IDataCollector
    lpVtbl : IDataCollectorVTbl*
  end

  struct IPerformanceCounterDataCollectorVTbl
    query_interface : Proc(IPerformanceCounterDataCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPerformanceCounterDataCollector*, UInt32)
    release : Proc(IPerformanceCounterDataCollector*, UInt32)
    get_type_info_count : Proc(IPerformanceCounterDataCollector*, UInt32*, HRESULT)
    get_type_info : Proc(IPerformanceCounterDataCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPerformanceCounterDataCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPerformanceCounterDataCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collector_set : Proc(IPerformanceCounterDataCollector*, IDataCollectorSet*, HRESULT)
    put_data_collector_set : Proc(IPerformanceCounterDataCollector*, IDataCollectorSet, HRESULT)
    get_data_collector_type : Proc(IPerformanceCounterDataCollector*, DataCollectorType*, HRESULT)
    get_file_name : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    put_file_name : Proc(IPerformanceCounterDataCollector*, UInt8, HRESULT)
    get_file_name_format : Proc(IPerformanceCounterDataCollector*, AutoPathFormat*, HRESULT)
    put_file_name_format : Proc(IPerformanceCounterDataCollector*, AutoPathFormat, HRESULT)
    get_file_name_format_pattern : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    put_file_name_format_pattern : Proc(IPerformanceCounterDataCollector*, UInt8, HRESULT)
    get_latest_output_location : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    put_latest_output_location : Proc(IPerformanceCounterDataCollector*, UInt8, HRESULT)
    get_log_append : Proc(IPerformanceCounterDataCollector*, Int16*, HRESULT)
    put_log_append : Proc(IPerformanceCounterDataCollector*, Int16, HRESULT)
    get_log_circular : Proc(IPerformanceCounterDataCollector*, Int16*, HRESULT)
    put_log_circular : Proc(IPerformanceCounterDataCollector*, Int16, HRESULT)
    get_log_overwrite : Proc(IPerformanceCounterDataCollector*, Int16*, HRESULT)
    put_log_overwrite : Proc(IPerformanceCounterDataCollector*, Int16, HRESULT)
    get_name : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    put_name : Proc(IPerformanceCounterDataCollector*, UInt8, HRESULT)
    get_output_location : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    get_index : Proc(IPerformanceCounterDataCollector*, Int32*, HRESULT)
    put_index : Proc(IPerformanceCounterDataCollector*, Int32, HRESULT)
    get_xml : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    set_xml : Proc(IPerformanceCounterDataCollector*, UInt8, IValueMap*, HRESULT)
    create_output_location : Proc(IPerformanceCounterDataCollector*, Int16, UInt8*, HRESULT)
    get_data_source_name : Proc(IPerformanceCounterDataCollector*, UInt8*, HRESULT)
    put_data_source_name : Proc(IPerformanceCounterDataCollector*, UInt8, HRESULT)
    get_performance_counters : Proc(IPerformanceCounterDataCollector*, SAFEARRAY**, HRESULT)
    put_performance_counters : Proc(IPerformanceCounterDataCollector*, SAFEARRAY*, HRESULT)
    get_log_file_format : Proc(IPerformanceCounterDataCollector*, FileFormat*, HRESULT)
    put_log_file_format : Proc(IPerformanceCounterDataCollector*, FileFormat, HRESULT)
    get_sample_interval : Proc(IPerformanceCounterDataCollector*, UInt32*, HRESULT)
    put_sample_interval : Proc(IPerformanceCounterDataCollector*, UInt32, HRESULT)
    get_segment_max_records : Proc(IPerformanceCounterDataCollector*, UInt32*, HRESULT)
    put_segment_max_records : Proc(IPerformanceCounterDataCollector*, UInt32, HRESULT)
  end

  struct IPerformanceCounterDataCollector
    lpVtbl : IPerformanceCounterDataCollectorVTbl*
  end

  struct ITraceDataCollectorVTbl
    query_interface : Proc(ITraceDataCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITraceDataCollector*, UInt32)
    release : Proc(ITraceDataCollector*, UInt32)
    get_type_info_count : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    get_type_info : Proc(ITraceDataCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITraceDataCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITraceDataCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collector_set : Proc(ITraceDataCollector*, IDataCollectorSet*, HRESULT)
    put_data_collector_set : Proc(ITraceDataCollector*, IDataCollectorSet, HRESULT)
    get_data_collector_type : Proc(ITraceDataCollector*, DataCollectorType*, HRESULT)
    get_file_name : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    put_file_name : Proc(ITraceDataCollector*, UInt8, HRESULT)
    get_file_name_format : Proc(ITraceDataCollector*, AutoPathFormat*, HRESULT)
    put_file_name_format : Proc(ITraceDataCollector*, AutoPathFormat, HRESULT)
    get_file_name_format_pattern : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    put_file_name_format_pattern : Proc(ITraceDataCollector*, UInt8, HRESULT)
    get_latest_output_location : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    put_latest_output_location : Proc(ITraceDataCollector*, UInt8, HRESULT)
    get_log_append : Proc(ITraceDataCollector*, Int16*, HRESULT)
    put_log_append : Proc(ITraceDataCollector*, Int16, HRESULT)
    get_log_circular : Proc(ITraceDataCollector*, Int16*, HRESULT)
    put_log_circular : Proc(ITraceDataCollector*, Int16, HRESULT)
    get_log_overwrite : Proc(ITraceDataCollector*, Int16*, HRESULT)
    put_log_overwrite : Proc(ITraceDataCollector*, Int16, HRESULT)
    get_name : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    put_name : Proc(ITraceDataCollector*, UInt8, HRESULT)
    get_output_location : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    get_index : Proc(ITraceDataCollector*, Int32*, HRESULT)
    put_index : Proc(ITraceDataCollector*, Int32, HRESULT)
    get_xml : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    set_xml : Proc(ITraceDataCollector*, UInt8, IValueMap*, HRESULT)
    create_output_location : Proc(ITraceDataCollector*, Int16, UInt8*, HRESULT)
    get_buffer_size : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_buffer_size : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_buffers_lost : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_buffers_lost : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_buffers_written : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_buffers_written : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_clock_type : Proc(ITraceDataCollector*, ClockType*, HRESULT)
    put_clock_type : Proc(ITraceDataCollector*, ClockType, HRESULT)
    get_events_lost : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_events_lost : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_extended_modes : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_extended_modes : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_flush_timer : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_flush_timer : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_free_buffers : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_free_buffers : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_guid : Proc(ITraceDataCollector*, Guid*, HRESULT)
    put_guid : Proc(ITraceDataCollector*, Guid, HRESULT)
    get_is_kernel_trace : Proc(ITraceDataCollector*, Int16*, HRESULT)
    get_maximum_buffers : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_maximum_buffers : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_minimum_buffers : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_minimum_buffers : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_number_of_buffers : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_number_of_buffers : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_preallocate_file : Proc(ITraceDataCollector*, Int16*, HRESULT)
    put_preallocate_file : Proc(ITraceDataCollector*, Int16, HRESULT)
    get_process_mode : Proc(ITraceDataCollector*, Int16*, HRESULT)
    put_process_mode : Proc(ITraceDataCollector*, Int16, HRESULT)
    get_real_time_buffers_lost : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_real_time_buffers_lost : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_session_id : Proc(ITraceDataCollector*, UInt64*, HRESULT)
    put_session_id : Proc(ITraceDataCollector*, UInt64, HRESULT)
    get_session_name : Proc(ITraceDataCollector*, UInt8*, HRESULT)
    put_session_name : Proc(ITraceDataCollector*, UInt8, HRESULT)
    get_session_thread_id : Proc(ITraceDataCollector*, UInt32*, HRESULT)
    put_session_thread_id : Proc(ITraceDataCollector*, UInt32, HRESULT)
    get_stream_mode : Proc(ITraceDataCollector*, StreamMode*, HRESULT)
    put_stream_mode : Proc(ITraceDataCollector*, StreamMode, HRESULT)
    get_trace_data_providers : Proc(ITraceDataCollector*, ITraceDataProviderCollection*, HRESULT)
  end

  struct ITraceDataCollector
    lpVtbl : ITraceDataCollectorVTbl*
  end

  struct IConfigurationDataCollectorVTbl
    query_interface : Proc(IConfigurationDataCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IConfigurationDataCollector*, UInt32)
    release : Proc(IConfigurationDataCollector*, UInt32)
    get_type_info_count : Proc(IConfigurationDataCollector*, UInt32*, HRESULT)
    get_type_info : Proc(IConfigurationDataCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IConfigurationDataCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IConfigurationDataCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collector_set : Proc(IConfigurationDataCollector*, IDataCollectorSet*, HRESULT)
    put_data_collector_set : Proc(IConfigurationDataCollector*, IDataCollectorSet, HRESULT)
    get_data_collector_type : Proc(IConfigurationDataCollector*, DataCollectorType*, HRESULT)
    get_file_name : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    put_file_name : Proc(IConfigurationDataCollector*, UInt8, HRESULT)
    get_file_name_format : Proc(IConfigurationDataCollector*, AutoPathFormat*, HRESULT)
    put_file_name_format : Proc(IConfigurationDataCollector*, AutoPathFormat, HRESULT)
    get_file_name_format_pattern : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    put_file_name_format_pattern : Proc(IConfigurationDataCollector*, UInt8, HRESULT)
    get_latest_output_location : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    put_latest_output_location : Proc(IConfigurationDataCollector*, UInt8, HRESULT)
    get_log_append : Proc(IConfigurationDataCollector*, Int16*, HRESULT)
    put_log_append : Proc(IConfigurationDataCollector*, Int16, HRESULT)
    get_log_circular : Proc(IConfigurationDataCollector*, Int16*, HRESULT)
    put_log_circular : Proc(IConfigurationDataCollector*, Int16, HRESULT)
    get_log_overwrite : Proc(IConfigurationDataCollector*, Int16*, HRESULT)
    put_log_overwrite : Proc(IConfigurationDataCollector*, Int16, HRESULT)
    get_name : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    put_name : Proc(IConfigurationDataCollector*, UInt8, HRESULT)
    get_output_location : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    get_index : Proc(IConfigurationDataCollector*, Int32*, HRESULT)
    put_index : Proc(IConfigurationDataCollector*, Int32, HRESULT)
    get_xml : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    set_xml : Proc(IConfigurationDataCollector*, UInt8, IValueMap*, HRESULT)
    create_output_location : Proc(IConfigurationDataCollector*, Int16, UInt8*, HRESULT)
    get_file_max_count : Proc(IConfigurationDataCollector*, UInt32*, HRESULT)
    put_file_max_count : Proc(IConfigurationDataCollector*, UInt32, HRESULT)
    get_file_max_recursive_depth : Proc(IConfigurationDataCollector*, UInt32*, HRESULT)
    put_file_max_recursive_depth : Proc(IConfigurationDataCollector*, UInt32, HRESULT)
    get_file_max_total_size : Proc(IConfigurationDataCollector*, UInt32*, HRESULT)
    put_file_max_total_size : Proc(IConfigurationDataCollector*, UInt32, HRESULT)
    get_files : Proc(IConfigurationDataCollector*, SAFEARRAY**, HRESULT)
    put_files : Proc(IConfigurationDataCollector*, SAFEARRAY*, HRESULT)
    get_management_queries : Proc(IConfigurationDataCollector*, SAFEARRAY**, HRESULT)
    put_management_queries : Proc(IConfigurationDataCollector*, SAFEARRAY*, HRESULT)
    get_query_network_adapters : Proc(IConfigurationDataCollector*, Int16*, HRESULT)
    put_query_network_adapters : Proc(IConfigurationDataCollector*, Int16, HRESULT)
    get_registry_keys : Proc(IConfigurationDataCollector*, SAFEARRAY**, HRESULT)
    put_registry_keys : Proc(IConfigurationDataCollector*, SAFEARRAY*, HRESULT)
    get_registry_max_recursive_depth : Proc(IConfigurationDataCollector*, UInt32*, HRESULT)
    put_registry_max_recursive_depth : Proc(IConfigurationDataCollector*, UInt32, HRESULT)
    get_system_state_file : Proc(IConfigurationDataCollector*, UInt8*, HRESULT)
    put_system_state_file : Proc(IConfigurationDataCollector*, UInt8, HRESULT)
  end

  struct IConfigurationDataCollector
    lpVtbl : IConfigurationDataCollectorVTbl*
  end

  struct IAlertDataCollectorVTbl
    query_interface : Proc(IAlertDataCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAlertDataCollector*, UInt32)
    release : Proc(IAlertDataCollector*, UInt32)
    get_type_info_count : Proc(IAlertDataCollector*, UInt32*, HRESULT)
    get_type_info : Proc(IAlertDataCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAlertDataCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAlertDataCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collector_set : Proc(IAlertDataCollector*, IDataCollectorSet*, HRESULT)
    put_data_collector_set : Proc(IAlertDataCollector*, IDataCollectorSet, HRESULT)
    get_data_collector_type : Proc(IAlertDataCollector*, DataCollectorType*, HRESULT)
    get_file_name : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_file_name : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_file_name_format : Proc(IAlertDataCollector*, AutoPathFormat*, HRESULT)
    put_file_name_format : Proc(IAlertDataCollector*, AutoPathFormat, HRESULT)
    get_file_name_format_pattern : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_file_name_format_pattern : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_latest_output_location : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_latest_output_location : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_log_append : Proc(IAlertDataCollector*, Int16*, HRESULT)
    put_log_append : Proc(IAlertDataCollector*, Int16, HRESULT)
    get_log_circular : Proc(IAlertDataCollector*, Int16*, HRESULT)
    put_log_circular : Proc(IAlertDataCollector*, Int16, HRESULT)
    get_log_overwrite : Proc(IAlertDataCollector*, Int16*, HRESULT)
    put_log_overwrite : Proc(IAlertDataCollector*, Int16, HRESULT)
    get_name : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_name : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_output_location : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    get_index : Proc(IAlertDataCollector*, Int32*, HRESULT)
    put_index : Proc(IAlertDataCollector*, Int32, HRESULT)
    get_xml : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    set_xml : Proc(IAlertDataCollector*, UInt8, IValueMap*, HRESULT)
    create_output_location : Proc(IAlertDataCollector*, Int16, UInt8*, HRESULT)
    get_alert_thresholds : Proc(IAlertDataCollector*, SAFEARRAY**, HRESULT)
    put_alert_thresholds : Proc(IAlertDataCollector*, SAFEARRAY*, HRESULT)
    get_event_log : Proc(IAlertDataCollector*, Int16*, HRESULT)
    put_event_log : Proc(IAlertDataCollector*, Int16, HRESULT)
    get_sample_interval : Proc(IAlertDataCollector*, UInt32*, HRESULT)
    put_sample_interval : Proc(IAlertDataCollector*, UInt32, HRESULT)
    get_task : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_task : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_task_run_as_self : Proc(IAlertDataCollector*, Int16*, HRESULT)
    put_task_run_as_self : Proc(IAlertDataCollector*, Int16, HRESULT)
    get_task_arguments : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_task_arguments : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_task_user_text_arguments : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_task_user_text_arguments : Proc(IAlertDataCollector*, UInt8, HRESULT)
    get_trigger_data_collector_set : Proc(IAlertDataCollector*, UInt8*, HRESULT)
    put_trigger_data_collector_set : Proc(IAlertDataCollector*, UInt8, HRESULT)
  end

  struct IAlertDataCollector
    lpVtbl : IAlertDataCollectorVTbl*
  end

  struct IApiTracingDataCollectorVTbl
    query_interface : Proc(IApiTracingDataCollector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IApiTracingDataCollector*, UInt32)
    release : Proc(IApiTracingDataCollector*, UInt32)
    get_type_info_count : Proc(IApiTracingDataCollector*, UInt32*, HRESULT)
    get_type_info : Proc(IApiTracingDataCollector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IApiTracingDataCollector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IApiTracingDataCollector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_data_collector_set : Proc(IApiTracingDataCollector*, IDataCollectorSet*, HRESULT)
    put_data_collector_set : Proc(IApiTracingDataCollector*, IDataCollectorSet, HRESULT)
    get_data_collector_type : Proc(IApiTracingDataCollector*, DataCollectorType*, HRESULT)
    get_file_name : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    put_file_name : Proc(IApiTracingDataCollector*, UInt8, HRESULT)
    get_file_name_format : Proc(IApiTracingDataCollector*, AutoPathFormat*, HRESULT)
    put_file_name_format : Proc(IApiTracingDataCollector*, AutoPathFormat, HRESULT)
    get_file_name_format_pattern : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    put_file_name_format_pattern : Proc(IApiTracingDataCollector*, UInt8, HRESULT)
    get_latest_output_location : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    put_latest_output_location : Proc(IApiTracingDataCollector*, UInt8, HRESULT)
    get_log_append : Proc(IApiTracingDataCollector*, Int16*, HRESULT)
    put_log_append : Proc(IApiTracingDataCollector*, Int16, HRESULT)
    get_log_circular : Proc(IApiTracingDataCollector*, Int16*, HRESULT)
    put_log_circular : Proc(IApiTracingDataCollector*, Int16, HRESULT)
    get_log_overwrite : Proc(IApiTracingDataCollector*, Int16*, HRESULT)
    put_log_overwrite : Proc(IApiTracingDataCollector*, Int16, HRESULT)
    get_name : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    put_name : Proc(IApiTracingDataCollector*, UInt8, HRESULT)
    get_output_location : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    get_index : Proc(IApiTracingDataCollector*, Int32*, HRESULT)
    put_index : Proc(IApiTracingDataCollector*, Int32, HRESULT)
    get_xml : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    set_xml : Proc(IApiTracingDataCollector*, UInt8, IValueMap*, HRESULT)
    create_output_location : Proc(IApiTracingDataCollector*, Int16, UInt8*, HRESULT)
    get_log_api_names_only : Proc(IApiTracingDataCollector*, Int16*, HRESULT)
    put_log_api_names_only : Proc(IApiTracingDataCollector*, Int16, HRESULT)
    get_log_apis_recursively : Proc(IApiTracingDataCollector*, Int16*, HRESULT)
    put_log_apis_recursively : Proc(IApiTracingDataCollector*, Int16, HRESULT)
    get_exe_path : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    put_exe_path : Proc(IApiTracingDataCollector*, UInt8, HRESULT)
    get_log_file_path : Proc(IApiTracingDataCollector*, UInt8*, HRESULT)
    put_log_file_path : Proc(IApiTracingDataCollector*, UInt8, HRESULT)
    get_include_modules : Proc(IApiTracingDataCollector*, SAFEARRAY**, HRESULT)
    put_include_modules : Proc(IApiTracingDataCollector*, SAFEARRAY*, HRESULT)
    get_include_apis : Proc(IApiTracingDataCollector*, SAFEARRAY**, HRESULT)
    put_include_apis : Proc(IApiTracingDataCollector*, SAFEARRAY*, HRESULT)
    get_exclude_apis : Proc(IApiTracingDataCollector*, SAFEARRAY**, HRESULT)
    put_exclude_apis : Proc(IApiTracingDataCollector*, SAFEARRAY*, HRESULT)
  end

  struct IApiTracingDataCollector
    lpVtbl : IApiTracingDataCollectorVTbl*
  end

  struct IDataCollectorCollectionVTbl
    query_interface : Proc(IDataCollectorCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataCollectorCollection*, UInt32)
    release : Proc(IDataCollectorCollection*, UInt32)
    get_type_info_count : Proc(IDataCollectorCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IDataCollectorCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDataCollectorCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDataCollectorCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IDataCollectorCollection*, Int32*, HRESULT)
    get_item : Proc(IDataCollectorCollection*, VARIANT, IDataCollector*, HRESULT)
    get__new_enum : Proc(IDataCollectorCollection*, IUnknown*, HRESULT)
    add : Proc(IDataCollectorCollection*, IDataCollector, HRESULT)
    remove : Proc(IDataCollectorCollection*, VARIANT, HRESULT)
    clear : Proc(IDataCollectorCollection*, HRESULT)
    add_range : Proc(IDataCollectorCollection*, IDataCollectorCollection, HRESULT)
    create_data_collector_from_xml : Proc(IDataCollectorCollection*, UInt8, IValueMap*, IDataCollector*, HRESULT)
    create_data_collector : Proc(IDataCollectorCollection*, DataCollectorType, IDataCollector*, HRESULT)
  end

  struct IDataCollectorCollection
    lpVtbl : IDataCollectorCollectionVTbl*
  end

  struct IDataCollectorSetCollectionVTbl
    query_interface : Proc(IDataCollectorSetCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDataCollectorSetCollection*, UInt32)
    release : Proc(IDataCollectorSetCollection*, UInt32)
    get_type_info_count : Proc(IDataCollectorSetCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IDataCollectorSetCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDataCollectorSetCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDataCollectorSetCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IDataCollectorSetCollection*, Int32*, HRESULT)
    get_item : Proc(IDataCollectorSetCollection*, VARIANT, IDataCollectorSet*, HRESULT)
    get__new_enum : Proc(IDataCollectorSetCollection*, IUnknown*, HRESULT)
    add : Proc(IDataCollectorSetCollection*, IDataCollectorSet, HRESULT)
    remove : Proc(IDataCollectorSetCollection*, VARIANT, HRESULT)
    clear : Proc(IDataCollectorSetCollection*, HRESULT)
    add_range : Proc(IDataCollectorSetCollection*, IDataCollectorSetCollection, HRESULT)
    get_data_collector_sets : Proc(IDataCollectorSetCollection*, UInt8, UInt8, HRESULT)
  end

  struct IDataCollectorSetCollection
    lpVtbl : IDataCollectorSetCollectionVTbl*
  end

  struct ITraceDataProviderVTbl
    query_interface : Proc(ITraceDataProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITraceDataProvider*, UInt32)
    release : Proc(ITraceDataProvider*, UInt32)
    get_type_info_count : Proc(ITraceDataProvider*, UInt32*, HRESULT)
    get_type_info : Proc(ITraceDataProvider*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITraceDataProvider*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITraceDataProvider*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_display_name : Proc(ITraceDataProvider*, UInt8*, HRESULT)
    put_display_name : Proc(ITraceDataProvider*, UInt8, HRESULT)
    get_guid : Proc(ITraceDataProvider*, Guid*, HRESULT)
    put_guid : Proc(ITraceDataProvider*, Guid, HRESULT)
    get_level : Proc(ITraceDataProvider*, IValueMap*, HRESULT)
    get_keywords_any : Proc(ITraceDataProvider*, IValueMap*, HRESULT)
    get_keywords_all : Proc(ITraceDataProvider*, IValueMap*, HRESULT)
    get_properties : Proc(ITraceDataProvider*, IValueMap*, HRESULT)
    get_filter_enabled : Proc(ITraceDataProvider*, Int16*, HRESULT)
    put_filter_enabled : Proc(ITraceDataProvider*, Int16, HRESULT)
    get_filter_type : Proc(ITraceDataProvider*, UInt32*, HRESULT)
    put_filter_type : Proc(ITraceDataProvider*, UInt32, HRESULT)
    get_filter_data : Proc(ITraceDataProvider*, SAFEARRAY**, HRESULT)
    put_filter_data : Proc(ITraceDataProvider*, SAFEARRAY*, HRESULT)
    query : Proc(ITraceDataProvider*, UInt8, UInt8, HRESULT)
    resolve : Proc(ITraceDataProvider*, IDispatch, HRESULT)
    set_security : Proc(ITraceDataProvider*, UInt8, HRESULT)
    get_security : Proc(ITraceDataProvider*, UInt32, UInt8*, HRESULT)
    get_registered_processes : Proc(ITraceDataProvider*, IValueMap*, HRESULT)
  end

  struct ITraceDataProvider
    lpVtbl : ITraceDataProviderVTbl*
  end

  struct ITraceDataProviderCollectionVTbl
    query_interface : Proc(ITraceDataProviderCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITraceDataProviderCollection*, UInt32)
    release : Proc(ITraceDataProviderCollection*, UInt32)
    get_type_info_count : Proc(ITraceDataProviderCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ITraceDataProviderCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITraceDataProviderCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITraceDataProviderCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ITraceDataProviderCollection*, Int32*, HRESULT)
    get_item : Proc(ITraceDataProviderCollection*, VARIANT, ITraceDataProvider*, HRESULT)
    get__new_enum : Proc(ITraceDataProviderCollection*, IUnknown*, HRESULT)
    add : Proc(ITraceDataProviderCollection*, ITraceDataProvider, HRESULT)
    remove : Proc(ITraceDataProviderCollection*, VARIANT, HRESULT)
    clear : Proc(ITraceDataProviderCollection*, HRESULT)
    add_range : Proc(ITraceDataProviderCollection*, ITraceDataProviderCollection, HRESULT)
    create_trace_data_provider : Proc(ITraceDataProviderCollection*, ITraceDataProvider*, HRESULT)
    get_trace_data_providers : Proc(ITraceDataProviderCollection*, UInt8, HRESULT)
    get_trace_data_providers_by_process : Proc(ITraceDataProviderCollection*, UInt8, UInt32, HRESULT)
  end

  struct ITraceDataProviderCollection
    lpVtbl : ITraceDataProviderCollectionVTbl*
  end

  struct IScheduleVTbl
    query_interface : Proc(ISchedule*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISchedule*, UInt32)
    release : Proc(ISchedule*, UInt32)
    get_type_info_count : Proc(ISchedule*, UInt32*, HRESULT)
    get_type_info : Proc(ISchedule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISchedule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISchedule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_start_date : Proc(ISchedule*, VARIANT*, HRESULT)
    put_start_date : Proc(ISchedule*, VARIANT, HRESULT)
    get_end_date : Proc(ISchedule*, VARIANT*, HRESULT)
    put_end_date : Proc(ISchedule*, VARIANT, HRESULT)
    get_start_time : Proc(ISchedule*, VARIANT*, HRESULT)
    put_start_time : Proc(ISchedule*, VARIANT, HRESULT)
    get_days : Proc(ISchedule*, WeekDays*, HRESULT)
    put_days : Proc(ISchedule*, WeekDays, HRESULT)
  end

  struct ISchedule
    lpVtbl : IScheduleVTbl*
  end

  struct IScheduleCollectionVTbl
    query_interface : Proc(IScheduleCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IScheduleCollection*, UInt32)
    release : Proc(IScheduleCollection*, UInt32)
    get_type_info_count : Proc(IScheduleCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IScheduleCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IScheduleCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IScheduleCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IScheduleCollection*, Int32*, HRESULT)
    get_item : Proc(IScheduleCollection*, VARIANT, ISchedule*, HRESULT)
    get__new_enum : Proc(IScheduleCollection*, IUnknown*, HRESULT)
    add : Proc(IScheduleCollection*, ISchedule, HRESULT)
    remove : Proc(IScheduleCollection*, VARIANT, HRESULT)
    clear : Proc(IScheduleCollection*, HRESULT)
    add_range : Proc(IScheduleCollection*, IScheduleCollection, HRESULT)
    create_schedule : Proc(IScheduleCollection*, ISchedule*, HRESULT)
  end

  struct IScheduleCollection
    lpVtbl : IScheduleCollectionVTbl*
  end

  struct IValueMapItemVTbl
    query_interface : Proc(IValueMapItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IValueMapItem*, UInt32)
    release : Proc(IValueMapItem*, UInt32)
    get_type_info_count : Proc(IValueMapItem*, UInt32*, HRESULT)
    get_type_info : Proc(IValueMapItem*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IValueMapItem*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IValueMapItem*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_description : Proc(IValueMapItem*, UInt8*, HRESULT)
    put_description : Proc(IValueMapItem*, UInt8, HRESULT)
    get_enabled : Proc(IValueMapItem*, Int16*, HRESULT)
    put_enabled : Proc(IValueMapItem*, Int16, HRESULT)
    get_key : Proc(IValueMapItem*, UInt8*, HRESULT)
    put_key : Proc(IValueMapItem*, UInt8, HRESULT)
    get_value : Proc(IValueMapItem*, VARIANT*, HRESULT)
    put_value : Proc(IValueMapItem*, VARIANT, HRESULT)
    get_value_map_type : Proc(IValueMapItem*, ValueMapType*, HRESULT)
    put_value_map_type : Proc(IValueMapItem*, ValueMapType, HRESULT)
  end

  struct IValueMapItem
    lpVtbl : IValueMapItemVTbl*
  end

  struct IValueMapVTbl
    query_interface : Proc(IValueMap*, Guid*, Void**, HRESULT)
    add_ref : Proc(IValueMap*, UInt32)
    release : Proc(IValueMap*, UInt32)
    get_type_info_count : Proc(IValueMap*, UInt32*, HRESULT)
    get_type_info : Proc(IValueMap*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IValueMap*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IValueMap*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IValueMap*, Int32*, HRESULT)
    get_item : Proc(IValueMap*, VARIANT, IValueMapItem*, HRESULT)
    get__new_enum : Proc(IValueMap*, IUnknown*, HRESULT)
    get_description : Proc(IValueMap*, UInt8*, HRESULT)
    put_description : Proc(IValueMap*, UInt8, HRESULT)
    get_value : Proc(IValueMap*, VARIANT*, HRESULT)
    put_value : Proc(IValueMap*, VARIANT, HRESULT)
    get_value_map_type : Proc(IValueMap*, ValueMapType*, HRESULT)
    put_value_map_type : Proc(IValueMap*, ValueMapType, HRESULT)
    add : Proc(IValueMap*, VARIANT, HRESULT)
    remove : Proc(IValueMap*, VARIANT, HRESULT)
    clear : Proc(IValueMap*, HRESULT)
    add_range : Proc(IValueMap*, IValueMap, HRESULT)
    create_value_map_item : Proc(IValueMap*, IValueMapItem*, HRESULT)
  end

  struct IValueMap
    lpVtbl : IValueMapVTbl*
  end

  struct ICounterItemVTbl
    query_interface : Proc(ICounterItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICounterItem*, UInt32)
    release : Proc(ICounterItem*, UInt32)
    get_value : Proc(ICounterItem*, Float64*, HRESULT)
    put_color : Proc(ICounterItem*, UInt32, HRESULT)
    get_color : Proc(ICounterItem*, UInt32*, HRESULT)
    put_width : Proc(ICounterItem*, Int32, HRESULT)
    get_width : Proc(ICounterItem*, Int32*, HRESULT)
    put_line_style : Proc(ICounterItem*, Int32, HRESULT)
    get_line_style : Proc(ICounterItem*, Int32*, HRESULT)
    put_scale_factor : Proc(ICounterItem*, Int32, HRESULT)
    get_scale_factor : Proc(ICounterItem*, Int32*, HRESULT)
    get_path : Proc(ICounterItem*, UInt8*, HRESULT)
    get_value2 : Proc(ICounterItem*, Float64*, Int32*, HRESULT)
    get_statistics : Proc(ICounterItem*, Float64*, Float64*, Float64*, Int32*, HRESULT)
  end

  struct ICounterItem
    lpVtbl : ICounterItemVTbl*
  end

  struct ICounterItem2VTbl
    query_interface : Proc(ICounterItem2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICounterItem2*, UInt32)
    release : Proc(ICounterItem2*, UInt32)
    get_value : Proc(ICounterItem2*, Float64*, HRESULT)
    put_color : Proc(ICounterItem2*, UInt32, HRESULT)
    get_color : Proc(ICounterItem2*, UInt32*, HRESULT)
    put_width : Proc(ICounterItem2*, Int32, HRESULT)
    get_width : Proc(ICounterItem2*, Int32*, HRESULT)
    put_line_style : Proc(ICounterItem2*, Int32, HRESULT)
    get_line_style : Proc(ICounterItem2*, Int32*, HRESULT)
    put_scale_factor : Proc(ICounterItem2*, Int32, HRESULT)
    get_scale_factor : Proc(ICounterItem2*, Int32*, HRESULT)
    get_path : Proc(ICounterItem2*, UInt8*, HRESULT)
    get_value2 : Proc(ICounterItem2*, Float64*, Int32*, HRESULT)
    get_statistics : Proc(ICounterItem2*, Float64*, Float64*, Float64*, Int32*, HRESULT)
    put_selected : Proc(ICounterItem2*, Int16, HRESULT)
    get_selected : Proc(ICounterItem2*, Int16*, HRESULT)
    put_visible : Proc(ICounterItem2*, Int16, HRESULT)
    get_visible : Proc(ICounterItem2*, Int16*, HRESULT)
    get_data_at : Proc(ICounterItem2*, Int32, SysmonDataType, VARIANT*, HRESULT)
  end

  struct ICounterItem2
    lpVtbl : ICounterItem2VTbl*
  end

  struct ICounterItemUnionVTbl
    query_interface : Proc(ICounterItemUnion*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICounterItemUnion*, UInt32)
    release : Proc(ICounterItemUnion*, UInt32)
    get_value : Proc(ICounterItemUnion*, Float64*, HRESULT)
    put_color : Proc(ICounterItemUnion*, UInt32, HRESULT)
    get_color : Proc(ICounterItemUnion*, UInt32*, HRESULT)
    put_width : Proc(ICounterItemUnion*, Int32, HRESULT)
    get_width : Proc(ICounterItemUnion*, Int32*, HRESULT)
    put_line_style : Proc(ICounterItemUnion*, Int32, HRESULT)
    get_line_style : Proc(ICounterItemUnion*, Int32*, HRESULT)
    put_scale_factor : Proc(ICounterItemUnion*, Int32, HRESULT)
    get_scale_factor : Proc(ICounterItemUnion*, Int32*, HRESULT)
    get_path : Proc(ICounterItemUnion*, UInt8*, HRESULT)
    get_value2 : Proc(ICounterItemUnion*, Float64*, Int32*, HRESULT)
    get_statistics : Proc(ICounterItemUnion*, Float64*, Float64*, Float64*, Int32*, HRESULT)
    put_selected : Proc(ICounterItemUnion*, Int16, HRESULT)
    get_selected : Proc(ICounterItemUnion*, Int16*, HRESULT)
    put_visible : Proc(ICounterItemUnion*, Int16, HRESULT)
    get_visible : Proc(ICounterItemUnion*, Int16*, HRESULT)
    get_data_at : Proc(ICounterItemUnion*, Int32, SysmonDataType, VARIANT*, HRESULT)
  end

  struct ICounterItemUnion
    lpVtbl : ICounterItemUnionVTbl*
  end

  struct DICounterItemVTbl
    query_interface : Proc(DICounterItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(DICounterItem*, UInt32)
    release : Proc(DICounterItem*, UInt32)
    get_type_info_count : Proc(DICounterItem*, UInt32*, HRESULT)
    get_type_info : Proc(DICounterItem*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DICounterItem*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DICounterItem*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct DICounterItem
    lpVtbl : DICounterItemVTbl*
  end

  struct ICountersVTbl
    query_interface : Proc(ICounters*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICounters*, UInt32)
    release : Proc(ICounters*, UInt32)
    get_type_info_count : Proc(ICounters*, UInt32*, HRESULT)
    get_type_info : Proc(ICounters*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICounters*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICounters*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ICounters*, Int32*, HRESULT)
    get__new_enum : Proc(ICounters*, IUnknown*, HRESULT)
    get_item : Proc(ICounters*, VARIANT, DICounterItem*, HRESULT)
    add : Proc(ICounters*, UInt8, DICounterItem*, HRESULT)
    remove : Proc(ICounters*, VARIANT, HRESULT)
  end

  struct ICounters
    lpVtbl : ICountersVTbl*
  end

  struct ILogFileItemVTbl
    query_interface : Proc(ILogFileItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILogFileItem*, UInt32)
    release : Proc(ILogFileItem*, UInt32)
    get_path : Proc(ILogFileItem*, UInt8*, HRESULT)
  end

  struct ILogFileItem
    lpVtbl : ILogFileItemVTbl*
  end

  struct DILogFileItemVTbl
    query_interface : Proc(DILogFileItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(DILogFileItem*, UInt32)
    release : Proc(DILogFileItem*, UInt32)
    get_type_info_count : Proc(DILogFileItem*, UInt32*, HRESULT)
    get_type_info : Proc(DILogFileItem*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DILogFileItem*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DILogFileItem*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct DILogFileItem
    lpVtbl : DILogFileItemVTbl*
  end

  struct ILogFilesVTbl
    query_interface : Proc(ILogFiles*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILogFiles*, UInt32)
    release : Proc(ILogFiles*, UInt32)
    get_type_info_count : Proc(ILogFiles*, UInt32*, HRESULT)
    get_type_info : Proc(ILogFiles*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ILogFiles*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ILogFiles*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ILogFiles*, Int32*, HRESULT)
    get__new_enum : Proc(ILogFiles*, IUnknown*, HRESULT)
    get_item : Proc(ILogFiles*, VARIANT, DILogFileItem*, HRESULT)
    add : Proc(ILogFiles*, UInt8, DILogFileItem*, HRESULT)
    remove : Proc(ILogFiles*, VARIANT, HRESULT)
  end

  struct ILogFiles
    lpVtbl : ILogFilesVTbl*
  end

  struct ISystemMonitorVTbl
    query_interface : Proc(ISystemMonitor*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemMonitor*, UInt32)
    release : Proc(ISystemMonitor*, UInt32)
    get_appearance : Proc(ISystemMonitor*, Int32*, HRESULT)
    put_appearance : Proc(ISystemMonitor*, Int32, HRESULT)
    get_back_color : Proc(ISystemMonitor*, UInt32*, HRESULT)
    put_back_color : Proc(ISystemMonitor*, UInt32, HRESULT)
    get_border_style : Proc(ISystemMonitor*, Int32*, HRESULT)
    put_border_style : Proc(ISystemMonitor*, Int32, HRESULT)
    get_fore_color : Proc(ISystemMonitor*, UInt32*, HRESULT)
    put_fore_color : Proc(ISystemMonitor*, UInt32, HRESULT)
    get_font : Proc(ISystemMonitor*, IFontDisp*, HRESULT)
    putref_font : Proc(ISystemMonitor*, IFontDisp, HRESULT)
    get_counters : Proc(ISystemMonitor*, ICounters*, HRESULT)
    put_show_vertical_grid : Proc(ISystemMonitor*, Int16, HRESULT)
    get_show_vertical_grid : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_show_horizontal_grid : Proc(ISystemMonitor*, Int16, HRESULT)
    get_show_horizontal_grid : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_show_legend : Proc(ISystemMonitor*, Int16, HRESULT)
    get_show_legend : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_show_scale_labels : Proc(ISystemMonitor*, Int16, HRESULT)
    get_show_scale_labels : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_show_value_bar : Proc(ISystemMonitor*, Int16, HRESULT)
    get_show_value_bar : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_maximum_scale : Proc(ISystemMonitor*, Int32, HRESULT)
    get_maximum_scale : Proc(ISystemMonitor*, Int32*, HRESULT)
    put_minimum_scale : Proc(ISystemMonitor*, Int32, HRESULT)
    get_minimum_scale : Proc(ISystemMonitor*, Int32*, HRESULT)
    put_update_interval : Proc(ISystemMonitor*, Float32, HRESULT)
    get_update_interval : Proc(ISystemMonitor*, Float32*, HRESULT)
    put_display_type : Proc(ISystemMonitor*, DisplayTypeConstants, HRESULT)
    get_display_type : Proc(ISystemMonitor*, DisplayTypeConstants*, HRESULT)
    put_manual_update : Proc(ISystemMonitor*, Int16, HRESULT)
    get_manual_update : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_graph_title : Proc(ISystemMonitor*, UInt8, HRESULT)
    get_graph_title : Proc(ISystemMonitor*, UInt8*, HRESULT)
    put_y_axis_label : Proc(ISystemMonitor*, UInt8, HRESULT)
    get_y_axis_label : Proc(ISystemMonitor*, UInt8*, HRESULT)
    collect_sample : Proc(ISystemMonitor*, HRESULT)
    update_graph : Proc(ISystemMonitor*, HRESULT)
    browse_counters : Proc(ISystemMonitor*, HRESULT)
    display_properties : Proc(ISystemMonitor*, HRESULT)
    counter : Proc(ISystemMonitor*, Int32, ICounterItem*, HRESULT)
    add_counter : Proc(ISystemMonitor*, UInt8, ICounterItem*, HRESULT)
    delete_counter : Proc(ISystemMonitor*, ICounterItem, HRESULT)
    get_back_color_ctl : Proc(ISystemMonitor*, UInt32*, HRESULT)
    put_back_color_ctl : Proc(ISystemMonitor*, UInt32, HRESULT)
    put_log_file_name : Proc(ISystemMonitor*, UInt8, HRESULT)
    get_log_file_name : Proc(ISystemMonitor*, UInt8*, HRESULT)
    put_log_view_start : Proc(ISystemMonitor*, Float64, HRESULT)
    get_log_view_start : Proc(ISystemMonitor*, Float64*, HRESULT)
    put_log_view_stop : Proc(ISystemMonitor*, Float64, HRESULT)
    get_log_view_stop : Proc(ISystemMonitor*, Float64*, HRESULT)
    get_grid_color : Proc(ISystemMonitor*, UInt32*, HRESULT)
    put_grid_color : Proc(ISystemMonitor*, UInt32, HRESULT)
    get_time_bar_color : Proc(ISystemMonitor*, UInt32*, HRESULT)
    put_time_bar_color : Proc(ISystemMonitor*, UInt32, HRESULT)
    get_highlight : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_highlight : Proc(ISystemMonitor*, Int16, HRESULT)
    get_show_toolbar : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_show_toolbar : Proc(ISystemMonitor*, Int16, HRESULT)
    paste : Proc(ISystemMonitor*, HRESULT)
    copy : Proc(ISystemMonitor*, HRESULT)
    reset : Proc(ISystemMonitor*, HRESULT)
    put_read_only : Proc(ISystemMonitor*, Int16, HRESULT)
    get_read_only : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_report_value_type : Proc(ISystemMonitor*, ReportValueTypeConstants, HRESULT)
    get_report_value_type : Proc(ISystemMonitor*, ReportValueTypeConstants*, HRESULT)
    put_monitor_duplicate_instances : Proc(ISystemMonitor*, Int16, HRESULT)
    get_monitor_duplicate_instances : Proc(ISystemMonitor*, Int16*, HRESULT)
    put_display_filter : Proc(ISystemMonitor*, Int32, HRESULT)
    get_display_filter : Proc(ISystemMonitor*, Int32*, HRESULT)
    get_log_files : Proc(ISystemMonitor*, ILogFiles*, HRESULT)
    put_data_source_type : Proc(ISystemMonitor*, DataSourceTypeConstants, HRESULT)
    get_data_source_type : Proc(ISystemMonitor*, DataSourceTypeConstants*, HRESULT)
    put_sql_dsn_name : Proc(ISystemMonitor*, UInt8, HRESULT)
    get_sql_dsn_name : Proc(ISystemMonitor*, UInt8*, HRESULT)
    put_sql_log_set_name : Proc(ISystemMonitor*, UInt8, HRESULT)
    get_sql_log_set_name : Proc(ISystemMonitor*, UInt8*, HRESULT)
  end

  struct ISystemMonitor
    lpVtbl : ISystemMonitorVTbl*
  end

  struct ISystemMonitor2VTbl
    query_interface : Proc(ISystemMonitor2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemMonitor2*, UInt32)
    release : Proc(ISystemMonitor2*, UInt32)
    get_appearance : Proc(ISystemMonitor2*, Int32*, HRESULT)
    put_appearance : Proc(ISystemMonitor2*, Int32, HRESULT)
    get_back_color : Proc(ISystemMonitor2*, UInt32*, HRESULT)
    put_back_color : Proc(ISystemMonitor2*, UInt32, HRESULT)
    get_border_style : Proc(ISystemMonitor2*, Int32*, HRESULT)
    put_border_style : Proc(ISystemMonitor2*, Int32, HRESULT)
    get_fore_color : Proc(ISystemMonitor2*, UInt32*, HRESULT)
    put_fore_color : Proc(ISystemMonitor2*, UInt32, HRESULT)
    get_font : Proc(ISystemMonitor2*, IFontDisp*, HRESULT)
    putref_font : Proc(ISystemMonitor2*, IFontDisp, HRESULT)
    get_counters : Proc(ISystemMonitor2*, ICounters*, HRESULT)
    put_show_vertical_grid : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_vertical_grid : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_show_horizontal_grid : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_horizontal_grid : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_show_legend : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_legend : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_show_scale_labels : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_scale_labels : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_show_value_bar : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_value_bar : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_maximum_scale : Proc(ISystemMonitor2*, Int32, HRESULT)
    get_maximum_scale : Proc(ISystemMonitor2*, Int32*, HRESULT)
    put_minimum_scale : Proc(ISystemMonitor2*, Int32, HRESULT)
    get_minimum_scale : Proc(ISystemMonitor2*, Int32*, HRESULT)
    put_update_interval : Proc(ISystemMonitor2*, Float32, HRESULT)
    get_update_interval : Proc(ISystemMonitor2*, Float32*, HRESULT)
    put_display_type : Proc(ISystemMonitor2*, DisplayTypeConstants, HRESULT)
    get_display_type : Proc(ISystemMonitor2*, DisplayTypeConstants*, HRESULT)
    put_manual_update : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_manual_update : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_graph_title : Proc(ISystemMonitor2*, UInt8, HRESULT)
    get_graph_title : Proc(ISystemMonitor2*, UInt8*, HRESULT)
    put_y_axis_label : Proc(ISystemMonitor2*, UInt8, HRESULT)
    get_y_axis_label : Proc(ISystemMonitor2*, UInt8*, HRESULT)
    collect_sample : Proc(ISystemMonitor2*, HRESULT)
    update_graph : Proc(ISystemMonitor2*, HRESULT)
    browse_counters : Proc(ISystemMonitor2*, HRESULT)
    display_properties : Proc(ISystemMonitor2*, HRESULT)
    counter : Proc(ISystemMonitor2*, Int32, ICounterItem*, HRESULT)
    add_counter : Proc(ISystemMonitor2*, UInt8, ICounterItem*, HRESULT)
    delete_counter : Proc(ISystemMonitor2*, ICounterItem, HRESULT)
    get_back_color_ctl : Proc(ISystemMonitor2*, UInt32*, HRESULT)
    put_back_color_ctl : Proc(ISystemMonitor2*, UInt32, HRESULT)
    put_log_file_name : Proc(ISystemMonitor2*, UInt8, HRESULT)
    get_log_file_name : Proc(ISystemMonitor2*, UInt8*, HRESULT)
    put_log_view_start : Proc(ISystemMonitor2*, Float64, HRESULT)
    get_log_view_start : Proc(ISystemMonitor2*, Float64*, HRESULT)
    put_log_view_stop : Proc(ISystemMonitor2*, Float64, HRESULT)
    get_log_view_stop : Proc(ISystemMonitor2*, Float64*, HRESULT)
    get_grid_color : Proc(ISystemMonitor2*, UInt32*, HRESULT)
    put_grid_color : Proc(ISystemMonitor2*, UInt32, HRESULT)
    get_time_bar_color : Proc(ISystemMonitor2*, UInt32*, HRESULT)
    put_time_bar_color : Proc(ISystemMonitor2*, UInt32, HRESULT)
    get_highlight : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_highlight : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_toolbar : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_show_toolbar : Proc(ISystemMonitor2*, Int16, HRESULT)
    paste : Proc(ISystemMonitor2*, HRESULT)
    copy : Proc(ISystemMonitor2*, HRESULT)
    reset : Proc(ISystemMonitor2*, HRESULT)
    put_read_only : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_read_only : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_report_value_type : Proc(ISystemMonitor2*, ReportValueTypeConstants, HRESULT)
    get_report_value_type : Proc(ISystemMonitor2*, ReportValueTypeConstants*, HRESULT)
    put_monitor_duplicate_instances : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_monitor_duplicate_instances : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_display_filter : Proc(ISystemMonitor2*, Int32, HRESULT)
    get_display_filter : Proc(ISystemMonitor2*, Int32*, HRESULT)
    get_log_files : Proc(ISystemMonitor2*, ILogFiles*, HRESULT)
    put_data_source_type : Proc(ISystemMonitor2*, DataSourceTypeConstants, HRESULT)
    get_data_source_type : Proc(ISystemMonitor2*, DataSourceTypeConstants*, HRESULT)
    put_sql_dsn_name : Proc(ISystemMonitor2*, UInt8, HRESULT)
    get_sql_dsn_name : Proc(ISystemMonitor2*, UInt8*, HRESULT)
    put_sql_log_set_name : Proc(ISystemMonitor2*, UInt8, HRESULT)
    get_sql_log_set_name : Proc(ISystemMonitor2*, UInt8*, HRESULT)
    put_enable_digit_grouping : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_enable_digit_grouping : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_enable_tool_tips : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_enable_tool_tips : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_show_time_axis_labels : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_show_time_axis_labels : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_chart_scroll : Proc(ISystemMonitor2*, Int16, HRESULT)
    get_chart_scroll : Proc(ISystemMonitor2*, Int16*, HRESULT)
    put_data_point_count : Proc(ISystemMonitor2*, Int32, HRESULT)
    get_data_point_count : Proc(ISystemMonitor2*, Int32*, HRESULT)
    scale_to_fit : Proc(ISystemMonitor2*, Int16, HRESULT)
    save_as : Proc(ISystemMonitor2*, UInt8, SysmonFileType, HRESULT)
    relog : Proc(ISystemMonitor2*, UInt8, SysmonFileType, Int32, HRESULT)
    clear_data : Proc(ISystemMonitor2*, HRESULT)
    get_log_source_start_time : Proc(ISystemMonitor2*, Float64*, HRESULT)
    get_log_source_stop_time : Proc(ISystemMonitor2*, Float64*, HRESULT)
    set_log_view_range : Proc(ISystemMonitor2*, Float64, Float64, HRESULT)
    get_log_view_range : Proc(ISystemMonitor2*, Float64*, Float64*, HRESULT)
    batching_lock : Proc(ISystemMonitor2*, Int16, SysmonBatchReason, HRESULT)
    load_settings : Proc(ISystemMonitor2*, UInt8, HRESULT)
  end

  struct ISystemMonitor2
    lpVtbl : ISystemMonitor2VTbl*
  end

  struct ISystemMonitorUnionVTbl
    query_interface : Proc(ISystemMonitorUnion*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemMonitorUnion*, UInt32)
    release : Proc(ISystemMonitorUnion*, UInt32)
    get_appearance : Proc(ISystemMonitorUnion*, Int32*, HRESULT)
    put_appearance : Proc(ISystemMonitorUnion*, Int32, HRESULT)
    get_back_color : Proc(ISystemMonitorUnion*, UInt32*, HRESULT)
    put_back_color : Proc(ISystemMonitorUnion*, UInt32, HRESULT)
    get_border_style : Proc(ISystemMonitorUnion*, Int32*, HRESULT)
    put_border_style : Proc(ISystemMonitorUnion*, Int32, HRESULT)
    get_fore_color : Proc(ISystemMonitorUnion*, UInt32*, HRESULT)
    put_fore_color : Proc(ISystemMonitorUnion*, UInt32, HRESULT)
    get_font : Proc(ISystemMonitorUnion*, IFontDisp*, HRESULT)
    putref_font : Proc(ISystemMonitorUnion*, IFontDisp, HRESULT)
    get_counters : Proc(ISystemMonitorUnion*, ICounters*, HRESULT)
    put_show_vertical_grid : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_vertical_grid : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_show_horizontal_grid : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_horizontal_grid : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_show_legend : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_legend : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_show_scale_labels : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_scale_labels : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_show_value_bar : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_value_bar : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_maximum_scale : Proc(ISystemMonitorUnion*, Int32, HRESULT)
    get_maximum_scale : Proc(ISystemMonitorUnion*, Int32*, HRESULT)
    put_minimum_scale : Proc(ISystemMonitorUnion*, Int32, HRESULT)
    get_minimum_scale : Proc(ISystemMonitorUnion*, Int32*, HRESULT)
    put_update_interval : Proc(ISystemMonitorUnion*, Float32, HRESULT)
    get_update_interval : Proc(ISystemMonitorUnion*, Float32*, HRESULT)
    put_display_type : Proc(ISystemMonitorUnion*, DisplayTypeConstants, HRESULT)
    get_display_type : Proc(ISystemMonitorUnion*, DisplayTypeConstants*, HRESULT)
    put_manual_update : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_manual_update : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_graph_title : Proc(ISystemMonitorUnion*, UInt8, HRESULT)
    get_graph_title : Proc(ISystemMonitorUnion*, UInt8*, HRESULT)
    put_y_axis_label : Proc(ISystemMonitorUnion*, UInt8, HRESULT)
    get_y_axis_label : Proc(ISystemMonitorUnion*, UInt8*, HRESULT)
    collect_sample : Proc(ISystemMonitorUnion*, HRESULT)
    update_graph : Proc(ISystemMonitorUnion*, HRESULT)
    browse_counters : Proc(ISystemMonitorUnion*, HRESULT)
    display_properties : Proc(ISystemMonitorUnion*, HRESULT)
    counter : Proc(ISystemMonitorUnion*, Int32, ICounterItem*, HRESULT)
    add_counter : Proc(ISystemMonitorUnion*, UInt8, ICounterItem*, HRESULT)
    delete_counter : Proc(ISystemMonitorUnion*, ICounterItem, HRESULT)
    get_back_color_ctl : Proc(ISystemMonitorUnion*, UInt32*, HRESULT)
    put_back_color_ctl : Proc(ISystemMonitorUnion*, UInt32, HRESULT)
    put_log_file_name : Proc(ISystemMonitorUnion*, UInt8, HRESULT)
    get_log_file_name : Proc(ISystemMonitorUnion*, UInt8*, HRESULT)
    put_log_view_start : Proc(ISystemMonitorUnion*, Float64, HRESULT)
    get_log_view_start : Proc(ISystemMonitorUnion*, Float64*, HRESULT)
    put_log_view_stop : Proc(ISystemMonitorUnion*, Float64, HRESULT)
    get_log_view_stop : Proc(ISystemMonitorUnion*, Float64*, HRESULT)
    get_grid_color : Proc(ISystemMonitorUnion*, UInt32*, HRESULT)
    put_grid_color : Proc(ISystemMonitorUnion*, UInt32, HRESULT)
    get_time_bar_color : Proc(ISystemMonitorUnion*, UInt32*, HRESULT)
    put_time_bar_color : Proc(ISystemMonitorUnion*, UInt32, HRESULT)
    get_highlight : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_highlight : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_toolbar : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_show_toolbar : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    paste : Proc(ISystemMonitorUnion*, HRESULT)
    copy : Proc(ISystemMonitorUnion*, HRESULT)
    reset : Proc(ISystemMonitorUnion*, HRESULT)
    put_read_only : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_read_only : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_report_value_type : Proc(ISystemMonitorUnion*, ReportValueTypeConstants, HRESULT)
    get_report_value_type : Proc(ISystemMonitorUnion*, ReportValueTypeConstants*, HRESULT)
    put_monitor_duplicate_instances : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_monitor_duplicate_instances : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_display_filter : Proc(ISystemMonitorUnion*, Int32, HRESULT)
    get_display_filter : Proc(ISystemMonitorUnion*, Int32*, HRESULT)
    get_log_files : Proc(ISystemMonitorUnion*, ILogFiles*, HRESULT)
    put_data_source_type : Proc(ISystemMonitorUnion*, DataSourceTypeConstants, HRESULT)
    get_data_source_type : Proc(ISystemMonitorUnion*, DataSourceTypeConstants*, HRESULT)
    put_sql_dsn_name : Proc(ISystemMonitorUnion*, UInt8, HRESULT)
    get_sql_dsn_name : Proc(ISystemMonitorUnion*, UInt8*, HRESULT)
    put_sql_log_set_name : Proc(ISystemMonitorUnion*, UInt8, HRESULT)
    get_sql_log_set_name : Proc(ISystemMonitorUnion*, UInt8*, HRESULT)
    put_enable_digit_grouping : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_enable_digit_grouping : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_enable_tool_tips : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_enable_tool_tips : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_show_time_axis_labels : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_show_time_axis_labels : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_chart_scroll : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    get_chart_scroll : Proc(ISystemMonitorUnion*, Int16*, HRESULT)
    put_data_point_count : Proc(ISystemMonitorUnion*, Int32, HRESULT)
    get_data_point_count : Proc(ISystemMonitorUnion*, Int32*, HRESULT)
    scale_to_fit : Proc(ISystemMonitorUnion*, Int16, HRESULT)
    save_as : Proc(ISystemMonitorUnion*, UInt8, SysmonFileType, HRESULT)
    relog : Proc(ISystemMonitorUnion*, UInt8, SysmonFileType, Int32, HRESULT)
    clear_data : Proc(ISystemMonitorUnion*, HRESULT)
    get_log_source_start_time : Proc(ISystemMonitorUnion*, Float64*, HRESULT)
    get_log_source_stop_time : Proc(ISystemMonitorUnion*, Float64*, HRESULT)
    set_log_view_range : Proc(ISystemMonitorUnion*, Float64, Float64, HRESULT)
    get_log_view_range : Proc(ISystemMonitorUnion*, Float64*, Float64*, HRESULT)
    batching_lock : Proc(ISystemMonitorUnion*, Int16, SysmonBatchReason, HRESULT)
    load_settings : Proc(ISystemMonitorUnion*, UInt8, HRESULT)
  end

  struct ISystemMonitorUnion
    lpVtbl : ISystemMonitorUnionVTbl*
  end

  struct DISystemMonitorVTbl
    query_interface : Proc(DISystemMonitor*, Guid*, Void**, HRESULT)
    add_ref : Proc(DISystemMonitor*, UInt32)
    release : Proc(DISystemMonitor*, UInt32)
    get_type_info_count : Proc(DISystemMonitor*, UInt32*, HRESULT)
    get_type_info : Proc(DISystemMonitor*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DISystemMonitor*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DISystemMonitor*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct DISystemMonitor
    lpVtbl : DISystemMonitorVTbl*
  end

  struct DISystemMonitorInternalVTbl
    query_interface : Proc(DISystemMonitorInternal*, Guid*, Void**, HRESULT)
    add_ref : Proc(DISystemMonitorInternal*, UInt32)
    release : Proc(DISystemMonitorInternal*, UInt32)
    get_type_info_count : Proc(DISystemMonitorInternal*, UInt32*, HRESULT)
    get_type_info : Proc(DISystemMonitorInternal*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DISystemMonitorInternal*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DISystemMonitorInternal*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct DISystemMonitorInternal
    lpVtbl : DISystemMonitorInternalVTbl*
  end

  struct ISystemMonitorEventsVTbl
    query_interface : Proc(ISystemMonitorEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemMonitorEvents*, UInt32)
    release : Proc(ISystemMonitorEvents*, UInt32)
    on_counter_selected : Proc(ISystemMonitorEvents*, Int32, Void)
    on_counter_added : Proc(ISystemMonitorEvents*, Int32, Void)
    on_counter_deleted : Proc(ISystemMonitorEvents*, Int32, Void)
    on_sample_collected : Proc(ISystemMonitorEvents*, Void)
    on_dbl_click : Proc(ISystemMonitorEvents*, Int32, Void)
  end

  struct ISystemMonitorEvents
    lpVtbl : ISystemMonitorEventsVTbl*
  end

  struct DISystemMonitorEventsVTbl
    query_interface : Proc(DISystemMonitorEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(DISystemMonitorEvents*, UInt32)
    release : Proc(DISystemMonitorEvents*, UInt32)
    get_type_info_count : Proc(DISystemMonitorEvents*, UInt32*, HRESULT)
    get_type_info : Proc(DISystemMonitorEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DISystemMonitorEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DISystemMonitorEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  struct DISystemMonitorEvents
    lpVtbl : DISystemMonitorEventsVTbl*
  end


  # Params # lpperformancecount : LARGE_INTEGER* [In]
  # Commented out because function is part of Lib C
  #fun QueryPerformanceCounter(lpperformancecount : LARGE_INTEGER*) : LibC::BOOL

  # Params # lpfrequency : LARGE_INTEGER* [In]
  # Commented out because function is part of Lib C
  #fun QueryPerformanceFrequency(lpfrequency : LARGE_INTEGER*) : LibC::BOOL

  # Params # szcomputername : LibC::LPWSTR [In],lpinifile : LibC::LPWSTR [In],dwflags : LibC::UINT_PTR [In]
  fun InstallPerfDllW(szcomputername : LibC::LPWSTR, lpinifile : LibC::LPWSTR, dwflags : LibC::UINT_PTR) : UInt32

  # Params # szcomputername : PSTR [In],lpinifile : PSTR [In],dwflags : LibC::UINT_PTR [In]
  fun InstallPerfDllA(szcomputername : PSTR, lpinifile : PSTR, dwflags : LibC::UINT_PTR) : UInt32

  # Params # lpcommandline : PSTR [In],bquietmodearg : LibC::BOOL [In]
  fun LoadPerfCounterTextStringsA(lpcommandline : PSTR, bquietmodearg : LibC::BOOL) : UInt32

  # Params # lpcommandline : LibC::LPWSTR [In],bquietmodearg : LibC::BOOL [In]
  fun LoadPerfCounterTextStringsW(lpcommandline : LibC::LPWSTR, bquietmodearg : LibC::BOOL) : UInt32

  # Params # lpcommandline : LibC::LPWSTR [In],bquietmodearg : LibC::BOOL [In]
  fun UnloadPerfCounterTextStringsW(lpcommandline : LibC::LPWSTR, bquietmodearg : LibC::BOOL) : UInt32

  # Params # lpcommandline : PSTR [In],bquietmodearg : LibC::BOOL [In]
  fun UnloadPerfCounterTextStringsA(lpcommandline : PSTR, bquietmodearg : LibC::BOOL) : UInt32

  # Params # sznewctrfilepath : PSTR [In],sznewhlpfilepath : PSTR [In],szlanguageid : PSTR [In],dwflags : LibC::UINT_PTR [In]
  fun UpdatePerfNameFilesA(sznewctrfilepath : PSTR, sznewhlpfilepath : PSTR, szlanguageid : PSTR, dwflags : LibC::UINT_PTR) : UInt32

  # Params # sznewctrfilepath : LibC::LPWSTR [In],sznewhlpfilepath : LibC::LPWSTR [In],szlanguageid : LibC::LPWSTR [In],dwflags : LibC::UINT_PTR [In]
  fun UpdatePerfNameFilesW(sznewctrfilepath : LibC::LPWSTR, sznewhlpfilepath : LibC::LPWSTR, szlanguageid : LibC::LPWSTR, dwflags : LibC::UINT_PTR) : UInt32

  # Params # szreserved : PSTR [In],szservicename : PSTR [In]
  fun SetServiceAsTrustedA(szreserved : PSTR, szservicename : PSTR) : UInt32

  # Params # szreserved : LibC::LPWSTR [In],szservicename : LibC::LPWSTR [In]
  fun SetServiceAsTrustedW(szreserved : LibC::LPWSTR, szservicename : LibC::LPWSTR) : UInt32

  # Params # szfilename : LibC::LPWSTR [In],szcommentstring : LibC::LPWSTR [In]
  fun BackupPerfRegistryToFileW(szfilename : LibC::LPWSTR, szcommentstring : LibC::LPWSTR) : UInt32

  # Params # szfilename : LibC::LPWSTR [In],szlangid : LibC::LPWSTR [In]
  fun RestorePerfRegistryFromFileW(szfilename : LibC::LPWSTR, szlangid : LibC::LPWSTR) : UInt32

  # Params # providerguid : Guid* [In],controlcallback : PERFLIBREQUEST [In],phprovider : PerfProviderHandle* [In]
  fun PerfStartProvider(providerguid : Guid*, controlcallback : PERFLIBREQUEST, phprovider : PerfProviderHandle*) : UInt32

  # Params # providerguid : Guid* [In],providercontext : PERF_PROVIDER_CONTEXT* [In],provider : PerfProviderHandle* [In]
  fun PerfStartProviderEx(providerguid : Guid*, providercontext : PERF_PROVIDER_CONTEXT*, provider : PerfProviderHandle*) : UInt32

  # Params # providerhandle : PerfProviderHandle [In]
  fun PerfStopProvider(providerhandle : PerfProviderHandle) : UInt32

  # Params # providerhandle : LibC::HANDLE [In],template : PERF_COUNTERSET_INFO* [In],templatesize : UInt32 [In]
  fun PerfSetCounterSetInfo(providerhandle : LibC::HANDLE, template : PERF_COUNTERSET_INFO*, templatesize : UInt32) : UInt32

  # Params # providerhandle : PerfProviderHandle [In],countersetguid : Guid* [In],name : LibC::LPWSTR [In],id : UInt32 [In]
  fun PerfCreateInstance(providerhandle : PerfProviderHandle, countersetguid : Guid*, name : LibC::LPWSTR, id : UInt32) : PERF_COUNTERSET_INSTANCE*

  # Params # provider : PerfProviderHandle [In],instanceblock : PERF_COUNTERSET_INSTANCE* [In]
  fun PerfDeleteInstance(provider : PerfProviderHandle, instanceblock : PERF_COUNTERSET_INSTANCE*) : UInt32

  # Params # providerhandle : LibC::HANDLE [In],countersetguid : Guid* [In],name : LibC::LPWSTR [In],id : UInt32 [In]
  fun PerfQueryInstance(providerhandle : LibC::HANDLE, countersetguid : Guid*, name : LibC::LPWSTR, id : UInt32) : PERF_COUNTERSET_INSTANCE*

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],address : Void* [In]
  fun PerfSetCounterRefValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, address : Void*) : UInt32

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],value : UInt32 [In]
  fun PerfSetULongCounterValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, value : UInt32) : UInt32

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],value : UInt64 [In]
  fun PerfSetULongLongCounterValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, value : UInt64) : UInt32

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],value : UInt32 [In]
  fun PerfIncrementULongCounterValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, value : UInt32) : UInt32

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],value : UInt64 [In]
  fun PerfIncrementULongLongCounterValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, value : UInt64) : UInt32

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],value : UInt32 [In]
  fun PerfDecrementULongCounterValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, value : UInt32) : UInt32

  # Params # provider : LibC::HANDLE [In],instance : PERF_COUNTERSET_INSTANCE* [In],counterid : UInt32 [In],value : UInt64 [In]
  fun PerfDecrementULongLongCounterValue(provider : LibC::HANDLE, instance : PERF_COUNTERSET_INSTANCE*, counterid : UInt32, value : UInt64) : UInt32

  # Params # szmachine : LibC::LPWSTR [In],pcountersetids : Guid* [In],ccountersetids : UInt32 [In],pccountersetidsactual : UInt32* [In]
  fun PerfEnumerateCounterSet(szmachine : LibC::LPWSTR, pcountersetids : Guid*, ccountersetids : UInt32, pccountersetidsactual : UInt32*) : UInt32

  # Params # szmachine : LibC::LPWSTR [In],pcountersetid : Guid* [In],pinstances : PERF_INSTANCE_HEADER* [In],cbinstances : UInt32 [In],pcbinstancesactual : UInt32* [In]
  fun PerfEnumerateCounterSetInstances(szmachine : LibC::LPWSTR, pcountersetid : Guid*, pinstances : PERF_INSTANCE_HEADER*, cbinstances : UInt32, pcbinstancesactual : UInt32*) : UInt32

  # Params # szmachine : LibC::LPWSTR [In],pcountersetid : Guid* [In],requestcode : PerfRegInfoType [In],requestlangid : UInt32 [In],pbreginfo : UInt8* [In],cbreginfo : UInt32 [In],pcbreginfoactual : UInt32* [In]
  fun PerfQueryCounterSetRegistrationInfo(szmachine : LibC::LPWSTR, pcountersetid : Guid*, requestcode : PerfRegInfoType, requestlangid : UInt32, pbreginfo : UInt8*, cbreginfo : UInt32, pcbreginfoactual : UInt32*) : UInt32

  # Params # szmachine : LibC::LPWSTR [In],phquery : PerfQueryHandle* [In]
  fun PerfOpenQueryHandle(szmachine : LibC::LPWSTR, phquery : PerfQueryHandle*) : UInt32

  # Params # hquery : LibC::HANDLE [In]
  fun PerfCloseQueryHandle(hquery : LibC::HANDLE) : UInt32

  # Params # hquery : PerfQueryHandle [In],pcounters : PERF_COUNTER_IDENTIFIER* [In],cbcounters : UInt32 [In],pcbcountersactual : UInt32* [In]
  fun PerfQueryCounterInfo(hquery : PerfQueryHandle, pcounters : PERF_COUNTER_IDENTIFIER*, cbcounters : UInt32, pcbcountersactual : UInt32*) : UInt32

  # Params # hquery : PerfQueryHandle [In],pcounterblock : PERF_DATA_HEADER* [In],cbcounterblock : UInt32 [In],pcbcounterblockactual : UInt32* [In]
  fun PerfQueryCounterData(hquery : PerfQueryHandle, pcounterblock : PERF_DATA_HEADER*, cbcounterblock : UInt32, pcbcounterblockactual : UInt32*) : UInt32

  # Params # hquery : PerfQueryHandle [In],pcounters : PERF_COUNTER_IDENTIFIER* [In],cbcounters : UInt32 [In]
  fun PerfAddCounters(hquery : PerfQueryHandle, pcounters : PERF_COUNTER_IDENTIFIER*, cbcounters : UInt32) : UInt32

  # Params # hquery : PerfQueryHandle [In],pcounters : PERF_COUNTER_IDENTIFIER* [In],cbcounters : UInt32 [In]
  fun PerfDeleteCounters(hquery : PerfQueryHandle, pcounters : PERF_COUNTER_IDENTIFIER*, cbcounters : UInt32) : UInt32

  # Params # lpdwversion : PDH_DLL_VERSION* [In]
  fun PdhGetDllVersion(lpdwversion : PDH_DLL_VERSION*) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],dwuserdata : LibC::UINT_PTR [In],phquery : LibC::IntPtrT* [In]
  fun PdhOpenQueryW(szdatasource : LibC::LPWSTR, dwuserdata : LibC::UINT_PTR, phquery : LibC::IntPtrT*) : Int32

  # Params # szdatasource : PSTR [In],dwuserdata : LibC::UINT_PTR [In],phquery : LibC::IntPtrT* [In]
  fun PdhOpenQueryA(szdatasource : PSTR, dwuserdata : LibC::UINT_PTR, phquery : LibC::IntPtrT*) : Int32

  # Params # hquery : LibC::IntPtrT [In],szfullcounterpath : LibC::LPWSTR [In],dwuserdata : LibC::UINT_PTR [In],phcounter : LibC::IntPtrT* [In]
  fun PdhAddCounterW(hquery : LibC::IntPtrT, szfullcounterpath : LibC::LPWSTR, dwuserdata : LibC::UINT_PTR, phcounter : LibC::IntPtrT*) : Int32

  # Params # hquery : LibC::IntPtrT [In],szfullcounterpath : PSTR [In],dwuserdata : LibC::UINT_PTR [In],phcounter : LibC::IntPtrT* [In]
  fun PdhAddCounterA(hquery : LibC::IntPtrT, szfullcounterpath : PSTR, dwuserdata : LibC::UINT_PTR, phcounter : LibC::IntPtrT*) : Int32

  # Params # hquery : LibC::IntPtrT [In],szfullcounterpath : LibC::LPWSTR [In],dwuserdata : LibC::UINT_PTR [In],phcounter : LibC::IntPtrT* [In]
  fun PdhAddEnglishCounterW(hquery : LibC::IntPtrT, szfullcounterpath : LibC::LPWSTR, dwuserdata : LibC::UINT_PTR, phcounter : LibC::IntPtrT*) : Int32

  # Params # hquery : LibC::IntPtrT [In],szfullcounterpath : PSTR [In],dwuserdata : LibC::UINT_PTR [In],phcounter : LibC::IntPtrT* [In]
  fun PdhAddEnglishCounterA(hquery : LibC::IntPtrT, szfullcounterpath : PSTR, dwuserdata : LibC::UINT_PTR, phcounter : LibC::IntPtrT*) : Int32

  # Params # hquery : LibC::IntPtrT [In],plltimestamp : Int64* [In]
  fun PdhCollectQueryDataWithTime(hquery : LibC::IntPtrT, plltimestamp : Int64*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szfullpathbuffer : LibC::LPWSTR [In]
  fun PdhValidatePathExW(hdatasource : LibC::IntPtrT, szfullpathbuffer : LibC::LPWSTR) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szfullpathbuffer : PSTR [In]
  fun PdhValidatePathExA(hdatasource : LibC::IntPtrT, szfullpathbuffer : PSTR) : Int32

  # Params # hcounter : LibC::IntPtrT [In]
  fun PdhRemoveCounter(hcounter : LibC::IntPtrT) : Int32

  # Params # hquery : LibC::IntPtrT [In]
  fun PdhCollectQueryData(hquery : LibC::IntPtrT) : Int32

  # Params # hquery : LibC::IntPtrT [In]
  fun PdhCloseQuery(hquery : LibC::IntPtrT) : Int32

  # Params # hcounter : LibC::IntPtrT [In],dwformat : PDH_FMT [In],lpdwtype : UInt32* [In],pvalue : PDH_FMT_COUNTERVALUE* [In]
  fun PdhGetFormattedCounterValue(hcounter : LibC::IntPtrT, dwformat : PDH_FMT, lpdwtype : UInt32*, pvalue : PDH_FMT_COUNTERVALUE*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],dwformat : PDH_FMT [In],lpdwbuffersize : UInt32* [In],lpdwitemcount : UInt32* [In],itembuffer : PDH_FMT_COUNTERVALUE_ITEM_A* [In]
  fun PdhGetFormattedCounterArrayA(hcounter : LibC::IntPtrT, dwformat : PDH_FMT, lpdwbuffersize : UInt32*, lpdwitemcount : UInt32*, itembuffer : PDH_FMT_COUNTERVALUE_ITEM_A*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],dwformat : PDH_FMT [In],lpdwbuffersize : UInt32* [In],lpdwitemcount : UInt32* [In],itembuffer : PDH_FMT_COUNTERVALUE_ITEM_W* [In]
  fun PdhGetFormattedCounterArrayW(hcounter : LibC::IntPtrT, dwformat : PDH_FMT, lpdwbuffersize : UInt32*, lpdwitemcount : UInt32*, itembuffer : PDH_FMT_COUNTERVALUE_ITEM_W*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],lpdwtype : UInt32* [In],pvalue : PDH_RAW_COUNTER* [In]
  fun PdhGetRawCounterValue(hcounter : LibC::IntPtrT, lpdwtype : UInt32*, pvalue : PDH_RAW_COUNTER*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],lpdwbuffersize : UInt32* [In],lpdwitemcount : UInt32* [In],itembuffer : PDH_RAW_COUNTER_ITEM_A* [In]
  fun PdhGetRawCounterArrayA(hcounter : LibC::IntPtrT, lpdwbuffersize : UInt32*, lpdwitemcount : UInt32*, itembuffer : PDH_RAW_COUNTER_ITEM_A*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],lpdwbuffersize : UInt32* [In],lpdwitemcount : UInt32* [In],itembuffer : PDH_RAW_COUNTER_ITEM_W* [In]
  fun PdhGetRawCounterArrayW(hcounter : LibC::IntPtrT, lpdwbuffersize : UInt32*, lpdwitemcount : UInt32*, itembuffer : PDH_RAW_COUNTER_ITEM_W*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],dwformat : PDH_FMT [In],rawvalue1 : PDH_RAW_COUNTER* [In],rawvalue2 : PDH_RAW_COUNTER* [In],fmtvalue : PDH_FMT_COUNTERVALUE* [In]
  fun PdhCalculateCounterFromRawValue(hcounter : LibC::IntPtrT, dwformat : PDH_FMT, rawvalue1 : PDH_RAW_COUNTER*, rawvalue2 : PDH_RAW_COUNTER*, fmtvalue : PDH_FMT_COUNTERVALUE*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],dwformat : PDH_FMT [In],dwfirstentry : UInt32 [In],dwnumentries : UInt32 [In],lprawvaluearray : PDH_RAW_COUNTER* [In],data : PDH_STATISTICS* [In]
  fun PdhComputeCounterStatistics(hcounter : LibC::IntPtrT, dwformat : PDH_FMT, dwfirstentry : UInt32, dwnumentries : UInt32, lprawvaluearray : PDH_RAW_COUNTER*, data : PDH_STATISTICS*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],bretrieveexplaintext : BOOLEAN [In],pdwbuffersize : UInt32* [In],lpbuffer : PDH_COUNTER_INFO_W* [In]
  fun PdhGetCounterInfoW(hcounter : LibC::IntPtrT, bretrieveexplaintext : BOOLEAN, pdwbuffersize : UInt32*, lpbuffer : PDH_COUNTER_INFO_W*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],bretrieveexplaintext : BOOLEAN [In],pdwbuffersize : UInt32* [In],lpbuffer : PDH_COUNTER_INFO_A* [In]
  fun PdhGetCounterInfoA(hcounter : LibC::IntPtrT, bretrieveexplaintext : BOOLEAN, pdwbuffersize : UInt32*, lpbuffer : PDH_COUNTER_INFO_A*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],lfactor : Int32 [In]
  fun PdhSetCounterScaleFactor(hcounter : LibC::IntPtrT, lfactor : Int32) : Int32

  # Params # szmachinename : LibC::LPWSTR [In]
  fun PdhConnectMachineW(szmachinename : LibC::LPWSTR) : Int32

  # Params # szmachinename : PSTR [In]
  fun PdhConnectMachineA(szmachinename : PSTR) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],mszmachinelist : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhEnumMachinesW(szdatasource : LibC::LPWSTR, mszmachinelist : LibC::LPWSTR, pcchbuffersize : UInt32*) : Int32

  # Params # szdatasource : PSTR [In],mszmachinelist : PSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhEnumMachinesA(szdatasource : PSTR, mszmachinelist : PSTR, pcchbuffersize : UInt32*) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],szmachinename : LibC::LPWSTR [In],mszobjectlist : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],brefresh : LibC::BOOL [In]
  fun PdhEnumObjectsW(szdatasource : LibC::LPWSTR, szmachinename : LibC::LPWSTR, mszobjectlist : LibC::LPWSTR, pcchbuffersize : UInt32*, dwdetaillevel : PERF_DETAIL, brefresh : LibC::BOOL) : Int32

  # Params # szdatasource : PSTR [In],szmachinename : PSTR [In],mszobjectlist : PSTR [In],pcchbuffersize : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],brefresh : LibC::BOOL [In]
  fun PdhEnumObjectsA(szdatasource : PSTR, szmachinename : PSTR, mszobjectlist : PSTR, pcchbuffersize : UInt32*, dwdetaillevel : PERF_DETAIL, brefresh : LibC::BOOL) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],szmachinename : LibC::LPWSTR [In],szobjectname : LibC::LPWSTR [In],mszcounterlist : LibC::LPWSTR [In],pcchcounterlistlength : UInt32* [In],mszinstancelist : LibC::LPWSTR [In],pcchinstancelistlength : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],dwflags : UInt32 [In]
  fun PdhEnumObjectItemsW(szdatasource : LibC::LPWSTR, szmachinename : LibC::LPWSTR, szobjectname : LibC::LPWSTR, mszcounterlist : LibC::LPWSTR, pcchcounterlistlength : UInt32*, mszinstancelist : LibC::LPWSTR, pcchinstancelistlength : UInt32*, dwdetaillevel : PERF_DETAIL, dwflags : UInt32) : Int32

  # Params # szdatasource : PSTR [In],szmachinename : PSTR [In],szobjectname : PSTR [In],mszcounterlist : PSTR [In],pcchcounterlistlength : UInt32* [In],mszinstancelist : PSTR [In],pcchinstancelistlength : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],dwflags : UInt32 [In]
  fun PdhEnumObjectItemsA(szdatasource : PSTR, szmachinename : PSTR, szobjectname : PSTR, mszcounterlist : PSTR, pcchcounterlistlength : UInt32*, mszinstancelist : PSTR, pcchinstancelistlength : UInt32*, dwdetaillevel : PERF_DETAIL, dwflags : UInt32) : Int32

  # Params # pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_W* [In],szfullpathbuffer : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In],dwflags : PDH_PATH_FLAGS [In]
  fun PdhMakeCounterPathW(pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_W*, szfullpathbuffer : LibC::LPWSTR, pcchbuffersize : UInt32*, dwflags : PDH_PATH_FLAGS) : Int32

  # Params # pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_A* [In],szfullpathbuffer : PSTR [In],pcchbuffersize : UInt32* [In],dwflags : PDH_PATH_FLAGS [In]
  fun PdhMakeCounterPathA(pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_A*, szfullpathbuffer : PSTR, pcchbuffersize : UInt32*, dwflags : PDH_PATH_FLAGS) : Int32

  # Params # szfullpathbuffer : LibC::LPWSTR [In],pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_W* [In],pdwbuffersize : UInt32* [In],dwflags : UInt32 [In]
  fun PdhParseCounterPathW(szfullpathbuffer : LibC::LPWSTR, pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_W*, pdwbuffersize : UInt32*, dwflags : UInt32) : Int32

  # Params # szfullpathbuffer : PSTR [In],pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_A* [In],pdwbuffersize : UInt32* [In],dwflags : UInt32 [In]
  fun PdhParseCounterPathA(szfullpathbuffer : PSTR, pcounterpathelements : PDH_COUNTER_PATH_ELEMENTS_A*, pdwbuffersize : UInt32*, dwflags : UInt32) : Int32

  # Params # szinstancestring : LibC::LPWSTR [In],szinstancename : LibC::LPWSTR [In],pcchinstancenamelength : UInt32* [In],szparentname : LibC::LPWSTR [In],pcchparentnamelength : UInt32* [In],lpindex : UInt32* [In]
  fun PdhParseInstanceNameW(szinstancestring : LibC::LPWSTR, szinstancename : LibC::LPWSTR, pcchinstancenamelength : UInt32*, szparentname : LibC::LPWSTR, pcchparentnamelength : UInt32*, lpindex : UInt32*) : Int32

  # Params # szinstancestring : PSTR [In],szinstancename : PSTR [In],pcchinstancenamelength : UInt32* [In],szparentname : PSTR [In],pcchparentnamelength : UInt32* [In],lpindex : UInt32* [In]
  fun PdhParseInstanceNameA(szinstancestring : PSTR, szinstancename : PSTR, pcchinstancenamelength : UInt32*, szparentname : PSTR, pcchparentnamelength : UInt32*, lpindex : UInt32*) : Int32

  # Params # szfullpathbuffer : LibC::LPWSTR [In]
  fun PdhValidatePathW(szfullpathbuffer : LibC::LPWSTR) : Int32

  # Params # szfullpathbuffer : PSTR [In]
  fun PdhValidatePathA(szfullpathbuffer : PSTR) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],szmachinename : LibC::LPWSTR [In],szdefaultobjectname : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfObjectW(szdatasource : LibC::LPWSTR, szmachinename : LibC::LPWSTR, szdefaultobjectname : LibC::LPWSTR, pcchbuffersize : UInt32*) : Int32

  # Params # szdatasource : PSTR [In],szmachinename : PSTR [In],szdefaultobjectname : PSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfObjectA(szdatasource : PSTR, szmachinename : PSTR, szdefaultobjectname : PSTR, pcchbuffersize : UInt32*) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],szmachinename : LibC::LPWSTR [In],szobjectname : LibC::LPWSTR [In],szdefaultcountername : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfCounterW(szdatasource : LibC::LPWSTR, szmachinename : LibC::LPWSTR, szobjectname : LibC::LPWSTR, szdefaultcountername : LibC::LPWSTR, pcchbuffersize : UInt32*) : Int32

  # Params # szdatasource : PSTR [In],szmachinename : PSTR [In],szobjectname : PSTR [In],szdefaultcountername : PSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfCounterA(szdatasource : PSTR, szmachinename : PSTR, szobjectname : PSTR, szdefaultcountername : PSTR, pcchbuffersize : UInt32*) : Int32

  # Params # pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_W* [In]
  fun PdhBrowseCountersW(pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_W*) : Int32

  # Params # pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_A* [In]
  fun PdhBrowseCountersA(pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_A*) : Int32

  # Params # szwildcardpath : LibC::LPWSTR [In],mszexpandedpathlist : LibC::LPWSTR [In],pcchpathlistlength : UInt32* [In]
  fun PdhExpandCounterPathW(szwildcardpath : LibC::LPWSTR, mszexpandedpathlist : LibC::LPWSTR, pcchpathlistlength : UInt32*) : Int32

  # Params # szwildcardpath : PSTR [In],mszexpandedpathlist : PSTR [In],pcchpathlistlength : UInt32* [In]
  fun PdhExpandCounterPathA(szwildcardpath : PSTR, mszexpandedpathlist : PSTR, pcchpathlistlength : UInt32*) : Int32

  # Params # szmachinename : LibC::LPWSTR [In],dwnameindex : UInt32 [In],sznamebuffer : LibC::LPWSTR [In],pcchnamebuffersize : UInt32* [In]
  fun PdhLookupPerfNameByIndexW(szmachinename : LibC::LPWSTR, dwnameindex : UInt32, sznamebuffer : LibC::LPWSTR, pcchnamebuffersize : UInt32*) : Int32

  # Params # szmachinename : PSTR [In],dwnameindex : UInt32 [In],sznamebuffer : PSTR [In],pcchnamebuffersize : UInt32* [In]
  fun PdhLookupPerfNameByIndexA(szmachinename : PSTR, dwnameindex : UInt32, sznamebuffer : PSTR, pcchnamebuffersize : UInt32*) : Int32

  # Params # szmachinename : LibC::LPWSTR [In],sznamebuffer : LibC::LPWSTR [In],pdwindex : UInt32* [In]
  fun PdhLookupPerfIndexByNameW(szmachinename : LibC::LPWSTR, sznamebuffer : LibC::LPWSTR, pdwindex : UInt32*) : Int32

  # Params # szmachinename : PSTR [In],sznamebuffer : PSTR [In],pdwindex : UInt32* [In]
  fun PdhLookupPerfIndexByNameA(szmachinename : PSTR, sznamebuffer : PSTR, pdwindex : UInt32*) : Int32

  # Params # szdatasource : PSTR [In],szwildcardpath : PSTR [In],mszexpandedpathlist : PSTR [In],pcchpathlistlength : UInt32* [In],dwflags : UInt32 [In]
  fun PdhExpandWildCardPathA(szdatasource : PSTR, szwildcardpath : PSTR, mszexpandedpathlist : PSTR, pcchpathlistlength : UInt32*, dwflags : UInt32) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],szwildcardpath : LibC::LPWSTR [In],mszexpandedpathlist : LibC::LPWSTR [In],pcchpathlistlength : UInt32* [In],dwflags : UInt32 [In]
  fun PdhExpandWildCardPathW(szdatasource : LibC::LPWSTR, szwildcardpath : LibC::LPWSTR, mszexpandedpathlist : LibC::LPWSTR, pcchpathlistlength : UInt32*, dwflags : UInt32) : Int32

  # Params # szlogfilename : LibC::LPWSTR [In],dwaccessflags : PDH_LOG [In],lpdwlogtype : PDH_LOG_TYPE* [In],hquery : LibC::IntPtrT [In],dwmaxsize : UInt32 [In],szusercaption : LibC::LPWSTR [In],phlog : LibC::IntPtrT* [In]
  fun PdhOpenLogW(szlogfilename : LibC::LPWSTR, dwaccessflags : PDH_LOG, lpdwlogtype : PDH_LOG_TYPE*, hquery : LibC::IntPtrT, dwmaxsize : UInt32, szusercaption : LibC::LPWSTR, phlog : LibC::IntPtrT*) : Int32

  # Params # szlogfilename : PSTR [In],dwaccessflags : PDH_LOG [In],lpdwlogtype : PDH_LOG_TYPE* [In],hquery : LibC::IntPtrT [In],dwmaxsize : UInt32 [In],szusercaption : PSTR [In],phlog : LibC::IntPtrT* [In]
  fun PdhOpenLogA(szlogfilename : PSTR, dwaccessflags : PDH_LOG, lpdwlogtype : PDH_LOG_TYPE*, hquery : LibC::IntPtrT, dwmaxsize : UInt32, szusercaption : PSTR, phlog : LibC::IntPtrT*) : Int32

  # Params # hlog : LibC::IntPtrT [In],szuserstring : LibC::LPWSTR [In]
  fun PdhUpdateLogW(hlog : LibC::IntPtrT, szuserstring : LibC::LPWSTR) : Int32

  # Params # hlog : LibC::IntPtrT [In],szuserstring : PSTR [In]
  fun PdhUpdateLogA(hlog : LibC::IntPtrT, szuserstring : PSTR) : Int32

  # Params # hlog : LibC::IntPtrT [In]
  fun PdhUpdateLogFileCatalog(hlog : LibC::IntPtrT) : Int32

  # Params # hlog : LibC::IntPtrT [In],llsize : Int64* [In]
  fun PdhGetLogFileSize(hlog : LibC::IntPtrT, llsize : Int64*) : Int32

  # Params # hlog : LibC::IntPtrT [In],dwflags : UInt32 [In]
  fun PdhCloseLog(hlog : LibC::IntPtrT, dwflags : UInt32) : Int32

  # Params # hwndowner : LibC::HANDLE [In],dwflags : PDH_SELECT_DATA_SOURCE_FLAGS [In],szdatasource : LibC::LPWSTR [In],pcchbufferlength : UInt32* [In]
  fun PdhSelectDataSourceW(hwndowner : LibC::HANDLE, dwflags : PDH_SELECT_DATA_SOURCE_FLAGS, szdatasource : LibC::LPWSTR, pcchbufferlength : UInt32*) : Int32

  # Params # hwndowner : LibC::HANDLE [In],dwflags : PDH_SELECT_DATA_SOURCE_FLAGS [In],szdatasource : PSTR [In],pcchbufferlength : UInt32* [In]
  fun PdhSelectDataSourceA(hwndowner : LibC::HANDLE, dwflags : PDH_SELECT_DATA_SOURCE_FLAGS, szdatasource : PSTR, pcchbufferlength : UInt32*) : Int32

  # Params # hquery : LibC::IntPtrT [In]
  fun PdhIsRealTimeQuery(hquery : LibC::IntPtrT) : LibC::BOOL

  # Params # hquery : LibC::IntPtrT [In],pinfo : PDH_TIME_INFO* [In]
  fun PdhSetQueryTimeRange(hquery : LibC::IntPtrT, pinfo : PDH_TIME_INFO*) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],pdwnumentries : UInt32* [In],pinfo : PDH_TIME_INFO* [In],pdwbuffersize : UInt32* [In]
  fun PdhGetDataSourceTimeRangeW(szdatasource : LibC::LPWSTR, pdwnumentries : UInt32*, pinfo : PDH_TIME_INFO*, pdwbuffersize : UInt32*) : Int32

  # Params # szdatasource : PSTR [In],pdwnumentries : UInt32* [In],pinfo : PDH_TIME_INFO* [In],pdwbuffersize : UInt32* [In]
  fun PdhGetDataSourceTimeRangeA(szdatasource : PSTR, pdwnumentries : UInt32*, pinfo : PDH_TIME_INFO*, pdwbuffersize : UInt32*) : Int32

  # Params # hquery : LibC::IntPtrT [In],dwintervaltime : UInt32 [In],hnewdataevent : LibC::HANDLE [In]
  fun PdhCollectQueryDataEx(hquery : LibC::IntPtrT, dwintervaltime : UInt32, hnewdataevent : LibC::HANDLE) : Int32

  # Params # dwcountertype : UInt32 [In],dwformat : PDH_FMT [In],ptimebase : Int64* [In],prawvalue1 : PDH_RAW_COUNTER* [In],prawvalue2 : PDH_RAW_COUNTER* [In],pfmtvalue : PDH_FMT_COUNTERVALUE* [In]
  fun PdhFormatFromRawValue(dwcountertype : UInt32, dwformat : PDH_FMT, ptimebase : Int64*, prawvalue1 : PDH_RAW_COUNTER*, prawvalue2 : PDH_RAW_COUNTER*, pfmtvalue : PDH_FMT_COUNTERVALUE*) : Int32

  # Params # hcounter : LibC::IntPtrT [In],ptimebase : Int64* [In]
  fun PdhGetCounterTimeBase(hcounter : LibC::IntPtrT, ptimebase : Int64*) : Int32

  # Params # hlog : LibC::IntPtrT [In],ftrecord : FILETIME [In],prawlogrecord : PDH_RAW_LOG_RECORD* [In],pdwbufferlength : UInt32* [In]
  fun PdhReadRawLogRecord(hlog : LibC::IntPtrT, ftrecord : FILETIME, prawlogrecord : PDH_RAW_LOG_RECORD*, pdwbufferlength : UInt32*) : Int32

  # Params # dwdatasourceid : REAL_TIME_DATA_SOURCE_ID_FLAGS [In]
  fun PdhSetDefaultRealTimeDataSource(dwdatasourceid : REAL_TIME_DATA_SOURCE_ID_FLAGS) : Int32

  # Params # phdatasource : LibC::IntPtrT* [In],logfilenamelist : LibC::LPWSTR [In]
  fun PdhBindInputDataSourceW(phdatasource : LibC::IntPtrT*, logfilenamelist : LibC::LPWSTR) : Int32

  # Params # phdatasource : LibC::IntPtrT* [In],logfilenamelist : PSTR [In]
  fun PdhBindInputDataSourceA(phdatasource : LibC::IntPtrT*, logfilenamelist : PSTR) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],dwuserdata : LibC::UINT_PTR [In],phquery : LibC::IntPtrT* [In]
  fun PdhOpenQueryH(hdatasource : LibC::IntPtrT, dwuserdata : LibC::UINT_PTR, phquery : LibC::IntPtrT*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],mszmachinelist : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhEnumMachinesHW(hdatasource : LibC::IntPtrT, mszmachinelist : LibC::LPWSTR, pcchbuffersize : UInt32*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],mszmachinelist : PSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhEnumMachinesHA(hdatasource : LibC::IntPtrT, mszmachinelist : PSTR, pcchbuffersize : UInt32*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : LibC::LPWSTR [In],mszobjectlist : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],brefresh : LibC::BOOL [In]
  fun PdhEnumObjectsHW(hdatasource : LibC::IntPtrT, szmachinename : LibC::LPWSTR, mszobjectlist : LibC::LPWSTR, pcchbuffersize : UInt32*, dwdetaillevel : PERF_DETAIL, brefresh : LibC::BOOL) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : PSTR [In],mszobjectlist : PSTR [In],pcchbuffersize : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],brefresh : LibC::BOOL [In]
  fun PdhEnumObjectsHA(hdatasource : LibC::IntPtrT, szmachinename : PSTR, mszobjectlist : PSTR, pcchbuffersize : UInt32*, dwdetaillevel : PERF_DETAIL, brefresh : LibC::BOOL) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : LibC::LPWSTR [In],szobjectname : LibC::LPWSTR [In],mszcounterlist : LibC::LPWSTR [In],pcchcounterlistlength : UInt32* [In],mszinstancelist : LibC::LPWSTR [In],pcchinstancelistlength : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],dwflags : UInt32 [In]
  fun PdhEnumObjectItemsHW(hdatasource : LibC::IntPtrT, szmachinename : LibC::LPWSTR, szobjectname : LibC::LPWSTR, mszcounterlist : LibC::LPWSTR, pcchcounterlistlength : UInt32*, mszinstancelist : LibC::LPWSTR, pcchinstancelistlength : UInt32*, dwdetaillevel : PERF_DETAIL, dwflags : UInt32) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : PSTR [In],szobjectname : PSTR [In],mszcounterlist : PSTR [In],pcchcounterlistlength : UInt32* [In],mszinstancelist : PSTR [In],pcchinstancelistlength : UInt32* [In],dwdetaillevel : PERF_DETAIL [In],dwflags : UInt32 [In]
  fun PdhEnumObjectItemsHA(hdatasource : LibC::IntPtrT, szmachinename : PSTR, szobjectname : PSTR, mszcounterlist : PSTR, pcchcounterlistlength : UInt32*, mszinstancelist : PSTR, pcchinstancelistlength : UInt32*, dwdetaillevel : PERF_DETAIL, dwflags : UInt32) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szwildcardpath : LibC::LPWSTR [In],mszexpandedpathlist : LibC::LPWSTR [In],pcchpathlistlength : UInt32* [In],dwflags : UInt32 [In]
  fun PdhExpandWildCardPathHW(hdatasource : LibC::IntPtrT, szwildcardpath : LibC::LPWSTR, mszexpandedpathlist : LibC::LPWSTR, pcchpathlistlength : UInt32*, dwflags : UInt32) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szwildcardpath : PSTR [In],mszexpandedpathlist : PSTR [In],pcchpathlistlength : UInt32* [In],dwflags : UInt32 [In]
  fun PdhExpandWildCardPathHA(hdatasource : LibC::IntPtrT, szwildcardpath : PSTR, mszexpandedpathlist : PSTR, pcchpathlistlength : UInt32*, dwflags : UInt32) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],pdwnumentries : UInt32* [In],pinfo : PDH_TIME_INFO* [In],pdwbuffersize : UInt32* [In]
  fun PdhGetDataSourceTimeRangeH(hdatasource : LibC::IntPtrT, pdwnumentries : UInt32*, pinfo : PDH_TIME_INFO*, pdwbuffersize : UInt32*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : LibC::LPWSTR [In],szdefaultobjectname : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfObjectHW(hdatasource : LibC::IntPtrT, szmachinename : LibC::LPWSTR, szdefaultobjectname : LibC::LPWSTR, pcchbuffersize : UInt32*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : PSTR [In],szdefaultobjectname : PSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfObjectHA(hdatasource : LibC::IntPtrT, szmachinename : PSTR, szdefaultobjectname : PSTR, pcchbuffersize : UInt32*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : LibC::LPWSTR [In],szobjectname : LibC::LPWSTR [In],szdefaultcountername : LibC::LPWSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfCounterHW(hdatasource : LibC::IntPtrT, szmachinename : LibC::LPWSTR, szobjectname : LibC::LPWSTR, szdefaultcountername : LibC::LPWSTR, pcchbuffersize : UInt32*) : Int32

  # Params # hdatasource : LibC::IntPtrT [In],szmachinename : PSTR [In],szobjectname : PSTR [In],szdefaultcountername : PSTR [In],pcchbuffersize : UInt32* [In]
  fun PdhGetDefaultPerfCounterHA(hdatasource : LibC::IntPtrT, szmachinename : PSTR, szobjectname : PSTR, szdefaultcountername : PSTR, pcchbuffersize : UInt32*) : Int32

  # Params # pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_HW* [In]
  fun PdhBrowseCountersHW(pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_HW*) : Int32

  # Params # pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_HA* [In]
  fun PdhBrowseCountersHA(pbrowsedlgdata : PDH_BROWSE_DLG_CONFIG_HA*) : Int32

  # Params # szdatasource : LibC::LPWSTR [In]
  fun PdhVerifySQLDBW(szdatasource : LibC::LPWSTR) : Int32

  # Params # szdatasource : PSTR [In]
  fun PdhVerifySQLDBA(szdatasource : PSTR) : Int32

  # Params # szdatasource : LibC::LPWSTR [In]
  fun PdhCreateSQLTablesW(szdatasource : LibC::LPWSTR) : Int32

  # Params # szdatasource : PSTR [In]
  fun PdhCreateSQLTablesA(szdatasource : PSTR) : Int32

  # Params # szdatasource : LibC::LPWSTR [In],mszdatasetnamelist : LibC::LPWSTR [In],pcchbufferlength : UInt32* [In]
  fun PdhEnumLogSetNamesW(szdatasource : LibC::LPWSTR, mszdatasetnamelist : LibC::LPWSTR, pcchbufferlength : UInt32*) : Int32

  # Params # szdatasource : PSTR [In],mszdatasetnamelist : PSTR [In],pcchbufferlength : UInt32* [In]
  fun PdhEnumLogSetNamesA(szdatasource : PSTR, mszdatasetnamelist : PSTR, pcchbufferlength : UInt32*) : Int32

  # Params # hlog : LibC::IntPtrT [In],pguid : Guid* [In],prunid : Int32* [In]
  fun PdhGetLogSetGUID(hlog : LibC::IntPtrT, pguid : Guid*, prunid : Int32*) : Int32

  # Params # hlog : LibC::IntPtrT [In],runid : Int32 [In]
  fun PdhSetLogSetRunID(hlog : LibC::IntPtrT, runid : Int32) : Int32
end
