require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Storage::DataDeduplication
  DEDUP_CHUNKLIB_MAX_CHUNKS_ENUM = 1024_u32

  CLSID_DedupBackupSupport = LibC::GUID.new(0x73d6b2ad_u32, 0x2984_u16, 0x4715_u16, StaticArray[0xb2_u8, 0xe3_u8, 0x92_u8, 0x4c_u8, 0x14_u8, 0x97_u8, 0x44_u8, 0xdd_u8])

  CLSID_DedupDataPort = LibC::GUID.new(0x8f107207_u32, 0x1829_u16, 0x48b2_u16, StaticArray[0xa6_u8, 0x4b_u8, 0xe6_u8, 0x1f_u8, 0x8e_u8, 0xd_u8, 0x9a_u8, 0xcb_u8])

  enum DEDUP_BACKUP_SUPPORT_PARAM_TYPE
    DEDUP_RECONSTRUCT_UNOPTIMIZED = 1_i32
    DEDUP_RECONSTRUCT_OPTIMIZED = 2_i32
  end
  enum DEDUP_SET_PARAM_TYPE
    DEDUP_PT_MinChunkSizeBytes = 1_i32
    DEDUP_PT_MaxChunkSizeBytes = 2_i32
    DEDUP_PT_AvgChunkSizeBytes = 3_i32
    DEDUP_PT_InvariantChunking = 4_i32
    DEDUP_PT_DisableStrongHashComputation = 5_i32
  end
  enum DedupDataPortManagerOption
    DedupDataPortManagerOption_None = 0_i32
    DedupDataPortManagerOption_AutoStart = 1_i32
    DedupDataPortManagerOption_SkipReconciliation = 2_i32
  end
  enum DedupDataPortVolumeStatus
    DedupDataPortVolumeStatus_Unknown = 0_i32
    DedupDataPortVolumeStatus_NotEnabled = 1_i32
    DedupDataPortVolumeStatus_NotAvailable = 2_i32
    DedupDataPortVolumeStatus_Initializing = 3_i32
    DedupDataPortVolumeStatus_Ready = 4_i32
    DedupDataPortVolumeStatus_Maintenance = 5_i32
    DedupDataPortVolumeStatus_Shutdown = 6_i32
  end
  enum DedupDataPortRequestStatus
    DedupDataPortRequestStatus_Unknown = 0_i32
    DedupDataPortRequestStatus_Queued = 1_i32
    DedupDataPortRequestStatus_Processing = 2_i32
    DedupDataPortRequestStatus_Partial = 3_i32
    DedupDataPortRequestStatus_Complete = 4_i32
    DedupDataPortRequestStatus_Failed = 5_i32
  end
  enum DedupChunkFlags
    DedupChunkFlags_None = 0_i32
    DedupChunkFlags_Compressed = 1_i32
  end
  enum DedupChunkingAlgorithm
    DedupChunkingAlgorithm_Unknonwn = 0_i32
    DedupChunkingAlgorithm_V1 = 1_i32
  end
  enum DedupHashingAlgorithm
    DedupHashingAlgorithm_Unknonwn = 0_i32
    DedupHashingAlgorithm_V1 = 1_i32
  end
  enum DedupCompressionAlgorithm
    DedupCompressionAlgorithm_Unknonwn = 0_i32
    DedupCompressionAlgorithm_Xpress = 1_i32
  end

  @[Extern]
  record DEDUP_CONTAINER_EXTENT,
    container_index : UInt32,
    start_offset : Int64,
    length : Int64

  @[Extern]
  record DDP_FILE_EXTENT,
    length : Int64,
    offset : Int64

  @[Extern]
  record DEDUP_CHUNK_INFO_HASH32,
    chunk_flags : UInt32,
    chunk_offset_in_stream : UInt64,
    chunk_size : UInt64,
    hash_val : UInt8[32]

  @[Extern]
  record DedupHash,
    hash : UInt8[32]

  @[Extern]
  record DedupChunk,
    hash : Win32cr::Storage::DataDeduplication::DedupHash,
    flags : Win32cr::Storage::DataDeduplication::DedupChunkFlags,
    logical_size : UInt32,
    data_size : UInt32

  @[Extern]
  record DedupStreamEntry,
    hash : Win32cr::Storage::DataDeduplication::DedupHash,
    logical_size : UInt32,
    offset : UInt64

  @[Extern]
  record DedupStream,
    path : Win32cr::Foundation::BSTR,
    offset : UInt64,
    length : UInt64,
    chunk_count : UInt32

  @[Extern]
  record IDedupReadFileCallbackVtbl,
    query_interface : Proc(IDedupReadFileCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDedupReadFileCallback*, UInt32),
    release : Proc(IDedupReadFileCallback*, UInt32),
    read_backup_file : Proc(IDedupReadFileCallback*, Win32cr::Foundation::BSTR, Int64, UInt32, UInt8*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    order_containers_restore : Proc(IDedupReadFileCallback*, UInt32, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Storage::DataDeduplication::DEDUP_CONTAINER_EXTENT**, Win32cr::Foundation::HRESULT),
    preview_container_read : Proc(IDedupReadFileCallback*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Storage::DataDeduplication::DDP_FILE_EXTENT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7bacc67a-2f1d-42d0-897e-6ff62dd533bb")]
  record IDedupReadFileCallback, lpVtbl : IDedupReadFileCallbackVtbl* do
    GUID = LibC::GUID.new(0x7bacc67a_u32, 0x2f1d_u16, 0x42d0_u16, StaticArray[0x89_u8, 0x7e_u8, 0x6f_u8, 0xf6_u8, 0x2d_u8, 0xd5_u8, 0x33_u8, 0xbb_u8])
    def query_interface(this : IDedupReadFileCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDedupReadFileCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDedupReadFileCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def read_backup_file(this : IDedupReadFileCallback*, file_full_path : Win32cr::Foundation::BSTR, file_offset : Int64, size_to_read : UInt32, file_buffer : UInt8*, returned_size : UInt32*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.read_backup_file.call(this, file_full_path, file_offset, size_to_read, file_buffer, returned_size, flags)
    end
    def order_containers_restore(this : IDedupReadFileCallback*, number_of_containers : UInt32, container_paths : Win32cr::Foundation::BSTR*, read_plan_entries : UInt32*, read_plan : Win32cr::Storage::DataDeduplication::DEDUP_CONTAINER_EXTENT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.order_containers_restore.call(this, number_of_containers, container_paths, read_plan_entries, read_plan)
    end
    def preview_container_read(this : IDedupReadFileCallback*, file_full_path : Win32cr::Foundation::BSTR, number_of_reads : UInt32, read_offsets : Win32cr::Storage::DataDeduplication::DDP_FILE_EXTENT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preview_container_read.call(this, file_full_path, number_of_reads, read_offsets)
    end

  end

  @[Extern]
  record IDedupBackupSupportVtbl,
    query_interface : Proc(IDedupBackupSupport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDedupBackupSupport*, UInt32),
    release : Proc(IDedupBackupSupport*, UInt32),
    restore_files : Proc(IDedupBackupSupport*, UInt32, Win32cr::Foundation::BSTR*, Void*, UInt32, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c719d963-2b2d-415e-acf7-7eb7ca596ff4")]
  record IDedupBackupSupport, lpVtbl : IDedupBackupSupportVtbl* do
    GUID = LibC::GUID.new(0xc719d963_u32, 0x2b2d_u16, 0x415e_u16, StaticArray[0xac_u8, 0xf7_u8, 0x7e_u8, 0xb7_u8, 0xca_u8, 0x59_u8, 0x6f_u8, 0xf4_u8])
    def query_interface(this : IDedupBackupSupport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDedupBackupSupport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDedupBackupSupport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def restore_files(this : IDedupBackupSupport*, number_of_files : UInt32, file_full_paths : Win32cr::Foundation::BSTR*, store : Void*, flags : UInt32, file_results : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_files.call(this, number_of_files, file_full_paths, store, flags, file_results)
    end

  end

  @[Extern]
  record IDedupChunkLibraryVtbl,
    query_interface : Proc(IDedupChunkLibrary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDedupChunkLibrary*, UInt32),
    release : Proc(IDedupChunkLibrary*, UInt32),
    initialize_for_push_buffers : Proc(IDedupChunkLibrary*, Win32cr::Foundation::HRESULT),
    uninitialize : Proc(IDedupChunkLibrary*, Win32cr::Foundation::HRESULT),
    set_parameter : Proc(IDedupChunkLibrary*, UInt32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    start_chunking : Proc(IDedupChunkLibrary*, LibC::GUID, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bb5144d7-2720-4dcc-8777-78597416ec23")]
  record IDedupChunkLibrary, lpVtbl : IDedupChunkLibraryVtbl* do
    GUID = LibC::GUID.new(0xbb5144d7_u32, 0x2720_u16, 0x4dcc_u16, StaticArray[0x87_u8, 0x77_u8, 0x78_u8, 0x59_u8, 0x74_u8, 0x16_u8, 0xec_u8, 0x23_u8])
    def query_interface(this : IDedupChunkLibrary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDedupChunkLibrary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDedupChunkLibrary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize_for_push_buffers(this : IDedupChunkLibrary*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_for_push_buffers.call(this)
    end
    def uninitialize(this : IDedupChunkLibrary*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninitialize.call(this)
    end
    def set_parameter(this : IDedupChunkLibrary*, dwParamType : UInt32, vParamValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameter.call(this, dwParamType, vParamValue)
    end
    def start_chunking(this : IDedupChunkLibrary*, iidIteratorInterfaceID : LibC::GUID, ppChunksEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_chunking.call(this, iidIteratorInterfaceID, ppChunksEnum)
    end

  end

  @[Extern]
  record IDedupIterateChunksHash32Vtbl,
    query_interface : Proc(IDedupIterateChunksHash32*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDedupIterateChunksHash32*, UInt32),
    release : Proc(IDedupIterateChunksHash32*, UInt32),
    push_buffer : Proc(IDedupIterateChunksHash32*, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    next__ : Proc(IDedupIterateChunksHash32*, UInt32, Win32cr::Storage::DataDeduplication::DEDUP_CHUNK_INFO_HASH32*, UInt32*, Win32cr::Foundation::HRESULT),
    drain : Proc(IDedupIterateChunksHash32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IDedupIterateChunksHash32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("90b584d3-72aa-400f-9767-cad866a5a2d8")]
  record IDedupIterateChunksHash32, lpVtbl : IDedupIterateChunksHash32Vtbl* do
    GUID = LibC::GUID.new(0x90b584d3_u32, 0x72aa_u16, 0x400f_u16, StaticArray[0x97_u8, 0x67_u8, 0xca_u8, 0xd8_u8, 0x66_u8, 0xa5_u8, 0xa2_u8, 0xd8_u8])
    def query_interface(this : IDedupIterateChunksHash32*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDedupIterateChunksHash32*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDedupIterateChunksHash32*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def push_buffer(this : IDedupIterateChunksHash32*, pBuffer : UInt8*, ulBufferLength : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push_buffer.call(this, pBuffer, ulBufferLength)
    end
    def next__(this : IDedupIterateChunksHash32*, ulMaxChunks : UInt32, pArrChunks : Win32cr::Storage::DataDeduplication::DEDUP_CHUNK_INFO_HASH32*, pulFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulMaxChunks, pArrChunks, pulFetched)
    end
    def drain(this : IDedupIterateChunksHash32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.drain.call(this)
    end
    def reset(this : IDedupIterateChunksHash32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IDedupDataPortVtbl,
    query_interface : Proc(IDedupDataPort*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDedupDataPort*, UInt32),
    release : Proc(IDedupDataPort*, UInt32),
    get_status : Proc(IDedupDataPort*, Win32cr::Storage::DataDeduplication::DedupDataPortVolumeStatus*, UInt32*, Win32cr::Foundation::HRESULT),
    lookup_chunks : Proc(IDedupDataPort*, UInt32, Win32cr::Storage::DataDeduplication::DedupHash*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    insert_chunks : Proc(IDedupDataPort*, UInt32, Win32cr::Storage::DataDeduplication::DedupChunk*, UInt32, UInt8*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    insert_chunks_with_stream : Proc(IDedupDataPort*, UInt32, Win32cr::Storage::DataDeduplication::DedupChunk*, UInt32, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    commit_streams : Proc(IDedupDataPort*, UInt32, Win32cr::Storage::DataDeduplication::DedupStream*, UInt32, Win32cr::Storage::DataDeduplication::DedupStreamEntry*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    commit_streams_with_stream : Proc(IDedupDataPort*, UInt32, Win32cr::Storage::DataDeduplication::DedupStream*, UInt32, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_streams : Proc(IDedupDataPort*, UInt32, Win32cr::Foundation::BSTR*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_streams_results : Proc(IDedupDataPort*, LibC::GUID, UInt32, UInt32, UInt32*, Win32cr::Storage::DataDeduplication::DedupStream**, UInt32*, Win32cr::Storage::DataDeduplication::DedupStreamEntry**, Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, Win32cr::Foundation::HRESULT**, Win32cr::Foundation::HRESULT),
    get_chunks : Proc(IDedupDataPort*, UInt32, Win32cr::Storage::DataDeduplication::DedupHash*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_chunks_results : Proc(IDedupDataPort*, LibC::GUID, UInt32, UInt32, UInt32*, Win32cr::Storage::DataDeduplication::DedupChunk**, UInt32*, UInt8**, Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, Win32cr::Foundation::HRESULT**, Win32cr::Foundation::HRESULT),
    get_request_status : Proc(IDedupDataPort*, LibC::GUID, Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, Win32cr::Foundation::HRESULT),
    get_request_results : Proc(IDedupDataPort*, LibC::GUID, UInt32, Win32cr::Foundation::HRESULT*, UInt32*, Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, Win32cr::Foundation::HRESULT**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7963d734-40a9-4ea3-bbf6-5a89d26f7ae8")]
  record IDedupDataPort, lpVtbl : IDedupDataPortVtbl* do
    GUID = LibC::GUID.new(0x7963d734_u32, 0x40a9_u16, 0x4ea3_u16, StaticArray[0xbb_u8, 0xf6_u8, 0x5a_u8, 0x89_u8, 0xd2_u8, 0x6f_u8, 0x7a_u8, 0xe8_u8])
    def query_interface(this : IDedupDataPort*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDedupDataPort*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDedupDataPort*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_status(this : IDedupDataPort*, pStatus : Win32cr::Storage::DataDeduplication::DedupDataPortVolumeStatus*, pDataHeadroomMb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pStatus, pDataHeadroomMb)
    end
    def lookup_chunks(this : IDedupDataPort*, count : UInt32, pHashes : Win32cr::Storage::DataDeduplication::DedupHash*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_chunks.call(this, count, pHashes, pRequestId)
    end
    def insert_chunks(this : IDedupDataPort*, chunk_count : UInt32, pChunkMetadata : Win32cr::Storage::DataDeduplication::DedupChunk*, data_byte_count : UInt32, pChunkData : UInt8*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_chunks.call(this, chunk_count, pChunkMetadata, data_byte_count, pChunkData, pRequestId)
    end
    def insert_chunks_with_stream(this : IDedupDataPort*, chunk_count : UInt32, pChunkMetadata : Win32cr::Storage::DataDeduplication::DedupChunk*, data_byte_count : UInt32, pChunkDataStream : Void*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_chunks_with_stream.call(this, chunk_count, pChunkMetadata, data_byte_count, pChunkDataStream, pRequestId)
    end
    def commit_streams(this : IDedupDataPort*, stream_count : UInt32, pStreams : Win32cr::Storage::DataDeduplication::DedupStream*, entry_count : UInt32, pEntries : Win32cr::Storage::DataDeduplication::DedupStreamEntry*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_streams.call(this, stream_count, pStreams, entry_count, pEntries, pRequestId)
    end
    def commit_streams_with_stream(this : IDedupDataPort*, stream_count : UInt32, pStreams : Win32cr::Storage::DataDeduplication::DedupStream*, entry_count : UInt32, pEntriesStream : Void*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_streams_with_stream.call(this, stream_count, pStreams, entry_count, pEntriesStream, pRequestId)
    end
    def get_streams(this : IDedupDataPort*, stream_count : UInt32, pStreamPaths : Win32cr::Foundation::BSTR*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams.call(this, stream_count, pStreamPaths, pRequestId)
    end
    def get_streams_results(this : IDedupDataPort*, request_id : LibC::GUID, max_wait_ms : UInt32, stream_entry_index : UInt32, pStreamCount : UInt32*, ppStreams : Win32cr::Storage::DataDeduplication::DedupStream**, pEntryCount : UInt32*, ppEntries : Win32cr::Storage::DataDeduplication::DedupStreamEntry**, pStatus : Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, ppItemResults : Win32cr::Foundation::HRESULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_streams_results.call(this, request_id, max_wait_ms, stream_entry_index, pStreamCount, ppStreams, pEntryCount, ppEntries, pStatus, ppItemResults)
    end
    def get_chunks(this : IDedupDataPort*, count : UInt32, pHashes : Win32cr::Storage::DataDeduplication::DedupHash*, pRequestId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_chunks.call(this, count, pHashes, pRequestId)
    end
    def get_chunks_results(this : IDedupDataPort*, request_id : LibC::GUID, max_wait_ms : UInt32, chunk_index : UInt32, pChunkCount : UInt32*, ppChunkMetadata : Win32cr::Storage::DataDeduplication::DedupChunk**, pDataByteCount : UInt32*, ppChunkData : UInt8**, pStatus : Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, ppItemResults : Win32cr::Foundation::HRESULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_chunks_results.call(this, request_id, max_wait_ms, chunk_index, pChunkCount, ppChunkMetadata, pDataByteCount, ppChunkData, pStatus, ppItemResults)
    end
    def get_request_status(this : IDedupDataPort*, request_id : LibC::GUID, pStatus : Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_request_status.call(this, request_id, pStatus)
    end
    def get_request_results(this : IDedupDataPort*, request_id : LibC::GUID, max_wait_ms : UInt32, pBatchResult : Win32cr::Foundation::HRESULT*, pBatchCount : UInt32*, pStatus : Win32cr::Storage::DataDeduplication::DedupDataPortRequestStatus*, ppItemResults : Win32cr::Foundation::HRESULT**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_request_results.call(this, request_id, max_wait_ms, pBatchResult, pBatchCount, pStatus, ppItemResults)
    end

  end

  @[Extern]
  record IDedupDataPortManagerVtbl,
    query_interface : Proc(IDedupDataPortManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDedupDataPortManager*, UInt32),
    release : Proc(IDedupDataPortManager*, UInt32),
    get_configuration : Proc(IDedupDataPortManager*, UInt32*, UInt32*, Win32cr::Storage::DataDeduplication::DedupChunkingAlgorithm*, Win32cr::Storage::DataDeduplication::DedupHashingAlgorithm*, Win32cr::Storage::DataDeduplication::DedupCompressionAlgorithm*, Win32cr::Foundation::HRESULT),
    get_volume_status : Proc(IDedupDataPortManager*, UInt32, Win32cr::Foundation::BSTR, Win32cr::Storage::DataDeduplication::DedupDataPortVolumeStatus*, Win32cr::Foundation::HRESULT),
    get_volume_data_port : Proc(IDedupDataPortManager*, UInt32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("44677452-b90a-445e-8192-cdcfe81511fb")]
  record IDedupDataPortManager, lpVtbl : IDedupDataPortManagerVtbl* do
    GUID = LibC::GUID.new(0x44677452_u32, 0xb90a_u16, 0x445e_u16, StaticArray[0x81_u8, 0x92_u8, 0xcd_u8, 0xcf_u8, 0xe8_u8, 0x15_u8, 0x11_u8, 0xfb_u8])
    def query_interface(this : IDedupDataPortManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDedupDataPortManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDedupDataPortManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_configuration(this : IDedupDataPortManager*, pMinChunkSize : UInt32*, pMaxChunkSize : UInt32*, pChunkingAlgorithm : Win32cr::Storage::DataDeduplication::DedupChunkingAlgorithm*, pHashingAlgorithm : Win32cr::Storage::DataDeduplication::DedupHashingAlgorithm*, pCompressionAlgorithm : Win32cr::Storage::DataDeduplication::DedupCompressionAlgorithm*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_configuration.call(this, pMinChunkSize, pMaxChunkSize, pChunkingAlgorithm, pHashingAlgorithm, pCompressionAlgorithm)
    end
    def get_volume_status(this : IDedupDataPortManager*, options : UInt32, path : Win32cr::Foundation::BSTR, pStatus : Win32cr::Storage::DataDeduplication::DedupDataPortVolumeStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_status.call(this, options, path, pStatus)
    end
    def get_volume_data_port(this : IDedupDataPortManager*, options : UInt32, path : Win32cr::Foundation::BSTR, ppDataPort : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_volume_data_port.call(this, options, path, ppDataPort)
    end

  end

end