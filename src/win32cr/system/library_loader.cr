require "./../foundation.cr"

module Win32cr::System::LibraryLoader
  alias ENUMRESLANGPROCA = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt16, LibC::IntPtrT, Win32cr::Foundation::BOOL)

  alias ENUMRESLANGPROCW = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt16, LibC::IntPtrT, Win32cr::Foundation::BOOL)

  alias ENUMRESNAMEPROCA = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, LibC::IntPtrT, Win32cr::Foundation::BOOL)

  alias ENUMRESNAMEPROCW = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::IntPtrT, Win32cr::Foundation::BOOL)

  alias ENUMRESTYPEPROCA = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PSTR, LibC::IntPtrT, Win32cr::Foundation::BOOL)

  alias ENUMRESTYPEPROCW = Proc(Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PWSTR, LibC::IntPtrT, Win32cr::Foundation::BOOL)

  alias PGET_MODULE_HANDLE_EXA = Proc(UInt32, Win32cr::Foundation::PSTR, Win32cr::Foundation::HINSTANCE*, Win32cr::Foundation::BOOL)

  alias PGET_MODULE_HANDLE_EXW = Proc(UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HINSTANCE*, Win32cr::Foundation::BOOL)

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

  @[Flags]
  enum LOAD_LIBRARY_FLAGS : UInt32
    DONT_RESOLVE_DLL_REFERENCES = 1_u32
    LOAD_LIBRARY_AS_DATAFILE = 2_u32
    LOAD_WITH_ALTERED_SEARCH_PATH = 8_u32
    LOAD_IGNORE_CODE_AUTHZ_LEVEL = 16_u32
    LOAD_LIBRARY_AS_IMAGE_RESOURCE = 32_u32
    LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE = 64_u32
    LOAD_LIBRARY_REQUIRE_SIGNED_TARGET = 128_u32
    LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR = 256_u32
    LOAD_LIBRARY_SEARCH_APPLICATION_DIR = 512_u32
    LOAD_LIBRARY_SEARCH_USER_DIRS = 1024_u32
    LOAD_LIBRARY_SEARCH_SYSTEM32 = 2048_u32
    LOAD_LIBRARY_SEARCH_DEFAULT_DIRS = 4096_u32
    LOAD_LIBRARY_SAFE_CURRENT_DIRS = 8192_u32
    LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER = 16384_u32
  end

  @[Extern]
  struct ENUMUILANG
    property num_of_enum_ui_lang : UInt32
    property size_of_enum_ui_buffer : UInt32
    property pEnumUIBuffer : UInt16*
    def initialize(@num_of_enum_ui_lang : UInt32, @size_of_enum_ui_buffer : UInt32, @pEnumUIBuffer : UInt16*)
    end
  end

  @[Extern]
  struct REDIRECTION_FUNCTION_DESCRIPTOR
    property dll_name : Win32cr::Foundation::PSTR
    property function_name : Win32cr::Foundation::PSTR
    property redirection_target : Void*
    def initialize(@dll_name : Win32cr::Foundation::PSTR, @function_name : Win32cr::Foundation::PSTR, @redirection_target : Void*)
    end
  end

  @[Extern]
  struct REDIRECTION_DESCRIPTOR
    property version : UInt32
    property function_count : UInt32
    property redirections : Win32cr::System::LibraryLoader::REDIRECTION_FUNCTION_DESCRIPTOR*
    def initialize(@version : UInt32, @function_count : UInt32, @redirections : Win32cr::System::LibraryLoader::REDIRECTION_FUNCTION_DESCRIPTOR*)
    end
  end

  @[Link("kernel32")]
  lib C
    fun DisableThreadLibraryCalls(hLibModule : Win32cr::Foundation::HINSTANCE) : Win32cr::Foundation::BOOL

    fun FindResourceExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, wLanguage : UInt16) : Win32cr::Foundation::HRSRC

    # Commented out due to being part of LibC
    #fun FreeLibrary(hLibModule : Win32cr::Foundation::HINSTANCE) : Win32cr::Foundation::BOOL

    fun FreeLibraryAndExitThread(hLibModule : Win32cr::Foundation::HINSTANCE, dwExitCode : UInt32) : Void

    fun FreeResource(hResData : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun GetModuleFileNameA(hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt8*, nSize : UInt32) : UInt32

    # Commented out due to being part of LibC
    #fun GetModuleFileNameW(hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt16*, nSize : UInt32) : UInt32

    fun GetModuleHandleA(lpModuleName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HINSTANCE

    fun GetModuleHandleW(lpModuleName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HINSTANCE

    fun GetModuleHandleExA(dwFlags : UInt32, lpModuleName : Win32cr::Foundation::PSTR, phModule : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetModuleHandleExW(dwFlags : UInt32, lpModuleName : Win32cr::Foundation::PWSTR, phModule : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetProcAddress(hModule : Win32cr::Foundation::HINSTANCE, lpProcName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::FARPROC

    fun LoadLibraryExA(lpLibFileName : Win32cr::Foundation::PSTR, hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::HINSTANCE

    # Commented out due to being part of LibC
    #fun LoadLibraryExW(lpLibFileName : Win32cr::Foundation::PWSTR, hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::HINSTANCE

    fun LoadResource(hModule : Win32cr::Foundation::HINSTANCE, hResInfo : Win32cr::Foundation::HRSRC) : LibC::IntPtrT

    fun LockResource(hResData : LibC::IntPtrT) : Void*

    fun SizeofResource(hModule : Win32cr::Foundation::HINSTANCE, hResInfo : Win32cr::Foundation::HRSRC) : UInt32

    fun AddDllDirectory(new_directory : Win32cr::Foundation::PWSTR) : Void*

    fun RemoveDllDirectory(cookie : Void*) : Win32cr::Foundation::BOOL

    fun SetDefaultDllDirectories(directory_flags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::BOOL

    fun EnumResourceLanguagesExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    fun EnumResourceLanguagesExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    fun EnumResourceNamesExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    fun EnumResourceNamesExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    fun EnumResourceTypesExA(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    fun EnumResourceTypesExW(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    fun FindResourceW(hModule : Win32cr::Foundation::HINSTANCE, lpName : Win32cr::Foundation::PWSTR, lpType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRSRC

    fun LoadLibraryA(lpLibFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HINSTANCE

    fun LoadLibraryW(lpLibFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HINSTANCE

    fun EnumResourceNamesW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EnumResourceNamesA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun LoadModule(lpModuleName : Win32cr::Foundation::PSTR, lpParameterBlock : Void*) : UInt32

    fun LoadPackagedLibrary(lpwLibFileName : Win32cr::Foundation::PWSTR, reserved : UInt32) : Win32cr::Foundation::HINSTANCE

    fun FindResourceA(hModule : Win32cr::Foundation::HINSTANCE, lpName : Win32cr::Foundation::PSTR, lpType : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRSRC

    fun FindResourceExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, wLanguage : UInt16) : Win32cr::Foundation::HRSRC

    fun EnumResourceTypesA(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EnumResourceTypesW(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EnumResourceLanguagesA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun EnumResourceLanguagesW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    fun BeginUpdateResourceA(pFileName : Win32cr::Foundation::PSTR, bDeleteExistingResources : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    fun BeginUpdateResourceW(pFileName : Win32cr::Foundation::PWSTR, bDeleteExistingResources : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    fun UpdateResourceA(hUpdate : Win32cr::Foundation::HANDLE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, wLanguage : UInt16, lpData : Void*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun UpdateResourceW(hUpdate : Win32cr::Foundation::HANDLE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, wLanguage : UInt16, lpData : Void*, cb : UInt32) : Win32cr::Foundation::BOOL

    fun EndUpdateResourceA(hUpdate : Win32cr::Foundation::HANDLE, fDiscard : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun EndUpdateResourceW(hUpdate : Win32cr::Foundation::HANDLE, fDiscard : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun SetDllDirectoryA(lpPathName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun SetDllDirectoryW(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetDllDirectoryA(nBufferLength : UInt32, lpBuffer : UInt8*) : UInt32

    fun GetDllDirectoryW(nBufferLength : UInt32, lpBuffer : UInt16*) : UInt32

  end
end