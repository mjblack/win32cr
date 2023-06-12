require "../system/com.cr"
require "../foundation.cr"
require "../system/distributedtransactioncoordinator.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:ole32.dll")]
@[Link(ldflags: "/DELAYLOAD:comsvcs.dll")]
@[Link(ldflags: "/DELAYLOAD:mtxdm.dll")]
{% else %}
@[Link("ole32")]
@[Link("comsvcs")]
@[Link("mtxdm")]
{% end %}
lib LibWin32
  GUID_STRING_SIZE = 40_u32
  DATA_NOT_AVAILABLE = 4294967295_u32
  MTXDM_E_ENLISTRESOURCEFAILED = 2147803392_u32
  CRR_NO_REASON_SUPPLIED = 0_u32
  CRR_LIFETIME_LIMIT = 4294967295_u32
  CRR_ACTIVATION_LIMIT = 4294967294_u32
  CRR_CALL_LIMIT = 4294967293_u32
  CRR_MEMORY_LIMIT = 4294967292_u32
  CRR_RECYCLED_FROM_UI = 4294967291_u32
  SecurityIdentity = LibC::GUID.new(0xecabb0a5_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  SecurityCallers = LibC::GUID.new(0xecabb0a6_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  SecurityCallContext = LibC::GUID.new(0xecabb0a7_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  GetSecurityCallContextAppObject = LibC::GUID.new(0xecabb0a8_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  Dummy30040732 = LibC::GUID.new(0xecabb0a9_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  TransactionContext = LibC::GUID.new(0x7999fc25_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  TransactionContextEx = LibC::GUID.new(0x5cb66670_u32, 0xd3d4_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  ByotServerEx = LibC::GUID.new(0xecabb0aa_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CServiceConfig = LibC::GUID.new(0xecabb0c8_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  ServicePool = LibC::GUID.new(0xecabb0c9_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  ServicePoolConfig = LibC::GUID.new(0xecabb0ca_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  SharedProperty = LibC::GUID.new(0x2a005c05_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  SharedPropertyGroup = LibC::GUID.new(0x2a005c0b_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  SharedPropertyGroupManager = LibC::GUID.new(0x2a005c11_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  COMEvents = LibC::GUID.new(0xecabb0ab_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CoMTSLocator = LibC::GUID.new(0xecabb0ac_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  MtsGrp = LibC::GUID.new(0x4b2e958d_u32, 0x393_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xab_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  ComServiceEvents = LibC::GUID.new(0xecabb0c3_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  ComSystemAppEventData = LibC::GUID.new(0xecabb0c6_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CRMClerk = LibC::GUID.new(0xecabb0bd_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CRMRecoveryClerk = LibC::GUID.new(0xecabb0be_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  LBEvents = LibC::GUID.new(0xecabb0c1_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  MessageMover = LibC::GUID.new(0xecabb0bf_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  DispenserManager = LibC::GUID.new(0xecabb0c0_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  PoolMgr = LibC::GUID.new(0xecabafb5_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  EventServer = LibC::GUID.new(0xecabafbc_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  TrackerServer = LibC::GUID.new(0xecabafb9_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  AppDomainHelper = LibC::GUID.new(0xef24f689_u32, 0x14f8_u16, 0x4d92_u16, StaticArray[0xb4_u8, 0xaf_u8, 0xd7_u8, 0xb1_u8, 0xf0_u8, 0xe7_u8, 0xf_u8, 0xd4_u8])
  ClrAssemblyLocator = LibC::GUID.new(0x458aa3b5_u32, 0x265a_u16, 0x4b75_u16, StaticArray[0xbc_u8, 0x5_u8, 0x9b_u8, 0xea_u8, 0x46_u8, 0x30_u8, 0xcf_u8, 0x18_u8])
  COMAdminCatalog = LibC::GUID.new(0xf618c514_u32, 0xdfb8_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
  COMAdminCatalogObject = LibC::GUID.new(0xf618c515_u32, 0xdfb8_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
  COMAdminCatalogCollection = LibC::GUID.new(0xf618c516_u32, 0xdfb8_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])


  enum COMAdminInUse : Int32
    COMAdminNotInUse = 0
    COMAdminInUseByCatalog = 1
    COMAdminInUseByRegistryUnknown = 2
    COMAdminInUseByRegistryProxyStub = 3
    COMAdminInUseByRegistryTypeLib = 4
    COMAdminInUseByRegistryClsid = 5
  end

  enum COMAdminComponentType : Int32
    COMAdmin32BitComponent = 1
    COMAdmin64BitComponent = 2
  end

  enum COMAdminApplicationInstallOptions : Int32
    COMAdminInstallNoUsers = 0
    COMAdminInstallUsers = 1
    COMAdminInstallForceOverwriteOfFiles = 2
  end

  enum COMAdminApplicationExportOptions : Int32
    COMAdminExportNoUsers = 0
    COMAdminExportUsers = 1
    COMAdminExportApplicationProxy = 2
    COMAdminExportForceOverwriteOfFiles = 4
    COMAdminExportIn10Format = 16
  end

  enum COMAdminThreadingModels : Int32
    COMAdminThreadingModelApartment = 0
    COMAdminThreadingModelFree = 1
    COMAdminThreadingModelMain = 2
    COMAdminThreadingModelBoth = 3
    COMAdminThreadingModelNeutral = 4
    COMAdminThreadingModelNotSpecified = 5
  end

  enum COMAdminTransactionOptions : Int32
    COMAdminTransactionIgnored = 0
    COMAdminTransactionNone = 1
    COMAdminTransactionSupported = 2
    COMAdminTransactionRequired = 3
    COMAdminTransactionRequiresNew = 4
  end

  enum COMAdminTxIsolationLevelOptions : Int32
    COMAdminTxIsolationLevelAny = 0
    COMAdminTxIsolationLevelReadUnCommitted = 1
    COMAdminTxIsolationLevelReadCommitted = 2
    COMAdminTxIsolationLevelRepeatableRead = 3
    COMAdminTxIsolationLevelSerializable = 4
  end

  enum COMAdminSynchronizationOptions : Int32
    COMAdminSynchronizationIgnored = 0
    COMAdminSynchronizationNone = 1
    COMAdminSynchronizationSupported = 2
    COMAdminSynchronizationRequired = 3
    COMAdminSynchronizationRequiresNew = 4
  end

  enum COMAdminActivationOptions : Int32
    COMAdminActivationInproc = 0
    COMAdminActivationLocal = 1
  end

  enum COMAdminAccessChecksLevelOptions : Int32
    COMAdminAccessChecksApplicationLevel = 0
    COMAdminAccessChecksApplicationComponentLevel = 1
  end

  enum COMAdminAuthenticationLevelOptions : Int32
    COMAdminAuthenticationDefault = 0
    COMAdminAuthenticationNone = 1
    COMAdminAuthenticationConnect = 2
    COMAdminAuthenticationCall = 3
    COMAdminAuthenticationPacket = 4
    COMAdminAuthenticationIntegrity = 5
    COMAdminAuthenticationPrivacy = 6
  end

  enum COMAdminImpersonationLevelOptions : Int32
    COMAdminImpersonationAnonymous = 1
    COMAdminImpersonationIdentify = 2
    COMAdminImpersonationImpersonate = 3
    COMAdminImpersonationDelegate = 4
  end

  enum COMAdminAuthenticationCapabilitiesOptions : Int32
    COMAdminAuthenticationCapabilitiesNone = 0
    COMAdminAuthenticationCapabilitiesSecureReference = 2
    COMAdminAuthenticationCapabilitiesStaticCloaking = 32
    COMAdminAuthenticationCapabilitiesDynamicCloaking = 64
  end

  enum COMAdminOS : Int32
    COMAdminOSNotInitialized = 0
    COMAdminOSWindows3_1 = 1
    COMAdminOSWindows9x = 2
    COMAdminOSWindows2000 = 3
    COMAdminOSWindows2000AdvancedServer = 4
    COMAdminOSWindows2000Unknown = 5
    COMAdminOSUnknown = 6
    COMAdminOSWindowsXPPersonal = 11
    COMAdminOSWindowsXPProfessional = 12
    COMAdminOSWindowsNETStandardServer = 13
    COMAdminOSWindowsNETEnterpriseServer = 14
    COMAdminOSWindowsNETDatacenterServer = 15
    COMAdminOSWindowsNETWebServer = 16
    COMAdminOSWindowsLonghornPersonal = 17
    COMAdminOSWindowsLonghornProfessional = 18
    COMAdminOSWindowsLonghornStandardServer = 19
    COMAdminOSWindowsLonghornEnterpriseServer = 20
    COMAdminOSWindowsLonghornDatacenterServer = 21
    COMAdminOSWindowsLonghornWebServer = 22
    COMAdminOSWindows7Personal = 23
    COMAdminOSWindows7Professional = 24
    COMAdminOSWindows7StandardServer = 25
    COMAdminOSWindows7EnterpriseServer = 26
    COMAdminOSWindows7DatacenterServer = 27
    COMAdminOSWindows7WebServer = 28
    COMAdminOSWindows8Personal = 29
    COMAdminOSWindows8Professional = 30
    COMAdminOSWindows8StandardServer = 31
    COMAdminOSWindows8EnterpriseServer = 32
    COMAdminOSWindows8DatacenterServer = 33
    COMAdminOSWindows8WebServer = 34
    COMAdminOSWindowsBluePersonal = 35
    COMAdminOSWindowsBlueProfessional = 36
    COMAdminOSWindowsBlueStandardServer = 37
    COMAdminOSWindowsBlueEnterpriseServer = 38
    COMAdminOSWindowsBlueDatacenterServer = 39
    COMAdminOSWindowsBlueWebServer = 40
  end

  enum COMAdminServiceOptions : Int32
    COMAdminServiceLoadBalanceRouter = 1
  end

  enum COMAdminServiceStatusOptions : Int32
    COMAdminServiceStopped = 0
    COMAdminServiceStartPending = 1
    COMAdminServiceStopPending = 2
    COMAdminServiceRunning = 3
    COMAdminServiceContinuePending = 4
    COMAdminServicePausePending = 5
    COMAdminServicePaused = 6
    COMAdminServiceUnknownState = 7
  end

  enum COMAdminQCMessageAuthenticateOptions : Int32
    COMAdminQCMessageAuthenticateSecureApps = 0
    COMAdminQCMessageAuthenticateOff = 1
    COMAdminQCMessageAuthenticateOn = 2
  end

  enum COMAdminFileFlags : Int32
    COMAdminFileFlagLoadable = 1
    COMAdminFileFlagCOM = 2
    COMAdminFileFlagContainsPS = 4
    COMAdminFileFlagContainsComp = 8
    COMAdminFileFlagContainsTLB = 16
    COMAdminFileFlagSelfReg = 32
    COMAdminFileFlagSelfUnReg = 64
    COMAdminFileFlagUnloadableDLL = 128
    COMAdminFileFlagDoesNotExist = 256
    COMAdminFileFlagAlreadyInstalled = 512
    COMAdminFileFlagBadTLB = 1024
    COMAdminFileFlagGetClassObjFailed = 2048
    COMAdminFileFlagClassNotAvailable = 4096
    COMAdminFileFlagRegistrar = 8192
    COMAdminFileFlagNoRegistrar = 16384
    COMAdminFileFlagDLLRegsvrFailed = 32768
    COMAdminFileFlagRegTLBFailed = 65536
    COMAdminFileFlagRegistrarFailed = 131072
    COMAdminFileFlagError = 262144
  end

  enum COMAdminComponentFlags : Int32
    COMAdminCompFlagTypeInfoFound = 1
    COMAdminCompFlagCOMPlusPropertiesFound = 2
    COMAdminCompFlagProxyFound = 4
    COMAdminCompFlagInterfacesFound = 8
    COMAdminCompFlagAlreadyInstalled = 16
    COMAdminCompFlagNotInApplication = 32
  end

  enum COMAdminErrorCodes : Int32
    COMAdminErrObjectErrors = -2146368511
    COMAdminErrObjectInvalid = -2146368510
    COMAdminErrKeyMissing = -2146368509
    COMAdminErrAlreadyInstalled = -2146368508
    COMAdminErrAppFileWriteFail = -2146368505
    COMAdminErrAppFileReadFail = -2146368504
    COMAdminErrAppFileVersion = -2146368503
    COMAdminErrBadPath = -2146368502
    COMAdminErrApplicationExists = -2146368501
    COMAdminErrRoleExists = -2146368500
    COMAdminErrCantCopyFile = -2146368499
    COMAdminErrNoUser = -2146368497
    COMAdminErrInvalidUserids = -2146368496
    COMAdminErrNoRegistryCLSID = -2146368495
    COMAdminErrBadRegistryProgID = -2146368494
    COMAdminErrAuthenticationLevel = -2146368493
    COMAdminErrUserPasswdNotValid = -2146368492
    COMAdminErrCLSIDOrIIDMismatch = -2146368488
    COMAdminErrRemoteInterface = -2146368487
    COMAdminErrDllRegisterServer = -2146368486
    COMAdminErrNoServerShare = -2146368485
    COMAdminErrDllLoadFailed = -2146368483
    COMAdminErrBadRegistryLibID = -2146368482
    COMAdminErrAppDirNotFound = -2146368481
    COMAdminErrRegistrarFailed = -2146368477
    COMAdminErrCompFileDoesNotExist = -2146368476
    COMAdminErrCompFileLoadDLLFail = -2146368475
    COMAdminErrCompFileGetClassObj = -2146368474
    COMAdminErrCompFileClassNotAvail = -2146368473
    COMAdminErrCompFileBadTLB = -2146368472
    COMAdminErrCompFileNotInstallable = -2146368471
    COMAdminErrNotChangeable = -2146368470
    COMAdminErrNotDeletable = -2146368469
    COMAdminErrSession = -2146368468
    COMAdminErrCompMoveLocked = -2146368467
    COMAdminErrCompMoveBadDest = -2146368466
    COMAdminErrRegisterTLB = -2146368464
    COMAdminErrSystemApp = -2146368461
    COMAdminErrCompFileNoRegistrar = -2146368460
    COMAdminErrCoReqCompInstalled = -2146368459
    COMAdminErrServiceNotInstalled = -2146368458
    COMAdminErrPropertySaveFailed = -2146368457
    COMAdminErrObjectExists = -2146368456
    COMAdminErrComponentExists = -2146368455
    COMAdminErrRegFileCorrupt = -2146368453
    COMAdminErrPropertyOverflow = -2146368452
    COMAdminErrNotInRegistry = -2146368450
    COMAdminErrObjectNotPoolable = -2146368449
    COMAdminErrApplidMatchesClsid = -2146368442
    COMAdminErrRoleDoesNotExist = -2146368441
    COMAdminErrStartAppNeedsComponents = -2146368440
    COMAdminErrRequiresDifferentPlatform = -2146368439
    COMAdminErrQueuingServiceNotAvailable = -2146367998
    COMAdminErrObjectParentMissing = -2146367480
    COMAdminErrObjectDoesNotExist = -2146367479
    COMAdminErrCanNotExportAppProxy = -2146368438
    COMAdminErrCanNotStartApp = -2146368437
    COMAdminErrCanNotExportSystemApp = -2146368436
    COMAdminErrCanNotSubscribeToComponent = -2146368435
    COMAdminErrAppNotRunning = -2146367478
    COMAdminErrEventClassCannotBeSubscriber = -2146368434
    COMAdminErrLibAppProxyIncompatible = -2146368433
    COMAdminErrBasePartitionOnly = -2146368432
    COMAdminErrDuplicatePartitionName = -2146368425
    COMAdminErrPartitionInUse = -2146368423
    COMAdminErrImportedComponentsNotAllowed = -2146368421
    COMAdminErrRegdbNotInitialized = -2146368398
    COMAdminErrRegdbNotOpen = -2146368397
    COMAdminErrRegdbSystemErr = -2146368396
    COMAdminErrRegdbAlreadyRunning = -2146368395
    COMAdminErrMigVersionNotSupported = -2146368384
    COMAdminErrMigSchemaNotFound = -2146368383
    COMAdminErrCatBitnessMismatch = -2146368382
    COMAdminErrCatUnacceptableBitness = -2146368381
    COMAdminErrCatWrongAppBitnessBitness = -2146368380
    COMAdminErrCatPauseResumeNotSupported = -2146368379
    COMAdminErrCatServerFault = -2146368378
    COMAdminErrCantRecycleLibraryApps = -2146367473
    COMAdminErrCantRecycleServiceApps = -2146367471
    COMAdminErrProcessAlreadyRecycled = -2146367470
    COMAdminErrPausedProcessMayNotBeRecycled = -2146367469
    COMAdminErrInvalidPartition = -2146367477
    COMAdminErrPartitionMsiOnly = -2146367463
    COMAdminErrStartAppDisabled = -2146368431
    COMAdminErrCompMoveSource = -2146367460
    COMAdminErrCompMoveDest = -2146367459
    COMAdminErrCompMovePrivate = -2146367458
    COMAdminErrCannotCopyEventClass = -2146367456
  end

  enum TRACKING_COLL_TYPE : Int32
    TRKCOLL_PROCESSES = 0
    TRKCOLL_APPLICATIONS = 1
    TRKCOLL_COMPONENTS = 2
  end

  enum DUMPTYPE : Int32
    DUMPTYPE_FULL = 0
    DUMPTYPE_MINI = 1
    DUMPTYPE_NONE = 2
  end

  enum COMPLUS_APPTYPE : Int32
    APPTYPE_UNKNOWN = -1
    APPTYPE_SERVER = 1
    APPTYPE_LIBRARY = 0
    APPTYPE_SWC = 2
  end

  enum GetAppTrackerDataFlags : Int32
    GATD_INCLUDE_PROCESS_EXE_NAME = 1
    GATD_INCLUDE_LIBRARY_APPS = 2
    GATD_INCLUDE_SWC = 4
    GATD_INCLUDE_CLASS_NAME = 8
    GATD_INCLUDE_APPLICATION_NAME = 16
  end

  enum TransactionVote : Int32
    TxCommit = 0
    TxAbort = 1
  end

  enum CrmTransactionState : Int32
    TxState_Active = 0
    TxState_Committed = 1
    TxState_Aborted = 2
    TxState_Indoubt = 3
  end

  enum CSC_InheritanceConfig : Int32
    CSC_Inherit = 0
    CSC_Ignore = 1
  end

  enum CSC_ThreadPool : Int32
    CSC_ThreadPoolNone = 0
    CSC_ThreadPoolInherit = 1
    CSC_STAThreadPool = 2
    CSC_MTAThreadPool = 3
  end

  enum CSC_Binding : Int32
    CSC_NoBinding = 0
    CSC_BindToPoolThread = 1
  end

  enum CSC_TransactionConfig : Int32
    CSC_NoTransaction = 0
    CSC_IfContainerIsTransactional = 1
    CSC_CreateTransactionIfNecessary = 2
    CSC_NewTransaction = 3
  end

  enum CSC_SynchronizationConfig : Int32
    CSC_NoSynchronization = 0
    CSC_IfContainerIsSynchronized = 1
    CSC_NewSynchronizationIfNecessary = 2
    CSC_NewSynchronization = 3
  end

  enum CSC_TrackerConfig : Int32
    CSC_DontUseTracker = 0
    CSC_UseTracker = 1
  end

  enum CSC_PartitionConfig : Int32
    CSC_NoPartition = 0
    CSC_InheritPartition = 1
    CSC_NewPartition = 2
  end

  enum CSC_IISIntrinsicsConfig : Int32
    CSC_NoIISIntrinsics = 0
    CSC_InheritIISIntrinsics = 1
  end

  enum CSC_COMTIIntrinsicsConfig : Int32
    CSC_NoCOMTIIntrinsics = 0
    CSC_InheritCOMTIIntrinsics = 1
  end

  enum CSC_SxsConfig : Int32
    CSC_NoSxs = 0
    CSC_InheritSxs = 1
    CSC_NewSxs = 2
  end

  enum AutoSvcs_Error_Constants : UInt32
    Mtserrctxaborted = 2147803138
    Mtserrctxaborting = 2147803139
    Mtserrctxnocontext = 2147803140
    Mtserrctxnotregistered = 2147803141
    Mtserrctxsynchtimeout = 2147803142
    Mtserrctxoldreference = 2147803143
    Mtserrctxrolenotfound = 2147803148
    Mtserrctxnosecurity = 2147803149
    Mtserrctxwrongthread = 2147803150
    Mtserrctxtmnotavailable = 2147803151
    Comqcerrapplicationnotqueued = 2148599296
    Comqcerrnoqueueableinterfaces = 2148599297
    Comqcerrqueuingservicenotavailable = 2148599298
    Comqcerrqueuetransactmismatch = 2148599299
    Comqcerrrecordermarshalled = 2148599300
    Comqcerroutparam = 2148599301
    Comqcerrrecordernottrusted = 2148599302
    Comqcerrpsload = 2148599303
    Comqcerrmarshaledobjsametxn = 2148599304
    Comqcerrinvalidmessage = 2148599376
    Comqcerrmsmqsidunavailable = 2148599377
    Comqcerrwrongmsgextension = 2148599378
    Comqcerrmsmqserviceunavailable = 2148599379
    Comqcerrmsgnotauthenticated = 2148599380
    Comqcerrmsmqconnectorused = 2148599381
    Comqcerrbadmarshaledobject = 2148599382
  end

  enum LockModes : Int32
    LockSetGet = 0
    LockMethod = 1
  end

  enum ReleaseModes : Int32
    Standard = 0
    Process = 1
  end

  enum CRMFLAGS : Int32
    CRMFLAG_FORGETTARGET = 1
    CRMFLAG_WRITTENDURINGPREPARE = 2
    CRMFLAG_WRITTENDURINGCOMMIT = 4
    CRMFLAG_WRITTENDURINGABORT = 8
    CRMFLAG_WRITTENDURINGRECOVERY = 16
    CRMFLAG_WRITTENDURINGREPLAY = 32
    CRMFLAG_REPLAYINPROGRESS = 64
  end

  enum CRMREGFLAGS : Int32
    CRMREGFLAG_PREPAREPHASE = 1
    CRMREGFLAG_COMMITPHASE = 2
    CRMREGFLAG_ABORTPHASE = 4
    CRMREGFLAG_ALLPHASES = 7
    CRMREGFLAG_FAILIFINDOUBTSREMAIN = 16
  end

  struct COMSVCSEVENTINFO
    cb_size : UInt32
    dw_pid : UInt32
    l_time : Int64
    l_micro_time : Int32
    perf_count : Int64
    guid_app : Guid
    s_machine_name : LibC::LPWSTR
  end
  struct RECYCLE_INFO
    guid_combase_process_identifier : Guid
    process_start_time : Int64
    dw_recycle_lifetime_limit : UInt32
    dw_recycle_memory_limit : UInt32
    dw_recycle_expiration_timeout : UInt32
  end
  struct HANG_INFO
    f_app_hang_monitor_enabled : LibC::BOOL
    f_terminate_on_hang : LibC::BOOL
    dump_type : DUMPTYPE
    dw_hang_timeout : UInt32
    dw_dump_count : UInt32
    dw_info_msg_count : UInt32
  end
  struct CAppStatistics
    m_c_total_calls : UInt32
    m_c_total_instances : UInt32
    m_c_total_classes : UInt32
    m_c_calls_per_second : UInt32
  end
  struct CAppData
    m_id_app : UInt32
    m_sz_app_guid : Char[40]*
    m_dw_app_process_id : UInt32
    m_app_statistics : CAppStatistics
  end
  struct CCLSIDData
    m_clsid : Guid
    m_c_references : UInt32
    m_c_bound : UInt32
    m_c_pooled : UInt32
    m_c_in_call : UInt32
    m_dw_resp_time : UInt32
    m_c_calls_completed : UInt32
    m_c_calls_failed : UInt32
  end
  struct CCLSIDData2
    m_clsid : Guid
    m_appid : Guid
    m_partid : Guid
    m_pwsz_app_name : LibC::LPWSTR
    m_pwsz_ctx_name : LibC::LPWSTR
    m_e_app_type : COMPLUS_APPTYPE
    m_c_references : UInt32
    m_c_bound : UInt32
    m_c_pooled : UInt32
    m_c_in_call : UInt32
    m_dw_resp_time : UInt32
    m_c_calls_completed : UInt32
    m_c_calls_failed : UInt32
  end
  struct ApplicationProcessSummary
    partition_id_primary_application : Guid
    application_id_primary_application : Guid
    application_instance_id : Guid
    process_id : UInt32
    type : COMPLUS_APPTYPE
    process_exe_name : LibC::LPWSTR
    is_service : LibC::BOOL
    is_paused : LibC::BOOL
    is_recycled : LibC::BOOL
  end
  struct ApplicationProcessStatistics
    num_calls_outstanding : UInt32
    num_tracked_components : UInt32
    num_component_instances : UInt32
    avg_calls_per_second : UInt32
    reserved1 : UInt32
    reserved2 : UInt32
    reserved3 : UInt32
    reserved4 : UInt32
  end
  struct ApplicationProcessRecycleInfo
    is_recyclable : LibC::BOOL
    is_recycled : LibC::BOOL
    time_recycled : FILETIME
    time_to_terminate : FILETIME
    recycle_reason_code : Int32
    is_pending_recycle : LibC::BOOL
    has_automatic_lifetime_recycling : LibC::BOOL
    time_for_automatic_recycling : FILETIME
    memory_limit_in_kb : UInt32
    memory_usage_in_kb_last_check : UInt32
    activation_limit : UInt32
    num_activations_last_reported : UInt32
    call_limit : UInt32
    num_calls_last_reported : UInt32
  end
  struct ApplicationSummary
    application_instance_id : Guid
    partition_id : Guid
    application_id : Guid
    type : COMPLUS_APPTYPE
    application_name : LibC::LPWSTR
    num_tracked_components : UInt32
    num_component_instances : UInt32
  end
  struct ComponentSummary
    application_instance_id : Guid
    partition_id : Guid
    application_id : Guid
    clsid : Guid
    class_name : LibC::LPWSTR
    application_name : LibC::LPWSTR
  end
  struct ComponentStatistics
    num_instances : UInt32
    num_bound_references : UInt32
    num_pooled_objects : UInt32
    num_objects_in_call : UInt32
    avg_response_time_in_ms : UInt32
    num_calls_completed_recent : UInt32
    num_calls_failed_recent : UInt32
    num_calls_completed_total : UInt32
    num_calls_failed_total : UInt32
    reserved1 : UInt32
    reserved2 : UInt32
    reserved3 : UInt32
    reserved4 : UInt32
  end
  struct ComponentHangMonitorInfo
    is_monitored : LibC::BOOL
    terminate_on_hang : LibC::BOOL
    avg_call_threshold_in_ms : UInt32
  end
  struct CrmLogRecordRead
    dw_crm_flags : UInt32
    dw_sequence_number : UInt32
    blob_user_data : BLOB
  end


  struct ICOMAdminCatalogVTbl
    query_interface : Proc(ICOMAdminCatalog*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICOMAdminCatalog*, UInt32)
    release : Proc(ICOMAdminCatalog*, UInt32)
    get_type_info_count : Proc(ICOMAdminCatalog*, UInt32*, HRESULT)
    get_type_info : Proc(ICOMAdminCatalog*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICOMAdminCatalog*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICOMAdminCatalog*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_collection : Proc(ICOMAdminCatalog*, UInt8*, IDispatch*, HRESULT)
    connect : Proc(ICOMAdminCatalog*, UInt8*, IDispatch*, HRESULT)
    get_major_version : Proc(ICOMAdminCatalog*, Int32*, HRESULT)
    get_minor_version : Proc(ICOMAdminCatalog*, Int32*, HRESULT)
    get_collection_by_query : Proc(ICOMAdminCatalog*, UInt8*, SAFEARRAY**, IDispatch*, HRESULT)
    import_component : Proc(ICOMAdminCatalog*, UInt8*, UInt8*, HRESULT)
    install_component : Proc(ICOMAdminCatalog*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    shutdown_application : Proc(ICOMAdminCatalog*, UInt8*, HRESULT)
    export_application : Proc(ICOMAdminCatalog*, UInt8*, UInt8*, COMAdminApplicationExportOptions, HRESULT)
    install_application : Proc(ICOMAdminCatalog*, UInt8*, UInt8*, COMAdminApplicationInstallOptions, UInt8*, UInt8*, UInt8*, HRESULT)
    stop_router : Proc(ICOMAdminCatalog*, HRESULT)
    refresh_router : Proc(ICOMAdminCatalog*, HRESULT)
    start_router : Proc(ICOMAdminCatalog*, HRESULT)
    reserved1 : Proc(ICOMAdminCatalog*, HRESULT)
    reserved2 : Proc(ICOMAdminCatalog*, HRESULT)
    install_multiple_components : Proc(ICOMAdminCatalog*, UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)
    get_multiple_components_info : Proc(ICOMAdminCatalog*, UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)
    refresh_components : Proc(ICOMAdminCatalog*, HRESULT)
    backup_regdb : Proc(ICOMAdminCatalog*, UInt8*, HRESULT)
    restore_regdb : Proc(ICOMAdminCatalog*, UInt8*, HRESULT)
    query_application_file : Proc(ICOMAdminCatalog*, UInt8*, UInt8**, UInt8**, Int16*, Int16*, SAFEARRAY**, HRESULT)
    start_application : Proc(ICOMAdminCatalog*, UInt8*, HRESULT)
    service_check : Proc(ICOMAdminCatalog*, Int32, Int32*, HRESULT)
    install_multiple_event_classes : Proc(ICOMAdminCatalog*, UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)
    install_event_class : Proc(ICOMAdminCatalog*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_event_classes_for_iid : Proc(ICOMAdminCatalog*, UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)
  end

  ICOMAdminCatalog_GUID = LibC::GUID.new("dd662187-dfc2-11d1-a2cf-00805fc79235")
  CLSID_ICOMAdminCatalog = "dd662187-dfc2-11d1-a2cf-00805fc79235"
  struct ICOMAdminCatalog
    lpVtbl : ICOMAdminCatalogVTbl*
  end

  struct ICOMAdminCatalog2VTbl
    query_interface : Proc(ICOMAdminCatalog2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICOMAdminCatalog2*, UInt32)
    release : Proc(ICOMAdminCatalog2*, UInt32)
    get_type_info_count : Proc(ICOMAdminCatalog2*, UInt32*, HRESULT)
    get_type_info : Proc(ICOMAdminCatalog2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICOMAdminCatalog2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICOMAdminCatalog2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_collection : Proc(ICOMAdminCatalog2*, UInt8*, IDispatch*, HRESULT)
    connect : Proc(ICOMAdminCatalog2*, UInt8*, IDispatch*, HRESULT)
    get_major_version : Proc(ICOMAdminCatalog2*, Int32*, HRESULT)
    get_minor_version : Proc(ICOMAdminCatalog2*, Int32*, HRESULT)
    get_collection_by_query : Proc(ICOMAdminCatalog2*, UInt8*, SAFEARRAY**, IDispatch*, HRESULT)
    import_component : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, HRESULT)
    install_component : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    shutdown_application : Proc(ICOMAdminCatalog2*, UInt8*, HRESULT)
    export_application : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, COMAdminApplicationExportOptions, HRESULT)
    install_application : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, COMAdminApplicationInstallOptions, UInt8*, UInt8*, UInt8*, HRESULT)
    stop_router : Proc(ICOMAdminCatalog2*, HRESULT)
    refresh_router : Proc(ICOMAdminCatalog2*, HRESULT)
    start_router : Proc(ICOMAdminCatalog2*, HRESULT)
    reserved1 : Proc(ICOMAdminCatalog2*, HRESULT)
    reserved2 : Proc(ICOMAdminCatalog2*, HRESULT)
    install_multiple_components : Proc(ICOMAdminCatalog2*, UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)
    get_multiple_components_info : Proc(ICOMAdminCatalog2*, UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)
    refresh_components : Proc(ICOMAdminCatalog2*, HRESULT)
    backup_regdb : Proc(ICOMAdminCatalog2*, UInt8*, HRESULT)
    restore_regdb : Proc(ICOMAdminCatalog2*, UInt8*, HRESULT)
    query_application_file : Proc(ICOMAdminCatalog2*, UInt8*, UInt8**, UInt8**, Int16*, Int16*, SAFEARRAY**, HRESULT)
    start_application : Proc(ICOMAdminCatalog2*, UInt8*, HRESULT)
    service_check : Proc(ICOMAdminCatalog2*, Int32, Int32*, HRESULT)
    install_multiple_event_classes : Proc(ICOMAdminCatalog2*, UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)
    install_event_class : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_event_classes_for_iid : Proc(ICOMAdminCatalog2*, UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)
    get_collection_by_query2 : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, IDispatch*, HRESULT)
    get_application_instance_id_from_process_id : Proc(ICOMAdminCatalog2*, Int32, UInt8**, HRESULT)
    shutdown_application_instances : Proc(ICOMAdminCatalog2*, VARIANT*, HRESULT)
    pause_application_instances : Proc(ICOMAdminCatalog2*, VARIANT*, HRESULT)
    resume_application_instances : Proc(ICOMAdminCatalog2*, VARIANT*, HRESULT)
    recycle_application_instances : Proc(ICOMAdminCatalog2*, VARIANT*, Int32, HRESULT)
    are_application_instances_paused : Proc(ICOMAdminCatalog2*, VARIANT*, Int16*, HRESULT)
    dump_application_instance : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, Int32, UInt8**, HRESULT)
    get_is_application_instance_dump_supported : Proc(ICOMAdminCatalog2*, Int16*, HRESULT)
    create_service_for_application : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int16, HRESULT)
    delete_service_for_application : Proc(ICOMAdminCatalog2*, UInt8*, HRESULT)
    get_partition_id : Proc(ICOMAdminCatalog2*, UInt8*, UInt8**, HRESULT)
    get_partition_name : Proc(ICOMAdminCatalog2*, UInt8*, UInt8**, HRESULT)
    put_current_partition : Proc(ICOMAdminCatalog2*, UInt8*, HRESULT)
    get_current_partition_id : Proc(ICOMAdminCatalog2*, UInt8**, HRESULT)
    get_current_partition_name : Proc(ICOMAdminCatalog2*, UInt8**, HRESULT)
    get_global_partition_id : Proc(ICOMAdminCatalog2*, UInt8**, HRESULT)
    flush_partition_cache : Proc(ICOMAdminCatalog2*, HRESULT)
    copy_applications : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, UInt8*, HRESULT)
    copy_components : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, UInt8*, HRESULT)
    move_components : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, UInt8*, HRESULT)
    alias_component : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    is_safe_to_delete : Proc(ICOMAdminCatalog2*, UInt8*, COMAdminInUse*, HRESULT)
    import_unconfigured_components : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, VARIANT*, HRESULT)
    promote_unconfigured_components : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, VARIANT*, HRESULT)
    import_components : Proc(ICOMAdminCatalog2*, UInt8*, VARIANT*, VARIANT*, HRESULT)
    get_is64_bit_catalog_server : Proc(ICOMAdminCatalog2*, Int16*, HRESULT)
    export_partition : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, COMAdminApplicationExportOptions, HRESULT)
    install_partition : Proc(ICOMAdminCatalog2*, UInt8*, UInt8*, COMAdminApplicationInstallOptions, UInt8*, UInt8*, UInt8*, HRESULT)
    query_application_file2 : Proc(ICOMAdminCatalog2*, UInt8*, IDispatch*, HRESULT)
    get_component_version_count : Proc(ICOMAdminCatalog2*, UInt8*, Int32*, HRESULT)
  end

  ICOMAdminCatalog2_GUID = LibC::GUID.new("790c6e0b-9194-4cc9-9426-a48a63185696")
  CLSID_ICOMAdminCatalog2 = "790c6e0b-9194-4cc9-9426-a48a63185696"
  struct ICOMAdminCatalog2
    lpVtbl : ICOMAdminCatalog2VTbl*
  end

  struct ICatalogObjectVTbl
    query_interface : Proc(ICatalogObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICatalogObject*, UInt32)
    release : Proc(ICatalogObject*, UInt32)
    get_type_info_count : Proc(ICatalogObject*, UInt32*, HRESULT)
    get_type_info : Proc(ICatalogObject*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICatalogObject*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICatalogObject*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_value : Proc(ICatalogObject*, UInt8*, VARIANT*, HRESULT)
    put_value : Proc(ICatalogObject*, UInt8*, VARIANT, HRESULT)
    get_key : Proc(ICatalogObject*, VARIANT*, HRESULT)
    get_name : Proc(ICatalogObject*, VARIANT*, HRESULT)
    is_property_read_only : Proc(ICatalogObject*, UInt8*, Int16*, HRESULT)
    get_valid : Proc(ICatalogObject*, Int16*, HRESULT)
    is_property_write_only : Proc(ICatalogObject*, UInt8*, Int16*, HRESULT)
  end

  ICatalogObject_GUID = LibC::GUID.new("6eb22871-8a19-11d0-81b6-00a0c9231c29")
  CLSID_ICatalogObject = "6eb22871-8a19-11d0-81b6-00a0c9231c29"
  struct ICatalogObject
    lpVtbl : ICatalogObjectVTbl*
  end

  struct ICatalogCollectionVTbl
    query_interface : Proc(ICatalogCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICatalogCollection*, UInt32)
    release : Proc(ICatalogCollection*, UInt32)
    get_type_info_count : Proc(ICatalogCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ICatalogCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICatalogCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICatalogCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(ICatalogCollection*, IUnknown*, HRESULT)
    get_item : Proc(ICatalogCollection*, Int32, IDispatch*, HRESULT)
    get_count : Proc(ICatalogCollection*, Int32*, HRESULT)
    remove : Proc(ICatalogCollection*, Int32, HRESULT)
    add : Proc(ICatalogCollection*, IDispatch*, HRESULT)
    populate : Proc(ICatalogCollection*, HRESULT)
    save_changes : Proc(ICatalogCollection*, Int32*, HRESULT)
    get_collection : Proc(ICatalogCollection*, UInt8*, VARIANT, IDispatch*, HRESULT)
    get_name : Proc(ICatalogCollection*, VARIANT*, HRESULT)
    get_add_enabled : Proc(ICatalogCollection*, Int16*, HRESULT)
    get_remove_enabled : Proc(ICatalogCollection*, Int16*, HRESULT)
    get_util_interface : Proc(ICatalogCollection*, IDispatch*, HRESULT)
    get_data_store_major_version : Proc(ICatalogCollection*, Int32*, HRESULT)
    get_data_store_minor_version : Proc(ICatalogCollection*, Int32*, HRESULT)
    populate_by_key : Proc(ICatalogCollection*, SAFEARRAY*, HRESULT)
    populate_by_query : Proc(ICatalogCollection*, UInt8*, Int32, HRESULT)
  end

  ICatalogCollection_GUID = LibC::GUID.new("6eb22872-8a19-11d0-81b6-00a0c9231c29")
  CLSID_ICatalogCollection = "6eb22872-8a19-11d0-81b6-00a0c9231c29"
  struct ICatalogCollection
    lpVtbl : ICatalogCollectionVTbl*
  end

  struct ISecurityIdentityCollVTbl
    query_interface : Proc(ISecurityIdentityColl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityIdentityColl*, UInt32)
    release : Proc(ISecurityIdentityColl*, UInt32)
    get_type_info_count : Proc(ISecurityIdentityColl*, UInt32*, HRESULT)
    get_type_info : Proc(ISecurityIdentityColl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISecurityIdentityColl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISecurityIdentityColl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISecurityIdentityColl*, Int32*, HRESULT)
    get_item : Proc(ISecurityIdentityColl*, UInt8*, VARIANT*, HRESULT)
    get__new_enum : Proc(ISecurityIdentityColl*, IUnknown*, HRESULT)
  end

  ISecurityIdentityColl_GUID = LibC::GUID.new("cafc823c-b441-11d1-b82b-0000f8757e2a")
  CLSID_ISecurityIdentityColl = "cafc823c-b441-11d1-b82b-0000f8757e2a"
  struct ISecurityIdentityColl
    lpVtbl : ISecurityIdentityCollVTbl*
  end

  struct ISecurityCallersCollVTbl
    query_interface : Proc(ISecurityCallersColl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityCallersColl*, UInt32)
    release : Proc(ISecurityCallersColl*, UInt32)
    get_type_info_count : Proc(ISecurityCallersColl*, UInt32*, HRESULT)
    get_type_info : Proc(ISecurityCallersColl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISecurityCallersColl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISecurityCallersColl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISecurityCallersColl*, Int32*, HRESULT)
    get_item : Proc(ISecurityCallersColl*, Int32, ISecurityIdentityColl*, HRESULT)
    get__new_enum : Proc(ISecurityCallersColl*, IUnknown*, HRESULT)
  end

  ISecurityCallersColl_GUID = LibC::GUID.new("cafc823d-b441-11d1-b82b-0000f8757e2a")
  CLSID_ISecurityCallersColl = "cafc823d-b441-11d1-b82b-0000f8757e2a"
  struct ISecurityCallersColl
    lpVtbl : ISecurityCallersCollVTbl*
  end

  struct ISecurityCallContextVTbl
    query_interface : Proc(ISecurityCallContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityCallContext*, UInt32)
    release : Proc(ISecurityCallContext*, UInt32)
    get_type_info_count : Proc(ISecurityCallContext*, UInt32*, HRESULT)
    get_type_info : Proc(ISecurityCallContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISecurityCallContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISecurityCallContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(ISecurityCallContext*, Int32*, HRESULT)
    get_item : Proc(ISecurityCallContext*, UInt8*, VARIANT*, HRESULT)
    get__new_enum : Proc(ISecurityCallContext*, IUnknown*, HRESULT)
    is_caller_in_role : Proc(ISecurityCallContext*, UInt8*, Int16*, HRESULT)
    is_security_enabled : Proc(ISecurityCallContext*, Int16*, HRESULT)
    is_user_in_role : Proc(ISecurityCallContext*, VARIANT*, UInt8*, Int16*, HRESULT)
  end

  ISecurityCallContext_GUID = LibC::GUID.new("cafc823e-b441-11d1-b82b-0000f8757e2a")
  CLSID_ISecurityCallContext = "cafc823e-b441-11d1-b82b-0000f8757e2a"
  struct ISecurityCallContext
    lpVtbl : ISecurityCallContextVTbl*
  end

  struct IGetSecurityCallContextVTbl
    query_interface : Proc(IGetSecurityCallContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGetSecurityCallContext*, UInt32)
    release : Proc(IGetSecurityCallContext*, UInt32)
    get_type_info_count : Proc(IGetSecurityCallContext*, UInt32*, HRESULT)
    get_type_info : Proc(IGetSecurityCallContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IGetSecurityCallContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IGetSecurityCallContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_security_call_context : Proc(IGetSecurityCallContext*, ISecurityCallContext*, HRESULT)
  end

  IGetSecurityCallContext_GUID = LibC::GUID.new("cafc823f-b441-11d1-b82b-0000f8757e2a")
  CLSID_IGetSecurityCallContext = "cafc823f-b441-11d1-b82b-0000f8757e2a"
  struct IGetSecurityCallContext
    lpVtbl : IGetSecurityCallContextVTbl*
  end

  struct SecurityPropertyVTbl
    query_interface : Proc(SecurityProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(SecurityProperty*, UInt32)
    release : Proc(SecurityProperty*, UInt32)
    get_type_info_count : Proc(SecurityProperty*, UInt32*, HRESULT)
    get_type_info : Proc(SecurityProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(SecurityProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(SecurityProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_direct_caller_name : Proc(SecurityProperty*, UInt8**, HRESULT)
    get_direct_creator_name : Proc(SecurityProperty*, UInt8**, HRESULT)
    get_original_caller_name : Proc(SecurityProperty*, UInt8**, HRESULT)
    get_original_creator_name : Proc(SecurityProperty*, UInt8**, HRESULT)
  end

  SecurityProperty_GUID = LibC::GUID.new("e74a7215-014d-11d1-a63c-00a0c911b4e0")
  CLSID_SecurityProperty = "e74a7215-014d-11d1-a63c-00a0c911b4e0"
  struct SecurityProperty
    lpVtbl : SecurityPropertyVTbl*
  end

  struct ContextInfoVTbl
    query_interface : Proc(ContextInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ContextInfo*, UInt32)
    release : Proc(ContextInfo*, UInt32)
    get_type_info_count : Proc(ContextInfo*, UInt32*, HRESULT)
    get_type_info : Proc(ContextInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ContextInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ContextInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    is_in_transaction : Proc(ContextInfo*, Int16*, HRESULT)
    get_transaction : Proc(ContextInfo*, IUnknown*, HRESULT)
    get_transaction_id : Proc(ContextInfo*, UInt8**, HRESULT)
    get_activity_id : Proc(ContextInfo*, UInt8**, HRESULT)
    get_context_id : Proc(ContextInfo*, UInt8**, HRESULT)
  end

  ContextInfo_GUID = LibC::GUID.new("19a5a02c-0ac8-11d2-b286-00c04f8ef934")
  CLSID_ContextInfo = "19a5a02c-0ac8-11d2-b286-00c04f8ef934"
  struct ContextInfo
    lpVtbl : ContextInfoVTbl*
  end

  struct ContextInfo2VTbl
    query_interface : Proc(ContextInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ContextInfo2*, UInt32)
    release : Proc(ContextInfo2*, UInt32)
    get_type_info_count : Proc(ContextInfo2*, UInt32*, HRESULT)
    get_type_info : Proc(ContextInfo2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ContextInfo2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ContextInfo2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    is_in_transaction : Proc(ContextInfo2*, Int16*, HRESULT)
    get_transaction : Proc(ContextInfo2*, IUnknown*, HRESULT)
    get_transaction_id : Proc(ContextInfo2*, UInt8**, HRESULT)
    get_activity_id : Proc(ContextInfo2*, UInt8**, HRESULT)
    get_context_id : Proc(ContextInfo2*, UInt8**, HRESULT)
    get_partition_id : Proc(ContextInfo2*, UInt8**, HRESULT)
    get_application_id : Proc(ContextInfo2*, UInt8**, HRESULT)
    get_application_instance_id : Proc(ContextInfo2*, UInt8**, HRESULT)
  end

  ContextInfo2_GUID = LibC::GUID.new("c99d6e75-2375-11d4-8331-00c04f605588")
  CLSID_ContextInfo2 = "c99d6e75-2375-11d4-8331-00c04f605588"
  struct ContextInfo2
    lpVtbl : ContextInfo2VTbl*
  end

  struct ObjectContextVTbl
    query_interface : Proc(ObjectContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ObjectContext*, UInt32)
    release : Proc(ObjectContext*, UInt32)
    get_type_info_count : Proc(ObjectContext*, UInt32*, HRESULT)
    get_type_info : Proc(ObjectContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ObjectContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ObjectContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_instance : Proc(ObjectContext*, UInt8*, VARIANT*, HRESULT)
    set_complete : Proc(ObjectContext*, HRESULT)
    set_abort : Proc(ObjectContext*, HRESULT)
    enable_commit : Proc(ObjectContext*, HRESULT)
    disable_commit : Proc(ObjectContext*, HRESULT)
    is_in_transaction : Proc(ObjectContext*, Int16*, HRESULT)
    is_security_enabled : Proc(ObjectContext*, Int16*, HRESULT)
    is_caller_in_role : Proc(ObjectContext*, UInt8*, Int16*, HRESULT)
    get_count : Proc(ObjectContext*, Int32*, HRESULT)
    get_item : Proc(ObjectContext*, UInt8*, VARIANT*, HRESULT)
    get__new_enum : Proc(ObjectContext*, IUnknown*, HRESULT)
    get_security : Proc(ObjectContext*, SecurityProperty*, HRESULT)
    get_context_info : Proc(ObjectContext*, ContextInfo*, HRESULT)
  end

  ObjectContext_GUID = LibC::GUID.new("74c08646-cedb-11cf-8b49-00aa00b8a790")
  CLSID_ObjectContext = "74c08646-cedb-11cf-8b49-00aa00b8a790"
  struct ObjectContext
    lpVtbl : ObjectContextVTbl*
  end

  struct ITransactionContextExVTbl
    query_interface : Proc(ITransactionContextEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionContextEx*, UInt32)
    release : Proc(ITransactionContextEx*, UInt32)
    create_instance : Proc(ITransactionContextEx*, Guid*, Guid*, Void**, HRESULT)
    commit : Proc(ITransactionContextEx*, HRESULT)
    abort : Proc(ITransactionContextEx*, HRESULT)
  end

  ITransactionContextEx_GUID = LibC::GUID.new("7999fc22-d3c6-11cf-acab-00a024a55aef")
  CLSID_ITransactionContextEx = "7999fc22-d3c6-11cf-acab-00a024a55aef"
  struct ITransactionContextEx
    lpVtbl : ITransactionContextExVTbl*
  end

  struct ITransactionContextVTbl
    query_interface : Proc(ITransactionContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionContext*, UInt32)
    release : Proc(ITransactionContext*, UInt32)
    get_type_info_count : Proc(ITransactionContext*, UInt32*, HRESULT)
    get_type_info : Proc(ITransactionContext*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ITransactionContext*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ITransactionContext*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_instance : Proc(ITransactionContext*, UInt8*, VARIANT*, HRESULT)
    commit : Proc(ITransactionContext*, HRESULT)
    abort : Proc(ITransactionContext*, HRESULT)
  end

  ITransactionContext_GUID = LibC::GUID.new("7999fc21-d3c6-11cf-acab-00a024a55aef")
  CLSID_ITransactionContext = "7999fc21-d3c6-11cf-acab-00a024a55aef"
  struct ITransactionContext
    lpVtbl : ITransactionContextVTbl*
  end

  struct ICreateWithTransactionExVTbl
    query_interface : Proc(ICreateWithTransactionEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateWithTransactionEx*, UInt32)
    release : Proc(ICreateWithTransactionEx*, UInt32)
    create_instance : Proc(ICreateWithTransactionEx*, ITransaction, Guid*, Guid*, Void**, HRESULT)
  end

  ICreateWithTransactionEx_GUID = LibC::GUID.new("455acf57-5345-11d2-99cf-00c04f797bc9")
  CLSID_ICreateWithTransactionEx = "455acf57-5345-11d2-99cf-00c04f797bc9"
  struct ICreateWithTransactionEx
    lpVtbl : ICreateWithTransactionExVTbl*
  end

  struct ICreateWithLocalTransactionVTbl
    query_interface : Proc(ICreateWithLocalTransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateWithLocalTransaction*, UInt32)
    release : Proc(ICreateWithLocalTransaction*, UInt32)
    create_instance_with_sys_tx : Proc(ICreateWithLocalTransaction*, IUnknown, Guid*, Guid*, Void**, HRESULT)
  end

  ICreateWithLocalTransaction_GUID = LibC::GUID.new("227ac7a8-8423-42ce-b7cf-03061ec9aaa3")
  CLSID_ICreateWithLocalTransaction = "227ac7a8-8423-42ce-b7cf-03061ec9aaa3"
  struct ICreateWithLocalTransaction
    lpVtbl : ICreateWithLocalTransactionVTbl*
  end

  struct ICreateWithTipTransactionExVTbl
    query_interface : Proc(ICreateWithTipTransactionEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateWithTipTransactionEx*, UInt32)
    release : Proc(ICreateWithTipTransactionEx*, UInt32)
    create_instance : Proc(ICreateWithTipTransactionEx*, UInt8*, Guid*, Guid*, Void**, HRESULT)
  end

  ICreateWithTipTransactionEx_GUID = LibC::GUID.new("455acf59-5345-11d2-99cf-00c04f797bc9")
  CLSID_ICreateWithTipTransactionEx = "455acf59-5345-11d2-99cf-00c04f797bc9"
  struct ICreateWithTipTransactionEx
    lpVtbl : ICreateWithTipTransactionExVTbl*
  end

  struct IComLTxEventsVTbl
    query_interface : Proc(IComLTxEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComLTxEvents*, UInt32)
    release : Proc(IComLTxEvents*, UInt32)
    on_ltx_transaction_start : Proc(IComLTxEvents*, COMSVCSEVENTINFO*, Guid, Guid, LibC::BOOL, Int32, HRESULT)
    on_ltx_transaction_prepare : Proc(IComLTxEvents*, COMSVCSEVENTINFO*, Guid, LibC::BOOL, HRESULT)
    on_ltx_transaction_abort : Proc(IComLTxEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_ltx_transaction_commit : Proc(IComLTxEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_ltx_transaction_promote : Proc(IComLTxEvents*, COMSVCSEVENTINFO*, Guid, Guid, HRESULT)
  end

  IComLTxEvents_GUID = LibC::GUID.new("605cf82c-578e-4298-975d-82babcd9e053")
  CLSID_IComLTxEvents = "605cf82c-578e-4298-975d-82babcd9e053"
  struct IComLTxEvents
    lpVtbl : IComLTxEventsVTbl*
  end

  struct IComUserEventVTbl
    query_interface : Proc(IComUserEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComUserEvent*, UInt32)
    release : Proc(IComUserEvent*, UInt32)
    on_user_event : Proc(IComUserEvent*, COMSVCSEVENTINFO*, VARIANT*, HRESULT)
  end

  IComUserEvent_GUID = LibC::GUID.new("683130a4-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComUserEvent = "683130a4-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComUserEvent
    lpVtbl : IComUserEventVTbl*
  end

  struct IComThreadEventsVTbl
    query_interface : Proc(IComThreadEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComThreadEvents*, UInt32)
    release : Proc(IComThreadEvents*, UInt32)
    on_thread_start : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt32, UInt32, HRESULT)
    on_thread_terminate : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt32, UInt32, HRESULT)
    on_thread_bind_to_apartment : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, UInt32, HRESULT)
    on_thread_un_bind : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)
    on_thread_work_enque : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)
    on_thread_work_private : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, HRESULT)
    on_thread_work_public : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)
    on_thread_work_redirect : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, UInt64, HRESULT)
    on_thread_work_reject : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)
    on_thread_assign_apartment : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, Guid*, UInt64, HRESULT)
    on_thread_unassign_apartment : Proc(IComThreadEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT)
  end

  IComThreadEvents_GUID = LibC::GUID.new("683130a5-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComThreadEvents = "683130a5-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComThreadEvents
    lpVtbl : IComThreadEventsVTbl*
  end

  struct IComAppEventsVTbl
    query_interface : Proc(IComAppEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComAppEvents*, UInt32)
    release : Proc(IComAppEvents*, UInt32)
    on_app_activation : Proc(IComAppEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_app_shutdown : Proc(IComAppEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_app_force_shutdown : Proc(IComAppEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
  end

  IComAppEvents_GUID = LibC::GUID.new("683130a6-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComAppEvents = "683130a6-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComAppEvents
    lpVtbl : IComAppEventsVTbl*
  end

  struct IComInstanceEventsVTbl
    query_interface : Proc(IComInstanceEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComInstanceEvents*, UInt32)
    release : Proc(IComInstanceEvents*, UInt32)
    on_object_create : Proc(IComInstanceEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, UInt64, HRESULT)
    on_object_destroy : Proc(IComInstanceEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT)
  end

  IComInstanceEvents_GUID = LibC::GUID.new("683130a7-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComInstanceEvents = "683130a7-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComInstanceEvents
    lpVtbl : IComInstanceEventsVTbl*
  end

  struct IComTransactionEventsVTbl
    query_interface : Proc(IComTransactionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTransactionEvents*, UInt32)
    release : Proc(IComTransactionEvents*, UInt32)
    on_transaction_start : Proc(IComTransactionEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, LibC::BOOL, HRESULT)
    on_transaction_prepare : Proc(IComTransactionEvents*, COMSVCSEVENTINFO*, Guid*, LibC::BOOL, HRESULT)
    on_transaction_abort : Proc(IComTransactionEvents*, COMSVCSEVENTINFO*, Guid*, HRESULT)
    on_transaction_commit : Proc(IComTransactionEvents*, COMSVCSEVENTINFO*, Guid*, HRESULT)
  end

  IComTransactionEvents_GUID = LibC::GUID.new("683130a8-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComTransactionEvents = "683130a8-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComTransactionEvents
    lpVtbl : IComTransactionEventsVTbl*
  end

  struct IComMethodEventsVTbl
    query_interface : Proc(IComMethodEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComMethodEvents*, UInt32)
    release : Proc(IComMethodEvents*, UInt32)
    on_method_call : Proc(IComMethodEvents*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, HRESULT)
    on_method_return : Proc(IComMethodEvents*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, HRESULT, HRESULT)
    on_method_exception : Proc(IComMethodEvents*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, HRESULT)
  end

  IComMethodEvents_GUID = LibC::GUID.new("683130a9-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComMethodEvents = "683130a9-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComMethodEvents
    lpVtbl : IComMethodEventsVTbl*
  end

  struct IComObjectEventsVTbl
    query_interface : Proc(IComObjectEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectEvents*, UInt32)
    release : Proc(IComObjectEvents*, UInt32)
    on_object_activate : Proc(IComObjectEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, HRESULT)
    on_object_deactivate : Proc(IComObjectEvents*, COMSVCSEVENTINFO*, UInt64, UInt64, HRESULT)
    on_disable_commit : Proc(IComObjectEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT)
    on_enable_commit : Proc(IComObjectEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT)
    on_set_complete : Proc(IComObjectEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT)
    on_set_abort : Proc(IComObjectEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT)
  end

  IComObjectEvents_GUID = LibC::GUID.new("683130aa-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComObjectEvents = "683130aa-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComObjectEvents
    lpVtbl : IComObjectEventsVTbl*
  end

  struct IComResourceEventsVTbl
    query_interface : Proc(IComResourceEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComResourceEvents*, UInt32)
    release : Proc(IComResourceEvents*, UInt32)
    on_resource_create : Proc(IComResourceEvents*, COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, LibC::BOOL, HRESULT)
    on_resource_allocate : Proc(IComResourceEvents*, COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, LibC::BOOL, UInt32, UInt32, HRESULT)
    on_resource_recycle : Proc(IComResourceEvents*, COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, HRESULT)
    on_resource_destroy : Proc(IComResourceEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT, LibC::LPWSTR, UInt64, HRESULT)
    on_resource_track : Proc(IComResourceEvents*, COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, LibC::BOOL, HRESULT)
  end

  IComResourceEvents_GUID = LibC::GUID.new("683130ab-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComResourceEvents = "683130ab-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComResourceEvents
    lpVtbl : IComResourceEventsVTbl*
  end

  struct IComSecurityEventsVTbl
    query_interface : Proc(IComSecurityEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComSecurityEvents*, UInt32)
    release : Proc(IComSecurityEvents*, UInt32)
    on_authenticate : Proc(IComSecurityEvents*, COMSVCSEVENTINFO*, Guid*, UInt64, Guid*, UInt32, UInt32, UInt8*, UInt32, UInt8*, LibC::BOOL, HRESULT)
    on_authenticate_fail : Proc(IComSecurityEvents*, COMSVCSEVENTINFO*, Guid*, UInt64, Guid*, UInt32, UInt32, UInt8*, UInt32, UInt8*, LibC::BOOL, HRESULT)
  end

  IComSecurityEvents_GUID = LibC::GUID.new("683130ac-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComSecurityEvents = "683130ac-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComSecurityEvents
    lpVtbl : IComSecurityEventsVTbl*
  end

  struct IComObjectPoolEventsVTbl
    query_interface : Proc(IComObjectPoolEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectPoolEvents*, UInt32)
    release : Proc(IComObjectPoolEvents*, UInt32)
    on_obj_pool_put_object : Proc(IComObjectPoolEvents*, COMSVCSEVENTINFO*, Guid*, Int32, UInt32, UInt64, HRESULT)
    on_obj_pool_get_object : Proc(IComObjectPoolEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, UInt64, HRESULT)
    on_obj_pool_recycle_to_tx : Proc(IComObjectPoolEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, HRESULT)
    on_obj_pool_get_from_tx : Proc(IComObjectPoolEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, HRESULT)
  end

  IComObjectPoolEvents_GUID = LibC::GUID.new("683130ad-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComObjectPoolEvents = "683130ad-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComObjectPoolEvents
    lpVtbl : IComObjectPoolEventsVTbl*
  end

  struct IComObjectPoolEvents2VTbl
    query_interface : Proc(IComObjectPoolEvents2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectPoolEvents2*, UInt32)
    release : Proc(IComObjectPoolEvents2*, UInt32)
    on_obj_pool_create_object : Proc(IComObjectPoolEvents2*, COMSVCSEVENTINFO*, Guid*, UInt32, UInt64, HRESULT)
    on_obj_pool_destroy_object : Proc(IComObjectPoolEvents2*, COMSVCSEVENTINFO*, Guid*, UInt32, UInt64, HRESULT)
    on_obj_pool_create_decision : Proc(IComObjectPoolEvents2*, COMSVCSEVENTINFO*, UInt32, UInt32, UInt32, UInt32, UInt32, HRESULT)
    on_obj_pool_timeout : Proc(IComObjectPoolEvents2*, COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, HRESULT)
    on_obj_pool_create_pool : Proc(IComObjectPoolEvents2*, COMSVCSEVENTINFO*, Guid*, UInt32, UInt32, UInt32, HRESULT)
  end

  IComObjectPoolEvents2_GUID = LibC::GUID.new("683130ae-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComObjectPoolEvents2 = "683130ae-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComObjectPoolEvents2
    lpVtbl : IComObjectPoolEvents2VTbl*
  end

  struct IComObjectConstructionEventsVTbl
    query_interface : Proc(IComObjectConstructionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectConstructionEvents*, UInt32)
    release : Proc(IComObjectConstructionEvents*, UInt32)
    on_object_construct : Proc(IComObjectConstructionEvents*, COMSVCSEVENTINFO*, Guid*, LibC::LPWSTR, UInt64, HRESULT)
  end

  IComObjectConstructionEvents_GUID = LibC::GUID.new("683130af-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComObjectConstructionEvents = "683130af-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComObjectConstructionEvents
    lpVtbl : IComObjectConstructionEventsVTbl*
  end

  struct IComActivityEventsVTbl
    query_interface : Proc(IComActivityEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComActivityEvents*, UInt32)
    release : Proc(IComActivityEvents*, UInt32)
    on_activity_create : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, HRESULT)
    on_activity_destroy : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, HRESULT)
    on_activity_enter : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, HRESULT)
    on_activity_timeout : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, UInt32, HRESULT)
    on_activity_reenter : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, UInt32, UInt32, HRESULT)
    on_activity_leave : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, HRESULT)
    on_activity_leave_same : Proc(IComActivityEvents*, COMSVCSEVENTINFO*, Guid*, UInt32, HRESULT)
  end

  IComActivityEvents_GUID = LibC::GUID.new("683130b0-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComActivityEvents = "683130b0-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComActivityEvents
    lpVtbl : IComActivityEventsVTbl*
  end

  struct IComIdentityEventsVTbl
    query_interface : Proc(IComIdentityEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComIdentityEvents*, UInt32)
    release : Proc(IComIdentityEvents*, UInt32)
    on_iis_request_info : Proc(IComIdentityEvents*, COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IComIdentityEvents_GUID = LibC::GUID.new("683130b1-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComIdentityEvents = "683130b1-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComIdentityEvents
    lpVtbl : IComIdentityEventsVTbl*
  end

  struct IComQCEventsVTbl
    query_interface : Proc(IComQCEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComQCEvents*, UInt32)
    release : Proc(IComQCEvents*, UInt32)
    on_qc_record : Proc(IComQCEvents*, COMSVCSEVENTINFO*, UInt64, Char*, Guid*, Guid*, HRESULT, HRESULT)
    on_qc_queue_open : Proc(IComQCEvents*, COMSVCSEVENTINFO*, Char*, UInt64, HRESULT, HRESULT)
    on_qc_receive : Proc(IComQCEvents*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, HRESULT, HRESULT)
    on_qc_receive_fail : Proc(IComQCEvents*, COMSVCSEVENTINFO*, UInt64, HRESULT, HRESULT)
    on_qc_move_to_re_try_queue : Proc(IComQCEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, HRESULT)
    on_qc_move_to_dead_queue : Proc(IComQCEvents*, COMSVCSEVENTINFO*, Guid*, Guid*, HRESULT)
    on_qc_playback : Proc(IComQCEvents*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, HRESULT, HRESULT)
  end

  IComQCEvents_GUID = LibC::GUID.new("683130b2-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComQCEvents = "683130b2-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComQCEvents
    lpVtbl : IComQCEventsVTbl*
  end

  struct IComExceptionEventsVTbl
    query_interface : Proc(IComExceptionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComExceptionEvents*, UInt32)
    release : Proc(IComExceptionEvents*, UInt32)
    on_exception_user : Proc(IComExceptionEvents*, COMSVCSEVENTINFO*, UInt32, UInt64, LibC::LPWSTR, HRESULT)
  end

  IComExceptionEvents_GUID = LibC::GUID.new("683130b3-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComExceptionEvents = "683130b3-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComExceptionEvents
    lpVtbl : IComExceptionEventsVTbl*
  end

  struct ILBEventsVTbl
    query_interface : Proc(ILBEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILBEvents*, UInt32)
    release : Proc(ILBEvents*, UInt32)
    target_up : Proc(ILBEvents*, UInt8*, UInt8*, HRESULT)
    target_down : Proc(ILBEvents*, UInt8*, UInt8*, HRESULT)
    engine_defined : Proc(ILBEvents*, UInt8*, VARIANT*, UInt8*, HRESULT)
  end

  ILBEvents_GUID = LibC::GUID.new("683130b4-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_ILBEvents = "683130b4-2e50-11d2-98a5-00c04f8ee1c4"
  struct ILBEvents
    lpVtbl : ILBEventsVTbl*
  end

  struct IComCRMEventsVTbl
    query_interface : Proc(IComCRMEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComCRMEvents*, UInt32)
    release : Proc(IComCRMEvents*, UInt32)
    on_crm_recovery_start : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_recovery_done : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_checkpoint : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_begin : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, Guid, Guid, Char*, Char*, HRESULT)
    on_crm_prepare : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_commit : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_abort : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_indoubt : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_done : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_release : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_analyze : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, UInt32, UInt32, HRESULT)
    on_crm_write : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, LibC::BOOL, UInt32, HRESULT)
    on_crm_forget : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_force : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_crm_deliver : Proc(IComCRMEvents*, COMSVCSEVENTINFO*, Guid, LibC::BOOL, UInt32, HRESULT)
  end

  IComCRMEvents_GUID = LibC::GUID.new("683130b5-2e50-11d2-98a5-00c04f8ee1c4")
  CLSID_IComCRMEvents = "683130b5-2e50-11d2-98a5-00c04f8ee1c4"
  struct IComCRMEvents
    lpVtbl : IComCRMEventsVTbl*
  end

  struct IComMethod2EventsVTbl
    query_interface : Proc(IComMethod2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComMethod2Events*, UInt32)
    release : Proc(IComMethod2Events*, UInt32)
    on_method_call2 : Proc(IComMethod2Events*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, UInt32, HRESULT)
    on_method_return2 : Proc(IComMethod2Events*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, UInt32, HRESULT, HRESULT)
    on_method_exception2 : Proc(IComMethod2Events*, COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, UInt32, HRESULT)
  end

  IComMethod2Events_GUID = LibC::GUID.new("fb388aaa-567d-4024-af8e-6e93ee748573")
  CLSID_IComMethod2Events = "fb388aaa-567d-4024-af8e-6e93ee748573"
  struct IComMethod2Events
    lpVtbl : IComMethod2EventsVTbl*
  end

  struct IComTrackingInfoEventsVTbl
    query_interface : Proc(IComTrackingInfoEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTrackingInfoEvents*, UInt32)
    release : Proc(IComTrackingInfoEvents*, UInt32)
    on_new_tracking_info : Proc(IComTrackingInfoEvents*, IUnknown, HRESULT)
  end

  IComTrackingInfoEvents_GUID = LibC::GUID.new("4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec")
  CLSID_IComTrackingInfoEvents = "4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec"
  struct IComTrackingInfoEvents
    lpVtbl : IComTrackingInfoEventsVTbl*
  end

  struct IComTrackingInfoCollectionVTbl
    query_interface : Proc(IComTrackingInfoCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTrackingInfoCollection*, UInt32)
    release : Proc(IComTrackingInfoCollection*, UInt32)
    type : Proc(IComTrackingInfoCollection*, TRACKING_COLL_TYPE*, HRESULT)
    count : Proc(IComTrackingInfoCollection*, UInt32*, HRESULT)
    item : Proc(IComTrackingInfoCollection*, UInt32, Guid*, Void**, HRESULT)
  end

  IComTrackingInfoCollection_GUID = LibC::GUID.new("c266c677-c9ad-49ab-9fd9-d9661078588a")
  CLSID_IComTrackingInfoCollection = "c266c677-c9ad-49ab-9fd9-d9661078588a"
  struct IComTrackingInfoCollection
    lpVtbl : IComTrackingInfoCollectionVTbl*
  end

  struct IComTrackingInfoObjectVTbl
    query_interface : Proc(IComTrackingInfoObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTrackingInfoObject*, UInt32)
    release : Proc(IComTrackingInfoObject*, UInt32)
    get_value : Proc(IComTrackingInfoObject*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  IComTrackingInfoObject_GUID = LibC::GUID.new("116e42c5-d8b1-47bf-ab1e-c895ed3e2372")
  CLSID_IComTrackingInfoObject = "116e42c5-d8b1-47bf-ab1e-c895ed3e2372"
  struct IComTrackingInfoObject
    lpVtbl : IComTrackingInfoObjectVTbl*
  end

  struct IComTrackingInfoPropertiesVTbl
    query_interface : Proc(IComTrackingInfoProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTrackingInfoProperties*, UInt32)
    release : Proc(IComTrackingInfoProperties*, UInt32)
    prop_count : Proc(IComTrackingInfoProperties*, UInt32*, HRESULT)
    get_prop_name : Proc(IComTrackingInfoProperties*, UInt32, LibC::LPWSTR*, HRESULT)
  end

  IComTrackingInfoProperties_GUID = LibC::GUID.new("789b42be-6f6b-443a-898e-67abf390aa14")
  CLSID_IComTrackingInfoProperties = "789b42be-6f6b-443a-898e-67abf390aa14"
  struct IComTrackingInfoProperties
    lpVtbl : IComTrackingInfoPropertiesVTbl*
  end

  struct IComApp2EventsVTbl
    query_interface : Proc(IComApp2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComApp2Events*, UInt32)
    release : Proc(IComApp2Events*, UInt32)
    on_app_activation2 : Proc(IComApp2Events*, COMSVCSEVENTINFO*, Guid, Guid, HRESULT)
    on_app_shutdown2 : Proc(IComApp2Events*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_app_force_shutdown2 : Proc(IComApp2Events*, COMSVCSEVENTINFO*, Guid, HRESULT)
    on_app_paused2 : Proc(IComApp2Events*, COMSVCSEVENTINFO*, Guid, LibC::BOOL, HRESULT)
    on_app_recycle2 : Proc(IComApp2Events*, COMSVCSEVENTINFO*, Guid, Guid, Int32, HRESULT)
  end

  IComApp2Events_GUID = LibC::GUID.new("1290bc1a-b219-418d-b078-5934ded08242")
  CLSID_IComApp2Events = "1290bc1a-b219-418d-b078-5934ded08242"
  struct IComApp2Events
    lpVtbl : IComApp2EventsVTbl*
  end

  struct IComTransaction2EventsVTbl
    query_interface : Proc(IComTransaction2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTransaction2Events*, UInt32)
    release : Proc(IComTransaction2Events*, UInt32)
    on_transaction_start2 : Proc(IComTransaction2Events*, COMSVCSEVENTINFO*, Guid*, Guid*, LibC::BOOL, Int32, HRESULT)
    on_transaction_prepare2 : Proc(IComTransaction2Events*, COMSVCSEVENTINFO*, Guid*, LibC::BOOL, HRESULT)
    on_transaction_abort2 : Proc(IComTransaction2Events*, COMSVCSEVENTINFO*, Guid*, HRESULT)
    on_transaction_commit2 : Proc(IComTransaction2Events*, COMSVCSEVENTINFO*, Guid*, HRESULT)
  end

  IComTransaction2Events_GUID = LibC::GUID.new("a136f62a-2f94-4288-86e0-d8a1fa4c0299")
  CLSID_IComTransaction2Events = "a136f62a-2f94-4288-86e0-d8a1fa4c0299"
  struct IComTransaction2Events
    lpVtbl : IComTransaction2EventsVTbl*
  end

  struct IComInstance2EventsVTbl
    query_interface : Proc(IComInstance2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComInstance2Events*, UInt32)
    release : Proc(IComInstance2Events*, UInt32)
    on_object_create2 : Proc(IComInstance2Events*, COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, UInt64, Guid*, HRESULT)
    on_object_destroy2 : Proc(IComInstance2Events*, COMSVCSEVENTINFO*, UInt64, HRESULT)
  end

  IComInstance2Events_GUID = LibC::GUID.new("20e3bf07-b506-4ad5-a50c-d2ca5b9c158e")
  CLSID_IComInstance2Events = "20e3bf07-b506-4ad5-a50c-d2ca5b9c158e"
  struct IComInstance2Events
    lpVtbl : IComInstance2EventsVTbl*
  end

  struct IComObjectPool2EventsVTbl
    query_interface : Proc(IComObjectPool2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectPool2Events*, UInt32)
    release : Proc(IComObjectPool2Events*, UInt32)
    on_obj_pool_put_object2 : Proc(IComObjectPool2Events*, COMSVCSEVENTINFO*, Guid*, Int32, UInt32, UInt64, HRESULT)
    on_obj_pool_get_object2 : Proc(IComObjectPool2Events*, COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, UInt64, Guid*, HRESULT)
    on_obj_pool_recycle_to_tx2 : Proc(IComObjectPool2Events*, COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, HRESULT)
    on_obj_pool_get_from_tx2 : Proc(IComObjectPool2Events*, COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, Guid*, HRESULT)
  end

  IComObjectPool2Events_GUID = LibC::GUID.new("65bf6534-85ea-4f64-8cf4-3d974b2ab1cf")
  CLSID_IComObjectPool2Events = "65bf6534-85ea-4f64-8cf4-3d974b2ab1cf"
  struct IComObjectPool2Events
    lpVtbl : IComObjectPool2EventsVTbl*
  end

  struct IComObjectConstruction2EventsVTbl
    query_interface : Proc(IComObjectConstruction2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectConstruction2Events*, UInt32)
    release : Proc(IComObjectConstruction2Events*, UInt32)
    on_object_construct2 : Proc(IComObjectConstruction2Events*, COMSVCSEVENTINFO*, Guid*, LibC::LPWSTR, UInt64, Guid*, HRESULT)
  end

  IComObjectConstruction2Events_GUID = LibC::GUID.new("4b5a7827-8df2-45c0-8f6f-57ea1f856a9f")
  CLSID_IComObjectConstruction2Events = "4b5a7827-8df2-45c0-8f6f-57ea1f856a9f"
  struct IComObjectConstruction2Events
    lpVtbl : IComObjectConstruction2EventsVTbl*
  end

  struct ISystemAppEventDataVTbl
    query_interface : Proc(ISystemAppEventData*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemAppEventData*, UInt32)
    release : Proc(ISystemAppEventData*, UInt32)
    startup : Proc(ISystemAppEventData*, HRESULT)
    on_data_changed : Proc(ISystemAppEventData*, UInt32, UInt32, UInt32, UInt8*, UInt32, UInt64, HRESULT)
  end

  ISystemAppEventData_GUID = LibC::GUID.new("d6d48a3c-d5c5-49e7-8c74-99e4889ed52f")
  CLSID_ISystemAppEventData = "d6d48a3c-d5c5-49e7-8c74-99e4889ed52f"
  struct ISystemAppEventData
    lpVtbl : ISystemAppEventDataVTbl*
  end

  struct IMtsEventsVTbl
    query_interface : Proc(IMtsEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMtsEvents*, UInt32)
    release : Proc(IMtsEvents*, UInt32)
    get_type_info_count : Proc(IMtsEvents*, UInt32*, HRESULT)
    get_type_info : Proc(IMtsEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMtsEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMtsEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_package_name : Proc(IMtsEvents*, UInt8**, HRESULT)
    get_package_guid : Proc(IMtsEvents*, UInt8**, HRESULT)
    post_event : Proc(IMtsEvents*, VARIANT*, HRESULT)
    get_fire_events : Proc(IMtsEvents*, Int16*, HRESULT)
    get_process_id : Proc(IMtsEvents*, Int32*, HRESULT)
  end

  IMtsEvents_GUID = LibC::GUID.new("bacedf4d-74ab-11d0-b162-00aa00ba3258")
  CLSID_IMtsEvents = "bacedf4d-74ab-11d0-b162-00aa00ba3258"
  struct IMtsEvents
    lpVtbl : IMtsEventsVTbl*
  end

  struct IMtsEventInfoVTbl
    query_interface : Proc(IMtsEventInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMtsEventInfo*, UInt32)
    release : Proc(IMtsEventInfo*, UInt32)
    get_type_info_count : Proc(IMtsEventInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IMtsEventInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMtsEventInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMtsEventInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_names : Proc(IMtsEventInfo*, IUnknown*, HRESULT)
    get_display_name : Proc(IMtsEventInfo*, UInt8**, HRESULT)
    get_event_id : Proc(IMtsEventInfo*, UInt8**, HRESULT)
    get_count : Proc(IMtsEventInfo*, Int32*, HRESULT)
    get_value : Proc(IMtsEventInfo*, UInt8*, VARIANT*, HRESULT)
  end

  IMtsEventInfo_GUID = LibC::GUID.new("d56c3dc1-8482-11d0-b170-00aa00ba3258")
  CLSID_IMtsEventInfo = "d56c3dc1-8482-11d0-b170-00aa00ba3258"
  struct IMtsEventInfo
    lpVtbl : IMtsEventInfoVTbl*
  end

  struct IMTSLocatorVTbl
    query_interface : Proc(IMTSLocator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMTSLocator*, UInt32)
    release : Proc(IMTSLocator*, UInt32)
    get_type_info_count : Proc(IMTSLocator*, UInt32*, HRESULT)
    get_type_info : Proc(IMTSLocator*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMTSLocator*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMTSLocator*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_event_dispatcher : Proc(IMTSLocator*, IUnknown*, HRESULT)
  end

  IMTSLocator_GUID = LibC::GUID.new("d19b8bfd-7f88-11d0-b16e-00aa00ba3258")
  CLSID_IMTSLocator = "d19b8bfd-7f88-11d0-b16e-00aa00ba3258"
  struct IMTSLocator
    lpVtbl : IMTSLocatorVTbl*
  end

  struct IMtsGrpVTbl
    query_interface : Proc(IMtsGrp*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMtsGrp*, UInt32)
    release : Proc(IMtsGrp*, UInt32)
    get_type_info_count : Proc(IMtsGrp*, UInt32*, HRESULT)
    get_type_info : Proc(IMtsGrp*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMtsGrp*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMtsGrp*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_count : Proc(IMtsGrp*, Int32*, HRESULT)
    item : Proc(IMtsGrp*, Int32, IUnknown*, HRESULT)
    refresh : Proc(IMtsGrp*, HRESULT)
  end

  IMtsGrp_GUID = LibC::GUID.new("4b2e958c-0393-11d1-b1ab-00aa00ba3258")
  CLSID_IMtsGrp = "4b2e958c-0393-11d1-b1ab-00aa00ba3258"
  struct IMtsGrp
    lpVtbl : IMtsGrpVTbl*
  end

  struct IMessageMoverVTbl
    query_interface : Proc(IMessageMover*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMessageMover*, UInt32)
    release : Proc(IMessageMover*, UInt32)
    get_type_info_count : Proc(IMessageMover*, UInt32*, HRESULT)
    get_type_info : Proc(IMessageMover*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IMessageMover*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IMessageMover*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_source_path : Proc(IMessageMover*, UInt8**, HRESULT)
    put_source_path : Proc(IMessageMover*, UInt8*, HRESULT)
    get_dest_path : Proc(IMessageMover*, UInt8**, HRESULT)
    put_dest_path : Proc(IMessageMover*, UInt8*, HRESULT)
    get_commit_batch_size : Proc(IMessageMover*, Int32*, HRESULT)
    put_commit_batch_size : Proc(IMessageMover*, Int32, HRESULT)
    move_messages : Proc(IMessageMover*, Int32*, HRESULT)
  end

  IMessageMover_GUID = LibC::GUID.new("588a085a-b795-11d1-8054-00c04fc340ee")
  CLSID_IMessageMover = "588a085a-b795-11d1-8054-00c04fc340ee"
  struct IMessageMover
    lpVtbl : IMessageMoverVTbl*
  end

  struct IEventServerTraceVTbl
    query_interface : Proc(IEventServerTrace*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEventServerTrace*, UInt32)
    release : Proc(IEventServerTrace*, UInt32)
    get_type_info_count : Proc(IEventServerTrace*, UInt32*, HRESULT)
    get_type_info : Proc(IEventServerTrace*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEventServerTrace*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEventServerTrace*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    start_trace_guid : Proc(IEventServerTrace*, UInt8*, UInt8*, Int32, HRESULT)
    stop_trace_guid : Proc(IEventServerTrace*, UInt8*, UInt8*, Int32, HRESULT)
    enum_trace_guid : Proc(IEventServerTrace*, Int32*, UInt8**, HRESULT)
  end

  IEventServerTrace_GUID = LibC::GUID.new("9a9f12b8-80af-47ab-a579-35ea57725370")
  CLSID_IEventServerTrace = "9a9f12b8-80af-47ab-a579-35ea57725370"
  struct IEventServerTrace
    lpVtbl : IEventServerTraceVTbl*
  end

  struct IGetAppTrackerDataVTbl
    query_interface : Proc(IGetAppTrackerData*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGetAppTrackerData*, UInt32)
    release : Proc(IGetAppTrackerData*, UInt32)
    get_application_processes : Proc(IGetAppTrackerData*, Guid*, Guid*, UInt32, UInt32*, ApplicationProcessSummary**, HRESULT)
    get_application_process_details : Proc(IGetAppTrackerData*, Guid*, UInt32, UInt32, ApplicationProcessSummary*, ApplicationProcessStatistics*, ApplicationProcessRecycleInfo*, LibC::BOOL*, HRESULT)
    get_applications_in_process : Proc(IGetAppTrackerData*, Guid*, UInt32, Guid*, UInt32, UInt32*, ApplicationSummary**, HRESULT)
    get_components_in_process : Proc(IGetAppTrackerData*, Guid*, UInt32, Guid*, Guid*, UInt32, UInt32*, ComponentSummary**, HRESULT)
    get_component_details : Proc(IGetAppTrackerData*, Guid*, UInt32, Guid*, UInt32, ComponentSummary*, ComponentStatistics*, ComponentHangMonitorInfo*, HRESULT)
    get_tracker_data_as_collection_object : Proc(IGetAppTrackerData*, IUnknown*, HRESULT)
    get_suggested_polling_interval : Proc(IGetAppTrackerData*, UInt32*, HRESULT)
  end

  IGetAppTrackerData_GUID = LibC::GUID.new("507c3ac8-3e12-4cb0-9366-653d3e050638")
  CLSID_IGetAppTrackerData = "507c3ac8-3e12-4cb0-9366-653d3e050638"
  struct IGetAppTrackerData
    lpVtbl : IGetAppTrackerDataVTbl*
  end

  struct IDispenserManagerVTbl
    query_interface : Proc(IDispenserManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDispenserManager*, UInt32)
    release : Proc(IDispenserManager*, UInt32)
    register_dispenser : Proc(IDispenserManager*, IDispenserDriver, LibC::LPWSTR, IHolder*, HRESULT)
    get_context : Proc(IDispenserManager*, LibC::UINT_PTR*, LibC::UINT_PTR*, HRESULT)
  end

  IDispenserManager_GUID = LibC::GUID.new("5cb31e10-2b5f-11cf-be10-00aa00a2fa25")
  CLSID_IDispenserManager = "5cb31e10-2b5f-11cf-be10-00aa00a2fa25"
  struct IDispenserManager
    lpVtbl : IDispenserManagerVTbl*
  end

  struct IHolderVTbl
    query_interface : Proc(IHolder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IHolder*, UInt32)
    release : Proc(IHolder*, UInt32)
    alloc_resource : Proc(IHolder*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
    free_resource : Proc(IHolder*, LibC::UINT_PTR, HRESULT)
    track_resource : Proc(IHolder*, LibC::UINT_PTR, HRESULT)
    track_resource_s : Proc(IHolder*, UInt16*, HRESULT)
    untrack_resource : Proc(IHolder*, LibC::UINT_PTR, LibC::BOOL, HRESULT)
    untrack_resource_s : Proc(IHolder*, UInt16*, LibC::BOOL, HRESULT)
    close : Proc(IHolder*, HRESULT)
    request_destroy_resource : Proc(IHolder*, LibC::UINT_PTR, HRESULT)
  end

  IHolder_GUID = LibC::GUID.new("bf6a1850-2b45-11cf-be10-00aa00a2fa25")
  CLSID_IHolder = "bf6a1850-2b45-11cf-be10-00aa00a2fa25"
  struct IHolder
    lpVtbl : IHolderVTbl*
  end

  struct IDispenserDriverVTbl
    query_interface : Proc(IDispenserDriver*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDispenserDriver*, UInt32)
    release : Proc(IDispenserDriver*, UInt32)
    create_resource : Proc(IDispenserDriver*, LibC::UINT_PTR, LibC::UINT_PTR*, Int32*, HRESULT)
    rate_resource : Proc(IDispenserDriver*, LibC::UINT_PTR, LibC::UINT_PTR, LibC::BOOL, UInt32*, HRESULT)
    enlist_resource : Proc(IDispenserDriver*, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)
    reset_resource : Proc(IDispenserDriver*, LibC::UINT_PTR, HRESULT)
    destroy_resource : Proc(IDispenserDriver*, LibC::UINT_PTR, HRESULT)
    destroy_resource_s : Proc(IDispenserDriver*, UInt16*, HRESULT)
  end

  IDispenserDriver_GUID = LibC::GUID.new("208b3651-2b48-11cf-be10-00aa00a2fa25")
  CLSID_IDispenserDriver = "208b3651-2b48-11cf-be10-00aa00a2fa25"
  struct IDispenserDriver
    lpVtbl : IDispenserDriverVTbl*
  end

  struct ITransactionProxyVTbl
    query_interface : Proc(ITransactionProxy*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionProxy*, UInt32)
    release : Proc(ITransactionProxy*, UInt32)
    commit : Proc(ITransactionProxy*, Guid, HRESULT)
    abort : Proc(ITransactionProxy*, HRESULT)
    promote : Proc(ITransactionProxy*, ITransaction*, HRESULT)
    create_voter : Proc(ITransactionProxy*, ITransactionVoterNotifyAsync2, ITransactionVoterBallotAsync2*, HRESULT)
    get_isolation_level : Proc(ITransactionProxy*, Int32*, HRESULT)
    get_identifier : Proc(ITransactionProxy*, Guid*, HRESULT)
    is_reusable : Proc(ITransactionProxy*, LibC::BOOL*, HRESULT)
  end

  ITransactionProxy_GUID = LibC::GUID.new("02558374-df2e-4dae-bd6b-1d5c994f9bdc")
  CLSID_ITransactionProxy = "02558374-df2e-4dae-bd6b-1d5c994f9bdc"
  struct ITransactionProxy
    lpVtbl : ITransactionProxyVTbl*
  end

  struct IContextSecurityPerimeterVTbl
    query_interface : Proc(IContextSecurityPerimeter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextSecurityPerimeter*, UInt32)
    release : Proc(IContextSecurityPerimeter*, UInt32)
    get_perimeter_flag : Proc(IContextSecurityPerimeter*, LibC::BOOL*, HRESULT)
    set_perimeter_flag : Proc(IContextSecurityPerimeter*, LibC::BOOL, HRESULT)
  end

  IContextSecurityPerimeter_GUID = LibC::GUID.new("a7549a29-a7c4-42e1-8dc1-7e3d748dc24a")
  CLSID_IContextSecurityPerimeter = "a7549a29-a7c4-42e1-8dc1-7e3d748dc24a"
  struct IContextSecurityPerimeter
    lpVtbl : IContextSecurityPerimeterVTbl*
  end

  struct ITxProxyHolderVTbl
    query_interface : Proc(ITxProxyHolder*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITxProxyHolder*, UInt32)
    release : Proc(ITxProxyHolder*, UInt32)
    get_identifier : Proc(ITxProxyHolder*, Guid*, Void)
  end

  ITxProxyHolder_GUID = LibC::GUID.new("13d86f31-0139-41af-bcad-c7d50435fe9f")
  CLSID_ITxProxyHolder = "13d86f31-0139-41af-bcad-c7d50435fe9f"
  struct ITxProxyHolder
    lpVtbl : ITxProxyHolderVTbl*
  end

  struct IObjectContextVTbl
    query_interface : Proc(IObjectContext*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContext*, UInt32)
    release : Proc(IObjectContext*, UInt32)
    create_instance : Proc(IObjectContext*, Guid*, Guid*, Void**, HRESULT)
    set_complete : Proc(IObjectContext*, HRESULT)
    set_abort : Proc(IObjectContext*, HRESULT)
    enable_commit : Proc(IObjectContext*, HRESULT)
    disable_commit : Proc(IObjectContext*, HRESULT)
    is_in_transaction : Proc(IObjectContext*, LibC::BOOL)
    is_security_enabled : Proc(IObjectContext*, LibC::BOOL)
    is_caller_in_role : Proc(IObjectContext*, UInt8*, LibC::BOOL*, HRESULT)
  end

  IObjectContext_GUID = LibC::GUID.new("51372ae0-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IObjectContext = "51372ae0-cae7-11cf-be81-00aa00a2fa25"
  struct IObjectContext
    lpVtbl : IObjectContextVTbl*
  end

  struct IObjectControlVTbl
    query_interface : Proc(IObjectControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectControl*, UInt32)
    release : Proc(IObjectControl*, UInt32)
    activate : Proc(IObjectControl*, HRESULT)
    deactivate : Proc(IObjectControl*, Void)
    can_be_pooled : Proc(IObjectControl*, LibC::BOOL)
  end

  IObjectControl_GUID = LibC::GUID.new("51372aec-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IObjectControl = "51372aec-cae7-11cf-be81-00aa00a2fa25"
  struct IObjectControl
    lpVtbl : IObjectControlVTbl*
  end

  struct IEnumNamesVTbl
    query_interface : Proc(IEnumNames*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNames*, UInt32)
    release : Proc(IEnumNames*, UInt32)
    next : Proc(IEnumNames*, UInt32, UInt8**, UInt32*, HRESULT)
    skip : Proc(IEnumNames*, UInt32, HRESULT)
    reset : Proc(IEnumNames*, HRESULT)
    clone : Proc(IEnumNames*, IEnumNames*, HRESULT)
  end

  IEnumNames_GUID = LibC::GUID.new("51372af2-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IEnumNames = "51372af2-cae7-11cf-be81-00aa00a2fa25"
  struct IEnumNames
    lpVtbl : IEnumNamesVTbl*
  end

  struct ISecurityPropertyVTbl
    query_interface : Proc(ISecurityProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityProperty*, UInt32)
    release : Proc(ISecurityProperty*, UInt32)
    get_direct_creator_sid : Proc(ISecurityProperty*, PSID*, HRESULT)
    get_original_creator_sid : Proc(ISecurityProperty*, PSID*, HRESULT)
    get_direct_caller_sid : Proc(ISecurityProperty*, PSID*, HRESULT)
    get_original_caller_sid : Proc(ISecurityProperty*, PSID*, HRESULT)
    release_sid : Proc(ISecurityProperty*, PSID, HRESULT)
  end

  ISecurityProperty_GUID = LibC::GUID.new("51372aea-cae7-11cf-be81-00aa00a2fa25")
  CLSID_ISecurityProperty = "51372aea-cae7-11cf-be81-00aa00a2fa25"
  struct ISecurityProperty
    lpVtbl : ISecurityPropertyVTbl*
  end

  struct ObjectControlVTbl
    query_interface : Proc(ObjectControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ObjectControl*, UInt32)
    release : Proc(ObjectControl*, UInt32)
    activate : Proc(ObjectControl*, HRESULT)
    deactivate : Proc(ObjectControl*, HRESULT)
    can_be_pooled : Proc(ObjectControl*, Int16*, HRESULT)
  end

  ObjectControl_GUID = LibC::GUID.new("7dc41850-0c31-11d0-8b79-00aa00b8a790")
  CLSID_ObjectControl = "7dc41850-0c31-11d0-8b79-00aa00b8a790"
  struct ObjectControl
    lpVtbl : ObjectControlVTbl*
  end

  struct ISharedPropertyVTbl
    query_interface : Proc(ISharedProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISharedProperty*, UInt32)
    release : Proc(ISharedProperty*, UInt32)
    get_type_info_count : Proc(ISharedProperty*, UInt32*, HRESULT)
    get_type_info : Proc(ISharedProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISharedProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISharedProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_value : Proc(ISharedProperty*, VARIANT*, HRESULT)
    put_value : Proc(ISharedProperty*, VARIANT, HRESULT)
  end

  ISharedProperty_GUID = LibC::GUID.new("2a005c01-a5de-11cf-9e66-00aa00a3f464")
  CLSID_ISharedProperty = "2a005c01-a5de-11cf-9e66-00aa00a3f464"
  struct ISharedProperty
    lpVtbl : ISharedPropertyVTbl*
  end

  struct ISharedPropertyGroupVTbl
    query_interface : Proc(ISharedPropertyGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISharedPropertyGroup*, UInt32)
    release : Proc(ISharedPropertyGroup*, UInt32)
    get_type_info_count : Proc(ISharedPropertyGroup*, UInt32*, HRESULT)
    get_type_info : Proc(ISharedPropertyGroup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISharedPropertyGroup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISharedPropertyGroup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_property_by_position : Proc(ISharedPropertyGroup*, Int32, Int16*, ISharedProperty*, HRESULT)
    get_property_by_position : Proc(ISharedPropertyGroup*, Int32, ISharedProperty*, HRESULT)
    create_property : Proc(ISharedPropertyGroup*, UInt8*, Int16*, ISharedProperty*, HRESULT)
    get_property : Proc(ISharedPropertyGroup*, UInt8*, ISharedProperty*, HRESULT)
  end

  ISharedPropertyGroup_GUID = LibC::GUID.new("2a005c07-a5de-11cf-9e66-00aa00a3f464")
  CLSID_ISharedPropertyGroup = "2a005c07-a5de-11cf-9e66-00aa00a3f464"
  struct ISharedPropertyGroup
    lpVtbl : ISharedPropertyGroupVTbl*
  end

  struct ISharedPropertyGroupManagerVTbl
    query_interface : Proc(ISharedPropertyGroupManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISharedPropertyGroupManager*, UInt32)
    release : Proc(ISharedPropertyGroupManager*, UInt32)
    get_type_info_count : Proc(ISharedPropertyGroupManager*, UInt32*, HRESULT)
    get_type_info : Proc(ISharedPropertyGroupManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISharedPropertyGroupManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISharedPropertyGroupManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_property_group : Proc(ISharedPropertyGroupManager*, UInt8*, Int32*, Int32*, Int16*, ISharedPropertyGroup*, HRESULT)
    get_group : Proc(ISharedPropertyGroupManager*, UInt8*, ISharedPropertyGroup*, HRESULT)
    get__new_enum : Proc(ISharedPropertyGroupManager*, IUnknown*, HRESULT)
  end

  ISharedPropertyGroupManager_GUID = LibC::GUID.new("2a005c0d-a5de-11cf-9e66-00aa00a3f464")
  CLSID_ISharedPropertyGroupManager = "2a005c0d-a5de-11cf-9e66-00aa00a3f464"
  struct ISharedPropertyGroupManager
    lpVtbl : ISharedPropertyGroupManagerVTbl*
  end

  struct IObjectConstructVTbl
    query_interface : Proc(IObjectConstruct*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectConstruct*, UInt32)
    release : Proc(IObjectConstruct*, UInt32)
    construct : Proc(IObjectConstruct*, IDispatch, HRESULT)
  end

  IObjectConstruct_GUID = LibC::GUID.new("41c4f8b3-7439-11d2-98cb-00c04f8ee1c4")
  CLSID_IObjectConstruct = "41c4f8b3-7439-11d2-98cb-00c04f8ee1c4"
  struct IObjectConstruct
    lpVtbl : IObjectConstructVTbl*
  end

  struct IObjectConstructStringVTbl
    query_interface : Proc(IObjectConstructString*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectConstructString*, UInt32)
    release : Proc(IObjectConstructString*, UInt32)
    get_type_info_count : Proc(IObjectConstructString*, UInt32*, HRESULT)
    get_type_info : Proc(IObjectConstructString*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IObjectConstructString*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IObjectConstructString*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_construct_string : Proc(IObjectConstructString*, UInt8**, HRESULT)
  end

  IObjectConstructString_GUID = LibC::GUID.new("41c4f8b2-7439-11d2-98cb-00c04f8ee1c4")
  CLSID_IObjectConstructString = "41c4f8b2-7439-11d2-98cb-00c04f8ee1c4"
  struct IObjectConstructString
    lpVtbl : IObjectConstructStringVTbl*
  end

  struct IObjectContextActivityVTbl
    query_interface : Proc(IObjectContextActivity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContextActivity*, UInt32)
    release : Proc(IObjectContextActivity*, UInt32)
    get_activity_id : Proc(IObjectContextActivity*, Guid*, HRESULT)
  end

  IObjectContextActivity_GUID = LibC::GUID.new("51372afc-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IObjectContextActivity = "51372afc-cae7-11cf-be81-00aa00a2fa25"
  struct IObjectContextActivity
    lpVtbl : IObjectContextActivityVTbl*
  end

  struct IObjectContextInfoVTbl
    query_interface : Proc(IObjectContextInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContextInfo*, UInt32)
    release : Proc(IObjectContextInfo*, UInt32)
    is_in_transaction : Proc(IObjectContextInfo*, LibC::BOOL)
    get_transaction : Proc(IObjectContextInfo*, IUnknown*, HRESULT)
    get_transaction_id : Proc(IObjectContextInfo*, Guid*, HRESULT)
    get_activity_id : Proc(IObjectContextInfo*, Guid*, HRESULT)
    get_context_id : Proc(IObjectContextInfo*, Guid*, HRESULT)
  end

  IObjectContextInfo_GUID = LibC::GUID.new("75b52ddb-e8ed-11d1-93ad-00aa00ba3258")
  CLSID_IObjectContextInfo = "75b52ddb-e8ed-11d1-93ad-00aa00ba3258"
  struct IObjectContextInfo
    lpVtbl : IObjectContextInfoVTbl*
  end

  struct IObjectContextInfo2VTbl
    query_interface : Proc(IObjectContextInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContextInfo2*, UInt32)
    release : Proc(IObjectContextInfo2*, UInt32)
    is_in_transaction : Proc(IObjectContextInfo2*, LibC::BOOL)
    get_transaction : Proc(IObjectContextInfo2*, IUnknown*, HRESULT)
    get_transaction_id : Proc(IObjectContextInfo2*, Guid*, HRESULT)
    get_activity_id : Proc(IObjectContextInfo2*, Guid*, HRESULT)
    get_context_id : Proc(IObjectContextInfo2*, Guid*, HRESULT)
    get_partition_id : Proc(IObjectContextInfo2*, Guid*, HRESULT)
    get_application_id : Proc(IObjectContextInfo2*, Guid*, HRESULT)
    get_application_instance_id : Proc(IObjectContextInfo2*, Guid*, HRESULT)
  end

  IObjectContextInfo2_GUID = LibC::GUID.new("594be71a-4bc4-438b-9197-cfd176248b09")
  CLSID_IObjectContextInfo2 = "594be71a-4bc4-438b-9197-cfd176248b09"
  struct IObjectContextInfo2
    lpVtbl : IObjectContextInfo2VTbl*
  end

  struct ITransactionStatusVTbl
    query_interface : Proc(ITransactionStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionStatus*, UInt32)
    release : Proc(ITransactionStatus*, UInt32)
    set_transaction_status : Proc(ITransactionStatus*, HRESULT, HRESULT)
    get_transaction_status : Proc(ITransactionStatus*, HRESULT*, HRESULT)
  end

  ITransactionStatus_GUID = LibC::GUID.new("61f589e8-3724-4898-a0a4-664ae9e1d1b4")
  CLSID_ITransactionStatus = "61f589e8-3724-4898-a0a4-664ae9e1d1b4"
  struct ITransactionStatus
    lpVtbl : ITransactionStatusVTbl*
  end

  struct IObjectContextTipVTbl
    query_interface : Proc(IObjectContextTip*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContextTip*, UInt32)
    release : Proc(IObjectContextTip*, UInt32)
    get_tip_url : Proc(IObjectContextTip*, UInt8**, HRESULT)
  end

  IObjectContextTip_GUID = LibC::GUID.new("92fd41ca-bad9-11d2-9a2d-00c04f797bc9")
  CLSID_IObjectContextTip = "92fd41ca-bad9-11d2-9a2d-00c04f797bc9"
  struct IObjectContextTip
    lpVtbl : IObjectContextTipVTbl*
  end

  struct IPlaybackControlVTbl
    query_interface : Proc(IPlaybackControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPlaybackControl*, UInt32)
    release : Proc(IPlaybackControl*, UInt32)
    final_client_retry : Proc(IPlaybackControl*, HRESULT)
    final_server_retry : Proc(IPlaybackControl*, HRESULT)
  end

  IPlaybackControl_GUID = LibC::GUID.new("51372afd-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IPlaybackControl = "51372afd-cae7-11cf-be81-00aa00a2fa25"
  struct IPlaybackControl
    lpVtbl : IPlaybackControlVTbl*
  end

  struct IGetContextPropertiesVTbl
    query_interface : Proc(IGetContextProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGetContextProperties*, UInt32)
    release : Proc(IGetContextProperties*, UInt32)
    count : Proc(IGetContextProperties*, Int32*, HRESULT)
    get_property : Proc(IGetContextProperties*, UInt8*, VARIANT*, HRESULT)
    enum_names : Proc(IGetContextProperties*, IEnumNames*, HRESULT)
  end

  IGetContextProperties_GUID = LibC::GUID.new("51372af4-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IGetContextProperties = "51372af4-cae7-11cf-be81-00aa00a2fa25"
  struct IGetContextProperties
    lpVtbl : IGetContextPropertiesVTbl*
  end

  struct IContextStateVTbl
    query_interface : Proc(IContextState*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextState*, UInt32)
    release : Proc(IContextState*, UInt32)
    set_deactivate_on_return : Proc(IContextState*, Int16, HRESULT)
    get_deactivate_on_return : Proc(IContextState*, Int16*, HRESULT)
    set_my_transaction_vote : Proc(IContextState*, TransactionVote, HRESULT)
    get_my_transaction_vote : Proc(IContextState*, TransactionVote*, HRESULT)
  end

  IContextState_GUID = LibC::GUID.new("3c05e54b-a42a-11d2-afc4-00c04f8ee1c4")
  CLSID_IContextState = "3c05e54b-a42a-11d2-afc4-00c04f8ee1c4"
  struct IContextState
    lpVtbl : IContextStateVTbl*
  end

  struct IPoolManagerVTbl
    query_interface : Proc(IPoolManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPoolManager*, UInt32)
    release : Proc(IPoolManager*, UInt32)
    get_type_info_count : Proc(IPoolManager*, UInt32*, HRESULT)
    get_type_info : Proc(IPoolManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPoolManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPoolManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    shutdown_pool : Proc(IPoolManager*, UInt8*, HRESULT)
  end

  IPoolManager_GUID = LibC::GUID.new("0a469861-5a91-43a0-99b6-d5e179bb0631")
  CLSID_IPoolManager = "0a469861-5a91-43a0-99b6-d5e179bb0631"
  struct IPoolManager
    lpVtbl : IPoolManagerVTbl*
  end

  struct ISelectCOMLBServerVTbl
    query_interface : Proc(ISelectCOMLBServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISelectCOMLBServer*, UInt32)
    release : Proc(ISelectCOMLBServer*, UInt32)
    init : Proc(ISelectCOMLBServer*, HRESULT)
    get_lb_server : Proc(ISelectCOMLBServer*, IUnknown, HRESULT)
  end

  ISelectCOMLBServer_GUID = LibC::GUID.new("dcf443f4-3f8a-4872-b9f0-369a796d12d6")
  CLSID_ISelectCOMLBServer = "dcf443f4-3f8a-4872-b9f0-369a796d12d6"
  struct ISelectCOMLBServer
    lpVtbl : ISelectCOMLBServerVTbl*
  end

  struct ICOMLBArgumentsVTbl
    query_interface : Proc(ICOMLBArguments*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICOMLBArguments*, UInt32)
    release : Proc(ICOMLBArguments*, UInt32)
    get_clsid : Proc(ICOMLBArguments*, Guid*, HRESULT)
    set_clsid : Proc(ICOMLBArguments*, Guid*, HRESULT)
    get_machine_name : Proc(ICOMLBArguments*, UInt32, Char*, HRESULT)
    set_machine_name : Proc(ICOMLBArguments*, UInt32, Char*, HRESULT)
  end

  ICOMLBArguments_GUID = LibC::GUID.new("3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2")
  CLSID_ICOMLBArguments = "3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2"
  struct ICOMLBArguments
    lpVtbl : ICOMLBArgumentsVTbl*
  end

  struct ICrmLogControlVTbl
    query_interface : Proc(ICrmLogControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmLogControl*, UInt32)
    release : Proc(ICrmLogControl*, UInt32)
    get_transaction_uow : Proc(ICrmLogControl*, UInt8**, HRESULT)
    register_compensator : Proc(ICrmLogControl*, LibC::LPWSTR, LibC::LPWSTR, Int32, HRESULT)
    write_log_record_variants : Proc(ICrmLogControl*, VARIANT*, HRESULT)
    force_log : Proc(ICrmLogControl*, HRESULT)
    forget_log_record : Proc(ICrmLogControl*, HRESULT)
    force_transaction_to_abort : Proc(ICrmLogControl*, HRESULT)
    write_log_record : Proc(ICrmLogControl*, BLOB*, UInt32, HRESULT)
  end

  ICrmLogControl_GUID = LibC::GUID.new("a0e174b3-d26e-11d2-8f84-00805fc7bcd9")
  CLSID_ICrmLogControl = "a0e174b3-d26e-11d2-8f84-00805fc7bcd9"
  struct ICrmLogControl
    lpVtbl : ICrmLogControlVTbl*
  end

  struct ICrmCompensatorVariantsVTbl
    query_interface : Proc(ICrmCompensatorVariants*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmCompensatorVariants*, UInt32)
    release : Proc(ICrmCompensatorVariants*, UInt32)
    set_log_control_variants : Proc(ICrmCompensatorVariants*, ICrmLogControl, HRESULT)
    begin_prepare_variants : Proc(ICrmCompensatorVariants*, HRESULT)
    prepare_record_variants : Proc(ICrmCompensatorVariants*, VARIANT*, Int16*, HRESULT)
    end_prepare_variants : Proc(ICrmCompensatorVariants*, Int16*, HRESULT)
    begin_commit_variants : Proc(ICrmCompensatorVariants*, Int16, HRESULT)
    commit_record_variants : Proc(ICrmCompensatorVariants*, VARIANT*, Int16*, HRESULT)
    end_commit_variants : Proc(ICrmCompensatorVariants*, HRESULT)
    begin_abort_variants : Proc(ICrmCompensatorVariants*, Int16, HRESULT)
    abort_record_variants : Proc(ICrmCompensatorVariants*, VARIANT*, Int16*, HRESULT)
    end_abort_variants : Proc(ICrmCompensatorVariants*, HRESULT)
  end

  ICrmCompensatorVariants_GUID = LibC::GUID.new("f0baf8e4-7804-11d1-82e9-00a0c91eede9")
  CLSID_ICrmCompensatorVariants = "f0baf8e4-7804-11d1-82e9-00a0c91eede9"
  struct ICrmCompensatorVariants
    lpVtbl : ICrmCompensatorVariantsVTbl*
  end

  struct ICrmCompensatorVTbl
    query_interface : Proc(ICrmCompensator*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmCompensator*, UInt32)
    release : Proc(ICrmCompensator*, UInt32)
    set_log_control : Proc(ICrmCompensator*, ICrmLogControl, HRESULT)
    begin_prepare : Proc(ICrmCompensator*, HRESULT)
    prepare_record : Proc(ICrmCompensator*, CrmLogRecordRead, LibC::BOOL*, HRESULT)
    end_prepare : Proc(ICrmCompensator*, LibC::BOOL*, HRESULT)
    begin_commit : Proc(ICrmCompensator*, LibC::BOOL, HRESULT)
    commit_record : Proc(ICrmCompensator*, CrmLogRecordRead, LibC::BOOL*, HRESULT)
    end_commit : Proc(ICrmCompensator*, HRESULT)
    begin_abort : Proc(ICrmCompensator*, LibC::BOOL, HRESULT)
    abort_record : Proc(ICrmCompensator*, CrmLogRecordRead, LibC::BOOL*, HRESULT)
    end_abort : Proc(ICrmCompensator*, HRESULT)
  end

  ICrmCompensator_GUID = LibC::GUID.new("bbc01830-8d3b-11d1-82ec-00a0c91eede9")
  CLSID_ICrmCompensator = "bbc01830-8d3b-11d1-82ec-00a0c91eede9"
  struct ICrmCompensator
    lpVtbl : ICrmCompensatorVTbl*
  end

  struct ICrmMonitorLogRecordsVTbl
    query_interface : Proc(ICrmMonitorLogRecords*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmMonitorLogRecords*, UInt32)
    release : Proc(ICrmMonitorLogRecords*, UInt32)
    get_count : Proc(ICrmMonitorLogRecords*, Int32*, HRESULT)
    get_transaction_state : Proc(ICrmMonitorLogRecords*, CrmTransactionState*, HRESULT)
    get_structured_records : Proc(ICrmMonitorLogRecords*, Int16*, HRESULT)
    get_log_record : Proc(ICrmMonitorLogRecords*, UInt32, CrmLogRecordRead*, HRESULT)
    get_log_record_variants : Proc(ICrmMonitorLogRecords*, VARIANT, VARIANT*, HRESULT)
  end

  ICrmMonitorLogRecords_GUID = LibC::GUID.new("70c8e441-c7ed-11d1-82fb-00a0c91eede9")
  CLSID_ICrmMonitorLogRecords = "70c8e441-c7ed-11d1-82fb-00a0c91eede9"
  struct ICrmMonitorLogRecords
    lpVtbl : ICrmMonitorLogRecordsVTbl*
  end

  struct ICrmMonitorClerksVTbl
    query_interface : Proc(ICrmMonitorClerks*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmMonitorClerks*, UInt32)
    release : Proc(ICrmMonitorClerks*, UInt32)
    get_type_info_count : Proc(ICrmMonitorClerks*, UInt32*, HRESULT)
    get_type_info : Proc(ICrmMonitorClerks*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICrmMonitorClerks*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICrmMonitorClerks*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    item : Proc(ICrmMonitorClerks*, VARIANT, VARIANT*, HRESULT)
    get__new_enum : Proc(ICrmMonitorClerks*, IUnknown*, HRESULT)
    get_count : Proc(ICrmMonitorClerks*, Int32*, HRESULT)
    prog_id_compensator : Proc(ICrmMonitorClerks*, VARIANT, VARIANT*, HRESULT)
    description : Proc(ICrmMonitorClerks*, VARIANT, VARIANT*, HRESULT)
    transaction_uow : Proc(ICrmMonitorClerks*, VARIANT, VARIANT*, HRESULT)
    activity_id : Proc(ICrmMonitorClerks*, VARIANT, VARIANT*, HRESULT)
  end

  ICrmMonitorClerks_GUID = LibC::GUID.new("70c8e442-c7ed-11d1-82fb-00a0c91eede9")
  CLSID_ICrmMonitorClerks = "70c8e442-c7ed-11d1-82fb-00a0c91eede9"
  struct ICrmMonitorClerks
    lpVtbl : ICrmMonitorClerksVTbl*
  end

  struct ICrmMonitorVTbl
    query_interface : Proc(ICrmMonitor*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmMonitor*, UInt32)
    release : Proc(ICrmMonitor*, UInt32)
    get_clerks : Proc(ICrmMonitor*, ICrmMonitorClerks*, HRESULT)
    hold_clerk : Proc(ICrmMonitor*, VARIANT, VARIANT*, HRESULT)
  end

  ICrmMonitor_GUID = LibC::GUID.new("70c8e443-c7ed-11d1-82fb-00a0c91eede9")
  CLSID_ICrmMonitor = "70c8e443-c7ed-11d1-82fb-00a0c91eede9"
  struct ICrmMonitor
    lpVtbl : ICrmMonitorVTbl*
  end

  struct ICrmFormatLogRecordsVTbl
    query_interface : Proc(ICrmFormatLogRecords*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICrmFormatLogRecords*, UInt32)
    release : Proc(ICrmFormatLogRecords*, UInt32)
    get_column_count : Proc(ICrmFormatLogRecords*, Int32*, HRESULT)
    get_column_headers : Proc(ICrmFormatLogRecords*, VARIANT*, HRESULT)
    get_column : Proc(ICrmFormatLogRecords*, CrmLogRecordRead, VARIANT*, HRESULT)
    get_column_variants : Proc(ICrmFormatLogRecords*, VARIANT, VARIANT*, HRESULT)
  end

  ICrmFormatLogRecords_GUID = LibC::GUID.new("9c51d821-c98b-11d1-82fb-00a0c91eede9")
  CLSID_ICrmFormatLogRecords = "9c51d821-c98b-11d1-82fb-00a0c91eede9"
  struct ICrmFormatLogRecords
    lpVtbl : ICrmFormatLogRecordsVTbl*
  end

  struct IServiceIISIntrinsicsConfigVTbl
    query_interface : Proc(IServiceIISIntrinsicsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceIISIntrinsicsConfig*, UInt32)
    release : Proc(IServiceIISIntrinsicsConfig*, UInt32)
    iis_intrinsics_config : Proc(IServiceIISIntrinsicsConfig*, CSC_IISIntrinsicsConfig, HRESULT)
  end

  IServiceIISIntrinsicsConfig_GUID = LibC::GUID.new("1a0cf920-d452-46f4-bc36-48118d54ea52")
  CLSID_IServiceIISIntrinsicsConfig = "1a0cf920-d452-46f4-bc36-48118d54ea52"
  struct IServiceIISIntrinsicsConfig
    lpVtbl : IServiceIISIntrinsicsConfigVTbl*
  end

  struct IServiceComTIIntrinsicsConfigVTbl
    query_interface : Proc(IServiceComTIIntrinsicsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceComTIIntrinsicsConfig*, UInt32)
    release : Proc(IServiceComTIIntrinsicsConfig*, UInt32)
    com_ti_intrinsics_config : Proc(IServiceComTIIntrinsicsConfig*, CSC_COMTIIntrinsicsConfig, HRESULT)
  end

  IServiceComTIIntrinsicsConfig_GUID = LibC::GUID.new("09e6831e-04e1-4ed4-9d0f-e8b168bafeaf")
  CLSID_IServiceComTIIntrinsicsConfig = "09e6831e-04e1-4ed4-9d0f-e8b168bafeaf"
  struct IServiceComTIIntrinsicsConfig
    lpVtbl : IServiceComTIIntrinsicsConfigVTbl*
  end

  struct IServiceSxsConfigVTbl
    query_interface : Proc(IServiceSxsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceSxsConfig*, UInt32)
    release : Proc(IServiceSxsConfig*, UInt32)
    sxs_config : Proc(IServiceSxsConfig*, CSC_SxsConfig, HRESULT)
    sxs_name : Proc(IServiceSxsConfig*, LibC::LPWSTR, HRESULT)
    sxs_directory : Proc(IServiceSxsConfig*, LibC::LPWSTR, HRESULT)
  end

  IServiceSxsConfig_GUID = LibC::GUID.new("c7cd7379-f3f2-4634-811b-703281d73e08")
  CLSID_IServiceSxsConfig = "c7cd7379-f3f2-4634-811b-703281d73e08"
  struct IServiceSxsConfig
    lpVtbl : IServiceSxsConfigVTbl*
  end

  struct ICheckSxsConfigVTbl
    query_interface : Proc(ICheckSxsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICheckSxsConfig*, UInt32)
    release : Proc(ICheckSxsConfig*, UInt32)
    is_same_sxs_config : Proc(ICheckSxsConfig*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  ICheckSxsConfig_GUID = LibC::GUID.new("0ff5a96f-11fc-47d1-baa6-25dd347e7242")
  CLSID_ICheckSxsConfig = "0ff5a96f-11fc-47d1-baa6-25dd347e7242"
  struct ICheckSxsConfig
    lpVtbl : ICheckSxsConfigVTbl*
  end

  struct IServiceInheritanceConfigVTbl
    query_interface : Proc(IServiceInheritanceConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceInheritanceConfig*, UInt32)
    release : Proc(IServiceInheritanceConfig*, UInt32)
    containing_context_treatment : Proc(IServiceInheritanceConfig*, CSC_InheritanceConfig, HRESULT)
  end

  IServiceInheritanceConfig_GUID = LibC::GUID.new("92186771-d3b4-4d77-a8ea-ee842d586f35")
  CLSID_IServiceInheritanceConfig = "92186771-d3b4-4d77-a8ea-ee842d586f35"
  struct IServiceInheritanceConfig
    lpVtbl : IServiceInheritanceConfigVTbl*
  end

  struct IServiceThreadPoolConfigVTbl
    query_interface : Proc(IServiceThreadPoolConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceThreadPoolConfig*, UInt32)
    release : Proc(IServiceThreadPoolConfig*, UInt32)
    select_thread_pool : Proc(IServiceThreadPoolConfig*, CSC_ThreadPool, HRESULT)
    set_binding_info : Proc(IServiceThreadPoolConfig*, CSC_Binding, HRESULT)
  end

  IServiceThreadPoolConfig_GUID = LibC::GUID.new("186d89bc-f277-4bcc-80d5-4df7b836ef4a")
  CLSID_IServiceThreadPoolConfig = "186d89bc-f277-4bcc-80d5-4df7b836ef4a"
  struct IServiceThreadPoolConfig
    lpVtbl : IServiceThreadPoolConfigVTbl*
  end

  struct IServiceTransactionConfigBaseVTbl
    query_interface : Proc(IServiceTransactionConfigBase*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceTransactionConfigBase*, UInt32)
    release : Proc(IServiceTransactionConfigBase*, UInt32)
    configure_transaction : Proc(IServiceTransactionConfigBase*, CSC_TransactionConfig, HRESULT)
    isolation_level : Proc(IServiceTransactionConfigBase*, COMAdminTxIsolationLevelOptions, HRESULT)
    transaction_timeout : Proc(IServiceTransactionConfigBase*, UInt32, HRESULT)
    bring_your_own_transaction : Proc(IServiceTransactionConfigBase*, LibC::LPWSTR, HRESULT)
    new_transaction_description : Proc(IServiceTransactionConfigBase*, LibC::LPWSTR, HRESULT)
  end

  IServiceTransactionConfigBase_GUID = LibC::GUID.new("772b3fbe-6ffd-42fb-b5f8-8f9b260f3810")
  CLSID_IServiceTransactionConfigBase = "772b3fbe-6ffd-42fb-b5f8-8f9b260f3810"
  struct IServiceTransactionConfigBase
    lpVtbl : IServiceTransactionConfigBaseVTbl*
  end

  struct IServiceTransactionConfigVTbl
    query_interface : Proc(IServiceTransactionConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceTransactionConfig*, UInt32)
    release : Proc(IServiceTransactionConfig*, UInt32)
    configure_transaction : Proc(IServiceTransactionConfig*, CSC_TransactionConfig, HRESULT)
    isolation_level : Proc(IServiceTransactionConfig*, COMAdminTxIsolationLevelOptions, HRESULT)
    transaction_timeout : Proc(IServiceTransactionConfig*, UInt32, HRESULT)
    bring_your_own_transaction : Proc(IServiceTransactionConfig*, LibC::LPWSTR, HRESULT)
    new_transaction_description : Proc(IServiceTransactionConfig*, LibC::LPWSTR, HRESULT)
    configure_byot : Proc(IServiceTransactionConfig*, ITransaction, HRESULT)
  end

  IServiceTransactionConfig_GUID = LibC::GUID.new("59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9")
  CLSID_IServiceTransactionConfig = "59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9"
  struct IServiceTransactionConfig
    lpVtbl : IServiceTransactionConfigVTbl*
  end

  struct IServiceSysTxnConfigVTbl
    query_interface : Proc(IServiceSysTxnConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceSysTxnConfig*, UInt32)
    release : Proc(IServiceSysTxnConfig*, UInt32)
    configure_transaction : Proc(IServiceSysTxnConfig*, CSC_TransactionConfig, HRESULT)
    isolation_level : Proc(IServiceSysTxnConfig*, COMAdminTxIsolationLevelOptions, HRESULT)
    transaction_timeout : Proc(IServiceSysTxnConfig*, UInt32, HRESULT)
    bring_your_own_transaction : Proc(IServiceSysTxnConfig*, LibC::LPWSTR, HRESULT)
    new_transaction_description : Proc(IServiceSysTxnConfig*, LibC::LPWSTR, HRESULT)
    configure_byot : Proc(IServiceSysTxnConfig*, ITransaction, HRESULT)
    configure_byot_sys_txn : Proc(IServiceSysTxnConfig*, ITransactionProxy, HRESULT)
  end

  IServiceSysTxnConfig_GUID = LibC::GUID.new("33caf1a1-fcb8-472b-b45e-967448ded6d8")
  CLSID_IServiceSysTxnConfig = "33caf1a1-fcb8-472b-b45e-967448ded6d8"
  struct IServiceSysTxnConfig
    lpVtbl : IServiceSysTxnConfigVTbl*
  end

  struct IServiceSynchronizationConfigVTbl
    query_interface : Proc(IServiceSynchronizationConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceSynchronizationConfig*, UInt32)
    release : Proc(IServiceSynchronizationConfig*, UInt32)
    configure_synchronization : Proc(IServiceSynchronizationConfig*, CSC_SynchronizationConfig, HRESULT)
  end

  IServiceSynchronizationConfig_GUID = LibC::GUID.new("fd880e81-6dce-4c58-af83-a208846c0030")
  CLSID_IServiceSynchronizationConfig = "fd880e81-6dce-4c58-af83-a208846c0030"
  struct IServiceSynchronizationConfig
    lpVtbl : IServiceSynchronizationConfigVTbl*
  end

  struct IServiceTrackerConfigVTbl
    query_interface : Proc(IServiceTrackerConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceTrackerConfig*, UInt32)
    release : Proc(IServiceTrackerConfig*, UInt32)
    tracker_config : Proc(IServiceTrackerConfig*, CSC_TrackerConfig, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IServiceTrackerConfig_GUID = LibC::GUID.new("6c3a3e1d-0ba6-4036-b76f-d0404db816c9")
  CLSID_IServiceTrackerConfig = "6c3a3e1d-0ba6-4036-b76f-d0404db816c9"
  struct IServiceTrackerConfig
    lpVtbl : IServiceTrackerConfigVTbl*
  end

  struct IServicePartitionConfigVTbl
    query_interface : Proc(IServicePartitionConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServicePartitionConfig*, UInt32)
    release : Proc(IServicePartitionConfig*, UInt32)
    partition_config : Proc(IServicePartitionConfig*, CSC_PartitionConfig, HRESULT)
    partition_id : Proc(IServicePartitionConfig*, Guid*, HRESULT)
  end

  IServicePartitionConfig_GUID = LibC::GUID.new("80182d03-5ea4-4831-ae97-55beffc2e590")
  CLSID_IServicePartitionConfig = "80182d03-5ea4-4831-ae97-55beffc2e590"
  struct IServicePartitionConfig
    lpVtbl : IServicePartitionConfigVTbl*
  end

  struct IServiceCallVTbl
    query_interface : Proc(IServiceCall*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceCall*, UInt32)
    release : Proc(IServiceCall*, UInt32)
    on_call : Proc(IServiceCall*, HRESULT)
  end

  IServiceCall_GUID = LibC::GUID.new("bd3e2e12-42dd-40f4-a09a-95a50c58304b")
  CLSID_IServiceCall = "bd3e2e12-42dd-40f4-a09a-95a50c58304b"
  struct IServiceCall
    lpVtbl : IServiceCallVTbl*
  end

  struct IAsyncErrorNotifyVTbl
    query_interface : Proc(IAsyncErrorNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAsyncErrorNotify*, UInt32)
    release : Proc(IAsyncErrorNotify*, UInt32)
    on_error : Proc(IAsyncErrorNotify*, HRESULT, HRESULT)
  end

  IAsyncErrorNotify_GUID = LibC::GUID.new("fe6777fb-a674-4177-8f32-6d707e113484")
  CLSID_IAsyncErrorNotify = "fe6777fb-a674-4177-8f32-6d707e113484"
  struct IAsyncErrorNotify
    lpVtbl : IAsyncErrorNotifyVTbl*
  end

  struct IServiceActivityVTbl
    query_interface : Proc(IServiceActivity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceActivity*, UInt32)
    release : Proc(IServiceActivity*, UInt32)
    synchronous_call : Proc(IServiceActivity*, IServiceCall, HRESULT)
    asynchronous_call : Proc(IServiceActivity*, IServiceCall, HRESULT)
    bind_to_current_thread : Proc(IServiceActivity*, HRESULT)
    unbind_from_thread : Proc(IServiceActivity*, HRESULT)
  end

  IServiceActivity_GUID = LibC::GUID.new("67532e0c-9e2f-4450-a354-035633944e17")
  CLSID_IServiceActivity = "67532e0c-9e2f-4450-a354-035633944e17"
  struct IServiceActivity
    lpVtbl : IServiceActivityVTbl*
  end

  struct IThreadPoolKnobsVTbl
    query_interface : Proc(IThreadPoolKnobs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IThreadPoolKnobs*, UInt32)
    release : Proc(IThreadPoolKnobs*, UInt32)
    get_max_threads : Proc(IThreadPoolKnobs*, Int32*, HRESULT)
    get_current_threads : Proc(IThreadPoolKnobs*, Int32*, HRESULT)
    set_max_threads : Proc(IThreadPoolKnobs*, Int32, HRESULT)
    get_delete_delay : Proc(IThreadPoolKnobs*, Int32*, HRESULT)
    set_delete_delay : Proc(IThreadPoolKnobs*, Int32, HRESULT)
    get_max_queued_requests : Proc(IThreadPoolKnobs*, Int32*, HRESULT)
    get_current_queued_requests : Proc(IThreadPoolKnobs*, Int32*, HRESULT)
    set_max_queued_requests : Proc(IThreadPoolKnobs*, Int32, HRESULT)
    set_min_threads : Proc(IThreadPoolKnobs*, Int32, HRESULT)
    set_queue_depth : Proc(IThreadPoolKnobs*, Int32, HRESULT)
  end

  IThreadPoolKnobs_GUID = LibC::GUID.new("51372af7-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IThreadPoolKnobs = "51372af7-cae7-11cf-be81-00aa00a2fa25"
  struct IThreadPoolKnobs
    lpVtbl : IThreadPoolKnobsVTbl*
  end

  struct IComStaThreadPoolKnobsVTbl
    query_interface : Proc(IComStaThreadPoolKnobs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComStaThreadPoolKnobs*, UInt32)
    release : Proc(IComStaThreadPoolKnobs*, UInt32)
    set_min_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32, HRESULT)
    get_min_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32*, HRESULT)
    set_max_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32, HRESULT)
    get_max_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32*, HRESULT)
    set_activity_per_thread : Proc(IComStaThreadPoolKnobs*, UInt32, HRESULT)
    get_activity_per_thread : Proc(IComStaThreadPoolKnobs*, UInt32*, HRESULT)
    set_activity_ratio : Proc(IComStaThreadPoolKnobs*, Float64, HRESULT)
    get_activity_ratio : Proc(IComStaThreadPoolKnobs*, Float64*, HRESULT)
    get_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32*, HRESULT)
    get_queue_depth : Proc(IComStaThreadPoolKnobs*, UInt32*, HRESULT)
    set_queue_depth : Proc(IComStaThreadPoolKnobs*, Int32, HRESULT)
  end

  IComStaThreadPoolKnobs_GUID = LibC::GUID.new("324b64fa-33b6-11d2-98b7-00c04f8ee1c4")
  CLSID_IComStaThreadPoolKnobs = "324b64fa-33b6-11d2-98b7-00c04f8ee1c4"
  struct IComStaThreadPoolKnobs
    lpVtbl : IComStaThreadPoolKnobsVTbl*
  end

  struct IComMtaThreadPoolKnobsVTbl
    query_interface : Proc(IComMtaThreadPoolKnobs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComMtaThreadPoolKnobs*, UInt32)
    release : Proc(IComMtaThreadPoolKnobs*, UInt32)
    mta_set_max_thread_count : Proc(IComMtaThreadPoolKnobs*, UInt32, HRESULT)
    mta_get_max_thread_count : Proc(IComMtaThreadPoolKnobs*, UInt32*, HRESULT)
    mta_set_throttle_value : Proc(IComMtaThreadPoolKnobs*, UInt32, HRESULT)
    mta_get_throttle_value : Proc(IComMtaThreadPoolKnobs*, UInt32*, HRESULT)
  end

  IComMtaThreadPoolKnobs_GUID = LibC::GUID.new("f9a76d2e-76a5-43eb-a0c4-49bec8e48480")
  CLSID_IComMtaThreadPoolKnobs = "f9a76d2e-76a5-43eb-a0c4-49bec8e48480"
  struct IComMtaThreadPoolKnobs
    lpVtbl : IComMtaThreadPoolKnobsVTbl*
  end

  struct IComStaThreadPoolKnobs2VTbl
    query_interface : Proc(IComStaThreadPoolKnobs2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComStaThreadPoolKnobs2*, UInt32)
    release : Proc(IComStaThreadPoolKnobs2*, UInt32)
    set_min_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32, HRESULT)
    get_min_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_max_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32, HRESULT)
    get_max_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_activity_per_thread : Proc(IComStaThreadPoolKnobs2*, UInt32, HRESULT)
    get_activity_per_thread : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_activity_ratio : Proc(IComStaThreadPoolKnobs2*, Float64, HRESULT)
    get_activity_ratio : Proc(IComStaThreadPoolKnobs2*, Float64*, HRESULT)
    get_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    get_queue_depth : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_queue_depth : Proc(IComStaThreadPoolKnobs2*, Int32, HRESULT)
    get_max_cpu_load : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_max_cpu_load : Proc(IComStaThreadPoolKnobs2*, Int32, HRESULT)
    get_cpu_metric_enabled : Proc(IComStaThreadPoolKnobs2*, LibC::BOOL*, HRESULT)
    set_cpu_metric_enabled : Proc(IComStaThreadPoolKnobs2*, LibC::BOOL, HRESULT)
    get_create_threads_aggressively : Proc(IComStaThreadPoolKnobs2*, LibC::BOOL*, HRESULT)
    set_create_threads_aggressively : Proc(IComStaThreadPoolKnobs2*, LibC::BOOL, HRESULT)
    get_max_csr : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_max_csr : Proc(IComStaThreadPoolKnobs2*, Int32, HRESULT)
    get_wait_time_for_thread_cleanup : Proc(IComStaThreadPoolKnobs2*, UInt32*, HRESULT)
    set_wait_time_for_thread_cleanup : Proc(IComStaThreadPoolKnobs2*, Int32, HRESULT)
  end

  IComStaThreadPoolKnobs2_GUID = LibC::GUID.new("73707523-ff9a-4974-bf84-2108dc213740")
  CLSID_IComStaThreadPoolKnobs2 = "73707523-ff9a-4974-bf84-2108dc213740"
  struct IComStaThreadPoolKnobs2
    lpVtbl : IComStaThreadPoolKnobs2VTbl*
  end

  struct IProcessInitializerVTbl
    query_interface : Proc(IProcessInitializer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProcessInitializer*, UInt32)
    release : Proc(IProcessInitializer*, UInt32)
    startup : Proc(IProcessInitializer*, IUnknown, HRESULT)
    shutdown : Proc(IProcessInitializer*, HRESULT)
  end

  IProcessInitializer_GUID = LibC::GUID.new("1113f52d-dc7f-4943-aed6-88d04027e32a")
  CLSID_IProcessInitializer = "1113f52d-dc7f-4943-aed6-88d04027e32a"
  struct IProcessInitializer
    lpVtbl : IProcessInitializerVTbl*
  end

  struct IServicePoolConfigVTbl
    query_interface : Proc(IServicePoolConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServicePoolConfig*, UInt32)
    release : Proc(IServicePoolConfig*, UInt32)
    put_max_pool_size : Proc(IServicePoolConfig*, UInt32, HRESULT)
    get_max_pool_size : Proc(IServicePoolConfig*, UInt32*, HRESULT)
    put_min_pool_size : Proc(IServicePoolConfig*, UInt32, HRESULT)
    get_min_pool_size : Proc(IServicePoolConfig*, UInt32*, HRESULT)
    put_creation_timeout : Proc(IServicePoolConfig*, UInt32, HRESULT)
    get_creation_timeout : Proc(IServicePoolConfig*, UInt32*, HRESULT)
    put_transaction_affinity : Proc(IServicePoolConfig*, LibC::BOOL, HRESULT)
    get_transaction_affinity : Proc(IServicePoolConfig*, LibC::BOOL*, HRESULT)
    put_class_factory : Proc(IServicePoolConfig*, IClassFactory, HRESULT)
    get_class_factory : Proc(IServicePoolConfig*, IClassFactory*, HRESULT)
  end

  IServicePoolConfig_GUID = LibC::GUID.new("a9690656-5bca-470c-8451-250c1f43a33e")
  CLSID_IServicePoolConfig = "a9690656-5bca-470c-8451-250c1f43a33e"
  struct IServicePoolConfig
    lpVtbl : IServicePoolConfigVTbl*
  end

  struct IServicePoolVTbl
    query_interface : Proc(IServicePool*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServicePool*, UInt32)
    release : Proc(IServicePool*, UInt32)
    initialize : Proc(IServicePool*, IUnknown, HRESULT)
    get_object : Proc(IServicePool*, Guid*, Void**, HRESULT)
    shutdown : Proc(IServicePool*, HRESULT)
  end

  IServicePool_GUID = LibC::GUID.new("b302df81-ea45-451e-99a2-09f9fd1b1e13")
  CLSID_IServicePool = "b302df81-ea45-451e-99a2-09f9fd1b1e13"
  struct IServicePool
    lpVtbl : IServicePoolVTbl*
  end

  struct IManagedPooledObjVTbl
    query_interface : Proc(IManagedPooledObj*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManagedPooledObj*, UInt32)
    release : Proc(IManagedPooledObj*, UInt32)
    set_held : Proc(IManagedPooledObj*, LibC::BOOL, HRESULT)
  end

  IManagedPooledObj_GUID = LibC::GUID.new("c5da4bea-1b42-4437-8926-b6a38860a770")
  CLSID_IManagedPooledObj = "c5da4bea-1b42-4437-8926-b6a38860a770"
  struct IManagedPooledObj
    lpVtbl : IManagedPooledObjVTbl*
  end

  struct IManagedPoolActionVTbl
    query_interface : Proc(IManagedPoolAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManagedPoolAction*, UInt32)
    release : Proc(IManagedPoolAction*, UInt32)
    last_release : Proc(IManagedPoolAction*, HRESULT)
  end

  IManagedPoolAction_GUID = LibC::GUID.new("da91b74e-5388-4783-949d-c1cd5fb00506")
  CLSID_IManagedPoolAction = "da91b74e-5388-4783-949d-c1cd5fb00506"
  struct IManagedPoolAction
    lpVtbl : IManagedPoolActionVTbl*
  end

  struct IManagedObjectInfoVTbl
    query_interface : Proc(IManagedObjectInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManagedObjectInfo*, UInt32)
    release : Proc(IManagedObjectInfo*, UInt32)
    get_i_unknown : Proc(IManagedObjectInfo*, IUnknown*, HRESULT)
    get_i_object_control : Proc(IManagedObjectInfo*, IObjectControl*, HRESULT)
    set_in_pool : Proc(IManagedObjectInfo*, LibC::BOOL, IManagedPooledObj, HRESULT)
    set_wrapper_strength : Proc(IManagedObjectInfo*, LibC::BOOL, HRESULT)
  end

  IManagedObjectInfo_GUID = LibC::GUID.new("1427c51a-4584-49d8-90a0-c50d8086cbe9")
  CLSID_IManagedObjectInfo = "1427c51a-4584-49d8-90a0-c50d8086cbe9"
  struct IManagedObjectInfo
    lpVtbl : IManagedObjectInfoVTbl*
  end

  struct IAppDomainHelperVTbl
    query_interface : Proc(IAppDomainHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAppDomainHelper*, UInt32)
    release : Proc(IAppDomainHelper*, UInt32)
    get_type_info_count : Proc(IAppDomainHelper*, UInt32*, HRESULT)
    get_type_info : Proc(IAppDomainHelper*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAppDomainHelper*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAppDomainHelper*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IAppDomainHelper*, IUnknown, LibC::IntPtrT, Void*, HRESULT)
    do_callback : Proc(IAppDomainHelper*, IUnknown, LibC::IntPtrT, Void*, HRESULT)
  end

  IAppDomainHelper_GUID = LibC::GUID.new("c7b67079-8255-42c6-9ec0-6994a3548780")
  CLSID_IAppDomainHelper = "c7b67079-8255-42c6-9ec0-6994a3548780"
  struct IAppDomainHelper
    lpVtbl : IAppDomainHelperVTbl*
  end

  struct IAssemblyLocatorVTbl
    query_interface : Proc(IAssemblyLocator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAssemblyLocator*, UInt32)
    release : Proc(IAssemblyLocator*, UInt32)
    get_type_info_count : Proc(IAssemblyLocator*, UInt32*, HRESULT)
    get_type_info : Proc(IAssemblyLocator*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAssemblyLocator*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAssemblyLocator*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_modules : Proc(IAssemblyLocator*, UInt8*, UInt8*, UInt8*, SAFEARRAY**, HRESULT)
  end

  IAssemblyLocator_GUID = LibC::GUID.new("391ffbb9-a8ee-432a-abc8-baa238dab90f")
  CLSID_IAssemblyLocator = "391ffbb9-a8ee-432a-abc8-baa238dab90f"
  struct IAssemblyLocator
    lpVtbl : IAssemblyLocatorVTbl*
  end

  struct IManagedActivationEventsVTbl
    query_interface : Proc(IManagedActivationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManagedActivationEvents*, UInt32)
    release : Proc(IManagedActivationEvents*, UInt32)
    create_managed_stub : Proc(IManagedActivationEvents*, IManagedObjectInfo, LibC::BOOL, HRESULT)
    destroy_managed_stub : Proc(IManagedActivationEvents*, IManagedObjectInfo, HRESULT)
  end

  IManagedActivationEvents_GUID = LibC::GUID.new("a5f325af-572f-46da-b8ab-827c3d95d99e")
  CLSID_IManagedActivationEvents = "a5f325af-572f-46da-b8ab-827c3d95d99e"
  struct IManagedActivationEvents
    lpVtbl : IManagedActivationEventsVTbl*
  end

  struct ISendMethodEventsVTbl
    query_interface : Proc(ISendMethodEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISendMethodEvents*, UInt32)
    release : Proc(ISendMethodEvents*, UInt32)
    send_method_call : Proc(ISendMethodEvents*, Void*, Guid*, UInt32, HRESULT)
    send_method_return : Proc(ISendMethodEvents*, Void*, Guid*, UInt32, HRESULT, HRESULT, HRESULT)
  end

  ISendMethodEvents_GUID = LibC::GUID.new("2732fd59-b2b4-4d44-878c-8b8f09626008")
  CLSID_ISendMethodEvents = "2732fd59-b2b4-4d44-878c-8b8f09626008"
  struct ISendMethodEvents
    lpVtbl : ISendMethodEventsVTbl*
  end

  struct ITransactionResourcePoolVTbl
    query_interface : Proc(ITransactionResourcePool*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionResourcePool*, UInt32)
    release : Proc(ITransactionResourcePool*, UInt32)
    put_resource : Proc(ITransactionResourcePool*, IObjPool, IUnknown, HRESULT)
    get_resource : Proc(ITransactionResourcePool*, IObjPool, IUnknown*, HRESULT)
  end

  ITransactionResourcePool_GUID = LibC::GUID.new("c5feb7c1-346a-11d1-b1cc-00aa00ba3258")
  CLSID_ITransactionResourcePool = "c5feb7c1-346a-11d1-b1cc-00aa00ba3258"
  struct ITransactionResourcePool
    lpVtbl : ITransactionResourcePoolVTbl*
  end

  struct IMTSCallVTbl
    query_interface : Proc(IMTSCall*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMTSCall*, UInt32)
    release : Proc(IMTSCall*, UInt32)
    on_call : Proc(IMTSCall*, HRESULT)
  end

  IMTSCall_GUID = LibC::GUID.new("51372aef-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IMTSCall = "51372aef-cae7-11cf-be81-00aa00a2fa25"
  struct IMTSCall
    lpVtbl : IMTSCallVTbl*
  end

  struct IContextPropertiesVTbl
    query_interface : Proc(IContextProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IContextProperties*, UInt32)
    release : Proc(IContextProperties*, UInt32)
    count : Proc(IContextProperties*, Int32*, HRESULT)
    get_property : Proc(IContextProperties*, UInt8*, VARIANT*, HRESULT)
    enum_names : Proc(IContextProperties*, IEnumNames*, HRESULT)
    set_property : Proc(IContextProperties*, UInt8*, VARIANT, HRESULT)
    remove_property : Proc(IContextProperties*, UInt8*, HRESULT)
  end

  IContextProperties_GUID = LibC::GUID.new("d396da85-bf8f-11d1-bbae-00c04fc2fa5f")
  CLSID_IContextProperties = "d396da85-bf8f-11d1-bbae-00c04fc2fa5f"
  struct IContextProperties
    lpVtbl : IContextPropertiesVTbl*
  end

  struct IObjPoolVTbl
    query_interface : Proc(IObjPool*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjPool*, UInt32)
    release : Proc(IObjPool*, UInt32)
    reserved1 : Proc(IObjPool*, Void)
    reserved2 : Proc(IObjPool*, Void)
    reserved3 : Proc(IObjPool*, Void)
    reserved4 : Proc(IObjPool*, Void)
    put_end_tx : Proc(IObjPool*, IUnknown, Void)
    reserved5 : Proc(IObjPool*, Void)
    reserved6 : Proc(IObjPool*, Void)
  end

  IObjPool_GUID = LibC::GUID.new("7d8805a0-2ea7-11d1-b1cc-00aa00ba3258")
  CLSID_IObjPool = "7d8805a0-2ea7-11d1-b1cc-00aa00ba3258"
  struct IObjPool
    lpVtbl : IObjPoolVTbl*
  end

  struct ITransactionPropertyVTbl
    query_interface : Proc(ITransactionProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransactionProperty*, UInt32)
    release : Proc(ITransactionProperty*, UInt32)
    reserved1 : Proc(ITransactionProperty*, Void)
    reserved2 : Proc(ITransactionProperty*, Void)
    reserved3 : Proc(ITransactionProperty*, Void)
    reserved4 : Proc(ITransactionProperty*, Void)
    reserved5 : Proc(ITransactionProperty*, Void)
    reserved6 : Proc(ITransactionProperty*, Void)
    reserved7 : Proc(ITransactionProperty*, Void)
    reserved8 : Proc(ITransactionProperty*, Void)
    reserved9 : Proc(ITransactionProperty*, Void)
    get_transaction_resource_pool : Proc(ITransactionProperty*, ITransactionResourcePool*, HRESULT)
    reserved10 : Proc(ITransactionProperty*, Void)
    reserved11 : Proc(ITransactionProperty*, Void)
    reserved12 : Proc(ITransactionProperty*, Void)
    reserved13 : Proc(ITransactionProperty*, Void)
    reserved14 : Proc(ITransactionProperty*, Void)
    reserved15 : Proc(ITransactionProperty*, Void)
    reserved16 : Proc(ITransactionProperty*, Void)
    reserved17 : Proc(ITransactionProperty*, Void)
  end

  ITransactionProperty_GUID = LibC::GUID.new("788ea814-87b1-11d1-bba6-00c04fc2fa5f")
  CLSID_ITransactionProperty = "788ea814-87b1-11d1-bba6-00c04fc2fa5f"
  struct ITransactionProperty
    lpVtbl : ITransactionPropertyVTbl*
  end

  struct IMTSActivityVTbl
    query_interface : Proc(IMTSActivity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMTSActivity*, UInt32)
    release : Proc(IMTSActivity*, UInt32)
    synchronous_call : Proc(IMTSActivity*, IMTSCall, HRESULT)
    async_call : Proc(IMTSActivity*, IMTSCall, HRESULT)
    reserved1 : Proc(IMTSActivity*, Void)
    bind_to_current_thread : Proc(IMTSActivity*, HRESULT)
    unbind_from_thread : Proc(IMTSActivity*, HRESULT)
  end

  IMTSActivity_GUID = LibC::GUID.new("51372af0-cae7-11cf-be81-00aa00a2fa25")
  CLSID_IMTSActivity = "51372af0-cae7-11cf-be81-00aa00a2fa25"
  struct IMTSActivity
    lpVtbl : IMTSActivityVTbl*
  end


  # Params # apttype : APTTYPE [In],riid : Guid* [In],ppv : Void** [In]
  fun CoGetDefaultContext(apttype : APTTYPE, riid : Guid*, ppv : Void**) : HRESULT

  # Params # piunknown : IUnknown [In],riid : Guid* [In],ppobj : Void** [In]
  fun CoCreateActivity(piunknown : IUnknown, riid : Guid*, ppobj : Void**) : HRESULT

  # Params # pconfigobject : IUnknown [In]
  fun CoEnterServiceDomain(pconfigobject : IUnknown) : HRESULT

  # Params # punkstatus : IUnknown [In]
  fun CoLeaveServiceDomain(punkstatus : IUnknown)

  # Params # dwexts : UInt32* [In]
  fun GetManagedExtensions(dwexts : UInt32*) : HRESULT

  # Params # rid : Guid* [In],punk : IUnknown [In]
  fun SafeRef(rid : Guid*, punk : IUnknown) : Void*

  # Params # lreasoncode : Int32 [In]
  fun RecycleSurrogate(lreasoncode : Int32) : HRESULT

  # Params # riid : Guid* [In],ppobj : Void** [In]
  fun MTSCreateActivity(riid : Guid*, ppobj : Void**) : HRESULT

  # Params # param0 : IDispenserManager* [In]
  fun GetDispenserManager(param0 : IDispenserManager*) : HRESULT
end
