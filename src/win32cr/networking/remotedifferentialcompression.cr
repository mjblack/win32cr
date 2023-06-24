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
    query_interface : Proc(IRdcGeneratorParameters*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcGeneratorParameters*, UInt32)
    release : Proc(IRdcGeneratorParameters*, UInt32)
    get_generator_parameters_type : Proc(IRdcGeneratorParameters*, GeneratorParametersType*, HRESULT)
    get_parameters_version : Proc(IRdcGeneratorParameters*, UInt32*, UInt32*, HRESULT)
    get_serialize_size : Proc(IRdcGeneratorParameters*, UInt32*, HRESULT)
    serialize : Proc(IRdcGeneratorParameters*, UInt32, UInt8*, UInt32*, HRESULT)
  end

  IRdcGeneratorParameters_GUID = "96236a71-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcGeneratorParameters = LibC::GUID.new(0x96236a71_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcGeneratorFilterMaxParameters_GUID = "96236a72-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcGeneratorFilterMaxParameters = LibC::GUID.new(0x96236a72_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcGenerator_GUID = "96236a73-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcGenerator = LibC::GUID.new(0x96236a73_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcFileReader_GUID = "96236a74-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcFileReader = LibC::GUID.new(0x96236a74_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcFileWriter_GUID = "96236a75-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcFileWriter = LibC::GUID.new(0x96236a75_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcSignatureReader_GUID = "96236a76-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcSignatureReader = LibC::GUID.new(0x96236a76_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcSignatureReader
    lpVtbl : IRdcSignatureReaderVTbl*
  end

  struct IRdcComparatorVTbl
    query_interface : Proc(IRdcComparator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRdcComparator*, UInt32)
    release : Proc(IRdcComparator*, UInt32)
    process : Proc(IRdcComparator*, LibC::BOOL, LibC::BOOL*, RdcBufferPointer*, RdcNeedPointer*, RDC_ErrorCode*, HRESULT)
  end

  IRdcComparator_GUID = "96236a77-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcComparator = LibC::GUID.new(0x96236a77_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcLibrary_GUID = "96236a78-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcLibrary = LibC::GUID.new(0x96236a78_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct IRdcLibrary
    lpVtbl : IRdcLibraryVTbl*
  end

  struct ISimilarityReportProgressVTbl
    query_interface : Proc(ISimilarityReportProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityReportProgress*, UInt32)
    release : Proc(ISimilarityReportProgress*, UInt32)
    report_progress : Proc(ISimilarityReportProgress*, UInt32, HRESULT)
  end

  ISimilarityReportProgress_GUID = "96236a7a-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityReportProgress = LibC::GUID.new(0x96236a7a_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarityReportProgress
    lpVtbl : ISimilarityReportProgressVTbl*
  end

  struct ISimilarityTableDumpStateVTbl
    query_interface : Proc(ISimilarityTableDumpState*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISimilarityTableDumpState*, UInt32)
    release : Proc(ISimilarityTableDumpState*, UInt32)
    get_next_data : Proc(ISimilarityTableDumpState*, UInt32, UInt32*, LibC::BOOL*, SimilarityDumpData*, HRESULT)
  end

  ISimilarityTableDumpState_GUID = "96236a7b-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTableDumpState = LibC::GUID.new(0x96236a7b_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  ISimilarityTraitsMappedView_GUID = "96236a7c-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTraitsMappedView = LibC::GUID.new(0x96236a7c_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  ISimilarityTraitsMapping_GUID = "96236a7d-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTraitsMapping = LibC::GUID.new(0x96236a7d_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  ISimilarityTraitsTable_GUID = "96236a7e-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityTraitsTable = LibC::GUID.new(0x96236a7e_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  ISimilarityFileIdTable_GUID = "96236a7f-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarityFileIdTable = LibC::GUID.new(0x96236a7f_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IRdcSimilarityGenerator_GUID = "96236a80-9dbc-11da-9e3f-0011114ae311"
  IID_IRdcSimilarityGenerator = LibC::GUID.new(0x96236a80_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  IFindSimilarResults_GUID = "96236a81-9dbc-11da-9e3f-0011114ae311"
  IID_IFindSimilarResults = LibC::GUID.new(0x96236a81_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
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

  ISimilarity_GUID = "96236a83-9dbc-11da-9e3f-0011114ae311"
  IID_ISimilarity = LibC::GUID.new(0x96236a83_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
  struct ISimilarity
    lpVtbl : ISimilarityVTbl*
  end

end
struct LibWin32::IRdcGeneratorParameters
  def query_interface(this : IRdcGeneratorParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcGeneratorParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcGeneratorParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_generator_parameters_type(this : IRdcGeneratorParameters*, parameterstype : GeneratorParametersType*) : HRESULT
    @lpVtbl.value.get_generator_parameters_type.call(this, parameterstype)
  end
  def get_parameters_version(this : IRdcGeneratorParameters*, currentversion : UInt32*, minimumcompatibleappversion : UInt32*) : HRESULT
    @lpVtbl.value.get_parameters_version.call(this, currentversion, minimumcompatibleappversion)
  end
  def get_serialize_size(this : IRdcGeneratorParameters*, size : UInt32*) : HRESULT
    @lpVtbl.value.get_serialize_size.call(this, size)
  end
  def serialize(this : IRdcGeneratorParameters*, size : UInt32, parametersblob : UInt8*, byteswritten : UInt32*) : HRESULT
    @lpVtbl.value.serialize.call(this, size, parametersblob, byteswritten)
  end
end
struct LibWin32::IRdcGeneratorFilterMaxParameters
  def query_interface(this : IRdcGeneratorFilterMaxParameters*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcGeneratorFilterMaxParameters*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcGeneratorFilterMaxParameters*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_horizon_size(this : IRdcGeneratorFilterMaxParameters*, horizonsize : UInt32*) : HRESULT
    @lpVtbl.value.get_horizon_size.call(this, horizonsize)
  end
  def set_horizon_size(this : IRdcGeneratorFilterMaxParameters*, horizonsize : UInt32) : HRESULT
    @lpVtbl.value.set_horizon_size.call(this, horizonsize)
  end
  def get_hash_window_size(this : IRdcGeneratorFilterMaxParameters*, hashwindowsize : UInt32*) : HRESULT
    @lpVtbl.value.get_hash_window_size.call(this, hashwindowsize)
  end
  def set_hash_window_size(this : IRdcGeneratorFilterMaxParameters*, hashwindowsize : UInt32) : HRESULT
    @lpVtbl.value.set_hash_window_size.call(this, hashwindowsize)
  end
end
struct LibWin32::IRdcGenerator
  def query_interface(this : IRdcGenerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcGenerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcGenerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_generator_parameters(this : IRdcGenerator*, level : UInt32, igeneratorparameters : IRdcGeneratorParameters*) : HRESULT
    @lpVtbl.value.get_generator_parameters.call(this, level, igeneratorparameters)
  end
  def process(this : IRdcGenerator*, endofinput : LibC::BOOL, endofoutput : LibC::BOOL*, inputbuffer : RdcBufferPointer*, depth : UInt32, outputbuffers : RdcBufferPointer**, rdc_errorcode : RDC_ErrorCode*) : HRESULT
    @lpVtbl.value.process.call(this, endofinput, endofoutput, inputbuffer, depth, outputbuffers, rdc_errorcode)
  end
end
struct LibWin32::IRdcFileReader
  def query_interface(this : IRdcFileReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcFileReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcFileReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_file_size(this : IRdcFileReader*, filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, filesize)
  end
  def read(this : IRdcFileReader*, offsetfilestart : UInt64, bytestoread : UInt32, bytesactuallyread : UInt32*, buffer : UInt8*, eof : LibC::BOOL*) : HRESULT
    @lpVtbl.value.read.call(this, offsetfilestart, bytestoread, bytesactuallyread, buffer, eof)
  end
  def get_file_position(this : IRdcFileReader*, offsetfromstart : UInt64*) : HRESULT
    @lpVtbl.value.get_file_position.call(this, offsetfromstart)
  end
end
struct LibWin32::IRdcFileWriter
  def query_interface(this : IRdcFileWriter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcFileWriter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcFileWriter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_file_size(this : IRdcFileWriter*, filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, filesize)
  end
  def read(this : IRdcFileWriter*, offsetfilestart : UInt64, bytestoread : UInt32, bytesactuallyread : UInt32*, buffer : UInt8*, eof : LibC::BOOL*) : HRESULT
    @lpVtbl.value.read.call(this, offsetfilestart, bytestoread, bytesactuallyread, buffer, eof)
  end
  def get_file_position(this : IRdcFileWriter*, offsetfromstart : UInt64*) : HRESULT
    @lpVtbl.value.get_file_position.call(this, offsetfromstart)
  end
  def write(this : IRdcFileWriter*, offsetfilestart : UInt64, bytestowrite : UInt32, buffer : UInt8*) : HRESULT
    @lpVtbl.value.write.call(this, offsetfilestart, bytestowrite, buffer)
  end
  def truncate(this : IRdcFileWriter*) : HRESULT
    @lpVtbl.value.truncate.call(this)
  end
  def delete_on_close(this : IRdcFileWriter*) : HRESULT
    @lpVtbl.value.delete_on_close.call(this)
  end
end
struct LibWin32::IRdcSignatureReader
  def query_interface(this : IRdcSignatureReader*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcSignatureReader*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcSignatureReader*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def read_header(this : IRdcSignatureReader*, rdc_errorcode : RDC_ErrorCode*) : HRESULT
    @lpVtbl.value.read_header.call(this, rdc_errorcode)
  end
  def read_signatures(this : IRdcSignatureReader*, rdcsignaturepointer : RdcSignaturePointer*, endofoutput : LibC::BOOL*) : HRESULT
    @lpVtbl.value.read_signatures.call(this, rdcsignaturepointer, endofoutput)
  end
end
struct LibWin32::IRdcComparator
  def query_interface(this : IRdcComparator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcComparator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcComparator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def process(this : IRdcComparator*, endofinput : LibC::BOOL, endofoutput : LibC::BOOL*, inputbuffer : RdcBufferPointer*, outputbuffer : RdcNeedPointer*, rdc_errorcode : RDC_ErrorCode*) : HRESULT
    @lpVtbl.value.process.call(this, endofinput, endofoutput, inputbuffer, outputbuffer, rdc_errorcode)
  end
end
struct LibWin32::IRdcLibrary
  def query_interface(this : IRdcLibrary*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcLibrary*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcLibrary*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compute_default_recursion_depth(this : IRdcLibrary*, filesize : UInt64, depth : UInt32*) : HRESULT
    @lpVtbl.value.compute_default_recursion_depth.call(this, filesize, depth)
  end
  def create_generator_parameters(this : IRdcLibrary*, parameterstype : GeneratorParametersType, level : UInt32, igeneratorparameters : IRdcGeneratorParameters*) : HRESULT
    @lpVtbl.value.create_generator_parameters.call(this, parameterstype, level, igeneratorparameters)
  end
  def open_generator_parameters(this : IRdcLibrary*, size : UInt32, parametersblob : UInt8*, igeneratorparameters : IRdcGeneratorParameters*) : HRESULT
    @lpVtbl.value.open_generator_parameters.call(this, size, parametersblob, igeneratorparameters)
  end
  def create_generator(this : IRdcLibrary*, depth : UInt32, igeneratorparametersarray : IRdcGeneratorParameters*, igenerator : IRdcGenerator*) : HRESULT
    @lpVtbl.value.create_generator.call(this, depth, igeneratorparametersarray, igenerator)
  end
  def create_comparator(this : IRdcLibrary*, iseedsignaturesfile : IRdcFileReader, comparatorbuffersize : UInt32, icomparator : IRdcComparator*) : HRESULT
    @lpVtbl.value.create_comparator.call(this, iseedsignaturesfile, comparatorbuffersize, icomparator)
  end
  def create_signature_reader(this : IRdcLibrary*, ifilereader : IRdcFileReader, isignaturereader : IRdcSignatureReader*) : HRESULT
    @lpVtbl.value.create_signature_reader.call(this, ifilereader, isignaturereader)
  end
  def get_rdc_version(this : IRdcLibrary*, currentversion : UInt32*, minimumcompatibleappversion : UInt32*) : HRESULT
    @lpVtbl.value.get_rdc_version.call(this, currentversion, minimumcompatibleappversion)
  end
end
struct LibWin32::ISimilarityReportProgress
  def query_interface(this : ISimilarityReportProgress*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarityReportProgress*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarityReportProgress*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def report_progress(this : ISimilarityReportProgress*, percentcompleted : UInt32) : HRESULT
    @lpVtbl.value.report_progress.call(this, percentcompleted)
  end
end
struct LibWin32::ISimilarityTableDumpState
  def query_interface(this : ISimilarityTableDumpState*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarityTableDumpState*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarityTableDumpState*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_next_data(this : ISimilarityTableDumpState*, resultssize : UInt32, resultsused : UInt32*, eof : LibC::BOOL*, results : SimilarityDumpData*) : HRESULT
    @lpVtbl.value.get_next_data.call(this, resultssize, resultsused, eof, results)
  end
end
struct LibWin32::ISimilarityTraitsMappedView
  def query_interface(this : ISimilarityTraitsMappedView*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarityTraitsMappedView*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarityTraitsMappedView*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def flush(this : ISimilarityTraitsMappedView*) : HRESULT
    @lpVtbl.value.flush.call(this)
  end
  def unmap(this : ISimilarityTraitsMappedView*) : HRESULT
    @lpVtbl.value.unmap.call(this)
  end
  def get(this : ISimilarityTraitsMappedView*, index : UInt64, dirty : LibC::BOOL, numelements : UInt32, viewinfo : SimilarityMappedViewInfo*) : HRESULT
    @lpVtbl.value.get.call(this, index, dirty, numelements, viewinfo)
  end
  def get_view(this : ISimilarityTraitsMappedView*, mappedpagebegin : UInt8**, mappedpageend : UInt8**) : Void
    @lpVtbl.value.get_view.call(this, mappedpagebegin, mappedpageend)
  end
end
struct LibWin32::ISimilarityTraitsMapping
  def query_interface(this : ISimilarityTraitsMapping*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarityTraitsMapping*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarityTraitsMapping*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def close_mapping(this : ISimilarityTraitsMapping*) : Void
    @lpVtbl.value.close_mapping.call(this)
  end
  def set_file_size(this : ISimilarityTraitsMapping*, filesize : UInt64) : HRESULT
    @lpVtbl.value.set_file_size.call(this, filesize)
  end
  def get_file_size(this : ISimilarityTraitsMapping*, filesize : UInt64*) : HRESULT
    @lpVtbl.value.get_file_size.call(this, filesize)
  end
  def open_mapping(this : ISimilarityTraitsMapping*, accessmode : RdcMappingAccessMode, begin_ : UInt64, end_ : UInt64, actualend : UInt64*) : HRESULT
    @lpVtbl.value.open_mapping.call(this, accessmode, begin_, end_, actualend)
  end
  def resize_mapping(this : ISimilarityTraitsMapping*, accessmode : RdcMappingAccessMode, begin_ : UInt64, end_ : UInt64, actualend : UInt64*) : HRESULT
    @lpVtbl.value.resize_mapping.call(this, accessmode, begin_, end_, actualend)
  end
  def get_page_size(this : ISimilarityTraitsMapping*, pagesize : UInt32*) : Void
    @lpVtbl.value.get_page_size.call(this, pagesize)
  end
  def create_view(this : ISimilarityTraitsMapping*, minimummappedpages : UInt32, accessmode : RdcMappingAccessMode, mappedview : ISimilarityTraitsMappedView*) : HRESULT
    @lpVtbl.value.create_view.call(this, minimummappedpages, accessmode, mappedview)
  end
end
struct LibWin32::ISimilarityTraitsTable
  def query_interface(this : ISimilarityTraitsTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarityTraitsTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarityTraitsTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_table(this : ISimilarityTraitsTable*, path : LibC::LPWSTR, truncate : LibC::BOOL, securitydescriptor : UInt8*, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table.call(this, path, truncate, securitydescriptor, isnew)
  end
  def create_table_indirect(this : ISimilarityTraitsTable*, mapping : ISimilarityTraitsMapping, truncate : LibC::BOOL, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table_indirect.call(this, mapping, truncate, isnew)
  end
  def close_table(this : ISimilarityTraitsTable*, isvalid : LibC::BOOL) : HRESULT
    @lpVtbl.value.close_table.call(this, isvalid)
  end
  def append(this : ISimilarityTraitsTable*, data : SimilarityData*, fileindex : UInt32) : HRESULT
    @lpVtbl.value.append.call(this, data, fileindex)
  end
  def find_similar_file_index(this : ISimilarityTraitsTable*, similaritydata : SimilarityData*, numberofmatchesrequired : UInt16, findsimilarfileindexresults : FindSimilarFileIndexResults*, resultssize : UInt32, resultsused : UInt32*) : HRESULT
    @lpVtbl.value.find_similar_file_index.call(this, similaritydata, numberofmatchesrequired, findsimilarfileindexresults, resultssize, resultsused)
  end
  def begin_dump(this : ISimilarityTraitsTable*, similaritytabledumpstate : ISimilarityTableDumpState*) : HRESULT
    @lpVtbl.value.begin_dump.call(this, similaritytabledumpstate)
  end
  def get_last_index(this : ISimilarityTraitsTable*, fileindex : UInt32*) : HRESULT
    @lpVtbl.value.get_last_index.call(this, fileindex)
  end
end
struct LibWin32::ISimilarityFileIdTable
  def query_interface(this : ISimilarityFileIdTable*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarityFileIdTable*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarityFileIdTable*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_table(this : ISimilarityFileIdTable*, path : LibC::LPWSTR, truncate : LibC::BOOL, securitydescriptor : UInt8*, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table.call(this, path, truncate, securitydescriptor, recordsize, isnew)
  end
  def create_table_indirect(this : ISimilarityFileIdTable*, fileidfile : IRdcFileWriter, truncate : LibC::BOOL, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table_indirect.call(this, fileidfile, truncate, recordsize, isnew)
  end
  def close_table(this : ISimilarityFileIdTable*, isvalid : LibC::BOOL) : HRESULT
    @lpVtbl.value.close_table.call(this, isvalid)
  end
  def append(this : ISimilarityFileIdTable*, similarityfileid : SimilarityFileId*, similarityfileindex : UInt32*) : HRESULT
    @lpVtbl.value.append.call(this, similarityfileid, similarityfileindex)
  end
  def lookup(this : ISimilarityFileIdTable*, similarityfileindex : UInt32, similarityfileid : SimilarityFileId*) : HRESULT
    @lpVtbl.value.lookup.call(this, similarityfileindex, similarityfileid)
  end
  def invalidate(this : ISimilarityFileIdTable*, similarityfileindex : UInt32) : HRESULT
    @lpVtbl.value.invalidate.call(this, similarityfileindex)
  end
  def get_record_count(this : ISimilarityFileIdTable*, recordcount : UInt32*) : HRESULT
    @lpVtbl.value.get_record_count.call(this, recordcount)
  end
end
struct LibWin32::IRdcSimilarityGenerator
  def query_interface(this : IRdcSimilarityGenerator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRdcSimilarityGenerator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRdcSimilarityGenerator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def enable_similarity(this : IRdcSimilarityGenerator*) : HRESULT
    @lpVtbl.value.enable_similarity.call(this)
  end
  def results(this : IRdcSimilarityGenerator*, similaritydata : SimilarityData*) : HRESULT
    @lpVtbl.value.results.call(this, similaritydata)
  end
end
struct LibWin32::IFindSimilarResults
  def query_interface(this : IFindSimilarResults*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFindSimilarResults*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFindSimilarResults*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_size(this : IFindSimilarResults*, size : UInt32*) : HRESULT
    @lpVtbl.value.get_size.call(this, size)
  end
  def get_next_file_id(this : IFindSimilarResults*, numtraitsmatched : UInt32*, similarityfileid : SimilarityFileId*) : HRESULT
    @lpVtbl.value.get_next_file_id.call(this, numtraitsmatched, similarityfileid)
  end
end
struct LibWin32::ISimilarity
  def query_interface(this : ISimilarity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISimilarity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISimilarity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_table(this : ISimilarity*, path : LibC::LPWSTR, truncate : LibC::BOOL, securitydescriptor : UInt8*, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table.call(this, path, truncate, securitydescriptor, recordsize, isnew)
  end
  def create_table_indirect(this : ISimilarity*, mapping : ISimilarityTraitsMapping, fileidfile : IRdcFileWriter, truncate : LibC::BOOL, recordsize : UInt32, isnew : RdcCreatedTables*) : HRESULT
    @lpVtbl.value.create_table_indirect.call(this, mapping, fileidfile, truncate, recordsize, isnew)
  end
  def close_table(this : ISimilarity*, isvalid : LibC::BOOL) : HRESULT
    @lpVtbl.value.close_table.call(this, isvalid)
  end
  def append(this : ISimilarity*, similarityfileid : SimilarityFileId*, similaritydata : SimilarityData*) : HRESULT
    @lpVtbl.value.append.call(this, similarityfileid, similaritydata)
  end
  def find_similar_file_id(this : ISimilarity*, similaritydata : SimilarityData*, numberofmatchesrequired : UInt16, resultssize : UInt32, findsimilarresults : IFindSimilarResults*) : HRESULT
    @lpVtbl.value.find_similar_file_id.call(this, similaritydata, numberofmatchesrequired, resultssize, findsimilarresults)
  end
  def copy_and_swap(this : ISimilarity*, newsimilaritytables : ISimilarity, reportprogress : ISimilarityReportProgress) : HRESULT
    @lpVtbl.value.copy_and_swap.call(this, newsimilaritytables, reportprogress)
  end
  def get_record_count(this : ISimilarity*, recordcount : UInt32*) : HRESULT
    @lpVtbl.value.get_record_count.call(this, recordcount)
  end
end
