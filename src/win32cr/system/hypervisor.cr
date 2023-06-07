require "../foundation.cr"
require "../system/power.cr"
require "../system/hostcomputesystem.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:winhvplatform.dll")]
@[Link(ldflags: "/DELAYLOAD:winhvemulation.dll")]
@[Link(ldflags: "/DELAYLOAD:vmdevicehost.dll")]
@[Link(ldflags: "/DELAYLOAD:vmsavedstatedumpprovider.dll")]
{% else %}
@[Link("winhvplatform")]
@[Link("winhvemulation")]
@[Link("vmdevicehost")]
@[Link("vmsavedstatedumpprovider")]
{% end %}
lib LibWin32
  alias WHV_PARTITION_HANDLE = LibC::IntPtrT

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

  alias WHV_EMULATOR_IO_PORT_CALLBACK = Proc(Void*, WHV_EMULATOR_IO_ACCESS_INFO*, HRESULT)
  alias WHV_EMULATOR_MEMORY_CALLBACK = Proc(Void*, WHV_EMULATOR_MEMORY_ACCESS_INFO*, HRESULT)
  alias WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, WHV_REGISTER_NAME*, UInt32, WHV_REGISTER_VALUE*, HRESULT)
  alias WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = Proc(Void*, WHV_REGISTER_NAME*, UInt32, WHV_REGISTER_VALUE*, HRESULT)
  alias WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK = Proc(Void*, UInt64, WHV_TRANSLATE_GVA_FLAGS, WHV_TRANSLATE_GVA_RESULT_CODE*, UInt64*, HRESULT)
  alias HDV_PCI_DEVICE_INITIALIZE = Proc(Void*, HRESULT)
  alias HDV_PCI_DEVICE_TEARDOWN = Proc(Void*, Void)
  alias HDV_PCI_DEVICE_SET_CONFIGURATION = Proc(Void*, UInt32, LibC::LPWSTR*, HRESULT)
  alias HDV_PCI_DEVICE_GET_DETAILS = Proc(Void*, HDV_PCI_PNP_ID*, UInt32, UInt32*, HRESULT)
  alias HDV_PCI_DEVICE_START = Proc(Void*, HRESULT)
  alias HDV_PCI_DEVICE_STOP = Proc(Void*, Void)
  alias HDV_PCI_READ_CONFIG_SPACE = Proc(Void*, UInt32, UInt32*, HRESULT)
  alias HDV_PCI_WRITE_CONFIG_SPACE = Proc(Void*, UInt32, UInt32, HRESULT)
  alias HDV_PCI_READ_INTERCEPTED_MEMORY = Proc(Void*, HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, HRESULT)
  alias HDV_PCI_WRITE_INTERCEPTED_MEMORY = Proc(Void*, HDV_PCI_BAR_SELECTOR, UInt64, UInt64, UInt8*, HRESULT)
  alias GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK = Proc(PSTR, Void)
  alias FOUND_IMAGE_CALLBACK = Proc(Void*, DOS_IMAGE_INFO*, LibC::BOOL)


  enum WHV_CAPABILITY_CODE : Int32
    WHvCapabilityCodeHypervisorPresent = 0
    WHvCapabilityCodeFeatures = 1
    WHvCapabilityCodeExtendedVmExits = 2
    WHvCapabilityCodeExceptionExitBitmap = 3
    WHvCapabilityCodeX64MsrExitBitmap = 4
    WHvCapabilityCodeGpaRangePopulateFlags = 5
    WHvCapabilityCodeSchedulerFeatures = 6
    WHvCapabilityCodeProcessorVendor = 4096
    WHvCapabilityCodeProcessorFeatures = 4097
    WHvCapabilityCodeProcessorClFlushSize = 4098
    WHvCapabilityCodeProcessorXsaveFeatures = 4099
    WHvCapabilityCodeProcessorClockFrequency = 4100
    WHvCapabilityCodeInterruptClockFrequency = 4101
    WHvCapabilityCodeProcessorFeaturesBanks = 4102
    WHvCapabilityCodeProcessorFrequencyCap = 4103
    WHvCapabilityCodeSyntheticProcessorFeaturesBanks = 4104
    WHvCapabilityCodeProcessorPerfmonFeatures = 4105
  end

  enum WHV_PROCESSOR_VENDOR : Int32
    WHvProcessorVendorAmd = 0
    WHvProcessorVendorIntel = 1
    WHvProcessorVendorHygon = 2
  end

  enum WHV_PARTITION_PROPERTY_CODE : Int32
    WHvPartitionPropertyCodeExtendedVmExits = 1
    WHvPartitionPropertyCodeExceptionExitBitmap = 2
    WHvPartitionPropertyCodeSeparateSecurityDomain = 3
    WHvPartitionPropertyCodeNestedVirtualization = 4
    WHvPartitionPropertyCodeX64MsrExitBitmap = 5
    WHvPartitionPropertyCodePrimaryNumaNode = 6
    WHvPartitionPropertyCodeCpuReserve = 7
    WHvPartitionPropertyCodeCpuCap = 8
    WHvPartitionPropertyCodeCpuWeight = 9
    WHvPartitionPropertyCodeCpuGroupId = 10
    WHvPartitionPropertyCodeProcessorFrequencyCap = 11
    WHvPartitionPropertyCodeAllowDeviceAssignment = 12
    WHvPartitionPropertyCodeDisableSmt = 13
    WHvPartitionPropertyCodeProcessorFeatures = 4097
    WHvPartitionPropertyCodeProcessorClFlushSize = 4098
    WHvPartitionPropertyCodeCpuidExitList = 4099
    WHvPartitionPropertyCodeCpuidResultList = 4100
    WHvPartitionPropertyCodeLocalApicEmulationMode = 4101
    WHvPartitionPropertyCodeProcessorXsaveFeatures = 4102
    WHvPartitionPropertyCodeProcessorClockFrequency = 4103
    WHvPartitionPropertyCodeInterruptClockFrequency = 4104
    WHvPartitionPropertyCodeApicRemoteReadSupport = 4105
    WHvPartitionPropertyCodeProcessorFeaturesBanks = 4106
    WHvPartitionPropertyCodeReferenceTime = 4107
    WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks = 4108
    WHvPartitionPropertyCodeCpuidResultList2 = 4109
    WHvPartitionPropertyCodeProcessorPerfmonFeatures = 4110
    WHvPartitionPropertyCodeMsrActionList = 4111
    WHvPartitionPropertyCodeUnimplementedMsrAction = 4112
    WHvPartitionPropertyCodeProcessorCount = 8191
  end

  enum WHV_MEMORY_ACCESS_TYPE : Int32
    WHvMemoryAccessRead = 0
    WHvMemoryAccessWrite = 1
    WHvMemoryAccessExecute = 2
  end

  enum WHV_X64_CPUID_RESULT2_FLAGS : UInt32
    WHvX64CpuidResult2FlagSubleafSpecific = 1
    WHvX64CpuidResult2FlagVpSpecific = 2
  end

  enum WHV_MSR_ACTION : Int32
    WHvMsrActionArchitectureDefault = 0
    WHvMsrActionIgnoreWriteReadZero = 1
    WHvMsrActionExit = 2
  end

  enum WHV_EXCEPTION_TYPE : Int32
    WHvX64ExceptionTypeDivideErrorFault = 0
    WHvX64ExceptionTypeDebugTrapOrFault = 1
    WHvX64ExceptionTypeBreakpointTrap = 3
    WHvX64ExceptionTypeOverflowTrap = 4
    WHvX64ExceptionTypeBoundRangeFault = 5
    WHvX64ExceptionTypeInvalidOpcodeFault = 6
    WHvX64ExceptionTypeDeviceNotAvailableFault = 7
    WHvX64ExceptionTypeDoubleFaultAbort = 8
    WHvX64ExceptionTypeInvalidTaskStateSegmentFault = 10
    WHvX64ExceptionTypeSegmentNotPresentFault = 11
    WHvX64ExceptionTypeStackFault = 12
    WHvX64ExceptionTypeGeneralProtectionFault = 13
    WHvX64ExceptionTypePageFault = 14
    WHvX64ExceptionTypeFloatingPointErrorFault = 16
    WHvX64ExceptionTypeAlignmentCheckFault = 17
    WHvX64ExceptionTypeMachineCheckAbort = 18
    WHvX64ExceptionTypeSimdFloatingPointFault = 19
  end

  enum WHV_X64_LOCAL_APIC_EMULATION_MODE : Int32
    WHvX64LocalApicEmulationModeNone = 0
    WHvX64LocalApicEmulationModeXApic = 1
    WHvX64LocalApicEmulationModeX2Apic = 2
  end

  enum WHV_MAP_GPA_RANGE_FLAGS : UInt32
    WHvMapGpaRangeFlagNone = 0
    WHvMapGpaRangeFlagRead = 1
    WHvMapGpaRangeFlagWrite = 2
    WHvMapGpaRangeFlagExecute = 4
    WHvMapGpaRangeFlagTrackDirtyPages = 8
  end

  enum WHV_TRANSLATE_GVA_FLAGS : UInt32
    WHvTranslateGvaFlagNone = 0
    WHvTranslateGvaFlagValidateRead = 1
    WHvTranslateGvaFlagValidateWrite = 2
    WHvTranslateGvaFlagValidateExecute = 4
    WHvTranslateGvaFlagPrivilegeExempt = 8
    WHvTranslateGvaFlagSetPageTableBits = 16
    WHvTranslateGvaFlagEnforceSmap = 256
    WHvTranslateGvaFlagOverrideSmap = 512
  end

  enum WHV_TRANSLATE_GVA_RESULT_CODE : Int32
    WHvTranslateGvaResultSuccess = 0
    WHvTranslateGvaResultPageNotPresent = 1
    WHvTranslateGvaResultPrivilegeViolation = 2
    WHvTranslateGvaResultInvalidPageTableFlags = 3
    WHvTranslateGvaResultGpaUnmapped = 4
    WHvTranslateGvaResultGpaNoReadAccess = 5
    WHvTranslateGvaResultGpaNoWriteAccess = 6
    WHvTranslateGvaResultGpaIllegalOverlayAccess = 7
    WHvTranslateGvaResultIntercept = 8
  end

  enum WHV_CACHE_TYPE : Int32
    WHvCacheTypeUncached = 0
    WHvCacheTypeWriteCombining = 1
    WHvCacheTypeWriteThrough = 4
    WHvCacheTypeWriteProtected = 5
    WHvCacheTypeWriteBack = 6
  end

  enum WHV_REGISTER_NAME : Int32
    WHvX64RegisterRax = 0
    WHvX64RegisterRcx = 1
    WHvX64RegisterRdx = 2
    WHvX64RegisterRbx = 3
    WHvX64RegisterRsp = 4
    WHvX64RegisterRbp = 5
    WHvX64RegisterRsi = 6
    WHvX64RegisterRdi = 7
    WHvX64RegisterR8 = 8
    WHvX64RegisterR9 = 9
    WHvX64RegisterR10 = 10
    WHvX64RegisterR11 = 11
    WHvX64RegisterR12 = 12
    WHvX64RegisterR13 = 13
    WHvX64RegisterR14 = 14
    WHvX64RegisterR15 = 15
    WHvX64RegisterRip = 16
    WHvX64RegisterRflags = 17
    WHvX64RegisterEs = 18
    WHvX64RegisterCs = 19
    WHvX64RegisterSs = 20
    WHvX64RegisterDs = 21
    WHvX64RegisterFs = 22
    WHvX64RegisterGs = 23
    WHvX64RegisterLdtr = 24
    WHvX64RegisterTr = 25
    WHvX64RegisterIdtr = 26
    WHvX64RegisterGdtr = 27
    WHvX64RegisterCr0 = 28
    WHvX64RegisterCr2 = 29
    WHvX64RegisterCr3 = 30
    WHvX64RegisterCr4 = 31
    WHvX64RegisterCr8 = 32
    WHvX64RegisterDr0 = 33
    WHvX64RegisterDr1 = 34
    WHvX64RegisterDr2 = 35
    WHvX64RegisterDr3 = 36
    WHvX64RegisterDr6 = 37
    WHvX64RegisterDr7 = 38
    WHvX64RegisterXCr0 = 39
    WHvX64RegisterVirtualCr0 = 40
    WHvX64RegisterVirtualCr3 = 41
    WHvX64RegisterVirtualCr4 = 42
    WHvX64RegisterVirtualCr8 = 43
    WHvX64RegisterXmm0 = 4096
    WHvX64RegisterXmm1 = 4097
    WHvX64RegisterXmm2 = 4098
    WHvX64RegisterXmm3 = 4099
    WHvX64RegisterXmm4 = 4100
    WHvX64RegisterXmm5 = 4101
    WHvX64RegisterXmm6 = 4102
    WHvX64RegisterXmm7 = 4103
    WHvX64RegisterXmm8 = 4104
    WHvX64RegisterXmm9 = 4105
    WHvX64RegisterXmm10 = 4106
    WHvX64RegisterXmm11 = 4107
    WHvX64RegisterXmm12 = 4108
    WHvX64RegisterXmm13 = 4109
    WHvX64RegisterXmm14 = 4110
    WHvX64RegisterXmm15 = 4111
    WHvX64RegisterFpMmx0 = 4112
    WHvX64RegisterFpMmx1 = 4113
    WHvX64RegisterFpMmx2 = 4114
    WHvX64RegisterFpMmx3 = 4115
    WHvX64RegisterFpMmx4 = 4116
    WHvX64RegisterFpMmx5 = 4117
    WHvX64RegisterFpMmx6 = 4118
    WHvX64RegisterFpMmx7 = 4119
    WHvX64RegisterFpControlStatus = 4120
    WHvX64RegisterXmmControlStatus = 4121
    WHvX64RegisterTsc = 8192
    WHvX64RegisterEfer = 8193
    WHvX64RegisterKernelGsBase = 8194
    WHvX64RegisterApicBase = 8195
    WHvX64RegisterPat = 8196
    WHvX64RegisterSysenterCs = 8197
    WHvX64RegisterSysenterEip = 8198
    WHvX64RegisterSysenterEsp = 8199
    WHvX64RegisterStar = 8200
    WHvX64RegisterLstar = 8201
    WHvX64RegisterCstar = 8202
    WHvX64RegisterSfmask = 8203
    WHvX64RegisterInitialApicId = 8204
    WHvX64RegisterMsrMtrrCap = 8205
    WHvX64RegisterMsrMtrrDefType = 8206
    WHvX64RegisterMsrMtrrPhysBase0 = 8208
    WHvX64RegisterMsrMtrrPhysBase1 = 8209
    WHvX64RegisterMsrMtrrPhysBase2 = 8210
    WHvX64RegisterMsrMtrrPhysBase3 = 8211
    WHvX64RegisterMsrMtrrPhysBase4 = 8212
    WHvX64RegisterMsrMtrrPhysBase5 = 8213
    WHvX64RegisterMsrMtrrPhysBase6 = 8214
    WHvX64RegisterMsrMtrrPhysBase7 = 8215
    WHvX64RegisterMsrMtrrPhysBase8 = 8216
    WHvX64RegisterMsrMtrrPhysBase9 = 8217
    WHvX64RegisterMsrMtrrPhysBaseA = 8218
    WHvX64RegisterMsrMtrrPhysBaseB = 8219
    WHvX64RegisterMsrMtrrPhysBaseC = 8220
    WHvX64RegisterMsrMtrrPhysBaseD = 8221
    WHvX64RegisterMsrMtrrPhysBaseE = 8222
    WHvX64RegisterMsrMtrrPhysBaseF = 8223
    WHvX64RegisterMsrMtrrPhysMask0 = 8256
    WHvX64RegisterMsrMtrrPhysMask1 = 8257
    WHvX64RegisterMsrMtrrPhysMask2 = 8258
    WHvX64RegisterMsrMtrrPhysMask3 = 8259
    WHvX64RegisterMsrMtrrPhysMask4 = 8260
    WHvX64RegisterMsrMtrrPhysMask5 = 8261
    WHvX64RegisterMsrMtrrPhysMask6 = 8262
    WHvX64RegisterMsrMtrrPhysMask7 = 8263
    WHvX64RegisterMsrMtrrPhysMask8 = 8264
    WHvX64RegisterMsrMtrrPhysMask9 = 8265
    WHvX64RegisterMsrMtrrPhysMaskA = 8266
    WHvX64RegisterMsrMtrrPhysMaskB = 8267
    WHvX64RegisterMsrMtrrPhysMaskC = 8268
    WHvX64RegisterMsrMtrrPhysMaskD = 8269
    WHvX64RegisterMsrMtrrPhysMaskE = 8270
    WHvX64RegisterMsrMtrrPhysMaskF = 8271
    WHvX64RegisterMsrMtrrFix64k00000 = 8304
    WHvX64RegisterMsrMtrrFix16k80000 = 8305
    WHvX64RegisterMsrMtrrFix16kA0000 = 8306
    WHvX64RegisterMsrMtrrFix4kC0000 = 8307
    WHvX64RegisterMsrMtrrFix4kC8000 = 8308
    WHvX64RegisterMsrMtrrFix4kD0000 = 8309
    WHvX64RegisterMsrMtrrFix4kD8000 = 8310
    WHvX64RegisterMsrMtrrFix4kE0000 = 8311
    WHvX64RegisterMsrMtrrFix4kE8000 = 8312
    WHvX64RegisterMsrMtrrFix4kF0000 = 8313
    WHvX64RegisterMsrMtrrFix4kF8000 = 8314
    WHvX64RegisterTscAux = 8315
    WHvX64RegisterBndcfgs = 8316
    WHvX64RegisterMCount = 8318
    WHvX64RegisterACount = 8319
    WHvX64RegisterSpecCtrl = 8324
    WHvX64RegisterPredCmd = 8325
    WHvX64RegisterTscVirtualOffset = 8327
    WHvX64RegisterTsxCtrl = 8328
    WHvX64RegisterXss = 8331
    WHvX64RegisterUCet = 8332
    WHvX64RegisterSCet = 8333
    WHvX64RegisterSsp = 8334
    WHvX64RegisterPl0Ssp = 8335
    WHvX64RegisterPl1Ssp = 8336
    WHvX64RegisterPl2Ssp = 8337
    WHvX64RegisterPl3Ssp = 8338
    WHvX64RegisterInterruptSspTableAddr = 8339
    WHvX64RegisterTscDeadline = 8341
    WHvX64RegisterTscAdjust = 8342
    WHvX64RegisterUmwaitControl = 8344
    WHvX64RegisterXfd = 8345
    WHvX64RegisterXfdErr = 8346
    WHvX64RegisterApicId = 12290
    WHvX64RegisterApicVersion = 12291
    WHvX64RegisterApicTpr = 12296
    WHvX64RegisterApicPpr = 12298
    WHvX64RegisterApicEoi = 12299
    WHvX64RegisterApicLdr = 12301
    WHvX64RegisterApicSpurious = 12303
    WHvX64RegisterApicIsr0 = 12304
    WHvX64RegisterApicIsr1 = 12305
    WHvX64RegisterApicIsr2 = 12306
    WHvX64RegisterApicIsr3 = 12307
    WHvX64RegisterApicIsr4 = 12308
    WHvX64RegisterApicIsr5 = 12309
    WHvX64RegisterApicIsr6 = 12310
    WHvX64RegisterApicIsr7 = 12311
    WHvX64RegisterApicTmr0 = 12312
    WHvX64RegisterApicTmr1 = 12313
    WHvX64RegisterApicTmr2 = 12314
    WHvX64RegisterApicTmr3 = 12315
    WHvX64RegisterApicTmr4 = 12316
    WHvX64RegisterApicTmr5 = 12317
    WHvX64RegisterApicTmr6 = 12318
    WHvX64RegisterApicTmr7 = 12319
    WHvX64RegisterApicIrr0 = 12320
    WHvX64RegisterApicIrr1 = 12321
    WHvX64RegisterApicIrr2 = 12322
    WHvX64RegisterApicIrr3 = 12323
    WHvX64RegisterApicIrr4 = 12324
    WHvX64RegisterApicIrr5 = 12325
    WHvX64RegisterApicIrr6 = 12326
    WHvX64RegisterApicIrr7 = 12327
    WHvX64RegisterApicEse = 12328
    WHvX64RegisterApicIcr = 12336
    WHvX64RegisterApicLvtTimer = 12338
    WHvX64RegisterApicLvtThermal = 12339
    WHvX64RegisterApicLvtPerfmon = 12340
    WHvX64RegisterApicLvtLint0 = 12341
    WHvX64RegisterApicLvtLint1 = 12342
    WHvX64RegisterApicLvtError = 12343
    WHvX64RegisterApicInitCount = 12344
    WHvX64RegisterApicCurrentCount = 12345
    WHvX64RegisterApicDivide = 12350
    WHvX64RegisterApicSelfIpi = 12351
    WHvRegisterSint0 = 16384
    WHvRegisterSint1 = 16385
    WHvRegisterSint2 = 16386
    WHvRegisterSint3 = 16387
    WHvRegisterSint4 = 16388
    WHvRegisterSint5 = 16389
    WHvRegisterSint6 = 16390
    WHvRegisterSint7 = 16391
    WHvRegisterSint8 = 16392
    WHvRegisterSint9 = 16393
    WHvRegisterSint10 = 16394
    WHvRegisterSint11 = 16395
    WHvRegisterSint12 = 16396
    WHvRegisterSint13 = 16397
    WHvRegisterSint14 = 16398
    WHvRegisterSint15 = 16399
    WHvRegisterScontrol = 16400
    WHvRegisterSversion = 16401
    WHvRegisterSiefp = 16402
    WHvRegisterSimp = 16403
    WHvRegisterEom = 16404
    WHvRegisterVpRuntime = 20480
    WHvX64RegisterHypercall = 20481
    WHvRegisterGuestOsId = 20482
    WHvRegisterVpAssistPage = 20499
    WHvRegisterReferenceTsc = 20503
    WHvRegisterReferenceTscSequence = 20506
    WHvRegisterPendingInterruption = -2147483648
    WHvRegisterInterruptState = -2147483647
    WHvRegisterPendingEvent = -2147483646
    WHvX64RegisterDeliverabilityNotifications = -2147483644
    WHvRegisterInternalActivityState = -2147483643
    WHvX64RegisterPendingDebugException = -2147483642
  end

  enum WHV_X64_PENDING_EVENT_TYPE : Int32
    WHvX64PendingEventException = 0
    WHvX64PendingEventExtInt = 5
  end

  enum WHV_RUN_VP_EXIT_REASON : Int32
    WHvRunVpExitReasonNone = 0
    WHvRunVpExitReasonMemoryAccess = 1
    WHvRunVpExitReasonX64IoPortAccess = 2
    WHvRunVpExitReasonUnrecoverableException = 4
    WHvRunVpExitReasonInvalidVpRegisterValue = 5
    WHvRunVpExitReasonUnsupportedFeature = 6
    WHvRunVpExitReasonX64InterruptWindow = 7
    WHvRunVpExitReasonX64Halt = 8
    WHvRunVpExitReasonX64ApicEoi = 9
    WHvRunVpExitReasonSynicSintDeliverable = 10
    WHvRunVpExitReasonX64MsrAccess = 4096
    WHvRunVpExitReasonX64Cpuid = 4097
    WHvRunVpExitReasonException = 4098
    WHvRunVpExitReasonX64Rdtsc = 4099
    WHvRunVpExitReasonX64ApicSmiTrap = 4100
    WHvRunVpExitReasonHypercall = 4101
    WHvRunVpExitReasonX64ApicInitSipiTrap = 4102
    WHvRunVpExitReasonX64ApicWriteTrap = 4103
    WHvRunVpExitReasonCanceled = 8193
  end

  enum WHV_X64_UNSUPPORTED_FEATURE_CODE : Int32
    WHvUnsupportedFeatureIntercept = 1
    WHvUnsupportedFeatureTaskSwitchTss = 2
  end

  enum WHV_RUN_VP_CANCEL_REASON : Int32
    WHvRunVpCancelReasonUser = 0
  end

  enum WHV_X64_PENDING_INTERRUPTION_TYPE : Int32
    WHvX64PendingInterrupt = 0
    WHvX64PendingNmi = 2
    WHvX64PendingException = 3
  end

  enum WHV_X64_APIC_WRITE_TYPE : Int32
    WHvX64ApicWriteTypeLdr = 208
    WHvX64ApicWriteTypeDfr = 224
    WHvX64ApicWriteTypeSvr = 240
    WHvX64ApicWriteTypeLint0 = 848
    WHvX64ApicWriteTypeLint1 = 864
  end

  enum WHV_INTERRUPT_TYPE : Int32
    WHvX64InterruptTypeFixed = 0
    WHvX64InterruptTypeLowestPriority = 1
    WHvX64InterruptTypeNmi = 4
    WHvX64InterruptTypeInit = 5
    WHvX64InterruptTypeSipi = 6
    WHvX64InterruptTypeLocalInt1 = 9
  end

  enum WHV_INTERRUPT_DESTINATION_MODE : Int32
    WHvX64InterruptDestinationModePhysical = 0
    WHvX64InterruptDestinationModeLogical = 1
  end

  enum WHV_INTERRUPT_TRIGGER_MODE : Int32
    WHvX64InterruptTriggerModeEdge = 0
    WHvX64InterruptTriggerModeLevel = 1
  end

  enum WHV_PARTITION_COUNTER_SET : Int32
    WHvPartitionCounterSetMemory = 0
  end

  enum WHV_PROCESSOR_COUNTER_SET : Int32
    WHvProcessorCounterSetRuntime = 0
    WHvProcessorCounterSetIntercepts = 1
    WHvProcessorCounterSetEvents = 2
    WHvProcessorCounterSetApic = 3
    WHvProcessorCounterSetSyntheticFeatures = 4
  end

  enum WHV_ADVISE_GPA_RANGE_CODE : Int32
    WHvAdviseGpaRangeCodePopulate = 0
    WHvAdviseGpaRangeCodePin = 1
    WHvAdviseGpaRangeCodeUnpin = 2
  end

  enum WHV_VIRTUAL_PROCESSOR_STATE_TYPE : Int32
    WHvVirtualProcessorStateTypeSynicMessagePage = 0
    WHvVirtualProcessorStateTypeSynicEventFlagPage = 1
    WHvVirtualProcessorStateTypeSynicTimerState = 2
    WHvVirtualProcessorStateTypeInterruptControllerState2 = 4096
    WHvVirtualProcessorStateTypeXsaveState = 4097
  end

  enum WHV_ALLOCATE_VPCI_RESOURCE_FLAGS : UInt32
    WHvAllocateVpciResourceFlagNone = 0
    WHvAllocateVpciResourceFlagAllowDirectP2P = 1
  end

  enum WHV_VPCI_DEVICE_NOTIFICATION_TYPE : Int32
    WHvVpciDeviceNotificationUndefined = 0
    WHvVpciDeviceNotificationMmioRemapping = 1
    WHvVpciDeviceNotificationSurpriseRemoval = 2
  end

  enum WHV_CREATE_VPCI_DEVICE_FLAGS : UInt32
    WHvCreateVpciDeviceFlagNone = 0
    WHvCreateVpciDeviceFlagPhysicallyBacked = 1
    WHvCreateVpciDeviceFlagUseLogicalInterrupts = 2
  end

  enum WHV_VPCI_DEVICE_PROPERTY_CODE : Int32
    WHvVpciDevicePropertyCodeUndefined = 0
    WHvVpciDevicePropertyCodeHardwareIDs = 1
    WHvVpciDevicePropertyCodeProbedBARs = 2
  end

  enum WHV_VPCI_MMIO_RANGE_FLAGS : UInt32
    WHvVpciMmioRangeFlagReadAccess = 1
    WHvVpciMmioRangeFlagWriteAccess = 2
  end

  enum WHV_VPCI_DEVICE_REGISTER_SPACE : Int32
    WHvVpciConfigSpace = -1
    WHvVpciBar0 = 0
    WHvVpciBar1 = 1
    WHvVpciBar2 = 2
    WHvVpciBar3 = 3
    WHvVpciBar4 = 4
    WHvVpciBar5 = 5
  end

  enum WHV_VPCI_INTERRUPT_TARGET_FLAGS : UInt32
    WHvVpciInterruptTargetFlagNone = 0
    WHvVpciInterruptTargetFlagMulticast = 1
  end

  enum WHV_TRIGGER_TYPE : Int32
    WHvTriggerTypeInterrupt = 0
    WHvTriggerTypeSynicEvent = 1
    WHvTriggerTypeDeviceInterrupt = 2
  end

  enum WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE : Int32
    WHvVirtualProcessorPropertyCodeNumaNode = 0
  end

  enum WHV_NOTIFICATION_PORT_TYPE : Int32
    WHvNotificationPortTypeEvent = 2
    WHvNotificationPortTypeDoorbell = 4
  end

  enum WHV_NOTIFICATION_PORT_PROPERTY_CODE : Int32
    WHvNotificationPortPropertyPreferredTargetVp = 1
    WHvNotificationPortPropertyPreferredTargetDuration = 5
  end

  enum HDV_DEVICE_TYPE : Int32
    HdvDeviceTypeUndefined = 0
    HdvDeviceTypePCI = 1
  end

  enum HDV_PCI_BAR_SELECTOR : Int32
    HDV_PCI_BAR0 = 0
    HDV_PCI_BAR1 = 1
    HDV_PCI_BAR2 = 2
    HDV_PCI_BAR3 = 3
    HDV_PCI_BAR4 = 4
    HDV_PCI_BAR5 = 5
  end

  enum HDV_DOORBELL_FLAGS : Int32
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY = 0
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE = 1
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD = 2
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD = 3
    HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD = 4
    HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE = -2147483648
  end

  enum HDV_MMIO_MAPPING_FLAGS : UInt32
    HdvMmioMappingFlagNone = 0
    HdvMmioMappingFlagWriteable = 1
    HdvMmioMappingFlagExecutable = 2
  end

  enum HDV_PCI_INTERFACE_VERSION : Int32
    HdvPciDeviceInterfaceVersionInvalid = 0
    HdvPciDeviceInterfaceVersion1 = 1
  end

  enum PAGING_MODE : Int32
    Paging_Invalid = 0
    Paging_NonPaged = 1
    Paging_32Bit = 2
    Paging_Pae = 3
    Paging_Long = 4
    Paging_Armv8 = 5
  end

  enum VIRTUAL_PROCESSOR_ARCH : Int32
    Arch_Unknown = 0
    Arch_x86 = 1
    Arch_x64 = 2
    Arch_Armv8 = 3
  end

  enum VIRTUAL_PROCESSOR_VENDOR : Int32
    ProcessorVendor_Unknown = 0
    ProcessorVendor_Amd = 1
    ProcessorVendor_Intel = 2
    ProcessorVendor_Hygon = 3
    ProcessorVendor_Arm = 4
  end

  enum GUEST_OS_VENDOR : Int32
    GuestOsVendorUndefined = 0
    GuestOsVendorMicrosoft = 1
    GuestOsVendorHPE = 2
    GuestOsVendorLANCOM = 512
  end

  enum GUEST_OS_MICROSOFT_IDS : Int32
    GuestOsMicrosoftUndefined = 0
    GuestOsMicrosoftMSDOS = 1
    GuestOsMicrosoftWindows3x = 2
    GuestOsMicrosoftWindows9x = 3
    GuestOsMicrosoftWindowsNT = 4
    GuestOsMicrosoftWindowsCE = 5
  end

  enum GUEST_OS_OPENSOURCE_IDS : Int32
    GuestOsOpenSourceUndefined = 0
    GuestOsOpenSourceLinux = 1
    GuestOsOpenSourceFreeBSD = 2
    GuestOsOpenSourceXen = 3
    GuestOsOpenSourceIllumos = 4
  end

  enum REGISTER_ID : Int32
    X64_RegisterRax = 0
    X64_RegisterRcx = 1
    X64_RegisterRdx = 2
    X64_RegisterRbx = 3
    X64_RegisterRsp = 4
    X64_RegisterRbp = 5
    X64_RegisterRsi = 6
    X64_RegisterRdi = 7
    X64_RegisterR8 = 8
    X64_RegisterR9 = 9
    X64_RegisterR10 = 10
    X64_RegisterR11 = 11
    X64_RegisterR12 = 12
    X64_RegisterR13 = 13
    X64_RegisterR14 = 14
    X64_RegisterR15 = 15
    X64_RegisterRip = 16
    X64_RegisterRFlags = 17
    X64_RegisterXmm0 = 18
    X64_RegisterXmm1 = 19
    X64_RegisterXmm2 = 20
    X64_RegisterXmm3 = 21
    X64_RegisterXmm4 = 22
    X64_RegisterXmm5 = 23
    X64_RegisterXmm6 = 24
    X64_RegisterXmm7 = 25
    X64_RegisterXmm8 = 26
    X64_RegisterXmm9 = 27
    X64_RegisterXmm10 = 28
    X64_RegisterXmm11 = 29
    X64_RegisterXmm12 = 30
    X64_RegisterXmm13 = 31
    X64_RegisterXmm14 = 32
    X64_RegisterXmm15 = 33
    X64_RegisterFpMmx0 = 34
    X64_RegisterFpMmx1 = 35
    X64_RegisterFpMmx2 = 36
    X64_RegisterFpMmx3 = 37
    X64_RegisterFpMmx4 = 38
    X64_RegisterFpMmx5 = 39
    X64_RegisterFpMmx6 = 40
    X64_RegisterFpMmx7 = 41
    X64_RegisterFpControlStatus = 42
    X64_RegisterXmmControlStatus = 43
    X64_RegisterCr0 = 44
    X64_RegisterCr2 = 45
    X64_RegisterCr3 = 46
    X64_RegisterCr4 = 47
    X64_RegisterCr8 = 48
    X64_RegisterEfer = 49
    X64_RegisterDr0 = 50
    X64_RegisterDr1 = 51
    X64_RegisterDr2 = 52
    X64_RegisterDr3 = 53
    X64_RegisterDr6 = 54
    X64_RegisterDr7 = 55
    X64_RegisterEs = 56
    X64_RegisterCs = 57
    X64_RegisterSs = 58
    X64_RegisterDs = 59
    X64_RegisterFs = 60
    X64_RegisterGs = 61
    X64_RegisterLdtr = 62
    X64_RegisterTr = 63
    X64_RegisterIdtr = 64
    X64_RegisterGdtr = 65
    X64_RegisterMax = 66
    ARM64_RegisterX0 = 67
    ARM64_RegisterX1 = 68
    ARM64_RegisterX2 = 69
    ARM64_RegisterX3 = 70
    ARM64_RegisterX4 = 71
    ARM64_RegisterX5 = 72
    ARM64_RegisterX6 = 73
    ARM64_RegisterX7 = 74
    ARM64_RegisterX8 = 75
    ARM64_RegisterX9 = 76
    ARM64_RegisterX10 = 77
    ARM64_RegisterX11 = 78
    ARM64_RegisterX12 = 79
    ARM64_RegisterX13 = 80
    ARM64_RegisterX14 = 81
    ARM64_RegisterX15 = 82
    ARM64_RegisterX16 = 83
    ARM64_RegisterX17 = 84
    ARM64_RegisterX18 = 85
    ARM64_RegisterX19 = 86
    ARM64_RegisterX20 = 87
    ARM64_RegisterX21 = 88
    ARM64_RegisterX22 = 89
    ARM64_RegisterX23 = 90
    ARM64_RegisterX24 = 91
    ARM64_RegisterX25 = 92
    ARM64_RegisterX26 = 93
    ARM64_RegisterX27 = 94
    ARM64_RegisterX28 = 95
    ARM64_RegisterXFp = 96
    ARM64_RegisterXLr = 97
    ARM64_RegisterPc = 98
    ARM64_RegisterSpEl0 = 99
    ARM64_RegisterSpEl1 = 100
    ARM64_RegisterCpsr = 101
    ARM64_RegisterQ0 = 102
    ARM64_RegisterQ1 = 103
    ARM64_RegisterQ2 = 104
    ARM64_RegisterQ3 = 105
    ARM64_RegisterQ4 = 106
    ARM64_RegisterQ5 = 107
    ARM64_RegisterQ6 = 108
    ARM64_RegisterQ7 = 109
    ARM64_RegisterQ8 = 110
    ARM64_RegisterQ9 = 111
    ARM64_RegisterQ10 = 112
    ARM64_RegisterQ11 = 113
    ARM64_RegisterQ12 = 114
    ARM64_RegisterQ13 = 115
    ARM64_RegisterQ14 = 116
    ARM64_RegisterQ15 = 117
    ARM64_RegisterQ16 = 118
    ARM64_RegisterQ17 = 119
    ARM64_RegisterQ18 = 120
    ARM64_RegisterQ19 = 121
    ARM64_RegisterQ20 = 122
    ARM64_RegisterQ21 = 123
    ARM64_RegisterQ22 = 124
    ARM64_RegisterQ23 = 125
    ARM64_RegisterQ24 = 126
    ARM64_RegisterQ25 = 127
    ARM64_RegisterQ26 = 128
    ARM64_RegisterQ27 = 129
    ARM64_RegisterQ28 = 130
    ARM64_RegisterQ29 = 131
    ARM64_RegisterQ30 = 132
    ARM64_RegisterQ31 = 133
    ARM64_RegisterFpStatus = 134
    ARM64_RegisterFpControl = 135
    ARM64_RegisterEsrEl1 = 136
    ARM64_RegisterSpsrEl1 = 137
    ARM64_RegisterFarEl1 = 138
    ARM64_RegisterParEl1 = 139
    ARM64_RegisterElrEl1 = 140
    ARM64_RegisterTtbr0El1 = 141
    ARM64_RegisterTtbr1El1 = 142
    ARM64_RegisterVbarEl1 = 143
    ARM64_RegisterSctlrEl1 = 144
    ARM64_RegisterActlrEl1 = 145
    ARM64_RegisterTcrEl1 = 146
    ARM64_RegisterMairEl1 = 147
    ARM64_RegisterAmairEl1 = 148
    ARM64_RegisterTpidrEl0 = 149
    ARM64_RegisterTpidrroEl0 = 150
    ARM64_RegisterTpidrEl1 = 151
    ARM64_RegisterContextIdrEl1 = 152
    ARM64_RegisterCpacrEl1 = 153
    ARM64_RegisterCsselrEl1 = 154
    ARM64_RegisterCntkctlEl1 = 155
    ARM64_RegisterCntvCvalEl0 = 156
    ARM64_RegisterCntvCtlEl0 = 157
    ARM64_RegisterMax = 158
  end

  union WHV_CAPABILITY_FEATURES
    anonymous : WHV_CAPABILITY_FEATURES_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_EXTENDED_VM_EXITS
    anonymous : WHV_EXTENDED_VM_EXITS_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_PROCESSOR_FEATURES
    anonymous : WHV_PROCESSOR_FEATURES_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_PROCESSOR_FEATURES1
    anonymous : WHV_PROCESSOR_FEATURES1_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union
    anonymous : WHV_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union_Anonymous_e__Struct
    as_uint64 : UInt64[2]*
  end
  union WHV_SYNTHETIC_PROCESSOR_FEATURES
    anonymous : WHV_SYNTHETIC_PROCESSOR_FEATURES_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union
    anonymous : WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union_Anonymous_e__Struct
    as_uint64 : UInt64[0]*
  end
  union WHV_PROCESSOR_XSAVE_FEATURES
    anonymous : WHV_PROCESSOR_XSAVE_FEATURES_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_PROCESSOR_PERFMON_FEATURES
    anonymous : WHV_PROCESSOR_PERFMON_FEATURES_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_X64_MSR_EXIT_BITMAP
    as_uint64 : UInt64
    anonymous : WHV_X64_MSR_EXIT_BITMAP_Anonymous_e__Struct
  end
  union WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    as_uint32 : UInt32
    anonymous : WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS_Anonymous_e__Struct
  end
  union WHV_SCHEDULER_FEATURES
    anonymous : WHV_SCHEDULER_FEATURES_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_CAPABILITY
    hypervisor_present : LibC::BOOL
    features : WHV_CAPABILITY_FEATURES
    extended_vm_exits : WHV_EXTENDED_VM_EXITS
    processor_vendor : WHV_PROCESSOR_VENDOR
    processor_features : WHV_PROCESSOR_FEATURES
    synthetic_processor_features_banks : WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    processor_xsave_features : WHV_PROCESSOR_XSAVE_FEATURES
    processor_cl_flush_size : UInt8
    exception_exit_bitmap : UInt64
    x64_msr_exit_bitmap : WHV_X64_MSR_EXIT_BITMAP
    processor_clock_frequency : UInt64
    interrupt_clock_frequency : UInt64
    processor_features_banks : WHV_PROCESSOR_FEATURES_BANKS
    gpa_range_populate_flags : WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    processor_frequency_cap : WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    processor_perfmon_features : WHV_PROCESSOR_PERFMON_FEATURES
    scheduler_features : WHV_SCHEDULER_FEATURES
  end
  union WHV_PARTITION_PROPERTY
    extended_vm_exits : WHV_EXTENDED_VM_EXITS
    processor_features : WHV_PROCESSOR_FEATURES
    synthetic_processor_features_banks : WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    processor_xsave_features : WHV_PROCESSOR_XSAVE_FEATURES
    processor_cl_flush_size : UInt8
    processor_count : UInt32
    cpuid_exit_list : UInt32[0]*
    cpuid_result_list : WHV_X64_CPUID_RESULT[0]*
    cpuid_result_list2 : WHV_X64_CPUID_RESULT2[0]*
    msr_action_list : WHV_MSR_ACTION_ENTRY[0]*
    unimplemented_msr_action : WHV_MSR_ACTION
    exception_exit_bitmap : UInt64
    local_apic_emulation_mode : WHV_X64_LOCAL_APIC_EMULATION_MODE
    separate_security_domain : LibC::BOOL
    nested_virtualization : LibC::BOOL
    x64_msr_exit_bitmap : WHV_X64_MSR_EXIT_BITMAP
    processor_clock_frequency : UInt64
    interrupt_clock_frequency : UInt64
    apic_remote_read : LibC::BOOL
    processor_features_banks : WHV_PROCESSOR_FEATURES_BANKS
    reference_time : UInt64
    primary_numa_node : UInt16
    cpu_reserve : UInt32
    cpu_cap : UInt32
    cpu_weight : UInt32
    cpu_group_id : UInt64
    processor_frequency_cap : UInt32
    allow_device_assignment : LibC::BOOL
    processor_perfmon_features : WHV_PROCESSOR_PERFMON_FEATURES
    disable_smt : LibC::BOOL
  end
  union WHV_ADVISE_GPA_RANGE
    populate : WHV_ADVISE_GPA_RANGE_POPULATE
  end
  union WHV_ACCESS_GPA_CONTROLS
    as_uint64 : UInt64
    anonymous : WHV_ACCESS_GPA_CONTROLS_Anonymous_e__Struct
  end
  union WHV_UINT128
    anonymous : WHV_UINT128_Anonymous_e__Struct
    dword : UInt32[4]*
  end
  union WHV_X64_FP_REGISTER
    anonymous : WHV_X64_FP_REGISTER_Anonymous_e__Struct
    as_uint128 : WHV_UINT128
  end
  union WHV_X64_FP_CONTROL_STATUS_REGISTER
    anonymous : WHV_X64_FP_CONTROL_STATUS_REGISTER_Anonymous_e__Struct
    as_uint128 : WHV_UINT128
  end
  union WHV_X64_FP_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union
    last_fp_rip : UInt64
    anonymous : WHV_X64_FP_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
  end
  union WHV_X64_XMM_CONTROL_STATUS_REGISTER
    anonymous : WHV_X64_XMM_CONTROL_STATUS_REGISTER_Anonymous_e__Struct
    as_uint128 : WHV_UINT128
  end
  union WHV_X64_XMM_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union
    last_fp_rdp : UInt64
    anonymous : WHV_X64_XMM_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
  end
  union WHV_X64_SEGMENT_REGISTER_Anonymous_e__Union
    anonymous : WHV_X64_SEGMENT_REGISTER_Anonymous_e__Union_Anonymous_e__Struct
    attributes : UInt16
  end
  union WHV_X64_INTERRUPT_STATE_REGISTER
    anonymous : WHV_X64_INTERRUPT_STATE_REGISTER_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_X64_PENDING_INTERRUPTION_REGISTER
    anonymous : WHV_X64_PENDING_INTERRUPTION_REGISTER_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER
    anonymous : WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_X64_PENDING_EXCEPTION_EVENT
    anonymous : WHV_X64_PENDING_EXCEPTION_EVENT_Anonymous_e__Struct
    as_uint128 : WHV_UINT128
  end
  union WHV_X64_PENDING_EXT_INT_EVENT
    anonymous : WHV_X64_PENDING_EXT_INT_EVENT_Anonymous_e__Struct
    as_uint128 : WHV_UINT128
  end
  union WHV_INTERNAL_ACTIVITY_REGISTER
    anonymous : WHV_INTERNAL_ACTIVITY_REGISTER_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_X64_PENDING_DEBUG_EXCEPTION
    as_uint64 : UInt64
    anonymous : WHV_X64_PENDING_DEBUG_EXCEPTION_Anonymous_e__Struct
  end
  union WHV_REGISTER_VALUE
    reg128 : WHV_UINT128
    reg64 : UInt64
    reg32 : UInt32
    reg16 : UInt16
    reg8 : UInt8
    fp : WHV_X64_FP_REGISTER
    fp_control_status : WHV_X64_FP_CONTROL_STATUS_REGISTER
    xmm_control_status : WHV_X64_XMM_CONTROL_STATUS_REGISTER
    segment : WHV_X64_SEGMENT_REGISTER
    table : WHV_X64_TABLE_REGISTER
    interrupt_state : WHV_X64_INTERRUPT_STATE_REGISTER
    pending_interruption : WHV_X64_PENDING_INTERRUPTION_REGISTER
    deliverability_notifications : WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER
    exception_event : WHV_X64_PENDING_EXCEPTION_EVENT
    ext_int_event : WHV_X64_PENDING_EXT_INT_EVENT
    internal_activity : WHV_INTERNAL_ACTIVITY_REGISTER
    pending_debug_exception : WHV_X64_PENDING_DEBUG_EXCEPTION
  end
  union WHV_X64_VP_EXECUTION_STATE
    anonymous : WHV_X64_VP_EXECUTION_STATE_Anonymous_e__Struct
    as_uint16 : UInt16
  end
  union WHV_MEMORY_ACCESS_INFO
    anonymous : WHV_MEMORY_ACCESS_INFO_Anonymous_e__Struct
    as_uint32 : UInt32
  end
  union WHV_X64_IO_PORT_ACCESS_INFO
    anonymous : WHV_X64_IO_PORT_ACCESS_INFO_Anonymous_e__Struct
    as_uint32 : UInt32
  end
  union WHV_X64_MSR_ACCESS_INFO
    anonymous : WHV_X64_MSR_ACCESS_INFO_Anonymous_e__Struct
    as_uint32 : UInt32
  end
  union WHV_VP_EXCEPTION_INFO
    anonymous : WHV_VP_EXCEPTION_INFO_Anonymous_e__Struct
    as_uint32 : UInt32
  end
  union WHV_X64_RDTSC_INFO
    anonymous : WHV_X64_RDTSC_INFO_Anonymous_e__Struct
    as_uint64 : UInt64
  end
  union WHV_RUN_VP_EXIT_CONTEXT_Anonymous_e__Union
    memory_access : WHV_MEMORY_ACCESS_CONTEXT
    io_port_access : WHV_X64_IO_PORT_ACCESS_CONTEXT
    msr_access : WHV_X64_MSR_ACCESS_CONTEXT
    cpuid_access : WHV_X64_CPUID_ACCESS_CONTEXT
    vp_exception : WHV_VP_EXCEPTION_CONTEXT
    interrupt_window : WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
    unsupported_feature : WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
    cancel_reason : WHV_RUN_VP_CANCELED_CONTEXT
    apic_eoi : WHV_X64_APIC_EOI_CONTEXT
    read_tsc : WHV_X64_RDTSC_CONTEXT
    apic_smi : WHV_X64_APIC_SMI_CONTEXT
    hypercall : WHV_HYPERCALL_CONTEXT
    apic_init_sipi : WHV_X64_APIC_INIT_SIPI_CONTEXT
    apic_write : WHV_X64_APIC_WRITE_CONTEXT
    synic_sint_deliverable : WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
  end
  union WHV_VPCI_DEVICE_NOTIFICATION_Anonymous_e__Union
    reserved2 : UInt64
  end
  union WHV_TRIGGER_PARAMETERS_Anonymous_e__Union
    interrupt : WHV_INTERRUPT_CONTROL
    synic_event : WHV_SYNIC_EVENT_PARAMETERS
    device_interrupt : WHV_TRIGGER_PARAMETERS_Anonymous_e__Union_DeviceInterrupt_e__Struct
  end
  union WHV_VIRTUAL_PROCESSOR_PROPERTY_Anonymous_e__Union
    numa_node : UInt16
    padding : UInt64
  end
  union WHV_NOTIFICATION_PORT_PARAMETERS_Anonymous_e__Union
    doorbell : WHV_DOORBELL_MATCH_DATA
    event : WHV_NOTIFICATION_PORT_PARAMETERS_Anonymous_e__Union_Event_e__Struct
  end
  union WHV_EMULATOR_STATUS
    anonymous : WHV_EMULATOR_STATUS_Anonymous_e__Struct
    as_uint32 : UInt32
  end
  union GUEST_OS_INFO
    as_uint64 : UInt64
    closed_source : GUEST_OS_INFO_ClosedSource_e__Struct
    open_source : GUEST_OS_INFO_OpenSource_e__Struct
  end
  union VIRTUAL_PROCESSOR_REGISTER
    reg64 : UInt64
    reg32 : UInt32
    reg16 : UInt16
    reg8 : UInt8
    reg128 : VIRTUAL_PROCESSOR_REGISTER_Reg128_e__Struct
    x64 : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union
  end
  union VIRTUAL_PROCESSOR_REGISTER_X64_e__Union
    segment : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Segment_e__Struct
    table : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Table_e__Struct
    fp_control_status : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_FpControlStatus_e__Struct
    xmm_control_status : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_XmmControlStatus_e__Struct
  end
  union VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_XmmControlStatus_e__Struct_Anonymous_e__Union
    last_fp_rdp : UInt64
    anonymous : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_XmmControlStatus_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
  end
  union VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_FpControlStatus_e__Struct_Anonymous_e__Union
    last_fp_rip : UInt64
    anonymous : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_FpControlStatus_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
  end
  union VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Segment_e__Struct_Anonymous_e__Union
    attributes : UInt16
    anonymous : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Segment_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
  end

  struct WHV_CAPABILITY_FEATURES_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_EXTENDED_VM_EXITS_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_PROCESSOR_FEATURES_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_PROCESSOR_FEATURES1_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_PROCESSOR_FEATURES_BANKS
    banks_count : UInt32
    reserved0 : UInt32
    anonymous : WHV_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union
  end
  struct WHV_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union_Anonymous_e__Struct
    bank0 : WHV_PROCESSOR_FEATURES
    bank1 : WHV_PROCESSOR_FEATURES1
  end
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS
    banks_count : UInt32
    reserved0 : UInt32
    anonymous : WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union
  end
  struct WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_Anonymous_e__Union_Anonymous_e__Struct
    bank0 : WHV_SYNTHETIC_PROCESSOR_FEATURES
  end
  struct WHV_PROCESSOR_XSAVE_FEATURES_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_PROCESSOR_PERFMON_FEATURES_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_X64_MSR_EXIT_BITMAP_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_MEMORY_RANGE_ENTRY
    guest_address : UInt64
    size_in_bytes : UInt64
  end
  struct WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WHV_ADVISE_GPA_RANGE_POPULATE
    flags : WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS
    access_type : WHV_MEMORY_ACCESS_TYPE
  end
  struct WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP
    _bitfield : UInt32
    highest_frequency_mhz : UInt32
    nominal_frequency_mhz : UInt32
    lowest_frequency_mhz : UInt32
    frequency_step_mhz : UInt32
  end
  struct WHV_SCHEDULER_FEATURES_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_X64_CPUID_RESULT
    function : UInt32
    reserved : UInt32[3]*
    eax : UInt32
    ebx : UInt32
    ecx : UInt32
    edx : UInt32
  end
  struct WHV_CPUID_OUTPUT
    eax : UInt32
    ebx : UInt32
    ecx : UInt32
    edx : UInt32
  end
  struct WHV_X64_CPUID_RESULT2
    function : UInt32
    index : UInt32
    vp_index : UInt32
    flags : WHV_X64_CPUID_RESULT2_FLAGS
    output : WHV_CPUID_OUTPUT
    mask : WHV_CPUID_OUTPUT
  end
  struct WHV_MSR_ACTION_ENTRY
    index : UInt32
    read_action : UInt8
    write_action : UInt8
    reserved : UInt16
  end
  struct WHV_TRANSLATE_GVA_RESULT
    result_code : WHV_TRANSLATE_GVA_RESULT_CODE
    reserved : UInt32
  end
  struct WHV_ACCESS_GPA_CONTROLS_Anonymous_e__Struct
    cache_type : WHV_CACHE_TYPE
    reserved : UInt32
  end
  struct WHV_UINT128_Anonymous_e__Struct
    low64 : UInt64
    high64 : UInt64
  end
  struct WHV_X64_FP_REGISTER_Anonymous_e__Struct
    mantissa : UInt64
    _bitfield : UInt64
  end
  struct WHV_X64_FP_CONTROL_STATUS_REGISTER_Anonymous_e__Struct
    fp_control : UInt16
    fp_status : UInt16
    fp_tag : UInt8
    reserved : UInt8
    last_fp_op : UInt16
    anonymous : WHV_X64_FP_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union
  end
  struct WHV_X64_FP_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
    last_fp_eip : UInt32
    last_fp_cs : UInt16
    reserved2 : UInt16
  end
  struct WHV_X64_XMM_CONTROL_STATUS_REGISTER_Anonymous_e__Struct
    anonymous : WHV_X64_XMM_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union
    xmm_status_control : UInt32
    xmm_status_control_mask : UInt32
  end
  struct WHV_X64_XMM_CONTROL_STATUS_REGISTER_Anonymous_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
    last_fp_dp : UInt32
    last_fp_ds : UInt16
    reserved : UInt16
  end
  struct WHV_X64_SEGMENT_REGISTER
    base : UInt64
    limit : UInt32
    selector : UInt16
    anonymous : WHV_X64_SEGMENT_REGISTER_Anonymous_e__Union
  end
  struct WHV_X64_SEGMENT_REGISTER_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt16
  end
  struct WHV_X64_TABLE_REGISTER
    pad : UInt16[3]*
    limit : UInt16
    base : UInt64
  end
  struct WHV_X64_INTERRUPT_STATE_REGISTER_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_X64_PENDING_INTERRUPTION_REGISTER_Anonymous_e__Struct
    _bitfield : UInt32
    error_code : UInt32
  end
  struct WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_X64_PENDING_EXCEPTION_EVENT_Anonymous_e__Struct
    _bitfield : UInt32
    error_code : UInt32
    exception_parameter : UInt64
  end
  struct WHV_X64_PENDING_EXT_INT_EVENT_Anonymous_e__Struct
    _bitfield : UInt64
    reserved2 : UInt64
  end
  struct WHV_INTERNAL_ACTIVITY_REGISTER_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_X64_PENDING_DEBUG_EXCEPTION_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_SYNIC_SINT_DELIVERABLE_CONTEXT
    deliverable_sints : UInt16
    reserved1 : UInt16
    reserved2 : UInt32
  end
  struct WHV_X64_VP_EXECUTION_STATE_Anonymous_e__Struct
    _bitfield : UInt16
  end
  struct WHV_VP_EXIT_CONTEXT
    execution_state : WHV_X64_VP_EXECUTION_STATE
    _bitfield : UInt8
    reserved : UInt8
    reserved2 : UInt32
    cs : WHV_X64_SEGMENT_REGISTER
    rip : UInt64
    rflags : UInt64
  end
  struct WHV_MEMORY_ACCESS_INFO_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WHV_MEMORY_ACCESS_CONTEXT
    instruction_byte_count : UInt8
    reserved : UInt8[3]*
    instruction_bytes : UInt8[16]*
    access_info : WHV_MEMORY_ACCESS_INFO
    gpa : UInt64
    gva : UInt64
  end
  struct WHV_X64_IO_PORT_ACCESS_INFO_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WHV_X64_IO_PORT_ACCESS_CONTEXT
    instruction_byte_count : UInt8
    reserved : UInt8[3]*
    instruction_bytes : UInt8[16]*
    access_info : WHV_X64_IO_PORT_ACCESS_INFO
    port_number : UInt16
    reserved2 : UInt16[3]*
    rax : UInt64
    rcx : UInt64
    rsi : UInt64
    rdi : UInt64
    ds : WHV_X64_SEGMENT_REGISTER
    es : WHV_X64_SEGMENT_REGISTER
  end
  struct WHV_X64_MSR_ACCESS_INFO_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WHV_X64_MSR_ACCESS_CONTEXT
    access_info : WHV_X64_MSR_ACCESS_INFO
    msr_number : UInt32
    rax : UInt64
    rdx : UInt64
  end
  struct WHV_X64_CPUID_ACCESS_CONTEXT
    rax : UInt64
    rcx : UInt64
    rdx : UInt64
    rbx : UInt64
    default_result_rax : UInt64
    default_result_rcx : UInt64
    default_result_rdx : UInt64
    default_result_rbx : UInt64
  end
  struct WHV_VP_EXCEPTION_INFO_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WHV_VP_EXCEPTION_CONTEXT
    instruction_byte_count : UInt8
    reserved : UInt8[3]*
    instruction_bytes : UInt8[16]*
    exception_info : WHV_VP_EXCEPTION_INFO
    exception_type : UInt8
    reserved2 : UInt8[3]*
    error_code : UInt32
    exception_parameter : UInt64
  end
  struct WHV_X64_UNSUPPORTED_FEATURE_CONTEXT
    feature_code : WHV_X64_UNSUPPORTED_FEATURE_CODE
    reserved : UInt32
    feature_parameter : UInt64
  end
  struct WHV_RUN_VP_CANCELED_CONTEXT
    cancel_reason : WHV_RUN_VP_CANCEL_REASON
  end
  struct WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT
    deliverable_type : WHV_X64_PENDING_INTERRUPTION_TYPE
  end
  struct WHV_X64_APIC_EOI_CONTEXT
    interrupt_vector : UInt32
  end
  struct WHV_X64_RDTSC_INFO_Anonymous_e__Struct
    _bitfield : UInt64
  end
  struct WHV_X64_RDTSC_CONTEXT
    tsc_aux : UInt64
    virtual_offset : UInt64
    tsc : UInt64
    reference_time : UInt64
    rdtsc_info : WHV_X64_RDTSC_INFO
  end
  struct WHV_X64_APIC_SMI_CONTEXT
    apic_icr : UInt64
  end
  struct WHV_HYPERCALL_CONTEXT
    rax : UInt64
    rbx : UInt64
    rcx : UInt64
    rdx : UInt64
    r8 : UInt64
    rsi : UInt64
    rdi : UInt64
    reserved0 : UInt64
    xmm_registers : WHV_UINT128[6]*
    reserved1 : UInt64[2]*
  end
  struct WHV_X64_APIC_INIT_SIPI_CONTEXT
    apic_icr : UInt64
  end
  struct WHV_X64_APIC_WRITE_CONTEXT
    type : WHV_X64_APIC_WRITE_TYPE
    reserved : UInt32
    write_value : UInt64
  end
  struct WHV_RUN_VP_EXIT_CONTEXT
    exit_reason : WHV_RUN_VP_EXIT_REASON
    reserved : UInt32
    vp_context : WHV_VP_EXIT_CONTEXT
    anonymous : WHV_RUN_VP_EXIT_CONTEXT_Anonymous_e__Union
  end
  struct WHV_INTERRUPT_CONTROL
    _bitfield : UInt64
    destination : UInt32
    vector : UInt32
  end
  struct WHV_DOORBELL_MATCH_DATA
    guest_address : UInt64
    value : UInt64
    length : UInt32
    _bitfield : UInt32
  end
  struct WHV_PARTITION_MEMORY_COUNTERS
    mapped4_k_page_count : UInt64
    mapped2_m_page_count : UInt64
    mapped1_g_page_count : UInt64
  end
  struct WHV_PROCESSOR_RUNTIME_COUNTERS
    total_runtime100ns : UInt64
    hypervisor_runtime100ns : UInt64
  end
  struct WHV_PROCESSOR_INTERCEPT_COUNTER
    count : UInt64
    time100ns : UInt64
  end
  struct WHV_PROCESSOR_INTERCEPT_COUNTERS
    page_invalidations : WHV_PROCESSOR_INTERCEPT_COUNTER
    control_register_accesses : WHV_PROCESSOR_INTERCEPT_COUNTER
    io_instructions : WHV_PROCESSOR_INTERCEPT_COUNTER
    halt_instructions : WHV_PROCESSOR_INTERCEPT_COUNTER
    cpuid_instructions : WHV_PROCESSOR_INTERCEPT_COUNTER
    msr_accesses : WHV_PROCESSOR_INTERCEPT_COUNTER
    other_intercepts : WHV_PROCESSOR_INTERCEPT_COUNTER
    pending_interrupts : WHV_PROCESSOR_INTERCEPT_COUNTER
    emulated_instructions : WHV_PROCESSOR_INTERCEPT_COUNTER
    debug_register_accesses : WHV_PROCESSOR_INTERCEPT_COUNTER
    page_fault_intercepts : WHV_PROCESSOR_INTERCEPT_COUNTER
    nested_page_fault_intercepts : WHV_PROCESSOR_INTERCEPT_COUNTER
    hypercalls : WHV_PROCESSOR_INTERCEPT_COUNTER
    rdpmc_instructions : WHV_PROCESSOR_INTERCEPT_COUNTER
  end
  struct WHV_PROCESSOR_EVENT_COUNTERS
    page_fault_count : UInt64
    exception_count : UInt64
    interrupt_count : UInt64
  end
  struct WHV_PROCESSOR_APIC_COUNTERS
    mmio_access_count : UInt64
    eoi_access_count : UInt64
    tpr_access_count : UInt64
    sent_ipi_count : UInt64
    self_ipi_count : UInt64
  end
  struct WHV_PROCESSOR_SYNTHETIC_FEATURES_COUNTERS
    synthetic_interrupts_count : UInt64
    long_spin_wait_hypercalls_count : UInt64
    other_hypercalls_count : UInt64
    synthetic_interrupt_hypercalls_count : UInt64
    virtual_interrupt_hypercalls_count : UInt64
    virtual_mmu_hypercalls_count : UInt64
  end
  struct WHV_SYNIC_EVENT_PARAMETERS
    vp_index : UInt32
    target_sint : UInt8
    reserved : UInt8
    flag_number : UInt16
  end
  struct WHV_SRIOV_RESOURCE_DESCRIPTOR
    pnp_instance_id : Char[200]*
    virtual_function_id : LUID
    virtual_function_index : UInt16
    reserved : UInt16
  end
  struct WHV_VPCI_DEVICE_NOTIFICATION
    notification_type : WHV_VPCI_DEVICE_NOTIFICATION_TYPE
    reserved1 : UInt32
    anonymous : WHV_VPCI_DEVICE_NOTIFICATION_Anonymous_e__Union
  end
  struct WHV_VPCI_HARDWARE_IDS
    vendor_id : UInt16
    device_id : UInt16
    revision_id : UInt8
    prog_if : UInt8
    sub_class : UInt8
    base_class : UInt8
    sub_vendor_id : UInt16
    sub_system_id : UInt16
  end
  struct WHV_VPCI_PROBED_BARS
    value : UInt32[6]*
  end
  struct WHV_VPCI_MMIO_MAPPING
    location : WHV_VPCI_DEVICE_REGISTER_SPACE
    flags : WHV_VPCI_MMIO_RANGE_FLAGS
    size_in_bytes : UInt64
    offset_in_bytes : UInt64
    virtual_address : Void*
  end
  struct WHV_VPCI_DEVICE_REGISTER
    location : WHV_VPCI_DEVICE_REGISTER_SPACE
    size_in_bytes : UInt32
    offset_in_bytes : UInt64
  end
  struct WHV_VPCI_INTERRUPT_TARGET
    vector : UInt32
    flags : WHV_VPCI_INTERRUPT_TARGET_FLAGS
    processor_count : UInt32
    processors : UInt32[0]*
  end
  struct WHV_TRIGGER_PARAMETERS
    trigger_type : WHV_TRIGGER_TYPE
    reserved : UInt32
    anonymous : WHV_TRIGGER_PARAMETERS_Anonymous_e__Union
  end
  struct WHV_TRIGGER_PARAMETERS_Anonymous_e__Union_DeviceInterrupt_e__Struct
    logical_device_id : UInt64
    msi_address : UInt64
    msi_data : UInt32
    reserved : UInt32
  end
  struct WHV_VIRTUAL_PROCESSOR_PROPERTY
    property_code : WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE
    reserved : UInt32
    anonymous : WHV_VIRTUAL_PROCESSOR_PROPERTY_Anonymous_e__Union
  end
  struct WHV_NOTIFICATION_PORT_PARAMETERS
    notification_port_type : WHV_NOTIFICATION_PORT_TYPE
    reserved : UInt32
    anonymous : WHV_NOTIFICATION_PORT_PARAMETERS_Anonymous_e__Union
  end
  struct WHV_NOTIFICATION_PORT_PARAMETERS_Anonymous_e__Union_Event_e__Struct
    connection_id : UInt32
  end
  struct WHV_EMULATOR_STATUS_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct WHV_EMULATOR_MEMORY_ACCESS_INFO
    gpa_address : UInt64
    direction : UInt8
    access_size : UInt8
    data : UInt8[8]*
  end
  struct WHV_EMULATOR_IO_ACCESS_INFO
    direction : UInt8
    port : UInt16
    access_size : UInt16
    data : UInt32
  end
  struct WHV_EMULATOR_CALLBACKS
    size : UInt32
    reserved : UInt32
    w_hv_emulator_io_port_callback : WHV_EMULATOR_IO_PORT_CALLBACK
    w_hv_emulator_memory_callback : WHV_EMULATOR_MEMORY_CALLBACK
    w_hv_emulator_get_virtual_processor_registers : WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK
    w_hv_emulator_set_virtual_processor_registers : WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK
    w_hv_emulator_translate_gva_page : WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK
  end
  struct SOCKADDR_HV
    family : UInt16
    reserved : UInt16
    vm_id : Guid
    service_id : Guid
  end
  struct HVSOCKET_ADDRESS_INFO
    system_id : Guid
    virtual_machine_id : Guid
    silo_id : Guid
    flags : UInt32
  end
  struct VM_GENCOUNTER
    generation_count : UInt64
    generation_count_high : UInt64
  end
  struct HDV_PCI_PNP_ID
    vendor_id : UInt16
    device_id : UInt16
    revision_id : UInt8
    prog_if : UInt8
    sub_class : UInt8
    base_class : UInt8
    sub_vendor_id : UInt16
    sub_system_id : UInt16
  end
  struct HDV_PCI_DEVICE_INTERFACE
    version : HDV_PCI_INTERFACE_VERSION
    initialize : HDV_PCI_DEVICE_INITIALIZE
    teardown : HDV_PCI_DEVICE_TEARDOWN
    set_configuration : HDV_PCI_DEVICE_SET_CONFIGURATION
    get_details : HDV_PCI_DEVICE_GET_DETAILS
    start : HDV_PCI_DEVICE_START
    stop : HDV_PCI_DEVICE_STOP
    read_config_space : HDV_PCI_READ_CONFIG_SPACE
    write_config_space : HDV_PCI_WRITE_CONFIG_SPACE
    read_intercepted_memory : HDV_PCI_READ_INTERCEPTED_MEMORY
    write_intercepted_memory : HDV_PCI_WRITE_INTERCEPTED_MEMORY
  end
  struct GPA_MEMORY_CHUNK
    guest_physical_start_page_index : UInt64
    page_count : UInt64
  end
  struct GUEST_OS_INFO_OpenSource_e__Struct
    _bitfield : UInt64
  end
  struct GUEST_OS_INFO_ClosedSource_e__Struct
    _bitfield : UInt64
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_XmmControlStatus_e__Struct
    anonymous : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_XmmControlStatus_e__Struct_Anonymous_e__Union
    xmm_status_control : UInt32
    xmm_status_control_mask : UInt32
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_XmmControlStatus_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
    last_fp_dp : UInt32
    last_fp_ds : UInt16
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_FpControlStatus_e__Struct
    fp_control : UInt16
    fp_status : UInt16
    fp_tag : UInt8
    reserved : UInt8
    last_fp_op : UInt16
    anonymous : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_FpControlStatus_e__Struct_Anonymous_e__Union
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_FpControlStatus_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
    last_fp_eip : UInt32
    last_fp_cs : UInt16
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Segment_e__Struct
    base : UInt64
    limit : UInt32
    selector : UInt16
    anonymous : VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Segment_e__Struct_Anonymous_e__Union
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Segment_e__Struct_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt16
  end
  struct VIRTUAL_PROCESSOR_REGISTER_X64_e__Union_Table_e__Struct
    limit : UInt16
    base : UInt64
  end
  struct VIRTUAL_PROCESSOR_REGISTER_Reg128_e__Struct
    low64 : UInt64
    high64 : UInt64
  end
  struct DOS_IMAGE_INFO
    pdb_name : PSTR
    image_base_address : UInt64
    image_size : UInt32
    timestamp : UInt32
  end
  struct MODULE_INFO
    process_image_name : PSTR
    image : DOS_IMAGE_INFO
  end


  # Params # capabilitycode : WHV_CAPABILITY_CODE [In],capabilitybuffer : Void* [In],capabilitybuffersizeinbytes : UInt32 [In],writtensizeinbytes : UInt32* [In]
  fun WHvGetCapability(capabilitycode : WHV_CAPABILITY_CODE, capabilitybuffer : Void*, capabilitybuffersizeinbytes : UInt32, writtensizeinbytes : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE* [In]
  fun WHvCreatePartition(partition : WHV_PARTITION_HANDLE*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvSetupPartition(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvResetPartition(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvDeletePartition(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],propertycode : WHV_PARTITION_PROPERTY_CODE [In],propertybuffer : Void* [In],propertybuffersizeinbytes : UInt32 [In],writtensizeinbytes : UInt32* [In]
  fun WHvGetPartitionProperty(partition : WHV_PARTITION_HANDLE, propertycode : WHV_PARTITION_PROPERTY_CODE, propertybuffer : Void*, propertybuffersizeinbytes : UInt32, writtensizeinbytes : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],propertycode : WHV_PARTITION_PROPERTY_CODE [In],propertybuffer : Void* [In],propertybuffersizeinbytes : UInt32 [In]
  fun WHvSetPartitionProperty(partition : WHV_PARTITION_HANDLE, propertycode : WHV_PARTITION_PROPERTY_CODE, propertybuffer : Void*, propertybuffersizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvSuspendPartitionTime(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvResumePartitionTime(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],sourceaddress : Void* [In],guestaddress : UInt64 [In],sizeinbytes : UInt64 [In],flags : WHV_MAP_GPA_RANGE_FLAGS [In]
  fun WHvMapGpaRange(partition : WHV_PARTITION_HANDLE, sourceaddress : Void*, guestaddress : UInt64, sizeinbytes : UInt64, flags : WHV_MAP_GPA_RANGE_FLAGS) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],process : LibC::HANDLE [In],sourceaddress : Void* [In],guestaddress : UInt64 [In],sizeinbytes : UInt64 [In],flags : WHV_MAP_GPA_RANGE_FLAGS [In]
  fun WHvMapGpaRange2(partition : WHV_PARTITION_HANDLE, process : LibC::HANDLE, sourceaddress : Void*, guestaddress : UInt64, sizeinbytes : UInt64, flags : WHV_MAP_GPA_RANGE_FLAGS) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],guestaddress : UInt64 [In],sizeinbytes : UInt64 [In]
  fun WHvUnmapGpaRange(partition : WHV_PARTITION_HANDLE, guestaddress : UInt64, sizeinbytes : UInt64) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],gva : UInt64 [In],translateflags : WHV_TRANSLATE_GVA_FLAGS [In],translationresult : WHV_TRANSLATE_GVA_RESULT* [In],gpa : UInt64* [In]
  fun WHvTranslateGva(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, gva : UInt64, translateflags : WHV_TRANSLATE_GVA_FLAGS, translationresult : WHV_TRANSLATE_GVA_RESULT*, gpa : UInt64*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],flags : UInt32 [In]
  fun WHvCreateVirtualProcessor(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, flags : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],properties : WHV_VIRTUAL_PROCESSOR_PROPERTY* [In],propertycount : UInt32 [In]
  fun WHvCreateVirtualProcessor2(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, properties : WHV_VIRTUAL_PROCESSOR_PROPERTY*, propertycount : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In]
  fun WHvDeleteVirtualProcessor(partition : WHV_PARTITION_HANDLE, vpindex : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],exitcontext : Void* [In],exitcontextsizeinbytes : UInt32 [In]
  fun WHvRunVirtualProcessor(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, exitcontext : Void*, exitcontextsizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],flags : UInt32 [In]
  fun WHvCancelRunVirtualProcessor(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, flags : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],registernames : WHV_REGISTER_NAME* [In],registercount : UInt32 [In],registervalues : WHV_REGISTER_VALUE* [In]
  fun WHvGetVirtualProcessorRegisters(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, registernames : WHV_REGISTER_NAME*, registercount : UInt32, registervalues : WHV_REGISTER_VALUE*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],registernames : WHV_REGISTER_NAME* [In],registercount : UInt32 [In],registervalues : WHV_REGISTER_VALUE* [In]
  fun WHvSetVirtualProcessorRegisters(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, registernames : WHV_REGISTER_NAME*, registercount : UInt32, registervalues : WHV_REGISTER_VALUE*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],state : Void* [In],statesize : UInt32 [In],writtensize : UInt32* [In]
  fun WHvGetVirtualProcessorInterruptControllerState(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, state : Void*, statesize : UInt32, writtensize : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],state : Void* [In],statesize : UInt32 [In]
  fun WHvSetVirtualProcessorInterruptControllerState(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, state : Void*, statesize : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],interrupt : WHV_INTERRUPT_CONTROL* [In],interruptcontrolsize : UInt32 [In]
  fun WHvRequestInterrupt(partition : WHV_PARTITION_HANDLE, interrupt : WHV_INTERRUPT_CONTROL*, interruptcontrolsize : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],buffer : Void* [In],buffersizeinbytes : UInt32 [In],byteswritten : UInt32* [In]
  fun WHvGetVirtualProcessorXsaveState(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, buffer : Void*, buffersizeinbytes : UInt32, byteswritten : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],buffer : Void* [In],buffersizeinbytes : UInt32 [In]
  fun WHvSetVirtualProcessorXsaveState(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, buffer : Void*, buffersizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],guestaddress : UInt64 [In],rangesizeinbytes : UInt64 [In],bitmap : UInt64* [In],bitmapsizeinbytes : UInt32 [In]
  fun WHvQueryGpaRangeDirtyBitmap(partition : WHV_PARTITION_HANDLE, guestaddress : UInt64, rangesizeinbytes : UInt64, bitmap : UInt64*, bitmapsizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],counterset : WHV_PARTITION_COUNTER_SET [In],buffer : Void* [In],buffersizeinbytes : UInt32 [In],byteswritten : UInt32* [In]
  fun WHvGetPartitionCounters(partition : WHV_PARTITION_HANDLE, counterset : WHV_PARTITION_COUNTER_SET, buffer : Void*, buffersizeinbytes : UInt32, byteswritten : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],counterset : WHV_PROCESSOR_COUNTER_SET [In],buffer : Void* [In],buffersizeinbytes : UInt32 [In],byteswritten : UInt32* [In]
  fun WHvGetVirtualProcessorCounters(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, counterset : WHV_PROCESSOR_COUNTER_SET, buffer : Void*, buffersizeinbytes : UInt32, byteswritten : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],state : Void* [In],statesize : UInt32 [In],writtensize : UInt32* [In]
  fun WHvGetVirtualProcessorInterruptControllerState2(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, state : Void*, statesize : UInt32, writtensize : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],state : Void* [In],statesize : UInt32 [In]
  fun WHvSetVirtualProcessorInterruptControllerState2(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, state : Void*, statesize : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],matchdata : WHV_DOORBELL_MATCH_DATA* [In],eventhandle : LibC::HANDLE [In]
  fun WHvRegisterPartitionDoorbellEvent(partition : WHV_PARTITION_HANDLE, matchdata : WHV_DOORBELL_MATCH_DATA*, eventhandle : LibC::HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],matchdata : WHV_DOORBELL_MATCH_DATA* [In]
  fun WHvUnregisterPartitionDoorbellEvent(partition : WHV_PARTITION_HANDLE, matchdata : WHV_DOORBELL_MATCH_DATA*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],gparanges : WHV_MEMORY_RANGE_ENTRY* [In],gparangescount : UInt32 [In],advice : WHV_ADVISE_GPA_RANGE_CODE [In],advicebuffer : Void* [In],advicebuffersizeinbytes : UInt32 [In]
  fun WHvAdviseGpaRange(partition : WHV_PARTITION_HANDLE, gparanges : WHV_MEMORY_RANGE_ENTRY*, gparangescount : UInt32, advice : WHV_ADVISE_GPA_RANGE_CODE, advicebuffer : Void*, advicebuffersizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],guestaddress : UInt64 [In],controls : WHV_ACCESS_GPA_CONTROLS [In],data : Void* [In],datasizeinbytes : UInt32 [In]
  fun WHvReadGpaRange(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, guestaddress : UInt64, controls : WHV_ACCESS_GPA_CONTROLS, data : Void*, datasizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],guestaddress : UInt64 [In],controls : WHV_ACCESS_GPA_CONTROLS [In],data : Void* [In],datasizeinbytes : UInt32 [In]
  fun WHvWriteGpaRange(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, guestaddress : UInt64, controls : WHV_ACCESS_GPA_CONTROLS, data : Void*, datasizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],synicevent : WHV_SYNIC_EVENT_PARAMETERS [In],newlysignaled : LibC::BOOL* [In]
  fun WHvSignalVirtualProcessorSynicEvent(partition : WHV_PARTITION_HANDLE, synicevent : WHV_SYNIC_EVENT_PARAMETERS, newlysignaled : LibC::BOOL*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],statetype : WHV_VIRTUAL_PROCESSOR_STATE_TYPE [In],buffer : Void* [In],buffersizeinbytes : UInt32 [In],byteswritten : UInt32* [In]
  fun WHvGetVirtualProcessorState(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, statetype : WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffersizeinbytes : UInt32, byteswritten : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],statetype : WHV_VIRTUAL_PROCESSOR_STATE_TYPE [In],buffer : Void* [In],buffersizeinbytes : UInt32 [In]
  fun WHvSetVirtualProcessorState(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, statetype : WHV_VIRTUAL_PROCESSOR_STATE_TYPE, buffer : Void*, buffersizeinbytes : UInt32) : HRESULT

  # Params # providerid : Guid* [In],flags : WHV_ALLOCATE_VPCI_RESOURCE_FLAGS [In],resourcedescriptor : Void* [In],resourcedescriptorsizeinbytes : UInt32 [In],vpciresource : LibC::HANDLE* [In]
  fun WHvAllocateVpciResource(providerid : Guid*, flags : WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, resourcedescriptor : Void*, resourcedescriptorsizeinbytes : UInt32, vpciresource : LibC::HANDLE*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],vpciresource : LibC::HANDLE [In],flags : WHV_CREATE_VPCI_DEVICE_FLAGS [In],notificationeventhandle : LibC::HANDLE [In]
  fun WHvCreateVpciDevice(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, vpciresource : LibC::HANDLE, flags : WHV_CREATE_VPCI_DEVICE_FLAGS, notificationeventhandle : LibC::HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In]
  fun WHvDeleteVpciDevice(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],propertycode : WHV_VPCI_DEVICE_PROPERTY_CODE [In],propertybuffer : Void* [In],propertybuffersizeinbytes : UInt32 [In],writtensizeinbytes : UInt32* [In]
  fun WHvGetVpciDeviceProperty(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, propertycode : WHV_VPCI_DEVICE_PROPERTY_CODE, propertybuffer : Void*, propertybuffersizeinbytes : UInt32, writtensizeinbytes : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],notification : WHV_VPCI_DEVICE_NOTIFICATION* [In],notificationsizeinbytes : UInt32 [In]
  fun WHvGetVpciDeviceNotification(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, notification : WHV_VPCI_DEVICE_NOTIFICATION*, notificationsizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],mappingcount : UInt32* [In],mappings : WHV_VPCI_MMIO_MAPPING** [In]
  fun WHvMapVpciDeviceMmioRanges(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, mappingcount : UInt32*, mappings : WHV_VPCI_MMIO_MAPPING**) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In]
  fun WHvUnmapVpciDeviceMmioRanges(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],powerstate : DEVICE_POWER_STATE [In]
  fun WHvSetVpciDevicePowerState(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, powerstate : DEVICE_POWER_STATE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],register : WHV_VPCI_DEVICE_REGISTER* [In],data : Void* [In]
  fun WHvReadVpciDeviceRegister(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, register : WHV_VPCI_DEVICE_REGISTER*, data : Void*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],register : WHV_VPCI_DEVICE_REGISTER* [In],data : Void* [In]
  fun WHvWriteVpciDeviceRegister(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, register : WHV_VPCI_DEVICE_REGISTER*, data : Void*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],index : UInt32 [In],messagecount : UInt32 [In],target : WHV_VPCI_INTERRUPT_TARGET* [In],msiaddress : UInt64* [In],msidata : UInt32* [In]
  fun WHvMapVpciDeviceInterrupt(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, index : UInt32, messagecount : UInt32, target : WHV_VPCI_INTERRUPT_TARGET*, msiaddress : UInt64*, msidata : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],index : UInt32 [In]
  fun WHvUnmapVpciDeviceInterrupt(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, index : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],msiaddress : UInt64 [In],msidata : UInt32 [In],target : WHV_VPCI_INTERRUPT_TARGET* [In]
  fun WHvRetargetVpciDeviceInterrupt(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, msiaddress : UInt64, msidata : UInt32, target : WHV_VPCI_INTERRUPT_TARGET*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],msiaddress : UInt64 [In],msidata : UInt32 [In]
  fun WHvRequestVpciDeviceInterrupt(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, msiaddress : UInt64, msidata : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],logicaldeviceid : UInt64 [In],index : UInt32 [In],multimessagenumber : UInt32 [In],target : WHV_VPCI_INTERRUPT_TARGET* [In],targetsizeinbytes : UInt32 [In],byteswritten : UInt32* [In]
  fun WHvGetVpciDeviceInterruptTarget(partition : WHV_PARTITION_HANDLE, logicaldeviceid : UInt64, index : UInt32, multimessagenumber : UInt32, target : WHV_VPCI_INTERRUPT_TARGET*, targetsizeinbytes : UInt32, byteswritten : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],parameters : WHV_TRIGGER_PARAMETERS* [In],triggerhandle : Void** [In],eventhandle : LibC::HANDLE* [In]
  fun WHvCreateTrigger(partition : WHV_PARTITION_HANDLE, parameters : WHV_TRIGGER_PARAMETERS*, triggerhandle : Void**, eventhandle : LibC::HANDLE*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],parameters : WHV_TRIGGER_PARAMETERS* [In],triggerhandle : Void* [In]
  fun WHvUpdateTriggerParameters(partition : WHV_PARTITION_HANDLE, parameters : WHV_TRIGGER_PARAMETERS*, triggerhandle : Void*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],triggerhandle : Void* [In]
  fun WHvDeleteTrigger(partition : WHV_PARTITION_HANDLE, triggerhandle : Void*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],parameters : WHV_NOTIFICATION_PORT_PARAMETERS* [In],eventhandle : LibC::HANDLE [In],porthandle : Void** [In]
  fun WHvCreateNotificationPort(partition : WHV_PARTITION_HANDLE, parameters : WHV_NOTIFICATION_PORT_PARAMETERS*, eventhandle : LibC::HANDLE, porthandle : Void**) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],porthandle : Void* [In],propertycode : WHV_NOTIFICATION_PORT_PROPERTY_CODE [In],propertyvalue : UInt64 [In]
  fun WHvSetNotificationPortProperty(partition : WHV_PARTITION_HANDLE, porthandle : Void*, propertycode : WHV_NOTIFICATION_PORT_PROPERTY_CODE, propertyvalue : UInt64) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],porthandle : Void* [In]
  fun WHvDeleteNotificationPort(partition : WHV_PARTITION_HANDLE, porthandle : Void*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],sintindex : UInt32 [In],message : Void* [In],messagesizeinbytes : UInt32 [In]
  fun WHvPostVirtualProcessorSynicMessage(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, sintindex : UInt32, message : Void*, messagesizeinbytes : UInt32) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],vpindex : UInt32 [In],eax : UInt32 [In],ecx : UInt32 [In],cpuidoutput : WHV_CPUID_OUTPUT* [In]
  fun WHvGetVirtualProcessorCpuidOutput(partition : WHV_PARTITION_HANDLE, vpindex : UInt32, eax : UInt32, ecx : UInt32, cpuidoutput : WHV_CPUID_OUTPUT*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],destination : UInt64 [In],destinationmode : WHV_INTERRUPT_DESTINATION_MODE [In],targetvps : UInt32* [In],vpcount : UInt32 [In],targetvpcount : UInt32* [In]
  fun WHvGetInterruptTargetVpSet(partition : WHV_PARTITION_HANDLE, destination : UInt64, destinationmode : WHV_INTERRUPT_DESTINATION_MODE, targetvps : UInt32*, vpcount : UInt32, targetvpcount : UInt32*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In],migrationhandle : LibC::HANDLE* [In]
  fun WHvStartPartitionMigration(partition : WHV_PARTITION_HANDLE, migrationhandle : LibC::HANDLE*) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvCancelPartitionMigration(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # partition : WHV_PARTITION_HANDLE [In]
  fun WHvCompletePartitionMigration(partition : WHV_PARTITION_HANDLE) : HRESULT

  # Params # migrationhandle : LibC::HANDLE [In],partition : WHV_PARTITION_HANDLE* [In]
  fun WHvAcceptPartitionMigration(migrationhandle : LibC::HANDLE, partition : WHV_PARTITION_HANDLE*) : HRESULT

  # Params # callbacks : WHV_EMULATOR_CALLBACKS* [In],emulator : Void** [In]
  fun WHvEmulatorCreateEmulator(callbacks : WHV_EMULATOR_CALLBACKS*, emulator : Void**) : HRESULT

  # Params # emulator : Void* [In]
  fun WHvEmulatorDestroyEmulator(emulator : Void*) : HRESULT

  # Params # emulator : Void* [In],context : Void* [In],vpcontext : WHV_VP_EXIT_CONTEXT* [In],ioinstructioncontext : WHV_X64_IO_PORT_ACCESS_CONTEXT* [In],emulatorreturnstatus : WHV_EMULATOR_STATUS* [In]
  fun WHvEmulatorTryIoEmulation(emulator : Void*, context : Void*, vpcontext : WHV_VP_EXIT_CONTEXT*, ioinstructioncontext : WHV_X64_IO_PORT_ACCESS_CONTEXT*, emulatorreturnstatus : WHV_EMULATOR_STATUS*) : HRESULT

  # Params # emulator : Void* [In],context : Void* [In],vpcontext : WHV_VP_EXIT_CONTEXT* [In],mmioinstructioncontext : WHV_MEMORY_ACCESS_CONTEXT* [In],emulatorreturnstatus : WHV_EMULATOR_STATUS* [In]
  fun WHvEmulatorTryMmioEmulation(emulator : Void*, context : Void*, vpcontext : WHV_VP_EXIT_CONTEXT*, mmioinstructioncontext : WHV_MEMORY_ACCESS_CONTEXT*, emulatorreturnstatus : WHV_EMULATOR_STATUS*) : HRESULT

  # Params # computesystem : HCS_SYSTEM [In],devicehosthandle : Void** [In]
  fun HdvInitializeDeviceHost(computesystem : HCS_SYSTEM, devicehosthandle : Void**) : HRESULT

  # Params # devicehosthandle : Void* [In]
  fun HdvTeardownDeviceHost(devicehosthandle : Void*) : HRESULT

  # Params # devicehosthandle : Void* [In],devicetype : HDV_DEVICE_TYPE [In],deviceclassid : Guid* [In],deviceinstanceid : Guid* [In],deviceinterface : Void* [In],devicecontext : Void* [In],devicehandle : Void** [In]
  fun HdvCreateDeviceInstance(devicehosthandle : Void*, devicetype : HDV_DEVICE_TYPE, deviceclassid : Guid*, deviceinstanceid : Guid*, deviceinterface : Void*, devicecontext : Void*, devicehandle : Void**) : HRESULT

  # Params # requestor : Void* [In],guestphysicaladdress : UInt64 [In],bytecount : UInt32 [In],buffer : UInt8* [In]
  fun HdvReadGuestMemory(requestor : Void*, guestphysicaladdress : UInt64, bytecount : UInt32, buffer : UInt8*) : HRESULT

  # Params # requestor : Void* [In],guestphysicaladdress : UInt64 [In],bytecount : UInt32 [In],buffer : UInt8* [In]
  fun HdvWriteGuestMemory(requestor : Void*, guestphysicaladdress : UInt64, bytecount : UInt32, buffer : UInt8*) : HRESULT

  # Params # requestor : Void* [In],guestphysicaladdress : UInt64 [In],bytecount : UInt32 [In],writeprotected : LibC::BOOL [In],mappedaddress : Void** [In]
  fun HdvCreateGuestMemoryAperture(requestor : Void*, guestphysicaladdress : UInt64, bytecount : UInt32, writeprotected : LibC::BOOL, mappedaddress : Void**) : HRESULT

  # Params # requestor : Void* [In],mappedaddress : Void* [In]
  fun HdvDestroyGuestMemoryAperture(requestor : Void*, mappedaddress : Void*) : HRESULT

  # Params # requestor : Void* [In],msiaddress : UInt64 [In],msidata : UInt32 [In]
  fun HdvDeliverGuestInterrupt(requestor : Void*, msiaddress : UInt64, msidata : UInt32) : HRESULT

  # Params # requestor : Void* [In],barindex : HDV_PCI_BAR_SELECTOR [In],baroffset : UInt64 [In],triggervalue : UInt64 [In],flags : UInt64 [In],doorbellevent : LibC::HANDLE [In]
  fun HdvRegisterDoorbell(requestor : Void*, barindex : HDV_PCI_BAR_SELECTOR, baroffset : UInt64, triggervalue : UInt64, flags : UInt64, doorbellevent : LibC::HANDLE) : HRESULT

  # Params # requestor : Void* [In],barindex : HDV_PCI_BAR_SELECTOR [In],baroffset : UInt64 [In],triggervalue : UInt64 [In],flags : UInt64 [In]
  fun HdvUnregisterDoorbell(requestor : Void*, barindex : HDV_PCI_BAR_SELECTOR, baroffset : UInt64, triggervalue : UInt64, flags : UInt64) : HRESULT

  # Params # requestor : Void* [In],barindex : HDV_PCI_BAR_SELECTOR [In],offsetinpages : UInt64 [In],lengthinpages : UInt64 [In],mappingflags : HDV_MMIO_MAPPING_FLAGS [In],sectionhandle : LibC::HANDLE [In],sectionoffsetinpages : UInt64 [In]
  fun HdvCreateSectionBackedMmioRange(requestor : Void*, barindex : HDV_PCI_BAR_SELECTOR, offsetinpages : UInt64, lengthinpages : UInt64, mappingflags : HDV_MMIO_MAPPING_FLAGS, sectionhandle : LibC::HANDLE, sectionoffsetinpages : UInt64) : HRESULT

  # Params # requestor : Void* [In],barindex : HDV_PCI_BAR_SELECTOR [In],offsetinpages : UInt64 [In]
  fun HdvDestroySectionBackedMmioRange(requestor : Void*, barindex : HDV_PCI_BAR_SELECTOR, offsetinpages : UInt64) : HRESULT

  # Params # vmname : LibC::LPWSTR [In],snapshotname : LibC::LPWSTR [In],binpath : LibC::LPWSTR* [In],vsvpath : LibC::LPWSTR* [In],vmrspath : LibC::LPWSTR* [In]
  fun LocateSavedStateFiles(vmname : LibC::LPWSTR, snapshotname : LibC::LPWSTR, binpath : LibC::LPWSTR*, vsvpath : LibC::LPWSTR*, vmrspath : LibC::LPWSTR*) : HRESULT

  # Params # vmrsfile : LibC::LPWSTR [In],vmsavedstatedumphandle : Void** [In]
  fun LoadSavedStateFile(vmrsfile : LibC::LPWSTR, vmsavedstatedumphandle : Void**) : HRESULT

  # Params # vmrsfile : LibC::LPWSTR [In]
  fun ApplyPendingSavedStateFileReplayLog(vmrsfile : LibC::LPWSTR) : HRESULT

  # Params # binfile : LibC::LPWSTR [In],vsvfile : LibC::LPWSTR [In],vmsavedstatedumphandle : Void** [In]
  fun LoadSavedStateFiles(binfile : LibC::LPWSTR, vsvfile : LibC::LPWSTR, vmsavedstatedumphandle : Void**) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In]
  fun ReleaseSavedStateFiles(vmsavedstatedumphandle : Void*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],virtualtrustlevels : UInt32* [In]
  fun GetGuestEnabledVirtualTrustLevels(vmsavedstatedumphandle : Void*, virtualtrustlevels : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],virtualtrustlevel : UInt8 [In],guestosinfo : GUEST_OS_INFO* [In]
  fun GetGuestOsInfo(vmsavedstatedumphandle : Void*, virtualtrustlevel : UInt8, guestosinfo : GUEST_OS_INFO*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpcount : UInt32* [In]
  fun GetVpCount(vmsavedstatedumphandle : Void*, vpcount : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],architecture : VIRTUAL_PROCESSOR_ARCH* [In]
  fun GetArchitecture(vmsavedstatedumphandle : Void*, vpid : UInt32, architecture : VIRTUAL_PROCESSOR_ARCH*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],architecture : VIRTUAL_PROCESSOR_ARCH [In]
  fun ForceArchitecture(vmsavedstatedumphandle : Void*, vpid : UInt32, architecture : VIRTUAL_PROCESSOR_ARCH) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],virtualtrustlevel : UInt8* [In]
  fun GetActiveVirtualTrustLevel(vmsavedstatedumphandle : Void*, vpid : UInt32, virtualtrustlevel : UInt8*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],virtualtrustlevels : UInt32* [In]
  fun GetEnabledVirtualTrustLevels(vmsavedstatedumphandle : Void*, vpid : UInt32, virtualtrustlevels : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],virtualtrustlevel : UInt8 [In]
  fun ForceActiveVirtualTrustLevel(vmsavedstatedumphandle : Void*, vpid : UInt32, virtualtrustlevel : UInt8) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],activevirtualtrustlevelenabled : LibC::BOOL* [In]
  fun IsActiveVirtualTrustLevelEnabled(vmsavedstatedumphandle : Void*, vpid : UInt32, activevirtualtrustlevelenabled : LibC::BOOL*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],enabled : LibC::BOOL* [In]
  fun IsNestedVirtualizationEnabled(vmsavedstatedumphandle : Void*, enabled : LibC::BOOL*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],enabled : LibC::BOOL* [In]
  fun GetNestedVirtualizationMode(vmsavedstatedumphandle : Void*, vpid : UInt32, enabled : LibC::BOOL*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],hostmode : LibC::BOOL [In],oldmode : LibC::BOOL* [In]
  fun ForceNestedHostMode(vmsavedstatedumphandle : Void*, vpid : UInt32, hostmode : LibC::BOOL, oldmode : LibC::BOOL*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],inkernelspace : LibC::BOOL* [In]
  fun InKernelSpace(vmsavedstatedumphandle : Void*, vpid : UInt32, inkernelspace : LibC::BOOL*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],registerid : UInt32 [In],registervalue : VIRTUAL_PROCESSOR_REGISTER* [In]
  fun GetRegisterValue(vmsavedstatedumphandle : Void*, vpid : UInt32, registerid : UInt32, registervalue : VIRTUAL_PROCESSOR_REGISTER*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],pagingmode : PAGING_MODE* [In]
  fun GetPagingMode(vmsavedstatedumphandle : Void*, vpid : UInt32, pagingmode : PAGING_MODE*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],pagingmode : PAGING_MODE [In]
  fun ForcePagingMode(vmsavedstatedumphandle : Void*, vpid : UInt32, pagingmode : PAGING_MODE) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],physicaladdress : UInt64 [In],buffer : Void* [In],buffersize : UInt32 [In],bytesread : UInt32* [In]
  fun ReadGuestPhysicalAddress(vmsavedstatedumphandle : Void*, physicaladdress : UInt64, buffer : Void*, buffersize : UInt32, bytesread : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],virtualaddress : UInt64 [In],physicaladdress : UInt64* [In],unmappedregionsize : UInt64* [In]
  fun GuestVirtualAddressToPhysicalAddress(vmsavedstatedumphandle : Void*, vpid : UInt32, virtualaddress : UInt64, physicaladdress : UInt64*, unmappedregionsize : UInt64*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],memorychunkpagesize : UInt64* [In],memorychunks : GPA_MEMORY_CHUNK* [In],memorychunkcount : UInt64* [In]
  fun GetGuestPhysicalMemoryChunks(vmsavedstatedumphandle : Void*, memorychunkpagesize : UInt64*, memorychunks : GPA_MEMORY_CHUNK*, memorychunkcount : UInt64*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],physicaladdress : UInt64 [In],rawsavedmemoryoffset : UInt64* [In]
  fun GuestPhysicalAddressToRawSavedMemoryOffset(vmsavedstatedumphandle : Void*, physicaladdress : UInt64, rawsavedmemoryoffset : UInt64*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],rawsavedmemoryoffset : UInt64 [In],buffer : Void* [In],buffersize : UInt32 [In],bytesread : UInt32* [In]
  fun ReadGuestRawSavedMemory(vmsavedstatedumphandle : Void*, rawsavedmemoryoffset : UInt64, buffer : Void*, buffersize : UInt32, bytesread : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],guestrawsavedmemorysize : UInt64* [In]
  fun GetGuestRawSavedMemorySize(vmsavedstatedumphandle : Void*, guestrawsavedmemorysize : UInt64*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],memoryblockcachelimit : UInt64 [In]
  fun SetMemoryBlockCacheLimit(vmsavedstatedumphandle : Void*, memoryblockcachelimit : UInt64) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],memoryblockcachelimit : UInt64* [In]
  fun GetMemoryBlockCacheLimit(vmsavedstatedumphandle : Void*, memoryblockcachelimit : UInt64*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],virtualaddress : UInt64 [In],fixbuffer : Void* [In],fixbuffersize : UInt32 [In]
  fun ApplyGuestMemoryFix(vmsavedstatedumphandle : Void*, vpid : UInt32, virtualaddress : UInt64, fixbuffer : Void*, fixbuffersize : UInt32) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],usersymbols : LibC::LPWSTR [In],force : LibC::BOOL [In]
  fun LoadSavedStateSymbolProvider(vmsavedstatedumphandle : Void*, usersymbols : LibC::LPWSTR, force : LibC::BOOL) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In]
  fun ReleaseSavedStateSymbolProvider(vmsavedstatedumphandle : Void*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In]
  fun GetSavedStateSymbolProviderHandle(vmsavedstatedumphandle : Void*) : LibC::HANDLE

  # Params # vmsavedstatedumphandle : Void* [In],callback : GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK [In]
  fun SetSavedStateSymbolProviderDebugInfoCallback(vmsavedstatedumphandle : Void*, callback : GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],imagename : PSTR [In],modulename : PSTR [In],baseaddress : UInt64 [In],sizeofbase : UInt32 [In]
  fun LoadSavedStateModuleSymbols(vmsavedstatedumphandle : Void*, imagename : PSTR, modulename : PSTR, baseaddress : UInt64, sizeofbase : UInt32) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],imagename : PSTR [In],imagetimestamp : UInt32 [In],modulename : PSTR [In],baseaddress : UInt64 [In],sizeofbase : UInt32 [In]
  fun LoadSavedStateModuleSymbolsEx(vmsavedstatedumphandle : Void*, imagename : PSTR, imagetimestamp : UInt32, modulename : PSTR, baseaddress : UInt64, sizeofbase : UInt32) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],globalname : PSTR [In],virtualaddress : UInt64* [In],size : UInt32* [In]
  fun ResolveSavedStateGlobalVariableAddress(vmsavedstatedumphandle : Void*, vpid : UInt32, globalname : PSTR, virtualaddress : UInt64*, size : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],globalname : PSTR [In],buffer : Void* [In],buffersize : UInt32 [In]
  fun ReadSavedStateGlobalVariable(vmsavedstatedumphandle : Void*, vpid : UInt32, globalname : PSTR, buffer : Void*, buffersize : UInt32) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],typename : PSTR [In],size : UInt32* [In]
  fun GetSavedStateSymbolTypeSize(vmsavedstatedumphandle : Void*, vpid : UInt32, typename : PSTR, size : UInt32*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],typename : PSTR [In],fieldname : LibC::LPWSTR [In],offset : UInt32* [In],found : LibC::BOOL* [In]
  fun FindSavedStateSymbolFieldInType(vmsavedstatedumphandle : Void*, vpid : UInt32, typename : PSTR, fieldname : LibC::LPWSTR, offset : UInt32*, found : LibC::BOOL*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],typename : PSTR [In],typefieldinfomap : LibC::LPWSTR* [In]
  fun GetSavedStateSymbolFieldInfo(vmsavedstatedumphandle : Void*, vpid : UInt32, typename : PSTR, typefieldinfomap : LibC::LPWSTR*) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],startaddress : UInt64 [In],endaddress : UInt64 [In],callbackcontext : Void* [In],foundimagecallback : FOUND_IMAGE_CALLBACK [In],standaloneaddress : UInt64* [In],standaloneaddresscount : UInt32 [In]
  fun ScanMemoryForDosImages(vmsavedstatedumphandle : Void*, vpid : UInt32, startaddress : UInt64, endaddress : UInt64, callbackcontext : Void*, foundimagecallback : FOUND_IMAGE_CALLBACK, standaloneaddress : UInt64*, standaloneaddresscount : UInt32) : HRESULT

  # Params # vmsavedstatedumphandle : Void* [In],vpid : UInt32 [In],imageinfo : MODULE_INFO* [In],imageinfocount : UInt32 [In],framecount : UInt32 [In],callstack : LibC::LPWSTR* [In]
  fun CallStackUnwind(vmsavedstatedumphandle : Void*, vpid : UInt32, imageinfo : MODULE_INFO*, imageinfocount : UInt32, framecount : UInt32, callstack : LibC::LPWSTR*) : HRESULT
end
