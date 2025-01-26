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
  struct HEAPLIST32
    property dwSize : LibC::UIntPtrT
    property th32ProcessID : UInt32
    property th32HeapID : LibC::UIntPtrT
    property dwFlags : UInt32
    def initialize(@dwSize : LibC::UIntPtrT, @th32ProcessID : UInt32, @th32HeapID : LibC::UIntPtrT, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct HEAPENTRY32
    property dwSize : LibC::UIntPtrT
    property hHandle : Win32cr::Foundation::HANDLE
    property dwAddress : LibC::UIntPtrT
    property dwBlockSize : LibC::UIntPtrT
    property dwFlags : Win32cr::System::Diagnostics::ToolHelp::HEAPENTRY32_FLAGS
    property dwLockCount : UInt32
    property dwResvd : UInt32
    property th32ProcessID : UInt32
    property th32HeapID : LibC::UIntPtrT
    def initialize(@dwSize : LibC::UIntPtrT, @hHandle : Win32cr::Foundation::HANDLE, @dwAddress : LibC::UIntPtrT, @dwBlockSize : LibC::UIntPtrT, @dwFlags : Win32cr::System::Diagnostics::ToolHelp::HEAPENTRY32_FLAGS, @dwLockCount : UInt32, @dwResvd : UInt32, @th32ProcessID : UInt32, @th32HeapID : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct PROCESSENTRY32W
    property dwSize : UInt32
    property cntUsage : UInt32
    property th32ProcessID : UInt32
    property th32DefaultHeapID : LibC::UIntPtrT
    property th32ModuleID : UInt32
    property cntThreads : UInt32
    property th32ParentProcessID : UInt32
    property pcPriClassBase : Int32
    property dwFlags : UInt32
    property szExeFile : UInt16[260]
    def initialize(@dwSize : UInt32, @cntUsage : UInt32, @th32ProcessID : UInt32, @th32DefaultHeapID : LibC::UIntPtrT, @th32ModuleID : UInt32, @cntThreads : UInt32, @th32ParentProcessID : UInt32, @pcPriClassBase : Int32, @dwFlags : UInt32, @szExeFile : UInt16[260])
    end
  end

  @[Extern]
  struct PROCESSENTRY32
    property dwSize : UInt32
    property cntUsage : UInt32
    property th32ProcessID : UInt32
    property th32DefaultHeapID : LibC::UIntPtrT
    property th32ModuleID : UInt32
    property cntThreads : UInt32
    property th32ParentProcessID : UInt32
    property pcPriClassBase : Int32
    property dwFlags : UInt32
    property szExeFile : Win32cr::Foundation::CHAR[260]
    def initialize(@dwSize : UInt32, @cntUsage : UInt32, @th32ProcessID : UInt32, @th32DefaultHeapID : LibC::UIntPtrT, @th32ModuleID : UInt32, @cntThreads : UInt32, @th32ParentProcessID : UInt32, @pcPriClassBase : Int32, @dwFlags : UInt32, @szExeFile : Win32cr::Foundation::CHAR[260])
    end
  end

  @[Extern]
  struct THREADENTRY32
    property dwSize : UInt32
    property cntUsage : UInt32
    property th32ThreadID : UInt32
    property th32OwnerProcessID : UInt32
    property tpBasePri : Int32
    property tpDeltaPri : Int32
    property dwFlags : UInt32
    def initialize(@dwSize : UInt32, @cntUsage : UInt32, @th32ThreadID : UInt32, @th32OwnerProcessID : UInt32, @tpBasePri : Int32, @tpDeltaPri : Int32, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct MODULEENTRY32W
    property dwSize : UInt32
    property th32ModuleID : UInt32
    property th32ProcessID : UInt32
    property glblcnt_usage : UInt32
    property proccnt_usage : UInt32
    property modBaseAddr : UInt8*
    property modBaseSize : UInt32
    property hModule : Win32cr::Foundation::HINSTANCE
    property szModule : UInt16[256]
    property szExePath : UInt16[260]
    def initialize(@dwSize : UInt32, @th32ModuleID : UInt32, @th32ProcessID : UInt32, @glblcnt_usage : UInt32, @proccnt_usage : UInt32, @modBaseAddr : UInt8*, @modBaseSize : UInt32, @hModule : Win32cr::Foundation::HINSTANCE, @szModule : UInt16[256], @szExePath : UInt16[260])
    end
  end

  @[Extern]
  struct MODULEENTRY32
    property dwSize : UInt32
    property th32ModuleID : UInt32
    property th32ProcessID : UInt32
    property glblcnt_usage : UInt32
    property proccnt_usage : UInt32
    property modBaseAddr : UInt8*
    property modBaseSize : UInt32
    property hModule : Win32cr::Foundation::HINSTANCE
    property szModule : Win32cr::Foundation::CHAR[256]
    property szExePath : Win32cr::Foundation::CHAR[260]
    def initialize(@dwSize : UInt32, @th32ModuleID : UInt32, @th32ProcessID : UInt32, @glblcnt_usage : UInt32, @proccnt_usage : UInt32, @modBaseAddr : UInt8*, @modBaseSize : UInt32, @hModule : Win32cr::Foundation::HINSTANCE, @szModule : Win32cr::Foundation::CHAR[256], @szExePath : Win32cr::Foundation::CHAR[260])
    end
  end

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