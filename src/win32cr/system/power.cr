require "../foundation.cr"
require "../system/registry.cr"
require "../system/threading.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:powrprof.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("powrprof")]
@[Link("user32")]
{% end %}
lib LibWin32
  alias HPOWERNOTIFY = LibC::IntPtrT

  PROCESSOR_NUMBER_PKEY = PROPERTYKEY.new(LibC::GUID.new(0x5724c81d_u32, 0xd5af_u16, 0x4c1f_u16, StaticArray[0xa1_u8, 0x3_u8, 0xa0_u8, 0x6e_u8, 0x28_u8, 0xf2_u8, 0x4_u8, 0xc6_u8]), 1_u32)
  GUID_DEVICE_BATTERY = "72631e54-78a4-11d0-bcf7-00aa00b7b32a"
  GUID_DEVICE_APPLICATIONLAUNCH_BUTTON = "629758ee-986e-4d9e-8e47-de27f8ab054d"
  GUID_DEVICE_SYS_BUTTON = "4afa3d53-74a7-11d0-be5e-00a0c9062857"
  GUID_DEVICE_LID = "4afa3d52-74a7-11d0-be5e-00a0c9062857"
  GUID_DEVICE_THERMAL_ZONE = "4afa3d51-74a7-11d0-be5e-00a0c9062857"
  GUID_DEVICE_FAN = "05ecd13d-81da-4a2a-8a4c-524f23dd4dc9"
  GUID_DEVICE_PROCESSOR = "97fadb10-4e33-40ae-359c-8bef029dbdd0"
  GUID_DEVICE_MEMORY = "3fd0f03d-92e0-45fb-b75c-5ed8ffb01021"
  GUID_DEVICE_ACPI_TIME = "97f99bf6-4497-4f18-bb22-4b9fb2fbef9c"
  GUID_DEVICE_MESSAGE_INDICATOR = "cd48a365-fa94-4ce2-a232-a1b764e5d8b4"
  GUID_CLASS_INPUT = "4d1e55b2-f16f-11cf-88cb-001111000030"
  GUID_DEVINTERFACE_THERMAL_COOLING = "dbe4373d-3c81-40cb-ace4-e0e5d05f0c9f"
  GUID_DEVINTERFACE_THERMAL_MANAGER = "927ec093-69a4-4bc0-bd02-711664714463"
  BATTERY_UNKNOWN_CAPACITY = 4294967295_u32
  UNKNOWN_CAPACITY = 4294967295_u32
  BATTERY_SYSTEM_BATTERY = 2147483648_u32
  BATTERY_CAPACITY_RELATIVE = 1073741824_u32
  BATTERY_IS_SHORT_TERM = 536870912_u32
  BATTERY_SEALED = 268435456_u32
  BATTERY_SET_CHARGE_SUPPORTED = 1_u32
  BATTERY_SET_DISCHARGE_SUPPORTED = 2_u32
  BATTERY_SET_CHARGINGSOURCE_SUPPORTED = 4_u32
  BATTERY_SET_CHARGER_ID_SUPPORTED = 8_u32
  BATTERY_UNKNOWN_TIME = 4294967295_u32
  BATTERY_UNKNOWN_CURRENT = 4294967295_u32
  UNKNOWN_CURRENT = 4294967295_u32
  BATTERY_USB_CHARGER_STATUS_FN_DEFAULT_USB = 1_u32
  BATTERY_USB_CHARGER_STATUS_UCM_PD = 2_u32
  BATTERY_UNKNOWN_VOLTAGE = 4294967295_u32
  BATTERY_UNKNOWN_RATE = 2147483648_u32
  UNKNOWN_RATE = 2147483648_u32
  UNKNOWN_VOLTAGE = 4294967295_u32
  BATTERY_POWER_ON_LINE = 1_u32
  BATTERY_DISCHARGING = 2_u32
  BATTERY_CHARGING = 4_u32
  BATTERY_CRITICAL = 8_u32
  MAX_BATTERY_STRING_SIZE = 128_u32
  IOCTL_BATTERY_QUERY_TAG = 2703424_u32
  IOCTL_BATTERY_QUERY_INFORMATION = 2703428_u32
  IOCTL_BATTERY_SET_INFORMATION = 2719816_u32
  IOCTL_BATTERY_QUERY_STATUS = 2703436_u32
  IOCTL_BATTERY_CHARGING_SOURCE_CHANGE = 2703440_u32
  BATTERY_TAG_INVALID = 0_u32
  MAX_ACTIVE_COOLING_LEVELS = 10_u32
  ACTIVE_COOLING = 0_u32
  PASSIVE_COOLING = 1_u32
  TZ_ACTIVATION_REASON_THERMAL = 1_u32
  TZ_ACTIVATION_REASON_CURRENT = 2_u32
  THERMAL_POLICY_VERSION_1 = 1_u32
  THERMAL_POLICY_VERSION_2 = 2_u32
  IOCTL_THERMAL_QUERY_INFORMATION = 2703488_u32
  IOCTL_THERMAL_SET_COOLING_POLICY = 2719876_u32
  IOCTL_RUN_ACTIVE_COOLING_METHOD = 2719880_u32
  IOCTL_THERMAL_SET_PASSIVE_LIMIT = 2719884_u32
  IOCTL_THERMAL_READ_TEMPERATURE = 2703504_u32
  IOCTL_THERMAL_READ_POLICY = 2703508_u32
  IOCTL_QUERY_LID = 2703552_u32
  IOCTL_NOTIFY_SWITCH_EVENT = 2703616_u32
  IOCTL_GET_SYS_BUTTON_CAPS = 2703680_u32
  IOCTL_GET_SYS_BUTTON_EVENT = 2703684_u32
  SYS_BUTTON_POWER = 1_u32
  SYS_BUTTON_SLEEP = 2_u32
  SYS_BUTTON_LID = 4_u32
  SYS_BUTTON_WAKE = 2147483648_u32
  SYS_BUTTON_LID_STATE_MASK = 196608_u32
  SYS_BUTTON_LID_OPEN = 65536_u32
  SYS_BUTTON_LID_CLOSED = 131072_u32
  SYS_BUTTON_LID_INITIAL = 262144_u32
  SYS_BUTTON_LID_CHANGED = 524288_u32
  IOCTL_GET_PROCESSOR_OBJ_INFO = 2703744_u32
  THERMAL_COOLING_INTERFACE_VERSION = 1_u32
  THERMAL_DEVICE_INTERFACE_VERSION = 1_u32
  IOCTL_SET_SYS_MESSAGE_INDICATOR = 2720192_u32
  IOCTL_SET_WAKE_ALARM_VALUE = 2720256_u32
  IOCTL_SET_WAKE_ALARM_POLICY = 2720260_u32
  IOCTL_GET_WAKE_ALARM_VALUE = 2736648_u32
  IOCTL_GET_WAKE_ALARM_POLICY = 2736652_u32
  ACPI_TIME_ADJUST_DAYLIGHT = 1_u32
  ACPI_TIME_IN_DAYLIGHT = 2_u32
  ACPI_TIME_ZONE_UNKNOWN = 2047_u32
  IOCTL_ACPI_GET_REAL_TIME = 2703888_u32
  IOCTL_ACPI_SET_REAL_TIME = 2720276_u32
  IOCTL_GET_WAKE_ALARM_SYSTEM_POWERSTATE = 2703896_u32
  BATTERY_STATUS_WMI_GUID = "fc4670d1-ebbf-416e-87ce-374a4ebc111a"
  BATTERY_RUNTIME_WMI_GUID = "535a3767-1ac2-49bc-a077-3f7a02e40aec"
  BATTERY_TEMPERATURE_WMI_GUID = "1a52a14d-adce-4a44-9a3e-c8d8f15ff2c2"
  BATTERY_FULL_CHARGED_CAPACITY_WMI_GUID = "40b40565-96f7-4435-8694-97e0e4395905"
  BATTERY_CYCLE_COUNT_WMI_GUID = "ef98db24-0014-4c25-a50b-c724ae5cd371"
  BATTERY_STATIC_DATA_WMI_GUID = "05e1e463-e4e2-4ea9-80cb-9bd4b3ca0655"
  BATTERY_STATUS_CHANGE_WMI_GUID = "cddfa0c3-7c5b-4e43-a034-059fa5b84364"
  BATTERY_TAG_CHANGE_WMI_GUID = "5e1f6e19-8786-4d23-94fc-9e746bd5d888"
  BATTERY_MINIPORT_UPDATE_DATA_VER_1 = 1_u32
  BATTERY_MINIPORT_UPDATE_DATA_VER_2 = 2_u32
  BATTERY_CLASS_MAJOR_VERSION = 1_u32
  BATTERY_CLASS_MINOR_VERSION = 0_u32
  BATTERY_CLASS_MINOR_VERSION_1 = 1_u32
  GUID_DEVICE_ENERGY_METER = "45bd8344-7ed6-49cf-a440-c276c933b053"
  IOCTL_EMI_GET_VERSION = 2244608_u32
  IOCTL_EMI_GET_METADATA_SIZE = 2244612_u32
  IOCTL_EMI_GET_METADATA = 2244616_u32
  IOCTL_EMI_GET_MEASUREMENT = 2244620_u32
  EMI_NAME_MAX = 16_u32
  EMI_VERSION_V1 = 1_u32
  EMI_VERSION_V2 = 2_u32
  EFFECTIVE_POWER_MODE_V1 = 1_u32
  EFFECTIVE_POWER_MODE_V2 = 2_u32
  EnableSysTrayBatteryMeter = 1_u32
  EnableMultiBatteryDisplay = 2_u32
  EnablePasswordLogon = 4_u32
  EnableWakeOnRing = 8_u32
  EnableVideoDimDisplay = 16_u32
  POWER_ATTRIBUTE_HIDE = 1_u32
  POWER_ATTRIBUTE_SHOW_AOAC = 2_u32
  DEVICEPOWER_HARDWAREID = 2147483648_u32
  DEVICEPOWER_AND_OPERATION = 1073741824_u32
  DEVICEPOWER_FILTER_DEVICES_PRESENT = 536870912_u32
  DEVICEPOWER_FILTER_HARDWARE = 268435456_u32
  DEVICEPOWER_FILTER_WAKEENABLED = 134217728_u32
  DEVICEPOWER_FILTER_WAKEPROGRAMMABLE = 67108864_u32
  DEVICEPOWER_FILTER_ON_NAME = 33554432_u32
  DEVICEPOWER_SET_WAKEENABLED = 1_u32
  DEVICEPOWER_CLEAR_WAKEENABLED = 2_u32
  PDCAP_S0_SUPPORTED = 65536_u32
  PDCAP_S1_SUPPORTED = 131072_u32
  PDCAP_S2_SUPPORTED = 262144_u32
  PDCAP_S3_SUPPORTED = 524288_u32
  PDCAP_WAKE_FROM_S0_SUPPORTED = 1048576_u32
  PDCAP_WAKE_FROM_S1_SUPPORTED = 2097152_u32
  PDCAP_WAKE_FROM_S2_SUPPORTED = 4194304_u32
  PDCAP_WAKE_FROM_S3_SUPPORTED = 8388608_u32
  PDCAP_S4_SUPPORTED = 16777216_u32
  PDCAP_S5_SUPPORTED = 33554432_u32
  THERMAL_EVENT_VERSION = 1_u32

  alias EFFECTIVE_POWER_MODE_CALLBACK = Proc(EFFECTIVE_POWER_MODE, Void*, Void)
  alias PWRSCHEMESENUMPROC_V1 = Proc(UInt32, UInt32, Int8*, UInt32, Int8*, POWER_POLICY*, LPARAM, BOOLEAN)
  alias PWRSCHEMESENUMPROC = Proc(UInt32, UInt32, LibC::LPWSTR, UInt32, LibC::LPWSTR, POWER_POLICY*, LPARAM, BOOLEAN)
  alias PDEVICE_NOTIFY_CALLBACK_ROUTINE = Proc(Void*, UInt32, Void*, UInt32)


  enum POWER_PLATFORM_ROLE_VERSION : UInt32
    POWER_PLATFORM_ROLE_V1 = 1
    POWER_PLATFORM_ROLE_V2 = 2
  end

  enum POWER_SETTING_REGISTER_NOTIFICATION_FLAGS : UInt32
    DEVICE_NOTIFY_SERVICE_HANDLE = 1
    DEVICE_NOTIFY_CALLBACK = 2
    DEVICE_NOTIFY_WINDOW_HANDLE = 0
  end

  enum EXECUTION_STATE : UInt32
    ES_AWAYMODE_REQUIRED = 64
    ES_CONTINUOUS = 2147483648
    ES_DISPLAY_REQUIRED = 2
    ES_SYSTEM_REQUIRED = 1
    ES_USER_PRESENT = 4
  end

  enum POWER_ACTION_POLICY_EVENT_CODE : UInt32
    POWER_FORCE_TRIGGER_RESET = 2147483648
    POWER_LEVEL_USER_NOTIFY_EXEC = 4
    POWER_LEVEL_USER_NOTIFY_SOUND = 2
    POWER_LEVEL_USER_NOTIFY_TEXT = 1
    POWER_USER_NOTIFY_BUTTON = 8
    POWER_USER_NOTIFY_SHUTDOWN = 16
  end

  enum EFFECTIVE_POWER_MODE : Int32
    EffectivePowerModeBatterySaver = 0
    EffectivePowerModeBetterBattery = 1
    EffectivePowerModeBalanced = 2
    EffectivePowerModeHighPerformance = 3
    EffectivePowerModeMaxPerformance = 4
    EffectivePowerModeGameMode = 5
    EffectivePowerModeMixedReality = 6
  end

  enum POWER_DATA_ACCESSOR : Int32
    ACCESS_AC_POWER_SETTING_INDEX = 0
    ACCESS_DC_POWER_SETTING_INDEX = 1
    ACCESS_FRIENDLY_NAME = 2
    ACCESS_DESCRIPTION = 3
    ACCESS_POSSIBLE_POWER_SETTING = 4
    ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME = 5
    ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION = 6
    ACCESS_DEFAULT_AC_POWER_SETTING = 7
    ACCESS_DEFAULT_DC_POWER_SETTING = 8
    ACCESS_POSSIBLE_VALUE_MIN = 9
    ACCESS_POSSIBLE_VALUE_MAX = 10
    ACCESS_POSSIBLE_VALUE_INCREMENT = 11
    ACCESS_POSSIBLE_VALUE_UNITS = 12
    ACCESS_ICON_RESOURCE = 13
    ACCESS_DEFAULT_SECURITY_DESCRIPTOR = 14
    ACCESS_ATTRIBUTES = 15
    ACCESS_SCHEME = 16
    ACCESS_SUBGROUP = 17
    ACCESS_INDIVIDUAL_SETTING = 18
    ACCESS_ACTIVE_SCHEME = 19
    ACCESS_CREATE_SCHEME = 20
    ACCESS_AC_POWER_SETTING_MAX = 21
    ACCESS_DC_POWER_SETTING_MAX = 22
    ACCESS_AC_POWER_SETTING_MIN = 23
    ACCESS_DC_POWER_SETTING_MIN = 24
    ACCESS_PROFILE = 25
    ACCESS_OVERLAY_SCHEME = 26
    ACCESS_ACTIVE_OVERLAY_SCHEME = 27
  end

  enum BATTERY_QUERY_INFORMATION_LEVEL : Int32
    BatteryInformation = 0
    BatteryGranularityInformation = 1
    BatteryTemperature = 2
    BatteryEstimatedTime = 3
    BatteryDeviceName = 4
    BatteryManufactureDate = 5
    BatteryManufactureName = 6
    BatteryUniqueID = 7
    BatterySerialNumber = 8
  end

  enum BATTERY_CHARGING_SOURCE_TYPE : Int32
    BatteryChargingSourceType_AC = 1
    BatteryChargingSourceType_USB = 2
    BatteryChargingSourceType_Wireless = 3
    BatteryChargingSourceType_Max = 4
  end

  enum USB_CHARGER_PORT : Int32
    UsbChargerPort_Legacy = 0
    UsbChargerPort_TypeC = 1
    UsbChargerPort_Max = 2
  end

  enum BATTERY_SET_INFORMATION_LEVEL : Int32
    BatteryCriticalBias = 0
    BatteryCharge = 1
    BatteryDischarge = 2
    BatteryChargingSource = 3
    BatteryChargerId = 4
    BatteryChargerStatus = 5
  end

  enum EMI_MEASUREMENT_UNIT : Int32
    EmiMeasurementUnitPicowattHours = 0
  end

  enum SYSTEM_POWER_STATE : Int32
    PowerSystemUnspecified = 0
    PowerSystemWorking = 1
    PowerSystemSleeping1 = 2
    PowerSystemSleeping2 = 3
    PowerSystemSleeping3 = 4
    PowerSystemHibernate = 5
    PowerSystemShutdown = 6
    PowerSystemMaximum = 7
  end

  enum POWER_ACTION : Int32
    PowerActionNone = 0
    PowerActionReserved = 1
    PowerActionSleep = 2
    PowerActionHibernate = 3
    PowerActionShutdown = 4
    PowerActionShutdownReset = 5
    PowerActionShutdownOff = 6
    PowerActionWarmEject = 7
    PowerActionDisplayOff = 8
  end

  enum DEVICE_POWER_STATE : Int32
    PowerDeviceUnspecified = 0
    PowerDeviceD0 = 1
    PowerDeviceD1 = 2
    PowerDeviceD2 = 3
    PowerDeviceD3 = 4
    PowerDeviceMaximum = 5
  end

  enum LATENCY_TIME : Int32
    LT_DONT_CARE = 0
    LT_LOWEST_LATENCY = 1
  end

  enum POWER_REQUEST_TYPE : Int32
    PowerRequestDisplayRequired = 0
    PowerRequestSystemRequired = 1
    PowerRequestAwayModeRequired = 2
    PowerRequestExecutionRequired = 3
  end

  enum POWER_INFORMATION_LEVEL : Int32
    SystemPowerPolicyAc = 0
    SystemPowerPolicyDc = 1
    VerifySystemPolicyAc = 2
    VerifySystemPolicyDc = 3
    SystemPowerCapabilities = 4
    SystemBatteryState = 5
    SystemPowerStateHandler = 6
    ProcessorStateHandler = 7
    SystemPowerPolicyCurrent = 8
    AdministratorPowerPolicy = 9
    SystemReserveHiberFile = 10
    ProcessorInformation = 11
    SystemPowerInformation = 12
    ProcessorStateHandler2 = 13
    LastWakeTime = 14
    LastSleepTime = 15
    SystemExecutionState = 16
    SystemPowerStateNotifyHandler = 17
    ProcessorPowerPolicyAc = 18
    ProcessorPowerPolicyDc = 19
    VerifyProcessorPowerPolicyAc = 20
    VerifyProcessorPowerPolicyDc = 21
    ProcessorPowerPolicyCurrent = 22
    SystemPowerStateLogging = 23
    SystemPowerLoggingEntry = 24
    SetPowerSettingValue = 25
    NotifyUserPowerSetting = 26
    PowerInformationLevelUnused0 = 27
    SystemMonitorHiberBootPowerOff = 28
    SystemVideoState = 29
    TraceApplicationPowerMessage = 30
    TraceApplicationPowerMessageEnd = 31
    ProcessorPerfStates = 32
    ProcessorIdleStates = 33
    ProcessorCap = 34
    SystemWakeSource = 35
    SystemHiberFileInformation = 36
    TraceServicePowerMessage = 37
    ProcessorLoad = 38
    PowerShutdownNotification = 39
    MonitorCapabilities = 40
    SessionPowerInit = 41
    SessionDisplayState = 42
    PowerRequestCreate = 43
    PowerRequestAction = 44
    GetPowerRequestList = 45
    ProcessorInformationEx = 46
    NotifyUserModeLegacyPowerEvent = 47
    GroupPark = 48
    ProcessorIdleDomains = 49
    WakeTimerList = 50
    SystemHiberFileSize = 51
    ProcessorIdleStatesHv = 52
    ProcessorPerfStatesHv = 53
    ProcessorPerfCapHv = 54
    ProcessorSetIdle = 55
    LogicalProcessorIdling = 56
    UserPresence = 57
    PowerSettingNotificationName = 58
    GetPowerSettingValue = 59
    IdleResiliency = 60
    SessionRITState = 61
    SessionConnectNotification = 62
    SessionPowerCleanup = 63
    SessionLockState = 64
    SystemHiberbootState = 65
    PlatformInformation = 66
    PdcInvocation = 67
    MonitorInvocation = 68
    FirmwareTableInformationRegistered = 69
    SetShutdownSelectedTime = 70
    SuspendResumeInvocation = 71
    PlmPowerRequestCreate = 72
    ScreenOff = 73
    CsDeviceNotification = 74
    PlatformRole = 75
    LastResumePerformance = 76
    DisplayBurst = 77
    ExitLatencySamplingPercentage = 78
    RegisterSpmPowerSettings = 79
    PlatformIdleStates = 80
    ProcessorIdleVeto = 81
    PlatformIdleVeto = 82
    SystemBatteryStatePrecise = 83
    ThermalEvent = 84
    PowerRequestActionInternal = 85
    BatteryDeviceState = 86
    PowerInformationInternal = 87
    ThermalStandby = 88
    SystemHiberFileType = 89
    PhysicalPowerButtonPress = 90
    QueryPotentialDripsConstraint = 91
    EnergyTrackerCreate = 92
    EnergyTrackerQuery = 93
    UpdateBlackBoxRecorder = 94
    SessionAllowExternalDmaDevices = 95
    SendSuspendResumeNotification = 96
    PowerInformationLevelMaximum = 97
  end

  enum SYSTEM_POWER_CONDITION : Int32
    PoAc = 0
    PoDc = 1
    PoHot = 2
    PoConditionMaximum = 3
  end

  enum POWER_PLATFORM_ROLE : Int32
    PlatformRoleUnspecified = 0
    PlatformRoleDesktop = 1
    PlatformRoleMobile = 2
    PlatformRoleWorkstation = 3
    PlatformRoleEnterpriseServer = 4
    PlatformRoleSOHOServer = 5
    PlatformRoleAppliancePC = 6
    PlatformRolePerformanceServer = 7
    PlatformRoleSlate = 8
    PlatformRoleMaximum = 9
  end

  struct GLOBAL_MACHINE_POWER_POLICY
    revision : UInt32
    lid_open_wake_ac : SYSTEM_POWER_STATE
    lid_open_wake_dc : SYSTEM_POWER_STATE
    broadcast_capacity_resolution : UInt32
  end
  struct GLOBAL_USER_POWER_POLICY
    revision : UInt32
    power_button_ac : POWER_ACTION_POLICY
    power_button_dc : POWER_ACTION_POLICY
    sleep_button_ac : POWER_ACTION_POLICY
    sleep_button_dc : POWER_ACTION_POLICY
    lid_close_ac : POWER_ACTION_POLICY
    lid_close_dc : POWER_ACTION_POLICY
    discharge_policy : SYSTEM_POWER_LEVEL[4]*
    global_flags : UInt32
  end
  struct GLOBAL_POWER_POLICY
    user : GLOBAL_USER_POWER_POLICY
    mach : GLOBAL_MACHINE_POWER_POLICY
  end
  struct MACHINE_POWER_POLICY
    revision : UInt32
    min_sleep_ac : SYSTEM_POWER_STATE
    min_sleep_dc : SYSTEM_POWER_STATE
    reduced_latency_sleep_ac : SYSTEM_POWER_STATE
    reduced_latency_sleep_dc : SYSTEM_POWER_STATE
    doze_timeout_ac : UInt32
    doze_timeout_dc : UInt32
    doze_s4_timeout_ac : UInt32
    doze_s4_timeout_dc : UInt32
    min_throttle_ac : UInt8
    min_throttle_dc : UInt8
    pad1 : UInt8[2]*
    over_throttled_ac : POWER_ACTION_POLICY
    over_throttled_dc : POWER_ACTION_POLICY
  end
  struct MACHINE_PROCESSOR_POWER_POLICY
    revision : UInt32
    processor_policy_ac : PROCESSOR_POWER_POLICY
    processor_policy_dc : PROCESSOR_POWER_POLICY
  end
  struct USER_POWER_POLICY
    revision : UInt32
    idle_ac : POWER_ACTION_POLICY
    idle_dc : POWER_ACTION_POLICY
    idle_timeout_ac : UInt32
    idle_timeout_dc : UInt32
    idle_sensitivity_ac : UInt8
    idle_sensitivity_dc : UInt8
    throttle_policy_ac : UInt8
    throttle_policy_dc : UInt8
    max_sleep_ac : SYSTEM_POWER_STATE
    max_sleep_dc : SYSTEM_POWER_STATE
    reserved : UInt32[2]*
    video_timeout_ac : UInt32
    video_timeout_dc : UInt32
    spindown_timeout_ac : UInt32
    spindown_timeout_dc : UInt32
    optimize_for_power_ac : BOOLEAN
    optimize_for_power_dc : BOOLEAN
    fan_throttle_tolerance_ac : UInt8
    fan_throttle_tolerance_dc : UInt8
    forced_throttle_ac : UInt8
    forced_throttle_dc : UInt8
  end
  struct POWER_POLICY
    user : USER_POWER_POLICY
    mach : MACHINE_POWER_POLICY
  end
  struct DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS
    callback : PDEVICE_NOTIFY_CALLBACK_ROUTINE
    context : Void*
  end
  struct THERMAL_EVENT
    version : UInt32
    size : UInt32
    type : UInt32
    temperature : UInt32
    trip_point_temperature : UInt32
    initiator : LibC::LPWSTR
  end
  struct BATTERY_QUERY_INFORMATION
    battery_tag : UInt32
    information_level : BATTERY_QUERY_INFORMATION_LEVEL
    at_rate : UInt32
  end
  struct BATTERY_INFORMATION
    capabilities : UInt32
    technology : UInt8
    reserved : UInt8[3]*
    chemistry : UInt8[4]*
    designed_capacity : UInt32
    full_charged_capacity : UInt32
    default_alert1 : UInt32
    default_alert2 : UInt32
    critical_bias : UInt32
    cycle_count : UInt32
  end
  struct BATTERY_CHARGING_SOURCE
    type : BATTERY_CHARGING_SOURCE_TYPE
    max_current : UInt32
  end
  struct BATTERY_CHARGING_SOURCE_INFORMATION
    type : BATTERY_CHARGING_SOURCE_TYPE
    source_online : BOOLEAN
  end
  struct BATTERY_SET_INFORMATION
    battery_tag : UInt32
    information_level : BATTERY_SET_INFORMATION_LEVEL
    buffer : UInt8[0]*
  end
  struct BATTERY_CHARGER_STATUS
    type : BATTERY_CHARGING_SOURCE_TYPE
    va_data : UInt32[0]*
  end
  struct BATTERY_USB_CHARGER_STATUS
    type : BATTERY_CHARGING_SOURCE_TYPE
    reserved : UInt32
    flags : UInt32
    max_current : UInt32
    voltage : UInt32
    port_type : USB_CHARGER_PORT
    port_id : UInt64
    power_source_information : Void*
    oem_charger : Guid
  end
  struct BATTERY_WAIT_STATUS
    battery_tag : UInt32
    timeout : UInt32
    power_state : UInt32
    low_capacity : UInt32
    high_capacity : UInt32
  end
  struct BATTERY_STATUS
    power_state : UInt32
    capacity : UInt32
    voltage : UInt32
    rate : Int32
  end
  struct BATTERY_MANUFACTURE_DATE
    day : UInt8
    month : UInt8
    year : UInt16
  end
  struct THERMAL_INFORMATION
    thermal_stamp : UInt32
    thermal_constant1 : UInt32
    thermal_constant2 : UInt32
    processors : LibC::UINT_PTR
    sampling_period : UInt32
    current_temperature : UInt32
    passive_trip_point : UInt32
    critical_trip_point : UInt32
    active_trip_point_count : UInt8
    active_trip_point : UInt32[10]*
  end
  struct THERMAL_WAIT_READ
    timeout : UInt32
    low_temperature : UInt32
    high_temperature : UInt32
  end
  struct THERMAL_POLICY
    version : UInt32
    wait_for_update : BOOLEAN
    hibernate : BOOLEAN
    critical : BOOLEAN
    thermal_standby : BOOLEAN
    activation_reasons : UInt32
    passive_limit : UInt32
    active_level : UInt32
    over_throttled : BOOLEAN
  end
  struct PROCESSOR_OBJECT_INFO
    physical_id : UInt32
    p_blk_address : UInt32
    p_blk_length : UInt8
  end
  struct PROCESSOR_OBJECT_INFO_EX
    physical_id : UInt32
    p_blk_address : UInt32
    p_blk_length : UInt8
    initial_apic_id : UInt32
  end
  struct WAKE_ALARM_INFORMATION
    timer_identifier : UInt32
    timeout : UInt32
  end
  struct ACPI_REAL_TIME
    year : UInt16
    month : UInt8
    day : UInt8
    hour : UInt8
    minute : UInt8
    second : UInt8
    valid : UInt8
    milliseconds : UInt16
    time_zone : Int16
    day_light : UInt8
    reserved1 : UInt8[3]*
  end
  struct EMI_VERSION
    emi_version : UInt16
  end
  struct EMI_METADATA_SIZE
    metadata_size : UInt32
  end
  struct EMI_CHANNEL_MEASUREMENT_DATA
    absolute_energy : UInt64
    absolute_time : UInt64
  end
  struct EMI_METADATA_V1
    measurement_unit : EMI_MEASUREMENT_UNIT
    hardware_oem : Char[16]*
    hardware_model : Char[16]*
    hardware_revision : UInt16
    metered_hardware_name_size : UInt16
    metered_hardware_name : Char[0]*
  end
  struct EMI_CHANNEL_V2
    measurement_unit : EMI_MEASUREMENT_UNIT
    channel_name_size : UInt16
    channel_name : Char[0]*
  end
  struct EMI_METADATA_V2
    hardware_oem : Char[16]*
    hardware_model : Char[16]*
    hardware_revision : UInt16
    channel_count : UInt16
    channels : EMI_CHANNEL_V2[0]*
  end
  struct EMI_MEASUREMENT_DATA_V2
    channel_data : EMI_CHANNEL_MEASUREMENT_DATA[0]*
  end
  struct CM_POWER_DATA
    pd_size : UInt32
    pd_most_recent_power_state : DEVICE_POWER_STATE
    pd_capabilities : UInt32
    pd_d1_latency : UInt32
    pd_d2_latency : UInt32
    pd_d3_latency : UInt32
    pd_power_state_mapping : DEVICE_POWER_STATE[7]*
    pd_deepest_system_wake : SYSTEM_POWER_STATE
  end
  struct SET_POWER_SETTING_VALUE
    version : UInt32
    guid : Guid
    power_condition : SYSTEM_POWER_CONDITION
    data_length : UInt32
    data : UInt8[0]*
  end
  struct BATTERY_REPORTING_SCALE
    granularity : UInt32
    capacity : UInt32
  end
  struct POWER_ACTION_POLICY
    action : POWER_ACTION
    flags : UInt32
    event_code : POWER_ACTION_POLICY_EVENT_CODE
  end
  struct SYSTEM_POWER_LEVEL
    enable : BOOLEAN
    spare : UInt8[3]*
    battery_level : UInt32
    power_policy : POWER_ACTION_POLICY
    min_system_state : SYSTEM_POWER_STATE
  end
  struct SYSTEM_POWER_POLICY
    revision : UInt32
    power_button : POWER_ACTION_POLICY
    sleep_button : POWER_ACTION_POLICY
    lid_close : POWER_ACTION_POLICY
    lid_open_wake : SYSTEM_POWER_STATE
    reserved : UInt32
    idle : POWER_ACTION_POLICY
    idle_timeout : UInt32
    idle_sensitivity : UInt8
    dynamic_throttle : UInt8
    spare2 : UInt8[2]*
    min_sleep : SYSTEM_POWER_STATE
    max_sleep : SYSTEM_POWER_STATE
    reduced_latency_sleep : SYSTEM_POWER_STATE
    win_logon_flags : UInt32
    spare3 : UInt32
    doze_s4_timeout : UInt32
    broadcast_capacity_resolution : UInt32
    discharge_policy : SYSTEM_POWER_LEVEL[4]*
    video_timeout : UInt32
    video_dim_display : BOOLEAN
    video_reserved : UInt32[3]*
    spindown_timeout : UInt32
    optimize_for_power : BOOLEAN
    fan_throttle_tolerance : UInt8
    forced_throttle : UInt8
    min_throttle : UInt8
    over_throttled : POWER_ACTION_POLICY
  end
  struct PROCESSOR_POWER_POLICY_INFO
    time_check : UInt32
    demote_limit : UInt32
    promote_limit : UInt32
    demote_percent : UInt8
    promote_percent : UInt8
    spare : UInt8[2]*
    _bitfield : UInt32
  end
  struct PROCESSOR_POWER_POLICY
    revision : UInt32
    dynamic_throttle : UInt8
    spare : UInt8[3]*
    _bitfield : UInt32
    policy_count : UInt32
    policy : PROCESSOR_POWER_POLICY_INFO[3]*
  end
  struct ADMINISTRATOR_POWER_POLICY
    min_sleep : SYSTEM_POWER_STATE
    max_sleep : SYSTEM_POWER_STATE
    min_video_timeout : UInt32
    max_video_timeout : UInt32
    min_spindown_timeout : UInt32
    max_spindown_timeout : UInt32
  end
  struct SYSTEM_POWER_CAPABILITIES
    power_button_present : BOOLEAN
    sleep_button_present : BOOLEAN
    lid_present : BOOLEAN
    system_s1 : BOOLEAN
    system_s2 : BOOLEAN
    system_s3 : BOOLEAN
    system_s4 : BOOLEAN
    system_s5 : BOOLEAN
    hiber_file_present : BOOLEAN
    full_wake : BOOLEAN
    video_dim_present : BOOLEAN
    apm_present : BOOLEAN
    ups_present : BOOLEAN
    thermal_control : BOOLEAN
    processor_throttle : BOOLEAN
    processor_min_throttle : UInt8
    processor_max_throttle : UInt8
    fast_system_s4 : BOOLEAN
    hiberboot : BOOLEAN
    wake_alarm_present : BOOLEAN
    ao_ac : BOOLEAN
    disk_spin_down : BOOLEAN
    hiber_file_type : UInt8
    ao_ac_connectivity_supported : BOOLEAN
    spare3 : UInt8[6]*
    system_batteries_present : BOOLEAN
    batteries_are_short_term : BOOLEAN
    battery_scale : BATTERY_REPORTING_SCALE[3]*
    ac_on_line_wake : SYSTEM_POWER_STATE
    soft_lid_wake : SYSTEM_POWER_STATE
    rtc_wake : SYSTEM_POWER_STATE
    min_device_wake_state : SYSTEM_POWER_STATE
    default_low_latency_wake : SYSTEM_POWER_STATE
  end
  struct SYSTEM_BATTERY_STATE
    ac_on_line : BOOLEAN
    battery_present : BOOLEAN
    charging : BOOLEAN
    discharging : BOOLEAN
    spare1 : BOOLEAN[3]*
    tag : UInt8
    max_capacity : UInt32
    remaining_capacity : UInt32
    rate : UInt32
    estimated_time : UInt32
    default_alert1 : UInt32
    default_alert2 : UInt32
  end
  struct POWERBROADCAST_SETTING
    power_setting : Guid
    data_length : UInt32
    data : UInt8[0]*
  end
  struct SYSTEM_POWER_STATUS
    ac_line_status : UInt8
    battery_flag : UInt8
    battery_life_percent : UInt8
    system_status_flag : UInt8
    battery_life_time : UInt32
    battery_full_life_time : UInt32
  end


  # Params # informationlevel : POWER_INFORMATION_LEVEL [In],inputbuffer : Void* [In],inputbufferlength : UInt32 [In],outputbuffer : Void* [In],outputbufferlength : UInt32 [In]
  fun CallNtPowerInformation(informationlevel : POWER_INFORMATION_LEVEL, inputbuffer : Void*, inputbufferlength : UInt32, outputbuffer : Void*, outputbufferlength : UInt32) : Int32

  # Params # lpspc : SYSTEM_POWER_CAPABILITIES* [In]
  fun GetPwrCapabilities(lpspc : SYSTEM_POWER_CAPABILITIES*) : BOOLEAN

  # Params # version : POWER_PLATFORM_ROLE_VERSION [In]
  fun PowerDeterminePlatformRoleEx(version : POWER_PLATFORM_ROLE_VERSION) : POWER_PLATFORM_ROLE

  # Params # flags : UInt32 [In],recipient : LibC::HANDLE [In],registrationhandle : Void** [In]
  fun PowerRegisterSuspendResumeNotification(flags : UInt32, recipient : LibC::HANDLE, registrationhandle : Void**) : UInt32

  # Params # registrationhandle : HPOWERNOTIFY [In]
  fun PowerUnregisterSuspendResumeNotification(registrationhandle : HPOWERNOTIFY) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],type : UInt32* [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadACValue(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, type : UInt32*, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],type : UInt32* [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadDCValue(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, type : UInt32*, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],acvalueindex : UInt32 [In]
  fun PowerWriteACValueIndex(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, acvalueindex : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],dcvalueindex : UInt32 [In]
  fun PowerWriteDCValueIndex(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, dcvalueindex : UInt32) : UInt32

  # Params # userrootpowerkey : HKEY [In],activepolicyguid : Guid** [In]
  fun PowerGetActiveScheme(userrootpowerkey : HKEY, activepolicyguid : Guid**) : UInt32

  # Params # userrootpowerkey : HKEY [In],schemeguid : Guid* [In]
  fun PowerSetActiveScheme(userrootpowerkey : HKEY, schemeguid : Guid*) : UInt32

  # Params # settingguid : Guid* [In],flags : POWER_SETTING_REGISTER_NOTIFICATION_FLAGS [In],recipient : LibC::HANDLE [In],registrationhandle : Void** [In]
  fun PowerSettingRegisterNotification(settingguid : Guid*, flags : POWER_SETTING_REGISTER_NOTIFICATION_FLAGS, recipient : LibC::HANDLE, registrationhandle : Void**) : UInt32

  # Params # registrationhandle : HPOWERNOTIFY [In]
  fun PowerSettingUnregisterNotification(registrationhandle : HPOWERNOTIFY) : UInt32

  # Params # version : UInt32 [In],callback : EFFECTIVE_POWER_MODE_CALLBACK [In],context : Void* [In],registrationhandle : Void** [In]
  fun PowerRegisterForEffectivePowerModeNotifications(version : UInt32, callback : EFFECTIVE_POWER_MODE_CALLBACK, context : Void*, registrationhandle : Void**) : HRESULT

  # Params # registrationhandle : Void* [In]
  fun PowerUnregisterFromEffectivePowerModeNotifications(registrationhandle : Void*) : HRESULT

  # Params # puimax : UInt32* [In],puimin : UInt32* [In]
  fun GetPwrDiskSpindownRange(puimax : UInt32*, puimin : UInt32*) : BOOLEAN

  # Params # lpfn : PWRSCHEMESENUMPROC [In],lparam : LPARAM [In]
  fun EnumPwrSchemes(lpfn : PWRSCHEMESENUMPROC, lparam : LPARAM) : BOOLEAN

  # Params # pglobalpowerpolicy : GLOBAL_POWER_POLICY* [In]
  fun ReadGlobalPwrPolicy(pglobalpowerpolicy : GLOBAL_POWER_POLICY*) : BOOLEAN

  # Params # uiid : UInt32 [In],ppowerpolicy : POWER_POLICY* [In]
  fun ReadPwrScheme(uiid : UInt32, ppowerpolicy : POWER_POLICY*) : BOOLEAN

  # Params # puiid : UInt32* [In],lpszschemename : LibC::LPWSTR [In],lpszdescription : LibC::LPWSTR [In],lpscheme : POWER_POLICY* [In]
  fun WritePwrScheme(puiid : UInt32*, lpszschemename : LibC::LPWSTR, lpszdescription : LibC::LPWSTR, lpscheme : POWER_POLICY*) : BOOLEAN

  # Params # pglobalpowerpolicy : GLOBAL_POWER_POLICY* [In]
  fun WriteGlobalPwrPolicy(pglobalpowerpolicy : GLOBAL_POWER_POLICY*) : BOOLEAN

  # Params # uiid : UInt32 [In]
  fun DeletePwrScheme(uiid : UInt32) : BOOLEAN

  # Params # puiid : UInt32* [In]
  fun GetActivePwrScheme(puiid : UInt32*) : BOOLEAN

  # Params # uiid : UInt32 [In],pglobalpowerpolicy : GLOBAL_POWER_POLICY* [In],ppowerpolicy : POWER_POLICY* [In]
  fun SetActivePwrScheme(uiid : UInt32, pglobalpowerpolicy : GLOBAL_POWER_POLICY*, ppowerpolicy : POWER_POLICY*) : BOOLEAN

  # Params # 
  fun IsPwrSuspendAllowed : BOOLEAN

  # Params # 
  fun IsPwrHibernateAllowed : BOOLEAN

  # Params # 
  fun IsPwrShutdownAllowed : BOOLEAN

  # Params # papp : ADMINISTRATOR_POWER_POLICY* [In]
  fun IsAdminOverrideActive(papp : ADMINISTRATOR_POWER_POLICY*) : BOOLEAN

  # Params # bhibernate : BOOLEAN [In],bforce : BOOLEAN [In],bwakeupeventsdisabled : BOOLEAN [In]
  fun SetSuspendState(bhibernate : BOOLEAN, bforce : BOOLEAN, bwakeupeventsdisabled : BOOLEAN) : BOOLEAN

  # Params # pglobalpowerpolicy : GLOBAL_POWER_POLICY* [In],ppowerpolicy : POWER_POLICY* [In]
  fun GetCurrentPowerPolicies(pglobalpowerpolicy : GLOBAL_POWER_POLICY*, ppowerpolicy : POWER_POLICY*) : BOOLEAN

  # Params # 
  fun CanUserWritePwrScheme : BOOLEAN

  # Params # uiid : UInt32 [In],pmachineprocessorpowerpolicy : MACHINE_PROCESSOR_POWER_POLICY* [In]
  fun ReadProcessorPwrScheme(uiid : UInt32, pmachineprocessorpowerpolicy : MACHINE_PROCESSOR_POWER_POLICY*) : BOOLEAN

  # Params # uiid : UInt32 [In],pmachineprocessorpowerpolicy : MACHINE_PROCESSOR_POWER_POLICY* [In]
  fun WriteProcessorPwrScheme(uiid : UInt32, pmachineprocessorpowerpolicy : MACHINE_PROCESSOR_POWER_POLICY*) : BOOLEAN

  # Params # pglobalpowerpolicy : GLOBAL_POWER_POLICY* [In],ppowerpolicy : POWER_POLICY* [In]
  fun ValidatePowerPolicies(pglobalpowerpolicy : GLOBAL_POWER_POLICY*, ppowerpolicy : POWER_POLICY*) : BOOLEAN

  # Params # subkeyguid : Guid* [In],settingguid : Guid* [In]
  fun PowerIsSettingRangeDefined(subkeyguid : Guid*, settingguid : Guid*) : BOOLEAN

  # Params # accessflags : POWER_DATA_ACCESSOR [In],powerguid : Guid* [In],accesstype : REG_SAM_FLAGS [In]
  fun PowerSettingAccessCheckEx(accessflags : POWER_DATA_ACCESSOR, powerguid : Guid*, accesstype : REG_SAM_FLAGS) : UInt32

  # Params # accessflags : POWER_DATA_ACCESSOR [In],powerguid : Guid* [In]
  fun PowerSettingAccessCheck(accessflags : POWER_DATA_ACCESSOR, powerguid : Guid*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],acvalueindex : UInt32* [In]
  fun PowerReadACValueIndex(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, acvalueindex : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],dcvalueindex : UInt32* [In]
  fun PowerReadDCValueIndex(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, dcvalueindex : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadFriendlyName(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadDescription(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],type : UInt32* [In],possiblesettingindex : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadPossibleValue(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, type : UInt32*, possiblesettingindex : UInt32, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],possiblesettingindex : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadPossibleFriendlyName(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, possiblesettingindex : UInt32, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],possiblesettingindex : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadPossibleDescription(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, possiblesettingindex : UInt32, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],valueminimum : UInt32* [In]
  fun PowerReadValueMin(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, valueminimum : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],valuemaximum : UInt32* [In]
  fun PowerReadValueMax(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, valuemaximum : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],valueincrement : UInt32* [In]
  fun PowerReadValueIncrement(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, valueincrement : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadValueUnitsSpecifier(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemepersonalityguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],acdefaultindex : UInt32* [In]
  fun PowerReadACDefaultIndex(rootpowerkey : HKEY, schemepersonalityguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, acdefaultindex : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemepersonalityguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],dcdefaultindex : UInt32* [In]
  fun PowerReadDCDefaultIndex(rootpowerkey : HKEY, schemepersonalityguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, dcdefaultindex : UInt32*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerReadIconResourceSpecifier(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # subgroupguid : Guid* [In],powersettingguid : Guid* [In]
  fun PowerReadSettingAttributes(subgroupguid : Guid*, powersettingguid : Guid*) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWriteFriendlyName(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWriteDescription(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],type : UInt32 [In],possiblesettingindex : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWritePossibleValue(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, type : UInt32, possiblesettingindex : UInt32, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],possiblesettingindex : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWritePossibleFriendlyName(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, possiblesettingindex : UInt32, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],possiblesettingindex : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWritePossibleDescription(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, possiblesettingindex : UInt32, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],valueminimum : UInt32 [In]
  fun PowerWriteValueMin(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, valueminimum : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],valuemaximum : UInt32 [In]
  fun PowerWriteValueMax(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, valuemaximum : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],valueincrement : UInt32 [In]
  fun PowerWriteValueIncrement(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, valueincrement : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWriteValueUnitsSpecifier(rootpowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # rootsystempowerkey : HKEY [In],schemepersonalityguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],defaultacindex : UInt32 [In]
  fun PowerWriteACDefaultIndex(rootsystempowerkey : HKEY, schemepersonalityguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, defaultacindex : UInt32) : UInt32

  # Params # rootsystempowerkey : HKEY [In],schemepersonalityguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],defaultdcindex : UInt32 [In]
  fun PowerWriteDCDefaultIndex(rootsystempowerkey : HKEY, schemepersonalityguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, defaultdcindex : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],buffer : UInt8* [In],buffersize : UInt32 [In]
  fun PowerWriteIconResourceSpecifier(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, buffer : UInt8*, buffersize : UInt32) : UInt32

  # Params # subgroupguid : Guid* [In],powersettingguid : Guid* [In],attributes : UInt32 [In]
  fun PowerWriteSettingAttributes(subgroupguid : Guid*, powersettingguid : Guid*, attributes : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],sourceschemeguid : Guid* [In],destinationschemeguid : Guid** [In]
  fun PowerDuplicateScheme(rootpowerkey : HKEY, sourceschemeguid : Guid*, destinationschemeguid : Guid**) : UInt32

  # Params # rootpowerkey : HKEY [In],importfilenamepath : LibC::LPWSTR [In],destinationschemeguid : Guid** [In]
  fun PowerImportPowerScheme(rootpowerkey : HKEY, importfilenamepath : LibC::LPWSTR, destinationschemeguid : Guid**) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In]
  fun PowerDeleteScheme(rootpowerkey : HKEY, schemeguid : Guid*) : UInt32

  # Params # powersettingsubkeyguid : Guid* [In],powersettingguid : Guid* [In]
  fun PowerRemovePowerSetting(powersettingsubkeyguid : Guid*, powersettingguid : Guid*) : UInt32

  # Params # rootsystempowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In]
  fun PowerCreateSetting(rootsystempowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*) : UInt32

  # Params # rootsystempowerkey : HKEY [In],subgroupofpowersettingsguid : Guid* [In],powersettingguid : Guid* [In],possiblesettingindex : UInt32 [In]
  fun PowerCreatePossibleSetting(rootsystempowerkey : HKEY, subgroupofpowersettingsguid : Guid*, powersettingguid : Guid*, possiblesettingindex : UInt32) : UInt32

  # Params # rootpowerkey : HKEY [In],schemeguid : Guid* [In],subgroupofpowersettingsguid : Guid* [In],accessflags : POWER_DATA_ACCESSOR [In],index : UInt32 [In],buffer : UInt8* [In],buffersize : UInt32* [In]
  fun PowerEnumerate(rootpowerkey : HKEY, schemeguid : Guid*, subgroupofpowersettingsguid : Guid*, accessflags : POWER_DATA_ACCESSOR, index : UInt32, buffer : UInt8*, buffersize : UInt32*) : UInt32

  # Params # phuserpowerkey : HKEY* [In],access : UInt32 [In],openexisting : LibC::BOOL [In]
  fun PowerOpenUserPowerKey(phuserpowerkey : HKEY*, access : UInt32, openexisting : LibC::BOOL) : UInt32

  # Params # phsystempowerkey : HKEY* [In],access : UInt32 [In],openexisting : LibC::BOOL [In]
  fun PowerOpenSystemPowerKey(phsystempowerkey : HKEY*, access : UInt32, openexisting : LibC::BOOL) : UInt32

  # Params # schemeguid : Guid* [In]
  fun PowerCanRestoreIndividualDefaultPowerScheme(schemeguid : Guid*) : UInt32

  # Params # schemeguid : Guid* [In]
  fun PowerRestoreIndividualDefaultPowerScheme(schemeguid : Guid*) : UInt32

  # Params # 
  fun PowerRestoreDefaultPowerSchemes : UInt32

  # Params # 
  fun PowerReplaceDefaultPowerSchemes : UInt32

  # Params # 
  fun PowerDeterminePlatformRole : POWER_PLATFORM_ROLE

  # Params # queryindex : UInt32 [In],queryinterpretationflags : UInt32 [In],queryflags : UInt32 [In],preturnbuffer : UInt8* [In],pbuffersize : UInt32* [In]
  fun DevicePowerEnumDevices(queryindex : UInt32, queryinterpretationflags : UInt32, queryflags : UInt32, preturnbuffer : UInt8*, pbuffersize : UInt32*) : BOOLEAN

  # Params # devicedescription : LibC::LPWSTR [In],setflags : UInt32 [In],setdata : Void* [In]
  fun DevicePowerSetDeviceState(devicedescription : LibC::LPWSTR, setflags : UInt32, setdata : Void*) : UInt32

  # Params # debugmask : UInt32 [In]
  fun DevicePowerOpen(debugmask : UInt32) : BOOLEAN

  # Params # 
  fun DevicePowerClose : BOOLEAN

  # Params # event : THERMAL_EVENT* [In]
  fun PowerReportThermalEvent(event : THERMAL_EVENT*) : UInt32

  # Params # hrecipient : LibC::HANDLE [In],powersettingguid : Guid* [In],flags : UInt32 [In]
  fun RegisterPowerSettingNotification(hrecipient : LibC::HANDLE, powersettingguid : Guid*, flags : UInt32) : HPOWERNOTIFY

  # Params # handle : HPOWERNOTIFY [In]
  fun UnregisterPowerSettingNotification(handle : HPOWERNOTIFY) : LibC::BOOL

  # Params # hrecipient : LibC::HANDLE [In],flags : UInt32 [In]
  fun RegisterSuspendResumeNotification(hrecipient : LibC::HANDLE, flags : UInt32) : HPOWERNOTIFY

  # Params # handle : HPOWERNOTIFY [In]
  fun UnregisterSuspendResumeNotification(handle : HPOWERNOTIFY) : LibC::BOOL

  # Params # latency : LATENCY_TIME [In]
  fun RequestWakeupLatency(latency : LATENCY_TIME) : LibC::BOOL

  # Params # 
  fun IsSystemResumeAutomatic : LibC::BOOL

  # Params # esflags : EXECUTION_STATE [In]
  fun SetThreadExecutionState(esflags : EXECUTION_STATE) : EXECUTION_STATE

  # Params # context : REASON_CONTEXT* [In]
  fun PowerCreateRequest(context : REASON_CONTEXT*) : LibC::HANDLE

  # Params # powerrequest : LibC::HANDLE [In],requesttype : POWER_REQUEST_TYPE [In]
  fun PowerSetRequest(powerrequest : LibC::HANDLE, requesttype : POWER_REQUEST_TYPE) : LibC::BOOL

  # Params # powerrequest : LibC::HANDLE [In],requesttype : POWER_REQUEST_TYPE [In]
  fun PowerClearRequest(powerrequest : LibC::HANDLE, requesttype : POWER_REQUEST_TYPE) : LibC::BOOL

  # Params # hdevice : LibC::HANDLE [In],pfon : LibC::BOOL* [In]
  fun GetDevicePowerState(hdevice : LibC::HANDLE, pfon : LibC::BOOL*) : LibC::BOOL

  # Params # fsuspend : LibC::BOOL [In],fforce : LibC::BOOL [In]
  fun SetSystemPowerState(fsuspend : LibC::BOOL, fforce : LibC::BOOL) : LibC::BOOL

  # Params # lpsystempowerstatus : SYSTEM_POWER_STATUS* [In]
  fun GetSystemPowerStatus(lpsystempowerstatus : SYSTEM_POWER_STATUS*) : LibC::BOOL
end
