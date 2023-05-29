require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:verifier.dll")]
lib LibWin32
  AVRF_MAX_TRACES = 32_u32

  alias AVRF_RESOURCE_ENUMERATE_CALLBACK = Proc(Void*, Void*, UInt32*, UInt32)
  alias AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK = Proc(AVRF_HEAP_ALLOCATION*, Void*, UInt32*, UInt32)
  alias AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK = Proc(AVRF_HANDLE_OPERATION*, Void*, UInt32*, UInt32)


  enum VERIFIER_ENUM_RESOURCE_FLAGS : UInt32
    AVRF_ENUM_RESOURCES_FLAGS_DONT_RESOLVE_TRACES = 2
    AVRF_ENUM_RESOURCES_FLAGS_SUSPEND = 1
  end

  enum Euserallocationstate : Int32
    AllocationStateUnknown = 0
    AllocationStateBusy = 1
    AllocationStateFree = 2
  end

  enum Eheapallocationstate : Int32
    HeapFullPageHeap = 1073741824
    HeapMetadata = -2147483648
    HeapStateMask = -65536
  end

  enum Eheapenumerationlevel : Int32
    HeapEnumerationEverything = 0
    HeapEnumerationStop = -1
  end

  enum Ehandle_trace_operations : Int32
    OperationDbUnused = 0
    OperationDbOPEN = 1
    OperationDbCLOSE = 2
    OperationDbBADREF = 3
  end

  enum Eavrfresourcetypes : Int32
    AvrfResourceHeapAllocation = 0
    AvrfResourceHandleTrace = 1
    AvrfResourceMax = 2
  end

  struct AVRF_BACKTRACE_INFORMATION
    depth : UInt32
    index : UInt32
    return_addresses : UInt64[32]*
  end
  struct AVRF_HEAP_ALLOCATION
    heap_handle : UInt64
    user_allocation : UInt64
    user_allocation_size : UInt64
    allocation : UInt64
    allocation_size : UInt64
    user_allocation_state : UInt32
    heap_state : UInt32
    heap_context : UInt64
    back_trace_information : AVRF_BACKTRACE_INFORMATION*
  end
  struct AVRF_HANDLE_OPERATION
    handle : UInt64
    process_id : UInt32
    thread_id : UInt32
    operation_type : UInt32
    spare0 : UInt32
    back_trace_information : AVRF_BACKTRACE_INFORMATION
  end


  # Params # process : LibC::HANDLE [In],flags : VERIFIER_ENUM_RESOURCE_FLAGS [In],resourcetype : Eavrfresourcetypes [In],resourcecallback : AVRF_RESOURCE_ENUMERATE_CALLBACK [In],enumerationcontext : Void* [In]
  fun VerifierEnumerateResource(process : LibC::HANDLE, flags : VERIFIER_ENUM_RESOURCE_FLAGS, resourcetype : Eavrfresourcetypes, resourcecallback : AVRF_RESOURCE_ENUMERATE_CALLBACK, enumerationcontext : Void*) : UInt32
end
