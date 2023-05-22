require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  PSAPI_VERSION = 2_u32

  alias PENUM_PAGE_FILE_CALLBACKW = Proc(Void*, ENUM_PAGE_FILE_INFORMATION*, LibC::LPWSTR, LibC::BOOL)
  alias PENUM_PAGE_FILE_CALLBACKA = Proc(Void*, ENUM_PAGE_FILE_INFORMATION*, PSTR, LibC::BOOL)


  enum ENUM_PROCESS_MODULES_EX_FLAGS : UInt32
    LIST_MODULES_ALL = 3
    LIST_MODULES_DEFAULT = 0
    LIST_MODULES_32BIT = 1
    LIST_MODULES_64BIT = 2
  end

union PSAPI_WORKING_SET_BLOCK
  flags : LibC::UINT_PTR
  anonymous : PSAPI_WORKING_SET_BLOCK_Anonymous_e__Struct
end
union PSAPI_WORKING_SET_EX_BLOCK
  flags : LibC::UINT_PTR
  anonymous : PSAPI_WORKING_SET_EX_BLOCK_Anonymous_e__Union
end
union PSAPI_WORKING_SET_EX_BLOCK_Anonymous_e__Union
  anonymous : PSAPI_WORKING_SET_EX_BLOCK_Anonymous_e__Union_Anonymous_e__Struct
  invalid : PSAPI_WORKING_SET_EX_BLOCK_Anonymous_e__Union_Invalid_e__Struct
end

  struct MODULEINFO
    lp_base_of_dll : Void*
    size_of_image : UInt32
    entry_point : Void*
  end
  struct PSAPI_WS_WATCH_INFORMATION
    faulting_pc : Void*
    faulting_va : Void*
  end
  struct PSAPI_WS_WATCH_INFORMATION_EX
    basic_info : PSAPI_WS_WATCH_INFORMATION
    faulting_thread_id : LibC::UINT_PTR
    flags : LibC::UINT_PTR
  end
  struct PSAPI_WORKING_SET_BLOCK_Anonymous_e__Struct
    _bitfield : LibC::UINT_PTR
  end
  struct PSAPI_WORKING_SET_INFORMATION
    number_of_entries : LibC::UINT_PTR
    working_set_info : PSAPI_WORKING_SET_BLOCK[0]*
  end
  struct PSAPI_WORKING_SET_EX_BLOCK_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : LibC::UINT_PTR
  end
  struct PSAPI_WORKING_SET_EX_BLOCK_Anonymous_e__Union_Invalid_e__Struct
    _bitfield : LibC::UINT_PTR
  end
  struct PSAPI_WORKING_SET_EX_INFORMATION
    virtual_address : Void*
    virtual_attributes : PSAPI_WORKING_SET_EX_BLOCK
  end
  struct PROCESS_MEMORY_COUNTERS
    cb : UInt32
    page_fault_count : UInt32
    peak_working_set_size : LibC::UINT_PTR
    working_set_size : LibC::UINT_PTR
    quota_peak_paged_pool_usage : LibC::UINT_PTR
    quota_paged_pool_usage : LibC::UINT_PTR
    quota_peak_non_paged_pool_usage : LibC::UINT_PTR
    quota_non_paged_pool_usage : LibC::UINT_PTR
    pagefile_usage : LibC::UINT_PTR
    peak_pagefile_usage : LibC::UINT_PTR
  end
  struct PROCESS_MEMORY_COUNTERS_EX
    cb : UInt32
    page_fault_count : UInt32
    peak_working_set_size : LibC::UINT_PTR
    working_set_size : LibC::UINT_PTR
    quota_peak_paged_pool_usage : LibC::UINT_PTR
    quota_paged_pool_usage : LibC::UINT_PTR
    quota_peak_non_paged_pool_usage : LibC::UINT_PTR
    quota_non_paged_pool_usage : LibC::UINT_PTR
    pagefile_usage : LibC::UINT_PTR
    peak_pagefile_usage : LibC::UINT_PTR
    private_usage : LibC::UINT_PTR
  end
  struct PERFORMANCE_INFORMATION
    cb : UInt32
    commit_total : LibC::UINT_PTR
    commit_limit : LibC::UINT_PTR
    commit_peak : LibC::UINT_PTR
    physical_total : LibC::UINT_PTR
    physical_available : LibC::UINT_PTR
    system_cache : LibC::UINT_PTR
    kernel_total : LibC::UINT_PTR
    kernel_paged : LibC::UINT_PTR
    kernel_nonpaged : LibC::UINT_PTR
    page_size : LibC::UINT_PTR
    handle_count : UInt32
    process_count : UInt32
    thread_count : UInt32
  end
  struct ENUM_PAGE_FILE_INFORMATION
    cb : UInt32
    reserved : UInt32
    total_size : LibC::UINT_PTR
    total_in_use : LibC::UINT_PTR
    peak_usage : LibC::UINT_PTR
  end


  # Params # lpidprocess : UInt32* [In],cb : UInt32 [In],lpcbneeded : UInt32* [In]
  fun K32EnumProcesses(lpidprocess : UInt32*, cb : UInt32, lpcbneeded : UInt32*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lphmodule : HINSTANCE* [In],cb : UInt32 [In],lpcbneeded : UInt32* [In]
  fun K32EnumProcessModules(hprocess : LibC::HANDLE, lphmodule : HINSTANCE*, cb : UInt32, lpcbneeded : UInt32*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lphmodule : HINSTANCE* [In],cb : UInt32 [In],lpcbneeded : UInt32* [In],dwfilterflag : ENUM_PROCESS_MODULES_EX_FLAGS [In]
  fun K32EnumProcessModulesEx(hprocess : LibC::HANDLE, lphmodule : HINSTANCE*, cb : UInt32, lpcbneeded : UInt32*, dwfilterflag : ENUM_PROCESS_MODULES_EX_FLAGS) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],hmodule : HINSTANCE [In],lpbasename : UInt8* [In],nsize : UInt32 [In]
  fun K32GetModuleBaseNameA(hprocess : LibC::HANDLE, hmodule : HINSTANCE, lpbasename : UInt8*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],hmodule : HINSTANCE [In],lpbasename : Char* [In],nsize : UInt32 [In]
  fun K32GetModuleBaseNameW(hprocess : LibC::HANDLE, hmodule : HINSTANCE, lpbasename : Char*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],hmodule : HINSTANCE [In],lpfilename : UInt8* [In],nsize : UInt32 [In]
  fun K32GetModuleFileNameExA(hprocess : LibC::HANDLE, hmodule : HINSTANCE, lpfilename : UInt8*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],hmodule : HINSTANCE [In],lpfilename : Char* [In],nsize : UInt32 [In]
  fun K32GetModuleFileNameExW(hprocess : LibC::HANDLE, hmodule : HINSTANCE, lpfilename : Char*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],hmodule : HINSTANCE [In],lpmodinfo : MODULEINFO* [In],cb : UInt32 [In]
  fun K32GetModuleInformation(hprocess : LibC::HANDLE, hmodule : HINSTANCE, lpmodinfo : MODULEINFO*, cb : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In]
  fun K32EmptyWorkingSet(hprocess : LibC::HANDLE) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In]
  fun K32InitializeProcessForWsWatch(hprocess : LibC::HANDLE) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpwatchinfo : PSAPI_WS_WATCH_INFORMATION* [In],cb : UInt32 [In]
  fun K32GetWsChanges(hprocess : LibC::HANDLE, lpwatchinfo : PSAPI_WS_WATCH_INFORMATION*, cb : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpwatchinfoex : PSAPI_WS_WATCH_INFORMATION_EX* [In],cb : UInt32* [In]
  fun K32GetWsChangesEx(hprocess : LibC::HANDLE, lpwatchinfoex : PSAPI_WS_WATCH_INFORMATION_EX*, cb : UInt32*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpv : Void* [In],lpfilename : Char* [In],nsize : UInt32 [In]
  fun K32GetMappedFileNameW(hprocess : LibC::HANDLE, lpv : Void*, lpfilename : Char*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],lpv : Void* [In],lpfilename : UInt8* [In],nsize : UInt32 [In]
  fun K32GetMappedFileNameA(hprocess : LibC::HANDLE, lpv : Void*, lpfilename : UInt8*, nsize : UInt32) : UInt32

  # Params # lpimagebase : Void** [In],cb : UInt32 [In],lpcbneeded : UInt32* [In]
  fun K32EnumDeviceDrivers(lpimagebase : Void**, cb : UInt32, lpcbneeded : UInt32*) : LibC::BOOL

  # Params # imagebase : Void* [In],lpfilename : UInt8* [In],nsize : UInt32 [In]
  fun K32GetDeviceDriverBaseNameA(imagebase : Void*, lpfilename : UInt8*, nsize : UInt32) : UInt32

  # Params # imagebase : Void* [In],lpbasename : Char* [In],nsize : UInt32 [In]
  fun K32GetDeviceDriverBaseNameW(imagebase : Void*, lpbasename : Char*, nsize : UInt32) : UInt32

  # Params # imagebase : Void* [In],lpfilename : UInt8* [In],nsize : UInt32 [In]
  fun K32GetDeviceDriverFileNameA(imagebase : Void*, lpfilename : UInt8*, nsize : UInt32) : UInt32

  # Params # imagebase : Void* [In],lpfilename : Char* [In],nsize : UInt32 [In]
  fun K32GetDeviceDriverFileNameW(imagebase : Void*, lpfilename : Char*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],pv : Void* [In],cb : UInt32 [In]
  fun K32QueryWorkingSet(hprocess : LibC::HANDLE, pv : Void*, cb : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],pv : Void* [In],cb : UInt32 [In]
  fun K32QueryWorkingSetEx(hprocess : LibC::HANDLE, pv : Void*, cb : UInt32) : LibC::BOOL

  # Params # process : LibC::HANDLE [In],ppsmemcounters : PROCESS_MEMORY_COUNTERS* [In],cb : UInt32 [In]
  fun K32GetProcessMemoryInfo(process : LibC::HANDLE, ppsmemcounters : PROCESS_MEMORY_COUNTERS*, cb : UInt32) : LibC::BOOL

  # Params # pperformanceinformation : PERFORMANCE_INFORMATION* [In],cb : UInt32 [In]
  fun K32GetPerformanceInfo(pperformanceinformation : PERFORMANCE_INFORMATION*, cb : UInt32) : LibC::BOOL

  # Params # pcallbackroutine : PENUM_PAGE_FILE_CALLBACKW [In],pcontext : Void* [In]
  fun K32EnumPageFilesW(pcallbackroutine : PENUM_PAGE_FILE_CALLBACKW, pcontext : Void*) : LibC::BOOL

  # Params # pcallbackroutine : PENUM_PAGE_FILE_CALLBACKA [In],pcontext : Void* [In]
  fun K32EnumPageFilesA(pcallbackroutine : PENUM_PAGE_FILE_CALLBACKA, pcontext : Void*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpimagefilename : UInt8* [In],nsize : UInt32 [In]
  fun K32GetProcessImageFileNameA(hprocess : LibC::HANDLE, lpimagefilename : UInt8*, nsize : UInt32) : UInt32

  # Params # hprocess : LibC::HANDLE [In],lpimagefilename : Char* [In],nsize : UInt32 [In]
  fun K32GetProcessImageFileNameW(hprocess : LibC::HANDLE, lpimagefilename : Char*, nsize : UInt32) : UInt32
end
