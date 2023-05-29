require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:rstrtmgr.dll")]
lib LibWin32
  CCH_RM_SESSION_KEY = 32_u32
  CCH_RM_MAX_APP_NAME = 255_u32
  CCH_RM_MAX_SVC_NAME = 63_u32
  RM_INVALID_TS_SESSION = -1_i32
  RM_INVALID_PROCESS = -1_i32

  alias RM_WRITE_STATUS_CALLBACK = Proc(UInt32, Void)


  enum RM_APP_TYPE : Int32
    RmUnknownApp = 0
    RmMainWindow = 1
    RmOtherWindow = 2
    RmService = 3
    RmExplorer = 4
    RmConsole = 5
    RmCritical = 1000
  end

  enum RM_SHUTDOWN_TYPE : Int32
    RmForceShutdown = 1
    RmShutdownOnlyRegistered = 16
  end

  enum RM_APP_STATUS : Int32
    RmStatusUnknown = 0
    RmStatusRunning = 1
    RmStatusStopped = 2
    RmStatusStoppedOther = 4
    RmStatusRestarted = 8
    RmStatusErrorOnStop = 16
    RmStatusErrorOnRestart = 32
    RmStatusShutdownMasked = 64
    RmStatusRestartMasked = 128
  end

  enum RM_REBOOT_REASON : Int32
    RmRebootReasonNone = 0
    RmRebootReasonPermissionDenied = 1
    RmRebootReasonSessionMismatch = 2
    RmRebootReasonCriticalProcess = 4
    RmRebootReasonCriticalService = 8
    RmRebootReasonDetectedSelf = 16
  end

  enum RM_FILTER_TRIGGER : Int32
    RmFilterTriggerInvalid = 0
    RmFilterTriggerFile = 1
    RmFilterTriggerProcess = 2
    RmFilterTriggerService = 3
  end

  enum RM_FILTER_ACTION : Int32
    RmInvalidFilterAction = 0
    RmNoRestart = 1
    RmNoShutdown = 2
  end

  union RM_FILTER_INFO_Anonymous_e__Union
    str_filename : LibC::LPWSTR
    process : RM_UNIQUE_PROCESS
    str_service_short_name : LibC::LPWSTR
  end

  struct RM_UNIQUE_PROCESS
    dw_process_id : UInt32
    process_start_time : FILETIME
  end
  struct RM_PROCESS_INFO
    process : RM_UNIQUE_PROCESS
    str_app_name : Char[256]*
    str_service_short_name : Char[64]*
    application_type : RM_APP_TYPE
    app_status : UInt32
    ts_session_id : UInt32
    b_restartable : LibC::BOOL
  end
  struct RM_FILTER_INFO
    filter_action : RM_FILTER_ACTION
    filter_trigger : RM_FILTER_TRIGGER
    cb_next_offset : UInt32
    anonymous : RM_FILTER_INFO_Anonymous_e__Union
  end


  # Params # psessionhandle : UInt32* [In],dwsessionflags : UInt32 [In],strsessionkey : LibC::LPWSTR [In]
  fun RmStartSession(psessionhandle : UInt32*, dwsessionflags : UInt32, strsessionkey : LibC::LPWSTR) : UInt32

  # Params # psessionhandle : UInt32* [In],strsessionkey : LibC::LPWSTR [In]
  fun RmJoinSession(psessionhandle : UInt32*, strsessionkey : LibC::LPWSTR) : UInt32

  # Params # dwsessionhandle : UInt32 [In]
  fun RmEndSession(dwsessionhandle : UInt32) : UInt32

  # Params # dwsessionhandle : UInt32 [In],nfiles : UInt32 [In],rgsfilenames : LibC::LPWSTR* [In],napplications : UInt32 [In],rgapplications : RM_UNIQUE_PROCESS* [In],nservices : UInt32 [In],rgsservicenames : LibC::LPWSTR* [In]
  fun RmRegisterResources(dwsessionhandle : UInt32, nfiles : UInt32, rgsfilenames : LibC::LPWSTR*, napplications : UInt32, rgapplications : RM_UNIQUE_PROCESS*, nservices : UInt32, rgsservicenames : LibC::LPWSTR*) : UInt32

  # Params # dwsessionhandle : UInt32 [In],pnprocinfoneeded : UInt32* [In],pnprocinfo : UInt32* [In],rgaffectedapps : RM_PROCESS_INFO* [In],lpdwrebootreasons : UInt32* [In]
  fun RmGetList(dwsessionhandle : UInt32, pnprocinfoneeded : UInt32*, pnprocinfo : UInt32*, rgaffectedapps : RM_PROCESS_INFO*, lpdwrebootreasons : UInt32*) : UInt32

  # Params # dwsessionhandle : UInt32 [In],lactionflags : UInt32 [In],fnstatus : RM_WRITE_STATUS_CALLBACK [In]
  fun RmShutdown(dwsessionhandle : UInt32, lactionflags : UInt32, fnstatus : RM_WRITE_STATUS_CALLBACK) : UInt32

  # Params # dwsessionhandle : UInt32 [In],dwrestartflags : UInt32 [In],fnstatus : RM_WRITE_STATUS_CALLBACK [In]
  fun RmRestart(dwsessionhandle : UInt32, dwrestartflags : UInt32, fnstatus : RM_WRITE_STATUS_CALLBACK) : UInt32

  # Params # dwsessionhandle : UInt32 [In]
  fun RmCancelCurrentTask(dwsessionhandle : UInt32) : UInt32

  # Params # dwsessionhandle : UInt32 [In],strmodulename : LibC::LPWSTR [In],pprocess : RM_UNIQUE_PROCESS* [In],strserviceshortname : LibC::LPWSTR [In],filteraction : RM_FILTER_ACTION [In]
  fun RmAddFilter(dwsessionhandle : UInt32, strmodulename : LibC::LPWSTR, pprocess : RM_UNIQUE_PROCESS*, strserviceshortname : LibC::LPWSTR, filteraction : RM_FILTER_ACTION) : UInt32

  # Params # dwsessionhandle : UInt32 [In],strmodulename : LibC::LPWSTR [In],pprocess : RM_UNIQUE_PROCESS* [In],strserviceshortname : LibC::LPWSTR [In]
  fun RmRemoveFilter(dwsessionhandle : UInt32, strmodulename : LibC::LPWSTR, pprocess : RM_UNIQUE_PROCESS*, strserviceshortname : LibC::LPWSTR) : UInt32

  # Params # dwsessionhandle : UInt32 [In],pbfilterbuf : UInt8* [In],cbfilterbuf : UInt32 [In],cbfilterbufneeded : UInt32* [In]
  fun RmGetFilterList(dwsessionhandle : UInt32, pbfilterbuf : UInt8*, cbfilterbuf : UInt32, cbfilterbufneeded : UInt32*) : UInt32
end
