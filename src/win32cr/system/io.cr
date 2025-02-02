require "./../foundation.cr"

module Win32cr::System::IO
  extend self
  alias LPOVERLAPPED_COMPLETION_ROUTINE = Proc(UInt32, UInt32, Win32cr::System::IO::OVERLAPPED*, Void)



  @[Extern]
  struct OVERLAPPED
    property internal : LibC::UIntPtrT
    property internal_high : LibC::UIntPtrT
    property anonymous : Anonymous_e__Union_
    property hEvent : Win32cr::Foundation::HANDLE

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property pointer : Void*

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property offset : UInt32
    property offset_high : UInt32
    def initialize(@offset : UInt32, @offset_high : UInt32)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @pointer : Void*)
    end
    end

    def initialize(@internal : LibC::UIntPtrT, @internal_high : LibC::UIntPtrT, @anonymous : Anonymous_e__Union_, @hEvent : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct OVERLAPPED_ENTRY
    property lpCompletionKey : LibC::UIntPtrT
    property lpOverlapped : Win32cr::System::IO::OVERLAPPED*
    property internal : LibC::UIntPtrT
    property dwNumberOfBytesTransferred : UInt32
    def initialize(@lpCompletionKey : LibC::UIntPtrT, @lpOverlapped : Win32cr::System::IO::OVERLAPPED*, @internal : LibC::UIntPtrT, @dwNumberOfBytesTransferred : UInt32)
    end
  end

  #def createIoCompletionPort(file_handle : Win32cr::Foundation::HANDLE, existing_completion_port : Win32cr::Foundation::HANDLE, completion_key : LibC::UIntPtrT, number_of_concurrent_threads : UInt32) : Win32cr::Foundation::HANDLE
    #C.CreateIoCompletionPort(file_handle, existing_completion_port, completion_key, number_of_concurrent_threads)
  #end

  def getQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, lpNumberOfBytesTransferred : UInt32*, lpCompletionKey : LibC::UIntPtrT*, lpOverlapped : Win32cr::System::IO::OVERLAPPED**, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL
    C.GetQueuedCompletionStatus(completion_port, lpNumberOfBytesTransferred, lpCompletionKey, lpOverlapped, dwMilliseconds)
  end

  #def getQueuedCompletionStatusEx(completion_port : Win32cr::Foundation::HANDLE, lpCompletionPortEntries : Win32cr::System::IO::OVERLAPPED_ENTRY*, ulCount : UInt32, ulNumEntriesRemoved : UInt32*, dwMilliseconds : UInt32, fAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    #C.GetQueuedCompletionStatusEx(completion_port, lpCompletionPortEntries, ulCount, ulNumEntriesRemoved, dwMilliseconds, fAlertable)
  #end

  #def postQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, dwNumberOfBytesTransferred : UInt32, dwCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    #C.PostQueuedCompletionStatus(completion_port, dwNumberOfBytesTransferred, dwCompletionKey, lpOverlapped)
  #end

  #def deviceIoControl(hDevice : Win32cr::Foundation::HANDLE, dwIoControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    #C.DeviceIoControl(hDevice, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped)
  #end

  #def getOverlappedResult(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    #C.GetOverlappedResult(hFile, lpOverlapped, lpNumberOfBytesTransferred, bWait)
  #end

  #def cancelIoEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    #C.CancelIoEx(hFile, lpOverlapped)
  #end

  #def cancelIo(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    #C.CancelIo(hFile)
  #end

  def getOverlappedResultEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.GetOverlappedResultEx(hFile, lpOverlapped, lpNumberOfBytesTransferred, dwMilliseconds, bAlertable)
  end

  def cancelSynchronousIo(hThread : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.CancelSynchronousIo(hThread)
  end

  def bindIoCompletionCallback(file_handle : Win32cr::Foundation::HANDLE, function : Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE, flags : UInt32) : Win32cr::Foundation::BOOL
    C.BindIoCompletionCallback(file_handle, function, flags)
  end

  @[Link("kernel32")]
  lib C
    # Commented out due to being part of LibC
    # :nodoc:
    #fun CreateIoCompletionPort(file_handle : Win32cr::Foundation::HANDLE, existing_completion_port : Win32cr::Foundation::HANDLE, completion_key : LibC::UIntPtrT, number_of_concurrent_threads : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, lpNumberOfBytesTransferred : UInt32*, lpCompletionKey : LibC::UIntPtrT*, lpOverlapped : Win32cr::System::IO::OVERLAPPED**, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetQueuedCompletionStatusEx(completion_port : Win32cr::Foundation::HANDLE, lpCompletionPortEntries : Win32cr::System::IO::OVERLAPPED_ENTRY*, ulCount : UInt32, ulNumEntriesRemoved : UInt32*, dwMilliseconds : UInt32, fAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun PostQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, dwNumberOfBytesTransferred : UInt32, dwCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun DeviceIoControl(hDevice : Win32cr::Foundation::HANDLE, dwIoControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetOverlappedResult(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CancelIoEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CancelIo(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetOverlappedResultEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CancelSynchronousIo(hThread : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BindIoCompletionCallback(file_handle : Win32cr::Foundation::HANDLE, function : Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE, flags : UInt32) : Win32cr::Foundation::BOOL

  end
end