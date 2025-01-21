require "./../foundation.cr"

module Win32cr::System::ApplicationVerifier
  alias AVRF_RESOURCE_ENUMERATE_CALLBACK = Proc(Void*, Void*, UInt32*, UInt32)*

  alias AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK = Proc(Win32cr::System::ApplicationVerifier::AVRF_HEAP_ALLOCATION*, Void*, UInt32*, UInt32)*

  alias AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK = Proc(Win32cr::System::ApplicationVerifier::AVRF_HANDLE_OPERATION*, Void*, UInt32*, UInt32)*

  AVRF_MAX_TRACES = 32_u32

  @[Flags]
  enum VERIFIER_ENUM_RESOURCE_FLAGS : UInt32
    AVRF_ENUM_RESOURCES_FLAGS_DONT_RESOLVE_TRACES = 2_u32
    AVRF_ENUM_RESOURCES_FLAGS_SUSPEND = 1_u32
  end
  enum Euserallocationstate
    AllocationStateUnknown = 0_i32
    AllocationStateBusy = 1_i32
    AllocationStateFree = 2_i32
  end
  enum Eheapallocationstate
    HeapFullPageHeap = 1073741824_i32
    HeapMetadata = -2147483648_i32
    HeapStateMask = -65536_i32
  end
  enum Eheapenumerationlevel
    HeapEnumerationEverything = 0_i32
    HeapEnumerationStop = -1_i32
  end
  enum Ehandle_trace_operations
    OperationDbUnused = 0_i32
    OperationDbOPEN = 1_i32
    OperationDbCLOSE = 2_i32
    OperationDbBADREF = 3_i32
  end
  enum Eavrfresourcetypes
    AvrfResourceHeapAllocation = 0_i32
    AvrfResourceHandleTrace = 1_i32
    AvrfResourceMax = 2_i32
  end

  @[Extern]
  record AVRF_BACKTRACE_INFORMATION,
    depth : UInt32,
    index : UInt32,
    return_addresses : UInt64[32]

  @[Extern]
  record AVRF_HEAP_ALLOCATION,
    heap_handle : UInt64,
    user_allocation : UInt64,
    user_allocation_size : UInt64,
    allocation : UInt64,
    allocation_size : UInt64,
    user_allocation_state : UInt32,
    heap_state : UInt32,
    heap_context : UInt64,
    back_trace_information : Win32cr::System::ApplicationVerifier::AVRF_BACKTRACE_INFORMATION*

  @[Extern]
  record AVRF_HANDLE_OPERATION,
    handle : UInt64,
    process_id : UInt32,
    thread_id : UInt32,
    operation_type : UInt32,
    spare0 : UInt32,
    back_trace_information : Win32cr::System::ApplicationVerifier::AVRF_BACKTRACE_INFORMATION

  @[Link("verifier")]
  lib C
    fun VerifierEnumerateResource(process : Win32cr::Foundation::HANDLE, flags : Win32cr::System::ApplicationVerifier::VERIFIER_ENUM_RESOURCE_FLAGS, resource_type : Win32cr::System::ApplicationVerifier::Eavrfresourcetypes, resource_callback : Win32cr::System::ApplicationVerifier::AVRF_RESOURCE_ENUMERATE_CALLBACK, enumeration_context : Void*) : UInt32

  end
end