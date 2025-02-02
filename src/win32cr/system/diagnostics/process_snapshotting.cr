require "./../../foundation.cr"
require "./../memory.cr"
require "./debug.cr"

module Win32cr::System::Diagnostics::ProcessSnapshotting
  extend self
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
  struct PSS_PROCESS_INFORMATION
    property exit_status : UInt32
    property peb_base_address : Void*
    property affinity_mask : LibC::UIntPtrT
    property base_priority : Int32
    property process_id : UInt32
    property parent_process_id : UInt32
    property flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_PROCESS_FLAGS
    property create_time : Win32cr::Foundation::FILETIME
    property exit_time : Win32cr::Foundation::FILETIME
    property kernel_time : Win32cr::Foundation::FILETIME
    property user_time : Win32cr::Foundation::FILETIME
    property priority_class : UInt32
    property peak_virtual_size : LibC::UIntPtrT
    property virtual_size : LibC::UIntPtrT
    property page_fault_count : UInt32
    property peak_working_set_size : LibC::UIntPtrT
    property working_set_size : LibC::UIntPtrT
    property quota_peak_paged_pool_usage : LibC::UIntPtrT
    property quota_paged_pool_usage : LibC::UIntPtrT
    property quota_peak_non_paged_pool_usage : LibC::UIntPtrT
    property quota_non_paged_pool_usage : LibC::UIntPtrT
    property pagefile_usage : LibC::UIntPtrT
    property peak_pagefile_usage : LibC::UIntPtrT
    property private_usage : LibC::UIntPtrT
    property execute_flags : UInt32
    property image_file_name : UInt16[260]
    def initialize(@exit_status : UInt32, @peb_base_address : Void*, @affinity_mask : LibC::UIntPtrT, @base_priority : Int32, @process_id : UInt32, @parent_process_id : UInt32, @flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_PROCESS_FLAGS, @create_time : Win32cr::Foundation::FILETIME, @exit_time : Win32cr::Foundation::FILETIME, @kernel_time : Win32cr::Foundation::FILETIME, @user_time : Win32cr::Foundation::FILETIME, @priority_class : UInt32, @peak_virtual_size : LibC::UIntPtrT, @virtual_size : LibC::UIntPtrT, @page_fault_count : UInt32, @peak_working_set_size : LibC::UIntPtrT, @working_set_size : LibC::UIntPtrT, @quota_peak_paged_pool_usage : LibC::UIntPtrT, @quota_paged_pool_usage : LibC::UIntPtrT, @quota_peak_non_paged_pool_usage : LibC::UIntPtrT, @quota_non_paged_pool_usage : LibC::UIntPtrT, @pagefile_usage : LibC::UIntPtrT, @peak_pagefile_usage : LibC::UIntPtrT, @private_usage : LibC::UIntPtrT, @execute_flags : UInt32, @image_file_name : UInt16[260])
    end
  end

  @[Extern]
  struct PSS_VA_CLONE_INFORMATION
    property va_clone_handle : Win32cr::Foundation::HANDLE
    def initialize(@va_clone_handle : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct PSS_AUXILIARY_PAGES_INFORMATION
    property aux_pages_captured : UInt32
    def initialize(@aux_pages_captured : UInt32)
    end
  end

  @[Extern]
  struct PSS_VA_SPACE_INFORMATION
    property region_count : UInt32
    def initialize(@region_count : UInt32)
    end
  end

  @[Extern]
  struct PSS_HANDLE_INFORMATION
    property handles_captured : UInt32
    def initialize(@handles_captured : UInt32)
    end
  end

  @[Extern]
  struct PSS_THREAD_INFORMATION
    property threads_captured : UInt32
    property context_length : UInt32
    def initialize(@threads_captured : UInt32, @context_length : UInt32)
    end
  end

  @[Extern]
  struct PSS_HANDLE_TRACE_INFORMATION
    property section_handle : Win32cr::Foundation::HANDLE
    property size : UInt32
    def initialize(@section_handle : Win32cr::Foundation::HANDLE, @size : UInt32)
    end
  end

  @[Extern]
  struct PSS_PERFORMANCE_COUNTERS
    property total_cycle_count : UInt64
    property total_wall_clock_period : UInt64
    property va_clone_cycle_count : UInt64
    property va_clone_wall_clock_period : UInt64
    property va_space_cycle_count : UInt64
    property va_space_wall_clock_period : UInt64
    property aux_pages_cycle_count : UInt64
    property aux_pages_wall_clock_period : UInt64
    property handles_cycle_count : UInt64
    property handles_wall_clock_period : UInt64
    property threads_cycle_count : UInt64
    property threads_wall_clock_period : UInt64
    def initialize(@total_cycle_count : UInt64, @total_wall_clock_period : UInt64, @va_clone_cycle_count : UInt64, @va_clone_wall_clock_period : UInt64, @va_space_cycle_count : UInt64, @va_space_wall_clock_period : UInt64, @aux_pages_cycle_count : UInt64, @aux_pages_wall_clock_period : UInt64, @handles_cycle_count : UInt64, @handles_wall_clock_period : UInt64, @threads_cycle_count : UInt64, @threads_wall_clock_period : UInt64)
    end
  end

  @[Extern]
  struct PSS_AUXILIARY_PAGE_ENTRY
    property address : Void*
    property basic_information : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION
    property capture_time : Win32cr::Foundation::FILETIME
    property page_contents : Void*
    property page_size : UInt32
    def initialize(@address : Void*, @basic_information : Win32cr::System::Memory::MEMORY_BASIC_INFORMATION, @capture_time : Win32cr::Foundation::FILETIME, @page_contents : Void*, @page_size : UInt32)
    end
  end

  @[Extern]
  struct PSS_VA_SPACE_ENTRY
    property base_address : Void*
    property allocation_base : Void*
    property allocation_protect : UInt32
    property region_size : LibC::UIntPtrT
    property state : UInt32
    property protect : UInt32
    property type__ : UInt32
    property time_date_stamp : UInt32
    property size_of_image : UInt32
    property image_base : Void*
    property check_sum : UInt32
    property mapped_file_name_length : UInt16
    property mapped_file_name : Win32cr::Foundation::PWSTR
    def initialize(@base_address : Void*, @allocation_base : Void*, @allocation_protect : UInt32, @region_size : LibC::UIntPtrT, @state : UInt32, @protect : UInt32, @type__ : UInt32, @time_date_stamp : UInt32, @size_of_image : UInt32, @image_base : Void*, @check_sum : UInt32, @mapped_file_name_length : UInt16, @mapped_file_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct PSS_HANDLE_ENTRY
    property handle : Win32cr::Foundation::HANDLE
    property flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_HANDLE_FLAGS
    property object_type : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_OBJECT_TYPE
    property capture_time : Win32cr::Foundation::FILETIME
    property attributes : UInt32
    property granted_access : UInt32
    property handle_count : UInt32
    property pointer_count : UInt32
    property paged_pool_charge : UInt32
    property non_paged_pool_charge : UInt32
    property creation_time : Win32cr::Foundation::FILETIME
    property type_name_length : UInt16
    property type_name : Win32cr::Foundation::PWSTR
    property object_name_length : UInt16
    property object_name : Win32cr::Foundation::PWSTR
    property type_specific_information : TypeSpecificInformation_e__Union_

    # Nested Type TypeSpecificInformation_e__Union_
    @[Extern(union: true)]
    struct TypeSpecificInformation_e__Union_
    property process : Process_e__Struct_
    property thread : Thread_e__Struct_
    property mutant : Mutant_e__Struct_
    property event : Event_e__Struct_
    property section : Section_e__Struct_
    property semaphore : Semaphore_e__Struct_

      # Nested Type Semaphore_e__Struct_
      @[Extern]
      struct Semaphore_e__Struct_
    property current_count : Int32
    property maximum_count : Int32
    def initialize(@current_count : Int32, @maximum_count : Int32)
    end
      end


      # Nested Type Event_e__Struct_
      @[Extern]
      struct Event_e__Struct_
    property manual_reset : Win32cr::Foundation::BOOL
    property signaled : Win32cr::Foundation::BOOL
    def initialize(@manual_reset : Win32cr::Foundation::BOOL, @signaled : Win32cr::Foundation::BOOL)
    end
      end


      # Nested Type Thread_e__Struct_
      @[Extern]
      struct Thread_e__Struct_
    property exit_status : UInt32
    property teb_base_address : Void*
    property process_id : UInt32
    property thread_id : UInt32
    property affinity_mask : LibC::UIntPtrT
    property priority : Int32
    property base_priority : Int32
    property win32_start_address : Void*
    def initialize(@exit_status : UInt32, @teb_base_address : Void*, @process_id : UInt32, @thread_id : UInt32, @affinity_mask : LibC::UIntPtrT, @priority : Int32, @base_priority : Int32, @win32_start_address : Void*)
    end
      end


      # Nested Type Section_e__Struct_
      @[Extern]
      struct Section_e__Struct_
    property base_address : Void*
    property allocation_attributes : UInt32
    property maximum_size : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@base_address : Void*, @allocation_attributes : UInt32, @maximum_size : Win32cr::Foundation::LARGE_INTEGER)
    end
      end


      # Nested Type Process_e__Struct_
      @[Extern]
      struct Process_e__Struct_
    property exit_status : UInt32
    property peb_base_address : Void*
    property affinity_mask : LibC::UIntPtrT
    property base_priority : Int32
    property process_id : UInt32
    property parent_process_id : UInt32
    property flags : UInt32
    def initialize(@exit_status : UInt32, @peb_base_address : Void*, @affinity_mask : LibC::UIntPtrT, @base_priority : Int32, @process_id : UInt32, @parent_process_id : UInt32, @flags : UInt32)
    end
      end


      # Nested Type Mutant_e__Struct_
      @[Extern]
      struct Mutant_e__Struct_
    property current_count : Int32
    property abandoned : Win32cr::Foundation::BOOL
    property owner_process_id : UInt32
    property owner_thread_id : UInt32
    def initialize(@current_count : Int32, @abandoned : Win32cr::Foundation::BOOL, @owner_process_id : UInt32, @owner_thread_id : UInt32)
    end
      end

    def initialize(@process : Process_e__Struct_, @thread : Thread_e__Struct_, @mutant : Mutant_e__Struct_, @event : Event_e__Struct_, @section : Section_e__Struct_, @semaphore : Semaphore_e__Struct_)
    end
    end

    def initialize(@handle : Win32cr::Foundation::HANDLE, @flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_HANDLE_FLAGS, @object_type : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_OBJECT_TYPE, @capture_time : Win32cr::Foundation::FILETIME, @attributes : UInt32, @granted_access : UInt32, @handle_count : UInt32, @pointer_count : UInt32, @paged_pool_charge : UInt32, @non_paged_pool_charge : UInt32, @creation_time : Win32cr::Foundation::FILETIME, @type_name_length : UInt16, @type_name : Win32cr::Foundation::PWSTR, @object_name_length : UInt16, @object_name : Win32cr::Foundation::PWSTR, @type_specific_information : TypeSpecificInformation_e__Union_)
    end
  end

  @[Extern]
  struct PSS_THREAD_ENTRY
    property exit_status : UInt32
    property teb_base_address : Void*
    property process_id : UInt32
    property thread_id : UInt32
    property affinity_mask : LibC::UIntPtrT
    property priority : Int32
    property base_priority : Int32
    property last_syscall_first_argument : Void*
    property last_syscall_number : UInt16
    property create_time : Win32cr::Foundation::FILETIME
    property exit_time : Win32cr::Foundation::FILETIME
    property kernel_time : Win32cr::Foundation::FILETIME
    property user_time : Win32cr::Foundation::FILETIME
    property win32_start_address : Void*
    property capture_time : Win32cr::Foundation::FILETIME
    property flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_THREAD_FLAGS
    property suspend_count : UInt16
    property size_of_context_record : UInt16
    property context_record : Win32cr::System::Diagnostics::Debug::CONTEXT*
    def initialize(@exit_status : UInt32, @teb_base_address : Void*, @process_id : UInt32, @thread_id : UInt32, @affinity_mask : LibC::UIntPtrT, @priority : Int32, @base_priority : Int32, @last_syscall_first_argument : Void*, @last_syscall_number : UInt16, @create_time : Win32cr::Foundation::FILETIME, @exit_time : Win32cr::Foundation::FILETIME, @kernel_time : Win32cr::Foundation::FILETIME, @user_time : Win32cr::Foundation::FILETIME, @win32_start_address : Void*, @capture_time : Win32cr::Foundation::FILETIME, @flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_THREAD_FLAGS, @suspend_count : UInt16, @size_of_context_record : UInt16, @context_record : Win32cr::System::Diagnostics::Debug::CONTEXT*)
    end
  end

  @[Extern]
  struct PSS_ALLOCATOR
    property context : Void*
    property alloc_routine : LibC::IntPtrT
    property free_routine : LibC::IntPtrT
    def initialize(@context : Void*, @alloc_routine : LibC::IntPtrT, @free_routine : LibC::IntPtrT)
    end
  end

  def pssCaptureSnapshot(process_handle : Win32cr::Foundation::HANDLE, capture_flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_CAPTURE_FLAGS, thread_context_flags : UInt32, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS*) : UInt32
    C.PssCaptureSnapshot(process_handle, capture_flags, thread_context_flags, snapshot_handle)
  end

  def pssFreeSnapshot(process_handle : Win32cr::Foundation::HANDLE, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS) : UInt32
    C.PssFreeSnapshot(process_handle, snapshot_handle)
  end

  def pssQuerySnapshot(snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, information_class : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_QUERY_INFORMATION_CLASS, buffer : Void*, buffer_length : UInt32) : UInt32
    C.PssQuerySnapshot(snapshot_handle, information_class, buffer, buffer_length)
  end

  def pssWalkSnapshot(snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, information_class : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_WALK_INFORMATION_CLASS, walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, buffer : Void*, buffer_length : UInt32) : UInt32
    C.PssWalkSnapshot(snapshot_handle, information_class, walk_marker_handle, buffer, buffer_length)
  end

  def pssDuplicateSnapshot(source_process_handle : Win32cr::Foundation::HANDLE, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, target_process_handle : Win32cr::Foundation::HANDLE, target_snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS*, flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_DUPLICATE_FLAGS) : UInt32
    C.PssDuplicateSnapshot(source_process_handle, snapshot_handle, target_process_handle, target_snapshot_handle, flags)
  end

  def pssWalkMarkerCreate(allocator : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_ALLOCATOR*, walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK*) : UInt32
    C.PssWalkMarkerCreate(allocator, walk_marker_handle)
  end

  def pssWalkMarkerFree(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK) : UInt32
    C.PssWalkMarkerFree(walk_marker_handle)
  end

  def pssWalkMarkerGetPosition(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, position : LibC::UIntPtrT*) : UInt32
    C.PssWalkMarkerGetPosition(walk_marker_handle, position)
  end

  def pssWalkMarkerSetPosition(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, position : LibC::UIntPtrT) : UInt32
    C.PssWalkMarkerSetPosition(walk_marker_handle, position)
  end

  def pssWalkMarkerSeekToBeginning(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK) : UInt32
    C.PssWalkMarkerSeekToBeginning(walk_marker_handle)
  end

  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun PssCaptureSnapshot(process_handle : Win32cr::Foundation::HANDLE, capture_flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_CAPTURE_FLAGS, thread_context_flags : UInt32, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS*) : UInt32

    # :nodoc:
    fun PssFreeSnapshot(process_handle : Win32cr::Foundation::HANDLE, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS) : UInt32

    # :nodoc:
    fun PssQuerySnapshot(snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, information_class : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_QUERY_INFORMATION_CLASS, buffer : Void*, buffer_length : UInt32) : UInt32

    # :nodoc:
    fun PssWalkSnapshot(snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, information_class : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_WALK_INFORMATION_CLASS, walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, buffer : Void*, buffer_length : UInt32) : UInt32

    # :nodoc:
    fun PssDuplicateSnapshot(source_process_handle : Win32cr::Foundation::HANDLE, snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS, target_process_handle : Win32cr::Foundation::HANDLE, target_snapshot_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSS*, flags : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_DUPLICATE_FLAGS) : UInt32

    # :nodoc:
    fun PssWalkMarkerCreate(allocator : Win32cr::System::Diagnostics::ProcessSnapshotting::PSS_ALLOCATOR*, walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK*) : UInt32

    # :nodoc:
    fun PssWalkMarkerFree(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK) : UInt32

    # :nodoc:
    fun PssWalkMarkerGetPosition(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, position : LibC::UIntPtrT*) : UInt32

    # :nodoc:
    fun PssWalkMarkerSetPosition(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK, position : LibC::UIntPtrT) : UInt32

    # :nodoc:
    fun PssWalkMarkerSeekToBeginning(walk_marker_handle : Win32cr::System::Diagnostics::ProcessSnapshotting::HPSSWALK) : UInt32

  end
end