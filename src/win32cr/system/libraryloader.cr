require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  FIND_RESOURCE_DIRECTORY_TYPES = 256_u32
  FIND_RESOURCE_DIRECTORY_NAMES = 512_u32
  FIND_RESOURCE_DIRECTORY_LANGUAGES = 1024_u32
  RESOURCE_ENUM_LN = 1_u32
  RESOURCE_ENUM_MUI = 2_u32
  RESOURCE_ENUM_MUI_SYSTEM = 4_u32
  RESOURCE_ENUM_VALIDATE = 8_u32
  RESOURCE_ENUM_MODULE_EXACT = 16_u32
  SUPPORT_LANG_NUMBER = 32_u32
  GET_MODULE_HANDLE_EX_FLAG_PIN = 1_u32
  GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 2_u32
  GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS = 4_u32
  CURRENT_IMPORT_REDIRECTION_VERSION = 1_u32
  LOAD_LIBRARY_OS_INTEGRITY_CONTINUITY = 32768_u32

  alias ENUMRESLANGPROCA = Proc(HINSTANCE, PSTR, PSTR, UInt16, LibC::IntPtrT, LibC::BOOL)
  alias ENUMRESLANGPROCW = Proc(HINSTANCE, LibC::LPWSTR, LibC::LPWSTR, UInt16, LibC::IntPtrT, LibC::BOOL)
  alias ENUMRESNAMEPROCA = Proc(HINSTANCE, PSTR, PSTR, LibC::IntPtrT, LibC::BOOL)
  alias ENUMRESNAMEPROCW = Proc(HINSTANCE, LibC::LPWSTR, LibC::LPWSTR, LibC::IntPtrT, LibC::BOOL)
  alias ENUMRESTYPEPROCA = Proc(HINSTANCE, PSTR, LibC::IntPtrT, LibC::BOOL)
  alias ENUMRESTYPEPROCW = Proc(HINSTANCE, LibC::LPWSTR, LibC::IntPtrT, LibC::BOOL)
  alias PGET_MODULE_HANDLE_EXA = Proc(UInt32, PSTR, HINSTANCE*, LibC::BOOL)
  alias PGET_MODULE_HANDLE_EXW = Proc(UInt32, LibC::LPWSTR, HINSTANCE*, LibC::BOOL)


  enum LOAD_LIBRARY_FLAGS : UInt32
    DONT_RESOLVE_DLL_REFERENCES = 1
    LOAD_LIBRARY_AS_DATAFILE = 2
    LOAD_WITH_ALTERED_SEARCH_PATH = 8
    LOAD_IGNORE_CODE_AUTHZ_LEVEL = 16
    LOAD_LIBRARY_AS_IMAGE_RESOURCE = 32
    LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE = 64
    LOAD_LIBRARY_REQUIRE_SIGNED_TARGET = 128
    LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR = 256
    LOAD_LIBRARY_SEARCH_APPLICATION_DIR = 512
    LOAD_LIBRARY_SEARCH_USER_DIRS = 1024
    LOAD_LIBRARY_SEARCH_SYSTEM32 = 2048
    LOAD_LIBRARY_SEARCH_DEFAULT_DIRS = 4096
    LOAD_LIBRARY_SAFE_CURRENT_DIRS = 8192
    LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER = 16384
  end

  struct ENUMUILANG
    num_of_enum_ui_lang : UInt32
    size_of_enum_ui_buffer : UInt32
    p_enum_ui_buffer : UInt16*
  end
  struct REDIRECTION_FUNCTION_DESCRIPTOR
    dll_name : PSTR
    function_name : PSTR
    redirection_target : Void*
  end
  struct REDIRECTION_DESCRIPTOR
    version : UInt32
    function_count : UInt32
    redirections : REDIRECTION_FUNCTION_DESCRIPTOR*
  end


  # Params # hlibmodule : HINSTANCE [In]
  fun DisableThreadLibraryCalls(hlibmodule : HINSTANCE) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],wlanguage : UInt16 [In]
  fun FindResourceExW(hmodule : HINSTANCE, lptype : LibC::LPWSTR, lpname : LibC::LPWSTR, wlanguage : UInt16) : HRSRC

  # Params # hlibmodule : HINSTANCE [In]
  # Commented out because function is part of Lib C
  #fun FreeLibrary(hlibmodule : HINSTANCE) : LibC::BOOL

  # Params # hlibmodule : HINSTANCE [In],dwexitcode : UInt32 [In]
  fun FreeLibraryAndExitThread(hlibmodule : HINSTANCE, dwexitcode : UInt32)

  # Params # hresdata : LibC::IntPtrT [In]
  fun FreeResource(hresdata : LibC::IntPtrT) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lpfilename : UInt8* [In],nsize : UInt32 [In]
  fun GetModuleFileNameA(hmodule : HINSTANCE, lpfilename : UInt8*, nsize : UInt32) : UInt32

  # Params # hmodule : HINSTANCE [In],lpfilename : Char* [In],nsize : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun GetModuleFileNameW(hmodule : HINSTANCE, lpfilename : Char*, nsize : UInt32) : UInt32

  # Params # lpmodulename : PSTR [In]
  fun GetModuleHandleA(lpmodulename : PSTR) : HINSTANCE

  # Params # lpmodulename : LibC::LPWSTR [In]
  fun GetModuleHandleW(lpmodulename : LibC::LPWSTR) : HINSTANCE

  # Params # dwflags : UInt32 [In],lpmodulename : PSTR [In],phmodule : HINSTANCE* [In]
  fun GetModuleHandleExA(dwflags : UInt32, lpmodulename : PSTR, phmodule : HINSTANCE*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],lpmodulename : LibC::LPWSTR [In],phmodule : HINSTANCE* [In]
  # Commented out because function is part of Lib C
  #fun GetModuleHandleExW(dwflags : UInt32, lpmodulename : LibC::LPWSTR, phmodule : HINSTANCE*) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lpprocname : PSTR [In]
  # Commented out because function is part of Lib C
  #fun GetProcAddress(hmodule : HINSTANCE, lpprocname : PSTR) : FARPROC

  # Params # lplibfilename : PSTR [In],hfile : LibC::HANDLE [In],dwflags : LOAD_LIBRARY_FLAGS [In]
  fun LoadLibraryExA(lplibfilename : PSTR, hfile : LibC::HANDLE, dwflags : LOAD_LIBRARY_FLAGS) : HINSTANCE

  # Params # lplibfilename : LibC::LPWSTR [In],hfile : LibC::HANDLE [In],dwflags : LOAD_LIBRARY_FLAGS [In]
  # Commented out because function is part of Lib C
  #fun LoadLibraryExW(lplibfilename : LibC::LPWSTR, hfile : LibC::HANDLE, dwflags : LOAD_LIBRARY_FLAGS) : HINSTANCE

  # Params # hmodule : HINSTANCE [In],hresinfo : HRSRC [In]
  fun LoadResource(hmodule : HINSTANCE, hresinfo : HRSRC) : LibC::IntPtrT

  # Params # hresdata : LibC::IntPtrT [In]
  fun LockResource(hresdata : LibC::IntPtrT) : Void*

  # Params # hmodule : HINSTANCE [In],hresinfo : HRSRC [In]
  fun SizeofResource(hmodule : HINSTANCE, hresinfo : HRSRC) : UInt32

  # Params # newdirectory : LibC::LPWSTR [In]
  fun AddDllDirectory(newdirectory : LibC::LPWSTR) : Void*

  # Params # cookie : Void* [In]
  fun RemoveDllDirectory(cookie : Void*) : LibC::BOOL

  # Params # directoryflags : LOAD_LIBRARY_FLAGS [In]
  fun SetDefaultDllDirectories(directoryflags : LOAD_LIBRARY_FLAGS) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : PSTR [In],lpname : PSTR [In],lpenumfunc : ENUMRESLANGPROCA [In],lparam : LibC::IntPtrT [In],dwflags : UInt32 [In],langid : UInt16 [In]
  fun EnumResourceLanguagesExA(hmodule : HINSTANCE, lptype : PSTR, lpname : PSTR, lpenumfunc : ENUMRESLANGPROCA, lparam : LibC::IntPtrT, dwflags : UInt32, langid : UInt16) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],lpenumfunc : ENUMRESLANGPROCW [In],lparam : LibC::IntPtrT [In],dwflags : UInt32 [In],langid : UInt16 [In]
  fun EnumResourceLanguagesExW(hmodule : HINSTANCE, lptype : LibC::LPWSTR, lpname : LibC::LPWSTR, lpenumfunc : ENUMRESLANGPROCW, lparam : LibC::IntPtrT, dwflags : UInt32, langid : UInt16) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : PSTR [In],lpenumfunc : ENUMRESNAMEPROCA [In],lparam : LibC::IntPtrT [In],dwflags : UInt32 [In],langid : UInt16 [In]
  fun EnumResourceNamesExA(hmodule : HINSTANCE, lptype : PSTR, lpenumfunc : ENUMRESNAMEPROCA, lparam : LibC::IntPtrT, dwflags : UInt32, langid : UInt16) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : LibC::LPWSTR [In],lpenumfunc : ENUMRESNAMEPROCW [In],lparam : LibC::IntPtrT [In],dwflags : UInt32 [In],langid : UInt16 [In]
  fun EnumResourceNamesExW(hmodule : HINSTANCE, lptype : LibC::LPWSTR, lpenumfunc : ENUMRESNAMEPROCW, lparam : LibC::IntPtrT, dwflags : UInt32, langid : UInt16) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lpenumfunc : ENUMRESTYPEPROCA [In],lparam : LibC::IntPtrT [In],dwflags : UInt32 [In],langid : UInt16 [In]
  fun EnumResourceTypesExA(hmodule : HINSTANCE, lpenumfunc : ENUMRESTYPEPROCA, lparam : LibC::IntPtrT, dwflags : UInt32, langid : UInt16) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lpenumfunc : ENUMRESTYPEPROCW [In],lparam : LibC::IntPtrT [In],dwflags : UInt32 [In],langid : UInt16 [In]
  fun EnumResourceTypesExW(hmodule : HINSTANCE, lpenumfunc : ENUMRESTYPEPROCW, lparam : LibC::IntPtrT, dwflags : UInt32, langid : UInt16) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lpname : LibC::LPWSTR [In],lptype : LibC::LPWSTR [In]
  fun FindResourceW(hmodule : HINSTANCE, lpname : LibC::LPWSTR, lptype : LibC::LPWSTR) : HRSRC

  # Params # lplibfilename : PSTR [In]
  fun LoadLibraryA(lplibfilename : PSTR) : HINSTANCE

  # Params # lplibfilename : LibC::LPWSTR [In]
  fun LoadLibraryW(lplibfilename : LibC::LPWSTR) : HINSTANCE

  # Params # hmodule : HINSTANCE [In],lptype : LibC::LPWSTR [In],lpenumfunc : ENUMRESNAMEPROCW [In],lparam : LibC::IntPtrT [In]
  fun EnumResourceNamesW(hmodule : HINSTANCE, lptype : LibC::LPWSTR, lpenumfunc : ENUMRESNAMEPROCW, lparam : LibC::IntPtrT) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : PSTR [In],lpenumfunc : ENUMRESNAMEPROCA [In],lparam : LibC::IntPtrT [In]
  fun EnumResourceNamesA(hmodule : HINSTANCE, lptype : PSTR, lpenumfunc : ENUMRESNAMEPROCA, lparam : LibC::IntPtrT) : LibC::BOOL

  # Params # lpmodulename : PSTR [In],lpparameterblock : Void* [In]
  fun LoadModule(lpmodulename : PSTR, lpparameterblock : Void*) : UInt32

  # Params # lpwlibfilename : LibC::LPWSTR [In],reserved : UInt32 [In]
  fun LoadPackagedLibrary(lpwlibfilename : LibC::LPWSTR, reserved : UInt32) : HINSTANCE

  # Params # hmodule : HINSTANCE [In],lpname : PSTR [In],lptype : PSTR [In]
  fun FindResourceA(hmodule : HINSTANCE, lpname : PSTR, lptype : PSTR) : HRSRC

  # Params # hmodule : HINSTANCE [In],lptype : PSTR [In],lpname : PSTR [In],wlanguage : UInt16 [In]
  fun FindResourceExA(hmodule : HINSTANCE, lptype : PSTR, lpname : PSTR, wlanguage : UInt16) : HRSRC

  # Params # hmodule : HINSTANCE [In],lpenumfunc : ENUMRESTYPEPROCA [In],lparam : LibC::IntPtrT [In]
  fun EnumResourceTypesA(hmodule : HINSTANCE, lpenumfunc : ENUMRESTYPEPROCA, lparam : LibC::IntPtrT) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lpenumfunc : ENUMRESTYPEPROCW [In],lparam : LibC::IntPtrT [In]
  fun EnumResourceTypesW(hmodule : HINSTANCE, lpenumfunc : ENUMRESTYPEPROCW, lparam : LibC::IntPtrT) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : PSTR [In],lpname : PSTR [In],lpenumfunc : ENUMRESLANGPROCA [In],lparam : LibC::IntPtrT [In]
  fun EnumResourceLanguagesA(hmodule : HINSTANCE, lptype : PSTR, lpname : PSTR, lpenumfunc : ENUMRESLANGPROCA, lparam : LibC::IntPtrT) : LibC::BOOL

  # Params # hmodule : HINSTANCE [In],lptype : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],lpenumfunc : ENUMRESLANGPROCW [In],lparam : LibC::IntPtrT [In]
  fun EnumResourceLanguagesW(hmodule : HINSTANCE, lptype : LibC::LPWSTR, lpname : LibC::LPWSTR, lpenumfunc : ENUMRESLANGPROCW, lparam : LibC::IntPtrT) : LibC::BOOL

  # Params # pfilename : PSTR [In],bdeleteexistingresources : LibC::BOOL [In]
  fun BeginUpdateResourceA(pfilename : PSTR, bdeleteexistingresources : LibC::BOOL) : LibC::HANDLE

  # Params # pfilename : LibC::LPWSTR [In],bdeleteexistingresources : LibC::BOOL [In]
  fun BeginUpdateResourceW(pfilename : LibC::LPWSTR, bdeleteexistingresources : LibC::BOOL) : LibC::HANDLE

  # Params # hupdate : LibC::HANDLE [In],lptype : PSTR [In],lpname : PSTR [In],wlanguage : UInt16 [In],lpdata : Void* [In],cb : UInt32 [In]
  fun UpdateResourceA(hupdate : LibC::HANDLE, lptype : PSTR, lpname : PSTR, wlanguage : UInt16, lpdata : Void*, cb : UInt32) : LibC::BOOL

  # Params # hupdate : LibC::HANDLE [In],lptype : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],wlanguage : UInt16 [In],lpdata : Void* [In],cb : UInt32 [In]
  fun UpdateResourceW(hupdate : LibC::HANDLE, lptype : LibC::LPWSTR, lpname : LibC::LPWSTR, wlanguage : UInt16, lpdata : Void*, cb : UInt32) : LibC::BOOL

  # Params # hupdate : LibC::HANDLE [In],fdiscard : LibC::BOOL [In]
  fun EndUpdateResourceA(hupdate : LibC::HANDLE, fdiscard : LibC::BOOL) : LibC::BOOL

  # Params # hupdate : LibC::HANDLE [In],fdiscard : LibC::BOOL [In]
  fun EndUpdateResourceW(hupdate : LibC::HANDLE, fdiscard : LibC::BOOL) : LibC::BOOL

  # Params # lppathname : PSTR [In]
  fun SetDllDirectoryA(lppathname : PSTR) : LibC::BOOL

  # Params # lppathname : LibC::LPWSTR [In]
  fun SetDllDirectoryW(lppathname : LibC::LPWSTR) : LibC::BOOL

  # Params # nbufferlength : UInt32 [In],lpbuffer : UInt8* [In]
  fun GetDllDirectoryA(nbufferlength : UInt32, lpbuffer : UInt8*) : UInt32

  # Params # nbufferlength : UInt32 [In],lpbuffer : Char* [In]
  fun GetDllDirectoryW(nbufferlength : UInt32, lpbuffer : Char*) : UInt32
end
