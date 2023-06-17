require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  alias LPOVERLAPPED_COMPLETION_ROUTINE = Proc(UInt32, UInt32, OVERLAPPED*, Void)

  union OVERLAPPED_Anonymous_e__Union
    anonymous : OVERLAPPED_Anonymous_e__Union_Anonymous_e__Struct
    pointer : Void*
  end

  struct OVERLAPPED
    internal : LibC::UINT_PTR
    internal_high : LibC::UINT_PTR
    anonymous : OVERLAPPED_Anonymous_e__Union
    h_event : LibC::HANDLE
  end
  struct OVERLAPPED_Anonymous_e__Union_Anonymous_e__Struct
    offset : UInt32
    offset_high : UInt32
  end
  struct OVERLAPPED_ENTRY
    lp_completion_key : LibC::UINT_PTR
    lp_overlapped : OVERLAPPED*
    internal : LibC::UINT_PTR
    dw_number_of_bytes_transferred : UInt32
  end


  # Params # filehandle : LibC::HANDLE [In],existingcompletionport : LibC::HANDLE [In],completionkey : LibC::UINT_PTR [In],numberofconcurrentthreads : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun CreateIoCompletionPort(filehandle : LibC::HANDLE, existingcompletionport : LibC::HANDLE, completionkey : LibC::UINT_PTR, numberofconcurrentthreads : UInt32) : LibC::HANDLE

  # Params # completionport : LibC::HANDLE [In],lpnumberofbytestransferred : UInt32* [In],lpcompletionkey : LibC::UINT_PTR* [In],lpoverlapped : OVERLAPPED** [In],dwmilliseconds : UInt32 [In]
  fun GetQueuedCompletionStatus(completionport : LibC::HANDLE, lpnumberofbytestransferred : UInt32*, lpcompletionkey : LibC::UINT_PTR*, lpoverlapped : OVERLAPPED**, dwmilliseconds : UInt32) : LibC::BOOL

  # Params # completionport : LibC::HANDLE [In],lpcompletionportentries : OVERLAPPED_ENTRY* [In],ulcount : UInt32 [In],ulnumentriesremoved : UInt32* [In],dwmilliseconds : UInt32 [In],falertable : LibC::BOOL [In]
  # Commented out because function is part of Lib C
  #fun GetQueuedCompletionStatusEx(completionport : LibC::HANDLE, lpcompletionportentries : OVERLAPPED_ENTRY*, ulcount : UInt32, ulnumentriesremoved : UInt32*, dwmilliseconds : UInt32, falertable : LibC::BOOL) : LibC::BOOL

  # Params # completionport : LibC::HANDLE [In],dwnumberofbytestransferred : UInt32 [In],dwcompletionkey : LibC::UINT_PTR [In],lpoverlapped : OVERLAPPED* [In]
  fun PostQueuedCompletionStatus(completionport : LibC::HANDLE, dwnumberofbytestransferred : UInt32, dwcompletionkey : LibC::UINT_PTR, lpoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # hdevice : LibC::HANDLE [In],dwiocontrolcode : UInt32 [In],lpinbuffer : Void* [In],ninbuffersize : UInt32 [In],lpoutbuffer : Void* [In],noutbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In],lpoverlapped : OVERLAPPED* [In]
  # Commented out because function is part of Lib C
  #fun DeviceIoControl(hdevice : LibC::HANDLE, dwiocontrolcode : UInt32, lpinbuffer : Void*, ninbuffersize : UInt32, lpoutbuffer : Void*, noutbuffersize : UInt32, lpbytesreturned : UInt32*, lpoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpoverlapped : OVERLAPPED* [In],lpnumberofbytestransferred : UInt32* [In],bwait : LibC::BOOL [In]
  # Commented out because function is part of Lib C
  #fun GetOverlappedResult(hfile : LibC::HANDLE, lpoverlapped : OVERLAPPED*, lpnumberofbytestransferred : UInt32*, bwait : LibC::BOOL) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpoverlapped : OVERLAPPED* [In]
  # Commented out because function is part of Lib C
  #fun CancelIoEx(hfile : LibC::HANDLE, lpoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In]
  # Commented out because function is part of Lib C
  #fun CancelIo(hfile : LibC::HANDLE) : LibC::BOOL

  # Params # hfile : LibC::HANDLE [In],lpoverlapped : OVERLAPPED* [In],lpnumberofbytestransferred : UInt32* [In],dwmilliseconds : UInt32 [In],balertable : LibC::BOOL [In]
  fun GetOverlappedResultEx(hfile : LibC::HANDLE, lpoverlapped : OVERLAPPED*, lpnumberofbytestransferred : UInt32*, dwmilliseconds : UInt32, balertable : LibC::BOOL) : LibC::BOOL

  # Params # hthread : LibC::HANDLE [In]
  fun CancelSynchronousIo(hthread : LibC::HANDLE) : LibC::BOOL

  # Params # filehandle : LibC::HANDLE [In],function : LPOVERLAPPED_COMPLETION_ROUTINE [In],flags : UInt32 [In]
  fun BindIoCompletionCallback(filehandle : LibC::HANDLE, function : LPOVERLAPPED_COMPLETION_ROUTINE, flags : UInt32) : LibC::BOOL
end