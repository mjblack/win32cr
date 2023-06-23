require "../system/com.cr"
require "../foundation.cr"
require "../ui/controls.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
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
  CLSID_TaskScheduler = LibC::GUID.new(0xf87369f_u32, 0xa4e5_u16, 0x4cfc_u16, StaticArray[0xbd_u8, 0x3e_u8, 0x73_u8, 0xe6_u8, 0x15_u8, 0x45_u8, 0x72_u8, 0xdd_u8])
  CLSID_TaskHandlerPS = LibC::GUID.new(0xf2a69db7_u32, 0xda2c_u16, 0x4352_u16, StaticArray[0x90_u8, 0x66_u8, 0x86_u8, 0xfe_u8, 0xe6_u8, 0xda_u8, 0xca_u8, 0xc9_u8])
  CLSID_TaskHandlerStatusPS = LibC::GUID.new(0x9f15266d_u32, 0xd7ba_u16, 0x48f0_u16, StaticArray[0x93_u8, 0xc1_u8, 0xe6_u8, 0x89_u8, 0x5f_u8, 0x6f_u8, 0xe5_u8, 0xac_u8])


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

  ITaskTrigger_GUID = "148bd52b-a2ab-11ce-b11f-00aa00530503"
  IID_ITaskTrigger = LibC::GUID.new(0x148bd52b_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
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

  IScheduledWorkItem_GUID = "a6b952f0-a4b1-11d0-997d-00aa006887ec"
  IID_IScheduledWorkItem = LibC::GUID.new(0xa6b952f0_u32, 0xa4b1_u16, 0x11d0_u16, StaticArray[0x99_u8, 0x7d_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xec_u8])
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

  ITask_GUID = "148bd524-a2ab-11ce-b11f-00aa00530503"
  IID_ITask = LibC::GUID.new(0x148bd524_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
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

  IEnumWorkItems_GUID = "148bd528-a2ab-11ce-b11f-00aa00530503"
  IID_IEnumWorkItems = LibC::GUID.new(0x148bd528_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
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

  ITaskScheduler_GUID = "148bd527-a2ab-11ce-b11f-00aa00530503"
  IID_ITaskScheduler = LibC::GUID.new(0x148bd527_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
  struct ITaskScheduler
    lpVtbl : ITaskSchedulerVTbl*
  end

  struct IProvideTaskPageVTbl
    query_interface : Proc(IProvideTaskPage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvideTaskPage*, UInt32)
    release : Proc(IProvideTaskPage*, UInt32)
    get_page : Proc(IProvideTaskPage*, TASKPAGE, LibC::BOOL, HPROPSHEETPAGE*, HRESULT)
  end

  IProvideTaskPage_GUID = "4086658a-cbbb-11cf-b604-00c04fd8d565"
  IID_IProvideTaskPage = LibC::GUID.new(0x4086658a_u32, 0xcbbb_u16, 0x11cf_u16, StaticArray[0xb6_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
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

  ITaskFolderCollection_GUID = "79184a66-8664-423f-97f1-637356a5d812"
  IID_ITaskFolderCollection = LibC::GUID.new(0x79184a66_u32, 0x8664_u16, 0x423f_u16, StaticArray[0x97_u8, 0xf1_u8, 0x63_u8, 0x73_u8, 0x56_u8, 0xa5_u8, 0xd8_u8, 0x12_u8])
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
    get_folder : Proc(ITaskService*, UInt8*, ITaskFolder*, HRESULT)
    get_running_tasks : Proc(ITaskService*, Int32, IRunningTaskCollection*, HRESULT)
    new_task : Proc(ITaskService*, UInt32, ITaskDefinition*, HRESULT)
    connect : Proc(ITaskService*, VARIANT, VARIANT, VARIANT, VARIANT, HRESULT)
    get_connected : Proc(ITaskService*, Int16*, HRESULT)
    get_target_server : Proc(ITaskService*, UInt8**, HRESULT)
    get_connected_user : Proc(ITaskService*, UInt8**, HRESULT)
    get_connected_domain : Proc(ITaskService*, UInt8**, HRESULT)
    get_highest_version : Proc(ITaskService*, UInt32*, HRESULT)
  end

  ITaskService_GUID = "2faba4c7-4da9-4013-9697-20cc3fd40f85"
  IID_ITaskService = LibC::GUID.new(0x2faba4c7_u32, 0x4da9_u16, 0x4013_u16, StaticArray[0x96_u8, 0x97_u8, 0x20_u8, 0xcc_u8, 0x3f_u8, 0xd4_u8, 0xf_u8, 0x85_u8])
  struct ITaskService
    lpVtbl : ITaskServiceVTbl*
  end

  struct ITaskHandlerVTbl
    query_interface : Proc(ITaskHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskHandler*, UInt32)
    release : Proc(ITaskHandler*, UInt32)
    start : Proc(ITaskHandler*, IUnknown, UInt8*, HRESULT)
    stop : Proc(ITaskHandler*, HRESULT*, HRESULT)
    pause : Proc(ITaskHandler*, HRESULT)
    resume : Proc(ITaskHandler*, HRESULT)
  end

  ITaskHandler_GUID = "839d7762-5121-4009-9234-4f0d19394f04"
  IID_ITaskHandler = LibC::GUID.new(0x839d7762_u32, 0x5121_u16, 0x4009_u16, StaticArray[0x92_u8, 0x34_u8, 0x4f_u8, 0xd_u8, 0x19_u8, 0x39_u8, 0x4f_u8, 0x4_u8])
  struct ITaskHandler
    lpVtbl : ITaskHandlerVTbl*
  end

  struct ITaskHandlerStatusVTbl
    query_interface : Proc(ITaskHandlerStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskHandlerStatus*, UInt32)
    release : Proc(ITaskHandlerStatus*, UInt32)
    update_status : Proc(ITaskHandlerStatus*, Int16, UInt8*, HRESULT)
    task_completed : Proc(ITaskHandlerStatus*, HRESULT, HRESULT)
  end

  ITaskHandlerStatus_GUID = "eaec7a8f-27a0-4ddc-8675-14726a01a38a"
  IID_ITaskHandlerStatus = LibC::GUID.new(0xeaec7a8f_u32, 0x27a0_u16, 0x4ddc_u16, StaticArray[0x86_u8, 0x75_u8, 0x14_u8, 0x72_u8, 0x6a_u8, 0x1_u8, 0xa3_u8, 0x8a_u8])
  struct ITaskHandlerStatus
    lpVtbl : ITaskHandlerStatusVTbl*
  end

  struct ITaskVariablesVTbl
    query_interface : Proc(ITaskVariables*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITaskVariables*, UInt32)
    release : Proc(ITaskVariables*, UInt32)
    get_input : Proc(ITaskVariables*, UInt8**, HRESULT)
    set_output : Proc(ITaskVariables*, UInt8*, HRESULT)
    get_context : Proc(ITaskVariables*, UInt8**, HRESULT)
  end

  ITaskVariables_GUID = "3e4c9351-d966-4b8b-bb87-ceba68bb0107"
  IID_ITaskVariables = LibC::GUID.new(0x3e4c9351_u32, 0xd966_u16, 0x4b8b_u16, StaticArray[0xbb_u8, 0x87_u8, 0xce_u8, 0xba_u8, 0x68_u8, 0xbb_u8, 0x1_u8, 0x7_u8])
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
    get_name : Proc(ITaskNamedValuePair*, UInt8**, HRESULT)
    put_name : Proc(ITaskNamedValuePair*, UInt8*, HRESULT)
    get_value : Proc(ITaskNamedValuePair*, UInt8**, HRESULT)
    put_value : Proc(ITaskNamedValuePair*, UInt8*, HRESULT)
  end

  ITaskNamedValuePair_GUID = "39038068-2b46-4afd-8662-7bb6f868d221"
  IID_ITaskNamedValuePair = LibC::GUID.new(0x39038068_u32, 0x2b46_u16, 0x4afd_u16, StaticArray[0x86_u8, 0x62_u8, 0x7b_u8, 0xb6_u8, 0xf8_u8, 0x68_u8, 0xd2_u8, 0x21_u8])
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
    create : Proc(ITaskNamedValueCollection*, UInt8*, UInt8*, ITaskNamedValuePair*, HRESULT)
    remove : Proc(ITaskNamedValueCollection*, Int32, HRESULT)
    clear : Proc(ITaskNamedValueCollection*, HRESULT)
  end

  ITaskNamedValueCollection_GUID = "b4ef826b-63c3-46e4-a504-ef69e4f7ea4d"
  IID_ITaskNamedValueCollection = LibC::GUID.new(0xb4ef826b_u32, 0x63c3_u16, 0x46e4_u16, StaticArray[0xa5_u8, 0x4_u8, 0xef_u8, 0x69_u8, 0xe4_u8, 0xf7_u8, 0xea_u8, 0x4d_u8])
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
    get_name : Proc(IRunningTask*, UInt8**, HRESULT)
    get_instance_guid : Proc(IRunningTask*, UInt8**, HRESULT)
    get_path : Proc(IRunningTask*, UInt8**, HRESULT)
    get_state : Proc(IRunningTask*, TASK_STATE*, HRESULT)
    get_current_action : Proc(IRunningTask*, UInt8**, HRESULT)
    stop : Proc(IRunningTask*, HRESULT)
    refresh : Proc(IRunningTask*, HRESULT)
    get_engine_pid : Proc(IRunningTask*, UInt32*, HRESULT)
  end

  IRunningTask_GUID = "653758fb-7b9a-4f1e-a471-beeb8e9b834e"
  IID_IRunningTask = LibC::GUID.new(0x653758fb_u32, 0x7b9a_u16, 0x4f1e_u16, StaticArray[0xa4_u8, 0x71_u8, 0xbe_u8, 0xeb_u8, 0x8e_u8, 0x9b_u8, 0x83_u8, 0x4e_u8])
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

  IRunningTaskCollection_GUID = "6a67614b-6828-4fec-aa54-6d52e8f1f2db"
  IID_IRunningTaskCollection = LibC::GUID.new(0x6a67614b_u32, 0x6828_u16, 0x4fec_u16, StaticArray[0xaa_u8, 0x54_u8, 0x6d_u8, 0x52_u8, 0xe8_u8, 0xf1_u8, 0xf2_u8, 0xdb_u8])
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
    get_name : Proc(IRegisteredTask*, UInt8**, HRESULT)
    get_path : Proc(IRegisteredTask*, UInt8**, HRESULT)
    get_state : Proc(IRegisteredTask*, TASK_STATE*, HRESULT)
    get_enabled : Proc(IRegisteredTask*, Int16*, HRESULT)
    put_enabled : Proc(IRegisteredTask*, Int16, HRESULT)
    run : Proc(IRegisteredTask*, VARIANT, IRunningTask*, HRESULT)
    run_ex : Proc(IRegisteredTask*, VARIANT, Int32, Int32, UInt8*, IRunningTask*, HRESULT)
    get_instances : Proc(IRegisteredTask*, Int32, IRunningTaskCollection*, HRESULT)
    get_last_run_time : Proc(IRegisteredTask*, Float64*, HRESULT)
    get_last_task_result : Proc(IRegisteredTask*, Int32*, HRESULT)
    get_number_of_missed_runs : Proc(IRegisteredTask*, Int32*, HRESULT)
    get_next_run_time : Proc(IRegisteredTask*, Float64*, HRESULT)
    get_definition : Proc(IRegisteredTask*, ITaskDefinition*, HRESULT)
    get_xml : Proc(IRegisteredTask*, UInt8**, HRESULT)
    get_security_descriptor : Proc(IRegisteredTask*, Int32, UInt8**, HRESULT)
    set_security_descriptor : Proc(IRegisteredTask*, UInt8*, Int32, HRESULT)
    stop : Proc(IRegisteredTask*, Int32, HRESULT)
    get_run_times : Proc(IRegisteredTask*, SYSTEMTIME*, SYSTEMTIME*, UInt32*, SYSTEMTIME**, HRESULT)
  end

  IRegisteredTask_GUID = "9c86f320-dee3-4dd1-b972-a303f26b061e"
  IID_IRegisteredTask = LibC::GUID.new(0x9c86f320_u32, 0xdee3_u16, 0x4dd1_u16, StaticArray[0xb9_u8, 0x72_u8, 0xa3_u8, 0x3_u8, 0xf2_u8, 0x6b_u8, 0x6_u8, 0x1e_u8])
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
    get_id : Proc(ITrigger*, UInt8**, HRESULT)
    put_id : Proc(ITrigger*, UInt8*, HRESULT)
    get_repetition : Proc(ITrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ITrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ITrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(ITrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(ITrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(ITrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(ITrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(ITrigger*, UInt8*, HRESULT)
    get_enabled : Proc(ITrigger*, Int16*, HRESULT)
    put_enabled : Proc(ITrigger*, Int16, HRESULT)
  end

  ITrigger_GUID = "09941815-ea89-4b5b-89e0-2a773801fac3"
  IID_ITrigger = LibC::GUID.new(0x9941815_u32, 0xea89_u16, 0x4b5b_u16, StaticArray[0x89_u8, 0xe0_u8, 0x2a_u8, 0x77_u8, 0x38_u8, 0x1_u8, 0xfa_u8, 0xc3_u8])
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
    get_id : Proc(IIdleTrigger*, UInt8**, HRESULT)
    put_id : Proc(IIdleTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IIdleTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IIdleTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IIdleTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IIdleTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IIdleTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IIdleTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IIdleTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IIdleTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IIdleTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IIdleTrigger*, Int16, HRESULT)
  end

  IIdleTrigger_GUID = "d537d2b0-9fb3-4d34-9739-1ff5ce7b1ef3"
  IID_IIdleTrigger = LibC::GUID.new(0xd537d2b0_u32, 0x9fb3_u16, 0x4d34_u16, StaticArray[0x97_u8, 0x39_u8, 0x1f_u8, 0xf5_u8, 0xce_u8, 0x7b_u8, 0x1e_u8, 0xf3_u8])
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
    get_id : Proc(ILogonTrigger*, UInt8**, HRESULT)
    put_id : Proc(ILogonTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(ILogonTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ILogonTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ILogonTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(ILogonTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(ILogonTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(ILogonTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(ILogonTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(ILogonTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(ILogonTrigger*, Int16*, HRESULT)
    put_enabled : Proc(ILogonTrigger*, Int16, HRESULT)
    get_delay : Proc(ILogonTrigger*, UInt8**, HRESULT)
    put_delay : Proc(ILogonTrigger*, UInt8*, HRESULT)
    get_user_id : Proc(ILogonTrigger*, UInt8**, HRESULT)
    put_user_id : Proc(ILogonTrigger*, UInt8*, HRESULT)
  end

  ILogonTrigger_GUID = "72dade38-fae4-4b3e-baf4-5d009af02b1c"
  IID_ILogonTrigger = LibC::GUID.new(0x72dade38_u32, 0xfae4_u16, 0x4b3e_u16, StaticArray[0xba_u8, 0xf4_u8, 0x5d_u8, 0x0_u8, 0x9a_u8, 0xf0_u8, 0x2b_u8, 0x1c_u8])
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
    get_id : Proc(ISessionStateChangeTrigger*, UInt8**, HRESULT)
    put_id : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(ISessionStateChangeTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ISessionStateChangeTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ISessionStateChangeTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(ISessionStateChangeTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(ISessionStateChangeTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(ISessionStateChangeTrigger*, Int16*, HRESULT)
    put_enabled : Proc(ISessionStateChangeTrigger*, Int16, HRESULT)
    get_delay : Proc(ISessionStateChangeTrigger*, UInt8**, HRESULT)
    put_delay : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    get_user_id : Proc(ISessionStateChangeTrigger*, UInt8**, HRESULT)
    put_user_id : Proc(ISessionStateChangeTrigger*, UInt8*, HRESULT)
    get_state_change : Proc(ISessionStateChangeTrigger*, TASK_SESSION_STATE_CHANGE_TYPE*, HRESULT)
    put_state_change : Proc(ISessionStateChangeTrigger*, TASK_SESSION_STATE_CHANGE_TYPE, HRESULT)
  end

  ISessionStateChangeTrigger_GUID = "754da71b-4385-4475-9dd9-598294fa3641"
  IID_ISessionStateChangeTrigger = LibC::GUID.new(0x754da71b_u32, 0x4385_u16, 0x4475_u16, StaticArray[0x9d_u8, 0xd9_u8, 0x59_u8, 0x82_u8, 0x94_u8, 0xfa_u8, 0x36_u8, 0x41_u8])
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
    get_id : Proc(IEventTrigger*, UInt8**, HRESULT)
    put_id : Proc(IEventTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IEventTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IEventTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IEventTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IEventTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IEventTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IEventTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IEventTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IEventTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IEventTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IEventTrigger*, Int16, HRESULT)
    get_subscription : Proc(IEventTrigger*, UInt8**, HRESULT)
    put_subscription : Proc(IEventTrigger*, UInt8*, HRESULT)
    get_delay : Proc(IEventTrigger*, UInt8**, HRESULT)
    put_delay : Proc(IEventTrigger*, UInt8*, HRESULT)
    get_value_queries : Proc(IEventTrigger*, ITaskNamedValueCollection*, HRESULT)
    put_value_queries : Proc(IEventTrigger*, ITaskNamedValueCollection, HRESULT)
  end

  IEventTrigger_GUID = "d45b0167-9653-4eef-b94f-0732ca7af251"
  IID_IEventTrigger = LibC::GUID.new(0xd45b0167_u32, 0x9653_u16, 0x4eef_u16, StaticArray[0xb9_u8, 0x4f_u8, 0x7_u8, 0x32_u8, 0xca_u8, 0x7a_u8, 0xf2_u8, 0x51_u8])
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
    get_id : Proc(ITimeTrigger*, UInt8**, HRESULT)
    put_id : Proc(ITimeTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(ITimeTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(ITimeTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(ITimeTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(ITimeTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(ITimeTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(ITimeTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(ITimeTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(ITimeTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(ITimeTrigger*, Int16*, HRESULT)
    put_enabled : Proc(ITimeTrigger*, Int16, HRESULT)
    get_random_delay : Proc(ITimeTrigger*, UInt8**, HRESULT)
    put_random_delay : Proc(ITimeTrigger*, UInt8*, HRESULT)
  end

  ITimeTrigger_GUID = "b45747e0-eba7-4276-9f29-85c5bb300006"
  IID_ITimeTrigger = LibC::GUID.new(0xb45747e0_u32, 0xeba7_u16, 0x4276_u16, StaticArray[0x9f_u8, 0x29_u8, 0x85_u8, 0xc5_u8, 0xbb_u8, 0x30_u8, 0x0_u8, 0x6_u8])
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
    get_id : Proc(IDailyTrigger*, UInt8**, HRESULT)
    put_id : Proc(IDailyTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IDailyTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IDailyTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IDailyTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IDailyTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IDailyTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IDailyTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IDailyTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IDailyTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IDailyTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IDailyTrigger*, Int16, HRESULT)
    get_days_interval : Proc(IDailyTrigger*, Int16*, HRESULT)
    put_days_interval : Proc(IDailyTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IDailyTrigger*, UInt8**, HRESULT)
    put_random_delay : Proc(IDailyTrigger*, UInt8*, HRESULT)
  end

  IDailyTrigger_GUID = "126c5cd8-b288-41d5-8dbf-e491446adc5c"
  IID_IDailyTrigger = LibC::GUID.new(0x126c5cd8_u32, 0xb288_u16, 0x41d5_u16, StaticArray[0x8d_u8, 0xbf_u8, 0xe4_u8, 0x91_u8, 0x44_u8, 0x6a_u8, 0xdc_u8, 0x5c_u8])
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
    get_id : Proc(IWeeklyTrigger*, UInt8**, HRESULT)
    put_id : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IWeeklyTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IWeeklyTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IWeeklyTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IWeeklyTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IWeeklyTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IWeeklyTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IWeeklyTrigger*, Int16, HRESULT)
    get_days_of_week : Proc(IWeeklyTrigger*, Int16*, HRESULT)
    put_days_of_week : Proc(IWeeklyTrigger*, Int16, HRESULT)
    get_weeks_interval : Proc(IWeeklyTrigger*, Int16*, HRESULT)
    put_weeks_interval : Proc(IWeeklyTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IWeeklyTrigger*, UInt8**, HRESULT)
    put_random_delay : Proc(IWeeklyTrigger*, UInt8*, HRESULT)
  end

  IWeeklyTrigger_GUID = "5038fc98-82ff-436d-8728-a512a57c9dc1"
  IID_IWeeklyTrigger = LibC::GUID.new(0x5038fc98_u32, 0x82ff_u16, 0x436d_u16, StaticArray[0x87_u8, 0x28_u8, 0xa5_u8, 0x12_u8, 0xa5_u8, 0x7c_u8, 0x9d_u8, 0xc1_u8])
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
    get_id : Proc(IMonthlyTrigger*, UInt8**, HRESULT)
    put_id : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IMonthlyTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IMonthlyTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IMonthlyTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IMonthlyTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IMonthlyTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IMonthlyTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IMonthlyTrigger*, Int16, HRESULT)
    get_days_of_month : Proc(IMonthlyTrigger*, Int32*, HRESULT)
    put_days_of_month : Proc(IMonthlyTrigger*, Int32, HRESULT)
    get_months_of_year : Proc(IMonthlyTrigger*, Int16*, HRESULT)
    put_months_of_year : Proc(IMonthlyTrigger*, Int16, HRESULT)
    get_run_on_last_day_of_month : Proc(IMonthlyTrigger*, Int16*, HRESULT)
    put_run_on_last_day_of_month : Proc(IMonthlyTrigger*, Int16, HRESULT)
    get_random_delay : Proc(IMonthlyTrigger*, UInt8**, HRESULT)
    put_random_delay : Proc(IMonthlyTrigger*, UInt8*, HRESULT)
  end

  IMonthlyTrigger_GUID = "97c45ef1-6b02-4a1a-9c0e-1ebfba1500ac"
  IID_IMonthlyTrigger = LibC::GUID.new(0x97c45ef1_u32, 0x6b02_u16, 0x4a1a_u16, StaticArray[0x9c_u8, 0xe_u8, 0x1e_u8, 0xbf_u8, 0xba_u8, 0x15_u8, 0x0_u8, 0xac_u8])
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
    get_id : Proc(IMonthlyDOWTrigger*, UInt8**, HRESULT)
    put_id : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IMonthlyDOWTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IMonthlyDOWTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IMonthlyDOWTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IMonthlyDOWTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IMonthlyDOWTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
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
    get_random_delay : Proc(IMonthlyDOWTrigger*, UInt8**, HRESULT)
    put_random_delay : Proc(IMonthlyDOWTrigger*, UInt8*, HRESULT)
  end

  IMonthlyDOWTrigger_GUID = "77d025a3-90fa-43aa-b52e-cda5499b946a"
  IID_IMonthlyDOWTrigger = LibC::GUID.new(0x77d025a3_u32, 0x90fa_u16, 0x43aa_u16, StaticArray[0xb5_u8, 0x2e_u8, 0xcd_u8, 0xa5_u8, 0x49_u8, 0x9b_u8, 0x94_u8, 0x6a_u8])
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
    get_id : Proc(IBootTrigger*, UInt8**, HRESULT)
    put_id : Proc(IBootTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IBootTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IBootTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IBootTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IBootTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IBootTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IBootTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IBootTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IBootTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IBootTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IBootTrigger*, Int16, HRESULT)
    get_delay : Proc(IBootTrigger*, UInt8**, HRESULT)
    put_delay : Proc(IBootTrigger*, UInt8*, HRESULT)
  end

  IBootTrigger_GUID = "2a9c35da-d357-41f4-bbc1-207ac1b1f3cb"
  IID_IBootTrigger = LibC::GUID.new(0x2a9c35da_u32, 0xd357_u16, 0x41f4_u16, StaticArray[0xbb_u8, 0xc1_u8, 0x20_u8, 0x7a_u8, 0xc1_u8, 0xb1_u8, 0xf3_u8, 0xcb_u8])
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
    get_id : Proc(IRegistrationTrigger*, UInt8**, HRESULT)
    put_id : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    get_repetition : Proc(IRegistrationTrigger*, IRepetitionPattern*, HRESULT)
    put_repetition : Proc(IRegistrationTrigger*, IRepetitionPattern, HRESULT)
    get_execution_time_limit : Proc(IRegistrationTrigger*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    get_start_boundary : Proc(IRegistrationTrigger*, UInt8**, HRESULT)
    put_start_boundary : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    get_end_boundary : Proc(IRegistrationTrigger*, UInt8**, HRESULT)
    put_end_boundary : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
    get_enabled : Proc(IRegistrationTrigger*, Int16*, HRESULT)
    put_enabled : Proc(IRegistrationTrigger*, Int16, HRESULT)
    get_delay : Proc(IRegistrationTrigger*, UInt8**, HRESULT)
    put_delay : Proc(IRegistrationTrigger*, UInt8*, HRESULT)
  end

  IRegistrationTrigger_GUID = "4c8fec3a-c218-4e0c-b23d-629024db91a2"
  IID_IRegistrationTrigger = LibC::GUID.new(0x4c8fec3a_u32, 0xc218_u16, 0x4e0c_u16, StaticArray[0xb2_u8, 0x3d_u8, 0x62_u8, 0x90_u8, 0x24_u8, 0xdb_u8, 0x91_u8, 0xa2_u8])
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
    get_id : Proc(IAction*, UInt8**, HRESULT)
    put_id : Proc(IAction*, UInt8*, HRESULT)
    get_type : Proc(IAction*, TASK_ACTION_TYPE*, HRESULT)
  end

  IAction_GUID = "bae54997-48b1-4cbe-9965-d6be263ebea4"
  IID_IAction = LibC::GUID.new(0xbae54997_u32, 0x48b1_u16, 0x4cbe_u16, StaticArray[0x99_u8, 0x65_u8, 0xd6_u8, 0xbe_u8, 0x26_u8, 0x3e_u8, 0xbe_u8, 0xa4_u8])
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
    get_id : Proc(IExecAction*, UInt8**, HRESULT)
    put_id : Proc(IExecAction*, UInt8*, HRESULT)
    get_type : Proc(IExecAction*, TASK_ACTION_TYPE*, HRESULT)
    get_path : Proc(IExecAction*, UInt8**, HRESULT)
    put_path : Proc(IExecAction*, UInt8*, HRESULT)
    get_arguments : Proc(IExecAction*, UInt8**, HRESULT)
    put_arguments : Proc(IExecAction*, UInt8*, HRESULT)
    get_working_directory : Proc(IExecAction*, UInt8**, HRESULT)
    put_working_directory : Proc(IExecAction*, UInt8*, HRESULT)
  end

  IExecAction_GUID = "4c3d624d-fd6b-49a3-b9b7-09cb3cd3f047"
  IID_IExecAction = LibC::GUID.new(0x4c3d624d_u32, 0xfd6b_u16, 0x49a3_u16, StaticArray[0xb9_u8, 0xb7_u8, 0x9_u8, 0xcb_u8, 0x3c_u8, 0xd3_u8, 0xf0_u8, 0x47_u8])
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
    get_id : Proc(IExecAction2*, UInt8**, HRESULT)
    put_id : Proc(IExecAction2*, UInt8*, HRESULT)
    get_type : Proc(IExecAction2*, TASK_ACTION_TYPE*, HRESULT)
    get_path : Proc(IExecAction2*, UInt8**, HRESULT)
    put_path : Proc(IExecAction2*, UInt8*, HRESULT)
    get_arguments : Proc(IExecAction2*, UInt8**, HRESULT)
    put_arguments : Proc(IExecAction2*, UInt8*, HRESULT)
    get_working_directory : Proc(IExecAction2*, UInt8**, HRESULT)
    put_working_directory : Proc(IExecAction2*, UInt8*, HRESULT)
    get_hide_app_window : Proc(IExecAction2*, Int16*, HRESULT)
    put_hide_app_window : Proc(IExecAction2*, Int16, HRESULT)
  end

  IExecAction2_GUID = "f2a82542-bda5-4e6b-9143-e2bf4f8987b6"
  IID_IExecAction2 = LibC::GUID.new(0xf2a82542_u32, 0xbda5_u16, 0x4e6b_u16, StaticArray[0x91_u8, 0x43_u8, 0xe2_u8, 0xbf_u8, 0x4f_u8, 0x89_u8, 0x87_u8, 0xb6_u8])
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
    get_id : Proc(IShowMessageAction*, UInt8**, HRESULT)
    put_id : Proc(IShowMessageAction*, UInt8*, HRESULT)
    get_type : Proc(IShowMessageAction*, TASK_ACTION_TYPE*, HRESULT)
    get_title : Proc(IShowMessageAction*, UInt8**, HRESULT)
    put_title : Proc(IShowMessageAction*, UInt8*, HRESULT)
    get_message_body : Proc(IShowMessageAction*, UInt8**, HRESULT)
    put_message_body : Proc(IShowMessageAction*, UInt8*, HRESULT)
  end

  IShowMessageAction_GUID = "505e9e68-af89-46b8-a30f-56162a83d537"
  IID_IShowMessageAction = LibC::GUID.new(0x505e9e68_u32, 0xaf89_u16, 0x46b8_u16, StaticArray[0xa3_u8, 0xf_u8, 0x56_u8, 0x16_u8, 0x2a_u8, 0x83_u8, 0xd5_u8, 0x37_u8])
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
    get_id : Proc(IComHandlerAction*, UInt8**, HRESULT)
    put_id : Proc(IComHandlerAction*, UInt8*, HRESULT)
    get_type : Proc(IComHandlerAction*, TASK_ACTION_TYPE*, HRESULT)
    get_class_id : Proc(IComHandlerAction*, UInt8**, HRESULT)
    put_class_id : Proc(IComHandlerAction*, UInt8*, HRESULT)
    get_data : Proc(IComHandlerAction*, UInt8**, HRESULT)
    put_data : Proc(IComHandlerAction*, UInt8*, HRESULT)
  end

  IComHandlerAction_GUID = "6d2fd252-75c5-4f66-90ba-2a7d8cc3039f"
  IID_IComHandlerAction = LibC::GUID.new(0x6d2fd252_u32, 0x75c5_u16, 0x4f66_u16, StaticArray[0x90_u8, 0xba_u8, 0x2a_u8, 0x7d_u8, 0x8c_u8, 0xc3_u8, 0x3_u8, 0x9f_u8])
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
    get_id : Proc(IEmailAction*, UInt8**, HRESULT)
    put_id : Proc(IEmailAction*, UInt8*, HRESULT)
    get_type : Proc(IEmailAction*, TASK_ACTION_TYPE*, HRESULT)
    get_server : Proc(IEmailAction*, UInt8**, HRESULT)
    put_server : Proc(IEmailAction*, UInt8*, HRESULT)
    get_subject : Proc(IEmailAction*, UInt8**, HRESULT)
    put_subject : Proc(IEmailAction*, UInt8*, HRESULT)
    get_to : Proc(IEmailAction*, UInt8**, HRESULT)
    put_to : Proc(IEmailAction*, UInt8*, HRESULT)
    get_cc : Proc(IEmailAction*, UInt8**, HRESULT)
    put_cc : Proc(IEmailAction*, UInt8*, HRESULT)
    get_bcc : Proc(IEmailAction*, UInt8**, HRESULT)
    put_bcc : Proc(IEmailAction*, UInt8*, HRESULT)
    get_reply_to : Proc(IEmailAction*, UInt8**, HRESULT)
    put_reply_to : Proc(IEmailAction*, UInt8*, HRESULT)
    get_from : Proc(IEmailAction*, UInt8**, HRESULT)
    put_from : Proc(IEmailAction*, UInt8*, HRESULT)
    get_header_fields : Proc(IEmailAction*, ITaskNamedValueCollection*, HRESULT)
    put_header_fields : Proc(IEmailAction*, ITaskNamedValueCollection, HRESULT)
    get_body : Proc(IEmailAction*, UInt8**, HRESULT)
    put_body : Proc(IEmailAction*, UInt8*, HRESULT)
    get_attachments : Proc(IEmailAction*, SAFEARRAY**, HRESULT)
    put_attachments : Proc(IEmailAction*, SAFEARRAY*, HRESULT)
  end

  IEmailAction_GUID = "10f62c64-7e16-4314-a0c2-0c3683f99d40"
  IID_IEmailAction = LibC::GUID.new(0x10f62c64_u32, 0x7e16_u16, 0x4314_u16, StaticArray[0xa0_u8, 0xc2_u8, 0xc_u8, 0x36_u8, 0x83_u8, 0xf9_u8, 0x9d_u8, 0x40_u8])
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

  ITriggerCollection_GUID = "85df5081-1b24-4f32-878a-d9d14df4cb77"
  IID_ITriggerCollection = LibC::GUID.new(0x85df5081_u32, 0x1b24_u16, 0x4f32_u16, StaticArray[0x87_u8, 0x8a_u8, 0xd9_u8, 0xd1_u8, 0x4d_u8, 0xf4_u8, 0xcb_u8, 0x77_u8])
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
    get_xml_text : Proc(IActionCollection*, UInt8**, HRESULT)
    put_xml_text : Proc(IActionCollection*, UInt8*, HRESULT)
    create : Proc(IActionCollection*, TASK_ACTION_TYPE, IAction*, HRESULT)
    remove : Proc(IActionCollection*, VARIANT, HRESULT)
    clear : Proc(IActionCollection*, HRESULT)
    get_context : Proc(IActionCollection*, UInt8**, HRESULT)
    put_context : Proc(IActionCollection*, UInt8*, HRESULT)
  end

  IActionCollection_GUID = "02820e19-7b98-4ed2-b2e8-fdccceff619b"
  IID_IActionCollection = LibC::GUID.new(0x2820e19_u32, 0x7b98_u16, 0x4ed2_u16, StaticArray[0xb2_u8, 0xe8_u8, 0xfd_u8, 0xcc_u8, 0xce_u8, 0xff_u8, 0x61_u8, 0x9b_u8])
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
    get_id : Proc(IPrincipal*, UInt8**, HRESULT)
    put_id : Proc(IPrincipal*, UInt8*, HRESULT)
    get_display_name : Proc(IPrincipal*, UInt8**, HRESULT)
    put_display_name : Proc(IPrincipal*, UInt8*, HRESULT)
    get_user_id : Proc(IPrincipal*, UInt8**, HRESULT)
    put_user_id : Proc(IPrincipal*, UInt8*, HRESULT)
    get_logon_type : Proc(IPrincipal*, TASK_LOGON_TYPE*, HRESULT)
    put_logon_type : Proc(IPrincipal*, TASK_LOGON_TYPE, HRESULT)
    get_group_id : Proc(IPrincipal*, UInt8**, HRESULT)
    put_group_id : Proc(IPrincipal*, UInt8*, HRESULT)
    get_run_level : Proc(IPrincipal*, TASK_RUNLEVEL_TYPE*, HRESULT)
    put_run_level : Proc(IPrincipal*, TASK_RUNLEVEL_TYPE, HRESULT)
  end

  IPrincipal_GUID = "d98d51e5-c9b4-496a-a9c1-18980261cf0f"
  IID_IPrincipal = LibC::GUID.new(0xd98d51e5_u32, 0xc9b4_u16, 0x496a_u16, StaticArray[0xa9_u8, 0xc1_u8, 0x18_u8, 0x98_u8, 0x2_u8, 0x61_u8, 0xcf_u8, 0xf_u8])
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
    get_required_privilege : Proc(IPrincipal2*, Int32, UInt8**, HRESULT)
    add_required_privilege : Proc(IPrincipal2*, UInt8*, HRESULT)
  end

  IPrincipal2_GUID = "248919ae-e345-4a6d-8aeb-e0d3165c904e"
  IID_IPrincipal2 = LibC::GUID.new(0x248919ae_u32, 0xe345_u16, 0x4a6d_u16, StaticArray[0x8a_u8, 0xeb_u8, 0xe0_u8, 0xd3_u8, 0x16_u8, 0x5c_u8, 0x90_u8, 0x4e_u8])
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
    get_description : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_description : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_author : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_author : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_version : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_version : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_date : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_date : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_documentation : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_documentation : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_xml_text : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_xml_text : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_uri : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_uri : Proc(IRegistrationInfo*, UInt8*, HRESULT)
    get_security_descriptor : Proc(IRegistrationInfo*, VARIANT*, HRESULT)
    put_security_descriptor : Proc(IRegistrationInfo*, VARIANT, HRESULT)
    get_source : Proc(IRegistrationInfo*, UInt8**, HRESULT)
    put_source : Proc(IRegistrationInfo*, UInt8*, HRESULT)
  end

  IRegistrationInfo_GUID = "416d8b73-cb41-4ea1-805c-9be9a5ac4a74"
  IID_IRegistrationInfo = LibC::GUID.new(0x416d8b73_u32, 0xcb41_u16, 0x4ea1_u16, StaticArray[0x80_u8, 0x5c_u8, 0x9b_u8, 0xe9_u8, 0xa5_u8, 0xac_u8, 0x4a_u8, 0x74_u8])
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
    get_data : Proc(ITaskDefinition*, UInt8**, HRESULT)
    put_data : Proc(ITaskDefinition*, UInt8*, HRESULT)
    get_principal : Proc(ITaskDefinition*, IPrincipal*, HRESULT)
    put_principal : Proc(ITaskDefinition*, IPrincipal, HRESULT)
    get_actions : Proc(ITaskDefinition*, IActionCollection*, HRESULT)
    put_actions : Proc(ITaskDefinition*, IActionCollection, HRESULT)
    get_xml_text : Proc(ITaskDefinition*, UInt8**, HRESULT)
    put_xml_text : Proc(ITaskDefinition*, UInt8*, HRESULT)
  end

  ITaskDefinition_GUID = "f5bc8fc5-536d-4f77-b852-fbc1356fdeb6"
  IID_ITaskDefinition = LibC::GUID.new(0xf5bc8fc5_u32, 0x536d_u16, 0x4f77_u16, StaticArray[0xb8_u8, 0x52_u8, 0xfb_u8, 0xc1_u8, 0x35_u8, 0x6f_u8, 0xde_u8, 0xb6_u8])
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
    get_restart_interval : Proc(ITaskSettings*, UInt8**, HRESULT)
    put_restart_interval : Proc(ITaskSettings*, UInt8*, HRESULT)
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
    get_xml_text : Proc(ITaskSettings*, UInt8**, HRESULT)
    put_xml_text : Proc(ITaskSettings*, UInt8*, HRESULT)
    get_run_only_if_network_available : Proc(ITaskSettings*, Int16*, HRESULT)
    put_run_only_if_network_available : Proc(ITaskSettings*, Int16, HRESULT)
    get_execution_time_limit : Proc(ITaskSettings*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(ITaskSettings*, UInt8*, HRESULT)
    get_enabled : Proc(ITaskSettings*, Int16*, HRESULT)
    put_enabled : Proc(ITaskSettings*, Int16, HRESULT)
    get_delete_expired_task_after : Proc(ITaskSettings*, UInt8**, HRESULT)
    put_delete_expired_task_after : Proc(ITaskSettings*, UInt8*, HRESULT)
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

  ITaskSettings_GUID = "8fd4711d-2d02-4c8c-87e3-eff699de127e"
  IID_ITaskSettings = LibC::GUID.new(0x8fd4711d_u32, 0x2d02_u16, 0x4c8c_u16, StaticArray[0x87_u8, 0xe3_u8, 0xef_u8, 0xf6_u8, 0x99_u8, 0xde_u8, 0x12_u8, 0x7e_u8])
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

  ITaskSettings2_GUID = "2c05c3f0-6eed-4c05-a15f-ed7d7a98a369"
  IID_ITaskSettings2 = LibC::GUID.new(0x2c05c3f0_u32, 0x6eed_u16, 0x4c05_u16, StaticArray[0xa1_u8, 0x5f_u8, 0xed_u8, 0x7d_u8, 0x7a_u8, 0x98_u8, 0xa3_u8, 0x69_u8])
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
    get_restart_interval : Proc(ITaskSettings3*, UInt8**, HRESULT)
    put_restart_interval : Proc(ITaskSettings3*, UInt8*, HRESULT)
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
    get_xml_text : Proc(ITaskSettings3*, UInt8**, HRESULT)
    put_xml_text : Proc(ITaskSettings3*, UInt8*, HRESULT)
    get_run_only_if_network_available : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_run_only_if_network_available : Proc(ITaskSettings3*, Int16, HRESULT)
    get_execution_time_limit : Proc(ITaskSettings3*, UInt8**, HRESULT)
    put_execution_time_limit : Proc(ITaskSettings3*, UInt8*, HRESULT)
    get_enabled : Proc(ITaskSettings3*, Int16*, HRESULT)
    put_enabled : Proc(ITaskSettings3*, Int16, HRESULT)
    get_delete_expired_task_after : Proc(ITaskSettings3*, UInt8**, HRESULT)
    put_delete_expired_task_after : Proc(ITaskSettings3*, UInt8*, HRESULT)
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

  ITaskSettings3_GUID = "0ad9d0d7-0c7f-4ebb-9a5f-d1c648dca528"
  IID_ITaskSettings3 = LibC::GUID.new(0xad9d0d7_u32, 0xc7f_u16, 0x4ebb_u16, StaticArray[0x9a_u8, 0x5f_u8, 0xd1_u8, 0xc6_u8, 0x48_u8, 0xdc_u8, 0xa5_u8, 0x28_u8])
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
    put_period : Proc(IMaintenanceSettings*, UInt8*, HRESULT)
    get_period : Proc(IMaintenanceSettings*, UInt8**, HRESULT)
    put_deadline : Proc(IMaintenanceSettings*, UInt8*, HRESULT)
    get_deadline : Proc(IMaintenanceSettings*, UInt8**, HRESULT)
    put_exclusive : Proc(IMaintenanceSettings*, Int16, HRESULT)
    get_exclusive : Proc(IMaintenanceSettings*, Int16*, HRESULT)
  end

  IMaintenanceSettings_GUID = "a6024fa8-9652-4adb-a6bf-5cfcd877a7ba"
  IID_IMaintenanceSettings = LibC::GUID.new(0xa6024fa8_u32, 0x9652_u16, 0x4adb_u16, StaticArray[0xa6_u8, 0xbf_u8, 0x5c_u8, 0xfc_u8, 0xd8_u8, 0x77_u8, 0xa7_u8, 0xba_u8])
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

  IRegisteredTaskCollection_GUID = "86627eb4-42a7-41e4-a4d9-ac33a72f2d52"
  IID_IRegisteredTaskCollection = LibC::GUID.new(0x86627eb4_u32, 0x42a7_u16, 0x41e4_u16, StaticArray[0xa4_u8, 0xd9_u8, 0xac_u8, 0x33_u8, 0xa7_u8, 0x2f_u8, 0x2d_u8, 0x52_u8])
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
    get_name : Proc(ITaskFolder*, UInt8**, HRESULT)
    get_path : Proc(ITaskFolder*, UInt8**, HRESULT)
    get_folder : Proc(ITaskFolder*, UInt8*, ITaskFolder*, HRESULT)
    get_folders : Proc(ITaskFolder*, Int32, ITaskFolderCollection*, HRESULT)
    create_folder : Proc(ITaskFolder*, UInt8*, VARIANT, ITaskFolder*, HRESULT)
    delete_folder : Proc(ITaskFolder*, UInt8*, Int32, HRESULT)
    get_task : Proc(ITaskFolder*, UInt8*, IRegisteredTask*, HRESULT)
    get_tasks : Proc(ITaskFolder*, Int32, IRegisteredTaskCollection*, HRESULT)
    delete_task : Proc(ITaskFolder*, UInt8*, Int32, HRESULT)
    register_task : Proc(ITaskFolder*, UInt8*, UInt8*, Int32, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*, HRESULT)
    register_task_definition : Proc(ITaskFolder*, UInt8*, ITaskDefinition, Int32, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*, HRESULT)
    get_security_descriptor : Proc(ITaskFolder*, Int32, UInt8**, HRESULT)
    set_security_descriptor : Proc(ITaskFolder*, UInt8*, Int32, HRESULT)
  end

  ITaskFolder_GUID = "8cfac062-a080-4c15-9a88-aa7c2af80dfc"
  IID_ITaskFolder = LibC::GUID.new(0x8cfac062_u32, 0xa080_u16, 0x4c15_u16, StaticArray[0x9a_u8, 0x88_u8, 0xaa_u8, 0x7c_u8, 0x2a_u8, 0xf8_u8, 0xd_u8, 0xfc_u8])
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
    get_idle_duration : Proc(IIdleSettings*, UInt8**, HRESULT)
    put_idle_duration : Proc(IIdleSettings*, UInt8*, HRESULT)
    get_wait_timeout : Proc(IIdleSettings*, UInt8**, HRESULT)
    put_wait_timeout : Proc(IIdleSettings*, UInt8*, HRESULT)
    get_stop_on_idle_end : Proc(IIdleSettings*, Int16*, HRESULT)
    put_stop_on_idle_end : Proc(IIdleSettings*, Int16, HRESULT)
    get_restart_on_idle : Proc(IIdleSettings*, Int16*, HRESULT)
    put_restart_on_idle : Proc(IIdleSettings*, Int16, HRESULT)
  end

  IIdleSettings_GUID = "84594461-0053-4342-a8fd-088fabf11f32"
  IID_IIdleSettings = LibC::GUID.new(0x84594461_u32, 0x53_u16, 0x4342_u16, StaticArray[0xa8_u8, 0xfd_u8, 0x8_u8, 0x8f_u8, 0xab_u8, 0xf1_u8, 0x1f_u8, 0x32_u8])
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
    get_name : Proc(INetworkSettings*, UInt8**, HRESULT)
    put_name : Proc(INetworkSettings*, UInt8*, HRESULT)
    get_id : Proc(INetworkSettings*, UInt8**, HRESULT)
    put_id : Proc(INetworkSettings*, UInt8*, HRESULT)
  end

  INetworkSettings_GUID = "9f7dea84-c30b-4245-80b6-00e9f646f1b4"
  IID_INetworkSettings = LibC::GUID.new(0x9f7dea84_u32, 0xc30b_u16, 0x4245_u16, StaticArray[0x80_u8, 0xb6_u8, 0x0_u8, 0xe9_u8, 0xf6_u8, 0x46_u8, 0xf1_u8, 0xb4_u8])
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
    get_interval : Proc(IRepetitionPattern*, UInt8**, HRESULT)
    put_interval : Proc(IRepetitionPattern*, UInt8*, HRESULT)
    get_duration : Proc(IRepetitionPattern*, UInt8**, HRESULT)
    put_duration : Proc(IRepetitionPattern*, UInt8*, HRESULT)
    get_stop_at_duration_end : Proc(IRepetitionPattern*, Int16*, HRESULT)
    put_stop_at_duration_end : Proc(IRepetitionPattern*, Int16, HRESULT)
  end

  IRepetitionPattern_GUID = "7fb9acf1-26be-400e-85b5-294b9c75dfd6"
  IID_IRepetitionPattern = LibC::GUID.new(0x7fb9acf1_u32, 0x26be_u16, 0x400e_u16, StaticArray[0x85_u8, 0xb5_u8, 0x29_u8, 0x4b_u8, 0x9c_u8, 0x75_u8, 0xdf_u8, 0xd6_u8])
  struct IRepetitionPattern
    lpVtbl : IRepetitionPatternVTbl*
  end

end
struct LibWin32::ITaskTrigger
  def query_interface(this : ITaskTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_trigger(this : ITaskTrigger*, ptrigger : TASK_TRIGGER*) : HRESULT
    @lpVtbl.value.set_trigger.call(this, ptrigger)
  end
  def get_trigger(this : ITaskTrigger*, ptrigger : TASK_TRIGGER*) : HRESULT
    @lpVtbl.value.get_trigger.call(this, ptrigger)
  end
  def get_trigger_string(this : ITaskTrigger*, ppwsztrigger : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_trigger_string.call(this, ppwsztrigger)
  end
end
struct LibWin32::IScheduledWorkItem
  def query_interface(this : IScheduledWorkItem*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IScheduledWorkItem*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IScheduledWorkItem*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_trigger(this : IScheduledWorkItem*, pinewtrigger : UInt16*, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.create_trigger.call(this, pinewtrigger, pptrigger)
  end
  def delete_trigger(this : IScheduledWorkItem*, itrigger : UInt16) : HRESULT
    @lpVtbl.value.delete_trigger.call(this, itrigger)
  end
  def get_trigger_count(this : IScheduledWorkItem*, pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_trigger_count.call(this, pwcount)
  end
  def get_trigger(this : IScheduledWorkItem*, itrigger : UInt16, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.get_trigger.call(this, itrigger, pptrigger)
  end
  def get_trigger_string(this : IScheduledWorkItem*, itrigger : UInt16, ppwsztrigger : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_trigger_string.call(this, itrigger, ppwsztrigger)
  end
  def get_run_times(this : IScheduledWorkItem*, pstbegin : SYSTEMTIME*, pstend : SYSTEMTIME*, pcount : UInt16*, rgsttasktimes : SYSTEMTIME**) : HRESULT
    @lpVtbl.value.get_run_times.call(this, pstbegin, pstend, pcount, rgsttasktimes)
  end
  def get_next_run_time(this : IScheduledWorkItem*, pstnextrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_next_run_time.call(this, pstnextrun)
  end
  def set_idle_wait(this : IScheduledWorkItem*, widleminutes : UInt16, wdeadlineminutes : UInt16) : HRESULT
    @lpVtbl.value.set_idle_wait.call(this, widleminutes, wdeadlineminutes)
  end
  def get_idle_wait(this : IScheduledWorkItem*, pwidleminutes : UInt16*, pwdeadlineminutes : UInt16*) : HRESULT
    @lpVtbl.value.get_idle_wait.call(this, pwidleminutes, pwdeadlineminutes)
  end
  def run(this : IScheduledWorkItem*) : HRESULT
    @lpVtbl.value.run.call(this)
  end
  def terminate(this : IScheduledWorkItem*) : HRESULT
    @lpVtbl.value.terminate.call(this)
  end
  def edit_work_item(this : IScheduledWorkItem*, hparent : LibC::HANDLE, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.edit_work_item.call(this, hparent, dwreserved)
  end
  def get_most_recent_run_time(this : IScheduledWorkItem*, pstlastrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_most_recent_run_time.call(this, pstlastrun)
  end
  def get_status(this : IScheduledWorkItem*, phrstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.call(this, phrstatus)
  end
  def get_exit_code(this : IScheduledWorkItem*, pdwexitcode : UInt32*) : HRESULT
    @lpVtbl.value.get_exit_code.call(this, pdwexitcode)
  end
  def set_comment(this : IScheduledWorkItem*, pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_comment.call(this, pwszcomment)
  end
  def get_comment(this : IScheduledWorkItem*, ppwszcomment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_comment.call(this, ppwszcomment)
  end
  def set_creator(this : IScheduledWorkItem*, pwszcreator : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_creator.call(this, pwszcreator)
  end
  def get_creator(this : IScheduledWorkItem*, ppwszcreator : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_creator.call(this, ppwszcreator)
  end
  def set_work_item_data(this : IScheduledWorkItem*, cbdata : UInt16, rgbdata : UInt8*) : HRESULT
    @lpVtbl.value.set_work_item_data.call(this, cbdata, rgbdata)
  end
  def get_work_item_data(this : IScheduledWorkItem*, pcbdata : UInt16*, prgbdata : UInt8**) : HRESULT
    @lpVtbl.value.get_work_item_data.call(this, pcbdata, prgbdata)
  end
  def set_error_retry_count(this : IScheduledWorkItem*, wretrycount : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_count.call(this, wretrycount)
  end
  def get_error_retry_count(this : IScheduledWorkItem*, pwretrycount : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_count.call(this, pwretrycount)
  end
  def set_error_retry_interval(this : IScheduledWorkItem*, wretryinterval : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_interval.call(this, wretryinterval)
  end
  def get_error_retry_interval(this : IScheduledWorkItem*, pwretryinterval : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_interval.call(this, pwretryinterval)
  end
  def set_flags(this : IScheduledWorkItem*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.call(this, dwflags)
  end
  def get_flags(this : IScheduledWorkItem*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pdwflags)
  end
  def set_account_information(this : IScheduledWorkItem*, pwszaccountname : LibC::LPWSTR, pwszpassword : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_account_information.call(this, pwszaccountname, pwszpassword)
  end
  def get_account_information(this : IScheduledWorkItem*, ppwszaccountname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_information.call(this, ppwszaccountname)
  end
end
struct LibWin32::ITask
  def query_interface(this : ITask*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITask*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITask*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_trigger(this : ITask*, pinewtrigger : UInt16*, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.create_trigger.call(this, pinewtrigger, pptrigger)
  end
  def delete_trigger(this : ITask*, itrigger : UInt16) : HRESULT
    @lpVtbl.value.delete_trigger.call(this, itrigger)
  end
  def get_trigger_count(this : ITask*, pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_trigger_count.call(this, pwcount)
  end
  def get_trigger(this : ITask*, itrigger : UInt16, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.get_trigger.call(this, itrigger, pptrigger)
  end
  def get_trigger_string(this : ITask*, itrigger : UInt16, ppwsztrigger : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_trigger_string.call(this, itrigger, ppwsztrigger)
  end
  def get_run_times(this : ITask*, pstbegin : SYSTEMTIME*, pstend : SYSTEMTIME*, pcount : UInt16*, rgsttasktimes : SYSTEMTIME**) : HRESULT
    @lpVtbl.value.get_run_times.call(this, pstbegin, pstend, pcount, rgsttasktimes)
  end
  def get_next_run_time(this : ITask*, pstnextrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_next_run_time.call(this, pstnextrun)
  end
  def set_idle_wait(this : ITask*, widleminutes : UInt16, wdeadlineminutes : UInt16) : HRESULT
    @lpVtbl.value.set_idle_wait.call(this, widleminutes, wdeadlineminutes)
  end
  def get_idle_wait(this : ITask*, pwidleminutes : UInt16*, pwdeadlineminutes : UInt16*) : HRESULT
    @lpVtbl.value.get_idle_wait.call(this, pwidleminutes, pwdeadlineminutes)
  end
  def run(this : ITask*) : HRESULT
    @lpVtbl.value.run.call(this)
  end
  def terminate(this : ITask*) : HRESULT
    @lpVtbl.value.terminate.call(this)
  end
  def edit_work_item(this : ITask*, hparent : LibC::HANDLE, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.edit_work_item.call(this, hparent, dwreserved)
  end
  def get_most_recent_run_time(this : ITask*, pstlastrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_most_recent_run_time.call(this, pstlastrun)
  end
  def get_status(this : ITask*, phrstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.call(this, phrstatus)
  end
  def get_exit_code(this : ITask*, pdwexitcode : UInt32*) : HRESULT
    @lpVtbl.value.get_exit_code.call(this, pdwexitcode)
  end
  def set_comment(this : ITask*, pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_comment.call(this, pwszcomment)
  end
  def get_comment(this : ITask*, ppwszcomment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_comment.call(this, ppwszcomment)
  end
  def set_creator(this : ITask*, pwszcreator : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_creator.call(this, pwszcreator)
  end
  def get_creator(this : ITask*, ppwszcreator : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_creator.call(this, ppwszcreator)
  end
  def set_work_item_data(this : ITask*, cbdata : UInt16, rgbdata : UInt8*) : HRESULT
    @lpVtbl.value.set_work_item_data.call(this, cbdata, rgbdata)
  end
  def get_work_item_data(this : ITask*, pcbdata : UInt16*, prgbdata : UInt8**) : HRESULT
    @lpVtbl.value.get_work_item_data.call(this, pcbdata, prgbdata)
  end
  def set_error_retry_count(this : ITask*, wretrycount : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_count.call(this, wretrycount)
  end
  def get_error_retry_count(this : ITask*, pwretrycount : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_count.call(this, pwretrycount)
  end
  def set_error_retry_interval(this : ITask*, wretryinterval : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_interval.call(this, wretryinterval)
  end
  def get_error_retry_interval(this : ITask*, pwretryinterval : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_interval.call(this, pwretryinterval)
  end
  def set_flags(this : ITask*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.call(this, dwflags)
  end
  def get_flags(this : ITask*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pdwflags)
  end
  def set_account_information(this : ITask*, pwszaccountname : LibC::LPWSTR, pwszpassword : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_account_information.call(this, pwszaccountname, pwszpassword)
  end
  def get_account_information(this : ITask*, ppwszaccountname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_information.call(this, ppwszaccountname)
  end
  def set_application_name(this : ITask*, pwszapplicationname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_application_name.call(this, pwszapplicationname)
  end
  def get_application_name(this : ITask*, ppwszapplicationname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_application_name.call(this, ppwszapplicationname)
  end
  def set_parameters(this : ITask*, pwszparameters : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_parameters.call(this, pwszparameters)
  end
  def get_parameters(this : ITask*, ppwszparameters : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_parameters.call(this, ppwszparameters)
  end
  def set_working_directory(this : ITask*, pwszworkingdirectory : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_working_directory.call(this, pwszworkingdirectory)
  end
  def get_working_directory(this : ITask*, ppwszworkingdirectory : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_working_directory.call(this, ppwszworkingdirectory)
  end
  def set_priority(this : ITask*, dwpriority : UInt32) : HRESULT
    @lpVtbl.value.set_priority.call(this, dwpriority)
  end
  def get_priority(this : ITask*, pdwpriority : UInt32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, pdwpriority)
  end
  def set_task_flags(this : ITask*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_task_flags.call(this, dwflags)
  end
  def get_task_flags(this : ITask*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_task_flags.call(this, pdwflags)
  end
  def set_max_run_time(this : ITask*, dwmaxruntimems : UInt32) : HRESULT
    @lpVtbl.value.set_max_run_time.call(this, dwmaxruntimems)
  end
  def get_max_run_time(this : ITask*, pdwmaxruntimems : UInt32*) : HRESULT
    @lpVtbl.value.get_max_run_time.call(this, pdwmaxruntimems)
  end
end
struct LibWin32::IEnumWorkItems
  def query_interface(this : IEnumWorkItems*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumWorkItems*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumWorkItems*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumWorkItems*, celt : UInt32, rgpwsznames : LibC::LPWSTR**, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgpwsznames, pceltfetched)
  end
  def skip(this : IEnumWorkItems*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumWorkItems*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumWorkItems*, ppenumworkitems : IEnumWorkItems*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenumworkitems)
  end
end
struct LibWin32::ITaskScheduler
  def query_interface(this : ITaskScheduler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskScheduler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskScheduler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_target_computer(this : ITaskScheduler*, pwszcomputer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_target_computer.call(this, pwszcomputer)
  end
  def get_target_computer(this : ITaskScheduler*, ppwszcomputer : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_target_computer.call(this, ppwszcomputer)
  end
  def enum(this : ITaskScheduler*, ppenumworkitems : IEnumWorkItems*) : HRESULT
    @lpVtbl.value.enum.call(this, ppenumworkitems)
  end
  def activate(this : ITaskScheduler*, pwszname : LibC::LPWSTR, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.activate.call(this, pwszname, riid, ppunk)
  end
  def delete(this : ITaskScheduler*, pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete.call(this, pwszname)
  end
  def new_work_item(this : ITaskScheduler*, pwsztaskname : LibC::LPWSTR, rclsid : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.new_work_item.call(this, pwsztaskname, rclsid, riid, ppunk)
  end
  def add_work_item(this : ITaskScheduler*, pwsztaskname : LibC::LPWSTR, pworkitem : IScheduledWorkItem) : HRESULT
    @lpVtbl.value.add_work_item.call(this, pwsztaskname, pworkitem)
  end
  def is_of_type(this : ITaskScheduler*, pwszname : LibC::LPWSTR, riid : Guid*) : HRESULT
    @lpVtbl.value.is_of_type.call(this, pwszname, riid)
  end
end
struct LibWin32::IProvideTaskPage
  def query_interface(this : IProvideTaskPage*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProvideTaskPage*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProvideTaskPage*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_page(this : IProvideTaskPage*, tptype : TASKPAGE, fpersistchanges : LibC::BOOL, phpage : HPROPSHEETPAGE*) : HRESULT
    @lpVtbl.value.get_page.call(this, tptype, fpersistchanges, phpage)
  end
end
struct LibWin32::ITaskFolderCollection
  def query_interface(this : ITaskFolderCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskFolderCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskFolderCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskFolderCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskFolderCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskFolderCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskFolderCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ITaskFolderCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def get_item(this : ITaskFolderCollection*, index : VARIANT, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, ppfolder)
  end
  def get__new_enum(this : ITaskFolderCollection*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
end
struct LibWin32::ITaskService
  def query_interface(this : ITaskService*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskService*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskService*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskService*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskService*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskService*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskService*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_folder(this : ITaskService*, path : UInt8*, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.get_folder.call(this, path, ppfolder)
  end
  def get_running_tasks(this : ITaskService*, flags : Int32, pprunningtasks : IRunningTaskCollection*) : HRESULT
    @lpVtbl.value.get_running_tasks.call(this, flags, pprunningtasks)
  end
  def new_task(this : ITaskService*, flags : UInt32, ppdefinition : ITaskDefinition*) : HRESULT
    @lpVtbl.value.new_task.call(this, flags, ppdefinition)
  end
  def connect(this : ITaskService*, servername : VARIANT, user : VARIANT, domain : VARIANT, password : VARIANT) : HRESULT
    @lpVtbl.value.connect.call(this, servername, user, domain, password)
  end
  def get_connected(this : ITaskService*, pconnected : Int16*) : HRESULT
    @lpVtbl.value.get_connected.call(this, pconnected)
  end
  def get_target_server(this : ITaskService*, pserver : UInt8**) : HRESULT
    @lpVtbl.value.get_target_server.call(this, pserver)
  end
  def get_connected_user(this : ITaskService*, puser : UInt8**) : HRESULT
    @lpVtbl.value.get_connected_user.call(this, puser)
  end
  def get_connected_domain(this : ITaskService*, pdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_connected_domain.call(this, pdomain)
  end
  def get_highest_version(this : ITaskService*, pversion : UInt32*) : HRESULT
    @lpVtbl.value.get_highest_version.call(this, pversion)
  end
end
struct LibWin32::ITaskHandler
  def query_interface(this : ITaskHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start(this : ITaskHandler*, phandlerservices : IUnknown, data : UInt8*) : HRESULT
    @lpVtbl.value.start.call(this, phandlerservices, data)
  end
  def stop(this : ITaskHandler*, pretcode : HRESULT*) : HRESULT
    @lpVtbl.value.stop.call(this, pretcode)
  end
  def pause(this : ITaskHandler*) : HRESULT
    @lpVtbl.value.pause.call(this)
  end
  def resume(this : ITaskHandler*) : HRESULT
    @lpVtbl.value.resume.call(this)
  end
end
struct LibWin32::ITaskHandlerStatus
  def query_interface(this : ITaskHandlerStatus*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskHandlerStatus*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskHandlerStatus*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def update_status(this : ITaskHandlerStatus*, percentcomplete : Int16, statusmessage : UInt8*) : HRESULT
    @lpVtbl.value.update_status.call(this, percentcomplete, statusmessage)
  end
  def task_completed(this : ITaskHandlerStatus*, taskerrcode : HRESULT) : HRESULT
    @lpVtbl.value.task_completed.call(this, taskerrcode)
  end
end
struct LibWin32::ITaskVariables
  def query_interface(this : ITaskVariables*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskVariables*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskVariables*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_input(this : ITaskVariables*, pinput : UInt8**) : HRESULT
    @lpVtbl.value.get_input.call(this, pinput)
  end
  def set_output(this : ITaskVariables*, input : UInt8*) : HRESULT
    @lpVtbl.value.set_output.call(this, input)
  end
  def get_context(this : ITaskVariables*, pcontext : UInt8**) : HRESULT
    @lpVtbl.value.get_context.call(this, pcontext)
  end
end
struct LibWin32::ITaskNamedValuePair
  def query_interface(this : ITaskNamedValuePair*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskNamedValuePair*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskNamedValuePair*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskNamedValuePair*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskNamedValuePair*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskNamedValuePair*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskNamedValuePair*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : ITaskNamedValuePair*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pname)
  end
  def put_name(this : ITaskNamedValuePair*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_value(this : ITaskNamedValuePair*, pvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, pvalue)
  end
  def put_value(this : ITaskNamedValuePair*, value : UInt8*) : HRESULT
    @lpVtbl.value.put_value.call(this, value)
  end
end
struct LibWin32::ITaskNamedValueCollection
  def query_interface(this : ITaskNamedValueCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskNamedValueCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskNamedValueCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskNamedValueCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskNamedValueCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskNamedValueCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskNamedValueCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ITaskNamedValueCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def get_item(this : ITaskNamedValueCollection*, index : Int32, pppair : ITaskNamedValuePair*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, pppair)
  end
  def get__new_enum(this : ITaskNamedValueCollection*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
  def create(this : ITaskNamedValueCollection*, name : UInt8*, value : UInt8*, pppair : ITaskNamedValuePair*) : HRESULT
    @lpVtbl.value.create.call(this, name, value, pppair)
  end
  def remove(this : ITaskNamedValueCollection*, index : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, index)
  end
  def clear(this : ITaskNamedValueCollection*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
end
struct LibWin32::IRunningTask
  def query_interface(this : IRunningTask*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRunningTask*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRunningTask*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRunningTask*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRunningTask*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRunningTask*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRunningTask*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IRunningTask*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pname)
  end
  def get_instance_guid(this : IRunningTask*, pguid : UInt8**) : HRESULT
    @lpVtbl.value.get_instance_guid.call(this, pguid)
  end
  def get_path(this : IRunningTask*, ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, ppath)
  end
  def get_state(this : IRunningTask*, pstate : TASK_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, pstate)
  end
  def get_current_action(this : IRunningTask*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_current_action.call(this, pname)
  end
  def stop(this : IRunningTask*) : HRESULT
    @lpVtbl.value.stop.call(this)
  end
  def refresh(this : IRunningTask*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
  def get_engine_pid(this : IRunningTask*, ppid : UInt32*) : HRESULT
    @lpVtbl.value.get_engine_pid.call(this, ppid)
  end
end
struct LibWin32::IRunningTaskCollection
  def query_interface(this : IRunningTaskCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRunningTaskCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRunningTaskCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRunningTaskCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRunningTaskCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRunningTaskCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRunningTaskCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IRunningTaskCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def get_item(this : IRunningTaskCollection*, index : VARIANT, pprunningtask : IRunningTask*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, pprunningtask)
  end
  def get__new_enum(this : IRunningTaskCollection*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
end
struct LibWin32::IRegisteredTask
  def query_interface(this : IRegisteredTask*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRegisteredTask*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRegisteredTask*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRegisteredTask*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRegisteredTask*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRegisteredTask*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRegisteredTask*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IRegisteredTask*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pname)
  end
  def get_path(this : IRegisteredTask*, ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, ppath)
  end
  def get_state(this : IRegisteredTask*, pstate : TASK_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, pstate)
  end
  def get_enabled(this : IRegisteredTask*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IRegisteredTask*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def run(this : IRegisteredTask*, params : VARIANT, pprunningtask : IRunningTask*) : HRESULT
    @lpVtbl.value.run.call(this, params, pprunningtask)
  end
  def run_ex(this : IRegisteredTask*, params : VARIANT, flags : Int32, sessionid : Int32, user : UInt8*, pprunningtask : IRunningTask*) : HRESULT
    @lpVtbl.value.run_ex.call(this, params, flags, sessionid, user, pprunningtask)
  end
  def get_instances(this : IRegisteredTask*, flags : Int32, pprunningtasks : IRunningTaskCollection*) : HRESULT
    @lpVtbl.value.get_instances.call(this, flags, pprunningtasks)
  end
  def get_last_run_time(this : IRegisteredTask*, plastruntime : Float64*) : HRESULT
    @lpVtbl.value.get_last_run_time.call(this, plastruntime)
  end
  def get_last_task_result(this : IRegisteredTask*, plasttaskresult : Int32*) : HRESULT
    @lpVtbl.value.get_last_task_result.call(this, plasttaskresult)
  end
  def get_number_of_missed_runs(this : IRegisteredTask*, pnumberofmissedruns : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_missed_runs.call(this, pnumberofmissedruns)
  end
  def get_next_run_time(this : IRegisteredTask*, pnextruntime : Float64*) : HRESULT
    @lpVtbl.value.get_next_run_time.call(this, pnextruntime)
  end
  def get_definition(this : IRegisteredTask*, ppdefinition : ITaskDefinition*) : HRESULT
    @lpVtbl.value.get_definition.call(this, ppdefinition)
  end
  def get_xml(this : IRegisteredTask*, pxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.call(this, pxml)
  end
  def get_security_descriptor(this : IRegisteredTask*, securityinformation : Int32, psddl : UInt8**) : HRESULT
    @lpVtbl.value.get_security_descriptor.call(this, securityinformation, psddl)
  end
  def set_security_descriptor(this : IRegisteredTask*, sddl : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.set_security_descriptor.call(this, sddl, flags)
  end
  def stop(this : IRegisteredTask*, flags : Int32) : HRESULT
    @lpVtbl.value.stop.call(this, flags)
  end
  def get_run_times(this : IRegisteredTask*, pststart : SYSTEMTIME*, pstend : SYSTEMTIME*, pcount : UInt32*, pruntimes : SYSTEMTIME**) : HRESULT
    @lpVtbl.value.get_run_times.call(this, pststart, pstend, pcount, pruntimes)
  end
end
struct LibWin32::ITrigger
  def query_interface(this : ITrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : ITrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : ITrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : ITrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : ITrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : ITrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : ITrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : ITrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : ITrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : ITrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : ITrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : ITrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : ITrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : ITrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
end
struct LibWin32::IIdleTrigger
  def query_interface(this : IIdleTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdleTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdleTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIdleTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIdleTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIdleTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIdleTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IIdleTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IIdleTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IIdleTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IIdleTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IIdleTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IIdleTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IIdleTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IIdleTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IIdleTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IIdleTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IIdleTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IIdleTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IIdleTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
end
struct LibWin32::ILogonTrigger
  def query_interface(this : ILogonTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILogonTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILogonTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ILogonTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ILogonTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ILogonTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ILogonTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : ILogonTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : ILogonTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : ILogonTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : ILogonTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : ILogonTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : ILogonTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : ILogonTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : ILogonTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : ILogonTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : ILogonTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : ILogonTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : ILogonTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : ILogonTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_delay(this : ILogonTrigger*, pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.call(this, pdelay)
  end
  def put_delay(this : ILogonTrigger*, delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.call(this, delay)
  end
  def get_user_id(this : ILogonTrigger*, puser : UInt8**) : HRESULT
    @lpVtbl.value.get_user_id.call(this, puser)
  end
  def put_user_id(this : ILogonTrigger*, user : UInt8*) : HRESULT
    @lpVtbl.value.put_user_id.call(this, user)
  end
end
struct LibWin32::ISessionStateChangeTrigger
  def query_interface(this : ISessionStateChangeTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISessionStateChangeTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISessionStateChangeTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISessionStateChangeTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISessionStateChangeTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISessionStateChangeTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISessionStateChangeTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : ISessionStateChangeTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : ISessionStateChangeTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : ISessionStateChangeTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : ISessionStateChangeTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : ISessionStateChangeTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : ISessionStateChangeTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : ISessionStateChangeTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : ISessionStateChangeTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : ISessionStateChangeTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : ISessionStateChangeTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : ISessionStateChangeTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : ISessionStateChangeTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : ISessionStateChangeTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_delay(this : ISessionStateChangeTrigger*, pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.call(this, pdelay)
  end
  def put_delay(this : ISessionStateChangeTrigger*, delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.call(this, delay)
  end
  def get_user_id(this : ISessionStateChangeTrigger*, puser : UInt8**) : HRESULT
    @lpVtbl.value.get_user_id.call(this, puser)
  end
  def put_user_id(this : ISessionStateChangeTrigger*, user : UInt8*) : HRESULT
    @lpVtbl.value.put_user_id.call(this, user)
  end
  def get_state_change(this : ISessionStateChangeTrigger*, ptype : TASK_SESSION_STATE_CHANGE_TYPE*) : HRESULT
    @lpVtbl.value.get_state_change.call(this, ptype)
  end
  def put_state_change(this : ISessionStateChangeTrigger*, type : TASK_SESSION_STATE_CHANGE_TYPE) : HRESULT
    @lpVtbl.value.put_state_change.call(this, type)
  end
end
struct LibWin32::IEventTrigger
  def query_interface(this : IEventTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IEventTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IEventTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IEventTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IEventTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IEventTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IEventTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IEventTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IEventTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IEventTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IEventTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IEventTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IEventTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IEventTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_subscription(this : IEventTrigger*, pquery : UInt8**) : HRESULT
    @lpVtbl.value.get_subscription.call(this, pquery)
  end
  def put_subscription(this : IEventTrigger*, query : UInt8*) : HRESULT
    @lpVtbl.value.put_subscription.call(this, query)
  end
  def get_delay(this : IEventTrigger*, pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.call(this, pdelay)
  end
  def put_delay(this : IEventTrigger*, delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.call(this, delay)
  end
  def get_value_queries(this : IEventTrigger*, ppnamedxpaths : ITaskNamedValueCollection*) : HRESULT
    @lpVtbl.value.get_value_queries.call(this, ppnamedxpaths)
  end
  def put_value_queries(this : IEventTrigger*, pnamedxpaths : ITaskNamedValueCollection) : HRESULT
    @lpVtbl.value.put_value_queries.call(this, pnamedxpaths)
  end
end
struct LibWin32::ITimeTrigger
  def query_interface(this : ITimeTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITimeTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITimeTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITimeTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITimeTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITimeTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITimeTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : ITimeTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : ITimeTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : ITimeTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : ITimeTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : ITimeTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : ITimeTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : ITimeTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : ITimeTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : ITimeTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : ITimeTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : ITimeTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : ITimeTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : ITimeTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_random_delay(this : ITimeTrigger*, prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.call(this, prandomdelay)
  end
  def put_random_delay(this : ITimeTrigger*, randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.call(this, randomdelay)
  end
end
struct LibWin32::IDailyTrigger
  def query_interface(this : IDailyTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDailyTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDailyTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IDailyTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IDailyTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IDailyTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IDailyTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IDailyTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IDailyTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IDailyTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IDailyTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IDailyTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IDailyTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IDailyTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IDailyTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IDailyTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IDailyTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IDailyTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IDailyTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IDailyTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_days_interval(this : IDailyTrigger*, pdays : Int16*) : HRESULT
    @lpVtbl.value.get_days_interval.call(this, pdays)
  end
  def put_days_interval(this : IDailyTrigger*, days : Int16) : HRESULT
    @lpVtbl.value.put_days_interval.call(this, days)
  end
  def get_random_delay(this : IDailyTrigger*, prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.call(this, prandomdelay)
  end
  def put_random_delay(this : IDailyTrigger*, randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.call(this, randomdelay)
  end
end
struct LibWin32::IWeeklyTrigger
  def query_interface(this : IWeeklyTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWeeklyTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWeeklyTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWeeklyTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWeeklyTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWeeklyTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWeeklyTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IWeeklyTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IWeeklyTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IWeeklyTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IWeeklyTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IWeeklyTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IWeeklyTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IWeeklyTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IWeeklyTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IWeeklyTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IWeeklyTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IWeeklyTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IWeeklyTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IWeeklyTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_days_of_week(this : IWeeklyTrigger*, pdays : Int16*) : HRESULT
    @lpVtbl.value.get_days_of_week.call(this, pdays)
  end
  def put_days_of_week(this : IWeeklyTrigger*, days : Int16) : HRESULT
    @lpVtbl.value.put_days_of_week.call(this, days)
  end
  def get_weeks_interval(this : IWeeklyTrigger*, pweeks : Int16*) : HRESULT
    @lpVtbl.value.get_weeks_interval.call(this, pweeks)
  end
  def put_weeks_interval(this : IWeeklyTrigger*, weeks : Int16) : HRESULT
    @lpVtbl.value.put_weeks_interval.call(this, weeks)
  end
  def get_random_delay(this : IWeeklyTrigger*, prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.call(this, prandomdelay)
  end
  def put_random_delay(this : IWeeklyTrigger*, randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.call(this, randomdelay)
  end
end
struct LibWin32::IMonthlyTrigger
  def query_interface(this : IMonthlyTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMonthlyTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMonthlyTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMonthlyTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMonthlyTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMonthlyTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMonthlyTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IMonthlyTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IMonthlyTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IMonthlyTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IMonthlyTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IMonthlyTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IMonthlyTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IMonthlyTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IMonthlyTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IMonthlyTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IMonthlyTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IMonthlyTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IMonthlyTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IMonthlyTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_days_of_month(this : IMonthlyTrigger*, pdays : Int32*) : HRESULT
    @lpVtbl.value.get_days_of_month.call(this, pdays)
  end
  def put_days_of_month(this : IMonthlyTrigger*, days : Int32) : HRESULT
    @lpVtbl.value.put_days_of_month.call(this, days)
  end
  def get_months_of_year(this : IMonthlyTrigger*, pmonths : Int16*) : HRESULT
    @lpVtbl.value.get_months_of_year.call(this, pmonths)
  end
  def put_months_of_year(this : IMonthlyTrigger*, months : Int16) : HRESULT
    @lpVtbl.value.put_months_of_year.call(this, months)
  end
  def get_run_on_last_day_of_month(this : IMonthlyTrigger*, plastday : Int16*) : HRESULT
    @lpVtbl.value.get_run_on_last_day_of_month.call(this, plastday)
  end
  def put_run_on_last_day_of_month(this : IMonthlyTrigger*, lastday : Int16) : HRESULT
    @lpVtbl.value.put_run_on_last_day_of_month.call(this, lastday)
  end
  def get_random_delay(this : IMonthlyTrigger*, prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.call(this, prandomdelay)
  end
  def put_random_delay(this : IMonthlyTrigger*, randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.call(this, randomdelay)
  end
end
struct LibWin32::IMonthlyDOWTrigger
  def query_interface(this : IMonthlyDOWTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMonthlyDOWTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMonthlyDOWTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMonthlyDOWTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMonthlyDOWTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMonthlyDOWTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMonthlyDOWTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IMonthlyDOWTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IMonthlyDOWTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IMonthlyDOWTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IMonthlyDOWTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IMonthlyDOWTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IMonthlyDOWTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IMonthlyDOWTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IMonthlyDOWTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IMonthlyDOWTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IMonthlyDOWTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IMonthlyDOWTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IMonthlyDOWTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IMonthlyDOWTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_days_of_week(this : IMonthlyDOWTrigger*, pdays : Int16*) : HRESULT
    @lpVtbl.value.get_days_of_week.call(this, pdays)
  end
  def put_days_of_week(this : IMonthlyDOWTrigger*, days : Int16) : HRESULT
    @lpVtbl.value.put_days_of_week.call(this, days)
  end
  def get_weeks_of_month(this : IMonthlyDOWTrigger*, pweeks : Int16*) : HRESULT
    @lpVtbl.value.get_weeks_of_month.call(this, pweeks)
  end
  def put_weeks_of_month(this : IMonthlyDOWTrigger*, weeks : Int16) : HRESULT
    @lpVtbl.value.put_weeks_of_month.call(this, weeks)
  end
  def get_months_of_year(this : IMonthlyDOWTrigger*, pmonths : Int16*) : HRESULT
    @lpVtbl.value.get_months_of_year.call(this, pmonths)
  end
  def put_months_of_year(this : IMonthlyDOWTrigger*, months : Int16) : HRESULT
    @lpVtbl.value.put_months_of_year.call(this, months)
  end
  def get_run_on_last_week_of_month(this : IMonthlyDOWTrigger*, plastweek : Int16*) : HRESULT
    @lpVtbl.value.get_run_on_last_week_of_month.call(this, plastweek)
  end
  def put_run_on_last_week_of_month(this : IMonthlyDOWTrigger*, lastweek : Int16) : HRESULT
    @lpVtbl.value.put_run_on_last_week_of_month.call(this, lastweek)
  end
  def get_random_delay(this : IMonthlyDOWTrigger*, prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.call(this, prandomdelay)
  end
  def put_random_delay(this : IMonthlyDOWTrigger*, randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.call(this, randomdelay)
  end
end
struct LibWin32::IBootTrigger
  def query_interface(this : IBootTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IBootTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IBootTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IBootTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IBootTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IBootTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IBootTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IBootTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IBootTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IBootTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IBootTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IBootTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IBootTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IBootTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IBootTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IBootTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IBootTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IBootTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IBootTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IBootTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_delay(this : IBootTrigger*, pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.call(this, pdelay)
  end
  def put_delay(this : IBootTrigger*, delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.call(this, delay)
  end
end
struct LibWin32::IRegistrationTrigger
  def query_interface(this : IRegistrationTrigger*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRegistrationTrigger*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRegistrationTrigger*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRegistrationTrigger*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRegistrationTrigger*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRegistrationTrigger*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRegistrationTrigger*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IRegistrationTrigger*, ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_id(this : IRegistrationTrigger*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IRegistrationTrigger*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_repetition(this : IRegistrationTrigger*, pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.call(this, pprepeat)
  end
  def put_repetition(this : IRegistrationTrigger*, prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.call(this, prepeat)
  end
  def get_execution_time_limit(this : IRegistrationTrigger*, ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, ptimelimit)
  end
  def put_execution_time_limit(this : IRegistrationTrigger*, timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, timelimit)
  end
  def get_start_boundary(this : IRegistrationTrigger*, pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.call(this, pstart)
  end
  def put_start_boundary(this : IRegistrationTrigger*, start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.call(this, start)
  end
  def get_end_boundary(this : IRegistrationTrigger*, pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.call(this, pend)
  end
  def put_end_boundary(this : IRegistrationTrigger*, end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.call(this, end_)
  end
  def get_enabled(this : IRegistrationTrigger*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : IRegistrationTrigger*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_delay(this : IRegistrationTrigger*, pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.call(this, pdelay)
  end
  def put_delay(this : IRegistrationTrigger*, delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.call(this, delay)
  end
end
struct LibWin32::IAction
  def query_interface(this : IAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IAction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IAction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IAction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IAction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IAction*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IAction*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_type(this : IAction*, ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
end
struct LibWin32::IExecAction
  def query_interface(this : IExecAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExecAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExecAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IExecAction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IExecAction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IExecAction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IExecAction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IExecAction*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IExecAction*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_type(this : IExecAction*, ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_path(this : IExecAction*, ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, ppath)
  end
  def put_path(this : IExecAction*, path : UInt8*) : HRESULT
    @lpVtbl.value.put_path.call(this, path)
  end
  def get_arguments(this : IExecAction*, pargument : UInt8**) : HRESULT
    @lpVtbl.value.get_arguments.call(this, pargument)
  end
  def put_arguments(this : IExecAction*, argument : UInt8*) : HRESULT
    @lpVtbl.value.put_arguments.call(this, argument)
  end
  def get_working_directory(this : IExecAction*, pworkingdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_working_directory.call(this, pworkingdirectory)
  end
  def put_working_directory(this : IExecAction*, workingdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_working_directory.call(this, workingdirectory)
  end
end
struct LibWin32::IExecAction2
  def query_interface(this : IExecAction2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExecAction2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExecAction2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IExecAction2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IExecAction2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IExecAction2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IExecAction2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IExecAction2*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IExecAction2*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_type(this : IExecAction2*, ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_path(this : IExecAction2*, ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, ppath)
  end
  def put_path(this : IExecAction2*, path : UInt8*) : HRESULT
    @lpVtbl.value.put_path.call(this, path)
  end
  def get_arguments(this : IExecAction2*, pargument : UInt8**) : HRESULT
    @lpVtbl.value.get_arguments.call(this, pargument)
  end
  def put_arguments(this : IExecAction2*, argument : UInt8*) : HRESULT
    @lpVtbl.value.put_arguments.call(this, argument)
  end
  def get_working_directory(this : IExecAction2*, pworkingdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_working_directory.call(this, pworkingdirectory)
  end
  def put_working_directory(this : IExecAction2*, workingdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_working_directory.call(this, workingdirectory)
  end
  def get_hide_app_window(this : IExecAction2*, phideappwindow : Int16*) : HRESULT
    @lpVtbl.value.get_hide_app_window.call(this, phideappwindow)
  end
  def put_hide_app_window(this : IExecAction2*, hideappwindow : Int16) : HRESULT
    @lpVtbl.value.put_hide_app_window.call(this, hideappwindow)
  end
end
struct LibWin32::IShowMessageAction
  def query_interface(this : IShowMessageAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IShowMessageAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IShowMessageAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IShowMessageAction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IShowMessageAction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IShowMessageAction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IShowMessageAction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IShowMessageAction*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IShowMessageAction*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_type(this : IShowMessageAction*, ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_title(this : IShowMessageAction*, ptitle : UInt8**) : HRESULT
    @lpVtbl.value.get_title.call(this, ptitle)
  end
  def put_title(this : IShowMessageAction*, title : UInt8*) : HRESULT
    @lpVtbl.value.put_title.call(this, title)
  end
  def get_message_body(this : IShowMessageAction*, pmessagebody : UInt8**) : HRESULT
    @lpVtbl.value.get_message_body.call(this, pmessagebody)
  end
  def put_message_body(this : IShowMessageAction*, messagebody : UInt8*) : HRESULT
    @lpVtbl.value.put_message_body.call(this, messagebody)
  end
end
struct LibWin32::IComHandlerAction
  def query_interface(this : IComHandlerAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComHandlerAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComHandlerAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IComHandlerAction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IComHandlerAction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IComHandlerAction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IComHandlerAction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IComHandlerAction*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IComHandlerAction*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_type(this : IComHandlerAction*, ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_class_id(this : IComHandlerAction*, pclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_class_id.call(this, pclsid)
  end
  def put_class_id(this : IComHandlerAction*, clsid : UInt8*) : HRESULT
    @lpVtbl.value.put_class_id.call(this, clsid)
  end
  def get_data(this : IComHandlerAction*, pdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pdata)
  end
  def put_data(this : IComHandlerAction*, data : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, data)
  end
end
struct LibWin32::IEmailAction
  def query_interface(this : IEmailAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEmailAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEmailAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEmailAction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEmailAction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEmailAction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEmailAction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IEmailAction*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IEmailAction*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_type(this : IEmailAction*, ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.call(this, ptype)
  end
  def get_server(this : IEmailAction*, pserver : UInt8**) : HRESULT
    @lpVtbl.value.get_server.call(this, pserver)
  end
  def put_server(this : IEmailAction*, server : UInt8*) : HRESULT
    @lpVtbl.value.put_server.call(this, server)
  end
  def get_subject(this : IEmailAction*, psubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.call(this, psubject)
  end
  def put_subject(this : IEmailAction*, subject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.call(this, subject)
  end
  def get_to(this : IEmailAction*, pto : UInt8**) : HRESULT
    @lpVtbl.value.get_to.call(this, pto)
  end
  def put_to(this : IEmailAction*, to : UInt8*) : HRESULT
    @lpVtbl.value.put_to.call(this, to)
  end
  def get_cc(this : IEmailAction*, pcc : UInt8**) : HRESULT
    @lpVtbl.value.get_cc.call(this, pcc)
  end
  def put_cc(this : IEmailAction*, cc : UInt8*) : HRESULT
    @lpVtbl.value.put_cc.call(this, cc)
  end
  def get_bcc(this : IEmailAction*, pbcc : UInt8**) : HRESULT
    @lpVtbl.value.get_bcc.call(this, pbcc)
  end
  def put_bcc(this : IEmailAction*, bcc : UInt8*) : HRESULT
    @lpVtbl.value.put_bcc.call(this, bcc)
  end
  def get_reply_to(this : IEmailAction*, preplyto : UInt8**) : HRESULT
    @lpVtbl.value.get_reply_to.call(this, preplyto)
  end
  def put_reply_to(this : IEmailAction*, replyto : UInt8*) : HRESULT
    @lpVtbl.value.put_reply_to.call(this, replyto)
  end
  def get_from(this : IEmailAction*, pfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_from.call(this, pfrom)
  end
  def put_from(this : IEmailAction*, from : UInt8*) : HRESULT
    @lpVtbl.value.put_from.call(this, from)
  end
  def get_header_fields(this : IEmailAction*, ppheaderfields : ITaskNamedValueCollection*) : HRESULT
    @lpVtbl.value.get_header_fields.call(this, ppheaderfields)
  end
  def put_header_fields(this : IEmailAction*, pheaderfields : ITaskNamedValueCollection) : HRESULT
    @lpVtbl.value.put_header_fields.call(this, pheaderfields)
  end
  def get_body(this : IEmailAction*, pbody : UInt8**) : HRESULT
    @lpVtbl.value.get_body.call(this, pbody)
  end
  def put_body(this : IEmailAction*, body : UInt8*) : HRESULT
    @lpVtbl.value.put_body.call(this, body)
  end
  def get_attachments(this : IEmailAction*, pattachements : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_attachments.call(this, pattachements)
  end
  def put_attachments(this : IEmailAction*, pattachements : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_attachments.call(this, pattachements)
  end
end
struct LibWin32::ITriggerCollection
  def query_interface(this : ITriggerCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITriggerCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITriggerCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITriggerCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITriggerCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITriggerCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITriggerCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ITriggerCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def get_item(this : ITriggerCollection*, index : Int32, pptrigger : ITrigger*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, pptrigger)
  end
  def get__new_enum(this : ITriggerCollection*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
  def create(this : ITriggerCollection*, type : TASK_TRIGGER_TYPE2, pptrigger : ITrigger*) : HRESULT
    @lpVtbl.value.create.call(this, type, pptrigger)
  end
  def remove(this : ITriggerCollection*, index : VARIANT) : HRESULT
    @lpVtbl.value.remove.call(this, index)
  end
  def clear(this : ITriggerCollection*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
end
struct LibWin32::IActionCollection
  def query_interface(this : IActionCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IActionCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IActionCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IActionCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IActionCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IActionCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IActionCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IActionCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def get_item(this : IActionCollection*, index : Int32, ppaction : IAction*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, ppaction)
  end
  def get__new_enum(this : IActionCollection*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
  def get_xml_text(this : IActionCollection*, ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.call(this, ptext)
  end
  def put_xml_text(this : IActionCollection*, text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.call(this, text)
  end
  def create(this : IActionCollection*, type : TASK_ACTION_TYPE, ppaction : IAction*) : HRESULT
    @lpVtbl.value.create.call(this, type, ppaction)
  end
  def remove(this : IActionCollection*, index : VARIANT) : HRESULT
    @lpVtbl.value.remove.call(this, index)
  end
  def clear(this : IActionCollection*) : HRESULT
    @lpVtbl.value.clear.call(this)
  end
  def get_context(this : IActionCollection*, pcontext : UInt8**) : HRESULT
    @lpVtbl.value.get_context.call(this, pcontext)
  end
  def put_context(this : IActionCollection*, context : UInt8*) : HRESULT
    @lpVtbl.value.put_context.call(this, context)
  end
end
struct LibWin32::IPrincipal
  def query_interface(this : IPrincipal*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrincipal*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrincipal*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IPrincipal*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IPrincipal*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IPrincipal*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IPrincipal*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IPrincipal*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : IPrincipal*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
  def get_display_name(this : IPrincipal*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, pname)
  end
  def put_display_name(this : IPrincipal*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, name)
  end
  def get_user_id(this : IPrincipal*, puser : UInt8**) : HRESULT
    @lpVtbl.value.get_user_id.call(this, puser)
  end
  def put_user_id(this : IPrincipal*, user : UInt8*) : HRESULT
    @lpVtbl.value.put_user_id.call(this, user)
  end
  def get_logon_type(this : IPrincipal*, plogon : TASK_LOGON_TYPE*) : HRESULT
    @lpVtbl.value.get_logon_type.call(this, plogon)
  end
  def put_logon_type(this : IPrincipal*, logon : TASK_LOGON_TYPE) : HRESULT
    @lpVtbl.value.put_logon_type.call(this, logon)
  end
  def get_group_id(this : IPrincipal*, pgroup : UInt8**) : HRESULT
    @lpVtbl.value.get_group_id.call(this, pgroup)
  end
  def put_group_id(this : IPrincipal*, group : UInt8*) : HRESULT
    @lpVtbl.value.put_group_id.call(this, group)
  end
  def get_run_level(this : IPrincipal*, prunlevel : TASK_RUNLEVEL_TYPE*) : HRESULT
    @lpVtbl.value.get_run_level.call(this, prunlevel)
  end
  def put_run_level(this : IPrincipal*, runlevel : TASK_RUNLEVEL_TYPE) : HRESULT
    @lpVtbl.value.put_run_level.call(this, runlevel)
  end
end
struct LibWin32::IPrincipal2
  def query_interface(this : IPrincipal2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPrincipal2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPrincipal2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IPrincipal2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IPrincipal2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IPrincipal2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IPrincipal2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_process_token_sid_type(this : IPrincipal2*, pprocesstokensidtype : TASK_PROCESSTOKENSID_TYPE*) : HRESULT
    @lpVtbl.value.get_process_token_sid_type.call(this, pprocesstokensidtype)
  end
  def put_process_token_sid_type(this : IPrincipal2*, processtokensidtype : TASK_PROCESSTOKENSID_TYPE) : HRESULT
    @lpVtbl.value.put_process_token_sid_type.call(this, processtokensidtype)
  end
  def get_required_privilege_count(this : IPrincipal2*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_required_privilege_count.call(this, pcount)
  end
  def get_required_privilege(this : IPrincipal2*, index : Int32, pprivilege : UInt8**) : HRESULT
    @lpVtbl.value.get_required_privilege.call(this, index, pprivilege)
  end
  def add_required_privilege(this : IPrincipal2*, privilege : UInt8*) : HRESULT
    @lpVtbl.value.add_required_privilege.call(this, privilege)
  end
end
struct LibWin32::IRegistrationInfo
  def query_interface(this : IRegistrationInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRegistrationInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRegistrationInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRegistrationInfo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRegistrationInfo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRegistrationInfo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRegistrationInfo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_description(this : IRegistrationInfo*, pdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pdescription)
  end
  def put_description(this : IRegistrationInfo*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def get_author(this : IRegistrationInfo*, pauthor : UInt8**) : HRESULT
    @lpVtbl.value.get_author.call(this, pauthor)
  end
  def put_author(this : IRegistrationInfo*, author : UInt8*) : HRESULT
    @lpVtbl.value.put_author.call(this, author)
  end
  def get_version(this : IRegistrationInfo*, pversion : UInt8**) : HRESULT
    @lpVtbl.value.get_version.call(this, pversion)
  end
  def put_version(this : IRegistrationInfo*, version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.call(this, version)
  end
  def get_date(this : IRegistrationInfo*, pdate : UInt8**) : HRESULT
    @lpVtbl.value.get_date.call(this, pdate)
  end
  def put_date(this : IRegistrationInfo*, date : UInt8*) : HRESULT
    @lpVtbl.value.put_date.call(this, date)
  end
  def get_documentation(this : IRegistrationInfo*, pdocumentation : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.call(this, pdocumentation)
  end
  def put_documentation(this : IRegistrationInfo*, documentation : UInt8*) : HRESULT
    @lpVtbl.value.put_documentation.call(this, documentation)
  end
  def get_xml_text(this : IRegistrationInfo*, ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.call(this, ptext)
  end
  def put_xml_text(this : IRegistrationInfo*, text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.call(this, text)
  end
  def get_uri(this : IRegistrationInfo*, puri : UInt8**) : HRESULT
    @lpVtbl.value.get_uri.call(this, puri)
  end
  def put_uri(this : IRegistrationInfo*, uri : UInt8*) : HRESULT
    @lpVtbl.value.put_uri.call(this, uri)
  end
  def get_security_descriptor(this : IRegistrationInfo*, psddl : VARIANT*) : HRESULT
    @lpVtbl.value.get_security_descriptor.call(this, psddl)
  end
  def put_security_descriptor(this : IRegistrationInfo*, sddl : VARIANT) : HRESULT
    @lpVtbl.value.put_security_descriptor.call(this, sddl)
  end
  def get_source(this : IRegistrationInfo*, psource : UInt8**) : HRESULT
    @lpVtbl.value.get_source.call(this, psource)
  end
  def put_source(this : IRegistrationInfo*, source : UInt8*) : HRESULT
    @lpVtbl.value.put_source.call(this, source)
  end
end
struct LibWin32::ITaskDefinition
  def query_interface(this : ITaskDefinition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskDefinition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskDefinition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskDefinition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskDefinition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskDefinition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskDefinition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_registration_info(this : ITaskDefinition*, ppregistrationinfo : IRegistrationInfo*) : HRESULT
    @lpVtbl.value.get_registration_info.call(this, ppregistrationinfo)
  end
  def put_registration_info(this : ITaskDefinition*, pregistrationinfo : IRegistrationInfo) : HRESULT
    @lpVtbl.value.put_registration_info.call(this, pregistrationinfo)
  end
  def get_triggers(this : ITaskDefinition*, pptriggers : ITriggerCollection*) : HRESULT
    @lpVtbl.value.get_triggers.call(this, pptriggers)
  end
  def put_triggers(this : ITaskDefinition*, ptriggers : ITriggerCollection) : HRESULT
    @lpVtbl.value.put_triggers.call(this, ptriggers)
  end
  def get_settings(this : ITaskDefinition*, ppsettings : ITaskSettings*) : HRESULT
    @lpVtbl.value.get_settings.call(this, ppsettings)
  end
  def put_settings(this : ITaskDefinition*, psettings : ITaskSettings) : HRESULT
    @lpVtbl.value.put_settings.call(this, psettings)
  end
  def get_data(this : ITaskDefinition*, pdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.call(this, pdata)
  end
  def put_data(this : ITaskDefinition*, data : UInt8*) : HRESULT
    @lpVtbl.value.put_data.call(this, data)
  end
  def get_principal(this : ITaskDefinition*, ppprincipal : IPrincipal*) : HRESULT
    @lpVtbl.value.get_principal.call(this, ppprincipal)
  end
  def put_principal(this : ITaskDefinition*, pprincipal : IPrincipal) : HRESULT
    @lpVtbl.value.put_principal.call(this, pprincipal)
  end
  def get_actions(this : ITaskDefinition*, ppactions : IActionCollection*) : HRESULT
    @lpVtbl.value.get_actions.call(this, ppactions)
  end
  def put_actions(this : ITaskDefinition*, pactions : IActionCollection) : HRESULT
    @lpVtbl.value.put_actions.call(this, pactions)
  end
  def get_xml_text(this : ITaskDefinition*, pxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.call(this, pxml)
  end
  def put_xml_text(this : ITaskDefinition*, xml : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.call(this, xml)
  end
end
struct LibWin32::ITaskSettings
  def query_interface(this : ITaskSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_allow_demand_start(this : ITaskSettings*, pallowdemandstart : Int16*) : HRESULT
    @lpVtbl.value.get_allow_demand_start.call(this, pallowdemandstart)
  end
  def put_allow_demand_start(this : ITaskSettings*, allowdemandstart : Int16) : HRESULT
    @lpVtbl.value.put_allow_demand_start.call(this, allowdemandstart)
  end
  def get_restart_interval(this : ITaskSettings*, prestartinterval : UInt8**) : HRESULT
    @lpVtbl.value.get_restart_interval.call(this, prestartinterval)
  end
  def put_restart_interval(this : ITaskSettings*, restartinterval : UInt8*) : HRESULT
    @lpVtbl.value.put_restart_interval.call(this, restartinterval)
  end
  def get_restart_count(this : ITaskSettings*, prestartcount : Int32*) : HRESULT
    @lpVtbl.value.get_restart_count.call(this, prestartcount)
  end
  def put_restart_count(this : ITaskSettings*, restartcount : Int32) : HRESULT
    @lpVtbl.value.put_restart_count.call(this, restartcount)
  end
  def get_multiple_instances(this : ITaskSettings*, ppolicy : TASK_INSTANCES_POLICY*) : HRESULT
    @lpVtbl.value.get_multiple_instances.call(this, ppolicy)
  end
  def put_multiple_instances(this : ITaskSettings*, policy : TASK_INSTANCES_POLICY) : HRESULT
    @lpVtbl.value.put_multiple_instances.call(this, policy)
  end
  def get_stop_if_going_on_batteries(this : ITaskSettings*, pstopifonbatteries : Int16*) : HRESULT
    @lpVtbl.value.get_stop_if_going_on_batteries.call(this, pstopifonbatteries)
  end
  def put_stop_if_going_on_batteries(this : ITaskSettings*, stopifonbatteries : Int16) : HRESULT
    @lpVtbl.value.put_stop_if_going_on_batteries.call(this, stopifonbatteries)
  end
  def get_disallow_start_if_on_batteries(this : ITaskSettings*, pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_if_on_batteries.call(this, pdisallowstart)
  end
  def put_disallow_start_if_on_batteries(this : ITaskSettings*, disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_if_on_batteries.call(this, disallowstart)
  end
  def get_allow_hard_terminate(this : ITaskSettings*, pallowhardterminate : Int16*) : HRESULT
    @lpVtbl.value.get_allow_hard_terminate.call(this, pallowhardterminate)
  end
  def put_allow_hard_terminate(this : ITaskSettings*, allowhardterminate : Int16) : HRESULT
    @lpVtbl.value.put_allow_hard_terminate.call(this, allowhardterminate)
  end
  def get_start_when_available(this : ITaskSettings*, pstartwhenavailable : Int16*) : HRESULT
    @lpVtbl.value.get_start_when_available.call(this, pstartwhenavailable)
  end
  def put_start_when_available(this : ITaskSettings*, startwhenavailable : Int16) : HRESULT
    @lpVtbl.value.put_start_when_available.call(this, startwhenavailable)
  end
  def get_xml_text(this : ITaskSettings*, ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.call(this, ptext)
  end
  def put_xml_text(this : ITaskSettings*, text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.call(this, text)
  end
  def get_run_only_if_network_available(this : ITaskSettings*, prunonlyifnetworkavailable : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_network_available.call(this, prunonlyifnetworkavailable)
  end
  def put_run_only_if_network_available(this : ITaskSettings*, runonlyifnetworkavailable : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_network_available.call(this, runonlyifnetworkavailable)
  end
  def get_execution_time_limit(this : ITaskSettings*, pexecutiontimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, pexecutiontimelimit)
  end
  def put_execution_time_limit(this : ITaskSettings*, executiontimelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, executiontimelimit)
  end
  def get_enabled(this : ITaskSettings*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : ITaskSettings*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_delete_expired_task_after(this : ITaskSettings*, pexpirationdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delete_expired_task_after.call(this, pexpirationdelay)
  end
  def put_delete_expired_task_after(this : ITaskSettings*, expirationdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_delete_expired_task_after.call(this, expirationdelay)
  end
  def get_priority(this : ITaskSettings*, ppriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def put_priority(this : ITaskSettings*, priority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, priority)
  end
  def get_compatibility(this : ITaskSettings*, pcompatlevel : TASK_COMPATIBILITY*) : HRESULT
    @lpVtbl.value.get_compatibility.call(this, pcompatlevel)
  end
  def put_compatibility(this : ITaskSettings*, compatlevel : TASK_COMPATIBILITY) : HRESULT
    @lpVtbl.value.put_compatibility.call(this, compatlevel)
  end
  def get_hidden(this : ITaskSettings*, phidden : Int16*) : HRESULT
    @lpVtbl.value.get_hidden.call(this, phidden)
  end
  def put_hidden(this : ITaskSettings*, hidden : Int16) : HRESULT
    @lpVtbl.value.put_hidden.call(this, hidden)
  end
  def get_idle_settings(this : ITaskSettings*, ppidlesettings : IIdleSettings*) : HRESULT
    @lpVtbl.value.get_idle_settings.call(this, ppidlesettings)
  end
  def put_idle_settings(this : ITaskSettings*, pidlesettings : IIdleSettings) : HRESULT
    @lpVtbl.value.put_idle_settings.call(this, pidlesettings)
  end
  def get_run_only_if_idle(this : ITaskSettings*, prunonlyifidle : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_idle.call(this, prunonlyifidle)
  end
  def put_run_only_if_idle(this : ITaskSettings*, runonlyifidle : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_idle.call(this, runonlyifidle)
  end
  def get_wake_to_run(this : ITaskSettings*, pwake : Int16*) : HRESULT
    @lpVtbl.value.get_wake_to_run.call(this, pwake)
  end
  def put_wake_to_run(this : ITaskSettings*, wake : Int16) : HRESULT
    @lpVtbl.value.put_wake_to_run.call(this, wake)
  end
  def get_network_settings(this : ITaskSettings*, ppnetworksettings : INetworkSettings*) : HRESULT
    @lpVtbl.value.get_network_settings.call(this, ppnetworksettings)
  end
  def put_network_settings(this : ITaskSettings*, pnetworksettings : INetworkSettings) : HRESULT
    @lpVtbl.value.put_network_settings.call(this, pnetworksettings)
  end
end
struct LibWin32::ITaskSettings2
  def query_interface(this : ITaskSettings2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskSettings2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskSettings2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskSettings2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskSettings2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskSettings2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskSettings2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_disallow_start_on_remote_app_session(this : ITaskSettings2*, pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_on_remote_app_session.call(this, pdisallowstart)
  end
  def put_disallow_start_on_remote_app_session(this : ITaskSettings2*, disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_on_remote_app_session.call(this, disallowstart)
  end
  def get_use_unified_scheduling_engine(this : ITaskSettings2*, puseunifiedengine : Int16*) : HRESULT
    @lpVtbl.value.get_use_unified_scheduling_engine.call(this, puseunifiedengine)
  end
  def put_use_unified_scheduling_engine(this : ITaskSettings2*, useunifiedengine : Int16) : HRESULT
    @lpVtbl.value.put_use_unified_scheduling_engine.call(this, useunifiedengine)
  end
end
struct LibWin32::ITaskSettings3
  def query_interface(this : ITaskSettings3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskSettings3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskSettings3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskSettings3*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskSettings3*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskSettings3*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskSettings3*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_allow_demand_start(this : ITaskSettings3*, pallowdemandstart : Int16*) : HRESULT
    @lpVtbl.value.get_allow_demand_start.call(this, pallowdemandstart)
  end
  def put_allow_demand_start(this : ITaskSettings3*, allowdemandstart : Int16) : HRESULT
    @lpVtbl.value.put_allow_demand_start.call(this, allowdemandstart)
  end
  def get_restart_interval(this : ITaskSettings3*, prestartinterval : UInt8**) : HRESULT
    @lpVtbl.value.get_restart_interval.call(this, prestartinterval)
  end
  def put_restart_interval(this : ITaskSettings3*, restartinterval : UInt8*) : HRESULT
    @lpVtbl.value.put_restart_interval.call(this, restartinterval)
  end
  def get_restart_count(this : ITaskSettings3*, prestartcount : Int32*) : HRESULT
    @lpVtbl.value.get_restart_count.call(this, prestartcount)
  end
  def put_restart_count(this : ITaskSettings3*, restartcount : Int32) : HRESULT
    @lpVtbl.value.put_restart_count.call(this, restartcount)
  end
  def get_multiple_instances(this : ITaskSettings3*, ppolicy : TASK_INSTANCES_POLICY*) : HRESULT
    @lpVtbl.value.get_multiple_instances.call(this, ppolicy)
  end
  def put_multiple_instances(this : ITaskSettings3*, policy : TASK_INSTANCES_POLICY) : HRESULT
    @lpVtbl.value.put_multiple_instances.call(this, policy)
  end
  def get_stop_if_going_on_batteries(this : ITaskSettings3*, pstopifonbatteries : Int16*) : HRESULT
    @lpVtbl.value.get_stop_if_going_on_batteries.call(this, pstopifonbatteries)
  end
  def put_stop_if_going_on_batteries(this : ITaskSettings3*, stopifonbatteries : Int16) : HRESULT
    @lpVtbl.value.put_stop_if_going_on_batteries.call(this, stopifonbatteries)
  end
  def get_disallow_start_if_on_batteries(this : ITaskSettings3*, pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_if_on_batteries.call(this, pdisallowstart)
  end
  def put_disallow_start_if_on_batteries(this : ITaskSettings3*, disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_if_on_batteries.call(this, disallowstart)
  end
  def get_allow_hard_terminate(this : ITaskSettings3*, pallowhardterminate : Int16*) : HRESULT
    @lpVtbl.value.get_allow_hard_terminate.call(this, pallowhardterminate)
  end
  def put_allow_hard_terminate(this : ITaskSettings3*, allowhardterminate : Int16) : HRESULT
    @lpVtbl.value.put_allow_hard_terminate.call(this, allowhardterminate)
  end
  def get_start_when_available(this : ITaskSettings3*, pstartwhenavailable : Int16*) : HRESULT
    @lpVtbl.value.get_start_when_available.call(this, pstartwhenavailable)
  end
  def put_start_when_available(this : ITaskSettings3*, startwhenavailable : Int16) : HRESULT
    @lpVtbl.value.put_start_when_available.call(this, startwhenavailable)
  end
  def get_xml_text(this : ITaskSettings3*, ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.call(this, ptext)
  end
  def put_xml_text(this : ITaskSettings3*, text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.call(this, text)
  end
  def get_run_only_if_network_available(this : ITaskSettings3*, prunonlyifnetworkavailable : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_network_available.call(this, prunonlyifnetworkavailable)
  end
  def put_run_only_if_network_available(this : ITaskSettings3*, runonlyifnetworkavailable : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_network_available.call(this, runonlyifnetworkavailable)
  end
  def get_execution_time_limit(this : ITaskSettings3*, pexecutiontimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.call(this, pexecutiontimelimit)
  end
  def put_execution_time_limit(this : ITaskSettings3*, executiontimelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.call(this, executiontimelimit)
  end
  def get_enabled(this : ITaskSettings3*, penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, penabled)
  end
  def put_enabled(this : ITaskSettings3*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_delete_expired_task_after(this : ITaskSettings3*, pexpirationdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delete_expired_task_after.call(this, pexpirationdelay)
  end
  def put_delete_expired_task_after(this : ITaskSettings3*, expirationdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_delete_expired_task_after.call(this, expirationdelay)
  end
  def get_priority(this : ITaskSettings3*, ppriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.call(this, ppriority)
  end
  def put_priority(this : ITaskSettings3*, priority : Int32) : HRESULT
    @lpVtbl.value.put_priority.call(this, priority)
  end
  def get_compatibility(this : ITaskSettings3*, pcompatlevel : TASK_COMPATIBILITY*) : HRESULT
    @lpVtbl.value.get_compatibility.call(this, pcompatlevel)
  end
  def put_compatibility(this : ITaskSettings3*, compatlevel : TASK_COMPATIBILITY) : HRESULT
    @lpVtbl.value.put_compatibility.call(this, compatlevel)
  end
  def get_hidden(this : ITaskSettings3*, phidden : Int16*) : HRESULT
    @lpVtbl.value.get_hidden.call(this, phidden)
  end
  def put_hidden(this : ITaskSettings3*, hidden : Int16) : HRESULT
    @lpVtbl.value.put_hidden.call(this, hidden)
  end
  def get_idle_settings(this : ITaskSettings3*, ppidlesettings : IIdleSettings*) : HRESULT
    @lpVtbl.value.get_idle_settings.call(this, ppidlesettings)
  end
  def put_idle_settings(this : ITaskSettings3*, pidlesettings : IIdleSettings) : HRESULT
    @lpVtbl.value.put_idle_settings.call(this, pidlesettings)
  end
  def get_run_only_if_idle(this : ITaskSettings3*, prunonlyifidle : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_idle.call(this, prunonlyifidle)
  end
  def put_run_only_if_idle(this : ITaskSettings3*, runonlyifidle : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_idle.call(this, runonlyifidle)
  end
  def get_wake_to_run(this : ITaskSettings3*, pwake : Int16*) : HRESULT
    @lpVtbl.value.get_wake_to_run.call(this, pwake)
  end
  def put_wake_to_run(this : ITaskSettings3*, wake : Int16) : HRESULT
    @lpVtbl.value.put_wake_to_run.call(this, wake)
  end
  def get_network_settings(this : ITaskSettings3*, ppnetworksettings : INetworkSettings*) : HRESULT
    @lpVtbl.value.get_network_settings.call(this, ppnetworksettings)
  end
  def put_network_settings(this : ITaskSettings3*, pnetworksettings : INetworkSettings) : HRESULT
    @lpVtbl.value.put_network_settings.call(this, pnetworksettings)
  end
  def get_disallow_start_on_remote_app_session(this : ITaskSettings3*, pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_on_remote_app_session.call(this, pdisallowstart)
  end
  def put_disallow_start_on_remote_app_session(this : ITaskSettings3*, disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_on_remote_app_session.call(this, disallowstart)
  end
  def get_use_unified_scheduling_engine(this : ITaskSettings3*, puseunifiedengine : Int16*) : HRESULT
    @lpVtbl.value.get_use_unified_scheduling_engine.call(this, puseunifiedengine)
  end
  def put_use_unified_scheduling_engine(this : ITaskSettings3*, useunifiedengine : Int16) : HRESULT
    @lpVtbl.value.put_use_unified_scheduling_engine.call(this, useunifiedengine)
  end
  def get_maintenance_settings(this : ITaskSettings3*, ppmaintenancesettings : IMaintenanceSettings*) : HRESULT
    @lpVtbl.value.get_maintenance_settings.call(this, ppmaintenancesettings)
  end
  def put_maintenance_settings(this : ITaskSettings3*, pmaintenancesettings : IMaintenanceSettings) : HRESULT
    @lpVtbl.value.put_maintenance_settings.call(this, pmaintenancesettings)
  end
  def create_maintenance_settings(this : ITaskSettings3*, ppmaintenancesettings : IMaintenanceSettings*) : HRESULT
    @lpVtbl.value.create_maintenance_settings.call(this, ppmaintenancesettings)
  end
  def get_volatile(this : ITaskSettings3*, pvolatile : Int16*) : HRESULT
    @lpVtbl.value.get_volatile.call(this, pvolatile)
  end
  def put_volatile(this : ITaskSettings3*, volatile : Int16) : HRESULT
    @lpVtbl.value.put_volatile.call(this, volatile)
  end
end
struct LibWin32::IMaintenanceSettings
  def query_interface(this : IMaintenanceSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMaintenanceSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMaintenanceSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMaintenanceSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMaintenanceSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMaintenanceSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMaintenanceSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def put_period(this : IMaintenanceSettings*, value : UInt8*) : HRESULT
    @lpVtbl.value.put_period.call(this, value)
  end
  def get_period(this : IMaintenanceSettings*, target : UInt8**) : HRESULT
    @lpVtbl.value.get_period.call(this, target)
  end
  def put_deadline(this : IMaintenanceSettings*, value : UInt8*) : HRESULT
    @lpVtbl.value.put_deadline.call(this, value)
  end
  def get_deadline(this : IMaintenanceSettings*, target : UInt8**) : HRESULT
    @lpVtbl.value.get_deadline.call(this, target)
  end
  def put_exclusive(this : IMaintenanceSettings*, value : Int16) : HRESULT
    @lpVtbl.value.put_exclusive.call(this, value)
  end
  def get_exclusive(this : IMaintenanceSettings*, target : Int16*) : HRESULT
    @lpVtbl.value.get_exclusive.call(this, target)
  end
end
struct LibWin32::IRegisteredTaskCollection
  def query_interface(this : IRegisteredTaskCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRegisteredTaskCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRegisteredTaskCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRegisteredTaskCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRegisteredTaskCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRegisteredTaskCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRegisteredTaskCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IRegisteredTaskCollection*, pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pcount)
  end
  def get_item(this : IRegisteredTaskCollection*, index : VARIANT, ppregisteredtask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, ppregisteredtask)
  end
  def get__new_enum(this : IRegisteredTaskCollection*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
end
struct LibWin32::ITaskFolder
  def query_interface(this : ITaskFolder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITaskFolder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITaskFolder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITaskFolder*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITaskFolder*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITaskFolder*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITaskFolder*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : ITaskFolder*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pname)
  end
  def get_path(this : ITaskFolder*, ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, ppath)
  end
  def get_folder(this : ITaskFolder*, path : UInt8*, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.get_folder.call(this, path, ppfolder)
  end
  def get_folders(this : ITaskFolder*, flags : Int32, ppfolders : ITaskFolderCollection*) : HRESULT
    @lpVtbl.value.get_folders.call(this, flags, ppfolders)
  end
  def create_folder(this : ITaskFolder*, subfoldername : UInt8*, sddl : VARIANT, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.create_folder.call(this, subfoldername, sddl, ppfolder)
  end
  def delete_folder(this : ITaskFolder*, subfoldername : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.delete_folder.call(this, subfoldername, flags)
  end
  def get_task(this : ITaskFolder*, path : UInt8*, pptask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.get_task.call(this, path, pptask)
  end
  def get_tasks(this : ITaskFolder*, flags : Int32, pptasks : IRegisteredTaskCollection*) : HRESULT
    @lpVtbl.value.get_tasks.call(this, flags, pptasks)
  end
  def delete_task(this : ITaskFolder*, name : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.delete_task.call(this, name, flags)
  end
  def register_task(this : ITaskFolder*, path : UInt8*, xmltext : UInt8*, flags : Int32, userid : VARIANT, password : VARIANT, logontype : TASK_LOGON_TYPE, sddl : VARIANT, pptask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.register_task.call(this, path, xmltext, flags, userid, password, logontype, sddl, pptask)
  end
  def register_task_definition(this : ITaskFolder*, path : UInt8*, pdefinition : ITaskDefinition, flags : Int32, userid : VARIANT, password : VARIANT, logontype : TASK_LOGON_TYPE, sddl : VARIANT, pptask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.register_task_definition.call(this, path, pdefinition, flags, userid, password, logontype, sddl, pptask)
  end
  def get_security_descriptor(this : ITaskFolder*, securityinformation : Int32, psddl : UInt8**) : HRESULT
    @lpVtbl.value.get_security_descriptor.call(this, securityinformation, psddl)
  end
  def set_security_descriptor(this : ITaskFolder*, sddl : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.set_security_descriptor.call(this, sddl, flags)
  end
end
struct LibWin32::IIdleSettings
  def query_interface(this : IIdleSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IIdleSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IIdleSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IIdleSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IIdleSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IIdleSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IIdleSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_idle_duration(this : IIdleSettings*, pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_idle_duration.call(this, pdelay)
  end
  def put_idle_duration(this : IIdleSettings*, delay : UInt8*) : HRESULT
    @lpVtbl.value.put_idle_duration.call(this, delay)
  end
  def get_wait_timeout(this : IIdleSettings*, ptimeout : UInt8**) : HRESULT
    @lpVtbl.value.get_wait_timeout.call(this, ptimeout)
  end
  def put_wait_timeout(this : IIdleSettings*, timeout : UInt8*) : HRESULT
    @lpVtbl.value.put_wait_timeout.call(this, timeout)
  end
  def get_stop_on_idle_end(this : IIdleSettings*, pstop : Int16*) : HRESULT
    @lpVtbl.value.get_stop_on_idle_end.call(this, pstop)
  end
  def put_stop_on_idle_end(this : IIdleSettings*, stop : Int16) : HRESULT
    @lpVtbl.value.put_stop_on_idle_end.call(this, stop)
  end
  def get_restart_on_idle(this : IIdleSettings*, prestart : Int16*) : HRESULT
    @lpVtbl.value.get_restart_on_idle.call(this, prestart)
  end
  def put_restart_on_idle(this : IIdleSettings*, restart : Int16) : HRESULT
    @lpVtbl.value.put_restart_on_idle.call(this, restart)
  end
end
struct LibWin32::INetworkSettings
  def query_interface(this : INetworkSettings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetworkSettings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetworkSettings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : INetworkSettings*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : INetworkSettings*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : INetworkSettings*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : INetworkSettings*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : INetworkSettings*, pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pname)
  end
  def put_name(this : INetworkSettings*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_id(this : INetworkSettings*, pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.call(this, pid)
  end
  def put_id(this : INetworkSettings*, id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.call(this, id)
  end
end
struct LibWin32::IRepetitionPattern
  def query_interface(this : IRepetitionPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRepetitionPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRepetitionPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRepetitionPattern*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRepetitionPattern*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRepetitionPattern*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRepetitionPattern*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_interval(this : IRepetitionPattern*, pinterval : UInt8**) : HRESULT
    @lpVtbl.value.get_interval.call(this, pinterval)
  end
  def put_interval(this : IRepetitionPattern*, interval : UInt8*) : HRESULT
    @lpVtbl.value.put_interval.call(this, interval)
  end
  def get_duration(this : IRepetitionPattern*, pduration : UInt8**) : HRESULT
    @lpVtbl.value.get_duration.call(this, pduration)
  end
  def put_duration(this : IRepetitionPattern*, duration : UInt8*) : HRESULT
    @lpVtbl.value.put_duration.call(this, duration)
  end
  def get_stop_at_duration_end(this : IRepetitionPattern*, pstop : Int16*) : HRESULT
    @lpVtbl.value.get_stop_at_duration_end.call(this, pstop)
  end
  def put_stop_at_duration_end(this : IRepetitionPattern*, stop : Int16) : HRESULT
    @lpVtbl.value.put_stop_at_duration_end.call(this, stop)
  end
end
