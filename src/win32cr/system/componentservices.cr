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
  CLSID_SecurityIdentity = LibC::GUID.new(0xecabb0a5_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_SecurityCallers = LibC::GUID.new(0xecabb0a6_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_SecurityCallContext = LibC::GUID.new(0xecabb0a7_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_GetSecurityCallContextAppObject = LibC::GUID.new(0xecabb0a8_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_Dummy30040732 = LibC::GUID.new(0xecabb0a9_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_TransactionContext = LibC::GUID.new(0x7999fc25_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  CLSID_TransactionContextEx = LibC::GUID.new(0x5cb66670_u32, 0xd3d4_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  CLSID_ByotServerEx = LibC::GUID.new(0xecabb0aa_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_CServiceConfig = LibC::GUID.new(0xecabb0c8_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_ServicePool = LibC::GUID.new(0xecabb0c9_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_ServicePoolConfig = LibC::GUID.new(0xecabb0ca_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_SharedProperty = LibC::GUID.new(0x2a005c05_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  CLSID_SharedPropertyGroup = LibC::GUID.new(0x2a005c0b_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  CLSID_SharedPropertyGroupManager = LibC::GUID.new(0x2a005c11_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  CLSID_COMEvents = LibC::GUID.new(0xecabb0ab_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_CoMTSLocator = LibC::GUID.new(0xecabb0ac_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_MtsGrp = LibC::GUID.new(0x4b2e958d_u32, 0x393_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xab_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  CLSID_ComServiceEvents = LibC::GUID.new(0xecabb0c3_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_ComSystemAppEventData = LibC::GUID.new(0xecabb0c6_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_CRMClerk = LibC::GUID.new(0xecabb0bd_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_CRMRecoveryClerk = LibC::GUID.new(0xecabb0be_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_LBEvents = LibC::GUID.new(0xecabb0c1_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_MessageMover = LibC::GUID.new(0xecabb0bf_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_DispenserManager = LibC::GUID.new(0xecabb0c0_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_PoolMgr = LibC::GUID.new(0xecabafb5_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_EventServer = LibC::GUID.new(0xecabafbc_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_TrackerServer = LibC::GUID.new(0xecabafb9_u32, 0x7f19_u16, 0x11d2_u16, StaticArray[0x97_u8, 0x8e_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  CLSID_AppDomainHelper = LibC::GUID.new(0xef24f689_u32, 0x14f8_u16, 0x4d92_u16, StaticArray[0xb4_u8, 0xaf_u8, 0xd7_u8, 0xb1_u8, 0xf0_u8, 0xe7_u8, 0xf_u8, 0xd4_u8])
  CLSID_ClrAssemblyLocator = LibC::GUID.new(0x458aa3b5_u32, 0x265a_u16, 0x4b75_u16, StaticArray[0xbc_u8, 0x5_u8, 0x9b_u8, 0xea_u8, 0x46_u8, 0x30_u8, 0xcf_u8, 0x18_u8])
  CLSID_COMAdminCatalog = LibC::GUID.new(0xf618c514_u32, 0xdfb8_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
  CLSID_COMAdminCatalogObject = LibC::GUID.new(0xf618c515_u32, 0xdfb8_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
  CLSID_COMAdminCatalogCollection = LibC::GUID.new(0xf618c516_u32, 0xdfb8_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])


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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_collection : UInt64
    connect : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
    get_collection_by_query : UInt64
    import_component : UInt64
    install_component : UInt64
    shutdown_application : UInt64
    export_application : UInt64
    install_application : UInt64
    stop_router : UInt64
    refresh_router : UInt64
    start_router : UInt64
    reserved1 : UInt64
    reserved2 : UInt64
    install_multiple_components : UInt64
    get_multiple_components_info : UInt64
    refresh_components : UInt64
    backup_regdb : UInt64
    restore_regdb : UInt64
    query_application_file : UInt64
    start_application : UInt64
    service_check : UInt64
    install_multiple_event_classes : UInt64
    install_event_class : UInt64
    get_event_classes_for_iid : UInt64
  end

  ICOMAdminCatalog_GUID = "dd662187-dfc2-11d1-a2cf-00805fc79235"
  IID_ICOMAdminCatalog = LibC::GUID.new(0xdd662187_u32, 0xdfc2_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
  struct ICOMAdminCatalog
    lpVtbl : ICOMAdminCatalogVTbl*
  end

  struct ICOMAdminCatalog2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_collection : UInt64
    connect : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
    get_collection_by_query : UInt64
    import_component : UInt64
    install_component : UInt64
    shutdown_application : UInt64
    export_application : UInt64
    install_application : UInt64
    stop_router : UInt64
    refresh_router : UInt64
    start_router : UInt64
    reserved1 : UInt64
    reserved2 : UInt64
    install_multiple_components : UInt64
    get_multiple_components_info : UInt64
    refresh_components : UInt64
    backup_regdb : UInt64
    restore_regdb : UInt64
    query_application_file : UInt64
    start_application : UInt64
    service_check : UInt64
    install_multiple_event_classes : UInt64
    install_event_class : UInt64
    get_event_classes_for_iid : UInt64
    get_collection_by_query2 : UInt64
    get_application_instance_id_from_process_id : UInt64
    shutdown_application_instances : UInt64
    pause_application_instances : UInt64
    resume_application_instances : UInt64
    recycle_application_instances : UInt64
    are_application_instances_paused : UInt64
    dump_application_instance : UInt64
    get_is_application_instance_dump_supported : UInt64
    create_service_for_application : UInt64
    delete_service_for_application : UInt64
    get_partition_id : UInt64
    get_partition_name : UInt64
    put_current_partition : UInt64
    get_current_partition_id : UInt64
    get_current_partition_name : UInt64
    get_global_partition_id : UInt64
    flush_partition_cache : UInt64
    copy_applications : UInt64
    copy_components : UInt64
    move_components : UInt64
    alias_component : UInt64
    is_safe_to_delete : UInt64
    import_unconfigured_components : UInt64
    promote_unconfigured_components : UInt64
    import_components : UInt64
    get_is64_bit_catalog_server : UInt64
    export_partition : UInt64
    install_partition : UInt64
    query_application_file2 : UInt64
    get_component_version_count : UInt64
  end

  ICOMAdminCatalog2_GUID = "790c6e0b-9194-4cc9-9426-a48a63185696"
  IID_ICOMAdminCatalog2 = LibC::GUID.new(0x790c6e0b_u32, 0x9194_u16, 0x4cc9_u16, StaticArray[0x94_u8, 0x26_u8, 0xa4_u8, 0x8a_u8, 0x63_u8, 0x18_u8, 0x56_u8, 0x96_u8])
  struct ICOMAdminCatalog2
    lpVtbl : ICOMAdminCatalog2VTbl*
  end

  struct ICatalogObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_value : UInt64
    put_value : UInt64
    get_key : UInt64
    get_name : UInt64
    is_property_read_only : UInt64
    get_valid : UInt64
    is_property_write_only : UInt64
  end

  ICatalogObject_GUID = "6eb22871-8a19-11d0-81b6-00a0c9231c29"
  IID_ICatalogObject = LibC::GUID.new(0x6eb22871_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct ICatalogObject
    lpVtbl : ICatalogObjectVTbl*
  end

  struct ICatalogCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get__new_enum : UInt64
    get_item : UInt64
    get_count : UInt64
    remove : UInt64
    add : UInt64
    populate : UInt64
    save_changes : UInt64
    get_collection : UInt64
    get_name : UInt64
    get_add_enabled : UInt64
    get_remove_enabled : UInt64
    get_util_interface : UInt64
    get_data_store_major_version : UInt64
    get_data_store_minor_version : UInt64
    populate_by_key : UInt64
    populate_by_query : UInt64
  end

  ICatalogCollection_GUID = "6eb22872-8a19-11d0-81b6-00a0c9231c29"
  IID_ICatalogCollection = LibC::GUID.new(0x6eb22872_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct ICatalogCollection
    lpVtbl : ICatalogCollectionVTbl*
  end

  struct ISecurityIdentityCollVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  ISecurityIdentityColl_GUID = "cafc823c-b441-11d1-b82b-0000f8757e2a"
  IID_ISecurityIdentityColl = LibC::GUID.new(0xcafc823c_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  struct ISecurityIdentityColl
    lpVtbl : ISecurityIdentityCollVTbl*
  end

  struct ISecurityCallersCollVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
  end

  ISecurityCallersColl_GUID = "cafc823d-b441-11d1-b82b-0000f8757e2a"
  IID_ISecurityCallersColl = LibC::GUID.new(0xcafc823d_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  struct ISecurityCallersColl
    lpVtbl : ISecurityCallersCollVTbl*
  end

  struct ISecurityCallContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    is_caller_in_role : UInt64
    is_security_enabled : UInt64
    is_user_in_role : UInt64
  end

  ISecurityCallContext_GUID = "cafc823e-b441-11d1-b82b-0000f8757e2a"
  IID_ISecurityCallContext = LibC::GUID.new(0xcafc823e_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  struct ISecurityCallContext
    lpVtbl : ISecurityCallContextVTbl*
  end

  struct IGetSecurityCallContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_security_call_context : UInt64
  end

  IGetSecurityCallContext_GUID = "cafc823f-b441-11d1-b82b-0000f8757e2a"
  IID_IGetSecurityCallContext = LibC::GUID.new(0xcafc823f_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
  struct IGetSecurityCallContext
    lpVtbl : IGetSecurityCallContextVTbl*
  end

  struct SecurityPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_direct_caller_name : UInt64
    get_direct_creator_name : UInt64
    get_original_caller_name : UInt64
    get_original_creator_name : UInt64
  end

  SecurityProperty_GUID = "e74a7215-014d-11d1-a63c-00a0c911b4e0"
  IID_SecurityProperty = LibC::GUID.new(0xe74a7215_u32, 0x14d_u16, 0x11d1_u16, StaticArray[0xa6_u8, 0x3c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x11_u8, 0xb4_u8, 0xe0_u8])
  struct SecurityProperty
    lpVtbl : SecurityPropertyVTbl*
  end

  struct ContextInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    is_in_transaction : UInt64
    get_transaction : UInt64
    get_transaction_id : UInt64
    get_activity_id : UInt64
    get_context_id : UInt64
  end

  ContextInfo_GUID = "19a5a02c-0ac8-11d2-b286-00c04f8ef934"
  IID_ContextInfo = LibC::GUID.new(0x19a5a02c_u32, 0xac8_u16, 0x11d2_u16, StaticArray[0xb2_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0x34_u8])
  struct ContextInfo
    lpVtbl : ContextInfoVTbl*
  end

  struct ContextInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    is_in_transaction : UInt64
    get_transaction : UInt64
    get_transaction_id : UInt64
    get_activity_id : UInt64
    get_context_id : UInt64
    get_partition_id : UInt64
    get_application_id : UInt64
    get_application_instance_id : UInt64
  end

  ContextInfo2_GUID = "c99d6e75-2375-11d4-8331-00c04f605588"
  IID_ContextInfo2 = LibC::GUID.new(0xc99d6e75_u32, 0x2375_u16, 0x11d4_u16, StaticArray[0x83_u8, 0x31_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x60_u8, 0x55_u8, 0x88_u8])
  struct ContextInfo2
    lpVtbl : ContextInfo2VTbl*
  end

  struct ObjectContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_instance : UInt64
    set_complete : UInt64
    set_abort : UInt64
    enable_commit : UInt64
    disable_commit : UInt64
    is_in_transaction : UInt64
    is_security_enabled : UInt64
    is_caller_in_role : UInt64
    get_count : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_security : UInt64
    get_context_info : UInt64
  end

  ObjectContext_GUID = "74c08646-cedb-11cf-8b49-00aa00b8a790"
  IID_ObjectContext = LibC::GUID.new(0x74c08646_u32, 0xcedb_u16, 0x11cf_u16, StaticArray[0x8b_u8, 0x49_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xa7_u8, 0x90_u8])
  struct ObjectContext
    lpVtbl : ObjectContextVTbl*
  end

  struct ITransactionContextExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instance : UInt64
    commit : UInt64
    abort : UInt64
  end

  ITransactionContextEx_GUID = "7999fc22-d3c6-11cf-acab-00a024a55aef"
  IID_ITransactionContextEx = LibC::GUID.new(0x7999fc22_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  struct ITransactionContextEx
    lpVtbl : ITransactionContextExVTbl*
  end

  struct ITransactionContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_instance : UInt64
    commit : UInt64
    abort : UInt64
  end

  ITransactionContext_GUID = "7999fc21-d3c6-11cf-acab-00a024a55aef"
  IID_ITransactionContext = LibC::GUID.new(0x7999fc21_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  struct ITransactionContext
    lpVtbl : ITransactionContextVTbl*
  end

  struct ICreateWithTransactionExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instance : UInt64
  end

  ICreateWithTransactionEx_GUID = "455acf57-5345-11d2-99cf-00c04f797bc9"
  IID_ICreateWithTransactionEx = LibC::GUID.new(0x455acf57_u32, 0x5345_u16, 0x11d2_u16, StaticArray[0x99_u8, 0xcf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
  struct ICreateWithTransactionEx
    lpVtbl : ICreateWithTransactionExVTbl*
  end

  struct ICreateWithLocalTransactionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instance_with_sys_tx : UInt64
  end

  ICreateWithLocalTransaction_GUID = "227ac7a8-8423-42ce-b7cf-03061ec9aaa3"
  IID_ICreateWithLocalTransaction = LibC::GUID.new(0x227ac7a8_u32, 0x8423_u16, 0x42ce_u16, StaticArray[0xb7_u8, 0xcf_u8, 0x3_u8, 0x6_u8, 0x1e_u8, 0xc9_u8, 0xaa_u8, 0xa3_u8])
  struct ICreateWithLocalTransaction
    lpVtbl : ICreateWithLocalTransactionVTbl*
  end

  struct ICreateWithTipTransactionExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instance : UInt64
  end

  ICreateWithTipTransactionEx_GUID = "455acf59-5345-11d2-99cf-00c04f797bc9"
  IID_ICreateWithTipTransactionEx = LibC::GUID.new(0x455acf59_u32, 0x5345_u16, 0x11d2_u16, StaticArray[0x99_u8, 0xcf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
  struct ICreateWithTipTransactionEx
    lpVtbl : ICreateWithTipTransactionExVTbl*
  end

  struct IComLTxEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_ltx_transaction_start : UInt64
    on_ltx_transaction_prepare : UInt64
    on_ltx_transaction_abort : UInt64
    on_ltx_transaction_commit : UInt64
    on_ltx_transaction_promote : UInt64
  end

  IComLTxEvents_GUID = "605cf82c-578e-4298-975d-82babcd9e053"
  IID_IComLTxEvents = LibC::GUID.new(0x605cf82c_u32, 0x578e_u16, 0x4298_u16, StaticArray[0x97_u8, 0x5d_u8, 0x82_u8, 0xba_u8, 0xbc_u8, 0xd9_u8, 0xe0_u8, 0x53_u8])
  struct IComLTxEvents
    lpVtbl : IComLTxEventsVTbl*
  end

  struct IComUserEventVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_user_event : UInt64
  end

  IComUserEvent_GUID = "683130a4-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComUserEvent = LibC::GUID.new(0x683130a4_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComUserEvent
    lpVtbl : IComUserEventVTbl*
  end

  struct IComThreadEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_thread_start : UInt64
    on_thread_terminate : UInt64
    on_thread_bind_to_apartment : UInt64
    on_thread_un_bind : UInt64
    on_thread_work_enque : UInt64
    on_thread_work_private : UInt64
    on_thread_work_public : UInt64
    on_thread_work_redirect : UInt64
    on_thread_work_reject : UInt64
    on_thread_assign_apartment : UInt64
    on_thread_unassign_apartment : UInt64
  end

  IComThreadEvents_GUID = "683130a5-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComThreadEvents = LibC::GUID.new(0x683130a5_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComThreadEvents
    lpVtbl : IComThreadEventsVTbl*
  end

  struct IComAppEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_app_activation : UInt64
    on_app_shutdown : UInt64
    on_app_force_shutdown : UInt64
  end

  IComAppEvents_GUID = "683130a6-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComAppEvents = LibC::GUID.new(0x683130a6_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComAppEvents
    lpVtbl : IComAppEventsVTbl*
  end

  struct IComInstanceEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_object_create : UInt64
    on_object_destroy : UInt64
  end

  IComInstanceEvents_GUID = "683130a7-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComInstanceEvents = LibC::GUID.new(0x683130a7_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComInstanceEvents
    lpVtbl : IComInstanceEventsVTbl*
  end

  struct IComTransactionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_transaction_start : UInt64
    on_transaction_prepare : UInt64
    on_transaction_abort : UInt64
    on_transaction_commit : UInt64
  end

  IComTransactionEvents_GUID = "683130a8-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComTransactionEvents = LibC::GUID.new(0x683130a8_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComTransactionEvents
    lpVtbl : IComTransactionEventsVTbl*
  end

  struct IComMethodEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_method_call : UInt64
    on_method_return : UInt64
    on_method_exception : UInt64
  end

  IComMethodEvents_GUID = "683130a9-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComMethodEvents = LibC::GUID.new(0x683130a9_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComMethodEvents
    lpVtbl : IComMethodEventsVTbl*
  end

  struct IComObjectEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_object_activate : UInt64
    on_object_deactivate : UInt64
    on_disable_commit : UInt64
    on_enable_commit : UInt64
    on_set_complete : UInt64
    on_set_abort : UInt64
  end

  IComObjectEvents_GUID = "683130aa-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectEvents = LibC::GUID.new(0x683130aa_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComObjectEvents
    lpVtbl : IComObjectEventsVTbl*
  end

  struct IComResourceEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_resource_create : UInt64
    on_resource_allocate : UInt64
    on_resource_recycle : UInt64
    on_resource_destroy : UInt64
    on_resource_track : UInt64
  end

  IComResourceEvents_GUID = "683130ab-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComResourceEvents = LibC::GUID.new(0x683130ab_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComResourceEvents
    lpVtbl : IComResourceEventsVTbl*
  end

  struct IComSecurityEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_authenticate : UInt64
    on_authenticate_fail : UInt64
  end

  IComSecurityEvents_GUID = "683130ac-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComSecurityEvents = LibC::GUID.new(0x683130ac_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComSecurityEvents
    lpVtbl : IComSecurityEventsVTbl*
  end

  struct IComObjectPoolEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_obj_pool_put_object : UInt64
    on_obj_pool_get_object : UInt64
    on_obj_pool_recycle_to_tx : UInt64
    on_obj_pool_get_from_tx : UInt64
  end

  IComObjectPoolEvents_GUID = "683130ad-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectPoolEvents = LibC::GUID.new(0x683130ad_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComObjectPoolEvents
    lpVtbl : IComObjectPoolEventsVTbl*
  end

  struct IComObjectPoolEvents2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_obj_pool_create_object : UInt64
    on_obj_pool_destroy_object : UInt64
    on_obj_pool_create_decision : UInt64
    on_obj_pool_timeout : UInt64
    on_obj_pool_create_pool : UInt64
  end

  IComObjectPoolEvents2_GUID = "683130ae-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectPoolEvents2 = LibC::GUID.new(0x683130ae_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComObjectPoolEvents2
    lpVtbl : IComObjectPoolEvents2VTbl*
  end

  struct IComObjectConstructionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_object_construct : UInt64
  end

  IComObjectConstructionEvents_GUID = "683130af-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectConstructionEvents = LibC::GUID.new(0x683130af_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComObjectConstructionEvents
    lpVtbl : IComObjectConstructionEventsVTbl*
  end

  struct IComActivityEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_activity_create : UInt64
    on_activity_destroy : UInt64
    on_activity_enter : UInt64
    on_activity_timeout : UInt64
    on_activity_reenter : UInt64
    on_activity_leave : UInt64
    on_activity_leave_same : UInt64
  end

  IComActivityEvents_GUID = "683130b0-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComActivityEvents = LibC::GUID.new(0x683130b0_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComActivityEvents
    lpVtbl : IComActivityEventsVTbl*
  end

  struct IComIdentityEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_iis_request_info : UInt64
  end

  IComIdentityEvents_GUID = "683130b1-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComIdentityEvents = LibC::GUID.new(0x683130b1_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComIdentityEvents
    lpVtbl : IComIdentityEventsVTbl*
  end

  struct IComQCEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_qc_record : UInt64
    on_qc_queue_open : UInt64
    on_qc_receive : UInt64
    on_qc_receive_fail : UInt64
    on_qc_move_to_re_try_queue : UInt64
    on_qc_move_to_dead_queue : UInt64
    on_qc_playback : UInt64
  end

  IComQCEvents_GUID = "683130b2-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComQCEvents = LibC::GUID.new(0x683130b2_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComQCEvents
    lpVtbl : IComQCEventsVTbl*
  end

  struct IComExceptionEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_exception_user : UInt64
  end

  IComExceptionEvents_GUID = "683130b3-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComExceptionEvents = LibC::GUID.new(0x683130b3_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComExceptionEvents
    lpVtbl : IComExceptionEventsVTbl*
  end

  struct ILBEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    target_up : UInt64
    target_down : UInt64
    engine_defined : UInt64
  end

  ILBEvents_GUID = "683130b4-2e50-11d2-98a5-00c04f8ee1c4"
  IID_ILBEvents = LibC::GUID.new(0x683130b4_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct ILBEvents
    lpVtbl : ILBEventsVTbl*
  end

  struct IComCRMEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_crm_recovery_start : UInt64
    on_crm_recovery_done : UInt64
    on_crm_checkpoint : UInt64
    on_crm_begin : UInt64
    on_crm_prepare : UInt64
    on_crm_commit : UInt64
    on_crm_abort : UInt64
    on_crm_indoubt : UInt64
    on_crm_done : UInt64
    on_crm_release : UInt64
    on_crm_analyze : UInt64
    on_crm_write : UInt64
    on_crm_forget : UInt64
    on_crm_force : UInt64
    on_crm_deliver : UInt64
  end

  IComCRMEvents_GUID = "683130b5-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComCRMEvents = LibC::GUID.new(0x683130b5_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComCRMEvents
    lpVtbl : IComCRMEventsVTbl*
  end

  struct IComMethod2EventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_method_call2 : UInt64
    on_method_return2 : UInt64
    on_method_exception2 : UInt64
  end

  IComMethod2Events_GUID = "fb388aaa-567d-4024-af8e-6e93ee748573"
  IID_IComMethod2Events = LibC::GUID.new(0xfb388aaa_u32, 0x567d_u16, 0x4024_u16, StaticArray[0xaf_u8, 0x8e_u8, 0x6e_u8, 0x93_u8, 0xee_u8, 0x74_u8, 0x85_u8, 0x73_u8])
  struct IComMethod2Events
    lpVtbl : IComMethod2EventsVTbl*
  end

  struct IComTrackingInfoEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_new_tracking_info : UInt64
  end

  IComTrackingInfoEvents_GUID = "4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec"
  IID_IComTrackingInfoEvents = LibC::GUID.new(0x4e6cdcc9_u32, 0xfb25_u16, 0x4fd5_u16, StaticArray[0x9c_u8, 0xc5_u8, 0xc9_u8, 0xf4_u8, 0xb6_u8, 0x55_u8, 0x9c_u8, 0xec_u8])
  struct IComTrackingInfoEvents
    lpVtbl : IComTrackingInfoEventsVTbl*
  end

  struct IComTrackingInfoCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    type : UInt64
    count : UInt64
    item : UInt64
  end

  IComTrackingInfoCollection_GUID = "c266c677-c9ad-49ab-9fd9-d9661078588a"
  IID_IComTrackingInfoCollection = LibC::GUID.new(0xc266c677_u32, 0xc9ad_u16, 0x49ab_u16, StaticArray[0x9f_u8, 0xd9_u8, 0xd9_u8, 0x66_u8, 0x10_u8, 0x78_u8, 0x58_u8, 0x8a_u8])
  struct IComTrackingInfoCollection
    lpVtbl : IComTrackingInfoCollectionVTbl*
  end

  struct IComTrackingInfoObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_value : UInt64
  end

  IComTrackingInfoObject_GUID = "116e42c5-d8b1-47bf-ab1e-c895ed3e2372"
  IID_IComTrackingInfoObject = LibC::GUID.new(0x116e42c5_u32, 0xd8b1_u16, 0x47bf_u16, StaticArray[0xab_u8, 0x1e_u8, 0xc8_u8, 0x95_u8, 0xed_u8, 0x3e_u8, 0x23_u8, 0x72_u8])
  struct IComTrackingInfoObject
    lpVtbl : IComTrackingInfoObjectVTbl*
  end

  struct IComTrackingInfoPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    prop_count : UInt64
    get_prop_name : UInt64
  end

  IComTrackingInfoProperties_GUID = "789b42be-6f6b-443a-898e-67abf390aa14"
  IID_IComTrackingInfoProperties = LibC::GUID.new(0x789b42be_u32, 0x6f6b_u16, 0x443a_u16, StaticArray[0x89_u8, 0x8e_u8, 0x67_u8, 0xab_u8, 0xf3_u8, 0x90_u8, 0xaa_u8, 0x14_u8])
  struct IComTrackingInfoProperties
    lpVtbl : IComTrackingInfoPropertiesVTbl*
  end

  struct IComApp2EventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_app_activation2 : UInt64
    on_app_shutdown2 : UInt64
    on_app_force_shutdown2 : UInt64
    on_app_paused2 : UInt64
    on_app_recycle2 : UInt64
  end

  IComApp2Events_GUID = "1290bc1a-b219-418d-b078-5934ded08242"
  IID_IComApp2Events = LibC::GUID.new(0x1290bc1a_u32, 0xb219_u16, 0x418d_u16, StaticArray[0xb0_u8, 0x78_u8, 0x59_u8, 0x34_u8, 0xde_u8, 0xd0_u8, 0x82_u8, 0x42_u8])
  struct IComApp2Events
    lpVtbl : IComApp2EventsVTbl*
  end

  struct IComTransaction2EventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_transaction_start2 : UInt64
    on_transaction_prepare2 : UInt64
    on_transaction_abort2 : UInt64
    on_transaction_commit2 : UInt64
  end

  IComTransaction2Events_GUID = "a136f62a-2f94-4288-86e0-d8a1fa4c0299"
  IID_IComTransaction2Events = LibC::GUID.new(0xa136f62a_u32, 0x2f94_u16, 0x4288_u16, StaticArray[0x86_u8, 0xe0_u8, 0xd8_u8, 0xa1_u8, 0xfa_u8, 0x4c_u8, 0x2_u8, 0x99_u8])
  struct IComTransaction2Events
    lpVtbl : IComTransaction2EventsVTbl*
  end

  struct IComInstance2EventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_object_create2 : UInt64
    on_object_destroy2 : UInt64
  end

  IComInstance2Events_GUID = "20e3bf07-b506-4ad5-a50c-d2ca5b9c158e"
  IID_IComInstance2Events = LibC::GUID.new(0x20e3bf07_u32, 0xb506_u16, 0x4ad5_u16, StaticArray[0xa5_u8, 0xc_u8, 0xd2_u8, 0xca_u8, 0x5b_u8, 0x9c_u8, 0x15_u8, 0x8e_u8])
  struct IComInstance2Events
    lpVtbl : IComInstance2EventsVTbl*
  end

  struct IComObjectPool2EventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_obj_pool_put_object2 : UInt64
    on_obj_pool_get_object2 : UInt64
    on_obj_pool_recycle_to_tx2 : UInt64
    on_obj_pool_get_from_tx2 : UInt64
  end

  IComObjectPool2Events_GUID = "65bf6534-85ea-4f64-8cf4-3d974b2ab1cf"
  IID_IComObjectPool2Events = LibC::GUID.new(0x65bf6534_u32, 0x85ea_u16, 0x4f64_u16, StaticArray[0x8c_u8, 0xf4_u8, 0x3d_u8, 0x97_u8, 0x4b_u8, 0x2a_u8, 0xb1_u8, 0xcf_u8])
  struct IComObjectPool2Events
    lpVtbl : IComObjectPool2EventsVTbl*
  end

  struct IComObjectConstruction2EventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_object_construct2 : UInt64
  end

  IComObjectConstruction2Events_GUID = "4b5a7827-8df2-45c0-8f6f-57ea1f856a9f"
  IID_IComObjectConstruction2Events = LibC::GUID.new(0x4b5a7827_u32, 0x8df2_u16, 0x45c0_u16, StaticArray[0x8f_u8, 0x6f_u8, 0x57_u8, 0xea_u8, 0x1f_u8, 0x85_u8, 0x6a_u8, 0x9f_u8])
  struct IComObjectConstruction2Events
    lpVtbl : IComObjectConstruction2EventsVTbl*
  end

  struct ISystemAppEventDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    startup : UInt64
    on_data_changed : UInt64
  end

  ISystemAppEventData_GUID = "d6d48a3c-d5c5-49e7-8c74-99e4889ed52f"
  IID_ISystemAppEventData = LibC::GUID.new(0xd6d48a3c_u32, 0xd5c5_u16, 0x49e7_u16, StaticArray[0x8c_u8, 0x74_u8, 0x99_u8, 0xe4_u8, 0x88_u8, 0x9e_u8, 0xd5_u8, 0x2f_u8])
  struct ISystemAppEventData
    lpVtbl : ISystemAppEventDataVTbl*
  end

  struct IMtsEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_package_name : UInt64
    get_package_guid : UInt64
    post_event : UInt64
    get_fire_events : UInt64
    get_process_id : UInt64
  end

  IMtsEvents_GUID = "bacedf4d-74ab-11d0-b162-00aa00ba3258"
  IID_IMtsEvents = LibC::GUID.new(0xbacedf4d_u32, 0x74ab_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x62_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct IMtsEvents
    lpVtbl : IMtsEventsVTbl*
  end

  struct IMtsEventInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_names : UInt64
    get_display_name : UInt64
    get_event_id : UInt64
    get_count : UInt64
    get_value : UInt64
  end

  IMtsEventInfo_GUID = "d56c3dc1-8482-11d0-b170-00aa00ba3258"
  IID_IMtsEventInfo = LibC::GUID.new(0xd56c3dc1_u32, 0x8482_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x70_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct IMtsEventInfo
    lpVtbl : IMtsEventInfoVTbl*
  end

  struct IMTSLocatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_event_dispatcher : UInt64
  end

  IMTSLocator_GUID = "d19b8bfd-7f88-11d0-b16e-00aa00ba3258"
  IID_IMTSLocator = LibC::GUID.new(0xd19b8bfd_u32, 0x7f88_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x6e_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct IMTSLocator
    lpVtbl : IMTSLocatorVTbl*
  end

  struct IMtsGrpVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_count : UInt64
    item : UInt64
    refresh : UInt64
  end

  IMtsGrp_GUID = "4b2e958c-0393-11d1-b1ab-00aa00ba3258"
  IID_IMtsGrp = LibC::GUID.new(0x4b2e958c_u32, 0x393_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xab_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct IMtsGrp
    lpVtbl : IMtsGrpVTbl*
  end

  struct IMessageMoverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_source_path : UInt64
    put_source_path : UInt64
    get_dest_path : UInt64
    put_dest_path : UInt64
    get_commit_batch_size : UInt64
    put_commit_batch_size : UInt64
    move_messages : UInt64
  end

  IMessageMover_GUID = "588a085a-b795-11d1-8054-00c04fc340ee"
  IID_IMessageMover = LibC::GUID.new(0x588a085a_u32, 0xb795_u16, 0x11d1_u16, StaticArray[0x80_u8, 0x54_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x40_u8, 0xee_u8])
  struct IMessageMover
    lpVtbl : IMessageMoverVTbl*
  end

  struct IEventServerTraceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    start_trace_guid : UInt64
    stop_trace_guid : UInt64
    enum_trace_guid : UInt64
  end

  IEventServerTrace_GUID = "9a9f12b8-80af-47ab-a579-35ea57725370"
  IID_IEventServerTrace = LibC::GUID.new(0x9a9f12b8_u32, 0x80af_u16, 0x47ab_u16, StaticArray[0xa5_u8, 0x79_u8, 0x35_u8, 0xea_u8, 0x57_u8, 0x72_u8, 0x53_u8, 0x70_u8])
  struct IEventServerTrace
    lpVtbl : IEventServerTraceVTbl*
  end

  struct IGetAppTrackerDataVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_application_processes : UInt64
    get_application_process_details : UInt64
    get_applications_in_process : UInt64
    get_components_in_process : UInt64
    get_component_details : UInt64
    get_tracker_data_as_collection_object : UInt64
    get_suggested_polling_interval : UInt64
  end

  IGetAppTrackerData_GUID = "507c3ac8-3e12-4cb0-9366-653d3e050638"
  IID_IGetAppTrackerData = LibC::GUID.new(0x507c3ac8_u32, 0x3e12_u16, 0x4cb0_u16, StaticArray[0x93_u8, 0x66_u8, 0x65_u8, 0x3d_u8, 0x3e_u8, 0x5_u8, 0x6_u8, 0x38_u8])
  struct IGetAppTrackerData
    lpVtbl : IGetAppTrackerDataVTbl*
  end

  struct IDispenserManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_dispenser : UInt64
    get_context : UInt64
  end

  IDispenserManager_GUID = "5cb31e10-2b5f-11cf-be10-00aa00a2fa25"
  IID_IDispenserManager = LibC::GUID.new(0x5cb31e10_u32, 0x2b5f_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IDispenserManager
    lpVtbl : IDispenserManagerVTbl*
  end

  struct IHolderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    alloc_resource : UInt64
    free_resource : UInt64
    track_resource : UInt64
    track_resource_s : UInt64
    untrack_resource : UInt64
    untrack_resource_s : UInt64
    close : UInt64
    request_destroy_resource : UInt64
  end

  IHolder_GUID = "bf6a1850-2b45-11cf-be10-00aa00a2fa25"
  IID_IHolder = LibC::GUID.new(0xbf6a1850_u32, 0x2b45_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IHolder
    lpVtbl : IHolderVTbl*
  end

  struct IDispenserDriverVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_resource : UInt64
    rate_resource : UInt64
    enlist_resource : UInt64
    reset_resource : UInt64
    destroy_resource : UInt64
    destroy_resource_s : UInt64
  end

  IDispenserDriver_GUID = "208b3651-2b48-11cf-be10-00aa00a2fa25"
  IID_IDispenserDriver = LibC::GUID.new(0x208b3651_u32, 0x2b48_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IDispenserDriver
    lpVtbl : IDispenserDriverVTbl*
  end

  struct ITransactionProxyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    commit : UInt64
    abort : UInt64
    promote : UInt64
    create_voter : UInt64
    get_isolation_level : UInt64
    get_identifier : UInt64
    is_reusable : UInt64
  end

  ITransactionProxy_GUID = "02558374-df2e-4dae-bd6b-1d5c994f9bdc"
  IID_ITransactionProxy = LibC::GUID.new(0x2558374_u32, 0xdf2e_u16, 0x4dae_u16, StaticArray[0xbd_u8, 0x6b_u8, 0x1d_u8, 0x5c_u8, 0x99_u8, 0x4f_u8, 0x9b_u8, 0xdc_u8])
  struct ITransactionProxy
    lpVtbl : ITransactionProxyVTbl*
  end

  struct IContextSecurityPerimeterVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_perimeter_flag : UInt64
    set_perimeter_flag : UInt64
  end

  IContextSecurityPerimeter_GUID = "a7549a29-a7c4-42e1-8dc1-7e3d748dc24a"
  IID_IContextSecurityPerimeter = LibC::GUID.new(0xa7549a29_u32, 0xa7c4_u16, 0x42e1_u16, StaticArray[0x8d_u8, 0xc1_u8, 0x7e_u8, 0x3d_u8, 0x74_u8, 0x8d_u8, 0xc2_u8, 0x4a_u8])
  struct IContextSecurityPerimeter
    lpVtbl : IContextSecurityPerimeterVTbl*
  end

  struct ITxProxyHolderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_identifier : UInt64
  end

  ITxProxyHolder_GUID = "13d86f31-0139-41af-bcad-c7d50435fe9f"
  IID_ITxProxyHolder = LibC::GUID.new(0x13d86f31_u32, 0x139_u16, 0x41af_u16, StaticArray[0xbc_u8, 0xad_u8, 0xc7_u8, 0xd5_u8, 0x4_u8, 0x35_u8, 0xfe_u8, 0x9f_u8])
  struct ITxProxyHolder
    lpVtbl : ITxProxyHolderVTbl*
  end

  struct IObjectContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_instance : UInt64
    set_complete : UInt64
    set_abort : UInt64
    enable_commit : UInt64
    disable_commit : UInt64
    is_in_transaction : UInt64
    is_security_enabled : UInt64
    is_caller_in_role : UInt64
  end

  IObjectContext_GUID = "51372ae0-cae7-11cf-be81-00aa00a2fa25"
  IID_IObjectContext = LibC::GUID.new(0x51372ae0_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IObjectContext
    lpVtbl : IObjectContextVTbl*
  end

  struct IObjectControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    can_be_pooled : UInt64
  end

  IObjectControl_GUID = "51372aec-cae7-11cf-be81-00aa00a2fa25"
  IID_IObjectControl = LibC::GUID.new(0x51372aec_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IObjectControl
    lpVtbl : IObjectControlVTbl*
  end

  struct IEnumNamesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    next : UInt64
    skip : UInt64
    reset : UInt64
    clone : UInt64
  end

  IEnumNames_GUID = "51372af2-cae7-11cf-be81-00aa00a2fa25"
  IID_IEnumNames = LibC::GUID.new(0x51372af2_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IEnumNames
    lpVtbl : IEnumNamesVTbl*
  end

  struct ISecurityPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_direct_creator_sid : UInt64
    get_original_creator_sid : UInt64
    get_direct_caller_sid : UInt64
    get_original_caller_sid : UInt64
    release_sid : UInt64
  end

  ISecurityProperty_GUID = "51372aea-cae7-11cf-be81-00aa00a2fa25"
  IID_ISecurityProperty = LibC::GUID.new(0x51372aea_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct ISecurityProperty
    lpVtbl : ISecurityPropertyVTbl*
  end

  struct ObjectControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    can_be_pooled : UInt64
  end

  ObjectControl_GUID = "7dc41850-0c31-11d0-8b79-00aa00b8a790"
  IID_ObjectControl = LibC::GUID.new(0x7dc41850_u32, 0xc31_u16, 0x11d0_u16, StaticArray[0x8b_u8, 0x79_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xa7_u8, 0x90_u8])
  struct ObjectControl
    lpVtbl : ObjectControlVTbl*
  end

  struct ISharedPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_value : UInt64
    put_value : UInt64
  end

  ISharedProperty_GUID = "2a005c01-a5de-11cf-9e66-00aa00a3f464"
  IID_ISharedProperty = LibC::GUID.new(0x2a005c01_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  struct ISharedProperty
    lpVtbl : ISharedPropertyVTbl*
  end

  struct ISharedPropertyGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_property_by_position : UInt64
    get_property_by_position : UInt64
    create_property : UInt64
    get_property : UInt64
  end

  ISharedPropertyGroup_GUID = "2a005c07-a5de-11cf-9e66-00aa00a3f464"
  IID_ISharedPropertyGroup = LibC::GUID.new(0x2a005c07_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  struct ISharedPropertyGroup
    lpVtbl : ISharedPropertyGroupVTbl*
  end

  struct ISharedPropertyGroupManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_property_group : UInt64
    get_group : UInt64
    get__new_enum : UInt64
  end

  ISharedPropertyGroupManager_GUID = "2a005c0d-a5de-11cf-9e66-00aa00a3f464"
  IID_ISharedPropertyGroupManager = LibC::GUID.new(0x2a005c0d_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  struct ISharedPropertyGroupManager
    lpVtbl : ISharedPropertyGroupManagerVTbl*
  end

  struct IObjectConstructVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    construct : UInt64
  end

  IObjectConstruct_GUID = "41c4f8b3-7439-11d2-98cb-00c04f8ee1c4"
  IID_IObjectConstruct = LibC::GUID.new(0x41c4f8b3_u32, 0x7439_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IObjectConstruct
    lpVtbl : IObjectConstructVTbl*
  end

  struct IObjectConstructStringVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_construct_string : UInt64
  end

  IObjectConstructString_GUID = "41c4f8b2-7439-11d2-98cb-00c04f8ee1c4"
  IID_IObjectConstructString = LibC::GUID.new(0x41c4f8b2_u32, 0x7439_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IObjectConstructString
    lpVtbl : IObjectConstructStringVTbl*
  end

  struct IObjectContextActivityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_activity_id : UInt64
  end

  IObjectContextActivity_GUID = "51372afc-cae7-11cf-be81-00aa00a2fa25"
  IID_IObjectContextActivity = LibC::GUID.new(0x51372afc_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IObjectContextActivity
    lpVtbl : IObjectContextActivityVTbl*
  end

  struct IObjectContextInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_in_transaction : UInt64
    get_transaction : UInt64
    get_transaction_id : UInt64
    get_activity_id : UInt64
    get_context_id : UInt64
  end

  IObjectContextInfo_GUID = "75b52ddb-e8ed-11d1-93ad-00aa00ba3258"
  IID_IObjectContextInfo = LibC::GUID.new(0x75b52ddb_u32, 0xe8ed_u16, 0x11d1_u16, StaticArray[0x93_u8, 0xad_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct IObjectContextInfo
    lpVtbl : IObjectContextInfoVTbl*
  end

  struct IObjectContextInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_in_transaction : UInt64
    get_transaction : UInt64
    get_transaction_id : UInt64
    get_activity_id : UInt64
    get_context_id : UInt64
    get_partition_id : UInt64
    get_application_id : UInt64
    get_application_instance_id : UInt64
  end

  IObjectContextInfo2_GUID = "594be71a-4bc4-438b-9197-cfd176248b09"
  IID_IObjectContextInfo2 = LibC::GUID.new(0x594be71a_u32, 0x4bc4_u16, 0x438b_u16, StaticArray[0x91_u8, 0x97_u8, 0xcf_u8, 0xd1_u8, 0x76_u8, 0x24_u8, 0x8b_u8, 0x9_u8])
  struct IObjectContextInfo2
    lpVtbl : IObjectContextInfo2VTbl*
  end

  struct ITransactionStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_transaction_status : UInt64
    get_transaction_status : UInt64
  end

  ITransactionStatus_GUID = "61f589e8-3724-4898-a0a4-664ae9e1d1b4"
  IID_ITransactionStatus = LibC::GUID.new(0x61f589e8_u32, 0x3724_u16, 0x4898_u16, StaticArray[0xa0_u8, 0xa4_u8, 0x66_u8, 0x4a_u8, 0xe9_u8, 0xe1_u8, 0xd1_u8, 0xb4_u8])
  struct ITransactionStatus
    lpVtbl : ITransactionStatusVTbl*
  end

  struct IObjectContextTipVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_tip_url : UInt64
  end

  IObjectContextTip_GUID = "92fd41ca-bad9-11d2-9a2d-00c04f797bc9"
  IID_IObjectContextTip = LibC::GUID.new(0x92fd41ca_u32, 0xbad9_u16, 0x11d2_u16, StaticArray[0x9a_u8, 0x2d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
  struct IObjectContextTip
    lpVtbl : IObjectContextTipVTbl*
  end

  struct IPlaybackControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    final_client_retry : UInt64
    final_server_retry : UInt64
  end

  IPlaybackControl_GUID = "51372afd-cae7-11cf-be81-00aa00a2fa25"
  IID_IPlaybackControl = LibC::GUID.new(0x51372afd_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IPlaybackControl
    lpVtbl : IPlaybackControlVTbl*
  end

  struct IGetContextPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    count : UInt64
    get_property : UInt64
    enum_names : UInt64
  end

  IGetContextProperties_GUID = "51372af4-cae7-11cf-be81-00aa00a2fa25"
  IID_IGetContextProperties = LibC::GUID.new(0x51372af4_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IGetContextProperties
    lpVtbl : IGetContextPropertiesVTbl*
  end

  struct IContextStateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_deactivate_on_return : UInt64
    get_deactivate_on_return : UInt64
    set_my_transaction_vote : UInt64
    get_my_transaction_vote : UInt64
  end

  IContextState_GUID = "3c05e54b-a42a-11d2-afc4-00c04f8ee1c4"
  IID_IContextState = LibC::GUID.new(0x3c05e54b_u32, 0xa42a_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IContextState
    lpVtbl : IContextStateVTbl*
  end

  struct IPoolManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    shutdown_pool : UInt64
  end

  IPoolManager_GUID = "0a469861-5a91-43a0-99b6-d5e179bb0631"
  IID_IPoolManager = LibC::GUID.new(0xa469861_u32, 0x5a91_u16, 0x43a0_u16, StaticArray[0x99_u8, 0xb6_u8, 0xd5_u8, 0xe1_u8, 0x79_u8, 0xbb_u8, 0x6_u8, 0x31_u8])
  struct IPoolManager
    lpVtbl : IPoolManagerVTbl*
  end

  struct ISelectCOMLBServerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init : UInt64
    get_lb_server : UInt64
  end

  ISelectCOMLBServer_GUID = "dcf443f4-3f8a-4872-b9f0-369a796d12d6"
  IID_ISelectCOMLBServer = LibC::GUID.new(0xdcf443f4_u32, 0x3f8a_u16, 0x4872_u16, StaticArray[0xb9_u8, 0xf0_u8, 0x36_u8, 0x9a_u8, 0x79_u8, 0x6d_u8, 0x12_u8, 0xd6_u8])
  struct ISelectCOMLBServer
    lpVtbl : ISelectCOMLBServerVTbl*
  end

  struct ICOMLBArgumentsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_clsid : UInt64
    set_clsid : UInt64
    get_machine_name : UInt64
    set_machine_name : UInt64
  end

  ICOMLBArguments_GUID = "3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2"
  IID_ICOMLBArguments = LibC::GUID.new(0x3a0f150f_u32, 0x8ee5_u16, 0x4b94_u16, StaticArray[0xb4_u8, 0xe_u8, 0xae_u8, 0xf2_u8, 0xf9_u8, 0xe4_u8, 0x2e_u8, 0xd2_u8])
  struct ICOMLBArguments
    lpVtbl : ICOMLBArgumentsVTbl*
  end

  struct ICrmLogControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_transaction_uow : UInt64
    register_compensator : UInt64
    write_log_record_variants : UInt64
    force_log : UInt64
    forget_log_record : UInt64
    force_transaction_to_abort : UInt64
    write_log_record : UInt64
  end

  ICrmLogControl_GUID = "a0e174b3-d26e-11d2-8f84-00805fc7bcd9"
  IID_ICrmLogControl = LibC::GUID.new(0xa0e174b3_u32, 0xd26e_u16, 0x11d2_u16, StaticArray[0x8f_u8, 0x84_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0xbc_u8, 0xd9_u8])
  struct ICrmLogControl
    lpVtbl : ICrmLogControlVTbl*
  end

  struct ICrmCompensatorVariantsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_log_control_variants : UInt64
    begin_prepare_variants : UInt64
    prepare_record_variants : UInt64
    end_prepare_variants : UInt64
    begin_commit_variants : UInt64
    commit_record_variants : UInt64
    end_commit_variants : UInt64
    begin_abort_variants : UInt64
    abort_record_variants : UInt64
    end_abort_variants : UInt64
  end

  ICrmCompensatorVariants_GUID = "f0baf8e4-7804-11d1-82e9-00a0c91eede9"
  IID_ICrmCompensatorVariants = LibC::GUID.new(0xf0baf8e4_u32, 0x7804_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xe9_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmCompensatorVariants
    lpVtbl : ICrmCompensatorVariantsVTbl*
  end

  struct ICrmCompensatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_log_control : UInt64
    begin_prepare : UInt64
    prepare_record : UInt64
    end_prepare : UInt64
    begin_commit : UInt64
    commit_record : UInt64
    end_commit : UInt64
    begin_abort : UInt64
    abort_record : UInt64
    end_abort : UInt64
  end

  ICrmCompensator_GUID = "bbc01830-8d3b-11d1-82ec-00a0c91eede9"
  IID_ICrmCompensator = LibC::GUID.new(0xbbc01830_u32, 0x8d3b_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xec_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmCompensator
    lpVtbl : ICrmCompensatorVTbl*
  end

  struct ICrmMonitorLogRecordsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_transaction_state : UInt64
    get_structured_records : UInt64
    get_log_record : UInt64
    get_log_record_variants : UInt64
  end

  ICrmMonitorLogRecords_GUID = "70c8e441-c7ed-11d1-82fb-00a0c91eede9"
  IID_ICrmMonitorLogRecords = LibC::GUID.new(0x70c8e441_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmMonitorLogRecords
    lpVtbl : ICrmMonitorLogRecordsVTbl*
  end

  struct ICrmMonitorClerksVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
    prog_id_compensator : UInt64
    description : UInt64
    transaction_uow : UInt64
    activity_id : UInt64
  end

  ICrmMonitorClerks_GUID = "70c8e442-c7ed-11d1-82fb-00a0c91eede9"
  IID_ICrmMonitorClerks = LibC::GUID.new(0x70c8e442_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmMonitorClerks
    lpVtbl : ICrmMonitorClerksVTbl*
  end

  struct ICrmMonitorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_clerks : UInt64
    hold_clerk : UInt64
  end

  ICrmMonitor_GUID = "70c8e443-c7ed-11d1-82fb-00a0c91eede9"
  IID_ICrmMonitor = LibC::GUID.new(0x70c8e443_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmMonitor
    lpVtbl : ICrmMonitorVTbl*
  end

  struct ICrmFormatLogRecordsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_column_count : UInt64
    get_column_headers : UInt64
    get_column : UInt64
    get_column_variants : UInt64
  end

  ICrmFormatLogRecords_GUID = "9c51d821-c98b-11d1-82fb-00a0c91eede9"
  IID_ICrmFormatLogRecords = LibC::GUID.new(0x9c51d821_u32, 0xc98b_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmFormatLogRecords
    lpVtbl : ICrmFormatLogRecordsVTbl*
  end

  struct IServiceIISIntrinsicsConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    iis_intrinsics_config : UInt64
  end

  IServiceIISIntrinsicsConfig_GUID = "1a0cf920-d452-46f4-bc36-48118d54ea52"
  IID_IServiceIISIntrinsicsConfig = LibC::GUID.new(0x1a0cf920_u32, 0xd452_u16, 0x46f4_u16, StaticArray[0xbc_u8, 0x36_u8, 0x48_u8, 0x11_u8, 0x8d_u8, 0x54_u8, 0xea_u8, 0x52_u8])
  struct IServiceIISIntrinsicsConfig
    lpVtbl : IServiceIISIntrinsicsConfigVTbl*
  end

  struct IServiceComTIIntrinsicsConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    com_ti_intrinsics_config : UInt64
  end

  IServiceComTIIntrinsicsConfig_GUID = "09e6831e-04e1-4ed4-9d0f-e8b168bafeaf"
  IID_IServiceComTIIntrinsicsConfig = LibC::GUID.new(0x9e6831e_u32, 0x4e1_u16, 0x4ed4_u16, StaticArray[0x9d_u8, 0xf_u8, 0xe8_u8, 0xb1_u8, 0x68_u8, 0xba_u8, 0xfe_u8, 0xaf_u8])
  struct IServiceComTIIntrinsicsConfig
    lpVtbl : IServiceComTIIntrinsicsConfigVTbl*
  end

  struct IServiceSxsConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    sxs_config : UInt64
    sxs_name : UInt64
    sxs_directory : UInt64
  end

  IServiceSxsConfig_GUID = "c7cd7379-f3f2-4634-811b-703281d73e08"
  IID_IServiceSxsConfig = LibC::GUID.new(0xc7cd7379_u32, 0xf3f2_u16, 0x4634_u16, StaticArray[0x81_u8, 0x1b_u8, 0x70_u8, 0x32_u8, 0x81_u8, 0xd7_u8, 0x3e_u8, 0x8_u8])
  struct IServiceSxsConfig
    lpVtbl : IServiceSxsConfigVTbl*
  end

  struct ICheckSxsConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_same_sxs_config : UInt64
  end

  ICheckSxsConfig_GUID = "0ff5a96f-11fc-47d1-baa6-25dd347e7242"
  IID_ICheckSxsConfig = LibC::GUID.new(0xff5a96f_u32, 0x11fc_u16, 0x47d1_u16, StaticArray[0xba_u8, 0xa6_u8, 0x25_u8, 0xdd_u8, 0x34_u8, 0x7e_u8, 0x72_u8, 0x42_u8])
  struct ICheckSxsConfig
    lpVtbl : ICheckSxsConfigVTbl*
  end

  struct IServiceInheritanceConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    containing_context_treatment : UInt64
  end

  IServiceInheritanceConfig_GUID = "92186771-d3b4-4d77-a8ea-ee842d586f35"
  IID_IServiceInheritanceConfig = LibC::GUID.new(0x92186771_u32, 0xd3b4_u16, 0x4d77_u16, StaticArray[0xa8_u8, 0xea_u8, 0xee_u8, 0x84_u8, 0x2d_u8, 0x58_u8, 0x6f_u8, 0x35_u8])
  struct IServiceInheritanceConfig
    lpVtbl : IServiceInheritanceConfigVTbl*
  end

  struct IServiceThreadPoolConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    select_thread_pool : UInt64
    set_binding_info : UInt64
  end

  IServiceThreadPoolConfig_GUID = "186d89bc-f277-4bcc-80d5-4df7b836ef4a"
  IID_IServiceThreadPoolConfig = LibC::GUID.new(0x186d89bc_u32, 0xf277_u16, 0x4bcc_u16, StaticArray[0x80_u8, 0xd5_u8, 0x4d_u8, 0xf7_u8, 0xb8_u8, 0x36_u8, 0xef_u8, 0x4a_u8])
  struct IServiceThreadPoolConfig
    lpVtbl : IServiceThreadPoolConfigVTbl*
  end

  struct IServiceTransactionConfigBaseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    configure_transaction : UInt64
    isolation_level : UInt64
    transaction_timeout : UInt64
    bring_your_own_transaction : UInt64
    new_transaction_description : UInt64
  end

  IServiceTransactionConfigBase_GUID = "772b3fbe-6ffd-42fb-b5f8-8f9b260f3810"
  IID_IServiceTransactionConfigBase = LibC::GUID.new(0x772b3fbe_u32, 0x6ffd_u16, 0x42fb_u16, StaticArray[0xb5_u8, 0xf8_u8, 0x8f_u8, 0x9b_u8, 0x26_u8, 0xf_u8, 0x38_u8, 0x10_u8])
  struct IServiceTransactionConfigBase
    lpVtbl : IServiceTransactionConfigBaseVTbl*
  end

  struct IServiceTransactionConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    configure_transaction : UInt64
    isolation_level : UInt64
    transaction_timeout : UInt64
    bring_your_own_transaction : UInt64
    new_transaction_description : UInt64
    configure_byot : UInt64
  end

  IServiceTransactionConfig_GUID = "59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9"
  IID_IServiceTransactionConfig = LibC::GUID.new(0x59f4c2a3_u32, 0xd3d7_u16, 0x4a31_u16, StaticArray[0xb6_u8, 0xe4_u8, 0x6a_u8, 0xb3_u8, 0x17_u8, 0x7c_u8, 0x50_u8, 0xb9_u8])
  struct IServiceTransactionConfig
    lpVtbl : IServiceTransactionConfigVTbl*
  end

  struct IServiceSysTxnConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    configure_transaction : UInt64
    isolation_level : UInt64
    transaction_timeout : UInt64
    bring_your_own_transaction : UInt64
    new_transaction_description : UInt64
    configure_byot : UInt64
    configure_byot_sys_txn : UInt64
  end

  IServiceSysTxnConfig_GUID = "33caf1a1-fcb8-472b-b45e-967448ded6d8"
  IID_IServiceSysTxnConfig = LibC::GUID.new(0x33caf1a1_u32, 0xfcb8_u16, 0x472b_u16, StaticArray[0xb4_u8, 0x5e_u8, 0x96_u8, 0x74_u8, 0x48_u8, 0xde_u8, 0xd6_u8, 0xd8_u8])
  struct IServiceSysTxnConfig
    lpVtbl : IServiceSysTxnConfigVTbl*
  end

  struct IServiceSynchronizationConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    configure_synchronization : UInt64
  end

  IServiceSynchronizationConfig_GUID = "fd880e81-6dce-4c58-af83-a208846c0030"
  IID_IServiceSynchronizationConfig = LibC::GUID.new(0xfd880e81_u32, 0x6dce_u16, 0x4c58_u16, StaticArray[0xaf_u8, 0x83_u8, 0xa2_u8, 0x8_u8, 0x84_u8, 0x6c_u8, 0x0_u8, 0x30_u8])
  struct IServiceSynchronizationConfig
    lpVtbl : IServiceSynchronizationConfigVTbl*
  end

  struct IServiceTrackerConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    tracker_config : UInt64
  end

  IServiceTrackerConfig_GUID = "6c3a3e1d-0ba6-4036-b76f-d0404db816c9"
  IID_IServiceTrackerConfig = LibC::GUID.new(0x6c3a3e1d_u32, 0xba6_u16, 0x4036_u16, StaticArray[0xb7_u8, 0x6f_u8, 0xd0_u8, 0x40_u8, 0x4d_u8, 0xb8_u8, 0x16_u8, 0xc9_u8])
  struct IServiceTrackerConfig
    lpVtbl : IServiceTrackerConfigVTbl*
  end

  struct IServicePartitionConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    partition_config : UInt64
    partition_id : UInt64
  end

  IServicePartitionConfig_GUID = "80182d03-5ea4-4831-ae97-55beffc2e590"
  IID_IServicePartitionConfig = LibC::GUID.new(0x80182d03_u32, 0x5ea4_u16, 0x4831_u16, StaticArray[0xae_u8, 0x97_u8, 0x55_u8, 0xbe_u8, 0xff_u8, 0xc2_u8, 0xe5_u8, 0x90_u8])
  struct IServicePartitionConfig
    lpVtbl : IServicePartitionConfigVTbl*
  end

  struct IServiceCallVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_call : UInt64
  end

  IServiceCall_GUID = "bd3e2e12-42dd-40f4-a09a-95a50c58304b"
  IID_IServiceCall = LibC::GUID.new(0xbd3e2e12_u32, 0x42dd_u16, 0x40f4_u16, StaticArray[0xa0_u8, 0x9a_u8, 0x95_u8, 0xa5_u8, 0xc_u8, 0x58_u8, 0x30_u8, 0x4b_u8])
  struct IServiceCall
    lpVtbl : IServiceCallVTbl*
  end

  struct IAsyncErrorNotifyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_error : UInt64
  end

  IAsyncErrorNotify_GUID = "fe6777fb-a674-4177-8f32-6d707e113484"
  IID_IAsyncErrorNotify = LibC::GUID.new(0xfe6777fb_u32, 0xa674_u16, 0x4177_u16, StaticArray[0x8f_u8, 0x32_u8, 0x6d_u8, 0x70_u8, 0x7e_u8, 0x11_u8, 0x34_u8, 0x84_u8])
  struct IAsyncErrorNotify
    lpVtbl : IAsyncErrorNotifyVTbl*
  end

  struct IServiceActivityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    synchronous_call : UInt64
    asynchronous_call : UInt64
    bind_to_current_thread : UInt64
    unbind_from_thread : UInt64
  end

  IServiceActivity_GUID = "67532e0c-9e2f-4450-a354-035633944e17"
  IID_IServiceActivity = LibC::GUID.new(0x67532e0c_u32, 0x9e2f_u16, 0x4450_u16, StaticArray[0xa3_u8, 0x54_u8, 0x3_u8, 0x56_u8, 0x33_u8, 0x94_u8, 0x4e_u8, 0x17_u8])
  struct IServiceActivity
    lpVtbl : IServiceActivityVTbl*
  end

  struct IThreadPoolKnobsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_max_threads : UInt64
    get_current_threads : UInt64
    set_max_threads : UInt64
    get_delete_delay : UInt64
    set_delete_delay : UInt64
    get_max_queued_requests : UInt64
    get_current_queued_requests : UInt64
    set_max_queued_requests : UInt64
    set_min_threads : UInt64
    set_queue_depth : UInt64
  end

  IThreadPoolKnobs_GUID = "51372af7-cae7-11cf-be81-00aa00a2fa25"
  IID_IThreadPoolKnobs = LibC::GUID.new(0x51372af7_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IThreadPoolKnobs
    lpVtbl : IThreadPoolKnobsVTbl*
  end

  struct IComStaThreadPoolKnobsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_min_thread_count : UInt64
    get_min_thread_count : UInt64
    set_max_thread_count : UInt64
    get_max_thread_count : UInt64
    set_activity_per_thread : UInt64
    get_activity_per_thread : UInt64
    set_activity_ratio : UInt64
    get_activity_ratio : UInt64
    get_thread_count : UInt64
    get_queue_depth : UInt64
    set_queue_depth : UInt64
  end

  IComStaThreadPoolKnobs_GUID = "324b64fa-33b6-11d2-98b7-00c04f8ee1c4"
  IID_IComStaThreadPoolKnobs = LibC::GUID.new(0x324b64fa_u32, 0x33b6_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xb7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComStaThreadPoolKnobs
    lpVtbl : IComStaThreadPoolKnobsVTbl*
  end

  struct IComMtaThreadPoolKnobsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    mta_set_max_thread_count : UInt64
    mta_get_max_thread_count : UInt64
    mta_set_throttle_value : UInt64
    mta_get_throttle_value : UInt64
  end

  IComMtaThreadPoolKnobs_GUID = "f9a76d2e-76a5-43eb-a0c4-49bec8e48480"
  IID_IComMtaThreadPoolKnobs = LibC::GUID.new(0xf9a76d2e_u32, 0x76a5_u16, 0x43eb_u16, StaticArray[0xa0_u8, 0xc4_u8, 0x49_u8, 0xbe_u8, 0xc8_u8, 0xe4_u8, 0x84_u8, 0x80_u8])
  struct IComMtaThreadPoolKnobs
    lpVtbl : IComMtaThreadPoolKnobsVTbl*
  end

  struct IComStaThreadPoolKnobs2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_min_thread_count : UInt64
    get_min_thread_count : UInt64
    set_max_thread_count : UInt64
    get_max_thread_count : UInt64
    set_activity_per_thread : UInt64
    get_activity_per_thread : UInt64
    set_activity_ratio : UInt64
    get_activity_ratio : UInt64
    get_thread_count : UInt64
    get_queue_depth : UInt64
    set_queue_depth : UInt64
    get_max_cpu_load : UInt64
    set_max_cpu_load : UInt64
    get_cpu_metric_enabled : UInt64
    set_cpu_metric_enabled : UInt64
    get_create_threads_aggressively : UInt64
    set_create_threads_aggressively : UInt64
    get_max_csr : UInt64
    set_max_csr : UInt64
    get_wait_time_for_thread_cleanup : UInt64
    set_wait_time_for_thread_cleanup : UInt64
  end

  IComStaThreadPoolKnobs2_GUID = "73707523-ff9a-4974-bf84-2108dc213740"
  IID_IComStaThreadPoolKnobs2 = LibC::GUID.new(0x73707523_u32, 0xff9a_u16, 0x4974_u16, StaticArray[0xbf_u8, 0x84_u8, 0x21_u8, 0x8_u8, 0xdc_u8, 0x21_u8, 0x37_u8, 0x40_u8])
  struct IComStaThreadPoolKnobs2
    lpVtbl : IComStaThreadPoolKnobs2VTbl*
  end

  struct IProcessInitializerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    startup : UInt64
    shutdown : UInt64
  end

  IProcessInitializer_GUID = "1113f52d-dc7f-4943-aed6-88d04027e32a"
  IID_IProcessInitializer = LibC::GUID.new(0x1113f52d_u32, 0xdc7f_u16, 0x4943_u16, StaticArray[0xae_u8, 0xd6_u8, 0x88_u8, 0xd0_u8, 0x40_u8, 0x27_u8, 0xe3_u8, 0x2a_u8])
  struct IProcessInitializer
    lpVtbl : IProcessInitializerVTbl*
  end

  struct IServicePoolConfigVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    put_max_pool_size : UInt64
    get_max_pool_size : UInt64
    put_min_pool_size : UInt64
    get_min_pool_size : UInt64
    put_creation_timeout : UInt64
    get_creation_timeout : UInt64
    put_transaction_affinity : UInt64
    get_transaction_affinity : UInt64
    put_class_factory : UInt64
    get_class_factory : UInt64
  end

  IServicePoolConfig_GUID = "a9690656-5bca-470c-8451-250c1f43a33e"
  IID_IServicePoolConfig = LibC::GUID.new(0xa9690656_u32, 0x5bca_u16, 0x470c_u16, StaticArray[0x84_u8, 0x51_u8, 0x25_u8, 0xc_u8, 0x1f_u8, 0x43_u8, 0xa3_u8, 0x3e_u8])
  struct IServicePoolConfig
    lpVtbl : IServicePoolConfigVTbl*
  end

  struct IServicePoolVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_object : UInt64
    shutdown : UInt64
  end

  IServicePool_GUID = "b302df81-ea45-451e-99a2-09f9fd1b1e13"
  IID_IServicePool = LibC::GUID.new(0xb302df81_u32, 0xea45_u16, 0x451e_u16, StaticArray[0x99_u8, 0xa2_u8, 0x9_u8, 0xf9_u8, 0xfd_u8, 0x1b_u8, 0x1e_u8, 0x13_u8])
  struct IServicePool
    lpVtbl : IServicePoolVTbl*
  end

  struct IManagedPooledObjVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_held : UInt64
  end

  IManagedPooledObj_GUID = "c5da4bea-1b42-4437-8926-b6a38860a770"
  IID_IManagedPooledObj = LibC::GUID.new(0xc5da4bea_u32, 0x1b42_u16, 0x4437_u16, StaticArray[0x89_u8, 0x26_u8, 0xb6_u8, 0xa3_u8, 0x88_u8, 0x60_u8, 0xa7_u8, 0x70_u8])
  struct IManagedPooledObj
    lpVtbl : IManagedPooledObjVTbl*
  end

  struct IManagedPoolActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    last_release : UInt64
  end

  IManagedPoolAction_GUID = "da91b74e-5388-4783-949d-c1cd5fb00506"
  IID_IManagedPoolAction = LibC::GUID.new(0xda91b74e_u32, 0x5388_u16, 0x4783_u16, StaticArray[0x94_u8, 0x9d_u8, 0xc1_u8, 0xcd_u8, 0x5f_u8, 0xb0_u8, 0x5_u8, 0x6_u8])
  struct IManagedPoolAction
    lpVtbl : IManagedPoolActionVTbl*
  end

  struct IManagedObjectInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_i_unknown : UInt64
    get_i_object_control : UInt64
    set_in_pool : UInt64
    set_wrapper_strength : UInt64
  end

  IManagedObjectInfo_GUID = "1427c51a-4584-49d8-90a0-c50d8086cbe9"
  IID_IManagedObjectInfo = LibC::GUID.new(0x1427c51a_u32, 0x4584_u16, 0x49d8_u16, StaticArray[0x90_u8, 0xa0_u8, 0xc5_u8, 0xd_u8, 0x80_u8, 0x86_u8, 0xcb_u8, 0xe9_u8])
  struct IManagedObjectInfo
    lpVtbl : IManagedObjectInfoVTbl*
  end

  struct IAppDomainHelperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    initialize : UInt64
    do_callback : UInt64
  end

  IAppDomainHelper_GUID = "c7b67079-8255-42c6-9ec0-6994a3548780"
  IID_IAppDomainHelper = LibC::GUID.new(0xc7b67079_u32, 0x8255_u16, 0x42c6_u16, StaticArray[0x9e_u8, 0xc0_u8, 0x69_u8, 0x94_u8, 0xa3_u8, 0x54_u8, 0x87_u8, 0x80_u8])
  struct IAppDomainHelper
    lpVtbl : IAppDomainHelperVTbl*
  end

  struct IAssemblyLocatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_modules : UInt64
  end

  IAssemblyLocator_GUID = "391ffbb9-a8ee-432a-abc8-baa238dab90f"
  IID_IAssemblyLocator = LibC::GUID.new(0x391ffbb9_u32, 0xa8ee_u16, 0x432a_u16, StaticArray[0xab_u8, 0xc8_u8, 0xba_u8, 0xa2_u8, 0x38_u8, 0xda_u8, 0xb9_u8, 0xf_u8])
  struct IAssemblyLocator
    lpVtbl : IAssemblyLocatorVTbl*
  end

  struct IManagedActivationEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_managed_stub : UInt64
    destroy_managed_stub : UInt64
  end

  IManagedActivationEvents_GUID = "a5f325af-572f-46da-b8ab-827c3d95d99e"
  IID_IManagedActivationEvents = LibC::GUID.new(0xa5f325af_u32, 0x572f_u16, 0x46da_u16, StaticArray[0xb8_u8, 0xab_u8, 0x82_u8, 0x7c_u8, 0x3d_u8, 0x95_u8, 0xd9_u8, 0x9e_u8])
  struct IManagedActivationEvents
    lpVtbl : IManagedActivationEventsVTbl*
  end

  struct ISendMethodEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    send_method_call : UInt64
    send_method_return : UInt64
  end

  ISendMethodEvents_GUID = "2732fd59-b2b4-4d44-878c-8b8f09626008"
  IID_ISendMethodEvents = LibC::GUID.new(0x2732fd59_u32, 0xb2b4_u16, 0x4d44_u16, StaticArray[0x87_u8, 0x8c_u8, 0x8b_u8, 0x8f_u8, 0x9_u8, 0x62_u8, 0x60_u8, 0x8_u8])
  struct ISendMethodEvents
    lpVtbl : ISendMethodEventsVTbl*
  end

  struct ITransactionResourcePoolVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    put_resource : UInt64
    get_resource : UInt64
  end

  ITransactionResourcePool_GUID = "c5feb7c1-346a-11d1-b1cc-00aa00ba3258"
  IID_ITransactionResourcePool = LibC::GUID.new(0xc5feb7c1_u32, 0x346a_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xcc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct ITransactionResourcePool
    lpVtbl : ITransactionResourcePoolVTbl*
  end

  struct IMTSCallVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_call : UInt64
  end

  IMTSCall_GUID = "51372aef-cae7-11cf-be81-00aa00a2fa25"
  IID_IMTSCall = LibC::GUID.new(0x51372aef_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
  struct IMTSCall
    lpVtbl : IMTSCallVTbl*
  end

  struct IContextPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    count : UInt64
    get_property : UInt64
    enum_names : UInt64
    set_property : UInt64
    remove_property : UInt64
  end

  IContextProperties_GUID = "d396da85-bf8f-11d1-bbae-00c04fc2fa5f"
  IID_IContextProperties = LibC::GUID.new(0xd396da85_u32, 0xbf8f_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xae_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xfa_u8, 0x5f_u8])
  struct IContextProperties
    lpVtbl : IContextPropertiesVTbl*
  end

  struct IObjPoolVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reserved1 : UInt64
    reserved2 : UInt64
    reserved3 : UInt64
    reserved4 : UInt64
    put_end_tx : UInt64
    reserved5 : UInt64
    reserved6 : UInt64
  end

  IObjPool_GUID = "7d8805a0-2ea7-11d1-b1cc-00aa00ba3258"
  IID_IObjPool = LibC::GUID.new(0x7d8805a0_u32, 0x2ea7_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xcc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct IObjPool
    lpVtbl : IObjPoolVTbl*
  end

  struct ITransactionPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reserved1 : UInt64
    reserved2 : UInt64
    reserved3 : UInt64
    reserved4 : UInt64
    reserved5 : UInt64
    reserved6 : UInt64
    reserved7 : UInt64
    reserved8 : UInt64
    reserved9 : UInt64
    get_transaction_resource_pool : UInt64
    reserved10 : UInt64
    reserved11 : UInt64
    reserved12 : UInt64
    reserved13 : UInt64
    reserved14 : UInt64
    reserved15 : UInt64
    reserved16 : UInt64
    reserved17 : UInt64
  end

  ITransactionProperty_GUID = "788ea814-87b1-11d1-bba6-00c04fc2fa5f"
  IID_ITransactionProperty = LibC::GUID.new(0x788ea814_u32, 0x87b1_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xa6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xfa_u8, 0x5f_u8])
  struct ITransactionProperty
    lpVtbl : ITransactionPropertyVTbl*
  end

  struct IMTSActivityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    synchronous_call : UInt64
    async_call : UInt64
    reserved1 : UInt64
    bind_to_current_thread : UInt64
    unbind_from_thread : UInt64
  end

  IMTSActivity_GUID = "51372af0-cae7-11cf-be81-00aa00a2fa25"
  IID_IMTSActivity = LibC::GUID.new(0x51372af0_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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
  fun CoLeaveServiceDomain(punkstatus : IUnknown) : Void

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
struct LibWin32::ICOMAdminCatalog
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_collection(bstrcollname : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrcollname, ppcatalogcollection)
  end
  def connect(bstrcatalogservername : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrcatalogservername, ppcatalogcollection)
  end
  def get_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_minor_version(plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversion)
  end
  def get_collection_by_query(bstrcollname : UInt8*, ppsavarquery : SAFEARRAY**, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection_by_query.unsafe_as(Proc(UInt8*, SAFEARRAY**, IDispatch*, HRESULT)).call(bstrcollname, ppsavarquery, ppcatalogcollection)
  end
  def import_component(bstrapplidorname : UInt8*, bstrclsidorprogid : UInt8*) : HRESULT
    @lpVtbl.value.import_component.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrapplidorname, bstrclsidorprogid)
  end
  def install_component(bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_component.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def shutdown_application(bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_application.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrapplidorname)
  end
  def export_application(bstrapplidorname : UInt8*, bstrapplicationfile : UInt8*, loptions : COMAdminApplicationExportOptions) : HRESULT
    @lpVtbl.value.export_application.unsafe_as(Proc(UInt8*, UInt8*, COMAdminApplicationExportOptions, HRESULT)).call(bstrapplidorname, bstrapplicationfile, loptions)
  end
  def install_application(bstrapplicationfile : UInt8*, bstrdestinationdirectory : UInt8*, loptions : COMAdminApplicationInstallOptions, bstruserid : UInt8*, bstrpassword : UInt8*, bstrrsn : UInt8*) : HRESULT
    @lpVtbl.value.install_application.unsafe_as(Proc(UInt8*, UInt8*, COMAdminApplicationInstallOptions, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrapplicationfile, bstrdestinationdirectory, loptions, bstruserid, bstrpassword, bstrrsn)
  end
  def stop_router : HRESULT
    @lpVtbl.value.stop_router.unsafe_as(Proc(HRESULT)).call
  end
  def refresh_router : HRESULT
    @lpVtbl.value.refresh_router.unsafe_as(Proc(HRESULT)).call
  end
  def start_router : HRESULT
    @lpVtbl.value.start_router.unsafe_as(Proc(HRESULT)).call
  end
  def reserved1 : HRESULT
    @lpVtbl.value.reserved1.unsafe_as(Proc(HRESULT)).call
  end
  def reserved2 : HRESULT
    @lpVtbl.value.reserved2.unsafe_as(Proc(HRESULT)).call
  end
  def install_multiple_components(bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_components.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def get_multiple_components_info(bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**, ppsavarclassnames : SAFEARRAY**, ppsavarfileflags : SAFEARRAY**, ppsavarcomponentflags : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_multiple_components_info.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstrapplidorname, ppsavarfilenames, ppsavarclsids, ppsavarclassnames, ppsavarfileflags, ppsavarcomponentflags)
  end
  def refresh_components : HRESULT
    @lpVtbl.value.refresh_components.unsafe_as(Proc(HRESULT)).call
  end
  def backup_regdb(bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.backup_regdb.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbackupfilepath)
  end
  def restore_regdb(bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.restore_regdb.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbackupfilepath)
  end
  def query_application_file(bstrapplicationfile : UInt8*, pbstrapplicationname : UInt8**, pbstrapplicationdescription : UInt8**, pbhasusers : Int16*, pbisproxy : Int16*, ppsavarfilenames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.query_application_file.unsafe_as(Proc(UInt8*, UInt8**, UInt8**, Int16*, Int16*, SAFEARRAY**, HRESULT)).call(bstrapplicationfile, pbstrapplicationname, pbstrapplicationdescription, pbhasusers, pbisproxy, ppsavarfilenames)
  end
  def start_application(bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.start_application.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrapplidorname)
  end
  def service_check(lservice : Int32, plstatus : Int32*) : HRESULT
    @lpVtbl.value.service_check.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(lservice, plstatus)
  end
  def install_multiple_event_classes(bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_event_classes.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def install_event_class(bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_event_class.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def get_event_classes_for_iid(bstriid : UInt8*, ppsavarclsids : SAFEARRAY**, ppsavarprogids : SAFEARRAY**, ppsavardescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_event_classes_for_iid.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstriid, ppsavarclsids, ppsavarprogids, ppsavardescriptions)
  end
end
struct LibWin32::ICOMAdminCatalog2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_collection(bstrcollname : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrcollname, ppcatalogcollection)
  end
  def connect(bstrcatalogservername : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrcatalogservername, ppcatalogcollection)
  end
  def get_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_minor_version(plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversion)
  end
  def get_collection_by_query(bstrcollname : UInt8*, ppsavarquery : SAFEARRAY**, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection_by_query.unsafe_as(Proc(UInt8*, SAFEARRAY**, IDispatch*, HRESULT)).call(bstrcollname, ppsavarquery, ppcatalogcollection)
  end
  def import_component(bstrapplidorname : UInt8*, bstrclsidorprogid : UInt8*) : HRESULT
    @lpVtbl.value.import_component.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrapplidorname, bstrclsidorprogid)
  end
  def install_component(bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_component.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def shutdown_application(bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_application.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrapplidorname)
  end
  def export_application(bstrapplidorname : UInt8*, bstrapplicationfile : UInt8*, loptions : COMAdminApplicationExportOptions) : HRESULT
    @lpVtbl.value.export_application.unsafe_as(Proc(UInt8*, UInt8*, COMAdminApplicationExportOptions, HRESULT)).call(bstrapplidorname, bstrapplicationfile, loptions)
  end
  def install_application(bstrapplicationfile : UInt8*, bstrdestinationdirectory : UInt8*, loptions : COMAdminApplicationInstallOptions, bstruserid : UInt8*, bstrpassword : UInt8*, bstrrsn : UInt8*) : HRESULT
    @lpVtbl.value.install_application.unsafe_as(Proc(UInt8*, UInt8*, COMAdminApplicationInstallOptions, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrapplicationfile, bstrdestinationdirectory, loptions, bstruserid, bstrpassword, bstrrsn)
  end
  def stop_router : HRESULT
    @lpVtbl.value.stop_router.unsafe_as(Proc(HRESULT)).call
  end
  def refresh_router : HRESULT
    @lpVtbl.value.refresh_router.unsafe_as(Proc(HRESULT)).call
  end
  def start_router : HRESULT
    @lpVtbl.value.start_router.unsafe_as(Proc(HRESULT)).call
  end
  def reserved1 : HRESULT
    @lpVtbl.value.reserved1.unsafe_as(Proc(HRESULT)).call
  end
  def reserved2 : HRESULT
    @lpVtbl.value.reserved2.unsafe_as(Proc(HRESULT)).call
  end
  def install_multiple_components(bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_components.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def get_multiple_components_info(bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**, ppsavarclassnames : SAFEARRAY**, ppsavarfileflags : SAFEARRAY**, ppsavarcomponentflags : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_multiple_components_info.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstrapplidorname, ppsavarfilenames, ppsavarclsids, ppsavarclassnames, ppsavarfileflags, ppsavarcomponentflags)
  end
  def refresh_components : HRESULT
    @lpVtbl.value.refresh_components.unsafe_as(Proc(HRESULT)).call
  end
  def backup_regdb(bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.backup_regdb.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbackupfilepath)
  end
  def restore_regdb(bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.restore_regdb.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrbackupfilepath)
  end
  def query_application_file(bstrapplicationfile : UInt8*, pbstrapplicationname : UInt8**, pbstrapplicationdescription : UInt8**, pbhasusers : Int16*, pbisproxy : Int16*, ppsavarfilenames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.query_application_file.unsafe_as(Proc(UInt8*, UInt8**, UInt8**, Int16*, Int16*, SAFEARRAY**, HRESULT)).call(bstrapplicationfile, pbstrapplicationname, pbstrapplicationdescription, pbhasusers, pbisproxy, ppsavarfilenames)
  end
  def start_application(bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.start_application.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrapplidorname)
  end
  def service_check(lservice : Int32, plstatus : Int32*) : HRESULT
    @lpVtbl.value.service_check.unsafe_as(Proc(Int32, Int32*, HRESULT)).call(lservice, plstatus)
  end
  def install_multiple_event_classes(bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_event_classes.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def install_event_class(bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_event_class.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def get_event_classes_for_iid(bstriid : UInt8*, ppsavarclsids : SAFEARRAY**, ppsavarprogids : SAFEARRAY**, ppsavardescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_event_classes_for_iid.unsafe_as(Proc(UInt8*, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(bstriid, ppsavarclsids, ppsavarprogids, ppsavardescriptions)
  end
  def get_collection_by_query2(bstrcollectionname : UInt8*, pvarquerystrings : VARIANT*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection_by_query2.unsafe_as(Proc(UInt8*, VARIANT*, IDispatch*, HRESULT)).call(bstrcollectionname, pvarquerystrings, ppcatalogcollection)
  end
  def get_application_instance_id_from_process_id(lprocessid : Int32, pbstrapplicationinstanceid : UInt8**) : HRESULT
    @lpVtbl.value.get_application_instance_id_from_process_id.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(lprocessid, pbstrapplicationinstanceid)
  end
  def shutdown_application_instances(pvarapplicationinstanceid : VARIANT*) : HRESULT
    @lpVtbl.value.shutdown_application_instances.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarapplicationinstanceid)
  end
  def pause_application_instances(pvarapplicationinstanceid : VARIANT*) : HRESULT
    @lpVtbl.value.pause_application_instances.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarapplicationinstanceid)
  end
  def resume_application_instances(pvarapplicationinstanceid : VARIANT*) : HRESULT
    @lpVtbl.value.resume_application_instances.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarapplicationinstanceid)
  end
  def recycle_application_instances(pvarapplicationinstanceid : VARIANT*, lreasoncode : Int32) : HRESULT
    @lpVtbl.value.recycle_application_instances.unsafe_as(Proc(VARIANT*, Int32, HRESULT)).call(pvarapplicationinstanceid, lreasoncode)
  end
  def are_application_instances_paused(pvarapplicationinstanceid : VARIANT*, pvarboolpaused : Int16*) : HRESULT
    @lpVtbl.value.are_application_instances_paused.unsafe_as(Proc(VARIANT*, Int16*, HRESULT)).call(pvarapplicationinstanceid, pvarboolpaused)
  end
  def dump_application_instance(bstrapplicationinstanceid : UInt8*, bstrdirectory : UInt8*, lmaximages : Int32, pbstrdumpfile : UInt8**) : HRESULT
    @lpVtbl.value.dump_application_instance.unsafe_as(Proc(UInt8*, UInt8*, Int32, UInt8**, HRESULT)).call(bstrapplicationinstanceid, bstrdirectory, lmaximages, pbstrdumpfile)
  end
  def get_is_application_instance_dump_supported(pvarbooldumpsupported : Int16*) : HRESULT
    @lpVtbl.value.get_is_application_instance_dump_supported.unsafe_as(Proc(Int16*, HRESULT)).call(pvarbooldumpsupported)
  end
  def create_service_for_application(bstrapplicationidorname : UInt8*, bstrservicename : UInt8*, bstrstarttype : UInt8*, bstrerrorcontrol : UInt8*, bstrdependencies : UInt8*, bstrrunas : UInt8*, bstrpassword : UInt8*, bdesktopok : Int16) : HRESULT
    @lpVtbl.value.create_service_for_application.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, Int16, HRESULT)).call(bstrapplicationidorname, bstrservicename, bstrstarttype, bstrerrorcontrol, bstrdependencies, bstrrunas, bstrpassword, bdesktopok)
  end
  def delete_service_for_application(bstrapplicationidorname : UInt8*) : HRESULT
    @lpVtbl.value.delete_service_for_application.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrapplicationidorname)
  end
  def get_partition_id(bstrapplicationidorname : UInt8*, pbstrpartitionid : UInt8**) : HRESULT
    @lpVtbl.value.get_partition_id.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrapplicationidorname, pbstrpartitionid)
  end
  def get_partition_name(bstrapplicationidorname : UInt8*, pbstrpartitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_partition_name.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(bstrapplicationidorname, pbstrpartitionname)
  end
  def put_current_partition(bstrpartitionidorname : UInt8*) : HRESULT
    @lpVtbl.value.put_current_partition.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpartitionidorname)
  end
  def get_current_partition_id(pbstrpartitionid : UInt8**) : HRESULT
    @lpVtbl.value.get_current_partition_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpartitionid)
  end
  def get_current_partition_name(pbstrpartitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_current_partition_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrpartitionname)
  end
  def get_global_partition_id(pbstrglobalpartitionid : UInt8**) : HRESULT
    @lpVtbl.value.get_global_partition_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrglobalpartitionid)
  end
  def flush_partition_cache : HRESULT
    @lpVtbl.value.flush_partition_cache.unsafe_as(Proc(HRESULT)).call
  end
  def copy_applications(bstrsourcepartitionidorname : UInt8*, pvarapplicationid : VARIANT*, bstrdestinationpartitionidorname : UInt8*) : HRESULT
    @lpVtbl.value.copy_applications.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(bstrsourcepartitionidorname, pvarapplicationid, bstrdestinationpartitionidorname)
  end
  def copy_components(bstrsourceapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, bstrdestinationapplicationidorname : UInt8*) : HRESULT
    @lpVtbl.value.copy_components.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(bstrsourceapplicationidorname, pvarclsidorprogid, bstrdestinationapplicationidorname)
  end
  def move_components(bstrsourceapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, bstrdestinationapplicationidorname : UInt8*) : HRESULT
    @lpVtbl.value.move_components.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(bstrsourceapplicationidorname, pvarclsidorprogid, bstrdestinationapplicationidorname)
  end
  def alias_component(bstrsrcapplicationidorname : UInt8*, bstrclsidorprogid : UInt8*, bstrdestapplicationidorname : UInt8*, bstrnewprogid : UInt8*, bstrnewclsid : UInt8*) : HRESULT
    @lpVtbl.value.alias_component.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrsrcapplicationidorname, bstrclsidorprogid, bstrdestapplicationidorname, bstrnewprogid, bstrnewclsid)
  end
  def is_safe_to_delete(bstrdllname : UInt8*, pcomadmininuse : COMAdminInUse*) : HRESULT
    @lpVtbl.value.is_safe_to_delete.unsafe_as(Proc(UInt8*, COMAdminInUse*, HRESULT)).call(bstrdllname, pcomadmininuse)
  end
  def import_unconfigured_components(bstrapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, pvarcomponenttype : VARIANT*) : HRESULT
    @lpVtbl.value.import_unconfigured_components.unsafe_as(Proc(UInt8*, VARIANT*, VARIANT*, HRESULT)).call(bstrapplicationidorname, pvarclsidorprogid, pvarcomponenttype)
  end
  def promote_unconfigured_components(bstrapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, pvarcomponenttype : VARIANT*) : HRESULT
    @lpVtbl.value.promote_unconfigured_components.unsafe_as(Proc(UInt8*, VARIANT*, VARIANT*, HRESULT)).call(bstrapplicationidorname, pvarclsidorprogid, pvarcomponenttype)
  end
  def import_components(bstrapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, pvarcomponenttype : VARIANT*) : HRESULT
    @lpVtbl.value.import_components.unsafe_as(Proc(UInt8*, VARIANT*, VARIANT*, HRESULT)).call(bstrapplicationidorname, pvarclsidorprogid, pvarcomponenttype)
  end
  def get_is64_bit_catalog_server(pbis64bit : Int16*) : HRESULT
    @lpVtbl.value.get_is64_bit_catalog_server.unsafe_as(Proc(Int16*, HRESULT)).call(pbis64bit)
  end
  def export_partition(bstrpartitionidorname : UInt8*, bstrpartitionfilename : UInt8*, loptions : COMAdminApplicationExportOptions) : HRESULT
    @lpVtbl.value.export_partition.unsafe_as(Proc(UInt8*, UInt8*, COMAdminApplicationExportOptions, HRESULT)).call(bstrpartitionidorname, bstrpartitionfilename, loptions)
  end
  def install_partition(bstrfilename : UInt8*, bstrdestdirectory : UInt8*, loptions : COMAdminApplicationInstallOptions, bstruserid : UInt8*, bstrpassword : UInt8*, bstrrsn : UInt8*) : HRESULT
    @lpVtbl.value.install_partition.unsafe_as(Proc(UInt8*, UInt8*, COMAdminApplicationInstallOptions, UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrfilename, bstrdestdirectory, loptions, bstruserid, bstrpassword, bstrrsn)
  end
  def query_application_file2(bstrapplicationfile : UInt8*, ppfilesforimport : IDispatch*) : HRESULT
    @lpVtbl.value.query_application_file2.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrapplicationfile, ppfilesforimport)
  end
  def get_component_version_count(bstrclsidorprogid : UInt8*, plversioncount : Int32*) : HRESULT
    @lpVtbl.value.get_component_version_count.unsafe_as(Proc(UInt8*, Int32*, HRESULT)).call(bstrclsidorprogid, plversioncount)
  end
end
struct LibWin32::ICatalogObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_value(bstrpropname : UInt8*, pvarretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrpropname, pvarretval)
  end
  def put_value(bstrpropname : UInt8*, val : VARIANT) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(bstrpropname, val)
  end
  def get_key(pvarretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_key.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarretval)
  end
  def get_name(pvarretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarretval)
  end
  def is_property_read_only(bstrpropname : UInt8*, pbretval : Int16*) : HRESULT
    @lpVtbl.value.is_property_read_only.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(bstrpropname, pbretval)
  end
  def get_valid(pbretval : Int16*) : HRESULT
    @lpVtbl.value.get_valid.unsafe_as(Proc(Int16*, HRESULT)).call(pbretval)
  end
  def is_property_write_only(bstrpropname : UInt8*, pbretval : Int16*) : HRESULT
    @lpVtbl.value.is_property_write_only.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(bstrpropname, pbretval)
  end
end
struct LibWin32::ICatalogCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(ppenumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenumvariant)
  end
  def get_item(lindex : Int32, ppcatalogobject : IDispatch*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IDispatch*, HRESULT)).call(lindex, ppcatalogobject)
  end
  def get_count(plobjectcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plobjectcount)
  end
  def remove(lindex : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(lindex)
  end
  def add(ppcatalogobject : IDispatch*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppcatalogobject)
  end
  def populate : HRESULT
    @lpVtbl.value.populate.unsafe_as(Proc(HRESULT)).call
  end
  def save_changes(pcchanges : Int32*) : HRESULT
    @lpVtbl.value.save_changes.unsafe_as(Proc(Int32*, HRESULT)).call(pcchanges)
  end
  def get_collection(bstrcollname : UInt8*, varobjectkey : VARIANT, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.unsafe_as(Proc(UInt8*, VARIANT, IDispatch*, HRESULT)).call(bstrcollname, varobjectkey, ppcatalogcollection)
  end
  def get_name(pvarnamel : VARIANT*) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarnamel)
  end
  def get_add_enabled(pvarbool : Int16*) : HRESULT
    @lpVtbl.value.get_add_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvarbool)
  end
  def get_remove_enabled(pvarbool : Int16*) : HRESULT
    @lpVtbl.value.get_remove_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pvarbool)
  end
  def get_util_interface(ppidispatch : IDispatch*) : HRESULT
    @lpVtbl.value.get_util_interface.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppidispatch)
  end
  def get_data_store_major_version(plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_data_store_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(plmajorversion)
  end
  def get_data_store_minor_version(plminorversionl : Int32*) : HRESULT
    @lpVtbl.value.get_data_store_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(plminorversionl)
  end
  def populate_by_key(psakeys : SAFEARRAY*) : HRESULT
    @lpVtbl.value.populate_by_key.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(psakeys)
  end
  def populate_by_query(bstrquerystring : UInt8*, lquerytype : Int32) : HRESULT
    @lpVtbl.value.populate_by_query.unsafe_as(Proc(UInt8*, Int32, HRESULT)).call(bstrquerystring, lquerytype)
  end
end
struct LibWin32::ISecurityIdentityColl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_item(name : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(name, pitem)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISecurityCallersColl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_item(lindex : Int32, pobj : ISecurityIdentityColl*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, ISecurityIdentityColl*, HRESULT)).call(lindex, pobj)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISecurityCallContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_item(name : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(name, pitem)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
  def is_caller_in_role(bstrrole : UInt8*, pfinrole : Int16*) : HRESULT
    @lpVtbl.value.is_caller_in_role.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(bstrrole, pfinrole)
  end
  def is_security_enabled(pfisenabled : Int16*) : HRESULT
    @lpVtbl.value.is_security_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pfisenabled)
  end
  def is_user_in_role(puser : VARIANT*, bstrrole : UInt8*, pfinrole : Int16*) : HRESULT
    @lpVtbl.value.is_user_in_role.unsafe_as(Proc(VARIANT*, UInt8*, Int16*, HRESULT)).call(puser, bstrrole, pfinrole)
  end
end
struct LibWin32::IGetSecurityCallContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_security_call_context(ppobject : ISecurityCallContext*) : HRESULT
    @lpVtbl.value.get_security_call_context.unsafe_as(Proc(ISecurityCallContext*, HRESULT)).call(ppobject)
  end
end
struct LibWin32::SecurityProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_direct_caller_name(bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_direct_caller_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrusername)
  end
  def get_direct_creator_name(bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_direct_creator_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrusername)
  end
  def get_original_caller_name(bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_original_caller_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrusername)
  end
  def get_original_creator_name(bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_original_creator_name.unsafe_as(Proc(UInt8**, HRESULT)).call(bstrusername)
  end
end
struct LibWin32::ContextInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def is_in_transaction(pbisintx : Int16*) : HRESULT
    @lpVtbl.value.is_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pbisintx)
  end
  def get_transaction(pptx : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(IUnknown*, HRESULT)).call(pptx)
  end
  def get_transaction_id(pbstrtxid : UInt8**) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtxid)
  end
  def get_activity_id(pbstractivityid : UInt8**) : HRESULT
    @lpVtbl.value.get_activity_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstractivityid)
  end
  def get_context_id(pbstrctxid : UInt8**) : HRESULT
    @lpVtbl.value.get_context_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrctxid)
  end
end
struct LibWin32::ContextInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def is_in_transaction(pbisintx : Int16*) : HRESULT
    @lpVtbl.value.is_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pbisintx)
  end
  def get_transaction(pptx : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(IUnknown*, HRESULT)).call(pptx)
  end
  def get_transaction_id(pbstrtxid : UInt8**) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtxid)
  end
  def get_activity_id(pbstractivityid : UInt8**) : HRESULT
    @lpVtbl.value.get_activity_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstractivityid)
  end
  def get_context_id(pbstrctxid : UInt8**) : HRESULT
    @lpVtbl.value.get_context_id.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrctxid)
  end
  def get_partition_id(midl__contextinfo20000 : UInt8**) : HRESULT
    @lpVtbl.value.get_partition_id.unsafe_as(Proc(UInt8**, HRESULT)).call(midl__contextinfo20000)
  end
  def get_application_id(midl__contextinfo20001 : UInt8**) : HRESULT
    @lpVtbl.value.get_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(midl__contextinfo20001)
  end
  def get_application_instance_id(midl__contextinfo20002 : UInt8**) : HRESULT
    @lpVtbl.value.get_application_instance_id.unsafe_as(Proc(UInt8**, HRESULT)).call(midl__contextinfo20002)
  end
end
struct LibWin32::ObjectContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_instance(bstrprogid : UInt8*, pobject : VARIANT*) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(bstrprogid, pobject)
  end
  def set_complete : HRESULT
    @lpVtbl.value.set_complete.unsafe_as(Proc(HRESULT)).call
  end
  def set_abort : HRESULT
    @lpVtbl.value.set_abort.unsafe_as(Proc(HRESULT)).call
  end
  def enable_commit : HRESULT
    @lpVtbl.value.enable_commit.unsafe_as(Proc(HRESULT)).call
  end
  def disable_commit : HRESULT
    @lpVtbl.value.disable_commit.unsafe_as(Proc(HRESULT)).call
  end
  def is_in_transaction(pbisintx : Int16*) : HRESULT
    @lpVtbl.value.is_in_transaction.unsafe_as(Proc(Int16*, HRESULT)).call(pbisintx)
  end
  def is_security_enabled(pbisenabled : Int16*) : HRESULT
    @lpVtbl.value.is_security_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(pbisenabled)
  end
  def is_caller_in_role(bstrrole : UInt8*, pbinrole : Int16*) : HRESULT
    @lpVtbl.value.is_caller_in_role.unsafe_as(Proc(UInt8*, Int16*, HRESULT)).call(bstrrole, pbinrole)
  end
  def get_count(plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_item(name : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(name, pitem)
  end
  def get__new_enum(ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppenum)
  end
  def get_security(ppsecurityproperty : SecurityProperty*) : HRESULT
    @lpVtbl.value.get_security.unsafe_as(Proc(SecurityProperty*, HRESULT)).call(ppsecurityproperty)
  end
  def get_context_info(ppcontextinfo : ContextInfo*) : HRESULT
    @lpVtbl.value.get_context_info.unsafe_as(Proc(ContextInfo*, HRESULT)).call(ppcontextinfo)
  end
end
struct LibWin32::ITransactionContextEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instance(rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(rclsid, riid, pobject)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITransactionContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_instance(pszprogid : UInt8*, pobject : VARIANT*) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(pszprogid, pobject)
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ICreateWithTransactionEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instance(ptransaction : ITransaction, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(ITransaction, Guid*, Guid*, Void**, HRESULT)).call(ptransaction, rclsid, riid, pobject)
  end
end
struct LibWin32::ICreateWithLocalTransaction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instance_with_sys_tx(ptransaction : IUnknown, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance_with_sys_tx.unsafe_as(Proc(IUnknown, Guid*, Guid*, Void**, HRESULT)).call(ptransaction, rclsid, riid, pobject)
  end
end
struct LibWin32::ICreateWithTipTransactionEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instance(bstrtipurl : UInt8*, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(UInt8*, Guid*, Guid*, Void**, HRESULT)).call(bstrtipurl, rclsid, riid, pobject)
  end
end
struct LibWin32::IComLTxEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_ltx_transaction_start(pinfo : COMSVCSEVENTINFO*, guidltx : Guid, tsid : Guid, froot : LibC::BOOL, nisolationlevel : Int32) : HRESULT
    @lpVtbl.value.on_ltx_transaction_start.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, Guid, LibC::BOOL, Int32, HRESULT)).call(pinfo, guidltx, tsid, froot, nisolationlevel)
  end
  def on_ltx_transaction_prepare(pinfo : COMSVCSEVENTINFO*, guidltx : Guid, fvote : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_ltx_transaction_prepare.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, LibC::BOOL, HRESULT)).call(pinfo, guidltx, fvote)
  end
  def on_ltx_transaction_abort(pinfo : COMSVCSEVENTINFO*, guidltx : Guid) : HRESULT
    @lpVtbl.value.on_ltx_transaction_abort.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidltx)
  end
  def on_ltx_transaction_commit(pinfo : COMSVCSEVENTINFO*, guidltx : Guid) : HRESULT
    @lpVtbl.value.on_ltx_transaction_commit.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidltx)
  end
  def on_ltx_transaction_promote(pinfo : COMSVCSEVENTINFO*, guidltx : Guid, txnid : Guid) : HRESULT
    @lpVtbl.value.on_ltx_transaction_promote.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, Guid, HRESULT)).call(pinfo, guidltx, txnid)
  end
end
struct LibWin32::IComUserEvent
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_user_event(pinfo : COMSVCSEVENTINFO*, pvarevent : VARIANT*) : HRESULT
    @lpVtbl.value.on_user_event.unsafe_as(Proc(COMSVCSEVENTINFO*, VARIANT*, HRESULT)).call(pinfo, pvarevent)
  end
end
struct LibWin32::IComThreadEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_thread_start(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, dwthread : UInt32, dwtheadcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_start.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt32, UInt32, HRESULT)).call(pinfo, threadid, dwthread, dwtheadcnt)
  end
  def on_thread_terminate(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, dwthread : UInt32, dwtheadcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_terminate.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt32, UInt32, HRESULT)).call(pinfo, threadid, dwthread, dwtheadcnt)
  end
  def on_thread_bind_to_apartment(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, aptid : UInt64, dwactcnt : UInt32, dwlowcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_bind_to_apartment.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, UInt32, HRESULT)).call(pinfo, threadid, aptid, dwactcnt, dwlowcnt)
  end
  def on_thread_un_bind(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, aptid : UInt64, dwactcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_un_bind.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)).call(pinfo, threadid, aptid, dwactcnt)
  end
  def on_thread_work_enque(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32) : HRESULT
    @lpVtbl.value.on_thread_work_enque.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)).call(pinfo, threadid, msgworkid, queuelen)
  end
  def on_thread_work_private(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64) : HRESULT
    @lpVtbl.value.on_thread_work_private.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, HRESULT)).call(pinfo, threadid, msgworkid)
  end
  def on_thread_work_public(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32) : HRESULT
    @lpVtbl.value.on_thread_work_public.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)).call(pinfo, threadid, msgworkid, queuelen)
  end
  def on_thread_work_redirect(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32, threadnum : UInt64) : HRESULT
    @lpVtbl.value.on_thread_work_redirect.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, UInt64, HRESULT)).call(pinfo, threadid, msgworkid, queuelen, threadnum)
  end
  def on_thread_work_reject(pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32) : HRESULT
    @lpVtbl.value.on_thread_work_reject.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, HRESULT)).call(pinfo, threadid, msgworkid, queuelen)
  end
  def on_thread_assign_apartment(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, aptid : UInt64) : HRESULT
    @lpVtbl.value.on_thread_assign_apartment.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt64, HRESULT)).call(pinfo, guidactivity, aptid)
  end
  def on_thread_unassign_apartment(pinfo : COMSVCSEVENTINFO*, aptid : UInt64) : HRESULT
    @lpVtbl.value.on_thread_unassign_apartment.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, aptid)
  end
end
struct LibWin32::IComAppEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_app_activation(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_activation.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_app_shutdown(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_shutdown.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_app_force_shutdown(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_force_shutdown.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
end
struct LibWin32::IComInstanceEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_object_create(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, clsid : Guid*, tsid : Guid*, ctxtid : UInt64, objectid : UInt64) : HRESULT
    @lpVtbl.value.on_object_create.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, UInt64, HRESULT)).call(pinfo, guidactivity, clsid, tsid, ctxtid, objectid)
  end
  def on_object_destroy(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_object_destroy.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, ctxtid)
  end
end
struct LibWin32::IComTransactionEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_transaction_start(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, tsid : Guid*, froot : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_transaction_start.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, LibC::BOOL, HRESULT)).call(pinfo, guidtx, tsid, froot)
  end
  def on_transaction_prepare(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, fvoteyes : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_transaction_prepare.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, LibC::BOOL, HRESULT)).call(pinfo, guidtx, fvoteyes)
  end
  def on_transaction_abort(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_abort.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, HRESULT)).call(pinfo, guidtx)
  end
  def on_transaction_commit(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_commit.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, HRESULT)).call(pinfo, guidtx)
  end
end
struct LibWin32::IComMethodEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_method_call(pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_call.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, HRESULT)).call(pinfo, oid, guidcid, guidrid, imeth)
  end
  def on_method_return(pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, imeth : UInt32, hresult : HRESULT) : HRESULT
    @lpVtbl.value.on_method_return.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, HRESULT, HRESULT)).call(pinfo, oid, guidcid, guidrid, imeth, hresult)
  end
  def on_method_exception(pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_exception.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, HRESULT)).call(pinfo, oid, guidcid, guidrid, imeth)
  end
end
struct LibWin32::IComObjectEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_object_activate(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64, objectid : UInt64) : HRESULT
    @lpVtbl.value.on_object_activate.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, HRESULT)).call(pinfo, ctxtid, objectid)
  end
  def on_object_deactivate(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64, objectid : UInt64) : HRESULT
    @lpVtbl.value.on_object_deactivate.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, UInt64, HRESULT)).call(pinfo, ctxtid, objectid)
  end
  def on_disable_commit(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_disable_commit.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, ctxtid)
  end
  def on_enable_commit(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_enable_commit.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, ctxtid)
  end
  def on_set_complete(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_set_complete.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, ctxtid)
  end
  def on_set_abort(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_set_abort.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, ctxtid)
  end
end
struct LibWin32::IComResourceEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_resource_create(pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64, enlisted : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_resource_create.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, LibC::BOOL, HRESULT)).call(pinfo, objectid, psztype, resid, enlisted)
  end
  def on_resource_allocate(pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64, enlisted : LibC::BOOL, numrated : UInt32, rating : UInt32) : HRESULT
    @lpVtbl.value.on_resource_allocate.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, LibC::BOOL, UInt32, UInt32, HRESULT)).call(pinfo, objectid, psztype, resid, enlisted, numrated, rating)
  end
  def on_resource_recycle(pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64) : HRESULT
    @lpVtbl.value.on_resource_recycle.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, HRESULT)).call(pinfo, objectid, psztype, resid)
  end
  def on_resource_destroy(pinfo : COMSVCSEVENTINFO*, objectid : UInt64, hr : HRESULT, psztype : LibC::LPWSTR, resid : UInt64) : HRESULT
    @lpVtbl.value.on_resource_destroy.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT, LibC::LPWSTR, UInt64, HRESULT)).call(pinfo, objectid, hr, psztype, resid)
  end
  def on_resource_track(pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64, enlisted : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_resource_track.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, UInt64, LibC::BOOL, HRESULT)).call(pinfo, objectid, psztype, resid, enlisted)
  end
end
struct LibWin32::IComSecurityEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_authenticate(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, objectid : UInt64, guidiid : Guid*, imeth : UInt32, cbbyteorig : UInt32, psidoriginaluser : UInt8*, cbbytecur : UInt32, psidcurrentuser : UInt8*, bcurrentuserinpersonatinginproc : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_authenticate.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt64, Guid*, UInt32, UInt32, UInt8*, UInt32, UInt8*, LibC::BOOL, HRESULT)).call(pinfo, guidactivity, objectid, guidiid, imeth, cbbyteorig, psidoriginaluser, cbbytecur, psidcurrentuser, bcurrentuserinpersonatinginproc)
  end
  def on_authenticate_fail(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, objectid : UInt64, guidiid : Guid*, imeth : UInt32, cbbyteorig : UInt32, psidoriginaluser : UInt8*, cbbytecur : UInt32, psidcurrentuser : UInt8*, bcurrentuserinpersonatinginproc : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_authenticate_fail.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt64, Guid*, UInt32, UInt32, UInt8*, UInt32, UInt8*, LibC::BOOL, HRESULT)).call(pinfo, guidactivity, objectid, guidiid, imeth, cbbyteorig, psidoriginaluser, cbbytecur, psidcurrentuser, bcurrentuserinpersonatinginproc)
  end
end
struct LibWin32::IComObjectPoolEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_obj_pool_put_object(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, nreason : Int32, dwavailable : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_put_object.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Int32, UInt32, UInt64, HRESULT)).call(pinfo, guidobject, nreason, dwavailable, oid)
  end
  def on_obj_pool_get_object(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, dwavailable : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_get_object.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, UInt64, HRESULT)).call(pinfo, guidactivity, guidobject, dwavailable, oid)
  end
  def on_obj_pool_recycle_to_tx(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_recycle_to_tx.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, HRESULT)).call(pinfo, guidactivity, guidobject, guidtx, objid)
  end
  def on_obj_pool_get_from_tx(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_get_from_tx.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, HRESULT)).call(pinfo, guidactivity, guidobject, guidtx, objid)
  end
end
struct LibWin32::IComObjectPoolEvents2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_obj_pool_create_object(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, dwobjscreated : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_create_object.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt32, UInt64, HRESULT)).call(pinfo, guidobject, dwobjscreated, oid)
  end
  def on_obj_pool_destroy_object(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, dwobjscreated : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_destroy_object.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt32, UInt64, HRESULT)).call(pinfo, guidobject, dwobjscreated, oid)
  end
  def on_obj_pool_create_decision(pinfo : COMSVCSEVENTINFO*, dwthreadswaiting : UInt32, dwavail : UInt32, dwcreated : UInt32, dwmin : UInt32, dwmax : UInt32) : HRESULT
    @lpVtbl.value.on_obj_pool_create_decision.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt32, UInt32, UInt32, UInt32, UInt32, HRESULT)).call(pinfo, dwthreadswaiting, dwavail, dwcreated, dwmin, dwmax)
  end
  def on_obj_pool_timeout(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, guidactivity : Guid*, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.on_obj_pool_timeout.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, HRESULT)).call(pinfo, guidobject, guidactivity, dwtimeout)
  end
  def on_obj_pool_create_pool(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, dwmin : UInt32, dwmax : UInt32, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.on_obj_pool_create_pool.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt32, UInt32, UInt32, HRESULT)).call(pinfo, guidobject, dwmin, dwmax, dwtimeout)
  end
end
struct LibWin32::IComObjectConstructionEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_object_construct(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, sconstructstring : LibC::LPWSTR, oid : UInt64) : HRESULT
    @lpVtbl.value.on_object_construct.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, LibC::LPWSTR, UInt64, HRESULT)).call(pinfo, guidobject, sconstructstring, oid)
  end
end
struct LibWin32::IComActivityEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_activity_create(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*) : HRESULT
    @lpVtbl.value.on_activity_create.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, HRESULT)).call(pinfo, guidactivity)
  end
  def on_activity_destroy(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*) : HRESULT
    @lpVtbl.value.on_activity_destroy.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, HRESULT)).call(pinfo, guidactivity)
  end
  def on_activity_enter(pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, guidentered : Guid*, dwthread : UInt32) : HRESULT
    @lpVtbl.value.on_activity_enter.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, HRESULT)).call(pinfo, guidcurrent, guidentered, dwthread)
  end
  def on_activity_timeout(pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, guidentered : Guid*, dwthread : UInt32, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.on_activity_timeout.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, UInt32, HRESULT)).call(pinfo, guidcurrent, guidentered, dwthread, dwtimeout)
  end
  def on_activity_reenter(pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, dwthread : UInt32, dwcalldepth : UInt32) : HRESULT
    @lpVtbl.value.on_activity_reenter.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt32, UInt32, HRESULT)).call(pinfo, guidcurrent, dwthread, dwcalldepth)
  end
  def on_activity_leave(pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, guidleft : Guid*) : HRESULT
    @lpVtbl.value.on_activity_leave.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, HRESULT)).call(pinfo, guidcurrent, guidleft)
  end
  def on_activity_leave_same(pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, dwcalldepth : UInt32) : HRESULT
    @lpVtbl.value.on_activity_leave_same.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, UInt32, HRESULT)).call(pinfo, guidcurrent, dwcalldepth)
  end
end
struct LibWin32::IComIdentityEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_iis_request_info(pinfo : COMSVCSEVENTINFO*, objid : UInt64, pszclientip : LibC::LPWSTR, pszserverip : LibC::LPWSTR, pszurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_iis_request_info.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pinfo, objid, pszclientip, pszserverip, pszurl)
  end
end
struct LibWin32::IComQCEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_qc_record(pinfo : COMSVCSEVENTINFO*, objid : UInt64, szqueue : Char*, guidmsgid : Guid*, guidworkflowid : Guid*, msmqhr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_record.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Char*, Guid*, Guid*, HRESULT, HRESULT)).call(pinfo, objid, szqueue, guidmsgid, guidworkflowid, msmqhr)
  end
  def on_qc_queue_open(pinfo : COMSVCSEVENTINFO*, szqueue : Char*, queueid : UInt64, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_queue_open.unsafe_as(Proc(COMSVCSEVENTINFO*, Char*, UInt64, HRESULT, HRESULT)).call(pinfo, szqueue, queueid, hr)
  end
  def on_qc_receive(pinfo : COMSVCSEVENTINFO*, queueid : UInt64, guidmsgid : Guid*, guidworkflowid : Guid*, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_receive.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, HRESULT, HRESULT)).call(pinfo, queueid, guidmsgid, guidworkflowid, hr)
  end
  def on_qc_receive_fail(pinfo : COMSVCSEVENTINFO*, queueid : UInt64, msmqhr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_receive_fail.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT, HRESULT)).call(pinfo, queueid, msmqhr)
  end
  def on_qc_move_to_re_try_queue(pinfo : COMSVCSEVENTINFO*, guidmsgid : Guid*, guidworkflowid : Guid*, retryindex : UInt32) : HRESULT
    @lpVtbl.value.on_qc_move_to_re_try_queue.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, HRESULT)).call(pinfo, guidmsgid, guidworkflowid, retryindex)
  end
  def on_qc_move_to_dead_queue(pinfo : COMSVCSEVENTINFO*, guidmsgid : Guid*, guidworkflowid : Guid*) : HRESULT
    @lpVtbl.value.on_qc_move_to_dead_queue.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, HRESULT)).call(pinfo, guidmsgid, guidworkflowid)
  end
  def on_qc_playback(pinfo : COMSVCSEVENTINFO*, objid : UInt64, guidmsgid : Guid*, guidworkflowid : Guid*, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_playback.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, HRESULT, HRESULT)).call(pinfo, objid, guidmsgid, guidworkflowid, hr)
  end
end
struct LibWin32::IComExceptionEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_exception_user(pinfo : COMSVCSEVENTINFO*, code : UInt32, address : UInt64, pszstacktrace : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_exception_user.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt32, UInt64, LibC::LPWSTR, HRESULT)).call(pinfo, code, address, pszstacktrace)
  end
end
struct LibWin32::ILBEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def target_up(bstrservername : UInt8*, bstrclsideng : UInt8*) : HRESULT
    @lpVtbl.value.target_up.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrservername, bstrclsideng)
  end
  def target_down(bstrservername : UInt8*, bstrclsideng : UInt8*) : HRESULT
    @lpVtbl.value.target_down.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(bstrservername, bstrclsideng)
  end
  def engine_defined(bstrpropname : UInt8*, varpropvalue : VARIANT*, bstrclsideng : UInt8*) : HRESULT
    @lpVtbl.value.engine_defined.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(bstrpropname, varpropvalue, bstrclsideng)
  end
end
struct LibWin32::IComCRMEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_crm_recovery_start(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_crm_recovery_start.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_crm_recovery_done(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_crm_recovery_done.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_crm_checkpoint(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_crm_checkpoint.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_crm_begin(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, guidactivity : Guid, guidtx : Guid, szprogidcompensator : Char*, szdescription : Char*) : HRESULT
    @lpVtbl.value.on_crm_begin.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, Guid, Guid, Char*, Char*, HRESULT)).call(pinfo, guidclerkclsid, guidactivity, guidtx, szprogidcompensator, szdescription)
  end
  def on_crm_prepare(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_prepare.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_commit(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_commit.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_abort(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_abort.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_indoubt(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_indoubt.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_done(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_done.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_release(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_release.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_analyze(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, dwcrmrecordtype : UInt32, dwrecordsize : UInt32) : HRESULT
    @lpVtbl.value.on_crm_analyze.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, UInt32, UInt32, HRESULT)).call(pinfo, guidclerkclsid, dwcrmrecordtype, dwrecordsize)
  end
  def on_crm_write(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, fvariants : LibC::BOOL, dwrecordsize : UInt32) : HRESULT
    @lpVtbl.value.on_crm_write.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, LibC::BOOL, UInt32, HRESULT)).call(pinfo, guidclerkclsid, fvariants, dwrecordsize)
  end
  def on_crm_forget(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_forget.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_force(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_force.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidclerkclsid)
  end
  def on_crm_deliver(pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, fvariants : LibC::BOOL, dwrecordsize : UInt32) : HRESULT
    @lpVtbl.value.on_crm_deliver.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, LibC::BOOL, UInt32, HRESULT)).call(pinfo, guidclerkclsid, fvariants, dwrecordsize)
  end
end
struct LibWin32::IComMethod2Events
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_method_call2(pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, dwthread : UInt32, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_call2.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, UInt32, HRESULT)).call(pinfo, oid, guidcid, guidrid, dwthread, imeth)
  end
  def on_method_return2(pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, dwthread : UInt32, imeth : UInt32, hresult : HRESULT) : HRESULT
    @lpVtbl.value.on_method_return2.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, UInt32, HRESULT, HRESULT)).call(pinfo, oid, guidcid, guidrid, dwthread, imeth, hresult)
  end
  def on_method_exception2(pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, dwthread : UInt32, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_exception2.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, Guid*, Guid*, UInt32, UInt32, HRESULT)).call(pinfo, oid, guidcid, guidrid, dwthread, imeth)
  end
end
struct LibWin32::IComTrackingInfoEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_new_tracking_info(ptoplevelcollection : IUnknown) : HRESULT
    @lpVtbl.value.on_new_tracking_info.unsafe_as(Proc(IUnknown, HRESULT)).call(ptoplevelcollection)
  end
end
struct LibWin32::IComTrackingInfoCollection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def type(ptype : TRACKING_COLL_TYPE*) : HRESULT
    @lpVtbl.value.type.unsafe_as(Proc(TRACKING_COLL_TYPE*, HRESULT)).call(ptype)
  end
  def count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def item(ulindex : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(ulindex, riid, ppv)
  end
end
struct LibWin32::IComTrackingInfoObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_value(szpropertyname : LibC::LPWSTR, pvarout : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(LibC::LPWSTR, VARIANT*, HRESULT)).call(szpropertyname, pvarout)
  end
end
struct LibWin32::IComTrackingInfoProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def prop_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.prop_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_prop_name(ulindex : UInt32, ppszpropname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_prop_name.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(ulindex, ppszpropname)
  end
end
struct LibWin32::IComApp2Events
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_app_activation2(pinfo : COMSVCSEVENTINFO*, guidapp : Guid, guidprocess : Guid) : HRESULT
    @lpVtbl.value.on_app_activation2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, Guid, HRESULT)).call(pinfo, guidapp, guidprocess)
  end
  def on_app_shutdown2(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_shutdown2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_app_force_shutdown2(pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_force_shutdown2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, HRESULT)).call(pinfo, guidapp)
  end
  def on_app_paused2(pinfo : COMSVCSEVENTINFO*, guidapp : Guid, bpaused : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_app_paused2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, LibC::BOOL, HRESULT)).call(pinfo, guidapp, bpaused)
  end
  def on_app_recycle2(pinfo : COMSVCSEVENTINFO*, guidapp : Guid, guidprocess : Guid, lreason : Int32) : HRESULT
    @lpVtbl.value.on_app_recycle2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid, Guid, Int32, HRESULT)).call(pinfo, guidapp, guidprocess, lreason)
  end
end
struct LibWin32::IComTransaction2Events
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_transaction_start2(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, tsid : Guid*, froot : LibC::BOOL, nisolationlevel : Int32) : HRESULT
    @lpVtbl.value.on_transaction_start2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, LibC::BOOL, Int32, HRESULT)).call(pinfo, guidtx, tsid, froot, nisolationlevel)
  end
  def on_transaction_prepare2(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, fvoteyes : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_transaction_prepare2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, LibC::BOOL, HRESULT)).call(pinfo, guidtx, fvoteyes)
  end
  def on_transaction_abort2(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_abort2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, HRESULT)).call(pinfo, guidtx)
  end
  def on_transaction_commit2(pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_commit2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, HRESULT)).call(pinfo, guidtx)
  end
end
struct LibWin32::IComInstance2Events
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_object_create2(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, clsid : Guid*, tsid : Guid*, ctxtid : UInt64, objectid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_object_create2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, UInt64, Guid*, HRESULT)).call(pinfo, guidactivity, clsid, tsid, ctxtid, objectid, guidpartition)
  end
  def on_object_destroy2(pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_object_destroy2.unsafe_as(Proc(COMSVCSEVENTINFO*, UInt64, HRESULT)).call(pinfo, ctxtid)
  end
end
struct LibWin32::IComObjectPool2Events
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_obj_pool_put_object2(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, nreason : Int32, dwavailable : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_put_object2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Int32, UInt32, UInt64, HRESULT)).call(pinfo, guidobject, nreason, dwavailable, oid)
  end
  def on_obj_pool_get_object2(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, dwavailable : UInt32, oid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_obj_pool_get_object2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, UInt32, UInt64, Guid*, HRESULT)).call(pinfo, guidactivity, guidobject, dwavailable, oid, guidpartition)
  end
  def on_obj_pool_recycle_to_tx2(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_recycle_to_tx2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, HRESULT)).call(pinfo, guidactivity, guidobject, guidtx, objid)
  end
  def on_obj_pool_get_from_tx2(pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_obj_pool_get_from_tx2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, Guid*, Guid*, UInt64, Guid*, HRESULT)).call(pinfo, guidactivity, guidobject, guidtx, objid, guidpartition)
  end
end
struct LibWin32::IComObjectConstruction2Events
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_object_construct2(pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, sconstructstring : LibC::LPWSTR, oid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_object_construct2.unsafe_as(Proc(COMSVCSEVENTINFO*, Guid*, LibC::LPWSTR, UInt64, Guid*, HRESULT)).call(pinfo, guidobject, sconstructstring, oid, guidpartition)
  end
end
struct LibWin32::ISystemAppEventData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def startup : HRESULT
    @lpVtbl.value.startup.unsafe_as(Proc(HRESULT)).call
  end
  def on_data_changed(dwpid : UInt32, dwmask : UInt32, dwnumbersinks : UInt32, bstrdwmethodmask : UInt8*, dwreason : UInt32, u64tracehandle : UInt64) : HRESULT
    @lpVtbl.value.on_data_changed.unsafe_as(Proc(UInt32, UInt32, UInt32, UInt8*, UInt32, UInt64, HRESULT)).call(dwpid, dwmask, dwnumbersinks, bstrdwmethodmask, dwreason, u64tracehandle)
  end
end
struct LibWin32::IMtsEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_package_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_package_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def get_package_guid(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_package_guid.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def post_event(vevent : VARIANT*) : HRESULT
    @lpVtbl.value.post_event.unsafe_as(Proc(VARIANT*, HRESULT)).call(vevent)
  end
  def get_fire_events(pval : Int16*) : HRESULT
    @lpVtbl.value.get_fire_events.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_process_id(id : Int32*) : HRESULT
    @lpVtbl.value.get_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(id)
  end
end
struct LibWin32::IMtsEventInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_names(punk : IUnknown*) : HRESULT
    @lpVtbl.value.get_names.unsafe_as(Proc(IUnknown*, HRESULT)).call(punk)
  end
  def get_display_name(sdisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(sdisplayname)
  end
  def get_event_id(sguideventid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_id.unsafe_as(Proc(UInt8**, HRESULT)).call(sguideventid)
  end
  def get_count(lcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(lcount)
  end
  def get_value(skey : UInt8*, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(skey, pval)
  end
end
struct LibWin32::IMTSLocator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_dispatcher(punk : IUnknown*) : HRESULT
    @lpVtbl.value.get_event_dispatcher.unsafe_as(Proc(IUnknown*, HRESULT)).call(punk)
  end
end
struct LibWin32::IMtsGrp
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def item(lindex : Int32, ppunkdispatcher : IUnknown*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(lindex, ppunkdispatcher)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMessageMover
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_source_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_source_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_source_path(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_source_path.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_dest_path(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_dest_path.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_dest_path(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_dest_path.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_commit_batch_size(pval : Int32*) : HRESULT
    @lpVtbl.value.get_commit_batch_size.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def put_commit_batch_size(newval : Int32) : HRESULT
    @lpVtbl.value.put_commit_batch_size.unsafe_as(Proc(Int32, HRESULT)).call(newval)
  end
  def move_messages(plmessagesmoved : Int32*) : HRESULT
    @lpVtbl.value.move_messages.unsafe_as(Proc(Int32*, HRESULT)).call(plmessagesmoved)
  end
end
struct LibWin32::IEventServerTrace
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def start_trace_guid(bstrguidevent : UInt8*, bstrguidfilter : UInt8*, lpidfilter : Int32) : HRESULT
    @lpVtbl.value.start_trace_guid.unsafe_as(Proc(UInt8*, UInt8*, Int32, HRESULT)).call(bstrguidevent, bstrguidfilter, lpidfilter)
  end
  def stop_trace_guid(bstrguidevent : UInt8*, bstrguidfilter : UInt8*, lpidfilter : Int32) : HRESULT
    @lpVtbl.value.stop_trace_guid.unsafe_as(Proc(UInt8*, UInt8*, Int32, HRESULT)).call(bstrguidevent, bstrguidfilter, lpidfilter)
  end
  def enum_trace_guid(plcntguids : Int32*, pbstrguidlist : UInt8**) : HRESULT
    @lpVtbl.value.enum_trace_guid.unsafe_as(Proc(Int32*, UInt8**, HRESULT)).call(plcntguids, pbstrguidlist)
  end
end
struct LibWin32::IGetAppTrackerData
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_application_processes(partitionid : Guid*, applicationid : Guid*, flags : UInt32, numapplicationprocesses : UInt32*, applicationprocesses : ApplicationProcessSummary**) : HRESULT
    @lpVtbl.value.get_application_processes.unsafe_as(Proc(Guid*, Guid*, UInt32, UInt32*, ApplicationProcessSummary**, HRESULT)).call(partitionid, applicationid, flags, numapplicationprocesses, applicationprocesses)
  end
  def get_application_process_details(applicationinstanceid : Guid*, processid : UInt32, flags : UInt32, summary : ApplicationProcessSummary*, statistics : ApplicationProcessStatistics*, recycleinfo : ApplicationProcessRecycleInfo*, anycomponentshangmonitored : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_application_process_details.unsafe_as(Proc(Guid*, UInt32, UInt32, ApplicationProcessSummary*, ApplicationProcessStatistics*, ApplicationProcessRecycleInfo*, LibC::BOOL*, HRESULT)).call(applicationinstanceid, processid, flags, summary, statistics, recycleinfo, anycomponentshangmonitored)
  end
  def get_applications_in_process(applicationinstanceid : Guid*, processid : UInt32, partitionid : Guid*, flags : UInt32, numapplicationsinprocess : UInt32*, applications : ApplicationSummary**) : HRESULT
    @lpVtbl.value.get_applications_in_process.unsafe_as(Proc(Guid*, UInt32, Guid*, UInt32, UInt32*, ApplicationSummary**, HRESULT)).call(applicationinstanceid, processid, partitionid, flags, numapplicationsinprocess, applications)
  end
  def get_components_in_process(applicationinstanceid : Guid*, processid : UInt32, partitionid : Guid*, applicationid : Guid*, flags : UInt32, numcomponentsinprocess : UInt32*, components : ComponentSummary**) : HRESULT
    @lpVtbl.value.get_components_in_process.unsafe_as(Proc(Guid*, UInt32, Guid*, Guid*, UInt32, UInt32*, ComponentSummary**, HRESULT)).call(applicationinstanceid, processid, partitionid, applicationid, flags, numcomponentsinprocess, components)
  end
  def get_component_details(applicationinstanceid : Guid*, processid : UInt32, clsid : Guid*, flags : UInt32, summary : ComponentSummary*, statistics : ComponentStatistics*, hangmonitorinfo : ComponentHangMonitorInfo*) : HRESULT
    @lpVtbl.value.get_component_details.unsafe_as(Proc(Guid*, UInt32, Guid*, UInt32, ComponentSummary*, ComponentStatistics*, ComponentHangMonitorInfo*, HRESULT)).call(applicationinstanceid, processid, clsid, flags, summary, statistics, hangmonitorinfo)
  end
  def get_tracker_data_as_collection_object(toplevelcollection : IUnknown*) : HRESULT
    @lpVtbl.value.get_tracker_data_as_collection_object.unsafe_as(Proc(IUnknown*, HRESULT)).call(toplevelcollection)
  end
  def get_suggested_polling_interval(pollingintervalinseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_suggested_polling_interval.unsafe_as(Proc(UInt32*, HRESULT)).call(pollingintervalinseconds)
  end
end
struct LibWin32::IDispenserManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_dispenser(midl__idispensermanager0000 : IDispenserDriver, szdispensername : LibC::LPWSTR, midl__idispensermanager0001 : IHolder*) : HRESULT
    @lpVtbl.value.register_dispenser.unsafe_as(Proc(IDispenserDriver, LibC::LPWSTR, IHolder*, HRESULT)).call(midl__idispensermanager0000, szdispensername, midl__idispensermanager0001)
  end
  def get_context(midl__idispensermanager0002 : LibC::UINT_PTR*, midl__idispensermanager0003 : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(LibC::UINT_PTR*, LibC::UINT_PTR*, HRESULT)).call(midl__idispensermanager0002, midl__idispensermanager0003)
  end
end
struct LibWin32::IHolder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def alloc_resource(midl__iholder0000 : LibC::UINT_PTR, midl__iholder0001 : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.alloc_resource.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)).call(midl__iholder0000, midl__iholder0001)
  end
  def free_resource(midl__iholder0002 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.free_resource.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(midl__iholder0002)
  end
  def track_resource(midl__iholder0003 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.track_resource.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(midl__iholder0003)
  end
  def track_resource_s(midl__iholder0004 : UInt16*) : HRESULT
    @lpVtbl.value.track_resource_s.unsafe_as(Proc(UInt16*, HRESULT)).call(midl__iholder0004)
  end
  def untrack_resource(midl__iholder0005 : LibC::UINT_PTR, midl__iholder0006 : LibC::BOOL) : HRESULT
    @lpVtbl.value.untrack_resource.unsafe_as(Proc(LibC::UINT_PTR, LibC::BOOL, HRESULT)).call(midl__iholder0005, midl__iholder0006)
  end
  def untrack_resource_s(midl__iholder0007 : UInt16*, midl__iholder0008 : LibC::BOOL) : HRESULT
    @lpVtbl.value.untrack_resource_s.unsafe_as(Proc(UInt16*, LibC::BOOL, HRESULT)).call(midl__iholder0007, midl__iholder0008)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def request_destroy_resource(midl__iholder0009 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.request_destroy_resource.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(midl__iholder0009)
  end
end
struct LibWin32::IDispenserDriver
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_resource(restypid : LibC::UINT_PTR, presid : LibC::UINT_PTR*, psecsfreebeforedestroy : Int32*) : HRESULT
    @lpVtbl.value.create_resource.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR*, Int32*, HRESULT)).call(restypid, presid, psecsfreebeforedestroy)
  end
  def rate_resource(restypid : LibC::UINT_PTR, resid : LibC::UINT_PTR, frequirestransactionenlistment : LibC::BOOL, prating : UInt32*) : HRESULT
    @lpVtbl.value.rate_resource.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR, LibC::BOOL, UInt32*, HRESULT)).call(restypid, resid, frequirestransactionenlistment, prating)
  end
  def enlist_resource(resid : LibC::UINT_PTR, transid : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.enlist_resource.unsafe_as(Proc(LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)).call(resid, transid)
  end
  def reset_resource(resid : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.reset_resource.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(resid)
  end
  def destroy_resource(resid : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.destroy_resource.unsafe_as(Proc(LibC::UINT_PTR, HRESULT)).call(resid)
  end
  def destroy_resource_s(resid : UInt16*) : HRESULT
    @lpVtbl.value.destroy_resource_s.unsafe_as(Proc(UInt16*, HRESULT)).call(resid)
  end
end
struct LibWin32::ITransactionProxy
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def commit(guid : Guid) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(Guid, HRESULT)).call(guid)
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
  def promote(ptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.promote.unsafe_as(Proc(ITransaction*, HRESULT)).call(ptransaction)
  end
  def create_voter(ptxasync : ITransactionVoterNotifyAsync2, ppballot : ITransactionVoterBallotAsync2*) : HRESULT
    @lpVtbl.value.create_voter.unsafe_as(Proc(ITransactionVoterNotifyAsync2, ITransactionVoterBallotAsync2*, HRESULT)).call(ptxasync, ppballot)
  end
  def get_isolation_level(midl__itransactionproxy0000 : Int32*) : HRESULT
    @lpVtbl.value.get_isolation_level.unsafe_as(Proc(Int32*, HRESULT)).call(midl__itransactionproxy0000)
  end
  def get_identifier(pbstridentifier : Guid*) : HRESULT
    @lpVtbl.value.get_identifier.unsafe_as(Proc(Guid*, HRESULT)).call(pbstridentifier)
  end
  def is_reusable(pfisreusable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_reusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfisreusable)
  end
end
struct LibWin32::IContextSecurityPerimeter
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_perimeter_flag(pflag : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_perimeter_flag.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pflag)
  end
  def set_perimeter_flag(fflag : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_perimeter_flag.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fflag)
  end
end
struct LibWin32::ITxProxyHolder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_identifier(pguidltx : Guid*) : Void
    @lpVtbl.value.get_identifier.unsafe_as(Proc(Guid*, Void)).call(pguidltx)
  end
end
struct LibWin32::IObjectContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_instance(rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_instance.unsafe_as(Proc(Guid*, Guid*, Void**, HRESULT)).call(rclsid, riid, ppv)
  end
  def set_complete : HRESULT
    @lpVtbl.value.set_complete.unsafe_as(Proc(HRESULT)).call
  end
  def set_abort : HRESULT
    @lpVtbl.value.set_abort.unsafe_as(Proc(HRESULT)).call
  end
  def enable_commit : HRESULT
    @lpVtbl.value.enable_commit.unsafe_as(Proc(HRESULT)).call
  end
  def disable_commit : HRESULT
    @lpVtbl.value.disable_commit.unsafe_as(Proc(HRESULT)).call
  end
  def is_in_transaction : LibC::BOOL
    @lpVtbl.value.is_in_transaction.unsafe_as(Proc(LibC::BOOL)).call
  end
  def is_security_enabled : LibC::BOOL
    @lpVtbl.value.is_security_enabled.unsafe_as(Proc(LibC::BOOL)).call
  end
  def is_caller_in_role(bstrrole : UInt8*, pfisinrole : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_caller_in_role.unsafe_as(Proc(UInt8*, LibC::BOOL*, HRESULT)).call(bstrrole, pfisinrole)
  end
end
struct LibWin32::IObjectControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(HRESULT)).call
  end
  def deactivate : Void
    @lpVtbl.value.deactivate.unsafe_as(Proc(Void)).call
  end
  def can_be_pooled : LibC::BOOL
    @lpVtbl.value.can_be_pooled.unsafe_as(Proc(LibC::BOOL)).call
  end
end
struct LibWin32::IEnumNames
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def next(celt : UInt32, rgname : UInt8**, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, UInt8**, UInt32*, HRESULT)).call(celt, rgname, pceltfetched)
  end
  def skip(celt : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(celt)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppenum : IEnumNames*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumNames*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ISecurityProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_direct_creator_sid(psid : PSID*) : HRESULT
    @lpVtbl.value.get_direct_creator_sid.unsafe_as(Proc(PSID*, HRESULT)).call(psid)
  end
  def get_original_creator_sid(psid : PSID*) : HRESULT
    @lpVtbl.value.get_original_creator_sid.unsafe_as(Proc(PSID*, HRESULT)).call(psid)
  end
  def get_direct_caller_sid(psid : PSID*) : HRESULT
    @lpVtbl.value.get_direct_caller_sid.unsafe_as(Proc(PSID*, HRESULT)).call(psid)
  end
  def get_original_caller_sid(psid : PSID*) : HRESULT
    @lpVtbl.value.get_original_caller_sid.unsafe_as(Proc(PSID*, HRESULT)).call(psid)
  end
  def release_sid(psid : PSID) : HRESULT
    @lpVtbl.value.release_sid.unsafe_as(Proc(PSID, HRESULT)).call(psid)
  end
end
struct LibWin32::ObjectControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(HRESULT)).call
  end
  def deactivate : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def can_be_pooled(pbpoolable : Int16*) : HRESULT
    @lpVtbl.value.can_be_pooled.unsafe_as(Proc(Int16*, HRESULT)).call(pbpoolable)
  end
end
struct LibWin32::ISharedProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_value(pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(pval)
  end
  def put_value(val : VARIANT) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(VARIANT, HRESULT)).call(val)
  end
end
struct LibWin32::ISharedPropertyGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_property_by_position(index : Int32, fexists : Int16*, ppprop : ISharedProperty*) : HRESULT
    @lpVtbl.value.create_property_by_position.unsafe_as(Proc(Int32, Int16*, ISharedProperty*, HRESULT)).call(index, fexists, ppprop)
  end
  def get_property_by_position(index : Int32, ppproperty : ISharedProperty*) : HRESULT
    @lpVtbl.value.get_property_by_position.unsafe_as(Proc(Int32, ISharedProperty*, HRESULT)).call(index, ppproperty)
  end
  def create_property(name : UInt8*, fexists : Int16*, ppprop : ISharedProperty*) : HRESULT
    @lpVtbl.value.create_property.unsafe_as(Proc(UInt8*, Int16*, ISharedProperty*, HRESULT)).call(name, fexists, ppprop)
  end
  def get_property(name : UInt8*, ppproperty : ISharedProperty*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt8*, ISharedProperty*, HRESULT)).call(name, ppproperty)
  end
end
struct LibWin32::ISharedPropertyGroupManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_property_group(name : UInt8*, dwisomode : Int32*, dwrelmode : Int32*, fexists : Int16*, ppgroup : ISharedPropertyGroup*) : HRESULT
    @lpVtbl.value.create_property_group.unsafe_as(Proc(UInt8*, Int32*, Int32*, Int16*, ISharedPropertyGroup*, HRESULT)).call(name, dwisomode, dwrelmode, fexists, ppgroup)
  end
  def get_group(name : UInt8*, ppgroup : ISharedPropertyGroup*) : HRESULT
    @lpVtbl.value.get_group.unsafe_as(Proc(UInt8*, ISharedPropertyGroup*, HRESULT)).call(name, ppgroup)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
end
struct LibWin32::IObjectConstruct
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def construct(pctorobj : IDispatch) : HRESULT
    @lpVtbl.value.construct.unsafe_as(Proc(IDispatch, HRESULT)).call(pctorobj)
  end
end
struct LibWin32::IObjectConstructString
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_construct_string(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_construct_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
end
struct LibWin32::IObjectContextActivity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_activity_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_activity_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
end
struct LibWin32::IObjectContextInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_in_transaction : LibC::BOOL
    @lpVtbl.value.is_in_transaction.unsafe_as(Proc(LibC::BOOL)).call
  end
  def get_transaction(pptrans : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(IUnknown*, HRESULT)).call(pptrans)
  end
  def get_transaction_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_activity_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_activity_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_context_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_context_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
end
struct LibWin32::IObjectContextInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_in_transaction : LibC::BOOL
    @lpVtbl.value.is_in_transaction.unsafe_as(Proc(LibC::BOOL)).call
  end
  def get_transaction(pptrans : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.unsafe_as(Proc(IUnknown*, HRESULT)).call(pptrans)
  end
  def get_transaction_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_transaction_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_activity_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_activity_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_context_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_context_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_partition_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_partition_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_application_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_application_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_application_instance_id(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_application_instance_id.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
end
struct LibWin32::ITransactionStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_transaction_status(hrstatus : HRESULT) : HRESULT
    @lpVtbl.value.set_transaction_status.unsafe_as(Proc(HRESULT, HRESULT)).call(hrstatus)
  end
  def get_transaction_status(phrstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_transaction_status.unsafe_as(Proc(HRESULT*, HRESULT)).call(phrstatus)
  end
end
struct LibWin32::IObjectContextTip
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_tip_url(ptipurl : UInt8**) : HRESULT
    @lpVtbl.value.get_tip_url.unsafe_as(Proc(UInt8**, HRESULT)).call(ptipurl)
  end
end
struct LibWin32::IPlaybackControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def final_client_retry : HRESULT
    @lpVtbl.value.final_client_retry.unsafe_as(Proc(HRESULT)).call
  end
  def final_server_retry : HRESULT
    @lpVtbl.value.final_server_retry.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IGetContextProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def count(plcount : Int32*) : HRESULT
    @lpVtbl.value.count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_property(name : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(name, pproperty)
  end
  def enum_names(ppenum : IEnumNames*) : HRESULT
    @lpVtbl.value.enum_names.unsafe_as(Proc(IEnumNames*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IContextState
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_deactivate_on_return(bdeactivate : Int16) : HRESULT
    @lpVtbl.value.set_deactivate_on_return.unsafe_as(Proc(Int16, HRESULT)).call(bdeactivate)
  end
  def get_deactivate_on_return(pbdeactivate : Int16*) : HRESULT
    @lpVtbl.value.get_deactivate_on_return.unsafe_as(Proc(Int16*, HRESULT)).call(pbdeactivate)
  end
  def set_my_transaction_vote(txvote : TransactionVote) : HRESULT
    @lpVtbl.value.set_my_transaction_vote.unsafe_as(Proc(TransactionVote, HRESULT)).call(txvote)
  end
  def get_my_transaction_vote(ptxvote : TransactionVote*) : HRESULT
    @lpVtbl.value.get_my_transaction_vote.unsafe_as(Proc(TransactionVote*, HRESULT)).call(ptxvote)
  end
end
struct LibWin32::IPoolManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def shutdown_pool(clsidorprogid : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_pool.unsafe_as(Proc(UInt8*, HRESULT)).call(clsidorprogid)
  end
end
struct LibWin32::ISelectCOMLBServer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init : HRESULT
    @lpVtbl.value.init.unsafe_as(Proc(HRESULT)).call
  end
  def get_lb_server(punk : IUnknown) : HRESULT
    @lpVtbl.value.get_lb_server.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
end
struct LibWin32::ICOMLBArguments
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_clsid(pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_clsid.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def set_clsid(pclsid : Guid*) : HRESULT
    @lpVtbl.value.set_clsid.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def get_machine_name(cchsvr : UInt32, szservername : Char*) : HRESULT
    @lpVtbl.value.get_machine_name.unsafe_as(Proc(UInt32, Char*, HRESULT)).call(cchsvr, szservername)
  end
  def set_machine_name(cchsvr : UInt32, szservername : Char*) : HRESULT
    @lpVtbl.value.set_machine_name.unsafe_as(Proc(UInt32, Char*, HRESULT)).call(cchsvr, szservername)
  end
end
struct LibWin32::ICrmLogControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_transaction_uow(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_transaction_uow.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def register_compensator(lpcwstrprogidcompensator : LibC::LPWSTR, lpcwstrdescription : LibC::LPWSTR, lcrmregflags : Int32) : HRESULT
    @lpVtbl.value.register_compensator.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, Int32, HRESULT)).call(lpcwstrprogidcompensator, lpcwstrdescription, lcrmregflags)
  end
  def write_log_record_variants(plogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.write_log_record_variants.unsafe_as(Proc(VARIANT*, HRESULT)).call(plogrecord)
  end
  def force_log : HRESULT
    @lpVtbl.value.force_log.unsafe_as(Proc(HRESULT)).call
  end
  def forget_log_record : HRESULT
    @lpVtbl.value.forget_log_record.unsafe_as(Proc(HRESULT)).call
  end
  def force_transaction_to_abort : HRESULT
    @lpVtbl.value.force_transaction_to_abort.unsafe_as(Proc(HRESULT)).call
  end
  def write_log_record(rgblob : BLOB*, cblob : UInt32) : HRESULT
    @lpVtbl.value.write_log_record.unsafe_as(Proc(BLOB*, UInt32, HRESULT)).call(rgblob, cblob)
  end
end
struct LibWin32::ICrmCompensatorVariants
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_log_control_variants(plogcontrol : ICrmLogControl) : HRESULT
    @lpVtbl.value.set_log_control_variants.unsafe_as(Proc(ICrmLogControl, HRESULT)).call(plogcontrol)
  end
  def begin_prepare_variants : HRESULT
    @lpVtbl.value.begin_prepare_variants.unsafe_as(Proc(HRESULT)).call
  end
  def prepare_record_variants(plogrecord : VARIANT*, pbforget : Int16*) : HRESULT
    @lpVtbl.value.prepare_record_variants.unsafe_as(Proc(VARIANT*, Int16*, HRESULT)).call(plogrecord, pbforget)
  end
  def end_prepare_variants(pboktoprepare : Int16*) : HRESULT
    @lpVtbl.value.end_prepare_variants.unsafe_as(Proc(Int16*, HRESULT)).call(pboktoprepare)
  end
  def begin_commit_variants(brecovery : Int16) : HRESULT
    @lpVtbl.value.begin_commit_variants.unsafe_as(Proc(Int16, HRESULT)).call(brecovery)
  end
  def commit_record_variants(plogrecord : VARIANT*, pbforget : Int16*) : HRESULT
    @lpVtbl.value.commit_record_variants.unsafe_as(Proc(VARIANT*, Int16*, HRESULT)).call(plogrecord, pbforget)
  end
  def end_commit_variants : HRESULT
    @lpVtbl.value.end_commit_variants.unsafe_as(Proc(HRESULT)).call
  end
  def begin_abort_variants(brecovery : Int16) : HRESULT
    @lpVtbl.value.begin_abort_variants.unsafe_as(Proc(Int16, HRESULT)).call(brecovery)
  end
  def abort_record_variants(plogrecord : VARIANT*, pbforget : Int16*) : HRESULT
    @lpVtbl.value.abort_record_variants.unsafe_as(Proc(VARIANT*, Int16*, HRESULT)).call(plogrecord, pbforget)
  end
  def end_abort_variants : HRESULT
    @lpVtbl.value.end_abort_variants.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ICrmCompensator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_log_control(plogcontrol : ICrmLogControl) : HRESULT
    @lpVtbl.value.set_log_control.unsafe_as(Proc(ICrmLogControl, HRESULT)).call(plogcontrol)
  end
  def begin_prepare : HRESULT
    @lpVtbl.value.begin_prepare.unsafe_as(Proc(HRESULT)).call
  end
  def prepare_record(crmlogrec : CrmLogRecordRead, pfforget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.prepare_record.unsafe_as(Proc(CrmLogRecordRead, LibC::BOOL*, HRESULT)).call(crmlogrec, pfforget)
  end
  def end_prepare(pfoktoprepare : LibC::BOOL*) : HRESULT
    @lpVtbl.value.end_prepare.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfoktoprepare)
  end
  def begin_commit(frecovery : LibC::BOOL) : HRESULT
    @lpVtbl.value.begin_commit.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(frecovery)
  end
  def commit_record(crmlogrec : CrmLogRecordRead, pfforget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.commit_record.unsafe_as(Proc(CrmLogRecordRead, LibC::BOOL*, HRESULT)).call(crmlogrec, pfforget)
  end
  def end_commit : HRESULT
    @lpVtbl.value.end_commit.unsafe_as(Proc(HRESULT)).call
  end
  def begin_abort(frecovery : LibC::BOOL) : HRESULT
    @lpVtbl.value.begin_abort.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(frecovery)
  end
  def abort_record(crmlogrec : CrmLogRecordRead, pfforget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.abort_record.unsafe_as(Proc(CrmLogRecordRead, LibC::BOOL*, HRESULT)).call(crmlogrec, pfforget)
  end
  def end_abort : HRESULT
    @lpVtbl.value.end_abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ICrmMonitorLogRecords
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def get_transaction_state(pval : CrmTransactionState*) : HRESULT
    @lpVtbl.value.get_transaction_state.unsafe_as(Proc(CrmTransactionState*, HRESULT)).call(pval)
  end
  def get_structured_records(pval : Int16*) : HRESULT
    @lpVtbl.value.get_structured_records.unsafe_as(Proc(Int16*, HRESULT)).call(pval)
  end
  def get_log_record(dwindex : UInt32, pcrmlogrec : CrmLogRecordRead*) : HRESULT
    @lpVtbl.value.get_log_record.unsafe_as(Proc(UInt32, CrmLogRecordRead*, HRESULT)).call(dwindex, pcrmlogrec)
  end
  def get_log_record_variants(indexnumber : VARIANT, plogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.get_log_record_variants.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(indexnumber, plogrecord)
  end
end
struct LibWin32::ICrmMonitorClerks
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.item.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(index, pitem)
  end
  def get__new_enum(pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(pval)
  end
  def get_count(pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(pval)
  end
  def prog_id_compensator(index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.prog_id_compensator.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(index, pitem)
  end
  def description(index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.description.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(index, pitem)
  end
  def transaction_uow(index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.transaction_uow.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(index, pitem)
  end
  def activity_id(index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.activity_id.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(index, pitem)
  end
end
struct LibWin32::ICrmMonitor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_clerks(pclerks : ICrmMonitorClerks*) : HRESULT
    @lpVtbl.value.get_clerks.unsafe_as(Proc(ICrmMonitorClerks*, HRESULT)).call(pclerks)
  end
  def hold_clerk(index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.hold_clerk.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(index, pitem)
  end
end
struct LibWin32::ICrmFormatLogRecords
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_column_count(plcolumncount : Int32*) : HRESULT
    @lpVtbl.value.get_column_count.unsafe_as(Proc(Int32*, HRESULT)).call(plcolumncount)
  end
  def get_column_headers(pheaders : VARIANT*) : HRESULT
    @lpVtbl.value.get_column_headers.unsafe_as(Proc(VARIANT*, HRESULT)).call(pheaders)
  end
  def get_column(crmlogrec : CrmLogRecordRead, pformattedlogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.get_column.unsafe_as(Proc(CrmLogRecordRead, VARIANT*, HRESULT)).call(crmlogrec, pformattedlogrecord)
  end
  def get_column_variants(logrecord : VARIANT, pformattedlogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.get_column_variants.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(logrecord, pformattedlogrecord)
  end
end
struct LibWin32::IServiceIISIntrinsicsConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def iis_intrinsics_config(iisintrinsicsconfig : CSC_IISIntrinsicsConfig) : HRESULT
    @lpVtbl.value.iis_intrinsics_config.unsafe_as(Proc(CSC_IISIntrinsicsConfig, HRESULT)).call(iisintrinsicsconfig)
  end
end
struct LibWin32::IServiceComTIIntrinsicsConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def com_ti_intrinsics_config(comtiintrinsicsconfig : CSC_COMTIIntrinsicsConfig) : HRESULT
    @lpVtbl.value.com_ti_intrinsics_config.unsafe_as(Proc(CSC_COMTIIntrinsicsConfig, HRESULT)).call(comtiintrinsicsconfig)
  end
end
struct LibWin32::IServiceSxsConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def sxs_config(scsconfig : CSC_SxsConfig) : HRESULT
    @lpVtbl.value.sxs_config.unsafe_as(Proc(CSC_SxsConfig, HRESULT)).call(scsconfig)
  end
  def sxs_name(szsxsname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.sxs_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(szsxsname)
  end
  def sxs_directory(szsxsdirectory : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.sxs_directory.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(szsxsdirectory)
  end
end
struct LibWin32::ICheckSxsConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_same_sxs_config(wszsxsname : LibC::LPWSTR, wszsxsdirectory : LibC::LPWSTR, wszsxsappname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.is_same_sxs_config.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(wszsxsname, wszsxsdirectory, wszsxsappname)
  end
end
struct LibWin32::IServiceInheritanceConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def containing_context_treatment(inheritanceconfig : CSC_InheritanceConfig) : HRESULT
    @lpVtbl.value.containing_context_treatment.unsafe_as(Proc(CSC_InheritanceConfig, HRESULT)).call(inheritanceconfig)
  end
end
struct LibWin32::IServiceThreadPoolConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def select_thread_pool(threadpool : CSC_ThreadPool) : HRESULT
    @lpVtbl.value.select_thread_pool.unsafe_as(Proc(CSC_ThreadPool, HRESULT)).call(threadpool)
  end
  def set_binding_info(binding : CSC_Binding) : HRESULT
    @lpVtbl.value.set_binding_info.unsafe_as(Proc(CSC_Binding, HRESULT)).call(binding)
  end
end
struct LibWin32::IServiceTransactionConfigBase
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def configure_transaction(transactionconfig : CSC_TransactionConfig) : HRESULT
    @lpVtbl.value.configure_transaction.unsafe_as(Proc(CSC_TransactionConfig, HRESULT)).call(transactionconfig)
  end
  def isolation_level(option : COMAdminTxIsolationLevelOptions) : HRESULT
    @lpVtbl.value.isolation_level.unsafe_as(Proc(COMAdminTxIsolationLevelOptions, HRESULT)).call(option)
  end
  def transaction_timeout(ultimeoutsec : UInt32) : HRESULT
    @lpVtbl.value.transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(ultimeoutsec)
  end
  def bring_your_own_transaction(sztipurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.bring_your_own_transaction.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(sztipurl)
  end
  def new_transaction_description(sztxdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.new_transaction_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(sztxdesc)
  end
end
struct LibWin32::IServiceTransactionConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def configure_transaction(transactionconfig : CSC_TransactionConfig) : HRESULT
    @lpVtbl.value.configure_transaction.unsafe_as(Proc(CSC_TransactionConfig, HRESULT)).call(transactionconfig)
  end
  def isolation_level(option : COMAdminTxIsolationLevelOptions) : HRESULT
    @lpVtbl.value.isolation_level.unsafe_as(Proc(COMAdminTxIsolationLevelOptions, HRESULT)).call(option)
  end
  def transaction_timeout(ultimeoutsec : UInt32) : HRESULT
    @lpVtbl.value.transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(ultimeoutsec)
  end
  def bring_your_own_transaction(sztipurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.bring_your_own_transaction.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(sztipurl)
  end
  def new_transaction_description(sztxdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.new_transaction_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(sztxdesc)
  end
  def configure_byot(pitxbyot : ITransaction) : HRESULT
    @lpVtbl.value.configure_byot.unsafe_as(Proc(ITransaction, HRESULT)).call(pitxbyot)
  end
end
struct LibWin32::IServiceSysTxnConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def configure_transaction(transactionconfig : CSC_TransactionConfig) : HRESULT
    @lpVtbl.value.configure_transaction.unsafe_as(Proc(CSC_TransactionConfig, HRESULT)).call(transactionconfig)
  end
  def isolation_level(option : COMAdminTxIsolationLevelOptions) : HRESULT
    @lpVtbl.value.isolation_level.unsafe_as(Proc(COMAdminTxIsolationLevelOptions, HRESULT)).call(option)
  end
  def transaction_timeout(ultimeoutsec : UInt32) : HRESULT
    @lpVtbl.value.transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(ultimeoutsec)
  end
  def bring_your_own_transaction(sztipurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.bring_your_own_transaction.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(sztipurl)
  end
  def new_transaction_description(sztxdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.new_transaction_description.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(sztxdesc)
  end
  def configure_byot(pitxbyot : ITransaction) : HRESULT
    @lpVtbl.value.configure_byot.unsafe_as(Proc(ITransaction, HRESULT)).call(pitxbyot)
  end
  def configure_byot_sys_txn(ptxproxy : ITransactionProxy) : HRESULT
    @lpVtbl.value.configure_byot_sys_txn.unsafe_as(Proc(ITransactionProxy, HRESULT)).call(ptxproxy)
  end
end
struct LibWin32::IServiceSynchronizationConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def configure_synchronization(synchconfig : CSC_SynchronizationConfig) : HRESULT
    @lpVtbl.value.configure_synchronization.unsafe_as(Proc(CSC_SynchronizationConfig, HRESULT)).call(synchconfig)
  end
end
struct LibWin32::IServiceTrackerConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def tracker_config(trackerconfig : CSC_TrackerConfig, sztrackerappname : LibC::LPWSTR, sztrackerctxname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.tracker_config.unsafe_as(Proc(CSC_TrackerConfig, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(trackerconfig, sztrackerappname, sztrackerctxname)
  end
end
struct LibWin32::IServicePartitionConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def partition_config(partitionconfig : CSC_PartitionConfig) : HRESULT
    @lpVtbl.value.partition_config.unsafe_as(Proc(CSC_PartitionConfig, HRESULT)).call(partitionconfig)
  end
  def partition_id(guidpartitionid : Guid*) : HRESULT
    @lpVtbl.value.partition_id.unsafe_as(Proc(Guid*, HRESULT)).call(guidpartitionid)
  end
end
struct LibWin32::IServiceCall
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_call : HRESULT
    @lpVtbl.value.on_call.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAsyncErrorNotify
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_error(hr : HRESULT) : HRESULT
    @lpVtbl.value.on_error.unsafe_as(Proc(HRESULT, HRESULT)).call(hr)
  end
end
struct LibWin32::IServiceActivity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def synchronous_call(piservicecall : IServiceCall) : HRESULT
    @lpVtbl.value.synchronous_call.unsafe_as(Proc(IServiceCall, HRESULT)).call(piservicecall)
  end
  def asynchronous_call(piservicecall : IServiceCall) : HRESULT
    @lpVtbl.value.asynchronous_call.unsafe_as(Proc(IServiceCall, HRESULT)).call(piservicecall)
  end
  def bind_to_current_thread : HRESULT
    @lpVtbl.value.bind_to_current_thread.unsafe_as(Proc(HRESULT)).call
  end
  def unbind_from_thread : HRESULT
    @lpVtbl.value.unbind_from_thread.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IThreadPoolKnobs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_max_threads(plcmaxthreads : Int32*) : HRESULT
    @lpVtbl.value.get_max_threads.unsafe_as(Proc(Int32*, HRESULT)).call(plcmaxthreads)
  end
  def get_current_threads(plccurrentthreads : Int32*) : HRESULT
    @lpVtbl.value.get_current_threads.unsafe_as(Proc(Int32*, HRESULT)).call(plccurrentthreads)
  end
  def set_max_threads(lcmaxthreads : Int32) : HRESULT
    @lpVtbl.value.set_max_threads.unsafe_as(Proc(Int32, HRESULT)).call(lcmaxthreads)
  end
  def get_delete_delay(pmsecdeletedelay : Int32*) : HRESULT
    @lpVtbl.value.get_delete_delay.unsafe_as(Proc(Int32*, HRESULT)).call(pmsecdeletedelay)
  end
  def set_delete_delay(msecdeletedelay : Int32) : HRESULT
    @lpVtbl.value.set_delete_delay.unsafe_as(Proc(Int32, HRESULT)).call(msecdeletedelay)
  end
  def get_max_queued_requests(plcmaxqueuedrequests : Int32*) : HRESULT
    @lpVtbl.value.get_max_queued_requests.unsafe_as(Proc(Int32*, HRESULT)).call(plcmaxqueuedrequests)
  end
  def get_current_queued_requests(plccurrentqueuedrequests : Int32*) : HRESULT
    @lpVtbl.value.get_current_queued_requests.unsafe_as(Proc(Int32*, HRESULT)).call(plccurrentqueuedrequests)
  end
  def set_max_queued_requests(lcmaxqueuedrequests : Int32) : HRESULT
    @lpVtbl.value.set_max_queued_requests.unsafe_as(Proc(Int32, HRESULT)).call(lcmaxqueuedrequests)
  end
  def set_min_threads(lcminthreads : Int32) : HRESULT
    @lpVtbl.value.set_min_threads.unsafe_as(Proc(Int32, HRESULT)).call(lcminthreads)
  end
  def set_queue_depth(lcqueuedepth : Int32) : HRESULT
    @lpVtbl.value.set_queue_depth.unsafe_as(Proc(Int32, HRESULT)).call(lcqueuedepth)
  end
end
struct LibWin32::IComStaThreadPoolKnobs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_min_thread_count(minthreads : UInt32) : HRESULT
    @lpVtbl.value.set_min_thread_count.unsafe_as(Proc(UInt32, HRESULT)).call(minthreads)
  end
  def get_min_thread_count(minthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_min_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(minthreads)
  end
  def set_max_thread_count(maxthreads : UInt32) : HRESULT
    @lpVtbl.value.set_max_thread_count.unsafe_as(Proc(UInt32, HRESULT)).call(maxthreads)
  end
  def get_max_thread_count(maxthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_max_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(maxthreads)
  end
  def set_activity_per_thread(activitiesperthread : UInt32) : HRESULT
    @lpVtbl.value.set_activity_per_thread.unsafe_as(Proc(UInt32, HRESULT)).call(activitiesperthread)
  end
  def get_activity_per_thread(activitiesperthread : UInt32*) : HRESULT
    @lpVtbl.value.get_activity_per_thread.unsafe_as(Proc(UInt32*, HRESULT)).call(activitiesperthread)
  end
  def set_activity_ratio(activityratio : Float64) : HRESULT
    @lpVtbl.value.set_activity_ratio.unsafe_as(Proc(Float64, HRESULT)).call(activityratio)
  end
  def get_activity_ratio(activityratio : Float64*) : HRESULT
    @lpVtbl.value.get_activity_ratio.unsafe_as(Proc(Float64*, HRESULT)).call(activityratio)
  end
  def get_thread_count(pdwthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwthreads)
  end
  def get_queue_depth(pdwqdepth : UInt32*) : HRESULT
    @lpVtbl.value.get_queue_depth.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwqdepth)
  end
  def set_queue_depth(dwqdepth : Int32) : HRESULT
    @lpVtbl.value.set_queue_depth.unsafe_as(Proc(Int32, HRESULT)).call(dwqdepth)
  end
end
struct LibWin32::IComMtaThreadPoolKnobs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def mta_set_max_thread_count(dwmaxthreads : UInt32) : HRESULT
    @lpVtbl.value.mta_set_max_thread_count.unsafe_as(Proc(UInt32, HRESULT)).call(dwmaxthreads)
  end
  def mta_get_max_thread_count(pdwmaxthreads : UInt32*) : HRESULT
    @lpVtbl.value.mta_get_max_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxthreads)
  end
  def mta_set_throttle_value(dwthrottle : UInt32) : HRESULT
    @lpVtbl.value.mta_set_throttle_value.unsafe_as(Proc(UInt32, HRESULT)).call(dwthrottle)
  end
  def mta_get_throttle_value(pdwthrottle : UInt32*) : HRESULT
    @lpVtbl.value.mta_get_throttle_value.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwthrottle)
  end
end
struct LibWin32::IComStaThreadPoolKnobs2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_min_thread_count(minthreads : UInt32) : HRESULT
    @lpVtbl.value.set_min_thread_count.unsafe_as(Proc(UInt32, HRESULT)).call(minthreads)
  end
  def get_min_thread_count(minthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_min_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(minthreads)
  end
  def set_max_thread_count(maxthreads : UInt32) : HRESULT
    @lpVtbl.value.set_max_thread_count.unsafe_as(Proc(UInt32, HRESULT)).call(maxthreads)
  end
  def get_max_thread_count(maxthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_max_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(maxthreads)
  end
  def set_activity_per_thread(activitiesperthread : UInt32) : HRESULT
    @lpVtbl.value.set_activity_per_thread.unsafe_as(Proc(UInt32, HRESULT)).call(activitiesperthread)
  end
  def get_activity_per_thread(activitiesperthread : UInt32*) : HRESULT
    @lpVtbl.value.get_activity_per_thread.unsafe_as(Proc(UInt32*, HRESULT)).call(activitiesperthread)
  end
  def set_activity_ratio(activityratio : Float64) : HRESULT
    @lpVtbl.value.set_activity_ratio.unsafe_as(Proc(Float64, HRESULT)).call(activityratio)
  end
  def get_activity_ratio(activityratio : Float64*) : HRESULT
    @lpVtbl.value.get_activity_ratio.unsafe_as(Proc(Float64*, HRESULT)).call(activityratio)
  end
  def get_thread_count(pdwthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_thread_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwthreads)
  end
  def get_queue_depth(pdwqdepth : UInt32*) : HRESULT
    @lpVtbl.value.get_queue_depth.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwqdepth)
  end
  def set_queue_depth(dwqdepth : Int32) : HRESULT
    @lpVtbl.value.set_queue_depth.unsafe_as(Proc(Int32, HRESULT)).call(dwqdepth)
  end
  def get_max_cpu_load(pdwload : UInt32*) : HRESULT
    @lpVtbl.value.get_max_cpu_load.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwload)
  end
  def set_max_cpu_load(pdwload : Int32) : HRESULT
    @lpVtbl.value.set_max_cpu_load.unsafe_as(Proc(Int32, HRESULT)).call(pdwload)
  end
  def get_cpu_metric_enabled(pbmetricenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cpu_metric_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmetricenabled)
  end
  def set_cpu_metric_enabled(bmetricenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_cpu_metric_enabled.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bmetricenabled)
  end
  def get_create_threads_aggressively(pbmetricenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_create_threads_aggressively.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbmetricenabled)
  end
  def set_create_threads_aggressively(bmetricenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_create_threads_aggressively.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bmetricenabled)
  end
  def get_max_csr(pdwcsr : UInt32*) : HRESULT
    @lpVtbl.value.get_max_csr.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcsr)
  end
  def set_max_csr(dwcsr : Int32) : HRESULT
    @lpVtbl.value.set_max_csr.unsafe_as(Proc(Int32, HRESULT)).call(dwcsr)
  end
  def get_wait_time_for_thread_cleanup(pdwthreadcleanupwaittime : UInt32*) : HRESULT
    @lpVtbl.value.get_wait_time_for_thread_cleanup.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwthreadcleanupwaittime)
  end
  def set_wait_time_for_thread_cleanup(dwthreadcleanupwaittime : Int32) : HRESULT
    @lpVtbl.value.set_wait_time_for_thread_cleanup.unsafe_as(Proc(Int32, HRESULT)).call(dwthreadcleanupwaittime)
  end
end
struct LibWin32::IProcessInitializer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def startup(punkprocesscontrol : IUnknown) : HRESULT
    @lpVtbl.value.startup.unsafe_as(Proc(IUnknown, HRESULT)).call(punkprocesscontrol)
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IServicePoolConfig
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def put_max_pool_size(dwmaxpool : UInt32) : HRESULT
    @lpVtbl.value.put_max_pool_size.unsafe_as(Proc(UInt32, HRESULT)).call(dwmaxpool)
  end
  def get_max_pool_size(pdwmaxpool : UInt32*) : HRESULT
    @lpVtbl.value.get_max_pool_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwmaxpool)
  end
  def put_min_pool_size(dwminpool : UInt32) : HRESULT
    @lpVtbl.value.put_min_pool_size.unsafe_as(Proc(UInt32, HRESULT)).call(dwminpool)
  end
  def get_min_pool_size(pdwminpool : UInt32*) : HRESULT
    @lpVtbl.value.get_min_pool_size.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwminpool)
  end
  def put_creation_timeout(dwcreationtimeout : UInt32) : HRESULT
    @lpVtbl.value.put_creation_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(dwcreationtimeout)
  end
  def get_creation_timeout(pdwcreationtimeout : UInt32*) : HRESULT
    @lpVtbl.value.get_creation_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwcreationtimeout)
  end
  def put_transaction_affinity(ftxaffinity : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_transaction_affinity.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(ftxaffinity)
  end
  def get_transaction_affinity(pftxaffinity : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_transaction_affinity.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pftxaffinity)
  end
  def put_class_factory(pfactory : IClassFactory) : HRESULT
    @lpVtbl.value.put_class_factory.unsafe_as(Proc(IClassFactory, HRESULT)).call(pfactory)
  end
  def get_class_factory(pfactory : IClassFactory*) : HRESULT
    @lpVtbl.value.get_class_factory.unsafe_as(Proc(IClassFactory*, HRESULT)).call(pfactory)
  end
end
struct LibWin32::IServicePool
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(ppoolconfig : IUnknown) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, HRESULT)).call(ppoolconfig)
  end
  def get_object(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_object.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
  def shutdown : HRESULT
    @lpVtbl.value.shutdown.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IManagedPooledObj
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_held(m_bheld : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_held.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(m_bheld)
  end
end
struct LibWin32::IManagedPoolAction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def last_release : HRESULT
    @lpVtbl.value.last_release.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IManagedObjectInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_i_unknown(punk : IUnknown*) : HRESULT
    @lpVtbl.value.get_i_unknown.unsafe_as(Proc(IUnknown*, HRESULT)).call(punk)
  end
  def get_i_object_control(pctrl : IObjectControl*) : HRESULT
    @lpVtbl.value.get_i_object_control.unsafe_as(Proc(IObjectControl*, HRESULT)).call(pctrl)
  end
  def set_in_pool(binpool : LibC::BOOL, ppooledobj : IManagedPooledObj) : HRESULT
    @lpVtbl.value.set_in_pool.unsafe_as(Proc(LibC::BOOL, IManagedPooledObj, HRESULT)).call(binpool, ppooledobj)
  end
  def set_wrapper_strength(bstrong : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_wrapper_strength.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bstrong)
  end
end
struct LibWin32::IAppDomainHelper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def initialize(punkad : IUnknown, midl__iappdomainhelper0000 : LibC::IntPtrT, ppool : Void*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(IUnknown, LibC::IntPtrT, Void*, HRESULT)).call(punkad, midl__iappdomainhelper0000, ppool)
  end
  def do_callback(punkad : IUnknown, midl__iappdomainhelper0001 : LibC::IntPtrT, ppool : Void*) : HRESULT
    @lpVtbl.value.do_callback.unsafe_as(Proc(IUnknown, LibC::IntPtrT, Void*, HRESULT)).call(punkad, midl__iappdomainhelper0001, ppool)
  end
end
struct LibWin32::IAssemblyLocator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_modules(applicationdir : UInt8*, applicationname : UInt8*, assemblyname : UInt8*, pmodules : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_modules.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, SAFEARRAY**, HRESULT)).call(applicationdir, applicationname, assemblyname, pmodules)
  end
end
struct LibWin32::IManagedActivationEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_managed_stub(pinfo : IManagedObjectInfo, fdist : LibC::BOOL) : HRESULT
    @lpVtbl.value.create_managed_stub.unsafe_as(Proc(IManagedObjectInfo, LibC::BOOL, HRESULT)).call(pinfo, fdist)
  end
  def destroy_managed_stub(pinfo : IManagedObjectInfo) : HRESULT
    @lpVtbl.value.destroy_managed_stub.unsafe_as(Proc(IManagedObjectInfo, HRESULT)).call(pinfo)
  end
end
struct LibWin32::ISendMethodEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def send_method_call(pidentity : Void*, riid : Guid*, dwmeth : UInt32) : HRESULT
    @lpVtbl.value.send_method_call.unsafe_as(Proc(Void*, Guid*, UInt32, HRESULT)).call(pidentity, riid, dwmeth)
  end
  def send_method_return(pidentity : Void*, riid : Guid*, dwmeth : UInt32, hrcall : HRESULT, hrserver : HRESULT) : HRESULT
    @lpVtbl.value.send_method_return.unsafe_as(Proc(Void*, Guid*, UInt32, HRESULT, HRESULT, HRESULT)).call(pidentity, riid, dwmeth, hrcall, hrserver)
  end
end
struct LibWin32::ITransactionResourcePool
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def put_resource(ppool : IObjPool, punk : IUnknown) : HRESULT
    @lpVtbl.value.put_resource.unsafe_as(Proc(IObjPool, IUnknown, HRESULT)).call(ppool, punk)
  end
  def get_resource(ppool : IObjPool, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_resource.unsafe_as(Proc(IObjPool, IUnknown*, HRESULT)).call(ppool, ppunk)
  end
end
struct LibWin32::IMTSCall
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_call : HRESULT
    @lpVtbl.value.on_call.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IContextProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def count(plcount : Int32*) : HRESULT
    @lpVtbl.value.count.unsafe_as(Proc(Int32*, HRESULT)).call(plcount)
  end
  def get_property(name : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt8*, VARIANT*, HRESULT)).call(name, pproperty)
  end
  def enum_names(ppenum : IEnumNames*) : HRESULT
    @lpVtbl.value.enum_names.unsafe_as(Proc(IEnumNames*, HRESULT)).call(ppenum)
  end
  def set_property(name : UInt8*, property : VARIANT) : HRESULT
    @lpVtbl.value.set_property.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(name, property)
  end
  def remove_property(name : UInt8*) : HRESULT
    @lpVtbl.value.remove_property.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
end
struct LibWin32::IObjPool
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reserved1 : Void
    @lpVtbl.value.reserved1.unsafe_as(Proc(Void)).call
  end
  def reserved2 : Void
    @lpVtbl.value.reserved2.unsafe_as(Proc(Void)).call
  end
  def reserved3 : Void
    @lpVtbl.value.reserved3.unsafe_as(Proc(Void)).call
  end
  def reserved4 : Void
    @lpVtbl.value.reserved4.unsafe_as(Proc(Void)).call
  end
  def put_end_tx(pobj : IUnknown) : Void
    @lpVtbl.value.put_end_tx.unsafe_as(Proc(IUnknown, Void)).call(pobj)
  end
  def reserved5 : Void
    @lpVtbl.value.reserved5.unsafe_as(Proc(Void)).call
  end
  def reserved6 : Void
    @lpVtbl.value.reserved6.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::ITransactionProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reserved1 : Void
    @lpVtbl.value.reserved1.unsafe_as(Proc(Void)).call
  end
  def reserved2 : Void
    @lpVtbl.value.reserved2.unsafe_as(Proc(Void)).call
  end
  def reserved3 : Void
    @lpVtbl.value.reserved3.unsafe_as(Proc(Void)).call
  end
  def reserved4 : Void
    @lpVtbl.value.reserved4.unsafe_as(Proc(Void)).call
  end
  def reserved5 : Void
    @lpVtbl.value.reserved5.unsafe_as(Proc(Void)).call
  end
  def reserved6 : Void
    @lpVtbl.value.reserved6.unsafe_as(Proc(Void)).call
  end
  def reserved7 : Void
    @lpVtbl.value.reserved7.unsafe_as(Proc(Void)).call
  end
  def reserved8 : Void
    @lpVtbl.value.reserved8.unsafe_as(Proc(Void)).call
  end
  def reserved9 : Void
    @lpVtbl.value.reserved9.unsafe_as(Proc(Void)).call
  end
  def get_transaction_resource_pool(pptxpool : ITransactionResourcePool*) : HRESULT
    @lpVtbl.value.get_transaction_resource_pool.unsafe_as(Proc(ITransactionResourcePool*, HRESULT)).call(pptxpool)
  end
  def reserved10 : Void
    @lpVtbl.value.reserved10.unsafe_as(Proc(Void)).call
  end
  def reserved11 : Void
    @lpVtbl.value.reserved11.unsafe_as(Proc(Void)).call
  end
  def reserved12 : Void
    @lpVtbl.value.reserved12.unsafe_as(Proc(Void)).call
  end
  def reserved13 : Void
    @lpVtbl.value.reserved13.unsafe_as(Proc(Void)).call
  end
  def reserved14 : Void
    @lpVtbl.value.reserved14.unsafe_as(Proc(Void)).call
  end
  def reserved15 : Void
    @lpVtbl.value.reserved15.unsafe_as(Proc(Void)).call
  end
  def reserved16 : Void
    @lpVtbl.value.reserved16.unsafe_as(Proc(Void)).call
  end
  def reserved17 : Void
    @lpVtbl.value.reserved17.unsafe_as(Proc(Void)).call
  end
end
struct LibWin32::IMTSActivity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def synchronous_call(pcall : IMTSCall) : HRESULT
    @lpVtbl.value.synchronous_call.unsafe_as(Proc(IMTSCall, HRESULT)).call(pcall)
  end
  def async_call(pcall : IMTSCall) : HRESULT
    @lpVtbl.value.async_call.unsafe_as(Proc(IMTSCall, HRESULT)).call(pcall)
  end
  def reserved1 : Void
    @lpVtbl.value.reserved1.unsafe_as(Proc(Void)).call
  end
  def bind_to_current_thread : HRESULT
    @lpVtbl.value.bind_to_current_thread.unsafe_as(Proc(HRESULT)).call
  end
  def unbind_from_thread : HRESULT
    @lpVtbl.value.unbind_from_thread.unsafe_as(Proc(HRESULT)).call
  end
end
