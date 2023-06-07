require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:onecore.dll")]
{% else %}
@[Link("onecore")]
{% end %}
lib LibWin32
  alias HeapHandle = LibC::IntPtrT

  FILE_CACHE_MAX_HARD_ENABLE = 1_u32
  FILE_CACHE_MAX_HARD_DISABLE = 2_u32
  FILE_CACHE_MIN_HARD_ENABLE = 4_u32
  FILE_CACHE_MIN_HARD_DISABLE = 8_u32
  MEHC_PATROL_SCRUBBER_PRESENT = 1_u32

  alias PBAD_MEMORY_CALLBACK_ROUTINE = Proc(Void)
  alias PSECURE_MEMORY_CACHE_CALLBACK = Proc(Void*, LibC::UINT_PTR, BOOLEAN)


  enum FILE_MAP : UInt32
    FILE_MAP_WRITE = 2
    FILE_MAP_READ = 4
    FILE_MAP_ALL_ACCESS = 983071
    FILE_MAP_EXECUTE = 32
    FILE_MAP_COPY = 1
    FILE_MAP_RESERVE = 2147483648
    FILE_MAP_TARGETS_INVALID = 1073741824
    FILE_MAP_LARGE_PAGES = 536870912
  end

  enum HEAP_FLAGS : UInt32
    HEAP_NONE = 0
    HEAP_NO_SERIALIZE = 1
    HEAP_GROWABLE = 2
    HEAP_GENERATE_EXCEPTIONS = 4
    HEAP_ZERO_MEMORY = 8
    HEAP_REALLOC_IN_PLACE_ONLY = 16
    HEAP_TAIL_CHECKING_ENABLED = 32
    HEAP_FREE_CHECKING_ENABLED = 64
    HEAP_DISABLE_COALESCE_ON_FREE = 128
    HEAP_CREATE_ALIGN_16 = 65536
    HEAP_CREATE_ENABLE_TRACING = 131072
    HEAP_CREATE_ENABLE_EXECUTE = 262144
    HEAP_MAXIMUM_TAG = 4095
    HEAP_PSEUDO_TAG_FLAG = 32768
    HEAP_TAG_SHIFT = 18
    HEAP_CREATE_SEGMENT_HEAP = 256
    HEAP_CREATE_HARDENED = 512
  end

  enum PAGE_PROTECTION_FLAGS : UInt32
    PAGE_NOACCESS = 1
    PAGE_READONLY = 2
    PAGE_READWRITE = 4
    PAGE_WRITECOPY = 8
    PAGE_EXECUTE = 16
    PAGE_EXECUTE_READ = 32
    PAGE_EXECUTE_READWRITE = 64
    PAGE_EXECUTE_WRITECOPY = 128
    PAGE_GUARD = 256
    PAGE_NOCACHE = 512
    PAGE_WRITECOMBINE = 1024
    PAGE_GRAPHICS_NOACCESS = 2048
    PAGE_GRAPHICS_READONLY = 4096
    PAGE_GRAPHICS_READWRITE = 8192
    PAGE_GRAPHICS_EXECUTE = 16384
    PAGE_GRAPHICS_EXECUTE_READ = 32768
    PAGE_GRAPHICS_EXECUTE_READWRITE = 65536
    PAGE_GRAPHICS_COHERENT = 131072
    PAGE_GRAPHICS_NOCACHE = 262144
    PAGE_ENCLAVE_THREAD_CONTROL = 2147483648
    PAGE_REVERT_TO_FILE_MAP = 2147483648
    PAGE_TARGETS_NO_UPDATE = 1073741824
    PAGE_TARGETS_INVALID = 1073741824
    PAGE_ENCLAVE_UNVALIDATED = 536870912
    PAGE_ENCLAVE_MASK = 268435456
    PAGE_ENCLAVE_DECOMMIT = 268435456
    PAGE_ENCLAVE_SS_FIRST = 268435457
    PAGE_ENCLAVE_SS_REST = 268435458
    SEC_PARTITION_OWNER_HANDLE = 262144
    SEC_64K_PAGES = 524288
    SEC_FILE = 8388608
    SEC_IMAGE = 16777216
    SEC_PROTECTED_IMAGE = 33554432
    SEC_RESERVE = 67108864
    SEC_COMMIT = 134217728
    SEC_NOCACHE = 268435456
    SEC_WRITECOMBINE = 1073741824
    SEC_LARGE_PAGES = 2147483648
    SEC_IMAGE_NO_EXECUTE = 285212672
  end

  enum UNMAP_VIEW_OF_FILE_FLAGS : UInt32
    MEM_UNMAP_NONE = 0
    MEM_UNMAP_WITH_TRANSIENT_BOOST = 1
    MEM_PRESERVE_PLACEHOLDER = 2
  end

  enum VIRTUAL_FREE_TYPE : UInt32
    MEM_DECOMMIT = 16384
    MEM_RELEASE = 32768
  end

  enum VIRTUAL_ALLOCATION_TYPE : UInt32
    MEM_COMMIT = 4096
    MEM_RESERVE = 8192
    MEM_RESET = 524288
    MEM_RESET_UNDO = 16777216
    MEM_REPLACE_PLACEHOLDER = 16384
    MEM_LARGE_PAGES = 536870912
    MEM_RESERVE_PLACEHOLDER = 262144
    MEM_FREE = 65536
  end

  enum LOCAL_ALLOC_FLAGS : UInt32
    LHND = 66
    LMEM_FIXED = 0
    LMEM_MOVEABLE = 2
    LMEM_ZEROINIT = 64
    LPTR = 64
    NONZEROLHND = 2
    NONZEROLPTR = 0
  end

  enum GLOBAL_ALLOC_FLAGS : UInt32
    GHND = 66
    GMEM_FIXED = 0
    GMEM_MOVEABLE = 2
    GMEM_ZEROINIT = 64
    GPTR = 64
  end

  enum PAGE_TYPE : UInt32
    MEM_PRIVATE = 131072
    MEM_MAPPED = 262144
    MEM_IMAGE = 16777216
  end

  enum MEMORY_RESOURCE_NOTIFICATION_TYPE : Int32
    LowMemoryResourceNotification = 0
    HighMemoryResourceNotification = 1
  end

  enum OFFER_PRIORITY : Int32
    VmOfferPriorityVeryLow = 1
    VmOfferPriorityLow = 2
    VmOfferPriorityBelowNormal = 3
    VmOfferPriorityNormal = 4
  end

  enum WIN32_MEMORY_INFORMATION_CLASS : Int32
    MemoryRegionInfo = 0
  end

  enum WIN32_MEMORY_PARTITION_INFORMATION_CLASS : Int32
    MemoryPartitionInfo = 0
    MemoryPartitionDedicatedMemoryInfo = 1
  end

  enum MEM_EXTENDED_PARAMETER_TYPE : Int32
    MemExtendedParameterInvalidType = 0
    MemExtendedParameterAddressRequirements = 1
    MemExtendedParameterNumaNode = 2
    MemExtendedParameterPartitionHandle = 3
    MemExtendedParameterUserPhysicalHandle = 4
    MemExtendedParameterAttributeFlags = 5
    MemExtendedParameterImageMachine = 6
    MemExtendedParameterMax = 7
  end

  enum HEAP_INFORMATION_CLASS : Int32
    HeapCompatibilityInformation = 0
    HeapEnableTerminationOnCorruption = 1
    HeapOptimizeResources = 3
    HeapTag = 7
  end

  union PROCESS_HEAP_ENTRY_Anonymous_e__Union
    block : PROCESS_HEAP_ENTRY_Anonymous_e__Union_Block_e__Struct
    region : PROCESS_HEAP_ENTRY_Anonymous_e__Union_Region_e__Struct
  end
  union WIN32_MEMORY_REGION_INFORMATION_Anonymous_e__Union
    flags : UInt32
    anonymous : WIN32_MEMORY_REGION_INFORMATION_Anonymous_e__Union_Anonymous_e__Struct
  end
  union MEM_EXTENDED_PARAMETER_Anonymous2_e__Union
    u_long64 : UInt64
    pointer : Void*
    size : LibC::UINT_PTR
    handle : LibC::HANDLE
    u_long : UInt32
  end

  struct PROCESS_HEAP_ENTRY
    lp_data : Void*
    cb_data : UInt32
    cb_overhead : UInt8
    i_region_index : UInt8
    w_flags : UInt16
    anonymous : PROCESS_HEAP_ENTRY_Anonymous_e__Union
  end
  struct PROCESS_HEAP_ENTRY_Anonymous_e__Union_Block_e__Struct
    h_mem : LibC::HANDLE
    dw_reserved : UInt32[3]*
  end
  struct PROCESS_HEAP_ENTRY_Anonymous_e__Union_Region_e__Struct
    dw_committed_size : UInt32
    dw_un_committed_size : UInt32
    lp_first_block : Void*
    lp_last_block : Void*
  end
  struct HEAP_SUMMARY
    cb : UInt32
    cb_allocated : LibC::UINT_PTR
    cb_committed : LibC::UINT_PTR
    cb_reserved : LibC::UINT_PTR
    cb_max_reserve : LibC::UINT_PTR
  end
  struct WIN32_MEMORY_RANGE_ENTRY
    virtual_address : Void*
    number_of_bytes : LibC::UINT_PTR
  end
  struct WIN32_MEMORY_REGION_INFORMATION
    allocation_base : Void*
    allocation_protect : UInt32
    anonymous : WIN32_MEMORY_REGION_INFORMATION_Anonymous_e__Union
    region_size : LibC::UINT_PTR
    commit_size : LibC::UINT_PTR
  end
  struct WIN32_MEMORY_REGION_INFORMATION_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WIN32_MEMORY_PARTITION_INFORMATION
    flags : UInt32
    numa_node : UInt32
    channel : UInt32
    number_of_numa_nodes : UInt32
    resident_available_pages : UInt64
    committed_pages : UInt64
    commit_limit : UInt64
    peak_commitment : UInt64
    total_number_of_pages : UInt64
    available_pages : UInt64
    zero_pages : UInt64
    free_pages : UInt64
    standby_pages : UInt64
    reserved : UInt64[16]*
    maximum_commit_limit : UInt64
    reserved2 : UInt64
    partition_id : UInt32
  end
  struct MEMORY_BASIC_INFORMATION
    base_address : Void*
    allocation_base : Void*
    allocation_protect : PAGE_PROTECTION_FLAGS
    partition_id : UInt16
    region_size : LibC::UINT_PTR
    state : VIRTUAL_ALLOCATION_TYPE
    protect : PAGE_PROTECTION_FLAGS
    type : PAGE_TYPE
  end
  struct MEMORY_BASIC_INFORMATION32
    base_address : UInt32
    allocation_base : UInt32
    allocation_protect : PAGE_PROTECTION_FLAGS
    region_size : UInt32
    state : VIRTUAL_ALLOCATION_TYPE
    protect : PAGE_PROTECTION_FLAGS
    type : PAGE_TYPE
  end
  struct MEMORY_BASIC_INFORMATION64
    base_address : UInt64
    allocation_base : UInt64
    allocation_protect : PAGE_PROTECTION_FLAGS
    __alignment1 : UInt32
    region_size : UInt64
    state : VIRTUAL_ALLOCATION_TYPE
    protect : PAGE_PROTECTION_FLAGS
    type : PAGE_TYPE
    __alignment2 : UInt32
  end
  struct CFG_CALL_TARGET_INFO
    offset : LibC::UINT_PTR
    flags : LibC::UINT_PTR
  end
  struct MEM_EXTENDED_PARAMETER
    anonymous1 : MEM_EXTENDED_PARAMETER_Anonymous1_e__Struct
    anonymous2 : MEM_EXTENDED_PARAMETER_Anonymous2_e__Union
  end
  struct MEM_EXTENDED_PARAMETER_Anonymous1_e__Struct
    _bitfield : UInt64
  end


  # Params # floptions : HEAP_FLAGS [In],dwinitialsize : LibC::UINT_PTR [In],dwmaximumsize : LibC::UINT_PTR [In]
  fun HeapCreate(floptions : HEAP_FLAGS, dwinitialsize : LibC::UINT_PTR, dwmaximumsize : LibC::UINT_PTR) : HeapHandle

  # Params # hheap : HeapHandle [In]
  fun HeapDestroy(hheap : HeapHandle) : LibC::BOOL

  # Params # hheap : HeapHandle [In],dwflags : HEAP_FLAGS [In],dwbytes : LibC::UINT_PTR [In]
  # Commented out because function is part of Lib C
  #fun HeapAlloc(hheap : HeapHandle, dwflags : HEAP_FLAGS, dwbytes : LibC::UINT_PTR) : Void*

  # Params # hheap : HeapHandle [In],dwflags : HEAP_FLAGS [In],lpmem : Void* [In],dwbytes : LibC::UINT_PTR [In]
  # Commented out because function is part of Lib C
  #fun HeapReAlloc(hheap : HeapHandle, dwflags : HEAP_FLAGS, lpmem : Void*, dwbytes : LibC::UINT_PTR) : Void*

  # Params # hheap : HeapHandle [In],dwflags : HEAP_FLAGS [In],lpmem : Void* [In]
  # Commented out because function is part of Lib C
  #fun HeapFree(hheap : HeapHandle, dwflags : HEAP_FLAGS, lpmem : Void*) : LibC::BOOL

  # Params # hheap : HeapHandle [In],dwflags : HEAP_FLAGS [In],lpmem : Void* [In]
  fun HeapSize(hheap : HeapHandle, dwflags : HEAP_FLAGS, lpmem : Void*) : LibC::UINT_PTR

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetProcessHeap : HeapHandle

  # Params # hheap : HeapHandle [In],dwflags : HEAP_FLAGS [In]
  fun HeapCompact(hheap : HeapHandle, dwflags : HEAP_FLAGS) : LibC::UINT_PTR

  # Params # heaphandle : HeapHandle [In],heapinformationclass : HEAP_INFORMATION_CLASS [In],heapinformation : Void* [In],heapinformationlength : LibC::UINT_PTR [In]
  fun HeapSetInformation(heaphandle : HeapHandle, heapinformationclass : HEAP_INFORMATION_CLASS, heapinformation : Void*, heapinformationlength : LibC::UINT_PTR) : LibC::BOOL

  # Params # hheap : HeapHandle [In],dwflags : HEAP_FLAGS [In],lpmem : Void* [In]
  fun HeapValidate(hheap : HeapHandle, dwflags : HEAP_FLAGS, lpmem : Void*) : LibC::BOOL

  # Params # hheap : LibC::HANDLE [In],dwflags : UInt32 [In],lpsummary : HEAP_SUMMARY* [In]
  fun HeapSummary(hheap : LibC::HANDLE, dwflags : UInt32, lpsummary : HEAP_SUMMARY*) : LibC::BOOL

  # Params # numberofheaps : UInt32 [In],processheaps : HeapHandle* [In]
  fun GetProcessHeaps(numberofheaps : UInt32, processheaps : HeapHandle*) : UInt32

  # Params # hheap : HeapHandle [In]
  fun HeapLock(hheap : HeapHandle) : LibC::BOOL

  # Params # hheap : HeapHandle [In]
  fun HeapUnlock(hheap : HeapHandle) : LibC::BOOL

  # Params # hheap : HeapHandle [In],lpentry : PROCESS_HEAP_ENTRY* [In]
  fun HeapWalk(hheap : HeapHandle, lpentry : PROCESS_HEAP_ENTRY*) : LibC::BOOL

  # Params # heaphandle : HeapHandle [In],heapinformationclass : HEAP_INFORMATION_CLASS [In],heapinformation : Void* [In],heapinformationlength : LibC::UINT_PTR [In],returnlength : LibC::UINT_PTR* [In]
  fun HeapQueryInformation(heaphandle : HeapHandle, heapinformationclass : HEAP_INFORMATION_CLASS, heapinformation : Void*, heapinformationlength : LibC::UINT_PTR, returnlength : LibC::UINT_PTR*) : LibC::BOOL

  # Params # lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],flallocationtype : VIRTUAL_ALLOCATION_TYPE [In],flprotect : PAGE_PROTECTION_FLAGS [In]
  # Commented out because function is part of Lib C
  #fun VirtualAlloc(lpaddress : Void*, dwsize : LibC::UINT_PTR, flallocationtype : VIRTUAL_ALLOCATION_TYPE, flprotect : PAGE_PROTECTION_FLAGS) : Void*

  # Params # lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],flnewprotect : PAGE_PROTECTION_FLAGS [In],lpfloldprotect : PAGE_PROTECTION_FLAGS* [In]
  # Commented out because function is part of Lib C
  #fun VirtualProtect(lpaddress : Void*, dwsize : LibC::UINT_PTR, flnewprotect : PAGE_PROTECTION_FLAGS, lpfloldprotect : PAGE_PROTECTION_FLAGS*) : LibC::BOOL

  # Params # lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],dwfreetype : VIRTUAL_FREE_TYPE [In]
  # Commented out because function is part of Lib C
  #fun VirtualFree(lpaddress : Void*, dwsize : LibC::UINT_PTR, dwfreetype : VIRTUAL_FREE_TYPE) : LibC::BOOL

  # Params # lpaddress : Void* [In],lpbuffer : MEMORY_BASIC_INFORMATION* [In],dwlength : LibC::UINT_PTR [In]
  # Commented out because function is part of Lib C
  #fun VirtualQuery(lpaddress : Void*, lpbuffer : MEMORY_BASIC_INFORMATION*, dwlength : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],flallocationtype : VIRTUAL_ALLOCATION_TYPE [In],flprotect : PAGE_PROTECTION_FLAGS [In]
  fun VirtualAllocEx(hprocess : LibC::HANDLE, lpaddress : Void*, dwsize : LibC::UINT_PTR, flallocationtype : VIRTUAL_ALLOCATION_TYPE, flprotect : PAGE_PROTECTION_FLAGS) : Void*

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],flnewprotect : PAGE_PROTECTION_FLAGS [In],lpfloldprotect : PAGE_PROTECTION_FLAGS* [In]
  fun VirtualProtectEx(hprocess : LibC::HANDLE, lpaddress : Void*, dwsize : LibC::UINT_PTR, flnewprotect : PAGE_PROTECTION_FLAGS, lpfloldprotect : PAGE_PROTECTION_FLAGS*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],lpbuffer : MEMORY_BASIC_INFORMATION* [In],dwlength : LibC::UINT_PTR [In]
  fun VirtualQueryEx(hprocess : LibC::HANDLE, lpaddress : Void*, lpbuffer : MEMORY_BASIC_INFORMATION*, dwlength : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # hfile : LibC::HANDLE [In],lpfilemappingattributes : SECURITY_ATTRIBUTES* [In],flprotect : PAGE_PROTECTION_FLAGS [In],dwmaximumsizehigh : UInt32 [In],dwmaximumsizelow : UInt32 [In],lpname : LibC::LPWSTR [In]
  fun CreateFileMappingW(hfile : LibC::HANDLE, lpfilemappingattributes : SECURITY_ATTRIBUTES*, flprotect : PAGE_PROTECTION_FLAGS, dwmaximumsizehigh : UInt32, dwmaximumsizelow : UInt32, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : LibC::LPWSTR [In]
  fun OpenFileMappingW(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : LibC::LPWSTR) : LibC::HANDLE

  # Params # hfilemappingobject : LibC::HANDLE [In],dwdesiredaccess : FILE_MAP [In],dwfileoffsethigh : UInt32 [In],dwfileoffsetlow : UInt32 [In],dwnumberofbytestomap : LibC::UINT_PTR [In]
  fun MapViewOfFile(hfilemappingobject : LibC::HANDLE, dwdesiredaccess : FILE_MAP, dwfileoffsethigh : UInt32, dwfileoffsetlow : UInt32, dwnumberofbytestomap : LibC::UINT_PTR) : Void*

  # Params # hfilemappingobject : LibC::HANDLE [In],dwdesiredaccess : FILE_MAP [In],dwfileoffsethigh : UInt32 [In],dwfileoffsetlow : UInt32 [In],dwnumberofbytestomap : LibC::UINT_PTR [In],lpbaseaddress : Void* [In]
  fun MapViewOfFileEx(hfilemappingobject : LibC::HANDLE, dwdesiredaccess : FILE_MAP, dwfileoffsethigh : UInt32, dwfileoffsetlow : UInt32, dwnumberofbytestomap : LibC::UINT_PTR, lpbaseaddress : Void*) : Void*

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],dwfreetype : VIRTUAL_FREE_TYPE [In]
  fun VirtualFreeEx(hprocess : LibC::HANDLE, lpaddress : Void*, dwsize : LibC::UINT_PTR, dwfreetype : VIRTUAL_FREE_TYPE) : LibC::BOOL

  # Params # lpbaseaddress : Void* [In],dwnumberofbytestoflush : LibC::UINT_PTR [In]
  fun FlushViewOfFile(lpbaseaddress : Void*, dwnumberofbytestoflush : LibC::UINT_PTR) : LibC::BOOL

  # Params # lpbaseaddress : Void* [In]
  fun UnmapViewOfFile(lpbaseaddress : Void*) : LibC::BOOL

  # Params # 
  fun GetLargePageMinimum : LibC::UINT_PTR

  # Params # hprocess : LibC::HANDLE [In],lpminimumworkingsetsize : LibC::UINT_PTR* [In],lpmaximumworkingsetsize : LibC::UINT_PTR* [In],flags : UInt32* [In]
  fun GetProcessWorkingSetSizeEx(hprocess : LibC::HANDLE, lpminimumworkingsetsize : LibC::UINT_PTR*, lpmaximumworkingsetsize : LibC::UINT_PTR*, flags : UInt32*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],dwminimumworkingsetsize : LibC::UINT_PTR [In],dwmaximumworkingsetsize : LibC::UINT_PTR [In],flags : UInt32 [In]
  fun SetProcessWorkingSetSizeEx(hprocess : LibC::HANDLE, dwminimumworkingsetsize : LibC::UINT_PTR, dwmaximumworkingsetsize : LibC::UINT_PTR, flags : UInt32) : LibC::BOOL

  # Params # lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In]
  fun VirtualLock(lpaddress : Void*, dwsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In]
  fun VirtualUnlock(lpaddress : Void*, dwsize : LibC::UINT_PTR) : LibC::BOOL

  # Params # dwflags : UInt32 [In],lpbaseaddress : Void* [In],dwregionsize : LibC::UINT_PTR [In],lpaddresses : Void** [In],lpdwcount : LibC::UINT_PTR* [In],lpdwgranularity : UInt32* [In]
  fun GetWriteWatch(dwflags : UInt32, lpbaseaddress : Void*, dwregionsize : LibC::UINT_PTR, lpaddresses : Void**, lpdwcount : LibC::UINT_PTR*, lpdwgranularity : UInt32*) : UInt32

  # Params # lpbaseaddress : Void* [In],dwregionsize : LibC::UINT_PTR [In]
  fun ResetWriteWatch(lpbaseaddress : Void*, dwregionsize : LibC::UINT_PTR) : UInt32

  # Params # notificationtype : MEMORY_RESOURCE_NOTIFICATION_TYPE [In]
  fun CreateMemoryResourceNotification(notificationtype : MEMORY_RESOURCE_NOTIFICATION_TYPE) : LibC::HANDLE

  # Params # resourcenotificationhandle : LibC::HANDLE [In],resourcestate : LibC::BOOL* [In]
  fun QueryMemoryResourceNotification(resourcenotificationhandle : LibC::HANDLE, resourcestate : LibC::BOOL*) : LibC::BOOL

  # Params # lpminimumfilecachesize : LibC::UINT_PTR* [In],lpmaximumfilecachesize : LibC::UINT_PTR* [In],lpflags : UInt32* [In]
  fun GetSystemFileCacheSize(lpminimumfilecachesize : LibC::UINT_PTR*, lpmaximumfilecachesize : LibC::UINT_PTR*, lpflags : UInt32*) : LibC::BOOL

  # Params # minimumfilecachesize : LibC::UINT_PTR [In],maximumfilecachesize : LibC::UINT_PTR [In],flags : UInt32 [In]
  fun SetSystemFileCacheSize(minimumfilecachesize : LibC::UINT_PTR, maximumfilecachesize : LibC::UINT_PTR, flags : UInt32) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpfilemappingattributes : SECURITY_ATTRIBUTES* [In],flprotect : PAGE_PROTECTION_FLAGS [In],dwmaximumsizehigh : UInt32 [In],dwmaximumsizelow : UInt32 [In],lpname : LibC::LPWSTR [In],nndpreferred : UInt32 [In]
  fun CreateFileMappingNumaW(hfile : LibC::HANDLE, lpfilemappingattributes : SECURITY_ATTRIBUTES*, flprotect : PAGE_PROTECTION_FLAGS, dwmaximumsizehigh : UInt32, dwmaximumsizelow : UInt32, lpname : LibC::LPWSTR, nndpreferred : UInt32) : LibC::HANDLE

  # Params # hprocess : LibC::HANDLE [In],numberofentries : LibC::UINT_PTR [In],virtualaddresses : WIN32_MEMORY_RANGE_ENTRY* [In],flags : UInt32 [In]
  fun PrefetchVirtualMemory(hprocess : LibC::HANDLE, numberofentries : LibC::UINT_PTR, virtualaddresses : WIN32_MEMORY_RANGE_ENTRY*, flags : UInt32) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],securityattributes : SECURITY_ATTRIBUTES* [In],pageprotection : PAGE_PROTECTION_FLAGS [In],maximumsize : UInt64 [In],name : LibC::LPWSTR [In]
  fun CreateFileMappingFromApp(hfile : LibC::HANDLE, securityattributes : SECURITY_ATTRIBUTES*, pageprotection : PAGE_PROTECTION_FLAGS, maximumsize : UInt64, name : LibC::LPWSTR) : LibC::HANDLE

  # Params # hfilemappingobject : LibC::HANDLE [In],desiredaccess : FILE_MAP [In],fileoffset : UInt64 [In],numberofbytestomap : LibC::UINT_PTR [In]
  fun MapViewOfFileFromApp(hfilemappingobject : LibC::HANDLE, desiredaccess : FILE_MAP, fileoffset : UInt64, numberofbytestomap : LibC::UINT_PTR) : Void*

  # Params # baseaddress : Void* [In],unmapflags : UNMAP_VIEW_OF_FILE_FLAGS [In]
  fun UnmapViewOfFileEx(baseaddress : Void*, unmapflags : UNMAP_VIEW_OF_FILE_FLAGS) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],numberofpages : LibC::UINT_PTR* [In],pagearray : LibC::UINT_PTR* [In]
  fun AllocateUserPhysicalPages(hprocess : LibC::HANDLE, numberofpages : LibC::UINT_PTR*, pagearray : LibC::UINT_PTR*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],numberofpages : LibC::UINT_PTR* [In],pagearray : LibC::UINT_PTR* [In]
  fun FreeUserPhysicalPages(hprocess : LibC::HANDLE, numberofpages : LibC::UINT_PTR*, pagearray : LibC::UINT_PTR*) : LibC::BOOL

  # Params # virtualaddress : Void* [In],numberofpages : LibC::UINT_PTR [In],pagearray : LibC::UINT_PTR* [In]
  fun MapUserPhysicalPages(virtualaddress : Void*, numberofpages : LibC::UINT_PTR, pagearray : LibC::UINT_PTR*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],numberofpages : LibC::UINT_PTR* [In],pagearray : LibC::UINT_PTR* [In],nndpreferred : UInt32 [In]
  fun AllocateUserPhysicalPagesNuma(hprocess : LibC::HANDLE, numberofpages : LibC::UINT_PTR*, pagearray : LibC::UINT_PTR*, nndpreferred : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],flallocationtype : VIRTUAL_ALLOCATION_TYPE [In],flprotect : UInt32 [In],nndpreferred : UInt32 [In]
  fun VirtualAllocExNuma(hprocess : LibC::HANDLE, lpaddress : Void*, dwsize : LibC::UINT_PTR, flallocationtype : VIRTUAL_ALLOCATION_TYPE, flprotect : UInt32, nndpreferred : UInt32) : Void*

  # Params # capabilities : UInt32* [In]
  fun GetMemoryErrorHandlingCapabilities(capabilities : UInt32*) : LibC::BOOL

  # Params # callback : PBAD_MEMORY_CALLBACK_ROUTINE [In]
  fun RegisterBadMemoryNotification(callback : PBAD_MEMORY_CALLBACK_ROUTINE) : Void*

  # Params # registrationhandle : Void* [In]
  fun UnregisterBadMemoryNotification(registrationhandle : Void*) : LibC::BOOL

  # Params # virtualaddress : Void* [In],size : LibC::UINT_PTR [In],priority : OFFER_PRIORITY [In]
  fun OfferVirtualMemory(virtualaddress : Void*, size : LibC::UINT_PTR, priority : OFFER_PRIORITY) : UInt32

  # Params # virtualaddress : Void* [In],size : LibC::UINT_PTR [In]
  fun ReclaimVirtualMemory(virtualaddress : Void*, size : LibC::UINT_PTR) : UInt32

  # Params # virtualaddress : Void* [In],size : LibC::UINT_PTR [In]
  fun DiscardVirtualMemory(virtualaddress : Void*, size : LibC::UINT_PTR) : UInt32

  # Params # hprocess : LibC::HANDLE [In],virtualaddress : Void* [In],regionsize : LibC::UINT_PTR [In],numberofoffsets : UInt32 [In],offsetinformation : CFG_CALL_TARGET_INFO* [In]
  fun SetProcessValidCallTargets(hprocess : LibC::HANDLE, virtualaddress : Void*, regionsize : LibC::UINT_PTR, numberofoffsets : UInt32, offsetinformation : CFG_CALL_TARGET_INFO*) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],virtualaddress : Void* [In],regionsize : LibC::UINT_PTR [In],numberofoffsets : UInt32 [In],offsetinformation : CFG_CALL_TARGET_INFO* [In],section : LibC::HANDLE [In],expectedfileoffset : UInt64 [In]
  fun SetProcessValidCallTargetsForMappedView(process : LibC::HANDLE, virtualaddress : Void*, regionsize : LibC::UINT_PTR, numberofoffsets : UInt32, offsetinformation : CFG_CALL_TARGET_INFO*, section : LibC::HANDLE, expectedfileoffset : UInt64) : LibC::BOOL

  # Params # baseaddress : Void* [In],size : LibC::UINT_PTR [In],allocationtype : VIRTUAL_ALLOCATION_TYPE [In],protection : UInt32 [In]
  fun VirtualAllocFromApp(baseaddress : Void*, size : LibC::UINT_PTR, allocationtype : VIRTUAL_ALLOCATION_TYPE, protection : UInt32) : Void*

  # Params # address : Void* [In],size : LibC::UINT_PTR [In],newprotection : UInt32 [In],oldprotection : UInt32* [In]
  fun VirtualProtectFromApp(address : Void*, size : LibC::UINT_PTR, newprotection : UInt32, oldprotection : UInt32*) : LibC::BOOL

  # Params # desiredaccess : UInt32 [In],inherithandle : LibC::BOOL [In],name : LibC::LPWSTR [In]
  fun OpenFileMappingFromApp(desiredaccess : UInt32, inherithandle : LibC::BOOL, name : LibC::LPWSTR) : LibC::HANDLE

  # Params # process : LibC::HANDLE [In],virtualaddress : Void* [In],memoryinformationclass : WIN32_MEMORY_INFORMATION_CLASS [In],memoryinformation : Void* [In],memoryinformationsize : LibC::UINT_PTR [In],returnsize : LibC::UINT_PTR* [In]
  fun QueryVirtualMemoryInformation(process : LibC::HANDLE, virtualaddress : Void*, memoryinformationclass : WIN32_MEMORY_INFORMATION_CLASS, memoryinformation : Void*, memoryinformationsize : LibC::UINT_PTR, returnsize : LibC::UINT_PTR*) : LibC::BOOL

  # Params # filemappinghandle : LibC::HANDLE [In],processhandle : LibC::HANDLE [In],offset : UInt64 [In],baseaddress : Void* [In],viewsize : LibC::UINT_PTR [In],allocationtype : UInt32 [In],pageprotection : UInt32 [In],preferrednode : UInt32 [In]
  fun MapViewOfFileNuma2(filemappinghandle : LibC::HANDLE, processhandle : LibC::HANDLE, offset : UInt64, baseaddress : Void*, viewsize : LibC::UINT_PTR, allocationtype : UInt32, pageprotection : UInt32, preferrednode : UInt32) : Void*

  # Params # process : LibC::HANDLE [In],baseaddress : Void* [In],unmapflags : UNMAP_VIEW_OF_FILE_FLAGS [In]
  fun UnmapViewOfFile2(process : LibC::HANDLE, baseaddress : Void*, unmapflags : UNMAP_VIEW_OF_FILE_FLAGS) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],address : Void* [In],size : LibC::UINT_PTR [In]
  fun VirtualUnlockEx(process : LibC::HANDLE, address : Void*, size : LibC::UINT_PTR) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],baseaddress : Void* [In],size : LibC::UINT_PTR [In],allocationtype : VIRTUAL_ALLOCATION_TYPE [In],pageprotection : UInt32 [In],extendedparameters : MEM_EXTENDED_PARAMETER* [In],parametercount : UInt32 [In]
  fun VirtualAlloc2(process : LibC::HANDLE, baseaddress : Void*, size : LibC::UINT_PTR, allocationtype : VIRTUAL_ALLOCATION_TYPE, pageprotection : UInt32, extendedparameters : MEM_EXTENDED_PARAMETER*, parametercount : UInt32) : Void*

  # Params # filemapping : LibC::HANDLE [In],process : LibC::HANDLE [In],baseaddress : Void* [In],offset : UInt64 [In],viewsize : LibC::UINT_PTR [In],allocationtype : VIRTUAL_ALLOCATION_TYPE [In],pageprotection : UInt32 [In],extendedparameters : MEM_EXTENDED_PARAMETER* [In],parametercount : UInt32 [In]
  fun MapViewOfFile3(filemapping : LibC::HANDLE, process : LibC::HANDLE, baseaddress : Void*, offset : UInt64, viewsize : LibC::UINT_PTR, allocationtype : VIRTUAL_ALLOCATION_TYPE, pageprotection : UInt32, extendedparameters : MEM_EXTENDED_PARAMETER*, parametercount : UInt32) : Void*

  # Params # process : LibC::HANDLE [In],baseaddress : Void* [In],size : LibC::UINT_PTR [In],allocationtype : VIRTUAL_ALLOCATION_TYPE [In],pageprotection : UInt32 [In],extendedparameters : MEM_EXTENDED_PARAMETER* [In],parametercount : UInt32 [In]
  fun VirtualAlloc2FromApp(process : LibC::HANDLE, baseaddress : Void*, size : LibC::UINT_PTR, allocationtype : VIRTUAL_ALLOCATION_TYPE, pageprotection : UInt32, extendedparameters : MEM_EXTENDED_PARAMETER*, parametercount : UInt32) : Void*

  # Params # filemapping : LibC::HANDLE [In],process : LibC::HANDLE [In],baseaddress : Void* [In],offset : UInt64 [In],viewsize : LibC::UINT_PTR [In],allocationtype : VIRTUAL_ALLOCATION_TYPE [In],pageprotection : UInt32 [In],extendedparameters : MEM_EXTENDED_PARAMETER* [In],parametercount : UInt32 [In]
  fun MapViewOfFile3FromApp(filemapping : LibC::HANDLE, process : LibC::HANDLE, baseaddress : Void*, offset : UInt64, viewsize : LibC::UINT_PTR, allocationtype : VIRTUAL_ALLOCATION_TYPE, pageprotection : UInt32, extendedparameters : MEM_EXTENDED_PARAMETER*, parametercount : UInt32) : Void*

  # Params # file : LibC::HANDLE [In],securityattributes : SECURITY_ATTRIBUTES* [In],desiredaccess : UInt32 [In],pageprotection : PAGE_PROTECTION_FLAGS [In],allocationattributes : UInt32 [In],maximumsize : UInt64 [In],name : LibC::LPWSTR [In],extendedparameters : MEM_EXTENDED_PARAMETER* [In],parametercount : UInt32 [In]
  fun CreateFileMapping2(file : LibC::HANDLE, securityattributes : SECURITY_ATTRIBUTES*, desiredaccess : UInt32, pageprotection : PAGE_PROTECTION_FLAGS, allocationattributes : UInt32, maximumsize : UInt64, name : LibC::LPWSTR, extendedparameters : MEM_EXTENDED_PARAMETER*, parametercount : UInt32) : LibC::HANDLE

  # Params # objecthandle : LibC::HANDLE [In],numberofpages : LibC::UINT_PTR* [In],pagearray : LibC::UINT_PTR* [In],extendedparameters : MEM_EXTENDED_PARAMETER* [In],extendedparametercount : UInt32 [In]
  fun AllocateUserPhysicalPages2(objecthandle : LibC::HANDLE, numberofpages : LibC::UINT_PTR*, pagearray : LibC::UINT_PTR*, extendedparameters : MEM_EXTENDED_PARAMETER*, extendedparametercount : UInt32) : LibC::BOOL

  # Params # partition : LibC::HANDLE [In],dedicatedmemorytypeid : UInt64 [In],desiredaccess : UInt32 [In],inherithandle : LibC::BOOL [In]
  fun OpenDedicatedMemoryPartition(partition : LibC::HANDLE, dedicatedmemorytypeid : UInt64, desiredaccess : UInt32, inherithandle : LibC::BOOL) : LibC::HANDLE

  # Params # partition : LibC::HANDLE [In],partitioninformationclass : WIN32_MEMORY_PARTITION_INFORMATION_CLASS [In],partitioninformation : Void* [In],partitioninformationlength : UInt32 [In]
  fun QueryPartitionInformation(partition : LibC::HANDLE, partitioninformationclass : WIN32_MEMORY_PARTITION_INFORMATION_CLASS, partitioninformation : Void*, partitioninformationlength : UInt32) : LibC::BOOL

  # Params # source1 : Void* [In],source2 : Void* [In],length : LibC::UINT_PTR [In]
  fun RtlCompareMemory(source1 : Void*, source2 : Void*, length : LibC::UINT_PTR) : LibC::UINT_PTR

  # Params # buffer : Void* [In],size : LibC::UINT_PTR [In],initialcrc : UInt32 [In]
  fun RtlCrc32(buffer : Void*, size : LibC::UINT_PTR, initialcrc : UInt32) : UInt32

  # Params # buffer : Void* [In],size : LibC::UINT_PTR [In],initialcrc : UInt64 [In]
  fun RtlCrc64(buffer : Void*, size : LibC::UINT_PTR, initialcrc : UInt64) : UInt64

  # Params # buffer : Void* [In],length : LibC::UINT_PTR [In]
  fun RtlIsZeroMemory(buffer : Void*, length : LibC::UINT_PTR) : BOOLEAN

  # Params # uflags : GLOBAL_ALLOC_FLAGS [In],dwbytes : LibC::UINT_PTR [In]
  fun GlobalAlloc(uflags : GLOBAL_ALLOC_FLAGS, dwbytes : LibC::UINT_PTR) : LibC::IntPtrT

  # Params # hmem : LibC::IntPtrT [In],dwbytes : LibC::UINT_PTR [In],uflags : UInt32 [In]
  fun GlobalReAlloc(hmem : LibC::IntPtrT, dwbytes : LibC::UINT_PTR, uflags : UInt32) : LibC::IntPtrT

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalSize(hmem : LibC::IntPtrT) : LibC::UINT_PTR

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalUnlock(hmem : LibC::IntPtrT) : LibC::BOOL

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalLock(hmem : LibC::IntPtrT) : Void*

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalFlags(hmem : LibC::IntPtrT) : UInt32

  # Params # pmem : Void* [In]
  fun GlobalHandle(pmem : Void*) : LibC::IntPtrT

  # Params # hmem : LibC::IntPtrT [In]
  fun GlobalFree(hmem : LibC::IntPtrT) : LibC::IntPtrT

  # Params # uflags : LOCAL_ALLOC_FLAGS [In],ubytes : LibC::UINT_PTR [In]
  fun LocalAlloc(uflags : LOCAL_ALLOC_FLAGS, ubytes : LibC::UINT_PTR) : LibC::IntPtrT

  # Params # hmem : LibC::IntPtrT [In],ubytes : LibC::UINT_PTR [In],uflags : UInt32 [In]
  fun LocalReAlloc(hmem : LibC::IntPtrT, ubytes : LibC::UINT_PTR, uflags : UInt32) : LibC::IntPtrT

  # Params # hmem : LibC::IntPtrT [In]
  fun LocalLock(hmem : LibC::IntPtrT) : Void*

  # Params # pmem : Void* [In]
  fun LocalHandle(pmem : Void*) : LibC::IntPtrT

  # Params # hmem : LibC::IntPtrT [In]
  fun LocalUnlock(hmem : LibC::IntPtrT) : LibC::BOOL

  # Params # hmem : LibC::IntPtrT [In]
  fun LocalSize(hmem : LibC::IntPtrT) : LibC::UINT_PTR

  # Params # hmem : LibC::IntPtrT [In]
  fun LocalFlags(hmem : LibC::IntPtrT) : UInt32

  # Params # hmem : LibC::IntPtrT [In]
  fun LocalFree(hmem : LibC::IntPtrT) : LibC::IntPtrT

  # Params # hfile : LibC::HANDLE [In],lpfilemappingattributes : SECURITY_ATTRIBUTES* [In],flprotect : PAGE_PROTECTION_FLAGS [In],dwmaximumsizehigh : UInt32 [In],dwmaximumsizelow : UInt32 [In],lpname : PSTR [In]
  fun CreateFileMappingA(hfile : LibC::HANDLE, lpfilemappingattributes : SECURITY_ATTRIBUTES*, flprotect : PAGE_PROTECTION_FLAGS, dwmaximumsizehigh : UInt32, dwmaximumsizelow : UInt32, lpname : PSTR) : LibC::HANDLE

  # Params # hfile : LibC::HANDLE [In],lpfilemappingattributes : SECURITY_ATTRIBUTES* [In],flprotect : PAGE_PROTECTION_FLAGS [In],dwmaximumsizehigh : UInt32 [In],dwmaximumsizelow : UInt32 [In],lpname : PSTR [In],nndpreferred : UInt32 [In]
  fun CreateFileMappingNumaA(hfile : LibC::HANDLE, lpfilemappingattributes : SECURITY_ATTRIBUTES*, flprotect : PAGE_PROTECTION_FLAGS, dwmaximumsizehigh : UInt32, dwmaximumsizelow : UInt32, lpname : PSTR, nndpreferred : UInt32) : LibC::HANDLE

  # Params # dwdesiredaccess : UInt32 [In],binherithandle : LibC::BOOL [In],lpname : PSTR [In]
  fun OpenFileMappingA(dwdesiredaccess : UInt32, binherithandle : LibC::BOOL, lpname : PSTR) : LibC::HANDLE

  # Params # hfilemappingobject : LibC::HANDLE [In],dwdesiredaccess : FILE_MAP [In],dwfileoffsethigh : UInt32 [In],dwfileoffsetlow : UInt32 [In],dwnumberofbytestomap : LibC::UINT_PTR [In],lpbaseaddress : Void* [In],nndpreferred : UInt32 [In]
  fun MapViewOfFileExNuma(hfilemappingobject : LibC::HANDLE, dwdesiredaccess : FILE_MAP, dwfileoffsethigh : UInt32, dwfileoffsetlow : UInt32, dwnumberofbytestomap : LibC::UINT_PTR, lpbaseaddress : Void*, nndpreferred : UInt32) : Void*

  # Params # lp : Void* [In],ucb : LibC::UINT_PTR [In]
  fun IsBadReadPtr(lp : Void*, ucb : LibC::UINT_PTR) : LibC::BOOL

  # Params # lp : Void* [In],ucb : LibC::UINT_PTR [In]
  fun IsBadWritePtr(lp : Void*, ucb : LibC::UINT_PTR) : LibC::BOOL

  # Params # lpfn : FARPROC [In]
  fun IsBadCodePtr(lpfn : FARPROC) : LibC::BOOL

  # Params # lpsz : PSTR [In],ucchmax : LibC::UINT_PTR [In]
  fun IsBadStringPtrA(lpsz : PSTR, ucchmax : LibC::UINT_PTR) : LibC::BOOL

  # Params # lpsz : LibC::LPWSTR [In],ucchmax : LibC::UINT_PTR [In]
  fun IsBadStringPtrW(lpsz : LibC::LPWSTR, ucchmax : LibC::UINT_PTR) : LibC::BOOL

  # Params # virtualaddresses : Void** [In],numberofpages : LibC::UINT_PTR [In],pagearray : LibC::UINT_PTR* [In]
  fun MapUserPhysicalPagesScatter(virtualaddresses : Void**, numberofpages : LibC::UINT_PTR, pagearray : LibC::UINT_PTR*) : LibC::BOOL

  # Params # pfncallback : PSECURE_MEMORY_CACHE_CALLBACK [In]
  fun AddSecureMemoryCacheCallback(pfncallback : PSECURE_MEMORY_CACHE_CALLBACK) : LibC::BOOL

  # Params # pfncallback : PSECURE_MEMORY_CACHE_CALLBACK [In]
  fun RemoveSecureMemoryCacheCallback(pfncallback : PSECURE_MEMORY_CACHE_CALLBACK) : LibC::BOOL
end
