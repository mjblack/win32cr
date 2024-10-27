require "./../foundation.cr"

module Win32cr::System::ProcessStatus
  alias PENUM_PAGE_FILE_CALLBACKW = Proc(Void*, Win32cr::System::ProcessStatus::ENUM_PAGE_FILE_INFORMATION*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)*

  alias PENUM_PAGE_FILE_CALLBACKA = Proc(Void*, Win32cr::System::ProcessStatus::ENUM_PAGE_FILE_INFORMATION*, Win32cr::Foundation::PSTR, Win32cr::Foundation::BOOL)*

  PSAPI_VERSION = 2_u32

  enum ENUM_PROCESS_MODULES_EX_FLAGS : UInt32
    LIST_MODULES_ALL = 3_u32
    LIST_MODULES_DEFAULT = 0_u32
    LIST_MODULES_32BIT = 1_u32
    LIST_MODULES_64BIT = 2_u32
  end

  @[Extern]
  record MODULEINFO,
    lpBaseOfDll : Void*,
    size_of_image : UInt32,
    entry_point : Void*

  @[Extern]
  record PSAPI_WS_WATCH_INFORMATION,
    faulting_pc : Void*,
    faulting_va : Void*

  @[Extern]
  record PSAPI_WS_WATCH_INFORMATION_EX,
    basic_info : Win32cr::System::ProcessStatus::PSAPI_WS_WATCH_INFORMATION,
    faulting_thread_id : LibC::UIntPtrT,
    flags : LibC::UIntPtrT

  @[Extern(union: true)]
  record PSAPI_WORKING_SET_BLOCK,
    flags : LibC::UIntPtrT,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : LibC::UIntPtrT

  end

  @[Extern]
  record PSAPI_WORKING_SET_INFORMATION,
    number_of_entries : LibC::UIntPtrT,
    working_set_info : Win32cr::System::ProcessStatus::PSAPI_WORKING_SET_BLOCK*

  @[Extern(union: true)]
  record PSAPI_WORKING_SET_EX_BLOCK,
    flags : LibC::UIntPtrT,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      invalid : Invalid_e__Struct do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        _bitfield : LibC::UIntPtrT


      # Nested Type Invalid_e__Struct
      @[Extern]
      record Invalid_e__Struct,
        _bitfield : LibC::UIntPtrT

    end

  end

  @[Extern]
  record PSAPI_WORKING_SET_EX_INFORMATION,
    virtual_address : Void*,
    virtual_attributes : Win32cr::System::ProcessStatus::PSAPI_WORKING_SET_EX_BLOCK

  @[Extern]
  record PROCESS_MEMORY_COUNTERS,
    cb : UInt32,
    page_fault_count : UInt32,
    peak_working_set_size : LibC::UIntPtrT,
    working_set_size : LibC::UIntPtrT,
    quota_peak_paged_pool_usage : LibC::UIntPtrT,
    quota_paged_pool_usage : LibC::UIntPtrT,
    quota_peak_non_paged_pool_usage : LibC::UIntPtrT,
    quota_non_paged_pool_usage : LibC::UIntPtrT,
    pagefile_usage : LibC::UIntPtrT,
    peak_pagefile_usage : LibC::UIntPtrT

  @[Extern]
  record PROCESS_MEMORY_COUNTERS_EX,
    cb : UInt32,
    page_fault_count : UInt32,
    peak_working_set_size : LibC::UIntPtrT,
    working_set_size : LibC::UIntPtrT,
    quota_peak_paged_pool_usage : LibC::UIntPtrT,
    quota_paged_pool_usage : LibC::UIntPtrT,
    quota_peak_non_paged_pool_usage : LibC::UIntPtrT,
    quota_non_paged_pool_usage : LibC::UIntPtrT,
    pagefile_usage : LibC::UIntPtrT,
    peak_pagefile_usage : LibC::UIntPtrT,
    private_usage : LibC::UIntPtrT

  @[Extern]
  record PERFORMANCE_INFORMATION,
    cb : UInt32,
    commit_total : LibC::UIntPtrT,
    commit_limit : LibC::UIntPtrT,
    commit_peak : LibC::UIntPtrT,
    physical_total : LibC::UIntPtrT,
    physical_available : LibC::UIntPtrT,
    system_cache : LibC::UIntPtrT,
    kernel_total : LibC::UIntPtrT,
    kernel_paged : LibC::UIntPtrT,
    kernel_nonpaged : LibC::UIntPtrT,
    page_size : LibC::UIntPtrT,
    handle_count : UInt32,
    process_count : UInt32,
    thread_count : UInt32

  @[Extern]
  record ENUM_PAGE_FILE_INFORMATION,
    cb : UInt32,
    reserved : UInt32,
    total_size : LibC::UIntPtrT,
    total_in_use : LibC::UIntPtrT,
    peak_usage : LibC::UIntPtrT

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