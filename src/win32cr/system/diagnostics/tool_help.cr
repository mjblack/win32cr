require "./../../foundation.cr"

module Win32cr::System::Diagnostics::ToolHelp
  MAX_MODULE_NAME32 = 255_u32
  HF32_DEFAULT = 1_u32
  HF32_SHARED = 2_u32

  @[Flags]
  enum CREATE_TOOLHELP_SNAPSHOT_FLAGS : UInt32
    TH32CS_INHERIT = 2147483648_u32
    TH32CS_SNAPALL = 15_u32
    TH32CS_SNAPHEAPLIST = 1_u32
    TH32CS_SNAPMODULE = 8_u32
    TH32CS_SNAPMODULE32 = 16_u32
    TH32CS_SNAPPROCESS = 2_u32
    TH32CS_SNAPTHREAD = 4_u32
  end
  enum HEAPENTRY32_FLAGS : UInt32
    LF32_FIXED = 1_u32
    LF32_FREE = 2_u32
    LF32_MOVEABLE = 4_u32
  end

  @[Extern]
  record HEAPLIST32,
    dwSize : LibC::UIntPtrT,
    th32ProcessID : UInt32,
    th32HeapID : LibC::UIntPtrT,
    dwFlags : UInt32

  @[Extern]
  record HEAPENTRY32,
    dwSize : LibC::UIntPtrT,
    hHandle : Win32cr::Foundation::HANDLE,
    dwAddress : LibC::UIntPtrT,
    dwBlockSize : LibC::UIntPtrT,
    dwFlags : Win32cr::System::Diagnostics::ToolHelp::HEAPENTRY32_FLAGS,
    dwLockCount : UInt32,
    dwResvd : UInt32,
    th32ProcessID : UInt32,
    th32HeapID : LibC::UIntPtrT

  @[Extern]
  record PROCESSENTRY32W,
    dwSize : UInt32,
    cntUsage : UInt32,
    th32ProcessID : UInt32,
    th32DefaultHeapID : LibC::UIntPtrT,
    th32ModuleID : UInt32,
    cntThreads : UInt32,
    th32ParentProcessID : UInt32,
    pcPriClassBase : Int32,
    dwFlags : UInt32,
    szExeFile : UInt16[260]

  @[Extern]
  record PROCESSENTRY32,
    dwSize : UInt32,
    cntUsage : UInt32,
    th32ProcessID : UInt32,
    th32DefaultHeapID : LibC::UIntPtrT,
    th32ModuleID : UInt32,
    cntThreads : UInt32,
    th32ParentProcessID : UInt32,
    pcPriClassBase : Int32,
    dwFlags : UInt32,
    szExeFile : Win32cr::Foundation::CHAR[260]

  @[Extern]
  record THREADENTRY32,
    dwSize : UInt32,
    cntUsage : UInt32,
    th32ThreadID : UInt32,
    th32OwnerProcessID : UInt32,
    tpBasePri : Int32,
    tpDeltaPri : Int32,
    dwFlags : UInt32

  @[Extern]
  record MODULEENTRY32W,
    dwSize : UInt32,
    th32ModuleID : UInt32,
    th32ProcessID : UInt32,
    glblcnt_usage : UInt32,
    proccnt_usage : UInt32,
    modBaseAddr : UInt8*,
    modBaseSize : UInt32,
    hModule : Win32cr::Foundation::HINSTANCE,
    szModule : UInt16[256],
    szExePath : UInt16[260]

  @[Extern]
  record MODULEENTRY32,
    dwSize : UInt32,
    th32ModuleID : UInt32,
    th32ProcessID : UInt32,
    glblcnt_usage : UInt32,
    proccnt_usage : UInt32,
    modBaseAddr : UInt8*,
    modBaseSize : UInt32,
    hModule : Win32cr::Foundation::HINSTANCE,
    szModule : Win32cr::Foundation::CHAR[256],
    szExePath : Win32cr::Foundation::CHAR[260]

  @[Link("kernel32")]
  lib C
    # Commented out due to being part of LibC
    #fun CreateToolhelp32Snapshot(dwFlags : Win32cr::System::Diagnostics::ToolHelp::CREATE_TOOLHELP_SNAPSHOT_FLAGS, th32ProcessID : UInt32) : Win32cr::Foundation::HANDLE

    fun Heap32ListFirst(hSnapshot : Win32cr::Foundation::HANDLE, lphl : Win32cr::System::Diagnostics::ToolHelp::HEAPLIST32*) : Win32cr::Foundation::BOOL

    fun Heap32ListNext(hSnapshot : Win32cr::Foundation::HANDLE, lphl : Win32cr::System::Diagnostics::ToolHelp::HEAPLIST32*) : Win32cr::Foundation::BOOL

    fun Heap32First(lphe : Win32cr::System::Diagnostics::ToolHelp::HEAPENTRY32*, th32ProcessID : UInt32, th32HeapID : LibC::UIntPtrT) : Win32cr::Foundation::BOOL

    fun Heap32Next(lphe : Win32cr::System::Diagnostics::ToolHelp::HEAPENTRY32*) : Win32cr::Foundation::BOOL

    fun Toolhelp32ReadProcessMemory(th32ProcessID : UInt32, lpBaseAddress : Void*, lpBuffer : Void*, cbRead : LibC::UIntPtrT, lpNumberOfBytesRead : LibC::UIntPtrT*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun Process32FirstW(hSnapshot : Win32cr::Foundation::HANDLE, lppe : Win32cr::System::Diagnostics::ToolHelp::PROCESSENTRY32W*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun Process32NextW(hSnapshot : Win32cr::Foundation::HANDLE, lppe : Win32cr::System::Diagnostics::ToolHelp::PROCESSENTRY32W*) : Win32cr::Foundation::BOOL

    fun Process32First(hSnapshot : Win32cr::Foundation::HANDLE, lppe : Win32cr::System::Diagnostics::ToolHelp::PROCESSENTRY32*) : Win32cr::Foundation::BOOL

    fun Process32Next(hSnapshot : Win32cr::Foundation::HANDLE, lppe : Win32cr::System::Diagnostics::ToolHelp::PROCESSENTRY32*) : Win32cr::Foundation::BOOL

    fun Thread32First(hSnapshot : Win32cr::Foundation::HANDLE, lpte : Win32cr::System::Diagnostics::ToolHelp::THREADENTRY32*) : Win32cr::Foundation::BOOL

    fun Thread32Next(hSnapshot : Win32cr::Foundation::HANDLE, lpte : Win32cr::System::Diagnostics::ToolHelp::THREADENTRY32*) : Win32cr::Foundation::BOOL

    fun Module32FirstW(hSnapshot : Win32cr::Foundation::HANDLE, lpme : Win32cr::System::Diagnostics::ToolHelp::MODULEENTRY32W*) : Win32cr::Foundation::BOOL

    fun Module32NextW(hSnapshot : Win32cr::Foundation::HANDLE, lpme : Win32cr::System::Diagnostics::ToolHelp::MODULEENTRY32W*) : Win32cr::Foundation::BOOL

    fun Module32First(hSnapshot : Win32cr::Foundation::HANDLE, lpme : Win32cr::System::Diagnostics::ToolHelp::MODULEENTRY32*) : Win32cr::Foundation::BOOL

    fun Module32Next(hSnapshot : Win32cr::Foundation::HANDLE, lpme : Win32cr::System::Diagnostics::ToolHelp::MODULEENTRY32*) : Win32cr::Foundation::BOOL

  end
end