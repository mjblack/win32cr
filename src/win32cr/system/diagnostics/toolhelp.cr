require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  MAX_MODULE_NAME32 = 255_u32
  HF32_DEFAULT = 1_u32
  HF32_SHARED = 2_u32


  enum CREATE_TOOLHELP_SNAPSHOT_FLAGS : UInt32
    TH32CS_INHERIT = 2147483648
    TH32CS_SNAPALL = 15
    TH32CS_SNAPHEAPLIST = 1
    TH32CS_SNAPMODULE = 8
    TH32CS_SNAPMODULE32 = 16
    TH32CS_SNAPPROCESS = 2
    TH32CS_SNAPTHREAD = 4
  end

  enum HEAPENTRY32_FLAGS : UInt32
    LF32_FIXED = 1
    LF32_FREE = 2
    LF32_MOVEABLE = 4
  end

  struct HEAPLIST32
    dw_size : LibC::UINT_PTR
    th32_process_id : UInt32
    th32_heap_id : LibC::UINT_PTR
    dw_flags : UInt32
  end
  struct HEAPENTRY32
    dw_size : LibC::UINT_PTR
    h_handle : LibC::HANDLE
    dw_address : LibC::UINT_PTR
    dw_block_size : LibC::UINT_PTR
    dw_flags : HEAPENTRY32_FLAGS
    dw_lock_count : UInt32
    dw_resvd : UInt32
    th32_process_id : UInt32
    th32_heap_id : LibC::UINT_PTR
  end
  struct PROCESSENTRY32W
    dw_size : UInt32
    cnt_usage : UInt32
    th32_process_id : UInt32
    th32_default_heap_id : LibC::UINT_PTR
    th32_module_id : UInt32
    cnt_threads : UInt32
    th32_parent_process_id : UInt32
    pc_pri_class_base : Int32
    dw_flags : UInt32
    sz_exe_file : Char[260]*
  end
  struct PROCESSENTRY32
    dw_size : UInt32
    cnt_usage : UInt32
    th32_process_id : UInt32
    th32_default_heap_id : LibC::UINT_PTR
    th32_module_id : UInt32
    cnt_threads : UInt32
    th32_parent_process_id : UInt32
    pc_pri_class_base : Int32
    dw_flags : UInt32
    sz_exe_file : CHAR[260]*
  end
  struct THREADENTRY32
    dw_size : UInt32
    cnt_usage : UInt32
    th32_thread_id : UInt32
    th32_owner_process_id : UInt32
    tp_base_pri : Int32
    tp_delta_pri : Int32
    dw_flags : UInt32
  end
  struct MODULEENTRY32W
    dw_size : UInt32
    th32_module_id : UInt32
    th32_process_id : UInt32
    glblcnt_usage : UInt32
    proccnt_usage : UInt32
    mod_base_addr : UInt8*
    mod_base_size : UInt32
    h_module : HINSTANCE
    sz_module : Char[256]*
    sz_exe_path : Char[260]*
  end
  struct MODULEENTRY32
    dw_size : UInt32
    th32_module_id : UInt32
    th32_process_id : UInt32
    glblcnt_usage : UInt32
    proccnt_usage : UInt32
    mod_base_addr : UInt8*
    mod_base_size : UInt32
    h_module : HINSTANCE
    sz_module : CHAR[256]*
    sz_exe_path : CHAR[260]*
  end


  # Params # dwflags : CREATE_TOOLHELP_SNAPSHOT_FLAGS [In],th32processid : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun CreateToolhelp32Snapshot(dwflags : CREATE_TOOLHELP_SNAPSHOT_FLAGS, th32processid : UInt32) : LibC::HANDLE

  # Params # hsnapshot : LibC::HANDLE [In],lphl : HEAPLIST32* [In]
  fun Heap32ListFirst(hsnapshot : LibC::HANDLE, lphl : HEAPLIST32*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lphl : HEAPLIST32* [In]
  fun Heap32ListNext(hsnapshot : LibC::HANDLE, lphl : HEAPLIST32*) : LibC::BOOL

  # Params # lphe : HEAPENTRY32* [In],th32processid : UInt32 [In],th32heapid : LibC::UINT_PTR [In]
  fun Heap32First(lphe : HEAPENTRY32*, th32processid : UInt32, th32heapid : LibC::UINT_PTR) : LibC::BOOL

  # Params # lphe : HEAPENTRY32* [In]
  fun Heap32Next(lphe : HEAPENTRY32*) : LibC::BOOL

  # Params # th32processid : UInt32 [In],lpbaseaddress : Void* [In],lpbuffer : Void* [In],cbread : LibC::UINT_PTR [In],lpnumberofbytesread : LibC::UINT_PTR* [In]
  fun Toolhelp32ReadProcessMemory(th32processid : UInt32, lpbaseaddress : Void*, lpbuffer : Void*, cbread : LibC::UINT_PTR, lpnumberofbytesread : LibC::UINT_PTR*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lppe : PROCESSENTRY32W* [In]
  # Commented out because function is part of Lib C
  #fun Process32FirstW(hsnapshot : LibC::HANDLE, lppe : PROCESSENTRY32W*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lppe : PROCESSENTRY32W* [In]
  # Commented out because function is part of Lib C
  #fun Process32NextW(hsnapshot : LibC::HANDLE, lppe : PROCESSENTRY32W*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lppe : PROCESSENTRY32* [In]
  fun Process32First(hsnapshot : LibC::HANDLE, lppe : PROCESSENTRY32*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lppe : PROCESSENTRY32* [In]
  fun Process32Next(hsnapshot : LibC::HANDLE, lppe : PROCESSENTRY32*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lpte : THREADENTRY32* [In]
  fun Thread32First(hsnapshot : LibC::HANDLE, lpte : THREADENTRY32*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lpte : THREADENTRY32* [In]
  fun Thread32Next(hsnapshot : LibC::HANDLE, lpte : THREADENTRY32*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lpme : MODULEENTRY32W* [In]
  fun Module32FirstW(hsnapshot : LibC::HANDLE, lpme : MODULEENTRY32W*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lpme : MODULEENTRY32W* [In]
  fun Module32NextW(hsnapshot : LibC::HANDLE, lpme : MODULEENTRY32W*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lpme : MODULEENTRY32* [In]
  fun Module32First(hsnapshot : LibC::HANDLE, lpme : MODULEENTRY32*) : LibC::BOOL

  # Params # hsnapshot : LibC::HANDLE [In],lpme : MODULEENTRY32* [In]
  fun Module32Next(hsnapshot : LibC::HANDLE, lpme : MODULEENTRY32*) : LibC::BOOL
end