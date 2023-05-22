require "../../foundation.cr"
require "../../system/memory.cr"
require "../../system/diagnostics/debug.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  alias HPSS = LibC::IntPtrT
  alias HPSSWALK = LibC::IntPtrT

  PSS_PERF_RESOLUTION = 1000000_u32


  enum PSS_HANDLE_FLAGS : UInt32
    PSS_HANDLE_NONE = 0
    PSS_HANDLE_HAVE_TYPE = 1
    PSS_HANDLE_HAVE_NAME = 2
    PSS_HANDLE_HAVE_BASIC_INFORMATION = 4
    PSS_HANDLE_HAVE_TYPE_SPECIFIC_INFORMATION = 8
  end

  enum PSS_OBJECT_TYPE : Int32
    PSS_OBJECT_TYPE_UNKNOWN = 0
    PSS_OBJECT_TYPE_PROCESS = 1
    PSS_OBJECT_TYPE_THREAD = 2
    PSS_OBJECT_TYPE_MUTANT = 3
    PSS_OBJECT_TYPE_EVENT = 4
    PSS_OBJECT_TYPE_SECTION = 5
    PSS_OBJECT_TYPE_SEMAPHORE = 6
  end

  enum PSS_CAPTURE_FLAGS : UInt32
    PSS_CAPTURE_NONE = 0
    PSS_CAPTURE_VA_CLONE = 1
    PSS_CAPTURE_RESERVED_00000002 = 2
    PSS_CAPTURE_HANDLES = 4
    PSS_CAPTURE_HANDLE_NAME_INFORMATION = 8
    PSS_CAPTURE_HANDLE_BASIC_INFORMATION = 16
    PSS_CAPTURE_HANDLE_TYPE_SPECIFIC_INFORMATION = 32
    PSS_CAPTURE_HANDLE_TRACE = 64
    PSS_CAPTURE_THREADS = 128
    PSS_CAPTURE_THREAD_CONTEXT = 256
    PSS_CAPTURE_THREAD_CONTEXT_EXTENDED = 512
    PSS_CAPTURE_RESERVED_00000400 = 1024
    PSS_CAPTURE_VA_SPACE = 2048
    PSS_CAPTURE_VA_SPACE_SECTION_INFORMATION = 4096
    PSS_CAPTURE_IPT_TRACE = 8192
    PSS_CAPTURE_RESERVED_00004000 = 16384
    PSS_CREATE_BREAKAWAY_OPTIONAL = 67108864
    PSS_CREATE_BREAKAWAY = 134217728
    PSS_CREATE_FORCE_BREAKAWAY = 268435456
    PSS_CREATE_USE_VM_ALLOCATIONS = 536870912
    PSS_CREATE_MEASURE_PERFORMANCE = 1073741824
    PSS_CREATE_RELEASE_SECTION = 2147483648
  end

  enum PSS_QUERY_INFORMATION_CLASS : Int32
    PSS_QUERY_PROCESS_INFORMATION = 0
    PSS_QUERY_VA_CLONE_INFORMATION = 1
    PSS_QUERY_AUXILIARY_PAGES_INFORMATION = 2
    PSS_QUERY_VA_SPACE_INFORMATION = 3
    PSS_QUERY_HANDLE_INFORMATION = 4
    PSS_QUERY_THREAD_INFORMATION = 5
    PSS_QUERY_HANDLE_TRACE_INFORMATION = 6
    PSS_QUERY_PERFORMANCE_COUNTERS = 7
  end

  enum PSS_WALK_INFORMATION_CLASS : Int32
    PSS_WALK_AUXILIARY_PAGES = 0
    PSS_WALK_VA_SPACE = 1
    PSS_WALK_HANDLES = 2
    PSS_WALK_THREADS = 3
  end

  enum PSS_DUPLICATE_FLAGS : UInt32
    PSS_DUPLICATE_NONE = 0
    PSS_DUPLICATE_CLOSE_SOURCE = 1
  end

  enum PSS_PROCESS_FLAGS : UInt32
    PSS_PROCESS_FLAGS_NONE = 0
    PSS_PROCESS_FLAGS_PROTECTED = 1
    PSS_PROCESS_FLAGS_WOW64 = 2
    PSS_PROCESS_FLAGS_RESERVED_03 = 4
    PSS_PROCESS_FLAGS_RESERVED_04 = 8
    PSS_PROCESS_FLAGS_FROZEN = 16
  end

  enum PSS_THREAD_FLAGS : UInt32
    PSS_THREAD_FLAGS_NONE = 0
    PSS_THREAD_FLAGS_TERMINATED = 1
  end

union PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union
  process : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Process_e__Struct
  thread : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Thread_e__Struct
  mutant : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Mutant_e__Struct
  event : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Event_e__Struct
  section : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Section_e__Struct
  semaphore : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Semaphore_e__Struct
end

  struct PSS_PROCESS_INFORMATION
    exit_status : UInt32
    peb_base_address : Void*
    affinity_mask : LibC::UINT_PTR
    base_priority : Int32
    process_id : UInt32
    parent_process_id : UInt32
    flags : PSS_PROCESS_FLAGS
    create_time : FILETIME
    exit_time : FILETIME
    kernel_time : FILETIME
    user_time : FILETIME
    priority_class : UInt32
    peak_virtual_size : LibC::UINT_PTR
    virtual_size : LibC::UINT_PTR
    page_fault_count : UInt32
    peak_working_set_size : LibC::UINT_PTR
    working_set_size : LibC::UINT_PTR
    quota_peak_paged_pool_usage : LibC::UINT_PTR
    quota_paged_pool_usage : LibC::UINT_PTR
    quota_peak_non_paged_pool_usage : LibC::UINT_PTR
    quota_non_paged_pool_usage : LibC::UINT_PTR
    pagefile_usage : LibC::UINT_PTR
    peak_pagefile_usage : LibC::UINT_PTR
    private_usage : LibC::UINT_PTR
    execute_flags : UInt32
    image_file_name : Char[260]*
  end
  struct PSS_VA_CLONE_INFORMATION
    va_clone_handle : LibC::HANDLE
  end
  struct PSS_AUXILIARY_PAGES_INFORMATION
    aux_pages_captured : UInt32
  end
  struct PSS_VA_SPACE_INFORMATION
    region_count : UInt32
  end
  struct PSS_HANDLE_INFORMATION
    handles_captured : UInt32
  end
  struct PSS_THREAD_INFORMATION
    threads_captured : UInt32
    context_length : UInt32
  end
  struct PSS_HANDLE_TRACE_INFORMATION
    section_handle : LibC::HANDLE
    size : UInt32
  end
  struct PSS_PERFORMANCE_COUNTERS
    total_cycle_count : UInt64
    total_wall_clock_period : UInt64
    va_clone_cycle_count : UInt64
    va_clone_wall_clock_period : UInt64
    va_space_cycle_count : UInt64
    va_space_wall_clock_period : UInt64
    aux_pages_cycle_count : UInt64
    aux_pages_wall_clock_period : UInt64
    handles_cycle_count : UInt64
    handles_wall_clock_period : UInt64
    threads_cycle_count : UInt64
    threads_wall_clock_period : UInt64
  end
  struct PSS_AUXILIARY_PAGE_ENTRY
    address : Void*
    basic_information : MEMORY_BASIC_INFORMATION
    capture_time : FILETIME
    page_contents : Void*
    page_size : UInt32
  end
  struct PSS_VA_SPACE_ENTRY
    base_address : Void*
    allocation_base : Void*
    allocation_protect : UInt32
    region_size : LibC::UINT_PTR
    state : UInt32
    protect : UInt32
    type : UInt32
    time_date_stamp : UInt32
    size_of_image : UInt32
    image_base : Void*
    check_sum : UInt32
    mapped_file_name_length : UInt16
    mapped_file_name : LibC::LPWSTR
  end
  struct PSS_HANDLE_ENTRY
    handle : LibC::HANDLE
    flags : PSS_HANDLE_FLAGS
    object_type : PSS_OBJECT_TYPE
    capture_time : FILETIME
    attributes : UInt32
    granted_access : UInt32
    handle_count : UInt32
    pointer_count : UInt32
    paged_pool_charge : UInt32
    non_paged_pool_charge : UInt32
    creation_time : FILETIME
    type_name_length : UInt16
    type_name : LibC::LPWSTR
    object_name_length : UInt16
    object_name : LibC::LPWSTR
    type_specific_information : PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union
  end
  struct PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Semaphore_e__Struct
    current_count : Int32
    maximum_count : Int32
  end
  struct PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Event_e__Struct
    manual_reset : LibC::BOOL
    signaled : LibC::BOOL
  end
  struct PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Thread_e__Struct
    exit_status : UInt32
    teb_base_address : Void*
    process_id : UInt32
    thread_id : UInt32
    affinity_mask : LibC::UINT_PTR
    priority : Int32
    base_priority : Int32
    win32_start_address : Void*
  end
  struct PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Section_e__Struct
    base_address : Void*
    allocation_attributes : UInt32
    maximum_size : LARGE_INTEGER
  end
  struct PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Process_e__Struct
    exit_status : UInt32
    peb_base_address : Void*
    affinity_mask : LibC::UINT_PTR
    base_priority : Int32
    process_id : UInt32
    parent_process_id : UInt32
    flags : UInt32
  end
  struct PSS_HANDLE_ENTRY_TypeSpecificInformation_e__Union_Mutant_e__Struct
    current_count : Int32
    abandoned : LibC::BOOL
    owner_process_id : UInt32
    owner_thread_id : UInt32
  end
  struct PSS_THREAD_ENTRY
    exit_status : UInt32
    teb_base_address : Void*
    process_id : UInt32
    thread_id : UInt32
    affinity_mask : LibC::UINT_PTR
    priority : Int32
    base_priority : Int32
    last_syscall_first_argument : Void*
    last_syscall_number : UInt16
    create_time : FILETIME
    exit_time : FILETIME
    kernel_time : FILETIME
    user_time : FILETIME
    win32_start_address : Void*
    capture_time : FILETIME
    flags : PSS_THREAD_FLAGS
    suspend_count : UInt16
    size_of_context_record : UInt16
    context_record : CONTEXT*
  end
  struct PSS_ALLOCATOR
    context : Void*
    alloc_routine : LibC::IntPtrT
    free_routine : LibC::IntPtrT
  end


  # Params # processhandle : LibC::HANDLE [In],captureflags : PSS_CAPTURE_FLAGS [In],threadcontextflags : UInt32 [In],snapshothandle : HPSS* [In]
  fun PssCaptureSnapshot(processhandle : LibC::HANDLE, captureflags : PSS_CAPTURE_FLAGS, threadcontextflags : UInt32, snapshothandle : HPSS*) : UInt32

  # Params # processhandle : LibC::HANDLE [In],snapshothandle : HPSS [In]
  fun PssFreeSnapshot(processhandle : LibC::HANDLE, snapshothandle : HPSS) : UInt32

  # Params # snapshothandle : HPSS [In],informationclass : PSS_QUERY_INFORMATION_CLASS [In],buffer : Void* [In],bufferlength : UInt32 [In]
  fun PssQuerySnapshot(snapshothandle : HPSS, informationclass : PSS_QUERY_INFORMATION_CLASS, buffer : Void*, bufferlength : UInt32) : UInt32

  # Params # snapshothandle : HPSS [In],informationclass : PSS_WALK_INFORMATION_CLASS [In],walkmarkerhandle : HPSSWALK [In],buffer : Void* [In],bufferlength : UInt32 [In]
  fun PssWalkSnapshot(snapshothandle : HPSS, informationclass : PSS_WALK_INFORMATION_CLASS, walkmarkerhandle : HPSSWALK, buffer : Void*, bufferlength : UInt32) : UInt32

  # Params # sourceprocesshandle : LibC::HANDLE [In],snapshothandle : HPSS [In],targetprocesshandle : LibC::HANDLE [In],targetsnapshothandle : HPSS* [In],flags : PSS_DUPLICATE_FLAGS [In]
  fun PssDuplicateSnapshot(sourceprocesshandle : LibC::HANDLE, snapshothandle : HPSS, targetprocesshandle : LibC::HANDLE, targetsnapshothandle : HPSS*, flags : PSS_DUPLICATE_FLAGS) : UInt32

  # Params # allocator : PSS_ALLOCATOR* [In],walkmarkerhandle : HPSSWALK* [In]
  fun PssWalkMarkerCreate(allocator : PSS_ALLOCATOR*, walkmarkerhandle : HPSSWALK*) : UInt32

  # Params # walkmarkerhandle : HPSSWALK [In]
  fun PssWalkMarkerFree(walkmarkerhandle : HPSSWALK) : UInt32

  # Params # walkmarkerhandle : HPSSWALK [In],position : LibC::UINT_PTR* [In]
  fun PssWalkMarkerGetPosition(walkmarkerhandle : HPSSWALK, position : LibC::UINT_PTR*) : UInt32

  # Params # walkmarkerhandle : HPSSWALK [In],position : LibC::UINT_PTR [In]
  fun PssWalkMarkerSetPosition(walkmarkerhandle : HPSSWALK, position : LibC::UINT_PTR) : UInt32

  # Params # walkmarkerhandle : HPSSWALK [In]
  fun PssWalkMarkerSeekToBeginning(walkmarkerhandle : HPSSWALK) : UInt32
end
