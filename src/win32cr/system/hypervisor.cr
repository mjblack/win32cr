require "./../foundation.cr"
require "./power.cr"
require "./host_compute_system.cr"

module Win32cr::System::Hypervisor
  alias WHV_PARTITION_HANDLE = LibC::IntPtrT
  alias WHV_EMULATOR_IO_PORT_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_EMULATOR_IO_ACCESS_INFO*, Win32cr::Foundation::HRESULT)*

  alias WHV_EMULATOR_MEMORY_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_ACCESS_INFO*, Win32cr::Foundation::HRESULT)*

  alias WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, UInt32, Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*, Win32cr::Foundation::HRESULT)*

  alias WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, UInt32, Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*, Win32cr::Foundation::HRESULT)*

  alias WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK = Proc(Void*, UInt64, Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE*, UInt64*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_DEVICE_INITIALIZE = Proc(Void*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_DEVICE_TEARDOWN = Proc(Void*, Void)*

  alias HDV_PCI_DEVICE_SET_CONFIGURATION = Proc(Void*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_DEVICE_GET_DETAILS = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_PNP_ID*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_DEVICE_START = Proc(Void*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_DEVICE_STOP = Proc(Void*, Void)*

  alias HDV_PCI_READ_CONFIG_SPACE = Proc(Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_WRITE_CONFIG_SPACE = Proc(Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_READ_INTERCEPTED_MEMORY = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, Win32cr::Foundation::HRESULT)*

  alias HDV_PCI_WRITE_INTERCEPTED_MEMORY = Proc(Void*, Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, Win32cr::Foundation::HRESULT)*

  alias GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK = Proc(Win32cr::Foundation::PSTR, Void)*

  alias FOUND_IMAGE_CALLBACK = Proc(Void*, Win32cr::System::Hypervisor::DOS_IMAGE_INFO*, Win32cr::Foundation::BOOL)*

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
  record WHV_CAPABILITY_FEATURES,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_EXTENDED_VM_EXITS,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_PROCESSOR_FEATURES,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_PROCESSOR_FEATURES1,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern]
  record WHV_PROCESSOR_FEATURES_BANKS,
    banks_count : UInt32,
    reserved0 : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      as_uint64 : UInt64[2] do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        bank0 : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES,
        bank1 : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES1

    end

  end

  @[Extern(union: true)]
  record WHV_SYNTHETIC_PROCESSOR_FEATURES,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern]
  record WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS,
    banks_count : UInt32,
    reserved0 : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      as_uint64 : UInt64* do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        bank0 : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES

    end

  end

  @[Extern(union: true)]
  record WHV_PROCESSOR_XSAVE_FEATURES,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_PROCESSOR_PERFMON_FEATURES,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_MSR_EXIT_BITMAP,
    as_uint64 : UInt64,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern]
  record WHV_MEMORY_RANGE_ENTRY,
    guest_address : UInt64,
    size_in_bytes : UInt64

  @[Extern(union: true)]
  record WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS,
    as_uint32 : UInt32,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record WHV_ADVISE_GPA_RANGE_POPULATE,
    flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS,
    access_type : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_TYPE

  @[Extern]
  record WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP,
    _bitfield : UInt32,
    highest_frequency_mhz : UInt32,
    nominal_frequency_mhz : UInt32,
    lowest_frequency_mhz : UInt32,
    frequency_step_mhz : UInt32

  @[Extern(union: true)]
  record WHV_SCHEDULER_FEATURES,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_CAPABILITY,
    hypervisor_present : Win32cr::Foundation::BOOL,
    features : Win32cr::System::Hypervisor::WHV_CAPABILITY_FEATURES,
    extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS,
    processor_vendor : Win32cr::System::Hypervisor::WHV_PROCESSOR_VENDOR,
    processor_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES,
    synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS,
    processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES,
    processor_cl_flush_size : UInt8,
    exception_exit_bitmap : UInt64,
    x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP,
    processor_clock_frequency : UInt64,
    interrupt_clock_frequency : UInt64,
    processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS,
    gpa_range_populate_flags : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS,
    processor_frequency_cap : Win32cr::System::Hypervisor::WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP,
    processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES,
    scheduler_features : Win32cr::System::Hypervisor::WHV_SCHEDULER_FEATURES

  @[Extern]
  record WHV_X64_CPUID_RESULT,
    function : UInt32,
    reserved : UInt32[3],
    eax : UInt32,
    ebx : UInt32,
    ecx : UInt32,
    edx : UInt32

  @[Extern]
  record WHV_CPUID_OUTPUT,
    eax : UInt32,
    ebx : UInt32,
    ecx : UInt32,
    edx : UInt32

  @[Extern]
  record WHV_X64_CPUID_RESULT2,
    function : UInt32,
    index : UInt32,
    vp_index : UInt32,
    flags : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2_FLAGS,
    output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT,
    mask : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT

  @[Extern]
  record WHV_MSR_ACTION_ENTRY,
    index : UInt32,
    read_action : UInt8,
    write_action : UInt8,
    reserved : UInt16

  @[Extern(union: true)]
  record WHV_PARTITION_PROPERTY,
    extended_vm_exits : Win32cr::System::Hypervisor::WHV_EXTENDED_VM_EXITS,
    processor_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES,
    synthetic_processor_features_banks : Win32cr::System::Hypervisor::WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS,
    processor_xsave_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_XSAVE_FEATURES,
    processor_cl_flush_size : UInt8,
    processor_count : UInt32,
    cpuid_exit_list : UInt32*,
    cpuid_result_list : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT*,
    cpuid_result_list2 : Win32cr::System::Hypervisor::WHV_X64_CPUID_RESULT2*,
    msr_action_list : Win32cr::System::Hypervisor::WHV_MSR_ACTION_ENTRY*,
    unimplemented_msr_action : Win32cr::System::Hypervisor::WHV_MSR_ACTION,
    exception_exit_bitmap : UInt64,
    local_apic_emulation_mode : Win32cr::System::Hypervisor::WHV_X64_LOCAL_APIC_EMULATION_MODE,
    separate_security_domain : Win32cr::Foundation::BOOL,
    nested_virtualization : Win32cr::Foundation::BOOL,
    x64_msr_exit_bitmap : Win32cr::System::Hypervisor::WHV_X64_MSR_EXIT_BITMAP,
    processor_clock_frequency : UInt64,
    interrupt_clock_frequency : UInt64,
    apic_remote_read : Win32cr::Foundation::BOOL,
    processor_features_banks : Win32cr::System::Hypervisor::WHV_PROCESSOR_FEATURES_BANKS,
    reference_time : UInt64,
    primary_numa_node : UInt16,
    cpu_reserve : UInt32,
    cpu_cap : UInt32,
    cpu_weight : UInt32,
    cpu_group_id : UInt64,
    processor_frequency_cap : UInt32,
    allow_device_assignment : Win32cr::Foundation::BOOL,
    processor_perfmon_features : Win32cr::System::Hypervisor::WHV_PROCESSOR_PERFMON_FEATURES,
    disable_smt : Win32cr::Foundation::BOOL

  @[Extern]
  record WHV_TRANSLATE_GVA_RESULT,
    result_code : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT_CODE,
    reserved : UInt32

  @[Extern(union: true)]
  record WHV_ADVISE_GPA_RANGE,
    populate : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_POPULATE

  @[Extern(union: true)]
  record WHV_ACCESS_GPA_CONTROLS,
    as_uint64 : UInt64,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      cache_type : Win32cr::System::Hypervisor::WHV_CACHE_TYPE,
      reserved : UInt32

  end

  @[Extern(union: true)]
  record WHV_UINT128,
    anonymous : Anonymous_e__Struct,
    dword : UInt32[4] do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      low64 : UInt64,
      high64 : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_FP_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      mantissa : UInt64,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_FP_CONTROL_STATUS_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      fp_control : UInt16,
      fp_status : UInt16,
      fp_tag : UInt8,
      reserved : UInt8,
      last_fp_op : UInt16,
      anonymous : Anonymous_e__Union do

      # Nested Type Anonymous_e__Union
      @[Extern(union: true)]
      record Anonymous_e__Union,
        last_fp_rip : UInt64,
        anonymous : Anonymous_e__Struct do

        # Nested Type Anonymous_e__Struct
        @[Extern]
        record Anonymous_e__Struct,
          last_fp_eip : UInt32,
          last_fp_cs : UInt16,
          reserved2 : UInt16

      end

    end

  end

  @[Extern(union: true)]
  record WHV_X64_XMM_CONTROL_STATUS_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      anonymous : Anonymous_e__Union,
      xmm_status_control : UInt32,
      xmm_status_control_mask : UInt32 do

      # Nested Type Anonymous_e__Union
      @[Extern(union: true)]
      record Anonymous_e__Union,
        last_fp_rdp : UInt64,
        anonymous : Anonymous_e__Struct do

        # Nested Type Anonymous_e__Struct
        @[Extern]
        record Anonymous_e__Struct,
          last_fp_dp : UInt32,
          last_fp_ds : UInt16,
          reserved : UInt16

      end

    end

  end

  @[Extern]
  record WHV_X64_SEGMENT_REGISTER,
    base : UInt64,
    limit : UInt32,
    selector : UInt16,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      anonymous : Anonymous_e__Struct,
      attributes : UInt16 do

      # Nested Type Anonymous_e__Struct
      @[Extern]
      record Anonymous_e__Struct,
        _bitfield : UInt16

    end

  end

  @[Extern]
  record WHV_X64_TABLE_REGISTER,
    pad : UInt16[3],
    limit : UInt16,
    base : UInt64

  @[Extern(union: true)]
  record WHV_X64_INTERRUPT_STATE_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_PENDING_INTERRUPTION_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32,
      error_code : UInt32

  end

  @[Extern(union: true)]
  record WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_PENDING_EXCEPTION_EVENT,
    anonymous : Anonymous_e__Struct,
    as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32,
      error_code : UInt32,
      exception_parameter : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_PENDING_EXT_INT_EVENT,
    anonymous : Anonymous_e__Struct,
    as_uint128 : Win32cr::System::Hypervisor::WHV_UINT128 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64,
      reserved2 : UInt64

  end

  @[Extern(union: true)]
  record WHV_INTERNAL_ACTIVITY_REGISTER,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record WHV_X64_PENDING_DEBUG_EXCEPTION,
    as_uint64 : UInt64,
    anonymous : Anonymous_e__Struct do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern]
  record WHV_SYNIC_SINT_DELIVERABLE_CONTEXT,
    deliverable_sints : UInt16,
    reserved1 : UInt16,
    reserved2 : UInt32

  @[Extern(union: true)]
  record WHV_REGISTER_VALUE,
    reg128 : Win32cr::System::Hypervisor::WHV_UINT128,
    reg64 : UInt64,
    reg32 : UInt32,
    reg16 : UInt16,
    reg8 : UInt8,
    fp : Win32cr::System::Hypervisor::WHV_X64_FP_REGISTER,
    fp_control_status : Win32cr::System::Hypervisor::WHV_X64_FP_CONTROL_STATUS_REGISTER,
    xmm_control_status : Win32cr::System::Hypervisor::WHV_X64_XMM_CONTROL_STATUS_REGISTER,
    segment : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER,
    table : Win32cr::System::Hypervisor::WHV_X64_TABLE_REGISTER,
    interrupt_state : Win32cr::System::Hypervisor::WHV_X64_INTERRUPT_STATE_REGISTER,
    pending_interruption : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_REGISTER,
    deliverability_notifications : Win32cr::System::Hypervisor::WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER,
    exception_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXCEPTION_EVENT,
    ext_int_event : Win32cr::System::Hypervisor::WHV_X64_PENDING_EXT_INT_EVENT,
    internal_activity : Win32cr::System::Hypervisor::WHV_INTERNAL_ACTIVITY_REGISTER,
    pending_debug_exception : Win32cr::System::Hypervisor::WHV_X64_PENDING_DEBUG_EXCEPTION

  @[Extern(union: true)]
  record WHV_X64_VP_EXECUTION_STATE,
    anonymous : Anonymous_e__Struct,
    as_uint16 : UInt16 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt16

  end

  @[Extern]
  record WHV_VP_EXIT_CONTEXT,
    execution_state : Win32cr::System::Hypervisor::WHV_X64_VP_EXECUTION_STATE,
    _bitfield : UInt8,
    reserved : UInt8,
    reserved2 : UInt32,
    cs : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER,
    rip : UInt64,
    rflags : UInt64

  @[Extern(union: true)]
  record WHV_MEMORY_ACCESS_INFO,
    anonymous : Anonymous_e__Struct,
    as_uint32 : UInt32 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record WHV_MEMORY_ACCESS_CONTEXT,
    instruction_byte_count : UInt8,
    reserved : UInt8[3],
    instruction_bytes : UInt8[16],
    access_info : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_INFO,
    gpa : UInt64,
    gva : UInt64

  @[Extern(union: true)]
  record WHV_X64_IO_PORT_ACCESS_INFO,
    anonymous : Anonymous_e__Struct,
    as_uint32 : UInt32 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record WHV_X64_IO_PORT_ACCESS_CONTEXT,
    instruction_byte_count : UInt8,
    reserved : UInt8[3],
    instruction_bytes : UInt8[16],
    access_info : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_INFO,
    port_number : UInt16,
    reserved2 : UInt16[3],
    rax : UInt64,
    rcx : UInt64,
    rsi : UInt64,
    rdi : UInt64,
    ds : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER,
    es : Win32cr::System::Hypervisor::WHV_X64_SEGMENT_REGISTER

  @[Extern(union: true)]
  record WHV_X64_MSR_ACCESS_INFO,
    anonymous : Anonymous_e__Struct,
    as_uint32 : UInt32 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record WHV_X64_MSR_ACCESS_CONTEXT,
    access_info : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_INFO,
    msr_number : UInt32,
    rax : UInt64,
    rdx : UInt64

  @[Extern]
  record WHV_X64_CPUID_ACCESS_CONTEXT,
    rax : UInt64,
    rcx : UInt64,
    rdx : UInt64,
    rbx : UInt64,
    default_result_rax : UInt64,
    default_result_rcx : UInt64,
    default_result_rdx : UInt64,
    default_result_rbx : UInt64

  @[Extern(union: true)]
  record WHV_VP_EXCEPTION_INFO,
    anonymous : Anonymous_e__Struct,
    as_uint32 : UInt32 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record WHV_VP_EXCEPTION_CONTEXT,
    instruction_byte_count : UInt8,
    reserved : UInt8[3],
    instruction_bytes : UInt8[16],
    exception_info : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_INFO,
    exception_type : UInt8,
    reserved2 : UInt8[3],
    error_code : UInt32,
    exception_parameter : UInt64

  @[Extern]
  record WHV_X64_UNSUPPORTED_FEATURE_CONTEXT,
    feature_code : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CODE,
    reserved : UInt32,
    feature_parameter : UInt64

  @[Extern]
  record WHV_RUN_VP_CANCELED_CONTEXT,
    cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCEL_REASON

  @[Extern]
  record WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT,
    deliverable_type : Win32cr::System::Hypervisor::WHV_X64_PENDING_INTERRUPTION_TYPE

  @[Extern]
  record WHV_X64_APIC_EOI_CONTEXT,
    interrupt_vector : UInt32

  @[Extern(union: true)]
  record WHV_X64_RDTSC_INFO,
    anonymous : Anonymous_e__Struct,
    as_uint64 : UInt64 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt64

  end

  @[Extern]
  record WHV_X64_RDTSC_CONTEXT,
    tsc_aux : UInt64,
    virtual_offset : UInt64,
    tsc : UInt64,
    reference_time : UInt64,
    rdtsc_info : Win32cr::System::Hypervisor::WHV_X64_RDTSC_INFO

  @[Extern]
  record WHV_X64_APIC_SMI_CONTEXT,
    apic_icr : UInt64

  @[Extern]
  record WHV_HYPERCALL_CONTEXT,
    rax : UInt64,
    rbx : UInt64,
    rcx : UInt64,
    rdx : UInt64,
    r8 : UInt64,
    rsi : UInt64,
    rdi : UInt64,
    reserved0 : UInt64,
    xmm_registers : Win32cr::System::Hypervisor::WHV_UINT128[6],
    reserved1 : UInt64[2]

  @[Extern]
  record WHV_X64_APIC_INIT_SIPI_CONTEXT,
    apic_icr : UInt64

  @[Extern]
  record WHV_X64_APIC_WRITE_CONTEXT,
    type__ : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_TYPE,
    reserved : UInt32,
    write_value : UInt64

  @[Extern]
  record WHV_RUN_VP_EXIT_CONTEXT,
    exit_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_EXIT_REASON,
    reserved : UInt32,
    vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      memory_access : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT,
      io_port_access : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT,
      msr_access : Win32cr::System::Hypervisor::WHV_X64_MSR_ACCESS_CONTEXT,
      cpuid_access : Win32cr::System::Hypervisor::WHV_X64_CPUID_ACCESS_CONTEXT,
      vp_exception : Win32cr::System::Hypervisor::WHV_VP_EXCEPTION_CONTEXT,
      interrupt_window : Win32cr::System::Hypervisor::WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT,
      unsupported_feature : Win32cr::System::Hypervisor::WHV_X64_UNSUPPORTED_FEATURE_CONTEXT,
      cancel_reason : Win32cr::System::Hypervisor::WHV_RUN_VP_CANCELED_CONTEXT,
      apic_eoi : Win32cr::System::Hypervisor::WHV_X64_APIC_EOI_CONTEXT,
      read_tsc : Win32cr::System::Hypervisor::WHV_X64_RDTSC_CONTEXT,
      apic_smi : Win32cr::System::Hypervisor::WHV_X64_APIC_SMI_CONTEXT,
      hypercall : Win32cr::System::Hypervisor::WHV_HYPERCALL_CONTEXT,
      apic_init_sipi : Win32cr::System::Hypervisor::WHV_X64_APIC_INIT_SIPI_CONTEXT,
      apic_write : Win32cr::System::Hypervisor::WHV_X64_APIC_WRITE_CONTEXT,
      synic_sint_deliverable : Win32cr::System::Hypervisor::WHV_SYNIC_SINT_DELIVERABLE_CONTEXT

  end

  @[Extern]
  record WHV_INTERRUPT_CONTROL,
    _bitfield : UInt64,
    destination : UInt32,
    vector : UInt32

  @[Extern]
  record WHV_DOORBELL_MATCH_DATA,
    guest_address : UInt64,
    value : UInt64,
    length : UInt32,
    _bitfield : UInt32

  @[Extern]
  record WHV_PARTITION_MEMORY_COUNTERS,
    mapped4_k_page_count : UInt64,
    mapped2_m_page_count : UInt64,
    mapped1_g_page_count : UInt64

  @[Extern]
  record WHV_PROCESSOR_RUNTIME_COUNTERS,
    total_runtime100ns : UInt64,
    hypervisor_runtime100ns : UInt64

  @[Extern]
  record WHV_PROCESSOR_INTERCEPT_COUNTER,
    count : UInt64,
    time100ns : UInt64

  @[Extern]
  record WHV_PROCESSOR_INTERCEPT_COUNTERS,
    page_invalidations : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    control_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    io_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    halt_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    cpuid_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    msr_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    other_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    pending_interrupts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    emulated_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    debug_register_accesses : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    nested_page_fault_intercepts : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    hypercalls : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER,
    rdpmc_instructions : Win32cr::System::Hypervisor::WHV_PROCESSOR_INTERCEPT_COUNTER

  @[Extern]
  record WHV_PROCESSOR_EVENT_COUNTERS,
    page_fault_count : UInt64,
    exception_count : UInt64,
    interrupt_count : UInt64

  @[Extern]
  record WHV_PROCESSOR_APIC_COUNTERS,
    mmio_access_count : UInt64,
    eoi_access_count : UInt64,
    tpr_access_count : UInt64,
    sent_ipi_count : UInt64,
    self_ipi_count : UInt64

  @[Extern]
  record WHV_PROCESSOR_SYNTHETIC_FEATURES_COUNTERS,
    synthetic_interrupts_count : UInt64,
    long_spin_wait_hypercalls_count : UInt64,
    other_hypercalls_count : UInt64,
    synthetic_interrupt_hypercalls_count : UInt64,
    virtual_interrupt_hypercalls_count : UInt64,
    virtual_mmu_hypercalls_count : UInt64

  @[Extern]
  record WHV_SYNIC_EVENT_PARAMETERS,
    vp_index : UInt32,
    target_sint : UInt8,
    reserved : UInt8,
    flag_number : UInt16

  @[Extern]
  record WHV_SRIOV_RESOURCE_DESCRIPTOR,
    pnp_instance_id : UInt16[200],
    virtual_function_id : Win32cr::Foundation::LUID,
    virtual_function_index : UInt16,
    reserved : UInt16

  @[Extern]
  record WHV_VPCI_DEVICE_NOTIFICATION,
    notification_type : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION_TYPE,
    reserved1 : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      reserved2 : UInt64

  end

  @[Extern]
  record WHV_VPCI_HARDWARE_IDS,
    vendor_id : UInt16,
    device_id : UInt16,
    revision_id : UInt8,
    prog_if : UInt8,
    sub_class : UInt8,
    base_class : UInt8,
    sub_vendor_id : UInt16,
    sub_system_id : UInt16

  @[Extern]
  record WHV_VPCI_PROBED_BARS,
    value : UInt32[6]

  @[Extern]
  record WHV_VPCI_MMIO_MAPPING,
    location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE,
    flags : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_RANGE_FLAGS,
    size_in_bytes : UInt64,
    offset_in_bytes : UInt64,
    virtual_address : Void*

  @[Extern]
  record WHV_VPCI_DEVICE_REGISTER,
    location : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER_SPACE,
    size_in_bytes : UInt32,
    offset_in_bytes : UInt64

  @[Extern]
  record WHV_VPCI_INTERRUPT_TARGET,
    vector : UInt32,
    flags : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET_FLAGS,
    processor_count : UInt32,
    processors : UInt32*

  @[Extern]
  record WHV_TRIGGER_PARAMETERS,
    trigger_type : Win32cr::System::Hypervisor::WHV_TRIGGER_TYPE,
    reserved : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL,
      synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS,
      device_interrupt : DeviceInterrupt_e__Struct do

      # Nested Type DeviceInterrupt_e__Struct
      @[Extern]
      record DeviceInterrupt_e__Struct,
        logical_device_id : UInt64,
        msi_address : UInt64,
        msi_data : UInt32,
        reserved : UInt32

    end

  end

  @[Extern]
  record WHV_VIRTUAL_PROCESSOR_PROPERTY,
    property_code : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE,
    reserved : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      numa_node : UInt16,
      padding : UInt64

  end

  @[Extern]
  record WHV_NOTIFICATION_PORT_PARAMETERS,
    notification_port_type : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_TYPE,
    reserved : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      doorbell : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA,
      event : Event_e__Struct do

      # Nested Type Event_e__Struct
      @[Extern]
      record Event_e__Struct,
        connection_id : UInt32

    end

  end

  @[Extern(union: true)]
  record WHV_EMULATOR_STATUS,
    anonymous : Anonymous_e__Struct,
    as_uint32 : UInt32 do

    # Nested Type Anonymous_e__Struct
    @[Extern]
    record Anonymous_e__Struct,
      _bitfield : UInt32

  end

  @[Extern]
  record WHV_EMULATOR_MEMORY_ACCESS_INFO,
    gpa_address : UInt64,
    direction : UInt8,
    access_size : UInt8,
    data : UInt8[8]

  @[Extern]
  record WHV_EMULATOR_IO_ACCESS_INFO,
    direction : UInt8,
    port : UInt16,
    access_size : UInt16,
    data : UInt32

  @[Extern]
  record WHV_EMULATOR_CALLBACKS,
    size : UInt32,
    reserved : UInt32,
    w_hv_emulator_io_port_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_IO_PORT_CALLBACK,
    w_hv_emulator_memory_callback : Win32cr::System::Hypervisor::WHV_EMULATOR_MEMORY_CALLBACK,
    w_hv_emulator_get_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK,
    w_hv_emulator_set_virtual_processor_registers : Win32cr::System::Hypervisor::WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK,
    w_hv_emulator_translate_gva_page : Win32cr::System::Hypervisor::WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK

  @[Extern]
  record SOCKADDR_HV,
    family : UInt16,
    reserved : UInt16,
    vm_id : LibC::GUID,
    service_id : LibC::GUID

  @[Extern]
  record HVSOCKET_ADDRESS_INFO,
    system_id : LibC::GUID,
    virtual_machine_id : LibC::GUID,
    silo_id : LibC::GUID,
    flags : UInt32

  @[Extern]
  record VM_GENCOUNTER,
    generation_count : UInt64,
    generation_count_high : UInt64

  @[Extern]
  record HDV_PCI_PNP_ID,
    vendor_id : UInt16,
    device_id : UInt16,
    revision_id : UInt8,
    prog_if : UInt8,
    sub_class : UInt8,
    base_class : UInt8,
    sub_vendor_id : UInt16,
    sub_system_id : UInt16

  @[Extern]
  record HDV_PCI_DEVICE_INTERFACE,
    version : Win32cr::System::Hypervisor::HDV_PCI_INTERFACE_VERSION,
    initialize__ : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_INITIALIZE,
    teardown : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_TEARDOWN,
    set_configuration : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_SET_CONFIGURATION,
    get_details : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_GET_DETAILS,
    start : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_START,
    stop : Win32cr::System::Hypervisor::HDV_PCI_DEVICE_STOP,
    read_config_space : Win32cr::System::Hypervisor::HDV_PCI_READ_CONFIG_SPACE,
    write_config_space : Win32cr::System::Hypervisor::HDV_PCI_WRITE_CONFIG_SPACE,
    read_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_READ_INTERCEPTED_MEMORY,
    write_intercepted_memory : Win32cr::System::Hypervisor::HDV_PCI_WRITE_INTERCEPTED_MEMORY

  @[Extern]
  record GPA_MEMORY_CHUNK,
    guest_physical_start_page_index : UInt64,
    page_count : UInt64

  @[Extern(union: true)]
  record GUEST_OS_INFO,
    as_uint64 : UInt64,
    closed_source : ClosedSource_e__Struct,
    open_source : OpenSource_e__Struct do

    # Nested Type OpenSource_e__Struct
    @[Extern]
    record OpenSource_e__Struct,
      _bitfield : UInt64


    # Nested Type ClosedSource_e__Struct
    @[Extern]
    record ClosedSource_e__Struct,
      _bitfield : UInt64

  end

  @[Extern(union: true)]
  record VIRTUAL_PROCESSOR_REGISTER,
    reg64 : UInt64,
    reg32 : UInt32,
    reg16 : UInt16,
    reg8 : UInt8,
    reg128 : Reg128_e__Struct,
    x64 : X64_e__Union do

    # Nested Type X64_e__Union
    @[Extern(union: true)]
    record X64_e__Union,
      segment : Segment_e__Struct,
      table : Table_e__Struct,
      fp_control_status : FpControlStatus_e__Struct,
      xmm_control_status : XmmControlStatus_e__Struct do

      # Nested Type XmmControlStatus_e__Struct
      @[Extern]
      record XmmControlStatus_e__Struct,
        anonymous : Anonymous_e__Union,
        xmm_status_control : UInt32,
        xmm_status_control_mask : UInt32 do

        # Nested Type Anonymous_e__Union
        @[Extern(union: true)]
        record Anonymous_e__Union,
          last_fp_rdp : UInt64,
          anonymous : Anonymous_e__Struct do

          # Nested Type Anonymous_e__Struct
          @[Extern]
          record Anonymous_e__Struct,
            last_fp_dp : UInt32,
            last_fp_ds : UInt16

        end

      end


      # Nested Type FpControlStatus_e__Struct
      @[Extern]
      record FpControlStatus_e__Struct,
        fp_control : UInt16,
        fp_status : UInt16,
        fp_tag : UInt8,
        reserved : UInt8,
        last_fp_op : UInt16,
        anonymous : Anonymous_e__Union do

        # Nested Type Anonymous_e__Union
        @[Extern(union: true)]
        record Anonymous_e__Union,
          last_fp_rip : UInt64,
          anonymous : Anonymous_e__Struct do

          # Nested Type Anonymous_e__Struct
          @[Extern]
          record Anonymous_e__Struct,
            last_fp_eip : UInt32,
            last_fp_cs : UInt16

        end

      end


      # Nested Type Segment_e__Struct
      @[Extern]
      record Segment_e__Struct,
        base : UInt64,
        limit : UInt32,
        selector : UInt16,
        anonymous : Anonymous_e__Union do

        # Nested Type Anonymous_e__Union
        @[Extern(union: true)]
        record Anonymous_e__Union,
          attributes : UInt16,
          anonymous : Anonymous_e__Struct do

          # Nested Type Anonymous_e__Struct
          @[Extern]
          record Anonymous_e__Struct,
            _bitfield : UInt16

        end

      end


      # Nested Type Table_e__Struct
      @[Extern]
      record Table_e__Struct,
        limit : UInt16,
        base : UInt64

    end


    # Nested Type Reg128_e__Struct
    @[Extern]
    record Reg128_e__Struct,
      low64 : UInt64,
      high64 : UInt64

  end

  @[Extern]
  record DOS_IMAGE_INFO,
    pdb_name : Win32cr::Foundation::PSTR,
    image_base_address : UInt64,
    image_size : UInt32,
    timestamp : UInt32

  @[Extern]
  record MODULE_INFO,
    process_image_name : Win32cr::Foundation::PSTR,
    image : Win32cr::System::Hypervisor::DOS_IMAGE_INFO

  @[Link("winhvplatform")]
  @[Link("winhvemulation")]
  @[Link("vmdevicehost")]
  @[Link("vmsavedstatedumpprovider")]
  lib C
    fun WHvGetCapability(capability_code : Win32cr::System::Hypervisor::WHV_CAPABILITY_CODE, capability_buffer : Void*, capability_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvCreatePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT

    fun WHvSetupPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvResetPartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvDeletePartition(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvGetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvSetPartitionProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, property_code : Win32cr::System::Hypervisor::WHV_PARTITION_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvSuspendPartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvResumePartitionTime(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvMapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT

    fun WHvMapGpaRange2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, process : Win32cr::Foundation::HANDLE, source_address : Void*, guest_address : UInt64, size_in_bytes : UInt64, flags : Win32cr::System::Hypervisor::WHV_MAP_GPA_RANGE_FLAGS) : Win32cr::Foundation::HRESULT

    fun WHvUnmapGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, size_in_bytes : UInt64) : Win32cr::Foundation::HRESULT

    fun WHvTranslateGva(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, gva : UInt64, translate_flags : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_FLAGS, translation_result : Win32cr::System::Hypervisor::WHV_TRANSLATE_GVA_RESULT*, gpa : UInt64*) : Win32cr::Foundation::HRESULT

    fun WHvCreateVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvCreateVirtualProcessor2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, properties : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_PROPERTY*, property_count : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvDeleteVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, exit_context : Void*, exit_context_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvCancelRunVirtualProcessor(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, flags : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT

    fun WHvSetVirtualProcessorRegisters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, register_names : Win32cr::System::Hypervisor::WHV_REGISTER_NAME*, register_count : UInt32, register_values : Win32cr::System::Hypervisor::WHV_REGISTER_VALUE*) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvSetVirtualProcessorInterruptControllerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvRequestInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, interrupt : Win32cr::System::Hypervisor::WHV_INTERRUPT_CONTROL*, interrupt_control_size : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvSetVirtualProcessorXsaveState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvQueryGpaRangeDirtyBitmap(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, guest_address : UInt64, range_size_in_bytes : UInt64, bitmap : UInt64*, bitmap_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvGetPartitionCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, counter_set : Win32cr::System::Hypervisor::WHV_PARTITION_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorCounters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, counter_set : Win32cr::System::Hypervisor::WHV_PROCESSOR_COUNTER_SET, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32, written_size : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvSetVirtualProcessorInterruptControllerState2(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state : Void*, state_size : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvRegisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*, event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvUnregisterPartitionDoorbellEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, match_data : Win32cr::System::Hypervisor::WHV_DOORBELL_MATCH_DATA*) : Win32cr::Foundation::HRESULT

    fun WHvAdviseGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, gpa_ranges : Win32cr::System::Hypervisor::WHV_MEMORY_RANGE_ENTRY*, gpa_ranges_count : UInt32, advice : Win32cr::System::Hypervisor::WHV_ADVISE_GPA_RANGE_CODE, advice_buffer : Void*, advice_buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvReadGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvWriteGpaRange(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, guest_address : UInt64, controls : Win32cr::System::Hypervisor::WHV_ACCESS_GPA_CONTROLS, data : Void*, data_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvSignalVirtualProcessorSynicEvent(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, synic_event : Win32cr::System::Hypervisor::WHV_SYNIC_EVENT_PARAMETERS, newly_signaled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvSetVirtualProcessorState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, state_type : Win32cr::System::Hypervisor::WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffer_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvAllocateVpciResource(provider_id : LibC::GUID*, flags : Win32cr::System::Hypervisor::WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, resource_descriptor : Void*, resource_descriptor_size_in_bytes : UInt32, vpci_resource : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WHvCreateVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, vpci_resource : Win32cr::Foundation::HANDLE, flags : Win32cr::System::Hypervisor::WHV_CREATE_VPCI_DEVICE_FLAGS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvDeleteVpciDevice(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT

    fun WHvGetVpciDeviceProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, property_code : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_PROPERTY_CODE, property_buffer : Void*, property_buffer_size_in_bytes : UInt32, written_size_in_bytes : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvGetVpciDeviceNotification(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, notification : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_NOTIFICATION*, notification_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvMapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, mapping_count : UInt32*, mappings : Win32cr::System::Hypervisor::WHV_VPCI_MMIO_MAPPING**) : Win32cr::Foundation::HRESULT

    fun WHvUnmapVpciDeviceMmioRanges(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64) : Win32cr::Foundation::HRESULT

    fun WHvSetVpciDevicePowerState(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, power_state : Win32cr::System::Power::DEVICE_POWER_STATE) : Win32cr::Foundation::HRESULT

    fun WHvReadVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT

    fun WHvWriteVpciDeviceRegister(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, register : Win32cr::System::Hypervisor::WHV_VPCI_DEVICE_REGISTER*, data : Void*) : Win32cr::Foundation::HRESULT

    fun WHvMapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, message_count : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, msi_address : UInt64*, msi_data : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvUnmapVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvRetargetVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*) : Win32cr::Foundation::HRESULT

    fun WHvRequestVpciDeviceInterrupt(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, msi_address : UInt64, msi_data : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvGetVpciDeviceInterruptTarget(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, logical_device_id : UInt64, index : UInt32, multi_message_number : UInt32, target : Win32cr::System::Hypervisor::WHV_VPCI_INTERRUPT_TARGET*, target_size_in_bytes : UInt32, bytes_written : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvCreateTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void**, event_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WHvUpdateTriggerParameters(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_TRIGGER_PARAMETERS*, trigger_handle : Void*) : Win32cr::Foundation::HRESULT

    fun WHvDeleteTrigger(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, trigger_handle : Void*) : Win32cr::Foundation::HRESULT

    fun WHvCreateNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, parameters : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PARAMETERS*, event_handle : Win32cr::Foundation::HANDLE, port_handle : Void**) : Win32cr::Foundation::HRESULT

    fun WHvSetNotificationPortProperty(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*, property_code : Win32cr::System::Hypervisor::WHV_NOTIFICATION_PORT_PROPERTY_CODE, property_value : UInt64) : Win32cr::Foundation::HRESULT

    fun WHvDeleteNotificationPort(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, port_handle : Void*) : Win32cr::Foundation::HRESULT

    fun WHvPostVirtualProcessorSynicMessage(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, sint_index : UInt32, message : Void*, message_size_in_bytes : UInt32) : Win32cr::Foundation::HRESULT

    fun WHvGetVirtualProcessorCpuidOutput(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, vp_index : UInt32, eax : UInt32, ecx : UInt32, cpuid_output : Win32cr::System::Hypervisor::WHV_CPUID_OUTPUT*) : Win32cr::Foundation::HRESULT

    fun WHvGetInterruptTargetVpSet(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, destination : UInt64, destination_mode : Win32cr::System::Hypervisor::WHV_INTERRUPT_DESTINATION_MODE, target_vps : UInt32*, vp_count : UInt32, target_vp_count : UInt32*) : Win32cr::Foundation::HRESULT

    fun WHvStartPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE, migration_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun WHvCancelPartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvCompletePartitionMigration(partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE) : Win32cr::Foundation::HRESULT

    fun WHvAcceptPartitionMigration(migration_handle : Win32cr::Foundation::HANDLE, partition : Win32cr::System::Hypervisor::WHV_PARTITION_HANDLE*) : Win32cr::Foundation::HRESULT

    fun WHvEmulatorCreateEmulator(callbacks : Win32cr::System::Hypervisor::WHV_EMULATOR_CALLBACKS*, emulator : Void**) : Win32cr::Foundation::HRESULT

    fun WHvEmulatorDestroyEmulator(emulator : Void*) : Win32cr::Foundation::HRESULT

    fun WHvEmulatorTryIoEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT*, io_instruction_context : Win32cr::System::Hypervisor::WHV_X64_IO_PORT_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT

    fun WHvEmulatorTryMmioEmulation(emulator : Void*, context : Void*, vp_context : Win32cr::System::Hypervisor::WHV_VP_EXIT_CONTEXT*, mmio_instruction_context : Win32cr::System::Hypervisor::WHV_MEMORY_ACCESS_CONTEXT*, emulator_return_status : Win32cr::System::Hypervisor::WHV_EMULATOR_STATUS*) : Win32cr::Foundation::HRESULT

    fun HdvInitializeDeviceHost(computeSystem : Win32cr::System::HostComputeSystem::HCS_SYSTEM, deviceHostHandle : Void**) : Win32cr::Foundation::HRESULT

    fun HdvTeardownDeviceHost(deviceHostHandle : Void*) : Win32cr::Foundation::HRESULT

    fun HdvCreateDeviceInstance(deviceHostHandle : Void*, deviceType : Win32cr::System::Hypervisor::HDV_DEVICE_TYPE, deviceClassId : LibC::GUID*, deviceInstanceId : LibC::GUID*, deviceInterface : Void*, deviceContext : Void*, deviceHandle : Void**) : Win32cr::Foundation::HRESULT

    fun HdvReadGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT

    fun HdvWriteGuestMemory(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, buffer : UInt8*) : Win32cr::Foundation::HRESULT

    fun HdvCreateGuestMemoryAperture(requestor : Void*, guestPhysicalAddress : UInt64, byteCount : UInt32, writeProtected : Win32cr::Foundation::BOOL, mappedAddress : Void**) : Win32cr::Foundation::HRESULT

    fun HdvDestroyGuestMemoryAperture(requestor : Void*, mappedAddress : Void*) : Win32cr::Foundation::HRESULT

    fun HdvDeliverGuestInterrupt(requestor : Void*, msiAddress : UInt64, msiData : UInt32) : Win32cr::Foundation::HRESULT

    fun HdvRegisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64, doorbell_event : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun HdvUnregisterDoorbell(requestor : Void*, bar_index : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, bar_offset : UInt64, trigger_value : UInt64, flags : UInt64) : Win32cr::Foundation::HRESULT

    fun HdvCreateSectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64, lengthInPages : UInt64, mapping_flags : Win32cr::System::Hypervisor::HDV_MMIO_MAPPING_FLAGS, sectionHandle : Win32cr::Foundation::HANDLE, sectionOffsetInPages : UInt64) : Win32cr::Foundation::HRESULT

    fun HdvDestroySectionBackedMmioRange(requestor : Void*, barIndex : Win32cr::System::Hypervisor::HDV_PCI_BAR_SELECTOR, offsetInPages : UInt64) : Win32cr::Foundation::HRESULT

    fun LocateSavedStateFiles(vmName : Win32cr::Foundation::PWSTR, snapshotName : Win32cr::Foundation::PWSTR, binPath : Win32cr::Foundation::PWSTR*, vsvPath : Win32cr::Foundation::PWSTR*, vmrsPath : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun LoadSavedStateFile(vmrsFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT

    fun ApplyPendingSavedStateFileReplayLog(vmrsFile : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun LoadSavedStateFiles(binFile : Win32cr::Foundation::PWSTR, vsvFile : Win32cr::Foundation::PWSTR, vmSavedStateDumpHandle : Void**) : Win32cr::Foundation::HRESULT

    fun ReleaseSavedStateFiles(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT

    fun GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT

    fun GetGuestOsInfo(vmSavedStateDumpHandle : Void*, virtualTrustLevel : UInt8, guestOsInfo : Win32cr::System::Hypervisor::GUEST_OS_INFO*) : Win32cr::Foundation::HRESULT

    fun GetVpCount(vmSavedStateDumpHandle : Void*, vpCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun GetArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH*) : Win32cr::Foundation::HRESULT

    fun ForceArchitecture(vmSavedStateDumpHandle : Void*, vpId : UInt32, architecture : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_ARCH) : Win32cr::Foundation::HRESULT

    fun GetActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8*) : Win32cr::Foundation::HRESULT

    fun GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevels : UInt32*) : Win32cr::Foundation::HRESULT

    fun ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualTrustLevel : UInt8) : Win32cr::Foundation::HRESULT

    fun IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle : Void*, vpId : UInt32, activeVirtualTrustLevelEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun IsNestedVirtualizationEnabled(vmSavedStateDumpHandle : Void*, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun GetNestedVirtualizationMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, enabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun ForceNestedHostMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, hostMode : Win32cr::Foundation::BOOL, oldMode : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun InKernelSpace(vmSavedStateDumpHandle : Void*, vpId : UInt32, inKernelSpace : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun GetRegisterValue(vmSavedStateDumpHandle : Void*, vpId : UInt32, registerId : UInt32, registerValue : Win32cr::System::Hypervisor::VIRTUAL_PROCESSOR_REGISTER*) : Win32cr::Foundation::HRESULT

    fun GetPagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE*) : Win32cr::Foundation::HRESULT

    fun ForcePagingMode(vmSavedStateDumpHandle : Void*, vpId : UInt32, pagingMode : Win32cr::System::Hypervisor::PAGING_MODE) : Win32cr::Foundation::HRESULT

    fun ReadGuestPhysicalAddress(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT

    fun GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, physicalAddress : UInt64*, unmappedRegionSize : UInt64*) : Win32cr::Foundation::HRESULT

    fun GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle : Void*, memoryChunkPageSize : UInt64*, memoryChunks : Win32cr::System::Hypervisor::GPA_MEMORY_CHUNK*, memoryChunkCount : UInt64*) : Win32cr::Foundation::HRESULT

    fun GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle : Void*, physicalAddress : UInt64, rawSavedMemoryOffset : UInt64*) : Win32cr::Foundation::HRESULT

    fun ReadGuestRawSavedMemory(vmSavedStateDumpHandle : Void*, rawSavedMemoryOffset : UInt64, buffer : Void*, bufferSize : UInt32, bytesRead : UInt32*) : Win32cr::Foundation::HRESULT

    fun GetGuestRawSavedMemorySize(vmSavedStateDumpHandle : Void*, guestRawSavedMemorySize : UInt64*) : Win32cr::Foundation::HRESULT

    fun SetMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64) : Win32cr::Foundation::HRESULT

    fun GetMemoryBlockCacheLimit(vmSavedStateDumpHandle : Void*, memoryBlockCacheLimit : UInt64*) : Win32cr::Foundation::HRESULT

    fun ApplyGuestMemoryFix(vmSavedStateDumpHandle : Void*, vpId : UInt32, virtualAddress : UInt64, fixBuffer : Void*, fixBufferSize : UInt32) : Win32cr::Foundation::HRESULT

    fun LoadSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*, userSymbols : Win32cr::Foundation::PWSTR, force : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HRESULT

    fun GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle : Void*) : Win32cr::Foundation::HANDLE

    fun SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle : Void*, callback : Win32cr::System::Hypervisor::GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) : Win32cr::Foundation::HRESULT

    fun LoadSavedStateModuleSymbols(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT

    fun LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle : Void*, imageName : Win32cr::Foundation::PSTR, imageTimestamp : UInt32, moduleName : Win32cr::Foundation::PSTR, baseAddress : UInt64, sizeOfBase : UInt32) : Win32cr::Foundation::HRESULT

    fun ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, virtualAddress : UInt64*, size : UInt32*) : Win32cr::Foundation::HRESULT

    fun ReadSavedStateGlobalVariable(vmSavedStateDumpHandle : Void*, vpId : UInt32, globalName : Win32cr::Foundation::PSTR, buffer : Void*, bufferSize : UInt32) : Win32cr::Foundation::HRESULT

    fun GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, size : UInt32*) : Win32cr::Foundation::HRESULT

    fun FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, fieldName : Win32cr::Foundation::PWSTR, offset : UInt32*, found : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle : Void*, vpId : UInt32, typeName : Win32cr::Foundation::PSTR, typeFieldInfoMap : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun ScanMemoryForDosImages(vmSavedStateDumpHandle : Void*, vpId : UInt32, startAddress : UInt64, endAddress : UInt64, callbackContext : Void*, foundImageCallback : Win32cr::System::Hypervisor::FOUND_IMAGE_CALLBACK, standaloneAddress : UInt64*, standaloneAddressCount : UInt32) : Win32cr::Foundation::HRESULT

    fun CallStackUnwind(vmSavedStateDumpHandle : Void*, vpId : UInt32, imageInfo : Win32cr::System::Hypervisor::MODULE_INFO*, imageInfoCount : UInt32, frameCount : UInt32, callStack : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

  end
end