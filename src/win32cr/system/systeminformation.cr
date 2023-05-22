require "../system/diagnostics/debug.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-sysinfo-l1-2-4.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-sysinfo-l1-2-0.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-sysinfo-l1-2-3.dll")]
@[Link(ldflags: "/DELAYLOAD:api-ms-win-core-wow64-l1-1-1.dll")]
@[Link(ldflags: "/DELAYLOAD:ntdllk.dll")]
lib LibWin32
  alias FIRMWARE_TABLE_ID = UInt32

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
  WIN32_WINNT_NT4 = 1024_u32
  WIN32_WINNT_WIN2K = 1280_u32
  WIN32_WINNT_WINXP = 1281_u32
  WIN32_WINNT_WS03 = 1282_u32
  WIN32_WINNT_WIN6 = 1536_u32
  WIN32_WINNT_VISTA = 1536_u32
  WIN32_WINNT_WS08 = 1536_u32
  WIN32_WINNT_LONGHORN = 1536_u32
  WIN32_WINNT_WIN7 = 1537_u32
  WIN32_WINNT_WIN8 = 1538_u32
  WIN32_WINNT_WINBLUE = 1539_u32
  WIN32_WINNT_WINTHRESHOLD = 2560_u32
  WIN32_WINNT_WIN10 = 2560_u32
  WIN32_IE_IE20 = 512_u32
  WIN32_IE_IE30 = 768_u32
  WIN32_IE_IE302 = 770_u32
  WIN32_IE_IE40 = 1024_u32
  WIN32_IE_IE401 = 1025_u32
  WIN32_IE_IE50 = 1280_u32
  WIN32_IE_IE501 = 1281_u32
  WIN32_IE_IE55 = 1360_u32
  WIN32_IE_IE60 = 1536_u32
  WIN32_IE_IE60SP1 = 1537_u32
  WIN32_IE_IE60SP2 = 1539_u32
  WIN32_IE_IE70 = 1792_u32
  WIN32_IE_IE80 = 2048_u32
  WIN32_IE_IE90 = 2304_u32
  WIN32_IE_IE100 = 2560_u32
  WIN32_IE_IE110 = 2560_u32
  WIN32_IE_NT4 = 512_u32
  WIN32_IE_NT4SP1 = 512_u32
  WIN32_IE_NT4SP2 = 512_u32
  WIN32_IE_NT4SP3 = 770_u32
  WIN32_IE_NT4SP4 = 1025_u32
  WIN32_IE_NT4SP5 = 1025_u32
  WIN32_IE_NT4SP6 = 1280_u32
  WIN32_IE_WIN98 = 1025_u32
  WIN32_IE_WIN98SE = 1280_u32
  WIN32_IE_WINME = 1360_u32
  WIN32_IE_WIN2K = 1281_u32
  WIN32_IE_WIN2KSP1 = 1281_u32
  WIN32_IE_WIN2KSP2 = 1281_u32
  WIN32_IE_WIN2KSP3 = 1281_u32
  WIN32_IE_WIN2KSP4 = 1281_u32
  WIN32_IE_XP = 1536_u32
  WIN32_IE_XPSP1 = 1537_u32
  WIN32_IE_XPSP2 = 1539_u32
  WIN32_IE_WS03 = 1538_u32
  WIN32_IE_WS03SP1 = 1539_u32
  WIN32_IE_WIN6 = 1792_u32
  WIN32_IE_LONGHORN = 1792_u32
  WIN32_IE_WIN7 = 2048_u32
  WIN32_IE_WIN8 = 2560_u32
  WIN32_IE_WINBLUE = 2560_u32
  WIN32_IE_WINTHRESHOLD = 2560_u32
  WIN32_IE_WIN10 = 2560_u32
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

  alias PGET_SYSTEM_WOW64_DIRECTORY_A = Proc(UInt8*, UInt32, UInt32)
  alias PGET_SYSTEM_WOW64_DIRECTORY_W = Proc(Char*, UInt32, UInt32)


  enum VER_FLAGS : UInt32
    VER_MINORVERSION = 1
    VER_MAJORVERSION = 2
    VER_BUILDNUMBER = 4
    VER_PLATFORMID = 8
    VER_SERVICEPACKMINOR = 16
    VER_SERVICEPACKMAJOR = 32
    VER_SUITENAME = 64
    VER_PRODUCT_TYPE = 128
  end

  enum FIRMWARE_TABLE_PROVIDER : UInt32
    ACPI = 1094930505
    FIRM = 1179210317
    RSMB = 1381190978
  end

  enum USER_CET_ENVIRONMENT : UInt32
    USER_CET_ENVIRONMENT_WIN32_PROCESS = 0
    USER_CET_ENVIRONMENT_SGX2_ENCLAVE = 2
    USER_CET_ENVIRONMENT_VBS_ENCLAVE = 16
    USER_CET_ENVIRONMENT_VBS_BASIC_ENCLAVE = 17
  end

  enum OS_PRODUCT_TYPE : UInt32
    PRODUCT_BUSINESS = 6
    PRODUCT_BUSINESS_N = 16
    PRODUCT_CLUSTER_SERVER = 18
    PRODUCT_CLUSTER_SERVER_V = 64
    PRODUCT_CORE = 101
    PRODUCT_CORE_COUNTRYSPECIFIC = 99
    PRODUCT_CORE_N = 98
    PRODUCT_CORE_SINGLELANGUAGE = 100
    PRODUCT_DATACENTER_EVALUATION_SERVER = 80
    PRODUCT_DATACENTER_A_SERVER_CORE = 145
    PRODUCT_STANDARD_A_SERVER_CORE = 146
    PRODUCT_DATACENTER_SERVER = 8
    PRODUCT_DATACENTER_SERVER_CORE = 12
    PRODUCT_DATACENTER_SERVER_CORE_V = 39
    PRODUCT_DATACENTER_SERVER_V = 37
    PRODUCT_EDUCATION = 121
    PRODUCT_EDUCATION_N = 122
    PRODUCT_ENTERPRISE = 4
    PRODUCT_ENTERPRISE_E = 70
    PRODUCT_ENTERPRISE_EVALUATION = 72
    PRODUCT_ENTERPRISE_N = 27
    PRODUCT_ENTERPRISE_N_EVALUATION = 84
    PRODUCT_ENTERPRISE_S = 125
    PRODUCT_ENTERPRISE_S_EVALUATION = 129
    PRODUCT_ENTERPRISE_S_N = 126
    PRODUCT_ENTERPRISE_S_N_EVALUATION = 130
    PRODUCT_ENTERPRISE_SERVER = 10
    PRODUCT_ENTERPRISE_SERVER_CORE = 14
    PRODUCT_ENTERPRISE_SERVER_CORE_V = 41
    PRODUCT_ENTERPRISE_SERVER_IA64 = 15
    PRODUCT_ENTERPRISE_SERVER_V = 38
    PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL = 60
    PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC = 62
    PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT = 59
    PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC = 61
    PRODUCT_HOME_BASIC = 2
    PRODUCT_HOME_BASIC_E = 67
    PRODUCT_HOME_BASIC_N = 5
    PRODUCT_HOME_PREMIUM = 3
    PRODUCT_HOME_PREMIUM_E = 68
    PRODUCT_HOME_PREMIUM_N = 26
    PRODUCT_HOME_PREMIUM_SERVER = 34
    PRODUCT_HOME_SERVER = 19
    PRODUCT_HYPERV = 42
    PRODUCT_IOTUAP = 123
    PRODUCT_IOTUAPCOMMERCIAL = 131
    PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT = 30
    PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING = 32
    PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY = 31
    PRODUCT_MOBILE_CORE = 104
    PRODUCT_MOBILE_ENTERPRISE = 133
    PRODUCT_MULTIPOINT_PREMIUM_SERVER = 77
    PRODUCT_MULTIPOINT_STANDARD_SERVER = 76
    PRODUCT_PRO_WORKSTATION = 161
    PRODUCT_PRO_WORKSTATION_N = 162
    PRODUCT_PROFESSIONAL = 48
    PRODUCT_PROFESSIONAL_E = 69
    PRODUCT_PROFESSIONAL_N = 49
    PRODUCT_PROFESSIONAL_WMC = 103
    PRODUCT_SB_SOLUTION_SERVER = 50
    PRODUCT_SB_SOLUTION_SERVER_EM = 54
    PRODUCT_SERVER_FOR_SB_SOLUTIONS = 51
    PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM = 55
    PRODUCT_SERVER_FOR_SMALLBUSINESS = 24
    PRODUCT_SERVER_FOR_SMALLBUSINESS_V = 35
    PRODUCT_SERVER_FOUNDATION = 33
    PRODUCT_SMALLBUSINESS_SERVER = 9
    PRODUCT_SMALLBUSINESS_SERVER_PREMIUM = 25
    PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE = 63
    PRODUCT_SOLUTION_EMBEDDEDSERVER = 56
    PRODUCT_STANDARD_EVALUATION_SERVER = 79
    PRODUCT_STANDARD_SERVER = 7
    PRODUCT_STANDARD_SERVER_CORE_ = 13
    PRODUCT_STANDARD_SERVER_CORE_V = 40
    PRODUCT_STANDARD_SERVER_V = 36
    PRODUCT_STANDARD_SERVER_SOLUTIONS = 52
    PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE = 53
    PRODUCT_STARTER = 11
    PRODUCT_STARTER_E = 66
    PRODUCT_STARTER_N = 47
    PRODUCT_STORAGE_ENTERPRISE_SERVER = 23
    PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE = 46
    PRODUCT_STORAGE_EXPRESS_SERVER = 20
    PRODUCT_STORAGE_EXPRESS_SERVER_CORE = 43
    PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER = 96
    PRODUCT_STORAGE_STANDARD_SERVER = 21
    PRODUCT_STORAGE_STANDARD_SERVER_CORE = 44
    PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER = 95
    PRODUCT_STORAGE_WORKGROUP_SERVER = 22
    PRODUCT_STORAGE_WORKGROUP_SERVER_CORE = 45
    PRODUCT_ULTIMATE = 1
    PRODUCT_ULTIMATE_E = 71
    PRODUCT_ULTIMATE_N = 28
    PRODUCT_UNDEFINED = 0
    PRODUCT_WEB_SERVER = 17
    PRODUCT_WEB_SERVER_CORE = 29
  end

  enum DEVICEFAMILYINFOENUM : UInt32
    DEVICEFAMILYINFOENUM_UAP = 0
    DEVICEFAMILYINFOENUM_WINDOWS_8X = 1
    DEVICEFAMILYINFOENUM_WINDOWS_PHONE_8X = 2
    DEVICEFAMILYINFOENUM_DESKTOP = 3
    DEVICEFAMILYINFOENUM_MOBILE = 4
    DEVICEFAMILYINFOENUM_XBOX = 5
    DEVICEFAMILYINFOENUM_TEAM = 6
    DEVICEFAMILYINFOENUM_IOT = 7
    DEVICEFAMILYINFOENUM_IOT_HEADLESS = 8
    DEVICEFAMILYINFOENUM_SERVER = 9
    DEVICEFAMILYINFOENUM_HOLOGRAPHIC = 10
    DEVICEFAMILYINFOENUM_XBOXSRA = 11
    DEVICEFAMILYINFOENUM_XBOXERA = 12
    DEVICEFAMILYINFOENUM_SERVER_NANO = 13
    DEVICEFAMILYINFOENUM_8828080 = 14
    DEVICEFAMILYINFOENUM_7067329 = 15
    DEVICEFAMILYINFOENUM_WINDOWS_CORE = 16
    DEVICEFAMILYINFOENUM_WINDOWS_CORE_HEADLESS = 17
    DEVICEFAMILYINFOENUM_MAX = 17
  end

  enum DEVICEFAMILYDEVICEFORM : UInt32
    DEVICEFAMILYDEVICEFORM_UNKNOWN = 0
    DEVICEFAMILYDEVICEFORM_PHONE = 1
    DEVICEFAMILYDEVICEFORM_TABLET = 2
    DEVICEFAMILYDEVICEFORM_DESKTOP = 3
    DEVICEFAMILYDEVICEFORM_NOTEBOOK = 4
    DEVICEFAMILYDEVICEFORM_CONVERTIBLE = 5
    DEVICEFAMILYDEVICEFORM_DETACHABLE = 6
    DEVICEFAMILYDEVICEFORM_ALLINONE = 7
    DEVICEFAMILYDEVICEFORM_STICKPC = 8
    DEVICEFAMILYDEVICEFORM_PUCK = 9
    DEVICEFAMILYDEVICEFORM_LARGESCREEN = 10
    DEVICEFAMILYDEVICEFORM_HMD = 11
    DEVICEFAMILYDEVICEFORM_INDUSTRY_HANDHELD = 12
    DEVICEFAMILYDEVICEFORM_INDUSTRY_TABLET = 13
    DEVICEFAMILYDEVICEFORM_BANKING = 14
    DEVICEFAMILYDEVICEFORM_BUILDING_AUTOMATION = 15
    DEVICEFAMILYDEVICEFORM_DIGITAL_SIGNAGE = 16
    DEVICEFAMILYDEVICEFORM_GAMING = 17
    DEVICEFAMILYDEVICEFORM_HOME_AUTOMATION = 18
    DEVICEFAMILYDEVICEFORM_INDUSTRIAL_AUTOMATION = 19
    DEVICEFAMILYDEVICEFORM_KIOSK = 20
    DEVICEFAMILYDEVICEFORM_MAKER_BOARD = 21
    DEVICEFAMILYDEVICEFORM_MEDICAL = 22
    DEVICEFAMILYDEVICEFORM_NETWORKING = 23
    DEVICEFAMILYDEVICEFORM_POINT_OF_SERVICE = 24
    DEVICEFAMILYDEVICEFORM_PRINTING = 25
    DEVICEFAMILYDEVICEFORM_THIN_CLIENT = 26
    DEVICEFAMILYDEVICEFORM_TOY = 27
    DEVICEFAMILYDEVICEFORM_VENDING = 28
    DEVICEFAMILYDEVICEFORM_INDUSTRY_OTHER = 29
    DEVICEFAMILYDEVICEFORM_XBOX_ONE = 30
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_S = 31
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_X = 32
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_X_DEVKIT = 33
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X = 34
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X_DEVKIT = 35
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_00 = 36
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_01 = 37
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_02 = 38
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_03 = 39
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_04 = 40
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_05 = 41
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_06 = 42
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_07 = 43
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_08 = 44
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_09 = 45
    DEVICEFAMILYDEVICEFORM_MAX = 45
  end

  enum COMPUTER_NAME_FORMAT : Int32
    ComputerNameNetBIOS = 0
    ComputerNameDnsHostname = 1
    ComputerNameDnsDomain = 2
    ComputerNameDnsFullyQualified = 3
    ComputerNamePhysicalNetBIOS = 4
    ComputerNamePhysicalDnsHostname = 5
    ComputerNamePhysicalDnsDomain = 6
    ComputerNamePhysicalDnsFullyQualified = 7
    ComputerNameMax = 8
  end

  enum FIRMWARE_TYPE : Int32
    FirmwareTypeUnknown = 0
    FirmwareTypeBios = 1
    FirmwareTypeUefi = 2
    FirmwareTypeMax = 3
  end

  enum LOGICAL_PROCESSOR_RELATIONSHIP : Int32
    RelationProcessorCore = 0
    RelationNumaNode = 1
    RelationCache = 2
    RelationProcessorPackage = 3
    RelationGroup = 4
    RelationProcessorDie = 5
    RelationNumaNodeEx = 6
    RelationProcessorModule = 7
    RelationAll = 65535
  end

  enum PROCESSOR_CACHE_TYPE : Int32
    CacheUnified = 0
    CacheInstruction = 1
    CacheData = 2
    CacheTrace = 3
  end

  enum CPU_SET_INFORMATION_TYPE : Int32
    CpuSetInformation = 0
  end

  enum OS_DEPLOYEMENT_STATE_VALUES : Int32
    OS_DEPLOYMENT_STANDARD = 1
    OS_DEPLOYMENT_COMPACT = 2
  end

  enum RTL_SYSTEM_GLOBAL_DATA_ID : Int32
    GlobalDataIdUnknown = 0
    GlobalDataIdRngSeedVersion = 1
    GlobalDataIdInterruptTime = 2
    GlobalDataIdTimeZoneBias = 3
    GlobalDataIdImageNumberLow = 4
    GlobalDataIdImageNumberHigh = 5
    GlobalDataIdTimeZoneId = 6
    GlobalDataIdNtMajorVersion = 7
    GlobalDataIdNtMinorVersion = 8
    GlobalDataIdSystemExpirationDate = 9
    GlobalDataIdKdDebuggerEnabled = 10
    GlobalDataIdCyclesPerYield = 11
    GlobalDataIdSafeBootMode = 12
    GlobalDataIdLastSystemRITEventTickCount = 13
  end

  enum DEP_SYSTEM_POLICY_TYPE : Int32
    DEPPolicyAlwaysOff = 0
    DEPPolicyAlwaysOn = 1
    DEPPolicyOptIn = 2
    DEPPolicyOptOut = 3
    DEPTotalPolicyCount = 4
  end

union SYSTEM_INFO_Anonymous_e__Union
  dw_oem_id : UInt32
  anonymous : SYSTEM_INFO_Anonymous_e__Union_Anonymous_e__Struct
end
union SYSTEM_LOGICAL_PROCESSOR_INFORMATION_Anonymous_e__Union
  processor_core : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_Anonymous_e__Union_ProcessorCore_e__Struct
  numa_node : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_Anonymous_e__Union_NumaNode_e__Struct
  cache : CACHE_DESCRIPTOR
  reserved : UInt64[2]*
end
union NUMA_NODE_RELATIONSHIP_Anonymous_e__Union
  group_mask : GROUP_AFFINITY
  group_masks : GROUP_AFFINITY[0]*
end
union CACHE_RELATIONSHIP_Anonymous_e__Union
  group_mask : GROUP_AFFINITY
  group_masks : GROUP_AFFINITY[0]*
end
union SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX_Anonymous_e__Union
  processor : PROCESSOR_RELATIONSHIP
  numa_node : NUMA_NODE_RELATIONSHIP
  cache : CACHE_RELATIONSHIP
  group : GROUP_RELATIONSHIP
end
union SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union
  cpu_set : SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct
end
union SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct_Anonymous1_e__Union
  all_flags : UInt8
  anonymous : SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct_Anonymous1_e__Union_Anonymous_e__Struct
end
union SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct_Anonymous2_e__Union
  reserved : UInt32
  scheduling_class : UInt8
end

  struct GROUP_AFFINITY
    mask : LibC::UINT_PTR
    group : UInt16
    reserved : UInt16[3]*
  end
  struct SYSTEM_INFO
    anonymous : SYSTEM_INFO_Anonymous_e__Union
    dw_page_size : UInt32
    lp_minimum_application_address : Void*
    lp_maximum_application_address : Void*
    dw_active_processor_mask : LibC::UINT_PTR
    dw_number_of_processors : UInt32
    dw_processor_type : UInt32
    dw_allocation_granularity : UInt32
    w_processor_level : UInt16
    w_processor_revision : UInt16
  end
  struct SYSTEM_INFO_Anonymous_e__Union_Anonymous_e__Struct
    w_processor_architecture : PROCESSOR_ARCHITECTURE
    w_reserved : UInt16
  end
  struct MEMORYSTATUSEX
    dw_length : UInt32
    dw_memory_load : UInt32
    ull_total_phys : UInt64
    ull_avail_phys : UInt64
    ull_total_page_file : UInt64
    ull_avail_page_file : UInt64
    ull_total_virtual : UInt64
    ull_avail_virtual : UInt64
    ull_avail_extended_virtual : UInt64
  end
  struct CACHE_DESCRIPTOR
    level : UInt8
    associativity : UInt8
    line_size : UInt16
    size : UInt32
    type : PROCESSOR_CACHE_TYPE
  end
  struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION
    processor_mask : LibC::UINT_PTR
    relationship : LOGICAL_PROCESSOR_RELATIONSHIP
    anonymous : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_Anonymous_e__Union
  end
  struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_Anonymous_e__Union_ProcessorCore_e__Struct
    flags : UInt8
  end
  struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_Anonymous_e__Union_NumaNode_e__Struct
    node_number : UInt32
  end
  struct PROCESSOR_RELATIONSHIP
    flags : UInt8
    efficiency_class : UInt8
    reserved : UInt8[20]*
    group_count : UInt16
    group_mask : GROUP_AFFINITY[0]*
  end
  struct NUMA_NODE_RELATIONSHIP
    node_number : UInt32
    reserved : UInt8[18]*
    group_count : UInt16
    anonymous : NUMA_NODE_RELATIONSHIP_Anonymous_e__Union
  end
  struct CACHE_RELATIONSHIP
    level : UInt8
    associativity : UInt8
    line_size : UInt16
    cache_size : UInt32
    type : PROCESSOR_CACHE_TYPE
    reserved : UInt8[18]*
    group_count : UInt16
    anonymous : CACHE_RELATIONSHIP_Anonymous_e__Union
  end
  struct PROCESSOR_GROUP_INFO
    maximum_processor_count : UInt8
    active_processor_count : UInt8
    reserved : UInt8[38]*
    active_processor_mask : LibC::UINT_PTR
  end
  struct GROUP_RELATIONSHIP
    maximum_group_count : UInt16
    active_group_count : UInt16
    reserved : UInt8[20]*
    group_info : PROCESSOR_GROUP_INFO[0]*
  end
  struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX
    relationship : LOGICAL_PROCESSOR_RELATIONSHIP
    size : UInt32
    anonymous : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX_Anonymous_e__Union
  end
  struct SYSTEM_CPU_SET_INFORMATION
    size : UInt32
    type : CPU_SET_INFORMATION_TYPE
    anonymous : SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union
  end
  struct SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct
    id : UInt32
    group : UInt16
    logical_processor_index : UInt8
    core_index : UInt8
    last_level_cache_index : UInt8
    numa_node_index : UInt8
    efficiency_class : UInt8
    anonymous1 : SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct_Anonymous1_e__Union
    anonymous2 : SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct_Anonymous2_e__Union
    allocation_tag : UInt64
  end
  struct SYSTEM_CPU_SET_INFORMATION_Anonymous_e__Union_CpuSet_e__Struct_Anonymous1_e__Union_Anonymous_e__Struct
    _bitfield : UInt8
  end
  struct SYSTEM_POOL_ZEROING_INFORMATION
    pool_zeroing_support_present : BOOLEAN
  end
  struct SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION
    cycle_time : UInt64
  end
  struct SYSTEM_SUPPORTED_PROCESSOR_ARCHITECTURES_INFORMATION
    _bitfield : UInt32
  end
  struct OSVERSIONINFOA
    dw_os_version_info_size : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    dw_platform_id : UInt32
    sz_csd_version : CHAR[128]*
  end
  struct OSVERSIONINFOW
    dw_os_version_info_size : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    dw_platform_id : UInt32
    sz_csd_version : Char[128]*
  end
  struct OSVERSIONINFOEXA
    dw_os_version_info_size : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    dw_platform_id : UInt32
    sz_csd_version : CHAR[128]*
    w_service_pack_major : UInt16
    w_service_pack_minor : UInt16
    w_suite_mask : UInt16
    w_product_type : UInt8
    w_reserved : UInt8
  end
  struct OSVERSIONINFOEXW
    dw_os_version_info_size : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    dw_platform_id : UInt32
    sz_csd_version : Char[128]*
    w_service_pack_major : UInt16
    w_service_pack_minor : UInt16
    w_suite_mask : UInt16
    w_product_type : UInt8
    w_reserved : UInt8
  end
  struct MEMORYSTATUS
    dw_length : UInt32
    dw_memory_load : UInt32
    dw_total_phys : LibC::UINT_PTR
    dw_avail_phys : LibC::UINT_PTR
    dw_total_page_file : LibC::UINT_PTR
    dw_avail_page_file : LibC::UINT_PTR
    dw_total_virtual : LibC::UINT_PTR
    dw_avail_virtual : LibC::UINT_PTR
  end


  # Params # lpbuffer : MEMORYSTATUSEX* [In]
  fun GlobalMemoryStatusEx(lpbuffer : MEMORYSTATUSEX*) : LibC::BOOL

  # Params # lpsysteminfo : SYSTEM_INFO* [In]
  fun GetSystemInfo(lpsysteminfo : SYSTEM_INFO*)

  # Params # lpsystemtime : SYSTEMTIME* [In]
  fun GetSystemTime(lpsystemtime : SYSTEMTIME*)

  # Params # lpsystemtimeasfiletime : FILETIME* [In]
  # Commented out because function is part of Lib C
  #fun GetSystemTimeAsFileTime(lpsystemtimeasfiletime : FILETIME*)

  # Params # lpsystemtime : SYSTEMTIME* [In]
  fun GetLocalTime(lpsystemtime : SYSTEMTIME*)

  # Params # usercetenvironment : USER_CET_ENVIRONMENT [In]
  fun IsUserCetAvailableInEnvironment(usercetenvironment : USER_CET_ENVIRONMENT) : LibC::BOOL

  # Params # enabled : LibC::BOOL* [In],flags : UInt32* [In]
  fun GetSystemLeapSecondInformation(enabled : LibC::BOOL*, flags : UInt32*) : LibC::BOOL

  # Params # 
  fun GetVersion : UInt32

  # Params # lpsystemtime : SYSTEMTIME* [In]
  fun SetLocalTime(lpsystemtime : SYSTEMTIME*) : LibC::BOOL

  # Params # 
  fun GetTickCount : UInt32

  # Params # 
  fun GetTickCount64 : UInt64

  # Params # lptimeadjustment : UInt32* [In],lptimeincrement : UInt32* [In],lptimeadjustmentdisabled : LibC::BOOL* [In]
  fun GetSystemTimeAdjustment(lptimeadjustment : UInt32*, lptimeincrement : UInt32*, lptimeadjustmentdisabled : LibC::BOOL*) : LibC::BOOL

  # Params # lptimeadjustment : UInt64* [In],lptimeincrement : UInt64* [In],lptimeadjustmentdisabled : LibC::BOOL* [In]
  fun GetSystemTimeAdjustmentPrecise(lptimeadjustment : UInt64*, lptimeincrement : UInt64*, lptimeadjustmentdisabled : LibC::BOOL*) : LibC::BOOL

  # Params # lpbuffer : UInt8* [In],usize : UInt32 [In]
  fun GetSystemDirectoryA(lpbuffer : UInt8*, usize : UInt32) : UInt32

  # Params # lpbuffer : Char* [In],usize : UInt32 [In]
  fun GetSystemDirectoryW(lpbuffer : Char*, usize : UInt32) : UInt32

  # Params # lpbuffer : UInt8* [In],usize : UInt32 [In]
  fun GetWindowsDirectoryA(lpbuffer : UInt8*, usize : UInt32) : UInt32

  # Params # lpbuffer : Char* [In],usize : UInt32 [In]
  fun GetWindowsDirectoryW(lpbuffer : Char*, usize : UInt32) : UInt32

  # Params # lpbuffer : UInt8* [In],usize : UInt32 [In]
  fun GetSystemWindowsDirectoryA(lpbuffer : UInt8*, usize : UInt32) : UInt32

  # Params # lpbuffer : Char* [In],usize : UInt32 [In]
  fun GetSystemWindowsDirectoryW(lpbuffer : Char*, usize : UInt32) : UInt32

  # Params # nametype : COMPUTER_NAME_FORMAT [In],lpbuffer : UInt8* [In],nsize : UInt32* [In]
  fun GetComputerNameExA(nametype : COMPUTER_NAME_FORMAT, lpbuffer : UInt8*, nsize : UInt32*) : LibC::BOOL

  # Params # nametype : COMPUTER_NAME_FORMAT [In],lpbuffer : Char* [In],nsize : UInt32* [In]
  # Commented out because function is part of Lib C
  #fun GetComputerNameExW(nametype : COMPUTER_NAME_FORMAT, lpbuffer : Char*, nsize : UInt32*) : LibC::BOOL

  # Params # nametype : COMPUTER_NAME_FORMAT [In],lpbuffer : LibC::LPWSTR [In]
  fun SetComputerNameExW(nametype : COMPUTER_NAME_FORMAT, lpbuffer : LibC::LPWSTR) : LibC::BOOL

  # Params # lpsystemtime : SYSTEMTIME* [In]
  fun SetSystemTime(lpsystemtime : SYSTEMTIME*) : LibC::BOOL

  # Params # lpversioninformation : OSVERSIONINFOA* [In]
  fun GetVersionExA(lpversioninformation : OSVERSIONINFOA*) : LibC::BOOL

  # Params # lpversioninformation : OSVERSIONINFOW* [In]
  fun GetVersionExW(lpversioninformation : OSVERSIONINFOW*) : LibC::BOOL

  # Params # buffer : SYSTEM_LOGICAL_PROCESSOR_INFORMATION* [In],returnedlength : UInt32* [In]
  fun GetLogicalProcessorInformation(buffer : SYSTEM_LOGICAL_PROCESSOR_INFORMATION*, returnedlength : UInt32*) : LibC::BOOL

  # Params # relationshiptype : LOGICAL_PROCESSOR_RELATIONSHIP [In],buffer : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX* [In],returnedlength : UInt32* [In]
  fun GetLogicalProcessorInformationEx(relationshiptype : LOGICAL_PROCESSOR_RELATIONSHIP, buffer : SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX*, returnedlength : UInt32*) : LibC::BOOL

  # Params # lpsysteminfo : SYSTEM_INFO* [In]
  # Commented out because function is part of Lib C
  #fun GetNativeSystemInfo(lpsysteminfo : SYSTEM_INFO*)

  # Params # lpsystemtimeasfiletime : FILETIME* [In]
  # Commented out because function is part of Lib C
  #fun GetSystemTimePreciseAsFileTime(lpsystemtimeasfiletime : FILETIME*)

  # Params # dwosmajorversion : UInt32 [In],dwosminorversion : UInt32 [In],dwspmajorversion : UInt32 [In],dwspminorversion : UInt32 [In],pdwreturnedproducttype : OS_PRODUCT_TYPE* [In]
  fun GetProductInfo(dwosmajorversion : UInt32, dwosminorversion : UInt32, dwspmajorversion : UInt32, dwspminorversion : UInt32, pdwreturnedproducttype : OS_PRODUCT_TYPE*) : LibC::BOOL

  # Params # conditionmask : UInt64 [In],typemask : VER_FLAGS [In],condition : UInt8 [In]
  fun VerSetConditionMask(conditionmask : UInt64, typemask : VER_FLAGS, condition : UInt8) : UInt64

  # Params # flags : UInt32* [In]
  fun GetOsSafeBootMode(flags : UInt32*) : LibC::BOOL

  # Params # firmwaretableprovidersignature : FIRMWARE_TABLE_PROVIDER [In],pfirmwaretableenumbuffer : FIRMWARE_TABLE_ID* [In],buffersize : UInt32 [In]
  fun EnumSystemFirmwareTables(firmwaretableprovidersignature : FIRMWARE_TABLE_PROVIDER, pfirmwaretableenumbuffer : FIRMWARE_TABLE_ID*, buffersize : UInt32) : UInt32

  # Params # firmwaretableprovidersignature : FIRMWARE_TABLE_PROVIDER [In],firmwaretableid : FIRMWARE_TABLE_ID [In],pfirmwaretablebuffer : Void* [In],buffersize : UInt32 [In]
  fun GetSystemFirmwareTable(firmwaretableprovidersignature : FIRMWARE_TABLE_PROVIDER, firmwaretableid : FIRMWARE_TABLE_ID, pfirmwaretablebuffer : Void*, buffersize : UInt32) : UInt32

  # Params # hostname : LibC::LPWSTR [In],computername : Char* [In],nsize : UInt32* [In]
  fun DnsHostnameToComputerNameExW(hostname : LibC::LPWSTR, computername : Char*, nsize : UInt32*) : LibC::BOOL

  # Params # totalmemoryinkilobytes : UInt64* [In]
  fun GetPhysicallyInstalledSystemMemory(totalmemoryinkilobytes : UInt64*) : LibC::BOOL

  # Params # nametype : COMPUTER_NAME_FORMAT [In],flags : UInt32 [In],lpbuffer : LibC::LPWSTR [In]
  fun SetComputerNameEx2W(nametype : COMPUTER_NAME_FORMAT, flags : UInt32, lpbuffer : LibC::LPWSTR) : LibC::BOOL

  # Params # dwtimeadjustment : UInt32 [In],btimeadjustmentdisabled : LibC::BOOL [In]
  fun SetSystemTimeAdjustment(dwtimeadjustment : UInt32, btimeadjustmentdisabled : LibC::BOOL) : LibC::BOOL

  # Params # dwtimeadjustment : UInt64 [In],btimeadjustmentdisabled : LibC::BOOL [In]
  fun SetSystemTimeAdjustmentPrecise(dwtimeadjustment : UInt64, btimeadjustmentdisabled : LibC::BOOL) : LibC::BOOL

  # Params # group : UInt16 [In],buffer : SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION* [In],returnedlength : UInt32* [In]
  fun GetProcessorSystemCycleTime(group : UInt16, buffer : SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION*, returnedlength : UInt32*) : LibC::BOOL

  # Params # pbenabled : LibC::BOOL* [In]
  fun GetOsManufacturingMode(pbenabled : LibC::BOOL*) : LibC::BOOL

  # Params # sizeininches : Float64* [In]
  fun GetIntegratedDisplaySize(sizeininches : Float64*) : HRESULT

  # Params # lpcomputername : PSTR [In]
  fun SetComputerNameA(lpcomputername : PSTR) : LibC::BOOL

  # Params # lpcomputername : LibC::LPWSTR [In]
  fun SetComputerNameW(lpcomputername : LibC::LPWSTR) : LibC::BOOL

  # Params # nametype : COMPUTER_NAME_FORMAT [In],lpbuffer : PSTR [In]
  fun SetComputerNameExA(nametype : COMPUTER_NAME_FORMAT, lpbuffer : PSTR) : LibC::BOOL

  # Params # information : SYSTEM_CPU_SET_INFORMATION* [In],bufferlength : UInt32 [In],returnedlength : UInt32* [In],process : LibC::HANDLE [In],flags : UInt32 [In]
  fun GetSystemCpuSetInformation(information : SYSTEM_CPU_SET_INFORMATION*, bufferlength : UInt32, returnedlength : UInt32*, process : LibC::HANDLE, flags : UInt32) : LibC::BOOL

  # Params # lpbuffer : UInt8* [In],usize : UInt32 [In]
  fun GetSystemWow64DirectoryA(lpbuffer : UInt8*, usize : UInt32) : UInt32

  # Params # lpbuffer : Char* [In],usize : UInt32 [In]
  fun GetSystemWow64DirectoryW(lpbuffer : Char*, usize : UInt32) : UInt32

  # Params # lpbuffer : UInt8* [In],usize : UInt32 [In],imagefilemachinetype : UInt16 [In]
  fun GetSystemWow64Directory2A(lpbuffer : UInt8*, usize : UInt32, imagefilemachinetype : UInt16) : UInt32

  # Params # lpbuffer : Char* [In],usize : UInt32 [In],imagefilemachinetype : UInt16 [In]
  fun GetSystemWow64Directory2W(lpbuffer : Char*, usize : UInt32, imagefilemachinetype : UInt16) : UInt32

  # Params # wowguestmachine : UInt16 [In],machineissupported : LibC::BOOL* [In]
  fun IsWow64GuestMachineSupported(wowguestmachine : UInt16, machineissupported : LibC::BOOL*) : HRESULT

  # Params # osmajorversion : UInt32 [In],osminorversion : UInt32 [In],spmajorversion : UInt32 [In],spminorversion : UInt32 [In],returnedproducttype : UInt32* [In]
  fun RtlGetProductInfo(osmajorversion : UInt32, osminorversion : UInt32, spmajorversion : UInt32, spminorversion : UInt32, returnedproducttype : UInt32*) : BOOLEAN

  # Params # flags : UInt32 [In]
  fun RtlOsDeploymentState(flags : UInt32) : OS_DEPLOYEMENT_STATE_VALUES

  # Params # dataid : RTL_SYSTEM_GLOBAL_DATA_ID [In],buffer : Void* [In],size : UInt32 [In]
  fun RtlGetSystemGlobalData(dataid : RTL_SYSTEM_GLOBAL_DATA_ID, buffer : Void*, size : UInt32) : UInt32

  # Params # pulluapinfo : UInt64* [In],puldevicefamily : DEVICEFAMILYINFOENUM* [In],puldeviceform : DEVICEFAMILYDEVICEFORM* [In]
  fun RtlGetDeviceFamilyInfoEnum(pulluapinfo : UInt64*, puldevicefamily : DEVICEFAMILYINFOENUM*, puldeviceform : DEVICEFAMILYDEVICEFORM*)

  # Params # puldevicefamilybuffersize : UInt32* [In],puldeviceformbuffersize : UInt32* [In],devicefamily : LibC::LPWSTR [In],deviceform : LibC::LPWSTR [In]
  fun RtlConvertDeviceFamilyInfoToString(puldevicefamilybuffersize : UInt32*, puldeviceformbuffersize : UInt32*, devicefamily : LibC::LPWSTR, deviceform : LibC::LPWSTR) : UInt32

  # Params # versioninfo : OSVERSIONINFOEXW* [In],typemask : UInt32 [In],conditionmask : UInt64 [In]
  fun RtlSwitchedVVI(versioninfo : OSVERSIONINFOEXW*, typemask : UInt32, conditionmask : UInt64) : UInt32

  # Params # lpbuffer : MEMORYSTATUS* [In]
  fun GlobalMemoryStatus(lpbuffer : MEMORYSTATUS*)

  # Params # 
  fun GetSystemDEPPolicy : DEP_SYSTEM_POLICY_TYPE

  # Params # firmwaretype : FIRMWARE_TYPE* [In]
  fun GetFirmwareType(firmwaretype : FIRMWARE_TYPE*) : LibC::BOOL

  # Params # lpversioninformation : OSVERSIONINFOEXA* [In],dwtypemask : VER_FLAGS [In],dwlconditionmask : UInt64 [In]
  fun VerifyVersionInfoA(lpversioninformation : OSVERSIONINFOEXA*, dwtypemask : VER_FLAGS, dwlconditionmask : UInt64) : LibC::BOOL

  # Params # lpversioninformation : OSVERSIONINFOEXW* [In],dwtypemask : VER_FLAGS [In],dwlconditionmask : UInt64 [In]
  fun VerifyVersionInfoW(lpversioninformation : OSVERSIONINFOEXW*, dwtypemask : VER_FLAGS, dwlconditionmask : UInt64) : LibC::BOOL
end
