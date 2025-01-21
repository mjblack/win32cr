require "./com.cr"
require "./../foundation.cr"
require "./../ui/controls.cr"

module Win32cr::System::TaskScheduler
  TASK_SUNDAY = 1_u32
  TASK_MONDAY = 2_u32
  TASK_TUESDAY = 4_u32
  TASK_WEDNESDAY = 8_u32
  TASK_THURSDAY = 16_u32
  TASK_FRIDAY = 32_u32
  TASK_SATURDAY = 64_u32
  TASK_FIRST_WEEK = 1_u32
  TASK_SECOND_WEEK = 2_u32
  TASK_THIRD_WEEK = 3_u32
  TASK_FOURTH_WEEK = 4_u32
  TASK_LAST_WEEK = 5_u32
  TASK_JANUARY = 1_u32
  TASK_FEBRUARY = 2_u32
  TASK_MARCH = 4_u32
  TASK_APRIL = 8_u32
  TASK_MAY = 16_u32
  TASK_JUNE = 32_u32
  TASK_JULY = 64_u32
  TASK_AUGUST = 128_u32
  TASK_SEPTEMBER = 256_u32
  TASK_OCTOBER = 512_u32
  TASK_NOVEMBER = 1024_u32
  TASK_DECEMBER = 2048_u32
  TASK_FLAG_INTERACTIVE = 1_u32
  TASK_FLAG_DELETE_WHEN_DONE = 2_u32
  TASK_FLAG_DISABLED = 4_u32
  TASK_FLAG_START_ONLY_IF_IDLE = 16_u32
  TASK_FLAG_KILL_ON_IDLE_END = 32_u32
  TASK_FLAG_DONT_START_IF_ON_BATTERIES = 64_u32
  TASK_FLAG_KILL_IF_GOING_ON_BATTERIES = 128_u32
  TASK_FLAG_RUN_ONLY_IF_DOCKED = 256_u32
  TASK_FLAG_HIDDEN = 512_u32
  TASK_FLAG_RUN_IF_CONNECTED_TO_INTERNET = 1024_u32
  TASK_FLAG_RESTART_ON_IDLE_RESUME = 2048_u32
  TASK_FLAG_SYSTEM_REQUIRED = 4096_u32
  TASK_FLAG_RUN_ONLY_IF_LOGGED_ON = 8192_u32
  TASK_TRIGGER_FLAG_HAS_END_DATE = 1_u32
  TASK_TRIGGER_FLAG_KILL_AT_DURATION_END = 2_u32
  TASK_TRIGGER_FLAG_DISABLED = 4_u32
  TASK_MAX_RUN_TIMES = 1440_u32
  CLSID_CTask = "148bd520-a2ab-11ce-b11f-00aa00530503"
  CLSID_CTaskScheduler = "148bd52a-a2ab-11ce-b11f-00aa00530503"

  CLSID_TaskScheduler = LibC::GUID.new(0xf87369f_u32, 0xa4e5_u16, 0x4cfc_u16, StaticArray[0xbd_u8, 0x3e_u8, 0x73_u8, 0xe6_u8, 0x15_u8, 0x45_u8, 0x72_u8, 0xdd_u8])

  CLSID_TaskHandlerPS = LibC::GUID.new(0xf2a69db7_u32, 0xda2c_u16, 0x4352_u16, StaticArray[0x90_u8, 0x66_u8, 0x86_u8, 0xfe_u8, 0xe6_u8, 0xda_u8, 0xca_u8, 0xc9_u8])

  CLSID_TaskHandlerStatusPS = LibC::GUID.new(0x9f15266d_u32, 0xd7ba_u16, 0x48f0_u16, StaticArray[0x93_u8, 0xc1_u8, 0xe6_u8, 0x89_u8, 0x5f_u8, 0x6f_u8, 0xe5_u8, 0xac_u8])

  enum TASK_TRIGGER_TYPE
    TASK_TIME_TRIGGER_ONCE = 0_i32
    TASK_TIME_TRIGGER_DAILY = 1_i32
    TASK_TIME_TRIGGER_WEEKLY = 2_i32
    TASK_TIME_TRIGGER_MONTHLYDATE = 3_i32
    TASK_TIME_TRIGGER_MONTHLYDOW = 4_i32
    TASK_EVENT_TRIGGER_ON_IDLE = 5_i32
    TASK_EVENT_TRIGGER_AT_SYSTEMSTART = 6_i32
    TASK_EVENT_TRIGGER_AT_LOGON = 7_i32
  end
  enum TASKPAGE
    TASKPAGE_TASK = 0_i32
    TASKPAGE_SCHEDULE = 1_i32
    TASKPAGE_SETTINGS = 2_i32
  end
  enum TASK_RUN_FLAGS
    TASK_RUN_NO_FLAGS = 0_i32
    TASK_RUN_AS_SELF = 1_i32
    TASK_RUN_IGNORE_CONSTRAINTS = 2_i32
    TASK_RUN_USE_SESSION_ID = 4_i32
    TASK_RUN_USER_SID = 8_i32
  end
  enum TASK_ENUM_FLAGS
    TASK_ENUM_HIDDEN = 1_i32
  end
  enum TASK_LOGON_TYPE
    TASK_LOGON_NONE = 0_i32
    TASK_LOGON_PASSWORD = 1_i32
    TASK_LOGON_S4U = 2_i32
    TASK_LOGON_INTERACTIVE_TOKEN = 3_i32
    TASK_LOGON_GROUP = 4_i32
    TASK_LOGON_SERVICE_ACCOUNT = 5_i32
    TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD = 6_i32
  end
  enum TASK_RUNLEVEL_TYPE
    TASK_RUNLEVEL_LUA = 0_i32
    TASK_RUNLEVEL_HIGHEST = 1_i32
  end
  enum TASK_PROCESSTOKENSID_TYPE
    TASK_PROCESSTOKENSID_NONE = 0_i32
    TASK_PROCESSTOKENSID_UNRESTRICTED = 1_i32
    TASK_PROCESSTOKENSID_DEFAULT = 2_i32
  end
  enum TASK_STATE
    TASK_STATE_UNKNOWN = 0_i32
    TASK_STATE_DISABLED = 1_i32
    TASK_STATE_QUEUED = 2_i32
    TASK_STATE_READY = 3_i32
    TASK_STATE_RUNNING = 4_i32
  end
  enum TASK_CREATION
    TASK_VALIDATE_ONLY = 1_i32
    TASK_CREATE = 2_i32
    TASK_UPDATE = 4_i32
    TASK_CREATE_OR_UPDATE = 6_i32
    TASK_DISABLE = 8_i32
    TASK_DONT_ADD_PRINCIPAL_ACE = 16_i32
    TASK_IGNORE_REGISTRATION_TRIGGERS = 32_i32
  end
  enum TASK_TRIGGER_TYPE2
    TASK_TRIGGER_EVENT = 0_i32
    TASK_TRIGGER_TIME = 1_i32
    TASK_TRIGGER_DAILY = 2_i32
    TASK_TRIGGER_WEEKLY = 3_i32
    TASK_TRIGGER_MONTHLY = 4_i32
    TASK_TRIGGER_MONTHLYDOW = 5_i32
    TASK_TRIGGER_IDLE = 6_i32
    TASK_TRIGGER_REGISTRATION = 7_i32
    TASK_TRIGGER_BOOT = 8_i32
    TASK_TRIGGER_LOGON = 9_i32
    TASK_TRIGGER_SESSION_STATE_CHANGE = 11_i32
    TASK_TRIGGER_CUSTOM_TRIGGER_01 = 12_i32
  end
  enum TASK_SESSION_STATE_CHANGE_TYPE
    TASK_CONSOLE_CONNECT = 1_i32
    TASK_CONSOLE_DISCONNECT = 2_i32
    TASK_REMOTE_CONNECT = 3_i32
    TASK_REMOTE_DISCONNECT = 4_i32
    TASK_SESSION_LOCK = 7_i32
    TASK_SESSION_UNLOCK = 8_i32
  end
  enum TASK_ACTION_TYPE
    TASK_ACTION_EXEC = 0_i32
    TASK_ACTION_COM_HANDLER = 5_i32
    TASK_ACTION_SEND_EMAIL = 6_i32
    TASK_ACTION_SHOW_MESSAGE = 7_i32
  end
  enum TASK_INSTANCES_POLICY
    TASK_INSTANCES_PARALLEL = 0_i32
    TASK_INSTANCES_QUEUE = 1_i32
    TASK_INSTANCES_IGNORE_NEW = 2_i32
    TASK_INSTANCES_STOP_EXISTING = 3_i32
  end
  enum TASK_COMPATIBILITY
    TASK_COMPATIBILITY_AT = 0_i32
    TASK_COMPATIBILITY_V1 = 1_i32
    TASK_COMPATIBILITY_V2 = 2_i32
    TASK_COMPATIBILITY_V2_1 = 3_i32
    TASK_COMPATIBILITY_V2_2 = 4_i32
    TASK_COMPATIBILITY_V2_3 = 5_i32
    TASK_COMPATIBILITY_V2_4 = 6_i32
  end

  @[Extern]
  record DAILY,
    days_interval : UInt16

  @[Extern]
  record WEEKLY,
    weeks_interval : UInt16,
    rgfDaysOfTheWeek : UInt16

  @[Extern]
  record MONTHLYDATE,
    rgfDays : UInt32,
    rgfMonths : UInt16

  @[Extern]
  record MONTHLYDOW,
    wWhichWeek : UInt16,
    rgfDaysOfTheWeek : UInt16,
    rgfMonths : UInt16

  @[Extern(union: true)]
  record TRIGGER_TYPE_UNION,
    daily : Win32cr::System::TaskScheduler::DAILY,
    weekly : Win32cr::System::TaskScheduler::WEEKLY,
    monthly_date : Win32cr::System::TaskScheduler::MONTHLYDATE,
    monthly_dow : Win32cr::System::TaskScheduler::MONTHLYDOW

  @[Extern]
  record TASK_TRIGGER,
    cbTriggerSize : UInt16,
    reserved1 : UInt16,
    wBeginYear : UInt16,
    wBeginMonth : UInt16,
    wBeginDay : UInt16,
    wEndYear : UInt16,
    wEndMonth : UInt16,
    wEndDay : UInt16,
    wStartHour : UInt16,
    wStartMinute : UInt16,
    minutes_duration : UInt32,
    minutes_interval : UInt32,
    rgFlags : UInt32,
    trigger_type : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE,
    type__ : Win32cr::System::TaskScheduler::TRIGGER_TYPE_UNION,
    reserved2 : UInt16,
    wRandomMinutesInterval : UInt16

  @[Extern]
  record ITaskTriggerVtbl,
    query_interface : Proc(ITaskTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskTrigger*, UInt32),
    release : Proc(ITaskTrigger*, UInt32),
    set_trigger : Proc(ITaskTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER*, Win32cr::Foundation::HRESULT),
    get_trigger : Proc(ITaskTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER*, Win32cr::Foundation::HRESULT),
    get_trigger_string : Proc(ITaskTrigger*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("148bd52b-a2ab-11ce-b11f-00aa00530503")]
  record ITaskTrigger, lpVtbl : ITaskTriggerVtbl* do
    GUID = LibC::GUID.new(0x148bd52b_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
    def query_interface(this : ITaskTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_trigger(this : ITaskTrigger*, pTrigger : Win32cr::System::TaskScheduler::TASK_TRIGGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_trigger.call(this, pTrigger)
    end
    def get_trigger(this : ITaskTrigger*, pTrigger : Win32cr::System::TaskScheduler::TASK_TRIGGER*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger.call(this, pTrigger)
    end
    def get_trigger_string(this : ITaskTrigger*, ppwszTrigger : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger_string.call(this, ppwszTrigger)
    end

  end

  @[Extern]
  record IScheduledWorkItemVtbl,
    query_interface : Proc(IScheduledWorkItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScheduledWorkItem*, UInt32),
    release : Proc(IScheduledWorkItem*, UInt32),
    create_trigger : Proc(IScheduledWorkItem*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    delete_trigger : Proc(IScheduledWorkItem*, UInt16, Win32cr::Foundation::HRESULT),
    get_trigger_count : Proc(IScheduledWorkItem*, UInt16*, Win32cr::Foundation::HRESULT),
    get_trigger : Proc(IScheduledWorkItem*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    get_trigger_string : Proc(IScheduledWorkItem*, UInt16, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_run_times : Proc(IScheduledWorkItem*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::SYSTEMTIME*, UInt16*, Win32cr::Foundation::SYSTEMTIME**, Win32cr::Foundation::HRESULT),
    get_next_run_time : Proc(IScheduledWorkItem*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    set_idle_wait : Proc(IScheduledWorkItem*, UInt16, UInt16, Win32cr::Foundation::HRESULT),
    get_idle_wait : Proc(IScheduledWorkItem*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    run : Proc(IScheduledWorkItem*, Win32cr::Foundation::HRESULT),
    terminate : Proc(IScheduledWorkItem*, Win32cr::Foundation::HRESULT),
    edit_work_item : Proc(IScheduledWorkItem*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_most_recent_run_time : Proc(IScheduledWorkItem*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IScheduledWorkItem*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_exit_code : Proc(IScheduledWorkItem*, UInt32*, Win32cr::Foundation::HRESULT),
    set_comment : Proc(IScheduledWorkItem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_comment : Proc(IScheduledWorkItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_creator : Proc(IScheduledWorkItem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_creator : Proc(IScheduledWorkItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_work_item_data : Proc(IScheduledWorkItem*, UInt16, UInt8*, Win32cr::Foundation::HRESULT),
    get_work_item_data : Proc(IScheduledWorkItem*, UInt16*, UInt8**, Win32cr::Foundation::HRESULT),
    set_error_retry_count : Proc(IScheduledWorkItem*, UInt16, Win32cr::Foundation::HRESULT),
    get_error_retry_count : Proc(IScheduledWorkItem*, UInt16*, Win32cr::Foundation::HRESULT),
    set_error_retry_interval : Proc(IScheduledWorkItem*, UInt16, Win32cr::Foundation::HRESULT),
    get_error_retry_interval : Proc(IScheduledWorkItem*, UInt16*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(IScheduledWorkItem*, UInt32, Win32cr::Foundation::HRESULT),
    get_flags : Proc(IScheduledWorkItem*, UInt32*, Win32cr::Foundation::HRESULT),
    set_account_information : Proc(IScheduledWorkItem*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_account_information : Proc(IScheduledWorkItem*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a6b952f0-a4b1-11d0-997d-00aa006887ec")]
  record IScheduledWorkItem, lpVtbl : IScheduledWorkItemVtbl* do
    GUID = LibC::GUID.new(0xa6b952f0_u32, 0xa4b1_u16, 0x11d0_u16, StaticArray[0x99_u8, 0x7d_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xec_u8])
    def query_interface(this : IScheduledWorkItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScheduledWorkItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScheduledWorkItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_trigger(this : IScheduledWorkItem*, piNewTrigger : UInt16*, ppTrigger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_trigger.call(this, piNewTrigger, ppTrigger)
    end
    def delete_trigger(this : IScheduledWorkItem*, iTrigger : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_trigger.call(this, iTrigger)
    end
    def get_trigger_count(this : IScheduledWorkItem*, pwCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger_count.call(this, pwCount)
    end
    def get_trigger(this : IScheduledWorkItem*, iTrigger : UInt16, ppTrigger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger.call(this, iTrigger, ppTrigger)
    end
    def get_trigger_string(this : IScheduledWorkItem*, iTrigger : UInt16, ppwszTrigger : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger_string.call(this, iTrigger, ppwszTrigger)
    end
    def get_run_times(this : IScheduledWorkItem*, pstBegin : Win32cr::Foundation::SYSTEMTIME*, pstEnd : Win32cr::Foundation::SYSTEMTIME*, pCount : UInt16*, rgstTaskTimes : Win32cr::Foundation::SYSTEMTIME**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_run_times.call(this, pstBegin, pstEnd, pCount, rgstTaskTimes)
    end
    def get_next_run_time(this : IScheduledWorkItem*, pstNextRun : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_run_time.call(this, pstNextRun)
    end
    def set_idle_wait(this : IScheduledWorkItem*, wIdleMinutes : UInt16, wDeadlineMinutes : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_idle_wait.call(this, wIdleMinutes, wDeadlineMinutes)
    end
    def get_idle_wait(this : IScheduledWorkItem*, pwIdleMinutes : UInt16*, pwDeadlineMinutes : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_idle_wait.call(this, pwIdleMinutes, pwDeadlineMinutes)
    end
    def run(this : IScheduledWorkItem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this)
    end
    def terminate(this : IScheduledWorkItem*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end
    def edit_work_item(this : IScheduledWorkItem*, hParent : Win32cr::Foundation::HWND, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_work_item.call(this, hParent, dwReserved)
    end
    def get_most_recent_run_time(this : IScheduledWorkItem*, pstLastRun : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_most_recent_run_time.call(this, pstLastRun)
    end
    def get_status(this : IScheduledWorkItem*, phrStatus : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, phrStatus)
    end
    def get_exit_code(this : IScheduledWorkItem*, pdwExitCode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exit_code.call(this, pdwExitCode)
    end
    def set_comment(this : IScheduledWorkItem*, pwszComment : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_comment.call(this, pwszComment)
    end
    def get_comment(this : IScheduledWorkItem*, ppwszComment : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_comment.call(this, ppwszComment)
    end
    def set_creator(this : IScheduledWorkItem*, pwszCreator : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_creator.call(this, pwszCreator)
    end
    def get_creator(this : IScheduledWorkItem*, ppwszCreator : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_creator.call(this, ppwszCreator)
    end
    def set_work_item_data(this : IScheduledWorkItem*, cbData : UInt16, rgbData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_item_data.call(this, cbData, rgbData)
    end
    def get_work_item_data(this : IScheduledWorkItem*, pcbData : UInt16*, prgbData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_item_data.call(this, pcbData, prgbData)
    end
    def set_error_retry_count(this : IScheduledWorkItem*, wRetryCount : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_retry_count.call(this, wRetryCount)
    end
    def get_error_retry_count(this : IScheduledWorkItem*, pwRetryCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_retry_count.call(this, pwRetryCount)
    end
    def set_error_retry_interval(this : IScheduledWorkItem*, wRetryInterval : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_retry_interval.call(this, wRetryInterval)
    end
    def get_error_retry_interval(this : IScheduledWorkItem*, pwRetryInterval : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_retry_interval.call(this, pwRetryInterval)
    end
    def set_flags(this : IScheduledWorkItem*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, dwFlags)
    end
    def get_flags(this : IScheduledWorkItem*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pdwFlags)
    end
    def set_account_information(this : IScheduledWorkItem*, pwszAccountName : Win32cr::Foundation::PWSTR, pwszPassword : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_account_information.call(this, pwszAccountName, pwszPassword)
    end
    def get_account_information(this : IScheduledWorkItem*, ppwszAccountName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_account_information.call(this, ppwszAccountName)
    end

  end

  @[Extern]
  record ITaskVtbl,
    query_interface : Proc(ITask*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITask*, UInt32),
    release : Proc(ITask*, UInt32),
    create_trigger : Proc(ITask*, UInt16*, Void**, Win32cr::Foundation::HRESULT),
    delete_trigger : Proc(ITask*, UInt16, Win32cr::Foundation::HRESULT),
    get_trigger_count : Proc(ITask*, UInt16*, Win32cr::Foundation::HRESULT),
    get_trigger : Proc(ITask*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    get_trigger_string : Proc(ITask*, UInt16, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_run_times : Proc(ITask*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::SYSTEMTIME*, UInt16*, Win32cr::Foundation::SYSTEMTIME**, Win32cr::Foundation::HRESULT),
    get_next_run_time : Proc(ITask*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    set_idle_wait : Proc(ITask*, UInt16, UInt16, Win32cr::Foundation::HRESULT),
    get_idle_wait : Proc(ITask*, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    run : Proc(ITask*, Win32cr::Foundation::HRESULT),
    terminate : Proc(ITask*, Win32cr::Foundation::HRESULT),
    edit_work_item : Proc(ITask*, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::HRESULT),
    get_most_recent_run_time : Proc(ITask*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITask*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_exit_code : Proc(ITask*, UInt32*, Win32cr::Foundation::HRESULT),
    set_comment : Proc(ITask*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_comment : Proc(ITask*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_creator : Proc(ITask*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_creator : Proc(ITask*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_work_item_data : Proc(ITask*, UInt16, UInt8*, Win32cr::Foundation::HRESULT),
    get_work_item_data : Proc(ITask*, UInt16*, UInt8**, Win32cr::Foundation::HRESULT),
    set_error_retry_count : Proc(ITask*, UInt16, Win32cr::Foundation::HRESULT),
    get_error_retry_count : Proc(ITask*, UInt16*, Win32cr::Foundation::HRESULT),
    set_error_retry_interval : Proc(ITask*, UInt16, Win32cr::Foundation::HRESULT),
    get_error_retry_interval : Proc(ITask*, UInt16*, Win32cr::Foundation::HRESULT),
    set_flags : Proc(ITask*, UInt32, Win32cr::Foundation::HRESULT),
    get_flags : Proc(ITask*, UInt32*, Win32cr::Foundation::HRESULT),
    set_account_information : Proc(ITask*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_account_information : Proc(ITask*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_application_name : Proc(ITask*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_application_name : Proc(ITask*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_parameters : Proc(ITask*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_parameters : Proc(ITask*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_working_directory : Proc(ITask*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_working_directory : Proc(ITask*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_priority : Proc(ITask*, UInt32, Win32cr::Foundation::HRESULT),
    get_priority : Proc(ITask*, UInt32*, Win32cr::Foundation::HRESULT),
    set_task_flags : Proc(ITask*, UInt32, Win32cr::Foundation::HRESULT),
    get_task_flags : Proc(ITask*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_run_time : Proc(ITask*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_run_time : Proc(ITask*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("148bd524-a2ab-11ce-b11f-00aa00530503")]
  record ITask, lpVtbl : ITaskVtbl* do
    GUID = LibC::GUID.new(0x148bd524_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
    def query_interface(this : ITask*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITask*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITask*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_trigger(this : ITask*, piNewTrigger : UInt16*, ppTrigger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_trigger.call(this, piNewTrigger, ppTrigger)
    end
    def delete_trigger(this : ITask*, iTrigger : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_trigger.call(this, iTrigger)
    end
    def get_trigger_count(this : ITask*, pwCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger_count.call(this, pwCount)
    end
    def get_trigger(this : ITask*, iTrigger : UInt16, ppTrigger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger.call(this, iTrigger, ppTrigger)
    end
    def get_trigger_string(this : ITask*, iTrigger : UInt16, ppwszTrigger : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trigger_string.call(this, iTrigger, ppwszTrigger)
    end
    def get_run_times(this : ITask*, pstBegin : Win32cr::Foundation::SYSTEMTIME*, pstEnd : Win32cr::Foundation::SYSTEMTIME*, pCount : UInt16*, rgstTaskTimes : Win32cr::Foundation::SYSTEMTIME**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_run_times.call(this, pstBegin, pstEnd, pCount, rgstTaskTimes)
    end
    def get_next_run_time(this : ITask*, pstNextRun : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_run_time.call(this, pstNextRun)
    end
    def set_idle_wait(this : ITask*, wIdleMinutes : UInt16, wDeadlineMinutes : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_idle_wait.call(this, wIdleMinutes, wDeadlineMinutes)
    end
    def get_idle_wait(this : ITask*, pwIdleMinutes : UInt16*, pwDeadlineMinutes : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_idle_wait.call(this, pwIdleMinutes, pwDeadlineMinutes)
    end
    def run(this : ITask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this)
    end
    def terminate(this : ITask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this)
    end
    def edit_work_item(this : ITask*, hParent : Win32cr::Foundation::HWND, dwReserved : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.edit_work_item.call(this, hParent, dwReserved)
    end
    def get_most_recent_run_time(this : ITask*, pstLastRun : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_most_recent_run_time.call(this, pstLastRun)
    end
    def get_status(this : ITask*, phrStatus : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, phrStatus)
    end
    def get_exit_code(this : ITask*, pdwExitCode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_exit_code.call(this, pdwExitCode)
    end
    def set_comment(this : ITask*, pwszComment : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_comment.call(this, pwszComment)
    end
    def get_comment(this : ITask*, ppwszComment : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_comment.call(this, ppwszComment)
    end
    def set_creator(this : ITask*, pwszCreator : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_creator.call(this, pwszCreator)
    end
    def get_creator(this : ITask*, ppwszCreator : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_creator.call(this, ppwszCreator)
    end
    def set_work_item_data(this : ITask*, cbData : UInt16, rgbData : UInt8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_work_item_data.call(this, cbData, rgbData)
    end
    def get_work_item_data(this : ITask*, pcbData : UInt16*, prgbData : UInt8**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_work_item_data.call(this, pcbData, prgbData)
    end
    def set_error_retry_count(this : ITask*, wRetryCount : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_retry_count.call(this, wRetryCount)
    end
    def get_error_retry_count(this : ITask*, pwRetryCount : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_retry_count.call(this, pwRetryCount)
    end
    def set_error_retry_interval(this : ITask*, wRetryInterval : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_error_retry_interval.call(this, wRetryInterval)
    end
    def get_error_retry_interval(this : ITask*, pwRetryInterval : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_retry_interval.call(this, pwRetryInterval)
    end
    def set_flags(this : ITask*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_flags.call(this, dwFlags)
    end
    def get_flags(this : ITask*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_flags.call(this, pdwFlags)
    end
    def set_account_information(this : ITask*, pwszAccountName : Win32cr::Foundation::PWSTR, pwszPassword : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_account_information.call(this, pwszAccountName, pwszPassword)
    end
    def get_account_information(this : ITask*, ppwszAccountName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_account_information.call(this, ppwszAccountName)
    end
    def set_application_name(this : ITask*, pwszApplicationName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_application_name.call(this, pwszApplicationName)
    end
    def get_application_name(this : ITask*, ppwszApplicationName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_name.call(this, ppwszApplicationName)
    end
    def set_parameters(this : ITask*, pwszParameters : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_parameters.call(this, pwszParameters)
    end
    def get_parameters(this : ITask*, ppwszParameters : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parameters.call(this, ppwszParameters)
    end
    def set_working_directory(this : ITask*, pwszWorkingDirectory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_working_directory.call(this, pwszWorkingDirectory)
    end
    def get_working_directory(this : ITask*, ppwszWorkingDirectory : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_working_directory.call(this, ppwszWorkingDirectory)
    end
    def set_priority(this : ITask*, dwPriority : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_priority.call(this, dwPriority)
    end
    def get_priority(this : ITask*, pdwPriority : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_priority.call(this, pdwPriority)
    end
    def set_task_flags(this : ITask*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_task_flags.call(this, dwFlags)
    end
    def get_task_flags(this : ITask*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_task_flags.call(this, pdwFlags)
    end
    def set_max_run_time(this : ITask*, dwMaxRunTimeMS : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_run_time.call(this, dwMaxRunTimeMS)
    end
    def get_max_run_time(this : ITask*, pdwMaxRunTimeMS : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_run_time.call(this, pdwMaxRunTimeMS)
    end

  end

  @[Extern]
  record IEnumWorkItemsVtbl,
    query_interface : Proc(IEnumWorkItems*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumWorkItems*, UInt32),
    release : Proc(IEnumWorkItems*, UInt32),
    next__ : Proc(IEnumWorkItems*, UInt32, Win32cr::Foundation::PWSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumWorkItems*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumWorkItems*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumWorkItems*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("148bd528-a2ab-11ce-b11f-00aa00530503")]
  record IEnumWorkItems, lpVtbl : IEnumWorkItemsVtbl* do
    GUID = LibC::GUID.new(0x148bd528_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
    def query_interface(this : IEnumWorkItems*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumWorkItems*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumWorkItems*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumWorkItems*, celt : UInt32, rgpwszNames : Win32cr::Foundation::PWSTR**, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgpwszNames, pceltFetched)
    end
    def skip(this : IEnumWorkItems*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumWorkItems*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumWorkItems*, ppEnumWorkItems : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnumWorkItems)
    end

  end

  @[Extern]
  record ITaskSchedulerVtbl,
    query_interface : Proc(ITaskScheduler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskScheduler*, UInt32),
    release : Proc(ITaskScheduler*, UInt32),
    set_target_computer : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_target_computer : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    enum__ : Proc(ITaskScheduler*, Void**, Win32cr::Foundation::HRESULT),
    activate : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    delete : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    new_work_item : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_work_item : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    is_of_type : Proc(ITaskScheduler*, Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("148bd527-a2ab-11ce-b11f-00aa00530503")]
  record ITaskScheduler, lpVtbl : ITaskSchedulerVtbl* do
    GUID = LibC::GUID.new(0x148bd527_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
    def query_interface(this : ITaskScheduler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskScheduler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskScheduler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_target_computer(this : ITaskScheduler*, pwszComputer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_target_computer.call(this, pwszComputer)
    end
    def get_target_computer(this : ITaskScheduler*, ppwszComputer : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_target_computer.call(this, ppwszComputer)
    end
    def enum__(this : ITaskScheduler*, ppEnumWorkItems : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum__.call(this, ppEnumWorkItems)
    end
    def activate(this : ITaskScheduler*, pwszName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, pwszName, riid, ppUnk)
    end
    def delete(this : ITaskScheduler*, pwszName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this, pwszName)
    end
    def new_work_item(this : ITaskScheduler*, pwszTaskName : Win32cr::Foundation::PWSTR, rclsid : LibC::GUID*, riid : LibC::GUID*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_work_item.call(this, pwszTaskName, rclsid, riid, ppUnk)
    end
    def add_work_item(this : ITaskScheduler*, pwszTaskName : Win32cr::Foundation::PWSTR, pWorkItem : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_work_item.call(this, pwszTaskName, pWorkItem)
    end
    def is_of_type(this : ITaskScheduler*, pwszName : Win32cr::Foundation::PWSTR, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_of_type.call(this, pwszName, riid)
    end

  end

  @[Extern]
  record IProvideTaskPageVtbl,
    query_interface : Proc(IProvideTaskPage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProvideTaskPage*, UInt32),
    release : Proc(IProvideTaskPage*, UInt32),
    get_page : Proc(IProvideTaskPage*, Win32cr::System::TaskScheduler::TASKPAGE, Win32cr::Foundation::BOOL, Win32cr::UI::Controls::HPROPSHEETPAGE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4086658a-cbbb-11cf-b604-00c04fd8d565")]
  record IProvideTaskPage, lpVtbl : IProvideTaskPageVtbl* do
    GUID = LibC::GUID.new(0x4086658a_u32, 0xcbbb_u16, 0x11cf_u16, StaticArray[0xb6_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
    def query_interface(this : IProvideTaskPage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProvideTaskPage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProvideTaskPage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_page(this : IProvideTaskPage*, tpType : Win32cr::System::TaskScheduler::TASKPAGE, fPersistChanges : Win32cr::Foundation::BOOL, phPage : Win32cr::UI::Controls::HPROPSHEETPAGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page.call(this, tpType, fPersistChanges, phPage)
    end

  end

  @[Extern]
  record ITaskFolderCollectionVtbl,
    query_interface : Proc(ITaskFolderCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskFolderCollection*, UInt32),
    release : Proc(ITaskFolderCollection*, UInt32),
    get_type_info_count : Proc(ITaskFolderCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskFolderCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskFolderCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskFolderCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ITaskFolderCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ITaskFolderCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ITaskFolderCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("79184a66-8664-423f-97f1-637356a5d812")]
  record ITaskFolderCollection, lpVtbl : ITaskFolderCollectionVtbl* do
    GUID = LibC::GUID.new(0x79184a66_u32, 0x8664_u16, 0x423f_u16, StaticArray[0x97_u8, 0xf1_u8, 0x63_u8, 0x73_u8, 0x56_u8, 0xa5_u8, 0xd8_u8, 0x12_u8])
    def query_interface(this : ITaskFolderCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskFolderCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskFolderCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskFolderCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskFolderCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskFolderCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskFolderCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ITaskFolderCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def get_Item(this : ITaskFolderCollection*, index : Win32cr::System::Com::VARIANT, ppFolder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppFolder)
    end
    def get__NewEnum(this : ITaskFolderCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end

  end

  @[Extern]
  record ITaskServiceVtbl,
    query_interface : Proc(ITaskService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskService*, UInt32),
    release : Proc(ITaskService*, UInt32),
    get_type_info_count : Proc(ITaskService*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskService*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskService*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskService*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_folder : Proc(ITaskService*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_running_tasks : Proc(ITaskService*, Int32, Void**, Win32cr::Foundation::HRESULT),
    new_task : Proc(ITaskService*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    connect : Proc(ITaskService*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Connected : Proc(ITaskService*, Int16*, Win32cr::Foundation::HRESULT),
    get_TargetServer : Proc(ITaskService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ConnectedUser : Proc(ITaskService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ConnectedDomain : Proc(ITaskService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HighestVersion : Proc(ITaskService*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2faba4c7-4da9-4013-9697-20cc3fd40f85")]
  record ITaskService, lpVtbl : ITaskServiceVtbl* do
    GUID = LibC::GUID.new(0x2faba4c7_u32, 0x4da9_u16, 0x4013_u16, StaticArray[0x96_u8, 0x97_u8, 0x20_u8, 0xcc_u8, 0x3f_u8, 0xd4_u8, 0xf_u8, 0x85_u8])
    def query_interface(this : ITaskService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskService*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskService*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskService*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskService*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_folder(this : ITaskService*, path : Win32cr::Foundation::BSTR, ppFolder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_folder.call(this, path, ppFolder)
    end
    def get_running_tasks(this : ITaskService*, flags : Int32, ppRunningTasks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_running_tasks.call(this, flags, ppRunningTasks)
    end
    def new_task(this : ITaskService*, flags : UInt32, ppDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_task.call(this, flags, ppDefinition)
    end
    def connect(this : ITaskService*, serverName : Win32cr::System::Com::VARIANT, user : Win32cr::System::Com::VARIANT, domain : Win32cr::System::Com::VARIANT, password : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, serverName, user, domain, password)
    end
    def get_Connected(this : ITaskService*, pConnected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Connected.call(this, pConnected)
    end
    def get_TargetServer(this : ITaskService*, pServer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TargetServer.call(this, pServer)
    end
    def get_ConnectedUser(this : ITaskService*, pUser : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectedUser.call(this, pUser)
    end
    def get_ConnectedDomain(this : ITaskService*, pDomain : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectedDomain.call(this, pDomain)
    end
    def get_HighestVersion(this : ITaskService*, pVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HighestVersion.call(this, pVersion)
    end

  end

  @[Extern]
  record ITaskHandlerVtbl,
    query_interface : Proc(ITaskHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskHandler*, UInt32),
    release : Proc(ITaskHandler*, UInt32),
    start : Proc(ITaskHandler*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    stop : Proc(ITaskHandler*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    pause : Proc(ITaskHandler*, Win32cr::Foundation::HRESULT),
    resume : Proc(ITaskHandler*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("839d7762-5121-4009-9234-4f0d19394f04")]
  record ITaskHandler, lpVtbl : ITaskHandlerVtbl* do
    GUID = LibC::GUID.new(0x839d7762_u32, 0x5121_u16, 0x4009_u16, StaticArray[0x92_u8, 0x34_u8, 0x4f_u8, 0xd_u8, 0x19_u8, 0x39_u8, 0x4f_u8, 0x4_u8])
    def query_interface(this : ITaskHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start(this : ITaskHandler*, pHandlerServices : Void*, data : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start.call(this, pHandlerServices, data)
    end
    def stop(this : ITaskHandler*, pRetCode : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this, pRetCode)
    end
    def pause(this : ITaskHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : ITaskHandler*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end

  end

  @[Extern]
  record ITaskHandlerStatusVtbl,
    query_interface : Proc(ITaskHandlerStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskHandlerStatus*, UInt32),
    release : Proc(ITaskHandlerStatus*, UInt32),
    update_status : Proc(ITaskHandlerStatus*, Int16, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    task_completed : Proc(ITaskHandlerStatus*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eaec7a8f-27a0-4ddc-8675-14726a01a38a")]
  record ITaskHandlerStatus, lpVtbl : ITaskHandlerStatusVtbl* do
    GUID = LibC::GUID.new(0xeaec7a8f_u32, 0x27a0_u16, 0x4ddc_u16, StaticArray[0x86_u8, 0x75_u8, 0x14_u8, 0x72_u8, 0x6a_u8, 0x1_u8, 0xa3_u8, 0x8a_u8])
    def query_interface(this : ITaskHandlerStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskHandlerStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskHandlerStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def update_status(this : ITaskHandlerStatus*, percentComplete : Int16, statusMessage : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_status.call(this, percentComplete, statusMessage)
    end
    def task_completed(this : ITaskHandlerStatus*, taskErrCode : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.task_completed.call(this, taskErrCode)
    end

  end

  @[Extern]
  record ITaskVariablesVtbl,
    query_interface : Proc(ITaskVariables*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskVariables*, UInt32),
    release : Proc(ITaskVariables*, UInt32),
    get_input : Proc(ITaskVariables*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_output : Proc(ITaskVariables*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITaskVariables*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3e4c9351-d966-4b8b-bb87-ceba68bb0107")]
  record ITaskVariables, lpVtbl : ITaskVariablesVtbl* do
    GUID = LibC::GUID.new(0x3e4c9351_u32, 0xd966_u16, 0x4b8b_u16, StaticArray[0xbb_u8, 0x87_u8, 0xce_u8, 0xba_u8, 0x68_u8, 0xbb_u8, 0x1_u8, 0x7_u8])
    def query_interface(this : ITaskVariables*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskVariables*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskVariables*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input(this : ITaskVariables*, pInput : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input.call(this, pInput)
    end
    def set_output(this : ITaskVariables*, input : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output.call(this, input)
    end
    def get_context(this : ITaskVariables*, pContext : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, pContext)
    end

  end

  @[Extern]
  record ITaskNamedValuePairVtbl,
    query_interface : Proc(ITaskNamedValuePair*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskNamedValuePair*, UInt32),
    release : Proc(ITaskNamedValuePair*, UInt32),
    get_type_info_count : Proc(ITaskNamedValuePair*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskNamedValuePair*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskNamedValuePair*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskNamedValuePair*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ITaskNamedValuePair*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(ITaskNamedValuePair*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ITaskNamedValuePair*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(ITaskNamedValuePair*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("39038068-2b46-4afd-8662-7bb6f868d221")]
  record ITaskNamedValuePair, lpVtbl : ITaskNamedValuePairVtbl* do
    GUID = LibC::GUID.new(0x39038068_u32, 0x2b46_u16, 0x4afd_u16, StaticArray[0x86_u8, 0x62_u8, 0x7b_u8, 0xb6_u8, 0xf8_u8, 0x68_u8, 0xd2_u8, 0x21_u8])
    def query_interface(this : ITaskNamedValuePair*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskNamedValuePair*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskNamedValuePair*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskNamedValuePair*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskNamedValuePair*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskNamedValuePair*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskNamedValuePair*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ITaskNamedValuePair*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pName)
    end
    def put_Name(this : ITaskNamedValuePair*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Value(this : ITaskNamedValuePair*, pValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pValue)
    end
    def put_Value(this : ITaskNamedValuePair*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, value)
    end

  end

  @[Extern]
  record ITaskNamedValueCollectionVtbl,
    query_interface : Proc(ITaskNamedValueCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskNamedValueCollection*, UInt32),
    release : Proc(ITaskNamedValueCollection*, UInt32),
    get_type_info_count : Proc(ITaskNamedValueCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskNamedValueCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskNamedValueCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskNamedValueCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ITaskNamedValueCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ITaskNamedValueCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ITaskNamedValueCollection*, Void**, Win32cr::Foundation::HRESULT),
    create : Proc(ITaskNamedValueCollection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(ITaskNamedValueCollection*, Int32, Win32cr::Foundation::HRESULT),
    clear : Proc(ITaskNamedValueCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b4ef826b-63c3-46e4-a504-ef69e4f7ea4d")]
  record ITaskNamedValueCollection, lpVtbl : ITaskNamedValueCollectionVtbl* do
    GUID = LibC::GUID.new(0xb4ef826b_u32, 0x63c3_u16, 0x46e4_u16, StaticArray[0xa5_u8, 0x4_u8, 0xef_u8, 0x69_u8, 0xe4_u8, 0xf7_u8, 0xea_u8, 0x4d_u8])
    def query_interface(this : ITaskNamedValueCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskNamedValueCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskNamedValueCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskNamedValueCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskNamedValueCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskNamedValueCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskNamedValueCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ITaskNamedValueCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def get_Item(this : ITaskNamedValueCollection*, index : Int32, ppPair : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppPair)
    end
    def get__NewEnum(this : ITaskNamedValueCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end
    def create(this : ITaskNamedValueCollection*, name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR, ppPair : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, name, value, ppPair)
    end
    def remove(this : ITaskNamedValueCollection*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end
    def clear(this : ITaskNamedValueCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IRunningTaskVtbl,
    query_interface : Proc(IRunningTask*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRunningTask*, UInt32),
    release : Proc(IRunningTask*, UInt32),
    get_type_info_count : Proc(IRunningTask*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRunningTask*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRunningTask*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRunningTask*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRunningTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_InstanceGuid : Proc(IRunningTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IRunningTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRunningTask*, Win32cr::System::TaskScheduler::TASK_STATE*, Win32cr::Foundation::HRESULT),
    get_CurrentAction : Proc(IRunningTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    stop : Proc(IRunningTask*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IRunningTask*, Win32cr::Foundation::HRESULT),
    get_EnginePID : Proc(IRunningTask*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("653758fb-7b9a-4f1e-a471-beeb8e9b834e")]
  record IRunningTask, lpVtbl : IRunningTaskVtbl* do
    GUID = LibC::GUID.new(0x653758fb_u32, 0x7b9a_u16, 0x4f1e_u16, StaticArray[0xa4_u8, 0x71_u8, 0xbe_u8, 0xeb_u8, 0x8e_u8, 0x9b_u8, 0x83_u8, 0x4e_u8])
    def query_interface(this : IRunningTask*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRunningTask*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRunningTask*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRunningTask*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRunningTask*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRunningTask*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRunningTask*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IRunningTask*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pName)
    end
    def get_InstanceGuid(this : IRunningTask*, pGuid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstanceGuid.call(this, pGuid)
    end
    def get_Path(this : IRunningTask*, pPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pPath)
    end
    def get_State(this : IRunningTask*, pState : Win32cr::System::TaskScheduler::TASK_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pState)
    end
    def get_CurrentAction(this : IRunningTask*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAction.call(this, pName)
    end
    def stop(this : IRunningTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this)
    end
    def refresh(this : IRunningTask*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_EnginePID(this : IRunningTask*, pPID : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnginePID.call(this, pPID)
    end

  end

  @[Extern]
  record IRunningTaskCollectionVtbl,
    query_interface : Proc(IRunningTaskCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRunningTaskCollection*, UInt32),
    release : Proc(IRunningTaskCollection*, UInt32),
    get_type_info_count : Proc(IRunningTaskCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRunningTaskCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRunningTaskCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRunningTaskCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IRunningTaskCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRunningTaskCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRunningTaskCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6a67614b-6828-4fec-aa54-6d52e8f1f2db")]
  record IRunningTaskCollection, lpVtbl : IRunningTaskCollectionVtbl* do
    GUID = LibC::GUID.new(0x6a67614b_u32, 0x6828_u16, 0x4fec_u16, StaticArray[0xaa_u8, 0x54_u8, 0x6d_u8, 0x52_u8, 0xe8_u8, 0xf1_u8, 0xf2_u8, 0xdb_u8])
    def query_interface(this : IRunningTaskCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRunningTaskCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRunningTaskCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRunningTaskCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRunningTaskCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRunningTaskCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRunningTaskCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IRunningTaskCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def get_Item(this : IRunningTaskCollection*, index : Win32cr::System::Com::VARIANT, ppRunningTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppRunningTask)
    end
    def get__NewEnum(this : IRunningTaskCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end

  end

  @[Extern]
  record IRegisteredTaskVtbl,
    query_interface : Proc(IRegisteredTask*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRegisteredTask*, UInt32),
    release : Proc(IRegisteredTask*, UInt32),
    get_type_info_count : Proc(IRegisteredTask*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRegisteredTask*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRegisteredTask*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRegisteredTask*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IRegisteredTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IRegisteredTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IRegisteredTask*, Win32cr::System::TaskScheduler::TASK_STATE*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IRegisteredTask*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IRegisteredTask*, Int16, Win32cr::Foundation::HRESULT),
    run : Proc(IRegisteredTask*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    run_ex : Proc(IRegisteredTask*, Win32cr::System::Com::VARIANT, Int32, Int32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_instances : Proc(IRegisteredTask*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_LastRunTime : Proc(IRegisteredTask*, Float64*, Win32cr::Foundation::HRESULT),
    get_LastTaskResult : Proc(IRegisteredTask*, Int32*, Win32cr::Foundation::HRESULT),
    get_NumberOfMissedRuns : Proc(IRegisteredTask*, Int32*, Win32cr::Foundation::HRESULT),
    get_NextRunTime : Proc(IRegisteredTask*, Float64*, Win32cr::Foundation::HRESULT),
    get_Definition : Proc(IRegisteredTask*, Void**, Win32cr::Foundation::HRESULT),
    get_Xml : Proc(IRegisteredTask*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_security_descriptor : Proc(IRegisteredTask*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_security_descriptor : Proc(IRegisteredTask*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    stop : Proc(IRegisteredTask*, Int32, Win32cr::Foundation::HRESULT),
    get_run_times : Proc(IRegisteredTask*, Win32cr::Foundation::SYSTEMTIME*, Win32cr::Foundation::SYSTEMTIME*, UInt32*, Win32cr::Foundation::SYSTEMTIME**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9c86f320-dee3-4dd1-b972-a303f26b061e")]
  record IRegisteredTask, lpVtbl : IRegisteredTaskVtbl* do
    GUID = LibC::GUID.new(0x9c86f320_u32, 0xdee3_u16, 0x4dd1_u16, StaticArray[0xb9_u8, 0x72_u8, 0xa3_u8, 0x3_u8, 0xf2_u8, 0x6b_u8, 0x6_u8, 0x1e_u8])
    def query_interface(this : IRegisteredTask*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRegisteredTask*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRegisteredTask*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRegisteredTask*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRegisteredTask*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRegisteredTask*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRegisteredTask*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IRegisteredTask*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pName)
    end
    def get_Path(this : IRegisteredTask*, pPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pPath)
    end
    def get_State(this : IRegisteredTask*, pState : Win32cr::System::TaskScheduler::TASK_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pState)
    end
    def get_Enabled(this : IRegisteredTask*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IRegisteredTask*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def run(this : IRegisteredTask*, params : Win32cr::System::Com::VARIANT, ppRunningTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this, params, ppRunningTask)
    end
    def run_ex(this : IRegisteredTask*, params : Win32cr::System::Com::VARIANT, flags : Int32, sessionID : Int32, user : Win32cr::Foundation::BSTR, ppRunningTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_ex.call(this, params, flags, sessionID, user, ppRunningTask)
    end
    def get_instances(this : IRegisteredTask*, flags : Int32, ppRunningTasks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instances.call(this, flags, ppRunningTasks)
    end
    def get_LastRunTime(this : IRegisteredTask*, pLastRunTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastRunTime.call(this, pLastRunTime)
    end
    def get_LastTaskResult(this : IRegisteredTask*, pLastTaskResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastTaskResult.call(this, pLastTaskResult)
    end
    def get_NumberOfMissedRuns(this : IRegisteredTask*, pNumberOfMissedRuns : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NumberOfMissedRuns.call(this, pNumberOfMissedRuns)
    end
    def get_NextRunTime(this : IRegisteredTask*, pNextRunTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NextRunTime.call(this, pNextRunTime)
    end
    def get_Definition(this : IRegisteredTask*, ppDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Definition.call(this, ppDefinition)
    end
    def get_Xml(this : IRegisteredTask*, pXml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Xml.call(this, pXml)
    end
    def get_security_descriptor(this : IRegisteredTask*, securityInformation : Int32, pSddl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_descriptor.call(this, securityInformation, pSddl)
    end
    def set_security_descriptor(this : IRegisteredTask*, sddl : Win32cr::Foundation::BSTR, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_descriptor.call(this, sddl, flags)
    end
    def stop(this : IRegisteredTask*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop.call(this, flags)
    end
    def get_run_times(this : IRegisteredTask*, pstStart : Win32cr::Foundation::SYSTEMTIME*, pstEnd : Win32cr::Foundation::SYSTEMTIME*, pCount : UInt32*, pRunTimes : Win32cr::Foundation::SYSTEMTIME**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_run_times.call(this, pstStart, pstEnd, pCount, pRunTimes)
    end

  end

  @[Extern]
  record ITriggerVtbl,
    query_interface : Proc(ITrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITrigger*, UInt32),
    release : Proc(ITrigger*, UInt32),
    get_type_info_count : Proc(ITrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ITrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ITrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(ITrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(ITrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(ITrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(ITrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(ITrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(ITrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(ITrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(ITrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(ITrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(ITrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(ITrigger*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("09941815-ea89-4b5b-89e0-2a773801fac3")]
  record ITrigger, lpVtbl : ITriggerVtbl* do
    GUID = LibC::GUID.new(0x9941815_u32, 0xea89_u16, 0x4b5b_u16, StaticArray[0x89_u8, 0xe0_u8, 0x2a_u8, 0x77_u8, 0x38_u8, 0x1_u8, 0xfa_u8, 0xc3_u8])
    def query_interface(this : ITrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ITrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : ITrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : ITrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : ITrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : ITrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : ITrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : ITrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : ITrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : ITrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : ITrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : ITrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : ITrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : ITrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end

  end

  @[Extern]
  record IIdleTriggerVtbl,
    query_interface : Proc(IIdleTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdleTrigger*, UInt32),
    release : Proc(IIdleTrigger*, UInt32),
    get_type_info_count : Proc(IIdleTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IIdleTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IIdleTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IIdleTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IIdleTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IIdleTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IIdleTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IIdleTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IIdleTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IIdleTrigger*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d537d2b0-9fb3-4d34-9739-1ff5ce7b1ef3")]
  record IIdleTrigger, lpVtbl : IIdleTriggerVtbl* do
    GUID = LibC::GUID.new(0xd537d2b0_u32, 0x9fb3_u16, 0x4d34_u16, StaticArray[0x97_u8, 0x39_u8, 0x1f_u8, 0xf5_u8, 0xce_u8, 0x7b_u8, 0x1e_u8, 0xf3_u8])
    def query_interface(this : IIdleTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdleTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdleTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IIdleTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IIdleTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IIdleTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IIdleTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IIdleTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IIdleTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IIdleTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IIdleTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IIdleTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IIdleTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IIdleTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IIdleTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IIdleTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IIdleTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IIdleTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IIdleTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IIdleTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end

  end

  @[Extern]
  record ILogonTriggerVtbl,
    query_interface : Proc(ILogonTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILogonTrigger*, UInt32),
    release : Proc(ILogonTrigger*, UInt32),
    get_type_info_count : Proc(ILogonTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ILogonTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ILogonTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ILogonTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ILogonTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(ILogonTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(ILogonTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(ILogonTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(ILogonTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_Delay : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Delay : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_UserId : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_UserId : Proc(ILogonTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("72dade38-fae4-4b3e-baf4-5d009af02b1c")]
  record ILogonTrigger, lpVtbl : ILogonTriggerVtbl* do
    GUID = LibC::GUID.new(0x72dade38_u32, 0xfae4_u16, 0x4b3e_u16, StaticArray[0xba_u8, 0xf4_u8, 0x5d_u8, 0x0_u8, 0x9a_u8, 0xf0_u8, 0x2b_u8, 0x1c_u8])
    def query_interface(this : ILogonTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILogonTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILogonTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ILogonTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ILogonTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ILogonTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ILogonTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ILogonTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : ILogonTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : ILogonTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : ILogonTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : ILogonTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : ILogonTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : ILogonTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : ILogonTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : ILogonTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : ILogonTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : ILogonTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : ILogonTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : ILogonTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Delay(this : ILogonTrigger*, pDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delay.call(this, pDelay)
    end
    def put_Delay(this : ILogonTrigger*, delay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delay.call(this, delay)
    end
    def get_UserId(this : ILogonTrigger*, pUser : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserId.call(this, pUser)
    end
    def put_UserId(this : ILogonTrigger*, user : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserId.call(this, user)
    end

  end

  @[Extern]
  record ISessionStateChangeTriggerVtbl,
    query_interface : Proc(ISessionStateChangeTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISessionStateChangeTrigger*, UInt32),
    release : Proc(ISessionStateChangeTrigger*, UInt32),
    get_type_info_count : Proc(ISessionStateChangeTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISessionStateChangeTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISessionStateChangeTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISessionStateChangeTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ISessionStateChangeTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(ISessionStateChangeTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(ISessionStateChangeTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(ISessionStateChangeTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(ISessionStateChangeTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_Delay : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Delay : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_UserId : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_UserId : Proc(ISessionStateChangeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StateChange : Proc(ISessionStateChangeTrigger*, Win32cr::System::TaskScheduler::TASK_SESSION_STATE_CHANGE_TYPE*, Win32cr::Foundation::HRESULT),
    put_StateChange : Proc(ISessionStateChangeTrigger*, Win32cr::System::TaskScheduler::TASK_SESSION_STATE_CHANGE_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("754da71b-4385-4475-9dd9-598294fa3641")]
  record ISessionStateChangeTrigger, lpVtbl : ISessionStateChangeTriggerVtbl* do
    GUID = LibC::GUID.new(0x754da71b_u32, 0x4385_u16, 0x4475_u16, StaticArray[0x9d_u8, 0xd9_u8, 0x59_u8, 0x82_u8, 0x94_u8, 0xfa_u8, 0x36_u8, 0x41_u8])
    def query_interface(this : ISessionStateChangeTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISessionStateChangeTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISessionStateChangeTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISessionStateChangeTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISessionStateChangeTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISessionStateChangeTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISessionStateChangeTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ISessionStateChangeTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : ISessionStateChangeTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : ISessionStateChangeTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : ISessionStateChangeTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : ISessionStateChangeTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : ISessionStateChangeTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : ISessionStateChangeTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : ISessionStateChangeTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : ISessionStateChangeTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : ISessionStateChangeTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : ISessionStateChangeTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : ISessionStateChangeTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : ISessionStateChangeTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Delay(this : ISessionStateChangeTrigger*, pDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delay.call(this, pDelay)
    end
    def put_Delay(this : ISessionStateChangeTrigger*, delay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delay.call(this, delay)
    end
    def get_UserId(this : ISessionStateChangeTrigger*, pUser : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserId.call(this, pUser)
    end
    def put_UserId(this : ISessionStateChangeTrigger*, user : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserId.call(this, user)
    end
    def get_StateChange(this : ISessionStateChangeTrigger*, pType : Win32cr::System::TaskScheduler::TASK_SESSION_STATE_CHANGE_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StateChange.call(this, pType)
    end
    def put_StateChange(this : ISessionStateChangeTrigger*, type__ : Win32cr::System::TaskScheduler::TASK_SESSION_STATE_CHANGE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StateChange.call(this, type__)
    end

  end

  @[Extern]
  record IEventTriggerVtbl,
    query_interface : Proc(IEventTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventTrigger*, UInt32),
    release : Proc(IEventTrigger*, UInt32),
    get_type_info_count : Proc(IEventTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IEventTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IEventTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IEventTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IEventTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IEventTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IEventTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IEventTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IEventTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IEventTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IEventTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IEventTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IEventTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IEventTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_Subscription : Proc(IEventTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Subscription : Proc(IEventTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Delay : Proc(IEventTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Delay : Proc(IEventTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ValueQueries : Proc(IEventTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_ValueQueries : Proc(IEventTrigger*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d45b0167-9653-4eef-b94f-0732ca7af251")]
  record IEventTrigger, lpVtbl : IEventTriggerVtbl* do
    GUID = LibC::GUID.new(0xd45b0167_u32, 0x9653_u16, 0x4eef_u16, StaticArray[0xb9_u8, 0x4f_u8, 0x7_u8, 0x32_u8, 0xca_u8, 0x7a_u8, 0xf2_u8, 0x51_u8])
    def query_interface(this : IEventTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IEventTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IEventTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IEventTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IEventTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IEventTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IEventTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IEventTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IEventTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IEventTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IEventTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IEventTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IEventTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IEventTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Subscription(this : IEventTrigger*, pQuery : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subscription.call(this, pQuery)
    end
    def put_Subscription(this : IEventTrigger*, query : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Subscription.call(this, query)
    end
    def get_Delay(this : IEventTrigger*, pDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delay.call(this, pDelay)
    end
    def put_Delay(this : IEventTrigger*, delay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delay.call(this, delay)
    end
    def get_ValueQueries(this : IEventTrigger*, ppNamedXPaths : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueQueries.call(this, ppNamedXPaths)
    end
    def put_ValueQueries(this : IEventTrigger*, pNamedXPaths : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ValueQueries.call(this, pNamedXPaths)
    end

  end

  @[Extern]
  record ITimeTriggerVtbl,
    query_interface : Proc(ITimeTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITimeTrigger*, UInt32),
    release : Proc(ITimeTrigger*, UInt32),
    get_type_info_count : Proc(ITimeTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITimeTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITimeTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITimeTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ITimeTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(ITimeTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(ITimeTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(ITimeTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(ITimeTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RandomDelay : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RandomDelay : Proc(ITimeTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b45747e0-eba7-4276-9f29-85c5bb300006")]
  record ITimeTrigger, lpVtbl : ITimeTriggerVtbl* do
    GUID = LibC::GUID.new(0xb45747e0_u32, 0xeba7_u16, 0x4276_u16, StaticArray[0x9f_u8, 0x29_u8, 0x85_u8, 0xc5_u8, 0xbb_u8, 0x30_u8, 0x0_u8, 0x6_u8])
    def query_interface(this : ITimeTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITimeTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITimeTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITimeTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITimeTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITimeTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITimeTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : ITimeTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : ITimeTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : ITimeTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : ITimeTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : ITimeTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : ITimeTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : ITimeTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : ITimeTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : ITimeTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : ITimeTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : ITimeTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : ITimeTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : ITimeTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_RandomDelay(this : ITimeTrigger*, pRandomDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RandomDelay.call(this, pRandomDelay)
    end
    def put_RandomDelay(this : ITimeTrigger*, randomDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RandomDelay.call(this, randomDelay)
    end

  end

  @[Extern]
  record IDailyTriggerVtbl,
    query_interface : Proc(IDailyTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDailyTrigger*, UInt32),
    release : Proc(IDailyTrigger*, UInt32),
    get_type_info_count : Proc(IDailyTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDailyTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDailyTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDailyTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IDailyTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IDailyTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IDailyTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IDailyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IDailyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_DaysInterval : Proc(IDailyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_DaysInterval : Proc(IDailyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RandomDelay : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RandomDelay : Proc(IDailyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("126c5cd8-b288-41d5-8dbf-e491446adc5c")]
  record IDailyTrigger, lpVtbl : IDailyTriggerVtbl* do
    GUID = LibC::GUID.new(0x126c5cd8_u32, 0xb288_u16, 0x41d5_u16, StaticArray[0x8d_u8, 0xbf_u8, 0xe4_u8, 0x91_u8, 0x44_u8, 0x6a_u8, 0xdc_u8, 0x5c_u8])
    def query_interface(this : IDailyTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDailyTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDailyTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDailyTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDailyTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDailyTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDailyTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IDailyTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IDailyTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IDailyTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IDailyTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IDailyTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IDailyTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IDailyTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IDailyTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IDailyTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IDailyTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IDailyTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IDailyTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IDailyTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_DaysInterval(this : IDailyTrigger*, pDays : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysInterval.call(this, pDays)
    end
    def put_DaysInterval(this : IDailyTrigger*, days : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysInterval.call(this, days)
    end
    def get_RandomDelay(this : IDailyTrigger*, pRandomDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RandomDelay.call(this, pRandomDelay)
    end
    def put_RandomDelay(this : IDailyTrigger*, randomDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RandomDelay.call(this, randomDelay)
    end

  end

  @[Extern]
  record IWeeklyTriggerVtbl,
    query_interface : Proc(IWeeklyTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWeeklyTrigger*, UInt32),
    release : Proc(IWeeklyTrigger*, UInt32),
    get_type_info_count : Proc(IWeeklyTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWeeklyTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWeeklyTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWeeklyTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWeeklyTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IWeeklyTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IWeeklyTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IWeeklyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IWeeklyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_DaysOfWeek : Proc(IWeeklyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_DaysOfWeek : Proc(IWeeklyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_WeeksInterval : Proc(IWeeklyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_WeeksInterval : Proc(IWeeklyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RandomDelay : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RandomDelay : Proc(IWeeklyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5038fc98-82ff-436d-8728-a512a57c9dc1")]
  record IWeeklyTrigger, lpVtbl : IWeeklyTriggerVtbl* do
    GUID = LibC::GUID.new(0x5038fc98_u32, 0x82ff_u16, 0x436d_u16, StaticArray[0x87_u8, 0x28_u8, 0xa5_u8, 0x12_u8, 0xa5_u8, 0x7c_u8, 0x9d_u8, 0xc1_u8])
    def query_interface(this : IWeeklyTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWeeklyTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWeeklyTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWeeklyTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWeeklyTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWeeklyTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWeeklyTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IWeeklyTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IWeeklyTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IWeeklyTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IWeeklyTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IWeeklyTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IWeeklyTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IWeeklyTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IWeeklyTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IWeeklyTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IWeeklyTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IWeeklyTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IWeeklyTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IWeeklyTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_DaysOfWeek(this : IWeeklyTrigger*, pDays : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysOfWeek.call(this, pDays)
    end
    def put_DaysOfWeek(this : IWeeklyTrigger*, days : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysOfWeek.call(this, days)
    end
    def get_WeeksInterval(this : IWeeklyTrigger*, pWeeks : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WeeksInterval.call(this, pWeeks)
    end
    def put_WeeksInterval(this : IWeeklyTrigger*, weeks : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WeeksInterval.call(this, weeks)
    end
    def get_RandomDelay(this : IWeeklyTrigger*, pRandomDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RandomDelay.call(this, pRandomDelay)
    end
    def put_RandomDelay(this : IWeeklyTrigger*, randomDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RandomDelay.call(this, randomDelay)
    end

  end

  @[Extern]
  record IMonthlyTriggerVtbl,
    query_interface : Proc(IMonthlyTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMonthlyTrigger*, UInt32),
    release : Proc(IMonthlyTrigger*, UInt32),
    get_type_info_count : Proc(IMonthlyTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMonthlyTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMonthlyTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMonthlyTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IMonthlyTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IMonthlyTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IMonthlyTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IMonthlyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IMonthlyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_DaysOfMonth : Proc(IMonthlyTrigger*, Int32*, Win32cr::Foundation::HRESULT),
    put_DaysOfMonth : Proc(IMonthlyTrigger*, Int32, Win32cr::Foundation::HRESULT),
    get_MonthsOfYear : Proc(IMonthlyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_MonthsOfYear : Proc(IMonthlyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RunOnLastDayOfMonth : Proc(IMonthlyTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_RunOnLastDayOfMonth : Proc(IMonthlyTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RandomDelay : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RandomDelay : Proc(IMonthlyTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("97c45ef1-6b02-4a1a-9c0e-1ebfba1500ac")]
  record IMonthlyTrigger, lpVtbl : IMonthlyTriggerVtbl* do
    GUID = LibC::GUID.new(0x97c45ef1_u32, 0x6b02_u16, 0x4a1a_u16, StaticArray[0x9c_u8, 0xe_u8, 0x1e_u8, 0xbf_u8, 0xba_u8, 0x15_u8, 0x0_u8, 0xac_u8])
    def query_interface(this : IMonthlyTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMonthlyTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMonthlyTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMonthlyTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMonthlyTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMonthlyTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMonthlyTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IMonthlyTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IMonthlyTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IMonthlyTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IMonthlyTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IMonthlyTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IMonthlyTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IMonthlyTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IMonthlyTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IMonthlyTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IMonthlyTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IMonthlyTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IMonthlyTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IMonthlyTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_DaysOfMonth(this : IMonthlyTrigger*, pDays : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysOfMonth.call(this, pDays)
    end
    def put_DaysOfMonth(this : IMonthlyTrigger*, days : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysOfMonth.call(this, days)
    end
    def get_MonthsOfYear(this : IMonthlyTrigger*, pMonths : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MonthsOfYear.call(this, pMonths)
    end
    def put_MonthsOfYear(this : IMonthlyTrigger*, months : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MonthsOfYear.call(this, months)
    end
    def get_RunOnLastDayOfMonth(this : IMonthlyTrigger*, pLastDay : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunOnLastDayOfMonth.call(this, pLastDay)
    end
    def put_RunOnLastDayOfMonth(this : IMonthlyTrigger*, lastDay : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunOnLastDayOfMonth.call(this, lastDay)
    end
    def get_RandomDelay(this : IMonthlyTrigger*, pRandomDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RandomDelay.call(this, pRandomDelay)
    end
    def put_RandomDelay(this : IMonthlyTrigger*, randomDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RandomDelay.call(this, randomDelay)
    end

  end

  @[Extern]
  record IMonthlyDOWTriggerVtbl,
    query_interface : Proc(IMonthlyDOWTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMonthlyDOWTrigger*, UInt32),
    release : Proc(IMonthlyDOWTrigger*, UInt32),
    get_type_info_count : Proc(IMonthlyDOWTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMonthlyDOWTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMonthlyDOWTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMonthlyDOWTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IMonthlyDOWTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IMonthlyDOWTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IMonthlyDOWTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IMonthlyDOWTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IMonthlyDOWTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_DaysOfWeek : Proc(IMonthlyDOWTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_DaysOfWeek : Proc(IMonthlyDOWTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_WeeksOfMonth : Proc(IMonthlyDOWTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_WeeksOfMonth : Proc(IMonthlyDOWTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_MonthsOfYear : Proc(IMonthlyDOWTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_MonthsOfYear : Proc(IMonthlyDOWTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RunOnLastWeekOfMonth : Proc(IMonthlyDOWTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_RunOnLastWeekOfMonth : Proc(IMonthlyDOWTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_RandomDelay : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RandomDelay : Proc(IMonthlyDOWTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("77d025a3-90fa-43aa-b52e-cda5499b946a")]
  record IMonthlyDOWTrigger, lpVtbl : IMonthlyDOWTriggerVtbl* do
    GUID = LibC::GUID.new(0x77d025a3_u32, 0x90fa_u16, 0x43aa_u16, StaticArray[0xb5_u8, 0x2e_u8, 0xcd_u8, 0xa5_u8, 0x49_u8, 0x9b_u8, 0x94_u8, 0x6a_u8])
    def query_interface(this : IMonthlyDOWTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMonthlyDOWTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMonthlyDOWTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMonthlyDOWTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMonthlyDOWTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMonthlyDOWTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMonthlyDOWTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IMonthlyDOWTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IMonthlyDOWTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IMonthlyDOWTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IMonthlyDOWTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IMonthlyDOWTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IMonthlyDOWTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IMonthlyDOWTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IMonthlyDOWTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IMonthlyDOWTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IMonthlyDOWTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IMonthlyDOWTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IMonthlyDOWTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IMonthlyDOWTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_DaysOfWeek(this : IMonthlyDOWTrigger*, pDays : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysOfWeek.call(this, pDays)
    end
    def put_DaysOfWeek(this : IMonthlyDOWTrigger*, days : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysOfWeek.call(this, days)
    end
    def get_WeeksOfMonth(this : IMonthlyDOWTrigger*, pWeeks : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WeeksOfMonth.call(this, pWeeks)
    end
    def put_WeeksOfMonth(this : IMonthlyDOWTrigger*, weeks : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WeeksOfMonth.call(this, weeks)
    end
    def get_MonthsOfYear(this : IMonthlyDOWTrigger*, pMonths : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MonthsOfYear.call(this, pMonths)
    end
    def put_MonthsOfYear(this : IMonthlyDOWTrigger*, months : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MonthsOfYear.call(this, months)
    end
    def get_RunOnLastWeekOfMonth(this : IMonthlyDOWTrigger*, pLastWeek : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunOnLastWeekOfMonth.call(this, pLastWeek)
    end
    def put_RunOnLastWeekOfMonth(this : IMonthlyDOWTrigger*, lastWeek : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunOnLastWeekOfMonth.call(this, lastWeek)
    end
    def get_RandomDelay(this : IMonthlyDOWTrigger*, pRandomDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RandomDelay.call(this, pRandomDelay)
    end
    def put_RandomDelay(this : IMonthlyDOWTrigger*, randomDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RandomDelay.call(this, randomDelay)
    end

  end

  @[Extern]
  record IBootTriggerVtbl,
    query_interface : Proc(IBootTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBootTrigger*, UInt32),
    release : Proc(IBootTrigger*, UInt32),
    get_type_info_count : Proc(IBootTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IBootTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IBootTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IBootTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IBootTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IBootTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IBootTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IBootTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IBootTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IBootTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IBootTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IBootTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IBootTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IBootTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IBootTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IBootTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IBootTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_Delay : Proc(IBootTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Delay : Proc(IBootTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2a9c35da-d357-41f4-bbc1-207ac1b1f3cb")]
  record IBootTrigger, lpVtbl : IBootTriggerVtbl* do
    GUID = LibC::GUID.new(0x2a9c35da_u32, 0xd357_u16, 0x41f4_u16, StaticArray[0xbb_u8, 0xc1_u8, 0x20_u8, 0x7a_u8, 0xc1_u8, 0xb1_u8, 0xf3_u8, 0xcb_u8])
    def query_interface(this : IBootTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBootTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBootTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IBootTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IBootTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IBootTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IBootTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IBootTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IBootTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IBootTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IBootTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IBootTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IBootTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IBootTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IBootTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IBootTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IBootTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IBootTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IBootTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IBootTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Delay(this : IBootTrigger*, pDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delay.call(this, pDelay)
    end
    def put_Delay(this : IBootTrigger*, delay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delay.call(this, delay)
    end

  end

  @[Extern]
  record IRegistrationTriggerVtbl,
    query_interface : Proc(IRegistrationTrigger*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRegistrationTrigger*, UInt32),
    release : Proc(IRegistrationTrigger*, UInt32),
    get_type_info_count : Proc(IRegistrationTrigger*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRegistrationTrigger*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRegistrationTrigger*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRegistrationTrigger*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IRegistrationTrigger*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Repetition : Proc(IRegistrationTrigger*, Void**, Win32cr::Foundation::HRESULT),
    put_Repetition : Proc(IRegistrationTrigger*, Void*, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StartBoundary : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StartBoundary : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EndBoundary : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EndBoundary : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IRegistrationTrigger*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IRegistrationTrigger*, Int16, Win32cr::Foundation::HRESULT),
    get_Delay : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Delay : Proc(IRegistrationTrigger*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c8fec3a-c218-4e0c-b23d-629024db91a2")]
  record IRegistrationTrigger, lpVtbl : IRegistrationTriggerVtbl* do
    GUID = LibC::GUID.new(0x4c8fec3a_u32, 0xc218_u16, 0x4e0c_u16, StaticArray[0xb2_u8, 0x3d_u8, 0x62_u8, 0x90_u8, 0x24_u8, 0xdb_u8, 0x91_u8, 0xa2_u8])
    def query_interface(this : IRegistrationTrigger*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRegistrationTrigger*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRegistrationTrigger*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRegistrationTrigger*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRegistrationTrigger*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRegistrationTrigger*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRegistrationTrigger*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IRegistrationTrigger*, pType : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Id(this : IRegistrationTrigger*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IRegistrationTrigger*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Repetition(this : IRegistrationTrigger*, ppRepeat : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Repetition.call(this, ppRepeat)
    end
    def put_Repetition(this : IRegistrationTrigger*, pRepeat : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Repetition.call(this, pRepeat)
    end
    def get_ExecutionTimeLimit(this : IRegistrationTrigger*, pTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pTimeLimit)
    end
    def put_ExecutionTimeLimit(this : IRegistrationTrigger*, timelimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, timelimit)
    end
    def get_StartBoundary(this : IRegistrationTrigger*, pStart : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartBoundary.call(this, pStart)
    end
    def put_StartBoundary(this : IRegistrationTrigger*, start : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartBoundary.call(this, start)
    end
    def get_EndBoundary(this : IRegistrationTrigger*, pEnd : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EndBoundary.call(this, pEnd)
    end
    def put_EndBoundary(this : IRegistrationTrigger*, end__ : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EndBoundary.call(this, end__)
    end
    def get_Enabled(this : IRegistrationTrigger*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : IRegistrationTrigger*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_Delay(this : IRegistrationTrigger*, pDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Delay.call(this, pDelay)
    end
    def put_Delay(this : IRegistrationTrigger*, delay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Delay.call(this, delay)
    end

  end

  @[Extern]
  record IActionVtbl,
    query_interface : Proc(IAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAction*, UInt32),
    release : Proc(IAction*, UInt32),
    get_type_info_count : Proc(IAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IAction*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bae54997-48b1-4cbe-9965-d6be263ebea4")]
  record IAction, lpVtbl : IActionVtbl* do
    GUID = LibC::GUID.new(0xbae54997_u32, 0x48b1_u16, 0x4cbe_u16, StaticArray[0x99_u8, 0x65_u8, 0xd6_u8, 0xbe_u8, 0x26_u8, 0x3e_u8, 0xbe_u8, 0xa4_u8])
    def query_interface(this : IAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IAction*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IAction*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Type(this : IAction*, pType : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end

  end

  @[Extern]
  record IExecActionVtbl,
    query_interface : Proc(IExecAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExecAction*, UInt32),
    release : Proc(IExecAction*, UInt32),
    get_type_info_count : Proc(IExecAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IExecAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IExecAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IExecAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IExecAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IExecAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IExecAction*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IExecAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Path : Proc(IExecAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Arguments : Proc(IExecAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Arguments : Proc(IExecAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_WorkingDirectory : Proc(IExecAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_WorkingDirectory : Proc(IExecAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c3d624d-fd6b-49a3-b9b7-09cb3cd3f047")]
  record IExecAction, lpVtbl : IExecActionVtbl* do
    GUID = LibC::GUID.new(0x4c3d624d_u32, 0xfd6b_u16, 0x49a3_u16, StaticArray[0xb9_u8, 0xb7_u8, 0x9_u8, 0xcb_u8, 0x3c_u8, 0xd3_u8, 0xf0_u8, 0x47_u8])
    def query_interface(this : IExecAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExecAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExecAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IExecAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IExecAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IExecAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IExecAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IExecAction*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IExecAction*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Type(this : IExecAction*, pType : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Path(this : IExecAction*, pPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pPath)
    end
    def put_Path(this : IExecAction*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Path.call(this, path)
    end
    def get_Arguments(this : IExecAction*, pArgument : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Arguments.call(this, pArgument)
    end
    def put_Arguments(this : IExecAction*, argument : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Arguments.call(this, argument)
    end
    def get_WorkingDirectory(this : IExecAction*, pWorkingDirectory : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WorkingDirectory.call(this, pWorkingDirectory)
    end
    def put_WorkingDirectory(this : IExecAction*, workingDirectory : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WorkingDirectory.call(this, workingDirectory)
    end

  end

  @[Extern]
  record IExecAction2Vtbl,
    query_interface : Proc(IExecAction2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExecAction2*, UInt32),
    release : Proc(IExecAction2*, UInt32),
    get_type_info_count : Proc(IExecAction2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IExecAction2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IExecAction2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IExecAction2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IExecAction2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IExecAction2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IExecAction2*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IExecAction2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Path : Proc(IExecAction2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Arguments : Proc(IExecAction2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Arguments : Proc(IExecAction2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_WorkingDirectory : Proc(IExecAction2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_WorkingDirectory : Proc(IExecAction2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_HideAppWindow : Proc(IExecAction2*, Int16*, Win32cr::Foundation::HRESULT),
    put_HideAppWindow : Proc(IExecAction2*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f2a82542-bda5-4e6b-9143-e2bf4f8987b6")]
  record IExecAction2, lpVtbl : IExecAction2Vtbl* do
    GUID = LibC::GUID.new(0xf2a82542_u32, 0xbda5_u16, 0x4e6b_u16, StaticArray[0x91_u8, 0x43_u8, 0xe2_u8, 0xbf_u8, 0x4f_u8, 0x89_u8, 0x87_u8, 0xb6_u8])
    def query_interface(this : IExecAction2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExecAction2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExecAction2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IExecAction2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IExecAction2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IExecAction2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IExecAction2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IExecAction2*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IExecAction2*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Type(this : IExecAction2*, pType : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Path(this : IExecAction2*, pPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pPath)
    end
    def put_Path(this : IExecAction2*, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Path.call(this, path)
    end
    def get_Arguments(this : IExecAction2*, pArgument : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Arguments.call(this, pArgument)
    end
    def put_Arguments(this : IExecAction2*, argument : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Arguments.call(this, argument)
    end
    def get_WorkingDirectory(this : IExecAction2*, pWorkingDirectory : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WorkingDirectory.call(this, pWorkingDirectory)
    end
    def put_WorkingDirectory(this : IExecAction2*, workingDirectory : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WorkingDirectory.call(this, workingDirectory)
    end
    def get_HideAppWindow(this : IExecAction2*, pHideAppWindow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HideAppWindow.call(this, pHideAppWindow)
    end
    def put_HideAppWindow(this : IExecAction2*, hideAppWindow : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HideAppWindow.call(this, hideAppWindow)
    end

  end

  @[Extern]
  record IShowMessageActionVtbl,
    query_interface : Proc(IShowMessageAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IShowMessageAction*, UInt32),
    release : Proc(IShowMessageAction*, UInt32),
    get_type_info_count : Proc(IShowMessageAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IShowMessageAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IShowMessageAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IShowMessageAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IShowMessageAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IShowMessageAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IShowMessageAction*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IShowMessageAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Title : Proc(IShowMessageAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MessageBody : Proc(IShowMessageAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MessageBody : Proc(IShowMessageAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("505e9e68-af89-46b8-a30f-56162a83d537")]
  record IShowMessageAction, lpVtbl : IShowMessageActionVtbl* do
    GUID = LibC::GUID.new(0x505e9e68_u32, 0xaf89_u16, 0x46b8_u16, StaticArray[0xa3_u8, 0xf_u8, 0x56_u8, 0x16_u8, 0x2a_u8, 0x83_u8, 0xd5_u8, 0x37_u8])
    def query_interface(this : IShowMessageAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IShowMessageAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IShowMessageAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IShowMessageAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IShowMessageAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IShowMessageAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IShowMessageAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IShowMessageAction*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IShowMessageAction*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Type(this : IShowMessageAction*, pType : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Title(this : IShowMessageAction*, pTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, pTitle)
    end
    def put_Title(this : IShowMessageAction*, title : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Title.call(this, title)
    end
    def get_MessageBody(this : IShowMessageAction*, pMessageBody : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageBody.call(this, pMessageBody)
    end
    def put_MessageBody(this : IShowMessageAction*, messageBody : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MessageBody.call(this, messageBody)
    end

  end

  @[Extern]
  record IComHandlerActionVtbl,
    query_interface : Proc(IComHandlerAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComHandlerAction*, UInt32),
    release : Proc(IComHandlerAction*, UInt32),
    get_type_info_count : Proc(IComHandlerAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IComHandlerAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IComHandlerAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IComHandlerAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IComHandlerAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IComHandlerAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IComHandlerAction*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_ClassId : Proc(IComHandlerAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClassId : Proc(IComHandlerAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Data : Proc(IComHandlerAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(IComHandlerAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6d2fd252-75c5-4f66-90ba-2a7d8cc3039f")]
  record IComHandlerAction, lpVtbl : IComHandlerActionVtbl* do
    GUID = LibC::GUID.new(0x6d2fd252_u32, 0x75c5_u16, 0x4f66_u16, StaticArray[0x90_u8, 0xba_u8, 0x2a_u8, 0x7d_u8, 0x8c_u8, 0xc3_u8, 0x3_u8, 0x9f_u8])
    def query_interface(this : IComHandlerAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComHandlerAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComHandlerAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IComHandlerAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IComHandlerAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IComHandlerAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IComHandlerAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IComHandlerAction*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IComHandlerAction*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Type(this : IComHandlerAction*, pType : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_ClassId(this : IComHandlerAction*, pClsid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassId.call(this, pClsid)
    end
    def put_ClassId(this : IComHandlerAction*, clsid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassId.call(this, clsid)
    end
    def get_Data(this : IComHandlerAction*, pData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pData)
    end
    def put_Data(this : IComHandlerAction*, data : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, data)
    end

  end

  @[Extern]
  record IEmailActionVtbl,
    query_interface : Proc(IEmailAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEmailAction*, UInt32),
    release : Proc(IEmailAction*, UInt32),
    get_type_info_count : Proc(IEmailAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEmailAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEmailAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEmailAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IEmailAction*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*, Win32cr::Foundation::HRESULT),
    get_Server : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Server : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Subject : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_To : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_To : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Cc : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Cc : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Bcc : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Bcc : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReplyTo : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ReplyTo : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_From : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_From : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_HeaderFields : Proc(IEmailAction*, Void**, Win32cr::Foundation::HRESULT),
    put_HeaderFields : Proc(IEmailAction*, Void*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IEmailAction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IEmailAction*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Attachments : Proc(IEmailAction*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Attachments : Proc(IEmailAction*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("10f62c64-7e16-4314-a0c2-0c3683f99d40")]
  record IEmailAction, lpVtbl : IEmailActionVtbl* do
    GUID = LibC::GUID.new(0x10f62c64_u32, 0x7e16_u16, 0x4314_u16, StaticArray[0xa0_u8, 0xc2_u8, 0xc_u8, 0x36_u8, 0x83_u8, 0xf9_u8, 0x9d_u8, 0x40_u8])
    def query_interface(this : IEmailAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEmailAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEmailAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEmailAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEmailAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEmailAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEmailAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IEmailAction*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IEmailAction*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_Type(this : IEmailAction*, pType : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pType)
    end
    def get_Server(this : IEmailAction*, pServer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Server.call(this, pServer)
    end
    def put_Server(this : IEmailAction*, server : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Server.call(this, server)
    end
    def get_Subject(this : IEmailAction*, pSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pSubject)
    end
    def put_Subject(this : IEmailAction*, subject : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Subject.call(this, subject)
    end
    def get_To(this : IEmailAction*, pTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_To.call(this, pTo)
    end
    def put_To(this : IEmailAction*, to : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_To.call(this, to)
    end
    def get_Cc(this : IEmailAction*, pCc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Cc.call(this, pCc)
    end
    def put_Cc(this : IEmailAction*, cc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Cc.call(this, cc)
    end
    def get_Bcc(this : IEmailAction*, pBcc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bcc.call(this, pBcc)
    end
    def put_Bcc(this : IEmailAction*, bcc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Bcc.call(this, bcc)
    end
    def get_ReplyTo(this : IEmailAction*, pReplyTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReplyTo.call(this, pReplyTo)
    end
    def put_ReplyTo(this : IEmailAction*, replyTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReplyTo.call(this, replyTo)
    end
    def get_From(this : IEmailAction*, pFrom : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_From.call(this, pFrom)
    end
    def put_From(this : IEmailAction*, from : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_From.call(this, from)
    end
    def get_HeaderFields(this : IEmailAction*, ppHeaderFields : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HeaderFields.call(this, ppHeaderFields)
    end
    def put_HeaderFields(this : IEmailAction*, pHeaderFields : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HeaderFields.call(this, pHeaderFields)
    end
    def get_Body(this : IEmailAction*, pBody : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pBody)
    end
    def put_Body(this : IEmailAction*, body : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, body)
    end
    def get_Attachments(this : IEmailAction*, pAttachements : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attachments.call(this, pAttachements)
    end
    def put_Attachments(this : IEmailAction*, pAttachements : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Attachments.call(this, pAttachements)
    end

  end

  @[Extern]
  record ITriggerCollectionVtbl,
    query_interface : Proc(ITriggerCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITriggerCollection*, UInt32),
    release : Proc(ITriggerCollection*, UInt32),
    get_type_info_count : Proc(ITriggerCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITriggerCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITriggerCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITriggerCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ITriggerCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ITriggerCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ITriggerCollection*, Void**, Win32cr::Foundation::HRESULT),
    create : Proc(ITriggerCollection*, Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(ITriggerCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(ITriggerCollection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85df5081-1b24-4f32-878a-d9d14df4cb77")]
  record ITriggerCollection, lpVtbl : ITriggerCollectionVtbl* do
    GUID = LibC::GUID.new(0x85df5081_u32, 0x1b24_u16, 0x4f32_u16, StaticArray[0x87_u8, 0x8a_u8, 0xd9_u8, 0xd1_u8, 0x4d_u8, 0xf4_u8, 0xcb_u8, 0x77_u8])
    def query_interface(this : ITriggerCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITriggerCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITriggerCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITriggerCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITriggerCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITriggerCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITriggerCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ITriggerCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def get_Item(this : ITriggerCollection*, index : Int32, ppTrigger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppTrigger)
    end
    def get__NewEnum(this : ITriggerCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end
    def create(this : ITriggerCollection*, type__ : Win32cr::System::TaskScheduler::TASK_TRIGGER_TYPE2, ppTrigger : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, type__, ppTrigger)
    end
    def remove(this : ITriggerCollection*, index : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end
    def clear(this : ITriggerCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end

  end

  @[Extern]
  record IActionCollectionVtbl,
    query_interface : Proc(IActionCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActionCollection*, UInt32),
    release : Proc(IActionCollection*, UInt32),
    get_type_info_count : Proc(IActionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IActionCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IActionCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IActionCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IActionCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IActionCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IActionCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_XmlText : Proc(IActionCollection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_XmlText : Proc(IActionCollection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    create : Proc(IActionCollection*, Win32cr::System::TaskScheduler::TASK_ACTION_TYPE, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(IActionCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    clear : Proc(IActionCollection*, Win32cr::Foundation::HRESULT),
    get_Context : Proc(IActionCollection*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Context : Proc(IActionCollection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("02820e19-7b98-4ed2-b2e8-fdccceff619b")]
  record IActionCollection, lpVtbl : IActionCollectionVtbl* do
    GUID = LibC::GUID.new(0x2820e19_u32, 0x7b98_u16, 0x4ed2_u16, StaticArray[0xb2_u8, 0xe8_u8, 0xfd_u8, 0xcc_u8, 0xce_u8, 0xff_u8, 0x61_u8, 0x9b_u8])
    def query_interface(this : IActionCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActionCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActionCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IActionCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IActionCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IActionCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IActionCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IActionCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def get_Item(this : IActionCollection*, index : Int32, ppAction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppAction)
    end
    def get__NewEnum(this : IActionCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end
    def get_XmlText(this : IActionCollection*, pText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XmlText.call(this, pText)
    end
    def put_XmlText(this : IActionCollection*, text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_XmlText.call(this, text)
    end
    def create(this : IActionCollection*, type__ : Win32cr::System::TaskScheduler::TASK_ACTION_TYPE, ppAction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create.call(this, type__, ppAction)
    end
    def remove(this : IActionCollection*, index : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end
    def clear(this : IActionCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def get_Context(this : IActionCollection*, pContext : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Context.call(this, pContext)
    end
    def put_Context(this : IActionCollection*, context : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Context.call(this, context)
    end

  end

  @[Extern]
  record IPrincipalVtbl,
    query_interface : Proc(IPrincipal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrincipal*, UInt32),
    release : Proc(IPrincipal*, UInt32),
    get_type_info_count : Proc(IPrincipal*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPrincipal*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPrincipal*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPrincipal*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IPrincipal*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(IPrincipal*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IPrincipal*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IPrincipal*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_UserId : Proc(IPrincipal*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_UserId : Proc(IPrincipal*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LogonType : Proc(IPrincipal*, Win32cr::System::TaskScheduler::TASK_LOGON_TYPE*, Win32cr::Foundation::HRESULT),
    put_LogonType : Proc(IPrincipal*, Win32cr::System::TaskScheduler::TASK_LOGON_TYPE, Win32cr::Foundation::HRESULT),
    get_GroupId : Proc(IPrincipal*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_GroupId : Proc(IPrincipal*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RunLevel : Proc(IPrincipal*, Win32cr::System::TaskScheduler::TASK_RUNLEVEL_TYPE*, Win32cr::Foundation::HRESULT),
    put_RunLevel : Proc(IPrincipal*, Win32cr::System::TaskScheduler::TASK_RUNLEVEL_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d98d51e5-c9b4-496a-a9c1-18980261cf0f")]
  record IPrincipal, lpVtbl : IPrincipalVtbl* do
    GUID = LibC::GUID.new(0xd98d51e5_u32, 0xc9b4_u16, 0x496a_u16, StaticArray[0xa9_u8, 0xc1_u8, 0x18_u8, 0x98_u8, 0x2_u8, 0x61_u8, 0xcf_u8, 0xf_u8])
    def query_interface(this : IPrincipal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrincipal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrincipal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPrincipal*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPrincipal*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPrincipal*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPrincipal*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IPrincipal*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : IPrincipal*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end
    def get_DisplayName(this : IPrincipal*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, pName)
    end
    def put_DisplayName(this : IPrincipal*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, name)
    end
    def get_UserId(this : IPrincipal*, pUser : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserId.call(this, pUser)
    end
    def put_UserId(this : IPrincipal*, user : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserId.call(this, user)
    end
    def get_LogonType(this : IPrincipal*, pLogon : Win32cr::System::TaskScheduler::TASK_LOGON_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogonType.call(this, pLogon)
    end
    def put_LogonType(this : IPrincipal*, logon : Win32cr::System::TaskScheduler::TASK_LOGON_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogonType.call(this, logon)
    end
    def get_GroupId(this : IPrincipal*, pGroup : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupId.call(this, pGroup)
    end
    def put_GroupId(this : IPrincipal*, group : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GroupId.call(this, group)
    end
    def get_RunLevel(this : IPrincipal*, pRunLevel : Win32cr::System::TaskScheduler::TASK_RUNLEVEL_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLevel.call(this, pRunLevel)
    end
    def put_RunLevel(this : IPrincipal*, runLevel : Win32cr::System::TaskScheduler::TASK_RUNLEVEL_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLevel.call(this, runLevel)
    end

  end

  @[Extern]
  record IPrincipal2Vtbl,
    query_interface : Proc(IPrincipal2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPrincipal2*, UInt32),
    release : Proc(IPrincipal2*, UInt32),
    get_type_info_count : Proc(IPrincipal2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPrincipal2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPrincipal2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPrincipal2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ProcessTokenSidType : Proc(IPrincipal2*, Win32cr::System::TaskScheduler::TASK_PROCESSTOKENSID_TYPE*, Win32cr::Foundation::HRESULT),
    put_ProcessTokenSidType : Proc(IPrincipal2*, Win32cr::System::TaskScheduler::TASK_PROCESSTOKENSID_TYPE, Win32cr::Foundation::HRESULT),
    get_RequiredPrivilegeCount : Proc(IPrincipal2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RequiredPrivilege : Proc(IPrincipal2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    add_required_privilege : Proc(IPrincipal2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("248919ae-e345-4a6d-8aeb-e0d3165c904e")]
  record IPrincipal2, lpVtbl : IPrincipal2Vtbl* do
    GUID = LibC::GUID.new(0x248919ae_u32, 0xe345_u16, 0x4a6d_u16, StaticArray[0x8a_u8, 0xeb_u8, 0xe0_u8, 0xd3_u8, 0x16_u8, 0x5c_u8, 0x90_u8, 0x4e_u8])
    def query_interface(this : IPrincipal2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPrincipal2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPrincipal2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPrincipal2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPrincipal2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPrincipal2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPrincipal2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ProcessTokenSidType(this : IPrincipal2*, pProcessTokenSidType : Win32cr::System::TaskScheduler::TASK_PROCESSTOKENSID_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProcessTokenSidType.call(this, pProcessTokenSidType)
    end
    def put_ProcessTokenSidType(this : IPrincipal2*, processTokenSidType : Win32cr::System::TaskScheduler::TASK_PROCESSTOKENSID_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ProcessTokenSidType.call(this, processTokenSidType)
    end
    def get_RequiredPrivilegeCount(this : IPrincipal2*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RequiredPrivilegeCount.call(this, pCount)
    end
    def get_RequiredPrivilege(this : IPrincipal2*, index : Int32, pPrivilege : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RequiredPrivilege.call(this, index, pPrivilege)
    end
    def add_required_privilege(this : IPrincipal2*, privilege : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_required_privilege.call(this, privilege)
    end

  end

  @[Extern]
  record IRegistrationInfoVtbl,
    query_interface : Proc(IRegistrationInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRegistrationInfo*, UInt32),
    release : Proc(IRegistrationInfo*, UInt32),
    get_type_info_count : Proc(IRegistrationInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRegistrationInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRegistrationInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRegistrationInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Author : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Author : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Date : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Date : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Documentation : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Documentation : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_XmlText : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_XmlText : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_URI : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_URI : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SecurityDescriptor : Proc(IRegistrationInfo*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_SecurityDescriptor : Proc(IRegistrationInfo*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Source : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Source : Proc(IRegistrationInfo*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("416d8b73-cb41-4ea1-805c-9be9a5ac4a74")]
  record IRegistrationInfo, lpVtbl : IRegistrationInfoVtbl* do
    GUID = LibC::GUID.new(0x416d8b73_u32, 0xcb41_u16, 0x4ea1_u16, StaticArray[0x80_u8, 0x5c_u8, 0x9b_u8, 0xe9_u8, 0xa5_u8, 0xac_u8, 0x4a_u8, 0x74_u8])
    def query_interface(this : IRegistrationInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRegistrationInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRegistrationInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRegistrationInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRegistrationInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRegistrationInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRegistrationInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Description(this : IRegistrationInfo*, pDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pDescription)
    end
    def put_Description(this : IRegistrationInfo*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def get_Author(this : IRegistrationInfo*, pAuthor : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Author.call(this, pAuthor)
    end
    def put_Author(this : IRegistrationInfo*, author : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Author.call(this, author)
    end
    def get_Version(this : IRegistrationInfo*, pVersion : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, pVersion)
    end
    def put_Version(this : IRegistrationInfo*, version : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, version)
    end
    def get_Date(this : IRegistrationInfo*, pDate : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Date.call(this, pDate)
    end
    def put_Date(this : IRegistrationInfo*, date : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Date.call(this, date)
    end
    def get_Documentation(this : IRegistrationInfo*, pDocumentation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Documentation.call(this, pDocumentation)
    end
    def put_Documentation(this : IRegistrationInfo*, documentation : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Documentation.call(this, documentation)
    end
    def get_XmlText(this : IRegistrationInfo*, pText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XmlText.call(this, pText)
    end
    def put_XmlText(this : IRegistrationInfo*, text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_XmlText.call(this, text)
    end
    def get_URI(this : IRegistrationInfo*, pUri : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_URI.call(this, pUri)
    end
    def put_URI(this : IRegistrationInfo*, uri : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_URI.call(this, uri)
    end
    def get_SecurityDescriptor(this : IRegistrationInfo*, pSddl : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityDescriptor.call(this, pSddl)
    end
    def put_SecurityDescriptor(this : IRegistrationInfo*, sddl : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SecurityDescriptor.call(this, sddl)
    end
    def get_Source(this : IRegistrationInfo*, pSource : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Source.call(this, pSource)
    end
    def put_Source(this : IRegistrationInfo*, source : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Source.call(this, source)
    end

  end

  @[Extern]
  record ITaskDefinitionVtbl,
    query_interface : Proc(ITaskDefinition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskDefinition*, UInt32),
    release : Proc(ITaskDefinition*, UInt32),
    get_type_info_count : Proc(ITaskDefinition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskDefinition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskDefinition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskDefinition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RegistrationInfo : Proc(ITaskDefinition*, Void**, Win32cr::Foundation::HRESULT),
    put_RegistrationInfo : Proc(ITaskDefinition*, Void*, Win32cr::Foundation::HRESULT),
    get_Triggers : Proc(ITaskDefinition*, Void**, Win32cr::Foundation::HRESULT),
    put_Triggers : Proc(ITaskDefinition*, Void*, Win32cr::Foundation::HRESULT),
    get_Settings : Proc(ITaskDefinition*, Void**, Win32cr::Foundation::HRESULT),
    put_Settings : Proc(ITaskDefinition*, Void*, Win32cr::Foundation::HRESULT),
    get_Data : Proc(ITaskDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Data : Proc(ITaskDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Principal : Proc(ITaskDefinition*, Void**, Win32cr::Foundation::HRESULT),
    put_Principal : Proc(ITaskDefinition*, Void*, Win32cr::Foundation::HRESULT),
    get_Actions : Proc(ITaskDefinition*, Void**, Win32cr::Foundation::HRESULT),
    put_Actions : Proc(ITaskDefinition*, Void*, Win32cr::Foundation::HRESULT),
    get_XmlText : Proc(ITaskDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_XmlText : Proc(ITaskDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f5bc8fc5-536d-4f77-b852-fbc1356fdeb6")]
  record ITaskDefinition, lpVtbl : ITaskDefinitionVtbl* do
    GUID = LibC::GUID.new(0xf5bc8fc5_u32, 0x536d_u16, 0x4f77_u16, StaticArray[0xb8_u8, 0x52_u8, 0xfb_u8, 0xc1_u8, 0x35_u8, 0x6f_u8, 0xde_u8, 0xb6_u8])
    def query_interface(this : ITaskDefinition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskDefinition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskDefinition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskDefinition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskDefinition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskDefinition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskDefinition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RegistrationInfo(this : ITaskDefinition*, ppRegistrationInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegistrationInfo.call(this, ppRegistrationInfo)
    end
    def put_RegistrationInfo(this : ITaskDefinition*, pRegistrationInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RegistrationInfo.call(this, pRegistrationInfo)
    end
    def get_Triggers(this : ITaskDefinition*, ppTriggers : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Triggers.call(this, ppTriggers)
    end
    def put_Triggers(this : ITaskDefinition*, pTriggers : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Triggers.call(this, pTriggers)
    end
    def get_Settings(this : ITaskDefinition*, ppSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Settings.call(this, ppSettings)
    end
    def put_Settings(this : ITaskDefinition*, pSettings : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Settings.call(this, pSettings)
    end
    def get_Data(this : ITaskDefinition*, pData : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Data.call(this, pData)
    end
    def put_Data(this : ITaskDefinition*, data : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Data.call(this, data)
    end
    def get_Principal(this : ITaskDefinition*, ppPrincipal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Principal.call(this, ppPrincipal)
    end
    def put_Principal(this : ITaskDefinition*, pPrincipal : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Principal.call(this, pPrincipal)
    end
    def get_Actions(this : ITaskDefinition*, ppActions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Actions.call(this, ppActions)
    end
    def put_Actions(this : ITaskDefinition*, pActions : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Actions.call(this, pActions)
    end
    def get_XmlText(this : ITaskDefinition*, pXml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XmlText.call(this, pXml)
    end
    def put_XmlText(this : ITaskDefinition*, xml : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_XmlText.call(this, xml)
    end

  end

  @[Extern]
  record ITaskSettingsVtbl,
    query_interface : Proc(ITaskSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskSettings*, UInt32),
    release : Proc(ITaskSettings*, UInt32),
    get_type_info_count : Proc(ITaskSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AllowDemandStart : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowDemandStart : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_RestartInterval : Proc(ITaskSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RestartInterval : Proc(ITaskSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RestartCount : Proc(ITaskSettings*, Int32*, Win32cr::Foundation::HRESULT),
    put_RestartCount : Proc(ITaskSettings*, Int32, Win32cr::Foundation::HRESULT),
    get_MultipleInstances : Proc(ITaskSettings*, Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY*, Win32cr::Foundation::HRESULT),
    put_MultipleInstances : Proc(ITaskSettings*, Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY, Win32cr::Foundation::HRESULT),
    get_StopIfGoingOnBatteries : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_StopIfGoingOnBatteries : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_DisallowStartIfOnBatteries : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisallowStartIfOnBatteries : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowHardTerminate : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowHardTerminate : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_StartWhenAvailable : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_StartWhenAvailable : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_XmlText : Proc(ITaskSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_XmlText : Proc(ITaskSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RunOnlyIfNetworkAvailable : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_RunOnlyIfNetworkAvailable : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(ITaskSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(ITaskSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_DeleteExpiredTaskAfter : Proc(ITaskSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DeleteExpiredTaskAfter : Proc(ITaskSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(ITaskSettings*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(ITaskSettings*, Int32, Win32cr::Foundation::HRESULT),
    get_Compatibility : Proc(ITaskSettings*, Win32cr::System::TaskScheduler::TASK_COMPATIBILITY*, Win32cr::Foundation::HRESULT),
    put_Compatibility : Proc(ITaskSettings*, Win32cr::System::TaskScheduler::TASK_COMPATIBILITY, Win32cr::Foundation::HRESULT),
    get_Hidden : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_Hidden : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_IdleSettings : Proc(ITaskSettings*, Void**, Win32cr::Foundation::HRESULT),
    put_IdleSettings : Proc(ITaskSettings*, Void*, Win32cr::Foundation::HRESULT),
    get_RunOnlyIfIdle : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_RunOnlyIfIdle : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_WakeToRun : Proc(ITaskSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_WakeToRun : Proc(ITaskSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_NetworkSettings : Proc(ITaskSettings*, Void**, Win32cr::Foundation::HRESULT),
    put_NetworkSettings : Proc(ITaskSettings*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8fd4711d-2d02-4c8c-87e3-eff699de127e")]
  record ITaskSettings, lpVtbl : ITaskSettingsVtbl* do
    GUID = LibC::GUID.new(0x8fd4711d_u32, 0x2d02_u16, 0x4c8c_u16, StaticArray[0x87_u8, 0xe3_u8, 0xef_u8, 0xf6_u8, 0x99_u8, 0xde_u8, 0x12_u8, 0x7e_u8])
    def query_interface(this : ITaskSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AllowDemandStart(this : ITaskSettings*, pAllowDemandStart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowDemandStart.call(this, pAllowDemandStart)
    end
    def put_AllowDemandStart(this : ITaskSettings*, allowDemandStart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowDemandStart.call(this, allowDemandStart)
    end
    def get_RestartInterval(this : ITaskSettings*, pRestartInterval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RestartInterval.call(this, pRestartInterval)
    end
    def put_RestartInterval(this : ITaskSettings*, restartInterval : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RestartInterval.call(this, restartInterval)
    end
    def get_RestartCount(this : ITaskSettings*, pRestartCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RestartCount.call(this, pRestartCount)
    end
    def put_RestartCount(this : ITaskSettings*, restartCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RestartCount.call(this, restartCount)
    end
    def get_MultipleInstances(this : ITaskSettings*, pPolicy : Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MultipleInstances.call(this, pPolicy)
    end
    def put_MultipleInstances(this : ITaskSettings*, policy : Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MultipleInstances.call(this, policy)
    end
    def get_StopIfGoingOnBatteries(this : ITaskSettings*, pStopIfOnBatteries : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StopIfGoingOnBatteries.call(this, pStopIfOnBatteries)
    end
    def put_StopIfGoingOnBatteries(this : ITaskSettings*, stopIfOnBatteries : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StopIfGoingOnBatteries.call(this, stopIfOnBatteries)
    end
    def get_DisallowStartIfOnBatteries(this : ITaskSettings*, pDisallowStart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisallowStartIfOnBatteries.call(this, pDisallowStart)
    end
    def put_DisallowStartIfOnBatteries(this : ITaskSettings*, disallowStart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisallowStartIfOnBatteries.call(this, disallowStart)
    end
    def get_AllowHardTerminate(this : ITaskSettings*, pAllowHardTerminate : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowHardTerminate.call(this, pAllowHardTerminate)
    end
    def put_AllowHardTerminate(this : ITaskSettings*, allowHardTerminate : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowHardTerminate.call(this, allowHardTerminate)
    end
    def get_StartWhenAvailable(this : ITaskSettings*, pStartWhenAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartWhenAvailable.call(this, pStartWhenAvailable)
    end
    def put_StartWhenAvailable(this : ITaskSettings*, startWhenAvailable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartWhenAvailable.call(this, startWhenAvailable)
    end
    def get_XmlText(this : ITaskSettings*, pText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XmlText.call(this, pText)
    end
    def put_XmlText(this : ITaskSettings*, text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_XmlText.call(this, text)
    end
    def get_RunOnlyIfNetworkAvailable(this : ITaskSettings*, pRunOnlyIfNetworkAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunOnlyIfNetworkAvailable.call(this, pRunOnlyIfNetworkAvailable)
    end
    def put_RunOnlyIfNetworkAvailable(this : ITaskSettings*, runOnlyIfNetworkAvailable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunOnlyIfNetworkAvailable.call(this, runOnlyIfNetworkAvailable)
    end
    def get_ExecutionTimeLimit(this : ITaskSettings*, pExecutionTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pExecutionTimeLimit)
    end
    def put_ExecutionTimeLimit(this : ITaskSettings*, executionTimeLimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, executionTimeLimit)
    end
    def get_Enabled(this : ITaskSettings*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : ITaskSettings*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_DeleteExpiredTaskAfter(this : ITaskSettings*, pExpirationDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeleteExpiredTaskAfter.call(this, pExpirationDelay)
    end
    def put_DeleteExpiredTaskAfter(this : ITaskSettings*, expirationDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DeleteExpiredTaskAfter.call(this, expirationDelay)
    end
    def get_Priority(this : ITaskSettings*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def put_Priority(this : ITaskSettings*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, priority)
    end
    def get_Compatibility(this : ITaskSettings*, pCompatLevel : Win32cr::System::TaskScheduler::TASK_COMPATIBILITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Compatibility.call(this, pCompatLevel)
    end
    def put_Compatibility(this : ITaskSettings*, compatLevel : Win32cr::System::TaskScheduler::TASK_COMPATIBILITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Compatibility.call(this, compatLevel)
    end
    def get_Hidden(this : ITaskSettings*, pHidden : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Hidden.call(this, pHidden)
    end
    def put_Hidden(this : ITaskSettings*, hidden : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Hidden.call(this, hidden)
    end
    def get_IdleSettings(this : ITaskSettings*, ppIdleSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IdleSettings.call(this, ppIdleSettings)
    end
    def put_IdleSettings(this : ITaskSettings*, pIdleSettings : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IdleSettings.call(this, pIdleSettings)
    end
    def get_RunOnlyIfIdle(this : ITaskSettings*, pRunOnlyIfIdle : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunOnlyIfIdle.call(this, pRunOnlyIfIdle)
    end
    def put_RunOnlyIfIdle(this : ITaskSettings*, runOnlyIfIdle : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunOnlyIfIdle.call(this, runOnlyIfIdle)
    end
    def get_WakeToRun(this : ITaskSettings*, pWake : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WakeToRun.call(this, pWake)
    end
    def put_WakeToRun(this : ITaskSettings*, wake : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WakeToRun.call(this, wake)
    end
    def get_NetworkSettings(this : ITaskSettings*, ppNetworkSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkSettings.call(this, ppNetworkSettings)
    end
    def put_NetworkSettings(this : ITaskSettings*, pNetworkSettings : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkSettings.call(this, pNetworkSettings)
    end

  end

  @[Extern]
  record ITaskSettings2Vtbl,
    query_interface : Proc(ITaskSettings2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskSettings2*, UInt32),
    release : Proc(ITaskSettings2*, UInt32),
    get_type_info_count : Proc(ITaskSettings2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskSettings2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskSettings2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskSettings2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DisallowStartOnRemoteAppSession : Proc(ITaskSettings2*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisallowStartOnRemoteAppSession : Proc(ITaskSettings2*, Int16, Win32cr::Foundation::HRESULT),
    get_UseUnifiedSchedulingEngine : Proc(ITaskSettings2*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseUnifiedSchedulingEngine : Proc(ITaskSettings2*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2c05c3f0-6eed-4c05-a15f-ed7d7a98a369")]
  record ITaskSettings2, lpVtbl : ITaskSettings2Vtbl* do
    GUID = LibC::GUID.new(0x2c05c3f0_u32, 0x6eed_u16, 0x4c05_u16, StaticArray[0xa1_u8, 0x5f_u8, 0xed_u8, 0x7d_u8, 0x7a_u8, 0x98_u8, 0xa3_u8, 0x69_u8])
    def query_interface(this : ITaskSettings2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskSettings2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskSettings2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskSettings2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskSettings2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskSettings2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskSettings2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DisallowStartOnRemoteAppSession(this : ITaskSettings2*, pDisallowStart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisallowStartOnRemoteAppSession.call(this, pDisallowStart)
    end
    def put_DisallowStartOnRemoteAppSession(this : ITaskSettings2*, disallowStart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisallowStartOnRemoteAppSession.call(this, disallowStart)
    end
    def get_UseUnifiedSchedulingEngine(this : ITaskSettings2*, pUseUnifiedEngine : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseUnifiedSchedulingEngine.call(this, pUseUnifiedEngine)
    end
    def put_UseUnifiedSchedulingEngine(this : ITaskSettings2*, useUnifiedEngine : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseUnifiedSchedulingEngine.call(this, useUnifiedEngine)
    end

  end

  @[Extern]
  record ITaskSettings3Vtbl,
    query_interface : Proc(ITaskSettings3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskSettings3*, UInt32),
    release : Proc(ITaskSettings3*, UInt32),
    get_type_info_count : Proc(ITaskSettings3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskSettings3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskSettings3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskSettings3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AllowDemandStart : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowDemandStart : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_RestartInterval : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_RestartInterval : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RestartCount : Proc(ITaskSettings3*, Int32*, Win32cr::Foundation::HRESULT),
    put_RestartCount : Proc(ITaskSettings3*, Int32, Win32cr::Foundation::HRESULT),
    get_MultipleInstances : Proc(ITaskSettings3*, Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY*, Win32cr::Foundation::HRESULT),
    put_MultipleInstances : Proc(ITaskSettings3*, Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY, Win32cr::Foundation::HRESULT),
    get_StopIfGoingOnBatteries : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_StopIfGoingOnBatteries : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_DisallowStartIfOnBatteries : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisallowStartIfOnBatteries : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowHardTerminate : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowHardTerminate : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_StartWhenAvailable : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_StartWhenAvailable : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_XmlText : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_XmlText : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RunOnlyIfNetworkAvailable : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_RunOnlyIfNetworkAvailable : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_ExecutionTimeLimit : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutionTimeLimit : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_DeleteExpiredTaskAfter : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DeleteExpiredTaskAfter : Proc(ITaskSettings3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(ITaskSettings3*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(ITaskSettings3*, Int32, Win32cr::Foundation::HRESULT),
    get_Compatibility : Proc(ITaskSettings3*, Win32cr::System::TaskScheduler::TASK_COMPATIBILITY*, Win32cr::Foundation::HRESULT),
    put_Compatibility : Proc(ITaskSettings3*, Win32cr::System::TaskScheduler::TASK_COMPATIBILITY, Win32cr::Foundation::HRESULT),
    get_Hidden : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_Hidden : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_IdleSettings : Proc(ITaskSettings3*, Void**, Win32cr::Foundation::HRESULT),
    put_IdleSettings : Proc(ITaskSettings3*, Void*, Win32cr::Foundation::HRESULT),
    get_RunOnlyIfIdle : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_RunOnlyIfIdle : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_WakeToRun : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_WakeToRun : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_NetworkSettings : Proc(ITaskSettings3*, Void**, Win32cr::Foundation::HRESULT),
    put_NetworkSettings : Proc(ITaskSettings3*, Void*, Win32cr::Foundation::HRESULT),
    get_DisallowStartOnRemoteAppSession : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisallowStartOnRemoteAppSession : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_UseUnifiedSchedulingEngine : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseUnifiedSchedulingEngine : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_MaintenanceSettings : Proc(ITaskSettings3*, Void**, Win32cr::Foundation::HRESULT),
    put_MaintenanceSettings : Proc(ITaskSettings3*, Void*, Win32cr::Foundation::HRESULT),
    create_maintenance_settings : Proc(ITaskSettings3*, Void**, Win32cr::Foundation::HRESULT),
    get_Volatile : Proc(ITaskSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_Volatile : Proc(ITaskSettings3*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0ad9d0d7-0c7f-4ebb-9a5f-d1c648dca528")]
  record ITaskSettings3, lpVtbl : ITaskSettings3Vtbl* do
    GUID = LibC::GUID.new(0xad9d0d7_u32, 0xc7f_u16, 0x4ebb_u16, StaticArray[0x9a_u8, 0x5f_u8, 0xd1_u8, 0xc6_u8, 0x48_u8, 0xdc_u8, 0xa5_u8, 0x28_u8])
    def query_interface(this : ITaskSettings3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskSettings3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskSettings3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskSettings3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskSettings3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskSettings3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskSettings3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AllowDemandStart(this : ITaskSettings3*, pAllowDemandStart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowDemandStart.call(this, pAllowDemandStart)
    end
    def put_AllowDemandStart(this : ITaskSettings3*, allowDemandStart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowDemandStart.call(this, allowDemandStart)
    end
    def get_RestartInterval(this : ITaskSettings3*, pRestartInterval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RestartInterval.call(this, pRestartInterval)
    end
    def put_RestartInterval(this : ITaskSettings3*, restartInterval : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RestartInterval.call(this, restartInterval)
    end
    def get_RestartCount(this : ITaskSettings3*, pRestartCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RestartCount.call(this, pRestartCount)
    end
    def put_RestartCount(this : ITaskSettings3*, restartCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RestartCount.call(this, restartCount)
    end
    def get_MultipleInstances(this : ITaskSettings3*, pPolicy : Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MultipleInstances.call(this, pPolicy)
    end
    def put_MultipleInstances(this : ITaskSettings3*, policy : Win32cr::System::TaskScheduler::TASK_INSTANCES_POLICY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MultipleInstances.call(this, policy)
    end
    def get_StopIfGoingOnBatteries(this : ITaskSettings3*, pStopIfOnBatteries : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StopIfGoingOnBatteries.call(this, pStopIfOnBatteries)
    end
    def put_StopIfGoingOnBatteries(this : ITaskSettings3*, stopIfOnBatteries : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StopIfGoingOnBatteries.call(this, stopIfOnBatteries)
    end
    def get_DisallowStartIfOnBatteries(this : ITaskSettings3*, pDisallowStart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisallowStartIfOnBatteries.call(this, pDisallowStart)
    end
    def put_DisallowStartIfOnBatteries(this : ITaskSettings3*, disallowStart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisallowStartIfOnBatteries.call(this, disallowStart)
    end
    def get_AllowHardTerminate(this : ITaskSettings3*, pAllowHardTerminate : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowHardTerminate.call(this, pAllowHardTerminate)
    end
    def put_AllowHardTerminate(this : ITaskSettings3*, allowHardTerminate : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowHardTerminate.call(this, allowHardTerminate)
    end
    def get_StartWhenAvailable(this : ITaskSettings3*, pStartWhenAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StartWhenAvailable.call(this, pStartWhenAvailable)
    end
    def put_StartWhenAvailable(this : ITaskSettings3*, startWhenAvailable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StartWhenAvailable.call(this, startWhenAvailable)
    end
    def get_XmlText(this : ITaskSettings3*, pText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_XmlText.call(this, pText)
    end
    def put_XmlText(this : ITaskSettings3*, text : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_XmlText.call(this, text)
    end
    def get_RunOnlyIfNetworkAvailable(this : ITaskSettings3*, pRunOnlyIfNetworkAvailable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunOnlyIfNetworkAvailable.call(this, pRunOnlyIfNetworkAvailable)
    end
    def put_RunOnlyIfNetworkAvailable(this : ITaskSettings3*, runOnlyIfNetworkAvailable : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunOnlyIfNetworkAvailable.call(this, runOnlyIfNetworkAvailable)
    end
    def get_ExecutionTimeLimit(this : ITaskSettings3*, pExecutionTimeLimit : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionTimeLimit.call(this, pExecutionTimeLimit)
    end
    def put_ExecutionTimeLimit(this : ITaskSettings3*, executionTimeLimit : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionTimeLimit.call(this, executionTimeLimit)
    end
    def get_Enabled(this : ITaskSettings3*, pEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pEnabled)
    end
    def put_Enabled(this : ITaskSettings3*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_DeleteExpiredTaskAfter(this : ITaskSettings3*, pExpirationDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeleteExpiredTaskAfter.call(this, pExpirationDelay)
    end
    def put_DeleteExpiredTaskAfter(this : ITaskSettings3*, expirationDelay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DeleteExpiredTaskAfter.call(this, expirationDelay)
    end
    def get_Priority(this : ITaskSettings3*, pPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def put_Priority(this : ITaskSettings3*, priority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, priority)
    end
    def get_Compatibility(this : ITaskSettings3*, pCompatLevel : Win32cr::System::TaskScheduler::TASK_COMPATIBILITY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Compatibility.call(this, pCompatLevel)
    end
    def put_Compatibility(this : ITaskSettings3*, compatLevel : Win32cr::System::TaskScheduler::TASK_COMPATIBILITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Compatibility.call(this, compatLevel)
    end
    def get_Hidden(this : ITaskSettings3*, pHidden : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Hidden.call(this, pHidden)
    end
    def put_Hidden(this : ITaskSettings3*, hidden : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Hidden.call(this, hidden)
    end
    def get_IdleSettings(this : ITaskSettings3*, ppIdleSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IdleSettings.call(this, ppIdleSettings)
    end
    def put_IdleSettings(this : ITaskSettings3*, pIdleSettings : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IdleSettings.call(this, pIdleSettings)
    end
    def get_RunOnlyIfIdle(this : ITaskSettings3*, pRunOnlyIfIdle : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunOnlyIfIdle.call(this, pRunOnlyIfIdle)
    end
    def put_RunOnlyIfIdle(this : ITaskSettings3*, runOnlyIfIdle : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunOnlyIfIdle.call(this, runOnlyIfIdle)
    end
    def get_WakeToRun(this : ITaskSettings3*, pWake : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WakeToRun.call(this, pWake)
    end
    def put_WakeToRun(this : ITaskSettings3*, wake : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WakeToRun.call(this, wake)
    end
    def get_NetworkSettings(this : ITaskSettings3*, ppNetworkSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkSettings.call(this, ppNetworkSettings)
    end
    def put_NetworkSettings(this : ITaskSettings3*, pNetworkSettings : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkSettings.call(this, pNetworkSettings)
    end
    def get_DisallowStartOnRemoteAppSession(this : ITaskSettings3*, pDisallowStart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisallowStartOnRemoteAppSession.call(this, pDisallowStart)
    end
    def put_DisallowStartOnRemoteAppSession(this : ITaskSettings3*, disallowStart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisallowStartOnRemoteAppSession.call(this, disallowStart)
    end
    def get_UseUnifiedSchedulingEngine(this : ITaskSettings3*, pUseUnifiedEngine : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseUnifiedSchedulingEngine.call(this, pUseUnifiedEngine)
    end
    def put_UseUnifiedSchedulingEngine(this : ITaskSettings3*, useUnifiedEngine : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseUnifiedSchedulingEngine.call(this, useUnifiedEngine)
    end
    def get_MaintenanceSettings(this : ITaskSettings3*, ppMaintenanceSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaintenanceSettings.call(this, ppMaintenanceSettings)
    end
    def put_MaintenanceSettings(this : ITaskSettings3*, pMaintenanceSettings : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaintenanceSettings.call(this, pMaintenanceSettings)
    end
    def create_maintenance_settings(this : ITaskSettings3*, ppMaintenanceSettings : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_maintenance_settings.call(this, ppMaintenanceSettings)
    end
    def get_Volatile(this : ITaskSettings3*, pVolatile : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Volatile.call(this, pVolatile)
    end
    def put_Volatile(this : ITaskSettings3*, volatile : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Volatile.call(this, volatile)
    end

  end

  @[Extern]
  record IMaintenanceSettingsVtbl,
    query_interface : Proc(IMaintenanceSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMaintenanceSettings*, UInt32),
    release : Proc(IMaintenanceSettings*, UInt32),
    get_type_info_count : Proc(IMaintenanceSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMaintenanceSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMaintenanceSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMaintenanceSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    put_Period : Proc(IMaintenanceSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Period : Proc(IMaintenanceSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Deadline : Proc(IMaintenanceSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IMaintenanceSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Exclusive : Proc(IMaintenanceSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_Exclusive : Proc(IMaintenanceSettings*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a6024fa8-9652-4adb-a6bf-5cfcd877a7ba")]
  record IMaintenanceSettings, lpVtbl : IMaintenanceSettingsVtbl* do
    GUID = LibC::GUID.new(0xa6024fa8_u32, 0x9652_u16, 0x4adb_u16, StaticArray[0xa6_u8, 0xbf_u8, 0x5c_u8, 0xfc_u8, 0xd8_u8, 0x77_u8, 0xa7_u8, 0xba_u8])
    def query_interface(this : IMaintenanceSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMaintenanceSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMaintenanceSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMaintenanceSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMaintenanceSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMaintenanceSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMaintenanceSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def put_Period(this : IMaintenanceSettings*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Period.call(this, value)
    end
    def get_Period(this : IMaintenanceSettings*, target : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Period.call(this, target)
    end
    def put_Deadline(this : IMaintenanceSettings*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Deadline.call(this, value)
    end
    def get_Deadline(this : IMaintenanceSettings*, target : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, target)
    end
    def put_Exclusive(this : IMaintenanceSettings*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Exclusive.call(this, value)
    end
    def get_Exclusive(this : IMaintenanceSettings*, target : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Exclusive.call(this, target)
    end

  end

  @[Extern]
  record IRegisteredTaskCollectionVtbl,
    query_interface : Proc(IRegisteredTaskCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRegisteredTaskCollection*, UInt32),
    release : Proc(IRegisteredTaskCollection*, UInt32),
    get_type_info_count : Proc(IRegisteredTaskCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRegisteredTaskCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRegisteredTaskCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRegisteredTaskCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IRegisteredTaskCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IRegisteredTaskCollection*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IRegisteredTaskCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("86627eb4-42a7-41e4-a4d9-ac33a72f2d52")]
  record IRegisteredTaskCollection, lpVtbl : IRegisteredTaskCollectionVtbl* do
    GUID = LibC::GUID.new(0x86627eb4_u32, 0x42a7_u16, 0x41e4_u16, StaticArray[0xa4_u8, 0xd9_u8, 0xac_u8, 0x33_u8, 0xa7_u8, 0x2f_u8, 0x2d_u8, 0x52_u8])
    def query_interface(this : IRegisteredTaskCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRegisteredTaskCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRegisteredTaskCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRegisteredTaskCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRegisteredTaskCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRegisteredTaskCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRegisteredTaskCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IRegisteredTaskCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def get_Item(this : IRegisteredTaskCollection*, index : Win32cr::System::Com::VARIANT, ppRegisteredTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, ppRegisteredTask)
    end
    def get__NewEnum(this : IRegisteredTaskCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end

  end

  @[Extern]
  record ITaskFolderVtbl,
    query_interface : Proc(ITaskFolder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITaskFolder*, UInt32),
    release : Proc(ITaskFolder*, UInt32),
    get_type_info_count : Proc(ITaskFolder*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITaskFolder*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITaskFolder*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITaskFolder*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ITaskFolder*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(ITaskFolder*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_folder : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_folders : Proc(ITaskFolder*, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_folder : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    delete_folder : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    get_task : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_tasks : Proc(ITaskFolder*, Int32, Void**, Win32cr::Foundation::HRESULT),
    delete_task : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    register_task : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::TaskScheduler::TASK_LOGON_TYPE, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    register_task_definition : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Void*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT, Win32cr::System::TaskScheduler::TASK_LOGON_TYPE, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_security_descriptor : Proc(ITaskFolder*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_security_descriptor : Proc(ITaskFolder*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8cfac062-a080-4c15-9a88-aa7c2af80dfc")]
  record ITaskFolder, lpVtbl : ITaskFolderVtbl* do
    GUID = LibC::GUID.new(0x8cfac062_u32, 0xa080_u16, 0x4c15_u16, StaticArray[0x9a_u8, 0x88_u8, 0xaa_u8, 0x7c_u8, 0x2a_u8, 0xf8_u8, 0xd_u8, 0xfc_u8])
    def query_interface(this : ITaskFolder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITaskFolder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITaskFolder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITaskFolder*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITaskFolder*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITaskFolder*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITaskFolder*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ITaskFolder*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pName)
    end
    def get_Path(this : ITaskFolder*, pPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, pPath)
    end
    def get_folder(this : ITaskFolder*, path : Win32cr::Foundation::BSTR, ppFolder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_folder.call(this, path, ppFolder)
    end
    def get_folders(this : ITaskFolder*, flags : Int32, ppFolders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_folders.call(this, flags, ppFolders)
    end
    def create_folder(this : ITaskFolder*, subFolderName : Win32cr::Foundation::BSTR, sddl : Win32cr::System::Com::VARIANT, ppFolder : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_folder.call(this, subFolderName, sddl, ppFolder)
    end
    def delete_folder(this : ITaskFolder*, subFolderName : Win32cr::Foundation::BSTR, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_folder.call(this, subFolderName, flags)
    end
    def get_task(this : ITaskFolder*, path : Win32cr::Foundation::BSTR, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_task.call(this, path, ppTask)
    end
    def get_tasks(this : ITaskFolder*, flags : Int32, ppTasks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tasks.call(this, flags, ppTasks)
    end
    def delete_task(this : ITaskFolder*, name : Win32cr::Foundation::BSTR, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_task.call(this, name, flags)
    end
    def register_task(this : ITaskFolder*, path : Win32cr::Foundation::BSTR, xmlText : Win32cr::Foundation::BSTR, flags : Int32, userId : Win32cr::System::Com::VARIANT, password : Win32cr::System::Com::VARIANT, logonType : Win32cr::System::TaskScheduler::TASK_LOGON_TYPE, sddl : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_task.call(this, path, xmlText, flags, userId, password, logonType, sddl, ppTask)
    end
    def register_task_definition(this : ITaskFolder*, path : Win32cr::Foundation::BSTR, pDefinition : Void*, flags : Int32, userId : Win32cr::System::Com::VARIANT, password : Win32cr::System::Com::VARIANT, logonType : Win32cr::System::TaskScheduler::TASK_LOGON_TYPE, sddl : Win32cr::System::Com::VARIANT, ppTask : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_task_definition.call(this, path, pDefinition, flags, userId, password, logonType, sddl, ppTask)
    end
    def get_security_descriptor(this : ITaskFolder*, securityInformation : Int32, pSddl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_descriptor.call(this, securityInformation, pSddl)
    end
    def set_security_descriptor(this : ITaskFolder*, sddl : Win32cr::Foundation::BSTR, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security_descriptor.call(this, sddl, flags)
    end

  end

  @[Extern]
  record IIdleSettingsVtbl,
    query_interface : Proc(IIdleSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IIdleSettings*, UInt32),
    release : Proc(IIdleSettings*, UInt32),
    get_type_info_count : Proc(IIdleSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IIdleSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IIdleSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IIdleSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_IdleDuration : Proc(IIdleSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_IdleDuration : Proc(IIdleSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_WaitTimeout : Proc(IIdleSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_WaitTimeout : Proc(IIdleSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StopOnIdleEnd : Proc(IIdleSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_StopOnIdleEnd : Proc(IIdleSettings*, Int16, Win32cr::Foundation::HRESULT),
    get_RestartOnIdle : Proc(IIdleSettings*, Int16*, Win32cr::Foundation::HRESULT),
    put_RestartOnIdle : Proc(IIdleSettings*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("84594461-0053-4342-a8fd-088fabf11f32")]
  record IIdleSettings, lpVtbl : IIdleSettingsVtbl* do
    GUID = LibC::GUID.new(0x84594461_u32, 0x53_u16, 0x4342_u16, StaticArray[0xa8_u8, 0xfd_u8, 0x8_u8, 0x8f_u8, 0xab_u8, 0xf1_u8, 0x1f_u8, 0x32_u8])
    def query_interface(this : IIdleSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IIdleSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IIdleSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IIdleSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IIdleSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IIdleSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IIdleSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_IdleDuration(this : IIdleSettings*, pDelay : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IdleDuration.call(this, pDelay)
    end
    def put_IdleDuration(this : IIdleSettings*, delay : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IdleDuration.call(this, delay)
    end
    def get_WaitTimeout(this : IIdleSettings*, pTimeout : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WaitTimeout.call(this, pTimeout)
    end
    def put_WaitTimeout(this : IIdleSettings*, timeout : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WaitTimeout.call(this, timeout)
    end
    def get_StopOnIdleEnd(this : IIdleSettings*, pStop : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StopOnIdleEnd.call(this, pStop)
    end
    def put_StopOnIdleEnd(this : IIdleSettings*, stop : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StopOnIdleEnd.call(this, stop)
    end
    def get_RestartOnIdle(this : IIdleSettings*, pRestart : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RestartOnIdle.call(this, pRestart)
    end
    def put_RestartOnIdle(this : IIdleSettings*, restart : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RestartOnIdle.call(this, restart)
    end

  end

  @[Extern]
  record INetworkSettingsVtbl,
    query_interface : Proc(INetworkSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(INetworkSettings*, UInt32),
    release : Proc(INetworkSettings*, UInt32),
    get_type_info_count : Proc(INetworkSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(INetworkSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(INetworkSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(INetworkSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(INetworkSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(INetworkSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Id : Proc(INetworkSettings*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Id : Proc(INetworkSettings*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9f7dea84-c30b-4245-80b6-00e9f646f1b4")]
  record INetworkSettings, lpVtbl : INetworkSettingsVtbl* do
    GUID = LibC::GUID.new(0x9f7dea84_u32, 0xc30b_u16, 0x4245_u16, StaticArray[0x80_u8, 0xb6_u8, 0x0_u8, 0xe9_u8, 0xf6_u8, 0x46_u8, 0xf1_u8, 0xb4_u8])
    def query_interface(this : INetworkSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : INetworkSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : INetworkSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : INetworkSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : INetworkSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : INetworkSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : INetworkSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : INetworkSettings*, pName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pName)
    end
    def put_Name(this : INetworkSettings*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Id(this : INetworkSettings*, pId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pId)
    end
    def put_Id(this : INetworkSettings*, id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Id.call(this, id)
    end

  end

  @[Extern]
  record IRepetitionPatternVtbl,
    query_interface : Proc(IRepetitionPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRepetitionPattern*, UInt32),
    release : Proc(IRepetitionPattern*, UInt32),
    get_type_info_count : Proc(IRepetitionPattern*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRepetitionPattern*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRepetitionPattern*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRepetitionPattern*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Interval : Proc(IRepetitionPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Interval : Proc(IRepetitionPattern*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Duration : Proc(IRepetitionPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Duration : Proc(IRepetitionPattern*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StopAtDurationEnd : Proc(IRepetitionPattern*, Int16*, Win32cr::Foundation::HRESULT),
    put_StopAtDurationEnd : Proc(IRepetitionPattern*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7fb9acf1-26be-400e-85b5-294b9c75dfd6")]
  record IRepetitionPattern, lpVtbl : IRepetitionPatternVtbl* do
    GUID = LibC::GUID.new(0x7fb9acf1_u32, 0x26be_u16, 0x400e_u16, StaticArray[0x85_u8, 0xb5_u8, 0x29_u8, 0x4b_u8, 0x9c_u8, 0x75_u8, 0xdf_u8, 0xd6_u8])
    def query_interface(this : IRepetitionPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRepetitionPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRepetitionPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRepetitionPattern*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRepetitionPattern*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRepetitionPattern*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRepetitionPattern*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Interval(this : IRepetitionPattern*, pInterval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Interval.call(this, pInterval)
    end
    def put_Interval(this : IRepetitionPattern*, interval : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Interval.call(this, interval)
    end
    def get_Duration(this : IRepetitionPattern*, pDuration : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Duration.call(this, pDuration)
    end
    def put_Duration(this : IRepetitionPattern*, duration : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Duration.call(this, duration)
    end
    def get_StopAtDurationEnd(this : IRepetitionPattern*, pStop : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StopAtDurationEnd.call(this, pStop)
    end
    def put_StopAtDurationEnd(this : IRepetitionPattern*, stop : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StopAtDurationEnd.call(this, stop)
    end

  end

end