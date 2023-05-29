require "../system/com.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
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
  RdcLibrary = LibC::GUID.new(0x96236a85_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcGeneratorParameters = LibC::GUID.new(0x96236a86_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcGeneratorFilterMaxParameters = LibC::GUID.new(0x96236a87_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcGenerator = LibC::GUID.new(0x96236a88_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcFileReader = LibC::GUID.new(0x96236a89_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcSignatureReader = LibC::GUID.new(0x96236a8a_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcComparator = LibC::GUID.new(0x96236a8b_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  SimilarityReportProgress = LibC::GUID.new(0x96236a8d_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  SimilarityTableDumpState = LibC::GUID.new(0x96236a8e_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  SimilarityTraitsTable = LibC::GUID.new(0x96236a8f_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  SimilarityFileIdTable = LibC::GUID.new(0x96236a90_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  Similarity = LibC::GUID.new(0x96236a91_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  RdcSimilarityGenerator = LibC::GUID.new(0x96236a92_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  FindSimilarResults = LibC::GUID.new(0x96236a93_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  SimilarityTraitsMapping = LibC::GUID.new(0x96236a94_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  SimilarityTraitsMappedView = LibC::GUID.new(0x96236a95_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])


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
    query_interface : Proc(IRdcGeneratorParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcGeneratorParameters*, UInt32)
    release : Proc(IRdcGeneratorParameters*, UInt32)
    get_generator_parameters_type : Proc(IRdcGeneratorParameters*, GeneratorParametersType*, HRESULT)
    get_parameters_version : Proc(IRdcGeneratorParameters*, UInt32*, UInt32*, HRESULT)
    get_serialize_size : Proc(IRdcGeneratorParameters*, UInt32*, HRESULT)
    serialize : Proc(IRdcGeneratorParameters*, UInt32, UInt8*, UInt32*, HRESULT)
  end

  struct IRdcGeneratorParameters
    lpVtbl : IRdcGeneratorParametersVTbl*
  end

  struct IRdcGeneratorFilterMaxParametersVTbl
    query_interface : Proc(IRdcGeneratorFilterMaxParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcGeneratorFilterMaxParameters*, UInt32)
    release : Proc(IRdcGeneratorFilterMaxParameters*, UInt32)
    get_horizon_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32*, HRESULT)
    set_horizon_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32, HRESULT)
    get_hash_window_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32*, HRESULT)
    set_hash_window_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32, HRESULT)
  end

  struct IRdcGeneratorFilterMaxParameters
    lpVtbl : IRdcGeneratorFilterMaxParametersVTbl*
  end

  struct IRdcGeneratorVTbl
    query_interface : Proc(IRdcGenerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcGenerator*, UInt32)
    release : Proc(IRdcGenerator*, UInt32)
    get_generator_parameters : Proc(IRdcGenerator*, UInt32, IRdcGeneratorParameters*, HRESULT)
    process : Proc(IRdcGenerator*, LibC::BOOL, LibC::BOOL*, RdcBufferPointer*, UInt32, RdcBufferPointer**, RDC_ErrorCode*, HRESULT)
  end

  struct IRdcGenerator
    lpVtbl : IRdcGeneratorVTbl*
  end

  struct IRdcFileReaderVTbl
    query_interface : Proc(IRdcFileReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcFileReader*, UInt32)
    release : Proc(IRdcFileReader*, UInt32)
    get_file_size : Proc(IRdcFileReader*, UInt64*, HRESULT)
    read : Proc(IRdcFileReader*, UInt64, UInt32, UInt32*, UInt8*, LibC::BOOL*, HRESULT)
    get_file_position : Proc(IRdcFileReader*, UInt64*, HRESULT)
  end

  struct IRdcFileReader
    lpVtbl : IRdcFileReaderVTbl*
  end

  struct IRdcFileWriterVTbl
    query_interface : Proc(IRdcFileWriter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcFileWriter*, UInt32)
    release : Proc(IRdcFileWriter*, UInt32)
    get_file_size : Proc(IRdcFileWriter*, UInt64*, HRESULT)
    read : Proc(IRdcFileWriter*, UInt64, UInt32, UInt32*, UInt8*, LibC::BOOL*, HRESULT)
    get_file_position : Proc(IRdcFileWriter*, UInt64*, HRESULT)
    write : Proc(IRdcFileWriter*, UInt64, UInt32, UInt8*, HRESULT)
    truncate : Proc(IRdcFileWriter*, HRESULT)
    delete_on_close : Proc(IRdcFileWriter*, HRESULT)
  end

  struct IRdcFileWriter
    lpVtbl : IRdcFileWriterVTbl*
  end

  struct IRdcSignatureReaderVTbl
    query_interface : Proc(IRdcSignatureReader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcSignatureReader*, UInt32)
    release : Proc(IRdcSignatureReader*, UInt32)
    read_header : Proc(IRdcSignatureReader*, RDC_ErrorCode*, HRESULT)
    read_signatures : Proc(IRdcSignatureReader*, RdcSignaturePointer*, LibC::BOOL*, HRESULT)
  end

  struct IRdcSignatureReader
    lpVtbl : IRdcSignatureReaderVTbl*
  end

  struct IRdcComparatorVTbl
    query_interface : Proc(IRdcComparator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcComparator*, UInt32)
    release : Proc(IRdcComparator*, UInt32)
    process : Proc(IRdcComparator*, LibC::BOOL, LibC::BOOL*, RdcBufferPointer*, RdcNeedPointer*, RDC_ErrorCode*, HRESULT)
  end

  struct IRdcComparator
    lpVtbl : IRdcComparatorVTbl*
  end

  struct IRdcLibraryVTbl
    query_interface : Proc(IRdcLibrary*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcLibrary*, UInt32)
    release : Proc(IRdcLibrary*, UInt32)
    compute_default_recursion_depth : Proc(IRdcLibrary*, UInt64, UInt32*, HRESULT)
    create_generator_parameters : Proc(IRdcLibrary*, GeneratorParametersType, UInt32, IRdcGeneratorParameters*, HRESULT)
    open_generator_parameters : Proc(IRdcLibrary*, UInt32, UInt8*, IRdcGeneratorParameters*, HRESULT)
    create_generator : Proc(IRdcLibrary*, UInt32, IRdcGeneratorParameters*, IRdcGenerator*, HRESULT)
    create_comparator : Proc(IRdcLibrary*, IRdcFileReader, UInt32, IRdcComparator*, HRESULT)
    create_signature_reader : Proc(IRdcLibrary*, IRdcFileReader, IRdcSignatureReader*, HRESULT)
    get_rdc_version : Proc(IRdcLibrary*, UInt32*, UInt32*, HRESULT)
  end

  struct IRdcLibrary
    lpVtbl : IRdcLibraryVTbl*
  end

  struct ISimilarityReportProgressVTbl
    query_interface : Proc(ISimilarityReportProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityReportProgress*, UInt32)
    release : Proc(ISimilarityReportProgress*, UInt32)
    report_progress : Proc(ISimilarityReportProgress*, UInt32, HRESULT)
  end

  struct ISimilarityReportProgress
    lpVtbl : ISimilarityReportProgressVTbl*
  end

  struct ISimilarityTableDumpStateVTbl
    query_interface : Proc(ISimilarityTableDumpState*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityTableDumpState*, UInt32)
    release : Proc(ISimilarityTableDumpState*, UInt32)
    get_next_data : Proc(ISimilarityTableDumpState*, UInt32, UInt32*, LibC::BOOL*, SimilarityDumpData*, HRESULT)
  end

  struct ISimilarityTableDumpState
    lpVtbl : ISimilarityTableDumpStateVTbl*
  end

  struct ISimilarityTraitsMappedViewVTbl
    query_interface : Proc(ISimilarityTraitsMappedView*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityTraitsMappedView*, UInt32)
    release : Proc(ISimilarityTraitsMappedView*, UInt32)
    flush : Proc(ISimilarityTraitsMappedView*, HRESULT)
    unmap : Proc(ISimilarityTraitsMappedView*, HRESULT)
    get : Proc(ISimilarityTraitsMappedView*, UInt64, LibC::BOOL, UInt32, SimilarityMappedViewInfo*, HRESULT)
    get_view : Proc(ISimilarityTraitsMappedView*, UInt8**, UInt8**, Void)
  end

  struct ISimilarityTraitsMappedView
    lpVtbl : ISimilarityTraitsMappedViewVTbl*
  end

  struct ISimilarityTraitsMappingVTbl
    query_interface : Proc(ISimilarityTraitsMapping*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityTraitsMapping*, UInt32)
    release : Proc(ISimilarityTraitsMapping*, UInt32)
    close_mapping : Proc(ISimilarityTraitsMapping*, Void)
    set_file_size : Proc(ISimilarityTraitsMapping*, UInt64, HRESULT)
    get_file_size : Proc(ISimilarityTraitsMapping*, UInt64*, HRESULT)
    open_mapping : Proc(ISimilarityTraitsMapping*, RdcMappingAccessMode, UInt64, UInt64, UInt64*, HRESULT)
    resize_mapping : Proc(ISimilarityTraitsMapping*, RdcMappingAccessMode, UInt64, UInt64, UInt64*, HRESULT)
    get_page_size : Proc(ISimilarityTraitsMapping*, UInt32*, Void)
    create_view : Proc(ISimilarityTraitsMapping*, UInt32, RdcMappingAccessMode, ISimilarityTraitsMappedView*, HRESULT)
  end

  struct ISimilarityTraitsMapping
    lpVtbl : ISimilarityTraitsMappingVTbl*
  end

  struct ISimilarityTraitsTableVTbl
    query_interface : Proc(ISimilarityTraitsTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityTraitsTable*, UInt32)
    release : Proc(ISimilarityTraitsTable*, UInt32)
    create_table : Proc(ISimilarityTraitsTable*, LibC::LPWSTR, LibC::BOOL, UInt8*, RdcCreatedTables*, HRESULT)
    create_table_indirect : Proc(ISimilarityTraitsTable*, ISimilarityTraitsMapping, LibC::BOOL, RdcCreatedTables*, HRESULT)
    close_table : Proc(ISimilarityTraitsTable*, LibC::BOOL, HRESULT)
    append : Proc(ISimilarityTraitsTable*, SimilarityData*, UInt32, HRESULT)
    find_similar_file_index : Proc(ISimilarityTraitsTable*, SimilarityData*, UInt16, FindSimilarFileIndexResults*, UInt32, UInt32*, HRESULT)
    begin_dump : Proc(ISimilarityTraitsTable*, ISimilarityTableDumpState*, HRESULT)
    get_last_index : Proc(ISimilarityTraitsTable*, UInt32*, HRESULT)
  end

  struct ISimilarityTraitsTable
    lpVtbl : ISimilarityTraitsTableVTbl*
  end

  struct ISimilarityFileIdTableVTbl
    query_interface : Proc(ISimilarityFileIdTable*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityFileIdTable*, UInt32)
    release : Proc(ISimilarityFileIdTable*, UInt32)
    create_table : Proc(ISimilarityFileIdTable*, LibC::LPWSTR, LibC::BOOL, UInt8*, UInt32, RdcCreatedTables*, HRESULT)
    create_table_indirect : Proc(ISimilarityFileIdTable*, IRdcFileWriter, LibC::BOOL, UInt32, RdcCreatedTables*, HRESULT)
    close_table : Proc(ISimilarityFileIdTable*, LibC::BOOL, HRESULT)
    append : Proc(ISimilarityFileIdTable*, SimilarityFileId*, UInt32*, HRESULT)
    lookup : Proc(ISimilarityFileIdTable*, UInt32, SimilarityFileId*, HRESULT)
    invalidate : Proc(ISimilarityFileIdTable*, UInt32, HRESULT)
    get_record_count : Proc(ISimilarityFileIdTable*, UInt32*, HRESULT)
  end

  struct ISimilarityFileIdTable
    lpVtbl : ISimilarityFileIdTableVTbl*
  end

  struct IRdcSimilarityGeneratorVTbl
    query_interface : Proc(IRdcSimilarityGenerator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcSimilarityGenerator*, UInt32)
    release : Proc(IRdcSimilarityGenerator*, UInt32)
    enable_similarity : Proc(IRdcSimilarityGenerator*, HRESULT)
    results : Proc(IRdcSimilarityGenerator*, SimilarityData*, HRESULT)
  end

  struct IRdcSimilarityGenerator
    lpVtbl : IRdcSimilarityGeneratorVTbl*
  end

  struct IFindSimilarResultsVTbl
    query_interface : Proc(IFindSimilarResults*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFindSimilarResults*, UInt32)
    release : Proc(IFindSimilarResults*, UInt32)
    get_size : Proc(IFindSimilarResults*, UInt32*, HRESULT)
    get_next_file_id : Proc(IFindSimilarResults*, UInt32*, SimilarityFileId*, HRESULT)
  end

  struct IFindSimilarResults
    lpVtbl : IFindSimilarResultsVTbl*
  end

  struct ISimilarityVTbl
    query_interface : Proc(ISimilarity*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarity*, UInt32)
    release : Proc(ISimilarity*, UInt32)
    create_table : Proc(ISimilarity*, LibC::LPWSTR, LibC::BOOL, UInt8*, UInt32, RdcCreatedTables*, HRESULT)
    create_table_indirect : Proc(ISimilarity*, ISimilarityTraitsMapping, IRdcFileWriter, LibC::BOOL, UInt32, RdcCreatedTables*, HRESULT)
    close_table : Proc(ISimilarity*, LibC::BOOL, HRESULT)
    append : Proc(ISimilarity*, SimilarityFileId*, SimilarityData*, HRESULT)
    find_similar_file_id : Proc(ISimilarity*, SimilarityData*, UInt16, UInt32, IFindSimilarResults*, HRESULT)
    copy_and_swap : Proc(ISimilarity*, ISimilarity, ISimilarityReportProgress, HRESULT)
    get_record_count : Proc(ISimilarity*, UInt32*, HRESULT)
  end

  struct ISimilarity
    lpVtbl : ISimilarityVTbl*
  end

end
