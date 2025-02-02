require "./../foundation.cr"
require "./diagnostics/debug.cr"

module Win32cr::System::ErrorReporting
  extend self
  alias HREPORT = LibC::IntPtrT
  alias HREPORTSTORE = LibC::IntPtrT
  alias PFN_WER_RUNTIME_EXCEPTION_EVENT = Proc(Void*, Win32cr::System::ErrorReporting::WER_RUNTIME_EXCEPTION_INFORMATION*, Win32cr::Foundation::BOOL*, UInt16*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE = Proc(Void*, Win32cr::System::ErrorReporting::WER_RUNTIME_EXCEPTION_INFORMATION*, UInt32, UInt16*, UInt32*, UInt16*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH = Proc(Void*, Win32cr::System::ErrorReporting::WER_RUNTIME_EXCEPTION_INFORMATION*, Win32cr::Foundation::BOOL*, UInt16*, UInt32*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)

  alias Pfn_reportfault = Proc(Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*, UInt32, Win32cr::System::ErrorReporting::EFaultRepRetVal)

  alias Pfn_adderexcludedapplicationa = Proc(Win32cr::Foundation::PSTR, Win32cr::System::ErrorReporting::EFaultRepRetVal)

  alias Pfn_adderexcludedapplicationw = Proc(Win32cr::Foundation::PWSTR, Win32cr::System::ErrorReporting::EFaultRepRetVal)

  WER_FAULT_REPORTING_NO_UI = 32_u32
  WER_FAULT_REPORTING_FLAG_NO_HEAP_ON_QUEUE = 64_u32
  WER_FAULT_REPORTING_DISABLE_SNAPSHOT_CRASH = 128_u32
  WER_FAULT_REPORTING_DISABLE_SNAPSHOT_HANG = 256_u32
  WER_FAULT_REPORTING_CRITICAL = 512_u32
  WER_FAULT_REPORTING_DURABLE = 1024_u32
  WER_MAX_TOTAL_PARAM_LENGTH = 1720_u32
  WER_MAX_PREFERRED_MODULES = 128_u32
  WER_MAX_PREFERRED_MODULES_BUFFER = 256_u32
  APPCRASH_EVENT = "APPCRASH"
  PACKAGED_APPCRASH_EVENT = "MoAppCrash"
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
  WER_RUNTIME_EXCEPTION_EVENT_FUNCTION = "OutOfProcessExceptionEventCallback"
  WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE_FUNCTION = "OutOfProcessExceptionEventSignatureCallback"
  WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH = "OutOfProcessExceptionEventDebuggerLaunchCallback"

  @[Flags]
  enum WER_FILE : UInt32
    WER_FILE_ANONYMOUS_DATA = 2_u32
    WER_FILE_DELETE_WHEN_DONE = 1_u32
  end
  @[Flags]
  enum WER_SUBMIT_FLAGS : UInt32
    WER_SUBMIT_ADD_REGISTERED_DATA = 16_u32
    WER_SUBMIT_HONOR_RECOVERY = 1_u32
    WER_SUBMIT_HONOR_RESTART = 2_u32
    WER_SUBMIT_NO_ARCHIVE = 256_u32
    WER_SUBMIT_NO_CLOSE_UI = 64_u32
    WER_SUBMIT_NO_QUEUE = 128_u32
    WER_SUBMIT_OUTOFPROCESS = 32_u32
    WER_SUBMIT_OUTOFPROCESS_ASYNC = 1024_u32
    WER_SUBMIT_QUEUE = 4_u32
    WER_SUBMIT_SHOW_DEBUG = 8_u32
    WER_SUBMIT_START_MINIMIZED = 512_u32
    WER_SUBMIT_BYPASS_DATA_THROTTLING = 2048_u32
    WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY = 4096_u32
    WER_SUBMIT_REPORT_MACHINE_ID = 8192_u32
  end
  @[Flags]
  enum WER_FAULT_REPORTING : UInt32
    WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION = 4_u32
    WER_FAULT_REPORTING_FLAG_NOHEAP = 1_u32
    WER_FAULT_REPORTING_FLAG_QUEUE = 2_u32
    WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD = 8_u32
    WER_FAULT_REPORTING_ALWAYS_SHOW_UI = 16_u32
  end
  enum WER_REPORT_UI
    WerUIAdditionalDataDlgHeader = 1_i32
    WerUIIconFilePath = 2_i32
    WerUIConsentDlgHeader = 3_i32
    WerUIConsentDlgBody = 4_i32
    WerUIOnlineSolutionCheckText = 5_i32
    WerUIOfflineSolutionCheckText = 6_i32
    WerUICloseText = 7_i32
    WerUICloseDlgHeader = 8_i32
    WerUICloseDlgBody = 9_i32
    WerUICloseDlgButtonText = 10_i32
    WerUIMax = 11_i32
  end
  enum WER_REGISTER_FILE_TYPE
    WerRegFileTypeUserDocument = 1_i32
    WerRegFileTypeOther = 2_i32
    WerRegFileTypeMax = 3_i32
  end
  enum WER_FILE_TYPE
    WerFileTypeMicrodump = 1_i32
    WerFileTypeMinidump = 2_i32
    WerFileTypeHeapdump = 3_i32
    WerFileTypeUserDocument = 4_i32
    WerFileTypeOther = 5_i32
    WerFileTypeTriagedump = 6_i32
    WerFileTypeCustomDump = 7_i32
    WerFileTypeAuxiliaryDump = 8_i32
    WerFileTypeEtlTrace = 9_i32
    WerFileTypeMax = 10_i32
  end
  enum WER_SUBMIT_RESULT
    WerReportQueued = 1_i32
    WerReportUploaded = 2_i32
    WerReportDebug = 3_i32
    WerReportFailed = 4_i32
    WerDisabled = 5_i32
    WerReportCancelled = 6_i32
    WerDisabledQueue = 7_i32
    WerReportAsync = 8_i32
    WerCustomAction = 9_i32
    WerThrottled = 10_i32
    WerReportUploadedCab = 11_i32
    WerStorageLocationNotFound = 12_i32
    WerSubmitResultMax = 13_i32
  end
  enum WER_REPORT_TYPE
    WerReportNonCritical = 0_i32
    WerReportCritical = 1_i32
    WerReportApplicationCrash = 2_i32
    WerReportApplicationHang = 3_i32
    WerReportKernel = 4_i32
    WerReportInvalid = 5_i32
  end
  enum WER_CONSENT
    WerConsentNotAsked = 1_i32
    WerConsentApproved = 2_i32
    WerConsentDenied = 3_i32
    WerConsentAlwaysPrompt = 4_i32
    WerConsentMax = 5_i32
  end
  enum WER_DUMP_TYPE
    WerDumpTypeNone = 0_i32
    WerDumpTypeMicroDump = 1_i32
    WerDumpTypeMiniDump = 2_i32
    WerDumpTypeHeapDump = 3_i32
    WerDumpTypeTriageDump = 4_i32
    WerDumpTypeMax = 5_i32
  end
  enum REPORT_STORE_TYPES
    E_STORE_USER_ARCHIVE = 0_i32
    E_STORE_USER_QUEUE = 1_i32
    E_STORE_MACHINE_ARCHIVE = 2_i32
    E_STORE_MACHINE_QUEUE = 3_i32
    E_STORE_INVALID = 4_i32
  end
  enum EFaultRepRetVal
    Frrvok = 0_i32
    Frrvokmanifest = 1_i32
    Frrvokqueued = 2_i32
    Frrverr = 3_i32
    Frrverrnodw = 4_i32
    Frrverrtimeout = 5_i32
    Frrvlaunchdebugger = 6_i32
    Frrvokheadless = 7_i32
    Frrverranotherinstance = 8_i32
    Frrverrnomemory = 9_i32
    Frrverrdoublefault = 10_i32
  end

  @[Extern]
  struct WER_REPORT_INFORMATION
    property dwSize : UInt32
    property hProcess : Win32cr::Foundation::HANDLE
    property wzConsentKey : UInt16[64]
    property wzFriendlyEventName : UInt16[128]
    property wzApplicationName : UInt16[128]
    property wzApplicationPath : UInt16[260]
    property wzDescription : UInt16[512]
    property hwndParent : Win32cr::Foundation::HWND
    def initialize(@dwSize : UInt32, @hProcess : Win32cr::Foundation::HANDLE, @wzConsentKey : UInt16[64], @wzFriendlyEventName : UInt16[128], @wzApplicationName : UInt16[128], @wzApplicationPath : UInt16[260], @wzDescription : UInt16[512], @hwndParent : Win32cr::Foundation::HWND)
    end
  end

  @[Extern]
  struct WER_REPORT_INFORMATION_V3
    property dwSize : UInt32
    property hProcess : Win32cr::Foundation::HANDLE
    property wzConsentKey : UInt16[64]
    property wzFriendlyEventName : UInt16[128]
    property wzApplicationName : UInt16[128]
    property wzApplicationPath : UInt16[260]
    property wzDescription : UInt16[512]
    property hwndParent : Win32cr::Foundation::HWND
    property wzNamespacePartner : UInt16[64]
    property wzNamespaceGroup : UInt16[64]
    def initialize(@dwSize : UInt32, @hProcess : Win32cr::Foundation::HANDLE, @wzConsentKey : UInt16[64], @wzFriendlyEventName : UInt16[128], @wzApplicationName : UInt16[128], @wzApplicationPath : UInt16[260], @wzDescription : UInt16[512], @hwndParent : Win32cr::Foundation::HWND, @wzNamespacePartner : UInt16[64], @wzNamespaceGroup : UInt16[64])
    end
  end

  @[Extern]
  struct WER_DUMP_CUSTOM_OPTIONS
    property dwSize : UInt32
    property dwMask : UInt32
    property dwDumpFlags : UInt32
    property bOnlyThisThread : Win32cr::Foundation::BOOL
    property dwExceptionThreadFlags : UInt32
    property dwOtherThreadFlags : UInt32
    property dwExceptionThreadExFlags : UInt32
    property dwOtherThreadExFlags : UInt32
    property dwPreferredModuleFlags : UInt32
    property dwOtherModuleFlags : UInt32
    property wzPreferredModuleList : UInt16[256]
    def initialize(@dwSize : UInt32, @dwMask : UInt32, @dwDumpFlags : UInt32, @bOnlyThisThread : Win32cr::Foundation::BOOL, @dwExceptionThreadFlags : UInt32, @dwOtherThreadFlags : UInt32, @dwExceptionThreadExFlags : UInt32, @dwOtherThreadExFlags : UInt32, @dwPreferredModuleFlags : UInt32, @dwOtherModuleFlags : UInt32, @wzPreferredModuleList : UInt16[256])
    end
  end

  @[Extern]
  struct WER_DUMP_CUSTOM_OPTIONS_V2
    property dwSize : UInt32
    property dwMask : UInt32
    property dwDumpFlags : UInt32
    property bOnlyThisThread : Win32cr::Foundation::BOOL
    property dwExceptionThreadFlags : UInt32
    property dwOtherThreadFlags : UInt32
    property dwExceptionThreadExFlags : UInt32
    property dwOtherThreadExFlags : UInt32
    property dwPreferredModuleFlags : UInt32
    property dwOtherModuleFlags : UInt32
    property wzPreferredModuleList : UInt16[256]
    property dwPreferredModuleResetFlags : UInt32
    property dwOtherModuleResetFlags : UInt32
    def initialize(@dwSize : UInt32, @dwMask : UInt32, @dwDumpFlags : UInt32, @bOnlyThisThread : Win32cr::Foundation::BOOL, @dwExceptionThreadFlags : UInt32, @dwOtherThreadFlags : UInt32, @dwExceptionThreadExFlags : UInt32, @dwOtherThreadExFlags : UInt32, @dwPreferredModuleFlags : UInt32, @dwOtherModuleFlags : UInt32, @wzPreferredModuleList : UInt16[256], @dwPreferredModuleResetFlags : UInt32, @dwOtherModuleResetFlags : UInt32)
    end
  end

  @[Extern]
  struct WER_REPORT_INFORMATION_V4
    property dwSize : UInt32
    property hProcess : Win32cr::Foundation::HANDLE
    property wzConsentKey : UInt16[64]
    property wzFriendlyEventName : UInt16[128]
    property wzApplicationName : UInt16[128]
    property wzApplicationPath : UInt16[260]
    property wzDescription : UInt16[512]
    property hwndParent : Win32cr::Foundation::HWND
    property wzNamespacePartner : UInt16[64]
    property wzNamespaceGroup : UInt16[64]
    property rgbApplicationIdentity : UInt8[16]
    property hSnapshot : Win32cr::Foundation::HANDLE
    property hDeleteFilesImpersonationToken : Win32cr::Foundation::HANDLE
    def initialize(@dwSize : UInt32, @hProcess : Win32cr::Foundation::HANDLE, @wzConsentKey : UInt16[64], @wzFriendlyEventName : UInt16[128], @wzApplicationName : UInt16[128], @wzApplicationPath : UInt16[260], @wzDescription : UInt16[512], @hwndParent : Win32cr::Foundation::HWND, @wzNamespacePartner : UInt16[64], @wzNamespaceGroup : UInt16[64], @rgbApplicationIdentity : UInt8[16], @hSnapshot : Win32cr::Foundation::HANDLE, @hDeleteFilesImpersonationToken : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct WER_REPORT_INFORMATION_V5
    property dwSize : UInt32
    property hProcess : Win32cr::Foundation::HANDLE
    property wzConsentKey : UInt16[64]
    property wzFriendlyEventName : UInt16[128]
    property wzApplicationName : UInt16[128]
    property wzApplicationPath : UInt16[260]
    property wzDescription : UInt16[512]
    property hwndParent : Win32cr::Foundation::HWND
    property wzNamespacePartner : UInt16[64]
    property wzNamespaceGroup : UInt16[64]
    property rgbApplicationIdentity : UInt8[16]
    property hSnapshot : Win32cr::Foundation::HANDLE
    property hDeleteFilesImpersonationToken : Win32cr::Foundation::HANDLE
    property submitResultMax : Win32cr::System::ErrorReporting::WER_SUBMIT_RESULT
    def initialize(@dwSize : UInt32, @hProcess : Win32cr::Foundation::HANDLE, @wzConsentKey : UInt16[64], @wzFriendlyEventName : UInt16[128], @wzApplicationName : UInt16[128], @wzApplicationPath : UInt16[260], @wzDescription : UInt16[512], @hwndParent : Win32cr::Foundation::HWND, @wzNamespacePartner : UInt16[64], @wzNamespaceGroup : UInt16[64], @rgbApplicationIdentity : UInt8[16], @hSnapshot : Win32cr::Foundation::HANDLE, @hDeleteFilesImpersonationToken : Win32cr::Foundation::HANDLE, @submitResultMax : Win32cr::System::ErrorReporting::WER_SUBMIT_RESULT)
    end
  end

  @[Extern]
  struct WER_DUMP_CUSTOM_OPTIONS_V3
    property dwSize : UInt32
    property dwMask : UInt32
    property dwDumpFlags : UInt32
    property bOnlyThisThread : Win32cr::Foundation::BOOL
    property dwExceptionThreadFlags : UInt32
    property dwOtherThreadFlags : UInt32
    property dwExceptionThreadExFlags : UInt32
    property dwOtherThreadExFlags : UInt32
    property dwPreferredModuleFlags : UInt32
    property dwOtherModuleFlags : UInt32
    property wzPreferredModuleList : UInt16[256]
    property dwPreferredModuleResetFlags : UInt32
    property dwOtherModuleResetFlags : UInt32
    property pvDumpKey : Void*
    property hSnapshot : Win32cr::Foundation::HANDLE
    property dwThreadID : UInt32
    def initialize(@dwSize : UInt32, @dwMask : UInt32, @dwDumpFlags : UInt32, @bOnlyThisThread : Win32cr::Foundation::BOOL, @dwExceptionThreadFlags : UInt32, @dwOtherThreadFlags : UInt32, @dwExceptionThreadExFlags : UInt32, @dwOtherThreadExFlags : UInt32, @dwPreferredModuleFlags : UInt32, @dwOtherModuleFlags : UInt32, @wzPreferredModuleList : UInt16[256], @dwPreferredModuleResetFlags : UInt32, @dwOtherModuleResetFlags : UInt32, @pvDumpKey : Void*, @hSnapshot : Win32cr::Foundation::HANDLE, @dwThreadID : UInt32)
    end
  end

  @[Extern]
  struct WER_EXCEPTION_INFORMATION
    property pExceptionPointers : Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*
    property bClientPointers : Win32cr::Foundation::BOOL
    def initialize(@pExceptionPointers : Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*, @bClientPointers : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WER_RUNTIME_EXCEPTION_INFORMATION
    property dwSize : UInt32
    property hProcess : Win32cr::Foundation::HANDLE
    property hThread : Win32cr::Foundation::HANDLE
    property exceptionRecord : Win32cr::System::Diagnostics::Debug::EXCEPTION_RECORD
    property context : Win32cr::System::Diagnostics::Debug::CONTEXT
    property pwszReportId : Win32cr::Foundation::PWSTR
    property bIsFatal : Win32cr::Foundation::BOOL
    property dwReserved : UInt32
    def initialize(@dwSize : UInt32, @hProcess : Win32cr::Foundation::HANDLE, @hThread : Win32cr::Foundation::HANDLE, @exceptionRecord : Win32cr::System::Diagnostics::Debug::EXCEPTION_RECORD, @context : Win32cr::System::Diagnostics::Debug::CONTEXT, @pwszReportId : Win32cr::Foundation::PWSTR, @bIsFatal : Win32cr::Foundation::BOOL, @dwReserved : UInt32)
    end
  end

  @[Extern]
  struct WER_REPORT_PARAMETER
    property name : UInt16[129]
    property value : UInt16[260]
    def initialize(@name : UInt16[129], @value : UInt16[260])
    end
  end

  @[Extern]
  struct WER_REPORT_SIGNATURE
    property event_name : UInt16[65]
    property parameters : Win32cr::System::ErrorReporting::WER_REPORT_PARAMETER[10]
    def initialize(@event_name : UInt16[65], @parameters : Win32cr::System::ErrorReporting::WER_REPORT_PARAMETER[10])
    end
  end

  @[Extern]
  struct WER_REPORT_METADATA_V2
    property signature : Win32cr::System::ErrorReporting::WER_REPORT_SIGNATURE
    property bucket_id : LibC::GUID
    property report_id : LibC::GUID
    property creation_time : Win32cr::Foundation::FILETIME
    property size_in_bytes : UInt64
    property cab_id : UInt16[260]
    property report_status : UInt32
    property report_integrator_id : LibC::GUID
    property number_of_files : UInt32
    property size_of_file_names : UInt32
    property file_names : Win32cr::Foundation::PWSTR
    def initialize(@signature : Win32cr::System::ErrorReporting::WER_REPORT_SIGNATURE, @bucket_id : LibC::GUID, @report_id : LibC::GUID, @creation_time : Win32cr::Foundation::FILETIME, @size_in_bytes : UInt64, @cab_id : UInt16[260], @report_status : UInt32, @report_integrator_id : LibC::GUID, @number_of_files : UInt32, @size_of_file_names : UInt32, @file_names : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WER_REPORT_METADATA_V3
    property signature : Win32cr::System::ErrorReporting::WER_REPORT_SIGNATURE
    property bucket_id : LibC::GUID
    property report_id : LibC::GUID
    property creation_time : Win32cr::Foundation::FILETIME
    property size_in_bytes : UInt64
    property cab_id : UInt16[260]
    property report_status : UInt32
    property report_integrator_id : LibC::GUID
    property number_of_files : UInt32
    property size_of_file_names : UInt32
    property file_names : Win32cr::Foundation::PWSTR
    property friendly_event_name : UInt16[128]
    property application_name : UInt16[128]
    property application_path : UInt16[260]
    property description : UInt16[512]
    property bucket_id_string : UInt16[260]
    property legacy_bucket_id : UInt64
    def initialize(@signature : Win32cr::System::ErrorReporting::WER_REPORT_SIGNATURE, @bucket_id : LibC::GUID, @report_id : LibC::GUID, @creation_time : Win32cr::Foundation::FILETIME, @size_in_bytes : UInt64, @cab_id : UInt16[260], @report_status : UInt32, @report_integrator_id : LibC::GUID, @number_of_files : UInt32, @size_of_file_names : UInt32, @file_names : Win32cr::Foundation::PWSTR, @friendly_event_name : UInt16[128], @application_name : UInt16[128], @application_path : UInt16[260], @description : UInt16[512], @bucket_id_string : UInt16[260], @legacy_bucket_id : UInt64)
    end
  end

  @[Extern]
  struct WER_REPORT_METADATA_V1
    property signature : Win32cr::System::ErrorReporting::WER_REPORT_SIGNATURE
    property bucket_id : LibC::GUID
    property report_id : LibC::GUID
    property creation_time : Win32cr::Foundation::FILETIME
    property size_in_bytes : UInt64
    def initialize(@signature : Win32cr::System::ErrorReporting::WER_REPORT_SIGNATURE, @bucket_id : LibC::GUID, @report_id : LibC::GUID, @creation_time : Win32cr::Foundation::FILETIME, @size_in_bytes : UInt64)
    end
  end

  def werReportCreate(pwzEventType : Win32cr::Foundation::PWSTR, repType : Win32cr::System::ErrorReporting::WER_REPORT_TYPE, pReportInformation : Win32cr::System::ErrorReporting::WER_REPORT_INFORMATION*, phReportHandle : Win32cr::System::ErrorReporting::HREPORT*) : Win32cr::Foundation::HRESULT
    C.WerReportCreate(pwzEventType, repType, pReportInformation, phReportHandle)
  end

  def werReportSetParameter(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, dwparamID : UInt32, pwzName : Win32cr::Foundation::PWSTR, pwzValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerReportSetParameter(hReportHandle, dwparamID, pwzName, pwzValue)
  end

  def werReportAddFile(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, pwzPath : Win32cr::Foundation::PWSTR, repFileType : Win32cr::System::ErrorReporting::WER_FILE_TYPE, dwFileFlags : Win32cr::System::ErrorReporting::WER_FILE) : Win32cr::Foundation::HRESULT
    C.WerReportAddFile(hReportHandle, pwzPath, repFileType, dwFileFlags)
  end

  def werReportSetUIOption(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, repUITypeID : Win32cr::System::ErrorReporting::WER_REPORT_UI, pwzValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerReportSetUIOption(hReportHandle, repUITypeID, pwzValue)
  end

  def werReportSubmit(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, consent : Win32cr::System::ErrorReporting::WER_CONSENT, dwFlags : Win32cr::System::ErrorReporting::WER_SUBMIT_FLAGS, pSubmitResult : Win32cr::System::ErrorReporting::WER_SUBMIT_RESULT*) : Win32cr::Foundation::HRESULT
    C.WerReportSubmit(hReportHandle, consent, dwFlags, pSubmitResult)
  end

  def werReportAddDump(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, hProcess : Win32cr::Foundation::HANDLE, hThread : Win32cr::Foundation::HANDLE, dumpType : Win32cr::System::ErrorReporting::WER_DUMP_TYPE, pExceptionParam : Win32cr::System::ErrorReporting::WER_EXCEPTION_INFORMATION*, pDumpCustomOptions : Win32cr::System::ErrorReporting::WER_DUMP_CUSTOM_OPTIONS*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
    C.WerReportAddDump(hReportHandle, hProcess, hThread, dumpType, pExceptionParam, pDumpCustomOptions, dwFlags)
  end

  def werReportCloseHandle(hReportHandle : Win32cr::System::ErrorReporting::HREPORT) : Win32cr::Foundation::HRESULT
    C.WerReportCloseHandle(hReportHandle)
  end

  def werRegisterFile(pwzFile : Win32cr::Foundation::PWSTR, regFileType : Win32cr::System::ErrorReporting::WER_REGISTER_FILE_TYPE, dwFlags : Win32cr::System::ErrorReporting::WER_FILE) : Win32cr::Foundation::HRESULT
    C.WerRegisterFile(pwzFile, regFileType, dwFlags)
  end

  def werUnregisterFile(pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerUnregisterFile(pwzFilePath)
  end

  def werRegisterMemoryBlock(pvAddress : Void*, dwSize : UInt32) : Win32cr::Foundation::HRESULT
    C.WerRegisterMemoryBlock(pvAddress, dwSize)
  end

  def werUnregisterMemoryBlock(pvAddress : Void*) : Win32cr::Foundation::HRESULT
    C.WerUnregisterMemoryBlock(pvAddress)
  end

  def werRegisterExcludedMemoryBlock(address : Void*, size : UInt32) : Win32cr::Foundation::HRESULT
    C.WerRegisterExcludedMemoryBlock(address, size)
  end

  def werUnregisterExcludedMemoryBlock(address : Void*) : Win32cr::Foundation::HRESULT
    C.WerUnregisterExcludedMemoryBlock(address)
  end

  def werRegisterCustomMetadata(key : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerRegisterCustomMetadata(key, value)
  end

  def werUnregisterCustomMetadata(key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerUnregisterCustomMetadata(key)
  end

  def werRegisterAdditionalProcess(processId : UInt32, captureExtraInfoForThreadId : UInt32) : Win32cr::Foundation::HRESULT
    C.WerRegisterAdditionalProcess(processId, captureExtraInfoForThreadId)
  end

  def werUnregisterAdditionalProcess(processId : UInt32) : Win32cr::Foundation::HRESULT
    C.WerUnregisterAdditionalProcess(processId)
  end

  def werRegisterAppLocalDump(localAppDataRelativePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerRegisterAppLocalDump(localAppDataRelativePath)
  end

  def werUnregisterAppLocalDump : Win32cr::Foundation::HRESULT
    C.WerUnregisterAppLocalDump
  end

  def werSetFlags(dwFlags : Win32cr::System::ErrorReporting::WER_FAULT_REPORTING) : Win32cr::Foundation::HRESULT
    C.WerSetFlags(dwFlags)
  end

  def werGetFlags(hProcess : Win32cr::Foundation::HANDLE, pdwFlags : Win32cr::System::ErrorReporting::WER_FAULT_REPORTING*) : Win32cr::Foundation::HRESULT
    C.WerGetFlags(hProcess, pdwFlags)
  end

  def werAddExcludedApplication(pwzExeName : Win32cr::Foundation::PWSTR, bAllUsers : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.WerAddExcludedApplication(pwzExeName, bAllUsers)
  end

  def werRemoveExcludedApplication(pwzExeName : Win32cr::Foundation::PWSTR, bAllUsers : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.WerRemoveExcludedApplication(pwzExeName, bAllUsers)
  end

  def werRegisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll : Win32cr::Foundation::PWSTR, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.WerRegisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll, pContext)
  end

  def werUnregisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll : Win32cr::Foundation::PWSTR, pContext : Void*) : Win32cr::Foundation::HRESULT
    C.WerUnregisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll, pContext)
  end

  def werStoreOpen(repStoreType : Win32cr::System::ErrorReporting::REPORT_STORE_TYPES, phReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE*) : Win32cr::Foundation::HRESULT
    C.WerStoreOpen(repStoreType, phReportStore)
  end

  def werStoreClose(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE) : Void
    C.WerStoreClose(hReportStore)
  end

  def werStoreGetFirstReportKey(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, ppszReportKey : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.WerStoreGetFirstReportKey(hReportStore, ppszReportKey)
  end

  def werStoreGetNextReportKey(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, ppszReportKey : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.WerStoreGetNextReportKey(hReportStore, ppszReportKey)
  end

  def werStoreQueryReportMetadataV2(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, pReportMetadata : Win32cr::System::ErrorReporting::WER_REPORT_METADATA_V2*) : Win32cr::Foundation::HRESULT
    C.WerStoreQueryReportMetadataV2(hReportStore, pszReportKey, pReportMetadata)
  end

  def werStoreQueryReportMetadataV3(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, pReportMetadata : Win32cr::System::ErrorReporting::WER_REPORT_METADATA_V3*) : Win32cr::Foundation::HRESULT
    C.WerStoreQueryReportMetadataV3(hReportStore, pszReportKey, pReportMetadata)
  end

  def werFreeString(pwszStr : Win32cr::Foundation::PWSTR) : Void
    C.WerFreeString(pwszStr)
  end

  def werStorePurge : Win32cr::Foundation::HRESULT
    C.WerStorePurge
  end

  def werStoreGetReportCount(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pdwReportCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.WerStoreGetReportCount(hReportStore, pdwReportCount)
  end

  def werStoreGetSizeOnDisk(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pqwSizeInBytes : UInt64*) : Win32cr::Foundation::HRESULT
    C.WerStoreGetSizeOnDisk(hReportStore, pqwSizeInBytes)
  end

  def werStoreQueryReportMetadataV1(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, pReportMetadata : Win32cr::System::ErrorReporting::WER_REPORT_METADATA_V1*) : Win32cr::Foundation::HRESULT
    C.WerStoreQueryReportMetadataV1(hReportStore, pszReportKey, pReportMetadata)
  end

  def werStoreUploadReport(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pSubmitResult : Win32cr::System::ErrorReporting::WER_SUBMIT_RESULT*) : Win32cr::Foundation::HRESULT
    C.WerStoreUploadReport(hReportStore, pszReportKey, dwFlags, pSubmitResult)
  end

  def reportFault(pep : Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*, dwOpt : UInt32) : Win32cr::System::ErrorReporting::EFaultRepRetVal
    C.ReportFault(pep, dwOpt)
  end

  def addERExcludedApplicationA(szApplication : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.AddERExcludedApplicationA(szApplication)
  end

  def addERExcludedApplicationW(wszApplication : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.AddERExcludedApplicationW(wszApplication)
  end

  def werReportHang(hwndHungApp : Win32cr::Foundation::HWND, pwzHungApplicationName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.WerReportHang(hwndHungApp, pwzHungApplicationName)
  end

  @[Link("wer")]
  @[Link("kernel32")]
  @[Link("faultrep")]
  lib C
    # :nodoc:
    fun WerReportCreate(pwzEventType : Win32cr::Foundation::PWSTR, repType : Win32cr::System::ErrorReporting::WER_REPORT_TYPE, pReportInformation : Win32cr::System::ErrorReporting::WER_REPORT_INFORMATION*, phReportHandle : Win32cr::System::ErrorReporting::HREPORT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerReportSetParameter(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, dwparamID : UInt32, pwzName : Win32cr::Foundation::PWSTR, pwzValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerReportAddFile(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, pwzPath : Win32cr::Foundation::PWSTR, repFileType : Win32cr::System::ErrorReporting::WER_FILE_TYPE, dwFileFlags : Win32cr::System::ErrorReporting::WER_FILE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerReportSetUIOption(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, repUITypeID : Win32cr::System::ErrorReporting::WER_REPORT_UI, pwzValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerReportSubmit(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, consent : Win32cr::System::ErrorReporting::WER_CONSENT, dwFlags : Win32cr::System::ErrorReporting::WER_SUBMIT_FLAGS, pSubmitResult : Win32cr::System::ErrorReporting::WER_SUBMIT_RESULT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerReportAddDump(hReportHandle : Win32cr::System::ErrorReporting::HREPORT, hProcess : Win32cr::Foundation::HANDLE, hThread : Win32cr::Foundation::HANDLE, dumpType : Win32cr::System::ErrorReporting::WER_DUMP_TYPE, pExceptionParam : Win32cr::System::ErrorReporting::WER_EXCEPTION_INFORMATION*, pDumpCustomOptions : Win32cr::System::ErrorReporting::WER_DUMP_CUSTOM_OPTIONS*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerReportCloseHandle(hReportHandle : Win32cr::System::ErrorReporting::HREPORT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterFile(pwzFile : Win32cr::Foundation::PWSTR, regFileType : Win32cr::System::ErrorReporting::WER_REGISTER_FILE_TYPE, dwFlags : Win32cr::System::ErrorReporting::WER_FILE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterFile(pwzFilePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterMemoryBlock(pvAddress : Void*, dwSize : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterMemoryBlock(pvAddress : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterExcludedMemoryBlock(address : Void*, size : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterExcludedMemoryBlock(address : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterCustomMetadata(key : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterCustomMetadata(key : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterAdditionalProcess(processId : UInt32, captureExtraInfoForThreadId : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterAdditionalProcess(processId : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterAppLocalDump(localAppDataRelativePath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterAppLocalDump : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerSetFlags(dwFlags : Win32cr::System::ErrorReporting::WER_FAULT_REPORTING) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerGetFlags(hProcess : Win32cr::Foundation::HANDLE, pdwFlags : Win32cr::System::ErrorReporting::WER_FAULT_REPORTING*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerAddExcludedApplication(pwzExeName : Win32cr::Foundation::PWSTR, bAllUsers : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRemoveExcludedApplication(pwzExeName : Win32cr::Foundation::PWSTR, bAllUsers : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerRegisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll : Win32cr::Foundation::PWSTR, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerUnregisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll : Win32cr::Foundation::PWSTR, pContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreOpen(repStoreType : Win32cr::System::ErrorReporting::REPORT_STORE_TYPES, phReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreClose(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE) : Void

    # :nodoc:
    fun WerStoreGetFirstReportKey(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, ppszReportKey : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreGetNextReportKey(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, ppszReportKey : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreQueryReportMetadataV2(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, pReportMetadata : Win32cr::System::ErrorReporting::WER_REPORT_METADATA_V2*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreQueryReportMetadataV3(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, pReportMetadata : Win32cr::System::ErrorReporting::WER_REPORT_METADATA_V3*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerFreeString(pwszStr : Win32cr::Foundation::PWSTR) : Void

    # :nodoc:
    fun WerStorePurge : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreGetReportCount(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pdwReportCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreGetSizeOnDisk(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pqwSizeInBytes : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreQueryReportMetadataV1(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, pReportMetadata : Win32cr::System::ErrorReporting::WER_REPORT_METADATA_V1*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WerStoreUploadReport(hReportStore : Win32cr::System::ErrorReporting::HREPORTSTORE, pszReportKey : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pSubmitResult : Win32cr::System::ErrorReporting::WER_SUBMIT_RESULT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReportFault(pep : Win32cr::System::Diagnostics::Debug::EXCEPTION_POINTERS*, dwOpt : UInt32) : Win32cr::System::ErrorReporting::EFaultRepRetVal

    # :nodoc:
    fun AddERExcludedApplicationA(szApplication : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun AddERExcludedApplicationW(wszApplication : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun WerReportHang(hwndHungApp : Win32cr::Foundation::HWND, pwzHungApplicationName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

  end
end