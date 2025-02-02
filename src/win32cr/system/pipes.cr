require "./../foundation.cr"
require "./../security.cr"
require "./io.cr"
require "./../storage/file_system.cr"

module Win32cr::System::Pipes
  extend self
  PIPE_UNLIMITED_INSTANCES = 255_u32
  NMPWAIT_WAIT_FOREVER = 4294967295_u32
  NMPWAIT_NOWAIT = 1_u32
  NMPWAIT_USE_DEFAULT_WAIT = 0_u32

  @[Flags]
  enum NAMED_PIPE_MODE : UInt32
    PIPE_WAIT = 0_u32
    PIPE_NOWAIT = 1_u32
    PIPE_READMODE_BYTE = 0_u32
    PIPE_READMODE_MESSAGE = 2_u32
    PIPE_CLIENT_END = 0_u32
    PIPE_SERVER_END = 1_u32
    PIPE_TYPE_BYTE = 0_u32
    PIPE_TYPE_MESSAGE = 4_u32
    PIPE_ACCEPT_REMOTE_CLIENTS = 0_u32
    PIPE_REJECT_REMOTE_CLIENTS = 8_u32
  end

  def createPipe(hReadPipe : Win32cr::Foundation::HANDLE*, hWritePipe : Win32cr::Foundation::HANDLE*, lpPipeAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, nSize : UInt32) : Win32cr::Foundation::BOOL
    C.CreatePipe(hReadPipe, hWritePipe, lpPipeAttributes, nSize)
  end

  def connectNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    C.ConnectNamedPipe(hNamedPipe, lpOverlapped)
  end

  def disconnectNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.DisconnectNamedPipe(hNamedPipe)
  end

  def setNamedPipeHandleState(hNamedPipe : Win32cr::Foundation::HANDLE, lpMode : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*) : Win32cr::Foundation::BOOL
    C.SetNamedPipeHandleState(hNamedPipe, lpMode, lpMaxCollectionCount, lpCollectDataTimeout)
  end

  def peekNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nBufferSize : UInt32, lpBytesRead : UInt32*, lpTotalBytesAvail : UInt32*, lpBytesLeftThisMessage : UInt32*) : Win32cr::Foundation::BOOL
    C.PeekNamedPipe(hNamedPipe, lpBuffer, nBufferSize, lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage)
  end

  def transactNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL
    C.TransactNamedPipe(hNamedPipe, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, lpOverlapped)
  end

  def createNamedPipeW(lpName : Win32cr::Foundation::PWSTR, dwOpenMode : Win32cr::Storage::FileSystem::FILE_FLAGS_AND_ATTRIBUTES, dwPipeMode : Win32cr::System::Pipes::NAMED_PIPE_MODE, nMaxInstances : UInt32, nOutBufferSize : UInt32, nInBufferSize : UInt32, nDefaultTimeOut : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE
    C.CreateNamedPipeW(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes)
  end

  def waitNamedPipeW(lpNamedPipeName : Win32cr::Foundation::PWSTR, nTimeOut : UInt32) : Win32cr::Foundation::BOOL
    C.WaitNamedPipeW(lpNamedPipeName, nTimeOut)
  end

  def getNamedPipeClientComputerNameW(pipe : Win32cr::Foundation::HANDLE, client_computer_name : Win32cr::Foundation::PWSTR, client_computer_name_length : UInt32) : Win32cr::Foundation::BOOL
    C.GetNamedPipeClientComputerNameW(pipe, client_computer_name, client_computer_name_length)
  end

  def impersonateNamedPipeClient(hNamedPipe : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.ImpersonateNamedPipeClient(hNamedPipe)
  end

  def getNamedPipeInfo(hNamedPipe : Win32cr::Foundation::HANDLE, lpFlags : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpOutBufferSize : UInt32*, lpInBufferSize : UInt32*, lpMaxInstances : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNamedPipeInfo(hNamedPipe, lpFlags, lpOutBufferSize, lpInBufferSize, lpMaxInstances)
  end

  def getNamedPipeHandleStateW(hNamedPipe : Win32cr::Foundation::HANDLE, lpState : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpCurInstances : UInt32*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*, lpUserName : UInt16*, nMaxUserNameSize : UInt32) : Win32cr::Foundation::BOOL
    C.GetNamedPipeHandleStateW(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize)
  end

  def callNamedPipeW(lpNamedPipeName : Win32cr::Foundation::PWSTR, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, nTimeOut : UInt32) : Win32cr::Foundation::BOOL
    C.CallNamedPipeW(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut)
  end

  #def createNamedPipeA(lpName : Win32cr::Foundation::PSTR, dwOpenMode : Win32cr::Storage::FileSystem::FILE_FLAGS_AND_ATTRIBUTES, dwPipeMode : Win32cr::System::Pipes::NAMED_PIPE_MODE, nMaxInstances : UInt32, nOutBufferSize : UInt32, nInBufferSize : UInt32, nDefaultTimeOut : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE
    #C.CreateNamedPipeA(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes)
  #end

  def getNamedPipeHandleStateA(hNamedPipe : Win32cr::Foundation::HANDLE, lpState : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpCurInstances : UInt32*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*, lpUserName : UInt8*, nMaxUserNameSize : UInt32) : Win32cr::Foundation::BOOL
    C.GetNamedPipeHandleStateA(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout, lpUserName, nMaxUserNameSize)
  end

  def callNamedPipeA(lpNamedPipeName : Win32cr::Foundation::PSTR, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, nTimeOut : UInt32) : Win32cr::Foundation::BOOL
    C.CallNamedPipeA(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut)
  end

  def waitNamedPipeA(lpNamedPipeName : Win32cr::Foundation::PSTR, nTimeOut : UInt32) : Win32cr::Foundation::BOOL
    C.WaitNamedPipeA(lpNamedPipeName, nTimeOut)
  end

  def getNamedPipeClientComputerNameA(pipe : Win32cr::Foundation::HANDLE, client_computer_name : Win32cr::Foundation::PSTR, client_computer_name_length : UInt32) : Win32cr::Foundation::BOOL
    C.GetNamedPipeClientComputerNameA(pipe, client_computer_name, client_computer_name_length)
  end

  def getNamedPipeClientProcessId(pipe : Win32cr::Foundation::HANDLE, client_process_id : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNamedPipeClientProcessId(pipe, client_process_id)
  end

  def getNamedPipeClientSessionId(pipe : Win32cr::Foundation::HANDLE, client_session_id : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNamedPipeClientSessionId(pipe, client_session_id)
  end

  def getNamedPipeServerProcessId(pipe : Win32cr::Foundation::HANDLE, server_process_id : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNamedPipeServerProcessId(pipe, server_process_id)
  end

  def getNamedPipeServerSessionId(pipe : Win32cr::Foundation::HANDLE, server_session_id : UInt32*) : Win32cr::Foundation::BOOL
    C.GetNamedPipeServerSessionId(pipe, server_session_id)
  end

  @[Link("kernel32")]
  @[Link("advapi32")]
  lib C
    # :nodoc:
    fun CreatePipe(hReadPipe : Win32cr::Foundation::HANDLE*, hWritePipe : Win32cr::Foundation::HANDLE*, lpPipeAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, nSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ConnectNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DisconnectNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetNamedPipeHandleState(hNamedPipe : Win32cr::Foundation::HANDLE, lpMode : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PeekNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nBufferSize : UInt32, lpBytesRead : UInt32*, lpTotalBytesAvail : UInt32*, lpBytesLeftThisMessage : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TransactNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateNamedPipeW(lpName : Win32cr::Foundation::PWSTR, dwOpenMode : Win32cr::Storage::FileSystem::FILE_FLAGS_AND_ATTRIBUTES, dwPipeMode : Win32cr::System::Pipes::NAMED_PIPE_MODE, nMaxInstances : UInt32, nOutBufferSize : UInt32, nInBufferSize : UInt32, nDefaultTimeOut : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun WaitNamedPipeW(lpNamedPipeName : Win32cr::Foundation::PWSTR, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeClientComputerNameW(pipe : Win32cr::Foundation::HANDLE, client_computer_name : Win32cr::Foundation::PWSTR, client_computer_name_length : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ImpersonateNamedPipeClient(hNamedPipe : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeInfo(hNamedPipe : Win32cr::Foundation::HANDLE, lpFlags : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpOutBufferSize : UInt32*, lpInBufferSize : UInt32*, lpMaxInstances : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeHandleStateW(hNamedPipe : Win32cr::Foundation::HANDLE, lpState : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpCurInstances : UInt32*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*, lpUserName : UInt16*, nMaxUserNameSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CallNamedPipeW(lpNamedPipeName : Win32cr::Foundation::PWSTR, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun CreateNamedPipeA(lpName : Win32cr::Foundation::PSTR, dwOpenMode : Win32cr::Storage::FileSystem::FILE_FLAGS_AND_ATTRIBUTES, dwPipeMode : Win32cr::System::Pipes::NAMED_PIPE_MODE, nMaxInstances : UInt32, nOutBufferSize : UInt32, nInBufferSize : UInt32, nDefaultTimeOut : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun GetNamedPipeHandleStateA(hNamedPipe : Win32cr::Foundation::HANDLE, lpState : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpCurInstances : UInt32*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*, lpUserName : UInt8*, nMaxUserNameSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CallNamedPipeA(lpNamedPipeName : Win32cr::Foundation::PSTR, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WaitNamedPipeA(lpNamedPipeName : Win32cr::Foundation::PSTR, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeClientComputerNameA(pipe : Win32cr::Foundation::HANDLE, client_computer_name : Win32cr::Foundation::PSTR, client_computer_name_length : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeClientProcessId(pipe : Win32cr::Foundation::HANDLE, client_process_id : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeClientSessionId(pipe : Win32cr::Foundation::HANDLE, client_session_id : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeServerProcessId(pipe : Win32cr::Foundation::HANDLE, server_process_id : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetNamedPipeServerSessionId(pipe : Win32cr::Foundation::HANDLE, server_session_id : UInt32*) : Win32cr::Foundation::BOOL

  end
end