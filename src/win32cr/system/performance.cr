require "./../foundation.cr"
require "./com.cr"
require "./ole.cr"

module Win32cr::System::Performance
  extend self
  alias PerfProviderHandle = LibC::IntPtrT
  alias PerfQueryHandle = LibC::IntPtrT
  alias PLA_CABEXTRACT_CALLBACK = Proc(Win32cr::Foundation::PWSTR, Void*, Void)

  alias PERFLIBREQUEST = Proc(UInt32, Void*, UInt32, UInt32)

  alias PERF_MEM_ALLOC = Proc(LibC::UIntPtrT, Void*, Void*)

  alias PERF_MEM_FREE = Proc(Void*, Void*, Void)

  alias PM_OPEN_PROC = Proc(Win32cr::Foundation::PWSTR, UInt32)

  alias PM_COLLECT_PROC = Proc(Win32cr::Foundation::PWSTR, Void**, UInt32*, UInt32*, UInt32)

  alias PM_CLOSE_PROC = Proc(UInt32)

  alias CounterPathCallBack = Proc(LibC::UIntPtrT, Int32)

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
  PERF_WILDCARD_INSTANCE = "*"
  PERF_AGGREGATE_INSTANCE = "_Total"
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

  CLSID_DataCollectorSet = LibC::GUID.new(0x3837521_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_TraceSession = LibC::GUID.new(0x383751c_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_TraceSessionCollection = LibC::GUID.new(0x3837530_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_TraceDataProvider = LibC::GUID.new(0x3837513_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_TraceDataProviderCollection = LibC::GUID.new(0x3837511_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_DataCollectorSetCollection = LibC::GUID.new(0x3837525_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_LegacyDataCollectorSet = LibC::GUID.new(0x3837526_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_LegacyDataCollectorSetCollection = LibC::GUID.new(0x3837527_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_LegacyTraceSession = LibC::GUID.new(0x3837528_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_LegacyTraceSessionCollection = LibC::GUID.new(0x3837529_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_ServerDataCollectorSet = LibC::GUID.new(0x3837531_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_ServerDataCollectorSetCollection = LibC::GUID.new(0x3837532_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_SystemDataCollectorSet = LibC::GUID.new(0x3837546_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_SystemDataCollectorSetCollection = LibC::GUID.new(0x3837547_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_BootTraceSession = LibC::GUID.new(0x3837538_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_BootTraceSessionCollection = LibC::GUID.new(0x3837539_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])

  CLSID_SystemMonitor = LibC::GUID.new(0xc4d2d8e0_u32, 0xd1dd_u16, 0x11ce_u16, StaticArray[0x94_u8, 0xf_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])

  CLSID_CounterItem = LibC::GUID.new(0xc4d2d8e0_u32, 0xd1dd_u16, 0x11ce_u16, StaticArray[0x94_u8, 0xf_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x48_u8])

  CLSID_Counters = LibC::GUID.new(0xb2b066d2_u32, 0x2aac_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2f_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])

  CLSID_LogFileItem = LibC::GUID.new(0x16ec5be8_u32, 0xdf93_u16, 0x4237_u16, StaticArray[0x94_u8, 0xe4_u8, 0x9e_u8, 0xe9_u8, 0x18_u8, 0x11_u8, 0x1d_u8, 0x71_u8])

  CLSID_LogFiles = LibC::GUID.new(0x2735d9fd_u32, 0xf6b9_u16, 0x4f19_u16, StaticArray[0xa5_u8, 0xd9_u8, 0xe2_u8, 0xd0_u8, 0x68_u8, 0x58_u8, 0x4b_u8, 0xc5_u8])

  CLSID_CounterItem2 = LibC::GUID.new(0x43196c62_u32, 0xc31f_u16, 0x4ce3_u16, StaticArray[0xa0_u8, 0x2e_u8, 0x79_u8, 0xef_u8, 0xe0_u8, 0xf6_u8, 0xa5_u8, 0x25_u8])

  CLSID_SystemMonitor2 = LibC::GUID.new(0x7f30578c_u32, 0x5f38_u16, 0x4612_u16, StaticArray[0xac_u8, 0xfe_u8, 0x6e_u8, 0xd0_u8, 0x4c_u8, 0x7b_u8, 0x7a_u8, 0xf8_u8])

  CLSID_AppearPropPage = LibC::GUID.new(0xe49741e9_u32, 0x93a8_u16, 0x4ab1_u16, StaticArray[0x8e_u8, 0x96_u8, 0xbf_u8, 0x44_u8, 0x82_u8, 0x28_u8, 0x2e_u8, 0x9c_u8])

  CLSID_GeneralPropPage = LibC::GUID.new(0xc3e5d3d2_u32, 0x1a03_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2d_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])

  CLSID_GraphPropPage = LibC::GUID.new(0xc3e5d3d3_u32, 0x1a03_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2d_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])

  CLSID_SourcePropPage = LibC::GUID.new(0xcf32aa1_u32, 0x7571_u16, 0x11d0_u16, StaticArray[0x93_u8, 0xc4_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])

  CLSID_CounterPropPage = LibC::GUID.new(0xcf948561_u32, 0xede8_u16, 0x11ce_u16, StaticArray[0x94_u8, 0x1e_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])

  enum PERF_DETAIL : UInt32
    PERF_DETAIL_NOVICE = 100_u32
    PERF_DETAIL_ADVANCED = 200_u32
    PERF_DETAIL_EXPERT = 300_u32
    PERF_DETAIL_WIZARD = 400_u32
  end
  enum REAL_TIME_DATA_SOURCE_ID_FLAGS : UInt32
    DATA_SOURCE_REGISTRY = 1_u32
    DATA_SOURCE_WBEM = 4_u32
  end
  enum PDH_PATH_FLAGS : UInt32
    PDH_PATH_WBEM_RESULT = 1_u32
    PDH_PATH_WBEM_INPUT = 2_u32
    PDH_PATH_WBEM_NONE = 0_u32
  end
  enum PDH_FMT : UInt32
    PDH_FMT_DOUBLE = 512_u32
    PDH_FMT_LARGE = 1024_u32
    PDH_FMT_LONG = 256_u32
  end
  enum PDH_LOG_TYPE : UInt32
    PDH_LOG_TYPE_UNDEFINED = 0_u32
    PDH_LOG_TYPE_CSV = 1_u32
    PDH_LOG_TYPE_SQL = 7_u32
    PDH_LOG_TYPE_TSV = 2_u32
    PDH_LOG_TYPE_BINARY = 8_u32
    PDH_LOG_TYPE_PERFMON = 6_u32
  end
  enum PDH_LOG : UInt32
    PDH_LOG_READ_ACCESS = 65536_u32
    PDH_LOG_WRITE_ACCESS = 131072_u32
    PDH_LOG_UPDATE_ACCESS = 262144_u32
  end
  enum PDH_SELECT_DATA_SOURCE_FLAGS : UInt32
    PDH_FLAGS_FILE_BROWSER_ONLY = 1_u32
    PDH_FLAGS_NONE = 0_u32
  end
  enum PDH_DLL_VERSION : UInt32
    PDH_CVERSION_WIN50 = 1280_u32
    PDH_VERSION = 1283_u32
  end
  enum PERF_COUNTER_AGGREGATE_FUNC : UInt32
    PERF_AGGREGATE_UNDEFINED = 0_u32
    PERF_AGGREGATE_TOTAL = 1_u32
    PERF_AGGREGATE_AVG = 2_u32
    PERF_AGGREGATE_MIN = 3_u32
  end
  enum DataCollectorType
    Plaperformancecounter = 0_i32
    Platrace = 1_i32
    Placonfiguration = 2_i32
    Plaalert = 3_i32
    Plaapitrace = 4_i32
  end
  enum FileFormat
    Placommaseparated = 0_i32
    Platabseparated = 1_i32
    Plasql = 2_i32
    Plabinary = 3_i32
  end
  enum AutoPathFormat
    Planone = 0_i32
    Plapattern = 1_i32
    Placomputer = 2_i32
    Plamonthdayhour = 256_i32
    Plaserialnumber = 512_i32
    Playeardayofyear = 1024_i32
    Playearmonth = 2048_i32
    Playearmonthday = 4096_i32
    Playearmonthdayhour = 8192_i32
    Plamonthdayhourminute = 16384_i32
  end
  enum DataCollectorSetStatus
    Plastopped = 0_i32
    Plarunning = 1_i32
    Placompiling = 2_i32
    Plapending = 3_i32
    Plaundefined = 4_i32
  end
  enum ClockType
    Platimestamp = 0_i32
    Plaperformance = 1_i32
    Plasystem = 2_i32
    Placycle = 3_i32
  end
  enum StreamMode
    Plafile = 1_i32
    Plarealtime = 2_i32
    Plaboth = 3_i32
    Plabuffering = 4_i32
  end
  enum CommitMode
    Placreatenew = 1_i32
    Plamodify = 2_i32
    Placreateormodify = 3_i32
    Plaupdaterunninginstance = 16_i32
    Plaflushtrace = 32_i32
    Plavalidateonly = 4096_i32
  end
  enum ValueMapType
    Plaindex = 1_i32
    Plaflag = 2_i32
    Plaflagarray = 3_i32
    Plavalidation = 4_i32
  end
  enum WeekDays
    Plarunonce = 0_i32
    Plasunday = 1_i32
    Plamonday = 2_i32
    Platuesday = 4_i32
    Plawednesday = 8_i32
    Plathursday = 16_i32
    Plafriday = 32_i32
    Plasaturday = 64_i32
    Plaeveryday = 127_i32
  end
  enum ResourcePolicy
    Pladeletelargest = 0_i32
    Pladeleteoldest = 1_i32
  end
  enum DataManagerSteps
    Placreatereport = 1_i32
    Plarunrules = 2_i32
    Placreatehtml = 4_i32
    Plafolderactions = 8_i32
    Plaresourcefreeing = 16_i32
  end
  enum FolderActionSteps
    Placreatecab = 1_i32
    Pladeletedata = 2_i32
    Plasendcab = 4_i32
    Pladeletecab = 8_i32
    Pladeletereport = 16_i32
  end
  enum PerfRegInfoType
    PERF_REG_COUNTERSET_STRUCT = 1_i32
    PERF_REG_COUNTER_STRUCT = 2_i32
    PERF_REG_COUNTERSET_NAME_STRING = 3_i32
    PERF_REG_COUNTERSET_HELP_STRING = 4_i32
    PERF_REG_COUNTER_NAME_STRINGS = 5_i32
    PERF_REG_COUNTER_HELP_STRINGS = 6_i32
    PERF_REG_PROVIDER_NAME = 7_i32
    PERF_REG_PROVIDER_GUID = 8_i32
    PERF_REG_COUNTERSET_ENGLISH_NAME = 9_i32
    PERF_REG_COUNTER_ENGLISH_NAMES = 10_i32
  end
  enum PerfCounterDataType
    PERF_ERROR_RETURN = 0_i32
    PERF_SINGLE_COUNTER = 1_i32
    PERF_MULTIPLE_COUNTERS = 2_i32
    PERF_MULTIPLE_INSTANCES = 4_i32
    PERF_COUNTERSET = 6_i32
  end
  enum DisplayTypeConstants
    Sysmonlinegraph = 1_i32
    Sysmonhistogram = 2_i32
    Sysmonreport = 3_i32
    Sysmonchartarea = 4_i32
    Sysmonchartstackedarea = 5_i32
  end
  enum ReportValueTypeConstants
    Sysmondefaultvalue = 0_i32
    Sysmoncurrentvalue = 1_i32
    Sysmonaverage = 2_i32
    Sysmonminimum = 3_i32
    Sysmonmaximum = 4_i32
  end
  enum DataSourceTypeConstants
    Sysmonnulldatasource = -1_i32
    Sysmoncurrentactivity = 1_i32
    Sysmonlogfiles = 2_i32
    Sysmonsqllog = 3_i32
  end
  enum SysmonFileType
    Sysmonfilehtml = 1_i32
    Sysmonfilereport = 2_i32
    Sysmonfilecsv = 3_i32
    Sysmonfiletsv = 4_i32
    Sysmonfileblg = 5_i32
    Sysmonfileretiredblg = 6_i32
    Sysmonfilegif = 7_i32
  end
  enum SysmonDataType
    Sysmondataavg = 1_i32
    Sysmondatamin = 2_i32
    Sysmondatamax = 3_i32
    Sysmondatatime = 4_i32
    Sysmondatacount = 5_i32
  end
  enum SysmonBatchReason
    Sysmonbatchnone = 0_i32
    Sysmonbatchaddfiles = 1_i32
    Sysmonbatchaddcounters = 2_i32
    Sysmonbatchaddfilesautocounters = 3_i32
  end

  @[Extern]
  struct PERF_COUNTERSET_INFO
    property counter_set_guid : LibC::GUID
    property provider_guid : LibC::GUID
    property num_counters : UInt32
    property instance_type : UInt32
    def initialize(@counter_set_guid : LibC::GUID, @provider_guid : LibC::GUID, @num_counters : UInt32, @instance_type : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTER_INFO
    property counter_id : UInt32
    property type__ : UInt32
    property attrib : UInt64
    property size : UInt32
    property detail_level : UInt32
    property scale : Int32
    property offset : UInt32
    def initialize(@counter_id : UInt32, @type__ : UInt32, @attrib : UInt64, @size : UInt32, @detail_level : UInt32, @scale : Int32, @offset : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTERSET_INSTANCE
    property counter_set_guid : LibC::GUID
    property dwSize : UInt32
    property instance_id : UInt32
    property instance_name_offset : UInt32
    property instance_name_size : UInt32
    def initialize(@counter_set_guid : LibC::GUID, @dwSize : UInt32, @instance_id : UInt32, @instance_name_offset : UInt32, @instance_name_size : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTER_IDENTITY
    property counter_set_guid : LibC::GUID
    property buffer_size : UInt32
    property counter_id : UInt32
    property instance_id : UInt32
    property machine_offset : UInt32
    property name_offset : UInt32
    property reserved : UInt32
    def initialize(@counter_set_guid : LibC::GUID, @buffer_size : UInt32, @counter_id : UInt32, @instance_id : UInt32, @machine_offset : UInt32, @name_offset : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PERF_PROVIDER_CONTEXT
    property context_size : UInt32
    property reserved : UInt32
    property control_callback : Win32cr::System::Performance::PERFLIBREQUEST
    property mem_alloc_routine : Win32cr::System::Performance::PERF_MEM_ALLOC
    property mem_free_routine : Win32cr::System::Performance::PERF_MEM_FREE
    property pMemContext : Void*
    def initialize(@context_size : UInt32, @reserved : UInt32, @control_callback : Win32cr::System::Performance::PERFLIBREQUEST, @mem_alloc_routine : Win32cr::System::Performance::PERF_MEM_ALLOC, @mem_free_routine : Win32cr::System::Performance::PERF_MEM_FREE, @pMemContext : Void*)
    end
  end

  @[Extern]
  struct PERF_INSTANCE_HEADER
    property size : UInt32
    property instance_id : UInt32
    def initialize(@size : UInt32, @instance_id : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTERSET_REG_INFO
    property counter_set_guid : LibC::GUID
    property counter_set_type : UInt32
    property detail_level : UInt32
    property num_counters : UInt32
    property instance_type : UInt32
    def initialize(@counter_set_guid : LibC::GUID, @counter_set_type : UInt32, @detail_level : UInt32, @num_counters : UInt32, @instance_type : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTER_REG_INFO
    property counter_id : UInt32
    property type__ : UInt32
    property attrib : UInt64
    property detail_level : UInt32
    property default_scale : Int32
    property base_counter_id : UInt32
    property perf_time_id : UInt32
    property perf_freq_id : UInt32
    property multi_id : UInt32
    property aggregate_func : Win32cr::System::Performance::PERF_COUNTER_AGGREGATE_FUNC
    property reserved : UInt32
    def initialize(@counter_id : UInt32, @type__ : UInt32, @attrib : UInt64, @detail_level : UInt32, @default_scale : Int32, @base_counter_id : UInt32, @perf_time_id : UInt32, @perf_freq_id : UInt32, @multi_id : UInt32, @aggregate_func : Win32cr::System::Performance::PERF_COUNTER_AGGREGATE_FUNC, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PERF_STRING_BUFFER_HEADER
    property dwSize : UInt32
    property dwCounters : UInt32
    def initialize(@dwSize : UInt32, @dwCounters : UInt32)
    end
  end

  @[Extern]
  struct PERF_STRING_COUNTER_HEADER
    property dwCounterId : UInt32
    property dwOffset : UInt32
    def initialize(@dwCounterId : UInt32, @dwOffset : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTER_IDENTIFIER
    property counter_set_guid : LibC::GUID
    property status : UInt32
    property size : UInt32
    property counter_id : UInt32
    property instance_id : UInt32
    property index : UInt32
    property reserved : UInt32
    def initialize(@counter_set_guid : LibC::GUID, @status : UInt32, @size : UInt32, @counter_id : UInt32, @instance_id : UInt32, @index : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PERF_DATA_HEADER
    property dwTotalSize : UInt32
    property dwNumCounters : UInt32
    property perf_time_stamp : Int64
    property perf_time100_n_sec : Int64
    property perf_freq : Int64
    property system_time : Win32cr::Foundation::SYSTEMTIME
    def initialize(@dwTotalSize : UInt32, @dwNumCounters : UInt32, @perf_time_stamp : Int64, @perf_time100_n_sec : Int64, @perf_freq : Int64, @system_time : Win32cr::Foundation::SYSTEMTIME)
    end
  end

  @[Extern]
  struct PERF_COUNTER_HEADER
    property dwStatus : UInt32
    property dwType : Win32cr::System::Performance::PerfCounterDataType
    property dwSize : UInt32
    property reserved : UInt32
    def initialize(@dwStatus : UInt32, @dwType : Win32cr::System::Performance::PerfCounterDataType, @dwSize : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct PERF_MULTI_INSTANCES
    property dwTotalSize : UInt32
    property dwInstances : UInt32
    def initialize(@dwTotalSize : UInt32, @dwInstances : UInt32)
    end
  end

  @[Extern]
  struct PERF_MULTI_COUNTERS
    property dwSize : UInt32
    property dwCounters : UInt32
    def initialize(@dwSize : UInt32, @dwCounters : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTER_DATA
    property dwDataSize : UInt32
    property dwSize : UInt32
    def initialize(@dwDataSize : UInt32, @dwSize : UInt32)
    end
  end

  @[Extern]
  struct PERF_DATA_BLOCK
    property signature : UInt16[4]
    property little_endian : UInt32
    property version : UInt32
    property revision : UInt32
    property total_byte_length : UInt32
    property header_length : UInt32
    property num_object_types : UInt32
    property default_object : Int32
    property system_time : Win32cr::Foundation::SYSTEMTIME
    property perf_time : Win32cr::Foundation::LARGE_INTEGER
    property perf_freq : Win32cr::Foundation::LARGE_INTEGER
    property perf_time100n_sec : Win32cr::Foundation::LARGE_INTEGER
    property system_name_length : UInt32
    property system_name_offset : UInt32
    def initialize(@signature : UInt16[4], @little_endian : UInt32, @version : UInt32, @revision : UInt32, @total_byte_length : UInt32, @header_length : UInt32, @num_object_types : UInt32, @default_object : Int32, @system_time : Win32cr::Foundation::SYSTEMTIME, @perf_time : Win32cr::Foundation::LARGE_INTEGER, @perf_freq : Win32cr::Foundation::LARGE_INTEGER, @perf_time100n_sec : Win32cr::Foundation::LARGE_INTEGER, @system_name_length : UInt32, @system_name_offset : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct PERF_OBJECT_TYPE
    property total_byte_length : UInt32
    property definition_length : UInt32
    property header_length : UInt32
    property object_name_title_index : UInt32
    property object_name_title : UInt32
    property object_help_title_index : UInt32
    property object_help_title : UInt32
    property detail_level : UInt32
    property num_counters : UInt32
    property default_counter : Int32
    property num_instances : Int32
    property code_page : UInt32
    property perf_time : Win32cr::Foundation::LARGE_INTEGER
    property perf_freq : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@total_byte_length : UInt32, @definition_length : UInt32, @header_length : UInt32, @object_name_title_index : UInt32, @object_name_title : UInt32, @object_help_title_index : UInt32, @object_help_title : UInt32, @detail_level : UInt32, @num_counters : UInt32, @default_counter : Int32, @num_instances : Int32, @code_page : UInt32, @perf_time : Win32cr::Foundation::LARGE_INTEGER, @perf_freq : Win32cr::Foundation::LARGE_INTEGER)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct PERF_COUNTER_DEFINITION
    property byte_length : UInt32
    property counter_name_title_index : UInt32
    property counter_name_title : UInt32
    property counter_help_title_index : UInt32
    property counter_help_title : UInt32
    property default_scale : Int32
    property detail_level : UInt32
    property counter_type : UInt32
    property counter_size : UInt32
    property counter_offset : UInt32
    def initialize(@byte_length : UInt32, @counter_name_title_index : UInt32, @counter_name_title : UInt32, @counter_help_title_index : UInt32, @counter_help_title : UInt32, @default_scale : Int32, @detail_level : UInt32, @counter_type : UInt32, @counter_size : UInt32, @counter_offset : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct PERF_INSTANCE_DEFINITION
    property byte_length : UInt32
    property parent_object_title_index : UInt32
    property parent_object_instance : UInt32
    property unique_id : Int32
    property name_offset : UInt32
    property name_length : UInt32
    def initialize(@byte_length : UInt32, @parent_object_title_index : UInt32, @parent_object_instance : UInt32, @unique_id : Int32, @name_offset : UInt32, @name_length : UInt32)
    end
  end

  @[Extern]
  struct PERF_COUNTER_BLOCK
    property byte_length : UInt32
    def initialize(@byte_length : UInt32)
    end
  end

  @[Extern]
  struct PDH_RAW_COUNTER
    property c_status : UInt32
    property time_stamp : Win32cr::Foundation::FILETIME
    property first_value : Int64
    property second_value : Int64
    property multi_count : UInt32
    def initialize(@c_status : UInt32, @time_stamp : Win32cr::Foundation::FILETIME, @first_value : Int64, @second_value : Int64, @multi_count : UInt32)
    end
  end

  @[Extern]
  struct PDH_RAW_COUNTER_ITEM_A
    property szName : Win32cr::Foundation::PSTR
    property raw_value : Win32cr::System::Performance::PDH_RAW_COUNTER
    def initialize(@szName : Win32cr::Foundation::PSTR, @raw_value : Win32cr::System::Performance::PDH_RAW_COUNTER)
    end
  end

  @[Extern]
  struct PDH_RAW_COUNTER_ITEM_W
    property szName : Win32cr::Foundation::PWSTR
    property raw_value : Win32cr::System::Performance::PDH_RAW_COUNTER
    def initialize(@szName : Win32cr::Foundation::PWSTR, @raw_value : Win32cr::System::Performance::PDH_RAW_COUNTER)
    end
  end

  @[Extern]
  struct PDH_FMT_COUNTERVALUE
    property c_status : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property longValue : Int32
    property doubleValue : Float64
    property largeValue : Int64
    property ansi_string_value : Win32cr::Foundation::PSTR
    property wide_string_value : Win32cr::Foundation::PWSTR
    def initialize(@longValue : Int32, @doubleValue : Float64, @largeValue : Int64, @ansi_string_value : Win32cr::Foundation::PSTR, @wide_string_value : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@c_status : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PDH_FMT_COUNTERVALUE_ITEM_A
    property szName : Win32cr::Foundation::PSTR
    property fmt_value : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE
    def initialize(@szName : Win32cr::Foundation::PSTR, @fmt_value : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE)
    end
  end

  @[Extern]
  struct PDH_FMT_COUNTERVALUE_ITEM_W
    property szName : Win32cr::Foundation::PWSTR
    property fmt_value : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE
    def initialize(@szName : Win32cr::Foundation::PWSTR, @fmt_value : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE)
    end
  end

  @[Extern]
  struct PDH_STATISTICS
    property dwFormat : UInt32
    property count : UInt32
    property min : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE
    property max : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE
    property mean : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE
    def initialize(@dwFormat : UInt32, @count : UInt32, @min : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE, @max : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE, @mean : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE)
    end
  end

  @[Extern]
  struct PDH_COUNTER_PATH_ELEMENTS_A
    property szMachineName : Win32cr::Foundation::PSTR
    property szObjectName : Win32cr::Foundation::PSTR
    property szInstanceName : Win32cr::Foundation::PSTR
    property szParentInstance : Win32cr::Foundation::PSTR
    property dwInstanceIndex : UInt32
    property szCounterName : Win32cr::Foundation::PSTR
    def initialize(@szMachineName : Win32cr::Foundation::PSTR, @szObjectName : Win32cr::Foundation::PSTR, @szInstanceName : Win32cr::Foundation::PSTR, @szParentInstance : Win32cr::Foundation::PSTR, @dwInstanceIndex : UInt32, @szCounterName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct PDH_COUNTER_PATH_ELEMENTS_W
    property szMachineName : Win32cr::Foundation::PWSTR
    property szObjectName : Win32cr::Foundation::PWSTR
    property szInstanceName : Win32cr::Foundation::PWSTR
    property szParentInstance : Win32cr::Foundation::PWSTR
    property dwInstanceIndex : UInt32
    property szCounterName : Win32cr::Foundation::PWSTR
    def initialize(@szMachineName : Win32cr::Foundation::PWSTR, @szObjectName : Win32cr::Foundation::PWSTR, @szInstanceName : Win32cr::Foundation::PWSTR, @szParentInstance : Win32cr::Foundation::PWSTR, @dwInstanceIndex : UInt32, @szCounterName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PDH_DATA_ITEM_PATH_ELEMENTS_A
    property szMachineName : Win32cr::Foundation::PSTR
    property object_guid : LibC::GUID
    property dwItemId : UInt32
    property szInstanceName : Win32cr::Foundation::PSTR
    def initialize(@szMachineName : Win32cr::Foundation::PSTR, @object_guid : LibC::GUID, @dwItemId : UInt32, @szInstanceName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct PDH_DATA_ITEM_PATH_ELEMENTS_W
    property szMachineName : Win32cr::Foundation::PWSTR
    property object_guid : LibC::GUID
    property dwItemId : UInt32
    property szInstanceName : Win32cr::Foundation::PWSTR
    def initialize(@szMachineName : Win32cr::Foundation::PWSTR, @object_guid : LibC::GUID, @dwItemId : UInt32, @szInstanceName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PDH_COUNTER_INFO_A
    property dwLength : UInt32
    property dwType : UInt32
    property c_version : UInt32
    property c_status : UInt32
    property lScale : Int32
    property lDefaultScale : Int32
    property dwUserData : LibC::UIntPtrT
    property dwQueryUserData : LibC::UIntPtrT
    property szFullPath : Win32cr::Foundation::PSTR
    property anonymous : Anonymous_e__Union_
    property szExplainText : Win32cr::Foundation::PSTR
    property data_buffer : UInt32*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property data_item_path : Win32cr::System::Performance::PDH_DATA_ITEM_PATH_ELEMENTS_A
    property counter_path : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_A
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property szMachineName : Win32cr::Foundation::PSTR
    property szObjectName : Win32cr::Foundation::PSTR
    property szInstanceName : Win32cr::Foundation::PSTR
    property szParentInstance : Win32cr::Foundation::PSTR
    property dwInstanceIndex : UInt32
    property szCounterName : Win32cr::Foundation::PSTR
    def initialize(@szMachineName : Win32cr::Foundation::PSTR, @szObjectName : Win32cr::Foundation::PSTR, @szInstanceName : Win32cr::Foundation::PSTR, @szParentInstance : Win32cr::Foundation::PSTR, @dwInstanceIndex : UInt32, @szCounterName : Win32cr::Foundation::PSTR)
    end
      end

    def initialize(@data_item_path : Win32cr::System::Performance::PDH_DATA_ITEM_PATH_ELEMENTS_A, @counter_path : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_A, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@dwLength : UInt32, @dwType : UInt32, @c_version : UInt32, @c_status : UInt32, @lScale : Int32, @lDefaultScale : Int32, @dwUserData : LibC::UIntPtrT, @dwQueryUserData : LibC::UIntPtrT, @szFullPath : Win32cr::Foundation::PSTR, @anonymous : Anonymous_e__Union_, @szExplainText : Win32cr::Foundation::PSTR, @data_buffer : UInt32*)
    end
  end

  @[Extern]
  struct PDH_COUNTER_INFO_W
    property dwLength : UInt32
    property dwType : UInt32
    property c_version : UInt32
    property c_status : UInt32
    property lScale : Int32
    property lDefaultScale : Int32
    property dwUserData : LibC::UIntPtrT
    property dwQueryUserData : LibC::UIntPtrT
    property szFullPath : Win32cr::Foundation::PWSTR
    property anonymous : Anonymous_e__Union_
    property szExplainText : Win32cr::Foundation::PWSTR
    property data_buffer : UInt32*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property data_item_path : Win32cr::System::Performance::PDH_DATA_ITEM_PATH_ELEMENTS_W
    property counter_path : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_W
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property szMachineName : Win32cr::Foundation::PWSTR
    property szObjectName : Win32cr::Foundation::PWSTR
    property szInstanceName : Win32cr::Foundation::PWSTR
    property szParentInstance : Win32cr::Foundation::PWSTR
    property dwInstanceIndex : UInt32
    property szCounterName : Win32cr::Foundation::PWSTR
    def initialize(@szMachineName : Win32cr::Foundation::PWSTR, @szObjectName : Win32cr::Foundation::PWSTR, @szInstanceName : Win32cr::Foundation::PWSTR, @szParentInstance : Win32cr::Foundation::PWSTR, @dwInstanceIndex : UInt32, @szCounterName : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@data_item_path : Win32cr::System::Performance::PDH_DATA_ITEM_PATH_ELEMENTS_W, @counter_path : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_W, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@dwLength : UInt32, @dwType : UInt32, @c_version : UInt32, @c_status : UInt32, @lScale : Int32, @lDefaultScale : Int32, @dwUserData : LibC::UIntPtrT, @dwQueryUserData : LibC::UIntPtrT, @szFullPath : Win32cr::Foundation::PWSTR, @anonymous : Anonymous_e__Union_, @szExplainText : Win32cr::Foundation::PWSTR, @data_buffer : UInt32*)
    end
  end

  @[Extern]
  struct PDH_TIME_INFO
    property start_time : Int64
    property end_time : Int64
    property sample_count : UInt32
    def initialize(@start_time : Int64, @end_time : Int64, @sample_count : UInt32)
    end
  end

  @[Extern]
  struct PDH_RAW_LOG_RECORD
    property dwStructureSize : UInt32
    property dwRecordType : Win32cr::System::Performance::PDH_LOG_TYPE
    property dwItems : UInt32
    property raw_bytes : UInt8*
    def initialize(@dwStructureSize : UInt32, @dwRecordType : Win32cr::System::Performance::PDH_LOG_TYPE, @dwItems : UInt32, @raw_bytes : UInt8*)
    end
  end

  @[Extern]
  struct PDH_LOG_SERVICE_QUERY_INFO_A
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwLogQuota : UInt32
    property szLogFileCaption : Win32cr::Foundation::PSTR
    property szDefaultDir : Win32cr::Foundation::PSTR
    property szBaseFileName : Win32cr::Foundation::PSTR
    property dwFileType : UInt32
    property dwReserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_

      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property pdl_auto_name_interval : UInt32
    property pdl_auto_name_units : UInt32
    property pdl_command_filename : Win32cr::Foundation::PSTR
    property pdl_counter_list : Win32cr::Foundation::PSTR
    property pdl_auto_name_format : UInt32
    property pdl_sample_interval : UInt32
    property pdl_log_start_time : Win32cr::Foundation::FILETIME
    property pdl_log_end_time : Win32cr::Foundation::FILETIME
    def initialize(@pdl_auto_name_interval : UInt32, @pdl_auto_name_units : UInt32, @pdl_command_filename : Win32cr::Foundation::PSTR, @pdl_counter_list : Win32cr::Foundation::PSTR, @pdl_auto_name_format : UInt32, @pdl_sample_interval : UInt32, @pdl_log_start_time : Win32cr::Foundation::FILETIME, @pdl_log_end_time : Win32cr::Foundation::FILETIME)
    end
      end


      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property tl_number_of_buffers : UInt32
    property tl_minimum_buffers : UInt32
    property tl_maximum_buffers : UInt32
    property tl_free_buffers : UInt32
    property tl_buffer_size : UInt32
    property tl_events_lost : UInt32
    property tl_logger_thread_id : UInt32
    property tl_buffers_written : UInt32
    property tl_log_handle : UInt32
    property tl_log_file_name : Win32cr::Foundation::PSTR
    def initialize(@tl_number_of_buffers : UInt32, @tl_minimum_buffers : UInt32, @tl_maximum_buffers : UInt32, @tl_free_buffers : UInt32, @tl_buffer_size : UInt32, @tl_events_lost : UInt32, @tl_logger_thread_id : UInt32, @tl_buffers_written : UInt32, @tl_log_handle : UInt32, @tl_log_file_name : Win32cr::Foundation::PSTR)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_)
    end
    end

    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwLogQuota : UInt32, @szLogFileCaption : Win32cr::Foundation::PSTR, @szDefaultDir : Win32cr::Foundation::PSTR, @szBaseFileName : Win32cr::Foundation::PSTR, @dwFileType : UInt32, @dwReserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PDH_LOG_SERVICE_QUERY_INFO_W
    property dwSize : UInt32
    property dwFlags : UInt32
    property dwLogQuota : UInt32
    property szLogFileCaption : Win32cr::Foundation::PWSTR
    property szDefaultDir : Win32cr::Foundation::PWSTR
    property szBaseFileName : Win32cr::Foundation::PWSTR
    property dwFileType : UInt32
    property dwReserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_

      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property pdl_auto_name_interval : UInt32
    property pdl_auto_name_units : UInt32
    property pdl_command_filename : Win32cr::Foundation::PWSTR
    property pdl_counter_list : Win32cr::Foundation::PWSTR
    property pdl_auto_name_format : UInt32
    property pdl_sample_interval : UInt32
    property pdl_log_start_time : Win32cr::Foundation::FILETIME
    property pdl_log_end_time : Win32cr::Foundation::FILETIME
    def initialize(@pdl_auto_name_interval : UInt32, @pdl_auto_name_units : UInt32, @pdl_command_filename : Win32cr::Foundation::PWSTR, @pdl_counter_list : Win32cr::Foundation::PWSTR, @pdl_auto_name_format : UInt32, @pdl_sample_interval : UInt32, @pdl_log_start_time : Win32cr::Foundation::FILETIME, @pdl_log_end_time : Win32cr::Foundation::FILETIME)
    end
      end


      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property tl_number_of_buffers : UInt32
    property tl_minimum_buffers : UInt32
    property tl_maximum_buffers : UInt32
    property tl_free_buffers : UInt32
    property tl_buffer_size : UInt32
    property tl_events_lost : UInt32
    property tl_logger_thread_id : UInt32
    property tl_buffers_written : UInt32
    property tl_log_handle : UInt32
    property tl_log_file_name : Win32cr::Foundation::PWSTR
    def initialize(@tl_number_of_buffers : UInt32, @tl_minimum_buffers : UInt32, @tl_maximum_buffers : UInt32, @tl_free_buffers : UInt32, @tl_buffer_size : UInt32, @tl_events_lost : UInt32, @tl_logger_thread_id : UInt32, @tl_buffers_written : UInt32, @tl_log_handle : UInt32, @tl_log_file_name : Win32cr::Foundation::PWSTR)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_)
    end
    end

    def initialize(@dwSize : UInt32, @dwFlags : UInt32, @dwLogQuota : UInt32, @szLogFileCaption : Win32cr::Foundation::PWSTR, @szDefaultDir : Win32cr::Foundation::PWSTR, @szBaseFileName : Win32cr::Foundation::PWSTR, @dwFileType : UInt32, @dwReserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PDH_BROWSE_DLG_CONFIG_HW
    property _bitfield : UInt32
    property hWndOwner : Win32cr::Foundation::HWND
    property hDataSource : LibC::IntPtrT
    property szReturnPathBuffer : Win32cr::Foundation::PWSTR
    property cchReturnPathLength : UInt32
    property pCallBack : Win32cr::System::Performance::CounterPathCallBack
    property dwCallBackArg : LibC::UIntPtrT
    property call_back_status : Int32
    property dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL
    property szDialogBoxCaption : Win32cr::Foundation::PWSTR
    def initialize(@_bitfield : UInt32, @hWndOwner : Win32cr::Foundation::HWND, @hDataSource : LibC::IntPtrT, @szReturnPathBuffer : Win32cr::Foundation::PWSTR, @cchReturnPathLength : UInt32, @pCallBack : Win32cr::System::Performance::CounterPathCallBack, @dwCallBackArg : LibC::UIntPtrT, @call_back_status : Int32, @dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL, @szDialogBoxCaption : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PDH_BROWSE_DLG_CONFIG_HA
    property _bitfield : UInt32
    property hWndOwner : Win32cr::Foundation::HWND
    property hDataSource : LibC::IntPtrT
    property szReturnPathBuffer : Win32cr::Foundation::PSTR
    property cchReturnPathLength : UInt32
    property pCallBack : Win32cr::System::Performance::CounterPathCallBack
    property dwCallBackArg : LibC::UIntPtrT
    property call_back_status : Int32
    property dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL
    property szDialogBoxCaption : Win32cr::Foundation::PSTR
    def initialize(@_bitfield : UInt32, @hWndOwner : Win32cr::Foundation::HWND, @hDataSource : LibC::IntPtrT, @szReturnPathBuffer : Win32cr::Foundation::PSTR, @cchReturnPathLength : UInt32, @pCallBack : Win32cr::System::Performance::CounterPathCallBack, @dwCallBackArg : LibC::UIntPtrT, @call_back_status : Int32, @dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL, @szDialogBoxCaption : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct PDH_BROWSE_DLG_CONFIG_W
    property _bitfield : UInt32
    property hWndOwner : Win32cr::Foundation::HWND
    property szDataSource : Win32cr::Foundation::PWSTR
    property szReturnPathBuffer : Win32cr::Foundation::PWSTR
    property cchReturnPathLength : UInt32
    property pCallBack : Win32cr::System::Performance::CounterPathCallBack
    property dwCallBackArg : LibC::UIntPtrT
    property call_back_status : Int32
    property dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL
    property szDialogBoxCaption : Win32cr::Foundation::PWSTR
    def initialize(@_bitfield : UInt32, @hWndOwner : Win32cr::Foundation::HWND, @szDataSource : Win32cr::Foundation::PWSTR, @szReturnPathBuffer : Win32cr::Foundation::PWSTR, @cchReturnPathLength : UInt32, @pCallBack : Win32cr::System::Performance::CounterPathCallBack, @dwCallBackArg : LibC::UIntPtrT, @call_back_status : Int32, @dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL, @szDialogBoxCaption : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PDH_BROWSE_DLG_CONFIG_A
    property _bitfield : UInt32
    property hWndOwner : Win32cr::Foundation::HWND
    property szDataSource : Win32cr::Foundation::PSTR
    property szReturnPathBuffer : Win32cr::Foundation::PSTR
    property cchReturnPathLength : UInt32
    property pCallBack : Win32cr::System::Performance::CounterPathCallBack
    property dwCallBackArg : LibC::UIntPtrT
    property call_back_status : Int32
    property dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL
    property szDialogBoxCaption : Win32cr::Foundation::PSTR
    def initialize(@_bitfield : UInt32, @hWndOwner : Win32cr::Foundation::HWND, @szDataSource : Win32cr::Foundation::PSTR, @szReturnPathBuffer : Win32cr::Foundation::PSTR, @cchReturnPathLength : UInt32, @pCallBack : Win32cr::System::Performance::CounterPathCallBack, @dwCallBackArg : LibC::UIntPtrT, @call_back_status : Int32, @dwDefaultDetailLevel : Win32cr::System::Performance::PERF_DETAIL, @szDialogBoxCaption : Win32cr::Foundation::PSTR)
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct PERF_OBJECT_TYPE
    property total_byte_length : UInt32
    property definition_length : UInt32
    property header_length : UInt32
    property object_name_title_index : UInt32
    property object_name_title : Win32cr::Foundation::PWSTR
    property object_help_title_index : UInt32
    property object_help_title : Win32cr::Foundation::PWSTR
    property detail_level : UInt32
    property num_counters : UInt32
    property default_counter : Int32
    property num_instances : Int32
    property code_page : UInt32
    property perf_time : Win32cr::Foundation::LARGE_INTEGER
    property perf_freq : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@total_byte_length : UInt32, @definition_length : UInt32, @header_length : UInt32, @object_name_title_index : UInt32, @object_name_title : Win32cr::Foundation::PWSTR, @object_help_title_index : UInt32, @object_help_title : Win32cr::Foundation::PWSTR, @detail_level : UInt32, @num_counters : UInt32, @default_counter : Int32, @num_instances : Int32, @code_page : UInt32, @perf_time : Win32cr::Foundation::LARGE_INTEGER, @perf_freq : Win32cr::Foundation::LARGE_INTEGER)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct PERF_COUNTER_DEFINITION
    property byte_length : UInt32
    property counter_name_title_index : UInt32
    property counter_name_title : Win32cr::Foundation::PWSTR
    property counter_help_title_index : UInt32
    property counter_help_title : Win32cr::Foundation::PWSTR
    property default_scale : Int32
    property detail_level : UInt32
    property counter_type : UInt32
    property counter_size : UInt32
    property counter_offset : UInt32
    def initialize(@byte_length : UInt32, @counter_name_title_index : UInt32, @counter_name_title : Win32cr::Foundation::PWSTR, @counter_help_title_index : UInt32, @counter_help_title : Win32cr::Foundation::PWSTR, @default_scale : Int32, @detail_level : UInt32, @counter_type : UInt32, @counter_size : UInt32, @counter_offset : UInt32)
    end
  end
  {% end %}

  @[Extern]
  record IDataCollectorSetVtbl,
    query_interface : Proc(IDataCollectorSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataCollectorSet*, UInt32),
    release : Proc(IDataCollectorSet*, UInt32),
    get_type_info_count : Proc(IDataCollectorSet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDataCollectorSet*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDataCollectorSet*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDataCollectorSet*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectors : Proc(IDataCollectorSet*, Void**, Win32cr::Foundation::HRESULT),
    get_Duration : Proc(IDataCollectorSet*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Duration : Proc(IDataCollectorSet*, UInt32, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DescriptionUnresolved : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DisplayNameUnresolved : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Keywords : Proc(IDataCollectorSet*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Keywords : Proc(IDataCollectorSet*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RootPath : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RootPath : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Segment : Proc(IDataCollectorSet*, Int16*, Win32cr::Foundation::HRESULT),
    put_Segment : Proc(IDataCollectorSet*, Int16, Win32cr::Foundation::HRESULT),
    get_SegmentMaxDuration : Proc(IDataCollectorSet*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SegmentMaxDuration : Proc(IDataCollectorSet*, UInt32, Win32cr::Foundation::HRESULT),
    get_SegmentMaxSize : Proc(IDataCollectorSet*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SegmentMaxSize : Proc(IDataCollectorSet*, UInt32, Win32cr::Foundation::HRESULT),
    get_SerialNumber : Proc(IDataCollectorSet*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SerialNumber : Proc(IDataCollectorSet*, UInt32, Win32cr::Foundation::HRESULT),
    get_Server : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IDataCollectorSet*, Win32cr::System::Performance::DataCollectorSetStatus*, Win32cr::Foundation::HRESULT),
    get_Subdirectory : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Subdirectory : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SubdirectoryFormat : Proc(IDataCollectorSet*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_SubdirectoryFormat : Proc(IDataCollectorSet*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_SubdirectoryFormatPattern : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SubdirectoryFormatPattern : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Task : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Task : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TaskRunAsSelf : Proc(IDataCollectorSet*, Int16*, Win32cr::Foundation::HRESULT),
    put_TaskRunAsSelf : Proc(IDataCollectorSet*, Int16, Win32cr::Foundation::HRESULT),
    get_TaskArguments : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TaskArguments : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TaskUserTextArguments : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TaskUserTextArguments : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Schedules : Proc(IDataCollectorSet*, Void**, Win32cr::Foundation::HRESULT),
    get_SchedulesEnabled : Proc(IDataCollectorSet*, Int16*, Win32cr::Foundation::HRESULT),
    put_SchedulesEnabled : Proc(IDataCollectorSet*, Int16, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Security : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Security : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StopOnCompletion : Proc(IDataCollectorSet*, Int16*, Win32cr::Foundation::HRESULT),
    put_StopOnCompletion : Proc(IDataCollectorSet*, Int16, Win32cr::Foundation::HRESULT),
    get_DataManager : Proc(IDataCollectorSet*, Void**, Win32cr::Foundation::HRESULT),
    set_credentials : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    query : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    commit : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Performance::CommitMode, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(IDataCollectorSet*, Win32cr::Foundation::HRESULT),
    start : Proc(IDataCollectorSet*, Int16, Win32cr::Foundation::HRESULT),
    stop : Proc(IDataCollectorSet*, Int16, Win32cr::Foundation::HRESULT),
    set_xml : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    set_value : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_value : Proc(IDataCollectorSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDataCollectorSet, lpVtbl : IDataCollectorSetVtbl* do
    GUID = LibC::GUID.new(0x3837520_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IDataCollectorSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataCollectorSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataCollectorSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDataCollectorSet*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDataCollectorSet*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDataCollectorSet*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDataCollectorSet*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectors(this : IDataCollectorSet*, collectors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectors.call(this, collectors)
    end
    def get_Duration(this : IDataCollectorSet*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Duration.call(this, seconds)
    end
    def put_Duration(this : IDataCollectorSet*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Duration.call(this, seconds)
    end
    def get_Description(this : IDataCollectorSet*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IDataCollectorSet*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def get_DescriptionUnresolved(this : IDataCollectorSet*, descr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DescriptionUnresolved.call(this, descr)
    end
    def get_DisplayName(this : IDataCollectorSet*, display_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, display_name)
    end
    def put_DisplayName(this : IDataCollectorSet*, display_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, display_name)
    end
    def get_DisplayNameUnresolved(this : IDataCollectorSet*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayNameUnresolved.call(this, name)
    end
    def get_Keywords(this : IDataCollectorSet*, keywords : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Keywords.call(this, keywords)
    end
    def put_Keywords(this : IDataCollectorSet*, keywords : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Keywords.call(this, keywords)
    end
    def get_LatestOutputLocation(this : IDataCollectorSet*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : IDataCollectorSet*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_Name(this : IDataCollectorSet*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_OutputLocation(this : IDataCollectorSet*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_RootPath(this : IDataCollectorSet*, folder : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RootPath.call(this, folder)
    end
    def put_RootPath(this : IDataCollectorSet*, folder : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RootPath.call(this, folder)
    end
    def get_Segment(this : IDataCollectorSet*, segment : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Segment.call(this, segment)
    end
    def put_Segment(this : IDataCollectorSet*, segment : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Segment.call(this, segment)
    end
    def get_SegmentMaxDuration(this : IDataCollectorSet*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SegmentMaxDuration.call(this, seconds)
    end
    def put_SegmentMaxDuration(this : IDataCollectorSet*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SegmentMaxDuration.call(this, seconds)
    end
    def get_SegmentMaxSize(this : IDataCollectorSet*, size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SegmentMaxSize.call(this, size)
    end
    def put_SegmentMaxSize(this : IDataCollectorSet*, size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SegmentMaxSize.call(this, size)
    end
    def get_SerialNumber(this : IDataCollectorSet*, index : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SerialNumber.call(this, index)
    end
    def put_SerialNumber(this : IDataCollectorSet*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SerialNumber.call(this, index)
    end
    def get_Server(this : IDataCollectorSet*, server : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Server.call(this, server)
    end
    def get_Status(this : IDataCollectorSet*, status : Win32cr::System::Performance::DataCollectorSetStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, status)
    end
    def get_Subdirectory(this : IDataCollectorSet*, folder : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subdirectory.call(this, folder)
    end
    def put_Subdirectory(this : IDataCollectorSet*, folder : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Subdirectory.call(this, folder)
    end
    def get_SubdirectoryFormat(this : IDataCollectorSet*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubdirectoryFormat.call(this, format)
    end
    def put_SubdirectoryFormat(this : IDataCollectorSet*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SubdirectoryFormat.call(this, format)
    end
    def get_SubdirectoryFormatPattern(this : IDataCollectorSet*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubdirectoryFormatPattern.call(this, pattern)
    end
    def put_SubdirectoryFormatPattern(this : IDataCollectorSet*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SubdirectoryFormatPattern.call(this, pattern)
    end
    def get_Task(this : IDataCollectorSet*, task : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Task.call(this, task)
    end
    def put_Task(this : IDataCollectorSet*, task : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Task.call(this, task)
    end
    def get_TaskRunAsSelf(this : IDataCollectorSet*, run_as_self : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TaskRunAsSelf.call(this, run_as_self)
    end
    def put_TaskRunAsSelf(this : IDataCollectorSet*, run_as_self : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TaskRunAsSelf.call(this, run_as_self)
    end
    def get_TaskArguments(this : IDataCollectorSet*, task : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TaskArguments.call(this, task)
    end
    def put_TaskArguments(this : IDataCollectorSet*, task : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TaskArguments.call(this, task)
    end
    def get_TaskUserTextArguments(this : IDataCollectorSet*, user_text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TaskUserTextArguments.call(this, user_text)
    end
    def put_TaskUserTextArguments(this : IDataCollectorSet*, user_text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TaskUserTextArguments.call(this, user_text)
    end
    def get_Schedules(this : IDataCollectorSet*, ppSchedules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Schedules.call(this, ppSchedules)
    end
    def get_SchedulesEnabled(this : IDataCollectorSet*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SchedulesEnabled.call(this, enabled)
    end
    def put_SchedulesEnabled(this : IDataCollectorSet*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SchedulesEnabled.call(this, enabled)
    end
    def get_UserAccount(this : IDataCollectorSet*, user : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, user)
    end
    def get_Xml(this : IDataCollectorSet*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def get_Security(this : IDataCollectorSet*, pbstrSecurity : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, pbstrSecurity)
    end
    def put_Security(this : IDataCollectorSet*, bstrSecurity : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Security.call(this, bstrSecurity)
    end
    def get_StopOnCompletion(this : IDataCollectorSet*, stop : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StopOnCompletion.call(this, stop)
    end
    def put_StopOnCompletion(this : IDataCollectorSet*, stop : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StopOnCompletion.call(this, stop)
    end
    def get_DataManager(this : IDataCollectorSet*, data_manager : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataManager.call(this, data_manager)
    end
    def set_credentials(this : IDataCollectorSet*, user : Win32cr::Foundation::BSTR, password : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_credentials.call(this, user, password)
    end
    def query(this : IDataCollectorSet*, name : Win32cr::Foundation::BSTR, server : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, name, server)
    end
    def commit(this : IDataCollectorSet*, name : Win32cr::Foundation::BSTR, server : Win32cr::Foundation::BSTR, mode : Win32cr::System::Performance::CommitMode, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, name, server, mode, validation)
    end
    def delete(this : IDataCollectorSet*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def start(this : IDataCollectorSet*, synchronous : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, synchronous)
    end
    def stop(this : IDataCollectorSet*, synchronous : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this, synchronous)
    end
    def set_xml(this : IDataCollectorSet*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def set_value(this : IDataCollectorSet*, key : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, key, value)
    end
    def get_value(this : IDataCollectorSet*, key : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, key, value)
    end

  end

  @[Extern]
  record IDataManagerVtbl,
    query_interface : Proc(IDataManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataManager*, UInt32),
    release : Proc(IDataManager*, UInt32),
    get_type_info_count : Proc(IDataManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDataManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDataManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDataManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IDataManager*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IDataManager*, Int16, Win32cr::Foundation::HRESULT),
    get_CheckBeforeRunning : Proc(IDataManager*, Int16*, Win32cr::Foundation::HRESULT),
    put_CheckBeforeRunning : Proc(IDataManager*, Int16, Win32cr::Foundation::HRESULT),
    get_MinFreeDisk : Proc(IDataManager*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MinFreeDisk : Proc(IDataManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_MaxSize : Proc(IDataManager*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MaxSize : Proc(IDataManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_MaxFolderCount : Proc(IDataManager*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MaxFolderCount : Proc(IDataManager*, UInt32, Win32cr::Foundation::HRESULT),
    get_ResourcePolicy : Proc(IDataManager*, Win32cr::System::Performance::ResourcePolicy*, Win32cr::Foundation::HRESULT),
    put_ResourcePolicy : Proc(IDataManager*, Win32cr::System::Performance::ResourcePolicy, Win32cr::Foundation::HRESULT),
    get_FolderActions : Proc(IDataManager*, Void**, Win32cr::Foundation::HRESULT),
    get_ReportSchema : Proc(IDataManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ReportSchema : Proc(IDataManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReportFileName : Proc(IDataManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ReportFileName : Proc(IDataManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RuleTargetFileName : Proc(IDataManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RuleTargetFileName : Proc(IDataManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EventsFileName : Proc(IDataManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EventsFileName : Proc(IDataManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Rules : Proc(IDataManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Rules : Proc(IDataManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    run : Proc(IDataManager*, Win32cr::System::Performance::DataManagerSteps, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    extract : Proc(IDataManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDataManager, lpVtbl : IDataManagerVtbl* do
    GUID = LibC::GUID.new(0x3837541_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IDataManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDataManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDataManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDataManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDataManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Enabled(this : IDataManager*, pfEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pfEnabled)
    end
    def put_Enabled(this : IDataManager*, fEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, fEnabled)
    end
    def get_CheckBeforeRunning(this : IDataManager*, pfCheck : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CheckBeforeRunning.call(this, pfCheck)
    end
    def put_CheckBeforeRunning(this : IDataManager*, fCheck : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CheckBeforeRunning.call(this, fCheck)
    end
    def get_MinFreeDisk(this : IDataManager*, min_free_disk : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinFreeDisk.call(this, min_free_disk)
    end
    def put_MinFreeDisk(this : IDataManager*, min_free_disk : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinFreeDisk.call(this, min_free_disk)
    end
    def get_MaxSize(this : IDataManager*, pulMaxSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxSize.call(this, pulMaxSize)
    end
    def put_MaxSize(this : IDataManager*, ulMaxSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxSize.call(this, ulMaxSize)
    end
    def get_MaxFolderCount(this : IDataManager*, pulMaxFolderCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxFolderCount.call(this, pulMaxFolderCount)
    end
    def put_MaxFolderCount(this : IDataManager*, ulMaxFolderCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxFolderCount.call(this, ulMaxFolderCount)
    end
    def get_ResourcePolicy(this : IDataManager*, pPolicy : Win32cr::System::Performance::ResourcePolicy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResourcePolicy.call(this, pPolicy)
    end
    def put_ResourcePolicy(this : IDataManager*, policy : Win32cr::System::Performance::ResourcePolicy) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ResourcePolicy.call(this, policy)
    end
    def get_FolderActions(this : IDataManager*, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FolderActions.call(this, actions)
    end
    def get_ReportSchema(this : IDataManager*, report_schema : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportSchema.call(this, report_schema)
    end
    def put_ReportSchema(this : IDataManager*, report_schema : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportSchema.call(this, report_schema)
    end
    def get_ReportFileName(this : IDataManager*, pbstrFilename : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportFileName.call(this, pbstrFilename)
    end
    def put_ReportFileName(this : IDataManager*, pbstrFilename : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportFileName.call(this, pbstrFilename)
    end
    def get_RuleTargetFileName(this : IDataManager*, filename : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RuleTargetFileName.call(this, filename)
    end
    def put_RuleTargetFileName(this : IDataManager*, filename : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RuleTargetFileName.call(this, filename)
    end
    def get_EventsFileName(this : IDataManager*, pbstrFilename : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventsFileName.call(this, pbstrFilename)
    end
    def put_EventsFileName(this : IDataManager*, pbstrFilename : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventsFileName.call(this, pbstrFilename)
    end
    def get_Rules(this : IDataManager*, pbstrXml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Rules.call(this, pbstrXml)
    end
    def put_Rules(this : IDataManager*, bstrXml : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Rules.call(this, bstrXml)
    end
    def run(this : IDataManager*, steps : Win32cr::System::Performance::DataManagerSteps, bstrFolder : Win32cr::Foundation::BSTR, errors : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this, steps, bstrFolder, errors)
    end
    def extract(this : IDataManager*, cab_filename : Win32cr::Foundation::BSTR, destination_path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.extract.call(this, cab_filename, destination_path)
    end

  end

  @[Extern]
  record IFolderActionVtbl,
    query_interface : Proc(IFolderAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFolderAction*, UInt32),
    release : Proc(IFolderAction*, UInt32),
    get_type_info_count : Proc(IFolderAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFolderAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFolderAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFolderAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Age : Proc(IFolderAction*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Age : Proc(IFolderAction*, UInt32, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFolderAction*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Size : Proc(IFolderAction*, UInt32, Win32cr::Foundation::HRESULT),
    get_Actions : Proc(IFolderAction*, Win32cr::System::Performance::FolderActionSteps*, Win32cr::Foundation::HRESULT),
    put_Actions : Proc(IFolderAction*, Win32cr::System::Performance::FolderActionSteps, Win32cr::Foundation::HRESULT),
    get_SendCabTo : Proc(IFolderAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SendCabTo : Proc(IFolderAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFolderAction, lpVtbl : IFolderActionVtbl* do
    GUID = LibC::GUID.new(0x3837543_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IFolderAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFolderAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFolderAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFolderAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFolderAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFolderAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFolderAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Age(this : IFolderAction*, pulAge : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Age.call(this, pulAge)
    end
    def put_Age(this : IFolderAction*, ulAge : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Age.call(this, ulAge)
    end
    def get_Size(this : IFolderAction*, pulAge : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, pulAge)
    end
    def put_Size(this : IFolderAction*, ulAge : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Size.call(this, ulAge)
    end
    def get_Actions(this : IFolderAction*, steps : Win32cr::System::Performance::FolderActionSteps*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Actions.call(this, steps)
    end
    def put_Actions(this : IFolderAction*, steps : Win32cr::System::Performance::FolderActionSteps) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Actions.call(this, steps)
    end
    def get_SendCabTo(this : IFolderAction*, pbstrDestination : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SendCabTo.call(this, pbstrDestination)
    end
    def put_SendCabTo(this : IFolderAction*, bstrDestination : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SendCabTo.call(this, bstrDestination)
    end

  end

  @[Extern]
  record IFolderActionCollectionVtbl,
    query_interface : Proc(IFolderActionCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFolderActionCollection*, UInt32),
    release : Proc(IFolderActionCollection*, UInt32),
    get_type_info_count : Proc(IFolderActionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFolderActionCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFolderActionCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFolderActionCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFolderActionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFolderActionCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFolderActionCollection*, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IFolderActionCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IFolderActionCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IFolderActionCollection*, Win32cr::Foundation::HRESULT),
    add_range : Proc(IFolderActionCollection*, Void*, Win32cr::Foundation::HRESULT),
    create_folder_action : Proc(IFolderActionCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFolderActionCollection, lpVtbl : IFolderActionCollectionVtbl* do
    GUID = LibC::GUID.new(0x3837544_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IFolderActionCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFolderActionCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFolderActionCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFolderActionCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFolderActionCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFolderActionCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFolderActionCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IFolderActionCollection*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_Item(this : IFolderActionCollection*, index : Win32cr::System::Com::VARIANT, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, action)
    end
    def get__NewEnum(this : IFolderActionCollection*, enum__ : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, enum__)
    end
    def add(this : IFolderActionCollection*, action : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, action)
    end
    def remove(this : IFolderActionCollection*, index : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end
    def clear(this : IFolderActionCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_range(this : IFolderActionCollection*, actions : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_range.call(this, actions)
    end
    def create_folder_action(this : IFolderActionCollection*, folder_action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_folder_action.call(this, folder_action)
    end

  end

  @[Extern]
  record IDataCollectorVtbl,
    query_interface : Proc(IDataCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataCollector*, UInt32),
    release : Proc(IDataCollector*, UInt32),
    get_type_info_count : Proc(IDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDataCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDataCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDataCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectorSet : Proc(IDataCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_DataCollectorSet : Proc(IDataCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCollectorType : Proc(IDataCollector*, Win32cr::System::Performance::DataCollectorType*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(IDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileName : Proc(IDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FileNameFormat : Proc(IDataCollector*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_FileNameFormat : Proc(IDataCollector*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_FileNameFormatPattern : Proc(IDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNameFormatPattern : Proc(IDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(IDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(IDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogAppend : Proc(IDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogAppend : Proc(IDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogCircular : Proc(IDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogCircular : Proc(IDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOverwrite : Proc(IDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOverwrite : Proc(IDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(IDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Index : Proc(IDataCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_Index : Proc(IDataCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_xml : Proc(IDataCollector*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_output_location : Proc(IDataCollector*, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDataCollector, lpVtbl : IDataCollectorVtbl* do
    GUID = LibC::GUID.new(0x38374ff_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IDataCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDataCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDataCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDataCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDataCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectorSet(this : IDataCollector*, group : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorSet.call(this, group)
    end
    def put_DataCollectorSet(this : IDataCollector*, group : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCollectorSet.call(this, group)
    end
    def get_DataCollectorType(this : IDataCollector*, type__ : Win32cr::System::Performance::DataCollectorType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorType.call(this, type__)
    end
    def get_FileName(this : IDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, name)
    end
    def put_FileName(this : IDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileName.call(this, name)
    end
    def get_FileNameFormat(this : IDataCollector*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormat.call(this, format)
    end
    def put_FileNameFormat(this : IDataCollector*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormat.call(this, format)
    end
    def get_FileNameFormatPattern(this : IDataCollector*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormatPattern.call(this, pattern)
    end
    def put_FileNameFormatPattern(this : IDataCollector*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormatPattern.call(this, pattern)
    end
    def get_LatestOutputLocation(this : IDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : IDataCollector*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_LogAppend(this : IDataCollector*, append : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogAppend.call(this, append)
    end
    def put_LogAppend(this : IDataCollector*, append : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogAppend.call(this, append)
    end
    def get_LogCircular(this : IDataCollector*, circular : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogCircular.call(this, circular)
    end
    def put_LogCircular(this : IDataCollector*, circular : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogCircular.call(this, circular)
    end
    def get_LogOverwrite(this : IDataCollector*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOverwrite.call(this, overwrite)
    end
    def put_LogOverwrite(this : IDataCollector*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOverwrite.call(this, overwrite)
    end
    def get_Name(this : IDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_OutputLocation(this : IDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_Index(this : IDataCollector*, index : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def put_Index(this : IDataCollector*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Index.call(this, index)
    end
    def get_Xml(this : IDataCollector*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def set_xml(this : IDataCollector*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def create_output_location(this : IDataCollector*, latest : Int16, location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_output_location.call(this, latest, location)
    end

  end

  @[Extern]
  record IPerformanceCounterDataCollectorVtbl,
    query_interface : Proc(IPerformanceCounterDataCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPerformanceCounterDataCollector*, UInt32),
    release : Proc(IPerformanceCounterDataCollector*, UInt32),
    get_type_info_count : Proc(IPerformanceCounterDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPerformanceCounterDataCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPerformanceCounterDataCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPerformanceCounterDataCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectorSet : Proc(IPerformanceCounterDataCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_DataCollectorSet : Proc(IPerformanceCounterDataCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCollectorType : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Performance::DataCollectorType*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileName : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FileNameFormat : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_FileNameFormat : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_FileNameFormatPattern : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNameFormatPattern : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogAppend : Proc(IPerformanceCounterDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogAppend : Proc(IPerformanceCounterDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogCircular : Proc(IPerformanceCounterDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogCircular : Proc(IPerformanceCounterDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOverwrite : Proc(IPerformanceCounterDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOverwrite : Proc(IPerformanceCounterDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Index : Proc(IPerformanceCounterDataCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_Index : Proc(IPerformanceCounterDataCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_xml : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_output_location : Proc(IPerformanceCounterDataCollector*, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DataSourceName : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DataSourceName : Proc(IPerformanceCounterDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PerformanceCounters : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_PerformanceCounters : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_LogFileFormat : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Performance::FileFormat*, Win32cr::Foundation::HRESULT),
    put_LogFileFormat : Proc(IPerformanceCounterDataCollector*, Win32cr::System::Performance::FileFormat, Win32cr::Foundation::HRESULT),
    get_SampleInterval : Proc(IPerformanceCounterDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SampleInterval : Proc(IPerformanceCounterDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_SegmentMaxRecords : Proc(IPerformanceCounterDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SegmentMaxRecords : Proc(IPerformanceCounterDataCollector*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPerformanceCounterDataCollector, lpVtbl : IPerformanceCounterDataCollectorVtbl* do
    GUID = LibC::GUID.new(0x3837506_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IPerformanceCounterDataCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPerformanceCounterDataCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPerformanceCounterDataCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPerformanceCounterDataCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPerformanceCounterDataCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPerformanceCounterDataCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPerformanceCounterDataCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectorSet(this : IPerformanceCounterDataCollector*, group : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorSet.call(this, group)
    end
    def put_DataCollectorSet(this : IPerformanceCounterDataCollector*, group : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCollectorSet.call(this, group)
    end
    def get_DataCollectorType(this : IPerformanceCounterDataCollector*, type__ : Win32cr::System::Performance::DataCollectorType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorType.call(this, type__)
    end
    def get_FileName(this : IPerformanceCounterDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, name)
    end
    def put_FileName(this : IPerformanceCounterDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileName.call(this, name)
    end
    def get_FileNameFormat(this : IPerformanceCounterDataCollector*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormat.call(this, format)
    end
    def put_FileNameFormat(this : IPerformanceCounterDataCollector*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormat.call(this, format)
    end
    def get_FileNameFormatPattern(this : IPerformanceCounterDataCollector*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormatPattern.call(this, pattern)
    end
    def put_FileNameFormatPattern(this : IPerformanceCounterDataCollector*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormatPattern.call(this, pattern)
    end
    def get_LatestOutputLocation(this : IPerformanceCounterDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : IPerformanceCounterDataCollector*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_LogAppend(this : IPerformanceCounterDataCollector*, append : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogAppend.call(this, append)
    end
    def put_LogAppend(this : IPerformanceCounterDataCollector*, append : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogAppend.call(this, append)
    end
    def get_LogCircular(this : IPerformanceCounterDataCollector*, circular : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogCircular.call(this, circular)
    end
    def put_LogCircular(this : IPerformanceCounterDataCollector*, circular : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogCircular.call(this, circular)
    end
    def get_LogOverwrite(this : IPerformanceCounterDataCollector*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOverwrite.call(this, overwrite)
    end
    def put_LogOverwrite(this : IPerformanceCounterDataCollector*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOverwrite.call(this, overwrite)
    end
    def get_Name(this : IPerformanceCounterDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IPerformanceCounterDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_OutputLocation(this : IPerformanceCounterDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_Index(this : IPerformanceCounterDataCollector*, index : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def put_Index(this : IPerformanceCounterDataCollector*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Index.call(this, index)
    end
    def get_Xml(this : IPerformanceCounterDataCollector*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def set_xml(this : IPerformanceCounterDataCollector*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def create_output_location(this : IPerformanceCounterDataCollector*, latest : Int16, location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_output_location.call(this, latest, location)
    end
    def get_DataSourceName(this : IPerformanceCounterDataCollector*, dsn : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataSourceName.call(this, dsn)
    end
    def put_DataSourceName(this : IPerformanceCounterDataCollector*, dsn : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataSourceName.call(this, dsn)
    end
    def get_PerformanceCounters(this : IPerformanceCounterDataCollector*, counters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PerformanceCounters.call(this, counters)
    end
    def put_PerformanceCounters(this : IPerformanceCounterDataCollector*, counters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PerformanceCounters.call(this, counters)
    end
    def get_LogFileFormat(this : IPerformanceCounterDataCollector*, format : Win32cr::System::Performance::FileFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFileFormat.call(this, format)
    end
    def put_LogFileFormat(this : IPerformanceCounterDataCollector*, format : Win32cr::System::Performance::FileFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogFileFormat.call(this, format)
    end
    def get_SampleInterval(this : IPerformanceCounterDataCollector*, interval : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SampleInterval.call(this, interval)
    end
    def put_SampleInterval(this : IPerformanceCounterDataCollector*, interval : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SampleInterval.call(this, interval)
    end
    def get_SegmentMaxRecords(this : IPerformanceCounterDataCollector*, records : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SegmentMaxRecords.call(this, records)
    end
    def put_SegmentMaxRecords(this : IPerformanceCounterDataCollector*, records : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SegmentMaxRecords.call(this, records)
    end

  end

  @[Extern]
  record ITraceDataCollectorVtbl,
    query_interface : Proc(ITraceDataCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITraceDataCollector*, UInt32),
    release : Proc(ITraceDataCollector*, UInt32),
    get_type_info_count : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITraceDataCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITraceDataCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITraceDataCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectorSet : Proc(ITraceDataCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_DataCollectorSet : Proc(ITraceDataCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCollectorType : Proc(ITraceDataCollector*, Win32cr::System::Performance::DataCollectorType*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileName : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FileNameFormat : Proc(ITraceDataCollector*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_FileNameFormat : Proc(ITraceDataCollector*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_FileNameFormatPattern : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNameFormatPattern : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogAppend : Proc(ITraceDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogAppend : Proc(ITraceDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogCircular : Proc(ITraceDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogCircular : Proc(ITraceDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOverwrite : Proc(ITraceDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOverwrite : Proc(ITraceDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Index : Proc(ITraceDataCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_Index : Proc(ITraceDataCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_xml : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_output_location : Proc(ITraceDataCollector*, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_BufferSize : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BufferSize : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_BuffersLost : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BuffersLost : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_BuffersWritten : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BuffersWritten : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_ClockType : Proc(ITraceDataCollector*, Win32cr::System::Performance::ClockType*, Win32cr::Foundation::HRESULT),
    put_ClockType : Proc(ITraceDataCollector*, Win32cr::System::Performance::ClockType, Win32cr::Foundation::HRESULT),
    get_EventsLost : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_EventsLost : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_ExtendedModes : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ExtendedModes : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_FlushTimer : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FlushTimer : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_FreeBuffers : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FreeBuffers : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_Guid : Proc(ITraceDataCollector*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    put_Guid : Proc(ITraceDataCollector*, LibC::GUID, Win32cr::Foundation::HRESULT),
    get_IsKernelTrace : Proc(ITraceDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    get_MaximumBuffers : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MaximumBuffers : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_MinimumBuffers : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MinimumBuffers : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_NumberOfBuffers : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_NumberOfBuffers : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_PreallocateFile : Proc(ITraceDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_PreallocateFile : Proc(ITraceDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_ProcessMode : Proc(ITraceDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_ProcessMode : Proc(ITraceDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_RealTimeBuffersLost : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_RealTimeBuffersLost : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_SessionId : Proc(ITraceDataCollector*, UInt64*, Win32cr::Foundation::HRESULT),
    put_SessionId : Proc(ITraceDataCollector*, UInt64, Win32cr::Foundation::HRESULT),
    get_SessionName : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SessionName : Proc(ITraceDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SessionThreadId : Proc(ITraceDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SessionThreadId : Proc(ITraceDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_StreamMode : Proc(ITraceDataCollector*, Win32cr::System::Performance::StreamMode*, Win32cr::Foundation::HRESULT),
    put_StreamMode : Proc(ITraceDataCollector*, Win32cr::System::Performance::StreamMode, Win32cr::Foundation::HRESULT),
    get_TraceDataProviders : Proc(ITraceDataCollector*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITraceDataCollector, lpVtbl : ITraceDataCollectorVtbl* do
    GUID = LibC::GUID.new(0x383750b_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : ITraceDataCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITraceDataCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITraceDataCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITraceDataCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITraceDataCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITraceDataCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITraceDataCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectorSet(this : ITraceDataCollector*, group : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorSet.call(this, group)
    end
    def put_DataCollectorSet(this : ITraceDataCollector*, group : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCollectorSet.call(this, group)
    end
    def get_DataCollectorType(this : ITraceDataCollector*, type__ : Win32cr::System::Performance::DataCollectorType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorType.call(this, type__)
    end
    def get_FileName(this : ITraceDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, name)
    end
    def put_FileName(this : ITraceDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileName.call(this, name)
    end
    def get_FileNameFormat(this : ITraceDataCollector*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormat.call(this, format)
    end
    def put_FileNameFormat(this : ITraceDataCollector*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormat.call(this, format)
    end
    def get_FileNameFormatPattern(this : ITraceDataCollector*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormatPattern.call(this, pattern)
    end
    def put_FileNameFormatPattern(this : ITraceDataCollector*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormatPattern.call(this, pattern)
    end
    def get_LatestOutputLocation(this : ITraceDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : ITraceDataCollector*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_LogAppend(this : ITraceDataCollector*, append : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogAppend.call(this, append)
    end
    def put_LogAppend(this : ITraceDataCollector*, append : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogAppend.call(this, append)
    end
    def get_LogCircular(this : ITraceDataCollector*, circular : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogCircular.call(this, circular)
    end
    def put_LogCircular(this : ITraceDataCollector*, circular : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogCircular.call(this, circular)
    end
    def get_LogOverwrite(this : ITraceDataCollector*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOverwrite.call(this, overwrite)
    end
    def put_LogOverwrite(this : ITraceDataCollector*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOverwrite.call(this, overwrite)
    end
    def get_Name(this : ITraceDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : ITraceDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_OutputLocation(this : ITraceDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_Index(this : ITraceDataCollector*, index : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def put_Index(this : ITraceDataCollector*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Index.call(this, index)
    end
    def get_Xml(this : ITraceDataCollector*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def set_xml(this : ITraceDataCollector*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def create_output_location(this : ITraceDataCollector*, latest : Int16, location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_output_location.call(this, latest, location)
    end
    def get_BufferSize(this : ITraceDataCollector*, size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BufferSize.call(this, size)
    end
    def put_BufferSize(this : ITraceDataCollector*, size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BufferSize.call(this, size)
    end
    def get_BuffersLost(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BuffersLost.call(this, buffers)
    end
    def put_BuffersLost(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BuffersLost.call(this, buffers)
    end
    def get_BuffersWritten(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BuffersWritten.call(this, buffers)
    end
    def put_BuffersWritten(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BuffersWritten.call(this, buffers)
    end
    def get_ClockType(this : ITraceDataCollector*, clock : Win32cr::System::Performance::ClockType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClockType.call(this, clock)
    end
    def put_ClockType(this : ITraceDataCollector*, clock : Win32cr::System::Performance::ClockType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClockType.call(this, clock)
    end
    def get_EventsLost(this : ITraceDataCollector*, events : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventsLost.call(this, events)
    end
    def put_EventsLost(this : ITraceDataCollector*, events : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventsLost.call(this, events)
    end
    def get_ExtendedModes(this : ITraceDataCollector*, mode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedModes.call(this, mode)
    end
    def put_ExtendedModes(this : ITraceDataCollector*, mode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExtendedModes.call(this, mode)
    end
    def get_FlushTimer(this : ITraceDataCollector*, seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FlushTimer.call(this, seconds)
    end
    def put_FlushTimer(this : ITraceDataCollector*, seconds : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FlushTimer.call(this, seconds)
    end
    def get_FreeBuffers(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FreeBuffers.call(this, buffers)
    end
    def put_FreeBuffers(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FreeBuffers.call(this, buffers)
    end
    def get_Guid(this : ITraceDataCollector*, guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Guid.call(this, guid)
    end
    def put_Guid(this : ITraceDataCollector*, guid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Guid.call(this, guid)
    end
    def get_IsKernelTrace(this : ITraceDataCollector*, kernel : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsKernelTrace.call(this, kernel)
    end
    def get_MaximumBuffers(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumBuffers.call(this, buffers)
    end
    def put_MaximumBuffers(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaximumBuffers.call(this, buffers)
    end
    def get_MinimumBuffers(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinimumBuffers.call(this, buffers)
    end
    def put_MinimumBuffers(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinimumBuffers.call(this, buffers)
    end
    def get_NumberOfBuffers(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfBuffers.call(this, buffers)
    end
    def put_NumberOfBuffers(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NumberOfBuffers.call(this, buffers)
    end
    def get_PreallocateFile(this : ITraceDataCollector*, allocate : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PreallocateFile.call(this, allocate)
    end
    def put_PreallocateFile(this : ITraceDataCollector*, allocate : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PreallocateFile.call(this, allocate)
    end
    def get_ProcessMode(this : ITraceDataCollector*, process : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProcessMode.call(this, process)
    end
    def put_ProcessMode(this : ITraceDataCollector*, process : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ProcessMode.call(this, process)
    end
    def get_RealTimeBuffersLost(this : ITraceDataCollector*, buffers : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RealTimeBuffersLost.call(this, buffers)
    end
    def put_RealTimeBuffersLost(this : ITraceDataCollector*, buffers : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RealTimeBuffersLost.call(this, buffers)
    end
    def get_SessionId(this : ITraceDataCollector*, id : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionId.call(this, id)
    end
    def put_SessionId(this : ITraceDataCollector*, id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SessionId.call(this, id)
    end
    def get_SessionName(this : ITraceDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionName.call(this, name)
    end
    def put_SessionName(this : ITraceDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SessionName.call(this, name)
    end
    def get_SessionThreadId(this : ITraceDataCollector*, tid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SessionThreadId.call(this, tid)
    end
    def put_SessionThreadId(this : ITraceDataCollector*, tid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SessionThreadId.call(this, tid)
    end
    def get_StreamMode(this : ITraceDataCollector*, mode : Win32cr::System::Performance::StreamMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StreamMode.call(this, mode)
    end
    def put_StreamMode(this : ITraceDataCollector*, mode : Win32cr::System::Performance::StreamMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StreamMode.call(this, mode)
    end
    def get_TraceDataProviders(this : ITraceDataCollector*, providers : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TraceDataProviders.call(this, providers)
    end

  end

  @[Extern]
  record IConfigurationDataCollectorVtbl,
    query_interface : Proc(IConfigurationDataCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IConfigurationDataCollector*, UInt32),
    release : Proc(IConfigurationDataCollector*, UInt32),
    get_type_info_count : Proc(IConfigurationDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IConfigurationDataCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IConfigurationDataCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IConfigurationDataCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectorSet : Proc(IConfigurationDataCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_DataCollectorSet : Proc(IConfigurationDataCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCollectorType : Proc(IConfigurationDataCollector*, Win32cr::System::Performance::DataCollectorType*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileName : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FileNameFormat : Proc(IConfigurationDataCollector*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_FileNameFormat : Proc(IConfigurationDataCollector*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_FileNameFormatPattern : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNameFormatPattern : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogAppend : Proc(IConfigurationDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogAppend : Proc(IConfigurationDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogCircular : Proc(IConfigurationDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogCircular : Proc(IConfigurationDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOverwrite : Proc(IConfigurationDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOverwrite : Proc(IConfigurationDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Index : Proc(IConfigurationDataCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_Index : Proc(IConfigurationDataCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_xml : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_output_location : Proc(IConfigurationDataCollector*, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FileMaxCount : Proc(IConfigurationDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FileMaxCount : Proc(IConfigurationDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_FileMaxRecursiveDepth : Proc(IConfigurationDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FileMaxRecursiveDepth : Proc(IConfigurationDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_FileMaxTotalSize : Proc(IConfigurationDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FileMaxTotalSize : Proc(IConfigurationDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_Files : Proc(IConfigurationDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Files : Proc(IConfigurationDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_ManagementQueries : Proc(IConfigurationDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ManagementQueries : Proc(IConfigurationDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_QueryNetworkAdapters : Proc(IConfigurationDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_QueryNetworkAdapters : Proc(IConfigurationDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_RegistryKeys : Proc(IConfigurationDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_RegistryKeys : Proc(IConfigurationDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_RegistryMaxRecursiveDepth : Proc(IConfigurationDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_RegistryMaxRecursiveDepth : Proc(IConfigurationDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_SystemStateFile : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SystemStateFile : Proc(IConfigurationDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IConfigurationDataCollector, lpVtbl : IConfigurationDataCollectorVtbl* do
    GUID = LibC::GUID.new(0x3837514_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IConfigurationDataCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IConfigurationDataCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IConfigurationDataCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IConfigurationDataCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IConfigurationDataCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IConfigurationDataCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IConfigurationDataCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectorSet(this : IConfigurationDataCollector*, group : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorSet.call(this, group)
    end
    def put_DataCollectorSet(this : IConfigurationDataCollector*, group : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCollectorSet.call(this, group)
    end
    def get_DataCollectorType(this : IConfigurationDataCollector*, type__ : Win32cr::System::Performance::DataCollectorType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorType.call(this, type__)
    end
    def get_FileName(this : IConfigurationDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, name)
    end
    def put_FileName(this : IConfigurationDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileName.call(this, name)
    end
    def get_FileNameFormat(this : IConfigurationDataCollector*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormat.call(this, format)
    end
    def put_FileNameFormat(this : IConfigurationDataCollector*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormat.call(this, format)
    end
    def get_FileNameFormatPattern(this : IConfigurationDataCollector*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormatPattern.call(this, pattern)
    end
    def put_FileNameFormatPattern(this : IConfigurationDataCollector*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormatPattern.call(this, pattern)
    end
    def get_LatestOutputLocation(this : IConfigurationDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : IConfigurationDataCollector*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_LogAppend(this : IConfigurationDataCollector*, append : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogAppend.call(this, append)
    end
    def put_LogAppend(this : IConfigurationDataCollector*, append : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogAppend.call(this, append)
    end
    def get_LogCircular(this : IConfigurationDataCollector*, circular : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogCircular.call(this, circular)
    end
    def put_LogCircular(this : IConfigurationDataCollector*, circular : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogCircular.call(this, circular)
    end
    def get_LogOverwrite(this : IConfigurationDataCollector*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOverwrite.call(this, overwrite)
    end
    def put_LogOverwrite(this : IConfigurationDataCollector*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOverwrite.call(this, overwrite)
    end
    def get_Name(this : IConfigurationDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IConfigurationDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_OutputLocation(this : IConfigurationDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_Index(this : IConfigurationDataCollector*, index : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def put_Index(this : IConfigurationDataCollector*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Index.call(this, index)
    end
    def get_Xml(this : IConfigurationDataCollector*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def set_xml(this : IConfigurationDataCollector*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def create_output_location(this : IConfigurationDataCollector*, latest : Int16, location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_output_location.call(this, latest, location)
    end
    def get_FileMaxCount(this : IConfigurationDataCollector*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileMaxCount.call(this, count)
    end
    def put_FileMaxCount(this : IConfigurationDataCollector*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileMaxCount.call(this, count)
    end
    def get_FileMaxRecursiveDepth(this : IConfigurationDataCollector*, depth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileMaxRecursiveDepth.call(this, depth)
    end
    def put_FileMaxRecursiveDepth(this : IConfigurationDataCollector*, depth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileMaxRecursiveDepth.call(this, depth)
    end
    def get_FileMaxTotalSize(this : IConfigurationDataCollector*, size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileMaxTotalSize.call(this, size)
    end
    def put_FileMaxTotalSize(this : IConfigurationDataCollector*, size : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileMaxTotalSize.call(this, size)
    end
    def get_Files(this : IConfigurationDataCollector*, files : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Files.call(this, files)
    end
    def put_Files(this : IConfigurationDataCollector*, files : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Files.call(this, files)
    end
    def get_ManagementQueries(this : IConfigurationDataCollector*, queries : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ManagementQueries.call(this, queries)
    end
    def put_ManagementQueries(this : IConfigurationDataCollector*, queries : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ManagementQueries.call(this, queries)
    end
    def get_QueryNetworkAdapters(this : IConfigurationDataCollector*, network : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueryNetworkAdapters.call(this, network)
    end
    def put_QueryNetworkAdapters(this : IConfigurationDataCollector*, network : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QueryNetworkAdapters.call(this, network)
    end
    def get_RegistryKeys(this : IConfigurationDataCollector*, query : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegistryKeys.call(this, query)
    end
    def put_RegistryKeys(this : IConfigurationDataCollector*, query : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RegistryKeys.call(this, query)
    end
    def get_RegistryMaxRecursiveDepth(this : IConfigurationDataCollector*, depth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegistryMaxRecursiveDepth.call(this, depth)
    end
    def put_RegistryMaxRecursiveDepth(this : IConfigurationDataCollector*, depth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RegistryMaxRecursiveDepth.call(this, depth)
    end
    def get_SystemStateFile(this : IConfigurationDataCollector*, file_name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SystemStateFile.call(this, file_name)
    end
    def put_SystemStateFile(this : IConfigurationDataCollector*, file_name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SystemStateFile.call(this, file_name)
    end

  end

  @[Extern]
  record IAlertDataCollectorVtbl,
    query_interface : Proc(IAlertDataCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAlertDataCollector*, UInt32),
    release : Proc(IAlertDataCollector*, UInt32),
    get_type_info_count : Proc(IAlertDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAlertDataCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAlertDataCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAlertDataCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectorSet : Proc(IAlertDataCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_DataCollectorSet : Proc(IAlertDataCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCollectorType : Proc(IAlertDataCollector*, Win32cr::System::Performance::DataCollectorType*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileName : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FileNameFormat : Proc(IAlertDataCollector*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_FileNameFormat : Proc(IAlertDataCollector*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_FileNameFormatPattern : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNameFormatPattern : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogAppend : Proc(IAlertDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogAppend : Proc(IAlertDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogCircular : Proc(IAlertDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogCircular : Proc(IAlertDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOverwrite : Proc(IAlertDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOverwrite : Proc(IAlertDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Index : Proc(IAlertDataCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_Index : Proc(IAlertDataCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_xml : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_output_location : Proc(IAlertDataCollector*, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AlertThresholds : Proc(IAlertDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_AlertThresholds : Proc(IAlertDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_EventLog : Proc(IAlertDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_EventLog : Proc(IAlertDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_SampleInterval : Proc(IAlertDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    put_SampleInterval : Proc(IAlertDataCollector*, UInt32, Win32cr::Foundation::HRESULT),
    get_Task : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Task : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TaskRunAsSelf : Proc(IAlertDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_TaskRunAsSelf : Proc(IAlertDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_TaskArguments : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TaskArguments : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TaskUserTextArguments : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TaskUserTextArguments : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TriggerDataCollectorSet : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TriggerDataCollectorSet : Proc(IAlertDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAlertDataCollector, lpVtbl : IAlertDataCollectorVtbl* do
    GUID = LibC::GUID.new(0x3837516_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IAlertDataCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAlertDataCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAlertDataCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAlertDataCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAlertDataCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAlertDataCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAlertDataCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectorSet(this : IAlertDataCollector*, group : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorSet.call(this, group)
    end
    def put_DataCollectorSet(this : IAlertDataCollector*, group : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCollectorSet.call(this, group)
    end
    def get_DataCollectorType(this : IAlertDataCollector*, type__ : Win32cr::System::Performance::DataCollectorType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorType.call(this, type__)
    end
    def get_FileName(this : IAlertDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, name)
    end
    def put_FileName(this : IAlertDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileName.call(this, name)
    end
    def get_FileNameFormat(this : IAlertDataCollector*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormat.call(this, format)
    end
    def put_FileNameFormat(this : IAlertDataCollector*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormat.call(this, format)
    end
    def get_FileNameFormatPattern(this : IAlertDataCollector*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormatPattern.call(this, pattern)
    end
    def put_FileNameFormatPattern(this : IAlertDataCollector*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormatPattern.call(this, pattern)
    end
    def get_LatestOutputLocation(this : IAlertDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : IAlertDataCollector*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_LogAppend(this : IAlertDataCollector*, append : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogAppend.call(this, append)
    end
    def put_LogAppend(this : IAlertDataCollector*, append : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogAppend.call(this, append)
    end
    def get_LogCircular(this : IAlertDataCollector*, circular : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogCircular.call(this, circular)
    end
    def put_LogCircular(this : IAlertDataCollector*, circular : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogCircular.call(this, circular)
    end
    def get_LogOverwrite(this : IAlertDataCollector*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOverwrite.call(this, overwrite)
    end
    def put_LogOverwrite(this : IAlertDataCollector*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOverwrite.call(this, overwrite)
    end
    def get_Name(this : IAlertDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IAlertDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_OutputLocation(this : IAlertDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_Index(this : IAlertDataCollector*, index : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def put_Index(this : IAlertDataCollector*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Index.call(this, index)
    end
    def get_Xml(this : IAlertDataCollector*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def set_xml(this : IAlertDataCollector*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def create_output_location(this : IAlertDataCollector*, latest : Int16, location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_output_location.call(this, latest, location)
    end
    def get_AlertThresholds(this : IAlertDataCollector*, alerts : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AlertThresholds.call(this, alerts)
    end
    def put_AlertThresholds(this : IAlertDataCollector*, alerts : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AlertThresholds.call(this, alerts)
    end
    def get_EventLog(this : IAlertDataCollector*, log : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventLog.call(this, log)
    end
    def put_EventLog(this : IAlertDataCollector*, log : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventLog.call(this, log)
    end
    def get_SampleInterval(this : IAlertDataCollector*, interval : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SampleInterval.call(this, interval)
    end
    def put_SampleInterval(this : IAlertDataCollector*, interval : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SampleInterval.call(this, interval)
    end
    def get_Task(this : IAlertDataCollector*, task : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Task.call(this, task)
    end
    def put_Task(this : IAlertDataCollector*, task : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Task.call(this, task)
    end
    def get_TaskRunAsSelf(this : IAlertDataCollector*, run_as_self : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TaskRunAsSelf.call(this, run_as_self)
    end
    def put_TaskRunAsSelf(this : IAlertDataCollector*, run_as_self : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TaskRunAsSelf.call(this, run_as_self)
    end
    def get_TaskArguments(this : IAlertDataCollector*, task : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TaskArguments.call(this, task)
    end
    def put_TaskArguments(this : IAlertDataCollector*, task : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TaskArguments.call(this, task)
    end
    def get_TaskUserTextArguments(this : IAlertDataCollector*, task : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TaskUserTextArguments.call(this, task)
    end
    def put_TaskUserTextArguments(this : IAlertDataCollector*, task : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TaskUserTextArguments.call(this, task)
    end
    def get_TriggerDataCollectorSet(this : IAlertDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TriggerDataCollectorSet.call(this, name)
    end
    def put_TriggerDataCollectorSet(this : IAlertDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TriggerDataCollectorSet.call(this, name)
    end

  end

  @[Extern]
  record IApiTracingDataCollectorVtbl,
    query_interface : Proc(IApiTracingDataCollector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IApiTracingDataCollector*, UInt32),
    release : Proc(IApiTracingDataCollector*, UInt32),
    get_type_info_count : Proc(IApiTracingDataCollector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IApiTracingDataCollector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IApiTracingDataCollector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IApiTracingDataCollector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DataCollectorSet : Proc(IApiTracingDataCollector*, Void**, Win32cr::Foundation::HRESULT),
    put_DataCollectorSet : Proc(IApiTracingDataCollector*, Void*, Win32cr::Foundation::HRESULT),
    get_DataCollectorType : Proc(IApiTracingDataCollector*, Win32cr::System::Performance::DataCollectorType*, Win32cr::Foundation::HRESULT),
    get_FileName : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileName : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FileNameFormat : Proc(IApiTracingDataCollector*, Win32cr::System::Performance::AutoPathFormat*, Win32cr::Foundation::HRESULT),
    put_FileNameFormat : Proc(IApiTracingDataCollector*, Win32cr::System::Performance::AutoPathFormat, Win32cr::Foundation::HRESULT),
    get_FileNameFormatPattern : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNameFormatPattern : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LatestOutputLocation : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LatestOutputLocation : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogAppend : Proc(IApiTracingDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogAppend : Proc(IApiTracingDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogCircular : Proc(IApiTracingDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogCircular : Proc(IApiTracingDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOverwrite : Proc(IApiTracingDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOverwrite : Proc(IApiTracingDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OutputLocation : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Index : Proc(IApiTracingDataCollector*, Int32*, Win32cr::Foundation::HRESULT),
    put_Index : Proc(IApiTracingDataCollector*, Int32, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_xml : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_output_location : Proc(IApiTracingDataCollector*, Int16, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LogApiNamesOnly : Proc(IApiTracingDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogApiNamesOnly : Proc(IApiTracingDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_LogApisRecursively : Proc(IApiTracingDataCollector*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogApisRecursively : Proc(IApiTracingDataCollector*, Int16, Win32cr::Foundation::HRESULT),
    get_ExePath : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExePath : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogFilePath : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LogFilePath : Proc(IApiTracingDataCollector*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IncludeModules : Proc(IApiTracingDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_IncludeModules : Proc(IApiTracingDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_IncludeApis : Proc(IApiTracingDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_IncludeApis : Proc(IApiTracingDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_ExcludeApis : Proc(IApiTracingDataCollector*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ExcludeApis : Proc(IApiTracingDataCollector*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IApiTracingDataCollector, lpVtbl : IApiTracingDataCollectorVtbl* do
    GUID = LibC::GUID.new(0x383751a_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IApiTracingDataCollector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IApiTracingDataCollector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IApiTracingDataCollector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IApiTracingDataCollector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IApiTracingDataCollector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IApiTracingDataCollector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IApiTracingDataCollector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DataCollectorSet(this : IApiTracingDataCollector*, group : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorSet.call(this, group)
    end
    def put_DataCollectorSet(this : IApiTracingDataCollector*, group : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataCollectorSet.call(this, group)
    end
    def get_DataCollectorType(this : IApiTracingDataCollector*, type__ : Win32cr::System::Performance::DataCollectorType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataCollectorType.call(this, type__)
    end
    def get_FileName(this : IApiTracingDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileName.call(this, name)
    end
    def put_FileName(this : IApiTracingDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileName.call(this, name)
    end
    def get_FileNameFormat(this : IApiTracingDataCollector*, format : Win32cr::System::Performance::AutoPathFormat*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormat.call(this, format)
    end
    def put_FileNameFormat(this : IApiTracingDataCollector*, format : Win32cr::System::Performance::AutoPathFormat) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormat.call(this, format)
    end
    def get_FileNameFormatPattern(this : IApiTracingDataCollector*, pattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNameFormatPattern.call(this, pattern)
    end
    def put_FileNameFormatPattern(this : IApiTracingDataCollector*, pattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNameFormatPattern.call(this, pattern)
    end
    def get_LatestOutputLocation(this : IApiTracingDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LatestOutputLocation.call(this, path)
    end
    def put_LatestOutputLocation(this : IApiTracingDataCollector*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LatestOutputLocation.call(this, path)
    end
    def get_LogAppend(this : IApiTracingDataCollector*, append : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogAppend.call(this, append)
    end
    def put_LogAppend(this : IApiTracingDataCollector*, append : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogAppend.call(this, append)
    end
    def get_LogCircular(this : IApiTracingDataCollector*, circular : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogCircular.call(this, circular)
    end
    def put_LogCircular(this : IApiTracingDataCollector*, circular : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogCircular.call(this, circular)
    end
    def get_LogOverwrite(this : IApiTracingDataCollector*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOverwrite.call(this, overwrite)
    end
    def put_LogOverwrite(this : IApiTracingDataCollector*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOverwrite.call(this, overwrite)
    end
    def get_Name(this : IApiTracingDataCollector*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IApiTracingDataCollector*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_OutputLocation(this : IApiTracingDataCollector*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutputLocation.call(this, path)
    end
    def get_Index(this : IApiTracingDataCollector*, index : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Index.call(this, index)
    end
    def put_Index(this : IApiTracingDataCollector*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Index.call(this, index)
    end
    def get_Xml(this : IApiTracingDataCollector*, xml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, xml)
    end
    def set_xml(this : IApiTracingDataCollector*, xml : Win32cr::Foundation::BSTR, validation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_xml.call(this, xml, validation)
    end
    def create_output_location(this : IApiTracingDataCollector*, latest : Int16, location : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_output_location.call(this, latest, location)
    end
    def get_LogApiNamesOnly(this : IApiTracingDataCollector*, logapinames : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogApiNamesOnly.call(this, logapinames)
    end
    def put_LogApiNamesOnly(this : IApiTracingDataCollector*, logapinames : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogApiNamesOnly.call(this, logapinames)
    end
    def get_LogApisRecursively(this : IApiTracingDataCollector*, logrecursively : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogApisRecursively.call(this, logrecursively)
    end
    def put_LogApisRecursively(this : IApiTracingDataCollector*, logrecursively : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogApisRecursively.call(this, logrecursively)
    end
    def get_ExePath(this : IApiTracingDataCollector*, exepath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExePath.call(this, exepath)
    end
    def put_ExePath(this : IApiTracingDataCollector*, exepath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExePath.call(this, exepath)
    end
    def get_LogFilePath(this : IApiTracingDataCollector*, logfilepath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFilePath.call(this, logfilepath)
    end
    def put_LogFilePath(this : IApiTracingDataCollector*, logfilepath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogFilePath.call(this, logfilepath)
    end
    def get_IncludeModules(this : IApiTracingDataCollector*, includemodules : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludeModules.call(this, includemodules)
    end
    def put_IncludeModules(this : IApiTracingDataCollector*, includemodules : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludeModules.call(this, includemodules)
    end
    def get_IncludeApis(this : IApiTracingDataCollector*, includeapis : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludeApis.call(this, includeapis)
    end
    def put_IncludeApis(this : IApiTracingDataCollector*, includeapis : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludeApis.call(this, includeapis)
    end
    def get_ExcludeApis(this : IApiTracingDataCollector*, excludeapis : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExcludeApis.call(this, excludeapis)
    end
    def put_ExcludeApis(this : IApiTracingDataCollector*, excludeapis : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExcludeApis.call(this, excludeapis)
    end

  end

  @[Extern]
  record IDataCollectorCollectionVtbl,
    query_interface : Proc(IDataCollectorCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataCollectorCollection*, UInt32),
    release : Proc(IDataCollectorCollection*, UInt32),
    get_type_info_count : Proc(IDataCollectorCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDataCollectorCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDataCollectorCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDataCollectorCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IDataCollectorCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IDataCollectorCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IDataCollectorCollection*, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IDataCollectorCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IDataCollectorCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IDataCollectorCollection*, Win32cr::Foundation::HRESULT),
    add_range : Proc(IDataCollectorCollection*, Void*, Win32cr::Foundation::HRESULT),
    create_data_collector_from_xml : Proc(IDataCollectorCollection*, Win32cr::Foundation::BSTR, Void**, Void**, Win32cr::Foundation::HRESULT),
    create_data_collector : Proc(IDataCollectorCollection*, Win32cr::System::Performance::DataCollectorType, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDataCollectorCollection, lpVtbl : IDataCollectorCollectionVtbl* do
    GUID = LibC::GUID.new(0x3837502_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IDataCollectorCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataCollectorCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataCollectorCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDataCollectorCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDataCollectorCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDataCollectorCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDataCollectorCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IDataCollectorCollection*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retVal)
    end
    def get_Item(this : IDataCollectorCollection*, index : Win32cr::System::Com::VARIANT, collector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, collector)
    end
    def get__NewEnum(this : IDataCollectorCollection*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retVal)
    end
    def add(this : IDataCollectorCollection*, collector : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, collector)
    end
    def remove(this : IDataCollectorCollection*, collector : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, collector)
    end
    def clear(this : IDataCollectorCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_range(this : IDataCollectorCollection*, collectors : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_range.call(this, collectors)
    end
    def create_data_collector_from_xml(this : IDataCollectorCollection*, bstrXml : Win32cr::Foundation::BSTR, pValidation : Void**, pCollector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_data_collector_from_xml.call(this, bstrXml, pValidation, pCollector)
    end
    def create_data_collector(this : IDataCollectorCollection*, type__ : Win32cr::System::Performance::DataCollectorType, collector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_data_collector.call(this, type__, collector)
    end

  end

  @[Extern]
  record IDataCollectorSetCollectionVtbl,
    query_interface : Proc(IDataCollectorSetCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDataCollectorSetCollection*, UInt32),
    release : Proc(IDataCollectorSetCollection*, UInt32),
    get_type_info_count : Proc(IDataCollectorSetCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDataCollectorSetCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDataCollectorSetCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDataCollectorSetCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IDataCollectorSetCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IDataCollectorSetCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IDataCollectorSetCollection*, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IDataCollectorSetCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IDataCollectorSetCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IDataCollectorSetCollection*, Win32cr::Foundation::HRESULT),
    add_range : Proc(IDataCollectorSetCollection*, Void*, Win32cr::Foundation::HRESULT),
    get_data_collector_sets : Proc(IDataCollectorSetCollection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDataCollectorSetCollection, lpVtbl : IDataCollectorSetCollectionVtbl* do
    GUID = LibC::GUID.new(0x3837524_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IDataCollectorSetCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDataCollectorSetCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDataCollectorSetCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDataCollectorSetCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDataCollectorSetCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDataCollectorSetCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDataCollectorSetCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IDataCollectorSetCollection*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retVal)
    end
    def get_Item(this : IDataCollectorSetCollection*, index : Win32cr::System::Com::VARIANT, set : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, set)
    end
    def get__NewEnum(this : IDataCollectorSetCollection*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retVal)
    end
    def add(this : IDataCollectorSetCollection*, set : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, set)
    end
    def remove(this : IDataCollectorSetCollection*, set : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, set)
    end
    def clear(this : IDataCollectorSetCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_range(this : IDataCollectorSetCollection*, sets : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_range.call(this, sets)
    end
    def get_data_collector_sets(this : IDataCollectorSetCollection*, server : Win32cr::Foundation::BSTR, filter : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_collector_sets.call(this, server, filter)
    end

  end

  @[Extern]
  record ITraceDataProviderVtbl,
    query_interface : Proc(ITraceDataProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITraceDataProvider*, UInt32),
    release : Proc(ITraceDataProvider*, UInt32),
    get_type_info_count : Proc(ITraceDataProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITraceDataProvider*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITraceDataProvider*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITraceDataProvider*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(ITraceDataProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(ITraceDataProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Guid : Proc(ITraceDataProvider*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    put_Guid : Proc(ITraceDataProvider*, LibC::GUID, Win32cr::Foundation::HRESULT),
    get_Level : Proc(ITraceDataProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_KeywordsAny : Proc(ITraceDataProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_KeywordsAll : Proc(ITraceDataProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(ITraceDataProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_FilterEnabled : Proc(ITraceDataProvider*, Int16*, Win32cr::Foundation::HRESULT),
    put_FilterEnabled : Proc(ITraceDataProvider*, Int16, Win32cr::Foundation::HRESULT),
    get_FilterType : Proc(ITraceDataProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FilterType : Proc(ITraceDataProvider*, UInt32, Win32cr::Foundation::HRESULT),
    get_FilterData : Proc(ITraceDataProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_FilterData : Proc(ITraceDataProvider*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    query : Proc(ITraceDataProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    resolve : Proc(ITraceDataProvider*, Void*, Win32cr::Foundation::HRESULT),
    set_security : Proc(ITraceDataProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_security : Proc(ITraceDataProvider*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_registered_processes : Proc(ITraceDataProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITraceDataProvider, lpVtbl : ITraceDataProviderVtbl* do
    GUID = LibC::GUID.new(0x3837512_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : ITraceDataProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITraceDataProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITraceDataProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITraceDataProvider*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITraceDataProvider*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITraceDataProvider*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITraceDataProvider*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisplayName(this : ITraceDataProvider*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, name)
    end
    def put_DisplayName(this : ITraceDataProvider*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, name)
    end
    def get_Guid(this : ITraceDataProvider*, guid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Guid.call(this, guid)
    end
    def put_Guid(this : ITraceDataProvider*, guid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Guid.call(this, guid)
    end
    def get_Level(this : ITraceDataProvider*, ppLevel : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Level.call(this, ppLevel)
    end
    def get_KeywordsAny(this : ITraceDataProvider*, ppKeywords : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KeywordsAny.call(this, ppKeywords)
    end
    def get_KeywordsAll(this : ITraceDataProvider*, ppKeywords : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KeywordsAll.call(this, ppKeywords)
    end
    def get_Properties(this : ITraceDataProvider*, ppProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, ppProperties)
    end
    def get_FilterEnabled(this : ITraceDataProvider*, filter_enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FilterEnabled.call(this, filter_enabled)
    end
    def put_FilterEnabled(this : ITraceDataProvider*, filter_enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FilterEnabled.call(this, filter_enabled)
    end
    def get_FilterType(this : ITraceDataProvider*, pulType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FilterType.call(this, pulType)
    end
    def put_FilterType(this : ITraceDataProvider*, ulType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FilterType.call(this, ulType)
    end
    def get_FilterData(this : ITraceDataProvider*, ppData : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FilterData.call(this, ppData)
    end
    def put_FilterData(this : ITraceDataProvider*, pData : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FilterData.call(this, pData)
    end
    def query(this : ITraceDataProvider*, bstrName : Win32cr::Foundation::BSTR, bstrServer : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, bstrName, bstrServer)
    end
    def resolve(this : ITraceDataProvider*, pFrom : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resolve.call(this, pFrom)
    end
    def set_security(this : ITraceDataProvider*, sddl : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security.call(this, sddl)
    end
    def get_security(this : ITraceDataProvider*, security_info : UInt32, sddl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security.call(this, security_info, sddl)
    end
    def get_registered_processes(this : ITraceDataProvider*, processes : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_registered_processes.call(this, processes)
    end

  end

  @[Extern]
  record ITraceDataProviderCollectionVtbl,
    query_interface : Proc(ITraceDataProviderCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITraceDataProviderCollection*, UInt32),
    release : Proc(ITraceDataProviderCollection*, UInt32),
    get_type_info_count : Proc(ITraceDataProviderCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITraceDataProviderCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITraceDataProviderCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITraceDataProviderCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ITraceDataProviderCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ITraceDataProviderCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ITraceDataProviderCollection*, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(ITraceDataProviderCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(ITraceDataProviderCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(ITraceDataProviderCollection*, Win32cr::Foundation::HRESULT),
    add_range : Proc(ITraceDataProviderCollection*, Void*, Win32cr::Foundation::HRESULT),
    create_trace_data_provider : Proc(ITraceDataProviderCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_trace_data_providers : Proc(ITraceDataProviderCollection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_trace_data_providers_by_process : Proc(ITraceDataProviderCollection*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITraceDataProviderCollection, lpVtbl : ITraceDataProviderCollectionVtbl* do
    GUID = LibC::GUID.new(0x3837510_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : ITraceDataProviderCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITraceDataProviderCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITraceDataProviderCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITraceDataProviderCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITraceDataProviderCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITraceDataProviderCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITraceDataProviderCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ITraceDataProviderCollection*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retVal)
    end
    def get_Item(this : ITraceDataProviderCollection*, index : Win32cr::System::Com::VARIANT, ppProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppProvider)
    end
    def get__NewEnum(this : ITraceDataProviderCollection*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retVal)
    end
    def add(this : ITraceDataProviderCollection*, pProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pProvider)
    end
    def remove(this : ITraceDataProviderCollection*, vProvider : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, vProvider)
    end
    def clear(this : ITraceDataProviderCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_range(this : ITraceDataProviderCollection*, providers : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_range.call(this, providers)
    end
    def create_trace_data_provider(this : ITraceDataProviderCollection*, provider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_trace_data_provider.call(this, provider)
    end
    def get_trace_data_providers(this : ITraceDataProviderCollection*, server : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trace_data_providers.call(this, server)
    end
    def get_trace_data_providers_by_process(this : ITraceDataProviderCollection*, server : Win32cr::Foundation::BSTR, pid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trace_data_providers_by_process.call(this, server, pid)
    end

  end

  @[Extern]
  record IScheduleVtbl,
    query_interface : Proc(ISchedule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISchedule*, UInt32),
    release : Proc(ISchedule*, UInt32),
    get_type_info_count : Proc(ISchedule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISchedule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISchedule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISchedule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_StartDate : Proc(ISchedule*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_StartDate : Proc(ISchedule*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_EndDate : Proc(ISchedule*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_EndDate : Proc(ISchedule*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_StartTime : Proc(ISchedule*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_StartTime : Proc(ISchedule*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Days : Proc(ISchedule*, Win32cr::System::Performance::WeekDays*, Win32cr::Foundation::HRESULT),
    put_Days : Proc(ISchedule*, Win32cr::System::Performance::WeekDays, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISchedule, lpVtbl : IScheduleVtbl* do
    GUID = LibC::GUID.new(0x383753a_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : ISchedule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISchedule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISchedule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISchedule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISchedule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISchedule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISchedule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_StartDate(this : ISchedule*, start : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartDate.call(this, start)
    end
    def put_StartDate(this : ISchedule*, start : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartDate.call(this, start)
    end
    def get_EndDate(this : ISchedule*, end__ : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndDate.call(this, end__)
    end
    def put_EndDate(this : ISchedule*, end__ : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndDate.call(this, end__)
    end
    def get_StartTime(this : ISchedule*, start : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartTime.call(this, start)
    end
    def put_StartTime(this : ISchedule*, start : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartTime.call(this, start)
    end
    def get_Days(this : ISchedule*, days : Win32cr::System::Performance::WeekDays*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Days.call(this, days)
    end
    def put_Days(this : ISchedule*, days : Win32cr::System::Performance::WeekDays) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Days.call(this, days)
    end

  end

  @[Extern]
  record IScheduleCollectionVtbl,
    query_interface : Proc(IScheduleCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScheduleCollection*, UInt32),
    release : Proc(IScheduleCollection*, UInt32),
    get_type_info_count : Proc(IScheduleCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IScheduleCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IScheduleCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IScheduleCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IScheduleCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IScheduleCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IScheduleCollection*, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(IScheduleCollection*, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IScheduleCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IScheduleCollection*, Win32cr::Foundation::HRESULT),
    add_range : Proc(IScheduleCollection*, Void*, Win32cr::Foundation::HRESULT),
    create_schedule : Proc(IScheduleCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScheduleCollection, lpVtbl : IScheduleCollectionVtbl* do
    GUID = LibC::GUID.new(0x383753d_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IScheduleCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScheduleCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScheduleCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IScheduleCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IScheduleCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IScheduleCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IScheduleCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IScheduleCollection*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retVal)
    end
    def get_Item(this : IScheduleCollection*, index : Win32cr::System::Com::VARIANT, ppSchedule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppSchedule)
    end
    def get__NewEnum(this : IScheduleCollection*, ienum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ienum)
    end
    def add(this : IScheduleCollection*, pSchedule : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pSchedule)
    end
    def remove(this : IScheduleCollection*, vSchedule : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, vSchedule)
    end
    def clear(this : IScheduleCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_range(this : IScheduleCollection*, pSchedules : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_range.call(this, pSchedules)
    end
    def create_schedule(this : IScheduleCollection*, schedule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_schedule.call(this, schedule)
    end

  end

  @[Extern]
  record IValueMapItemVtbl,
    query_interface : Proc(IValueMapItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IValueMapItem*, UInt32),
    release : Proc(IValueMapItem*, UInt32),
    get_type_info_count : Proc(IValueMapItem*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IValueMapItem*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IValueMapItem*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IValueMapItem*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IValueMapItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IValueMapItem*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IValueMapItem*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IValueMapItem*, Int16, Win32cr::Foundation::HRESULT),
    get_Key : Proc(IValueMapItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Key : Proc(IValueMapItem*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IValueMapItem*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(IValueMapItem*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ValueMapType : Proc(IValueMapItem*, Win32cr::System::Performance::ValueMapType*, Win32cr::Foundation::HRESULT),
    put_ValueMapType : Proc(IValueMapItem*, Win32cr::System::Performance::ValueMapType, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IValueMapItem, lpVtbl : IValueMapItemVtbl* do
    GUID = LibC::GUID.new(0x3837533_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IValueMapItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IValueMapItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IValueMapItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IValueMapItem*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IValueMapItem*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IValueMapItem*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IValueMapItem*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Description(this : IValueMapItem*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IValueMapItem*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def get_Enabled(this : IValueMapItem*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : IValueMapItem*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Key(this : IValueMapItem*, key : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Key.call(this, key)
    end
    def put_Key(this : IValueMapItem*, key : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Key.call(this, key)
    end
    def get_Value(this : IValueMapItem*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def put_Value(this : IValueMapItem*, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, value)
    end
    def get_ValueMapType(this : IValueMapItem*, type__ : Win32cr::System::Performance::ValueMapType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueMapType.call(this, type__)
    end
    def put_ValueMapType(this : IValueMapItem*, type__ : Win32cr::System::Performance::ValueMapType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ValueMapType.call(this, type__)
    end

  end

  @[Extern]
  record IValueMapVtbl,
    query_interface : Proc(IValueMap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IValueMap*, UInt32),
    release : Proc(IValueMap*, UInt32),
    get_type_info_count : Proc(IValueMap*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IValueMap*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IValueMap*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IValueMap*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IValueMap*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IValueMap*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IValueMap*, Void**, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IValueMap*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IValueMap*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IValueMap*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(IValueMap*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ValueMapType : Proc(IValueMap*, Win32cr::System::Performance::ValueMapType*, Win32cr::Foundation::HRESULT),
    put_ValueMapType : Proc(IValueMap*, Win32cr::System::Performance::ValueMapType, Win32cr::Foundation::HRESULT),
    add : Proc(IValueMap*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    remove : Proc(IValueMap*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IValueMap*, Win32cr::Foundation::HRESULT),
    add_range : Proc(IValueMap*, Void*, Win32cr::Foundation::HRESULT),
    create_value_map_item : Proc(IValueMap*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IValueMap, lpVtbl : IValueMapVtbl* do
    GUID = LibC::GUID.new(0x3837534_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
    def query_interface(this : IValueMap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IValueMap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IValueMap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IValueMap*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IValueMap*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IValueMap*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IValueMap*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IValueMap*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retVal)
    end
    def get_Item(this : IValueMap*, index : Win32cr::System::Com::VARIANT, value : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, value)
    end
    def get__NewEnum(this : IValueMap*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retVal)
    end
    def get_Description(this : IValueMap*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IValueMap*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def get_Value(this : IValueMap*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def put_Value(this : IValueMap*, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, value)
    end
    def get_ValueMapType(this : IValueMap*, type__ : Win32cr::System::Performance::ValueMapType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueMapType.call(this, type__)
    end
    def put_ValueMapType(this : IValueMap*, type__ : Win32cr::System::Performance::ValueMapType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ValueMapType.call(this, type__)
    end
    def add(this : IValueMap*, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, value)
    end
    def remove(this : IValueMap*, value : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, value)
    end
    def clear(this : IValueMap*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def add_range(this : IValueMap*, map : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_range.call(this, map)
    end
    def create_value_map_item(this : IValueMap*, item : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_value_map_item.call(this, item)
    end

  end

  @[Extern]
  record ICounterItemVtbl,
    query_interface : Proc(ICounterItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICounterItem*, UInt32),
    release : Proc(ICounterItem*, UInt32),
    get_Value : Proc(ICounterItem*, Float64*, Win32cr::Foundation::HRESULT),
    put_Color : Proc(ICounterItem*, UInt32, Win32cr::Foundation::HRESULT),
    get_Color : Proc(ICounterItem*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Width : Proc(ICounterItem*, Int32, Win32cr::Foundation::HRESULT),
    get_Width : Proc(ICounterItem*, Int32*, Win32cr::Foundation::HRESULT),
    put_LineStyle : Proc(ICounterItem*, Int32, Win32cr::Foundation::HRESULT),
    get_LineStyle : Proc(ICounterItem*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScaleFactor : Proc(ICounterItem*, Int32, Win32cr::Foundation::HRESULT),
    get_ScaleFactor : Proc(ICounterItem*, Int32*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(ICounterItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ICounterItem*, Float64*, Int32*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(ICounterItem*, Float64*, Float64*, Float64*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICounterItem, lpVtbl : ICounterItemVtbl* do
    GUID = LibC::GUID.new(0x771a9520_u32, 0xee28_u16, 0x11ce_u16, StaticArray[0x94_u8, 0x1e_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
    def query_interface(this : ICounterItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICounterItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICounterItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Value(this : ICounterItem*, pdblValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pdblValue)
    end
    def put_Color(this : ICounterItem*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Color.call(this, color)
    end
    def get_Color(this : ICounterItem*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Color.call(this, pColor)
    end
    def put_Width(this : ICounterItem*, iWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Width.call(this, iWidth)
    end
    def get_Width(this : ICounterItem*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, piValue)
    end
    def put_LineStyle(this : ICounterItem*, iLineStyle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LineStyle.call(this, iLineStyle)
    end
    def get_LineStyle(this : ICounterItem*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineStyle.call(this, piValue)
    end
    def put_ScaleFactor(this : ICounterItem*, iScale : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScaleFactor.call(this, iScale)
    end
    def get_ScaleFactor(this : ICounterItem*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScaleFactor.call(this, piValue)
    end
    def get_Path(this : ICounterItem*, pstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pstrValue)
    end
    def get_value(this : ICounterItem*, value : Float64*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, value, status)
    end
    def get_statistics(this : ICounterItem*, max : Float64*, min : Float64*, avg : Float64*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, max, min, avg, status)
    end

  end

  @[Extern]
  record ICounterItem2Vtbl,
    query_interface : Proc(ICounterItem2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICounterItem2*, UInt32),
    release : Proc(ICounterItem2*, UInt32),
    get_Value : Proc(ICounterItem2*, Float64*, Win32cr::Foundation::HRESULT),
    put_Color : Proc(ICounterItem2*, UInt32, Win32cr::Foundation::HRESULT),
    get_Color : Proc(ICounterItem2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Width : Proc(ICounterItem2*, Int32, Win32cr::Foundation::HRESULT),
    get_Width : Proc(ICounterItem2*, Int32*, Win32cr::Foundation::HRESULT),
    put_LineStyle : Proc(ICounterItem2*, Int32, Win32cr::Foundation::HRESULT),
    get_LineStyle : Proc(ICounterItem2*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScaleFactor : Proc(ICounterItem2*, Int32, Win32cr::Foundation::HRESULT),
    get_ScaleFactor : Proc(ICounterItem2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(ICounterItem2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ICounterItem2*, Float64*, Int32*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(ICounterItem2*, Float64*, Float64*, Float64*, Int32*, Win32cr::Foundation::HRESULT),
    put_Selected : Proc(ICounterItem2*, Int16, Win32cr::Foundation::HRESULT),
    get_Selected : Proc(ICounterItem2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Visible : Proc(ICounterItem2*, Int16, Win32cr::Foundation::HRESULT),
    get_Visible : Proc(ICounterItem2*, Int16*, Win32cr::Foundation::HRESULT),
    get_data_at : Proc(ICounterItem2*, Int32, Win32cr::System::Performance::SysmonDataType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICounterItem2, lpVtbl : ICounterItem2Vtbl* do
    GUID = LibC::GUID.new(0xeefcd4e1_u32, 0xea1c_u16, 0x4435_u16, StaticArray[0xb7_u8, 0xf4_u8, 0xe3_u8, 0x41_u8, 0xba_u8, 0x3_u8, 0xb4_u8, 0xf9_u8])
    def query_interface(this : ICounterItem2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICounterItem2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICounterItem2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Value(this : ICounterItem2*, pdblValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pdblValue)
    end
    def put_Color(this : ICounterItem2*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Color.call(this, color)
    end
    def get_Color(this : ICounterItem2*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Color.call(this, pColor)
    end
    def put_Width(this : ICounterItem2*, iWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Width.call(this, iWidth)
    end
    def get_Width(this : ICounterItem2*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, piValue)
    end
    def put_LineStyle(this : ICounterItem2*, iLineStyle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LineStyle.call(this, iLineStyle)
    end
    def get_LineStyle(this : ICounterItem2*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineStyle.call(this, piValue)
    end
    def put_ScaleFactor(this : ICounterItem2*, iScale : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScaleFactor.call(this, iScale)
    end
    def get_ScaleFactor(this : ICounterItem2*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScaleFactor.call(this, piValue)
    end
    def get_Path(this : ICounterItem2*, pstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pstrValue)
    end
    def get_value(this : ICounterItem2*, value : Float64*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, value, status)
    end
    def get_statistics(this : ICounterItem2*, max : Float64*, min : Float64*, avg : Float64*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, max, min, avg, status)
    end
    def put_Selected(this : ICounterItem2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Selected.call(this, bState)
    end
    def get_Selected(this : ICounterItem2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Selected.call(this, pbState)
    end
    def put_Visible(this : ICounterItem2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Visible.call(this, bState)
    end
    def get_Visible(this : ICounterItem2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Visible.call(this, pbState)
    end
    def get_data_at(this : ICounterItem2*, iIndex : Int32, iWhich : Win32cr::System::Performance::SysmonDataType, pVariant : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_at.call(this, iIndex, iWhich, pVariant)
    end

  end

  @[Extern]
  record ICounterItemUnion_Vtbl,
    query_interface : Proc(ICounterItemUnion_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICounterItemUnion_*, UInt32),
    release : Proc(ICounterItemUnion_*, UInt32),
    get_Value : Proc(ICounterItemUnion_*, Float64*, Win32cr::Foundation::HRESULT),
    put_Color : Proc(ICounterItemUnion_*, UInt32, Win32cr::Foundation::HRESULT),
    get_Color : Proc(ICounterItemUnion_*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Width : Proc(ICounterItemUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_Width : Proc(ICounterItemUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    put_LineStyle : Proc(ICounterItemUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_LineStyle : Proc(ICounterItemUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScaleFactor : Proc(ICounterItemUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_ScaleFactor : Proc(ICounterItemUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(ICounterItemUnion_*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ICounterItemUnion_*, Float64*, Int32*, Win32cr::Foundation::HRESULT),
    get_statistics : Proc(ICounterItemUnion_*, Float64*, Float64*, Float64*, Int32*, Win32cr::Foundation::HRESULT),
    put_Selected : Proc(ICounterItemUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_Selected : Proc(ICounterItemUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_Visible : Proc(ICounterItemUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_Visible : Proc(ICounterItemUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    get_data_at : Proc(ICounterItemUnion_*, Int32, Win32cr::System::Performance::SysmonDataType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICounterItemUnion_, lpVtbl : ICounterItemUnion_Vtbl* do
    GUID = LibC::GUID.new(0xde1a6b74_u32, 0x9182_u16, 0x4c41_u16, StaticArray[0x8e_u8, 0x2c_u8, 0x24_u8, 0xc2_u8, 0xcd_u8, 0x30_u8, 0xee_u8, 0x83_u8])
    def query_interface(this : ICounterItemUnion_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICounterItemUnion_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICounterItemUnion_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Value(this : ICounterItemUnion_*, pdblValue : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pdblValue)
    end
    def put_Color(this : ICounterItemUnion_*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Color.call(this, color)
    end
    def get_Color(this : ICounterItemUnion_*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Color.call(this, pColor)
    end
    def put_Width(this : ICounterItemUnion_*, iWidth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Width.call(this, iWidth)
    end
    def get_Width(this : ICounterItemUnion_*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, piValue)
    end
    def put_LineStyle(this : ICounterItemUnion_*, iLineStyle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LineStyle.call(this, iLineStyle)
    end
    def get_LineStyle(this : ICounterItemUnion_*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LineStyle.call(this, piValue)
    end
    def put_ScaleFactor(this : ICounterItemUnion_*, iScale : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScaleFactor.call(this, iScale)
    end
    def get_ScaleFactor(this : ICounterItemUnion_*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScaleFactor.call(this, piValue)
    end
    def get_Path(this : ICounterItemUnion_*, pstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pstrValue)
    end
    def get_value(this : ICounterItemUnion_*, value : Float64*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, value, status)
    end
    def get_statistics(this : ICounterItemUnion_*, max : Float64*, min : Float64*, avg : Float64*, status : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistics.call(this, max, min, avg, status)
    end
    def put_Selected(this : ICounterItemUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Selected.call(this, bState)
    end
    def get_Selected(this : ICounterItemUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Selected.call(this, pbState)
    end
    def put_Visible(this : ICounterItemUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Visible.call(this, bState)
    end
    def get_Visible(this : ICounterItemUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Visible.call(this, pbState)
    end
    def get_data_at(this : ICounterItemUnion_*, iIndex : Int32, iWhich : Win32cr::System::Performance::SysmonDataType, pVariant : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_at.call(this, iIndex, iWhich, pVariant)
    end

  end

  @[Extern]
  record DICounterItemVtbl,
    query_interface : Proc(DICounterItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DICounterItem*, UInt32),
    release : Proc(DICounterItem*, UInt32),
    get_type_info_count : Proc(DICounterItem*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DICounterItem*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DICounterItem*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DICounterItem*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record DICounterItem, lpVtbl : DICounterItemVtbl* do
    GUID = LibC::GUID.new(0xc08c4ff2_u32, 0xe2e_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2c_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
    def query_interface(this : DICounterItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DICounterItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DICounterItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DICounterItem*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DICounterItem*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DICounterItem*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DICounterItem*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ICountersVtbl,
    query_interface : Proc(ICounters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICounters*, UInt32),
    release : Proc(ICounters*, UInt32),
    get_type_info_count : Proc(ICounters*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICounters*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICounters*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICounters*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ICounters*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ICounters*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ICounters*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(ICounters*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(ICounters*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICounters, lpVtbl : ICountersVtbl* do
    GUID = LibC::GUID.new(0x79167962_u32, 0x28fc_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2f_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
    def query_interface(this : ICounters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICounters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICounters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICounters*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICounters*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICounters*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICounters*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ICounters*, pLong : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pLong)
    end
    def get__NewEnum(this : ICounters*, ppIunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIunk)
    end
    def get_Item(this : ICounters*, index : Win32cr::System::Com::VARIANT, ppI : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppI)
    end
    def add(this : ICounters*, pathname : Win32cr::Foundation::BSTR, ppI : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pathname, ppI)
    end
    def remove(this : ICounters*, index : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end

  end

  @[Extern]
  record ILogFileItemVtbl,
    query_interface : Proc(ILogFileItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILogFileItem*, UInt32),
    release : Proc(ILogFileItem*, UInt32),
    get_Path : Proc(ILogFileItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILogFileItem, lpVtbl : ILogFileItemVtbl* do
    GUID = LibC::GUID.new(0xd6b518dd_u32, 0x5c7_u16, 0x418a_u16, StaticArray[0x89_u8, 0xe6_u8, 0x4f_u8, 0x9c_u8, 0xe8_u8, 0xc6_u8, 0x84_u8, 0x1e_u8])
    def query_interface(this : ILogFileItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILogFileItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILogFileItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Path(this : ILogFileItem*, pstrValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pstrValue)
    end

  end

  @[Extern]
  record DILogFileItemVtbl,
    query_interface : Proc(DILogFileItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DILogFileItem*, UInt32),
    release : Proc(DILogFileItem*, UInt32),
    get_type_info_count : Proc(DILogFileItem*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DILogFileItem*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DILogFileItem*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DILogFileItem*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record DILogFileItem, lpVtbl : DILogFileItemVtbl* do
    GUID = LibC::GUID.new(0x8d093ffc_u32, 0xf777_u16, 0x4917_u16, StaticArray[0x82_u8, 0xd1_u8, 0x83_u8, 0x3f_u8, 0xbc_u8, 0x54_u8, 0xc5_u8, 0x8f_u8])
    def query_interface(this : DILogFileItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DILogFileItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DILogFileItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DILogFileItem*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DILogFileItem*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DILogFileItem*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DILogFileItem*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ILogFilesVtbl,
    query_interface : Proc(ILogFiles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILogFiles*, UInt32),
    release : Proc(ILogFiles*, UInt32),
    get_type_info_count : Proc(ILogFiles*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ILogFiles*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ILogFiles*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ILogFiles*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ILogFiles*, Int32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ILogFiles*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ILogFiles*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    add : Proc(ILogFiles*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(ILogFiles*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILogFiles, lpVtbl : ILogFilesVtbl* do
    GUID = LibC::GUID.new(0x6a2a97e6_u32, 0x6851_u16, 0x41ea_u16, StaticArray[0x87_u8, 0xad_u8, 0x2a_u8, 0x82_u8, 0x25_u8, 0x33_u8, 0x58_u8, 0x65_u8])
    def query_interface(this : ILogFiles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILogFiles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILogFiles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ILogFiles*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ILogFiles*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ILogFiles*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ILogFiles*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ILogFiles*, pLong : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pLong)
    end
    def get__NewEnum(this : ILogFiles*, ppIunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppIunk)
    end
    def get_Item(this : ILogFiles*, index : Win32cr::System::Com::VARIANT, ppI : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppI)
    end
    def add(this : ILogFiles*, pathname : Win32cr::Foundation::BSTR, ppI : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pathname, ppI)
    end
    def remove(this : ILogFiles*, index : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end

  end

  @[Extern]
  record ISystemMonitorVtbl,
    query_interface : Proc(ISystemMonitor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemMonitor*, UInt32),
    release : Proc(ISystemMonitor*, UInt32),
    get_Appearance : Proc(ISystemMonitor*, Int32*, Win32cr::Foundation::HRESULT),
    put_Appearance : Proc(ISystemMonitor*, Int32, Win32cr::Foundation::HRESULT),
    get_BackColor : Proc(ISystemMonitor*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BackColor : Proc(ISystemMonitor*, UInt32, Win32cr::Foundation::HRESULT),
    get_BorderStyle : Proc(ISystemMonitor*, Int32*, Win32cr::Foundation::HRESULT),
    put_BorderStyle : Proc(ISystemMonitor*, Int32, Win32cr::Foundation::HRESULT),
    get_ForeColor : Proc(ISystemMonitor*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ForeColor : Proc(ISystemMonitor*, UInt32, Win32cr::Foundation::HRESULT),
    get_Font : Proc(ISystemMonitor*, Void**, Win32cr::Foundation::HRESULT),
    putref_Font : Proc(ISystemMonitor*, Void*, Win32cr::Foundation::HRESULT),
    get_Counters : Proc(ISystemMonitor*, Void**, Win32cr::Foundation::HRESULT),
    put_ShowVerticalGrid : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowVerticalGrid : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowHorizontalGrid : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowHorizontalGrid : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowLegend : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowLegend : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowScaleLabels : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowScaleLabels : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowValueBar : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowValueBar : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_MaximumScale : Proc(ISystemMonitor*, Int32, Win32cr::Foundation::HRESULT),
    get_MaximumScale : Proc(ISystemMonitor*, Int32*, Win32cr::Foundation::HRESULT),
    put_MinimumScale : Proc(ISystemMonitor*, Int32, Win32cr::Foundation::HRESULT),
    get_MinimumScale : Proc(ISystemMonitor*, Int32*, Win32cr::Foundation::HRESULT),
    put_UpdateInterval : Proc(ISystemMonitor*, Float32, Win32cr::Foundation::HRESULT),
    get_UpdateInterval : Proc(ISystemMonitor*, Float32*, Win32cr::Foundation::HRESULT),
    put_DisplayType : Proc(ISystemMonitor*, Win32cr::System::Performance::DisplayTypeConstants, Win32cr::Foundation::HRESULT),
    get_DisplayType : Proc(ISystemMonitor*, Win32cr::System::Performance::DisplayTypeConstants*, Win32cr::Foundation::HRESULT),
    put_ManualUpdate : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ManualUpdate : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_GraphTitle : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_GraphTitle : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_YAxisLabel : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_YAxisLabel : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    collect_sample : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    update_graph : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    browse_counters : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    display_properties : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    counter : Proc(ISystemMonitor*, Int32, Void**, Win32cr::Foundation::HRESULT),
    add_counter : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_counter : Proc(ISystemMonitor*, Void*, Win32cr::Foundation::HRESULT),
    get_BackColorCtl : Proc(ISystemMonitor*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BackColorCtl : Proc(ISystemMonitor*, UInt32, Win32cr::Foundation::HRESULT),
    put_LogFileName : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogFileName : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LogViewStart : Proc(ISystemMonitor*, Float64, Win32cr::Foundation::HRESULT),
    get_LogViewStart : Proc(ISystemMonitor*, Float64*, Win32cr::Foundation::HRESULT),
    put_LogViewStop : Proc(ISystemMonitor*, Float64, Win32cr::Foundation::HRESULT),
    get_LogViewStop : Proc(ISystemMonitor*, Float64*, Win32cr::Foundation::HRESULT),
    get_GridColor : Proc(ISystemMonitor*, UInt32*, Win32cr::Foundation::HRESULT),
    put_GridColor : Proc(ISystemMonitor*, UInt32, Win32cr::Foundation::HRESULT),
    get_TimeBarColor : Proc(ISystemMonitor*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TimeBarColor : Proc(ISystemMonitor*, UInt32, Win32cr::Foundation::HRESULT),
    get_Highlight : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_Highlight : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowToolbar : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowToolbar : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    paste : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    copy : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    reset : Proc(ISystemMonitor*, Win32cr::Foundation::HRESULT),
    put_ReadOnly : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_ReportValueType : Proc(ISystemMonitor*, Win32cr::System::Performance::ReportValueTypeConstants, Win32cr::Foundation::HRESULT),
    get_ReportValueType : Proc(ISystemMonitor*, Win32cr::System::Performance::ReportValueTypeConstants*, Win32cr::Foundation::HRESULT),
    put_MonitorDuplicateInstances : Proc(ISystemMonitor*, Int16, Win32cr::Foundation::HRESULT),
    get_MonitorDuplicateInstances : Proc(ISystemMonitor*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisplayFilter : Proc(ISystemMonitor*, Int32, Win32cr::Foundation::HRESULT),
    get_DisplayFilter : Proc(ISystemMonitor*, Int32*, Win32cr::Foundation::HRESULT),
    get_LogFiles : Proc(ISystemMonitor*, Void**, Win32cr::Foundation::HRESULT),
    put_DataSourceType : Proc(ISystemMonitor*, Win32cr::System::Performance::DataSourceTypeConstants, Win32cr::Foundation::HRESULT),
    get_DataSourceType : Proc(ISystemMonitor*, Win32cr::System::Performance::DataSourceTypeConstants*, Win32cr::Foundation::HRESULT),
    put_SqlDsnName : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SqlDsnName : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SqlLogSetName : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SqlLogSetName : Proc(ISystemMonitor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISystemMonitor, lpVtbl : ISystemMonitorVtbl* do
    GUID = LibC::GUID.new(0x194eb241_u32, 0xc32c_u16, 0x11cf_u16, StaticArray[0x93_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
    def query_interface(this : ISystemMonitor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemMonitor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemMonitor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Appearance(this : ISystemMonitor*, iAppearance : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Appearance.call(this, iAppearance)
    end
    def put_Appearance(this : ISystemMonitor*, iAppearance : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Appearance.call(this, iAppearance)
    end
    def get_BackColor(this : ISystemMonitor*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColor.call(this, pColor)
    end
    def put_BackColor(this : ISystemMonitor*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColor.call(this, color)
    end
    def get_BorderStyle(this : ISystemMonitor*, iBorderStyle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BorderStyle.call(this, iBorderStyle)
    end
    def put_BorderStyle(this : ISystemMonitor*, iBorderStyle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BorderStyle.call(this, iBorderStyle)
    end
    def get_ForeColor(this : ISystemMonitor*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForeColor.call(this, pColor)
    end
    def put_ForeColor(this : ISystemMonitor*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ForeColor.call(this, color)
    end
    def get_Font(this : ISystemMonitor*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Font.call(this, ppFont)
    end
    def putref_Font(this : ISystemMonitor*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Font.call(this, pFont)
    end
    def get_Counters(this : ISystemMonitor*, ppICounters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Counters.call(this, ppICounters)
    end
    def put_ShowVerticalGrid(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowVerticalGrid.call(this, bState)
    end
    def get_ShowVerticalGrid(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowVerticalGrid.call(this, pbState)
    end
    def put_ShowHorizontalGrid(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowHorizontalGrid.call(this, bState)
    end
    def get_ShowHorizontalGrid(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowHorizontalGrid.call(this, pbState)
    end
    def put_ShowLegend(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowLegend.call(this, bState)
    end
    def get_ShowLegend(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowLegend.call(this, pbState)
    end
    def put_ShowScaleLabels(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowScaleLabels.call(this, bState)
    end
    def get_ShowScaleLabels(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowScaleLabels.call(this, pbState)
    end
    def put_ShowValueBar(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowValueBar.call(this, bState)
    end
    def get_ShowValueBar(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowValueBar.call(this, pbState)
    end
    def put_MaximumScale(this : ISystemMonitor*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaximumScale.call(this, iValue)
    end
    def get_MaximumScale(this : ISystemMonitor*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumScale.call(this, piValue)
    end
    def put_MinimumScale(this : ISystemMonitor*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinimumScale.call(this, iValue)
    end
    def get_MinimumScale(this : ISystemMonitor*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinimumScale.call(this, piValue)
    end
    def put_UpdateInterval(this : ISystemMonitor*, fValue : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UpdateInterval.call(this, fValue)
    end
    def get_UpdateInterval(this : ISystemMonitor*, pfValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdateInterval.call(this, pfValue)
    end
    def put_DisplayType(this : ISystemMonitor*, eDisplayType : Win32cr::System::Performance::DisplayTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayType.call(this, eDisplayType)
    end
    def get_DisplayType(this : ISystemMonitor*, peDisplayType : Win32cr::System::Performance::DisplayTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayType.call(this, peDisplayType)
    end
    def put_ManualUpdate(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ManualUpdate.call(this, bState)
    end
    def get_ManualUpdate(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ManualUpdate.call(this, pbState)
    end
    def put_GraphTitle(this : ISystemMonitor*, bsTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GraphTitle.call(this, bsTitle)
    end
    def get_GraphTitle(this : ISystemMonitor*, pbsTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GraphTitle.call(this, pbsTitle)
    end
    def put_YAxisLabel(this : ISystemMonitor*, bsTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_YAxisLabel.call(this, bsTitle)
    end
    def get_YAxisLabel(this : ISystemMonitor*, pbsTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_YAxisLabel.call(this, pbsTitle)
    end
    def collect_sample(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect_sample.call(this)
    end
    def update_graph(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_graph.call(this)
    end
    def browse_counters(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.browse_counters.call(this)
    end
    def display_properties(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_properties.call(this)
    end
    def counter(this : ISystemMonitor*, iIndex : Int32, ppICounter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.counter.call(this, iIndex, ppICounter)
    end
    def add_counter(this : ISystemMonitor*, bsPath : Win32cr::Foundation::BSTR, ppICounter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_counter.call(this, bsPath, ppICounter)
    end
    def delete_counter(this : ISystemMonitor*, pCtr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_counter.call(this, pCtr)
    end
    def get_BackColorCtl(this : ISystemMonitor*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColorCtl.call(this, pColor)
    end
    def put_BackColorCtl(this : ISystemMonitor*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColorCtl.call(this, color)
    end
    def put_LogFileName(this : ISystemMonitor*, bsFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogFileName.call(this, bsFileName)
    end
    def get_LogFileName(this : ISystemMonitor*, bsFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFileName.call(this, bsFileName)
    end
    def put_LogViewStart(this : ISystemMonitor*, start_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogViewStart.call(this, start_time)
    end
    def get_LogViewStart(this : ISystemMonitor*, start_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogViewStart.call(this, start_time)
    end
    def put_LogViewStop(this : ISystemMonitor*, stop_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogViewStop.call(this, stop_time)
    end
    def get_LogViewStop(this : ISystemMonitor*, stop_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogViewStop.call(this, stop_time)
    end
    def get_GridColor(this : ISystemMonitor*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GridColor.call(this, pColor)
    end
    def put_GridColor(this : ISystemMonitor*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GridColor.call(this, color)
    end
    def get_TimeBarColor(this : ISystemMonitor*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TimeBarColor.call(this, pColor)
    end
    def put_TimeBarColor(this : ISystemMonitor*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TimeBarColor.call(this, color)
    end
    def get_Highlight(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Highlight.call(this, pbState)
    end
    def put_Highlight(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Highlight.call(this, bState)
    end
    def get_ShowToolbar(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowToolbar.call(this, pbState)
    end
    def put_ShowToolbar(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowToolbar.call(this, bState)
    end
    def paste(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this)
    end
    def copy(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this)
    end
    def reset(this : ISystemMonitor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def put_ReadOnly(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReadOnly.call(this, bState)
    end
    def get_ReadOnly(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, pbState)
    end
    def put_ReportValueType(this : ISystemMonitor*, eReportValueType : Win32cr::System::Performance::ReportValueTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportValueType.call(this, eReportValueType)
    end
    def get_ReportValueType(this : ISystemMonitor*, peReportValueType : Win32cr::System::Performance::ReportValueTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportValueType.call(this, peReportValueType)
    end
    def put_MonitorDuplicateInstances(this : ISystemMonitor*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MonitorDuplicateInstances.call(this, bState)
    end
    def get_MonitorDuplicateInstances(this : ISystemMonitor*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MonitorDuplicateInstances.call(this, pbState)
    end
    def put_DisplayFilter(this : ISystemMonitor*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayFilter.call(this, iValue)
    end
    def get_DisplayFilter(this : ISystemMonitor*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayFilter.call(this, piValue)
    end
    def get_LogFiles(this : ISystemMonitor*, ppILogFiles : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFiles.call(this, ppILogFiles)
    end
    def put_DataSourceType(this : ISystemMonitor*, eDataSourceType : Win32cr::System::Performance::DataSourceTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataSourceType.call(this, eDataSourceType)
    end
    def get_DataSourceType(this : ISystemMonitor*, peDataSourceType : Win32cr::System::Performance::DataSourceTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataSourceType.call(this, peDataSourceType)
    end
    def put_SqlDsnName(this : ISystemMonitor*, bsSqlDsnName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SqlDsnName.call(this, bsSqlDsnName)
    end
    def get_SqlDsnName(this : ISystemMonitor*, bsSqlDsnName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SqlDsnName.call(this, bsSqlDsnName)
    end
    def put_SqlLogSetName(this : ISystemMonitor*, bsSqlLogSetName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SqlLogSetName.call(this, bsSqlLogSetName)
    end
    def get_SqlLogSetName(this : ISystemMonitor*, bsSqlLogSetName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SqlLogSetName.call(this, bsSqlLogSetName)
    end

  end

  @[Extern]
  record ISystemMonitor2Vtbl,
    query_interface : Proc(ISystemMonitor2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemMonitor2*, UInt32),
    release : Proc(ISystemMonitor2*, UInt32),
    get_Appearance : Proc(ISystemMonitor2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Appearance : Proc(ISystemMonitor2*, Int32, Win32cr::Foundation::HRESULT),
    get_BackColor : Proc(ISystemMonitor2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BackColor : Proc(ISystemMonitor2*, UInt32, Win32cr::Foundation::HRESULT),
    get_BorderStyle : Proc(ISystemMonitor2*, Int32*, Win32cr::Foundation::HRESULT),
    put_BorderStyle : Proc(ISystemMonitor2*, Int32, Win32cr::Foundation::HRESULT),
    get_ForeColor : Proc(ISystemMonitor2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ForeColor : Proc(ISystemMonitor2*, UInt32, Win32cr::Foundation::HRESULT),
    get_Font : Proc(ISystemMonitor2*, Void**, Win32cr::Foundation::HRESULT),
    putref_Font : Proc(ISystemMonitor2*, Void*, Win32cr::Foundation::HRESULT),
    get_Counters : Proc(ISystemMonitor2*, Void**, Win32cr::Foundation::HRESULT),
    put_ShowVerticalGrid : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowVerticalGrid : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowHorizontalGrid : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowHorizontalGrid : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowLegend : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowLegend : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowScaleLabels : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowScaleLabels : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowValueBar : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowValueBar : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_MaximumScale : Proc(ISystemMonitor2*, Int32, Win32cr::Foundation::HRESULT),
    get_MaximumScale : Proc(ISystemMonitor2*, Int32*, Win32cr::Foundation::HRESULT),
    put_MinimumScale : Proc(ISystemMonitor2*, Int32, Win32cr::Foundation::HRESULT),
    get_MinimumScale : Proc(ISystemMonitor2*, Int32*, Win32cr::Foundation::HRESULT),
    put_UpdateInterval : Proc(ISystemMonitor2*, Float32, Win32cr::Foundation::HRESULT),
    get_UpdateInterval : Proc(ISystemMonitor2*, Float32*, Win32cr::Foundation::HRESULT),
    put_DisplayType : Proc(ISystemMonitor2*, Win32cr::System::Performance::DisplayTypeConstants, Win32cr::Foundation::HRESULT),
    get_DisplayType : Proc(ISystemMonitor2*, Win32cr::System::Performance::DisplayTypeConstants*, Win32cr::Foundation::HRESULT),
    put_ManualUpdate : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ManualUpdate : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_GraphTitle : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_GraphTitle : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_YAxisLabel : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_YAxisLabel : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    collect_sample : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    update_graph : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    browse_counters : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    display_properties : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    counter : Proc(ISystemMonitor2*, Int32, Void**, Win32cr::Foundation::HRESULT),
    add_counter : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_counter : Proc(ISystemMonitor2*, Void*, Win32cr::Foundation::HRESULT),
    get_BackColorCtl : Proc(ISystemMonitor2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BackColorCtl : Proc(ISystemMonitor2*, UInt32, Win32cr::Foundation::HRESULT),
    put_LogFileName : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogFileName : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LogViewStart : Proc(ISystemMonitor2*, Float64, Win32cr::Foundation::HRESULT),
    get_LogViewStart : Proc(ISystemMonitor2*, Float64*, Win32cr::Foundation::HRESULT),
    put_LogViewStop : Proc(ISystemMonitor2*, Float64, Win32cr::Foundation::HRESULT),
    get_LogViewStop : Proc(ISystemMonitor2*, Float64*, Win32cr::Foundation::HRESULT),
    get_GridColor : Proc(ISystemMonitor2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_GridColor : Proc(ISystemMonitor2*, UInt32, Win32cr::Foundation::HRESULT),
    get_TimeBarColor : Proc(ISystemMonitor2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TimeBarColor : Proc(ISystemMonitor2*, UInt32, Win32cr::Foundation::HRESULT),
    get_Highlight : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Highlight : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowToolbar : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowToolbar : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    paste : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    copy : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    reset : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    put_ReadOnly : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ReportValueType : Proc(ISystemMonitor2*, Win32cr::System::Performance::ReportValueTypeConstants, Win32cr::Foundation::HRESULT),
    get_ReportValueType : Proc(ISystemMonitor2*, Win32cr::System::Performance::ReportValueTypeConstants*, Win32cr::Foundation::HRESULT),
    put_MonitorDuplicateInstances : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_MonitorDuplicateInstances : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisplayFilter : Proc(ISystemMonitor2*, Int32, Win32cr::Foundation::HRESULT),
    get_DisplayFilter : Proc(ISystemMonitor2*, Int32*, Win32cr::Foundation::HRESULT),
    get_LogFiles : Proc(ISystemMonitor2*, Void**, Win32cr::Foundation::HRESULT),
    put_DataSourceType : Proc(ISystemMonitor2*, Win32cr::System::Performance::DataSourceTypeConstants, Win32cr::Foundation::HRESULT),
    get_DataSourceType : Proc(ISystemMonitor2*, Win32cr::System::Performance::DataSourceTypeConstants*, Win32cr::Foundation::HRESULT),
    put_SqlDsnName : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SqlDsnName : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SqlLogSetName : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SqlLogSetName : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EnableDigitGrouping : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_EnableDigitGrouping : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_EnableToolTips : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_EnableToolTips : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowTimeAxisLabels : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowTimeAxisLabels : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ChartScroll : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    get_ChartScroll : Proc(ISystemMonitor2*, Int16*, Win32cr::Foundation::HRESULT),
    put_DataPointCount : Proc(ISystemMonitor2*, Int32, Win32cr::Foundation::HRESULT),
    get_DataPointCount : Proc(ISystemMonitor2*, Int32*, Win32cr::Foundation::HRESULT),
    scale_to_fit : Proc(ISystemMonitor2*, Int16, Win32cr::Foundation::HRESULT),
    save_as : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::System::Performance::SysmonFileType, Win32cr::Foundation::HRESULT),
    relog : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::System::Performance::SysmonFileType, Int32, Win32cr::Foundation::HRESULT),
    clear_data : Proc(ISystemMonitor2*, Win32cr::Foundation::HRESULT),
    get_LogSourceStartTime : Proc(ISystemMonitor2*, Float64*, Win32cr::Foundation::HRESULT),
    get_LogSourceStopTime : Proc(ISystemMonitor2*, Float64*, Win32cr::Foundation::HRESULT),
    set_log_view_range : Proc(ISystemMonitor2*, Float64, Float64, Win32cr::Foundation::HRESULT),
    get_log_view_range : Proc(ISystemMonitor2*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    batching_lock : Proc(ISystemMonitor2*, Int16, Win32cr::System::Performance::SysmonBatchReason, Win32cr::Foundation::HRESULT),
    load_settings : Proc(ISystemMonitor2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISystemMonitor2, lpVtbl : ISystemMonitor2Vtbl* do
    GUID = LibC::GUID.new(0x8e3206a_u32, 0x5fd2_u16, 0x4fde_u16, StaticArray[0xa8_u8, 0xa5_u8, 0x8c_u8, 0xb3_u8, 0xb6_u8, 0x3d_u8, 0x26_u8, 0x77_u8])
    def query_interface(this : ISystemMonitor2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemMonitor2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemMonitor2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Appearance(this : ISystemMonitor2*, iAppearance : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Appearance.call(this, iAppearance)
    end
    def put_Appearance(this : ISystemMonitor2*, iAppearance : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Appearance.call(this, iAppearance)
    end
    def get_BackColor(this : ISystemMonitor2*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColor.call(this, pColor)
    end
    def put_BackColor(this : ISystemMonitor2*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColor.call(this, color)
    end
    def get_BorderStyle(this : ISystemMonitor2*, iBorderStyle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BorderStyle.call(this, iBorderStyle)
    end
    def put_BorderStyle(this : ISystemMonitor2*, iBorderStyle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BorderStyle.call(this, iBorderStyle)
    end
    def get_ForeColor(this : ISystemMonitor2*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForeColor.call(this, pColor)
    end
    def put_ForeColor(this : ISystemMonitor2*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ForeColor.call(this, color)
    end
    def get_Font(this : ISystemMonitor2*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Font.call(this, ppFont)
    end
    def putref_Font(this : ISystemMonitor2*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Font.call(this, pFont)
    end
    def get_Counters(this : ISystemMonitor2*, ppICounters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Counters.call(this, ppICounters)
    end
    def put_ShowVerticalGrid(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowVerticalGrid.call(this, bState)
    end
    def get_ShowVerticalGrid(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowVerticalGrid.call(this, pbState)
    end
    def put_ShowHorizontalGrid(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowHorizontalGrid.call(this, bState)
    end
    def get_ShowHorizontalGrid(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowHorizontalGrid.call(this, pbState)
    end
    def put_ShowLegend(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowLegend.call(this, bState)
    end
    def get_ShowLegend(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowLegend.call(this, pbState)
    end
    def put_ShowScaleLabels(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowScaleLabels.call(this, bState)
    end
    def get_ShowScaleLabels(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowScaleLabels.call(this, pbState)
    end
    def put_ShowValueBar(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowValueBar.call(this, bState)
    end
    def get_ShowValueBar(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowValueBar.call(this, pbState)
    end
    def put_MaximumScale(this : ISystemMonitor2*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaximumScale.call(this, iValue)
    end
    def get_MaximumScale(this : ISystemMonitor2*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumScale.call(this, piValue)
    end
    def put_MinimumScale(this : ISystemMonitor2*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinimumScale.call(this, iValue)
    end
    def get_MinimumScale(this : ISystemMonitor2*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinimumScale.call(this, piValue)
    end
    def put_UpdateInterval(this : ISystemMonitor2*, fValue : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UpdateInterval.call(this, fValue)
    end
    def get_UpdateInterval(this : ISystemMonitor2*, pfValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdateInterval.call(this, pfValue)
    end
    def put_DisplayType(this : ISystemMonitor2*, eDisplayType : Win32cr::System::Performance::DisplayTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayType.call(this, eDisplayType)
    end
    def get_DisplayType(this : ISystemMonitor2*, peDisplayType : Win32cr::System::Performance::DisplayTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayType.call(this, peDisplayType)
    end
    def put_ManualUpdate(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ManualUpdate.call(this, bState)
    end
    def get_ManualUpdate(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ManualUpdate.call(this, pbState)
    end
    def put_GraphTitle(this : ISystemMonitor2*, bsTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GraphTitle.call(this, bsTitle)
    end
    def get_GraphTitle(this : ISystemMonitor2*, pbsTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GraphTitle.call(this, pbsTitle)
    end
    def put_YAxisLabel(this : ISystemMonitor2*, bsTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_YAxisLabel.call(this, bsTitle)
    end
    def get_YAxisLabel(this : ISystemMonitor2*, pbsTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_YAxisLabel.call(this, pbsTitle)
    end
    def collect_sample(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect_sample.call(this)
    end
    def update_graph(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_graph.call(this)
    end
    def browse_counters(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.browse_counters.call(this)
    end
    def display_properties(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_properties.call(this)
    end
    def counter(this : ISystemMonitor2*, iIndex : Int32, ppICounter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.counter.call(this, iIndex, ppICounter)
    end
    def add_counter(this : ISystemMonitor2*, bsPath : Win32cr::Foundation::BSTR, ppICounter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_counter.call(this, bsPath, ppICounter)
    end
    def delete_counter(this : ISystemMonitor2*, pCtr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_counter.call(this, pCtr)
    end
    def get_BackColorCtl(this : ISystemMonitor2*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColorCtl.call(this, pColor)
    end
    def put_BackColorCtl(this : ISystemMonitor2*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColorCtl.call(this, color)
    end
    def put_LogFileName(this : ISystemMonitor2*, bsFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogFileName.call(this, bsFileName)
    end
    def get_LogFileName(this : ISystemMonitor2*, bsFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFileName.call(this, bsFileName)
    end
    def put_LogViewStart(this : ISystemMonitor2*, start_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogViewStart.call(this, start_time)
    end
    def get_LogViewStart(this : ISystemMonitor2*, start_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogViewStart.call(this, start_time)
    end
    def put_LogViewStop(this : ISystemMonitor2*, stop_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogViewStop.call(this, stop_time)
    end
    def get_LogViewStop(this : ISystemMonitor2*, stop_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogViewStop.call(this, stop_time)
    end
    def get_GridColor(this : ISystemMonitor2*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GridColor.call(this, pColor)
    end
    def put_GridColor(this : ISystemMonitor2*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GridColor.call(this, color)
    end
    def get_TimeBarColor(this : ISystemMonitor2*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TimeBarColor.call(this, pColor)
    end
    def put_TimeBarColor(this : ISystemMonitor2*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TimeBarColor.call(this, color)
    end
    def get_Highlight(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Highlight.call(this, pbState)
    end
    def put_Highlight(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Highlight.call(this, bState)
    end
    def get_ShowToolbar(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowToolbar.call(this, pbState)
    end
    def put_ShowToolbar(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowToolbar.call(this, bState)
    end
    def paste(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this)
    end
    def copy(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this)
    end
    def reset(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def put_ReadOnly(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReadOnly.call(this, bState)
    end
    def get_ReadOnly(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, pbState)
    end
    def put_ReportValueType(this : ISystemMonitor2*, eReportValueType : Win32cr::System::Performance::ReportValueTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportValueType.call(this, eReportValueType)
    end
    def get_ReportValueType(this : ISystemMonitor2*, peReportValueType : Win32cr::System::Performance::ReportValueTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportValueType.call(this, peReportValueType)
    end
    def put_MonitorDuplicateInstances(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MonitorDuplicateInstances.call(this, bState)
    end
    def get_MonitorDuplicateInstances(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MonitorDuplicateInstances.call(this, pbState)
    end
    def put_DisplayFilter(this : ISystemMonitor2*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayFilter.call(this, iValue)
    end
    def get_DisplayFilter(this : ISystemMonitor2*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayFilter.call(this, piValue)
    end
    def get_LogFiles(this : ISystemMonitor2*, ppILogFiles : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFiles.call(this, ppILogFiles)
    end
    def put_DataSourceType(this : ISystemMonitor2*, eDataSourceType : Win32cr::System::Performance::DataSourceTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataSourceType.call(this, eDataSourceType)
    end
    def get_DataSourceType(this : ISystemMonitor2*, peDataSourceType : Win32cr::System::Performance::DataSourceTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataSourceType.call(this, peDataSourceType)
    end
    def put_SqlDsnName(this : ISystemMonitor2*, bsSqlDsnName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SqlDsnName.call(this, bsSqlDsnName)
    end
    def get_SqlDsnName(this : ISystemMonitor2*, bsSqlDsnName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SqlDsnName.call(this, bsSqlDsnName)
    end
    def put_SqlLogSetName(this : ISystemMonitor2*, bsSqlLogSetName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SqlLogSetName.call(this, bsSqlLogSetName)
    end
    def get_SqlLogSetName(this : ISystemMonitor2*, bsSqlLogSetName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SqlLogSetName.call(this, bsSqlLogSetName)
    end
    def put_EnableDigitGrouping(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableDigitGrouping.call(this, bState)
    end
    def get_EnableDigitGrouping(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableDigitGrouping.call(this, pbState)
    end
    def put_EnableToolTips(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableToolTips.call(this, bState)
    end
    def get_EnableToolTips(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableToolTips.call(this, pbState)
    end
    def put_ShowTimeAxisLabels(this : ISystemMonitor2*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowTimeAxisLabels.call(this, bState)
    end
    def get_ShowTimeAxisLabels(this : ISystemMonitor2*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowTimeAxisLabels.call(this, pbState)
    end
    def put_ChartScroll(this : ISystemMonitor2*, bScroll : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ChartScroll.call(this, bScroll)
    end
    def get_ChartScroll(this : ISystemMonitor2*, pbScroll : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ChartScroll.call(this, pbScroll)
    end
    def put_DataPointCount(this : ISystemMonitor2*, iNewCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataPointCount.call(this, iNewCount)
    end
    def get_DataPointCount(this : ISystemMonitor2*, piDataPointCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataPointCount.call(this, piDataPointCount)
    end
    def scale_to_fit(this : ISystemMonitor2*, bSelectedCountersOnly : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_to_fit.call(this, bSelectedCountersOnly)
    end
    def save_as(this : ISystemMonitor2*, bstrFileName : Win32cr::Foundation::BSTR, eSysmonFileType : Win32cr::System::Performance::SysmonFileType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_as.call(this, bstrFileName, eSysmonFileType)
    end
    def relog(this : ISystemMonitor2*, bstrFileName : Win32cr::Foundation::BSTR, eSysmonFileType : Win32cr::System::Performance::SysmonFileType, iFilter : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.relog.call(this, bstrFileName, eSysmonFileType, iFilter)
    end
    def clear_data(this : ISystemMonitor2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_data.call(this)
    end
    def get_LogSourceStartTime(this : ISystemMonitor2*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogSourceStartTime.call(this, pDate)
    end
    def get_LogSourceStopTime(this : ISystemMonitor2*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogSourceStopTime.call(this, pDate)
    end
    def set_log_view_range(this : ISystemMonitor2*, start_time : Float64, stop_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_view_range.call(this, start_time, stop_time)
    end
    def get_log_view_range(this : ISystemMonitor2*, start_time : Float64*, stop_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_view_range.call(this, start_time, stop_time)
    end
    def batching_lock(this : ISystemMonitor2*, fLock : Int16, eBatchReason : Win32cr::System::Performance::SysmonBatchReason) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.batching_lock.call(this, fLock, eBatchReason)
    end
    def load_settings(this : ISystemMonitor2*, bstrSettingFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_settings.call(this, bstrSettingFileName)
    end

  end

  @[Extern]
  record ISystemMonitorUnion_Vtbl,
    query_interface : Proc(ISystemMonitorUnion_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemMonitorUnion_*, UInt32),
    release : Proc(ISystemMonitorUnion_*, UInt32),
    get_Appearance : Proc(ISystemMonitorUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    put_Appearance : Proc(ISystemMonitorUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_BackColor : Proc(ISystemMonitorUnion_*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BackColor : Proc(ISystemMonitorUnion_*, UInt32, Win32cr::Foundation::HRESULT),
    get_BorderStyle : Proc(ISystemMonitorUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    put_BorderStyle : Proc(ISystemMonitorUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_ForeColor : Proc(ISystemMonitorUnion_*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ForeColor : Proc(ISystemMonitorUnion_*, UInt32, Win32cr::Foundation::HRESULT),
    get_Font : Proc(ISystemMonitorUnion_*, Void**, Win32cr::Foundation::HRESULT),
    putref_Font : Proc(ISystemMonitorUnion_*, Void*, Win32cr::Foundation::HRESULT),
    get_Counters : Proc(ISystemMonitorUnion_*, Void**, Win32cr::Foundation::HRESULT),
    put_ShowVerticalGrid : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowVerticalGrid : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowHorizontalGrid : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowHorizontalGrid : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowLegend : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowLegend : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowScaleLabels : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowScaleLabels : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowValueBar : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowValueBar : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_MaximumScale : Proc(ISystemMonitorUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_MaximumScale : Proc(ISystemMonitorUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    put_MinimumScale : Proc(ISystemMonitorUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_MinimumScale : Proc(ISystemMonitorUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    put_UpdateInterval : Proc(ISystemMonitorUnion_*, Float32, Win32cr::Foundation::HRESULT),
    get_UpdateInterval : Proc(ISystemMonitorUnion_*, Float32*, Win32cr::Foundation::HRESULT),
    put_DisplayType : Proc(ISystemMonitorUnion_*, Win32cr::System::Performance::DisplayTypeConstants, Win32cr::Foundation::HRESULT),
    get_DisplayType : Proc(ISystemMonitorUnion_*, Win32cr::System::Performance::DisplayTypeConstants*, Win32cr::Foundation::HRESULT),
    put_ManualUpdate : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ManualUpdate : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_GraphTitle : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_GraphTitle : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_YAxisLabel : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_YAxisLabel : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    collect_sample : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    update_graph : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    browse_counters : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    display_properties : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    counter : Proc(ISystemMonitorUnion_*, Int32, Void**, Win32cr::Foundation::HRESULT),
    add_counter : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    delete_counter : Proc(ISystemMonitorUnion_*, Void*, Win32cr::Foundation::HRESULT),
    get_BackColorCtl : Proc(ISystemMonitorUnion_*, UInt32*, Win32cr::Foundation::HRESULT),
    put_BackColorCtl : Proc(ISystemMonitorUnion_*, UInt32, Win32cr::Foundation::HRESULT),
    put_LogFileName : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogFileName : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_LogViewStart : Proc(ISystemMonitorUnion_*, Float64, Win32cr::Foundation::HRESULT),
    get_LogViewStart : Proc(ISystemMonitorUnion_*, Float64*, Win32cr::Foundation::HRESULT),
    put_LogViewStop : Proc(ISystemMonitorUnion_*, Float64, Win32cr::Foundation::HRESULT),
    get_LogViewStop : Proc(ISystemMonitorUnion_*, Float64*, Win32cr::Foundation::HRESULT),
    get_GridColor : Proc(ISystemMonitorUnion_*, UInt32*, Win32cr::Foundation::HRESULT),
    put_GridColor : Proc(ISystemMonitorUnion_*, UInt32, Win32cr::Foundation::HRESULT),
    get_TimeBarColor : Proc(ISystemMonitorUnion_*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TimeBarColor : Proc(ISystemMonitorUnion_*, UInt32, Win32cr::Foundation::HRESULT),
    get_Highlight : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_Highlight : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowToolbar : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowToolbar : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    paste : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    copy : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    reset : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    put_ReadOnly : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ReportValueType : Proc(ISystemMonitorUnion_*, Win32cr::System::Performance::ReportValueTypeConstants, Win32cr::Foundation::HRESULT),
    get_ReportValueType : Proc(ISystemMonitorUnion_*, Win32cr::System::Performance::ReportValueTypeConstants*, Win32cr::Foundation::HRESULT),
    put_MonitorDuplicateInstances : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_MonitorDuplicateInstances : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisplayFilter : Proc(ISystemMonitorUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_DisplayFilter : Proc(ISystemMonitorUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    get_LogFiles : Proc(ISystemMonitorUnion_*, Void**, Win32cr::Foundation::HRESULT),
    put_DataSourceType : Proc(ISystemMonitorUnion_*, Win32cr::System::Performance::DataSourceTypeConstants, Win32cr::Foundation::HRESULT),
    get_DataSourceType : Proc(ISystemMonitorUnion_*, Win32cr::System::Performance::DataSourceTypeConstants*, Win32cr::Foundation::HRESULT),
    put_SqlDsnName : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SqlDsnName : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SqlLogSetName : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SqlLogSetName : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EnableDigitGrouping : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_EnableDigitGrouping : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_EnableToolTips : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_EnableToolTips : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ShowTimeAxisLabels : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ShowTimeAxisLabels : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_ChartScroll : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    get_ChartScroll : Proc(ISystemMonitorUnion_*, Int16*, Win32cr::Foundation::HRESULT),
    put_DataPointCount : Proc(ISystemMonitorUnion_*, Int32, Win32cr::Foundation::HRESULT),
    get_DataPointCount : Proc(ISystemMonitorUnion_*, Int32*, Win32cr::Foundation::HRESULT),
    scale_to_fit : Proc(ISystemMonitorUnion_*, Int16, Win32cr::Foundation::HRESULT),
    save_as : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::System::Performance::SysmonFileType, Win32cr::Foundation::HRESULT),
    relog : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::System::Performance::SysmonFileType, Int32, Win32cr::Foundation::HRESULT),
    clear_data : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::HRESULT),
    get_LogSourceStartTime : Proc(ISystemMonitorUnion_*, Float64*, Win32cr::Foundation::HRESULT),
    get_LogSourceStopTime : Proc(ISystemMonitorUnion_*, Float64*, Win32cr::Foundation::HRESULT),
    set_log_view_range : Proc(ISystemMonitorUnion_*, Float64, Float64, Win32cr::Foundation::HRESULT),
    get_log_view_range : Proc(ISystemMonitorUnion_*, Float64*, Float64*, Win32cr::Foundation::HRESULT),
    batching_lock : Proc(ISystemMonitorUnion_*, Int16, Win32cr::System::Performance::SysmonBatchReason, Win32cr::Foundation::HRESULT),
    load_settings : Proc(ISystemMonitorUnion_*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISystemMonitorUnion_, lpVtbl : ISystemMonitorUnion_Vtbl* do
    GUID = LibC::GUID.new(0xc8a77338_u32, 0x265f_u16, 0x4de5_u16, StaticArray[0xaa_u8, 0x25_u8, 0xc7_u8, 0xda_u8, 0x1c_u8, 0xe5_u8, 0xa8_u8, 0xf4_u8])
    def query_interface(this : ISystemMonitorUnion_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemMonitorUnion_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemMonitorUnion_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Appearance(this : ISystemMonitorUnion_*, iAppearance : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Appearance.call(this, iAppearance)
    end
    def put_Appearance(this : ISystemMonitorUnion_*, iAppearance : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Appearance.call(this, iAppearance)
    end
    def get_BackColor(this : ISystemMonitorUnion_*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColor.call(this, pColor)
    end
    def put_BackColor(this : ISystemMonitorUnion_*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColor.call(this, color)
    end
    def get_BorderStyle(this : ISystemMonitorUnion_*, iBorderStyle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BorderStyle.call(this, iBorderStyle)
    end
    def put_BorderStyle(this : ISystemMonitorUnion_*, iBorderStyle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BorderStyle.call(this, iBorderStyle)
    end
    def get_ForeColor(this : ISystemMonitorUnion_*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForeColor.call(this, pColor)
    end
    def put_ForeColor(this : ISystemMonitorUnion_*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ForeColor.call(this, color)
    end
    def get_Font(this : ISystemMonitorUnion_*, ppFont : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Font.call(this, ppFont)
    end
    def putref_Font(this : ISystemMonitorUnion_*, pFont : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_Font.call(this, pFont)
    end
    def get_Counters(this : ISystemMonitorUnion_*, ppICounters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Counters.call(this, ppICounters)
    end
    def put_ShowVerticalGrid(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowVerticalGrid.call(this, bState)
    end
    def get_ShowVerticalGrid(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowVerticalGrid.call(this, pbState)
    end
    def put_ShowHorizontalGrid(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowHorizontalGrid.call(this, bState)
    end
    def get_ShowHorizontalGrid(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowHorizontalGrid.call(this, pbState)
    end
    def put_ShowLegend(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowLegend.call(this, bState)
    end
    def get_ShowLegend(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowLegend.call(this, pbState)
    end
    def put_ShowScaleLabels(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowScaleLabels.call(this, bState)
    end
    def get_ShowScaleLabels(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowScaleLabels.call(this, pbState)
    end
    def put_ShowValueBar(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowValueBar.call(this, bState)
    end
    def get_ShowValueBar(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowValueBar.call(this, pbState)
    end
    def put_MaximumScale(this : ISystemMonitorUnion_*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaximumScale.call(this, iValue)
    end
    def get_MaximumScale(this : ISystemMonitorUnion_*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaximumScale.call(this, piValue)
    end
    def put_MinimumScale(this : ISystemMonitorUnion_*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinimumScale.call(this, iValue)
    end
    def get_MinimumScale(this : ISystemMonitorUnion_*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinimumScale.call(this, piValue)
    end
    def put_UpdateInterval(this : ISystemMonitorUnion_*, fValue : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UpdateInterval.call(this, fValue)
    end
    def get_UpdateInterval(this : ISystemMonitorUnion_*, pfValue : Float32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdateInterval.call(this, pfValue)
    end
    def put_DisplayType(this : ISystemMonitorUnion_*, eDisplayType : Win32cr::System::Performance::DisplayTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayType.call(this, eDisplayType)
    end
    def get_DisplayType(this : ISystemMonitorUnion_*, peDisplayType : Win32cr::System::Performance::DisplayTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayType.call(this, peDisplayType)
    end
    def put_ManualUpdate(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ManualUpdate.call(this, bState)
    end
    def get_ManualUpdate(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ManualUpdate.call(this, pbState)
    end
    def put_GraphTitle(this : ISystemMonitorUnion_*, bsTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GraphTitle.call(this, bsTitle)
    end
    def get_GraphTitle(this : ISystemMonitorUnion_*, pbsTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GraphTitle.call(this, pbsTitle)
    end
    def put_YAxisLabel(this : ISystemMonitorUnion_*, bsTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_YAxisLabel.call(this, bsTitle)
    end
    def get_YAxisLabel(this : ISystemMonitorUnion_*, pbsTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_YAxisLabel.call(this, pbsTitle)
    end
    def collect_sample(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collect_sample.call(this)
    end
    def update_graph(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_graph.call(this)
    end
    def browse_counters(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.browse_counters.call(this)
    end
    def display_properties(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_properties.call(this)
    end
    def counter(this : ISystemMonitorUnion_*, iIndex : Int32, ppICounter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.counter.call(this, iIndex, ppICounter)
    end
    def add_counter(this : ISystemMonitorUnion_*, bsPath : Win32cr::Foundation::BSTR, ppICounter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_counter.call(this, bsPath, ppICounter)
    end
    def delete_counter(this : ISystemMonitorUnion_*, pCtr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_counter.call(this, pCtr)
    end
    def get_BackColorCtl(this : ISystemMonitorUnion_*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BackColorCtl.call(this, pColor)
    end
    def put_BackColorCtl(this : ISystemMonitorUnion_*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BackColorCtl.call(this, color)
    end
    def put_LogFileName(this : ISystemMonitorUnion_*, bsFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogFileName.call(this, bsFileName)
    end
    def get_LogFileName(this : ISystemMonitorUnion_*, bsFileName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFileName.call(this, bsFileName)
    end
    def put_LogViewStart(this : ISystemMonitorUnion_*, start_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogViewStart.call(this, start_time)
    end
    def get_LogViewStart(this : ISystemMonitorUnion_*, start_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogViewStart.call(this, start_time)
    end
    def put_LogViewStop(this : ISystemMonitorUnion_*, stop_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogViewStop.call(this, stop_time)
    end
    def get_LogViewStop(this : ISystemMonitorUnion_*, stop_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogViewStop.call(this, stop_time)
    end
    def get_GridColor(this : ISystemMonitorUnion_*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GridColor.call(this, pColor)
    end
    def put_GridColor(this : ISystemMonitorUnion_*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GridColor.call(this, color)
    end
    def get_TimeBarColor(this : ISystemMonitorUnion_*, pColor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TimeBarColor.call(this, pColor)
    end
    def put_TimeBarColor(this : ISystemMonitorUnion_*, color : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TimeBarColor.call(this, color)
    end
    def get_Highlight(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Highlight.call(this, pbState)
    end
    def put_Highlight(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Highlight.call(this, bState)
    end
    def get_ShowToolbar(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowToolbar.call(this, pbState)
    end
    def put_ShowToolbar(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowToolbar.call(this, bState)
    end
    def paste(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.paste.call(this)
    end
    def copy(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this)
    end
    def reset(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def put_ReadOnly(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReadOnly.call(this, bState)
    end
    def get_ReadOnly(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, pbState)
    end
    def put_ReportValueType(this : ISystemMonitorUnion_*, eReportValueType : Win32cr::System::Performance::ReportValueTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportValueType.call(this, eReportValueType)
    end
    def get_ReportValueType(this : ISystemMonitorUnion_*, peReportValueType : Win32cr::System::Performance::ReportValueTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportValueType.call(this, peReportValueType)
    end
    def put_MonitorDuplicateInstances(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MonitorDuplicateInstances.call(this, bState)
    end
    def get_MonitorDuplicateInstances(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MonitorDuplicateInstances.call(this, pbState)
    end
    def put_DisplayFilter(this : ISystemMonitorUnion_*, iValue : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayFilter.call(this, iValue)
    end
    def get_DisplayFilter(this : ISystemMonitorUnion_*, piValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayFilter.call(this, piValue)
    end
    def get_LogFiles(this : ISystemMonitorUnion_*, ppILogFiles : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogFiles.call(this, ppILogFiles)
    end
    def put_DataSourceType(this : ISystemMonitorUnion_*, eDataSourceType : Win32cr::System::Performance::DataSourceTypeConstants) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataSourceType.call(this, eDataSourceType)
    end
    def get_DataSourceType(this : ISystemMonitorUnion_*, peDataSourceType : Win32cr::System::Performance::DataSourceTypeConstants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataSourceType.call(this, peDataSourceType)
    end
    def put_SqlDsnName(this : ISystemMonitorUnion_*, bsSqlDsnName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SqlDsnName.call(this, bsSqlDsnName)
    end
    def get_SqlDsnName(this : ISystemMonitorUnion_*, bsSqlDsnName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SqlDsnName.call(this, bsSqlDsnName)
    end
    def put_SqlLogSetName(this : ISystemMonitorUnion_*, bsSqlLogSetName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SqlLogSetName.call(this, bsSqlLogSetName)
    end
    def get_SqlLogSetName(this : ISystemMonitorUnion_*, bsSqlLogSetName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SqlLogSetName.call(this, bsSqlLogSetName)
    end
    def put_EnableDigitGrouping(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableDigitGrouping.call(this, bState)
    end
    def get_EnableDigitGrouping(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableDigitGrouping.call(this, pbState)
    end
    def put_EnableToolTips(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableToolTips.call(this, bState)
    end
    def get_EnableToolTips(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableToolTips.call(this, pbState)
    end
    def put_ShowTimeAxisLabels(this : ISystemMonitorUnion_*, bState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ShowTimeAxisLabels.call(this, bState)
    end
    def get_ShowTimeAxisLabels(this : ISystemMonitorUnion_*, pbState : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ShowTimeAxisLabels.call(this, pbState)
    end
    def put_ChartScroll(this : ISystemMonitorUnion_*, bScroll : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ChartScroll.call(this, bScroll)
    end
    def get_ChartScroll(this : ISystemMonitorUnion_*, pbScroll : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ChartScroll.call(this, pbScroll)
    end
    def put_DataPointCount(this : ISystemMonitorUnion_*, iNewCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DataPointCount.call(this, iNewCount)
    end
    def get_DataPointCount(this : ISystemMonitorUnion_*, piDataPointCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataPointCount.call(this, piDataPointCount)
    end
    def scale_to_fit(this : ISystemMonitorUnion_*, bSelectedCountersOnly : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scale_to_fit.call(this, bSelectedCountersOnly)
    end
    def save_as(this : ISystemMonitorUnion_*, bstrFileName : Win32cr::Foundation::BSTR, eSysmonFileType : Win32cr::System::Performance::SysmonFileType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_as.call(this, bstrFileName, eSysmonFileType)
    end
    def relog(this : ISystemMonitorUnion_*, bstrFileName : Win32cr::Foundation::BSTR, eSysmonFileType : Win32cr::System::Performance::SysmonFileType, iFilter : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.relog.call(this, bstrFileName, eSysmonFileType, iFilter)
    end
    def clear_data(this : ISystemMonitorUnion_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_data.call(this)
    end
    def get_LogSourceStartTime(this : ISystemMonitorUnion_*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogSourceStartTime.call(this, pDate)
    end
    def get_LogSourceStopTime(this : ISystemMonitorUnion_*, pDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogSourceStopTime.call(this, pDate)
    end
    def set_log_view_range(this : ISystemMonitorUnion_*, start_time : Float64, stop_time : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_view_range.call(this, start_time, stop_time)
    end
    def get_log_view_range(this : ISystemMonitorUnion_*, start_time : Float64*, stop_time : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_view_range.call(this, start_time, stop_time)
    end
    def batching_lock(this : ISystemMonitorUnion_*, fLock : Int16, eBatchReason : Win32cr::System::Performance::SysmonBatchReason) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.batching_lock.call(this, fLock, eBatchReason)
    end
    def load_settings(this : ISystemMonitorUnion_*, bstrSettingFileName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_settings.call(this, bstrSettingFileName)
    end

  end

  @[Extern]
  record DISystemMonitorVtbl,
    query_interface : Proc(DISystemMonitor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DISystemMonitor*, UInt32),
    release : Proc(DISystemMonitor*, UInt32),
    get_type_info_count : Proc(DISystemMonitor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DISystemMonitor*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DISystemMonitor*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DISystemMonitor*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record DISystemMonitor, lpVtbl : DISystemMonitorVtbl* do
    GUID = LibC::GUID.new(0x13d73d81_u32, 0xc32e_u16, 0x11cf_u16, StaticArray[0x93_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
    def query_interface(this : DISystemMonitor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DISystemMonitor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DISystemMonitor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DISystemMonitor*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DISystemMonitor*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DISystemMonitor*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DISystemMonitor*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record DISystemMonitorInternalVtbl,
    query_interface : Proc(DISystemMonitorInternal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DISystemMonitorInternal*, UInt32),
    release : Proc(DISystemMonitorInternal*, UInt32),
    get_type_info_count : Proc(DISystemMonitorInternal*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DISystemMonitorInternal*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DISystemMonitorInternal*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DISystemMonitorInternal*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record DISystemMonitorInternal, lpVtbl : DISystemMonitorInternalVtbl* do
    GUID = LibC::GUID.new(0x194eb242_u32, 0xc32c_u16, 0x11cf_u16, StaticArray[0x93_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
    def query_interface(this : DISystemMonitorInternal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DISystemMonitorInternal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DISystemMonitorInternal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DISystemMonitorInternal*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DISystemMonitorInternal*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DISystemMonitorInternal*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DISystemMonitorInternal*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ISystemMonitorEventsVtbl,
    query_interface : Proc(ISystemMonitorEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemMonitorEvents*, UInt32),
    release : Proc(ISystemMonitorEvents*, UInt32),
    on_counter_selected : Proc(ISystemMonitorEvents*, Int32, Void),
    on_counter_added : Proc(ISystemMonitorEvents*, Int32, Void),
    on_counter_deleted : Proc(ISystemMonitorEvents*, Int32, Void),
    on_sample_collected : Proc(ISystemMonitorEvents*, Void),
    on_dbl_click : Proc(ISystemMonitorEvents*, Int32, Void)


  @[Extern]
  record ISystemMonitorEvents, lpVtbl : ISystemMonitorEventsVtbl* do
    GUID = LibC::GUID.new(0xee660ea0_u32, 0x4abd_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x3a_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
    def query_interface(this : ISystemMonitorEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemMonitorEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemMonitorEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_counter_selected(this : ISystemMonitorEvents*, index : Int32) : Void
      @lpVtbl.try &.value.on_counter_selected.call(this, index)
    end
    def on_counter_added(this : ISystemMonitorEvents*, index : Int32) : Void
      @lpVtbl.try &.value.on_counter_added.call(this, index)
    end
    def on_counter_deleted(this : ISystemMonitorEvents*, index : Int32) : Void
      @lpVtbl.try &.value.on_counter_deleted.call(this, index)
    end
    def on_sample_collected(this : ISystemMonitorEvents*) : Void
      @lpVtbl.try &.value.on_sample_collected.call(this)
    end
    def on_dbl_click(this : ISystemMonitorEvents*, index : Int32) : Void
      @lpVtbl.try &.value.on_dbl_click.call(this, index)
    end

  end

  @[Extern]
  record DISystemMonitorEventsVtbl,
    query_interface : Proc(DISystemMonitorEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DISystemMonitorEvents*, UInt32),
    release : Proc(DISystemMonitorEvents*, UInt32),
    get_type_info_count : Proc(DISystemMonitorEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DISystemMonitorEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DISystemMonitorEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DISystemMonitorEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record DISystemMonitorEvents, lpVtbl : DISystemMonitorEventsVtbl* do
    GUID = LibC::GUID.new(0x84979930_u32, 0x4ab3_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x3a_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
    def query_interface(this : DISystemMonitorEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DISystemMonitorEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DISystemMonitorEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DISystemMonitorEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DISystemMonitorEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DISystemMonitorEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DISystemMonitorEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  #def queryPerformanceCounter(lpPerformanceCount : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL
    #C.QueryPerformanceCounter(lpPerformanceCount)
  #end

  #def queryPerformanceFrequency(lpFrequency : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL
    #C.QueryPerformanceFrequency(lpFrequency)
  #end

  def installPerfDllW(szComputerName : Win32cr::Foundation::PWSTR, lpIniFile : Win32cr::Foundation::PWSTR, dwFlags : LibC::UIntPtrT) : UInt32
    C.InstallPerfDllW(szComputerName, lpIniFile, dwFlags)
  end

  def installPerfDllA(szComputerName : Win32cr::Foundation::PSTR, lpIniFile : Win32cr::Foundation::PSTR, dwFlags : LibC::UIntPtrT) : UInt32
    C.InstallPerfDllA(szComputerName, lpIniFile, dwFlags)
  end

  def loadPerfCounterTextStringsA(lpCommandLine : Win32cr::Foundation::PSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32
    C.LoadPerfCounterTextStringsA(lpCommandLine, bQuietModeArg)
  end

  def loadPerfCounterTextStringsW(lpCommandLine : Win32cr::Foundation::PWSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32
    C.LoadPerfCounterTextStringsW(lpCommandLine, bQuietModeArg)
  end

  def unloadPerfCounterTextStringsW(lpCommandLine : Win32cr::Foundation::PWSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32
    C.UnloadPerfCounterTextStringsW(lpCommandLine, bQuietModeArg)
  end

  def unloadPerfCounterTextStringsA(lpCommandLine : Win32cr::Foundation::PSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32
    C.UnloadPerfCounterTextStringsA(lpCommandLine, bQuietModeArg)
  end

  def updatePerfNameFilesA(szNewCtrFilePath : Win32cr::Foundation::PSTR, szNewHlpFilePath : Win32cr::Foundation::PSTR, szLanguageID : Win32cr::Foundation::PSTR, dwFlags : LibC::UIntPtrT) : UInt32
    C.UpdatePerfNameFilesA(szNewCtrFilePath, szNewHlpFilePath, szLanguageID, dwFlags)
  end

  def updatePerfNameFilesW(szNewCtrFilePath : Win32cr::Foundation::PWSTR, szNewHlpFilePath : Win32cr::Foundation::PWSTR, szLanguageID : Win32cr::Foundation::PWSTR, dwFlags : LibC::UIntPtrT) : UInt32
    C.UpdatePerfNameFilesW(szNewCtrFilePath, szNewHlpFilePath, szLanguageID, dwFlags)
  end

  def setServiceAsTrustedA(szReserved : Win32cr::Foundation::PSTR, szServiceName : Win32cr::Foundation::PSTR) : UInt32
    C.SetServiceAsTrustedA(szReserved, szServiceName)
  end

  def setServiceAsTrustedW(szReserved : Win32cr::Foundation::PWSTR, szServiceName : Win32cr::Foundation::PWSTR) : UInt32
    C.SetServiceAsTrustedW(szReserved, szServiceName)
  end

  def backupPerfRegistryToFileW(szFileName : Win32cr::Foundation::PWSTR, szCommentString : Win32cr::Foundation::PWSTR) : UInt32
    C.BackupPerfRegistryToFileW(szFileName, szCommentString)
  end

  def restorePerfRegistryFromFileW(szFileName : Win32cr::Foundation::PWSTR, szLangId : Win32cr::Foundation::PWSTR) : UInt32
    C.RestorePerfRegistryFromFileW(szFileName, szLangId)
  end

  def perfStartProvider(provider_guid : LibC::GUID*, control_callback : Win32cr::System::Performance::PERFLIBREQUEST, phProvider : Win32cr::System::Performance::PerfProviderHandle*) : UInt32
    C.PerfStartProvider(provider_guid, control_callback, phProvider)
  end

  def perfStartProviderEx(provider_guid : LibC::GUID*, provider_context : Win32cr::System::Performance::PERF_PROVIDER_CONTEXT*, provider : Win32cr::System::Performance::PerfProviderHandle*) : UInt32
    C.PerfStartProviderEx(provider_guid, provider_context, provider)
  end

  def perfStopProvider(provider_handle : Win32cr::System::Performance::PerfProviderHandle) : UInt32
    C.PerfStopProvider(provider_handle)
  end

  def perfSetCounterSetInfo(provider_handle : Win32cr::Foundation::HANDLE, template : Win32cr::System::Performance::PERF_COUNTERSET_INFO*, template_size : UInt32) : UInt32
    C.PerfSetCounterSetInfo(provider_handle, template, template_size)
  end

  def perfCreateInstance(provider_handle : Win32cr::System::Performance::PerfProviderHandle, counter_set_guid : LibC::GUID*, name : Win32cr::Foundation::PWSTR, id : UInt32) : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*
    C.PerfCreateInstance(provider_handle, counter_set_guid, name, id)
  end

  def perfDeleteInstance(provider : Win32cr::System::Performance::PerfProviderHandle, instance_block : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*) : UInt32
    C.PerfDeleteInstance(provider, instance_block)
  end

  def perfQueryInstance(provider_handle : Win32cr::Foundation::HANDLE, counter_set_guid : LibC::GUID*, name : Win32cr::Foundation::PWSTR, id : UInt32) : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*
    C.PerfQueryInstance(provider_handle, counter_set_guid, name, id)
  end

  def perfSetCounterRefValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, address : Void*) : UInt32
    C.PerfSetCounterRefValue(provider, instance, counter_id, address)
  end

  def perfSetULongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt32) : UInt32
    C.PerfSetULongCounterValue(provider, instance, counter_id, value)
  end

  def perfSetULongLongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt64) : UInt32
    C.PerfSetULongLongCounterValue(provider, instance, counter_id, value)
  end

  def perfIncrementULongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt32) : UInt32
    C.PerfIncrementULongCounterValue(provider, instance, counter_id, value)
  end

  def perfIncrementULongLongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt64) : UInt32
    C.PerfIncrementULongLongCounterValue(provider, instance, counter_id, value)
  end

  def perfDecrementULongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt32) : UInt32
    C.PerfDecrementULongCounterValue(provider, instance, counter_id, value)
  end

  def perfDecrementULongLongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt64) : UInt32
    C.PerfDecrementULongLongCounterValue(provider, instance, counter_id, value)
  end

  def perfEnumerateCounterSet(szMachine : Win32cr::Foundation::PWSTR, pCounterSetIds : LibC::GUID*, cCounterSetIds : UInt32, pcCounterSetIdsActual : UInt32*) : UInt32
    C.PerfEnumerateCounterSet(szMachine, pCounterSetIds, cCounterSetIds, pcCounterSetIdsActual)
  end

  def perfEnumerateCounterSetInstances(szMachine : Win32cr::Foundation::PWSTR, pCounterSetId : LibC::GUID*, pInstances : Win32cr::System::Performance::PERF_INSTANCE_HEADER*, cbInstances : UInt32, pcbInstancesActual : UInt32*) : UInt32
    C.PerfEnumerateCounterSetInstances(szMachine, pCounterSetId, pInstances, cbInstances, pcbInstancesActual)
  end

  def perfQueryCounterSetRegistrationInfo(szMachine : Win32cr::Foundation::PWSTR, pCounterSetId : LibC::GUID*, requestCode : Win32cr::System::Performance::PerfRegInfoType, requestLangId : UInt32, pbRegInfo : UInt8*, cbRegInfo : UInt32, pcbRegInfoActual : UInt32*) : UInt32
    C.PerfQueryCounterSetRegistrationInfo(szMachine, pCounterSetId, requestCode, requestLangId, pbRegInfo, cbRegInfo, pcbRegInfoActual)
  end

  def perfOpenQueryHandle(szMachine : Win32cr::Foundation::PWSTR, phQuery : Win32cr::System::Performance::PerfQueryHandle*) : UInt32
    C.PerfOpenQueryHandle(szMachine, phQuery)
  end

  def perfCloseQueryHandle(hQuery : Win32cr::Foundation::HANDLE) : UInt32
    C.PerfCloseQueryHandle(hQuery)
  end

  def perfQueryCounterInfo(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounters : Win32cr::System::Performance::PERF_COUNTER_IDENTIFIER*, cbCounters : UInt32, pcbCountersActual : UInt32*) : UInt32
    C.PerfQueryCounterInfo(hQuery, pCounters, cbCounters, pcbCountersActual)
  end

  def perfQueryCounterData(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounterBlock : Win32cr::System::Performance::PERF_DATA_HEADER*, cbCounterBlock : UInt32, pcbCounterBlockActual : UInt32*) : UInt32
    C.PerfQueryCounterData(hQuery, pCounterBlock, cbCounterBlock, pcbCounterBlockActual)
  end

  def perfAddCounters(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounters : Win32cr::System::Performance::PERF_COUNTER_IDENTIFIER*, cbCounters : UInt32) : UInt32
    C.PerfAddCounters(hQuery, pCounters, cbCounters)
  end

  def perfDeleteCounters(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounters : Win32cr::System::Performance::PERF_COUNTER_IDENTIFIER*, cbCounters : UInt32) : UInt32
    C.PerfDeleteCounters(hQuery, pCounters, cbCounters)
  end

  def pdhGetDllVersion(lpdwVersion : Win32cr::System::Performance::PDH_DLL_VERSION*) : Int32
    C.PdhGetDllVersion(lpdwVersion)
  end

  def pdhOpenQueryW(szDataSource : Win32cr::Foundation::PWSTR, dwUserData : LibC::UIntPtrT, phQuery : LibC::IntPtrT*) : Int32
    C.PdhOpenQueryW(szDataSource, dwUserData, phQuery)
  end

  def pdhOpenQueryA(szDataSource : Win32cr::Foundation::PSTR, dwUserData : LibC::UIntPtrT, phQuery : LibC::IntPtrT*) : Int32
    C.PdhOpenQueryA(szDataSource, dwUserData, phQuery)
  end

  def pdhAddCounterW(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PWSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32
    C.PdhAddCounterW(hQuery, szFullCounterPath, dwUserData, phCounter)
  end

  def pdhAddCounterA(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32
    C.PdhAddCounterA(hQuery, szFullCounterPath, dwUserData, phCounter)
  end

  def pdhAddEnglishCounterW(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PWSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32
    C.PdhAddEnglishCounterW(hQuery, szFullCounterPath, dwUserData, phCounter)
  end

  def pdhAddEnglishCounterA(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32
    C.PdhAddEnglishCounterA(hQuery, szFullCounterPath, dwUserData, phCounter)
  end

  def pdhCollectQueryDataWithTime(hQuery : LibC::IntPtrT, pllTimeStamp : Int64*) : Int32
    C.PdhCollectQueryDataWithTime(hQuery, pllTimeStamp)
  end

  def pdhValidatePathExW(hDataSource : LibC::IntPtrT, szFullPathBuffer : Win32cr::Foundation::PWSTR) : Int32
    C.PdhValidatePathExW(hDataSource, szFullPathBuffer)
  end

  def pdhValidatePathExA(hDataSource : LibC::IntPtrT, szFullPathBuffer : Win32cr::Foundation::PSTR) : Int32
    C.PdhValidatePathExA(hDataSource, szFullPathBuffer)
  end

  def pdhRemoveCounter(hCounter : LibC::IntPtrT) : Int32
    C.PdhRemoveCounter(hCounter)
  end

  def pdhCollectQueryData(hQuery : LibC::IntPtrT) : Int32
    C.PdhCollectQueryData(hQuery)
  end

  def pdhCloseQuery(hQuery : LibC::IntPtrT) : Int32
    C.PdhCloseQuery(hQuery)
  end

  def pdhGetFormattedCounterValue(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, lpdwType : UInt32*, pValue : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE*) : Int32
    C.PdhGetFormattedCounterValue(hCounter, dwFormat, lpdwType, pValue)
  end

  def pdhGetFormattedCounterArrayA(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE_ITEM_A*) : Int32
    C.PdhGetFormattedCounterArrayA(hCounter, dwFormat, lpdwBufferSize, lpdwItemCount, item_buffer)
  end

  def pdhGetFormattedCounterArrayW(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE_ITEM_W*) : Int32
    C.PdhGetFormattedCounterArrayW(hCounter, dwFormat, lpdwBufferSize, lpdwItemCount, item_buffer)
  end

  def pdhGetRawCounterValue(hCounter : LibC::IntPtrT, lpdwType : UInt32*, pValue : Win32cr::System::Performance::PDH_RAW_COUNTER*) : Int32
    C.PdhGetRawCounterValue(hCounter, lpdwType, pValue)
  end

  def pdhGetRawCounterArrayA(hCounter : LibC::IntPtrT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_RAW_COUNTER_ITEM_A*) : Int32
    C.PdhGetRawCounterArrayA(hCounter, lpdwBufferSize, lpdwItemCount, item_buffer)
  end

  def pdhGetRawCounterArrayW(hCounter : LibC::IntPtrT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_RAW_COUNTER_ITEM_W*) : Int32
    C.PdhGetRawCounterArrayW(hCounter, lpdwBufferSize, lpdwItemCount, item_buffer)
  end

  def pdhCalculateCounterFromRawValue(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, rawValue1 : Win32cr::System::Performance::PDH_RAW_COUNTER*, rawValue2 : Win32cr::System::Performance::PDH_RAW_COUNTER*, fmtValue : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE*) : Int32
    C.PdhCalculateCounterFromRawValue(hCounter, dwFormat, rawValue1, rawValue2, fmtValue)
  end

  def pdhComputeCounterStatistics(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, dwFirstEntry : UInt32, dwNumEntries : UInt32, lpRawValueArray : Win32cr::System::Performance::PDH_RAW_COUNTER*, data : Win32cr::System::Performance::PDH_STATISTICS*) : Int32
    C.PdhComputeCounterStatistics(hCounter, dwFormat, dwFirstEntry, dwNumEntries, lpRawValueArray, data)
  end

  def pdhGetCounterInfoW(hCounter : LibC::IntPtrT, bRetrieveExplainText : Win32cr::Foundation::BOOLEAN, pdwBufferSize : UInt32*, lpBuffer : Win32cr::System::Performance::PDH_COUNTER_INFO_W*) : Int32
    C.PdhGetCounterInfoW(hCounter, bRetrieveExplainText, pdwBufferSize, lpBuffer)
  end

  def pdhGetCounterInfoA(hCounter : LibC::IntPtrT, bRetrieveExplainText : Win32cr::Foundation::BOOLEAN, pdwBufferSize : UInt32*, lpBuffer : Win32cr::System::Performance::PDH_COUNTER_INFO_A*) : Int32
    C.PdhGetCounterInfoA(hCounter, bRetrieveExplainText, pdwBufferSize, lpBuffer)
  end

  def pdhSetCounterScaleFactor(hCounter : LibC::IntPtrT, lFactor : Int32) : Int32
    C.PdhSetCounterScaleFactor(hCounter, lFactor)
  end

  def pdhConnectMachineW(szMachineName : Win32cr::Foundation::PWSTR) : Int32
    C.PdhConnectMachineW(szMachineName)
  end

  def pdhConnectMachineA(szMachineName : Win32cr::Foundation::PSTR) : Int32
    C.PdhConnectMachineA(szMachineName)
  end

  def pdhEnumMachinesW(szDataSource : Win32cr::Foundation::PWSTR, mszMachineList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhEnumMachinesW(szDataSource, mszMachineList, pcchBufferSize)
  end

  def pdhEnumMachinesA(szDataSource : Win32cr::Foundation::PSTR, mszMachineList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhEnumMachinesA(szDataSource, mszMachineList, pcchBufferSize)
  end

  def pdhEnumObjectsW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, mszObjectList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32
    C.PdhEnumObjectsW(szDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh)
  end

  def pdhEnumObjectsA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, mszObjectList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32
    C.PdhEnumObjectsA(szDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh)
  end

  def pdhEnumObjectItemsW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, mszCounterList : Win32cr::Foundation::PWSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PWSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32
    C.PdhEnumObjectItemsW(szDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags)
  end

  def pdhEnumObjectItemsA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, mszCounterList : Win32cr::Foundation::PSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32
    C.PdhEnumObjectItemsA(szDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags)
  end

  def pdhMakeCounterPathW(pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_W*, szFullPathBuffer : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*, dwFlags : Win32cr::System::Performance::PDH_PATH_FLAGS) : Int32
    C.PdhMakeCounterPathW(pCounterPathElements, szFullPathBuffer, pcchBufferSize, dwFlags)
  end

  def pdhMakeCounterPathA(pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_A*, szFullPathBuffer : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*, dwFlags : Win32cr::System::Performance::PDH_PATH_FLAGS) : Int32
    C.PdhMakeCounterPathA(pCounterPathElements, szFullPathBuffer, pcchBufferSize, dwFlags)
  end

  def pdhParseCounterPathW(szFullPathBuffer : Win32cr::Foundation::PWSTR, pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_W*, pdwBufferSize : UInt32*, dwFlags : UInt32) : Int32
    C.PdhParseCounterPathW(szFullPathBuffer, pCounterPathElements, pdwBufferSize, dwFlags)
  end

  def pdhParseCounterPathA(szFullPathBuffer : Win32cr::Foundation::PSTR, pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_A*, pdwBufferSize : UInt32*, dwFlags : UInt32) : Int32
    C.PdhParseCounterPathA(szFullPathBuffer, pCounterPathElements, pdwBufferSize, dwFlags)
  end

  def pdhParseInstanceNameW(szInstanceString : Win32cr::Foundation::PWSTR, szInstanceName : Win32cr::Foundation::PWSTR, pcchInstanceNameLength : UInt32*, szParentName : Win32cr::Foundation::PWSTR, pcchParentNameLength : UInt32*, lpIndex : UInt32*) : Int32
    C.PdhParseInstanceNameW(szInstanceString, szInstanceName, pcchInstanceNameLength, szParentName, pcchParentNameLength, lpIndex)
  end

  def pdhParseInstanceNameA(szInstanceString : Win32cr::Foundation::PSTR, szInstanceName : Win32cr::Foundation::PSTR, pcchInstanceNameLength : UInt32*, szParentName : Win32cr::Foundation::PSTR, pcchParentNameLength : UInt32*, lpIndex : UInt32*) : Int32
    C.PdhParseInstanceNameA(szInstanceString, szInstanceName, pcchInstanceNameLength, szParentName, pcchParentNameLength, lpIndex)
  end

  def pdhValidatePathW(szFullPathBuffer : Win32cr::Foundation::PWSTR) : Int32
    C.PdhValidatePathW(szFullPathBuffer)
  end

  def pdhValidatePathA(szFullPathBuffer : Win32cr::Foundation::PSTR) : Int32
    C.PdhValidatePathA(szFullPathBuffer)
  end

  def pdhGetDefaultPerfObjectW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, szDefaultObjectName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfObjectW(szDataSource, szMachineName, szDefaultObjectName, pcchBufferSize)
  end

  def pdhGetDefaultPerfObjectA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, szDefaultObjectName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfObjectA(szDataSource, szMachineName, szDefaultObjectName, pcchBufferSize)
  end

  def pdhGetDefaultPerfCounterW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szDefaultCounterName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfCounterW(szDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize)
  end

  def pdhGetDefaultPerfCounterA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, szDefaultCounterName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfCounterA(szDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize)
  end

  def pdhBrowseCountersW(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_W*) : Int32
    C.PdhBrowseCountersW(pBrowseDlgData)
  end

  def pdhBrowseCountersA(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_A*) : Int32
    C.PdhBrowseCountersA(pBrowseDlgData)
  end

  def pdhExpandCounterPathW(szWildCardPath : Win32cr::Foundation::PWSTR, mszExpandedPathList : Win32cr::Foundation::PWSTR, pcchPathListLength : UInt32*) : Int32
    C.PdhExpandCounterPathW(szWildCardPath, mszExpandedPathList, pcchPathListLength)
  end

  def pdhExpandCounterPathA(szWildCardPath : Win32cr::Foundation::PSTR, mszExpandedPathList : Win32cr::Foundation::PSTR, pcchPathListLength : UInt32*) : Int32
    C.PdhExpandCounterPathA(szWildCardPath, mszExpandedPathList, pcchPathListLength)
  end

  def pdhLookupPerfNameByIndexW(szMachineName : Win32cr::Foundation::PWSTR, dwNameIndex : UInt32, szNameBuffer : Win32cr::Foundation::PWSTR, pcchNameBufferSize : UInt32*) : Int32
    C.PdhLookupPerfNameByIndexW(szMachineName, dwNameIndex, szNameBuffer, pcchNameBufferSize)
  end

  def pdhLookupPerfNameByIndexA(szMachineName : Win32cr::Foundation::PSTR, dwNameIndex : UInt32, szNameBuffer : Win32cr::Foundation::PSTR, pcchNameBufferSize : UInt32*) : Int32
    C.PdhLookupPerfNameByIndexA(szMachineName, dwNameIndex, szNameBuffer, pcchNameBufferSize)
  end

  def pdhLookupPerfIndexByNameW(szMachineName : Win32cr::Foundation::PWSTR, szNameBuffer : Win32cr::Foundation::PWSTR, pdwIndex : UInt32*) : Int32
    C.PdhLookupPerfIndexByNameW(szMachineName, szNameBuffer, pdwIndex)
  end

  def pdhLookupPerfIndexByNameA(szMachineName : Win32cr::Foundation::PSTR, szNameBuffer : Win32cr::Foundation::PSTR, pdwIndex : UInt32*) : Int32
    C.PdhLookupPerfIndexByNameA(szMachineName, szNameBuffer, pdwIndex)
  end

  def pdhExpandWildCardPathA(szDataSource : Win32cr::Foundation::PSTR, szWildCardPath : Win32cr::Foundation::PSTR, mszExpandedPathList : Win32cr::Foundation::PSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32
    C.PdhExpandWildCardPathA(szDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags)
  end

  def pdhExpandWildCardPathW(szDataSource : Win32cr::Foundation::PWSTR, szWildCardPath : Win32cr::Foundation::PWSTR, mszExpandedPathList : Win32cr::Foundation::PWSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32
    C.PdhExpandWildCardPathW(szDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags)
  end

  def pdhOpenLogW(szLogFileName : Win32cr::Foundation::PWSTR, dwAccessFlags : Win32cr::System::Performance::PDH_LOG, lpdwLogType : Win32cr::System::Performance::PDH_LOG_TYPE*, hQuery : LibC::IntPtrT, dwMaxSize : UInt32, szUserCaption : Win32cr::Foundation::PWSTR, phLog : LibC::IntPtrT*) : Int32
    C.PdhOpenLogW(szLogFileName, dwAccessFlags, lpdwLogType, hQuery, dwMaxSize, szUserCaption, phLog)
  end

  def pdhOpenLogA(szLogFileName : Win32cr::Foundation::PSTR, dwAccessFlags : Win32cr::System::Performance::PDH_LOG, lpdwLogType : Win32cr::System::Performance::PDH_LOG_TYPE*, hQuery : LibC::IntPtrT, dwMaxSize : UInt32, szUserCaption : Win32cr::Foundation::PSTR, phLog : LibC::IntPtrT*) : Int32
    C.PdhOpenLogA(szLogFileName, dwAccessFlags, lpdwLogType, hQuery, dwMaxSize, szUserCaption, phLog)
  end

  def pdhUpdateLogW(hLog : LibC::IntPtrT, szUserString : Win32cr::Foundation::PWSTR) : Int32
    C.PdhUpdateLogW(hLog, szUserString)
  end

  def pdhUpdateLogA(hLog : LibC::IntPtrT, szUserString : Win32cr::Foundation::PSTR) : Int32
    C.PdhUpdateLogA(hLog, szUserString)
  end

  def pdhUpdateLogFileCatalog(hLog : LibC::IntPtrT) : Int32
    C.PdhUpdateLogFileCatalog(hLog)
  end

  def pdhGetLogFileSize(hLog : LibC::IntPtrT, llSize : Int64*) : Int32
    C.PdhGetLogFileSize(hLog, llSize)
  end

  def pdhCloseLog(hLog : LibC::IntPtrT, dwFlags : UInt32) : Int32
    C.PdhCloseLog(hLog, dwFlags)
  end

  def pdhSelectDataSourceW(hWndOwner : Win32cr::Foundation::HWND, dwFlags : Win32cr::System::Performance::PDH_SELECT_DATA_SOURCE_FLAGS, szDataSource : Win32cr::Foundation::PWSTR, pcchBufferLength : UInt32*) : Int32
    C.PdhSelectDataSourceW(hWndOwner, dwFlags, szDataSource, pcchBufferLength)
  end

  def pdhSelectDataSourceA(hWndOwner : Win32cr::Foundation::HWND, dwFlags : Win32cr::System::Performance::PDH_SELECT_DATA_SOURCE_FLAGS, szDataSource : Win32cr::Foundation::PSTR, pcchBufferLength : UInt32*) : Int32
    C.PdhSelectDataSourceA(hWndOwner, dwFlags, szDataSource, pcchBufferLength)
  end

  def pdhIsRealTimeQuery(hQuery : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.PdhIsRealTimeQuery(hQuery)
  end

  def pdhSetQueryTimeRange(hQuery : LibC::IntPtrT, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*) : Int32
    C.PdhSetQueryTimeRange(hQuery, pInfo)
  end

  def pdhGetDataSourceTimeRangeW(szDataSource : Win32cr::Foundation::PWSTR, pdwNumEntries : UInt32*, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*, pdwBufferSize : UInt32*) : Int32
    C.PdhGetDataSourceTimeRangeW(szDataSource, pdwNumEntries, pInfo, pdwBufferSize)
  end

  def pdhGetDataSourceTimeRangeA(szDataSource : Win32cr::Foundation::PSTR, pdwNumEntries : UInt32*, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*, pdwBufferSize : UInt32*) : Int32
    C.PdhGetDataSourceTimeRangeA(szDataSource, pdwNumEntries, pInfo, pdwBufferSize)
  end

  def pdhCollectQueryDataEx(hQuery : LibC::IntPtrT, dwIntervalTime : UInt32, hNewDataEvent : Win32cr::Foundation::HANDLE) : Int32
    C.PdhCollectQueryDataEx(hQuery, dwIntervalTime, hNewDataEvent)
  end

  def pdhFormatFromRawValue(dwCounterType : UInt32, dwFormat : Win32cr::System::Performance::PDH_FMT, pTimeBase : Int64*, pRawValue1 : Win32cr::System::Performance::PDH_RAW_COUNTER*, pRawValue2 : Win32cr::System::Performance::PDH_RAW_COUNTER*, pFmtValue : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE*) : Int32
    C.PdhFormatFromRawValue(dwCounterType, dwFormat, pTimeBase, pRawValue1, pRawValue2, pFmtValue)
  end

  def pdhGetCounterTimeBase(hCounter : LibC::IntPtrT, pTimeBase : Int64*) : Int32
    C.PdhGetCounterTimeBase(hCounter, pTimeBase)
  end

  def pdhReadRawLogRecord(hLog : LibC::IntPtrT, ftRecord : Win32cr::Foundation::FILETIME, pRawLogRecord : Win32cr::System::Performance::PDH_RAW_LOG_RECORD*, pdwBufferLength : UInt32*) : Int32
    C.PdhReadRawLogRecord(hLog, ftRecord, pRawLogRecord, pdwBufferLength)
  end

  def pdhSetDefaultRealTimeDataSource(dwDataSourceId : Win32cr::System::Performance::REAL_TIME_DATA_SOURCE_ID_FLAGS) : Int32
    C.PdhSetDefaultRealTimeDataSource(dwDataSourceId)
  end

  def pdhBindInputDataSourceW(phDataSource : LibC::IntPtrT*, log_file_name_list : Win32cr::Foundation::PWSTR) : Int32
    C.PdhBindInputDataSourceW(phDataSource, log_file_name_list)
  end

  def pdhBindInputDataSourceA(phDataSource : LibC::IntPtrT*, log_file_name_list : Win32cr::Foundation::PSTR) : Int32
    C.PdhBindInputDataSourceA(phDataSource, log_file_name_list)
  end

  def pdhOpenQueryH(hDataSource : LibC::IntPtrT, dwUserData : LibC::UIntPtrT, phQuery : LibC::IntPtrT*) : Int32
    C.PdhOpenQueryH(hDataSource, dwUserData, phQuery)
  end

  def pdhEnumMachinesHW(hDataSource : LibC::IntPtrT, mszMachineList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhEnumMachinesHW(hDataSource, mszMachineList, pcchBufferSize)
  end

  def pdhEnumMachinesHA(hDataSource : LibC::IntPtrT, mszMachineList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhEnumMachinesHA(hDataSource, mszMachineList, pcchBufferSize)
  end

  def pdhEnumObjectsHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, mszObjectList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32
    C.PdhEnumObjectsHW(hDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh)
  end

  def pdhEnumObjectsHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, mszObjectList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32
    C.PdhEnumObjectsHA(hDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh)
  end

  def pdhEnumObjectItemsHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, mszCounterList : Win32cr::Foundation::PWSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PWSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32
    C.PdhEnumObjectItemsHW(hDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags)
  end

  def pdhEnumObjectItemsHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, mszCounterList : Win32cr::Foundation::PSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32
    C.PdhEnumObjectItemsHA(hDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags)
  end

  def pdhExpandWildCardPathHW(hDataSource : LibC::IntPtrT, szWildCardPath : Win32cr::Foundation::PWSTR, mszExpandedPathList : Win32cr::Foundation::PWSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32
    C.PdhExpandWildCardPathHW(hDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags)
  end

  def pdhExpandWildCardPathHA(hDataSource : LibC::IntPtrT, szWildCardPath : Win32cr::Foundation::PSTR, mszExpandedPathList : Win32cr::Foundation::PSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32
    C.PdhExpandWildCardPathHA(hDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags)
  end

  def pdhGetDataSourceTimeRangeH(hDataSource : LibC::IntPtrT, pdwNumEntries : UInt32*, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*, pdwBufferSize : UInt32*) : Int32
    C.PdhGetDataSourceTimeRangeH(hDataSource, pdwNumEntries, pInfo, pdwBufferSize)
  end

  def pdhGetDefaultPerfObjectHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, szDefaultObjectName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfObjectHW(hDataSource, szMachineName, szDefaultObjectName, pcchBufferSize)
  end

  def pdhGetDefaultPerfObjectHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, szDefaultObjectName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfObjectHA(hDataSource, szMachineName, szDefaultObjectName, pcchBufferSize)
  end

  def pdhGetDefaultPerfCounterHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szDefaultCounterName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfCounterHW(hDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize)
  end

  def pdhGetDefaultPerfCounterHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, szDefaultCounterName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32
    C.PdhGetDefaultPerfCounterHA(hDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize)
  end

  def pdhBrowseCountersHW(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_HW*) : Int32
    C.PdhBrowseCountersHW(pBrowseDlgData)
  end

  def pdhBrowseCountersHA(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_HA*) : Int32
    C.PdhBrowseCountersHA(pBrowseDlgData)
  end

  def pdhVerifySQLDBW(szDataSource : Win32cr::Foundation::PWSTR) : Int32
    C.PdhVerifySQLDBW(szDataSource)
  end

  def pdhVerifySQLDBA(szDataSource : Win32cr::Foundation::PSTR) : Int32
    C.PdhVerifySQLDBA(szDataSource)
  end

  def pdhCreateSQLTablesW(szDataSource : Win32cr::Foundation::PWSTR) : Int32
    C.PdhCreateSQLTablesW(szDataSource)
  end

  def pdhCreateSQLTablesA(szDataSource : Win32cr::Foundation::PSTR) : Int32
    C.PdhCreateSQLTablesA(szDataSource)
  end

  def pdhEnumLogSetNamesW(szDataSource : Win32cr::Foundation::PWSTR, mszDataSetNameList : Win32cr::Foundation::PWSTR, pcchBufferLength : UInt32*) : Int32
    C.PdhEnumLogSetNamesW(szDataSource, mszDataSetNameList, pcchBufferLength)
  end

  def pdhEnumLogSetNamesA(szDataSource : Win32cr::Foundation::PSTR, mszDataSetNameList : Win32cr::Foundation::PSTR, pcchBufferLength : UInt32*) : Int32
    C.PdhEnumLogSetNamesA(szDataSource, mszDataSetNameList, pcchBufferLength)
  end

  def pdhGetLogSetGUID(hLog : LibC::IntPtrT, pGuid : LibC::GUID*, pRunId : Int32*) : Int32
    C.PdhGetLogSetGUID(hLog, pGuid, pRunId)
  end

  def pdhSetLogSetRunID(hLog : LibC::IntPtrT, run_id : Int32) : Int32
    C.PdhSetLogSetRunID(hLog, run_id)
  end

  @[Link("kernel32")]
  @[Link("loadperf")]
  @[Link("advapi32")]
  @[Link("pdh")]
  lib C
    # Commented out due to being part of LibC
    # :nodoc:
    #fun QueryPerformanceCounter(lpPerformanceCount : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun QueryPerformanceFrequency(lpFrequency : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InstallPerfDllW(szComputerName : Win32cr::Foundation::PWSTR, lpIniFile : Win32cr::Foundation::PWSTR, dwFlags : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun InstallPerfDllA(szComputerName : Win32cr::Foundation::PSTR, lpIniFile : Win32cr::Foundation::PSTR, dwFlags : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun LoadPerfCounterTextStringsA(lpCommandLine : Win32cr::Foundation::PSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun LoadPerfCounterTextStringsW(lpCommandLine : Win32cr::Foundation::PWSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun UnloadPerfCounterTextStringsW(lpCommandLine : Win32cr::Foundation::PWSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun UnloadPerfCounterTextStringsA(lpCommandLine : Win32cr::Foundation::PSTR, bQuietModeArg : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun UpdatePerfNameFilesA(szNewCtrFilePath : Win32cr::Foundation::PSTR, szNewHlpFilePath : Win32cr::Foundation::PSTR, szLanguageID : Win32cr::Foundation::PSTR, dwFlags : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun UpdatePerfNameFilesW(szNewCtrFilePath : Win32cr::Foundation::PWSTR, szNewHlpFilePath : Win32cr::Foundation::PWSTR, szLanguageID : Win32cr::Foundation::PWSTR, dwFlags : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun SetServiceAsTrustedA(szReserved : Win32cr::Foundation::PSTR, szServiceName : Win32cr::Foundation::PSTR) : UInt32

    # :nodoc:
    fun SetServiceAsTrustedW(szReserved : Win32cr::Foundation::PWSTR, szServiceName : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun BackupPerfRegistryToFileW(szFileName : Win32cr::Foundation::PWSTR, szCommentString : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun RestorePerfRegistryFromFileW(szFileName : Win32cr::Foundation::PWSTR, szLangId : Win32cr::Foundation::PWSTR) : UInt32

    # :nodoc:
    fun PerfStartProvider(provider_guid : LibC::GUID*, control_callback : Win32cr::System::Performance::PERFLIBREQUEST, phProvider : Win32cr::System::Performance::PerfProviderHandle*) : UInt32

    # :nodoc:
    fun PerfStartProviderEx(provider_guid : LibC::GUID*, provider_context : Win32cr::System::Performance::PERF_PROVIDER_CONTEXT*, provider : Win32cr::System::Performance::PerfProviderHandle*) : UInt32

    # :nodoc:
    fun PerfStopProvider(provider_handle : Win32cr::System::Performance::PerfProviderHandle) : UInt32

    # :nodoc:
    fun PerfSetCounterSetInfo(provider_handle : Win32cr::Foundation::HANDLE, template : Win32cr::System::Performance::PERF_COUNTERSET_INFO*, template_size : UInt32) : UInt32

    # :nodoc:
    fun PerfCreateInstance(provider_handle : Win32cr::System::Performance::PerfProviderHandle, counter_set_guid : LibC::GUID*, name : Win32cr::Foundation::PWSTR, id : UInt32) : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*

    # :nodoc:
    fun PerfDeleteInstance(provider : Win32cr::System::Performance::PerfProviderHandle, instance_block : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*) : UInt32

    # :nodoc:
    fun PerfQueryInstance(provider_handle : Win32cr::Foundation::HANDLE, counter_set_guid : LibC::GUID*, name : Win32cr::Foundation::PWSTR, id : UInt32) : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*

    # :nodoc:
    fun PerfSetCounterRefValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, address : Void*) : UInt32

    # :nodoc:
    fun PerfSetULongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt32) : UInt32

    # :nodoc:
    fun PerfSetULongLongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt64) : UInt32

    # :nodoc:
    fun PerfIncrementULongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt32) : UInt32

    # :nodoc:
    fun PerfIncrementULongLongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt64) : UInt32

    # :nodoc:
    fun PerfDecrementULongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt32) : UInt32

    # :nodoc:
    fun PerfDecrementULongLongCounterValue(provider : Win32cr::Foundation::HANDLE, instance : Win32cr::System::Performance::PERF_COUNTERSET_INSTANCE*, counter_id : UInt32, value : UInt64) : UInt32

    # :nodoc:
    fun PerfEnumerateCounterSet(szMachine : Win32cr::Foundation::PWSTR, pCounterSetIds : LibC::GUID*, cCounterSetIds : UInt32, pcCounterSetIdsActual : UInt32*) : UInt32

    # :nodoc:
    fun PerfEnumerateCounterSetInstances(szMachine : Win32cr::Foundation::PWSTR, pCounterSetId : LibC::GUID*, pInstances : Win32cr::System::Performance::PERF_INSTANCE_HEADER*, cbInstances : UInt32, pcbInstancesActual : UInt32*) : UInt32

    # :nodoc:
    fun PerfQueryCounterSetRegistrationInfo(szMachine : Win32cr::Foundation::PWSTR, pCounterSetId : LibC::GUID*, requestCode : Win32cr::System::Performance::PerfRegInfoType, requestLangId : UInt32, pbRegInfo : UInt8*, cbRegInfo : UInt32, pcbRegInfoActual : UInt32*) : UInt32

    # :nodoc:
    fun PerfOpenQueryHandle(szMachine : Win32cr::Foundation::PWSTR, phQuery : Win32cr::System::Performance::PerfQueryHandle*) : UInt32

    # :nodoc:
    fun PerfCloseQueryHandle(hQuery : Win32cr::Foundation::HANDLE) : UInt32

    # :nodoc:
    fun PerfQueryCounterInfo(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounters : Win32cr::System::Performance::PERF_COUNTER_IDENTIFIER*, cbCounters : UInt32, pcbCountersActual : UInt32*) : UInt32

    # :nodoc:
    fun PerfQueryCounterData(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounterBlock : Win32cr::System::Performance::PERF_DATA_HEADER*, cbCounterBlock : UInt32, pcbCounterBlockActual : UInt32*) : UInt32

    # :nodoc:
    fun PerfAddCounters(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounters : Win32cr::System::Performance::PERF_COUNTER_IDENTIFIER*, cbCounters : UInt32) : UInt32

    # :nodoc:
    fun PerfDeleteCounters(hQuery : Win32cr::System::Performance::PerfQueryHandle, pCounters : Win32cr::System::Performance::PERF_COUNTER_IDENTIFIER*, cbCounters : UInt32) : UInt32

    # :nodoc:
    fun PdhGetDllVersion(lpdwVersion : Win32cr::System::Performance::PDH_DLL_VERSION*) : Int32

    # :nodoc:
    fun PdhOpenQueryW(szDataSource : Win32cr::Foundation::PWSTR, dwUserData : LibC::UIntPtrT, phQuery : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhOpenQueryA(szDataSource : Win32cr::Foundation::PSTR, dwUserData : LibC::UIntPtrT, phQuery : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhAddCounterW(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PWSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhAddCounterA(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhAddEnglishCounterW(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PWSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhAddEnglishCounterA(hQuery : LibC::IntPtrT, szFullCounterPath : Win32cr::Foundation::PSTR, dwUserData : LibC::UIntPtrT, phCounter : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhCollectQueryDataWithTime(hQuery : LibC::IntPtrT, pllTimeStamp : Int64*) : Int32

    # :nodoc:
    fun PdhValidatePathExW(hDataSource : LibC::IntPtrT, szFullPathBuffer : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhValidatePathExA(hDataSource : LibC::IntPtrT, szFullPathBuffer : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhRemoveCounter(hCounter : LibC::IntPtrT) : Int32

    # :nodoc:
    fun PdhCollectQueryData(hQuery : LibC::IntPtrT) : Int32

    # :nodoc:
    fun PdhCloseQuery(hQuery : LibC::IntPtrT) : Int32

    # :nodoc:
    fun PdhGetFormattedCounterValue(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, lpdwType : UInt32*, pValue : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE*) : Int32

    # :nodoc:
    fun PdhGetFormattedCounterArrayA(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE_ITEM_A*) : Int32

    # :nodoc:
    fun PdhGetFormattedCounterArrayW(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE_ITEM_W*) : Int32

    # :nodoc:
    fun PdhGetRawCounterValue(hCounter : LibC::IntPtrT, lpdwType : UInt32*, pValue : Win32cr::System::Performance::PDH_RAW_COUNTER*) : Int32

    # :nodoc:
    fun PdhGetRawCounterArrayA(hCounter : LibC::IntPtrT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_RAW_COUNTER_ITEM_A*) : Int32

    # :nodoc:
    fun PdhGetRawCounterArrayW(hCounter : LibC::IntPtrT, lpdwBufferSize : UInt32*, lpdwItemCount : UInt32*, item_buffer : Win32cr::System::Performance::PDH_RAW_COUNTER_ITEM_W*) : Int32

    # :nodoc:
    fun PdhCalculateCounterFromRawValue(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, rawValue1 : Win32cr::System::Performance::PDH_RAW_COUNTER*, rawValue2 : Win32cr::System::Performance::PDH_RAW_COUNTER*, fmtValue : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE*) : Int32

    # :nodoc:
    fun PdhComputeCounterStatistics(hCounter : LibC::IntPtrT, dwFormat : Win32cr::System::Performance::PDH_FMT, dwFirstEntry : UInt32, dwNumEntries : UInt32, lpRawValueArray : Win32cr::System::Performance::PDH_RAW_COUNTER*, data : Win32cr::System::Performance::PDH_STATISTICS*) : Int32

    # :nodoc:
    fun PdhGetCounterInfoW(hCounter : LibC::IntPtrT, bRetrieveExplainText : Win32cr::Foundation::BOOLEAN, pdwBufferSize : UInt32*, lpBuffer : Win32cr::System::Performance::PDH_COUNTER_INFO_W*) : Int32

    # :nodoc:
    fun PdhGetCounterInfoA(hCounter : LibC::IntPtrT, bRetrieveExplainText : Win32cr::Foundation::BOOLEAN, pdwBufferSize : UInt32*, lpBuffer : Win32cr::System::Performance::PDH_COUNTER_INFO_A*) : Int32

    # :nodoc:
    fun PdhSetCounterScaleFactor(hCounter : LibC::IntPtrT, lFactor : Int32) : Int32

    # :nodoc:
    fun PdhConnectMachineW(szMachineName : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhConnectMachineA(szMachineName : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhEnumMachinesW(szDataSource : Win32cr::Foundation::PWSTR, mszMachineList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhEnumMachinesA(szDataSource : Win32cr::Foundation::PSTR, mszMachineList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhEnumObjectsW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, mszObjectList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32

    # :nodoc:
    fun PdhEnumObjectsA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, mszObjectList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32

    # :nodoc:
    fun PdhEnumObjectItemsW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, mszCounterList : Win32cr::Foundation::PWSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PWSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhEnumObjectItemsA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, mszCounterList : Win32cr::Foundation::PSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhMakeCounterPathW(pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_W*, szFullPathBuffer : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*, dwFlags : Win32cr::System::Performance::PDH_PATH_FLAGS) : Int32

    # :nodoc:
    fun PdhMakeCounterPathA(pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_A*, szFullPathBuffer : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*, dwFlags : Win32cr::System::Performance::PDH_PATH_FLAGS) : Int32

    # :nodoc:
    fun PdhParseCounterPathW(szFullPathBuffer : Win32cr::Foundation::PWSTR, pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_W*, pdwBufferSize : UInt32*, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhParseCounterPathA(szFullPathBuffer : Win32cr::Foundation::PSTR, pCounterPathElements : Win32cr::System::Performance::PDH_COUNTER_PATH_ELEMENTS_A*, pdwBufferSize : UInt32*, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhParseInstanceNameW(szInstanceString : Win32cr::Foundation::PWSTR, szInstanceName : Win32cr::Foundation::PWSTR, pcchInstanceNameLength : UInt32*, szParentName : Win32cr::Foundation::PWSTR, pcchParentNameLength : UInt32*, lpIndex : UInt32*) : Int32

    # :nodoc:
    fun PdhParseInstanceNameA(szInstanceString : Win32cr::Foundation::PSTR, szInstanceName : Win32cr::Foundation::PSTR, pcchInstanceNameLength : UInt32*, szParentName : Win32cr::Foundation::PSTR, pcchParentNameLength : UInt32*, lpIndex : UInt32*) : Int32

    # :nodoc:
    fun PdhValidatePathW(szFullPathBuffer : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhValidatePathA(szFullPathBuffer : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfObjectW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, szDefaultObjectName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfObjectA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, szDefaultObjectName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfCounterW(szDataSource : Win32cr::Foundation::PWSTR, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szDefaultCounterName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfCounterA(szDataSource : Win32cr::Foundation::PSTR, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, szDefaultCounterName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhBrowseCountersW(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_W*) : Int32

    # :nodoc:
    fun PdhBrowseCountersA(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_A*) : Int32

    # :nodoc:
    fun PdhExpandCounterPathW(szWildCardPath : Win32cr::Foundation::PWSTR, mszExpandedPathList : Win32cr::Foundation::PWSTR, pcchPathListLength : UInt32*) : Int32

    # :nodoc:
    fun PdhExpandCounterPathA(szWildCardPath : Win32cr::Foundation::PSTR, mszExpandedPathList : Win32cr::Foundation::PSTR, pcchPathListLength : UInt32*) : Int32

    # :nodoc:
    fun PdhLookupPerfNameByIndexW(szMachineName : Win32cr::Foundation::PWSTR, dwNameIndex : UInt32, szNameBuffer : Win32cr::Foundation::PWSTR, pcchNameBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhLookupPerfNameByIndexA(szMachineName : Win32cr::Foundation::PSTR, dwNameIndex : UInt32, szNameBuffer : Win32cr::Foundation::PSTR, pcchNameBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhLookupPerfIndexByNameW(szMachineName : Win32cr::Foundation::PWSTR, szNameBuffer : Win32cr::Foundation::PWSTR, pdwIndex : UInt32*) : Int32

    # :nodoc:
    fun PdhLookupPerfIndexByNameA(szMachineName : Win32cr::Foundation::PSTR, szNameBuffer : Win32cr::Foundation::PSTR, pdwIndex : UInt32*) : Int32

    # :nodoc:
    fun PdhExpandWildCardPathA(szDataSource : Win32cr::Foundation::PSTR, szWildCardPath : Win32cr::Foundation::PSTR, mszExpandedPathList : Win32cr::Foundation::PSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhExpandWildCardPathW(szDataSource : Win32cr::Foundation::PWSTR, szWildCardPath : Win32cr::Foundation::PWSTR, mszExpandedPathList : Win32cr::Foundation::PWSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhOpenLogW(szLogFileName : Win32cr::Foundation::PWSTR, dwAccessFlags : Win32cr::System::Performance::PDH_LOG, lpdwLogType : Win32cr::System::Performance::PDH_LOG_TYPE*, hQuery : LibC::IntPtrT, dwMaxSize : UInt32, szUserCaption : Win32cr::Foundation::PWSTR, phLog : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhOpenLogA(szLogFileName : Win32cr::Foundation::PSTR, dwAccessFlags : Win32cr::System::Performance::PDH_LOG, lpdwLogType : Win32cr::System::Performance::PDH_LOG_TYPE*, hQuery : LibC::IntPtrT, dwMaxSize : UInt32, szUserCaption : Win32cr::Foundation::PSTR, phLog : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhUpdateLogW(hLog : LibC::IntPtrT, szUserString : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhUpdateLogA(hLog : LibC::IntPtrT, szUserString : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhUpdateLogFileCatalog(hLog : LibC::IntPtrT) : Int32

    # :nodoc:
    fun PdhGetLogFileSize(hLog : LibC::IntPtrT, llSize : Int64*) : Int32

    # :nodoc:
    fun PdhCloseLog(hLog : LibC::IntPtrT, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhSelectDataSourceW(hWndOwner : Win32cr::Foundation::HWND, dwFlags : Win32cr::System::Performance::PDH_SELECT_DATA_SOURCE_FLAGS, szDataSource : Win32cr::Foundation::PWSTR, pcchBufferLength : UInt32*) : Int32

    # :nodoc:
    fun PdhSelectDataSourceA(hWndOwner : Win32cr::Foundation::HWND, dwFlags : Win32cr::System::Performance::PDH_SELECT_DATA_SOURCE_FLAGS, szDataSource : Win32cr::Foundation::PSTR, pcchBufferLength : UInt32*) : Int32

    # :nodoc:
    fun PdhIsRealTimeQuery(hQuery : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PdhSetQueryTimeRange(hQuery : LibC::IntPtrT, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*) : Int32

    # :nodoc:
    fun PdhGetDataSourceTimeRangeW(szDataSource : Win32cr::Foundation::PWSTR, pdwNumEntries : UInt32*, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*, pdwBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDataSourceTimeRangeA(szDataSource : Win32cr::Foundation::PSTR, pdwNumEntries : UInt32*, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*, pdwBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhCollectQueryDataEx(hQuery : LibC::IntPtrT, dwIntervalTime : UInt32, hNewDataEvent : Win32cr::Foundation::HANDLE) : Int32

    # :nodoc:
    fun PdhFormatFromRawValue(dwCounterType : UInt32, dwFormat : Win32cr::System::Performance::PDH_FMT, pTimeBase : Int64*, pRawValue1 : Win32cr::System::Performance::PDH_RAW_COUNTER*, pRawValue2 : Win32cr::System::Performance::PDH_RAW_COUNTER*, pFmtValue : Win32cr::System::Performance::PDH_FMT_COUNTERVALUE*) : Int32

    # :nodoc:
    fun PdhGetCounterTimeBase(hCounter : LibC::IntPtrT, pTimeBase : Int64*) : Int32

    # :nodoc:
    fun PdhReadRawLogRecord(hLog : LibC::IntPtrT, ftRecord : Win32cr::Foundation::FILETIME, pRawLogRecord : Win32cr::System::Performance::PDH_RAW_LOG_RECORD*, pdwBufferLength : UInt32*) : Int32

    # :nodoc:
    fun PdhSetDefaultRealTimeDataSource(dwDataSourceId : Win32cr::System::Performance::REAL_TIME_DATA_SOURCE_ID_FLAGS) : Int32

    # :nodoc:
    fun PdhBindInputDataSourceW(phDataSource : LibC::IntPtrT*, log_file_name_list : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhBindInputDataSourceA(phDataSource : LibC::IntPtrT*, log_file_name_list : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhOpenQueryH(hDataSource : LibC::IntPtrT, dwUserData : LibC::UIntPtrT, phQuery : LibC::IntPtrT*) : Int32

    # :nodoc:
    fun PdhEnumMachinesHW(hDataSource : LibC::IntPtrT, mszMachineList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhEnumMachinesHA(hDataSource : LibC::IntPtrT, mszMachineList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhEnumObjectsHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, mszObjectList : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32

    # :nodoc:
    fun PdhEnumObjectsHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, mszObjectList : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, bRefresh : Win32cr::Foundation::BOOL) : Int32

    # :nodoc:
    fun PdhEnumObjectItemsHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, mszCounterList : Win32cr::Foundation::PWSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PWSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhEnumObjectItemsHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, mszCounterList : Win32cr::Foundation::PSTR, pcchCounterListLength : UInt32*, mszInstanceList : Win32cr::Foundation::PSTR, pcchInstanceListLength : UInt32*, dwDetailLevel : Win32cr::System::Performance::PERF_DETAIL, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhExpandWildCardPathHW(hDataSource : LibC::IntPtrT, szWildCardPath : Win32cr::Foundation::PWSTR, mszExpandedPathList : Win32cr::Foundation::PWSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhExpandWildCardPathHA(hDataSource : LibC::IntPtrT, szWildCardPath : Win32cr::Foundation::PSTR, mszExpandedPathList : Win32cr::Foundation::PSTR, pcchPathListLength : UInt32*, dwFlags : UInt32) : Int32

    # :nodoc:
    fun PdhGetDataSourceTimeRangeH(hDataSource : LibC::IntPtrT, pdwNumEntries : UInt32*, pInfo : Win32cr::System::Performance::PDH_TIME_INFO*, pdwBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfObjectHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, szDefaultObjectName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfObjectHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, szDefaultObjectName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfCounterHW(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PWSTR, szObjectName : Win32cr::Foundation::PWSTR, szDefaultCounterName : Win32cr::Foundation::PWSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhGetDefaultPerfCounterHA(hDataSource : LibC::IntPtrT, szMachineName : Win32cr::Foundation::PSTR, szObjectName : Win32cr::Foundation::PSTR, szDefaultCounterName : Win32cr::Foundation::PSTR, pcchBufferSize : UInt32*) : Int32

    # :nodoc:
    fun PdhBrowseCountersHW(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_HW*) : Int32

    # :nodoc:
    fun PdhBrowseCountersHA(pBrowseDlgData : Win32cr::System::Performance::PDH_BROWSE_DLG_CONFIG_HA*) : Int32

    # :nodoc:
    fun PdhVerifySQLDBW(szDataSource : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhVerifySQLDBA(szDataSource : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhCreateSQLTablesW(szDataSource : Win32cr::Foundation::PWSTR) : Int32

    # :nodoc:
    fun PdhCreateSQLTablesA(szDataSource : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun PdhEnumLogSetNamesW(szDataSource : Win32cr::Foundation::PWSTR, mszDataSetNameList : Win32cr::Foundation::PWSTR, pcchBufferLength : UInt32*) : Int32

    # :nodoc:
    fun PdhEnumLogSetNamesA(szDataSource : Win32cr::Foundation::PSTR, mszDataSetNameList : Win32cr::Foundation::PSTR, pcchBufferLength : UInt32*) : Int32

    # :nodoc:
    fun PdhGetLogSetGUID(hLog : LibC::IntPtrT, pGuid : LibC::GUID*, pRunId : Int32*) : Int32

    # :nodoc:
    fun PdhSetLogSetRunID(hLog : LibC::IntPtrT, run_id : Int32) : Int32

  end
end