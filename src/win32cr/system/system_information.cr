require "./diagnostics/debug.cr"
require "./../foundation.cr"

module Win32cr::System::SystemInformation
  alias FIRMWARE_TABLE_ID = UInt32
  alias PGET_SYSTEM_WOW64_DIRECTORY_A = Proc(UInt8*, UInt32, UInt32)

  alias PGET_SYSTEM_WOW64_DIRECTORY_W = Proc(UInt16*, UInt32, UInt32)

  NTDDI_WIN2K = 83886080_u32
  NTDDI_WINXP = 83951616_u32
  NTDDI_WINXPSP2 = 83952128_u32
  NTDDI_WS03SP1 = 84017408_u32
  NTDDI_VISTA = 100663296_u32
  NTDDI_VISTASP1 = 100663552_u32
  NTDDI_WIN7 = 100728832_u32
  NTDDI_WIN8 = 100794368_u32
  NTDDI_WINBLUE = 100859904_u32
  NTDDI_WINTHRESHOLD = 167772160_u32
  SYSTEM_CPU_SET_INFORMATION_PARKED = 1_u32
  SYSTEM_CPU_SET_INFORMATION_ALLOCATED = 2_u32
  SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS = 4_u32
  SYSTEM_CPU_SET_INFORMATION_REALTIME = 8_u32
  WIN32_WINNT_NT4_ = 1024_u32
  WIN32_WINNT_WIN2K_ = 1280_u32
  WIN32_WINNT_WINXP_ = 1281_u32
  WIN32_WINNT_WS03_ = 1282_u32
  WIN32_WINNT_WIN6_ = 1536_u32
  WIN32_WINNT_VISTA_ = 1536_u32
  WIN32_WINNT_WS08_ = 1536_u32
  WIN32_WINNT_LONGHORN_ = 1536_u32
  WIN32_WINNT_WIN7_ = 1537_u32
  WIN32_WINNT_WIN8_ = 1538_u32
  WIN32_WINNT_WINBLUE_ = 1539_u32
  WIN32_WINNT_WINTHRESHOLD_ = 2560_u32
  WIN32_WINNT_WIN10_ = 2560_u32
  WIN32_IE_IE20_ = 512_u32
  WIN32_IE_IE30_ = 768_u32
  WIN32_IE_IE302_ = 770_u32
  WIN32_IE_IE40_ = 1024_u32
  WIN32_IE_IE401_ = 1025_u32
  WIN32_IE_IE50_ = 1280_u32
  WIN32_IE_IE501_ = 1281_u32
  WIN32_IE_IE55_ = 1360_u32
  WIN32_IE_IE60_ = 1536_u32
  WIN32_IE_IE60SP1_ = 1537_u32
  WIN32_IE_IE60SP2_ = 1539_u32
  WIN32_IE_IE70_ = 1792_u32
  WIN32_IE_IE80_ = 2048_u32
  WIN32_IE_IE90_ = 2304_u32
  WIN32_IE_IE100_ = 2560_u32
  WIN32_IE_IE110_ = 2560_u32
  WIN32_IE_NT4_ = 512_u32
  WIN32_IE_NT4SP1_ = 512_u32
  WIN32_IE_NT4SP2_ = 512_u32
  WIN32_IE_NT4SP3_ = 770_u32
  WIN32_IE_NT4SP4_ = 1025_u32
  WIN32_IE_NT4SP5_ = 1025_u32
  WIN32_IE_NT4SP6_ = 1280_u32
  WIN32_IE_WIN98_ = 1025_u32
  WIN32_IE_WIN98SE_ = 1280_u32
  WIN32_IE_WINME_ = 1360_u32
  WIN32_IE_WIN2K_ = 1281_u32
  WIN32_IE_WIN2KSP1_ = 1281_u32
  WIN32_IE_WIN2KSP2_ = 1281_u32
  WIN32_IE_WIN2KSP3_ = 1281_u32
  WIN32_IE_WIN2KSP4_ = 1281_u32
  WIN32_IE_XP_ = 1536_u32
  WIN32_IE_XPSP1_ = 1537_u32
  WIN32_IE_XPSP2_ = 1539_u32
  WIN32_IE_WS03_ = 1538_u32
  WIN32_IE_WS03SP1_ = 1539_u32
  WIN32_IE_WIN6_ = 1792_u32
  WIN32_IE_LONGHORN_ = 1792_u32
  WIN32_IE_WIN7_ = 2048_u32
  WIN32_IE_WIN8_ = 2560_u32
  WIN32_IE_WINBLUE_ = 2560_u32
  WIN32_IE_WINTHRESHOLD_ = 2560_u32
  WIN32_IE_WIN10_ = 2560_u32
  NTDDI_WIN4 = 67108864_u32
  NTDDI_WIN2KSP1 = 83886336_u32
  NTDDI_WIN2KSP2 = 83886592_u32
  NTDDI_WIN2KSP3 = 83886848_u32
  NTDDI_WIN2KSP4 = 83887104_u32
  NTDDI_WINXPSP1 = 83951872_u32
  NTDDI_WINXPSP3 = 83952384_u32
  NTDDI_WINXPSP4 = 83952640_u32
  NTDDI_WS03 = 84017152_u32
  NTDDI_WS03SP2 = 84017664_u32
  NTDDI_WS03SP3 = 84017920_u32
  NTDDI_WS03SP4 = 84018176_u32
  NTDDI_WIN6 = 100663296_u32
  NTDDI_WIN6SP1 = 100663552_u32
  NTDDI_WIN6SP2 = 100663808_u32
  NTDDI_WIN6SP3 = 100664064_u32
  NTDDI_WIN6SP4 = 100664320_u32
  NTDDI_VISTASP2 = 100663808_u32
  NTDDI_VISTASP3 = 100664064_u32
  NTDDI_VISTASP4 = 100664320_u32
  NTDDI_LONGHORN = 100663296_u32
  NTDDI_WS08 = 100663552_u32
  NTDDI_WS08SP2 = 100663808_u32
  NTDDI_WS08SP3 = 100664064_u32
  NTDDI_WS08SP4 = 100664320_u32
  NTDDI_WIN10 = 167772160_u32
  NTDDI_WIN10_TH2 = 167772161_u32
  NTDDI_WIN10_RS1 = 167772162_u32
  NTDDI_WIN10_RS2 = 167772163_u32
  NTDDI_WIN10_RS3 = 167772164_u32
  NTDDI_WIN10_RS4 = 167772165_u32
  NTDDI_WIN10_RS5 = 167772166_u32
  NTDDI_WIN10_19H1 = 167772167_u32
  NTDDI_WIN10_VB = 167772168_u32
  NTDDI_WIN10_MN = 167772169_u32
  NTDDI_WIN10_FE = 167772170_u32
  NTDDI_WIN10_CO = 167772171_u32
  WDK_NTDDI_VERSION = 167772171_u32
  OSVERSION_MASK = 4294901760_u32
  SPVERSION_MASK = 65280_u32
  SUBVERSION_MASK = 255_u32
  NTDDI_VERSION = 167772171_u32
  SCEX2_ALT_NETBIOS_NAME = 1_u32

  @[Flags]
  enum VER_FLAGS : UInt32
    VER_MINORVERSION = 1_u32
    VER_MAJORVERSION = 2_u32
    VER_BUILDNUMBER = 4_u32
    VER_PLATFORMID = 8_u32
    VER_SERVICEPACKMINOR = 16_u32
    VER_SERVICEPACKMAJOR = 32_u32
    VER_SUITENAME = 64_u32
    VER_PRODUCT_TYPE = 128_u32
  end
  enum IMAGE_FILE_MACHINE : UInt16
    IMAGE_FILE_MACHINE_AXP64 = 644_u16
    IMAGE_FILE_MACHINE_I386 = 332_u16
    IMAGE_FILE_MACHINE_IA64 = 512_u16
    IMAGE_FILE_MACHINE_AMD64 = 34404_u16
    IMAGE_FILE_MACHINE_UNKNOWN = 0_u16
    IMAGE_FILE_MACHINE_TARGET_HOST = 1_u16
    IMAGE_FILE_MACHINE_R3000 = 354_u16
    IMAGE_FILE_MACHINE_R4000 = 358_u16
    IMAGE_FILE_MACHINE_R10000 = 360_u16
    IMAGE_FILE_MACHINE_WCEMIPSV2 = 361_u16
    IMAGE_FILE_MACHINE_ALPHA = 388_u16
    IMAGE_FILE_MACHINE_SH3 = 418_u16
    IMAGE_FILE_MACHINE_SH3DSP = 419_u16
    IMAGE_FILE_MACHINE_SH3E = 420_u16
    IMAGE_FILE_MACHINE_SH4 = 422_u16
    IMAGE_FILE_MACHINE_SH5 = 424_u16
    IMAGE_FILE_MACHINE_ARM = 448_u16
    IMAGE_FILE_MACHINE_THUMB = 450_u16
    IMAGE_FILE_MACHINE_ARMNT = 452_u16
    IMAGE_FILE_MACHINE_AM33 = 467_u16
    IMAGE_FILE_MACHINE_POWERPC = 496_u16
    IMAGE_FILE_MACHINE_POWERPCFP = 497_u16
    IMAGE_FILE_MACHINE_MIPS16 = 614_u16
    IMAGE_FILE_MACHINE_ALPHA64 = 644_u16
    IMAGE_FILE_MACHINE_MIPSFPU = 870_u16
    IMAGE_FILE_MACHINE_MIPSFPU16 = 1126_u16
    IMAGE_FILE_MACHINE_TRICORE = 1312_u16
    IMAGE_FILE_MACHINE_CEF = 3311_u16
    IMAGE_FILE_MACHINE_EBC = 3772_u16
    IMAGE_FILE_MACHINE_M32R = 36929_u16
    IMAGE_FILE_MACHINE_ARM64 = 43620_u16
    IMAGE_FILE_MACHINE_CEE = 49390_u16
  end
  enum FIRMWARE_TABLE_PROVIDER : UInt32
    ACPI = 1094930505_u32
    FIRM = 1179210317_u32
    RSMB = 1381190978_u32
  end
  enum USER_CET_ENVIRONMENT : UInt32
    USER_CET_ENVIRONMENT_WIN32_PROCESS = 0_u32
    USER_CET_ENVIRONMENT_SGX2_ENCLAVE = 2_u32
    USER_CET_ENVIRONMENT_VBS_ENCLAVE = 16_u32
    USER_CET_ENVIRONMENT_VBS_BASIC_ENCLAVE = 17_u32
  end
  enum OS_PRODUCT_TYPE : UInt32
    PRODUCT_BUSINESS = 6_u32
    PRODUCT_BUSINESS_N = 16_u32
    PRODUCT_CLUSTER_SERVER = 18_u32
    PRODUCT_CLUSTER_SERVER_V = 64_u32
    PRODUCT_CORE = 101_u32
    PRODUCT_CORE_COUNTRYSPECIFIC = 99_u32
    PRODUCT_CORE_N = 98_u32
    PRODUCT_CORE_SINGLELANGUAGE = 100_u32
    PRODUCT_DATACENTER_EVALUATION_SERVER = 80_u32
    PRODUCT_DATACENTER_A_SERVER_CORE = 145_u32
    PRODUCT_STANDARD_A_SERVER_CORE = 146_u32
    PRODUCT_DATACENTER_SERVER = 8_u32
    PRODUCT_DATACENTER_SERVER_CORE = 12_u32
    PRODUCT_DATACENTER_SERVER_CORE_V = 39_u32
    PRODUCT_DATACENTER_SERVER_V = 37_u32
    PRODUCT_EDUCATION = 121_u32
    PRODUCT_EDUCATION_N = 122_u32
    PRODUCT_ENTERPRISE = 4_u32
    PRODUCT_ENTERPRISE_E = 70_u32
    PRODUCT_ENTERPRISE_EVALUATION = 72_u32
    PRODUCT_ENTERPRISE_N = 27_u32
    PRODUCT_ENTERPRISE_N_EVALUATION = 84_u32
    PRODUCT_ENTERPRISE_S = 125_u32
    PRODUCT_ENTERPRISE_S_EVALUATION = 129_u32
    PRODUCT_ENTERPRISE_S_N = 126_u32
    PRODUCT_ENTERPRISE_S_N_EVALUATION = 130_u32
    PRODUCT_ENTERPRISE_SERVER = 10_u32
    PRODUCT_ENTERPRISE_SERVER_CORE = 14_u32
    PRODUCT_ENTERPRISE_SERVER_CORE_V = 41_u32
    PRODUCT_ENTERPRISE_SERVER_IA64 = 15_u32
    PRODUCT_ENTERPRISE_SERVER_V = 38_u32
    PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL = 60_u32
    PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC = 62_u32
    PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT = 59_u32
    PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC = 61_u32
    PRODUCT_HOME_BASIC = 2_u32
    PRODUCT_HOME_BASIC_E = 67_u32
    PRODUCT_HOME_BASIC_N = 5_u32
    PRODUCT_HOME_PREMIUM = 3_u32
    PRODUCT_HOME_PREMIUM_E = 68_u32
    PRODUCT_HOME_PREMIUM_N = 26_u32
    PRODUCT_HOME_PREMIUM_SERVER = 34_u32
    PRODUCT_HOME_SERVER = 19_u32
    PRODUCT_HYPERV = 42_u32
    PRODUCT_IOTUAP = 123_u32
    PRODUCT_IOTUAPCOMMERCIAL = 131_u32
    PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT = 30_u32
    PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING = 32_u32
    PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY = 31_u32
    PRODUCT_MOBILE_CORE = 104_u32
    PRODUCT_MOBILE_ENTERPRISE = 133_u32
    PRODUCT_MULTIPOINT_PREMIUM_SERVER = 77_u32
    PRODUCT_MULTIPOINT_STANDARD_SERVER = 76_u32
    PRODUCT_PRO_WORKSTATION = 161_u32
    PRODUCT_PRO_WORKSTATION_N = 162_u32
    PRODUCT_PROFESSIONAL = 48_u32
    PRODUCT_PROFESSIONAL_E = 69_u32
    PRODUCT_PROFESSIONAL_N = 49_u32
    PRODUCT_PROFESSIONAL_WMC = 103_u32
    PRODUCT_SB_SOLUTION_SERVER = 50_u32
    PRODUCT_SB_SOLUTION_SERVER_EM = 54_u32
    PRODUCT_SERVER_FOR_SB_SOLUTIONS = 51_u32
    PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM = 55_u32
    PRODUCT_SERVER_FOR_SMALLBUSINESS = 24_u32
    PRODUCT_SERVER_FOR_SMALLBUSINESS_V = 35_u32
    PRODUCT_SERVER_FOUNDATION = 33_u32
    PRODUCT_SMALLBUSINESS_SERVER = 9_u32
    PRODUCT_SMALLBUSINESS_SERVER_PREMIUM = 25_u32
    PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE = 63_u32
    PRODUCT_SOLUTION_EMBEDDEDSERVER = 56_u32
    PRODUCT_STANDARD_EVALUATION_SERVER = 79_u32
    PRODUCT_STANDARD_SERVER = 7_u32
    PRODUCT_STANDARD_SERVER_CORE_ = 13_u32
    PRODUCT_STANDARD_SERVER_CORE_V = 40_u32
    PRODUCT_STANDARD_SERVER_V = 36_u32
    PRODUCT_STANDARD_SERVER_SOLUTIONS = 52_u32
    PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE = 53_u32
    PRODUCT_STARTER = 11_u32
    PRODUCT_STARTER_E = 66_u32
    PRODUCT_STARTER_N = 47_u32
    PRODUCT_STORAGE_ENTERPRISE_SERVER = 23_u32
    PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE = 46_u32
    PRODUCT_STORAGE_EXPRESS_SERVER = 20_u32
    PRODUCT_STORAGE_EXPRESS_SERVER_CORE = 43_u32
    PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER = 96_u32
    PRODUCT_STORAGE_STANDARD_SERVER = 21_u32
    PRODUCT_STORAGE_STANDARD_SERVER_CORE = 44_u32
    PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER = 95_u32
    PRODUCT_STORAGE_WORKGROUP_SERVER = 22_u32
    PRODUCT_STORAGE_WORKGROUP_SERVER_CORE = 45_u32
    PRODUCT_ULTIMATE = 1_u32
    PRODUCT_ULTIMATE_E = 71_u32
    PRODUCT_ULTIMATE_N = 28_u32
    PRODUCT_UNDEFINED = 0_u32
    PRODUCT_WEB_SERVER = 17_u32
    PRODUCT_WEB_SERVER_CORE = 29_u32
  end
  enum DEVICEFAMILYINFOENUM : UInt32
    DEVICEFAMILYINFOENUM_UAP = 0_u32
    DEVICEFAMILYINFOENUM_WINDOWS_8X = 1_u32
    DEVICEFAMILYINFOENUM_WINDOWS_PHONE_8X = 2_u32
    DEVICEFAMILYINFOENUM_DESKTOP = 3_u32
    DEVICEFAMILYINFOENUM_MOBILE = 4_u32
    DEVICEFAMILYINFOENUM_XBOX = 5_u32
    DEVICEFAMILYINFOENUM_TEAM = 6_u32
    DEVICEFAMILYINFOENUM_IOT = 7_u32
    DEVICEFAMILYINFOENUM_IOT_HEADLESS = 8_u32
    DEVICEFAMILYINFOENUM_SERVER = 9_u32
    DEVICEFAMILYINFOENUM_HOLOGRAPHIC = 10_u32
    DEVICEFAMILYINFOENUM_XBOXSRA = 11_u32
    DEVICEFAMILYINFOENUM_XBOXERA = 12_u32
    DEVICEFAMILYINFOENUM_SERVER_NANO = 13_u32
    DEVICEFAMILYINFOENUM_8828080 = 14_u32
    DEVICEFAMILYINFOENUM_7067329 = 15_u32
    DEVICEFAMILYINFOENUM_WINDOWS_CORE = 16_u32
    DEVICEFAMILYINFOENUM_WINDOWS_CORE_HEADLESS = 17_u32
    DEVICEFAMILYINFOENUM_MAX = 17_u32
  end
  enum DEVICEFAMILYDEVICEFORM : UInt32
    DEVICEFAMILYDEVICEFORM_UNKNOWN = 0_u32
    DEVICEFAMILYDEVICEFORM_PHONE = 1_u32
    DEVICEFAMILYDEVICEFORM_TABLET = 2_u32
    DEVICEFAMILYDEVICEFORM_DESKTOP = 3_u32
    DEVICEFAMILYDEVICEFORM_NOTEBOOK = 4_u32
    DEVICEFAMILYDEVICEFORM_CONVERTIBLE = 5_u32
    DEVICEFAMILYDEVICEFORM_DETACHABLE = 6_u32
    DEVICEFAMILYDEVICEFORM_ALLINONE = 7_u32
    DEVICEFAMILYDEVICEFORM_STICKPC = 8_u32
    DEVICEFAMILYDEVICEFORM_PUCK = 9_u32
    DEVICEFAMILYDEVICEFORM_LARGESCREEN = 10_u32
    DEVICEFAMILYDEVICEFORM_HMD = 11_u32
    DEVICEFAMILYDEVICEFORM_INDUSTRY_HANDHELD = 12_u32
    DEVICEFAMILYDEVICEFORM_INDUSTRY_TABLET = 13_u32
    DEVICEFAMILYDEVICEFORM_BANKING = 14_u32
    DEVICEFAMILYDEVICEFORM_BUILDING_AUTOMATION = 15_u32
    DEVICEFAMILYDEVICEFORM_DIGITAL_SIGNAGE = 16_u32
    DEVICEFAMILYDEVICEFORM_GAMING = 17_u32
    DEVICEFAMILYDEVICEFORM_HOME_AUTOMATION = 18_u32
    DEVICEFAMILYDEVICEFORM_INDUSTRIAL_AUTOMATION = 19_u32
    DEVICEFAMILYDEVICEFORM_KIOSK = 20_u32
    DEVICEFAMILYDEVICEFORM_MAKER_BOARD = 21_u32
    DEVICEFAMILYDEVICEFORM_MEDICAL = 22_u32
    DEVICEFAMILYDEVICEFORM_NETWORKING = 23_u32
    DEVICEFAMILYDEVICEFORM_POINT_OF_SERVICE = 24_u32
    DEVICEFAMILYDEVICEFORM_PRINTING = 25_u32
    DEVICEFAMILYDEVICEFORM_THIN_CLIENT = 26_u32
    DEVICEFAMILYDEVICEFORM_TOY = 27_u32
    DEVICEFAMILYDEVICEFORM_VENDING = 28_u32
    DEVICEFAMILYDEVICEFORM_INDUSTRY_OTHER = 29_u32
    DEVICEFAMILYDEVICEFORM_XBOX_ONE = 30_u32
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_S = 31_u32
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_X = 32_u32
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_X_DEVKIT = 33_u32
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X = 34_u32
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X_DEVKIT = 35_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_00 = 36_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_01 = 37_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_02 = 38_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_03 = 39_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_04 = 40_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_05 = 41_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_06 = 42_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_07 = 43_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_08 = 44_u32
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_09 = 45_u32
    DEVICEFAMILYDEVICEFORM_MAX = 45_u32
  end
  enum COMPUTER_NAME_FORMAT
    ComputerNameNetBIOS = 0_i32
    ComputerNameDnsHostname = 1_i32
    ComputerNameDnsDomain = 2_i32
    ComputerNameDnsFullyQualified = 3_i32
    ComputerNamePhysicalNetBIOS = 4_i32
    ComputerNamePhysicalDnsHostname = 5_i32
    ComputerNamePhysicalDnsDomain = 6_i32
    ComputerNamePhysicalDnsFullyQualified = 7_i32
    ComputerNameMax = 8_i32
  end
  enum FIRMWARE_TYPE
    FirmwareTypeUnknown = 0_i32
    FirmwareTypeBios = 1_i32
    FirmwareTypeUefi = 2_i32
    FirmwareTypeMax = 3_i32
  end
  enum LOGICAL_PROCESSOR_RELATIONSHIP
    RelationProcessorCore = 0_i32
    RelationNumaNode = 1_i32
    RelationCache = 2_i32
    RelationProcessorPackage = 3_i32
    RelationGroup = 4_i32
    RelationProcessorDie = 5_i32
    RelationNumaNodeEx = 6_i32
    RelationProcessorModule = 7_i32
    RelationAll = 65535_i32
  end
  enum PROCESSOR_CACHE_TYPE
    CacheUnified = 0_i32
    CacheInstruction = 1_i32
    CacheData = 2_i32
    CacheTrace = 3_i32
  end
  enum CPU_SET_INFORMATION_TYPE
    CpuSetInformation = 0_i32
  end
  enum OS_DEPLOYEMENT_STATE_VALUES
    OS_DEPLOYMENT_STANDARD = 1_i32
    OS_DEPLOYMENT_COMPACT = 2_i32
  end
  enum RTL_SYSTEM_GLOBAL_DATA_ID
    GlobalDataIdUnknown = 0_i32
    GlobalDataIdRngSeedVersion = 1_i32
    GlobalDataIdInterruptTime = 2_i32
    GlobalDataIdTimeZoneBias = 3_i32
    GlobalDataIdImageNumberLow = 4_i32
    GlobalDataIdImageNumberHigh = 5_i32
    GlobalDataIdTimeZoneId = 6_i32
    GlobalDataIdNtMajorVersion = 7_i32
    GlobalDataIdNtMinorVersion = 8_i32
    GlobalDataIdSystemExpirationDate = 9_i32
    GlobalDataIdKdDebuggerEnabled = 10_i32
    GlobalDataIdCyclesPerYield = 11_i32
    GlobalDataIdSafeBootMode = 12_i32
    GlobalDataIdLastSystemRITEventTickCount = 13_i32
  end
  enum DEP_SYSTEM_POLICY_TYPE
    DEPPolicyAlwaysOff = 0_i32
    DEPPolicyAlwaysOn = 1_i32
    DEPPolicyOptIn = 2_i32
    DEPPolicyOptOut = 3_i32
    DEPTotalPolicyCount = 4_i32
  end

  @[Extern]
  struct GROUP_AFFINITY
    property mask : LibC::UIntPtrT
    property group : UInt16
    property reserved : UInt16[3]
    def initialize(@mask : LibC::UIntPtrT, @group : UInt16, @reserved : UInt16[3])
    end
  end

  @[Extern]
  struct SYSTEM_INFO
    property anonymous : Anonymous_e__Union_
    property dwPageSize : UInt32
    property lpMinimumApplicationAddress : Void*
    property lpMaximumApplicationAddress : Void*
    property dwActiveProcessorMask : LibC::UIntPtrT
    property dwNumberOfProcessors : UInt32
    property dwProcessorType : UInt32
    property dwAllocationGranularity : UInt32
    property wProcessorLevel : UInt16
    property wProcessorRevision : UInt16

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property dwOemId : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property wProcessorArchitecture : Win32cr::System::Diagnostics::Debug::PROCESSOR_ARCHITECTURE
    property wReserved : UInt16
    def initialize(@wProcessorArchitecture : Win32cr::System::Diagnostics::Debug::PROCESSOR_ARCHITECTURE, @wReserved : UInt16)
    end
      end

    def initialize(@dwOemId : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@anonymous : Anonymous_e__Union_, @dwPageSize : UInt32, @lpMinimumApplicationAddress : Void*, @lpMaximumApplicationAddress : Void*, @dwActiveProcessorMask : LibC::UIntPtrT, @dwNumberOfProcessors : UInt32, @dwProcessorType : UInt32, @dwAllocationGranularity : UInt32, @wProcessorLevel : UInt16, @wProcessorRevision : UInt16)
    end
  end

  @[Extern]
  struct MEMORYSTATUSEX
    property dwLength : UInt32
    property dwMemoryLoad : UInt32
    property ullTotalPhys : UInt64
    property ullAvailPhys : UInt64
    property ullTotalPageFile : UInt64
    property ullAvailPageFile : UInt64
    property ullTotalVirtual : UInt64
    property ullAvailVirtual : UInt64
    property ullAvailExtendedVirtual : UInt64
    def initialize(@dwLength : UInt32, @dwMemoryLoad : UInt32, @ullTotalPhys : UInt64, @ullAvailPhys : UInt64, @ullTotalPageFile : UInt64, @ullAvailPageFile : UInt64, @ullTotalVirtual : UInt64, @ullAvailVirtual : UInt64, @ullAvailExtendedVirtual : UInt64)
    end
  end

  @[Extern]
  struct CACHE_DESCRIPTOR
    property level : UInt8
    property associativity : UInt8
    property line_size : UInt16
    property size : UInt32
    property type__ : Win32cr::System::SystemInformation::PROCESSOR_CACHE_TYPE
    def initialize(@level : UInt8, @associativity : UInt8, @line_size : UInt16, @size : UInt32, @type__ : Win32cr::System::SystemInformation::PROCESSOR_CACHE_TYPE)
    end
  end

  @[Extern]
  struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION
    property processor_mask : LibC::UIntPtrT
    property relationship : Win32cr::System::SystemInformation::LOGICAL_PROCESSOR_RELATIONSHIP
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property processor_core : ProcessorCore_e__Struct_
    property numa_node : NumaNode_e__Struct_
    property cache : Win32cr::System::SystemInformation::CACHE_DESCRIPTOR
    property reserved : UInt64[2]

      # Nested Type ProcessorCore_e__Struct_
      @[Extern]
      struct ProcessorCore_e__Struct_
    property flags : UInt8
    def initialize(@flags : UInt8)
    end
      end


      # Nested Type NumaNode_e__Struct_
      @[Extern]
      struct NumaNode_e__Struct_
    property node_number : UInt32
    def initialize(@node_number : UInt32)
    end
      end

    def initialize(@processor_core : ProcessorCore_e__Struct_, @numa_node : NumaNode_e__Struct_, @cache : Win32cr::System::SystemInformation::CACHE_DESCRIPTOR, @reserved : UInt64[2])
    end
    end

    def initialize(@processor_mask : LibC::UIntPtrT, @relationship : Win32cr::System::SystemInformation::LOGICAL_PROCESSOR_RELATIONSHIP, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PROCESSOR_RELATIONSHIP
    property flags : UInt8
    property efficiency_class : UInt8
    property reserved : UInt8[20]
    property group_count : UInt16
    property group_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY*
    def initialize(@flags : UInt8, @efficiency_class : UInt8, @reserved : UInt8[20], @group_count : UInt16, @group_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY*)
    end
  end

  @[Extern]
  struct NUMA_NODE_RELATIONSHIP
    property node_number : UInt32
    property reserved : UInt8[18]
    property group_count : UInt16
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property group_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY
    property group_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*
    def initialize(@group_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY, @group_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*)
    end
    end

    def initialize(@node_number : UInt32, @reserved : UInt8[18], @group_count : UInt16, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CACHE_RELATIONSHIP
    property level : UInt8
    property associativity : UInt8
    property line_size : UInt16
    property cache_size : UInt32
    property type__ : Win32cr::System::SystemInformation::PROCESSOR_CACHE_TYPE
    property reserved : UInt8[18]
    property group_count : UInt16
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property group_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY
    property group_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*
    def initialize(@group_mask : Win32cr::System::SystemInformation::GROUP_AFFINITY, @group_masks : Win32cr::System::SystemInformation::GROUP_AFFINITY*)
    end
    end

    def initialize(@level : UInt8, @associativity : UInt8, @line_size : UInt16, @cache_size : UInt32, @type__ : Win32cr::System::SystemInformation::PROCESSOR_CACHE_TYPE, @reserved : UInt8[18], @group_count : UInt16, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct PROCESSOR_GROUP_INFO
    property maximum_processor_count : UInt8
    property active_processor_count : UInt8
    property reserved : UInt8[38]
    property active_processor_mask : LibC::UIntPtrT
    def initialize(@maximum_processor_count : UInt8, @active_processor_count : UInt8, @reserved : UInt8[38], @active_processor_mask : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct GROUP_RELATIONSHIP
    property maximum_group_count : UInt16
    property active_group_count : UInt16
    property reserved : UInt8[20]
    property group_info : Win32cr::System::SystemInformation::PROCESSOR_GROUP_INFO*
    def initialize(@maximum_group_count : UInt16, @active_group_count : UInt16, @reserved : UInt8[20], @group_info : Win32cr::System::SystemInformation::PROCESSOR_GROUP_INFO*)
    end
  end

  @[Extern]
  struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX
    property relationship : Win32cr::System::SystemInformation::LOGICAL_PROCESSOR_RELATIONSHIP
    property size : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property processor : Win32cr::System::SystemInformation::PROCESSOR_RELATIONSHIP
    property numa_node : Win32cr::System::SystemInformation::NUMA_NODE_RELATIONSHIP
    property cache : Win32cr::System::SystemInformation::CACHE_RELATIONSHIP
    property group : Win32cr::System::SystemInformation::GROUP_RELATIONSHIP
    def initialize(@processor : Win32cr::System::SystemInformation::PROCESSOR_RELATIONSHIP, @numa_node : Win32cr::System::SystemInformation::NUMA_NODE_RELATIONSHIP, @cache : Win32cr::System::SystemInformation::CACHE_RELATIONSHIP, @group : Win32cr::System::SystemInformation::GROUP_RELATIONSHIP)
    end
    end

    def initialize(@relationship : Win32cr::System::SystemInformation::LOGICAL_PROCESSOR_RELATIONSHIP, @size : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SYSTEM_CPU_SET_INFORMATION
    property size : UInt32
    property type__ : Win32cr::System::SystemInformation::CPU_SET_INFORMATION_TYPE
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property cpu_set : CpuSet_e__Struct_

      # Nested Type CpuSet_e__Struct_
      @[Extern]
      struct CpuSet_e__Struct_
    property id : UInt32
    property group : UInt16
    property logical_processor_index : UInt8
    property core_index : UInt8
    property last_level_cache_index : UInt8
    property numa_node_index : UInt8
    property efficiency_class : UInt8
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property allocation_tag : UInt64

        # Nested Type Anonymous1_e__Union_
        @[Extern(union: true)]
        struct Anonymous1_e__Union_
    property all_flags : UInt8
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
          end

    def initialize(@all_flags : UInt8, @anonymous : Anonymous_e__Struct_)
    end
        end


        # Nested Type Anonymous2_e__Union_
        @[Extern(union: true)]
        struct Anonymous2_e__Union_
    property reserved : UInt32
    property scheduling_class : UInt8
    def initialize(@reserved : UInt32, @scheduling_class : UInt8)
    end
        end

    def initialize(@id : UInt32, @group : UInt16, @logical_processor_index : UInt8, @core_index : UInt8, @last_level_cache_index : UInt8, @numa_node_index : UInt8, @efficiency_class : UInt8, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @allocation_tag : UInt64)
    end
      end

    def initialize(@cpu_set : CpuSet_e__Struct_)
    end
    end

    def initialize(@size : UInt32, @type__ : Win32cr::System::SystemInformation::CPU_SET_INFORMATION_TYPE, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct SYSTEM_POOL_ZEROING_INFORMATION
    property pool_zeroing_support_present : Win32cr::Foundation::BOOLEAN
    def initialize(@pool_zeroing_support_present : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION
    property cycle_time : UInt64
    def initialize(@cycle_time : UInt64)
    end
  end

  @[Extern]
  struct SYSTEM_SUPPORTED_PROCESSOR_ARCHITECTURES_INFORMATION
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
  end

  @[Extern]
  struct OSVERSIONINFOA
    property dwOSVersionInfoSize : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property dwPlatformId : UInt32
    property szCSDVersion : Win32cr::Foundation::CHAR[128]
    def initialize(@dwOSVersionInfoSize : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @dwPlatformId : UInt32, @szCSDVersion : Win32cr::Foundation::CHAR[128])
    end
  end

  @[Extern]
  struct OSVERSIONINFOW
    property dwOSVersionInfoSize : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property dwPlatformId : UInt32
    property szCSDVersion : UInt16[128]
    def initialize(@dwOSVersionInfoSize : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @dwPlatformId : UInt32, @szCSDVersion : UInt16[128])
    end
  end

  @[Extern]
  struct OSVERSIONINFOEXA
    property dwOSVersionInfoSize : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property dwPlatformId : UInt32
    property szCSDVersion : Win32cr::Foundation::CHAR[128]
    property wServicePackMajor : UInt16
    property wServicePackMinor : UInt16
    property wSuiteMask : UInt16
    property wProductType : UInt8
    property wReserved : UInt8
    def initialize(@dwOSVersionInfoSize : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @dwPlatformId : UInt32, @szCSDVersion : Win32cr::Foundation::CHAR[128], @wServicePackMajor : UInt16, @wServicePackMinor : UInt16, @wSuiteMask : UInt16, @wProductType : UInt8, @wReserved : UInt8)
    end
  end

  @[Extern]
  struct OSVERSIONINFOEXW
    property dwOSVersionInfoSize : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property dwPlatformId : UInt32
    property szCSDVersion : UInt16[128]
    property wServicePackMajor : UInt16
    property wServicePackMinor : UInt16
    property wSuiteMask : UInt16
    property wProductType : UInt8
    property wReserved : UInt8
    def initialize(@dwOSVersionInfoSize : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @dwPlatformId : UInt32, @szCSDVersion : UInt16[128], @wServicePackMajor : UInt16, @wServicePackMinor : UInt16, @wSuiteMask : UInt16, @wProductType : UInt8, @wReserved : UInt8)
    end
  end

  @[Extern]
  struct MEMORYSTATUS
    property dwLength : UInt32
    property dwMemoryLoad : UInt32
    property dwTotalPhys : LibC::UIntPtrT
    property dwAvailPhys : LibC::UIntPtrT
    property dwTotalPageFile : LibC::UIntPtrT
    property dwAvailPageFile : LibC::UIntPtrT
    property dwTotalVirtual : LibC::UIntPtrT
    property dwAvailVirtual : LibC::UIntPtrT
    def initialize(@dwLength : UInt32, @dwMemoryLoad : UInt32, @dwTotalPhys : LibC::UIntPtrT, @dwAvailPhys : LibC::UIntPtrT, @dwTotalPageFile : LibC::UIntPtrT, @dwAvailPageFile : LibC::UIntPtrT, @dwTotalVirtual : LibC::UIntPtrT, @dwAvailVirtual : LibC::UIntPtrT)
    end
  end

  @[Link("kernel32")]
  @[Link("ntdll")]
  @[Link("ntdllk")]
  lib C
    fun GlobalMemoryStatusEx(lpBuffer : Win32cr::System::SystemInformation::MEMORYSTATUSEX*) : Win32cr::Foundation::BOOL

    fun GetSystemInfo(lpSystemInfo : Win32cr::System::SystemInformation::SYSTEM_INFO*) : Void

    fun GetSystemTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Void

    # Commented out due to being part of LibC
    #fun GetSystemTimeAsFileTime(lpSystemTimeAsFileTime : Win32cr::Foundation::FILETIME*) : Void

    fun GetLocalTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Void

    fun IsUserCetAvailableInEnvironment(user_cet_environment : Win32cr::System::SystemInformation::USER_CET_ENVIRONMENT) : Win32cr::Foundation::BOOL

    fun GetSystemLeapSecondInformation(enabled : Win32cr::Foundation::BOOL*, flags : UInt32*) : Win32cr::Foundation::BOOL

    fun GetVersion : UInt32

    fun SetLocalTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun GetTickCount : UInt32

    fun GetTickCount64 : UInt64

    fun GetSystemTimeAdjustment(lpTimeAdjustment : UInt32*, lpTimeIncrement : UInt32*, lpTimeAdjustmentDisabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetSystemTimeAdjustmentPrecise(lpTimeAdjustment : UInt64*, lpTimeIncrement : UInt64*, lpTimeAdjustmentDisabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetSystemDirectoryA(lpBuffer : UInt8*, uSize : UInt32) : UInt32

    fun GetSystemDirectoryW(lpBuffer : UInt16*, uSize : UInt32) : UInt32

    fun GetWindowsDirectoryA(lpBuffer : UInt8*, uSize : UInt32) : UInt32

    fun GetWindowsDirectoryW(lpBuffer : UInt16*, uSize : UInt32) : UInt32

    fun GetSystemWindowsDirectoryA(lpBuffer : UInt8*, uSize : UInt32) : UInt32

    fun GetSystemWindowsDirectoryW(lpBuffer : UInt16*, uSize : UInt32) : UInt32

    fun GetComputerNameExA(name_type : Win32cr::System::SystemInformation::COMPUTER_NAME_FORMAT, lpBuffer : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetComputerNameExW(name_type : Win32cr::System::SystemInformation::COMPUTER_NAME_FORMAT, lpBuffer : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    fun SetComputerNameExW(name_type : Win32cr::System::SystemInformation::COMPUTER_NAME_FORMAT, lpBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun SetSystemTime(lpSystemTime : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::BOOL

    fun GetVersionExA(lpVersionInformation : Win32cr::System::SystemInformation::OSVERSIONINFOA*) : Win32cr::Foundation::BOOL

    fun GetVersionExW(lpVersionInformation : Win32cr::System::SystemInformation::OSVERSIONINFOW*) : Win32cr::Foundation::BOOL

    fun GetLogicalProcessorInformation(buffer : Win32cr::System::SystemInformation::SYSTEM_LOGICAL_PROCESSOR_INFORMATION*, returned_length : UInt32*) : Win32cr::Foundation::BOOL

    fun GetLogicalProcessorInformationEx(relationship_type : Win32cr::System::SystemInformation::LOGICAL_PROCESSOR_RELATIONSHIP, buffer : Win32cr::System::SystemInformation::SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX*, returned_length : UInt32*) : Win32cr::Foundation::BOOL

    # Commented out due to being part of LibC
    #fun GetNativeSystemInfo(lpSystemInfo : Win32cr::System::SystemInformation::SYSTEM_INFO*) : Void

    # Commented out due to being part of LibC
    #fun GetSystemTimePreciseAsFileTime(lpSystemTimeAsFileTime : Win32cr::Foundation::FILETIME*) : Void

    fun GetProductInfo(dwOSMajorVersion : UInt32, dwOSMinorVersion : UInt32, dwSpMajorVersion : UInt32, dwSpMinorVersion : UInt32, pdwReturnedProductType : Win32cr::System::SystemInformation::OS_PRODUCT_TYPE*) : Win32cr::Foundation::BOOL

    fun VerSetConditionMask(condition_mask : UInt64, type_mask : Win32cr::System::SystemInformation::VER_FLAGS, condition : UInt8) : UInt64

    fun GetOsSafeBootMode(flags : UInt32*) : Win32cr::Foundation::BOOL

    fun EnumSystemFirmwareTables(firmware_table_provider_signature : Win32cr::System::SystemInformation::FIRMWARE_TABLE_PROVIDER, pFirmwareTableEnumBuffer : Win32cr::System::SystemInformation::FIRMWARE_TABLE_ID*, buffer_size : UInt32) : UInt32

    fun GetSystemFirmwareTable(firmware_table_provider_signature : Win32cr::System::SystemInformation::FIRMWARE_TABLE_PROVIDER, firmware_table_id : Win32cr::System::SystemInformation::FIRMWARE_TABLE_ID, pFirmwareTableBuffer : Void*, buffer_size : UInt32) : UInt32

    fun DnsHostnameToComputerNameExW(hostname : Win32cr::Foundation::PWSTR, computer_name : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOL

    fun GetPhysicallyInstalledSystemMemory(total_memory_in_kilobytes : UInt64*) : Win32cr::Foundation::BOOL

    fun SetComputerNameEx2W(name_type : Win32cr::System::SystemInformation::COMPUTER_NAME_FORMAT, flags : UInt32, lpBuffer : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun SetSystemTimeAdjustment(dwTimeAdjustment : UInt32, bTimeAdjustmentDisabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun SetSystemTimeAdjustmentPrecise(dwTimeAdjustment : UInt64, bTimeAdjustmentDisabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun GetProcessorSystemCycleTime(group : UInt16, buffer : Win32cr::System::SystemInformation::SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION*, returned_length : UInt32*) : Win32cr::Foundation::BOOL

    fun GetOsManufacturingMode(pbEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    fun GetIntegratedDisplaySize(sizeInInches : Float64*) : Win32cr::Foundation::HRESULT

    fun SetComputerNameA(lpComputerName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun SetComputerNameW(lpComputerName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun SetComputerNameExA(name_type : Win32cr::System::SystemInformation::COMPUTER_NAME_FORMAT, lpBuffer : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun GetSystemCpuSetInformation(information : Win32cr::System::SystemInformation::SYSTEM_CPU_SET_INFORMATION*, buffer_length : UInt32, returned_length : UInt32*, process : Win32cr::Foundation::HANDLE, flags : UInt32) : Win32cr::Foundation::BOOL

    fun GetSystemWow64DirectoryA(lpBuffer : UInt8*, uSize : UInt32) : UInt32

    fun GetSystemWow64DirectoryW(lpBuffer : UInt16*, uSize : UInt32) : UInt32

    fun GetSystemWow64Directory2A(lpBuffer : UInt8*, uSize : UInt32, image_file_machine_type : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE) : UInt32

    fun GetSystemWow64Directory2W(lpBuffer : UInt16*, uSize : UInt32, image_file_machine_type : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE) : UInt32

    fun IsWow64GuestMachineSupported(wow_guest_machine : Win32cr::System::SystemInformation::IMAGE_FILE_MACHINE, machine_is_supported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun RtlGetProductInfo(os_major_version : UInt32, os_minor_version : UInt32, sp_major_version : UInt32, sp_minor_version : UInt32, returned_product_type : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun RtlOsDeploymentState(flags : UInt32) : Win32cr::System::SystemInformation::OS_DEPLOYEMENT_STATE_VALUES

    fun RtlGetSystemGlobalData(data_id : Win32cr::System::SystemInformation::RTL_SYSTEM_GLOBAL_DATA_ID, buffer : Void*, size : UInt32) : UInt32

    fun RtlGetDeviceFamilyInfoEnum(pullUAPInfo : UInt64*, pulDeviceFamily : Win32cr::System::SystemInformation::DEVICEFAMILYINFOENUM*, pulDeviceForm : Win32cr::System::SystemInformation::DEVICEFAMILYDEVICEFORM*) : Void

    fun RtlConvertDeviceFamilyInfoToString(pulDeviceFamilyBufferSize : UInt32*, pulDeviceFormBufferSize : UInt32*, device_family : Win32cr::Foundation::PWSTR, device_form : Win32cr::Foundation::PWSTR) : UInt32

    fun RtlSwitchedVVI(version_info : Win32cr::System::SystemInformation::OSVERSIONINFOEXW*, type_mask : UInt32, condition_mask : UInt64) : UInt32

    fun GlobalMemoryStatus(lpBuffer : Win32cr::System::SystemInformation::MEMORYSTATUS*) : Void

    fun GetSystemDEPPolicy : Win32cr::System::SystemInformation::DEP_SYSTEM_POLICY_TYPE

    fun GetFirmwareType(firmware_type : Win32cr::System::SystemInformation::FIRMWARE_TYPE*) : Win32cr::Foundation::BOOL

    fun VerifyVersionInfoA(lpVersionInformation : Win32cr::System::SystemInformation::OSVERSIONINFOEXA*, dwTypeMask : Win32cr::System::SystemInformation::VER_FLAGS, dwlConditionMask : UInt64) : Win32cr::Foundation::BOOL

    fun VerifyVersionInfoW(lpVersionInformation : Win32cr::System::SystemInformation::OSVERSIONINFOEXW*, dwTypeMask : Win32cr::System::SystemInformation::VER_FLAGS, dwlConditionMask : UInt64) : Win32cr::Foundation::BOOL

  end
end