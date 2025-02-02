require "./../foundation.cr"

module Win32cr::System::Environment
  extend self
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE = Proc(LibC::UIntPtrT, Void)

  {% if flag?(:x86_64) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_EXCEPTION_AMD64*, Int32)
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*, Int32)
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*, Int32)
  {% end %}

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES = Proc(Void*, LibC::UIntPtrT, Void*, UInt32, Int32)

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES = Proc(Void*, LibC::UIntPtrT, Int32)

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES = Proc(Void*, LibC::UIntPtrT, UInt32, Int32)

  {% if flag?(:x86_64) || flag?(:arm) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*, Int32)
  {% end %}

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION = Proc(Win32cr::System::Environment::ENCLAVE_INFORMATION*, Int32)

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY = Proc(Win32cr::System::Environment::ENCLAVE_VBS_BASIC_KEY_REQUEST*, UInt32, UInt8*, Int32)

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT = Proc(UInt8*, Void*, UInt32, UInt32*, Int32)

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT = Proc(Void*, UInt32, Int32)

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA = Proc(UInt8*, UInt32, UInt64*, Int32)

  {% if flag?(:i386) || flag?(:arm) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = Proc(Void*, Int32)
  {% end %}

  {% if flag?(:i386) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32*, Int32)
  {% end %}

  {% if flag?(:i386) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32*, Int32)
  {% end %}

  {% if flag?(:i386) %}
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = Proc(Win32cr::System::Environment::VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32*, Int32)
  {% end %}

  ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG = 1_u32
  ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG = 2_u32
  ENCLAVE_UNSEAL_FLAG_STALE_KEY = 1_u32
  ENCLAVE_FLAG_FULL_DEBUG_ENABLED = 1_u32
  ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED = 2_u32
  ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE = 4_u32
  VBS_ENCLAVE_REPORT_PKG_HEADER_VERSION_CURRENT = 1_u32
  VBS_ENCLAVE_REPORT_SIGNATURE_SCHEME_SHA256_RSA_PSS_SHA256 = 1_u32
  VBS_ENCLAVE_REPORT_VERSION_CURRENT = 1_u32
  ENCLAVE_REPORT_DATA_LENGTH = 64_u32
  VBS_ENCLAVE_VARDATA_INVALID = 0_u32
  VBS_ENCLAVE_VARDATA_MODULE = 1_u32
  ENCLAVE_VBS_BASIC_KEY_FLAG_MEASUREMENT = 1_u32
  ENCLAVE_VBS_BASIC_KEY_FLAG_FAMILY_ID = 2_u32
  ENCLAVE_VBS_BASIC_KEY_FLAG_IMAGE_ID = 4_u32
  ENCLAVE_VBS_BASIC_KEY_FLAG_DEBUG_KEY = 8_u32

  enum ENCLAVE_SEALING_IDENTITY_POLICY
    ENCLAVE_IDENTITY_POLICY_SEAL_INVALID = 0_i32
    ENCLAVE_IDENTITY_POLICY_SEAL_EXACT_CODE = 1_i32
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_PRIMARY_CODE = 2_i32
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_IMAGE = 3_i32
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_FAMILY = 4_i32
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_AUTHOR = 5_i32
  end

  @[Extern]
  struct ENCLAVE_IDENTITY
    property owner_id : UInt8[32]
    property unique_id : UInt8[32]
    property author_id : UInt8[32]
    property family_id : UInt8[16]
    property image_id : UInt8[16]
    property enclave_svn : UInt32
    property secure_kernel_svn : UInt32
    property platform_svn : UInt32
    property flags : UInt32
    property signing_level : UInt32
    property enclave_type : UInt32
    def initialize(@owner_id : UInt8[32], @unique_id : UInt8[32], @author_id : UInt8[32], @family_id : UInt8[16], @image_id : UInt8[16], @enclave_svn : UInt32, @secure_kernel_svn : UInt32, @platform_svn : UInt32, @flags : UInt32, @signing_level : UInt32, @enclave_type : UInt32)
    end
  end

  @[Extern]
  struct VBS_ENCLAVE_REPORT_PKG_HEADER
    property package_size : UInt32
    property version : UInt32
    property signature_scheme : UInt32
    property signed_statement_size : UInt32
    property signature_size : UInt32
    property reserved : UInt32
    def initialize(@package_size : UInt32, @version : UInt32, @signature_scheme : UInt32, @signed_statement_size : UInt32, @signature_size : UInt32, @reserved : UInt32)
    end
  end

  @[Extern]
  struct VBS_ENCLAVE_REPORT
    property report_size : UInt32
    property report_version : UInt32
    property enclave_data : UInt8[64]
    property enclave_identity : Win32cr::System::Environment::ENCLAVE_IDENTITY
    def initialize(@report_size : UInt32, @report_version : UInt32, @enclave_data : UInt8[64], @enclave_identity : Win32cr::System::Environment::ENCLAVE_IDENTITY)
    end
  end

  @[Extern]
  struct VBS_ENCLAVE_REPORT_VARDATA_HEADER
    property data_type : UInt32
    property size : UInt32
    def initialize(@data_type : UInt32, @size : UInt32)
    end
  end

  @[Extern]
  struct VBS_ENCLAVE_REPORT_MODULE
    property header : Win32cr::System::Environment::VBS_ENCLAVE_REPORT_VARDATA_HEADER
    property unique_id : UInt8[32]
    property author_id : UInt8[32]
    property family_id : UInt8[16]
    property image_id : UInt8[16]
    property svn : UInt32
    property module_name : UInt16*
    def initialize(@header : Win32cr::System::Environment::VBS_ENCLAVE_REPORT_VARDATA_HEADER, @unique_id : UInt8[32], @author_id : UInt8[32], @family_id : UInt8[16], @image_id : UInt8[16], @svn : UInt32, @module_name : UInt16*)
    end
  end

  @[Extern]
  struct ENCLAVE_INFORMATION
    property enclave_type : UInt32
    property reserved : UInt32
    property base_address : Void*
    property size : LibC::UIntPtrT
    property identity : Win32cr::System::Environment::ENCLAVE_IDENTITY
    def initialize(@enclave_type : UInt32, @reserved : UInt32, @base_address : Void*, @size : LibC::UIntPtrT, @identity : Win32cr::System::Environment::ENCLAVE_IDENTITY)
    end
  end

  @[Extern]
  struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32
    property thread_context : UInt32[4]
    property entry_point : UInt32
    property stack_pointer : UInt32
    property exception_entry_point : UInt32
    property exception_stack : UInt32
    property exception_active : UInt32
    def initialize(@thread_context : UInt32[4], @entry_point : UInt32, @stack_pointer : UInt32, @exception_entry_point : UInt32, @exception_stack : UInt32, @exception_active : UInt32)
    end
  end

  @[Extern]
  struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64
    property thread_context : UInt64[4]
    property entry_point : UInt64
    property stack_pointer : UInt64
    property exception_entry_point : UInt64
    property exception_stack : UInt64
    property exception_active : UInt32
    def initialize(@thread_context : UInt64[4], @entry_point : UInt64, @stack_pointer : UInt64, @exception_entry_point : UInt64, @exception_stack : UInt64, @exception_active : UInt32)
    end
  end

  @[Extern]
  struct VBS_BASIC_ENCLAVE_EXCEPTION_AMD64
    property exception_code : UInt32
    property number_parameters : UInt32
    property exception_information : LibC::UIntPtrT[3]
    property exception_rax : LibC::UIntPtrT
    property exception_rcx : LibC::UIntPtrT
    property exception_rip : LibC::UIntPtrT
    property exception_rflags : LibC::UIntPtrT
    property exception_rsp : LibC::UIntPtrT
    def initialize(@exception_code : UInt32, @number_parameters : UInt32, @exception_information : LibC::UIntPtrT[3], @exception_rax : LibC::UIntPtrT, @exception_rcx : LibC::UIntPtrT, @exception_rip : LibC::UIntPtrT, @exception_rflags : LibC::UIntPtrT, @exception_rsp : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct ENCLAVE_VBS_BASIC_KEY_REQUEST
    property request_size : UInt32
    property flags : UInt32
    property enclave_svn : UInt32
    property system_key_id : UInt32
    property current_system_key_id : UInt32
    def initialize(@request_size : UInt32, @flags : UInt32, @enclave_svn : UInt32, @system_key_id : UInt32, @current_system_key_id : UInt32)
    end
  end

  @[Extern]
  struct VBS_BASIC_ENCLAVE_SYSCALL_PAGE
    property return_from_enclave : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE
    property return_from_exception : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION
    property terminate_thread : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD
    property interrupt_thread : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD
    property commit_pages : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES
    property decommit_pages : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES
    property protect_pages : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES
    property create_thread : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD
    property get_enclave_information : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION
    property generate_key : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY
    property generate_report : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT
    property verify_report : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT
    property generate_random_data : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA
    def initialize(@return_from_enclave : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE, @return_from_exception : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION, @terminate_thread : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD, @interrupt_thread : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD, @commit_pages : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES, @decommit_pages : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES, @protect_pages : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES, @create_thread : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD, @get_enclave_information : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION, @generate_key : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY, @generate_report : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT, @verify_report : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT, @generate_random_data : Win32cr::System::Environment::VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA)
    end
  end

  def setEnvironmentStringsW(new_environment : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.SetEnvironmentStringsW(new_environment)
  end

  def getCommandLineA : Win32cr::Foundation::PSTR
    C.GetCommandLineA
  end

  def getCommandLineW : Win32cr::Foundation::PWSTR
    C.GetCommandLineW
  end

  def getEnvironmentStrings : Win32cr::Foundation::PSTR
    C.GetEnvironmentStrings
  end

  #def getEnvironmentStringsW : Win32cr::Foundation::PWSTR
    #C.GetEnvironmentStringsW
  #end

  def freeEnvironmentStringsA(penv : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.FreeEnvironmentStringsA(penv)
  end

  #def freeEnvironmentStringsW(penv : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    #C.FreeEnvironmentStringsW(penv)
  #end

  def getEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpBuffer : UInt8*, nSize : UInt32) : UInt32
    C.GetEnvironmentVariableA(lpName, lpBuffer, nSize)
  end

  #def getEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpBuffer : UInt16*, nSize : UInt32) : UInt32
    #C.GetEnvironmentVariableW(lpName, lpBuffer, nSize)
  #end

  def setEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpValue : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetEnvironmentVariableA(lpName, lpValue)
  end

  #def setEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    #C.SetEnvironmentVariableW(lpName, lpValue)
  #end

  def expandEnvironmentStringsA(lpSrc : Win32cr::Foundation::PSTR, lpDst : UInt8*, nSize : UInt32) : UInt32
    C.ExpandEnvironmentStringsA(lpSrc, lpDst, nSize)
  end

  def expandEnvironmentStringsW(lpSrc : Win32cr::Foundation::PWSTR, lpDst : UInt16*, nSize : UInt32) : UInt32
    C.ExpandEnvironmentStringsW(lpSrc, lpDst, nSize)
  end

  def setCurrentDirectoryA(lpPathName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.SetCurrentDirectoryA(lpPathName)
  end

  #def setCurrentDirectoryW(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    #C.SetCurrentDirectoryW(lpPathName)
  #end

  def getCurrentDirectoryA(nBufferLength : UInt32, lpBuffer : UInt8*) : UInt32
    C.GetCurrentDirectoryA(nBufferLength, lpBuffer)
  end

  #def getCurrentDirectoryW(nBufferLength : UInt32, lpBuffer : UInt16*) : UInt32
    #C.GetCurrentDirectoryW(nBufferLength, lpBuffer)
  #end

  def needCurrentDirectoryForExePathA(exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.NeedCurrentDirectoryForExePathA(exe_name)
  end

  def needCurrentDirectoryForExePathW(exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.NeedCurrentDirectoryForExePathW(exe_name)
  end

  def createEnvironmentBlock(lpEnvironment : Void**, hToken : Win32cr::Foundation::HANDLE, bInherit : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.CreateEnvironmentBlock(lpEnvironment, hToken, bInherit)
  end

  def destroyEnvironmentBlock(lpEnvironment : Void*) : Win32cr::Foundation::BOOL
    C.DestroyEnvironmentBlock(lpEnvironment)
  end

  def expandEnvironmentStringsForUserA(hToken : Win32cr::Foundation::HANDLE, lpSrc : Win32cr::Foundation::PSTR, lpDest : UInt8*, dwSize : UInt32) : Win32cr::Foundation::BOOL
    C.ExpandEnvironmentStringsForUserA(hToken, lpSrc, lpDest, dwSize)
  end

  def expandEnvironmentStringsForUserW(hToken : Win32cr::Foundation::HANDLE, lpSrc : Win32cr::Foundation::PWSTR, lpDest : UInt16*, dwSize : UInt32) : Win32cr::Foundation::BOOL
    C.ExpandEnvironmentStringsForUserW(hToken, lpSrc, lpDest, dwSize)
  end

  def isEnclaveTypeSupported(flEnclaveType : UInt32) : Win32cr::Foundation::BOOL
    C.IsEnclaveTypeSupported(flEnclaveType)
  end

  def createEnclave(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, dwInitialCommitment : LibC::UIntPtrT, flEnclaveType : UInt32, lpEnclaveInformation : Void*, dwInfoLength : UInt32, lpEnclaveError : UInt32*) : Void*
    C.CreateEnclave(hProcess, lpAddress, dwSize, dwInitialCommitment, flEnclaveType, lpEnclaveInformation, dwInfoLength, lpEnclaveError)
  end

  def loadEnclaveData(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, lpBuffer : Void*, nSize : LibC::UIntPtrT, flProtect : UInt32, lpPageInformation : Void*, dwInfoLength : UInt32, lpNumberOfBytesWritten : LibC::UIntPtrT*, lpEnclaveError : UInt32*) : Win32cr::Foundation::BOOL
    C.LoadEnclaveData(hProcess, lpAddress, lpBuffer, nSize, flProtect, lpPageInformation, dwInfoLength, lpNumberOfBytesWritten, lpEnclaveError)
  end

  def initializeEnclave(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, lpEnclaveInformation : Void*, dwInfoLength : UInt32, lpEnclaveError : UInt32*) : Win32cr::Foundation::BOOL
    C.InitializeEnclave(hProcess, lpAddress, lpEnclaveInformation, dwInfoLength, lpEnclaveError)
  end

  def loadEnclaveImageA(lpEnclaveAddress : Void*, lpImageName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.LoadEnclaveImageA(lpEnclaveAddress, lpImageName)
  end

  def loadEnclaveImageW(lpEnclaveAddress : Void*, lpImageName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.LoadEnclaveImageW(lpEnclaveAddress, lpImageName)
  end

  def callEnclave(lpRoutine : LibC::IntPtrT, lpParameter : Void*, fWaitForThread : Win32cr::Foundation::BOOL, lpReturnValue : Void**) : Win32cr::Foundation::BOOL
    C.CallEnclave(lpRoutine, lpParameter, fWaitForThread, lpReturnValue)
  end

  def terminateEnclave(lpAddress : Void*, fWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.TerminateEnclave(lpAddress, fWait)
  end

  def deleteEnclave(lpAddress : Void*) : Win32cr::Foundation::BOOL
    C.DeleteEnclave(lpAddress)
  end

  def enclaveGetAttestationReport(enclave_data : UInt8*, report : Void*, buffer_size : UInt32, output_size : UInt32*) : Win32cr::Foundation::HRESULT
    C.EnclaveGetAttestationReport(enclave_data, report, buffer_size, output_size)
  end

  def enclaveVerifyAttestationReport(enclave_type : UInt32, report : Void*, report_size : UInt32) : Win32cr::Foundation::HRESULT
    C.EnclaveVerifyAttestationReport(enclave_type, report, report_size)
  end

  def enclaveSealData(data_to_encrypt : Void*, data_to_encrypt_size : UInt32, identity_policy : Win32cr::System::Environment::ENCLAVE_SEALING_IDENTITY_POLICY, runtime_policy : UInt32, protected_blob : Void*, buffer_size : UInt32, protected_blob_size : UInt32*) : Win32cr::Foundation::HRESULT
    C.EnclaveSealData(data_to_encrypt, data_to_encrypt_size, identity_policy, runtime_policy, protected_blob, buffer_size, protected_blob_size)
  end

  def enclaveUnsealData(protected_blob : Void*, protected_blob_size : UInt32, decrypted_data : Void*, buffer_size : UInt32, decrypted_data_size : UInt32*, sealing_identity : Win32cr::System::Environment::ENCLAVE_IDENTITY*, unsealing_flags : UInt32*) : Win32cr::Foundation::HRESULT
    C.EnclaveUnsealData(protected_blob, protected_blob_size, decrypted_data, buffer_size, decrypted_data_size, sealing_identity, unsealing_flags)
  end

  def enclaveGetEnclaveInformation(information_size : UInt32, enclave_information : Win32cr::System::Environment::ENCLAVE_INFORMATION*) : Win32cr::Foundation::HRESULT
    C.EnclaveGetEnclaveInformation(information_size, enclave_information)
  end

  @[Link("kernel32")]
  @[Link("userenv")]
  @[Link("vertdll")]
  lib C
    # :nodoc:
    fun SetEnvironmentStringsW(new_environment : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCommandLineA : Win32cr::Foundation::PSTR

    # :nodoc:
    fun GetCommandLineW : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun GetEnvironmentStrings : Win32cr::Foundation::PSTR

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetEnvironmentStringsW : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun FreeEnvironmentStringsA(penv : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun FreeEnvironmentStringsW(penv : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpBuffer : UInt8*, nSize : UInt32) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpBuffer : UInt16*, nSize : UInt32) : UInt32

    # :nodoc:
    fun SetEnvironmentVariableA(lpName : Win32cr::Foundation::PSTR, lpValue : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetEnvironmentVariableW(lpName : Win32cr::Foundation::PWSTR, lpValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ExpandEnvironmentStringsA(lpSrc : Win32cr::Foundation::PSTR, lpDst : UInt8*, nSize : UInt32) : UInt32

    # :nodoc:
    fun ExpandEnvironmentStringsW(lpSrc : Win32cr::Foundation::PWSTR, lpDst : UInt16*, nSize : UInt32) : UInt32

    # :nodoc:
    fun SetCurrentDirectoryA(lpPathName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    # :nodoc:
    #fun SetCurrentDirectoryW(lpPathName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetCurrentDirectoryA(nBufferLength : UInt32, lpBuffer : UInt8*) : UInt32

    # Commented out due to being part of LibC
    # :nodoc:
    #fun GetCurrentDirectoryW(nBufferLength : UInt32, lpBuffer : UInt16*) : UInt32

    # :nodoc:
    fun NeedCurrentDirectoryForExePathA(exe_name : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun NeedCurrentDirectoryForExePathW(exe_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateEnvironmentBlock(lpEnvironment : Void**, hToken : Win32cr::Foundation::HANDLE, bInherit : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DestroyEnvironmentBlock(lpEnvironment : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ExpandEnvironmentStringsForUserA(hToken : Win32cr::Foundation::HANDLE, lpSrc : Win32cr::Foundation::PSTR, lpDest : UInt8*, dwSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun ExpandEnvironmentStringsForUserW(hToken : Win32cr::Foundation::HANDLE, lpSrc : Win32cr::Foundation::PWSTR, lpDest : UInt16*, dwSize : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsEnclaveTypeSupported(flEnclaveType : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CreateEnclave(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, dwSize : LibC::UIntPtrT, dwInitialCommitment : LibC::UIntPtrT, flEnclaveType : UInt32, lpEnclaveInformation : Void*, dwInfoLength : UInt32, lpEnclaveError : UInt32*) : Void*

    # :nodoc:
    fun LoadEnclaveData(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, lpBuffer : Void*, nSize : LibC::UIntPtrT, flProtect : UInt32, lpPageInformation : Void*, dwInfoLength : UInt32, lpNumberOfBytesWritten : LibC::UIntPtrT*, lpEnclaveError : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun InitializeEnclave(hProcess : Win32cr::Foundation::HANDLE, lpAddress : Void*, lpEnclaveInformation : Void*, dwInfoLength : UInt32, lpEnclaveError : UInt32*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LoadEnclaveImageA(lpEnclaveAddress : Void*, lpImageName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun LoadEnclaveImageW(lpEnclaveAddress : Void*, lpImageName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CallEnclave(lpRoutine : LibC::IntPtrT, lpParameter : Void*, fWaitForThread : Win32cr::Foundation::BOOL, lpReturnValue : Void**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun TerminateEnclave(lpAddress : Void*, fWait : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DeleteEnclave(lpAddress : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun EnclaveGetAttestationReport(enclave_data : UInt8*, report : Void*, buffer_size : UInt32, output_size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun EnclaveVerifyAttestationReport(enclave_type : UInt32, report : Void*, report_size : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun EnclaveSealData(data_to_encrypt : Void*, data_to_encrypt_size : UInt32, identity_policy : Win32cr::System::Environment::ENCLAVE_SEALING_IDENTITY_POLICY, runtime_policy : UInt32, protected_blob : Void*, buffer_size : UInt32, protected_blob_size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun EnclaveUnsealData(protected_blob : Void*, protected_blob_size : UInt32, decrypted_data : Void*, buffer_size : UInt32, decrypted_data_size : UInt32*, sealing_identity : Win32cr::System::Environment::ENCLAVE_IDENTITY*, unsealing_flags : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun EnclaveGetEnclaveInformation(information_size : UInt32, enclave_information : Win32cr::System::Environment::ENCLAVE_INFORMATION*) : Win32cr::Foundation::HRESULT

  end
end