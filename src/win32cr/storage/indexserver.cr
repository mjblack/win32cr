require "../system/com/structuredstorage.cr"
require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:query.dll")]
{% else %}
@[Link("query")]
{% end %}
lib LibWin32
  CI_VERSION_WDS30 = 258_u32
  CI_VERSION_WDS40 = 265_u32
  CI_VERSION_WIN70 = 1792_u32
  LIFF_LOAD_DEFINED_FILTER = 1_u32
  LIFF_IMPLEMENT_TEXT_FILTER_FALLBACK_POLICY = 2_u32
  LIFF_FORCE_TEXT_FILTER_FALLBACK = 3_u32
  PID_FILENAME = 100_u32
  DBPROP_CI_CATALOG_NAME = 2_u32
  DBPROP_CI_INCLUDE_SCOPES = 3_u32
  DBPROP_CI_DEPTHS = 4_u32
  DBPROP_CI_SCOPE_FLAGS = 4_u32
  DBPROP_CI_EXCLUDE_SCOPES = 5_u32
  DBPROP_CI_SECURITY_ID = 6_u32
  DBPROP_CI_QUERY_TYPE = 7_u32
  DBPROP_CI_PROVIDER = 8_u32
  CI_PROVIDER_MSSEARCH = 1_u32
  CI_PROVIDER_INDEXING_SERVICE = 2_u32
  CI_PROVIDER_ALL = 4294967295_u32
  DBPROP_DEFAULT_EQUALS_BEHAVIOR = 2_u32
  DBPROP_USECONTENTINDEX = 2_u32
  DBPROP_DEFERNONINDEXEDTRIMMING = 3_u32
  DBPROP_USEEXTENDEDDBTYPES = 4_u32
  DBPROP_IGNORENOISEONLYCLAUSES = 5_u32
  DBPROP_GENERICOPTIONS_STRING = 6_u32
  DBPROP_FIRSTROWS = 7_u32
  DBPROP_DEFERCATALOGVERIFICATION = 8_u32
  DBPROP_CATALOGLISTID = 9_u32
  DBPROP_GENERATEPARSETREE = 10_u32
  DBPROP_APPLICATION_NAME = 11_u32
  DBPROP_FREETEXTANYTERM = 12_u32
  DBPROP_FREETEXTUSESTEMMING = 13_u32
  DBPROP_IGNORESBRI = 14_u32
  DBPROP_DONOTCOMPUTEEXPENSIVEPROPS = 15_u32
  DBPROP_ENABLEROWSETEVENTS = 16_u32
  DBPROP_MACHINE = 2_u32
  DBPROP_CLIENT_CLSID = 3_u32
  MSIDXSPROP_ROWSETQUERYSTATUS = 2_u32
  MSIDXSPROP_COMMAND_LOCALE_STRING = 3_u32
  MSIDXSPROP_QUERY_RESTRICTION = 4_u32
  MSIDXSPROP_PARSE_TREE = 5_u32
  MSIDXSPROP_MAX_RANK = 6_u32
  MSIDXSPROP_RESULTS_FOUND = 7_u32
  MSIDXSPROP_WHEREID = 8_u32
  MSIDXSPROP_SERVER_VERSION = 9_u32
  MSIDXSPROP_SERVER_WINVER_MAJOR = 10_u32
  MSIDXSPROP_SERVER_WINVER_MINOR = 11_u32
  MSIDXSPROP_SERVER_NLSVERSION = 12_u32
  MSIDXSPROP_SERVER_NLSVER_DEFINED = 13_u32
  MSIDXSPROP_SAME_SORTORDER_USED = 14_u32
  STAT_BUSY = 0_u32
  STAT_ERROR = 1_u32
  STAT_DONE = 2_u32
  STAT_REFRESH = 3_u32
  STAT_PARTIAL_SCOPE = 8_u32
  STAT_NOISE_WORDS = 16_u32
  STAT_CONTENT_OUT_OF_DATE = 32_u32
  STAT_REFRESH_INCOMPLETE = 64_u32
  STAT_CONTENT_QUERY_INCOMPLETE = 128_u32
  STAT_TIME_LIMIT_EXCEEDED = 256_u32
  STAT_SHARING_VIOLATION = 512_u32
  STAT_MISSING_RELDOC = 1024_u32
  STAT_MISSING_PROP_IN_RELDOC = 2048_u32
  STAT_RELDOC_ACCESS_DENIED = 4096_u32
  STAT_COALESCE_COMP_ALL_NOISE = 8192_u32
  QUERY_SHALLOW = 0_u32
  QUERY_DEEP = 1_u32
  QUERY_PHYSICAL_PATH = 0_u32
  QUERY_VIRTUAL_PATH = 2_u32
  PROPID_QUERY_WORKID = 5_u32
  PROPID_QUERY_UNFILTERED = 7_u32
  PROPID_QUERY_VIRTUALPATH = 9_u32
  PROPID_QUERY_LASTSEENTIME = 10_u32
  CICAT_STOPPED = 1_u32
  CICAT_READONLY = 2_u32
  CICAT_WRITABLE = 4_u32
  CICAT_NO_QUERY = 8_u32
  CICAT_GET_STATE = 16_u32
  CICAT_ALL_OPENED = 32_u32
  CI_STATE_SHADOW_MERGE = 1_u32
  CI_STATE_MASTER_MERGE = 2_u32
  CI_STATE_CONTENT_SCAN_REQUIRED = 4_u32
  CI_STATE_ANNEALING_MERGE = 8_u32
  CI_STATE_SCANNING = 16_u32
  CI_STATE_RECOVERING = 32_u32
  CI_STATE_INDEX_MIGRATION_MERGE = 64_u32
  CI_STATE_LOW_MEMORY = 128_u32
  CI_STATE_HIGH_IO = 256_u32
  CI_STATE_MASTER_MERGE_PAUSED = 512_u32
  CI_STATE_READ_ONLY = 1024_u32
  CI_STATE_BATTERY_POWER = 2048_u32
  CI_STATE_USER_ACTIVE = 4096_u32
  CI_STATE_STARTING = 8192_u32
  CI_STATE_READING_USNS = 16384_u32
  CI_STATE_DELETION_MERGE = 32768_u32
  CI_STATE_LOW_DISK = 65536_u32
  CI_STATE_HIGH_CPU = 131072_u32
  CI_STATE_BATTERY_POLICY = 262144_u32
  GENERATE_METHOD_EXACT = 0_u32
  GENERATE_METHOD_PREFIX = 1_u32
  GENERATE_METHOD_INFLECT = 2_u32
  SCOPE_FLAG_MASK = 255_u32
  SCOPE_FLAG_INCLUDE = 1_u32
  SCOPE_FLAG_DEEP = 2_u32
  SCOPE_TYPE_MASK = 4294967040_u32
  SCOPE_TYPE_WINPATH = 256_u32
  SCOPE_TYPE_VPATH = 512_u32
  PROPID_QUERY_RANKVECTOR = 2_u32
  PROPID_QUERY_RANK = 3_u32
  PROPID_QUERY_HITCOUNT = 4_u32
  PROPID_QUERY_ALL = 6_u32
  PROPID_STG_CONTENTS = 19_u32
  VECTOR_RANK_MIN = 0_u32
  VECTOR_RANK_MAX = 1_u32
  VECTOR_RANK_INNER = 2_u32
  VECTOR_RANK_DICE = 3_u32
  VECTOR_RANK_JACCARD = 4_u32
  DBSETFUNC_NONE = 0_u32
  DBSETFUNC_ALL = 1_u32
  DBSETFUNC_DISTINCT = 2_u32
  PROXIMITY_UNIT_WORD = 0_u32
  PROXIMITY_UNIT_SENTENCE = 1_u32
  PROXIMITY_UNIT_PARAGRAPH = 2_u32
  PROXIMITY_UNIT_CHAPTER = 3_u32
  NOT_AN_ERROR = 524288_i32
  FILTER_E_END_OF_CHUNKS = -2147215616_i32
  FILTER_E_NO_MORE_TEXT = -2147215615_i32
  FILTER_E_NO_MORE_VALUES = -2147215614_i32
  FILTER_E_ACCESS = -2147215613_i32
  FILTER_W_MONIKER_CLIPPED = 268036_i32
  FILTER_E_NO_TEXT = -2147215611_i32
  FILTER_E_NO_VALUES = -2147215610_i32
  FILTER_E_EMBEDDING_UNAVAILABLE = -2147215609_i32
  FILTER_E_LINK_UNAVAILABLE = -2147215608_i32
  FILTER_S_LAST_TEXT = 268041_i32
  FILTER_S_LAST_VALUES = 268042_i32
  FILTER_E_PASSWORD = -2147215605_i32
  FILTER_E_UNKNOWNFORMAT = -2147215604_i32


  enum IFILTER_INIT : Int32
    IFILTER_INIT_CANON_PARAGRAPHS = 1
    IFILTER_INIT_HARD_LINE_BREAKS = 2
    IFILTER_INIT_CANON_HYPHENS = 4
    IFILTER_INIT_CANON_SPACES = 8
    IFILTER_INIT_APPLY_INDEX_ATTRIBUTES = 16
    IFILTER_INIT_APPLY_OTHER_ATTRIBUTES = 32
    IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES = 256
    IFILTER_INIT_INDEXING_ONLY = 64
    IFILTER_INIT_SEARCH_LINKS = 128
    IFILTER_INIT_FILTER_OWNED_VALUE_OK = 512
    IFILTER_INIT_FILTER_AGGRESSIVE_BREAK = 1024
    IFILTER_INIT_DISABLE_EMBEDDED = 2048
    IFILTER_INIT_EMIT_FORMATTING = 4096
  end

  enum IFILTER_FLAGS : Int32
    IFILTER_FLAGS_OLE_PROPERTIES = 1
  end

  enum CHUNKSTATE : Int32
    CHUNK_TEXT = 1
    CHUNK_VALUE = 2
    CHUNK_FILTER_OWNED_VALUE = 4
  end

  enum CHUNK_BREAKTYPE : Int32
    CHUNK_NO_BREAK = 0
    CHUNK_EOW = 1
    CHUNK_EOS = 2
    CHUNK_EOP = 3
    CHUNK_EOC = 4
  end

  enum WORDREP_BREAK_TYPE : Int32
    WORDREP_BREAK_EOW = 0
    WORDREP_BREAK_EOS = 1
    WORDREP_BREAK_EOP = 2
    WORDREP_BREAK_EOC = 3
  end

  enum DBKINDENUM : Int32
    DBKIND_GUID_NAME = 0
    DBKIND_GUID_PROPID = 1
    DBKIND_NAME = 2
    DBKIND_PGUID_NAME = 3
    DBKIND_PGUID_PROPID = 4
    DBKIND_PROPID = 5
    DBKIND_GUID = 6
  end

  union DBID_uName_e__Union
    pwsz_name : LibC::LPWSTR
    ul_propid : UInt32
  end
  union DBID_uGuid_e__Union
    guid : Guid
    pguid : Guid*
  end

  struct CI_STATE
    cb_struct : UInt32
    c_word_list : UInt32
    c_persistent_index : UInt32
    c_queries : UInt32
    c_documents : UInt32
    c_fresh_test : UInt32
    dw_merge_progress : UInt32
    e_state : UInt32
    c_filtered_documents : UInt32
    c_total_documents : UInt32
    c_pending_scans : UInt32
    dw_index_size : UInt32
    c_unique_keys : UInt32
    c_sec_q_documents : UInt32
    dw_prop_cache_size : UInt32
  end
  struct FULLPROPSPEC
    guid_prop_set : Guid
    ps_property : PROPSPEC
  end
  struct FILTERREGION
    id_chunk : UInt32
    cwc_start : UInt32
    cwc_extent : UInt32
  end
  struct STAT_CHUNK
    id_chunk : UInt32
    break_type : CHUNK_BREAKTYPE
    flags : CHUNKSTATE
    locale : UInt32
    attribute : FULLPROPSPEC
    id_chunk_source : UInt32
    cwc_start_source : UInt32
    cwc_len_source : UInt32
  end
  struct DBID
    u_guid : DBID_uGuid_e__Union
    e_kind : UInt32
    u_name : DBID_uName_e__Union
  end


  struct IFilterVTbl
    query_interface : Proc(IFilter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFilter*, UInt32)
    release : Proc(IFilter*, UInt32)
    init : Proc(IFilter*, UInt32, UInt32, FULLPROPSPEC*, UInt32*, Int32)
    get_chunk : Proc(IFilter*, STAT_CHUNK*, Int32)
    get_text : Proc(IFilter*, UInt32*, Char*, Int32)
    get_value : Proc(IFilter*, PROPVARIANT**, Int32)
    bind_region : Proc(IFilter*, FILTERREGION, Guid*, Void**, Int32)
  end

  struct IFilter
    lpVtbl : IFilterVTbl*
  end

  struct IPhraseSinkVTbl
    query_interface : Proc(IPhraseSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPhraseSink*, UInt32)
    release : Proc(IPhraseSink*, UInt32)
    put_small_phrase : Proc(IPhraseSink*, LibC::LPWSTR, UInt32, LibC::LPWSTR, UInt32, UInt32, HRESULT)
    put_phrase : Proc(IPhraseSink*, LibC::LPWSTR, UInt32, HRESULT)
  end

  struct IPhraseSink
    lpVtbl : IPhraseSinkVTbl*
  end


  # Params # pwcspath : LibC::LPWSTR [In],punkouter : IUnknown [In],ppiunk : Void** [In]
  fun LoadIFilter(pwcspath : LibC::LPWSTR, punkouter : IUnknown, ppiunk : Void**) : HRESULT

  # Params # pwcspath : LibC::LPWSTR [In],dwflags : UInt32 [In],riid : Guid* [In],ppiunk : Void** [In]
  fun LoadIFilterEx(pwcspath : LibC::LPWSTR, dwflags : UInt32, riid : Guid*, ppiunk : Void**) : HRESULT

  # Params # pstg : IStorage [In],punkouter : IUnknown [In],ppiunk : Void** [In]
  fun BindIFilterFromStorage(pstg : IStorage, punkouter : IUnknown, ppiunk : Void**) : HRESULT

  # Params # pstm : IStream [In],punkouter : IUnknown [In],ppiunk : Void** [In]
  fun BindIFilterFromStream(pstm : IStream, punkouter : IUnknown, ppiunk : Void**) : HRESULT
end
