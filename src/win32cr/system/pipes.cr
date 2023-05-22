require "../foundation.cr"
require "../security.cr"
require "../system/io.cr"
require "../storage/filesystem.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
lib LibWin32
  PIPE_UNLIMITED_INSTANCES = 255_u32
  NMPWAIT_WAIT_FOREVER = 4294967295_u32
  NMPWAIT_NOWAIT = 1_u32
  NMPWAIT_USE_DEFAULT_WAIT = 0_u32


  enum NAMED_PIPE_MODE : UInt32
    PIPE_WAIT = 0
    PIPE_NOWAIT = 1
    PIPE_READMODE_BYTE = 0
    PIPE_READMODE_MESSAGE = 2
    PIPE_CLIENT_END = 0
    PIPE_SERVER_END = 1
    PIPE_TYPE_BYTE = 0
    PIPE_TYPE_MESSAGE = 4
    PIPE_ACCEPT_REMOTE_CLIENTS = 0
    PIPE_REJECT_REMOTE_CLIENTS = 8
  end


  # Params # hreadpipe : LibC::HANDLE* [In],hwritepipe : LibC::HANDLE* [In],lppipeattributes : SECURITY_ATTRIBUTES* [In],nsize : UInt32 [In]
  fun CreatePipe(hreadpipe : LibC::HANDLE*, hwritepipe : LibC::HANDLE*, lppipeattributes : SECURITY_ATTRIBUTES*, nsize : UInt32) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In],lpoverlapped : OVERLAPPED* [In]
  fun ConnectNamedPipe(hnamedpipe : LibC::HANDLE, lpoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In]
  fun DisconnectNamedPipe(hnamedpipe : LibC::HANDLE) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In],lpmode : NAMED_PIPE_MODE* [In],lpmaxcollectioncount : UInt32* [In],lpcollectdatatimeout : UInt32* [In]
  fun SetNamedPipeHandleState(hnamedpipe : LibC::HANDLE, lpmode : NAMED_PIPE_MODE*, lpmaxcollectioncount : UInt32*, lpcollectdatatimeout : UInt32*) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In],lpbuffer : Void* [In],nbuffersize : UInt32 [In],lpbytesread : UInt32* [In],lptotalbytesavail : UInt32* [In],lpbytesleftthismessage : UInt32* [In]
  fun PeekNamedPipe(hnamedpipe : LibC::HANDLE, lpbuffer : Void*, nbuffersize : UInt32, lpbytesread : UInt32*, lptotalbytesavail : UInt32*, lpbytesleftthismessage : UInt32*) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In],lpinbuffer : Void* [In],ninbuffersize : UInt32 [In],lpoutbuffer : Void* [In],noutbuffersize : UInt32 [In],lpbytesread : UInt32* [In],lpoverlapped : OVERLAPPED* [In]
  fun TransactNamedPipe(hnamedpipe : LibC::HANDLE, lpinbuffer : Void*, ninbuffersize : UInt32, lpoutbuffer : Void*, noutbuffersize : UInt32, lpbytesread : UInt32*, lpoverlapped : OVERLAPPED*) : LibC::BOOL

  # Params # lpname : LibC::LPWSTR [In],dwopenmode : FILE_FLAGS_AND_ATTRIBUTES [In],dwpipemode : NAMED_PIPE_MODE [In],nmaxinstances : UInt32 [In],noutbuffersize : UInt32 [In],ninbuffersize : UInt32 [In],ndefaulttimeout : UInt32 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun CreateNamedPipeW(lpname : LibC::LPWSTR, dwopenmode : FILE_FLAGS_AND_ATTRIBUTES, dwpipemode : NAMED_PIPE_MODE, nmaxinstances : UInt32, noutbuffersize : UInt32, ninbuffersize : UInt32, ndefaulttimeout : UInt32, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LibC::HANDLE

  # Params # lpnamedpipename : LibC::LPWSTR [In],ntimeout : UInt32 [In]
  fun WaitNamedPipeW(lpnamedpipename : LibC::LPWSTR, ntimeout : UInt32) : LibC::BOOL

  # Params # pipe : LibC::HANDLE [In],clientcomputername : LibC::LPWSTR [In],clientcomputernamelength : UInt32 [In]
  fun GetNamedPipeClientComputerNameW(pipe : LibC::HANDLE, clientcomputername : LibC::LPWSTR, clientcomputernamelength : UInt32) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In]
  fun ImpersonateNamedPipeClient(hnamedpipe : LibC::HANDLE) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In],lpflags : NAMED_PIPE_MODE* [In],lpoutbuffersize : UInt32* [In],lpinbuffersize : UInt32* [In],lpmaxinstances : UInt32* [In]
  fun GetNamedPipeInfo(hnamedpipe : LibC::HANDLE, lpflags : NAMED_PIPE_MODE*, lpoutbuffersize : UInt32*, lpinbuffersize : UInt32*, lpmaxinstances : UInt32*) : LibC::BOOL

  # Params # hnamedpipe : LibC::HANDLE [In],lpstate : NAMED_PIPE_MODE* [In],lpcurinstances : UInt32* [In],lpmaxcollectioncount : UInt32* [In],lpcollectdatatimeout : UInt32* [In],lpusername : Char* [In],nmaxusernamesize : UInt32 [In]
  fun GetNamedPipeHandleStateW(hnamedpipe : LibC::HANDLE, lpstate : NAMED_PIPE_MODE*, lpcurinstances : UInt32*, lpmaxcollectioncount : UInt32*, lpcollectdatatimeout : UInt32*, lpusername : Char*, nmaxusernamesize : UInt32) : LibC::BOOL

  # Params # lpnamedpipename : LibC::LPWSTR [In],lpinbuffer : Void* [In],ninbuffersize : UInt32 [In],lpoutbuffer : Void* [In],noutbuffersize : UInt32 [In],lpbytesread : UInt32* [In],ntimeout : UInt32 [In]
  fun CallNamedPipeW(lpnamedpipename : LibC::LPWSTR, lpinbuffer : Void*, ninbuffersize : UInt32, lpoutbuffer : Void*, noutbuffersize : UInt32, lpbytesread : UInt32*, ntimeout : UInt32) : LibC::BOOL

  # Params # lpname : PSTR [In],dwopenmode : FILE_FLAGS_AND_ATTRIBUTES [In],dwpipemode : NAMED_PIPE_MODE [In],nmaxinstances : UInt32 [In],noutbuffersize : UInt32 [In],ninbuffersize : UInt32 [In],ndefaulttimeout : UInt32 [In],lpsecurityattributes : SECURITY_ATTRIBUTES* [In]
  fun CreateNamedPipeA(lpname : PSTR, dwopenmode : FILE_FLAGS_AND_ATTRIBUTES, dwpipemode : NAMED_PIPE_MODE, nmaxinstances : UInt32, noutbuffersize : UInt32, ninbuffersize : UInt32, ndefaulttimeout : UInt32, lpsecurityattributes : SECURITY_ATTRIBUTES*) : LibC::HANDLE

  # Params # hnamedpipe : LibC::HANDLE [In],lpstate : NAMED_PIPE_MODE* [In],lpcurinstances : UInt32* [In],lpmaxcollectioncount : UInt32* [In],lpcollectdatatimeout : UInt32* [In],lpusername : UInt8* [In],nmaxusernamesize : UInt32 [In]
  fun GetNamedPipeHandleStateA(hnamedpipe : LibC::HANDLE, lpstate : NAMED_PIPE_MODE*, lpcurinstances : UInt32*, lpmaxcollectioncount : UInt32*, lpcollectdatatimeout : UInt32*, lpusername : UInt8*, nmaxusernamesize : UInt32) : LibC::BOOL

  # Params # lpnamedpipename : PSTR [In],lpinbuffer : Void* [In],ninbuffersize : UInt32 [In],lpoutbuffer : Void* [In],noutbuffersize : UInt32 [In],lpbytesread : UInt32* [In],ntimeout : UInt32 [In]
  fun CallNamedPipeA(lpnamedpipename : PSTR, lpinbuffer : Void*, ninbuffersize : UInt32, lpoutbuffer : Void*, noutbuffersize : UInt32, lpbytesread : UInt32*, ntimeout : UInt32) : LibC::BOOL

  # Params # lpnamedpipename : PSTR [In],ntimeout : UInt32 [In]
  fun WaitNamedPipeA(lpnamedpipename : PSTR, ntimeout : UInt32) : LibC::BOOL

  # Params # pipe : LibC::HANDLE [In],clientcomputername : PSTR [In],clientcomputernamelength : UInt32 [In]
  fun GetNamedPipeClientComputerNameA(pipe : LibC::HANDLE, clientcomputername : PSTR, clientcomputernamelength : UInt32) : LibC::BOOL

  # Params # pipe : LibC::HANDLE [In],clientprocessid : UInt32* [In]
  fun GetNamedPipeClientProcessId(pipe : LibC::HANDLE, clientprocessid : UInt32*) : LibC::BOOL

  # Params # pipe : LibC::HANDLE [In],clientsessionid : UInt32* [In]
  fun GetNamedPipeClientSessionId(pipe : LibC::HANDLE, clientsessionid : UInt32*) : LibC::BOOL

  # Params # pipe : LibC::HANDLE [In],serverprocessid : UInt32* [In]
  fun GetNamedPipeServerProcessId(pipe : LibC::HANDLE, serverprocessid : UInt32*) : LibC::BOOL

  # Params # pipe : LibC::HANDLE [In],serversessionid : UInt32* [In]
  fun GetNamedPipeServerSessionId(pipe : LibC::HANDLE, serversessionid : UInt32*) : LibC::BOOL
end
