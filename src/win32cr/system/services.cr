require "./../foundation.cr"
require "./../security.cr"
require "./registry.cr"

module Win32cr::System::Services
  alias SERVICE_STATUS_HANDLE = LibC::IntPtrT
  alias SERVICE_MAIN_FUNCTIONW = Proc(UInt32, Win32cr::Foundation::PWSTR*, Void)

  alias SERVICE_MAIN_FUNCTIONA = Proc(UInt32, Int8**, Void)

  alias LPSERVICE_MAIN_FUNCTIONW = Proc(UInt32, Win32cr::Foundation::PWSTR*, Void)

  alias LPSERVICE_MAIN_FUNCTIONA = Proc(UInt32, Win32cr::Foundation::PSTR*, Void)

  alias HANDLER_FUNCTION = Proc(UInt32, Void)

  alias HANDLER_FUNCTION_EX = Proc(UInt32, UInt32, Void*, Void*, UInt32)

  alias LPHANDLER_FUNCTION = Proc(UInt32, Void)

  alias LPHANDLER_FUNCTION_EX = Proc(UInt32, UInt32, Void*, Void*, UInt32)

  alias PFN_SC_NOTIFY_CALLBACK = Proc(Void*, Void)

  alias PSC_NOTIFICATION_CALLBACK = Proc(UInt32, Void*, Void)

  SERVICE_ALL_ACCESS = 983551_u32
  SC_MANAGER_ALL_ACCESS = 983103_u32
  SERVICES_ACTIVE_DATABASEW = "ServicesActive"
  SERVICES_FAILED_DATABASEW = "ServicesFailed"
  SERVICES_ACTIVE_DATABASEA = "ServicesActive"
  SERVICES_FAILED_DATABASEA = "ServicesFailed"
  SERVICES_ACTIVE_DATABASE = "ServicesActive"
  SERVICES_FAILED_DATABASE = "ServicesFailed"
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
  SERVICE_TRIGGER_STARTED_ARGUMENT = "TriggerStarted"
  SC_AGGREGATE_STORAGE_KEY = "System\\CurrentControlSet\\Control\\ServiceAggregatedEvents"

  enum ENUM_SERVICE_STATE : UInt32
    SERVICE_ACTIVE = 1_u32
    SERVICE_INACTIVE = 2_u32
    SERVICE_STATE_ALL = 3_u32
  end
  enum SERVICE_ERROR : UInt32
    SERVICE_ERROR_CRITICAL = 3_u32
    SERVICE_ERROR_IGNORE = 0_u32
    SERVICE_ERROR_NORMAL = 1_u32
    SERVICE_ERROR_SEVERE = 2_u32
  end
  enum SERVICE_CONFIG : UInt32
    SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3_u32
    SERVICE_CONFIG_DESCRIPTION = 1_u32
    SERVICE_CONFIG_FAILURE_ACTIONS = 2_u32
    SERVICE_CONFIG_FAILURE_ACTIONS_FLAG = 4_u32
    SERVICE_CONFIG_PREFERRED_NODE = 9_u32
    SERVICE_CONFIG_PRESHUTDOWN_INFO = 7_u32
    SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 6_u32
    SERVICE_CONFIG_SERVICE_SID_INFO = 5_u32
    SERVICE_CONFIG_TRIGGER_INFO = 8_u32
    SERVICE_CONFIG_LAUNCH_PROTECTED = 12_u32
  end
  @[Flags]
  enum ENUM_SERVICE_TYPE : UInt32
    SERVICE_DRIVER = 11_u32
    SERVICE_KERNEL_DRIVER = 1_u32
    SERVICE_WIN32 = 48_u32
    SERVICE_WIN32_SHARE_PROCESS = 32_u32
    SERVICE_ADAPTER = 4_u32
    SERVICE_FILE_SYSTEM_DRIVER = 2_u32
    SERVICE_RECOGNIZER_DRIVER = 8_u32
    SERVICE_WIN32_OWN_PROCESS = 16_u32
    SERVICE_USER_OWN_PROCESS = 80_u32
    SERVICE_USER_SHARE_PROCESS = 96_u32
  end
  enum SERVICE_START_TYPE : UInt32
    SERVICE_AUTO_START = 2_u32
    SERVICE_BOOT_START = 0_u32
    SERVICE_DEMAND_START = 3_u32
    SERVICE_DISABLED = 4_u32
    SERVICE_SYSTEM_START = 1_u32
  end
  @[Flags]
  enum SERVICE_NOTIFY : UInt32
    SERVICE_NOTIFY_CREATED = 128_u32
    SERVICE_NOTIFY_CONTINUE_PENDING = 16_u32
    SERVICE_NOTIFY_DELETE_PENDING = 512_u32
    SERVICE_NOTIFY_DELETED = 256_u32
    SERVICE_NOTIFY_PAUSE_PENDING = 32_u32
    SERVICE_NOTIFY_PAUSED = 64_u32
    SERVICE_NOTIFY_RUNNING = 8_u32
    SERVICE_NOTIFY_START_PENDING = 2_u32
    SERVICE_NOTIFY_STOP_PENDING = 4_u32
    SERVICE_NOTIFY_STOPPED = 1_u32
  end
  enum SERVICE_RUNS_IN_PROCESS : UInt32
    SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING = 0_u32
    SERVICE_RUNS_IN_SYSTEM_PROCESS = 1_u32
  end
  enum SERVICE_TRIGGER_ACTION : UInt32
    SERVICE_TRIGGER_ACTION_SERVICE_START = 1_u32
    SERVICE_TRIGGER_ACTION_SERVICE_STOP = 2_u32
  end
  enum SERVICE_TRIGGER_TYPE : UInt32
    SERVICE_TRIGGER_TYPE_CUSTOM = 20_u32
    SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL = 1_u32
    SERVICE_TRIGGER_TYPE_DOMAIN_JOIN = 3_u32
    SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT = 4_u32
    SERVICE_TRIGGER_TYPE_GROUP_POLICY = 5_u32
    SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY = 2_u32
    SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT = 6_u32
  end
  enum SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE : UInt32
    SERVICE_TRIGGER_DATA_TYPE_BINARY = 1_u32
    SERVICE_TRIGGER_DATA_TYPE_STRING = 2_u32
    SERVICE_TRIGGER_DATA_TYPE_LEVEL = 3_u32
    SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY = 4_u32
    SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL = 5_u32
  end
  enum SERVICE_STATUS_CURRENT_STATE : UInt32
    SERVICE_CONTINUE_PENDING = 5_u32
    SERVICE_PAUSE_PENDING = 6_u32
    SERVICE_PAUSED = 7_u32
    SERVICE_RUNNING = 4_u32
    SERVICE_START_PENDING = 2_u32
    SERVICE_STOP_PENDING = 3_u32
    SERVICE_STOPPED = 1_u32
  end
  enum SC_ACTION_TYPE
    SC_ACTION_NONE = 0_i32
    SC_ACTION_RESTART = 1_i32
    SC_ACTION_REBOOT = 2_i32
    SC_ACTION_RUN_COMMAND = 3_i32
    SC_ACTION_OWN_RESTART = 4_i32
  end
  enum SC_STATUS_TYPE
    SC_STATUS_PROCESS_INFO = 0_i32
  end
  enum SC_ENUM_TYPE
    SC_ENUM_PROCESS_INFO = 0_i32
  end
  enum SC_EVENT_TYPE
    SC_EVENT_DATABASE_CHANGE = 0_i32
    SC_EVENT_PROPERTY_CHANGE = 1_i32
    SC_EVENT_STATUS_CHANGE = 2_i32
  end
  enum SERVICE_REGISTRY_STATE_TYPE
    ServiceRegistryStateParameters = 0_i32
    ServiceRegistryStatePersistent = 1_i32
    MaxServiceRegistryStateType = 2_i32
  end
  enum SERVICE_DIRECTORY_TYPE
    ServiceDirectoryPersistentState = 0_i32
    ServiceDirectoryTypeMax = 1_i32
  end
  enum SERVICE_SHARED_REGISTRY_STATE_TYPE
    ServiceSharedRegistryPersistentState = 0_i32
  end
  enum SERVICE_SHARED_DIRECTORY_TYPE
    ServiceSharedDirectoryPersistentState = 0_i32
  end

  @[Extern]
  struct SERVICE_TRIGGER_CUSTOM_STATE_ID
    property data : UInt32[2]
    def initialize(@data : UInt32[2])
    end
  end

  @[Extern]
  struct SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM
    property u : U_e__union_

    # Nested Type U_e__union_
    @[Extern(union: true)]
    struct U_e__union_
    property custom_state_id : Win32cr::System::Services::SERVICE_TRIGGER_CUSTOM_STATE_ID
    property s : S_e__struct_

      # Nested Type S_e__struct_
      @[Extern]
      struct S_e__struct_
    property data_offset : UInt32
    property data : UInt8*
    def initialize(@data_offset : UInt32, @data : UInt8*)
    end
      end

    def initialize(@custom_state_id : Win32cr::System::Services::SERVICE_TRIGGER_CUSTOM_STATE_ID, @s : S_e__struct_)
    end
    end

    def initialize(@u : U_e__union_)
    end
  end

  @[Extern]
  struct SERVICE_DESCRIPTIONA
    property lpDescription : Win32cr::Foundation::PSTR
    def initialize(@lpDescription : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SERVICE_DESCRIPTIONW
    property lpDescription : Win32cr::Foundation::PWSTR
    def initialize(@lpDescription : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SC_ACTION
    property type__ : Win32cr::System::Services::SC_ACTION_TYPE
    property delay : UInt32
    def initialize(@type__ : Win32cr::System::Services::SC_ACTION_TYPE, @delay : UInt32)
    end
  end

  @[Extern]
  struct SERVICE_FAILURE_ACTIONSA
    property dwResetPeriod : UInt32
    property lpRebootMsg : Win32cr::Foundation::PSTR
    property lpCommand : Win32cr::Foundation::PSTR
    property cActions : UInt32
    property lpsaActions : Win32cr::System::Services::SC_ACTION*
    def initialize(@dwResetPeriod : UInt32, @lpRebootMsg : Win32cr::Foundation::PSTR, @lpCommand : Win32cr::Foundation::PSTR, @cActions : UInt32, @lpsaActions : Win32cr::System::Services::SC_ACTION*)
    end
  end

  @[Extern]
  struct SERVICE_FAILURE_ACTIONSW
    property dwResetPeriod : UInt32
    property lpRebootMsg : Win32cr::Foundation::PWSTR
    property lpCommand : Win32cr::Foundation::PWSTR
    property cActions : UInt32
    property lpsaActions : Win32cr::System::Services::SC_ACTION*
    def initialize(@dwResetPeriod : UInt32, @lpRebootMsg : Win32cr::Foundation::PWSTR, @lpCommand : Win32cr::Foundation::PWSTR, @cActions : UInt32, @lpsaActions : Win32cr::System::Services::SC_ACTION*)
    end
  end

  @[Extern]
  struct SERVICE_DELAYED_AUTO_START_INFO
    property fDelayedAutostart : Win32cr::Foundation::BOOL
    def initialize(@fDelayedAutostart : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct SERVICE_FAILURE_ACTIONS_FLAG
    property fFailureActionsOnNonCrashFailures : Win32cr::Foundation::BOOL
    def initialize(@fFailureActionsOnNonCrashFailures : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct SERVICE_SID_INFO
    property dwServiceSidType : UInt32
    def initialize(@dwServiceSidType : UInt32)
    end
  end

  @[Extern]
  struct SERVICE_REQUIRED_PRIVILEGES_INFOA
    property pmszRequiredPrivileges : Win32cr::Foundation::PSTR
    def initialize(@pmszRequiredPrivileges : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SERVICE_REQUIRED_PRIVILEGES_INFOW
    property pmszRequiredPrivileges : Win32cr::Foundation::PWSTR
    def initialize(@pmszRequiredPrivileges : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SERVICE_PRESHUTDOWN_INFO
    property dwPreshutdownTimeout : UInt32
    def initialize(@dwPreshutdownTimeout : UInt32)
    end
  end

  @[Extern]
  struct SERVICE_TRIGGER_SPECIFIC_DATA_ITEM
    property dwDataType : Win32cr::System::Services::SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE
    property cbData : UInt32
    property pData : UInt8*
    def initialize(@dwDataType : Win32cr::System::Services::SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE, @cbData : UInt32, @pData : UInt8*)
    end
  end

  @[Extern]
  struct SERVICE_TRIGGER
    property dwTriggerType : Win32cr::System::Services::SERVICE_TRIGGER_TYPE
    property dwAction : Win32cr::System::Services::SERVICE_TRIGGER_ACTION
    property pTriggerSubtype : LibC::GUID*
    property cDataItems : UInt32
    property pDataItems : Win32cr::System::Services::SERVICE_TRIGGER_SPECIFIC_DATA_ITEM*
    def initialize(@dwTriggerType : Win32cr::System::Services::SERVICE_TRIGGER_TYPE, @dwAction : Win32cr::System::Services::SERVICE_TRIGGER_ACTION, @pTriggerSubtype : LibC::GUID*, @cDataItems : UInt32, @pDataItems : Win32cr::System::Services::SERVICE_TRIGGER_SPECIFIC_DATA_ITEM*)
    end
  end

  @[Extern]
  struct SERVICE_TRIGGER_INFO
    property cTriggers : UInt32
    property pTriggers : Win32cr::System::Services::SERVICE_TRIGGER*
    property pReserved : UInt8*
    def initialize(@cTriggers : UInt32, @pTriggers : Win32cr::System::Services::SERVICE_TRIGGER*, @pReserved : UInt8*)
    end
  end

  @[Extern]
  struct SERVICE_PREFERRED_NODE_INFO
    property usPreferredNode : UInt16
    property fDelete : Win32cr::Foundation::BOOLEAN
    def initialize(@usPreferredNode : UInt16, @fDelete : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SERVICE_TIMECHANGE_INFO
    property liNewTime : Win32cr::Foundation::LARGE_INTEGER
    property liOldTime : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@liNewTime : Win32cr::Foundation::LARGE_INTEGER, @liOldTime : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct SERVICE_LAUNCH_PROTECTED_INFO
    property dwLaunchProtected : UInt32
    def initialize(@dwLaunchProtected : UInt32)
    end
  end

  @[Extern]
  struct SERVICE_STATUS
    property dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE
    property dwCurrentState : Win32cr::System::Services::SERVICE_STATUS_CURRENT_STATE
    property dwControlsAccepted : UInt32
    property dwWin32ExitCode : UInt32
    property dwServiceSpecificExitCode : UInt32
    property dwCheckPoint : UInt32
    property dwWaitHint : UInt32
    def initialize(@dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, @dwCurrentState : Win32cr::System::Services::SERVICE_STATUS_CURRENT_STATE, @dwControlsAccepted : UInt32, @dwWin32ExitCode : UInt32, @dwServiceSpecificExitCode : UInt32, @dwCheckPoint : UInt32, @dwWaitHint : UInt32)
    end
  end

  @[Extern]
  struct SERVICE_STATUS_PROCESS
    property dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE
    property dwCurrentState : Win32cr::System::Services::SERVICE_STATUS_CURRENT_STATE
    property dwControlsAccepted : UInt32
    property dwWin32ExitCode : UInt32
    property dwServiceSpecificExitCode : UInt32
    property dwCheckPoint : UInt32
    property dwWaitHint : UInt32
    property dwProcessId : UInt32
    property dwServiceFlags : Win32cr::System::Services::SERVICE_RUNS_IN_PROCESS
    def initialize(@dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, @dwCurrentState : Win32cr::System::Services::SERVICE_STATUS_CURRENT_STATE, @dwControlsAccepted : UInt32, @dwWin32ExitCode : UInt32, @dwServiceSpecificExitCode : UInt32, @dwCheckPoint : UInt32, @dwWaitHint : UInt32, @dwProcessId : UInt32, @dwServiceFlags : Win32cr::System::Services::SERVICE_RUNS_IN_PROCESS)
    end
  end

  @[Extern]
  struct ENUM_SERVICE_STATUSA
    property lpServiceName : Win32cr::Foundation::PSTR
    property lpDisplayName : Win32cr::Foundation::PSTR
    property service_status : Win32cr::System::Services::SERVICE_STATUS
    def initialize(@lpServiceName : Win32cr::Foundation::PSTR, @lpDisplayName : Win32cr::Foundation::PSTR, @service_status : Win32cr::System::Services::SERVICE_STATUS)
    end
  end

  @[Extern]
  struct ENUM_SERVICE_STATUSW
    property lpServiceName : Win32cr::Foundation::PWSTR
    property lpDisplayName : Win32cr::Foundation::PWSTR
    property service_status : Win32cr::System::Services::SERVICE_STATUS
    def initialize(@lpServiceName : Win32cr::Foundation::PWSTR, @lpDisplayName : Win32cr::Foundation::PWSTR, @service_status : Win32cr::System::Services::SERVICE_STATUS)
    end
  end

  @[Extern]
  struct ENUM_SERVICE_STATUS_PROCESSA
    property lpServiceName : Win32cr::Foundation::PSTR
    property lpDisplayName : Win32cr::Foundation::PSTR
    property service_status_process : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    def initialize(@lpServiceName : Win32cr::Foundation::PSTR, @lpDisplayName : Win32cr::Foundation::PSTR, @service_status_process : Win32cr::System::Services::SERVICE_STATUS_PROCESS)
    end
  end

  @[Extern]
  struct ENUM_SERVICE_STATUS_PROCESSW
    property lpServiceName : Win32cr::Foundation::PWSTR
    property lpDisplayName : Win32cr::Foundation::PWSTR
    property service_status_process : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    def initialize(@lpServiceName : Win32cr::Foundation::PWSTR, @lpDisplayName : Win32cr::Foundation::PWSTR, @service_status_process : Win32cr::System::Services::SERVICE_STATUS_PROCESS)
    end
  end

  @[Extern]
  struct QUERY_SERVICE_LOCK_STATUSA
    property fIsLocked : UInt32
    property lpLockOwner : Win32cr::Foundation::PSTR
    property dwLockDuration : UInt32
    def initialize(@fIsLocked : UInt32, @lpLockOwner : Win32cr::Foundation::PSTR, @dwLockDuration : UInt32)
    end
  end

  @[Extern]
  struct QUERY_SERVICE_LOCK_STATUSW
    property fIsLocked : UInt32
    property lpLockOwner : Win32cr::Foundation::PWSTR
    property dwLockDuration : UInt32
    def initialize(@fIsLocked : UInt32, @lpLockOwner : Win32cr::Foundation::PWSTR, @dwLockDuration : UInt32)
    end
  end

  @[Extern]
  struct QUERY_SERVICE_CONFIGA
    property dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE
    property dwStartType : Win32cr::System::Services::SERVICE_START_TYPE
    property dwErrorControl : Win32cr::System::Services::SERVICE_ERROR
    property lpBinaryPathName : Win32cr::Foundation::PSTR
    property lpLoadOrderGroup : Win32cr::Foundation::PSTR
    property dwTagId : UInt32
    property lpDependencies : Win32cr::Foundation::PSTR
    property lpServiceStartName : Win32cr::Foundation::PSTR
    property lpDisplayName : Win32cr::Foundation::PSTR
    def initialize(@dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, @dwStartType : Win32cr::System::Services::SERVICE_START_TYPE, @dwErrorControl : Win32cr::System::Services::SERVICE_ERROR, @lpBinaryPathName : Win32cr::Foundation::PSTR, @lpLoadOrderGroup : Win32cr::Foundation::PSTR, @dwTagId : UInt32, @lpDependencies : Win32cr::Foundation::PSTR, @lpServiceStartName : Win32cr::Foundation::PSTR, @lpDisplayName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct QUERY_SERVICE_CONFIGW
    property dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE
    property dwStartType : Win32cr::System::Services::SERVICE_START_TYPE
    property dwErrorControl : Win32cr::System::Services::SERVICE_ERROR
    property lpBinaryPathName : Win32cr::Foundation::PWSTR
    property lpLoadOrderGroup : Win32cr::Foundation::PWSTR
    property dwTagId : UInt32
    property lpDependencies : Win32cr::Foundation::PWSTR
    property lpServiceStartName : Win32cr::Foundation::PWSTR
    property lpDisplayName : Win32cr::Foundation::PWSTR
    def initialize(@dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, @dwStartType : Win32cr::System::Services::SERVICE_START_TYPE, @dwErrorControl : Win32cr::System::Services::SERVICE_ERROR, @lpBinaryPathName : Win32cr::Foundation::PWSTR, @lpLoadOrderGroup : Win32cr::Foundation::PWSTR, @dwTagId : UInt32, @lpDependencies : Win32cr::Foundation::PWSTR, @lpServiceStartName : Win32cr::Foundation::PWSTR, @lpDisplayName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SERVICE_TABLE_ENTRYA
    property lpServiceName : Win32cr::Foundation::PSTR
    property lpServiceProc : Win32cr::System::Services::LPSERVICE_MAIN_FUNCTIONA
    def initialize(@lpServiceName : Win32cr::Foundation::PSTR, @lpServiceProc : Win32cr::System::Services::LPSERVICE_MAIN_FUNCTIONA)
    end
  end

  @[Extern]
  struct SERVICE_TABLE_ENTRYW
    property lpServiceName : Win32cr::Foundation::PWSTR
    property lpServiceProc : Win32cr::System::Services::LPSERVICE_MAIN_FUNCTIONW
    def initialize(@lpServiceName : Win32cr::Foundation::PWSTR, @lpServiceProc : Win32cr::System::Services::LPSERVICE_MAIN_FUNCTIONW)
    end
  end

  @[Extern]
  struct SERVICE_NOTIFY_1
    property dwVersion : UInt32
    property pfnNotifyCallback : Win32cr::System::Services::PFN_SC_NOTIFY_CALLBACK
    property pContext : Void*
    property dwNotificationStatus : UInt32
    property service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    def initialize(@dwVersion : UInt32, @pfnNotifyCallback : Win32cr::System::Services::PFN_SC_NOTIFY_CALLBACK, @pContext : Void*, @dwNotificationStatus : UInt32, @service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS)
    end
  end

  @[Extern]
  struct SERVICE_NOTIFY_2A
    property dwVersion : UInt32
    property pfnNotifyCallback : Win32cr::System::Services::PFN_SC_NOTIFY_CALLBACK
    property pContext : Void*
    property dwNotificationStatus : UInt32
    property service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    property dwNotificationTriggered : UInt32
    property pszServiceNames : Win32cr::Foundation::PSTR
    def initialize(@dwVersion : UInt32, @pfnNotifyCallback : Win32cr::System::Services::PFN_SC_NOTIFY_CALLBACK, @pContext : Void*, @dwNotificationStatus : UInt32, @service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS, @dwNotificationTriggered : UInt32, @pszServiceNames : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SERVICE_NOTIFY_2W
    property dwVersion : UInt32
    property pfnNotifyCallback : Win32cr::System::Services::PFN_SC_NOTIFY_CALLBACK
    property pContext : Void*
    property dwNotificationStatus : UInt32
    property service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    property dwNotificationTriggered : UInt32
    property pszServiceNames : Win32cr::Foundation::PWSTR
    def initialize(@dwVersion : UInt32, @pfnNotifyCallback : Win32cr::System::Services::PFN_SC_NOTIFY_CALLBACK, @pContext : Void*, @dwNotificationStatus : UInt32, @service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS, @dwNotificationTriggered : UInt32, @pszServiceNames : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SERVICE_CONTROL_STATUS_REASON_PARAMSA
    property dwReason : UInt32
    property pszComment : Win32cr::Foundation::PSTR
    property service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    def initialize(@dwReason : UInt32, @pszComment : Win32cr::Foundation::PSTR, @service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS)
    end
  end

  @[Extern]
  struct SERVICE_CONTROL_STATUS_REASON_PARAMSW
    property dwReason : UInt32
    property pszComment : Win32cr::Foundation::PWSTR
    property service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS
    def initialize(@dwReason : UInt32, @pszComment : Win32cr::Foundation::PWSTR, @service_status : Win32cr::System::Services::SERVICE_STATUS_PROCESS)
    end
  end

  @[Extern]
  struct SERVICE_START_REASON
    property dwReason : UInt32
    def initialize(@dwReason : UInt32)
    end
  end

  @[Extern]
  struct SC_NOTIFICATION_REGISTRATION_
    def initialize()
    end
  end

  @[Link("advapi32")]
  lib C
    fun SetServiceBits(hServiceStatus : Win32cr::System::Services::SERVICE_STATUS_HANDLE, dwServiceBits : UInt32, bSetBitsOn : Win32cr::Foundation::BOOL, bUpdateImmediately : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun ChangeServiceConfigA(hService : Win32cr::Security::SC_HANDLE, dwServiceType : UInt32, dwStartType : Win32cr::System::Services::SERVICE_START_TYPE, dwErrorControl : Win32cr::System::Services::SERVICE_ERROR, lpBinaryPathName : Win32cr::Foundation::PSTR, lpLoadOrderGroup : Win32cr::Foundation::PSTR, lpdwTagId : UInt32*, lpDependencies : Win32cr::Foundation::PSTR, lpServiceStartName : Win32cr::Foundation::PSTR, lpPassword : Win32cr::Foundation::PSTR, lpDisplayName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun ChangeServiceConfigW(hService : Win32cr::Security::SC_HANDLE, dwServiceType : UInt32, dwStartType : Win32cr::System::Services::SERVICE_START_TYPE, dwErrorControl : Win32cr::System::Services::SERVICE_ERROR, lpBinaryPathName : Win32cr::Foundation::PWSTR, lpLoadOrderGroup : Win32cr::Foundation::PWSTR, lpdwTagId : UInt32*, lpDependencies : Win32cr::Foundation::PWSTR, lpServiceStartName : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR, lpDisplayName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun ChangeServiceConfig2A(hService : Win32cr::Security::SC_HANDLE, dwInfoLevel : Win32cr::System::Services::SERVICE_CONFIG, lpInfo : Void*) : Win32cr::Foundation::BOOL

    fun ChangeServiceConfig2W(hService : Win32cr::Security::SC_HANDLE, dwInfoLevel : Win32cr::System::Services::SERVICE_CONFIG, lpInfo : Void*) : Win32cr::Foundation::BOOL

    fun CloseServiceHandle(hSCObject : Win32cr::Security::SC_HANDLE) : Win32cr::Foundation::BOOL

    fun ControlService(hService : Win32cr::Security::SC_HANDLE, dwControl : UInt32, lpServiceStatus : Win32cr::System::Services::SERVICE_STATUS*) : Win32cr::Foundation::BOOL

    fun CreateServiceA(hSCManager : Win32cr::Security::SC_HANDLE, lpServiceName : Win32cr::Foundation::PSTR, lpDisplayName : Win32cr::Foundation::PSTR, dwDesiredAccess : UInt32, dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, dwStartType : Win32cr::System::Services::SERVICE_START_TYPE, dwErrorControl : Win32cr::System::Services::SERVICE_ERROR, lpBinaryPathName : Win32cr::Foundation::PSTR, lpLoadOrderGroup : Win32cr::Foundation::PSTR, lpdwTagId : UInt32*, lpDependencies : Win32cr::Foundation::PSTR, lpServiceStartName : Win32cr::Foundation::PSTR, lpPassword : Win32cr::Foundation::PSTR) : Win32cr::Security::SC_HANDLE

    fun CreateServiceW(hSCManager : Win32cr::Security::SC_HANDLE, lpServiceName : Win32cr::Foundation::PWSTR, lpDisplayName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32, dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, dwStartType : Win32cr::System::Services::SERVICE_START_TYPE, dwErrorControl : Win32cr::System::Services::SERVICE_ERROR, lpBinaryPathName : Win32cr::Foundation::PWSTR, lpLoadOrderGroup : Win32cr::Foundation::PWSTR, lpdwTagId : UInt32*, lpDependencies : Win32cr::Foundation::PWSTR, lpServiceStartName : Win32cr::Foundation::PWSTR, lpPassword : Win32cr::Foundation::PWSTR) : Win32cr::Security::SC_HANDLE

    fun DeleteService(hService : Win32cr::Security::SC_HANDLE) : Win32cr::Foundation::BOOL

    fun EnumDependentServicesA(hService : Win32cr::Security::SC_HANDLE, dwServiceState : Win32cr::System::Services::ENUM_SERVICE_STATE, lpServices : Win32cr::System::Services::ENUM_SERVICE_STATUSA*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*, lpServicesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun EnumDependentServicesW(hService : Win32cr::Security::SC_HANDLE, dwServiceState : Win32cr::System::Services::ENUM_SERVICE_STATE, lpServices : Win32cr::System::Services::ENUM_SERVICE_STATUSW*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*, lpServicesReturned : UInt32*) : Win32cr::Foundation::BOOL

    fun EnumServicesStatusA(hSCManager : Win32cr::Security::SC_HANDLE, dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, dwServiceState : Win32cr::System::Services::ENUM_SERVICE_STATE, lpServices : Win32cr::System::Services::ENUM_SERVICE_STATUSA*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*, lpServicesReturned : UInt32*, lpResumeHandle : UInt32*) : Win32cr::Foundation::BOOL

    fun EnumServicesStatusW(hSCManager : Win32cr::Security::SC_HANDLE, dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, dwServiceState : Win32cr::System::Services::ENUM_SERVICE_STATE, lpServices : Win32cr::System::Services::ENUM_SERVICE_STATUSW*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*, lpServicesReturned : UInt32*, lpResumeHandle : UInt32*) : Win32cr::Foundation::BOOL

    fun EnumServicesStatusExA(hSCManager : Win32cr::Security::SC_HANDLE, info_level : Win32cr::System::Services::SC_ENUM_TYPE, dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, dwServiceState : Win32cr::System::Services::ENUM_SERVICE_STATE, lpServices : UInt8*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*, lpServicesReturned : UInt32*, lpResumeHandle : UInt32*, pszGroupName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun EnumServicesStatusExW(hSCManager : Win32cr::Security::SC_HANDLE, info_level : Win32cr::System::Services::SC_ENUM_TYPE, dwServiceType : Win32cr::System::Services::ENUM_SERVICE_TYPE, dwServiceState : Win32cr::System::Services::ENUM_SERVICE_STATE, lpServices : UInt8*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*, lpServicesReturned : UInt32*, lpResumeHandle : UInt32*, pszGroupName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun GetServiceKeyNameA(hSCManager : Win32cr::Security::SC_HANDLE, lpDisplayName : Win32cr::Foundation::PSTR, lpServiceName : UInt8*, lpcchBuffer : UInt32*) : Win32cr::Foundation::BOOL

    fun GetServiceKeyNameW(hSCManager : Win32cr::Security::SC_HANDLE, lpDisplayName : Win32cr::Foundation::PWSTR, lpServiceName : UInt16*, lpcchBuffer : UInt32*) : Win32cr::Foundation::BOOL

    fun GetServiceDisplayNameA(hSCManager : Win32cr::Security::SC_HANDLE, lpServiceName : Win32cr::Foundation::PSTR, lpDisplayName : UInt8*, lpcchBuffer : UInt32*) : Win32cr::Foundation::BOOL

    fun GetServiceDisplayNameW(hSCManager : Win32cr::Security::SC_HANDLE, lpServiceName : Win32cr::Foundation::PWSTR, lpDisplayName : UInt16*, lpcchBuffer : UInt32*) : Win32cr::Foundation::BOOL

    fun LockServiceDatabase(hSCManager : Win32cr::Security::SC_HANDLE) : Void*

    fun NotifyBootConfigStatus(boot_acceptable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun OpenSCManagerA(lpMachineName : Win32cr::Foundation::PSTR, lpDatabaseName : Win32cr::Foundation::PSTR, dwDesiredAccess : UInt32) : Win32cr::Security::SC_HANDLE

    fun OpenSCManagerW(lpMachineName : Win32cr::Foundation::PWSTR, lpDatabaseName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32) : Win32cr::Security::SC_HANDLE

    fun OpenServiceA(hSCManager : Win32cr::Security::SC_HANDLE, lpServiceName : Win32cr::Foundation::PSTR, dwDesiredAccess : UInt32) : Win32cr::Security::SC_HANDLE

    fun OpenServiceW(hSCManager : Win32cr::Security::SC_HANDLE, lpServiceName : Win32cr::Foundation::PWSTR, dwDesiredAccess : UInt32) : Win32cr::Security::SC_HANDLE

    fun QueryServiceConfigA(hService : Win32cr::Security::SC_HANDLE, lpServiceConfig : Win32cr::System::Services::QUERY_SERVICE_CONFIGA*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceConfigW(hService : Win32cr::Security::SC_HANDLE, lpServiceConfig : Win32cr::System::Services::QUERY_SERVICE_CONFIGW*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceConfig2A(hService : Win32cr::Security::SC_HANDLE, dwInfoLevel : Win32cr::System::Services::SERVICE_CONFIG, lpBuffer : UInt8*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceConfig2W(hService : Win32cr::Security::SC_HANDLE, dwInfoLevel : Win32cr::System::Services::SERVICE_CONFIG, lpBuffer : UInt8*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceLockStatusA(hSCManager : Win32cr::Security::SC_HANDLE, lpLockStatus : Win32cr::System::Services::QUERY_SERVICE_LOCK_STATUSA*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceLockStatusW(hSCManager : Win32cr::Security::SC_HANDLE, lpLockStatus : Win32cr::System::Services::QUERY_SERVICE_LOCK_STATUSW*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceObjectSecurity(hService : Win32cr::Security::SC_HANDLE, dwSecurityInformation : UInt32, lpSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun QueryServiceStatus(hService : Win32cr::Security::SC_HANDLE, lpServiceStatus : Win32cr::System::Services::SERVICE_STATUS*) : Win32cr::Foundation::BOOL

    fun QueryServiceStatusEx(hService : Win32cr::Security::SC_HANDLE, info_level : Win32cr::System::Services::SC_STATUS_TYPE, lpBuffer : UInt8*, cbBufSize : UInt32, pcbBytesNeeded : UInt32*) : Win32cr::Foundation::BOOL

    fun RegisterServiceCtrlHandlerA(lpServiceName : Win32cr::Foundation::PSTR, lpHandlerProc : Win32cr::System::Services::LPHANDLER_FUNCTION) : Win32cr::System::Services::SERVICE_STATUS_HANDLE

    fun RegisterServiceCtrlHandlerW(lpServiceName : Win32cr::Foundation::PWSTR, lpHandlerProc : Win32cr::System::Services::LPHANDLER_FUNCTION) : Win32cr::System::Services::SERVICE_STATUS_HANDLE

    fun RegisterServiceCtrlHandlerExA(lpServiceName : Win32cr::Foundation::PSTR, lpHandlerProc : Win32cr::System::Services::LPHANDLER_FUNCTION_EX, lpContext : Void*) : Win32cr::System::Services::SERVICE_STATUS_HANDLE

    fun RegisterServiceCtrlHandlerExW(lpServiceName : Win32cr::Foundation::PWSTR, lpHandlerProc : Win32cr::System::Services::LPHANDLER_FUNCTION_EX, lpContext : Void*) : Win32cr::System::Services::SERVICE_STATUS_HANDLE

    fun SetServiceObjectSecurity(hService : Win32cr::Security::SC_HANDLE, dwSecurityInformation : Win32cr::Security::OBJECT_SECURITY_INFORMATION, lpSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOL

    fun SetServiceStatus(hServiceStatus : Win32cr::System::Services::SERVICE_STATUS_HANDLE, lpServiceStatus : Win32cr::System::Services::SERVICE_STATUS*) : Win32cr::Foundation::BOOL

    fun StartServiceCtrlDispatcherA(lpServiceStartTable : Win32cr::System::Services::SERVICE_TABLE_ENTRYA*) : Win32cr::Foundation::BOOL

    fun StartServiceCtrlDispatcherW(lpServiceStartTable : Win32cr::System::Services::SERVICE_TABLE_ENTRYW*) : Win32cr::Foundation::BOOL

    fun StartServiceA(hService : Win32cr::Security::SC_HANDLE, dwNumServiceArgs : UInt32, lpServiceArgVectors : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOL

    fun StartServiceW(hService : Win32cr::Security::SC_HANDLE, dwNumServiceArgs : UInt32, lpServiceArgVectors : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::BOOL

    fun UnlockServiceDatabase(sc_lock : Void*) : Win32cr::Foundation::BOOL

    fun NotifyServiceStatusChangeA(hService : Win32cr::Security::SC_HANDLE, dwNotifyMask : Win32cr::System::Services::SERVICE_NOTIFY, pNotifyBuffer : Win32cr::System::Services::SERVICE_NOTIFY_2A*) : UInt32

    fun NotifyServiceStatusChangeW(hService : Win32cr::Security::SC_HANDLE, dwNotifyMask : Win32cr::System::Services::SERVICE_NOTIFY, pNotifyBuffer : Win32cr::System::Services::SERVICE_NOTIFY_2W*) : UInt32

    fun ControlServiceExA(hService : Win32cr::Security::SC_HANDLE, dwControl : UInt32, dwInfoLevel : UInt32, pControlParams : Void*) : Win32cr::Foundation::BOOL

    fun ControlServiceExW(hService : Win32cr::Security::SC_HANDLE, dwControl : UInt32, dwInfoLevel : UInt32, pControlParams : Void*) : Win32cr::Foundation::BOOL

    fun QueryServiceDynamicInformation(hServiceStatus : Win32cr::System::Services::SERVICE_STATUS_HANDLE, dwInfoLevel : UInt32, ppDynamicInfo : Void**) : Win32cr::Foundation::BOOL

    fun WaitServiceState(hService : Win32cr::Security::SC_HANDLE, dwNotify : UInt32, dwTimeout : UInt32, hCancelEvent : Win32cr::Foundation::HANDLE) : UInt32

    fun GetServiceRegistryStateKey(service_status_handle : Win32cr::System::Services::SERVICE_STATUS_HANDLE, state_type : Win32cr::System::Services::SERVICE_REGISTRY_STATE_TYPE, access_mask : UInt32, service_state_key : Win32cr::System::Registry::HKEY*) : UInt32

    fun GetServiceDirectory(hServiceStatus : Win32cr::System::Services::SERVICE_STATUS_HANDLE, eDirectoryType : Win32cr::System::Services::SERVICE_DIRECTORY_TYPE, lpPathBuffer : UInt16*, cchPathBufferLength : UInt32, lpcchRequiredBufferLength : UInt32*) : UInt32

    fun GetSharedServiceRegistryStateKey(service_handle : Win32cr::Security::SC_HANDLE, state_type : Win32cr::System::Services::SERVICE_SHARED_REGISTRY_STATE_TYPE, access_mask : UInt32, service_state_key : Win32cr::System::Registry::HKEY*) : UInt32

    fun GetSharedServiceDirectory(service_handle : Win32cr::Security::SC_HANDLE, directory_type : Win32cr::System::Services::SERVICE_SHARED_DIRECTORY_TYPE, path_buffer : UInt16*, path_buffer_length : UInt32, required_buffer_length : UInt32*) : UInt32

  end
end