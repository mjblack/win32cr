require "./../foundation.cr"
require "./../security.cr"

module Win32cr::System::Memory
  extend self
  alias HeapHandle = LibC::IntPtrT
  alias PBAD_MEMORY_CALLBACK_ROUTINE = Proc(Void)

  alias PSECURE_MEMORY_CACHE_CALLBACK = Proc(Void*, LibC::UIntPtrT, Win32cr::Foundation::BOOLEAN)

  FILE_CACHE_MAX_HARD_ENABLE = 1_u32
  FILE_CACHE_MAX_HARD_DISABLE = 2_u32
  FILE_CACHE_MIN_HARD_ENABLE = 4_u32
  FILE_CACHE_MIN_HARD_DISABLE = 8_u32
  MEHC_PATROL_SCRUBBER_PRESENT = 1_u32

  @[Flags]
  enum FILE_MAP : UInt32
    FILE_MAP_WRITE = 2_u32
    FILE_MAP_READ = 4_u32
    FILE_MAP_ALL_ACCESS = 983071_u32
    FILE_MAP_EXECUTE = 32_u32
    FILE_MAP_COPY = 1_u32
    FILE_MAP_RESERVE = 2147483648_u32
    FILE_MAP_TARGETS_INVALID = 1073741824_u32
    FILE_MAP_LARGE_PAGES = 536870912_u32
  end
  @[Flags]
  enum HEAP_FLAGS : UInt32
    HEAP_NONE = 0_u32
    HEAP_NO_SERIALIZE = 1_u32
    HEAP_GROWABLE = 2_u32
    HEAP_GENERATE_EXCEPTIONS = 4_u32
    HEAP_ZERO_MEMORY = 8_u32
    HEAP_REALLOC_IN_PLACE_ONLY = 16_u32
    HEAP_TAIL_CHECKING_ENABLED = 32_u32
    HEAP_FREE_CHECKING_ENABLED = 64_u32
    HEAP_DISABLE_COALESCE_ON_FREE = 128_u32
    HEAP_CREATE_ALIGN_16 = 65536_u32
    HEAP_CREATE_ENABLE_TRACING = 131072_u32
    HEAP_CREATE_ENABLE_EXECUTE = 262144_u32
    HEAP_MAXIMUM_TAG = 4095_u32
    HEAP_PSEUDO_TAG_FLAG = 32768_u32
    HEAP_TAG_SHIFT = 18_u32
    HEAP_CREATE_SEGMENT_HEAP = 256_u32
    HEAP_CREATE_HARDENED = 512_u32
  end
  @[Flags]
  enum PAGE_PROTECTION_FLAGS : UInt32
    PAGE_NOACCESS = 1_u32
    PAGE_READONLY = 2_u32
    PAGE_READWRITE = 4_u32
    PAGE_WRITECOPY = 8_u32
    PAGE_EXECUTE = 16_u32
    PAGE_EXECUTE_READ = 32_u32
    PAGE_EXECUTE_READWRITE = 64_u32
    PAGE_EXECUTE_WRITECOPY = 128_u32
    PAGE_GUARD = 256_u32
    PAGE_NOCACHE = 512_u32
    PAGE_WRITECOMBINE = 1024_u32
    PAGE_GRAPHICS_NOACCESS = 2048_u32
    PAGE_GRAPHICS_READONLY = 4096_u32
    PAGE_GRAPHICS_READWRITE = 8192_u32
    PAGE_GRAPHICS_EXECUTE = 16384_u32
    PAGE_GRAPHICS_EXECUTE_READ = 32768_u32
    PAGE_GRAPHICS_EXECUTE_READWRITE = 65536_u32
    PAGE_GRAPHICS_COHERENT = 131072_u32
    PAGE_GRAPHICS_NOCACHE = 262144_u32
    PAGE_ENCLAVE_THREAD_CONTROL = 2147483648_u32
    PAGE_REVERT_TO_FILE_MAP = 2147483648_u32
    PAGE_TARGETS_NO_UPDATE = 1073741824_u32
    PAGE_TARGETS_INVALID = 1073741824_u32
    PAGE_ENCLAVE_UNVALIDATED = 536870912_u32
    PAGE_ENCLAVE_MASK = 268435456_u32
    PAGE_ENCLAVE_DECOMMIT = 268435456_u32
    PAGE_ENCLAVE_SS_FIRST = 268435457_u32
    PAGE_ENCLAVE_SS_REST = 268435458_u32
    SEC_PARTITION_OWNER_HANDLE = 262144_u32
    SEC_64K_PAGES = 524288_u32
    SEC_FILE = 8388608_u32
    SEC_IMAGE = 16777216_u32
    SEC_PROTECTED_IMAGE = 33554432_u32
    SEC_RESERVE = 67108864_u32
    SEC_COMMIT = 134217728_u32
    SEC_NOCACHE = 268435456_u32
    SEC_WRITECOMBINE = 1073741824_u32
    SEC_LARGE_PAGES = 2147483648_u32
    SEC_IMAGE_NO_EXECUTE = 285212672_u32
  end
  enum UNMAP_VIEW_OF_FILE_FLAGS : UInt32
    MEM_UNMAP_NONE = 0_u32
    MEM_UNMAP_WITH_TRANSIENT_BOOST = 1_u32
    MEM_PRESERVE_PLACEHOLDER = 2_u32
  end
  enum VIRTUAL_FREE_TYPE : UInt32
    MEM_DECOMMIT = 16384_u32
    MEM_RELEASE = 32768_u32
  end
  @[Flags]
  enum VIRTUAL_ALLOCATION_TYPE : UInt32
    MEM_COMMIT = 4096_u32
    MEM_RESERVE = 8192_u32
    MEM_RESET = 524288_u32
    MEM_RESET_UNDO = 16777216_u32
    MEM_REPLACE_PLACEHOLDER = 16384_u32
    MEM_LARGE_PAGES = 536870912_u32
    MEM_RESERVE_PLACEHOLDER = 262144_u32
    MEM_FREE = 65536_u32
  end
  @[Flags]
  enum LOCAL_ALLOC_FLAGS : UInt32
    LHND = 66_u32
    LMEM_FIXED = 0_u32
    LMEM_MOVEABLE = 2_u32
    LMEM_ZEROINIT = 64_u32
    LPTR = 64_u32
    NONZEROLHND = 2_u32
    NONZEROLPTR = 0_u32
  end
  @[Flags]
  enum GLOBAL_ALLOC_FLAGS : UInt32
    GHND = 66_u32
    GMEM_FIXED = 0_u32
    GMEM_MOVEABLE = 2_u32
    GMEM_ZEROINIT = 64_u32
    GPTR = 64_u32
  end
  @[Flags]
  enum PAGE_TYPE : UInt32
    MEM_PRIVATE = 131072_u32
    MEM_MAPPED = 262144_u32
    MEM_IMAGE = 16777216_u32
  end
  enum MEMORY_RESOURCE_NOTIFICATION_TYPE
    LowMemoryResourceNotification = 0_i32
    HighMemoryResourceNotification = 1_i32
  end
  enum OFFER_PRIORITY
    VmOfferPriorityVeryLow = 1_i32
    VmOfferPriorityLow = 2_i32
    VmOfferPriorityBelowNormal = 3_i32
    VmOfferPriorityNormal = 4_i32
  end
  enum WIN32_MEMORY_INFORMATION_CLASS
    MemoryRegionInfo = 0_i32
  end
  enum WIN32_MEMORY_PARTITION_INFORMATION_CLASS
    MemoryPartitionInfo = 0_i32
    MemoryPartitionDedicatedMemoryInfo = 1_i32
  end
  enum MEM_EXTENDED_PARAMETER_TYPE
    MemExtendedParameterInvalidType = 0_i32
    MemExtendedParameterAddressRequirements = 1_i32
    MemExtendedParameterNumaNode = 2_i32
    MemExtendedParameterPartitionHandle = 3_i32
    MemExtendedParameterUserPhysicalHandle = 4_i32
    MemExtendedParameterAttributeFlags = 5_i32
    MemExtendedParameterImageMachine = 6_i32
    MemExtendedParameterMax = 7_i32
  end
  enum HEAP_INFORMATION_CLASS
    HeapCompatibilityInformation = 0_i32
    HeapEnableTerminationOnCorruption = 1_i32
    HeapOptimizeResources = 3_i32
    HeapTag = 7_i32
  end

  @[Extern]
  struct PROCESS_HEAP_ENTRY
    property lpData : Void*
    property cbData : UInt32
    property cbOverhead : UInt8
    property iRegionIndex : UInt8
    property wFlags : UInt16
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property block : Block_e__Struct_
    property region : Region_e__Struct_

      # Nested Type Region_e__Struct_
      @[Extern]
      struct Region_e__Struct_
    property dwCommittedSize : UInt32
    property dwUnCommittedSize : UInt32
    property lpFirstBlock : Void*
    property lpLastBlock : Void*
    def initialize(@dwCommittedSize : UInt32, @dwUnCommittedSize : UInt32, @lpFirstBlock : Void*, @lpLastBlock : Void*)
    end
      end


      # Nested Type Block_e__Struct_
      @[Extern]
      struct Block_e__Struct_
    property hMem : Win32cr::Foundation::HANDLE
    property dwReserved : UInt32[3]
    def initialize(@hMem : Win32cr::Foundation::HANDLE, @dwReserved : UInt32[3])
    end
      end

    def initialize(@block : Block_e__Struct_, @region : Region_e__Struct_)
    end
    end

    def initialize(@lpData : Void*, @cbData : UInt32, @cbOverhead : UInt8, @iRegionIndex : UInt8, @wFlags : UInt16, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct HEAP_SUMMARY
    property cb : UInt32
    property cbAllocated : LibC::UIntPtrT
    property cbCommitted : LibC::UIntPtrT
    property cbReserved : LibC::UIntPtrT
    property cbMaxReserve : LibC::UIntPtrT
    def initialize(@cb : UInt32, @cbAllocated : LibC::UIntPtrT, @cbCommitted : LibC::UIntPtrT, @cbReserved : LibC::UIntPtrT, @cbMaxReserve : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct WIN32_MEMORY_RANGE_ENTRY
    property virtual_address : Void*
    property number_of_bytes : LibC::UIntPtrT
    def initialize(@virtual_address : Void*, @number_of_bytes : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct WIN32_MEMORY_REGION_INFORMATION
    property allocation_base : Void*
    property allocation_protect : UInt32
    property anonymous : Anonymous_e__Union_
    property region_size : LibC::UIntPtrT
    property commit_size : LibC::UIntPtrT

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property flags : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@flags : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@allocation_base : Void*, @allocation_protect : UInt32, @anonymous : Anonymous_e__Union_, @region_size : LibC::UIntPtrT, @commit_size : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct WIN32_MEMORY_PARTITION_INFORMATION
    property flags : UInt32
    property numa_node : UInt32
    property channel : UInt32
    property number_of_numa_nodes : UInt32
    property resident_available_pages : UInt64
    property committed_pages : UInt64
    property commit_limit : UInt64
    property peak_commitment : UInt64
    property total_number_of_pages : UInt64
    property available_pages : UInt64
    property zero_pages : UInt64
    property free_pages : UInt64
    property standby_pages : UInt64
    property reserved : UInt64[16]
    property maximum_commit_limit : UInt64
    property reserved2 : UInt64
    property partition_id : UInt32
    def initialize(@flags : UInt32, @numa_node : UInt32, @channel : UInt32, @number_of_numa_nodes : UInt32, @resident_available_pages : UInt64, @committed_pages : UInt64, @commit_limit : UInt64, @peak_commitment : UInt64, @total_number_of_pages : UInt64, @available_pages : UInt64, @zero_pages : UInt64, @free_pages : UInt64, @standby_pages : UInt64, @reserved : UInt64[16], @maximum_commit_limit : UInt64, @reserved2 : UInt64, @partition_id : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct MEMORY_BASIC_INFORMATION
    property base_address : Void*
    property allocation_base : Void*
    property allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property partition_id : UInt16
    property region_size : LibC::UIntPtrT
    property state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE
    property protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property type__ : Win32cr::System::Memory::PAGE_TYPE
    def initialize(@base_address : Void*, @allocation_base : Void*, @allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @partition_id : UInt16, @region_size : LibC::UIntPtrT, @state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, @protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @type__ : Win32cr::System::Memory::PAGE_TYPE)
    end
  end
  {% end %}

  @[Extern]
  struct MEMORY_BASIC_INFORMATION32
    property base_address : UInt32
    property allocation_base : UInt32
    property allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property region_size : UInt32
    property state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE
    property protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property type__ : Win32cr::System::Memory::PAGE_TYPE
    def initialize(@base_address : UInt32, @allocation_base : UInt32, @allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @region_size : UInt32, @state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, @protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @type__ : Win32cr::System::Memory::PAGE_TYPE)
    end
  end

  @[Extern]
  struct MEMORY_BASIC_INFORMATION64
    property base_address : UInt64
    property allocation_base : UInt64
    property allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property __alignment1 : UInt32
    property region_size : UInt64
    property state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE
    property protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property type__ : Win32cr::System::Memory::PAGE_TYPE
    property __alignment2 : UInt32
    def initialize(@base_address : UInt64, @allocation_base : UInt64, @allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @__alignment1 : UInt32, @region_size : UInt64, @state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, @protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @type__ : Win32cr::System::Memory::PAGE_TYPE, @__alignment2 : UInt32)
    end
  end

  @[Extern]
  struct CFG_CALL_TARGET_INFO
    property offset : LibC::UIntPtrT
    property flags : LibC::UIntPtrT
    def initialize(@offset : LibC::UIntPtrT, @flags : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct MEM_ADDRESS_REQUIREMENTS
    property lowest_starting_address : Void*
    property highest_ending_address : Void*
    property alignment : LibC::UIntPtrT
    def initialize(@lowest_starting_address : Void*, @highest_ending_address : Void*, @alignment : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct MEM_EXTENDED_PARAMETER
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Union_

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property u_long64 : UInt64
    property pointer : Void*
    property size : LibC::UIntPtrT
    property handle : Win32cr::Foundation::HANDLE
    property u_long : UInt32
    def initialize(@u_long64 : UInt64, @pointer : Void*, @size : LibC::UIntPtrT, @handle : Win32cr::Foundation::HANDLE, @u_long : UInt32)
    end
    end


    # Nested Type Anonymous1_e__Struct_
    @[Extern]
    struct Anonymous1_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Union_)
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct MEMORY_BASIC_INFORMATION
    property base_address : Void*
    property allocation_base : Void*
    property allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property region_size : LibC::UIntPtrT
    property state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE
    property protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS
    property type__ : Win32cr::System::Memory::PAGE_TYPE
    def initialize(@base_address : Void*, @allocation_base : Void*, @allocation_protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @region_size : LibC::UIntPtrT, @state : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, @protect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, @type__ : Win32cr::System::Memory::PAGE_TYPE)
    end
  end
  {% end %}

  def heapCreate(flOptions : Win32cr::System::Memory::HEAP_FLAGS, dwInitialSize : LibC::UIntPtrT, dwMaximumSize : LibC::UIntPtrT) : Win32cr::System::Memory::HeapHandle
    C.HeapCreate(flOptions, dwInitialSize, dwMaximumSize)
  end

  def heapDestroy(hHeap : Win32cr::System::Memory::HeapHandle) : Win32cr::Foundation::BOOL
    C.HeapDestroy(hHeap)
  end

  #def heapAlloc(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, dwBytes : LibC::UIntPtrT) : Void*
    #C.HeapAlloc(hHeap, dwFlags, dwBytes)
  #end

  #def heapReAlloc(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*, dwBytes : LibC::UIntPtrT) : Void*
    #C.HeapReAlloc(hHeap, dwFlags, lpMem, dwBytes)
  #end

  #def heapFree(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*) : Win32cr::Foundation::BOOL
    #C.HeapFree(hHeap, dwFlags, lpMem)
  #end

  def heapSize(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*) : LibC::UIntPtrT
    C.HeapSize(hHeap, dwFlags, lpMem)
  end

  #def getProcessHeap : Win32cr::System::Memory::HeapHandle
    #C.GetProcessHeap
  #end

  def heapCompact(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS) : LibC::UIntPtrT
    C.HeapCompact(hHeap, dwFlags)
  end

  def heapSetInformation(heap_handle : Win32cr::System::Memory::HeapHandle, heap_information_class : Win32cr::System::Memory::HEAP_INFORMATION_CLASS, heap_information : Void*, heap_information_length : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.HeapSetInformation(heap_handle, heap_information_class, heap_information, heap_information_length)
  end

  def heapValidate(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*) : Win32cr::Foundation::BOOL
    C.HeapValidate(hHeap, dwFlags, lpMem)
  end

  def heapSummary(hHeap : Win32cr::Foundation::HANDLE, dwFlags : UInt32, lpSummary : Win32cr::System::Memory::HEAP_SUMMARY*) : Win32cr::Foundation::BOOL
    C.HeapSummary(hHeap, dwFlags, lpSummary)
  end

  def getProcessHeaps(number_of_heaps : UInt32, process_heaps : Win32cr::System::Memory::HeapHandle*) : UInt32
    C.GetProcessHeaps(number_of_heaps, process_heaps)
  end

  def heapLock(hHeap : Win32cr::System::Memory::HeapHandle) : Win32cr::Foundation::BOOL
    C.HeapLock(hHeap)
  end

  def heapUnlock(hHeap : Win32cr::System::Memory::HeapHandle) : Win32cr::Foundation::BOOL
    C.HeapUnlock(hHeap)
  end

  def heapWalk(hHeap : Win32cr::System::Memory::HeapHandle, lpEntry : Win32cr::System::Memory::PROCESS_HEAP_ENTRY*) : Win32cr::Foundation::BOOL
    C.HeapWalk(hHeap, lpEntry)
  end

  def heapQueryInformation(heap_handle : Win32cr::System::Memory::HeapHandle, heap_information_class : Win32cr::System::Memory::HEAP_INFORMATION_CLASS, heap_information : Void*, heap_information_length : LibC::UIntPtrT, return_length : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.HeapQueryInformation(heap_handle, heap_information_class, heap_information, heap_information_length, return_length)
  end

  #def virtualAlloc(lpAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS) : Void*
    #C.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
  #end

  #def virtualProtect(lpAddress : Void*, dwSize : LibC::UIntPtrT, flNewProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, lpflOldProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS*) : Win32cr::Foundation::BOOL
    #C.VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
  #end

  #def virtualFree(lpAddress : Void*, dwSize : LibC::UIntPtrT, dwFreeType : Win32cr::System::Memory::VIRTUAL_FREE_TYPE) : Win32cr::Foundation::BOOL
    #C.VirtualFree(lpAddress, dwSize, dwFreeType)
  #end

  #def virtualQuery(lpAddress : Void*, lpBuffer : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION*, dwLength : LibC::UIntPtrT) : LibC::UIntPtrT
    #C.VirtualQuery(lpAddress, lpBuffer, dwLength)
  #end

  def virtualAllocEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS) : Void*
    C.VirtualAllocEx(hProcess, lpAddress, dwSize, flAllocationType, flProtect)
  end

  def virtualProtectEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, flNewProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, lpflOldProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS*) : Win32cr::Foundation::BOOL
    C.VirtualProtectEx(hProcess, lpAddress, dwSize, flNewProtect, lpflOldProtect)
  end

  def virtualQueryEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, lpBuffer : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION*, dwLength : LibC::UIntPtrT) : LibC::UIntPtrT
    C.VirtualQueryEx(hProcess, lpAddress, lpBuffer, dwLength)
  end

  def createFileMappingW(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.CreateFileMappingW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName)
  end

  def openFileMappingW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenFileMappingW(dwDesiredAccess, bInheritHandle, lpName)
  end

  def mapViewOfFile(hFileMappingObject : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::System::Memory::FILE_MAP, dwFileOffsetHigh : UInt32, dwFileOffsetLow : UInt32, dwNumberOfBytesToMap : LibC::UIntPtrT) : Void*
    C.MapViewOfFile(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap)
  end

  def mapViewOfFileEx(hFileMappingObject : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::System::Memory::FILE_MAP, dwFileOffsetHigh : UInt32, dwFileOffsetLow : UInt32, dwNumberOfBytesToMap : LibC::UIntPtrT, lpBaseAddress : Void*) : Void*
    C.MapViewOfFileEx(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress)
  end

  def virtualFreeEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, dwFreeType : Win32cr::System::Memory::VIRTUAL_FREE_TYPE) : Win32cr::Foundation::BOOL
    C.VirtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType)
  end

  def flushViewOfFile(lpBaseAddress : Void*, dwNumberOfBytesToFlush : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.FlushViewOfFile(lpBaseAddress, dwNumberOfBytesToFlush)
  end

  def unmapViewOfFile(lpBaseAddress : Void*) : Win32cr::Foundation::BOOL
    C.UnmapViewOfFile(lpBaseAddress)
  end

  def getLargePageMinimum : LibC::UIntPtrT
    C.GetLargePageMinimum
  end

  def getProcessWorkingSetSizeEx(hProcess : Win32cr::Foundation::HANDLE, lpMinimumWorkingSetSize : LibC::UIntPtrT*, lpMaximumWorkingSetSize : LibC::UIntPtrT*, flags : UInt32*) : Win32cr::Foundation::BOOL
    C.GetProcessWorkingSetSizeEx(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize, flags)
  end

  def setProcessWorkingSetSizeEx(hProcess : Win32cr::Foundation::HANDLE, dwMinimumWorkingSetSize : LibC::UIntPtrT, dwMaximumWorkingSetSize : LibC::UIntPtrT, flags : UInt32) : Win32cr::Foundation::BOOL
    C.SetProcessWorkingSetSizeEx(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize, flags)
  end

  def virtualLock(lpAddress : Void*, dwSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.VirtualLock(lpAddress, dwSize)
  end

  def virtualUnlock(lpAddress : Void*, dwSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.VirtualUnlock(lpAddress, dwSize)
  end

  def getWriteWatch(dwFlags : UInt32, lpBaseAddress : Void*, dwRegionSize : LibC::UIntPtrT, lpAddresses : Void**, lpdwCount : LibC::UIntPtrT*, lpdwGranularity : UInt32*) : UInt32
    C.GetWriteWatch(dwFlags, lpBaseAddress, dwRegionSize, lpAddresses, lpdwCount, lpdwGranularity)
  end

  def resetWriteWatch(lpBaseAddress : Void*, dwRegionSize : LibC::UIntPtrT) : UInt32
    C.ResetWriteWatch(lpBaseAddress, dwRegionSize)
  end

  def createMemoryResourceNotification(notification_type : Win32cr::System::Memory::MEMORY_RESOURCE_NOTIFICATION_TYPE) : Win32cr::Foundation::HANDLE
    C.CreateMemoryResourceNotification(notification_type)
  end

  def queryMemoryResourceNotification(resource_notification_handle : Win32cr::Foundation::HANDLE, resource_state : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.QueryMemoryResourceNotification(resource_notification_handle, resource_state)
  end

  def getSystemFileCacheSize(lpMinimumFileCacheSize : LibC::UIntPtrT*, lpMaximumFileCacheSize : LibC::UIntPtrT*, lpFlags : UInt32*) : Win32cr::Foundation::BOOL
    C.GetSystemFileCacheSize(lpMinimumFileCacheSize, lpMaximumFileCacheSize, lpFlags)
  end

  def setSystemFileCacheSize(minimum_file_cache_size : LibC::UIntPtrT, maximum_file_cache_size : LibC::UIntPtrT, flags : UInt32) : Win32cr::Foundation::BOOL
    C.SetSystemFileCacheSize(minimum_file_cache_size, maximum_file_cache_size, flags)
  end

  def createFileMappingNumaW(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PWSTR, nndPreferred : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateFileMappingNumaW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred)
  end

  def prefetchVirtualMemory(hProcess : Win32cr::Foundation::HANDLE, number_of_entries : LibC::UIntPtrT, virtual_addresses : Win32cr::System::Memory::WIN32_MEMORY_RANGE_ENTRY*, flags : UInt32) : Win32cr::Foundation::BOOL
    C.PrefetchVirtualMemory(hProcess, number_of_entries, virtual_addresses, flags)
  end

  def createFileMappingFromApp(hFile : Win32cr::Foundation::HANDLE, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, page_protection : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, maximum_size : UInt64, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.CreateFileMappingFromApp(hFile, security_attributes, page_protection, maximum_size, name)
  end

  def mapViewOfFileFromApp(hFileMappingObject : Win32cr::Foundation::HANDLE, desired_access : Win32cr::System::Memory::FILE_MAP, file_offset : UInt64, number_of_bytes_to_map : LibC::UIntPtrT) : Void*
    C.MapViewOfFileFromApp(hFileMappingObject, desired_access, file_offset, number_of_bytes_to_map)
  end

  def unmapViewOfFileEx(base_address : Void*, unmap_flags : Win32cr::System::Memory::UNMAP_VIEW_OF_FILE_FLAGS) : Win32cr::Foundation::BOOL
    C.UnmapViewOfFileEx(base_address, unmap_flags)
  end

  def allocateUserPhysicalPages(hProcess : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.AllocateUserPhysicalPages(hProcess, number_of_pages, page_array)
  end

  def freeUserPhysicalPages(hProcess : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.FreeUserPhysicalPages(hProcess, number_of_pages, page_array)
  end

  def mapUserPhysicalPages(virtual_address : Void*, number_of_pages : LibC::UIntPtrT, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.MapUserPhysicalPages(virtual_address, number_of_pages, page_array)
  end

  def allocateUserPhysicalPagesNuma(hProcess : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*, nndPreferred : UInt32) : Win32cr::Foundation::BOOL
    C.AllocateUserPhysicalPagesNuma(hProcess, number_of_pages, page_array, nndPreferred)
  end

  def virtualAllocExNuma(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, flProtect : UInt32, nndPreferred : UInt32) : Void*
    C.VirtualAllocExNuma(hProcess, lpAddress, dwSize, flAllocationType, flProtect, nndPreferred)
  end

  def getMemoryErrorHandlingCapabilities(capabilities : UInt32*) : Win32cr::Foundation::BOOL
    C.GetMemoryErrorHandlingCapabilities(capabilities)
  end

  def registerBadMemoryNotification(callback : Win32cr::System::Memory::PBAD_MEMORY_CALLBACK_ROUTINE) : Void*
    C.RegisterBadMemoryNotification(callback)
  end

  def unregisterBadMemoryNotification(registration_handle : Void*) : Win32cr::Foundation::BOOL
    C.UnregisterBadMemoryNotification(registration_handle)
  end

  def offerVirtualMemory(virtual_address : Void*, size : LibC::UIntPtrT, priority : Win32cr::System::Memory::OFFER_PRIORITY) : UInt32
    C.OfferVirtualMemory(virtual_address, size, priority)
  end

  def reclaimVirtualMemory(virtual_address : Void*, size : LibC::UIntPtrT) : UInt32
    C.ReclaimVirtualMemory(virtual_address, size)
  end

  def discardVirtualMemory(virtual_address : Void*, size : LibC::UIntPtrT) : UInt32
    C.DiscardVirtualMemory(virtual_address, size)
  end

  def setProcessValidCallTargets(hProcess : Win32cr::Foundation::HANDLE, virtual_address : Void*, region_size : LibC::UIntPtrT, number_of_offsets : UInt32, offset_information : Win32cr::System::Memory::CFG_CALL_TARGET_INFO*) : Win32cr::Foundation::BOOL
    C.SetProcessValidCallTargets(hProcess, virtual_address, region_size, number_of_offsets, offset_information)
  end

  def setProcessValidCallTargetsForMappedView(process : Win32cr::Foundation::HANDLE, virtual_address : Void*, region_size : LibC::UIntPtrT, number_of_offsets : UInt32, offset_information : Win32cr::System::Memory::CFG_CALL_TARGET_INFO*, section : Win32cr::Foundation::HANDLE, expected_file_offset : UInt64) : Win32cr::Foundation::BOOL
    C.SetProcessValidCallTargetsForMappedView(process, virtual_address, region_size, number_of_offsets, offset_information, section, expected_file_offset)
  end

  def virtualAllocFromApp(base_address : Void*, size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, protection : UInt32) : Void*
    C.VirtualAllocFromApp(base_address, size, allocation_type, protection)
  end

  def virtualProtectFromApp(address : Void*, size : LibC::UIntPtrT, new_protection : UInt32, old_protection : UInt32*) : Win32cr::Foundation::BOOL
    C.VirtualProtectFromApp(address, size, new_protection, old_protection)
  end

  def openFileMappingFromApp(desired_access : UInt32, inherit_handle : Win32cr::Foundation::BOOL, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE
    C.OpenFileMappingFromApp(desired_access, inherit_handle, name)
  end

  def queryVirtualMemoryInformation(process : Win32cr::Foundation::HANDLE, virtual_address : Void*, memory_information_class : Win32cr::System::Memory::WIN32_MEMORY_INFORMATION_CLASS, memory_information : Void*, memory_information_size : LibC::UIntPtrT, return_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.QueryVirtualMemoryInformation(process, virtual_address, memory_information_class, memory_information, memory_information_size, return_size)
  end

  def mapViewOfFileNuma2(file_mapping_handle : Win32cr::Foundation::HANDLE, process_handle : Win32cr::Foundation::HANDLE, offset : UInt64, base_address : Void*, view_size : LibC::UIntPtrT, allocation_type : UInt32, page_protection : UInt32, preferred_node : UInt32) : Void*
    C.MapViewOfFileNuma2(file_mapping_handle, process_handle, offset, base_address, view_size, allocation_type, page_protection, preferred_node)
  end

  def unmapViewOfFile2(process : Win32cr::Foundation::HANDLE, base_address : Void*, unmap_flags : Win32cr::System::Memory::UNMAP_VIEW_OF_FILE_FLAGS) : Win32cr::Foundation::BOOL
    C.UnmapViewOfFile2(process, base_address, unmap_flags)
  end

  def virtualUnlockEx(process : Win32cr::Foundation::HANDLE, address : Void*, size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.VirtualUnlockEx(process, address, size)
  end

  def virtualAlloc2(process : Win32cr::Foundation::HANDLE, base_address : Void*, size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*
    C.VirtualAlloc2(process, base_address, size, allocation_type, page_protection, extended_parameters, parameter_count)
  end

  def mapViewOfFile3(file_mapping : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE, base_address : Void*, offset : UInt64, view_size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*
    C.MapViewOfFile3(file_mapping, process, base_address, offset, view_size, allocation_type, page_protection, extended_parameters, parameter_count)
  end

  def virtualAlloc2FromApp(process : Win32cr::Foundation::HANDLE, base_address : Void*, size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*
    C.VirtualAlloc2FromApp(process, base_address, size, allocation_type, page_protection, extended_parameters, parameter_count)
  end

  def mapViewOfFile3FromApp(file_mapping : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE, base_address : Void*, offset : UInt64, view_size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*
    C.MapViewOfFile3FromApp(file_mapping, process, base_address, offset, view_size, allocation_type, page_protection, extended_parameters, parameter_count)
  end

  def createFileMapping2(file : Win32cr::Foundation::HANDLE, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, desired_access : UInt32, page_protection : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, allocation_attributes : UInt32, maximum_size : UInt64, name : Win32cr::Foundation::PWSTR, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateFileMapping2(file, security_attributes, desired_access, page_protection, allocation_attributes, maximum_size, name, extended_parameters, parameter_count)
  end

  def allocateUserPhysicalPages2(object_handle : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, extended_parameter_count : UInt32) : Win32cr::Foundation::BOOL
    C.AllocateUserPhysicalPages2(object_handle, number_of_pages, page_array, extended_parameters, extended_parameter_count)
  end

  def openDedicatedMemoryPartition(partition : Win32cr::Foundation::HANDLE, dedicated_memory_type_id : UInt64, desired_access : UInt32, inherit_handle : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE
    C.OpenDedicatedMemoryPartition(partition, dedicated_memory_type_id, desired_access, inherit_handle)
  end

  def queryPartitionInformation(partition : Win32cr::Foundation::HANDLE, partition_information_class : Win32cr::System::Memory::WIN32_MEMORY_PARTITION_INFORMATION_CLASS, partition_information : Void*, partition_information_length : UInt32) : Win32cr::Foundation::BOOL
    C.QueryPartitionInformation(partition, partition_information_class, partition_information, partition_information_length)
  end

  def rtlCompareMemory(source1 : Void*, source2 : Void*, length : LibC::UIntPtrT) : LibC::UIntPtrT
    C.RtlCompareMemory(source1, source2, length)
  end

  def rtlCrc32(buffer : Void*, size : LibC::UIntPtrT, initial_crc : UInt32) : UInt32
    C.RtlCrc32(buffer, size, initial_crc)
  end

  def rtlCrc64(buffer : Void*, size : LibC::UIntPtrT, initial_crc : UInt64) : UInt64
    C.RtlCrc64(buffer, size, initial_crc)
  end

  def rtlIsZeroMemory(buffer : Void*, length : LibC::UIntPtrT) : Win32cr::Foundation::BOOLEAN
    C.RtlIsZeroMemory(buffer, length)
  end

  def globalAlloc(uFlags : Win32cr::System::Memory::GLOBAL_ALLOC_FLAGS, dwBytes : LibC::UIntPtrT) : LibC::IntPtrT
    C.GlobalAlloc(uFlags, dwBytes)
  end

  def globalReAlloc(hMem : LibC::IntPtrT, dwBytes : LibC::UIntPtrT, uFlags : UInt32) : LibC::IntPtrT
    C.GlobalReAlloc(hMem, dwBytes, uFlags)
  end

  def globalSize(hMem : LibC::IntPtrT) : LibC::UIntPtrT
    C.GlobalSize(hMem)
  end

  def globalUnlock(hMem : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.GlobalUnlock(hMem)
  end

  def globalLock(hMem : LibC::IntPtrT) : Void*
    C.GlobalLock(hMem)
  end

  def globalFlags(hMem : LibC::IntPtrT) : UInt32
    C.GlobalFlags(hMem)
  end

  def globalHandle(pMem : Void*) : LibC::IntPtrT
    C.GlobalHandle(pMem)
  end

  def globalFree(hMem : LibC::IntPtrT) : LibC::IntPtrT
    C.GlobalFree(hMem)
  end

  def localAlloc(uFlags : Win32cr::System::Memory::LOCAL_ALLOC_FLAGS, uBytes : LibC::UIntPtrT) : LibC::IntPtrT
    C.LocalAlloc(uFlags, uBytes)
  end

  def localReAlloc(hMem : LibC::IntPtrT, uBytes : LibC::UIntPtrT, uFlags : UInt32) : LibC::IntPtrT
    C.LocalReAlloc(hMem, uBytes, uFlags)
  end

  def localLock(hMem : LibC::IntPtrT) : Void*
    C.LocalLock(hMem)
  end

  def localHandle(pMem : Void*) : LibC::IntPtrT
    C.LocalHandle(pMem)
  end

  def localUnlock(hMem : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    C.LocalUnlock(hMem)
  end

  def localSize(hMem : LibC::IntPtrT) : LibC::UIntPtrT
    C.LocalSize(hMem)
  end

  def localFlags(hMem : LibC::IntPtrT) : UInt32
    C.LocalFlags(hMem)
  end

  #def localFree(hMem : LibC::IntPtrT) : LibC::IntPtrT
    #C.LocalFree(hMem)
  #end

  def createFileMappingA(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.CreateFileMappingA(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName)
  end

  def createFileMappingNumaA(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PSTR, nndPreferred : UInt32) : Win32cr::Foundation::HANDLE
    C.CreateFileMappingNumaA(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName, nndPreferred)
  end

  def openFileMappingA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE
    C.OpenFileMappingA(dwDesiredAccess, bInheritHandle, lpName)
  end

  def mapViewOfFileExNuma(hFileMappingObject : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::System::Memory::FILE_MAP, dwFileOffsetHigh : UInt32, dwFileOffsetLow : UInt32, dwNumberOfBytesToMap : LibC::UIntPtrT, lpBaseAddress : Void*, nndPreferred : UInt32) : Void*
    C.MapViewOfFileExNuma(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap, lpBaseAddress, nndPreferred)
  end

  def isBadReadPtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.IsBadReadPtr(lp, ucb)
  end

  def isBadWritePtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.IsBadWritePtr(lp, ucb)
  end

  def isBadCodePtr(lpfn : Win32cr::Foundation::FARPROC) : Win32cr::Foundation::BOOL
    C.IsBadCodePtr(lpfn)
  end

  def isBadStringPtrA(lpsz : Win32cr::Foundation::PSTR, ucchMax : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.IsBadStringPtrA(lpsz, ucchMax)
  end

  def isBadStringPtrW(lpsz : Win32cr::Foundation::PWSTR, ucchMax : LibC::UIntPtrT) : Win32cr::Foundation::BOOL
    C.IsBadStringPtrW(lpsz, ucchMax)
  end

  def mapUserPhysicalPagesScatter(virtual_addresses : Void**, number_of_pages : LibC::UIntPtrT, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL
    C.MapUserPhysicalPagesScatter(virtual_addresses, number_of_pages, page_array)
  end

  def addSecureMemoryCacheCallback(pfnCallBack : Win32cr::System::Memory::PSECURE_MEMORY_CACHE_CALLBACK) : Win32cr::Foundation::BOOL
    C.AddSecureMemoryCacheCallback(pfnCallBack)
  end

  def removeSecureMemoryCacheCallback(pfnCallBack : Win32cr::System::Memory::PSECURE_MEMORY_CACHE_CALLBACK) : Win32cr::Foundation::BOOL
    C.RemoveSecureMemoryCacheCallback(pfnCallBack)
  end

  @[Link("kernel32")]
  @[Link("ntdll")]
  lib C
    # :nodoc:
    fun HeapCreate(flOptions : Win32cr::System::Memory::HEAP_FLAGS, dwInitialSize : LibC::UIntPtrT, dwMaximumSize : LibC::UIntPtrT) : Win32cr::System::Memory::HeapHandle

    # :nodoc:
    fun HeapDestroy(hHeap : Win32cr::System::Memory::HeapHandle) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun HeapAlloc(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, dwBytes : LibC::UIntPtrT) : Void*

    # Commented out due to being part of LibC
    # :nodoc:
    #fun HeapReAlloc(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*, dwBytes : LibC::UIntPtrT) : Void*

    # Commented out due to being part of LibC
    # :nodoc:
    #fun HeapFree(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HeapSize(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*) : LibC::UIntPtrT

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetProcessHeap : Win32cr::System::Memory::HeapHandle

    # :nodoc:
    fun HeapCompact(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS) : LibC::UIntPtrT

    # :nodoc:
    fun HeapSetInformation(heap_handle : Win32cr::System::Memory::HeapHandle, heap_information_class : Win32cr::System::Memory::HEAP_INFORMATION_CLASS, heap_information : Void*, heap_information_length : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HeapValidate(hHeap : Win32cr::System::Memory::HeapHandle, dwFlags : Win32cr::System::Memory::HEAP_FLAGS, lpMem : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HeapSummary(hHeap : Win32cr::Foundation::HANDLE, dwFlags : UInt32, lpSummary : Win32cr::System::Memory::HEAP_SUMMARY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetProcessHeaps(number_of_heaps : UInt32, process_heaps : Win32cr::System::Memory::HeapHandle*) : UInt32

    # :nodoc:
    fun HeapLock(hHeap : Win32cr::System::Memory::HeapHandle) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HeapUnlock(hHeap : Win32cr::System::Memory::HeapHandle) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HeapWalk(hHeap : Win32cr::System::Memory::HeapHandle, lpEntry : Win32cr::System::Memory::PROCESS_HEAP_ENTRY*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun HeapQueryInformation(heap_handle : Win32cr::System::Memory::HeapHandle, heap_information_class : Win32cr::System::Memory::HEAP_INFORMATION_CLASS, heap_information : Void*, heap_information_length : LibC::UIntPtrT, return_length : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun VirtualAlloc(lpAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS) : Void*

    # Commented out due to being part of LibC
    # :nodoc:
    #fun VirtualProtect(lpAddress : Void*, dwSize : LibC::UIntPtrT, flNewProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, lpflOldProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun VirtualFree(lpAddress : Void*, dwSize : LibC::UIntPtrT, dwFreeType : Win32cr::System::Memory::VIRTUAL_FREE_TYPE) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun VirtualQuery(lpAddress : Void*, lpBuffer : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION*, dwLength : LibC::UIntPtrT) : LibC::UIntPtrT

    # :nodoc:
    fun VirtualAllocEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS) : Void*

    # :nodoc:
    fun VirtualProtectEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, flNewProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, lpflOldProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualQueryEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, lpBuffer : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION*, dwLength : LibC::UIntPtrT) : LibC::UIntPtrT

    # :nodoc:
    fun CreateFileMappingW(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenFileMappingW(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun MapViewOfFile(hFileMappingObject : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::System::Memory::FILE_MAP, dwFileOffsetHigh : UInt32, dwFileOffsetLow : UInt32, dwNumberOfBytesToMap : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun MapViewOfFileEx(hFileMappingObject : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::System::Memory::FILE_MAP, dwFileOffsetHigh : UInt32, dwFileOffsetLow : UInt32, dwNumberOfBytesToMap : LibC::UIntPtrT, lpBaseAddress : Void*) : Void*

    # :nodoc:
    fun VirtualFreeEx(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, dwFreeType : Win32cr::System::Memory::VIRTUAL_FREE_TYPE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FlushViewOfFile(lpBaseAddress : Void*, dwNumberOfBytesToFlush : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UnmapViewOfFile(lpBaseAddress : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetLargePageMinimum : LibC::UIntPtrT

    # :nodoc:
    fun GetProcessWorkingSetSizeEx(hProcess : Win32cr::Foundation::HANDLE, lpMinimumWorkingSetSize : LibC::UIntPtrT*, lpMaximumWorkingSetSize : LibC::UIntPtrT*, flags : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessWorkingSetSizeEx(hProcess : Win32cr::Foundation::HANDLE, dwMinimumWorkingSetSize : LibC::UIntPtrT, dwMaximumWorkingSetSize : LibC::UIntPtrT, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualLock(lpAddress : Void*, dwSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualUnlock(lpAddress : Void*, dwSize : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetWriteWatch(dwFlags : UInt32, lpBaseAddress : Void*, dwRegionSize : LibC::UIntPtrT, lpAddresses : Void**, lpdwCount : LibC::UIntPtrT*, lpdwGranularity : UInt32*) : UInt32

    # :nodoc:
    fun ResetWriteWatch(lpBaseAddress : Void*, dwRegionSize : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun CreateMemoryResourceNotification(notification_type : Win32cr::System::Memory::MEMORY_RESOURCE_NOTIFICATION_TYPE) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun QueryMemoryResourceNotification(resource_notification_handle : Win32cr::Foundation::HANDLE, resource_state : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSystemFileCacheSize(lpMinimumFileCacheSize : LibC::UIntPtrT*, lpMaximumFileCacheSize : LibC::UIntPtrT*, lpFlags : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSystemFileCacheSize(minimum_file_cache_size : LibC::UIntPtrT, maximum_file_cache_size : LibC::UIntPtrT, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateFileMappingNumaW(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PWSTR, nndPreferred : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun PrefetchVirtualMemory(hProcess : Win32cr::Foundation::HANDLE, number_of_entries : LibC::UIntPtrT, virtual_addresses : Win32cr::System::Memory::WIN32_MEMORY_RANGE_ENTRY*, flags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateFileMappingFromApp(hFile : Win32cr::Foundation::HANDLE, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, page_protection : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, maximum_size : UInt64, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun MapViewOfFileFromApp(hFileMappingObject : Win32cr::Foundation::HANDLE, desired_access : Win32cr::System::Memory::FILE_MAP, file_offset : UInt64, number_of_bytes_to_map : LibC::UIntPtrT) : Void*

    # :nodoc:
    fun UnmapViewOfFileEx(base_address : Void*, unmap_flags : Win32cr::System::Memory::UNMAP_VIEW_OF_FILE_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AllocateUserPhysicalPages(hProcess : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FreeUserPhysicalPages(hProcess : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MapUserPhysicalPages(virtual_address : Void*, number_of_pages : LibC::UIntPtrT, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AllocateUserPhysicalPagesNuma(hProcess : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*, nndPreferred : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualAllocExNuma(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, flAllocationType : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, flProtect : UInt32, nndPreferred : UInt32) : Void*

    # :nodoc:
    fun GetMemoryErrorHandlingCapabilities(capabilities : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterBadMemoryNotification(callback : Win32cr::System::Memory::PBAD_MEMORY_CALLBACK_ROUTINE) : Void*

    # :nodoc:
    fun UnregisterBadMemoryNotification(registration_handle : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OfferVirtualMemory(virtual_address : Void*, size : LibC::UIntPtrT, priority : Win32cr::System::Memory::OFFER_PRIORITY) : UInt32

    # :nodoc:
    fun ReclaimVirtualMemory(virtual_address : Void*, size : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun DiscardVirtualMemory(virtual_address : Void*, size : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun SetProcessValidCallTargets(hProcess : Win32cr::Foundation::HANDLE, virtual_address : Void*, region_size : LibC::UIntPtrT, number_of_offsets : UInt32, offset_information : Win32cr::System::Memory::CFG_CALL_TARGET_INFO*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetProcessValidCallTargetsForMappedView(process : Win32cr::Foundation::HANDLE, virtual_address : Void*, region_size : LibC::UIntPtrT, number_of_offsets : UInt32, offset_information : Win32cr::System::Memory::CFG_CALL_TARGET_INFO*, section : Win32cr::Foundation::HANDLE, expected_file_offset : UInt64) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualAllocFromApp(base_address : Void*, size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, protection : UInt32) : Void*

    # :nodoc:
    fun VirtualProtectFromApp(address : Void*, size : LibC::UIntPtrT, new_protection : UInt32, old_protection : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenFileMappingFromApp(desired_access : UInt32, inherit_handle : Win32cr::Foundation::BOOL, name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun QueryVirtualMemoryInformation(process : Win32cr::Foundation::HANDLE, virtual_address : Void*, memory_information_class : Win32cr::System::Memory::WIN32_MEMORY_INFORMATION_CLASS, memory_information : Void*, memory_information_size : LibC::UIntPtrT, return_size : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MapViewOfFileNuma2(file_mapping_handle : Win32cr::Foundation::HANDLE, process_handle : Win32cr::Foundation::HANDLE, offset : UInt64, base_address : Void*, view_size : LibC::UIntPtrT, allocation_type : UInt32, page_protection : UInt32, preferred_node : UInt32) : Void*

    # :nodoc:
    fun UnmapViewOfFile2(process : Win32cr::Foundation::HANDLE, base_address : Void*, unmap_flags : Win32cr::System::Memory::UNMAP_VIEW_OF_FILE_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualUnlockEx(process : Win32cr::Foundation::HANDLE, address : Void*, size : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun VirtualAlloc2(process : Win32cr::Foundation::HANDLE, base_address : Void*, size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*

    # :nodoc:
    fun MapViewOfFile3(file_mapping : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE, base_address : Void*, offset : UInt64, view_size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*

    # :nodoc:
    fun VirtualAlloc2FromApp(process : Win32cr::Foundation::HANDLE, base_address : Void*, size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*

    # :nodoc:
    fun MapViewOfFile3FromApp(file_mapping : Win32cr::Foundation::HANDLE, process : Win32cr::Foundation::HANDLE, base_address : Void*, offset : UInt64, view_size : LibC::UIntPtrT, allocation_type : Win32cr::System::Memory::VIRTUAL_ALLOCATION_TYPE, page_protection : UInt32, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Void*

    # :nodoc:
    fun CreateFileMapping2(file : Win32cr::Foundation::HANDLE, security_attributes : Win32cr::Security::SECURITY_ATTRIBUTES*, desired_access : UInt32, page_protection : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, allocation_attributes : UInt32, maximum_size : UInt64, name : Win32cr::Foundation::PWSTR, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, parameter_count : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun AllocateUserPhysicalPages2(object_handle : Win32cr::Foundation::HANDLE, number_of_pages : LibC::UIntPtrT*, page_array : LibC::UIntPtrT*, extended_parameters : Win32cr::System::Memory::MEM_EXTENDED_PARAMETER*, extended_parameter_count : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun OpenDedicatedMemoryPartition(partition : Win32cr::Foundation::HANDLE, dedicated_memory_type_id : UInt64, desired_access : UInt32, inherit_handle : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun QueryPartitionInformation(partition : Win32cr::Foundation::HANDLE, partition_information_class : Win32cr::System::Memory::WIN32_MEMORY_PARTITION_INFORMATION_CLASS, partition_information : Void*, partition_information_length : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RtlCompareMemory(source1 : Void*, source2 : Void*, length : LibC::UIntPtrT) : LibC::UIntPtrT

    # :nodoc:
    fun RtlCrc32(buffer : Void*, size : LibC::UIntPtrT, initial_crc : UInt32) : UInt32

    # :nodoc:
    fun RtlCrc64(buffer : Void*, size : LibC::UIntPtrT, initial_crc : UInt64) : UInt64

    # :nodoc:
    fun RtlIsZeroMemory(buffer : Void*, length : LibC::UIntPtrT) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun GlobalAlloc(uFlags : Win32cr::System::Memory::GLOBAL_ALLOC_FLAGS, dwBytes : LibC::UIntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun GlobalReAlloc(hMem : LibC::IntPtrT, dwBytes : LibC::UIntPtrT, uFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun GlobalSize(hMem : LibC::IntPtrT) : LibC::UIntPtrT

    # :nodoc:
    fun GlobalUnlock(hMem : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GlobalLock(hMem : LibC::IntPtrT) : Void*

    # :nodoc:
    fun GlobalFlags(hMem : LibC::IntPtrT) : UInt32

    # :nodoc:
    fun GlobalHandle(pMem : Void*) : LibC::IntPtrT

    # :nodoc:
    fun GlobalFree(hMem : LibC::IntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun LocalAlloc(uFlags : Win32cr::System::Memory::LOCAL_ALLOC_FLAGS, uBytes : LibC::UIntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun LocalReAlloc(hMem : LibC::IntPtrT, uBytes : LibC::UIntPtrT, uFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun LocalLock(hMem : LibC::IntPtrT) : Void*

    # :nodoc:
    fun LocalHandle(pMem : Void*) : LibC::IntPtrT

    # :nodoc:
    fun LocalUnlock(hMem : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LocalSize(hMem : LibC::IntPtrT) : LibC::UIntPtrT

    # :nodoc:
    fun LocalFlags(hMem : LibC::IntPtrT) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun LocalFree(hMem : LibC::IntPtrT) : LibC::IntPtrT

    # :nodoc:
    fun CreateFileMappingA(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CreateFileMappingNumaA(hFile : Win32cr::Foundation::HANDLE, lpFileMappingAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, flProtect : Win32cr::System::Memory::PAGE_PROTECTION_FLAGS, dwMaximumSizeHigh : UInt32, dwMaximumSizeLow : UInt32, lpName : Win32cr::Foundation::PSTR, nndPreferred : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun OpenFileMappingA(dwDesiredAccess : UInt32, bInheritHandle : Win32cr::Foundation::BOOL, lpName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun MapViewOfFileExNuma(hFileMappingObject : Win32cr::Foundation::HANDLE, dwDesiredAccess : Win32cr::System::Memory::FILE_MAP, dwFileOffsetHigh : UInt32, dwFileOffsetLow : UInt32, dwNumberOfBytesToMap : LibC::UIntPtrT, lpBaseAddress : Void*, nndPreferred : UInt32) : Void*

    # :nodoc:
    fun IsBadReadPtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsBadWritePtr(lp : Void*, ucb : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsBadCodePtr(lpfn : Win32cr::Foundation::FARPROC) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsBadStringPtrA(lpsz : Win32cr::Foundation::PSTR, ucchMax : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsBadStringPtrW(lpsz : Win32cr::Foundation::PWSTR, ucchMax : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun MapUserPhysicalPagesScatter(virtual_addresses : Void**, number_of_pages : LibC::UIntPtrT, page_array : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddSecureMemoryCacheCallback(pfnCallBack : Win32cr::System::Memory::PSECURE_MEMORY_CACHE_CALLBACK) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RemoveSecureMemoryCacheCallback(pfnCallBack : Win32cr::System::Memory::PSECURE_MEMORY_CACHE_CALLBACK) : Win32cr::Foundation::BOOL

  end
end