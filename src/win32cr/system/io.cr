require "./../foundation.cr"

module Win32cr::System::IO
  alias LPOVERLAPPED_COMPLETION_ROUTINE = Proc(UInt32, UInt32, Win32cr::System::IO::OVERLAPPED*, Void)*



  @[Extern]
  record OVERLAPPED,
    internal : LibC::UIntPtrT,
    internal_high : LibC::UIntPtrT,
    anonymous : Anonymous_e__Union_,
    hEvent : Win32cr::Foundation::HANDLE do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      anonymous : Anonymous_e__Struct_,
      pointer : Void* do

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      record Anonymous_e__Struct_,
        offset : UInt32,
        offset_high : UInt32

    end

  end

  @[Extern]
  record OVERLAPPED_ENTRY,
    lpCompletionKey : LibC::UIntPtrT,
    lpOverlapped : Win32cr::System::IO::OVERLAPPED*,
    internal : LibC::UIntPtrT,
    dwNumberOfBytesTransferred : UInt32

  @[Link("kernel32")]
  lib C
    # Commented out due to being part of LibC
    #fun CreateIoCompletionPort(file_handle : Win32cr::Foundation::HANDLE, existing_completion_port : Win32cr::Foundation::HANDLE, completion_key : LibC::UIntPtrT, number_of_concurrent_threads : UInt32) : Win32cr::Foundation::HANDLE

    fun GetQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, lpNumberOfBytesTransferred : UInt32*, lpCompletionKey : LibC::UIntPtrT*, lpOverlapped : Win32cr::System::IO::OVERLAPPED**, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetQueuedCompletionStatusEx(completion_port : Win32cr::Foundation::HANDLE, lpCompletionPortEntries : Win32cr::System::IO::OVERLAPPED_ENTRY*, ulCount : UInt32, ulNumEntriesRemoved : UInt32*, dwMilliseconds : UInt32, fAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun PostQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, dwNumberOfBytesTransferred : UInt32, dwCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun DeviceIoControl(hDevice : Win32cr::Foundation::HANDLE, dwIoControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetOverlappedResult(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun CancelIoEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun CancelIo(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun GetOverlappedResultEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun CancelSynchronousIo(hThread : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun BindIoCompletionCallback(file_handle : Win32cr::Foundation::HANDLE, function : Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE, flags : UInt32) : Win32cr::Foundation::BOOL

  end
end