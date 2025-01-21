require "./../foundation.cr"
require "./../security.cr"
require "./io.cr"
require "./../storage/file_system.cr"

module Win32cr::System::Pipes
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

  @[Link("kernel32")]
  @[Link("advapi32")]
  lib C
    fun CreatePipe(hReadPipe : Win32cr::Foundation::HANDLE*, hWritePipe : Win32cr::Foundation::HANDLE*, lpPipeAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, nSize : UInt32) : Win32cr::Foundation::BOOL

    fun ConnectNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun DisconnectNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun SetNamedPipeHandleState(hNamedPipe : Win32cr::Foundation::HANDLE, lpMode : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*) : Win32cr::Foundation::BOOL

    fun PeekNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpBuffer : Void*, nBufferSize : UInt32, lpBytesRead : UInt32*, lpTotalBytesAvail : UInt32*, lpBytesLeftThisMessage : UInt32*) : Win32cr::Foundation::BOOL

    fun TransactNamedPipe(hNamedPipe : Win32cr::Foundation::HANDLE, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::BOOL

    fun CreateNamedPipeW(lpName : Win32cr::Foundation::PWSTR, dwOpenMode : Win32cr::Storage::FileSystem::FILE_FLAGS_AND_ATTRIBUTES, dwPipeMode : Win32cr::System::Pipes::NAMED_PIPE_MODE, nMaxInstances : UInt32, nOutBufferSize : UInt32, nInBufferSize : UInt32, nDefaultTimeOut : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    fun WaitNamedPipeW(lpNamedPipeName : Win32cr::Foundation::PWSTR, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    fun GetNamedPipeClientComputerNameW(pipe : Win32cr::Foundation::HANDLE, client_computer_name : Win32cr::Foundation::PWSTR, client_computer_name_length : UInt32) : Win32cr::Foundation::BOOL

    fun ImpersonateNamedPipeClient(hNamedPipe : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun GetNamedPipeInfo(hNamedPipe : Win32cr::Foundation::HANDLE, lpFlags : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpOutBufferSize : UInt32*, lpInBufferSize : UInt32*, lpMaxInstances : UInt32*) : Win32cr::Foundation::BOOL

    fun GetNamedPipeHandleStateW(hNamedPipe : Win32cr::Foundation::HANDLE, lpState : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpCurInstances : UInt32*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*, lpUserName : UInt16*, nMaxUserNameSize : UInt32) : Win32cr::Foundation::BOOL

    fun CallNamedPipeW(lpNamedPipeName : Win32cr::Foundation::PWSTR, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun CreateNamedPipeA(lpName : Win32cr::Foundation::PSTR, dwOpenMode : Win32cr::Storage::FileSystem::FILE_FLAGS_AND_ATTRIBUTES, dwPipeMode : Win32cr::System::Pipes::NAMED_PIPE_MODE, nMaxInstances : UInt32, nOutBufferSize : UInt32, nInBufferSize : UInt32, nDefaultTimeOut : UInt32, lpSecurityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*) : Win32cr::Foundation::HANDLE

    fun GetNamedPipeHandleStateA(hNamedPipe : Win32cr::Foundation::HANDLE, lpState : Win32cr::System::Pipes::NAMED_PIPE_MODE*, lpCurInstances : UInt32*, lpMaxCollectionCount : UInt32*, lpCollectDataTimeout : UInt32*, lpUserName : UInt8*, nMaxUserNameSize : UInt32) : Win32cr::Foundation::BOOL

    fun CallNamedPipeA(lpNamedPipeName : Win32cr::Foundation::PSTR, lpInBuffer : Void*, nInBufferSize : UInt32, lpOutBuffer : Void*, nOutBufferSize : UInt32, lpBytesRead : UInt32*, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    fun WaitNamedPipeA(lpNamedPipeName : Win32cr::Foundation::PSTR, nTimeOut : UInt32) : Win32cr::Foundation::BOOL

    fun GetNamedPipeClientComputerNameA(pipe : Win32cr::Foundation::HANDLE, client_computer_name : Win32cr::Foundation::PSTR, client_computer_name_length : UInt32) : Win32cr::Foundation::BOOL

    fun GetNamedPipeClientProcessId(pipe : Win32cr::Foundation::HANDLE, client_process_id : UInt32*) : Win32cr::Foundation::BOOL

    fun GetNamedPipeClientSessionId(pipe : Win32cr::Foundation::HANDLE, client_session_id : UInt32*) : Win32cr::Foundation::BOOL

    fun GetNamedPipeServerProcessId(pipe : Win32cr::Foundation::HANDLE, server_process_id : UInt32*) : Win32cr::Foundation::BOOL

    fun GetNamedPipeServerSessionId(pipe : Win32cr::Foundation::HANDLE, server_session_id : UInt32*) : Win32cr::Foundation::BOOL

  end
end