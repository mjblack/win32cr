require "../foundation.cr"
require "../security.cr"
require "../system/registry.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-service-core-l1-1-3.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-service-core-l1-1-4.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-service-core-l1-1-5.dll")]
lib LibWin32
  alias SERVICE_STATUS_HANDLE = LibC::IntPtrT

  SERVICE_ALL_ACCESS = 983551_u32
  SC_MANAGER_ALL_ACCESS = 983103_u32
  SERVICE_NO_CHANGE = 4294967295_u32
  SERVICE_CONTROL_STOP = 1_u32
  SERVICE_CONTROL_PAUSE = 2_u32
  SERVICE_CONTROL_CONTINUE = 3_u32
  SERVICE_CONTROL_INTERROGATE = 4_u32
  SERVICE_CONTROL_SHUTDOWN = 5_u32
  SERVICE_CONTROL_PARAMCHANGE = 6_u32
  SERVICE_CONTROL_NETBINDADD = 7_u32
  SERVICE_CONTROL_NETBINDREMOVE = 8_u32
  SERVICE_CONTROL_NETBINDENABLE = 9_u32
  SERVICE_CONTROL_NETBINDDISABLE = 10_u32
  SERVICE_CONTROL_DEVICEEVENT = 11_u32
  SERVICE_CONTROL_HARDWAREPROFILECHANGE = 12_u32
  SERVICE_CONTROL_POWEREVENT = 13_u32
  SERVICE_CONTROL_SESSIONCHANGE = 14_u32
  SERVICE_CONTROL_PRESHUTDOWN = 15_u32
  SERVICE_CONTROL_TIMECHANGE = 16_u32
  SERVICE_CONTROL_TRIGGEREVENT = 32_u32
  SERVICE_CONTROL_LOWRESOURCES = 96_u32
  SERVICE_CONTROL_SYSTEMLOWRESOURCES = 97_u32
  SERVICE_ACCEPT_STOP = 1_u32
  SERVICE_ACCEPT_PAUSE_CONTINUE = 2_u32
  SERVICE_ACCEPT_SHUTDOWN = 4_u32
  SERVICE_ACCEPT_PARAMCHANGE = 8_u32
  SERVICE_ACCEPT_NETBINDCHANGE = 16_u32
  SERVICE_ACCEPT_HARDWAREPROFILECHANGE = 32_u32
  SERVICE_ACCEPT_POWEREVENT = 64_u32
  SERVICE_ACCEPT_SESSIONCHANGE = 128_u32
  SERVICE_ACCEPT_PRESHUTDOWN = 256_u32
  SERVICE_ACCEPT_TIMECHANGE = 512_u32
  SERVICE_ACCEPT_TRIGGEREVENT = 1024_u32
  SERVICE_ACCEPT_USER_LOGOFF = 2048_u32
  SERVICE_ACCEPT_LOWRESOURCES = 8192_u32
  SERVICE_ACCEPT_SYSTEMLOWRESOURCES = 16384_u32
  SC_MANAGER_CONNECT = 1_u32
  SC_MANAGER_CREATE_SERVICE = 2_u32
  SC_MANAGER_ENUMERATE_SERVICE = 4_u32
  SC_MANAGER_LOCK = 8_u32
  SC_MANAGER_QUERY_LOCK_STATUS = 16_u32
  SC_MANAGER_MODIFY_BOOT_CONFIG = 32_u32
  SERVICE_QUERY_CONFIG = 1_u32
  SERVICE_CHANGE_CONFIG = 2_u32
  SERVICE_QUERY_STATUS = 4_u32
  SERVICE_ENUMERATE_DEPENDENTS = 8_u32
  SERVICE_START = 16_u32
  SERVICE_STOP = 32_u32
  SERVICE_PAUSE_CONTINUE = 64_u32
  SERVICE_INTERROGATE = 128_u32
  SERVICE_USER_DEFINED_CONTROL = 256_u32
  SERVICE_NOTIFY_STATUS_CHANGE_1 = 1_u32
  SERVICE_NOTIFY_STATUS_CHANGE_2 = 2_u32
  SERVICE_NOTIFY_STATUS_CHANGE = 2_u32
  SERVICE_STOP_REASON_FLAG_MIN = 0_u32
  SERVICE_STOP_REASON_FLAG_UNPLANNED = 268435456_u32
  SERVICE_STOP_REASON_FLAG_CUSTOM = 536870912_u32
  SERVICE_STOP_REASON_FLAG_PLANNED = 1073741824_u32
  SERVICE_STOP_REASON_FLAG_MAX = 2147483648_u32
  SERVICE_STOP_REASON_MAJOR_MIN = 0_u32
  SERVICE_STOP_REASON_MAJOR_OTHER = 65536_u32
  SERVICE_STOP_REASON_MAJOR_HARDWARE = 131072_u32
  SERVICE_STOP_REASON_MAJOR_OPERATINGSYSTEM = 196608_u32
  SERVICE_STOP_REASON_MAJOR_SOFTWARE = 262144_u32
  SERVICE_STOP_REASON_MAJOR_APPLICATION = 327680_u32
  SERVICE_STOP_REASON_MAJOR_NONE = 393216_u32
  SERVICE_STOP_REASON_MAJOR_MAX = 458752_u32
  SERVICE_STOP_REASON_MAJOR_MIN_CUSTOM = 4194304_u32
  SERVICE_STOP_REASON_MAJOR_MAX_CUSTOM = 16711680_u32
  SERVICE_STOP_REASON_MINOR_MIN = 0_u32
  SERVICE_STOP_REASON_MINOR_OTHER = 1_u32
  SERVICE_STOP_REASON_MINOR_MAINTENANCE = 2_u32
  SERVICE_STOP_REASON_MINOR_INSTALLATION = 3_u32
  SERVICE_STOP_REASON_MINOR_UPGRADE = 4_u32
  SERVICE_STOP_REASON_MINOR_RECONFIG = 5_u32
  SERVICE_STOP_REASON_MINOR_HUNG = 6_u32
  SERVICE_STOP_REASON_MINOR_UNSTABLE = 7_u32
  SERVICE_STOP_REASON_MINOR_DISK = 8_u32
  SERVICE_STOP_REASON_MINOR_NETWORKCARD = 9_u32
  SERVICE_STOP_REASON_MINOR_ENVIRONMENT = 10_u32
  SERVICE_STOP_REASON_MINOR_HARDWARE_DRIVER = 11_u32
  SERVICE_STOP_REASON_MINOR_OTHERDRIVER = 12_u32
  SERVICE_STOP_REASON_MINOR_SERVICEPACK = 13_u32
  SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE = 14_u32
  SERVICE_STOP_REASON_MINOR_SECURITYFIX = 15_u32
  SERVICE_STOP_REASON_MINOR_SECURITY = 16_u32
  SERVICE_STOP_REASON_MINOR_NETWORK_CONNECTIVITY = 17_u32
  SERVICE_STOP_REASON_MINOR_WMI = 18_u32
  SERVICE_STOP_REASON_MINOR_SERVICEPACK_UNINSTALL = 19_u32
  SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE_UNINSTALL = 20_u32
  SERVICE_STOP_REASON_MINOR_SECURITYFIX_UNINSTALL = 21_u32
  SERVICE_STOP_REASON_MINOR_MMC = 22_u32
  SERVICE_STOP_REASON_MINOR_NONE = 23_u32
  SERVICE_STOP_REASON_MINOR_MEMOTYLIMIT = 24_u32
  SERVICE_STOP_REASON_MINOR_MAX = 25_u32
  SERVICE_STOP_REASON_MINOR_MIN_CUSTOM = 256_u32
  SERVICE_STOP_REASON_MINOR_MAX_CUSTOM = 65535_u32
  SERVICE_CONTROL_STATUS_REASON_INFO = 1_u32
  SERVICE_SID_TYPE_NONE = 0_u32
  SERVICE_SID_TYPE_UNRESTRICTED = 1_u32
  SERVICE_TRIGGER_TYPE_CUSTOM_SYSTEM_STATE_CHANGE = 7_u32
  SERVICE_TRIGGER_TYPE_AGGREGATE = 30_u32
  SERVICE_START_REASON_DEMAND = 1_u32
  SERVICE_START_REASON_AUTO = 2_u32
  SERVICE_START_REASON_TRIGGER = 4_u32
  SERVICE_START_REASON_RESTART_ON_FAILURE = 8_u32
  SERVICE_START_REASON_DELAYEDAUTO = 16_u32
  SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON = 1_u32
  SERVICE_LAUNCH_PROTECTED_NONE = 0_u32
  SERVICE_LAUNCH_PROTECTED_WINDOWS = 1_u32
  SERVICE_LAUNCH_PROTECTED_WINDOWS_LIGHT = 2_u32
  SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT = 3_u32
  NETWORK_MANAGER_FIRST_IP_ADDRESS_ARRIVAL_GUID = "4f27f2de-14e2-430b-a549-7cd48cbc8245"
  NETWORK_MANAGER_LAST_IP_ADDRESS_REMOVAL_GUID = "cc4ba62a-162e-4648-847a-b6bdf993e335"
  DOMAIN_JOIN_GUID = "1ce20aba-9851-4421-9430-1ddeb766e809"
  DOMAIN_LEAVE_GUID = "ddaf516e-58c2-4866-9574-c3b615d42ea1"
  FIREWALL_PORT_OPEN_GUID = "b7569e07-8421-4ee0-ad10-86915afdad09"
  FIREWALL_PORT_CLOSE_GUID = "a144ed38-8e12-4de4-9d96-e64740b1a524"
  MACHINE_POLICY_PRESENT_GUID = "659fcae6-5bdb-4da9-b1ff-ca2a178d46e0"
  USER_POLICY_PRESENT_GUID = "54fb46c8-f089-464c-b1fd-59d1b62c3b50"
  RPC_INTERFACE_EVENT_GUID = "bc90d167-9470-4139-a9ba-be0bbbf5b74d"
  NAMED_PIPE_EVENT_GUID = "1f81d131-3fac-4537-9e0c-7e7b0c2f4b55"
  CUSTOM_SYSTEM_STATE_CHANGE_EVENT_GUID = "2d7a2816-0c5e-45fc-9ce7-570e5ecde9c9"

  type SC_NOTIFICATION_REGISTRATION = Void

  alias SERVICE_MAIN_FUNCTIONW = Proc(UInt32, LibC::LPWSTR*, Void)
  alias SERVICE_MAIN_FUNCTIONA = Proc(UInt32, Int8**, Void)
  alias LPSERVICE_MAIN_FUNCTIONW = Proc(UInt32, LibC::LPWSTR*, Void)
  alias LPSERVICE_MAIN_FUNCTIONA = Proc(UInt32, PSTR*, Void)
  alias HANDLER_FUNCTION = Proc(UInt32, Void)
  alias HANDLER_FUNCTION_EX = Proc(UInt32, UInt32, Void*, Void*, UInt32)
  alias LPHANDLER_FUNCTION = Proc(UInt32, Void)
  alias LPHANDLER_FUNCTION_EX = Proc(UInt32, UInt32, Void*, Void*, UInt32)
  alias PFN_SC_NOTIFY_CALLBACK = Proc(Void*, Void)
  alias PSC_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, Void)


  enum ENUM_SERVICE_STATE : UInt32
    SERVICE_ACTIVE = 1
    SERVICE_INACTIVE = 2
    SERVICE_STATE_ALL = 3
  end

  enum SERVICE_ERROR : UInt32
    SERVICE_ERROR_CRITICAL = 3
    SERVICE_ERROR_IGNORE = 0
    SERVICE_ERROR_NORMAL = 1
    SERVICE_ERROR_SEVERE = 2
  end

  enum SERVICE_CONFIG : UInt32
    SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3
    SERVICE_CONFIG_DESCRIPTION = 1
    SERVICE_CONFIG_FAILURE_ACTIONS = 2
    SERVICE_CONFIG_FAILURE_ACTIONS_FLAG = 4
    SERVICE_CONFIG_PREFERRED_NODE = 9
    SERVICE_CONFIG_PRESHUTDOWN_INFO = 7
    SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 6
    SERVICE_CONFIG_SERVICE_SID_INFO = 5
    SERVICE_CONFIG_TRIGGER_INFO = 8
    SERVICE_CONFIG_LAUNCH_PROTECTED = 12
  end

  enum ENUM_SERVICE_TYPE : UInt32
    SERVICE_DRIVER = 11
    SERVICE_FILE_SYSTEM_DRIVER_ = 2
    SERVICE_KERNEL_DRIVER = 1
    SERVICE_WIN32 = 48
    SERVICE_WIN32_OWN_PROCESS_ = 16
    SERVICE_WIN32_SHARE_PROCESS = 32
    SERVICE_ADAPTER = 4
    SERVICE_FILE_SYSTEM_DRIVER = 2
    SERVICE_RECOGNIZER_DRIVER = 8
    SERVICE_WIN32_OWN_PROCESS = 16
    SERVICE_USER_OWN_PROCESS = 80
    SERVICE_USER_SHARE_PROCESS = 96
  end

  enum SERVICE_START_TYPE : UInt32
    SERVICE_AUTO_START = 2
    SERVICE_BOOT_START = 0
    SERVICE_DEMAND_START = 3
    SERVICE_DISABLED = 4
    SERVICE_SYSTEM_START = 1
  end

  enum SERVICE_NOTIFY : UInt32
    SERVICE_NOTIFY_CREATED = 128
    SERVICE_NOTIFY_CONTINUE_PENDING = 16
    SERVICE_NOTIFY_DELETE_PENDING = 512
    SERVICE_NOTIFY_DELETED = 256
    SERVICE_NOTIFY_PAUSE_PENDING = 32
    SERVICE_NOTIFY_PAUSED = 64
    SERVICE_NOTIFY_RUNNING = 8
    SERVICE_NOTIFY_START_PENDING = 2
    SERVICE_NOTIFY_STOP_PENDING = 4
    SERVICE_NOTIFY_STOPPED = 1
  end

  enum SERVICE_RUNS_IN_PROCESS : UInt32
    SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING = 0
    SERVICE_RUNS_IN_SYSTEM_PROCESS = 1
  end

  enum SERVICE_TRIGGER_ACTION : UInt32
    SERVICE_TRIGGER_ACTION_SERVICE_START = 1
    SERVICE_TRIGGER_ACTION_SERVICE_STOP = 2
  end

  enum SERVICE_TRIGGER_TYPE : UInt32
    SERVICE_TRIGGER_TYPE_CUSTOM = 20
    SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL = 1
    SERVICE_TRIGGER_TYPE_DOMAIN_JOIN = 3
    SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT = 4
    SERVICE_TRIGGER_TYPE_GROUP_POLICY = 5
    SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY = 2
    SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT = 6
  end

  enum SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE : UInt32
    SERVICE_TRIGGER_DATA_TYPE_BINARY = 1
    SERVICE_TRIGGER_DATA_TYPE_STRING = 2
    SERVICE_TRIGGER_DATA_TYPE_LEVEL = 3
    SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY = 4
    SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL = 5
  end

  enum SERVICE_STATUS_CURRENT_STATE : UInt32
    SERVICE_CONTINUE_PENDING = 5
    SERVICE_PAUSE_PENDING = 6
    SERVICE_PAUSED = 7
    SERVICE_RUNNING = 4
    SERVICE_START_PENDING = 2
    SERVICE_STOP_PENDING = 3
    SERVICE_STOPPED = 1
  end

  enum SC_ACTION_TYPE : Int32
    SC_ACTION_NONE = 0
    SC_ACTION_RESTART = 1
    SC_ACTION_REBOOT = 2
    SC_ACTION_RUN_COMMAND = 3
    SC_ACTION_OWN_RESTART = 4
  end

  enum SC_STATUS_TYPE : Int32
    SC_STATUS_PROCESS_INFO = 0
  end

  enum SC_ENUM_TYPE : Int32
    SC_ENUM_PROCESS_INFO = 0
  end

  enum SC_EVENT_TYPE : Int32
    SC_EVENT_DATABASE_CHANGE = 0
    SC_EVENT_PROPERTY_CHANGE = 1
    SC_EVENT_STATUS_CHANGE = 2
  end

  enum SERVICE_REGISTRY_STATE_TYPE : Int32
    ServiceRegistryStateParameters = 0
    ServiceRegistryStatePersistent = 1
    MaxServiceRegistryStateType = 2
  end

  enum SERVICE_DIRECTORY_TYPE : Int32
    ServiceDirectoryPersistentState = 0
    ServiceDirectoryTypeMax = 1
  end

  enum SERVICE_SHARED_REGISTRY_STATE_TYPE : Int32
    ServiceSharedRegistryPersistentState = 0
  end

  enum SERVICE_SHARED_DIRECTORY_TYPE : Int32
    ServiceSharedDirectoryPersistentState = 0
  end

  union SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM_u_e__Union
    custom_state_id : SERVICE_TRIGGER_CUSTOM_STATE_ID
    s : SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM_u_e__Union_s_e__Struct
  end

  struct SERVICE_TRIGGER_CUSTOM_STATE_ID
    data : UInt32[2]*
  end
  struct SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM
    u : SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM_u_e__Union
  end
  struct SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM_u_e__Union_s_e__Struct
    data_offset : UInt32
    data : UInt8[0]*
  end
  struct SERVICE_DESCRIPTIONA
    lp_description : PSTR
  end
  struct SERVICE_DESCRIPTIONW
    lp_description : LibC::LPWSTR
  end
  struct SC_ACTION
    type : SC_ACTION_TYPE
    delay : UInt32
  end
  struct SERVICE_FAILURE_ACTIONSA
    dw_reset_period : UInt32
    lp_reboot_msg : PSTR
    lp_command : PSTR
    c_actions : UInt32
    lpsa_actions : SC_ACTION*
  end
  struct SERVICE_FAILURE_ACTIONSW
    dw_reset_period : UInt32
    lp_reboot_msg : LibC::LPWSTR
    lp_command : LibC::LPWSTR
    c_actions : UInt32
    lpsa_actions : SC_ACTION*
  end
  struct SERVICE_DELAYED_AUTO_START_INFO
    f_delayed_autostart : LibC::BOOL
  end
  struct SERVICE_FAILURE_ACTIONS_FLAG
    f_failure_actions_on_non_crash_failures : LibC::BOOL
  end
  struct SERVICE_SID_INFO
    dw_service_sid_type : UInt32
  end
  struct SERVICE_REQUIRED_PRIVILEGES_INFOA
    pmsz_required_privileges : PSTR
  end
  struct SERVICE_REQUIRED_PRIVILEGES_INFOW
    pmsz_required_privileges : LibC::LPWSTR
  end
  struct SERVICE_PRESHUTDOWN_INFO
    dw_preshutdown_timeout : UInt32
  end
  struct SERVICE_TRIGGER_SPECIFIC_DATA_ITEM
    dw_data_type : SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE
    cb_data : UInt32
    p_data : UInt8*
  end
  struct SERVICE_TRIGGER
    dw_trigger_type : SERVICE_TRIGGER_TYPE
    dw_action : SERVICE_TRIGGER_ACTION
    p_trigger_subtype : Guid*
    c_data_items : UInt32
    p_data_items : SERVICE_TRIGGER_SPECIFIC_DATA_ITEM*
  end
  struct SERVICE_TRIGGER_INFO
    c_triggers : UInt32
    p_triggers : SERVICE_TRIGGER*
    p_reserved : UInt8*
  end
  struct SERVICE_PREFERRED_NODE_INFO
    us_preferred_node : UInt16
    f_delete : BOOLEAN
  end
  struct SERVICE_TIMECHANGE_INFO
    li_new_time : LARGE_INTEGER
    li_old_time : LARGE_INTEGER
  end
  struct SERVICE_LAUNCH_PROTECTED_INFO
    dw_launch_protected : UInt32
  end
  struct SERVICE_STATUS
    dw_service_type : ENUM_SERVICE_TYPE
    dw_current_state : SERVICE_STATUS_CURRENT_STATE
    dw_controls_accepted : UInt32
    dw_win32_exit_code : UInt32
    dw_service_specific_exit_code : UInt32
    dw_check_point : UInt32
    dw_wait_hint : UInt32
  end
  struct SERVICE_STATUS_PROCESS
    dw_service_type : ENUM_SERVICE_TYPE
    dw_current_state : SERVICE_STATUS_CURRENT_STATE
    dw_controls_accepted : UInt32
    dw_win32_exit_code : UInt32
    dw_service_specific_exit_code : UInt32
    dw_check_point : UInt32
    dw_wait_hint : UInt32
    dw_process_id : UInt32
    dw_service_flags : SERVICE_RUNS_IN_PROCESS
  end
  struct ENUM_SERVICE_STATUSA
    lp_service_name : PSTR
    lp_display_name : PSTR
    service_status : SERVICE_STATUS
  end
  struct ENUM_SERVICE_STATUSW
    lp_service_name : LibC::LPWSTR
    lp_display_name : LibC::LPWSTR
    service_status : SERVICE_STATUS
  end
  struct ENUM_SERVICE_STATUS_PROCESSA
    lp_service_name : PSTR
    lp_display_name : PSTR
    service_status_process : SERVICE_STATUS_PROCESS
  end
  struct ENUM_SERVICE_STATUS_PROCESSW
    lp_service_name : LibC::LPWSTR
    lp_display_name : LibC::LPWSTR
    service_status_process : SERVICE_STATUS_PROCESS
  end
  struct QUERY_SERVICE_LOCK_STATUSA
    f_is_locked : UInt32
    lp_lock_owner : PSTR
    dw_lock_duration : UInt32
  end
  struct QUERY_SERVICE_LOCK_STATUSW
    f_is_locked : UInt32
    lp_lock_owner : LibC::LPWSTR
    dw_lock_duration : UInt32
  end
  struct QUERY_SERVICE_CONFIGA
    dw_service_type : ENUM_SERVICE_TYPE
    dw_start_type : SERVICE_START_TYPE
    dw_error_control : SERVICE_ERROR
    lp_binary_path_name : PSTR
    lp_load_order_group : PSTR
    dw_tag_id : UInt32
    lp_dependencies : PSTR
    lp_service_start_name : PSTR
    lp_display_name : PSTR
  end
  struct QUERY_SERVICE_CONFIGW
    dw_service_type : ENUM_SERVICE_TYPE
    dw_start_type : SERVICE_START_TYPE
    dw_error_control : SERVICE_ERROR
    lp_binary_path_name : LibC::LPWSTR
    lp_load_order_group : LibC::LPWSTR
    dw_tag_id : UInt32
    lp_dependencies : LibC::LPWSTR
    lp_service_start_name : LibC::LPWSTR
    lp_display_name : LibC::LPWSTR
  end
  struct SERVICE_TABLE_ENTRYA
    lp_service_name : PSTR
    lp_service_proc : LPSERVICE_MAIN_FUNCTIONA
  end
  struct SERVICE_TABLE_ENTRYW
    lp_service_name : LibC::LPWSTR
    lp_service_proc : LPSERVICE_MAIN_FUNCTIONW
  end
  struct SERVICE_NOTIFY_1
    dw_version : UInt32
    pfn_notify_callback : PFN_SC_NOTIFY_CALLBACK
    p_context : Void*
    dw_notification_status : UInt32
    service_status : SERVICE_STATUS_PROCESS
  end
  struct SERVICE_NOTIFY_2A
    dw_version : UInt32
    pfn_notify_callback : PFN_SC_NOTIFY_CALLBACK
    p_context : Void*
    dw_notification_status : UInt32
    service_status : SERVICE_STATUS_PROCESS
    dw_notification_triggered : UInt32
    psz_service_names : PSTR
  end
  struct SERVICE_NOTIFY_2W
    dw_version : UInt32
    pfn_notify_callback : PFN_SC_NOTIFY_CALLBACK
    p_context : Void*
    dw_notification_status : UInt32
    service_status : SERVICE_STATUS_PROCESS
    dw_notification_triggered : UInt32
    psz_service_names : LibC::LPWSTR
  end
  struct SERVICE_CONTROL_STATUS_REASON_PARAMSA
    dw_reason : UInt32
    psz_comment : PSTR
    service_status : SERVICE_STATUS_PROCESS
  end
  struct SERVICE_CONTROL_STATUS_REASON_PARAMSW
    dw_reason : UInt32
    psz_comment : LibC::LPWSTR
    service_status : SERVICE_STATUS_PROCESS
  end
  struct SERVICE_START_REASON
    dw_reason : UInt32
  end


  # Params # hservicestatus : SERVICE_STATUS_HANDLE [In],dwservicebits : UInt32 [In],bsetbitson : LibC::BOOL [In],bupdateimmediately : LibC::BOOL [In]
  fun SetServiceBits(hservicestatus : SERVICE_STATUS_HANDLE, dwservicebits : UInt32, bsetbitson : LibC::BOOL, bupdateimmediately : LibC::BOOL) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwservicetype : UInt32 [In],dwstarttype : SERVICE_START_TYPE [In],dwerrorcontrol : SERVICE_ERROR [In],lpbinarypathname : PSTR [In],lploadordergroup : PSTR [In],lpdwtagid : UInt32* [In],lpdependencies : PSTR [In],lpservicestartname : PSTR [In],lppassword : PSTR [In],lpdisplayname : PSTR [In]
  fun ChangeServiceConfigA(hservice : SC_HANDLE, dwservicetype : UInt32, dwstarttype : SERVICE_START_TYPE, dwerrorcontrol : SERVICE_ERROR, lpbinarypathname : PSTR, lploadordergroup : PSTR, lpdwtagid : UInt32*, lpdependencies : PSTR, lpservicestartname : PSTR, lppassword : PSTR, lpdisplayname : PSTR) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwservicetype : UInt32 [In],dwstarttype : SERVICE_START_TYPE [In],dwerrorcontrol : SERVICE_ERROR [In],lpbinarypathname : LibC::LPWSTR [In],lploadordergroup : LibC::LPWSTR [In],lpdwtagid : UInt32* [In],lpdependencies : LibC::LPWSTR [In],lpservicestartname : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],lpdisplayname : LibC::LPWSTR [In]
  fun ChangeServiceConfigW(hservice : SC_HANDLE, dwservicetype : UInt32, dwstarttype : SERVICE_START_TYPE, dwerrorcontrol : SERVICE_ERROR, lpbinarypathname : LibC::LPWSTR, lploadordergroup : LibC::LPWSTR, lpdwtagid : UInt32*, lpdependencies : LibC::LPWSTR, lpservicestartname : LibC::LPWSTR, lppassword : LibC::LPWSTR, lpdisplayname : LibC::LPWSTR) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwinfolevel : SERVICE_CONFIG [In],lpinfo : Void* [In]
  fun ChangeServiceConfig2A(hservice : SC_HANDLE, dwinfolevel : SERVICE_CONFIG, lpinfo : Void*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwinfolevel : SERVICE_CONFIG [In],lpinfo : Void* [In]
  fun ChangeServiceConfig2W(hservice : SC_HANDLE, dwinfolevel : SERVICE_CONFIG, lpinfo : Void*) : LibC::BOOL

  # Params # hscobject : SC_HANDLE [In]
  fun CloseServiceHandle(hscobject : SC_HANDLE) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwcontrol : UInt32 [In],lpservicestatus : SERVICE_STATUS* [In]
  fun ControlService(hservice : SC_HANDLE, dwcontrol : UInt32, lpservicestatus : SERVICE_STATUS*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lpservicename : PSTR [In],lpdisplayname : PSTR [In],dwdesiredaccess : UInt32 [In],dwservicetype : ENUM_SERVICE_TYPE [In],dwstarttype : SERVICE_START_TYPE [In],dwerrorcontrol : SERVICE_ERROR [In],lpbinarypathname : PSTR [In],lploadordergroup : PSTR [In],lpdwtagid : UInt32* [In],lpdependencies : PSTR [In],lpservicestartname : PSTR [In],lppassword : PSTR [In]
  fun CreateServiceA(hscmanager : SC_HANDLE, lpservicename : PSTR, lpdisplayname : PSTR, dwdesiredaccess : UInt32, dwservicetype : ENUM_SERVICE_TYPE, dwstarttype : SERVICE_START_TYPE, dwerrorcontrol : SERVICE_ERROR, lpbinarypathname : PSTR, lploadordergroup : PSTR, lpdwtagid : UInt32*, lpdependencies : PSTR, lpservicestartname : PSTR, lppassword : PSTR) : SC_HANDLE

  # Params # hscmanager : SC_HANDLE [In],lpservicename : LibC::LPWSTR [In],lpdisplayname : LibC::LPWSTR [In],dwdesiredaccess : UInt32 [In],dwservicetype : ENUM_SERVICE_TYPE [In],dwstarttype : SERVICE_START_TYPE [In],dwerrorcontrol : SERVICE_ERROR [In],lpbinarypathname : LibC::LPWSTR [In],lploadordergroup : LibC::LPWSTR [In],lpdwtagid : UInt32* [In],lpdependencies : LibC::LPWSTR [In],lpservicestartname : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In]
  fun CreateServiceW(hscmanager : SC_HANDLE, lpservicename : LibC::LPWSTR, lpdisplayname : LibC::LPWSTR, dwdesiredaccess : UInt32, dwservicetype : ENUM_SERVICE_TYPE, dwstarttype : SERVICE_START_TYPE, dwerrorcontrol : SERVICE_ERROR, lpbinarypathname : LibC::LPWSTR, lploadordergroup : LibC::LPWSTR, lpdwtagid : UInt32*, lpdependencies : LibC::LPWSTR, lpservicestartname : LibC::LPWSTR, lppassword : LibC::LPWSTR) : SC_HANDLE

  # Params # hservice : SC_HANDLE [In]
  fun DeleteService(hservice : SC_HANDLE) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwservicestate : ENUM_SERVICE_STATE [In],lpservices : ENUM_SERVICE_STATUSA* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In],lpservicesreturned : UInt32* [In]
  fun EnumDependentServicesA(hservice : SC_HANDLE, dwservicestate : ENUM_SERVICE_STATE, lpservices : ENUM_SERVICE_STATUSA*, cbbufsize : UInt32, pcbbytesneeded : UInt32*, lpservicesreturned : UInt32*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwservicestate : ENUM_SERVICE_STATE [In],lpservices : ENUM_SERVICE_STATUSW* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In],lpservicesreturned : UInt32* [In]
  fun EnumDependentServicesW(hservice : SC_HANDLE, dwservicestate : ENUM_SERVICE_STATE, lpservices : ENUM_SERVICE_STATUSW*, cbbufsize : UInt32, pcbbytesneeded : UInt32*, lpservicesreturned : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],dwservicetype : ENUM_SERVICE_TYPE [In],dwservicestate : ENUM_SERVICE_STATE [In],lpservices : ENUM_SERVICE_STATUSA* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In],lpservicesreturned : UInt32* [In],lpresumehandle : UInt32* [In]
  fun EnumServicesStatusA(hscmanager : SC_HANDLE, dwservicetype : ENUM_SERVICE_TYPE, dwservicestate : ENUM_SERVICE_STATE, lpservices : ENUM_SERVICE_STATUSA*, cbbufsize : UInt32, pcbbytesneeded : UInt32*, lpservicesreturned : UInt32*, lpresumehandle : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],dwservicetype : ENUM_SERVICE_TYPE [In],dwservicestate : ENUM_SERVICE_STATE [In],lpservices : ENUM_SERVICE_STATUSW* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In],lpservicesreturned : UInt32* [In],lpresumehandle : UInt32* [In]
  fun EnumServicesStatusW(hscmanager : SC_HANDLE, dwservicetype : ENUM_SERVICE_TYPE, dwservicestate : ENUM_SERVICE_STATE, lpservices : ENUM_SERVICE_STATUSW*, cbbufsize : UInt32, pcbbytesneeded : UInt32*, lpservicesreturned : UInt32*, lpresumehandle : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],infolevel : SC_ENUM_TYPE [In],dwservicetype : ENUM_SERVICE_TYPE [In],dwservicestate : ENUM_SERVICE_STATE [In],lpservices : UInt8* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In],lpservicesreturned : UInt32* [In],lpresumehandle : UInt32* [In],pszgroupname : PSTR [In]
  fun EnumServicesStatusExA(hscmanager : SC_HANDLE, infolevel : SC_ENUM_TYPE, dwservicetype : ENUM_SERVICE_TYPE, dwservicestate : ENUM_SERVICE_STATE, lpservices : UInt8*, cbbufsize : UInt32, pcbbytesneeded : UInt32*, lpservicesreturned : UInt32*, lpresumehandle : UInt32*, pszgroupname : PSTR) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],infolevel : SC_ENUM_TYPE [In],dwservicetype : ENUM_SERVICE_TYPE [In],dwservicestate : ENUM_SERVICE_STATE [In],lpservices : UInt8* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In],lpservicesreturned : UInt32* [In],lpresumehandle : UInt32* [In],pszgroupname : LibC::LPWSTR [In]
  fun EnumServicesStatusExW(hscmanager : SC_HANDLE, infolevel : SC_ENUM_TYPE, dwservicetype : ENUM_SERVICE_TYPE, dwservicestate : ENUM_SERVICE_STATE, lpservices : UInt8*, cbbufsize : UInt32, pcbbytesneeded : UInt32*, lpservicesreturned : UInt32*, lpresumehandle : UInt32*, pszgroupname : LibC::LPWSTR) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lpdisplayname : PSTR [In],lpservicename : UInt8* [In],lpcchbuffer : UInt32* [In]
  fun GetServiceKeyNameA(hscmanager : SC_HANDLE, lpdisplayname : PSTR, lpservicename : UInt8*, lpcchbuffer : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lpdisplayname : LibC::LPWSTR [In],lpservicename : Char* [In],lpcchbuffer : UInt32* [In]
  fun GetServiceKeyNameW(hscmanager : SC_HANDLE, lpdisplayname : LibC::LPWSTR, lpservicename : Char*, lpcchbuffer : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lpservicename : PSTR [In],lpdisplayname : UInt8* [In],lpcchbuffer : UInt32* [In]
  fun GetServiceDisplayNameA(hscmanager : SC_HANDLE, lpservicename : PSTR, lpdisplayname : UInt8*, lpcchbuffer : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lpservicename : LibC::LPWSTR [In],lpdisplayname : Char* [In],lpcchbuffer : UInt32* [In]
  fun GetServiceDisplayNameW(hscmanager : SC_HANDLE, lpservicename : LibC::LPWSTR, lpdisplayname : Char*, lpcchbuffer : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In]
  fun LockServiceDatabase(hscmanager : SC_HANDLE) : Void*

  # Params # bootacceptable : LibC::BOOL [In]
  fun NotifyBootConfigStatus(bootacceptable : LibC::BOOL) : LibC::BOOL

  # Params # lpmachinename : PSTR [In],lpdatabasename : PSTR [In],dwdesiredaccess : UInt32 [In]
  fun OpenSCManagerA(lpmachinename : PSTR, lpdatabasename : PSTR, dwdesiredaccess : UInt32) : SC_HANDLE

  # Params # lpmachinename : LibC::LPWSTR [In],lpdatabasename : LibC::LPWSTR [In],dwdesiredaccess : UInt32 [In]
  fun OpenSCManagerW(lpmachinename : LibC::LPWSTR, lpdatabasename : LibC::LPWSTR, dwdesiredaccess : UInt32) : SC_HANDLE

  # Params # hscmanager : SC_HANDLE [In],lpservicename : PSTR [In],dwdesiredaccess : UInt32 [In]
  fun OpenServiceA(hscmanager : SC_HANDLE, lpservicename : PSTR, dwdesiredaccess : UInt32) : SC_HANDLE

  # Params # hscmanager : SC_HANDLE [In],lpservicename : LibC::LPWSTR [In],dwdesiredaccess : UInt32 [In]
  fun OpenServiceW(hscmanager : SC_HANDLE, lpservicename : LibC::LPWSTR, dwdesiredaccess : UInt32) : SC_HANDLE

  # Params # hservice : SC_HANDLE [In],lpserviceconfig : QUERY_SERVICE_CONFIGA* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceConfigA(hservice : SC_HANDLE, lpserviceconfig : QUERY_SERVICE_CONFIGA*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],lpserviceconfig : QUERY_SERVICE_CONFIGW* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceConfigW(hservice : SC_HANDLE, lpserviceconfig : QUERY_SERVICE_CONFIGW*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwinfolevel : SERVICE_CONFIG [In],lpbuffer : UInt8* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceConfig2A(hservice : SC_HANDLE, dwinfolevel : SERVICE_CONFIG, lpbuffer : UInt8*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwinfolevel : SERVICE_CONFIG [In],lpbuffer : UInt8* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceConfig2W(hservice : SC_HANDLE, dwinfolevel : SERVICE_CONFIG, lpbuffer : UInt8*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lplockstatus : QUERY_SERVICE_LOCK_STATUSA* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceLockStatusA(hscmanager : SC_HANDLE, lplockstatus : QUERY_SERVICE_LOCK_STATUSA*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hscmanager : SC_HANDLE [In],lplockstatus : QUERY_SERVICE_LOCK_STATUSW* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceLockStatusW(hscmanager : SC_HANDLE, lplockstatus : QUERY_SERVICE_LOCK_STATUSW*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwsecurityinformation : UInt32 [In],lpsecuritydescriptor : SECURITY_DESCRIPTOR* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceObjectSecurity(hservice : SC_HANDLE, dwsecurityinformation : UInt32, lpsecuritydescriptor : SECURITY_DESCRIPTOR*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],lpservicestatus : SERVICE_STATUS* [In]
  fun QueryServiceStatus(hservice : SC_HANDLE, lpservicestatus : SERVICE_STATUS*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],infolevel : SC_STATUS_TYPE [In],lpbuffer : UInt8* [In],cbbufsize : UInt32 [In],pcbbytesneeded : UInt32* [In]
  fun QueryServiceStatusEx(hservice : SC_HANDLE, infolevel : SC_STATUS_TYPE, lpbuffer : UInt8*, cbbufsize : UInt32, pcbbytesneeded : UInt32*) : LibC::BOOL

  # Params # lpservicename : PSTR [In],lphandlerproc : LPHANDLER_FUNCTION [In]
  fun RegisterServiceCtrlHandlerA(lpservicename : PSTR, lphandlerproc : LPHANDLER_FUNCTION) : SERVICE_STATUS_HANDLE

  # Params # lpservicename : LibC::LPWSTR [In],lphandlerproc : LPHANDLER_FUNCTION [In]
  fun RegisterServiceCtrlHandlerW(lpservicename : LibC::LPWSTR, lphandlerproc : LPHANDLER_FUNCTION) : SERVICE_STATUS_HANDLE

  # Params # lpservicename : PSTR [In],lphandlerproc : LPHANDLER_FUNCTION_EX [In],lpcontext : Void* [In]
  fun RegisterServiceCtrlHandlerExA(lpservicename : PSTR, lphandlerproc : LPHANDLER_FUNCTION_EX, lpcontext : Void*) : SERVICE_STATUS_HANDLE

  # Params # lpservicename : LibC::LPWSTR [In],lphandlerproc : LPHANDLER_FUNCTION_EX [In],lpcontext : Void* [In]
  fun RegisterServiceCtrlHandlerExW(lpservicename : LibC::LPWSTR, lphandlerproc : LPHANDLER_FUNCTION_EX, lpcontext : Void*) : SERVICE_STATUS_HANDLE

  # Params # hservice : SC_HANDLE [In],dwsecurityinformation : OBJECT_SECURITY_INFORMATION [In],lpsecuritydescriptor : SECURITY_DESCRIPTOR* [In]
  fun SetServiceObjectSecurity(hservice : SC_HANDLE, dwsecurityinformation : OBJECT_SECURITY_INFORMATION, lpsecuritydescriptor : SECURITY_DESCRIPTOR*) : LibC::BOOL

  # Params # hservicestatus : SERVICE_STATUS_HANDLE [In],lpservicestatus : SERVICE_STATUS* [In]
  fun SetServiceStatus(hservicestatus : SERVICE_STATUS_HANDLE, lpservicestatus : SERVICE_STATUS*) : LibC::BOOL

  # Params # lpservicestarttable : SERVICE_TABLE_ENTRYA* [In]
  fun StartServiceCtrlDispatcherA(lpservicestarttable : SERVICE_TABLE_ENTRYA*) : LibC::BOOL

  # Params # lpservicestarttable : SERVICE_TABLE_ENTRYW* [In]
  fun StartServiceCtrlDispatcherW(lpservicestarttable : SERVICE_TABLE_ENTRYW*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwnumserviceargs : UInt32 [In],lpserviceargvectors : PSTR* [In]
  fun StartServiceA(hservice : SC_HANDLE, dwnumserviceargs : UInt32, lpserviceargvectors : PSTR*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwnumserviceargs : UInt32 [In],lpserviceargvectors : LibC::LPWSTR* [In]
  fun StartServiceW(hservice : SC_HANDLE, dwnumserviceargs : UInt32, lpserviceargvectors : LibC::LPWSTR*) : LibC::BOOL

  # Params # sclock : Void* [In]
  fun UnlockServiceDatabase(sclock : Void*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwnotifymask : SERVICE_NOTIFY [In],pnotifybuffer : SERVICE_NOTIFY_2A* [In]
  fun NotifyServiceStatusChangeA(hservice : SC_HANDLE, dwnotifymask : SERVICE_NOTIFY, pnotifybuffer : SERVICE_NOTIFY_2A*) : UInt32

  # Params # hservice : SC_HANDLE [In],dwnotifymask : SERVICE_NOTIFY [In],pnotifybuffer : SERVICE_NOTIFY_2W* [In]
  fun NotifyServiceStatusChangeW(hservice : SC_HANDLE, dwnotifymask : SERVICE_NOTIFY, pnotifybuffer : SERVICE_NOTIFY_2W*) : UInt32

  # Params # hservice : SC_HANDLE [In],dwcontrol : UInt32 [In],dwinfolevel : UInt32 [In],pcontrolparams : Void* [In]
  fun ControlServiceExA(hservice : SC_HANDLE, dwcontrol : UInt32, dwinfolevel : UInt32, pcontrolparams : Void*) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwcontrol : UInt32 [In],dwinfolevel : UInt32 [In],pcontrolparams : Void* [In]
  fun ControlServiceExW(hservice : SC_HANDLE, dwcontrol : UInt32, dwinfolevel : UInt32, pcontrolparams : Void*) : LibC::BOOL

  # Params # hservicestatus : SERVICE_STATUS_HANDLE [In],dwinfolevel : UInt32 [In],ppdynamicinfo : Void** [In]
  fun QueryServiceDynamicInformation(hservicestatus : SERVICE_STATUS_HANDLE, dwinfolevel : UInt32, ppdynamicinfo : Void**) : LibC::BOOL

  # Params # hservice : SC_HANDLE [In],dwnotify : UInt32 [In],dwtimeout : UInt32 [In],hcancelevent : LibC::HANDLE [In]
  fun WaitServiceState(hservice : SC_HANDLE, dwnotify : UInt32, dwtimeout : UInt32, hcancelevent : LibC::HANDLE) : UInt32

  # Params # servicestatushandle : SERVICE_STATUS_HANDLE [In],statetype : SERVICE_REGISTRY_STATE_TYPE [In],accessmask : UInt32 [In],servicestatekey : HKEY* [In]
  fun GetServiceRegistryStateKey(servicestatushandle : SERVICE_STATUS_HANDLE, statetype : SERVICE_REGISTRY_STATE_TYPE, accessmask : UInt32, servicestatekey : HKEY*) : UInt32

  # Params # hservicestatus : SERVICE_STATUS_HANDLE [In],edirectorytype : SERVICE_DIRECTORY_TYPE [In],lppathbuffer : Char* [In],cchpathbufferlength : UInt32 [In],lpcchrequiredbufferlength : UInt32* [In]
  fun GetServiceDirectory(hservicestatus : SERVICE_STATUS_HANDLE, edirectorytype : SERVICE_DIRECTORY_TYPE, lppathbuffer : Char*, cchpathbufferlength : UInt32, lpcchrequiredbufferlength : UInt32*) : UInt32

  # Params # servicehandle : SC_HANDLE [In],statetype : SERVICE_SHARED_REGISTRY_STATE_TYPE [In],accessmask : UInt32 [In],servicestatekey : HKEY* [In]
  fun GetSharedServiceRegistryStateKey(servicehandle : SC_HANDLE, statetype : SERVICE_SHARED_REGISTRY_STATE_TYPE, accessmask : UInt32, servicestatekey : HKEY*) : UInt32

  # Params # servicehandle : SC_HANDLE [In],directorytype : SERVICE_SHARED_DIRECTORY_TYPE [In],pathbuffer : Char* [In],pathbufferlength : UInt32 [In],requiredbufferlength : UInt32* [In]
  fun GetSharedServiceDirectory(servicehandle : SC_HANDLE, directorytype : SERVICE_SHARED_DIRECTORY_TYPE, pathbuffer : Char*, pathbufferlength : UInt32, requiredbufferlength : UInt32*) : UInt32
end
