require "../system/com.cr"
require "../foundation.cr"
require "../ui/controls.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
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
  TaskScheduler = LibC::GUID.new(0xf87369f_u32, 0xa4e5_u16, 0x4cfc_u16, StaticArray[0xbd_u8, 0x3e_u8, 0x73_u8, 0xe6_u8, 0x15_u8, 0x45_u8, 0x72_u8, 0xdd_u8])
  TaskHandlerPS = LibC::GUID.new(0xf2a69db7_u32, 0xda2c_u16, 0x4352_u16, StaticArray[0x90_u8, 0x66_u8, 0x86_u8, 0xfe_u8, 0xe6_u8, 0xda_u8, 0xca_u8, 0xc9_u8])
  TaskHandlerStatusPS = LibC::GUID.new(0x9f15266d_u32, 0xd7ba_u16, 0x48f0_u16, StaticArray[0x93_u8, 0xc1_u8, 0xe6_u8, 0x89_u8, 0x5f_u8, 0x6f_u8, 0xe5_u8, 0xac_u8])


  enum TASK_TRIGGER_TYPE : Int32
    TASK_TIME_TRIGGER_ONCE = 0
    TASK_TIME_TRIGGER_DAILY = 1
    TASK_TIME_TRIGGER_WEEKLY = 2
    TASK_TIME_TRIGGER_MONTHLYDATE = 3
    TASK_TIME_TRIGGER_MONTHLYDOW = 4
    TASK_EVENT_TRIGGER_ON_IDLE = 5
    TASK_EVENT_TRIGGER_AT_SYSTEMSTART = 6
    TASK_EVENT_TRIGGER_AT_LOGON = 7
  end

  enum TASKPAGE : Int32
    TASKPAGE_TASK = 0
    TASKPAGE_SCHEDULE = 1
    TASKPAGE_SETTINGS = 2
  end

  enum TASK_RUN_FLAGS : Int32
    TASK_RUN_NO_FLAGS = 0
    TASK_RUN_AS_SELF = 1
    TASK_RUN_IGNORE_CONSTRAINTS = 2
    TASK_RUN_USE_SESSION_ID = 4
    TASK_RUN_USER_SID = 8
  end

  enum TASK_ENUM_FLAGS : Int32
    TASK_ENUM_HIDDEN = 1
  end

  enum TASK_LOGON_TYPE : Int32
    TASK_LOGON_NONE = 0
    TASK_LOGON_PASSWORD = 1
    TASK_LOGON_S4U = 2
    TASK_LOGON_INTERACTIVE_TOKEN = 3
    TASK_LOGON_GROUP = 4
    TASK_LOGON_SERVICE_ACCOUNT = 5
    TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD = 6
  end

  enum TASK_RUNLEVEL_TYPE : Int32
    TASK_RUNLEVEL_LUA = 0
    TASK_RUNLEVEL_HIGHEST = 1
  end

  enum TASK_PROCESSTOKENSID_TYPE : Int32
    TASK_PROCESSTOKENSID_NONE = 0
    TASK_PROCESSTOKENSID_UNRESTRICTED = 1
    TASK_PROCESSTOKENSID_DEFAULT = 2
  end

  enum TASK_STATE : Int32
    TASK_STATE_UNKNOWN = 0
    TASK_STATE_DISABLED = 1
    TASK_STATE_QUEUED = 2
    TASK_STATE_READY = 3
    TASK_STATE_RUNNING = 4
  end

  enum TASK_CREATION : Int32
    TASK_VALIDATE_ONLY = 1
    TASK_CREATE = 2
    TASK_UPDATE = 4
    TASK_CREATE_OR_UPDATE = 6
    TASK_DISABLE = 8
    TASK_DONT_ADD_PRINCIPAL_ACE = 16
    TASK_IGNORE_REGISTRATION_TRIGGERS = 32
  end

  enum TASK_TRIGGER_TYPE2 : Int32
    TASK_TRIGGER_EVENT = 0
    TASK_TRIGGER_TIME = 1
    TASK_TRIGGER_DAILY = 2
    TASK_TRIGGER_WEEKLY = 3
    TASK_TRIGGER_MONTHLY = 4
    TASK_TRIGGER_MONTHLYDOW = 5
    TASK_TRIGGER_IDLE = 6
    TASK_TRIGGER_REGISTRATION = 7
    TASK_TRIGGER_BOOT = 8
    TASK_TRIGGER_LOGON = 9
    TASK_TRIGGER_SESSION_STATE_CHANGE = 11
    TASK_TRIGGER_CUSTOM_TRIGGER_01 = 12
  end

  enum TASK_SESSION_STATE_CHANGE_TYPE : Int32
    TASK_CONSOLE_CONNECT = 1
    TASK_CONSOLE_DISCONNECT = 2
    TASK_REMOTE_CONNECT = 3
    TASK_REMOTE_DISCONNECT = 4
    TASK_SESSION_LOCK = 7
    TASK_SESSION_UNLOCK = 8
  end

  enum TASK_ACTION_TYPE : Int32
    TASK_ACTION_EXEC = 0
    TASK_ACTION_COM_HANDLER = 5
    TASK_ACTION_SEND_EMAIL = 6
    TASK_ACTION_SHOW_MESSAGE = 7
  end

  enum TASK_INSTANCES_POLICY : Int32
    TASK_INSTANCES_PARALLEL = 0
    TASK_INSTANCES_QUEUE = 1
    TASK_INSTANCES_IGNORE_NEW = 2
    TASK_INSTANCES_STOP_EXISTING = 3
  end

  enum TASK_COMPATIBILITY : Int32
    TASK_COMPATIBILITY_AT = 0
    TASK_COMPATIBILITY_V1 = 1
    TASK_COMPATIBILITY_V2 = 2
    TASK_COMPATIBILITY_V2_1 = 3
    TASK_COMPATIBILITY_V2_2 = 4
    TASK_COMPATIBILITY_V2_3 = 5
    TASK_COMPATIBILITY_V2_4 = 6
  end

union TRIGGER_TYPE_UNION
  daily : DAILY
  weekly : WEEKLY
  monthly_date : MONTHLYDATE
  monthly_dow : MONTHLYDOW
end

  struct DAILY
    days_interval : UInt16
  end
  struct WEEKLY
    weeks_interval : UInt16
    rgf_days_of_the_week : UInt16
  end
  struct MONTHLYDATE
    rgf_days : UInt32
    rgf_months : UInt16
  end
  struct MONTHLYDOW
    w_which_week : UInt16
    rgf_days_of_the_week : UInt16
    rgf_months : UInt16
  end
  struct TASK_TRIGGER
    cb_trigger_size : UInt16
    reserved1 : UInt16
    w_begin_year : UInt16
    w_begin_month : UInt16
    w_begin_day : UInt16
    w_end_year : UInt16
    w_end_month : UInt16
    w_end_day : UInt16
    w_start_hour : UInt16
    w_start_minute : UInt16
    minutes_duration : UInt32
    minutes_interval : UInt32
    rg_flags : UInt32
    trigger_type : TASK_TRIGGER_TYPE
    type : TRIGGER_TYPE_UNION
    reserved2 : UInt16
    w_random_minutes_interval : UInt16
  end


  struct ITaskTriggerVTbl
    query_interface : Proc(ITaskTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskTrigger*, UInt32)
    release : Proc(ITaskTrigger*, UInt32)
    set_trigger : Proc(ITaskTrigger*, TASK_TRIGGER*, HRESULT)
    get_trigger : Proc(ITaskTrigger*, TASK_TRIGGER*, HRESULT)
    get_trigger_string : Proc(ITaskTrigger*, LibC::LPWSTR*, HRESULT)
  end

  struct ITaskTrigger
    lpVtbl : ITaskTriggerVTbl*
  end

  struct IScheduledWorkItemVTbl
    query_interface : Proc(IScheduledWorkItem*, Guid*, Void**, HRESULT)
    add_ref : Proc(IScheduledWorkItem*, UInt32)
    release : Proc(IScheduledWorkItem*, UInt32)
    create_trigger : Proc(IScheduledWorkItem*, UInt16*, ITaskTrigger*, HRESULT)
    delete_trigger : Proc(IScheduledWorkItem*, UInt16, HRESULT)
    get_trigger_count : Proc(IScheduledWorkItem*, UInt16*, HRESULT)
    get_trigger : Proc(IScheduledWorkItem*, UInt16, ITaskTrigger*, HRESULT)
    get_trigger_string : Proc(IScheduledWorkItem*, UInt16, LibC::LPWSTR*, HRESULT)
    get_run_times : Proc(IScheduledWorkItem*, SYSTEMTIME*, SYSTEMTIME*, UInt16*, SYSTEMTIME**, HRESULT)
    get_next_run_time : Proc(IScheduledWorkItem*, SYSTEMTIME*, HRESULT)
    set_idle_wait : Proc(IScheduledWorkItem*, UInt16, UInt16, HRESULT)
    get_idle_wait : Proc(IScheduledWorkItem*, UInt16*, UInt16*, HRESULT)
    run : Proc(IScheduledWorkItem*, HRESULT)
    terminate : Proc(IScheduledWorkItem*, HRESULT)
    edit_work_item : Proc(IScheduledWorkItem*, LibC::HANDLE, UInt32, HRESULT)
    get_most_recent_run_time : Proc(IScheduledWorkItem*, SYSTEMTIME*, HRESULT)
    get_status : Proc(IScheduledWorkItem*, HRESULT*, HRESULT)
    get_exit_code : Proc(IScheduledWorkItem*, UInt32*, HRESULT)
    set_comment : Proc(IScheduledWorkItem*, LibC::LPWSTR, HRESULT)
    get_comment : Proc(IScheduledWorkItem*, LibC::LPWSTR*, HRESULT)
    set_creator : Proc(IScheduledWorkItem*, LibC::LPWSTR, HRESULT)
    get_creator : Proc(IScheduledWorkItem*, LibC::LPWSTR*, HRESULT)
    set_work_item_data : Proc(IScheduledWorkItem*, UInt16, UInt8*, HRESULT)
    get_work_item_data : Proc(IScheduledWorkItem*, UInt16*, UInt8**, HRESULT)
    set_error_retry_count : Proc(IScheduledWorkItem*, UInt16, HRESULT)
    get_error_retry_count : Proc(IScheduledWorkItem*, UInt16*, HRESULT)
    set_error_retry_interval : Proc(IScheduledWorkItem*, UInt16, HRESULT)
    get_error_retry_interval : Proc(IScheduledWorkItem*, UInt16*, HRESULT)
    set_flags : Proc(IScheduledWorkItem*, UInt32, HRESULT)
    get_flags : Proc(IScheduledWorkItem*, UInt32*, HRESULT)
    set_account_information : Proc(IScheduledWorkItem*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_account_information : Proc(IScheduledWorkItem*, LibC::LPWSTR*, HRESULT)
  end

  struct IScheduledWorkItem
    lpVtbl : IScheduledWorkItemVTbl*
  end

  struct ITaskVTbl
    query_interface : Proc(ITask*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITask*, UInt32)
    release : Proc(ITask*, UInt32)
    create_trigger : Proc(ITask*, UInt16*, ITaskTrigger*, HRESULT)
    delete_trigger : Proc(ITask*, UInt16, HRESULT)
    get_trigger_count : Proc(ITask*, UInt16*, HRESULT)
    get_trigger : Proc(ITask*, UInt16, ITaskTrigger*, HRESULT)
    get_trigger_string : Proc(ITask*, UInt16, LibC::LPWSTR*, HRESULT)
    get_run_times : Proc(ITask*, SYSTEMTIME*, SYSTEMTIME*, UInt16*, SYSTEMTIME**, HRESULT)
    get_next_run_time : Proc(ITask*, SYSTEMTIME*, HRESULT)
    set_idle_wait : Proc(ITask*, UInt16, UInt16, HRESULT)
    get_idle_wait : Proc(ITask*, UInt16*, UInt16*, HRESULT)
    run : Proc(ITask*, HRESULT)
    terminate : Proc(ITask*, HRESULT)
    edit_work_item : Proc(ITask*, LibC::HANDLE, UInt32, HRESULT)
    get_most_recent_run_time : Proc(ITask*, SYSTEMTIME*, HRESULT)
    get_status : Proc(ITask*, HRESULT*, HRESULT)
    get_exit_code : Proc(ITask*, UInt32*, HRESULT)
    set_comment : Proc(ITask*, LibC::LPWSTR, HRESULT)
    get_comment : Proc(ITask*, LibC::LPWSTR*, HRESULT)
    set_creator : Proc(ITask*, LibC::LPWSTR, HRESULT)
    get_creator : Proc(ITask*, LibC::LPWSTR*, HRESULT)
    set_work_item_data : Proc(ITask*, UInt16, UInt8*, HRESULT)
    get_work_item_data : Proc(ITask*, UInt16*, UInt8**, HRESULT)
    set_error_retry_count : Proc(ITask*, UInt16, HRESULT)
    get_error_retry_count : Proc(ITask*, UInt16*, HRESULT)
    set_error_retry_interval : Proc(ITask*, UInt16, HRESULT)
    get_error_retry_interval : Proc(ITask*, UInt16*, HRESULT)
    set_flags : Proc(ITask*, UInt32, HRESULT)
    get_flags : Proc(ITask*, UInt32*, HRESULT)
    set_account_information : Proc(ITask*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_account_information : Proc(ITask*, LibC::LPWSTR*, HRESULT)
    set_application_name : Proc(ITask*, LibC::LPWSTR, HRESULT)
    get_application_name : Proc(ITask*, LibC::LPWSTR*, HRESULT)
    set_parameters : Proc(ITask*, LibC::LPWSTR, HRESULT)
    get_parameters : Proc(ITask*, LibC::LPWSTR*, HRESULT)
    set_working_directory : Proc(ITask*, LibC::LPWSTR, HRESULT)
    get_working_directory : Proc(ITask*, LibC::LPWSTR*, HRESULT)
    set_priority : Proc(ITask*, UInt32, HRESULT)
    get_priority : Proc(ITask*, UInt32*, HRESULT)
    set_task_flags : Proc(ITask*, UInt32, HRESULT)
    get_task_flags : Proc(ITask*, UInt32*, HRESULT)
    set_max_run_time : Proc(ITask*, UInt32, HRESULT)
    get_max_run_time : Proc(ITask*, UInt32*, HRESULT)
  end

  struct ITask
    lpVtbl : ITaskVTbl*
  end

  struct IEnumWorkItemsVTbl
    query_interface : Proc(IEnumWorkItems*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumWorkItems*, UInt32)
    release : Proc(IEnumWorkItems*, UInt32)
    next : Proc(IEnumWorkItems*, UInt32, LibC::LPWSTR**, UInt32*, HRESULT)
    skip : Proc(IEnumWorkItems*, UInt32, HRESULT)
    reset : Proc(IEnumWorkItems*, HRESULT)
    clone : Proc(IEnumWorkItems*, IEnumWorkItems*, HRESULT)
  end

  struct IEnumWorkItems
    lpVtbl : IEnumWorkItemsVTbl*
  end

  struct ITaskSchedulerVTbl
    query_interface : Proc(ITaskScheduler*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskScheduler*, UInt32)
    release : Proc(ITaskScheduler*, UInt32)
    set_target_computer : Proc(ITaskScheduler*, LibC::LPWSTR, HRESULT)
    get_target_computer : Proc(ITaskScheduler*, LibC::LPWSTR*, HRESULT)
    enum : Proc(ITaskScheduler*, IEnumWorkItems*, HRESULT)
    activate : Proc(ITaskScheduler*, LibC::LPWSTR, Guid*, IUnknown*, HRESULT)
    delete : Proc(ITaskScheduler*, LibC::LPWSTR, HRESULT)
    new_work_item : Proc(ITaskScheduler*, LibC::LPWSTR, Guid*, Guid*, IUnknown*, HRESULT)
    add_work_item : Proc(ITaskScheduler*, LibC::LPWSTR, IScheduledWorkItem, HRESULT)
    is_of_type : Proc(ITaskScheduler*, LibC::LPWSTR, Guid*, HRESULT)
  end

  struct ITaskScheduler
    lpVtbl : ITaskSchedulerVTbl*
  end

  struct IProvideTaskPageVTbl
    query_interface : Proc(IProvideTaskPage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideTaskPage*, UInt32)
    release : Proc(IProvideTaskPage*, UInt32)
    get_page : Proc(IProvideTaskPage*, TASKPAGE, LibC::BOOL, HPROPSHEETPAGE*, HRESULT)
  end

  struct IProvideTaskPage
    lpVtbl : IProvideTaskPageVTbl*
  end

  struct ITaskFolderCollectionVTbl
    query_interface : Proc(ITaskFolderCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskFolderCollection*, UInt32)
    release : Proc(ITaskFolderCollection*, UInt32)
    get_type_info_count : Proc(ITaskFolderCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskFolderCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskFolderCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskFolderCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ITaskFolderCollection*, Int32*, HRESULT)
    get_item : Proc(ITaskFolderCollection*, VARIANT, ITaskFolder*, HRESULT)
    get__new_enum : Proc(ITaskFolderCollection*, IUnknown*, HRESULT)
  end

  struct ITaskFolderCollection
    lpVtbl : ITaskFolderCollectionVTbl*
  end

  struct ITaskServiceVTbl
    query_interface : Proc(ITaskService*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskService*, UInt32)
    release : Proc(ITaskService*, UInt32)
    get_type_info_count : Proc(ITaskService*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskService*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskService*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskService*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_folder : Proc(ITaskService*, UInt8, ITaskFolder*, HRESULT)
    get_running_tasks : Proc(ITaskService*, Int32, IRunningTaskCollection*, HRESULT)
    new_task : Proc(ITaskService*, UInt32, ITaskDefinition*, HRESULT)
    connect : Proc(ITaskService*, VARIANT, VARIANT, VARIANT, VARIANT, HRESULT)
    get_connected : Proc(ITaskService*, Int16*, HRESULT)
    get_target_server : Proc(ITaskService*, UInt8*, HRESULT)
    get_connected_user : Proc(ITaskService*, UInt8*, HRESULT)
    get_connected_domain : Proc(ITaskService*, UInt8*, HRESULT)
    get_highest_version : Proc(ITaskService*, UInt32*, HRESULT)
  end

  struct ITaskService
    lpVtbl : ITaskServiceVTbl*
  end

  struct ITaskHandlerVTbl
    query_interface : Proc(ITaskHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskHandler*, UInt32)
    release : Proc(ITaskHandler*, UInt32)
    start : Proc(ITaskHandler*, IUnknown, UInt8, HRESULT)
    stop : Proc(ITaskHandler*, HRESULT*, HRESULT)
    pause : Proc(ITaskHandler*, HRESULT)
    resume : Proc(ITaskHandler*, HRESULT)
  end

  struct ITaskHandler
    lpVtbl : ITaskHandlerVTbl*
  end

  struct ITaskHandlerStatusVTbl
    query_interface : Proc(ITaskHandlerStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskHandlerStatus*, UInt32)
    release : Proc(ITaskHandlerStatus*, UInt32)
    update_status : Proc(ITaskHandlerStatus*, Int16, UInt8, HRESULT)
    task_completed : Proc(ITaskHandlerStatus*, HRESULT, HRESULT)
  end

  struct ITaskHandlerStatus
    lpVtbl : ITaskHandlerStatusVTbl*
  end

  struct ITaskVariablesVTbl
    query_interface : Proc(ITaskVariables*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskVariables*, UInt32)
    release : Proc(ITaskVariables*, UInt32)
    get_input : Proc(ITaskVariables*, UInt8*, HRESULT)
    set_output : Proc(ITaskVariables*, UInt8, HRESULT)
    get_context : Proc(ITaskVariables*, UInt8*, HRESULT)
  end

  struct ITaskVariables
    lpVtbl : ITaskVariablesVTbl*
  end

  struct ITaskNamedValuePairVTbl
    query_interface : Proc(ITaskNamedValuePair*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskNamedValuePair*, UInt32)
    release : Proc(ITaskNamedValuePair*, UInt32)
    get_type_info_count : Proc(ITaskNamedValuePair*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskNamedValuePair*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskNamedValuePair*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskNamedValuePair*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ITaskNamedValuePair*, UInt8*, HRESULT)
    put_name : Proc(ITaskNamedValuePair*, UInt8, HRESULT)
    get_value : Proc(ITaskNamedValuePair*, UInt8*, HRESULT)
    put_value : Proc(ITaskNamedValuePair*, UInt8, HRESULT)
  end

  struct ITaskNamedValuePair
    lpVtbl : ITaskNamedValuePairVTbl*
  end

  struct ITaskNamedValueCollectionVTbl
    query_interface : Proc(ITaskNamedValueCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskNamedValueCollection*, UInt32)
    release : Proc(ITaskNamedValueCollection*, UInt32)
    get_type_info_count : Proc(ITaskNamedValueCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskNamedValueCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskNamedValueCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskNamedValueCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ITaskNamedValueCollection*, Int32*, HRESULT)
    get_item : Proc(ITaskNamedValueCollection*, Int32, ITaskNamedValuePair*, HRESULT)
    get__new_enum : Proc(ITaskNamedValueCollection*, IUnknown*, HRESULT)
    create : Proc(ITaskNamedValueCollection*, UInt8, UInt8, ITaskNamedValuePair*, HRESULT)
    remove : Proc(ITaskNamedValueCollection*, Int32, HRESULT)
    clear : Proc(ITaskNamedValueCollection*, HRESULT)
  end

  struct ITaskNamedValueCollection
    lpVtbl : ITaskNamedValueCollectionVTbl*
  end

  struct IRunningTaskVTbl
    query_interface : Proc(IRunningTask*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRunningTask*, UInt32)
    release : Proc(IRunningTask*, UInt32)
    get_type_info_count : Proc(IRunningTask*, UInt32*, HRESULT)
    get_type_info : Proc(IRunningTask*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRunningTask*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRunningTask*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IRunningTask*, UInt8*, HRESULT)
    get_instance_guid : Proc(IRunningTask*, UInt8*, HRESULT)
    get_path : Proc(IRunningTask*, UInt8*, HRESULT)
    get_state : Proc(IRunningTask*, TASK_STATE*, HRESULT)
    get_current_action : Proc(IRunningTask*, UInt8*, HRESULT)
    stop : Proc(IRunningTask*, HRESULT)
    refresh : Proc(IRunningTask*, HRESULT)
    get_engine_pid : Proc(IRunningTask*, UInt32*, HRESULT)
  end

  struct IRunningTask
    lpVtbl : IRunningTaskVTbl*
  end

  struct IRunningTaskCollectionVTbl
    query_interface : Proc(IRunningTaskCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRunningTaskCollection*, UInt32)
    release : Proc(IRunningTaskCollection*, UInt32)
    get_type_info_count : Proc(IRunningTaskCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IRunningTaskCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRunningTaskCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRunningTaskCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IRunningTaskCollection*, Int32*, HRESULT)
    get_item : Proc(IRunningTaskCollection*, VARIANT, IRunningTask*, HRESULT)
    get__new_enum : Proc(IRunningTaskCollection*, IUnknown*, HRESULT)
  end

  struct IRunningTaskCollection
    lpVtbl : IRunningTaskCollectionVTbl*
  end

  struct IRegisteredTaskVTbl
    query_interface : Proc(IRegisteredTask*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRegisteredTask*, UInt32)
    release : Proc(IRegisteredTask*, UInt32)
    get_type_info_count : Proc(IRegisteredTask*, UInt32*, HRESULT)
    get_type_info : Proc(IRegisteredTask*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRegisteredTask*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRegisteredTask*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IRegisteredTask*, UInt8*, HRESULT)
    get_path : Proc(IRegisteredTask*, UInt8*, HRESULT)
    get_state : Proc(IRegisteredTask*, TASK_STATE*, HRESULT)
    get_enabled : Proc(IRegisteredTask*, Int16*, HRESULT)
    put_enabled : Proc(IRegisteredTask*, Int16, HRESULT)
    run : Proc(IRegisteredTask*, VARIANT, IRunningTask*, HRESULT)
    run_ex : Proc(IRegisteredTask*, VARIANT, Int32, Int32, UInt8, IRunningTask*, HRESULT)
    get_instances : Proc(IRegisteredTask*, Int32, IRunningTaskCollection*, HRESULT)
    get_last_run_time : Proc(IRegisteredTask*, Float64*, HRESULT)
    get_last_task_result : Proc(IRegisteredTask*, Int32*, HRESULT)
    get_number_of_missed_runs : Proc(IRegisteredTask*, Int32*, HRESULT)
    get_next_run_time : Proc(IRegisteredTask*, Float64*, HRESULT)
    get_definition : Proc(IRegisteredTask*, ITaskDefinition*, HRESULT)
    get_xml : Proc(IRegisteredTask*, UInt8*, HRESULT)
    get_security_descriptor : Proc(IRegisteredTask*, Int32, UInt8*, HRESULT)
    set_security_descriptor : Proc(IRegisteredTask*, UInt8, Int32, HRESULT)
    stop : Proc(IRegisteredTask*, Int32, HRESULT)
    get_run_times : Proc(IRegisteredTask*, SYSTEMTIME*, SYSTEMTIME*, UInt32*, SYSTEMTIME**, HRESULT)
  end

  struct IRegisteredTask
    lpVtbl : IRegisteredTaskVTbl*
  end

  struct ITriggerVTbl
    query_interface : Proc(ITrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITrigger*, UInt32)
    release : Proc(ITrigger*, UInt32)
    get_type_info_count : Proc(ITrigger*, UInt32*, HRESULT)
    get_type_info : Proc(ITrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ITrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(ITrigger*, UInt8*, HRESULT)
    put_id : Proc(ITrigger*, UInt8, HRESULT)
    get_repetition : Proc(ITrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ITrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ITrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(ITrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(ITrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(ITrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(ITrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(ITrigger*, UInt8, HRESULT)
    get_enabled : Proc(ITrigger*, Int16*, HRESULT)
    put_enabled : Proc(ITrigger*, Int16, HRESULT)
  end

  struct ITrigger
    lpVtbl : ITriggerVTbl*
  end

  struct IIdleTriggerVTbl
    query_interface : Proc(IIdleTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdleTrigger*, UInt32)
    release : Proc(IIdleTrigger*, UInt32)
    get_type_info_count : Proc(IIdleTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IIdleTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIdleTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIdleTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IIdleTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IIdleTrigger*, UInt8*, HRESULT)
    put_id : Proc(IIdleTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IIdleTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IIdleTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IIdleTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IIdleTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IIdleTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IIdleTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IIdleTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IIdleTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IIdleTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IIdleTrigger*, Int16, HRESULT)
  end

  struct IIdleTrigger
    lpVtbl : IIdleTriggerVTbl*
  end

  struct ILogonTriggerVTbl
    query_interface : Proc(ILogonTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILogonTrigger*, UInt32)
    release : Proc(ILogonTrigger*, UInt32)
    get_type_info_count : Proc(ILogonTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(ILogonTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ILogonTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ILogonTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ILogonTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(ILogonTrigger*, UInt8*, HRESULT)
    put_id : Proc(ILogonTrigger*, UInt8, HRESULT)
    get_repetition : Proc(ILogonTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ILogonTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ILogonTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(ILogonTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(ILogonTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(ILogonTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(ILogonTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(ILogonTrigger*, UInt8, HRESULT)
    get_enabled : Proc(ILogonTrigger*, Int16*, HRESULT)
    put_enabled : Proc(ILogonTrigger*, Int16, HRESULT)
    get_delay : Proc(ILogonTrigger*, UInt8*, HRESULT)
    put_delay : Proc(ILogonTrigger*, UInt8, HRESULT)
    get_user_id : Proc(ILogonTrigger*, UInt8*, HRESULT)
    put_user_id : Proc(ILogonTrigger*, UInt8, HRESULT)
  end

  struct ILogonTrigger
    lpVtbl : ILogonTriggerVTbl*
  end

  struct ISessionStateChangeTriggerVTbl
    query_interface : Proc(ISessionStateChangeTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISessionStateChangeTrigger*, UInt32)
    release : Proc(ISessionStateChangeTrigger*, UInt32)
    get_type_info_count : Proc(ISessionStateChangeTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(ISessionStateChangeTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISessionStateChangeTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISessionStateChangeTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ISessionStateChangeTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    put_id : Proc(ISessionStateChangeTrigger*, UInt8, HRESULT)
    get_repetition : Proc(ISessionStateChangeTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ISessionStateChangeTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(ISessionStateChangeTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(ISessionStateChangeTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(ISessionStateChangeTrigger*, UInt8, HRESULT)
    get_enabled : Proc(ISessionStateChangeTrigger*, Int16*, HRESULT)
    put_enabled : Proc(ISessionStateChangeTrigger*, Int16, HRESULT)
    get_delay : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    put_delay : Proc(ISessionStateChangeTrigger*, UInt8, HRESULT)
    get_user_id : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    put_user_id : Proc(ISessionStateChangeTrigger*, UInt8, HRESULT)
    get_state_change : Proc(ISessionStateChangeTrigger*, TASK_SESSION_STATE_CHANGE_TYPE*, HRESULT)
    put_state_change : Proc(ISessionStateChangeTrigger*, TASK_SESSION_STATE_CHANGE_TYPE, HRESULT)
  end

  struct ISessionStateChangeTrigger
    lpVtbl : ISessionStateChangeTriggerVTbl*
  end

  struct IEventTriggerVTbl
    query_interface : Proc(IEventTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventTrigger*, UInt32)
    release : Proc(IEventTrigger*, UInt32)
    get_type_info_count : Proc(IEventTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IEventTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IEventTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IEventTrigger*, UInt8*, HRESULT)
    put_id : Proc(IEventTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IEventTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IEventTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IEventTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IEventTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IEventTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IEventTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IEventTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IEventTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IEventTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IEventTrigger*, Int16, HRESULT)
    get_subscription : Proc(IEventTrigger*, UInt8*, HRESULT)
    put_subscription : Proc(IEventTrigger*, UInt8, HRESULT)
    get_delay : Proc(IEventTrigger*, UInt8*, HRESULT)
    put_delay : Proc(IEventTrigger*, UInt8, HRESULT)
    get_value_queries : Proc(IEventTrigger*, ITaskNamedValueCollection*, HRESULT)
    put_value_queries : Proc(IEventTrigger*, ITaskNamedValueCollection, HRESULT)
  end

  struct IEventTrigger
    lpVtbl : IEventTriggerVTbl*
  end

  struct ITimeTriggerVTbl
    query_interface : Proc(ITimeTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITimeTrigger*, UInt32)
    release : Proc(ITimeTrigger*, UInt32)
    get_type_info_count : Proc(ITimeTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(ITimeTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITimeTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITimeTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(ITimeTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(ITimeTrigger*, UInt8*, HRESULT)
    put_id : Proc(ITimeTrigger*, UInt8, HRESULT)
    get_repetition : Proc(ITimeTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ITimeTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ITimeTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(ITimeTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(ITimeTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(ITimeTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(ITimeTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(ITimeTrigger*, UInt8, HRESULT)
    get_enabled : Proc(ITimeTrigger*, Int16*, HRESULT)
    put_enabled : Proc(ITimeTrigger*, Int16, HRESULT)
    get_random_delay : Proc(ITimeTrigger*, UInt8*, HRESULT)
    put_random_delay : Proc(ITimeTrigger*, UInt8, HRESULT)
  end

  struct ITimeTrigger
    lpVtbl : ITimeTriggerVTbl*
  end

  struct IDailyTriggerVTbl
    query_interface : Proc(IDailyTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDailyTrigger*, UInt32)
    release : Proc(IDailyTrigger*, UInt32)
    get_type_info_count : Proc(IDailyTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IDailyTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDailyTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDailyTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IDailyTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IDailyTrigger*, UInt8*, HRESULT)
    put_id : Proc(IDailyTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IDailyTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IDailyTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IDailyTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IDailyTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IDailyTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IDailyTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IDailyTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IDailyTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IDailyTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IDailyTrigger*, Int16, HRESULT)
    get_days_interval : Proc(IDailyTrigger*, Int16*, HRESULT)
    put_days_interval : Proc(IDailyTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IDailyTrigger*, UInt8*, HRESULT)
    put_random_delay : Proc(IDailyTrigger*, UInt8, HRESULT)
  end

  struct IDailyTrigger
    lpVtbl : IDailyTriggerVTbl*
  end

  struct IWeeklyTriggerVTbl
    query_interface : Proc(IWeeklyTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWeeklyTrigger*, UInt32)
    release : Proc(IWeeklyTrigger*, UInt32)
    get_type_info_count : Proc(IWeeklyTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IWeeklyTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWeeklyTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWeeklyTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IWeeklyTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    put_id : Proc(IWeeklyTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IWeeklyTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IWeeklyTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IWeeklyTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IWeeklyTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IWeeklyTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IWeeklyTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IWeeklyTrigger*, Int16, HRESULT)
    get_days_of_week : Proc(IWeeklyTrigger*, Int16*, HRESULT)
    put_days_of_week : Proc(IWeeklyTrigger*, Int16, HRESULT)
    get_weeks_interval : Proc(IWeeklyTrigger*, Int16*, HRESULT)
    put_weeks_interval : Proc(IWeeklyTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    put_random_delay : Proc(IWeeklyTrigger*, UInt8, HRESULT)
  end

  struct IWeeklyTrigger
    lpVtbl : IWeeklyTriggerVTbl*
  end

  struct IMonthlyTriggerVTbl
    query_interface : Proc(IMonthlyTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMonthlyTrigger*, UInt32)
    release : Proc(IMonthlyTrigger*, UInt32)
    get_type_info_count : Proc(IMonthlyTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IMonthlyTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMonthlyTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMonthlyTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IMonthlyTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    put_id : Proc(IMonthlyTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IMonthlyTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IMonthlyTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IMonthlyTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IMonthlyTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IMonthlyTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IMonthlyTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IMonthlyTrigger*, Int16, HRESULT)
    get_days_of_month : Proc(IMonthlyTrigger*, Int32*, HRESULT)
    put_days_of_month : Proc(IMonthlyTrigger*, Int32, HRESULT)
    get_months_of_year : Proc(IMonthlyTrigger*, Int16*, HRESULT)
    put_months_of_year : Proc(IMonthlyTrigger*, Int16, HRESULT)
    get_run_on_last_day_of_month : Proc(IMonthlyTrigger*, Int16*, HRESULT)
    put_run_on_last_day_of_month : Proc(IMonthlyTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    put_random_delay : Proc(IMonthlyTrigger*, UInt8, HRESULT)
  end

  struct IMonthlyTrigger
    lpVtbl : IMonthlyTriggerVTbl*
  end

  struct IMonthlyDOWTriggerVTbl
    query_interface : Proc(IMonthlyDOWTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMonthlyDOWTrigger*, UInt32)
    release : Proc(IMonthlyDOWTrigger*, UInt32)
    get_type_info_count : Proc(IMonthlyDOWTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IMonthlyDOWTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMonthlyDOWTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMonthlyDOWTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IMonthlyDOWTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    put_id : Proc(IMonthlyDOWTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IMonthlyDOWTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IMonthlyDOWTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IMonthlyDOWTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IMonthlyDOWTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IMonthlyDOWTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IMonthlyDOWTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IMonthlyDOWTrigger*, Int16, HRESULT)
    get_days_of_week : Proc(IMonthlyDOWTrigger*, Int16*, HRESULT)
    put_days_of_week : Proc(IMonthlyDOWTrigger*, Int16, HRESULT)
    get_weeks_of_month : Proc(IMonthlyDOWTrigger*, Int16*, HRESULT)
    put_weeks_of_month : Proc(IMonthlyDOWTrigger*, Int16, HRESULT)
    get_months_of_year : Proc(IMonthlyDOWTrigger*, Int16*, HRESULT)
    put_months_of_year : Proc(IMonthlyDOWTrigger*, Int16, HRESULT)
    get_run_on_last_week_of_month : Proc(IMonthlyDOWTrigger*, Int16*, HRESULT)
    put_run_on_last_week_of_month : Proc(IMonthlyDOWTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    put_random_delay : Proc(IMonthlyDOWTrigger*, UInt8, HRESULT)
  end

  struct IMonthlyDOWTrigger
    lpVtbl : IMonthlyDOWTriggerVTbl*
  end

  struct IBootTriggerVTbl
    query_interface : Proc(IBootTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBootTrigger*, UInt32)
    release : Proc(IBootTrigger*, UInt32)
    get_type_info_count : Proc(IBootTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IBootTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IBootTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IBootTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IBootTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IBootTrigger*, UInt8*, HRESULT)
    put_id : Proc(IBootTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IBootTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IBootTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IBootTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IBootTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IBootTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IBootTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IBootTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IBootTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IBootTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IBootTrigger*, Int16, HRESULT)
    get_delay : Proc(IBootTrigger*, UInt8*, HRESULT)
    put_delay : Proc(IBootTrigger*, UInt8, HRESULT)
  end

  struct IBootTrigger
    lpVtbl : IBootTriggerVTbl*
  end

  struct IRegistrationTriggerVTbl
    query_interface : Proc(IRegistrationTrigger*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRegistrationTrigger*, UInt32)
    release : Proc(IRegistrationTrigger*, UInt32)
    get_type_info_count : Proc(IRegistrationTrigger*, UInt32*, HRESULT)
    get_type_info : Proc(IRegistrationTrigger*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRegistrationTrigger*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRegistrationTrigger*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IRegistrationTrigger*, TASK_TRIGGER_TYPE2*, HRESULT)
    get_id : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    put_id : Proc(IRegistrationTrigger*, UInt8, HRESULT)
    get_repetition : Proc(IRegistrationTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IRegistrationTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(IRegistrationTrigger*, UInt8, HRESULT)
    get_start_boundary : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    put_start_boundary : Proc(IRegistrationTrigger*, UInt8, HRESULT)
    get_end_boundary : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    put_end_boundary : Proc(IRegistrationTrigger*, UInt8, HRESULT)
    get_enabled : Proc(IRegistrationTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IRegistrationTrigger*, Int16, HRESULT)
    get_delay : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    put_delay : Proc(IRegistrationTrigger*, UInt8, HRESULT)
  end

  struct IRegistrationTrigger
    lpVtbl : IRegistrationTriggerVTbl*
  end

  struct IActionVTbl
    query_interface : Proc(IAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAction*, UInt32)
    release : Proc(IAction*, UInt32)
    get_type_info_count : Proc(IAction*, UInt32*, HRESULT)
    get_type_info : Proc(IAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IAction*, UInt8*, HRESULT)
    put_id : Proc(IAction*, UInt8, HRESULT)
    get_type : Proc(IAction*, TASK_ACTION_TYPE*, HRESULT)
  end

  struct IAction
    lpVtbl : IActionVTbl*
  end

  struct IExecActionVTbl
    query_interface : Proc(IExecAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExecAction*, UInt32)
    release : Proc(IExecAction*, UInt32)
    get_type_info_count : Proc(IExecAction*, UInt32*, HRESULT)
    get_type_info : Proc(IExecAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IExecAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IExecAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IExecAction*, UInt8*, HRESULT)
    put_id : Proc(IExecAction*, UInt8, HRESULT)
    get_type : Proc(IExecAction*, TASK_ACTION_TYPE*, HRESULT)
    get_path : Proc(IExecAction*, UInt8*, HRESULT)
    put_path : Proc(IExecAction*, UInt8, HRESULT)
    get_arguments : Proc(IExecAction*, UInt8*, HRESULT)
    put_arguments : Proc(IExecAction*, UInt8, HRESULT)
    get_working_directory : Proc(IExecAction*, UInt8*, HRESULT)
    put_working_directory : Proc(IExecAction*, UInt8, HRESULT)
  end

  struct IExecAction
    lpVtbl : IExecActionVTbl*
  end

  struct IExecAction2VTbl
    query_interface : Proc(IExecAction2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExecAction2*, UInt32)
    release : Proc(IExecAction2*, UInt32)
    get_type_info_count : Proc(IExecAction2*, UInt32*, HRESULT)
    get_type_info : Proc(IExecAction2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IExecAction2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IExecAction2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IExecAction2*, UInt8*, HRESULT)
    put_id : Proc(IExecAction2*, UInt8, HRESULT)
    get_type : Proc(IExecAction2*, TASK_ACTION_TYPE*, HRESULT)
    get_path : Proc(IExecAction2*, UInt8*, HRESULT)
    put_path : Proc(IExecAction2*, UInt8, HRESULT)
    get_arguments : Proc(IExecAction2*, UInt8*, HRESULT)
    put_arguments : Proc(IExecAction2*, UInt8, HRESULT)
    get_working_directory : Proc(IExecAction2*, UInt8*, HRESULT)
    put_working_directory : Proc(IExecAction2*, UInt8, HRESULT)
    get_hide_app_window : Proc(IExecAction2*, Int16*, HRESULT)
    put_hide_app_window : Proc(IExecAction2*, Int16, HRESULT)
  end

  struct IExecAction2
    lpVtbl : IExecAction2VTbl*
  end

  struct IShowMessageActionVTbl
    query_interface : Proc(IShowMessageAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IShowMessageAction*, UInt32)
    release : Proc(IShowMessageAction*, UInt32)
    get_type_info_count : Proc(IShowMessageAction*, UInt32*, HRESULT)
    get_type_info : Proc(IShowMessageAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IShowMessageAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IShowMessageAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IShowMessageAction*, UInt8*, HRESULT)
    put_id : Proc(IShowMessageAction*, UInt8, HRESULT)
    get_type : Proc(IShowMessageAction*, TASK_ACTION_TYPE*, HRESULT)
    get_title : Proc(IShowMessageAction*, UInt8*, HRESULT)
    put_title : Proc(IShowMessageAction*, UInt8, HRESULT)
    get_message_body : Proc(IShowMessageAction*, UInt8*, HRESULT)
    put_message_body : Proc(IShowMessageAction*, UInt8, HRESULT)
  end

  struct IShowMessageAction
    lpVtbl : IShowMessageActionVTbl*
  end

  struct IComHandlerActionVTbl
    query_interface : Proc(IComHandlerAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComHandlerAction*, UInt32)
    release : Proc(IComHandlerAction*, UInt32)
    get_type_info_count : Proc(IComHandlerAction*, UInt32*, HRESULT)
    get_type_info : Proc(IComHandlerAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IComHandlerAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IComHandlerAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IComHandlerAction*, UInt8*, HRESULT)
    put_id : Proc(IComHandlerAction*, UInt8, HRESULT)
    get_type : Proc(IComHandlerAction*, TASK_ACTION_TYPE*, HRESULT)
    get_class_id : Proc(IComHandlerAction*, UInt8*, HRESULT)
    put_class_id : Proc(IComHandlerAction*, UInt8, HRESULT)
    get_data : Proc(IComHandlerAction*, UInt8*, HRESULT)
    put_data : Proc(IComHandlerAction*, UInt8, HRESULT)
  end

  struct IComHandlerAction
    lpVtbl : IComHandlerActionVTbl*
  end

  struct IEmailActionVTbl
    query_interface : Proc(IEmailAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEmailAction*, UInt32)
    release : Proc(IEmailAction*, UInt32)
    get_type_info_count : Proc(IEmailAction*, UInt32*, HRESULT)
    get_type_info : Proc(IEmailAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEmailAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEmailAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IEmailAction*, UInt8*, HRESULT)
    put_id : Proc(IEmailAction*, UInt8, HRESULT)
    get_type : Proc(IEmailAction*, TASK_ACTION_TYPE*, HRESULT)
    get_server : Proc(IEmailAction*, UInt8*, HRESULT)
    put_server : Proc(IEmailAction*, UInt8, HRESULT)
    get_subject : Proc(IEmailAction*, UInt8*, HRESULT)
    put_subject : Proc(IEmailAction*, UInt8, HRESULT)
    get_to : Proc(IEmailAction*, UInt8*, HRESULT)
    put_to : Proc(IEmailAction*, UInt8, HRESULT)
    get_cc : Proc(IEmailAction*, UInt8*, HRESULT)
    put_cc : Proc(IEmailAction*, UInt8, HRESULT)
    get_bcc : Proc(IEmailAction*, UInt8*, HRESULT)
    put_bcc : Proc(IEmailAction*, UInt8, HRESULT)
    get_reply_to : Proc(IEmailAction*, UInt8*, HRESULT)
    put_reply_to : Proc(IEmailAction*, UInt8, HRESULT)
    get_from : Proc(IEmailAction*, UInt8*, HRESULT)
    put_from : Proc(IEmailAction*, UInt8, HRESULT)
    get_header_fields : Proc(IEmailAction*, ITaskNamedValueCollection*, HRESULT)
    put_header_fields : Proc(IEmailAction*, ITaskNamedValueCollection, HRESULT)
    get_body : Proc(IEmailAction*, UInt8*, HRESULT)
    put_body : Proc(IEmailAction*, UInt8, HRESULT)
    get_attachments : Proc(IEmailAction*, SAFEARRAY**, HRESULT)
    put_attachments : Proc(IEmailAction*, SAFEARRAY*, HRESULT)
  end

  struct IEmailAction
    lpVtbl : IEmailActionVTbl*
  end

  struct ITriggerCollectionVTbl
    query_interface : Proc(ITriggerCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITriggerCollection*, UInt32)
    release : Proc(ITriggerCollection*, UInt32)
    get_type_info_count : Proc(ITriggerCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ITriggerCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITriggerCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITriggerCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ITriggerCollection*, Int32*, HRESULT)
    get_item : Proc(ITriggerCollection*, Int32, ITrigger*, HRESULT)
    get__new_enum : Proc(ITriggerCollection*, IUnknown*, HRESULT)
    create : Proc(ITriggerCollection*, TASK_TRIGGER_TYPE2, ITrigger*, HRESULT)
    remove : Proc(ITriggerCollection*, VARIANT, HRESULT)
    clear : Proc(ITriggerCollection*, HRESULT)
  end

  struct ITriggerCollection
    lpVtbl : ITriggerCollectionVTbl*
  end

  struct IActionCollectionVTbl
    query_interface : Proc(IActionCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActionCollection*, UInt32)
    release : Proc(IActionCollection*, UInt32)
    get_type_info_count : Proc(IActionCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IActionCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IActionCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IActionCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IActionCollection*, Int32*, HRESULT)
    get_item : Proc(IActionCollection*, Int32, IAction*, HRESULT)
    get__new_enum : Proc(IActionCollection*, IUnknown*, HRESULT)
    get_xml_text : Proc(IActionCollection*, UInt8*, HRESULT)
    put_xml_text : Proc(IActionCollection*, UInt8, HRESULT)
    create : Proc(IActionCollection*, TASK_ACTION_TYPE, IAction*, HRESULT)
    remove : Proc(IActionCollection*, VARIANT, HRESULT)
    clear : Proc(IActionCollection*, HRESULT)
    get_context : Proc(IActionCollection*, UInt8*, HRESULT)
    put_context : Proc(IActionCollection*, UInt8, HRESULT)
  end

  struct IActionCollection
    lpVtbl : IActionCollectionVTbl*
  end

  struct IPrincipalVTbl
    query_interface : Proc(IPrincipal*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrincipal*, UInt32)
    release : Proc(IPrincipal*, UInt32)
    get_type_info_count : Proc(IPrincipal*, UInt32*, HRESULT)
    get_type_info : Proc(IPrincipal*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPrincipal*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPrincipal*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IPrincipal*, UInt8*, HRESULT)
    put_id : Proc(IPrincipal*, UInt8, HRESULT)
    get_display_name : Proc(IPrincipal*, UInt8*, HRESULT)
    put_display_name : Proc(IPrincipal*, UInt8, HRESULT)
    get_user_id : Proc(IPrincipal*, UInt8*, HRESULT)
    put_user_id : Proc(IPrincipal*, UInt8, HRESULT)
    get_logon_type : Proc(IPrincipal*, TASK_LOGON_TYPE*, HRESULT)
    put_logon_type : Proc(IPrincipal*, TASK_LOGON_TYPE, HRESULT)
    get_group_id : Proc(IPrincipal*, UInt8*, HRESULT)
    put_group_id : Proc(IPrincipal*, UInt8, HRESULT)
    get_run_level : Proc(IPrincipal*, TASK_RUNLEVEL_TYPE*, HRESULT)
    put_run_level : Proc(IPrincipal*, TASK_RUNLEVEL_TYPE, HRESULT)
  end

  struct IPrincipal
    lpVtbl : IPrincipalVTbl*
  end

  struct IPrincipal2VTbl
    query_interface : Proc(IPrincipal2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPrincipal2*, UInt32)
    release : Proc(IPrincipal2*, UInt32)
    get_type_info_count : Proc(IPrincipal2*, UInt32*, HRESULT)
    get_type_info : Proc(IPrincipal2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPrincipal2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPrincipal2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_process_token_sid_type : Proc(IPrincipal2*, TASK_PROCESSTOKENSID_TYPE*, HRESULT)
    put_process_token_sid_type : Proc(IPrincipal2*, TASK_PROCESSTOKENSID_TYPE, HRESULT)
    get_required_privilege_count : Proc(IPrincipal2*, Int32*, HRESULT)
    get_required_privilege : Proc(IPrincipal2*, Int32, UInt8*, HRESULT)
    add_required_privilege : Proc(IPrincipal2*, UInt8, HRESULT)
  end

  struct IPrincipal2
    lpVtbl : IPrincipal2VTbl*
  end

  struct IRegistrationInfoVTbl
    query_interface : Proc(IRegistrationInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRegistrationInfo*, UInt32)
    release : Proc(IRegistrationInfo*, UInt32)
    get_type_info_count : Proc(IRegistrationInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IRegistrationInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRegistrationInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRegistrationInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_description : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_description : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_author : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_author : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_version : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_version : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_date : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_date : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_documentation : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_documentation : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_xml_text : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_xml_text : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_uri : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_uri : Proc(IRegistrationInfo*, UInt8, HRESULT)
    get_security_descriptor : Proc(IRegistrationInfo*, VARIANT*, HRESULT)
    put_security_descriptor : Proc(IRegistrationInfo*, VARIANT, HRESULT)
    get_source : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    put_source : Proc(IRegistrationInfo*, UInt8, HRESULT)
  end

  struct IRegistrationInfo
    lpVtbl : IRegistrationInfoVTbl*
  end

  struct ITaskDefinitionVTbl
    query_interface : Proc(ITaskDefinition*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskDefinition*, UInt32)
    release : Proc(ITaskDefinition*, UInt32)
    get_type_info_count : Proc(ITaskDefinition*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskDefinition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskDefinition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskDefinition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_registration_info : Proc(ITaskDefinition*, IRegistrationInfo*, HRESULT)
    put_registration_info : Proc(ITaskDefinition*, IRegistrationInfo, HRESULT)
    get_triggers : Proc(ITaskDefinition*, ITriggerCollection*, HRESULT)
    put_triggers : Proc(ITaskDefinition*, ITriggerCollection, HRESULT)
    get_settings : Proc(ITaskDefinition*, ITaskSettings*, HRESULT)
    put_settings : Proc(ITaskDefinition*, ITaskSettings, HRESULT)
    get_data : Proc(ITaskDefinition*, UInt8*, HRESULT)
    put_data : Proc(ITaskDefinition*, UInt8, HRESULT)
    get_principal : Proc(ITaskDefinition*, IPrincipal*, HRESULT)
    put_principal : Proc(ITaskDefinition*, IPrincipal, HRESULT)
    get_actions : Proc(ITaskDefinition*, IActionCollection*, HRESULT)
    put_actions : Proc(ITaskDefinition*, IActionCollection, HRESULT)
    get_xml_text : Proc(ITaskDefinition*, UInt8*, HRESULT)
    put_xml_text : Proc(ITaskDefinition*, UInt8, HRESULT)
  end

  struct ITaskDefinition
    lpVtbl : ITaskDefinitionVTbl*
  end

  struct ITaskSettingsVTbl
    query_interface : Proc(ITaskSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskSettings*, UInt32)
    release : Proc(ITaskSettings*, UInt32)
    get_type_info_count : Proc(ITaskSettings*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_allow_demand_start : Proc(ITaskSettings*, Int16*, HRESULT)
    put_allow_demand_start : Proc(ITaskSettings*, Int16, HRESULT)
    get_restart_interval : Proc(ITaskSettings*, UInt8*, HRESULT)
    put_restart_interval : Proc(ITaskSettings*, UInt8, HRESULT)
    get_restart_count : Proc(ITaskSettings*, Int32*, HRESULT)
    put_restart_count : Proc(ITaskSettings*, Int32, HRESULT)
    get_multiple_instances : Proc(ITaskSettings*, TASK_INSTANCES_POLICY*, HRESULT)
    put_multiple_instances : Proc(ITaskSettings*, TASK_INSTANCES_POLICY, HRESULT)
    get_stop_if_going_on_batteries : Proc(ITaskSettings*, Int16*, HRESULT)
    put_stop_if_going_on_batteries : Proc(ITaskSettings*, Int16, HRESULT)
    get_disallow_start_if_on_batteries : Proc(ITaskSettings*, Int16*, HRESULT)
    put_disallow_start_if_on_batteries : Proc(ITaskSettings*, Int16, HRESULT)
    get_allow_hard_terminate : Proc(ITaskSettings*, Int16*, HRESULT)
    put_allow_hard_terminate : Proc(ITaskSettings*, Int16, HRESULT)
    get_start_when_available : Proc(ITaskSettings*, Int16*, HRESULT)
    put_start_when_available : Proc(ITaskSettings*, Int16, HRESULT)
    get_xml_text : Proc(ITaskSettings*, UInt8*, HRESULT)
    put_xml_text : Proc(ITaskSettings*, UInt8, HRESULT)
    get_run_only_if_network_available : Proc(ITaskSettings*, Int16*, HRESULT)
    put_run_only_if_network_available : Proc(ITaskSettings*, Int16, HRESULT)
    get_execution_time_limit : Proc(ITaskSettings*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(ITaskSettings*, UInt8, HRESULT)
    get_enabled : Proc(ITaskSettings*, Int16*, HRESULT)
    put_enabled : Proc(ITaskSettings*, Int16, HRESULT)
    get_delete_expired_task_after : Proc(ITaskSettings*, UInt8*, HRESULT)
    put_delete_expired_task_after : Proc(ITaskSettings*, UInt8, HRESULT)
    get_priority : Proc(ITaskSettings*, Int32*, HRESULT)
    put_priority : Proc(ITaskSettings*, Int32, HRESULT)
    get_compatibility : Proc(ITaskSettings*, TASK_COMPATIBILITY*, HRESULT)
    put_compatibility : Proc(ITaskSettings*, TASK_COMPATIBILITY, HRESULT)
    get_hidden : Proc(ITaskSettings*, Int16*, HRESULT)
    put_hidden : Proc(ITaskSettings*, Int16, HRESULT)
    get_idle_settings : Proc(ITaskSettings*, IIdleSettings*, HRESULT)
    put_idle_settings : Proc(ITaskSettings*, IIdleSettings, HRESULT)
    get_run_only_if_idle : Proc(ITaskSettings*, Int16*, HRESULT)
    put_run_only_if_idle : Proc(ITaskSettings*, Int16, HRESULT)
    get_wake_to_run : Proc(ITaskSettings*, Int16*, HRESULT)
    put_wake_to_run : Proc(ITaskSettings*, Int16, HRESULT)
    get_network_settings : Proc(ITaskSettings*, INetworkSettings*, HRESULT)
    put_network_settings : Proc(ITaskSettings*, INetworkSettings, HRESULT)
  end

  struct ITaskSettings
    lpVtbl : ITaskSettingsVTbl*
  end

  struct ITaskSettings2VTbl
    query_interface : Proc(ITaskSettings2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskSettings2*, UInt32)
    release : Proc(ITaskSettings2*, UInt32)
    get_type_info_count : Proc(ITaskSettings2*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskSettings2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskSettings2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskSettings2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_disallow_start_on_remote_app_session : Proc(ITaskSettings2*, Int16*, HRESULT)
    put_disallow_start_on_remote_app_session : Proc(ITaskSettings2*, Int16, HRESULT)
    get_use_unified_scheduling_engine : Proc(ITaskSettings2*, Int16*, HRESULT)
    put_use_unified_scheduling_engine : Proc(ITaskSettings2*, Int16, HRESULT)
  end

  struct ITaskSettings2
    lpVtbl : ITaskSettings2VTbl*
  end

  struct ITaskSettings3VTbl
    query_interface : Proc(ITaskSettings3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskSettings3*, UInt32)
    release : Proc(ITaskSettings3*, UInt32)
    get_type_info_count : Proc(ITaskSettings3*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskSettings3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskSettings3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskSettings3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_allow_demand_start : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_allow_demand_start : Proc(ITaskSettings3*, Int16, HRESULT)
    get_restart_interval : Proc(ITaskSettings3*, UInt8*, HRESULT)
    put_restart_interval : Proc(ITaskSettings3*, UInt8, HRESULT)
    get_restart_count : Proc(ITaskSettings3*, Int32*, HRESULT)
    put_restart_count : Proc(ITaskSettings3*, Int32, HRESULT)
    get_multiple_instances : Proc(ITaskSettings3*, TASK_INSTANCES_POLICY*, HRESULT)
    put_multiple_instances : Proc(ITaskSettings3*, TASK_INSTANCES_POLICY, HRESULT)
    get_stop_if_going_on_batteries : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_stop_if_going_on_batteries : Proc(ITaskSettings3*, Int16, HRESULT)
    get_disallow_start_if_on_batteries : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_disallow_start_if_on_batteries : Proc(ITaskSettings3*, Int16, HRESULT)
    get_allow_hard_terminate : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_allow_hard_terminate : Proc(ITaskSettings3*, Int16, HRESULT)
    get_start_when_available : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_start_when_available : Proc(ITaskSettings3*, Int16, HRESULT)
    get_xml_text : Proc(ITaskSettings3*, UInt8*, HRESULT)
    put_xml_text : Proc(ITaskSettings3*, UInt8, HRESULT)
    get_run_only_if_network_available : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_run_only_if_network_available : Proc(ITaskSettings3*, Int16, HRESULT)
    get_execution_time_limit : Proc(ITaskSettings3*, UInt8*, HRESULT)
    put_execution_time_limit : Proc(ITaskSettings3*, UInt8, HRESULT)
    get_enabled : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_enabled : Proc(ITaskSettings3*, Int16, HRESULT)
    get_delete_expired_task_after : Proc(ITaskSettings3*, UInt8*, HRESULT)
    put_delete_expired_task_after : Proc(ITaskSettings3*, UInt8, HRESULT)
    get_priority : Proc(ITaskSettings3*, Int32*, HRESULT)
    put_priority : Proc(ITaskSettings3*, Int32, HRESULT)
    get_compatibility : Proc(ITaskSettings3*, TASK_COMPATIBILITY*, HRESULT)
    put_compatibility : Proc(ITaskSettings3*, TASK_COMPATIBILITY, HRESULT)
    get_hidden : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_hidden : Proc(ITaskSettings3*, Int16, HRESULT)
    get_idle_settings : Proc(ITaskSettings3*, IIdleSettings*, HRESULT)
    put_idle_settings : Proc(ITaskSettings3*, IIdleSettings, HRESULT)
    get_run_only_if_idle : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_run_only_if_idle : Proc(ITaskSettings3*, Int16, HRESULT)
    get_wake_to_run : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_wake_to_run : Proc(ITaskSettings3*, Int16, HRESULT)
    get_network_settings : Proc(ITaskSettings3*, INetworkSettings*, HRESULT)
    put_network_settings : Proc(ITaskSettings3*, INetworkSettings, HRESULT)
    get_disallow_start_on_remote_app_session : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_disallow_start_on_remote_app_session : Proc(ITaskSettings3*, Int16, HRESULT)
    get_use_unified_scheduling_engine : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_use_unified_scheduling_engine : Proc(ITaskSettings3*, Int16, HRESULT)
    get_maintenance_settings : Proc(ITaskSettings3*, IMaintenanceSettings*, HRESULT)
    put_maintenance_settings : Proc(ITaskSettings3*, IMaintenanceSettings, HRESULT)
    create_maintenance_settings : Proc(ITaskSettings3*, IMaintenanceSettings*, HRESULT)
    get_volatile : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_volatile : Proc(ITaskSettings3*, Int16, HRESULT)
  end

  struct ITaskSettings3
    lpVtbl : ITaskSettings3VTbl*
  end

  struct IMaintenanceSettingsVTbl
    query_interface : Proc(IMaintenanceSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMaintenanceSettings*, UInt32)
    release : Proc(IMaintenanceSettings*, UInt32)
    get_type_info_count : Proc(IMaintenanceSettings*, UInt32*, HRESULT)
    get_type_info : Proc(IMaintenanceSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMaintenanceSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMaintenanceSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    put_period : Proc(IMaintenanceSettings*, UInt8, HRESULT)
    get_period : Proc(IMaintenanceSettings*, UInt8*, HRESULT)
    put_deadline : Proc(IMaintenanceSettings*, UInt8, HRESULT)
    get_deadline : Proc(IMaintenanceSettings*, UInt8*, HRESULT)
    put_exclusive : Proc(IMaintenanceSettings*, Int16, HRESULT)
    get_exclusive : Proc(IMaintenanceSettings*, Int16*, HRESULT)
  end

  struct IMaintenanceSettings
    lpVtbl : IMaintenanceSettingsVTbl*
  end

  struct IRegisteredTaskCollectionVTbl
    query_interface : Proc(IRegisteredTaskCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRegisteredTaskCollection*, UInt32)
    release : Proc(IRegisteredTaskCollection*, UInt32)
    get_type_info_count : Proc(IRegisteredTaskCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IRegisteredTaskCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRegisteredTaskCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRegisteredTaskCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IRegisteredTaskCollection*, Int32*, HRESULT)
    get_item : Proc(IRegisteredTaskCollection*, VARIANT, IRegisteredTask*, HRESULT)
    get__new_enum : Proc(IRegisteredTaskCollection*, IUnknown*, HRESULT)
  end

  struct IRegisteredTaskCollection
    lpVtbl : IRegisteredTaskCollectionVTbl*
  end

  struct ITaskFolderVTbl
    query_interface : Proc(ITaskFolder*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskFolder*, UInt32)
    release : Proc(ITaskFolder*, UInt32)
    get_type_info_count : Proc(ITaskFolder*, UInt32*, HRESULT)
    get_type_info : Proc(ITaskFolder*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITaskFolder*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITaskFolder*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ITaskFolder*, UInt8*, HRESULT)
    get_path : Proc(ITaskFolder*, UInt8*, HRESULT)
    get_folder : Proc(ITaskFolder*, UInt8, ITaskFolder*, HRESULT)
    get_folders : Proc(ITaskFolder*, Int32, ITaskFolderCollection*, HRESULT)
    create_folder : Proc(ITaskFolder*, UInt8, VARIANT, ITaskFolder*, HRESULT)
    delete_folder : Proc(ITaskFolder*, UInt8, Int32, HRESULT)
    get_task : Proc(ITaskFolder*, UInt8, IRegisteredTask*, HRESULT)
    get_tasks : Proc(ITaskFolder*, Int32, IRegisteredTaskCollection*, HRESULT)
    delete_task : Proc(ITaskFolder*, UInt8, Int32, HRESULT)
    register_task : Proc(ITaskFolder*, UInt8, UInt8, Int32, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*, HRESULT)
    register_task_definition : Proc(ITaskFolder*, UInt8, ITaskDefinition, Int32, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*, HRESULT)
    get_security_descriptor : Proc(ITaskFolder*, Int32, UInt8*, HRESULT)
    set_security_descriptor : Proc(ITaskFolder*, UInt8, Int32, HRESULT)
  end

  struct ITaskFolder
    lpVtbl : ITaskFolderVTbl*
  end

  struct IIdleSettingsVTbl
    query_interface : Proc(IIdleSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IIdleSettings*, UInt32)
    release : Proc(IIdleSettings*, UInt32)
    get_type_info_count : Proc(IIdleSettings*, UInt32*, HRESULT)
    get_type_info : Proc(IIdleSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IIdleSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IIdleSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_idle_duration : Proc(IIdleSettings*, UInt8*, HRESULT)
    put_idle_duration : Proc(IIdleSettings*, UInt8, HRESULT)
    get_wait_timeout : Proc(IIdleSettings*, UInt8*, HRESULT)
    put_wait_timeout : Proc(IIdleSettings*, UInt8, HRESULT)
    get_stop_on_idle_end : Proc(IIdleSettings*, Int16*, HRESULT)
    put_stop_on_idle_end : Proc(IIdleSettings*, Int16, HRESULT)
    get_restart_on_idle : Proc(IIdleSettings*, Int16*, HRESULT)
    put_restart_on_idle : Proc(IIdleSettings*, Int16, HRESULT)
  end

  struct IIdleSettings
    lpVtbl : IIdleSettingsVTbl*
  end

  struct INetworkSettingsVTbl
    query_interface : Proc(INetworkSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetworkSettings*, UInt32)
    release : Proc(INetworkSettings*, UInt32)
    get_type_info_count : Proc(INetworkSettings*, UInt32*, HRESULT)
    get_type_info : Proc(INetworkSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(INetworkSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(INetworkSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(INetworkSettings*, UInt8*, HRESULT)
    put_name : Proc(INetworkSettings*, UInt8, HRESULT)
    get_id : Proc(INetworkSettings*, UInt8*, HRESULT)
    put_id : Proc(INetworkSettings*, UInt8, HRESULT)
  end

  struct INetworkSettings
    lpVtbl : INetworkSettingsVTbl*
  end

  struct IRepetitionPatternVTbl
    query_interface : Proc(IRepetitionPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRepetitionPattern*, UInt32)
    release : Proc(IRepetitionPattern*, UInt32)
    get_type_info_count : Proc(IRepetitionPattern*, UInt32*, HRESULT)
    get_type_info : Proc(IRepetitionPattern*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRepetitionPattern*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRepetitionPattern*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_interval : Proc(IRepetitionPattern*, UInt8*, HRESULT)
    put_interval : Proc(IRepetitionPattern*, UInt8, HRESULT)
    get_duration : Proc(IRepetitionPattern*, UInt8*, HRESULT)
    put_duration : Proc(IRepetitionPattern*, UInt8, HRESULT)
    get_stop_at_duration_end : Proc(IRepetitionPattern*, Int16*, HRESULT)
    put_stop_at_duration_end : Proc(IRepetitionPattern*, Int16, HRESULT)
  end

  struct IRepetitionPattern
    lpVtbl : IRepetitionPatternVTbl*
  end

end
