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

  ICOMAdminCatalog_GUID = "dd662187-dfc2-11d1-a2cf-00805fc79235"
  IID_ICOMAdminCatalog = LibC::GUID.new(0xdd662187_u32, 0xdfc2_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
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

  ICOMAdminCatalog2_GUID = "790c6e0b-9194-4cc9-9426-a48a63185696"
  IID_ICOMAdminCatalog2 = LibC::GUID.new(0x790c6e0b_u32, 0x9194_u16, 0x4cc9_u16, StaticArray[0x94_u8, 0x26_u8, 0xa4_u8, 0x8a_u8, 0x63_u8, 0x18_u8, 0x56_u8, 0x96_u8])
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

  ICatalogObject_GUID = "6eb22871-8a19-11d0-81b6-00a0c9231c29"
  IID_ICatalogObject = LibC::GUID.new(0x6eb22871_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
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

  ICatalogCollection_GUID = "6eb22872-8a19-11d0-81b6-00a0c9231c29"
  IID_ICatalogCollection = LibC::GUID.new(0x6eb22872_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
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

  ISecurityIdentityColl_GUID = "cafc823c-b441-11d1-b82b-0000f8757e2a"
  IID_ISecurityIdentityColl = LibC::GUID.new(0xcafc823c_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
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

  ISecurityCallersColl_GUID = "cafc823d-b441-11d1-b82b-0000f8757e2a"
  IID_ISecurityCallersColl = LibC::GUID.new(0xcafc823d_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
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

  ISecurityCallContext_GUID = "cafc823e-b441-11d1-b82b-0000f8757e2a"
  IID_ISecurityCallContext = LibC::GUID.new(0xcafc823e_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
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

  IGetSecurityCallContext_GUID = "cafc823f-b441-11d1-b82b-0000f8757e2a"
  IID_IGetSecurityCallContext = LibC::GUID.new(0xcafc823f_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
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

  SecurityProperty_GUID = "e74a7215-014d-11d1-a63c-00a0c911b4e0"
  IID_SecurityProperty = LibC::GUID.new(0xe74a7215_u32, 0x14d_u16, 0x11d1_u16, StaticArray[0xa6_u8, 0x3c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x11_u8, 0xb4_u8, 0xe0_u8])
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

  ContextInfo_GUID = "19a5a02c-0ac8-11d2-b286-00c04f8ef934"
  IID_ContextInfo = LibC::GUID.new(0x19a5a02c_u32, 0xac8_u16, 0x11d2_u16, StaticArray[0xb2_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0x34_u8])
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

  ContextInfo2_GUID = "c99d6e75-2375-11d4-8331-00c04f605588"
  IID_ContextInfo2 = LibC::GUID.new(0xc99d6e75_u32, 0x2375_u16, 0x11d4_u16, StaticArray[0x83_u8, 0x31_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x60_u8, 0x55_u8, 0x88_u8])
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

  ObjectContext_GUID = "74c08646-cedb-11cf-8b49-00aa00b8a790"
  IID_ObjectContext = LibC::GUID.new(0x74c08646_u32, 0xcedb_u16, 0x11cf_u16, StaticArray[0x8b_u8, 0x49_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xa7_u8, 0x90_u8])
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

  ITransactionContextEx_GUID = "7999fc22-d3c6-11cf-acab-00a024a55aef"
  IID_ITransactionContextEx = LibC::GUID.new(0x7999fc22_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
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

  ITransactionContext_GUID = "7999fc21-d3c6-11cf-acab-00a024a55aef"
  IID_ITransactionContext = LibC::GUID.new(0x7999fc21_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
  struct ITransactionContext
    lpVtbl : ITransactionContextVTbl*
  end

  struct ICreateWithTransactionExVTbl
    query_interface : Proc(ICreateWithTransactionEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateWithTransactionEx*, UInt32)
    release : Proc(ICreateWithTransactionEx*, UInt32)
    create_instance : Proc(ICreateWithTransactionEx*, ITransaction, Guid*, Guid*, Void**, HRESULT)
  end

  ICreateWithTransactionEx_GUID = "455acf57-5345-11d2-99cf-00c04f797bc9"
  IID_ICreateWithTransactionEx = LibC::GUID.new(0x455acf57_u32, 0x5345_u16, 0x11d2_u16, StaticArray[0x99_u8, 0xcf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
  struct ICreateWithTransactionEx
    lpVtbl : ICreateWithTransactionExVTbl*
  end

  struct ICreateWithLocalTransactionVTbl
    query_interface : Proc(ICreateWithLocalTransaction*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateWithLocalTransaction*, UInt32)
    release : Proc(ICreateWithLocalTransaction*, UInt32)
    create_instance_with_sys_tx : Proc(ICreateWithLocalTransaction*, IUnknown, Guid*, Guid*, Void**, HRESULT)
  end

  ICreateWithLocalTransaction_GUID = "227ac7a8-8423-42ce-b7cf-03061ec9aaa3"
  IID_ICreateWithLocalTransaction = LibC::GUID.new(0x227ac7a8_u32, 0x8423_u16, 0x42ce_u16, StaticArray[0xb7_u8, 0xcf_u8, 0x3_u8, 0x6_u8, 0x1e_u8, 0xc9_u8, 0xaa_u8, 0xa3_u8])
  struct ICreateWithLocalTransaction
    lpVtbl : ICreateWithLocalTransactionVTbl*
  end

  struct ICreateWithTipTransactionExVTbl
    query_interface : Proc(ICreateWithTipTransactionEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICreateWithTipTransactionEx*, UInt32)
    release : Proc(ICreateWithTipTransactionEx*, UInt32)
    create_instance : Proc(ICreateWithTipTransactionEx*, UInt8*, Guid*, Guid*, Void**, HRESULT)
  end

  ICreateWithTipTransactionEx_GUID = "455acf59-5345-11d2-99cf-00c04f797bc9"
  IID_ICreateWithTipTransactionEx = LibC::GUID.new(0x455acf59_u32, 0x5345_u16, 0x11d2_u16, StaticArray[0x99_u8, 0xcf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
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

  IComLTxEvents_GUID = "605cf82c-578e-4298-975d-82babcd9e053"
  IID_IComLTxEvents = LibC::GUID.new(0x605cf82c_u32, 0x578e_u16, 0x4298_u16, StaticArray[0x97_u8, 0x5d_u8, 0x82_u8, 0xba_u8, 0xbc_u8, 0xd9_u8, 0xe0_u8, 0x53_u8])
  struct IComLTxEvents
    lpVtbl : IComLTxEventsVTbl*
  end

  struct IComUserEventVTbl
    query_interface : Proc(IComUserEvent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComUserEvent*, UInt32)
    release : Proc(IComUserEvent*, UInt32)
    on_user_event : Proc(IComUserEvent*, COMSVCSEVENTINFO*, VARIANT*, HRESULT)
  end

  IComUserEvent_GUID = "683130a4-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComUserEvent = LibC::GUID.new(0x683130a4_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComThreadEvents_GUID = "683130a5-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComThreadEvents = LibC::GUID.new(0x683130a5_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComAppEvents_GUID = "683130a6-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComAppEvents = LibC::GUID.new(0x683130a6_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComInstanceEvents_GUID = "683130a7-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComInstanceEvents = LibC::GUID.new(0x683130a7_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComTransactionEvents_GUID = "683130a8-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComTransactionEvents = LibC::GUID.new(0x683130a8_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComMethodEvents_GUID = "683130a9-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComMethodEvents = LibC::GUID.new(0x683130a9_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComObjectEvents_GUID = "683130aa-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectEvents = LibC::GUID.new(0x683130aa_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComResourceEvents_GUID = "683130ab-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComResourceEvents = LibC::GUID.new(0x683130ab_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComSecurityEvents_GUID = "683130ac-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComSecurityEvents = LibC::GUID.new(0x683130ac_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComObjectPoolEvents_GUID = "683130ad-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectPoolEvents = LibC::GUID.new(0x683130ad_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComObjectPoolEvents2_GUID = "683130ae-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectPoolEvents2 = LibC::GUID.new(0x683130ae_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComObjectPoolEvents2
    lpVtbl : IComObjectPoolEvents2VTbl*
  end

  struct IComObjectConstructionEventsVTbl
    query_interface : Proc(IComObjectConstructionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectConstructionEvents*, UInt32)
    release : Proc(IComObjectConstructionEvents*, UInt32)
    on_object_construct : Proc(IComObjectConstructionEvents*, COMSVCSEVENTINFO*, Guid*, LibC::LPWSTR, UInt64, HRESULT)
  end

  IComObjectConstructionEvents_GUID = "683130af-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComObjectConstructionEvents = LibC::GUID.new(0x683130af_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComActivityEvents_GUID = "683130b0-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComActivityEvents = LibC::GUID.new(0x683130b0_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComActivityEvents
    lpVtbl : IComActivityEventsVTbl*
  end

  struct IComIdentityEventsVTbl
    query_interface : Proc(IComIdentityEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComIdentityEvents*, UInt32)
    release : Proc(IComIdentityEvents*, UInt32)
    on_iis_request_info : Proc(IComIdentityEvents*, COMSVCSEVENTINFO*, UInt64, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IComIdentityEvents_GUID = "683130b1-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComIdentityEvents = LibC::GUID.new(0x683130b1_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComQCEvents_GUID = "683130b2-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComQCEvents = LibC::GUID.new(0x683130b2_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IComQCEvents
    lpVtbl : IComQCEventsVTbl*
  end

  struct IComExceptionEventsVTbl
    query_interface : Proc(IComExceptionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComExceptionEvents*, UInt32)
    release : Proc(IComExceptionEvents*, UInt32)
    on_exception_user : Proc(IComExceptionEvents*, COMSVCSEVENTINFO*, UInt32, UInt64, LibC::LPWSTR, HRESULT)
  end

  IComExceptionEvents_GUID = "683130b3-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComExceptionEvents = LibC::GUID.new(0x683130b3_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  ILBEvents_GUID = "683130b4-2e50-11d2-98a5-00c04f8ee1c4"
  IID_ILBEvents = LibC::GUID.new(0x683130b4_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComCRMEvents_GUID = "683130b5-2e50-11d2-98a5-00c04f8ee1c4"
  IID_IComCRMEvents = LibC::GUID.new(0x683130b5_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComMethod2Events_GUID = "fb388aaa-567d-4024-af8e-6e93ee748573"
  IID_IComMethod2Events = LibC::GUID.new(0xfb388aaa_u32, 0x567d_u16, 0x4024_u16, StaticArray[0xaf_u8, 0x8e_u8, 0x6e_u8, 0x93_u8, 0xee_u8, 0x74_u8, 0x85_u8, 0x73_u8])
  struct IComMethod2Events
    lpVtbl : IComMethod2EventsVTbl*
  end

  struct IComTrackingInfoEventsVTbl
    query_interface : Proc(IComTrackingInfoEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTrackingInfoEvents*, UInt32)
    release : Proc(IComTrackingInfoEvents*, UInt32)
    on_new_tracking_info : Proc(IComTrackingInfoEvents*, IUnknown, HRESULT)
  end

  IComTrackingInfoEvents_GUID = "4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec"
  IID_IComTrackingInfoEvents = LibC::GUID.new(0x4e6cdcc9_u32, 0xfb25_u16, 0x4fd5_u16, StaticArray[0x9c_u8, 0xc5_u8, 0xc9_u8, 0xf4_u8, 0xb6_u8, 0x55_u8, 0x9c_u8, 0xec_u8])
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

  IComTrackingInfoCollection_GUID = "c266c677-c9ad-49ab-9fd9-d9661078588a"
  IID_IComTrackingInfoCollection = LibC::GUID.new(0xc266c677_u32, 0xc9ad_u16, 0x49ab_u16, StaticArray[0x9f_u8, 0xd9_u8, 0xd9_u8, 0x66_u8, 0x10_u8, 0x78_u8, 0x58_u8, 0x8a_u8])
  struct IComTrackingInfoCollection
    lpVtbl : IComTrackingInfoCollectionVTbl*
  end

  struct IComTrackingInfoObjectVTbl
    query_interface : Proc(IComTrackingInfoObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComTrackingInfoObject*, UInt32)
    release : Proc(IComTrackingInfoObject*, UInt32)
    get_value : Proc(IComTrackingInfoObject*, LibC::LPWSTR, VARIANT*, HRESULT)
  end

  IComTrackingInfoObject_GUID = "116e42c5-d8b1-47bf-ab1e-c895ed3e2372"
  IID_IComTrackingInfoObject = LibC::GUID.new(0x116e42c5_u32, 0xd8b1_u16, 0x47bf_u16, StaticArray[0xab_u8, 0x1e_u8, 0xc8_u8, 0x95_u8, 0xed_u8, 0x3e_u8, 0x23_u8, 0x72_u8])
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

  IComTrackingInfoProperties_GUID = "789b42be-6f6b-443a-898e-67abf390aa14"
  IID_IComTrackingInfoProperties = LibC::GUID.new(0x789b42be_u32, 0x6f6b_u16, 0x443a_u16, StaticArray[0x89_u8, 0x8e_u8, 0x67_u8, 0xab_u8, 0xf3_u8, 0x90_u8, 0xaa_u8, 0x14_u8])
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

  IComApp2Events_GUID = "1290bc1a-b219-418d-b078-5934ded08242"
  IID_IComApp2Events = LibC::GUID.new(0x1290bc1a_u32, 0xb219_u16, 0x418d_u16, StaticArray[0xb0_u8, 0x78_u8, 0x59_u8, 0x34_u8, 0xde_u8, 0xd0_u8, 0x82_u8, 0x42_u8])
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

  IComTransaction2Events_GUID = "a136f62a-2f94-4288-86e0-d8a1fa4c0299"
  IID_IComTransaction2Events = LibC::GUID.new(0xa136f62a_u32, 0x2f94_u16, 0x4288_u16, StaticArray[0x86_u8, 0xe0_u8, 0xd8_u8, 0xa1_u8, 0xfa_u8, 0x4c_u8, 0x2_u8, 0x99_u8])
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

  IComInstance2Events_GUID = "20e3bf07-b506-4ad5-a50c-d2ca5b9c158e"
  IID_IComInstance2Events = LibC::GUID.new(0x20e3bf07_u32, 0xb506_u16, 0x4ad5_u16, StaticArray[0xa5_u8, 0xc_u8, 0xd2_u8, 0xca_u8, 0x5b_u8, 0x9c_u8, 0x15_u8, 0x8e_u8])
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

  IComObjectPool2Events_GUID = "65bf6534-85ea-4f64-8cf4-3d974b2ab1cf"
  IID_IComObjectPool2Events = LibC::GUID.new(0x65bf6534_u32, 0x85ea_u16, 0x4f64_u16, StaticArray[0x8c_u8, 0xf4_u8, 0x3d_u8, 0x97_u8, 0x4b_u8, 0x2a_u8, 0xb1_u8, 0xcf_u8])
  struct IComObjectPool2Events
    lpVtbl : IComObjectPool2EventsVTbl*
  end

  struct IComObjectConstruction2EventsVTbl
    query_interface : Proc(IComObjectConstruction2Events*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComObjectConstruction2Events*, UInt32)
    release : Proc(IComObjectConstruction2Events*, UInt32)
    on_object_construct2 : Proc(IComObjectConstruction2Events*, COMSVCSEVENTINFO*, Guid*, LibC::LPWSTR, UInt64, Guid*, HRESULT)
  end

  IComObjectConstruction2Events_GUID = "4b5a7827-8df2-45c0-8f6f-57ea1f856a9f"
  IID_IComObjectConstruction2Events = LibC::GUID.new(0x4b5a7827_u32, 0x8df2_u16, 0x45c0_u16, StaticArray[0x8f_u8, 0x6f_u8, 0x57_u8, 0xea_u8, 0x1f_u8, 0x85_u8, 0x6a_u8, 0x9f_u8])
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

  ISystemAppEventData_GUID = "d6d48a3c-d5c5-49e7-8c74-99e4889ed52f"
  IID_ISystemAppEventData = LibC::GUID.new(0xd6d48a3c_u32, 0xd5c5_u16, 0x49e7_u16, StaticArray[0x8c_u8, 0x74_u8, 0x99_u8, 0xe4_u8, 0x88_u8, 0x9e_u8, 0xd5_u8, 0x2f_u8])
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

  IMtsEvents_GUID = "bacedf4d-74ab-11d0-b162-00aa00ba3258"
  IID_IMtsEvents = LibC::GUID.new(0xbacedf4d_u32, 0x74ab_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x62_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
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

  IMtsEventInfo_GUID = "d56c3dc1-8482-11d0-b170-00aa00ba3258"
  IID_IMtsEventInfo = LibC::GUID.new(0xd56c3dc1_u32, 0x8482_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x70_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
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

  IMTSLocator_GUID = "d19b8bfd-7f88-11d0-b16e-00aa00ba3258"
  IID_IMTSLocator = LibC::GUID.new(0xd19b8bfd_u32, 0x7f88_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x6e_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
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

  IMtsGrp_GUID = "4b2e958c-0393-11d1-b1ab-00aa00ba3258"
  IID_IMtsGrp = LibC::GUID.new(0x4b2e958c_u32, 0x393_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xab_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
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

  IMessageMover_GUID = "588a085a-b795-11d1-8054-00c04fc340ee"
  IID_IMessageMover = LibC::GUID.new(0x588a085a_u32, 0xb795_u16, 0x11d1_u16, StaticArray[0x80_u8, 0x54_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x40_u8, 0xee_u8])
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

  IEventServerTrace_GUID = "9a9f12b8-80af-47ab-a579-35ea57725370"
  IID_IEventServerTrace = LibC::GUID.new(0x9a9f12b8_u32, 0x80af_u16, 0x47ab_u16, StaticArray[0xa5_u8, 0x79_u8, 0x35_u8, 0xea_u8, 0x57_u8, 0x72_u8, 0x53_u8, 0x70_u8])
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

  IGetAppTrackerData_GUID = "507c3ac8-3e12-4cb0-9366-653d3e050638"
  IID_IGetAppTrackerData = LibC::GUID.new(0x507c3ac8_u32, 0x3e12_u16, 0x4cb0_u16, StaticArray[0x93_u8, 0x66_u8, 0x65_u8, 0x3d_u8, 0x3e_u8, 0x5_u8, 0x6_u8, 0x38_u8])
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

  IDispenserManager_GUID = "5cb31e10-2b5f-11cf-be10-00aa00a2fa25"
  IID_IDispenserManager = LibC::GUID.new(0x5cb31e10_u32, 0x2b5f_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IHolder_GUID = "bf6a1850-2b45-11cf-be10-00aa00a2fa25"
  IID_IHolder = LibC::GUID.new(0xbf6a1850_u32, 0x2b45_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IDispenserDriver_GUID = "208b3651-2b48-11cf-be10-00aa00a2fa25"
  IID_IDispenserDriver = LibC::GUID.new(0x208b3651_u32, 0x2b48_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  ITransactionProxy_GUID = "02558374-df2e-4dae-bd6b-1d5c994f9bdc"
  IID_ITransactionProxy = LibC::GUID.new(0x2558374_u32, 0xdf2e_u16, 0x4dae_u16, StaticArray[0xbd_u8, 0x6b_u8, 0x1d_u8, 0x5c_u8, 0x99_u8, 0x4f_u8, 0x9b_u8, 0xdc_u8])
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

  IContextSecurityPerimeter_GUID = "a7549a29-a7c4-42e1-8dc1-7e3d748dc24a"
  IID_IContextSecurityPerimeter = LibC::GUID.new(0xa7549a29_u32, 0xa7c4_u16, 0x42e1_u16, StaticArray[0x8d_u8, 0xc1_u8, 0x7e_u8, 0x3d_u8, 0x74_u8, 0x8d_u8, 0xc2_u8, 0x4a_u8])
  struct IContextSecurityPerimeter
    lpVtbl : IContextSecurityPerimeterVTbl*
  end

  struct ITxProxyHolderVTbl
    query_interface : Proc(ITxProxyHolder*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITxProxyHolder*, UInt32)
    release : Proc(ITxProxyHolder*, UInt32)
    get_identifier : Proc(ITxProxyHolder*, Guid*, Void)
  end

  ITxProxyHolder_GUID = "13d86f31-0139-41af-bcad-c7d50435fe9f"
  IID_ITxProxyHolder = LibC::GUID.new(0x13d86f31_u32, 0x139_u16, 0x41af_u16, StaticArray[0xbc_u8, 0xad_u8, 0xc7_u8, 0xd5_u8, 0x4_u8, 0x35_u8, 0xfe_u8, 0x9f_u8])
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

  IObjectContext_GUID = "51372ae0-cae7-11cf-be81-00aa00a2fa25"
  IID_IObjectContext = LibC::GUID.new(0x51372ae0_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IObjectControl_GUID = "51372aec-cae7-11cf-be81-00aa00a2fa25"
  IID_IObjectControl = LibC::GUID.new(0x51372aec_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IEnumNames_GUID = "51372af2-cae7-11cf-be81-00aa00a2fa25"
  IID_IEnumNames = LibC::GUID.new(0x51372af2_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  ISecurityProperty_GUID = "51372aea-cae7-11cf-be81-00aa00a2fa25"
  IID_ISecurityProperty = LibC::GUID.new(0x51372aea_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  ObjectControl_GUID = "7dc41850-0c31-11d0-8b79-00aa00b8a790"
  IID_ObjectControl = LibC::GUID.new(0x7dc41850_u32, 0xc31_u16, 0x11d0_u16, StaticArray[0x8b_u8, 0x79_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xa7_u8, 0x90_u8])
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

  ISharedProperty_GUID = "2a005c01-a5de-11cf-9e66-00aa00a3f464"
  IID_ISharedProperty = LibC::GUID.new(0x2a005c01_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
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

  ISharedPropertyGroup_GUID = "2a005c07-a5de-11cf-9e66-00aa00a3f464"
  IID_ISharedPropertyGroup = LibC::GUID.new(0x2a005c07_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
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

  ISharedPropertyGroupManager_GUID = "2a005c0d-a5de-11cf-9e66-00aa00a3f464"
  IID_ISharedPropertyGroupManager = LibC::GUID.new(0x2a005c0d_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
  struct ISharedPropertyGroupManager
    lpVtbl : ISharedPropertyGroupManagerVTbl*
  end

  struct IObjectConstructVTbl
    query_interface : Proc(IObjectConstruct*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectConstruct*, UInt32)
    release : Proc(IObjectConstruct*, UInt32)
    construct : Proc(IObjectConstruct*, IDispatch, HRESULT)
  end

  IObjectConstruct_GUID = "41c4f8b3-7439-11d2-98cb-00c04f8ee1c4"
  IID_IObjectConstruct = LibC::GUID.new(0x41c4f8b3_u32, 0x7439_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IObjectConstructString_GUID = "41c4f8b2-7439-11d2-98cb-00c04f8ee1c4"
  IID_IObjectConstructString = LibC::GUID.new(0x41c4f8b2_u32, 0x7439_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
  struct IObjectConstructString
    lpVtbl : IObjectConstructStringVTbl*
  end

  struct IObjectContextActivityVTbl
    query_interface : Proc(IObjectContextActivity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContextActivity*, UInt32)
    release : Proc(IObjectContextActivity*, UInt32)
    get_activity_id : Proc(IObjectContextActivity*, Guid*, HRESULT)
  end

  IObjectContextActivity_GUID = "51372afc-cae7-11cf-be81-00aa00a2fa25"
  IID_IObjectContextActivity = LibC::GUID.new(0x51372afc_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IObjectContextInfo_GUID = "75b52ddb-e8ed-11d1-93ad-00aa00ba3258"
  IID_IObjectContextInfo = LibC::GUID.new(0x75b52ddb_u32, 0xe8ed_u16, 0x11d1_u16, StaticArray[0x93_u8, 0xad_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
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

  IObjectContextInfo2_GUID = "594be71a-4bc4-438b-9197-cfd176248b09"
  IID_IObjectContextInfo2 = LibC::GUID.new(0x594be71a_u32, 0x4bc4_u16, 0x438b_u16, StaticArray[0x91_u8, 0x97_u8, 0xcf_u8, 0xd1_u8, 0x76_u8, 0x24_u8, 0x8b_u8, 0x9_u8])
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

  ITransactionStatus_GUID = "61f589e8-3724-4898-a0a4-664ae9e1d1b4"
  IID_ITransactionStatus = LibC::GUID.new(0x61f589e8_u32, 0x3724_u16, 0x4898_u16, StaticArray[0xa0_u8, 0xa4_u8, 0x66_u8, 0x4a_u8, 0xe9_u8, 0xe1_u8, 0xd1_u8, 0xb4_u8])
  struct ITransactionStatus
    lpVtbl : ITransactionStatusVTbl*
  end

  struct IObjectContextTipVTbl
    query_interface : Proc(IObjectContextTip*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectContextTip*, UInt32)
    release : Proc(IObjectContextTip*, UInt32)
    get_tip_url : Proc(IObjectContextTip*, UInt8**, HRESULT)
  end

  IObjectContextTip_GUID = "92fd41ca-bad9-11d2-9a2d-00c04f797bc9"
  IID_IObjectContextTip = LibC::GUID.new(0x92fd41ca_u32, 0xbad9_u16, 0x11d2_u16, StaticArray[0x9a_u8, 0x2d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
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

  IPlaybackControl_GUID = "51372afd-cae7-11cf-be81-00aa00a2fa25"
  IID_IPlaybackControl = LibC::GUID.new(0x51372afd_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IGetContextProperties_GUID = "51372af4-cae7-11cf-be81-00aa00a2fa25"
  IID_IGetContextProperties = LibC::GUID.new(0x51372af4_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IContextState_GUID = "3c05e54b-a42a-11d2-afc4-00c04f8ee1c4"
  IID_IContextState = LibC::GUID.new(0x3c05e54b_u32, 0xa42a_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IPoolManager_GUID = "0a469861-5a91-43a0-99b6-d5e179bb0631"
  IID_IPoolManager = LibC::GUID.new(0xa469861_u32, 0x5a91_u16, 0x43a0_u16, StaticArray[0x99_u8, 0xb6_u8, 0xd5_u8, 0xe1_u8, 0x79_u8, 0xbb_u8, 0x6_u8, 0x31_u8])
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

  ISelectCOMLBServer_GUID = "dcf443f4-3f8a-4872-b9f0-369a796d12d6"
  IID_ISelectCOMLBServer = LibC::GUID.new(0xdcf443f4_u32, 0x3f8a_u16, 0x4872_u16, StaticArray[0xb9_u8, 0xf0_u8, 0x36_u8, 0x9a_u8, 0x79_u8, 0x6d_u8, 0x12_u8, 0xd6_u8])
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

  ICOMLBArguments_GUID = "3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2"
  IID_ICOMLBArguments = LibC::GUID.new(0x3a0f150f_u32, 0x8ee5_u16, 0x4b94_u16, StaticArray[0xb4_u8, 0xe_u8, 0xae_u8, 0xf2_u8, 0xf9_u8, 0xe4_u8, 0x2e_u8, 0xd2_u8])
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

  ICrmLogControl_GUID = "a0e174b3-d26e-11d2-8f84-00805fc7bcd9"
  IID_ICrmLogControl = LibC::GUID.new(0xa0e174b3_u32, 0xd26e_u16, 0x11d2_u16, StaticArray[0x8f_u8, 0x84_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0xbc_u8, 0xd9_u8])
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

  ICrmCompensatorVariants_GUID = "f0baf8e4-7804-11d1-82e9-00a0c91eede9"
  IID_ICrmCompensatorVariants = LibC::GUID.new(0xf0baf8e4_u32, 0x7804_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xe9_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
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

  ICrmCompensator_GUID = "bbc01830-8d3b-11d1-82ec-00a0c91eede9"
  IID_ICrmCompensator = LibC::GUID.new(0xbbc01830_u32, 0x8d3b_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xec_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
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

  ICrmMonitorLogRecords_GUID = "70c8e441-c7ed-11d1-82fb-00a0c91eede9"
  IID_ICrmMonitorLogRecords = LibC::GUID.new(0x70c8e441_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
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

  ICrmMonitorClerks_GUID = "70c8e442-c7ed-11d1-82fb-00a0c91eede9"
  IID_ICrmMonitorClerks = LibC::GUID.new(0x70c8e442_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
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

  ICrmMonitor_GUID = "70c8e443-c7ed-11d1-82fb-00a0c91eede9"
  IID_ICrmMonitor = LibC::GUID.new(0x70c8e443_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
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

  ICrmFormatLogRecords_GUID = "9c51d821-c98b-11d1-82fb-00a0c91eede9"
  IID_ICrmFormatLogRecords = LibC::GUID.new(0x9c51d821_u32, 0xc98b_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
  struct ICrmFormatLogRecords
    lpVtbl : ICrmFormatLogRecordsVTbl*
  end

  struct IServiceIISIntrinsicsConfigVTbl
    query_interface : Proc(IServiceIISIntrinsicsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceIISIntrinsicsConfig*, UInt32)
    release : Proc(IServiceIISIntrinsicsConfig*, UInt32)
    iis_intrinsics_config : Proc(IServiceIISIntrinsicsConfig*, CSC_IISIntrinsicsConfig, HRESULT)
  end

  IServiceIISIntrinsicsConfig_GUID = "1a0cf920-d452-46f4-bc36-48118d54ea52"
  IID_IServiceIISIntrinsicsConfig = LibC::GUID.new(0x1a0cf920_u32, 0xd452_u16, 0x46f4_u16, StaticArray[0xbc_u8, 0x36_u8, 0x48_u8, 0x11_u8, 0x8d_u8, 0x54_u8, 0xea_u8, 0x52_u8])
  struct IServiceIISIntrinsicsConfig
    lpVtbl : IServiceIISIntrinsicsConfigVTbl*
  end

  struct IServiceComTIIntrinsicsConfigVTbl
    query_interface : Proc(IServiceComTIIntrinsicsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceComTIIntrinsicsConfig*, UInt32)
    release : Proc(IServiceComTIIntrinsicsConfig*, UInt32)
    com_ti_intrinsics_config : Proc(IServiceComTIIntrinsicsConfig*, CSC_COMTIIntrinsicsConfig, HRESULT)
  end

  IServiceComTIIntrinsicsConfig_GUID = "09e6831e-04e1-4ed4-9d0f-e8b168bafeaf"
  IID_IServiceComTIIntrinsicsConfig = LibC::GUID.new(0x9e6831e_u32, 0x4e1_u16, 0x4ed4_u16, StaticArray[0x9d_u8, 0xf_u8, 0xe8_u8, 0xb1_u8, 0x68_u8, 0xba_u8, 0xfe_u8, 0xaf_u8])
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

  IServiceSxsConfig_GUID = "c7cd7379-f3f2-4634-811b-703281d73e08"
  IID_IServiceSxsConfig = LibC::GUID.new(0xc7cd7379_u32, 0xf3f2_u16, 0x4634_u16, StaticArray[0x81_u8, 0x1b_u8, 0x70_u8, 0x32_u8, 0x81_u8, 0xd7_u8, 0x3e_u8, 0x8_u8])
  struct IServiceSxsConfig
    lpVtbl : IServiceSxsConfigVTbl*
  end

  struct ICheckSxsConfigVTbl
    query_interface : Proc(ICheckSxsConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICheckSxsConfig*, UInt32)
    release : Proc(ICheckSxsConfig*, UInt32)
    is_same_sxs_config : Proc(ICheckSxsConfig*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  ICheckSxsConfig_GUID = "0ff5a96f-11fc-47d1-baa6-25dd347e7242"
  IID_ICheckSxsConfig = LibC::GUID.new(0xff5a96f_u32, 0x11fc_u16, 0x47d1_u16, StaticArray[0xba_u8, 0xa6_u8, 0x25_u8, 0xdd_u8, 0x34_u8, 0x7e_u8, 0x72_u8, 0x42_u8])
  struct ICheckSxsConfig
    lpVtbl : ICheckSxsConfigVTbl*
  end

  struct IServiceInheritanceConfigVTbl
    query_interface : Proc(IServiceInheritanceConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceInheritanceConfig*, UInt32)
    release : Proc(IServiceInheritanceConfig*, UInt32)
    containing_context_treatment : Proc(IServiceInheritanceConfig*, CSC_InheritanceConfig, HRESULT)
  end

  IServiceInheritanceConfig_GUID = "92186771-d3b4-4d77-a8ea-ee842d586f35"
  IID_IServiceInheritanceConfig = LibC::GUID.new(0x92186771_u32, 0xd3b4_u16, 0x4d77_u16, StaticArray[0xa8_u8, 0xea_u8, 0xee_u8, 0x84_u8, 0x2d_u8, 0x58_u8, 0x6f_u8, 0x35_u8])
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

  IServiceThreadPoolConfig_GUID = "186d89bc-f277-4bcc-80d5-4df7b836ef4a"
  IID_IServiceThreadPoolConfig = LibC::GUID.new(0x186d89bc_u32, 0xf277_u16, 0x4bcc_u16, StaticArray[0x80_u8, 0xd5_u8, 0x4d_u8, 0xf7_u8, 0xb8_u8, 0x36_u8, 0xef_u8, 0x4a_u8])
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

  IServiceTransactionConfigBase_GUID = "772b3fbe-6ffd-42fb-b5f8-8f9b260f3810"
  IID_IServiceTransactionConfigBase = LibC::GUID.new(0x772b3fbe_u32, 0x6ffd_u16, 0x42fb_u16, StaticArray[0xb5_u8, 0xf8_u8, 0x8f_u8, 0x9b_u8, 0x26_u8, 0xf_u8, 0x38_u8, 0x10_u8])
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

  IServiceTransactionConfig_GUID = "59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9"
  IID_IServiceTransactionConfig = LibC::GUID.new(0x59f4c2a3_u32, 0xd3d7_u16, 0x4a31_u16, StaticArray[0xb6_u8, 0xe4_u8, 0x6a_u8, 0xb3_u8, 0x17_u8, 0x7c_u8, 0x50_u8, 0xb9_u8])
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

  IServiceSysTxnConfig_GUID = "33caf1a1-fcb8-472b-b45e-967448ded6d8"
  IID_IServiceSysTxnConfig = LibC::GUID.new(0x33caf1a1_u32, 0xfcb8_u16, 0x472b_u16, StaticArray[0xb4_u8, 0x5e_u8, 0x96_u8, 0x74_u8, 0x48_u8, 0xde_u8, 0xd6_u8, 0xd8_u8])
  struct IServiceSysTxnConfig
    lpVtbl : IServiceSysTxnConfigVTbl*
  end

  struct IServiceSynchronizationConfigVTbl
    query_interface : Proc(IServiceSynchronizationConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceSynchronizationConfig*, UInt32)
    release : Proc(IServiceSynchronizationConfig*, UInt32)
    configure_synchronization : Proc(IServiceSynchronizationConfig*, CSC_SynchronizationConfig, HRESULT)
  end

  IServiceSynchronizationConfig_GUID = "fd880e81-6dce-4c58-af83-a208846c0030"
  IID_IServiceSynchronizationConfig = LibC::GUID.new(0xfd880e81_u32, 0x6dce_u16, 0x4c58_u16, StaticArray[0xaf_u8, 0x83_u8, 0xa2_u8, 0x8_u8, 0x84_u8, 0x6c_u8, 0x0_u8, 0x30_u8])
  struct IServiceSynchronizationConfig
    lpVtbl : IServiceSynchronizationConfigVTbl*
  end

  struct IServiceTrackerConfigVTbl
    query_interface : Proc(IServiceTrackerConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceTrackerConfig*, UInt32)
    release : Proc(IServiceTrackerConfig*, UInt32)
    tracker_config : Proc(IServiceTrackerConfig*, CSC_TrackerConfig, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IServiceTrackerConfig_GUID = "6c3a3e1d-0ba6-4036-b76f-d0404db816c9"
  IID_IServiceTrackerConfig = LibC::GUID.new(0x6c3a3e1d_u32, 0xba6_u16, 0x4036_u16, StaticArray[0xb7_u8, 0x6f_u8, 0xd0_u8, 0x40_u8, 0x4d_u8, 0xb8_u8, 0x16_u8, 0xc9_u8])
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

  IServicePartitionConfig_GUID = "80182d03-5ea4-4831-ae97-55beffc2e590"
  IID_IServicePartitionConfig = LibC::GUID.new(0x80182d03_u32, 0x5ea4_u16, 0x4831_u16, StaticArray[0xae_u8, 0x97_u8, 0x55_u8, 0xbe_u8, 0xff_u8, 0xc2_u8, 0xe5_u8, 0x90_u8])
  struct IServicePartitionConfig
    lpVtbl : IServicePartitionConfigVTbl*
  end

  struct IServiceCallVTbl
    query_interface : Proc(IServiceCall*, Guid*, Void**, HRESULT)
    add_ref : Proc(IServiceCall*, UInt32)
    release : Proc(IServiceCall*, UInt32)
    on_call : Proc(IServiceCall*, HRESULT)
  end

  IServiceCall_GUID = "bd3e2e12-42dd-40f4-a09a-95a50c58304b"
  IID_IServiceCall = LibC::GUID.new(0xbd3e2e12_u32, 0x42dd_u16, 0x40f4_u16, StaticArray[0xa0_u8, 0x9a_u8, 0x95_u8, 0xa5_u8, 0xc_u8, 0x58_u8, 0x30_u8, 0x4b_u8])
  struct IServiceCall
    lpVtbl : IServiceCallVTbl*
  end

  struct IAsyncErrorNotifyVTbl
    query_interface : Proc(IAsyncErrorNotify*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAsyncErrorNotify*, UInt32)
    release : Proc(IAsyncErrorNotify*, UInt32)
    on_error : Proc(IAsyncErrorNotify*, HRESULT, HRESULT)
  end

  IAsyncErrorNotify_GUID = "fe6777fb-a674-4177-8f32-6d707e113484"
  IID_IAsyncErrorNotify = LibC::GUID.new(0xfe6777fb_u32, 0xa674_u16, 0x4177_u16, StaticArray[0x8f_u8, 0x32_u8, 0x6d_u8, 0x70_u8, 0x7e_u8, 0x11_u8, 0x34_u8, 0x84_u8])
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

  IServiceActivity_GUID = "67532e0c-9e2f-4450-a354-035633944e17"
  IID_IServiceActivity = LibC::GUID.new(0x67532e0c_u32, 0x9e2f_u16, 0x4450_u16, StaticArray[0xa3_u8, 0x54_u8, 0x3_u8, 0x56_u8, 0x33_u8, 0x94_u8, 0x4e_u8, 0x17_u8])
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

  IThreadPoolKnobs_GUID = "51372af7-cae7-11cf-be81-00aa00a2fa25"
  IID_IThreadPoolKnobs = LibC::GUID.new(0x51372af7_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IComStaThreadPoolKnobs_GUID = "324b64fa-33b6-11d2-98b7-00c04f8ee1c4"
  IID_IComStaThreadPoolKnobs = LibC::GUID.new(0x324b64fa_u32, 0x33b6_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xb7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
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

  IComMtaThreadPoolKnobs_GUID = "f9a76d2e-76a5-43eb-a0c4-49bec8e48480"
  IID_IComMtaThreadPoolKnobs = LibC::GUID.new(0xf9a76d2e_u32, 0x76a5_u16, 0x43eb_u16, StaticArray[0xa0_u8, 0xc4_u8, 0x49_u8, 0xbe_u8, 0xc8_u8, 0xe4_u8, 0x84_u8, 0x80_u8])
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

  IComStaThreadPoolKnobs2_GUID = "73707523-ff9a-4974-bf84-2108dc213740"
  IID_IComStaThreadPoolKnobs2 = LibC::GUID.new(0x73707523_u32, 0xff9a_u16, 0x4974_u16, StaticArray[0xbf_u8, 0x84_u8, 0x21_u8, 0x8_u8, 0xdc_u8, 0x21_u8, 0x37_u8, 0x40_u8])
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

  IProcessInitializer_GUID = "1113f52d-dc7f-4943-aed6-88d04027e32a"
  IID_IProcessInitializer = LibC::GUID.new(0x1113f52d_u32, 0xdc7f_u16, 0x4943_u16, StaticArray[0xae_u8, 0xd6_u8, 0x88_u8, 0xd0_u8, 0x40_u8, 0x27_u8, 0xe3_u8, 0x2a_u8])
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

  IServicePoolConfig_GUID = "a9690656-5bca-470c-8451-250c1f43a33e"
  IID_IServicePoolConfig = LibC::GUID.new(0xa9690656_u32, 0x5bca_u16, 0x470c_u16, StaticArray[0x84_u8, 0x51_u8, 0x25_u8, 0xc_u8, 0x1f_u8, 0x43_u8, 0xa3_u8, 0x3e_u8])
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

  IServicePool_GUID = "b302df81-ea45-451e-99a2-09f9fd1b1e13"
  IID_IServicePool = LibC::GUID.new(0xb302df81_u32, 0xea45_u16, 0x451e_u16, StaticArray[0x99_u8, 0xa2_u8, 0x9_u8, 0xf9_u8, 0xfd_u8, 0x1b_u8, 0x1e_u8, 0x13_u8])
  struct IServicePool
    lpVtbl : IServicePoolVTbl*
  end

  struct IManagedPooledObjVTbl
    query_interface : Proc(IManagedPooledObj*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManagedPooledObj*, UInt32)
    release : Proc(IManagedPooledObj*, UInt32)
    set_held : Proc(IManagedPooledObj*, LibC::BOOL, HRESULT)
  end

  IManagedPooledObj_GUID = "c5da4bea-1b42-4437-8926-b6a38860a770"
  IID_IManagedPooledObj = LibC::GUID.new(0xc5da4bea_u32, 0x1b42_u16, 0x4437_u16, StaticArray[0x89_u8, 0x26_u8, 0xb6_u8, 0xa3_u8, 0x88_u8, 0x60_u8, 0xa7_u8, 0x70_u8])
  struct IManagedPooledObj
    lpVtbl : IManagedPooledObjVTbl*
  end

  struct IManagedPoolActionVTbl
    query_interface : Proc(IManagedPoolAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IManagedPoolAction*, UInt32)
    release : Proc(IManagedPoolAction*, UInt32)
    last_release : Proc(IManagedPoolAction*, HRESULT)
  end

  IManagedPoolAction_GUID = "da91b74e-5388-4783-949d-c1cd5fb00506"
  IID_IManagedPoolAction = LibC::GUID.new(0xda91b74e_u32, 0x5388_u16, 0x4783_u16, StaticArray[0x94_u8, 0x9d_u8, 0xc1_u8, 0xcd_u8, 0x5f_u8, 0xb0_u8, 0x5_u8, 0x6_u8])
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

  IManagedObjectInfo_GUID = "1427c51a-4584-49d8-90a0-c50d8086cbe9"
  IID_IManagedObjectInfo = LibC::GUID.new(0x1427c51a_u32, 0x4584_u16, 0x49d8_u16, StaticArray[0x90_u8, 0xa0_u8, 0xc5_u8, 0xd_u8, 0x80_u8, 0x86_u8, 0xcb_u8, 0xe9_u8])
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

  IAppDomainHelper_GUID = "c7b67079-8255-42c6-9ec0-6994a3548780"
  IID_IAppDomainHelper = LibC::GUID.new(0xc7b67079_u32, 0x8255_u16, 0x42c6_u16, StaticArray[0x9e_u8, 0xc0_u8, 0x69_u8, 0x94_u8, 0xa3_u8, 0x54_u8, 0x87_u8, 0x80_u8])
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

  IAssemblyLocator_GUID = "391ffbb9-a8ee-432a-abc8-baa238dab90f"
  IID_IAssemblyLocator = LibC::GUID.new(0x391ffbb9_u32, 0xa8ee_u16, 0x432a_u16, StaticArray[0xab_u8, 0xc8_u8, 0xba_u8, 0xa2_u8, 0x38_u8, 0xda_u8, 0xb9_u8, 0xf_u8])
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

  IManagedActivationEvents_GUID = "a5f325af-572f-46da-b8ab-827c3d95d99e"
  IID_IManagedActivationEvents = LibC::GUID.new(0xa5f325af_u32, 0x572f_u16, 0x46da_u16, StaticArray[0xb8_u8, 0xab_u8, 0x82_u8, 0x7c_u8, 0x3d_u8, 0x95_u8, 0xd9_u8, 0x9e_u8])
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

  ISendMethodEvents_GUID = "2732fd59-b2b4-4d44-878c-8b8f09626008"
  IID_ISendMethodEvents = LibC::GUID.new(0x2732fd59_u32, 0xb2b4_u16, 0x4d44_u16, StaticArray[0x87_u8, 0x8c_u8, 0x8b_u8, 0x8f_u8, 0x9_u8, 0x62_u8, 0x60_u8, 0x8_u8])
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

  ITransactionResourcePool_GUID = "c5feb7c1-346a-11d1-b1cc-00aa00ba3258"
  IID_ITransactionResourcePool = LibC::GUID.new(0xc5feb7c1_u32, 0x346a_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xcc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
  struct ITransactionResourcePool
    lpVtbl : ITransactionResourcePoolVTbl*
  end

  struct IMTSCallVTbl
    query_interface : Proc(IMTSCall*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMTSCall*, UInt32)
    release : Proc(IMTSCall*, UInt32)
    on_call : Proc(IMTSCall*, HRESULT)
  end

  IMTSCall_GUID = "51372aef-cae7-11cf-be81-00aa00a2fa25"
  IID_IMTSCall = LibC::GUID.new(0x51372aef_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
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

  IContextProperties_GUID = "d396da85-bf8f-11d1-bbae-00c04fc2fa5f"
  IID_IContextProperties = LibC::GUID.new(0xd396da85_u32, 0xbf8f_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xae_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xfa_u8, 0x5f_u8])
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

  IObjPool_GUID = "7d8805a0-2ea7-11d1-b1cc-00aa00ba3258"
  IID_IObjPool = LibC::GUID.new(0x7d8805a0_u32, 0x2ea7_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xcc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
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

  ITransactionProperty_GUID = "788ea814-87b1-11d1-bba6-00c04fc2fa5f"
  IID_ITransactionProperty = LibC::GUID.new(0x788ea814_u32, 0x87b1_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xa6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xfa_u8, 0x5f_u8])
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
  def query_interface(this : ICOMAdminCatalog*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICOMAdminCatalog*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICOMAdminCatalog*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICOMAdminCatalog*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICOMAdminCatalog*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICOMAdminCatalog*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICOMAdminCatalog*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_collection(this : ICOMAdminCatalog*, bstrcollname : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.call(this, bstrcollname, ppcatalogcollection)
  end
  def connect(this : ICOMAdminCatalog*, bstrcatalogservername : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.connect.call(this, bstrcatalogservername, ppcatalogcollection)
  end
  def get_major_version(this : ICOMAdminCatalog*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, plmajorversion)
  end
  def get_minor_version(this : ICOMAdminCatalog*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, plminorversion)
  end
  def get_collection_by_query(this : ICOMAdminCatalog*, bstrcollname : UInt8*, ppsavarquery : SAFEARRAY**, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection_by_query.call(this, bstrcollname, ppsavarquery, ppcatalogcollection)
  end
  def import_component(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, bstrclsidorprogid : UInt8*) : HRESULT
    @lpVtbl.value.import_component.call(this, bstrapplidorname, bstrclsidorprogid)
  end
  def install_component(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_component.call(this, bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def shutdown_application(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_application.call(this, bstrapplidorname)
  end
  def export_application(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, bstrapplicationfile : UInt8*, loptions : COMAdminApplicationExportOptions) : HRESULT
    @lpVtbl.value.export_application.call(this, bstrapplidorname, bstrapplicationfile, loptions)
  end
  def install_application(this : ICOMAdminCatalog*, bstrapplicationfile : UInt8*, bstrdestinationdirectory : UInt8*, loptions : COMAdminApplicationInstallOptions, bstruserid : UInt8*, bstrpassword : UInt8*, bstrrsn : UInt8*) : HRESULT
    @lpVtbl.value.install_application.call(this, bstrapplicationfile, bstrdestinationdirectory, loptions, bstruserid, bstrpassword, bstrrsn)
  end
  def stop_router(this : ICOMAdminCatalog*) : HRESULT
    @lpVtbl.value.stop_router.call(this)
  end
  def refresh_router(this : ICOMAdminCatalog*) : HRESULT
    @lpVtbl.value.refresh_router.call(this)
  end
  def start_router(this : ICOMAdminCatalog*) : HRESULT
    @lpVtbl.value.start_router.call(this)
  end
  def reserved1(this : ICOMAdminCatalog*) : HRESULT
    @lpVtbl.value.reserved1.call(this)
  end
  def reserved2(this : ICOMAdminCatalog*) : HRESULT
    @lpVtbl.value.reserved2.call(this)
  end
  def install_multiple_components(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_components.call(this, bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def get_multiple_components_info(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**, ppsavarclassnames : SAFEARRAY**, ppsavarfileflags : SAFEARRAY**, ppsavarcomponentflags : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_multiple_components_info.call(this, bstrapplidorname, ppsavarfilenames, ppsavarclsids, ppsavarclassnames, ppsavarfileflags, ppsavarcomponentflags)
  end
  def refresh_components(this : ICOMAdminCatalog*) : HRESULT
    @lpVtbl.value.refresh_components.call(this)
  end
  def backup_regdb(this : ICOMAdminCatalog*, bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.backup_regdb.call(this, bstrbackupfilepath)
  end
  def restore_regdb(this : ICOMAdminCatalog*, bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.restore_regdb.call(this, bstrbackupfilepath)
  end
  def query_application_file(this : ICOMAdminCatalog*, bstrapplicationfile : UInt8*, pbstrapplicationname : UInt8**, pbstrapplicationdescription : UInt8**, pbhasusers : Int16*, pbisproxy : Int16*, ppsavarfilenames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.query_application_file.call(this, bstrapplicationfile, pbstrapplicationname, pbstrapplicationdescription, pbhasusers, pbisproxy, ppsavarfilenames)
  end
  def start_application(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.start_application.call(this, bstrapplidorname)
  end
  def service_check(this : ICOMAdminCatalog*, lservice : Int32, plstatus : Int32*) : HRESULT
    @lpVtbl.value.service_check.call(this, lservice, plstatus)
  end
  def install_multiple_event_classes(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_event_classes.call(this, bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def install_event_class(this : ICOMAdminCatalog*, bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_event_class.call(this, bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def get_event_classes_for_iid(this : ICOMAdminCatalog*, bstriid : UInt8*, ppsavarclsids : SAFEARRAY**, ppsavarprogids : SAFEARRAY**, ppsavardescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_event_classes_for_iid.call(this, bstriid, ppsavarclsids, ppsavarprogids, ppsavardescriptions)
  end
end
struct LibWin32::ICOMAdminCatalog2
  def query_interface(this : ICOMAdminCatalog2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICOMAdminCatalog2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICOMAdminCatalog2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICOMAdminCatalog2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICOMAdminCatalog2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICOMAdminCatalog2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICOMAdminCatalog2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_collection(this : ICOMAdminCatalog2*, bstrcollname : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.call(this, bstrcollname, ppcatalogcollection)
  end
  def connect(this : ICOMAdminCatalog2*, bstrcatalogservername : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.connect.call(this, bstrcatalogservername, ppcatalogcollection)
  end
  def get_major_version(this : ICOMAdminCatalog2*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, plmajorversion)
  end
  def get_minor_version(this : ICOMAdminCatalog2*, plminorversion : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, plminorversion)
  end
  def get_collection_by_query(this : ICOMAdminCatalog2*, bstrcollname : UInt8*, ppsavarquery : SAFEARRAY**, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection_by_query.call(this, bstrcollname, ppsavarquery, ppcatalogcollection)
  end
  def import_component(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, bstrclsidorprogid : UInt8*) : HRESULT
    @lpVtbl.value.import_component.call(this, bstrapplidorname, bstrclsidorprogid)
  end
  def install_component(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_component.call(this, bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def shutdown_application(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_application.call(this, bstrapplidorname)
  end
  def export_application(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, bstrapplicationfile : UInt8*, loptions : COMAdminApplicationExportOptions) : HRESULT
    @lpVtbl.value.export_application.call(this, bstrapplidorname, bstrapplicationfile, loptions)
  end
  def install_application(this : ICOMAdminCatalog2*, bstrapplicationfile : UInt8*, bstrdestinationdirectory : UInt8*, loptions : COMAdminApplicationInstallOptions, bstruserid : UInt8*, bstrpassword : UInt8*, bstrrsn : UInt8*) : HRESULT
    @lpVtbl.value.install_application.call(this, bstrapplicationfile, bstrdestinationdirectory, loptions, bstruserid, bstrpassword, bstrrsn)
  end
  def stop_router(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.stop_router.call(this)
  end
  def refresh_router(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.refresh_router.call(this)
  end
  def start_router(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.start_router.call(this)
  end
  def reserved1(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.reserved1.call(this)
  end
  def reserved2(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.reserved2.call(this)
  end
  def install_multiple_components(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_components.call(this, bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def get_multiple_components_info(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**, ppsavarclassnames : SAFEARRAY**, ppsavarfileflags : SAFEARRAY**, ppsavarcomponentflags : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_multiple_components_info.call(this, bstrapplidorname, ppsavarfilenames, ppsavarclsids, ppsavarclassnames, ppsavarfileflags, ppsavarcomponentflags)
  end
  def refresh_components(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.refresh_components.call(this)
  end
  def backup_regdb(this : ICOMAdminCatalog2*, bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.backup_regdb.call(this, bstrbackupfilepath)
  end
  def restore_regdb(this : ICOMAdminCatalog2*, bstrbackupfilepath : UInt8*) : HRESULT
    @lpVtbl.value.restore_regdb.call(this, bstrbackupfilepath)
  end
  def query_application_file(this : ICOMAdminCatalog2*, bstrapplicationfile : UInt8*, pbstrapplicationname : UInt8**, pbstrapplicationdescription : UInt8**, pbhasusers : Int16*, pbisproxy : Int16*, ppsavarfilenames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.query_application_file.call(this, bstrapplicationfile, pbstrapplicationname, pbstrapplicationdescription, pbhasusers, pbisproxy, ppsavarfilenames)
  end
  def start_application(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*) : HRESULT
    @lpVtbl.value.start_application.call(this, bstrapplidorname)
  end
  def service_check(this : ICOMAdminCatalog2*, lservice : Int32, plstatus : Int32*) : HRESULT
    @lpVtbl.value.service_check.call(this, lservice, plstatus)
  end
  def install_multiple_event_classes(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, ppsavarfilenames : SAFEARRAY**, ppsavarclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.install_multiple_event_classes.call(this, bstrapplidorname, ppsavarfilenames, ppsavarclsids)
  end
  def install_event_class(this : ICOMAdminCatalog2*, bstrapplidorname : UInt8*, bstrdll : UInt8*, bstrtlb : UInt8*, bstrpsdll : UInt8*) : HRESULT
    @lpVtbl.value.install_event_class.call(this, bstrapplidorname, bstrdll, bstrtlb, bstrpsdll)
  end
  def get_event_classes_for_iid(this : ICOMAdminCatalog2*, bstriid : UInt8*, ppsavarclsids : SAFEARRAY**, ppsavarprogids : SAFEARRAY**, ppsavardescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_event_classes_for_iid.call(this, bstriid, ppsavarclsids, ppsavarprogids, ppsavardescriptions)
  end
  def get_collection_by_query2(this : ICOMAdminCatalog2*, bstrcollectionname : UInt8*, pvarquerystrings : VARIANT*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection_by_query2.call(this, bstrcollectionname, pvarquerystrings, ppcatalogcollection)
  end
  def get_application_instance_id_from_process_id(this : ICOMAdminCatalog2*, lprocessid : Int32, pbstrapplicationinstanceid : UInt8**) : HRESULT
    @lpVtbl.value.get_application_instance_id_from_process_id.call(this, lprocessid, pbstrapplicationinstanceid)
  end
  def shutdown_application_instances(this : ICOMAdminCatalog2*, pvarapplicationinstanceid : VARIANT*) : HRESULT
    @lpVtbl.value.shutdown_application_instances.call(this, pvarapplicationinstanceid)
  end
  def pause_application_instances(this : ICOMAdminCatalog2*, pvarapplicationinstanceid : VARIANT*) : HRESULT
    @lpVtbl.value.pause_application_instances.call(this, pvarapplicationinstanceid)
  end
  def resume_application_instances(this : ICOMAdminCatalog2*, pvarapplicationinstanceid : VARIANT*) : HRESULT
    @lpVtbl.value.resume_application_instances.call(this, pvarapplicationinstanceid)
  end
  def recycle_application_instances(this : ICOMAdminCatalog2*, pvarapplicationinstanceid : VARIANT*, lreasoncode : Int32) : HRESULT
    @lpVtbl.value.recycle_application_instances.call(this, pvarapplicationinstanceid, lreasoncode)
  end
  def are_application_instances_paused(this : ICOMAdminCatalog2*, pvarapplicationinstanceid : VARIANT*, pvarboolpaused : Int16*) : HRESULT
    @lpVtbl.value.are_application_instances_paused.call(this, pvarapplicationinstanceid, pvarboolpaused)
  end
  def dump_application_instance(this : ICOMAdminCatalog2*, bstrapplicationinstanceid : UInt8*, bstrdirectory : UInt8*, lmaximages : Int32, pbstrdumpfile : UInt8**) : HRESULT
    @lpVtbl.value.dump_application_instance.call(this, bstrapplicationinstanceid, bstrdirectory, lmaximages, pbstrdumpfile)
  end
  def get_is_application_instance_dump_supported(this : ICOMAdminCatalog2*, pvarbooldumpsupported : Int16*) : HRESULT
    @lpVtbl.value.get_is_application_instance_dump_supported.call(this, pvarbooldumpsupported)
  end
  def create_service_for_application(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*, bstrservicename : UInt8*, bstrstarttype : UInt8*, bstrerrorcontrol : UInt8*, bstrdependencies : UInt8*, bstrrunas : UInt8*, bstrpassword : UInt8*, bdesktopok : Int16) : HRESULT
    @lpVtbl.value.create_service_for_application.call(this, bstrapplicationidorname, bstrservicename, bstrstarttype, bstrerrorcontrol, bstrdependencies, bstrrunas, bstrpassword, bdesktopok)
  end
  def delete_service_for_application(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*) : HRESULT
    @lpVtbl.value.delete_service_for_application.call(this, bstrapplicationidorname)
  end
  def get_partition_id(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*, pbstrpartitionid : UInt8**) : HRESULT
    @lpVtbl.value.get_partition_id.call(this, bstrapplicationidorname, pbstrpartitionid)
  end
  def get_partition_name(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*, pbstrpartitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_partition_name.call(this, bstrapplicationidorname, pbstrpartitionname)
  end
  def put_current_partition(this : ICOMAdminCatalog2*, bstrpartitionidorname : UInt8*) : HRESULT
    @lpVtbl.value.put_current_partition.call(this, bstrpartitionidorname)
  end
  def get_current_partition_id(this : ICOMAdminCatalog2*, pbstrpartitionid : UInt8**) : HRESULT
    @lpVtbl.value.get_current_partition_id.call(this, pbstrpartitionid)
  end
  def get_current_partition_name(this : ICOMAdminCatalog2*, pbstrpartitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_current_partition_name.call(this, pbstrpartitionname)
  end
  def get_global_partition_id(this : ICOMAdminCatalog2*, pbstrglobalpartitionid : UInt8**) : HRESULT
    @lpVtbl.value.get_global_partition_id.call(this, pbstrglobalpartitionid)
  end
  def flush_partition_cache(this : ICOMAdminCatalog2*) : HRESULT
    @lpVtbl.value.flush_partition_cache.call(this)
  end
  def copy_applications(this : ICOMAdminCatalog2*, bstrsourcepartitionidorname : UInt8*, pvarapplicationid : VARIANT*, bstrdestinationpartitionidorname : UInt8*) : HRESULT
    @lpVtbl.value.copy_applications.call(this, bstrsourcepartitionidorname, pvarapplicationid, bstrdestinationpartitionidorname)
  end
  def copy_components(this : ICOMAdminCatalog2*, bstrsourceapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, bstrdestinationapplicationidorname : UInt8*) : HRESULT
    @lpVtbl.value.copy_components.call(this, bstrsourceapplicationidorname, pvarclsidorprogid, bstrdestinationapplicationidorname)
  end
  def move_components(this : ICOMAdminCatalog2*, bstrsourceapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, bstrdestinationapplicationidorname : UInt8*) : HRESULT
    @lpVtbl.value.move_components.call(this, bstrsourceapplicationidorname, pvarclsidorprogid, bstrdestinationapplicationidorname)
  end
  def alias_component(this : ICOMAdminCatalog2*, bstrsrcapplicationidorname : UInt8*, bstrclsidorprogid : UInt8*, bstrdestapplicationidorname : UInt8*, bstrnewprogid : UInt8*, bstrnewclsid : UInt8*) : HRESULT
    @lpVtbl.value.alias_component.call(this, bstrsrcapplicationidorname, bstrclsidorprogid, bstrdestapplicationidorname, bstrnewprogid, bstrnewclsid)
  end
  def is_safe_to_delete(this : ICOMAdminCatalog2*, bstrdllname : UInt8*, pcomadmininuse : COMAdminInUse*) : HRESULT
    @lpVtbl.value.is_safe_to_delete.call(this, bstrdllname, pcomadmininuse)
  end
  def import_unconfigured_components(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, pvarcomponenttype : VARIANT*) : HRESULT
    @lpVtbl.value.import_unconfigured_components.call(this, bstrapplicationidorname, pvarclsidorprogid, pvarcomponenttype)
  end
  def promote_unconfigured_components(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, pvarcomponenttype : VARIANT*) : HRESULT
    @lpVtbl.value.promote_unconfigured_components.call(this, bstrapplicationidorname, pvarclsidorprogid, pvarcomponenttype)
  end
  def import_components(this : ICOMAdminCatalog2*, bstrapplicationidorname : UInt8*, pvarclsidorprogid : VARIANT*, pvarcomponenttype : VARIANT*) : HRESULT
    @lpVtbl.value.import_components.call(this, bstrapplicationidorname, pvarclsidorprogid, pvarcomponenttype)
  end
  def get_is64_bit_catalog_server(this : ICOMAdminCatalog2*, pbis64bit : Int16*) : HRESULT
    @lpVtbl.value.get_is64_bit_catalog_server.call(this, pbis64bit)
  end
  def export_partition(this : ICOMAdminCatalog2*, bstrpartitionidorname : UInt8*, bstrpartitionfilename : UInt8*, loptions : COMAdminApplicationExportOptions) : HRESULT
    @lpVtbl.value.export_partition.call(this, bstrpartitionidorname, bstrpartitionfilename, loptions)
  end
  def install_partition(this : ICOMAdminCatalog2*, bstrfilename : UInt8*, bstrdestdirectory : UInt8*, loptions : COMAdminApplicationInstallOptions, bstruserid : UInt8*, bstrpassword : UInt8*, bstrrsn : UInt8*) : HRESULT
    @lpVtbl.value.install_partition.call(this, bstrfilename, bstrdestdirectory, loptions, bstruserid, bstrpassword, bstrrsn)
  end
  def query_application_file2(this : ICOMAdminCatalog2*, bstrapplicationfile : UInt8*, ppfilesforimport : IDispatch*) : HRESULT
    @lpVtbl.value.query_application_file2.call(this, bstrapplicationfile, ppfilesforimport)
  end
  def get_component_version_count(this : ICOMAdminCatalog2*, bstrclsidorprogid : UInt8*, plversioncount : Int32*) : HRESULT
    @lpVtbl.value.get_component_version_count.call(this, bstrclsidorprogid, plversioncount)
  end
end
struct LibWin32::ICatalogObject
  def query_interface(this : ICatalogObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICatalogObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICatalogObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICatalogObject*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICatalogObject*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICatalogObject*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICatalogObject*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_value(this : ICatalogObject*, bstrpropname : UInt8*, pvarretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, bstrpropname, pvarretval)
  end
  def put_value(this : ICatalogObject*, bstrpropname : UInt8*, val : VARIANT) : HRESULT
    @lpVtbl.value.put_value.call(this, bstrpropname, val)
  end
  def get_key(this : ICatalogObject*, pvarretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_key.call(this, pvarretval)
  end
  def get_name(this : ICatalogObject*, pvarretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_name.call(this, pvarretval)
  end
  def is_property_read_only(this : ICatalogObject*, bstrpropname : UInt8*, pbretval : Int16*) : HRESULT
    @lpVtbl.value.is_property_read_only.call(this, bstrpropname, pbretval)
  end
  def get_valid(this : ICatalogObject*, pbretval : Int16*) : HRESULT
    @lpVtbl.value.get_valid.call(this, pbretval)
  end
  def is_property_write_only(this : ICatalogObject*, bstrpropname : UInt8*, pbretval : Int16*) : HRESULT
    @lpVtbl.value.is_property_write_only.call(this, bstrpropname, pbretval)
  end
end
struct LibWin32::ICatalogCollection
  def query_interface(this : ICatalogCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICatalogCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICatalogCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICatalogCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICatalogCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICatalogCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICatalogCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : ICatalogCollection*, ppenumvariant : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenumvariant)
  end
  def get_item(this : ICatalogCollection*, lindex : Int32, ppcatalogobject : IDispatch*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, ppcatalogobject)
  end
  def get_count(this : ICatalogCollection*, plobjectcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plobjectcount)
  end
  def remove(this : ICatalogCollection*, lindex : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, lindex)
  end
  def add(this : ICatalogCollection*, ppcatalogobject : IDispatch*) : HRESULT
    @lpVtbl.value.add.call(this, ppcatalogobject)
  end
  def populate(this : ICatalogCollection*) : HRESULT
    @lpVtbl.value.populate.call(this)
  end
  def save_changes(this : ICatalogCollection*, pcchanges : Int32*) : HRESULT
    @lpVtbl.value.save_changes.call(this, pcchanges)
  end
  def get_collection(this : ICatalogCollection*, bstrcollname : UInt8*, varobjectkey : VARIANT, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.call(this, bstrcollname, varobjectkey, ppcatalogcollection)
  end
  def get_name(this : ICatalogCollection*, pvarnamel : VARIANT*) : HRESULT
    @lpVtbl.value.get_name.call(this, pvarnamel)
  end
  def get_add_enabled(this : ICatalogCollection*, pvarbool : Int16*) : HRESULT
    @lpVtbl.value.get_add_enabled.call(this, pvarbool)
  end
  def get_remove_enabled(this : ICatalogCollection*, pvarbool : Int16*) : HRESULT
    @lpVtbl.value.get_remove_enabled.call(this, pvarbool)
  end
  def get_util_interface(this : ICatalogCollection*, ppidispatch : IDispatch*) : HRESULT
    @lpVtbl.value.get_util_interface.call(this, ppidispatch)
  end
  def get_data_store_major_version(this : ICatalogCollection*, plmajorversion : Int32*) : HRESULT
    @lpVtbl.value.get_data_store_major_version.call(this, plmajorversion)
  end
  def get_data_store_minor_version(this : ICatalogCollection*, plminorversionl : Int32*) : HRESULT
    @lpVtbl.value.get_data_store_minor_version.call(this, plminorversionl)
  end
  def populate_by_key(this : ICatalogCollection*, psakeys : SAFEARRAY*) : HRESULT
    @lpVtbl.value.populate_by_key.call(this, psakeys)
  end
  def populate_by_query(this : ICatalogCollection*, bstrquerystring : UInt8*, lquerytype : Int32) : HRESULT
    @lpVtbl.value.populate_by_query.call(this, bstrquerystring, lquerytype)
  end
end
struct LibWin32::ISecurityIdentityColl
  def query_interface(this : ISecurityIdentityColl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityIdentityColl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityIdentityColl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISecurityIdentityColl*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISecurityIdentityColl*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISecurityIdentityColl*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISecurityIdentityColl*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ISecurityIdentityColl*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get_item(this : ISecurityIdentityColl*, name : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, name, pitem)
  end
  def get__new_enum(this : ISecurityIdentityColl*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
end
struct LibWin32::ISecurityCallersColl
  def query_interface(this : ISecurityCallersColl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityCallersColl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityCallersColl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISecurityCallersColl*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISecurityCallersColl*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISecurityCallersColl*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISecurityCallersColl*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ISecurityCallersColl*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get_item(this : ISecurityCallersColl*, lindex : Int32, pobj : ISecurityIdentityColl*) : HRESULT
    @lpVtbl.value.get_item.call(this, lindex, pobj)
  end
  def get__new_enum(this : ISecurityCallersColl*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
end
struct LibWin32::ISecurityCallContext
  def query_interface(this : ISecurityCallContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityCallContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityCallContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISecurityCallContext*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISecurityCallContext*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISecurityCallContext*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISecurityCallContext*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : ISecurityCallContext*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get_item(this : ISecurityCallContext*, name : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, name, pitem)
  end
  def get__new_enum(this : ISecurityCallContext*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
  def is_caller_in_role(this : ISecurityCallContext*, bstrrole : UInt8*, pfinrole : Int16*) : HRESULT
    @lpVtbl.value.is_caller_in_role.call(this, bstrrole, pfinrole)
  end
  def is_security_enabled(this : ISecurityCallContext*, pfisenabled : Int16*) : HRESULT
    @lpVtbl.value.is_security_enabled.call(this, pfisenabled)
  end
  def is_user_in_role(this : ISecurityCallContext*, puser : VARIANT*, bstrrole : UInt8*, pfinrole : Int16*) : HRESULT
    @lpVtbl.value.is_user_in_role.call(this, puser, bstrrole, pfinrole)
  end
end
struct LibWin32::IGetSecurityCallContext
  def query_interface(this : IGetSecurityCallContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGetSecurityCallContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGetSecurityCallContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IGetSecurityCallContext*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IGetSecurityCallContext*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IGetSecurityCallContext*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IGetSecurityCallContext*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_security_call_context(this : IGetSecurityCallContext*, ppobject : ISecurityCallContext*) : HRESULT
    @lpVtbl.value.get_security_call_context.call(this, ppobject)
  end
end
struct LibWin32::SecurityProperty
  def query_interface(this : SecurityProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : SecurityProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : SecurityProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : SecurityProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : SecurityProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : SecurityProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : SecurityProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_direct_caller_name(this : SecurityProperty*, bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_direct_caller_name.call(this, bstrusername)
  end
  def get_direct_creator_name(this : SecurityProperty*, bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_direct_creator_name.call(this, bstrusername)
  end
  def get_original_caller_name(this : SecurityProperty*, bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_original_caller_name.call(this, bstrusername)
  end
  def get_original_creator_name(this : SecurityProperty*, bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_original_creator_name.call(this, bstrusername)
  end
end
struct LibWin32::ContextInfo
  def query_interface(this : ContextInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ContextInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ContextInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ContextInfo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ContextInfo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ContextInfo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ContextInfo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def is_in_transaction(this : ContextInfo*, pbisintx : Int16*) : HRESULT
    @lpVtbl.value.is_in_transaction.call(this, pbisintx)
  end
  def get_transaction(this : ContextInfo*, pptx : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pptx)
  end
  def get_transaction_id(this : ContextInfo*, pbstrtxid : UInt8**) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pbstrtxid)
  end
  def get_activity_id(this : ContextInfo*, pbstractivityid : UInt8**) : HRESULT
    @lpVtbl.value.get_activity_id.call(this, pbstractivityid)
  end
  def get_context_id(this : ContextInfo*, pbstrctxid : UInt8**) : HRESULT
    @lpVtbl.value.get_context_id.call(this, pbstrctxid)
  end
end
struct LibWin32::ContextInfo2
  def query_interface(this : ContextInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ContextInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ContextInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ContextInfo2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ContextInfo2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ContextInfo2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ContextInfo2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def is_in_transaction(this : ContextInfo2*, pbisintx : Int16*) : HRESULT
    @lpVtbl.value.is_in_transaction.call(this, pbisintx)
  end
  def get_transaction(this : ContextInfo2*, pptx : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pptx)
  end
  def get_transaction_id(this : ContextInfo2*, pbstrtxid : UInt8**) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pbstrtxid)
  end
  def get_activity_id(this : ContextInfo2*, pbstractivityid : UInt8**) : HRESULT
    @lpVtbl.value.get_activity_id.call(this, pbstractivityid)
  end
  def get_context_id(this : ContextInfo2*, pbstrctxid : UInt8**) : HRESULT
    @lpVtbl.value.get_context_id.call(this, pbstrctxid)
  end
  def get_partition_id(this : ContextInfo2*, midl__contextinfo20000 : UInt8**) : HRESULT
    @lpVtbl.value.get_partition_id.call(this, midl__contextinfo20000)
  end
  def get_application_id(this : ContextInfo2*, midl__contextinfo20001 : UInt8**) : HRESULT
    @lpVtbl.value.get_application_id.call(this, midl__contextinfo20001)
  end
  def get_application_instance_id(this : ContextInfo2*, midl__contextinfo20002 : UInt8**) : HRESULT
    @lpVtbl.value.get_application_instance_id.call(this, midl__contextinfo20002)
  end
end
struct LibWin32::ObjectContext
  def query_interface(this : ObjectContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ObjectContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ObjectContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ObjectContext*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ObjectContext*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ObjectContext*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ObjectContext*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_instance(this : ObjectContext*, bstrprogid : UInt8*, pobject : VARIANT*) : HRESULT
    @lpVtbl.value.create_instance.call(this, bstrprogid, pobject)
  end
  def set_complete(this : ObjectContext*) : HRESULT
    @lpVtbl.value.set_complete.call(this)
  end
  def set_abort(this : ObjectContext*) : HRESULT
    @lpVtbl.value.set_abort.call(this)
  end
  def enable_commit(this : ObjectContext*) : HRESULT
    @lpVtbl.value.enable_commit.call(this)
  end
  def disable_commit(this : ObjectContext*) : HRESULT
    @lpVtbl.value.disable_commit.call(this)
  end
  def is_in_transaction(this : ObjectContext*, pbisintx : Int16*) : HRESULT
    @lpVtbl.value.is_in_transaction.call(this, pbisintx)
  end
  def is_security_enabled(this : ObjectContext*, pbisenabled : Int16*) : HRESULT
    @lpVtbl.value.is_security_enabled.call(this, pbisenabled)
  end
  def is_caller_in_role(this : ObjectContext*, bstrrole : UInt8*, pbinrole : Int16*) : HRESULT
    @lpVtbl.value.is_caller_in_role.call(this, bstrrole, pbinrole)
  end
  def get_count(this : ObjectContext*, plcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, plcount)
  end
  def get_item(this : ObjectContext*, name : UInt8*, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, name, pitem)
  end
  def get__new_enum(this : ObjectContext*, ppenum : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, ppenum)
  end
  def get_security(this : ObjectContext*, ppsecurityproperty : SecurityProperty*) : HRESULT
    @lpVtbl.value.get_security.call(this, ppsecurityproperty)
  end
  def get_context_info(this : ObjectContext*, ppcontextinfo : ContextInfo*) : HRESULT
    @lpVtbl.value.get_context_info.call(this, ppcontextinfo)
  end
end
struct LibWin32::ITransactionContextEx
  def query_interface(this : ITransactionContextEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionContextEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionContextEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_instance(this : ITransactionContextEx*, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, rclsid, riid, pobject)
  end
  def commit(this : ITransactionContextEx*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def abort(this : ITransactionContextEx*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
end
struct LibWin32::ITransactionContext
  def query_interface(this : ITransactionContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ITransactionContext*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ITransactionContext*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ITransactionContext*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ITransactionContext*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_instance(this : ITransactionContext*, pszprogid : UInt8*, pobject : VARIANT*) : HRESULT
    @lpVtbl.value.create_instance.call(this, pszprogid, pobject)
  end
  def commit(this : ITransactionContext*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def abort(this : ITransactionContext*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
end
struct LibWin32::ICreateWithTransactionEx
  def query_interface(this : ICreateWithTransactionEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICreateWithTransactionEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICreateWithTransactionEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_instance(this : ICreateWithTransactionEx*, ptransaction : ITransaction, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, ptransaction, rclsid, riid, pobject)
  end
end
struct LibWin32::ICreateWithLocalTransaction
  def query_interface(this : ICreateWithLocalTransaction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICreateWithLocalTransaction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICreateWithLocalTransaction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_instance_with_sys_tx(this : ICreateWithLocalTransaction*, ptransaction : IUnknown, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance_with_sys_tx.call(this, ptransaction, rclsid, riid, pobject)
  end
end
struct LibWin32::ICreateWithTipTransactionEx
  def query_interface(this : ICreateWithTipTransactionEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICreateWithTipTransactionEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICreateWithTipTransactionEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_instance(this : ICreateWithTipTransactionEx*, bstrtipurl : UInt8*, rclsid : Guid*, riid : Guid*, pobject : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, bstrtipurl, rclsid, riid, pobject)
  end
end
struct LibWin32::IComLTxEvents
  def query_interface(this : IComLTxEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComLTxEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComLTxEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_ltx_transaction_start(this : IComLTxEvents*, pinfo : COMSVCSEVENTINFO*, guidltx : Guid, tsid : Guid, froot : LibC::BOOL, nisolationlevel : Int32) : HRESULT
    @lpVtbl.value.on_ltx_transaction_start.call(this, pinfo, guidltx, tsid, froot, nisolationlevel)
  end
  def on_ltx_transaction_prepare(this : IComLTxEvents*, pinfo : COMSVCSEVENTINFO*, guidltx : Guid, fvote : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_ltx_transaction_prepare.call(this, pinfo, guidltx, fvote)
  end
  def on_ltx_transaction_abort(this : IComLTxEvents*, pinfo : COMSVCSEVENTINFO*, guidltx : Guid) : HRESULT
    @lpVtbl.value.on_ltx_transaction_abort.call(this, pinfo, guidltx)
  end
  def on_ltx_transaction_commit(this : IComLTxEvents*, pinfo : COMSVCSEVENTINFO*, guidltx : Guid) : HRESULT
    @lpVtbl.value.on_ltx_transaction_commit.call(this, pinfo, guidltx)
  end
  def on_ltx_transaction_promote(this : IComLTxEvents*, pinfo : COMSVCSEVENTINFO*, guidltx : Guid, txnid : Guid) : HRESULT
    @lpVtbl.value.on_ltx_transaction_promote.call(this, pinfo, guidltx, txnid)
  end
end
struct LibWin32::IComUserEvent
  def query_interface(this : IComUserEvent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComUserEvent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComUserEvent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_user_event(this : IComUserEvent*, pinfo : COMSVCSEVENTINFO*, pvarevent : VARIANT*) : HRESULT
    @lpVtbl.value.on_user_event.call(this, pinfo, pvarevent)
  end
end
struct LibWin32::IComThreadEvents
  def query_interface(this : IComThreadEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComThreadEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComThreadEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_thread_start(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, dwthread : UInt32, dwtheadcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_start.call(this, pinfo, threadid, dwthread, dwtheadcnt)
  end
  def on_thread_terminate(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, dwthread : UInt32, dwtheadcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_terminate.call(this, pinfo, threadid, dwthread, dwtheadcnt)
  end
  def on_thread_bind_to_apartment(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, aptid : UInt64, dwactcnt : UInt32, dwlowcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_bind_to_apartment.call(this, pinfo, threadid, aptid, dwactcnt, dwlowcnt)
  end
  def on_thread_un_bind(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, aptid : UInt64, dwactcnt : UInt32) : HRESULT
    @lpVtbl.value.on_thread_un_bind.call(this, pinfo, threadid, aptid, dwactcnt)
  end
  def on_thread_work_enque(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32) : HRESULT
    @lpVtbl.value.on_thread_work_enque.call(this, pinfo, threadid, msgworkid, queuelen)
  end
  def on_thread_work_private(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64) : HRESULT
    @lpVtbl.value.on_thread_work_private.call(this, pinfo, threadid, msgworkid)
  end
  def on_thread_work_public(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32) : HRESULT
    @lpVtbl.value.on_thread_work_public.call(this, pinfo, threadid, msgworkid, queuelen)
  end
  def on_thread_work_redirect(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32, threadnum : UInt64) : HRESULT
    @lpVtbl.value.on_thread_work_redirect.call(this, pinfo, threadid, msgworkid, queuelen, threadnum)
  end
  def on_thread_work_reject(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, threadid : UInt64, msgworkid : UInt64, queuelen : UInt32) : HRESULT
    @lpVtbl.value.on_thread_work_reject.call(this, pinfo, threadid, msgworkid, queuelen)
  end
  def on_thread_assign_apartment(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, aptid : UInt64) : HRESULT
    @lpVtbl.value.on_thread_assign_apartment.call(this, pinfo, guidactivity, aptid)
  end
  def on_thread_unassign_apartment(this : IComThreadEvents*, pinfo : COMSVCSEVENTINFO*, aptid : UInt64) : HRESULT
    @lpVtbl.value.on_thread_unassign_apartment.call(this, pinfo, aptid)
  end
end
struct LibWin32::IComAppEvents
  def query_interface(this : IComAppEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComAppEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComAppEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_app_activation(this : IComAppEvents*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_activation.call(this, pinfo, guidapp)
  end
  def on_app_shutdown(this : IComAppEvents*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_shutdown.call(this, pinfo, guidapp)
  end
  def on_app_force_shutdown(this : IComAppEvents*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_force_shutdown.call(this, pinfo, guidapp)
  end
end
struct LibWin32::IComInstanceEvents
  def query_interface(this : IComInstanceEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComInstanceEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComInstanceEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_object_create(this : IComInstanceEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, clsid : Guid*, tsid : Guid*, ctxtid : UInt64, objectid : UInt64) : HRESULT
    @lpVtbl.value.on_object_create.call(this, pinfo, guidactivity, clsid, tsid, ctxtid, objectid)
  end
  def on_object_destroy(this : IComInstanceEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_object_destroy.call(this, pinfo, ctxtid)
  end
end
struct LibWin32::IComTransactionEvents
  def query_interface(this : IComTransactionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComTransactionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComTransactionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_transaction_start(this : IComTransactionEvents*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, tsid : Guid*, froot : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_transaction_start.call(this, pinfo, guidtx, tsid, froot)
  end
  def on_transaction_prepare(this : IComTransactionEvents*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, fvoteyes : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_transaction_prepare.call(this, pinfo, guidtx, fvoteyes)
  end
  def on_transaction_abort(this : IComTransactionEvents*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_abort.call(this, pinfo, guidtx)
  end
  def on_transaction_commit(this : IComTransactionEvents*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_commit.call(this, pinfo, guidtx)
  end
end
struct LibWin32::IComMethodEvents
  def query_interface(this : IComMethodEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComMethodEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComMethodEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_method_call(this : IComMethodEvents*, pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_call.call(this, pinfo, oid, guidcid, guidrid, imeth)
  end
  def on_method_return(this : IComMethodEvents*, pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, imeth : UInt32, hresult : HRESULT) : HRESULT
    @lpVtbl.value.on_method_return.call(this, pinfo, oid, guidcid, guidrid, imeth, hresult)
  end
  def on_method_exception(this : IComMethodEvents*, pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_exception.call(this, pinfo, oid, guidcid, guidrid, imeth)
  end
end
struct LibWin32::IComObjectEvents
  def query_interface(this : IComObjectEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComObjectEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComObjectEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_object_activate(this : IComObjectEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64, objectid : UInt64) : HRESULT
    @lpVtbl.value.on_object_activate.call(this, pinfo, ctxtid, objectid)
  end
  def on_object_deactivate(this : IComObjectEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64, objectid : UInt64) : HRESULT
    @lpVtbl.value.on_object_deactivate.call(this, pinfo, ctxtid, objectid)
  end
  def on_disable_commit(this : IComObjectEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_disable_commit.call(this, pinfo, ctxtid)
  end
  def on_enable_commit(this : IComObjectEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_enable_commit.call(this, pinfo, ctxtid)
  end
  def on_set_complete(this : IComObjectEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_set_complete.call(this, pinfo, ctxtid)
  end
  def on_set_abort(this : IComObjectEvents*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_set_abort.call(this, pinfo, ctxtid)
  end
end
struct LibWin32::IComResourceEvents
  def query_interface(this : IComResourceEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComResourceEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComResourceEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_resource_create(this : IComResourceEvents*, pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64, enlisted : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_resource_create.call(this, pinfo, objectid, psztype, resid, enlisted)
  end
  def on_resource_allocate(this : IComResourceEvents*, pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64, enlisted : LibC::BOOL, numrated : UInt32, rating : UInt32) : HRESULT
    @lpVtbl.value.on_resource_allocate.call(this, pinfo, objectid, psztype, resid, enlisted, numrated, rating)
  end
  def on_resource_recycle(this : IComResourceEvents*, pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64) : HRESULT
    @lpVtbl.value.on_resource_recycle.call(this, pinfo, objectid, psztype, resid)
  end
  def on_resource_destroy(this : IComResourceEvents*, pinfo : COMSVCSEVENTINFO*, objectid : UInt64, hr : HRESULT, psztype : LibC::LPWSTR, resid : UInt64) : HRESULT
    @lpVtbl.value.on_resource_destroy.call(this, pinfo, objectid, hr, psztype, resid)
  end
  def on_resource_track(this : IComResourceEvents*, pinfo : COMSVCSEVENTINFO*, objectid : UInt64, psztype : LibC::LPWSTR, resid : UInt64, enlisted : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_resource_track.call(this, pinfo, objectid, psztype, resid, enlisted)
  end
end
struct LibWin32::IComSecurityEvents
  def query_interface(this : IComSecurityEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComSecurityEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComSecurityEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_authenticate(this : IComSecurityEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, objectid : UInt64, guidiid : Guid*, imeth : UInt32, cbbyteorig : UInt32, psidoriginaluser : UInt8*, cbbytecur : UInt32, psidcurrentuser : UInt8*, bcurrentuserinpersonatinginproc : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_authenticate.call(this, pinfo, guidactivity, objectid, guidiid, imeth, cbbyteorig, psidoriginaluser, cbbytecur, psidcurrentuser, bcurrentuserinpersonatinginproc)
  end
  def on_authenticate_fail(this : IComSecurityEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, objectid : UInt64, guidiid : Guid*, imeth : UInt32, cbbyteorig : UInt32, psidoriginaluser : UInt8*, cbbytecur : UInt32, psidcurrentuser : UInt8*, bcurrentuserinpersonatinginproc : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_authenticate_fail.call(this, pinfo, guidactivity, objectid, guidiid, imeth, cbbyteorig, psidoriginaluser, cbbytecur, psidcurrentuser, bcurrentuserinpersonatinginproc)
  end
end
struct LibWin32::IComObjectPoolEvents
  def query_interface(this : IComObjectPoolEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComObjectPoolEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComObjectPoolEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_obj_pool_put_object(this : IComObjectPoolEvents*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, nreason : Int32, dwavailable : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_put_object.call(this, pinfo, guidobject, nreason, dwavailable, oid)
  end
  def on_obj_pool_get_object(this : IComObjectPoolEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, dwavailable : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_get_object.call(this, pinfo, guidactivity, guidobject, dwavailable, oid)
  end
  def on_obj_pool_recycle_to_tx(this : IComObjectPoolEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_recycle_to_tx.call(this, pinfo, guidactivity, guidobject, guidtx, objid)
  end
  def on_obj_pool_get_from_tx(this : IComObjectPoolEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_get_from_tx.call(this, pinfo, guidactivity, guidobject, guidtx, objid)
  end
end
struct LibWin32::IComObjectPoolEvents2
  def query_interface(this : IComObjectPoolEvents2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComObjectPoolEvents2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComObjectPoolEvents2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_obj_pool_create_object(this : IComObjectPoolEvents2*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, dwobjscreated : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_create_object.call(this, pinfo, guidobject, dwobjscreated, oid)
  end
  def on_obj_pool_destroy_object(this : IComObjectPoolEvents2*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, dwobjscreated : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_destroy_object.call(this, pinfo, guidobject, dwobjscreated, oid)
  end
  def on_obj_pool_create_decision(this : IComObjectPoolEvents2*, pinfo : COMSVCSEVENTINFO*, dwthreadswaiting : UInt32, dwavail : UInt32, dwcreated : UInt32, dwmin : UInt32, dwmax : UInt32) : HRESULT
    @lpVtbl.value.on_obj_pool_create_decision.call(this, pinfo, dwthreadswaiting, dwavail, dwcreated, dwmin, dwmax)
  end
  def on_obj_pool_timeout(this : IComObjectPoolEvents2*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, guidactivity : Guid*, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.on_obj_pool_timeout.call(this, pinfo, guidobject, guidactivity, dwtimeout)
  end
  def on_obj_pool_create_pool(this : IComObjectPoolEvents2*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, dwmin : UInt32, dwmax : UInt32, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.on_obj_pool_create_pool.call(this, pinfo, guidobject, dwmin, dwmax, dwtimeout)
  end
end
struct LibWin32::IComObjectConstructionEvents
  def query_interface(this : IComObjectConstructionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComObjectConstructionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComObjectConstructionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_object_construct(this : IComObjectConstructionEvents*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, sconstructstring : LibC::LPWSTR, oid : UInt64) : HRESULT
    @lpVtbl.value.on_object_construct.call(this, pinfo, guidobject, sconstructstring, oid)
  end
end
struct LibWin32::IComActivityEvents
  def query_interface(this : IComActivityEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComActivityEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComActivityEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_activity_create(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*) : HRESULT
    @lpVtbl.value.on_activity_create.call(this, pinfo, guidactivity)
  end
  def on_activity_destroy(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*) : HRESULT
    @lpVtbl.value.on_activity_destroy.call(this, pinfo, guidactivity)
  end
  def on_activity_enter(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, guidentered : Guid*, dwthread : UInt32) : HRESULT
    @lpVtbl.value.on_activity_enter.call(this, pinfo, guidcurrent, guidentered, dwthread)
  end
  def on_activity_timeout(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, guidentered : Guid*, dwthread : UInt32, dwtimeout : UInt32) : HRESULT
    @lpVtbl.value.on_activity_timeout.call(this, pinfo, guidcurrent, guidentered, dwthread, dwtimeout)
  end
  def on_activity_reenter(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, dwthread : UInt32, dwcalldepth : UInt32) : HRESULT
    @lpVtbl.value.on_activity_reenter.call(this, pinfo, guidcurrent, dwthread, dwcalldepth)
  end
  def on_activity_leave(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, guidleft : Guid*) : HRESULT
    @lpVtbl.value.on_activity_leave.call(this, pinfo, guidcurrent, guidleft)
  end
  def on_activity_leave_same(this : IComActivityEvents*, pinfo : COMSVCSEVENTINFO*, guidcurrent : Guid*, dwcalldepth : UInt32) : HRESULT
    @lpVtbl.value.on_activity_leave_same.call(this, pinfo, guidcurrent, dwcalldepth)
  end
end
struct LibWin32::IComIdentityEvents
  def query_interface(this : IComIdentityEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComIdentityEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComIdentityEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_iis_request_info(this : IComIdentityEvents*, pinfo : COMSVCSEVENTINFO*, objid : UInt64, pszclientip : LibC::LPWSTR, pszserverip : LibC::LPWSTR, pszurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_iis_request_info.call(this, pinfo, objid, pszclientip, pszserverip, pszurl)
  end
end
struct LibWin32::IComQCEvents
  def query_interface(this : IComQCEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComQCEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComQCEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_qc_record(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, objid : UInt64, szqueue : Char*, guidmsgid : Guid*, guidworkflowid : Guid*, msmqhr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_record.call(this, pinfo, objid, szqueue, guidmsgid, guidworkflowid, msmqhr)
  end
  def on_qc_queue_open(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, szqueue : Char*, queueid : UInt64, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_queue_open.call(this, pinfo, szqueue, queueid, hr)
  end
  def on_qc_receive(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, queueid : UInt64, guidmsgid : Guid*, guidworkflowid : Guid*, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_receive.call(this, pinfo, queueid, guidmsgid, guidworkflowid, hr)
  end
  def on_qc_receive_fail(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, queueid : UInt64, msmqhr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_receive_fail.call(this, pinfo, queueid, msmqhr)
  end
  def on_qc_move_to_re_try_queue(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, guidmsgid : Guid*, guidworkflowid : Guid*, retryindex : UInt32) : HRESULT
    @lpVtbl.value.on_qc_move_to_re_try_queue.call(this, pinfo, guidmsgid, guidworkflowid, retryindex)
  end
  def on_qc_move_to_dead_queue(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, guidmsgid : Guid*, guidworkflowid : Guid*) : HRESULT
    @lpVtbl.value.on_qc_move_to_dead_queue.call(this, pinfo, guidmsgid, guidworkflowid)
  end
  def on_qc_playback(this : IComQCEvents*, pinfo : COMSVCSEVENTINFO*, objid : UInt64, guidmsgid : Guid*, guidworkflowid : Guid*, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_qc_playback.call(this, pinfo, objid, guidmsgid, guidworkflowid, hr)
  end
end
struct LibWin32::IComExceptionEvents
  def query_interface(this : IComExceptionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComExceptionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComExceptionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_exception_user(this : IComExceptionEvents*, pinfo : COMSVCSEVENTINFO*, code : UInt32, address : UInt64, pszstacktrace : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.on_exception_user.call(this, pinfo, code, address, pszstacktrace)
  end
end
struct LibWin32::ILBEvents
  def query_interface(this : ILBEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILBEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILBEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def target_up(this : ILBEvents*, bstrservername : UInt8*, bstrclsideng : UInt8*) : HRESULT
    @lpVtbl.value.target_up.call(this, bstrservername, bstrclsideng)
  end
  def target_down(this : ILBEvents*, bstrservername : UInt8*, bstrclsideng : UInt8*) : HRESULT
    @lpVtbl.value.target_down.call(this, bstrservername, bstrclsideng)
  end
  def engine_defined(this : ILBEvents*, bstrpropname : UInt8*, varpropvalue : VARIANT*, bstrclsideng : UInt8*) : HRESULT
    @lpVtbl.value.engine_defined.call(this, bstrpropname, varpropvalue, bstrclsideng)
  end
end
struct LibWin32::IComCRMEvents
  def query_interface(this : IComCRMEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComCRMEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComCRMEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_crm_recovery_start(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_crm_recovery_start.call(this, pinfo, guidapp)
  end
  def on_crm_recovery_done(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_crm_recovery_done.call(this, pinfo, guidapp)
  end
  def on_crm_checkpoint(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_crm_checkpoint.call(this, pinfo, guidapp)
  end
  def on_crm_begin(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, guidactivity : Guid, guidtx : Guid, szprogidcompensator : Char*, szdescription : Char*) : HRESULT
    @lpVtbl.value.on_crm_begin.call(this, pinfo, guidclerkclsid, guidactivity, guidtx, szprogidcompensator, szdescription)
  end
  def on_crm_prepare(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_prepare.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_commit(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_commit.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_abort(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_abort.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_indoubt(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_indoubt.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_done(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_done.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_release(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_release.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_analyze(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, dwcrmrecordtype : UInt32, dwrecordsize : UInt32) : HRESULT
    @lpVtbl.value.on_crm_analyze.call(this, pinfo, guidclerkclsid, dwcrmrecordtype, dwrecordsize)
  end
  def on_crm_write(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, fvariants : LibC::BOOL, dwrecordsize : UInt32) : HRESULT
    @lpVtbl.value.on_crm_write.call(this, pinfo, guidclerkclsid, fvariants, dwrecordsize)
  end
  def on_crm_forget(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_forget.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_force(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid) : HRESULT
    @lpVtbl.value.on_crm_force.call(this, pinfo, guidclerkclsid)
  end
  def on_crm_deliver(this : IComCRMEvents*, pinfo : COMSVCSEVENTINFO*, guidclerkclsid : Guid, fvariants : LibC::BOOL, dwrecordsize : UInt32) : HRESULT
    @lpVtbl.value.on_crm_deliver.call(this, pinfo, guidclerkclsid, fvariants, dwrecordsize)
  end
end
struct LibWin32::IComMethod2Events
  def query_interface(this : IComMethod2Events*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComMethod2Events*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComMethod2Events*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_method_call2(this : IComMethod2Events*, pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, dwthread : UInt32, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_call2.call(this, pinfo, oid, guidcid, guidrid, dwthread, imeth)
  end
  def on_method_return2(this : IComMethod2Events*, pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, dwthread : UInt32, imeth : UInt32, hresult : HRESULT) : HRESULT
    @lpVtbl.value.on_method_return2.call(this, pinfo, oid, guidcid, guidrid, dwthread, imeth, hresult)
  end
  def on_method_exception2(this : IComMethod2Events*, pinfo : COMSVCSEVENTINFO*, oid : UInt64, guidcid : Guid*, guidrid : Guid*, dwthread : UInt32, imeth : UInt32) : HRESULT
    @lpVtbl.value.on_method_exception2.call(this, pinfo, oid, guidcid, guidrid, dwthread, imeth)
  end
end
struct LibWin32::IComTrackingInfoEvents
  def query_interface(this : IComTrackingInfoEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComTrackingInfoEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComTrackingInfoEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_new_tracking_info(this : IComTrackingInfoEvents*, ptoplevelcollection : IUnknown) : HRESULT
    @lpVtbl.value.on_new_tracking_info.call(this, ptoplevelcollection)
  end
end
struct LibWin32::IComTrackingInfoCollection
  def query_interface(this : IComTrackingInfoCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComTrackingInfoCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComTrackingInfoCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def type(this : IComTrackingInfoCollection*, ptype : TRACKING_COLL_TYPE*) : HRESULT
    @lpVtbl.value.type.call(this, ptype)
  end
  def count(this : IComTrackingInfoCollection*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.count.call(this, pcount)
  end
  def item(this : IComTrackingInfoCollection*, ulindex : UInt32, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.item.call(this, ulindex, riid, ppv)
  end
end
struct LibWin32::IComTrackingInfoObject
  def query_interface(this : IComTrackingInfoObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComTrackingInfoObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComTrackingInfoObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_value(this : IComTrackingInfoObject*, szpropertyname : LibC::LPWSTR, pvarout : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, szpropertyname, pvarout)
  end
end
struct LibWin32::IComTrackingInfoProperties
  def query_interface(this : IComTrackingInfoProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComTrackingInfoProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComTrackingInfoProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def prop_count(this : IComTrackingInfoProperties*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.prop_count.call(this, pcount)
  end
  def get_prop_name(this : IComTrackingInfoProperties*, ulindex : UInt32, ppszpropname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_prop_name.call(this, ulindex, ppszpropname)
  end
end
struct LibWin32::IComApp2Events
  def query_interface(this : IComApp2Events*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComApp2Events*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComApp2Events*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_app_activation2(this : IComApp2Events*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid, guidprocess : Guid) : HRESULT
    @lpVtbl.value.on_app_activation2.call(this, pinfo, guidapp, guidprocess)
  end
  def on_app_shutdown2(this : IComApp2Events*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_shutdown2.call(this, pinfo, guidapp)
  end
  def on_app_force_shutdown2(this : IComApp2Events*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid) : HRESULT
    @lpVtbl.value.on_app_force_shutdown2.call(this, pinfo, guidapp)
  end
  def on_app_paused2(this : IComApp2Events*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid, bpaused : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_app_paused2.call(this, pinfo, guidapp, bpaused)
  end
  def on_app_recycle2(this : IComApp2Events*, pinfo : COMSVCSEVENTINFO*, guidapp : Guid, guidprocess : Guid, lreason : Int32) : HRESULT
    @lpVtbl.value.on_app_recycle2.call(this, pinfo, guidapp, guidprocess, lreason)
  end
end
struct LibWin32::IComTransaction2Events
  def query_interface(this : IComTransaction2Events*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComTransaction2Events*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComTransaction2Events*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_transaction_start2(this : IComTransaction2Events*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, tsid : Guid*, froot : LibC::BOOL, nisolationlevel : Int32) : HRESULT
    @lpVtbl.value.on_transaction_start2.call(this, pinfo, guidtx, tsid, froot, nisolationlevel)
  end
  def on_transaction_prepare2(this : IComTransaction2Events*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*, fvoteyes : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_transaction_prepare2.call(this, pinfo, guidtx, fvoteyes)
  end
  def on_transaction_abort2(this : IComTransaction2Events*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_abort2.call(this, pinfo, guidtx)
  end
  def on_transaction_commit2(this : IComTransaction2Events*, pinfo : COMSVCSEVENTINFO*, guidtx : Guid*) : HRESULT
    @lpVtbl.value.on_transaction_commit2.call(this, pinfo, guidtx)
  end
end
struct LibWin32::IComInstance2Events
  def query_interface(this : IComInstance2Events*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComInstance2Events*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComInstance2Events*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_object_create2(this : IComInstance2Events*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, clsid : Guid*, tsid : Guid*, ctxtid : UInt64, objectid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_object_create2.call(this, pinfo, guidactivity, clsid, tsid, ctxtid, objectid, guidpartition)
  end
  def on_object_destroy2(this : IComInstance2Events*, pinfo : COMSVCSEVENTINFO*, ctxtid : UInt64) : HRESULT
    @lpVtbl.value.on_object_destroy2.call(this, pinfo, ctxtid)
  end
end
struct LibWin32::IComObjectPool2Events
  def query_interface(this : IComObjectPool2Events*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComObjectPool2Events*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComObjectPool2Events*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_obj_pool_put_object2(this : IComObjectPool2Events*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, nreason : Int32, dwavailable : UInt32, oid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_put_object2.call(this, pinfo, guidobject, nreason, dwavailable, oid)
  end
  def on_obj_pool_get_object2(this : IComObjectPool2Events*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, dwavailable : UInt32, oid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_obj_pool_get_object2.call(this, pinfo, guidactivity, guidobject, dwavailable, oid, guidpartition)
  end
  def on_obj_pool_recycle_to_tx2(this : IComObjectPool2Events*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64) : HRESULT
    @lpVtbl.value.on_obj_pool_recycle_to_tx2.call(this, pinfo, guidactivity, guidobject, guidtx, objid)
  end
  def on_obj_pool_get_from_tx2(this : IComObjectPool2Events*, pinfo : COMSVCSEVENTINFO*, guidactivity : Guid*, guidobject : Guid*, guidtx : Guid*, objid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_obj_pool_get_from_tx2.call(this, pinfo, guidactivity, guidobject, guidtx, objid, guidpartition)
  end
end
struct LibWin32::IComObjectConstruction2Events
  def query_interface(this : IComObjectConstruction2Events*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComObjectConstruction2Events*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComObjectConstruction2Events*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_object_construct2(this : IComObjectConstruction2Events*, pinfo : COMSVCSEVENTINFO*, guidobject : Guid*, sconstructstring : LibC::LPWSTR, oid : UInt64, guidpartition : Guid*) : HRESULT
    @lpVtbl.value.on_object_construct2.call(this, pinfo, guidobject, sconstructstring, oid, guidpartition)
  end
end
struct LibWin32::ISystemAppEventData
  def query_interface(this : ISystemAppEventData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISystemAppEventData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISystemAppEventData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def startup(this : ISystemAppEventData*) : HRESULT
    @lpVtbl.value.startup.call(this)
  end
  def on_data_changed(this : ISystemAppEventData*, dwpid : UInt32, dwmask : UInt32, dwnumbersinks : UInt32, bstrdwmethodmask : UInt8*, dwreason : UInt32, u64tracehandle : UInt64) : HRESULT
    @lpVtbl.value.on_data_changed.call(this, dwpid, dwmask, dwnumbersinks, bstrdwmethodmask, dwreason, u64tracehandle)
  end
end
struct LibWin32::IMtsEvents
  def query_interface(this : IMtsEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMtsEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMtsEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMtsEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMtsEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMtsEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMtsEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_package_name(this : IMtsEvents*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_package_name.call(this, pval)
  end
  def get_package_guid(this : IMtsEvents*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_package_guid.call(this, pval)
  end
  def post_event(this : IMtsEvents*, vevent : VARIANT*) : HRESULT
    @lpVtbl.value.post_event.call(this, vevent)
  end
  def get_fire_events(this : IMtsEvents*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_fire_events.call(this, pval)
  end
  def get_process_id(this : IMtsEvents*, id : Int32*) : HRESULT
    @lpVtbl.value.get_process_id.call(this, id)
  end
end
struct LibWin32::IMtsEventInfo
  def query_interface(this : IMtsEventInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMtsEventInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMtsEventInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMtsEventInfo*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMtsEventInfo*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMtsEventInfo*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMtsEventInfo*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_names(this : IMtsEventInfo*, punk : IUnknown*) : HRESULT
    @lpVtbl.value.get_names.call(this, punk)
  end
  def get_display_name(this : IMtsEventInfo*, sdisplayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, sdisplayname)
  end
  def get_event_id(this : IMtsEventInfo*, sguideventid : UInt8**) : HRESULT
    @lpVtbl.value.get_event_id.call(this, sguideventid)
  end
  def get_count(this : IMtsEventInfo*, lcount : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, lcount)
  end
  def get_value(this : IMtsEventInfo*, skey : UInt8*, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, skey, pval)
  end
end
struct LibWin32::IMTSLocator
  def query_interface(this : IMTSLocator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMTSLocator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMTSLocator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMTSLocator*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMTSLocator*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMTSLocator*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMTSLocator*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_event_dispatcher(this : IMTSLocator*, punk : IUnknown*) : HRESULT
    @lpVtbl.value.get_event_dispatcher.call(this, punk)
  end
end
struct LibWin32::IMtsGrp
  def query_interface(this : IMtsGrp*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMtsGrp*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMtsGrp*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMtsGrp*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMtsGrp*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMtsGrp*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMtsGrp*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_count(this : IMtsGrp*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def item(this : IMtsGrp*, lindex : Int32, ppunkdispatcher : IUnknown*) : HRESULT
    @lpVtbl.value.item.call(this, lindex, ppunkdispatcher)
  end
  def refresh(this : IMtsGrp*) : HRESULT
    @lpVtbl.value.refresh.call(this)
  end
end
struct LibWin32::IMessageMover
  def query_interface(this : IMessageMover*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMessageMover*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMessageMover*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IMessageMover*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IMessageMover*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IMessageMover*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IMessageMover*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_source_path(this : IMessageMover*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_source_path.call(this, pval)
  end
  def put_source_path(this : IMessageMover*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_source_path.call(this, newval)
  end
  def get_dest_path(this : IMessageMover*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_dest_path.call(this, pval)
  end
  def put_dest_path(this : IMessageMover*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_dest_path.call(this, newval)
  end
  def get_commit_batch_size(this : IMessageMover*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_commit_batch_size.call(this, pval)
  end
  def put_commit_batch_size(this : IMessageMover*, newval : Int32) : HRESULT
    @lpVtbl.value.put_commit_batch_size.call(this, newval)
  end
  def move_messages(this : IMessageMover*, plmessagesmoved : Int32*) : HRESULT
    @lpVtbl.value.move_messages.call(this, plmessagesmoved)
  end
end
struct LibWin32::IEventServerTrace
  def query_interface(this : IEventServerTrace*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEventServerTrace*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEventServerTrace*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IEventServerTrace*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IEventServerTrace*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IEventServerTrace*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IEventServerTrace*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def start_trace_guid(this : IEventServerTrace*, bstrguidevent : UInt8*, bstrguidfilter : UInt8*, lpidfilter : Int32) : HRESULT
    @lpVtbl.value.start_trace_guid.call(this, bstrguidevent, bstrguidfilter, lpidfilter)
  end
  def stop_trace_guid(this : IEventServerTrace*, bstrguidevent : UInt8*, bstrguidfilter : UInt8*, lpidfilter : Int32) : HRESULT
    @lpVtbl.value.stop_trace_guid.call(this, bstrguidevent, bstrguidfilter, lpidfilter)
  end
  def enum_trace_guid(this : IEventServerTrace*, plcntguids : Int32*, pbstrguidlist : UInt8**) : HRESULT
    @lpVtbl.value.enum_trace_guid.call(this, plcntguids, pbstrguidlist)
  end
end
struct LibWin32::IGetAppTrackerData
  def query_interface(this : IGetAppTrackerData*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGetAppTrackerData*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGetAppTrackerData*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_application_processes(this : IGetAppTrackerData*, partitionid : Guid*, applicationid : Guid*, flags : UInt32, numapplicationprocesses : UInt32*, applicationprocesses : ApplicationProcessSummary**) : HRESULT
    @lpVtbl.value.get_application_processes.call(this, partitionid, applicationid, flags, numapplicationprocesses, applicationprocesses)
  end
  def get_application_process_details(this : IGetAppTrackerData*, applicationinstanceid : Guid*, processid : UInt32, flags : UInt32, summary : ApplicationProcessSummary*, statistics : ApplicationProcessStatistics*, recycleinfo : ApplicationProcessRecycleInfo*, anycomponentshangmonitored : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_application_process_details.call(this, applicationinstanceid, processid, flags, summary, statistics, recycleinfo, anycomponentshangmonitored)
  end
  def get_applications_in_process(this : IGetAppTrackerData*, applicationinstanceid : Guid*, processid : UInt32, partitionid : Guid*, flags : UInt32, numapplicationsinprocess : UInt32*, applications : ApplicationSummary**) : HRESULT
    @lpVtbl.value.get_applications_in_process.call(this, applicationinstanceid, processid, partitionid, flags, numapplicationsinprocess, applications)
  end
  def get_components_in_process(this : IGetAppTrackerData*, applicationinstanceid : Guid*, processid : UInt32, partitionid : Guid*, applicationid : Guid*, flags : UInt32, numcomponentsinprocess : UInt32*, components : ComponentSummary**) : HRESULT
    @lpVtbl.value.get_components_in_process.call(this, applicationinstanceid, processid, partitionid, applicationid, flags, numcomponentsinprocess, components)
  end
  def get_component_details(this : IGetAppTrackerData*, applicationinstanceid : Guid*, processid : UInt32, clsid : Guid*, flags : UInt32, summary : ComponentSummary*, statistics : ComponentStatistics*, hangmonitorinfo : ComponentHangMonitorInfo*) : HRESULT
    @lpVtbl.value.get_component_details.call(this, applicationinstanceid, processid, clsid, flags, summary, statistics, hangmonitorinfo)
  end
  def get_tracker_data_as_collection_object(this : IGetAppTrackerData*, toplevelcollection : IUnknown*) : HRESULT
    @lpVtbl.value.get_tracker_data_as_collection_object.call(this, toplevelcollection)
  end
  def get_suggested_polling_interval(this : IGetAppTrackerData*, pollingintervalinseconds : UInt32*) : HRESULT
    @lpVtbl.value.get_suggested_polling_interval.call(this, pollingintervalinseconds)
  end
end
struct LibWin32::IDispenserManager
  def query_interface(this : IDispenserManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDispenserManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDispenserManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_dispenser(this : IDispenserManager*, midl__idispensermanager0000 : IDispenserDriver, szdispensername : LibC::LPWSTR, midl__idispensermanager0001 : IHolder*) : HRESULT
    @lpVtbl.value.register_dispenser.call(this, midl__idispensermanager0000, szdispensername, midl__idispensermanager0001)
  end
  def get_context(this : IDispenserManager*, midl__idispensermanager0002 : LibC::UINT_PTR*, midl__idispensermanager0003 : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.get_context.call(this, midl__idispensermanager0002, midl__idispensermanager0003)
  end
end
struct LibWin32::IHolder
  def query_interface(this : IHolder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IHolder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IHolder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def alloc_resource(this : IHolder*, midl__iholder0000 : LibC::UINT_PTR, midl__iholder0001 : LibC::UINT_PTR*) : HRESULT
    @lpVtbl.value.alloc_resource.call(this, midl__iholder0000, midl__iholder0001)
  end
  def free_resource(this : IHolder*, midl__iholder0002 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.free_resource.call(this, midl__iholder0002)
  end
  def track_resource(this : IHolder*, midl__iholder0003 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.track_resource.call(this, midl__iholder0003)
  end
  def track_resource_s(this : IHolder*, midl__iholder0004 : UInt16*) : HRESULT
    @lpVtbl.value.track_resource_s.call(this, midl__iholder0004)
  end
  def untrack_resource(this : IHolder*, midl__iholder0005 : LibC::UINT_PTR, midl__iholder0006 : LibC::BOOL) : HRESULT
    @lpVtbl.value.untrack_resource.call(this, midl__iholder0005, midl__iholder0006)
  end
  def untrack_resource_s(this : IHolder*, midl__iholder0007 : UInt16*, midl__iholder0008 : LibC::BOOL) : HRESULT
    @lpVtbl.value.untrack_resource_s.call(this, midl__iholder0007, midl__iholder0008)
  end
  def close(this : IHolder*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def request_destroy_resource(this : IHolder*, midl__iholder0009 : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.request_destroy_resource.call(this, midl__iholder0009)
  end
end
struct LibWin32::IDispenserDriver
  def query_interface(this : IDispenserDriver*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDispenserDriver*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDispenserDriver*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_resource(this : IDispenserDriver*, restypid : LibC::UINT_PTR, presid : LibC::UINT_PTR*, psecsfreebeforedestroy : Int32*) : HRESULT
    @lpVtbl.value.create_resource.call(this, restypid, presid, psecsfreebeforedestroy)
  end
  def rate_resource(this : IDispenserDriver*, restypid : LibC::UINT_PTR, resid : LibC::UINT_PTR, frequirestransactionenlistment : LibC::BOOL, prating : UInt32*) : HRESULT
    @lpVtbl.value.rate_resource.call(this, restypid, resid, frequirestransactionenlistment, prating)
  end
  def enlist_resource(this : IDispenserDriver*, resid : LibC::UINT_PTR, transid : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.enlist_resource.call(this, resid, transid)
  end
  def reset_resource(this : IDispenserDriver*, resid : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.reset_resource.call(this, resid)
  end
  def destroy_resource(this : IDispenserDriver*, resid : LibC::UINT_PTR) : HRESULT
    @lpVtbl.value.destroy_resource.call(this, resid)
  end
  def destroy_resource_s(this : IDispenserDriver*, resid : UInt16*) : HRESULT
    @lpVtbl.value.destroy_resource_s.call(this, resid)
  end
end
struct LibWin32::ITransactionProxy
  def query_interface(this : ITransactionProxy*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionProxy*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionProxy*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def commit(this : ITransactionProxy*, guid : Guid) : HRESULT
    @lpVtbl.value.commit.call(this, guid)
  end
  def abort(this : ITransactionProxy*) : HRESULT
    @lpVtbl.value.abort.call(this)
  end
  def promote(this : ITransactionProxy*, ptransaction : ITransaction*) : HRESULT
    @lpVtbl.value.promote.call(this, ptransaction)
  end
  def create_voter(this : ITransactionProxy*, ptxasync : ITransactionVoterNotifyAsync2, ppballot : ITransactionVoterBallotAsync2*) : HRESULT
    @lpVtbl.value.create_voter.call(this, ptxasync, ppballot)
  end
  def get_isolation_level(this : ITransactionProxy*, midl__itransactionproxy0000 : Int32*) : HRESULT
    @lpVtbl.value.get_isolation_level.call(this, midl__itransactionproxy0000)
  end
  def get_identifier(this : ITransactionProxy*, pbstridentifier : Guid*) : HRESULT
    @lpVtbl.value.get_identifier.call(this, pbstridentifier)
  end
  def is_reusable(this : ITransactionProxy*, pfisreusable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_reusable.call(this, pfisreusable)
  end
end
struct LibWin32::IContextSecurityPerimeter
  def query_interface(this : IContextSecurityPerimeter*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextSecurityPerimeter*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextSecurityPerimeter*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_perimeter_flag(this : IContextSecurityPerimeter*, pflag : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_perimeter_flag.call(this, pflag)
  end
  def set_perimeter_flag(this : IContextSecurityPerimeter*, fflag : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_perimeter_flag.call(this, fflag)
  end
end
struct LibWin32::ITxProxyHolder
  def query_interface(this : ITxProxyHolder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITxProxyHolder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITxProxyHolder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_identifier(this : ITxProxyHolder*, pguidltx : Guid*) : Void
    @lpVtbl.value.get_identifier.call(this, pguidltx)
  end
end
struct LibWin32::IObjectContext
  def query_interface(this : IObjectContext*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectContext*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectContext*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_instance(this : IObjectContext*, rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.create_instance.call(this, rclsid, riid, ppv)
  end
  def set_complete(this : IObjectContext*) : HRESULT
    @lpVtbl.value.set_complete.call(this)
  end
  def set_abort(this : IObjectContext*) : HRESULT
    @lpVtbl.value.set_abort.call(this)
  end
  def enable_commit(this : IObjectContext*) : HRESULT
    @lpVtbl.value.enable_commit.call(this)
  end
  def disable_commit(this : IObjectContext*) : HRESULT
    @lpVtbl.value.disable_commit.call(this)
  end
  def is_in_transaction(this : IObjectContext*) : LibC::BOOL
    @lpVtbl.value.is_in_transaction.call(this)
  end
  def is_security_enabled(this : IObjectContext*) : LibC::BOOL
    @lpVtbl.value.is_security_enabled.call(this)
  end
  def is_caller_in_role(this : IObjectContext*, bstrrole : UInt8*, pfisinrole : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_caller_in_role.call(this, bstrrole, pfisinrole)
  end
end
struct LibWin32::IObjectControl
  def query_interface(this : IObjectControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def activate(this : IObjectControl*) : HRESULT
    @lpVtbl.value.activate.call(this)
  end
  def deactivate(this : IObjectControl*) : Void
    @lpVtbl.value.deactivate.call(this)
  end
  def can_be_pooled(this : IObjectControl*) : LibC::BOOL
    @lpVtbl.value.can_be_pooled.call(this)
  end
end
struct LibWin32::IEnumNames
  def query_interface(this : IEnumNames*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNames*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNames*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNames*, celt : UInt32, rgname : UInt8**, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgname, pceltfetched)
  end
  def skip(this : IEnumNames*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNames*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNames*, ppenum : IEnumNames*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::ISecurityProperty
  def query_interface(this : ISecurityProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_direct_creator_sid(this : ISecurityProperty*, psid : PSID*) : HRESULT
    @lpVtbl.value.get_direct_creator_sid.call(this, psid)
  end
  def get_original_creator_sid(this : ISecurityProperty*, psid : PSID*) : HRESULT
    @lpVtbl.value.get_original_creator_sid.call(this, psid)
  end
  def get_direct_caller_sid(this : ISecurityProperty*, psid : PSID*) : HRESULT
    @lpVtbl.value.get_direct_caller_sid.call(this, psid)
  end
  def get_original_caller_sid(this : ISecurityProperty*, psid : PSID*) : HRESULT
    @lpVtbl.value.get_original_caller_sid.call(this, psid)
  end
  def release_sid(this : ISecurityProperty*, psid : PSID) : HRESULT
    @lpVtbl.value.release_sid.call(this, psid)
  end
end
struct LibWin32::ObjectControl
  def query_interface(this : ObjectControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ObjectControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ObjectControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def activate(this : ObjectControl*) : HRESULT
    @lpVtbl.value.activate.call(this)
  end
  def deactivate(this : ObjectControl*) : HRESULT
    @lpVtbl.value.deactivate.call(this)
  end
  def can_be_pooled(this : ObjectControl*, pbpoolable : Int16*) : HRESULT
    @lpVtbl.value.can_be_pooled.call(this, pbpoolable)
  end
end
struct LibWin32::ISharedProperty
  def query_interface(this : ISharedProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISharedProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISharedProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISharedProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISharedProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISharedProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISharedProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_value(this : ISharedProperty*, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, pval)
  end
  def put_value(this : ISharedProperty*, val : VARIANT) : HRESULT
    @lpVtbl.value.put_value.call(this, val)
  end
end
struct LibWin32::ISharedPropertyGroup
  def query_interface(this : ISharedPropertyGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISharedPropertyGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISharedPropertyGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISharedPropertyGroup*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISharedPropertyGroup*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISharedPropertyGroup*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISharedPropertyGroup*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_property_by_position(this : ISharedPropertyGroup*, index : Int32, fexists : Int16*, ppprop : ISharedProperty*) : HRESULT
    @lpVtbl.value.create_property_by_position.call(this, index, fexists, ppprop)
  end
  def get_property_by_position(this : ISharedPropertyGroup*, index : Int32, ppproperty : ISharedProperty*) : HRESULT
    @lpVtbl.value.get_property_by_position.call(this, index, ppproperty)
  end
  def create_property(this : ISharedPropertyGroup*, name : UInt8*, fexists : Int16*, ppprop : ISharedProperty*) : HRESULT
    @lpVtbl.value.create_property.call(this, name, fexists, ppprop)
  end
  def get_property(this : ISharedPropertyGroup*, name : UInt8*, ppproperty : ISharedProperty*) : HRESULT
    @lpVtbl.value.get_property.call(this, name, ppproperty)
  end
end
struct LibWin32::ISharedPropertyGroupManager
  def query_interface(this : ISharedPropertyGroupManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISharedPropertyGroupManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISharedPropertyGroupManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISharedPropertyGroupManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISharedPropertyGroupManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISharedPropertyGroupManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISharedPropertyGroupManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_property_group(this : ISharedPropertyGroupManager*, name : UInt8*, dwisomode : Int32*, dwrelmode : Int32*, fexists : Int16*, ppgroup : ISharedPropertyGroup*) : HRESULT
    @lpVtbl.value.create_property_group.call(this, name, dwisomode, dwrelmode, fexists, ppgroup)
  end
  def get_group(this : ISharedPropertyGroupManager*, name : UInt8*, ppgroup : ISharedPropertyGroup*) : HRESULT
    @lpVtbl.value.get_group.call(this, name, ppgroup)
  end
  def get__new_enum(this : ISharedPropertyGroupManager*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, retval)
  end
end
struct LibWin32::IObjectConstruct
  def query_interface(this : IObjectConstruct*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectConstruct*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectConstruct*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def construct(this : IObjectConstruct*, pctorobj : IDispatch) : HRESULT
    @lpVtbl.value.construct.call(this, pctorobj)
  end
end
struct LibWin32::IObjectConstructString
  def query_interface(this : IObjectConstructString*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectConstructString*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectConstructString*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IObjectConstructString*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IObjectConstructString*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IObjectConstructString*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IObjectConstructString*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_construct_string(this : IObjectConstructString*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_construct_string.call(this, pval)
  end
end
struct LibWin32::IObjectContextActivity
  def query_interface(this : IObjectContextActivity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectContextActivity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectContextActivity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_activity_id(this : IObjectContextActivity*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_activity_id.call(this, pguid)
  end
end
struct LibWin32::IObjectContextInfo
  def query_interface(this : IObjectContextInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectContextInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectContextInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_in_transaction(this : IObjectContextInfo*) : LibC::BOOL
    @lpVtbl.value.is_in_transaction.call(this)
  end
  def get_transaction(this : IObjectContextInfo*, pptrans : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pptrans)
  end
  def get_transaction_id(this : IObjectContextInfo*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pguid)
  end
  def get_activity_id(this : IObjectContextInfo*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_activity_id.call(this, pguid)
  end
  def get_context_id(this : IObjectContextInfo*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_context_id.call(this, pguid)
  end
end
struct LibWin32::IObjectContextInfo2
  def query_interface(this : IObjectContextInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectContextInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectContextInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_in_transaction(this : IObjectContextInfo2*) : LibC::BOOL
    @lpVtbl.value.is_in_transaction.call(this)
  end
  def get_transaction(this : IObjectContextInfo2*, pptrans : IUnknown*) : HRESULT
    @lpVtbl.value.get_transaction.call(this, pptrans)
  end
  def get_transaction_id(this : IObjectContextInfo2*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_transaction_id.call(this, pguid)
  end
  def get_activity_id(this : IObjectContextInfo2*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_activity_id.call(this, pguid)
  end
  def get_context_id(this : IObjectContextInfo2*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_context_id.call(this, pguid)
  end
  def get_partition_id(this : IObjectContextInfo2*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_partition_id.call(this, pguid)
  end
  def get_application_id(this : IObjectContextInfo2*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_application_id.call(this, pguid)
  end
  def get_application_instance_id(this : IObjectContextInfo2*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_application_instance_id.call(this, pguid)
  end
end
struct LibWin32::ITransactionStatus
  def query_interface(this : ITransactionStatus*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionStatus*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionStatus*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_transaction_status(this : ITransactionStatus*, hrstatus : HRESULT) : HRESULT
    @lpVtbl.value.set_transaction_status.call(this, hrstatus)
  end
  def get_transaction_status(this : ITransactionStatus*, phrstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_transaction_status.call(this, phrstatus)
  end
end
struct LibWin32::IObjectContextTip
  def query_interface(this : IObjectContextTip*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectContextTip*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectContextTip*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_tip_url(this : IObjectContextTip*, ptipurl : UInt8**) : HRESULT
    @lpVtbl.value.get_tip_url.call(this, ptipurl)
  end
end
struct LibWin32::IPlaybackControl
  def query_interface(this : IPlaybackControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPlaybackControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPlaybackControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def final_client_retry(this : IPlaybackControl*) : HRESULT
    @lpVtbl.value.final_client_retry.call(this)
  end
  def final_server_retry(this : IPlaybackControl*) : HRESULT
    @lpVtbl.value.final_server_retry.call(this)
  end
end
struct LibWin32::IGetContextProperties
  def query_interface(this : IGetContextProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGetContextProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGetContextProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def count(this : IGetContextProperties*, plcount : Int32*) : HRESULT
    @lpVtbl.value.count.call(this, plcount)
  end
  def get_property(this : IGetContextProperties*, name : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.call(this, name, pproperty)
  end
  def enum_names(this : IGetContextProperties*, ppenum : IEnumNames*) : HRESULT
    @lpVtbl.value.enum_names.call(this, ppenum)
  end
end
struct LibWin32::IContextState
  def query_interface(this : IContextState*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextState*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextState*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_deactivate_on_return(this : IContextState*, bdeactivate : Int16) : HRESULT
    @lpVtbl.value.set_deactivate_on_return.call(this, bdeactivate)
  end
  def get_deactivate_on_return(this : IContextState*, pbdeactivate : Int16*) : HRESULT
    @lpVtbl.value.get_deactivate_on_return.call(this, pbdeactivate)
  end
  def set_my_transaction_vote(this : IContextState*, txvote : TransactionVote) : HRESULT
    @lpVtbl.value.set_my_transaction_vote.call(this, txvote)
  end
  def get_my_transaction_vote(this : IContextState*, ptxvote : TransactionVote*) : HRESULT
    @lpVtbl.value.get_my_transaction_vote.call(this, ptxvote)
  end
end
struct LibWin32::IPoolManager
  def query_interface(this : IPoolManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPoolManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPoolManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IPoolManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IPoolManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IPoolManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IPoolManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def shutdown_pool(this : IPoolManager*, clsidorprogid : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_pool.call(this, clsidorprogid)
  end
end
struct LibWin32::ISelectCOMLBServer
  def query_interface(this : ISelectCOMLBServer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISelectCOMLBServer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISelectCOMLBServer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def init(this : ISelectCOMLBServer*) : HRESULT
    @lpVtbl.value.init.call(this)
  end
  def get_lb_server(this : ISelectCOMLBServer*, punk : IUnknown) : HRESULT
    @lpVtbl.value.get_lb_server.call(this, punk)
  end
end
struct LibWin32::ICOMLBArguments
  def query_interface(this : ICOMLBArguments*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICOMLBArguments*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICOMLBArguments*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_clsid(this : ICOMLBArguments*, pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_clsid.call(this, pclsid)
  end
  def set_clsid(this : ICOMLBArguments*, pclsid : Guid*) : HRESULT
    @lpVtbl.value.set_clsid.call(this, pclsid)
  end
  def get_machine_name(this : ICOMLBArguments*, cchsvr : UInt32, szservername : Char*) : HRESULT
    @lpVtbl.value.get_machine_name.call(this, cchsvr, szservername)
  end
  def set_machine_name(this : ICOMLBArguments*, cchsvr : UInt32, szservername : Char*) : HRESULT
    @lpVtbl.value.set_machine_name.call(this, cchsvr, szservername)
  end
end
struct LibWin32::ICrmLogControl
  def query_interface(this : ICrmLogControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmLogControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmLogControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_transaction_uow(this : ICrmLogControl*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_transaction_uow.call(this, pval)
  end
  def register_compensator(this : ICrmLogControl*, lpcwstrprogidcompensator : LibC::LPWSTR, lpcwstrdescription : LibC::LPWSTR, lcrmregflags : Int32) : HRESULT
    @lpVtbl.value.register_compensator.call(this, lpcwstrprogidcompensator, lpcwstrdescription, lcrmregflags)
  end
  def write_log_record_variants(this : ICrmLogControl*, plogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.write_log_record_variants.call(this, plogrecord)
  end
  def force_log(this : ICrmLogControl*) : HRESULT
    @lpVtbl.value.force_log.call(this)
  end
  def forget_log_record(this : ICrmLogControl*) : HRESULT
    @lpVtbl.value.forget_log_record.call(this)
  end
  def force_transaction_to_abort(this : ICrmLogControl*) : HRESULT
    @lpVtbl.value.force_transaction_to_abort.call(this)
  end
  def write_log_record(this : ICrmLogControl*, rgblob : BLOB*, cblob : UInt32) : HRESULT
    @lpVtbl.value.write_log_record.call(this, rgblob, cblob)
  end
end
struct LibWin32::ICrmCompensatorVariants
  def query_interface(this : ICrmCompensatorVariants*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmCompensatorVariants*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmCompensatorVariants*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_log_control_variants(this : ICrmCompensatorVariants*, plogcontrol : ICrmLogControl) : HRESULT
    @lpVtbl.value.set_log_control_variants.call(this, plogcontrol)
  end
  def begin_prepare_variants(this : ICrmCompensatorVariants*) : HRESULT
    @lpVtbl.value.begin_prepare_variants.call(this)
  end
  def prepare_record_variants(this : ICrmCompensatorVariants*, plogrecord : VARIANT*, pbforget : Int16*) : HRESULT
    @lpVtbl.value.prepare_record_variants.call(this, plogrecord, pbforget)
  end
  def end_prepare_variants(this : ICrmCompensatorVariants*, pboktoprepare : Int16*) : HRESULT
    @lpVtbl.value.end_prepare_variants.call(this, pboktoprepare)
  end
  def begin_commit_variants(this : ICrmCompensatorVariants*, brecovery : Int16) : HRESULT
    @lpVtbl.value.begin_commit_variants.call(this, brecovery)
  end
  def commit_record_variants(this : ICrmCompensatorVariants*, plogrecord : VARIANT*, pbforget : Int16*) : HRESULT
    @lpVtbl.value.commit_record_variants.call(this, plogrecord, pbforget)
  end
  def end_commit_variants(this : ICrmCompensatorVariants*) : HRESULT
    @lpVtbl.value.end_commit_variants.call(this)
  end
  def begin_abort_variants(this : ICrmCompensatorVariants*, brecovery : Int16) : HRESULT
    @lpVtbl.value.begin_abort_variants.call(this, brecovery)
  end
  def abort_record_variants(this : ICrmCompensatorVariants*, plogrecord : VARIANT*, pbforget : Int16*) : HRESULT
    @lpVtbl.value.abort_record_variants.call(this, plogrecord, pbforget)
  end
  def end_abort_variants(this : ICrmCompensatorVariants*) : HRESULT
    @lpVtbl.value.end_abort_variants.call(this)
  end
end
struct LibWin32::ICrmCompensator
  def query_interface(this : ICrmCompensator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmCompensator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmCompensator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_log_control(this : ICrmCompensator*, plogcontrol : ICrmLogControl) : HRESULT
    @lpVtbl.value.set_log_control.call(this, plogcontrol)
  end
  def begin_prepare(this : ICrmCompensator*) : HRESULT
    @lpVtbl.value.begin_prepare.call(this)
  end
  def prepare_record(this : ICrmCompensator*, crmlogrec : CrmLogRecordRead, pfforget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.prepare_record.call(this, crmlogrec, pfforget)
  end
  def end_prepare(this : ICrmCompensator*, pfoktoprepare : LibC::BOOL*) : HRESULT
    @lpVtbl.value.end_prepare.call(this, pfoktoprepare)
  end
  def begin_commit(this : ICrmCompensator*, frecovery : LibC::BOOL) : HRESULT
    @lpVtbl.value.begin_commit.call(this, frecovery)
  end
  def commit_record(this : ICrmCompensator*, crmlogrec : CrmLogRecordRead, pfforget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.commit_record.call(this, crmlogrec, pfforget)
  end
  def end_commit(this : ICrmCompensator*) : HRESULT
    @lpVtbl.value.end_commit.call(this)
  end
  def begin_abort(this : ICrmCompensator*, frecovery : LibC::BOOL) : HRESULT
    @lpVtbl.value.begin_abort.call(this, frecovery)
  end
  def abort_record(this : ICrmCompensator*, crmlogrec : CrmLogRecordRead, pfforget : LibC::BOOL*) : HRESULT
    @lpVtbl.value.abort_record.call(this, crmlogrec, pfforget)
  end
  def end_abort(this : ICrmCompensator*) : HRESULT
    @lpVtbl.value.end_abort.call(this)
  end
end
struct LibWin32::ICrmMonitorLogRecords
  def query_interface(this : ICrmMonitorLogRecords*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmMonitorLogRecords*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmMonitorLogRecords*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_count(this : ICrmMonitorLogRecords*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def get_transaction_state(this : ICrmMonitorLogRecords*, pval : CrmTransactionState*) : HRESULT
    @lpVtbl.value.get_transaction_state.call(this, pval)
  end
  def get_structured_records(this : ICrmMonitorLogRecords*, pval : Int16*) : HRESULT
    @lpVtbl.value.get_structured_records.call(this, pval)
  end
  def get_log_record(this : ICrmMonitorLogRecords*, dwindex : UInt32, pcrmlogrec : CrmLogRecordRead*) : HRESULT
    @lpVtbl.value.get_log_record.call(this, dwindex, pcrmlogrec)
  end
  def get_log_record_variants(this : ICrmMonitorLogRecords*, indexnumber : VARIANT, plogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.get_log_record_variants.call(this, indexnumber, plogrecord)
  end
end
struct LibWin32::ICrmMonitorClerks
  def query_interface(this : ICrmMonitorClerks*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmMonitorClerks*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmMonitorClerks*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICrmMonitorClerks*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICrmMonitorClerks*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICrmMonitorClerks*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICrmMonitorClerks*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def item(this : ICrmMonitorClerks*, index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.item.call(this, index, pitem)
  end
  def get__new_enum(this : ICrmMonitorClerks*, pval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, pval)
  end
  def get_count(this : ICrmMonitorClerks*, pval : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, pval)
  end
  def prog_id_compensator(this : ICrmMonitorClerks*, index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.prog_id_compensator.call(this, index, pitem)
  end
  def description(this : ICrmMonitorClerks*, index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.description.call(this, index, pitem)
  end
  def transaction_uow(this : ICrmMonitorClerks*, index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.transaction_uow.call(this, index, pitem)
  end
  def activity_id(this : ICrmMonitorClerks*, index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.activity_id.call(this, index, pitem)
  end
end
struct LibWin32::ICrmMonitor
  def query_interface(this : ICrmMonitor*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmMonitor*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmMonitor*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_clerks(this : ICrmMonitor*, pclerks : ICrmMonitorClerks*) : HRESULT
    @lpVtbl.value.get_clerks.call(this, pclerks)
  end
  def hold_clerk(this : ICrmMonitor*, index : VARIANT, pitem : VARIANT*) : HRESULT
    @lpVtbl.value.hold_clerk.call(this, index, pitem)
  end
end
struct LibWin32::ICrmFormatLogRecords
  def query_interface(this : ICrmFormatLogRecords*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICrmFormatLogRecords*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICrmFormatLogRecords*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_column_count(this : ICrmFormatLogRecords*, plcolumncount : Int32*) : HRESULT
    @lpVtbl.value.get_column_count.call(this, plcolumncount)
  end
  def get_column_headers(this : ICrmFormatLogRecords*, pheaders : VARIANT*) : HRESULT
    @lpVtbl.value.get_column_headers.call(this, pheaders)
  end
  def get_column(this : ICrmFormatLogRecords*, crmlogrec : CrmLogRecordRead, pformattedlogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.get_column.call(this, crmlogrec, pformattedlogrecord)
  end
  def get_column_variants(this : ICrmFormatLogRecords*, logrecord : VARIANT, pformattedlogrecord : VARIANT*) : HRESULT
    @lpVtbl.value.get_column_variants.call(this, logrecord, pformattedlogrecord)
  end
end
struct LibWin32::IServiceIISIntrinsicsConfig
  def query_interface(this : IServiceIISIntrinsicsConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceIISIntrinsicsConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceIISIntrinsicsConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def iis_intrinsics_config(this : IServiceIISIntrinsicsConfig*, iisintrinsicsconfig : CSC_IISIntrinsicsConfig) : HRESULT
    @lpVtbl.value.iis_intrinsics_config.call(this, iisintrinsicsconfig)
  end
end
struct LibWin32::IServiceComTIIntrinsicsConfig
  def query_interface(this : IServiceComTIIntrinsicsConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceComTIIntrinsicsConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceComTIIntrinsicsConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def com_ti_intrinsics_config(this : IServiceComTIIntrinsicsConfig*, comtiintrinsicsconfig : CSC_COMTIIntrinsicsConfig) : HRESULT
    @lpVtbl.value.com_ti_intrinsics_config.call(this, comtiintrinsicsconfig)
  end
end
struct LibWin32::IServiceSxsConfig
  def query_interface(this : IServiceSxsConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceSxsConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceSxsConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def sxs_config(this : IServiceSxsConfig*, scsconfig : CSC_SxsConfig) : HRESULT
    @lpVtbl.value.sxs_config.call(this, scsconfig)
  end
  def sxs_name(this : IServiceSxsConfig*, szsxsname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.sxs_name.call(this, szsxsname)
  end
  def sxs_directory(this : IServiceSxsConfig*, szsxsdirectory : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.sxs_directory.call(this, szsxsdirectory)
  end
end
struct LibWin32::ICheckSxsConfig
  def query_interface(this : ICheckSxsConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICheckSxsConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICheckSxsConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_same_sxs_config(this : ICheckSxsConfig*, wszsxsname : LibC::LPWSTR, wszsxsdirectory : LibC::LPWSTR, wszsxsappname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.is_same_sxs_config.call(this, wszsxsname, wszsxsdirectory, wszsxsappname)
  end
end
struct LibWin32::IServiceInheritanceConfig
  def query_interface(this : IServiceInheritanceConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceInheritanceConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceInheritanceConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def containing_context_treatment(this : IServiceInheritanceConfig*, inheritanceconfig : CSC_InheritanceConfig) : HRESULT
    @lpVtbl.value.containing_context_treatment.call(this, inheritanceconfig)
  end
end
struct LibWin32::IServiceThreadPoolConfig
  def query_interface(this : IServiceThreadPoolConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceThreadPoolConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceThreadPoolConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select_thread_pool(this : IServiceThreadPoolConfig*, threadpool : CSC_ThreadPool) : HRESULT
    @lpVtbl.value.select_thread_pool.call(this, threadpool)
  end
  def set_binding_info(this : IServiceThreadPoolConfig*, binding : CSC_Binding) : HRESULT
    @lpVtbl.value.set_binding_info.call(this, binding)
  end
end
struct LibWin32::IServiceTransactionConfigBase
  def query_interface(this : IServiceTransactionConfigBase*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceTransactionConfigBase*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceTransactionConfigBase*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def configure_transaction(this : IServiceTransactionConfigBase*, transactionconfig : CSC_TransactionConfig) : HRESULT
    @lpVtbl.value.configure_transaction.call(this, transactionconfig)
  end
  def isolation_level(this : IServiceTransactionConfigBase*, option : COMAdminTxIsolationLevelOptions) : HRESULT
    @lpVtbl.value.isolation_level.call(this, option)
  end
  def transaction_timeout(this : IServiceTransactionConfigBase*, ultimeoutsec : UInt32) : HRESULT
    @lpVtbl.value.transaction_timeout.call(this, ultimeoutsec)
  end
  def bring_your_own_transaction(this : IServiceTransactionConfigBase*, sztipurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.bring_your_own_transaction.call(this, sztipurl)
  end
  def new_transaction_description(this : IServiceTransactionConfigBase*, sztxdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.new_transaction_description.call(this, sztxdesc)
  end
end
struct LibWin32::IServiceTransactionConfig
  def query_interface(this : IServiceTransactionConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceTransactionConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceTransactionConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def configure_transaction(this : IServiceTransactionConfig*, transactionconfig : CSC_TransactionConfig) : HRESULT
    @lpVtbl.value.configure_transaction.call(this, transactionconfig)
  end
  def isolation_level(this : IServiceTransactionConfig*, option : COMAdminTxIsolationLevelOptions) : HRESULT
    @lpVtbl.value.isolation_level.call(this, option)
  end
  def transaction_timeout(this : IServiceTransactionConfig*, ultimeoutsec : UInt32) : HRESULT
    @lpVtbl.value.transaction_timeout.call(this, ultimeoutsec)
  end
  def bring_your_own_transaction(this : IServiceTransactionConfig*, sztipurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.bring_your_own_transaction.call(this, sztipurl)
  end
  def new_transaction_description(this : IServiceTransactionConfig*, sztxdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.new_transaction_description.call(this, sztxdesc)
  end
  def configure_byot(this : IServiceTransactionConfig*, pitxbyot : ITransaction) : HRESULT
    @lpVtbl.value.configure_byot.call(this, pitxbyot)
  end
end
struct LibWin32::IServiceSysTxnConfig
  def query_interface(this : IServiceSysTxnConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceSysTxnConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceSysTxnConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def configure_transaction(this : IServiceSysTxnConfig*, transactionconfig : CSC_TransactionConfig) : HRESULT
    @lpVtbl.value.configure_transaction.call(this, transactionconfig)
  end
  def isolation_level(this : IServiceSysTxnConfig*, option : COMAdminTxIsolationLevelOptions) : HRESULT
    @lpVtbl.value.isolation_level.call(this, option)
  end
  def transaction_timeout(this : IServiceSysTxnConfig*, ultimeoutsec : UInt32) : HRESULT
    @lpVtbl.value.transaction_timeout.call(this, ultimeoutsec)
  end
  def bring_your_own_transaction(this : IServiceSysTxnConfig*, sztipurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.bring_your_own_transaction.call(this, sztipurl)
  end
  def new_transaction_description(this : IServiceSysTxnConfig*, sztxdesc : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.new_transaction_description.call(this, sztxdesc)
  end
  def configure_byot(this : IServiceSysTxnConfig*, pitxbyot : ITransaction) : HRESULT
    @lpVtbl.value.configure_byot.call(this, pitxbyot)
  end
  def configure_byot_sys_txn(this : IServiceSysTxnConfig*, ptxproxy : ITransactionProxy) : HRESULT
    @lpVtbl.value.configure_byot_sys_txn.call(this, ptxproxy)
  end
end
struct LibWin32::IServiceSynchronizationConfig
  def query_interface(this : IServiceSynchronizationConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceSynchronizationConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceSynchronizationConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def configure_synchronization(this : IServiceSynchronizationConfig*, synchconfig : CSC_SynchronizationConfig) : HRESULT
    @lpVtbl.value.configure_synchronization.call(this, synchconfig)
  end
end
struct LibWin32::IServiceTrackerConfig
  def query_interface(this : IServiceTrackerConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceTrackerConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceTrackerConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def tracker_config(this : IServiceTrackerConfig*, trackerconfig : CSC_TrackerConfig, sztrackerappname : LibC::LPWSTR, sztrackerctxname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.tracker_config.call(this, trackerconfig, sztrackerappname, sztrackerctxname)
  end
end
struct LibWin32::IServicePartitionConfig
  def query_interface(this : IServicePartitionConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServicePartitionConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServicePartitionConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def partition_config(this : IServicePartitionConfig*, partitionconfig : CSC_PartitionConfig) : HRESULT
    @lpVtbl.value.partition_config.call(this, partitionconfig)
  end
  def partition_id(this : IServicePartitionConfig*, guidpartitionid : Guid*) : HRESULT
    @lpVtbl.value.partition_id.call(this, guidpartitionid)
  end
end
struct LibWin32::IServiceCall
  def query_interface(this : IServiceCall*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceCall*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceCall*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_call(this : IServiceCall*) : HRESULT
    @lpVtbl.value.on_call.call(this)
  end
end
struct LibWin32::IAsyncErrorNotify
  def query_interface(this : IAsyncErrorNotify*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAsyncErrorNotify*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAsyncErrorNotify*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_error(this : IAsyncErrorNotify*, hr : HRESULT) : HRESULT
    @lpVtbl.value.on_error.call(this, hr)
  end
end
struct LibWin32::IServiceActivity
  def query_interface(this : IServiceActivity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServiceActivity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServiceActivity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def synchronous_call(this : IServiceActivity*, piservicecall : IServiceCall) : HRESULT
    @lpVtbl.value.synchronous_call.call(this, piservicecall)
  end
  def asynchronous_call(this : IServiceActivity*, piservicecall : IServiceCall) : HRESULT
    @lpVtbl.value.asynchronous_call.call(this, piservicecall)
  end
  def bind_to_current_thread(this : IServiceActivity*) : HRESULT
    @lpVtbl.value.bind_to_current_thread.call(this)
  end
  def unbind_from_thread(this : IServiceActivity*) : HRESULT
    @lpVtbl.value.unbind_from_thread.call(this)
  end
end
struct LibWin32::IThreadPoolKnobs
  def query_interface(this : IThreadPoolKnobs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IThreadPoolKnobs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IThreadPoolKnobs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_max_threads(this : IThreadPoolKnobs*, plcmaxthreads : Int32*) : HRESULT
    @lpVtbl.value.get_max_threads.call(this, plcmaxthreads)
  end
  def get_current_threads(this : IThreadPoolKnobs*, plccurrentthreads : Int32*) : HRESULT
    @lpVtbl.value.get_current_threads.call(this, plccurrentthreads)
  end
  def set_max_threads(this : IThreadPoolKnobs*, lcmaxthreads : Int32) : HRESULT
    @lpVtbl.value.set_max_threads.call(this, lcmaxthreads)
  end
  def get_delete_delay(this : IThreadPoolKnobs*, pmsecdeletedelay : Int32*) : HRESULT
    @lpVtbl.value.get_delete_delay.call(this, pmsecdeletedelay)
  end
  def set_delete_delay(this : IThreadPoolKnobs*, msecdeletedelay : Int32) : HRESULT
    @lpVtbl.value.set_delete_delay.call(this, msecdeletedelay)
  end
  def get_max_queued_requests(this : IThreadPoolKnobs*, plcmaxqueuedrequests : Int32*) : HRESULT
    @lpVtbl.value.get_max_queued_requests.call(this, plcmaxqueuedrequests)
  end
  def get_current_queued_requests(this : IThreadPoolKnobs*, plccurrentqueuedrequests : Int32*) : HRESULT
    @lpVtbl.value.get_current_queued_requests.call(this, plccurrentqueuedrequests)
  end
  def set_max_queued_requests(this : IThreadPoolKnobs*, lcmaxqueuedrequests : Int32) : HRESULT
    @lpVtbl.value.set_max_queued_requests.call(this, lcmaxqueuedrequests)
  end
  def set_min_threads(this : IThreadPoolKnobs*, lcminthreads : Int32) : HRESULT
    @lpVtbl.value.set_min_threads.call(this, lcminthreads)
  end
  def set_queue_depth(this : IThreadPoolKnobs*, lcqueuedepth : Int32) : HRESULT
    @lpVtbl.value.set_queue_depth.call(this, lcqueuedepth)
  end
end
struct LibWin32::IComStaThreadPoolKnobs
  def query_interface(this : IComStaThreadPoolKnobs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComStaThreadPoolKnobs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComStaThreadPoolKnobs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_min_thread_count(this : IComStaThreadPoolKnobs*, minthreads : UInt32) : HRESULT
    @lpVtbl.value.set_min_thread_count.call(this, minthreads)
  end
  def get_min_thread_count(this : IComStaThreadPoolKnobs*, minthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_min_thread_count.call(this, minthreads)
  end
  def set_max_thread_count(this : IComStaThreadPoolKnobs*, maxthreads : UInt32) : HRESULT
    @lpVtbl.value.set_max_thread_count.call(this, maxthreads)
  end
  def get_max_thread_count(this : IComStaThreadPoolKnobs*, maxthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_max_thread_count.call(this, maxthreads)
  end
  def set_activity_per_thread(this : IComStaThreadPoolKnobs*, activitiesperthread : UInt32) : HRESULT
    @lpVtbl.value.set_activity_per_thread.call(this, activitiesperthread)
  end
  def get_activity_per_thread(this : IComStaThreadPoolKnobs*, activitiesperthread : UInt32*) : HRESULT
    @lpVtbl.value.get_activity_per_thread.call(this, activitiesperthread)
  end
  def set_activity_ratio(this : IComStaThreadPoolKnobs*, activityratio : Float64) : HRESULT
    @lpVtbl.value.set_activity_ratio.call(this, activityratio)
  end
  def get_activity_ratio(this : IComStaThreadPoolKnobs*, activityratio : Float64*) : HRESULT
    @lpVtbl.value.get_activity_ratio.call(this, activityratio)
  end
  def get_thread_count(this : IComStaThreadPoolKnobs*, pdwthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_thread_count.call(this, pdwthreads)
  end
  def get_queue_depth(this : IComStaThreadPoolKnobs*, pdwqdepth : UInt32*) : HRESULT
    @lpVtbl.value.get_queue_depth.call(this, pdwqdepth)
  end
  def set_queue_depth(this : IComStaThreadPoolKnobs*, dwqdepth : Int32) : HRESULT
    @lpVtbl.value.set_queue_depth.call(this, dwqdepth)
  end
end
struct LibWin32::IComMtaThreadPoolKnobs
  def query_interface(this : IComMtaThreadPoolKnobs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComMtaThreadPoolKnobs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComMtaThreadPoolKnobs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def mta_set_max_thread_count(this : IComMtaThreadPoolKnobs*, dwmaxthreads : UInt32) : HRESULT
    @lpVtbl.value.mta_set_max_thread_count.call(this, dwmaxthreads)
  end
  def mta_get_max_thread_count(this : IComMtaThreadPoolKnobs*, pdwmaxthreads : UInt32*) : HRESULT
    @lpVtbl.value.mta_get_max_thread_count.call(this, pdwmaxthreads)
  end
  def mta_set_throttle_value(this : IComMtaThreadPoolKnobs*, dwthrottle : UInt32) : HRESULT
    @lpVtbl.value.mta_set_throttle_value.call(this, dwthrottle)
  end
  def mta_get_throttle_value(this : IComMtaThreadPoolKnobs*, pdwthrottle : UInt32*) : HRESULT
    @lpVtbl.value.mta_get_throttle_value.call(this, pdwthrottle)
  end
end
struct LibWin32::IComStaThreadPoolKnobs2
  def query_interface(this : IComStaThreadPoolKnobs2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComStaThreadPoolKnobs2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComStaThreadPoolKnobs2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_min_thread_count(this : IComStaThreadPoolKnobs2*, minthreads : UInt32) : HRESULT
    @lpVtbl.value.set_min_thread_count.call(this, minthreads)
  end
  def get_min_thread_count(this : IComStaThreadPoolKnobs2*, minthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_min_thread_count.call(this, minthreads)
  end
  def set_max_thread_count(this : IComStaThreadPoolKnobs2*, maxthreads : UInt32) : HRESULT
    @lpVtbl.value.set_max_thread_count.call(this, maxthreads)
  end
  def get_max_thread_count(this : IComStaThreadPoolKnobs2*, maxthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_max_thread_count.call(this, maxthreads)
  end
  def set_activity_per_thread(this : IComStaThreadPoolKnobs2*, activitiesperthread : UInt32) : HRESULT
    @lpVtbl.value.set_activity_per_thread.call(this, activitiesperthread)
  end
  def get_activity_per_thread(this : IComStaThreadPoolKnobs2*, activitiesperthread : UInt32*) : HRESULT
    @lpVtbl.value.get_activity_per_thread.call(this, activitiesperthread)
  end
  def set_activity_ratio(this : IComStaThreadPoolKnobs2*, activityratio : Float64) : HRESULT
    @lpVtbl.value.set_activity_ratio.call(this, activityratio)
  end
  def get_activity_ratio(this : IComStaThreadPoolKnobs2*, activityratio : Float64*) : HRESULT
    @lpVtbl.value.get_activity_ratio.call(this, activityratio)
  end
  def get_thread_count(this : IComStaThreadPoolKnobs2*, pdwthreads : UInt32*) : HRESULT
    @lpVtbl.value.get_thread_count.call(this, pdwthreads)
  end
  def get_queue_depth(this : IComStaThreadPoolKnobs2*, pdwqdepth : UInt32*) : HRESULT
    @lpVtbl.value.get_queue_depth.call(this, pdwqdepth)
  end
  def set_queue_depth(this : IComStaThreadPoolKnobs2*, dwqdepth : Int32) : HRESULT
    @lpVtbl.value.set_queue_depth.call(this, dwqdepth)
  end
  def get_max_cpu_load(this : IComStaThreadPoolKnobs2*, pdwload : UInt32*) : HRESULT
    @lpVtbl.value.get_max_cpu_load.call(this, pdwload)
  end
  def set_max_cpu_load(this : IComStaThreadPoolKnobs2*, pdwload : Int32) : HRESULT
    @lpVtbl.value.set_max_cpu_load.call(this, pdwload)
  end
  def get_cpu_metric_enabled(this : IComStaThreadPoolKnobs2*, pbmetricenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cpu_metric_enabled.call(this, pbmetricenabled)
  end
  def set_cpu_metric_enabled(this : IComStaThreadPoolKnobs2*, bmetricenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_cpu_metric_enabled.call(this, bmetricenabled)
  end
  def get_create_threads_aggressively(this : IComStaThreadPoolKnobs2*, pbmetricenabled : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_create_threads_aggressively.call(this, pbmetricenabled)
  end
  def set_create_threads_aggressively(this : IComStaThreadPoolKnobs2*, bmetricenabled : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_create_threads_aggressively.call(this, bmetricenabled)
  end
  def get_max_csr(this : IComStaThreadPoolKnobs2*, pdwcsr : UInt32*) : HRESULT
    @lpVtbl.value.get_max_csr.call(this, pdwcsr)
  end
  def set_max_csr(this : IComStaThreadPoolKnobs2*, dwcsr : Int32) : HRESULT
    @lpVtbl.value.set_max_csr.call(this, dwcsr)
  end
  def get_wait_time_for_thread_cleanup(this : IComStaThreadPoolKnobs2*, pdwthreadcleanupwaittime : UInt32*) : HRESULT
    @lpVtbl.value.get_wait_time_for_thread_cleanup.call(this, pdwthreadcleanupwaittime)
  end
  def set_wait_time_for_thread_cleanup(this : IComStaThreadPoolKnobs2*, dwthreadcleanupwaittime : Int32) : HRESULT
    @lpVtbl.value.set_wait_time_for_thread_cleanup.call(this, dwthreadcleanupwaittime)
  end
end
struct LibWin32::IProcessInitializer
  def query_interface(this : IProcessInitializer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProcessInitializer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProcessInitializer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def startup(this : IProcessInitializer*, punkprocesscontrol : IUnknown) : HRESULT
    @lpVtbl.value.startup.call(this, punkprocesscontrol)
  end
  def shutdown(this : IProcessInitializer*) : HRESULT
    @lpVtbl.value.shutdown.call(this)
  end
end
struct LibWin32::IServicePoolConfig
  def query_interface(this : IServicePoolConfig*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServicePoolConfig*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServicePoolConfig*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def put_max_pool_size(this : IServicePoolConfig*, dwmaxpool : UInt32) : HRESULT
    @lpVtbl.value.put_max_pool_size.call(this, dwmaxpool)
  end
  def get_max_pool_size(this : IServicePoolConfig*, pdwmaxpool : UInt32*) : HRESULT
    @lpVtbl.value.get_max_pool_size.call(this, pdwmaxpool)
  end
  def put_min_pool_size(this : IServicePoolConfig*, dwminpool : UInt32) : HRESULT
    @lpVtbl.value.put_min_pool_size.call(this, dwminpool)
  end
  def get_min_pool_size(this : IServicePoolConfig*, pdwminpool : UInt32*) : HRESULT
    @lpVtbl.value.get_min_pool_size.call(this, pdwminpool)
  end
  def put_creation_timeout(this : IServicePoolConfig*, dwcreationtimeout : UInt32) : HRESULT
    @lpVtbl.value.put_creation_timeout.call(this, dwcreationtimeout)
  end
  def get_creation_timeout(this : IServicePoolConfig*, pdwcreationtimeout : UInt32*) : HRESULT
    @lpVtbl.value.get_creation_timeout.call(this, pdwcreationtimeout)
  end
  def put_transaction_affinity(this : IServicePoolConfig*, ftxaffinity : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_transaction_affinity.call(this, ftxaffinity)
  end
  def get_transaction_affinity(this : IServicePoolConfig*, pftxaffinity : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_transaction_affinity.call(this, pftxaffinity)
  end
  def put_class_factory(this : IServicePoolConfig*, pfactory : IClassFactory) : HRESULT
    @lpVtbl.value.put_class_factory.call(this, pfactory)
  end
  def get_class_factory(this : IServicePoolConfig*, pfactory : IClassFactory*) : HRESULT
    @lpVtbl.value.get_class_factory.call(this, pfactory)
  end
end
struct LibWin32::IServicePool
  def query_interface(this : IServicePool*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IServicePool*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IServicePool*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : IServicePool*, ppoolconfig : IUnknown) : HRESULT
    @lpVtbl.value.initialize.call(this, ppoolconfig)
  end
  def get_object(this : IServicePool*, riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.get_object.call(this, riid, ppv)
  end
  def shutdown(this : IServicePool*) : HRESULT
    @lpVtbl.value.shutdown.call(this)
  end
end
struct LibWin32::IManagedPooledObj
  def query_interface(this : IManagedPooledObj*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IManagedPooledObj*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IManagedPooledObj*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_held(this : IManagedPooledObj*, m_bheld : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_held.call(this, m_bheld)
  end
end
struct LibWin32::IManagedPoolAction
  def query_interface(this : IManagedPoolAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IManagedPoolAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IManagedPoolAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def last_release(this : IManagedPoolAction*) : HRESULT
    @lpVtbl.value.last_release.call(this)
  end
end
struct LibWin32::IManagedObjectInfo
  def query_interface(this : IManagedObjectInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IManagedObjectInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IManagedObjectInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_i_unknown(this : IManagedObjectInfo*, punk : IUnknown*) : HRESULT
    @lpVtbl.value.get_i_unknown.call(this, punk)
  end
  def get_i_object_control(this : IManagedObjectInfo*, pctrl : IObjectControl*) : HRESULT
    @lpVtbl.value.get_i_object_control.call(this, pctrl)
  end
  def set_in_pool(this : IManagedObjectInfo*, binpool : LibC::BOOL, ppooledobj : IManagedPooledObj) : HRESULT
    @lpVtbl.value.set_in_pool.call(this, binpool, ppooledobj)
  end
  def set_wrapper_strength(this : IManagedObjectInfo*, bstrong : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_wrapper_strength.call(this, bstrong)
  end
end
struct LibWin32::IAppDomainHelper
  def query_interface(this : IAppDomainHelper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAppDomainHelper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAppDomainHelper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IAppDomainHelper*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IAppDomainHelper*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IAppDomainHelper*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IAppDomainHelper*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def initialize(this : IAppDomainHelper*, punkad : IUnknown, midl__iappdomainhelper0000 : LibC::IntPtrT, ppool : Void*) : HRESULT
    @lpVtbl.value.initialize.call(this, punkad, midl__iappdomainhelper0000, ppool)
  end
  def do_callback(this : IAppDomainHelper*, punkad : IUnknown, midl__iappdomainhelper0001 : LibC::IntPtrT, ppool : Void*) : HRESULT
    @lpVtbl.value.do_callback.call(this, punkad, midl__iappdomainhelper0001, ppool)
  end
end
struct LibWin32::IAssemblyLocator
  def query_interface(this : IAssemblyLocator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAssemblyLocator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAssemblyLocator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IAssemblyLocator*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IAssemblyLocator*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IAssemblyLocator*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IAssemblyLocator*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_modules(this : IAssemblyLocator*, applicationdir : UInt8*, applicationname : UInt8*, assemblyname : UInt8*, pmodules : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_modules.call(this, applicationdir, applicationname, assemblyname, pmodules)
  end
end
struct LibWin32::IManagedActivationEvents
  def query_interface(this : IManagedActivationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IManagedActivationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IManagedActivationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_managed_stub(this : IManagedActivationEvents*, pinfo : IManagedObjectInfo, fdist : LibC::BOOL) : HRESULT
    @lpVtbl.value.create_managed_stub.call(this, pinfo, fdist)
  end
  def destroy_managed_stub(this : IManagedActivationEvents*, pinfo : IManagedObjectInfo) : HRESULT
    @lpVtbl.value.destroy_managed_stub.call(this, pinfo)
  end
end
struct LibWin32::ISendMethodEvents
  def query_interface(this : ISendMethodEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISendMethodEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISendMethodEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def send_method_call(this : ISendMethodEvents*, pidentity : Void*, riid : Guid*, dwmeth : UInt32) : HRESULT
    @lpVtbl.value.send_method_call.call(this, pidentity, riid, dwmeth)
  end
  def send_method_return(this : ISendMethodEvents*, pidentity : Void*, riid : Guid*, dwmeth : UInt32, hrcall : HRESULT, hrserver : HRESULT) : HRESULT
    @lpVtbl.value.send_method_return.call(this, pidentity, riid, dwmeth, hrcall, hrserver)
  end
end
struct LibWin32::ITransactionResourcePool
  def query_interface(this : ITransactionResourcePool*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionResourcePool*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionResourcePool*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def put_resource(this : ITransactionResourcePool*, ppool : IObjPool, punk : IUnknown) : HRESULT
    @lpVtbl.value.put_resource.call(this, ppool, punk)
  end
  def get_resource(this : ITransactionResourcePool*, ppool : IObjPool, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_resource.call(this, ppool, ppunk)
  end
end
struct LibWin32::IMTSCall
  def query_interface(this : IMTSCall*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMTSCall*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMTSCall*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def on_call(this : IMTSCall*) : HRESULT
    @lpVtbl.value.on_call.call(this)
  end
end
struct LibWin32::IContextProperties
  def query_interface(this : IContextProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IContextProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IContextProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def count(this : IContextProperties*, plcount : Int32*) : HRESULT
    @lpVtbl.value.count.call(this, plcount)
  end
  def get_property(this : IContextProperties*, name : UInt8*, pproperty : VARIANT*) : HRESULT
    @lpVtbl.value.get_property.call(this, name, pproperty)
  end
  def enum_names(this : IContextProperties*, ppenum : IEnumNames*) : HRESULT
    @lpVtbl.value.enum_names.call(this, ppenum)
  end
  def set_property(this : IContextProperties*, name : UInt8*, property : VARIANT) : HRESULT
    @lpVtbl.value.set_property.call(this, name, property)
  end
  def remove_property(this : IContextProperties*, name : UInt8*) : HRESULT
    @lpVtbl.value.remove_property.call(this, name)
  end
end
struct LibWin32::IObjPool
  def query_interface(this : IObjPool*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjPool*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjPool*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reserved1(this : IObjPool*) : Void
    @lpVtbl.value.reserved1.call(this)
  end
  def reserved2(this : IObjPool*) : Void
    @lpVtbl.value.reserved2.call(this)
  end
  def reserved3(this : IObjPool*) : Void
    @lpVtbl.value.reserved3.call(this)
  end
  def reserved4(this : IObjPool*) : Void
    @lpVtbl.value.reserved4.call(this)
  end
  def put_end_tx(this : IObjPool*, pobj : IUnknown) : Void
    @lpVtbl.value.put_end_tx.call(this, pobj)
  end
  def reserved5(this : IObjPool*) : Void
    @lpVtbl.value.reserved5.call(this)
  end
  def reserved6(this : IObjPool*) : Void
    @lpVtbl.value.reserved6.call(this)
  end
end
struct LibWin32::ITransactionProperty
  def query_interface(this : ITransactionProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransactionProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransactionProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def reserved1(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved1.call(this)
  end
  def reserved2(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved2.call(this)
  end
  def reserved3(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved3.call(this)
  end
  def reserved4(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved4.call(this)
  end
  def reserved5(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved5.call(this)
  end
  def reserved6(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved6.call(this)
  end
  def reserved7(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved7.call(this)
  end
  def reserved8(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved8.call(this)
  end
  def reserved9(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved9.call(this)
  end
  def get_transaction_resource_pool(this : ITransactionProperty*, pptxpool : ITransactionResourcePool*) : HRESULT
    @lpVtbl.value.get_transaction_resource_pool.call(this, pptxpool)
  end
  def reserved10(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved10.call(this)
  end
  def reserved11(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved11.call(this)
  end
  def reserved12(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved12.call(this)
  end
  def reserved13(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved13.call(this)
  end
  def reserved14(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved14.call(this)
  end
  def reserved15(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved15.call(this)
  end
  def reserved16(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved16.call(this)
  end
  def reserved17(this : ITransactionProperty*) : Void
    @lpVtbl.value.reserved17.call(this)
  end
end
struct LibWin32::IMTSActivity
  def query_interface(this : IMTSActivity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMTSActivity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMTSActivity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def synchronous_call(this : IMTSActivity*, pcall : IMTSCall) : HRESULT
    @lpVtbl.value.synchronous_call.call(this, pcall)
  end
  def async_call(this : IMTSActivity*, pcall : IMTSCall) : HRESULT
    @lpVtbl.value.async_call.call(this, pcall)
  end
  def reserved1(this : IMTSActivity*) : Void
    @lpVtbl.value.reserved1.call(this)
  end
  def bind_to_current_thread(this : IMTSActivity*) : HRESULT
    @lpVtbl.value.bind_to_current_thread.call(this)
  end
  def unbind_from_thread(this : IMTSActivity*) : HRESULT
    @lpVtbl.value.unbind_from_thread.call(this)
  end
end
