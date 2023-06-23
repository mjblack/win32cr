require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  RDCE_TABLE_FULL = 2147745793_u32
  RDCE_TABLE_CORRUPT = 2147745794_u32
  MSRDC_SIGNATURE_HASHSIZE = 16_u32
  SimilarityFileIdMinSize = 4_u32
  SimilarityFileIdMaxSize = 32_u32
  MSRDC_VERSION = 65536_u32
  MSRDC_MINIMUM_COMPATIBLE_APP_VERSION = 65536_u32
  MSRDC_MINIMUM_DEPTH = 1_u32
  MSRDC_MAXIMUM_DEPTH = 8_u32
  MSRDC_MINIMUM_COMPAREBUFFER = 100000_u32
  MSRDC_MAXIMUM_COMPAREBUFFER = 1073741824_u32
  MSRDC_DEFAULT_COMPAREBUFFER = 3200000_u32
  MSRDC_MINIMUM_INPUTBUFFERSIZE = 1024_u32
  MSRDC_MINIMUM_HORIZONSIZE = 128_u32
  MSRDC_MAXIMUM_HORIZONSIZE = 16384_u32
  MSRDC_MINIMUM_HASHWINDOWSIZE = 2_u32
  MSRDC_MAXIMUM_HASHWINDOWSIZE = 96_u32
  MSRDC_DEFAULT_HASHWINDOWSIZE_1 = 48_u32
  MSRDC_DEFAULT_HORIZONSIZE_1 = 1024_u32
  MSRDC_DEFAULT_HASHWINDOWSIZE_N = 2_u32
  MSRDC_DEFAULT_HORIZONSIZE_N = 128_u32
  MSRDC_MAXIMUM_TRAITVALUE = 63_u32
  MSRDC_MINIMUM_MATCHESREQUIRED = 1_u32
  MSRDC_MAXIMUM_MATCHESREQUIRED = 16_u32
  CLSID_RdcLibrary = LibC::GUID.new(0x96236a85_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcGeneratorParameters = LibC::GUID.new(0x96236a86_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcGeneratorFilterMaxParameters = LibC::GUID.new(0x96236a87_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcGenerator = LibC::GUID.new(0x96236a88_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcFileReader = LibC::GUID.new(0x96236a89_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcSignatureReader = LibC::GUID.new(0x96236a8a_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcComparator = LibC::GUID.new(0x96236a8b_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_SimilarityReportProgress = LibC::GUID.new(0x96236a8d_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_SimilarityTableDumpState = LibC::GUID.new(0x96236a8e_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_SimilarityTraitsTable = LibC::GUID.new(0x96236a8f_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_SimilarityFileIdTable = LibC::GUID.new(0x96236a90_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_Similarity = LibC::GUID.new(0x96236a91_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_RdcSimilarityGenerator = LibC::GUID.new(0x96236a92_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_FindSimilarResults = LibC::GUID.new(0x96236a93_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_SimilarityTraitsMapping = LibC::GUID.new(0x96236a94_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  CLSID_SimilarityTraitsMappedView = LibC::GUID.new(0x96236a95_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])


  enum RDC_ErrorCode : Int32
    RDC_NoError = 0
    RDC_HeaderVersionNewer = 1
    RDC_HeaderVersionOlder = 2
    RDC_HeaderMissingOrCorrupt = 3
    RDC_HeaderWrongType = 4
    RDC_DataMissingOrCorrupt = 5
    RDC_DataTooManyRecords = 6
    RDC_FileChecksumMismatch = 7
    RDC_ApplicationError = 8
    RDC_Aborted = 9
    RDC_Win32Error = 10
  end

  enum GeneratorParametersType : Int32
    RDCGENTYPE_Unused = 0
    RDCGENTYPE_FilterMax = 1
  end

  enum RdcNeedType : Int32
    RDCNEED_SOURCE = 0
    RDCNEED_TARGET = 1
    RDCNEED_SEED = 2
    RDCNEED_SEED_MAX = 255
  end

  enum RdcCreatedTables : Int32
    RDCTABLE_InvalidOrUnknown = 0
    RDCTABLE_Existing = 1
    RDCTABLE_New = 2
  end

  enum RdcMappingAccessMode : Int32
    RDCMAPPING_Undefined = 0
    RDCMAPPING_ReadOnly = 1
    RDCMAPPING_ReadWrite = 2
  end

  struct RdcNeed
    m_block_type : RdcNeedType
    m_file_offset : UInt64
    m_block_length : UInt64
  end
  struct RdcBufferPointer
    m_size : UInt32
    m_used : UInt32
    m_data : UInt8*
  end
  struct RdcNeedPointer
    m_size : UInt32
    m_used : UInt32
    m_data : RdcNeed*
  end
  struct RdcSignature
    m_signature : UInt8[16]*
    m_block_length : UInt16
  end
  struct RdcSignaturePointer
    m_size : UInt32
    m_used : UInt32
    m_data : RdcSignature*
  end
  struct SimilarityMappedViewInfo
    m_data : UInt8*
    m_length : UInt32
  end
  struct SimilarityData
    m_data : UInt8[16]*
  end
  struct FindSimilarFileIndexResults
    m_file_index : UInt32
    m_match_count : UInt32
  end
  struct SimilarityDumpData
    m_file_index : UInt32
    m_data : SimilarityData
  end
  struct SimilarityFileId
    m_file_id : UInt8[32]*
  end


  struct IRdcGeneratorParametersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_generator_parameters_type : UInt64
    get_parameters_version : UInt64
    get_serialize_size : UInt64
    serialize : UInt64
  end

  IRdcGeneratorParameters_GUID = "96236a71-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcGeneratorParameters = LibC::GUID.new(0x96236a71_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcGeneratorParameters
    lpVtbl : IRdcGeneratorParametersVTbl*
  end

  struct IRdcGeneratorFilterMaxParametersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_horizon_size : UInt64
    set_horizon_size : UInt64
    get_hash_window_size : UInt64
    set_hash_window_size : UInt64
  end

  IRdcGeneratorFilterMaxParameters_GUID = "96236a72-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcGeneratorFilterMaxParameters = LibC::GUID.new(0x96236a72_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcGeneratorFilterMaxParameters
    lpVtbl : IRdcGeneratorFilterMaxParametersVTbl*
  end

  struct IRdcGeneratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_generator_parameters : UInt64
    process : UInt64
  end

  IRdcGenerator_GUID = "96236a73-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcGenerator = LibC::GUID.new(0x96236a73_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcGenerator
    lpVtbl : IRdcGeneratorVTbl*
  end

  struct IRdcFileReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_file_size : UInt64
    read : UInt64
    get_file_position : UInt64
  end

  IRdcFileReader_GUID = "96236a74-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcFileReader = LibC::GUID.new(0x96236a74_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcFileReader
    lpVtbl : IRdcFileReaderVTbl*
  end

  struct IRdcFileWriterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_file_size : UInt64
    read : UInt64
    get_file_position : UInt64
    write : UInt64
    truncate : UInt64
    delete_on_close : UInt64
  end

  IRdcFileWriter_GUID = "96236a75-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcFileWriter = LibC::GUID.new(0x96236a75_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcFileWriter
    lpVtbl : IRdcFileWriterVTbl*
  end

  struct IRdcSignatureReaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read_header : UInt64
    read_signatures : UInt64
  end

  IRdcSignatureReader_GUID = "96236a76-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcSignatureReader = LibC::GUID.new(0x96236a76_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcSignatureReader
    lpVtbl : IRdcSignatureReaderVTbl*
  end

  struct IRdcComparatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    process : UInt64
  end

  IRdcComparator_GUID = "96236a77-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcComparator = LibC::GUID.new(0x96236a77_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcComparator
    lpVtbl : IRdcComparatorVTbl*
  end

  struct IRdcLibraryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compute_default_recursion_depth : UInt64
    create_generator_parameters : UInt64
    open_generator_parameters : UInt64
    create_generator : UInt64
    create_comparator : UInt64
    create_signature_reader : UInt64
    get_rdc_version : UInt64
  end

  IRdcLibrary_GUID = "96236a78-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcLibrary = LibC::GUID.new(0x96236a78_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcLibrary
    lpVtbl : IRdcLibraryVTbl*
  end

  struct ISimilarityReportProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    report_progress : UInt64
  end

  ISimilarityReportProgress_GUID = "96236a7a-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityReportProgress = LibC::GUID.new(0x96236a7a_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityReportProgress
    lpVtbl : ISimilarityReportProgressVTbl*
  end

  struct ISimilarityTableDumpStateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_next_data : UInt64
  end

  ISimilarityTableDumpState_GUID = "96236a7b-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTableDumpState = LibC::GUID.new(0x96236a7b_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityTableDumpState
    lpVtbl : ISimilarityTableDumpStateVTbl*
  end

  struct ISimilarityTraitsMappedViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    flush : UInt64
    unmap : UInt64
    get : UInt64
    get_view : UInt64
  end

  ISimilarityTraitsMappedView_GUID = "96236a7c-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTraitsMappedView = LibC::GUID.new(0x96236a7c_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityTraitsMappedView
    lpVtbl : ISimilarityTraitsMappedViewVTbl*
  end

  struct ISimilarityTraitsMappingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    close_mapping : UInt64
    set_file_size : UInt64
    get_file_size : UInt64
    open_mapping : UInt64
    resize_mapping : UInt64
    get_page_size : UInt64
    create_view : UInt64
  end

  ISimilarityTraitsMapping_GUID = "96236a7d-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTraitsMapping = LibC::GUID.new(0x96236a7d_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityTraitsMapping
    lpVtbl : ISimilarityTraitsMappingVTbl*
  end

  struct ISimilarityTraitsTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_table : UInt64
    create_table_indirect : UInt64
    close_table : UInt64
    append : UInt64
    find_similar_file_index : UInt64
    begin_dump : UInt64
    get_last_index : UInt64
  end

  ISimilarityTraitsTable_GUID = "96236a7e-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTraitsTable = LibC::GUID.new(0x96236a7e_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityTraitsTable
    lpVtbl : ISimilarityTraitsTableVTbl*
  end

  struct ISimilarityFileIdTableVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_table : UInt64
    create_table_indirect : UInt64
    close_table : UInt64
    append : UInt64
    lookup : UInt64
    invalidate : UInt64
    get_record_count : UInt64
  end

  ISimilarityFileIdTable_GUID = "96236a7f-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityFileIdTable = LibC::GUID.new(0x96236a7f_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityFileIdTable
    lpVtbl : ISimilarityFileIdTableVTbl*
  end

  struct IRdcSimilarityGeneratorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enable_similarity : UInt64
    results : UInt64
  end

  IRdcSimilarityGenerator_GUID = "96236a80-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcSimilarityGenerator = LibC::GUID.new(0x96236a80_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcSimilarityGenerator
    lpVtbl : IRdcSimilarityGeneratorVTbl*
  end

  struct IFindSimilarResultsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_size : UInt64
    get_next_file_id : UInt64
  end

  IFindSimilarResults_GUID = "96236a81-9dbc-11da-9e3f-0011114ae311"
  IID_IFindSimilarResults = LibC::GUID.new(0x96236a81_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IFindSimilarResults
    lpVtbl : IFindSimilarResultsVTbl*
  end

  struct ISimilarityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_table : UInt64
    create_table_indirect : UInt64
    close_table : UInt64
    append : UInt64
    find_similar_file_id : UInt64
    copy_and_swap : UInt64
    get_record_count : UInt64
  end

  ISimilarity_GUID = "96236a83-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarity = LibC::GUID.new(0x96236a83_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarity
    lpVtbl : ISimilarityVTbl*
  end

end
struct LibWin32::IRdcGeneratorParameters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_generator_parameters_type(parameterstype : GeneratorParametersType*) : HRESULT
    @lpVtbl.value.get_generator_parameters_type.unsafe_as(Proc(GeneratorParametersType*, HRESULT)).call(parameterstype)
  end
  def get_parameters_version(currentversion : UInt32*, minimumcompatibleappversion : UInt32*) : HRESULT
    @lpVtbl.value.get_parameters_version.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(currentversion, minimumcompatibleappversion)
  end
  def get_serialize_size(size : UInt32*) : HRESULT
    @lpVtbl.value.get_serialize_size.unsafe_as(Proc(UInt32*, HRESULT)).call(size)
  end
  def serialize(size : UInt32, parametersblob : UInt8*, byteswritten : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(UInt32, UInt8*, UInt32*, HRESULT)).call(size, parametersblob, byteswritten)
  end
end
struct LibWin32::IRdcGeneratorFilterMaxParameters
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_horizon_size(horizonsize : UInt32*) : HRESULT
    @lpVtbl.value.get_horizon_size.unsafe_as(Proc(UInt32*, HRESULT)).call(horizonsize)
  end
  def set_horizon_size(horizonsize : UInt32) : HRESULT
    @lpVtbl.value.set_horizon_size.unsafe_as(Proc(UInt32, HRESULT)).call(horizonsize)
  end
  def get_hash_window_size(hashwindowsize : UInt32*) : HRESULT
    @lpVtbl.value.get_hash_window_size.unsafe_as(Proc(UInt32*, HRESULT)).call(hashwindowsize)
  end
  def set_hash_window_size(hashwindowsize : UInt32) : HRESULT
    @lpVtbl.value.set_hash_window_size.unsafe_as(Proc(UInt32, HRESULT)).call(hashwindowsize)
  end
end
struct LibWin32::IRdcGenerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_generator_parameters(level : UInt32, igeneratorparameters : IRdcGeneratorParameters*) : HRESULT
    @lpVtbl.value.get_generator_parameters.unsafe_as(Proc(UInt32, IRdcGeneratorParameters*, HRESULT)).call(level, igeneratorparameters)
  end
  def process(endofinput : LibC::BOOL, endofoutput : LibC::BOOL*, inputbuffer : RdcBufferPointer*, depth : UInt32, outputbuffers : RdcBufferPointer**, rdc_errorcode : RDC_ErrorCode*) : HRESULT
    @lpVtbl.value.process.unsafe_as(Proc(LibC::BOOL, LibC::BOOL*, RdcBufferPointer*, UInt32, RdcBufferPointer**, RDC_ErrorCode*, HRESULT)).call(endofinput, endofoutput, inputbuffer, depth, outputbuffers, rdc_errorcode)
  end
end
struct LibWin32::IRdcFileReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_file_size(filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(UInt64*, HRESULT)).call(filesize)
  end
  def read(offsetfilestart : UInt64, bytestoread : UInt32, bytesactuallyread : UInt32*, buffer : UInt8*, eof : LibC::BOOL*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt64, UInt32, UInt32*, UInt8*, LibC::BOOL*, HRESULT)).call(offsetfilestart, bytestoread, bytesactuallyread, buffer, eof)
  end
  def get_file_position(offsetfromstart : UInt64*) : HRESULT
    @lpVtbl.value.get_file_position.unsafe_as(Proc(UInt64*, HRESULT)).call(offsetfromstart)
  end
end
struct LibWin32::IRdcFileWriter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_file_size(filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(UInt64*, HRESULT)).call(filesize)
  end
  def read(offsetfilestart : UInt64, bytestoread : UInt32, bytesactuallyread : UInt32*, buffer : UInt8*, eof : LibC::BOOL*) : HRESULT
    @lpVtbl.value.read.unsafe_as(Proc(UInt64, UInt32, UInt32*, UInt8*, LibC::BOOL*, HRESULT)).call(offsetfilestart, bytestoread, bytesactuallyread, buffer, eof)
  end
  def get_file_position(offsetfromstart : UInt64*) : HRESULT
    @lpVtbl.value.get_file_position.unsafe_as(Proc(UInt64*, HRESULT)).call(offsetfromstart)
  end
  def write(offsetfilestart : UInt64, bytestowrite : UInt32, buffer : UInt8*) : HRESULT
    @lpVtbl.value.write.unsafe_as(Proc(UInt64, UInt32, UInt8*, HRESULT)).call(offsetfilestart, bytestowrite, buffer)
  end
  def truncate : HRESULT
    @lpVtbl.value.truncate.unsafe_as(Proc(HRESULT)).call
  end
  def delete_on_close : HRESULT
    @lpVtbl.value.delete_on_close.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRdcSignatureReader
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read_header(rdc_errorcode : RDC_ErrorCode*) : HRESULT
    @lpVtbl.value.read_header.unsafe_as(Proc(RDC_ErrorCode*, HRESULT)).call(rdc_errorcode)
  end
  def read_signatures(rdcsignaturepointer : RdcSignaturePointer*, endofoutput : LibC::BOOL*) : HRESULT
    @lpVtbl.value.read_signatures.unsafe_as(Proc(RdcSignaturePointer*, LibC::BOOL*, HRESULT)).call(rdcsignaturepointer, endofoutput)
  end
end
struct LibWin32::IRdcComparator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def process(endofinput : LibC::BOOL, endofoutput : LibC::BOOL*, inputbuffer : RdcBufferPointer*, outputbuffer : RdcNeedPointer*, rdc_errorcode : RDC_ErrorCode*) : HRESULT
    @lpVtbl.value.process.unsafe_as(Proc(LibC::BOOL, LibC::BOOL*, RdcBufferPointer*, RdcNeedPointer*, RDC_ErrorCode*, HRESULT)).call(endofinput, endofoutput, inputbuffer, outputbuffer, rdc_errorcode)
  end
end
struct LibWin32::IRdcLibrary
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compute_default_recursion_depth(filesize : UInt64, depth : UInt32*) : HRESULT
    @lpVtbl.value.compute_default_recursion_depth.unsafe_as(Proc(UInt64, UInt32*, HRESULT)).call(filesize, depth)
  end
  def create_generator_parameters(parameterstype : GeneratorParametersType, level : UInt32, igeneratorparameters : IRdcGeneratorParameters*) : HRESULT
    @lpVtbl.value.create_generator_parameters.unsafe_as(Proc(GeneratorParametersType, UInt32, IRdcGeneratorParameters*, HRESULT)).call(parameterstype, level, igeneratorparameters)
  end
  def open_generator_parameters(size : UInt32, parametersblob : UInt8*, igeneratorparameters : IRdcGeneratorParameters*) : HRESULT
    @lpVtbl.value.open_generator_parameters.unsafe_as(Proc(UInt32, UInt8*, IRdcGeneratorParameters*, HRESULT)).call(size, parametersblob, igeneratorparameters)
  end
  def create_generator(depth : UInt32, igeneratorparametersarray : IRdcGeneratorParameters*, igenerator : IRdcGenerator*) : HRESULT
    @lpVtbl.value.create_generator.unsafe_as(Proc(UInt32, IRdcGeneratorParameters*, IRdcGenerator*, HRESULT)).call(depth, igeneratorparametersarray, igenerator)
  end
  def create_comparator(iseedsignaturesfile : IRdcFileReader, comparatorbuffersize : UInt32, icomparator : IRdcComparator*) : HRESULT
    @lpVtbl.value.create_comparator.unsafe_as(Proc(IRdcFileReader, UInt32, IRdcComparator*, HRESULT)).call(iseedsignaturesfile, comparatorbuffersize, icomparator)
  end
  def create_signature_reader(ifilereader : IRdcFileReader, isignaturereader : IRdcSignatureReader*) : HRESULT
    @lpVtbl.value.create_signature_reader.unsafe_as(Proc(IRdcFileReader, IRdcSignatureReader*, HRESULT)).call(ifilereader, isignaturereader)
  end
  def get_rdc_version(currentversion : UInt32*, minimumcompatibleappversion : UInt32*) : HRESULT
    @lpVtbl.value.get_rdc_version.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(currentversion, minimumcompatibleappversion)
  end
end
struct LibWin32::ISimilarityReportProgress
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def report_progress(percentcompleted : UInt32) : HRESULT
    @lpVtbl.value.report_progress.unsafe_as(Proc(UInt32, HRESULT)).call(percentcompleted)
  end
end
struct LibWin32::ISimilarityTableDumpState
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_next_data(resultssize : UInt32, resultsused : UInt32*, eof : LibC::BOOL*, results : SimilarityDumpData*) : HRESULT
    @lpVtbl.value.get_next_data.unsafe_as(Proc(UInt32, UInt32*, LibC::BOOL*, SimilarityDumpData*, HRESULT)).call(resultssize, resultsused, eof, results)
  end
end
struct LibWin32::ISimilarityTraitsMappedView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def flush : HRESULT
    @lpVtbl.value.flush.unsafe_as(Proc(HRESULT)).call
  end
  def unmap : HRESULT
    @lpVtbl.value.unmap.unsafe_as(Proc(HRESULT)).call
  end
  def get(index : UInt64, dirty : LibC::BOOL, numelements : UInt32, viewinfo : SimilarityMappedViewInfo*) : HRESULT
    @lpVtbl.value.get.unsafe_as(Proc(UInt64, LibC::BOOL, UInt32, SimilarityMappedViewInfo*, HRESULT)).call(index, dirty, numelements, viewinfo)
  end
  def get_view(mappedpagebegin : UInt8**, mappedpageend : UInt8**) : Void
    @lpVtbl.value.get_view.unsafe_as(Proc(UInt8**, UInt8**, Void)).call(mappedpagebegin, mappedpageend)
  end
end
struct LibWin32::ISimilarityTraitsMapping
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def close_mapping : Void
    @lpVtbl.value.close_mapping.unsafe_as(Proc(Void)).call
  end
  def set_file_size(filesize : UInt64) : HRESULT
    @lpVtbl.value.set_file_size.unsafe_as(Proc(UInt64, HRESULT)).call(filesize)
  end
  def get_file_size(filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.unsafe_as(Proc(UInt64*, HRESULT)).call(filesize)
  end
  def open_mapping(accessmode : RdcMappingAccessMode, begin_ : UInt64, end_ : UInt64, actualend : UInt64*) : HRESULT
    @lpVtbl.value.open_mapping.unsafe_as(Proc(RdcMappingAccessMode, UInt64, UInt64, UInt64*, HRESULT)).call(accessmode, begin_, end_, actualend)
  end
  def resize_mapping(accessmode : RdcMappingAccessMode, begin_ : UInt64, end_ : UInt64, actualend : UInt64*) : HRESULT
    @lpVtbl.value.resize_mapping.unsafe_as(Proc(RdcMappingAccessMode, UInt64, UInt64, UInt64*, HRESULT)).call(accessmode, begin_, end_, actualend)
  end
  def get_page_size(pagesize : UInt32*) : Void
    @lpVtbl.value.get_page_size.unsafe_as(Proc(UInt32*, Void)).call(pagesize)
  end
  def create_view(minimummappedpages : UInt32, accessmode : RdcMappingAccessMode, mappedview : ISimilarityTraitsMappedView*) : HRESULT
    @lpVtbl.value.create_view.unsafe_as(Proc(UInt32, RdcMappingAccessMode, ISimilarityTraitsMappedView*, HRESULT)).call(minimummappedpages, accessmode, mappedview)
  end
end
struct LibWin32::ISimilarityTraitsTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_table(path : LibC::LPWSTR, truncate : LibC::BOOL, securitydescriptor : UInt8*, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, UInt8*, RdcCreatedTables*, HRESULT)).call(path, truncate, securitydescriptor, isnew)
  end
  def create_table_indirect(mapping : ISimilarityTraitsMapping, truncate : LibC::BOOL, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table_indirect.unsafe_as(Proc(ISimilarityTraitsMapping, LibC::BOOL, RdcCreatedTables*, HRESULT)).call(mapping, truncate, isnew)
  end
  def close_table(isvalid : LibC::BOOL) : HRESULT
    @lpVtbl.value.close_table.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(isvalid)
  end
  def append(data : SimilarityData*, fileindex : UInt32) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(SimilarityData*, UInt32, HRESULT)).call(data, fileindex)
  end
  def find_similar_file_index(similaritydata : SimilarityData*, numberofmatchesrequired : UInt16, findsimilarfileindexresults : FindSimilarFileIndexResults*, resultssize : UInt32, resultsused : UInt32*) : HRESULT
    @lpVtbl.value.find_similar_file_index.unsafe_as(Proc(SimilarityData*, UInt16, FindSimilarFileIndexResults*, UInt32, UInt32*, HRESULT)).call(similaritydata, numberofmatchesrequired, findsimilarfileindexresults, resultssize, resultsused)
  end
  def begin_dump(similaritytabledumpstate : ISimilarityTableDumpState*) : HRESULT
    @lpVtbl.value.begin_dump.unsafe_as(Proc(ISimilarityTableDumpState*, HRESULT)).call(similaritytabledumpstate)
  end
  def get_last_index(fileindex : UInt32*) : HRESULT
    @lpVtbl.value.get_last_index.unsafe_as(Proc(UInt32*, HRESULT)).call(fileindex)
  end
end
struct LibWin32::ISimilarityFileIdTable
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_table(path : LibC::LPWSTR, truncate : LibC::BOOL, securitydescriptor : UInt8*, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, UInt8*, UInt32, RdcCreatedTables*, HRESULT)).call(path, truncate, securitydescriptor, recordsize, isnew)
  end
  def create_table_indirect(fileidfile : IRdcFileWriter, truncate : LibC::BOOL, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table_indirect.unsafe_as(Proc(IRdcFileWriter, LibC::BOOL, UInt32, RdcCreatedTables*, HRESULT)).call(fileidfile, truncate, recordsize, isnew)
  end
  def close_table(isvalid : LibC::BOOL) : HRESULT
    @lpVtbl.value.close_table.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(isvalid)
  end
  def append(similarityfileid : SimilarityFileId*, similarityfileindex : UInt32*) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(SimilarityFileId*, UInt32*, HRESULT)).call(similarityfileid, similarityfileindex)
  end
  def lookup(similarityfileindex : UInt32, similarityfileid : SimilarityFileId*) : HRESULT
    @lpVtbl.value.lookup.unsafe_as(Proc(UInt32, SimilarityFileId*, HRESULT)).call(similarityfileindex, similarityfileid)
  end
  def invalidate(similarityfileindex : UInt32) : HRESULT
    @lpVtbl.value.invalidate.unsafe_as(Proc(UInt32, HRESULT)).call(similarityfileindex)
  end
  def get_record_count(recordcount : UInt32*) : HRESULT
    @lpVtbl.value.get_record_count.unsafe_as(Proc(UInt32*, HRESULT)).call(recordcount)
  end
end
struct LibWin32::IRdcSimilarityGenerator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enable_similarity : HRESULT
    @lpVtbl.value.enable_similarity.unsafe_as(Proc(HRESULT)).call
  end
  def results(similaritydata : SimilarityData*) : HRESULT
    @lpVtbl.value.results.unsafe_as(Proc(SimilarityData*, HRESULT)).call(similaritydata)
  end
end
struct LibWin32::IFindSimilarResults
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_size(size : UInt32*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(UInt32*, HRESULT)).call(size)
  end
  def get_next_file_id(numtraitsmatched : UInt32*, similarityfileid : SimilarityFileId*) : HRESULT
    @lpVtbl.value.get_next_file_id.unsafe_as(Proc(UInt32*, SimilarityFileId*, HRESULT)).call(numtraitsmatched, similarityfileid)
  end
end
struct LibWin32::ISimilarity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_table(path : LibC::LPWSTR, truncate : LibC::BOOL, securitydescriptor : UInt8*, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table.unsafe_as(Proc(LibC::LPWSTR, LibC::BOOL, UInt8*, UInt32, RdcCreatedTables*, HRESULT)).call(path, truncate, securitydescriptor, recordsize, isnew)
  end
  def create_table_indirect(mapping : ISimilarityTraitsMapping, fileidfile : IRdcFileWriter, truncate : LibC::BOOL, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table_indirect.unsafe_as(Proc(ISimilarityTraitsMapping, IRdcFileWriter, LibC::BOOL, UInt32, RdcCreatedTables*, HRESULT)).call(mapping, fileidfile, truncate, recordsize, isnew)
  end
  def close_table(isvalid : LibC::BOOL) : HRESULT
    @lpVtbl.value.close_table.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(isvalid)
  end
  def append(similarityfileid : SimilarityFileId*, similaritydata : SimilarityData*) : HRESULT
    @lpVtbl.value.append.unsafe_as(Proc(SimilarityFileId*, SimilarityData*, HRESULT)).call(similarityfileid, similaritydata)
  end
  def find_similar_file_id(similaritydata : SimilarityData*, numberofmatchesrequired : UInt16, resultssize : UInt32, findsimilarresults : IFindSimilarResults*) : HRESULT
    @lpVtbl.value.find_similar_file_id.unsafe_as(Proc(SimilarityData*, UInt16, UInt32, IFindSimilarResults*, HRESULT)).call(similaritydata, numberofmatchesrequired, resultssize, findsimilarresults)
  end
  def copy_and_swap(newsimilaritytables : ISimilarity, reportprogress : ISimilarityReportProgress) : HRESULT
    @lpVtbl.value.copy_and_swap.unsafe_as(Proc(ISimilarity, ISimilarityReportProgress, HRESULT)).call(newsimilaritytables, reportprogress)
  end
  def get_record_count(recordcount : UInt32*) : HRESULT
    @lpVtbl.value.get_record_count.unsafe_as(Proc(UInt32*, HRESULT)).call(recordcount)
  end
end
