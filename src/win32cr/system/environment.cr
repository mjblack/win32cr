require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:userenv.dll")]
@[Link(ldflags: "/DELAYLOAD:onecore.dll")]
@[Link(ldflags: "/DELAYLOAD:vertdll.dll")]
{% else %}
@[Link("userenv")]
@[Link("onecore")]
@[Link("vertdll")]
{% end %}
lib LibWin32
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

  alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE = Proc(LibC::UINT_PTR, Void)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION = Proc(VBS_BASIC_ENCLAVE_EXCEPTION_AMD64*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD = Proc(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD = Proc(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES = Proc(Void*, LibC::UINT_PTR, Void*, UInt32, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES = Proc(Void*, LibC::UINT_PTR, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES = Proc(Void*, LibC::UINT_PTR, UInt32, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD = Proc(VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION = Proc(ENCLAVE_INFORMATION*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY = Proc(ENCLAVE_VBS_BASIC_KEY_REQUEST*, UInt32, UInt8*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT = Proc(UInt8*, Void*, UInt32, UInt32*, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT = Proc(Void*, UInt32, Int32)
  alias VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA = Proc(UInt8*, UInt32, UInt64*, Int32)


  enum ENCLAVE_SEALING_IDENTITY_POLICY : Int32
    ENCLAVE_IDENTITY_POLICY_SEAL_INVALID = 0
    ENCLAVE_IDENTITY_POLICY_SEAL_EXACT_CODE = 1
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_PRIMARY_CODE = 2
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_IMAGE = 3
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_FAMILY = 4
    ENCLAVE_IDENTITY_POLICY_SEAL_SAME_AUTHOR = 5
  end

  struct ENCLAVE_IDENTITY
    owner_id : UInt8[32]*
    unique_id : UInt8[32]*
    author_id : UInt8[32]*
    family_id : UInt8[16]*
    image_id : UInt8[16]*
    enclave_svn : UInt32
    secure_kernel_svn : UInt32
    platform_svn : UInt32
    flags : UInt32
    signing_level : UInt32
    enclave_type : UInt32
  end
  struct VBS_ENCLAVE_REPORT_PKG_HEADER
    package_size : UInt32
    version : UInt32
    signature_scheme : UInt32
    signed_statement_size : UInt32
    signature_size : UInt32
    reserved : UInt32
  end
  struct VBS_ENCLAVE_REPORT
    report_size : UInt32
    report_version : UInt32
    enclave_data : UInt8[64]*
    enclave_identity : ENCLAVE_IDENTITY
  end
  struct VBS_ENCLAVE_REPORT_VARDATA_HEADER
    data_type : UInt32
    size : UInt32
  end
  struct VBS_ENCLAVE_REPORT_MODULE
    header : VBS_ENCLAVE_REPORT_VARDATA_HEADER
    unique_id : UInt8[32]*
    author_id : UInt8[32]*
    family_id : UInt8[16]*
    image_id : UInt8[16]*
    svn : UInt32
    module_name : Char[0]*
  end
  struct ENCLAVE_INFORMATION
    enclave_type : UInt32
    reserved : UInt32
    base_address : Void*
    size : LibC::UINT_PTR
    identity : ENCLAVE_IDENTITY
  end
  struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR32
    thread_context : UInt32[4]*
    entry_point : UInt32
    stack_pointer : UInt32
    exception_entry_point : UInt32
    exception_stack : UInt32
    exception_active : UInt32
  end
  struct VBS_BASIC_ENCLAVE_THREAD_DESCRIPTOR64
    thread_context : UInt64[4]*
    entry_point : UInt64
    stack_pointer : UInt64
    exception_entry_point : UInt64
    exception_stack : UInt64
    exception_active : UInt32
  end
  struct VBS_BASIC_ENCLAVE_EXCEPTION_AMD64
    exception_code : UInt32
    number_parameters : UInt32
    exception_information : LibC::UINT_PTR[3]*
    exception_rax : LibC::UINT_PTR
    exception_rcx : LibC::UINT_PTR
    exception_rip : LibC::UINT_PTR
    exception_rflags : LibC::UINT_PTR
    exception_rsp : LibC::UINT_PTR
  end
  struct ENCLAVE_VBS_BASIC_KEY_REQUEST
    request_size : UInt32
    flags : UInt32
    enclave_svn : UInt32
    system_key_id : UInt32
    current_system_key_id : UInt32
  end
  struct VBS_BASIC_ENCLAVE_SYSCALL_PAGE
    return_from_enclave : VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE
    return_from_exception : VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION
    terminate_thread : VBS_BASIC_ENCLAVE_BASIC_CALL_TERMINATE_THREAD
    interrupt_thread : VBS_BASIC_ENCLAVE_BASIC_CALL_INTERRUPT_THREAD
    commit_pages : VBS_BASIC_ENCLAVE_BASIC_CALL_COMMIT_PAGES
    decommit_pages : VBS_BASIC_ENCLAVE_BASIC_CALL_DECOMMIT_PAGES
    protect_pages : VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES
    create_thread : VBS_BASIC_ENCLAVE_BASIC_CALL_CREATE_THREAD
    get_enclave_information : VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION
    generate_key : VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY
    generate_report : VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_REPORT
    verify_report : VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT
    generate_random_data : VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA
  end


  # Params # newenvironment : LibC::LPWSTR [In]
  fun SetEnvironmentStringsW(newenvironment : LibC::LPWSTR) : LibC::BOOL

  # Params # 
  fun GetCommandLineA : PSTR

  # Params # 
  fun GetCommandLineW : LibC::LPWSTR

  # Params # 
  fun GetEnvironmentStrings : PSTR

  # Params # 
  # Commented out because function is part of Lib C
  #fun GetEnvironmentStringsW : LibC::LPWSTR

  # Params # penv : PSTR [In]
  fun FreeEnvironmentStringsA(penv : PSTR) : LibC::BOOL

  # Params # penv : LibC::LPWSTR [In]
  # Commented out because function is part of Lib C
  #fun FreeEnvironmentStringsW(penv : LibC::LPWSTR) : LibC::BOOL

  # Params # lpname : PSTR [In],lpbuffer : UInt8* [In],nsize : UInt32 [In]
  fun GetEnvironmentVariableA(lpname : PSTR, lpbuffer : UInt8*, nsize : UInt32) : UInt32

  # Params # lpname : LibC::LPWSTR [In],lpbuffer : Char* [In],nsize : UInt32 [In]
  # Commented out because function is part of Lib C
  #fun GetEnvironmentVariableW(lpname : LibC::LPWSTR, lpbuffer : Char*, nsize : UInt32) : UInt32

  # Params # lpname : PSTR [In],lpvalue : PSTR [In]
  fun SetEnvironmentVariableA(lpname : PSTR, lpvalue : PSTR) : LibC::BOOL

  # Params # lpname : LibC::LPWSTR [In],lpvalue : LibC::LPWSTR [In]
  # Commented out because function is part of Lib C
  #fun SetEnvironmentVariableW(lpname : LibC::LPWSTR, lpvalue : LibC::LPWSTR) : LibC::BOOL

  # Params # lpsrc : PSTR [In],lpdst : UInt8* [In],nsize : UInt32 [In]
  fun ExpandEnvironmentStringsA(lpsrc : PSTR, lpdst : UInt8*, nsize : UInt32) : UInt32

  # Params # lpsrc : LibC::LPWSTR [In],lpdst : Char* [In],nsize : UInt32 [In]
  fun ExpandEnvironmentStringsW(lpsrc : LibC::LPWSTR, lpdst : Char*, nsize : UInt32) : UInt32

  # Params # lppathname : PSTR [In]
  fun SetCurrentDirectoryA(lppathname : PSTR) : LibC::BOOL

  # Params # lppathname : LibC::LPWSTR [In]
  # Commented out because function is part of Lib C
  #fun SetCurrentDirectoryW(lppathname : LibC::LPWSTR) : LibC::BOOL

  # Params # nbufferlength : UInt32 [In],lpbuffer : UInt8* [In]
  fun GetCurrentDirectoryA(nbufferlength : UInt32, lpbuffer : UInt8*) : UInt32

  # Params # nbufferlength : UInt32 [In],lpbuffer : Char* [In]
  # Commented out because function is part of Lib C
  #fun GetCurrentDirectoryW(nbufferlength : UInt32, lpbuffer : Char*) : UInt32

  # Params # exename : PSTR [In]
  fun NeedCurrentDirectoryForExePathA(exename : PSTR) : LibC::BOOL

  # Params # exename : LibC::LPWSTR [In]
  fun NeedCurrentDirectoryForExePathW(exename : LibC::LPWSTR) : LibC::BOOL

  # Params # lpenvironment : Void** [In],htoken : LibC::HANDLE [In],binherit : LibC::BOOL [In]
  fun CreateEnvironmentBlock(lpenvironment : Void**, htoken : LibC::HANDLE, binherit : LibC::BOOL) : LibC::BOOL

  # Params # lpenvironment : Void* [In]
  fun DestroyEnvironmentBlock(lpenvironment : Void*) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In],lpsrc : PSTR [In],lpdest : UInt8* [In],dwsize : UInt32 [In]
  fun ExpandEnvironmentStringsForUserA(htoken : LibC::HANDLE, lpsrc : PSTR, lpdest : UInt8*, dwsize : UInt32) : LibC::BOOL

  # Params # htoken : LibC::HANDLE [In],lpsrc : LibC::LPWSTR [In],lpdest : Char* [In],dwsize : UInt32 [In]
  fun ExpandEnvironmentStringsForUserW(htoken : LibC::HANDLE, lpsrc : LibC::LPWSTR, lpdest : Char*, dwsize : UInt32) : LibC::BOOL

  # Params # flenclavetype : UInt32 [In]
  fun IsEnclaveTypeSupported(flenclavetype : UInt32) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],dwsize : LibC::UINT_PTR [In],dwinitialcommitment : LibC::UINT_PTR [In],flenclavetype : UInt32 [In],lpenclaveinformation : Void* [In],dwinfolength : UInt32 [In],lpenclaveerror : UInt32* [In]
  fun CreateEnclave(hprocess : LibC::HANDLE, lpaddress : Void*, dwsize : LibC::UINT_PTR, dwinitialcommitment : LibC::UINT_PTR, flenclavetype : UInt32, lpenclaveinformation : Void*, dwinfolength : UInt32, lpenclaveerror : UInt32*) : Void*

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],lpbuffer : Void* [In],nsize : LibC::UINT_PTR [In],flprotect : UInt32 [In],lppageinformation : Void* [In],dwinfolength : UInt32 [In],lpnumberofbyteswritten : LibC::UINT_PTR* [In],lpenclaveerror : UInt32* [In]
  fun LoadEnclaveData(hprocess : LibC::HANDLE, lpaddress : Void*, lpbuffer : Void*, nsize : LibC::UINT_PTR, flprotect : UInt32, lppageinformation : Void*, dwinfolength : UInt32, lpnumberofbyteswritten : LibC::UINT_PTR*, lpenclaveerror : UInt32*) : LibC::BOOL

  # Params # hprocess : LibC::HANDLE [In],lpaddress : Void* [In],lpenclaveinformation : Void* [In],dwinfolength : UInt32 [In],lpenclaveerror : UInt32* [In]
  fun InitializeEnclave(hprocess : LibC::HANDLE, lpaddress : Void*, lpenclaveinformation : Void*, dwinfolength : UInt32, lpenclaveerror : UInt32*) : LibC::BOOL

  # Params # lpenclaveaddress : Void* [In],lpimagename : PSTR [In]
  fun LoadEnclaveImageA(lpenclaveaddress : Void*, lpimagename : PSTR) : LibC::BOOL

  # Params # lpenclaveaddress : Void* [In],lpimagename : LibC::LPWSTR [In]
  fun LoadEnclaveImageW(lpenclaveaddress : Void*, lpimagename : LibC::LPWSTR) : LibC::BOOL

  # Params # lproutine : LibC::IntPtrT [In],lpparameter : Void* [In],fwaitforthread : LibC::BOOL [In],lpreturnvalue : Void** [In]
  fun CallEnclave(lproutine : LibC::IntPtrT, lpparameter : Void*, fwaitforthread : LibC::BOOL, lpreturnvalue : Void**) : LibC::BOOL

  # Params # lpaddress : Void* [In],fwait : LibC::BOOL [In]
  fun TerminateEnclave(lpaddress : Void*, fwait : LibC::BOOL) : LibC::BOOL

  # Params # lpaddress : Void* [In]
  fun DeleteEnclave(lpaddress : Void*) : LibC::BOOL

  # Params # enclavedata : UInt8* [In],report : Void* [In],buffersize : UInt32 [In],outputsize : UInt32* [In]
  fun EnclaveGetAttestationReport(enclavedata : UInt8*, report : Void*, buffersize : UInt32, outputsize : UInt32*) : HRESULT

  # Params # enclavetype : UInt32 [In],report : Void* [In],reportsize : UInt32 [In]
  fun EnclaveVerifyAttestationReport(enclavetype : UInt32, report : Void*, reportsize : UInt32) : HRESULT

  # Params # datatoencrypt : Void* [In],datatoencryptsize : UInt32 [In],identitypolicy : ENCLAVE_SEALING_IDENTITY_POLICY [In],runtimepolicy : UInt32 [In],protectedblob : Void* [In],buffersize : UInt32 [In],protectedblobsize : UInt32* [In]
  fun EnclaveSealData(datatoencrypt : Void*, datatoencryptsize : UInt32, identitypolicy : ENCLAVE_SEALING_IDENTITY_POLICY, runtimepolicy : UInt32, protectedblob : Void*, buffersize : UInt32, protectedblobsize : UInt32*) : HRESULT

  # Params # protectedblob : Void* [In],protectedblobsize : UInt32 [In],decrypteddata : Void* [In],buffersize : UInt32 [In],decrypteddatasize : UInt32* [In],sealingidentity : ENCLAVE_IDENTITY* [In],unsealingflags : UInt32* [In]
  fun EnclaveUnsealData(protectedblob : Void*, protectedblobsize : UInt32, decrypteddata : Void*, buffersize : UInt32, decrypteddatasize : UInt32*, sealingidentity : ENCLAVE_IDENTITY*, unsealingflags : UInt32*) : HRESULT

  # Params # informationsize : UInt32 [In],enclaveinformation : ENCLAVE_INFORMATION* [In]
  fun EnclaveGetEnclaveInformation(informationsize : UInt32, enclaveinformation : ENCLAVE_INFORMATION*) : HRESULT
end
