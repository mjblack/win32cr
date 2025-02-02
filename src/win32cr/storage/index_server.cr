require "./../system/com/structured_storage.cr"
require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Storage::IndexServer
  extend self
  CI_VERSION_WDS30 = 258_u32
  CI_VERSION_WDS40 = 265_u32
  CI_VERSION_WIN70 = 1792_u32
  CINULLCATALOG = "::_noindex_::"
  CIADMIN = "::_nodocstore_::"
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

  enum IFILTER_INIT
    IFILTER_INIT_CANON_PARAGRAPHS = 1_i32
    IFILTER_INIT_HARD_LINE_BREAKS = 2_i32
    IFILTER_INIT_CANON_HYPHENS = 4_i32
    IFILTER_INIT_CANON_SPACES = 8_i32
    IFILTER_INIT_APPLY_INDEX_ATTRIBUTES = 16_i32
    IFILTER_INIT_APPLY_OTHER_ATTRIBUTES = 32_i32
    IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES = 256_i32
    IFILTER_INIT_INDEXING_ONLY = 64_i32
    IFILTER_INIT_SEARCH_LINKS = 128_i32
    IFILTER_INIT_FILTER_OWNED_VALUE_OK = 512_i32
    IFILTER_INIT_FILTER_AGGRESSIVE_BREAK = 1024_i32
    IFILTER_INIT_DISABLE_EMBEDDED = 2048_i32
    IFILTER_INIT_EMIT_FORMATTING = 4096_i32
  end
  enum IFILTER_FLAGS
    IFILTER_FLAGS_OLE_PROPERTIES = 1_i32
  end
  enum CHUNKSTATE
    CHUNK_TEXT = 1_i32
    CHUNK_VALUE = 2_i32
    CHUNK_FILTER_OWNED_VALUE = 4_i32
  end
  enum CHUNK_BREAKTYPE
    CHUNK_NO_BREAK = 0_i32
    CHUNK_EOW = 1_i32
    CHUNK_EOS = 2_i32
    CHUNK_EOP = 3_i32
    CHUNK_EOC = 4_i32
  end
  enum WORDREP_BREAK_TYPE
    WORDREP_BREAK_EOW = 0_i32
    WORDREP_BREAK_EOS = 1_i32
    WORDREP_BREAK_EOP = 2_i32
    WORDREP_BREAK_EOC = 3_i32
  end
  enum DBKINDENUM
    DBKIND_GUID_NAME = 0_i32
    DBKIND_GUID_PROPID = 1_i32
    DBKIND_NAME = 2_i32
    DBKIND_PGUID_NAME = 3_i32
    DBKIND_PGUID_PROPID = 4_i32
    DBKIND_PROPID = 5_i32
    DBKIND_GUID = 6_i32
  end

  @[Extern]
  struct CI_STATE
    property cbStruct : UInt32
    property cWordList : UInt32
    property cPersistentIndex : UInt32
    property cQueries : UInt32
    property cDocuments : UInt32
    property cFreshTest : UInt32
    property dwMergeProgress : UInt32
    property eState : UInt32
    property cFilteredDocuments : UInt32
    property cTotalDocuments : UInt32
    property cPendingScans : UInt32
    property dwIndexSize : UInt32
    property cUniqueKeys : UInt32
    property cSecQDocuments : UInt32
    property dwPropCacheSize : UInt32
    def initialize(@cbStruct : UInt32, @cWordList : UInt32, @cPersistentIndex : UInt32, @cQueries : UInt32, @cDocuments : UInt32, @cFreshTest : UInt32, @dwMergeProgress : UInt32, @eState : UInt32, @cFilteredDocuments : UInt32, @cTotalDocuments : UInt32, @cPendingScans : UInt32, @dwIndexSize : UInt32, @cUniqueKeys : UInt32, @cSecQDocuments : UInt32, @dwPropCacheSize : UInt32)
    end
  end

  @[Extern]
  struct FULLPROPSPEC
    property guidPropSet : LibC::GUID
    property psProperty : Win32cr::System::Com::StructuredStorage::PROPSPEC
    def initialize(@guidPropSet : LibC::GUID, @psProperty : Win32cr::System::Com::StructuredStorage::PROPSPEC)
    end
  end

  @[Extern]
  struct FILTERREGION
    property idChunk : UInt32
    property cwcStart : UInt32
    property cwcExtent : UInt32
    def initialize(@idChunk : UInt32, @cwcStart : UInt32, @cwcExtent : UInt32)
    end
  end

  @[Extern]
  struct STAT_CHUNK
    property idChunk : UInt32
    property breakType : Win32cr::Storage::IndexServer::CHUNK_BREAKTYPE
    property flags : Win32cr::Storage::IndexServer::CHUNKSTATE
    property locale : UInt32
    property attribute : Win32cr::Storage::IndexServer::FULLPROPSPEC
    property idChunkSource : UInt32
    property cwcStartSource : UInt32
    property cwcLenSource : UInt32
    def initialize(@idChunk : UInt32, @breakType : Win32cr::Storage::IndexServer::CHUNK_BREAKTYPE, @flags : Win32cr::Storage::IndexServer::CHUNKSTATE, @locale : UInt32, @attribute : Win32cr::Storage::IndexServer::FULLPROPSPEC, @idChunkSource : UInt32, @cwcStartSource : UInt32, @cwcLenSource : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct DBID
    property uGuid : Uguid_e__union_
    property eKind : UInt32
    property uName : Uname_e__union_

    # Nested Type Uname_e__union_
    @[Extern(union: true)]
    struct Uname_e__union_
    property pwszName : Win32cr::Foundation::PWSTR
    property ulPropid : UInt32
    def initialize(@pwszName : Win32cr::Foundation::PWSTR, @ulPropid : UInt32)
    end
    end


    # Nested Type Uguid_e__union_
    @[Extern(union: true)]
    struct Uguid_e__union_
    property guid : LibC::GUID
    property pguid : LibC::GUID*
    def initialize(@guid : LibC::GUID, @pguid : LibC::GUID*)
    end
    end

    def initialize(@uGuid : Uguid_e__union_, @eKind : UInt32, @uName : Uname_e__union_)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct DBID
    property uGuid : Uguid_e__union_
    property eKind : UInt32
    property uName : Uname_e__union_

    # Nested Type Uname_e__union_
    @[Extern(union: true)]
    struct Uname_e__union_
    property pwszName : Win32cr::Foundation::PWSTR
    property ulPropid : UInt32
    def initialize(@pwszName : Win32cr::Foundation::PWSTR, @ulPropid : UInt32)
    end
    end


    # Nested Type Uguid_e__union_
    @[Extern(union: true)]
    struct Uguid_e__union_
    property guid : LibC::GUID
    property pguid : LibC::GUID*
    def initialize(@guid : LibC::GUID, @pguid : LibC::GUID*)
    end
    end

    def initialize(@uGuid : Uguid_e__union_, @eKind : UInt32, @uName : Uname_e__union_)
    end
  end
  {% end %}

  @[Extern]
  record IFilterVtbl,
    query_interface : Proc(IFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFilter*, UInt32),
    release : Proc(IFilter*, UInt32),
    init : Proc(IFilter*, UInt32, UInt32, Win32cr::Storage::IndexServer::FULLPROPSPEC*, UInt32*, Int32),
    get_chunk : Proc(IFilter*, Win32cr::Storage::IndexServer::STAT_CHUNK*, Int32),
    get_text : Proc(IFilter*, UInt32*, UInt16*, Int32),
    get_value : Proc(IFilter*, Win32cr::System::Com::StructuredStorage::PROPVARIANT**, Int32),
    bind_region : Proc(IFilter*, Win32cr::Storage::IndexServer::FILTERREGION, LibC::GUID*, Void**, Int32)


  @[Extern]
  record IFilter, lpVtbl : IFilterVtbl* do
    GUID = LibC::GUID.new(0x89bcb740_u32, 0x6119_u16, 0x101a_u16, StaticArray[0xbc_u8, 0xb7_u8, 0x0_u8, 0xdd_u8, 0x1_u8, 0x6_u8, 0x55_u8, 0xaf_u8])
    def query_interface(this : IFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : IFilter*, grfFlags : UInt32, cAttributes : UInt32, aAttributes : Win32cr::Storage::IndexServer::FULLPROPSPEC*, pFlags : UInt32*) : Int32
      @lpVtbl.try &.value.init.call(this, grfFlags, cAttributes, aAttributes, pFlags)
    end
    def get_chunk(this : IFilter*, pStat : Win32cr::Storage::IndexServer::STAT_CHUNK*) : Int32
      @lpVtbl.try &.value.get_chunk.call(this, pStat)
    end
    def get_text(this : IFilter*, pcwcBuffer : UInt32*, awcBuffer : UInt16*) : Int32
      @lpVtbl.try &.value.get_text.call(this, pcwcBuffer, awcBuffer)
    end
    def get_value(this : IFilter*, ppPropValue : Win32cr::System::Com::StructuredStorage::PROPVARIANT**) : Int32
      @lpVtbl.try &.value.get_value.call(this, ppPropValue)
    end
    def bind_region(this : IFilter*, origPos : Win32cr::Storage::IndexServer::FILTERREGION, riid : LibC::GUID*, ppunk : Void**) : Int32
      @lpVtbl.try &.value.bind_region.call(this, origPos, riid, ppunk)
    end

  end

  @[Extern]
  record IPhraseSinkVtbl,
    query_interface : Proc(IPhraseSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPhraseSink*, UInt32),
    release : Proc(IPhraseSink*, UInt32),
    put_small_phrase : Proc(IPhraseSink*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    put_phrase : Proc(IPhraseSink*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPhraseSink, lpVtbl : IPhraseSinkVtbl* do
    GUID = LibC::GUID.new(0xcc906ff0_u32, 0xc058_u16, 0x101a_u16, StaticArray[0xb5_u8, 0x54_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0x33_u8, 0xb0_u8, 0xe6_u8])
    def query_interface(this : IPhraseSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPhraseSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPhraseSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def put_small_phrase(this : IPhraseSink*, pwcNoun : Win32cr::Foundation::PWSTR, cwcNoun : UInt32, pwcModifier : Win32cr::Foundation::PWSTR, cwcModifier : UInt32, ulAttachmentType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_small_phrase.call(this, pwcNoun, cwcNoun, pwcModifier, cwcModifier, ulAttachmentType)
    end
    def put_phrase(this : IPhraseSink*, pwcPhrase : Win32cr::Foundation::PWSTR, cwcPhrase : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_phrase.call(this, pwcPhrase, cwcPhrase)
    end

  end

  def loadIFilter(pwcsPath : Win32cr::Foundation::PWSTR, pUnkOuter : Void*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
    C.LoadIFilter(pwcsPath, pUnkOuter, ppIUnk)
  end

  def loadIFilterEx(pwcsPath : Win32cr::Foundation::PWSTR, dwFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
    C.LoadIFilterEx(pwcsPath, dwFlags, riid, ppIUnk)
  end

  def bindIFilterFromStorage(pStg : Void*, pUnkOuter : Void*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
    C.BindIFilterFromStorage(pStg, pUnkOuter, ppIUnk)
  end

  def bindIFilterFromStream(pStm : Void*, pUnkOuter : Void*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT
    C.BindIFilterFromStream(pStm, pUnkOuter, ppIUnk)
  end

  @[Link("query")]
  lib C
    # :nodoc:
    fun LoadIFilter(pwcsPath : Win32cr::Foundation::PWSTR, pUnkOuter : Void*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadIFilterEx(pwcsPath : Win32cr::Foundation::PWSTR, dwFlags : UInt32, riid : LibC::GUID*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun BindIFilterFromStorage(pStg : Void*, pUnkOuter : Void*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun BindIFilterFromStream(pStm : Void*, pUnkOuter : Void*, ppIUnk : Void**) : Win32cr::Foundation::HRESULT

  end
end