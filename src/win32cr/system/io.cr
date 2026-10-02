require "./../foundation.cr"
require "c/ioapiset"
require "./../libc_bridge.cr"

module Win32cr::System::IO
  extend self
  alias LPOVERLAPPED_COMPLETION_ROUTINE = Proc(UInt32, UInt32, Win32cr::System::IO::OVERLAPPED*, Void)

  alias PIO_APC_ROUTINE = Proc(Void*, Win32cr::System::IO::IO_STATUS_BLOCK*, UInt32, Void)



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

  @[Extern]
  struct IO_STATUS_BLOCK
    property anonymous : Anonymous_e__Union_
    property information : LibC::UIntPtrT

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property status : Win32cr::Foundation::NTSTATUS
    property pointer : Void*
    def initialize(@status : Win32cr::Foundation::NTSTATUS, @pointer : Void*)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @information : LibC::UIntPtrT)
    end
  end

  # Forwards to `LibC.CreateIoCompletionPort`, which Crystal's standard library declares in `c/ioapiset`.
  def createIoCompletionPort(file_handle : Win32cr::Foundation::HANDLE, existing_completion_port : Win32cr::Foundation::HANDLE, completion_key : LibC::UIntPtrT, number_of_concurrent_threads : UInt32) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.CreateIoCompletionPort(Win32cr::LibCBridge.arg(file_handle, ::LibC::HANDLE), Win32cr::LibCBridge.arg(existing_completion_port, ::LibC::HANDLE), Win32cr::LibCBridge.arg(completion_key, Pointer(::LibC::ULong)), Win32cr::LibCBridge.arg(number_of_concurrent_threads, ::LibC::DWORD)), Win32cr::Foundation::HANDLE)
    {% end %}
  end

  def getQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, lpNumberOfBytesTransferred : UInt32*, lpCompletionKey : LibC::UIntPtrT*, lpOverlapped : Win32cr::System::IO::OVERLAPPED**, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetQueuedCompletionStatus(completion_port, lpNumberOfBytesTransferred, lpCompletionKey, lpOverlapped, dwMilliseconds)
    {% end %}
  end

  # Forwards to `LibC.GetQueuedCompletionStatusEx`, which Crystal's standard library declares in `c/ioapiset`.
  def getQueuedCompletionStatusEx(completion_port : Win32cr::Foundation::HANDLE, lpCompletionPortEntries : Win32cr::System::IO::OVERLAPPED_ENTRY*, ulCount : UInt32, ulNumEntriesRemoved : UInt32*, dwMilliseconds : UInt32, fAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.GetQueuedCompletionStatusEx(Win32cr::LibCBridge.arg(completion_port, ::LibC::HANDLE), Win32cr::LibCBridge.arg(lpCompletionPortEntries, Pointer(::LibC::OVERLAPPED_ENTRY)), Win32cr::LibCBridge.arg(ulCount, ::LibC::ULong), Win32cr::LibCBridge.arg(ulNumEntriesRemoved, Pointer(::LibC::ULong)), Win32cr::LibCBridge.arg(dwMilliseconds, ::LibC::DWORD), Win32cr::LibCBridge.arg(fAlertable, ::LibC::BOOL)), Win32cr::Foundation::BOOL)
    {% end %}
  end

  # Forwards to `LibC.PostQueuedCompletionStatus`, which Crystal's standard library declares in `c/ioapiset`.
  def postQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, dwNumberOfBytesTransferred : UInt32, dwCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.PostQueuedCompletionStatus(Win32cr::LibCBridge.arg(completion_port, ::LibC::HANDLE), Win32cr::LibCBridge.arg(dwNumberOfBytesTransferred, ::LibC::DWORD), Win32cr::LibCBridge.arg(dwCompletionKey, ::LibC::ULONG_PTR), Win32cr::LibCBridge.arg(lpOverlapped, Pointer(::LibC::OVERLAPPED))), Win32cr::Foundation::BOOL)
    {% end %}
  end

  # Forwards to `LibC.DeviceIoControl`, which Crystal's standard library declares in `c/ioapiset`.
  def deviceIoControl(hDevice : Win32cr::Foundation::HANDLE, dwIoControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.DeviceIoControl(Win32cr::LibCBridge.arg(hDevice, ::LibC::HANDLE), Win32cr::LibCBridge.arg(dwIoControlCode, ::LibC::DWORD), Win32cr::LibCBridge.arg(lpInBuffer, Pointer(Void)), Win32cr::LibCBridge.arg(nInBufferSize, ::LibC::DWORD), Win32cr::LibCBridge.arg(lpOutBuffer, Pointer(Void)), Win32cr::LibCBridge.arg(nOutBufferSize, ::LibC::DWORD), Win32cr::LibCBridge.arg(lpBytesReturned, Pointer(::LibC::DWORD)), Win32cr::LibCBridge.arg(lpOverlapped, Pointer(::LibC::OVERLAPPED))), Win32cr::Foundation::BOOL)
    {% end %}
  end

  # Forwards to `LibC.GetOverlappedResult`, which Crystal's standard library declares in `c/ioapiset`.
  def getOverlappedResult(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.GetOverlappedResult(Win32cr::LibCBridge.arg(hFile, ::LibC::HANDLE), Win32cr::LibCBridge.arg(lpOverlapped, Pointer(::LibC::OVERLAPPED)), Win32cr::LibCBridge.arg(lpNumberOfBytesTransferred, Pointer(::LibC::DWORD)), Win32cr::LibCBridge.arg(bWait, ::LibC::BOOL)), Win32cr::Foundation::BOOL)
    {% end %}
  end

  # Forwards to `LibC.CancelIoEx`, which Crystal's standard library declares in `c/ioapiset`.
  def cancelIoEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.CancelIoEx(Win32cr::LibCBridge.arg(hFile, ::LibC::HANDLE), Win32cr::LibCBridge.arg(lpOverlapped, Pointer(::LibC::OVERLAPPED))), Win32cr::Foundation::BOOL)
    {% end %}
  end

  # Forwards to `LibC.CancelIo`, which Crystal's standard library declares in `c/ioapiset`.
  def cancelIo(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    Win32cr::LibCBridge.ret(::LibC.CancelIo(Win32cr::LibCBridge.arg(hFile, ::LibC::HANDLE)), Win32cr::Foundation::BOOL)
    {% end %}
  end

  def getOverlappedResultEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetOverlappedResultEx(hFile, lpOverlapped, lpNumberOfBytesTransferred, dwMilliseconds, bAlertable)
    {% end %}
  end

  def cancelSynchronousIo(hThread : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.CancelSynchronousIo(hThread)
    {% end %}
  end

  def bindIoCompletionCallback(file_handle : Win32cr::Foundation::HANDLE, function : Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE, flags : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.BindIoCompletionCallback(file_handle, function, flags)
    {% end %}
  end

  @[Link("kernel32")]
  {% if !flag?(:docs) %}
  lib C
    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun CreateIoCompletionPort(file_handle : Win32cr::Foundation::HANDLE, existing_completion_port : Win32cr::Foundation::HANDLE, completion_key : LibC::UIntPtrT, number_of_concurrent_threads : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, lpNumberOfBytesTransferred : UInt32*, lpCompletionKey : LibC::UIntPtrT*, lpOverlapped : Win32cr::System::IO::OVERLAPPED**, dwMilliseconds : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun GetQueuedCompletionStatusEx(completion_port : Win32cr::Foundation::HANDLE, lpCompletionPortEntries : Win32cr::System::IO::OVERLAPPED_ENTRY*, ulCount : UInt32, ulNumEntriesRemoved : UInt32*, dwMilliseconds : UInt32, fAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun PostQueuedCompletionStatus(completion_port : Win32cr::Foundation::HANDLE, dwNumberOfBytesTransferred : UInt32, dwCompletionKey : LibC::UIntPtrT, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun DeviceIoControl(hDevice : Win32cr::Foundation::HANDLE, dwIoControlCode : UInt32, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesReturned : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun GetOverlappedResult(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, bWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun CancelIoEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC (declared in c/ioapiset)
    # :nodoc:
    #fun CancelIo(hFile : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetOverlappedResultEx(hFile : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*, lpNumberOfBytesTransferred : UInt32*, dwMilliseconds : UInt32, bAlertable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CancelSynchronousIo(hThread : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BindIoCompletionCallback(file_handle : Win32cr::Foundation::HANDLE, function : Win32cr::System::IO::LPOVERLAPPED_COMPLETION_ROUTINE, flags : UInt32) : Win32cr::Foundation::BOOL

  end
  {% end %}
end