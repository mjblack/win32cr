require "../foundation.cr"
require "../security.cr"
require "../security/cryptography.cr"
require "../system/com.cr"
require "../system/registry.cr"
require "../data/xml/msxml.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:netapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:mstask.dll")]
@[Link(ldflags: "/DELAYLOAD:rtutils.dll")]
{% else %}
@[Link("netapi32")]
@[Link("mstask")]
@[Link("rtutils")]
{% end %}
lib LibWin32
  NERR_BASE = 2100_u32
  NERR_PasswordExpired = 2242_u32
  CNLEN = 15_u32
  LM20_CNLEN = 15_u32
  DNLEN = 15_u32
  LM20_DNLEN = 15_u32
  UNCLEN = 17_u32
  LM20_UNCLEN = 17_u32
  LM20_NNLEN = 12_u32
  SNLEN = 80_u32
  LM20_SNLEN = 15_u32
  STXTLEN = 256_u32
  LM20_STXTLEN = 63_u32
  PATHLEN = 256_u32
  LM20_PATHLEN = 256_u32
  DEVLEN = 80_u32
  LM20_DEVLEN = 8_u32
  EVLEN = 16_u32
  UNLEN = 256_u32
  LM20_UNLEN = 20_u32
  GNLEN = 256_u32
  LM20_GNLEN = 20_u32
  PWLEN = 256_u32
  LM20_PWLEN = 14_u32
  SHPWLEN = 8_u32
  CLTYPE_LEN = 12_u32
  MAXCOMMENTSZ = 256_u32
  LM20_MAXCOMMENTSZ = 48_u32
  QNLEN = 80_u32
  LM20_QNLEN = 12_u32
  ALERTSZ = 128_u32
  NETBIOS_NAME_LEN = 16_u32
  MAX_PREFERRED_LENGTH = 4294967295_u32
  CRYPT_KEY_LEN = 7_u32
  CRYPT_TXT_LEN = 8_u32
  ENCRYPTED_PWLEN = 16_u32
  SESSION_PWLEN = 24_u32
  SESSION_CRYPT_KLEN = 21_u32
  PARMNUM_ALL = 0_u32
  PARM_ERROR_UNKNOWN = 4294967295_u32
  PARM_ERROR_NONE = 0_u32
  PARMNUM_BASE_INFOLEVEL = 1000_u32
  PLATFORM_ID_DOS = 300_u32
  PLATFORM_ID_OS2 = 400_u32
  PLATFORM_ID_NT = 500_u32
  PLATFORM_ID_OSF = 600_u32
  PLATFORM_ID_VMS = 700_u32
  MIN_LANMAN_MESSAGE_ID = 2100_u32
  MAX_LANMAN_MESSAGE_ID = 5899_u32
  NERR_Success = 0_u32
  NERR_NetNotStarted = 2102_u32
  NERR_UnknownServer = 2103_u32
  NERR_ShareMem = 2104_u32
  NERR_NoNetworkResource = 2105_u32
  NERR_RemoteOnly = 2106_u32
  NERR_DevNotRedirected = 2107_u32
  NERR_ServerNotStarted = 2114_u32
  NERR_ItemNotFound = 2115_u32
  NERR_UnknownDevDir = 2116_u32
  NERR_RedirectedPath = 2117_u32
  NERR_DuplicateShare = 2118_u32
  NERR_NoRoom = 2119_u32
  NERR_TooManyItems = 2121_u32
  NERR_InvalidMaxUsers = 2122_u32
  NERR_BufTooSmall = 2123_u32
  NERR_RemoteErr = 2127_u32
  NERR_LanmanIniError = 2131_u32
  NERR_NetworkError = 2136_u32
  NERR_WkstaInconsistentState = 2137_u32
  NERR_WkstaNotStarted = 2138_u32
  NERR_BrowserNotStarted = 2139_u32
  NERR_InternalError = 2140_u32
  NERR_BadTransactConfig = 2141_u32
  NERR_InvalidAPI = 2142_u32
  NERR_BadEventName = 2143_u32
  NERR_DupNameReboot = 2144_u32
  NERR_CfgCompNotFound = 2146_u32
  NERR_CfgParamNotFound = 2147_u32
  NERR_LineTooLong = 2149_u32
  NERR_QNotFound = 2150_u32
  NERR_JobNotFound = 2151_u32
  NERR_DestNotFound = 2152_u32
  NERR_DestExists = 2153_u32
  NERR_QExists = 2154_u32
  NERR_QNoRoom = 2155_u32
  NERR_JobNoRoom = 2156_u32
  NERR_DestNoRoom = 2157_u32
  NERR_DestIdle = 2158_u32
  NERR_DestInvalidOp = 2159_u32
  NERR_ProcNoRespond = 2160_u32
  NERR_SpoolerNotLoaded = 2161_u32
  NERR_DestInvalidState = 2162_u32
  NERR_QInvalidState = 2163_u32
  NERR_JobInvalidState = 2164_u32
  NERR_SpoolNoMemory = 2165_u32
  NERR_DriverNotFound = 2166_u32
  NERR_DataTypeInvalid = 2167_u32
  NERR_ProcNotFound = 2168_u32
  NERR_ServiceTableLocked = 2180_u32
  NERR_ServiceTableFull = 2181_u32
  NERR_ServiceInstalled = 2182_u32
  NERR_ServiceEntryLocked = 2183_u32
  NERR_ServiceNotInstalled = 2184_u32
  NERR_BadServiceName = 2185_u32
  NERR_ServiceCtlTimeout = 2186_u32
  NERR_ServiceCtlBusy = 2187_u32
  NERR_BadServiceProgName = 2188_u32
  NERR_ServiceNotCtrl = 2189_u32
  NERR_ServiceKillProc = 2190_u32
  NERR_ServiceCtlNotValid = 2191_u32
  NERR_NotInDispatchTbl = 2192_u32
  NERR_BadControlRecv = 2193_u32
  NERR_ServiceNotStarting = 2194_u32
  NERR_AlreadyLoggedOn = 2200_u32
  NERR_NotLoggedOn = 2201_u32
  NERR_BadUsername = 2202_u32
  NERR_BadPassword = 2203_u32
  NERR_UnableToAddName_W = 2204_u32
  NERR_UnableToAddName_F = 2205_u32
  NERR_UnableToDelName_W = 2206_u32
  NERR_UnableToDelName_F = 2207_u32
  NERR_LogonsPaused = 2209_u32
  NERR_LogonServerConflict = 2210_u32
  NERR_LogonNoUserPath = 2211_u32
  NERR_LogonScriptError = 2212_u32
  NERR_StandaloneLogon = 2214_u32
  NERR_LogonServerNotFound = 2215_u32
  NERR_LogonDomainExists = 2216_u32
  NERR_NonValidatedLogon = 2217_u32
  NERR_ACFNotFound = 2219_u32
  NERR_GroupNotFound = 2220_u32
  NERR_UserNotFound = 2221_u32
  NERR_ResourceNotFound = 2222_u32
  NERR_GroupExists = 2223_u32
  NERR_UserExists = 2224_u32
  NERR_ResourceExists = 2225_u32
  NERR_NotPrimary = 2226_u32
  NERR_ACFNotLoaded = 2227_u32
  NERR_ACFNoRoom = 2228_u32
  NERR_ACFFileIOFail = 2229_u32
  NERR_ACFTooManyLists = 2230_u32
  NERR_UserLogon = 2231_u32
  NERR_ACFNoParent = 2232_u32
  NERR_CanNotGrowSegment = 2233_u32
  NERR_SpeGroupOp = 2234_u32
  NERR_NotInCache = 2235_u32
  NERR_UserInGroup = 2236_u32
  NERR_UserNotInGroup = 2237_u32
  NERR_AccountUndefined = 2238_u32
  NERR_AccountExpired = 2239_u32
  NERR_InvalidWorkstation = 2240_u32
  NERR_InvalidLogonHours = 2241_u32
  NERR_PasswordCantChange = 2243_u32
  NERR_PasswordHistConflict = 2244_u32
  NERR_PasswordTooShort = 2245_u32
  NERR_PasswordTooRecent = 2246_u32
  NERR_InvalidDatabase = 2247_u32
  NERR_DatabaseUpToDate = 2248_u32
  NERR_SyncRequired = 2249_u32
  NERR_UseNotFound = 2250_u32
  NERR_BadAsgType = 2251_u32
  NERR_DeviceIsShared = 2252_u32
  NERR_SameAsComputerName = 2253_u32
  NERR_NoComputerName = 2270_u32
  NERR_MsgAlreadyStarted = 2271_u32
  NERR_MsgInitFailed = 2272_u32
  NERR_NameNotFound = 2273_u32
  NERR_AlreadyForwarded = 2274_u32
  NERR_AddForwarded = 2275_u32
  NERR_AlreadyExists = 2276_u32
  NERR_TooManyNames = 2277_u32
  NERR_DelComputerName = 2278_u32
  NERR_LocalForward = 2279_u32
  NERR_GrpMsgProcessor = 2280_u32
  NERR_PausedRemote = 2281_u32
  NERR_BadReceive = 2282_u32
  NERR_NameInUse = 2283_u32
  NERR_MsgNotStarted = 2284_u32
  NERR_NotLocalName = 2285_u32
  NERR_NoForwardName = 2286_u32
  NERR_RemoteFull = 2287_u32
  NERR_NameNotForwarded = 2288_u32
  NERR_TruncatedBroadcast = 2289_u32
  NERR_InvalidDevice = 2294_u32
  NERR_WriteFault = 2295_u32
  NERR_DuplicateName = 2297_u32
  NERR_DeleteLater = 2298_u32
  NERR_IncompleteDel = 2299_u32
  NERR_MultipleNets = 2300_u32
  NERR_NetNameNotFound = 2310_u32
  NERR_DeviceNotShared = 2311_u32
  NERR_ClientNameNotFound = 2312_u32
  NERR_FileIdNotFound = 2314_u32
  NERR_ExecFailure = 2315_u32
  NERR_TmpFile = 2316_u32
  NERR_TooMuchData = 2317_u32
  NERR_DeviceShareConflict = 2318_u32
  NERR_BrowserTableIncomplete = 2319_u32
  NERR_NotLocalDomain = 2320_u32
  NERR_IsDfsShare = 2321_u32
  NERR_DevInvalidOpCode = 2331_u32
  NERR_DevNotFound = 2332_u32
  NERR_DevNotOpen = 2333_u32
  NERR_BadQueueDevString = 2334_u32
  NERR_BadQueuePriority = 2335_u32
  NERR_NoCommDevs = 2337_u32
  NERR_QueueNotFound = 2338_u32
  NERR_BadDevString = 2340_u32
  NERR_BadDev = 2341_u32
  NERR_InUseBySpooler = 2342_u32
  NERR_CommDevInUse = 2343_u32
  NERR_InvalidComputer = 2351_u32
  NERR_MaxLenExceeded = 2354_u32
  NERR_BadComponent = 2356_u32
  NERR_CantType = 2357_u32
  NERR_TooManyEntries = 2362_u32
  NERR_ProfileFileTooBig = 2370_u32
  NERR_ProfileOffset = 2371_u32
  NERR_ProfileCleanup = 2372_u32
  NERR_ProfileUnknownCmd = 2373_u32
  NERR_ProfileLoadErr = 2374_u32
  NERR_ProfileSaveErr = 2375_u32
  NERR_LogOverflow = 2377_u32
  NERR_LogFileChanged = 2378_u32
  NERR_LogFileCorrupt = 2379_u32
  NERR_SourceIsDir = 2380_u32
  NERR_BadSource = 2381_u32
  NERR_BadDest = 2382_u32
  NERR_DifferentServers = 2383_u32
  NERR_RunSrvPaused = 2385_u32
  NERR_ErrCommRunSrv = 2389_u32
  NERR_ErrorExecingGhost = 2391_u32
  NERR_ShareNotFound = 2392_u32
  NERR_InvalidLana = 2400_u32
  NERR_OpenFiles = 2401_u32
  NERR_ActiveConns = 2402_u32
  NERR_BadPasswordCore = 2403_u32
  NERR_DevInUse = 2404_u32
  NERR_LocalDrive = 2405_u32
  NERR_AlertExists = 2430_u32
  NERR_TooManyAlerts = 2431_u32
  NERR_NoSuchAlert = 2432_u32
  NERR_BadRecipient = 2433_u32
  NERR_AcctLimitExceeded = 2434_u32
  NERR_InvalidLogSeek = 2440_u32
  NERR_BadUasConfig = 2450_u32
  NERR_InvalidUASOp = 2451_u32
  NERR_LastAdmin = 2452_u32
  NERR_DCNotFound = 2453_u32
  NERR_LogonTrackingError = 2454_u32
  NERR_NetlogonNotStarted = 2455_u32
  NERR_CanNotGrowUASFile = 2456_u32
  NERR_TimeDiffAtDC = 2457_u32
  NERR_PasswordMismatch = 2458_u32
  NERR_NoSuchServer = 2460_u32
  NERR_NoSuchSession = 2461_u32
  NERR_NoSuchConnection = 2462_u32
  NERR_TooManyServers = 2463_u32
  NERR_TooManySessions = 2464_u32
  NERR_TooManyConnections = 2465_u32
  NERR_TooManyFiles = 2466_u32
  NERR_NoAlternateServers = 2467_u32
  NERR_TryDownLevel = 2470_u32
  NERR_UPSDriverNotStarted = 2480_u32
  NERR_UPSInvalidConfig = 2481_u32
  NERR_UPSInvalidCommPort = 2482_u32
  NERR_UPSSignalAsserted = 2483_u32
  NERR_UPSShutdownFailed = 2484_u32
  NERR_BadDosRetCode = 2500_u32
  NERR_ProgNeedsExtraMem = 2501_u32
  NERR_BadDosFunction = 2502_u32
  NERR_RemoteBootFailed = 2503_u32
  NERR_BadFileCheckSum = 2504_u32
  NERR_NoRplBootSystem = 2505_u32
  NERR_RplLoadrNetBiosErr = 2506_u32
  NERR_RplLoadrDiskErr = 2507_u32
  NERR_ImageParamErr = 2508_u32
  NERR_TooManyImageParams = 2509_u32
  NERR_NonDosFloppyUsed = 2510_u32
  NERR_RplBootRestart = 2511_u32
  NERR_RplSrvrCallFailed = 2512_u32
  NERR_CantConnectRplSrvr = 2513_u32
  NERR_CantOpenImageFile = 2514_u32
  NERR_CallingRplSrvr = 2515_u32
  NERR_StartingRplBoot = 2516_u32
  NERR_RplBootServiceTerm = 2517_u32
  NERR_RplBootStartFailed = 2518_u32
  NERR_RPL_CONNECTED = 2519_u32
  NERR_BrowserConfiguredToNotRun = 2550_u32
  NERR_RplNoAdaptersStarted = 2610_u32
  NERR_RplBadRegistry = 2611_u32
  NERR_RplBadDatabase = 2612_u32
  NERR_RplRplfilesShare = 2613_u32
  NERR_RplNotRplServer = 2614_u32
  NERR_RplCannotEnum = 2615_u32
  NERR_RplWkstaInfoCorrupted = 2616_u32
  NERR_RplWkstaNotFound = 2617_u32
  NERR_RplWkstaNameUnavailable = 2618_u32
  NERR_RplProfileInfoCorrupted = 2619_u32
  NERR_RplProfileNotFound = 2620_u32
  NERR_RplProfileNameUnavailable = 2621_u32
  NERR_RplProfileNotEmpty = 2622_u32
  NERR_RplConfigInfoCorrupted = 2623_u32
  NERR_RplConfigNotFound = 2624_u32
  NERR_RplAdapterInfoCorrupted = 2625_u32
  NERR_RplInternal = 2626_u32
  NERR_RplVendorInfoCorrupted = 2627_u32
  NERR_RplBootInfoCorrupted = 2628_u32
  NERR_RplWkstaNeedsUserAcct = 2629_u32
  NERR_RplNeedsRPLUSERAcct = 2630_u32
  NERR_RplBootNotFound = 2631_u32
  NERR_RplIncompatibleProfile = 2632_u32
  NERR_RplAdapterNameUnavailable = 2633_u32
  NERR_RplConfigNotEmpty = 2634_u32
  NERR_RplBootInUse = 2635_u32
  NERR_RplBackupDatabase = 2636_u32
  NERR_RplAdapterNotFound = 2637_u32
  NERR_RplVendorNotFound = 2638_u32
  NERR_RplVendorNameUnavailable = 2639_u32
  NERR_RplBootNameUnavailable = 2640_u32
  NERR_RplConfigNameUnavailable = 2641_u32
  NERR_DfsInternalCorruption = 2660_u32
  NERR_DfsVolumeDataCorrupt = 2661_u32
  NERR_DfsNoSuchVolume = 2662_u32
  NERR_DfsVolumeAlreadyExists = 2663_u32
  NERR_DfsAlreadyShared = 2664_u32
  NERR_DfsNoSuchShare = 2665_u32
  NERR_DfsNotALeafVolume = 2666_u32
  NERR_DfsLeafVolume = 2667_u32
  NERR_DfsVolumeHasMultipleServers = 2668_u32
  NERR_DfsCantCreateJunctionPoint = 2669_u32
  NERR_DfsServerNotDfsAware = 2670_u32
  NERR_DfsBadRenamePath = 2671_u32
  NERR_DfsVolumeIsOffline = 2672_u32
  NERR_DfsNoSuchServer = 2673_u32
  NERR_DfsCyclicalName = 2674_u32
  NERR_DfsNotSupportedInServerDfs = 2675_u32
  NERR_DfsDuplicateService = 2676_u32
  NERR_DfsCantRemoveLastServerShare = 2677_u32
  NERR_DfsVolumeIsInterDfs = 2678_u32
  NERR_DfsInconsistent = 2679_u32
  NERR_DfsServerUpgraded = 2680_u32
  NERR_DfsDataIsIdentical = 2681_u32
  NERR_DfsCantRemoveDfsRoot = 2682_u32
  NERR_DfsChildOrParentInDfs = 2683_u32
  NERR_DfsInternalError = 2690_u32
  NERR_SetupAlreadyJoined = 2691_u32
  NERR_SetupNotJoined = 2692_u32
  NERR_SetupDomainController = 2693_u32
  NERR_DefaultJoinRequired = 2694_u32
  NERR_InvalidWorkgroupName = 2695_u32
  NERR_NameUsesIncompatibleCodePage = 2696_u32
  NERR_ComputerAccountNotFound = 2697_u32
  NERR_PersonalSku = 2698_u32
  NERR_SetupCheckDNSConfig = 2699_u32
  NERR_AlreadyCloudDomainJoined = 2700_u32
  NERR_PasswordMustChange = 2701_u32
  NERR_AccountLockedOut = 2702_u32
  NERR_PasswordTooLong = 2703_u32
  NERR_PasswordNotComplexEnough = 2704_u32
  NERR_PasswordFilterError = 2705_u32
  NERR_NoOfflineJoinInfo = 2709_u32
  NERR_BadOfflineJoinInfo = 2710_u32
  NERR_CantCreateJoinInfo = 2711_u32
  NERR_BadDomainJoinInfo = 2712_u32
  NERR_JoinPerformedMustRestart = 2713_u32
  NERR_NoJoinPending = 2714_u32
  NERR_ValuesNotSet = 2715_u32
  NERR_CantVerifyHostname = 2716_u32
  NERR_CantLoadOfflineHive = 2717_u32
  NERR_ConnectionInsecure = 2718_u32
  NERR_ProvisioningBlobUnsupported = 2719_u32
  NERR_DS8DCRequired = 2720_u32
  NERR_LDAPCapableDCRequired = 2721_u32
  NERR_DS8DCNotFound = 2722_u32
  NERR_TargetVersionUnsupported = 2723_u32
  NERR_InvalidMachineNameForJoin = 2724_u32
  NERR_DS9DCNotFound = 2725_u32
  NERR_PlainTextSecretsRequired = 2726_u32
  NERR_CannotUnjoinAadDomain = 2727_u32
  MAX_NERR = 2999_u32
  UF_TEMP_DUPLICATE_ACCOUNT = 256_u32
  UF_NORMAL_ACCOUNT = 512_u32
  UF_INTERDOMAIN_TRUST_ACCOUNT = 2048_u32
  UF_WORKSTATION_TRUST_ACCOUNT = 4096_u32
  UF_SERVER_TRUST_ACCOUNT = 8192_u32
  UF_MNS_LOGON_ACCOUNT = 131072_u32
  UF_NO_AUTH_DATA_REQUIRED = 33554432_u32
  UF_PARTIAL_SECRETS_ACCOUNT = 67108864_u32
  UF_USE_AES_KEYS = 134217728_u32
  LG_INCLUDE_INDIRECT = 1_u32
  USER_NAME_PARMNUM = 1_u32
  USER_PASSWORD_PARMNUM = 3_u32
  USER_PASSWORD_AGE_PARMNUM = 4_u32
  USER_PRIV_PARMNUM = 5_u32
  USER_HOME_DIR_PARMNUM = 6_u32
  USER_COMMENT_PARMNUM = 7_u32
  USER_FLAGS_PARMNUM = 8_u32
  USER_SCRIPT_PATH_PARMNUM = 9_u32
  USER_AUTH_FLAGS_PARMNUM = 10_u32
  USER_FULL_NAME_PARMNUM = 11_u32
  USER_USR_COMMENT_PARMNUM = 12_u32
  USER_PARMS_PARMNUM = 13_u32
  USER_WORKSTATIONS_PARMNUM = 14_u32
  USER_LAST_LOGON_PARMNUM = 15_u32
  USER_LAST_LOGOFF_PARMNUM = 16_u32
  USER_ACCT_EXPIRES_PARMNUM = 17_u32
  USER_MAX_STORAGE_PARMNUM = 18_u32
  USER_UNITS_PER_WEEK_PARMNUM = 19_u32
  USER_LOGON_HOURS_PARMNUM = 20_u32
  USER_PAD_PW_COUNT_PARMNUM = 21_u32
  USER_NUM_LOGONS_PARMNUM = 22_u32
  USER_LOGON_SERVER_PARMNUM = 23_u32
  USER_COUNTRY_CODE_PARMNUM = 24_u32
  USER_CODE_PAGE_PARMNUM = 25_u32
  USER_PRIMARY_GROUP_PARMNUM = 51_u32
  USER_PROFILE = 52_u32
  USER_PROFILE_PARMNUM = 52_u32
  USER_HOME_DIR_DRIVE_PARMNUM = 53_u32
  UNITS_PER_DAY = 24_u32
  USER_PRIV_MASK = 3_u32
  MAX_PASSWD_LEN = 256_u32
  DEF_MIN_PWLEN = 6_u32
  DEF_PWUNIQUENESS = 5_u32
  DEF_MAX_PWHIST = 8_u32
  DEF_MAX_BADPW = 0_u32
  VALIDATED_LOGON = 0_u32
  PASSWORD_EXPIRED = 2_u32
  NON_VALIDATED_LOGON = 3_u32
  VALID_LOGOFF = 1_u32
  MODALS_MIN_PASSWD_LEN_PARMNUM = 1_u32
  MODALS_MAX_PASSWD_AGE_PARMNUM = 2_u32
  MODALS_MIN_PASSWD_AGE_PARMNUM = 3_u32
  MODALS_FORCE_LOGOFF_PARMNUM = 4_u32
  MODALS_PASSWD_HIST_LEN_PARMNUM = 5_u32
  MODALS_ROLE_PARMNUM = 6_u32
  MODALS_PRIMARY_PARMNUM = 7_u32
  MODALS_DOMAIN_NAME_PARMNUM = 8_u32
  MODALS_DOMAIN_ID_PARMNUM = 9_u32
  MODALS_LOCKOUT_DURATION_PARMNUM = 10_u32
  MODALS_LOCKOUT_OBSERVATION_WINDOW_PARMNUM = 11_u32
  MODALS_LOCKOUT_THRESHOLD_PARMNUM = 12_u32
  GROUPIDMASK = 32768_u32
  GROUP_ALL_PARMNUM = 0_u32
  GROUP_NAME_PARMNUM = 1_u32
  GROUP_COMMENT_PARMNUM = 2_u32
  GROUP_ATTRIBUTES_PARMNUM = 3_u32
  LOCALGROUP_NAME_PARMNUM = 1_u32
  LOCALGROUP_COMMENT_PARMNUM = 2_u32
  MAXPERMENTRIES = 64_u32
  ACCESS_NONE = 0_u32
  ACCESS_GROUP = 32768_u32
  ACCESS_AUDIT = 1_u32
  ACCESS_SUCCESS_OPEN = 16_u32
  ACCESS_SUCCESS_WRITE = 32_u32
  ACCESS_SUCCESS_DELETE = 64_u32
  ACCESS_SUCCESS_ACL = 128_u32
  ACCESS_SUCCESS_MASK = 240_u32
  ACCESS_FAIL_OPEN = 256_u32
  ACCESS_FAIL_WRITE = 512_u32
  ACCESS_FAIL_DELETE = 1024_u32
  ACCESS_FAIL_ACL = 2048_u32
  ACCESS_FAIL_MASK = 3840_u32
  ACCESS_FAIL_SHIFT = 4_u32
  ACCESS_RESOURCE_NAME_PARMNUM = 1_u32
  ACCESS_ATTR_PARMNUM = 2_u32
  ACCESS_COUNT_PARMNUM = 3_u32
  ACCESS_ACCESS_LIST_PARMNUM = 4_u32
  NET_VALIDATE_PASSWORD_LAST_SET = 1_u32
  NET_VALIDATE_BAD_PASSWORD_TIME = 2_u32
  NET_VALIDATE_LOCKOUT_TIME = 4_u32
  NET_VALIDATE_BAD_PASSWORD_COUNT = 8_u32
  NET_VALIDATE_PASSWORD_HISTORY_LENGTH = 16_u32
  NET_VALIDATE_PASSWORD_HISTORY = 32_u32
  NETLOGON_CONTROL_QUERY = 1_u32
  NETLOGON_CONTROL_REPLICATE = 2_u32
  NETLOGON_CONTROL_SYNCHRONIZE = 3_u32
  NETLOGON_CONTROL_PDC_REPLICATE = 4_u32
  NETLOGON_CONTROL_REDISCOVER = 5_u32
  NETLOGON_CONTROL_TC_QUERY = 6_u32
  NETLOGON_CONTROL_TRANSPORT_NOTIFY = 7_u32
  NETLOGON_CONTROL_FIND_USER = 8_u32
  NETLOGON_CONTROL_CHANGE_PASSWORD = 9_u32
  NETLOGON_CONTROL_TC_VERIFY = 10_u32
  NETLOGON_CONTROL_FORCE_DNS_REG = 11_u32
  NETLOGON_CONTROL_QUERY_DNS_REG = 12_u32
  NETLOGON_CONTROL_QUERY_ENC_TYPES = 13_u32
  NETLOGON_CONTROL_UNLOAD_NETLOGON_DLL = 65531_u32
  NETLOGON_CONTROL_BACKUP_CHANGE_LOG = 65532_u32
  NETLOGON_CONTROL_TRUNCATE_LOG = 65533_u32
  NETLOGON_CONTROL_SET_DBFLAG = 65534_u32
  NETLOGON_CONTROL_BREAKPOINT = 65535_u32
  NETLOGON_REPLICATION_NEEDED = 1_u32
  NETLOGON_REPLICATION_IN_PROGRESS = 2_u32
  NETLOGON_FULL_SYNC_REPLICATION = 4_u32
  NETLOGON_REDO_NEEDED = 8_u32
  NETLOGON_HAS_IP = 16_u32
  NETLOGON_HAS_TIMESERV = 32_u32
  NETLOGON_DNS_UPDATE_FAILURE = 64_u32
  NETLOGON_VERIFY_STATUS_RETURNED = 128_u32
  ServiceAccountPasswordGUID = "262e99c9-6160-4871-acec-4e61736b6f21"
  SERVICE_ACCOUNT_FLAG_LINK_TO_HOST_ONLY = 1_i32
  SERVICE_ACCOUNT_FLAG_ADD_AGAINST_RODC = 2_i32
  SERVICE_ACCOUNT_FLAG_UNLINK_FROM_HOST_ONLY = 1_i32
  SERVICE_ACCOUNT_FLAG_REMOVE_OFFLINE = 2_i32
  PRJOB_QSTATUS = 3_u32
  PRJOB_DEVSTATUS = 508_u32
  PRJOB_COMPLETE = 4_u32
  PRJOB_INTERV = 8_u32
  PRJOB_ERROR = 16_u32
  PRJOB_DESTOFFLINE = 32_u32
  PRJOB_DESTPAUSED = 64_u32
  PRJOB_NOTIFY = 128_u32
  PRJOB_DESTNOPAPER = 256_u32
  PRJOB_DELETED = 32768_u32
  PRJOB_QS_QUEUED = 0_u32
  PRJOB_QS_PAUSED = 1_u32
  PRJOB_QS_SPOOLING = 2_u32
  PRJOB_QS_PRINTING = 3_u32
  JOB_RUN_PERIODICALLY = 1_u32
  JOB_EXEC_ERROR = 2_u32
  JOB_RUNS_TODAY = 4_u32
  JOB_ADD_CURRENT_DATE = 8_u32
  JOB_NONINTERACTIVE = 16_u32
  LOGFLAGS_FORWARD = 0_u32
  LOGFLAGS_BACKWARD = 1_u32
  LOGFLAGS_SEEK = 2_u32
  ACTION_LOCKOUT = 0_u32
  ACTION_ADMINUNLOCK = 1_u32
  AE_SRVSTATUS = 0_u32
  AE_SESSLOGON = 1_u32
  AE_SESSLOGOFF = 2_u32
  AE_SESSPWERR = 3_u32
  AE_CONNSTART = 4_u32
  AE_CONNSTOP = 5_u32
  AE_CONNREJ = 6_u32
  AE_RESACCESS = 7_u32
  AE_RESACCESSREJ = 8_u32
  AE_CLOSEFILE = 9_u32
  AE_SERVICESTAT = 11_u32
  AE_ACLMOD = 12_u32
  AE_UASMOD = 13_u32
  AE_NETLOGON = 14_u32
  AE_NETLOGOFF = 15_u32
  AE_NETLOGDENIED = 16_u32
  AE_ACCLIMITEXCD = 17_u32
  AE_RESACCESS2 = 18_u32
  AE_ACLMODFAIL = 19_u32
  AE_LOCKOUT = 20_u32
  AE_GENERIC_TYPE = 21_u32
  AE_SRVSTART = 0_u32
  AE_SRVPAUSED = 1_u32
  AE_SRVCONT = 2_u32
  AE_SRVSTOP = 3_u32
  AE_GUEST = 0_u32
  AE_USER = 1_u32
  AE_ADMIN = 2_u32
  AE_NORMAL = 0_u32
  AE_USERLIMIT = 0_u32
  AE_GENERAL = 0_u32
  AE_ERROR = 1_u32
  AE_SESSDIS = 1_u32
  AE_BADPW = 1_u32
  AE_AUTODIS = 2_u32
  AE_UNSHARE = 2_u32
  AE_ADMINPRIVREQD = 2_u32
  AE_ADMINDIS = 3_u32
  AE_NOACCESSPERM = 3_u32
  AE_ACCRESTRICT = 4_u32
  AE_NORMAL_CLOSE = 0_u32
  AE_SES_CLOSE = 1_u32
  AE_ADMIN_CLOSE = 2_u32
  AE_LIM_UNKNOWN = 0_u32
  AE_LIM_LOGONHOURS = 1_u32
  AE_LIM_EXPIRED = 2_u32
  AE_LIM_INVAL_WKSTA = 3_u32
  AE_LIM_DISABLED = 4_u32
  AE_LIM_DELETED = 5_u32
  AE_MOD = 0_u32
  AE_DELETE = 1_u32
  AE_ADD = 2_u32
  AE_UAS_USER = 0_u32
  AE_UAS_GROUP = 1_u32
  AE_UAS_MODALS = 2_u32
  SVAUD_SERVICE = 1_u32
  SVAUD_GOODSESSLOGON = 6_u32
  SVAUD_BADSESSLOGON = 24_u32
  SVAUD_GOODNETLOGON = 96_u32
  SVAUD_BADNETLOGON = 384_u32
  SVAUD_GOODUSE = 1536_u32
  SVAUD_BADUSE = 6144_u32
  SVAUD_USERLIST = 8192_u32
  SVAUD_PERMISSIONS = 16384_u32
  SVAUD_RESOURCE = 32768_u32
  SVAUD_LOGONLIM = 65536_u32
  AA_AUDIT_ALL = 1_u32
  AA_A_OWNER = 4_u32
  AA_CLOSE = 8_u32
  AA_S_OPEN = 16_u32
  AA_S_WRITE = 32_u32
  AA_S_CREATE = 32_u32
  AA_S_DELETE = 64_u32
  AA_S_ACL = 128_u32
  AA_F_OPEN = 256_u32
  AA_F_WRITE = 512_u32
  AA_F_CREATE = 512_u32
  AA_F_DELETE = 1024_u32
  AA_F_ACL = 2048_u32
  AA_A_OPEN = 4096_u32
  AA_A_WRITE = 8192_u32
  AA_A_CREATE = 8192_u32
  AA_A_DELETE = 16384_u32
  AA_A_ACL = 32768_u32
  ERRLOG_BASE = 3100_u32
  NELOG_Internal_Error = 3100_u32
  NELOG_Resource_Shortage = 3101_u32
  NELOG_Unable_To_Lock_Segment = 3102_u32
  NELOG_Unable_To_Unlock_Segment = 3103_u32
  NELOG_Uninstall_Service = 3104_u32
  NELOG_Init_Exec_Fail = 3105_u32
  NELOG_Ncb_Error = 3106_u32
  NELOG_Net_Not_Started = 3107_u32
  NELOG_Ioctl_Error = 3108_u32
  NELOG_System_Semaphore = 3109_u32
  NELOG_Init_OpenCreate_Err = 3110_u32
  NELOG_NetBios = 3111_u32
  NELOG_SMB_Illegal = 3112_u32
  NELOG_Service_Fail = 3113_u32
  NELOG_Entries_Lost = 3114_u32
  NELOG_Init_Seg_Overflow = 3120_u32
  NELOG_Srv_No_Mem_Grow = 3121_u32
  NELOG_Access_File_Bad = 3122_u32
  NELOG_Srvnet_Not_Started = 3123_u32
  NELOG_Init_Chardev_Err = 3124_u32
  NELOG_Remote_API = 3125_u32
  NELOG_Ncb_TooManyErr = 3126_u32
  NELOG_Mailslot_err = 3127_u32
  NELOG_ReleaseMem_Alert = 3128_u32
  NELOG_AT_cannot_write = 3129_u32
  NELOG_Cant_Make_Msg_File = 3130_u32
  NELOG_Exec_Netservr_NoMem = 3131_u32
  NELOG_Server_Lock_Failure = 3132_u32
  NELOG_Msg_Shutdown = 3140_u32
  NELOG_Msg_Sem_Shutdown = 3141_u32
  NELOG_Msg_Log_Err = 3150_u32
  NELOG_VIO_POPUP_ERR = 3151_u32
  NELOG_Msg_Unexpected_SMB_Type = 3152_u32
  NELOG_Wksta_Infoseg = 3160_u32
  NELOG_Wksta_Compname = 3161_u32
  NELOG_Wksta_BiosThreadFailure = 3162_u32
  NELOG_Wksta_IniSeg = 3163_u32
  NELOG_Wksta_HostTab_Full = 3164_u32
  NELOG_Wksta_Bad_Mailslot_SMB = 3165_u32
  NELOG_Wksta_UASInit = 3166_u32
  NELOG_Wksta_SSIRelogon = 3167_u32
  NELOG_Build_Name = 3170_u32
  NELOG_Name_Expansion = 3171_u32
  NELOG_Message_Send = 3172_u32
  NELOG_Mail_Slt_Err = 3173_u32
  NELOG_AT_cannot_read = 3174_u32
  NELOG_AT_sched_err = 3175_u32
  NELOG_AT_schedule_file_created = 3176_u32
  NELOG_Srvnet_NB_Open = 3177_u32
  NELOG_AT_Exec_Err = 3178_u32
  NELOG_Lazy_Write_Err = 3180_u32
  NELOG_HotFix = 3181_u32
  NELOG_HardErr_From_Server = 3182_u32
  NELOG_LocalSecFail1 = 3183_u32
  NELOG_LocalSecFail2 = 3184_u32
  NELOG_LocalSecFail3 = 3185_u32
  NELOG_LocalSecGeneralFail = 3186_u32
  NELOG_NetWkSta_Internal_Error = 3190_u32
  NELOG_NetWkSta_No_Resource = 3191_u32
  NELOG_NetWkSta_SMB_Err = 3192_u32
  NELOG_NetWkSta_VC_Err = 3193_u32
  NELOG_NetWkSta_Stuck_VC_Err = 3194_u32
  NELOG_NetWkSta_NCB_Err = 3195_u32
  NELOG_NetWkSta_Write_Behind_Err = 3196_u32
  NELOG_NetWkSta_Reset_Err = 3197_u32
  NELOG_NetWkSta_Too_Many = 3198_u32
  NELOG_Srv_Thread_Failure = 3204_u32
  NELOG_Srv_Close_Failure = 3205_u32
  NELOG_ReplUserCurDir = 3206_u32
  NELOG_ReplCannotMasterDir = 3207_u32
  NELOG_ReplUpdateError = 3208_u32
  NELOG_ReplLostMaster = 3209_u32
  NELOG_NetlogonAuthDCFail = 3210_u32
  NELOG_ReplLogonFailed = 3211_u32
  NELOG_ReplNetErr = 3212_u32
  NELOG_ReplMaxFiles = 3213_u32
  NELOG_ReplMaxTreeDepth = 3214_u32
  NELOG_ReplBadMsg = 3215_u32
  NELOG_ReplSysErr = 3216_u32
  NELOG_ReplUserLoged = 3217_u32
  NELOG_ReplBadImport = 3218_u32
  NELOG_ReplBadExport = 3219_u32
  NELOG_ReplSignalFileErr = 3220_u32
  NELOG_DiskFT = 3221_u32
  NELOG_ReplAccessDenied = 3222_u32
  NELOG_NetlogonFailedPrimary = 3223_u32
  NELOG_NetlogonPasswdSetFailed = 3224_u32
  NELOG_NetlogonTrackingError = 3225_u32
  NELOG_NetlogonSyncError = 3226_u32
  NELOG_NetlogonRequireSignOrSealError = 3227_u32
  NELOG_UPS_PowerOut = 3230_u32
  NELOG_UPS_Shutdown = 3231_u32
  NELOG_UPS_CmdFileError = 3232_u32
  NELOG_UPS_CannotOpenDriver = 3233_u32
  NELOG_UPS_PowerBack = 3234_u32
  NELOG_UPS_CmdFileConfig = 3235_u32
  NELOG_UPS_CmdFileExec = 3236_u32
  NELOG_Missing_Parameter = 3250_u32
  NELOG_Invalid_Config_Line = 3251_u32
  NELOG_Invalid_Config_File = 3252_u32
  NELOG_File_Changed = 3253_u32
  NELOG_Files_Dont_Fit = 3254_u32
  NELOG_Wrong_DLL_Version = 3255_u32
  NELOG_Error_in_DLL = 3256_u32
  NELOG_System_Error = 3257_u32
  NELOG_FT_ErrLog_Too_Large = 3258_u32
  NELOG_FT_Update_In_Progress = 3259_u32
  NELOG_Joined_Domain = 3260_u32
  NELOG_Joined_Workgroup = 3261_u32
  NELOG_OEM_Code = 3299_u32
  ERRLOG2_BASE = 5700_u32
  NELOG_NetlogonSSIInitError = 5700_u32
  NELOG_NetlogonFailedToUpdateTrustList = 5701_u32
  NELOG_NetlogonFailedToAddRpcInterface = 5702_u32
  NELOG_NetlogonFailedToReadMailslot = 5703_u32
  NELOG_NetlogonFailedToRegisterSC = 5704_u32
  NELOG_NetlogonChangeLogCorrupt = 5705_u32
  NELOG_NetlogonFailedToCreateShare = 5706_u32
  NELOG_NetlogonDownLevelLogonFailed = 5707_u32
  NELOG_NetlogonDownLevelLogoffFailed = 5708_u32
  NELOG_NetlogonNTLogonFailed = 5709_u32
  NELOG_NetlogonNTLogoffFailed = 5710_u32
  NELOG_NetlogonPartialSyncCallSuccess = 5711_u32
  NELOG_NetlogonPartialSyncCallFailed = 5712_u32
  NELOG_NetlogonFullSyncCallSuccess = 5713_u32
  NELOG_NetlogonFullSyncCallFailed = 5714_u32
  NELOG_NetlogonPartialSyncSuccess = 5715_u32
  NELOG_NetlogonPartialSyncFailed = 5716_u32
  NELOG_NetlogonFullSyncSuccess = 5717_u32
  NELOG_NetlogonFullSyncFailed = 5718_u32
  NELOG_NetlogonAuthNoDomainController = 5719_u32
  NELOG_NetlogonAuthNoTrustLsaSecret = 5720_u32
  NELOG_NetlogonAuthNoTrustSamAccount = 5721_u32
  NELOG_NetlogonServerAuthFailed = 5722_u32
  NELOG_NetlogonServerAuthNoTrustSamAccount = 5723_u32
  NELOG_FailedToRegisterSC = 5724_u32
  NELOG_FailedToSetServiceStatus = 5725_u32
  NELOG_FailedToGetComputerName = 5726_u32
  NELOG_DriverNotLoaded = 5727_u32
  NELOG_NoTranportLoaded = 5728_u32
  NELOG_NetlogonFailedDomainDelta = 5729_u32
  NELOG_NetlogonFailedGlobalGroupDelta = 5730_u32
  NELOG_NetlogonFailedLocalGroupDelta = 5731_u32
  NELOG_NetlogonFailedUserDelta = 5732_u32
  NELOG_NetlogonFailedPolicyDelta = 5733_u32
  NELOG_NetlogonFailedTrustedDomainDelta = 5734_u32
  NELOG_NetlogonFailedAccountDelta = 5735_u32
  NELOG_NetlogonFailedSecretDelta = 5736_u32
  NELOG_NetlogonSystemError = 5737_u32
  NELOG_NetlogonDuplicateMachineAccounts = 5738_u32
  NELOG_NetlogonTooManyGlobalGroups = 5739_u32
  NELOG_NetlogonBrowserDriver = 5740_u32
  NELOG_NetlogonAddNameFailure = 5741_u32
  NELOG_RplMessages = 5742_u32
  NELOG_RplXnsBoot = 5743_u32
  NELOG_RplSystem = 5744_u32
  NELOG_RplWkstaTimeout = 5745_u32
  NELOG_RplWkstaFileOpen = 5746_u32
  NELOG_RplWkstaFileRead = 5747_u32
  NELOG_RplWkstaMemory = 5748_u32
  NELOG_RplWkstaFileChecksum = 5749_u32
  NELOG_RplWkstaFileLineCount = 5750_u32
  NELOG_RplWkstaBbcFile = 5751_u32
  NELOG_RplWkstaFileSize = 5752_u32
  NELOG_RplWkstaInternal = 5753_u32
  NELOG_RplWkstaWrongVersion = 5754_u32
  NELOG_RplWkstaNetwork = 5755_u32
  NELOG_RplAdapterResource = 5756_u32
  NELOG_RplFileCopy = 5757_u32
  NELOG_RplFileDelete = 5758_u32
  NELOG_RplFilePerms = 5759_u32
  NELOG_RplCheckConfigs = 5760_u32
  NELOG_RplCreateProfiles = 5761_u32
  NELOG_RplRegistry = 5762_u32
  NELOG_RplReplaceRPLDISK = 5763_u32
  NELOG_RplCheckSecurity = 5764_u32
  NELOG_RplBackupDatabase = 5765_u32
  NELOG_RplInitDatabase = 5766_u32
  NELOG_RplRestoreDatabaseFailure = 5767_u32
  NELOG_RplRestoreDatabaseSuccess = 5768_u32
  NELOG_RplInitRestoredDatabase = 5769_u32
  NELOG_NetlogonSessionTypeWrong = 5770_u32
  NELOG_RplUpgradeDBTo40 = 5771_u32
  NELOG_NetlogonLanmanBdcsNotAllowed = 5772_u32
  NELOG_NetlogonNoDynamicDns = 5773_u32
  NELOG_NetlogonDynamicDnsRegisterFailure = 5774_u32
  NELOG_NetlogonDynamicDnsDeregisterFailure = 5775_u32
  NELOG_NetlogonFailedFileCreate = 5776_u32
  NELOG_NetlogonGetSubnetToSite = 5777_u32
  NELOG_NetlogonNoSiteForClient = 5778_u32
  NELOG_NetlogonBadSiteName = 5779_u32
  NELOG_NetlogonBadSubnetName = 5780_u32
  NELOG_NetlogonDynamicDnsServerFailure = 5781_u32
  NELOG_NetlogonDynamicDnsFailure = 5782_u32
  NELOG_NetlogonRpcCallCancelled = 5783_u32
  NELOG_NetlogonDcSiteCovered = 5784_u32
  NELOG_NetlogonDcSiteNotCovered = 5785_u32
  NELOG_NetlogonGcSiteCovered = 5786_u32
  NELOG_NetlogonGcSiteNotCovered = 5787_u32
  NELOG_NetlogonFailedSpnUpdate = 5788_u32
  NELOG_NetlogonFailedDnsHostNameUpdate = 5789_u32
  NELOG_NetlogonAuthNoUplevelDomainController = 5790_u32
  NELOG_NetlogonAuthDomainDowngraded = 5791_u32
  NELOG_NetlogonNdncSiteCovered = 5792_u32
  NELOG_NetlogonNdncSiteNotCovered = 5793_u32
  NELOG_NetlogonDcOldSiteCovered = 5794_u32
  NELOG_NetlogonDcSiteNotCoveredAuto = 5795_u32
  NELOG_NetlogonGcOldSiteCovered = 5796_u32
  NELOG_NetlogonGcSiteNotCoveredAuto = 5797_u32
  NELOG_NetlogonNdncOldSiteCovered = 5798_u32
  NELOG_NetlogonNdncSiteNotCoveredAuto = 5799_u32
  NELOG_NetlogonSpnMultipleSamAccountNames = 5800_u32
  NELOG_NetlogonSpnCrackNamesFailure = 5801_u32
  NELOG_NetlogonNoAddressToSiteMapping = 5802_u32
  NELOG_NetlogonInvalidGenericParameterValue = 5803_u32
  NELOG_NetlogonInvalidDwordParameterValue = 5804_u32
  NELOG_NetlogonServerAuthFailedNoAccount = 5805_u32
  NELOG_NetlogonNoDynamicDnsManual = 5806_u32
  NELOG_NetlogonNoSiteForClients = 5807_u32
  NELOG_NetlogonDnsDeregAborted = 5808_u32
  NELOG_NetlogonRpcPortRequestFailure = 5809_u32
  NELOG_NetlogonPartialSiteMappingForClients = 5810_u32
  NELOG_NetlogonRemoteDynamicDnsRegisterFailure = 5811_u32
  NELOG_NetlogonRemoteDynamicDnsDeregisterFailure = 5812_u32
  NELOG_NetlogonRejectedRemoteDynamicDnsRegister = 5813_u32
  NELOG_NetlogonRejectedRemoteDynamicDnsDeregister = 5814_u32
  NELOG_NetlogonRemoteDynamicDnsUpdateRequestFailure = 5815_u32
  NELOG_NetlogonUserValidationReqInitialTimeOut = 5816_u32
  NELOG_NetlogonUserValidationReqRecurringTimeOut = 5817_u32
  NELOG_NetlogonUserValidationReqWaitInitialWarning = 5818_u32
  NELOG_NetlogonUserValidationReqWaitRecurringWarning = 5819_u32
  NELOG_NetlogonFailedToAddAuthzRpcInterface = 5820_u32
  NELOG_NetLogonFailedToInitializeAuthzRm = 5821_u32
  NELOG_NetLogonFailedToInitializeRPCSD = 5822_u32
  NELOG_NetlogonMachinePasswdSetSucceeded = 5823_u32
  NELOG_NetlogonMsaPasswdSetSucceeded = 5824_u32
  NELOG_NetlogonDnsHostNameLowerCasingFailed = 5825_u32
  NETLOG_NetlogonNonWindowsSupportsSecureRpc = 5826_u32
  NETLOG_NetlogonUnsecureRpcClient = 5827_u32
  NETLOG_NetlogonUnsecureRpcTrust = 5828_u32
  NETLOG_NetlogonUnsecuredRpcMachineTemporarilyAllowed = 5829_u32
  NETLOG_NetlogonUnsecureRpcMachineAllowedBySsdl = 5830_u32
  NETLOG_NetlogonUnsecureRpcTrustAllowedBySsdl = 5831_u32
  NETSETUP_ACCT_DELETE = 4_u32
  NETSETUP_DNS_NAME_CHANGES_ONLY = 4096_u32
  NETSETUP_INSTALL_INVOCATION = 262144_u32
  NETSETUP_ALT_SAMACCOUNTNAME = 131072_u32
  NET_IGNORE_UNSUPPORTED_FLAGS = 1_u32
  NETSETUP_PROVISION_PERSISTENTSITE = 32_u32
  NETSETUP_PROVISION_CHECK_PWD_ONLY = 2147483648_u32
  NETSETUP_PROVISIONING_PARAMS_WIN8_VERSION = 1_u32
  NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION = 2_u32
  MSGNAME_NOT_FORWARDED = 0_u32
  MSGNAME_FORWARDED_TO = 4_u32
  MSGNAME_FORWARDED_FROM = 16_u32
  SUPPORTS_ANY = -1_i32
  NO_PERMISSION_REQUIRED = 1_u32
  ALLOCATE_RESPONSE = 2_u32
  USE_SPECIFIC_TRANSPORT = 2147483648_u32
  SV_PLATFORM_ID_OS2 = 400_u32
  SV_PLATFORM_ID_NT = 500_u32
  MAJOR_VERSION_MASK = 15_u32
  SV_NODISC = -1_i32
  SV_PLATFORM_ID_PARMNUM = 101_u32
  SV_NAME_PARMNUM = 102_u32
  SV_VERSION_MAJOR_PARMNUM = 103_u32
  SV_VERSION_MINOR_PARMNUM = 104_u32
  SV_TYPE_PARMNUM = 105_u32
  SV_COMMENT_PARMNUM = 5_u32
  SV_USERS_PARMNUM = 107_u32
  SV_DISC_PARMNUM = 10_u32
  SV_HIDDEN_PARMNUM = 16_u32
  SV_ANNOUNCE_PARMNUM = 17_u32
  SV_ANNDELTA_PARMNUM = 18_u32
  SV_USERPATH_PARMNUM = 112_u32
  SV_ULIST_MTIME_PARMNUM = 401_u32
  SV_GLIST_MTIME_PARMNUM = 402_u32
  SV_ALIST_MTIME_PARMNUM = 403_u32
  SV_ALERTS_PARMNUM = 11_u32
  SV_SECURITY_PARMNUM = 405_u32
  SV_NUMADMIN_PARMNUM = 406_u32
  SV_LANMASK_PARMNUM = 407_u32
  SV_GUESTACC_PARMNUM = 408_u32
  SV_CHDEVQ_PARMNUM = 410_u32
  SV_CHDEVJOBS_PARMNUM = 411_u32
  SV_CONNECTIONS_PARMNUM = 412_u32
  SV_SHARES_PARMNUM = 413_u32
  SV_OPENFILES_PARMNUM = 414_u32
  SV_SESSREQS_PARMNUM = 417_u32
  SV_ACTIVELOCKS_PARMNUM = 419_u32
  SV_NUMREQBUF_PARMNUM = 420_u32
  SV_NUMBIGBUF_PARMNUM = 422_u32
  SV_NUMFILETASKS_PARMNUM = 423_u32
  SV_ALERTSCHED_PARMNUM = 37_u32
  SV_ERRORALERT_PARMNUM = 38_u32
  SV_LOGONALERT_PARMNUM = 39_u32
  SV_ACCESSALERT_PARMNUM = 40_u32
  SV_DISKALERT_PARMNUM = 41_u32
  SV_NETIOALERT_PARMNUM = 42_u32
  SV_MAXAUDITSZ_PARMNUM = 43_u32
  SV_SRVHEURISTICS_PARMNUM = 431_u32
  SV_SESSOPENS_PARMNUM = 501_u32
  SV_SESSVCS_PARMNUM = 502_u32
  SV_OPENSEARCH_PARMNUM = 503_u32
  SV_SIZREQBUF_PARMNUM = 504_u32
  SV_INITWORKITEMS_PARMNUM = 505_u32
  SV_MAXWORKITEMS_PARMNUM = 506_u32
  SV_RAWWORKITEMS_PARMNUM = 507_u32
  SV_IRPSTACKSIZE_PARMNUM = 508_u32
  SV_MAXRAWBUFLEN_PARMNUM = 509_u32
  SV_SESSUSERS_PARMNUM = 510_u32
  SV_SESSCONNS_PARMNUM = 511_u32
  SV_MAXNONPAGEDMEMORYUSAGE_PARMNUM = 512_u32
  SV_MAXPAGEDMEMORYUSAGE_PARMNUM = 513_u32
  SV_ENABLESOFTCOMPAT_PARMNUM = 514_u32
  SV_ENABLEFORCEDLOGOFF_PARMNUM = 515_u32
  SV_TIMESOURCE_PARMNUM = 516_u32
  SV_ACCEPTDOWNLEVELAPIS_PARMNUM = 517_u32
  SV_LMANNOUNCE_PARMNUM = 518_u32
  SV_DOMAIN_PARMNUM = 519_u32
  SV_MAXCOPYREADLEN_PARMNUM = 520_u32
  SV_MAXCOPYWRITELEN_PARMNUM = 521_u32
  SV_MINKEEPSEARCH_PARMNUM = 522_u32
  SV_MAXKEEPSEARCH_PARMNUM = 523_u32
  SV_MINKEEPCOMPLSEARCH_PARMNUM = 524_u32
  SV_MAXKEEPCOMPLSEARCH_PARMNUM = 525_u32
  SV_THREADCOUNTADD_PARMNUM = 526_u32
  SV_NUMBLOCKTHREADS_PARMNUM = 527_u32
  SV_SCAVTIMEOUT_PARMNUM = 528_u32
  SV_MINRCVQUEUE_PARMNUM = 529_u32
  SV_MINFREEWORKITEMS_PARMNUM = 530_u32
  SV_XACTMEMSIZE_PARMNUM = 531_u32
  SV_THREADPRIORITY_PARMNUM = 532_u32
  SV_MAXMPXCT_PARMNUM = 533_u32
  SV_OPLOCKBREAKWAIT_PARMNUM = 534_u32
  SV_OPLOCKBREAKRESPONSEWAIT_PARMNUM = 535_u32
  SV_ENABLEOPLOCKS_PARMNUM = 536_u32
  SV_ENABLEOPLOCKFORCECLOSE_PARMNUM = 537_u32
  SV_ENABLEFCBOPENS_PARMNUM = 538_u32
  SV_ENABLERAW_PARMNUM = 539_u32
  SV_ENABLESHAREDNETDRIVES_PARMNUM = 540_u32
  SV_MINFREECONNECTIONS_PARMNUM = 541_u32
  SV_MAXFREECONNECTIONS_PARMNUM = 542_u32
  SV_INITSESSTABLE_PARMNUM = 543_u32
  SV_INITCONNTABLE_PARMNUM = 544_u32
  SV_INITFILETABLE_PARMNUM = 545_u32
  SV_INITSEARCHTABLE_PARMNUM = 546_u32
  SV_ALERTSCHEDULE_PARMNUM = 547_u32
  SV_ERRORTHRESHOLD_PARMNUM = 548_u32
  SV_NETWORKERRORTHRESHOLD_PARMNUM = 549_u32
  SV_DISKSPACETHRESHOLD_PARMNUM = 550_u32
  SV_MAXLINKDELAY_PARMNUM = 552_u32
  SV_MINLINKTHROUGHPUT_PARMNUM = 553_u32
  SV_LINKINFOVALIDTIME_PARMNUM = 554_u32
  SV_SCAVQOSINFOUPDATETIME_PARMNUM = 555_u32
  SV_MAXWORKITEMIDLETIME_PARMNUM = 556_u32
  SV_MAXRAWWORKITEMS_PARMNUM = 557_u32
  SV_PRODUCTTYPE_PARMNUM = 560_u32
  SV_SERVERSIZE_PARMNUM = 561_u32
  SV_CONNECTIONLESSAUTODISC_PARMNUM = 562_u32
  SV_SHARINGVIOLATIONRETRIES_PARMNUM = 563_u32
  SV_SHARINGVIOLATIONDELAY_PARMNUM = 564_u32
  SV_MAXGLOBALOPENSEARCH_PARMNUM = 565_u32
  SV_REMOVEDUPLICATESEARCHES_PARMNUM = 566_u32
  SV_LOCKVIOLATIONRETRIES_PARMNUM = 567_u32
  SV_LOCKVIOLATIONOFFSET_PARMNUM = 568_u32
  SV_LOCKVIOLATIONDELAY_PARMNUM = 569_u32
  SV_MDLREADSWITCHOVER_PARMNUM = 570_u32
  SV_CACHEDOPENLIMIT_PARMNUM = 571_u32
  SV_CRITICALTHREADS_PARMNUM = 572_u32
  SV_RESTRICTNULLSESSACCESS_PARMNUM = 573_u32
  SV_ENABLEWFW311DIRECTIPX_PARMNUM = 574_u32
  SV_OTHERQUEUEAFFINITY_PARMNUM = 575_u32
  SV_QUEUESAMPLESECS_PARMNUM = 576_u32
  SV_BALANCECOUNT_PARMNUM = 577_u32
  SV_PREFERREDAFFINITY_PARMNUM = 578_u32
  SV_MAXFREERFCBS_PARMNUM = 579_u32
  SV_MAXFREEMFCBS_PARMNUM = 580_u32
  SV_MAXFREELFCBS_PARMNUM = 581_u32
  SV_MAXFREEPAGEDPOOLCHUNKS_PARMNUM = 582_u32
  SV_MINPAGEDPOOLCHUNKSIZE_PARMNUM = 583_u32
  SV_MAXPAGEDPOOLCHUNKSIZE_PARMNUM = 584_u32
  SV_SENDSFROMPREFERREDPROCESSOR_PARMNUM = 585_u32
  SV_MAXTHREADSPERQUEUE_PARMNUM = 586_u32
  SV_CACHEDDIRECTORYLIMIT_PARMNUM = 587_u32
  SV_MAXCOPYLENGTH_PARMNUM = 588_u32
  SV_ENABLECOMPRESSION_PARMNUM = 590_u32
  SV_AUTOSHAREWKS_PARMNUM = 591_u32
  SV_AUTOSHARESERVER_PARMNUM = 592_u32
  SV_ENABLESECURITYSIGNATURE_PARMNUM = 593_u32
  SV_REQUIRESECURITYSIGNATURE_PARMNUM = 594_u32
  SV_MINCLIENTBUFFERSIZE_PARMNUM = 595_u32
  SV_CONNECTIONNOSESSIONSTIMEOUT_PARMNUM = 596_u32
  SV_IDLETHREADTIMEOUT_PARMNUM = 597_u32
  SV_ENABLEW9XSECURITYSIGNATURE_PARMNUM = 598_u32
  SV_ENFORCEKERBEROSREAUTHENTICATION_PARMNUM = 599_u32
  SV_DISABLEDOS_PARMNUM = 600_u32
  SV_LOWDISKSPACEMINIMUM_PARMNUM = 601_u32
  SV_DISABLESTRICTNAMECHECKING_PARMNUM = 602_u32
  SV_ENABLEAUTHENTICATEUSERSHARING_PARMNUM = 603_u32
  SVI1_NUM_ELEMENTS = 5_u32
  SVI2_NUM_ELEMENTS = 40_u32
  SVI3_NUM_ELEMENTS = 44_u32
  SV_MAX_CMD_LEN = 256_u32
  SW_AUTOPROF_LOAD_MASK = 1_u32
  SW_AUTOPROF_SAVE_MASK = 2_u32
  SV_MAX_SRV_HEUR_LEN = 32_u32
  SV_USERS_PER_LICENSE = 5_u32
  SVTI2_REMAP_PIPE_NAMES = 2_u32
  SVTI2_SCOPED_NAME = 4_u32
  SVTI2_CLUSTER_NAME = 8_u32
  SVTI2_CLUSTER_DNN_NAME = 16_u32
  SVTI2_UNICODE_TRANSPORT_ADDRESS = 32_u32
  SVTI2_RESERVED1 = 4096_u32
  SVTI2_RESERVED2 = 8192_u32
  SVTI2_RESERVED3 = 16384_u32
  SRV_SUPPORT_HASH_GENERATION = 1_u32
  SRV_HASH_GENERATION_ACTIVE = 2_u32
  SERVICE_INSTALL_STATE = 3_u32
  SERVICE_UNINSTALLED = 0_u32
  SERVICE_INSTALL_PENDING = 1_u32
  SERVICE_UNINSTALL_PENDING = 2_u32
  SERVICE_INSTALLED = 3_u32
  SERVICE_PAUSE_STATE = 12_u32
  LM20_SERVICE_ACTIVE = 0_u32
  LM20_SERVICE_CONTINUE_PENDING = 4_u32
  LM20_SERVICE_PAUSE_PENDING = 8_u32
  LM20_SERVICE_PAUSED = 12_u32
  SERVICE_NOT_UNINSTALLABLE = 0_u32
  SERVICE_UNINSTALLABLE = 16_u32
  SERVICE_NOT_PAUSABLE = 0_u32
  SERVICE_PAUSABLE = 32_u32
  SERVICE_REDIR_PAUSED = 1792_u32
  SERVICE_REDIR_DISK_PAUSED = 256_u32
  SERVICE_REDIR_PRINT_PAUSED = 512_u32
  SERVICE_REDIR_COMM_PAUSED = 1024_u32
  SERVICE_CTRL_INTERROGATE = 0_u32
  SERVICE_CTRL_PAUSE = 1_u32
  SERVICE_CTRL_CONTINUE = 2_u32
  SERVICE_CTRL_UNINSTALL = 3_u32
  SERVICE_CTRL_REDIR_DISK = 1_u32
  SERVICE_CTRL_REDIR_PRINT = 2_u32
  SERVICE_CTRL_REDIR_COMM = 4_u32
  SERVICE_IP_NO_HINT = 0_u32
  SERVICE_CCP_NO_HINT = 0_u32
  SERVICE_IP_QUERY_HINT = 65536_u32
  SERVICE_CCP_QUERY_HINT = 65536_u32
  SERVICE_IP_CHKPT_NUM = 255_u32
  SERVICE_CCP_CHKPT_NUM = 255_u32
  SERVICE_IP_WAIT_TIME = 65280_u32
  SERVICE_CCP_WAIT_TIME = 65280_u32
  SERVICE_IP_WAITTIME_SHIFT = 8_u32
  SERVICE_NTIP_WAITTIME_SHIFT = 12_u32
  UPPER_HINT_MASK = 65280_u32
  LOWER_HINT_MASK = 255_u32
  UPPER_GET_HINT_MASK = 267386880_u32
  LOWER_GET_HINT_MASK = 65280_u32
  SERVICE_NT_MAXTIME = 65535_u32
  SERVICE_RESRV_MASK = 131071_u32
  SERVICE_MAXTIME = 255_u32
  SERVICE_BASE = 3050_u32
  SERVICE_UIC_NORMAL = 0_u32
  SERVICE_UIC_BADPARMVAL = 3051_u32
  SERVICE_UIC_MISSPARM = 3052_u32
  SERVICE_UIC_UNKPARM = 3053_u32
  SERVICE_UIC_RESOURCE = 3054_u32
  SERVICE_UIC_CONFIG = 3055_u32
  SERVICE_UIC_SYSTEM = 3056_u32
  SERVICE_UIC_INTERNAL = 3057_u32
  SERVICE_UIC_AMBIGPARM = 3058_u32
  SERVICE_UIC_DUPPARM = 3059_u32
  SERVICE_UIC_KILL = 3060_u32
  SERVICE_UIC_EXEC = 3061_u32
  SERVICE_UIC_SUBSERV = 3062_u32
  SERVICE_UIC_CONFLPARM = 3063_u32
  SERVICE_UIC_FILE = 3064_u32
  SERVICE_UIC_M_NULL = 0_u32
  SERVICE_UIC_M_MEMORY = 3070_u32
  SERVICE_UIC_M_DISK = 3071_u32
  SERVICE_UIC_M_THREADS = 3072_u32
  SERVICE_UIC_M_PROCESSES = 3073_u32
  SERVICE_UIC_M_SECURITY = 3074_u32
  SERVICE_UIC_M_LANROOT = 3075_u32
  SERVICE_UIC_M_REDIR = 3076_u32
  SERVICE_UIC_M_SERVER = 3077_u32
  SERVICE_UIC_M_SEC_FILE_ERR = 3078_u32
  SERVICE_UIC_M_FILES = 3079_u32
  SERVICE_UIC_M_LOGS = 3080_u32
  SERVICE_UIC_M_LANGROUP = 3081_u32
  SERVICE_UIC_M_MSGNAME = 3082_u32
  SERVICE_UIC_M_ANNOUNCE = 3083_u32
  SERVICE_UIC_M_UAS = 3084_u32
  SERVICE_UIC_M_SERVER_SEC_ERR = 3085_u32
  SERVICE_UIC_M_WKSTA = 3087_u32
  SERVICE_UIC_M_ERRLOG = 3088_u32
  SERVICE_UIC_M_FILE_UW = 3089_u32
  SERVICE_UIC_M_ADDPAK = 3090_u32
  SERVICE_UIC_M_LAZY = 3091_u32
  SERVICE_UIC_M_UAS_MACHINE_ACCT = 3092_u32
  SERVICE_UIC_M_UAS_SERVERS_NMEMB = 3093_u32
  SERVICE_UIC_M_UAS_SERVERS_NOGRP = 3094_u32
  SERVICE_UIC_M_UAS_INVALID_ROLE = 3095_u32
  SERVICE_UIC_M_NETLOGON_NO_DC = 3096_u32
  SERVICE_UIC_M_NETLOGON_DC_CFLCT = 3097_u32
  SERVICE_UIC_M_NETLOGON_AUTH = 3098_u32
  SERVICE_UIC_M_UAS_PROLOG = 3099_u32
  SERVICE2_BASE = 5600_u32
  SERVICE_UIC_M_NETLOGON_MPATH = 5600_u32
  SERVICE_UIC_M_LSA_MACHINE_ACCT = 5601_u32
  SERVICE_UIC_M_DATABASE_ERROR = 5602_u32
  USE_FLAG_GLOBAL_MAPPING = 65536_u32
  USE_LOCAL_PARMNUM = 1_u32
  USE_REMOTE_PARMNUM = 2_u32
  USE_PASSWORD_PARMNUM = 3_u32
  USE_ASGTYPE_PARMNUM = 4_u32
  USE_USERNAME_PARMNUM = 5_u32
  USE_DOMAINNAME_PARMNUM = 6_u32
  USE_FLAGS_PARMNUM = 7_u32
  USE_AUTHIDENTITY_PARMNUM = 8_u32
  USE_SD_PARMNUM = 9_u32
  USE_OPTIONS_PARMNUM = 10_u32
  USE_OK = 0_u32
  USE_PAUSED = 1_u32
  USE_SESSLOST = 2_u32
  USE_DISCONN = 2_u32
  USE_NETERR = 3_u32
  USE_CONN = 4_u32
  USE_RECONN = 5_u32
  USE_CHARDEV = 2_u32
  CREATE_NO_CONNECT = 1_u32
  CREATE_BYPASS_CSC = 2_u32
  CREATE_CRED_RESET = 4_u32
  USE_DEFAULT_CREDENTIALS = 4_u32
  CREATE_REQUIRE_CONNECTION_INTEGRITY = 8_u32
  CREATE_REQUIRE_CONNECTION_PRIVACY = 16_u32
  CREATE_PERSIST_MAPPING = 32_u32
  CREATE_WRITE_THROUGH_SEMANTICS = 64_u32
  CREATE_GLOBAL_MAPPING = 256_u32
  WKSTA_PLATFORM_ID_PARMNUM = 100_u32
  WKSTA_COMPUTERNAME_PARMNUM = 1_u32
  WKSTA_LANGROUP_PARMNUM = 2_u32
  WKSTA_VER_MAJOR_PARMNUM = 4_u32
  WKSTA_VER_MINOR_PARMNUM = 5_u32
  WKSTA_LOGGED_ON_USERS_PARMNUM = 6_u32
  WKSTA_LANROOT_PARMNUM = 7_u32
  WKSTA_LOGON_DOMAIN_PARMNUM = 8_u32
  WKSTA_LOGON_SERVER_PARMNUM = 9_u32
  WKSTA_CHARWAIT_PARMNUM = 10_u32
  WKSTA_CHARTIME_PARMNUM = 11_u32
  WKSTA_CHARCOUNT_PARMNUM = 12_u32
  WKSTA_KEEPCONN_PARMNUM = 13_u32
  WKSTA_KEEPSEARCH_PARMNUM = 14_u32
  WKSTA_MAXCMDS_PARMNUM = 15_u32
  WKSTA_NUMWORKBUF_PARMNUM = 16_u32
  WKSTA_MAXWRKCACHE_PARMNUM = 17_u32
  WKSTA_SESSTIMEOUT_PARMNUM = 18_u32
  WKSTA_SIZERROR_PARMNUM = 19_u32
  WKSTA_NUMALERTS_PARMNUM = 20_u32
  WKSTA_NUMSERVICES_PARMNUM = 21_u32
  WKSTA_NUMCHARBUF_PARMNUM = 22_u32
  WKSTA_SIZCHARBUF_PARMNUM = 23_u32
  WKSTA_ERRLOGSZ_PARMNUM = 27_u32
  WKSTA_PRINTBUFTIME_PARMNUM = 28_u32
  WKSTA_SIZWORKBUF_PARMNUM = 29_u32
  WKSTA_MAILSLOTS_PARMNUM = 30_u32
  WKSTA_NUMDGRAMBUF_PARMNUM = 31_u32
  WKSTA_WRKHEURISTICS_PARMNUM = 32_u32
  WKSTA_MAXTHREADS_PARMNUM = 33_u32
  WKSTA_LOCKQUOTA_PARMNUM = 41_u32
  WKSTA_LOCKINCREMENT_PARMNUM = 42_u32
  WKSTA_LOCKMAXIMUM_PARMNUM = 43_u32
  WKSTA_PIPEINCREMENT_PARMNUM = 44_u32
  WKSTA_PIPEMAXIMUM_PARMNUM = 45_u32
  WKSTA_DORMANTFILELIMIT_PARMNUM = 46_u32
  WKSTA_CACHEFILETIMEOUT_PARMNUM = 47_u32
  WKSTA_USEOPPORTUNISTICLOCKING_PARMNUM = 48_u32
  WKSTA_USEUNLOCKBEHIND_PARMNUM = 49_u32
  WKSTA_USECLOSEBEHIND_PARMNUM = 50_u32
  WKSTA_BUFFERNAMEDPIPES_PARMNUM = 51_u32
  WKSTA_USELOCKANDREADANDUNLOCK_PARMNUM = 52_u32
  WKSTA_UTILIZENTCACHING_PARMNUM = 53_u32
  WKSTA_USERAWREAD_PARMNUM = 54_u32
  WKSTA_USERAWWRITE_PARMNUM = 55_u32
  WKSTA_USEWRITERAWWITHDATA_PARMNUM = 56_u32
  WKSTA_USEENCRYPTION_PARMNUM = 57_u32
  WKSTA_BUFFILESWITHDENYWRITE_PARMNUM = 58_u32
  WKSTA_BUFFERREADONLYFILES_PARMNUM = 59_u32
  WKSTA_FORCECORECREATEMODE_PARMNUM = 60_u32
  WKSTA_USE512BYTESMAXTRANSFER_PARMNUM = 61_u32
  WKSTA_READAHEADTHRUPUT_PARMNUM = 62_u32
  WKSTA_OTH_DOMAINS_PARMNUM = 101_u32
  TRANSPORT_QUALITYOFSERVICE_PARMNUM = 201_u32
  TRANSPORT_NAME_PARMNUM = 202_u32
  EVENT_SRV_SERVICE_FAILED = -1073739824_i32
  EVENT_SRV_RESOURCE_SHORTAGE = -1073739823_i32
  EVENT_SRV_CANT_CREATE_DEVICE = -1073739822_i32
  EVENT_SRV_CANT_CREATE_PROCESS = -1073739821_i32
  EVENT_SRV_CANT_CREATE_THREAD = -1073739820_i32
  EVENT_SRV_UNEXPECTED_DISC = -1073739819_i32
  EVENT_SRV_INVALID_REQUEST = -1073739818_i32
  EVENT_SRV_CANT_OPEN_NPFS = -1073739817_i32
  EVENT_SRV_CANT_GROW_TABLE = -2147481639_i32
  EVENT_SRV_CANT_START_SCAVENGER = -1073739814_i32
  EVENT_SRV_IRP_STACK_SIZE = -1073739813_i32
  EVENT_SRV_NETWORK_ERROR = -2147481636_i32
  EVENT_SRV_DISK_FULL = -2147481635_i32
  EVENT_SRV_NO_VIRTUAL_MEMORY = -1073739808_i32
  EVENT_SRV_NONPAGED_POOL_LIMIT = -1073739807_i32
  EVENT_SRV_PAGED_POOL_LIMIT = -1073739806_i32
  EVENT_SRV_NO_NONPAGED_POOL = -1073739805_i32
  EVENT_SRV_NO_PAGED_POOL = -1073739804_i32
  EVENT_SRV_NO_WORK_ITEM = -2147481627_i32
  EVENT_SRV_NO_FREE_CONNECTIONS = -2147481626_i32
  EVENT_SRV_NO_FREE_RAW_WORK_ITEM = -2147481625_i32
  EVENT_SRV_NO_BLOCKING_IO = -2147481624_i32
  EVENT_SRV_DOS_ATTACK_DETECTED = -2147481623_i32
  EVENT_SRV_TOO_MANY_DOS = -2147481622_i32
  EVENT_SRV_OUT_OF_WORK_ITEM_DOS = -2147481621_i32
  EVENT_SRV_KEY_NOT_FOUND = -1073739323_i32
  EVENT_SRV_KEY_NOT_CREATED = -1073739322_i32
  EVENT_SRV_NO_TRANSPORTS_BOUND = -1073739321_i32
  EVENT_SRV_CANT_BIND_TO_TRANSPORT = -2147481144_i32
  EVENT_SRV_CANT_BIND_DUP_NAME = -1073739319_i32
  EVENT_SRV_INVALID_REGISTRY_VALUE = -2147481142_i32
  EVENT_SRV_INVALID_SD = -2147481141_i32
  EVENT_SRV_CANT_LOAD_DRIVER = -2147481140_i32
  EVENT_SRV_CANT_UNLOAD_DRIVER = -2147481139_i32
  EVENT_SRV_CANT_MAP_ERROR = -2147481138_i32
  EVENT_SRV_CANT_RECREATE_SHARE = -2147481137_i32
  EVENT_SRV_CANT_CHANGE_DOMAIN_NAME = -2147481136_i32
  EVENT_SRV_TXF_INIT_FAILED = -2147481135_i32
  EVENT_RDR_RESOURCE_SHORTAGE = -2147480647_i32
  EVENT_RDR_CANT_CREATE_DEVICE = -2147480646_i32
  EVENT_RDR_CANT_CREATE_THREAD = -2147480645_i32
  EVENT_RDR_CANT_SET_THREAD = -2147480644_i32
  EVENT_RDR_INVALID_REPLY = -2147480643_i32
  EVENT_RDR_INVALID_SMB = -2147480642_i32
  EVENT_RDR_INVALID_LOCK_REPLY = -2147480641_i32
  EVENT_RDR_FAILED_UNLOCK = -2147480639_i32
  EVENT_RDR_CLOSE_BEHIND = -2147480637_i32
  EVENT_RDR_UNEXPECTED_ERROR = -2147480636_i32
  EVENT_RDR_TIMEOUT = -2147480635_i32
  EVENT_RDR_INVALID_OPLOCK = -2147480634_i32
  EVENT_RDR_CONNECTION_REFERENCE = -2147480633_i32
  EVENT_RDR_SERVER_REFERENCE = -2147480632_i32
  EVENT_RDR_SMB_REFERENCE = -2147480631_i32
  EVENT_RDR_ENCRYPT = -2147480630_i32
  EVENT_RDR_CONNECTION = -2147480629_i32
  EVENT_RDR_MAXCMDS = -2147480627_i32
  EVENT_RDR_OPLOCK_SMB = -2147480626_i32
  EVENT_RDR_DISPOSITION = -2147480625_i32
  EVENT_RDR_CONTEXTS = -2147480624_i32
  EVENT_RDR_WRITE_BEHIND_FLUSH_FAILED = -2147480623_i32
  EVENT_RDR_AT_THREAD_MAX = -2147480622_i32
  EVENT_RDR_CANT_READ_REGISTRY = -2147480621_i32
  EVENT_RDR_TIMEZONE_BIAS_TOO_LARGE = -2147480620_i32
  EVENT_RDR_PRIMARY_TRANSPORT_CONNECT_FAILED = -2147480619_i32
  EVENT_RDR_DELAYED_SET_ATTRIBUTES_FAILED = -2147480618_i32
  EVENT_RDR_DELETEONCLOSE_FAILED = -2147480617_i32
  EVENT_RDR_CANT_BIND_TRANSPORT = -2147480616_i32
  EVENT_RDR_CANT_REGISTER_ADDRESS = -2147480615_i32
  EVENT_RDR_CANT_GET_SECURITY_CONTEXT = -2147480614_i32
  EVENT_RDR_CANT_BUILD_SMB_HEADER = -2147480613_i32
  EVENT_RDR_SECURITY_SIGNATURE_MISMATCH = -2147480612_i32
  EVENT_TCPIP6_STARTED = 1073744924_i32
  EVENT_STREAMS_STRLOG = -1073737824_i32
  EVENT_STREAMS_ALLOCB_FAILURE = -2147479647_i32
  EVENT_STREAMS_ALLOCB_FAILURE_CNT = -2147479646_i32
  EVENT_STREAMS_ESBALLOC_FAILURE = -2147479645_i32
  EVENT_STREAMS_ESBALLOC_FAILURE_CNT = -2147479644_i32
  EVENT_TCPIP_CREATE_DEVICE_FAILED = -1073737724_i32
  EVENT_TCPIP_NO_RESOURCES_FOR_INIT = -1073737723_i32
  EVENT_TCPIP_TOO_MANY_NETS = -1073737639_i32
  EVENT_TCPIP_NO_MASK = -1073737638_i32
  EVENT_TCPIP_INVALID_ADDRESS = -1073737637_i32
  EVENT_TCPIP_INVALID_MASK = -1073737636_i32
  EVENT_TCPIP_NO_ADAPTER_RESOURCES = -1073737635_i32
  EVENT_TCPIP_DHCP_INIT_FAILED = -2147479458_i32
  EVENT_TCPIP_ADAPTER_REG_FAILURE = -1073737633_i32
  EVENT_TCPIP_INVALID_DEFAULT_GATEWAY = -2147479456_i32
  EVENT_TCPIP_NO_ADDRESS_LIST = -1073737631_i32
  EVENT_TCPIP_NO_MASK_LIST = -1073737630_i32
  EVENT_TCPIP_NO_BINDINGS = -1073737629_i32
  EVENT_TCPIP_IP_INIT_FAILED = -1073737628_i32
  EVENT_TCPIP_TOO_MANY_GATEWAYS = -2147479451_i32
  EVENT_TCPIP_ADDRESS_CONFLICT1 = -1073737626_i32
  EVENT_TCPIP_ADDRESS_CONFLICT2 = -1073737625_i32
  EVENT_TCPIP_NTE_CONTEXT_LIST_FAILURE = -1073737624_i32
  EVENT_TCPIP_MEDIA_CONNECT = 1073746025_i32
  EVENT_TCPIP_MEDIA_DISCONNECT = 1073746026_i32
  EVENT_TCPIP_IPV4_UNINSTALLED = 1073746027_i32
  EVENT_TCPIP_AUTOCONFIGURED_ADDRESS_LIMIT_REACHED = -2147479444_i32
  EVENT_TCPIP_AUTOCONFIGURED_ROUTE_LIMIT_REACHED = -2147479443_i32
  EVENT_TCPIP_OUT_OF_ORDER_FRAGMENTS_EXCEEDED = -2147479442_i32
  EVENT_TCPIP_INTERFACE_BIND_FAILURE = -1073737617_i32
  EVENT_TCPIP_TCP_INIT_FAILED = -1073737599_i32
  EVENT_TCPIP_TCP_CONNECT_LIMIT_REACHED = -2147479422_i32
  EVENT_TCPIP_TCP_TIME_WAIT_COLLISION = -2147479421_i32
  EVENT_TCPIP_TCP_WSD_WS_RESTRICTED = -2147479420_i32
  EVENT_TCPIP_TCP_MPP_ATTACKS_DETECTED = -2147479419_i32
  EVENT_TCPIP_TCP_CONNECTIONS_PERF_IMPACTED = -2147479418_i32
  EVENT_TCPIP_TCP_GLOBAL_EPHEMERAL_PORT_SPACE_EXHAUSTED = -2147479417_i32
  EVENT_TCPIP_UDP_LIMIT_REACHED = -2147479383_i32
  EVENT_TCPIP_UDP_GLOBAL_EPHEMERAL_PORT_SPACE_EXHAUSTED = -2147479382_i32
  EVENT_TCPIP_PCF_MULTICAST_OID_ISSUE = -2147479358_i32
  EVENT_TCPIP_PCF_MISSING_CAPABILITY = -2147479357_i32
  EVENT_TCPIP_PCF_SET_FILTER_FAILURE = -2147479356_i32
  EVENT_TCPIP_PCF_NO_ARP_FILTER = -2147479355_i32
  EVENT_TCPIP_PCF_CLEAR_FILTER_FAILURE = -1073737530_i32
  EVENT_NBT_CREATE_DRIVER = -1073737524_i32
  EVENT_NBT_OPEN_REG_PARAMS = -1073737523_i32
  EVENT_NBT_NO_BACKUP_WINS = -2147479346_i32
  EVENT_NBT_NO_WINS = -2147479345_i32
  EVENT_NBT_BAD_BACKUP_WINS_ADDR = -2147479344_i32
  EVENT_NBT_BAD_PRIMARY_WINS_ADDR = -2147479343_i32
  EVENT_NBT_NAME_SERVER_ADDRS = -1073737518_i32
  EVENT_NBT_CREATE_ADDRESS = -1073737517_i32
  EVENT_NBT_CREATE_CONNECTION = -1073737516_i32
  EVENT_NBT_NON_OS_INIT = -1073737515_i32
  EVENT_NBT_TIMERS = -1073737514_i32
  EVENT_NBT_CREATE_DEVICE = -1073737513_i32
  EVENT_NBT_NO_DEVICES = -2147479336_i32
  EVENT_NBT_OPEN_REG_LINKAGE = -1073737511_i32
  EVENT_NBT_READ_BIND = -1073737510_i32
  EVENT_NBT_READ_EXPORT = -1073737509_i32
  EVENT_NBT_OPEN_REG_NAMESERVER = -2147479332_i32
  EVENT_SCOPE_LABEL_TOO_LONG = -2147479331_i32
  EVENT_SCOPE_TOO_LONG = -2147479330_i32
  EVENT_NBT_DUPLICATE_NAME = -1073737505_i32
  EVENT_NBT_NAME_RELEASE = -1073737504_i32
  EVENT_NBT_DUPLICATE_NAME_ERROR = -1073737503_i32
  EVENT_NBT_NO_RESOURCES = -1073737502_i32
  EVENT_NDIS_RESOURCE_CONFLICT = -1073736824_i32
  EVENT_NDIS_OUT_OF_RESOURCE = -1073736823_i32
  EVENT_NDIS_HARDWARE_FAILURE = -1073736822_i32
  EVENT_NDIS_ADAPTER_NOT_FOUND = -1073736821_i32
  EVENT_NDIS_INTERRUPT_CONNECT = -1073736820_i32
  EVENT_NDIS_DRIVER_FAILURE = -1073736819_i32
  EVENT_NDIS_BAD_VERSION = -1073736818_i32
  EVENT_NDIS_TIMEOUT = -2147478641_i32
  EVENT_NDIS_NETWORK_ADDRESS = -1073736816_i32
  EVENT_NDIS_UNSUPPORTED_CONFIGURATION = -1073736815_i32
  EVENT_NDIS_INVALID_VALUE_FROM_ADAPTER = -1073736814_i32
  EVENT_NDIS_MISSING_CONFIGURATION_PARAMETER = -1073736813_i32
  EVENT_NDIS_BAD_IO_BASE_ADDRESS = -1073736812_i32
  EVENT_NDIS_RECEIVE_SPACE_SMALL = 1073746837_i32
  EVENT_NDIS_ADAPTER_DISABLED = -2147478634_i32
  EVENT_NDIS_IO_PORT_CONFLICT = -2147478633_i32
  EVENT_NDIS_PORT_OR_DMA_CONFLICT = -2147478632_i32
  EVENT_NDIS_MEMORY_CONFLICT = -2147478631_i32
  EVENT_NDIS_INTERRUPT_CONFLICT = -2147478630_i32
  EVENT_NDIS_DMA_CONFLICT = -2147478629_i32
  EVENT_NDIS_INVALID_DOWNLOAD_FILE_ERROR = -1073736804_i32
  EVENT_NDIS_MAXRECEIVES_ERROR = -2147478627_i32
  EVENT_NDIS_MAXTRANSMITS_ERROR = -2147478626_i32
  EVENT_NDIS_MAXFRAMESIZE_ERROR = -2147478625_i32
  EVENT_NDIS_MAXINTERNALBUFS_ERROR = -2147478624_i32
  EVENT_NDIS_MAXMULTICAST_ERROR = -2147478623_i32
  EVENT_NDIS_PRODUCTID_ERROR = -2147478622_i32
  EVENT_NDIS_LOBE_FAILUE_ERROR = -2147478621_i32
  EVENT_NDIS_SIGNAL_LOSS_ERROR = -2147478620_i32
  EVENT_NDIS_REMOVE_RECEIVED_ERROR = -2147478619_i32
  EVENT_NDIS_TOKEN_RING_CORRECTION = 1073746854_i32
  EVENT_NDIS_ADAPTER_CHECK_ERROR = -1073736793_i32
  EVENT_NDIS_RESET_FAILURE_ERROR = -2147478616_i32
  EVENT_NDIS_CABLE_DISCONNECTED_ERROR = -2147478615_i32
  EVENT_NDIS_RESET_FAILURE_CORRECTION = -2147478614_i32
  EVENT_EventlogStarted = -2147477643_i32
  EVENT_EventlogStopped = -2147477642_i32
  EVENT_EventlogAbnormalShutdown = -2147477640_i32
  EVENT_EventLogProductInfo = -2147477639_i32
  EVENT_ComputerNameChange = -2147477637_i32
  EVENT_DNSDomainNameChange = -2147477636_i32
  EVENT_EventlogUptime = -2147477635_i32
  EVENT_UP_DRIVER_ON_MP = -1073735724_i32
  EVENT_SERVICE_START_FAILED = -1073734824_i32
  EVENT_SERVICE_START_FAILED_II = -1073734823_i32
  EVENT_SERVICE_START_FAILED_GROUP = -1073734822_i32
  EVENT_SERVICE_START_FAILED_NONE = -1073734821_i32
  EVENT_CALL_TO_FUNCTION_FAILED = -1073734819_i32
  EVENT_CALL_TO_FUNCTION_FAILED_II = -1073734818_i32
  EVENT_REVERTED_TO_LASTKNOWNGOOD = -1073734817_i32
  EVENT_BAD_ACCOUNT_NAME = -1073734816_i32
  EVENT_CONNECTION_TIMEOUT = -1073734815_i32
  EVENT_READFILE_TIMEOUT = -1073734814_i32
  EVENT_TRANSACT_TIMEOUT = -1073734813_i32
  EVENT_TRANSACT_INVALID = -1073734812_i32
  EVENT_FIRST_LOGON_FAILED = -1073734811_i32
  EVENT_SECOND_LOGON_FAILED = -1073734810_i32
  EVENT_INVALID_DRIVER_DEPENDENCY = -1073734809_i32
  EVENT_BAD_SERVICE_STATE = -1073734808_i32
  EVENT_CIRCULAR_DEPENDENCY_DEMAND = -1073734807_i32
  EVENT_CIRCULAR_DEPENDENCY_AUTO = -1073734806_i32
  EVENT_DEPEND_ON_LATER_SERVICE = -1073734805_i32
  EVENT_DEPEND_ON_LATER_GROUP = -1073734804_i32
  EVENT_SEVERE_SERVICE_FAILED = -1073734803_i32
  EVENT_SERVICE_START_HUNG = -1073734802_i32
  EVENT_SERVICE_EXIT_FAILED = -1073734801_i32
  EVENT_SERVICE_EXIT_FAILED_SPECIFIC = -1073734800_i32
  EVENT_SERVICE_START_AT_BOOT_FAILED = -1073734799_i32
  EVENT_BOOT_SYSTEM_DRIVERS_FAILED = -1073734798_i32
  EVENT_RUNNING_LASTKNOWNGOOD = -1073734797_i32
  EVENT_TAKE_OWNERSHIP = -1073734796_i32
  TITLE_SC_MESSAGE_BOX = -1073734795_i32
  EVENT_SERVICE_NOT_INTERACTIVE = -1073734794_i32
  EVENT_SERVICE_CRASH = -1073734793_i32
  EVENT_SERVICE_RECOVERY_FAILED = -1073734792_i32
  EVENT_SERVICE_SCESRV_FAILED = -1073734791_i32
  EVENT_SERVICE_CRASH_NO_ACTION = -1073734790_i32
  EVENT_SERVICE_CONTROL_SUCCESS = 1073748859_i32
  EVENT_SERVICE_STATUS_SUCCESS = 1073748860_i32
  EVENT_SERVICE_CONFIG_BACKOUT_FAILED = -1073734787_i32
  EVENT_FIRST_LOGON_FAILED_II = -1073734786_i32
  EVENT_SERVICE_DIFFERENT_PID_CONNECTED = -2147476609_i32
  EVENT_SERVICE_START_TYPE_CHANGED = 1073748864_i32
  EVENT_SERVICE_LOGON_TYPE_NOT_GRANTED = -1073734783_i32
  EVENT_SERVICE_STOP_SUCCESS_WITH_REASON = 1073748866_i32
  EVENT_SERVICE_SHUTDOWN_FAILED = -1073734781_i32
  EVENT_COMMAND_NOT_INTERACTIVE = -1073733924_i32
  EVENT_COMMAND_START_FAILED = -1073733923_i32
  EVENT_BOWSER_OTHER_MASTER_ON_NET = -1073733821_i32
  EVENT_BOWSER_PROMOTED_WHILE_ALREADY_MASTER = -2147475644_i32
  EVENT_BOWSER_NON_MASTER_MASTER_ANNOUNCE = -2147475643_i32
  EVENT_BOWSER_ILLEGAL_DATAGRAM = -2147475642_i32
  EVENT_BROWSER_STATUS_BITS_UPDATE_FAILED = -1073733817_i32
  EVENT_BROWSER_ROLE_CHANGE_FAILED = -1073733816_i32
  EVENT_BROWSER_MASTER_PROMOTION_FAILED = -1073733815_i32
  EVENT_BOWSER_NAME_CONVERSION_FAILED = -1073733814_i32
  EVENT_BROWSER_OTHERDOMAIN_ADD_FAILED = -1073733813_i32
  EVENT_BOWSER_ELECTION_RECEIVED = 8012_i32
  EVENT_BOWSER_ELECTION_SENT_GETBLIST_FAILED = 1073749837_i32
  EVENT_BOWSER_ELECTION_SENT_FIND_MASTER_FAILED = 1073749838_i32
  EVENT_BROWSER_ELECTION_SENT_LANMAN_NT_STARTED = 1073749839_i32
  EVENT_BOWSER_ILLEGAL_DATAGRAM_THRESHOLD = -1073733808_i32
  EVENT_BROWSER_DEPENDANT_SERVICE_FAILED = -1073733807_i32
  EVENT_BROWSER_MASTER_PROMOTION_FAILED_STOPPING = -1073733805_i32
  EVENT_BROWSER_MASTER_PROMOTION_FAILED_NO_MASTER = -1073733804_i32
  EVENT_BROWSER_SERVER_LIST_FAILED = -2147475627_i32
  EVENT_BROWSER_DOMAIN_LIST_FAILED = -2147475626_i32
  EVENT_BROWSER_ILLEGAL_CONFIG = -2147475625_i32
  EVENT_BOWSER_OLD_BACKUP_FOUND = 1073749848_i32
  EVENT_BROWSER_SERVER_LIST_RETRIEVED = 8025_i32
  EVENT_BROWSER_DOMAIN_LIST_RETRIEVED = 8026_i32
  EVENT_BOWSER_PDC_LOST_ELECTION = 1073749851_i32
  EVENT_BOWSER_NON_PDC_WON_ELECTION = 1073749852_i32
  EVENT_BOWSER_CANT_READ_REGISTRY = 1073749853_i32
  EVENT_BOWSER_MAILSLOT_DATAGRAM_THRESHOLD_EXCEEDED = 1073749854_i32
  EVENT_BOWSER_GETBROWSERLIST_THRESHOLD_EXCEEDED = 1073749855_i32
  EVENT_BROWSER_BACKUP_STOPPED = -1073733792_i32
  EVENT_BROWSER_ELECTION_SENT_LANMAN_NT_STOPPED = 1073749857_i32
  EVENT_BROWSER_GETBLIST_RECEIVED_NOT_MASTER = -1073733790_i32
  EVENT_BROWSER_ELECTION_SENT_ROLE_CHANGED = 1073749859_i32
  EVENT_BROWSER_NOT_STARTED_IPX_CONFIG_MISMATCH = -1073733788_i32
  NWSAP_EVENT_KEY_NOT_FOUND = -1073733324_i32
  NWSAP_EVENT_WSASTARTUP_FAILED = -1073733323_i32
  NWSAP_EVENT_SOCKET_FAILED = -1073733322_i32
  NWSAP_EVENT_SETOPTBCAST_FAILED = -1073733321_i32
  NWSAP_EVENT_BIND_FAILED = -1073733320_i32
  NWSAP_EVENT_GETSOCKNAME_FAILED = -1073733319_i32
  NWSAP_EVENT_OPTEXTENDEDADDR_FAILED = -1073733318_i32
  NWSAP_EVENT_OPTBCASTINADDR_FAILED = -1073733317_i32
  NWSAP_EVENT_CARDMALLOC_FAILED = -1073733316_i32
  NWSAP_EVENT_NOCARDS = -1073733315_i32
  NWSAP_EVENT_THREADEVENT_FAIL = -1073733314_i32
  NWSAP_EVENT_RECVSEM_FAIL = -1073733313_i32
  NWSAP_EVENT_SENDEVENT_FAIL = -1073733312_i32
  NWSAP_EVENT_STARTRECEIVE_ERROR = -1073733311_i32
  NWSAP_EVENT_STARTWORKER_ERROR = -1073733310_i32
  NWSAP_EVENT_TABLE_MALLOC_FAILED = -1073733309_i32
  NWSAP_EVENT_HASHTABLE_MALLOC_FAILED = -1073733308_i32
  NWSAP_EVENT_STARTLPCWORKER_ERROR = -1073733307_i32
  NWSAP_EVENT_CREATELPCPORT_ERROR = -1073733306_i32
  NWSAP_EVENT_CREATELPCEVENT_ERROR = -1073733305_i32
  NWSAP_EVENT_LPCLISTENMEMORY_ERROR = -1073733304_i32
  NWSAP_EVENT_LPCHANDLEMEMORY_ERROR = -1073733303_i32
  NWSAP_EVENT_BADWANFILTER_VALUE = -1073733302_i32
  NWSAP_EVENT_CARDLISTEVENT_FAIL = -1073733301_i32
  NWSAP_EVENT_SDMDEVENT_FAIL = -1073733300_i32
  NWSAP_EVENT_INVALID_FILTERNAME = -2147475123_i32
  NWSAP_EVENT_WANSEM_FAIL = -1073733298_i32
  NWSAP_EVENT_WANSOCKET_FAILED = -1073733297_i32
  NWSAP_EVENT_WANBIND_FAILED = -1073733296_i32
  NWSAP_EVENT_STARTWANWORKER_ERROR = -1073733295_i32
  NWSAP_EVENT_STARTWANCHECK_ERROR = -1073733294_i32
  NWSAP_EVENT_OPTMAXADAPTERNUM_ERROR = -1073733293_i32
  NWSAP_EVENT_WANHANDLEMEMORY_ERROR = -1073733292_i32
  NWSAP_EVENT_WANEVENT_ERROR = -1073733291_i32
  EVENT_TRANSPORT_RESOURCE_POOL = -2147474647_i32
  EVENT_TRANSPORT_RESOURCE_LIMIT = -2147474646_i32
  EVENT_TRANSPORT_RESOURCE_SPECIFIC = -2147474645_i32
  EVENT_TRANSPORT_REGISTER_FAILED = -1073732820_i32
  EVENT_TRANSPORT_BINDING_FAILED = -1073732819_i32
  EVENT_TRANSPORT_ADAPTER_NOT_FOUND = -1073732818_i32
  EVENT_TRANSPORT_SET_OID_FAILED = -1073732817_i32
  EVENT_TRANSPORT_QUERY_OID_FAILED = -1073732816_i32
  EVENT_TRANSPORT_TRANSFER_DATA = 1073750833_i32
  EVENT_TRANSPORT_TOO_MANY_LINKS = 1073750834_i32
  EVENT_TRANSPORT_BAD_PROTOCOL = 1073750835_i32
  EVENT_IPX_NEW_DEFAULT_TYPE = 1073751325_i32
  EVENT_IPX_SAP_ANNOUNCE = -2147474146_i32
  EVENT_IPX_ILLEGAL_CONFIG = -2147474145_i32
  EVENT_IPX_INTERNAL_NET_INVALID = -1073732320_i32
  EVENT_IPX_NO_FRAME_TYPES = -1073732319_i32
  EVENT_IPX_CREATE_DEVICE = -1073732318_i32
  EVENT_IPX_NO_ADAPTERS = -1073732317_i32
  EVENT_RPCSS_CREATEPROCESS_FAILURE = -1073731824_i32
  EVENT_RPCSS_RUNAS_CREATEPROCESS_FAILURE = -1073731823_i32
  EVENT_RPCSS_LAUNCH_ACCESS_DENIED = -1073731822_i32
  EVENT_RPCSS_DEFAULT_LAUNCH_ACCESS_DENIED = -1073731821_i32
  EVENT_RPCSS_RUNAS_CANT_LOGIN = -1073731820_i32
  EVENT_RPCSS_START_SERVICE_FAILURE = -1073731819_i32
  EVENT_RPCSS_REMOTE_SIDE_ERROR = -1073731818_i32
  EVENT_RPCSS_ACTIVATION_ERROR = -1073731817_i32
  EVENT_RPCSS_REMOTE_SIDE_ERROR_WITH_FILE = -1073731816_i32
  EVENT_RPCSS_REMOTE_SIDE_UNAVAILABLE = -1073731815_i32
  EVENT_RPCSS_SERVER_START_TIMEOUT = -1073731814_i32
  EVENT_RPCSS_SERVER_NOT_RESPONDING = -1073731813_i32
  EVENT_DCOM_ASSERTION_FAILURE = -1073731812_i32
  EVENT_DCOM_INVALID_ENDPOINT_DATA = -1073731811_i32
  EVENT_DCOM_COMPLUS_DISABLED = -1073731810_i32
  EVENT_RPCSS_STOP_SERVICE_FAILURE = -1073731795_i32
  EVENT_RPCSS_CREATEDEBUGGERPROCESS_FAILURE = -1073731794_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_DLL = -1073730824_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_ENTRY = -1073730823_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_CONTROL = -1073730822_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_DONE_EVENT = -1073730821_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_RPC = -1073730820_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_SHUTDOWN_NOTIFY = -1073730819_i32
  EVENT_DNS_CACHE_START_FAILURE_NO_UPDATE = -1073730818_i32
  EVENT_DNS_CACHE_START_FAILURE_LOW_MEMORY = -1073730817_i32
  EVENT_DNS_CACHE_NETWORK_PERF_WARNING = -2147472598_i32
  EVENT_DNS_CACHE_UNABLE_TO_REACH_SERVER_WARNING = -2147472597_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_TIMEOUT = -2147472498_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_SERVERFAIL = -2147472497_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_NOTSUPP = -2147472496_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_REFUSED = -2147472495_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_SECURITY = -2147472494_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_OTHER = -2147472493_i32
  EVENT_DNSAPI_PTR_REGISTRATION_FAILED_TIMEOUT = -2147472492_i32
  EVENT_DNSAPI_PTR_REGISTRATION_FAILED_SERVERFAIL = -2147472491_i32
  EVENT_DNSAPI_PTR_REGISTRATION_FAILED_NOTSUPP = -2147472490_i32
  EVENT_DNSAPI_PTR_REGISTRATION_FAILED_REFUSED = -2147472489_i32
  EVENT_DNSAPI_PTR_REGISTRATION_FAILED_SECURITY = -2147472488_i32
  EVENT_DNSAPI_PTR_REGISTRATION_FAILED_OTHER = -2147472487_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_TIMEOUT_PRIMARY_DN = -2147472486_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_SERVERFAIL_PRIMARY_DN = -2147472485_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_NOTSUPP_PRIMARY_DN = -2147472484_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_REFUSED_PRIMARY_DN = -2147472483_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_SECURITY_PRIMARY_DN = -2147472482_i32
  EVENT_DNSAPI_REGISTRATION_FAILED_OTHER_PRIMARY_DN = -2147472481_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_TIMEOUT = -2147472468_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_SERVERFAIL = -2147472467_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_NOTSUPP = -2147472466_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_REFUSED = -2147472465_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_SECURITY = -2147472464_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_OTHER = -2147472463_i32
  EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_TIMEOUT = -2147472462_i32
  EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_SERVERFAIL = -2147472461_i32
  EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_NOTSUPP = -2147472460_i32
  EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_REFUSED = -2147472459_i32
  EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_SECURITY = -2147472458_i32
  EVENT_DNSAPI_PTR_DEREGISTRATION_FAILED_OTHER = -2147472457_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_TIMEOUT_PRIMARY_DN = -2147472456_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_SERVERFAIL_PRIMARY_DN = -2147472455_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_NOTSUPP_PRIMARY_DN = -2147472454_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_REFUSED_PRIMARY_DN = -2147472453_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_SECURITY_PRIMARY_DN = -2147472452_i32
  EVENT_DNSAPI_DEREGISTRATION_FAILED_OTHER_PRIMARY_DN = -2147472451_i32
  EVENT_DNSAPI_REGISTERED_ADAPTER = 1073753024_i32
  EVENT_DNSAPI_REGISTERED_PTR = 1073753025_i32
  EVENT_DNSAPI_REGISTERED_ADAPTER_PRIMARY_DN = 1073753026_i32
  EVENT_TRK_INTERNAL_ERROR = -1073729324_i32
  EVENT_TRK_SERVICE_START_SUCCESS = 1073754325_i32
  EVENT_TRK_SERVICE_START_FAILURE = -1073729322_i32
  EVENT_TRK_SERVICE_CORRUPT_LOG = -1073729321_i32
  EVENT_TRK_SERVICE_VOL_QUOTA_EXCEEDED = -2147471144_i32
  EVENT_TRK_SERVICE_VOLUME_CREATE = 1073754329_i32
  EVENT_TRK_SERVICE_VOLUME_CLAIM = 1073754330_i32
  EVENT_TRK_SERVICE_DUPLICATE_VOLIDS = 1073754331_i32
  EVENT_TRK_SERVICE_MOVE_QUOTA_EXCEEDED = -2147471140_i32
  EVENT_FRS_ERROR = -1073728324_i32
  EVENT_FRS_STARTING = 1073755325_i32
  EVENT_FRS_STOPPING = 1073755326_i32
  EVENT_FRS_STOPPED = 1073755327_i32
  EVENT_FRS_STOPPED_FORCE = -1073728320_i32
  EVENT_FRS_STOPPED_ASSERT = -1073728319_i32
  EVENT_FRS_ASSERT = -1073728318_i32
  EVENT_FRS_VOLUME_NOT_SUPPORTED = -1073728317_i32
  EVENT_FRS_LONG_JOIN = -2147470140_i32
  EVENT_FRS_LONG_JOIN_DONE = -2147470139_i32
  EVENT_FRS_CANNOT_COMMUNICATE = -1073728314_i32
  EVENT_FRS_DATABASE_SPACE = -1073728313_i32
  EVENT_FRS_DISK_WRITE_CACHE_ENABLED = -2147470136_i32
  EVENT_FRS_JET_1414 = -1073728311_i32
  EVENT_FRS_SYSVOL_NOT_READY = -2147470134_i32
  EVENT_FRS_SYSVOL_NOT_READY_PRIMARY = -2147470133_i32
  EVENT_FRS_SYSVOL_READY = 1073755340_i32
  EVENT_FRS_ACCESS_CHECKS_DISABLED = -2147470131_i32
  EVENT_FRS_ACCESS_CHECKS_FAILED_USER = -2147470130_i32
  EVENT_FRS_ACCESS_CHECKS_FAILED_UNKNOWN = -1073728305_i32
  EVENT_FRS_MOVED_PREEXISTING = -2147470128_i32
  EVENT_FRS_CANNOT_START_BACKUP_RESTORE_IN_PROGRESS = -1073728303_i32
  EVENT_FRS_STAGING_AREA_FULL = -2147470126_i32
  EVENT_FRS_HUGE_FILE = -2147470125_i32
  EVENT_FRS_CANNOT_CREATE_UUID = -1073728300_i32
  EVENT_FRS_NO_DNS_ATTRIBUTE = -2147470123_i32
  EVENT_FRS_NO_SID = -1073728298_i32
  NTFRSPRF_OPEN_RPC_BINDING_ERROR_SET = -1073728297_i32
  NTFRSPRF_OPEN_RPC_BINDING_ERROR_CONN = -1073728296_i32
  NTFRSPRF_OPEN_RPC_CALL_ERROR_SET = -1073728295_i32
  NTFRSPRF_OPEN_RPC_CALL_ERROR_CONN = -1073728294_i32
  NTFRSPRF_COLLECT_RPC_BINDING_ERROR_SET = -1073728293_i32
  NTFRSPRF_COLLECT_RPC_BINDING_ERROR_CONN = -1073728292_i32
  NTFRSPRF_COLLECT_RPC_CALL_ERROR_SET = -1073728291_i32
  NTFRSPRF_COLLECT_RPC_CALL_ERROR_CONN = -1073728290_i32
  NTFRSPRF_VIRTUALALLOC_ERROR_SET = -1073728289_i32
  NTFRSPRF_VIRTUALALLOC_ERROR_CONN = -1073728288_i32
  NTFRSPRF_REGISTRY_ERROR_SET = -1073728287_i32
  NTFRSPRF_REGISTRY_ERROR_CONN = -1073728286_i32
  EVENT_FRS_ROOT_NOT_VALID = -1073728285_i32
  EVENT_FRS_STAGE_NOT_VALID = -1073728284_i32
  EVENT_FRS_OVERLAPS_LOGGING = -1073728283_i32
  EVENT_FRS_OVERLAPS_WORKING = -1073728282_i32
  EVENT_FRS_OVERLAPS_STAGE = -1073728281_i32
  EVENT_FRS_OVERLAPS_ROOT = -1073728280_i32
  EVENT_FRS_OVERLAPS_OTHER_STAGE = -1073728279_i32
  EVENT_FRS_PREPARE_ROOT_FAILED = -1073728278_i32
  EVENT_FRS_BAD_REG_DATA = -2147470101_i32
  EVENT_FRS_JOIN_FAIL_TIME_SKEW = -1073728276_i32
  EVENT_FRS_RMTCO_TIME_SKEW = -1073728275_i32
  EVENT_FRS_CANT_OPEN_STAGE = -1073728274_i32
  EVENT_FRS_CANT_OPEN_PREINSTALL = -1073728273_i32
  EVENT_FRS_REPLICA_SET_CREATE_FAIL = -1073728272_i32
  EVENT_FRS_REPLICA_SET_CREATE_OK = 1073755377_i32
  EVENT_FRS_REPLICA_SET_CXTIONS = 1073755378_i32
  EVENT_FRS_IN_ERROR_STATE = -1073728269_i32
  EVENT_FRS_REPLICA_NO_ROOT_CHANGE = -1073728268_i32
  EVENT_FRS_DUPLICATE_IN_CXTION_SYSVOL = -1073728267_i32
  EVENT_FRS_DUPLICATE_IN_CXTION = -1073728266_i32
  EVENT_FRS_ROOT_HAS_MOVED = -1073728265_i32
  EVENT_FRS_ERROR_REPLICA_SET_DELETED = -2147470088_i32
  EVENT_FRS_REPLICA_IN_JRNL_WRAP_ERROR = -1073728263_i32
  EVENT_FRS_DS_POLL_ERROR_SUMMARY = -2147470086_i32
  EVENT_PS_GPC_REGISTER_FAILED = -1073727824_i32
  EVENT_PS_NO_RESOURCES_FOR_INIT = -1073727823_i32
  EVENT_PS_REGISTER_PROTOCOL_FAILED = -1073727822_i32
  EVENT_PS_REGISTER_MINIPORT_FAILED = -1073727821_i32
  EVENT_PS_BAD_BESTEFFORT_LIMIT = -2147469548_i32
  EVENT_PS_QUERY_OID_GEN_MAXIMUM_FRAME_SIZE = -1073727723_i32
  EVENT_PS_QUERY_OID_GEN_MAXIMUM_TOTAL_SIZE = -1073727722_i32
  EVENT_PS_QUERY_OID_GEN_LINK_SPEED = -1073727721_i32
  EVENT_PS_BINDING_FAILED = -1073727720_i32
  EVENT_PS_MISSING_ADAPTER_REGISTRY_DATA = -1073727719_i32
  EVENT_PS_REGISTER_ADDRESS_FAMILY_FAILED = -1073727718_i32
  EVENT_PS_INIT_DEVICE_FAILED = -1073727717_i32
  EVENT_PS_WMI_INSTANCE_NAME_FAILED = -1073727716_i32
  EVENT_PS_WAN_LIMITED_BESTEFFORT = -2147469539_i32
  EVENT_PS_RESOURCE_POOL = -1073727714_i32
  EVENT_PS_ADMISSIONCONTROL_OVERFLOW = -2147469537_i32
  EVENT_PS_NETWORK_ADDRESS_FAIL = -1073727712_i32
  EXTRA_EXIT_POINT = -1073727524_i32
  MISSING_EXIT_POINT = -1073727523_i32
  MISSING_VOLUME = -1073727522_i32
  EXTRA_VOLUME = -1073727521_i32
  EXTRA_EXIT_POINT_DELETED = -1073727520_i32
  EXTRA_EXIT_POINT_NOT_DELETED = -1073727519_i32
  MISSING_EXIT_POINT_CREATED = -1073727518_i32
  MISSING_EXIT_POINT_NOT_CREATED = -1073727517_i32
  MISSING_VOLUME_CREATED = -1073727516_i32
  MISSING_VOLUME_NOT_CREATED = -1073727515_i32
  EXTRA_VOLUME_DELETED = -1073727514_i32
  EXTRA_VOLUME_NOT_DELETED = -1073727513_i32
  COULD_NOT_VERIFY_VOLUMES = -1073727512_i32
  KNOWLEDGE_INCONSISTENCY_DETECTED = -1073727511_i32
  PREFIX_MISMATCH = -1073727510_i32
  PREFIX_MISMATCH_FIXED = -1073727509_i32
  PREFIX_MISMATCH_NOT_FIXED = -1073727508_i32
  MACHINE_UNJOINED = -1073727507_i32
  DFS_REFERRAL_REQUEST = 1073756142_i32
  NOT_A_DFS_PATH = 1073756224_i32
  LM_REDIR_FAILURE = 1073756225_i32
  DFS_CONNECTION_FAILURE = 1073756226_i32
  DFS_REFERRAL_FAILURE = 1073756227_i32
  DFS_REFERRAL_SUCCESS = 1073756228_i32
  DFS_MAX_DNR_ATTEMPTS = 1073756229_i32
  DFS_SPECIAL_REFERRAL_FAILURE = 1073756230_i32
  DFS_OPEN_FAILURE = 1073756231_i32
  NET_DFS_ENUM = 1073756324_i32
  NET_DFS_ENUMEX = 1073756325_i32
  DFS_ERROR_CREATE_REPARSEPOINT_FAILURE = -1073727321_i32
  DFS_ERROR_UNSUPPORTED_FILESYSTEM = -1073727320_i32
  DFS_ERROR_OVERLAPPING_DIRECTORIES = -1073727319_i32
  DFS_INFO_ACTIVEDIRECTORY_ONLINE = 1073756332_i32
  DFS_ERROR_TOO_MANY_ERRORS = -1073727315_i32
  DFS_ERROR_WINSOCKINIT_FAILED = -1073727314_i32
  DFS_ERROR_SECURITYINIT_FAILED = -1073727313_i32
  DFS_ERROR_THREADINIT_FAILED = -1073727312_i32
  DFS_ERROR_SITECACHEINIT_FAILED = -1073727311_i32
  DFS_ERROR_ROOTSYNCINIT_FAILED = -1073727310_i32
  DFS_ERROR_CREATEEVENT_FAILED = -1073727309_i32
  DFS_ERROR_COMPUTERINFO_FAILED = -1073727308_i32
  DFS_ERROR_CLUSTERINFO_FAILED = -1073727307_i32
  DFS_ERROR_DCINFO_FAILED = -1073727306_i32
  DFS_ERROR_PREFIXTABLE_FAILED = -1073727305_i32
  DFS_ERROR_HANDLENAMESPACE_FAILED = -1073727304_i32
  DFS_ERROR_REGISTERSTORE_FAILED = -1073727303_i32
  DFS_ERROR_REFLECTIONENGINE_FAILED = -1073727302_i32
  DFS_ERROR_ACTIVEDIRECTORY_OFFLINE = -1073727301_i32
  DFS_ERROR_SITESUPPOR_FAILED = -1073727300_i32
  DFS_ERROR_DSCONNECT_FAILED = -2147469122_i32
  DFS_INFO_DS_RECONNECTED = 1073756353_i32
  DFS_ERROR_NO_DFS_DATA = -1073727294_i32
  DFS_INFO_FINISH_INIT = 1073756355_i32
  DFS_INFO_RECONNECT_DATA = 1073756356_i32
  DFS_INFO_FINISH_BUILDING_NAMESPACE = 1073756357_i32
  DFS_ERROR_ON_ROOT = -2147469114_i32
  DFS_ERROR_MUTLIPLE_ROOTS_NOT_SUPPORTED = -1073727289_i32
  DFS_WARN_DOMAIN_REFERRAL_OVERFLOW = -2147469112_i32
  DFS_INFO_DOMAIN_REFERRAL_MIN_OVERFLOW = 1073756361_i32
  DFS_WARN_INCOMPLETE_MOVE = -2147469110_i32
  DFS_ERROR_RESYNCHRONIZE_FAILED = -1073727285_i32
  DFS_ERROR_REMOVE_LINK_FAILED = -1073727284_i32
  DFS_WARN_METADATA_LINK_TYPE_INCORRECT = -2147469107_i32
  DFS_WARN_METADATA_LINK_INFO_INVALID = -2147469106_i32
  DFS_ERROR_TARGET_LIST_INCORRECT = -1073727281_i32
  DFS_ERROR_LINKS_OVERLAP = -1073727280_i32
  DFS_ERROR_LINK_OVERLAP = -1073727279_i32
  DFS_ERROR_CREATE_REPARSEPOINT_SUCCESS = 1073756370_i32
  DFS_ERROR_DUPLICATE_LINK = -1073727277_i32
  DFS_ERROR_TRUSTED_DOMAIN_INFO_FAILED = -1073727276_i32
  DFS_INFO_TRUSTED_DOMAIN_INFO_SUCCESS = 1073756373_i32
  DFS_ERROR_CROSS_FOREST_TRUST_INFO_FAILED = -1073727274_i32
  DFS_INFO_CROSS_FOREST_TRUST_INFO_SUCCESS = 1073756375_i32
  DFS_INIT_SUCCESS = 1073756376_i32
  DFS_ROOT_SHARE_ACQUIRE_FAILED = -2147469095_i32
  DFS_ROOT_SHARE_ACQUIRE_SUCCESS = 1073756378_i32
  EVENT_BRIDGE_PROTOCOL_REGISTER_FAILED = -1073727224_i32
  EVENT_BRIDGE_MINIPROT_DEVNAME_MISSING = -1073727223_i32
  EVENT_BRIDGE_MINIPORT_REGISTER_FAILED = -1073727222_i32
  EVENT_BRIDGE_DEVICE_CREATION_FAILED = -1073727221_i32
  EVENT_BRIDGE_NO_BRIDGE_MAC_ADDR = -1073727220_i32
  EVENT_BRIDGE_MINIPORT_INIT_FAILED = -1073727219_i32
  EVENT_BRIDGE_ETHERNET_NOT_OFFERED = -1073727218_i32
  EVENT_BRIDGE_THREAD_CREATION_FAILED = -1073727217_i32
  EVENT_BRIDGE_THREAD_REF_FAILED = -1073727216_i32
  EVENT_BRIDGE_PACKET_POOL_CREATION_FAILED = -1073727215_i32
  EVENT_BRIDGE_BUFFER_POOL_CREATION_FAILED = -1073727214_i32
  EVENT_BRIDGE_INIT_MALLOC_FAILED = -1073727213_i32
  EVENT_BRIDGE_ADAPTER_LINK_SPEED_QUERY_FAILED = -1073727124_i32
  EVENT_BRIDGE_ADAPTER_MAC_ADDR_QUERY_FAILED = -1073727123_i32
  EVENT_BRIDGE_ADAPTER_FILTER_FAILED = -1073727122_i32
  EVENT_BRIDGE_ADAPTER_NAME_QUERY_FAILED = -1073727121_i32
  EVENT_BRIDGE_ADAPTER_BIND_FAILED = -1073727120_i32
  EVENT_DAV_REDIR_DELAYED_WRITE_FAILED = -2147468848_i32
  EVENT_WEBCLIENT_CLOSE_PUT_FAILED = -2147468747_i32
  EVENT_WEBCLIENT_CLOSE_DELETE_FAILED = -2147468746_i32
  EVENT_WEBCLIENT_CLOSE_PROPPATCH_FAILED = -2147468745_i32
  EVENT_WEBCLIENT_SETINFO_PROPPATCH_FAILED = -2147468744_i32
  EVENT_WSK_OWNINGTHREAD_PARAMETER_IGNORED = -1073725824_i32
  EVENT_WINSOCK_TDI_FILTER_DETECTED = -2147467647_i32
  EVENT_WINSOCK_CLOSESOCKET_STUCK = -2147467646_i32
  EVENT_EQOS_INFO_MACHINE_POLICY_REFRESH_NO_CHANGE = 1073758324_i32
  EVENT_EQOS_INFO_MACHINE_POLICY_REFRESH_WITH_CHANGE = 1073758325_i32
  EVENT_EQOS_INFO_USER_POLICY_REFRESH_NO_CHANGE = 1073758326_i32
  EVENT_EQOS_INFO_USER_POLICY_REFRESH_WITH_CHANGE = 1073758327_i32
  EVENT_EQOS_INFO_TCP_AUTOTUNING_NOT_CONFIGURED = 1073758328_i32
  EVENT_EQOS_INFO_TCP_AUTOTUNING_OFF = 1073758329_i32
  EVENT_EQOS_INFO_TCP_AUTOTUNING_HIGHLY_RESTRICTED = 1073758330_i32
  EVENT_EQOS_INFO_TCP_AUTOTUNING_RESTRICTED = 1073758331_i32
  EVENT_EQOS_INFO_TCP_AUTOTUNING_NORMAL = 1073758332_i32
  EVENT_EQOS_INFO_APP_MARKING_NOT_CONFIGURED = 1073758333_i32
  EVENT_EQOS_INFO_APP_MARKING_IGNORED = 1073758334_i32
  EVENT_EQOS_INFO_APP_MARKING_ALLOWED = 1073758335_i32
  EVENT_EQOS_INFO_LOCAL_SETTING_DONT_USE_NLA = 1073758336_i32
  EVENT_EQOS_URL_QOS_APPLICATION_CONFLICT = 1073758337_i32
  EVENT_EQOS_WARNING_TEST_1 = -2147467048_i32
  EVENT_EQOS_WARNING_TEST_2 = -2147467047_i32
  EVENT_EQOS_WARNING_MACHINE_POLICY_VERSION = -2147467046_i32
  EVENT_EQOS_WARNING_USER_POLICY_VERSION = -2147467045_i32
  EVENT_EQOS_WARNING_MACHINE_POLICY_PROFILE_NOT_SPECIFIED = -2147467044_i32
  EVENT_EQOS_WARNING_USER_POLICY_PROFILE_NOT_SPECIFIED = -2147467043_i32
  EVENT_EQOS_WARNING_MACHINE_POLICY_QUOTA_EXCEEDED = -2147467042_i32
  EVENT_EQOS_WARNING_USER_POLICY_QUOTA_EXCEEDED = -2147467041_i32
  EVENT_EQOS_WARNING_MACHINE_POLICY_CONFLICT = -2147467040_i32
  EVENT_EQOS_WARNING_USER_POLICY_CONFLICT = -2147467039_i32
  EVENT_EQOS_WARNING_MACHINE_POLICY_NO_FULLPATH_APPNAME = -2147467038_i32
  EVENT_EQOS_WARNING_USER_POLICY_NO_FULLPATH_APPNAME = -2147467037_i32
  EVENT_EQOS_ERROR_MACHINE_POLICY_REFERESH = -1073725124_i32
  EVENT_EQOS_ERROR_USER_POLICY_REFERESH = -1073725123_i32
  EVENT_EQOS_ERROR_OPENING_MACHINE_POLICY_ROOT_KEY = -1073725122_i32
  EVENT_EQOS_ERROR_OPENING_USER_POLICY_ROOT_KEY = -1073725121_i32
  EVENT_EQOS_ERROR_MACHINE_POLICY_KEYNAME_TOO_LONG = -1073725120_i32
  EVENT_EQOS_ERROR_USER_POLICY_KEYNAME_TOO_LONG = -1073725119_i32
  EVENT_EQOS_ERROR_MACHINE_POLICY_KEYNAME_SIZE_ZERO = -1073725118_i32
  EVENT_EQOS_ERROR_USER_POLICY_KEYNAME_SIZE_ZERO = -1073725117_i32
  EVENT_EQOS_ERROR_OPENING_MACHINE_POLICY_SUBKEY = -1073725116_i32
  EVENT_EQOS_ERROR_OPENING_USER_POLICY_SUBKEY = -1073725115_i32
  EVENT_EQOS_ERROR_PROCESSING_MACHINE_POLICY_FIELD = -1073725114_i32
  EVENT_EQOS_ERROR_PROCESSING_USER_POLICY_FIELD = -1073725113_i32
  EVENT_EQOS_ERROR_SETTING_TCP_AUTOTUNING = -1073725112_i32
  EVENT_EQOS_ERROR_SETTING_APP_MARKING = -1073725111_i32
  EVENT_WINNAT_SESSION_LIMIT_REACHED = -2147466648_i32
  HARDWARE_ADDRESS_LENGTH = 6_u32
  NETMAN_VARTYPE_ULONG = 0_u32
  NETMAN_VARTYPE_HARDWARE_ADDRESS = 1_u32
  NETMAN_VARTYPE_STRING = 2_u32
  REPL_ROLE_EXPORT = 1_u32
  REPL_ROLE_IMPORT = 2_u32
  REPL_ROLE_BOTH = 3_u32
  REPL_INTERVAL_INFOLEVEL = 1000_u32
  REPL_PULSE_INFOLEVEL = 1001_u32
  REPL_GUARDTIME_INFOLEVEL = 1002_u32
  REPL_RANDOM_INFOLEVEL = 1003_u32
  REPL_INTEGRITY_FILE = 1_u32
  REPL_INTEGRITY_TREE = 2_u32
  REPL_EXTENT_FILE = 1_u32
  REPL_EXTENT_TREE = 2_u32
  REPL_EXPORT_INTEGRITY_INFOLEVEL = 1000_u32
  REPL_EXPORT_EXTENT_INFOLEVEL = 1001_u32
  REPL_UNLOCK_NOFORCE = 0_u32
  REPL_UNLOCK_FORCE = 1_u32
  REPL_STATE_OK = 0_u32
  REPL_STATE_NO_MASTER = 1_u32
  REPL_STATE_NO_SYNC = 2_u32
  REPL_STATE_NEVER_REPLICATED = 3_u32
  NETCFG_E_ALREADY_INITIALIZED = -2147180512_i32
  NETCFG_E_NOT_INITIALIZED = -2147180511_i32
  NETCFG_E_IN_USE = -2147180510_i32
  NETCFG_E_NO_WRITE_LOCK = -2147180508_i32
  NETCFG_E_NEED_REBOOT = -2147180507_i32
  NETCFG_E_ACTIVE_RAS_CONNECTIONS = -2147180506_i32
  NETCFG_E_ADAPTER_NOT_FOUND = -2147180505_i32
  NETCFG_E_COMPONENT_REMOVED_PENDING_REBOOT = -2147180504_i32
  NETCFG_E_MAX_FILTER_LIMIT = -2147180503_i32
  NETCFG_E_VMSWITCH_ACTIVE_OVER_ADAPTER = -2147180502_i32
  NETCFG_E_DUPLICATE_INSTANCEID = -2147180501_i32
  NETCFG_S_REBOOT = 303136_i32
  NETCFG_S_DISABLE_QUERY = 303138_i32
  NETCFG_S_STILL_REFERENCED = 303139_i32
  NETCFG_S_CAUSED_SETUP_CHANGE = 303140_i32
  NETCFG_S_COMMIT_NOW = 303141_i32
  WZC_PROFILE_SUCCESS = 0_u32
  WZC_PROFILE_XML_ERROR_NO_VERSION = 1_u32
  WZC_PROFILE_XML_ERROR_BAD_VERSION = 2_u32
  WZC_PROFILE_XML_ERROR_UNSUPPORTED_VERSION = 3_u32
  WZC_PROFILE_XML_ERROR_SSID_NOT_FOUND = 4_u32
  WZC_PROFILE_XML_ERROR_BAD_SSID = 5_u32
  WZC_PROFILE_XML_ERROR_CONNECTION_TYPE = 6_u32
  WZC_PROFILE_XML_ERROR_AUTHENTICATION = 7_u32
  WZC_PROFILE_XML_ERROR_ENCRYPTION = 8_u32
  WZC_PROFILE_XML_ERROR_KEY_PROVIDED_AUTOMATICALLY = 9_u32
  WZC_PROFILE_XML_ERROR_1X_ENABLED = 10_u32
  WZC_PROFILE_XML_ERROR_EAP_METHOD = 11_u32
  WZC_PROFILE_XML_ERROR_BAD_KEY_INDEX = 12_u32
  WZC_PROFILE_XML_ERROR_KEY_INDEX_RANGE = 13_u32
  WZC_PROFILE_XML_ERROR_BAD_NETWORK_KEY = 14_u32
  WZC_PROFILE_CONFIG_ERROR_INVALID_AUTH_FOR_CONNECTION_TYPE = 15_u32
  WZC_PROFILE_CONFIG_ERROR_INVALID_ENCRYPTION_FOR_AUTHMODE = 16_u32
  WZC_PROFILE_CONFIG_ERROR_KEY_REQUIRED = 17_u32
  WZC_PROFILE_CONFIG_ERROR_KEY_INDEX_REQUIRED = 18_u32
  WZC_PROFILE_CONFIG_ERROR_KEY_INDEX_NOT_APPLICABLE = 19_u32
  WZC_PROFILE_CONFIG_ERROR_1X_NOT_ALLOWED = 20_u32
  WZC_PROFILE_CONFIG_ERROR_1X_NOT_ALLOWED_KEY_REQUIRED = 21_u32
  WZC_PROFILE_CONFIG_ERROR_1X_NOT_ENABLED_KEY_PROVIDED = 22_u32
  WZC_PROFILE_CONFIG_ERROR_EAP_METHOD_REQUIRED = 23_u32
  WZC_PROFILE_CONFIG_ERROR_EAP_METHOD_NOT_APPLICABLE = 24_u32
  WZC_PROFILE_CONFIG_ERROR_WPA_NOT_SUPPORTED = 25_u32
  WZC_PROFILE_CONFIG_ERROR_WPA_ENCRYPTION_NOT_SUPPORTED = 26_u32
  WZC_PROFILE_SET_ERROR_DUPLICATE_NETWORK = 27_u32
  WZC_PROFILE_SET_ERROR_MEMORY_ALLOCATION = 28_u32
  WZC_PROFILE_SET_ERROR_READING_1X_CONFIG = 29_u32
  WZC_PROFILE_SET_ERROR_WRITING_1X_CONFIG = 30_u32
  WZC_PROFILE_SET_ERROR_WRITING_WZC_CFG = 31_u32
  WZC_PROFILE_API_ERROR_NOT_SUPPORTED = 32_u32
  WZC_PROFILE_API_ERROR_FAILED_TO_LOAD_XML = 33_u32
  WZC_PROFILE_API_ERROR_FAILED_TO_LOAD_SCHEMA = 34_u32
  WZC_PROFILE_API_ERROR_XML_VALIDATION_FAILED = 35_u32
  WZC_PROFILE_API_ERROR_INTERNAL = 36_u32
  RF_ROUTING = 1_u32
  RF_ROUTINGV6 = 2_u32
  RF_DEMAND_UPDATE_ROUTES = 4_u32
  RF_ADD_ALL_INTERFACES = 16_u32
  RF_MULTICAST = 32_u32
  RF_POWER = 64_u32
  MS_ROUTER_VERSION = 1536_u32
  ROUTING_DOMAIN_INFO_REVISION_1 = 1_u32
  INTERFACE_INFO_REVISION_1 = 1_u32
  IR_PROMISCUOUS = 0_u32
  IR_PROMISCUOUS_MULTICAST = 1_u32
  PROTO_IP_MSDP = 9_u32
  PROTO_IP_IGMP = 10_u32
  PROTO_IP_BGMP = 11_u32
  PROTO_IP_VRRP = 112_u32
  PROTO_IP_BOOTP = 9999_u32
  PROTO_IPV6_DHCP = 999_u32
  PROTO_IP_DNS_PROXY = 10003_u32
  PROTO_IP_DHCP_ALLOCATOR = 10004_u32
  PROTO_IP_NAT = 10005_u32
  PROTO_IP_DIFFSERV = 10008_u32
  PROTO_IP_MGM = 10009_u32
  PROTO_IP_ALG = 10010_u32
  PROTO_IP_H323 = 10011_u32
  PROTO_IP_FTP = 10012_u32
  PROTO_IP_DTP = 10013_u32
  PROTO_TYPE_UCAST = 0_u32
  PROTO_TYPE_MCAST = 1_u32
  PROTO_TYPE_MS0 = 2_u32
  PROTO_TYPE_MS1 = 3_u32
  PROTO_VENDOR_MS0 = 0_u32
  PROTO_VENDOR_MS1 = 311_u32
  PROTO_VENDOR_MS2 = 16383_u32
  IPX_PROTOCOL_BASE = 131071_u32
  IPX_PROTOCOL_RIP = 131072_u32
  RIS_INTERFACE_ADDRESS_CHANGE = 0_u32
  RIS_INTERFACE_ENABLED = 1_u32
  RIS_INTERFACE_DISABLED = 2_u32
  RIS_INTERFACE_MEDIA_PRESENT = 3_u32
  RIS_INTERFACE_MEDIA_ABSENT = 4_u32
  MRINFO_TUNNEL_FLAG = 1_u32
  MRINFO_PIM_FLAG = 4_u32
  MRINFO_DOWN_FLAG = 16_u32
  MRINFO_DISABLED_FLAG = 32_u32
  MRINFO_QUERIER_FLAG = 64_u32
  MRINFO_LEAF_FLAG = 128_u32
  MFE_NO_ERROR = 0_u32
  MFE_REACHED_CORE = 1_u32
  MFE_OIF_PRUNED = 5_u32
  MFE_PRUNED_UPSTREAM = 4_u32
  MFE_OLD_ROUTER = 11_u32
  MFE_NOT_FORWARDING = 2_u32
  MFE_WRONG_IF = 3_u32
  MFE_BOUNDARY_REACHED = 6_u32
  MFE_NO_MULTICAST = 7_u32
  MFE_IIF = 8_u32
  MFE_NO_ROUTE = 9_u32
  MFE_NOT_LAST_HOP = 10_u32
  MFE_PROHIBITED = 12_u32
  MFE_NO_SPACE = 13_u32
  ALIGN_SIZE = 8_u32
  RTR_INFO_BLOCK_VERSION = 1_u32
  TRACE_USE_FILE = 1_u32
  TRACE_USE_CONSOLE = 2_u32
  TRACE_NO_SYNCH = 4_u32
  TRACE_NO_STDINFO = 1_u32
  TRACE_USE_MASK = 2_u32
  TRACE_USE_MSEC = 4_u32
  TRACE_USE_DATE = 8_u32
  INVALID_TRACEID = 4294967295_u32
  RTUTILS_MAX_PROTOCOL_NAME_LEN = 40_u32
  RTUTILS_MAX_PROTOCOL_DLL_LEN = 48_u32
  MAX_PROTOCOL_NAME_LEN = 40_u32
  MAX_PROTOCOL_DLL_LEN = 48_u32
  CLSID_NetProvisioning = LibC::GUID.new(0x2aa2b5fe_u32, 0xb846_u16, 0x4d07_u16, StaticArray[0x81_u8, 0xc_u8, 0xb2_u8, 0x1e_u8, 0xe4_u8, 0x53_u8, 0x20_u8, 0xe3_u8])

  alias WORKERFUNCTION = Proc(Void*, Void)


  enum NET_REQUEST_PROVISION_OPTIONS : UInt32
    NETSETUP_PROVISION_ONLINE_CALLER = 1073741824
  end

  enum NET_JOIN_DOMAIN_JOIN_OPTIONS : UInt32
    NETSETUP_JOIN_DOMAIN = 1
    NETSETUP_ACCT_CREATE = 2
    NETSETUP_WIN9X_UPGRADE = 16
    NETSETUP_DOMAIN_JOIN_IF_JOINED = 32
    NETSETUP_JOIN_UNSECURE = 64
    NETSETUP_MACHINE_PWD_PASSED = 128
    NETSETUP_DEFER_SPN_SET = 256
    NETSETUP_JOIN_DC_ACCOUNT = 512
    NETSETUP_JOIN_WITH_NEW_NAME = 1024
    NETSETUP_JOIN_READONLY = 2048
    NETSETUP_AMBIGUOUS_DC = 4096
    NETSETUP_NO_NETLOGON_CACHE = 8192
    NETSETUP_DONT_CONTROL_SERVICES = 16384
    NETSETUP_SET_MACHINE_NAME = 32768
    NETSETUP_FORCE_SPN_SET = 65536
    NETSETUP_NO_ACCT_REUSE = 131072
    NETSETUP_IGNORE_UNSUPPORTED_FLAGS = 268435456
  end

  enum NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS : Int32
    SUPPORTS_REMOTE_ADMIN_PROTOCOL = 2
    SUPPORTS_RPC = 4
    SUPPORTS_SAM_PROTOCOL = 8
    SUPPORTS_UNICODE = 16
    SUPPORTS_LOCAL = 32
  end

  enum FORCE_LEVEL_FLAGS : UInt32
    USE_NOFORCE = 0
    USE_FORCE = 1
    USE_LOTS_OF_FORCE = 2
  end

  enum NET_SERVER_TYPE : UInt32
    SV_TYPE_WORKSTATION = 1
    SV_TYPE_SERVER = 2
    SV_TYPE_SQLSERVER = 4
    SV_TYPE_DOMAIN_CTRL = 8
    SV_TYPE_DOMAIN_BAKCTRL = 16
    SV_TYPE_TIME_SOURCE = 32
    SV_TYPE_AFP = 64
    SV_TYPE_NOVELL = 128
    SV_TYPE_DOMAIN_MEMBER = 256
    SV_TYPE_PRINTQ_SERVER = 512
    SV_TYPE_DIALIN_SERVER = 1024
    SV_TYPE_XENIX_SERVER = 2048
    SV_TYPE_SERVER_UNIX = 2048
    SV_TYPE_NT = 4096
    SV_TYPE_WFW = 8192
    SV_TYPE_SERVER_MFPN = 16384
    SV_TYPE_SERVER_NT = 32768
    SV_TYPE_POTENTIAL_BROWSER = 65536
    SV_TYPE_BACKUP_BROWSER = 131072
    SV_TYPE_MASTER_BROWSER = 262144
    SV_TYPE_DOMAIN_MASTER = 524288
    SV_TYPE_SERVER_OSF = 1048576
    SV_TYPE_SERVER_VMS = 2097152
    SV_TYPE_WINDOWS = 4194304
    SV_TYPE_DFS = 8388608
    SV_TYPE_CLUSTER_NT = 16777216
    SV_TYPE_TERMINALSERVER = 33554432
    SV_TYPE_CLUSTER_VS_NT = 67108864
    SV_TYPE_DCE = 268435456
    SV_TYPE_ALTERNATE_XPORT = 536870912
    SV_TYPE_LOCAL_LIST_ONLY = 1073741824
    SV_TYPE_DOMAIN_ENUM = 2147483648
    SV_TYPE_ALL = 4294967295
  end

  enum NET_USER_ENUM_FILTER_FLAGS : UInt32
    FILTER_TEMP_DUPLICATE_ACCOUNT = 1
    FILTER_NORMAL_ACCOUNT = 2
    FILTER_INTERDOMAIN_TRUST_ACCOUNT = 8
    FILTER_WORKSTATION_TRUST_ACCOUNT = 16
    FILTER_SERVER_TRUST_ACCOUNT = 32
  end

  enum NETSETUP_PROVISION : UInt32
    NETSETUP_PROVISION_DOWNLEVEL_PRIV_SUPPORT = 1
    NETSETUP_PROVISION_REUSE_ACCOUNT = 2
    NETSETUP_PROVISION_USE_DEFAULT_PASSWORD = 4
    NETSETUP_PROVISION_SKIP_ACCOUNT_SEARCH = 8
    NETSETUP_PROVISION_ROOT_CA_CERTS = 16
  end

  enum USER_ACCOUNT_FLAGS : UInt32
    UF_SCRIPT = 1
    UF_ACCOUNTDISABLE = 2
    UF_HOMEDIR_REQUIRED = 8
    UF_PASSWD_NOTREQD = 32
    UF_PASSWD_CANT_CHANGE = 64
    UF_LOCKOUT = 16
    UF_DONT_EXPIRE_PASSWD = 65536
    UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 128
    UF_NOT_DELEGATED = 1048576
    UF_SMARTCARD_REQUIRED = 262144
    UF_USE_DES_KEY_ONLY = 2097152
    UF_DONT_REQUIRE_PREAUTH = 4194304
    UF_TRUSTED_FOR_DELEGATION = 524288
    UF_PASSWORD_EXPIRED = 8388608
    UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 16777216
  end

  enum AF_OP : UInt32
    AF_OP_PRINT = 1
    AF_OP_COMM = 2
    AF_OP_SERVER = 4
    AF_OP_ACCOUNTS = 8
  end

  enum SERVER_INFO_SECURITY : UInt32
    SV_SHARESECURITY = 0
    SV_USERSECURITY = 1
  end

  enum USER_PRIV : UInt32
    USER_PRIV_GUEST = 0
    USER_PRIV_USER = 1
    USER_PRIV_ADMIN = 2
  end

  enum USE_INFO_ASG_TYPE : UInt32
    USE_WILDCARD = 4294967295
    USE_DISKDEV = 0
    USE_SPOOLDEV = 1
    USE_IPC = 3
  end

  enum SERVER_INFO_HIDDEN : UInt32
    SV_VISIBLE = 0
    SV_HIDDEN = 1
  end

  enum USER_MODALS_ROLES : UInt32
    UAS_ROLE_STANDALONE = 0
    UAS_ROLE_MEMBER = 1
    UAS_ROLE_BACKUP = 2
    UAS_ROLE_PRIMARY = 3
  end

  enum NET_VALIDATE_PASSWORD_TYPE : Int32
    NetValidateAuthentication = 1
    NetValidatePasswordChange = 2
    NetValidatePasswordReset = 3
  end

  enum MSA_INFO_LEVEL : Int32
    MsaInfoLevel0 = 0
    MsaInfoLevelMax = 1
  end

  enum MSA_INFO_STATE : Int32
    MsaInfoNotExist = 1
    MsaInfoNotService = 2
    MsaInfoCannotInstall = 3
    MsaInfoCanInstall = 4
    MsaInfoInstalled = 5
  end

  enum TRANSPORT_TYPE : Int32
    UseTransportType_None = 0
    UseTransportType_Wsk = 1
    UseTransportType_Quic = 2
  end

  enum NETSETUP_NAME_TYPE : Int32
    NetSetupUnknown = 0
    NetSetupMachine = 1
    NetSetupWorkgroup = 2
    NetSetupDomain = 3
    NetSetupNonExistentDomain = 4
    NetSetupDnsMachine = 5
  end

  enum DSREG_JOIN_TYPE : Int32
    DSREG_UNKNOWN_JOIN = 0
    DSREG_DEVICE_JOIN = 1
    DSREG_WORKPLACE_JOIN = 2
  end

  enum NET_COMPUTER_NAME_TYPE : Int32
    NetPrimaryComputerName = 0
    NetAlternateComputerNames = 1
    NetAllComputerNames = 2
    NetComputerNameTypeMax = 3
  end

  enum NETSETUP_JOIN_STATUS : Int32
    NetSetupUnknownStatus = 0
    NetSetupUnjoined = 1
    NetSetupWorkgroupName = 2
    NetSetupDomainName = 3
  end

  enum OBO_TOKEN_TYPE : Int32
    OBO_USER = 1
    OBO_COMPONENT = 2
    OBO_SOFTWARE = 3
  end

  enum COMPONENT_CHARACTERISTICS : Int32
    NCF_VIRTUAL = 1
    NCF_SOFTWARE_ENUMERATED = 2
    NCF_PHYSICAL = 4
    NCF_HIDDEN = 8
    NCF_NO_SERVICE = 16
    NCF_NOT_USER_REMOVABLE = 32
    NCF_MULTIPORT_INSTANCED_ADAPTER = 64
    NCF_HAS_UI = 128
    NCF_SINGLE_INSTANCE = 256
    NCF_FILTER = 1024
    NCF_DONTEXPOSELOWER = 4096
    NCF_HIDE_BINDING = 8192
    NCF_NDIS_PROTOCOL = 16384
    NCF_FIXED_BINDING = 131072
    NCF_LW_FILTER = 262144
  end

  enum NCRP_FLAGS : Int32
    NCRP_QUERY_PROPERTY_UI = 1
    NCRP_SHOW_PROPERTY_UI = 2
  end

  enum SUPPORTS_BINDING_INTERFACE_FLAGS : Int32
    NCF_LOWER = 1
    NCF_UPPER = 2
  end

  enum ENUM_BINDING_PATHS_FLAGS : Int32
    EBP_ABOVE = 1
    EBP_BELOW = 2
  end

  enum NCPNP_RECONFIG_LAYER : Int32
    NCRL_NDIS = 1
    NCRL_TDI = 2
  end

  enum NETWORK_INSTALL_TIME : Int32
    NSF_PRIMARYINSTALL = 1
    NSF_POSTSYSINSTALL = 2
  end

  enum NETWORK_UPGRADE_TYPE : Int32
    NSF_WIN16_UPGRADE = 16
    NSF_WIN95_UPGRADE = 32
    NSF_WINNT_WKS_UPGRADE = 64
    NSF_WINNT_SVR_UPGRADE = 128
    NSF_WINNT_SBS_UPGRADE = 256
    NSF_COMPONENT_UPDATE = 512
  end

  enum DEFAULT_PAGES : Int32
    DPP_ADVANCED = 1
  end

  enum BIND_FLAGS1 : Int32
    NCN_ADD = 1
    NCN_REMOVE = 2
    NCN_UPDATE = 4
    NCN_ENABLE = 16
    NCN_DISABLE = 32
    NCN_BINDING_PATH = 256
    NCN_PROPERTYCHANGE = 512
    NCN_NET = 65536
    NCN_NETTRANS = 131072
    NCN_NETCLIENT = 262144
    NCN_NETSERVICE = 524288
  end

  enum Tagrascon_ipui_flags : Int32
    RCUIF_VPN = 1
    RCUIF_DEMAND_DIAL = 2
    RCUIF_NOT_ADMIN = 4
    RCUIF_USE_IPv4_STATICADDRESS = 8
    RCUIF_USE_IPv4_NAME_SERVERS = 16
    RCUIF_USE_IPv4_REMOTE_GATEWAY = 32
    RCUIF_USE_IPv4_EXPLICIT_METRIC = 64
    RCUIF_USE_HEADER_COMPRESSION = 128
    RCUIF_USE_DISABLE_REGISTER_DNS = 256
    RCUIF_USE_PRIVATE_DNS_SUFFIX = 512
    RCUIF_ENABLE_NBT = 1024
    RCUIF_USE_IPv6_STATICADDRESS = 2048
    RCUIF_USE_IPv6_NAME_SERVERS = 4096
    RCUIF_USE_IPv6_REMOTE_GATEWAY = 8192
    RCUIF_USE_IPv6_EXPLICIT_METRIC = 16384
    RCUIF_DISABLE_CLASS_BASED_ROUTE = 32768
  end

  struct USER_INFO_0
    usri0_name : LibC::LPWSTR
  end
  struct USER_INFO_1
    usri1_name : LibC::LPWSTR
    usri1_password : LibC::LPWSTR
    usri1_password_age : UInt32
    usri1_priv : USER_PRIV
    usri1_home_dir : LibC::LPWSTR
    usri1_comment : LibC::LPWSTR
    usri1_flags : USER_ACCOUNT_FLAGS
    usri1_script_path : LibC::LPWSTR
  end
  struct USER_INFO_2
    usri2_name : LibC::LPWSTR
    usri2_password : LibC::LPWSTR
    usri2_password_age : UInt32
    usri2_priv : USER_PRIV
    usri2_home_dir : LibC::LPWSTR
    usri2_comment : LibC::LPWSTR
    usri2_flags : USER_ACCOUNT_FLAGS
    usri2_script_path : LibC::LPWSTR
    usri2_auth_flags : AF_OP
    usri2_full_name : LibC::LPWSTR
    usri2_usr_comment : LibC::LPWSTR
    usri2_parms : LibC::LPWSTR
    usri2_workstations : LibC::LPWSTR
    usri2_last_logon : UInt32
    usri2_last_logoff : UInt32
    usri2_acct_expires : UInt32
    usri2_max_storage : UInt32
    usri2_units_per_week : UInt32
    usri2_logon_hours : UInt8*
    usri2_bad_pw_count : UInt32
    usri2_num_logons : UInt32
    usri2_logon_server : LibC::LPWSTR
    usri2_country_code : UInt32
    usri2_code_page : UInt32
  end
  struct USER_INFO_3
    usri3_name : LibC::LPWSTR
    usri3_password : LibC::LPWSTR
    usri3_password_age : UInt32
    usri3_priv : USER_PRIV
    usri3_home_dir : LibC::LPWSTR
    usri3_comment : LibC::LPWSTR
    usri3_flags : USER_ACCOUNT_FLAGS
    usri3_script_path : LibC::LPWSTR
    usri3_auth_flags : AF_OP
    usri3_full_name : LibC::LPWSTR
    usri3_usr_comment : LibC::LPWSTR
    usri3_parms : LibC::LPWSTR
    usri3_workstations : LibC::LPWSTR
    usri3_last_logon : UInt32
    usri3_last_logoff : UInt32
    usri3_acct_expires : UInt32
    usri3_max_storage : UInt32
    usri3_units_per_week : UInt32
    usri3_logon_hours : UInt8*
    usri3_bad_pw_count : UInt32
    usri3_num_logons : UInt32
    usri3_logon_server : LibC::LPWSTR
    usri3_country_code : UInt32
    usri3_code_page : UInt32
    usri3_user_id : UInt32
    usri3_primary_group_id : UInt32
    usri3_profile : LibC::LPWSTR
    usri3_home_dir_drive : LibC::LPWSTR
    usri3_password_expired : UInt32
  end
  struct USER_INFO_4
    usri4_name : LibC::LPWSTR
    usri4_password : LibC::LPWSTR
    usri4_password_age : UInt32
    usri4_priv : USER_PRIV
    usri4_home_dir : LibC::LPWSTR
    usri4_comment : LibC::LPWSTR
    usri4_flags : USER_ACCOUNT_FLAGS
    usri4_script_path : LibC::LPWSTR
    usri4_auth_flags : AF_OP
    usri4_full_name : LibC::LPWSTR
    usri4_usr_comment : LibC::LPWSTR
    usri4_parms : LibC::LPWSTR
    usri4_workstations : LibC::LPWSTR
    usri4_last_logon : UInt32
    usri4_last_logoff : UInt32
    usri4_acct_expires : UInt32
    usri4_max_storage : UInt32
    usri4_units_per_week : UInt32
    usri4_logon_hours : UInt8*
    usri4_bad_pw_count : UInt32
    usri4_num_logons : UInt32
    usri4_logon_server : LibC::LPWSTR
    usri4_country_code : UInt32
    usri4_code_page : UInt32
    usri4_user_sid : PSID
    usri4_primary_group_id : UInt32
    usri4_profile : LibC::LPWSTR
    usri4_home_dir_drive : LibC::LPWSTR
    usri4_password_expired : UInt32
  end
  struct USER_INFO_10
    usri10_name : LibC::LPWSTR
    usri10_comment : LibC::LPWSTR
    usri10_usr_comment : LibC::LPWSTR
    usri10_full_name : LibC::LPWSTR
  end
  struct USER_INFO_11
    usri11_name : LibC::LPWSTR
    usri11_comment : LibC::LPWSTR
    usri11_usr_comment : LibC::LPWSTR
    usri11_full_name : LibC::LPWSTR
    usri11_priv : USER_PRIV
    usri11_auth_flags : AF_OP
    usri11_password_age : UInt32
    usri11_home_dir : LibC::LPWSTR
    usri11_parms : LibC::LPWSTR
    usri11_last_logon : UInt32
    usri11_last_logoff : UInt32
    usri11_bad_pw_count : UInt32
    usri11_num_logons : UInt32
    usri11_logon_server : LibC::LPWSTR
    usri11_country_code : UInt32
    usri11_workstations : LibC::LPWSTR
    usri11_max_storage : UInt32
    usri11_units_per_week : UInt32
    usri11_logon_hours : UInt8*
    usri11_code_page : UInt32
  end
  struct USER_INFO_20
    usri20_name : LibC::LPWSTR
    usri20_full_name : LibC::LPWSTR
    usri20_comment : LibC::LPWSTR
    usri20_flags : USER_ACCOUNT_FLAGS
    usri20_user_id : UInt32
  end
  struct USER_INFO_21
    usri21_password : UInt8[16]*
  end
  struct USER_INFO_22
    usri22_name : LibC::LPWSTR
    usri22_password : UInt8[16]*
    usri22_password_age : UInt32
    usri22_priv : USER_PRIV
    usri22_home_dir : LibC::LPWSTR
    usri22_comment : LibC::LPWSTR
    usri22_flags : USER_ACCOUNT_FLAGS
    usri22_script_path : LibC::LPWSTR
    usri22_auth_flags : AF_OP
    usri22_full_name : LibC::LPWSTR
    usri22_usr_comment : LibC::LPWSTR
    usri22_parms : LibC::LPWSTR
    usri22_workstations : LibC::LPWSTR
    usri22_last_logon : UInt32
    usri22_last_logoff : UInt32
    usri22_acct_expires : UInt32
    usri22_max_storage : UInt32
    usri22_units_per_week : UInt32
    usri22_logon_hours : UInt8*
    usri22_bad_pw_count : UInt32
    usri22_num_logons : UInt32
    usri22_logon_server : LibC::LPWSTR
    usri22_country_code : UInt32
    usri22_code_page : UInt32
  end
  struct USER_INFO_23
    usri23_name : LibC::LPWSTR
    usri23_full_name : LibC::LPWSTR
    usri23_comment : LibC::LPWSTR
    usri23_flags : USER_ACCOUNT_FLAGS
    usri23_user_sid : PSID
  end
  struct USER_INFO_24
    usri24_internet_identity : LibC::BOOL
    usri24_flags : UInt32
    usri24_internet_provider_name : LibC::LPWSTR
    usri24_internet_principal_name : LibC::LPWSTR
    usri24_user_sid : PSID
  end
  struct USER_INFO_1003
    usri1003_password : LibC::LPWSTR
  end
  struct USER_INFO_1005
    usri1005_priv : USER_PRIV
  end
  struct USER_INFO_1006
    usri1006_home_dir : LibC::LPWSTR
  end
  struct USER_INFO_1007
    usri1007_comment : LibC::LPWSTR
  end
  struct USER_INFO_1008
    usri1008_flags : USER_ACCOUNT_FLAGS
  end
  struct USER_INFO_1009
    usri1009_script_path : LibC::LPWSTR
  end
  struct USER_INFO_1010
    usri1010_auth_flags : AF_OP
  end
  struct USER_INFO_1011
    usri1011_full_name : LibC::LPWSTR
  end
  struct USER_INFO_1012
    usri1012_usr_comment : LibC::LPWSTR
  end
  struct USER_INFO_1013
    usri1013_parms : LibC::LPWSTR
  end
  struct USER_INFO_1014
    usri1014_workstations : LibC::LPWSTR
  end
  struct USER_INFO_1017
    usri1017_acct_expires : UInt32
  end
  struct USER_INFO_1018
    usri1018_max_storage : UInt32
  end
  struct USER_INFO_1020
    usri1020_units_per_week : UInt32
    usri1020_logon_hours : UInt8*
  end
  struct USER_INFO_1023
    usri1023_logon_server : LibC::LPWSTR
  end
  struct USER_INFO_1024
    usri1024_country_code : UInt32
  end
  struct USER_INFO_1025
    usri1025_code_page : UInt32
  end
  struct USER_INFO_1051
    usri1051_primary_group_id : UInt32
  end
  struct USER_INFO_1052
    usri1052_profile : LibC::LPWSTR
  end
  struct USER_INFO_1053
    usri1053_home_dir_drive : LibC::LPWSTR
  end
  struct USER_MODALS_INFO_0
    usrmod0_min_passwd_len : UInt32
    usrmod0_max_passwd_age : UInt32
    usrmod0_min_passwd_age : UInt32
    usrmod0_force_logoff : UInt32
    usrmod0_password_hist_len : UInt32
  end
  struct USER_MODALS_INFO_1
    usrmod1_role : UInt32
    usrmod1_primary : LibC::LPWSTR
  end
  struct USER_MODALS_INFO_2
    usrmod2_domain_name : LibC::LPWSTR
    usrmod2_domain_id : PSID
  end
  struct USER_MODALS_INFO_3
    usrmod3_lockout_duration : UInt32
    usrmod3_lockout_observation_window : UInt32
    usrmod3_lockout_threshold : UInt32
  end
  struct USER_MODALS_INFO_1001
    usrmod1001_min_passwd_len : UInt32
  end
  struct USER_MODALS_INFO_1002
    usrmod1002_max_passwd_age : UInt32
  end
  struct USER_MODALS_INFO_1003
    usrmod1003_min_passwd_age : UInt32
  end
  struct USER_MODALS_INFO_1004
    usrmod1004_force_logoff : UInt32
  end
  struct USER_MODALS_INFO_1005
    usrmod1005_password_hist_len : UInt32
  end
  struct USER_MODALS_INFO_1006
    usrmod1006_role : USER_MODALS_ROLES
  end
  struct USER_MODALS_INFO_1007
    usrmod1007_primary : LibC::LPWSTR
  end
  struct GROUP_INFO_0
    grpi0_name : LibC::LPWSTR
  end
  struct GROUP_INFO_1
    grpi1_name : LibC::LPWSTR
    grpi1_comment : LibC::LPWSTR
  end
  struct GROUP_INFO_2
    grpi2_name : LibC::LPWSTR
    grpi2_comment : LibC::LPWSTR
    grpi2_group_id : UInt32
    grpi2_attributes : UInt32
  end
  struct GROUP_INFO_3
    grpi3_name : LibC::LPWSTR
    grpi3_comment : LibC::LPWSTR
    grpi3_group_sid : PSID
    grpi3_attributes : UInt32
  end
  struct GROUP_INFO_1002
    grpi1002_comment : LibC::LPWSTR
  end
  struct GROUP_INFO_1005
    grpi1005_attributes : UInt32
  end
  struct GROUP_USERS_INFO_0
    grui0_name : LibC::LPWSTR
  end
  struct GROUP_USERS_INFO_1
    grui1_name : LibC::LPWSTR
    grui1_attributes : UInt32
  end
  struct LOCALGROUP_INFO_0
    lgrpi0_name : LibC::LPWSTR
  end
  struct LOCALGROUP_INFO_1
    lgrpi1_name : LibC::LPWSTR
    lgrpi1_comment : LibC::LPWSTR
  end
  struct LOCALGROUP_INFO_1002
    lgrpi1002_comment : LibC::LPWSTR
  end
  struct LOCALGROUP_MEMBERS_INFO_0
    lgrmi0_sid : PSID
  end
  struct LOCALGROUP_MEMBERS_INFO_1
    lgrmi1_sid : PSID
    lgrmi1_sidusage : SID_NAME_USE
    lgrmi1_name : LibC::LPWSTR
  end
  struct LOCALGROUP_MEMBERS_INFO_2
    lgrmi2_sid : PSID
    lgrmi2_sidusage : SID_NAME_USE
    lgrmi2_domainandname : LibC::LPWSTR
  end
  struct LOCALGROUP_MEMBERS_INFO_3
    lgrmi3_domainandname : LibC::LPWSTR
  end
  struct LOCALGROUP_USERS_INFO_0
    lgrui0_name : LibC::LPWSTR
  end
  struct NET_DISPLAY_USER
    usri1_name : LibC::LPWSTR
    usri1_comment : LibC::LPWSTR
    usri1_flags : USER_ACCOUNT_FLAGS
    usri1_full_name : LibC::LPWSTR
    usri1_user_id : UInt32
    usri1_next_index : UInt32
  end
  struct NET_DISPLAY_MACHINE
    usri2_name : LibC::LPWSTR
    usri2_comment : LibC::LPWSTR
    usri2_flags : USER_ACCOUNT_FLAGS
    usri2_user_id : UInt32
    usri2_next_index : UInt32
  end
  struct NET_DISPLAY_GROUP
    grpi3_name : LibC::LPWSTR
    grpi3_comment : LibC::LPWSTR
    grpi3_group_id : UInt32
    grpi3_attributes : UInt32
    grpi3_next_index : UInt32
  end
  struct ACCESS_INFO_0
    acc0_resource_name : LibC::LPWSTR
  end
  struct ACCESS_INFO_1
    acc1_resource_name : LibC::LPWSTR
    acc1_attr : UInt32
    acc1_count : UInt32
  end
  struct ACCESS_INFO_1002
    acc1002_attr : UInt32
  end
  struct ACCESS_LIST
    acl_ugname : LibC::LPWSTR
    acl_access : UInt32
  end
  struct NET_VALIDATE_PASSWORD_HASH
    length : UInt32
    hash : UInt8*
  end
  struct NET_VALIDATE_PERSISTED_FIELDS
    present_fields : UInt32
    password_last_set : FILETIME
    bad_password_time : FILETIME
    lockout_time : FILETIME
    bad_password_count : UInt32
    password_history_length : UInt32
    password_history : NET_VALIDATE_PASSWORD_HASH*
  end
  struct NET_VALIDATE_OUTPUT_ARG
    changed_persisted_fields : NET_VALIDATE_PERSISTED_FIELDS
    validation_status : UInt32
  end
  struct NET_VALIDATE_AUTHENTICATION_INPUT_ARG
    input_persisted_fields : NET_VALIDATE_PERSISTED_FIELDS
    password_matched : BOOLEAN
  end
  struct NET_VALIDATE_PASSWORD_CHANGE_INPUT_ARG
    input_persisted_fields : NET_VALIDATE_PERSISTED_FIELDS
    clear_password : LibC::LPWSTR
    user_account_name : LibC::LPWSTR
    hashed_password : NET_VALIDATE_PASSWORD_HASH
    password_match : BOOLEAN
  end
  struct NET_VALIDATE_PASSWORD_RESET_INPUT_ARG
    input_persisted_fields : NET_VALIDATE_PERSISTED_FIELDS
    clear_password : LibC::LPWSTR
    user_account_name : LibC::LPWSTR
    hashed_password : NET_VALIDATE_PASSWORD_HASH
    password_must_change_at_next_logon : BOOLEAN
    clear_lockout : BOOLEAN
  end
  struct NETLOGON_INFO_1
    netlog1_flags : UInt32
    netlog1_pdc_connection_status : UInt32
  end
  struct NETLOGON_INFO_2
    netlog2_flags : UInt32
    netlog2_pdc_connection_status : UInt32
    netlog2_trusted_dc_name : LibC::LPWSTR
    netlog2_tc_connection_status : UInt32
  end
  struct NETLOGON_INFO_3
    netlog3_flags : UInt32
    netlog3_logon_attempts : UInt32
    netlog3_reserved1 : UInt32
    netlog3_reserved2 : UInt32
    netlog3_reserved3 : UInt32
    netlog3_reserved4 : UInt32
    netlog3_reserved5 : UInt32
  end
  struct NETLOGON_INFO_4
    netlog4_trusted_dc_name : LibC::LPWSTR
    netlog4_trusted_domain_name : LibC::LPWSTR
  end
  struct MSA_INFO_0
    state : MSA_INFO_STATE
  end
  struct STD_ALERT
    alrt_timestamp : UInt32
    alrt_eventname : Char[17]*
    alrt_servicename : Char[81]*
  end
  struct ADMIN_OTHER_INFO
    alrtad_errcode : UInt32
    alrtad_numstrings : UInt32
  end
  struct ERRLOG_OTHER_INFO
    alrter_errcode : UInt32
    alrter_offset : UInt32
  end
  struct PRINT_OTHER_INFO
    alrtpr_jobid : UInt32
    alrtpr_status : UInt32
    alrtpr_submitted : UInt32
    alrtpr_size : UInt32
  end
  struct USER_OTHER_INFO
    alrtus_errcode : UInt32
    alrtus_numstrings : UInt32
  end
  struct MSG_INFO_0
    msgi0_name : LibC::LPWSTR
  end
  struct MSG_INFO_1
    msgi1_name : LibC::LPWSTR
    msgi1_forward_flag : UInt32
    msgi1_forward : LibC::LPWSTR
  end
  struct TIME_OF_DAY_INFO
    tod_elapsedt : UInt32
    tod_msecs : UInt32
    tod_hours : UInt32
    tod_mins : UInt32
    tod_secs : UInt32
    tod_hunds : UInt32
    tod_timezone : Int32
    tod_tinterval : UInt32
    tod_day : UInt32
    tod_month : UInt32
    tod_year : UInt32
    tod_weekday : UInt32
  end
  struct REPL_INFO_0
    rp0_role : UInt32
    rp0_exportpath : LibC::LPWSTR
    rp0_exportlist : LibC::LPWSTR
    rp0_importpath : LibC::LPWSTR
    rp0_importlist : LibC::LPWSTR
    rp0_logonusername : LibC::LPWSTR
    rp0_interval : UInt32
    rp0_pulse : UInt32
    rp0_guardtime : UInt32
    rp0_random : UInt32
  end
  struct REPL_INFO_1000
    rp1000_interval : UInt32
  end
  struct REPL_INFO_1001
    rp1001_pulse : UInt32
  end
  struct REPL_INFO_1002
    rp1002_guardtime : UInt32
  end
  struct REPL_INFO_1003
    rp1003_random : UInt32
  end
  struct REPL_EDIR_INFO_0
    rped0_dirname : LibC::LPWSTR
  end
  struct REPL_EDIR_INFO_1
    rped1_dirname : LibC::LPWSTR
    rped1_integrity : UInt32
    rped1_extent : UInt32
  end
  struct REPL_EDIR_INFO_2
    rped2_dirname : LibC::LPWSTR
    rped2_integrity : UInt32
    rped2_extent : UInt32
    rped2_lockcount : UInt32
    rped2_locktime : UInt32
  end
  struct REPL_EDIR_INFO_1000
    rped1000_integrity : UInt32
  end
  struct REPL_EDIR_INFO_1001
    rped1001_extent : UInt32
  end
  struct REPL_IDIR_INFO_0
    rpid0_dirname : LibC::LPWSTR
  end
  struct REPL_IDIR_INFO_1
    rpid1_dirname : LibC::LPWSTR
    rpid1_state : UInt32
    rpid1_mastername : LibC::LPWSTR
    rpid1_last_update_time : UInt32
    rpid1_lockcount : UInt32
    rpid1_locktime : UInt32
  end
  struct SERVER_INFO_100
    sv100_platform_id : UInt32
    sv100_name : LibC::LPWSTR
  end
  struct SERVER_INFO_101
    sv101_platform_id : UInt32
    sv101_name : LibC::LPWSTR
    sv101_version_major : UInt32
    sv101_version_minor : UInt32
    sv101_type : NET_SERVER_TYPE
    sv101_comment : LibC::LPWSTR
  end
  struct SERVER_INFO_102
    sv102_platform_id : UInt32
    sv102_name : LibC::LPWSTR
    sv102_version_major : UInt32
    sv102_version_minor : UInt32
    sv102_type : NET_SERVER_TYPE
    sv102_comment : LibC::LPWSTR
    sv102_users : UInt32
    sv102_disc : Int32
    sv102_hidden : SERVER_INFO_HIDDEN
    sv102_announce : UInt32
    sv102_anndelta : UInt32
    sv102_licenses : UInt32
    sv102_userpath : LibC::LPWSTR
  end
  struct SERVER_INFO_103
    sv103_platform_id : UInt32
    sv103_name : LibC::LPWSTR
    sv103_version_major : UInt32
    sv103_version_minor : UInt32
    sv103_type : UInt32
    sv103_comment : LibC::LPWSTR
    sv103_users : UInt32
    sv103_disc : Int32
    sv103_hidden : LibC::BOOL
    sv103_announce : UInt32
    sv103_anndelta : UInt32
    sv103_licenses : UInt32
    sv103_userpath : LibC::LPWSTR
    sv103_capabilities : UInt32
  end
  struct SERVER_INFO_402
    sv402_ulist_mtime : UInt32
    sv402_glist_mtime : UInt32
    sv402_alist_mtime : UInt32
    sv402_alerts : LibC::LPWSTR
    sv402_security : SERVER_INFO_SECURITY
    sv402_numadmin : UInt32
    sv402_lanmask : UInt32
    sv402_guestacct : LibC::LPWSTR
    sv402_chdevs : UInt32
    sv402_chdevq : UInt32
    sv402_chdevjobs : UInt32
    sv402_connections : UInt32
    sv402_shares : UInt32
    sv402_openfiles : UInt32
    sv402_sessopens : UInt32
    sv402_sessvcs : UInt32
    sv402_sessreqs : UInt32
    sv402_opensearch : UInt32
    sv402_activelocks : UInt32
    sv402_numreqbuf : UInt32
    sv402_sizreqbuf : UInt32
    sv402_numbigbuf : UInt32
    sv402_numfiletasks : UInt32
    sv402_alertsched : UInt32
    sv402_erroralert : UInt32
    sv402_logonalert : UInt32
    sv402_accessalert : UInt32
    sv402_diskalert : UInt32
    sv402_netioalert : UInt32
    sv402_maxauditsz : UInt32
    sv402_srvheuristics : LibC::LPWSTR
  end
  struct SERVER_INFO_403
    sv403_ulist_mtime : UInt32
    sv403_glist_mtime : UInt32
    sv403_alist_mtime : UInt32
    sv403_alerts : LibC::LPWSTR
    sv403_security : SERVER_INFO_SECURITY
    sv403_numadmin : UInt32
    sv403_lanmask : UInt32
    sv403_guestacct : LibC::LPWSTR
    sv403_chdevs : UInt32
    sv403_chdevq : UInt32
    sv403_chdevjobs : UInt32
    sv403_connections : UInt32
    sv403_shares : UInt32
    sv403_openfiles : UInt32
    sv403_sessopens : UInt32
    sv403_sessvcs : UInt32
    sv403_sessreqs : UInt32
    sv403_opensearch : UInt32
    sv403_activelocks : UInt32
    sv403_numreqbuf : UInt32
    sv403_sizreqbuf : UInt32
    sv403_numbigbuf : UInt32
    sv403_numfiletasks : UInt32
    sv403_alertsched : UInt32
    sv403_erroralert : UInt32
    sv403_logonalert : UInt32
    sv403_accessalert : UInt32
    sv403_diskalert : UInt32
    sv403_netioalert : UInt32
    sv403_maxauditsz : UInt32
    sv403_srvheuristics : LibC::LPWSTR
    sv403_auditedevents : UInt32
    sv403_autoprofile : UInt32
    sv403_autopath : LibC::LPWSTR
  end
  struct SERVER_INFO_502
    sv502_sessopens : UInt32
    sv502_sessvcs : UInt32
    sv502_opensearch : UInt32
    sv502_sizreqbuf : UInt32
    sv502_initworkitems : UInt32
    sv502_maxworkitems : UInt32
    sv502_rawworkitems : UInt32
    sv502_irpstacksize : UInt32
    sv502_maxrawbuflen : UInt32
    sv502_sessusers : UInt32
    sv502_sessconns : UInt32
    sv502_maxpagedmemoryusage : UInt32
    sv502_maxnonpagedmemoryusage : UInt32
    sv502_enablesoftcompat : LibC::BOOL
    sv502_enableforcedlogoff : LibC::BOOL
    sv502_timesource : LibC::BOOL
    sv502_acceptdownlevelapis : LibC::BOOL
    sv502_lmannounce : LibC::BOOL
  end
  struct SERVER_INFO_503
    sv503_sessopens : UInt32
    sv503_sessvcs : UInt32
    sv503_opensearch : UInt32
    sv503_sizreqbuf : UInt32
    sv503_initworkitems : UInt32
    sv503_maxworkitems : UInt32
    sv503_rawworkitems : UInt32
    sv503_irpstacksize : UInt32
    sv503_maxrawbuflen : UInt32
    sv503_sessusers : UInt32
    sv503_sessconns : UInt32
    sv503_maxpagedmemoryusage : UInt32
    sv503_maxnonpagedmemoryusage : UInt32
    sv503_enablesoftcompat : LibC::BOOL
    sv503_enableforcedlogoff : LibC::BOOL
    sv503_timesource : LibC::BOOL
    sv503_acceptdownlevelapis : LibC::BOOL
    sv503_lmannounce : LibC::BOOL
    sv503_domain : LibC::LPWSTR
    sv503_maxcopyreadlen : UInt32
    sv503_maxcopywritelen : UInt32
    sv503_minkeepsearch : UInt32
    sv503_maxkeepsearch : UInt32
    sv503_minkeepcomplsearch : UInt32
    sv503_maxkeepcomplsearch : UInt32
    sv503_threadcountadd : UInt32
    sv503_numblockthreads : UInt32
    sv503_scavtimeout : UInt32
    sv503_minrcvqueue : UInt32
    sv503_minfreeworkitems : UInt32
    sv503_xactmemsize : UInt32
    sv503_threadpriority : UInt32
    sv503_maxmpxct : UInt32
    sv503_oplockbreakwait : UInt32
    sv503_oplockbreakresponsewait : UInt32
    sv503_enableoplocks : LibC::BOOL
    sv503_enableoplockforceclose : LibC::BOOL
    sv503_enablefcbopens : LibC::BOOL
    sv503_enableraw : LibC::BOOL
    sv503_enablesharednetdrives : LibC::BOOL
    sv503_minfreeconnections : UInt32
    sv503_maxfreeconnections : UInt32
  end
  struct SERVER_INFO_599
    sv599_sessopens : UInt32
    sv599_sessvcs : UInt32
    sv599_opensearch : UInt32
    sv599_sizreqbuf : UInt32
    sv599_initworkitems : UInt32
    sv599_maxworkitems : UInt32
    sv599_rawworkitems : UInt32
    sv599_irpstacksize : UInt32
    sv599_maxrawbuflen : UInt32
    sv599_sessusers : UInt32
    sv599_sessconns : UInt32
    sv599_maxpagedmemoryusage : UInt32
    sv599_maxnonpagedmemoryusage : UInt32
    sv599_enablesoftcompat : LibC::BOOL
    sv599_enableforcedlogoff : LibC::BOOL
    sv599_timesource : LibC::BOOL
    sv599_acceptdownlevelapis : LibC::BOOL
    sv599_lmannounce : LibC::BOOL
    sv599_domain : LibC::LPWSTR
    sv599_maxcopyreadlen : UInt32
    sv599_maxcopywritelen : UInt32
    sv599_minkeepsearch : UInt32
    sv599_maxkeepsearch : UInt32
    sv599_minkeepcomplsearch : UInt32
    sv599_maxkeepcomplsearch : UInt32
    sv599_threadcountadd : UInt32
    sv599_numblockthreads : UInt32
    sv599_scavtimeout : UInt32
    sv599_minrcvqueue : UInt32
    sv599_minfreeworkitems : UInt32
    sv599_xactmemsize : UInt32
    sv599_threadpriority : UInt32
    sv599_maxmpxct : UInt32
    sv599_oplockbreakwait : UInt32
    sv599_oplockbreakresponsewait : UInt32
    sv599_enableoplocks : LibC::BOOL
    sv599_enableoplockforceclose : LibC::BOOL
    sv599_enablefcbopens : LibC::BOOL
    sv599_enableraw : LibC::BOOL
    sv599_enablesharednetdrives : LibC::BOOL
    sv599_minfreeconnections : UInt32
    sv599_maxfreeconnections : UInt32
    sv599_initsesstable : UInt32
    sv599_initconntable : UInt32
    sv599_initfiletable : UInt32
    sv599_initsearchtable : UInt32
    sv599_alertschedule : UInt32
    sv599_errorthreshold : UInt32
    sv599_networkerrorthreshold : UInt32
    sv599_diskspacethreshold : UInt32
    sv599_reserved : UInt32
    sv599_maxlinkdelay : UInt32
    sv599_minlinkthroughput : UInt32
    sv599_linkinfovalidtime : UInt32
    sv599_scavqosinfoupdatetime : UInt32
    sv599_maxworkitemidletime : UInt32
  end
  struct SERVER_INFO_598
    sv598_maxrawworkitems : UInt32
    sv598_maxthreadsperqueue : UInt32
    sv598_producttype : UInt32
    sv598_serversize : UInt32
    sv598_connectionlessautodisc : UInt32
    sv598_sharingviolationretries : UInt32
    sv598_sharingviolationdelay : UInt32
    sv598_maxglobalopensearch : UInt32
    sv598_removeduplicatesearches : UInt32
    sv598_lockviolationoffset : UInt32
    sv598_lockviolationdelay : UInt32
    sv598_mdlreadswitchover : UInt32
    sv598_cachedopenlimit : UInt32
    sv598_otherqueueaffinity : UInt32
    sv598_restrictnullsessaccess : LibC::BOOL
    sv598_enablewfw311directipx : LibC::BOOL
    sv598_queuesamplesecs : UInt32
    sv598_balancecount : UInt32
    sv598_preferredaffinity : UInt32
    sv598_maxfreerfcbs : UInt32
    sv598_maxfreemfcbs : UInt32
    sv598_maxfreelfcbs : UInt32
    sv598_maxfreepagedpoolchunks : UInt32
    sv598_minpagedpoolchunksize : UInt32
    sv598_maxpagedpoolchunksize : UInt32
    sv598_sendsfrompreferredprocessor : LibC::BOOL
    sv598_cacheddirectorylimit : UInt32
    sv598_maxcopylength : UInt32
    sv598_enablecompression : LibC::BOOL
    sv598_autosharewks : LibC::BOOL
    sv598_autoshareserver : LibC::BOOL
    sv598_enablesecuritysignature : LibC::BOOL
    sv598_requiresecuritysignature : LibC::BOOL
    sv598_minclientbuffersize : UInt32
    sv598_serverguid : Guid
    sv598_connection_no_sessions_timeout : UInt32
    sv598_idle_thread_time_out : UInt32
    sv598_enable_w9xsecuritysignature : LibC::BOOL
    sv598_enforcekerberosreauthentication : LibC::BOOL
    sv598_disabledos : LibC::BOOL
    sv598_lowdiskspaceminimum : UInt32
    sv598_disablestrictnamechecking : LibC::BOOL
    sv598_enableauthenticateusersharing : LibC::BOOL
  end
  struct SERVER_INFO_1005
    sv1005_comment : LibC::LPWSTR
  end
  struct SERVER_INFO_1107
    sv1107_users : UInt32
  end
  struct SERVER_INFO_1010
    sv1010_disc : Int32
  end
  struct SERVER_INFO_1016
    sv1016_hidden : SERVER_INFO_HIDDEN
  end
  struct SERVER_INFO_1017
    sv1017_announce : UInt32
  end
  struct SERVER_INFO_1018
    sv1018_anndelta : UInt32
  end
  struct SERVER_INFO_1501
    sv1501_sessopens : UInt32
  end
  struct SERVER_INFO_1502
    sv1502_sessvcs : UInt32
  end
  struct SERVER_INFO_1503
    sv1503_opensearch : UInt32
  end
  struct SERVER_INFO_1506
    sv1506_maxworkitems : UInt32
  end
  struct SERVER_INFO_1509
    sv1509_maxrawbuflen : UInt32
  end
  struct SERVER_INFO_1510
    sv1510_sessusers : UInt32
  end
  struct SERVER_INFO_1511
    sv1511_sessconns : UInt32
  end
  struct SERVER_INFO_1512
    sv1512_maxnonpagedmemoryusage : UInt32
  end
  struct SERVER_INFO_1513
    sv1513_maxpagedmemoryusage : UInt32
  end
  struct SERVER_INFO_1514
    sv1514_enablesoftcompat : LibC::BOOL
  end
  struct SERVER_INFO_1515
    sv1515_enableforcedlogoff : LibC::BOOL
  end
  struct SERVER_INFO_1516
    sv1516_timesource : LibC::BOOL
  end
  struct SERVER_INFO_1518
    sv1518_lmannounce : LibC::BOOL
  end
  struct SERVER_INFO_1520
    sv1520_maxcopyreadlen : UInt32
  end
  struct SERVER_INFO_1521
    sv1521_maxcopywritelen : UInt32
  end
  struct SERVER_INFO_1522
    sv1522_minkeepsearch : UInt32
  end
  struct SERVER_INFO_1523
    sv1523_maxkeepsearch : UInt32
  end
  struct SERVER_INFO_1524
    sv1524_minkeepcomplsearch : UInt32
  end
  struct SERVER_INFO_1525
    sv1525_maxkeepcomplsearch : UInt32
  end
  struct SERVER_INFO_1528
    sv1528_scavtimeout : UInt32
  end
  struct SERVER_INFO_1529
    sv1529_minrcvqueue : UInt32
  end
  struct SERVER_INFO_1530
    sv1530_minfreeworkitems : UInt32
  end
  struct SERVER_INFO_1533
    sv1533_maxmpxct : UInt32
  end
  struct SERVER_INFO_1534
    sv1534_oplockbreakwait : UInt32
  end
  struct SERVER_INFO_1535
    sv1535_oplockbreakresponsewait : UInt32
  end
  struct SERVER_INFO_1536
    sv1536_enableoplocks : LibC::BOOL
  end
  struct SERVER_INFO_1537
    sv1537_enableoplockforceclose : LibC::BOOL
  end
  struct SERVER_INFO_1538
    sv1538_enablefcbopens : LibC::BOOL
  end
  struct SERVER_INFO_1539
    sv1539_enableraw : LibC::BOOL
  end
  struct SERVER_INFO_1540
    sv1540_enablesharednetdrives : LibC::BOOL
  end
  struct SERVER_INFO_1541
    sv1541_minfreeconnections : LibC::BOOL
  end
  struct SERVER_INFO_1542
    sv1542_maxfreeconnections : LibC::BOOL
  end
  struct SERVER_INFO_1543
    sv1543_initsesstable : UInt32
  end
  struct SERVER_INFO_1544
    sv1544_initconntable : UInt32
  end
  struct SERVER_INFO_1545
    sv1545_initfiletable : UInt32
  end
  struct SERVER_INFO_1546
    sv1546_initsearchtable : UInt32
  end
  struct SERVER_INFO_1547
    sv1547_alertschedule : UInt32
  end
  struct SERVER_INFO_1548
    sv1548_errorthreshold : UInt32
  end
  struct SERVER_INFO_1549
    sv1549_networkerrorthreshold : UInt32
  end
  struct SERVER_INFO_1550
    sv1550_diskspacethreshold : UInt32
  end
  struct SERVER_INFO_1552
    sv1552_maxlinkdelay : UInt32
  end
  struct SERVER_INFO_1553
    sv1553_minlinkthroughput : UInt32
  end
  struct SERVER_INFO_1554
    sv1554_linkinfovalidtime : UInt32
  end
  struct SERVER_INFO_1555
    sv1555_scavqosinfoupdatetime : UInt32
  end
  struct SERVER_INFO_1556
    sv1556_maxworkitemidletime : UInt32
  end
  struct SERVER_INFO_1557
    sv1557_maxrawworkitems : UInt32
  end
  struct SERVER_INFO_1560
    sv1560_producttype : UInt32
  end
  struct SERVER_INFO_1561
    sv1561_serversize : UInt32
  end
  struct SERVER_INFO_1562
    sv1562_connectionlessautodisc : UInt32
  end
  struct SERVER_INFO_1563
    sv1563_sharingviolationretries : UInt32
  end
  struct SERVER_INFO_1564
    sv1564_sharingviolationdelay : UInt32
  end
  struct SERVER_INFO_1565
    sv1565_maxglobalopensearch : UInt32
  end
  struct SERVER_INFO_1566
    sv1566_removeduplicatesearches : LibC::BOOL
  end
  struct SERVER_INFO_1567
    sv1567_lockviolationretries : UInt32
  end
  struct SERVER_INFO_1568
    sv1568_lockviolationoffset : UInt32
  end
  struct SERVER_INFO_1569
    sv1569_lockviolationdelay : UInt32
  end
  struct SERVER_INFO_1570
    sv1570_mdlreadswitchover : UInt32
  end
  struct SERVER_INFO_1571
    sv1571_cachedopenlimit : UInt32
  end
  struct SERVER_INFO_1572
    sv1572_criticalthreads : UInt32
  end
  struct SERVER_INFO_1573
    sv1573_restrictnullsessaccess : UInt32
  end
  struct SERVER_INFO_1574
    sv1574_enablewfw311directipx : UInt32
  end
  struct SERVER_INFO_1575
    sv1575_otherqueueaffinity : UInt32
  end
  struct SERVER_INFO_1576
    sv1576_queuesamplesecs : UInt32
  end
  struct SERVER_INFO_1577
    sv1577_balancecount : UInt32
  end
  struct SERVER_INFO_1578
    sv1578_preferredaffinity : UInt32
  end
  struct SERVER_INFO_1579
    sv1579_maxfreerfcbs : UInt32
  end
  struct SERVER_INFO_1580
    sv1580_maxfreemfcbs : UInt32
  end
  struct SERVER_INFO_1581
    sv1581_maxfreemlcbs : UInt32
  end
  struct SERVER_INFO_1582
    sv1582_maxfreepagedpoolchunks : UInt32
  end
  struct SERVER_INFO_1583
    sv1583_minpagedpoolchunksize : UInt32
  end
  struct SERVER_INFO_1584
    sv1584_maxpagedpoolchunksize : UInt32
  end
  struct SERVER_INFO_1585
    sv1585_sendsfrompreferredprocessor : LibC::BOOL
  end
  struct SERVER_INFO_1586
    sv1586_maxthreadsperqueue : UInt32
  end
  struct SERVER_INFO_1587
    sv1587_cacheddirectorylimit : UInt32
  end
  struct SERVER_INFO_1588
    sv1588_maxcopylength : UInt32
  end
  struct SERVER_INFO_1590
    sv1590_enablecompression : UInt32
  end
  struct SERVER_INFO_1591
    sv1591_autosharewks : UInt32
  end
  struct SERVER_INFO_1592
    sv1592_autosharewks : UInt32
  end
  struct SERVER_INFO_1593
    sv1593_enablesecuritysignature : UInt32
  end
  struct SERVER_INFO_1594
    sv1594_requiresecuritysignature : UInt32
  end
  struct SERVER_INFO_1595
    sv1595_minclientbuffersize : UInt32
  end
  struct SERVER_INFO_1596
    sv1596_connection_no_sessions_timeout : UInt32
  end
  struct SERVER_INFO_1597
    sv1597_idle_thread_time_out : UInt32
  end
  struct SERVER_INFO_1598
    sv1598_enable_w9xsecuritysignature : UInt32
  end
  struct SERVER_INFO_1599
    sv1598_enforcekerberosreauthentication : BOOLEAN
  end
  struct SERVER_INFO_1600
    sv1598_disabledos : BOOLEAN
  end
  struct SERVER_INFO_1601
    sv1598_lowdiskspaceminimum : UInt32
  end
  struct SERVER_INFO_1602
    sv_1598_disablestrictnamechecking : LibC::BOOL
  end
  struct SERVER_TRANSPORT_INFO_0
    svti0_numberofvcs : UInt32
    svti0_transportname : LibC::LPWSTR
    svti0_transportaddress : UInt8*
    svti0_transportaddresslength : UInt32
    svti0_networkaddress : LibC::LPWSTR
  end
  struct SERVER_TRANSPORT_INFO_1
    svti1_numberofvcs : UInt32
    svti1_transportname : LibC::LPWSTR
    svti1_transportaddress : UInt8*
    svti1_transportaddresslength : UInt32
    svti1_networkaddress : LibC::LPWSTR
    svti1_domain : LibC::LPWSTR
  end
  struct SERVER_TRANSPORT_INFO_2
    svti2_numberofvcs : UInt32
    svti2_transportname : LibC::LPWSTR
    svti2_transportaddress : UInt8*
    svti2_transportaddresslength : UInt32
    svti2_networkaddress : LibC::LPWSTR
    svti2_domain : LibC::LPWSTR
    svti2_flags : UInt32
  end
  struct SERVER_TRANSPORT_INFO_3
    svti3_numberofvcs : UInt32
    svti3_transportname : LibC::LPWSTR
    svti3_transportaddress : UInt8*
    svti3_transportaddresslength : UInt32
    svti3_networkaddress : LibC::LPWSTR
    svti3_domain : LibC::LPWSTR
    svti3_flags : UInt32
    svti3_passwordlength : UInt32
    svti3_password : UInt8[256]*
  end
  struct SERVICE_INFO_0
    svci0_name : LibC::LPWSTR
  end
  struct SERVICE_INFO_1
    svci1_name : LibC::LPWSTR
    svci1_status : UInt32
    svci1_code : UInt32
    svci1_pid : UInt32
  end
  struct SERVICE_INFO_2
    svci2_name : LibC::LPWSTR
    svci2_status : UInt32
    svci2_code : UInt32
    svci2_pid : UInt32
    svci2_text : LibC::LPWSTR
    svci2_specific_error : UInt32
    svci2_display_name : LibC::LPWSTR
  end
  struct USE_INFO_0
    ui0_local : LibC::LPWSTR
    ui0_remote : LibC::LPWSTR
  end
  struct USE_INFO_1
    ui1_local : LibC::LPWSTR
    ui1_remote : LibC::LPWSTR
    ui1_password : LibC::LPWSTR
    ui1_status : UInt32
    ui1_asg_type : USE_INFO_ASG_TYPE
    ui1_refcount : UInt32
    ui1_usecount : UInt32
  end
  struct USE_INFO_2
    ui2_local : LibC::LPWSTR
    ui2_remote : LibC::LPWSTR
    ui2_password : LibC::LPWSTR
    ui2_status : UInt32
    ui2_asg_type : USE_INFO_ASG_TYPE
    ui2_refcount : UInt32
    ui2_usecount : UInt32
    ui2_username : LibC::LPWSTR
    ui2_domainname : LibC::LPWSTR
  end
  struct USE_INFO_3
    ui3_ui2 : USE_INFO_2
    ui3_flags : UInt32
  end
  struct USE_INFO_4
    ui4_ui3 : USE_INFO_3
    ui4_auth_identity_length : UInt32
    ui4_auth_identity : UInt8*
  end
  struct USE_INFO_5
    ui4_ui3 : USE_INFO_3
    ui4_auth_identity_length : UInt32
    ui4_auth_identity : UInt8*
    ui5_security_descriptor_length : UInt32
    ui5_security_descriptor : UInt8*
    ui5_use_options_length : UInt32
    ui5_use_options : UInt8*
  end
  struct USE_OPTION_GENERIC
    tag : UInt32
    length : UInt16
    reserved : UInt16
  end
  struct USE_OPTION_DEFERRED_CONNECTION_PARAMETERS
    tag : UInt32
    length : UInt16
    reserved : UInt16
  end
  struct TRANSPORT_INFO
    type : TRANSPORT_TYPE
    skip_certificate_check : BOOLEAN
  end
  struct USE_OPTION_TRANSPORT_PARAMETERS
    tag : UInt32
    length : UInt16
    reserved : UInt16
  end
  struct SMB_COMPRESSION_INFO
    switch : BOOLEAN
    reserved1 : UInt8
    reserved2 : UInt16
    reserved3 : UInt32
  end
  struct SMB_USE_OPTION_COMPRESSION_PARAMETERS
    tag : UInt32
    length : UInt16
    reserved : UInt16
  end
  struct SMB_TREE_CONNECT_PARAMETERS
    ea_buffer_offset : UInt32
    ea_buffer_len : UInt32
    create_options : UInt32
    tree_connect_attributes : UInt32
  end
  struct USE_OPTION_PROPERTIES
    tag : UInt32
    p_info : Void*
    length : LibC::UINT_PTR
  end
  struct WKSTA_INFO_100
    wki100_platform_id : UInt32
    wki100_computername : LibC::LPWSTR
    wki100_langroup : LibC::LPWSTR
    wki100_ver_major : UInt32
    wki100_ver_minor : UInt32
  end
  struct WKSTA_INFO_101
    wki101_platform_id : UInt32
    wki101_computername : LibC::LPWSTR
    wki101_langroup : LibC::LPWSTR
    wki101_ver_major : UInt32
    wki101_ver_minor : UInt32
    wki101_lanroot : LibC::LPWSTR
  end
  struct WKSTA_INFO_102
    wki102_platform_id : UInt32
    wki102_computername : LibC::LPWSTR
    wki102_langroup : LibC::LPWSTR
    wki102_ver_major : UInt32
    wki102_ver_minor : UInt32
    wki102_lanroot : LibC::LPWSTR
    wki102_logged_on_users : UInt32
  end
  struct WKSTA_INFO_302
    wki302_char_wait : UInt32
    wki302_collection_time : UInt32
    wki302_maximum_collection_count : UInt32
    wki302_keep_conn : UInt32
    wki302_keep_search : UInt32
    wki302_max_cmds : UInt32
    wki302_num_work_buf : UInt32
    wki302_siz_work_buf : UInt32
    wki302_max_wrk_cache : UInt32
    wki302_sess_timeout : UInt32
    wki302_siz_error : UInt32
    wki302_num_alerts : UInt32
    wki302_num_services : UInt32
    wki302_errlog_sz : UInt32
    wki302_print_buf_time : UInt32
    wki302_num_char_buf : UInt32
    wki302_siz_char_buf : UInt32
    wki302_wrk_heuristics : LibC::LPWSTR
    wki302_mailslots : UInt32
    wki302_num_dgram_buf : UInt32
  end
  struct WKSTA_INFO_402
    wki402_char_wait : UInt32
    wki402_collection_time : UInt32
    wki402_maximum_collection_count : UInt32
    wki402_keep_conn : UInt32
    wki402_keep_search : UInt32
    wki402_max_cmds : UInt32
    wki402_num_work_buf : UInt32
    wki402_siz_work_buf : UInt32
    wki402_max_wrk_cache : UInt32
    wki402_sess_timeout : UInt32
    wki402_siz_error : UInt32
    wki402_num_alerts : UInt32
    wki402_num_services : UInt32
    wki402_errlog_sz : UInt32
    wki402_print_buf_time : UInt32
    wki402_num_char_buf : UInt32
    wki402_siz_char_buf : UInt32
    wki402_wrk_heuristics : LibC::LPWSTR
    wki402_mailslots : UInt32
    wki402_num_dgram_buf : UInt32
    wki402_max_threads : UInt32
  end
  struct WKSTA_INFO_502
    wki502_char_wait : UInt32
    wki502_collection_time : UInt32
    wki502_maximum_collection_count : UInt32
    wki502_keep_conn : UInt32
    wki502_max_cmds : UInt32
    wki502_sess_timeout : UInt32
    wki502_siz_char_buf : UInt32
    wki502_max_threads : UInt32
    wki502_lock_quota : UInt32
    wki502_lock_increment : UInt32
    wki502_lock_maximum : UInt32
    wki502_pipe_increment : UInt32
    wki502_pipe_maximum : UInt32
    wki502_cache_file_timeout : UInt32
    wki502_dormant_file_limit : UInt32
    wki502_read_ahead_throughput : UInt32
    wki502_num_mailslot_buffers : UInt32
    wki502_num_srv_announce_buffers : UInt32
    wki502_max_illegal_datagram_events : UInt32
    wki502_illegal_datagram_event_reset_frequency : UInt32
    wki502_log_election_packets : LibC::BOOL
    wki502_use_opportunistic_locking : LibC::BOOL
    wki502_use_unlock_behind : LibC::BOOL
    wki502_use_close_behind : LibC::BOOL
    wki502_buf_named_pipes : LibC::BOOL
    wki502_use_lock_read_unlock : LibC::BOOL
    wki502_utilize_nt_caching : LibC::BOOL
    wki502_use_raw_read : LibC::BOOL
    wki502_use_raw_write : LibC::BOOL
    wki502_use_write_raw_data : LibC::BOOL
    wki502_use_encryption : LibC::BOOL
    wki502_buf_files_deny_write : LibC::BOOL
    wki502_buf_read_only_files : LibC::BOOL
    wki502_force_core_create_mode : LibC::BOOL
    wki502_use_512_byte_max_transfer : LibC::BOOL
  end
  struct WKSTA_INFO_1010
    wki1010_char_wait : UInt32
  end
  struct WKSTA_INFO_1011
    wki1011_collection_time : UInt32
  end
  struct WKSTA_INFO_1012
    wki1012_maximum_collection_count : UInt32
  end
  struct WKSTA_INFO_1027
    wki1027_errlog_sz : UInt32
  end
  struct WKSTA_INFO_1028
    wki1028_print_buf_time : UInt32
  end
  struct WKSTA_INFO_1032
    wki1032_wrk_heuristics : UInt32
  end
  struct WKSTA_INFO_1013
    wki1013_keep_conn : UInt32
  end
  struct WKSTA_INFO_1018
    wki1018_sess_timeout : UInt32
  end
  struct WKSTA_INFO_1023
    wki1023_siz_char_buf : UInt32
  end
  struct WKSTA_INFO_1033
    wki1033_max_threads : UInt32
  end
  struct WKSTA_INFO_1041
    wki1041_lock_quota : UInt32
  end
  struct WKSTA_INFO_1042
    wki1042_lock_increment : UInt32
  end
  struct WKSTA_INFO_1043
    wki1043_lock_maximum : UInt32
  end
  struct WKSTA_INFO_1044
    wki1044_pipe_increment : UInt32
  end
  struct WKSTA_INFO_1045
    wki1045_pipe_maximum : UInt32
  end
  struct WKSTA_INFO_1046
    wki1046_dormant_file_limit : UInt32
  end
  struct WKSTA_INFO_1047
    wki1047_cache_file_timeout : UInt32
  end
  struct WKSTA_INFO_1048
    wki1048_use_opportunistic_locking : LibC::BOOL
  end
  struct WKSTA_INFO_1049
    wki1049_use_unlock_behind : LibC::BOOL
  end
  struct WKSTA_INFO_1050
    wki1050_use_close_behind : LibC::BOOL
  end
  struct WKSTA_INFO_1051
    wki1051_buf_named_pipes : LibC::BOOL
  end
  struct WKSTA_INFO_1052
    wki1052_use_lock_read_unlock : LibC::BOOL
  end
  struct WKSTA_INFO_1053
    wki1053_utilize_nt_caching : LibC::BOOL
  end
  struct WKSTA_INFO_1054
    wki1054_use_raw_read : LibC::BOOL
  end
  struct WKSTA_INFO_1055
    wki1055_use_raw_write : LibC::BOOL
  end
  struct WKSTA_INFO_1056
    wki1056_use_write_raw_data : LibC::BOOL
  end
  struct WKSTA_INFO_1057
    wki1057_use_encryption : LibC::BOOL
  end
  struct WKSTA_INFO_1058
    wki1058_buf_files_deny_write : LibC::BOOL
  end
  struct WKSTA_INFO_1059
    wki1059_buf_read_only_files : LibC::BOOL
  end
  struct WKSTA_INFO_1060
    wki1060_force_core_create_mode : LibC::BOOL
  end
  struct WKSTA_INFO_1061
    wki1061_use_512_byte_max_transfer : LibC::BOOL
  end
  struct WKSTA_INFO_1062
    wki1062_read_ahead_throughput : UInt32
  end
  struct WKSTA_USER_INFO_0
    wkui0_username : LibC::LPWSTR
  end
  struct WKSTA_USER_INFO_1
    wkui1_username : LibC::LPWSTR
    wkui1_logon_domain : LibC::LPWSTR
    wkui1_oth_domains : LibC::LPWSTR
    wkui1_logon_server : LibC::LPWSTR
  end
  struct WKSTA_USER_INFO_1101
    wkui1101_oth_domains : LibC::LPWSTR
  end
  struct WKSTA_TRANSPORT_INFO_0
    wkti0_quality_of_service : UInt32
    wkti0_number_of_vcs : UInt32
    wkti0_transport_name : LibC::LPWSTR
    wkti0_transport_address : LibC::LPWSTR
    wkti0_wan_ish : LibC::BOOL
  end
  struct ERROR_LOG
    el_len : UInt32
    el_reserved : UInt32
    el_time : UInt32
    el_error : UInt32
    el_name : LibC::LPWSTR
    el_text : LibC::LPWSTR
    el_data : UInt8*
    el_data_size : UInt32
    el_nstrings : UInt32
  end
  struct HLOG
    time : UInt32
    last_flags : UInt32
    offset : UInt32
    rec_offset : UInt32
  end
  struct CONFIG_INFO_0
    cfgi0_key : LibC::LPWSTR
    cfgi0_data : LibC::LPWSTR
  end
  struct AUDIT_ENTRY
    ae_len : UInt32
    ae_reserved : UInt32
    ae_time : UInt32
    ae_type : UInt32
    ae_data_offset : UInt32
    ae_data_size : UInt32
  end
  struct AE_SRVSTATUS
    ae_sv_status : UInt32
  end
  struct AE_SESSLOGON
    ae_so_compname : UInt32
    ae_so_username : UInt32
    ae_so_privilege : UInt32
  end
  struct AE_SESSLOGOFF
    ae_sf_compname : UInt32
    ae_sf_username : UInt32
    ae_sf_reason : UInt32
  end
  struct AE_SESSPWERR
    ae_sp_compname : UInt32
    ae_sp_username : UInt32
  end
  struct AE_CONNSTART
    ae_ct_compname : UInt32
    ae_ct_username : UInt32
    ae_ct_netname : UInt32
    ae_ct_connid : UInt32
  end
  struct AE_CONNSTOP
    ae_cp_compname : UInt32
    ae_cp_username : UInt32
    ae_cp_netname : UInt32
    ae_cp_connid : UInt32
    ae_cp_reason : UInt32
  end
  struct AE_CONNREJ
    ae_cr_compname : UInt32
    ae_cr_username : UInt32
    ae_cr_netname : UInt32
    ae_cr_reason : UInt32
  end
  struct AE_RESACCESS
    ae_ra_compname : UInt32
    ae_ra_username : UInt32
    ae_ra_resname : UInt32
    ae_ra_operation : UInt32
    ae_ra_returncode : UInt32
    ae_ra_restype : UInt32
    ae_ra_fileid : UInt32
  end
  struct AE_RESACCESSREJ
    ae_rr_compname : UInt32
    ae_rr_username : UInt32
    ae_rr_resname : UInt32
    ae_rr_operation : UInt32
  end
  struct AE_CLOSEFILE
    ae_cf_compname : UInt32
    ae_cf_username : UInt32
    ae_cf_resname : UInt32
    ae_cf_fileid : UInt32
    ae_cf_duration : UInt32
    ae_cf_reason : UInt32
  end
  struct AE_SERVICESTAT
    ae_ss_compname : UInt32
    ae_ss_username : UInt32
    ae_ss_svcname : UInt32
    ae_ss_status : UInt32
    ae_ss_code : UInt32
    ae_ss_text : UInt32
    ae_ss_returnval : UInt32
  end
  struct AE_ACLMOD
    ae_am_compname : UInt32
    ae_am_username : UInt32
    ae_am_resname : UInt32
    ae_am_action : UInt32
    ae_am_datalen : UInt32
  end
  struct AE_UASMOD
    ae_um_compname : UInt32
    ae_um_username : UInt32
    ae_um_resname : UInt32
    ae_um_rectype : UInt32
    ae_um_action : UInt32
    ae_um_datalen : UInt32
  end
  struct AE_NETLOGON
    ae_no_compname : UInt32
    ae_no_username : UInt32
    ae_no_privilege : UInt32
    ae_no_authflags : UInt32
  end
  struct AE_NETLOGOFF
    ae_nf_compname : UInt32
    ae_nf_username : UInt32
    ae_nf_reserved1 : UInt32
    ae_nf_reserved2 : UInt32
  end
  struct AE_ACCLIM
    ae_al_compname : UInt32
    ae_al_username : UInt32
    ae_al_resname : UInt32
    ae_al_limit : UInt32
  end
  struct AE_LOCKOUT
    ae_lk_compname : UInt32
    ae_lk_username : UInt32
    ae_lk_action : UInt32
    ae_lk_bad_pw_count : UInt32
  end
  struct AE_GENERIC
    ae_ge_msgfile : UInt32
    ae_ge_msgnum : UInt32
    ae_ge_params : UInt32
    ae_ge_param1 : UInt32
    ae_ge_param2 : UInt32
    ae_ge_param3 : UInt32
    ae_ge_param4 : UInt32
    ae_ge_param5 : UInt32
    ae_ge_param6 : UInt32
    ae_ge_param7 : UInt32
    ae_ge_param8 : UInt32
    ae_ge_param9 : UInt32
  end
  struct DSREG_USER_INFO
    psz_user_email : LibC::LPWSTR
    psz_user_key_id : LibC::LPWSTR
    psz_user_key_name : LibC::LPWSTR
  end
  struct DSREG_JOIN_INFO
    join_type : DSREG_JOIN_TYPE
    p_join_certificate : CERT_CONTEXT*
    psz_device_id : LibC::LPWSTR
    psz_idp_domain : LibC::LPWSTR
    psz_tenant_id : LibC::LPWSTR
    psz_join_user_email : LibC::LPWSTR
    psz_tenant_display_name : LibC::LPWSTR
    psz_mdm_enrollment_url : LibC::LPWSTR
    psz_mdm_terms_of_use_url : LibC::LPWSTR
    psz_mdm_compliance_url : LibC::LPWSTR
    psz_user_setting_sync_url : LibC::LPWSTR
    p_user_info : DSREG_USER_INFO*
  end
  struct NETSETUP_PROVISIONING_PARAMS
    dw_version : UInt32
    lp_domain : LibC::LPWSTR
    lp_host_name : LibC::LPWSTR
    lp_machine_account_ou : LibC::LPWSTR
    lp_dc_name : LibC::LPWSTR
    dw_provision_options : NETSETUP_PROVISION
    a_cert_template_names : LibC::LPWSTR*
    c_cert_template_names : UInt32
    a_machine_policy_names : LibC::LPWSTR*
    c_machine_policy_names : UInt32
    a_machine_policy_paths : LibC::LPWSTR*
    c_machine_policy_paths : UInt32
    lp_netbios_name : LibC::LPWSTR
    lp_site_name : LibC::LPWSTR
    lp_primary_dns_domain : LibC::LPWSTR
  end
  struct AT_INFO
    job_time : LibC::UINT_PTR
    days_of_month : UInt32
    days_of_week : UInt8
    flags : UInt8
    command : LibC::LPWSTR
  end
  struct AT_ENUM
    job_id : UInt32
    job_time : LibC::UINT_PTR
    days_of_month : UInt32
    days_of_week : UInt8
    flags : UInt8
    command : LibC::LPWSTR
  end
  struct FLAT_STRING
    maximum_length : Int16
    length : Int16
    buffer : CHAR[0]*
  end
  struct NETWORK_NAME
    name : FLAT_STRING
  end
  struct HARDWARE_ADDRESS
    address : UInt8[6]*
  end
  struct OBO_TOKEN
    type : OBO_TOKEN_TYPE
    pncc : INetCfgComponent
    pszw_manufacturer : LibC::LPWSTR
    pszw_product : LibC::LPWSTR
    pszw_display_name : LibC::LPWSTR
    f_registered : LibC::BOOL
  end
  struct RASCON_IPUI
    guid_connection : Guid
    f_i_pv6_cfg : LibC::BOOL
    dw_flags : UInt32
    pszw_ip_addr : Char[16]*
    pszw_dns_addr : Char[16]*
    pszw_dns2_addr : Char[16]*
    pszw_wins_addr : Char[16]*
    pszw_wins2_addr : Char[16]*
    pszw_dns_suffix : Char[256]*
    pszw_ipv6_addr : Char[65]*
    dw_ipv6_prefix_length : UInt32
    pszw_ipv6_dns_addr : Char[65]*
    pszw_ipv6_dns2_addr : Char[65]*
    dw_i_pv4_inf_metric : UInt32
    dw_i_pv6_inf_metric : UInt32
  end
  struct RTR_TOC_ENTRY
    info_type : UInt32
    info_size : UInt32
    count : UInt32
    offset : UInt32
  end
  struct RTR_INFO_BLOCK_HEADER
    version : UInt32
    size : UInt32
    toc_entries_count : UInt32
    toc_entry : RTR_TOC_ENTRY[0]*
  end
  struct MPR_PROTOCOL_0
    dw_protocol_id : UInt32
    wsz_protocol : Char[41]*
    wsz_dll_name : Char[49]*
  end


  struct IEnumNetCfgBindingInterfaceVTbl
    query_interface : Proc(IEnumNetCfgBindingInterface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetCfgBindingInterface*, UInt32)
    release : Proc(IEnumNetCfgBindingInterface*, UInt32)
    next : Proc(IEnumNetCfgBindingInterface*, UInt32, INetCfgBindingInterface*, UInt32*, HRESULT)
    skip : Proc(IEnumNetCfgBindingInterface*, UInt32, HRESULT)
    reset : Proc(IEnumNetCfgBindingInterface*, HRESULT)
    clone : Proc(IEnumNetCfgBindingInterface*, IEnumNetCfgBindingInterface*, HRESULT)
  end

  IEnumNetCfgBindingInterface_GUID = "c0e8ae90-306e-11d1-aacf-00805fc1270e"
  IID_IEnumNetCfgBindingInterface = LibC::GUID.new(0xc0e8ae90_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetCfgBindingInterface
    lpVtbl : IEnumNetCfgBindingInterfaceVTbl*
  end

  struct IEnumNetCfgBindingPathVTbl
    query_interface : Proc(IEnumNetCfgBindingPath*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetCfgBindingPath*, UInt32)
    release : Proc(IEnumNetCfgBindingPath*, UInt32)
    next : Proc(IEnumNetCfgBindingPath*, UInt32, INetCfgBindingPath*, UInt32*, HRESULT)
    skip : Proc(IEnumNetCfgBindingPath*, UInt32, HRESULT)
    reset : Proc(IEnumNetCfgBindingPath*, HRESULT)
    clone : Proc(IEnumNetCfgBindingPath*, IEnumNetCfgBindingPath*, HRESULT)
  end

  IEnumNetCfgBindingPath_GUID = "c0e8ae91-306e-11d1-aacf-00805fc1270e"
  IID_IEnumNetCfgBindingPath = LibC::GUID.new(0xc0e8ae91_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetCfgBindingPath
    lpVtbl : IEnumNetCfgBindingPathVTbl*
  end

  struct IEnumNetCfgComponentVTbl
    query_interface : Proc(IEnumNetCfgComponent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumNetCfgComponent*, UInt32)
    release : Proc(IEnumNetCfgComponent*, UInt32)
    next : Proc(IEnumNetCfgComponent*, UInt32, INetCfgComponent*, UInt32*, HRESULT)
    skip : Proc(IEnumNetCfgComponent*, UInt32, HRESULT)
    reset : Proc(IEnumNetCfgComponent*, HRESULT)
    clone : Proc(IEnumNetCfgComponent*, IEnumNetCfgComponent*, HRESULT)
  end

  IEnumNetCfgComponent_GUID = "c0e8ae92-306e-11d1-aacf-00805fc1270e"
  IID_IEnumNetCfgComponent = LibC::GUID.new(0xc0e8ae92_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct IEnumNetCfgComponent
    lpVtbl : IEnumNetCfgComponentVTbl*
  end

  struct INetCfgVTbl
    query_interface : Proc(INetCfg*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfg*, UInt32)
    release : Proc(INetCfg*, UInt32)
    initialize : Proc(INetCfg*, Void*, HRESULT)
    uninitialize : Proc(INetCfg*, HRESULT)
    apply : Proc(INetCfg*, HRESULT)
    cancel : Proc(INetCfg*, HRESULT)
    enum_components : Proc(INetCfg*, Guid*, IEnumNetCfgComponent*, HRESULT)
    find_component : Proc(INetCfg*, LibC::LPWSTR, INetCfgComponent*, HRESULT)
    query_net_cfg_class : Proc(INetCfg*, Guid*, Guid*, Void**, HRESULT)
  end

  INetCfg_GUID = "c0e8ae93-306e-11d1-aacf-00805fc1270e"
  IID_INetCfg = LibC::GUID.new(0xc0e8ae93_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfg
    lpVtbl : INetCfgVTbl*
  end

  struct INetCfgLockVTbl
    query_interface : Proc(INetCfgLock*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgLock*, UInt32)
    release : Proc(INetCfgLock*, UInt32)
    acquire_write_lock : Proc(INetCfgLock*, UInt32, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    release_write_lock : Proc(INetCfgLock*, HRESULT)
    is_write_locked : Proc(INetCfgLock*, LibC::LPWSTR*, HRESULT)
  end

  INetCfgLock_GUID = "c0e8ae9f-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgLock = LibC::GUID.new(0xc0e8ae9f_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgLock
    lpVtbl : INetCfgLockVTbl*
  end

  struct INetCfgBindingInterfaceVTbl
    query_interface : Proc(INetCfgBindingInterface*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgBindingInterface*, UInt32)
    release : Proc(INetCfgBindingInterface*, UInt32)
    get_name : Proc(INetCfgBindingInterface*, LibC::LPWSTR*, HRESULT)
    get_upper_component : Proc(INetCfgBindingInterface*, INetCfgComponent*, HRESULT)
    get_lower_component : Proc(INetCfgBindingInterface*, INetCfgComponent*, HRESULT)
  end

  INetCfgBindingInterface_GUID = "c0e8ae94-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgBindingInterface = LibC::GUID.new(0xc0e8ae94_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgBindingInterface
    lpVtbl : INetCfgBindingInterfaceVTbl*
  end

  struct INetCfgBindingPathVTbl
    query_interface : Proc(INetCfgBindingPath*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgBindingPath*, UInt32)
    release : Proc(INetCfgBindingPath*, UInt32)
    is_same_path_as : Proc(INetCfgBindingPath*, INetCfgBindingPath, HRESULT)
    is_sub_path_of : Proc(INetCfgBindingPath*, INetCfgBindingPath, HRESULT)
    is_enabled : Proc(INetCfgBindingPath*, HRESULT)
    enable : Proc(INetCfgBindingPath*, LibC::BOOL, HRESULT)
    get_path_token : Proc(INetCfgBindingPath*, LibC::LPWSTR*, HRESULT)
    get_owner : Proc(INetCfgBindingPath*, INetCfgComponent*, HRESULT)
    get_depth : Proc(INetCfgBindingPath*, UInt32*, HRESULT)
    enum_binding_interfaces : Proc(INetCfgBindingPath*, IEnumNetCfgBindingInterface*, HRESULT)
  end

  INetCfgBindingPath_GUID = "c0e8ae96-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgBindingPath = LibC::GUID.new(0xc0e8ae96_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgBindingPath
    lpVtbl : INetCfgBindingPathVTbl*
  end

  struct INetCfgClassVTbl
    query_interface : Proc(INetCfgClass*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgClass*, UInt32)
    release : Proc(INetCfgClass*, UInt32)
    find_component : Proc(INetCfgClass*, LibC::LPWSTR, INetCfgComponent*, HRESULT)
    enum_components : Proc(INetCfgClass*, IEnumNetCfgComponent*, HRESULT)
  end

  INetCfgClass_GUID = "c0e8ae97-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgClass = LibC::GUID.new(0xc0e8ae97_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgClass
    lpVtbl : INetCfgClassVTbl*
  end

  struct INetCfgClassSetupVTbl
    query_interface : Proc(INetCfgClassSetup*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgClassSetup*, UInt32)
    release : Proc(INetCfgClassSetup*, UInt32)
    select_and_install : Proc(INetCfgClassSetup*, LibC::HANDLE, OBO_TOKEN*, INetCfgComponent*, HRESULT)
    install : Proc(INetCfgClassSetup*, LibC::LPWSTR, OBO_TOKEN*, UInt32, UInt32, LibC::LPWSTR, LibC::LPWSTR, INetCfgComponent*, HRESULT)
    de_install : Proc(INetCfgClassSetup*, INetCfgComponent, OBO_TOKEN*, LibC::LPWSTR*, HRESULT)
  end

  INetCfgClassSetup_GUID = "c0e8ae9d-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgClassSetup = LibC::GUID.new(0xc0e8ae9d_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgClassSetup
    lpVtbl : INetCfgClassSetupVTbl*
  end

  struct INetCfgClassSetup2VTbl
    query_interface : Proc(INetCfgClassSetup2*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgClassSetup2*, UInt32)
    release : Proc(INetCfgClassSetup2*, UInt32)
    select_and_install : Proc(INetCfgClassSetup2*, LibC::HANDLE, OBO_TOKEN*, INetCfgComponent*, HRESULT)
    install : Proc(INetCfgClassSetup2*, LibC::LPWSTR, OBO_TOKEN*, UInt32, UInt32, LibC::LPWSTR, LibC::LPWSTR, INetCfgComponent*, HRESULT)
    de_install : Proc(INetCfgClassSetup2*, INetCfgComponent, OBO_TOKEN*, LibC::LPWSTR*, HRESULT)
    update_non_enumerated_component : Proc(INetCfgClassSetup2*, INetCfgComponent, UInt32, UInt32, HRESULT)
  end

  INetCfgClassSetup2_GUID = "c0e8aea0-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgClassSetup2 = LibC::GUID.new(0xc0e8aea0_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgClassSetup2
    lpVtbl : INetCfgClassSetup2VTbl*
  end

  struct INetCfgComponentVTbl
    query_interface : Proc(INetCfgComponent*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponent*, UInt32)
    release : Proc(INetCfgComponent*, UInt32)
    get_display_name : Proc(INetCfgComponent*, LibC::LPWSTR*, HRESULT)
    set_display_name : Proc(INetCfgComponent*, LibC::LPWSTR, HRESULT)
    get_help_text : Proc(INetCfgComponent*, LibC::LPWSTR*, HRESULT)
    get_id : Proc(INetCfgComponent*, LibC::LPWSTR*, HRESULT)
    get_characteristics : Proc(INetCfgComponent*, UInt32*, HRESULT)
    get_instance_guid : Proc(INetCfgComponent*, Guid*, HRESULT)
    get_pnp_dev_node_id : Proc(INetCfgComponent*, LibC::LPWSTR*, HRESULT)
    get_class_guid : Proc(INetCfgComponent*, Guid*, HRESULT)
    get_bind_name : Proc(INetCfgComponent*, LibC::LPWSTR*, HRESULT)
    get_device_status : Proc(INetCfgComponent*, UInt32*, HRESULT)
    open_param_key : Proc(INetCfgComponent*, HKEY*, HRESULT)
    raise_property_ui : Proc(INetCfgComponent*, LibC::HANDLE, UInt32, IUnknown, HRESULT)
  end

  INetCfgComponent_GUID = "c0e8ae99-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgComponent = LibC::GUID.new(0xc0e8ae99_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgComponent
    lpVtbl : INetCfgComponentVTbl*
  end

  struct INetCfgComponentBindingsVTbl
    query_interface : Proc(INetCfgComponentBindings*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentBindings*, UInt32)
    release : Proc(INetCfgComponentBindings*, UInt32)
    bind_to : Proc(INetCfgComponentBindings*, INetCfgComponent, HRESULT)
    unbind_from : Proc(INetCfgComponentBindings*, INetCfgComponent, HRESULT)
    supports_binding_interface : Proc(INetCfgComponentBindings*, UInt32, LibC::LPWSTR, HRESULT)
    is_bound_to : Proc(INetCfgComponentBindings*, INetCfgComponent, HRESULT)
    is_bindable_to : Proc(INetCfgComponentBindings*, INetCfgComponent, HRESULT)
    enum_binding_paths : Proc(INetCfgComponentBindings*, UInt32, IEnumNetCfgBindingPath*, HRESULT)
    move_before : Proc(INetCfgComponentBindings*, INetCfgBindingPath, INetCfgBindingPath, HRESULT)
    move_after : Proc(INetCfgComponentBindings*, INetCfgBindingPath, INetCfgBindingPath, HRESULT)
  end

  INetCfgComponentBindings_GUID = "c0e8ae9e-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgComponentBindings = LibC::GUID.new(0xc0e8ae9e_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgComponentBindings
    lpVtbl : INetCfgComponentBindingsVTbl*
  end

  struct INetCfgSysPrepVTbl
    query_interface : Proc(INetCfgSysPrep*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgSysPrep*, UInt32)
    release : Proc(INetCfgSysPrep*, UInt32)
    hr_setup_set_first_dword : Proc(INetCfgSysPrep*, LibC::LPWSTR, LibC::LPWSTR, UInt32, HRESULT)
    hr_setup_set_first_string : Proc(INetCfgSysPrep*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    hr_setup_set_first_string_as_bool : Proc(INetCfgSysPrep*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL, HRESULT)
    hr_setup_set_first_multi_sz_field : Proc(INetCfgSysPrep*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  INetCfgSysPrep_GUID = "c0e8ae98-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgSysPrep = LibC::GUID.new(0xc0e8ae98_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgSysPrep
    lpVtbl : INetCfgSysPrepVTbl*
  end

  struct INetCfgPnpReconfigCallbackVTbl
    query_interface : Proc(INetCfgPnpReconfigCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgPnpReconfigCallback*, UInt32)
    release : Proc(INetCfgPnpReconfigCallback*, UInt32)
    send_pnp_reconfig : Proc(INetCfgPnpReconfigCallback*, NCPNP_RECONFIG_LAYER, LibC::LPWSTR, LibC::LPWSTR, Void*, UInt32, HRESULT)
  end

  INetCfgPnpReconfigCallback_GUID = "8d84bd35-e227-11d2-b700-00a0c98a6a85"
  IID_INetCfgPnpReconfigCallback = LibC::GUID.new(0x8d84bd35_u32, 0xe227_u16, 0x11d2_u16, StaticArray[0xb7_u8, 0x0_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x8a_u8, 0x6a_u8, 0x85_u8])
  struct INetCfgPnpReconfigCallback
    lpVtbl : INetCfgPnpReconfigCallbackVTbl*
  end

  struct INetCfgComponentControlVTbl
    query_interface : Proc(INetCfgComponentControl*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentControl*, UInt32)
    release : Proc(INetCfgComponentControl*, UInt32)
    initialize : Proc(INetCfgComponentControl*, INetCfgComponent, INetCfg, LibC::BOOL, HRESULT)
    apply_registry_changes : Proc(INetCfgComponentControl*, HRESULT)
    apply_pnp_changes : Proc(INetCfgComponentControl*, INetCfgPnpReconfigCallback, HRESULT)
    cancel_changes : Proc(INetCfgComponentControl*, HRESULT)
  end

  INetCfgComponentControl_GUID = "932238df-bea1-11d0-9298-00c04fc99dcf"
  IID_INetCfgComponentControl = LibC::GUID.new(0x932238df_u32, 0xbea1_u16, 0x11d0_u16, StaticArray[0x92_u8, 0x98_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0x9d_u8, 0xcf_u8])
  struct INetCfgComponentControl
    lpVtbl : INetCfgComponentControlVTbl*
  end

  struct INetCfgComponentSetupVTbl
    query_interface : Proc(INetCfgComponentSetup*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentSetup*, UInt32)
    release : Proc(INetCfgComponentSetup*, UInt32)
    install : Proc(INetCfgComponentSetup*, UInt32, HRESULT)
    upgrade : Proc(INetCfgComponentSetup*, UInt32, UInt32, HRESULT)
    read_answer_file : Proc(INetCfgComponentSetup*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    removing : Proc(INetCfgComponentSetup*, HRESULT)
  end

  INetCfgComponentSetup_GUID = "932238e3-bea1-11d0-9298-00c04fc99dcf"
  IID_INetCfgComponentSetup = LibC::GUID.new(0x932238e3_u32, 0xbea1_u16, 0x11d0_u16, StaticArray[0x92_u8, 0x98_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0x9d_u8, 0xcf_u8])
  struct INetCfgComponentSetup
    lpVtbl : INetCfgComponentSetupVTbl*
  end

  struct INetCfgComponentPropertyUiVTbl
    query_interface : Proc(INetCfgComponentPropertyUi*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentPropertyUi*, UInt32)
    release : Proc(INetCfgComponentPropertyUi*, UInt32)
    query_property_ui : Proc(INetCfgComponentPropertyUi*, IUnknown, HRESULT)
    set_context : Proc(INetCfgComponentPropertyUi*, IUnknown, HRESULT)
    merge_prop_pages : Proc(INetCfgComponentPropertyUi*, UInt32*, UInt8**, UInt32*, LibC::HANDLE, LibC::LPWSTR*, HRESULT)
    validate_properties : Proc(INetCfgComponentPropertyUi*, LibC::HANDLE, HRESULT)
    apply_properties : Proc(INetCfgComponentPropertyUi*, HRESULT)
    cancel_properties : Proc(INetCfgComponentPropertyUi*, HRESULT)
  end

  INetCfgComponentPropertyUi_GUID = "932238e0-bea1-11d0-9298-00c04fc99dcf"
  IID_INetCfgComponentPropertyUi = LibC::GUID.new(0x932238e0_u32, 0xbea1_u16, 0x11d0_u16, StaticArray[0x92_u8, 0x98_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0x9d_u8, 0xcf_u8])
  struct INetCfgComponentPropertyUi
    lpVtbl : INetCfgComponentPropertyUiVTbl*
  end

  struct INetCfgComponentNotifyBindingVTbl
    query_interface : Proc(INetCfgComponentNotifyBinding*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentNotifyBinding*, UInt32)
    release : Proc(INetCfgComponentNotifyBinding*, UInt32)
    query_binding_path : Proc(INetCfgComponentNotifyBinding*, UInt32, INetCfgBindingPath, HRESULT)
    notify_binding_path : Proc(INetCfgComponentNotifyBinding*, UInt32, INetCfgBindingPath, HRESULT)
  end

  INetCfgComponentNotifyBinding_GUID = "932238e1-bea1-11d0-9298-00c04fc99dcf"
  IID_INetCfgComponentNotifyBinding = LibC::GUID.new(0x932238e1_u32, 0xbea1_u16, 0x11d0_u16, StaticArray[0x92_u8, 0x98_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0x9d_u8, 0xcf_u8])
  struct INetCfgComponentNotifyBinding
    lpVtbl : INetCfgComponentNotifyBindingVTbl*
  end

  struct INetCfgComponentNotifyGlobalVTbl
    query_interface : Proc(INetCfgComponentNotifyGlobal*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentNotifyGlobal*, UInt32)
    release : Proc(INetCfgComponentNotifyGlobal*, UInt32)
    get_supported_notifications : Proc(INetCfgComponentNotifyGlobal*, UInt32*, HRESULT)
    sys_query_binding_path : Proc(INetCfgComponentNotifyGlobal*, UInt32, INetCfgBindingPath, HRESULT)
    sys_notify_binding_path : Proc(INetCfgComponentNotifyGlobal*, UInt32, INetCfgBindingPath, HRESULT)
    sys_notify_component : Proc(INetCfgComponentNotifyGlobal*, UInt32, INetCfgComponent, HRESULT)
  end

  INetCfgComponentNotifyGlobal_GUID = "932238e2-bea1-11d0-9298-00c04fc99dcf"
  IID_INetCfgComponentNotifyGlobal = LibC::GUID.new(0x932238e2_u32, 0xbea1_u16, 0x11d0_u16, StaticArray[0x92_u8, 0x98_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0x9d_u8, 0xcf_u8])
  struct INetCfgComponentNotifyGlobal
    lpVtbl : INetCfgComponentNotifyGlobalVTbl*
  end

  struct INetCfgComponentUpperEdgeVTbl
    query_interface : Proc(INetCfgComponentUpperEdge*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentUpperEdge*, UInt32)
    release : Proc(INetCfgComponentUpperEdge*, UInt32)
    get_interface_ids_for_adapter : Proc(INetCfgComponentUpperEdge*, INetCfgComponent, UInt32*, Guid**, HRESULT)
    add_interfaces_to_adapter : Proc(INetCfgComponentUpperEdge*, HRESULT)
    remove_interfaces_from_adapter : Proc(INetCfgComponentUpperEdge*, INetCfgComponent, UInt32, Guid*, HRESULT)
  end

  INetCfgComponentUpperEdge_GUID = "932238e4-bea1-11d0-9298-00c04fc99dcf"
  IID_INetCfgComponentUpperEdge = LibC::GUID.new(0x932238e4_u32, 0xbea1_u16, 0x11d0_u16, StaticArray[0x92_u8, 0x98_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc9_u8, 0x9d_u8, 0xcf_u8])
  struct INetCfgComponentUpperEdge
    lpVtbl : INetCfgComponentUpperEdgeVTbl*
  end

  struct INetLanConnectionUiInfoVTbl
    query_interface : Proc(INetLanConnectionUiInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetLanConnectionUiInfo*, UInt32)
    release : Proc(INetLanConnectionUiInfo*, UInt32)
    get_device_guid : Proc(INetLanConnectionUiInfo*, Guid*, HRESULT)
  end

  INetLanConnectionUiInfo_GUID = "c08956a6-1cd3-11d1-b1c5-00805fc1270e"
  IID_INetLanConnectionUiInfo = LibC::GUID.new(0xc08956a6_u32, 0x1cd3_u16, 0x11d1_u16, StaticArray[0xb1_u8, 0xc5_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetLanConnectionUiInfo
    lpVtbl : INetLanConnectionUiInfoVTbl*
  end

  struct INetRasConnectionIpUiInfoVTbl
    query_interface : Proc(INetRasConnectionIpUiInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetRasConnectionIpUiInfo*, UInt32)
    release : Proc(INetRasConnectionIpUiInfo*, UInt32)
    get_ui_info : Proc(INetRasConnectionIpUiInfo*, RASCON_IPUI*, HRESULT)
  end

  INetRasConnectionIpUiInfo_GUID = "faedcf58-31fe-11d1-aad2-00805fc1270e"
  IID_INetRasConnectionIpUiInfo = LibC::GUID.new(0xfaedcf58_u32, 0x31fe_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xd2_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetRasConnectionIpUiInfo
    lpVtbl : INetRasConnectionIpUiInfoVTbl*
  end

  struct INetCfgComponentSysPrepVTbl
    query_interface : Proc(INetCfgComponentSysPrep*, Guid*, Void**, HRESULT)
    add_ref : Proc(INetCfgComponentSysPrep*, UInt32)
    release : Proc(INetCfgComponentSysPrep*, UInt32)
    save_adapter_parameters : Proc(INetCfgComponentSysPrep*, INetCfgSysPrep, LibC::LPWSTR, Guid*, HRESULT)
    restore_adapter_parameters : Proc(INetCfgComponentSysPrep*, LibC::LPWSTR, LibC::LPWSTR, Guid*, HRESULT)
  end

  INetCfgComponentSysPrep_GUID = "c0e8ae9a-306e-11d1-aacf-00805fc1270e"
  IID_INetCfgComponentSysPrep = LibC::GUID.new(0xc0e8ae9a_u32, 0x306e_u16, 0x11d1_u16, StaticArray[0xaa_u8, 0xcf_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc1_u8, 0x27_u8, 0xe_u8])
  struct INetCfgComponentSysPrep
    lpVtbl : INetCfgComponentSysPrepVTbl*
  end

  struct IProvisioningDomainVTbl
    query_interface : Proc(IProvisioningDomain*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvisioningDomain*, UInt32)
    release : Proc(IProvisioningDomain*, UInt32)
    add : Proc(IProvisioningDomain*, LibC::LPWSTR, HRESULT)
    query : Proc(IProvisioningDomain*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, IXMLDOMNodeList*, HRESULT)
  end

  IProvisioningDomain_GUID = "c96fbd50-24dd-11d8-89fb-00904b2ea9c6"
  IID_IProvisioningDomain = LibC::GUID.new(0xc96fbd50_u32, 0x24dd_u16, 0x11d8_u16, StaticArray[0x89_u8, 0xfb_u8, 0x0_u8, 0x90_u8, 0x4b_u8, 0x2e_u8, 0xa9_u8, 0xc6_u8])
  struct IProvisioningDomain
    lpVtbl : IProvisioningDomainVTbl*
  end

  struct IProvisioningProfileWirelessVTbl
    query_interface : Proc(IProvisioningProfileWireless*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProvisioningProfileWireless*, UInt32)
    release : Proc(IProvisioningProfileWireless*, UInt32)
    create_profile : Proc(IProvisioningProfileWireless*, UInt8*, UInt8*, Guid*, UInt32*, HRESULT)
  end

  IProvisioningProfileWireless_GUID = "c96fbd51-24dd-11d8-89fb-00904b2ea9c6"
  IID_IProvisioningProfileWireless = LibC::GUID.new(0xc96fbd51_u32, 0x24dd_u16, 0x11d8_u16, StaticArray[0x89_u8, 0xfb_u8, 0x0_u8, 0x90_u8, 0x4b_u8, 0x2e_u8, 0xa9_u8, 0xc6_u8])
  struct IProvisioningProfileWireless
    lpVtbl : IProvisioningProfileWirelessVTbl*
  end


  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetUserAdd(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],filter : NET_USER_ENUM_FILTER_FLAGS [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetUserEnum(servername : LibC::LPWSTR, level : UInt32, filter : NET_USER_ENUM_FILTER_FLAGS, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetUserGetInfo(servername : LibC::LPWSTR, username : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetUserSetInfo(servername : LibC::LPWSTR, username : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In]
  fun NetUserDel(servername : LibC::LPWSTR, username : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In]
  fun NetUserGetGroups(servername : LibC::LPWSTR, username : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],num_entries : UInt32 [In]
  fun NetUserSetGroups(servername : LibC::LPWSTR, username : LibC::LPWSTR, level : UInt32, buf : UInt8*, num_entries : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],level : UInt32 [In],flags : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In]
  fun NetUserGetLocalGroups(servername : LibC::LPWSTR, username : LibC::LPWSTR, level : UInt32, flags : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetUserModalsGet(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetUserModalsSet(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # domainname : LibC::LPWSTR [In],username : LibC::LPWSTR [In],oldpassword : LibC::LPWSTR [In],newpassword : LibC::LPWSTR [In]
  fun NetUserChangePassword(domainname : LibC::LPWSTR, username : LibC::LPWSTR, oldpassword : LibC::LPWSTR, newpassword : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetGroupAdd(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],username : LibC::LPWSTR [In]
  fun NetGroupAddUser(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, username : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : LibC::UINT_PTR* [In]
  fun NetGroupEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : LibC::UINT_PTR*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetGroupGetInfo(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetGroupSetInfo(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In]
  fun NetGroupDel(servername : LibC::LPWSTR, groupname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],username : LibC::LPWSTR [In]
  fun NetGroupDelUser(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, username : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : LibC::UINT_PTR* [In]
  fun NetGroupGetUsers(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : LibC::UINT_PTR*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],totalentries : UInt32 [In]
  fun NetGroupSetUsers(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, buf : UInt8*, totalentries : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetLocalGroupAdd(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],membersid : PSID [In]
  fun NetLocalGroupAddMember(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, membersid : PSID) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : LibC::UINT_PTR* [In]
  fun NetLocalGroupEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : LibC::UINT_PTR*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetLocalGroupGetInfo(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetLocalGroupSetInfo(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In]
  fun NetLocalGroupDel(servername : LibC::LPWSTR, groupname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],membersid : PSID [In]
  fun NetLocalGroupDelMember(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, membersid : PSID) : UInt32

  # Params # servername : LibC::LPWSTR [In],localgroupname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : LibC::UINT_PTR* [In]
  fun NetLocalGroupGetMembers(servername : LibC::LPWSTR, localgroupname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : LibC::UINT_PTR*) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],totalentries : UInt32 [In]
  fun NetLocalGroupSetMembers(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, buf : UInt8*, totalentries : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],totalentries : UInt32 [In]
  fun NetLocalGroupAddMembers(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, buf : UInt8*, totalentries : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],groupname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],totalentries : UInt32 [In]
  fun NetLocalGroupDelMembers(servername : LibC::LPWSTR, groupname : LibC::LPWSTR, level : UInt32, buf : UInt8*, totalentries : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],index : UInt32 [In],entriesrequested : UInt32 [In],preferredmaximumlength : UInt32 [In],returnedentrycount : UInt32* [In],sortedbuffer : Void** [In]
  fun NetQueryDisplayInformation(servername : LibC::LPWSTR, level : UInt32, index : UInt32, entriesrequested : UInt32, preferredmaximumlength : UInt32, returnedentrycount : UInt32*, sortedbuffer : Void**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],prefix : LibC::LPWSTR [In],index : UInt32* [In]
  fun NetGetDisplayInformationIndex(servername : LibC::LPWSTR, level : UInt32, prefix : LibC::LPWSTR, index : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetAccessAdd(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],basepath : LibC::LPWSTR [In],recursive : UInt32 [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetAccessEnum(servername : LibC::LPWSTR, basepath : LibC::LPWSTR, recursive : UInt32, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],resource : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetAccessGetInfo(servername : LibC::LPWSTR, resource : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],resource : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetAccessSetInfo(servername : LibC::LPWSTR, resource : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],resource : LibC::LPWSTR [In]
  fun NetAccessDel(servername : LibC::LPWSTR, resource : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],ugname : LibC::LPWSTR [In],resource : LibC::LPWSTR [In],perms : UInt32* [In]
  fun NetAccessGetUserPerms(servername : LibC::LPWSTR, ugname : LibC::LPWSTR, resource : LibC::LPWSTR, perms : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],qualifier : Void* [In],validationtype : NET_VALIDATE_PASSWORD_TYPE [In],inputarg : Void* [In],outputarg : Void** [In]
  fun NetValidatePasswordPolicy(servername : LibC::LPWSTR, qualifier : Void*, validationtype : NET_VALIDATE_PASSWORD_TYPE, inputarg : Void*, outputarg : Void**) : UInt32

  # Params # outputarg : Void** [In]
  fun NetValidatePasswordPolicyFree(outputarg : Void**) : UInt32

  # Params # servername : LibC::LPWSTR [In],domainname : LibC::LPWSTR [In],buffer : UInt8** [In]
  fun NetGetDCName(servername : LibC::LPWSTR, domainname : LibC::LPWSTR, buffer : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],domainname : LibC::LPWSTR [In],buffer : UInt8** [In]
  fun NetGetAnyDCName(servername : LibC::LPWSTR, domainname : LibC::LPWSTR, buffer : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],functioncode : UInt32 [In],querylevel : UInt32 [In],data : UInt8* [In],buffer : UInt8** [In]
  fun I_NetLogonControl2(servername : LibC::LPWSTR, functioncode : UInt32, querylevel : UInt32, data : UInt8*, buffer : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],accountname : LibC::LPWSTR [In],password : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetAddServiceAccount(servername : LibC::LPWSTR, accountname : LibC::LPWSTR, password : LibC::LPWSTR, flags : UInt32) : NTSTATUS

  # Params # servername : LibC::LPWSTR [In],accountname : LibC::LPWSTR [In],flags : UInt32 [In]
  fun NetRemoveServiceAccount(servername : LibC::LPWSTR, accountname : LibC::LPWSTR, flags : UInt32) : NTSTATUS

  # Params # servername : LibC::LPWSTR [In],flags : UInt32 [In],accountscount : UInt32* [In],accounts : UInt16*** [In]
  fun NetEnumerateServiceAccounts(servername : LibC::LPWSTR, flags : UInt32, accountscount : UInt32*, accounts : UInt16***) : NTSTATUS

  # Params # servername : LibC::LPWSTR [In],accountname : LibC::LPWSTR [In],isservice : LibC::BOOL* [In]
  fun NetIsServiceAccount(servername : LibC::LPWSTR, accountname : LibC::LPWSTR, isservice : LibC::BOOL*) : NTSTATUS

  # Params # servername : LibC::LPWSTR [In],accountname : LibC::LPWSTR [In],infolevel : UInt32 [In],buffer : UInt8** [In]
  fun NetQueryServiceAccount(servername : LibC::LPWSTR, accountname : LibC::LPWSTR, infolevel : UInt32, buffer : UInt8**) : NTSTATUS

  # Params # alerttype : LibC::LPWSTR [In],buffer : Void* [In],buffersize : UInt32 [In]
  fun NetAlertRaise(alerttype : LibC::LPWSTR, buffer : Void*, buffersize : UInt32) : UInt32

  # Params # alerttype : LibC::LPWSTR [In],variableinfo : Void* [In],variableinfosize : UInt32 [In],servicename : LibC::LPWSTR [In]
  fun NetAlertRaiseEx(alerttype : LibC::LPWSTR, variableinfo : Void*, variableinfosize : UInt32, servicename : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],msgname : LibC::LPWSTR [In]
  fun NetMessageNameAdd(servername : LibC::LPWSTR, msgname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetMessageNameEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],msgname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetMessageNameGetInfo(servername : LibC::LPWSTR, msgname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],msgname : LibC::LPWSTR [In]
  fun NetMessageNameDel(servername : LibC::LPWSTR, msgname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],msgname : LibC::LPWSTR [In],fromname : LibC::LPWSTR [In],buf : UInt8* [In],buflen : UInt32 [In]
  fun NetMessageBufferSend(servername : LibC::LPWSTR, msgname : LibC::LPWSTR, fromname : LibC::LPWSTR, buf : UInt8*, buflen : UInt32) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],bufferptr : UInt8** [In]
  fun NetRemoteTOD(uncservername : LibC::LPWSTR, bufferptr : UInt8**) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],optionswanted : NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS [In],optionssupported : UInt32* [In]
  fun NetRemoteComputerSupports(uncservername : LibC::LPWSTR, optionswanted : NET_REMOTE_COMPUTER_SUPPORTS_OPTIONS, optionssupported : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetReplGetInfo(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetReplSetInfo(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetReplExportDirAdd(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In]
  fun NetReplExportDirDel(servername : LibC::LPWSTR, dirname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : UInt32* [In]
  fun NetReplExportDirEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetReplExportDirGetInfo(servername : LibC::LPWSTR, dirname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetReplExportDirSetInfo(servername : LibC::LPWSTR, dirname : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In]
  fun NetReplExportDirLock(servername : LibC::LPWSTR, dirname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In],unlockforce : UInt32 [In]
  fun NetReplExportDirUnlock(servername : LibC::LPWSTR, dirname : LibC::LPWSTR, unlockforce : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetReplImportDirAdd(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In]
  fun NetReplImportDirDel(servername : LibC::LPWSTR, dirname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : UInt32* [In]
  fun NetReplImportDirEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetReplImportDirGetInfo(servername : LibC::LPWSTR, dirname : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In]
  fun NetReplImportDirLock(servername : LibC::LPWSTR, dirname : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],dirname : LibC::LPWSTR [In],unlockforce : UInt32 [In]
  fun NetReplImportDirUnlock(servername : LibC::LPWSTR, dirname : LibC::LPWSTR, unlockforce : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],servertype : NET_SERVER_TYPE [In],domain : LibC::LPWSTR [In],resume_handle : UInt32* [In]
  fun NetServerEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, servertype : NET_SERVER_TYPE, domain : LibC::LPWSTR, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetServerGetInfo(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parmerror : UInt32* [In]
  fun NetServerSetInfo(servername : LibC::LPWSTR, level : UInt32, buf : UInt8*, parmerror : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetServerDiskEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],emulateddomainname : LibC::LPWSTR [In],emulatedservername : LibC::LPWSTR [In]
  fun NetServerComputerNameAdd(servername : LibC::LPWSTR, emulateddomainname : LibC::LPWSTR, emulatedservername : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],emulatedservername : LibC::LPWSTR [In]
  fun NetServerComputerNameDel(servername : LibC::LPWSTR, emulatedservername : LibC::LPWSTR) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8* [In]
  fun NetServerTransportAdd(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8* [In]
  fun NetServerTransportAddEx(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8* [In]
  fun NetServerTransportDel(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetServerTransportEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],service : LibC::LPWSTR [In],opcode : UInt32 [In],arg : UInt32 [In],bufptr : UInt8** [In]
  fun NetServiceControl(servername : LibC::LPWSTR, service : LibC::LPWSTR, opcode : UInt32, arg : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetServiceEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],service : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetServiceGetInfo(servername : LibC::LPWSTR, service : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],service : LibC::LPWSTR [In],argc : UInt32 [In],argv : LibC::LPWSTR* [In],bufptr : UInt8** [In]
  fun NetServiceInstall(servername : LibC::LPWSTR, service : LibC::LPWSTR, argc : UInt32, argv : LibC::LPWSTR*, bufptr : UInt8**) : UInt32

  # Params # servername : Int8* [In],levelflags : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetUseAdd(servername : Int8*, levelflags : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],usename : LibC::LPWSTR [In],forcelevelflags : FORCE_LEVEL_FLAGS [In]
  fun NetUseDel(uncservername : LibC::LPWSTR, usename : LibC::LPWSTR, forcelevelflags : FORCE_LEVEL_FLAGS) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],levelflags : UInt32 [In],bufptr : UInt8** [In],preferedmaximumsize : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : UInt32* [In]
  fun NetUseEnum(uncservername : LibC::LPWSTR, levelflags : UInt32, bufptr : UInt8**, preferedmaximumsize : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : UInt32*) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],usename : LibC::LPWSTR [In],levelflags : UInt32 [In],bufptr : UInt8** [In]
  fun NetUseGetInfo(uncservername : LibC::LPWSTR, usename : LibC::LPWSTR, levelflags : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetWkstaGetInfo(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],buffer : UInt8* [In],parm_err : UInt32* [In]
  fun NetWkstaSetInfo(servername : LibC::LPWSTR, level : UInt32, buffer : UInt8*, parm_err : UInt32*) : UInt32

  # Params # reserved : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In]
  fun NetWkstaUserGetInfo(reserved : LibC::LPWSTR, level : UInt32, bufptr : UInt8**) : UInt32

  # Params # reserved : LibC::LPWSTR [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetWkstaUserSetInfo(reserved : LibC::LPWSTR, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : UInt32* [In]
  fun NetWkstaUserEnum(servername : LibC::LPWSTR, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : UInt32*) : UInt32

  # Params # servername : Int8* [In],level : UInt32 [In],buf : UInt8* [In],parm_err : UInt32* [In]
  fun NetWkstaTransportAdd(servername : Int8*, level : UInt32, buf : UInt8*, parm_err : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],transportname : LibC::LPWSTR [In],ucond : FORCE_LEVEL_FLAGS [In]
  fun NetWkstaTransportDel(servername : LibC::LPWSTR, transportname : LibC::LPWSTR, ucond : FORCE_LEVEL_FLAGS) : UInt32

  # Params # servername : Int8* [In],level : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resume_handle : UInt32* [In]
  fun NetWkstaTransportEnum(servername : Int8*, level : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, entriesread : UInt32*, totalentries : UInt32*, resume_handle : UInt32*) : UInt32

  # Params # bytecount : UInt32 [In],buffer : Void** [In]
  fun NetApiBufferAllocate(bytecount : UInt32, buffer : Void**) : UInt32

  # Params # buffer : Void* [In]
  fun NetApiBufferFree(buffer : Void*) : UInt32

  # Params # oldbuffer : Void* [In],newbytecount : UInt32 [In],newbuffer : Void** [In]
  fun NetApiBufferReallocate(oldbuffer : Void*, newbytecount : UInt32, newbuffer : Void**) : UInt32

  # Params # buffer : Void* [In],bytecount : UInt32* [In]
  fun NetApiBufferSize(buffer : Void*, bytecount : UInt32*) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],backupfile : LibC::LPWSTR [In],reserved : UInt8* [In]
  fun NetErrorLogClear(uncservername : LibC::LPWSTR, backupfile : LibC::LPWSTR, reserved : UInt8*) : UInt32

  # Params # uncservername : LibC::LPWSTR [In],reserved1 : LibC::LPWSTR [In],errorloghandle : HLOG* [In],offset : UInt32 [In],reserved2 : UInt32* [In],reserved3 : UInt32 [In],offsetflag : UInt32 [In],bufptr : UInt8** [In],prefmaxsize : UInt32 [In],bytesread : UInt32* [In],totalavailable : UInt32* [In]
  fun NetErrorLogRead(uncservername : LibC::LPWSTR, reserved1 : LibC::LPWSTR, errorloghandle : HLOG*, offset : UInt32, reserved2 : UInt32*, reserved3 : UInt32, offsetflag : UInt32, bufptr : UInt8**, prefmaxsize : UInt32, bytesread : UInt32*, totalavailable : UInt32*) : UInt32

  # Params # reserved1 : UInt8* [In],code : UInt32 [In],component : LibC::LPWSTR [In],buffer : UInt8* [In],numbytes : UInt32 [In],msgbuf : UInt8* [In],strcount : UInt32 [In],reserved2 : UInt8* [In]
  fun NetErrorLogWrite(reserved1 : UInt8*, code : UInt32, component : LibC::LPWSTR, buffer : UInt8*, numbytes : UInt32, msgbuf : UInt8*, strcount : UInt32, reserved2 : UInt8*) : UInt32

  # Params # server : LibC::LPWSTR [In],component : LibC::LPWSTR [In],parameter : LibC::LPWSTR [In],bufptr : UInt8** [In]
  fun NetConfigGet(server : LibC::LPWSTR, component : LibC::LPWSTR, parameter : LibC::LPWSTR, bufptr : UInt8**) : UInt32

  # Params # server : LibC::LPWSTR [In],component : LibC::LPWSTR [In],bufptr : UInt8** [In]
  fun NetConfigGetAll(server : LibC::LPWSTR, component : LibC::LPWSTR, bufptr : UInt8**) : UInt32

  # Params # server : LibC::LPWSTR [In],reserved1 : LibC::LPWSTR [In],component : LibC::LPWSTR [In],level : UInt32 [In],reserved2 : UInt32 [In],buf : UInt8* [In],reserved3 : UInt32 [In]
  fun NetConfigSet(server : LibC::LPWSTR, reserved1 : LibC::LPWSTR, component : LibC::LPWSTR, level : UInt32, reserved2 : UInt32, buf : UInt8*, reserved3 : UInt32) : UInt32

  # Params # server : LibC::LPWSTR [In],backupfile : LibC::LPWSTR [In],service : LibC::LPWSTR [In]
  fun NetAuditClear(server : LibC::LPWSTR, backupfile : LibC::LPWSTR, service : LibC::LPWSTR) : UInt32

  # Params # server : LibC::LPWSTR [In],service : LibC::LPWSTR [In],auditloghandle : HLOG* [In],offset : UInt32 [In],reserved1 : UInt32* [In],reserved2 : UInt32 [In],offsetflag : UInt32 [In],bufptr : UInt8** [In],prefmaxlen : UInt32 [In],bytesread : UInt32* [In],totalavailable : UInt32* [In]
  fun NetAuditRead(server : LibC::LPWSTR, service : LibC::LPWSTR, auditloghandle : HLOG*, offset : UInt32, reserved1 : UInt32*, reserved2 : UInt32, offsetflag : UInt32, bufptr : UInt8**, prefmaxlen : UInt32, bytesread : UInt32*, totalavailable : UInt32*) : UInt32

  # Params # type : UInt32 [In],buf : UInt8* [In],numbytes : UInt32 [In],service : LibC::LPWSTR [In],reserved : UInt8* [In]
  fun NetAuditWrite(type : UInt32, buf : UInt8*, numbytes : UInt32, service : LibC::LPWSTR, reserved : UInt8*) : UInt32

  # Params # lpserver : LibC::LPWSTR [In],lpdomain : LibC::LPWSTR [In],lpmachineaccountou : LibC::LPWSTR [In],lpaccount : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],fjoinoptions : NET_JOIN_DOMAIN_JOIN_OPTIONS [In]
  fun NetJoinDomain(lpserver : LibC::LPWSTR, lpdomain : LibC::LPWSTR, lpmachineaccountou : LibC::LPWSTR, lpaccount : LibC::LPWSTR, lppassword : LibC::LPWSTR, fjoinoptions : NET_JOIN_DOMAIN_JOIN_OPTIONS) : UInt32

  # Params # lpserver : LibC::LPWSTR [In],lpaccount : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],funjoinoptions : UInt32 [In]
  fun NetUnjoinDomain(lpserver : LibC::LPWSTR, lpaccount : LibC::LPWSTR, lppassword : LibC::LPWSTR, funjoinoptions : UInt32) : UInt32

  # Params # lpserver : LibC::LPWSTR [In],lpnewmachinename : LibC::LPWSTR [In],lpaccount : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],frenameoptions : UInt32 [In]
  fun NetRenameMachineInDomain(lpserver : LibC::LPWSTR, lpnewmachinename : LibC::LPWSTR, lpaccount : LibC::LPWSTR, lppassword : LibC::LPWSTR, frenameoptions : UInt32) : UInt32

  # Params # lpserver : LibC::LPWSTR [In],lpname : LibC::LPWSTR [In],lpaccount : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],nametype : NETSETUP_NAME_TYPE [In]
  fun NetValidateName(lpserver : LibC::LPWSTR, lpname : LibC::LPWSTR, lpaccount : LibC::LPWSTR, lppassword : LibC::LPWSTR, nametype : NETSETUP_NAME_TYPE) : UInt32

  # Params # lpserver : LibC::LPWSTR [In],lpdomain : LibC::LPWSTR [In],lpaccount : LibC::LPWSTR [In],lppassword : LibC::LPWSTR [In],oucount : UInt32* [In],ous : LibC::LPWSTR** [In]
  fun NetGetJoinableOUs(lpserver : LibC::LPWSTR, lpdomain : LibC::LPWSTR, lpaccount : LibC::LPWSTR, lppassword : LibC::LPWSTR, oucount : UInt32*, ous : LibC::LPWSTR**) : UInt32

  # Params # server : LibC::LPWSTR [In],alternatename : LibC::LPWSTR [In],domainaccount : LibC::LPWSTR [In],domainaccountpassword : LibC::LPWSTR [In],reserved : UInt32 [In]
  fun NetAddAlternateComputerName(server : LibC::LPWSTR, alternatename : LibC::LPWSTR, domainaccount : LibC::LPWSTR, domainaccountpassword : LibC::LPWSTR, reserved : UInt32) : UInt32

  # Params # server : LibC::LPWSTR [In],alternatename : LibC::LPWSTR [In],domainaccount : LibC::LPWSTR [In],domainaccountpassword : LibC::LPWSTR [In],reserved : UInt32 [In]
  fun NetRemoveAlternateComputerName(server : LibC::LPWSTR, alternatename : LibC::LPWSTR, domainaccount : LibC::LPWSTR, domainaccountpassword : LibC::LPWSTR, reserved : UInt32) : UInt32

  # Params # server : LibC::LPWSTR [In],primaryname : LibC::LPWSTR [In],domainaccount : LibC::LPWSTR [In],domainaccountpassword : LibC::LPWSTR [In],reserved : UInt32 [In]
  fun NetSetPrimaryComputerName(server : LibC::LPWSTR, primaryname : LibC::LPWSTR, domainaccount : LibC::LPWSTR, domainaccountpassword : LibC::LPWSTR, reserved : UInt32) : UInt32

  # Params # server : LibC::LPWSTR [In],nametype : NET_COMPUTER_NAME_TYPE [In],reserved : UInt32 [In],entrycount : UInt32* [In],computernames : LibC::LPWSTR** [In]
  fun NetEnumerateComputerNames(server : LibC::LPWSTR, nametype : NET_COMPUTER_NAME_TYPE, reserved : UInt32, entrycount : UInt32*, computernames : LibC::LPWSTR**) : UInt32

  # Params # lpdomain : LibC::LPWSTR [In],lpmachinename : LibC::LPWSTR [In],lpmachineaccountou : LibC::LPWSTR [In],lpdcname : LibC::LPWSTR [In],dwoptions : NETSETUP_PROVISION [In],pprovisionbindata : UInt8** [In],pdwprovisionbindatasize : UInt32* [In],pprovisiontextdata : LibC::LPWSTR* [In]
  fun NetProvisionComputerAccount(lpdomain : LibC::LPWSTR, lpmachinename : LibC::LPWSTR, lpmachineaccountou : LibC::LPWSTR, lpdcname : LibC::LPWSTR, dwoptions : NETSETUP_PROVISION, pprovisionbindata : UInt8**, pdwprovisionbindatasize : UInt32*, pprovisiontextdata : LibC::LPWSTR*) : UInt32

  # Params # pprovisionbindata : UInt8* [In],cbprovisionbindatasize : UInt32 [In],dwoptions : NET_REQUEST_PROVISION_OPTIONS [In],lpwindowspath : LibC::LPWSTR [In]
  fun NetRequestOfflineDomainJoin(pprovisionbindata : UInt8*, cbprovisionbindatasize : UInt32, dwoptions : NET_REQUEST_PROVISION_OPTIONS, lpwindowspath : LibC::LPWSTR) : UInt32

  # Params # pprovisioningparams : NETSETUP_PROVISIONING_PARAMS* [In],pppackagebindata : UInt8** [In],pdwpackagebindatasize : UInt32* [In],pppackagetextdata : LibC::LPWSTR* [In]
  fun NetCreateProvisioningPackage(pprovisioningparams : NETSETUP_PROVISIONING_PARAMS*, pppackagebindata : UInt8**, pdwpackagebindatasize : UInt32*, pppackagetextdata : LibC::LPWSTR*) : UInt32

  # Params # ppackagebindata : UInt8* [In],dwpackagebindatasize : UInt32 [In],dwprovisionoptions : NET_REQUEST_PROVISION_OPTIONS [In],lpwindowspath : LibC::LPWSTR [In],pvreserved : Void* [In]
  fun NetRequestProvisioningPackageInstall(ppackagebindata : UInt8*, dwpackagebindatasize : UInt32, dwprovisionoptions : NET_REQUEST_PROVISION_OPTIONS, lpwindowspath : LibC::LPWSTR, pvreserved : Void*) : UInt32

  # Params # pcsztenantid : LibC::LPWSTR [In],ppjoininfo : DSREG_JOIN_INFO** [In]
  fun NetGetAadJoinInformation(pcsztenantid : LibC::LPWSTR, ppjoininfo : DSREG_JOIN_INFO**) : HRESULT

  # Params # pjoininfo : DSREG_JOIN_INFO* [In]
  fun NetFreeAadJoinInformation(pjoininfo : DSREG_JOIN_INFO*) : Void

  # Params # lpserver : LibC::LPWSTR [In],lpnamebuffer : LibC::LPWSTR* [In],buffertype : NETSETUP_JOIN_STATUS* [In]
  fun NetGetJoinInformation(lpserver : LibC::LPWSTR, lpnamebuffer : LibC::LPWSTR*, buffertype : NETSETUP_JOIN_STATUS*) : UInt32

  # Params # pwszservername : LibC::LPWSTR [In],ccaccount : UInt32 [In],wszaccount : Char* [In]
  fun GetNetScheduleAccountInformation(pwszservername : LibC::LPWSTR, ccaccount : UInt32, wszaccount : Char*) : HRESULT

  # Params # pwszservername : LibC::LPWSTR [In],pwszaccount : LibC::LPWSTR [In],pwszpassword : LibC::LPWSTR [In]
  fun SetNetScheduleAccountInformation(pwszservername : LibC::LPWSTR, pwszaccount : LibC::LPWSTR, pwszpassword : LibC::LPWSTR) : HRESULT

  # Params # servername : LibC::LPWSTR [In],buffer : UInt8* [In],jobid : UInt32* [In]
  fun NetScheduleJobAdd(servername : LibC::LPWSTR, buffer : UInt8*, jobid : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],minjobid : UInt32 [In],maxjobid : UInt32 [In]
  fun NetScheduleJobDel(servername : LibC::LPWSTR, minjobid : UInt32, maxjobid : UInt32) : UInt32

  # Params # servername : LibC::LPWSTR [In],pointertobuffer : UInt8** [In],prefferedmaximumlength : UInt32 [In],entriesread : UInt32* [In],totalentries : UInt32* [In],resumehandle : UInt32* [In]
  fun NetScheduleJobEnum(servername : LibC::LPWSTR, pointertobuffer : UInt8**, prefferedmaximumlength : UInt32, entriesread : UInt32*, totalentries : UInt32*, resumehandle : UInt32*) : UInt32

  # Params # servername : LibC::LPWSTR [In],jobid : UInt32 [In],pointertobuffer : UInt8** [In]
  fun NetScheduleJobGetInfo(servername : LibC::LPWSTR, jobid : UInt32, pointertobuffer : UInt8**) : UInt32

  # Params # lpszcallername : PSTR [In],dwflags : UInt32 [In]
  fun TraceRegisterExA(lpszcallername : PSTR, dwflags : UInt32) : UInt32

  # Params # dwtraceid : UInt32 [In]
  fun TraceDeregisterA(dwtraceid : UInt32) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In]
  fun TraceDeregisterExA(dwtraceid : UInt32, dwflags : UInt32) : UInt32

  # Params # dwtraceid : UInt32 [In],lphconsole : LibC::HANDLE* [In]
  fun TraceGetConsoleA(dwtraceid : UInt32, lphconsole : LibC::HANDLE*) : UInt32

  # Params # dwtraceid : UInt32 [In],lpszformat : PSTR [In]
  fun TracePrintfA(dwtraceid : UInt32, lpszformat : PSTR) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpszformat : PSTR [In]
  fun TracePrintfExA(dwtraceid : UInt32, dwflags : UInt32, lpszformat : PSTR) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpszformat : PSTR [In],arglist : Int8* [In]
  fun TraceVprintfExA(dwtraceid : UInt32, dwflags : UInt32, lpszformat : PSTR, arglist : Int8*) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpszstring : PSTR [In]
  fun TracePutsExA(dwtraceid : UInt32, dwflags : UInt32, lpszstring : PSTR) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpbbytes : UInt8* [In],dwbytecount : UInt32 [In],dwgroupsize : UInt32 [In],baddressprefix : LibC::BOOL [In],lpszprefix : PSTR [In]
  fun TraceDumpExA(dwtraceid : UInt32, dwflags : UInt32, lpbbytes : UInt8*, dwbytecount : UInt32, dwgroupsize : UInt32, baddressprefix : LibC::BOOL, lpszprefix : PSTR) : UInt32

  # Params # lpszcallername : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun TraceRegisterExW(lpszcallername : LibC::LPWSTR, dwflags : UInt32) : UInt32

  # Params # dwtraceid : UInt32 [In]
  fun TraceDeregisterW(dwtraceid : UInt32) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In]
  fun TraceDeregisterExW(dwtraceid : UInt32, dwflags : UInt32) : UInt32

  # Params # dwtraceid : UInt32 [In],lphconsole : LibC::HANDLE* [In]
  fun TraceGetConsoleW(dwtraceid : UInt32, lphconsole : LibC::HANDLE*) : UInt32

  # Params # dwtraceid : UInt32 [In],lpszformat : LibC::LPWSTR [In]
  fun TracePrintfW(dwtraceid : UInt32, lpszformat : LibC::LPWSTR) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpszformat : LibC::LPWSTR [In]
  fun TracePrintfExW(dwtraceid : UInt32, dwflags : UInt32, lpszformat : LibC::LPWSTR) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpszformat : LibC::LPWSTR [In],arglist : Int8* [In]
  fun TraceVprintfExW(dwtraceid : UInt32, dwflags : UInt32, lpszformat : LibC::LPWSTR, arglist : Int8*) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpszstring : LibC::LPWSTR [In]
  fun TracePutsExW(dwtraceid : UInt32, dwflags : UInt32, lpszstring : LibC::LPWSTR) : UInt32

  # Params # dwtraceid : UInt32 [In],dwflags : UInt32 [In],lpbbytes : UInt8* [In],dwbytecount : UInt32 [In],dwgroupsize : UInt32 [In],baddressprefix : LibC::BOOL [In],lpszprefix : LibC::LPWSTR [In]
  fun TraceDumpExW(dwtraceid : UInt32, dwflags : UInt32, lpbbytes : UInt8*, dwbytecount : UInt32, dwgroupsize : UInt32, baddressprefix : LibC::BOOL, lpszprefix : LibC::LPWSTR) : UInt32

  # Params # dwmessageid : UInt32 [In],cnumberofsubstrings : UInt32 [In],plpwssubstrings : PSTR* [In],dwerrorcode : UInt32 [In]
  fun LogErrorA(dwmessageid : UInt32, cnumberofsubstrings : UInt32, plpwssubstrings : PSTR*, dwerrorcode : UInt32) : Void

  # Params # weventtype : UInt32 [In],dwmessageid : UInt32 [In],cnumberofsubstrings : UInt32 [In],plpwssubstrings : PSTR* [In]
  fun LogEventA(weventtype : UInt32, dwmessageid : UInt32, cnumberofsubstrings : UInt32, plpwssubstrings : PSTR*) : Void

  # Params # dwmessageid : UInt32 [In],cnumberofsubstrings : UInt32 [In],plpwssubstrings : LibC::LPWSTR* [In],dwerrorcode : UInt32 [In]
  fun LogErrorW(dwmessageid : UInt32, cnumberofsubstrings : UInt32, plpwssubstrings : LibC::LPWSTR*, dwerrorcode : UInt32) : Void

  # Params # weventtype : UInt32 [In],dwmessageid : UInt32 [In],cnumberofsubstrings : UInt32 [In],plpwssubstrings : LibC::LPWSTR* [In]
  fun LogEventW(weventtype : UInt32, dwmessageid : UInt32, cnumberofsubstrings : UInt32, plpwssubstrings : LibC::LPWSTR*) : Void

  # Params # lpszsource : PSTR [In]
  fun RouterLogRegisterA(lpszsource : PSTR) : LibC::HANDLE

  # Params # hloghandle : LibC::HANDLE [In]
  fun RouterLogDeregisterA(hloghandle : LibC::HANDLE) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwmessageid : UInt32 [In],dwsubstringcount : UInt32 [In],plpszsubstringarray : PSTR* [In],dwerrorcode : UInt32 [In]
  fun RouterLogEventA(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwmessageid : UInt32, dwsubstringcount : UInt32, plpszsubstringarray : PSTR*, dwerrorcode : UInt32) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwmessageid : UInt32 [In],dwsubstringcount : UInt32 [In],plpszsubstringarray : PSTR* [In],dwdatabytes : UInt32 [In],lpdatabytes : UInt8* [In]
  fun RouterLogEventDataA(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwmessageid : UInt32, dwsubstringcount : UInt32, plpszsubstringarray : PSTR*, dwdatabytes : UInt32, lpdatabytes : UInt8*) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwmessageid : UInt32 [In],dwsubstringcount : UInt32 [In],plpszsubstringarray : PSTR* [In],dwerrorcode : UInt32 [In],dwerrorindex : UInt32 [In]
  fun RouterLogEventStringA(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwmessageid : UInt32, dwsubstringcount : UInt32, plpszsubstringarray : PSTR*, dwerrorcode : UInt32, dwerrorindex : UInt32) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwerrorcode : UInt32 [In],dwmessageid : UInt32 [In],ptszformat : PSTR [In]
  fun RouterLogEventExA(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwerrorcode : UInt32, dwmessageid : UInt32, ptszformat : PSTR) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwerrorcode : UInt32 [In],dwmessageid : UInt32 [In],ptszformat : PSTR [In],arglist : Int8* [In]
  fun RouterLogEventValistExA(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwerrorcode : UInt32, dwmessageid : UInt32, ptszformat : PSTR, arglist : Int8*) : Void

  # Params # dwerrorcode : UInt32 [In],lplpszerrorstring : PSTR* [In]
  fun RouterGetErrorStringA(dwerrorcode : UInt32, lplpszerrorstring : PSTR*) : UInt32

  # Params # lpszsource : LibC::LPWSTR [In]
  fun RouterLogRegisterW(lpszsource : LibC::LPWSTR) : LibC::HANDLE

  # Params # hloghandle : LibC::HANDLE [In]
  fun RouterLogDeregisterW(hloghandle : LibC::HANDLE) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwmessageid : UInt32 [In],dwsubstringcount : UInt32 [In],plpszsubstringarray : LibC::LPWSTR* [In],dwerrorcode : UInt32 [In]
  fun RouterLogEventW(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwmessageid : UInt32, dwsubstringcount : UInt32, plpszsubstringarray : LibC::LPWSTR*, dwerrorcode : UInt32) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwmessageid : UInt32 [In],dwsubstringcount : UInt32 [In],plpszsubstringarray : LibC::LPWSTR* [In],dwdatabytes : UInt32 [In],lpdatabytes : UInt8* [In]
  fun RouterLogEventDataW(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwmessageid : UInt32, dwsubstringcount : UInt32, plpszsubstringarray : LibC::LPWSTR*, dwdatabytes : UInt32, lpdatabytes : UInt8*) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwmessageid : UInt32 [In],dwsubstringcount : UInt32 [In],plpszsubstringarray : LibC::LPWSTR* [In],dwerrorcode : UInt32 [In],dwerrorindex : UInt32 [In]
  fun RouterLogEventStringW(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwmessageid : UInt32, dwsubstringcount : UInt32, plpszsubstringarray : LibC::LPWSTR*, dwerrorcode : UInt32, dwerrorindex : UInt32) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwerrorcode : UInt32 [In],dwmessageid : UInt32 [In],ptszformat : LibC::LPWSTR [In]
  fun RouterLogEventExW(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwerrorcode : UInt32, dwmessageid : UInt32, ptszformat : LibC::LPWSTR) : Void

  # Params # hloghandle : LibC::HANDLE [In],dweventtype : UInt32 [In],dwerrorcode : UInt32 [In],dwmessageid : UInt32 [In],ptszformat : LibC::LPWSTR [In],arglist : Int8* [In]
  fun RouterLogEventValistExW(hloghandle : LibC::HANDLE, dweventtype : UInt32, dwerrorcode : UInt32, dwmessageid : UInt32, ptszformat : LibC::LPWSTR, arglist : Int8*) : Void

  # Params # dwerrorcode : UInt32 [In],lplpwszerrorstring : LibC::LPWSTR* [In]
  fun RouterGetErrorStringW(dwerrorcode : UInt32, lplpwszerrorstring : LibC::LPWSTR*) : UInt32

  # Params # pszfailedassertion : PSTR [In],pszfilename : PSTR [In],dwlinenumber : UInt32 [In],pszmessage : PSTR [In]
  fun RouterAssert(pszfailedassertion : PSTR, pszfilename : PSTR, dwlinenumber : UInt32, pszmessage : PSTR) : Void

  # Params # dwtransportid : UInt32 [In],lplpbuffer : UInt8** [In],lpdwentriesread : UInt32* [In]
  fun MprSetupProtocolEnum(dwtransportid : UInt32, lplpbuffer : UInt8**, lpdwentriesread : UInt32*) : UInt32

  # Params # lpbuffer : Void* [In]
  fun MprSetupProtocolFree(lpbuffer : Void*) : UInt32
end
struct LibWin32::IEnumNetCfgBindingInterface
  def query_interface(this : IEnumNetCfgBindingInterface*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetCfgBindingInterface*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetCfgBindingInterface*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetCfgBindingInterface*, celt : UInt32, rgelt : INetCfgBindingInterface*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumNetCfgBindingInterface*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetCfgBindingInterface*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetCfgBindingInterface*, ppenum : IEnumNetCfgBindingInterface*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumNetCfgBindingPath
  def query_interface(this : IEnumNetCfgBindingPath*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetCfgBindingPath*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetCfgBindingPath*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetCfgBindingPath*, celt : UInt32, rgelt : INetCfgBindingPath*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumNetCfgBindingPath*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetCfgBindingPath*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetCfgBindingPath*, ppenum : IEnumNetCfgBindingPath*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::IEnumNetCfgComponent
  def query_interface(this : IEnumNetCfgComponent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEnumNetCfgComponent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEnumNetCfgComponent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def next(this : IEnumNetCfgComponent*, celt : UInt32, rgelt : INetCfgComponent*, pceltfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.call(this, celt, rgelt, pceltfetched)
  end
  def skip(this : IEnumNetCfgComponent*, celt : UInt32) : HRESULT
    @lpVtbl.value.skip.call(this, celt)
  end
  def reset(this : IEnumNetCfgComponent*) : HRESULT
    @lpVtbl.value.reset.call(this)
  end
  def clone(this : IEnumNetCfgComponent*, ppenum : IEnumNetCfgComponent*) : HRESULT
    @lpVtbl.value.clone.call(this, ppenum)
  end
end
struct LibWin32::INetCfg
  def query_interface(this : INetCfg*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfg*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfg*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : INetCfg*, pvreserved : Void*) : HRESULT
    @lpVtbl.value.initialize.call(this, pvreserved)
  end
  def uninitialize(this : INetCfg*) : HRESULT
    @lpVtbl.value.uninitialize.call(this)
  end
  def apply(this : INetCfg*) : HRESULT
    @lpVtbl.value.apply.call(this)
  end
  def cancel(this : INetCfg*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def enum_components(this : INetCfg*, pguidclass : Guid*, ppenumcomponent : IEnumNetCfgComponent*) : HRESULT
    @lpVtbl.value.enum_components.call(this, pguidclass, ppenumcomponent)
  end
  def find_component(this : INetCfg*, pszwinfid : LibC::LPWSTR, pcomponent : INetCfgComponent*) : HRESULT
    @lpVtbl.value.find_component.call(this, pszwinfid, pcomponent)
  end
  def query_net_cfg_class(this : INetCfg*, pguidclass : Guid*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_net_cfg_class.call(this, pguidclass, riid, ppvobject)
  end
end
struct LibWin32::INetCfgLock
  def query_interface(this : INetCfgLock*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgLock*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgLock*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_write_lock(this : INetCfgLock*, cmstimeout : UInt32, pszwclientdescription : LibC::LPWSTR, ppszwclientdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.acquire_write_lock.call(this, cmstimeout, pszwclientdescription, ppszwclientdescription)
  end
  def release_write_lock(this : INetCfgLock*) : HRESULT
    @lpVtbl.value.release_write_lock.call(this)
  end
  def is_write_locked(this : INetCfgLock*, ppszwclientdescription : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.is_write_locked.call(this, ppszwclientdescription)
  end
end
struct LibWin32::INetCfgBindingInterface
  def query_interface(this : INetCfgBindingInterface*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgBindingInterface*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgBindingInterface*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_name(this : INetCfgBindingInterface*, ppszwinterfacename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_name.call(this, ppszwinterfacename)
  end
  def get_upper_component(this : INetCfgBindingInterface*, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.get_upper_component.call(this, ppnccitem)
  end
  def get_lower_component(this : INetCfgBindingInterface*, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.get_lower_component.call(this, ppnccitem)
  end
end
struct LibWin32::INetCfgBindingPath
  def query_interface(this : INetCfgBindingPath*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgBindingPath*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgBindingPath*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_same_path_as(this : INetCfgBindingPath*, ppath : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.is_same_path_as.call(this, ppath)
  end
  def is_sub_path_of(this : INetCfgBindingPath*, ppath : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.is_sub_path_of.call(this, ppath)
  end
  def is_enabled(this : INetCfgBindingPath*) : HRESULT
    @lpVtbl.value.is_enabled.call(this)
  end
  def enable(this : INetCfgBindingPath*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable.call(this, fenable)
  end
  def get_path_token(this : INetCfgBindingPath*, ppszwpathtoken : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_path_token.call(this, ppszwpathtoken)
  end
  def get_owner(this : INetCfgBindingPath*, ppcomponent : INetCfgComponent*) : HRESULT
    @lpVtbl.value.get_owner.call(this, ppcomponent)
  end
  def get_depth(this : INetCfgBindingPath*, pcinterfaces : UInt32*) : HRESULT
    @lpVtbl.value.get_depth.call(this, pcinterfaces)
  end
  def enum_binding_interfaces(this : INetCfgBindingPath*, ppenuminterface : IEnumNetCfgBindingInterface*) : HRESULT
    @lpVtbl.value.enum_binding_interfaces.call(this, ppenuminterface)
  end
end
struct LibWin32::INetCfgClass
  def query_interface(this : INetCfgClass*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgClass*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgClass*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_component(this : INetCfgClass*, pszwinfid : LibC::LPWSTR, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.find_component.call(this, pszwinfid, ppnccitem)
  end
  def enum_components(this : INetCfgClass*, ppenumcomponent : IEnumNetCfgComponent*) : HRESULT
    @lpVtbl.value.enum_components.call(this, ppenumcomponent)
  end
end
struct LibWin32::INetCfgClassSetup
  def query_interface(this : INetCfgClassSetup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgClassSetup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgClassSetup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select_and_install(this : INetCfgClassSetup*, hwndparent : LibC::HANDLE, pobotoken : OBO_TOKEN*, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.select_and_install.call(this, hwndparent, pobotoken, ppnccitem)
  end
  def install(this : INetCfgClassSetup*, pszwinfid : LibC::LPWSTR, pobotoken : OBO_TOKEN*, dwsetupflags : UInt32, dwupgradefrombuildno : UInt32, pszwanswerfile : LibC::LPWSTR, pszwanswersections : LibC::LPWSTR, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.install.call(this, pszwinfid, pobotoken, dwsetupflags, dwupgradefrombuildno, pszwanswerfile, pszwanswersections, ppnccitem)
  end
  def de_install(this : INetCfgClassSetup*, pcomponent : INetCfgComponent, pobotoken : OBO_TOKEN*, pmszwrefs : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.de_install.call(this, pcomponent, pobotoken, pmszwrefs)
  end
end
struct LibWin32::INetCfgClassSetup2
  def query_interface(this : INetCfgClassSetup2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgClassSetup2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgClassSetup2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select_and_install(this : INetCfgClassSetup2*, hwndparent : LibC::HANDLE, pobotoken : OBO_TOKEN*, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.select_and_install.call(this, hwndparent, pobotoken, ppnccitem)
  end
  def install(this : INetCfgClassSetup2*, pszwinfid : LibC::LPWSTR, pobotoken : OBO_TOKEN*, dwsetupflags : UInt32, dwupgradefrombuildno : UInt32, pszwanswerfile : LibC::LPWSTR, pszwanswersections : LibC::LPWSTR, ppnccitem : INetCfgComponent*) : HRESULT
    @lpVtbl.value.install.call(this, pszwinfid, pobotoken, dwsetupflags, dwupgradefrombuildno, pszwanswerfile, pszwanswersections, ppnccitem)
  end
  def de_install(this : INetCfgClassSetup2*, pcomponent : INetCfgComponent, pobotoken : OBO_TOKEN*, pmszwrefs : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.de_install.call(this, pcomponent, pobotoken, pmszwrefs)
  end
  def update_non_enumerated_component(this : INetCfgClassSetup2*, picomp : INetCfgComponent, dwsetupflags : UInt32, dwupgradefrombuildno : UInt32) : HRESULT
    @lpVtbl.value.update_non_enumerated_component.call(this, picomp, dwsetupflags, dwupgradefrombuildno)
  end
end
struct LibWin32::INetCfgComponent
  def query_interface(this : INetCfgComponent*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponent*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponent*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_display_name(this : INetCfgComponent*, ppszwdisplayname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_display_name.call(this, ppszwdisplayname)
  end
  def set_display_name(this : INetCfgComponent*, pszwdisplayname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_display_name.call(this, pszwdisplayname)
  end
  def get_help_text(this : INetCfgComponent*, pszwhelptext : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_help_text.call(this, pszwhelptext)
  end
  def get_id(this : INetCfgComponent*, ppszwid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_id.call(this, ppszwid)
  end
  def get_characteristics(this : INetCfgComponent*, pdwcharacteristics : UInt32*) : HRESULT
    @lpVtbl.value.get_characteristics.call(this, pdwcharacteristics)
  end
  def get_instance_guid(this : INetCfgComponent*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_instance_guid.call(this, pguid)
  end
  def get_pnp_dev_node_id(this : INetCfgComponent*, ppszwdevnodeid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_pnp_dev_node_id.call(this, ppszwdevnodeid)
  end
  def get_class_guid(this : INetCfgComponent*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_class_guid.call(this, pguid)
  end
  def get_bind_name(this : INetCfgComponent*, ppszwbindname : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_bind_name.call(this, ppszwbindname)
  end
  def get_device_status(this : INetCfgComponent*, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_device_status.call(this, pulstatus)
  end
  def open_param_key(this : INetCfgComponent*, phkey : HKEY*) : HRESULT
    @lpVtbl.value.open_param_key.call(this, phkey)
  end
  def raise_property_ui(this : INetCfgComponent*, hwndparent : LibC::HANDLE, dwflags : UInt32, punkcontext : IUnknown) : HRESULT
    @lpVtbl.value.raise_property_ui.call(this, hwndparent, dwflags, punkcontext)
  end
end
struct LibWin32::INetCfgComponentBindings
  def query_interface(this : INetCfgComponentBindings*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentBindings*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentBindings*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def bind_to(this : INetCfgComponentBindings*, pnccitem : INetCfgComponent) : HRESULT
    @lpVtbl.value.bind_to.call(this, pnccitem)
  end
  def unbind_from(this : INetCfgComponentBindings*, pnccitem : INetCfgComponent) : HRESULT
    @lpVtbl.value.unbind_from.call(this, pnccitem)
  end
  def supports_binding_interface(this : INetCfgComponentBindings*, dwflags : UInt32, pszwinterfacename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.supports_binding_interface.call(this, dwflags, pszwinterfacename)
  end
  def is_bound_to(this : INetCfgComponentBindings*, pnccitem : INetCfgComponent) : HRESULT
    @lpVtbl.value.is_bound_to.call(this, pnccitem)
  end
  def is_bindable_to(this : INetCfgComponentBindings*, pnccitem : INetCfgComponent) : HRESULT
    @lpVtbl.value.is_bindable_to.call(this, pnccitem)
  end
  def enum_binding_paths(this : INetCfgComponentBindings*, dwflags : UInt32, ppienum : IEnumNetCfgBindingPath*) : HRESULT
    @lpVtbl.value.enum_binding_paths.call(this, dwflags, ppienum)
  end
  def move_before(this : INetCfgComponentBindings*, pncbitemsrc : INetCfgBindingPath, pncbitemdest : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.move_before.call(this, pncbitemsrc, pncbitemdest)
  end
  def move_after(this : INetCfgComponentBindings*, pncbitemsrc : INetCfgBindingPath, pncbitemdest : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.move_after.call(this, pncbitemsrc, pncbitemdest)
  end
end
struct LibWin32::INetCfgSysPrep
  def query_interface(this : INetCfgSysPrep*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgSysPrep*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgSysPrep*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def hr_setup_set_first_dword(this : INetCfgSysPrep*, pwszsection : LibC::LPWSTR, pwszkey : LibC::LPWSTR, dwvalue : UInt32) : HRESULT
    @lpVtbl.value.hr_setup_set_first_dword.call(this, pwszsection, pwszkey, dwvalue)
  end
  def hr_setup_set_first_string(this : INetCfgSysPrep*, pwszsection : LibC::LPWSTR, pwszkey : LibC::LPWSTR, pwszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.hr_setup_set_first_string.call(this, pwszsection, pwszkey, pwszvalue)
  end
  def hr_setup_set_first_string_as_bool(this : INetCfgSysPrep*, pwszsection : LibC::LPWSTR, pwszkey : LibC::LPWSTR, fvalue : LibC::BOOL) : HRESULT
    @lpVtbl.value.hr_setup_set_first_string_as_bool.call(this, pwszsection, pwszkey, fvalue)
  end
  def hr_setup_set_first_multi_sz_field(this : INetCfgSysPrep*, pwszsection : LibC::LPWSTR, pwszkey : LibC::LPWSTR, pmszvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.hr_setup_set_first_multi_sz_field.call(this, pwszsection, pwszkey, pmszvalue)
  end
end
struct LibWin32::INetCfgPnpReconfigCallback
  def query_interface(this : INetCfgPnpReconfigCallback*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgPnpReconfigCallback*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgPnpReconfigCallback*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def send_pnp_reconfig(this : INetCfgPnpReconfigCallback*, layer : NCPNP_RECONFIG_LAYER, pszwupper : LibC::LPWSTR, pszwlower : LibC::LPWSTR, pvdata : Void*, dwsizeofdata : UInt32) : HRESULT
    @lpVtbl.value.send_pnp_reconfig.call(this, layer, pszwupper, pszwlower, pvdata, dwsizeofdata)
  end
end
struct LibWin32::INetCfgComponentControl
  def query_interface(this : INetCfgComponentControl*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentControl*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentControl*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def initialize(this : INetCfgComponentControl*, picomp : INetCfgComponent, pinetcfg : INetCfg, finstalling : LibC::BOOL) : HRESULT
    @lpVtbl.value.initialize.call(this, picomp, pinetcfg, finstalling)
  end
  def apply_registry_changes(this : INetCfgComponentControl*) : HRESULT
    @lpVtbl.value.apply_registry_changes.call(this)
  end
  def apply_pnp_changes(this : INetCfgComponentControl*, picallback : INetCfgPnpReconfigCallback) : HRESULT
    @lpVtbl.value.apply_pnp_changes.call(this, picallback)
  end
  def cancel_changes(this : INetCfgComponentControl*) : HRESULT
    @lpVtbl.value.cancel_changes.call(this)
  end
end
struct LibWin32::INetCfgComponentSetup
  def query_interface(this : INetCfgComponentSetup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentSetup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentSetup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def install(this : INetCfgComponentSetup*, dwsetupflags : UInt32) : HRESULT
    @lpVtbl.value.install.call(this, dwsetupflags)
  end
  def upgrade(this : INetCfgComponentSetup*, dwsetupflags : UInt32, dwupgradefombuildno : UInt32) : HRESULT
    @lpVtbl.value.upgrade.call(this, dwsetupflags, dwupgradefombuildno)
  end
  def read_answer_file(this : INetCfgComponentSetup*, pszwanswerfile : LibC::LPWSTR, pszwanswersections : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.read_answer_file.call(this, pszwanswerfile, pszwanswersections)
  end
  def removing(this : INetCfgComponentSetup*) : HRESULT
    @lpVtbl.value.removing.call(this)
  end
end
struct LibWin32::INetCfgComponentPropertyUi
  def query_interface(this : INetCfgComponentPropertyUi*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentPropertyUi*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentPropertyUi*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_property_ui(this : INetCfgComponentPropertyUi*, punkreserved : IUnknown) : HRESULT
    @lpVtbl.value.query_property_ui.call(this, punkreserved)
  end
  def set_context(this : INetCfgComponentPropertyUi*, punkreserved : IUnknown) : HRESULT
    @lpVtbl.value.set_context.call(this, punkreserved)
  end
  def merge_prop_pages(this : INetCfgComponentPropertyUi*, pdwdefpages : UInt32*, pahpspprivate : UInt8**, pcpages : UInt32*, hwndparent : LibC::HANDLE, pszstartpage : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.merge_prop_pages.call(this, pdwdefpages, pahpspprivate, pcpages, hwndparent, pszstartpage)
  end
  def validate_properties(this : INetCfgComponentPropertyUi*, hwndsheet : LibC::HANDLE) : HRESULT
    @lpVtbl.value.validate_properties.call(this, hwndsheet)
  end
  def apply_properties(this : INetCfgComponentPropertyUi*) : HRESULT
    @lpVtbl.value.apply_properties.call(this)
  end
  def cancel_properties(this : INetCfgComponentPropertyUi*) : HRESULT
    @lpVtbl.value.cancel_properties.call(this)
  end
end
struct LibWin32::INetCfgComponentNotifyBinding
  def query_interface(this : INetCfgComponentNotifyBinding*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentNotifyBinding*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentNotifyBinding*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def query_binding_path(this : INetCfgComponentNotifyBinding*, dwchangeflag : UInt32, pipath : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.query_binding_path.call(this, dwchangeflag, pipath)
  end
  def notify_binding_path(this : INetCfgComponentNotifyBinding*, dwchangeflag : UInt32, pipath : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.notify_binding_path.call(this, dwchangeflag, pipath)
  end
end
struct LibWin32::INetCfgComponentNotifyGlobal
  def query_interface(this : INetCfgComponentNotifyGlobal*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentNotifyGlobal*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentNotifyGlobal*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_supported_notifications(this : INetCfgComponentNotifyGlobal*, dwnotifications : UInt32*) : HRESULT
    @lpVtbl.value.get_supported_notifications.call(this, dwnotifications)
  end
  def sys_query_binding_path(this : INetCfgComponentNotifyGlobal*, dwchangeflag : UInt32, pipath : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.sys_query_binding_path.call(this, dwchangeflag, pipath)
  end
  def sys_notify_binding_path(this : INetCfgComponentNotifyGlobal*, dwchangeflag : UInt32, pipath : INetCfgBindingPath) : HRESULT
    @lpVtbl.value.sys_notify_binding_path.call(this, dwchangeflag, pipath)
  end
  def sys_notify_component(this : INetCfgComponentNotifyGlobal*, dwchangeflag : UInt32, picomp : INetCfgComponent) : HRESULT
    @lpVtbl.value.sys_notify_component.call(this, dwchangeflag, picomp)
  end
end
struct LibWin32::INetCfgComponentUpperEdge
  def query_interface(this : INetCfgComponentUpperEdge*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentUpperEdge*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentUpperEdge*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_interface_ids_for_adapter(this : INetCfgComponentUpperEdge*, padapter : INetCfgComponent, pdwnuminterfaces : UInt32*, ppguidinterfaceids : Guid**) : HRESULT
    @lpVtbl.value.get_interface_ids_for_adapter.call(this, padapter, pdwnuminterfaces, ppguidinterfaceids)
  end
  def add_interfaces_to_adapter(this : INetCfgComponentUpperEdge*) : HRESULT
    @lpVtbl.value.add_interfaces_to_adapter.call(this)
  end
  def remove_interfaces_from_adapter(this : INetCfgComponentUpperEdge*, padapter : INetCfgComponent, dwnuminterfaces : UInt32, pguidinterfaceids : Guid*) : HRESULT
    @lpVtbl.value.remove_interfaces_from_adapter.call(this, padapter, dwnuminterfaces, pguidinterfaceids)
  end
end
struct LibWin32::INetLanConnectionUiInfo
  def query_interface(this : INetLanConnectionUiInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetLanConnectionUiInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetLanConnectionUiInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_device_guid(this : INetLanConnectionUiInfo*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_device_guid.call(this, pguid)
  end
end
struct LibWin32::INetRasConnectionIpUiInfo
  def query_interface(this : INetRasConnectionIpUiInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetRasConnectionIpUiInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetRasConnectionIpUiInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_ui_info(this : INetRasConnectionIpUiInfo*, pinfo : RASCON_IPUI*) : HRESULT
    @lpVtbl.value.get_ui_info.call(this, pinfo)
  end
end
struct LibWin32::INetCfgComponentSysPrep
  def query_interface(this : INetCfgComponentSysPrep*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : INetCfgComponentSysPrep*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : INetCfgComponentSysPrep*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def save_adapter_parameters(this : INetCfgComponentSysPrep*, pncsp : INetCfgSysPrep, pszwanswersections : LibC::LPWSTR, padapterinstanceguid : Guid*) : HRESULT
    @lpVtbl.value.save_adapter_parameters.call(this, pncsp, pszwanswersections, padapterinstanceguid)
  end
  def restore_adapter_parameters(this : INetCfgComponentSysPrep*, pszwanswerfile : LibC::LPWSTR, pszwanswersection : LibC::LPWSTR, padapterinstanceguid : Guid*) : HRESULT
    @lpVtbl.value.restore_adapter_parameters.call(this, pszwanswerfile, pszwanswersection, padapterinstanceguid)
  end
end
struct LibWin32::IProvisioningDomain
  def query_interface(this : IProvisioningDomain*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProvisioningDomain*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProvisioningDomain*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add(this : IProvisioningDomain*, pszwpathtofolder : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.add.call(this, pszwpathtofolder)
  end
  def query(this : IProvisioningDomain*, pszwdomain : LibC::LPWSTR, pszwlanguage : LibC::LPWSTR, pszwxpathquery : LibC::LPWSTR, nodes : IXMLDOMNodeList*) : HRESULT
    @lpVtbl.value.query.call(this, pszwdomain, pszwlanguage, pszwxpathquery, nodes)
  end
end
struct LibWin32::IProvisioningProfileWireless
  def query_interface(this : IProvisioningProfileWireless*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProvisioningProfileWireless*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProvisioningProfileWireless*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_profile(this : IProvisioningProfileWireless*, bstrxmlwirelessconfigprofile : UInt8*, bstrxmlconnectionconfigprofile : UInt8*, padapterinstanceguid : Guid*, pulstatus : UInt32*) : HRESULT
    @lpVtbl.value.create_profile.call(this, bstrxmlwirelessconfigprofile, bstrxmlconnectionconfigprofile, padapterinstanceguid, pulstatus)
  end
end
