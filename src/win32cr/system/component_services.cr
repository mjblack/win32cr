require "./com.cr"
require "./../foundation.cr"
require "./distributed_transaction_coordinator.cr"

module Win32cr::System::ComponentServices
  TRACKER_STARTSTOP_EVENT = "Global\\COM+ Tracker Push Event"
  TRACKER_INIT_EVENT = "Global\\COM+ Tracker Init Event"
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

  enum COMAdminInUse
    COMAdminNotInUse = 0_i32
    COMAdminInUseByCatalog = 1_i32
    COMAdminInUseByRegistryUnknown = 2_i32
    COMAdminInUseByRegistryProxyStub = 3_i32
    COMAdminInUseByRegistryTypeLib = 4_i32
    COMAdminInUseByRegistryClsid = 5_i32
  end
  enum COMAdminComponentType
    COMAdmin32BitComponent = 1_i32
    COMAdmin64BitComponent = 2_i32
  end
  enum COMAdminApplicationInstallOptions
    COMAdminInstallNoUsers = 0_i32
    COMAdminInstallUsers = 1_i32
    COMAdminInstallForceOverwriteOfFiles = 2_i32
  end
  enum COMAdminApplicationExportOptions
    COMAdminExportNoUsers = 0_i32
    COMAdminExportUsers = 1_i32
    COMAdminExportApplicationProxy = 2_i32
    COMAdminExportForceOverwriteOfFiles = 4_i32
    COMAdminExportIn10Format = 16_i32
  end
  enum COMAdminThreadingModels
    COMAdminThreadingModelApartment = 0_i32
    COMAdminThreadingModelFree = 1_i32
    COMAdminThreadingModelMain = 2_i32
    COMAdminThreadingModelBoth = 3_i32
    COMAdminThreadingModelNeutral = 4_i32
    COMAdminThreadingModelNotSpecified = 5_i32
  end
  enum COMAdminTransactionOptions
    COMAdminTransactionIgnored = 0_i32
    COMAdminTransactionNone = 1_i32
    COMAdminTransactionSupported = 2_i32
    COMAdminTransactionRequired = 3_i32
    COMAdminTransactionRequiresNew = 4_i32
  end
  enum COMAdminTxIsolationLevelOptions
    COMAdminTxIsolationLevelAny = 0_i32
    COMAdminTxIsolationLevelReadUnCommitted = 1_i32
    COMAdminTxIsolationLevelReadCommitted = 2_i32
    COMAdminTxIsolationLevelRepeatableRead = 3_i32
    COMAdminTxIsolationLevelSerializable = 4_i32
  end
  enum COMAdminSynchronizationOptions
    COMAdminSynchronizationIgnored = 0_i32
    COMAdminSynchronizationNone = 1_i32
    COMAdminSynchronizationSupported = 2_i32
    COMAdminSynchronizationRequired = 3_i32
    COMAdminSynchronizationRequiresNew = 4_i32
  end
  enum COMAdminActivationOptions
    COMAdminActivationInproc = 0_i32
    COMAdminActivationLocal = 1_i32
  end
  enum COMAdminAccessChecksLevelOptions
    COMAdminAccessChecksApplicationLevel = 0_i32
    COMAdminAccessChecksApplicationComponentLevel = 1_i32
  end
  enum COMAdminAuthenticationLevelOptions
    COMAdminAuthenticationDefault = 0_i32
    COMAdminAuthenticationNone = 1_i32
    COMAdminAuthenticationConnect = 2_i32
    COMAdminAuthenticationCall = 3_i32
    COMAdminAuthenticationPacket = 4_i32
    COMAdminAuthenticationIntegrity = 5_i32
    COMAdminAuthenticationPrivacy = 6_i32
  end
  enum COMAdminImpersonationLevelOptions
    COMAdminImpersonationAnonymous = 1_i32
    COMAdminImpersonationIdentify = 2_i32
    COMAdminImpersonationImpersonate = 3_i32
    COMAdminImpersonationDelegate = 4_i32
  end
  enum COMAdminAuthenticationCapabilitiesOptions
    COMAdminAuthenticationCapabilitiesNone = 0_i32
    COMAdminAuthenticationCapabilitiesSecureReference = 2_i32
    COMAdminAuthenticationCapabilitiesStaticCloaking = 32_i32
    COMAdminAuthenticationCapabilitiesDynamicCloaking = 64_i32
  end
  enum COMAdminOS
    COMAdminOSNotInitialized = 0_i32
    COMAdminOSWindows3_1 = 1_i32
    COMAdminOSWindows9x = 2_i32
    COMAdminOSWindows2000 = 3_i32
    COMAdminOSWindows2000AdvancedServer = 4_i32
    COMAdminOSWindows2000Unknown = 5_i32
    COMAdminOSUnknown = 6_i32
    COMAdminOSWindowsXPPersonal = 11_i32
    COMAdminOSWindowsXPProfessional = 12_i32
    COMAdminOSWindowsNETStandardServer = 13_i32
    COMAdminOSWindowsNETEnterpriseServer = 14_i32
    COMAdminOSWindowsNETDatacenterServer = 15_i32
    COMAdminOSWindowsNETWebServer = 16_i32
    COMAdminOSWindowsLonghornPersonal = 17_i32
    COMAdminOSWindowsLonghornProfessional = 18_i32
    COMAdminOSWindowsLonghornStandardServer = 19_i32
    COMAdminOSWindowsLonghornEnterpriseServer = 20_i32
    COMAdminOSWindowsLonghornDatacenterServer = 21_i32
    COMAdminOSWindowsLonghornWebServer = 22_i32
    COMAdminOSWindows7Personal = 23_i32
    COMAdminOSWindows7Professional = 24_i32
    COMAdminOSWindows7StandardServer = 25_i32
    COMAdminOSWindows7EnterpriseServer = 26_i32
    COMAdminOSWindows7DatacenterServer = 27_i32
    COMAdminOSWindows7WebServer = 28_i32
    COMAdminOSWindows8Personal = 29_i32
    COMAdminOSWindows8Professional = 30_i32
    COMAdminOSWindows8StandardServer = 31_i32
    COMAdminOSWindows8EnterpriseServer = 32_i32
    COMAdminOSWindows8DatacenterServer = 33_i32
    COMAdminOSWindows8WebServer = 34_i32
    COMAdminOSWindowsBluePersonal = 35_i32
    COMAdminOSWindowsBlueProfessional = 36_i32
    COMAdminOSWindowsBlueStandardServer = 37_i32
    COMAdminOSWindowsBlueEnterpriseServer = 38_i32
    COMAdminOSWindowsBlueDatacenterServer = 39_i32
    COMAdminOSWindowsBlueWebServer = 40_i32
  end
  enum COMAdminServiceOptions
    COMAdminServiceLoadBalanceRouter = 1_i32
  end
  enum COMAdminServiceStatusOptions
    COMAdminServiceStopped = 0_i32
    COMAdminServiceStartPending = 1_i32
    COMAdminServiceStopPending = 2_i32
    COMAdminServiceRunning = 3_i32
    COMAdminServiceContinuePending = 4_i32
    COMAdminServicePausePending = 5_i32
    COMAdminServicePaused = 6_i32
    COMAdminServiceUnknownState = 7_i32
  end
  enum COMAdminQCMessageAuthenticateOptions
    COMAdminQCMessageAuthenticateSecureApps = 0_i32
    COMAdminQCMessageAuthenticateOff = 1_i32
    COMAdminQCMessageAuthenticateOn = 2_i32
  end
  enum COMAdminFileFlags
    COMAdminFileFlagLoadable = 1_i32
    COMAdminFileFlagCOM = 2_i32
    COMAdminFileFlagContainsPS = 4_i32
    COMAdminFileFlagContainsComp = 8_i32
    COMAdminFileFlagContainsTLB = 16_i32
    COMAdminFileFlagSelfReg = 32_i32
    COMAdminFileFlagSelfUnReg = 64_i32
    COMAdminFileFlagUnloadableDLL = 128_i32
    COMAdminFileFlagDoesNotExist = 256_i32
    COMAdminFileFlagAlreadyInstalled = 512_i32
    COMAdminFileFlagBadTLB = 1024_i32
    COMAdminFileFlagGetClassObjFailed = 2048_i32
    COMAdminFileFlagClassNotAvailable = 4096_i32
    COMAdminFileFlagRegistrar = 8192_i32
    COMAdminFileFlagNoRegistrar = 16384_i32
    COMAdminFileFlagDLLRegsvrFailed = 32768_i32
    COMAdminFileFlagRegTLBFailed = 65536_i32
    COMAdminFileFlagRegistrarFailed = 131072_i32
    COMAdminFileFlagError = 262144_i32
  end
  enum COMAdminComponentFlags
    COMAdminCompFlagTypeInfoFound = 1_i32
    COMAdminCompFlagCOMPlusPropertiesFound = 2_i32
    COMAdminCompFlagProxyFound = 4_i32
    COMAdminCompFlagInterfacesFound = 8_i32
    COMAdminCompFlagAlreadyInstalled = 16_i32
    COMAdminCompFlagNotInApplication = 32_i32
  end
  enum COMAdminErrorCodes
    COMAdminErrObjectErrors = -2146368511_i32
    COMAdminErrObjectInvalid = -2146368510_i32
    COMAdminErrKeyMissing = -2146368509_i32
    COMAdminErrAlreadyInstalled = -2146368508_i32
    COMAdminErrAppFileWriteFail = -2146368505_i32
    COMAdminErrAppFileReadFail = -2146368504_i32
    COMAdminErrAppFileVersion = -2146368503_i32
    COMAdminErrBadPath = -2146368502_i32
    COMAdminErrApplicationExists = -2146368501_i32
    COMAdminErrRoleExists = -2146368500_i32
    COMAdminErrCantCopyFile = -2146368499_i32
    COMAdminErrNoUser = -2146368497_i32
    COMAdminErrInvalidUserids = -2146368496_i32
    COMAdminErrNoRegistryCLSID = -2146368495_i32
    COMAdminErrBadRegistryProgID = -2146368494_i32
    COMAdminErrAuthenticationLevel = -2146368493_i32
    COMAdminErrUserPasswdNotValid = -2146368492_i32
    COMAdminErrCLSIDOrIIDMismatch = -2146368488_i32
    COMAdminErrRemoteInterface = -2146368487_i32
    COMAdminErrDllRegisterServer = -2146368486_i32
    COMAdminErrNoServerShare = -2146368485_i32
    COMAdminErrDllLoadFailed = -2146368483_i32
    COMAdminErrBadRegistryLibID = -2146368482_i32
    COMAdminErrAppDirNotFound = -2146368481_i32
    COMAdminErrRegistrarFailed = -2146368477_i32
    COMAdminErrCompFileDoesNotExist = -2146368476_i32
    COMAdminErrCompFileLoadDLLFail = -2146368475_i32
    COMAdminErrCompFileGetClassObj = -2146368474_i32
    COMAdminErrCompFileClassNotAvail = -2146368473_i32
    COMAdminErrCompFileBadTLB = -2146368472_i32
    COMAdminErrCompFileNotInstallable = -2146368471_i32
    COMAdminErrNotChangeable = -2146368470_i32
    COMAdminErrNotDeletable = -2146368469_i32
    COMAdminErrSession = -2146368468_i32
    COMAdminErrCompMoveLocked = -2146368467_i32
    COMAdminErrCompMoveBadDest = -2146368466_i32
    COMAdminErrRegisterTLB = -2146368464_i32
    COMAdminErrSystemApp = -2146368461_i32
    COMAdminErrCompFileNoRegistrar = -2146368460_i32
    COMAdminErrCoReqCompInstalled = -2146368459_i32
    COMAdminErrServiceNotInstalled = -2146368458_i32
    COMAdminErrPropertySaveFailed = -2146368457_i32
    COMAdminErrObjectExists = -2146368456_i32
    COMAdminErrComponentExists = -2146368455_i32
    COMAdminErrRegFileCorrupt = -2146368453_i32
    COMAdminErrPropertyOverflow = -2146368452_i32
    COMAdminErrNotInRegistry = -2146368450_i32
    COMAdminErrObjectNotPoolable = -2146368449_i32
    COMAdminErrApplidMatchesClsid = -2146368442_i32
    COMAdminErrRoleDoesNotExist = -2146368441_i32
    COMAdminErrStartAppNeedsComponents = -2146368440_i32
    COMAdminErrRequiresDifferentPlatform = -2146368439_i32
    COMAdminErrQueuingServiceNotAvailable = -2146367998_i32
    COMAdminErrObjectParentMissing = -2146367480_i32
    COMAdminErrObjectDoesNotExist = -2146367479_i32
    COMAdminErrCanNotExportAppProxy = -2146368438_i32
    COMAdminErrCanNotStartApp = -2146368437_i32
    COMAdminErrCanNotExportSystemApp = -2146368436_i32
    COMAdminErrCanNotSubscribeToComponent = -2146368435_i32
    COMAdminErrAppNotRunning = -2146367478_i32
    COMAdminErrEventClassCannotBeSubscriber = -2146368434_i32
    COMAdminErrLibAppProxyIncompatible = -2146368433_i32
    COMAdminErrBasePartitionOnly = -2146368432_i32
    COMAdminErrDuplicatePartitionName = -2146368425_i32
    COMAdminErrPartitionInUse = -2146368423_i32
    COMAdminErrImportedComponentsNotAllowed = -2146368421_i32
    COMAdminErrRegdbNotInitialized = -2146368398_i32
    COMAdminErrRegdbNotOpen = -2146368397_i32
    COMAdminErrRegdbSystemErr = -2146368396_i32
    COMAdminErrRegdbAlreadyRunning = -2146368395_i32
    COMAdminErrMigVersionNotSupported = -2146368384_i32
    COMAdminErrMigSchemaNotFound = -2146368383_i32
    COMAdminErrCatBitnessMismatch = -2146368382_i32
    COMAdminErrCatUnacceptableBitness = -2146368381_i32
    COMAdminErrCatWrongAppBitnessBitness = -2146368380_i32
    COMAdminErrCatPauseResumeNotSupported = -2146368379_i32
    COMAdminErrCatServerFault = -2146368378_i32
    COMAdminErrCantRecycleLibraryApps = -2146367473_i32
    COMAdminErrCantRecycleServiceApps = -2146367471_i32
    COMAdminErrProcessAlreadyRecycled = -2146367470_i32
    COMAdminErrPausedProcessMayNotBeRecycled = -2146367469_i32
    COMAdminErrInvalidPartition = -2146367477_i32
    COMAdminErrPartitionMsiOnly = -2146367463_i32
    COMAdminErrStartAppDisabled = -2146368431_i32
    COMAdminErrCompMoveSource = -2146367460_i32
    COMAdminErrCompMoveDest = -2146367459_i32
    COMAdminErrCompMovePrivate = -2146367458_i32
    COMAdminErrCannotCopyEventClass = -2146367456_i32
  end
  enum TRACKING_COLL_TYPE
    TRKCOLL_PROCESSES = 0_i32
    TRKCOLL_APPLICATIONS = 1_i32
    TRKCOLL_COMPONENTS = 2_i32
  end
  enum DUMPTYPE
    DUMPTYPE_FULL = 0_i32
    DUMPTYPE_MINI = 1_i32
    DUMPTYPE_NONE = 2_i32
  end
  enum COMPLUS_APPTYPE
    APPTYPE_UNKNOWN = -1_i32
    APPTYPE_SERVER = 1_i32
    APPTYPE_LIBRARY = 0_i32
    APPTYPE_SWC = 2_i32
  end
  enum GetAppTrackerDataFlags
    GATD_INCLUDE_PROCESS_EXE_NAME = 1_i32
    GATD_INCLUDE_LIBRARY_APPS = 2_i32
    GATD_INCLUDE_SWC = 4_i32
    GATD_INCLUDE_CLASS_NAME = 8_i32
    GATD_INCLUDE_APPLICATION_NAME = 16_i32
  end
  enum TransactionVote
    TxCommit = 0_i32
    TxAbort = 1_i32
  end
  enum CrmTransactionState
    TxState_Active = 0_i32
    TxState_Committed = 1_i32
    TxState_Aborted = 2_i32
    TxState_Indoubt = 3_i32
  end
  enum CSC_InheritanceConfig
    CSC_Inherit = 0_i32
    CSC_Ignore = 1_i32
  end
  enum CSC_ThreadPool
    CSC_ThreadPoolNone = 0_i32
    CSC_ThreadPoolInherit = 1_i32
    CSC_STAThreadPool = 2_i32
    CSC_MTAThreadPool = 3_i32
  end
  enum CSC_Binding
    CSC_NoBinding = 0_i32
    CSC_BindToPoolThread = 1_i32
  end
  enum CSC_TransactionConfig
    CSC_NoTransaction = 0_i32
    CSC_IfContainerIsTransactional = 1_i32
    CSC_CreateTransactionIfNecessary = 2_i32
    CSC_NewTransaction = 3_i32
  end
  enum CSC_SynchronizationConfig
    CSC_NoSynchronization = 0_i32
    CSC_IfContainerIsSynchronized = 1_i32
    CSC_NewSynchronizationIfNecessary = 2_i32
    CSC_NewSynchronization = 3_i32
  end
  enum CSC_TrackerConfig
    CSC_DontUseTracker = 0_i32
    CSC_UseTracker = 1_i32
  end
  enum CSC_PartitionConfig
    CSC_NoPartition = 0_i32
    CSC_InheritPartition = 1_i32
    CSC_NewPartition = 2_i32
  end
  enum CSC_IISIntrinsicsConfig
    CSC_NoIISIntrinsics = 0_i32
    CSC_InheritIISIntrinsics = 1_i32
  end
  enum CSC_COMTIIntrinsicsConfig
    CSC_NoCOMTIIntrinsics = 0_i32
    CSC_InheritCOMTIIntrinsics = 1_i32
  end
  enum CSC_SxsConfig
    CSC_NoSxs = 0_i32
    CSC_InheritSxs = 1_i32
    CSC_NewSxs = 2_i32
  end
  enum AutoSvcs_Error_Constants : UInt32
    Mtserrctxaborted = 2147803138_u32
    Mtserrctxaborting = 2147803139_u32
    Mtserrctxnocontext = 2147803140_u32
    Mtserrctxnotregistered = 2147803141_u32
    Mtserrctxsynchtimeout = 2147803142_u32
    Mtserrctxoldreference = 2147803143_u32
    Mtserrctxrolenotfound = 2147803148_u32
    Mtserrctxnosecurity = 2147803149_u32
    Mtserrctxwrongthread = 2147803150_u32
    Mtserrctxtmnotavailable = 2147803151_u32
    Comqcerrapplicationnotqueued = 2148599296_u32
    Comqcerrnoqueueableinterfaces = 2148599297_u32
    Comqcerrqueuingservicenotavailable = 2148599298_u32
    Comqcerrqueuetransactmismatch = 2148599299_u32
    Comqcerrrecordermarshalled = 2148599300_u32
    Comqcerroutparam = 2148599301_u32
    Comqcerrrecordernottrusted = 2148599302_u32
    Comqcerrpsload = 2148599303_u32
    Comqcerrmarshaledobjsametxn = 2148599304_u32
    Comqcerrinvalidmessage = 2148599376_u32
    Comqcerrmsmqsidunavailable = 2148599377_u32
    Comqcerrwrongmsgextension = 2148599378_u32
    Comqcerrmsmqserviceunavailable = 2148599379_u32
    Comqcerrmsgnotauthenticated = 2148599380_u32
    Comqcerrmsmqconnectorused = 2148599381_u32
    Comqcerrbadmarshaledobject = 2148599382_u32
  end
  enum LockModes
    LockSetGet = 0_i32
    LockMethod = 1_i32
  end
  enum ReleaseModes
    Standard = 0_i32
    Process = 1_i32
  end
  enum CRMFLAGS
    CRMFLAG_FORGETTARGET = 1_i32
    CRMFLAG_WRITTENDURINGPREPARE = 2_i32
    CRMFLAG_WRITTENDURINGCOMMIT = 4_i32
    CRMFLAG_WRITTENDURINGABORT = 8_i32
    CRMFLAG_WRITTENDURINGRECOVERY = 16_i32
    CRMFLAG_WRITTENDURINGREPLAY = 32_i32
    CRMFLAG_REPLAYINPROGRESS = 64_i32
  end
  enum CRMREGFLAGS
    CRMREGFLAG_PREPAREPHASE = 1_i32
    CRMREGFLAG_COMMITPHASE = 2_i32
    CRMREGFLAG_ABORTPHASE = 4_i32
    CRMREGFLAG_ALLPHASES = 7_i32
    CRMREGFLAG_FAILIFINDOUBTSREMAIN = 16_i32
  end

  @[Extern]
  record COMSVCSEVENTINFO,
    cbSize : UInt32,
    dwPid : UInt32,
    lTime : Int64,
    lMicroTime : Int32,
    perfCount : Int64,
    guidApp : LibC::GUID,
    sMachineName : Win32cr::Foundation::PWSTR

  @[Extern]
  record RECYCLE_INFO,
    guidCombaseProcessIdentifier : LibC::GUID,
    process_start_time : Int64,
    dwRecycleLifetimeLimit : UInt32,
    dwRecycleMemoryLimit : UInt32,
    dwRecycleExpirationTimeout : UInt32

  @[Extern]
  record HANG_INFO,
    fAppHangMonitorEnabled : Win32cr::Foundation::BOOL,
    fTerminateOnHang : Win32cr::Foundation::BOOL,
    dump_type : Win32cr::System::ComponentServices::DUMPTYPE,
    dwHangTimeout : UInt32,
    dwDumpCount : UInt32,
    dwInfoMsgCount : UInt32

  @[Extern]
  record CAppStatistics,
    m_cTotalCalls : UInt32,
    m_cTotalInstances : UInt32,
    m_cTotalClasses : UInt32,
    m_cCallsPerSecond : UInt32

  @[Extern]
  record CAppData,
    m_idApp : UInt32,
    m_szAppGuid : UInt16[40],
    m_dwAppProcessId : UInt32,
    m_AppStatistics : Win32cr::System::ComponentServices::CAppStatistics

  @[Extern]
  record CCLSIDData,
    m_clsid : LibC::GUID,
    m_cReferences : UInt32,
    m_cBound : UInt32,
    m_cPooled : UInt32,
    m_cInCall : UInt32,
    m_dwRespTime : UInt32,
    m_cCallsCompleted : UInt32,
    m_cCallsFailed : UInt32

  @[Extern]
  record CCLSIDData2,
    m_clsid : LibC::GUID,
    m_appid : LibC::GUID,
    m_partid : LibC::GUID,
    m_pwszAppName : Win32cr::Foundation::PWSTR,
    m_pwszCtxName : Win32cr::Foundation::PWSTR,
    m_eAppType : Win32cr::System::ComponentServices::COMPLUS_APPTYPE,
    m_cReferences : UInt32,
    m_cBound : UInt32,
    m_cPooled : UInt32,
    m_cInCall : UInt32,
    m_dwRespTime : UInt32,
    m_cCallsCompleted : UInt32,
    m_cCallsFailed : UInt32

  @[Extern]
  record ApplicationProcessSummary,
    partition_id_primary_application : LibC::GUID,
    application_id_primary_application : LibC::GUID,
    application_instance_id : LibC::GUID,
    process_id : UInt32,
    type__ : Win32cr::System::ComponentServices::COMPLUS_APPTYPE,
    process_exe_name : Win32cr::Foundation::PWSTR,
    is_service : Win32cr::Foundation::BOOL,
    is_paused : Win32cr::Foundation::BOOL,
    is_recycled : Win32cr::Foundation::BOOL

  @[Extern]
  record ApplicationProcessStatistics,
    num_calls_outstanding : UInt32,
    num_tracked_components : UInt32,
    num_component_instances : UInt32,
    avg_calls_per_second : UInt32,
    reserved1 : UInt32,
    reserved2 : UInt32,
    reserved3 : UInt32,
    reserved4 : UInt32

  @[Extern]
  record ApplicationProcessRecycleInfo,
    is_recyclable : Win32cr::Foundation::BOOL,
    is_recycled : Win32cr::Foundation::BOOL,
    time_recycled : Win32cr::Foundation::FILETIME,
    time_to_terminate : Win32cr::Foundation::FILETIME,
    recycle_reason_code : Int32,
    is_pending_recycle : Win32cr::Foundation::BOOL,
    has_automatic_lifetime_recycling : Win32cr::Foundation::BOOL,
    time_for_automatic_recycling : Win32cr::Foundation::FILETIME,
    memory_limit_in_kb : UInt32,
    memory_usage_in_kb_last_check : UInt32,
    activation_limit : UInt32,
    num_activations_last_reported : UInt32,
    call_limit : UInt32,
    num_calls_last_reported : UInt32

  @[Extern]
  record ApplicationSummary,
    application_instance_id : LibC::GUID,
    partition_id : LibC::GUID,
    application_id : LibC::GUID,
    type__ : Win32cr::System::ComponentServices::COMPLUS_APPTYPE,
    application_name : Win32cr::Foundation::PWSTR,
    num_tracked_components : UInt32,
    num_component_instances : UInt32

  @[Extern]
  record ComponentSummary,
    application_instance_id : LibC::GUID,
    partition_id : LibC::GUID,
    application_id : LibC::GUID,
    clsid : LibC::GUID,
    class_name : Win32cr::Foundation::PWSTR,
    application_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record ComponentStatistics,
    num_instances : UInt32,
    num_bound_references : UInt32,
    num_pooled_objects : UInt32,
    num_objects_in_call : UInt32,
    avg_response_time_in_ms : UInt32,
    num_calls_completed_recent : UInt32,
    num_calls_failed_recent : UInt32,
    num_calls_completed_total : UInt32,
    num_calls_failed_total : UInt32,
    reserved1 : UInt32,
    reserved2 : UInt32,
    reserved3 : UInt32,
    reserved4 : UInt32

  @[Extern]
  record ComponentHangMonitorInfo,
    is_monitored : Win32cr::Foundation::BOOL,
    terminate_on_hang : Win32cr::Foundation::BOOL,
    avg_call_threshold_in_ms : UInt32

  @[Extern]
  record CrmLogRecordRead,
    dwCrmFlags : UInt32,
    dwSequenceNumber : UInt32,
    blobUserData : Win32cr::System::Com::BLOB

  @[Extern]
  record ICOMAdminCatalogVtbl,
    query_interface : Proc(ICOMAdminCatalog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICOMAdminCatalog*, UInt32),
    release : Proc(ICOMAdminCatalog*, UInt32),
    get_type_info_count : Proc(ICOMAdminCatalog*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICOMAdminCatalog*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICOMAdminCatalog*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICOMAdminCatalog*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_collection : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    connect : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(ICOMAdminCatalog*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(ICOMAdminCatalog*, Int32*, Win32cr::Foundation::HRESULT),
    get_collection_by_query : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Void**, Win32cr::Foundation::HRESULT),
    import_component : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    install_component : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    shutdown_application : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    export_application : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminApplicationExportOptions, Win32cr::Foundation::HRESULT),
    install_application : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminApplicationInstallOptions, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    stop_router : Proc(ICOMAdminCatalog*, Win32cr::Foundation::HRESULT),
    refresh_router : Proc(ICOMAdminCatalog*, Win32cr::Foundation::HRESULT),
    start_router : Proc(ICOMAdminCatalog*, Win32cr::Foundation::HRESULT),
    reserved1 : Proc(ICOMAdminCatalog*, Win32cr::Foundation::HRESULT),
    reserved2 : Proc(ICOMAdminCatalog*, Win32cr::Foundation::HRESULT),
    install_multiple_components : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_multiple_components_info : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    refresh_components : Proc(ICOMAdminCatalog*, Win32cr::Foundation::HRESULT),
    backup_regdb : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    restore_regdb : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    query_application_file : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Int16*, Int16*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    start_application : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    service_check : Proc(ICOMAdminCatalog*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    install_multiple_event_classes : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    install_event_class : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_event_classes_for_iid : Proc(ICOMAdminCatalog*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dd662187-dfc2-11d1-a2cf-00805fc79235")]
  record ICOMAdminCatalog, lpVtbl : ICOMAdminCatalogVtbl* do
    GUID = LibC::GUID.new(0xdd662187_u32, 0xdfc2_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x35_u8])
    def query_interface(this : ICOMAdminCatalog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICOMAdminCatalog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICOMAdminCatalog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICOMAdminCatalog*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICOMAdminCatalog*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICOMAdminCatalog*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICOMAdminCatalog*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_collection(this : ICOMAdminCatalog*, bstrCollName : Win32cr::Foundation::BSTR, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection.call(this, bstrCollName, ppCatalogCollection)
    end
    def connect(this : ICOMAdminCatalog*, bstrCatalogServerName : Win32cr::Foundation::BSTR, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, bstrCatalogServerName, ppCatalogCollection)
    end
    def get_MajorVersion(this : ICOMAdminCatalog*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, plMajorVersion)
    end
    def get_MinorVersion(this : ICOMAdminCatalog*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, plMinorVersion)
    end
    def get_collection_by_query(this : ICOMAdminCatalog*, bstrCollName : Win32cr::Foundation::BSTR, ppsaVarQuery : Win32cr::System::Com::SAFEARRAY**, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_by_query.call(this, bstrCollName, ppsaVarQuery, ppCatalogCollection)
    end
    def import_component(this : ICOMAdminCatalog*, bstrApplIDOrName : Win32cr::Foundation::BSTR, bstrCLSIDOrProgID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_component.call(this, bstrApplIDOrName, bstrCLSIDOrProgID)
    end
    def install_component(this : ICOMAdminCatalog*, bstrApplIDOrName : Win32cr::Foundation::BSTR, bstrDLL : Win32cr::Foundation::BSTR, bstrTLB : Win32cr::Foundation::BSTR, bstrPSDLL : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_component.call(this, bstrApplIDOrName, bstrDLL, bstrTLB, bstrPSDLL)
    end
    def shutdown_application(this : ICOMAdminCatalog*, bstrApplIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_application.call(this, bstrApplIDOrName)
    end
    def export_application(this : ICOMAdminCatalog*, bstrApplIDOrName : Win32cr::Foundation::BSTR, bstrApplicationFile : Win32cr::Foundation::BSTR, lOptions : Win32cr::System::ComponentServices::COMAdminApplicationExportOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_application.call(this, bstrApplIDOrName, bstrApplicationFile, lOptions)
    end
    def install_application(this : ICOMAdminCatalog*, bstrApplicationFile : Win32cr::Foundation::BSTR, bstrDestinationDirectory : Win32cr::Foundation::BSTR, lOptions : Win32cr::System::ComponentServices::COMAdminApplicationInstallOptions, bstrUserId : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrRSN : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_application.call(this, bstrApplicationFile, bstrDestinationDirectory, lOptions, bstrUserId, bstrPassword, bstrRSN)
    end
    def stop_router(this : ICOMAdminCatalog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_router.call(this)
    end
    def refresh_router(this : ICOMAdminCatalog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_router.call(this)
    end
    def start_router(this : ICOMAdminCatalog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_router.call(this)
    end
    def reserved1(this : ICOMAdminCatalog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reserved1.call(this)
    end
    def reserved2(this : ICOMAdminCatalog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reserved2.call(this)
    end
    def install_multiple_components(this : ICOMAdminCatalog*, bstrApplIDOrName : Win32cr::Foundation::BSTR, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarCLSIDs : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_multiple_components.call(this, bstrApplIDOrName, ppsaVarFileNames, ppsaVarCLSIDs)
    end
    def get_multiple_components_info(this : ICOMAdminCatalog*, bstrApplIdOrName : Win32cr::Foundation::BSTR, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarCLSIDs : Win32cr::System::Com::SAFEARRAY**, ppsaVarClassNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarFileFlags : Win32cr::System::Com::SAFEARRAY**, ppsaVarComponentFlags : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_multiple_components_info.call(this, bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDs, ppsaVarClassNames, ppsaVarFileFlags, ppsaVarComponentFlags)
    end
    def refresh_components(this : ICOMAdminCatalog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_components.call(this)
    end
    def backup_regdb(this : ICOMAdminCatalog*, bstrBackupFilePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup_regdb.call(this, bstrBackupFilePath)
    end
    def restore_regdb(this : ICOMAdminCatalog*, bstrBackupFilePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_regdb.call(this, bstrBackupFilePath)
    end
    def query_application_file(this : ICOMAdminCatalog*, bstrApplicationFile : Win32cr::Foundation::BSTR, pbstrApplicationName : Win32cr::Foundation::BSTR*, pbstrApplicationDescription : Win32cr::Foundation::BSTR*, pbHasUsers : Int16*, pbIsProxy : Int16*, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_application_file.call(this, bstrApplicationFile, pbstrApplicationName, pbstrApplicationDescription, pbHasUsers, pbIsProxy, ppsaVarFileNames)
    end
    def start_application(this : ICOMAdminCatalog*, bstrApplIdOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_application.call(this, bstrApplIdOrName)
    end
    def service_check(this : ICOMAdminCatalog*, lService : Int32, plStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.service_check.call(this, lService, plStatus)
    end
    def install_multiple_event_classes(this : ICOMAdminCatalog*, bstrApplIdOrName : Win32cr::Foundation::BSTR, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarCLSIDS : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_multiple_event_classes.call(this, bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDS)
    end
    def install_event_class(this : ICOMAdminCatalog*, bstrApplIdOrName : Win32cr::Foundation::BSTR, bstrDLL : Win32cr::Foundation::BSTR, bstrTLB : Win32cr::Foundation::BSTR, bstrPSDLL : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_event_class.call(this, bstrApplIdOrName, bstrDLL, bstrTLB, bstrPSDLL)
    end
    def get_event_classes_for_iid(this : ICOMAdminCatalog*, bstrIID : Win32cr::Foundation::BSTR, ppsaVarCLSIDs : Win32cr::System::Com::SAFEARRAY**, ppsaVarProgIDs : Win32cr::System::Com::SAFEARRAY**, ppsaVarDescriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_classes_for_iid.call(this, bstrIID, ppsaVarCLSIDs, ppsaVarProgIDs, ppsaVarDescriptions)
    end

  end

  @[Extern]
  record ICOMAdminCatalog2Vtbl,
    query_interface : Proc(ICOMAdminCatalog2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICOMAdminCatalog2*, UInt32),
    release : Proc(ICOMAdminCatalog2*, UInt32),
    get_type_info_count : Proc(ICOMAdminCatalog2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICOMAdminCatalog2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICOMAdminCatalog2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICOMAdminCatalog2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_collection : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    connect : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(ICOMAdminCatalog2*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(ICOMAdminCatalog2*, Int32*, Win32cr::Foundation::HRESULT),
    get_collection_by_query : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Void**, Win32cr::Foundation::HRESULT),
    import_component : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    install_component : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    shutdown_application : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    export_application : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminApplicationExportOptions, Win32cr::Foundation::HRESULT),
    install_application : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminApplicationInstallOptions, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    stop_router : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    refresh_router : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    start_router : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    reserved1 : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    reserved2 : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    install_multiple_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_multiple_components_info : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    refresh_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    backup_regdb : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    restore_regdb : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    query_application_file : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::BSTR*, Int16*, Int16*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    start_application : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    service_check : Proc(ICOMAdminCatalog2*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    install_multiple_event_classes : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    install_event_class : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_event_classes_for_iid : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_collection_by_query2 : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT),
    get_application_instance_id_from_process_id : Proc(ICOMAdminCatalog2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    shutdown_application_instances : Proc(ICOMAdminCatalog2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    pause_application_instances : Proc(ICOMAdminCatalog2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    resume_application_instances : Proc(ICOMAdminCatalog2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    recycle_application_instances : Proc(ICOMAdminCatalog2*, Win32cr::System::Com::VARIANT*, Int32, Win32cr::Foundation::HRESULT),
    are_application_instances_paused : Proc(ICOMAdminCatalog2*, Win32cr::System::Com::VARIANT*, Int16*, Win32cr::Foundation::HRESULT),
    dump_application_instance : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsApplicationInstanceDumpSupported : Proc(ICOMAdminCatalog2*, Int16*, Win32cr::Foundation::HRESULT),
    create_service_for_application : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    delete_service_for_application : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_partition_id : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_partition_name : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_CurrentPartition : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CurrentPartitionID : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentPartitionName : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GlobalPartitionID : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    flush_partition_cache : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::HRESULT),
    copy_applications : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    copy_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    move_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    alias_component : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    is_safe_to_delete : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminInUse*, Win32cr::Foundation::HRESULT),
    import_unconfigured_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    promote_unconfigured_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    import_components : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Is64BitCatalogServer : Proc(ICOMAdminCatalog2*, Int16*, Win32cr::Foundation::HRESULT),
    export_partition : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminApplicationExportOptions, Win32cr::Foundation::HRESULT),
    install_partition : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::ComponentServices::COMAdminApplicationInstallOptions, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    query_application_file2 : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_component_version_count : Proc(ICOMAdminCatalog2*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("790c6e0b-9194-4cc9-9426-a48a63185696")]
  record ICOMAdminCatalog2, lpVtbl : ICOMAdminCatalog2Vtbl* do
    GUID = LibC::GUID.new(0x790c6e0b_u32, 0x9194_u16, 0x4cc9_u16, StaticArray[0x94_u8, 0x26_u8, 0xa4_u8, 0x8a_u8, 0x63_u8, 0x18_u8, 0x56_u8, 0x96_u8])
    def query_interface(this : ICOMAdminCatalog2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICOMAdminCatalog2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICOMAdminCatalog2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICOMAdminCatalog2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICOMAdminCatalog2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICOMAdminCatalog2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICOMAdminCatalog2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_collection(this : ICOMAdminCatalog2*, bstrCollName : Win32cr::Foundation::BSTR, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection.call(this, bstrCollName, ppCatalogCollection)
    end
    def connect(this : ICOMAdminCatalog2*, bstrCatalogServerName : Win32cr::Foundation::BSTR, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, bstrCatalogServerName, ppCatalogCollection)
    end
    def get_MajorVersion(this : ICOMAdminCatalog2*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, plMajorVersion)
    end
    def get_MinorVersion(this : ICOMAdminCatalog2*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, plMinorVersion)
    end
    def get_collection_by_query(this : ICOMAdminCatalog2*, bstrCollName : Win32cr::Foundation::BSTR, ppsaVarQuery : Win32cr::System::Com::SAFEARRAY**, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_by_query.call(this, bstrCollName, ppsaVarQuery, ppCatalogCollection)
    end
    def import_component(this : ICOMAdminCatalog2*, bstrApplIDOrName : Win32cr::Foundation::BSTR, bstrCLSIDOrProgID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_component.call(this, bstrApplIDOrName, bstrCLSIDOrProgID)
    end
    def install_component(this : ICOMAdminCatalog2*, bstrApplIDOrName : Win32cr::Foundation::BSTR, bstrDLL : Win32cr::Foundation::BSTR, bstrTLB : Win32cr::Foundation::BSTR, bstrPSDLL : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_component.call(this, bstrApplIDOrName, bstrDLL, bstrTLB, bstrPSDLL)
    end
    def shutdown_application(this : ICOMAdminCatalog2*, bstrApplIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_application.call(this, bstrApplIDOrName)
    end
    def export_application(this : ICOMAdminCatalog2*, bstrApplIDOrName : Win32cr::Foundation::BSTR, bstrApplicationFile : Win32cr::Foundation::BSTR, lOptions : Win32cr::System::ComponentServices::COMAdminApplicationExportOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_application.call(this, bstrApplIDOrName, bstrApplicationFile, lOptions)
    end
    def install_application(this : ICOMAdminCatalog2*, bstrApplicationFile : Win32cr::Foundation::BSTR, bstrDestinationDirectory : Win32cr::Foundation::BSTR, lOptions : Win32cr::System::ComponentServices::COMAdminApplicationInstallOptions, bstrUserId : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrRSN : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_application.call(this, bstrApplicationFile, bstrDestinationDirectory, lOptions, bstrUserId, bstrPassword, bstrRSN)
    end
    def stop_router(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_router.call(this)
    end
    def refresh_router(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_router.call(this)
    end
    def start_router(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_router.call(this)
    end
    def reserved1(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reserved1.call(this)
    end
    def reserved2(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reserved2.call(this)
    end
    def install_multiple_components(this : ICOMAdminCatalog2*, bstrApplIDOrName : Win32cr::Foundation::BSTR, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarCLSIDs : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_multiple_components.call(this, bstrApplIDOrName, ppsaVarFileNames, ppsaVarCLSIDs)
    end
    def get_multiple_components_info(this : ICOMAdminCatalog2*, bstrApplIdOrName : Win32cr::Foundation::BSTR, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarCLSIDs : Win32cr::System::Com::SAFEARRAY**, ppsaVarClassNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarFileFlags : Win32cr::System::Com::SAFEARRAY**, ppsaVarComponentFlags : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_multiple_components_info.call(this, bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDs, ppsaVarClassNames, ppsaVarFileFlags, ppsaVarComponentFlags)
    end
    def refresh_components(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_components.call(this)
    end
    def backup_regdb(this : ICOMAdminCatalog2*, bstrBackupFilePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.backup_regdb.call(this, bstrBackupFilePath)
    end
    def restore_regdb(this : ICOMAdminCatalog2*, bstrBackupFilePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_regdb.call(this, bstrBackupFilePath)
    end
    def query_application_file(this : ICOMAdminCatalog2*, bstrApplicationFile : Win32cr::Foundation::BSTR, pbstrApplicationName : Win32cr::Foundation::BSTR*, pbstrApplicationDescription : Win32cr::Foundation::BSTR*, pbHasUsers : Int16*, pbIsProxy : Int16*, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_application_file.call(this, bstrApplicationFile, pbstrApplicationName, pbstrApplicationDescription, pbHasUsers, pbIsProxy, ppsaVarFileNames)
    end
    def start_application(this : ICOMAdminCatalog2*, bstrApplIdOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_application.call(this, bstrApplIdOrName)
    end
    def service_check(this : ICOMAdminCatalog2*, lService : Int32, plStatus : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.service_check.call(this, lService, plStatus)
    end
    def install_multiple_event_classes(this : ICOMAdminCatalog2*, bstrApplIdOrName : Win32cr::Foundation::BSTR, ppsaVarFileNames : Win32cr::System::Com::SAFEARRAY**, ppsaVarCLSIDS : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_multiple_event_classes.call(this, bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDS)
    end
    def install_event_class(this : ICOMAdminCatalog2*, bstrApplIdOrName : Win32cr::Foundation::BSTR, bstrDLL : Win32cr::Foundation::BSTR, bstrTLB : Win32cr::Foundation::BSTR, bstrPSDLL : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_event_class.call(this, bstrApplIdOrName, bstrDLL, bstrTLB, bstrPSDLL)
    end
    def get_event_classes_for_iid(this : ICOMAdminCatalog2*, bstrIID : Win32cr::Foundation::BSTR, ppsaVarCLSIDs : Win32cr::System::Com::SAFEARRAY**, ppsaVarProgIDs : Win32cr::System::Com::SAFEARRAY**, ppsaVarDescriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_classes_for_iid.call(this, bstrIID, ppsaVarCLSIDs, ppsaVarProgIDs, ppsaVarDescriptions)
    end
    def get_collection_by_query2(this : ICOMAdminCatalog2*, bstrCollectionName : Win32cr::Foundation::BSTR, pVarQueryStrings : Win32cr::System::Com::VARIANT*, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection_by_query2.call(this, bstrCollectionName, pVarQueryStrings, ppCatalogCollection)
    end
    def get_application_instance_id_from_process_id(this : ICOMAdminCatalog2*, lProcessID : Int32, pbstrApplicationInstanceID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_instance_id_from_process_id.call(this, lProcessID, pbstrApplicationInstanceID)
    end
    def shutdown_application_instances(this : ICOMAdminCatalog2*, pVarApplicationInstanceID : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_application_instances.call(this, pVarApplicationInstanceID)
    end
    def pause_application_instances(this : ICOMAdminCatalog2*, pVarApplicationInstanceID : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause_application_instances.call(this, pVarApplicationInstanceID)
    end
    def resume_application_instances(this : ICOMAdminCatalog2*, pVarApplicationInstanceID : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_application_instances.call(this, pVarApplicationInstanceID)
    end
    def recycle_application_instances(this : ICOMAdminCatalog2*, pVarApplicationInstanceID : Win32cr::System::Com::VARIANT*, lReasonCode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.recycle_application_instances.call(this, pVarApplicationInstanceID, lReasonCode)
    end
    def are_application_instances_paused(this : ICOMAdminCatalog2*, pVarApplicationInstanceID : Win32cr::System::Com::VARIANT*, pVarBoolPaused : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.are_application_instances_paused.call(this, pVarApplicationInstanceID, pVarBoolPaused)
    end
    def dump_application_instance(this : ICOMAdminCatalog2*, bstrApplicationInstanceID : Win32cr::Foundation::BSTR, bstrDirectory : Win32cr::Foundation::BSTR, lMaxImages : Int32, pbstrDumpFile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dump_application_instance.call(this, bstrApplicationInstanceID, bstrDirectory, lMaxImages, pbstrDumpFile)
    end
    def get_IsApplicationInstanceDumpSupported(this : ICOMAdminCatalog2*, pVarBoolDumpSupported : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsApplicationInstanceDumpSupported.call(this, pVarBoolDumpSupported)
    end
    def create_service_for_application(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR, bstrServiceName : Win32cr::Foundation::BSTR, bstrStartType : Win32cr::Foundation::BSTR, bstrErrorControl : Win32cr::Foundation::BSTR, bstrDependencies : Win32cr::Foundation::BSTR, bstrRunAs : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bDesktopOk : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_service_for_application.call(this, bstrApplicationIDOrName, bstrServiceName, bstrStartType, bstrErrorControl, bstrDependencies, bstrRunAs, bstrPassword, bDesktopOk)
    end
    def delete_service_for_application(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_service_for_application.call(this, bstrApplicationIDOrName)
    end
    def get_partition_id(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR, pbstrPartitionID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partition_id.call(this, bstrApplicationIDOrName, pbstrPartitionID)
    end
    def get_partition_name(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR, pbstrPartitionName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partition_name.call(this, bstrApplicationIDOrName, pbstrPartitionName)
    end
    def put_CurrentPartition(this : ICOMAdminCatalog2*, bstrPartitionIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CurrentPartition.call(this, bstrPartitionIDOrName)
    end
    def get_CurrentPartitionID(this : ICOMAdminCatalog2*, pbstrPartitionID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPartitionID.call(this, pbstrPartitionID)
    end
    def get_CurrentPartitionName(this : ICOMAdminCatalog2*, pbstrPartitionName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPartitionName.call(this, pbstrPartitionName)
    end
    def get_GlobalPartitionID(this : ICOMAdminCatalog2*, pbstrGlobalPartitionID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GlobalPartitionID.call(this, pbstrGlobalPartitionID)
    end
    def flush_partition_cache(this : ICOMAdminCatalog2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush_partition_cache.call(this)
    end
    def copy_applications(this : ICOMAdminCatalog2*, bstrSourcePartitionIDOrName : Win32cr::Foundation::BSTR, pVarApplicationID : Win32cr::System::Com::VARIANT*, bstrDestinationPartitionIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_applications.call(this, bstrSourcePartitionIDOrName, pVarApplicationID, bstrDestinationPartitionIDOrName)
    end
    def copy_components(this : ICOMAdminCatalog2*, bstrSourceApplicationIDOrName : Win32cr::Foundation::BSTR, pVarCLSIDOrProgID : Win32cr::System::Com::VARIANT*, bstrDestinationApplicationIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_components.call(this, bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName)
    end
    def move_components(this : ICOMAdminCatalog2*, bstrSourceApplicationIDOrName : Win32cr::Foundation::BSTR, pVarCLSIDOrProgID : Win32cr::System::Com::VARIANT*, bstrDestinationApplicationIDOrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_components.call(this, bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName)
    end
    def alias_component(this : ICOMAdminCatalog2*, bstrSrcApplicationIDOrName : Win32cr::Foundation::BSTR, bstrCLSIDOrProgID : Win32cr::Foundation::BSTR, bstrDestApplicationIDOrName : Win32cr::Foundation::BSTR, bstrNewProgId : Win32cr::Foundation::BSTR, bstrNewClsid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alias_component.call(this, bstrSrcApplicationIDOrName, bstrCLSIDOrProgID, bstrDestApplicationIDOrName, bstrNewProgId, bstrNewClsid)
    end
    def is_safe_to_delete(this : ICOMAdminCatalog2*, bstrDllName : Win32cr::Foundation::BSTR, pCOMAdminInUse : Win32cr::System::ComponentServices::COMAdminInUse*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_safe_to_delete.call(this, bstrDllName, pCOMAdminInUse)
    end
    def import_unconfigured_components(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR, pVarCLSIDOrProgID : Win32cr::System::Com::VARIANT*, pVarComponentType : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_unconfigured_components.call(this, bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType)
    end
    def promote_unconfigured_components(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR, pVarCLSIDOrProgID : Win32cr::System::Com::VARIANT*, pVarComponentType : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.promote_unconfigured_components.call(this, bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType)
    end
    def import_components(this : ICOMAdminCatalog2*, bstrApplicationIDOrName : Win32cr::Foundation::BSTR, pVarCLSIDOrProgID : Win32cr::System::Com::VARIANT*, pVarComponentType : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_components.call(this, bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType)
    end
    def get_Is64BitCatalogServer(this : ICOMAdminCatalog2*, pbIs64Bit : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Is64BitCatalogServer.call(this, pbIs64Bit)
    end
    def export_partition(this : ICOMAdminCatalog2*, bstrPartitionIDOrName : Win32cr::Foundation::BSTR, bstrPartitionFileName : Win32cr::Foundation::BSTR, lOptions : Win32cr::System::ComponentServices::COMAdminApplicationExportOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_partition.call(this, bstrPartitionIDOrName, bstrPartitionFileName, lOptions)
    end
    def install_partition(this : ICOMAdminCatalog2*, bstrFileName : Win32cr::Foundation::BSTR, bstrDestDirectory : Win32cr::Foundation::BSTR, lOptions : Win32cr::System::ComponentServices::COMAdminApplicationInstallOptions, bstrUserID : Win32cr::Foundation::BSTR, bstrPassword : Win32cr::Foundation::BSTR, bstrRSN : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_partition.call(this, bstrFileName, bstrDestDirectory, lOptions, bstrUserID, bstrPassword, bstrRSN)
    end
    def query_application_file2(this : ICOMAdminCatalog2*, bstrApplicationFile : Win32cr::Foundation::BSTR, ppFilesForImport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_application_file2.call(this, bstrApplicationFile, ppFilesForImport)
    end
    def get_component_version_count(this : ICOMAdminCatalog2*, bstrCLSIDOrProgID : Win32cr::Foundation::BSTR, plVersionCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_version_count.call(this, bstrCLSIDOrProgID, plVersionCount)
    end

  end

  @[Extern]
  record ICatalogObjectVtbl,
    query_interface : Proc(ICatalogObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICatalogObject*, UInt32),
    release : Proc(ICatalogObject*, UInt32),
    get_type_info_count : Proc(ICatalogObject*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICatalogObject*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICatalogObject*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICatalogObject*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ICatalogObject*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(ICatalogObject*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_Key : Proc(ICatalogObject*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ICatalogObject*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    is_property_read_only : Proc(ICatalogObject*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_Valid : Proc(ICatalogObject*, Int16*, Win32cr::Foundation::HRESULT),
    is_property_write_only : Proc(ICatalogObject*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22871-8a19-11d0-81b6-00a0c9231c29")]
  record ICatalogObject, lpVtbl : ICatalogObjectVtbl* do
    GUID = LibC::GUID.new(0x6eb22871_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : ICatalogObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICatalogObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICatalogObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICatalogObject*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICatalogObject*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICatalogObject*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICatalogObject*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Value(this : ICatalogObject*, bstrPropName : Win32cr::Foundation::BSTR, pvarRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, bstrPropName, pvarRetVal)
    end
    def put_Value(this : ICatalogObject*, bstrPropName : Win32cr::Foundation::BSTR, val : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, bstrPropName, val)
    end
    def get_Key(this : ICatalogObject*, pvarRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Key.call(this, pvarRetVal)
    end
    def get_Name(this : ICatalogObject*, pvarRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pvarRetVal)
    end
    def is_property_read_only(this : ICatalogObject*, bstrPropName : Win32cr::Foundation::BSTR, pbRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_property_read_only.call(this, bstrPropName, pbRetVal)
    end
    def get_Valid(this : ICatalogObject*, pbRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Valid.call(this, pbRetVal)
    end
    def is_property_write_only(this : ICatalogObject*, bstrPropName : Win32cr::Foundation::BSTR, pbRetVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_property_write_only.call(this, bstrPropName, pbRetVal)
    end

  end

  @[Extern]
  record ICatalogCollectionVtbl,
    query_interface : Proc(ICatalogCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICatalogCollection*, UInt32),
    release : Proc(ICatalogCollection*, UInt32),
    get_type_info_count : Proc(ICatalogCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICatalogCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICatalogCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICatalogCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ICatalogCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ICatalogCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ICatalogCollection*, Int32*, Win32cr::Foundation::HRESULT),
    remove : Proc(ICatalogCollection*, Int32, Win32cr::Foundation::HRESULT),
    add : Proc(ICatalogCollection*, Void**, Win32cr::Foundation::HRESULT),
    populate : Proc(ICatalogCollection*, Win32cr::Foundation::HRESULT),
    save_changes : Proc(ICatalogCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_collection : Proc(ICatalogCollection*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ICatalogCollection*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AddEnabled : Proc(ICatalogCollection*, Int16*, Win32cr::Foundation::HRESULT),
    get_RemoveEnabled : Proc(ICatalogCollection*, Int16*, Win32cr::Foundation::HRESULT),
    get_util_interface : Proc(ICatalogCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_DataStoreMajorVersion : Proc(ICatalogCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_DataStoreMinorVersion : Proc(ICatalogCollection*, Int32*, Win32cr::Foundation::HRESULT),
    populate_by_key : Proc(ICatalogCollection*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    populate_by_query : Proc(ICatalogCollection*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22872-8a19-11d0-81b6-00a0c9231c29")]
  record ICatalogCollection, lpVtbl : ICatalogCollectionVtbl* do
    GUID = LibC::GUID.new(0x6eb22872_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : ICatalogCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICatalogCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICatalogCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICatalogCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICatalogCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICatalogCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICatalogCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : ICatalogCollection*, ppEnumVariant : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnumVariant)
    end
    def get_Item(this : ICatalogCollection*, lIndex : Int32, ppCatalogObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, ppCatalogObject)
    end
    def get_Count(this : ICatalogCollection*, plObjectCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plObjectCount)
    end
    def remove(this : ICatalogCollection*, lIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, lIndex)
    end
    def add(this : ICatalogCollection*, ppCatalogObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, ppCatalogObject)
    end
    def populate(this : ICatalogCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.populate.call(this)
    end
    def save_changes(this : ICatalogCollection*, pcChanges : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_changes.call(this, pcChanges)
    end
    def get_collection(this : ICatalogCollection*, bstrCollName : Win32cr::Foundation::BSTR, varObjectKey : Win32cr::System::Com::VARIANT, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection.call(this, bstrCollName, varObjectKey, ppCatalogCollection)
    end
    def get_Name(this : ICatalogCollection*, pVarNamel : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pVarNamel)
    end
    def get_AddEnabled(this : ICatalogCollection*, pVarBool : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AddEnabled.call(this, pVarBool)
    end
    def get_RemoveEnabled(this : ICatalogCollection*, pVarBool : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoveEnabled.call(this, pVarBool)
    end
    def get_util_interface(this : ICatalogCollection*, ppIDispatch : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_util_interface.call(this, ppIDispatch)
    end
    def get_DataStoreMajorVersion(this : ICatalogCollection*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataStoreMajorVersion.call(this, plMajorVersion)
    end
    def get_DataStoreMinorVersion(this : ICatalogCollection*, plMinorVersionl : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DataStoreMinorVersion.call(this, plMinorVersionl)
    end
    def populate_by_key(this : ICatalogCollection*, psaKeys : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.populate_by_key.call(this, psaKeys)
    end
    def populate_by_query(this : ICatalogCollection*, bstrQueryString : Win32cr::Foundation::BSTR, lQueryType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.populate_by_query.call(this, bstrQueryString, lQueryType)
    end

  end

  @[Extern]
  record ISecurityIdentityCollVtbl,
    query_interface : Proc(ISecurityIdentityColl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityIdentityColl*, UInt32),
    release : Proc(ISecurityIdentityColl*, UInt32),
    get_type_info_count : Proc(ISecurityIdentityColl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISecurityIdentityColl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISecurityIdentityColl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISecurityIdentityColl*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISecurityIdentityColl*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISecurityIdentityColl*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISecurityIdentityColl*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cafc823c-b441-11d1-b82b-0000f8757e2a")]
  record ISecurityIdentityColl, lpVtbl : ISecurityIdentityCollVtbl* do
    GUID = LibC::GUID.new(0xcafc823c_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
    def query_interface(this : ISecurityIdentityColl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityIdentityColl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityIdentityColl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISecurityIdentityColl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISecurityIdentityColl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISecurityIdentityColl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISecurityIdentityColl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISecurityIdentityColl*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get_Item(this : ISecurityIdentityColl*, name : Win32cr::Foundation::BSTR, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, name, pItem)
    end
    def get__NewEnum(this : ISecurityIdentityColl*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end

  end

  @[Extern]
  record ISecurityCallersCollVtbl,
    query_interface : Proc(ISecurityCallersColl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityCallersColl*, UInt32),
    release : Proc(ISecurityCallersColl*, UInt32),
    get_type_info_count : Proc(ISecurityCallersColl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISecurityCallersColl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISecurityCallersColl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISecurityCallersColl*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISecurityCallersColl*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISecurityCallersColl*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISecurityCallersColl*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cafc823d-b441-11d1-b82b-0000f8757e2a")]
  record ISecurityCallersColl, lpVtbl : ISecurityCallersCollVtbl* do
    GUID = LibC::GUID.new(0xcafc823d_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
    def query_interface(this : ISecurityCallersColl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityCallersColl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityCallersColl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISecurityCallersColl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISecurityCallersColl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISecurityCallersColl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISecurityCallersColl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISecurityCallersColl*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get_Item(this : ISecurityCallersColl*, lIndex : Int32, pObj : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pObj)
    end
    def get__NewEnum(this : ISecurityCallersColl*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end

  end

  @[Extern]
  record ISecurityCallContextVtbl,
    query_interface : Proc(ISecurityCallContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityCallContext*, UInt32),
    release : Proc(ISecurityCallContext*, UInt32),
    get_type_info_count : Proc(ISecurityCallContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISecurityCallContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISecurityCallContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISecurityCallContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ISecurityCallContext*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ISecurityCallContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISecurityCallContext*, Void**, Win32cr::Foundation::HRESULT),
    is_caller_in_role : Proc(ISecurityCallContext*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    is_security_enabled : Proc(ISecurityCallContext*, Int16*, Win32cr::Foundation::HRESULT),
    is_user_in_role : Proc(ISecurityCallContext*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cafc823e-b441-11d1-b82b-0000f8757e2a")]
  record ISecurityCallContext, lpVtbl : ISecurityCallContextVtbl* do
    GUID = LibC::GUID.new(0xcafc823e_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
    def query_interface(this : ISecurityCallContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityCallContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityCallContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISecurityCallContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISecurityCallContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISecurityCallContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISecurityCallContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : ISecurityCallContext*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get_Item(this : ISecurityCallContext*, name : Win32cr::Foundation::BSTR, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, name, pItem)
    end
    def get__NewEnum(this : ISecurityCallContext*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end
    def is_caller_in_role(this : ISecurityCallContext*, bstrRole : Win32cr::Foundation::BSTR, pfInRole : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_caller_in_role.call(this, bstrRole, pfInRole)
    end
    def is_security_enabled(this : ISecurityCallContext*, pfIsEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_security_enabled.call(this, pfIsEnabled)
    end
    def is_user_in_role(this : ISecurityCallContext*, pUser : Win32cr::System::Com::VARIANT*, bstrRole : Win32cr::Foundation::BSTR, pfInRole : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_user_in_role.call(this, pUser, bstrRole, pfInRole)
    end

  end

  @[Extern]
  record IGetSecurityCallContextVtbl,
    query_interface : Proc(IGetSecurityCallContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetSecurityCallContext*, UInt32),
    release : Proc(IGetSecurityCallContext*, UInt32),
    get_type_info_count : Proc(IGetSecurityCallContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IGetSecurityCallContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IGetSecurityCallContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IGetSecurityCallContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_security_call_context : Proc(IGetSecurityCallContext*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cafc823f-b441-11d1-b82b-0000f8757e2a")]
  record IGetSecurityCallContext, lpVtbl : IGetSecurityCallContextVtbl* do
    GUID = LibC::GUID.new(0xcafc823f_u32, 0xb441_u16, 0x11d1_u16, StaticArray[0xb8_u8, 0x2b_u8, 0x0_u8, 0x0_u8, 0xf8_u8, 0x75_u8, 0x7e_u8, 0x2a_u8])
    def query_interface(this : IGetSecurityCallContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetSecurityCallContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetSecurityCallContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IGetSecurityCallContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IGetSecurityCallContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IGetSecurityCallContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IGetSecurityCallContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_security_call_context(this : IGetSecurityCallContext*, ppObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security_call_context.call(this, ppObject)
    end

  end

  @[Extern]
  record SecurityPropertyVtbl,
    query_interface : Proc(SecurityProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(SecurityProperty*, UInt32),
    release : Proc(SecurityProperty*, UInt32),
    get_type_info_count : Proc(SecurityProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(SecurityProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(SecurityProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(SecurityProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_direct_caller_name : Proc(SecurityProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_direct_creator_name : Proc(SecurityProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_original_caller_name : Proc(SecurityProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_original_creator_name : Proc(SecurityProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e74a7215-014d-11d1-a63c-00a0c911b4e0")]
  record SecurityProperty, lpVtbl : SecurityPropertyVtbl* do
    GUID = LibC::GUID.new(0xe74a7215_u32, 0x14d_u16, 0x11d1_u16, StaticArray[0xa6_u8, 0x3c_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x11_u8, 0xb4_u8, 0xe0_u8])
    def query_interface(this : SecurityProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : SecurityProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : SecurityProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : SecurityProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : SecurityProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : SecurityProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : SecurityProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_direct_caller_name(this : SecurityProperty*, bstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_direct_caller_name.call(this, bstrUserName)
    end
    def get_direct_creator_name(this : SecurityProperty*, bstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_direct_creator_name.call(this, bstrUserName)
    end
    def get_original_caller_name(this : SecurityProperty*, bstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_original_caller_name.call(this, bstrUserName)
    end
    def get_original_creator_name(this : SecurityProperty*, bstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_original_creator_name.call(this, bstrUserName)
    end

  end

  @[Extern]
  record ContextInfoVtbl,
    query_interface : Proc(ContextInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ContextInfo*, UInt32),
    release : Proc(ContextInfo*, UInt32),
    get_type_info_count : Proc(ContextInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ContextInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ContextInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ContextInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    is_in_transaction : Proc(ContextInfo*, Int16*, Win32cr::Foundation::HRESULT),
    get_transaction : Proc(ContextInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_transaction_id : Proc(ContextInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_activity_id : Proc(ContextInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_context_id : Proc(ContextInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("19a5a02c-0ac8-11d2-b286-00c04f8ef934")]
  record ContextInfo, lpVtbl : ContextInfoVtbl* do
    GUID = LibC::GUID.new(0x19a5a02c_u32, 0xac8_u16, 0x11d2_u16, StaticArray[0xb2_u8, 0x86_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xf9_u8, 0x34_u8])
    def query_interface(this : ContextInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ContextInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ContextInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ContextInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ContextInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ContextInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ContextInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def is_in_transaction(this : ContextInfo*, pbIsInTx : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_in_transaction.call(this, pbIsInTx)
    end
    def get_transaction(this : ContextInfo*, ppTx : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction.call(this, ppTx)
    end
    def get_transaction_id(this : ContextInfo*, pbstrTxId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_id.call(this, pbstrTxId)
    end
    def get_activity_id(this : ContextInfo*, pbstrActivityId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_id.call(this, pbstrActivityId)
    end
    def get_context_id(this : ContextInfo*, pbstrCtxId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_id.call(this, pbstrCtxId)
    end

  end

  @[Extern]
  record ContextInfo2Vtbl,
    query_interface : Proc(ContextInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ContextInfo2*, UInt32),
    release : Proc(ContextInfo2*, UInt32),
    get_type_info_count : Proc(ContextInfo2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ContextInfo2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ContextInfo2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ContextInfo2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    is_in_transaction : Proc(ContextInfo2*, Int16*, Win32cr::Foundation::HRESULT),
    get_transaction : Proc(ContextInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_transaction_id : Proc(ContextInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_activity_id : Proc(ContextInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_context_id : Proc(ContextInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_partition_id : Proc(ContextInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_application_id : Proc(ContextInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_application_instance_id : Proc(ContextInfo2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c99d6e75-2375-11d4-8331-00c04f605588")]
  record ContextInfo2, lpVtbl : ContextInfo2Vtbl* do
    GUID = LibC::GUID.new(0xc99d6e75_u32, 0x2375_u16, 0x11d4_u16, StaticArray[0x83_u8, 0x31_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x60_u8, 0x55_u8, 0x88_u8])
    def query_interface(this : ContextInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ContextInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ContextInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ContextInfo2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ContextInfo2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ContextInfo2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ContextInfo2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def is_in_transaction(this : ContextInfo2*, pbIsInTx : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_in_transaction.call(this, pbIsInTx)
    end
    def get_transaction(this : ContextInfo2*, ppTx : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction.call(this, ppTx)
    end
    def get_transaction_id(this : ContextInfo2*, pbstrTxId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_id.call(this, pbstrTxId)
    end
    def get_activity_id(this : ContextInfo2*, pbstrActivityId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_id.call(this, pbstrActivityId)
    end
    def get_context_id(this : ContextInfo2*, pbstrCtxId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_id.call(this, pbstrCtxId)
    end
    def get_partition_id(this : ContextInfo2*, __midl__context_info20000 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partition_id.call(this, __midl__context_info20000)
    end
    def get_application_id(this : ContextInfo2*, __midl__context_info20001 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_id.call(this, __midl__context_info20001)
    end
    def get_application_instance_id(this : ContextInfo2*, __midl__context_info20002 : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_instance_id.call(this, __midl__context_info20002)
    end

  end

  @[Extern]
  record ObjectContextVtbl,
    query_interface : Proc(ObjectContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ObjectContext*, UInt32),
    release : Proc(ObjectContext*, UInt32),
    get_type_info_count : Proc(ObjectContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ObjectContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ObjectContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ObjectContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ObjectContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_complete : Proc(ObjectContext*, Win32cr::Foundation::HRESULT),
    set_abort : Proc(ObjectContext*, Win32cr::Foundation::HRESULT),
    enable_commit : Proc(ObjectContext*, Win32cr::Foundation::HRESULT),
    disable_commit : Proc(ObjectContext*, Win32cr::Foundation::HRESULT),
    is_in_transaction : Proc(ObjectContext*, Int16*, Win32cr::Foundation::HRESULT),
    is_security_enabled : Proc(ObjectContext*, Int16*, Win32cr::Foundation::HRESULT),
    is_caller_in_role : Proc(ObjectContext*, Win32cr::Foundation::BSTR, Int16*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ObjectContext*, Int32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ObjectContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ObjectContext*, Void**, Win32cr::Foundation::HRESULT),
    get_Security : Proc(ObjectContext*, Void**, Win32cr::Foundation::HRESULT),
    get_ContextInfo : Proc(ObjectContext*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("74c08646-cedb-11cf-8b49-00aa00b8a790")]
  record ObjectContext, lpVtbl : ObjectContextVtbl* do
    GUID = LibC::GUID.new(0x74c08646_u32, 0xcedb_u16, 0x11cf_u16, StaticArray[0x8b_u8, 0x49_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xa7_u8, 0x90_u8])
    def query_interface(this : ObjectContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ObjectContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ObjectContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ObjectContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ObjectContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ObjectContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ObjectContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_instance(this : ObjectContext*, bstrProgID : Win32cr::Foundation::BSTR, pObject : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, bstrProgID, pObject)
    end
    def set_complete(this : ObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_complete.call(this)
    end
    def set_abort(this : ObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_abort.call(this)
    end
    def enable_commit(this : ObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_commit.call(this)
    end
    def disable_commit(this : ObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_commit.call(this)
    end
    def is_in_transaction(this : ObjectContext*, pbIsInTx : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_in_transaction.call(this, pbIsInTx)
    end
    def is_security_enabled(this : ObjectContext*, pbIsEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_security_enabled.call(this, pbIsEnabled)
    end
    def is_caller_in_role(this : ObjectContext*, bstrRole : Win32cr::Foundation::BSTR, pbInRole : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_caller_in_role.call(this, bstrRole, pbInRole)
    end
    def get_Count(this : ObjectContext*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get_Item(this : ObjectContext*, name : Win32cr::Foundation::BSTR, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, name, pItem)
    end
    def get__NewEnum(this : ObjectContext*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppEnum)
    end
    def get_Security(this : ObjectContext*, ppSecurityProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, ppSecurityProperty)
    end
    def get_ContextInfo(this : ObjectContext*, ppContextInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContextInfo.call(this, ppContextInfo)
    end

  end

  @[Extern]
  record ITransactionContextExVtbl,
    query_interface : Proc(ITransactionContextEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionContextEx*, UInt32),
    release : Proc(ITransactionContextEx*, UInt32),
    create_instance : Proc(ITransactionContextEx*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    commit : Proc(ITransactionContextEx*, Win32cr::Foundation::HRESULT),
    abort : Proc(ITransactionContextEx*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7999fc22-d3c6-11cf-acab-00a024a55aef")]
  record ITransactionContextEx, lpVtbl : ITransactionContextExVtbl* do
    GUID = LibC::GUID.new(0x7999fc22_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
    def query_interface(this : ITransactionContextEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionContextEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionContextEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : ITransactionContextEx*, rclsid : LibC::GUID*, riid : LibC::GUID*, pObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, rclsid, riid, pObject)
    end
    def commit(this : ITransactionContextEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def abort(this : ITransactionContextEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end

  end

  @[Extern]
  record ITransactionContextVtbl,
    query_interface : Proc(ITransactionContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionContext*, UInt32),
    release : Proc(ITransactionContext*, UInt32),
    get_type_info_count : Proc(ITransactionContext*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ITransactionContext*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ITransactionContext*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ITransactionContext*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_instance : Proc(ITransactionContext*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    commit : Proc(ITransactionContext*, Win32cr::Foundation::HRESULT),
    abort : Proc(ITransactionContext*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7999fc21-d3c6-11cf-acab-00a024a55aef")]
  record ITransactionContext, lpVtbl : ITransactionContextVtbl* do
    GUID = LibC::GUID.new(0x7999fc21_u32, 0xd3c6_u16, 0x11cf_u16, StaticArray[0xac_u8, 0xab_u8, 0x0_u8, 0xa0_u8, 0x24_u8, 0xa5_u8, 0x5a_u8, 0xef_u8])
    def query_interface(this : ITransactionContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ITransactionContext*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ITransactionContext*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ITransactionContext*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ITransactionContext*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_instance(this : ITransactionContext*, pszProgId : Win32cr::Foundation::BSTR, pObject : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pszProgId, pObject)
    end
    def commit(this : ITransactionContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def abort(this : ITransactionContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end

  end

  @[Extern]
  record ICreateWithTransactionExVtbl,
    query_interface : Proc(ICreateWithTransactionEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICreateWithTransactionEx*, UInt32),
    release : Proc(ICreateWithTransactionEx*, UInt32),
    create_instance : Proc(ICreateWithTransactionEx*, Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("455acf57-5345-11d2-99cf-00c04f797bc9")]
  record ICreateWithTransactionEx, lpVtbl : ICreateWithTransactionExVtbl* do
    GUID = LibC::GUID.new(0x455acf57_u32, 0x5345_u16, 0x11d2_u16, StaticArray[0x99_u8, 0xcf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
    def query_interface(this : ICreateWithTransactionEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICreateWithTransactionEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICreateWithTransactionEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : ICreateWithTransactionEx*, pTransaction : Void*, rclsid : LibC::GUID*, riid : LibC::GUID*, pObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, pTransaction, rclsid, riid, pObject)
    end

  end

  @[Extern]
  record ICreateWithLocalTransactionVtbl,
    query_interface : Proc(ICreateWithLocalTransaction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICreateWithLocalTransaction*, UInt32),
    release : Proc(ICreateWithLocalTransaction*, UInt32),
    create_instance_with_sys_tx : Proc(ICreateWithLocalTransaction*, Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("227ac7a8-8423-42ce-b7cf-03061ec9aaa3")]
  record ICreateWithLocalTransaction, lpVtbl : ICreateWithLocalTransactionVtbl* do
    GUID = LibC::GUID.new(0x227ac7a8_u32, 0x8423_u16, 0x42ce_u16, StaticArray[0xb7_u8, 0xcf_u8, 0x3_u8, 0x6_u8, 0x1e_u8, 0xc9_u8, 0xaa_u8, 0xa3_u8])
    def query_interface(this : ICreateWithLocalTransaction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICreateWithLocalTransaction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICreateWithLocalTransaction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance_with_sys_tx(this : ICreateWithLocalTransaction*, pTransaction : Void*, rclsid : LibC::GUID*, riid : LibC::GUID*, pObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance_with_sys_tx.call(this, pTransaction, rclsid, riid, pObject)
    end

  end

  @[Extern]
  record ICreateWithTipTransactionExVtbl,
    query_interface : Proc(ICreateWithTipTransactionEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICreateWithTipTransactionEx*, UInt32),
    release : Proc(ICreateWithTipTransactionEx*, UInt32),
    create_instance : Proc(ICreateWithTipTransactionEx*, Win32cr::Foundation::BSTR, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("455acf59-5345-11d2-99cf-00c04f797bc9")]
  record ICreateWithTipTransactionEx, lpVtbl : ICreateWithTipTransactionExVtbl* do
    GUID = LibC::GUID.new(0x455acf59_u32, 0x5345_u16, 0x11d2_u16, StaticArray[0x99_u8, 0xcf_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
    def query_interface(this : ICreateWithTipTransactionEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICreateWithTipTransactionEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICreateWithTipTransactionEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : ICreateWithTipTransactionEx*, bstrTipUrl : Win32cr::Foundation::BSTR, rclsid : LibC::GUID*, riid : LibC::GUID*, pObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, bstrTipUrl, rclsid, riid, pObject)
    end

  end

  @[Extern]
  record IComLTxEventsVtbl,
    query_interface : Proc(IComLTxEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComLTxEvents*, UInt32),
    release : Proc(IComLTxEvents*, UInt32),
    on_ltx_transaction_start : Proc(IComLTxEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, LibC::GUID, Win32cr::Foundation::BOOL, Int32, Win32cr::Foundation::HRESULT),
    on_ltx_transaction_prepare : Proc(IComLTxEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_ltx_transaction_abort : Proc(IComLTxEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_ltx_transaction_commit : Proc(IComLTxEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_ltx_transaction_promote : Proc(IComLTxEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("605cf82c-578e-4298-975d-82babcd9e053")]
  record IComLTxEvents, lpVtbl : IComLTxEventsVtbl* do
    GUID = LibC::GUID.new(0x605cf82c_u32, 0x578e_u16, 0x4298_u16, StaticArray[0x97_u8, 0x5d_u8, 0x82_u8, 0xba_u8, 0xbc_u8, 0xd9_u8, 0xe0_u8, 0x53_u8])
    def query_interface(this : IComLTxEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComLTxEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComLTxEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_ltx_transaction_start(this : IComLTxEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidLtx : LibC::GUID, tsid : LibC::GUID, fRoot : Win32cr::Foundation::BOOL, nIsolationLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ltx_transaction_start.call(this, pInfo, guidLtx, tsid, fRoot, nIsolationLevel)
    end
    def on_ltx_transaction_prepare(this : IComLTxEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidLtx : LibC::GUID, fVote : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ltx_transaction_prepare.call(this, pInfo, guidLtx, fVote)
    end
    def on_ltx_transaction_abort(this : IComLTxEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidLtx : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ltx_transaction_abort.call(this, pInfo, guidLtx)
    end
    def on_ltx_transaction_commit(this : IComLTxEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidLtx : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ltx_transaction_commit.call(this, pInfo, guidLtx)
    end
    def on_ltx_transaction_promote(this : IComLTxEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidLtx : LibC::GUID, txnId : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ltx_transaction_promote.call(this, pInfo, guidLtx, txnId)
    end

  end

  @[Extern]
  record IComUserEventVtbl,
    query_interface : Proc(IComUserEvent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComUserEvent*, UInt32),
    release : Proc(IComUserEvent*, UInt32),
    on_user_event : Proc(IComUserEvent*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130a4-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComUserEvent, lpVtbl : IComUserEventVtbl* do
    GUID = LibC::GUID.new(0x683130a4_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComUserEvent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComUserEvent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComUserEvent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_user_event(this : IComUserEvent*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, pvarEvent : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_user_event.call(this, pInfo, pvarEvent)
    end

  end

  @[Extern]
  record IComThreadEventsVtbl,
    query_interface : Proc(IComThreadEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComThreadEvents*, UInt32),
    release : Proc(IComThreadEvents*, UInt32),
    on_thread_start : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_terminate : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_bind_to_apartment : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_un_bind : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_work_enque : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_work_private : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    on_thread_work_public : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_work_redirect : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, UInt64, Win32cr::Foundation::HRESULT),
    on_thread_work_reject : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_assign_apartment : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt64, Win32cr::Foundation::HRESULT),
    on_thread_unassign_apartment : Proc(IComThreadEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130a5-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComThreadEvents, lpVtbl : IComThreadEventsVtbl* do
    GUID = LibC::GUID.new(0x683130a5_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComThreadEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComThreadEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComThreadEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_thread_start(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, dwThread : UInt32, dwTheadCnt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_start.call(this, pInfo, thread_id, dwThread, dwTheadCnt)
    end
    def on_thread_terminate(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, dwThread : UInt32, dwTheadCnt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_terminate.call(this, pInfo, thread_id, dwThread, dwTheadCnt)
    end
    def on_thread_bind_to_apartment(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, apt_id : UInt64, dwActCnt : UInt32, dwLowCnt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_bind_to_apartment.call(this, pInfo, thread_id, apt_id, dwActCnt, dwLowCnt)
    end
    def on_thread_un_bind(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, apt_id : UInt64, dwActCnt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_un_bind.call(this, pInfo, thread_id, apt_id, dwActCnt)
    end
    def on_thread_work_enque(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, msg_work_id : UInt64, queue_len : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_work_enque.call(this, pInfo, thread_id, msg_work_id, queue_len)
    end
    def on_thread_work_private(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, msg_work_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_work_private.call(this, pInfo, thread_id, msg_work_id)
    end
    def on_thread_work_public(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, msg_work_id : UInt64, queue_len : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_work_public.call(this, pInfo, thread_id, msg_work_id, queue_len)
    end
    def on_thread_work_redirect(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, msg_work_id : UInt64, queue_len : UInt32, thread_num : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_work_redirect.call(this, pInfo, thread_id, msg_work_id, queue_len, thread_num)
    end
    def on_thread_work_reject(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, thread_id : UInt64, msg_work_id : UInt64, queue_len : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_work_reject.call(this, pInfo, thread_id, msg_work_id, queue_len)
    end
    def on_thread_assign_apartment(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, apt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_assign_apartment.call(this, pInfo, guidActivity, apt_id)
    end
    def on_thread_unassign_apartment(this : IComThreadEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, apt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_unassign_apartment.call(this, pInfo, apt_id)
    end

  end

  @[Extern]
  record IComAppEventsVtbl,
    query_interface : Proc(IComAppEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComAppEvents*, UInt32),
    release : Proc(IComAppEvents*, UInt32),
    on_app_activation : Proc(IComAppEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_app_shutdown : Proc(IComAppEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_app_force_shutdown : Proc(IComAppEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130a6-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComAppEvents, lpVtbl : IComAppEventsVtbl* do
    GUID = LibC::GUID.new(0x683130a6_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComAppEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComAppEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComAppEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_app_activation(this : IComAppEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_activation.call(this, pInfo, guidApp)
    end
    def on_app_shutdown(this : IComAppEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_shutdown.call(this, pInfo, guidApp)
    end
    def on_app_force_shutdown(this : IComAppEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_force_shutdown.call(this, pInfo, guidApp)
    end

  end

  @[Extern]
  record IComInstanceEventsVtbl,
    query_interface : Proc(IComInstanceEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComInstanceEvents*, UInt32),
    release : Proc(IComInstanceEvents*, UInt32),
    on_object_create : Proc(IComInstanceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, LibC::GUID*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    on_object_destroy : Proc(IComInstanceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130a7-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComInstanceEvents, lpVtbl : IComInstanceEventsVtbl* do
    GUID = LibC::GUID.new(0x683130a7_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComInstanceEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComInstanceEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComInstanceEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_object_create(this : IComInstanceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, clsid : LibC::GUID*, tsid : LibC::GUID*, ctxt_id : UInt64, object_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_create.call(this, pInfo, guidActivity, clsid, tsid, ctxt_id, object_id)
    end
    def on_object_destroy(this : IComInstanceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_destroy.call(this, pInfo, ctxt_id)
    end

  end

  @[Extern]
  record IComTransactionEventsVtbl,
    query_interface : Proc(IComTransactionEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComTransactionEvents*, UInt32),
    release : Proc(IComTransactionEvents*, UInt32),
    on_transaction_start : Proc(IComTransactionEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_transaction_prepare : Proc(IComTransactionEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_transaction_abort : Proc(IComTransactionEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_transaction_commit : Proc(IComTransactionEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130a8-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComTransactionEvents, lpVtbl : IComTransactionEventsVtbl* do
    GUID = LibC::GUID.new(0x683130a8_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComTransactionEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComTransactionEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComTransactionEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_transaction_start(this : IComTransactionEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*, tsid : LibC::GUID*, fRoot : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_start.call(this, pInfo, guidTx, tsid, fRoot)
    end
    def on_transaction_prepare(this : IComTransactionEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*, fVoteYes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_prepare.call(this, pInfo, guidTx, fVoteYes)
    end
    def on_transaction_abort(this : IComTransactionEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_abort.call(this, pInfo, guidTx)
    end
    def on_transaction_commit(this : IComTransactionEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_commit.call(this, pInfo, guidTx)
    end

  end

  @[Extern]
  record IComMethodEventsVtbl,
    query_interface : Proc(IComMethodEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComMethodEvents*, UInt32),
    release : Proc(IComMethodEvents*, UInt32),
    on_method_call : Proc(IComMethodEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    on_method_return : Proc(IComMethodEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_method_exception : Proc(IComMethodEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130a9-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComMethodEvents, lpVtbl : IComMethodEventsVtbl* do
    GUID = LibC::GUID.new(0x683130a9_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComMethodEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComMethodEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComMethodEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_method_call(this : IComMethodEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, oid : UInt64, guidCid : LibC::GUID*, guidRid : LibC::GUID*, iMeth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_method_call.call(this, pInfo, oid, guidCid, guidRid, iMeth)
    end
    def on_method_return(this : IComMethodEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, oid : UInt64, guidCid : LibC::GUID*, guidRid : LibC::GUID*, iMeth : UInt32, hresult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_method_return.call(this, pInfo, oid, guidCid, guidRid, iMeth, hresult)
    end
    def on_method_exception(this : IComMethodEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, oid : UInt64, guidCid : LibC::GUID*, guidRid : LibC::GUID*, iMeth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_method_exception.call(this, pInfo, oid, guidCid, guidRid, iMeth)
    end

  end

  @[Extern]
  record IComObjectEventsVtbl,
    query_interface : Proc(IComObjectEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComObjectEvents*, UInt32),
    release : Proc(IComObjectEvents*, UInt32),
    on_object_activate : Proc(IComObjectEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    on_object_deactivate : Proc(IComObjectEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt64, Win32cr::Foundation::HRESULT),
    on_disable_commit : Proc(IComObjectEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT),
    on_enable_commit : Proc(IComObjectEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT),
    on_set_complete : Proc(IComObjectEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT),
    on_set_abort : Proc(IComObjectEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130aa-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComObjectEvents, lpVtbl : IComObjectEventsVtbl* do
    GUID = LibC::GUID.new(0x683130aa_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComObjectEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComObjectEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComObjectEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_object_activate(this : IComObjectEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64, object_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_activate.call(this, pInfo, ctxt_id, object_id)
    end
    def on_object_deactivate(this : IComObjectEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64, object_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_deactivate.call(this, pInfo, ctxt_id, object_id)
    end
    def on_disable_commit(this : IComObjectEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_disable_commit.call(this, pInfo, ctxt_id)
    end
    def on_enable_commit(this : IComObjectEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_enable_commit.call(this, pInfo, ctxt_id)
    end
    def on_set_complete(this : IComObjectEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_complete.call(this, pInfo, ctxt_id)
    end
    def on_set_abort(this : IComObjectEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_abort.call(this, pInfo, ctxt_id)
    end

  end

  @[Extern]
  record IComResourceEventsVtbl,
    query_interface : Proc(IComResourceEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComResourceEvents*, UInt32),
    release : Proc(IComResourceEvents*, UInt32),
    on_resource_create : Proc(IComResourceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_resource_allocate : Proc(IComResourceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::BOOL, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_resource_recycle : Proc(IComResourceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    on_resource_destroy : Proc(IComResourceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT),
    on_resource_track : Proc(IComResourceEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130ab-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComResourceEvents, lpVtbl : IComResourceEventsVtbl* do
    GUID = LibC::GUID.new(0x683130ab_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComResourceEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComResourceEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComResourceEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_resource_create(this : IComResourceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, object_id : UInt64, pszType : Win32cr::Foundation::PWSTR, resId : UInt64, enlisted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_resource_create.call(this, pInfo, object_id, pszType, resId, enlisted)
    end
    def on_resource_allocate(this : IComResourceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, object_id : UInt64, pszType : Win32cr::Foundation::PWSTR, resId : UInt64, enlisted : Win32cr::Foundation::BOOL, num_rated : UInt32, rating : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_resource_allocate.call(this, pInfo, object_id, pszType, resId, enlisted, num_rated, rating)
    end
    def on_resource_recycle(this : IComResourceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, object_id : UInt64, pszType : Win32cr::Foundation::PWSTR, resId : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_resource_recycle.call(this, pInfo, object_id, pszType, resId)
    end
    def on_resource_destroy(this : IComResourceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, object_id : UInt64, hr : Win32cr::Foundation::HRESULT, pszType : Win32cr::Foundation::PWSTR, resId : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_resource_destroy.call(this, pInfo, object_id, hr, pszType, resId)
    end
    def on_resource_track(this : IComResourceEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, object_id : UInt64, pszType : Win32cr::Foundation::PWSTR, resId : UInt64, enlisted : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_resource_track.call(this, pInfo, object_id, pszType, resId, enlisted)
    end

  end

  @[Extern]
  record IComSecurityEventsVtbl,
    query_interface : Proc(IComSecurityEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComSecurityEvents*, UInt32),
    release : Proc(IComSecurityEvents*, UInt32),
    on_authenticate : Proc(IComSecurityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt64, LibC::GUID*, UInt32, UInt32, UInt8*, UInt32, UInt8*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_authenticate_fail : Proc(IComSecurityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt64, LibC::GUID*, UInt32, UInt32, UInt8*, UInt32, UInt8*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130ac-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComSecurityEvents, lpVtbl : IComSecurityEventsVtbl* do
    GUID = LibC::GUID.new(0x683130ac_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComSecurityEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComSecurityEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComSecurityEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_authenticate(this : IComSecurityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, object_id : UInt64, guidIID : LibC::GUID*, iMeth : UInt32, cbByteOrig : UInt32, pSidOriginalUser : UInt8*, cbByteCur : UInt32, pSidCurrentUser : UInt8*, bCurrentUserInpersonatingInProc : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_authenticate.call(this, pInfo, guidActivity, object_id, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc)
    end
    def on_authenticate_fail(this : IComSecurityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, object_id : UInt64, guidIID : LibC::GUID*, iMeth : UInt32, cbByteOrig : UInt32, pSidOriginalUser : UInt8*, cbByteCur : UInt32, pSidCurrentUser : UInt8*, bCurrentUserInpersonatingInProc : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_authenticate_fail.call(this, pInfo, guidActivity, object_id, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc)
    end

  end

  @[Extern]
  record IComObjectPoolEventsVtbl,
    query_interface : Proc(IComObjectPoolEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComObjectPoolEvents*, UInt32),
    release : Proc(IComObjectPoolEvents*, UInt32),
    on_obj_pool_put_object : Proc(IComObjectPoolEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Int32, UInt32, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_get_object : Proc(IComObjectPoolEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, UInt32, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_recycle_to_tx : Proc(IComObjectPoolEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, LibC::GUID*, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_get_from_tx : Proc(IComObjectPoolEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, LibC::GUID*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130ad-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComObjectPoolEvents, lpVtbl : IComObjectPoolEventsVtbl* do
    GUID = LibC::GUID.new(0x683130ad_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComObjectPoolEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComObjectPoolEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComObjectPoolEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_obj_pool_put_object(this : IComObjectPoolEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, nReason : Int32, dwAvailable : UInt32, oid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_put_object.call(this, pInfo, guidObject, nReason, dwAvailable, oid)
    end
    def on_obj_pool_get_object(this : IComObjectPoolEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, guidObject : LibC::GUID*, dwAvailable : UInt32, oid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_get_object.call(this, pInfo, guidActivity, guidObject, dwAvailable, oid)
    end
    def on_obj_pool_recycle_to_tx(this : IComObjectPoolEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, guidObject : LibC::GUID*, guidTx : LibC::GUID*, objid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_recycle_to_tx.call(this, pInfo, guidActivity, guidObject, guidTx, objid)
    end
    def on_obj_pool_get_from_tx(this : IComObjectPoolEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, guidObject : LibC::GUID*, guidTx : LibC::GUID*, objid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_get_from_tx.call(this, pInfo, guidActivity, guidObject, guidTx, objid)
    end

  end

  @[Extern]
  record IComObjectPoolEvents2Vtbl,
    query_interface : Proc(IComObjectPoolEvents2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComObjectPoolEvents2*, UInt32),
    release : Proc(IComObjectPoolEvents2*, UInt32),
    on_obj_pool_create_object : Proc(IComObjectPoolEvents2*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt32, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_destroy_object : Proc(IComObjectPoolEvents2*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt32, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_create_decision : Proc(IComObjectPoolEvents2*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt32, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_obj_pool_timeout : Proc(IComObjectPoolEvents2*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    on_obj_pool_create_pool : Proc(IComObjectPoolEvents2*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt32, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130ae-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComObjectPoolEvents2, lpVtbl : IComObjectPoolEvents2Vtbl* do
    GUID = LibC::GUID.new(0x683130ae_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComObjectPoolEvents2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComObjectPoolEvents2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComObjectPoolEvents2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_obj_pool_create_object(this : IComObjectPoolEvents2*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, dwObjsCreated : UInt32, oid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_create_object.call(this, pInfo, guidObject, dwObjsCreated, oid)
    end
    def on_obj_pool_destroy_object(this : IComObjectPoolEvents2*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, dwObjsCreated : UInt32, oid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_destroy_object.call(this, pInfo, guidObject, dwObjsCreated, oid)
    end
    def on_obj_pool_create_decision(this : IComObjectPoolEvents2*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, dwThreadsWaiting : UInt32, dwAvail : UInt32, dwCreated : UInt32, dwMin : UInt32, dwMax : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_create_decision.call(this, pInfo, dwThreadsWaiting, dwAvail, dwCreated, dwMin, dwMax)
    end
    def on_obj_pool_timeout(this : IComObjectPoolEvents2*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, guidActivity : LibC::GUID*, dwTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_timeout.call(this, pInfo, guidObject, guidActivity, dwTimeout)
    end
    def on_obj_pool_create_pool(this : IComObjectPoolEvents2*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, dwMin : UInt32, dwMax : UInt32, dwTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_create_pool.call(this, pInfo, guidObject, dwMin, dwMax, dwTimeout)
    end

  end

  @[Extern]
  record IComObjectConstructionEventsVtbl,
    query_interface : Proc(IComObjectConstructionEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComObjectConstructionEvents*, UInt32),
    release : Proc(IComObjectConstructionEvents*, UInt32),
    on_object_construct : Proc(IComObjectConstructionEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::PWSTR, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130af-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComObjectConstructionEvents, lpVtbl : IComObjectConstructionEventsVtbl* do
    GUID = LibC::GUID.new(0x683130af_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComObjectConstructionEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComObjectConstructionEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComObjectConstructionEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_object_construct(this : IComObjectConstructionEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, sConstructString : Win32cr::Foundation::PWSTR, oid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_construct.call(this, pInfo, guidObject, sConstructString, oid)
    end

  end

  @[Extern]
  record IComActivityEventsVtbl,
    query_interface : Proc(IComActivityEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComActivityEvents*, UInt32),
    release : Proc(IComActivityEvents*, UInt32),
    on_activity_create : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_activity_destroy : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_activity_enter : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    on_activity_timeout : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_activity_reenter : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_activity_leave : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_activity_leave_same : Proc(IComActivityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130b0-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComActivityEvents, lpVtbl : IComActivityEventsVtbl* do
    GUID = LibC::GUID.new(0x683130b0_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComActivityEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComActivityEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComActivityEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_activity_create(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_create.call(this, pInfo, guidActivity)
    end
    def on_activity_destroy(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_destroy.call(this, pInfo, guidActivity)
    end
    def on_activity_enter(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidCurrent : LibC::GUID*, guidEntered : LibC::GUID*, dwThread : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_enter.call(this, pInfo, guidCurrent, guidEntered, dwThread)
    end
    def on_activity_timeout(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidCurrent : LibC::GUID*, guidEntered : LibC::GUID*, dwThread : UInt32, dwTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_timeout.call(this, pInfo, guidCurrent, guidEntered, dwThread, dwTimeout)
    end
    def on_activity_reenter(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidCurrent : LibC::GUID*, dwThread : UInt32, dwCallDepth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_reenter.call(this, pInfo, guidCurrent, dwThread, dwCallDepth)
    end
    def on_activity_leave(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidCurrent : LibC::GUID*, guidLeft : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_leave.call(this, pInfo, guidCurrent, guidLeft)
    end
    def on_activity_leave_same(this : IComActivityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidCurrent : LibC::GUID*, dwCallDepth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_leave_same.call(this, pInfo, guidCurrent, dwCallDepth)
    end

  end

  @[Extern]
  record IComIdentityEventsVtbl,
    query_interface : Proc(IComIdentityEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComIdentityEvents*, UInt32),
    release : Proc(IComIdentityEvents*, UInt32),
    on_iis_request_info : Proc(IComIdentityEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130b1-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComIdentityEvents, lpVtbl : IComIdentityEventsVtbl* do
    GUID = LibC::GUID.new(0x683130b1_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComIdentityEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComIdentityEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComIdentityEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_iis_request_info(this : IComIdentityEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, obj_id : UInt64, pszClientIP : Win32cr::Foundation::PWSTR, pszServerIP : Win32cr::Foundation::PWSTR, pszURL : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_iis_request_info.call(this, pInfo, obj_id, pszClientIP, pszServerIP, pszURL)
    end

  end

  @[Extern]
  record IComQCEventsVtbl,
    query_interface : Proc(IComQCEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComQCEvents*, UInt32),
    release : Proc(IComQCEvents*, UInt32),
    on_qc_record : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, UInt16*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_qc_queue_open : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt16*, UInt64, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_qc_receive : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_qc_receive_fail : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_qc_move_to_re_try_queue : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    on_qc_move_to_dead_queue : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_qc_playback : Proc(IComQCEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130b2-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComQCEvents, lpVtbl : IComQCEventsVtbl* do
    GUID = LibC::GUID.new(0x683130b2_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComQCEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComQCEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComQCEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_qc_record(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, objid : UInt64, szQueue : UInt16*, guidMsgId : LibC::GUID*, guidWorkFlowId : LibC::GUID*, msmqhr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_record.call(this, pInfo, objid, szQueue, guidMsgId, guidWorkFlowId, msmqhr)
    end
    def on_qc_queue_open(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, szQueue : UInt16*, queue_id : UInt64, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_queue_open.call(this, pInfo, szQueue, queue_id, hr)
    end
    def on_qc_receive(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, queue_id : UInt64, guidMsgId : LibC::GUID*, guidWorkFlowId : LibC::GUID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_receive.call(this, pInfo, queue_id, guidMsgId, guidWorkFlowId, hr)
    end
    def on_qc_receive_fail(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, queue_id : UInt64, msmqhr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_receive_fail.call(this, pInfo, queue_id, msmqhr)
    end
    def on_qc_move_to_re_try_queue(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidMsgId : LibC::GUID*, guidWorkFlowId : LibC::GUID*, retry_index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_move_to_re_try_queue.call(this, pInfo, guidMsgId, guidWorkFlowId, retry_index)
    end
    def on_qc_move_to_dead_queue(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidMsgId : LibC::GUID*, guidWorkFlowId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_move_to_dead_queue.call(this, pInfo, guidMsgId, guidWorkFlowId)
    end
    def on_qc_playback(this : IComQCEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, objid : UInt64, guidMsgId : LibC::GUID*, guidWorkFlowId : LibC::GUID*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_qc_playback.call(this, pInfo, objid, guidMsgId, guidWorkFlowId, hr)
    end

  end

  @[Extern]
  record IComExceptionEventsVtbl,
    query_interface : Proc(IComExceptionEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComExceptionEvents*, UInt32),
    release : Proc(IComExceptionEvents*, UInt32),
    on_exception_user : Proc(IComExceptionEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt32, UInt64, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130b3-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComExceptionEvents, lpVtbl : IComExceptionEventsVtbl* do
    GUID = LibC::GUID.new(0x683130b3_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComExceptionEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComExceptionEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComExceptionEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_exception_user(this : IComExceptionEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, code : UInt32, address : UInt64, pszStackTrace : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_exception_user.call(this, pInfo, code, address, pszStackTrace)
    end

  end

  @[Extern]
  record ILBEventsVtbl,
    query_interface : Proc(ILBEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILBEvents*, UInt32),
    release : Proc(ILBEvents*, UInt32),
    target_up : Proc(ILBEvents*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    target_down : Proc(ILBEvents*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    engine_defined : Proc(ILBEvents*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130b4-2e50-11d2-98a5-00c04f8ee1c4")]
  record ILBEvents, lpVtbl : ILBEventsVtbl* do
    GUID = LibC::GUID.new(0x683130b4_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : ILBEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILBEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILBEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def target_up(this : ILBEvents*, bstrServerName : Win32cr::Foundation::BSTR, bstrClsidEng : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.target_up.call(this, bstrServerName, bstrClsidEng)
    end
    def target_down(this : ILBEvents*, bstrServerName : Win32cr::Foundation::BSTR, bstrClsidEng : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.target_down.call(this, bstrServerName, bstrClsidEng)
    end
    def engine_defined(this : ILBEvents*, bstrPropName : Win32cr::Foundation::BSTR, varPropValue : Win32cr::System::Com::VARIANT*, bstrClsidEng : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.engine_defined.call(this, bstrPropName, varPropValue, bstrClsidEng)
    end

  end

  @[Extern]
  record IComCRMEventsVtbl,
    query_interface : Proc(IComCRMEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComCRMEvents*, UInt32),
    release : Proc(IComCRMEvents*, UInt32),
    on_crm_recovery_start : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_recovery_done : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_checkpoint : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_begin : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, LibC::GUID, LibC::GUID, UInt16*, UInt16*, Win32cr::Foundation::HRESULT),
    on_crm_prepare : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_commit : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_abort : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_indoubt : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_done : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_release : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_analyze : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_crm_write : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::HRESULT),
    on_crm_forget : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_force : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_crm_deliver : Proc(IComCRMEvents*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("683130b5-2e50-11d2-98a5-00c04f8ee1c4")]
  record IComCRMEvents, lpVtbl : IComCRMEventsVtbl* do
    GUID = LibC::GUID.new(0x683130b5_u32, 0x2e50_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xa5_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComCRMEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComCRMEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComCRMEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_crm_recovery_start(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_recovery_start.call(this, pInfo, guidApp)
    end
    def on_crm_recovery_done(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_recovery_done.call(this, pInfo, guidApp)
    end
    def on_crm_checkpoint(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_checkpoint.call(this, pInfo, guidApp)
    end
    def on_crm_begin(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID, guidActivity : LibC::GUID, guidTx : LibC::GUID, szProgIdCompensator : UInt16*, szDescription : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_begin.call(this, pInfo, guidClerkCLSID, guidActivity, guidTx, szProgIdCompensator, szDescription)
    end
    def on_crm_prepare(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_prepare.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_commit(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_commit.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_abort(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_abort.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_indoubt(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_indoubt.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_done(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_done.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_release(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_release.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_analyze(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID, dwCrmRecordType : UInt32, dwRecordSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_analyze.call(this, pInfo, guidClerkCLSID, dwCrmRecordType, dwRecordSize)
    end
    def on_crm_write(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID, fVariants : Win32cr::Foundation::BOOL, dwRecordSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_write.call(this, pInfo, guidClerkCLSID, fVariants, dwRecordSize)
    end
    def on_crm_forget(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_forget.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_force(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_force.call(this, pInfo, guidClerkCLSID)
    end
    def on_crm_deliver(this : IComCRMEvents*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidClerkCLSID : LibC::GUID, fVariants : Win32cr::Foundation::BOOL, dwRecordSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_crm_deliver.call(this, pInfo, guidClerkCLSID, fVariants, dwRecordSize)
    end

  end

  @[Extern]
  record IComMethod2EventsVtbl,
    query_interface : Proc(IComMethod2Events*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComMethod2Events*, UInt32),
    release : Proc(IComMethod2Events*, UInt32),
    on_method_call2 : Proc(IComMethod2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    on_method_return2 : Proc(IComMethod2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    on_method_exception2 : Proc(IComMethod2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, LibC::GUID*, LibC::GUID*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fb388aaa-567d-4024-af8e-6e93ee748573")]
  record IComMethod2Events, lpVtbl : IComMethod2EventsVtbl* do
    GUID = LibC::GUID.new(0xfb388aaa_u32, 0x567d_u16, 0x4024_u16, StaticArray[0xaf_u8, 0x8e_u8, 0x6e_u8, 0x93_u8, 0xee_u8, 0x74_u8, 0x85_u8, 0x73_u8])
    def query_interface(this : IComMethod2Events*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComMethod2Events*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComMethod2Events*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_method_call2(this : IComMethod2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, oid : UInt64, guidCid : LibC::GUID*, guidRid : LibC::GUID*, dwThread : UInt32, iMeth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_method_call2.call(this, pInfo, oid, guidCid, guidRid, dwThread, iMeth)
    end
    def on_method_return2(this : IComMethod2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, oid : UInt64, guidCid : LibC::GUID*, guidRid : LibC::GUID*, dwThread : UInt32, iMeth : UInt32, hresult : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_method_return2.call(this, pInfo, oid, guidCid, guidRid, dwThread, iMeth, hresult)
    end
    def on_method_exception2(this : IComMethod2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, oid : UInt64, guidCid : LibC::GUID*, guidRid : LibC::GUID*, dwThread : UInt32, iMeth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_method_exception2.call(this, pInfo, oid, guidCid, guidRid, dwThread, iMeth)
    end

  end

  @[Extern]
  record IComTrackingInfoEventsVtbl,
    query_interface : Proc(IComTrackingInfoEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComTrackingInfoEvents*, UInt32),
    release : Proc(IComTrackingInfoEvents*, UInt32),
    on_new_tracking_info : Proc(IComTrackingInfoEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec")]
  record IComTrackingInfoEvents, lpVtbl : IComTrackingInfoEventsVtbl* do
    GUID = LibC::GUID.new(0x4e6cdcc9_u32, 0xfb25_u16, 0x4fd5_u16, StaticArray[0x9c_u8, 0xc5_u8, 0xc9_u8, 0xf4_u8, 0xb6_u8, 0x55_u8, 0x9c_u8, 0xec_u8])
    def query_interface(this : IComTrackingInfoEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComTrackingInfoEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComTrackingInfoEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_new_tracking_info(this : IComTrackingInfoEvents*, pToplevelCollection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_new_tracking_info.call(this, pToplevelCollection)
    end

  end

  @[Extern]
  record IComTrackingInfoCollectionVtbl,
    query_interface : Proc(IComTrackingInfoCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComTrackingInfoCollection*, UInt32),
    release : Proc(IComTrackingInfoCollection*, UInt32),
    type__ : Proc(IComTrackingInfoCollection*, Win32cr::System::ComponentServices::TRACKING_COLL_TYPE*, Win32cr::Foundation::HRESULT),
    count : Proc(IComTrackingInfoCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(IComTrackingInfoCollection*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c266c677-c9ad-49ab-9fd9-d9661078588a")]
  record IComTrackingInfoCollection, lpVtbl : IComTrackingInfoCollectionVtbl* do
    GUID = LibC::GUID.new(0xc266c677_u32, 0xc9ad_u16, 0x49ab_u16, StaticArray[0x9f_u8, 0xd9_u8, 0xd9_u8, 0x66_u8, 0x10_u8, 0x78_u8, 0x58_u8, 0x8a_u8])
    def query_interface(this : IComTrackingInfoCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComTrackingInfoCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComTrackingInfoCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def type__(this : IComTrackingInfoCollection*, pType : Win32cr::System::ComponentServices::TRACKING_COLL_TYPE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.type__.call(this, pType)
    end
    def count(this : IComTrackingInfoCollection*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count.call(this, pCount)
    end
    def item(this : IComTrackingInfoCollection*, ulIndex : UInt32, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, ulIndex, riid, ppv)
    end

  end

  @[Extern]
  record IComTrackingInfoObjectVtbl,
    query_interface : Proc(IComTrackingInfoObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComTrackingInfoObject*, UInt32),
    release : Proc(IComTrackingInfoObject*, UInt32),
    get_value : Proc(IComTrackingInfoObject*, Win32cr::Foundation::PWSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("116e42c5-d8b1-47bf-ab1e-c895ed3e2372")]
  record IComTrackingInfoObject, lpVtbl : IComTrackingInfoObjectVtbl* do
    GUID = LibC::GUID.new(0x116e42c5_u32, 0xd8b1_u16, 0x47bf_u16, StaticArray[0xab_u8, 0x1e_u8, 0xc8_u8, 0x95_u8, 0xed_u8, 0x3e_u8, 0x23_u8, 0x72_u8])
    def query_interface(this : IComTrackingInfoObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComTrackingInfoObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComTrackingInfoObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_value(this : IComTrackingInfoObject*, szPropertyName : Win32cr::Foundation::PWSTR, pvarOut : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, szPropertyName, pvarOut)
    end

  end

  @[Extern]
  record IComTrackingInfoPropertiesVtbl,
    query_interface : Proc(IComTrackingInfoProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComTrackingInfoProperties*, UInt32),
    release : Proc(IComTrackingInfoProperties*, UInt32),
    prop_count : Proc(IComTrackingInfoProperties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_prop_name : Proc(IComTrackingInfoProperties*, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("789b42be-6f6b-443a-898e-67abf390aa14")]
  record IComTrackingInfoProperties, lpVtbl : IComTrackingInfoPropertiesVtbl* do
    GUID = LibC::GUID.new(0x789b42be_u32, 0x6f6b_u16, 0x443a_u16, StaticArray[0x89_u8, 0x8e_u8, 0x67_u8, 0xab_u8, 0xf3_u8, 0x90_u8, 0xaa_u8, 0x14_u8])
    def query_interface(this : IComTrackingInfoProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComTrackingInfoProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComTrackingInfoProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def prop_count(this : IComTrackingInfoProperties*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prop_count.call(this, pCount)
    end
    def get_prop_name(this : IComTrackingInfoProperties*, ulIndex : UInt32, ppszPropName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_name.call(this, ulIndex, ppszPropName)
    end

  end

  @[Extern]
  record IComApp2EventsVtbl,
    query_interface : Proc(IComApp2Events*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComApp2Events*, UInt32),
    release : Proc(IComApp2Events*, UInt32),
    on_app_activation2 : Proc(IComApp2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_app_shutdown2 : Proc(IComApp2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_app_force_shutdown2 : Proc(IComApp2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_app_paused2 : Proc(IComApp2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_app_recycle2 : Proc(IComApp2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID, LibC::GUID, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1290bc1a-b219-418d-b078-5934ded08242")]
  record IComApp2Events, lpVtbl : IComApp2EventsVtbl* do
    GUID = LibC::GUID.new(0x1290bc1a_u32, 0xb219_u16, 0x418d_u16, StaticArray[0xb0_u8, 0x78_u8, 0x59_u8, 0x34_u8, 0xde_u8, 0xd0_u8, 0x82_u8, 0x42_u8])
    def query_interface(this : IComApp2Events*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComApp2Events*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComApp2Events*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_app_activation2(this : IComApp2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID, guidProcess : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_activation2.call(this, pInfo, guidApp, guidProcess)
    end
    def on_app_shutdown2(this : IComApp2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_shutdown2.call(this, pInfo, guidApp)
    end
    def on_app_force_shutdown2(this : IComApp2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_force_shutdown2.call(this, pInfo, guidApp)
    end
    def on_app_paused2(this : IComApp2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID, bPaused : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_paused2.call(this, pInfo, guidApp, bPaused)
    end
    def on_app_recycle2(this : IComApp2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidApp : LibC::GUID, guidProcess : LibC::GUID, lReason : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_app_recycle2.call(this, pInfo, guidApp, guidProcess, lReason)
    end

  end

  @[Extern]
  record IComTransaction2EventsVtbl,
    query_interface : Proc(IComTransaction2Events*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComTransaction2Events*, UInt32),
    release : Proc(IComTransaction2Events*, UInt32),
    on_transaction_start2 : Proc(IComTransaction2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::BOOL, Int32, Win32cr::Foundation::HRESULT),
    on_transaction_prepare2 : Proc(IComTransaction2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_transaction_abort2 : Proc(IComTransaction2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_transaction_commit2 : Proc(IComTransaction2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a136f62a-2f94-4288-86e0-d8a1fa4c0299")]
  record IComTransaction2Events, lpVtbl : IComTransaction2EventsVtbl* do
    GUID = LibC::GUID.new(0xa136f62a_u32, 0x2f94_u16, 0x4288_u16, StaticArray[0x86_u8, 0xe0_u8, 0xd8_u8, 0xa1_u8, 0xfa_u8, 0x4c_u8, 0x2_u8, 0x99_u8])
    def query_interface(this : IComTransaction2Events*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComTransaction2Events*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComTransaction2Events*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_transaction_start2(this : IComTransaction2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*, tsid : LibC::GUID*, fRoot : Win32cr::Foundation::BOOL, nIsolationLevel : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_start2.call(this, pInfo, guidTx, tsid, fRoot, nIsolationLevel)
    end
    def on_transaction_prepare2(this : IComTransaction2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*, fVoteYes : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_prepare2.call(this, pInfo, guidTx, fVoteYes)
    end
    def on_transaction_abort2(this : IComTransaction2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_abort2.call(this, pInfo, guidTx)
    end
    def on_transaction_commit2(this : IComTransaction2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidTx : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transaction_commit2.call(this, pInfo, guidTx)
    end

  end

  @[Extern]
  record IComInstance2EventsVtbl,
    query_interface : Proc(IComInstance2Events*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComInstance2Events*, UInt32),
    release : Proc(IComInstance2Events*, UInt32),
    on_object_create2 : Proc(IComInstance2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, LibC::GUID*, UInt64, UInt64, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_object_destroy2 : Proc(IComInstance2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("20e3bf07-b506-4ad5-a50c-d2ca5b9c158e")]
  record IComInstance2Events, lpVtbl : IComInstance2EventsVtbl* do
    GUID = LibC::GUID.new(0x20e3bf07_u32, 0xb506_u16, 0x4ad5_u16, StaticArray[0xa5_u8, 0xc_u8, 0xd2_u8, 0xca_u8, 0x5b_u8, 0x9c_u8, 0x15_u8, 0x8e_u8])
    def query_interface(this : IComInstance2Events*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComInstance2Events*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComInstance2Events*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_object_create2(this : IComInstance2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, clsid : LibC::GUID*, tsid : LibC::GUID*, ctxt_id : UInt64, object_id : UInt64, guidPartition : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_create2.call(this, pInfo, guidActivity, clsid, tsid, ctxt_id, object_id, guidPartition)
    end
    def on_object_destroy2(this : IComInstance2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, ctxt_id : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_destroy2.call(this, pInfo, ctxt_id)
    end

  end

  @[Extern]
  record IComObjectPool2EventsVtbl,
    query_interface : Proc(IComObjectPool2Events*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComObjectPool2Events*, UInt32),
    release : Proc(IComObjectPool2Events*, UInt32),
    on_obj_pool_put_object2 : Proc(IComObjectPool2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Int32, UInt32, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_get_object2 : Proc(IComObjectPool2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, UInt32, UInt64, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_obj_pool_recycle_to_tx2 : Proc(IComObjectPool2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, LibC::GUID*, UInt64, Win32cr::Foundation::HRESULT),
    on_obj_pool_get_from_tx2 : Proc(IComObjectPool2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, LibC::GUID*, LibC::GUID*, UInt64, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("65bf6534-85ea-4f64-8cf4-3d974b2ab1cf")]
  record IComObjectPool2Events, lpVtbl : IComObjectPool2EventsVtbl* do
    GUID = LibC::GUID.new(0x65bf6534_u32, 0x85ea_u16, 0x4f64_u16, StaticArray[0x8c_u8, 0xf4_u8, 0x3d_u8, 0x97_u8, 0x4b_u8, 0x2a_u8, 0xb1_u8, 0xcf_u8])
    def query_interface(this : IComObjectPool2Events*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComObjectPool2Events*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComObjectPool2Events*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_obj_pool_put_object2(this : IComObjectPool2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, nReason : Int32, dwAvailable : UInt32, oid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_put_object2.call(this, pInfo, guidObject, nReason, dwAvailable, oid)
    end
    def on_obj_pool_get_object2(this : IComObjectPool2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, guidObject : LibC::GUID*, dwAvailable : UInt32, oid : UInt64, guidPartition : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_get_object2.call(this, pInfo, guidActivity, guidObject, dwAvailable, oid, guidPartition)
    end
    def on_obj_pool_recycle_to_tx2(this : IComObjectPool2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, guidObject : LibC::GUID*, guidTx : LibC::GUID*, objid : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_recycle_to_tx2.call(this, pInfo, guidActivity, guidObject, guidTx, objid)
    end
    def on_obj_pool_get_from_tx2(this : IComObjectPool2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidActivity : LibC::GUID*, guidObject : LibC::GUID*, guidTx : LibC::GUID*, objid : UInt64, guidPartition : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_obj_pool_get_from_tx2.call(this, pInfo, guidActivity, guidObject, guidTx, objid, guidPartition)
    end

  end

  @[Extern]
  record IComObjectConstruction2EventsVtbl,
    query_interface : Proc(IComObjectConstruction2Events*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComObjectConstruction2Events*, UInt32),
    release : Proc(IComObjectConstruction2Events*, UInt32),
    on_object_construct2 : Proc(IComObjectConstruction2Events*, Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, LibC::GUID*, Win32cr::Foundation::PWSTR, UInt64, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4b5a7827-8df2-45c0-8f6f-57ea1f856a9f")]
  record IComObjectConstruction2Events, lpVtbl : IComObjectConstruction2EventsVtbl* do
    GUID = LibC::GUID.new(0x4b5a7827_u32, 0x8df2_u16, 0x45c0_u16, StaticArray[0x8f_u8, 0x6f_u8, 0x57_u8, 0xea_u8, 0x1f_u8, 0x85_u8, 0x6a_u8, 0x9f_u8])
    def query_interface(this : IComObjectConstruction2Events*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComObjectConstruction2Events*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComObjectConstruction2Events*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_object_construct2(this : IComObjectConstruction2Events*, pInfo : Win32cr::System::ComponentServices::COMSVCSEVENTINFO*, guidObject : LibC::GUID*, sConstructString : Win32cr::Foundation::PWSTR, oid : UInt64, guidPartition : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_object_construct2.call(this, pInfo, guidObject, sConstructString, oid, guidPartition)
    end

  end

  @[Extern]
  record ISystemAppEventDataVtbl,
    query_interface : Proc(ISystemAppEventData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemAppEventData*, UInt32),
    release : Proc(ISystemAppEventData*, UInt32),
    startup : Proc(ISystemAppEventData*, Win32cr::Foundation::HRESULT),
    on_data_changed : Proc(ISystemAppEventData*, UInt32, UInt32, UInt32, Win32cr::Foundation::BSTR, UInt32, UInt64, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d6d48a3c-d5c5-49e7-8c74-99e4889ed52f")]
  record ISystemAppEventData, lpVtbl : ISystemAppEventDataVtbl* do
    GUID = LibC::GUID.new(0xd6d48a3c_u32, 0xd5c5_u16, 0x49e7_u16, StaticArray[0x8c_u8, 0x74_u8, 0x99_u8, 0xe4_u8, 0x88_u8, 0x9e_u8, 0xd5_u8, 0x2f_u8])
    def query_interface(this : ISystemAppEventData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemAppEventData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemAppEventData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def startup(this : ISystemAppEventData*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.startup.call(this)
    end
    def on_data_changed(this : ISystemAppEventData*, dwPID : UInt32, dwMask : UInt32, dwNumberSinks : UInt32, bstrDwMethodMask : Win32cr::Foundation::BSTR, dwReason : UInt32, u64TraceHandle : UInt64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_data_changed.call(this, dwPID, dwMask, dwNumberSinks, bstrDwMethodMask, dwReason, u64TraceHandle)
    end

  end

  @[Extern]
  record IMtsEventsVtbl,
    query_interface : Proc(IMtsEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMtsEvents*, UInt32),
    release : Proc(IMtsEvents*, UInt32),
    get_type_info_count : Proc(IMtsEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMtsEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMtsEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMtsEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PackageName : Proc(IMtsEvents*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PackageGuid : Proc(IMtsEvents*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    post_event : Proc(IMtsEvents*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_FireEvents : Proc(IMtsEvents*, Int16*, Win32cr::Foundation::HRESULT),
    get_process_id : Proc(IMtsEvents*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bacedf4d-74ab-11d0-b162-00aa00ba3258")]
  record IMtsEvents, lpVtbl : IMtsEventsVtbl* do
    GUID = LibC::GUID.new(0xbacedf4d_u32, 0x74ab_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x62_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IMtsEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMtsEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMtsEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMtsEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMtsEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMtsEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMtsEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_PackageName(this : IMtsEvents*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PackageName.call(this, pVal)
    end
    def get_PackageGuid(this : IMtsEvents*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PackageGuid.call(this, pVal)
    end
    def post_event(this : IMtsEvents*, vEvent : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_event.call(this, vEvent)
    end
    def get_FireEvents(this : IMtsEvents*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FireEvents.call(this, pVal)
    end
    def get_process_id(this : IMtsEvents*, id : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_process_id.call(this, id)
    end

  end

  @[Extern]
  record IMtsEventInfoVtbl,
    query_interface : Proc(IMtsEventInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMtsEventInfo*, UInt32),
    release : Proc(IMtsEventInfo*, UInt32),
    get_type_info_count : Proc(IMtsEventInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMtsEventInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMtsEventInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMtsEventInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Names : Proc(IMtsEventInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IMtsEventInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EventID : Proc(IMtsEventInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IMtsEventInfo*, Int32*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IMtsEventInfo*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d56c3dc1-8482-11d0-b170-00aa00ba3258")]
  record IMtsEventInfo, lpVtbl : IMtsEventInfoVtbl* do
    GUID = LibC::GUID.new(0xd56c3dc1_u32, 0x8482_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x70_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IMtsEventInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMtsEventInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMtsEventInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMtsEventInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMtsEventInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMtsEventInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMtsEventInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Names(this : IMtsEventInfo*, pUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Names.call(this, pUnk)
    end
    def get_DisplayName(this : IMtsEventInfo*, sDisplayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, sDisplayName)
    end
    def get_EventID(this : IMtsEventInfo*, sGuidEventID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventID.call(this, sGuidEventID)
    end
    def get_Count(this : IMtsEventInfo*, lCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, lCount)
    end
    def get_Value(this : IMtsEventInfo*, sKey : Win32cr::Foundation::BSTR, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, sKey, pVal)
    end

  end

  @[Extern]
  record IMTSLocatorVtbl,
    query_interface : Proc(IMTSLocator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMTSLocator*, UInt32),
    release : Proc(IMTSLocator*, UInt32),
    get_type_info_count : Proc(IMTSLocator*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMTSLocator*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMTSLocator*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMTSLocator*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_event_dispatcher : Proc(IMTSLocator*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d19b8bfd-7f88-11d0-b16e-00aa00ba3258")]
  record IMTSLocator, lpVtbl : IMTSLocatorVtbl* do
    GUID = LibC::GUID.new(0xd19b8bfd_u32, 0x7f88_u16, 0x11d0_u16, StaticArray[0xb1_u8, 0x6e_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IMTSLocator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMTSLocator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMTSLocator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMTSLocator*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMTSLocator*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMTSLocator*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMTSLocator*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_event_dispatcher(this : IMTSLocator*, pUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_event_dispatcher.call(this, pUnk)
    end

  end

  @[Extern]
  record IMtsGrpVtbl,
    query_interface : Proc(IMtsGrp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMtsGrp*, UInt32),
    release : Proc(IMtsGrp*, UInt32),
    get_type_info_count : Proc(IMtsGrp*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMtsGrp*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMtsGrp*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMtsGrp*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IMtsGrp*, Int32*, Win32cr::Foundation::HRESULT),
    item : Proc(IMtsGrp*, Int32, Void**, Win32cr::Foundation::HRESULT),
    refresh : Proc(IMtsGrp*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4b2e958c-0393-11d1-b1ab-00aa00ba3258")]
  record IMtsGrp, lpVtbl : IMtsGrpVtbl* do
    GUID = LibC::GUID.new(0x4b2e958c_u32, 0x393_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xab_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IMtsGrp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMtsGrp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMtsGrp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMtsGrp*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMtsGrp*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMtsGrp*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMtsGrp*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Count(this : IMtsGrp*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def item(this : IMtsGrp*, lIndex : Int32, ppUnkDispatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, lIndex, ppUnkDispatcher)
    end
    def refresh(this : IMtsGrp*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end

  end

  @[Extern]
  record IMessageMoverVtbl,
    query_interface : Proc(IMessageMover*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMessageMover*, UInt32),
    release : Proc(IMessageMover*, UInt32),
    get_type_info_count : Proc(IMessageMover*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IMessageMover*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IMessageMover*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IMessageMover*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SourcePath : Proc(IMessageMover*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SourcePath : Proc(IMessageMover*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DestPath : Proc(IMessageMover*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DestPath : Proc(IMessageMover*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CommitBatchSize : Proc(IMessageMover*, Int32*, Win32cr::Foundation::HRESULT),
    put_CommitBatchSize : Proc(IMessageMover*, Int32, Win32cr::Foundation::HRESULT),
    move_messages : Proc(IMessageMover*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("588a085a-b795-11d1-8054-00c04fc340ee")]
  record IMessageMover, lpVtbl : IMessageMoverVtbl* do
    GUID = LibC::GUID.new(0x588a085a_u32, 0xb795_u16, 0x11d1_u16, StaticArray[0x80_u8, 0x54_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x40_u8, 0xee_u8])
    def query_interface(this : IMessageMover*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMessageMover*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMessageMover*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IMessageMover*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IMessageMover*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IMessageMover*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IMessageMover*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SourcePath(this : IMessageMover*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourcePath.call(this, pVal)
    end
    def put_SourcePath(this : IMessageMover*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SourcePath.call(this, newVal)
    end
    def get_DestPath(this : IMessageMover*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DestPath.call(this, pVal)
    end
    def put_DestPath(this : IMessageMover*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DestPath.call(this, newVal)
    end
    def get_CommitBatchSize(this : IMessageMover*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CommitBatchSize.call(this, pVal)
    end
    def put_CommitBatchSize(this : IMessageMover*, newVal : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CommitBatchSize.call(this, newVal)
    end
    def move_messages(this : IMessageMover*, plMessagesMoved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_messages.call(this, plMessagesMoved)
    end

  end

  @[Extern]
  record IEventServerTraceVtbl,
    query_interface : Proc(IEventServerTrace*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventServerTrace*, UInt32),
    release : Proc(IEventServerTrace*, UInt32),
    get_type_info_count : Proc(IEventServerTrace*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventServerTrace*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventServerTrace*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventServerTrace*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    start_trace_guid : Proc(IEventServerTrace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    stop_trace_guid : Proc(IEventServerTrace*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    enum_trace_guid : Proc(IEventServerTrace*, Int32*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9a9f12b8-80af-47ab-a579-35ea57725370")]
  record IEventServerTrace, lpVtbl : IEventServerTraceVtbl* do
    GUID = LibC::GUID.new(0x9a9f12b8_u32, 0x80af_u16, 0x47ab_u16, StaticArray[0xa5_u8, 0x79_u8, 0x35_u8, 0xea_u8, 0x57_u8, 0x72_u8, 0x53_u8, 0x70_u8])
    def query_interface(this : IEventServerTrace*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventServerTrace*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventServerTrace*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventServerTrace*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventServerTrace*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventServerTrace*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventServerTrace*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def start_trace_guid(this : IEventServerTrace*, bstrguidEvent : Win32cr::Foundation::BSTR, bstrguidFilter : Win32cr::Foundation::BSTR, lPidFilter : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_trace_guid.call(this, bstrguidEvent, bstrguidFilter, lPidFilter)
    end
    def stop_trace_guid(this : IEventServerTrace*, bstrguidEvent : Win32cr::Foundation::BSTR, bstrguidFilter : Win32cr::Foundation::BSTR, lPidFilter : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_trace_guid.call(this, bstrguidEvent, bstrguidFilter, lPidFilter)
    end
    def enum_trace_guid(this : IEventServerTrace*, plCntGuids : Int32*, pbstrGuidList : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_trace_guid.call(this, plCntGuids, pbstrGuidList)
    end

  end

  @[Extern]
  record IGetAppTrackerDataVtbl,
    query_interface : Proc(IGetAppTrackerData*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetAppTrackerData*, UInt32),
    release : Proc(IGetAppTrackerData*, UInt32),
    get_application_processes : Proc(IGetAppTrackerData*, LibC::GUID*, LibC::GUID*, UInt32, UInt32*, Win32cr::System::ComponentServices::ApplicationProcessSummary**, Win32cr::Foundation::HRESULT),
    get_application_process_details : Proc(IGetAppTrackerData*, LibC::GUID*, UInt32, UInt32, Win32cr::System::ComponentServices::ApplicationProcessSummary*, Win32cr::System::ComponentServices::ApplicationProcessStatistics*, Win32cr::System::ComponentServices::ApplicationProcessRecycleInfo*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_applications_in_process : Proc(IGetAppTrackerData*, LibC::GUID*, UInt32, LibC::GUID*, UInt32, UInt32*, Win32cr::System::ComponentServices::ApplicationSummary**, Win32cr::Foundation::HRESULT),
    get_components_in_process : Proc(IGetAppTrackerData*, LibC::GUID*, UInt32, LibC::GUID*, LibC::GUID*, UInt32, UInt32*, Win32cr::System::ComponentServices::ComponentSummary**, Win32cr::Foundation::HRESULT),
    get_component_details : Proc(IGetAppTrackerData*, LibC::GUID*, UInt32, LibC::GUID*, UInt32, Win32cr::System::ComponentServices::ComponentSummary*, Win32cr::System::ComponentServices::ComponentStatistics*, Win32cr::System::ComponentServices::ComponentHangMonitorInfo*, Win32cr::Foundation::HRESULT),
    get_tracker_data_as_collection_object : Proc(IGetAppTrackerData*, Void**, Win32cr::Foundation::HRESULT),
    get_suggested_polling_interval : Proc(IGetAppTrackerData*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("507c3ac8-3e12-4cb0-9366-653d3e050638")]
  record IGetAppTrackerData, lpVtbl : IGetAppTrackerDataVtbl* do
    GUID = LibC::GUID.new(0x507c3ac8_u32, 0x3e12_u16, 0x4cb0_u16, StaticArray[0x93_u8, 0x66_u8, 0x65_u8, 0x3d_u8, 0x3e_u8, 0x5_u8, 0x6_u8, 0x38_u8])
    def query_interface(this : IGetAppTrackerData*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetAppTrackerData*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetAppTrackerData*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_application_processes(this : IGetAppTrackerData*, partition_id : LibC::GUID*, application_id : LibC::GUID*, flags : UInt32, num_application_processes : UInt32*, application_processes : Win32cr::System::ComponentServices::ApplicationProcessSummary**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_processes.call(this, partition_id, application_id, flags, num_application_processes, application_processes)
    end
    def get_application_process_details(this : IGetAppTrackerData*, application_instance_id : LibC::GUID*, process_id : UInt32, flags : UInt32, summary : Win32cr::System::ComponentServices::ApplicationProcessSummary*, statistics : Win32cr::System::ComponentServices::ApplicationProcessStatistics*, recycle_info : Win32cr::System::ComponentServices::ApplicationProcessRecycleInfo*, any_components_hang_monitored : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_process_details.call(this, application_instance_id, process_id, flags, summary, statistics, recycle_info, any_components_hang_monitored)
    end
    def get_applications_in_process(this : IGetAppTrackerData*, application_instance_id : LibC::GUID*, process_id : UInt32, partition_id : LibC::GUID*, flags : UInt32, num_applications_in_process : UInt32*, applications : Win32cr::System::ComponentServices::ApplicationSummary**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_applications_in_process.call(this, application_instance_id, process_id, partition_id, flags, num_applications_in_process, applications)
    end
    def get_components_in_process(this : IGetAppTrackerData*, application_instance_id : LibC::GUID*, process_id : UInt32, partition_id : LibC::GUID*, application_id : LibC::GUID*, flags : UInt32, num_components_in_process : UInt32*, components : Win32cr::System::ComponentServices::ComponentSummary**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_components_in_process.call(this, application_instance_id, process_id, partition_id, application_id, flags, num_components_in_process, components)
    end
    def get_component_details(this : IGetAppTrackerData*, application_instance_id : LibC::GUID*, process_id : UInt32, clsid : LibC::GUID*, flags : UInt32, summary : Win32cr::System::ComponentServices::ComponentSummary*, statistics : Win32cr::System::ComponentServices::ComponentStatistics*, hang_monitor_info : Win32cr::System::ComponentServices::ComponentHangMonitorInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_details.call(this, application_instance_id, process_id, clsid, flags, summary, statistics, hang_monitor_info)
    end
    def get_tracker_data_as_collection_object(this : IGetAppTrackerData*, top_level_collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tracker_data_as_collection_object.call(this, top_level_collection)
    end
    def get_suggested_polling_interval(this : IGetAppTrackerData*, polling_interval_in_seconds : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_suggested_polling_interval.call(this, polling_interval_in_seconds)
    end

  end

  @[Extern]
  record IDispenserManagerVtbl,
    query_interface : Proc(IDispenserManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDispenserManager*, UInt32),
    release : Proc(IDispenserManager*, UInt32),
    register_dispenser : Proc(IDispenserManager*, Void*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_context : Proc(IDispenserManager*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5cb31e10-2b5f-11cf-be10-00aa00a2fa25")]
  record IDispenserManager, lpVtbl : IDispenserManagerVtbl* do
    GUID = LibC::GUID.new(0x5cb31e10_u32, 0x2b5f_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IDispenserManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDispenserManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDispenserManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_dispenser(this : IDispenserManager*, __midl__i_dispenser_manager0000 : Void*, szDispenserName : Win32cr::Foundation::PWSTR, __midl__i_dispenser_manager0001 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_dispenser.call(this, __midl__i_dispenser_manager0000, szDispenserName, __midl__i_dispenser_manager0001)
    end
    def get_context(this : IDispenserManager*, __midl__i_dispenser_manager0002 : LibC::UIntPtrT*, __midl__i_dispenser_manager0003 : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, __midl__i_dispenser_manager0002, __midl__i_dispenser_manager0003)
    end

  end

  @[Extern]
  record IHolderVtbl,
    query_interface : Proc(IHolder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IHolder*, UInt32),
    release : Proc(IHolder*, UInt32),
    alloc_resource : Proc(IHolder*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    free_resource : Proc(IHolder*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    track_resource : Proc(IHolder*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    track_resource_s : Proc(IHolder*, UInt16*, Win32cr::Foundation::HRESULT),
    untrack_resource : Proc(IHolder*, LibC::UIntPtrT, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    untrack_resource_s : Proc(IHolder*, UInt16*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    close : Proc(IHolder*, Win32cr::Foundation::HRESULT),
    request_destroy_resource : Proc(IHolder*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bf6a1850-2b45-11cf-be10-00aa00a2fa25")]
  record IHolder, lpVtbl : IHolderVtbl* do
    GUID = LibC::GUID.new(0xbf6a1850_u32, 0x2b45_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IHolder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IHolder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IHolder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def alloc_resource(this : IHolder*, __midl__i_holder0000 : LibC::UIntPtrT, __midl__i_holder0001 : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.alloc_resource.call(this, __midl__i_holder0000, __midl__i_holder0001)
    end
    def free_resource(this : IHolder*, __midl__i_holder0002 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.free_resource.call(this, __midl__i_holder0002)
    end
    def track_resource(this : IHolder*, __midl__i_holder0003 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.track_resource.call(this, __midl__i_holder0003)
    end
    def track_resource_s(this : IHolder*, __midl__i_holder0004 : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.track_resource_s.call(this, __midl__i_holder0004)
    end
    def untrack_resource(this : IHolder*, __midl__i_holder0005 : LibC::UIntPtrT, __midl__i_holder0006 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.untrack_resource.call(this, __midl__i_holder0005, __midl__i_holder0006)
    end
    def untrack_resource_s(this : IHolder*, __midl__i_holder0007 : UInt16*, __midl__i_holder0008 : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.untrack_resource_s.call(this, __midl__i_holder0007, __midl__i_holder0008)
    end
    def close(this : IHolder*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def request_destroy_resource(this : IHolder*, __midl__i_holder0009 : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_destroy_resource.call(this, __midl__i_holder0009)
    end

  end

  @[Extern]
  record IDispenserDriverVtbl,
    query_interface : Proc(IDispenserDriver*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDispenserDriver*, UInt32),
    release : Proc(IDispenserDriver*, UInt32),
    create_resource : Proc(IDispenserDriver*, LibC::UIntPtrT, LibC::UIntPtrT*, Int32*, Win32cr::Foundation::HRESULT),
    rate_resource : Proc(IDispenserDriver*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL, UInt32*, Win32cr::Foundation::HRESULT),
    enlist_resource : Proc(IDispenserDriver*, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    reset_resource : Proc(IDispenserDriver*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    destroy_resource : Proc(IDispenserDriver*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT),
    destroy_resource_s : Proc(IDispenserDriver*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("208b3651-2b48-11cf-be10-00aa00a2fa25")]
  record IDispenserDriver, lpVtbl : IDispenserDriverVtbl* do
    GUID = LibC::GUID.new(0x208b3651_u32, 0x2b48_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x10_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IDispenserDriver*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDispenserDriver*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDispenserDriver*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_resource(this : IDispenserDriver*, res_typ_id : LibC::UIntPtrT, pResId : LibC::UIntPtrT*, pSecsFreeBeforeDestroy : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_resource.call(this, res_typ_id, pResId, pSecsFreeBeforeDestroy)
    end
    def rate_resource(this : IDispenserDriver*, res_typ_id : LibC::UIntPtrT, res_id : LibC::UIntPtrT, fRequiresTransactionEnlistment : Win32cr::Foundation::BOOL, pRating : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rate_resource.call(this, res_typ_id, res_id, fRequiresTransactionEnlistment, pRating)
    end
    def enlist_resource(this : IDispenserDriver*, res_id : LibC::UIntPtrT, trans_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enlist_resource.call(this, res_id, trans_id)
    end
    def reset_resource(this : IDispenserDriver*, res_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_resource.call(this, res_id)
    end
    def destroy_resource(this : IDispenserDriver*, res_id : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_resource.call(this, res_id)
    end
    def destroy_resource_s(this : IDispenserDriver*, res_id : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_resource_s.call(this, res_id)
    end

  end

  @[Extern]
  record ITransactionProxyVtbl,
    query_interface : Proc(ITransactionProxy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionProxy*, UInt32),
    release : Proc(ITransactionProxy*, UInt32),
    commit : Proc(ITransactionProxy*, LibC::GUID, Win32cr::Foundation::HRESULT),
    abort : Proc(ITransactionProxy*, Win32cr::Foundation::HRESULT),
    promote : Proc(ITransactionProxy*, Void**, Win32cr::Foundation::HRESULT),
    create_voter : Proc(ITransactionProxy*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_isolation_level : Proc(ITransactionProxy*, Int32*, Win32cr::Foundation::HRESULT),
    get_identifier : Proc(ITransactionProxy*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_reusable : Proc(ITransactionProxy*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("02558374-df2e-4dae-bd6b-1d5c994f9bdc")]
  record ITransactionProxy, lpVtbl : ITransactionProxyVtbl* do
    GUID = LibC::GUID.new(0x2558374_u32, 0xdf2e_u16, 0x4dae_u16, StaticArray[0xbd_u8, 0x6b_u8, 0x1d_u8, 0x5c_u8, 0x99_u8, 0x4f_u8, 0x9b_u8, 0xdc_u8])
    def query_interface(this : ITransactionProxy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionProxy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionProxy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : ITransactionProxy*, guid : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, guid)
    end
    def abort(this : ITransactionProxy*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end
    def promote(this : ITransactionProxy*, pTransaction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.promote.call(this, pTransaction)
    end
    def create_voter(this : ITransactionProxy*, pTxAsync : Void*, ppBallot : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_voter.call(this, pTxAsync, ppBallot)
    end
    def get_isolation_level(this : ITransactionProxy*, __midl__i_transaction_proxy0000 : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_isolation_level.call(this, __midl__i_transaction_proxy0000)
    end
    def get_identifier(this : ITransactionProxy*, pbstrIdentifier : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_identifier.call(this, pbstrIdentifier)
    end
    def is_reusable(this : ITransactionProxy*, pfIsReusable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_reusable.call(this, pfIsReusable)
    end

  end

  @[Extern]
  record IContextSecurityPerimeterVtbl,
    query_interface : Proc(IContextSecurityPerimeter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextSecurityPerimeter*, UInt32),
    release : Proc(IContextSecurityPerimeter*, UInt32),
    get_perimeter_flag : Proc(IContextSecurityPerimeter*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_perimeter_flag : Proc(IContextSecurityPerimeter*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a7549a29-a7c4-42e1-8dc1-7e3d748dc24a")]
  record IContextSecurityPerimeter, lpVtbl : IContextSecurityPerimeterVtbl* do
    GUID = LibC::GUID.new(0xa7549a29_u32, 0xa7c4_u16, 0x42e1_u16, StaticArray[0x8d_u8, 0xc1_u8, 0x7e_u8, 0x3d_u8, 0x74_u8, 0x8d_u8, 0xc2_u8, 0x4a_u8])
    def query_interface(this : IContextSecurityPerimeter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextSecurityPerimeter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextSecurityPerimeter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_perimeter_flag(this : IContextSecurityPerimeter*, pFlag : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_perimeter_flag.call(this, pFlag)
    end
    def set_perimeter_flag(this : IContextSecurityPerimeter*, fFlag : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_perimeter_flag.call(this, fFlag)
    end

  end

  @[Extern]
  record ITxProxyHolderVtbl,
    query_interface : Proc(ITxProxyHolder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITxProxyHolder*, UInt32),
    release : Proc(ITxProxyHolder*, UInt32),
    get_identifier : Proc(ITxProxyHolder*, LibC::GUID*, Void)


  @[Extern]
  #@[Com("13d86f31-0139-41af-bcad-c7d50435fe9f")]
  record ITxProxyHolder, lpVtbl : ITxProxyHolderVtbl* do
    GUID = LibC::GUID.new(0x13d86f31_u32, 0x139_u16, 0x41af_u16, StaticArray[0xbc_u8, 0xad_u8, 0xc7_u8, 0xd5_u8, 0x4_u8, 0x35_u8, 0xfe_u8, 0x9f_u8])
    def query_interface(this : ITxProxyHolder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITxProxyHolder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITxProxyHolder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_identifier(this : ITxProxyHolder*, pGuidLtx : LibC::GUID*) : Void
      @lpVtbl.try &.value.get_identifier.call(this, pGuidLtx)
    end

  end

  @[Extern]
  record IObjectContextVtbl,
    query_interface : Proc(IObjectContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectContext*, UInt32),
    release : Proc(IObjectContext*, UInt32),
    create_instance : Proc(IObjectContext*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    set_complete : Proc(IObjectContext*, Win32cr::Foundation::HRESULT),
    set_abort : Proc(IObjectContext*, Win32cr::Foundation::HRESULT),
    enable_commit : Proc(IObjectContext*, Win32cr::Foundation::HRESULT),
    disable_commit : Proc(IObjectContext*, Win32cr::Foundation::HRESULT),
    is_in_transaction : Proc(IObjectContext*, Win32cr::Foundation::BOOL),
    is_security_enabled : Proc(IObjectContext*, Win32cr::Foundation::BOOL),
    is_caller_in_role : Proc(IObjectContext*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372ae0-cae7-11cf-be81-00aa00a2fa25")]
  record IObjectContext, lpVtbl : IObjectContextVtbl* do
    GUID = LibC::GUID.new(0x51372ae0_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IObjectContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_instance(this : IObjectContext*, rclsid : LibC::GUID*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_instance.call(this, rclsid, riid, ppv)
    end
    def set_complete(this : IObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_complete.call(this)
    end
    def set_abort(this : IObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_abort.call(this)
    end
    def enable_commit(this : IObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_commit.call(this)
    end
    def disable_commit(this : IObjectContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_commit.call(this)
    end
    def is_in_transaction(this : IObjectContext*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_in_transaction.call(this)
    end
    def is_security_enabled(this : IObjectContext*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_security_enabled.call(this)
    end
    def is_caller_in_role(this : IObjectContext*, bstrRole : Win32cr::Foundation::BSTR, pfIsInRole : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_caller_in_role.call(this, bstrRole, pfIsInRole)
    end

  end

  @[Extern]
  record IObjectControlVtbl,
    query_interface : Proc(IObjectControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectControl*, UInt32),
    release : Proc(IObjectControl*, UInt32),
    activate : Proc(IObjectControl*, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IObjectControl*, Void),
    can_be_pooled : Proc(IObjectControl*, Win32cr::Foundation::BOOL)


  @[Extern]
  #@[Com("51372aec-cae7-11cf-be81-00aa00a2fa25")]
  record IObjectControl, lpVtbl : IObjectControlVtbl* do
    GUID = LibC::GUID.new(0x51372aec_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IObjectControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : IObjectControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this)
    end
    def deactivate(this : IObjectControl*) : Void
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def can_be_pooled(this : IObjectControl*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.can_be_pooled.call(this)
    end

  end

  @[Extern]
  record IEnumNamesVtbl,
    query_interface : Proc(IEnumNames*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumNames*, UInt32),
    release : Proc(IEnumNames*, UInt32),
    next__ : Proc(IEnumNames*, UInt32, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumNames*, UInt32, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumNames*, Win32cr::Foundation::HRESULT),
    clone : Proc(IEnumNames*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372af2-cae7-11cf-be81-00aa00a2fa25")]
  record IEnumNames, lpVtbl : IEnumNamesVtbl* do
    GUID = LibC::GUID.new(0x51372af2_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IEnumNames*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumNames*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumNames*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def next__(this : IEnumNames*, celt : UInt32, rgname : Win32cr::Foundation::BSTR*, pceltFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, celt, rgname, pceltFetched)
    end
    def skip(this : IEnumNames*, celt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, celt)
    end
    def reset(this : IEnumNames*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def clone(this : IEnumNames*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppenum)
    end

  end

  @[Extern]
  record ISecurityPropertyVtbl,
    query_interface : Proc(ISecurityProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityProperty*, UInt32),
    release : Proc(ISecurityProperty*, UInt32),
    get_direct_creator_sid : Proc(ISecurityProperty*, Win32cr::Foundation::PSID*, Win32cr::Foundation::HRESULT),
    get_original_creator_sid : Proc(ISecurityProperty*, Win32cr::Foundation::PSID*, Win32cr::Foundation::HRESULT),
    get_direct_caller_sid : Proc(ISecurityProperty*, Win32cr::Foundation::PSID*, Win32cr::Foundation::HRESULT),
    get_original_caller_sid : Proc(ISecurityProperty*, Win32cr::Foundation::PSID*, Win32cr::Foundation::HRESULT),
    release_sid : Proc(ISecurityProperty*, Win32cr::Foundation::PSID, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372aea-cae7-11cf-be81-00aa00a2fa25")]
  record ISecurityProperty, lpVtbl : ISecurityPropertyVtbl* do
    GUID = LibC::GUID.new(0x51372aea_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : ISecurityProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_direct_creator_sid(this : ISecurityProperty*, pSID : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_direct_creator_sid.call(this, pSID)
    end
    def get_original_creator_sid(this : ISecurityProperty*, pSID : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_original_creator_sid.call(this, pSID)
    end
    def get_direct_caller_sid(this : ISecurityProperty*, pSID : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_direct_caller_sid.call(this, pSID)
    end
    def get_original_caller_sid(this : ISecurityProperty*, pSID : Win32cr::Foundation::PSID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_original_caller_sid.call(this, pSID)
    end
    def release_sid(this : ISecurityProperty*, pSID : Win32cr::Foundation::PSID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_sid.call(this, pSID)
    end

  end

  @[Extern]
  record ObjectControlVtbl,
    query_interface : Proc(ObjectControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ObjectControl*, UInt32),
    release : Proc(ObjectControl*, UInt32),
    activate : Proc(ObjectControl*, Win32cr::Foundation::HRESULT),
    deactivate : Proc(ObjectControl*, Win32cr::Foundation::HRESULT),
    can_be_pooled : Proc(ObjectControl*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7dc41850-0c31-11d0-8b79-00aa00b8a790")]
  record ObjectControl, lpVtbl : ObjectControlVtbl* do
    GUID = LibC::GUID.new(0x7dc41850_u32, 0xc31_u16, 0x11d0_u16, StaticArray[0x8b_u8, 0x79_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xb8_u8, 0xa7_u8, 0x90_u8])
    def query_interface(this : ObjectControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ObjectControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ObjectControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : ObjectControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this)
    end
    def deactivate(this : ObjectControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def can_be_pooled(this : ObjectControl*, pbPoolable : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.can_be_pooled.call(this, pbPoolable)
    end

  end

  @[Extern]
  record ISharedPropertyVtbl,
    query_interface : Proc(ISharedProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISharedProperty*, UInt32),
    release : Proc(ISharedProperty*, UInt32),
    get_type_info_count : Proc(ISharedProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISharedProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISharedProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISharedProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ISharedProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(ISharedProperty*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2a005c01-a5de-11cf-9e66-00aa00a3f464")]
  record ISharedProperty, lpVtbl : ISharedPropertyVtbl* do
    GUID = LibC::GUID.new(0x2a005c01_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
    def query_interface(this : ISharedProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISharedProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISharedProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISharedProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISharedProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISharedProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISharedProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Value(this : ISharedProperty*, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pVal)
    end
    def put_Value(this : ISharedProperty*, val : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, val)
    end

  end

  @[Extern]
  record ISharedPropertyGroupVtbl,
    query_interface : Proc(ISharedPropertyGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISharedPropertyGroup*, UInt32),
    release : Proc(ISharedPropertyGroup*, UInt32),
    get_type_info_count : Proc(ISharedPropertyGroup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISharedPropertyGroup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISharedPropertyGroup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISharedPropertyGroup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_property_by_position : Proc(ISharedPropertyGroup*, Int32, Int16*, Void**, Win32cr::Foundation::HRESULT),
    get_PropertyByPosition : Proc(ISharedPropertyGroup*, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_property : Proc(ISharedPropertyGroup*, Win32cr::Foundation::BSTR, Int16*, Void**, Win32cr::Foundation::HRESULT),
    get_Property : Proc(ISharedPropertyGroup*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2a005c07-a5de-11cf-9e66-00aa00a3f464")]
  record ISharedPropertyGroup, lpVtbl : ISharedPropertyGroupVtbl* do
    GUID = LibC::GUID.new(0x2a005c07_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
    def query_interface(this : ISharedPropertyGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISharedPropertyGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISharedPropertyGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISharedPropertyGroup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISharedPropertyGroup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISharedPropertyGroup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISharedPropertyGroup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_property_by_position(this : ISharedPropertyGroup*, index : Int32, fExists : Int16*, ppProp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_by_position.call(this, index, fExists, ppProp)
    end
    def get_PropertyByPosition(this : ISharedPropertyGroup*, index : Int32, ppProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyByPosition.call(this, index, ppProperty)
    end
    def create_property(this : ISharedPropertyGroup*, name : Win32cr::Foundation::BSTR, fExists : Int16*, ppProp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property.call(this, name, fExists, ppProp)
    end
    def get_Property(this : ISharedPropertyGroup*, name : Win32cr::Foundation::BSTR, ppProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Property.call(this, name, ppProperty)
    end

  end

  @[Extern]
  record ISharedPropertyGroupManagerVtbl,
    query_interface : Proc(ISharedPropertyGroupManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISharedPropertyGroupManager*, UInt32),
    release : Proc(ISharedPropertyGroupManager*, UInt32),
    get_type_info_count : Proc(ISharedPropertyGroupManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISharedPropertyGroupManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISharedPropertyGroupManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISharedPropertyGroupManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_property_group : Proc(ISharedPropertyGroupManager*, Win32cr::Foundation::BSTR, Int32*, Int32*, Int16*, Void**, Win32cr::Foundation::HRESULT),
    get_Group : Proc(ISharedPropertyGroupManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ISharedPropertyGroupManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2a005c0d-a5de-11cf-9e66-00aa00a3f464")]
  record ISharedPropertyGroupManager, lpVtbl : ISharedPropertyGroupManagerVtbl* do
    GUID = LibC::GUID.new(0x2a005c0d_u32, 0xa5de_u16, 0x11cf_u16, StaticArray[0x9e_u8, 0x66_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa3_u8, 0xf4_u8, 0x64_u8])
    def query_interface(this : ISharedPropertyGroupManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISharedPropertyGroupManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISharedPropertyGroupManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISharedPropertyGroupManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISharedPropertyGroupManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISharedPropertyGroupManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISharedPropertyGroupManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_property_group(this : ISharedPropertyGroupManager*, name : Win32cr::Foundation::BSTR, dwIsoMode : Int32*, dwRelMode : Int32*, fExists : Int16*, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_group.call(this, name, dwIsoMode, dwRelMode, fExists, ppGroup)
    end
    def get_Group(this : ISharedPropertyGroupManager*, name : Win32cr::Foundation::BSTR, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Group.call(this, name, ppGroup)
    end
    def get__NewEnum(this : ISharedPropertyGroupManager*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end

  end

  @[Extern]
  record IObjectConstructVtbl,
    query_interface : Proc(IObjectConstruct*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectConstruct*, UInt32),
    release : Proc(IObjectConstruct*, UInt32),
    construct : Proc(IObjectConstruct*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("41c4f8b3-7439-11d2-98cb-00c04f8ee1c4")]
  record IObjectConstruct, lpVtbl : IObjectConstructVtbl* do
    GUID = LibC::GUID.new(0x41c4f8b3_u32, 0x7439_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IObjectConstruct*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectConstruct*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectConstruct*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def construct(this : IObjectConstruct*, pCtorObj : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.construct.call(this, pCtorObj)
    end

  end

  @[Extern]
  record IObjectConstructStringVtbl,
    query_interface : Proc(IObjectConstructString*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectConstructString*, UInt32),
    release : Proc(IObjectConstructString*, UInt32),
    get_type_info_count : Proc(IObjectConstructString*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IObjectConstructString*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IObjectConstructString*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IObjectConstructString*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ConstructString : Proc(IObjectConstructString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("41c4f8b2-7439-11d2-98cb-00c04f8ee1c4")]
  record IObjectConstructString, lpVtbl : IObjectConstructStringVtbl* do
    GUID = LibC::GUID.new(0x41c4f8b2_u32, 0x7439_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xcb_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IObjectConstructString*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectConstructString*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectConstructString*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IObjectConstructString*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IObjectConstructString*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IObjectConstructString*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IObjectConstructString*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ConstructString(this : IObjectConstructString*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConstructString.call(this, pVal)
    end

  end

  @[Extern]
  record IObjectContextActivityVtbl,
    query_interface : Proc(IObjectContextActivity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectContextActivity*, UInt32),
    release : Proc(IObjectContextActivity*, UInt32),
    get_activity_id : Proc(IObjectContextActivity*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372afc-cae7-11cf-be81-00aa00a2fa25")]
  record IObjectContextActivity, lpVtbl : IObjectContextActivityVtbl* do
    GUID = LibC::GUID.new(0x51372afc_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IObjectContextActivity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectContextActivity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectContextActivity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_activity_id(this : IObjectContextActivity*, pGUID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_id.call(this, pGUID)
    end

  end

  @[Extern]
  record IObjectContextInfoVtbl,
    query_interface : Proc(IObjectContextInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectContextInfo*, UInt32),
    release : Proc(IObjectContextInfo*, UInt32),
    is_in_transaction : Proc(IObjectContextInfo*, Win32cr::Foundation::BOOL),
    get_transaction : Proc(IObjectContextInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_transaction_id : Proc(IObjectContextInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_activity_id : Proc(IObjectContextInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_context_id : Proc(IObjectContextInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("75b52ddb-e8ed-11d1-93ad-00aa00ba3258")]
  record IObjectContextInfo, lpVtbl : IObjectContextInfoVtbl* do
    GUID = LibC::GUID.new(0x75b52ddb_u32, 0xe8ed_u16, 0x11d1_u16, StaticArray[0x93_u8, 0xad_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IObjectContextInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectContextInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectContextInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_in_transaction(this : IObjectContextInfo*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_in_transaction.call(this)
    end
    def get_transaction(this : IObjectContextInfo*, pptrans : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction.call(this, pptrans)
    end
    def get_transaction_id(this : IObjectContextInfo*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_id.call(this, pGuid)
    end
    def get_activity_id(this : IObjectContextInfo*, pGUID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_id.call(this, pGUID)
    end
    def get_context_id(this : IObjectContextInfo*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_id.call(this, pGuid)
    end

  end

  @[Extern]
  record IObjectContextInfo2Vtbl,
    query_interface : Proc(IObjectContextInfo2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectContextInfo2*, UInt32),
    release : Proc(IObjectContextInfo2*, UInt32),
    is_in_transaction : Proc(IObjectContextInfo2*, Win32cr::Foundation::BOOL),
    get_transaction : Proc(IObjectContextInfo2*, Void**, Win32cr::Foundation::HRESULT),
    get_transaction_id : Proc(IObjectContextInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_activity_id : Proc(IObjectContextInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_context_id : Proc(IObjectContextInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_partition_id : Proc(IObjectContextInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_application_id : Proc(IObjectContextInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_application_instance_id : Proc(IObjectContextInfo2*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("594be71a-4bc4-438b-9197-cfd176248b09")]
  record IObjectContextInfo2, lpVtbl : IObjectContextInfo2Vtbl* do
    GUID = LibC::GUID.new(0x594be71a_u32, 0x4bc4_u16, 0x438b_u16, StaticArray[0x91_u8, 0x97_u8, 0xcf_u8, 0xd1_u8, 0x76_u8, 0x24_u8, 0x8b_u8, 0x9_u8])
    def query_interface(this : IObjectContextInfo2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectContextInfo2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectContextInfo2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_in_transaction(this : IObjectContextInfo2*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_in_transaction.call(this)
    end
    def get_transaction(this : IObjectContextInfo2*, pptrans : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction.call(this, pptrans)
    end
    def get_transaction_id(this : IObjectContextInfo2*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_id.call(this, pGuid)
    end
    def get_activity_id(this : IObjectContextInfo2*, pGUID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_id.call(this, pGUID)
    end
    def get_context_id(this : IObjectContextInfo2*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context_id.call(this, pGuid)
    end
    def get_partition_id(this : IObjectContextInfo2*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_partition_id.call(this, pGuid)
    end
    def get_application_id(this : IObjectContextInfo2*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_id.call(this, pGuid)
    end
    def get_application_instance_id(this : IObjectContextInfo2*, pGuid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_application_instance_id.call(this, pGuid)
    end

  end

  @[Extern]
  record ITransactionStatusVtbl,
    query_interface : Proc(ITransactionStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionStatus*, UInt32),
    release : Proc(ITransactionStatus*, UInt32),
    set_transaction_status : Proc(ITransactionStatus*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT),
    get_transaction_status : Proc(ITransactionStatus*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("61f589e8-3724-4898-a0a4-664ae9e1d1b4")]
  record ITransactionStatus, lpVtbl : ITransactionStatusVtbl* do
    GUID = LibC::GUID.new(0x61f589e8_u32, 0x3724_u16, 0x4898_u16, StaticArray[0xa0_u8, 0xa4_u8, 0x66_u8, 0x4a_u8, 0xe9_u8, 0xe1_u8, 0xd1_u8, 0xb4_u8])
    def query_interface(this : ITransactionStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_transaction_status(this : ITransactionStatus*, hrStatus : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transaction_status.call(this, hrStatus)
    end
    def get_transaction_status(this : ITransactionStatus*, pHrStatus : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_status.call(this, pHrStatus)
    end

  end

  @[Extern]
  record IObjectContextTipVtbl,
    query_interface : Proc(IObjectContextTip*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectContextTip*, UInt32),
    release : Proc(IObjectContextTip*, UInt32),
    get_tip_url : Proc(IObjectContextTip*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("92fd41ca-bad9-11d2-9a2d-00c04f797bc9")]
  record IObjectContextTip, lpVtbl : IObjectContextTipVtbl* do
    GUID = LibC::GUID.new(0x92fd41ca_u32, 0xbad9_u16, 0x11d2_u16, StaticArray[0x9a_u8, 0x2d_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x79_u8, 0x7b_u8, 0xc9_u8])
    def query_interface(this : IObjectContextTip*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectContextTip*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectContextTip*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_tip_url(this : IObjectContextTip*, pTipUrl : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tip_url.call(this, pTipUrl)
    end

  end

  @[Extern]
  record IPlaybackControlVtbl,
    query_interface : Proc(IPlaybackControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPlaybackControl*, UInt32),
    release : Proc(IPlaybackControl*, UInt32),
    final_client_retry : Proc(IPlaybackControl*, Win32cr::Foundation::HRESULT),
    final_server_retry : Proc(IPlaybackControl*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372afd-cae7-11cf-be81-00aa00a2fa25")]
  record IPlaybackControl, lpVtbl : IPlaybackControlVtbl* do
    GUID = LibC::GUID.new(0x51372afd_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IPlaybackControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPlaybackControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPlaybackControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def final_client_retry(this : IPlaybackControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.final_client_retry.call(this)
    end
    def final_server_retry(this : IPlaybackControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.final_server_retry.call(this)
    end

  end

  @[Extern]
  record IGetContextPropertiesVtbl,
    query_interface : Proc(IGetContextProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGetContextProperties*, UInt32),
    release : Proc(IGetContextProperties*, UInt32),
    count : Proc(IGetContextProperties*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IGetContextProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    enum_names : Proc(IGetContextProperties*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372af4-cae7-11cf-be81-00aa00a2fa25")]
  record IGetContextProperties, lpVtbl : IGetContextPropertiesVtbl* do
    GUID = LibC::GUID.new(0x51372af4_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IGetContextProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGetContextProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGetContextProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def count(this : IGetContextProperties*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count.call(this, plCount)
    end
    def get_property(this : IGetContextProperties*, name : Win32cr::Foundation::BSTR, pProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, name, pProperty)
    end
    def enum_names(this : IGetContextProperties*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_names.call(this, ppenum)
    end

  end

  @[Extern]
  record IContextStateVtbl,
    query_interface : Proc(IContextState*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextState*, UInt32),
    release : Proc(IContextState*, UInt32),
    set_deactivate_on_return : Proc(IContextState*, Int16, Win32cr::Foundation::HRESULT),
    get_deactivate_on_return : Proc(IContextState*, Int16*, Win32cr::Foundation::HRESULT),
    set_my_transaction_vote : Proc(IContextState*, Win32cr::System::ComponentServices::TransactionVote, Win32cr::Foundation::HRESULT),
    get_my_transaction_vote : Proc(IContextState*, Win32cr::System::ComponentServices::TransactionVote*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3c05e54b-a42a-11d2-afc4-00c04f8ee1c4")]
  record IContextState, lpVtbl : IContextStateVtbl* do
    GUID = LibC::GUID.new(0x3c05e54b_u32, 0xa42a_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IContextState*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextState*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextState*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_deactivate_on_return(this : IContextState*, bDeactivate : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_deactivate_on_return.call(this, bDeactivate)
    end
    def get_deactivate_on_return(this : IContextState*, pbDeactivate : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_deactivate_on_return.call(this, pbDeactivate)
    end
    def set_my_transaction_vote(this : IContextState*, txVote : Win32cr::System::ComponentServices::TransactionVote) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_my_transaction_vote.call(this, txVote)
    end
    def get_my_transaction_vote(this : IContextState*, ptxVote : Win32cr::System::ComponentServices::TransactionVote*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_my_transaction_vote.call(this, ptxVote)
    end

  end

  @[Extern]
  record IPoolManagerVtbl,
    query_interface : Proc(IPoolManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPoolManager*, UInt32),
    release : Proc(IPoolManager*, UInt32),
    get_type_info_count : Proc(IPoolManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPoolManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPoolManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPoolManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    shutdown_pool : Proc(IPoolManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0a469861-5a91-43a0-99b6-d5e179bb0631")]
  record IPoolManager, lpVtbl : IPoolManagerVtbl* do
    GUID = LibC::GUID.new(0xa469861_u32, 0x5a91_u16, 0x43a0_u16, StaticArray[0x99_u8, 0xb6_u8, 0xd5_u8, 0xe1_u8, 0x79_u8, 0xbb_u8, 0x6_u8, 0x31_u8])
    def query_interface(this : IPoolManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPoolManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPoolManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPoolManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPoolManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPoolManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPoolManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def shutdown_pool(this : IPoolManager*, clsid_or_prog_id : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_pool.call(this, clsid_or_prog_id)
    end

  end

  @[Extern]
  record ISelectCOMLBServerVtbl,
    query_interface : Proc(ISelectCOMLBServer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISelectCOMLBServer*, UInt32),
    release : Proc(ISelectCOMLBServer*, UInt32),
    init : Proc(ISelectCOMLBServer*, Win32cr::Foundation::HRESULT),
    get_lb_server : Proc(ISelectCOMLBServer*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcf443f4-3f8a-4872-b9f0-369a796d12d6")]
  record ISelectCOMLBServer, lpVtbl : ISelectCOMLBServerVtbl* do
    GUID = LibC::GUID.new(0xdcf443f4_u32, 0x3f8a_u16, 0x4872_u16, StaticArray[0xb9_u8, 0xf0_u8, 0x36_u8, 0x9a_u8, 0x79_u8, 0x6d_u8, 0x12_u8, 0xd6_u8])
    def query_interface(this : ISelectCOMLBServer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISelectCOMLBServer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISelectCOMLBServer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init(this : ISelectCOMLBServer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init.call(this)
    end
    def get_lb_server(this : ISelectCOMLBServer*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lb_server.call(this, pUnk)
    end

  end

  @[Extern]
  record ICOMLBArgumentsVtbl,
    query_interface : Proc(ICOMLBArguments*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICOMLBArguments*, UInt32),
    release : Proc(ICOMLBArguments*, UInt32),
    get_clsid : Proc(ICOMLBArguments*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_clsid : Proc(ICOMLBArguments*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_machine_name : Proc(ICOMLBArguments*, UInt32, UInt16*, Win32cr::Foundation::HRESULT),
    set_machine_name : Proc(ICOMLBArguments*, UInt32, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2")]
  record ICOMLBArguments, lpVtbl : ICOMLBArgumentsVtbl* do
    GUID = LibC::GUID.new(0x3a0f150f_u32, 0x8ee5_u16, 0x4b94_u16, StaticArray[0xb4_u8, 0xe_u8, 0xae_u8, 0xf2_u8, 0xf9_u8, 0xe4_u8, 0x2e_u8, 0xd2_u8])
    def query_interface(this : ICOMLBArguments*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICOMLBArguments*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICOMLBArguments*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_clsid(this : ICOMLBArguments*, pCLSID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsid.call(this, pCLSID)
    end
    def set_clsid(this : ICOMLBArguments*, pCLSID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clsid.call(this, pCLSID)
    end
    def get_machine_name(this : ICOMLBArguments*, cchSvr : UInt32, szServerName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_machine_name.call(this, cchSvr, szServerName)
    end
    def set_machine_name(this : ICOMLBArguments*, cchSvr : UInt32, szServerName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_machine_name.call(this, cchSvr, szServerName)
    end

  end

  @[Extern]
  record ICrmLogControlVtbl,
    query_interface : Proc(ICrmLogControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmLogControl*, UInt32),
    release : Proc(ICrmLogControl*, UInt32),
    get_TransactionUOW : Proc(ICrmLogControl*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_compensator : Proc(ICrmLogControl*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Int32, Win32cr::Foundation::HRESULT),
    write_log_record_variants : Proc(ICrmLogControl*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    force_log : Proc(ICrmLogControl*, Win32cr::Foundation::HRESULT),
    forget_log_record : Proc(ICrmLogControl*, Win32cr::Foundation::HRESULT),
    force_transaction_to_abort : Proc(ICrmLogControl*, Win32cr::Foundation::HRESULT),
    write_log_record : Proc(ICrmLogControl*, Win32cr::System::Com::BLOB*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a0e174b3-d26e-11d2-8f84-00805fc7bcd9")]
  record ICrmLogControl, lpVtbl : ICrmLogControlVtbl* do
    GUID = LibC::GUID.new(0xa0e174b3_u32, 0xd26e_u16, 0x11d2_u16, StaticArray[0x8f_u8, 0x84_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0xbc_u8, 0xd9_u8])
    def query_interface(this : ICrmLogControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmLogControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmLogControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_TransactionUOW(this : ICrmLogControl*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionUOW.call(this, pVal)
    end
    def register_compensator(this : ICrmLogControl*, lpcwstrProgIdCompensator : Win32cr::Foundation::PWSTR, lpcwstrDescription : Win32cr::Foundation::PWSTR, lCrmRegFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_compensator.call(this, lpcwstrProgIdCompensator, lpcwstrDescription, lCrmRegFlags)
    end
    def write_log_record_variants(this : ICrmLogControl*, pLogRecord : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_log_record_variants.call(this, pLogRecord)
    end
    def force_log(this : ICrmLogControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_log.call(this)
    end
    def forget_log_record(this : ICrmLogControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.forget_log_record.call(this)
    end
    def force_transaction_to_abort(this : ICrmLogControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_transaction_to_abort.call(this)
    end
    def write_log_record(this : ICrmLogControl*, rgBlob : Win32cr::System::Com::BLOB*, cBlob : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_log_record.call(this, rgBlob, cBlob)
    end

  end

  @[Extern]
  record ICrmCompensatorVariantsVtbl,
    query_interface : Proc(ICrmCompensatorVariants*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmCompensatorVariants*, UInt32),
    release : Proc(ICrmCompensatorVariants*, UInt32),
    set_log_control_variants : Proc(ICrmCompensatorVariants*, Void*, Win32cr::Foundation::HRESULT),
    begin_prepare_variants : Proc(ICrmCompensatorVariants*, Win32cr::Foundation::HRESULT),
    prepare_record_variants : Proc(ICrmCompensatorVariants*, Win32cr::System::Com::VARIANT*, Int16*, Win32cr::Foundation::HRESULT),
    end_prepare_variants : Proc(ICrmCompensatorVariants*, Int16*, Win32cr::Foundation::HRESULT),
    begin_commit_variants : Proc(ICrmCompensatorVariants*, Int16, Win32cr::Foundation::HRESULT),
    commit_record_variants : Proc(ICrmCompensatorVariants*, Win32cr::System::Com::VARIANT*, Int16*, Win32cr::Foundation::HRESULT),
    end_commit_variants : Proc(ICrmCompensatorVariants*, Win32cr::Foundation::HRESULT),
    begin_abort_variants : Proc(ICrmCompensatorVariants*, Int16, Win32cr::Foundation::HRESULT),
    abort_record_variants : Proc(ICrmCompensatorVariants*, Win32cr::System::Com::VARIANT*, Int16*, Win32cr::Foundation::HRESULT),
    end_abort_variants : Proc(ICrmCompensatorVariants*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f0baf8e4-7804-11d1-82e9-00a0c91eede9")]
  record ICrmCompensatorVariants, lpVtbl : ICrmCompensatorVariantsVtbl* do
    GUID = LibC::GUID.new(0xf0baf8e4_u32, 0x7804_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xe9_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
    def query_interface(this : ICrmCompensatorVariants*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmCompensatorVariants*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmCompensatorVariants*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_log_control_variants(this : ICrmCompensatorVariants*, pLogControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_control_variants.call(this, pLogControl)
    end
    def begin_prepare_variants(this : ICrmCompensatorVariants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prepare_variants.call(this)
    end
    def prepare_record_variants(this : ICrmCompensatorVariants*, pLogRecord : Win32cr::System::Com::VARIANT*, pbForget : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_record_variants.call(this, pLogRecord, pbForget)
    end
    def end_prepare_variants(this : ICrmCompensatorVariants*, pbOkToPrepare : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_prepare_variants.call(this, pbOkToPrepare)
    end
    def begin_commit_variants(this : ICrmCompensatorVariants*, bRecovery : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_commit_variants.call(this, bRecovery)
    end
    def commit_record_variants(this : ICrmCompensatorVariants*, pLogRecord : Win32cr::System::Com::VARIANT*, pbForget : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_record_variants.call(this, pLogRecord, pbForget)
    end
    def end_commit_variants(this : ICrmCompensatorVariants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_commit_variants.call(this)
    end
    def begin_abort_variants(this : ICrmCompensatorVariants*, bRecovery : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_abort_variants.call(this, bRecovery)
    end
    def abort_record_variants(this : ICrmCompensatorVariants*, pLogRecord : Win32cr::System::Com::VARIANT*, pbForget : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_record_variants.call(this, pLogRecord, pbForget)
    end
    def end_abort_variants(this : ICrmCompensatorVariants*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_abort_variants.call(this)
    end

  end

  @[Extern]
  record ICrmCompensatorVtbl,
    query_interface : Proc(ICrmCompensator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmCompensator*, UInt32),
    release : Proc(ICrmCompensator*, UInt32),
    set_log_control : Proc(ICrmCompensator*, Void*, Win32cr::Foundation::HRESULT),
    begin_prepare : Proc(ICrmCompensator*, Win32cr::Foundation::HRESULT),
    prepare_record : Proc(ICrmCompensator*, Win32cr::System::ComponentServices::CrmLogRecordRead, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    end_prepare : Proc(ICrmCompensator*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    begin_commit : Proc(ICrmCompensator*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    commit_record : Proc(ICrmCompensator*, Win32cr::System::ComponentServices::CrmLogRecordRead, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    end_commit : Proc(ICrmCompensator*, Win32cr::Foundation::HRESULT),
    begin_abort : Proc(ICrmCompensator*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    abort_record : Proc(ICrmCompensator*, Win32cr::System::ComponentServices::CrmLogRecordRead, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    end_abort : Proc(ICrmCompensator*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bbc01830-8d3b-11d1-82ec-00a0c91eede9")]
  record ICrmCompensator, lpVtbl : ICrmCompensatorVtbl* do
    GUID = LibC::GUID.new(0xbbc01830_u32, 0x8d3b_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xec_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
    def query_interface(this : ICrmCompensator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmCompensator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmCompensator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_log_control(this : ICrmCompensator*, pLogControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_log_control.call(this, pLogControl)
    end
    def begin_prepare(this : ICrmCompensator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_prepare.call(this)
    end
    def prepare_record(this : ICrmCompensator*, crmLogRec : Win32cr::System::ComponentServices::CrmLogRecordRead, pfForget : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_record.call(this, crmLogRec, pfForget)
    end
    def end_prepare(this : ICrmCompensator*, pfOkToPrepare : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_prepare.call(this, pfOkToPrepare)
    end
    def begin_commit(this : ICrmCompensator*, fRecovery : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_commit.call(this, fRecovery)
    end
    def commit_record(this : ICrmCompensator*, crmLogRec : Win32cr::System::ComponentServices::CrmLogRecordRead, pfForget : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_record.call(this, crmLogRec, pfForget)
    end
    def end_commit(this : ICrmCompensator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_commit.call(this)
    end
    def begin_abort(this : ICrmCompensator*, fRecovery : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_abort.call(this, fRecovery)
    end
    def abort_record(this : ICrmCompensator*, crmLogRec : Win32cr::System::ComponentServices::CrmLogRecordRead, pfForget : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort_record.call(this, crmLogRec, pfForget)
    end
    def end_abort(this : ICrmCompensator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_abort.call(this)
    end

  end

  @[Extern]
  record ICrmMonitorLogRecordsVtbl,
    query_interface : Proc(ICrmMonitorLogRecords*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmMonitorLogRecords*, UInt32),
    release : Proc(ICrmMonitorLogRecords*, UInt32),
    get_Count : Proc(ICrmMonitorLogRecords*, Int32*, Win32cr::Foundation::HRESULT),
    get_TransactionState : Proc(ICrmMonitorLogRecords*, Win32cr::System::ComponentServices::CrmTransactionState*, Win32cr::Foundation::HRESULT),
    get_StructuredRecords : Proc(ICrmMonitorLogRecords*, Int16*, Win32cr::Foundation::HRESULT),
    get_log_record : Proc(ICrmMonitorLogRecords*, UInt32, Win32cr::System::ComponentServices::CrmLogRecordRead*, Win32cr::Foundation::HRESULT),
    get_log_record_variants : Proc(ICrmMonitorLogRecords*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70c8e441-c7ed-11d1-82fb-00a0c91eede9")]
  record ICrmMonitorLogRecords, lpVtbl : ICrmMonitorLogRecordsVtbl* do
    GUID = LibC::GUID.new(0x70c8e441_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
    def query_interface(this : ICrmMonitorLogRecords*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmMonitorLogRecords*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmMonitorLogRecords*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Count(this : ICrmMonitorLogRecords*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def get_TransactionState(this : ICrmMonitorLogRecords*, pVal : Win32cr::System::ComponentServices::CrmTransactionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionState.call(this, pVal)
    end
    def get_StructuredRecords(this : ICrmMonitorLogRecords*, pVal : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StructuredRecords.call(this, pVal)
    end
    def get_log_record(this : ICrmMonitorLogRecords*, dwIndex : UInt32, pCrmLogRec : Win32cr::System::ComponentServices::CrmLogRecordRead*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_record.call(this, dwIndex, pCrmLogRec)
    end
    def get_log_record_variants(this : ICrmMonitorLogRecords*, index_number : Win32cr::System::Com::VARIANT, pLogRecord : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_log_record_variants.call(this, index_number, pLogRecord)
    end

  end

  @[Extern]
  record ICrmMonitorClerksVtbl,
    query_interface : Proc(ICrmMonitorClerks*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmMonitorClerks*, UInt32),
    release : Proc(ICrmMonitorClerks*, UInt32),
    get_type_info_count : Proc(ICrmMonitorClerks*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICrmMonitorClerks*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICrmMonitorClerks*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICrmMonitorClerks*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    item : Proc(ICrmMonitorClerks*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ICrmMonitorClerks*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ICrmMonitorClerks*, Int32*, Win32cr::Foundation::HRESULT),
    prog_id_compensator : Proc(ICrmMonitorClerks*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    description : Proc(ICrmMonitorClerks*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    transaction_uow : Proc(ICrmMonitorClerks*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    activity_id : Proc(ICrmMonitorClerks*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70c8e442-c7ed-11d1-82fb-00a0c91eede9")]
  record ICrmMonitorClerks, lpVtbl : ICrmMonitorClerksVtbl* do
    GUID = LibC::GUID.new(0x70c8e442_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
    def query_interface(this : ICrmMonitorClerks*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmMonitorClerks*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmMonitorClerks*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICrmMonitorClerks*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICrmMonitorClerks*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICrmMonitorClerks*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICrmMonitorClerks*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def item(this : ICrmMonitorClerks*, index : Win32cr::System::Com::VARIANT, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item.call(this, index, pItem)
    end
    def get__NewEnum(this : ICrmMonitorClerks*, pVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, pVal)
    end
    def get_Count(this : ICrmMonitorClerks*, pVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pVal)
    end
    def prog_id_compensator(this : ICrmMonitorClerks*, index : Win32cr::System::Com::VARIANT, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prog_id_compensator.call(this, index, pItem)
    end
    def description(this : ICrmMonitorClerks*, index : Win32cr::System::Com::VARIANT, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.description.call(this, index, pItem)
    end
    def transaction_uow(this : ICrmMonitorClerks*, index : Win32cr::System::Com::VARIANT, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transaction_uow.call(this, index, pItem)
    end
    def activity_id(this : ICrmMonitorClerks*, index : Win32cr::System::Com::VARIANT, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activity_id.call(this, index, pItem)
    end

  end

  @[Extern]
  record ICrmMonitorVtbl,
    query_interface : Proc(ICrmMonitor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmMonitor*, UInt32),
    release : Proc(ICrmMonitor*, UInt32),
    get_clerks : Proc(ICrmMonitor*, Void**, Win32cr::Foundation::HRESULT),
    hold_clerk : Proc(ICrmMonitor*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70c8e443-c7ed-11d1-82fb-00a0c91eede9")]
  record ICrmMonitor, lpVtbl : ICrmMonitorVtbl* do
    GUID = LibC::GUID.new(0x70c8e443_u32, 0xc7ed_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
    def query_interface(this : ICrmMonitor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmMonitor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmMonitor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_clerks(this : ICrmMonitor*, pClerks : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clerks.call(this, pClerks)
    end
    def hold_clerk(this : ICrmMonitor*, index : Win32cr::System::Com::VARIANT, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.hold_clerk.call(this, index, pItem)
    end

  end

  @[Extern]
  record ICrmFormatLogRecordsVtbl,
    query_interface : Proc(ICrmFormatLogRecords*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICrmFormatLogRecords*, UInt32),
    release : Proc(ICrmFormatLogRecords*, UInt32),
    get_column_count : Proc(ICrmFormatLogRecords*, Int32*, Win32cr::Foundation::HRESULT),
    get_column_headers : Proc(ICrmFormatLogRecords*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_column : Proc(ICrmFormatLogRecords*, Win32cr::System::ComponentServices::CrmLogRecordRead, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_column_variants : Proc(ICrmFormatLogRecords*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9c51d821-c98b-11d1-82fb-00a0c91eede9")]
  record ICrmFormatLogRecords, lpVtbl : ICrmFormatLogRecordsVtbl* do
    GUID = LibC::GUID.new(0x9c51d821_u32, 0xc98b_u16, 0x11d1_u16, StaticArray[0x82_u8, 0xfb_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x1e_u8, 0xed_u8, 0xe9_u8])
    def query_interface(this : ICrmFormatLogRecords*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICrmFormatLogRecords*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICrmFormatLogRecords*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_column_count(this : ICrmFormatLogRecords*, plColumnCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_count.call(this, plColumnCount)
    end
    def get_column_headers(this : ICrmFormatLogRecords*, pHeaders : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_headers.call(this, pHeaders)
    end
    def get_column(this : ICrmFormatLogRecords*, crm_log_rec : Win32cr::System::ComponentServices::CrmLogRecordRead, pFormattedLogRecord : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column.call(this, crm_log_rec, pFormattedLogRecord)
    end
    def get_column_variants(this : ICrmFormatLogRecords*, log_record : Win32cr::System::Com::VARIANT, pFormattedLogRecord : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_variants.call(this, log_record, pFormattedLogRecord)
    end

  end

  @[Extern]
  record IServiceIISIntrinsicsConfigVtbl,
    query_interface : Proc(IServiceIISIntrinsicsConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceIISIntrinsicsConfig*, UInt32),
    release : Proc(IServiceIISIntrinsicsConfig*, UInt32),
    iis_intrinsics_config : Proc(IServiceIISIntrinsicsConfig*, Win32cr::System::ComponentServices::CSC_IISIntrinsicsConfig, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1a0cf920-d452-46f4-bc36-48118d54ea52")]
  record IServiceIISIntrinsicsConfig, lpVtbl : IServiceIISIntrinsicsConfigVtbl* do
    GUID = LibC::GUID.new(0x1a0cf920_u32, 0xd452_u16, 0x46f4_u16, StaticArray[0xbc_u8, 0x36_u8, 0x48_u8, 0x11_u8, 0x8d_u8, 0x54_u8, 0xea_u8, 0x52_u8])
    def query_interface(this : IServiceIISIntrinsicsConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceIISIntrinsicsConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceIISIntrinsicsConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def iis_intrinsics_config(this : IServiceIISIntrinsicsConfig*, iisIntrinsicsConfig : Win32cr::System::ComponentServices::CSC_IISIntrinsicsConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.iis_intrinsics_config.call(this, iisIntrinsicsConfig)
    end

  end

  @[Extern]
  record IServiceComTIIntrinsicsConfigVtbl,
    query_interface : Proc(IServiceComTIIntrinsicsConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceComTIIntrinsicsConfig*, UInt32),
    release : Proc(IServiceComTIIntrinsicsConfig*, UInt32),
    com_ti_intrinsics_config : Proc(IServiceComTIIntrinsicsConfig*, Win32cr::System::ComponentServices::CSC_COMTIIntrinsicsConfig, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("09e6831e-04e1-4ed4-9d0f-e8b168bafeaf")]
  record IServiceComTIIntrinsicsConfig, lpVtbl : IServiceComTIIntrinsicsConfigVtbl* do
    GUID = LibC::GUID.new(0x9e6831e_u32, 0x4e1_u16, 0x4ed4_u16, StaticArray[0x9d_u8, 0xf_u8, 0xe8_u8, 0xb1_u8, 0x68_u8, 0xba_u8, 0xfe_u8, 0xaf_u8])
    def query_interface(this : IServiceComTIIntrinsicsConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceComTIIntrinsicsConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceComTIIntrinsicsConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def com_ti_intrinsics_config(this : IServiceComTIIntrinsicsConfig*, comtiIntrinsicsConfig : Win32cr::System::ComponentServices::CSC_COMTIIntrinsicsConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.com_ti_intrinsics_config.call(this, comtiIntrinsicsConfig)
    end

  end

  @[Extern]
  record IServiceSxsConfigVtbl,
    query_interface : Proc(IServiceSxsConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceSxsConfig*, UInt32),
    release : Proc(IServiceSxsConfig*, UInt32),
    sxs_config : Proc(IServiceSxsConfig*, Win32cr::System::ComponentServices::CSC_SxsConfig, Win32cr::Foundation::HRESULT),
    sxs_name : Proc(IServiceSxsConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    sxs_directory : Proc(IServiceSxsConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c7cd7379-f3f2-4634-811b-703281d73e08")]
  record IServiceSxsConfig, lpVtbl : IServiceSxsConfigVtbl* do
    GUID = LibC::GUID.new(0xc7cd7379_u32, 0xf3f2_u16, 0x4634_u16, StaticArray[0x81_u8, 0x1b_u8, 0x70_u8, 0x32_u8, 0x81_u8, 0xd7_u8, 0x3e_u8, 0x8_u8])
    def query_interface(this : IServiceSxsConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceSxsConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceSxsConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def sxs_config(this : IServiceSxsConfig*, scsConfig : Win32cr::System::ComponentServices::CSC_SxsConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sxs_config.call(this, scsConfig)
    end
    def sxs_name(this : IServiceSxsConfig*, szSxsName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sxs_name.call(this, szSxsName)
    end
    def sxs_directory(this : IServiceSxsConfig*, szSxsDirectory : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.sxs_directory.call(this, szSxsDirectory)
    end

  end

  @[Extern]
  record ICheckSxsConfigVtbl,
    query_interface : Proc(ICheckSxsConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICheckSxsConfig*, UInt32),
    release : Proc(ICheckSxsConfig*, UInt32),
    is_same_sxs_config : Proc(ICheckSxsConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0ff5a96f-11fc-47d1-baa6-25dd347e7242")]
  record ICheckSxsConfig, lpVtbl : ICheckSxsConfigVtbl* do
    GUID = LibC::GUID.new(0xff5a96f_u32, 0x11fc_u16, 0x47d1_u16, StaticArray[0xba_u8, 0xa6_u8, 0x25_u8, 0xdd_u8, 0x34_u8, 0x7e_u8, 0x72_u8, 0x42_u8])
    def query_interface(this : ICheckSxsConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICheckSxsConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICheckSxsConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_same_sxs_config(this : ICheckSxsConfig*, wszSxsName : Win32cr::Foundation::PWSTR, wszSxsDirectory : Win32cr::Foundation::PWSTR, wszSxsAppName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_same_sxs_config.call(this, wszSxsName, wszSxsDirectory, wszSxsAppName)
    end

  end

  @[Extern]
  record IServiceInheritanceConfigVtbl,
    query_interface : Proc(IServiceInheritanceConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceInheritanceConfig*, UInt32),
    release : Proc(IServiceInheritanceConfig*, UInt32),
    containing_context_treatment : Proc(IServiceInheritanceConfig*, Win32cr::System::ComponentServices::CSC_InheritanceConfig, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("92186771-d3b4-4d77-a8ea-ee842d586f35")]
  record IServiceInheritanceConfig, lpVtbl : IServiceInheritanceConfigVtbl* do
    GUID = LibC::GUID.new(0x92186771_u32, 0xd3b4_u16, 0x4d77_u16, StaticArray[0xa8_u8, 0xea_u8, 0xee_u8, 0x84_u8, 0x2d_u8, 0x58_u8, 0x6f_u8, 0x35_u8])
    def query_interface(this : IServiceInheritanceConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceInheritanceConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceInheritanceConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def containing_context_treatment(this : IServiceInheritanceConfig*, inheritanceConfig : Win32cr::System::ComponentServices::CSC_InheritanceConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.containing_context_treatment.call(this, inheritanceConfig)
    end

  end

  @[Extern]
  record IServiceThreadPoolConfigVtbl,
    query_interface : Proc(IServiceThreadPoolConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceThreadPoolConfig*, UInt32),
    release : Proc(IServiceThreadPoolConfig*, UInt32),
    select_thread_pool : Proc(IServiceThreadPoolConfig*, Win32cr::System::ComponentServices::CSC_ThreadPool, Win32cr::Foundation::HRESULT),
    set_binding_info : Proc(IServiceThreadPoolConfig*, Win32cr::System::ComponentServices::CSC_Binding, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("186d89bc-f277-4bcc-80d5-4df7b836ef4a")]
  record IServiceThreadPoolConfig, lpVtbl : IServiceThreadPoolConfigVtbl* do
    GUID = LibC::GUID.new(0x186d89bc_u32, 0xf277_u16, 0x4bcc_u16, StaticArray[0x80_u8, 0xd5_u8, 0x4d_u8, 0xf7_u8, 0xb8_u8, 0x36_u8, 0xef_u8, 0x4a_u8])
    def query_interface(this : IServiceThreadPoolConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceThreadPoolConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceThreadPoolConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def select_thread_pool(this : IServiceThreadPoolConfig*, threadPool : Win32cr::System::ComponentServices::CSC_ThreadPool) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select_thread_pool.call(this, threadPool)
    end
    def set_binding_info(this : IServiceThreadPoolConfig*, binding : Win32cr::System::ComponentServices::CSC_Binding) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_binding_info.call(this, binding)
    end

  end

  @[Extern]
  record IServiceTransactionConfigBaseVtbl,
    query_interface : Proc(IServiceTransactionConfigBase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceTransactionConfigBase*, UInt32),
    release : Proc(IServiceTransactionConfigBase*, UInt32),
    configure_transaction : Proc(IServiceTransactionConfigBase*, Win32cr::System::ComponentServices::CSC_TransactionConfig, Win32cr::Foundation::HRESULT),
    isolation_level : Proc(IServiceTransactionConfigBase*, Win32cr::System::ComponentServices::COMAdminTxIsolationLevelOptions, Win32cr::Foundation::HRESULT),
    transaction_timeout : Proc(IServiceTransactionConfigBase*, UInt32, Win32cr::Foundation::HRESULT),
    bring_your_own_transaction : Proc(IServiceTransactionConfigBase*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    new_transaction_description : Proc(IServiceTransactionConfigBase*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("772b3fbe-6ffd-42fb-b5f8-8f9b260f3810")]
  record IServiceTransactionConfigBase, lpVtbl : IServiceTransactionConfigBaseVtbl* do
    GUID = LibC::GUID.new(0x772b3fbe_u32, 0x6ffd_u16, 0x42fb_u16, StaticArray[0xb5_u8, 0xf8_u8, 0x8f_u8, 0x9b_u8, 0x26_u8, 0xf_u8, 0x38_u8, 0x10_u8])
    def query_interface(this : IServiceTransactionConfigBase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceTransactionConfigBase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceTransactionConfigBase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def configure_transaction(this : IServiceTransactionConfigBase*, transactionConfig : Win32cr::System::ComponentServices::CSC_TransactionConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_transaction.call(this, transactionConfig)
    end
    def isolation_level(this : IServiceTransactionConfigBase*, option : Win32cr::System::ComponentServices::COMAdminTxIsolationLevelOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.isolation_level.call(this, option)
    end
    def transaction_timeout(this : IServiceTransactionConfigBase*, ulTimeoutSec : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transaction_timeout.call(this, ulTimeoutSec)
    end
    def bring_your_own_transaction(this : IServiceTransactionConfigBase*, szTipURL : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_your_own_transaction.call(this, szTipURL)
    end
    def new_transaction_description(this : IServiceTransactionConfigBase*, szTxDesc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_transaction_description.call(this, szTxDesc)
    end

  end

  @[Extern]
  record IServiceTransactionConfigVtbl,
    query_interface : Proc(IServiceTransactionConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceTransactionConfig*, UInt32),
    release : Proc(IServiceTransactionConfig*, UInt32),
    configure_transaction : Proc(IServiceTransactionConfig*, Win32cr::System::ComponentServices::CSC_TransactionConfig, Win32cr::Foundation::HRESULT),
    isolation_level : Proc(IServiceTransactionConfig*, Win32cr::System::ComponentServices::COMAdminTxIsolationLevelOptions, Win32cr::Foundation::HRESULT),
    transaction_timeout : Proc(IServiceTransactionConfig*, UInt32, Win32cr::Foundation::HRESULT),
    bring_your_own_transaction : Proc(IServiceTransactionConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    new_transaction_description : Proc(IServiceTransactionConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    configure_byot : Proc(IServiceTransactionConfig*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9")]
  record IServiceTransactionConfig, lpVtbl : IServiceTransactionConfigVtbl* do
    GUID = LibC::GUID.new(0x59f4c2a3_u32, 0xd3d7_u16, 0x4a31_u16, StaticArray[0xb6_u8, 0xe4_u8, 0x6a_u8, 0xb3_u8, 0x17_u8, 0x7c_u8, 0x50_u8, 0xb9_u8])
    def query_interface(this : IServiceTransactionConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceTransactionConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceTransactionConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def configure_transaction(this : IServiceTransactionConfig*, transactionConfig : Win32cr::System::ComponentServices::CSC_TransactionConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_transaction.call(this, transactionConfig)
    end
    def isolation_level(this : IServiceTransactionConfig*, option : Win32cr::System::ComponentServices::COMAdminTxIsolationLevelOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.isolation_level.call(this, option)
    end
    def transaction_timeout(this : IServiceTransactionConfig*, ulTimeoutSec : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transaction_timeout.call(this, ulTimeoutSec)
    end
    def bring_your_own_transaction(this : IServiceTransactionConfig*, szTipURL : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_your_own_transaction.call(this, szTipURL)
    end
    def new_transaction_description(this : IServiceTransactionConfig*, szTxDesc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_transaction_description.call(this, szTxDesc)
    end
    def configure_byot(this : IServiceTransactionConfig*, pITxByot : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_byot.call(this, pITxByot)
    end

  end

  @[Extern]
  record IServiceSysTxnConfigVtbl,
    query_interface : Proc(IServiceSysTxnConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceSysTxnConfig*, UInt32),
    release : Proc(IServiceSysTxnConfig*, UInt32),
    configure_transaction : Proc(IServiceSysTxnConfig*, Win32cr::System::ComponentServices::CSC_TransactionConfig, Win32cr::Foundation::HRESULT),
    isolation_level : Proc(IServiceSysTxnConfig*, Win32cr::System::ComponentServices::COMAdminTxIsolationLevelOptions, Win32cr::Foundation::HRESULT),
    transaction_timeout : Proc(IServiceSysTxnConfig*, UInt32, Win32cr::Foundation::HRESULT),
    bring_your_own_transaction : Proc(IServiceSysTxnConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    new_transaction_description : Proc(IServiceSysTxnConfig*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    configure_byot : Proc(IServiceSysTxnConfig*, Void*, Win32cr::Foundation::HRESULT),
    configure_byot_sys_txn : Proc(IServiceSysTxnConfig*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("33caf1a1-fcb8-472b-b45e-967448ded6d8")]
  record IServiceSysTxnConfig, lpVtbl : IServiceSysTxnConfigVtbl* do
    GUID = LibC::GUID.new(0x33caf1a1_u32, 0xfcb8_u16, 0x472b_u16, StaticArray[0xb4_u8, 0x5e_u8, 0x96_u8, 0x74_u8, 0x48_u8, 0xde_u8, 0xd6_u8, 0xd8_u8])
    def query_interface(this : IServiceSysTxnConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceSysTxnConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceSysTxnConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def configure_transaction(this : IServiceSysTxnConfig*, transactionConfig : Win32cr::System::ComponentServices::CSC_TransactionConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_transaction.call(this, transactionConfig)
    end
    def isolation_level(this : IServiceSysTxnConfig*, option : Win32cr::System::ComponentServices::COMAdminTxIsolationLevelOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.isolation_level.call(this, option)
    end
    def transaction_timeout(this : IServiceSysTxnConfig*, ulTimeoutSec : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.transaction_timeout.call(this, ulTimeoutSec)
    end
    def bring_your_own_transaction(this : IServiceSysTxnConfig*, szTipURL : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bring_your_own_transaction.call(this, szTipURL)
    end
    def new_transaction_description(this : IServiceSysTxnConfig*, szTxDesc : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_transaction_description.call(this, szTxDesc)
    end
    def configure_byot(this : IServiceSysTxnConfig*, pITxByot : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_byot.call(this, pITxByot)
    end
    def configure_byot_sys_txn(this : IServiceSysTxnConfig*, pTxProxy : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_byot_sys_txn.call(this, pTxProxy)
    end

  end

  @[Extern]
  record IServiceSynchronizationConfigVtbl,
    query_interface : Proc(IServiceSynchronizationConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceSynchronizationConfig*, UInt32),
    release : Proc(IServiceSynchronizationConfig*, UInt32),
    configure_synchronization : Proc(IServiceSynchronizationConfig*, Win32cr::System::ComponentServices::CSC_SynchronizationConfig, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fd880e81-6dce-4c58-af83-a208846c0030")]
  record IServiceSynchronizationConfig, lpVtbl : IServiceSynchronizationConfigVtbl* do
    GUID = LibC::GUID.new(0xfd880e81_u32, 0x6dce_u16, 0x4c58_u16, StaticArray[0xaf_u8, 0x83_u8, 0xa2_u8, 0x8_u8, 0x84_u8, 0x6c_u8, 0x0_u8, 0x30_u8])
    def query_interface(this : IServiceSynchronizationConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceSynchronizationConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceSynchronizationConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def configure_synchronization(this : IServiceSynchronizationConfig*, synchConfig : Win32cr::System::ComponentServices::CSC_SynchronizationConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.configure_synchronization.call(this, synchConfig)
    end

  end

  @[Extern]
  record IServiceTrackerConfigVtbl,
    query_interface : Proc(IServiceTrackerConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceTrackerConfig*, UInt32),
    release : Proc(IServiceTrackerConfig*, UInt32),
    tracker_config : Proc(IServiceTrackerConfig*, Win32cr::System::ComponentServices::CSC_TrackerConfig, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6c3a3e1d-0ba6-4036-b76f-d0404db816c9")]
  record IServiceTrackerConfig, lpVtbl : IServiceTrackerConfigVtbl* do
    GUID = LibC::GUID.new(0x6c3a3e1d_u32, 0xba6_u16, 0x4036_u16, StaticArray[0xb7_u8, 0x6f_u8, 0xd0_u8, 0x40_u8, 0x4d_u8, 0xb8_u8, 0x16_u8, 0xc9_u8])
    def query_interface(this : IServiceTrackerConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceTrackerConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceTrackerConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def tracker_config(this : IServiceTrackerConfig*, trackerConfig : Win32cr::System::ComponentServices::CSC_TrackerConfig, szTrackerAppName : Win32cr::Foundation::PWSTR, szTrackerCtxName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.tracker_config.call(this, trackerConfig, szTrackerAppName, szTrackerCtxName)
    end

  end

  @[Extern]
  record IServicePartitionConfigVtbl,
    query_interface : Proc(IServicePartitionConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServicePartitionConfig*, UInt32),
    release : Proc(IServicePartitionConfig*, UInt32),
    partition_config : Proc(IServicePartitionConfig*, Win32cr::System::ComponentServices::CSC_PartitionConfig, Win32cr::Foundation::HRESULT),
    partition_id : Proc(IServicePartitionConfig*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80182d03-5ea4-4831-ae97-55beffc2e590")]
  record IServicePartitionConfig, lpVtbl : IServicePartitionConfigVtbl* do
    GUID = LibC::GUID.new(0x80182d03_u32, 0x5ea4_u16, 0x4831_u16, StaticArray[0xae_u8, 0x97_u8, 0x55_u8, 0xbe_u8, 0xff_u8, 0xc2_u8, 0xe5_u8, 0x90_u8])
    def query_interface(this : IServicePartitionConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServicePartitionConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServicePartitionConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def partition_config(this : IServicePartitionConfig*, partitionConfig : Win32cr::System::ComponentServices::CSC_PartitionConfig) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.partition_config.call(this, partitionConfig)
    end
    def partition_id(this : IServicePartitionConfig*, guidPartitionID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.partition_id.call(this, guidPartitionID)
    end

  end

  @[Extern]
  record IServiceCallVtbl,
    query_interface : Proc(IServiceCall*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceCall*, UInt32),
    release : Proc(IServiceCall*, UInt32),
    on_call : Proc(IServiceCall*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bd3e2e12-42dd-40f4-a09a-95a50c58304b")]
  record IServiceCall, lpVtbl : IServiceCallVtbl* do
    GUID = LibC::GUID.new(0xbd3e2e12_u32, 0x42dd_u16, 0x40f4_u16, StaticArray[0xa0_u8, 0x9a_u8, 0x95_u8, 0xa5_u8, 0xc_u8, 0x58_u8, 0x30_u8, 0x4b_u8])
    def query_interface(this : IServiceCall*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceCall*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceCall*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_call(this : IServiceCall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_call.call(this)
    end

  end

  @[Extern]
  record IAsyncErrorNotifyVtbl,
    query_interface : Proc(IAsyncErrorNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAsyncErrorNotify*, UInt32),
    release : Proc(IAsyncErrorNotify*, UInt32),
    on_error : Proc(IAsyncErrorNotify*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fe6777fb-a674-4177-8f32-6d707e113484")]
  record IAsyncErrorNotify, lpVtbl : IAsyncErrorNotifyVtbl* do
    GUID = LibC::GUID.new(0xfe6777fb_u32, 0xa674_u16, 0x4177_u16, StaticArray[0x8f_u8, 0x32_u8, 0x6d_u8, 0x70_u8, 0x7e_u8, 0x11_u8, 0x34_u8, 0x84_u8])
    def query_interface(this : IAsyncErrorNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAsyncErrorNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAsyncErrorNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_error(this : IAsyncErrorNotify*, hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_error.call(this, hr)
    end

  end

  @[Extern]
  record IServiceActivityVtbl,
    query_interface : Proc(IServiceActivity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServiceActivity*, UInt32),
    release : Proc(IServiceActivity*, UInt32),
    synchronous_call : Proc(IServiceActivity*, Void*, Win32cr::Foundation::HRESULT),
    asynchronous_call : Proc(IServiceActivity*, Void*, Win32cr::Foundation::HRESULT),
    bind_to_current_thread : Proc(IServiceActivity*, Win32cr::Foundation::HRESULT),
    unbind_from_thread : Proc(IServiceActivity*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("67532e0c-9e2f-4450-a354-035633944e17")]
  record IServiceActivity, lpVtbl : IServiceActivityVtbl* do
    GUID = LibC::GUID.new(0x67532e0c_u32, 0x9e2f_u16, 0x4450_u16, StaticArray[0xa3_u8, 0x54_u8, 0x3_u8, 0x56_u8, 0x33_u8, 0x94_u8, 0x4e_u8, 0x17_u8])
    def query_interface(this : IServiceActivity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServiceActivity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServiceActivity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def synchronous_call(this : IServiceActivity*, pIServiceCall : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call.call(this, pIServiceCall)
    end
    def asynchronous_call(this : IServiceActivity*, pIServiceCall : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.asynchronous_call.call(this, pIServiceCall)
    end
    def bind_to_current_thread(this : IServiceActivity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_current_thread.call(this)
    end
    def unbind_from_thread(this : IServiceActivity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unbind_from_thread.call(this)
    end

  end

  @[Extern]
  record IThreadPoolKnobsVtbl,
    query_interface : Proc(IThreadPoolKnobs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IThreadPoolKnobs*, UInt32),
    release : Proc(IThreadPoolKnobs*, UInt32),
    get_max_threads : Proc(IThreadPoolKnobs*, Int32*, Win32cr::Foundation::HRESULT),
    get_current_threads : Proc(IThreadPoolKnobs*, Int32*, Win32cr::Foundation::HRESULT),
    set_max_threads : Proc(IThreadPoolKnobs*, Int32, Win32cr::Foundation::HRESULT),
    get_delete_delay : Proc(IThreadPoolKnobs*, Int32*, Win32cr::Foundation::HRESULT),
    set_delete_delay : Proc(IThreadPoolKnobs*, Int32, Win32cr::Foundation::HRESULT),
    get_max_queued_requests : Proc(IThreadPoolKnobs*, Int32*, Win32cr::Foundation::HRESULT),
    get_current_queued_requests : Proc(IThreadPoolKnobs*, Int32*, Win32cr::Foundation::HRESULT),
    set_max_queued_requests : Proc(IThreadPoolKnobs*, Int32, Win32cr::Foundation::HRESULT),
    set_min_threads : Proc(IThreadPoolKnobs*, Int32, Win32cr::Foundation::HRESULT),
    set_queue_depth : Proc(IThreadPoolKnobs*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372af7-cae7-11cf-be81-00aa00a2fa25")]
  record IThreadPoolKnobs, lpVtbl : IThreadPoolKnobsVtbl* do
    GUID = LibC::GUID.new(0x51372af7_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IThreadPoolKnobs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IThreadPoolKnobs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IThreadPoolKnobs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_max_threads(this : IThreadPoolKnobs*, plcMaxThreads : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_threads.call(this, plcMaxThreads)
    end
    def get_current_threads(this : IThreadPoolKnobs*, plcCurrentThreads : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_threads.call(this, plcCurrentThreads)
    end
    def set_max_threads(this : IThreadPoolKnobs*, lcMaxThreads : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_threads.call(this, lcMaxThreads)
    end
    def get_delete_delay(this : IThreadPoolKnobs*, pmsecDeleteDelay : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_delete_delay.call(this, pmsecDeleteDelay)
    end
    def set_delete_delay(this : IThreadPoolKnobs*, msecDeleteDelay : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_delete_delay.call(this, msecDeleteDelay)
    end
    def get_max_queued_requests(this : IThreadPoolKnobs*, plcMaxQueuedRequests : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_queued_requests.call(this, plcMaxQueuedRequests)
    end
    def get_current_queued_requests(this : IThreadPoolKnobs*, plcCurrentQueuedRequests : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_queued_requests.call(this, plcCurrentQueuedRequests)
    end
    def set_max_queued_requests(this : IThreadPoolKnobs*, lcMaxQueuedRequests : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_queued_requests.call(this, lcMaxQueuedRequests)
    end
    def set_min_threads(this : IThreadPoolKnobs*, lcMinThreads : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_threads.call(this, lcMinThreads)
    end
    def set_queue_depth(this : IThreadPoolKnobs*, lcQueueDepth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_queue_depth.call(this, lcQueueDepth)
    end

  end

  @[Extern]
  record IComStaThreadPoolKnobsVtbl,
    query_interface : Proc(IComStaThreadPoolKnobs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComStaThreadPoolKnobs*, UInt32),
    release : Proc(IComStaThreadPoolKnobs*, UInt32),
    set_min_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32, Win32cr::Foundation::HRESULT),
    get_min_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT),
    set_activity_per_thread : Proc(IComStaThreadPoolKnobs*, UInt32, Win32cr::Foundation::HRESULT),
    get_activity_per_thread : Proc(IComStaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT),
    set_activity_ratio : Proc(IComStaThreadPoolKnobs*, Float64, Win32cr::Foundation::HRESULT),
    get_activity_ratio : Proc(IComStaThreadPoolKnobs*, Float64*, Win32cr::Foundation::HRESULT),
    get_thread_count : Proc(IComStaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_queue_depth : Proc(IComStaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT),
    set_queue_depth : Proc(IComStaThreadPoolKnobs*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("324b64fa-33b6-11d2-98b7-00c04f8ee1c4")]
  record IComStaThreadPoolKnobs, lpVtbl : IComStaThreadPoolKnobsVtbl* do
    GUID = LibC::GUID.new(0x324b64fa_u32, 0x33b6_u16, 0x11d2_u16, StaticArray[0x98_u8, 0xb7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xe1_u8, 0xc4_u8])
    def query_interface(this : IComStaThreadPoolKnobs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComStaThreadPoolKnobs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComStaThreadPoolKnobs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_min_thread_count(this : IComStaThreadPoolKnobs*, minThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_thread_count.call(this, minThreads)
    end
    def get_min_thread_count(this : IComStaThreadPoolKnobs*, minThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_thread_count.call(this, minThreads)
    end
    def set_max_thread_count(this : IComStaThreadPoolKnobs*, maxThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_thread_count.call(this, maxThreads)
    end
    def get_max_thread_count(this : IComStaThreadPoolKnobs*, maxThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_thread_count.call(this, maxThreads)
    end
    def set_activity_per_thread(this : IComStaThreadPoolKnobs*, activitiesPerThread : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_activity_per_thread.call(this, activitiesPerThread)
    end
    def get_activity_per_thread(this : IComStaThreadPoolKnobs*, activitiesPerThread : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_per_thread.call(this, activitiesPerThread)
    end
    def set_activity_ratio(this : IComStaThreadPoolKnobs*, activityRatio : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_activity_ratio.call(this, activityRatio)
    end
    def get_activity_ratio(this : IComStaThreadPoolKnobs*, activityRatio : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_ratio.call(this, activityRatio)
    end
    def get_thread_count(this : IComStaThreadPoolKnobs*, pdwThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_count.call(this, pdwThreads)
    end
    def get_queue_depth(this : IComStaThreadPoolKnobs*, pdwQDepth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_queue_depth.call(this, pdwQDepth)
    end
    def set_queue_depth(this : IComStaThreadPoolKnobs*, dwQDepth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_queue_depth.call(this, dwQDepth)
    end

  end

  @[Extern]
  record IComMtaThreadPoolKnobsVtbl,
    query_interface : Proc(IComMtaThreadPoolKnobs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComMtaThreadPoolKnobs*, UInt32),
    release : Proc(IComMtaThreadPoolKnobs*, UInt32),
    mta_set_max_thread_count : Proc(IComMtaThreadPoolKnobs*, UInt32, Win32cr::Foundation::HRESULT),
    mta_get_max_thread_count : Proc(IComMtaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT),
    mta_set_throttle_value : Proc(IComMtaThreadPoolKnobs*, UInt32, Win32cr::Foundation::HRESULT),
    mta_get_throttle_value : Proc(IComMtaThreadPoolKnobs*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f9a76d2e-76a5-43eb-a0c4-49bec8e48480")]
  record IComMtaThreadPoolKnobs, lpVtbl : IComMtaThreadPoolKnobsVtbl* do
    GUID = LibC::GUID.new(0xf9a76d2e_u32, 0x76a5_u16, 0x43eb_u16, StaticArray[0xa0_u8, 0xc4_u8, 0x49_u8, 0xbe_u8, 0xc8_u8, 0xe4_u8, 0x84_u8, 0x80_u8])
    def query_interface(this : IComMtaThreadPoolKnobs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComMtaThreadPoolKnobs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComMtaThreadPoolKnobs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def mta_set_max_thread_count(this : IComMtaThreadPoolKnobs*, dwMaxThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.mta_set_max_thread_count.call(this, dwMaxThreads)
    end
    def mta_get_max_thread_count(this : IComMtaThreadPoolKnobs*, pdwMaxThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.mta_get_max_thread_count.call(this, pdwMaxThreads)
    end
    def mta_set_throttle_value(this : IComMtaThreadPoolKnobs*, dwThrottle : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.mta_set_throttle_value.call(this, dwThrottle)
    end
    def mta_get_throttle_value(this : IComMtaThreadPoolKnobs*, pdwThrottle : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.mta_get_throttle_value.call(this, pdwThrottle)
    end

  end

  @[Extern]
  record IComStaThreadPoolKnobs2Vtbl,
    query_interface : Proc(IComStaThreadPoolKnobs2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComStaThreadPoolKnobs2*, UInt32),
    release : Proc(IComStaThreadPoolKnobs2*, UInt32),
    set_min_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32, Win32cr::Foundation::HRESULT),
    get_min_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32, Win32cr::Foundation::HRESULT),
    get_max_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_activity_per_thread : Proc(IComStaThreadPoolKnobs2*, UInt32, Win32cr::Foundation::HRESULT),
    get_activity_per_thread : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_activity_ratio : Proc(IComStaThreadPoolKnobs2*, Float64, Win32cr::Foundation::HRESULT),
    get_activity_ratio : Proc(IComStaThreadPoolKnobs2*, Float64*, Win32cr::Foundation::HRESULT),
    get_thread_count : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_queue_depth : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_queue_depth : Proc(IComStaThreadPoolKnobs2*, Int32, Win32cr::Foundation::HRESULT),
    get_max_cpu_load : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_cpu_load : Proc(IComStaThreadPoolKnobs2*, Int32, Win32cr::Foundation::HRESULT),
    get_cpu_metric_enabled : Proc(IComStaThreadPoolKnobs2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_cpu_metric_enabled : Proc(IComStaThreadPoolKnobs2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_create_threads_aggressively : Proc(IComStaThreadPoolKnobs2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_create_threads_aggressively : Proc(IComStaThreadPoolKnobs2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_max_csr : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_max_csr : Proc(IComStaThreadPoolKnobs2*, Int32, Win32cr::Foundation::HRESULT),
    get_wait_time_for_thread_cleanup : Proc(IComStaThreadPoolKnobs2*, UInt32*, Win32cr::Foundation::HRESULT),
    set_wait_time_for_thread_cleanup : Proc(IComStaThreadPoolKnobs2*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("73707523-ff9a-4974-bf84-2108dc213740")]
  record IComStaThreadPoolKnobs2, lpVtbl : IComStaThreadPoolKnobs2Vtbl* do
    GUID = LibC::GUID.new(0x73707523_u32, 0xff9a_u16, 0x4974_u16, StaticArray[0xbf_u8, 0x84_u8, 0x21_u8, 0x8_u8, 0xdc_u8, 0x21_u8, 0x37_u8, 0x40_u8])
    def query_interface(this : IComStaThreadPoolKnobs2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComStaThreadPoolKnobs2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComStaThreadPoolKnobs2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_min_thread_count(this : IComStaThreadPoolKnobs2*, minThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_min_thread_count.call(this, minThreads)
    end
    def get_min_thread_count(this : IComStaThreadPoolKnobs2*, minThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_min_thread_count.call(this, minThreads)
    end
    def set_max_thread_count(this : IComStaThreadPoolKnobs2*, maxThreads : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_thread_count.call(this, maxThreads)
    end
    def get_max_thread_count(this : IComStaThreadPoolKnobs2*, maxThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_thread_count.call(this, maxThreads)
    end
    def set_activity_per_thread(this : IComStaThreadPoolKnobs2*, activitiesPerThread : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_activity_per_thread.call(this, activitiesPerThread)
    end
    def get_activity_per_thread(this : IComStaThreadPoolKnobs2*, activitiesPerThread : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_per_thread.call(this, activitiesPerThread)
    end
    def set_activity_ratio(this : IComStaThreadPoolKnobs2*, activityRatio : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_activity_ratio.call(this, activityRatio)
    end
    def get_activity_ratio(this : IComStaThreadPoolKnobs2*, activityRatio : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_activity_ratio.call(this, activityRatio)
    end
    def get_thread_count(this : IComStaThreadPoolKnobs2*, pdwThreads : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_count.call(this, pdwThreads)
    end
    def get_queue_depth(this : IComStaThreadPoolKnobs2*, pdwQDepth : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_queue_depth.call(this, pdwQDepth)
    end
    def set_queue_depth(this : IComStaThreadPoolKnobs2*, dwQDepth : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_queue_depth.call(this, dwQDepth)
    end
    def get_max_cpu_load(this : IComStaThreadPoolKnobs2*, pdwLoad : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_cpu_load.call(this, pdwLoad)
    end
    def set_max_cpu_load(this : IComStaThreadPoolKnobs2*, pdwLoad : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_cpu_load.call(this, pdwLoad)
    end
    def get_cpu_metric_enabled(this : IComStaThreadPoolKnobs2*, pbMetricEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cpu_metric_enabled.call(this, pbMetricEnabled)
    end
    def set_cpu_metric_enabled(this : IComStaThreadPoolKnobs2*, bMetricEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_cpu_metric_enabled.call(this, bMetricEnabled)
    end
    def get_create_threads_aggressively(this : IComStaThreadPoolKnobs2*, pbMetricEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_create_threads_aggressively.call(this, pbMetricEnabled)
    end
    def set_create_threads_aggressively(this : IComStaThreadPoolKnobs2*, bMetricEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_create_threads_aggressively.call(this, bMetricEnabled)
    end
    def get_max_csr(this : IComStaThreadPoolKnobs2*, pdwCSR : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_csr.call(this, pdwCSR)
    end
    def set_max_csr(this : IComStaThreadPoolKnobs2*, dwCSR : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_max_csr.call(this, dwCSR)
    end
    def get_wait_time_for_thread_cleanup(this : IComStaThreadPoolKnobs2*, pdwThreadCleanupWaitTime : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wait_time_for_thread_cleanup.call(this, pdwThreadCleanupWaitTime)
    end
    def set_wait_time_for_thread_cleanup(this : IComStaThreadPoolKnobs2*, dwThreadCleanupWaitTime : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wait_time_for_thread_cleanup.call(this, dwThreadCleanupWaitTime)
    end

  end

  @[Extern]
  record IProcessInitializerVtbl,
    query_interface : Proc(IProcessInitializer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProcessInitializer*, UInt32),
    release : Proc(IProcessInitializer*, UInt32),
    startup : Proc(IProcessInitializer*, Void*, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IProcessInitializer*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1113f52d-dc7f-4943-aed6-88d04027e32a")]
  record IProcessInitializer, lpVtbl : IProcessInitializerVtbl* do
    GUID = LibC::GUID.new(0x1113f52d_u32, 0xdc7f_u16, 0x4943_u16, StaticArray[0xae_u8, 0xd6_u8, 0x88_u8, 0xd0_u8, 0x40_u8, 0x27_u8, 0xe3_u8, 0x2a_u8])
    def query_interface(this : IProcessInitializer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProcessInitializer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProcessInitializer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def startup(this : IProcessInitializer*, punkProcessControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.startup.call(this, punkProcessControl)
    end
    def shutdown(this : IProcessInitializer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end

  end

  @[Extern]
  record IServicePoolConfigVtbl,
    query_interface : Proc(IServicePoolConfig*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServicePoolConfig*, UInt32),
    release : Proc(IServicePoolConfig*, UInt32),
    put_MaxPoolSize : Proc(IServicePoolConfig*, UInt32, Win32cr::Foundation::HRESULT),
    get_MaxPoolSize : Proc(IServicePoolConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    put_MinPoolSize : Proc(IServicePoolConfig*, UInt32, Win32cr::Foundation::HRESULT),
    get_MinPoolSize : Proc(IServicePoolConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    put_CreationTimeout : Proc(IServicePoolConfig*, UInt32, Win32cr::Foundation::HRESULT),
    get_CreationTimeout : Proc(IServicePoolConfig*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TransactionAffinity : Proc(IServicePoolConfig*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_TransactionAffinity : Proc(IServicePoolConfig*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ClassFactory : Proc(IServicePoolConfig*, Void*, Win32cr::Foundation::HRESULT),
    get_ClassFactory : Proc(IServicePoolConfig*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a9690656-5bca-470c-8451-250c1f43a33e")]
  record IServicePoolConfig, lpVtbl : IServicePoolConfigVtbl* do
    GUID = LibC::GUID.new(0xa9690656_u32, 0x5bca_u16, 0x470c_u16, StaticArray[0x84_u8, 0x51_u8, 0x25_u8, 0xc_u8, 0x1f_u8, 0x43_u8, 0xa3_u8, 0x3e_u8])
    def query_interface(this : IServicePoolConfig*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServicePoolConfig*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServicePoolConfig*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def put_MaxPoolSize(this : IServicePoolConfig*, dwMaxPool : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MaxPoolSize.call(this, dwMaxPool)
    end
    def get_MaxPoolSize(this : IServicePoolConfig*, pdwMaxPool : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxPoolSize.call(this, pdwMaxPool)
    end
    def put_MinPoolSize(this : IServicePoolConfig*, dwMinPool : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MinPoolSize.call(this, dwMinPool)
    end
    def get_MinPoolSize(this : IServicePoolConfig*, pdwMinPool : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinPoolSize.call(this, pdwMinPool)
    end
    def put_CreationTimeout(this : IServicePoolConfig*, dwCreationTimeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CreationTimeout.call(this, dwCreationTimeout)
    end
    def get_CreationTimeout(this : IServicePoolConfig*, pdwCreationTimeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTimeout.call(this, pdwCreationTimeout)
    end
    def put_TransactionAffinity(this : IServicePoolConfig*, fTxAffinity : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TransactionAffinity.call(this, fTxAffinity)
    end
    def get_TransactionAffinity(this : IServicePoolConfig*, pfTxAffinity : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionAffinity.call(this, pfTxAffinity)
    end
    def put_ClassFactory(this : IServicePoolConfig*, pFactory : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassFactory.call(this, pFactory)
    end
    def get_ClassFactory(this : IServicePoolConfig*, pFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassFactory.call(this, pFactory)
    end

  end

  @[Extern]
  record IServicePoolVtbl,
    query_interface : Proc(IServicePool*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IServicePool*, UInt32),
    release : Proc(IServicePool*, UInt32),
    initialize__ : Proc(IServicePool*, Void*, Win32cr::Foundation::HRESULT),
    get_object : Proc(IServicePool*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    shutdown : Proc(IServicePool*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b302df81-ea45-451e-99a2-09f9fd1b1e13")]
  record IServicePool, lpVtbl : IServicePoolVtbl* do
    GUID = LibC::GUID.new(0xb302df81_u32, 0xea45_u16, 0x451e_u16, StaticArray[0x99_u8, 0xa2_u8, 0x9_u8, 0xf9_u8, 0xfd_u8, 0x1b_u8, 0x1e_u8, 0x13_u8])
    def query_interface(this : IServicePool*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IServicePool*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IServicePool*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IServicePool*, pPoolConfig : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pPoolConfig)
    end
    def get_object(this : IServicePool*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object.call(this, riid, ppv)
    end
    def shutdown(this : IServicePool*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown.call(this)
    end

  end

  @[Extern]
  record IManagedPooledObjVtbl,
    query_interface : Proc(IManagedPooledObj*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManagedPooledObj*, UInt32),
    release : Proc(IManagedPooledObj*, UInt32),
    set_held : Proc(IManagedPooledObj*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c5da4bea-1b42-4437-8926-b6a38860a770")]
  record IManagedPooledObj, lpVtbl : IManagedPooledObjVtbl* do
    GUID = LibC::GUID.new(0xc5da4bea_u32, 0x1b42_u16, 0x4437_u16, StaticArray[0x89_u8, 0x26_u8, 0xb6_u8, 0xa3_u8, 0x88_u8, 0x60_u8, 0xa7_u8, 0x70_u8])
    def query_interface(this : IManagedPooledObj*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManagedPooledObj*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManagedPooledObj*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_held(this : IManagedPooledObj*, m_bHeld : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_held.call(this, m_bHeld)
    end

  end

  @[Extern]
  record IManagedPoolActionVtbl,
    query_interface : Proc(IManagedPoolAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManagedPoolAction*, UInt32),
    release : Proc(IManagedPoolAction*, UInt32),
    last_release : Proc(IManagedPoolAction*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("da91b74e-5388-4783-949d-c1cd5fb00506")]
  record IManagedPoolAction, lpVtbl : IManagedPoolActionVtbl* do
    GUID = LibC::GUID.new(0xda91b74e_u32, 0x5388_u16, 0x4783_u16, StaticArray[0x94_u8, 0x9d_u8, 0xc1_u8, 0xcd_u8, 0x5f_u8, 0xb0_u8, 0x5_u8, 0x6_u8])
    def query_interface(this : IManagedPoolAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManagedPoolAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManagedPoolAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def last_release(this : IManagedPoolAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.last_release.call(this)
    end

  end

  @[Extern]
  record IManagedObjectInfoVtbl,
    query_interface : Proc(IManagedObjectInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManagedObjectInfo*, UInt32),
    release : Proc(IManagedObjectInfo*, UInt32),
    get_i_unknown : Proc(IManagedObjectInfo*, Void**, Win32cr::Foundation::HRESULT),
    get_i_object_control : Proc(IManagedObjectInfo*, Void**, Win32cr::Foundation::HRESULT),
    set_in_pool : Proc(IManagedObjectInfo*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    set_wrapper_strength : Proc(IManagedObjectInfo*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1427c51a-4584-49d8-90a0-c50d8086cbe9")]
  record IManagedObjectInfo, lpVtbl : IManagedObjectInfoVtbl* do
    GUID = LibC::GUID.new(0x1427c51a_u32, 0x4584_u16, 0x49d8_u16, StaticArray[0x90_u8, 0xa0_u8, 0xc5_u8, 0xd_u8, 0x80_u8, 0x86_u8, 0xcb_u8, 0xe9_u8])
    def query_interface(this : IManagedObjectInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManagedObjectInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManagedObjectInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_i_unknown(this : IManagedObjectInfo*, pUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_unknown.call(this, pUnk)
    end
    def get_i_object_control(this : IManagedObjectInfo*, pCtrl : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_object_control.call(this, pCtrl)
    end
    def set_in_pool(this : IManagedObjectInfo*, bInPool : Win32cr::Foundation::BOOL, pPooledObj : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_in_pool.call(this, bInPool, pPooledObj)
    end
    def set_wrapper_strength(this : IManagedObjectInfo*, bStrong : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_wrapper_strength.call(this, bStrong)
    end

  end

  @[Extern]
  record IAppDomainHelperVtbl,
    query_interface : Proc(IAppDomainHelper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAppDomainHelper*, UInt32),
    release : Proc(IAppDomainHelper*, UInt32),
    get_type_info_count : Proc(IAppDomainHelper*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAppDomainHelper*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAppDomainHelper*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAppDomainHelper*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize__ : Proc(IAppDomainHelper*, Void*, LibC::IntPtrT, Void*, Win32cr::Foundation::HRESULT),
    do_callback : Proc(IAppDomainHelper*, Void*, LibC::IntPtrT, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c7b67079-8255-42c6-9ec0-6994a3548780")]
  record IAppDomainHelper, lpVtbl : IAppDomainHelperVtbl* do
    GUID = LibC::GUID.new(0xc7b67079_u32, 0x8255_u16, 0x42c6_u16, StaticArray[0x9e_u8, 0xc0_u8, 0x69_u8, 0x94_u8, 0xa3_u8, 0x54_u8, 0x87_u8, 0x80_u8])
    def query_interface(this : IAppDomainHelper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAppDomainHelper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAppDomainHelper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAppDomainHelper*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAppDomainHelper*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAppDomainHelper*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAppDomainHelper*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def initialize__(this : IAppDomainHelper*, pUnkAD : Void*, __midl__i_app_domain_helper0000 : LibC::IntPtrT, pPool : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pUnkAD, __midl__i_app_domain_helper0000, pPool)
    end
    def do_callback(this : IAppDomainHelper*, pUnkAD : Void*, __midl__i_app_domain_helper0001 : LibC::IntPtrT, pPool : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_callback.call(this, pUnkAD, __midl__i_app_domain_helper0001, pPool)
    end

  end

  @[Extern]
  record IAssemblyLocatorVtbl,
    query_interface : Proc(IAssemblyLocator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAssemblyLocator*, UInt32),
    release : Proc(IAssemblyLocator*, UInt32),
    get_type_info_count : Proc(IAssemblyLocator*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAssemblyLocator*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAssemblyLocator*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAssemblyLocator*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_modules : Proc(IAssemblyLocator*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("391ffbb9-a8ee-432a-abc8-baa238dab90f")]
  record IAssemblyLocator, lpVtbl : IAssemblyLocatorVtbl* do
    GUID = LibC::GUID.new(0x391ffbb9_u32, 0xa8ee_u16, 0x432a_u16, StaticArray[0xab_u8, 0xc8_u8, 0xba_u8, 0xa2_u8, 0x38_u8, 0xda_u8, 0xb9_u8, 0xf_u8])
    def query_interface(this : IAssemblyLocator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAssemblyLocator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAssemblyLocator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAssemblyLocator*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAssemblyLocator*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAssemblyLocator*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAssemblyLocator*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_modules(this : IAssemblyLocator*, applicationDir : Win32cr::Foundation::BSTR, applicationName : Win32cr::Foundation::BSTR, assemblyName : Win32cr::Foundation::BSTR, pModules : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_modules.call(this, applicationDir, applicationName, assemblyName, pModules)
    end

  end

  @[Extern]
  record IManagedActivationEventsVtbl,
    query_interface : Proc(IManagedActivationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IManagedActivationEvents*, UInt32),
    release : Proc(IManagedActivationEvents*, UInt32),
    create_managed_stub : Proc(IManagedActivationEvents*, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    destroy_managed_stub : Proc(IManagedActivationEvents*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a5f325af-572f-46da-b8ab-827c3d95d99e")]
  record IManagedActivationEvents, lpVtbl : IManagedActivationEventsVtbl* do
    GUID = LibC::GUID.new(0xa5f325af_u32, 0x572f_u16, 0x46da_u16, StaticArray[0xb8_u8, 0xab_u8, 0x82_u8, 0x7c_u8, 0x3d_u8, 0x95_u8, 0xd9_u8, 0x9e_u8])
    def query_interface(this : IManagedActivationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IManagedActivationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IManagedActivationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_managed_stub(this : IManagedActivationEvents*, pInfo : Void*, fDist : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_managed_stub.call(this, pInfo, fDist)
    end
    def destroy_managed_stub(this : IManagedActivationEvents*, pInfo : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_managed_stub.call(this, pInfo)
    end

  end

  @[Extern]
  record ISendMethodEventsVtbl,
    query_interface : Proc(ISendMethodEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISendMethodEvents*, UInt32),
    release : Proc(ISendMethodEvents*, UInt32),
    send_method_call : Proc(ISendMethodEvents*, Void*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    send_method_return : Proc(ISendMethodEvents*, Void*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2732fd59-b2b4-4d44-878c-8b8f09626008")]
  record ISendMethodEvents, lpVtbl : ISendMethodEventsVtbl* do
    GUID = LibC::GUID.new(0x2732fd59_u32, 0xb2b4_u16, 0x4d44_u16, StaticArray[0x87_u8, 0x8c_u8, 0x8b_u8, 0x8f_u8, 0x9_u8, 0x62_u8, 0x60_u8, 0x8_u8])
    def query_interface(this : ISendMethodEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISendMethodEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISendMethodEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def send_method_call(this : ISendMethodEvents*, pIdentity : Void*, riid : LibC::GUID*, dwMeth : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_method_call.call(this, pIdentity, riid, dwMeth)
    end
    def send_method_return(this : ISendMethodEvents*, pIdentity : Void*, riid : LibC::GUID*, dwMeth : UInt32, hrCall : Win32cr::Foundation::HRESULT, hrServer : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_method_return.call(this, pIdentity, riid, dwMeth, hrCall, hrServer)
    end

  end

  @[Extern]
  record ITransactionResourcePoolVtbl,
    query_interface : Proc(ITransactionResourcePool*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionResourcePool*, UInt32),
    release : Proc(ITransactionResourcePool*, UInt32),
    put_resource : Proc(ITransactionResourcePool*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_resource : Proc(ITransactionResourcePool*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c5feb7c1-346a-11d1-b1cc-00aa00ba3258")]
  record ITransactionResourcePool, lpVtbl : ITransactionResourcePoolVtbl* do
    GUID = LibC::GUID.new(0xc5feb7c1_u32, 0x346a_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xcc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : ITransactionResourcePool*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionResourcePool*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionResourcePool*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def put_resource(this : ITransactionResourcePool*, pPool : Void*, pUnk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_resource.call(this, pPool, pUnk)
    end
    def get_resource(this : ITransactionResourcePool*, pPool : Void*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_resource.call(this, pPool, ppUnk)
    end

  end

  @[Extern]
  record IMTSCallVtbl,
    query_interface : Proc(IMTSCall*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMTSCall*, UInt32),
    release : Proc(IMTSCall*, UInt32),
    on_call : Proc(IMTSCall*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372aef-cae7-11cf-be81-00aa00a2fa25")]
  record IMTSCall, lpVtbl : IMTSCallVtbl* do
    GUID = LibC::GUID.new(0x51372aef_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IMTSCall*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMTSCall*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMTSCall*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_call(this : IMTSCall*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_call.call(this)
    end

  end

  @[Extern]
  record IContextPropertiesVtbl,
    query_interface : Proc(IContextProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContextProperties*, UInt32),
    release : Proc(IContextProperties*, UInt32),
    count : Proc(IContextProperties*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IContextProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    enum_names : Proc(IContextProperties*, Void**, Win32cr::Foundation::HRESULT),
    set_property : Proc(IContextProperties*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    remove_property : Proc(IContextProperties*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d396da85-bf8f-11d1-bbae-00c04fc2fa5f")]
  record IContextProperties, lpVtbl : IContextPropertiesVtbl* do
    GUID = LibC::GUID.new(0xd396da85_u32, 0xbf8f_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xae_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xfa_u8, 0x5f_u8])
    def query_interface(this : IContextProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContextProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContextProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def count(this : IContextProperties*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.count.call(this, plCount)
    end
    def get_property(this : IContextProperties*, name : Win32cr::Foundation::BSTR, pProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, name, pProperty)
    end
    def enum_names(this : IContextProperties*, ppenum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_names.call(this, ppenum)
    end
    def set_property(this : IContextProperties*, name : Win32cr::Foundation::BSTR, property : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_property.call(this, name, property)
    end
    def remove_property(this : IContextProperties*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property.call(this, name)
    end

  end

  @[Extern]
  record IObjPoolVtbl,
    query_interface : Proc(IObjPool*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjPool*, UInt32),
    release : Proc(IObjPool*, UInt32),
    reserved1 : Proc(IObjPool*, Void),
    reserved2 : Proc(IObjPool*, Void),
    reserved3 : Proc(IObjPool*, Void),
    reserved4 : Proc(IObjPool*, Void),
    put_end_tx : Proc(IObjPool*, Void*, Void),
    reserved5 : Proc(IObjPool*, Void),
    reserved6 : Proc(IObjPool*, Void)


  @[Extern]
  #@[Com("7d8805a0-2ea7-11d1-b1cc-00aa00ba3258")]
  record IObjPool, lpVtbl : IObjPoolVtbl* do
    GUID = LibC::GUID.new(0x7d8805a0_u32, 0x2ea7_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xcc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xba_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IObjPool*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjPool*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjPool*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reserved1(this : IObjPool*) : Void
      @lpVtbl.try &.value.reserved1.call(this)
    end
    def reserved2(this : IObjPool*) : Void
      @lpVtbl.try &.value.reserved2.call(this)
    end
    def reserved3(this : IObjPool*) : Void
      @lpVtbl.try &.value.reserved3.call(this)
    end
    def reserved4(this : IObjPool*) : Void
      @lpVtbl.try &.value.reserved4.call(this)
    end
    def put_end_tx(this : IObjPool*, pObj : Void*) : Void
      @lpVtbl.try &.value.put_end_tx.call(this, pObj)
    end
    def reserved5(this : IObjPool*) : Void
      @lpVtbl.try &.value.reserved5.call(this)
    end
    def reserved6(this : IObjPool*) : Void
      @lpVtbl.try &.value.reserved6.call(this)
    end

  end

  @[Extern]
  record ITransactionPropertyVtbl,
    query_interface : Proc(ITransactionProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransactionProperty*, UInt32),
    release : Proc(ITransactionProperty*, UInt32),
    reserved1 : Proc(ITransactionProperty*, Void),
    reserved2 : Proc(ITransactionProperty*, Void),
    reserved3 : Proc(ITransactionProperty*, Void),
    reserved4 : Proc(ITransactionProperty*, Void),
    reserved5 : Proc(ITransactionProperty*, Void),
    reserved6 : Proc(ITransactionProperty*, Void),
    reserved7 : Proc(ITransactionProperty*, Void),
    reserved8 : Proc(ITransactionProperty*, Void),
    reserved9 : Proc(ITransactionProperty*, Void),
    get_transaction_resource_pool : Proc(ITransactionProperty*, Void**, Win32cr::Foundation::HRESULT),
    reserved10 : Proc(ITransactionProperty*, Void),
    reserved11 : Proc(ITransactionProperty*, Void),
    reserved12 : Proc(ITransactionProperty*, Void),
    reserved13 : Proc(ITransactionProperty*, Void),
    reserved14 : Proc(ITransactionProperty*, Void),
    reserved15 : Proc(ITransactionProperty*, Void),
    reserved16 : Proc(ITransactionProperty*, Void),
    reserved17 : Proc(ITransactionProperty*, Void)


  @[Extern]
  #@[Com("788ea814-87b1-11d1-bba6-00c04fc2fa5f")]
  record ITransactionProperty, lpVtbl : ITransactionPropertyVtbl* do
    GUID = LibC::GUID.new(0x788ea814_u32, 0x87b1_u16, 0x11d1_u16, StaticArray[0xbb_u8, 0xa6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0xfa_u8, 0x5f_u8])
    def query_interface(this : ITransactionProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransactionProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransactionProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reserved1(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved1.call(this)
    end
    def reserved2(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved2.call(this)
    end
    def reserved3(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved3.call(this)
    end
    def reserved4(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved4.call(this)
    end
    def reserved5(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved5.call(this)
    end
    def reserved6(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved6.call(this)
    end
    def reserved7(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved7.call(this)
    end
    def reserved8(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved8.call(this)
    end
    def reserved9(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved9.call(this)
    end
    def get_transaction_resource_pool(this : ITransactionProperty*, ppTxPool : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_transaction_resource_pool.call(this, ppTxPool)
    end
    def reserved10(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved10.call(this)
    end
    def reserved11(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved11.call(this)
    end
    def reserved12(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved12.call(this)
    end
    def reserved13(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved13.call(this)
    end
    def reserved14(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved14.call(this)
    end
    def reserved15(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved15.call(this)
    end
    def reserved16(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved16.call(this)
    end
    def reserved17(this : ITransactionProperty*) : Void
      @lpVtbl.try &.value.reserved17.call(this)
    end

  end

  @[Extern]
  record IMTSActivityVtbl,
    query_interface : Proc(IMTSActivity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMTSActivity*, UInt32),
    release : Proc(IMTSActivity*, UInt32),
    synchronous_call : Proc(IMTSActivity*, Void*, Win32cr::Foundation::HRESULT),
    async_call : Proc(IMTSActivity*, Void*, Win32cr::Foundation::HRESULT),
    reserved1 : Proc(IMTSActivity*, Void),
    bind_to_current_thread : Proc(IMTSActivity*, Win32cr::Foundation::HRESULT),
    unbind_from_thread : Proc(IMTSActivity*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("51372af0-cae7-11cf-be81-00aa00a2fa25")]
  record IMTSActivity, lpVtbl : IMTSActivityVtbl* do
    GUID = LibC::GUID.new(0x51372af0_u32, 0xcae7_u16, 0x11cf_u16, StaticArray[0xbe_u8, 0x81_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xa2_u8, 0xfa_u8, 0x25_u8])
    def query_interface(this : IMTSActivity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMTSActivity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMTSActivity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def synchronous_call(this : IMTSActivity*, pCall : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.synchronous_call.call(this, pCall)
    end
    def async_call(this : IMTSActivity*, pCall : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.async_call.call(this, pCall)
    end
    def reserved1(this : IMTSActivity*) : Void
      @lpVtbl.try &.value.reserved1.call(this)
    end
    def bind_to_current_thread(this : IMTSActivity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind_to_current_thread.call(this)
    end
    def unbind_from_thread(this : IMTSActivity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unbind_from_thread.call(this)
    end

  end

  @[Link("ole32")]
  @[Link("comsvcs")]
  @[Link("mtxdm")]
  lib C
    fun CoGetDefaultContext(aptType : Win32cr::System::Com::APTTYPE, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT

    fun CoCreateActivity(pIUnknown : Void*, riid : LibC::GUID*, ppObj : Void**) : Win32cr::Foundation::HRESULT

    fun CoEnterServiceDomain(pConfigObject : Void*) : Win32cr::Foundation::HRESULT

    fun CoLeaveServiceDomain(pUnkStatus : Void*) : Void

    fun GetManagedExtensions(dwExts : UInt32*) : Win32cr::Foundation::HRESULT

    fun SafeRef(rid : LibC::GUID*, pUnk : Void*) : Void*

    fun RecycleSurrogate(lReasonCode : Int32) : Win32cr::Foundation::HRESULT

    fun MTSCreateActivity(riid : LibC::GUID*, ppobj : Void**) : Win32cr::Foundation::HRESULT

    fun GetDispenserManager(param0 : Void**) : Win32cr::Foundation::HRESULT

  end
end