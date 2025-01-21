require "./../../foundation.cr"
require "./../memory.cr"
require "./debug.cr"

module Win32cr::System::Diagnostics::ProcessSnapshotting
  alias HPSS = LibC::IntPtrT
  alias HPSSWALK = LibC::IntPtrT
  PSS_PERF_RESOLUTION = 1000000_u32

  @[Flags]
  enum PSS_HANDLE_FLAGS : UInt32
    PSS_HANDLE_NONE = 0_u32
    PSS_HANDLE_HAVE_TYPE = 1_u32
    PSS_HANDLE_HAVE_NAME = 2_u32
    PSS_HANDLE_HAVE_BASIC_INFORMATION = 4_u32
    PSS_HANDLE_HAVE_TYPE_SPECIFIC_INFORMATION = 8_u32
  end
  enum PSS_OBJECT_TYPE
    PSS_OBJECT_TYPE_UNKNOWN = 0_i32
    PSS_OBJECT_TYPE_PROCESS = 1_i32
    PSS_OBJECT_TYPE_THREAD = 2_i32
    PSS_OBJECT_TYPE_MUTANT = 3_i32
    PSS_OBJECT_TYPE_EVENT = 4_i32
    PSS_OBJECT_TYPE_SECTION = 5_i32
    PSS_OBJECT_TYPE_SEMAPHORE = 6_i32
  end
  @[Flags]
  enum PSS_CAPTURE_FLAGS : UInt32
    PSS_CAPTURE_NONE = 0_u32
    PSS_CAPTURE_VA_CLONE = 1_u32
    PSS_CAPTURE_RESERVED_00000002 = 2_u32
    PSS_CAPTURE_HANDLES = 4_u32
    PSS_CAPTURE_HANDLE_NAME_INFORMATION = 8_u32
    PSS_CAPTURE_HANDLE_BASIC_INFORMATION = 16_u32
    PSS_CAPTURE_HANDLE_TYPE_SPECIFIC_INFORMATION = 32_u32
    PSS_CAPTURE_HANDLE_TRACE = 64_u32
    PSS_CAPTURE_THREADS = 128_u32
    PSS_CAPTURE_THREAD_CONTEXT = 256_u32
    PSS_CAPTURE_THREAD_CONTEXT_EXTENDED = 512_u32
    PSS_CAPTURE_RESERVED_00000400 = 1024_u32
    PSS_CAPTURE_VA_SPACE = 2048_u32
    PSS_CAPTURE_VA_SPACE_SECTION_INFORMATION = 4096_u32
    PSS_CAPTURE_IPT_TRACE = 8192_u32
    PSS_CAPTURE_RESERVED_00004000 = 16384_u32
    PSS_CREATE_BREAKAWAY_OPTIONAL = 67108864_u32
    PSS_CREATE_BREAKAWAY = 134217728_u32
    PSS_CREATE_FORCE_BREAKAWAY = 268435456_u32
    PSS_CREATE_USE_VM_ALLOCATIONS = 536870912_u32
    PSS_CREATE_MEASURE_PERFORMANCE = 1073741824_u32
    PSS_CREATE_RELEASE_SECTION = 2147483648_u32
  end
  enum PSS_QUERY_INFORMATION_CLASS
    PSS_QUERY_PROCESS_INFORMATION = 0_i32
    PSS_QUERY_VA_CLONE_INFORMATION = 1_i32
    PSS_QUERY_AUXILIARY_PAGES_INFORMATION = 2_i32
    PSS_QUERY_VA_SPACE_INFORMATION = 3_i32
    PSS_QUERY_HANDLE_INFORMATION = 4_i32
    PSS_QUERY_THREAD_INFORMATION = 5_i32
    PSS_QUERY_HANDLE_TRACE_INFORMATION = 6_i32
    PSS_QUERY_PERFORMANCE_COUNTERS = 7_i32
  end
  enum PSS_WALK_INFORMATION_CLASS
    PSS_WALK_AUXILIARY_PAGES = 0_i32
    PSS_WALK_VA_SPACE = 1_i32
    PSS_WALK_HANDLES = 2_i32
    PSS_WALK_THREADS = 3_i32
  end
  @[Flags]
  enum PSS_DUPLICATE_FLAGS : UInt32
    PSS_DUPLICATE_NONE = 0_u32
    PSS_DUPLICATE_CLOSE_SOURCE = 1_u32
  end
  @[Flags]
  enum PSS_PROCESS_FLAGS : UInt32
    PSS_PROCESS_FLAGS_NONE = 0_u32
    PSS_PROCESS_FLAGS_PROTECTED = 1_u32
    PSS_PROCESS_FLAGS_WOW64 = 2_u32
    PSS_PROCESS_FLAGS_RESERVED_03 = 4_u32
    PSS_PROCESS_FLAGS_RESERVED_04 = 8_u32
    PSS_PROCESS_FLAGS_FROZEN = 16_u32
  end
  @[Flags]
  enum PSS_THREAD_FLAGS : UInt32
    PSS_THREAD_FLAGS_NONE = 0_u32
    PSS_THREAD_FLAGS_TERMINATED = 1_u32
  end

  @[Extern]
  record PSS_PROCESS_INFORMATION,
    exit_status : UInt32,
    peb_base_address : Void*,
    affinity_mask : LibC::UIntPtrT,
    base_priority : Int32,
    process_id : UInt32,
    parent_process_id : UInt32,
    flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_PROCESS_FLAGS,
    create_time : Win32cr::Foundation::FILETIME,
    exit_time : Win32cr::Foundation::FILETIME,
    kernel_time : Win32cr::Foundation::FILETIME,
    user_time : Win32cr::Foundation::FILETIME,
    priority_class : UInt32,
    peak_virtual_size : LibC::UIntPtrT,
    virtual_size : LibC::UIntPtrT,
    page_fault_count : UInt32,
    peak_working_set_size : LibC::UIntPtrT,
    working_set_size : LibC::UIntPtrT,
    quota_peak_paged_pool_usage : LibC::UIntPtrT,
    quota_paged_pool_usage : LibC::UIntPtrT,
    quota_peak_non_paged_pool_usage : LibC::UIntPtrT,
    quota_non_paged_pool_usage : LibC::UIntPtrT,
    pagefile_usage : LibC::UIntPtrT,
    peak_pagefile_usage : LibC::UIntPtrT,
    private_usage : LibC::UIntPtrT,
    execute_flags : UInt32,
    image_file_name : UInt16[260]

  @[Extern]
  record PSS_VA_CLONE_INFORMATION,
    va_clone_handle : Win32cr::Foundation::HANDLE

  @[Extern]
  record PSS_AUXILIARY_PAGES_INFORMATION,
    aux_pages_captured : UInt32

  @[Extern]
  record PSS_VA_SPACE_INFORMATION,
    region_count : UInt32

  @[Extern]
  record PSS_HANDLE_INFORMATION,
    handles_captured : UInt32

  @[Extern]
  record PSS_THREAD_INFORMATION,
    threads_captured : UInt32,
    context_length : UInt32

  @[Extern]
  record PSS_HANDLE_TRACE_INFORMATION,
    section_handle : Win32cr::Foundation::HANDLE,
    size : UInt32

  @[Extern]
  record PSS_PERFORMANCE_COUNTERS,
    total_cycle_count : UInt64,
    total_wall_clock_period : UInt64,
    va_clone_cycle_count : UInt64,
    va_clone_wall_clock_period : UInt64,
    va_space_cycle_count : UInt64,
    va_space_wall_clock_period : UInt64,
    aux_pages_cycle_count : UInt64,
    aux_pages_wall_clock_period : UInt64,
    handles_cycle_count : UInt64,
    handles_wall_clock_period : UInt64,
    threads_cycle_count : UInt64,
    threads_wall_clock_period : UInt64

  @[Extern]
  record PSS_AUXILIARY_PAGE_ENTRY,
    address : Void*,
    basic_information : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION,
    capture_time : Win32cr::Foundation::FILETIME,
    page_contents : Void*,
    page_size : UInt32

  @[Extern]
  record PSS_VA_SPACE_ENTRY,
    base_address : Void*,
    allocation_base : Void*,
    allocation_protect : UInt32,
    region_size : LibC::UIntPtrT,
    state : UInt32,
    protect : UInt32,
    type__ : UInt32,
    time_date_stamp : UInt32,
    size_of_image : UInt32,
    image_base : Void*,
    check_sum : UInt32,
    mapped_file_name_length : UInt16,
    mapped_file_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record PSS_HANDLE_ENTRY,
    handle : Win32cr::Foundation::HANDLE,
    flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_HANDLE_FLAGS,
    object_type : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_OBJECT_TYPE,
    capture_time : Win32cr::Foundation::FILETIME,
    attributes : UInt32,
    granted_access : UInt32,
    handle_count : UInt32,
    pointer_count : UInt32,
    paged_pool_charge : UInt32,
    non_paged_pool_charge : UInt32,
    creation_time : Win32cr::Foundation::FILETIME,
    type_name_length : UInt16,
    type_name : Win32cr::Foundation::PWSTR,
    object_name_length : UInt16,
    object_name : Win32cr::Foundation::PWSTR,
    type_specific_information : TypeSpecificInformation_e__Union_ do

    # Nested Type TypeSpecificInformation_e__Union_
    @[Extern(union: true)]
    record TypeSpecificInformation_e__Union_,
      process : Process_e__Struct_,
      thread : Thread_e__Struct_,
      mutant : Mutant_e__Struct_,
      event : Event_e__Struct_,
      section : Section_e__Struct_,
      semaphore : Semaphore_e__Struct_ do

      # Nested Type Semaphore_e__Struct_
      @[Extern]
      record Semaphore_e__Struct_,
        current_count : Int32,
        maximum_count : Int32


      # Nested Type Event_e__Struct_
      @[Extern]
      record Event_e__Struct_,
        manual_reset : Win32cr::Foundation::BOOL,
        signaled : Win32cr::Foundation::BOOL


      # Nested Type Thread_e__Struct_
      @[Extern]
      record Thread_e__Struct_,
        exit_status : UInt32,
        teb_base_address : Void*,
        process_id : UInt32,
        thread_id : UInt32,
        affinity_mask : LibC::UIntPtrT,
        priority : Int32,
        base_priority : Int32,
        win32_start_address : Void*


      # Nested Type Section_e__Struct_
      @[Extern]
      record Section_e__Struct_,
        base_address : Void*,
        allocation_attributes : UInt32,
        maximum_size : Win32cr::Foundation::LARGE_INTEGER


      # Nested Type Process_e__Struct_
      @[Extern]
      record Process_e__Struct_,
        exit_status : UInt32,
        peb_base_address : Void*,
        affinity_mask : LibC::UIntPtrT,
        base_priority : Int32,
        process_id : UInt32,
        parent_process_id : UInt32,
        flags : UInt32


      # Nested Type Mutant_e__Struct_
      @[Extern]
      record Mutant_e__Struct_,
        current_count : Int32,
        abandoned : Win32cr::Foundation::BOOL,
        owner_process_id : UInt32,
        owner_thread_id : UInt32

    end

  end

  @[Extern]
  record PSS_THREAD_ENTRY,
    exit_status : UInt32,
    teb_base_address : Void*,
    process_id : UInt32,
    thread_id : UInt32,
    affinity_mask : LibC::UIntPtrT,
    priority : Int32,
    base_priority : Int32,
    last_syscall_first_argument : Void*,
    last_syscall_number : UInt16,
    create_time : Win32cr::Foundation::FILETIME,
    exit_time : Win32cr::Foundation::FILETIME,
    kernel_time : Win32cr::Foundation::FILETIME,
    user_time : Win32cr::Foundation::FILETIME,
    win32_start_address : Void*,
    capture_time : Win32cr::Foundation::FILETIME,
    flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_THREAD_FLAGS,
    suspend_count : UInt16,
    size_of_context_record : UInt16,
    context_record : Win32cr::System::Diagnostics::Debug::CONTEXT*

  @[Extern]
  record PSS_ALLOCATOR,
    context : Void*,
    alloc_routine : LibC::IntPtrT,
    free_routine : LibC::IntPtrT

  @[Link("kernel32")]
  lib C
    fun PssCaptureSnapshot(process_handle : Win32cr::Foundation::HANDLE, capture_flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_CAPTURE_FLAGS, thread_context_flags : UInt32, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS*) : UInt32

    fun PssFreeSnapshot(process_handle : Win32cr::Foundation::HANDLE, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS) : UInt32

    fun PssQuerySnapshot(snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, information_class : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_QUERY_INFORMATION_CLASS, buffer : Void*, buffer_length : UInt32) : UInt32

    fun PssWalkSnapshot(snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, information_class : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_WALK_INFORMATION_CLASS, walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, buffer : Void*, buffer_length : UInt32) : UInt32

    fun PssDuplicateSnapshot(source_process_handle : Win32cr::Foundation::HANDLE, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, target_process_handle : Win32cr::Foundation::HANDLE, target_snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS*, flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_DUPLICATE_FLAGS) : UInt32

    fun PssWalkMarkerCreate(allocator : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_ALLOCATOR*, walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK*) : UInt32

    fun PssWalkMarkerFree(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK) : UInt32

    fun PssWalkMarkerGetPosition(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, position : LibC::UIntPtrT*) : UInt32

    fun PssWalkMarkerSetPosition(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, position : LibC::UIntPtrT) : UInt32

    fun PssWalkMarkerSeekToBeginning(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK) : UInt32

  end
end