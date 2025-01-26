require "./../foundation.cr"

module Win32cr::System::RestartManager
  alias RM_WRITE_STATUS_CALLBACK = Proc(UInt32, Void)

  CCH_RM_SESSION_KEY = 32_u32
  CCH_RM_MAX_APP_NAME = 255_u32
  CCH_RM_MAX_SVC_NAME = 63_u32
  RM_INVALID_TS_SESSION = -1_i32
  RM_INVALID_PROCESS = -1_i32

  enum RM_APP_TYPE
    RmUnknownApp = 0_i32
    RmMainWindow = 1_i32
    RmOtherWindow = 2_i32
    RmService = 3_i32
    RmExplorer = 4_i32
    RmConsole = 5_i32
    RmCritical = 1000_i32
  end
  enum RM_SHUTDOWN_TYPE
    RmForceShutdown = 1_i32
    RmShutdownOnlyRegistered = 16_i32
  end
  enum RM_APP_STATUS
    RmStatusUnknown = 0_i32
    RmStatusRunning = 1_i32
    RmStatusStopped = 2_i32
    RmStatusStoppedOther = 4_i32
    RmStatusRestarted = 8_i32
    RmStatusErrorOnStop = 16_i32
    RmStatusErrorOnRestart = 32_i32
    RmStatusShutdownMasked = 64_i32
    RmStatusRestartMasked = 128_i32
  end
  enum RM_REBOOT_REASON
    RmRebootReasonNone = 0_i32
    RmRebootReasonPermissionDenied = 1_i32
    RmRebootReasonSessionMismatch = 2_i32
    RmRebootReasonCriticalProcess = 4_i32
    RmRebootReasonCriticalService = 8_i32
    RmRebootReasonDetectedSelf = 16_i32
  end
  enum RM_FILTER_TRIGGER
    RmFilterTriggerInvalid = 0_i32
    RmFilterTriggerFile = 1_i32
    RmFilterTriggerProcess = 2_i32
    RmFilterTriggerService = 3_i32
  end
  enum RM_FILTER_ACTION
    RmInvalidFilterAction = 0_i32
    RmNoRestart = 1_i32
    RmNoShutdown = 2_i32
  end

  @[Extern]
  struct RM_UNIQUE_PROCESS
    property dwProcessId : UInt32
    property process_start_time : Win32cr::Foundation::FILETIME
    def initialize(@dwProcessId : UInt32, @process_start_time : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct RM_PROCESS_INFO
    property process : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS
    property strAppName : UInt16[256]
    property strServiceShortName : UInt16[64]
    property application_type : Win32cr::System::RestartManager::RM_APP_TYPE
    property app_status : UInt32
    property ts_session_id : UInt32
    property bRestartable : Win32cr::Foundation::BOOL
    def initialize(@process : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS, @strAppName : UInt16[256], @strServiceShortName : UInt16[64], @application_type : Win32cr::System::RestartManager::RM_APP_TYPE, @app_status : UInt32, @ts_session_id : UInt32, @bRestartable : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct RM_FILTER_INFO
    property filter_action : Win32cr::System::RestartManager::RM_FILTER_ACTION
    property filter_trigger : Win32cr::System::RestartManager::RM_FILTER_TRIGGER
    property cbNextOffset : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property strFilename : Win32cr::Foundation::PWSTR
    property process : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS
    property strServiceShortName : Win32cr::Foundation::PWSTR
    def initialize(@strFilename : Win32cr::Foundation::PWSTR, @process : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS, @strServiceShortName : Win32cr::Foundation::PWSTR)
    end
    end

    def initialize(@filter_action : Win32cr::System::RestartManager::RM_FILTER_ACTION, @filter_trigger : Win32cr::System::RestartManager::RM_FILTER_TRIGGER, @cbNextOffset : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Link("rstrtmgr")]
  lib C
    fun RmStartSession(pSessionHandle : UInt32*, dwSessionFlags : UInt32, strSessionKey : Win32cr::Foundation::PWSTR) : UInt32

    fun RmJoinSession(pSessionHandle : UInt32*, strSessionKey : Win32cr::Foundation::PWSTR) : UInt32

    fun RmEndSession(dwSessionHandle : UInt32) : UInt32

    fun RmRegisterResources(dwSessionHandle : UInt32, nFiles : UInt32, rgsFileNames : Win32cr::Foundation::PWSTR*, nApplications : UInt32, rgApplications : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS*, nServices : UInt32, rgsServiceNames : Win32cr::Foundation::PWSTR*) : UInt32

    fun RmGetList(dwSessionHandle : UInt32, pnProcInfoNeeded : UInt32*, pnProcInfo : UInt32*, rgAffectedApps : Win32cr::System::RestartManager::RM_PROCESS_INFO*, lpdwRebootReasons : UInt32*) : UInt32

    fun RmShutdown(dwSessionHandle : UInt32, lActionFlags : UInt32, fnStatus : Win32cr::System::RestartManager::RM_WRITE_STATUS_CALLBACK) : UInt32

    fun RmRestart(dwSessionHandle : UInt32, dwRestartFlags : UInt32, fnStatus : Win32cr::System::RestartManager::RM_WRITE_STATUS_CALLBACK) : UInt32

    fun RmCancelCurrentTask(dwSessionHandle : UInt32) : UInt32

    fun RmAddFilter(dwSessionHandle : UInt32, strModuleName : Win32cr::Foundation::PWSTR, pProcess : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS*, strServiceShortName : Win32cr::Foundation::PWSTR, filter_action : Win32cr::System::RestartManager::RM_FILTER_ACTION) : UInt32

    fun RmRemoveFilter(dwSessionHandle : UInt32, strModuleName : Win32cr::Foundation::PWSTR, pProcess : Win32cr::System::RestartManager::RM_UNIQUE_PROCESS*, strServiceShortName : Win32cr::Foundation::PWSTR) : UInt32

    fun RmGetFilterList(dwSessionHandle : UInt32, pbFilterBuf : UInt8*, cbFilterBuf : UInt32, cbFilterBufNeeded : UInt32*) : UInt32

  end
end