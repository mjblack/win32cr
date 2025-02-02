require "./../foundation.cr"
require "./registry.cr"
require "./threading.cr"

module Win32cr::System::Power
  extend self
  alias HPOWERNOTIFY = LibC::IntPtrT
  alias EFFECTIVE_POWER_MODE_CALLBACK = Proc(Win32cr::System::Power::EFFECTIVE_POWER_MODE, Void*, Void)

  alias PWRSCHEMESENUMPROC_V1 = Proc(UInt32, UInt32, Int8*, UInt32, Int8*, Win32cr::System::Power::POWER_POLICY*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOLEAN)

  alias PWRSCHEMESENUMPROC = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::Power::POWER_POLICY*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOLEAN)

  alias PDEVICE_NOTIFY_CALLBACK_ROUTINE = Proc(Void*, UInt32, Void*, UInt32)

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
  struct PROCESSOR_POWER_INFORMATION
    property number : UInt64
    property max_mhz : UInt64
    property current_mhz : UInt64
    property mhz_limit : UInt64
    property max_idle_state : UInt64
    property current_idle_state : UInt64
    def initialize(@number : UInt64, @max_mhz : UInt64, @current_mhz : UInt64, @mhz_limit : UInt64, @max_idle_state : UInt64, @current_idle_state : UInt64)
    end
  end

  @[Extern]
  struct SYSTEM_POWER_INFORMATION
    property max_idleness_allowed : UInt64
    property idleness : UInt64
    property time_remaining : UInt64
    property cooling_mode : Win32cr::System::Power::POWER_COOLING_MODE
    def initialize(@max_idleness_allowed : UInt64, @idleness : UInt64, @time_remaining : UInt64, @cooling_mode : Win32cr::System::Power::POWER_COOLING_MODE)
    end
  end

  @[Extern]
  struct GLOBAL_MACHINE_POWER_POLICY
    property revision : UInt32
    property lid_open_wake_ac : Win32cr::System::Power::SYSTEM_POWER_STATE
    property lid_open_wake_dc : Win32cr::System::Power::SYSTEM_POWER_STATE
    property broadcast_capacity_resolution : UInt32
    def initialize(@revision : UInt32, @lid_open_wake_ac : Win32cr::System::Power::SYSTEM_POWER_STATE, @lid_open_wake_dc : Win32cr::System::Power::SYSTEM_POWER_STATE, @broadcast_capacity_resolution : UInt32)
    end
  end

  @[Extern]
  struct GLOBAL_USER_POWER_POLICY
    property revision : UInt32
    property power_button_ac : Win32cr::System::Power::POWER_ACTION_POLICY
    property power_button_dc : Win32cr::System::Power::POWER_ACTION_POLICY
    property sleep_button_ac : Win32cr::System::Power::POWER_ACTION_POLICY
    property sleep_button_dc : Win32cr::System::Power::POWER_ACTION_POLICY
    property lid_close_ac : Win32cr::System::Power::POWER_ACTION_POLICY
    property lid_close_dc : Win32cr::System::Power::POWER_ACTION_POLICY
    property discharge_policy : Win32cr::System::Power::SYSTEM_POWER_LEVEL[4]
    property global_flags : UInt32
    def initialize(@revision : UInt32, @power_button_ac : Win32cr::System::Power::POWER_ACTION_POLICY, @power_button_dc : Win32cr::System::Power::POWER_ACTION_POLICY, @sleep_button_ac : Win32cr::System::Power::POWER_ACTION_POLICY, @sleep_button_dc : Win32cr::System::Power::POWER_ACTION_POLICY, @lid_close_ac : Win32cr::System::Power::POWER_ACTION_POLICY, @lid_close_dc : Win32cr::System::Power::POWER_ACTION_POLICY, @discharge_policy : Win32cr::System::Power::SYSTEM_POWER_LEVEL[4], @global_flags : UInt32)
    end
  end

  @[Extern]
  struct GLOBAL_POWER_POLICY
    property user : Win32cr::System::Power::GLOBAL_USER_POWER_POLICY
    property mach : Win32cr::System::Power::GLOBAL_MACHINE_POWER_POLICY
    def initialize(@user : Win32cr::System::Power::GLOBAL_USER_POWER_POLICY, @mach : Win32cr::System::Power::GLOBAL_MACHINE_POWER_POLICY)
    end
  end

  @[Extern]
  struct MACHINE_POWER_POLICY
    property revision : UInt32
    property min_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE
    property min_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE
    property reduced_latency_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE
    property reduced_latency_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE
    property doze_timeout_ac : UInt32
    property doze_timeout_dc : UInt32
    property doze_s4_timeout_ac : UInt32
    property doze_s4_timeout_dc : UInt32
    property min_throttle_ac : UInt8
    property min_throttle_dc : UInt8
    property pad1 : UInt8[2]
    property over_throttled_ac : Win32cr::System::Power::POWER_ACTION_POLICY
    property over_throttled_dc : Win32cr::System::Power::POWER_ACTION_POLICY
    def initialize(@revision : UInt32, @min_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE, @min_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE, @reduced_latency_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE, @reduced_latency_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE, @doze_timeout_ac : UInt32, @doze_timeout_dc : UInt32, @doze_s4_timeout_ac : UInt32, @doze_s4_timeout_dc : UInt32, @min_throttle_ac : UInt8, @min_throttle_dc : UInt8, @pad1 : UInt8[2], @over_throttled_ac : Win32cr::System::Power::POWER_ACTION_POLICY, @over_throttled_dc : Win32cr::System::Power::POWER_ACTION_POLICY)
    end
  end

  @[Extern]
  struct MACHINE_PROCESSOR_POWER_POLICY
    property revision : UInt32
    property processor_policy_ac : Win32cr::System::Power::PROCESSOR_POWER_POLICY
    property processor_policy_dc : Win32cr::System::Power::PROCESSOR_POWER_POLICY
    def initialize(@revision : UInt32, @processor_policy_ac : Win32cr::System::Power::PROCESSOR_POWER_POLICY, @processor_policy_dc : Win32cr::System::Power::PROCESSOR_POWER_POLICY)
    end
  end

  @[Extern]
  struct USER_POWER_POLICY
    property revision : UInt32
    property idle_ac : Win32cr::System::Power::POWER_ACTION_POLICY
    property idle_dc : Win32cr::System::Power::POWER_ACTION_POLICY
    property idle_timeout_ac : UInt32
    property idle_timeout_dc : UInt32
    property idle_sensitivity_ac : UInt8
    property idle_sensitivity_dc : UInt8
    property throttle_policy_ac : UInt8
    property throttle_policy_dc : UInt8
    property max_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE
    property max_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE
    property reserved : UInt32[2]
    property video_timeout_ac : UInt32
    property video_timeout_dc : UInt32
    property spindown_timeout_ac : UInt32
    property spindown_timeout_dc : UInt32
    property optimize_for_power_ac : Win32cr::Foundation::BOOLEAN
    property optimize_for_power_dc : Win32cr::Foundation::BOOLEAN
    property fan_throttle_tolerance_ac : UInt8
    property fan_throttle_tolerance_dc : UInt8
    property forced_throttle_ac : UInt8
    property forced_throttle_dc : UInt8
    def initialize(@revision : UInt32, @idle_ac : Win32cr::System::Power::POWER_ACTION_POLICY, @idle_dc : Win32cr::System::Power::POWER_ACTION_POLICY, @idle_timeout_ac : UInt32, @idle_timeout_dc : UInt32, @idle_sensitivity_ac : UInt8, @idle_sensitivity_dc : UInt8, @throttle_policy_ac : UInt8, @throttle_policy_dc : UInt8, @max_sleep_ac : Win32cr::System::Power::SYSTEM_POWER_STATE, @max_sleep_dc : Win32cr::System::Power::SYSTEM_POWER_STATE, @reserved : UInt32[2], @video_timeout_ac : UInt32, @video_timeout_dc : UInt32, @spindown_timeout_ac : UInt32, @spindown_timeout_dc : UInt32, @optimize_for_power_ac : Win32cr::Foundation::BOOLEAN, @optimize_for_power_dc : Win32cr::Foundation::BOOLEAN, @fan_throttle_tolerance_ac : UInt8, @fan_throttle_tolerance_dc : UInt8, @forced_throttle_ac : UInt8, @forced_throttle_dc : UInt8)
    end
  end

  @[Extern]
  struct POWER_POLICY
    property user : Win32cr::System::Power::USER_POWER_POLICY
    property mach : Win32cr::System::Power::MACHINE_POWER_POLICY
    def initialize(@user : Win32cr::System::Power::USER_POWER_POLICY, @mach : Win32cr::System::Power::MACHINE_POWER_POLICY)
    end
  end

  @[Extern]
  struct DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS
    property callback : Win32cr::System::Power::PDEVICE_NOTIFY_CALLBACK_ROUTINE
    property context : Void*
    def initialize(@callback : Win32cr::System::Power::PDEVICE_NOTIFY_CALLBACK_ROUTINE, @context : Void*)
    end
  end

  @[Extern]
  struct THERMAL_EVENT
    property version : UInt32
    property size : UInt32
    property type__ : UInt32
    property temperature : UInt32
    property trip_point_temperature : UInt32
    property initiator : Win32cr::Foundation::PWSTR
    def initialize(@version : UInt32, @size : UInt32, @type__ : UInt32, @temperature : UInt32, @trip_point_temperature : UInt32, @initiator : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct BATTERY_QUERY_INFORMATION
    property battery_tag : UInt32
    property information_level : Win32cr::System::Power::BATTERY_QUERY_INFORMATION_LEVEL
    property at_rate : UInt32
    def initialize(@battery_tag : UInt32, @information_level : Win32cr::System::Power::BATTERY_QUERY_INFORMATION_LEVEL, @at_rate : UInt32)
    end
  end

  @[Extern]
  struct BATTERY_INFORMATION
    property capabilities : UInt32
    property technology : UInt8
    property reserved : UInt8[3]
    property chemistry : UInt8[4]
    property designed_capacity : UInt32
    property full_charged_capacity : UInt32
    property default_alert1 : UInt32
    property default_alert2 : UInt32
    property critical_bias : UInt32
    property cycle_count : UInt32
    def initialize(@capabilities : UInt32, @technology : UInt8, @reserved : UInt8[3], @chemistry : UInt8[4], @designed_capacity : UInt32, @full_charged_capacity : UInt32, @default_alert1 : UInt32, @default_alert2 : UInt32, @critical_bias : UInt32, @cycle_count : UInt32)
    end
  end

  @[Extern]
  struct BATTERY_CHARGING_SOURCE
    property type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE
    property max_current : UInt32
    def initialize(@type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE, @max_current : UInt32)
    end
  end

  @[Extern]
  struct BATTERY_CHARGING_SOURCE_INFORMATION
    property type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE
    property source_online : Win32cr::Foundation::BOOLEAN
    def initialize(@type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE, @source_online : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct BATTERY_SET_INFORMATION
    property battery_tag : UInt32
    property information_level : Win32cr::System::Power::BATTERY_SET_INFORMATION_LEVEL
    property buffer : UInt8*
    def initialize(@battery_tag : UInt32, @information_level : Win32cr::System::Power::BATTERY_SET_INFORMATION_LEVEL, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct BATTERY_CHARGER_STATUS
    property type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE
    property va_data : UInt32*
    def initialize(@type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE, @va_data : UInt32*)
    end
  end

  @[Extern]
  struct BATTERY_USB_CHARGER_STATUS
    property type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE
    property reserved : UInt32
    property flags : UInt32
    property max_current : UInt32
    property voltage : UInt32
    property port_type : Win32cr::System::Power::USB_CHARGER_PORT
    property port_id : UInt64
    property power_source_information : Void*
    property oem_charger : LibC::GUID
    def initialize(@type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE, @reserved : UInt32, @flags : UInt32, @max_current : UInt32, @voltage : UInt32, @port_type : Win32cr::System::Power::USB_CHARGER_PORT, @port_id : UInt64, @power_source_information : Void*, @oem_charger : LibC::GUID)
    end
  end

  @[Extern]
  struct BATTERY_WAIT_STATUS
    property battery_tag : UInt32
    property timeout : UInt32
    property power_state : UInt32
    property low_capacity : UInt32
    property high_capacity : UInt32
    def initialize(@battery_tag : UInt32, @timeout : UInt32, @power_state : UInt32, @low_capacity : UInt32, @high_capacity : UInt32)
    end
  end

  @[Extern]
  struct BATTERY_STATUS
    property power_state : UInt32
    property capacity : UInt32
    property voltage : UInt32
    property rate : Int32
    def initialize(@power_state : UInt32, @capacity : UInt32, @voltage : UInt32, @rate : Int32)
    end
  end

  @[Extern]
  struct BATTERY_MANUFACTURE_DATE
    property day : UInt8
    property month : UInt8
    property year : UInt16
    def initialize(@day : UInt8, @month : UInt8, @year : UInt16)
    end
  end

  @[Extern]
  struct THERMAL_INFORMATION
    property thermal_stamp : UInt32
    property thermal_constant1 : UInt32
    property thermal_constant2 : UInt32
    property processors : LibC::UIntPtrT
    property sampling_period : UInt32
    property current_temperature : UInt32
    property passive_trip_point : UInt32
    property critical_trip_point : UInt32
    property active_trip_point_count : UInt8
    property active_trip_point : UInt32[10]
    def initialize(@thermal_stamp : UInt32, @thermal_constant1 : UInt32, @thermal_constant2 : UInt32, @processors : LibC::UIntPtrT, @sampling_period : UInt32, @current_temperature : UInt32, @passive_trip_point : UInt32, @critical_trip_point : UInt32, @active_trip_point_count : UInt8, @active_trip_point : UInt32[10])
    end
  end

  @[Extern]
  struct THERMAL_WAIT_READ
    property timeout : UInt32
    property low_temperature : UInt32
    property high_temperature : UInt32
    def initialize(@timeout : UInt32, @low_temperature : UInt32, @high_temperature : UInt32)
    end
  end

  @[Extern]
  struct THERMAL_POLICY
    property version : UInt32
    property wait_for_update : Win32cr::Foundation::BOOLEAN
    property hibernate : Win32cr::Foundation::BOOLEAN
    property critical : Win32cr::Foundation::BOOLEAN
    property thermal_standby : Win32cr::Foundation::BOOLEAN
    property activation_reasons : UInt32
    property passive_limit : UInt32
    property active_level : UInt32
    property over_throttled : Win32cr::Foundation::BOOLEAN
    def initialize(@version : UInt32, @wait_for_update : Win32cr::Foundation::BOOLEAN, @hibernate : Win32cr::Foundation::BOOLEAN, @critical : Win32cr::Foundation::BOOLEAN, @thermal_standby : Win32cr::Foundation::BOOLEAN, @activation_reasons : UInt32, @passive_limit : UInt32, @active_level : UInt32, @over_throttled : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct PROCESSOR_OBJECT_INFO
    property physical_id : UInt32
    property p_blk_address : UInt32
    property p_blk_length : UInt8
    def initialize(@physical_id : UInt32, @p_blk_address : UInt32, @p_blk_length : UInt8)
    end
  end

  @[Extern]
  struct PROCESSOR_OBJECT_INFO_EX
    property physical_id : UInt32
    property p_blk_address : UInt32
    property p_blk_length : UInt8
    property initial_apic_id : UInt32
    def initialize(@physical_id : UInt32, @p_blk_address : UInt32, @p_blk_length : UInt8, @initial_apic_id : UInt32)
    end
  end

  @[Extern]
  struct WAKE_ALARM_INFORMATION
    property timer_identifier : UInt32
    property timeout : UInt32
    def initialize(@timer_identifier : UInt32, @timeout : UInt32)
    end
  end

  @[Extern]
  struct ACPI_REAL_TIME
    property year : UInt16
    property month : UInt8
    property day : UInt8
    property hour : UInt8
    property minute : UInt8
    property second : UInt8
    property valid : UInt8
    property milliseconds : UInt16
    property time_zone : Int16
    property day_light : UInt8
    property reserved1 : UInt8[3]
    def initialize(@year : UInt16, @month : UInt8, @day : UInt8, @hour : UInt8, @minute : UInt8, @second : UInt8, @valid : UInt8, @milliseconds : UInt16, @time_zone : Int16, @day_light : UInt8, @reserved1 : UInt8[3])
    end
  end

  @[Extern]
  struct EMI_VERSION
    property emi_version : UInt16
    def initialize(@emi_version : UInt16)
    end
  end

  @[Extern]
  struct EMI_METADATA_SIZE
    property metadata_size : UInt32
    def initialize(@metadata_size : UInt32)
    end
  end

  @[Extern]
  struct EMI_CHANNEL_MEASUREMENT_DATA
    property absolute_energy : UInt64
    property absolute_time : UInt64
    def initialize(@absolute_energy : UInt64, @absolute_time : UInt64)
    end
  end

  @[Extern]
  struct EMI_METADATA_V1
    property measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT
    property hardware_oem : UInt16[16]
    property hardware_model : UInt16[16]
    property hardware_revision : UInt16
    property metered_hardware_name_size : UInt16
    property metered_hardware_name : UInt16*
    def initialize(@measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT, @hardware_oem : UInt16[16], @hardware_model : UInt16[16], @hardware_revision : UInt16, @metered_hardware_name_size : UInt16, @metered_hardware_name : UInt16*)
    end
  end

  @[Extern]
  struct EMI_CHANNEL_V2
    property measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT
    property channel_name_size : UInt16
    property channel_name : UInt16*
    def initialize(@measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT, @channel_name_size : UInt16, @channel_name : UInt16*)
    end
  end

  @[Extern]
  struct EMI_METADATA_V2
    property hardware_oem : UInt16[16]
    property hardware_model : UInt16[16]
    property hardware_revision : UInt16
    property channel_count : UInt16
    property channels : Win32cr::System::Power::EMI_CHANNEL_V2*
    def initialize(@hardware_oem : UInt16[16], @hardware_model : UInt16[16], @hardware_revision : UInt16, @channel_count : UInt16, @channels : Win32cr::System::Power::EMI_CHANNEL_V2*)
    end
  end

  @[Extern]
  struct EMI_MEASUREMENT_DATA_V2
    property channel_data : Win32cr::System::Power::EMI_CHANNEL_MEASUREMENT_DATA*
    def initialize(@channel_data : Win32cr::System::Power::EMI_CHANNEL_MEASUREMENT_DATA*)
    end
  end

  @[Extern]
  struct CM_POWER_DATA
    property pd_size : UInt32
    property pd_most_recent_power_state : Win32cr::System::Power::DEVICE_POWER_STATE
    property pd_capabilities : UInt32
    property pd_d1_latency : UInt32
    property pd_d2_latency : UInt32
    property pd_d3_latency : UInt32
    property pd_power_state_mapping : Win32cr::System::Power::DEVICE_POWER_STATE[7]
    property pd_deepest_system_wake : Win32cr::System::Power::SYSTEM_POWER_STATE
    def initialize(@pd_size : UInt32, @pd_most_recent_power_state : Win32cr::System::Power::DEVICE_POWER_STATE, @pd_capabilities : UInt32, @pd_d1_latency : UInt32, @pd_d2_latency : UInt32, @pd_d3_latency : UInt32, @pd_power_state_mapping : Win32cr::System::Power::DEVICE_POWER_STATE[7], @pd_deepest_system_wake : Win32cr::System::Power::SYSTEM_POWER_STATE)
    end
  end

  @[Extern]
  struct SET_POWER_SETTING_VALUE
    property version : UInt32
    property guid : LibC::GUID
    property power_condition : Win32cr::System::Power::SYSTEM_POWER_CONDITION
    property data_length : UInt32
    property data : UInt8*
    def initialize(@version : UInt32, @guid : LibC::GUID, @power_condition : Win32cr::System::Power::SYSTEM_POWER_CONDITION, @data_length : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct BATTERY_REPORTING_SCALE
    property granularity : UInt32
    property capacity : UInt32
    def initialize(@granularity : UInt32, @capacity : UInt32)
    end
  end

  @[Extern]
  struct POWER_ACTION_POLICY
    property action : Win32cr::System::Power::POWER_ACTION
    property flags : UInt32
    property event_code : Win32cr::System::Power::POWER_ACTION_POLICY_EVENT_CODE
    def initialize(@action : Win32cr::System::Power::POWER_ACTION, @flags : UInt32, @event_code : Win32cr::System::Power::POWER_ACTION_POLICY_EVENT_CODE)
    end
  end

  @[Extern]
  struct SYSTEM_POWER_LEVEL
    property enable : Win32cr::Foundation::BOOLEAN
    property spare : UInt8[3]
    property battery_level : UInt32
    property power_policy : Win32cr::System::Power::POWER_ACTION_POLICY
    property min_system_state : Win32cr::System::Power::SYSTEM_POWER_STATE
    def initialize(@enable : Win32cr::Foundation::BOOLEAN, @spare : UInt8[3], @battery_level : UInt32, @power_policy : Win32cr::System::Power::POWER_ACTION_POLICY, @min_system_state : Win32cr::System::Power::SYSTEM_POWER_STATE)
    end
  end

  @[Extern]
  struct SYSTEM_POWER_POLICY
    property revision : UInt32
    property power_button : Win32cr::System::Power::POWER_ACTION_POLICY
    property sleep_button : Win32cr::System::Power::POWER_ACTION_POLICY
    property lid_close : Win32cr::System::Power::POWER_ACTION_POLICY
    property lid_open_wake : Win32cr::System::Power::SYSTEM_POWER_STATE
    property reserved : UInt32
    property idle : Win32cr::System::Power::POWER_ACTION_POLICY
    property idle_timeout : UInt32
    property idle_sensitivity : UInt8
    property dynamic_throttle : UInt8
    property spare2 : UInt8[2]
    property min_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE
    property max_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE
    property reduced_latency_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE
    property win_logon_flags : UInt32
    property spare3 : UInt32
    property doze_s4_timeout : UInt32
    property broadcast_capacity_resolution : UInt32
    property discharge_policy : Win32cr::System::Power::SYSTEM_POWER_LEVEL[4]
    property video_timeout : UInt32
    property video_dim_display : Win32cr::Foundation::BOOLEAN
    property video_reserved : UInt32[3]
    property spindown_timeout : UInt32
    property optimize_for_power : Win32cr::Foundation::BOOLEAN
    property fan_throttle_tolerance : UInt8
    property forced_throttle : UInt8
    property min_throttle : UInt8
    property over_throttled : Win32cr::System::Power::POWER_ACTION_POLICY
    def initialize(@revision : UInt32, @power_button : Win32cr::System::Power::POWER_ACTION_POLICY, @sleep_button : Win32cr::System::Power::POWER_ACTION_POLICY, @lid_close : Win32cr::System::Power::POWER_ACTION_POLICY, @lid_open_wake : Win32cr::System::Power::SYSTEM_POWER_STATE, @reserved : UInt32, @idle : Win32cr::System::Power::POWER_ACTION_POLICY, @idle_timeout : UInt32, @idle_sensitivity : UInt8, @dynamic_throttle : UInt8, @spare2 : UInt8[2], @min_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE, @max_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE, @reduced_latency_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE, @win_logon_flags : UInt32, @spare3 : UInt32, @doze_s4_timeout : UInt32, @broadcast_capacity_resolution : UInt32, @discharge_policy : Win32cr::System::Power::SYSTEM_POWER_LEVEL[4], @video_timeout : UInt32, @video_dim_display : Win32cr::Foundation::BOOLEAN, @video_reserved : UInt32[3], @spindown_timeout : UInt32, @optimize_for_power : Win32cr::Foundation::BOOLEAN, @fan_throttle_tolerance : UInt8, @forced_throttle : UInt8, @min_throttle : UInt8, @over_throttled : Win32cr::System::Power::POWER_ACTION_POLICY)
    end
  end

  @[Extern]
  struct PROCESSOR_POWER_POLICY_INFO
    property time_check : UInt32
    property demote_limit : UInt32
    property promote_limit : UInt32
    property demote_percent : UInt8
    property promote_percent : UInt8
    property spare : UInt8[2]
    property _bitfield : UInt32
    def initialize(@time_check : UInt32, @demote_limit : UInt32, @promote_limit : UInt32, @demote_percent : UInt8, @promote_percent : UInt8, @spare : UInt8[2], @_bitfield : UInt32)
    end
  end

  @[Extern]
  struct PROCESSOR_POWER_POLICY
    property revision : UInt32
    property dynamic_throttle : UInt8
    property spare : UInt8[3]
    property _bitfield : UInt32
    property policy_count : UInt32
    property policy : Win32cr::System::Power::PROCESSOR_POWER_POLICY_INFO[3]
    def initialize(@revision : UInt32, @dynamic_throttle : UInt8, @spare : UInt8[3], @_bitfield : UInt32, @policy_count : UInt32, @policy : Win32cr::System::Power::PROCESSOR_POWER_POLICY_INFO[3])
    end
  end

  @[Extern]
  struct ADMINISTRATOR_POWER_POLICY
    property min_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE
    property max_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE
    property min_video_timeout : UInt32
    property max_video_timeout : UInt32
    property min_spindown_timeout : UInt32
    property max_spindown_timeout : UInt32
    def initialize(@min_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE, @max_sleep : Win32cr::System::Power::SYSTEM_POWER_STATE, @min_video_timeout : UInt32, @max_video_timeout : UInt32, @min_spindown_timeout : UInt32, @max_spindown_timeout : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_POWER_CAPABILITIES
    property power_button_present : Win32cr::Foundation::BOOLEAN
    property sleep_button_present : Win32cr::Foundation::BOOLEAN
    property lid_present : Win32cr::Foundation::BOOLEAN
    property system_s1 : Win32cr::Foundation::BOOLEAN
    property system_s2 : Win32cr::Foundation::BOOLEAN
    property system_s3 : Win32cr::Foundation::BOOLEAN
    property system_s4 : Win32cr::Foundation::BOOLEAN
    property system_s5 : Win32cr::Foundation::BOOLEAN
    property hiber_file_present : Win32cr::Foundation::BOOLEAN
    property full_wake : Win32cr::Foundation::BOOLEAN
    property video_dim_present : Win32cr::Foundation::BOOLEAN
    property apm_present : Win32cr::Foundation::BOOLEAN
    property ups_present : Win32cr::Foundation::BOOLEAN
    property thermal_control : Win32cr::Foundation::BOOLEAN
    property processor_throttle : Win32cr::Foundation::BOOLEAN
    property processor_min_throttle : UInt8
    property processor_max_throttle : UInt8
    property fast_system_s4 : Win32cr::Foundation::BOOLEAN
    property hiberboot : Win32cr::Foundation::BOOLEAN
    property wake_alarm_present : Win32cr::Foundation::BOOLEAN
    property ao_ac : Win32cr::Foundation::BOOLEAN
    property disk_spin_down : Win32cr::Foundation::BOOLEAN
    property hiber_file_type : UInt8
    property ao_ac_connectivity_supported : Win32cr::Foundation::BOOLEAN
    property spare3 : UInt8[6]
    property system_batteries_present : Win32cr::Foundation::BOOLEAN
    property batteries_are_short_term : Win32cr::Foundation::BOOLEAN
    property battery_scale : Win32cr::System::Power::BATTERY_REPORTING_SCALE[3]
    property ac_on_line_wake : Win32cr::System::Power::SYSTEM_POWER_STATE
    property soft_lid_wake : Win32cr::System::Power::SYSTEM_POWER_STATE
    property rtc_wake : Win32cr::System::Power::SYSTEM_POWER_STATE
    property min_device_wake_state : Win32cr::System::Power::SYSTEM_POWER_STATE
    property default_low_latency_wake : Win32cr::System::Power::SYSTEM_POWER_STATE
    def initialize(@power_button_present : Win32cr::Foundation::BOOLEAN, @sleep_button_present : Win32cr::Foundation::BOOLEAN, @lid_present : Win32cr::Foundation::BOOLEAN, @system_s1 : Win32cr::Foundation::BOOLEAN, @system_s2 : Win32cr::Foundation::BOOLEAN, @system_s3 : Win32cr::Foundation::BOOLEAN, @system_s4 : Win32cr::Foundation::BOOLEAN, @system_s5 : Win32cr::Foundation::BOOLEAN, @hiber_file_present : Win32cr::Foundation::BOOLEAN, @full_wake : Win32cr::Foundation::BOOLEAN, @video_dim_present : Win32cr::Foundation::BOOLEAN, @apm_present : Win32cr::Foundation::BOOLEAN, @ups_present : Win32cr::Foundation::BOOLEAN, @thermal_control : Win32cr::Foundation::BOOLEAN, @processor_throttle : Win32cr::Foundation::BOOLEAN, @processor_min_throttle : UInt8, @processor_max_throttle : UInt8, @fast_system_s4 : Win32cr::Foundation::BOOLEAN, @hiberboot : Win32cr::Foundation::BOOLEAN, @wake_alarm_present : Win32cr::Foundation::BOOLEAN, @ao_ac : Win32cr::Foundation::BOOLEAN, @disk_spin_down : Win32cr::Foundation::BOOLEAN, @hiber_file_type : UInt8, @ao_ac_connectivity_supported : Win32cr::Foundation::BOOLEAN, @spare3 : UInt8[6], @system_batteries_present : Win32cr::Foundation::BOOLEAN, @batteries_are_short_term : Win32cr::Foundation::BOOLEAN, @battery_scale : Win32cr::System::Power::BATTERY_REPORTING_SCALE[3], @ac_on_line_wake : Win32cr::System::Power::SYSTEM_POWER_STATE, @soft_lid_wake : Win32cr::System::Power::SYSTEM_POWER_STATE, @rtc_wake : Win32cr::System::Power::SYSTEM_POWER_STATE, @min_device_wake_state : Win32cr::System::Power::SYSTEM_POWER_STATE, @default_low_latency_wake : Win32cr::System::Power::SYSTEM_POWER_STATE)
    end
  end

  @[Extern]
  struct SYSTEM_BATTERY_STATE
    property ac_on_line : Win32cr::Foundation::BOOLEAN
    property battery_present : Win32cr::Foundation::BOOLEAN
    property charging : Win32cr::Foundation::BOOLEAN
    property discharging : Win32cr::Foundation::BOOLEAN
    property spare1 : Win32cr::Foundation::BOOLEAN[3]
    property tag : UInt8
    property max_capacity : UInt32
    property remaining_capacity : UInt32
    property rate : UInt32
    property estimated_time : UInt32
    property default_alert1 : UInt32
    property default_alert2 : UInt32
    def initialize(@ac_on_line : Win32cr::Foundation::BOOLEAN, @battery_present : Win32cr::Foundation::BOOLEAN, @charging : Win32cr::Foundation::BOOLEAN, @discharging : Win32cr::Foundation::BOOLEAN, @spare1 : Win32cr::Foundation::BOOLEAN[3], @tag : UInt8, @max_capacity : UInt32, @remaining_capacity : UInt32, @rate : UInt32, @estimated_time : UInt32, @default_alert1 : UInt32, @default_alert2 : UInt32)
    end
  end

  @[Extern]
  struct POWERBROADCAST_SETTING
    property power_setting : LibC::GUID
    property data_length : UInt32
    property data : UInt8*
    def initialize(@power_setting : LibC::GUID, @data_length : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct SYSTEM_POWER_STATUS
    property ac_line_status : UInt8
    property battery_flag : UInt8
    property battery_life_percent : UInt8
    property system_status_flag : UInt8
    property battery_life_time : UInt32
    property battery_full_life_time : UInt32
    def initialize(@ac_line_status : UInt8, @battery_flag : UInt8, @battery_life_percent : UInt8, @system_status_flag : UInt8, @battery_life_time : UInt32, @battery_full_life_time : UInt32)
    end
  end

  def callNtPowerInformation(information_level : Win32cr::System::Power::POWER_INFORMATION_LEVEL, input_buffer : Void*, input_buffer_length : UInt32, output_buffer : Void*, output_buffer_length : UInt32) : Win32cr::Foundation::NTSTATUS
    C.CallNtPowerInformation(information_level, input_buffer, input_buffer_length, output_buffer, output_buffer_length)
  end

  def getPwrCapabilities(lpspc : Win32cr::System::Power::SYSTEM_POWER_CAPABILITIES*) : Win32cr::Foundation::BOOLEAN
    C.GetPwrCapabilities(lpspc)
  end

  def powerDeterminePlatformRoleEx(version : Win32cr::System::Power::POWER_PLATFORM_ROLE_VERSION) : Win32cr::System::Power::POWER_PLATFORM_ROLE
    C.PowerDeterminePlatformRoleEx(version)
  end

  def powerRegisterSuspendResumeNotification(flags : UInt32, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : UInt32
    C.PowerRegisterSuspendResumeNotification(flags, recipient, registration_handle)
  end

  def powerUnregisterSuspendResumeNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : UInt32
    C.PowerUnregisterSuspendResumeNotification(registration_handle)
  end

  def powerReadACValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadACValue(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, type__, buffer, buffer_size)
  end

  def powerReadDCValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadDCValue(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, type__, buffer, buffer_size)
  end

  def powerWriteACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32) : UInt32
    C.PowerWriteACValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, ac_value_index)
  end

  def powerWriteDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32) : UInt32
    C.PowerWriteDCValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, dc_value_index)
  end

  def powerGetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, active_policy_guid : LibC::GUID**) : UInt32
    C.PowerGetActiveScheme(user_root_power_key, active_policy_guid)
  end

  def powerSetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : UInt32
    C.PowerSetActiveScheme(user_root_power_key, scheme_guid)
  end

  def powerSettingRegisterNotification(setting_guid : LibC::GUID*, flags : Win32cr::System::Power::POWER_SETTING_REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : UInt32
    C.PowerSettingRegisterNotification(setting_guid, flags, recipient, registration_handle)
  end

  def powerSettingUnregisterNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : UInt32
    C.PowerSettingUnregisterNotification(registration_handle)
  end

  def powerRegisterForEffectivePowerModeNotifications(version : UInt32, callback : Win32cr::System::Power::EFFECTIVE_POWER_MODE_CALLBACK, context : Void*, registration_handle : Void**) : Win32cr::Foundation::HRESULT
    C.PowerRegisterForEffectivePowerModeNotifications(version, callback, context, registration_handle)
  end

  def powerUnregisterFromEffectivePowerModeNotifications(registration_handle : Void*) : Win32cr::Foundation::HRESULT
    C.PowerUnregisterFromEffectivePowerModeNotifications(registration_handle)
  end

  def getPwrDiskSpindownRange(puiMax : UInt32*, puiMin : UInt32*) : Win32cr::Foundation::BOOLEAN
    C.GetPwrDiskSpindownRange(puiMax, puiMin)
  end

  def enumPwrSchemes(lpfn : Win32cr::System::Power::PWRSCHEMESENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOLEAN
    C.EnumPwrSchemes(lpfn, lParam)
  end

  def readGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.ReadGlobalPwrPolicy(pGlobalPowerPolicy)
  end

  def readPwrScheme(uiID : UInt32, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.ReadPwrScheme(uiID, pPowerPolicy)
  end

  def writePwrScheme(puiID : UInt32*, lpszSchemeName : Win32cr::Foundation::PWSTR, lpszDescription : Win32cr::Foundation::PWSTR, lpScheme : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.WritePwrScheme(puiID, lpszSchemeName, lpszDescription, lpScheme)
  end

  def writeGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.WriteGlobalPwrPolicy(pGlobalPowerPolicy)
  end

  def deletePwrScheme(uiID : UInt32) : Win32cr::Foundation::BOOLEAN
    C.DeletePwrScheme(uiID)
  end

  def getActivePwrScheme(puiID : UInt32*) : Win32cr::Foundation::BOOLEAN
    C.GetActivePwrScheme(puiID)
  end

  def setActivePwrScheme(uiID : UInt32, pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.SetActivePwrScheme(uiID, pGlobalPowerPolicy, pPowerPolicy)
  end

  def isPwrSuspendAllowed : Win32cr::Foundation::BOOLEAN
    C.IsPwrSuspendAllowed
  end

  def isPwrHibernateAllowed : Win32cr::Foundation::BOOLEAN
    C.IsPwrHibernateAllowed
  end

  def isPwrShutdownAllowed : Win32cr::Foundation::BOOLEAN
    C.IsPwrShutdownAllowed
  end

  def isAdminOverrideActive(papp : Win32cr::System::Power::ADMINISTRATOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.IsAdminOverrideActive(papp)
  end

  def setSuspendState(bHibernate : Win32cr::Foundation::BOOLEAN, bForce : Win32cr::Foundation::BOOLEAN, bWakeupEventsDisabled : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN
    C.SetSuspendState(bHibernate, bForce, bWakeupEventsDisabled)
  end

  def getCurrentPowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.GetCurrentPowerPolicies(pGlobalPowerPolicy, pPowerPolicy)
  end

  def canUserWritePwrScheme : Win32cr::Foundation::BOOLEAN
    C.CanUserWritePwrScheme
  end

  def readProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.ReadProcessorPwrScheme(uiID, pMachineProcessorPowerPolicy)
  end

  def writeProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.WriteProcessorPwrScheme(uiID, pMachineProcessorPowerPolicy)
  end

  def validatePowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    C.ValidatePowerPolicies(pGlobalPowerPolicy, pPowerPolicy)
  end

  def powerIsSettingRangeDefined(sub_key_guid : LibC::GUID*, setting_guid : LibC::GUID*) : Win32cr::Foundation::BOOLEAN
    C.PowerIsSettingRangeDefined(sub_key_guid, setting_guid)
  end

  def powerSettingAccessCheckEx(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*, access_type : Win32cr::System::Registry::REG_SAM_FLAGS) : UInt32
    C.PowerSettingAccessCheckEx(access_flags, power_guid, access_type)
  end

  def powerSettingAccessCheck(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*) : UInt32
    C.PowerSettingAccessCheck(access_flags, power_guid)
  end

  def powerReadACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32*) : UInt32
    C.PowerReadACValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, ac_value_index)
  end

  def powerReadDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32*) : UInt32
    C.PowerReadDCValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, dc_value_index)
  end

  def powerReadFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadFriendlyName(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerReadDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadDescription(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerReadPossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadPossibleValue(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, type__, possible_setting_index, buffer, buffer_size)
  end

  def powerReadPossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadPossibleFriendlyName(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
  end

  def powerReadPossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadPossibleDescription(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
  end

  def powerReadValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32*) : UInt32
    C.PowerReadValueMin(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_minimum)
  end

  def powerReadValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32*) : UInt32
    C.PowerReadValueMax(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_maximum)
  end

  def powerReadValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32*) : UInt32
    C.PowerReadValueIncrement(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_increment)
  end

  def powerReadValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadValueUnitsSpecifier(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerReadACDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_default_index : UInt32*) : UInt32
    C.PowerReadACDefaultIndex(root_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, ac_default_index)
  end

  def powerReadDCDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_default_index : UInt32*) : UInt32
    C.PowerReadDCDefaultIndex(root_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, dc_default_index)
  end

  def powerReadIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerReadIconResourceSpecifier(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerReadSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32
    C.PowerReadSettingAttributes(sub_group_guid, power_setting_guid)
  end

  def powerWriteFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWriteFriendlyName(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerWriteDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWriteDescription(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerWritePossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWritePossibleValue(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, type__, possible_setting_index, buffer, buffer_size)
  end

  def powerWritePossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWritePossibleFriendlyName(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
  end

  def powerWritePossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWritePossibleDescription(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
  end

  def powerWriteValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32) : UInt32
    C.PowerWriteValueMin(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_minimum)
  end

  def powerWriteValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32) : UInt32
    C.PowerWriteValueMax(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_maximum)
  end

  def powerWriteValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32) : UInt32
    C.PowerWriteValueIncrement(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_increment)
  end

  def powerWriteValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWriteValueUnitsSpecifier(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerWriteACDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_ac_index : UInt32) : UInt32
    C.PowerWriteACDefaultIndex(root_system_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, default_ac_index)
  end

  def powerWriteDCDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_dc_index : UInt32) : UInt32
    C.PowerWriteDCDefaultIndex(root_system_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, default_dc_index)
  end

  def powerWriteIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32
    C.PowerWriteIconResourceSpecifier(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
  end

  def powerWriteSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, attributes : UInt32) : UInt32
    C.PowerWriteSettingAttributes(sub_group_guid, power_setting_guid, attributes)
  end

  def powerDuplicateScheme(root_power_key : Win32cr::System::Registry::HKEY, source_scheme_guid : LibC::GUID*, destination_scheme_guid : LibC::GUID**) : UInt32
    C.PowerDuplicateScheme(root_power_key, source_scheme_guid, destination_scheme_guid)
  end

  def powerImportPowerScheme(root_power_key : Win32cr::System::Registry::HKEY, import_file_name_path : Win32cr::Foundation::PWSTR, destination_scheme_guid : LibC::GUID**) : UInt32
    C.PowerImportPowerScheme(root_power_key, import_file_name_path, destination_scheme_guid)
  end

  def powerDeleteScheme(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : UInt32
    C.PowerDeleteScheme(root_power_key, scheme_guid)
  end

  def powerRemovePowerSetting(power_setting_sub_key_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32
    C.PowerRemovePowerSetting(power_setting_sub_key_guid, power_setting_guid)
  end

  def powerCreateSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32
    C.PowerCreateSetting(root_system_power_key, sub_group_of_power_settings_guid, power_setting_guid)
  end

  def powerCreatePossibleSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32) : UInt32
    C.PowerCreatePossibleSetting(root_system_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index)
  end

  def powerEnumerate(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32
    C.PowerEnumerate(root_power_key, scheme_guid, sub_group_of_power_settings_guid, access_flags, index, buffer, buffer_size)
  end

  def powerOpenUserPowerKey(phUserPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32
    C.PowerOpenUserPowerKey(phUserPowerKey, access, open_existing)
  end

  def powerOpenSystemPowerKey(phSystemPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32
    C.PowerOpenSystemPowerKey(phSystemPowerKey, access, open_existing)
  end

  def powerCanRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : UInt32
    C.PowerCanRestoreIndividualDefaultPowerScheme(scheme_guid)
  end

  def powerRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : UInt32
    C.PowerRestoreIndividualDefaultPowerScheme(scheme_guid)
  end

  def powerRestoreDefaultPowerSchemes : UInt32
    C.PowerRestoreDefaultPowerSchemes
  end

  def powerReplaceDefaultPowerSchemes : UInt32
    C.PowerReplaceDefaultPowerSchemes
  end

  def powerDeterminePlatformRole : Win32cr::System::Power::POWER_PLATFORM_ROLE
    C.PowerDeterminePlatformRole
  end

  def devicePowerEnumDevices(query_index : UInt32, query_interpretation_flags : UInt32, query_flags : UInt32, pReturnBuffer : UInt8*, pBufferSize : UInt32*) : Win32cr::Foundation::BOOLEAN
    C.DevicePowerEnumDevices(query_index, query_interpretation_flags, query_flags, pReturnBuffer, pBufferSize)
  end

  def devicePowerSetDeviceState(device_description : Win32cr::Foundation::PWSTR, set_flags : UInt32, set_data : Void*) : UInt32
    C.DevicePowerSetDeviceState(device_description, set_flags, set_data)
  end

  def devicePowerOpen(debug_mask : UInt32) : Win32cr::Foundation::BOOLEAN
    C.DevicePowerOpen(debug_mask)
  end

  def devicePowerClose : Win32cr::Foundation::BOOLEAN
    C.DevicePowerClose
  end

  def powerReportThermalEvent(event : Win32cr::System::Power::THERMAL_EVENT*) : UInt32
    C.PowerReportThermalEvent(event)
  end

  def registerPowerSettingNotification(hRecipient : Win32cr::Foundation::HANDLE, power_setting_guid : LibC::GUID*, flags : UInt32) : Win32cr::System::Power::HPOWERNOTIFY
    C.RegisterPowerSettingNotification(hRecipient, power_setting_guid, flags)
  end

  def unregisterPowerSettingNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL
    C.UnregisterPowerSettingNotification(handle)
  end

  def registerSuspendResumeNotification(hRecipient : Win32cr::Foundation::HANDLE, flags : UInt32) : Win32cr::System::Power::HPOWERNOTIFY
    C.RegisterSuspendResumeNotification(hRecipient, flags)
  end

  def unregisterSuspendResumeNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL
    C.UnregisterSuspendResumeNotification(handle)
  end

  def requestWakeupLatency(latency : Win32cr::System::Power::LATENCY_TIME) : Win32cr::Foundation::BOOL
    C.RequestWakeupLatency(latency)
  end

  def isSystemResumeAutomatic : Win32cr::Foundation::BOOL
    C.IsSystemResumeAutomatic
  end

  def setThreadExecutionState(esFlags : Win32cr::System::Power::EXECUTION_STATE) : Win32cr::System::Power::EXECUTION_STATE
    C.SetThreadExecutionState(esFlags)
  end

  def powerCreateRequest(context : Win32cr::System::Threading::REASON_CONTEXT*) : Win32cr::Foundation::HANDLE
    C.PowerCreateRequest(context)
  end

  def powerSetRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL
    C.PowerSetRequest(power_request, request_type)
  end

  def powerClearRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL
    C.PowerClearRequest(power_request, request_type)
  end

  def getDevicePowerState(hDevice : Win32cr::Foundation::HANDLE, pfOn : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.GetDevicePowerState(hDevice, pfOn)
  end

  def setSystemPowerState(fSuspend : Win32cr::Foundation::BOOL, fForce : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.SetSystemPowerState(fSuspend, fForce)
  end

  def getSystemPowerStatus(lpSystemPowerStatus : Win32cr::System::Power::SYSTEM_POWER_STATUS*) : Win32cr::Foundation::BOOL
    C.GetSystemPowerStatus(lpSystemPowerStatus)
  end

  @[Link("powrprof")]
  @[Link("user32")]
  @[Link("kernel32")]
  lib C
    # :nodoc:
    fun CallNtPowerInformation(information_level : Win32cr::System::Power::POWER_INFORMATION_LEVEL, input_buffer : Void*, input_buffer_length : UInt32, output_buffer : Void*, output_buffer_length : UInt32) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun GetPwrCapabilities(lpspc : Win32cr::System::Power::SYSTEM_POWER_CAPABILITIES*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun PowerDeterminePlatformRoleEx(version : Win32cr::System::Power::POWER_PLATFORM_ROLE_VERSION) : Win32cr::System::Power::POWER_PLATFORM_ROLE

    # :nodoc:
    fun PowerRegisterSuspendResumeNotification(flags : UInt32, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : UInt32

    # :nodoc:
    fun PowerUnregisterSuspendResumeNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : UInt32

    # :nodoc:
    fun PowerReadACValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadDCValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerWriteACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32) : UInt32

    # :nodoc:
    fun PowerGetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, active_policy_guid : LibC::GUID**) : UInt32

    # :nodoc:
    fun PowerSetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerSettingRegisterNotification(setting_guid : LibC::GUID*, flags : Win32cr::System::Power::POWER_SETTING_REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : UInt32

    # :nodoc:
    fun PowerSettingUnregisterNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : UInt32

    # :nodoc:
    fun PowerRegisterForEffectivePowerModeNotifications(version : UInt32, callback : Win32cr::System::Power::EFFECTIVE_POWER_MODE_CALLBACK, context : Void*, registration_handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PowerUnregisterFromEffectivePowerModeNotifications(registration_handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetPwrDiskSpindownRange(puiMax : UInt32*, puiMin : UInt32*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun EnumPwrSchemes(lpfn : Win32cr::System::Power::PWRSCHEMESENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun ReadGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun ReadPwrScheme(uiID : UInt32, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun WritePwrScheme(puiID : UInt32*, lpszSchemeName : Win32cr::Foundation::PWSTR, lpszDescription : Win32cr::Foundation::PWSTR, lpScheme : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun WriteGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun DeletePwrScheme(uiID : UInt32) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun GetActivePwrScheme(puiID : UInt32*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun SetActivePwrScheme(uiID : UInt32, pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsPwrSuspendAllowed : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsPwrHibernateAllowed : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsPwrShutdownAllowed : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun IsAdminOverrideActive(papp : Win32cr::System::Power::ADMINISTRATOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun SetSuspendState(bHibernate : Win32cr::Foundation::BOOLEAN, bForce : Win32cr::Foundation::BOOLEAN, bWakeupEventsDisabled : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun GetCurrentPowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun CanUserWritePwrScheme : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun ReadProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun WriteProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun ValidatePowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun PowerIsSettingRangeDefined(sub_key_guid : LibC::GUID*, setting_guid : LibC::GUID*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun PowerSettingAccessCheckEx(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*, access_type : Win32cr::System::Registry::REG_SAM_FLAGS) : UInt32

    # :nodoc:
    fun PowerSettingAccessCheck(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerReadACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadPossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadPossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadPossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadACDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_default_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadDCDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_default_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerWriteFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWritePossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWritePossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWritePossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteACDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_ac_index : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteDCDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_dc_index : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, attributes : UInt32) : UInt32

    # :nodoc:
    fun PowerDuplicateScheme(root_power_key : Win32cr::System::Registry::HKEY, source_scheme_guid : LibC::GUID*, destination_scheme_guid : LibC::GUID**) : UInt32

    # :nodoc:
    fun PowerImportPowerScheme(root_power_key : Win32cr::System::Registry::HKEY, import_file_name_path : Win32cr::Foundation::PWSTR, destination_scheme_guid : LibC::GUID**) : UInt32

    # :nodoc:
    fun PowerDeleteScheme(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerRemovePowerSetting(power_setting_sub_key_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerCreateSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerCreatePossibleSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32) : UInt32

    # :nodoc:
    fun PowerEnumerate(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : UInt32

    # :nodoc:
    fun PowerOpenUserPowerKey(phUserPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun PowerOpenSystemPowerKey(phSystemPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun PowerCanRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerRestoreDefaultPowerSchemes : UInt32

    # :nodoc:
    fun PowerReplaceDefaultPowerSchemes : UInt32

    # :nodoc:
    fun PowerDeterminePlatformRole : Win32cr::System::Power::POWER_PLATFORM_ROLE

    # :nodoc:
    fun DevicePowerEnumDevices(query_index : UInt32, query_interpretation_flags : UInt32, query_flags : UInt32, pReturnBuffer : UInt8*, pBufferSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun DevicePowerSetDeviceState(device_description : Win32cr::Foundation::PWSTR, set_flags : UInt32, set_data : Void*) : UInt32

    # :nodoc:
    fun DevicePowerOpen(debug_mask : UInt32) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun DevicePowerClose : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun PowerReportThermalEvent(event : Win32cr::System::Power::THERMAL_EVENT*) : UInt32

    # :nodoc:
    fun RegisterPowerSettingNotification(hRecipient : Win32cr::Foundation::HANDLE, power_setting_guid : LibC::GUID*, flags : UInt32) : Win32cr::System::Power::HPOWERNOTIFY

    # :nodoc:
    fun UnregisterPowerSettingNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterSuspendResumeNotification(hRecipient : Win32cr::Foundation::HANDLE, flags : UInt32) : Win32cr::System::Power::HPOWERNOTIFY

    # :nodoc:
    fun UnregisterSuspendResumeNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RequestWakeupLatency(latency : Win32cr::System::Power::LATENCY_TIME) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun IsSystemResumeAutomatic : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetThreadExecutionState(esFlags : Win32cr::System::Power::EXECUTION_STATE) : Win32cr::System::Power::EXECUTION_STATE

    # :nodoc:
    fun PowerCreateRequest(context : Win32cr::System::Threading::REASON_CONTEXT*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun PowerSetRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun PowerClearRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetDevicePowerState(hDevice : Win32cr::Foundation::HANDLE, pfOn : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun SetSystemPowerState(fSuspend : Win32cr::Foundation::BOOL, fForce : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun GetSystemPowerStatus(lpSystemPowerStatus : Win32cr::System::Power::SYSTEM_POWER_STATUS*) : Win32cr::Foundation::BOOL

  end
end