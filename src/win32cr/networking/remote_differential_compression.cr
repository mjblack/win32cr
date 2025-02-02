require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Networking::RemoteDifferentialCompression
  extend self
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

  enum RDC_ErrorCode
    RDC_NoError = 0_i32
    RDC_HeaderVersionNewer = 1_i32
    RDC_HeaderVersionOlder = 2_i32
    RDC_HeaderMissingOrCorrupt = 3_i32
    RDC_HeaderWrongType = 4_i32
    RDC_DataMissingOrCorrupt = 5_i32
    RDC_DataTooManyRecords = 6_i32
    RDC_FileChecksumMismatch = 7_i32
    RDC_ApplicationError = 8_i32
    RDC_Aborted = 9_i32
    RDC_Win32Error = 10_i32
  end
  enum GeneratorParametersType
    RDCGENTYPE_Unused = 0_i32
    RDCGENTYPE_FilterMax = 1_i32
  end
  enum RdcNeedType
    RDCNEED_SOURCE = 0_i32
    RDCNEED_TARGET = 1_i32
    RDCNEED_SEED = 2_i32
    RDCNEED_SEED_MAX = 255_i32
  end
  enum RdcCreatedTables
    RDCTABLE_InvalidOrUnknown = 0_i32
    RDCTABLE_Existing = 1_i32
    RDCTABLE_New = 2_i32
  end
  enum RdcMappingAccessMode
    RDCMAPPING_Undefined = 0_i32
    RDCMAPPING_ReadOnly = 1_i32
    RDCMAPPING_ReadWrite = 2_i32
  end

  @[Extern]
  struct RdcNeed
    property m_BlockType : Win32cr::Networking::RemoteDifferentialCompression::RdcNeedType
    property m_FileOffset : UInt64
    property m_BlockLength : UInt64
    def initialize(@m_BlockType : Win32cr::Networking::RemoteDifferentialCompression::RdcNeedType, @m_FileOffset : UInt64, @m_BlockLength : UInt64)
    end
  end

  @[Extern]
  struct RdcBufferPointer
    property m_Size : UInt32
    property m_Used : UInt32
    property m_Data : UInt8*
    def initialize(@m_Size : UInt32, @m_Used : UInt32, @m_Data : UInt8*)
    end
  end

  @[Extern]
  struct RdcNeedPointer
    property m_Size : UInt32
    property m_Used : UInt32
    property m_Data : Win32cr::Networking::RemoteDifferentialCompression::RdcNeed*
    def initialize(@m_Size : UInt32, @m_Used : UInt32, @m_Data : Win32cr::Networking::RemoteDifferentialCompression::RdcNeed*)
    end
  end

  @[Extern]
  struct RdcSignature
    property m_Signature : UInt8[16]
    property m_BlockLength : UInt16
    def initialize(@m_Signature : UInt8[16], @m_BlockLength : UInt16)
    end
  end

  @[Extern]
  struct RdcSignaturePointer
    property m_Size : UInt32
    property m_Used : UInt32
    property m_Data : Win32cr::Networking::RemoteDifferentialCompression::RdcSignature*
    def initialize(@m_Size : UInt32, @m_Used : UInt32, @m_Data : Win32cr::Networking::RemoteDifferentialCompression::RdcSignature*)
    end
  end

  @[Extern]
  struct SimilarityMappedViewInfo
    property m_Data : UInt8*
    property m_Length : UInt32
    def initialize(@m_Data : UInt8*, @m_Length : UInt32)
    end
  end

  @[Extern]
  struct SimilarityData
    property m_Data : UInt8[16]
    def initialize(@m_Data : UInt8[16])
    end
  end

  @[Extern]
  struct FindSimilarFileIndexResults
    property m_FileIndex : UInt32
    property m_MatchCount : UInt32
    def initialize(@m_FileIndex : UInt32, @m_MatchCount : UInt32)
    end
  end

  @[Extern]
  struct SimilarityDumpData
    property m_FileIndex : UInt32
    property m_Data : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData
    def initialize(@m_FileIndex : UInt32, @m_Data : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData)
    end
  end

  @[Extern]
  struct SimilarityFileId
    property m_FileId : UInt8[32]
    def initialize(@m_FileId : UInt8[32])
    end
  end

  @[Extern]
  record IRdcGeneratorParametersVtbl,
    query_interface : Proc(IRdcGeneratorParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcGeneratorParameters*, UInt32),
    release : Proc(IRdcGeneratorParameters*, UInt32),
    get_generator_parameters_type : Proc(IRdcGeneratorParameters*, Win32cr::Networking::RemoteDifferentialCompression::GeneratorParametersType*, Win32cr::Foundation::HRESULT),
    get_parameters_version : Proc(IRdcGeneratorParameters*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_serialize_size : Proc(IRdcGeneratorParameters*, UInt32*, Win32cr::Foundation::HRESULT),
    serialize : Proc(IRdcGeneratorParameters*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcGeneratorParameters, lpVtbl : IRdcGeneratorParametersVtbl* do
    GUID = LibC::GUID.new(0x96236a71_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcGeneratorParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcGeneratorParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcGeneratorParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_generator_parameters_type(this : IRdcGeneratorParameters*, parametersType : Win32cr::Networking::RemoteDifferentialCompression::GeneratorParametersType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generator_parameters_type.call(this, parametersType)
    end
    def get_parameters_version(this : IRdcGeneratorParameters*, currentVersion : UInt32*, minimumCompatibleAppVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parameters_version.call(this, currentVersion, minimumCompatibleAppVersion)
    end
    def get_serialize_size(this : IRdcGeneratorParameters*, size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_serialize_size.call(this, size)
    end
    def serialize(this : IRdcGeneratorParameters*, size : UInt32, parametersBlob : UInt8*, bytesWritten : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, size, parametersBlob, bytesWritten)
    end

  end

  @[Extern]
  record IRdcGeneratorFilterMaxParametersVtbl,
    query_interface : Proc(IRdcGeneratorFilterMaxParameters*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcGeneratorFilterMaxParameters*, UInt32),
    release : Proc(IRdcGeneratorFilterMaxParameters*, UInt32),
    get_horizon_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32*, Win32cr::Foundation::HRESULT),
    set_horizon_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32, Win32cr::Foundation::HRESULT),
    get_hash_window_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32*, Win32cr::Foundation::HRESULT),
    set_hash_window_size : Proc(IRdcGeneratorFilterMaxParameters*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcGeneratorFilterMaxParameters, lpVtbl : IRdcGeneratorFilterMaxParametersVtbl* do
    GUID = LibC::GUID.new(0x96236a72_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcGeneratorFilterMaxParameters*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcGeneratorFilterMaxParameters*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcGeneratorFilterMaxParameters*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_horizon_size(this : IRdcGeneratorFilterMaxParameters*, horizonSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_horizon_size.call(this, horizonSize)
    end
    def set_horizon_size(this : IRdcGeneratorFilterMaxParameters*, horizonSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_horizon_size.call(this, horizonSize)
    end
    def get_hash_window_size(this : IRdcGeneratorFilterMaxParameters*, hashWindowSize : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hash_window_size.call(this, hashWindowSize)
    end
    def set_hash_window_size(this : IRdcGeneratorFilterMaxParameters*, hashWindowSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hash_window_size.call(this, hashWindowSize)
    end

  end

  @[Extern]
  record IRdcGeneratorVtbl,
    query_interface : Proc(IRdcGenerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcGenerator*, UInt32),
    release : Proc(IRdcGenerator*, UInt32),
    get_generator_parameters : Proc(IRdcGenerator*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    process : Proc(IRdcGenerator*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Win32cr::Networking::RemoteDifferentialCompression::RdcBufferPointer*, UInt32, Win32cr::Networking::RemoteDifferentialCompression::RdcBufferPointer**, Win32cr::Networking::RemoteDifferentialCompression::RDC_ErrorCode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcGenerator, lpVtbl : IRdcGeneratorVtbl* do
    GUID = LibC::GUID.new(0x96236a73_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcGenerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcGenerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcGenerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_generator_parameters(this : IRdcGenerator*, level : UInt32, iGeneratorParameters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_generator_parameters.call(this, level, iGeneratorParameters)
    end
    def process(this : IRdcGenerator*, endOfInput : Win32cr::Foundation::BOOL, endOfOutput : Win32cr::Foundation::BOOL*, inputBuffer : Win32cr::Networking::RemoteDifferentialCompression::RdcBufferPointer*, depth : UInt32, outputBuffers : Win32cr::Networking::RemoteDifferentialCompression::RdcBufferPointer**, rdc_ErrorCode : Win32cr::Networking::RemoteDifferentialCompression::RDC_ErrorCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process.call(this, endOfInput, endOfOutput, inputBuffer, depth, outputBuffers, rdc_ErrorCode)
    end

  end

  @[Extern]
  record IRdcFileReaderVtbl,
    query_interface : Proc(IRdcFileReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcFileReader*, UInt32),
    release : Proc(IRdcFileReader*, UInt32),
    get_file_size : Proc(IRdcFileReader*, UInt64*, Win32cr::Foundation::HRESULT),
    read : Proc(IRdcFileReader*, UInt64, UInt32, UInt32*, UInt8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_file_position : Proc(IRdcFileReader*, UInt64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcFileReader, lpVtbl : IRdcFileReaderVtbl* do
    GUID = LibC::GUID.new(0x96236a74_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcFileReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcFileReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcFileReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_file_size(this : IRdcFileReader*, fileSize : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, fileSize)
    end
    def read(this : IRdcFileReader*, offsetFileStart : UInt64, bytesToRead : UInt32, bytesActuallyRead : UInt32*, buffer : UInt8*, eof : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, offsetFileStart, bytesToRead, bytesActuallyRead, buffer, eof)
    end
    def get_file_position(this : IRdcFileReader*, offsetFromStart : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_position.call(this, offsetFromStart)
    end

  end

  @[Extern]
  record IRdcFileWriterVtbl,
    query_interface : Proc(IRdcFileWriter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcFileWriter*, UInt32),
    release : Proc(IRdcFileWriter*, UInt32),
    get_file_size : Proc(IRdcFileWriter*, UInt64*, Win32cr::Foundation::HRESULT),
    read : Proc(IRdcFileWriter*, UInt64, UInt32, UInt32*, UInt8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_file_position : Proc(IRdcFileWriter*, UInt64*, Win32cr::Foundation::HRESULT),
    write : Proc(IRdcFileWriter*, UInt64, UInt32, UInt8*, Win32cr::Foundation::HRESULT),
    truncate : Proc(IRdcFileWriter*, Win32cr::Foundation::HRESULT),
    delete_on_close : Proc(IRdcFileWriter*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcFileWriter, lpVtbl : IRdcFileWriterVtbl* do
    GUID = LibC::GUID.new(0x96236a75_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcFileWriter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcFileWriter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcFileWriter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_file_size(this : IRdcFileWriter*, fileSize : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, fileSize)
    end
    def read(this : IRdcFileWriter*, offsetFileStart : UInt64, bytesToRead : UInt32, bytesActuallyRead : UInt32*, buffer : UInt8*, eof : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read.call(this, offsetFileStart, bytesToRead, bytesActuallyRead, buffer, eof)
    end
    def get_file_position(this : IRdcFileWriter*, offsetFromStart : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_position.call(this, offsetFromStart)
    end
    def write(this : IRdcFileWriter*, offsetFileStart : UInt64, bytesToWrite : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write.call(this, offsetFileStart, bytesToWrite, buffer)
    end
    def truncate(this : IRdcFileWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.truncate.call(this)
    end
    def delete_on_close(this : IRdcFileWriter*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_on_close.call(this)
    end

  end

  @[Extern]
  record IRdcSignatureReaderVtbl,
    query_interface : Proc(IRdcSignatureReader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcSignatureReader*, UInt32),
    release : Proc(IRdcSignatureReader*, UInt32),
    read_header : Proc(IRdcSignatureReader*, Win32cr::Networking::RemoteDifferentialCompression::RDC_ErrorCode*, Win32cr::Foundation::HRESULT),
    read_signatures : Proc(IRdcSignatureReader*, Win32cr::Networking::RemoteDifferentialCompression::RdcSignaturePointer*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcSignatureReader, lpVtbl : IRdcSignatureReaderVtbl* do
    GUID = LibC::GUID.new(0x96236a76_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcSignatureReader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcSignatureReader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcSignatureReader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read_header(this : IRdcSignatureReader*, rdc_ErrorCode : Win32cr::Networking::RemoteDifferentialCompression::RDC_ErrorCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_header.call(this, rdc_ErrorCode)
    end
    def read_signatures(this : IRdcSignatureReader*, rdcSignaturePointer : Win32cr::Networking::RemoteDifferentialCompression::RdcSignaturePointer*, endOfOutput : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_signatures.call(this, rdcSignaturePointer, endOfOutput)
    end

  end

  @[Extern]
  record IRdcComparatorVtbl,
    query_interface : Proc(IRdcComparator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcComparator*, UInt32),
    release : Proc(IRdcComparator*, UInt32),
    process : Proc(IRdcComparator*, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL*, Win32cr::Networking::RemoteDifferentialCompression::RdcBufferPointer*, Win32cr::Networking::RemoteDifferentialCompression::RdcNeedPointer*, Win32cr::Networking::RemoteDifferentialCompression::RDC_ErrorCode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcComparator, lpVtbl : IRdcComparatorVtbl* do
    GUID = LibC::GUID.new(0x96236a77_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcComparator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcComparator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcComparator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def process(this : IRdcComparator*, endOfInput : Win32cr::Foundation::BOOL, endOfOutput : Win32cr::Foundation::BOOL*, inputBuffer : Win32cr::Networking::RemoteDifferentialCompression::RdcBufferPointer*, outputBuffer : Win32cr::Networking::RemoteDifferentialCompression::RdcNeedPointer*, rdc_ErrorCode : Win32cr::Networking::RemoteDifferentialCompression::RDC_ErrorCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process.call(this, endOfInput, endOfOutput, inputBuffer, outputBuffer, rdc_ErrorCode)
    end

  end

  @[Extern]
  record IRdcLibraryVtbl,
    query_interface : Proc(IRdcLibrary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcLibrary*, UInt32),
    release : Proc(IRdcLibrary*, UInt32),
    compute_default_recursion_depth : Proc(IRdcLibrary*, UInt64, UInt32*, Win32cr::Foundation::HRESULT),
    create_generator_parameters : Proc(IRdcLibrary*, Win32cr::Networking::RemoteDifferentialCompression::GeneratorParametersType, UInt32, Void**, Win32cr::Foundation::HRESULT),
    open_generator_parameters : Proc(IRdcLibrary*, UInt32, UInt8*, Void**, Win32cr::Foundation::HRESULT),
    create_generator : Proc(IRdcLibrary*, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT),
    create_comparator : Proc(IRdcLibrary*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_signature_reader : Proc(IRdcLibrary*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_rdc_version : Proc(IRdcLibrary*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcLibrary, lpVtbl : IRdcLibraryVtbl* do
    GUID = LibC::GUID.new(0x96236a78_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcLibrary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcLibrary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcLibrary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compute_default_recursion_depth(this : IRdcLibrary*, fileSize : UInt64, depth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compute_default_recursion_depth.call(this, fileSize, depth)
    end
    def create_generator_parameters(this : IRdcLibrary*, parametersType : Win32cr::Networking::RemoteDifferentialCompression::GeneratorParametersType, level : UInt32, iGeneratorParameters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_generator_parameters.call(this, parametersType, level, iGeneratorParameters)
    end
    def open_generator_parameters(this : IRdcLibrary*, size : UInt32, parametersBlob : UInt8*, iGeneratorParameters : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_generator_parameters.call(this, size, parametersBlob, iGeneratorParameters)
    end
    def create_generator(this : IRdcLibrary*, depth : UInt32, iGeneratorParametersArray : Void**, iGenerator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_generator.call(this, depth, iGeneratorParametersArray, iGenerator)
    end
    def create_comparator(this : IRdcLibrary*, iSeedSignaturesFile : Void*, comparatorBufferSize : UInt32, iComparator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_comparator.call(this, iSeedSignaturesFile, comparatorBufferSize, iComparator)
    end
    def create_signature_reader(this : IRdcLibrary*, iFileReader : Void*, iSignatureReader : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_signature_reader.call(this, iFileReader, iSignatureReader)
    end
    def get_rdc_version(this : IRdcLibrary*, currentVersion : UInt32*, minimumCompatibleAppVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rdc_version.call(this, currentVersion, minimumCompatibleAppVersion)
    end

  end

  @[Extern]
  record ISimilarityReportProgressVtbl,
    query_interface : Proc(ISimilarityReportProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarityReportProgress*, UInt32),
    release : Proc(ISimilarityReportProgress*, UInt32),
    report_progress : Proc(ISimilarityReportProgress*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimilarityReportProgress, lpVtbl : ISimilarityReportProgressVtbl* do
    GUID = LibC::GUID.new(0x96236a7a_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarityReportProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarityReportProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarityReportProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def report_progress(this : ISimilarityReportProgress*, percentCompleted : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_progress.call(this, percentCompleted)
    end

  end

  @[Extern]
  record ISimilarityTableDumpStateVtbl,
    query_interface : Proc(ISimilarityTableDumpState*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarityTableDumpState*, UInt32),
    release : Proc(ISimilarityTableDumpState*, UInt32),
    get_next_data : Proc(ISimilarityTableDumpState*, UInt32, UInt32*, Win32cr::Foundation::BOOL*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityDumpData*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimilarityTableDumpState, lpVtbl : ISimilarityTableDumpStateVtbl* do
    GUID = LibC::GUID.new(0x96236a7b_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarityTableDumpState*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarityTableDumpState*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarityTableDumpState*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_next_data(this : ISimilarityTableDumpState*, resultsSize : UInt32, resultsUsed : UInt32*, eof : Win32cr::Foundation::BOOL*, results : Win32cr::Networking::RemoteDifferentialCompression::SimilarityDumpData*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_data.call(this, resultsSize, resultsUsed, eof, results)
    end

  end

  @[Extern]
  record ISimilarityTraitsMappedViewVtbl,
    query_interface : Proc(ISimilarityTraitsMappedView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarityTraitsMappedView*, UInt32),
    release : Proc(ISimilarityTraitsMappedView*, UInt32),
    flush : Proc(ISimilarityTraitsMappedView*, Win32cr::Foundation::HRESULT),
    unmap : Proc(ISimilarityTraitsMappedView*, Win32cr::Foundation::HRESULT),
    get : Proc(ISimilarityTraitsMappedView*, UInt64, Win32cr::Foundation::BOOL, UInt32, Win32cr::Networking::RemoteDifferentialCompression::SimilarityMappedViewInfo*, Win32cr::Foundation::HRESULT),
    get_view : Proc(ISimilarityTraitsMappedView*, UInt8**, UInt8**, Void)


  @[Extern]
  record ISimilarityTraitsMappedView, lpVtbl : ISimilarityTraitsMappedViewVtbl* do
    GUID = LibC::GUID.new(0x96236a7c_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarityTraitsMappedView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarityTraitsMappedView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarityTraitsMappedView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def flush(this : ISimilarityTraitsMappedView*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def unmap(this : ISimilarityTraitsMappedView*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unmap.call(this)
    end
    def get(this : ISimilarityTraitsMappedView*, index : UInt64, dirty : Win32cr::Foundation::BOOL, numElements : UInt32, viewInfo : Win32cr::Networking::RemoteDifferentialCompression::SimilarityMappedViewInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, index, dirty, numElements, viewInfo)
    end
    def get_view(this : ISimilarityTraitsMappedView*, mappedPageBegin : UInt8**, mappedPageEnd : UInt8**) : Void
      @lpVtbl.try &.value.get_view.call(this, mappedPageBegin, mappedPageEnd)
    end

  end

  @[Extern]
  record ISimilarityTraitsMappingVtbl,
    query_interface : Proc(ISimilarityTraitsMapping*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarityTraitsMapping*, UInt32),
    release : Proc(ISimilarityTraitsMapping*, UInt32),
    close_mapping : Proc(ISimilarityTraitsMapping*, Void),
    set_file_size : Proc(ISimilarityTraitsMapping*, UInt64, Win32cr::Foundation::HRESULT),
    get_file_size : Proc(ISimilarityTraitsMapping*, UInt64*, Win32cr::Foundation::HRESULT),
    open_mapping : Proc(ISimilarityTraitsMapping*, Win32cr::Networking::RemoteDifferentialCompression::RdcMappingAccessMode, UInt64, UInt64, UInt64*, Win32cr::Foundation::HRESULT),
    resize_mapping : Proc(ISimilarityTraitsMapping*, Win32cr::Networking::RemoteDifferentialCompression::RdcMappingAccessMode, UInt64, UInt64, UInt64*, Win32cr::Foundation::HRESULT),
    get_page_size : Proc(ISimilarityTraitsMapping*, UInt32*, Void),
    create_view : Proc(ISimilarityTraitsMapping*, UInt32, Win32cr::Networking::RemoteDifferentialCompression::RdcMappingAccessMode, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimilarityTraitsMapping, lpVtbl : ISimilarityTraitsMappingVtbl* do
    GUID = LibC::GUID.new(0x96236a7d_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarityTraitsMapping*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarityTraitsMapping*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarityTraitsMapping*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def close_mapping(this : ISimilarityTraitsMapping*) : Void
      @lpVtbl.try &.value.close_mapping.call(this)
    end
    def set_file_size(this : ISimilarityTraitsMapping*, fileSize : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_size.call(this, fileSize)
    end
    def get_file_size(this : ISimilarityTraitsMapping*, fileSize : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_size.call(this, fileSize)
    end
    def open_mapping(this : ISimilarityTraitsMapping*, accessMode : Win32cr::Networking::RemoteDifferentialCompression::RdcMappingAccessMode, begin__ : UInt64, end__ : UInt64, actualEnd : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_mapping.call(this, accessMode, begin__, end__, actualEnd)
    end
    def resize_mapping(this : ISimilarityTraitsMapping*, accessMode : Win32cr::Networking::RemoteDifferentialCompression::RdcMappingAccessMode, begin__ : UInt64, end__ : UInt64, actualEnd : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize_mapping.call(this, accessMode, begin__, end__, actualEnd)
    end
    def get_page_size(this : ISimilarityTraitsMapping*, pageSize : UInt32*) : Void
      @lpVtbl.try &.value.get_page_size.call(this, pageSize)
    end
    def create_view(this : ISimilarityTraitsMapping*, minimumMappedPages : UInt32, accessMode : Win32cr::Networking::RemoteDifferentialCompression::RdcMappingAccessMode, mappedView : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_view.call(this, minimumMappedPages, accessMode, mappedView)
    end

  end

  @[Extern]
  record ISimilarityTraitsTableVtbl,
    query_interface : Proc(ISimilarityTraitsTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarityTraitsTable*, UInt32),
    release : Proc(ISimilarityTraitsTable*, UInt32),
    create_table : Proc(ISimilarityTraitsTable*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt8*, Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*, Win32cr::Foundation::HRESULT),
    create_table_indirect : Proc(ISimilarityTraitsTable*, Void*, Win32cr::Foundation::BOOL, Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*, Win32cr::Foundation::HRESULT),
    close_table : Proc(ISimilarityTraitsTable*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    append : Proc(ISimilarityTraitsTable*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, UInt32, Win32cr::Foundation::HRESULT),
    find_similar_file_index : Proc(ISimilarityTraitsTable*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, UInt16, Win32cr::Networking::RemoteDifferentialCompression::FindSimilarFileIndexResults*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    begin_dump : Proc(ISimilarityTraitsTable*, Void**, Win32cr::Foundation::HRESULT),
    get_last_index : Proc(ISimilarityTraitsTable*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimilarityTraitsTable, lpVtbl : ISimilarityTraitsTableVtbl* do
    GUID = LibC::GUID.new(0x96236a7e_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarityTraitsTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarityTraitsTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarityTraitsTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_table(this : ISimilarityTraitsTable*, path : Win32cr::Foundation::PWSTR, truncate : Win32cr::Foundation::BOOL, securityDescriptor : UInt8*, isNew : Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table.call(this, path, truncate, securityDescriptor, isNew)
    end
    def create_table_indirect(this : ISimilarityTraitsTable*, mapping : Void*, truncate : Win32cr::Foundation::BOOL, isNew : Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table_indirect.call(this, mapping, truncate, isNew)
    end
    def close_table(this : ISimilarityTraitsTable*, isValid : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_table.call(this, isValid)
    end
    def append(this : ISimilarityTraitsTable*, data : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, fileIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, data, fileIndex)
    end
    def find_similar_file_index(this : ISimilarityTraitsTable*, similarityData : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, numberOfMatchesRequired : UInt16, findSimilarFileIndexResults : Win32cr::Networking::RemoteDifferentialCompression::FindSimilarFileIndexResults*, resultsSize : UInt32, resultsUsed : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_similar_file_index.call(this, similarityData, numberOfMatchesRequired, findSimilarFileIndexResults, resultsSize, resultsUsed)
    end
    def begin_dump(this : ISimilarityTraitsTable*, similarityTableDumpState : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_dump.call(this, similarityTableDumpState)
    end
    def get_last_index(this : ISimilarityTraitsTable*, fileIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_index.call(this, fileIndex)
    end

  end

  @[Extern]
  record ISimilarityFileIdTableVtbl,
    query_interface : Proc(ISimilarityFileIdTable*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarityFileIdTable*, UInt32),
    release : Proc(ISimilarityFileIdTable*, UInt32),
    create_table : Proc(ISimilarityFileIdTable*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*, Win32cr::Foundation::HRESULT),
    create_table_indirect : Proc(ISimilarityFileIdTable*, Void*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*, Win32cr::Foundation::HRESULT),
    close_table : Proc(ISimilarityFileIdTable*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    append : Proc(ISimilarityFileIdTable*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup : Proc(ISimilarityFileIdTable*, UInt32, Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*, Win32cr::Foundation::HRESULT),
    invalidate : Proc(ISimilarityFileIdTable*, UInt32, Win32cr::Foundation::HRESULT),
    get_record_count : Proc(ISimilarityFileIdTable*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimilarityFileIdTable, lpVtbl : ISimilarityFileIdTableVtbl* do
    GUID = LibC::GUID.new(0x96236a7f_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarityFileIdTable*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarityFileIdTable*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarityFileIdTable*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_table(this : ISimilarityFileIdTable*, path : Win32cr::Foundation::PWSTR, truncate : Win32cr::Foundation::BOOL, securityDescriptor : UInt8*, recordSize : UInt32, isNew : Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table.call(this, path, truncate, securityDescriptor, recordSize, isNew)
    end
    def create_table_indirect(this : ISimilarityFileIdTable*, fileIdFile : Void*, truncate : Win32cr::Foundation::BOOL, recordSize : UInt32, isNew : Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table_indirect.call(this, fileIdFile, truncate, recordSize, isNew)
    end
    def close_table(this : ISimilarityFileIdTable*, isValid : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_table.call(this, isValid)
    end
    def append(this : ISimilarityFileIdTable*, similarityFileId : Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*, similarityFileIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, similarityFileId, similarityFileIndex)
    end
    def lookup(this : ISimilarityFileIdTable*, similarityFileIndex : UInt32, similarityFileId : Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup.call(this, similarityFileIndex, similarityFileId)
    end
    def invalidate(this : ISimilarityFileIdTable*, similarityFileIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invalidate.call(this, similarityFileIndex)
    end
    def get_record_count(this : ISimilarityFileIdTable*, recordCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_record_count.call(this, recordCount)
    end

  end

  @[Extern]
  record IRdcSimilarityGeneratorVtbl,
    query_interface : Proc(IRdcSimilarityGenerator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRdcSimilarityGenerator*, UInt32),
    release : Proc(IRdcSimilarityGenerator*, UInt32),
    enable_similarity : Proc(IRdcSimilarityGenerator*, Win32cr::Foundation::HRESULT),
    results : Proc(IRdcSimilarityGenerator*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRdcSimilarityGenerator, lpVtbl : IRdcSimilarityGeneratorVtbl* do
    GUID = LibC::GUID.new(0x96236a80_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IRdcSimilarityGenerator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRdcSimilarityGenerator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRdcSimilarityGenerator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_similarity(this : IRdcSimilarityGenerator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_similarity.call(this)
    end
    def results(this : IRdcSimilarityGenerator*, similarityData : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.results.call(this, similarityData)
    end

  end

  @[Extern]
  record IFindSimilarResultsVtbl,
    query_interface : Proc(IFindSimilarResults*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFindSimilarResults*, UInt32),
    release : Proc(IFindSimilarResults*, UInt32),
    get_size : Proc(IFindSimilarResults*, UInt32*, Win32cr::Foundation::HRESULT),
    get_next_file_id : Proc(IFindSimilarResults*, UInt32*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IFindSimilarResults, lpVtbl : IFindSimilarResultsVtbl* do
    GUID = LibC::GUID.new(0x96236a81_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : IFindSimilarResults*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFindSimilarResults*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFindSimilarResults*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_size(this : IFindSimilarResults*, size : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_size.call(this, size)
    end
    def get_next_file_id(this : IFindSimilarResults*, numTraitsMatched : UInt32*, similarityFileId : Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_file_id.call(this, numTraitsMatched, similarityFileId)
    end

  end

  @[Extern]
  record ISimilarityVtbl,
    query_interface : Proc(ISimilarity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISimilarity*, UInt32),
    release : Proc(ISimilarity*, UInt32),
    create_table : Proc(ISimilarity*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, UInt8*, UInt32, Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*, Win32cr::Foundation::HRESULT),
    create_table_indirect : Proc(ISimilarity*, Void*, Void*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*, Win32cr::Foundation::HRESULT),
    close_table : Proc(ISimilarity*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    append : Proc(ISimilarity*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, Win32cr::Foundation::HRESULT),
    find_similar_file_id : Proc(ISimilarity*, Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, UInt16, UInt32, Void**, Win32cr::Foundation::HRESULT),
    copy_and_swap : Proc(ISimilarity*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_record_count : Proc(ISimilarity*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISimilarity, lpVtbl : ISimilarityVtbl* do
    GUID = LibC::GUID.new(0x96236a83_u32, 0x9dbc_u16, 0x11da_u16, StaticArray[0x9e_u8, 0x3f_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x4a_u8, 0xe3_u8, 0x11_u8])
    def query_interface(this : ISimilarity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISimilarity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISimilarity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_table(this : ISimilarity*, path : Win32cr::Foundation::PWSTR, truncate : Win32cr::Foundation::BOOL, securityDescriptor : UInt8*, recordSize : UInt32, isNew : Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table.call(this, path, truncate, securityDescriptor, recordSize, isNew)
    end
    def create_table_indirect(this : ISimilarity*, mapping : Void*, fileIdFile : Void*, truncate : Win32cr::Foundation::BOOL, recordSize : UInt32, isNew : Win32cr::Networking::RemoteDifferentialCompression::RdcCreatedTables*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table_indirect.call(this, mapping, fileIdFile, truncate, recordSize, isNew)
    end
    def close_table(this : ISimilarity*, isValid : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close_table.call(this, isValid)
    end
    def append(this : ISimilarity*, similarityFileId : Win32cr::Networking::RemoteDifferentialCompression::SimilarityFileId*, similarityData : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.append.call(this, similarityFileId, similarityData)
    end
    def find_similar_file_id(this : ISimilarity*, similarityData : Win32cr::Networking::RemoteDifferentialCompression::SimilarityData*, numberOfMatchesRequired : UInt16, resultsSize : UInt32, findSimilarResults : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_similar_file_id.call(this, similarityData, numberOfMatchesRequired, resultsSize, findSimilarResults)
    end
    def copy_and_swap(this : ISimilarity*, newSimilarityTables : Void*, reportProgress : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_and_swap.call(this, newSimilarityTables, reportProgress)
    end
    def get_record_count(this : ISimilarity*, recordCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_record_count.call(this, recordCount)
    end

  end

end