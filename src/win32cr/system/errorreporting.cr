require "../foundation.cr"
require "../system/diagnostics/debug.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wer.dll")]
@[Link(ldflags: "/DELAYLOAD:faultrep.dll")]
lib LibWin32
  alias HREPORT = LibC::IntPtrT
  alias HREPORTSTORE = LibC::IntPtrT

  WER_FAULT_REPORTING_NO_UI = 32_u32
  WER_FAULT_REPORTING_FLAG_NO_HEAP_ON_QUEUE = 64_u32
  WER_FAULT_REPORTING_DISABLE_SNAPSHOT_CRASH = 128_u32
  WER_FAULT_REPORTING_DISABLE_SNAPSHOT_HANG = 256_u32
  WER_FAULT_REPORTING_CRITICAL = 512_u32
  WER_FAULT_REPORTING_DURABLE = 1024_u32
  WER_MAX_TOTAL_PARAM_LENGTH = 1720_u32
  WER_MAX_PREFERRED_MODULES = 128_u32
  WER_MAX_PREFERRED_MODULES_BUFFER = 256_u32
  WER_P0 = 0_u32
  WER_P1 = 1_u32
  WER_P2 = 2_u32
  WER_P3 = 3_u32
  WER_P4 = 4_u32
  WER_P5 = 5_u32
  WER_P6 = 6_u32
  WER_P7 = 7_u32
  WER_P8 = 8_u32
  WER_P9 = 9_u32
  WER_FILE_COMPRESSED = 4_u32
  WER_SUBMIT_BYPASS_POWER_THROTTLING = 16384_u32
  WER_SUBMIT_BYPASS_NETWORK_COST_THROTTLING = 32768_u32
  WER_DUMP_MASK_START = 1_u32
  WER_DUMP_NOHEAP_ONQUEUE = 1_u32
  WER_DUMP_AUXILIARY = 2_u32
  WER_MAX_REGISTERED_ENTRIES = 512_u32
  WER_MAX_REGISTERED_METADATA = 8_u32
  WER_MAX_REGISTERED_DUMPCOLLECTION = 4_u32
  WER_METADATA_KEY_MAX_LENGTH = 64_u32
  WER_METADATA_VALUE_MAX_LENGTH = 128_u32
  WER_MAX_SIGNATURE_NAME_LENGTH = 128_u32
  WER_MAX_EVENT_NAME_LENGTH = 64_u32
  WER_MAX_PARAM_LENGTH = 260_u32
  WER_MAX_PARAM_COUNT = 10_u32
  WER_MAX_FRIENDLY_EVENT_NAME_LENGTH = 128_u32
  WER_MAX_APPLICATION_NAME_LENGTH = 128_u32
  WER_MAX_DESCRIPTION_LENGTH = 512_u32
  WER_MAX_BUCKET_ID_STRING_LENGTH = 260_u32
  WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH = 64_u32
  WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES = 16_u32

  alias PFN_WER_RUNTIME_EXCEPTION_EVENT = Proc(Void*, WER_RUNTIME_EXCEPTION_INFORMATION*, LibC::BOOL*, Char*, UInt32*, UInt32*, HRESULT)
  alias PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE = Proc(Void*, WER_RUNTIME_EXCEPTION_INFORMATION*, UInt32, Char*, UInt32*, Char*, UInt32*, HRESULT)
  alias PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH = Proc(Void*, WER_RUNTIME_EXCEPTION_INFORMATION*, LibC::BOOL*, Char*, UInt32*, LibC::BOOL*, HRESULT)
  alias Pfn_reportfault = Proc(EXCEPTION_POINTERS*, UInt32, EFaultRepRetVal)
  alias Pfn_adderexcludedapplicationa = Proc(PSTR, EFaultRepRetVal)
  alias Pfn_adderexcludedapplicationw = Proc(LibC::LPWSTR, EFaultRepRetVal)


  enum WER_FILE : UInt32
    WER_FILE_ANONYMOUS_DATA = 2
    WER_FILE_DELETE_WHEN_DONE = 1
  end

  enum WER_SUBMIT_FLAGS : UInt32
    WER_SUBMIT_ADD_REGISTERED_DATA = 16
    WER_SUBMIT_HONOR_RECOVERY = 1
    WER_SUBMIT_HONOR_RESTART = 2
    WER_SUBMIT_NO_ARCHIVE = 256
    WER_SUBMIT_NO_CLOSE_UI = 64
    WER_SUBMIT_NO_QUEUE = 128
    WER_SUBMIT_OUTOFPROCESS = 32
    WER_SUBMIT_OUTOFPROCESS_ASYNC = 1024
    WER_SUBMIT_QUEUE = 4
    WER_SUBMIT_SHOW_DEBUG = 8
    WER_SUBMIT_START_MINIMIZED = 512
    WER_SUBMIT_BYPASS_DATA_THROTTLING = 2048
    WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY = 4096
    WER_SUBMIT_REPORT_MACHINE_ID = 8192
  end

  enum WER_FAULT_REPORTING : UInt32
    WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION = 4
    WER_FAULT_REPORTING_FLAG_NOHEAP = 1
    WER_FAULT_REPORTING_FLAG_QUEUE = 2
    WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD = 8
    WER_FAULT_REPORTING_ALWAYS_SHOW_UI = 16
  end

  enum WER_REPORT_UI : Int32
    WerUIAdditionalDataDlgHeader = 1
    WerUIIconFilePath = 2
    WerUIConsentDlgHeader = 3
    WerUIConsentDlgBody = 4
    WerUIOnlineSolutionCheckText = 5
    WerUIOfflineSolutionCheckText = 6
    WerUICloseText = 7
    WerUICloseDlgHeader = 8
    WerUICloseDlgBody = 9
    WerUICloseDlgButtonText = 10
    WerUIMax = 11
  end

  enum WER_REGISTER_FILE_TYPE : Int32
    WerRegFileTypeUserDocument = 1
    WerRegFileTypeOther = 2
    WerRegFileTypeMax = 3
  end

  enum WER_FILE_TYPE : Int32
    WerFileTypeMicrodump = 1
    WerFileTypeMinidump = 2
    WerFileTypeHeapdump = 3
    WerFileTypeUserDocument = 4
    WerFileTypeOther = 5
    WerFileTypeTriagedump = 6
    WerFileTypeCustomDump = 7
    WerFileTypeAuxiliaryDump = 8
    WerFileTypeEtlTrace = 9
    WerFileTypeMax = 10
  end

  enum WER_SUBMIT_RESULT : Int32
    WerReportQueued = 1
    WerReportUploaded = 2
    WerReportDebug = 3
    WerReportFailed = 4
    WerDisabled = 5
    WerReportCancelled = 6
    WerDisabledQueue = 7
    WerReportAsync = 8
    WerCustomAction = 9
    WerThrottled = 10
    WerReportUploadedCab = 11
    WerStorageLocationNotFound = 12
    WerSubmitResultMax = 13
  end

  enum WER_REPORT_TYPE : Int32
    WerReportNonCritical = 0
    WerReportCritical = 1
    WerReportApplicationCrash = 2
    WerReportApplicationHang = 3
    WerReportKernel = 4
    WerReportInvalid = 5
  end

  enum WER_CONSENT : Int32
    WerConsentNotAsked = 1
    WerConsentApproved = 2
    WerConsentDenied = 3
    WerConsentAlwaysPrompt = 4
    WerConsentMax = 5
  end

  enum WER_DUMP_TYPE : Int32
    WerDumpTypeNone = 0
    WerDumpTypeMicroDump = 1
    WerDumpTypeMiniDump = 2
    WerDumpTypeHeapDump = 3
    WerDumpTypeTriageDump = 4
    WerDumpTypeMax = 5
  end

  enum REPORT_STORE_TYPES : Int32
    E_STORE_USER_ARCHIVE = 0
    E_STORE_USER_QUEUE = 1
    E_STORE_MACHINE_ARCHIVE = 2
    E_STORE_MACHINE_QUEUE = 3
    E_STORE_INVALID = 4
  end

  enum EFaultRepRetVal : Int32
    Frrvok = 0
    Frrvokmanifest = 1
    Frrvokqueued = 2
    Frrverr = 3
    Frrverrnodw = 4
    Frrverrtimeout = 5
    Frrvlaunchdebugger = 6
    Frrvokheadless = 7
    Frrverranotherinstance = 8
    Frrverrnomemory = 9
    Frrverrdoublefault = 10
  end

  struct WER_REPORT_INFORMATION
    dw_size : UInt32
    h_process : LibC::HANDLE
    wz_consent_key : Char[64]*
    wz_friendly_event_name : Char[128]*
    wz_application_name : Char[128]*
    wz_application_path : Char[260]*
    wz_description : Char[512]*
    hwnd_parent : HANDLE
  end
  struct WER_REPORT_INFORMATION_V3
    dw_size : UInt32
    h_process : LibC::HANDLE
    wz_consent_key : Char[64]*
    wz_friendly_event_name : Char[128]*
    wz_application_name : Char[128]*
    wz_application_path : Char[260]*
    wz_description : Char[512]*
    hwnd_parent : HANDLE
    wz_namespace_partner : Char[64]*
    wz_namespace_group : Char[64]*
  end
  struct WER_DUMP_CUSTOM_OPTIONS
    dw_size : UInt32
    dw_mask : UInt32
    dw_dump_flags : UInt32
    b_only_this_thread : LibC::BOOL
    dw_exception_thread_flags : UInt32
    dw_other_thread_flags : UInt32
    dw_exception_thread_ex_flags : UInt32
    dw_other_thread_ex_flags : UInt32
    dw_preferred_module_flags : UInt32
    dw_other_module_flags : UInt32
    wz_preferred_module_list : Char[256]*
  end
  struct WER_DUMP_CUSTOM_OPTIONS_V2
    dw_size : UInt32
    dw_mask : UInt32
    dw_dump_flags : UInt32
    b_only_this_thread : LibC::BOOL
    dw_exception_thread_flags : UInt32
    dw_other_thread_flags : UInt32
    dw_exception_thread_ex_flags : UInt32
    dw_other_thread_ex_flags : UInt32
    dw_preferred_module_flags : UInt32
    dw_other_module_flags : UInt32
    wz_preferred_module_list : Char[256]*
    dw_preferred_module_reset_flags : UInt32
    dw_other_module_reset_flags : UInt32
  end
  struct WER_REPORT_INFORMATION_V4
    dw_size : UInt32
    h_process : LibC::HANDLE
    wz_consent_key : Char[64]*
    wz_friendly_event_name : Char[128]*
    wz_application_name : Char[128]*
    wz_application_path : Char[260]*
    wz_description : Char[512]*
    hwnd_parent : HANDLE
    wz_namespace_partner : Char[64]*
    wz_namespace_group : Char[64]*
    rgb_application_identity : UInt8[16]*
    h_snapshot : LibC::HANDLE
    h_delete_files_impersonation_token : LibC::HANDLE
  end
  struct WER_REPORT_INFORMATION_V5
    dw_size : UInt32
    h_process : LibC::HANDLE
    wz_consent_key : Char[64]*
    wz_friendly_event_name : Char[128]*
    wz_application_name : Char[128]*
    wz_application_path : Char[260]*
    wz_description : Char[512]*
    hwnd_parent : HANDLE
    wz_namespace_partner : Char[64]*
    wz_namespace_group : Char[64]*
    rgb_application_identity : UInt8[16]*
    h_snapshot : LibC::HANDLE
    h_delete_files_impersonation_token : LibC::HANDLE
    submit_result_max : WER_SUBMIT_RESULT
  end
  struct WER_DUMP_CUSTOM_OPTIONS_V3
    dw_size : UInt32
    dw_mask : UInt32
    dw_dump_flags : UInt32
    b_only_this_thread : LibC::BOOL
    dw_exception_thread_flags : UInt32
    dw_other_thread_flags : UInt32
    dw_exception_thread_ex_flags : UInt32
    dw_other_thread_ex_flags : UInt32
    dw_preferred_module_flags : UInt32
    dw_other_module_flags : UInt32
    wz_preferred_module_list : Char[256]*
    dw_preferred_module_reset_flags : UInt32
    dw_other_module_reset_flags : UInt32
    pv_dump_key : Void*
    h_snapshot : LibC::HANDLE
    dw_thread_id : UInt32
  end
  struct WER_EXCEPTION_INFORMATION
    p_exception_pointers : EXCEPTION_POINTERS*
    b_client_pointers : LibC::BOOL
  end
  struct WER_RUNTIME_EXCEPTION_INFORMATION
    dw_size : UInt32
    h_process : LibC::HANDLE
    h_thread : LibC::HANDLE
    exception_record : EXCEPTION_RECORD
    context : CONTEXT
    pwsz_report_id : LibC::LPWSTR
    b_is_fatal : LibC::BOOL
    dw_reserved : UInt32
  end
  struct WER_REPORT_PARAMETER
    name : Char[129]*
    value : Char[260]*
  end
  struct WER_REPORT_SIGNATURE
    event_name : Char[65]*
    parameters : WER_REPORT_PARAMETER[10]*
  end
  struct WER_REPORT_METADATA_V2
    signature : WER_REPORT_SIGNATURE
    bucket_id : Guid
    report_id : Guid
    creation_time : FILETIME
    size_in_bytes : UInt64
    cab_id : Char[260]*
    report_status : UInt32
    report_integrator_id : Guid
    number_of_files : UInt32
    size_of_file_names : UInt32
    file_names : LibC::LPWSTR
  end
  struct WER_REPORT_METADATA_V3
    signature : WER_REPORT_SIGNATURE
    bucket_id : Guid
    report_id : Guid
    creation_time : FILETIME
    size_in_bytes : UInt64
    cab_id : Char[260]*
    report_status : UInt32
    report_integrator_id : Guid
    number_of_files : UInt32
    size_of_file_names : UInt32
    file_names : LibC::LPWSTR
    friendly_event_name : Char[128]*
    application_name : Char[128]*
    application_path : Char[260]*
    description : Char[512]*
    bucket_id_string : Char[260]*
    legacy_bucket_id : UInt64
  end
  struct WER_REPORT_METADATA_V1
    signature : WER_REPORT_SIGNATURE
    bucket_id : Guid
    report_id : Guid
    creation_time : FILETIME
    size_in_bytes : UInt64
  end


  # Params # pwzeventtype : LibC::LPWSTR [In],reptype : WER_REPORT_TYPE [In],preportinformation : WER_REPORT_INFORMATION* [In],phreporthandle : HREPORT* [In]
  fun WerReportCreate(pwzeventtype : LibC::LPWSTR, reptype : WER_REPORT_TYPE, preportinformation : WER_REPORT_INFORMATION*, phreporthandle : HREPORT*) : HRESULT

  # Params # hreporthandle : HREPORT [In],dwparamid : UInt32 [In],pwzname : LibC::LPWSTR [In],pwzvalue : LibC::LPWSTR [In]
  fun WerReportSetParameter(hreporthandle : HREPORT, dwparamid : UInt32, pwzname : LibC::LPWSTR, pwzvalue : LibC::LPWSTR) : HRESULT

  # Params # hreporthandle : HREPORT [In],pwzpath : LibC::LPWSTR [In],repfiletype : WER_FILE_TYPE [In],dwfileflags : WER_FILE [In]
  fun WerReportAddFile(hreporthandle : HREPORT, pwzpath : LibC::LPWSTR, repfiletype : WER_FILE_TYPE, dwfileflags : WER_FILE) : HRESULT

  # Params # hreporthandle : HREPORT [In],repuitypeid : WER_REPORT_UI [In],pwzvalue : LibC::LPWSTR [In]
  fun WerReportSetUIOption(hreporthandle : HREPORT, repuitypeid : WER_REPORT_UI, pwzvalue : LibC::LPWSTR) : HRESULT

  # Params # hreporthandle : HREPORT [In],consent : WER_CONSENT [In],dwflags : WER_SUBMIT_FLAGS [In],psubmitresult : WER_SUBMIT_RESULT* [In]
  fun WerReportSubmit(hreporthandle : HREPORT, consent : WER_CONSENT, dwflags : WER_SUBMIT_FLAGS, psubmitresult : WER_SUBMIT_RESULT*) : HRESULT

  # Params # hreporthandle : HREPORT [In],hprocess : LibC::HANDLE [In],hthread : LibC::HANDLE [In],dumptype : WER_DUMP_TYPE [In],pexceptionparam : WER_EXCEPTION_INFORMATION* [In],pdumpcustomoptions : WER_DUMP_CUSTOM_OPTIONS* [In],dwflags : UInt32 [In]
  fun WerReportAddDump(hreporthandle : HREPORT, hprocess : LibC::HANDLE, hthread : LibC::HANDLE, dumptype : WER_DUMP_TYPE, pexceptionparam : WER_EXCEPTION_INFORMATION*, pdumpcustomoptions : WER_DUMP_CUSTOM_OPTIONS*, dwflags : UInt32) : HRESULT

  # Params # hreporthandle : HREPORT [In]
  fun WerReportCloseHandle(hreporthandle : HREPORT) : HRESULT

  # Params # pwzfile : LibC::LPWSTR [In],regfiletype : WER_REGISTER_FILE_TYPE [In],dwflags : WER_FILE [In]
  fun WerRegisterFile(pwzfile : LibC::LPWSTR, regfiletype : WER_REGISTER_FILE_TYPE, dwflags : WER_FILE) : HRESULT

  # Params # pwzfilepath : LibC::LPWSTR [In]
  fun WerUnregisterFile(pwzfilepath : LibC::LPWSTR) : HRESULT

  # Params # pvaddress : Void* [In],dwsize : UInt32 [In]
  fun WerRegisterMemoryBlock(pvaddress : Void*, dwsize : UInt32) : HRESULT

  # Params # pvaddress : Void* [In]
  fun WerUnregisterMemoryBlock(pvaddress : Void*) : HRESULT

  # Params # address : Void* [In],size : UInt32 [In]
  fun WerRegisterExcludedMemoryBlock(address : Void*, size : UInt32) : HRESULT

  # Params # address : Void* [In]
  fun WerUnregisterExcludedMemoryBlock(address : Void*) : HRESULT

  # Params # key : LibC::LPWSTR [In],value : LibC::LPWSTR [In]
  fun WerRegisterCustomMetadata(key : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT

  # Params # key : LibC::LPWSTR [In]
  fun WerUnregisterCustomMetadata(key : LibC::LPWSTR) : HRESULT

  # Params # processid : UInt32 [In],captureextrainfoforthreadid : UInt32 [In]
  fun WerRegisterAdditionalProcess(processid : UInt32, captureextrainfoforthreadid : UInt32) : HRESULT

  # Params # processid : UInt32 [In]
  fun WerUnregisterAdditionalProcess(processid : UInt32) : HRESULT

  # Params # localappdatarelativepath : LibC::LPWSTR [In]
  fun WerRegisterAppLocalDump(localappdatarelativepath : LibC::LPWSTR) : HRESULT

  # Params # 
  fun WerUnregisterAppLocalDump : HRESULT

  # Params # dwflags : WER_FAULT_REPORTING [In]
  fun WerSetFlags(dwflags : WER_FAULT_REPORTING) : HRESULT

  # Params # hprocess : LibC::HANDLE [In],pdwflags : WER_FAULT_REPORTING* [In]
  fun WerGetFlags(hprocess : LibC::HANDLE, pdwflags : WER_FAULT_REPORTING*) : HRESULT

  # Params # pwzexename : LibC::LPWSTR [In],ballusers : LibC::BOOL [In]
  fun WerAddExcludedApplication(pwzexename : LibC::LPWSTR, ballusers : LibC::BOOL) : HRESULT

  # Params # pwzexename : LibC::LPWSTR [In],ballusers : LibC::BOOL [In]
  fun WerRemoveExcludedApplication(pwzexename : LibC::LPWSTR, ballusers : LibC::BOOL) : HRESULT

  # Params # pwszoutofprocesscallbackdll : LibC::LPWSTR [In],pcontext : Void* [In]
  fun WerRegisterRuntimeExceptionModule(pwszoutofprocesscallbackdll : LibC::LPWSTR, pcontext : Void*) : HRESULT

  # Params # pwszoutofprocesscallbackdll : LibC::LPWSTR [In],pcontext : Void* [In]
  fun WerUnregisterRuntimeExceptionModule(pwszoutofprocesscallbackdll : LibC::LPWSTR, pcontext : Void*) : HRESULT

  # Params # repstoretype : REPORT_STORE_TYPES [In],phreportstore : HREPORTSTORE* [In]
  fun WerStoreOpen(repstoretype : REPORT_STORE_TYPES, phreportstore : HREPORTSTORE*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In]
  fun WerStoreClose(hreportstore : HREPORTSTORE)

  # Params # hreportstore : HREPORTSTORE [In],ppszreportkey : LibC::LPWSTR* [In]
  fun WerStoreGetFirstReportKey(hreportstore : HREPORTSTORE, ppszreportkey : LibC::LPWSTR*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],ppszreportkey : LibC::LPWSTR* [In]
  fun WerStoreGetNextReportKey(hreportstore : HREPORTSTORE, ppszreportkey : LibC::LPWSTR*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],pszreportkey : LibC::LPWSTR [In],preportmetadata : WER_REPORT_METADATA_V2* [In]
  fun WerStoreQueryReportMetadataV2(hreportstore : HREPORTSTORE, pszreportkey : LibC::LPWSTR, preportmetadata : WER_REPORT_METADATA_V2*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],pszreportkey : LibC::LPWSTR [In],preportmetadata : WER_REPORT_METADATA_V3* [In]
  fun WerStoreQueryReportMetadataV3(hreportstore : HREPORTSTORE, pszreportkey : LibC::LPWSTR, preportmetadata : WER_REPORT_METADATA_V3*) : HRESULT

  # Params # pwszstr : LibC::LPWSTR [In]
  fun WerFreeString(pwszstr : LibC::LPWSTR)

  # Params # 
  fun WerStorePurge : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],pdwreportcount : UInt32* [In]
  fun WerStoreGetReportCount(hreportstore : HREPORTSTORE, pdwreportcount : UInt32*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],pqwsizeinbytes : UInt64* [In]
  fun WerStoreGetSizeOnDisk(hreportstore : HREPORTSTORE, pqwsizeinbytes : UInt64*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],pszreportkey : LibC::LPWSTR [In],preportmetadata : WER_REPORT_METADATA_V1* [In]
  fun WerStoreQueryReportMetadataV1(hreportstore : HREPORTSTORE, pszreportkey : LibC::LPWSTR, preportmetadata : WER_REPORT_METADATA_V1*) : HRESULT

  # Params # hreportstore : HREPORTSTORE [In],pszreportkey : LibC::LPWSTR [In],dwflags : UInt32 [In],psubmitresult : WER_SUBMIT_RESULT* [In]
  fun WerStoreUploadReport(hreportstore : HREPORTSTORE, pszreportkey : LibC::LPWSTR, dwflags : UInt32, psubmitresult : WER_SUBMIT_RESULT*) : HRESULT

  # Params # pep : EXCEPTION_POINTERS* [In],dwopt : UInt32 [In]
  fun ReportFault(pep : EXCEPTION_POINTERS*, dwopt : UInt32) : EFaultRepRetVal

  # Params # szapplication : PSTR [In]
  fun AddERExcludedApplicationA(szapplication : PSTR) : LibC::BOOL

  # Params # wszapplication : LibC::LPWSTR [In]
  fun AddERExcludedApplicationW(wszapplication : LibC::LPWSTR) : LibC::BOOL

  # Params # hwndhungapp : LibC::HANDLE [In],pwzhungapplicationname : LibC::LPWSTR [In]
  fun WerReportHang(hwndhungapp : LibC::HANDLE, pwzhungapplicationname : LibC::LPWSTR) : HRESULT
end
