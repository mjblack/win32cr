require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:winsqlite3.dll")]
{% else %}
@[Link("winsqlite3")]
{% end %}
lib LibWin32
  SQLITE_VERSION_NUMBER = 3029000_u32
  SQLITE_OK = 0_u32
  SQLITE_ERROR = 1_u32
  SQLITE_INTERNAL = 2_u32
  SQLITE_PERM = 3_u32
  SQLITE_ABORT = 4_u32
  SQLITE_BUSY = 5_u32
  SQLITE_LOCKED = 6_u32
  SQLITE_NOMEM = 7_u32
  SQLITE_READONLY = 8_u32
  SQLITE_INTERRUPT = 9_u32
  SQLITE_IOERR = 10_u32
  SQLITE_CORRUPT = 11_u32
  SQLITE_NOTFOUND = 12_u32
  SQLITE_FULL = 13_u32
  SQLITE_CANTOPEN = 14_u32
  SQLITE_PROTOCOL = 15_u32
  SQLITE_EMPTY = 16_u32
  SQLITE_SCHEMA = 17_u32
  SQLITE_TOOBIG = 18_u32
  SQLITE_CONSTRAINT = 19_u32
  SQLITE_MISMATCH = 20_u32
  SQLITE_MISUSE = 21_u32
  SQLITE_NOLFS = 22_u32
  SQLITE_AUTH = 23_u32
  SQLITE_FORMAT = 24_u32
  SQLITE_RANGE = 25_u32
  SQLITE_NOTADB = 26_u32
  SQLITE_NOTICE = 27_u32
  SQLITE_WARNING = 28_u32
  SQLITE_ROW = 100_u32
  SQLITE_DONE = 101_u32
  SQLITE_OPEN_READONLY = 1_u32
  SQLITE_OPEN_READWRITE = 2_u32
  SQLITE_OPEN_CREATE = 4_u32
  SQLITE_OPEN_DELETEONCLOSE = 8_u32
  SQLITE_OPEN_EXCLUSIVE = 16_u32
  SQLITE_OPEN_AUTOPROXY = 32_u32
  SQLITE_OPEN_URI = 64_u32
  SQLITE_OPEN_MEMORY = 128_u32
  SQLITE_OPEN_MAIN_DB = 256_u32
  SQLITE_OPEN_TEMP_DB = 512_u32
  SQLITE_OPEN_TRANSIENT_DB = 1024_u32
  SQLITE_OPEN_MAIN_JOURNAL = 2048_u32
  SQLITE_OPEN_TEMP_JOURNAL = 4096_u32
  SQLITE_OPEN_SUBJOURNAL = 8192_u32
  SQLITE_OPEN_SUPER_JOURNAL = 16384_u32
  SQLITE_OPEN_NOMUTEX = 32768_u32
  SQLITE_OPEN_FULLMUTEX = 65536_u32
  SQLITE_OPEN_SHAREDCACHE = 131072_u32
  SQLITE_OPEN_PRIVATECACHE = 262144_u32
  SQLITE_OPEN_WAL = 524288_u32
  SQLITE_OPEN_NOFOLLOW = 16777216_u32
  SQLITE_OPEN_MASTER_JOURNAL = 16384_u32
  SQLITE_IOCAP_ATOMIC = 1_u32
  SQLITE_IOCAP_ATOMIC512 = 2_u32
  SQLITE_IOCAP_ATOMIC1K = 4_u32
  SQLITE_IOCAP_ATOMIC2K = 8_u32
  SQLITE_IOCAP_ATOMIC4K = 16_u32
  SQLITE_IOCAP_ATOMIC8K = 32_u32
  SQLITE_IOCAP_ATOMIC16K = 64_u32
  SQLITE_IOCAP_ATOMIC32K = 128_u32
  SQLITE_IOCAP_ATOMIC64K = 256_u32
  SQLITE_IOCAP_SAFE_APPEND = 512_u32
  SQLITE_IOCAP_SEQUENTIAL = 1024_u32
  SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN = 2048_u32
  SQLITE_IOCAP_POWERSAFE_OVERWRITE = 4096_u32
  SQLITE_IOCAP_IMMUTABLE = 8192_u32
  SQLITE_IOCAP_BATCH_ATOMIC = 16384_u32
  SQLITE_LOCK_NONE = 0_u32
  SQLITE_LOCK_SHARED = 1_u32
  SQLITE_LOCK_RESERVED = 2_u32
  SQLITE_LOCK_PENDING = 3_u32
  SQLITE_LOCK_EXCLUSIVE = 4_u32
  SQLITE_SYNC_NORMAL = 2_u32
  SQLITE_SYNC_FULL = 3_u32
  SQLITE_SYNC_DATAONLY = 16_u32
  SQLITE_FCNTL_LOCKSTATE = 1_u32
  SQLITE_FCNTL_GET_LOCKPROXYFILE = 2_u32
  SQLITE_FCNTL_SET_LOCKPROXYFILE = 3_u32
  SQLITE_FCNTL_LAST_ERRNO = 4_u32
  SQLITE_FCNTL_SIZE_HINT = 5_u32
  SQLITE_FCNTL_CHUNK_SIZE = 6_u32
  SQLITE_FCNTL_FILE_POINTER = 7_u32
  SQLITE_FCNTL_SYNC_OMITTED = 8_u32
  SQLITE_FCNTL_WIN32_AV_RETRY = 9_u32
  SQLITE_FCNTL_PERSIST_WAL = 10_u32
  SQLITE_FCNTL_OVERWRITE = 11_u32
  SQLITE_FCNTL_VFSNAME = 12_u32
  SQLITE_FCNTL_POWERSAFE_OVERWRITE = 13_u32
  SQLITE_FCNTL_PRAGMA = 14_u32
  SQLITE_FCNTL_BUSYHANDLER = 15_u32
  SQLITE_FCNTL_TEMPFILENAME = 16_u32
  SQLITE_FCNTL_MMAP_SIZE = 18_u32
  SQLITE_FCNTL_TRACE = 19_u32
  SQLITE_FCNTL_HAS_MOVED = 20_u32
  SQLITE_FCNTL_SYNC = 21_u32
  SQLITE_FCNTL_COMMIT_PHASETWO = 22_u32
  SQLITE_FCNTL_WIN32_SET_HANDLE = 23_u32
  SQLITE_FCNTL_WAL_BLOCK = 24_u32
  SQLITE_FCNTL_ZIPVFS = 25_u32
  SQLITE_FCNTL_RBU = 26_u32
  SQLITE_FCNTL_VFS_POINTER = 27_u32
  SQLITE_FCNTL_JOURNAL_POINTER = 28_u32
  SQLITE_FCNTL_WIN32_GET_HANDLE = 29_u32
  SQLITE_FCNTL_PDB = 30_u32
  SQLITE_FCNTL_BEGIN_ATOMIC_WRITE = 31_u32
  SQLITE_FCNTL_COMMIT_ATOMIC_WRITE = 32_u32
  SQLITE_FCNTL_ROLLBACK_ATOMIC_WRITE = 33_u32
  SQLITE_FCNTL_LOCK_TIMEOUT = 34_u32
  SQLITE_FCNTL_DATA_VERSION = 35_u32
  SQLITE_FCNTL_SIZE_LIMIT = 36_u32
  SQLITE_FCNTL_CKPT_DONE = 37_u32
  SQLITE_FCNTL_RESERVE_BYTES = 38_u32
  SQLITE_FCNTL_CKPT_START = 39_u32
  SQLITE_GET_LOCKPROXYFILE = 2_u32
  SQLITE_SET_LOCKPROXYFILE = 3_u32
  SQLITE_LAST_ERRNO = 4_u32
  SQLITE_ACCESS_EXISTS = 0_u32
  SQLITE_ACCESS_READWRITE = 1_u32
  SQLITE_ACCESS_READ = 2_u32
  SQLITE_SHM_UNLOCK = 1_u32
  SQLITE_SHM_LOCK = 2_u32
  SQLITE_SHM_SHARED = 4_u32
  SQLITE_SHM_EXCLUSIVE = 8_u32
  SQLITE_SHM_NLOCK = 8_u32
  SQLITE_CONFIG_SINGLETHREAD = 1_u32
  SQLITE_CONFIG_MULTITHREAD = 2_u32
  SQLITE_CONFIG_SERIALIZED = 3_u32
  SQLITE_CONFIG_MALLOC = 4_u32
  SQLITE_CONFIG_GETMALLOC = 5_u32
  SQLITE_CONFIG_SCRATCH = 6_u32
  SQLITE_CONFIG_PAGECACHE = 7_u32
  SQLITE_CONFIG_HEAP = 8_u32
  SQLITE_CONFIG_MEMSTATUS = 9_u32
  SQLITE_CONFIG_MUTEX = 10_u32
  SQLITE_CONFIG_GETMUTEX = 11_u32
  SQLITE_CONFIG_LOOKASIDE = 13_u32
  SQLITE_CONFIG_PCACHE = 14_u32
  SQLITE_CONFIG_GETPCACHE = 15_u32
  SQLITE_CONFIG_LOG = 16_u32
  SQLITE_CONFIG_URI = 17_u32
  SQLITE_CONFIG_PCACHE2 = 18_u32
  SQLITE_CONFIG_GETPCACHE2 = 19_u32
  SQLITE_CONFIG_COVERING_INDEX_SCAN = 20_u32
  SQLITE_CONFIG_SQLLOG = 21_u32
  SQLITE_CONFIG_MMAP_SIZE = 22_u32
  SQLITE_CONFIG_WIN32_HEAPSIZE = 23_u32
  SQLITE_CONFIG_PCACHE_HDRSZ = 24_u32
  SQLITE_CONFIG_PMASZ = 25_u32
  SQLITE_CONFIG_STMTJRNL_SPILL = 26_u32
  SQLITE_CONFIG_SMALL_MALLOC = 27_u32
  SQLITE_CONFIG_SORTERREF_SIZE = 28_u32
  SQLITE_CONFIG_MEMDB_MAXSIZE = 29_u32
  SQLITE_DBCONFIG_MAINDBNAME = 1000_u32
  SQLITE_DBCONFIG_LOOKASIDE = 1001_u32
  SQLITE_DBCONFIG_ENABLE_FKEY = 1002_u32
  SQLITE_DBCONFIG_ENABLE_TRIGGER = 1003_u32
  SQLITE_DBCONFIG_ENABLE_FTS3_TOKENIZER = 1004_u32
  SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION = 1005_u32
  SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE = 1006_u32
  SQLITE_DBCONFIG_ENABLE_QPSG = 1007_u32
  SQLITE_DBCONFIG_TRIGGER_EQP = 1008_u32
  SQLITE_DBCONFIG_RESET_DATABASE = 1009_u32
  SQLITE_DBCONFIG_DEFENSIVE = 1010_u32
  SQLITE_DBCONFIG_WRITABLE_SCHEMA = 1011_u32
  SQLITE_DBCONFIG_LEGACY_ALTER_TABLE = 1012_u32
  SQLITE_DBCONFIG_DQS_DML = 1013_u32
  SQLITE_DBCONFIG_DQS_DDL = 1014_u32
  SQLITE_DBCONFIG_ENABLE_VIEW = 1015_u32
  SQLITE_DBCONFIG_LEGACY_FILE_FORMAT = 1016_u32
  SQLITE_DBCONFIG_TRUSTED_SCHEMA = 1017_u32
  SQLITE_DBCONFIG_MAX = 1017_u32
  SQLITE_DENY = 1_u32
  SQLITE_IGNORE = 2_u32
  SQLITE_CREATE_INDEX = 1_u32
  SQLITE_CREATE_TABLE = 2_u32
  SQLITE_CREATE_TEMP_INDEX = 3_u32
  SQLITE_CREATE_TEMP_TABLE = 4_u32
  SQLITE_CREATE_TEMP_TRIGGER = 5_u32
  SQLITE_CREATE_TEMP_VIEW = 6_u32
  SQLITE_CREATE_TRIGGER = 7_u32
  SQLITE_CREATE_VIEW = 8_u32
  SQLITE_DELETE = 9_u32
  SQLITE_DROP_INDEX = 10_u32
  SQLITE_DROP_TABLE = 11_u32
  SQLITE_DROP_TEMP_INDEX = 12_u32
  SQLITE_DROP_TEMP_TABLE = 13_u32
  SQLITE_DROP_TEMP_TRIGGER = 14_u32
  SQLITE_DROP_TEMP_VIEW = 15_u32
  SQLITE_DROP_TRIGGER = 16_u32
  SQLITE_DROP_VIEW = 17_u32
  SQLITE_INSERT = 18_u32
  SQLITE_PRAGMA = 19_u32
  SQLITE_READ = 20_u32
  SQLITE_SELECT = 21_u32
  SQLITE_TRANSACTION = 22_u32
  SQLITE_UPDATE = 23_u32
  SQLITE_ATTACH = 24_u32
  SQLITE_DETACH = 25_u32
  SQLITE_ALTER_TABLE = 26_u32
  SQLITE_REINDEX = 27_u32
  SQLITE_ANALYZE = 28_u32
  SQLITE_CREATE_VTABLE = 29_u32
  SQLITE_DROP_VTABLE = 30_u32
  SQLITE_FUNCTION = 31_u32
  SQLITE_SAVEPOINT = 32_u32
  SQLITE_COPY = 0_u32
  SQLITE_RECURSIVE = 33_u32
  SQLITE_TRACE_STMT = 1_u32
  SQLITE_TRACE_PROFILE = 2_u32
  SQLITE_TRACE_ROW = 4_u32
  SQLITE_TRACE_CLOSE = 8_u32
  SQLITE_LIMIT_LENGTH = 0_u32
  SQLITE_LIMIT_SQL_LENGTH = 1_u32
  SQLITE_LIMIT_COLUMN = 2_u32
  SQLITE_LIMIT_EXPR_DEPTH = 3_u32
  SQLITE_LIMIT_COMPOUND_SELECT = 4_u32
  SQLITE_LIMIT_VDBE_OP = 5_u32
  SQLITE_LIMIT_FUNCTION_ARG = 6_u32
  SQLITE_LIMIT_ATTACHED = 7_u32
  SQLITE_LIMIT_LIKE_PATTERN_LENGTH = 8_u32
  SQLITE_LIMIT_VARIABLE_NUMBER = 9_u32
  SQLITE_LIMIT_TRIGGER_DEPTH = 10_u32
  SQLITE_LIMIT_WORKER_THREADS = 11_u32
  SQLITE_PREPARE_PERSISTENT = 1_u32
  SQLITE_PREPARE_NORMALIZE = 2_u32
  SQLITE_PREPARE_NO_VTAB = 4_u32
  SQLITE_INTEGER = 1_u32
  SQLITE_FLOAT = 2_u32
  SQLITE_BLOB = 4_u32
  SQLITE_NULL = 5_u32
  SQLITE3_TEXT = 3_u32
  SQLITE_UTF8 = 1_u32
  SQLITE_UTF16LE = 2_u32
  SQLITE_UTF16BE = 3_u32
  SQLITE_UTF16 = 4_u32
  SQLITE_ANY = 5_u32
  SQLITE_UTF16_ALIGNED = 8_u32
  SQLITE_DETERMINISTIC = 2048_u64
  SQLITE_DIRECTONLY = 524288_u64
  SQLITE_SUBTYPE = 1048576_u64
  SQLITE_INNOCUOUS = 2097152_u64
  SQLITE_WIN32_DATA_DIRECTORY_TYPE = 1_u32
  SQLITE_WIN32_TEMP_DIRECTORY_TYPE = 2_u32
  SQLITE_TXN_NONE = 0_u32
  SQLITE_TXN_READ = 1_u32
  SQLITE_TXN_WRITE = 2_u32
  SQLITE_INDEX_SCAN_UNIQUE = 1_u32
  SQLITE_INDEX_CONSTRAINT_EQ = 2_u32
  SQLITE_INDEX_CONSTRAINT_GT = 4_u32
  SQLITE_INDEX_CONSTRAINT_LE = 8_u32
  SQLITE_INDEX_CONSTRAINT_LT = 16_u32
  SQLITE_INDEX_CONSTRAINT_GE = 32_u32
  SQLITE_INDEX_CONSTRAINT_MATCH = 64_u32
  SQLITE_INDEX_CONSTRAINT_LIKE = 65_u32
  SQLITE_INDEX_CONSTRAINT_GLOB = 66_u32
  SQLITE_INDEX_CONSTRAINT_REGEXP = 67_u32
  SQLITE_INDEX_CONSTRAINT_NE = 68_u32
  SQLITE_INDEX_CONSTRAINT_ISNOT = 69_u32
  SQLITE_INDEX_CONSTRAINT_ISNOTNULL = 70_u32
  SQLITE_INDEX_CONSTRAINT_ISNULL = 71_u32
  SQLITE_INDEX_CONSTRAINT_IS = 72_u32
  SQLITE_INDEX_CONSTRAINT_FUNCTION = 150_u32
  SQLITE_MUTEX_FAST = 0_u32
  SQLITE_MUTEX_RECURSIVE = 1_u32
  SQLITE_MUTEX_STATIC_MAIN = 2_u32
  SQLITE_MUTEX_STATIC_MEM = 3_u32
  SQLITE_MUTEX_STATIC_MEM2 = 4_u32
  SQLITE_MUTEX_STATIC_OPEN = 4_u32
  SQLITE_MUTEX_STATIC_PRNG = 5_u32
  SQLITE_MUTEX_STATIC_LRU = 6_u32
  SQLITE_MUTEX_STATIC_LRU2 = 7_u32
  SQLITE_MUTEX_STATIC_PMEM = 7_u32
  SQLITE_MUTEX_STATIC_APP1 = 8_u32
  SQLITE_MUTEX_STATIC_APP2 = 9_u32
  SQLITE_MUTEX_STATIC_APP3 = 10_u32
  SQLITE_MUTEX_STATIC_VFS1 = 11_u32
  SQLITE_MUTEX_STATIC_VFS2 = 12_u32
  SQLITE_MUTEX_STATIC_VFS3 = 13_u32
  SQLITE_MUTEX_STATIC_MASTER = 2_u32
  SQLITE_TESTCTRL_FIRST = 5_u32
  SQLITE_TESTCTRL_PRNG_SAVE = 5_u32
  SQLITE_TESTCTRL_PRNG_RESTORE = 6_u32
  SQLITE_TESTCTRL_PRNG_RESET = 7_u32
  SQLITE_TESTCTRL_BITVEC_TEST = 8_u32
  SQLITE_TESTCTRL_FAULT_INSTALL = 9_u32
  SQLITE_TESTCTRL_BENIGN_MALLOC_HOOKS = 10_u32
  SQLITE_TESTCTRL_PENDING_BYTE = 11_u32
  SQLITE_TESTCTRL_ASSERT = 12_u32
  SQLITE_TESTCTRL_ALWAYS = 13_u32
  SQLITE_TESTCTRL_RESERVE = 14_u32
  SQLITE_TESTCTRL_OPTIMIZATIONS = 15_u32
  SQLITE_TESTCTRL_ISKEYWORD = 16_u32
  SQLITE_TESTCTRL_SCRATCHMALLOC = 17_u32
  SQLITE_TESTCTRL_INTERNAL_FUNCTIONS = 17_u32
  SQLITE_TESTCTRL_LOCALTIME_FAULT = 18_u32
  SQLITE_TESTCTRL_EXPLAIN_STMT = 19_u32
  SQLITE_TESTCTRL_ONCE_RESET_THRESHOLD = 19_u32
  SQLITE_TESTCTRL_NEVER_CORRUPT = 20_u32
  SQLITE_TESTCTRL_VDBE_COVERAGE = 21_u32
  SQLITE_TESTCTRL_BYTEORDER = 22_u32
  SQLITE_TESTCTRL_ISINIT = 23_u32
  SQLITE_TESTCTRL_SORTER_MMAP = 24_u32
  SQLITE_TESTCTRL_IMPOSTER = 25_u32
  SQLITE_TESTCTRL_PARSER_COVERAGE = 26_u32
  SQLITE_TESTCTRL_RESULT_INTREAL = 27_u32
  SQLITE_TESTCTRL_PRNG_SEED = 28_u32
  SQLITE_TESTCTRL_EXTRA_SCHEMA_CHECKS = 29_u32
  SQLITE_TESTCTRL_SEEK_COUNT = 30_u32
  SQLITE_TESTCTRL_LAST = 30_u32
  SQLITE_STATUS_MEMORY_USED = 0_u32
  SQLITE_STATUS_PAGECACHE_USED = 1_u32
  SQLITE_STATUS_PAGECACHE_OVERFLOW = 2_u32
  SQLITE_STATUS_SCRATCH_USED = 3_u32
  SQLITE_STATUS_SCRATCH_OVERFLOW = 4_u32
  SQLITE_STATUS_MALLOC_SIZE = 5_u32
  SQLITE_STATUS_PARSER_STACK = 6_u32
  SQLITE_STATUS_PAGECACHE_SIZE = 7_u32
  SQLITE_STATUS_SCRATCH_SIZE = 8_u32
  SQLITE_STATUS_MALLOC_COUNT = 9_u32
  SQLITE_DBSTATUS_LOOKASIDE_USED = 0_u32
  SQLITE_DBSTATUS_CACHE_USED = 1_u32
  SQLITE_DBSTATUS_SCHEMA_USED = 2_u32
  SQLITE_DBSTATUS_STMT_USED = 3_u32
  SQLITE_DBSTATUS_LOOKASIDE_HIT = 4_u32
  SQLITE_DBSTATUS_LOOKASIDE_MISS_SIZE = 5_u32
  SQLITE_DBSTATUS_LOOKASIDE_MISS_FULL = 6_u32
  SQLITE_DBSTATUS_CACHE_HIT = 7_u32
  SQLITE_DBSTATUS_CACHE_MISS = 8_u32
  SQLITE_DBSTATUS_CACHE_WRITE = 9_u32
  SQLITE_DBSTATUS_DEFERRED_FKS = 10_u32
  SQLITE_DBSTATUS_CACHE_USED_SHARED = 11_u32
  SQLITE_DBSTATUS_CACHE_SPILL = 12_u32
  SQLITE_DBSTATUS_MAX = 12_u32
  SQLITE_STMTSTATUS_FULLSCAN_STEP = 1_u32
  SQLITE_STMTSTATUS_SORT = 2_u32
  SQLITE_STMTSTATUS_AUTOINDEX = 3_u32
  SQLITE_STMTSTATUS_VM_STEP = 4_u32
  SQLITE_STMTSTATUS_REPREPARE = 5_u32
  SQLITE_STMTSTATUS_RUN = 6_u32
  SQLITE_STMTSTATUS_MEMUSED = 99_u32
  SQLITE_CHECKPOINT_PASSIVE = 0_u32
  SQLITE_CHECKPOINT_FULL = 1_u32
  SQLITE_CHECKPOINT_RESTART = 2_u32
  SQLITE_CHECKPOINT_TRUNCATE = 3_u32
  SQLITE_VTAB_CONSTRAINT_SUPPORT = 1_u32
  SQLITE_VTAB_INNOCUOUS = 2_u32
  SQLITE_VTAB_DIRECTONLY = 3_u32
  SQLITE_ROLLBACK = 1_u32
  SQLITE_FAIL = 3_u32
  SQLITE_REPLACE = 5_u32
  SQLITE_SCANSTAT_NLOOP = 0_u32
  SQLITE_SCANSTAT_NVISIT = 1_u32
  SQLITE_SCANSTAT_EST = 2_u32
  SQLITE_SCANSTAT_NAME = 3_u32
  SQLITE_SCANSTAT_EXPLAIN = 4_u32
  SQLITE_SCANSTAT_SELECTID = 5_u32
  SQLITE_SERIALIZE_NOCOPY = 1_u32
  SQLITE_DESERIALIZE_FREEONCLOSE = 1_u32
  SQLITE_DESERIALIZE_RESIZEABLE = 2_u32
  SQLITE_DESERIALIZE_READONLY = 4_u32
  NOT_WITHIN = 0_u32
  PARTLY_WITHIN = 1_u32
  FULLY_WITHIN = 2_u32
  SQLITESESSION_H_ = 1_u32
  SQLITE_CHANGESETSTART_INVERT = 2_u32
  SQLITE_CHANGESETAPPLY_NOSAVEPOINT = 1_u32
  SQLITE_CHANGESETAPPLY_INVERT = 2_u32
  SQLITE_CHANGESET_DATA = 1_u32
  SQLITE_CHANGESET_NOTFOUND = 2_u32
  SQLITE_CHANGESET_CONFLICT = 3_u32
  SQLITE_CHANGESET_CONSTRAINT = 4_u32
  SQLITE_CHANGESET_FOREIGN_KEY = 5_u32
  SQLITE_CHANGESET_OMIT = 0_u32
  SQLITE_CHANGESET_REPLACE = 1_u32
  SQLITE_CHANGESET_ABORT = 2_u32
  SQLITE_SESSION_CONFIG_STRMSIZE = 1_u32
  FTS5_TOKENIZE_QUERY = 1_u32
  FTS5_TOKENIZE_PREFIX = 2_u32
  FTS5_TOKENIZE_DOCUMENT = 4_u32
  FTS5_TOKENIZE_AUX = 8_u32
  FTS5_TOKEN_COLOCATED = 1_u32

  type Sqlite3 = Void
  type Sqlite3_mutex = Void
  type Sqlite3_stmt = Void
  type Sqlite3_value = Void
  type Sqlite3_context = Void
  type Sqlite3_blob = Void
  type Sqlite3_str = Void
  type Sqlite3_pcache = Void
  type Sqlite3_backup = Void
  type Fts5Context = Void
  type Fts5Tokenizer = Void

  alias Sqlite3_callback = Proc(Void*, Int32, Int8**, Int8**, Int32)
  alias Sqlite3_syscall_ptr = Proc(Void)
  alias Sqlite3_destructor_type = Proc(Void*, Void)
  alias Fts5_extension_function = Proc(Fts5ExtensionApi*, Fts5Context*, Sqlite3_context*, Int32, Sqlite3_value**, Void)
  alias Sqlite3_loadext_entry = Proc(Sqlite3*, Int8**, Sqlite3_api_routines*, Int32)

  struct Sqlite3_file
    p_methods : Sqlite3_io_methods*
  end
  struct Sqlite3_io_methods
    i_version : Int32
    x_close : LibC::IntPtrT
    x_read : LibC::IntPtrT
    x_write : LibC::IntPtrT
    x_truncate : LibC::IntPtrT
    x_sync : LibC::IntPtrT
    x_file_size : LibC::IntPtrT
    x_lock : LibC::IntPtrT
    x_unlock : LibC::IntPtrT
    x_check_reserved_lock : LibC::IntPtrT
    x_file_control : LibC::IntPtrT
    x_sector_size : LibC::IntPtrT
    x_device_characteristics : LibC::IntPtrT
    x_shm_map : LibC::IntPtrT
    x_shm_lock : LibC::IntPtrT
    x_shm_barrier : LibC::IntPtrT
    x_shm_unmap : LibC::IntPtrT
    x_fetch : LibC::IntPtrT
    x_unfetch : LibC::IntPtrT
  end
  struct Sqlite3_vfs
    i_version : Int32
    sz_os_file : Int32
    mx_pathname : Int32
    p_next : Sqlite3_vfs*
    z_name : PSTR
    p_app_data : Void*
    x_open : LibC::IntPtrT
    x_delete : LibC::IntPtrT
    x_access : LibC::IntPtrT
    x_full_pathname : LibC::IntPtrT
    x_dl_open : LibC::IntPtrT
    x_dl_error : LibC::IntPtrT
    x_dl_sym : LibC::IntPtrT
    x_dl_close : LibC::IntPtrT
    x_randomness : LibC::IntPtrT
    x_sleep : LibC::IntPtrT
    x_current_time : LibC::IntPtrT
    x_get_last_error : LibC::IntPtrT
    x_current_time_int64 : LibC::IntPtrT
    x_set_system_call : LibC::IntPtrT
    x_get_system_call : LibC::IntPtrT
    x_next_system_call : LibC::IntPtrT
  end
  struct Sqlite3_mem_methods
    x_malloc : LibC::IntPtrT
    x_free : LibC::IntPtrT
    x_realloc : LibC::IntPtrT
    x_size : LibC::IntPtrT
    x_roundup : LibC::IntPtrT
    x_init : LibC::IntPtrT
    x_shutdown : LibC::IntPtrT
    p_app_data : Void*
  end
  struct Sqlite3_module
    i_version : Int32
    x_create : LibC::IntPtrT
    x_connect : LibC::IntPtrT
    x_best_index : LibC::IntPtrT
    x_disconnect : LibC::IntPtrT
    x_destroy : LibC::IntPtrT
    x_open : LibC::IntPtrT
    x_close : LibC::IntPtrT
    x_filter : LibC::IntPtrT
    x_next : LibC::IntPtrT
    x_eof : LibC::IntPtrT
    x_column : LibC::IntPtrT
    x_rowid : LibC::IntPtrT
    x_update : LibC::IntPtrT
    x_begin : LibC::IntPtrT
    x_sync : LibC::IntPtrT
    x_commit : LibC::IntPtrT
    x_rollback : LibC::IntPtrT
    x_find_function : LibC::IntPtrT
    x_rename : LibC::IntPtrT
    x_savepoint : LibC::IntPtrT
    x_release : LibC::IntPtrT
    x_rollback_to : LibC::IntPtrT
    x_shadow_name : LibC::IntPtrT
  end
  struct Sqlite3_index_info
    n_constraint : Int32
    a_constraint : Sqlite3_index_info_sqlite3_index_constraint*
    n_order_by : Int32
    a_order_by : Sqlite3_index_info_sqlite3_index_orderby*
    a_constraint_usage : Sqlite3_index_info_sqlite3_index_constraint_usage*
    idx_num : Int32
    idx_str : PSTR
    need_to_free_idx_str : Int32
    order_by_consumed : Int32
    estimated_cost : Float64
    estimated_rows : Int64
    idx_flags : Int32
    col_used : UInt64
  end
  struct Sqlite3_index_info_sqlite3_index_orderby
    i_column : Int32
    desc : UInt8
  end
  struct Sqlite3_index_info_sqlite3_index_constraint_usage
    argv_index : Int32
    omit : UInt8
  end
  struct Sqlite3_index_info_sqlite3_index_constraint
    i_column : Int32
    op : UInt8
    usable : UInt8
    i_term_offset : Int32
  end
  struct Sqlite3_vtab
    p_module : Sqlite3_module*
    n_ref : Int32
    z_err_msg : PSTR
  end
  struct Sqlite3_vtab_cursor
    p_vtab : Sqlite3_vtab*
  end
  struct Sqlite3_mutex_methods
    x_mutex_init : LibC::IntPtrT
    x_mutex_end : LibC::IntPtrT
    x_mutex_alloc : Sqlite3_mutex*********
    x_mutex_free : LibC::IntPtrT
    x_mutex_enter : LibC::IntPtrT
    x_mutex_try : LibC::IntPtrT
    x_mutex_leave : LibC::IntPtrT
    x_mutex_held : LibC::IntPtrT
    x_mutex_notheld : LibC::IntPtrT
  end
  struct Sqlite3_pcache_page
    p_buf : Void*
    p_extra : Void*
  end
  struct Sqlite3_pcache_methods2
    i_version : Int32
    p_arg : Void*
    x_init : LibC::IntPtrT
    x_shutdown : LibC::IntPtrT
    x_create : Sqlite3_pcache*********
    x_cachesize : LibC::IntPtrT
    x_pagecount : LibC::IntPtrT
    x_fetch : Sqlite3_pcache_page*******************
    x_unpin : LibC::IntPtrT
    x_rekey : LibC::IntPtrT
    x_truncate : LibC::IntPtrT
    x_destroy : LibC::IntPtrT
    x_shrink : LibC::IntPtrT
  end
  struct Sqlite3_pcache_methods
    p_arg : Void*
    x_init : LibC::IntPtrT
    x_shutdown : LibC::IntPtrT
    x_create : Sqlite3_pcache*********
    x_cachesize : LibC::IntPtrT
    x_pagecount : LibC::IntPtrT
    x_fetch : LibC::IntPtrT
    x_unpin : LibC::IntPtrT
    x_rekey : LibC::IntPtrT
    x_truncate : LibC::IntPtrT
    x_destroy : LibC::IntPtrT
  end
  struct Sqlite3_snapshot
    hidden : UInt8[48]*
  end
  struct Sqlite3_rtree_geometry
    p_context : Void*
    n_param : Int32
    a_param : Float64*
    p_user : Void*
    x_del_user : LibC::IntPtrT
  end
  struct Sqlite3_rtree_query_info
    p_context : Void*
    n_param : Int32
    a_param : Float64*
    p_user : Void*
    x_del_user : LibC::IntPtrT
    a_coord : Float64*
    an_queue : UInt32*
    n_coord : Int32
    i_level : Int32
    mx_level : Int32
    i_rowid : Int64
    r_parent_score : Float64
    e_parent_within : Int32
    e_within : Int32
    r_score : Float64
    ap_sql_param : Sqlite3_value**
  end
  struct Fts5PhraseIter
    a : UInt8*
    b : UInt8*
  end
  struct Fts5ExtensionApi
    i_version : Int32
    x_user_data : LibC::IntPtrT
    x_column_count : LibC::IntPtrT
    x_row_count : LibC::IntPtrT
    x_column_total_size : LibC::IntPtrT
    x_tokenize : LibC::IntPtrT
    x_phrase_count : LibC::IntPtrT
    x_phrase_size : LibC::IntPtrT
    x_inst_count : LibC::IntPtrT
    x_inst : LibC::IntPtrT
    x_rowid : LibC::IntPtrT
    x_column_text : LibC::IntPtrT
    x_column_size : LibC::IntPtrT
    x_query_phrase : LibC::IntPtrT
    x_set_auxdata : LibC::IntPtrT
    x_get_auxdata : LibC::IntPtrT
    x_phrase_first : LibC::IntPtrT
    x_phrase_next : LibC::IntPtrT
    x_phrase_first_column : LibC::IntPtrT
    x_phrase_next_column : LibC::IntPtrT
  end
  struct Fts5_tokenizer
    x_create : LibC::IntPtrT
    x_delete : LibC::IntPtrT
    x_tokenize : LibC::IntPtrT
  end
  struct Fts5_api
    i_version : Int32
    x_create_tokenizer : LibC::IntPtrT
    x_find_tokenizer : LibC::IntPtrT
    x_create_function : LibC::IntPtrT
  end
  struct Sqlite3_api_routines
    aggregate_context : LibC::IntPtrT
    aggregate_count : LibC::IntPtrT
    bind_blob : LibC::IntPtrT
    bind_double : LibC::IntPtrT
    bind_int : LibC::IntPtrT
    bind_int64 : LibC::IntPtrT
    bind_null : LibC::IntPtrT
    bind_parameter_count : LibC::IntPtrT
    bind_parameter_index : LibC::IntPtrT
    bind_parameter_name : LibC::IntPtrT
    bind_text : LibC::IntPtrT
    bind_text16 : LibC::IntPtrT
    bind_value : LibC::IntPtrT
    busy_handler : LibC::IntPtrT
    busy_timeout : LibC::IntPtrT
    changes : LibC::IntPtrT
    close : LibC::IntPtrT
    collation_needed : LibC::IntPtrT
    collation_needed16 : LibC::IntPtrT
    column_blob : LibC::IntPtrT
    column_bytes : LibC::IntPtrT
    column_bytes16 : LibC::IntPtrT
    column_count : LibC::IntPtrT
    column_database_name : LibC::IntPtrT
    column_database_name16 : LibC::IntPtrT
    column_decltype : LibC::IntPtrT
    column_decltype16 : LibC::IntPtrT
    column_double : LibC::IntPtrT
    column_int : LibC::IntPtrT
    column_int64 : LibC::IntPtrT
    column_name : LibC::IntPtrT
    column_name16 : LibC::IntPtrT
    column_origin_name : LibC::IntPtrT
    column_origin_name16 : LibC::IntPtrT
    column_table_name : LibC::IntPtrT
    column_table_name16 : LibC::IntPtrT
    column_text : LibC::IntPtrT
    column_text16 : LibC::IntPtrT
    column_type : LibC::IntPtrT
    column_value : Sqlite3_value*****************
    commit_hook : LibC::IntPtrT
    complete : LibC::IntPtrT
    complete16 : LibC::IntPtrT
    create_collation : LibC::IntPtrT
    create_collation16 : LibC::IntPtrT
    create_function : LibC::IntPtrT
    create_function16 : LibC::IntPtrT
    create_module : LibC::IntPtrT
    data_count : LibC::IntPtrT
    db_handle : Sqlite3*****************
    declare_vtab : LibC::IntPtrT
    enable_shared_cache : LibC::IntPtrT
    errcode : LibC::IntPtrT
    errmsg : LibC::IntPtrT
    errmsg16 : LibC::IntPtrT
    exec : LibC::IntPtrT
    expired : LibC::IntPtrT
    finalize_ : LibC::IntPtrT
    free : LibC::IntPtrT
    free_table : LibC::IntPtrT
    get_autocommit : LibC::IntPtrT
    get_auxdata : LibC::IntPtrT
    get_table : LibC::IntPtrT
    global_recover : LibC::IntPtrT
    interruptx : LibC::IntPtrT
    last_insert_rowid : LibC::IntPtrT
    libversion : LibC::IntPtrT
    libversion_number : LibC::IntPtrT
    malloc : LibC::IntPtrT
    mprintf : LibC::IntPtrT
    open : LibC::IntPtrT
    open16 : LibC::IntPtrT
    prepare : LibC::IntPtrT
    prepare16 : LibC::IntPtrT
    profile : LibC::IntPtrT
    progress_handler : LibC::IntPtrT
    realloc : LibC::IntPtrT
    reset : LibC::IntPtrT
    result_blob : LibC::IntPtrT
    result_double : LibC::IntPtrT
    result_error : LibC::IntPtrT
    result_error16 : LibC::IntPtrT
    result_int : LibC::IntPtrT
    result_int64 : LibC::IntPtrT
    result_null : LibC::IntPtrT
    result_text : LibC::IntPtrT
    result_text16 : LibC::IntPtrT
    result_text16be : LibC::IntPtrT
    result_text16le : LibC::IntPtrT
    result_value : LibC::IntPtrT
    rollback_hook : LibC::IntPtrT
    set_authorizer : LibC::IntPtrT
    set_auxdata : LibC::IntPtrT
    xsnprintf : LibC::IntPtrT
    step : LibC::IntPtrT
    table_column_metadata : LibC::IntPtrT
    thread_cleanup : LibC::IntPtrT
    total_changes : LibC::IntPtrT
    trace : LibC::IntPtrT
    transfer_bindings : LibC::IntPtrT
    update_hook : LibC::IntPtrT
    user_data : LibC::IntPtrT
    value_blob : LibC::IntPtrT
    value_bytes : LibC::IntPtrT
    value_bytes16 : LibC::IntPtrT
    value_double : LibC::IntPtrT
    value_int : LibC::IntPtrT
    value_int64 : LibC::IntPtrT
    value_numeric_type : LibC::IntPtrT
    value_text : LibC::IntPtrT
    value_text16 : LibC::IntPtrT
    value_text16be : LibC::IntPtrT
    value_text16le : LibC::IntPtrT
    value_type : LibC::IntPtrT
    vmprintf : LibC::IntPtrT
    overload_function : LibC::IntPtrT
    prepare_v2 : LibC::IntPtrT
    prepare16_v2 : LibC::IntPtrT
    clear_bindings : LibC::IntPtrT
    create_module_v2 : LibC::IntPtrT
    bind_zeroblob : LibC::IntPtrT
    blob_bytes : LibC::IntPtrT
    blob_close : LibC::IntPtrT
    blob_open : LibC::IntPtrT
    blob_read : LibC::IntPtrT
    blob_write : LibC::IntPtrT
    create_collation_v2 : LibC::IntPtrT
    file_control : LibC::IntPtrT
    memory_highwater : LibC::IntPtrT
    memory_used : LibC::IntPtrT
    mutex_alloc : Sqlite3_mutex*********
    mutex_enter : LibC::IntPtrT
    mutex_free : LibC::IntPtrT
    mutex_leave : LibC::IntPtrT
    mutex_try : LibC::IntPtrT
    open_v2 : LibC::IntPtrT
    release_memory : LibC::IntPtrT
    result_error_nomem : LibC::IntPtrT
    result_error_toobig : LibC::IntPtrT
    sleep : LibC::IntPtrT
    soft_heap_limit : LibC::IntPtrT
    vfs_find : Sqlite3_vfs**********
    vfs_register : LibC::IntPtrT
    vfs_unregister : LibC::IntPtrT
    xthreadsafe : LibC::IntPtrT
    result_zeroblob : LibC::IntPtrT
    result_error_code : LibC::IntPtrT
    test_control : LibC::IntPtrT
    randomness : LibC::IntPtrT
    context_db_handle : Sqlite3********************
    extended_result_codes : LibC::IntPtrT
    limit : LibC::IntPtrT
    next_stmt : Sqlite3_stmt************
    sql : LibC::IntPtrT
    status : LibC::IntPtrT
    backup_finish : LibC::IntPtrT
    backup_init : Sqlite3_backup************
    backup_pagecount : LibC::IntPtrT
    backup_remaining : LibC::IntPtrT
    backup_step : LibC::IntPtrT
    compileoption_get : LibC::IntPtrT
    compileoption_used : LibC::IntPtrT
    create_function_v2 : LibC::IntPtrT
    db_config : LibC::IntPtrT
    db_mutex : Sqlite3_mutex************
    db_status : LibC::IntPtrT
    extended_errcode : LibC::IntPtrT
    log : LibC::IntPtrT
    soft_heap_limit64 : LibC::IntPtrT
    sourceid : LibC::IntPtrT
    stmt_status : LibC::IntPtrT
    strnicmp : LibC::IntPtrT
    unlock_notify : LibC::IntPtrT
    wal_autocheckpoint : LibC::IntPtrT
    wal_checkpoint : LibC::IntPtrT
    wal_hook : LibC::IntPtrT
    blob_reopen : LibC::IntPtrT
    vtab_config : LibC::IntPtrT
    vtab_on_conflict : LibC::IntPtrT
    close_v2 : LibC::IntPtrT
    db_filename : LibC::IntPtrT
    db_readonly : LibC::IntPtrT
    db_release_memory : LibC::IntPtrT
    errstr : LibC::IntPtrT
    stmt_busy : LibC::IntPtrT
    stmt_readonly : LibC::IntPtrT
    stricmp : LibC::IntPtrT
    uri_boolean : LibC::IntPtrT
    uri_int64 : LibC::IntPtrT
    uri_parameter : LibC::IntPtrT
    xvsnprintf : LibC::IntPtrT
    wal_checkpoint_v2 : LibC::IntPtrT
    auto_extension : LibC::IntPtrT
    bind_blob64 : LibC::IntPtrT
    bind_text64 : LibC::IntPtrT
    cancel_auto_extension : LibC::IntPtrT
    load_extension : LibC::IntPtrT
    malloc64 : LibC::IntPtrT
    msize : LibC::IntPtrT
    realloc64 : LibC::IntPtrT
    reset_auto_extension : LibC::IntPtrT
    result_blob64 : LibC::IntPtrT
    result_text64 : LibC::IntPtrT
    strglob : LibC::IntPtrT
    value_dup : Sqlite3_value**********
    value_free : LibC::IntPtrT
    result_zeroblob64 : LibC::IntPtrT
    bind_zeroblob64 : LibC::IntPtrT
    value_subtype : LibC::IntPtrT
    result_subtype : LibC::IntPtrT
    status64 : LibC::IntPtrT
    strlike : LibC::IntPtrT
    db_cacheflush : LibC::IntPtrT
    system_errno : LibC::IntPtrT
    trace_v2 : LibC::IntPtrT
    expanded_sql : LibC::IntPtrT
    set_last_insert_rowid : LibC::IntPtrT
    prepare_v3 : LibC::IntPtrT
    prepare16_v3 : LibC::IntPtrT
    bind_pointer : LibC::IntPtrT
    result_pointer : LibC::IntPtrT
    value_pointer : LibC::IntPtrT
    vtab_nochange : LibC::IntPtrT
    value_nochange : LibC::IntPtrT
    vtab_collation : LibC::IntPtrT
    keyword_count : LibC::IntPtrT
    keyword_name : LibC::IntPtrT
    keyword_check : LibC::IntPtrT
    str_new : Sqlite3_str************
    str_finish : LibC::IntPtrT
    str_appendf : LibC::IntPtrT
    str_vappendf : LibC::IntPtrT
    str_append : LibC::IntPtrT
    str_appendall : LibC::IntPtrT
    str_appendchar : LibC::IntPtrT
    str_reset : LibC::IntPtrT
    str_errcode : LibC::IntPtrT
    str_length : LibC::IntPtrT
    str_value : LibC::IntPtrT
    create_window_function : LibC::IntPtrT
    normalized_sql : LibC::IntPtrT
    stmt_isexplain : LibC::IntPtrT
    value_frombind : LibC::IntPtrT
    drop_modules : LibC::IntPtrT
    hard_heap_limit64 : LibC::IntPtrT
    uri_key : LibC::IntPtrT
    filename_database : LibC::IntPtrT
    filename_journal : LibC::IntPtrT
    filename_wal : LibC::IntPtrT
    create_filename : LibC::IntPtrT
    free_filename : LibC::IntPtrT
    database_file_object : Sqlite3_file**********
    txn_state : LibC::IntPtrT
  end


  # Params # 
  fun sqlite3_libversion : PSTR

  # Params # 
  fun sqlite3_sourceid : PSTR

  # Params # 
  fun sqlite3_libversion_number : Int32

  # Params # zoptname : PSTR [In]
  fun sqlite3_compileoption_used(zoptname : PSTR) : Int32

  # Params # n : Int32 [In]
  fun sqlite3_compileoption_get(n : Int32) : PSTR

  # Params # 
  fun sqlite3_threadsafe : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_close(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_close_v2(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3* [In],sql : PSTR [In],callback : LibC::IntPtrT [In],param3 : Void* [In],errmsg : Int8** [In]
  fun sqlite3_exec(param0 : Sqlite3*, sql : PSTR, callback : LibC::IntPtrT, param3 : Void*, errmsg : Int8**) : Int32

  # Params # 
  fun sqlite3_initialize : Int32

  # Params # 
  fun sqlite3_shutdown : Int32

  # Params # 
  fun sqlite3_os_init : Int32

  # Params # 
  fun sqlite3_os_end : Int32

  # Params # param0 : Int32 [In]
  fun sqlite3_config(param0 : Int32) : Int32

  # Params # param0 : Sqlite3* [In],op : Int32 [In]
  fun sqlite3_db_config(param0 : Sqlite3*, op : Int32) : Int32

  # Params # param0 : Sqlite3* [In],onoff : Int32 [In]
  fun sqlite3_extended_result_codes(param0 : Sqlite3*, onoff : Int32) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_last_insert_rowid(param0 : Sqlite3*) : Int64

  # Params # param0 : Sqlite3* [In],param1 : Int64 [In]
  fun sqlite3_set_last_insert_rowid(param0 : Sqlite3*, param1 : Int64) : Void

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_changes(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_total_changes(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_interrupt(param0 : Sqlite3*) : Void

  # Params # sql : PSTR [In]
  fun sqlite3_complete(sql : PSTR) : Int32

  # Params # sql : Void* [In]
  fun sqlite3_complete16(sql : Void*) : Int32

  # Params # param0 : Sqlite3* [In],param1 : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_busy_handler(param0 : Sqlite3*, param1 : LibC::IntPtrT, param2 : Void*) : Int32

  # Params # param0 : Sqlite3* [In],ms : Int32 [In]
  fun sqlite3_busy_timeout(param0 : Sqlite3*, ms : Int32) : Int32

  # Params # db : Sqlite3* [In],zsql : PSTR [In],pazresult : Int8*** [In],pnrow : Int32* [In],pncolumn : Int32* [In],pzerrmsg : Int8** [In]
  fun sqlite3_get_table(db : Sqlite3*, zsql : PSTR, pazresult : Int8***, pnrow : Int32*, pncolumn : Int32*, pzerrmsg : Int8**) : Int32

  # Params # result : Int8** [In]
  fun sqlite3_free_table(result : Int8**) : Void

  # Params # param0 : PSTR [In]
  fun sqlite3_mprintf(param0 : PSTR) : PSTR

  # Params # param0 : PSTR [In],param1 : Int8* [In]
  fun sqlite3_vmprintf(param0 : PSTR, param1 : Int8*) : PSTR

  # Params # param0 : Int32 [In],param1 : PSTR [In],param2 : PSTR [In]
  fun sqlite3_snprintf(param0 : Int32, param1 : PSTR, param2 : PSTR) : PSTR

  # Params # param0 : Int32 [In],param1 : PSTR [In],param2 : PSTR [In],param3 : Int8* [In]
  fun sqlite3_vsnprintf(param0 : Int32, param1 : PSTR, param2 : PSTR, param3 : Int8*) : PSTR

  # Params # param0 : Int32 [In]
  fun sqlite3_malloc(param0 : Int32) : Void*

  # Params # param0 : UInt64 [In]
  fun sqlite3_malloc64(param0 : UInt64) : Void*

  # Params # param0 : Void* [In],param1 : Int32 [In]
  fun sqlite3_realloc(param0 : Void*, param1 : Int32) : Void*

  # Params # param0 : Void* [In],param1 : UInt64 [In]
  fun sqlite3_realloc64(param0 : Void*, param1 : UInt64) : Void*

  # Params # param0 : Void* [In]
  fun sqlite3_free(param0 : Void*) : Void

  # Params # param0 : Void* [In]
  fun sqlite3_msize(param0 : Void*) : UInt64

  # Params # 
  fun sqlite3_memory_used : Int64

  # Params # resetflag : Int32 [In]
  fun sqlite3_memory_highwater(resetflag : Int32) : Int64

  # Params # n : Int32 [In],p : Void* [In]
  fun sqlite3_randomness(n : Int32, p : Void*) : Void

  # Params # param0 : Sqlite3* [In],xauth : LibC::IntPtrT [In],puserdata : Void* [In]
  fun sqlite3_set_authorizer(param0 : Sqlite3*, xauth : LibC::IntPtrT, puserdata : Void*) : Int32

  # Params # param0 : Sqlite3* [In],xtrace : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_trace(param0 : Sqlite3*, xtrace : LibC::IntPtrT, param2 : Void*) : Void*

  # Params # param0 : Sqlite3* [In],xprofile : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_profile(param0 : Sqlite3*, xprofile : LibC::IntPtrT, param2 : Void*) : Void*

  # Params # param0 : Sqlite3* [In],umask : UInt32 [In],xcallback : LibC::IntPtrT [In],pctx : Void* [In]
  fun sqlite3_trace_v2(param0 : Sqlite3*, umask : UInt32, xcallback : LibC::IntPtrT, pctx : Void*) : Int32

  # Params # param0 : Sqlite3* [In],param1 : Int32 [In],param2 : LibC::IntPtrT [In],param3 : Void* [In]
  fun sqlite3_progress_handler(param0 : Sqlite3*, param1 : Int32, param2 : LibC::IntPtrT, param3 : Void*) : Void

  # Params # filename : PSTR [In],ppdb : Sqlite3** [In]
  fun sqlite3_open(filename : PSTR, ppdb : Sqlite3**) : Int32

  # Params # filename : Void* [In],ppdb : Sqlite3** [In]
  fun sqlite3_open16(filename : Void*, ppdb : Sqlite3**) : Int32

  # Params # filename : PSTR [In],ppdb : Sqlite3** [In],flags : Int32 [In],zvfs : PSTR [In]
  fun sqlite3_open_v2(filename : PSTR, ppdb : Sqlite3**, flags : Int32, zvfs : PSTR) : Int32

  # Params # zfilename : PSTR [In],zparam : PSTR [In]
  fun sqlite3_uri_parameter(zfilename : PSTR, zparam : PSTR) : PSTR

  # Params # zfile : PSTR [In],zparam : PSTR [In],bdefault : Int32 [In]
  fun sqlite3_uri_boolean(zfile : PSTR, zparam : PSTR, bdefault : Int32) : Int32

  # Params # param0 : PSTR [In],param1 : PSTR [In],param2 : Int64 [In]
  fun sqlite3_uri_int64(param0 : PSTR, param1 : PSTR, param2 : Int64) : Int64

  # Params # zfilename : PSTR [In],n : Int32 [In]
  fun sqlite3_uri_key(zfilename : PSTR, n : Int32) : PSTR

  # Params # param0 : PSTR [In]
  fun sqlite3_filename_database(param0 : PSTR) : PSTR

  # Params # param0 : PSTR [In]
  fun sqlite3_filename_journal(param0 : PSTR) : PSTR

  # Params # param0 : PSTR [In]
  fun sqlite3_filename_wal(param0 : PSTR) : PSTR

  # Params # param0 : PSTR [In]
  fun sqlite3_database_file_object(param0 : PSTR) : Sqlite3_file*

  # Params # zdatabase : PSTR [In],zjournal : PSTR [In],zwal : PSTR [In],nparam : Int32 [In],azparam : Int8** [In]
  fun sqlite3_create_filename(zdatabase : PSTR, zjournal : PSTR, zwal : PSTR, nparam : Int32, azparam : Int8**) : PSTR

  # Params # param0 : PSTR [In]
  fun sqlite3_free_filename(param0 : PSTR) : Void

  # Params # db : Sqlite3* [In]
  fun sqlite3_errcode(db : Sqlite3*) : Int32

  # Params # db : Sqlite3* [In]
  fun sqlite3_extended_errcode(db : Sqlite3*) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_errmsg(param0 : Sqlite3*) : PSTR

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_errmsg16(param0 : Sqlite3*) : Void*

  # Params # param0 : Int32 [In]
  fun sqlite3_errstr(param0 : Int32) : PSTR

  # Params # param0 : Sqlite3* [In],id : Int32 [In],newval : Int32 [In]
  fun sqlite3_limit(param0 : Sqlite3*, id : Int32, newval : Int32) : Int32

  # Params # db : Sqlite3* [In],zsql : PSTR [In],nbyte : Int32 [In],ppstmt : Sqlite3_stmt** [In],pztail : Int8** [In]
  fun sqlite3_prepare(db : Sqlite3*, zsql : PSTR, nbyte : Int32, ppstmt : Sqlite3_stmt**, pztail : Int8**) : Int32

  # Params # db : Sqlite3* [In],zsql : PSTR [In],nbyte : Int32 [In],ppstmt : Sqlite3_stmt** [In],pztail : Int8** [In]
  fun sqlite3_prepare_v2(db : Sqlite3*, zsql : PSTR, nbyte : Int32, ppstmt : Sqlite3_stmt**, pztail : Int8**) : Int32

  # Params # db : Sqlite3* [In],zsql : PSTR [In],nbyte : Int32 [In],prepflags : UInt32 [In],ppstmt : Sqlite3_stmt** [In],pztail : Int8** [In]
  fun sqlite3_prepare_v3(db : Sqlite3*, zsql : PSTR, nbyte : Int32, prepflags : UInt32, ppstmt : Sqlite3_stmt**, pztail : Int8**) : Int32

  # Params # db : Sqlite3* [In],zsql : Void* [In],nbyte : Int32 [In],ppstmt : Sqlite3_stmt** [In],pztail : Void** [In]
  fun sqlite3_prepare16(db : Sqlite3*, zsql : Void*, nbyte : Int32, ppstmt : Sqlite3_stmt**, pztail : Void**) : Int32

  # Params # db : Sqlite3* [In],zsql : Void* [In],nbyte : Int32 [In],ppstmt : Sqlite3_stmt** [In],pztail : Void** [In]
  fun sqlite3_prepare16_v2(db : Sqlite3*, zsql : Void*, nbyte : Int32, ppstmt : Sqlite3_stmt**, pztail : Void**) : Int32

  # Params # db : Sqlite3* [In],zsql : Void* [In],nbyte : Int32 [In],prepflags : UInt32 [In],ppstmt : Sqlite3_stmt** [In],pztail : Void** [In]
  fun sqlite3_prepare16_v3(db : Sqlite3*, zsql : Void*, nbyte : Int32, prepflags : UInt32, ppstmt : Sqlite3_stmt**, pztail : Void**) : Int32

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_sql(pstmt : Sqlite3_stmt*) : PSTR

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_expanded_sql(pstmt : Sqlite3_stmt*) : PSTR

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_stmt_readonly(pstmt : Sqlite3_stmt*) : Int32

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_stmt_isexplain(pstmt : Sqlite3_stmt*) : Int32

  # Params # param0 : Sqlite3_stmt* [In]
  fun sqlite3_stmt_busy(param0 : Sqlite3_stmt*) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Void* [In],n : Int32 [In],param4 : LibC::IntPtrT [In]
  fun sqlite3_bind_blob(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Void*, n : Int32, param4 : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Void* [In],param3 : UInt64 [In],param4 : LibC::IntPtrT [In]
  fun sqlite3_bind_blob64(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Void*, param3 : UInt64, param4 : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Float64 [In]
  fun sqlite3_bind_double(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Float64) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Int32 [In]
  fun sqlite3_bind_int(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Int64 [In]
  fun sqlite3_bind_int64(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Int64) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_bind_null(param0 : Sqlite3_stmt*, param1 : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : PSTR [In],param3 : Int32 [In],param4 : LibC::IntPtrT [In]
  fun sqlite3_bind_text(param0 : Sqlite3_stmt*, param1 : Int32, param2 : PSTR, param3 : Int32, param4 : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Void* [In],param3 : Int32 [In],param4 : LibC::IntPtrT [In]
  fun sqlite3_bind_text16(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Void*, param3 : Int32, param4 : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : PSTR [In],param3 : UInt64 [In],param4 : LibC::IntPtrT [In],encoding : UInt8 [In]
  fun sqlite3_bind_text64(param0 : Sqlite3_stmt*, param1 : Int32, param2 : PSTR, param3 : UInt64, param4 : LibC::IntPtrT, encoding : UInt8) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Sqlite3_value* [In]
  fun sqlite3_bind_value(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : Void* [In],param3 : PSTR [In],param4 : LibC::IntPtrT [In]
  fun sqlite3_bind_pointer(param0 : Sqlite3_stmt*, param1 : Int32, param2 : Void*, param3 : PSTR, param4 : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],n : Int32 [In]
  fun sqlite3_bind_zeroblob(param0 : Sqlite3_stmt*, param1 : Int32, n : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In],param2 : UInt64 [In]
  fun sqlite3_bind_zeroblob64(param0 : Sqlite3_stmt*, param1 : Int32, param2 : UInt64) : Int32

  # Params # param0 : Sqlite3_stmt* [In]
  fun sqlite3_bind_parameter_count(param0 : Sqlite3_stmt*) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_bind_parameter_name(param0 : Sqlite3_stmt*, param1 : Int32) : PSTR

  # Params # param0 : Sqlite3_stmt* [In],zname : PSTR [In]
  fun sqlite3_bind_parameter_index(param0 : Sqlite3_stmt*, zname : PSTR) : Int32

  # Params # param0 : Sqlite3_stmt* [In]
  fun sqlite3_clear_bindings(param0 : Sqlite3_stmt*) : Int32

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_column_count(pstmt : Sqlite3_stmt*) : Int32

  # Params # param0 : Sqlite3_stmt* [In],n : Int32 [In]
  fun sqlite3_column_name(param0 : Sqlite3_stmt*, n : Int32) : PSTR

  # Params # param0 : Sqlite3_stmt* [In],n : Int32 [In]
  fun sqlite3_column_name16(param0 : Sqlite3_stmt*, n : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_database_name(param0 : Sqlite3_stmt*, param1 : Int32) : PSTR

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_database_name16(param0 : Sqlite3_stmt*, param1 : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_table_name(param0 : Sqlite3_stmt*, param1 : Int32) : PSTR

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_table_name16(param0 : Sqlite3_stmt*, param1 : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_origin_name(param0 : Sqlite3_stmt*, param1 : Int32) : PSTR

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_origin_name16(param0 : Sqlite3_stmt*, param1 : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_decltype(param0 : Sqlite3_stmt*, param1 : Int32) : PSTR

  # Params # param0 : Sqlite3_stmt* [In],param1 : Int32 [In]
  fun sqlite3_column_decltype16(param0 : Sqlite3_stmt*, param1 : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In]
  fun sqlite3_step(param0 : Sqlite3_stmt*) : Int32

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_data_count(pstmt : Sqlite3_stmt*) : Int32

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_blob(param0 : Sqlite3_stmt*, icol : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_double(param0 : Sqlite3_stmt*, icol : Int32) : Float64

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_int(param0 : Sqlite3_stmt*, icol : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_int64(param0 : Sqlite3_stmt*, icol : Int32) : Int64

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_text(param0 : Sqlite3_stmt*, icol : Int32) : UInt8*

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_text16(param0 : Sqlite3_stmt*, icol : Int32) : Void*

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_value(param0 : Sqlite3_stmt*, icol : Int32) : Sqlite3_value*

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_bytes(param0 : Sqlite3_stmt*, icol : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_bytes16(param0 : Sqlite3_stmt*, icol : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],icol : Int32 [In]
  fun sqlite3_column_type(param0 : Sqlite3_stmt*, icol : Int32) : Int32

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_finalize(pstmt : Sqlite3_stmt*) : Int32

  # Params # pstmt : Sqlite3_stmt* [In]
  fun sqlite3_reset(pstmt : Sqlite3_stmt*) : Int32

  # Params # db : Sqlite3* [In],zfunctionname : PSTR [In],narg : Int32 [In],etextrep : Int32 [In],papp : Void* [In],xfunc : LibC::IntPtrT [In],xstep : LibC::IntPtrT [In],xfinal : LibC::IntPtrT [In]
  fun sqlite3_create_function(db : Sqlite3*, zfunctionname : PSTR, narg : Int32, etextrep : Int32, papp : Void*, xfunc : LibC::IntPtrT, xstep : LibC::IntPtrT, xfinal : LibC::IntPtrT) : Int32

  # Params # db : Sqlite3* [In],zfunctionname : Void* [In],narg : Int32 [In],etextrep : Int32 [In],papp : Void* [In],xfunc : LibC::IntPtrT [In],xstep : LibC::IntPtrT [In],xfinal : LibC::IntPtrT [In]
  fun sqlite3_create_function16(db : Sqlite3*, zfunctionname : Void*, narg : Int32, etextrep : Int32, papp : Void*, xfunc : LibC::IntPtrT, xstep : LibC::IntPtrT, xfinal : LibC::IntPtrT) : Int32

  # Params # db : Sqlite3* [In],zfunctionname : PSTR [In],narg : Int32 [In],etextrep : Int32 [In],papp : Void* [In],xfunc : LibC::IntPtrT [In],xstep : LibC::IntPtrT [In],xfinal : LibC::IntPtrT [In],xdestroy : LibC::IntPtrT [In]
  fun sqlite3_create_function_v2(db : Sqlite3*, zfunctionname : PSTR, narg : Int32, etextrep : Int32, papp : Void*, xfunc : LibC::IntPtrT, xstep : LibC::IntPtrT, xfinal : LibC::IntPtrT, xdestroy : LibC::IntPtrT) : Int32

  # Params # db : Sqlite3* [In],zfunctionname : PSTR [In],narg : Int32 [In],etextrep : Int32 [In],papp : Void* [In],xstep : LibC::IntPtrT [In],xfinal : LibC::IntPtrT [In],xvalue : LibC::IntPtrT [In],xinverse : LibC::IntPtrT [In],xdestroy : LibC::IntPtrT [In]
  fun sqlite3_create_window_function(db : Sqlite3*, zfunctionname : PSTR, narg : Int32, etextrep : Int32, papp : Void*, xstep : LibC::IntPtrT, xfinal : LibC::IntPtrT, xvalue : LibC::IntPtrT, xinverse : LibC::IntPtrT, xdestroy : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_aggregate_count(param0 : Sqlite3_context*) : Int32

  # Params # param0 : Sqlite3_stmt* [In]
  fun sqlite3_expired(param0 : Sqlite3_stmt*) : Int32

  # Params # param0 : Sqlite3_stmt* [In],param1 : Sqlite3_stmt* [In]
  fun sqlite3_transfer_bindings(param0 : Sqlite3_stmt*, param1 : Sqlite3_stmt*) : Int32

  # Params # 
  fun sqlite3_global_recover : Int32

  # Params # 
  fun sqlite3_thread_cleanup : Void

  # Params # param0 : LibC::IntPtrT [In],param1 : Void* [In],param2 : Int64 [In]
  fun sqlite3_memory_alarm(param0 : LibC::IntPtrT, param1 : Void*, param2 : Int64) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_blob(param0 : Sqlite3_value*) : Void*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_double(param0 : Sqlite3_value*) : Float64

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_int(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_int64(param0 : Sqlite3_value*) : Int64

  # Params # param0 : Sqlite3_value* [In],param1 : PSTR [In]
  fun sqlite3_value_pointer(param0 : Sqlite3_value*, param1 : PSTR) : Void*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_text(param0 : Sqlite3_value*) : UInt8*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_text16(param0 : Sqlite3_value*) : Void*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_text16le(param0 : Sqlite3_value*) : Void*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_text16be(param0 : Sqlite3_value*) : Void*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_bytes(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_bytes16(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_type(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_numeric_type(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_nochange(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_frombind(param0 : Sqlite3_value*) : Int32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_subtype(param0 : Sqlite3_value*) : UInt32

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_dup(param0 : Sqlite3_value*) : Sqlite3_value*

  # Params # param0 : Sqlite3_value* [In]
  fun sqlite3_value_free(param0 : Sqlite3_value*) : Void

  # Params # param0 : Sqlite3_context* [In],nbytes : Int32 [In]
  fun sqlite3_aggregate_context(param0 : Sqlite3_context*, nbytes : Int32) : Void*

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_user_data(param0 : Sqlite3_context*) : Void*

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_context_db_handle(param0 : Sqlite3_context*) : Sqlite3*

  # Params # param0 : Sqlite3_context* [In],n : Int32 [In]
  fun sqlite3_get_auxdata(param0 : Sqlite3_context*, n : Int32) : Void*

  # Params # param0 : Sqlite3_context* [In],n : Int32 [In],param2 : Void* [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_set_auxdata(param0 : Sqlite3_context*, n : Int32, param2 : Void*, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : Int32 [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_blob(param0 : Sqlite3_context*, param1 : Void*, param2 : Int32, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : UInt64 [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_blob64(param0 : Sqlite3_context*, param1 : Void*, param2 : UInt64, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Float64 [In]
  fun sqlite3_result_double(param0 : Sqlite3_context*, param1 : Float64) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : PSTR [In],param2 : Int32 [In]
  fun sqlite3_result_error(param0 : Sqlite3_context*, param1 : PSTR, param2 : Int32) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : Int32 [In]
  fun sqlite3_result_error16(param0 : Sqlite3_context*, param1 : Void*, param2 : Int32) : Void

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_result_error_toobig(param0 : Sqlite3_context*) : Void

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_result_error_nomem(param0 : Sqlite3_context*) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Int32 [In]
  fun sqlite3_result_error_code(param0 : Sqlite3_context*, param1 : Int32) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Int32 [In]
  fun sqlite3_result_int(param0 : Sqlite3_context*, param1 : Int32) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Int64 [In]
  fun sqlite3_result_int64(param0 : Sqlite3_context*, param1 : Int64) : Void

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_result_null(param0 : Sqlite3_context*) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : PSTR [In],param2 : Int32 [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_text(param0 : Sqlite3_context*, param1 : PSTR, param2 : Int32, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : PSTR [In],param2 : UInt64 [In],param3 : LibC::IntPtrT [In],encoding : UInt8 [In]
  fun sqlite3_result_text64(param0 : Sqlite3_context*, param1 : PSTR, param2 : UInt64, param3 : LibC::IntPtrT, encoding : UInt8) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : Int32 [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_text16(param0 : Sqlite3_context*, param1 : Void*, param2 : Int32, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : Int32 [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_text16le(param0 : Sqlite3_context*, param1 : Void*, param2 : Int32, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : Int32 [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_text16be(param0 : Sqlite3_context*, param1 : Void*, param2 : Int32, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Sqlite3_value* [In]
  fun sqlite3_result_value(param0 : Sqlite3_context*, param1 : Sqlite3_value*) : Void

  # Params # param0 : Sqlite3_context* [In],param1 : Void* [In],param2 : PSTR [In],param3 : LibC::IntPtrT [In]
  fun sqlite3_result_pointer(param0 : Sqlite3_context*, param1 : Void*, param2 : PSTR, param3 : LibC::IntPtrT) : Void

  # Params # param0 : Sqlite3_context* [In],n : Int32 [In]
  fun sqlite3_result_zeroblob(param0 : Sqlite3_context*, n : Int32) : Void

  # Params # param0 : Sqlite3_context* [In],n : UInt64 [In]
  fun sqlite3_result_zeroblob64(param0 : Sqlite3_context*, n : UInt64) : Int32

  # Params # param0 : Sqlite3_context* [In],param1 : UInt32 [In]
  fun sqlite3_result_subtype(param0 : Sqlite3_context*, param1 : UInt32) : Void

  # Params # param0 : Sqlite3* [In],zname : PSTR [In],etextrep : Int32 [In],parg : Void* [In],xcompare : LibC::IntPtrT [In]
  fun sqlite3_create_collation(param0 : Sqlite3*, zname : PSTR, etextrep : Int32, parg : Void*, xcompare : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3* [In],zname : PSTR [In],etextrep : Int32 [In],parg : Void* [In],xcompare : LibC::IntPtrT [In],xdestroy : LibC::IntPtrT [In]
  fun sqlite3_create_collation_v2(param0 : Sqlite3*, zname : PSTR, etextrep : Int32, parg : Void*, xcompare : LibC::IntPtrT, xdestroy : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3* [In],zname : Void* [In],etextrep : Int32 [In],parg : Void* [In],xcompare : LibC::IntPtrT [In]
  fun sqlite3_create_collation16(param0 : Sqlite3*, zname : Void*, etextrep : Int32, parg : Void*, xcompare : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3* [In],param1 : Void* [In],param2 : LibC::IntPtrT [In]
  fun sqlite3_collation_needed(param0 : Sqlite3*, param1 : Void*, param2 : LibC::IntPtrT) : Int32

  # Params # param0 : Sqlite3* [In],param1 : Void* [In],param2 : LibC::IntPtrT [In]
  fun sqlite3_collation_needed16(param0 : Sqlite3*, param1 : Void*, param2 : LibC::IntPtrT) : Int32

  # Params # param0 : Int32 [In]
  fun sqlite3_sleep(param0 : Int32) : Int32

  # Params # type : UInt32 [In],zvalue : Void* [In]
  fun sqlite3_win32_set_directory(type : UInt32, zvalue : Void*) : Int32

  # Params # type : UInt32 [In],zvalue : PSTR [In]
  fun sqlite3_win32_set_directory8(type : UInt32, zvalue : PSTR) : Int32

  # Params # type : UInt32 [In],zvalue : Void* [In]
  fun sqlite3_win32_set_directory16(type : UInt32, zvalue : Void*) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_get_autocommit(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3_stmt* [In]
  fun sqlite3_db_handle(param0 : Sqlite3_stmt*) : Sqlite3*

  # Params # db : Sqlite3* [In],zdbname : PSTR [In]
  fun sqlite3_db_filename(db : Sqlite3*, zdbname : PSTR) : PSTR

  # Params # db : Sqlite3* [In],zdbname : PSTR [In]
  fun sqlite3_db_readonly(db : Sqlite3*, zdbname : PSTR) : Int32

  # Params # param0 : Sqlite3* [In],zschema : PSTR [In]
  fun sqlite3_txn_state(param0 : Sqlite3*, zschema : PSTR) : Int32

  # Params # pdb : Sqlite3* [In],pstmt : Sqlite3_stmt* [In]
  fun sqlite3_next_stmt(pdb : Sqlite3*, pstmt : Sqlite3_stmt*) : Sqlite3_stmt*

  # Params # param0 : Sqlite3* [In],param1 : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_commit_hook(param0 : Sqlite3*, param1 : LibC::IntPtrT, param2 : Void*) : Void*

  # Params # param0 : Sqlite3* [In],param1 : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_rollback_hook(param0 : Sqlite3*, param1 : LibC::IntPtrT, param2 : Void*) : Void*

  # Params # param0 : Sqlite3* [In],param1 : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_update_hook(param0 : Sqlite3*, param1 : LibC::IntPtrT, param2 : Void*) : Void*

  # Params # param0 : Int32 [In]
  fun sqlite3_enable_shared_cache(param0 : Int32) : Int32

  # Params # param0 : Int32 [In]
  fun sqlite3_release_memory(param0 : Int32) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_db_release_memory(param0 : Sqlite3*) : Int32

  # Params # n : Int64 [In]
  fun sqlite3_soft_heap_limit64(n : Int64) : Int64

  # Params # n : Int64 [In]
  fun sqlite3_hard_heap_limit64(n : Int64) : Int64

  # Params # n : Int32 [In]
  fun sqlite3_soft_heap_limit(n : Int32) : Void

  # Params # db : Sqlite3* [In],zdbname : PSTR [In],ztablename : PSTR [In],zcolumnname : PSTR [In],pzdatatype : Int8** [In],pzcollseq : Int8** [In],pnotnull : Int32* [In],pprimarykey : Int32* [In],pautoinc : Int32* [In]
  fun sqlite3_table_column_metadata(db : Sqlite3*, zdbname : PSTR, ztablename : PSTR, zcolumnname : PSTR, pzdatatype : Int8**, pzcollseq : Int8**, pnotnull : Int32*, pprimarykey : Int32*, pautoinc : Int32*) : Int32

  # Params # db : Sqlite3* [In],zfile : PSTR [In],zproc : PSTR [In],pzerrmsg : Int8** [In]
  fun sqlite3_load_extension(db : Sqlite3*, zfile : PSTR, zproc : PSTR, pzerrmsg : Int8**) : Int32

  # Params # db : Sqlite3* [In],onoff : Int32 [In]
  fun sqlite3_enable_load_extension(db : Sqlite3*, onoff : Int32) : Int32

  # Params # xentrypoint : LibC::IntPtrT [In]
  fun sqlite3_auto_extension(xentrypoint : LibC::IntPtrT) : Int32

  # Params # xentrypoint : LibC::IntPtrT [In]
  fun sqlite3_cancel_auto_extension(xentrypoint : LibC::IntPtrT) : Int32

  # Params # 
  fun sqlite3_reset_auto_extension : Void

  # Params # db : Sqlite3* [In],zname : PSTR [In],p : Sqlite3_module* [In],pclientdata : Void* [In]
  fun sqlite3_create_module(db : Sqlite3*, zname : PSTR, p : Sqlite3_module*, pclientdata : Void*) : Int32

  # Params # db : Sqlite3* [In],zname : PSTR [In],p : Sqlite3_module* [In],pclientdata : Void* [In],xdestroy : LibC::IntPtrT [In]
  fun sqlite3_create_module_v2(db : Sqlite3*, zname : PSTR, p : Sqlite3_module*, pclientdata : Void*, xdestroy : LibC::IntPtrT) : Int32

  # Params # db : Sqlite3* [In],azkeep : Int8** [In]
  fun sqlite3_drop_modules(db : Sqlite3*, azkeep : Int8**) : Int32

  # Params # param0 : Sqlite3* [In],zsql : PSTR [In]
  fun sqlite3_declare_vtab(param0 : Sqlite3*, zsql : PSTR) : Int32

  # Params # param0 : Sqlite3* [In],zfuncname : PSTR [In],narg : Int32 [In]
  fun sqlite3_overload_function(param0 : Sqlite3*, zfuncname : PSTR, narg : Int32) : Int32

  # Params # param0 : Sqlite3* [In],zdb : PSTR [In],ztable : PSTR [In],zcolumn : PSTR [In],irow : Int64 [In],flags : Int32 [In],ppblob : Sqlite3_blob** [In]
  fun sqlite3_blob_open(param0 : Sqlite3*, zdb : PSTR, ztable : PSTR, zcolumn : PSTR, irow : Int64, flags : Int32, ppblob : Sqlite3_blob**) : Int32

  # Params # param0 : Sqlite3_blob* [In],param1 : Int64 [In]
  fun sqlite3_blob_reopen(param0 : Sqlite3_blob*, param1 : Int64) : Int32

  # Params # param0 : Sqlite3_blob* [In]
  fun sqlite3_blob_close(param0 : Sqlite3_blob*) : Int32

  # Params # param0 : Sqlite3_blob* [In]
  fun sqlite3_blob_bytes(param0 : Sqlite3_blob*) : Int32

  # Params # param0 : Sqlite3_blob* [In],z : Void* [In],n : Int32 [In],ioffset : Int32 [In]
  fun sqlite3_blob_read(param0 : Sqlite3_blob*, z : Void*, n : Int32, ioffset : Int32) : Int32

  # Params # param0 : Sqlite3_blob* [In],z : Void* [In],n : Int32 [In],ioffset : Int32 [In]
  fun sqlite3_blob_write(param0 : Sqlite3_blob*, z : Void*, n : Int32, ioffset : Int32) : Int32

  # Params # zvfsname : PSTR [In]
  fun sqlite3_vfs_find(zvfsname : PSTR) : Sqlite3_vfs*

  # Params # param0 : Sqlite3_vfs* [In],makedflt : Int32 [In]
  fun sqlite3_vfs_register(param0 : Sqlite3_vfs*, makedflt : Int32) : Int32

  # Params # param0 : Sqlite3_vfs* [In]
  fun sqlite3_vfs_unregister(param0 : Sqlite3_vfs*) : Int32

  # Params # param0 : Int32 [In]
  fun sqlite3_mutex_alloc(param0 : Int32) : Sqlite3_mutex*

  # Params # param0 : Sqlite3_mutex* [In]
  fun sqlite3_mutex_free(param0 : Sqlite3_mutex*) : Void

  # Params # param0 : Sqlite3_mutex* [In]
  fun sqlite3_mutex_enter(param0 : Sqlite3_mutex*) : Void

  # Params # param0 : Sqlite3_mutex* [In]
  fun sqlite3_mutex_try(param0 : Sqlite3_mutex*) : Int32

  # Params # param0 : Sqlite3_mutex* [In]
  fun sqlite3_mutex_leave(param0 : Sqlite3_mutex*) : Void

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_db_mutex(param0 : Sqlite3*) : Sqlite3_mutex*

  # Params # param0 : Sqlite3* [In],zdbname : PSTR [In],op : Int32 [In],param3 : Void* [In]
  fun sqlite3_file_control(param0 : Sqlite3*, zdbname : PSTR, op : Int32, param3 : Void*) : Int32

  # Params # op : Int32 [In]
  fun sqlite3_test_control(op : Int32) : Int32

  # Params # 
  fun sqlite3_keyword_count : Int32

  # Params # param0 : Int32 [In],param1 : Int8** [In],param2 : Int32* [In]
  fun sqlite3_keyword_name(param0 : Int32, param1 : Int8**, param2 : Int32*) : Int32

  # Params # param0 : PSTR [In],param1 : Int32 [In]
  fun sqlite3_keyword_check(param0 : PSTR, param1 : Int32) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_str_new(param0 : Sqlite3*) : Sqlite3_str*

  # Params # param0 : Sqlite3_str* [In]
  fun sqlite3_str_finish(param0 : Sqlite3_str*) : PSTR

  # Params # param0 : Sqlite3_str* [In],zformat : PSTR [In]
  fun sqlite3_str_appendf(param0 : Sqlite3_str*, zformat : PSTR) : Void

  # Params # param0 : Sqlite3_str* [In],zformat : PSTR [In],param2 : Int8* [In]
  fun sqlite3_str_vappendf(param0 : Sqlite3_str*, zformat : PSTR, param2 : Int8*) : Void

  # Params # param0 : Sqlite3_str* [In],zin : PSTR [In],n : Int32 [In]
  fun sqlite3_str_append(param0 : Sqlite3_str*, zin : PSTR, n : Int32) : Void

  # Params # param0 : Sqlite3_str* [In],zin : PSTR [In]
  fun sqlite3_str_appendall(param0 : Sqlite3_str*, zin : PSTR) : Void

  # Params # param0 : Sqlite3_str* [In],n : Int32 [In],c : CHAR [In]
  fun sqlite3_str_appendchar(param0 : Sqlite3_str*, n : Int32, c : CHAR) : Void

  # Params # param0 : Sqlite3_str* [In]
  fun sqlite3_str_reset(param0 : Sqlite3_str*) : Void

  # Params # param0 : Sqlite3_str* [In]
  fun sqlite3_str_errcode(param0 : Sqlite3_str*) : Int32

  # Params # param0 : Sqlite3_str* [In]
  fun sqlite3_str_length(param0 : Sqlite3_str*) : Int32

  # Params # param0 : Sqlite3_str* [In]
  fun sqlite3_str_value(param0 : Sqlite3_str*) : PSTR

  # Params # op : Int32 [In],pcurrent : Int32* [In],phighwater : Int32* [In],resetflag : Int32 [In]
  fun sqlite3_status(op : Int32, pcurrent : Int32*, phighwater : Int32*, resetflag : Int32) : Int32

  # Params # op : Int32 [In],pcurrent : Int64* [In],phighwater : Int64* [In],resetflag : Int32 [In]
  fun sqlite3_status64(op : Int32, pcurrent : Int64*, phighwater : Int64*, resetflag : Int32) : Int32

  # Params # param0 : Sqlite3* [In],op : Int32 [In],pcur : Int32* [In],phiwtr : Int32* [In],resetflg : Int32 [In]
  fun sqlite3_db_status(param0 : Sqlite3*, op : Int32, pcur : Int32*, phiwtr : Int32*, resetflg : Int32) : Int32

  # Params # param0 : Sqlite3_stmt* [In],op : Int32 [In],resetflg : Int32 [In]
  fun sqlite3_stmt_status(param0 : Sqlite3_stmt*, op : Int32, resetflg : Int32) : Int32

  # Params # pdest : Sqlite3* [In],zdestname : PSTR [In],psource : Sqlite3* [In],zsourcename : PSTR [In]
  fun sqlite3_backup_init(pdest : Sqlite3*, zdestname : PSTR, psource : Sqlite3*, zsourcename : PSTR) : Sqlite3_backup*

  # Params # p : Sqlite3_backup* [In],npage : Int32 [In]
  fun sqlite3_backup_step(p : Sqlite3_backup*, npage : Int32) : Int32

  # Params # p : Sqlite3_backup* [In]
  fun sqlite3_backup_finish(p : Sqlite3_backup*) : Int32

  # Params # p : Sqlite3_backup* [In]
  fun sqlite3_backup_remaining(p : Sqlite3_backup*) : Int32

  # Params # p : Sqlite3_backup* [In]
  fun sqlite3_backup_pagecount(p : Sqlite3_backup*) : Int32

  # Params # param0 : PSTR [In],param1 : PSTR [In]
  fun sqlite3_stricmp(param0 : PSTR, param1 : PSTR) : Int32

  # Params # param0 : PSTR [In],param1 : PSTR [In],param2 : Int32 [In]
  fun sqlite3_strnicmp(param0 : PSTR, param1 : PSTR, param2 : Int32) : Int32

  # Params # zglob : PSTR [In],zstr : PSTR [In]
  fun sqlite3_strglob(zglob : PSTR, zstr : PSTR) : Int32

  # Params # zglob : PSTR [In],zstr : PSTR [In],cesc : UInt32 [In]
  fun sqlite3_strlike(zglob : PSTR, zstr : PSTR, cesc : UInt32) : Int32

  # Params # ierrcode : Int32 [In],zformat : PSTR [In]
  fun sqlite3_log(ierrcode : Int32, zformat : PSTR) : Void

  # Params # param0 : Sqlite3* [In],param1 : LibC::IntPtrT [In],param2 : Void* [In]
  fun sqlite3_wal_hook(param0 : Sqlite3*, param1 : LibC::IntPtrT, param2 : Void*) : Void*

  # Params # db : Sqlite3* [In],n : Int32 [In]
  fun sqlite3_wal_autocheckpoint(db : Sqlite3*, n : Int32) : Int32

  # Params # db : Sqlite3* [In],zdb : PSTR [In]
  fun sqlite3_wal_checkpoint(db : Sqlite3*, zdb : PSTR) : Int32

  # Params # db : Sqlite3* [In],zdb : PSTR [In],emode : Int32 [In],pnlog : Int32* [In],pnckpt : Int32* [In]
  fun sqlite3_wal_checkpoint_v2(db : Sqlite3*, zdb : PSTR, emode : Int32, pnlog : Int32*, pnckpt : Int32*) : Int32

  # Params # param0 : Sqlite3* [In],op : Int32 [In]
  fun sqlite3_vtab_config(param0 : Sqlite3*, op : Int32) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_vtab_on_conflict(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3_context* [In]
  fun sqlite3_vtab_nochange(param0 : Sqlite3_context*) : Int32

  # Params # param0 : Sqlite3_index_info* [In],param1 : Int32 [In]
  fun sqlite3_vtab_collation(param0 : Sqlite3_index_info*, param1 : Int32) : PSTR

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_db_cacheflush(param0 : Sqlite3*) : Int32

  # Params # param0 : Sqlite3* [In]
  fun sqlite3_system_errno(param0 : Sqlite3*) : Int32

  # Params # db : Sqlite3* [In],zschema : PSTR [In],pisize : Int64* [In],mflags : UInt32 [In]
  fun sqlite3_serialize(db : Sqlite3*, zschema : PSTR, pisize : Int64*, mflags : UInt32) : UInt8*

  # Params # db : Sqlite3* [In],zschema : PSTR [In],pdata : UInt8* [In],szdb : Int64 [In],szbuf : Int64 [In],mflags : UInt32 [In]
  fun sqlite3_deserialize(db : Sqlite3*, zschema : PSTR, pdata : UInt8*, szdb : Int64, szbuf : Int64, mflags : UInt32) : Int32

  # Params # db : Sqlite3* [In],zgeom : PSTR [In],xgeom : LibC::IntPtrT [In],pcontext : Void* [In]
  fun sqlite3_rtree_geometry_callback(db : Sqlite3*, zgeom : PSTR, xgeom : LibC::IntPtrT, pcontext : Void*) : Int32

  # Params # db : Sqlite3* [In],zqueryfunc : PSTR [In],xqueryfunc : LibC::IntPtrT [In],pcontext : Void* [In],xdestructor : LibC::IntPtrT [In]
  fun sqlite3_rtree_query_callback(db : Sqlite3*, zqueryfunc : PSTR, xqueryfunc : LibC::IntPtrT, pcontext : Void*, xdestructor : LibC::IntPtrT) : Int32
end
