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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_trigger : UInt64
    get_trigger : UInt64
    get_trigger_string : UInt64
  end

  ITaskTrigger_GUID = "148bd52b-a2ab-11ce-b11f-00aa00530503"
  IID_ITaskTrigger = LibC::GUID.new(0x148bd52b_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
  struct ITaskTrigger
    lpVtbl : ITaskTriggerVTbl*
  end

  struct IScheduledWorkItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_trigger : UInt64
    delete_trigger : UInt64
    get_trigger_count : UInt64
    get_trigger : UInt64
    get_trigger_string : UInt64
    get_run_times : UInt64
    get_next_run_time : UInt64
    set_idle_wait : UInt64
    get_idle_wait : UInt64
    run : UInt64
    terminate : UInt64
    edit_work_item : UInt64
    get_most_recent_run_time : UInt64
    get_status : UInt64
    get_exit_code : UInt64
    set_comment : UInt64
    get_comment : UInt64
    set_creator : UInt64
    get_creator : UInt64
    set_work_item_data : UInt64
    get_work_item_data : UInt64
    set_error_retry_count : UInt64
    get_error_retry_count : UInt64
    set_error_retry_interval : UInt64
    get_error_retry_interval : UInt64
    set_flags : UInt64
    get_flags : UInt64
    set_account_information : UInt64
    get_account_information : UInt64
  end

  IScheduledWorkItem_GUID = "a6b952f0-a4b1-11d0-997d-00aa006887ec"
  IID_IScheduledWorkItem = LibC::GUID.new(0xa6b952f0_u32, 0xa4b1_u16, 0x11d0_u16, StaticArray[0x99_u8, 0x7d_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x68_u8, 0x87_u8, 0xec_u8])
  struct IScheduledWorkItem
    lpVtbl : IScheduledWorkItemVTbl*
  end

  struct ITaskVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_trigger : UInt64
    delete_trigger : UInt64
    get_trigger_count : UInt64
    get_trigger : UInt64
    get_trigger_string : UInt64
    get_run_times : UInt64
    get_next_run_time : UInt64
    set_idle_wait : UInt64
    get_idle_wait : UInt64
    run : UInt64
    terminate : UInt64
    edit_work_item : UInt64
    get_most_recent_run_time : UInt64
    get_status : UInt64
    get_exit_code : UInt64
    set_comment : UInt64
    get_comment : UInt64
    set_creator : UInt64
    get_creator : UInt64
    set_work_item_data : UInt64
    get_work_item_data : UInt64
    set_error_retry_count : UInt64
    get_error_retry_count : UInt64
    set_error_retry_interval : UInt64
    get_error_retry_interval : UInt64
    set_flags : UInt64
    get_flags : UInt64
    set_account_information : UInt64
    get_account_information : UInt64
    set_application_name : UInt64
    get_application_name : UInt64
    set_parameters : UInt64
    get_parameters : UInt64
    set_working_directory : UInt64
    get_working_directory : UInt64
    set_priority : UInt64
    get_priority : UInt64
    set_task_flags : UInt64
    get_task_flags : UInt64
    set_max_run_time : UInt64
    get_max_run_time : UInt64
  end

  ITask_GUID = "148bd524-a2ab-11ce-b11f-00aa00530503"
  IID_ITask = LibC::GUID.new(0x148bd524_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
  struct ITask
    lpVtbl : ITaskVTbl*
  end

  struct IEnumWorkItemsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumWorkItems_GUID = "148bd528-a2ab-11ce-b11f-00aa00530503"
  IID_IEnumWorkItems = LibC::GUID.new(0x148bd528_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
  struct IEnumWorkItems
    lpVtbl : IEnumWorkItemsVTbl*
  end

  struct ITaskSchedulerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_target_computer : UInt64
    get_target_computer : UInt64
    enum : UInt64
    activate : UInt64
    delete : UInt64
    new_work_item : UInt64
    add_work_item : UInt64
    is_of_type : UInt64
  end

  ITaskScheduler_GUID = "148bd527-a2ab-11ce-b11f-00aa00530503"
  IID_ITaskScheduler = LibC::GUID.new(0x148bd527_u32, 0xa2ab_u16, 0x11ce_u16, StaticArray[0xb1_u8, 0x1f_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x53_u8, 0x5_u8, 0x3_u8])
  struct ITaskScheduler
    lpVtbl : ITaskSchedulerVTbl*
  end

  struct IProvideTaskPageVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_page : UInt64
  end

  IProvideTaskPage_GUID = "4086658a-cbbb-11cf-b604-00c04fd8d565"
  IID_IProvideTaskPage = LibC::GUID.new(0x4086658a_u32, 0xcbbb_u16, 0x11cf_u16, StaticArray[0xb6_u8, 0x4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xd8_u8, 0xd5_u8, 0x65_u8])
  struct IProvideTaskPage
    lpVtbl : IProvideTaskPageVTbl*
  end

  struct ITaskFolderCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  ITaskFolderCollection_GUID = "79184a66-8664-423f-97f1-637356a5d812"
  IID_ITaskFolderCollection = LibC::GUID.new(0x79184a66_u32, 0x8664_u16, 0x423f_u16, StaticArray[0x97_u8, 0xf1_u8, 0x63_u8, 0x73_u8, 0x56_u8, 0xa5_u8, 0xd8_u8, 0x12_u8])
  struct ITaskFolderCollection
    lpVtbl : ITaskFolderCollectionVTbl*
  end

  struct ITaskServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_folder : UInt64
    get_running_tasks : UInt64
    new_task : UInt64
    connect : UInt64
    get_connected : UInt64
    get_target_server : UInt64
    get_connected_user : UInt64
    get_connected_domain : UInt64
    get_highest_version : UInt64
  end

  ITaskService_GUID = "2faba4c7-4da9-4013-9697-20cc3fd40f85"
  IID_ITaskService = LibC::GUID.new(0x2faba4c7_u32, 0x4da9_u16, 0x4013_u16, StaticArray[0x96_u8, 0x97_u8, 0x20_u8, 0xcc_u8, 0x3f_u8, 0xd4_u8, 0xf_u8, 0x85_u8])
  struct ITaskService
    lpVtbl : ITaskServiceVTbl*
  end

  struct ITaskHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start : UInt64
    stop : UInt64
    pause : UInt64
    resume : UInt64
  end

  ITaskHandler_GUID = "839d7762-5121-4009-9234-4f0d19394f04"
  IID_ITaskHandler = LibC::GUID.new(0x839d7762_u32, 0x5121_u16, 0x4009_u16, StaticArray[0x92_u8, 0x34_u8, 0x4f_u8, 0xd_u8, 0x19_u8, 0x39_u8, 0x4f_u8, 0x4_u8])
  struct ITaskHandler
    lpVtbl : ITaskHandlerVTbl*
  end

  struct ITaskHandlerStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    update_status : UInt64
    task_completed : UInt64
  end

  ITaskHandlerStatus_GUID = "eaec7a8f-27a0-4ddc-8675-14726a01a38a"
  IID_ITaskHandlerStatus = LibC::GUID.new(0xeaec7a8f_u32, 0x27a0_u16, 0x4ddc_u16, StaticArray[0x86_u8, 0x75_u8, 0x14_u8, 0x72_u8, 0x6a_u8, 0x1_u8, 0xa3_u8, 0x8a_u8])
  struct ITaskHandlerStatus
    lpVtbl : ITaskHandlerStatusVTbl*
  end

  struct ITaskVariablesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input : UInt64
    set_output : UInt64
    get_context : UInt64
  end

  ITaskVariables_GUID = "3e4c9351-d966-4b8b-bb87-ceba68bb0107"
  IID_ITaskVariables = LibC::GUID.new(0x3e4c9351_u32, 0xd966_u16, 0x4b8b_u16, StaticArray[0xbb_u8, 0x87_u8, 0xce_u8, 0xba_u8, 0x68_u8, 0xbb_u8, 0x1_u8, 0x7_u8])
  struct ITaskVariables
    lpVtbl : ITaskVariablesVTbl*
  end

  struct ITaskNamedValuePairVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_value : UInt64
    put_value : UInt64
  end

  ITaskNamedValuePair_GUID = "39038068-2b46-4afd-8662-7bb6f868d221"
  IID_ITaskNamedValuePair = LibC::GUID.new(0x39038068_u32, 0x2b46_u16, 0x4afd_u16, StaticArray[0x86_u8, 0x62_u8, 0x7b_u8, 0xb6_u8, 0xf8_u8, 0x68_u8, 0xd2_u8, 0x21_u8])
  struct ITaskNamedValuePair
    lpVtbl : ITaskNamedValuePairVTbl*
  end

  struct ITaskNamedValueCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    create : UInt64
    remove : UInt64
    clear : UInt64
  end

  ITaskNamedValueCollection_GUID = "b4ef826b-63c3-46e4-a504-ef69e4f7ea4d"
  IID_ITaskNamedValueCollection = LibC::GUID.new(0xb4ef826b_u32, 0x63c3_u16, 0x46e4_u16, StaticArray[0xa5_u8, 0x4_u8, 0xef_u8, 0x69_u8, 0xe4_u8, 0xf7_u8, 0xea_u8, 0x4d_u8])
  struct ITaskNamedValueCollection
    lpVtbl : ITaskNamedValueCollectionVTbl*
  end

  struct IRunningTaskVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_instance_guid : UInt64
    get_path : UInt64
    get_state : UInt64
    get_current_action : UInt64
    stop : UInt64
    refresh : UInt64
    get_engine_pid : UInt64
  end

  IRunningTask_GUID = "653758fb-7b9a-4f1e-a471-beeb8e9b834e"
  IID_IRunningTask = LibC::GUID.new(0x653758fb_u32, 0x7b9a_u16, 0x4f1e_u16, StaticArray[0xa4_u8, 0x71_u8, 0xbe_u8, 0xeb_u8, 0x8e_u8, 0x9b_u8, 0x83_u8, 0x4e_u8])
  struct IRunningTask
    lpVtbl : IRunningTaskVTbl*
  end

  struct IRunningTaskCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IRunningTaskCollection_GUID = "6a67614b-6828-4fec-aa54-6d52e8f1f2db"
  IID_IRunningTaskCollection = LibC::GUID.new(0x6a67614b_u32, 0x6828_u16, 0x4fec_u16, StaticArray[0xaa_u8, 0x54_u8, 0x6d_u8, 0x52_u8, 0xe8_u8, 0xf1_u8, 0xf2_u8, 0xdb_u8])
  struct IRunningTaskCollection
    lpVtbl : IRunningTaskCollectionVTbl*
  end

  struct IRegisteredTaskVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_path : UInt64
    get_state : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    run : UInt64
    run_ex : UInt64
    get_instances : UInt64
    get_last_run_time : UInt64
    get_last_task_result : UInt64
    get_number_of_missed_runs : UInt64
    get_next_run_time : UInt64
    get_definition : UInt64
    get_xml : UInt64
    get_security_descriptor : UInt64
    set_security_descriptor : UInt64
    stop : UInt64
    get_run_times : UInt64
  end

  IRegisteredTask_GUID = "9c86f320-dee3-4dd1-b972-a303f26b061e"
  IID_IRegisteredTask = LibC::GUID.new(0x9c86f320_u32, 0xdee3_u16, 0x4dd1_u16, StaticArray[0xb9_u8, 0x72_u8, 0xa3_u8, 0x3_u8, 0xf2_u8, 0x6b_u8, 0x6_u8, 0x1e_u8])
  struct IRegisteredTask
    lpVtbl : IRegisteredTaskVTbl*
  end

  struct ITriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
  end

  ITrigger_GUID = "09941815-ea89-4b5b-89e0-2a773801fac3"
  IID_ITrigger = LibC::GUID.new(0x9941815_u32, 0xea89_u16, 0x4b5b_u16, StaticArray[0x89_u8, 0xe0_u8, 0x2a_u8, 0x77_u8, 0x38_u8, 0x1_u8, 0xfa_u8, 0xc3_u8])
  struct ITrigger
    lpVtbl : ITriggerVTbl*
  end

  struct IIdleTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
  end

  IIdleTrigger_GUID = "d537d2b0-9fb3-4d34-9739-1ff5ce7b1ef3"
  IID_IIdleTrigger = LibC::GUID.new(0xd537d2b0_u32, 0x9fb3_u16, 0x4d34_u16, StaticArray[0x97_u8, 0x39_u8, 0x1f_u8, 0xf5_u8, 0xce_u8, 0x7b_u8, 0x1e_u8, 0xf3_u8])
  struct IIdleTrigger
    lpVtbl : IIdleTriggerVTbl*
  end

  struct ILogonTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_delay : UInt64
    put_delay : UInt64
    get_user_id : UInt64
    put_user_id : UInt64
  end

  ILogonTrigger_GUID = "72dade38-fae4-4b3e-baf4-5d009af02b1c"
  IID_ILogonTrigger = LibC::GUID.new(0x72dade38_u32, 0xfae4_u16, 0x4b3e_u16, StaticArray[0xba_u8, 0xf4_u8, 0x5d_u8, 0x0_u8, 0x9a_u8, 0xf0_u8, 0x2b_u8, 0x1c_u8])
  struct ILogonTrigger
    lpVtbl : ILogonTriggerVTbl*
  end

  struct ISessionStateChangeTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_delay : UInt64
    put_delay : UInt64
    get_user_id : UInt64
    put_user_id : UInt64
    get_state_change : UInt64
    put_state_change : UInt64
  end

  ISessionStateChangeTrigger_GUID = "754da71b-4385-4475-9dd9-598294fa3641"
  IID_ISessionStateChangeTrigger = LibC::GUID.new(0x754da71b_u32, 0x4385_u16, 0x4475_u16, StaticArray[0x9d_u8, 0xd9_u8, 0x59_u8, 0x82_u8, 0x94_u8, 0xfa_u8, 0x36_u8, 0x41_u8])
  struct ISessionStateChangeTrigger
    lpVtbl : ISessionStateChangeTriggerVTbl*
  end

  struct IEventTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_subscription : UInt64
    put_subscription : UInt64
    get_delay : UInt64
    put_delay : UInt64
    get_value_queries : UInt64
    put_value_queries : UInt64
  end

  IEventTrigger_GUID = "d45b0167-9653-4eef-b94f-0732ca7af251"
  IID_IEventTrigger = LibC::GUID.new(0xd45b0167_u32, 0x9653_u16, 0x4eef_u16, StaticArray[0xb9_u8, 0x4f_u8, 0x7_u8, 0x32_u8, 0xca_u8, 0x7a_u8, 0xf2_u8, 0x51_u8])
  struct IEventTrigger
    lpVtbl : IEventTriggerVTbl*
  end

  struct ITimeTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_random_delay : UInt64
    put_random_delay : UInt64
  end

  ITimeTrigger_GUID = "b45747e0-eba7-4276-9f29-85c5bb300006"
  IID_ITimeTrigger = LibC::GUID.new(0xb45747e0_u32, 0xeba7_u16, 0x4276_u16, StaticArray[0x9f_u8, 0x29_u8, 0x85_u8, 0xc5_u8, 0xbb_u8, 0x30_u8, 0x0_u8, 0x6_u8])
  struct ITimeTrigger
    lpVtbl : ITimeTriggerVTbl*
  end

  struct IDailyTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_days_interval : UInt64
    put_days_interval : UInt64
    get_random_delay : UInt64
    put_random_delay : UInt64
  end

  IDailyTrigger_GUID = "126c5cd8-b288-41d5-8dbf-e491446adc5c"
  IID_IDailyTrigger = LibC::GUID.new(0x126c5cd8_u32, 0xb288_u16, 0x41d5_u16, StaticArray[0x8d_u8, 0xbf_u8, 0xe4_u8, 0x91_u8, 0x44_u8, 0x6a_u8, 0xdc_u8, 0x5c_u8])
  struct IDailyTrigger
    lpVtbl : IDailyTriggerVTbl*
  end

  struct IWeeklyTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_days_of_week : UInt64
    put_days_of_week : UInt64
    get_weeks_interval : UInt64
    put_weeks_interval : UInt64
    get_random_delay : UInt64
    put_random_delay : UInt64
  end

  IWeeklyTrigger_GUID = "5038fc98-82ff-436d-8728-a512a57c9dc1"
  IID_IWeeklyTrigger = LibC::GUID.new(0x5038fc98_u32, 0x82ff_u16, 0x436d_u16, StaticArray[0x87_u8, 0x28_u8, 0xa5_u8, 0x12_u8, 0xa5_u8, 0x7c_u8, 0x9d_u8, 0xc1_u8])
  struct IWeeklyTrigger
    lpVtbl : IWeeklyTriggerVTbl*
  end

  struct IMonthlyTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_days_of_month : UInt64
    put_days_of_month : UInt64
    get_months_of_year : UInt64
    put_months_of_year : UInt64
    get_run_on_last_day_of_month : UInt64
    put_run_on_last_day_of_month : UInt64
    get_random_delay : UInt64
    put_random_delay : UInt64
  end

  IMonthlyTrigger_GUID = "97c45ef1-6b02-4a1a-9c0e-1ebfba1500ac"
  IID_IMonthlyTrigger = LibC::GUID.new(0x97c45ef1_u32, 0x6b02_u16, 0x4a1a_u16, StaticArray[0x9c_u8, 0xe_u8, 0x1e_u8, 0xbf_u8, 0xba_u8, 0x15_u8, 0x0_u8, 0xac_u8])
  struct IMonthlyTrigger
    lpVtbl : IMonthlyTriggerVTbl*
  end

  struct IMonthlyDOWTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_days_of_week : UInt64
    put_days_of_week : UInt64
    get_weeks_of_month : UInt64
    put_weeks_of_month : UInt64
    get_months_of_year : UInt64
    put_months_of_year : UInt64
    get_run_on_last_week_of_month : UInt64
    put_run_on_last_week_of_month : UInt64
    get_random_delay : UInt64
    put_random_delay : UInt64
  end

  IMonthlyDOWTrigger_GUID = "77d025a3-90fa-43aa-b52e-cda5499b946a"
  IID_IMonthlyDOWTrigger = LibC::GUID.new(0x77d025a3_u32, 0x90fa_u16, 0x43aa_u16, StaticArray[0xb5_u8, 0x2e_u8, 0xcd_u8, 0xa5_u8, 0x49_u8, 0x9b_u8, 0x94_u8, 0x6a_u8])
  struct IMonthlyDOWTrigger
    lpVtbl : IMonthlyDOWTriggerVTbl*
  end

  struct IBootTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_delay : UInt64
    put_delay : UInt64
  end

  IBootTrigger_GUID = "2a9c35da-d357-41f4-bbc1-207ac1b1f3cb"
  IID_IBootTrigger = LibC::GUID.new(0x2a9c35da_u32, 0xd357_u16, 0x41f4_u16, StaticArray[0xbb_u8, 0xc1_u8, 0x20_u8, 0x7a_u8, 0xc1_u8, 0xb1_u8, 0xf3_u8, 0xcb_u8])
  struct IBootTrigger
    lpVtbl : IBootTriggerVTbl*
  end

  struct IRegistrationTriggerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_id : UInt64
    put_id : UInt64
    get_repetition : UInt64
    put_repetition : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_start_boundary : UInt64
    put_start_boundary : UInt64
    get_end_boundary : UInt64
    put_end_boundary : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_delay : UInt64
    put_delay : UInt64
  end

  IRegistrationTrigger_GUID = "4c8fec3a-c218-4e0c-b23d-629024db91a2"
  IID_IRegistrationTrigger = LibC::GUID.new(0x4c8fec3a_u32, 0xc218_u16, 0x4e0c_u16, StaticArray[0xb2_u8, 0x3d_u8, 0x62_u8, 0x90_u8, 0x24_u8, 0xdb_u8, 0x91_u8, 0xa2_u8])
  struct IRegistrationTrigger
    lpVtbl : IRegistrationTriggerVTbl*
  end

  struct IActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_type : UInt64
  end

  IAction_GUID = "bae54997-48b1-4cbe-9965-d6be263ebea4"
  IID_IAction = LibC::GUID.new(0xbae54997_u32, 0x48b1_u16, 0x4cbe_u16, StaticArray[0x99_u8, 0x65_u8, 0xd6_u8, 0xbe_u8, 0x26_u8, 0x3e_u8, 0xbe_u8, 0xa4_u8])
  struct IAction
    lpVtbl : IActionVTbl*
  end

  struct IExecActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_type : UInt64
    get_path : UInt64
    put_path : UInt64
    get_arguments : UInt64
    put_arguments : UInt64
    get_working_directory : UInt64
    put_working_directory : UInt64
  end

  IExecAction_GUID = "4c3d624d-fd6b-49a3-b9b7-09cb3cd3f047"
  IID_IExecAction = LibC::GUID.new(0x4c3d624d_u32, 0xfd6b_u16, 0x49a3_u16, StaticArray[0xb9_u8, 0xb7_u8, 0x9_u8, 0xcb_u8, 0x3c_u8, 0xd3_u8, 0xf0_u8, 0x47_u8])
  struct IExecAction
    lpVtbl : IExecActionVTbl*
  end

  struct IExecAction2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_type : UInt64
    get_path : UInt64
    put_path : UInt64
    get_arguments : UInt64
    put_arguments : UInt64
    get_working_directory : UInt64
    put_working_directory : UInt64
    get_hide_app_window : UInt64
    put_hide_app_window : UInt64
  end

  IExecAction2_GUID = "f2a82542-bda5-4e6b-9143-e2bf4f8987b6"
  IID_IExecAction2 = LibC::GUID.new(0xf2a82542_u32, 0xbda5_u16, 0x4e6b_u16, StaticArray[0x91_u8, 0x43_u8, 0xe2_u8, 0xbf_u8, 0x4f_u8, 0x89_u8, 0x87_u8, 0xb6_u8])
  struct IExecAction2
    lpVtbl : IExecAction2VTbl*
  end

  struct IShowMessageActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_type : UInt64
    get_title : UInt64
    put_title : UInt64
    get_message_body : UInt64
    put_message_body : UInt64
  end

  IShowMessageAction_GUID = "505e9e68-af89-46b8-a30f-56162a83d537"
  IID_IShowMessageAction = LibC::GUID.new(0x505e9e68_u32, 0xaf89_u16, 0x46b8_u16, StaticArray[0xa3_u8, 0xf_u8, 0x56_u8, 0x16_u8, 0x2a_u8, 0x83_u8, 0xd5_u8, 0x37_u8])
  struct IShowMessageAction
    lpVtbl : IShowMessageActionVTbl*
  end

  struct IComHandlerActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_type : UInt64
    get_class_id : UInt64
    put_class_id : UInt64
    get_data : UInt64
    put_data : UInt64
  end

  IComHandlerAction_GUID = "6d2fd252-75c5-4f66-90ba-2a7d8cc3039f"
  IID_IComHandlerAction = LibC::GUID.new(0x6d2fd252_u32, 0x75c5_u16, 0x4f66_u16, StaticArray[0x90_u8, 0xba_u8, 0x2a_u8, 0x7d_u8, 0x8c_u8, 0xc3_u8, 0x3_u8, 0x9f_u8])
  struct IComHandlerAction
    lpVtbl : IComHandlerActionVTbl*
  end

  struct IEmailActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_type : UInt64
    get_server : UInt64
    put_server : UInt64
    get_subject : UInt64
    put_subject : UInt64
    get_to : UInt64
    put_to : UInt64
    get_cc : UInt64
    put_cc : UInt64
    get_bcc : UInt64
    put_bcc : UInt64
    get_reply_to : UInt64
    put_reply_to : UInt64
    get_from : UInt64
    put_from : UInt64
    get_header_fields : UInt64
    put_header_fields : UInt64
    get_body : UInt64
    put_body : UInt64
    get_attachments : UInt64
    put_attachments : UInt64
  end

  IEmailAction_GUID = "10f62c64-7e16-4314-a0c2-0c3683f99d40"
  IID_IEmailAction = LibC::GUID.new(0x10f62c64_u32, 0x7e16_u16, 0x4314_u16, StaticArray[0xa0_u8, 0xc2_u8, 0xc_u8, 0x36_u8, 0x83_u8, 0xf9_u8, 0x9d_u8, 0x40_u8])
  struct IEmailAction
    lpVtbl : IEmailActionVTbl*
  end

  struct ITriggerCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    create : UInt64
    remove : UInt64
    clear : UInt64
  end

  ITriggerCollection_GUID = "85df5081-1b24-4f32-878a-d9d14df4cb77"
  IID_ITriggerCollection = LibC::GUID.new(0x85df5081_u32, 0x1b24_u16, 0x4f32_u16, StaticArray[0x87_u8, 0x8a_u8, 0xd9_u8, 0xd1_u8, 0x4d_u8, 0xf4_u8, 0xcb_u8, 0x77_u8])
  struct ITriggerCollection
    lpVtbl : ITriggerCollectionVTbl*
  end

  struct IActionCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_xml_text : UInt64
    put_xml_text : UInt64
    create : UInt64
    remove : UInt64
    clear : UInt64
    get_context : UInt64
    put_context : UInt64
  end

  IActionCollection_GUID = "02820e19-7b98-4ed2-b2e8-fdccceff619b"
  IID_IActionCollection = LibC::GUID.new(0x2820e19_u32, 0x7b98_u16, 0x4ed2_u16, StaticArray[0xb2_u8, 0xe8_u8, 0xfd_u8, 0xcc_u8, 0xce_u8, 0xff_u8, 0x61_u8, 0x9b_u8])
  struct IActionCollection
    lpVtbl : IActionCollectionVTbl*
  end

  struct IPrincipalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    put_id : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_user_id : UInt64
    put_user_id : UInt64
    get_logon_type : UInt64
    put_logon_type : UInt64
    get_group_id : UInt64
    put_group_id : UInt64
    get_run_level : UInt64
    put_run_level : UInt64
  end

  IPrincipal_GUID = "d98d51e5-c9b4-496a-a9c1-18980261cf0f"
  IID_IPrincipal = LibC::GUID.new(0xd98d51e5_u32, 0xc9b4_u16, 0x496a_u16, StaticArray[0xa9_u8, 0xc1_u8, 0x18_u8, 0x98_u8, 0x2_u8, 0x61_u8, 0xcf_u8, 0xf_u8])
  struct IPrincipal
    lpVtbl : IPrincipalVTbl*
  end

  struct IPrincipal2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_process_token_sid_type : UInt64
    put_process_token_sid_type : UInt64
    get_required_privilege_count : UInt64
    get_required_privilege : UInt64
    add_required_privilege : UInt64
  end

  IPrincipal2_GUID = "248919ae-e345-4a6d-8aeb-e0d3165c904e"
  IID_IPrincipal2 = LibC::GUID.new(0x248919ae_u32, 0xe345_u16, 0x4a6d_u16, StaticArray[0x8a_u8, 0xeb_u8, 0xe0_u8, 0xd3_u8, 0x16_u8, 0x5c_u8, 0x90_u8, 0x4e_u8])
  struct IPrincipal2
    lpVtbl : IPrincipal2VTbl*
  end

  struct IRegistrationInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_description : UInt64
    put_description : UInt64
    get_author : UInt64
    put_author : UInt64
    get_version : UInt64
    put_version : UInt64
    get_date : UInt64
    put_date : UInt64
    get_documentation : UInt64
    put_documentation : UInt64
    get_xml_text : UInt64
    put_xml_text : UInt64
    get_uri : UInt64
    put_uri : UInt64
    get_security_descriptor : UInt64
    put_security_descriptor : UInt64
    get_source : UInt64
    put_source : UInt64
  end

  IRegistrationInfo_GUID = "416d8b73-cb41-4ea1-805c-9be9a5ac4a74"
  IID_IRegistrationInfo = LibC::GUID.new(0x416d8b73_u32, 0xcb41_u16, 0x4ea1_u16, StaticArray[0x80_u8, 0x5c_u8, 0x9b_u8, 0xe9_u8, 0xa5_u8, 0xac_u8, 0x4a_u8, 0x74_u8])
  struct IRegistrationInfo
    lpVtbl : IRegistrationInfoVTbl*
  end

  struct ITaskDefinitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_registration_info : UInt64
    put_registration_info : UInt64
    get_triggers : UInt64
    put_triggers : UInt64
    get_settings : UInt64
    put_settings : UInt64
    get_data : UInt64
    put_data : UInt64
    get_principal : UInt64
    put_principal : UInt64
    get_actions : UInt64
    put_actions : UInt64
    get_xml_text : UInt64
    put_xml_text : UInt64
  end

  ITaskDefinition_GUID = "f5bc8fc5-536d-4f77-b852-fbc1356fdeb6"
  IID_ITaskDefinition = LibC::GUID.new(0xf5bc8fc5_u32, 0x536d_u16, 0x4f77_u16, StaticArray[0xb8_u8, 0x52_u8, 0xfb_u8, 0xc1_u8, 0x35_u8, 0x6f_u8, 0xde_u8, 0xb6_u8])
  struct ITaskDefinition
    lpVtbl : ITaskDefinitionVTbl*
  end

  struct ITaskSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_allow_demand_start : UInt64
    put_allow_demand_start : UInt64
    get_restart_interval : UInt64
    put_restart_interval : UInt64
    get_restart_count : UInt64
    put_restart_count : UInt64
    get_multiple_instances : UInt64
    put_multiple_instances : UInt64
    get_stop_if_going_on_batteries : UInt64
    put_stop_if_going_on_batteries : UInt64
    get_disallow_start_if_on_batteries : UInt64
    put_disallow_start_if_on_batteries : UInt64
    get_allow_hard_terminate : UInt64
    put_allow_hard_terminate : UInt64
    get_start_when_available : UInt64
    put_start_when_available : UInt64
    get_xml_text : UInt64
    put_xml_text : UInt64
    get_run_only_if_network_available : UInt64
    put_run_only_if_network_available : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_delete_expired_task_after : UInt64
    put_delete_expired_task_after : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_compatibility : UInt64
    put_compatibility : UInt64
    get_hidden : UInt64
    put_hidden : UInt64
    get_idle_settings : UInt64
    put_idle_settings : UInt64
    get_run_only_if_idle : UInt64
    put_run_only_if_idle : UInt64
    get_wake_to_run : UInt64
    put_wake_to_run : UInt64
    get_network_settings : UInt64
    put_network_settings : UInt64
  end

  ITaskSettings_GUID = "8fd4711d-2d02-4c8c-87e3-eff699de127e"
  IID_ITaskSettings = LibC::GUID.new(0x8fd4711d_u32, 0x2d02_u16, 0x4c8c_u16, StaticArray[0x87_u8, 0xe3_u8, 0xef_u8, 0xf6_u8, 0x99_u8, 0xde_u8, 0x12_u8, 0x7e_u8])
  struct ITaskSettings
    lpVtbl : ITaskSettingsVTbl*
  end

  struct ITaskSettings2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_disallow_start_on_remote_app_session : UInt64
    put_disallow_start_on_remote_app_session : UInt64
    get_use_unified_scheduling_engine : UInt64
    put_use_unified_scheduling_engine : UInt64
  end

  ITaskSettings2_GUID = "2c05c3f0-6eed-4c05-a15f-ed7d7a98a369"
  IID_ITaskSettings2 = LibC::GUID.new(0x2c05c3f0_u32, 0x6eed_u16, 0x4c05_u16, StaticArray[0xa1_u8, 0x5f_u8, 0xed_u8, 0x7d_u8, 0x7a_u8, 0x98_u8, 0xa3_u8, 0x69_u8])
  struct ITaskSettings2
    lpVtbl : ITaskSettings2VTbl*
  end

  struct ITaskSettings3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_allow_demand_start : UInt64
    put_allow_demand_start : UInt64
    get_restart_interval : UInt64
    put_restart_interval : UInt64
    get_restart_count : UInt64
    put_restart_count : UInt64
    get_multiple_instances : UInt64
    put_multiple_instances : UInt64
    get_stop_if_going_on_batteries : UInt64
    put_stop_if_going_on_batteries : UInt64
    get_disallow_start_if_on_batteries : UInt64
    put_disallow_start_if_on_batteries : UInt64
    get_allow_hard_terminate : UInt64
    put_allow_hard_terminate : UInt64
    get_start_when_available : UInt64
    put_start_when_available : UInt64
    get_xml_text : UInt64
    put_xml_text : UInt64
    get_run_only_if_network_available : UInt64
    put_run_only_if_network_available : UInt64
    get_execution_time_limit : UInt64
    put_execution_time_limit : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_delete_expired_task_after : UInt64
    put_delete_expired_task_after : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_compatibility : UInt64
    put_compatibility : UInt64
    get_hidden : UInt64
    put_hidden : UInt64
    get_idle_settings : UInt64
    put_idle_settings : UInt64
    get_run_only_if_idle : UInt64
    put_run_only_if_idle : UInt64
    get_wake_to_run : UInt64
    put_wake_to_run : UInt64
    get_network_settings : UInt64
    put_network_settings : UInt64
    get_disallow_start_on_remote_app_session : UInt64
    put_disallow_start_on_remote_app_session : UInt64
    get_use_unified_scheduling_engine : UInt64
    put_use_unified_scheduling_engine : UInt64
    get_maintenance_settings : UInt64
    put_maintenance_settings : UInt64
    create_maintenance_settings : UInt64
    get_volatile : UInt64
    put_volatile : UInt64
  end

  ITaskSettings3_GUID = "0ad9d0d7-0c7f-4ebb-9a5f-d1c648dca528"
  IID_ITaskSettings3 = LibC::GUID.new(0xad9d0d7_u32, 0xc7f_u16, 0x4ebb_u16, StaticArray[0x9a_u8, 0x5f_u8, 0xd1_u8, 0xc6_u8, 0x48_u8, 0xdc_u8, 0xa5_u8, 0x28_u8])
  struct ITaskSettings3
    lpVtbl : ITaskSettings3VTbl*
  end

  struct IMaintenanceSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    put_period : UInt64
    get_period : UInt64
    put_deadline : UInt64
    get_deadline : UInt64
    put_exclusive : UInt64
    get_exclusive : UInt64
  end

  IMaintenanceSettings_GUID = "a6024fa8-9652-4adb-a6bf-5cfcd877a7ba"
  IID_IMaintenanceSettings = LibC::GUID.new(0xa6024fa8_u32, 0x9652_u16, 0x4adb_u16, StaticArray[0xa6_u8, 0xbf_u8, 0x5c_u8, 0xfc_u8, 0xd8_u8, 0x77_u8, 0xa7_u8, 0xba_u8])
  struct IMaintenanceSettings
    lpVtbl : IMaintenanceSettingsVTbl*
  end

  struct IRegisteredTaskCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  IRegisteredTaskCollection_GUID = "86627eb4-42a7-41e4-a4d9-ac33a72f2d52"
  IID_IRegisteredTaskCollection = LibC::GUID.new(0x86627eb4_u32, 0x42a7_u16, 0x41e4_u16, StaticArray[0xa4_u8, 0xd9_u8, 0xac_u8, 0x33_u8, 0xa7_u8, 0x2f_u8, 0x2d_u8, 0x52_u8])
  struct IRegisteredTaskCollection
    lpVtbl : IRegisteredTaskCollectionVTbl*
  end

  struct ITaskFolderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_path : UInt64
    get_folder : UInt64
    get_folders : UInt64
    create_folder : UInt64
    delete_folder : UInt64
    get_task : UInt64
    get_tasks : UInt64
    delete_task : UInt64
    register_task : UInt64
    register_task_definition : UInt64
    get_security_descriptor : UInt64
    set_security_descriptor : UInt64
  end

  ITaskFolder_GUID = "8cfac062-a080-4c15-9a88-aa7c2af80dfc"
  IID_ITaskFolder = LibC::GUID.new(0x8cfac062_u32, 0xa080_u16, 0x4c15_u16, StaticArray[0x9a_u8, 0x88_u8, 0xaa_u8, 0x7c_u8, 0x2a_u8, 0xf8_u8, 0xd_u8, 0xfc_u8])
  struct ITaskFolder
    lpVtbl : ITaskFolderVTbl*
  end

  struct IIdleSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_idle_duration : UInt64
    put_idle_duration : UInt64
    get_wait_timeout : UInt64
    put_wait_timeout : UInt64
    get_stop_on_idle_end : UInt64
    put_stop_on_idle_end : UInt64
    get_restart_on_idle : UInt64
    put_restart_on_idle : UInt64
  end

  IIdleSettings_GUID = "84594461-0053-4342-a8fd-088fabf11f32"
  IID_IIdleSettings = LibC::GUID.new(0x84594461_u32, 0x53_u16, 0x4342_u16, StaticArray[0xa8_u8, 0xfd_u8, 0x8_u8, 0x8f_u8, 0xab_u8, 0xf1_u8, 0x1f_u8, 0x32_u8])
  struct IIdleSettings
    lpVtbl : IIdleSettingsVTbl*
  end

  struct INetworkSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_id : UInt64
    put_id : UInt64
  end

  INetworkSettings_GUID = "9f7dea84-c30b-4245-80b6-00e9f646f1b4"
  IID_INetworkSettings = LibC::GUID.new(0x9f7dea84_u32, 0xc30b_u16, 0x4245_u16, StaticArray[0x80_u8, 0xb6_u8, 0x0_u8, 0xe9_u8, 0xf6_u8, 0x46_u8, 0xf1_u8, 0xb4_u8])
  struct INetworkSettings
    lpVtbl : INetworkSettingsVTbl*
  end

  struct IRepetitionPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_interval : UInt64
    put_interval : UInt64
    get_duration : UInt64
    put_duration : UInt64
    get_stop_at_duration_end : UInt64
    put_stop_at_duration_end : UInt64
  end

  IRepetitionPattern_GUID = "7fb9acf1-26be-400e-85b5-294b9c75dfd6"
  IID_IRepetitionPattern = LibC::GUID.new(0x7fb9acf1_u32, 0x26be_u16, 0x400e_u16, StaticArray[0x85_u8, 0xb5_u8, 0x29_u8, 0x4b_u8, 0x9c_u8, 0x75_u8, 0xdf_u8, 0xd6_u8])
  struct IRepetitionPattern
    lpVtbl : IRepetitionPatternVTbl*
  end

end
struct LibWin32::ITaskTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_trigger(ptrigger : TASK_TRIGGER*) : HRESULT
    @lpVtbl.value.set_trigger.unsafe_as(Proc(TASK_TRIGGER*, HRESULT)).call(ptrigger)
  end
  def get_trigger(ptrigger : TASK_TRIGGER*) : HRESULT
    @lpVtbl.value.get_trigger.unsafe_as(Proc(TASK_TRIGGER*, HRESULT)).call(ptrigger)
  end
  def get_trigger_string(ppwsztrigger : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_trigger_string.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwsztrigger)
  end
end
struct LibWin32::IScheduledWorkItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_trigger(pinewtrigger : UInt16*, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.create_trigger.unsafe_as(Proc(UInt16*, ITaskTrigger*, HRESULT)).call(pinewtrigger, pptrigger)
  end
  def delete_trigger(itrigger : UInt16) : HRESULT
    @lpVtbl.value.delete_trigger.unsafe_as(Proc(UInt16, HRESULT)).call(itrigger)
  end
  def get_trigger_count(pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_trigger_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pwcount)
  end
  def get_trigger(itrigger : UInt16, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.get_trigger.unsafe_as(Proc(UInt16, ITaskTrigger*, HRESULT)).call(itrigger, pptrigger)
  end
  def get_trigger_string(itrigger : UInt16, ppwsztrigger : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_trigger_string.unsafe_as(Proc(UInt16, LibC::LPWSTR*, HRESULT)).call(itrigger, ppwsztrigger)
  end
  def get_run_times(pstbegin : SYSTEMTIME*, pstend : SYSTEMTIME*, pcount : UInt16*, rgsttasktimes : SYSTEMTIME**) : HRESULT
    @lpVtbl.value.get_run_times.unsafe_as(Proc(SYSTEMTIME*, SYSTEMTIME*, UInt16*, SYSTEMTIME**, HRESULT)).call(pstbegin, pstend, pcount, rgsttasktimes)
  end
  def get_next_run_time(pstnextrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_next_run_time.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(pstnextrun)
  end
  def set_idle_wait(widleminutes : UInt16, wdeadlineminutes : UInt16) : HRESULT
    @lpVtbl.value.set_idle_wait.unsafe_as(Proc(UInt16, UInt16, HRESULT)).call(widleminutes, wdeadlineminutes)
  end
  def get_idle_wait(pwidleminutes : UInt16*, pwdeadlineminutes : UInt16*) : HRESULT
    @lpVtbl.value.get_idle_wait.unsafe_as(Proc(UInt16*, UInt16*, HRESULT)).call(pwidleminutes, pwdeadlineminutes)
  end
  def run : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(HRESULT)).call
  end
  def terminate : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(HRESULT)).call
  end
  def edit_work_item(hparent : LibC::HANDLE, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.edit_work_item.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hparent, dwreserved)
  end
  def get_most_recent_run_time(pstlastrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_most_recent_run_time.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(pstlastrun)
  end
  def get_status(phrstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(HRESULT*, HRESULT)).call(phrstatus)
  end
  def get_exit_code(pdwexitcode : UInt32*) : HRESULT
    @lpVtbl.value.get_exit_code.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwexitcode)
  end
  def set_comment(pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_comment.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcomment)
  end
  def get_comment(ppwszcomment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_comment.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszcomment)
  end
  def set_creator(pwszcreator : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_creator.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcreator)
  end
  def get_creator(ppwszcreator : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_creator.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszcreator)
  end
  def set_work_item_data(cbdata : UInt16, rgbdata : UInt8*) : HRESULT
    @lpVtbl.value.set_work_item_data.unsafe_as(Proc(UInt16, UInt8*, HRESULT)).call(cbdata, rgbdata)
  end
  def get_work_item_data(pcbdata : UInt16*, prgbdata : UInt8**) : HRESULT
    @lpVtbl.value.get_work_item_data.unsafe_as(Proc(UInt16*, UInt8**, HRESULT)).call(pcbdata, prgbdata)
  end
  def set_error_retry_count(wretrycount : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_count.unsafe_as(Proc(UInt16, HRESULT)).call(wretrycount)
  end
  def get_error_retry_count(pwretrycount : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pwretrycount)
  end
  def set_error_retry_interval(wretryinterval : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_interval.unsafe_as(Proc(UInt16, HRESULT)).call(wretryinterval)
  end
  def get_error_retry_interval(pwretryinterval : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_interval.unsafe_as(Proc(UInt16*, HRESULT)).call(pwretryinterval)
  end
  def set_flags(dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def set_account_information(pwszaccountname : LibC::LPWSTR, pwszpassword : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_account_information.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszaccountname, pwszpassword)
  end
  def get_account_information(ppwszaccountname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_information.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszaccountname)
  end
end
struct LibWin32::ITask
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_trigger(pinewtrigger : UInt16*, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.create_trigger.unsafe_as(Proc(UInt16*, ITaskTrigger*, HRESULT)).call(pinewtrigger, pptrigger)
  end
  def delete_trigger(itrigger : UInt16) : HRESULT
    @lpVtbl.value.delete_trigger.unsafe_as(Proc(UInt16, HRESULT)).call(itrigger)
  end
  def get_trigger_count(pwcount : UInt16*) : HRESULT
    @lpVtbl.value.get_trigger_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pwcount)
  end
  def get_trigger(itrigger : UInt16, pptrigger : ITaskTrigger*) : HRESULT
    @lpVtbl.value.get_trigger.unsafe_as(Proc(UInt16, ITaskTrigger*, HRESULT)).call(itrigger, pptrigger)
  end
  def get_trigger_string(itrigger : UInt16, ppwsztrigger : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_trigger_string.unsafe_as(Proc(UInt16, LibC::LPWSTR*, HRESULT)).call(itrigger, ppwsztrigger)
  end
  def get_run_times(pstbegin : SYSTEMTIME*, pstend : SYSTEMTIME*, pcount : UInt16*, rgsttasktimes : SYSTEMTIME**) : HRESULT
    @lpVtbl.value.get_run_times.unsafe_as(Proc(SYSTEMTIME*, SYSTEMTIME*, UInt16*, SYSTEMTIME**, HRESULT)).call(pstbegin, pstend, pcount, rgsttasktimes)
  end
  def get_next_run_time(pstnextrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_next_run_time.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(pstnextrun)
  end
  def set_idle_wait(widleminutes : UInt16, wdeadlineminutes : UInt16) : HRESULT
    @lpVtbl.value.set_idle_wait.unsafe_as(Proc(UInt16, UInt16, HRESULT)).call(widleminutes, wdeadlineminutes)
  end
  def get_idle_wait(pwidleminutes : UInt16*, pwdeadlineminutes : UInt16*) : HRESULT
    @lpVtbl.value.get_idle_wait.unsafe_as(Proc(UInt16*, UInt16*, HRESULT)).call(pwidleminutes, pwdeadlineminutes)
  end
  def run : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(HRESULT)).call
  end
  def terminate : HRESULT
    @lpVtbl.value.terminate.unsafe_as(Proc(HRESULT)).call
  end
  def edit_work_item(hparent : LibC::HANDLE, dwreserved : UInt32) : HRESULT
    @lpVtbl.value.edit_work_item.unsafe_as(Proc(LibC::HANDLE, UInt32, HRESULT)).call(hparent, dwreserved)
  end
  def get_most_recent_run_time(pstlastrun : SYSTEMTIME*) : HRESULT
    @lpVtbl.value.get_most_recent_run_time.unsafe_as(Proc(SYSTEMTIME*, HRESULT)).call(pstlastrun)
  end
  def get_status(phrstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(HRESULT*, HRESULT)).call(phrstatus)
  end
  def get_exit_code(pdwexitcode : UInt32*) : HRESULT
    @lpVtbl.value.get_exit_code.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwexitcode)
  end
  def set_comment(pwszcomment : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_comment.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcomment)
  end
  def get_comment(ppwszcomment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_comment.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszcomment)
  end
  def set_creator(pwszcreator : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_creator.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcreator)
  end
  def get_creator(ppwszcreator : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_creator.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszcreator)
  end
  def set_work_item_data(cbdata : UInt16, rgbdata : UInt8*) : HRESULT
    @lpVtbl.value.set_work_item_data.unsafe_as(Proc(UInt16, UInt8*, HRESULT)).call(cbdata, rgbdata)
  end
  def get_work_item_data(pcbdata : UInt16*, prgbdata : UInt8**) : HRESULT
    @lpVtbl.value.get_work_item_data.unsafe_as(Proc(UInt16*, UInt8**, HRESULT)).call(pcbdata, prgbdata)
  end
  def set_error_retry_count(wretrycount : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_count.unsafe_as(Proc(UInt16, HRESULT)).call(wretrycount)
  end
  def get_error_retry_count(pwretrycount : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_count.unsafe_as(Proc(UInt16*, HRESULT)).call(pwretrycount)
  end
  def set_error_retry_interval(wretryinterval : UInt16) : HRESULT
    @lpVtbl.value.set_error_retry_interval.unsafe_as(Proc(UInt16, HRESULT)).call(wretryinterval)
  end
  def get_error_retry_interval(pwretryinterval : UInt16*) : HRESULT
    @lpVtbl.value.get_error_retry_interval.unsafe_as(Proc(UInt16*, HRESULT)).call(pwretryinterval)
  end
  def set_flags(dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def get_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def set_account_information(pwszaccountname : LibC::LPWSTR, pwszpassword : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_account_information.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pwszaccountname, pwszpassword)
  end
  def get_account_information(ppwszaccountname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_account_information.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszaccountname)
  end
  def set_application_name(pwszapplicationname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_application_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszapplicationname)
  end
  def get_application_name(ppwszapplicationname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_application_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszapplicationname)
  end
  def set_parameters(pwszparameters : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_parameters.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszparameters)
  end
  def get_parameters(ppwszparameters : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszparameters)
  end
  def set_working_directory(pwszworkingdirectory : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_working_directory.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszworkingdirectory)
  end
  def get_working_directory(ppwszworkingdirectory : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_working_directory.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszworkingdirectory)
  end
  def set_priority(dwpriority : UInt32) : HRESULT
    @lpVtbl.value.set_priority.unsafe_as(Proc(UInt32, HRESULT)).call(dwpriority)
  end
  def get_priority(pdwpriority : UInt32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwpriority)
  end
  def set_task_flags(dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_task_flags.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def get_task_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_task_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def set_max_run_time(dwmaxruntimems : UInt32) : HRESULT
    @lpVtbl.value.set_max_run_time.unsafe_as(Proc(UInt32, HRESULT)).call(dwmaxruntimems)
  end
  def get_max_run_time(pdwmaxruntimems : UInt32*) : HRESULT
    @lpVtbl.value.get_max_run_time.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxruntimems)
  end
end
struct LibWin32::IEnumWorkItems
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgpwsznames : LibC::LPWSTR**, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, LibC::LPWSTR**, UInt32*, HRESULT)).call(celt, rgpwsznames, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenumworkitems : IEnumWorkItems*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumWorkItems*, HRESULT)).call(ppenumworkitems)
  end
end
struct LibWin32::ITaskScheduler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_target_computer(pwszcomputer : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_target_computer.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszcomputer)
  end
  def get_target_computer(ppwszcomputer : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_target_computer.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppwszcomputer)
  end
  def enum(ppenumworkitems : IEnumWorkItems*) : HRESULT
    @lpVtbl.value.enum.unsafe_as(Proc(IEnumWorkItems*, HRESULT)).call(ppenumworkitems)
  end
  def activate(pwszname : LibC::LPWSTR, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(LibC::LPWSTR, Guid*, IUnknown*, HRESULT)).call(pwszname, riid, ppunk)
  end
  def delete(pwszname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(pwszname)
  end
  def new_work_item(pwsztaskname : LibC::LPWSTR, rclsid : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.new_work_item.unsafe_as(Proc(LibC::LPWSTR, Guid*, Guid*, IUnknown*, HRESULT)).call(pwsztaskname, rclsid, riid, ppunk)
  end
  def add_work_item(pwsztaskname : LibC::LPWSTR, pworkitem : IScheduledWorkItem) : HRESULT
    @lpVtbl.value.add_work_item.unsafe_as(Proc(LibC::LPWSTR, IScheduledWorkItem, HRESULT)).call(pwsztaskname, pworkitem)
  end
  def is_of_type(pwszname : LibC::LPWSTR, riid : Guid*) : HRESULT
    @lpVtbl.value.is_of_type.unsafe_as(Proc(LibC::LPWSTR, Guid*, HRESULT)).call(pwszname, riid)
  end
end
struct LibWin32::IProvideTaskPage
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_page(tptype : TASKPAGE, fpersistchanges : LibC::BOOL, phpage : HPROPSHEETPAGE*) : HRESULT
    @lpVtbl.value.get_page.unsafe_as(Proc(TASKPAGE, LibC::BOOL, HPROPSHEETPAGE*, HRESULT)).call(tptype, fpersistchanges, phpage)
  end
end
struct LibWin32::ITaskFolderCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_item(index : VARIANT, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, ITaskFolder*, HRESULT)).call(index, ppfolder)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ITaskService
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_folder(path : UInt8*, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.get_folder.unsafe_as(Proc(UInt8*, ITaskFolder*, HRESULT)).call(path, ppfolder)
  end
  def get_running_tasks(flags : Int32, pprunningtasks : IRunningTaskCollection*) : HRESULT
    @lpVtbl.value.get_running_tasks.unsafe_as(Proc(Int32, IRunningTaskCollection*, HRESULT)).call(flags, pprunningtasks)
  end
  def new_task(flags : UInt32, ppdefinition : ITaskDefinition*) : HRESULT
    @lpVtbl.value.new_task.unsafe_as(Proc(UInt32, ITaskDefinition*, HRESULT)).call(flags, ppdefinition)
  end
  def connect(servername : VARIANT, user : VARIANT, domain : VARIANT, password : VARIANT) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(VARIANT, VARIANT, VARIANT, VARIANT, HRESULT)).call(servername, user, domain, password)
  end
  def get_connected(pconnected : Int16*) : HRESULT
    @lpVtbl.value.get_connected.unsafe_as(Proc(Int16*, HRESULT)).call(pconnected)
  end
  def get_target_server(pserver : UInt8**) : HRESULT
    @lpVtbl.value.get_target_server.unsafe_as(Proc(UInt8**, HRESULT)).call(pserver)
  end
  def get_connected_user(puser : UInt8**) : HRESULT
    @lpVtbl.value.get_connected_user.unsafe_as(Proc(UInt8**, HRESULT)).call(puser)
  end
  def get_connected_domain(pdomain : UInt8**) : HRESULT
    @lpVtbl.value.get_connected_domain.unsafe_as(Proc(UInt8**, HRESULT)).call(pdomain)
  end
  def get_highest_version(pversion : UInt32*) : HRESULT
    @lpVtbl.value.get_highest_version.unsafe_as(Proc(UInt32*, HRESULT)).call(pversion)
  end
end
struct LibWin32::ITaskHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start(phandlerservices : IUnknown, data : UInt8*) : HRESULT
    @lpVtbl.value.start.unsafe_as(Proc(IUnknown, UInt8*, HRESULT)).call(phandlerservices, data)
  end
  def stop(pretcode : HRESULT*) : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT*, HRESULT)).call(pretcode)
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITaskHandlerStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def update_status(percentcomplete : Int16, statusmessage : UInt8*) : HRESULT
    @lpVtbl.value.update_status.unsafe_as(Proc(Int16, UInt8*, HRESULT)).call(percentcomplete, statusmessage)
  end
  def task_completed(taskerrcode : HRESULT) : HRESULT
    @lpVtbl.value.task_completed.unsafe_as(Proc(HRESULT, HRESULT)).call(taskerrcode)
  end
end
struct LibWin32::ITaskVariables
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input(pinput : UInt8**) : HRESULT
    @lpVtbl.value.get_input.unsafe_as(Proc(UInt8**, HRESULT)).call(pinput)
  end
  def set_output(input : UInt8*) : HRESULT
    @lpVtbl.value.set_output.unsafe_as(Proc(UInt8*, HRESULT)).call(input)
  end
  def get_context(pcontext : UInt8**) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(UInt8**, HRESULT)).call(pcontext)
  end
end
struct LibWin32::ITaskNamedValuePair
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_value(pvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(pvalue)
  end
  def put_value(value : UInt8*) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
end
struct LibWin32::ITaskNamedValueCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_item(index : Int32, pppair : ITaskNamedValuePair*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, ITaskNamedValuePair*, HRESULT)).call(index, pppair)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
  def create(name : UInt8*, value : UInt8*, pppair : ITaskNamedValuePair*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(UInt8*, UInt8*, ITaskNamedValuePair*, HRESULT)).call(name, value, pppair)
  end
  def remove(index : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRunningTask
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def get_instance_guid(pguid : UInt8**) : HRESULT
    @lpVtbl.value.get_instance_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pguid)
  end
  def get_path(ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(ppath)
  end
  def get_state(pstate : TASK_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(TASK_STATE*, HRESULT)).call(pstate)
  end
  def get_current_action(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_current_action.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def stop : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(HRESULT)).call
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def get_engine_pid(ppid : UInt32*) : HRESULT
    @lpVtbl.value.get_engine_pid.unsafe_as(Proc(UInt32*, HRESULT)).call(ppid)
  end
end
struct LibWin32::IRunningTaskCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_item(index : VARIANT, pprunningtask : IRunningTask*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IRunningTask*, HRESULT)).call(index, pprunningtask)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IRegisteredTask
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def get_path(ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(ppath)
  end
  def get_state(pstate : TASK_STATE*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(TASK_STATE*, HRESULT)).call(pstate)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def run(params : VARIANT, pprunningtask : IRunningTask*) : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(VARIANT, IRunningTask*, HRESULT)).call(params, pprunningtask)
  end
  def run_ex(params : VARIANT, flags : Int32, sessionid : Int32, user : UInt8*, pprunningtask : IRunningTask*) : HRESULT
    @lpVtbl.value.run_ex.unsafe_as(Proc(VARIANT, Int32, Int32, UInt8*, IRunningTask*, HRESULT)).call(params, flags, sessionid, user, pprunningtask)
  end
  def get_instances(flags : Int32, pprunningtasks : IRunningTaskCollection*) : HRESULT
    @lpVtbl.value.get_instances.unsafe_as(Proc(Int32, IRunningTaskCollection*, HRESULT)).call(flags, pprunningtasks)
  end
  def get_last_run_time(plastruntime : Float64*) : HRESULT
    @lpVtbl.value.get_last_run_time.unsafe_as(Proc(Float64*, HRESULT)).call(plastruntime)
  end
  def get_last_task_result(plasttaskresult : Int32*) : HRESULT
    @lpVtbl.value.get_last_task_result.unsafe_as(Proc(Int32*, HRESULT)).call(plasttaskresult)
  end
  def get_number_of_missed_runs(pnumberofmissedruns : Int32*) : HRESULT
    @lpVtbl.value.get_number_of_missed_runs.unsafe_as(Proc(Int32*, HRESULT)).call(pnumberofmissedruns)
  end
  def get_next_run_time(pnextruntime : Float64*) : HRESULT
    @lpVtbl.value.get_next_run_time.unsafe_as(Proc(Float64*, HRESULT)).call(pnextruntime)
  end
  def get_definition(ppdefinition : ITaskDefinition*) : HRESULT
    @lpVtbl.value.get_definition.unsafe_as(Proc(ITaskDefinition*, HRESULT)).call(ppdefinition)
  end
  def get_xml(pxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pxml)
  end
  def get_security_descriptor(securityinformation : Int32, psddl : UInt8**) : HRESULT
    @lpVtbl.value.get_security_descriptor.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(securityinformation, psddl)
  end
  def set_security_descriptor(sddl : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.set_security_descriptor.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(sddl, flags)
  end
  def stop(flags : Int32) : HRESULT
    @lpVtbl.value.stop.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
  def get_run_times(pststart : SYSTEMTIME*, pstend : SYSTEMTIME*, pcount : UInt32*, pruntimes : SYSTEMTIME**) : HRESULT
    @lpVtbl.value.get_run_times.unsafe_as(Proc(SYSTEMTIME*, SYSTEMTIME*, UInt32*, SYSTEMTIME**, HRESULT)).call(pststart, pstend, pcount, pruntimes)
  end
end
struct LibWin32::ITrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
end
struct LibWin32::IIdleTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
end
struct LibWin32::ILogonTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_delay(pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(pdelay)
  end
  def put_delay(delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(delay)
  end
  def get_user_id(puser : UInt8**) : HRESULT
    @lpVtbl.value.get_user_id.unsafe_as(Proc(UInt8**, HRESULT)).call(puser)
  end
  def put_user_id(user : UInt8*) : HRESULT
    @lpVtbl.value.put_user_id.unsafe_as(Proc(UInt8*, HRESULT)).call(user)
  end
end
struct LibWin32::ISessionStateChangeTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_delay(pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(pdelay)
  end
  def put_delay(delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(delay)
  end
  def get_user_id(puser : UInt8**) : HRESULT
    @lpVtbl.value.get_user_id.unsafe_as(Proc(UInt8**, HRESULT)).call(puser)
  end
  def put_user_id(user : UInt8*) : HRESULT
    @lpVtbl.value.put_user_id.unsafe_as(Proc(UInt8*, HRESULT)).call(user)
  end
  def get_state_change(ptype : TASK_SESSION_STATE_CHANGE_TYPE*) : HRESULT
    @lpVtbl.value.get_state_change.unsafe_as(Proc(TASK_SESSION_STATE_CHANGE_TYPE*, HRESULT)).call(ptype)
  end
  def put_state_change(type : TASK_SESSION_STATE_CHANGE_TYPE) : HRESULT
    @lpVtbl.value.put_state_change.unsafe_as(Proc(TASK_SESSION_STATE_CHANGE_TYPE, HRESULT)).call(type)
  end
end
struct LibWin32::IEventTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_subscription(pquery : UInt8**) : HRESULT
    @lpVtbl.value.get_subscription.unsafe_as(Proc(UInt8**, HRESULT)).call(pquery)
  end
  def put_subscription(query : UInt8*) : HRESULT
    @lpVtbl.value.put_subscription.unsafe_as(Proc(UInt8*, HRESULT)).call(query)
  end
  def get_delay(pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(pdelay)
  end
  def put_delay(delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(delay)
  end
  def get_value_queries(ppnamedxpaths : ITaskNamedValueCollection*) : HRESULT
    @lpVtbl.value.get_value_queries.unsafe_as(Proc(ITaskNamedValueCollection*, HRESULT)).call(ppnamedxpaths)
  end
  def put_value_queries(pnamedxpaths : ITaskNamedValueCollection) : HRESULT
    @lpVtbl.value.put_value_queries.unsafe_as(Proc(ITaskNamedValueCollection, HRESULT)).call(pnamedxpaths)
  end
end
struct LibWin32::ITimeTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_random_delay(prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(prandomdelay)
  end
  def put_random_delay(randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(randomdelay)
  end
end
struct LibWin32::IDailyTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_days_interval(pdays : Int16*) : HRESULT
    @lpVtbl.value.get_days_interval.unsafe_as(Proc(Int16*, HRESULT)).call(pdays)
  end
  def put_days_interval(days : Int16) : HRESULT
    @lpVtbl.value.put_days_interval.unsafe_as(Proc(Int16, HRESULT)).call(days)
  end
  def get_random_delay(prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(prandomdelay)
  end
  def put_random_delay(randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(randomdelay)
  end
end
struct LibWin32::IWeeklyTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_days_of_week(pdays : Int16*) : HRESULT
    @lpVtbl.value.get_days_of_week.unsafe_as(Proc(Int16*, HRESULT)).call(pdays)
  end
  def put_days_of_week(days : Int16) : HRESULT
    @lpVtbl.value.put_days_of_week.unsafe_as(Proc(Int16, HRESULT)).call(days)
  end
  def get_weeks_interval(pweeks : Int16*) : HRESULT
    @lpVtbl.value.get_weeks_interval.unsafe_as(Proc(Int16*, HRESULT)).call(pweeks)
  end
  def put_weeks_interval(weeks : Int16) : HRESULT
    @lpVtbl.value.put_weeks_interval.unsafe_as(Proc(Int16, HRESULT)).call(weeks)
  end
  def get_random_delay(prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(prandomdelay)
  end
  def put_random_delay(randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(randomdelay)
  end
end
struct LibWin32::IMonthlyTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_days_of_month(pdays : Int32*) : HRESULT
    @lpVtbl.value.get_days_of_month.unsafe_as(Proc(Int32*, HRESULT)).call(pdays)
  end
  def put_days_of_month(days : Int32) : HRESULT
    @lpVtbl.value.put_days_of_month.unsafe_as(Proc(Int32, HRESULT)).call(days)
  end
  def get_months_of_year(pmonths : Int16*) : HRESULT
    @lpVtbl.value.get_months_of_year.unsafe_as(Proc(Int16*, HRESULT)).call(pmonths)
  end
  def put_months_of_year(months : Int16) : HRESULT
    @lpVtbl.value.put_months_of_year.unsafe_as(Proc(Int16, HRESULT)).call(months)
  end
  def get_run_on_last_day_of_month(plastday : Int16*) : HRESULT
    @lpVtbl.value.get_run_on_last_day_of_month.unsafe_as(Proc(Int16*, HRESULT)).call(plastday)
  end
  def put_run_on_last_day_of_month(lastday : Int16) : HRESULT
    @lpVtbl.value.put_run_on_last_day_of_month.unsafe_as(Proc(Int16, HRESULT)).call(lastday)
  end
  def get_random_delay(prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(prandomdelay)
  end
  def put_random_delay(randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(randomdelay)
  end
end
struct LibWin32::IMonthlyDOWTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_days_of_week(pdays : Int16*) : HRESULT
    @lpVtbl.value.get_days_of_week.unsafe_as(Proc(Int16*, HRESULT)).call(pdays)
  end
  def put_days_of_week(days : Int16) : HRESULT
    @lpVtbl.value.put_days_of_week.unsafe_as(Proc(Int16, HRESULT)).call(days)
  end
  def get_weeks_of_month(pweeks : Int16*) : HRESULT
    @lpVtbl.value.get_weeks_of_month.unsafe_as(Proc(Int16*, HRESULT)).call(pweeks)
  end
  def put_weeks_of_month(weeks : Int16) : HRESULT
    @lpVtbl.value.put_weeks_of_month.unsafe_as(Proc(Int16, HRESULT)).call(weeks)
  end
  def get_months_of_year(pmonths : Int16*) : HRESULT
    @lpVtbl.value.get_months_of_year.unsafe_as(Proc(Int16*, HRESULT)).call(pmonths)
  end
  def put_months_of_year(months : Int16) : HRESULT
    @lpVtbl.value.put_months_of_year.unsafe_as(Proc(Int16, HRESULT)).call(months)
  end
  def get_run_on_last_week_of_month(plastweek : Int16*) : HRESULT
    @lpVtbl.value.get_run_on_last_week_of_month.unsafe_as(Proc(Int16*, HRESULT)).call(plastweek)
  end
  def put_run_on_last_week_of_month(lastweek : Int16) : HRESULT
    @lpVtbl.value.put_run_on_last_week_of_month.unsafe_as(Proc(Int16, HRESULT)).call(lastweek)
  end
  def get_random_delay(prandomdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_random_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(prandomdelay)
  end
  def put_random_delay(randomdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_random_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(randomdelay)
  end
end
struct LibWin32::IBootTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_delay(pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(pdelay)
  end
  def put_delay(delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(delay)
  end
end
struct LibWin32::IRegistrationTrigger
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(ptype : TASK_TRIGGER_TYPE2*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_TRIGGER_TYPE2*, HRESULT)).call(ptype)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_repetition(pprepeat : IRepetitionPattern*) : HRESULT
    @lpVtbl.value.get_repetition.unsafe_as(Proc(IRepetitionPattern*, HRESULT)).call(pprepeat)
  end
  def put_repetition(prepeat : IRepetitionPattern) : HRESULT
    @lpVtbl.value.put_repetition.unsafe_as(Proc(IRepetitionPattern, HRESULT)).call(prepeat)
  end
  def get_execution_time_limit(ptimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimelimit)
  end
  def put_execution_time_limit(timelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(timelimit)
  end
  def get_start_boundary(pstart : UInt8**) : HRESULT
    @lpVtbl.value.get_start_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pstart)
  end
  def put_start_boundary(start : UInt8*) : HRESULT
    @lpVtbl.value.put_start_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(start)
  end
  def get_end_boundary(pend : UInt8**) : HRESULT
    @lpVtbl.value.get_end_boundary.unsafe_as(Proc(UInt8**, HRESULT)).call(pend)
  end
  def put_end_boundary(end_ : UInt8*) : HRESULT
    @lpVtbl.value.put_end_boundary.unsafe_as(Proc(UInt8*, HRESULT)).call(end_)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_delay(pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delay.unsafe_as(Proc(UInt8**, HRESULT)).call(pdelay)
  end
  def put_delay(delay : UInt8*) : HRESULT
    @lpVtbl.value.put_delay.unsafe_as(Proc(UInt8*, HRESULT)).call(delay)
  end
end
struct LibWin32::IAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_type(ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_ACTION_TYPE*, HRESULT)).call(ptype)
  end
end
struct LibWin32::IExecAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_type(ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_ACTION_TYPE*, HRESULT)).call(ptype)
  end
  def get_path(ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(ppath)
  end
  def put_path(path : UInt8*) : HRESULT
    @lpVtbl.value.put_path.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_arguments(pargument : UInt8**) : HRESULT
    @lpVtbl.value.get_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(pargument)
  end
  def put_arguments(argument : UInt8*) : HRESULT
    @lpVtbl.value.put_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(argument)
  end
  def get_working_directory(pworkingdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_working_directory.unsafe_as(Proc(UInt8**, HRESULT)).call(pworkingdirectory)
  end
  def put_working_directory(workingdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_working_directory.unsafe_as(Proc(UInt8*, HRESULT)).call(workingdirectory)
  end
end
struct LibWin32::IExecAction2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_type(ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_ACTION_TYPE*, HRESULT)).call(ptype)
  end
  def get_path(ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(ppath)
  end
  def put_path(path : UInt8*) : HRESULT
    @lpVtbl.value.put_path.unsafe_as(Proc(UInt8*, HRESULT)).call(path)
  end
  def get_arguments(pargument : UInt8**) : HRESULT
    @lpVtbl.value.get_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(pargument)
  end
  def put_arguments(argument : UInt8*) : HRESULT
    @lpVtbl.value.put_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(argument)
  end
  def get_working_directory(pworkingdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_working_directory.unsafe_as(Proc(UInt8**, HRESULT)).call(pworkingdirectory)
  end
  def put_working_directory(workingdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_working_directory.unsafe_as(Proc(UInt8*, HRESULT)).call(workingdirectory)
  end
  def get_hide_app_window(phideappwindow : Int16*) : HRESULT
    @lpVtbl.value.get_hide_app_window.unsafe_as(Proc(Int16*, HRESULT)).call(phideappwindow)
  end
  def put_hide_app_window(hideappwindow : Int16) : HRESULT
    @lpVtbl.value.put_hide_app_window.unsafe_as(Proc(Int16, HRESULT)).call(hideappwindow)
  end
end
struct LibWin32::IShowMessageAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_type(ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_ACTION_TYPE*, HRESULT)).call(ptype)
  end
  def get_title(ptitle : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(ptitle)
  end
  def put_title(title : UInt8*) : HRESULT
    @lpVtbl.value.put_title.unsafe_as(Proc(UInt8*, HRESULT)).call(title)
  end
  def get_message_body(pmessagebody : UInt8**) : HRESULT
    @lpVtbl.value.get_message_body.unsafe_as(Proc(UInt8**, HRESULT)).call(pmessagebody)
  end
  def put_message_body(messagebody : UInt8*) : HRESULT
    @lpVtbl.value.put_message_body.unsafe_as(Proc(UInt8*, HRESULT)).call(messagebody)
  end
end
struct LibWin32::IComHandlerAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_type(ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_ACTION_TYPE*, HRESULT)).call(ptype)
  end
  def get_class_id(pclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_class_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pclsid)
  end
  def put_class_id(clsid : UInt8*) : HRESULT
    @lpVtbl.value.put_class_id.unsafe_as(Proc(UInt8*, HRESULT)).call(clsid)
  end
  def get_data(pdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pdata)
  end
  def put_data(data : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(data)
  end
end
struct LibWin32::IEmailAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_type(ptype : TASK_ACTION_TYPE*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(TASK_ACTION_TYPE*, HRESULT)).call(ptype)
  end
  def get_server(pserver : UInt8**) : HRESULT
    @lpVtbl.value.get_server.unsafe_as(Proc(UInt8**, HRESULT)).call(pserver)
  end
  def put_server(server : UInt8*) : HRESULT
    @lpVtbl.value.put_server.unsafe_as(Proc(UInt8*, HRESULT)).call(server)
  end
  def get_subject(psubject : UInt8**) : HRESULT
    @lpVtbl.value.get_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(psubject)
  end
  def put_subject(subject : UInt8*) : HRESULT
    @lpVtbl.value.put_subject.unsafe_as(Proc(UInt8*, HRESULT)).call(subject)
  end
  def get_to(pto : UInt8**) : HRESULT
    @lpVtbl.value.get_to.unsafe_as(Proc(UInt8**, HRESULT)).call(pto)
  end
  def put_to(to : UInt8*) : HRESULT
    @lpVtbl.value.put_to.unsafe_as(Proc(UInt8*, HRESULT)).call(to)
  end
  def get_cc(pcc : UInt8**) : HRESULT
    @lpVtbl.value.get_cc.unsafe_as(Proc(UInt8**, HRESULT)).call(pcc)
  end
  def put_cc(cc : UInt8*) : HRESULT
    @lpVtbl.value.put_cc.unsafe_as(Proc(UInt8*, HRESULT)).call(cc)
  end
  def get_bcc(pbcc : UInt8**) : HRESULT
    @lpVtbl.value.get_bcc.unsafe_as(Proc(UInt8**, HRESULT)).call(pbcc)
  end
  def put_bcc(bcc : UInt8*) : HRESULT
    @lpVtbl.value.put_bcc.unsafe_as(Proc(UInt8*, HRESULT)).call(bcc)
  end
  def get_reply_to(preplyto : UInt8**) : HRESULT
    @lpVtbl.value.get_reply_to.unsafe_as(Proc(UInt8**, HRESULT)).call(preplyto)
  end
  def put_reply_to(replyto : UInt8*) : HRESULT
    @lpVtbl.value.put_reply_to.unsafe_as(Proc(UInt8*, HRESULT)).call(replyto)
  end
  def get_from(pfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_from.unsafe_as(Proc(UInt8**, HRESULT)).call(pfrom)
  end
  def put_from(from : UInt8*) : HRESULT
    @lpVtbl.value.put_from.unsafe_as(Proc(UInt8*, HRESULT)).call(from)
  end
  def get_header_fields(ppheaderfields : ITaskNamedValueCollection*) : HRESULT
    @lpVtbl.value.get_header_fields.unsafe_as(Proc(ITaskNamedValueCollection*, HRESULT)).call(ppheaderfields)
  end
  def put_header_fields(pheaderfields : ITaskNamedValueCollection) : HRESULT
    @lpVtbl.value.put_header_fields.unsafe_as(Proc(ITaskNamedValueCollection, HRESULT)).call(pheaderfields)
  end
  def get_body(pbody : UInt8**) : HRESULT
    @lpVtbl.value.get_body.unsafe_as(Proc(UInt8**, HRESULT)).call(pbody)
  end
  def put_body(body : UInt8*) : HRESULT
    @lpVtbl.value.put_body.unsafe_as(Proc(UInt8*, HRESULT)).call(body)
  end
  def get_attachments(pattachements : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_attachments.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pattachements)
  end
  def put_attachments(pattachements : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_attachments.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(pattachements)
  end
end
struct LibWin32::ITriggerCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_item(index : Int32, pptrigger : ITrigger*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, ITrigger*, HRESULT)).call(index, pptrigger)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
  def create(type : TASK_TRIGGER_TYPE2, pptrigger : ITrigger*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(TASK_TRIGGER_TYPE2, ITrigger*, HRESULT)).call(type, pptrigger)
  end
  def remove(index : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(index)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IActionCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_item(index : Int32, ppaction : IAction*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IAction*, HRESULT)).call(index, ppaction)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
  def get_xml_text(ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.unsafe_as(Proc(UInt8**, HRESULT)).call(ptext)
  end
  def put_xml_text(text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.unsafe_as(Proc(UInt8*, HRESULT)).call(text)
  end
  def create(type : TASK_ACTION_TYPE, ppaction : IAction*) : HRESULT
    @lpVtbl.value.create.unsafe_as(Proc(TASK_ACTION_TYPE, IAction*, HRESULT)).call(type, ppaction)
  end
  def remove(index : VARIANT) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(VARIANT, HRESULT)).call(index)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def get_context(pcontext : UInt8**) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(UInt8**, HRESULT)).call(pcontext)
  end
  def put_context(context : UInt8*) : HRESULT
    @lpVtbl.value.put_context.unsafe_as(Proc(UInt8*, HRESULT)).call(context)
  end
end
struct LibWin32::IPrincipal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
  def get_display_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def put_display_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_user_id(puser : UInt8**) : HRESULT
    @lpVtbl.value.get_user_id.unsafe_as(Proc(UInt8**, HRESULT)).call(puser)
  end
  def put_user_id(user : UInt8*) : HRESULT
    @lpVtbl.value.put_user_id.unsafe_as(Proc(UInt8*, HRESULT)).call(user)
  end
  def get_logon_type(plogon : TASK_LOGON_TYPE*) : HRESULT
    @lpVtbl.value.get_logon_type.unsafe_as(Proc(TASK_LOGON_TYPE*, HRESULT)).call(plogon)
  end
  def put_logon_type(logon : TASK_LOGON_TYPE) : HRESULT
    @lpVtbl.value.put_logon_type.unsafe_as(Proc(TASK_LOGON_TYPE, HRESULT)).call(logon)
  end
  def get_group_id(pgroup : UInt8**) : HRESULT
    @lpVtbl.value.get_group_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pgroup)
  end
  def put_group_id(group : UInt8*) : HRESULT
    @lpVtbl.value.put_group_id.unsafe_as(Proc(UInt8*, HRESULT)).call(group)
  end
  def get_run_level(prunlevel : TASK_RUNLEVEL_TYPE*) : HRESULT
    @lpVtbl.value.get_run_level.unsafe_as(Proc(TASK_RUNLEVEL_TYPE*, HRESULT)).call(prunlevel)
  end
  def put_run_level(runlevel : TASK_RUNLEVEL_TYPE) : HRESULT
    @lpVtbl.value.put_run_level.unsafe_as(Proc(TASK_RUNLEVEL_TYPE, HRESULT)).call(runlevel)
  end
end
struct LibWin32::IPrincipal2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_process_token_sid_type(pprocesstokensidtype : TASK_PROCESSTOKENSID_TYPE*) : HRESULT
    @lpVtbl.value.get_process_token_sid_type.unsafe_as(Proc(TASK_PROCESSTOKENSID_TYPE*, HRESULT)).call(pprocesstokensidtype)
  end
  def put_process_token_sid_type(processtokensidtype : TASK_PROCESSTOKENSID_TYPE) : HRESULT
    @lpVtbl.value.put_process_token_sid_type.unsafe_as(Proc(TASK_PROCESSTOKENSID_TYPE, HRESULT)).call(processtokensidtype)
  end
  def get_required_privilege_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_required_privilege_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_required_privilege(index : Int32, pprivilege : UInt8**) : HRESULT
    @lpVtbl.value.get_required_privilege.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(index, pprivilege)
  end
  def add_required_privilege(privilege : UInt8*) : HRESULT
    @lpVtbl.value.add_required_privilege.unsafe_as(Proc(UInt8*, HRESULT)).call(privilege)
  end
end
struct LibWin32::IRegistrationInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_description(pdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pdescription)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def get_author(pauthor : UInt8**) : HRESULT
    @lpVtbl.value.get_author.unsafe_as(Proc(UInt8**, HRESULT)).call(pauthor)
  end
  def put_author(author : UInt8*) : HRESULT
    @lpVtbl.value.put_author.unsafe_as(Proc(UInt8*, HRESULT)).call(author)
  end
  def get_version(pversion : UInt8**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt8**, HRESULT)).call(pversion)
  end
  def put_version(version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.unsafe_as(Proc(UInt8*, HRESULT)).call(version)
  end
  def get_date(pdate : UInt8**) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(UInt8**, HRESULT)).call(pdate)
  end
  def put_date(date : UInt8*) : HRESULT
    @lpVtbl.value.put_date.unsafe_as(Proc(UInt8*, HRESULT)).call(date)
  end
  def get_documentation(pdocumentation : UInt8**) : HRESULT
    @lpVtbl.value.get_documentation.unsafe_as(Proc(UInt8**, HRESULT)).call(pdocumentation)
  end
  def put_documentation(documentation : UInt8*) : HRESULT
    @lpVtbl.value.put_documentation.unsafe_as(Proc(UInt8*, HRESULT)).call(documentation)
  end
  def get_xml_text(ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.unsafe_as(Proc(UInt8**, HRESULT)).call(ptext)
  end
  def put_xml_text(text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.unsafe_as(Proc(UInt8*, HRESULT)).call(text)
  end
  def get_uri(puri : UInt8**) : HRESULT
    @lpVtbl.value.get_uri.unsafe_as(Proc(UInt8**, HRESULT)).call(puri)
  end
  def put_uri(uri : UInt8*) : HRESULT
    @lpVtbl.value.put_uri.unsafe_as(Proc(UInt8*, HRESULT)).call(uri)
  end
  def get_security_descriptor(psddl : VARIANT*) : HRESULT
    @lpVtbl.value.get_security_descriptor.unsafe_as(Proc(VARIANT*, HRESULT)).call(psddl)
  end
  def put_security_descriptor(sddl : VARIANT) : HRESULT
    @lpVtbl.value.put_security_descriptor.unsafe_as(Proc(VARIANT, HRESULT)).call(sddl)
  end
  def get_source(psource : UInt8**) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt8**, HRESULT)).call(psource)
  end
  def put_source(source : UInt8*) : HRESULT
    @lpVtbl.value.put_source.unsafe_as(Proc(UInt8*, HRESULT)).call(source)
  end
end
struct LibWin32::ITaskDefinition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_registration_info(ppregistrationinfo : IRegistrationInfo*) : HRESULT
    @lpVtbl.value.get_registration_info.unsafe_as(Proc(IRegistrationInfo*, HRESULT)).call(ppregistrationinfo)
  end
  def put_registration_info(pregistrationinfo : IRegistrationInfo) : HRESULT
    @lpVtbl.value.put_registration_info.unsafe_as(Proc(IRegistrationInfo, HRESULT)).call(pregistrationinfo)
  end
  def get_triggers(pptriggers : ITriggerCollection*) : HRESULT
    @lpVtbl.value.get_triggers.unsafe_as(Proc(ITriggerCollection*, HRESULT)).call(pptriggers)
  end
  def put_triggers(ptriggers : ITriggerCollection) : HRESULT
    @lpVtbl.value.put_triggers.unsafe_as(Proc(ITriggerCollection, HRESULT)).call(ptriggers)
  end
  def get_settings(ppsettings : ITaskSettings*) : HRESULT
    @lpVtbl.value.get_settings.unsafe_as(Proc(ITaskSettings*, HRESULT)).call(ppsettings)
  end
  def put_settings(psettings : ITaskSettings) : HRESULT
    @lpVtbl.value.put_settings.unsafe_as(Proc(ITaskSettings, HRESULT)).call(psettings)
  end
  def get_data(pdata : UInt8**) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(UInt8**, HRESULT)).call(pdata)
  end
  def put_data(data : UInt8*) : HRESULT
    @lpVtbl.value.put_data.unsafe_as(Proc(UInt8*, HRESULT)).call(data)
  end
  def get_principal(ppprincipal : IPrincipal*) : HRESULT
    @lpVtbl.value.get_principal.unsafe_as(Proc(IPrincipal*, HRESULT)).call(ppprincipal)
  end
  def put_principal(pprincipal : IPrincipal) : HRESULT
    @lpVtbl.value.put_principal.unsafe_as(Proc(IPrincipal, HRESULT)).call(pprincipal)
  end
  def get_actions(ppactions : IActionCollection*) : HRESULT
    @lpVtbl.value.get_actions.unsafe_as(Proc(IActionCollection*, HRESULT)).call(ppactions)
  end
  def put_actions(pactions : IActionCollection) : HRESULT
    @lpVtbl.value.put_actions.unsafe_as(Proc(IActionCollection, HRESULT)).call(pactions)
  end
  def get_xml_text(pxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pxml)
  end
  def put_xml_text(xml : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.unsafe_as(Proc(UInt8*, HRESULT)).call(xml)
  end
end
struct LibWin32::ITaskSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_allow_demand_start(pallowdemandstart : Int16*) : HRESULT
    @lpVtbl.value.get_allow_demand_start.unsafe_as(Proc(Int16*, HRESULT)).call(pallowdemandstart)
  end
  def put_allow_demand_start(allowdemandstart : Int16) : HRESULT
    @lpVtbl.value.put_allow_demand_start.unsafe_as(Proc(Int16, HRESULT)).call(allowdemandstart)
  end
  def get_restart_interval(prestartinterval : UInt8**) : HRESULT
    @lpVtbl.value.get_restart_interval.unsafe_as(Proc(UInt8**, HRESULT)).call(prestartinterval)
  end
  def put_restart_interval(restartinterval : UInt8*) : HRESULT
    @lpVtbl.value.put_restart_interval.unsafe_as(Proc(UInt8*, HRESULT)).call(restartinterval)
  end
  def get_restart_count(prestartcount : Int32*) : HRESULT
    @lpVtbl.value.get_restart_count.unsafe_as(Proc(Int32*, HRESULT)).call(prestartcount)
  end
  def put_restart_count(restartcount : Int32) : HRESULT
    @lpVtbl.value.put_restart_count.unsafe_as(Proc(Int32, HRESULT)).call(restartcount)
  end
  def get_multiple_instances(ppolicy : TASK_INSTANCES_POLICY*) : HRESULT
    @lpVtbl.value.get_multiple_instances.unsafe_as(Proc(TASK_INSTANCES_POLICY*, HRESULT)).call(ppolicy)
  end
  def put_multiple_instances(policy : TASK_INSTANCES_POLICY) : HRESULT
    @lpVtbl.value.put_multiple_instances.unsafe_as(Proc(TASK_INSTANCES_POLICY, HRESULT)).call(policy)
  end
  def get_stop_if_going_on_batteries(pstopifonbatteries : Int16*) : HRESULT
    @lpVtbl.value.get_stop_if_going_on_batteries.unsafe_as(Proc(Int16*, HRESULT)).call(pstopifonbatteries)
  end
  def put_stop_if_going_on_batteries(stopifonbatteries : Int16) : HRESULT
    @lpVtbl.value.put_stop_if_going_on_batteries.unsafe_as(Proc(Int16, HRESULT)).call(stopifonbatteries)
  end
  def get_disallow_start_if_on_batteries(pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_if_on_batteries.unsafe_as(Proc(Int16*, HRESULT)).call(pdisallowstart)
  end
  def put_disallow_start_if_on_batteries(disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_if_on_batteries.unsafe_as(Proc(Int16, HRESULT)).call(disallowstart)
  end
  def get_allow_hard_terminate(pallowhardterminate : Int16*) : HRESULT
    @lpVtbl.value.get_allow_hard_terminate.unsafe_as(Proc(Int16*, HRESULT)).call(pallowhardterminate)
  end
  def put_allow_hard_terminate(allowhardterminate : Int16) : HRESULT
    @lpVtbl.value.put_allow_hard_terminate.unsafe_as(Proc(Int16, HRESULT)).call(allowhardterminate)
  end
  def get_start_when_available(pstartwhenavailable : Int16*) : HRESULT
    @lpVtbl.value.get_start_when_available.unsafe_as(Proc(Int16*, HRESULT)).call(pstartwhenavailable)
  end
  def put_start_when_available(startwhenavailable : Int16) : HRESULT
    @lpVtbl.value.put_start_when_available.unsafe_as(Proc(Int16, HRESULT)).call(startwhenavailable)
  end
  def get_xml_text(ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.unsafe_as(Proc(UInt8**, HRESULT)).call(ptext)
  end
  def put_xml_text(text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.unsafe_as(Proc(UInt8*, HRESULT)).call(text)
  end
  def get_run_only_if_network_available(prunonlyifnetworkavailable : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_network_available.unsafe_as(Proc(Int16*, HRESULT)).call(prunonlyifnetworkavailable)
  end
  def put_run_only_if_network_available(runonlyifnetworkavailable : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_network_available.unsafe_as(Proc(Int16, HRESULT)).call(runonlyifnetworkavailable)
  end
  def get_execution_time_limit(pexecutiontimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(pexecutiontimelimit)
  end
  def put_execution_time_limit(executiontimelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(executiontimelimit)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_delete_expired_task_after(pexpirationdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delete_expired_task_after.unsafe_as(Proc(UInt8**, HRESULT)).call(pexpirationdelay)
  end
  def put_delete_expired_task_after(expirationdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_delete_expired_task_after.unsafe_as(Proc(UInt8*, HRESULT)).call(expirationdelay)
  end
  def get_priority(ppriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(ppriority)
  end
  def put_priority(priority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(priority)
  end
  def get_compatibility(pcompatlevel : TASK_COMPATIBILITY*) : HRESULT
    @lpVtbl.value.get_compatibility.unsafe_as(Proc(TASK_COMPATIBILITY*, HRESULT)).call(pcompatlevel)
  end
  def put_compatibility(compatlevel : TASK_COMPATIBILITY) : HRESULT
    @lpVtbl.value.put_compatibility.unsafe_as(Proc(TASK_COMPATIBILITY, HRESULT)).call(compatlevel)
  end
  def get_hidden(phidden : Int16*) : HRESULT
    @lpVtbl.value.get_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(phidden)
  end
  def put_hidden(hidden : Int16) : HRESULT
    @lpVtbl.value.put_hidden.unsafe_as(Proc(Int16, HRESULT)).call(hidden)
  end
  def get_idle_settings(ppidlesettings : IIdleSettings*) : HRESULT
    @lpVtbl.value.get_idle_settings.unsafe_as(Proc(IIdleSettings*, HRESULT)).call(ppidlesettings)
  end
  def put_idle_settings(pidlesettings : IIdleSettings) : HRESULT
    @lpVtbl.value.put_idle_settings.unsafe_as(Proc(IIdleSettings, HRESULT)).call(pidlesettings)
  end
  def get_run_only_if_idle(prunonlyifidle : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_idle.unsafe_as(Proc(Int16*, HRESULT)).call(prunonlyifidle)
  end
  def put_run_only_if_idle(runonlyifidle : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_idle.unsafe_as(Proc(Int16, HRESULT)).call(runonlyifidle)
  end
  def get_wake_to_run(pwake : Int16*) : HRESULT
    @lpVtbl.value.get_wake_to_run.unsafe_as(Proc(Int16*, HRESULT)).call(pwake)
  end
  def put_wake_to_run(wake : Int16) : HRESULT
    @lpVtbl.value.put_wake_to_run.unsafe_as(Proc(Int16, HRESULT)).call(wake)
  end
  def get_network_settings(ppnetworksettings : INetworkSettings*) : HRESULT
    @lpVtbl.value.get_network_settings.unsafe_as(Proc(INetworkSettings*, HRESULT)).call(ppnetworksettings)
  end
  def put_network_settings(pnetworksettings : INetworkSettings) : HRESULT
    @lpVtbl.value.put_network_settings.unsafe_as(Proc(INetworkSettings, HRESULT)).call(pnetworksettings)
  end
end
struct LibWin32::ITaskSettings2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_disallow_start_on_remote_app_session(pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_on_remote_app_session.unsafe_as(Proc(Int16*, HRESULT)).call(pdisallowstart)
  end
  def put_disallow_start_on_remote_app_session(disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_on_remote_app_session.unsafe_as(Proc(Int16, HRESULT)).call(disallowstart)
  end
  def get_use_unified_scheduling_engine(puseunifiedengine : Int16*) : HRESULT
    @lpVtbl.value.get_use_unified_scheduling_engine.unsafe_as(Proc(Int16*, HRESULT)).call(puseunifiedengine)
  end
  def put_use_unified_scheduling_engine(useunifiedengine : Int16) : HRESULT
    @lpVtbl.value.put_use_unified_scheduling_engine.unsafe_as(Proc(Int16, HRESULT)).call(useunifiedengine)
  end
end
struct LibWin32::ITaskSettings3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_allow_demand_start(pallowdemandstart : Int16*) : HRESULT
    @lpVtbl.value.get_allow_demand_start.unsafe_as(Proc(Int16*, HRESULT)).call(pallowdemandstart)
  end
  def put_allow_demand_start(allowdemandstart : Int16) : HRESULT
    @lpVtbl.value.put_allow_demand_start.unsafe_as(Proc(Int16, HRESULT)).call(allowdemandstart)
  end
  def get_restart_interval(prestartinterval : UInt8**) : HRESULT
    @lpVtbl.value.get_restart_interval.unsafe_as(Proc(UInt8**, HRESULT)).call(prestartinterval)
  end
  def put_restart_interval(restartinterval : UInt8*) : HRESULT
    @lpVtbl.value.put_restart_interval.unsafe_as(Proc(UInt8*, HRESULT)).call(restartinterval)
  end
  def get_restart_count(prestartcount : Int32*) : HRESULT
    @lpVtbl.value.get_restart_count.unsafe_as(Proc(Int32*, HRESULT)).call(prestartcount)
  end
  def put_restart_count(restartcount : Int32) : HRESULT
    @lpVtbl.value.put_restart_count.unsafe_as(Proc(Int32, HRESULT)).call(restartcount)
  end
  def get_multiple_instances(ppolicy : TASK_INSTANCES_POLICY*) : HRESULT
    @lpVtbl.value.get_multiple_instances.unsafe_as(Proc(TASK_INSTANCES_POLICY*, HRESULT)).call(ppolicy)
  end
  def put_multiple_instances(policy : TASK_INSTANCES_POLICY) : HRESULT
    @lpVtbl.value.put_multiple_instances.unsafe_as(Proc(TASK_INSTANCES_POLICY, HRESULT)).call(policy)
  end
  def get_stop_if_going_on_batteries(pstopifonbatteries : Int16*) : HRESULT
    @lpVtbl.value.get_stop_if_going_on_batteries.unsafe_as(Proc(Int16*, HRESULT)).call(pstopifonbatteries)
  end
  def put_stop_if_going_on_batteries(stopifonbatteries : Int16) : HRESULT
    @lpVtbl.value.put_stop_if_going_on_batteries.unsafe_as(Proc(Int16, HRESULT)).call(stopifonbatteries)
  end
  def get_disallow_start_if_on_batteries(pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_if_on_batteries.unsafe_as(Proc(Int16*, HRESULT)).call(pdisallowstart)
  end
  def put_disallow_start_if_on_batteries(disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_if_on_batteries.unsafe_as(Proc(Int16, HRESULT)).call(disallowstart)
  end
  def get_allow_hard_terminate(pallowhardterminate : Int16*) : HRESULT
    @lpVtbl.value.get_allow_hard_terminate.unsafe_as(Proc(Int16*, HRESULT)).call(pallowhardterminate)
  end
  def put_allow_hard_terminate(allowhardterminate : Int16) : HRESULT
    @lpVtbl.value.put_allow_hard_terminate.unsafe_as(Proc(Int16, HRESULT)).call(allowhardterminate)
  end
  def get_start_when_available(pstartwhenavailable : Int16*) : HRESULT
    @lpVtbl.value.get_start_when_available.unsafe_as(Proc(Int16*, HRESULT)).call(pstartwhenavailable)
  end
  def put_start_when_available(startwhenavailable : Int16) : HRESULT
    @lpVtbl.value.put_start_when_available.unsafe_as(Proc(Int16, HRESULT)).call(startwhenavailable)
  end
  def get_xml_text(ptext : UInt8**) : HRESULT
    @lpVtbl.value.get_xml_text.unsafe_as(Proc(UInt8**, HRESULT)).call(ptext)
  end
  def put_xml_text(text : UInt8*) : HRESULT
    @lpVtbl.value.put_xml_text.unsafe_as(Proc(UInt8*, HRESULT)).call(text)
  end
  def get_run_only_if_network_available(prunonlyifnetworkavailable : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_network_available.unsafe_as(Proc(Int16*, HRESULT)).call(prunonlyifnetworkavailable)
  end
  def put_run_only_if_network_available(runonlyifnetworkavailable : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_network_available.unsafe_as(Proc(Int16, HRESULT)).call(runonlyifnetworkavailable)
  end
  def get_execution_time_limit(pexecutiontimelimit : UInt8**) : HRESULT
    @lpVtbl.value.get_execution_time_limit.unsafe_as(Proc(UInt8**, HRESULT)).call(pexecutiontimelimit)
  end
  def put_execution_time_limit(executiontimelimit : UInt8*) : HRESULT
    @lpVtbl.value.put_execution_time_limit.unsafe_as(Proc(UInt8*, HRESULT)).call(executiontimelimit)
  end
  def get_enabled(penabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(penabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_delete_expired_task_after(pexpirationdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_delete_expired_task_after.unsafe_as(Proc(UInt8**, HRESULT)).call(pexpirationdelay)
  end
  def put_delete_expired_task_after(expirationdelay : UInt8*) : HRESULT
    @lpVtbl.value.put_delete_expired_task_after.unsafe_as(Proc(UInt8*, HRESULT)).call(expirationdelay)
  end
  def get_priority(ppriority : Int32*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(Int32*, HRESULT)).call(ppriority)
  end
  def put_priority(priority : Int32) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(Int32, HRESULT)).call(priority)
  end
  def get_compatibility(pcompatlevel : TASK_COMPATIBILITY*) : HRESULT
    @lpVtbl.value.get_compatibility.unsafe_as(Proc(TASK_COMPATIBILITY*, HRESULT)).call(pcompatlevel)
  end
  def put_compatibility(compatlevel : TASK_COMPATIBILITY) : HRESULT
    @lpVtbl.value.put_compatibility.unsafe_as(Proc(TASK_COMPATIBILITY, HRESULT)).call(compatlevel)
  end
  def get_hidden(phidden : Int16*) : HRESULT
    @lpVtbl.value.get_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(phidden)
  end
  def put_hidden(hidden : Int16) : HRESULT
    @lpVtbl.value.put_hidden.unsafe_as(Proc(Int16, HRESULT)).call(hidden)
  end
  def get_idle_settings(ppidlesettings : IIdleSettings*) : HRESULT
    @lpVtbl.value.get_idle_settings.unsafe_as(Proc(IIdleSettings*, HRESULT)).call(ppidlesettings)
  end
  def put_idle_settings(pidlesettings : IIdleSettings) : HRESULT
    @lpVtbl.value.put_idle_settings.unsafe_as(Proc(IIdleSettings, HRESULT)).call(pidlesettings)
  end
  def get_run_only_if_idle(prunonlyifidle : Int16*) : HRESULT
    @lpVtbl.value.get_run_only_if_idle.unsafe_as(Proc(Int16*, HRESULT)).call(prunonlyifidle)
  end
  def put_run_only_if_idle(runonlyifidle : Int16) : HRESULT
    @lpVtbl.value.put_run_only_if_idle.unsafe_as(Proc(Int16, HRESULT)).call(runonlyifidle)
  end
  def get_wake_to_run(pwake : Int16*) : HRESULT
    @lpVtbl.value.get_wake_to_run.unsafe_as(Proc(Int16*, HRESULT)).call(pwake)
  end
  def put_wake_to_run(wake : Int16) : HRESULT
    @lpVtbl.value.put_wake_to_run.unsafe_as(Proc(Int16, HRESULT)).call(wake)
  end
  def get_network_settings(ppnetworksettings : INetworkSettings*) : HRESULT
    @lpVtbl.value.get_network_settings.unsafe_as(Proc(INetworkSettings*, HRESULT)).call(ppnetworksettings)
  end
  def put_network_settings(pnetworksettings : INetworkSettings) : HRESULT
    @lpVtbl.value.put_network_settings.unsafe_as(Proc(INetworkSettings, HRESULT)).call(pnetworksettings)
  end
  def get_disallow_start_on_remote_app_session(pdisallowstart : Int16*) : HRESULT
    @lpVtbl.value.get_disallow_start_on_remote_app_session.unsafe_as(Proc(Int16*, HRESULT)).call(pdisallowstart)
  end
  def put_disallow_start_on_remote_app_session(disallowstart : Int16) : HRESULT
    @lpVtbl.value.put_disallow_start_on_remote_app_session.unsafe_as(Proc(Int16, HRESULT)).call(disallowstart)
  end
  def get_use_unified_scheduling_engine(puseunifiedengine : Int16*) : HRESULT
    @lpVtbl.value.get_use_unified_scheduling_engine.unsafe_as(Proc(Int16*, HRESULT)).call(puseunifiedengine)
  end
  def put_use_unified_scheduling_engine(useunifiedengine : Int16) : HRESULT
    @lpVtbl.value.put_use_unified_scheduling_engine.unsafe_as(Proc(Int16, HRESULT)).call(useunifiedengine)
  end
  def get_maintenance_settings(ppmaintenancesettings : IMaintenanceSettings*) : HRESULT
    @lpVtbl.value.get_maintenance_settings.unsafe_as(Proc(IMaintenanceSettings*, HRESULT)).call(ppmaintenancesettings)
  end
  def put_maintenance_settings(pmaintenancesettings : IMaintenanceSettings) : HRESULT
    @lpVtbl.value.put_maintenance_settings.unsafe_as(Proc(IMaintenanceSettings, HRESULT)).call(pmaintenancesettings)
  end
  def create_maintenance_settings(ppmaintenancesettings : IMaintenanceSettings*) : HRESULT
    @lpVtbl.value.create_maintenance_settings.unsafe_as(Proc(IMaintenanceSettings*, HRESULT)).call(ppmaintenancesettings)
  end
  def get_volatile(pvolatile : Int16*) : HRESULT
    @lpVtbl.value.get_volatile.unsafe_as(Proc(Int16*, HRESULT)).call(pvolatile)
  end
  def put_volatile(volatile : Int16) : HRESULT
    @lpVtbl.value.put_volatile.unsafe_as(Proc(Int16, HRESULT)).call(volatile)
  end
end
struct LibWin32::IMaintenanceSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def put_period(value : UInt8*) : HRESULT
    @lpVtbl.value.put_period.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_period(target : UInt8**) : HRESULT
    @lpVtbl.value.get_period.unsafe_as(Proc(UInt8**, HRESULT)).call(target)
  end
  def put_deadline(value : UInt8*) : HRESULT
    @lpVtbl.value.put_deadline.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_deadline(target : UInt8**) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(UInt8**, HRESULT)).call(target)
  end
  def put_exclusive(value : Int16) : HRESULT
    @lpVtbl.value.put_exclusive.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_exclusive(target : Int16*) : HRESULT
    @lpVtbl.value.get_exclusive.unsafe_as(Proc(Int16*, HRESULT)).call(target)
  end
end
struct LibWin32::IRegisteredTaskCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcount)
  end
  def get_item(index : VARIANT, ppregisteredtask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(VARIANT, IRegisteredTask*, HRESULT)).call(index, ppregisteredtask)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ITaskFolder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def get_path(ppath : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(ppath)
  end
  def get_folder(path : UInt8*, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.get_folder.unsafe_as(Proc(UInt8*, ITaskFolder*, HRESULT)).call(path, ppfolder)
  end
  def get_folders(flags : Int32, ppfolders : ITaskFolderCollection*) : HRESULT
    @lpVtbl.value.get_folders.unsafe_as(Proc(Int32, ITaskFolderCollection*, HRESULT)).call(flags, ppfolders)
  end
  def create_folder(subfoldername : UInt8*, sddl : VARIANT, ppfolder : ITaskFolder*) : HRESULT
    @lpVtbl.value.create_folder.unsafe_as(Proc(UInt8*, VARIANT, ITaskFolder*, HRESULT)).call(subfoldername, sddl, ppfolder)
  end
  def delete_folder(subfoldername : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.delete_folder.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(subfoldername, flags)
  end
  def get_task(path : UInt8*, pptask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.get_task.unsafe_as(Proc(UInt8*, IRegisteredTask*, HRESULT)).call(path, pptask)
  end
  def get_tasks(flags : Int32, pptasks : IRegisteredTaskCollection*) : HRESULT
    @lpVtbl.value.get_tasks.unsafe_as(Proc(Int32, IRegisteredTaskCollection*, HRESULT)).call(flags, pptasks)
  end
  def delete_task(name : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.delete_task.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(name, flags)
  end
  def register_task(path : UInt8*, xmltext : UInt8*, flags : Int32, userid : VARIANT, password : VARIANT, logontype : TASK_LOGON_TYPE, sddl : VARIANT, pptask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.register_task.unsafe_as(Proc(UInt8*, UInt8*, Int32, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*, HRESULT)).call(path, xmltext, flags, userid, password, logontype, sddl, pptask)
  end
  def register_task_definition(path : UInt8*, pdefinition : ITaskDefinition, flags : Int32, userid : VARIANT, password : VARIANT, logontype : TASK_LOGON_TYPE, sddl : VARIANT, pptask : IRegisteredTask*) : HRESULT
    @lpVtbl.value.register_task_definition.unsafe_as(Proc(UInt8*, ITaskDefinition, Int32, VARIANT, VARIANT, TASK_LOGON_TYPE, VARIANT, IRegisteredTask*, HRESULT)).call(path, pdefinition, flags, userid, password, logontype, sddl, pptask)
  end
  def get_security_descriptor(securityinformation : Int32, psddl : UInt8**) : HRESULT
    @lpVtbl.value.get_security_descriptor.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(securityinformation, psddl)
  end
  def set_security_descriptor(sddl : UInt8*, flags : Int32) : HRESULT
    @lpVtbl.value.set_security_descriptor.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(sddl, flags)
  end
end
struct LibWin32::IIdleSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_idle_duration(pdelay : UInt8**) : HRESULT
    @lpVtbl.value.get_idle_duration.unsafe_as(Proc(UInt8**, HRESULT)).call(pdelay)
  end
  def put_idle_duration(delay : UInt8*) : HRESULT
    @lpVtbl.value.put_idle_duration.unsafe_as(Proc(UInt8*, HRESULT)).call(delay)
  end
  def get_wait_timeout(ptimeout : UInt8**) : HRESULT
    @lpVtbl.value.get_wait_timeout.unsafe_as(Proc(UInt8**, HRESULT)).call(ptimeout)
  end
  def put_wait_timeout(timeout : UInt8*) : HRESULT
    @lpVtbl.value.put_wait_timeout.unsafe_as(Proc(UInt8*, HRESULT)).call(timeout)
  end
  def get_stop_on_idle_end(pstop : Int16*) : HRESULT
    @lpVtbl.value.get_stop_on_idle_end.unsafe_as(Proc(Int16*, HRESULT)).call(pstop)
  end
  def put_stop_on_idle_end(stop : Int16) : HRESULT
    @lpVtbl.value.put_stop_on_idle_end.unsafe_as(Proc(Int16, HRESULT)).call(stop)
  end
  def get_restart_on_idle(prestart : Int16*) : HRESULT
    @lpVtbl.value.get_restart_on_idle.unsafe_as(Proc(Int16*, HRESULT)).call(prestart)
  end
  def put_restart_on_idle(restart : Int16) : HRESULT
    @lpVtbl.value.put_restart_on_idle.unsafe_as(Proc(Int16, HRESULT)).call(restart)
  end
end
struct LibWin32::INetworkSettings
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(pname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pname)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_id(pid : UInt8**) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pid)
  end
  def put_id(id : UInt8*) : HRESULT
    @lpVtbl.value.put_id.unsafe_as(Proc(UInt8*, HRESULT)).call(id)
  end
end
struct LibWin32::IRepetitionPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_interval(pinterval : UInt8**) : HRESULT
    @lpVtbl.value.get_interval.unsafe_as(Proc(UInt8**, HRESULT)).call(pinterval)
  end
  def put_interval(interval : UInt8*) : HRESULT
    @lpVtbl.value.put_interval.unsafe_as(Proc(UInt8*, HRESULT)).call(interval)
  end
  def get_duration(pduration : UInt8**) : HRESULT
    @lpVtbl.value.get_duration.unsafe_as(Proc(UInt8**, HRESULT)).call(pduration)
  end
  def put_duration(duration : UInt8*) : HRESULT
    @lpVtbl.value.put_duration.unsafe_as(Proc(UInt8*, HRESULT)).call(duration)
  end
  def get_stop_at_duration_end(pstop : Int16*) : HRESULT
    @lpVtbl.value.get_stop_at_duration_end.unsafe_as(Proc(Int16*, HRESULT)).call(pstop)
  end
  def put_stop_at_duration_end(stop : Int16) : HRESULT
    @lpVtbl.value.put_stop_at_duration_end.unsafe_as(Proc(Int16, HRESULT)).call(stop)
  end
end
