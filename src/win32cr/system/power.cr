require "./../foundation.cr"
require "./registry.cr"
require "./threading.cr"

module Win32cr::System::Power
  alias HPOWERNOTIFY = LibC::IntPtrT
  alias EFFECTIVE_POWER_MODE_CALLBACK = Proc(Win32cr::System::Power::EFFECTIVE_POWER_MODE, Void*, Void)*

  alias PWRSCHEMESENUMPROC_V1 = Proc(UInt32, UInt32, Int8*, UInt32, Int8*, Win32cr::System::Power::POWER_POLICY*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOLEAN)*

  alias PWRSCHEMESENUMPROC = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::Power::POWER_POLICY*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOLEAN)*

  alias PDEVICE_NOTIFY_CALLBACK_ROUTINE = Proc(Void*, UInt32, Void*, UInt32)*

  PROCESSOR_NUMBER_PKEY = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x5724c81d_u32, 0xd5af_u16, 0x4c1f_u16, StaticArray[0xa1_u8, 0x3_u8, 0xa0_u8, 0x6e_u8, 0x28_u8, 0xf2_u8, 0x4_u8, 0xc6_u8]), 1_u32)
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

  enum POWER_COOLING_MODE : UInt16
    PO_TZ_ACTIVE = 0_u16
    PO_TZ_PASSIVE = 1_u16
    PO_TZ_INVALID_MODE = 2_u16
  end
  enum POWER_PLATFORM_ROLE_VERSION : UInt32
    POWER_PLATFORM_ROLE_V1 = 1_u32
    POWER_PLATFORM_ROLE_V2 = 2_u32
  end
  enum POWER_SETTING_REGISTER_NOTIFICATION_FLAGS : UInt32
    DEVICE_NOTIFY_SERVICE_HANDLE = 1_u32
    DEVICE_NOTIFY_CALLBACK = 2_u32
    DEVICE_NOTIFY_WINDOW_HANDLE = 0_u32
  end
  @[Flags]
  enum EXECUTION_STATE : UInt32
    ES_AWAYMODE_REQUIRED = 64_u32
    ES_CONTINUOUS = 2147483648_u32
    ES_DISPLAY_REQUIRED = 2_u32
    ES_SYSTEM_REQUIRED = 1_u32
    ES_USER_PRESENT = 4_u32
  end
  @[Flags]
  enum POWER_ACTION_POLICY_EVENT_CODE : UInt32
    POWER_FORCE_TRIGGER_RESET = 2147483648_u32
    POWER_LEVEL_USER_NOTIFY_EXEC = 4_u32
    POWER_LEVEL_USER_NOTIFY_SOUND = 2_u32
    POWER_LEVEL_USER_NOTIFY_TEXT = 1_u32
    POWER_USER_NOTIFY_BUTTON = 8_u32
    POWER_USER_NOTIFY_SHUTDOWN = 16_u32
  end
  enum EFFECTIVE_POWER_MODE
    EffectivePowerModeBatterySaver = 0_i32
    EffectivePowerModeBetterBattery = 1_i32
    EffectivePowerModeBalanced = 2_i32
    EffectivePowerModeHighPerformance = 3_i32
    EffectivePowerModeMaxPerformance = 4_i32
    EffectivePowerModeGameMode = 5_i32
    EffectivePowerModeMixedReality = 6_i32
  end
  enum POWER_DATA_ACCESSOR
    ACCESS_AC_POWER_SETTING_INDEX = 0_i32
    ACCESS_DC_POWER_SETTING_INDEX = 1_i32
    ACCESS_FRIENDLY_NAME = 2_i32
    ACCESS_DESCRIPTION = 3_i32
    ACCESS_POSSIBLE_POWER_SETTING = 4_i32
    ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME = 5_i32
    ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION = 6_i32
    ACCESS_DEFAULT_AC_POWER_SETTING = 7_i32
    ACCESS_DEFAULT_DC_POWER_SETTING = 8_i32
    ACCESS_POSSIBLE_VALUE_MIN = 9_i32
    ACCESS_POSSIBLE_VALUE_MAX = 10_i32
    ACCESS_POSSIBLE_VALUE_INCREMENT = 11_i32
    ACCESS_POSSIBLE_VALUE_UNITS = 12_i32
    ACCESS_ICON_RESOURCE = 13_i32
    ACCESS_DEFAULT_SECURITY_DESCRIPTOR = 14_i32
    ACCESS_ATTRIBUTES = 15_i32
    ACCESS_SCHEME = 16_i32
    ACCESS_SUBGROUP = 17_i32
    ACCESS_INDIVIDUAL_SETTING = 18_i32
    ACCESS_ACTIVE_SCHEME = 19_i32
    ACCESS_CREATE_SCHEME = 20_i32
    ACCESS_AC_POWER_SETTING_MAX = 21_i32
    ACCESS_DC_POWER_SETTING_MAX = 22_i32
    ACCESS_AC_POWER_SETTING_MIN = 23_i32
    ACCESS_DC_POWER_SETTING_MIN = 24_i32
    ACCESS_PROFILE = 25_i32
    ACCESS_OVERLAY_SCHEME = 26_i32
    ACCESS_ACTIVE_OVERLAY_SCHEME = 27_i32
  end
  enum BATTERY_QUERY_INFORMATION_LEVEL
    BatteryInformation = 0_i32
    BatteryGranularityInformation = 1_i32
    BatteryTemperature = 2_i32
    BatteryEstimatedTime = 3_i32
    BatteryDeviceName = 4_i32
    BatteryManufactureDate = 5_i32
    BatteryManufactureName = 6_i32
    BatteryUniqueID = 7_i32
    BatterySerialNumber = 8_i32
  end
  enum BATTERY_CHARGING_SOURCE_TYPE
    BatteryChargingSourceType_AC = 1_i32
    BatteryChargingSourceType_USB = 2_i32
    BatteryChargingSourceType_Wireless = 3_i32
    BatteryChargingSourceType_Max = 4_i32
  end
  enum USB_CHARGER_PORT
    UsbChargerPort_Legacy = 0_i32
    UsbChargerPort_TypeC = 1_i32
    UsbChargerPort_Max = 2_i32
  end
  enum BATTERY_SET_INFORMATION_LEVEL
    BatteryCriticalBias = 0_i32
    BatteryCharge = 1_i32
    BatteryDischarge = 2_i32
    BatteryChargingSource = 3_i32
    BatteryChargerId = 4_i32
    BatteryChargerStatus = 5_i32
  end
  enum EMI_MEASUREMENT_UNIT
    EmiMeasurementUnitPicowattHours = 0_i32
  end
  enum SYSTEM_POWER_STATE
    PowerSystemUnspecified = 0_i32
    PowerSystemWorking = 1_i32
    PowerSystemSleeping1 = 2_i32
    PowerSystemSleeping2 = 3_i32
    PowerSystemSleeping3 = 4_i32
    PowerSystemHibernate = 5_i32
    PowerSystemShutdown = 6_i32
    PowerSystemMaximum = 7_i32
  end
  enum POWER_ACTION
    PowerActionNone = 0_i32
    PowerActionReserved = 1_i32
    PowerActionSleep = 2_i32
    PowerActionHibernate = 3_i32
    PowerActionShutdown = 4_i32
    PowerActionShutdownReset = 5_i32
    PowerActionShutdownOff = 6_i32
    PowerActionWarmEject = 7_i32
    PowerActionDisplayOff = 8_i32
  end
  enum DEVICE_POWER_STATE
    PowerDeviceUnspecified = 0_i32
    PowerDeviceD0 = 1_i32
    PowerDeviceD1 = 2_i32
    PowerDeviceD2 = 3_i32
    PowerDeviceD3 = 4_i32
    PowerDeviceMaximum = 5_i32
  end
  enum LATENCY_TIME
    LT_DONT_CARE = 0_i32
    LT_LOWEST_LATENCY = 1_i32
  end
  enum POWER_REQUEST_TYPE
    PowerRequestDisplayRequired = 0_i32
    PowerRequestSystemRequired = 1_i32
    PowerRequestAwayModeRequired = 2_i32
    PowerRequestExecutionRequired = 3_i32
  end
  enum POWER_INFORMATION_LEVEL
    SystemPowerPolicyAc = 0_i32
    SystemPowerPolicyDc = 1_i32
    VerifySystemPolicyAc = 2_i32
    VerifySystemPolicyDc = 3_i32
    SystemPowerCapabilities = 4_i32
    SystemBatteryState = 5_i32
    SystemPowerStateHandler = 6_i32
    ProcessorStateHandler = 7_i32
    SystemPowerPolicyCurrent = 8_i32
    AdministratorPowerPolicy = 9_i32
    SystemReserveHiberFile = 10_i32
    ProcessorInformation = 11_i32
    SystemPowerInformation = 12_i32
    ProcessorStateHandler2 = 13_i32
    LastWakeTime = 14_i32
    LastSleepTime = 15_i32
    SystemExecutionState = 16_i32
    SystemPowerStateNotifyHandler = 17_i32
    ProcessorPowerPolicyAc = 18_i32
    ProcessorPowerPolicyDc = 19_i32
    VerifyProcessorPowerPolicyAc = 20_i32
    VerifyProcessorPowerPolicyDc = 21_i32
    ProcessorPowerPolicyCurrent = 22_i32
    SystemPowerStateLogging = 23_i32
    SystemPowerLoggingEntry = 24_i32
    SetPowerSettingValue = 25_i32
    NotifyUserPowerSetting = 26_i32
    PowerInformationLevelUnused0 = 27_i32
    SystemMonitorHiberBootPowerOff = 28_i32
    SystemVideoState = 29_i32
    TraceApplicationPowerMessage = 30_i32
    TraceApplicationPowerMessageEnd = 31_i32
    ProcessorPerfStates = 32_i32
    ProcessorIdleStates = 33_i32
    ProcessorCap = 34_i32
    SystemWakeSource = 35_i32
    SystemHiberFileInformation = 36_i32
    TraceServicePowerMessage = 37_i32
    ProcessorLoad = 38_i32
    PowerShutdownNotification = 39_i32
    MonitorCapabilities = 40_i32
    SessionPowerInit = 41_i32
    SessionDisplayState = 42_i32
    PowerRequestCreate = 43_i32
    PowerRequestAction = 44_i32
    GetPowerRequestList = 45_i32
    ProcessorInformationEx = 46_i32
    NotifyUserModeLegacyPowerEvent = 47_i32
    GroupPark = 48_i32
    ProcessorIdleDomains = 49_i32
    WakeTimerList = 50_i32
    SystemHiberFileSize = 51_i32
    ProcessorIdleStatesHv = 52_i32
    ProcessorPerfStatesHv = 53_i32
    ProcessorPerfCapHv = 54_i32
    ProcessorSetIdle = 55_i32
    LogicalProcessorIdling = 56_i32
    UserPresence = 57_i32
    PowerSettingNotificationName = 58_i32
    GetPowerSettingValue = 59_i32
    IdleResiliency = 60_i32
    SessionRITState = 61_i32
    SessionConnectNotification = 62_i32
    SessionPowerCleanup = 63_i32
    SessionLockState = 64_i32
    SystemHiberbootState = 65_i32
    PlatformInformation = 66_i32
    PdcInvocation = 67_i32
    MonitorInvocation = 68_i32
    FirmwareTableInformationRegistered = 69_i32
    SetShutdownSelectedTime = 70_i32
    SuspendResumeInvocation = 71_i32
    PlmPowerRequestCreate = 72_i32
    ScreenOff = 73_i32
    CsDeviceNotification = 74_i32
    PlatformRole = 75_i32
    LastResumePerformance = 76_i32
    DisplayBurst = 77_i32
    ExitLatencySamplingPercentage = 78_i32
    RegisterSpmPowerSettings = 79_i32
    PlatformIdleStates = 80_i32
    ProcessorIdleVeto = 81_i32
    PlatformIdleVeto = 82_i32
    SystemBatteryStatePrecise = 83_i32
    ThermalEvent = 84_i32
    PowerRequestActionInternal = 85_i32
    BatteryDeviceState = 86_i32
    PowerInformationInternal = 87_i32
    ThermalStandby = 88_i32
    SystemHiberFileType = 89_i32
    PhysicalPowerButtonPress = 90_i32
    QueryPotentialDripsConstraint = 91_i32
    EnergyTrackerCreate = 92_i32
    EnergyTrackerQuery = 93_i32
    UpdateBlackBoxRecorder = 94_i32
    SessionAllowExternalDmaDevices = 95_i32
    SendSuspendResumeNotification = 96_i32
    PowerInformationLevelMaximum = 97_i32
  end
  enum SYSTEM_POWER_CONDITION
    PoAc = 0_i32
    PoDc = 1_i32
    PoHot = 2_i32
    PoConditionMaximum = 3_i32
  end
  enum POWER_PLATFORM_ROLE
    PlatformRoleUnspecified = 0_i32
    PlatformRoleDesktop = 1_i32
    PlatformRoleMobile = 2_i32
    PlatformRoleWorkstation = 3_i32
    PlatformRoleEnterpriseServer = 4_i32
    PlatformRoleSOHOServer = 5_i32
    PlatformRoleAppliancePC = 6_i32
    PlatformRolePerformanceServer = 7_i32
    PlatformRoleSlate = 8_i32
    PlatformRoleMaximum = 9_i32
  end

  @[Extern]
  record PROCESSOR_POWER_INFORMATION,
    number : UInt64,
    max_mhz : UInt64,
    current_mhz : UInt64,
    mhz_limit : UInt64,
    max_idle_state : UInt64,
    current_idle_state : UInt64

  @[Extern]
  record SYSTEM_POWER_INFORMATION,
    max_idleness_allowed : UInt64,
    idleness : UInt64,
    time_remaining : UInt64,
    cooling_mode : Win32cr::System::Power::POWER_COOLING_MODE

  @[Extern]
  record GLOBAL_MACHINE_POWER_POLICY,
    revision : UInt32,
    lid_open_wake_ac : Win32cr::System::Power::SYSTEM_POWER_STATE,
    lid_open_wake_dc : Win32cr::System::Power::SYSTEM_POWER_STATE,
    broadcast_capacity_resolution : UInt32

  @[Extern]
  record GLOBAL_USER_POWER_POLICY,
    revision : UInt32,
    power_button_ac : Win32cr::System::Power::POWER_ACTION_POLICY,
    power_button_dc : Win32cr::System::Power::POWER_ACTION_POLICY,
    sleep_button_ac : Win32cr::System::Power::POWER_ACTION_POLICY,
    sleep_button_dc : Win32cr::System::Power::POWER_ACTION_POLICY,
    lid_close_ac : Win32cr::System::Power::POWER_ACTION_POLICY,
    lid_close_dc : Win32cr::System::Power::POWER_ACTION_POLICY,
    discharge_policy : Win32cr::System::Power::SYSTEM_POWER_LEVEL[4],
    global_flags : UInt32

  @[Extern]
  record GLOBAL_POWER_POLICY,
    user : Win32cr::System::Power::GLOBAL_USER_POWER_POLICY,
    mach : Win32cr::System::Power::GLOBAL_MACHINE_POWER_POLICY

  @[Extern]
  record MACHINE_POWER_POLICY,
    revision : UInt32,
    min_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE,
    min_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE,
    reduced_latency_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE,
    reduced_latency_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE,
    doze_timeout_ac : UInt32,
    doze_timeout_dc : UInt32,
    doze_s4_timeout_ac : UInt32,
    doze_s4_timeout_dc : UInt32,
    min_throttle_ac : UInt8,
    min_throttle_dc : UInt8,
    pad1 : UInt8[2],
    over_throttled_ac : Win32cr::System::Power::POWER_ACTION_POLICY,
    over_throttled_dc : Win32cr::System::Power::POWER_ACTION_POLICY

  @[Extern]
  record MACHINE_PROCESSOR_POWER_POLICY,
    revision : UInt32,
    processor_policy_ac : Win32cr::System::Power::PROCESSOR_POWER_POLICY,
    processor_policy_dc : Win32cr::System::Power::PROCESSOR_POWER_POLICY

  @[Extern]
  record USER_POWER_POLICY,
    revision : UInt32,
    idle_ac : Win32cr::System::Power::POWER_ACTION_POLICY,
    idle_dc : Win32cr::System::Power::POWER_ACTION_POLICY,
    idle_timeout_ac : UInt32,
    idle_timeout_dc : UInt32,
    idle_sensitivity_ac : UInt8,
    idle_sensitivity_dc : UInt8,
    throttle_policy_ac : UInt8,
    throttle_policy_dc : UInt8,
    max_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE,
    max_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE,
    reserved : UInt32[2],
    video_timeout_ac : UInt32,
    video_timeout_dc : UInt32,
    spindown_timeout_ac : UInt32,
    spindown_timeout_dc : UInt32,
    optimize_for_power_ac : Win32cr::Foundation::BOOLEAN,
    optimize_for_power_dc : Win32cr::Foundation::BOOLEAN,
    fan_throttle_tolerance_ac : UInt8,
    fan_throttle_tolerance_dc : UInt8,
    forced_throttle_ac : UInt8,
    forced_throttle_dc : UInt8

  @[Extern]
  record POWER_POLICY,
    user : Win32cr::System::Power::USER_POWER_POLICY,
    mach : Win32cr::System::Power::MACHINE_POWER_POLICY

  @[Extern]
  record DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS,
    callback : Win32cr::System::Power::PDEVICE_NOTIFY_CALLBACK_ROUTINE,
    context : Void*

  @[Extern]
  record THERMAL_EVENT,
    version : UInt32,
    size : UInt32,
    type__ : UInt32,
    temperature : UInt32,
    trip_point_temperature : UInt32,
    initiator : Win32cr::Foundation::PWSTR

  @[Extern]
  record BATTERY_QUERY_INFORMATION,
    battery_tag : UInt32,
    information_level : Win32cr::System::Power::BATTERY_QUERY_INFORMATION_LEVEL,
    at_rate : UInt32

  @[Extern]
  record BATTERY_INFORMATION,
    capabilities : UInt32,
    technology : UInt8,
    reserved : UInt8[3],
    chemistry : UInt8[4],
    designed_capacity : UInt32,
    full_charged_capacity : UInt32,
    default_alert1 : UInt32,
    default_alert2 : UInt32,
    critical_bias : UInt32,
    cycle_count : UInt32

  @[Extern]
  record BATTERY_CHARGING_SOURCE,
    type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE,
    max_current : UInt32

  @[Extern]
  record BATTERY_CHARGING_SOURCE_INFORMATION,
    type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE,
    source_online : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record BATTERY_SET_INFORMATION,
    battery_tag : UInt32,
    information_level : Win32cr::System::Power::BATTERY_SET_INFORMATION_LEVEL,
    buffer : UInt8*

  @[Extern]
  record BATTERY_CHARGER_STATUS,
    type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE,
    va_data : UInt32*

  @[Extern]
  record BATTERY_USB_CHARGER_STATUS,
    type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE,
    reserved : UInt32,
    flags : UInt32,
    max_current : UInt32,
    voltage : UInt32,
    port_type : Win32cr::System::Power::USB_CHARGER_PORT,
    port_id : UInt64,
    power_source_information : Void*,
    oem_charger : LibC::GUID

  @[Extern]
  record BATTERY_WAIT_STATUS,
    battery_tag : UInt32,
    timeout : UInt32,
    power_state : UInt32,
    low_capacity : UInt32,
    high_capacity : UInt32

  @[Extern]
  record BATTERY_STATUS,
    power_state : UInt32,
    capacity : UInt32,
    voltage : UInt32,
    rate : Int32

  @[Extern]
  record BATTERY_MANUFACTURE_DATE,
    day : UInt8,
    month : UInt8,
    year : UInt16

  @[Extern]
  record THERMAL_INFORMATION,
    thermal_stamp : UInt32,
    thermal_constant1 : UInt32,
    thermal_constant2 : UInt32,
    processors : LibC::UIntPtrT,
    sampling_period : UInt32,
    current_temperature : UInt32,
    passive_trip_point : UInt32,
    critical_trip_point : UInt32,
    active_trip_point_count : UInt8,
    active_trip_point : UInt32[10]

  @[Extern]
  record THERMAL_WAIT_READ,
    timeout : UInt32,
    low_temperature : UInt32,
    high_temperature : UInt32

  @[Extern]
  record THERMAL_POLICY,
    version : UInt32,
    wait_for_update : Win32cr::Foundation::BOOLEAN,
    hibernate : Win32cr::Foundation::BOOLEAN,
    critical : Win32cr::Foundation::BOOLEAN,
    thermal_standby : Win32cr::Foundation::BOOLEAN,
    activation_reasons : UInt32,
    passive_limit : UInt32,
    active_level : UInt32,
    over_throttled : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record PROCESSOR_OBJECT_INFO,
    physical_id : UInt32,
    p_blk_address : UInt32,
    p_blk_length : UInt8

  @[Extern]
  record PROCESSOR_OBJECT_INFO_EX,
    physical_id : UInt32,
    p_blk_address : UInt32,
    p_blk_length : UInt8,
    initial_apic_id : UInt32

  @[Extern]
  record WAKE_ALARM_INFORMATION,
    timer_identifier : UInt32,
    timeout : UInt32

  @[Extern]
  record ACPI_REAL_TIME,
    year : UInt16,
    month : UInt8,
    day : UInt8,
    hour : UInt8,
    minute : UInt8,
    second : UInt8,
    valid : UInt8,
    milliseconds : UInt16,
    time_zone : Int16,
    day_light : UInt8,
    reserved1 : UInt8[3]

  @[Extern]
  record EMI_VERSION,
    emi_version : UInt16

  @[Extern]
  record EMI_METADATA_SIZE,
    metadata_size : UInt32

  @[Extern]
  record EMI_CHANNEL_MEASUREMENT_DATA,
    absolute_energy : UInt64,
    absolute_time : UInt64

  @[Extern]
  record EMI_METADATA_V1,
    measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT,
    hardware_oem : UInt16[16],
    hardware_model : UInt16[16],
    hardware_revision : UInt16,
    metered_hardware_name_size : UInt16,
    metered_hardware_name : UInt16*

  @[Extern]
  record EMI_CHANNEL_V2,
    measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT,
    channel_name_size : UInt16,
    channel_name : UInt16*

  @[Extern]
  record EMI_METADATA_V2,
    hardware_oem : UInt16[16],
    hardware_model : UInt16[16],
    hardware_revision : UInt16,
    channel_count : UInt16,
    channels : Win32cr::System::Power::EMI_CHANNEL_V2*

  @[Extern]
  record EMI_MEASUREMENT_DATA_V2,
    channel_data : Win32cr::System::Power::EMI_CHANNEL_MEASUREMENT_DATA*

  @[Extern]
  record CM_POWER_DATA,
    pd_size : UInt32,
    pd_most_recent_power_state : Win32cr::System::Power::DEVICE_POWER_STATE,
    pd_capabilities : UInt32,
    pd_d1_latency : UInt32,
    pd_d2_latency : UInt32,
    pd_d3_latency : UInt32,
    pd_power_state_mapping : Win32cr::System::Power::DEVICE_POWER_STATE[7],
    pd_deepest_system_wake : Win32cr::System::Power::SYSTEM_POWER_STATE

  @[Extern]
  record SET_POWER_SETTING_VALUE,
    version : UInt32,
    guid : LibC::GUID,
    power_condition : Win32cr::System::Power::SYSTEM_POWER_CONDITION,
    data_length : UInt32,
    data : UInt8*

  @[Extern]
  record BATTERY_REPORTING_SCALE,
    granularity : UInt32,
    capacity : UInt32

  @[Extern]
  record POWER_ACTION_POLICY,
    action : Win32cr::System::Power::POWER_ACTION,
    flags : UInt32,
    event_code : Win32cr::System::Power::POWER_ACTION_POLICY_EVENT_CODE

  @[Extern]
  record SYSTEM_POWER_LEVEL,
    enable : Win32cr::Foundation::BOOLEAN,
    spare : UInt8[3],
    battery_level : UInt32,
    power_policy : Win32cr::System::Power::POWER_ACTION_POLICY,
    min_system_state : Win32cr::System::Power::SYSTEM_POWER_STATE

  @[Extern]
  record SYSTEM_POWER_POLICY,
    revision : UInt32,
    power_button : Win32cr::System::Power::POWER_ACTION_POLICY,
    sleep_button : Win32cr::System::Power::POWER_ACTION_POLICY,
    lid_close : Win32cr::System::Power::POWER_ACTION_POLICY,
    lid_open_wake : Win32cr::System::Power::SYSTEM_POWER_STATE,
    reserved : UInt32,
    idle : Win32cr::System::Power::POWER_ACTION_POLICY,
    idle_timeout : UInt32,
    idle_sensitivity : UInt8,
    dynamic_throttle : UInt8,
    spare2 : UInt8[2],
    min_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE,
    max_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE,
    reduced_latency_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE,
    win_logon_flags : UInt32,
    spare3 : UInt32,
    doze_s4_timeout : UInt32,
    broadcast_capacity_resolution : UInt32,
    discharge_policy : Win32cr::System::Power::SYSTEM_POWER_LEVEL[4],
    video_timeout : UInt32,
    video_dim_display : Win32cr::Foundation::BOOLEAN,
    video_reserved : UInt32[3],
    spindown_timeout : UInt32,
    optimize_for_power : Win32cr::Foundation::BOOLEAN,
    fan_throttle_tolerance : UInt8,
    forced_throttle : UInt8,
    min_throttle : UInt8,
    over_throttled : Win32cr::System::Power::POWER_ACTION_POLICY

  @[Extern]
  record PROCESSOR_POWER_POLICY_INFO,
    time_check : UInt32,
    demote_limit : UInt32,
    promote_limit : UInt32,
    demote_percent : UInt8,
    promote_percent : UInt8,
    spare : UInt8[2],
    _bitfield : UInt32

  @[Extern]
  record PROCESSOR_POWER_POLICY,
    revision : UInt32,
    dynamic_throttle : UInt8,
    spare : UInt8[3],
    _bitfield : UInt32,
    policy_count : UInt32,
    policy : Win32cr::System::Power::PROCESSOR_POWER_POLICY_INFO[3]

  @[Extern]
  record ADMINISTRATOR_POWER_POLICY,
    min_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE,
    max_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE,
    min_video_timeout : UInt32,
    max_video_timeout : UInt32,
    min_spindown_timeout : UInt32,
    max_spindown_timeout : UInt32

  @[Extern]
  record SYSTEM_POWER_CAPABILITIES,
    power_button_present : Win32cr::Foundation::BOOLEAN,
    sleep_button_present : Win32cr::Foundation::BOOLEAN,
    lid_present : Win32cr::Foundation::BOOLEAN,
    system_s1 : Win32cr::Foundation::BOOLEAN,
    system_s2 : Win32cr::Foundation::BOOLEAN,
    system_s3 : Win32cr::Foundation::BOOLEAN,
    system_s4 : Win32cr::Foundation::BOOLEAN,
    system_s5 : Win32cr::Foundation::BOOLEAN,
    hiber_file_present : Win32cr::Foundation::BOOLEAN,
    full_wake : Win32cr::Foundation::BOOLEAN,
    video_dim_present : Win32cr::Foundation::BOOLEAN,
    apm_present : Win32cr::Foundation::BOOLEAN,
    ups_present : Win32cr::Foundation::BOOLEAN,
    thermal_control : Win32cr::Foundation::BOOLEAN,
    processor_throttle : Win32cr::Foundation::BOOLEAN,
    processor_min_throttle : UInt8,
    processor_max_throttle : UInt8,
    fast_system_s4 : Win32cr::Foundation::BOOLEAN,
    hiberboot : Win32cr::Foundation::BOOLEAN,
    wake_alarm_present : Win32cr::Foundation::BOOLEAN,
    ao_ac : Win32cr::Foundation::BOOLEAN,
    disk_spin_down : Win32cr::Foundation::BOOLEAN,
    hiber_file_type : UInt8,
    ao_ac_connectivity_supported : Win32cr::Foundation::BOOLEAN,
    spare3 : UInt8[6],
    system_batteries_present : Win32cr::Foundation::BOOLEAN,
    batteries_are_short_term : Win32cr::Foundation::BOOLEAN,
    battery_scale : Win32cr::System::Power::BATTERY_REPORTING_SCALE[3],
    ac_on_line_wake : Win32cr::System::Power::SYSTEM_POWER_STATE,
    soft_lid_wake : Win32cr::System::Power::SYSTEM_POWER_STATE,
    rtc_wake : Win32cr::System::Power::SYSTEM_POWER_STATE,
    min_device_wake_state : Win32cr::System::Power::SYSTEM_POWER_STATE,
    default_low_latency_wake : Win32cr::System::Power::SYSTEM_POWER_STATE

  @[Extern]
  record SYSTEM_BATTERY_STATE,
    ac_on_line : Win32cr::Foundation::BOOLEAN,
    battery_present : Win32cr::Foundation::BOOLEAN,
    charging : Win32cr::Foundation::BOOLEAN,
    discharging : Win32cr::Foundation::BOOLEAN,
    spare1 : Win32cr::Foundation::BOOLEAN[3],
    tag : UInt8,
    max_capacity : UInt32,
    remaining_capacity : UInt32,
    rate : UInt32,
    estimated_time : UInt32,
    default_alert1 : UInt32,
    default_alert2 : UInt32

  @[Extern]
  record POWERBROADCAST_SETTING,
    power_setting : LibC::GUID,
    data_length : UInt32,
    data : UInt8*

  @[Extern]
  record SYSTEM_POWER_STATUS,
    ac_line_status : UInt8,
    battery_flag : UInt8,
    battery_life_percent : UInt8,
    system_status_flag : UInt8,
    battery_life_time : UInt32,
    battery_full_life_time : UInt32

  @[Link("powrprof")]
  @[Link("user32")]
  @[Link("kernel32")]
  lib C
    fun CallNtPowerInformation(information_level : Win32cr::System::Power::POWER_INFORMATION_LEVEL, input_buffer : Void*, input_buffer_length : UInt32, output_buffer : Void*, output_buffer_length : UInt32) : Win32cr::Foundation::NTSTATUS

    fun GetPwrCapabilities(lpspc : Win32cr::System::Power::SYSTEM_POWER_CAPABILITIES*) : Win32cr::Foundation::BOOLEAN

    fun PowerDeterminePlatformRoleEx(version : Win32cr::System::Power::POWER_PLATFORM_ROLE_VERSION) : Win32cr::System::Power::POWER_PLATFORM_ROLE

    fun PowerRegisterSuspendResumeNotification(flags : UInt32, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : UInt32

    fun PowerUnregisterSuspendResumeNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : UInt32

    fun PowerReadACValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadDCValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerWriteACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32) : UInt32

    fun PowerWriteDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32) : UInt32

    fun PowerGetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, active_policy_guid : LibC::GUID**) : UInt32

    fun PowerSetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : UInt32

    fun PowerSettingRegisterNotification(setting_guid : LibC::GUID*, flags : Win32cr::System::Power::POWER_SETTING_REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : UInt32

    fun PowerSettingUnregisterNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : UInt32

    fun PowerRegisterForEffectivePowerModeNotifications(version : UInt32, callback : Win32cr::System::Power::EFFECTIVE_POWER_MODE_CALLBACK, context : Void*, registration_handle : Void**) : Win32cr::Foundation::HRESULT

    fun PowerUnregisterFromEffectivePowerModeNotifications(registration_handle : Void*) : Win32cr::Foundation::HRESULT

    fun GetPwrDiskSpindownRange(puiMax : UInt32*, puiMin : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun EnumPwrSchemes(lpfn : Win32cr::System::Power::PWRSCHEMESENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOLEAN

    fun ReadGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun ReadPwrScheme(uiID : UInt32, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun WritePwrScheme(puiID : UInt32*, lpszSchemeName : Win32cr::Foundation::PWSTR, lpszDescription : Win32cr::Foundation::PWSTR, lpScheme : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun WriteGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun DeletePwrScheme(uiID : UInt32) : Win32cr::Foundation::BOOLEAN

    fun GetActivePwrScheme(puiID : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun SetActivePwrScheme(uiID : UInt32, pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun IsPwrSuspendAllowed : Win32cr::Foundation::BOOLEAN

    fun IsPwrHibernateAllowed : Win32cr::Foundation::BOOLEAN

    fun IsPwrShutdownAllowed : Win32cr::Foundation::BOOLEAN

    fun IsAdminOverrideActive(papp : Win32cr::System::Power::ADMINISTRATOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun SetSuspendState(bHibernate : Win32cr::Foundation::BOOLEAN, bForce : Win32cr::Foundation::BOOLEAN, bWakeupEventsDisabled : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN

    fun GetCurrentPowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun CanUserWritePwrScheme : Win32cr::Foundation::BOOLEAN

    fun ReadProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun WriteProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun ValidatePowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    fun PowerIsSettingRangeDefined(sub_key_guid : LibC::GUID*, setting_guid : LibC::GUID*) : Win32cr::Foundation::BOOLEAN

    fun PowerSettingAccessCheckEx(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*, access_type : Win32cr::System::Registry::REG_SAM_FLAGS) : UInt32

    fun PowerSettingAccessCheck(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*) : UInt32

    fun PowerReadACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32*) : UInt32

    fun PowerReadDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32*) : UInt32

    fun PowerReadFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadPossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadPossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadPossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32*) : UInt32

    fun PowerReadValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32*) : UInt32

    fun PowerReadValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32*) : UInt32

    fun PowerReadValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadACDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_default_index : UInt32*) : UInt32

    fun PowerReadDCDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_default_index : UInt32*) : UInt32

    fun PowerReadIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerReadSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    fun PowerWriteFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWriteDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWritePossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWritePossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWritePossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWriteValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32) : UInt32

    fun PowerWriteValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32) : UInt32

    fun PowerWriteValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32) : UInt32

    fun PowerWriteValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWriteACDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_ac_index : UInt32) : UInt32

    fun PowerWriteDCDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_dc_index : UInt32) : UInt32

    fun PowerWriteIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    fun PowerWriteSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, attributes : UInt32) : UInt32

    fun PowerDuplicateScheme(root_power_key : Win32cr::System::Registry::HKEY, source_scheme_guid : LibC::GUID*, destination_scheme_guid : LibC::GUID**) : UInt32

    fun PowerImportPowerScheme(root_power_key : Win32cr::System::Registry::HKEY, import_file_name_path : Win32cr::Foundation::PWSTR, destination_scheme_guid : LibC::GUID**) : UInt32

    fun PowerDeleteScheme(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : UInt32

    fun PowerRemovePowerSetting(power_setting_sub_key_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    fun PowerCreateSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    fun PowerCreatePossibleSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32) : UInt32

    fun PowerEnumerate(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    fun PowerOpenUserPowerKey(phUserPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32

    fun PowerOpenSystemPowerKey(phSystemPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32

    fun PowerCanRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : UInt32

    fun PowerRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : UInt32

    fun PowerRestoreDefaultPowerSchemes : UInt32

    fun PowerReplaceDefaultPowerSchemes : UInt32

    fun PowerDeterminePlatformRole : Win32cr::System::Power::POWER_PLATFORM_ROLE

    fun DevicePowerEnumDevices(query_index : UInt32, query_interpretation_flags : UInt32, query_flags : UInt32, pReturnBuffer : UInt8*, pBufferSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun DevicePowerSetDeviceState(device_description : Win32cr::Foundation::PWSTR, set_flags : UInt32, set_data : Void*) : UInt32

    fun DevicePowerOpen(debug_mask : UInt32) : Win32cr::Foundation::BOOLEAN

    fun DevicePowerClose : Win32cr::Foundation::BOOLEAN

    fun PowerReportThermalEvent(event : Win32cr::System::Power::THERMAL_EVENT*) : UInt32

    fun RegisterPowerSettingNotification(hRecipient : Win32cr::Foundation::HANDLE, power_setting_guid : LibC::GUID*, flags : UInt32) : Win32cr::System::Power::HPOWERNOTIFY

    fun UnregisterPowerSettingNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL

    fun RegisterSuspendResumeNotification(hRecipient : Win32cr::Foundation::HANDLE, flags : UInt32) : Win32cr::System::Power::HPOWERNOTIFY

    fun UnregisterSuspendResumeNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL

    fun RequestWakeupLatency(latency : Win32cr::System::Power::LATENCY_TIME) : Win32cr::Foundation::BOOL

    fun IsSystemResumeAutomatic : Win32cr::Foundation::BOOL

    fun SetThreadExecutionState(esFlags : Win32cr::System::Power::EXECUTION_STATE) : Win32cr::System::Power::EXECUTION_STATE

    fun PowerCreateRequest(context : Win32cr::System::Threading::REASON_CONTEXT*) : Win32cr::Foundation::HANDLE

    fun PowerSetRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL

    fun PowerClearRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL

    fun GetDevicePowerState(hDevice : Win32cr::Foundation::HANDLE, pfOn : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun SetSystemPowerState(fSuspend : Win32cr::Foundation::BOOL, fForce : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun GetSystemPowerStatus(lpSystemPowerStatus : Win32cr::System::Power::SYSTEM_POWER_STATUS*) : Win32cr::Foundation::BOOL

  end
end