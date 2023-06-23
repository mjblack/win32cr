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
  DEDUP_CHUNKLIB_MAX_CHUNKS_ENUM = 1024_u32
  CLSID_DedupBackupSupport = LibC::GUID.new(0x73d6b2ad_u32, 0x2984_u16, 0x4715_u16, StaticArray[0xb2_u8, 0xe3_u8, 0x92_u8, 0x4c_u8, 0x14_u8, 0x97_u8, 0x44_u8, 0xdd_u8])
  CLSID_DedupDataPort = LibC::GUID.new(0x8f107207_u32, 0x1829_u16, 0x48b2_u16, StaticArray[0xa6_u8, 0x4b_u8, 0xe6_u8, 0x1f_u8, 0x8e_u8, 0xd_u8, 0x9a_u8, 0xcb_u8])


  enum DEDUP_BACKUP_SUPPORT_PARAM_TYPE : Int32
    DEDUP_RECONSTRUCT_UNOPTIMIZED = 1
    DEDUP_RECONSTRUCT_OPTIMIZED = 2
  end

  enum DEDUP_SET_PARAM_TYPE : Int32
    DEDUP_PT_MinChunkSizeBytes = 1
    DEDUP_PT_MaxChunkSizeBytes = 2
    DEDUP_PT_AvgChunkSizeBytes = 3
    DEDUP_PT_InvariantChunking = 4
    DEDUP_PT_DisableStrongHashComputation = 5
  end

  enum DedupDataPortManagerOption : Int32
    DedupDataPortManagerOption_None = 0
    DedupDataPortManagerOption_AutoStart = 1
    DedupDataPortManagerOption_SkipReconciliation = 2
  end

  enum DedupDataPortVolumeStatus : Int32
    DedupDataPortVolumeStatus_Unknown = 0
    DedupDataPortVolumeStatus_NotEnabled = 1
    DedupDataPortVolumeStatus_NotAvailable = 2
    DedupDataPortVolumeStatus_Initializing = 3
    DedupDataPortVolumeStatus_Ready = 4
    DedupDataPortVolumeStatus_Maintenance = 5
    DedupDataPortVolumeStatus_Shutdown = 6
  end

  enum DedupDataPortRequestStatus : Int32
    DedupDataPortRequestStatus_Unknown = 0
    DedupDataPortRequestStatus_Queued = 1
    DedupDataPortRequestStatus_Processing = 2
    DedupDataPortRequestStatus_Partial = 3
    DedupDataPortRequestStatus_Complete = 4
    DedupDataPortRequestStatus_Failed = 5
  end

  enum DedupChunkFlags : Int32
    DedupChunkFlags_None = 0
    DedupChunkFlags_Compressed = 1
  end

  enum DedupChunkingAlgorithm : Int32
    DedupChunkingAlgorithm_Unknonwn = 0
    DedupChunkingAlgorithm_V1 = 1
  end

  enum DedupHashingAlgorithm : Int32
    DedupHashingAlgorithm_Unknonwn = 0
    DedupHashingAlgorithm_V1 = 1
  end

  enum DedupCompressionAlgorithm : Int32
    DedupCompressionAlgorithm_Unknonwn = 0
    DedupCompressionAlgorithm_Xpress = 1
  end

  struct DEDUP_CONTAINER_EXTENT
    container_index : UInt32
    start_offset : Int64
    length : Int64
  end
  struct DDP_FILE_EXTENT
    length : Int64
    offset : Int64
  end
  struct DEDUP_CHUNK_INFO_HASH32
    chunk_flags : UInt32
    chunk_offset_in_stream : UInt64
    chunk_size : UInt64
    hash_val : UInt8[32]*
  end
  struct DedupHash
    hash : UInt8[32]*
  end
  struct DedupChunk
    hash : DedupHash
    flags : DedupChunkFlags
    logical_size : UInt32
    data_size : UInt32
  end
  struct DedupStreamEntry
    hash : DedupHash
    logical_size : UInt32
    offset : UInt64
  end
  struct DedupStream
    path : UInt8*
    offset : UInt64
    length : UInt64
    chunk_count : UInt32
  end


  struct IDedupReadFileCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    read_backup_file : UInt64
    order_containers_restore : UInt64
    preview_container_read : UInt64
  end

  IDedupReadFileCallback_GUID = "7bacc67a-2f1d-42d0-897e-6ff62dd533bb"
  IID_IDedupReadFileCallback = LibC::GUID.new(0x7bacc67a_u32, 0x2f1d_u16, 0x42d0_u16, StaticArray[0x89_u8, 0x7e_u8, 0x6f_u8, 0xf6_u8, 0x2d_u8, 0xd5_u8, 0x33_u8, 0xbb_u8])
  struct IDedupReadFileCallback
    lpVtbl : IDedupReadFileCallbackVTbl*
  end

  struct IDedupBackupSupportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    restore_files : UInt64
  end

  IDedupBackupSupport_GUID = "c719d963-2b2d-415e-acf7-7eb7ca596ff4"
  IID_IDedupBackupSupport = LibC::GUID.new(0xc719d963_u32, 0x2b2d_u16, 0x415e_u16, StaticArray[0xac_u8, 0xf7_u8, 0x7e_u8, 0xb7_u8, 0xca_u8, 0x59_u8, 0x6f_u8, 0xf4_u8])
  struct IDedupBackupSupport
    lpVtbl : IDedupBackupSupportVTbl*
  end

  struct IDedupChunkLibraryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize_for_push_buffers : UInt64
    uninitialize : UInt64
    set_parameter : UInt64
    start_chunking : UInt64
  end

  IDedupChunkLibrary_GUID = "bb5144d7-2720-4dcc-8777-78597416ec23"
  IID_IDedupChunkLibrary = LibC::GUID.new(0xbb5144d7_u32, 0x2720_u16, 0x4dcc_u16, StaticArray[0x87_u8, 0x77_u8, 0x78_u8, 0x59_u8, 0x74_u8, 0x16_u8, 0xec_u8, 0x23_u8])
  struct IDedupChunkLibrary
    lpVtbl : IDedupChunkLibraryVTbl*
  end

  struct IDedupIterateChunksHash32VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    push_buffer : UInt64
    next : UInt64
    drain : UInt64
    reset : UInt64
  end

  IDedupIterateChunksHash32_GUID = "90b584d3-72aa-400f-9767-cad866a5a2d8"
  IID_IDedupIterateChunksHash32 = LibC::GUID.new(0x90b584d3_u32, 0x72aa_u16, 0x400f_u16, StaticArray[0x97_u8, 0x67_u8, 0xca_u8, 0xd8_u8, 0x66_u8, 0xa5_u8, 0xa2_u8, 0xd8_u8])
  struct IDedupIterateChunksHash32
    lpVtbl : IDedupIterateChunksHash32VTbl*
  end

  struct IDedupDataPortVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_status : UInt64
    lookup_chunks : UInt64
    insert_chunks : UInt64
    insert_chunks_with_stream : UInt64
    commit_streams : UInt64
    commit_streams_with_stream : UInt64
    get_streams : UInt64
    get_streams_results : UInt64
    get_chunks : UInt64
    get_chunks_results : UInt64
    get_request_status : UInt64
    get_request_results : UInt64
  end

  IDedupDataPort_GUID = "7963d734-40a9-4ea3-bbf6-5a89d26f7ae8"
  IID_IDedupDataPort = LibC::GUID.new(0x7963d734_u32, 0x40a9_u16, 0x4ea3_u16, StaticArray[0xbb_u8, 0xf6_u8, 0x5a_u8, 0x89_u8, 0xd2_u8, 0x6f_u8, 0x7a_u8, 0xe8_u8])
  struct IDedupDataPort
    lpVtbl : IDedupDataPortVTbl*
  end

  struct IDedupDataPortManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_configuration : UInt64
    get_volume_status : UInt64
    get_volume_data_port : UInt64
  end

  IDedupDataPortManager_GUID = "44677452-b90a-445e-8192-cdcfe81511fb"
  IID_IDedupDataPortManager = LibC::GUID.new(0x44677452_u32, 0xb90a_u16, 0x445e_u16, StaticArray[0x81_u8, 0x92_u8, 0xcd_u8, 0xcf_u8, 0xe8_u8, 0x15_u8, 0x11_u8, 0xfb_u8])
  struct IDedupDataPortManager
    lpVtbl : IDedupDataPortManagerVTbl*
  end

end
struct LibWin32::IDedupReadFileCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def read_backup_file(filefullpath : UInt8*, fileoffset : Int64, sizetoread : UInt32, filebuffer : UInt8*, returnedsize : UInt32*, flags : UInt32) : HRESULT
    @lpVtbl.value.read_backup_file.unsafe_as(Proc(UInt8*, Int64, UInt32, UInt8*, UInt32*, UInt32, HRESULT)).call(filefullpath, fileoffset, sizetoread, filebuffer, returnedsize, flags)
  end
  def order_containers_restore(numberofcontainers : UInt32, containerpaths : UInt8**, readplanentries : UInt32*, readplan : DEDUP_CONTAINER_EXTENT**) : HRESULT
    @lpVtbl.value.order_containers_restore.unsafe_as(Proc(UInt32, UInt8**, UInt32*, DEDUP_CONTAINER_EXTENT**, HRESULT)).call(numberofcontainers, containerpaths, readplanentries, readplan)
  end
  def preview_container_read(filefullpath : UInt8*, numberofreads : UInt32, readoffsets : DDP_FILE_EXTENT*) : HRESULT
    @lpVtbl.value.preview_container_read.unsafe_as(Proc(UInt8*, UInt32, DDP_FILE_EXTENT*, HRESULT)).call(filefullpath, numberofreads, readoffsets)
  end
end
struct LibWin32::IDedupBackupSupport
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def restore_files(numberoffiles : UInt32, filefullpaths : UInt8**, store : IDedupReadFileCallback, flags : UInt32, fileresults : HRESULT*) : HRESULT
    @lpVtbl.value.restore_files.unsafe_as(Proc(UInt32, UInt8**, IDedupReadFileCallback, UInt32, HRESULT*, HRESULT)).call(numberoffiles, filefullpaths, store, flags, fileresults)
  end
end
struct LibWin32::IDedupChunkLibrary
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize_for_push_buffers : HRESULT
    @lpVtbl.value.initialize_for_push_buffers.unsafe_as(Proc(HRESULT)).call
  end
  def uninitialize : HRESULT
    @lpVtbl.value.uninitialize.unsafe_as(Proc(HRESULT)).call
  end
  def set_parameter(dwparamtype : UInt32, vparamvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_parameter.unsafe_as(Proc(UInt32, VARIANT, HRESULT)).call(dwparamtype, vparamvalue)
  end
  def start_chunking(iiditeratorinterfaceid : Guid, ppchunksenum : IUnknown*) : HRESULT
    @lpVtbl.value.start_chunking.unsafe_as(Proc(Guid, IUnknown*, HRESULT)).call(iiditeratorinterfaceid, ppchunksenum)
  end
end
struct LibWin32::IDedupIterateChunksHash32
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def push_buffer(pbuffer : UInt8*, ulbufferlength : UInt32) : HRESULT
    @lpVtbl.value.push_buffer.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(pbuffer, ulbufferlength)
  end
  def next(ulmaxchunks : UInt32, parrchunks : DEDUP_CHUNK_INFO_HASH32*, pulfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, DEDUP_CHUNK_INFO_HASH32*, UInt32*, HRESULT)).call(ulmaxchunks, parrchunks, pulfetched)
  end
  def drain : HRESULT
    @lpVtbl.value.drain.unsafe_as(Proc(HRESULT)).call
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDedupDataPort
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_status(pstatus : DedupDataPortVolumeStatus*, pdataheadroommb : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(DedupDataPortVolumeStatus*, UInt32*, HRESULT)).call(pstatus, pdataheadroommb)
  end
  def lookup_chunks(count : UInt32, phashes : DedupHash*, prequestid : Guid*) : HRESULT
    @lpVtbl.value.lookup_chunks.unsafe_as(Proc(UInt32, DedupHash*, Guid*, HRESULT)).call(count, phashes, prequestid)
  end
  def insert_chunks(chunkcount : UInt32, pchunkmetadata : DedupChunk*, databytecount : UInt32, pchunkdata : UInt8*, prequestid : Guid*) : HRESULT
    @lpVtbl.value.insert_chunks.unsafe_as(Proc(UInt32, DedupChunk*, UInt32, UInt8*, Guid*, HRESULT)).call(chunkcount, pchunkmetadata, databytecount, pchunkdata, prequestid)
  end
  def insert_chunks_with_stream(chunkcount : UInt32, pchunkmetadata : DedupChunk*, databytecount : UInt32, pchunkdatastream : IStream, prequestid : Guid*) : HRESULT
    @lpVtbl.value.insert_chunks_with_stream.unsafe_as(Proc(UInt32, DedupChunk*, UInt32, IStream, Guid*, HRESULT)).call(chunkcount, pchunkmetadata, databytecount, pchunkdatastream, prequestid)
  end
  def commit_streams(streamcount : UInt32, pstreams : DedupStream*, entrycount : UInt32, pentries : DedupStreamEntry*, prequestid : Guid*) : HRESULT
    @lpVtbl.value.commit_streams.unsafe_as(Proc(UInt32, DedupStream*, UInt32, DedupStreamEntry*, Guid*, HRESULT)).call(streamcount, pstreams, entrycount, pentries, prequestid)
  end
  def commit_streams_with_stream(streamcount : UInt32, pstreams : DedupStream*, entrycount : UInt32, pentriesstream : IStream, prequestid : Guid*) : HRESULT
    @lpVtbl.value.commit_streams_with_stream.unsafe_as(Proc(UInt32, DedupStream*, UInt32, IStream, Guid*, HRESULT)).call(streamcount, pstreams, entrycount, pentriesstream, prequestid)
  end
  def get_streams(streamcount : UInt32, pstreampaths : UInt8**, prequestid : Guid*) : HRESULT
    @lpVtbl.value.get_streams.unsafe_as(Proc(UInt32, UInt8**, Guid*, HRESULT)).call(streamcount, pstreampaths, prequestid)
  end
  def get_streams_results(requestid : Guid, maxwaitms : UInt32, streamentryindex : UInt32, pstreamcount : UInt32*, ppstreams : DedupStream**, pentrycount : UInt32*, ppentries : DedupStreamEntry**, pstatus : DedupDataPortRequestStatus*, ppitemresults : HRESULT**) : HRESULT
    @lpVtbl.value.get_streams_results.unsafe_as(Proc(Guid, UInt32, UInt32, UInt32*, DedupStream**, UInt32*, DedupStreamEntry**, DedupDataPortRequestStatus*, HRESULT**, HRESULT)).call(requestid, maxwaitms, streamentryindex, pstreamcount, ppstreams, pentrycount, ppentries, pstatus, ppitemresults)
  end
  def get_chunks(count : UInt32, phashes : DedupHash*, prequestid : Guid*) : HRESULT
    @lpVtbl.value.get_chunks.unsafe_as(Proc(UInt32, DedupHash*, Guid*, HRESULT)).call(count, phashes, prequestid)
  end
  def get_chunks_results(requestid : Guid, maxwaitms : UInt32, chunkindex : UInt32, pchunkcount : UInt32*, ppchunkmetadata : DedupChunk**, pdatabytecount : UInt32*, ppchunkdata : UInt8**, pstatus : DedupDataPortRequestStatus*, ppitemresults : HRESULT**) : HRESULT
    @lpVtbl.value.get_chunks_results.unsafe_as(Proc(Guid, UInt32, UInt32, UInt32*, DedupChunk**, UInt32*, UInt8**, DedupDataPortRequestStatus*, HRESULT**, HRESULT)).call(requestid, maxwaitms, chunkindex, pchunkcount, ppchunkmetadata, pdatabytecount, ppchunkdata, pstatus, ppitemresults)
  end
  def get_request_status(requestid : Guid, pstatus : DedupDataPortRequestStatus*) : HRESULT
    @lpVtbl.value.get_request_status.unsafe_as(Proc(Guid, DedupDataPortRequestStatus*, HRESULT)).call(requestid, pstatus)
  end
  def get_request_results(requestid : Guid, maxwaitms : UInt32, pbatchresult : HRESULT*, pbatchcount : UInt32*, pstatus : DedupDataPortRequestStatus*, ppitemresults : HRESULT**) : HRESULT
    @lpVtbl.value.get_request_results.unsafe_as(Proc(Guid, UInt32, HRESULT*, UInt32*, DedupDataPortRequestStatus*, HRESULT**, HRESULT)).call(requestid, maxwaitms, pbatchresult, pbatchcount, pstatus, ppitemresults)
  end
end
struct LibWin32::IDedupDataPortManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_configuration(pminchunksize : UInt32*, pmaxchunksize : UInt32*, pchunkingalgorithm : DedupChunkingAlgorithm*, phashingalgorithm : DedupHashingAlgorithm*, pcompressionalgorithm : DedupCompressionAlgorithm*) : HRESULT
    @lpVtbl.value.get_configuration.unsafe_as(Proc(UInt32*, UInt32*, DedupChunkingAlgorithm*, DedupHashingAlgorithm*, DedupCompressionAlgorithm*, HRESULT)).call(pminchunksize, pmaxchunksize, pchunkingalgorithm, phashingalgorithm, pcompressionalgorithm)
  end
  def get_volume_status(options : UInt32, path : UInt8*, pstatus : DedupDataPortVolumeStatus*) : HRESULT
    @lpVtbl.value.get_volume_status.unsafe_as(Proc(UInt32, UInt8*, DedupDataPortVolumeStatus*, HRESULT)).call(options, path, pstatus)
  end
  def get_volume_data_port(options : UInt32, path : UInt8*, ppdataport : IDedupDataPort*) : HRESULT
    @lpVtbl.value.get_volume_data_port.unsafe_as(Proc(UInt32, UInt8*, IDedupDataPort*, HRESULT)).call(options, path, ppdataport)
  end
end
