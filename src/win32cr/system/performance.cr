require "../foundation.cr"
require "../system/com.cr"
require "../system/ole.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:loadperf.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:pdh.dll")]
{% else %}
@[Link("loadperf")]
@[Link("advapi32")]
@[Link("pdh")]
{% end %}
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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collectors : UInt64
    get_duration : UInt64
    put_duration : UInt64
    get_description : UInt64
    put_description : UInt64
    get_description_unresolved : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_display_name_unresolved : UInt64
    get_keywords : UInt64
    put_keywords : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_name : UInt64
    get_output_location : UInt64
    get_root_path : UInt64
    put_root_path : UInt64
    get_segment : UInt64
    put_segment : UInt64
    get_segment_max_duration : UInt64
    put_segment_max_duration : UInt64
    get_segment_max_size : UInt64
    put_segment_max_size : UInt64
    get_serial_number : UInt64
    put_serial_number : UInt64
    get_server : UInt64
    get_status : UInt64
    get_subdirectory : UInt64
    put_subdirectory : UInt64
    get_subdirectory_format : UInt64
    put_subdirectory_format : UInt64
    get_subdirectory_format_pattern : UInt64
    put_subdirectory_format_pattern : UInt64
    get_task : UInt64
    put_task : UInt64
    get_task_run_as_self : UInt64
    put_task_run_as_self : UInt64
    get_task_arguments : UInt64
    put_task_arguments : UInt64
    get_task_user_text_arguments : UInt64
    put_task_user_text_arguments : UInt64
    get_schedules : UInt64
    get_schedules_enabled : UInt64
    put_schedules_enabled : UInt64
    get_user_account : UInt64
    get_xml : UInt64
    get_security : UInt64
    put_security : UInt64
    get_stop_on_completion : UInt64
    put_stop_on_completion : UInt64
    get_data_manager : UInt64
    set_credentials : UInt64
    query : UInt64
    commit : UInt64
    delete : UInt64
    start : UInt64
    stop : UInt64
    set_xml : UInt64
    set_value : UInt64
    get_value : UInt64
  end

  IDataCollectorSet_GUID = "03837520-098b-11d8-9414-505054503030"
  IID_IDataCollectorSet = LibC::GUID.new(0x3837520_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IDataCollectorSet
    lpVtbl : IDataCollectorSetVTbl*
  end

  struct IDataManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_check_before_running : UInt64
    put_check_before_running : UInt64
    get_min_free_disk : UInt64
    put_min_free_disk : UInt64
    get_max_size : UInt64
    put_max_size : UInt64
    get_max_folder_count : UInt64
    put_max_folder_count : UInt64
    get_resource_policy : UInt64
    put_resource_policy : UInt64
    get_folder_actions : UInt64
    get_report_schema : UInt64
    put_report_schema : UInt64
    get_report_file_name : UInt64
    put_report_file_name : UInt64
    get_rule_target_file_name : UInt64
    put_rule_target_file_name : UInt64
    get_events_file_name : UInt64
    put_events_file_name : UInt64
    get_rules : UInt64
    put_rules : UInt64
    run : UInt64
    extract : UInt64
  end

  IDataManager_GUID = "03837541-098b-11d8-9414-505054503030"
  IID_IDataManager = LibC::GUID.new(0x3837541_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IDataManager
    lpVtbl : IDataManagerVTbl*
  end

  struct IFolderActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_age : UInt64
    put_age : UInt64
    get_size : UInt64
    put_size : UInt64
    get_actions : UInt64
    put_actions : UInt64
    get_send_cab_to : UInt64
    put_send_cab_to : UInt64
  end

  IFolderAction_GUID = "03837543-098b-11d8-9414-505054503030"
  IID_IFolderAction = LibC::GUID.new(0x3837543_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IFolderAction
    lpVtbl : IFolderActionVTbl*
  end

  struct IFolderActionCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    add_range : UInt64
    create_folder_action : UInt64
  end

  IFolderActionCollection_GUID = "03837544-098b-11d8-9414-505054503030"
  IID_IFolderActionCollection = LibC::GUID.new(0x3837544_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IFolderActionCollection
    lpVtbl : IFolderActionCollectionVTbl*
  end

  struct IDataCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collector_set : UInt64
    put_data_collector_set : UInt64
    get_data_collector_type : UInt64
    get_file_name : UInt64
    put_file_name : UInt64
    get_file_name_format : UInt64
    put_file_name_format : UInt64
    get_file_name_format_pattern : UInt64
    put_file_name_format_pattern : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_log_append : UInt64
    put_log_append : UInt64
    get_log_circular : UInt64
    put_log_circular : UInt64
    get_log_overwrite : UInt64
    put_log_overwrite : UInt64
    get_name : UInt64
    put_name : UInt64
    get_output_location : UInt64
    get_index : UInt64
    put_index : UInt64
    get_xml : UInt64
    set_xml : UInt64
    create_output_location : UInt64
  end

  IDataCollector_GUID = "038374ff-098b-11d8-9414-505054503030"
  IID_IDataCollector = LibC::GUID.new(0x38374ff_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IDataCollector
    lpVtbl : IDataCollectorVTbl*
  end

  struct IPerformanceCounterDataCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collector_set : UInt64
    put_data_collector_set : UInt64
    get_data_collector_type : UInt64
    get_file_name : UInt64
    put_file_name : UInt64
    get_file_name_format : UInt64
    put_file_name_format : UInt64
    get_file_name_format_pattern : UInt64
    put_file_name_format_pattern : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_log_append : UInt64
    put_log_append : UInt64
    get_log_circular : UInt64
    put_log_circular : UInt64
    get_log_overwrite : UInt64
    put_log_overwrite : UInt64
    get_name : UInt64
    put_name : UInt64
    get_output_location : UInt64
    get_index : UInt64
    put_index : UInt64
    get_xml : UInt64
    set_xml : UInt64
    create_output_location : UInt64
    get_data_source_name : UInt64
    put_data_source_name : UInt64
    get_performance_counters : UInt64
    put_performance_counters : UInt64
    get_log_file_format : UInt64
    put_log_file_format : UInt64
    get_sample_interval : UInt64
    put_sample_interval : UInt64
    get_segment_max_records : UInt64
    put_segment_max_records : UInt64
  end

  IPerformanceCounterDataCollector_GUID = "03837506-098b-11d8-9414-505054503030"
  IID_IPerformanceCounterDataCollector = LibC::GUID.new(0x3837506_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IPerformanceCounterDataCollector
    lpVtbl : IPerformanceCounterDataCollectorVTbl*
  end

  struct ITraceDataCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collector_set : UInt64
    put_data_collector_set : UInt64
    get_data_collector_type : UInt64
    get_file_name : UInt64
    put_file_name : UInt64
    get_file_name_format : UInt64
    put_file_name_format : UInt64
    get_file_name_format_pattern : UInt64
    put_file_name_format_pattern : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_log_append : UInt64
    put_log_append : UInt64
    get_log_circular : UInt64
    put_log_circular : UInt64
    get_log_overwrite : UInt64
    put_log_overwrite : UInt64
    get_name : UInt64
    put_name : UInt64
    get_output_location : UInt64
    get_index : UInt64
    put_index : UInt64
    get_xml : UInt64
    set_xml : UInt64
    create_output_location : UInt64
    get_buffer_size : UInt64
    put_buffer_size : UInt64
    get_buffers_lost : UInt64
    put_buffers_lost : UInt64
    get_buffers_written : UInt64
    put_buffers_written : UInt64
    get_clock_type : UInt64
    put_clock_type : UInt64
    get_events_lost : UInt64
    put_events_lost : UInt64
    get_extended_modes : UInt64
    put_extended_modes : UInt64
    get_flush_timer : UInt64
    put_flush_timer : UInt64
    get_free_buffers : UInt64
    put_free_buffers : UInt64
    get_guid : UInt64
    put_guid : UInt64
    get_is_kernel_trace : UInt64
    get_maximum_buffers : UInt64
    put_maximum_buffers : UInt64
    get_minimum_buffers : UInt64
    put_minimum_buffers : UInt64
    get_number_of_buffers : UInt64
    put_number_of_buffers : UInt64
    get_preallocate_file : UInt64
    put_preallocate_file : UInt64
    get_process_mode : UInt64
    put_process_mode : UInt64
    get_real_time_buffers_lost : UInt64
    put_real_time_buffers_lost : UInt64
    get_session_id : UInt64
    put_session_id : UInt64
    get_session_name : UInt64
    put_session_name : UInt64
    get_session_thread_id : UInt64
    put_session_thread_id : UInt64
    get_stream_mode : UInt64
    put_stream_mode : UInt64
    get_trace_data_providers : UInt64
  end

  ITraceDataCollector_GUID = "0383750b-098b-11d8-9414-505054503030"
  IID_ITraceDataCollector = LibC::GUID.new(0x383750b_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct ITraceDataCollector
    lpVtbl : ITraceDataCollectorVTbl*
  end

  struct IConfigurationDataCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collector_set : UInt64
    put_data_collector_set : UInt64
    get_data_collector_type : UInt64
    get_file_name : UInt64
    put_file_name : UInt64
    get_file_name_format : UInt64
    put_file_name_format : UInt64
    get_file_name_format_pattern : UInt64
    put_file_name_format_pattern : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_log_append : UInt64
    put_log_append : UInt64
    get_log_circular : UInt64
    put_log_circular : UInt64
    get_log_overwrite : UInt64
    put_log_overwrite : UInt64
    get_name : UInt64
    put_name : UInt64
    get_output_location : UInt64
    get_index : UInt64
    put_index : UInt64
    get_xml : UInt64
    set_xml : UInt64
    create_output_location : UInt64
    get_file_max_count : UInt64
    put_file_max_count : UInt64
    get_file_max_recursive_depth : UInt64
    put_file_max_recursive_depth : UInt64
    get_file_max_total_size : UInt64
    put_file_max_total_size : UInt64
    get_files : UInt64
    put_files : UInt64
    get_management_queries : UInt64
    put_management_queries : UInt64
    get_query_network_adapters : UInt64
    put_query_network_adapters : UInt64
    get_registry_keys : UInt64
    put_registry_keys : UInt64
    get_registry_max_recursive_depth : UInt64
    put_registry_max_recursive_depth : UInt64
    get_system_state_file : UInt64
    put_system_state_file : UInt64
  end

  IConfigurationDataCollector_GUID = "03837514-098b-11d8-9414-505054503030"
  IID_IConfigurationDataCollector = LibC::GUID.new(0x3837514_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IConfigurationDataCollector
    lpVtbl : IConfigurationDataCollectorVTbl*
  end

  struct IAlertDataCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collector_set : UInt64
    put_data_collector_set : UInt64
    get_data_collector_type : UInt64
    get_file_name : UInt64
    put_file_name : UInt64
    get_file_name_format : UInt64
    put_file_name_format : UInt64
    get_file_name_format_pattern : UInt64
    put_file_name_format_pattern : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_log_append : UInt64
    put_log_append : UInt64
    get_log_circular : UInt64
    put_log_circular : UInt64
    get_log_overwrite : UInt64
    put_log_overwrite : UInt64
    get_name : UInt64
    put_name : UInt64
    get_output_location : UInt64
    get_index : UInt64
    put_index : UInt64
    get_xml : UInt64
    set_xml : UInt64
    create_output_location : UInt64
    get_alert_thresholds : UInt64
    put_alert_thresholds : UInt64
    get_event_log : UInt64
    put_event_log : UInt64
    get_sample_interval : UInt64
    put_sample_interval : UInt64
    get_task : UInt64
    put_task : UInt64
    get_task_run_as_self : UInt64
    put_task_run_as_self : UInt64
    get_task_arguments : UInt64
    put_task_arguments : UInt64
    get_task_user_text_arguments : UInt64
    put_task_user_text_arguments : UInt64
    get_trigger_data_collector_set : UInt64
    put_trigger_data_collector_set : UInt64
  end

  IAlertDataCollector_GUID = "03837516-098b-11d8-9414-505054503030"
  IID_IAlertDataCollector = LibC::GUID.new(0x3837516_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IAlertDataCollector
    lpVtbl : IAlertDataCollectorVTbl*
  end

  struct IApiTracingDataCollectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_data_collector_set : UInt64
    put_data_collector_set : UInt64
    get_data_collector_type : UInt64
    get_file_name : UInt64
    put_file_name : UInt64
    get_file_name_format : UInt64
    put_file_name_format : UInt64
    get_file_name_format_pattern : UInt64
    put_file_name_format_pattern : UInt64
    get_latest_output_location : UInt64
    put_latest_output_location : UInt64
    get_log_append : UInt64
    put_log_append : UInt64
    get_log_circular : UInt64
    put_log_circular : UInt64
    get_log_overwrite : UInt64
    put_log_overwrite : UInt64
    get_name : UInt64
    put_name : UInt64
    get_output_location : UInt64
    get_index : UInt64
    put_index : UInt64
    get_xml : UInt64
    set_xml : UInt64
    create_output_location : UInt64
    get_log_api_names_only : UInt64
    put_log_api_names_only : UInt64
    get_log_apis_recursively : UInt64
    put_log_apis_recursively : UInt64
    get_exe_path : UInt64
    put_exe_path : UInt64
    get_log_file_path : UInt64
    put_log_file_path : UInt64
    get_include_modules : UInt64
    put_include_modules : UInt64
    get_include_apis : UInt64
    put_include_apis : UInt64
    get_exclude_apis : UInt64
    put_exclude_apis : UInt64
  end

  IApiTracingDataCollector_GUID = "0383751a-098b-11d8-9414-505054503030"
  IID_IApiTracingDataCollector = LibC::GUID.new(0x383751a_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IApiTracingDataCollector
    lpVtbl : IApiTracingDataCollectorVTbl*
  end

  struct IDataCollectorCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    add_range : UInt64
    create_data_collector_from_xml : UInt64
    create_data_collector : UInt64
  end

  IDataCollectorCollection_GUID = "03837502-098b-11d8-9414-505054503030"
  IID_IDataCollectorCollection = LibC::GUID.new(0x3837502_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IDataCollectorCollection
    lpVtbl : IDataCollectorCollectionVTbl*
  end

  struct IDataCollectorSetCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    add_range : UInt64
    get_data_collector_sets : UInt64
  end

  IDataCollectorSetCollection_GUID = "03837524-098b-11d8-9414-505054503030"
  IID_IDataCollectorSetCollection = LibC::GUID.new(0x3837524_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IDataCollectorSetCollection
    lpVtbl : IDataCollectorSetCollectionVTbl*
  end

  struct ITraceDataProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_guid : UInt64
    put_guid : UInt64
    get_level : UInt64
    get_keywords_any : UInt64
    get_keywords_all : UInt64
    get_properties : UInt64
    get_filter_enabled : UInt64
    put_filter_enabled : UInt64
    get_filter_type : UInt64
    put_filter_type : UInt64
    get_filter_data : UInt64
    put_filter_data : UInt64
    query : UInt64
    resolve : UInt64
    set_security : UInt64
    get_security : UInt64
    get_registered_processes : UInt64
  end

  ITraceDataProvider_GUID = "03837512-098b-11d8-9414-505054503030"
  IID_ITraceDataProvider = LibC::GUID.new(0x3837512_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct ITraceDataProvider
    lpVtbl : ITraceDataProviderVTbl*
  end

  struct ITraceDataProviderCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    add_range : UInt64
    create_trace_data_provider : UInt64
    get_trace_data_providers : UInt64
    get_trace_data_providers_by_process : UInt64
  end

  ITraceDataProviderCollection_GUID = "03837510-098b-11d8-9414-505054503030"
  IID_ITraceDataProviderCollection = LibC::GUID.new(0x3837510_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct ITraceDataProviderCollection
    lpVtbl : ITraceDataProviderCollectionVTbl*
  end

  struct IScheduleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_start_date : UInt64
    put_start_date : UInt64
    get_end_date : UInt64
    put_end_date : UInt64
    get_start_time : UInt64
    put_start_time : UInt64
    get_days : UInt64
    put_days : UInt64
  end

  ISchedule_GUID = "0383753a-098b-11d8-9414-505054503030"
  IID_ISchedule = LibC::GUID.new(0x383753a_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct ISchedule
    lpVtbl : IScheduleVTbl*
  end

  struct IScheduleCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    add_range : UInt64
    create_schedule : UInt64
  end

  IScheduleCollection_GUID = "0383753d-098b-11d8-9414-505054503030"
  IID_IScheduleCollection = LibC::GUID.new(0x383753d_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IScheduleCollection
    lpVtbl : IScheduleCollectionVTbl*
  end

  struct IValueMapItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_description : UInt64
    put_description : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_key : UInt64
    put_key : UInt64
    get_value : UInt64
    put_value : UInt64
    get_value_map_type : UInt64
    put_value_map_type : UInt64
  end

  IValueMapItem_GUID = "03837533-098b-11d8-9414-505054503030"
  IID_IValueMapItem = LibC::GUID.new(0x3837533_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IValueMapItem
    lpVtbl : IValueMapItemVTbl*
  end

  struct IValueMapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_description : UInt64
    put_description : UInt64
    get_value : UInt64
    put_value : UInt64
    get_value_map_type : UInt64
    put_value_map_type : UInt64
    add : UInt64
    remove : UInt64
    clear : UInt64
    add_range : UInt64
    create_value_map_item : UInt64
  end

  IValueMap_GUID = "03837534-098b-11d8-9414-505054503030"
  IID_IValueMap = LibC::GUID.new(0x3837534_u32, 0x98b_u16, 0x11d8_u16, StaticArray[0x94_u8, 0x14_u8, 0x50_u8, 0x50_u8, 0x54_u8, 0x50_u8, 0x30_u8, 0x30_u8])
  struct IValueMap
    lpVtbl : IValueMapVTbl*
  end

  struct ICounterItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_value : UInt64
    put_color : UInt64
    get_color : UInt64
    put_width : UInt64
    get_width : UInt64
    put_line_style : UInt64
    get_line_style : UInt64
    put_scale_factor : UInt64
    get_scale_factor : UInt64
    get_path : UInt64
    get_value2 : UInt64
    get_statistics : UInt64
  end

  ICounterItem_GUID = "771a9520-ee28-11ce-941e-008029004347"
  IID_ICounterItem = LibC::GUID.new(0x771a9520_u32, 0xee28_u16, 0x11ce_u16, StaticArray[0x94_u8, 0x1e_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  struct ICounterItem
    lpVtbl : ICounterItemVTbl*
  end

  struct ICounterItem2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_value : UInt64
    put_color : UInt64
    get_color : UInt64
    put_width : UInt64
    get_width : UInt64
    put_line_style : UInt64
    get_line_style : UInt64
    put_scale_factor : UInt64
    get_scale_factor : UInt64
    get_path : UInt64
    get_value2 : UInt64
    get_statistics : UInt64
    put_selected : UInt64
    get_selected : UInt64
    put_visible : UInt64
    get_visible : UInt64
    get_data_at : UInt64
  end

  ICounterItem2_GUID = "eefcd4e1-ea1c-4435-b7f4-e341ba03b4f9"
  IID_ICounterItem2 = LibC::GUID.new(0xeefcd4e1_u32, 0xea1c_u16, 0x4435_u16, StaticArray[0xb7_u8, 0xf4_u8, 0xe3_u8, 0x41_u8, 0xba_u8, 0x3_u8, 0xb4_u8, 0xf9_u8])
  struct ICounterItem2
    lpVtbl : ICounterItem2VTbl*
  end

  struct IICounterItemUnionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_value : UInt64
    put_color : UInt64
    get_color : UInt64
    put_width : UInt64
    get_width : UInt64
    put_line_style : UInt64
    get_line_style : UInt64
    put_scale_factor : UInt64
    get_scale_factor : UInt64
    get_path : UInt64
    get_value2 : UInt64
    get_statistics : UInt64
    put_selected : UInt64
    get_selected : UInt64
    put_visible : UInt64
    get_visible : UInt64
    get_data_at : UInt64
  end

  IICounterItemUnion_GUID = "de1a6b74-9182-4c41-8e2c-24c2cd30ee83"
  IID_IICounterItemUnion = LibC::GUID.new(0xde1a6b74_u32, 0x9182_u16, 0x4c41_u16, StaticArray[0x8e_u8, 0x2c_u8, 0x24_u8, 0xc2_u8, 0xcd_u8, 0x30_u8, 0xee_u8, 0x83_u8])
  struct IICounterItemUnion
    lpVtbl : IICounterItemUnionVTbl*
  end

  struct DICounterItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  DICounterItem_GUID = "c08c4ff2-0e2e-11cf-942c-008029004347"
  IID_DICounterItem = LibC::GUID.new(0xc08c4ff2_u32, 0xe2e_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2c_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  struct DICounterItem
    lpVtbl : DICounterItemVTbl*
  end

  struct ICountersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    add : UInt64
    remove : UInt64
  end

  ICounters_GUID = "79167962-28fc-11cf-942f-008029004347"
  IID_ICounters = LibC::GUID.new(0x79167962_u32, 0x28fc_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x2f_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  struct ICounters
    lpVtbl : ICountersVTbl*
  end

  struct ILogFileItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_path : UInt64
  end

  ILogFileItem_GUID = "d6b518dd-05c7-418a-89e6-4f9ce8c6841e"
  IID_ILogFileItem = LibC::GUID.new(0xd6b518dd_u32, 0x5c7_u16, 0x418a_u16, StaticArray[0x89_u8, 0xe6_u8, 0x4f_u8, 0x9c_u8, 0xe8_u8, 0xc6_u8, 0x84_u8, 0x1e_u8])
  struct ILogFileItem
    lpVtbl : ILogFileItemVTbl*
  end

  struct DILogFileItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  DILogFileItem_GUID = "8d093ffc-f777-4917-82d1-833fbc54c58f"
  IID_DILogFileItem = LibC::GUID.new(0x8d093ffc_u32, 0xf777_u16, 0x4917_u16, StaticArray[0x82_u8, 0xd1_u8, 0x83_u8, 0x3f_u8, 0xbc_u8, 0x54_u8, 0xc5_u8, 0x8f_u8])
  struct DILogFileItem
    lpVtbl : DILogFileItemVTbl*
  end

  struct ILogFilesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    add : UInt64
    remove : UInt64
  end

  ILogFiles_GUID = "6a2a97e6-6851-41ea-87ad-2a8225335865"
  IID_ILogFiles = LibC::GUID.new(0x6a2a97e6_u32, 0x6851_u16, 0x41ea_u16, StaticArray[0x87_u8, 0xad_u8, 0x2a_u8, 0x82_u8, 0x25_u8, 0x33_u8, 0x58_u8, 0x65_u8])
  struct ILogFiles
    lpVtbl : ILogFilesVTbl*
  end

  struct ISystemMonitorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_appearance : UInt64
    put_appearance : UInt64
    get_back_color : UInt64
    put_back_color : UInt64
    get_border_style : UInt64
    put_border_style : UInt64
    get_fore_color : UInt64
    put_fore_color : UInt64
    get_font : UInt64
    putref_font : UInt64
    get_counters : UInt64
    put_show_vertical_grid : UInt64
    get_show_vertical_grid : UInt64
    put_show_horizontal_grid : UInt64
    get_show_horizontal_grid : UInt64
    put_show_legend : UInt64
    get_show_legend : UInt64
    put_show_scale_labels : UInt64
    get_show_scale_labels : UInt64
    put_show_value_bar : UInt64
    get_show_value_bar : UInt64
    put_maximum_scale : UInt64
    get_maximum_scale : UInt64
    put_minimum_scale : UInt64
    get_minimum_scale : UInt64
    put_update_interval : UInt64
    get_update_interval : UInt64
    put_display_type : UInt64
    get_display_type : UInt64
    put_manual_update : UInt64
    get_manual_update : UInt64
    put_graph_title : UInt64
    get_graph_title : UInt64
    put_y_axis_label : UInt64
    get_y_axis_label : UInt64
    collect_sample : UInt64
    update_graph : UInt64
    browse_counters : UInt64
    display_properties : UInt64
    counter : UInt64
    add_counter : UInt64
    delete_counter : UInt64
    get_back_color_ctl : UInt64
    put_back_color_ctl : UInt64
    put_log_file_name : UInt64
    get_log_file_name : UInt64
    put_log_view_start : UInt64
    get_log_view_start : UInt64
    put_log_view_stop : UInt64
    get_log_view_stop : UInt64
    get_grid_color : UInt64
    put_grid_color : UInt64
    get_time_bar_color : UInt64
    put_time_bar_color : UInt64
    get_highlight : UInt64
    put_highlight : UInt64
    get_show_toolbar : UInt64
    put_show_toolbar : UInt64
    paste : UInt64
    copy : UInt64
    reset : UInt64
    put_read_only : UInt64
    get_read_only : UInt64
    put_report_value_type : UInt64
    get_report_value_type : UInt64
    put_monitor_duplicate_instances : UInt64
    get_monitor_duplicate_instances : UInt64
    put_display_filter : UInt64
    get_display_filter : UInt64
    get_log_files : UInt64
    put_data_source_type : UInt64
    get_data_source_type : UInt64
    put_sql_dsn_name : UInt64
    get_sql_dsn_name : UInt64
    put_sql_log_set_name : UInt64
    get_sql_log_set_name : UInt64
  end

  ISystemMonitor_GUID = "194eb241-c32c-11cf-9398-00aa00a3ddea"
  IID_ISystemMonitor = LibC::GUID.new(0x194eb241_u32, 0xc32c_u16, 0x11cf_u16, StaticArray[0x93_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
  struct ISystemMonitor
    lpVtbl : ISystemMonitorVTbl*
  end

  struct ISystemMonitor2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_appearance : UInt64
    put_appearance : UInt64
    get_back_color : UInt64
    put_back_color : UInt64
    get_border_style : UInt64
    put_border_style : UInt64
    get_fore_color : UInt64
    put_fore_color : UInt64
    get_font : UInt64
    putref_font : UInt64
    get_counters : UInt64
    put_show_vertical_grid : UInt64
    get_show_vertical_grid : UInt64
    put_show_horizontal_grid : UInt64
    get_show_horizontal_grid : UInt64
    put_show_legend : UInt64
    get_show_legend : UInt64
    put_show_scale_labels : UInt64
    get_show_scale_labels : UInt64
    put_show_value_bar : UInt64
    get_show_value_bar : UInt64
    put_maximum_scale : UInt64
    get_maximum_scale : UInt64
    put_minimum_scale : UInt64
    get_minimum_scale : UInt64
    put_update_interval : UInt64
    get_update_interval : UInt64
    put_display_type : UInt64
    get_display_type : UInt64
    put_manual_update : UInt64
    get_manual_update : UInt64
    put_graph_title : UInt64
    get_graph_title : UInt64
    put_y_axis_label : UInt64
    get_y_axis_label : UInt64
    collect_sample : UInt64
    update_graph : UInt64
    browse_counters : UInt64
    display_properties : UInt64
    counter : UInt64
    add_counter : UInt64
    delete_counter : UInt64
    get_back_color_ctl : UInt64
    put_back_color_ctl : UInt64
    put_log_file_name : UInt64
    get_log_file_name : UInt64
    put_log_view_start : UInt64
    get_log_view_start : UInt64
    put_log_view_stop : UInt64
    get_log_view_stop : UInt64
    get_grid_color : UInt64
    put_grid_color : UInt64
    get_time_bar_color : UInt64
    put_time_bar_color : UInt64
    get_highlight : UInt64
    put_highlight : UInt64
    get_show_toolbar : UInt64
    put_show_toolbar : UInt64
    paste : UInt64
    copy : UInt64
    reset : UInt64
    put_read_only : UInt64
    get_read_only : UInt64
    put_report_value_type : UInt64
    get_report_value_type : UInt64
    put_monitor_duplicate_instances : UInt64
    get_monitor_duplicate_instances : UInt64
    put_display_filter : UInt64
    get_display_filter : UInt64
    get_log_files : UInt64
    put_data_source_type : UInt64
    get_data_source_type : UInt64
    put_sql_dsn_name : UInt64
    get_sql_dsn_name : UInt64
    put_sql_log_set_name : UInt64
    get_sql_log_set_name : UInt64
    put_enable_digit_grouping : UInt64
    get_enable_digit_grouping : UInt64
    put_enable_tool_tips : UInt64
    get_enable_tool_tips : UInt64
    put_show_time_axis_labels : UInt64
    get_show_time_axis_labels : UInt64
    put_chart_scroll : UInt64
    get_chart_scroll : UInt64
    put_data_point_count : UInt64
    get_data_point_count : UInt64
    scale_to_fit : UInt64
    save_as : UInt64
    relog : UInt64
    clear_data : UInt64
    get_log_source_start_time : UInt64
    get_log_source_stop_time : UInt64
    set_log_view_range : UInt64
    get_log_view_range : UInt64
    batching_lock : UInt64
    load_settings : UInt64
  end

  ISystemMonitor2_GUID = "08e3206a-5fd2-4fde-a8a5-8cb3b63d2677"
  IID_ISystemMonitor2 = LibC::GUID.new(0x8e3206a_u32, 0x5fd2_u16, 0x4fde_u16, StaticArray[0xa8_u8, 0xa5_u8, 0x8c_u8, 0xb3_u8, 0xb6_u8, 0x3d_u8, 0x26_u8, 0x77_u8])
  struct ISystemMonitor2
    lpVtbl : ISystemMonitor2VTbl*
  end

  struct IISystemMonitorUnionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_appearance : UInt64
    put_appearance : UInt64
    get_back_color : UInt64
    put_back_color : UInt64
    get_border_style : UInt64
    put_border_style : UInt64
    get_fore_color : UInt64
    put_fore_color : UInt64
    get_font : UInt64
    putref_font : UInt64
    get_counters : UInt64
    put_show_vertical_grid : UInt64
    get_show_vertical_grid : UInt64
    put_show_horizontal_grid : UInt64
    get_show_horizontal_grid : UInt64
    put_show_legend : UInt64
    get_show_legend : UInt64
    put_show_scale_labels : UInt64
    get_show_scale_labels : UInt64
    put_show_value_bar : UInt64
    get_show_value_bar : UInt64
    put_maximum_scale : UInt64
    get_maximum_scale : UInt64
    put_minimum_scale : UInt64
    get_minimum_scale : UInt64
    put_update_interval : UInt64
    get_update_interval : UInt64
    put_display_type : UInt64
    get_display_type : UInt64
    put_manual_update : UInt64
    get_manual_update : UInt64
    put_graph_title : UInt64
    get_graph_title : UInt64
    put_y_axis_label : UInt64
    get_y_axis_label : UInt64
    collect_sample : UInt64
    update_graph : UInt64
    browse_counters : UInt64
    display_properties : UInt64
    counter : UInt64
    add_counter : UInt64
    delete_counter : UInt64
    get_back_color_ctl : UInt64
    put_back_color_ctl : UInt64
    put_log_file_name : UInt64
    get_log_file_name : UInt64
    put_log_view_start : UInt64
    get_log_view_start : UInt64
    put_log_view_stop : UInt64
    get_log_view_stop : UInt64
    get_grid_color : UInt64
    put_grid_color : UInt64
    get_time_bar_color : UInt64
    put_time_bar_color : UInt64
    get_highlight : UInt64
    put_highlight : UInt64
    get_show_toolbar : UInt64
    put_show_toolbar : UInt64
    paste : UInt64
    copy : UInt64
    reset : UInt64
    put_read_only : UInt64
    get_read_only : UInt64
    put_report_value_type : UInt64
    get_report_value_type : UInt64
    put_monitor_duplicate_instances : UInt64
    get_monitor_duplicate_instances : UInt64
    put_display_filter : UInt64
    get_display_filter : UInt64
    get_log_files : UInt64
    put_data_source_type : UInt64
    get_data_source_type : UInt64
    put_sql_dsn_name : UInt64
    get_sql_dsn_name : UInt64
    put_sql_log_set_name : UInt64
    get_sql_log_set_name : UInt64
    put_enable_digit_grouping : UInt64
    get_enable_digit_grouping : UInt64
    put_enable_tool_tips : UInt64
    get_enable_tool_tips : UInt64
    put_show_time_axis_labels : UInt64
    get_show_time_axis_labels : UInt64
    put_chart_scroll : UInt64
    get_chart_scroll : UInt64
    put_data_point_count : UInt64
    get_data_point_count : UInt64
    scale_to_fit : UInt64
    save_as : UInt64
    relog : UInt64
    clear_data : UInt64
    get_log_source_start_time : UInt64
    get_log_source_stop_time : UInt64
    set_log_view_range : UInt64
    get_log_view_range : UInt64
    batching_lock : UInt64
    load_settings : UInt64
  end

  IISystemMonitorUnion_GUID = "c8a77338-265f-4de5-aa25-c7da1ce5a8f4"
  IID_IISystemMonitorUnion = LibC::GUID.new(0xc8a77338_u32, 0x265f_u16, 0x4de5_u16, StaticArray[0xaa_u8, 0x25_u8, 0xc7_u8, 0xda_u8, 0x1c_u8, 0xe5_u8, 0xa8_u8, 0xf4_u8])
  struct IISystemMonitorUnion
    lpVtbl : IISystemMonitorUnionVTbl*
  end

  struct DISystemMonitorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  DISystemMonitor_GUID = "13d73d81-c32e-11cf-9398-00aa00a3ddea"
  IID_DISystemMonitor = LibC::GUID.new(0x13d73d81_u32, 0xc32e_u16, 0x11cf_u16, StaticArray[0x93_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
  struct DISystemMonitor
    lpVtbl : DISystemMonitorVTbl*
  end

  struct DISystemMonitorInternalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  DISystemMonitorInternal_GUID = "194eb242-c32c-11cf-9398-00aa00a3ddea"
  IID_DISystemMonitorInternal = LibC::GUID.new(0x194eb242_u32, 0xc32c_u16, 0x11cf_u16, StaticArray[0x93_u8, 0x98_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xdd_u8, 0xea_u8])
  struct DISystemMonitorInternal
    lpVtbl : DISystemMonitorInternalVTbl*
  end

  struct ISystemMonitorEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_counter_selected : UInt64
    on_counter_added : UInt64
    on_counter_deleted : UInt64
    on_sample_collected : UInt64
    on_dbl_click : UInt64
  end

  ISystemMonitorEvents_GUID = "ee660ea0-4abd-11cf-943a-008029004347"
  IID_ISystemMonitorEvents = LibC::GUID.new(0xee660ea0_u32, 0x4abd_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x3a_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
  struct ISystemMonitorEvents
    lpVtbl : ISystemMonitorEventsVTbl*
  end

  struct DISystemMonitorEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  DISystemMonitorEvents_GUID = "84979930-4ab3-11cf-943a-008029004347"
  IID_DISystemMonitorEvents = LibC::GUID.new(0x84979930_u32, 0x4ab3_u16, 0x11cf_u16, StaticArray[0x94_u8, 0x3a_u8, 0x0_u8, 0x80_u8, 0x29_u8, 0x0_u8, 0x43_u8, 0x47_u8])
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
struct LibWin32::IDataCollectorSet
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collectors(collectors : IDataCollectorCollection*) : HRESULT
    @lpVtbl.value.get_data_collectors.unsafe_as(Proc(IDataCollectorCollection*, HRESULT)).call(collectors)
  end
  def get_duration(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def put_duration(seconds : UInt32) : HRESULT
    @lpVtbl.value.put_duration.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def get_description_unresolved(descr : UInt8**) : HRESULT
    @lpVtbl.value.get_description_unresolved.unsafe_as(Proc(UInt8**, HRESULT)).call(descr)
  end
  def get_display_name(displayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(displayname)
  end
  def put_display_name(displayname : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(displayname)
  end
  def get_display_name_unresolved(name : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name_unresolved.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_keywords(keywords : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_keywords.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(keywords)
  end
  def put_keywords(keywords : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_keywords.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(keywords)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_root_path(folder : UInt8**) : HRESULT
    @lpVtbl.value.get_root_path.unsafe_as(Proc(UInt8**, HRESULT)).call(folder)
  end
  def put_root_path(folder : UInt8*) : HRESULT
    @lpVtbl.value.put_root_path.unsafe_as(Proc(UInt8*, HRESULT)).call(folder)
  end
  def get_segment(segment : Int16*) : HRESULT
    @lpVtbl.value.get_segment.unsafe_as(Proc(Int16*, HRESULT)).call(segment)
  end
  def put_segment(segment : Int16) : HRESULT
    @lpVtbl.value.put_segment.unsafe_as(Proc(Int16, HRESULT)).call(segment)
  end
  def get_segment_max_duration(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_segment_max_duration.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def put_segment_max_duration(seconds : UInt32) : HRESULT
    @lpVtbl.value.put_segment_max_duration.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_segment_max_size(size : UInt32*) : HRESULT
    @lpVtbl.value.get_segment_max_size.unsafe_as(Proc(UInt32*, HRESULT)).call(size)
  end
  def put_segment_max_size(size : UInt32) : HRESULT
    @lpVtbl.value.put_segment_max_size.unsafe_as(Proc(UInt32, HRESULT)).call(size)
  end
  def get_serial_number(index : UInt32*) : HRESULT
    @lpVtbl.value.get_serial_number.unsafe_as(Proc(UInt32*, HRESULT)).call(index)
  end
  def put_serial_number(index : UInt32) : HRESULT
    @lpVtbl.value.put_serial_number.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def get_server(server : UInt8**) : HRESULT
    @lpVtbl.value.get_server.unsafe_as(Proc(UInt8**, HRESULT)).call(server)
  end
  def get_status(status : DataCollectorSetStatus*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(DataCollectorSetStatus*, HRESULT)).call(status)
  end
  def get_subdirectory(folder : UInt8**) : HRESULT
    @lpVtbl.value.get_subdirectory.unsafe_as(Proc(UInt8**, HRESULT)).call(folder)
  end
  def put_subdirectory(folder : UInt8*) : HRESULT
    @lpVtbl.value.put_subdirectory.unsafe_as(Proc(UInt8*, HRESULT)).call(folder)
  end
  def get_subdirectory_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_subdirectory_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_subdirectory_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_subdirectory_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_subdirectory_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_subdirectory_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_subdirectory_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_subdirectory_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_task(task : UInt8**) : HRESULT
    @lpVtbl.value.get_task.unsafe_as(Proc(UInt8**, HRESULT)).call(task)
  end
  def put_task(task : UInt8*) : HRESULT
    @lpVtbl.value.put_task.unsafe_as(Proc(UInt8*, HRESULT)).call(task)
  end
  def get_task_run_as_self(runasself : Int16*) : HRESULT
    @lpVtbl.value.get_task_run_as_self.unsafe_as(Proc(Int16*, HRESULT)).call(runasself)
  end
  def put_task_run_as_self(runasself : Int16) : HRESULT
    @lpVtbl.value.put_task_run_as_self.unsafe_as(Proc(Int16, HRESULT)).call(runasself)
  end
  def get_task_arguments(task : UInt8**) : HRESULT
    @lpVtbl.value.get_task_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(task)
  end
  def put_task_arguments(task : UInt8*) : HRESULT
    @lpVtbl.value.put_task_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(task)
  end
  def get_task_user_text_arguments(usertext : UInt8**) : HRESULT
    @lpVtbl.value.get_task_user_text_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(usertext)
  end
  def put_task_user_text_arguments(usertext : UInt8*) : HRESULT
    @lpVtbl.value.put_task_user_text_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(usertext)
  end
  def get_schedules(ppschedules : IScheduleCollection*) : HRESULT
    @lpVtbl.value.get_schedules.unsafe_as(Proc(IScheduleCollection*, HRESULT)).call(ppschedules)
  end
  def get_schedules_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_schedules_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_schedules_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_schedules_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_user_account(user : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(user)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def get_security(pbstrsecurity : UInt8**) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsecurity)
  end
  def put_security(bstrsecurity : UInt8*) : HRESULT
    @lpVtbl.value.put_security.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsecurity)
  end
  def get_stop_on_completion(stop : Int16*) : HRESULT
    @lpVtbl.value.get_stop_on_completion.unsafe_as(Proc(Int16*, HRESULT)).call(stop)
  end
  def put_stop_on_completion(stop : Int16) : HRESULT
    @lpVtbl.value.put_stop_on_completion.unsafe_as(Proc(Int16, HRESULT)).call(stop)
  end
  def get_data_manager(datamanager : IDataManager*) : HRESULT
    @lpVtbl.value.get_data_manager.unsafe_as(Proc(IDataManager*, HRESULT)).call(datamanager)
  end
  def set_credentials(user : UInt8*, password : UInt8*) : HRESULT
    @lpVtbl.value.set_credentials.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(user, password)
  end
  def query(name : UInt8*, server : UInt8*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(name, server)
  end
  def commit(name : UInt8*, server : UInt8*, mode : CommitMode, validation : IValueMap*) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt8*, UInt8*, CommitMode, IValueMap*, HRESULT)).call(name, server, mode, validation)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def start(synchronous : Int16) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(Int16, HRESULT)).call(synchronous)
  end
  def stop(synchronous : Int16) : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(Int16, HRESULT)).call(synchronous)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def set_value(key : UInt8*, value : UInt8*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(key, value)
  end
  def get_value(key : UInt8*, value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(key, value)
  end
end
struct LibWin32::IDataManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_enabled(pfenabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pfenabled)
  end
  def put_enabled(fenabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(fenabled)
  end
  def get_check_before_running(pfcheck : Int16*) : HRESULT
    @lpVtbl.value.get_check_before_running.unsafe_as(Proc(Int16*, HRESULT)).call(pfcheck)
  end
  def put_check_before_running(fcheck : Int16) : HRESULT
    @lpVtbl.value.put_check_before_running.unsafe_as(Proc(Int16, HRESULT)).call(fcheck)
  end
  def get_min_free_disk(minfreedisk : UInt32*) : HRESULT
    @lpVtbl.value.get_min_free_disk.unsafe_as(Proc(UInt32*, HRESULT)).call(minfreedisk)
  end
  def put_min_free_disk(minfreedisk : UInt32) : HRESULT
    @lpVtbl.value.put_min_free_disk.unsafe_as(Proc(UInt32, HRESULT)).call(minfreedisk)
  end
  def get_max_size(pulmaxsize : UInt32*) : HRESULT
    @lpVtbl.value.get_max_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pulmaxsize)
  end
  def put_max_size(ulmaxsize : UInt32) : HRESULT
    @lpVtbl.value.put_max_size.unsafe_as(Proc(UInt32, HRESULT)).call(ulmaxsize)
  end
  def get_max_folder_count(pulmaxfoldercount : UInt32*) : HRESULT
    @lpVtbl.value.get_max_folder_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pulmaxfoldercount)
  end
  def put_max_folder_count(ulmaxfoldercount : UInt32) : HRESULT
    @lpVtbl.value.put_max_folder_count.unsafe_as(Proc(UInt32, HRESULT)).call(ulmaxfoldercount)
  end
  def get_resource_policy(ppolicy : ResourcePolicy*) : HRESULT
    @lpVtbl.value.get_resource_policy.unsafe_as(Proc(ResourcePolicy*, HRESULT)).call(ppolicy)
  end
  def put_resource_policy(policy : ResourcePolicy) : HRESULT
    @lpVtbl.value.put_resource_policy.unsafe_as(Proc(ResourcePolicy, HRESULT)).call(policy)
  end
  def get_folder_actions(actions : IFolderActionCollection*) : HRESULT
    @lpVtbl.value.get_folder_actions.unsafe_as(Proc(IFolderActionCollection*, HRESULT)).call(actions)
  end
  def get_report_schema(reportschema : UInt8**) : HRESULT
    @lpVtbl.value.get_report_schema.unsafe_as(Proc(UInt8**, HRESULT)).call(reportschema)
  end
  def put_report_schema(reportschema : UInt8*) : HRESULT
    @lpVtbl.value.put_report_schema.unsafe_as(Proc(UInt8*, HRESULT)).call(reportschema)
  end
  def get_report_file_name(pbstrfilename : UInt8**) : HRESULT
    @lpVtbl.value.get_report_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfilename)
  end
  def put_report_file_name(pbstrfilename : UInt8*) : HRESULT
    @lpVtbl.value.put_report_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrfilename)
  end
  def get_rule_target_file_name(filename : UInt8**) : HRESULT
    @lpVtbl.value.get_rule_target_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(filename)
  end
  def put_rule_target_file_name(filename : UInt8*) : HRESULT
    @lpVtbl.value.put_rule_target_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(filename)
  end
  def get_events_file_name(pbstrfilename : UInt8**) : HRESULT
    @lpVtbl.value.get_events_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrfilename)
  end
  def put_events_file_name(pbstrfilename : UInt8*) : HRESULT
    @lpVtbl.value.put_events_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(pbstrfilename)
  end
  def get_rules(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_rules.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
  def put_rules(bstrxml : UInt8*) : HRESULT
    @lpVtbl.value.put_rules.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrxml)
  end
  def run(steps : DataManagerSteps, bstrfolder : UInt8*, errors : IValueMap*) : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(DataManagerSteps, UInt8*, IValueMap*, HRESULT)).call(steps, bstrfolder, errors)
  end
  def extract(cabfilename : UInt8*, destinationpath : UInt8*) : HRESULT
    @lpVtbl.value.extract.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(cabfilename, destinationpath)
  end
end
struct LibWin32::IFolderAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_age(pulage : UInt32*) : HRESULT
    @lpVtbl.value.get_age.unsafe_as(Proc(UInt32*, HRESULT)).call(pulage)
  end
  def put_age(ulage : UInt32) : HRESULT
    @lpVtbl.value.put_age.unsafe_as(Proc(UInt32, HRESULT)).call(ulage)
  end
  def get_size(pulage : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pulage)
  end
  def put_size(ulage : UInt32) : HRESULT
    @lpVtbl.value.put_size.unsafe_as(Proc(UInt32, HRESULT)).call(ulage)
  end
  def get_actions(steps : FolderActionSteps*) : HRESULT
    @lpVtbl.value.get_actions.unsafe_as(Proc(FolderActionSteps*, HRESULT)).call(steps)
  end
  def put_actions(steps : FolderActionSteps) : HRESULT
    @lpVtbl.value.put_actions.unsafe_as(Proc(FolderActionSteps, HRESULT)).call(steps)
  end
  def get_send_cab_to(pbstrdestination : UInt8**) : HRESULT
    @lpVtbl.value.get_send_cab_to.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdestination)
  end
  def put_send_cab_to(bstrdestination : UInt8*) : HRESULT
    @lpVtbl.value.put_send_cab_to.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrdestination)
  end
end
struct LibWin32::IFolderActionCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_item(index : VARIANT, action : IFolderAction*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IFolderAction*, HRESULT)).call(index, action)
  end
  def get__new_enum(enum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(enum)
  end
  def add(action : IFolderAction) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IFolderAction, HRESULT)).call(action)
  end
  def remove(index : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(index)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_range(actions : IFolderActionCollection) : HRESULT
    @lpVtbl.value.add_range.unsafe_as(Proc(IFolderActionCollection, HRESULT)).call(actions)
  end
  def create_folder_action(folderaction : IFolderAction*) : HRESULT
    @lpVtbl.value.create_folder_action.unsafe_as(Proc(IFolderAction*, HRESULT)).call(folderaction)
  end
end
struct LibWin32::IDataCollector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collector_set(group : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_data_collector_set.unsafe_as(Proc(IDataCollectorSet*, HRESULT)).call(group)
  end
  def put_data_collector_set(group : IDataCollectorSet) : HRESULT
    @lpVtbl.value.put_data_collector_set.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(group)
  end
  def get_data_collector_type(type : DataCollectorType*) : HRESULT
    @lpVtbl.value.get_data_collector_type.unsafe_as(Proc(DataCollectorType*, HRESULT)).call(type)
  end
  def get_file_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_file_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_file_name_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_file_name_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_file_name_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_file_name_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_file_name_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_file_name_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_log_append(append : Int16*) : HRESULT
    @lpVtbl.value.get_log_append.unsafe_as(Proc(Int16*, HRESULT)).call(append)
  end
  def put_log_append(append : Int16) : HRESULT
    @lpVtbl.value.put_log_append.unsafe_as(Proc(Int16, HRESULT)).call(append)
  end
  def get_log_circular(circular : Int16*) : HRESULT
    @lpVtbl.value.get_log_circular.unsafe_as(Proc(Int16*, HRESULT)).call(circular)
  end
  def put_log_circular(circular : Int16) : HRESULT
    @lpVtbl.value.put_log_circular.unsafe_as(Proc(Int16, HRESULT)).call(circular)
  end
  def get_log_overwrite(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_log_overwrite.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_log_overwrite(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_log_overwrite.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_index(index : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(index)
  end
  def put_index(index : Int32) : HRESULT
    @lpVtbl.value.put_index.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def create_output_location(latest : Int16, location : UInt8**) : HRESULT
    @lpVtbl.value.create_output_location.unsafe_as(Proc(Int16, UInt8**, HRESULT)).call(latest, location)
  end
end
struct LibWin32::IPerformanceCounterDataCollector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collector_set(group : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_data_collector_set.unsafe_as(Proc(IDataCollectorSet*, HRESULT)).call(group)
  end
  def put_data_collector_set(group : IDataCollectorSet) : HRESULT
    @lpVtbl.value.put_data_collector_set.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(group)
  end
  def get_data_collector_type(type : DataCollectorType*) : HRESULT
    @lpVtbl.value.get_data_collector_type.unsafe_as(Proc(DataCollectorType*, HRESULT)).call(type)
  end
  def get_file_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_file_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_file_name_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_file_name_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_file_name_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_file_name_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_file_name_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_file_name_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_log_append(append : Int16*) : HRESULT
    @lpVtbl.value.get_log_append.unsafe_as(Proc(Int16*, HRESULT)).call(append)
  end
  def put_log_append(append : Int16) : HRESULT
    @lpVtbl.value.put_log_append.unsafe_as(Proc(Int16, HRESULT)).call(append)
  end
  def get_log_circular(circular : Int16*) : HRESULT
    @lpVtbl.value.get_log_circular.unsafe_as(Proc(Int16*, HRESULT)).call(circular)
  end
  def put_log_circular(circular : Int16) : HRESULT
    @lpVtbl.value.put_log_circular.unsafe_as(Proc(Int16, HRESULT)).call(circular)
  end
  def get_log_overwrite(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_log_overwrite.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_log_overwrite(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_log_overwrite.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_index(index : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(index)
  end
  def put_index(index : Int32) : HRESULT
    @lpVtbl.value.put_index.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def create_output_location(latest : Int16, location : UInt8**) : HRESULT
    @lpVtbl.value.create_output_location.unsafe_as(Proc(Int16, UInt8**, HRESULT)).call(latest, location)
  end
  def get_data_source_name(dsn : UInt8**) : HRESULT
    @lpVtbl.value.get_data_source_name.unsafe_as(Proc(UInt8**, HRESULT)).call(dsn)
  end
  def put_data_source_name(dsn : UInt8*) : HRESULT
    @lpVtbl.value.put_data_source_name.unsafe_as(Proc(UInt8*, HRESULT)).call(dsn)
  end
  def get_performance_counters(counters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_performance_counters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(counters)
  end
  def put_performance_counters(counters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_performance_counters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(counters)
  end
  def get_log_file_format(format : FileFormat*) : HRESULT
    @lpVtbl.value.get_log_file_format.unsafe_as(Proc(FileFormat*, HRESULT)).call(format)
  end
  def put_log_file_format(format : FileFormat) : HRESULT
    @lpVtbl.value.put_log_file_format.unsafe_as(Proc(FileFormat, HRESULT)).call(format)
  end
  def get_sample_interval(interval : UInt32*) : HRESULT
    @lpVtbl.value.get_sample_interval.unsafe_as(Proc(UInt32*, HRESULT)).call(interval)
  end
  def put_sample_interval(interval : UInt32) : HRESULT
    @lpVtbl.value.put_sample_interval.unsafe_as(Proc(UInt32, HRESULT)).call(interval)
  end
  def get_segment_max_records(records : UInt32*) : HRESULT
    @lpVtbl.value.get_segment_max_records.unsafe_as(Proc(UInt32*, HRESULT)).call(records)
  end
  def put_segment_max_records(records : UInt32) : HRESULT
    @lpVtbl.value.put_segment_max_records.unsafe_as(Proc(UInt32, HRESULT)).call(records)
  end
end
struct LibWin32::ITraceDataCollector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collector_set(group : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_data_collector_set.unsafe_as(Proc(IDataCollectorSet*, HRESULT)).call(group)
  end
  def put_data_collector_set(group : IDataCollectorSet) : HRESULT
    @lpVtbl.value.put_data_collector_set.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(group)
  end
  def get_data_collector_type(type : DataCollectorType*) : HRESULT
    @lpVtbl.value.get_data_collector_type.unsafe_as(Proc(DataCollectorType*, HRESULT)).call(type)
  end
  def get_file_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_file_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_file_name_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_file_name_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_file_name_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_file_name_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_file_name_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_file_name_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_log_append(append : Int16*) : HRESULT
    @lpVtbl.value.get_log_append.unsafe_as(Proc(Int16*, HRESULT)).call(append)
  end
  def put_log_append(append : Int16) : HRESULT
    @lpVtbl.value.put_log_append.unsafe_as(Proc(Int16, HRESULT)).call(append)
  end
  def get_log_circular(circular : Int16*) : HRESULT
    @lpVtbl.value.get_log_circular.unsafe_as(Proc(Int16*, HRESULT)).call(circular)
  end
  def put_log_circular(circular : Int16) : HRESULT
    @lpVtbl.value.put_log_circular.unsafe_as(Proc(Int16, HRESULT)).call(circular)
  end
  def get_log_overwrite(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_log_overwrite.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_log_overwrite(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_log_overwrite.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_index(index : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(index)
  end
  def put_index(index : Int32) : HRESULT
    @lpVtbl.value.put_index.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def create_output_location(latest : Int16, location : UInt8**) : HRESULT
    @lpVtbl.value.create_output_location.unsafe_as(Proc(Int16, UInt8**, HRESULT)).call(latest, location)
  end
  def get_buffer_size(size : UInt32*) : HRESULT
    @lpVtbl.value.get_buffer_size.unsafe_as(Proc(UInt32*, HRESULT)).call(size)
  end
  def put_buffer_size(size : UInt32) : HRESULT
    @lpVtbl.value.put_buffer_size.unsafe_as(Proc(UInt32, HRESULT)).call(size)
  end
  def get_buffers_lost(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_buffers_lost.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_buffers_lost(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_buffers_lost.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_buffers_written(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_buffers_written.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_buffers_written(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_buffers_written.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_clock_type(clock : ClockType*) : HRESULT
    @lpVtbl.value.get_clock_type.unsafe_as(Proc(ClockType*, HRESULT)).call(clock)
  end
  def put_clock_type(clock : ClockType) : HRESULT
    @lpVtbl.value.put_clock_type.unsafe_as(Proc(ClockType, HRESULT)).call(clock)
  end
  def get_events_lost(events : UInt32*) : HRESULT
    @lpVtbl.value.get_events_lost.unsafe_as(Proc(UInt32*, HRESULT)).call(events)
  end
  def put_events_lost(events : UInt32) : HRESULT
    @lpVtbl.value.put_events_lost.unsafe_as(Proc(UInt32, HRESULT)).call(events)
  end
  def get_extended_modes(mode : UInt32*) : HRESULT
    @lpVtbl.value.get_extended_modes.unsafe_as(Proc(UInt32*, HRESULT)).call(mode)
  end
  def put_extended_modes(mode : UInt32) : HRESULT
    @lpVtbl.value.put_extended_modes.unsafe_as(Proc(UInt32, HRESULT)).call(mode)
  end
  def get_flush_timer(seconds : UInt32*) : HRESULT
    @lpVtbl.value.get_flush_timer.unsafe_as(Proc(UInt32*, HRESULT)).call(seconds)
  end
  def put_flush_timer(seconds : UInt32) : HRESULT
    @lpVtbl.value.put_flush_timer.unsafe_as(Proc(UInt32, HRESULT)).call(seconds)
  end
  def get_free_buffers(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_free_buffers.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_free_buffers(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_free_buffers.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_guid(guid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(guid)
  end
  def put_guid(guid : Guid) : HRESULT
    @lpVtbl.value.put_guid.unsafe_as(Proc(Guid, HRESULT)).call(guid)
  end
  def get_is_kernel_trace(kernel : Int16*) : HRESULT
    @lpVtbl.value.get_is_kernel_trace.unsafe_as(Proc(Int16*, HRESULT)).call(kernel)
  end
  def get_maximum_buffers(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_maximum_buffers.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_maximum_buffers(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_maximum_buffers.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_minimum_buffers(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_minimum_buffers.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_minimum_buffers(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_minimum_buffers.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_number_of_buffers(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_number_of_buffers.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_number_of_buffers(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_number_of_buffers.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_preallocate_file(allocate : Int16*) : HRESULT
    @lpVtbl.value.get_preallocate_file.unsafe_as(Proc(Int16*, HRESULT)).call(allocate)
  end
  def put_preallocate_file(allocate : Int16) : HRESULT
    @lpVtbl.value.put_preallocate_file.unsafe_as(Proc(Int16, HRESULT)).call(allocate)
  end
  def get_process_mode(process : Int16*) : HRESULT
    @lpVtbl.value.get_process_mode.unsafe_as(Proc(Int16*, HRESULT)).call(process)
  end
  def put_process_mode(process : Int16) : HRESULT
    @lpVtbl.value.put_process_mode.unsafe_as(Proc(Int16, HRESULT)).call(process)
  end
  def get_real_time_buffers_lost(buffers : UInt32*) : HRESULT
    @lpVtbl.value.get_real_time_buffers_lost.unsafe_as(Proc(UInt32*, HRESULT)).call(buffers)
  end
  def put_real_time_buffers_lost(buffers : UInt32) : HRESULT
    @lpVtbl.value.put_real_time_buffers_lost.unsafe_as(Proc(UInt32, HRESULT)).call(buffers)
  end
  def get_session_id(id : UInt64*) : HRESULT
    @lpVtbl.value.get_session_id.unsafe_as(Proc(UInt64*, HRESULT)).call(id)
  end
  def put_session_id(id : UInt64) : HRESULT
    @lpVtbl.value.put_session_id.unsafe_as(Proc(UInt64, HRESULT)).call(id)
  end
  def get_session_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_session_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_session_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_session_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_session_thread_id(tid : UInt32*) : HRESULT
    @lpVtbl.value.get_session_thread_id.unsafe_as(Proc(UInt32*, HRESULT)).call(tid)
  end
  def put_session_thread_id(tid : UInt32) : HRESULT
    @lpVtbl.value.put_session_thread_id.unsafe_as(Proc(UInt32, HRESULT)).call(tid)
  end
  def get_stream_mode(mode : StreamMode*) : HRESULT
    @lpVtbl.value.get_stream_mode.unsafe_as(Proc(StreamMode*, HRESULT)).call(mode)
  end
  def put_stream_mode(mode : StreamMode) : HRESULT
    @lpVtbl.value.put_stream_mode.unsafe_as(Proc(StreamMode, HRESULT)).call(mode)
  end
  def get_trace_data_providers(providers : ITraceDataProviderCollection*) : HRESULT
    @lpVtbl.value.get_trace_data_providers.unsafe_as(Proc(ITraceDataProviderCollection*, HRESULT)).call(providers)
  end
end
struct LibWin32::IConfigurationDataCollector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collector_set(group : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_data_collector_set.unsafe_as(Proc(IDataCollectorSet*, HRESULT)).call(group)
  end
  def put_data_collector_set(group : IDataCollectorSet) : HRESULT
    @lpVtbl.value.put_data_collector_set.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(group)
  end
  def get_data_collector_type(type : DataCollectorType*) : HRESULT
    @lpVtbl.value.get_data_collector_type.unsafe_as(Proc(DataCollectorType*, HRESULT)).call(type)
  end
  def get_file_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_file_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_file_name_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_file_name_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_file_name_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_file_name_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_file_name_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_file_name_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_log_append(append : Int16*) : HRESULT
    @lpVtbl.value.get_log_append.unsafe_as(Proc(Int16*, HRESULT)).call(append)
  end
  def put_log_append(append : Int16) : HRESULT
    @lpVtbl.value.put_log_append.unsafe_as(Proc(Int16, HRESULT)).call(append)
  end
  def get_log_circular(circular : Int16*) : HRESULT
    @lpVtbl.value.get_log_circular.unsafe_as(Proc(Int16*, HRESULT)).call(circular)
  end
  def put_log_circular(circular : Int16) : HRESULT
    @lpVtbl.value.put_log_circular.unsafe_as(Proc(Int16, HRESULT)).call(circular)
  end
  def get_log_overwrite(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_log_overwrite.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_log_overwrite(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_log_overwrite.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_index(index : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(index)
  end
  def put_index(index : Int32) : HRESULT
    @lpVtbl.value.put_index.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def create_output_location(latest : Int16, location : UInt8**) : HRESULT
    @lpVtbl.value.create_output_location.unsafe_as(Proc(Int16, UInt8**, HRESULT)).call(latest, location)
  end
  def get_file_max_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_file_max_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def put_file_max_count(count : UInt32) : HRESULT
    @lpVtbl.value.put_file_max_count.unsafe_as(Proc(UInt32, HRESULT)).call(count)
  end
  def get_file_max_recursive_depth(depth : UInt32*) : HRESULT
    @lpVtbl.value.get_file_max_recursive_depth.unsafe_as(Proc(UInt32*, HRESULT)).call(depth)
  end
  def put_file_max_recursive_depth(depth : UInt32) : HRESULT
    @lpVtbl.value.put_file_max_recursive_depth.unsafe_as(Proc(UInt32, HRESULT)).call(depth)
  end
  def get_file_max_total_size(size : UInt32*) : HRESULT
    @lpVtbl.value.get_file_max_total_size.unsafe_as(Proc(UInt32*, HRESULT)).call(size)
  end
  def put_file_max_total_size(size : UInt32) : HRESULT
    @lpVtbl.value.put_file_max_total_size.unsafe_as(Proc(UInt32, HRESULT)).call(size)
  end
  def get_files(files : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_files.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(files)
  end
  def put_files(files : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_files.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(files)
  end
  def get_management_queries(queries : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_management_queries.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(queries)
  end
  def put_management_queries(queries : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_management_queries.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(queries)
  end
  def get_query_network_adapters(network : Int16*) : HRESULT
    @lpVtbl.value.get_query_network_adapters.unsafe_as(Proc(Int16*, HRESULT)).call(network)
  end
  def put_query_network_adapters(network : Int16) : HRESULT
    @lpVtbl.value.put_query_network_adapters.unsafe_as(Proc(Int16, HRESULT)).call(network)
  end
  def get_registry_keys(query : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_registry_keys.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(query)
  end
  def put_registry_keys(query : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_registry_keys.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(query)
  end
  def get_registry_max_recursive_depth(depth : UInt32*) : HRESULT
    @lpVtbl.value.get_registry_max_recursive_depth.unsafe_as(Proc(UInt32*, HRESULT)).call(depth)
  end
  def put_registry_max_recursive_depth(depth : UInt32) : HRESULT
    @lpVtbl.value.put_registry_max_recursive_depth.unsafe_as(Proc(UInt32, HRESULT)).call(depth)
  end
  def get_system_state_file(filename : UInt8**) : HRESULT
    @lpVtbl.value.get_system_state_file.unsafe_as(Proc(UInt8**, HRESULT)).call(filename)
  end
  def put_system_state_file(filename : UInt8*) : HRESULT
    @lpVtbl.value.put_system_state_file.unsafe_as(Proc(UInt8*, HRESULT)).call(filename)
  end
end
struct LibWin32::IAlertDataCollector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collector_set(group : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_data_collector_set.unsafe_as(Proc(IDataCollectorSet*, HRESULT)).call(group)
  end
  def put_data_collector_set(group : IDataCollectorSet) : HRESULT
    @lpVtbl.value.put_data_collector_set.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(group)
  end
  def get_data_collector_type(type : DataCollectorType*) : HRESULT
    @lpVtbl.value.get_data_collector_type.unsafe_as(Proc(DataCollectorType*, HRESULT)).call(type)
  end
  def get_file_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_file_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_file_name_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_file_name_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_file_name_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_file_name_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_file_name_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_file_name_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_log_append(append : Int16*) : HRESULT
    @lpVtbl.value.get_log_append.unsafe_as(Proc(Int16*, HRESULT)).call(append)
  end
  def put_log_append(append : Int16) : HRESULT
    @lpVtbl.value.put_log_append.unsafe_as(Proc(Int16, HRESULT)).call(append)
  end
  def get_log_circular(circular : Int16*) : HRESULT
    @lpVtbl.value.get_log_circular.unsafe_as(Proc(Int16*, HRESULT)).call(circular)
  end
  def put_log_circular(circular : Int16) : HRESULT
    @lpVtbl.value.put_log_circular.unsafe_as(Proc(Int16, HRESULT)).call(circular)
  end
  def get_log_overwrite(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_log_overwrite.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_log_overwrite(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_log_overwrite.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_index(index : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(index)
  end
  def put_index(index : Int32) : HRESULT
    @lpVtbl.value.put_index.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def create_output_location(latest : Int16, location : UInt8**) : HRESULT
    @lpVtbl.value.create_output_location.unsafe_as(Proc(Int16, UInt8**, HRESULT)).call(latest, location)
  end
  def get_alert_thresholds(alerts : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_alert_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(alerts)
  end
  def put_alert_thresholds(alerts : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_alert_thresholds.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(alerts)
  end
  def get_event_log(log : Int16*) : HRESULT
    @lpVtbl.value.get_event_log.unsafe_as(Proc(Int16*, HRESULT)).call(log)
  end
  def put_event_log(log : Int16) : HRESULT
    @lpVtbl.value.put_event_log.unsafe_as(Proc(Int16, HRESULT)).call(log)
  end
  def get_sample_interval(interval : UInt32*) : HRESULT
    @lpVtbl.value.get_sample_interval.unsafe_as(Proc(UInt32*, HRESULT)).call(interval)
  end
  def put_sample_interval(interval : UInt32) : HRESULT
    @lpVtbl.value.put_sample_interval.unsafe_as(Proc(UInt32, HRESULT)).call(interval)
  end
  def get_task(task : UInt8**) : HRESULT
    @lpVtbl.value.get_task.unsafe_as(Proc(UInt8**, HRESULT)).call(task)
  end
  def put_task(task : UInt8*) : HRESULT
    @lpVtbl.value.put_task.unsafe_as(Proc(UInt8*, HRESULT)).call(task)
  end
  def get_task_run_as_self(runasself : Int16*) : HRESULT
    @lpVtbl.value.get_task_run_as_self.unsafe_as(Proc(Int16*, HRESULT)).call(runasself)
  end
  def put_task_run_as_self(runasself : Int16) : HRESULT
    @lpVtbl.value.put_task_run_as_self.unsafe_as(Proc(Int16, HRESULT)).call(runasself)
  end
  def get_task_arguments(task : UInt8**) : HRESULT
    @lpVtbl.value.get_task_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(task)
  end
  def put_task_arguments(task : UInt8*) : HRESULT
    @lpVtbl.value.put_task_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(task)
  end
  def get_task_user_text_arguments(task : UInt8**) : HRESULT
    @lpVtbl.value.get_task_user_text_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(task)
  end
  def put_task_user_text_arguments(task : UInt8*) : HRESULT
    @lpVtbl.value.put_task_user_text_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(task)
  end
  def get_trigger_data_collector_set(name : UInt8**) : HRESULT
    @lpVtbl.value.get_trigger_data_collector_set.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_trigger_data_collector_set(name : UInt8*) : HRESULT
    @lpVtbl.value.put_trigger_data_collector_set.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
end
struct LibWin32::IApiTracingDataCollector
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_data_collector_set(group : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_data_collector_set.unsafe_as(Proc(IDataCollectorSet*, HRESULT)).call(group)
  end
  def put_data_collector_set(group : IDataCollectorSet) : HRESULT
    @lpVtbl.value.put_data_collector_set.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(group)
  end
  def get_data_collector_type(type : DataCollectorType*) : HRESULT
    @lpVtbl.value.get_data_collector_type.unsafe_as(Proc(DataCollectorType*, HRESULT)).call(type)
  end
  def get_file_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_file_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_file_name_format(format : AutoPathFormat*) : HRESULT
    @lpVtbl.value.get_file_name_format.unsafe_as(Proc(AutoPathFormat*, HRESULT)).call(format)
  end
  def put_file_name_format(format : AutoPathFormat) : HRESULT
    @lpVtbl.value.put_file_name_format.unsafe_as(Proc(AutoPathFormat, HRESULT)).call(format)
  end
  def get_file_name_format_pattern(pattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_format_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(pattern)
  end
  def put_file_name_format_pattern(pattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_format_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(pattern)
  end
  def get_latest_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_latest_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def put_latest_output_location(path : UInt8*) : HRESULT
    @lpVtbl.value.put_latest_output_location.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_log_append(append : Int16*) : HRESULT
    @lpVtbl.value.get_log_append.unsafe_as(Proc(Int16*, HRESULT)).call(append)
  end
  def put_log_append(append : Int16) : HRESULT
    @lpVtbl.value.put_log_append.unsafe_as(Proc(Int16, HRESULT)).call(append)
  end
  def get_log_circular(circular : Int16*) : HRESULT
    @lpVtbl.value.get_log_circular.unsafe_as(Proc(Int16*, HRESULT)).call(circular)
  end
  def put_log_circular(circular : Int16) : HRESULT
    @lpVtbl.value.put_log_circular.unsafe_as(Proc(Int16, HRESULT)).call(circular)
  end
  def get_log_overwrite(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_log_overwrite.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_log_overwrite(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_log_overwrite.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_output_location(path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_location.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_index(index : Int32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(Int32*, HRESULT)).call(index)
  end
  def put_index(index : Int32) : HRESULT
    @lpVtbl.value.put_index.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def get_xml(xml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(xml)
  end
  def set_xml(xml : UInt8*, validation : IValueMap*) : HRESULT
    @lpVtbl.value.set_xml.unsafe_as(Proc(UInt8*, IValueMap*, HRESULT)).call(xml, validation)
  end
  def create_output_location(latest : Int16, location : UInt8**) : HRESULT
    @lpVtbl.value.create_output_location.unsafe_as(Proc(Int16, UInt8**, HRESULT)).call(latest, location)
  end
  def get_log_api_names_only(logapinames : Int16*) : HRESULT
    @lpVtbl.value.get_log_api_names_only.unsafe_as(Proc(Int16*, HRESULT)).call(logapinames)
  end
  def put_log_api_names_only(logapinames : Int16) : HRESULT
    @lpVtbl.value.put_log_api_names_only.unsafe_as(Proc(Int16, HRESULT)).call(logapinames)
  end
  def get_log_apis_recursively(logrecursively : Int16*) : HRESULT
    @lpVtbl.value.get_log_apis_recursively.unsafe_as(Proc(Int16*, HRESULT)).call(logrecursively)
  end
  def put_log_apis_recursively(logrecursively : Int16) : HRESULT
    @lpVtbl.value.put_log_apis_recursively.unsafe_as(Proc(Int16, HRESULT)).call(logrecursively)
  end
  def get_exe_path(exepath : UInt8**) : HRESULT
    @lpVtbl.value.get_exe_path.unsafe_as(Proc(UInt8**, HRESULT)).call(exepath)
  end
  def put_exe_path(exepath : UInt8*) : HRESULT
    @lpVtbl.value.put_exe_path.unsafe_as(Proc(UInt8*, HRESULT)).call(exepath)
  end
  def get_log_file_path(logfilepath : UInt8**) : HRESULT
    @lpVtbl.value.get_log_file_path.unsafe_as(Proc(UInt8**, HRESULT)).call(logfilepath)
  end
  def put_log_file_path(logfilepath : UInt8*) : HRESULT
    @lpVtbl.value.put_log_file_path.unsafe_as(Proc(UInt8*, HRESULT)).call(logfilepath)
  end
  def get_include_modules(includemodules : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_include_modules.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(includemodules)
  end
  def put_include_modules(includemodules : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_include_modules.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(includemodules)
  end
  def get_include_apis(includeapis : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_include_apis.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(includeapis)
  end
  def put_include_apis(includeapis : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_include_apis.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(includeapis)
  end
  def get_exclude_apis(excludeapis : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_exclude_apis.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(excludeapis)
  end
  def put_exclude_apis(excludeapis : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_exclude_apis.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(excludeapis)
  end
end
struct LibWin32::IDataCollectorCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_item(index : VARIANT, collector : IDataCollector*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IDataCollector*, HRESULT)).call(index, collector)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def add(collector : IDataCollector) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IDataCollector, HRESULT)).call(collector)
  end
  def remove(collector : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(collector)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_range(collectors : IDataCollectorCollection) : HRESULT
    @lpVtbl.value.add_range.unsafe_as(Proc(IDataCollectorCollection, HRESULT)).call(collectors)
  end
  def create_data_collector_from_xml(bstrxml : UInt8*, pvalidation : IValueMap*, pcollector : IDataCollector*) : HRESULT
    @lpVtbl.value.create_data_collector_from_xml.unsafe_as(Proc(UInt8*, IValueMap*, IDataCollector*, HRESULT)).call(bstrxml, pvalidation, pcollector)
  end
  def create_data_collector(type : DataCollectorType, collector : IDataCollector*) : HRESULT
    @lpVtbl.value.create_data_collector.unsafe_as(Proc(DataCollectorType, IDataCollector*, HRESULT)).call(type, collector)
  end
end
struct LibWin32::IDataCollectorSetCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_item(index : VARIANT, set : IDataCollectorSet*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IDataCollectorSet*, HRESULT)).call(index, set)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def add(set : IDataCollectorSet) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IDataCollectorSet, HRESULT)).call(set)
  end
  def remove(set : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(set)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_range(sets : IDataCollectorSetCollection) : HRESULT
    @lpVtbl.value.add_range.unsafe_as(Proc(IDataCollectorSetCollection, HRESULT)).call(sets)
  end
  def get_data_collector_sets(server : UInt8*, filter : UInt8*) : HRESULT
    @lpVtbl.value.get_data_collector_sets.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(server, filter)
  end
end
struct LibWin32::ITraceDataProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_display_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_display_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_guid(guid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(guid)
  end
  def put_guid(guid : Guid) : HRESULT
    @lpVtbl.value.put_guid.unsafe_as(Proc(Guid, HRESULT)).call(guid)
  end
  def get_level(pplevel : IValueMap*) : HRESULT
    @lpVtbl.value.get_level.unsafe_as(Proc(IValueMap*, HRESULT)).call(pplevel)
  end
  def get_keywords_any(ppkeywords : IValueMap*) : HRESULT
    @lpVtbl.value.get_keywords_any.unsafe_as(Proc(IValueMap*, HRESULT)).call(ppkeywords)
  end
  def get_keywords_all(ppkeywords : IValueMap*) : HRESULT
    @lpVtbl.value.get_keywords_all.unsafe_as(Proc(IValueMap*, HRESULT)).call(ppkeywords)
  end
  def get_properties(ppproperties : IValueMap*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IValueMap*, HRESULT)).call(ppproperties)
  end
  def get_filter_enabled(filterenabled : Int16*) : HRESULT
    @lpVtbl.value.get_filter_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(filterenabled)
  end
  def put_filter_enabled(filterenabled : Int16) : HRESULT
    @lpVtbl.value.put_filter_enabled.unsafe_as(Proc(Int16, HRESULT)).call(filterenabled)
  end
  def get_filter_type(pultype : UInt32*) : HRESULT
    @lpVtbl.value.get_filter_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pultype)
  end
  def put_filter_type(ultype : UInt32) : HRESULT
    @lpVtbl.value.put_filter_type.unsafe_as(Proc(UInt32, HRESULT)).call(ultype)
  end
  def get_filter_data(ppdata : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_filter_data.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(ppdata)
  end
  def put_filter_data(pdata : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_filter_data.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(pdata)
  end
  def query(bstrname : UInt8*, bstrserver : UInt8*) : HRESULT
    @lpVtbl.value.query.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrname, bstrserver)
  end
  def resolve(pfrom : IDispatch) : HRESULT
    @lpVtbl.value.resolve.unsafe_as(Proc(IDispatch, HRESULT)).call(pfrom)
  end
  def set_security(sddl : UInt8*) : HRESULT
    @lpVtbl.value.set_security.unsafe_as(Proc(UInt8*, HRESULT)).call(sddl)
  end
  def get_security(securityinfo : UInt32, sddl : UInt8**) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(securityinfo, sddl)
  end
  def get_registered_processes(processes : IValueMap*) : HRESULT
    @lpVtbl.value.get_registered_processes.unsafe_as(Proc(IValueMap*, HRESULT)).call(processes)
  end
end
struct LibWin32::ITraceDataProviderCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_item(index : VARIANT, ppprovider : ITraceDataProvider*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, ITraceDataProvider*, HRESULT)).call(index, ppprovider)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def add(pprovider : ITraceDataProvider) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(ITraceDataProvider, HRESULT)).call(pprovider)
  end
  def remove(vprovider : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(vprovider)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_range(providers : ITraceDataProviderCollection) : HRESULT
    @lpVtbl.value.add_range.unsafe_as(Proc(ITraceDataProviderCollection, HRESULT)).call(providers)
  end
  def create_trace_data_provider(provider : ITraceDataProvider*) : HRESULT
    @lpVtbl.value.create_trace_data_provider.unsafe_as(Proc(ITraceDataProvider*, HRESULT)).call(provider)
  end
  def get_trace_data_providers(server : UInt8*) : HRESULT
    @lpVtbl.value.get_trace_data_providers.unsafe_as(Proc(UInt8*, HRESULT)).call(server)
  end
  def get_trace_data_providers_by_process(server : UInt8*, pid : UInt32) : HRESULT
    @lpVtbl.value.get_trace_data_providers_by_process.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(server, pid)
  end
end
struct LibWin32::ISchedule
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_start_date(start : VARIANT*) : HRESULT
    @lpVtbl.value.get_start_date.unsafe_as(Proc(VARIANT*, HRESULT)).call(start)
  end
  def put_start_date(start : VARIANT) : HRESULT
    @lpVtbl.value.put_start_date.unsafe_as(Proc(VARIANT, HRESULT)).call(start)
  end
  def get_end_date(end_ : VARIANT*) : HRESULT
    @lpVtbl.value.get_end_date.unsafe_as(Proc(VARIANT*, HRESULT)).call(end_)
  end
  def put_end_date(end_ : VARIANT) : HRESULT
    @lpVtbl.value.put_end_date.unsafe_as(Proc(VARIANT, HRESULT)).call(end_)
  end
  def get_start_time(start : VARIANT*) : HRESULT
    @lpVtbl.value.get_start_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(start)
  end
  def put_start_time(start : VARIANT) : HRESULT
    @lpVtbl.value.put_start_time.unsafe_as(Proc(VARIANT, HRESULT)).call(start)
  end
  def get_days(days : WeekDays*) : HRESULT
    @lpVtbl.value.get_days.unsafe_as(Proc(WeekDays*, HRESULT)).call(days)
  end
  def put_days(days : WeekDays) : HRESULT
    @lpVtbl.value.put_days.unsafe_as(Proc(WeekDays, HRESULT)).call(days)
  end
end
struct LibWin32::IScheduleCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_item(index : VARIANT, ppschedule : ISchedule*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, ISchedule*, HRESULT)).call(index, ppschedule)
  end
  def get__new_enum(ienum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ienum)
  end
  def add(pschedule : ISchedule) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(ISchedule, HRESULT)).call(pschedule)
  end
  def remove(vschedule : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(vschedule)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_range(pschedules : IScheduleCollection) : HRESULT
    @lpVtbl.value.add_range.unsafe_as(Proc(IScheduleCollection, HRESULT)).call(pschedules)
  end
  def create_schedule(schedule : ISchedule*) : HRESULT
    @lpVtbl.value.create_schedule.unsafe_as(Proc(ISchedule*, HRESULT)).call(schedule)
  end
end
struct LibWin32::IValueMapItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_key(key : UInt8**) : HRESULT
    @lpVtbl.value.get_key.unsafe_as(Proc(UInt8**, HRESULT)).call(key)
  end
  def put_key(key : UInt8*) : HRESULT
    @lpVtbl.value.put_key.unsafe_as(Proc(UInt8*, HRESULT)).call(key)
  end
  def get_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
  def put_value(value : VARIANT) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(VARIANT, HRESULT)).call(value)
  end
  def get_value_map_type(type : ValueMapType*) : HRESULT
    @lpVtbl.value.get_value_map_type.unsafe_as(Proc(ValueMapType*, HRESULT)).call(type)
  end
  def put_value_map_type(type : ValueMapType) : HRESULT
    @lpVtbl.value.put_value_map_type.unsafe_as(Proc(ValueMapType, HRESULT)).call(type)
  end
end
struct LibWin32::IValueMap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_item(index : VARIANT, value : IValueMapItem*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IValueMapItem*, HRESULT)).call(index, value)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def get_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
  def put_value(value : VARIANT) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(VARIANT, HRESULT)).call(value)
  end
  def get_value_map_type(type : ValueMapType*) : HRESULT
    @lpVtbl.value.get_value_map_type.unsafe_as(Proc(ValueMapType*, HRESULT)).call(type)
  end
  def put_value_map_type(type : ValueMapType) : HRESULT
    @lpVtbl.value.put_value_map_type.unsafe_as(Proc(ValueMapType, HRESULT)).call(type)
  end
  def add(value : VARIANT) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(VARIANT, HRESULT)).call(value)
  end
  def remove(value : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(value)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def add_range(map : IValueMap) : HRESULT
    @lpVtbl.value.add_range.unsafe_as(Proc(IValueMap, HRESULT)).call(map)
  end
  def create_value_map_item(item : IValueMapItem*) : HRESULT
    @lpVtbl.value.create_value_map_item.unsafe_as(Proc(IValueMapItem*, HRESULT)).call(item)
  end
end
struct LibWin32::ICounterItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_value(pdblvalue : Float64*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(Float64*, HRESULT)).call(pdblvalue)
  end
  def put_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_width(iwidth : Int32) : HRESULT
    @lpVtbl.value.put_width.unsafe_as(Proc(Int32, HRESULT)).call(iwidth)
  end
  def get_width(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_line_style(ilinestyle : Int32) : HRESULT
    @lpVtbl.value.put_line_style.unsafe_as(Proc(Int32, HRESULT)).call(ilinestyle)
  end
  def get_line_style(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_line_style.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_scale_factor(iscale : Int32) : HRESULT
    @lpVtbl.value.put_scale_factor.unsafe_as(Proc(Int32, HRESULT)).call(iscale)
  end
  def get_scale_factor(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_scale_factor.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def get_path(pstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pstrvalue)
  end
  def get_value2(value : Float64*, status : Int32*) : HRESULT
    @lpVtbl.value.get_value2.unsafe_as(Proc(Float64*, Int32*, HRESULT)).call(value, status)
  end
  def get_statistics(max : Float64*, min : Float64*, avg : Float64*, status : Int32*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(Float64*, Float64*, Float64*, Int32*, HRESULT)).call(max, min, avg, status)
  end
end
struct LibWin32::ICounterItem2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_value(pdblvalue : Float64*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(Float64*, HRESULT)).call(pdblvalue)
  end
  def put_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_width(iwidth : Int32) : HRESULT
    @lpVtbl.value.put_width.unsafe_as(Proc(Int32, HRESULT)).call(iwidth)
  end
  def get_width(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_line_style(ilinestyle : Int32) : HRESULT
    @lpVtbl.value.put_line_style.unsafe_as(Proc(Int32, HRESULT)).call(ilinestyle)
  end
  def get_line_style(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_line_style.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_scale_factor(iscale : Int32) : HRESULT
    @lpVtbl.value.put_scale_factor.unsafe_as(Proc(Int32, HRESULT)).call(iscale)
  end
  def get_scale_factor(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_scale_factor.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def get_path(pstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pstrvalue)
  end
  def get_value2(value : Float64*, status : Int32*) : HRESULT
    @lpVtbl.value.get_value2.unsafe_as(Proc(Float64*, Int32*, HRESULT)).call(value, status)
  end
  def get_statistics(max : Float64*, min : Float64*, avg : Float64*, status : Int32*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(Float64*, Float64*, Float64*, Int32*, HRESULT)).call(max, min, avg, status)
  end
  def put_selected(bstate : Int16) : HRESULT
    @lpVtbl.value.put_selected.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_selected(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_selected.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_visible(bstate : Int16) : HRESULT
    @lpVtbl.value.put_visible.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_visible(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_visible.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def get_data_at(iindex : Int32, iwhich : SysmonDataType, pvariant : VARIANT*) : HRESULT
    @lpVtbl.value.get_data_at.unsafe_as(Proc(Int32, SysmonDataType, VARIANT*, HRESULT)).call(iindex, iwhich, pvariant)
  end
end
struct LibWin32::IICounterItemUnion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_value(pdblvalue : Float64*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(Float64*, HRESULT)).call(pdblvalue)
  end
  def put_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_width(iwidth : Int32) : HRESULT
    @lpVtbl.value.put_width.unsafe_as(Proc(Int32, HRESULT)).call(iwidth)
  end
  def get_width(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_line_style(ilinestyle : Int32) : HRESULT
    @lpVtbl.value.put_line_style.unsafe_as(Proc(Int32, HRESULT)).call(ilinestyle)
  end
  def get_line_style(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_line_style.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_scale_factor(iscale : Int32) : HRESULT
    @lpVtbl.value.put_scale_factor.unsafe_as(Proc(Int32, HRESULT)).call(iscale)
  end
  def get_scale_factor(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_scale_factor.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def get_path(pstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pstrvalue)
  end
  def get_value2(value : Float64*, status : Int32*) : HRESULT
    @lpVtbl.value.get_value2.unsafe_as(Proc(Float64*, Int32*, HRESULT)).call(value, status)
  end
  def get_statistics(max : Float64*, min : Float64*, avg : Float64*, status : Int32*) : HRESULT
    @lpVtbl.value.get_statistics.unsafe_as(Proc(Float64*, Float64*, Float64*, Int32*, HRESULT)).call(max, min, avg, status)
  end
  def put_selected(bstate : Int16) : HRESULT
    @lpVtbl.value.put_selected.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_selected(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_selected.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_visible(bstate : Int16) : HRESULT
    @lpVtbl.value.put_visible.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_visible(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_visible.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def get_data_at(iindex : Int32, iwhich : SysmonDataType, pvariant : VARIANT*) : HRESULT
    @lpVtbl.value.get_data_at.unsafe_as(Proc(Int32, SysmonDataType, VARIANT*, HRESULT)).call(iindex, iwhich, pvariant)
  end
end
struct LibWin32::DICounterItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ICounters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plong : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plong)
  end
  def get__new_enum(ppiunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppiunk)
  end
  def get_item(index : VARIANT, ppi : DICounterItem*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, DICounterItem*, HRESULT)).call(index, ppi)
  end
  def add(pathname : UInt8*, ppi : DICounterItem*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, DICounterItem*, HRESULT)).call(pathname, ppi)
  end
  def remove(index : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(index)
  end
end
struct LibWin32::ILogFileItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_path(pstrvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pstrvalue)
  end
end
struct LibWin32::DILogFileItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ILogFiles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plong : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plong)
  end
  def get__new_enum(ppiunk : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppiunk)
  end
  def get_item(index : VARIANT, ppi : DILogFileItem*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, DILogFileItem*, HRESULT)).call(index, ppi)
  end
  def add(pathname : UInt8*, ppi : DILogFileItem*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, DILogFileItem*, HRESULT)).call(pathname, ppi)
  end
  def remove(index : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(index)
  end
end
struct LibWin32::ISystemMonitor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_appearance(iappearance : Int32*) : HRESULT
    @lpVtbl.value.get_appearance.unsafe_as(Proc(Int32*, HRESULT)).call(iappearance)
  end
  def put_appearance(iappearance : Int32) : HRESULT
    @lpVtbl.value.put_appearance.unsafe_as(Proc(Int32, HRESULT)).call(iappearance)
  end
  def get_back_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_back_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_border_style(iborderstyle : Int32*) : HRESULT
    @lpVtbl.value.get_border_style.unsafe_as(Proc(Int32*, HRESULT)).call(iborderstyle)
  end
  def put_border_style(iborderstyle : Int32) : HRESULT
    @lpVtbl.value.put_border_style.unsafe_as(Proc(Int32, HRESULT)).call(iborderstyle)
  end
  def get_fore_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_fore_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_fore_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_fore_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_font(ppfont : IFontDisp*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(IFontDisp*, HRESULT)).call(ppfont)
  end
  def putref_font(pfont : IFontDisp) : HRESULT
    @lpVtbl.value.putref_font.unsafe_as(Proc(IFontDisp, HRESULT)).call(pfont)
  end
  def get_counters(ppicounters : ICounters*) : HRESULT
    @lpVtbl.value.get_counters.unsafe_as(Proc(ICounters*, HRESULT)).call(ppicounters)
  end
  def put_show_vertical_grid(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_vertical_grid.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_vertical_grid(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_vertical_grid.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_horizontal_grid(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_horizontal_grid.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_horizontal_grid(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_horizontal_grid.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_legend(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_legend.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_legend(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_legend.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_scale_labels(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_scale_labels.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_scale_labels(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_scale_labels.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_value_bar(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_value_bar.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_value_bar(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_value_bar.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_maximum_scale(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_maximum_scale.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_maximum_scale(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_maximum_scale.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_minimum_scale(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_minimum_scale.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_minimum_scale(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_minimum_scale.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_update_interval(fvalue : Float32) : HRESULT
    @lpVtbl.value.put_update_interval.unsafe_as(Proc(Float32, HRESULT)).call(fvalue)
  end
  def get_update_interval(pfvalue : Float32*) : HRESULT
    @lpVtbl.value.get_update_interval.unsafe_as(Proc(Float32*, HRESULT)).call(pfvalue)
  end
  def put_display_type(edisplaytype : DisplayTypeConstants) : HRESULT
    @lpVtbl.value.put_display_type.unsafe_as(Proc(DisplayTypeConstants, HRESULT)).call(edisplaytype)
  end
  def get_display_type(pedisplaytype : DisplayTypeConstants*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(DisplayTypeConstants*, HRESULT)).call(pedisplaytype)
  end
  def put_manual_update(bstate : Int16) : HRESULT
    @lpVtbl.value.put_manual_update.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_manual_update(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_manual_update.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_graph_title(bstitle : UInt8*) : HRESULT
    @lpVtbl.value.put_graph_title.unsafe_as(Proc(UInt8*, HRESULT)).call(bstitle)
  end
  def get_graph_title(pbstitle : UInt8**) : HRESULT
    @lpVtbl.value.get_graph_title.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstitle)
  end
  def put_y_axis_label(bstitle : UInt8*) : HRESULT
    @lpVtbl.value.put_y_axis_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstitle)
  end
  def get_y_axis_label(pbstitle : UInt8**) : HRESULT
    @lpVtbl.value.get_y_axis_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstitle)
  end
  def collect_sample : HRESULT
    @lpVtbl.value.collect_sample.unsafe_as(Proc(HRESULT)).call
  end
  def update_graph : HRESULT
    @lpVtbl.value.update_graph.unsafe_as(Proc(HRESULT)).call
  end
  def browse_counters : HRESULT
    @lpVtbl.value.browse_counters.unsafe_as(Proc(HRESULT)).call
  end
  def display_properties : HRESULT
    @lpVtbl.value.display_properties.unsafe_as(Proc(HRESULT)).call
  end
  def counter(iindex : Int32, ppicounter : ICounterItem*) : HRESULT
    @lpVtbl.value.counter.unsafe_as(Proc(Int32, ICounterItem*, HRESULT)).call(iindex, ppicounter)
  end
  def add_counter(bspath : UInt8*, ppicounter : ICounterItem*) : HRESULT
    @lpVtbl.value.add_counter.unsafe_as(Proc(UInt8*, ICounterItem*, HRESULT)).call(bspath, ppicounter)
  end
  def delete_counter(pctr : ICounterItem) : HRESULT
    @lpVtbl.value.delete_counter.unsafe_as(Proc(ICounterItem, HRESULT)).call(pctr)
  end
  def get_back_color_ctl(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color_ctl.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_back_color_ctl(color : UInt32) : HRESULT
    @lpVtbl.value.put_back_color_ctl.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def put_log_file_name(bsfilename : UInt8*) : HRESULT
    @lpVtbl.value.put_log_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bsfilename)
  end
  def get_log_file_name(bsfilename : UInt8**) : HRESULT
    @lpVtbl.value.get_log_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bsfilename)
  end
  def put_log_view_start(starttime : Float64) : HRESULT
    @lpVtbl.value.put_log_view_start.unsafe_as(Proc(Float64, HRESULT)).call(starttime)
  end
  def get_log_view_start(starttime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_start.unsafe_as(Proc(Float64*, HRESULT)).call(starttime)
  end
  def put_log_view_stop(stoptime : Float64) : HRESULT
    @lpVtbl.value.put_log_view_stop.unsafe_as(Proc(Float64, HRESULT)).call(stoptime)
  end
  def get_log_view_stop(stoptime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_stop.unsafe_as(Proc(Float64*, HRESULT)).call(stoptime)
  end
  def get_grid_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_grid_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_grid_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_grid_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_time_bar_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_time_bar_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_time_bar_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_time_bar_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_highlight(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_highlight.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_highlight(bstate : Int16) : HRESULT
    @lpVtbl.value.put_highlight.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_toolbar(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_toolbar.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_toolbar(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_toolbar.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def paste : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(HRESULT)).call
  end
  def copy : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(HRESULT)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def put_read_only(bstate : Int16) : HRESULT
    @lpVtbl.value.put_read_only.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_read_only(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_report_value_type(ereportvaluetype : ReportValueTypeConstants) : HRESULT
    @lpVtbl.value.put_report_value_type.unsafe_as(Proc(ReportValueTypeConstants, HRESULT)).call(ereportvaluetype)
  end
  def get_report_value_type(pereportvaluetype : ReportValueTypeConstants*) : HRESULT
    @lpVtbl.value.get_report_value_type.unsafe_as(Proc(ReportValueTypeConstants*, HRESULT)).call(pereportvaluetype)
  end
  def put_monitor_duplicate_instances(bstate : Int16) : HRESULT
    @lpVtbl.value.put_monitor_duplicate_instances.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_monitor_duplicate_instances(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_monitor_duplicate_instances.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_display_filter(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_display_filter.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_display_filter(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_display_filter.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def get_log_files(ppilogfiles : ILogFiles*) : HRESULT
    @lpVtbl.value.get_log_files.unsafe_as(Proc(ILogFiles*, HRESULT)).call(ppilogfiles)
  end
  def put_data_source_type(edatasourcetype : DataSourceTypeConstants) : HRESULT
    @lpVtbl.value.put_data_source_type.unsafe_as(Proc(DataSourceTypeConstants, HRESULT)).call(edatasourcetype)
  end
  def get_data_source_type(pedatasourcetype : DataSourceTypeConstants*) : HRESULT
    @lpVtbl.value.get_data_source_type.unsafe_as(Proc(DataSourceTypeConstants*, HRESULT)).call(pedatasourcetype)
  end
  def put_sql_dsn_name(bssqldsnname : UInt8*) : HRESULT
    @lpVtbl.value.put_sql_dsn_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bssqldsnname)
  end
  def get_sql_dsn_name(bssqldsnname : UInt8**) : HRESULT
    @lpVtbl.value.get_sql_dsn_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bssqldsnname)
  end
  def put_sql_log_set_name(bssqllogsetname : UInt8*) : HRESULT
    @lpVtbl.value.put_sql_log_set_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bssqllogsetname)
  end
  def get_sql_log_set_name(bssqllogsetname : UInt8**) : HRESULT
    @lpVtbl.value.get_sql_log_set_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bssqllogsetname)
  end
end
struct LibWin32::ISystemMonitor2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_appearance(iappearance : Int32*) : HRESULT
    @lpVtbl.value.get_appearance.unsafe_as(Proc(Int32*, HRESULT)).call(iappearance)
  end
  def put_appearance(iappearance : Int32) : HRESULT
    @lpVtbl.value.put_appearance.unsafe_as(Proc(Int32, HRESULT)).call(iappearance)
  end
  def get_back_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_back_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_border_style(iborderstyle : Int32*) : HRESULT
    @lpVtbl.value.get_border_style.unsafe_as(Proc(Int32*, HRESULT)).call(iborderstyle)
  end
  def put_border_style(iborderstyle : Int32) : HRESULT
    @lpVtbl.value.put_border_style.unsafe_as(Proc(Int32, HRESULT)).call(iborderstyle)
  end
  def get_fore_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_fore_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_fore_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_fore_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_font(ppfont : IFontDisp*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(IFontDisp*, HRESULT)).call(ppfont)
  end
  def putref_font(pfont : IFontDisp) : HRESULT
    @lpVtbl.value.putref_font.unsafe_as(Proc(IFontDisp, HRESULT)).call(pfont)
  end
  def get_counters(ppicounters : ICounters*) : HRESULT
    @lpVtbl.value.get_counters.unsafe_as(Proc(ICounters*, HRESULT)).call(ppicounters)
  end
  def put_show_vertical_grid(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_vertical_grid.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_vertical_grid(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_vertical_grid.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_horizontal_grid(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_horizontal_grid.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_horizontal_grid(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_horizontal_grid.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_legend(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_legend.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_legend(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_legend.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_scale_labels(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_scale_labels.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_scale_labels(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_scale_labels.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_value_bar(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_value_bar.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_value_bar(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_value_bar.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_maximum_scale(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_maximum_scale.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_maximum_scale(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_maximum_scale.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_minimum_scale(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_minimum_scale.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_minimum_scale(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_minimum_scale.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_update_interval(fvalue : Float32) : HRESULT
    @lpVtbl.value.put_update_interval.unsafe_as(Proc(Float32, HRESULT)).call(fvalue)
  end
  def get_update_interval(pfvalue : Float32*) : HRESULT
    @lpVtbl.value.get_update_interval.unsafe_as(Proc(Float32*, HRESULT)).call(pfvalue)
  end
  def put_display_type(edisplaytype : DisplayTypeConstants) : HRESULT
    @lpVtbl.value.put_display_type.unsafe_as(Proc(DisplayTypeConstants, HRESULT)).call(edisplaytype)
  end
  def get_display_type(pedisplaytype : DisplayTypeConstants*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(DisplayTypeConstants*, HRESULT)).call(pedisplaytype)
  end
  def put_manual_update(bstate : Int16) : HRESULT
    @lpVtbl.value.put_manual_update.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_manual_update(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_manual_update.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_graph_title(bstitle : UInt8*) : HRESULT
    @lpVtbl.value.put_graph_title.unsafe_as(Proc(UInt8*, HRESULT)).call(bstitle)
  end
  def get_graph_title(pbstitle : UInt8**) : HRESULT
    @lpVtbl.value.get_graph_title.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstitle)
  end
  def put_y_axis_label(bstitle : UInt8*) : HRESULT
    @lpVtbl.value.put_y_axis_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstitle)
  end
  def get_y_axis_label(pbstitle : UInt8**) : HRESULT
    @lpVtbl.value.get_y_axis_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstitle)
  end
  def collect_sample : HRESULT
    @lpVtbl.value.collect_sample.unsafe_as(Proc(HRESULT)).call
  end
  def update_graph : HRESULT
    @lpVtbl.value.update_graph.unsafe_as(Proc(HRESULT)).call
  end
  def browse_counters : HRESULT
    @lpVtbl.value.browse_counters.unsafe_as(Proc(HRESULT)).call
  end
  def display_properties : HRESULT
    @lpVtbl.value.display_properties.unsafe_as(Proc(HRESULT)).call
  end
  def counter(iindex : Int32, ppicounter : ICounterItem*) : HRESULT
    @lpVtbl.value.counter.unsafe_as(Proc(Int32, ICounterItem*, HRESULT)).call(iindex, ppicounter)
  end
  def add_counter(bspath : UInt8*, ppicounter : ICounterItem*) : HRESULT
    @lpVtbl.value.add_counter.unsafe_as(Proc(UInt8*, ICounterItem*, HRESULT)).call(bspath, ppicounter)
  end
  def delete_counter(pctr : ICounterItem) : HRESULT
    @lpVtbl.value.delete_counter.unsafe_as(Proc(ICounterItem, HRESULT)).call(pctr)
  end
  def get_back_color_ctl(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color_ctl.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_back_color_ctl(color : UInt32) : HRESULT
    @lpVtbl.value.put_back_color_ctl.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def put_log_file_name(bsfilename : UInt8*) : HRESULT
    @lpVtbl.value.put_log_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bsfilename)
  end
  def get_log_file_name(bsfilename : UInt8**) : HRESULT
    @lpVtbl.value.get_log_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bsfilename)
  end
  def put_log_view_start(starttime : Float64) : HRESULT
    @lpVtbl.value.put_log_view_start.unsafe_as(Proc(Float64, HRESULT)).call(starttime)
  end
  def get_log_view_start(starttime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_start.unsafe_as(Proc(Float64*, HRESULT)).call(starttime)
  end
  def put_log_view_stop(stoptime : Float64) : HRESULT
    @lpVtbl.value.put_log_view_stop.unsafe_as(Proc(Float64, HRESULT)).call(stoptime)
  end
  def get_log_view_stop(stoptime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_stop.unsafe_as(Proc(Float64*, HRESULT)).call(stoptime)
  end
  def get_grid_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_grid_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_grid_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_grid_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_time_bar_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_time_bar_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_time_bar_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_time_bar_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_highlight(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_highlight.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_highlight(bstate : Int16) : HRESULT
    @lpVtbl.value.put_highlight.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_toolbar(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_toolbar.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_toolbar(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_toolbar.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def paste : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(HRESULT)).call
  end
  def copy : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(HRESULT)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def put_read_only(bstate : Int16) : HRESULT
    @lpVtbl.value.put_read_only.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_read_only(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_report_value_type(ereportvaluetype : ReportValueTypeConstants) : HRESULT
    @lpVtbl.value.put_report_value_type.unsafe_as(Proc(ReportValueTypeConstants, HRESULT)).call(ereportvaluetype)
  end
  def get_report_value_type(pereportvaluetype : ReportValueTypeConstants*) : HRESULT
    @lpVtbl.value.get_report_value_type.unsafe_as(Proc(ReportValueTypeConstants*, HRESULT)).call(pereportvaluetype)
  end
  def put_monitor_duplicate_instances(bstate : Int16) : HRESULT
    @lpVtbl.value.put_monitor_duplicate_instances.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_monitor_duplicate_instances(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_monitor_duplicate_instances.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_display_filter(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_display_filter.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_display_filter(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_display_filter.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def get_log_files(ppilogfiles : ILogFiles*) : HRESULT
    @lpVtbl.value.get_log_files.unsafe_as(Proc(ILogFiles*, HRESULT)).call(ppilogfiles)
  end
  def put_data_source_type(edatasourcetype : DataSourceTypeConstants) : HRESULT
    @lpVtbl.value.put_data_source_type.unsafe_as(Proc(DataSourceTypeConstants, HRESULT)).call(edatasourcetype)
  end
  def get_data_source_type(pedatasourcetype : DataSourceTypeConstants*) : HRESULT
    @lpVtbl.value.get_data_source_type.unsafe_as(Proc(DataSourceTypeConstants*, HRESULT)).call(pedatasourcetype)
  end
  def put_sql_dsn_name(bssqldsnname : UInt8*) : HRESULT
    @lpVtbl.value.put_sql_dsn_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bssqldsnname)
  end
  def get_sql_dsn_name(bssqldsnname : UInt8**) : HRESULT
    @lpVtbl.value.get_sql_dsn_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bssqldsnname)
  end
  def put_sql_log_set_name(bssqllogsetname : UInt8*) : HRESULT
    @lpVtbl.value.put_sql_log_set_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bssqllogsetname)
  end
  def get_sql_log_set_name(bssqllogsetname : UInt8**) : HRESULT
    @lpVtbl.value.get_sql_log_set_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bssqllogsetname)
  end
  def put_enable_digit_grouping(bstate : Int16) : HRESULT
    @lpVtbl.value.put_enable_digit_grouping.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_enable_digit_grouping(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_enable_digit_grouping.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_enable_tool_tips(bstate : Int16) : HRESULT
    @lpVtbl.value.put_enable_tool_tips.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_enable_tool_tips(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_enable_tool_tips.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_time_axis_labels(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_time_axis_labels.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_time_axis_labels(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_time_axis_labels.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_chart_scroll(bscroll : Int16) : HRESULT
    @lpVtbl.value.put_chart_scroll.unsafe_as(Proc(Int16, HRESULT)).call(bscroll)
  end
  def get_chart_scroll(pbscroll : Int16*) : HRESULT
    @lpVtbl.value.get_chart_scroll.unsafe_as(Proc(Int16*, HRESULT)).call(pbscroll)
  end
  def put_data_point_count(inewcount : Int32) : HRESULT
    @lpVtbl.value.put_data_point_count.unsafe_as(Proc(Int32, HRESULT)).call(inewcount)
  end
  def get_data_point_count(pidatapointcount : Int32*) : HRESULT
    @lpVtbl.value.get_data_point_count.unsafe_as(Proc(Int32*, HRESULT)).call(pidatapointcount)
  end
  def scale_to_fit(bselectedcountersonly : Int16) : HRESULT
    @lpVtbl.value.scale_to_fit.unsafe_as(Proc(Int16, HRESULT)).call(bselectedcountersonly)
  end
  def save_as(bstrfilename : UInt8*, esysmonfiletype : SysmonFileType) : HRESULT
    @lpVtbl.value.save_as.unsafe_as(Proc(UInt8*, SysmonFileType, HRESULT)).call(bstrfilename, esysmonfiletype)
  end
  def relog(bstrfilename : UInt8*, esysmonfiletype : SysmonFileType, ifilter : Int32) : HRESULT
    @lpVtbl.value.relog.unsafe_as(Proc(UInt8*, SysmonFileType, Int32, HRESULT)).call(bstrfilename, esysmonfiletype, ifilter)
  end
  def clear_data : HRESULT
    @lpVtbl.value.clear_data.unsafe_as(Proc(HRESULT)).call
  end
  def get_log_source_start_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_log_source_start_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_log_source_stop_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_log_source_stop_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def set_log_view_range(starttime : Float64, stoptime : Float64) : HRESULT
    @lpVtbl.value.set_log_view_range.unsafe_as(Proc(Float64, Float64, HRESULT)).call(starttime, stoptime)
  end
  def get_log_view_range(starttime : Float64*, stoptime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_range.unsafe_as(Proc(Float64*, Float64*, HRESULT)).call(starttime, stoptime)
  end
  def batching_lock(flock : Int16, ebatchreason : SysmonBatchReason) : HRESULT
    @lpVtbl.value.batching_lock.unsafe_as(Proc(Int16, SysmonBatchReason, HRESULT)).call(flock, ebatchreason)
  end
  def load_settings(bstrsettingfilename : UInt8*) : HRESULT
    @lpVtbl.value.load_settings.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsettingfilename)
  end
end
struct LibWin32::IISystemMonitorUnion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_appearance(iappearance : Int32*) : HRESULT
    @lpVtbl.value.get_appearance.unsafe_as(Proc(Int32*, HRESULT)).call(iappearance)
  end
  def put_appearance(iappearance : Int32) : HRESULT
    @lpVtbl.value.put_appearance.unsafe_as(Proc(Int32, HRESULT)).call(iappearance)
  end
  def get_back_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_back_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_back_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_border_style(iborderstyle : Int32*) : HRESULT
    @lpVtbl.value.get_border_style.unsafe_as(Proc(Int32*, HRESULT)).call(iborderstyle)
  end
  def put_border_style(iborderstyle : Int32) : HRESULT
    @lpVtbl.value.put_border_style.unsafe_as(Proc(Int32, HRESULT)).call(iborderstyle)
  end
  def get_fore_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_fore_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_fore_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_fore_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_font(ppfont : IFontDisp*) : HRESULT
    @lpVtbl.value.get_font.unsafe_as(Proc(IFontDisp*, HRESULT)).call(ppfont)
  end
  def putref_font(pfont : IFontDisp) : HRESULT
    @lpVtbl.value.putref_font.unsafe_as(Proc(IFontDisp, HRESULT)).call(pfont)
  end
  def get_counters(ppicounters : ICounters*) : HRESULT
    @lpVtbl.value.get_counters.unsafe_as(Proc(ICounters*, HRESULT)).call(ppicounters)
  end
  def put_show_vertical_grid(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_vertical_grid.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_vertical_grid(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_vertical_grid.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_horizontal_grid(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_horizontal_grid.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_horizontal_grid(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_horizontal_grid.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_legend(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_legend.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_legend(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_legend.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_scale_labels(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_scale_labels.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_scale_labels(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_scale_labels.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_value_bar(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_value_bar.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_value_bar(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_value_bar.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_maximum_scale(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_maximum_scale.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_maximum_scale(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_maximum_scale.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_minimum_scale(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_minimum_scale.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_minimum_scale(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_minimum_scale.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def put_update_interval(fvalue : Float32) : HRESULT
    @lpVtbl.value.put_update_interval.unsafe_as(Proc(Float32, HRESULT)).call(fvalue)
  end
  def get_update_interval(pfvalue : Float32*) : HRESULT
    @lpVtbl.value.get_update_interval.unsafe_as(Proc(Float32*, HRESULT)).call(pfvalue)
  end
  def put_display_type(edisplaytype : DisplayTypeConstants) : HRESULT
    @lpVtbl.value.put_display_type.unsafe_as(Proc(DisplayTypeConstants, HRESULT)).call(edisplaytype)
  end
  def get_display_type(pedisplaytype : DisplayTypeConstants*) : HRESULT
    @lpVtbl.value.get_display_type.unsafe_as(Proc(DisplayTypeConstants*, HRESULT)).call(pedisplaytype)
  end
  def put_manual_update(bstate : Int16) : HRESULT
    @lpVtbl.value.put_manual_update.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_manual_update(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_manual_update.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_graph_title(bstitle : UInt8*) : HRESULT
    @lpVtbl.value.put_graph_title.unsafe_as(Proc(UInt8*, HRESULT)).call(bstitle)
  end
  def get_graph_title(pbstitle : UInt8**) : HRESULT
    @lpVtbl.value.get_graph_title.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstitle)
  end
  def put_y_axis_label(bstitle : UInt8*) : HRESULT
    @lpVtbl.value.put_y_axis_label.unsafe_as(Proc(UInt8*, HRESULT)).call(bstitle)
  end
  def get_y_axis_label(pbstitle : UInt8**) : HRESULT
    @lpVtbl.value.get_y_axis_label.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstitle)
  end
  def collect_sample : HRESULT
    @lpVtbl.value.collect_sample.unsafe_as(Proc(HRESULT)).call
  end
  def update_graph : HRESULT
    @lpVtbl.value.update_graph.unsafe_as(Proc(HRESULT)).call
  end
  def browse_counters : HRESULT
    @lpVtbl.value.browse_counters.unsafe_as(Proc(HRESULT)).call
  end
  def display_properties : HRESULT
    @lpVtbl.value.display_properties.unsafe_as(Proc(HRESULT)).call
  end
  def counter(iindex : Int32, ppicounter : ICounterItem*) : HRESULT
    @lpVtbl.value.counter.unsafe_as(Proc(Int32, ICounterItem*, HRESULT)).call(iindex, ppicounter)
  end
  def add_counter(bspath : UInt8*, ppicounter : ICounterItem*) : HRESULT
    @lpVtbl.value.add_counter.unsafe_as(Proc(UInt8*, ICounterItem*, HRESULT)).call(bspath, ppicounter)
  end
  def delete_counter(pctr : ICounterItem) : HRESULT
    @lpVtbl.value.delete_counter.unsafe_as(Proc(ICounterItem, HRESULT)).call(pctr)
  end
  def get_back_color_ctl(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_back_color_ctl.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_back_color_ctl(color : UInt32) : HRESULT
    @lpVtbl.value.put_back_color_ctl.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def put_log_file_name(bsfilename : UInt8*) : HRESULT
    @lpVtbl.value.put_log_file_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bsfilename)
  end
  def get_log_file_name(bsfilename : UInt8**) : HRESULT
    @lpVtbl.value.get_log_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bsfilename)
  end
  def put_log_view_start(starttime : Float64) : HRESULT
    @lpVtbl.value.put_log_view_start.unsafe_as(Proc(Float64, HRESULT)).call(starttime)
  end
  def get_log_view_start(starttime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_start.unsafe_as(Proc(Float64*, HRESULT)).call(starttime)
  end
  def put_log_view_stop(stoptime : Float64) : HRESULT
    @lpVtbl.value.put_log_view_stop.unsafe_as(Proc(Float64, HRESULT)).call(stoptime)
  end
  def get_log_view_stop(stoptime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_stop.unsafe_as(Proc(Float64*, HRESULT)).call(stoptime)
  end
  def get_grid_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_grid_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_grid_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_grid_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_time_bar_color(pcolor : UInt32*) : HRESULT
    @lpVtbl.value.get_time_bar_color.unsafe_as(Proc(UInt32*, HRESULT)).call(pcolor)
  end
  def put_time_bar_color(color : UInt32) : HRESULT
    @lpVtbl.value.put_time_bar_color.unsafe_as(Proc(UInt32, HRESULT)).call(color)
  end
  def get_highlight(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_highlight.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_highlight(bstate : Int16) : HRESULT
    @lpVtbl.value.put_highlight.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_toolbar(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_toolbar.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_toolbar(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_toolbar.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def paste : HRESULT
    @lpVtbl.value.paste.unsafe_as(Proc(HRESULT)).call
  end
  def copy : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(HRESULT)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def put_read_only(bstate : Int16) : HRESULT
    @lpVtbl.value.put_read_only.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_read_only(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_report_value_type(ereportvaluetype : ReportValueTypeConstants) : HRESULT
    @lpVtbl.value.put_report_value_type.unsafe_as(Proc(ReportValueTypeConstants, HRESULT)).call(ereportvaluetype)
  end
  def get_report_value_type(pereportvaluetype : ReportValueTypeConstants*) : HRESULT
    @lpVtbl.value.get_report_value_type.unsafe_as(Proc(ReportValueTypeConstants*, HRESULT)).call(pereportvaluetype)
  end
  def put_monitor_duplicate_instances(bstate : Int16) : HRESULT
    @lpVtbl.value.put_monitor_duplicate_instances.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_monitor_duplicate_instances(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_monitor_duplicate_instances.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_display_filter(ivalue : Int32) : HRESULT
    @lpVtbl.value.put_display_filter.unsafe_as(Proc(Int32, HRESULT)).call(ivalue)
  end
  def get_display_filter(pivalue : Int32*) : HRESULT
    @lpVtbl.value.get_display_filter.unsafe_as(Proc(Int32*, HRESULT)).call(pivalue)
  end
  def get_log_files(ppilogfiles : ILogFiles*) : HRESULT
    @lpVtbl.value.get_log_files.unsafe_as(Proc(ILogFiles*, HRESULT)).call(ppilogfiles)
  end
  def put_data_source_type(edatasourcetype : DataSourceTypeConstants) : HRESULT
    @lpVtbl.value.put_data_source_type.unsafe_as(Proc(DataSourceTypeConstants, HRESULT)).call(edatasourcetype)
  end
  def get_data_source_type(pedatasourcetype : DataSourceTypeConstants*) : HRESULT
    @lpVtbl.value.get_data_source_type.unsafe_as(Proc(DataSourceTypeConstants*, HRESULT)).call(pedatasourcetype)
  end
  def put_sql_dsn_name(bssqldsnname : UInt8*) : HRESULT
    @lpVtbl.value.put_sql_dsn_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bssqldsnname)
  end
  def get_sql_dsn_name(bssqldsnname : UInt8**) : HRESULT
    @lpVtbl.value.get_sql_dsn_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bssqldsnname)
  end
  def put_sql_log_set_name(bssqllogsetname : UInt8*) : HRESULT
    @lpVtbl.value.put_sql_log_set_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bssqllogsetname)
  end
  def get_sql_log_set_name(bssqllogsetname : UInt8**) : HRESULT
    @lpVtbl.value.get_sql_log_set_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bssqllogsetname)
  end
  def put_enable_digit_grouping(bstate : Int16) : HRESULT
    @lpVtbl.value.put_enable_digit_grouping.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_enable_digit_grouping(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_enable_digit_grouping.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_enable_tool_tips(bstate : Int16) : HRESULT
    @lpVtbl.value.put_enable_tool_tips.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_enable_tool_tips(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_enable_tool_tips.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_show_time_axis_labels(bstate : Int16) : HRESULT
    @lpVtbl.value.put_show_time_axis_labels.unsafe_as(Proc(Int16, HRESULT)).call(bstate)
  end
  def get_show_time_axis_labels(pbstate : Int16*) : HRESULT
    @lpVtbl.value.get_show_time_axis_labels.unsafe_as(Proc(Int16*, HRESULT)).call(pbstate)
  end
  def put_chart_scroll(bscroll : Int16) : HRESULT
    @lpVtbl.value.put_chart_scroll.unsafe_as(Proc(Int16, HRESULT)).call(bscroll)
  end
  def get_chart_scroll(pbscroll : Int16*) : HRESULT
    @lpVtbl.value.get_chart_scroll.unsafe_as(Proc(Int16*, HRESULT)).call(pbscroll)
  end
  def put_data_point_count(inewcount : Int32) : HRESULT
    @lpVtbl.value.put_data_point_count.unsafe_as(Proc(Int32, HRESULT)).call(inewcount)
  end
  def get_data_point_count(pidatapointcount : Int32*) : HRESULT
    @lpVtbl.value.get_data_point_count.unsafe_as(Proc(Int32*, HRESULT)).call(pidatapointcount)
  end
  def scale_to_fit(bselectedcountersonly : Int16) : HRESULT
    @lpVtbl.value.scale_to_fit.unsafe_as(Proc(Int16, HRESULT)).call(bselectedcountersonly)
  end
  def save_as(bstrfilename : UInt8*, esysmonfiletype : SysmonFileType) : HRESULT
    @lpVtbl.value.save_as.unsafe_as(Proc(UInt8*, SysmonFileType, HRESULT)).call(bstrfilename, esysmonfiletype)
  end
  def relog(bstrfilename : UInt8*, esysmonfiletype : SysmonFileType, ifilter : Int32) : HRESULT
    @lpVtbl.value.relog.unsafe_as(Proc(UInt8*, SysmonFileType, Int32, HRESULT)).call(bstrfilename, esysmonfiletype, ifilter)
  end
  def clear_data : HRESULT
    @lpVtbl.value.clear_data.unsafe_as(Proc(HRESULT)).call
  end
  def get_log_source_start_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_log_source_start_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def get_log_source_stop_time(pdate : Float64*) : HRESULT
    @lpVtbl.value.get_log_source_stop_time.unsafe_as(Proc(Float64*, HRESULT)).call(pdate)
  end
  def set_log_view_range(starttime : Float64, stoptime : Float64) : HRESULT
    @lpVtbl.value.set_log_view_range.unsafe_as(Proc(Float64, Float64, HRESULT)).call(starttime, stoptime)
  end
  def get_log_view_range(starttime : Float64*, stoptime : Float64*) : HRESULT
    @lpVtbl.value.get_log_view_range.unsafe_as(Proc(Float64*, Float64*, HRESULT)).call(starttime, stoptime)
  end
  def batching_lock(flock : Int16, ebatchreason : SysmonBatchReason) : HRESULT
    @lpVtbl.value.batching_lock.unsafe_as(Proc(Int16, SysmonBatchReason, HRESULT)).call(flock, ebatchreason)
  end
  def load_settings(bstrsettingfilename : UInt8*) : HRESULT
    @lpVtbl.value.load_settings.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrsettingfilename)
  end
end
struct LibWin32::DISystemMonitor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::DISystemMonitorInternal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::ISystemMonitorEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_counter_selected(index : Int32) : Void
    @lpVtbl.value.on_counter_selected.unsafe_as(Proc(Int32, Void)).call(index)
  end
  def on_counter_added(index : Int32) : Void
    @lpVtbl.value.on_counter_added.unsafe_as(Proc(Int32, Void)).call(index)
  end
  def on_counter_deleted(index : Int32) : Void
    @lpVtbl.value.on_counter_deleted.unsafe_as(Proc(Int32, Void)).call(index)
  end
  def on_sample_collected : Void
    @lpVtbl.value.on_sample_collected.unsafe_as(Proc(Void)).call
  end
  def on_dbl_click(index : Int32) : Void
    @lpVtbl.value.on_dbl_click.unsafe_as(Proc(Int32, Void)).call(index)
  end
end
struct LibWin32::DISystemMonitorEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
