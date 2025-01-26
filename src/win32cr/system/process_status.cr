require "./../foundation.cr"

module Win32cr::System::ProcessStatus
  alias PENUM_PAGE_FILE_CALLBACKW = Proc(Void*, Win32cr::System::ProcessStatus::ENUM_PAGE_FILE_INFORMATION*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)

  alias PENUM_PAGE_FILE_CALLBACKA = Proc(Void*, Win32cr::System::ProcessStatus::ENUM_PAGE_FILE_INFORMATION*, Win32cr::Foundation::PSTR, Win32cr::Foundation::BOOL)

  PSAPI_VERSION = 2_u32

  enum ENUM_PROCESS_MODULES_EX_FLAGS : UInt32
    LIST_MODULES_ALL = 3_u32
    LIST_MODULES_DEFAULT = 0_u32
    LIST_MODULES_32BIT = 1_u32
    LIST_MODULES_64BIT = 2_u32
  end

  @[Extern]
  struct MODULEINFO
    property lpBaseOfDll : Void*
    property size_of_image : UInt32
    property entry_point : Void*
    def initialize(@lpBaseOfDll : Void*, @size_of_image : UInt32, @entry_point : Void*)
    end
  end

  @[Extern]
  struct PSAPI_WS_WATCH_INFORMATION
    property faulting_pc : Void*
    property faulting_va : Void*
    def initialize(@faulting_pc : Void*, @faulting_va : Void*)
    end
  end

  @[Extern]
  struct PSAPI_WS_WATCH_INFORMATION_EX
    property basic_info : Win32cr::System::ProcessStatus::PSAPI_WS_WATCH_INFORMATION
    property faulting_thread_id : LibC::UIntPtrT
    property flags : LibC::UIntPtrT
    def initialize(@basic_info : Win32cr::System::ProcessStatus::PSAPI_WS_WATCH_INFORMATION, @faulting_thread_id : LibC::UIntPtrT, @flags : LibC::UIntPtrT)
    end
  end

  @[Extern(union: true)]
  struct PSAPI_WORKING_SET_BLOCK
    property flags : LibC::UIntPtrT
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : LibC::UIntPtrT
    def initialize(@_bitfield : LibC::UIntPtrT)
    end
    end

    def initialize(@flags : LibC::UIntPtrT, @anonymous : Anonymous_e__Struct_)
    end
  end

  @[Extern]
  struct PSAPI_WORKING_SET_INFORMATION
    property number_of_entries : LibC::UIntPtrT
    property working_set_info : Win32cr::System::ProcessStatus::PSAPI_WORKING_SET_BLOCK*
    def initialize(@number_of_entries : LibC::UIntPtrT, @working_set_info : Win32cr::System::ProcessStatus::PSAPI_WORKING_SET_BLOCK*)
    end
  end

  @[Extern(union: true)]
  struct PSAPI_WORKING_SET_EX_BLOCK
    property flags : LibC::UIntPtrT
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property invalid : Invalid_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : LibC::UIntPtrT
    def initialize(@_bitfield : LibC::UIntPtrT)
    end
      end


      # Nested Type Invalid_e__Struct_
      @[Extern]
      struct Invalid_e__Struct_
    property _bitfield : LibC::UIntPtrT
    def initialize(@_bitfield : LibC::UIntPtrT)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @invalid : Invalid_e__Struct_)
    end
    end

    def initialize(@flags : LibC::UIntPtrT, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PSAPI_WORKING_SET_EX_INFORMATION
    property virtual_address : Void*
    property virtual_attributes : Win32cr::System::ProcessStatus::PSAPI_WORKING_SET_EX_BLOCK
    def initialize(@virtual_address : Void*, @virtual_attributes : Win32cr::System::ProcessStatus::PSAPI_WORKING_SET_EX_BLOCK)
    end
  end

  @[Extern]
  struct PROCESS_MEMORY_COUNTERS
    property cb : UInt32
    property page_fault_count : UInt32
    property peak_working_set_size : LibC::UIntPtrT
    property working_set_size : LibC::UIntPtrT
    property quota_peak_paged_pool_usage : LibC::UIntPtrT
    property quota_paged_pool_usage : LibC::UIntPtrT
    property quota_peak_non_paged_pool_usage : LibC::UIntPtrT
    property quota_non_paged_pool_usage : LibC::UIntPtrT
    property pagefile_usage : LibC::UIntPtrT
    property peak_pagefile_usage : LibC::UIntPtrT
    def initialize(@cb : UInt32, @page_fault_count : UInt32, @peak_working_set_size : LibC::UIntPtrT, @working_set_size : LibC::UIntPtrT, @quota_peak_paged_pool_usage : LibC::UIntPtrT, @quota_paged_pool_usage : LibC::UIntPtrT, @quota_peak_non_paged_pool_usage : LibC::UIntPtrT, @quota_non_paged_pool_usage : LibC::UIntPtrT, @pagefile_usage : LibC::UIntPtrT, @peak_pagefile_usage : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct PROCESS_MEMORY_COUNTERS_EX
    property cb : UInt32
    property page_fault_count : UInt32
    property peak_working_set_size : LibC::UIntPtrT
    property working_set_size : LibC::UIntPtrT
    property quota_peak_paged_pool_usage : LibC::UIntPtrT
    property quota_paged_pool_usage : LibC::UIntPtrT
    property quota_peak_non_paged_pool_usage : LibC::UIntPtrT
    property quota_non_paged_pool_usage : LibC::UIntPtrT
    property pagefile_usage : LibC::UIntPtrT
    property peak_pagefile_usage : LibC::UIntPtrT
    property private_usage : LibC::UIntPtrT
    def initialize(@cb : UInt32, @page_fault_count : UInt32, @peak_working_set_size : LibC::UIntPtrT, @working_set_size : LibC::UIntPtrT, @quota_peak_paged_pool_usage : LibC::UIntPtrT, @quota_paged_pool_usage : LibC::UIntPtrT, @quota_peak_non_paged_pool_usage : LibC::UIntPtrT, @quota_non_paged_pool_usage : LibC::UIntPtrT, @pagefile_usage : LibC::UIntPtrT, @peak_pagefile_usage : LibC::UIntPtrT, @private_usage : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct PERFORMANCE_INFORMATION
    property cb : UInt32
    property commit_total : LibC::UIntPtrT
    property commit_limit : LibC::UIntPtrT
    property commit_peak : LibC::UIntPtrT
    property physical_total : LibC::UIntPtrT
    property physical_available : LibC::UIntPtrT
    property system_cache : LibC::UIntPtrT
    property kernel_total : LibC::UIntPtrT
    property kernel_paged : LibC::UIntPtrT
    property kernel_nonpaged : LibC::UIntPtrT
    property page_size : LibC::UIntPtrT
    property handle_count : UInt32
    property process_count : UInt32
    property thread_count : UInt32
    def initialize(@cb : UInt32, @commit_total : LibC::UIntPtrT, @commit_limit : LibC::UIntPtrT, @commit_peak : LibC::UIntPtrT, @physical_total : LibC::UIntPtrT, @physical_available : LibC::UIntPtrT, @system_cache : LibC::UIntPtrT, @kernel_total : LibC::UIntPtrT, @kernel_paged : LibC::UIntPtrT, @kernel_nonpaged : LibC::UIntPtrT, @page_size : LibC::UIntPtrT, @handle_count : UInt32, @process_count : UInt32, @thread_count : UInt32)
    end
  end

  @[Extern]
  struct ENUM_PAGE_FILE_INFORMATION
    property cb : UInt32
    property reserved : UInt32
    property total_size : LibC::UIntPtrT
    property total_in_use : LibC::UIntPtrT
    property peak_usage : LibC::UIntPtrT
    def initialize(@cb : UInt32, @reserved : UInt32, @total_size : LibC::UIntPtrT, @total_in_use : LibC::UIntPtrT, @peak_usage : LibC::UIntPtrT)
    end
  end

  @[Link("kernel32")]
  lib C
    fun K32EnumProcesses(lpidProcess : UInt32*, cb : UInt32, lpcbNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun K32EnumProcessModules(hProcess : Win32cr::Foundation::HANDLE, lphModule : Win32cr::Foundation::HINSTANCE*, cb : UInt32, lpcbNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun K32EnumProcessModulesEx(hProcess : Win32cr::Foundation::HANDLE, lphModule : Win32cr::Foundation::HINSTANCE*, cb : UInt32, lpcbNeeded : UInt32*, dwFilterFlag : Win32cr::System::ProcessStatus::ENUM_PROCESS_MODULES_EX_FLAGS) : Win32cr::Foundation::BOOL

    fun K32GetModuleBaseNameA(hProcess : Win32cr::Foundation::HANDLE, hModule : Win32cr::Foundation::HINSTANCE, lpBaseName : UInt8*, nSize : UInt32) : UInt32

    fun K32GetModuleBaseNameW(hProcess : Win32cr::Foundation::HANDLE, hModule : Win32cr::Foundation::HINSTANCE, lpBaseName : UInt16*, nSize : UInt32) : UInt32

    fun K32GetModuleFileNameExA(hProcess : Win32cr::Foundation::HANDLE, hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt8*, nSize : UInt32) : UInt32

    fun K32GetModuleFileNameExW(hProcess : Win32cr::Foundation::HANDLE, hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt16*, nSize : UInt32) : UInt32

    fun K32GetModuleInformation(hProcess : Win32cr::Foundation::HANDLE, hModule : Win32cr::Foundation::HINSTANCE, lpmodinfo : Win32cr::System::ProcessStatus::MODULEINFO*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun K32EmptyWorkingSet(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun K32InitializeProcessForWsWatch(hProcess : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun K32GetWsChanges(hProcess : Win32cr::Foundation::HANDLE, lpWatchInfo : Win32cr::System::ProcessStatus::PSAPI_WS_WATCH_INFORMATION*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun K32GetWsChangesEx(hProcess : Win32cr::Foundation::HANDLE, lpWatchInfoEx : Win32cr::System::ProcessStatus::PSAPI_WS_WATCH_INFORMATION_EX*, cb : UInt32*) : Win32cr::Foundation::BOOL

    fun K32GetMappedFileNameW(hProcess : Win32cr::Foundation::HANDLE, lpv : Void*, lpFilename : UInt16*, nSize : UInt32) : UInt32

    fun K32GetMappedFileNameA(hProcess : Win32cr::Foundation::HANDLE, lpv : Void*, lpFilename : UInt8*, nSize : UInt32) : UInt32

    fun K32EnumDeviceDrivers(lpImageBase : Void**, cb : UInt32, lpcbNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun K32GetDeviceDriverBaseNameA(image_base : Void*, lpFilename : UInt8*, nSize : UInt32) : UInt32

    fun K32GetDeviceDriverBaseNameW(image_base : Void*, lpBaseName : UInt16*, nSize : UInt32) : UInt32

    fun K32GetDeviceDriverFileNameA(image_base : Void*, lpFilename : UInt8*, nSize : UInt32) : UInt32

    fun K32GetDeviceDriverFileNameW(image_base : Void*, lpFilename : UInt16*, nSize : UInt32) : UInt32

    fun K32QueryWorkingSet(hProcess : Win32cr::Foundation::HANDLE, pv : Void*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun K32QueryWorkingSetEx(hProcess : Win32cr::Foundation::HANDLE, pv : Void*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun K32GetProcessMemoryInfo(process : Win32cr::Foundation::HANDLE, ppsmemCounters : Win32cr::System::ProcessStatus::PROCESS_MEMORY_COUNTERS*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun K32GetPerformanceInfo(pPerformanceInformation : Win32cr::System::ProcessStatus::PERFORMANCE_INFORMATION*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun K32EnumPageFilesW(pCallBackRoutine : Win32cr::System::ProcessStatus::PENUM_PAGE_FILE_CALLBACKW, pContext : Void*) : Win32cr::Foundation::BOOL

    fun K32EnumPageFilesA(pCallBackRoutine : Win32cr::System::ProcessStatus::PENUM_PAGE_FILE_CALLBACKA, pContext : Void*) : Win32cr::Foundation::BOOL

    fun K32GetProcessImageFileNameA(hProcess : Win32cr::Foundation::HANDLE, lpImageFileName : UInt8*, nSize : UInt32) : UInt32

    fun K32GetProcessImageFileNameW(hProcess : Win32cr::Foundation::HANDLE, lpImageFileName : UInt16*, nSize : UInt32) : UInt32

  end
end