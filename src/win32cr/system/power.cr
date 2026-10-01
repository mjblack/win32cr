require "./../foundation.cr"
require "./../ui/windows_and_messaging.cr"
require "./registry.cr"
require "./threading.cr"

module Win32cr::System::Power
  extend self
  alias HPOWERNOTIFY = LibC::IntPtrT
  alias EFFECTIVE_POWER_MODE_CALLBACK = Proc(Win32cr::System::Power::EFFECTIVE_POWER_MODE, Void*, Void)

  alias PWRSCHEMESENUMPROC_V1 = Proc(UInt32, UInt32, Int8*, UInt32, Int8*, Win32cr::System::Power::POWER_POLICY*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOLEAN)

  alias PWRSCHEMESENUMPROC = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::System::Power::POWER_POLICY*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOLEAN)

  alias PDEVICE_NOTIFY_CALLBACK_ROUTINE = Proc(Void*, UInt32, Void*, UInt32)

  PPM_FIRMWARE_ACPI1C2 = 1_u32
  PPM_FIRMWARE_ACPI1C3 = 2_u32
  PPM_FIRMWARE_ACPI1TSTATES = 4_u32
  PPM_FIRMWARE_CST = 8_u32
  PPM_FIRMWARE_CSD = 16_u32
  PPM_FIRMWARE_PCT = 32_u32
  PPM_FIRMWARE_PSS = 64_u32
  PPM_FIRMWARE_XPSS = 128_u32
  PPM_FIRMWARE_PPC = 256_u32
  PPM_FIRMWARE_PSD = 512_u32
  PPM_FIRMWARE_PTC = 1024_u32
  PPM_FIRMWARE_TSS = 2048_u32
  PPM_FIRMWARE_TPC = 4096_u32
  PPM_FIRMWARE_TSD = 8192_u32
  PPM_FIRMWARE_PCCH = 16384_u32
  PPM_FIRMWARE_PCCP = 32768_u32
  PPM_FIRMWARE_OSC = 65536_u32
  PPM_FIRMWARE_PDC = 131072_u32
  PPM_FIRMWARE_CPC = 262144_u32
  PPM_FIRMWARE_LPI = 524288_u32
  PPM_PERFORMANCE_IMPLEMENTATION_NONE = 0_u32
  PPM_PERFORMANCE_IMPLEMENTATION_PSTATES = 1_u32
  PPM_PERFORMANCE_IMPLEMENTATION_PCCV1 = 2_u32
  PPM_PERFORMANCE_IMPLEMENTATION_CPPC = 3_u32
  PPM_PERFORMANCE_IMPLEMENTATION_PEP = 4_u32
  PPM_IDLE_IMPLEMENTATION_NONE = 0_u32
  PPM_IDLE_IMPLEMENTATION_CSTATES = 1_u32
  PPM_IDLE_IMPLEMENTATION_PEP = 2_u32
  PPM_IDLE_IMPLEMENTATION_MICROPEP = 3_u32
  PPM_IDLE_IMPLEMENTATION_LPISTATES = 4_u32
  PPM_PERFSTATE_CHANGE_GUID = LibC::GUID.new(0xa5b32ddd_u32, 0x7f39_u16, 0x4abc_u16, StaticArray[0xb8_u8, 0x92_u8, 0x90_u8, 0xe_u8, 0x43_u8, 0xb5_u8, 0x9e_u8, 0xbb_u8])
  PPM_PERFSTATE_DOMAIN_CHANGE_GUID = LibC::GUID.new(0x995e6b7f_u32, 0xd653_u16, 0x497a_u16, StaticArray[0xb9_u8, 0x78_u8, 0x36_u8, 0xa3_u8, 0xc_u8, 0x29_u8, 0xbf_u8, 0x1_u8])
  PPM_IDLESTATE_CHANGE_GUID = LibC::GUID.new(0x4838fe4f_u32, 0xf71c_u16, 0x4e51_u16, StaticArray[0x9e_u8, 0xcc_u8, 0x84_u8, 0x30_u8, 0xa7_u8, 0xac_u8, 0x4c_u8, 0x6c_u8])
  PPM_PERFSTATES_DATA_GUID = LibC::GUID.new(0x5708cc20_u32, 0x7d40_u16, 0x4bf4_u16, StaticArray[0xb4_u8, 0xaa_u8, 0x2b_u8, 0x1_u8, 0x33_u8, 0x8d_u8, 0x1_u8, 0x26_u8])
  PPM_IDLESTATES_DATA_GUID = LibC::GUID.new(0xba138e10_u32, 0xe250_u16, 0x4ad7_u16, StaticArray[0x86_u8, 0x16_u8, 0xcf_u8, 0x1a_u8, 0x7a_u8, 0xd4_u8, 0x10_u8, 0xe7_u8])
  PPM_IDLE_ACCOUNTING_GUID = LibC::GUID.new(0xe2a26f78_u32, 0xae07_u16, 0x4ee0_u16, StaticArray[0xa3_u8, 0xf_u8, 0xce_u8, 0x54_u8, 0xf5_u8, 0x5a_u8, 0x94_u8, 0xcd_u8])
  PPM_IDLE_ACCOUNTING_EX_GUID = LibC::GUID.new(0xd67abd39_u32, 0x81f8_u16, 0x4a5e_u16, StaticArray[0x81_u8, 0x52_u8, 0x72_u8, 0xe3_u8, 0x1e_u8, 0xc9_u8, 0x12_u8, 0xee_u8])
  PPM_THERMALCONSTRAINT_GUID = LibC::GUID.new(0xa852c2c8_u32, 0x1a4c_u16, 0x423b_u16, StaticArray[0x8c_u8, 0x2c_u8, 0xf3_u8, 0xd_u8, 0x82_u8, 0x93_u8, 0x1a_u8, 0x88_u8])
  PPM_PERFMON_PERFSTATE_GUID = LibC::GUID.new(0x7fd18652_u32, 0xcfe_u16, 0x40d2_u16, StaticArray[0xb0_u8, 0xa1_u8, 0xb_u8, 0x6_u8, 0x6a_u8, 0x87_u8, 0x75_u8, 0x9e_u8])
  PPM_THERMAL_POLICY_CHANGE_GUID = LibC::GUID.new(0x48f377b8_u32, 0x6880_u16, 0x4c7b_u16, StaticArray[0x8b_u8, 0xdc_u8, 0x38_u8, 0x1_u8, 0x76_u8, 0xc6_u8, 0x65_u8, 0x4d_u8])
  PROCESSOR_NUMBER_PKEY = Win32cr::Foundation::DEVPROPKEY.new(LibC::GUID.new(0x5724c81d_u32, 0xd5af_u16, 0x4c1f_u16, StaticArray[0xa1_u8, 0x3_u8, 0xa0_u8, 0x6e_u8, 0x28_u8, 0xf2_u8, 0x4_u8, 0xc6_u8]), 1_u32)
  GUID_DEVICE_BATTERY = LibC::GUID.new(0x72631e54_u32, 0x78a4_u16, 0x11d0_u16, StaticArray[0xbc_u8, 0xf7_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb7_u8, 0xb3_u8, 0x2a_u8])
  GUID_DEVICE_APPLICATIONLAUNCH_BUTTON = LibC::GUID.new(0x629758ee_u32, 0x986e_u16, 0x4d9e_u16, StaticArray[0x8e_u8, 0x47_u8, 0xde_u8, 0x27_u8, 0xf8_u8, 0xab_u8, 0x5_u8, 0x4d_u8])
  GUID_DEVICE_SYS_BUTTON = LibC::GUID.new(0x4afa3d53_u32, 0x74a7_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0x5e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x6_u8, 0x28_u8, 0x57_u8])
  GUID_DEVICE_LID = LibC::GUID.new(0x4afa3d52_u32, 0x74a7_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0x5e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x6_u8, 0x28_u8, 0x57_u8])
  GUID_DEVICE_THERMAL_ZONE = LibC::GUID.new(0x4afa3d51_u32, 0x74a7_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0x5e_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x6_u8, 0x28_u8, 0x57_u8])
  GUID_DEVICE_FAN = LibC::GUID.new(0x5ecd13d_u32, 0x81da_u16, 0x4a2a_u16, StaticArray[0x8a_u8, 0x4c_u8, 0x52_u8, 0x4f_u8, 0x23_u8, 0xdd_u8, 0x4d_u8, 0xc9_u8])
  GUID_DEVICE_PROCESSOR = LibC::GUID.new(0x97fadb10_u32, 0x4e33_u16, 0x40ae_u16, StaticArray[0x35_u8, 0x9c_u8, 0x8b_u8, 0xef_u8, 0x2_u8, 0x9d_u8, 0xbd_u8, 0xd0_u8])
  GUID_DEVICE_MEMORY = LibC::GUID.new(0x3fd0f03d_u32, 0x92e0_u16, 0x45fb_u16, StaticArray[0xb7_u8, 0x5c_u8, 0x5e_u8, 0xd8_u8, 0xff_u8, 0xb0_u8, 0x10_u8, 0x21_u8])
  GUID_DEVICE_ACPI_TIME = LibC::GUID.new(0x97f99bf6_u32, 0x4497_u16, 0x4f18_u16, StaticArray[0xbb_u8, 0x22_u8, 0x4b_u8, 0x9f_u8, 0xb2_u8, 0xfb_u8, 0xef_u8, 0x9c_u8])
  GUID_DEVICE_MESSAGE_INDICATOR = LibC::GUID.new(0xcd48a365_u32, 0xfa94_u16, 0x4ce2_u16, StaticArray[0xa2_u8, 0x32_u8, 0xa1_u8, 0xb7_u8, 0x64_u8, 0xe5_u8, 0xd8_u8, 0xb4_u8])
  GUID_DEVICE_POWER_ADAPTER = LibC::GUID.new(0xf76c6c62_u32, 0x7dea_u16, 0x43cd_u16, StaticArray[0x86_u8, 0x89_u8, 0xd9_u8, 0xa4_u8, 0xaf_u8, 0x3d_u8, 0x85_u8, 0x57_u8])
  GUID_CLASS_INPUT = LibC::GUID.new(0x4d1e55b2_u32, 0xf16f_u16, 0x11cf_u16, StaticArray[0x88_u8, 0xcb_u8, 0x0_u8, 0x11_u8, 0x11_u8, 0x0_u8, 0x0_u8, 0x30_u8])
  GUID_DEVINTERFACE_THERMAL_COOLING = LibC::GUID.new(0xdbe4373d_u32, 0x3c81_u16, 0x40cb_u16, StaticArray[0xac_u8, 0xe4_u8, 0xe0_u8, 0xe5_u8, 0xd0_u8, 0x5f_u8, 0xc_u8, 0x9f_u8])
  GUID_DEVINTERFACE_THERMAL_MANAGER = LibC::GUID.new(0x927ec093_u32, 0x69a4_u16, 0x4bc0_u16, StaticArray[0xbd_u8, 0x2_u8, 0x71_u8, 0x16_u8, 0x64_u8, 0x71_u8, 0x44_u8, 0x63_u8])
  GUID_DEVINTERFACE_POWER_LIMIT = LibC::GUID.new(0x8f366301_u32, 0x91e_u16, 0x4056_u16, StaticArray[0xb9_u8, 0x2f_u8, 0x95_u8, 0x8b_u8, 0x27_u8, 0x62_u8, 0x5f_u8, 0xce_u8])
  GUID_DEVINTERFACE_TEMPERATURE_SENSOR = LibC::GUID.new(0x2a6c8538_u32, 0x7895_u16, 0x4d56_u16, StaticArray[0x85_u8, 0x67_u8, 0x79_u8, 0x5d_u8, 0x38_u8, 0x44_u8, 0x85_u8, 0x8a_u8])
  GUID_DEVINTERFACE_CUSTOMIZED_IO = LibC::GUID.new(0x2ed8544a_u32, 0x8eef_u16, 0x4033_u16, StaticArray[0xb2_u8, 0xa0_u8, 0x4_u8, 0xaa_u8, 0xa5_u8, 0x7_u8, 0xce_u8, 0xcb_u8])
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
  IOCTL_QUERY_CUSTOMIZED_IO_CAPABILITIES = 2704000_u32
  IOCTL_QUERY_CUSTOMIZED_INPUT_FROM_PLATFORM = 2704004_u32
  IOCTL_SEND_CUSTOMIZED_OUTPUT_TO_PLATFORM = 2720392_u32
  MAX_ACTIVE_COOLING_LEVELS = 10_u32
  ACTIVE_COOLING = 0_u32
  PASSIVE_COOLING = 1_u32
  THERMAL_WAIT_READ_TIMEOUT_IMMEDIATE = 0_u32
  THERMAL_WAIT_READ_TIMEOUT_NONE = 4294967295_u32
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
  POWER_LIMIT_INTERFACE_VERSION = 1_u32
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
  IOCTL_GET_ACPI_TIME_AND_ALARM_CAPABILITIES = 2703900_u32
  BATTERY_STATUS_WMI_GUID = LibC::GUID.new(0xfc4670d1_u32, 0xebbf_u16, 0x416e_u16, StaticArray[0x87_u8, 0xce_u8, 0x37_u8, 0x4a_u8, 0x4e_u8, 0xbc_u8, 0x11_u8, 0x1a_u8])
  BATTERY_RUNTIME_WMI_GUID = LibC::GUID.new(0x535a3767_u32, 0x1ac2_u16, 0x49bc_u16, StaticArray[0xa0_u8, 0x77_u8, 0x3f_u8, 0x7a_u8, 0x2_u8, 0xe4_u8, 0xa_u8, 0xec_u8])
  BATTERY_TEMPERATURE_WMI_GUID = LibC::GUID.new(0x1a52a14d_u32, 0xadce_u16, 0x4a44_u16, StaticArray[0x9a_u8, 0x3e_u8, 0xc8_u8, 0xd8_u8, 0xf1_u8, 0x5f_u8, 0xf2_u8, 0xc2_u8])
  BATTERY_FULL_CHARGED_CAPACITY_WMI_GUID = LibC::GUID.new(0x40b40565_u32, 0x96f7_u16, 0x4435_u16, StaticArray[0x86_u8, 0x94_u8, 0x97_u8, 0xe0_u8, 0xe4_u8, 0x39_u8, 0x59_u8, 0x5_u8])
  BATTERY_CYCLE_COUNT_WMI_GUID = LibC::GUID.new(0xef98db24_u32, 0x14_u16, 0x4c25_u16, StaticArray[0xa5_u8, 0xb_u8, 0xc7_u8, 0x24_u8, 0xae_u8, 0x5c_u8, 0xd3_u8, 0x71_u8])
  BATTERY_STATIC_DATA_WMI_GUID = LibC::GUID.new(0x5e1e463_u32, 0xe4e2_u16, 0x4ea9_u16, StaticArray[0x80_u8, 0xcb_u8, 0x9b_u8, 0xd4_u8, 0xb3_u8, 0xca_u8, 0x6_u8, 0x55_u8])
  BATTERY_STATUS_CHANGE_WMI_GUID = LibC::GUID.new(0xcddfa0c3_u32, 0x7c5b_u16, 0x4e43_u16, StaticArray[0xa0_u8, 0x34_u8, 0x5_u8, 0x9f_u8, 0xa5_u8, 0xb8_u8, 0x43_u8, 0x64_u8])
  BATTERY_TAG_CHANGE_WMI_GUID = LibC::GUID.new(0x5e1f6e19_u32, 0x8786_u16, 0x4d23_u16, StaticArray[0x94_u8, 0xfc_u8, 0x9e_u8, 0x74_u8, 0x6b_u8, 0xd5_u8, 0xd8_u8, 0x88_u8])
  BATTERY_NOTIFY_VERSION_1 = 1_u32
  BATTERY_NOTIFY_VERSION_2 = 2_u32
  CHARGE_REQUIREMENT_MAX_POWER_SOURCE_TYPES = 2_u32
  BATTERY_MINIPORT_UPDATE_DATA_VER_1 = 1_u32
  BATTERY_MINIPORT_UPDATE_DATA_VER_2 = 2_u32
  BATTERY_CLASS_MAJOR_VERSION = 1_u32
  BATTERY_CLASS_MINOR_VERSION = 0_u32
  BATTERY_CLASS_MINOR_VERSION_1 = 1_u32
  BATTERY_CLASS_MINOR_VERSION_2 = 2_u32
  ADAPTER_CLASS_MAJOR_VERSION = 1_u32
  ADAPTER_CLASS_MINOR_VERSION = 0_u32
  GUID_DEVICE_ENERGY_METER = LibC::GUID.new(0x45bd8344_u32, 0x7ed6_u16, 0x49cf_u16, StaticArray[0xa4_u8, 0x40_u8, 0xc2_u8, 0x76_u8, 0xc9_u8, 0x33_u8, 0xb0_u8, 0x53_u8])
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
  @[Flags]
  enum DEVICE_POWER_CAPABILITIES : UInt32
    PDCAP_D0_SUPPORTED = 1_u32
    PDCAP_D1_SUPPORTED = 2_u32
    PDCAP_D2_SUPPORTED = 4_u32
    PDCAP_D3_SUPPORTED = 8_u32
    PDCAP_WAKE_FROM_D0_SUPPORTED = 16_u32
    PDCAP_WAKE_FROM_D1_SUPPORTED = 32_u32
    PDCAP_WAKE_FROM_D2_SUPPORTED = 64_u32
    PDCAP_WAKE_FROM_D3_SUPPORTED = 128_u32
    PDCAP_WARM_EJECT_SUPPORTED = 256_u32
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
  end
  enum EFFECTIVE_POWER_MODE
    EffectivePowerModeBatterySaver = 0_i32
    EffectivePowerModeEnergySaverHighSavings = 0_i32
    EffectivePowerModeBetterBattery = 1_i32
    EffectivePowerModeEnergySaverStandard = 1_i32
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
    ACCESS_POWER_MODE = 26_i32
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
  enum ACPI_TIME_RESOLUTION
    AcpiTimeResolutionMilliseconds = 0_i32
    AcpiTimeResolutionSeconds = 1_i32
    AcpiTimeResolutionMax = 2_i32
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
  enum USER_ACTIVITY_PRESENCE
    PowerUserPresent = 0_i32
    PowerUserNotPresent = 1_i32
    PowerUserInactive = 2_i32
    PowerUserMaximum = 3_i32
    PowerUserInvalid = 3_i32
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
    BlackBoxRecorderDirectAccessBuffer = 97_i32
    SystemPowerSourceState = 98_i32
    PowerInformationLevelMaximum = 99_i32
  end
  enum POWER_USER_PRESENCE_TYPE
    UserNotPresent = 0_i32
    UserPresent = 1_i32
    UserUnknown = 255_i32
  end
  enum POWER_MONITOR_REQUEST_REASON
    MonitorRequestReasonUnknown = 0_i32
    MonitorRequestReasonPowerButton = 1_i32
    MonitorRequestReasonRemoteConnection = 2_i32
    MonitorRequestReasonScMonitorpower = 3_i32
    MonitorRequestReasonUserInput = 4_i32
    MonitorRequestReasonAcDcDisplayBurst = 5_i32
    MonitorRequestReasonUserDisplayBurst = 6_i32
    MonitorRequestReasonPoSetSystemState = 7_i32
    MonitorRequestReasonSetThreadExecutionState = 8_i32
    MonitorRequestReasonFullWake = 9_i32
    MonitorRequestReasonSessionUnlock = 10_i32
    MonitorRequestReasonScreenOffRequest = 11_i32
    MonitorRequestReasonIdleTimeout = 12_i32
    MonitorRequestReasonPolicyChange = 13_i32
    MonitorRequestReasonSleepButton = 14_i32
    MonitorRequestReasonLid = 15_i32
    MonitorRequestReasonBatteryCountChange = 16_i32
    MonitorRequestReasonGracePeriod = 17_i32
    MonitorRequestReasonPnP = 18_i32
    MonitorRequestReasonDP = 19_i32
    MonitorRequestReasonSxTransition = 20_i32
    MonitorRequestReasonSystemIdle = 21_i32
    MonitorRequestReasonNearProximity = 22_i32
    MonitorRequestReasonThermalStandby = 23_i32
    MonitorRequestReasonResumePdc = 24_i32
    MonitorRequestReasonResumeS4 = 25_i32
    MonitorRequestReasonTerminal = 26_i32
    MonitorRequestReasonPdcSignal = 27_i32
    MonitorRequestReasonAcDcDisplayBurstSuppressed = 28_i32
    MonitorRequestReasonSystemStateEntered = 29_i32
    MonitorRequestReasonWinrt = 30_i32
    MonitorRequestReasonUserInputKeyboard = 31_i32
    MonitorRequestReasonUserInputMouse = 32_i32
    MonitorRequestReasonUserInputTouchpad = 33_i32
    MonitorRequestReasonUserInputPen = 34_i32
    MonitorRequestReasonUserInputAccelerometer = 35_i32
    MonitorRequestReasonUserInputHid = 36_i32
    MonitorRequestReasonUserInputPoUserPresent = 37_i32
    MonitorRequestReasonUserInputSessionSwitch = 38_i32
    MonitorRequestReasonUserInputInitialization = 39_i32
    MonitorRequestReasonPdcSignalWindowsMobilePwrNotif = 40_i32
    MonitorRequestReasonPdcSignalWindowsMobileShell = 41_i32
    MonitorRequestReasonPdcSignalHeyCortana = 42_i32
    MonitorRequestReasonPdcSignalHolographicShell = 43_i32
    MonitorRequestReasonPdcSignalFingerprint = 44_i32
    MonitorRequestReasonDirectedDrips = 45_i32
    MonitorRequestReasonDim = 46_i32
    MonitorRequestReasonBuiltinPanel = 47_i32
    MonitorRequestReasonDisplayRequiredUnDim = 48_i32
    MonitorRequestReasonBatteryCountChangeSuppressed = 49_i32
    MonitorRequestReasonResumeModernStandby = 50_i32
    MonitorRequestReasonTerminalInit = 51_i32
    MonitorRequestReasonPdcSignalSensorsHumanPresence = 52_i32
    MonitorRequestReasonBatteryPreCritical = 53_i32
    MonitorRequestReasonUserInputTouch = 54_i32
    MonitorRequestReasonAusterityBatteryDrain = 55_i32
    MonitorRequestReasonDozeRestrictedStandby = 56_i32
    MonitorRequestReasonSmartRestrictedStandby = 57_i32
    MonitorRequestReasonMax = 58_i32
  end
  enum POWER_MONITOR_REQUEST_TYPE
    MonitorRequestTypeOff = 0_i32
    MonitorRequestTypeOnAndPresent = 1_i32
    MonitorRequestTypeToggleOn = 2_i32
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
  enum POWER_SETTING_ALTITUDE
    ALTITUDE_GROUP_POLICY = 0_i32
    ALTITUDE_USER = 1_i32
    ALTITUDE_RUNTIME_OVERRIDE = 2_i32
    ALTITUDE_PROVISIONING = 3_i32
    ALTITUDE_OEM_CUSTOMIZATION = 4_i32
    ALTITUDE_INTERNAL_OVERRIDE = 5_i32
    ALTITUDE_OS_DEFAULT = 6_i32
  end

  @[Extern]
  struct PROCESSOR_POWER_INFORMATION
    property number : UInt32
    property max_mhz : UInt32
    property current_mhz : UInt32
    property mhz_limit : UInt32
    property max_idle_state : UInt32
    property current_idle_state : UInt32
    def initialize(@number : UInt32, @max_mhz : UInt32, @current_mhz : UInt32, @mhz_limit : UInt32, @max_idle_state : UInt32, @current_idle_state : UInt32)
    end
  end

  @[Extern]
  struct SYSTEM_POWER_INFORMATION
    property max_idleness_allowed : UInt32
    property idleness : UInt32
    property time_remaining : UInt32
    property cooling_mode : Win32cr::System::Power::POWER_COOLING_MODE
    def initialize(@max_idleness_allowed : UInt32, @idleness : UInt32, @time_remaining : UInt32, @cooling_mode : Win32cr::System::Power::POWER_COOLING_MODE)
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
    property buffer : UInt8[1]
    def initialize(@battery_tag : UInt32, @information_level : Win32cr::System::Power::BATTERY_SET_INFORMATION_LEVEL, @buffer : UInt8[1])
    end
  end

  @[Extern]
  struct BATTERY_CHARGER_STATUS
    property type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE
    property va_data : UInt32[1]
    def initialize(@type__ : Win32cr::System::Power::BATTERY_CHARGING_SOURCE_TYPE, @va_data : UInt32[1])
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

  @[Extern(union: true)]
  struct POWER_ADAPTER_POWER_STATES
    property states : States_e__Struct_
    property as_ulong : UInt32

    # Nested Type States_e__Struct_
    @[Extern]
    struct States_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@states : States_e__Struct_, @as_ulong : UInt32)
    end
  end

  @[Extern]
  struct POWER_ADAPTER_STATUS
    property version : UInt8
    property reserved : UInt8[3]
    property power_state : Win32cr::System::Power::POWER_ADAPTER_POWER_STATES
    property peak_power : UInt32
    property max_output_power : UInt32
    property max_input_power : UInt32
    property rec_start_time : UInt64
    property rec_end_time : UInt64
    def initialize(@version : UInt8, @reserved : UInt8[3], @power_state : Win32cr::System::Power::POWER_ADAPTER_POWER_STATES, @peak_power : UInt32, @max_output_power : UInt32, @max_input_power : UInt32, @rec_start_time : UInt64, @rec_end_time : UInt64)
    end
  end

  @[Extern]
  struct POWER_ADAPTER_SET_STATUS_BUFFER
    property version : UInt8
    property rec_override : Win32cr::Foundation::BOOLEAN
    property reserved : UInt8[2]
    def initialize(@version : UInt8, @rec_override : Win32cr::Foundation::BOOLEAN, @reserved : UInt8[2])
    end
  end

  @[Extern]
  struct POWER_ADAPTER_CHARGE_REQUIREMENT
    property ac_adapter_type : UInt32
    property minimum_power : UInt32
    property nominal_power : UInt32
    property maximum_power : UInt32
    def initialize(@ac_adapter_type : UInt32, @minimum_power : UInt32, @nominal_power : UInt32, @maximum_power : UInt32)
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
  struct CUSTOMIZED_IO_CAPABILITIES
    property supported_inputs : UInt32
    property supported_outputs : UInt32
    def initialize(@supported_inputs : UInt32, @supported_outputs : UInt32)
    end
  end

  @[Extern]
  struct CUSTOMIZED_IO_QUERY_INPUT_RETURN
    property function_id : UInt32
    property error_code : UInt32
    property value : UInt32
    def initialize(@function_id : UInt32, @error_code : UInt32, @value : UInt32)
    end
  end

  @[Extern]
  struct CUSTOMIZED_IO_SEND_OUTPUT_BUFFER
    property function_id : UInt32
    property value : UInt32
    def initialize(@function_id : UInt32, @value : UInt32)
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
  struct ACPI_TIME_AND_ALARM_CAPABILITIES
    property ac_wake_supported : Win32cr::Foundation::BOOLEAN
    property dc_wake_supported : Win32cr::Foundation::BOOLEAN
    property s4_ac_wake_supported : Win32cr::Foundation::BOOLEAN
    property s4_dc_wake_supported : Win32cr::Foundation::BOOLEAN
    property s5_ac_wake_supported : Win32cr::Foundation::BOOLEAN
    property s5_dc_wake_supported : Win32cr::Foundation::BOOLEAN
    property s4_s5_wake_status_supported : Win32cr::Foundation::BOOLEAN
    property deepest_wake_system_state : UInt32
    property real_time_features_supported : Win32cr::Foundation::BOOLEAN
    property real_time_resolution : Win32cr::System::Power::ACPI_TIME_RESOLUTION
    def initialize(@ac_wake_supported : Win32cr::Foundation::BOOLEAN, @dc_wake_supported : Win32cr::Foundation::BOOLEAN, @s4_ac_wake_supported : Win32cr::Foundation::BOOLEAN, @s4_dc_wake_supported : Win32cr::Foundation::BOOLEAN, @s5_ac_wake_supported : Win32cr::Foundation::BOOLEAN, @s5_dc_wake_supported : Win32cr::Foundation::BOOLEAN, @s4_s5_wake_status_supported : Win32cr::Foundation::BOOLEAN, @deepest_wake_system_state : UInt32, @real_time_features_supported : Win32cr::Foundation::BOOLEAN, @real_time_resolution : Win32cr::System::Power::ACPI_TIME_RESOLUTION)
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
    property metered_hardware_name : UInt16[1]
    def initialize(@measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT, @hardware_oem : UInt16[16], @hardware_model : UInt16[16], @hardware_revision : UInt16, @metered_hardware_name_size : UInt16, @metered_hardware_name : UInt16[1])
    end
  end

  @[Extern]
  struct EMI_CHANNEL_V2
    property measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT
    property channel_name_size : UInt16
    property channel_name : UInt16[1]
    def initialize(@measurement_unit : Win32cr::System::Power::EMI_MEASUREMENT_UNIT, @channel_name_size : UInt16, @channel_name : UInt16[1])
    end
  end

  @[Extern]
  struct EMI_METADATA_V2
    property hardware_oem : UInt16[16]
    property hardware_model : UInt16[16]
    property hardware_revision : UInt16
    property channel_count : UInt16
    property channels : Win32cr::System::Power::EMI_CHANNEL_V2[1]
    def initialize(@hardware_oem : UInt16[16], @hardware_model : UInt16[16], @hardware_revision : UInt16, @channel_count : UInt16, @channels : Win32cr::System::Power::EMI_CHANNEL_V2[1])
    end
  end

  @[Extern]
  struct EMI_MEASUREMENT_DATA_V2
    property channel_data : Win32cr::System::Power::EMI_CHANNEL_MEASUREMENT_DATA[1]
    def initialize(@channel_data : Win32cr::System::Power::EMI_CHANNEL_MEASUREMENT_DATA[1])
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
  struct POWER_USER_PRESENCE
    property user_presence : Win32cr::System::Power::POWER_USER_PRESENCE_TYPE
    def initialize(@user_presence : Win32cr::System::Power::POWER_USER_PRESENCE_TYPE)
    end
  end

  @[Extern]
  struct POWER_SESSION_CONNECT
    property connected : Win32cr::Foundation::BOOLEAN
    property console : Win32cr::Foundation::BOOLEAN
    def initialize(@connected : Win32cr::Foundation::BOOLEAN, @console : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct POWER_SESSION_TIMEOUTS
    property input_timeout : UInt32
    property display_timeout : UInt32
    def initialize(@input_timeout : UInt32, @display_timeout : UInt32)
    end
  end

  @[Extern]
  struct POWER_SESSION_RIT_STATE
    property active : Win32cr::Foundation::BOOLEAN
    property last_input_time : UInt64
    def initialize(@active : Win32cr::Foundation::BOOLEAN, @last_input_time : UInt64)
    end
  end

  @[Extern]
  struct POWER_SESSION_WINLOGON
    property session_id : UInt32
    property console : Win32cr::Foundation::BOOLEAN
    property locked : Win32cr::Foundation::BOOLEAN
    def initialize(@session_id : UInt32, @console : Win32cr::Foundation::BOOLEAN, @locked : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct POWER_SESSION_ALLOW_EXTERNAL_DMA_DEVICES
    property is_allowed : Win32cr::Foundation::BOOLEAN
    def initialize(@is_allowed : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct POWER_IDLE_RESILIENCY
    property coalescing_timeout : UInt32
    property idle_resiliency_period : UInt32
    def initialize(@coalescing_timeout : UInt32, @idle_resiliency_period : UInt32)
    end
  end

  @[Extern]
  struct POWER_MONITOR_INVOCATION
    property console : Win32cr::Foundation::BOOLEAN
    property request_reason : Win32cr::System::Power::POWER_MONITOR_REQUEST_REASON
    def initialize(@console : Win32cr::Foundation::BOOLEAN, @request_reason : Win32cr::System::Power::POWER_MONITOR_REQUEST_REASON)
    end
  end

  @[Extern]
  struct RESUME_PERFORMANCE
    property post_time_ms : UInt32
    property total_resume_time_ms : UInt64
    property resume_complete_timestamp : UInt64
    def initialize(@post_time_ms : UInt32, @total_resume_time_ms : UInt64, @resume_complete_timestamp : UInt64)
    end
  end

  @[Extern]
  struct SET_POWER_SETTING_VALUE
    property version : UInt32
    property guid : LibC::GUID
    property power_condition : Win32cr::System::Power::SYSTEM_POWER_CONDITION
    property data_length : UInt32
    property data : UInt8[1]
    def initialize(@version : UInt32, @guid : LibC::GUID, @power_condition : Win32cr::System::Power::SYSTEM_POWER_CONDITION, @data_length : UInt32, @data : UInt8[1])
    end
  end

  @[Extern]
  struct POWER_PLATFORM_INFORMATION
    property ao_ac : Win32cr::Foundation::BOOLEAN
    def initialize(@ao_ac : Win32cr::Foundation::BOOLEAN)
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
  struct PPM_WMI_LEGACY_PERFSTATE
    property frequency : UInt32
    property flags : UInt32
    property percent_frequency : UInt32
    def initialize(@frequency : UInt32, @flags : UInt32, @percent_frequency : UInt32)
    end
  end

  @[Extern]
  struct PPM_WMI_IDLE_STATE
    property latency : UInt32
    property power : UInt32
    property time_check : UInt32
    property promote_percent : UInt8
    property demote_percent : UInt8
    property state_type : UInt8
    property reserved : UInt8
    property state_flags : UInt32
    property context : UInt32
    property idle_handler : UInt32
    property reserved1 : UInt32
    def initialize(@latency : UInt32, @power : UInt32, @time_check : UInt32, @promote_percent : UInt8, @demote_percent : UInt8, @state_type : UInt8, @reserved : UInt8, @state_flags : UInt32, @context : UInt32, @idle_handler : UInt32, @reserved1 : UInt32)
    end
  end

  @[Extern]
  struct PPM_WMI_IDLE_STATES
    property type__ : UInt32
    property count : UInt32
    property target_state : UInt32
    property old_state : UInt32
    property target_processors : UInt64
    property state : Win32cr::System::Power::PPM_WMI_IDLE_STATE[1]
    def initialize(@type__ : UInt32, @count : UInt32, @target_state : UInt32, @old_state : UInt32, @target_processors : UInt64, @state : Win32cr::System::Power::PPM_WMI_IDLE_STATE[1])
    end
  end

  @[Extern]
  struct PPM_WMI_IDLE_STATES_EX
    property type__ : UInt32
    property count : UInt32
    property target_state : UInt32
    property old_state : UInt32
    property target_processors : Void*
    property state : Win32cr::System::Power::PPM_WMI_IDLE_STATE[1]
    def initialize(@type__ : UInt32, @count : UInt32, @target_state : UInt32, @old_state : UInt32, @target_processors : Void*, @state : Win32cr::System::Power::PPM_WMI_IDLE_STATE[1])
    end
  end

  @[Extern]
  struct PPM_WMI_PERF_STATE
    property frequency : UInt32
    property power : UInt32
    property percent_frequency : UInt8
    property increase_level : UInt8
    property decrease_level : UInt8
    property type__ : UInt8
    property increase_time : UInt32
    property decrease_time : UInt32
    property control : UInt64
    property status : UInt64
    property hit_count : UInt32
    property reserved1 : UInt32
    property reserved2 : UInt64
    property reserved3 : UInt64
    def initialize(@frequency : UInt32, @power : UInt32, @percent_frequency : UInt8, @increase_level : UInt8, @decrease_level : UInt8, @type__ : UInt8, @increase_time : UInt32, @decrease_time : UInt32, @control : UInt64, @status : UInt64, @hit_count : UInt32, @reserved1 : UInt32, @reserved2 : UInt64, @reserved3 : UInt64)
    end
  end

  @[Extern]
  struct PPM_WMI_PERF_STATES
    property count : UInt32
    property max_frequency : UInt32
    property current_state : UInt32
    property max_perf_state : UInt32
    property min_perf_state : UInt32
    property lowest_perf_state : UInt32
    property thermal_constraint : UInt32
    property busy_adj_threshold : UInt8
    property policy_type : UInt8
    property type__ : UInt8
    property reserved : UInt8
    property timer_interval : UInt32
    property target_processors : UInt64
    property p_state_handler : UInt32
    property p_state_context : UInt32
    property t_state_handler : UInt32
    property t_state_context : UInt32
    property feedback_handler : UInt32
    property reserved1 : UInt32
    property reserved2 : UInt64
    property state : Win32cr::System::Power::PPM_WMI_PERF_STATE[1]
    def initialize(@count : UInt32, @max_frequency : UInt32, @current_state : UInt32, @max_perf_state : UInt32, @min_perf_state : UInt32, @lowest_perf_state : UInt32, @thermal_constraint : UInt32, @busy_adj_threshold : UInt8, @policy_type : UInt8, @type__ : UInt8, @reserved : UInt8, @timer_interval : UInt32, @target_processors : UInt64, @p_state_handler : UInt32, @p_state_context : UInt32, @t_state_handler : UInt32, @t_state_context : UInt32, @feedback_handler : UInt32, @reserved1 : UInt32, @reserved2 : UInt64, @state : Win32cr::System::Power::PPM_WMI_PERF_STATE[1])
    end
  end

  @[Extern]
  struct PPM_WMI_PERF_STATES_EX
    property count : UInt32
    property max_frequency : UInt32
    property current_state : UInt32
    property max_perf_state : UInt32
    property min_perf_state : UInt32
    property lowest_perf_state : UInt32
    property thermal_constraint : UInt32
    property busy_adj_threshold : UInt8
    property policy_type : UInt8
    property type__ : UInt8
    property reserved : UInt8
    property timer_interval : UInt32
    property target_processors : Void*
    property p_state_handler : UInt32
    property p_state_context : UInt32
    property t_state_handler : UInt32
    property t_state_context : UInt32
    property feedback_handler : UInt32
    property reserved1 : UInt32
    property reserved2 : UInt64
    property state : Win32cr::System::Power::PPM_WMI_PERF_STATE[1]
    def initialize(@count : UInt32, @max_frequency : UInt32, @current_state : UInt32, @max_perf_state : UInt32, @min_perf_state : UInt32, @lowest_perf_state : UInt32, @thermal_constraint : UInt32, @busy_adj_threshold : UInt8, @policy_type : UInt8, @type__ : UInt8, @reserved : UInt8, @timer_interval : UInt32, @target_processors : Void*, @p_state_handler : UInt32, @p_state_context : UInt32, @t_state_handler : UInt32, @t_state_context : UInt32, @feedback_handler : UInt32, @reserved1 : UInt32, @reserved2 : UInt64, @state : Win32cr::System::Power::PPM_WMI_PERF_STATE[1])
    end
  end

  @[Extern]
  struct PPM_IDLE_STATE_ACCOUNTING
    property idle_transitions : UInt32
    property failed_transitions : UInt32
    property invalid_bucket_index : UInt32
    property total_time : UInt64
    property idle_time_buckets : UInt32[6]
    def initialize(@idle_transitions : UInt32, @failed_transitions : UInt32, @invalid_bucket_index : UInt32, @total_time : UInt64, @idle_time_buckets : UInt32[6])
    end
  end

  @[Extern]
  struct PPM_IDLE_ACCOUNTING
    property state_count : UInt32
    property total_transitions : UInt32
    property reset_count : UInt32
    property start_time : UInt64
    property state : Win32cr::System::Power::PPM_IDLE_STATE_ACCOUNTING[1]
    def initialize(@state_count : UInt32, @total_transitions : UInt32, @reset_count : UInt32, @start_time : UInt64, @state : Win32cr::System::Power::PPM_IDLE_STATE_ACCOUNTING[1])
    end
  end

  @[Extern]
  struct PPM_IDLE_STATE_BUCKET_EX
    property total_time_us : UInt64
    property min_time_us : UInt32
    property max_time_us : UInt32
    property count : UInt32
    def initialize(@total_time_us : UInt64, @min_time_us : UInt32, @max_time_us : UInt32, @count : UInt32)
    end
  end

  @[Extern]
  struct PPM_IDLE_STATE_ACCOUNTING_EX
    property total_time : UInt64
    property idle_transitions : UInt32
    property failed_transitions : UInt32
    property invalid_bucket_index : UInt32
    property min_time_us : UInt32
    property max_time_us : UInt32
    property cancelled_transitions : UInt32
    property idle_time_buckets : Win32cr::System::Power::PPM_IDLE_STATE_BUCKET_EX[16]
    def initialize(@total_time : UInt64, @idle_transitions : UInt32, @failed_transitions : UInt32, @invalid_bucket_index : UInt32, @min_time_us : UInt32, @max_time_us : UInt32, @cancelled_transitions : UInt32, @idle_time_buckets : Win32cr::System::Power::PPM_IDLE_STATE_BUCKET_EX[16])
    end
  end

  @[Extern]
  struct PPM_IDLE_ACCOUNTING_EX
    property state_count : UInt32
    property total_transitions : UInt32
    property reset_count : UInt32
    property abort_count : UInt32
    property start_time : UInt64
    property state : Win32cr::System::Power::PPM_IDLE_STATE_ACCOUNTING_EX[1]
    def initialize(@state_count : UInt32, @total_transitions : UInt32, @reset_count : UInt32, @abort_count : UInt32, @start_time : UInt64, @state : Win32cr::System::Power::PPM_IDLE_STATE_ACCOUNTING_EX[1])
    end
  end

  @[Extern]
  struct PPM_PERFSTATE_EVENT
    property state : UInt32
    property status : UInt32
    property latency : UInt32
    property speed : UInt32
    property processor : UInt32
    def initialize(@state : UInt32, @status : UInt32, @latency : UInt32, @speed : UInt32, @processor : UInt32)
    end
  end

  @[Extern]
  struct PPM_PERFSTATE_DOMAIN_EVENT
    property state : UInt32
    property latency : UInt32
    property speed : UInt32
    property processors : UInt64
    def initialize(@state : UInt32, @latency : UInt32, @speed : UInt32, @processors : UInt64)
    end
  end

  @[Extern]
  struct PPM_IDLESTATE_EVENT
    property new_state : UInt32
    property old_state : UInt32
    property processors : UInt64
    def initialize(@new_state : UInt32, @old_state : UInt32, @processors : UInt64)
    end
  end

  @[Extern]
  struct PPM_THERMALCHANGE_EVENT
    property thermal_constraint : UInt32
    property processors : UInt64
    def initialize(@thermal_constraint : UInt32, @processors : UInt64)
    end
  end

  @[Extern]
  struct PPM_THERMAL_POLICY_EVENT
    property mode : UInt8
    property processors : UInt64
    def initialize(@mode : UInt8, @processors : UInt64)
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
    property data : UInt8[1]
    def initialize(@power_setting : LibC::GUID, @data_length : UInt32, @data : UInt8[1])
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
    {% if !flag?(:docs) %}
    C.CallNtPowerInformation(information_level, input_buffer, input_buffer_length, output_buffer, output_buffer_length)
    {% end %}
  end

  def getPwrCapabilities(lpspc : Win32cr::System::Power::SYSTEM_POWER_CAPABILITIES*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.GetPwrCapabilities(lpspc)
    {% end %}
  end

  def powerDeterminePlatformRoleEx(version : Win32cr::System::Power::POWER_PLATFORM_ROLE_VERSION) : Win32cr::System::Power::POWER_PLATFORM_ROLE
    {% if !flag?(:docs) %}
    C.PowerDeterminePlatformRoleEx(version)
    {% end %}
  end

  def powerRegisterSuspendResumeNotification(flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerRegisterSuspendResumeNotification(flags, recipient, registration_handle)
    {% end %}
  end

  def powerUnregisterSuspendResumeNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerUnregisterSuspendResumeNotification(registration_handle)
    {% end %}
  end

  def powerReadACValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadACValue(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, type__, buffer, buffer_size)
    {% end %}
  end

  def powerReadDCValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadDCValue(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, type__, buffer, buffer_size)
    {% end %}
  end

  def powerWriteACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteACValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, ac_value_index)
    {% end %}
  end

  def powerWriteDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.PowerWriteDCValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, dc_value_index)
    {% end %}
  end

  def powerGetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, active_policy_guid : LibC::GUID**) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerGetActiveScheme(user_root_power_key, active_policy_guid)
    {% end %}
  end

  def powerSetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerSetActiveScheme(user_root_power_key, scheme_guid)
    {% end %}
  end

  def powerSettingRegisterNotification(setting_guid : LibC::GUID*, flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerSettingRegisterNotification(setting_guid, flags, recipient, registration_handle)
    {% end %}
  end

  def powerSettingUnregisterNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerSettingUnregisterNotification(registration_handle)
    {% end %}
  end

  def powerRegisterForEffectivePowerModeNotifications(version : UInt32, callback : Win32cr::System::Power::EFFECTIVE_POWER_MODE_CALLBACK, context : Void*, registration_handle : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PowerRegisterForEffectivePowerModeNotifications(version, callback, context, registration_handle)
    {% end %}
  end

  def powerUnregisterFromEffectivePowerModeNotifications(registration_handle : Void*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.PowerUnregisterFromEffectivePowerModeNotifications(registration_handle)
    {% end %}
  end

  def getPwrDiskSpindownRange(puiMax : UInt32*, puiMin : UInt32*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.GetPwrDiskSpindownRange(puiMax, puiMin)
    {% end %}
  end

  def enumPwrSchemes(lpfn : Win32cr::System::Power::PWRSCHEMESENUMPROC, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.EnumPwrSchemes(lpfn, lParam)
    {% end %}
  end

  def readGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.ReadGlobalPwrPolicy(pGlobalPowerPolicy)
    {% end %}
  end

  def readPwrScheme(uiID : UInt32, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.ReadPwrScheme(uiID, pPowerPolicy)
    {% end %}
  end

  def writePwrScheme(puiID : UInt32*, lpszSchemeName : Win32cr::Foundation::PWSTR, lpszDescription : Win32cr::Foundation::PWSTR, lpScheme : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.WritePwrScheme(puiID, lpszSchemeName, lpszDescription, lpScheme)
    {% end %}
  end

  def writeGlobalPwrPolicy(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.WriteGlobalPwrPolicy(pGlobalPowerPolicy)
    {% end %}
  end

  def deletePwrScheme(uiID : UInt32) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.DeletePwrScheme(uiID)
    {% end %}
  end

  def getActivePwrScheme(puiID : UInt32*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.GetActivePwrScheme(puiID)
    {% end %}
  end

  def setActivePwrScheme(uiID : UInt32, pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.SetActivePwrScheme(uiID, pGlobalPowerPolicy, pPowerPolicy)
    {% end %}
  end

  def isPwrSuspendAllowed : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsPwrSuspendAllowed
    {% end %}
  end

  def isPwrHibernateAllowed : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsPwrHibernateAllowed
    {% end %}
  end

  def isPwrShutdownAllowed : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsPwrShutdownAllowed
    {% end %}
  end

  def isAdminOverrideActive(papp : Win32cr::System::Power::ADMINISTRATOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.IsAdminOverrideActive(papp)
    {% end %}
  end

  def setSuspendState(bHibernate : Win32cr::Foundation::BOOLEAN, bForce : Win32cr::Foundation::BOOLEAN, bWakeupEventsDisabled : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.SetSuspendState(bHibernate, bForce, bWakeupEventsDisabled)
    {% end %}
  end

  def getCurrentPowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.GetCurrentPowerPolicies(pGlobalPowerPolicy, pPowerPolicy)
    {% end %}
  end

  def canUserWritePwrScheme : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.CanUserWritePwrScheme
    {% end %}
  end

  def readProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.ReadProcessorPwrScheme(uiID, pMachineProcessorPowerPolicy)
    {% end %}
  end

  def writeProcessorPwrScheme(uiID : UInt32, pMachineProcessorPowerPolicy : Win32cr::System::Power::MACHINE_PROCESSOR_POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.WriteProcessorPwrScheme(uiID, pMachineProcessorPowerPolicy)
    {% end %}
  end

  def validatePowerPolicies(pGlobalPowerPolicy : Win32cr::System::Power::GLOBAL_POWER_POLICY*, pPowerPolicy : Win32cr::System::Power::POWER_POLICY*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.ValidatePowerPolicies(pGlobalPowerPolicy, pPowerPolicy)
    {% end %}
  end

  def powerIsSettingRangeDefined(sub_key_guid : LibC::GUID*, setting_guid : LibC::GUID*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.PowerIsSettingRangeDefined(sub_key_guid, setting_guid)
    {% end %}
  end

  def powerSettingAccessCheckEx(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*, access_type : Win32cr::System::Registry::REG_SAM_FLAGS) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerSettingAccessCheckEx(access_flags, power_guid, access_type)
    {% end %}
  end

  def powerSettingAccessCheck(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerSettingAccessCheck(access_flags, power_guid)
    {% end %}
  end

  def powerGetUserConfiguredACPowerMode(power_mode_guid : LibC::GUID*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerGetUserConfiguredACPowerMode(power_mode_guid)
    {% end %}
  end

  def powerGetUserConfiguredDCPowerMode(power_mode_guid : LibC::GUID*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerGetUserConfiguredDCPowerMode(power_mode_guid)
    {% end %}
  end

  def powerSetUserConfiguredACPowerMode(power_mode_guid : LibC::GUID*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerSetUserConfiguredACPowerMode(power_mode_guid)
    {% end %}
  end

  def powerSetUserConfiguredDCPowerMode(power_mode_guid : LibC::GUID*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerSetUserConfiguredDCPowerMode(power_mode_guid)
    {% end %}
  end

  def powerReadACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadACValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, ac_value_index)
    {% end %}
  end

  def powerReadDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerReadDCValueIndex(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, dc_value_index)
    {% end %}
  end

  def powerReadFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadFriendlyName(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerReadDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadDescription(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerReadPossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadPossibleValue(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, type__, possible_setting_index, buffer, buffer_size)
    {% end %}
  end

  def powerReadPossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadPossibleFriendlyName(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
    {% end %}
  end

  def powerReadPossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadPossibleDescription(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
    {% end %}
  end

  def powerReadValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadValueMin(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_minimum)
    {% end %}
  end

  def powerReadValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadValueMax(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_maximum)
    {% end %}
  end

  def powerReadValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadValueIncrement(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_increment)
    {% end %}
  end

  def powerReadValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadValueUnitsSpecifier(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerReadACDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_default_index : UInt32*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerReadACDefaultIndex(root_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, ac_default_index)
    {% end %}
  end

  def powerReadDCDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_default_index : UInt32*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerReadDCDefaultIndex(root_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, dc_default_index)
    {% end %}
  end

  def powerReadIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReadIconResourceSpecifier(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerReadSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32
    {% if !flag?(:docs) %}
    C.PowerReadSettingAttributes(sub_group_guid, power_setting_guid)
    {% end %}
  end

  def powerWriteFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteFriendlyName(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerWriteDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteDescription(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerWritePossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWritePossibleValue(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, type__, possible_setting_index, buffer, buffer_size)
    {% end %}
  end

  def powerWritePossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWritePossibleFriendlyName(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
    {% end %}
  end

  def powerWritePossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWritePossibleDescription(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index, buffer, buffer_size)
    {% end %}
  end

  def powerWriteValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteValueMin(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_minimum)
    {% end %}
  end

  def powerWriteValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteValueMax(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_maximum)
    {% end %}
  end

  def powerWriteValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteValueIncrement(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, value_increment)
    {% end %}
  end

  def powerWriteValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteValueUnitsSpecifier(root_power_key, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerWriteACDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_ac_index : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.PowerWriteACDefaultIndex(root_system_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, default_ac_index)
    {% end %}
  end

  def powerWriteDCDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_dc_index : UInt32) : UInt32
    {% if !flag?(:docs) %}
    C.PowerWriteDCDefaultIndex(root_system_power_key, scheme_personality_guid, sub_group_of_power_settings_guid, power_setting_guid, default_dc_index)
    {% end %}
  end

  def powerWriteIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteIconResourceSpecifier(root_power_key, scheme_guid, sub_group_of_power_settings_guid, power_setting_guid, buffer, buffer_size)
    {% end %}
  end

  def powerWriteSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, attributes : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerWriteSettingAttributes(sub_group_guid, power_setting_guid, attributes)
    {% end %}
  end

  def powerDuplicateScheme(root_power_key : Win32cr::System::Registry::HKEY, source_scheme_guid : LibC::GUID*, destination_scheme_guid : LibC::GUID**) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerDuplicateScheme(root_power_key, source_scheme_guid, destination_scheme_guid)
    {% end %}
  end

  def powerImportPowerScheme(root_power_key : Win32cr::System::Registry::HKEY, import_file_name_path : Win32cr::Foundation::PWSTR, destination_scheme_guid : LibC::GUID**) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerImportPowerScheme(root_power_key, import_file_name_path, destination_scheme_guid)
    {% end %}
  end

  def powerDeleteScheme(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerDeleteScheme(root_power_key, scheme_guid)
    {% end %}
  end

  def powerRemovePowerSetting(power_setting_sub_key_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerRemovePowerSetting(power_setting_sub_key_guid, power_setting_guid)
    {% end %}
  end

  def powerCreateSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerCreateSetting(root_system_power_key, sub_group_of_power_settings_guid, power_setting_guid)
    {% end %}
  end

  def powerCreatePossibleSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerCreatePossibleSetting(root_system_power_key, sub_group_of_power_settings_guid, power_setting_guid, possible_setting_index)
    {% end %}
  end

  def powerEnumerate(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerEnumerate(root_power_key, scheme_guid, sub_group_of_power_settings_guid, access_flags, index, buffer, buffer_size)
    {% end %}
  end

  def powerOpenUserPowerKey(phUserPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32
    {% if !flag?(:docs) %}
    C.PowerOpenUserPowerKey(phUserPowerKey, access, open_existing)
    {% end %}
  end

  def powerOpenSystemPowerKey(phSystemPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32
    {% if !flag?(:docs) %}
    C.PowerOpenSystemPowerKey(phSystemPowerKey, access, open_existing)
    {% end %}
  end

  def powerCanRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerCanRestoreIndividualDefaultPowerScheme(scheme_guid)
    {% end %}
  end

  def powerRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerRestoreIndividualDefaultPowerScheme(scheme_guid)
    {% end %}
  end

  def powerRestoreDefaultPowerSchemes : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerRestoreDefaultPowerSchemes
    {% end %}
  end

  def powerReplaceDefaultPowerSchemes : UInt32
    {% if !flag?(:docs) %}
    C.PowerReplaceDefaultPowerSchemes
    {% end %}
  end

  def powerDeterminePlatformRole : Win32cr::System::Power::POWER_PLATFORM_ROLE
    {% if !flag?(:docs) %}
    C.PowerDeterminePlatformRole
    {% end %}
  end

  def devicePowerEnumDevices(query_index : UInt32, query_interpretation_flags : UInt32, query_flags : UInt32, pReturnBuffer : UInt8*, pBufferSize : UInt32*) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.DevicePowerEnumDevices(query_index, query_interpretation_flags, query_flags, pReturnBuffer, pBufferSize)
    {% end %}
  end

  def devicePowerSetDeviceState(device_description : Win32cr::Foundation::PWSTR, set_flags : UInt32, set_data : Void*) : UInt32
    {% if !flag?(:docs) %}
    C.DevicePowerSetDeviceState(device_description, set_flags, set_data)
    {% end %}
  end

  def devicePowerOpen(debug_mask : UInt32) : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.DevicePowerOpen(debug_mask)
    {% end %}
  end

  def devicePowerClose : Win32cr::Foundation::BOOLEAN
    {% if !flag?(:docs) %}
    C.DevicePowerClose
    {% end %}
  end

  def powerReportThermalEvent(event : Win32cr::System::Power::THERMAL_EVENT*) : Win32cr::Foundation::WIN32_ERROR
    {% if !flag?(:docs) %}
    C.PowerReportThermalEvent(event)
    {% end %}
  end

  def registerPowerSettingNotification(hRecipient : Win32cr::Foundation::HANDLE, power_setting_guid : LibC::GUID*, flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS) : Win32cr::System::Power::HPOWERNOTIFY
    {% if !flag?(:docs) %}
    C.RegisterPowerSettingNotification(hRecipient, power_setting_guid, flags)
    {% end %}
  end

  def unregisterPowerSettingNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.UnregisterPowerSettingNotification(handle)
    {% end %}
  end

  def registerSuspendResumeNotification(hRecipient : Win32cr::Foundation::HANDLE, flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS) : Win32cr::System::Power::HPOWERNOTIFY
    {% if !flag?(:docs) %}
    C.RegisterSuspendResumeNotification(hRecipient, flags)
    {% end %}
  end

  def unregisterSuspendResumeNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.UnregisterSuspendResumeNotification(handle)
    {% end %}
  end

  def requestWakeupLatency(latency : Win32cr::System::Power::LATENCY_TIME) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.RequestWakeupLatency(latency)
    {% end %}
  end

  def isSystemResumeAutomatic : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.IsSystemResumeAutomatic
    {% end %}
  end

  def setThreadExecutionState(esFlags : Win32cr::System::Power::EXECUTION_STATE) : Win32cr::System::Power::EXECUTION_STATE
    {% if !flag?(:docs) %}
    C.SetThreadExecutionState(esFlags)
    {% end %}
  end

  def powerCreateRequest(context : Win32cr::System::Threading::REASON_CONTEXT*) : Win32cr::Foundation::HANDLE
    {% if !flag?(:docs) %}
    C.PowerCreateRequest(context)
    {% end %}
  end

  def powerSetRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.PowerSetRequest(power_request, request_type)
    {% end %}
  end

  def powerClearRequest(power_request : Win32cr::Foundation::HANDLE, request_type : Win32cr::System::Power::POWER_REQUEST_TYPE) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.PowerClearRequest(power_request, request_type)
    {% end %}
  end

  def getDevicePowerState(hDevice : Win32cr::Foundation::HANDLE, pfOn : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetDevicePowerState(hDevice, pfOn)
    {% end %}
  end

  def setSystemPowerState(fSuspend : Win32cr::Foundation::BOOL, fForce : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.SetSystemPowerState(fSuspend, fForce)
    {% end %}
  end

  def getSystemPowerStatus(lpSystemPowerStatus : Win32cr::System::Power::SYSTEM_POWER_STATUS*) : Win32cr::Foundation::BOOL
    {% if !flag?(:docs) %}
    C.GetSystemPowerStatus(lpSystemPowerStatus)
    {% end %}
  end

  @[Link("powrprof")]
  @[Link("user32")]
  @[Link("kernel32")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun CallNtPowerInformation(information_level : Win32cr::System::Power::POWER_INFORMATION_LEVEL, input_buffer : Void*, input_buffer_length : UInt32, output_buffer : Void*, output_buffer_length : UInt32) : Win32cr::Foundation::NTSTATUS

    # :nodoc:
    fun GetPwrCapabilities(lpspc : Win32cr::System::Power::SYSTEM_POWER_CAPABILITIES*) : Win32cr::Foundation::BOOLEAN

    # :nodoc:
    fun PowerDeterminePlatformRoleEx(version : Win32cr::System::Power::POWER_PLATFORM_ROLE_VERSION) : Win32cr::System::Power::POWER_PLATFORM_ROLE

    # :nodoc:
    fun PowerRegisterSuspendResumeNotification(flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerUnregisterSuspendResumeNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadACValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadDCValue(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32) : UInt32

    # :nodoc:
    fun PowerGetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, active_policy_guid : LibC::GUID**) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerSetActiveScheme(user_root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerSettingRegisterNotification(setting_guid : LibC::GUID*, flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS, recipient : Win32cr::Foundation::HANDLE, registration_handle : Void**) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerSettingUnregisterNotification(registration_handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::WIN32_ERROR

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
    fun PowerSettingAccessCheckEx(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*, access_type : Win32cr::System::Registry::REG_SAM_FLAGS) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerSettingAccessCheck(access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, power_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerGetUserConfiguredACPowerMode(power_mode_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerGetUserConfiguredDCPowerMode(power_mode_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerSetUserConfiguredACPowerMode(power_mode_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerSetUserConfiguredDCPowerMode(power_mode_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerReadACValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_value_index : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadDCValueIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_value_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadPossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadPossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadPossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadACDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, ac_default_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadDCDefaultIndex(root_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, dc_default_index : UInt32*) : UInt32

    # :nodoc:
    fun PowerReadIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerReadSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : UInt32

    # :nodoc:
    fun PowerWriteFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteDescription(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWritePossibleValue(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, type__ : UInt32, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWritePossibleFriendlyName(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWritePossibleDescription(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteValueMin(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_minimum : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteValueMax(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_maximum : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteValueIncrement(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, value_increment : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteValueUnitsSpecifier(root_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteACDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_ac_index : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteDCDefaultIndex(root_system_power_key : Win32cr::System::Registry::HKEY, scheme_personality_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, default_dc_index : UInt32) : UInt32

    # :nodoc:
    fun PowerWriteIconResourceSpecifier(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, buffer : UInt8*, buffer_size : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerWriteSettingAttributes(sub_group_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, attributes : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerDuplicateScheme(root_power_key : Win32cr::System::Registry::HKEY, source_scheme_guid : LibC::GUID*, destination_scheme_guid : LibC::GUID**) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerImportPowerScheme(root_power_key : Win32cr::System::Registry::HKEY, import_file_name_path : Win32cr::Foundation::PWSTR, destination_scheme_guid : LibC::GUID**) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerDeleteScheme(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerRemovePowerSetting(power_setting_sub_key_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerCreateSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerCreatePossibleSetting(root_system_power_key : Win32cr::System::Registry::HKEY, sub_group_of_power_settings_guid : LibC::GUID*, power_setting_guid : LibC::GUID*, possible_setting_index : UInt32) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerEnumerate(root_power_key : Win32cr::System::Registry::HKEY, scheme_guid : LibC::GUID*, sub_group_of_power_settings_guid : LibC::GUID*, access_flags : Win32cr::System::Power::POWER_DATA_ACCESSOR, index : UInt32, buffer : UInt8*, buffer_size : UInt32*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerOpenUserPowerKey(phUserPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun PowerOpenSystemPowerKey(phSystemPowerKey : Win32cr::System::Registry::HKEY*, access : UInt32, open_existing : Win32cr::Foundation::BOOL) : UInt32

    # :nodoc:
    fun PowerCanRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerRestoreIndividualDefaultPowerScheme(scheme_guid : LibC::GUID*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun PowerRestoreDefaultPowerSchemes : Win32cr::Foundation::WIN32_ERROR

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
    fun PowerReportThermalEvent(event : Win32cr::System::Power::THERMAL_EVENT*) : Win32cr::Foundation::WIN32_ERROR

    # :nodoc:
    fun RegisterPowerSettingNotification(hRecipient : Win32cr::Foundation::HANDLE, power_setting_guid : LibC::GUID*, flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS) : Win32cr::System::Power::HPOWERNOTIFY

    # :nodoc:
    fun UnregisterPowerSettingNotification(handle : Win32cr::System::Power::HPOWERNOTIFY) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun RegisterSuspendResumeNotification(hRecipient : Win32cr::Foundation::HANDLE, flags : Win32cr::UI::WindowsAndMessaging::REGISTER_NOTIFICATION_FLAGS) : Win32cr::System::Power::HPOWERNOTIFY

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
  {% end %}
end