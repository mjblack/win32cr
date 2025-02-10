require "./../foundation.cr"

module Win32cr::System::LibraryLoader
  extend self
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

  def disableThreadLibraryCalls(hLibModule : Win32cr::Foundation::HINSTANCE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.DisableThreadLibraryCalls(hLibModule)
    {% end %}
  end

  def findResourceExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, wLanguage : UInt16) : Win32cr::Foundation::HRSRC
    {% if !flag?(:docs) %}
    C.FindResourceExW(hModule, lpType, lpName, wLanguage)
    {% end %}
  end

  #def freeLibrary(hLibModule : Win32cr::Foundation::HINSTANCE) : Win32cr::Foundation::BOOL
    #C.FreeLibrary(hLibModule)
  #end

  def freeLibraryAndExitThread(hLibModule : Win32cr::Foundation::HINSTANCE, dwExitCode : UInt32) : Void
    {% if !flag?(:docs) %}
    C.FreeLibraryAndExitThread(hLibModule, dwExitCode)
    {% end %}
  end

  def freeResource(hResData : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.FreeResource(hResData)
    {% end %}
  end

  def getModuleFileNameA(hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt8*, nSize : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.GetModuleFileNameA(hModule, lpFilename, nSize)
    {% end %}
  end

  #def getModuleFileNameW(hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt16*, nSize : UInt32) : UInt32
    #C.GetModuleFileNameW(hModule, lpFilename, nSize)
  #end

  def getModuleHandleA(lpModuleName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HINSTANCE
    {% if !flag?(:docs) %}
    C.GetModuleHandleA(lpModuleName)
    {% end %}
  end

  def getModuleHandleW(lpModuleName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HINSTANCE
    {% if !flag?(:docs) %}
    C.GetModuleHandleW(lpModuleName)
    {% end %}
  end

  def getModuleHandleExA(dwFlags : UInt32, lpModuleName : Win32cr::Foundation::PSTR, phModule : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetModuleHandleExA(dwFlags, lpModuleName, phModule)
    {% end %}
  end

  #def getModuleHandleExW(dwFlags : UInt32, lpModuleName : Win32cr::Foundation::PWSTR, phModule : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::BOOL
    #C.GetModuleHandleExW(dwFlags, lpModuleName, phModule)
  #end

  #def getProcAddress(hModule : Win32cr::Foundation::HINSTANCE, lpProcName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::FARPROC
    #C.GetProcAddress(hModule, lpProcName)
  #end

  def loadLibraryExA(lpLibFileName : Win32cr::Foundation::PSTR, hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::HINSTANCE
    {% if !flag?(:docs) %}
    C.LoadLibraryExA(lpLibFileName, hFile, dwFlags)
    {% end %}
  end

  #def loadLibraryExW(lpLibFileName : Win32cr::Foundation::PWSTR, hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::HINSTANCE
    #C.LoadLibraryExW(lpLibFileName, hFile, dwFlags)
  #end

  def loadResource(hModule : Win32cr::Foundation::HINSTANCE, hResInfo : Win32cr::Foundation::HRSRC) : LibC::IntPtrT
    {% if !flag?(:docs) %}
    C.LoadResource(hModule, hResInfo)
    {% end %}
  end

  def lockResource(hResData : LibC::IntPtrT) : Void*
    {% if !flag?(:docs) %}
    C.LockResource(hResData)
    {% end %}
  end

  def sizeofResource(hModule : Win32cr::Foundation::HINSTANCE, hResInfo : Win32cr::Foundation::HRSRC) : UInt32
    {% if !flag?(:docs) %}
    C.SizeofResource(hModule, hResInfo)
    {% end %}
  end

  def addDllDirectory(new_directory : Win32cr::Foundation::PWSTR) : Void*
    {% if !flag?(:docs) %}
    C.AddDllDirectory(new_directory)
    {% end %}
  end

  def removeDllDirectory(cookie : Void*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.RemoveDllDirectory(cookie)
    {% end %}
  end

  def setDefaultDllDirectories(directory_flags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetDefaultDllDirectories(directory_flags)
    {% end %}
  end

  def enumResourceLanguagesExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceLanguagesExA(hModule, lpType, lpName, lpEnumFunc, lParam, dwFlags, lang_id)
    {% end %}
  end

  def enumResourceLanguagesExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceLanguagesExW(hModule, lpType, lpName, lpEnumFunc, lParam, dwFlags, lang_id)
    {% end %}
  end

  def enumResourceNamesExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceNamesExA(hModule, lpType, lpEnumFunc, lParam, dwFlags, lang_id)
    {% end %}
  end

  def enumResourceNamesExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceNamesExW(hModule, lpType, lpEnumFunc, lParam, dwFlags, lang_id)
    {% end %}
  end

  def enumResourceTypesExA(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceTypesExA(hModule, lpEnumFunc, lParam, dwFlags, lang_id)
    {% end %}
  end

  def enumResourceTypesExW(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceTypesExW(hModule, lpEnumFunc, lParam, dwFlags, lang_id)
    {% end %}
  end

  def findResourceW(hModule : Win32cr::Foundation::HINSTANCE, lpName : Win32cr::Foundation::PWSTR, lpType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRSRC
    {% if !flag?(:docs) %}
    C.FindResourceW(hModule, lpName, lpType)
    {% end %}
  end

  def loadLibraryA(lpLibFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HINSTANCE
    {% if !flag?(:docs) %}
    C.LoadLibraryA(lpLibFileName)
    {% end %}
  end

  def loadLibraryW(lpLibFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HINSTANCE
    {% if !flag?(:docs) %}
    C.LoadLibraryW(lpLibFileName)
    {% end %}
  end

  def enumResourceNamesW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceNamesW(hModule, lpType, lpEnumFunc, lParam)
    {% end %}
  end

  def enumResourceNamesA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceNamesA(hModule, lpType, lpEnumFunc, lParam)
    {% end %}
  end

  def loadModule(lpModuleName : Win32cr::Foundation::PSTR, lpParameterBlock : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.LoadModule(lpModuleName, lpParameterBlock)
    {% end %}
  end

  def loadPackagedLibrary(lpwLibFileName : Win32cr::Foundation::PWSTR, reserved : UInt32) : Win32cr::Foundation::HINSTANCE
    {% if !flag?(:docs) %}
    C.LoadPackagedLibrary(lpwLibFileName, reserved)
    {% end %}
  end

  def findResourceA(hModule : Win32cr::Foundation::HINSTANCE, lpName : Win32cr::Foundation::PSTR, lpType : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRSRC
    {% if !flag?(:docs) %}
    C.FindResourceA(hModule, lpName, lpType)
    {% end %}
  end

  def findResourceExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, wLanguage : UInt16) : Win32cr::Foundation::HRSRC
    {% if !flag?(:docs) %}
    C.FindResourceExA(hModule, lpType, lpName, wLanguage)
    {% end %}
  end

  def enumResourceTypesA(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceTypesA(hModule, lpEnumFunc, lParam)
    {% end %}
  end

  def enumResourceTypesW(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceTypesW(hModule, lpEnumFunc, lParam)
    {% end %}
  end

  def enumResourceLanguagesA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceLanguagesA(hModule, lpType, lpName, lpEnumFunc, lParam)
    {% end %}
  end

  def enumResourceLanguagesW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EnumResourceLanguagesW(hModule, lpType, lpName, lpEnumFunc, lParam)
    {% end %}
  end

  def beginUpdateResourceA(pFileName : Win32cr::Foundation::PSTR, bDeleteExistingResources : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.BeginUpdateResourceA(pFileName, bDeleteExistingResources)
    {% end %}
  end

  def beginUpdateResourceW(pFileName : Win32cr::Foundation::PWSTR, bDeleteExistingResources : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.BeginUpdateResourceW(pFileName, bDeleteExistingResources)
    {% end %}
  end

  def updateResourceA(hUpdate : Win32cr::Foundation::HANDLE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, wLanguage : UInt16, lpData : Void*, cb : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.UpdateResourceA(hUpdate, lpType, lpName, wLanguage, lpData, cb)
    {% end %}
  end

  def updateResourceW(hUpdate : Win32cr::Foundation::HANDLE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, wLanguage : UInt16, lpData : Void*, cb : UInt32) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.UpdateResourceW(hUpdate, lpType, lpName, wLanguage, lpData, cb)
    {% end %}
  end

  def endUpdateResourceA(hUpdate : Win32cr::Foundation::HANDLE, fDiscard : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EndUpdateResourceA(hUpdate, fDiscard)
    {% end %}
  end

  def endUpdateResourceW(hUpdate : Win32cr::Foundation::HANDLE, fDiscard : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.EndUpdateResourceW(hUpdate, fDiscard)
    {% end %}
  end

  def setDllDirectoryA(lpPathName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetDllDirectoryA(lpPathName)
    {% end %}
  end

  def setDllDirectoryW(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetDllDirectoryW(lpPathName)
    {% end %}
  end

  def getDllDirectoryA(nBufferLength : UInt32, lpBuffer : UInt8*) : UInt32
    {% if !flag?(:docs) %}
    C.GetDllDirectoryA(nBufferLength, lpBuffer)
    {% end %}
  end

  def getDllDirectoryW(nBufferLength : UInt32, lpBuffer : UInt16*) : UInt32
    {% if !flag?(:docs) %}
    C.GetDllDirectoryW(nBufferLength, lpBuffer)
    {% end %}
  end

  @[Link("kernel32")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun DisableThreadLibraryCalls(hLibModule : Win32cr::Foundation::HINSTANCE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FindResourceExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, wLanguage : UInt16) : Win32cr::Foundation::HRSRC

    # Commented out due to being part of LibC
    # :nodoc:
    #fun FreeLibrary(hLibModule : Win32cr::Foundation::HINSTANCE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FreeLibraryAndExitThread(hLibModule : Win32cr::Foundation::HINSTANCE, dwExitCode : UInt32) : Void

    # :nodoc:
    fun FreeResource(hResData : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetModuleFileNameA(hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt8*, nSize : UInt32) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetModuleFileNameW(hModule : Win32cr::Foundation::HINSTANCE, lpFilename : UInt16*, nSize : UInt32) : UInt32

    # :nodoc:
    fun GetModuleHandleA(lpModuleName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HINSTANCE

    # :nodoc:
    fun GetModuleHandleW(lpModuleName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HINSTANCE

    # :nodoc:
    fun GetModuleHandleExA(dwFlags : UInt32, lpModuleName : Win32cr::Foundation::PSTR, phModule : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetModuleHandleExW(dwFlags : UInt32, lpModuleName : Win32cr::Foundation::PWSTR, phModule : Win32cr::Foundation::HINSTANCE*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetProcAddress(hModule : Win32cr::Foundation::HINSTANCE, lpProcName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::FARPROC

    # :nodoc:
    fun LoadLibraryExA(lpLibFileName : Win32cr::Foundation::PSTR, hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::HINSTANCE

    # Commented out due to being part of LibC
    # :nodoc:
    #fun LoadLibraryExW(lpLibFileName : Win32cr::Foundation::PWSTR, hFile : Win32cr::Foundation::HANDLE, dwFlags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::HINSTANCE

    # :nodoc:
    fun LoadResource(hModule : Win32cr::Foundation::HINSTANCE, hResInfo : Win32cr::Foundation::HRSRC) : LibC::IntPtrT

    # :nodoc:
    fun LockResource(hResData : LibC::IntPtrT) : Void*

    # :nodoc:
    fun SizeofResource(hModule : Win32cr::Foundation::HINSTANCE, hResInfo : Win32cr::Foundation::HRSRC) : UInt32

    # :nodoc:
    fun AddDllDirectory(new_directory : Win32cr::Foundation::PWSTR) : Void*

    # :nodoc:
    fun RemoveDllDirectory(cookie : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDefaultDllDirectories(directory_flags : Win32cr::System::LibraryLoader::LOAD_LIBRARY_FLAGS) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceLanguagesExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceLanguagesExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceNamesExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceNamesExW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceTypesExA(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCA, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceTypesExW(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCW, lParam : LibC::IntPtrT, dwFlags : UInt32, lang_id : UInt16) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun FindResourceW(hModule : Win32cr::Foundation::HINSTANCE, lpName : Win32cr::Foundation::PWSTR, lpType : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRSRC

    # :nodoc:
    fun LoadLibraryA(lpLibFileName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HINSTANCE

    # :nodoc:
    fun LoadLibraryW(lpLibFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HINSTANCE

    # :nodoc:
    fun EnumResourceNamesW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceNamesA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESNAMEPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LoadModule(lpModuleName : Win32cr::Foundation::PSTR, lpParameterBlock : Void*) : UInt32

    # :nodoc:
    fun LoadPackagedLibrary(lpwLibFileName : Win32cr::Foundation::PWSTR, reserved : UInt32) : Win32cr::Foundation::HINSTANCE

    # :nodoc:
    fun FindResourceA(hModule : Win32cr::Foundation::HINSTANCE, lpName : Win32cr::Foundation::PSTR, lpType : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRSRC

    # :nodoc:
    fun FindResourceExA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, wLanguage : UInt16) : Win32cr::Foundation::HRSRC

    # :nodoc:
    fun EnumResourceTypesA(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceTypesW(hModule : Win32cr::Foundation::HINSTANCE, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESTYPEPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceLanguagesA(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCA, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnumResourceLanguagesW(hModule : Win32cr::Foundation::HINSTANCE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, lpEnumFunc : Win32cr::System::LibraryLoader::ENUMRESLANGPROCW, lParam : LibC::IntPtrT) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun BeginUpdateResourceA(pFileName : Win32cr::Foundation::PSTR, bDeleteExistingResources : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun BeginUpdateResourceW(pFileName : Win32cr::Foundation::PWSTR, bDeleteExistingResources : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun UpdateResourceA(hUpdate : Win32cr::Foundation::HANDLE, lpType : Win32cr::Foundation::PSTR, lpName : Win32cr::Foundation::PSTR, wLanguage : UInt16, lpData : Void*, cb : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun UpdateResourceW(hUpdate : Win32cr::Foundation::HANDLE, lpType : Win32cr::Foundation::PWSTR, lpName : Win32cr::Foundation::PWSTR, wLanguage : UInt16, lpData : Void*, cb : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EndUpdateResourceA(hUpdate : Win32cr::Foundation::HANDLE, fDiscard : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EndUpdateResourceW(hUpdate : Win32cr::Foundation::HANDLE, fDiscard : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDllDirectoryA(lpPathName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetDllDirectoryW(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDllDirectoryA(nBufferLength : UInt32, lpBuffer : UInt8*) : UInt32

    # :nodoc:
    fun GetDllDirectoryW(nBufferLength : UInt32, lpBuffer : UInt16*) : UInt32

  end
  {% end %}
end