require "./../foundation.cr"
require "./power.cr"
require "./host_compute_system.cr"

module Win32cr::System::Hypervisor
  extend self
  alias WHV_PARTITION_HANDLE = LibC::IntPtrT
  alias WHV_EMULATOR_IO_PORT_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_EMULATOR_IO_ACCESS_INFO*, Win32cr::Foundation::HRESULT)

  alias WHV_EMULATOR_MEMORY_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_ACCESS_INFO*, Win32cr::Foundation::HRESULT)

  alias WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, UInt32, Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*, Win32cr::Foundation::HRESULT)

  alias WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, UInt32, Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*, Win32cr::Foundation::HRESULT)

  alias WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK = Proc(Void*, UInt64, Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE*, UInt64*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_INITIALIZE = Proc(Void*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_TEARDOWN = Proc(Void*, Void)

  alias HDV_PCI_DEVICE_SET_CONFIGURATION = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_GET_DETAILS = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_PNP_ID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_START = Proc(Void*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_DEVICE_STOP = Proc(Void*, Void)

  alias HDV_PCI_READ_CONFIG_SPACE = Proc(Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_WRITE_CONFIG_SPACE = Proc(Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_READ_INTERCEPTED_MEMORY = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, Win32cr::Foundation::HRESULT)

  alias HDV_PCI_WRITE_INTERCEPTED_MEMORY = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, Win32cr::Foundation::HRESULT)

  alias GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK = Proc(Win32cr::Foundation::PSTR, Void)

  alias FOUND_IMAGE_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::DOS_IMAGE_INFO*, Win32cr::Foundation::BOOL)

  HVSOCKET_CONNECT_TIMEOUT = 1_u32
  HVSOCKET_CONNECT_TIMEOUT_MAX = 300000_u32
  HVSOCKET_CONTAINER_PASSTHRU = 2_u32
  HVSOCKET_CONNECTED_SUSPEND = 4_u32
  HV_PROTOCOL_RAW = 1_u32
  HVSOCKET_ADDRESS_FLAG_PASSTHRU = 1_u32
  WHV_PROCESSOR_FEATURES_BANKS_COUNT = 2_u32
  WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_COUNT = 1_u32
  WHV_READ_WRITE_GPA_RANGE_MAX_SIZE = 16_u32
  WHV_HYPERCALL_CONTEXT_MAX_XMM_REGISTERS = 6_u32
  WHV_MAX_DEVICE_ID_SIZE_IN_CHARS = 200_u32
  WHV_VPCI_TYPE0_BAR_COUNT = 6_u32
  WHV_ANY_VP = 4294967295_u32
  WHV_SYNIC_MESSAGE_SIZE = 256_u32
  VM_GENCOUNTER_SYMBOLIC_LINK_NAME = "\\VmGenerationCounter"
  IOCTL_VMGENCOUNTER_READ = 3325956_u32
  HDV_PCI_BAR_COUNT = 6_u32
  HV_GUID_ZERO = "00000000-0000-0000-0000-000000000000"
  HV_GUID_BROADCAST = "ffffffff-ffff-ffff-ffff-ffffffffffff"
  HV_GUID_CHILDREN = "90db8b89-0d35-4f79-8ce9-49ea0ac8b7cd"
  HV_GUID_LOOPBACK = "e0e16197-dd56-4a10-9195-5ee7a155a838"
  HV_GUID_PARENT = "a42e7cda-d03f-480c-9cc2-a4de20abb878"
  HV_GUID_SILOHOST = "36bd0c5c-7276-4223-88ba-7d03b654c568"
  HV_GUID_VSOCK_TEMPLATE = "00000000-facb-11e6-bd58-64006a7986d3"
  GUID_DEVINTERFACE_VM_GENCOUNTER = "3ff2c92b-6598-4e60-8e1c-0ccf4927e319"

  enum WHV_CAPABILITY_CODE
    WHvCapabilityCodeHypervisorPresent = 0_i32
    WHvCapabilityCodeFeatures = 1_i32
    WHvCapabilityCodeExtendedVmExits = 2_i32
    WHvCapabilityCodeExceptionExitBitmap = 3_i32
    WHvCapabilityCodeX64MsrExitBitmap = 4_i32
    WHvCapabilityCodeGpaRangePopulateFlags = 5_i32
    WHvCapabilityCodeSchedulerFeatures = 6_i32
    WHvCapabilityCodeProcessorVendor = 4096_i32
    WHvCapabilityCodeProcessorFeatures = 4097_i32
    WHvCapabilityCodeProcessorClFlushSize = 4098_i32
    WHvCapabilityCodeProcessorXsaveFeatures = 4099_i32
    WHvCapabilityCodeProcessorClockFrequency = 4100_i32
    WHvCapabilityCodeInterruptClockFrequency = 4101_i32
    WHvCapabilityCodeProcessorFeaturesBanks = 4102_i32
    WHvCapabilityCodeProcessorFrequencyCap = 4103_i32
    WHvCapabilityCodeSyntheticProcessorFeaturesBanks = 4104_i32
    WHvCapabilityCodeProcessorPerfmonFeatures = 4105_i32
  end
  enum WHV_PROCESSOR_VENDOR
    WHvProcessorVendorAmd = 0_i32
    WHvProcessorVendorIntel = 1_i32
    WHvProcessorVendorHygon = 2_i32
  end
  enum WHV_PARTITION_PROPERTY_CODE
    WHvPartitionPropertyCodeExtendedVmExits = 1_i32
    WHvPartitionPropertyCodeExceptionExitBitmap = 2_i32
    WHvPartitionPropertyCodeSeparateSecurityDomain = 3_i32
    WHvPartitionPropertyCodeNestedVirtualization = 4_i32
    WHvPartitionPropertyCodeX64MsrExitBitmap = 5_i32
    WHvPartitionPropertyCodePrimaryNumaNode = 6_i32
    WHvPartitionPropertyCodeCpuReserve = 7_i32
    WHvPartitionPropertyCodeCpuCap = 8_i32
    WHvPartitionPropertyCodeCpuWeight = 9_i32
    WHvPartitionPropertyCodeCpuGroupId = 10_i32
    WHvPartitionPropertyCodeProcessorFrequencyCap = 11_i32
    WHvPartitionPropertyCodeAllowDeviceAssignment = 12_i32
    WHvPartitionPropertyCodeDisableSmt = 13_i32
    WHvPartitionPropertyCodeProcessorFeatures = 4097_i32
    WHvPartitionPropertyCodeProcessorClFlushSize = 4098_i32
    WHvPartitionPropertyCodeCpuidExitList = 4099_i32
    WHvPartitionPropertyCodeCpuidResultList = 4100_i32
    WHvPartitionPropertyCodeLocalApicEmulationMode = 4101_i32
    WHvPartitionPropertyCodeProcessorXsaveFeatures = 4102_i32
    WHvPartitionPropertyCodeProcessorClockFrequency = 4103_i32
    WHvPartitionPropertyCodeInterruptClockFrequency = 4104_i32
    WHvPartitionPropertyCodeApicRemoteReadSupport = 4105_i32
    WHvPartitionPropertyCodeProcessorFeaturesBanks = 4106_i32
    WHvPartitionPropertyCodeReferenceTime = 4107_i32
    WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks = 4108_i32
    WHvPartitionPropertyCodeCpuidResultList2 = 4109_i32
    WHvPartitionPropertyCodeProcessorPerfmonFeatures = 4110_i32
    WHvPartitionPropertyCodeMsrActionList = 4111_i32
    WHvPartitionPropertyCodeUnimplementedMsrAction = 4112_i32
    WHvPartitionPropertyCodeProcessorCount = 8191_i32
  end
  enum WHV_MEMORY_ACCESS_TYPE
    WHvMemoryAccessRead = 0_i32
    WHvMemoryAccessWrite = 1_i32
    WHvMemoryAccessExecute = 2_i32
  end
  @[Flags]
  enum WHV_X64_CPUID_RESULT2_FLAGS : UInt32
    WHvX64CpuidResult2FlagSubleafSpecific = 1_u32
    WHvX64CpuidResult2FlagVpSpecific = 2_u32
  end
  enum WHV_MSR_ACTION
    WHvMsrActionArchitectureDefault = 0_i32
    WHvMsrActionIgnoreWriteReadZero = 1_i32
    WHvMsrActionExit = 2_i32
  end
  enum WHV_EXCEPTION_TYPE
    WHvX64ExceptionTypeDivideErrorFault = 0_i32
    WHvX64ExceptionTypeDebugTrapOrFault = 1_i32
    WHvX64ExceptionTypeBreakpointTrap = 3_i32
    WHvX64ExceptionTypeOverflowTrap = 4_i32
    WHvX64ExceptionTypeBoundRangeFault = 5_i32
    WHvX64ExceptionTypeInvalidOpcodeFault = 6_i32
    WHvX64ExceptionTypeDeviceNotAvailableFault = 7_i32
    WHvX64ExceptionTypeDoubleFaultAbort = 8_i32
    WHvX64ExceptionTypeInvalidTaskStateSegmentFault = 10_i32
    WHvX64ExceptionTypeSegmentNotPresentFault = 11_i32
    WHvX64ExceptionTypeStackFault = 12_i32
    WHvX64ExceptionTypeGeneralProtectionFault = 13_i32
    WHvX64ExceptionTypePageFault = 14_i32
    WHvX64ExceptionTypeFloatingPointErrorFault = 16_i32
    WHvX64ExceptionTypeAlignmentCheckFault = 17_i32
    WHvX64ExceptionTypeMachineCheckAbort = 18_i32
    WHvX64ExceptionTypeSimdFloatingPointFault = 19_i32
  end
  enum WHV_X64_LOCAL_APIC_EMULATION_MODE
    WHvX64LocalApicEmulationModeNone = 0_i32
    WHvX64LocalApicEmulationModeXApic = 1_i32
    WHvX64LocalApicEmulationModeX2Apic = 2_i32
  end
  @[Flags]
  enum WHV_MAP_GPA_RANGE_FLAGS : UInt32
    WHvMapGpaRangeFlagNone = 0_u32
    WHvMapGpaRangeFlagRead = 1_u32
    WHvMapGpaRangeFlagWrite = 2_u32
    WHvMapGpaRangeFlagExecute = 4_u32
    WHvMapGpaRangeFlagTrackDirtyPages = 8_u32
  end
  @[Flags]
  enum WHV_TRANSLATE_GVA_FLAGS : UInt32
    WHvTranslateGvaFlagNone = 0_u32
    WHvTranslateGvaFlagValidateRead = 1_u32
    WHvTranslateGvaFlagValidateWrite = 2_u32
    WHvTranslateGvaFlagValidateExecute = 4_u32
    WHvTranslateGvaFlagPrivilegeExempt = 8_u32
    WHvTranslateGvaFlagSetPageTableBits = 16_u32
    WHvTranslateGvaFlagEnforceSmap = 256_u32
    WHvTranslateGvaFlagOverrideSmap = 512_u32
  end
  enum WHV_TRANSLATE_GVA_RESULT_CODE
    WHvTranslateGvaResultSuccess = 0_i32
    WHvTranslateGvaResultPageNotPresent = 1_i32
    WHvTranslateGvaResultPrivilegeViolation = 2_i32
    WHvTranslateGvaResultInvalidPageTableFlags = 3_i32
    WHvTranslateGvaResultGpaUnmapped = 4_i32
    WHvTranslateGvaResultGpaNoReadAccess = 5_i32
    WHvTranslateGvaResultGpaNoWriteAccess = 6_i32
    WHvTranslateGvaResultGpaIllegalOverlayAccess = 7_i32
    WHvTranslateGvaResultIntercept = 8_i32
  end
  enum WHV_CACHE_TYPE
    WHvCacheTypeUncached = 0_i32
    WHvCacheTypeWriteCombining = 1_i32
    WHvCacheTypeWriteThrough = 4_i32
    WHvCacheTypeWriteProtected = 5_i32
    WHvCacheTypeWriteBack = 6_i32
  end
  enum WHV_REGISTER_NAME
    WHvX64RegisterRax = 0_i32
    WHvX64RegisterRcx = 1_i32
    WHvX64RegisterRdx = 2_i32
    WHvX64RegisterRbx = 3_i32
    WHvX64RegisterRsp = 4_i32
    WHvX64RegisterRbp = 5_i32
    WHvX64RegisterRsi = 6_i32
    WHvX64RegisterRdi = 7_i32
    WHvX64RegisterR8 = 8_i32
    WHvX64RegisterR9 = 9_i32
    WHvX64RegisterR10 = 10_i32
    WHvX64RegisterR11 = 11_i32
    WHvX64RegisterR12 = 12_i32
    WHvX64RegisterR13 = 13_i32
    WHvX64RegisterR14 = 14_i32
    WHvX64RegisterR15 = 15_i32
    WHvX64RegisterRip = 16_i32
    WHvX64RegisterRflags = 17_i32
    WHvX64RegisterEs = 18_i32
    WHvX64RegisterCs = 19_i32
    WHvX64RegisterSs = 20_i32
    WHvX64RegisterDs = 21_i32
    WHvX64RegisterFs = 22_i32
    WHvX64RegisterGs = 23_i32
    WHvX64RegisterLdtr = 24_i32
    WHvX64RegisterTr = 25_i32
    WHvX64RegisterIdtr = 26_i32
    WHvX64RegisterGdtr = 27_i32
    WHvX64RegisterCr0 = 28_i32
    WHvX64RegisterCr2 = 29_i32
    WHvX64RegisterCr3 = 30_i32
    WHvX64RegisterCr4 = 31_i32
    WHvX64RegisterCr8 = 32_i32
    WHvX64RegisterDr0 = 33_i32
    WHvX64RegisterDr1 = 34_i32
    WHvX64RegisterDr2 = 35_i32
    WHvX64RegisterDr3 = 36_i32
    WHvX64RegisterDr6 = 37_i32
    WHvX64RegisterDr7 = 38_i32
    WHvX64RegisterXCr0 = 39_i32
    WHvX64RegisterVirtualCr0 = 40_i32
    WHvX64RegisterVirtualCr3 = 41_i32
    WHvX64RegisterVirtualCr4 = 42_i32
    WHvX64RegisterVirtualCr8 = 43_i32
    WHvX64RegisterXmm0 = 4096_i32
    WHvX64RegisterXmm1 = 4097_i32
    WHvX64RegisterXmm2 = 4098_i32
    WHvX64RegisterXmm3 = 4099_i32
    WHvX64RegisterXmm4 = 4100_i32
    WHvX64RegisterXmm5 = 4101_i32
    WHvX64RegisterXmm6 = 4102_i32
    WHvX64RegisterXmm7 = 4103_i32
    WHvX64RegisterXmm8 = 4104_i32
    WHvX64RegisterXmm9 = 4105_i32
    WHvX64RegisterXmm10 = 4106_i32
    WHvX64RegisterXmm11 = 4107_i32
    WHvX64RegisterXmm12 = 4108_i32
    WHvX64RegisterXmm13 = 4109_i32
    WHvX64RegisterXmm14 = 4110_i32
    WHvX64RegisterXmm15 = 4111_i32
    WHvX64RegisterFpMmx0 = 4112_i32
    WHvX64RegisterFpMmx1 = 4113_i32
    WHvX64RegisterFpMmx2 = 4114_i32
    WHvX64RegisterFpMmx3 = 4115_i32
    WHvX64RegisterFpMmx4 = 4116_i32
    WHvX64RegisterFpMmx5 = 4117_i32
    WHvX64RegisterFpMmx6 = 4118_i32
    WHvX64RegisterFpMmx7 = 4119_i32
    WHvX64RegisterFpControlStatus = 4120_i32
    WHvX64RegisterXmmControlStatus = 4121_i32
    WHvX64RegisterTsc = 8192_i32
    WHvX64RegisterEfer = 8193_i32
    WHvX64RegisterKernelGsBase = 8194_i32
    WHvX64RegisterApicBase = 8195_i32
    WHvX64RegisterPat = 8196_i32
    WHvX64RegisterSysenterCs = 8197_i32
    WHvX64RegisterSysenterEip = 8198_i32
    WHvX64RegisterSysenterEsp = 8199_i32
    WHvX64RegisterStar = 8200_i32
    WHvX64RegisterLstar = 8201_i32
    WHvX64RegisterCstar = 8202_i32
    WHvX64RegisterSfmask = 8203_i32
    WHvX64RegisterInitialApicId = 8204_i32
    WHvX64RegisterMsrMtrrCap = 8205_i32
    WHvX64RegisterMsrMtrrDefType = 8206_i32
    WHvX64RegisterMsrMtrrPhysBase0 = 8208_i32
    WHvX64RegisterMsrMtrrPhysBase1 = 8209_i32
    WHvX64RegisterMsrMtrrPhysBase2 = 8210_i32
    WHvX64RegisterMsrMtrrPhysBase3 = 8211_i32
    WHvX64RegisterMsrMtrrPhysBase4 = 8212_i32
    WHvX64RegisterMsrMtrrPhysBase5 = 8213_i32
    WHvX64RegisterMsrMtrrPhysBase6 = 8214_i32
    WHvX64RegisterMsrMtrrPhysBase7 = 8215_i32
    WHvX64RegisterMsrMtrrPhysBase8 = 8216_i32
    WHvX64RegisterMsrMtrrPhysBase9 = 8217_i32
    WHvX64RegisterMsrMtrrPhysBaseA = 8218_i32
    WHvX64RegisterMsrMtrrPhysBaseB = 8219_i32
    WHvX64RegisterMsrMtrrPhysBaseC = 8220_i32
    WHvX64RegisterMsrMtrrPhysBaseD = 8221_i32
    WHvX64RegisterMsrMtrrPhysBaseE = 8222_i32
    WHvX64RegisterMsrMtrrPhysBaseF = 8223_i32
    WHvX64RegisterMsrMtrrPhysMask0 = 8256_i32
    WHvX64RegisterMsrMtrrPhysMask1 = 8257_i32
    WHvX64RegisterMsrMtrrPhysMask2 = 8258_i32
    WHvX64RegisterMsrMtrrPhysMask3 = 8259_i32
    WHvX64RegisterMsrMtrrPhysMask4 = 8260_i32
    WHvX64RegisterMsrMtrrPhysMask5 = 8261_i32
    WHvX64RegisterMsrMtrrPhysMask6 = 8262_i32
    WHvX64RegisterMsrMtrrPhysMask7 = 8263_i32
    WHvX64RegisterMsrMtrrPhysMask8 = 8264_i32
    WHvX64RegisterMsrMtrrPhysMask9 = 8265_i32
    WHvX64RegisterMsrMtrrPhysMaskA = 8266_i32
    WHvX64RegisterMsrMtrrPhysMaskB = 8267_i32
    WHvX64RegisterMsrMtrrPhysMaskC = 8268_i32
    WHvX64RegisterMsrMtrrPhysMaskD = 8269_i32
    WHvX64RegisterMsrMtrrPhysMaskE = 8270_i32
    WHvX64RegisterMsrMtrrPhysMaskF = 8271_i32
    WHvX64RegisterMsrMtrrFix64k00000 = 8304_i32
    WHvX64RegisterMsrMtrrFix16k80000 = 8305_i32
    WHvX64RegisterMsrMtrrFix16kA0000 = 8306_i32
    WHvX64RegisterMsrMtrrFix4kC0000 = 8307_i32
    WHvX64RegisterMsrMtrrFix4kC8000 = 8308_i32
    WHvX64RegisterMsrMtrrFix4kD0000 = 8309_i32
    WHvX64RegisterMsrMtrrFix4kD8000 = 8310_i32
    WHvX64RegisterMsrMtrrFix4kE0000 = 8311_i32
    WHvX64RegisterMsrMtrrFix4kE8000 = 8312_i32
    WHvX64RegisterMsrMtrrFix4kF0000 = 8313_i32
    WHvX64RegisterMsrMtrrFix4kF8000 = 8314_i32
    WHvX64RegisterTscAux = 8315_i32
    WHvX64RegisterBndcfgs = 8316_i32
    WHvX64RegisterMCount = 8318_i32
    WHvX64RegisterACount = 8319_i32
    WHvX64RegisterSpecCtrl = 8324_i32
    WHvX64RegisterPredCmd = 8325_i32
    WHvX64RegisterTscVirtualOffset = 8327_i32
    WHvX64RegisterTsxCtrl = 8328_i32
    WHvX64RegisterXss = 8331_i32
    WHvX64RegisterUCet = 8332_i32
    WHvX64RegisterSCet = 8333_i32
    WHvX64RegisterSsp = 8334_i32
    WHvX64RegisterPl0Ssp = 8335_i32
    WHvX64RegisterPl1Ssp = 8336_i32
    WHvX64RegisterPl2Ssp = 8337_i32
    WHvX64RegisterPl3Ssp = 8338_i32
    WHvX64RegisterInterruptSspTableAddr = 8339_i32
    WHvX64RegisterTscDeadline = 8341_i32
    WHvX64RegisterTscAdjust = 8342_i32
    WHvX64RegisterUmwaitControl = 8344_i32
    WHvX64RegisterXfd = 8345_i32
    WHvX64RegisterXfdErr = 8346_i32
    WHvX64RegisterApicId = 12290_i32
    WHvX64RegisterApicVersion = 12291_i32
    WHvX64RegisterApicTpr = 12296_i32
    WHvX64RegisterApicPpr = 12298_i32
    WHvX64RegisterApicEoi = 12299_i32
    WHvX64RegisterApicLdr = 12301_i32
    WHvX64RegisterApicSpurious = 12303_i32
    WHvX64RegisterApicIsr0 = 12304_i32
    WHvX64RegisterApicIsr1 = 12305_i32
    WHvX64RegisterApicIsr2 = 12306_i32
    WHvX64RegisterApicIsr3 = 12307_i32
    WHvX64RegisterApicIsr4 = 12308_i32
    WHvX64RegisterApicIsr5 = 12309_i32
    WHvX64RegisterApicIsr6 = 12310_i32
    WHvX64RegisterApicIsr7 = 12311_i32
    WHvX64RegisterApicTmr0 = 12312_i32
    WHvX64RegisterApicTmr1 = 12313_i32
    WHvX64RegisterApicTmr2 = 12314_i32
    WHvX64RegisterApicTmr3 = 12315_i32
    WHvX64RegisterApicTmr4 = 12316_i32
    WHvX64RegisterApicTmr5 = 12317_i32
    WHvX64RegisterApicTmr6 = 12318_i32
    WHvX64RegisterApicTmr7 = 12319_i32
    WHvX64RegisterApicIrr0 = 12320_i32
    WHvX64RegisterApicIrr1 = 12321_i32
    WHvX64RegisterApicIrr2 = 12322_i32
    WHvX64RegisterApicIrr3 = 12323_i32
    WHvX64RegisterApicIrr4 = 12324_i32
    WHvX64RegisterApicIrr5 = 12325_i32
    WHvX64RegisterApicIrr6 = 12326_i32
    WHvX64RegisterApicIrr7 = 12327_i32
    WHvX64RegisterApicEse = 12328_i32
    WHvX64RegisterApicIcr = 12336_i32
    WHvX64RegisterApicLvtTimer = 12338_i32
    WHvX64RegisterApicLvtThermal = 12339_i32
    WHvX64RegisterApicLvtPerfmon = 12340_i32
    WHvX64RegisterApicLvtLint0 = 12341_i32
    WHvX64RegisterApicLvtLint1 = 12342_i32
    WHvX64RegisterApicLvtError = 12343_i32
    WHvX64RegisterApicInitCount = 12344_i32
    WHvX64RegisterApicCurrentCount = 12345_i32
    WHvX64RegisterApicDivide = 12350_i32
    WHvX64RegisterApicSelfIpi = 12351_i32
    WHvRegisterSint0 = 16384_i32
    WHvRegisterSint1 = 16385_i32
    WHvRegisterSint2 = 16386_i32
    WHvRegisterSint3 = 16387_i32
    WHvRegisterSint4 = 16388_i32
    WHvRegisterSint5 = 16389_i32
    WHvRegisterSint6 = 16390_i32
    WHvRegisterSint7 = 16391_i32
    WHvRegisterSint8 = 16392_i32
    WHvRegisterSint9 = 16393_i32
    WHvRegisterSint10 = 16394_i32
    WHvRegisterSint11 = 16395_i32
    WHvRegisterSint12 = 16396_i32
    WHvRegisterSint13 = 16397_i32
    WHvRegisterSint14 = 16398_i32
    WHvRegisterSint15 = 16399_i32
    WHvRegisterScontrol = 16400_i32
    WHvRegisterSversion = 16401_i32
    WHvRegisterSiefp = 16402_i32
    WHvRegisterSimp = 16403_i32
    WHvRegisterEom = 16404_i32
    WHvRegisterVpRuntime = 20480_i32
    WHvX64RegisterHypercall = 20481_i32
    WHvRegisterGuestOsId = 20482_i32
    WHvRegisterVpAssistPage = 20499_i32
    WHvRegisterReferenceTsc = 20503_i32
    WHvRegisterReferenceTscSequence = 20506_i32
    WHvRegisterPendingInterruption = -2147483648_i32
    WHvRegisterInterruptState = -2147483647_i32
    WHvRegisterPendingEvent = -2147483646_i32
    WHvX64RegisterDeliverabilityNotifications = -2147483644_i32
    WHvRegisterInternalActivityState = -2147483643_i32
    WHvX64RegisterPendingDebugException = -2147483642_i32
  end
  enum WHV_X64_PENDING_EVENT_TYPE
    WHvX64PendingEventException = 0_i32
    WHvX64PendingEventExtInt = 5_i32
  end
  enum WHV_RUN_VP_EXIT_REASON
    WHvRunVpExitReasonNone = 0_i32
    WHvRunVpExitReasonMemoryAccess = 1_i32
    WHvRunVpExitReasonX64IoPortAccess = 2_i32
    WHvRunVpExitReasonUnrecoverableException = 4_i32
    WHvRunVpExitReasonInvalidVpRegisterValue = 5_i32
    WHvRunVpExitReasonUnsupportedFeature = 6_i32
    WHvRunVpExitReasonX64InterruptWindow = 7_i32
    WHvRunVpExitReasonX64Halt = 8_i32
    WHvRunVpExitReasonX64ApicEoi = 9_i32
    WHvRunVpExitReasonSynicSintDeliverable = 10_i32
    WHvRunVpExitReasonX64MsrAccess = 4096_i32
    WHvRunVpExitReasonX64Cpuid = 4097_i32
    WHvRunVpExitReasonException = 4098_i32
    WHvRunVpExitReasonX64Rdtsc = 4099_i32
    WHvRunVpExitReasonX64ApicSmiTrap = 4100_i32
    WHvRunVpExitReasonHypercall = 4101_i32
    WHvRunVpExitReasonX64ApicInitSipiTrap = 4102_i32
    WHvRunVpExitReasonX64ApicWriteTrap = 4103_i32
    WHvRunVpExitReasonCanceled = 8193_i32
  end
  enum WHV_X64_UNSUPPORTED_FEATURE_CODE
    WHvUnsupportedFeatureIntercept = 1_i32
    WHvUnsupportedFeatureTaskSwitchTss = 2_i32
  end
  enum WHV_RUN_VP_CANCEL_REASON
    WHvRunVpCancelReasonUser = 0_i32
  end
  enum WHV_X64_PENDING_INTERRUPTION_TYPE
    WHvX64PendingInterrupt = 0_i32
    WHvX64PendingNmi = 2_i32
    WHvX64PendingException = 3_i32
  end
  enum WHV_X64_APIC_WRITE_TYPE
    WHvX64ApicWriteTypeLdr = 208_i32
    WHvX64ApicWriteTypeDfr = 224_i32
    WHvX64ApicWriteTypeSvr = 240_i32
    WHvX64ApicWriteTypeLint0 = 848_i32
    WHvX64ApicWriteTypeLint1 = 864_i32
  end
  enum WHV_INTERRUPT_TYPE
    WHvX64InterruptTypeFixed = 0_i32
    WHvX64InterruptTypeLowestPriority = 1_i32
    WHvX64InterruptTypeNmi = 4_i32
    WHvX64InterruptTypeInit = 5_i32
    WHvX64InterruptTypeSipi = 6_i32
    WHvX64InterruptTypeLocalInt1 = 9_i32
  end
  enum WHV_INTERRUPT_DESTINATION_MODE
    WHvX64InterruptDestinationModePhysical = 0_i32
    WHvX64InterruptDestinationModeLogical = 1_i32
  end
  enum WHV_INTERRUPT_TRIGGER_MODE
    WHvX64InterruptTriggerModeEdge = 0_i32
    WHvX64InterruptTriggerModeLevel = 1_i32
  end
  enum WHV_PARTITION_COUNTER_SET
    WHvPartitionCounterSetMemory = 0_i32
  end
  enum WHV_PROCESSOR_COUNTER_SET
    WHvProcessorCounterSetRuntime = 0_i32
    WHvProcessorCounterSetIntercepts = 1_i32
    WHvProcessorCounterSetEvents = 2_i32
    WHvProcessorCounterSetApic = 3_i32
    WHvProcessorCounterSetSyntheticFeatures = 4_i32
  end
  enum WHV_ADVISE_GPA_RANGE_CODE
    WHvAdviseGpaRangeCodePopulate = 0_i32
    WHvAdviseGpaRangeCodePin = 1_i32
    WHvAdviseGpaRangeCodeUnpin = 2_i32
  end
  enum WHV_VIRTUAL_PROCESSOR_STATE_TYPE
    WHvVirtualProcessorStateTypeSynicMessagePage = 0_i32
    WHvVirtualProcessorStateTypeSynicEventFlagPage = 1_i32
    WHvVirtualProcessorStateTypeSynicTimerState = 2_i32
    WHvVirtualProcessorStateTypeInterruptControllerState2 = 4096_i32
    WHvVirtualProcessorStateTypeXsaveState = 4097_i32
  end
  @[Flags]
  enum WHV_ALLOCATE_VPCI_RESOURCE_FLAGS : UInt32
    WHvAllocateVpciResourceFlagNone = 0_u32
    WHvAllocateVpciResourceFlagAllowDirectP2P = 1_u32
  end
  enum WHV_VPCI_DEVICE_NOTIFICATION_TYPE
    WHvVpciDeviceNotificationUndefined = 0_i32
    WHvVpciDeviceNotificationMmioRemapping = 1_i32
    WHvVpciDeviceNotificationSurpriseRemoval = 2_i32
  end
  @[Flags]
  enum WHV_CREATE_VPCI_DEVICE_FLAGS : UInt32
    WHvCreateVpciDeviceFlagNone = 0_u32
    WHvCreateVpciDeviceFlagPhysicallyBacked = 1_u32
    WHvCreateVpciDeviceFlagUseLogicalInterrupts = 2_u32
  end
  enum WHV_VPCI_DEVICE_PROPERTY_CODE
    WHvVpciDevicePropertyCodeUndefined = 0_i32
    WHvVpciDevicePropertyCodeHardwareIDs = 1_i32
    WHvVpciDevicePropertyCodeProbedBARs = 2_i32
  end
  @[Flags]
  enum WHV_VPCI_MMIO_RANGE_FLAGS : UInt32
    WHvVpciMmioRangeFlagReadAccess = 1_u32
    WHvVpciMmioRangeFlagWriteAccess = 2_u32
  end
  enum WHV_VPCI_DEVICE_REGISTER_SPACE
    WHvVpciConfigSpace = -1_i32
    WHvVpciBar0 = 0_i32
    WHvVpciBar1 = 1_i32
    WHvVpciBar2 = 2_i32
    WHvVpciBar3 = 3_i32
    WHvVpciBar4 = 4_i32
    WHvVpciBar5 = 5_i32
  end
  @[Flags]
  enum WHV_VPCI_INTERRUPT_TARGET_FLAGS : UInt32
    WHvVpciInterruptTargetFlagNone = 0_u32
    WHvVpciInterruptTargetFlagMulticast = 1_u32
  end
  enum WHV_TRIGGER_TYPE
    WHvTriggerTypeInterrupt = 0_i32
    WHvTriggerTypeSynicEvent = 1_i32
    WHvTriggerTypeDeviceInterrupt = 2_i32
  end
  enum WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE
    WHvVirtualProcessorPropertyCodeNumaNode = 0_i32
  end
  enum WHV_NOTIFICATION_PORT_TYPE
    WHvNotificationPortTypeEvent = 2_i32
    WHvNotificationPortTypeDoorbell = 4_i32
  end
  enum WHV_NOTIFICATION_PORT_PROPERTY_CODE
    WHvNotificationPortPropertyPreferredTargetVp = 1_i32
    WHvNotificationPortPropertyPreferredTargetDuration = 5_i32
  end
  enum HDV_DEVICE_TYPE
    HdvDeviceTypeUndefined = 0_i32
    HdvDeviceTypePCI = 1_i32
  end
  enum HDV_PCI_BAR_SELECTOR
    HDV_PCI_BAR0 = 0_i32
    HDV_PCI_BAR1 = 1_i32
    HDV_PCI_BAR2 = 2_i32
    HDV_PCI_BAR3 = 3_i32
    HDV_PCI_BAR4 = 4_i32
    HDV_PCI_BAR5 = 5_i32
  end
  enum HDV_DOORBELL_FLAGS
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY = 0_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE = 1_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD = 2_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD = 3_i32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD = 4_i32
    HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE = -2147483648_i32
  end
  @[Flags]
  enum HDV_MMIO_MAPPING_FLAGS : UInt32
    HdvMmioMappingFlagNone = 0_u32
    HdvMmioMappingFlagWriteable = 1_u32
    HdvMmioMappingFlagExecutable = 2_u32
  end
  enum HDV_PCI_INTERFACE_VERSION
    HdvPciDeviceInterfaceVersionInvalid = 0_i32
    HdvPciDeviceInterfaceVersion1 = 1_i32
  end
  enum PAGING_MODE
    Paging_Invalid = 0_i32
    Paging_NonPaged = 1_i32
    Paging_32Bit = 2_i32
    Paging_Pae = 3_i32
    Paging_Long = 4_i32
    Paging_Armv8 = 5_i32
  end
  enum VIRTUAL_PROCESSOR_ARCH
    Arch_Unknown = 0_i32
    Arch_x86 = 1_i32
    Arch_x64 = 2_i32
    Arch_Armv8 = 3_i32
  end
  enum VIRTUAL_PROCESSOR_VENDOR
    ProcessorVendor_Unknown = 0_i32
    ProcessorVendor_Amd = 1_i32
    ProcessorVendor_Intel = 2_i32
    ProcessorVendor_Hygon = 3_i32
    ProcessorVendor_Arm = 4_i32
  end
  enum GUEST_OS_VENDOR
    GuestOsVendorUndefined = 0_i32
    GuestOsVendorMicrosoft = 1_i32
    GuestOsVendorHPE = 2_i32
    GuestOsVendorLANCOM = 512_i32
  end
  enum GUEST_OS_MICROSOFT_IDS
    GuestOsMicrosoftUndefined = 0_i32
    GuestOsMicrosoftMSDOS = 1_i32
    GuestOsMicrosoftWindows3x = 2_i32
    GuestOsMicrosoftWindows9x = 3_i32
    GuestOsMicrosoftWindowsNT = 4_i32
    GuestOsMicrosoftWindowsCE = 5_i32
  end
  enum GUEST_OS_OPENSOURCE_IDS
    GuestOsOpenSourceUndefined = 0_i32
    GuestOsOpenSourceLinux = 1_i32
    GuestOsOpenSourceFreeBSD = 2_i32
    GuestOsOpenSourceXen = 3_i32
    GuestOsOpenSourceIllumos = 4_i32
  end
  enum REGISTER_ID
    X64_RegisterRax = 0_i32
    X64_RegisterRcx = 1_i32
    X64_RegisterRdx = 2_i32
    X64_RegisterRbx = 3_i32
    X64_RegisterRsp = 4_i32
    X64_RegisterRbp = 5_i32
    X64_RegisterRsi = 6_i32
    X64_RegisterRdi = 7_i32
    X64_RegisterR8 = 8_i32
    X64_RegisterR9 = 9_i32
    X64_RegisterR10 = 10_i32
    X64_RegisterR11 = 11_i32
    X64_RegisterR12 = 12_i32
    X64_RegisterR13 = 13_i32
    X64_RegisterR14 = 14_i32
    X64_RegisterR15 = 15_i32
    X64_RegisterRip = 16_i32
    X64_RegisterRFlags = 17_i32
    X64_RegisterXmm0 = 18_i32
    X64_RegisterXmm1 = 19_i32
    X64_RegisterXmm2 = 20_i32
    X64_RegisterXmm3 = 21_i32
    X64_RegisterXmm4 = 22_i32
    X64_RegisterXmm5 = 23_i32
    X64_RegisterXmm6 = 24_i32
    X64_RegisterXmm7 = 25_i32
    X64_RegisterXmm8 = 26_i32
    X64_RegisterXmm9 = 27_i32
    X64_RegisterXmm10 = 28_i32
    X64_RegisterXmm11 = 29_i32
    X64_RegisterXmm12 = 30_i32
    X64_RegisterXmm13 = 31_i32
    X64_RegisterXmm14 = 32_i32
    X64_RegisterXmm15 = 33_i32
    X64_RegisterFpMmx0 = 34_i32
    X64_RegisterFpMmx1 = 35_i32
    X64_RegisterFpMmx2 = 36_i32
    X64_RegisterFpMmx3 = 37_i32
    X64_RegisterFpMmx4 = 38_i32
    X64_RegisterFpMmx5 = 39_i32
    X64_RegisterFpMmx6 = 40_i32
    X64_RegisterFpMmx7 = 41_i32
    X64_RegisterFpControlStatus = 42_i32
    X64_RegisterXmmControlStatus = 43_i32
    X64_RegisterCr0 = 44_i32
    X64_RegisterCr2 = 45_i32
    X64_RegisterCr3 = 46_i32
    X64_RegisterCr4 = 47_i32
    X64_RegisterCr8 = 48_i32
    X64_RegisterEfer = 49_i32
    X64_RegisterDr0 = 50_i32
    X64_RegisterDr1 = 51_i32
    X64_RegisterDr2 = 52_i32
    X64_RegisterDr3 = 53_i32
    X64_RegisterDr6 = 54_i32
    X64_RegisterDr7 = 55_i32
    X64_RegisterEs = 56_i32
    X64_RegisterCs = 57_i32
    X64_RegisterSs = 58_i32
    X64_RegisterDs = 59_i32
    X64_RegisterFs = 60_i32
    X64_RegisterGs = 61_i32
    X64_RegisterLdtr = 62_i32
    X64_RegisterTr = 63_i32
    X64_RegisterIdtr = 64_i32
    X64_RegisterGdtr = 65_i32
    X64_RegisterMax = 66_i32
    ARM64_RegisterX0 = 67_i32
    ARM64_RegisterX1 = 68_i32
    ARM64_RegisterX2 = 69_i32
    ARM64_RegisterX3 = 70_i32
    ARM64_RegisterX4 = 71_i32
    ARM64_RegisterX5 = 72_i32
    ARM64_RegisterX6 = 73_i32
    ARM64_RegisterX7 = 74_i32
    ARM64_RegisterX8 = 75_i32
    ARM64_RegisterX9 = 76_i32
    ARM64_RegisterX10 = 77_i32
    ARM64_RegisterX11 = 78_i32
    ARM64_RegisterX12 = 79_i32
    ARM64_RegisterX13 = 80_i32
    ARM64_RegisterX14 = 81_i32
    ARM64_RegisterX15 = 82_i32
    ARM64_RegisterX16 = 83_i32
    ARM64_RegisterX17 = 84_i32
    ARM64_RegisterX18 = 85_i32
    ARM64_RegisterX19 = 86_i32
    ARM64_RegisterX20 = 87_i32
    ARM64_RegisterX21 = 88_i32
    ARM64_RegisterX22 = 89_i32
    ARM64_RegisterX23 = 90_i32
    ARM64_RegisterX24 = 91_i32
    ARM64_RegisterX25 = 92_i32
    ARM64_RegisterX26 = 93_i32
    ARM64_RegisterX27 = 94_i32
    ARM64_RegisterX28 = 95_i32
    ARM64_RegisterXFp = 96_i32
    ARM64_RegisterXLr = 97_i32
    ARM64_RegisterPc = 98_i32
    ARM64_RegisterSpEl0 = 99_i32
    ARM64_RegisterSpEl1 = 100_i32
    ARM64_RegisterCpsr = 101_i32
    ARM64_RegisterQ0 = 102_i32
    ARM64_RegisterQ1 = 103_i32
    ARM64_RegisterQ2 = 104_i32
    ARM64_RegisterQ3 = 105_i32
    ARM64_RegisterQ4 = 106_i32
    ARM64_RegisterQ5 = 107_i32
    ARM64_RegisterQ6 = 108_i32
    ARM64_RegisterQ7 = 109_i32
    ARM64_RegisterQ8 = 110_i32
    ARM64_RegisterQ9 = 111_i32
    ARM64_RegisterQ10 = 112_i32
    ARM64_RegisterQ11 = 113_i32
    ARM64_RegisterQ12 = 114_i32
    ARM64_RegisterQ13 = 115_i32
    ARM64_RegisterQ14 = 116_i32
    ARM64_RegisterQ15 = 117_i32
    ARM64_RegisterQ16 = 118_i32
    ARM64_RegisterQ17 = 119_i32
    ARM64_RegisterQ18 = 120_i32
    ARM64_RegisterQ19 = 121_i32
    ARM64_RegisterQ20 = 122_i32
    ARM64_RegisterQ21 = 123_i32
    ARM64_RegisterQ22 = 124_i32
    ARM64_RegisterQ23 = 125_i32
    ARM64_RegisterQ24 = 126_i32
    ARM64_RegisterQ25 = 127_i32
    ARM64_RegisterQ26 = 128_i32
    ARM64_RegisterQ27 = 129_i32
    ARM64_RegisterQ28 = 130_i32
    ARM64_RegisterQ29 = 131_i32
    ARM64_RegisterQ30 = 132_i32
    ARM64_RegisterQ31 = 133_i32
    ARM64_RegisterFpStatus = 134_i32
    ARM64_RegisterFpControl = 135_i32
    ARM64_RegisterEsrEl1 = 136_i32
    ARM64_RegisterSpsrEl1 = 137_i32
    ARM64_RegisterFarEl1 = 138_i32
    ARM64_RegisterParEl1 = 139_i32
    ARM64_RegisterElrEl1 = 140_i32
    ARM64_RegisterTtbr0El1 = 141_i32
    ARM64_RegisterTtbr1El1 = 142_i32
    ARM64_RegisterVbarEl1 = 143_i32
    ARM64_RegisterSctlrEl1 = 144_i32
    ARM64_RegisterActlrEl1 = 145_i32
    ARM64_RegisterTcrEl1 = 146_i32
    ARM64_RegisterMairEl1 = 147_i32
    ARM64_RegisterAmairEl1 = 148_i32
    ARM64_RegisterTpidrEl0 = 149_i32
    ARM64_RegisterTpidrroEl0 = 150_i32
    ARM64_RegisterTpidrEl1 = 151_i32
    ARM64_RegisterContextIdrEl1 = 152_i32
    ARM64_RegisterCpacrEl1 = 153_i32
    ARM64_RegisterCsselrEl1 = 154_i32
    ARM64_RegisterCntkctlEl1 = 155_i32
    ARM64_RegisterCntvCvalEl0 = 156_i32
    ARM64_RegisterCntvCtlEl0 = 157_i32
    ARM64_RegisterMax = 158_i32
  end

  @[Extern(union: true)]
  struct WHV_CAPABILITY_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_EXTENDED_VM_EXITS
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_PROCESSOR_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_PROCESSOR_FEATURES1
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_FEATURES_BANKS
    property banks_count : UInt32
    property reserved0 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64[2]

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property bank0 : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES
    property bank1 : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES1
    def initialize(@bank0 : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES, @bank1 : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES1)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64[2])
    end
    end

    def initialize(@banks_count : UInt32, @reserved0 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern(union: true)]
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern]
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property banks_count : UInt32
    property reserved0 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64*

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property bank0 : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES
    def initialize(@bank0 : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64*)
    end
    end

    def initialize(@banks_count : UInt32, @reserved0 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern(union: true)]
  struct WHV_PROCESSOR_XSAVE_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_PROCESSOR_PERFMON_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_MSR_EXIT_BITMAP
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end

  @[Extern]
  struct WHV_MEMORY_RANGE_ENTRY
    property guest_address : UInt64
    property size_in_bytes : UInt64
    def initialize(@guest_address : UInt64, @size_in_bytes : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property as_uint32 : UInt32
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@as_uint32 : UInt32, @anonymous : Anonymous_e__Struct_)
    end
  end

  @[Extern]
  struct WHV_ADVISE_GPA_RANGE_POPULATE
    property flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property access_type : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_TYPE
    def initialize(@flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS, @access_type : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_TYPE)
    end
  end

  @[Extern]
  struct WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    property _bitfield : UInt32
    property highest_frequency_mhz : UInt32
    property nominal_frequency_mhz : UInt32
    property lowest_frequency_mhz : UInt32
    property frequency_step_mhz : UInt32
    def initialize(@_bitfield : UInt32, @highest_frequency_mhz : UInt32, @nominal_frequency_mhz : UInt32, @lowest_frequency_mhz : UInt32, @frequency_step_mhz : UInt32)
    end
  end

  @[Extern(union: true)]
  struct WHV_SCHEDULER_FEATURES
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_CAPABILITY
    property hypervisor_present : Win32cr::Foundation::BOOL
    property features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES
    property extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS
    property processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR
    property processor_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES
    property synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES
    property processor_cl_flush_size : UInt8
    property exception_exit_bitmap : UInt64
    property x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP
    property processor_clock_frequency : UInt64
    property interrupt_clock_frequency : UInt64
    property processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS
    property gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    property processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    property processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES
    property scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES
    def initialize(@hypervisor_present : Win32cr::Foundation::BOOL, @features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES, @extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS, @processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR, @processor_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES, @synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, @processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES, @processor_cl_flush_size : UInt8, @exception_exit_bitmap : UInt64, @x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP, @processor_clock_frequency : UInt64, @interrupt_clock_frequency : UInt64, @processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS, @gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS, @processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP, @processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES, @scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES)
    end
  end

  @[Extern]
  struct WHV_X64_CPUID_RESULT
    property function : UInt32
    property reserved : UInt32[3]
    property eax : UInt32
    property ebx : UInt32
    property ecx : UInt32
    property edx : UInt32
    def initialize(@function : UInt32, @reserved : UInt32[3], @eax : UInt32, @ebx : UInt32, @ecx : UInt32, @edx : UInt32)
    end
  end

  @[Extern]
  struct WHV_CPUID_OUTPUT
    property eax : UInt32
    property ebx : UInt32
    property ecx : UInt32
    property edx : UInt32
    def initialize(@eax : UInt32, @ebx : UInt32, @ecx : UInt32, @edx : UInt32)
    end
  end

  @[Extern]
  struct WHV_X64_CPUID_RESULT2
    property function : UInt32
    property index : UInt32
    property vp_index : UInt32
    property flags : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2_FLAGS
    property output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT
    property mask : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT
    def initialize(@function : UInt32, @index : UInt32, @vp_index : UInt32, @flags : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2_FLAGS, @output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT, @mask : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT)
    end
  end

  @[Extern]
  struct WHV_MSR_ACTION_ENTRY
    property index : UInt32
    property read_action : UInt8
    property write_action : UInt8
    property reserved : UInt16
    def initialize(@index : UInt32, @read_action : UInt8, @write_action : UInt8, @reserved : UInt16)
    end
  end

  @[Extern(union: true)]
  struct WHV_PARTITION_PROPERTY
    property extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS
    property processor_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES
    property synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    property processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES
    property processor_cl_flush_size : UInt8
    property processor_count : UInt32
    property cpuid_exit_list : UInt32*
    property cpuid_result_list : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT*
    property cpuid_result_list2 : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2*
    property msr_action_list : Win32cr::System::Hypervisor::WHV_MSR_ACTION_ENTRY*
    property unimplemented_msr_action : Win32cr::System::Hypervisor::WHV_MSR_ACTION
    property exception_exit_bitmap : UInt64
    property local_apic_emulation_mode : Win32cr::System::Hypervisor::WHV_X64_LOCAL_APIC_EMULATION_MODE
    property separate_security_domain : Win32cr::Foundation::BOOL
    property nested_virtualization : Win32cr::Foundation::BOOL
    property x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP
    property processor_clock_frequency : UInt64
    property interrupt_clock_frequency : UInt64
    property apic_remote_read : Win32cr::Foundation::BOOL
    property processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS
    property reference_time : UInt64
    property primary_numa_node : UInt16
    property cpu_reserve : UInt32
    property cpu_cap : UInt32
    property cpu_weight : UInt32
    property cpu_group_id : UInt64
    property processor_frequency_cap : UInt32
    property allow_device_assignment : Win32cr::Foundation::BOOL
    property processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES
    property disable_smt : Win32cr::Foundation::BOOL
    def initialize(@extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS, @processor_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES, @synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, @processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES, @processor_cl_flush_size : UInt8, @processor_count : UInt32, @cpuid_exit_list : UInt32*, @cpuid_result_list : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT*, @cpuid_result_list2 : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2*, @msr_action_list : Win32cr::System::Hypervisor::WHV_MSR_ACTION_ENTRY*, @unimplemented_msr_action : Win32cr::System::Hypervisor::WHV_MSR_ACTION, @exception_exit_bitmap : UInt64, @local_apic_emulation_mode : Win32cr::System::Hypervisor::WHV_X64_LOCAL_APIC_EMULATION_MODE, @separate_security_domain : Win32cr::Foundation::BOOL, @nested_virtualization : Win32cr::Foundation::BOOL, @x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP, @processor_clock_frequency : UInt64, @interrupt_clock_frequency : UInt64, @apic_remote_read : Win32cr::Foundation::BOOL, @processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS, @reference_time : UInt64, @primary_numa_node : UInt16, @cpu_reserve : UInt32, @cpu_cap : UInt32, @cpu_weight : UInt32, @cpu_group_id : UInt64, @processor_frequency_cap : UInt32, @allow_device_assignment : Win32cr::Foundation::BOOL, @processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES, @disable_smt : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WHV_TRANSLATE_GVA_RESULT
    property result_code : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE
    property reserved : UInt32
    def initialize(@result_code : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE, @reserved : UInt32)
    end
  end

  @[Extern(union: true)]
  struct WHV_ADVISE_GPA_RANGE
    property populate : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE
    def initialize(@populate : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE)
    end
  end

  @[Extern(union: true)]
  struct WHV_ACCESS_GPA_CONTROLS
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property cache_type : Win32cr::System::Hypervisor::WHV_CACHE_TYPE
    property reserved : UInt32
    def initialize(@cache_type : Win32cr::System::Hypervisor::WHV_CACHE_TYPE, @reserved : UInt32)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end

  @[Extern(union: true)]
  struct WHV_UINT128
    property anonymous : Anonymous_e__Struct_
    property dword : UInt32[4]

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property low64 : UInt64
    property high64 : UInt64
    def initialize(@low64 : UInt64, @high64 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @dword : UInt32[4])
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_FP_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property mantissa : UInt64
    property _bitfield : UInt64
    def initialize(@mantissa : UInt64, @_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_FP_CONTROL_STATUS_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property fp_control : UInt16
    property fp_status : UInt16
    property fp_tag : UInt8
    property reserved : UInt8
    property last_fp_op : UInt16
    property anonymous : Anonymous_e__Union_

      # Nested Type Anonymous_e__Union_
      @[Extern(union: true)]
      struct Anonymous_e__Union_
    property last_fp_rip : UInt64
    property anonymous : Anonymous_e__Struct_

        # Nested Type Anonymous_e__Struct_
        @[Extern]
        struct Anonymous_e__Struct_
    property last_fp_eip : UInt32
    property last_fp_cs : UInt16
    property reserved2 : UInt16
    def initialize(@last_fp_eip : UInt32, @last_fp_cs : UInt16, @reserved2 : UInt16)
    end
        end

    def initialize(@last_fp_rip : UInt64, @anonymous : Anonymous_e__Struct_)
    end
      end

    def initialize(@fp_control : UInt16, @fp_status : UInt16, @fp_tag : UInt8, @reserved : UInt8, @last_fp_op : UInt16, @anonymous : Anonymous_e__Union_)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_XMM_CONTROL_STATUS_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property anonymous : Anonymous_e__Union_
    property xmm_status_control : UInt32
    property xmm_status_control_mask : UInt32

      # Nested Type Anonymous_e__Union_
      @[Extern(union: true)]
      struct Anonymous_e__Union_
    property last_fp_rdp : UInt64
    property anonymous : Anonymous_e__Struct_

        # Nested Type Anonymous_e__Struct_
        @[Extern]
        struct Anonymous_e__Struct_
    property last_fp_dp : UInt32
    property last_fp_ds : UInt16
    property reserved : UInt16
    def initialize(@last_fp_dp : UInt32, @last_fp_ds : UInt16, @reserved : UInt16)
    end
        end

    def initialize(@last_fp_rdp : UInt64, @anonymous : Anonymous_e__Struct_)
    end
      end

    def initialize(@anonymous : Anonymous_e__Union_, @xmm_status_control : UInt32, @xmm_status_control_mask : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end

  @[Extern]
  struct WHV_X64_SEGMENT_REGISTER
    property base : UInt64
    property limit : UInt32
    property selector : UInt16
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous : Anonymous_e__Struct_
    property attributes : UInt16

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
      end

    def initialize(@anonymous : Anonymous_e__Struct_, @attributes : UInt16)
    end
    end

    def initialize(@base : UInt64, @limit : UInt32, @selector : UInt16, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WHV_X64_TABLE_REGISTER
    property pad : UInt16[3]
    property limit : UInt16
    property base : UInt64
    def initialize(@pad : UInt16[3], @limit : UInt16, @base : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_INTERRUPT_STATE_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_PENDING_INTERRUPTION_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    property error_code : UInt32
    def initialize(@_bitfield : UInt32, @error_code : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_PENDING_EXCEPTION_EVENT
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    property error_code : UInt32
    property exception_parameter : UInt64
    def initialize(@_bitfield : UInt32, @error_code : UInt32, @exception_parameter : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_PENDING_EXT_INT_EVENT
    property anonymous : Anonymous_e__Struct_
    property as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    property reserved2 : UInt64
    def initialize(@_bitfield : UInt64, @reserved2 : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128)
    end
  end

  @[Extern(union: true)]
  struct WHV_INTERNAL_ACTIVITY_REGISTER
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_PENDING_DEBUG_EXCEPTION
    property as_uint64 : UInt64
    property anonymous : Anonymous_e__Struct_

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64, @anonymous : Anonymous_e__Struct_)
    end
  end

  @[Extern]
  struct WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    property deliverable_sints : UInt16
    property reserved1 : UInt16
    property reserved2 : UInt32
    def initialize(@deliverable_sints : UInt16, @reserved1 : UInt16, @reserved2 : UInt32)
    end
  end

  @[Extern(union: true)]
  struct WHV_REGISTER_VALUE
    property reg128 : Win32cr::System::Hypervisor::WHV_UINT128
    property reg64 : UInt64
    property reg32 : UInt32
    property reg16 : UInt16
    property reg8 : UInt8
    property fp : Win32cr::System::Hypervisor::WHV_X64_FP_REGISTER
    property fp_control_status : Win32cr::System::Hypervisor::WHV_X64_FP_CONTROL_STATUS_REGISTER
    property xmm_control_status : Win32cr::System::Hypervisor::WHV_X64_XMM_CONTROL_STATUS_REGISTER
    property segment : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property table : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER
    property interrupt_state : Win32cr::System::Hypervisor::WHV_X64_INTERRUPT_STATE_REGISTER
    property pending_interruption : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_REGISTER
    property deliverability_notifications : Win32cr::System::Hypervisor::WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER
    property exception_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXCEPTION_EVENT
    property ext_int_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXT_INT_EVENT
    property internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER
    property pending_debug_exception : Win32cr::System::Hypervisor::WHV_X64_PENDING_DEBUG_EXCEPTION
    def initialize(@reg128 : Win32cr::System::Hypervisor::WHV_UINT128, @reg64 : UInt64, @reg32 : UInt32, @reg16 : UInt16, @reg8 : UInt8, @fp : Win32cr::System::Hypervisor::WHV_X64_FP_REGISTER, @fp_control_status : Win32cr::System::Hypervisor::WHV_X64_FP_CONTROL_STATUS_REGISTER, @xmm_control_status : Win32cr::System::Hypervisor::WHV_X64_XMM_CONTROL_STATUS_REGISTER, @segment : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @table : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER, @interrupt_state : Win32cr::System::Hypervisor::WHV_X64_INTERRUPT_STATE_REGISTER, @pending_interruption : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_REGISTER, @deliverability_notifications : Win32cr::System::Hypervisor::WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER, @exception_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXCEPTION_EVENT, @ext_int_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXT_INT_EVENT, @internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER, @pending_debug_exception : Win32cr::System::Hypervisor::WHV_X64_PENDING_DEBUG_EXCEPTION)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_VP_EXECUTION_STATE
    property anonymous : Anonymous_e__Struct_
    property as_uint16 : UInt16

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint16 : UInt16)
    end
  end

  @[Extern]
  struct WHV_VP_EXIT_CONTEXT
    property execution_state : Win32cr::System::Hypervisor::WHV_X64_VP_EXECUTION_STATE
    property _bitfield : UInt8
    property reserved : UInt8
    property reserved2 : UInt32
    property cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property rip : UInt64
    property rflags : UInt64
    def initialize(@execution_state : Win32cr::System::Hypervisor::WHV_X64_VP_EXECUTION_STATE, @_bitfield : UInt8, @reserved : UInt8, @reserved2 : UInt32, @cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @rip : UInt64, @rflags : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_MEMORY_ACCESS_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end

  @[Extern]
  struct WHV_MEMORY_ACCESS_CONTEXT
    property instruction_byte_count : UInt8
    property reserved : UInt8[3]
    property instruction_bytes : UInt8[16]
    property access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO
    property gpa : UInt64
    property gva : UInt64
    def initialize(@instruction_byte_count : UInt8, @reserved : UInt8[3], @instruction_bytes : UInt8[16], @access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO, @gpa : UInt64, @gva : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_IO_PORT_ACCESS_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end

  @[Extern]
  struct WHV_X64_IO_PORT_ACCESS_CONTEXT
    property instruction_byte_count : UInt8
    property reserved : UInt8[3]
    property instruction_bytes : UInt8[16]
    property access_info : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_INFO
    property port_number : UInt16
    property reserved2 : UInt16[3]
    property rax : UInt64
    property rcx : UInt64
    property rsi : UInt64
    property rdi : UInt64
    property ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    property es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER
    def initialize(@instruction_byte_count : UInt8, @reserved : UInt8[3], @instruction_bytes : UInt8[16], @access_info : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_INFO, @port_number : UInt16, @reserved2 : UInt16[3], @rax : UInt64, @rcx : UInt64, @rsi : UInt64, @rdi : UInt64, @ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER, @es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_MSR_ACCESS_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end

  @[Extern]
  struct WHV_X64_MSR_ACCESS_CONTEXT
    property access_info : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_INFO
    property msr_number : UInt32
    property rax : UInt64
    property rdx : UInt64
    def initialize(@access_info : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_INFO, @msr_number : UInt32, @rax : UInt64, @rdx : UInt64)
    end
  end

  @[Extern]
  struct WHV_X64_CPUID_ACCESS_CONTEXT
    property rax : UInt64
    property rcx : UInt64
    property rdx : UInt64
    property rbx : UInt64
    property default_result_rax : UInt64
    property default_result_rcx : UInt64
    property default_result_rdx : UInt64
    property default_result_rbx : UInt64
    def initialize(@rax : UInt64, @rcx : UInt64, @rdx : UInt64, @rbx : UInt64, @default_result_rax : UInt64, @default_result_rcx : UInt64, @default_result_rdx : UInt64, @default_result_rbx : UInt64)
    end
  end

  @[Extern(union: true)]
  struct WHV_VP_EXCEPTION_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end

  @[Extern]
  struct WHV_VP_EXCEPTION_CONTEXT
    property instruction_byte_count : UInt8
    property reserved : UInt8[3]
    property instruction_bytes : UInt8[16]
    property exception_info : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_INFO
    property exception_type : UInt8
    property reserved2 : UInt8[3]
    property error_code : UInt32
    property exception_parameter : UInt64
    def initialize(@instruction_byte_count : UInt8, @reserved : UInt8[3], @instruction_bytes : UInt8[16], @exception_info : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_INFO, @exception_type : UInt8, @reserved2 : UInt8[3], @error_code : UInt32, @exception_parameter : UInt64)
    end
  end

  @[Extern]
  struct WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
    property feature_code : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CODE
    property reserved : UInt32
    property feature_parameter : UInt64
    def initialize(@feature_code : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CODE, @reserved : UInt32, @feature_parameter : UInt64)
    end
  end

  @[Extern]
  struct WHV_RUN_VP_CANCELED_CONTEXT
    property cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCEL_REASON
    def initialize(@cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCEL_REASON)
    end
  end

  @[Extern]
  struct WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
    property deliverable_type : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_TYPE
    def initialize(@deliverable_type : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_TYPE)
    end
  end

  @[Extern]
  struct WHV_X64_APIC_EOI_CONTEXT
    property interrupt_vector : UInt32
    def initialize(@interrupt_vector : UInt32)
    end
  end

  @[Extern(union: true)]
  struct WHV_X64_RDTSC_INFO
    property anonymous : Anonymous_e__Struct_
    property as_uint64 : UInt64

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint64 : UInt64)
    end
  end

  @[Extern]
  struct WHV_X64_RDTSC_CONTEXT
    property tsc_aux : UInt64
    property virtual_offset : UInt64
    property tsc : UInt64
    property reference_time : UInt64
    property rdtsc_info : Win32cr::System::Hypervisor::WHV_X64_RDTSC_INFO
    def initialize(@tsc_aux : UInt64, @virtual_offset : UInt64, @tsc : UInt64, @reference_time : UInt64, @rdtsc_info : Win32cr::System::Hypervisor::WHV_X64_RDTSC_INFO)
    end
  end

  @[Extern]
  struct WHV_X64_APIC_SMI_CONTEXT
    property apic_icr : UInt64
    def initialize(@apic_icr : UInt64)
    end
  end

  @[Extern]
  struct WHV_HYPERCALL_CONTEXT
    property rax : UInt64
    property rbx : UInt64
    property rcx : UInt64
    property rdx : UInt64
    property r8 : UInt64
    property rsi : UInt64
    property rdi : UInt64
    property reserved0 : UInt64
    property xmm_registers : Win32cr::System::Hypervisor::WHV_UINT128[6]
    property reserved1 : UInt64[2]
    def initialize(@rax : UInt64, @rbx : UInt64, @rcx : UInt64, @rdx : UInt64, @r8 : UInt64, @rsi : UInt64, @rdi : UInt64, @reserved0 : UInt64, @xmm_registers : Win32cr::System::Hypervisor::WHV_UINT128[6], @reserved1 : UInt64[2])
    end
  end

  @[Extern]
  struct WHV_X64_APIC_INIT_SIPI_CONTEXT
    property apic_icr : UInt64
    def initialize(@apic_icr : UInt64)
    end
  end

  @[Extern]
  struct WHV_X64_APIC_WRITE_CONTEXT
    property type__ : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_TYPE
    property reserved : UInt32
    property write_value : UInt64
    def initialize(@type__ : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_TYPE, @reserved : UInt32, @write_value : UInt64)
    end
  end

  @[Extern]
  struct WHV_RUN_VP_EXIT_CONTEXT
    property exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON
    property reserved : UInt32
    property vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT
    property io_port_access : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT
    property msr_access : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_CONTEXT
    property cpuid_access : Win32cr::System::Hypervisor::WHV_X64_CPUID_ACCESS_CONTEXT
    property vp_exception : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_CONTEXT
    property interrupt_window : Win32cr::System::Hypervisor::WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
    property unsupported_feature : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
    property cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT
    property apic_eoi : Win32cr::System::Hypervisor::WHV_X64_APIC_EOI_CONTEXT
    property read_tsc : Win32cr::System::Hypervisor::WHV_X64_RDTSC_CONTEXT
    property apic_smi : Win32cr::System::Hypervisor::WHV_X64_APIC_SMI_CONTEXT
    property hypercall : Win32cr::System::Hypervisor::WHV_HYPERCALL_CONTEXT
    property apic_init_sipi : Win32cr::System::Hypervisor::WHV_X64_APIC_INIT_SIPI_CONTEXT
    property apic_write : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_CONTEXT
    property synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    def initialize(@memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT, @io_port_access : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT, @msr_access : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_CONTEXT, @cpuid_access : Win32cr::System::Hypervisor::WHV_X64_CPUID_ACCESS_CONTEXT, @vp_exception : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_CONTEXT, @interrupt_window : Win32cr::System::Hypervisor::WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT, @unsupported_feature : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CONTEXT, @cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT, @apic_eoi : Win32cr::System::Hypervisor::WHV_X64_APIC_EOI_CONTEXT, @read_tsc : Win32cr::System::Hypervisor::WHV_X64_RDTSC_CONTEXT, @apic_smi : Win32cr::System::Hypervisor::WHV_X64_APIC_SMI_CONTEXT, @hypercall : Win32cr::System::Hypervisor::WHV_HYPERCALL_CONTEXT, @apic_init_sipi : Win32cr::System::Hypervisor::WHV_X64_APIC_INIT_SIPI_CONTEXT, @apic_write : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_CONTEXT, @synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT)
    end
    end

    def initialize(@exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON, @reserved : UInt32, @vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WHV_INTERRUPT_CONTROL
    property _bitfield : UInt64
    property destination : UInt32
    property vector : UInt32
    def initialize(@_bitfield : UInt64, @destination : UInt32, @vector : UInt32)
    end
  end

  @[Extern]
  struct WHV_DOORBELL_MATCH_DATA
    property guest_address : UInt64
    property value : UInt64
    property length : UInt32
    property _bitfield : UInt32
    def initialize(@guest_address : UInt64, @value : UInt64, @length : UInt32, @_bitfield : UInt32)
    end
  end

  @[Extern]
  struct WHV_PARTITION_MEMORY_COUNTERS
    property mapped4_k_page_count : UInt64
    property mapped2_m_page_count : UInt64
    property mapped1_g_page_count : UInt64
    def initialize(@mapped4_k_page_count : UInt64, @mapped2_m_page_count : UInt64, @mapped1_g_page_count : UInt64)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_RUNTIME_COUNTERS
    property total_runtime100ns : UInt64
    property hypervisor_runtime100ns : UInt64
    def initialize(@total_runtime100ns : UInt64, @hypervisor_runtime100ns : UInt64)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_INTERCEPT_COUNTER
    property count : UInt64
    property time100ns : UInt64
    def initialize(@count : UInt64, @time100ns : UInt64)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_INTERCEPT_COUNTERS
    property page_invalidations : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property control_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property io_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property halt_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property cpuid_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property msr_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property emulated_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property debug_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    property rdpmc_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER
    def initialize(@page_invalidations : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @control_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @io_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @halt_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @cpuid_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @msr_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @emulated_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @debug_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER, @rdpmc_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_EVENT_COUNTERS
    property page_fault_count : UInt64
    property exception_count : UInt64
    property interrupt_count : UInt64
    def initialize(@page_fault_count : UInt64, @exception_count : UInt64, @interrupt_count : UInt64)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_APIC_COUNTERS
    property mmio_access_count : UInt64
    property eoi_access_count : UInt64
    property tpr_access_count : UInt64
    property sent_ipi_count : UInt64
    property self_ipi_count : UInt64
    def initialize(@mmio_access_count : UInt64, @eoi_access_count : UInt64, @tpr_access_count : UInt64, @sent_ipi_count : UInt64, @self_ipi_count : UInt64)
    end
  end

  @[Extern]
  struct WHV_PROCESSOR_SYNTHETIC_FEATURES_COUNTERS
    property synthetic_interrupts_count : UInt64
    property long_spin_wait_hypercalls_count : UInt64
    property other_hypercalls_count : UInt64
    property synthetic_interrupt_hypercalls_count : UInt64
    property virtual_interrupt_hypercalls_count : UInt64
    property virtual_mmu_hypercalls_count : UInt64
    def initialize(@synthetic_interrupts_count : UInt64, @long_spin_wait_hypercalls_count : UInt64, @other_hypercalls_count : UInt64, @synthetic_interrupt_hypercalls_count : UInt64, @virtual_interrupt_hypercalls_count : UInt64, @virtual_mmu_hypercalls_count : UInt64)
    end
  end

  @[Extern]
  struct WHV_SYNIC_EVENT_PARAMETERS
    property vp_index : UInt32
    property target_sint : UInt8
    property reserved : UInt8
    property flag_number : UInt16
    def initialize(@vp_index : UInt32, @target_sint : UInt8, @reserved : UInt8, @flag_number : UInt16)
    end
  end

  @[Extern]
  struct WHV_SRIOV_RESOURCE_DESCRIPTOR
    property pnp_instance_id : UInt16[200]
    property virtual_function_id : Win32cr::Foundation::LUID
    property virtual_function_index : UInt16
    property reserved : UInt16
    def initialize(@pnp_instance_id : UInt16[200], @virtual_function_id : Win32cr::Foundation::LUID, @virtual_function_index : UInt16, @reserved : UInt16)
    end
  end

  @[Extern]
  struct WHV_VPCI_DEVICE_NOTIFICATION
    property notification_type : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION_TYPE
    property reserved1 : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property reserved2 : UInt64
    def initialize(@reserved2 : UInt64)
    end
    end

    def initialize(@notification_type : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION_TYPE, @reserved1 : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WHV_VPCI_HARDWARE_IDS
    property vendor_id : UInt16
    property device_id : UInt16
    property revision_id : UInt8
    property prog_if : UInt8
    property sub_class : UInt8
    property base_class : UInt8
    property sub_vendor_id : UInt16
    property sub_system_id : UInt16
    def initialize(@vendor_id : UInt16, @device_id : UInt16, @revision_id : UInt8, @prog_if : UInt8, @sub_class : UInt8, @base_class : UInt8, @sub_vendor_id : UInt16, @sub_system_id : UInt16)
    end
  end

  @[Extern]
  struct WHV_VPCI_PROBED_BARS
    property value : UInt32[6]
    def initialize(@value : UInt32[6])
    end
  end

  @[Extern]
  struct WHV_VPCI_MMIO_MAPPING
    property location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE
    property flags : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_RANGE_FLAGS
    property size_in_bytes : UInt64
    property offset_in_bytes : UInt64
    property virtual_address : Void*
    def initialize(@location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE, @flags : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_RANGE_FLAGS, @size_in_bytes : UInt64, @offset_in_bytes : UInt64, @virtual_address : Void*)
    end
  end

  @[Extern]
  struct WHV_VPCI_DEVICE_REGISTER
    property location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE
    property size_in_bytes : UInt32
    property offset_in_bytes : UInt64
    def initialize(@location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE, @size_in_bytes : UInt32, @offset_in_bytes : UInt64)
    end
  end

  @[Extern]
  struct WHV_VPCI_INTERRUPT_TARGET
    property vector : UInt32
    property flags : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET_FLAGS
    property processor_count : UInt32
    property processors : UInt32*
    def initialize(@vector : UInt32, @flags : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET_FLAGS, @processor_count : UInt32, @processors : UInt32*)
    end
  end

  @[Extern]
  struct WHV_TRIGGER_PARAMETERS
    property trigger_type : Win32cr::System::Hypervisor::WHV_TRIGGER_TYPE
    property reserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL
    property synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS
    property device_interrupt : DeviceInterrupt_e__Struct_

      # Nested Type DeviceInterrupt_e__Struct_
      @[Extern]
      struct DeviceInterrupt_e__Struct_
    property logical_device_id : UInt64
    property msi_address : UInt64
    property msi_data : UInt32
    property reserved : UInt32
    def initialize(@logical_device_id : UInt64, @msi_address : UInt64, @msi_data : UInt32, @reserved : UInt32)
    end
      end

    def initialize(@interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL, @synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, @device_interrupt : DeviceInterrupt_e__Struct_)
    end
    end

    def initialize(@trigger_type : Win32cr::System::Hypervisor::WHV_TRIGGER_TYPE, @reserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WHV_VIRTUAL_PROCESSOR_PROPERTY
    property property_code : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE
    property reserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property numa_node : UInt16
    property padding : UInt64
    def initialize(@numa_node : UInt16, @padding : UInt64)
    end
    end

    def initialize(@property_code : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE, @reserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct WHV_NOTIFICATION_PORT_PARAMETERS
    property notification_port_type : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_TYPE
    property reserved : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property doorbell : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA
    property event : Event_e__Struct_

      # Nested Type Event_e__Struct_
      @[Extern]
      struct Event_e__Struct_
    property connection_id : UInt32
    def initialize(@connection_id : UInt32)
    end
      end

    def initialize(@doorbell : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA, @event : Event_e__Struct_)
    end
    end

    def initialize(@notification_port_type : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_TYPE, @reserved : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern(union: true)]
  struct WHV_EMULATOR_STATUS
    property anonymous : Anonymous_e__Struct_
    property as_uint32 : UInt32

    # Nested Type Anonymous_e__Struct_
    @[Extern]
    struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
    end

    def initialize(@anonymous : Anonymous_e__Struct_, @as_uint32 : UInt32)
    end
  end

  @[Extern]
  struct WHV_EMULATOR_MEMORY_ACCESS_INFO
    property gpa_address : UInt64
    property direction : UInt8
    property access_size : UInt8
    property data : UInt8[8]
    def initialize(@gpa_address : UInt64, @direction : UInt8, @access_size : UInt8, @data : UInt8[8])
    end
  end

  @[Extern]
  struct WHV_EMULATOR_IO_ACCESS_INFO
    property direction : UInt8
    property port : UInt16
    property access_size : UInt16
    property data : UInt32
    def initialize(@direction : UInt8, @port : UInt16, @access_size : UInt16, @data : UInt32)
    end
  end

  @[Extern]
  struct WHV_EMULATOR_CALLBACKS
    property size : UInt32
    property reserved : UInt32
    property w_hv_emulator_io_port_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_IO_PORT_CALLBACK
    property w_hv_emulator_memory_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_CALLBACK
    property w_hv_emulator_get_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK
    property w_hv_emulator_set_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK
    property w_hv_emulator_translate_gva_page : Win32cr::System::Hypervisor::WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK
    def initialize(@size : UInt32, @reserved : UInt32, @w_hv_emulator_io_port_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_IO_PORT_CALLBACK, @w_hv_emulator_memory_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_CALLBACK, @w_hv_emulator_get_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK, @w_hv_emulator_set_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK, @w_hv_emulator_translate_gva_page : Win32cr::System::Hypervisor::WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK)
    end
  end

  @[Extern]
  struct SOCKADDR_HV
    property family : UInt16
    property reserved : UInt16
    property vm_id : LibC::GUID
    property service_id : LibC::GUID
    def initialize(@family : UInt16, @reserved : UInt16, @vm_id : LibC::GUID, @service_id : LibC::GUID)
    end
  end

  @[Extern]
  struct HVSOCKET_ADDRESS_INFO
    property system_id : LibC::GUID
    property virtual_machine_id : LibC::GUID
    property silo_id : LibC::GUID
    property flags : UInt32
    def initialize(@system_id : LibC::GUID, @virtual_machine_id : LibC::GUID, @silo_id : LibC::GUID, @flags : UInt32)
    end
  end

  @[Extern]
  struct VM_GENCOUNTER
    property generation_count : UInt64
    property generation_count_high : UInt64
    def initialize(@generation_count : UInt64, @generation_count_high : UInt64)
    end
  end

  @[Extern]
  struct HDV_PCI_PNP_ID
    property vendor_id : UInt16
    property device_id : UInt16
    property revision_id : UInt8
    property prog_if : UInt8
    property sub_class : UInt8
    property base_class : UInt8
    property sub_vendor_id : UInt16
    property sub_system_id : UInt16
    def initialize(@vendor_id : UInt16, @device_id : UInt16, @revision_id : UInt8, @prog_if : UInt8, @sub_class : UInt8, @base_class : UInt8, @sub_vendor_id : UInt16, @sub_system_id : UInt16)
    end
  end

  @[Extern]
  struct HDV_PCI_DEVICE_INTERFACE
    property version : Win32cr::System::Hypervisor::HDV_PCI_INTERFACE_VERSION
    property initialize__ : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_INITIALIZE
    property teardown : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_TEARDOWN
    property set_configuration : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_SET_CONFIGURATION
    property get_details : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_GET_DETAILS
    property start : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_START
    property stop : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_STOP
    property read_config_space : Win32cr::System::Hypervisor::HDV_PCI_READ_CONFIG_SPACE
    property write_config_space : Win32cr::System::Hypervisor::HDV_PCI_WRITE_CONFIG_SPACE
    property read_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_READ_INTERCEPTED_MEMORY
    property write_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_WRITE_INTERCEPTED_MEMORY
    def initialize(@version : Win32cr::System::Hypervisor::HDV_PCI_INTERFACE_VERSION, @initialize__ : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_INITIALIZE, @teardown : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_TEARDOWN, @set_configuration : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_SET_CONFIGURATION, @get_details : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_GET_DETAILS, @start : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_START, @stop : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_STOP, @read_config_space : Win32cr::System::Hypervisor::HDV_PCI_READ_CONFIG_SPACE, @write_config_space : Win32cr::System::Hypervisor::HDV_PCI_WRITE_CONFIG_SPACE, @read_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_READ_INTERCEPTED_MEMORY, @write_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_WRITE_INTERCEPTED_MEMORY)
    end
  end

  @[Extern]
  struct GPA_MEMORY_CHUNK
    property guest_physical_start_page_index : UInt64
    property page_count : UInt64
    def initialize(@guest_physical_start_page_index : UInt64, @page_count : UInt64)
    end
  end

  @[Extern(union: true)]
  struct GUEST_OS_INFO
    property as_uint64 : UInt64
    property closed_source : ClosedSource_e__Struct_
    property open_source : OpenSource_e__Struct_

    # Nested Type OpenSource_e__Struct_
    @[Extern]
    struct OpenSource_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end


    # Nested Type ClosedSource_e__Struct_
    @[Extern]
    struct ClosedSource_e__Struct_
    property _bitfield : UInt64
    def initialize(@_bitfield : UInt64)
    end
    end

    def initialize(@as_uint64 : UInt64, @closed_source : ClosedSource_e__Struct_, @open_source : OpenSource_e__Struct_)
    end
  end

  @[Extern(union: true)]
  struct VIRTUAL_PROCESSOR_REGISTER
    property reg64 : UInt64
    property reg32 : UInt32
    property reg16 : UInt16
    property reg8 : UInt8
    property reg128 : Reg128_e__Struct_
    property x64 : X64_e__Union_

    # Nested Type X64_e__Union_
    @[Extern(union: true)]
    struct X64_e__Union_
    property segment : Segment_e__Struct_
    property table : Table_e__Struct_
    property fp_control_status : FpControlStatus_e__Struct_
    property xmm_control_status : XmmControlStatus_e__Struct_

      # Nested Type XmmControlStatus_e__Struct_
      @[Extern]
      struct XmmControlStatus_e__Struct_
    property anonymous : Anonymous_e__Union_
    property xmm_status_control : UInt32
    property xmm_status_control_mask : UInt32

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property last_fp_rdp : UInt64
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property last_fp_dp : UInt32
    property last_fp_ds : UInt16
    def initialize(@last_fp_dp : UInt32, @last_fp_ds : UInt16)
    end
          end

    def initialize(@last_fp_rdp : UInt64, @anonymous : Anonymous_e__Struct_)
    end
        end

    def initialize(@anonymous : Anonymous_e__Union_, @xmm_status_control : UInt32, @xmm_status_control_mask : UInt32)
    end
      end


      # Nested Type FpControlStatus_e__Struct_
      @[Extern]
      struct FpControlStatus_e__Struct_
    property fp_control : UInt16
    property fp_status : UInt16
    property fp_tag : UInt8
    property reserved : UInt8
    property last_fp_op : UInt16
    property anonymous : Anonymous_e__Union_

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property last_fp_rip : UInt64
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property last_fp_eip : UInt32
    property last_fp_cs : UInt16
    def initialize(@last_fp_eip : UInt32, @last_fp_cs : UInt16)
    end
          end

    def initialize(@last_fp_rip : UInt64, @anonymous : Anonymous_e__Struct_)
    end
        end

    def initialize(@fp_control : UInt16, @fp_status : UInt16, @fp_tag : UInt8, @reserved : UInt8, @last_fp_op : UInt16, @anonymous : Anonymous_e__Union_)
    end
      end


      # Nested Type Segment_e__Struct_
      @[Extern]
      struct Segment_e__Struct_
    property base : UInt64
    property limit : UInt32
    property selector : UInt16
    property anonymous : Anonymous_e__Union_

        # Nested Type Anonymous_e__Union_
        @[Extern(union: true)]
        struct Anonymous_e__Union_
    property attributes : UInt16
    property anonymous : Anonymous_e__Struct_

          # Nested Type Anonymous_e__Struct_
          @[Extern]
          struct Anonymous_e__Struct_
    property _bitfield : UInt16
    def initialize(@_bitfield : UInt16)
    end
          end

    def initialize(@attributes : UInt16, @anonymous : Anonymous_e__Struct_)
    end
        end

    def initialize(@base : UInt64, @limit : UInt32, @selector : UInt16, @anonymous : Anonymous_e__Union_)
    end
      end


      # Nested Type Table_e__Struct_
      @[Extern]
      struct Table_e__Struct_
    property limit : UInt16
    property base : UInt64
    def initialize(@limit : UInt16, @base : UInt64)
    end
      end

    def initialize(@segment : Segment_e__Struct_, @table : Table_e__Struct_, @fp_control_status : FpControlStatus_e__Struct_, @xmm_control_status : XmmControlStatus_e__Struct_)
    end
    end


    # Nested Type Reg128_e__Struct_
    @[Extern]
    struct Reg128_e__Struct_
    property low64 : UInt64
    property high64 : UInt64
    def initialize(@low64 : UInt64, @high64 : UInt64)
    end
    end

    def initialize(@reg64 : UInt64, @reg32 : UInt32, @reg16 : UInt16, @reg8 : UInt8, @reg128 : Reg128_e__Struct_, @x64 : X64_e__Union_)
    end
  end

  @[Extern]
  struct DOS_IMAGE_INFO
    property pdb_name : Win32cr::Foundation::PSTR
    property image_base_address : UInt64
    property image_size : UInt32
    property timestamp : UInt32
    def initialize(@pdb_name : Win32cr::Foundation::PSTR, @image_base_address : UInt64, @image_size : UInt32, @timestamp : UInt32)
    end
  end

  @[Extern]
  struct MODULE_INFO
    property process_image_name : Win32cr::Foundation::PSTR
    property image : Win32cr::System::Hypervisor::DOS_IMAGE_INFO
    def initialize(@process_image_name : Win32cr::Foundation::PSTR, @image : Win32cr::System::Hypervisor::DOS_IMAGE_INFO)
    end
  end

  def wHvGetCapability(capability_code : Win32cr::System::Hypervisor::WHV_CAPABILITY_CODE, capability_buffer : Void*, capability_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetCapability(capability_code, capability_buffer, capability_buffer_size_in_bytes, written_size_in_bytes)
  end

  def wHvCreatePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT
    C.WHvCreatePartition(partition)
  end

  def wHvSetupPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvSetupPartition(partition)
  end

  def wHvResetPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvResetPartition(partition)
  end

  def wHvDeletePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvDeletePartition(partition)
  end

  def wHvGetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetPartitionProperty(partition, property_code, property_buffer, property_buffer_size_in_bytes, written_size_in_bytes)
  end

  def wHvSetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvSetPartitionProperty(partition, property_code, property_buffer, property_buffer_size_in_bytes)
  end

  def wHvSuspendPartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvSuspendPartitionTime(partition)
  end

  def wHvResumePartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvResumePartitionTime(partition)
  end

  def wHvMapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT
    C.WHvMapGpaRange(partition, source_address, guest_address, size_in_bytes, flags)
  end

  def wHvMapGpaRange2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, process : Win32cr::Foundation::HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT
    C.WHvMapGpaRange2(partition, process, source_address, guest_address, size_in_bytes, flags)
  end

  def wHvUnmapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, size_in_bytes : UInt64) : Win32cr::Foundation::HRESULT
    C.WHvUnmapGpaRange(partition, guest_address, size_in_bytes)
  end

  def wHvTranslateGva(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, gva : UInt64, translate_flags : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, translation_result : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT*, gpa : UInt64*) : Win32cr::Foundation::HRESULT
    C.WHvTranslateGva(partition, vp_index, gva, translate_flags, translation_result, gpa)
  end

  def wHvCreateVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvCreateVirtualProcessor(partition, vp_index, flags)
  end

  def wHvCreateVirtualProcessor2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, properties : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY*, property_count : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvCreateVirtualProcessor2(partition, vp_index, properties, property_count)
  end

  def wHvDeleteVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvDeleteVirtualProcessor(partition, vp_index)
  end

  def wHvRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, exit_context : Void*, exit_context_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvRunVirtualProcessor(partition, vp_index, exit_context, exit_context_size_in_bytes)
  end

  def wHvCancelRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvCancelRunVirtualProcessor(partition, vp_index, flags)
  end

  def wHvGetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorRegisters(partition, vp_index, register_names, register_count, register_values)
  end

  def wHvSetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT
    C.WHvSetVirtualProcessorRegisters(partition, vp_index, register_names, register_count, register_values)
  end

  def wHvGetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorInterruptControllerState(partition, vp_index, state, state_size, written_size)
  end

  def wHvSetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvSetVirtualProcessorInterruptControllerState(partition, vp_index, state, state_size)
  end

  def wHvRequestInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL*, interrupt_control_size : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvRequestInterrupt(partition, interrupt, interrupt_control_size)
  end

  def wHvGetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorXsaveState(partition, vp_index, buffer, buffer_size_in_bytes, bytes_written)
  end

  def wHvSetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvSetVirtualProcessorXsaveState(partition, vp_index, buffer, buffer_size_in_bytes)
  end

  def wHvQueryGpaRangeDirtyBitmap(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, range_size_in_bytes : UInt64, bitmap : UInt64*, bitmap_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvQueryGpaRangeDirtyBitmap(partition, guest_address, range_size_in_bytes, bitmap, bitmap_size_in_bytes)
  end

  def wHvGetPartitionCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, counter_set : Win32cr::System::Hypervisor::WHV_PARTITION_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetPartitionCounters(partition, counter_set, buffer, buffer_size_in_bytes, bytes_written)
  end

  def wHvGetVirtualProcessorCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, counter_set : Win32cr::System::Hypervisor::WHV_PROCESSOR_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorCounters(partition, vp_index, counter_set, buffer, buffer_size_in_bytes, bytes_written)
  end

  def wHvGetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorInterruptControllerState2(partition, vp_index, state, state_size, written_size)
  end

  def wHvSetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvSetVirtualProcessorInterruptControllerState2(partition, vp_index, state, state_size)
  end

  def wHvRegisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*, event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvRegisterPartitionDoorbellEvent(partition, match_data, event_handle)
  end

  def wHvUnregisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*) : Win32cr::Foundation::HRESULT
    C.WHvUnregisterPartitionDoorbellEvent(partition, match_data)
  end

  def wHvAdviseGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, gpa_ranges : Win32cr::System::Hypervisor::WHV_MEMORY_RANGE_ENTRY*, gpa_ranges_count : UInt32, advice : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_CODE, advice_buffer : Void*, advice_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvAdviseGpaRange(partition, gpa_ranges, gpa_ranges_count, advice, advice_buffer, advice_buffer_size_in_bytes)
  end

  def wHvReadGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvReadGpaRange(partition, vp_index, guest_address, controls, data, data_size_in_bytes)
  end

  def wHvWriteGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvWriteGpaRange(partition, vp_index, guest_address, controls, data, data_size_in_bytes)
  end

  def wHvSignalVirtualProcessorSynicEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, newly_signaled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.WHvSignalVirtualProcessorSynicEvent(partition, synic_event, newly_signaled)
  end

  def wHvGetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorState(partition, vp_index, state_type, buffer, buffer_size_in_bytes, bytes_written)
  end

  def wHvSetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvSetVirtualProcessorState(partition, vp_index, state_type, buffer, buffer_size_in_bytes)
  end

  def wHvAllocateVpciResource(provider_id : LibC::GUID*, flags : Win32cr::System::Hypervisor::WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, resource_descriptor : Void*, resource_descriptor_size_in_bytes : UInt32, vpci_resource : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.WHvAllocateVpciResource(provider_id, flags, resource_descriptor, resource_descriptor_size_in_bytes, vpci_resource)
  end

  def wHvCreateVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, vpci_resource : Win32cr::Foundation::HANDLE, flags : Win32cr::System::Hypervisor::WHV_CREATE_VPCI_DEVICE_FLAGS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvCreateVpciDevice(partition, logical_device_id, vpci_resource, flags, notification_event_handle)
  end

  def wHvDeleteVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT
    C.WHvDeleteVpciDevice(partition, logical_device_id)
  end

  def wHvGetVpciDeviceProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, property_code : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVpciDeviceProperty(partition, logical_device_id, property_code, property_buffer, property_buffer_size_in_bytes, written_size_in_bytes)
  end

  def wHvGetVpciDeviceNotification(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, notification : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION*, notification_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvGetVpciDeviceNotification(partition, logical_device_id, notification, notification_size_in_bytes)
  end

  def wHvMapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, mapping_count : UInt32*, mappings : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_MAPPING**) : Win32cr::Foundation::HRESULT
    C.WHvMapVpciDeviceMmioRanges(partition, logical_device_id, mapping_count, mappings)
  end

  def wHvUnmapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT
    C.WHvUnmapVpciDeviceMmioRanges(partition, logical_device_id)
  end

  def wHvSetVpciDevicePowerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, power_state : Win32cr::System::Power::DEVICE_POWER_STATE) : Win32cr::Foundation::HRESULT
    C.WHvSetVpciDevicePowerState(partition, logical_device_id, power_state)
  end

  def wHvReadVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT
    C.WHvReadVpciDeviceRegister(partition, logical_device_id, register, data)
  end

  def wHvWriteVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT
    C.WHvWriteVpciDeviceRegister(partition, logical_device_id, register, data)
  end

  def wHvMapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, message_count : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, msi_address : UInt64*, msi_data : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvMapVpciDeviceInterrupt(partition, logical_device_id, index, message_count, target, msi_address, msi_data)
  end

  def wHvUnmapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvUnmapVpciDeviceInterrupt(partition, logical_device_id, index)
  end

  def wHvRetargetVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*) : Win32cr::Foundation::HRESULT
    C.WHvRetargetVpciDeviceInterrupt(partition, logical_device_id, msi_address, msi_data, target)
  end

  def wHvRequestVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvRequestVpciDeviceInterrupt(partition, logical_device_id, msi_address, msi_data)
  end

  def wHvGetVpciDeviceInterruptTarget(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, multi_message_number : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, target_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetVpciDeviceInterruptTarget(partition, logical_device_id, index, multi_message_number, target, target_size_in_bytes, bytes_written)
  end

  def wHvCreateTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void**, event_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.WHvCreateTrigger(partition, parameters, trigger_handle, event_handle)
  end

  def wHvUpdateTriggerParameters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void*) : Win32cr::Foundation::HRESULT
    C.WHvUpdateTriggerParameters(partition, parameters, trigger_handle)
  end

  def wHvDeleteTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, trigger_handle : Void*) : Win32cr::Foundation::HRESULT
    C.WHvDeleteTrigger(partition, trigger_handle)
  end

  def wHvCreateNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PARAMETERS*, event_handle : Win32cr::Foundation::HANDLE, port_handle : Void**) : Win32cr::Foundation::HRESULT
    C.WHvCreateNotificationPort(partition, parameters, event_handle, port_handle)
  end

  def wHvSetNotificationPortProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*, property_code : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PROPERTY_CODE, property_value : UInt64) : Win32cr::Foundation::HRESULT
    C.WHvSetNotificationPortProperty(partition, port_handle, property_code, property_value)
  end

  def wHvDeleteNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*) : Win32cr::Foundation::HRESULT
    C.WHvDeleteNotificationPort(partition, port_handle)
  end

  def wHvPostVirtualProcessorSynicMessage(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, sint_index : UInt32, message : Void*, message_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT
    C.WHvPostVirtualProcessorSynicMessage(partition, vp_index, sint_index, message, message_size_in_bytes)
  end

  def wHvGetVirtualProcessorCpuidOutput(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, eax : UInt32, ecx : UInt32, cpuid_output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT*) : Win32cr::Foundation::HRESULT
    C.WHvGetVirtualProcessorCpuidOutput(partition, vp_index, eax, ecx, cpuid_output)
  end

  def wHvGetInterruptTargetVpSet(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, destination : UInt64, destination_mode : Win32cr::System::Hypervisor::WHV_INTERRUPT_DESTINATION_MODE, target_vps : UInt32*, vp_count : UInt32, target_vp_count : UInt32*) : Win32cr::Foundation::HRESULT
    C.WHvGetInterruptTargetVpSet(partition, destination, destination_mode, target_vps, vp_count, target_vp_count)
  end

  def wHvStartPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, migration_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
    C.WHvStartPartitionMigration(partition, migration_handle)
  end

  def wHvCancelPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvCancelPartitionMigration(partition)
  end

  def wHvCompletePartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT
    C.WHvCompletePartitionMigration(partition)
  end

  def wHvAcceptPartitionMigration(migration_handle : Win32cr::Foundation::HANDLE, partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT
    C.WHvAcceptPartitionMigration(migration_handle, partition)
  end

  def wHvEmulatorCreateEmulator(callbacks : Win32cr::System::Hypervisor::WHV_EMULATOR_CALLBACKS*, emulator : Void**) : Win32cr::Foundation::HRESULT
    C.WHvEmulatorCreateEmulator(callbacks, emulator)
  end

  def wHvEmulatorDestroyEmulator(emulator : Void*) : Win32cr::Foundation::HRESULT
    C.WHvEmulatorDestroyEmulator(emulator)
  end

  def wHvEmulatorTryIoEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT*, io_instruction_context : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT
    C.WHvEmulatorTryIoEmulation(emulator, context, vp_context, io_instruction_context, emulator_return_status)
  end

  def wHvEmulatorTryMmioEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT*, mmio_instruction_context : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT
    C.WHvEmulatorTryMmioEmulation(emulator, context, vp_context, mmio_instruction_context, emulator_return_status)
  end

  def hdvInitializeDeviceHost(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT
    C.HdvInitializeDeviceHost(computeSystem, deviceHostHandle)
  end

  def hdvTeardownDeviceHost(deviceHostHandle : Void*) : Win32cr::Foundation::HRESULT
    C.HdvTeardownDeviceHost(deviceHostHandle)
  end

  def hdvCreateDeviceInstance(deviceHostHandle : Void*, deviceType : Win32cr::System::Hypervisor::HDV_DEVICE_TYPE, deviceClassId : LibC::GUID*, deviceInstanceId : LibC::GUID*, deviceInterface : Void*, deviceContext : Void*, deviceHandle : Void**) : Win32cr::Foundation::HRESULT
    C.HdvCreateDeviceInstance(deviceHostHandle, deviceType, deviceClassId, deviceInstanceId, deviceInterface, deviceContext, deviceHandle)
  end

  def hdvReadGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT
    C.HdvReadGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer)
  end

  def hdvWriteGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT
    C.HdvWriteGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer)
  end

  def hdvCreateGuestMemoryAperture(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, writeProtected : Win32cr::Foundation::BOOL, mappedAddress : Void**) : Win32cr::Foundation::HRESULT
    C.HdvCreateGuestMemoryAperture(requestor, guestPhysicalAddress, byteCount, writeProtected, mappedAddress)
  end

  def hdvDestroyGuestMemoryAperture(requestor : Void*, mappedAddress : Void*) : Win32cr::Foundation::HRESULT
    C.HdvDestroyGuestMemoryAperture(requestor, mappedAddress)
  end

  def hdvDeliverGuestInterrupt(requestor : Void*, msiAddress : UInt64, msiData : UInt32) : Win32cr::Foundation::HRESULT
    C.HdvDeliverGuestInterrupt(requestor, msiAddress, msiData)
  end

  def hdvRegisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64, doorbell_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.HdvRegisterDoorbell(requestor, bar_index, bar_offset, trigger_value, flags, doorbell_event)
  end

  def hdvUnregisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64) : Win32cr::Foundation::HRESULT
    C.HdvUnregisterDoorbell(requestor, bar_index, bar_offset, trigger_value, flags)
  end

  def hdvCreateSectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64, lengthInPages : UInt64, mapping_flags : Win32cr::System::Hypervisor::HDV_MMIO_MAPPING_FLAGS, sectionHandle : Win32cr::Foundation::HANDLE, sectionOffsetInPages : UInt64) : Win32cr::Foundation::HRESULT
    C.HdvCreateSectionBackedMmioRange(requestor, barIndex, offsetInPages, lengthInPages, mapping_flags, sectionHandle, sectionOffsetInPages)
  end

  def hdvDestroySectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64) : Win32cr::Foundation::HRESULT
    C.HdvDestroySectionBackedMmioRange(requestor, barIndex, offsetInPages)
  end

  def locateSavedStateFiles(vmName : Win32cr::Foundation::PWSTR, snapshotName : Win32cr::Foundation::PWSTR, binPath : Win32cr::Foundation::PWSTR*, vsvPath : Win32cr::Foundation::PWSTR*, vmrsPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.LocateSavedStateFiles(vmName, snapshotName, binPath, vsvPath, vmrsPath)
  end

  def loadSavedStateFile(vmrsFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT
    C.LoadSavedStateFile(vmrsFile, vmSavedStateDumpHandle)
  end

  def applyPendingSavedStateFileReplayLog(vmrsFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.ApplyPendingSavedStateFileReplayLog(vmrsFile)
  end

  def loadSavedStateFiles(binFile : Win32cr::Foundation::PWSTR, vsvFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT
    C.LoadSavedStateFiles(binFile, vsvFile, vmSavedStateDumpHandle)
  end

  def releaseSavedStateFiles(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT
    C.ReleaseSavedStateFiles(vmSavedStateDumpHandle)
  end

  def getGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle, virtualTrustLevels)
  end

  def getGuestOsInfo(vmSavedStateDumpHandle : Void*, virtualTrustLevel : UInt8, guestOsInfo : Win32cr::System::Hypervisor::GUEST_OS_INFO*) : Win32cr::Foundation::HRESULT
    C.GetGuestOsInfo(vmSavedStateDumpHandle, virtualTrustLevel, guestOsInfo)
  end

  def getVpCount(vmSavedStateDumpHandle : Void*, vpCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetVpCount(vmSavedStateDumpHandle, vpCount)
  end

  def getArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH*) : Win32cr::Foundation::HRESULT
    C.GetArchitecture(vmSavedStateDumpHandle, vpId, architecture)
  end

  def forceArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH) : Win32cr::Foundation::HRESULT
    C.ForceArchitecture(vmSavedStateDumpHandle, vpId, architecture)
  end

  def getActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8*) : Win32cr::Foundation::HRESULT
    C.GetActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel)
  end

  def getEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle, vpId, virtualTrustLevels)
  end

  def forceActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8) : Win32cr::Foundation::HRESULT
    C.ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel)
  end

  def isActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle : Void*, vpId : UInt32, activeVirtualTrustLevelEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle, vpId, activeVirtualTrustLevelEnabled)
  end

  def isNestedVirtualizationEnabled(vmSavedStateDumpHandle : Void*, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.IsNestedVirtualizationEnabled(vmSavedStateDumpHandle, enabled)
  end

  def getNestedVirtualizationMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.GetNestedVirtualizationMode(vmSavedStateDumpHandle, vpId, enabled)
  end

  def forceNestedHostMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, hostMode : Win32cr::Foundation::BOOL, oldMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.ForceNestedHostMode(vmSavedStateDumpHandle, vpId, hostMode, oldMode)
  end

  def inKernelSpace(vmSavedStateDumpHandle : Void*, vpId : UInt32, inKernelSpace : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.InKernelSpace(vmSavedStateDumpHandle, vpId, inKernelSpace)
  end

  def getRegisterValue(vmSavedStateDumpHandle : Void*, vpId : UInt32, registerId : UInt32, registerValue : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_REGISTER*) : Win32cr::Foundation::HRESULT
    C.GetRegisterValue(vmSavedStateDumpHandle, vpId, registerId, registerValue)
  end

  def getPagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE*) : Win32cr::Foundation::HRESULT
    C.GetPagingMode(vmSavedStateDumpHandle, vpId, pagingMode)
  end

  def forcePagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE) : Win32cr::Foundation::HRESULT
    C.ForcePagingMode(vmSavedStateDumpHandle, vpId, pagingMode)
  end

  def readGuestPhysicalAddress(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT
    C.ReadGuestPhysicalAddress(vmSavedStateDumpHandle, physicalAddress, buffer, bufferSize, bytesRead)
  end

  def guestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, physicalAddress : UInt64*, unmappedRegionSize : UInt64*) : Win32cr::Foundation::HRESULT
    C.GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle, vpId, virtualAddress, physicalAddress, unmappedRegionSize)
  end

  def getGuestPhysicalMemoryChunks(vmSavedStateDumpHandle : Void*, memoryChunkPageSize : UInt64*, memoryChunks : Win32cr::System::Hypervisor::GPA_MEMORY_CHUNK*, memoryChunkCount : UInt64*) : Win32cr::Foundation::HRESULT
    C.GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle, memoryChunkPageSize, memoryChunks, memoryChunkCount)
  end

  def guestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, rawSavedMemoryOffset : UInt64*) : Win32cr::Foundation::HRESULT
    C.GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle, physicalAddress, rawSavedMemoryOffset)
  end

  def readGuestRawSavedMemory(vmSavedStateDumpHandle : Void*, rawSavedMemoryOffset : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT
    C.ReadGuestRawSavedMemory(vmSavedStateDumpHandle, rawSavedMemoryOffset, buffer, bufferSize, bytesRead)
  end

  def getGuestRawSavedMemorySize(vmSavedStateDumpHandle : Void*, guestRawSavedMemorySize : UInt64*) : Win32cr::Foundation::HRESULT
    C.GetGuestRawSavedMemorySize(vmSavedStateDumpHandle, guestRawSavedMemorySize)
  end

  def setMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64) : Win32cr::Foundation::HRESULT
    C.SetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit)
  end

  def getMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64*) : Win32cr::Foundation::HRESULT
    C.GetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit)
  end

  def applyGuestMemoryFix(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, fixBuffer : Void*, fixBufferSize : UInt32) : Win32cr::Foundation::HRESULT
    C.ApplyGuestMemoryFix(vmSavedStateDumpHandle, vpId, virtualAddress, fixBuffer, fixBufferSize)
  end

  def loadSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*, userSymbols : Win32cr::Foundation::PWSTR, force : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.LoadSavedStateSymbolProvider(vmSavedStateDumpHandle, userSymbols, force)
  end

  def releaseSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT
    C.ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle)
  end

  def getSavedStateSymbolProviderHandle(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HANDLE
    C.GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle)
  end

  def setSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle : Void*, callback : Win32cr::System::Hypervisor::GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) : Win32cr::Foundation::HRESULT
    C.SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle, callback)
  end

  def loadSavedStateModuleSymbols(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT
    C.LoadSavedStateModuleSymbols(vmSavedStateDumpHandle, imageName, moduleName, baseAddress, sizeOfBase)
  end

  def loadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, imageTimestamp : UInt32, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT
    C.LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle, imageName, imageTimestamp, moduleName, baseAddress, sizeOfBase)
  end

  def resolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, virtualAddress : UInt64*, size : UInt32*) : Win32cr::Foundation::HRESULT
    C.ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle, vpId, globalName, virtualAddress, size)
  end

  def readSavedStateGlobalVariable(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, buffer : Void*, bufferSize : UInt32) : Win32cr::Foundation::HRESULT
    C.ReadSavedStateGlobalVariable(vmSavedStateDumpHandle, vpId, globalName, buffer, bufferSize)
  end

  def getSavedStateSymbolTypeSize(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, size : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle, vpId, typeName, size)
  end

  def findSavedStateSymbolFieldInType(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, fieldName : Win32cr::Foundation::PWSTR, offset : UInt32*, found : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle, vpId, typeName, fieldName, offset, found)
  end

  def getSavedStateSymbolFieldInfo(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, typeFieldInfoMap : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle, vpId, typeName, typeFieldInfoMap)
  end

  def scanMemoryForDosImages(vmSavedStateDumpHandle : Void*, vpId : UInt32, startAddress : UInt64, endAddress : UInt64, callbackContext : Void*, foundImageCallback : Win32cr::System::Hypervisor::FOUND_IMAGE_CALLBACK, standaloneAddress : UInt64*, standaloneAddressCount : UInt32) : Win32cr::Foundation::HRESULT
    C.ScanMemoryForDosImages(vmSavedStateDumpHandle, vpId, startAddress, endAddress, callbackContext, foundImageCallback, standaloneAddress, standaloneAddressCount)
  end

  def callStackUnwind(vmSavedStateDumpHandle : Void*, vpId : UInt32, imageInfo : Win32cr::System::Hypervisor::MODULE_INFO*, imageInfoCount : UInt32, frameCount : UInt32, callStack : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.CallStackUnwind(vmSavedStateDumpHandle, vpId, imageInfo, imageInfoCount, frameCount, callStack)
  end

  @[Link("winhvplatform")]
  @[Link("winhvemulation")]
  @[Link("vmdevicehost")]
  @[Link("vmsavedstatedumpprovider")]
  lib C
    # :nodoc:
    fun WHvGetCapability(capability_code : Win32cr::System::Hypervisor::WHV_CAPABILITY_CODE, capability_buffer : Void*, capability_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCreatePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetupPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvResetPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvDeletePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSuspendPartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvResumePartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvMapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvMapGpaRange2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, process : Win32cr::Foundation::HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvUnmapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, size_in_bytes : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvTranslateGva(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, gva : UInt64, translate_flags : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, translation_result : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT*, gpa : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCreateVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCreateVirtualProcessor2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, properties : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY*, property_count : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvDeleteVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, exit_context : Void*, exit_context_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCancelRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvRequestInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL*, interrupt_control_size : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvQueryGpaRangeDirtyBitmap(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, range_size_in_bytes : UInt64, bitmap : UInt64*, bitmap_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetPartitionCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, counter_set : Win32cr::System::Hypervisor::WHV_PARTITION_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, counter_set : Win32cr::System::Hypervisor::WHV_PROCESSOR_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvRegisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*, event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvUnregisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvAdviseGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, gpa_ranges : Win32cr::System::Hypervisor::WHV_MEMORY_RANGE_ENTRY*, gpa_ranges_count : UInt32, advice : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_CODE, advice_buffer : Void*, advice_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvReadGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvWriteGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSignalVirtualProcessorSynicEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, newly_signaled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvAllocateVpciResource(provider_id : LibC::GUID*, flags : Win32cr::System::Hypervisor::WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, resource_descriptor : Void*, resource_descriptor_size_in_bytes : UInt32, vpci_resource : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCreateVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, vpci_resource : Win32cr::Foundation::HANDLE, flags : Win32cr::System::Hypervisor::WHV_CREATE_VPCI_DEVICE_FLAGS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvDeleteVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVpciDeviceProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, property_code : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVpciDeviceNotification(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, notification : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION*, notification_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvMapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, mapping_count : UInt32*, mappings : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_MAPPING**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvUnmapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetVpciDevicePowerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, power_state : Win32cr::System::Power::DEVICE_POWER_STATE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvReadVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvWriteVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvMapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, message_count : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, msi_address : UInt64*, msi_data : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvUnmapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvRetargetVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvRequestVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVpciDeviceInterruptTarget(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, multi_message_number : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, target_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCreateTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void**, event_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvUpdateTriggerParameters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvDeleteTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, trigger_handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCreateNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PARAMETERS*, event_handle : Win32cr::Foundation::HANDLE, port_handle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvSetNotificationPortProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*, property_code : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PROPERTY_CODE, property_value : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvDeleteNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvPostVirtualProcessorSynicMessage(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, sint_index : UInt32, message : Void*, message_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetVirtualProcessorCpuidOutput(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, eax : UInt32, ecx : UInt32, cpuid_output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvGetInterruptTargetVpSet(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, destination : UInt64, destination_mode : Win32cr::System::Hypervisor::WHV_INTERRUPT_DESTINATION_MODE, target_vps : UInt32*, vp_count : UInt32, target_vp_count : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvStartPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, migration_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCancelPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvCompletePartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvAcceptPartitionMigration(migration_handle : Win32cr::Foundation::HANDLE, partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvEmulatorCreateEmulator(callbacks : Win32cr::System::Hypervisor::WHV_EMULATOR_CALLBACKS*, emulator : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvEmulatorDestroyEmulator(emulator : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvEmulatorTryIoEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT*, io_instruction_context : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WHvEmulatorTryMmioEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT*, mmio_instruction_context : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvInitializeDeviceHost(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvTeardownDeviceHost(deviceHostHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvCreateDeviceInstance(deviceHostHandle : Void*, deviceType : Win32cr::System::Hypervisor::HDV_DEVICE_TYPE, deviceClassId : LibC::GUID*, deviceInstanceId : LibC::GUID*, deviceInterface : Void*, deviceContext : Void*, deviceHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvReadGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvWriteGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvCreateGuestMemoryAperture(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, writeProtected : Win32cr::Foundation::BOOL, mappedAddress : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvDestroyGuestMemoryAperture(requestor : Void*, mappedAddress : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvDeliverGuestInterrupt(requestor : Void*, msiAddress : UInt64, msiData : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvRegisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64, doorbell_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvUnregisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvCreateSectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64, lengthInPages : UInt64, mapping_flags : Win32cr::System::Hypervisor::HDV_MMIO_MAPPING_FLAGS, sectionHandle : Win32cr::Foundation::HANDLE, sectionOffsetInPages : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun HdvDestroySectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LocateSavedStateFiles(vmName : Win32cr::Foundation::PWSTR, snapshotName : Win32cr::Foundation::PWSTR, binPath : Win32cr::Foundation::PWSTR*, vsvPath : Win32cr::Foundation::PWSTR*, vmrsPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateFile(vmrsFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplyPendingSavedStateFileReplayLog(vmrsFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateFiles(binFile : Win32cr::Foundation::PWSTR, vsvFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReleaseSavedStateFiles(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestOsInfo(vmSavedStateDumpHandle : Void*, virtualTrustLevel : UInt8, guestOsInfo : Win32cr::System::Hypervisor::GUEST_OS_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetVpCount(vmSavedStateDumpHandle : Void*, vpCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForceArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle : Void*, vpId : UInt32, activeVirtualTrustLevelEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsNestedVirtualizationEnabled(vmSavedStateDumpHandle : Void*, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetNestedVirtualizationMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForceNestedHostMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, hostMode : Win32cr::Foundation::BOOL, oldMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun InKernelSpace(vmSavedStateDumpHandle : Void*, vpId : UInt32, inKernelSpace : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetRegisterValue(vmSavedStateDumpHandle : Void*, vpId : UInt32, registerId : UInt32, registerValue : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_REGISTER*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetPagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ForcePagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadGuestPhysicalAddress(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, physicalAddress : UInt64*, unmappedRegionSize : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle : Void*, memoryChunkPageSize : UInt64*, memoryChunks : Win32cr::System::Hypervisor::GPA_MEMORY_CHUNK*, memoryChunkCount : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, rawSavedMemoryOffset : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadGuestRawSavedMemory(vmSavedStateDumpHandle : Void*, rawSavedMemoryOffset : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGuestRawSavedMemorySize(vmSavedStateDumpHandle : Void*, guestRawSavedMemorySize : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplyGuestMemoryFix(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, fixBuffer : Void*, fixBufferSize : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*, userSymbols : Win32cr::Foundation::PWSTR, force : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle : Void*, callback : Win32cr::System::Hypervisor::GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateModuleSymbols(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, imageTimestamp : UInt32, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, virtualAddress : UInt64*, size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReadSavedStateGlobalVariable(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, buffer : Void*, bufferSize : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, size : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, fieldName : Win32cr::Foundation::PWSTR, offset : UInt32*, found : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, typeFieldInfoMap : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ScanMemoryForDosImages(vmSavedStateDumpHandle : Void*, vpId : UInt32, startAddress : UInt64, endAddress : UInt64, callbackContext : Void*, foundImageCallback : Win32cr::System::Hypervisor::FOUND_IMAGE_CALLBACK, standaloneAddress : UInt64*, standaloneAddressCount : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CallStackUnwind(vmSavedStateDumpHandle : Void*, vpId : UInt32, imageInfo : Win32cr::System::Hypervisor::MODULE_INFO*, imageInfoCount : UInt32, frameCount : UInt32, callStack : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

  end
end