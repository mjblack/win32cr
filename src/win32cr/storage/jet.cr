require "./structured_storage.cr"
require "./../foundation.cr"

module Win32cr::Storage::Jet
  extend self
  alias JET_OSSNAPID = LibC::UIntPtrT
  alias JET_LS = LibC::UIntPtrT
  alias JET_PFNSTATUS = Proc(Win32cr::Storage::StructuredStorage::JET_SESID, UInt32, UInt32, Void*, Int32)

  alias JET_CALLBACK = Proc(Win32cr::Storage::StructuredStorage::JET_SESID, UInt32, Win32cr::Storage::StructuredStorage::JET_TABLEID, UInt32, Void*, Void*, Void*, Win32cr::Storage::StructuredStorage::JET_API_PTR, Int32)

  alias JET_PFNDURABLECOMMITCALLBACK = Proc(Win32cr::Storage::StructuredStorage::JET_INSTANCE, Win32cr::Storage::Jet::JET_COMMIT_ID*, UInt32, Int32)

  alias JET_PFNREALLOC = Proc(Void*, Void*, UInt32, Void*)

  JET_VERSION = 1280_u32
  JET_wszConfigStoreReadControl = "CsReadControl"
  JET_bitConfigStoreReadControlInhibitRead = 1_u32
  JET_bitConfigStoreReadControlDisableAll = 2_u32
  JET_bitConfigStoreReadControlDefault = 0_u32
  JET_wszConfigStoreRelPathSysParamDefault = "SysParamDefault"
  JET_wszConfigStoreRelPathSysParamOverride = "SysParamOverride"
  JET_bitDefragmentBatchStart = 1_u32
  JET_bitDefragmentBatchStop = 2_u32
  JET_bitDefragmentAvailSpaceTreesOnly = 64_u32
  JET_bitDefragmentNoPartialMerges = 128_u32
  JET_bitDefragmentBTree = 256_u32
  JET_cbtypNull = 0_u32
  JET_cbtypFinalize = 1_u32
  JET_cbtypBeforeInsert = 2_u32
  JET_cbtypAfterInsert = 4_u32
  JET_cbtypBeforeReplace = 8_u32
  JET_cbtypAfterReplace = 16_u32
  JET_cbtypBeforeDelete = 32_u32
  JET_cbtypAfterDelete = 64_u32
  JET_cbtypUserDefinedDefaultValue = 128_u32
  JET_cbtypOnlineDefragCompleted = 256_u32
  JET_cbtypFreeCursorLS = 512_u32
  JET_cbtypFreeTableLS = 1024_u32
  JET_bitTableInfoUpdatable = 1_u32
  JET_bitTableInfoBookmark = 2_u32
  JET_bitTableInfoRollback = 4_u32
  JET_bitObjectSystem = 2147483648_u32
  JET_bitObjectTableFixedDDL = 1073741824_u32
  JET_bitObjectTableTemplate = 536870912_u32
  JET_bitObjectTableDerived = 268435456_u32
  JET_bitObjectTableNoFixedVarColumnsInDerivedTables = 67108864_u32
  Cobjectinfocols = 9_u32
  Ccolumninfocols = 14_u32
  Cindexinfocols = 15_u32
  JET_MAX_COMPUTERNAME_LENGTH = 15_u32
  JET_bitDurableCommitCallbackLogUnavailable = 1_u32
  JET_cbBookmarkMost = 256_u32
  JET_cbNameMost = 64_u32
  JET_cbFullNameMost = 255_u32
  JET_cbColumnLVPageOverhead = 82_u32
  JET_cbLVDefaultValueMost = 255_u32
  JET_cbColumnMost = 255_u32
  JET_cbLVColumnMost = 2147483647_u32
  JET_cbKeyMost8KBytePage = 2000_u32
  JET_cbKeyMost4KBytePage = 1000_u32
  JET_cbKeyMost2KBytePage = 500_u32
  JET_cbKeyMostMin = 255_u32
  JET_cbKeyMost = 255_u32
  JET_cbLimitKeyMost = 256_u32
  JET_cbPrimaryKeyMost = 255_u32
  JET_cbSecondaryKeyMost = 255_u32
  JET_ccolKeyMost = 16_u32
  JET_ccolMost = 65248_u32
  JET_ccolFixedMost = 127_u32
  JET_ccolVarMost = 128_u32
  JET_EventLoggingDisable = 0_u32
  JET_EventLoggingLevelMin = 1_u32
  JET_EventLoggingLevelLow = 25_u32
  JET_EventLoggingLevelMedium = 50_u32
  JET_EventLoggingLevelHigh = 75_u32
  JET_EventLoggingLevelMax = 100_u32
  JET_IOPriorityNormal = 0_u32
  JET_IOPriorityLow = 1_u32
  JET_configDefault = 1_u32
  JET_configRemoveQuotas = 2_u32
  JET_configLowDiskFootprint = 4_u32
  JET_configMediumDiskFootprint = 8_u32
  JET_configLowMemory = 16_u32
  JET_configDynamicMediumMemory = 32_u32
  JET_configLowPower = 64_u32
  JET_configSSDProfileIO = 128_u32
  JET_configRunSilent = 256_u32
  JET_configUnthrottledMemory = 512_u32
  JET_configHighConcurrencyScaling = 1024_u32
  JET_paramSystemPath = 0_u32
  JET_paramTempPath = 1_u32
  JET_paramLogFilePath = 2_u32
  JET_paramBaseName = 3_u32
  JET_paramEventSource = 4_u32
  JET_paramMaxSessions = 5_u32
  JET_paramMaxOpenTables = 6_u32
  JET_paramPreferredMaxOpenTables = 7_u32
  JET_paramCachedClosedTables = 125_u32
  JET_paramMaxCursors = 8_u32
  JET_paramMaxVerPages = 9_u32
  JET_paramPreferredVerPages = 63_u32
  JET_paramGlobalMinVerPages = 81_u32
  JET_paramVersionStoreTaskQueueMax = 105_u32
  JET_paramMaxTemporaryTables = 10_u32
  JET_paramLogFileSize = 11_u32
  JET_paramLogBuffers = 12_u32
  JET_paramWaitLogFlush = 13_u32
  JET_paramLogCheckpointPeriod = 14_u32
  JET_paramLogWaitingUserMax = 15_u32
  JET_paramCommitDefault = 16_u32
  JET_paramCircularLog = 17_u32
  JET_paramDbExtensionSize = 18_u32
  JET_paramPageTempDBMin = 19_u32
  JET_paramPageFragment = 20_u32
  JET_paramEnableFileCache = 126_u32
  JET_paramVerPageSize = 128_u32
  JET_paramConfiguration = 129_u32
  JET_paramEnableAdvanced = 130_u32
  JET_paramMaxColtyp = 131_u32
  JET_paramBatchIOBufferMax = 22_u32
  JET_paramCacheSize = 41_u32
  JET_paramCacheSizeMin = 60_u32
  JET_paramCacheSizeMax = 23_u32
  JET_paramCheckpointDepthMax = 24_u32
  JET_paramLRUKCorrInterval = 25_u32
  JET_paramLRUKHistoryMax = 26_u32
  JET_paramLRUKPolicy = 27_u32
  JET_paramLRUKTimeout = 28_u32
  JET_paramLRUKTrxCorrInterval = 29_u32
  JET_paramOutstandingIOMax = 30_u32
  JET_paramStartFlushThreshold = 31_u32
  JET_paramStopFlushThreshold = 32_u32
  JET_paramEnableViewCache = 127_u32
  JET_paramCheckpointIOMax = 135_u32
  JET_paramTableClass1Name = 137_u32
  JET_paramTableClass2Name = 138_u32
  JET_paramTableClass3Name = 139_u32
  JET_paramTableClass4Name = 140_u32
  JET_paramTableClass5Name = 141_u32
  JET_paramTableClass6Name = 142_u32
  JET_paramTableClass7Name = 143_u32
  JET_paramTableClass8Name = 144_u32
  JET_paramTableClass9Name = 145_u32
  JET_paramTableClass10Name = 146_u32
  JET_paramTableClass11Name = 147_u32
  JET_paramTableClass12Name = 148_u32
  JET_paramTableClass13Name = 149_u32
  JET_paramTableClass14Name = 150_u32
  JET_paramTableClass15Name = 151_u32
  JET_paramIOPriority = 152_u32
  JET_paramRecovery = 34_u32
  JET_paramEnableOnlineDefrag = 35_u32
  JET_paramCheckFormatWhenOpenFail = 44_u32
  JET_paramEnableTempTableVersioning = 46_u32
  JET_paramIgnoreLogVersion = 47_u32
  JET_paramDeleteOldLogs = 48_u32
  JET_paramEventSourceKey = 49_u32
  JET_paramNoInformationEvent = 50_u32
  JET_paramEventLoggingLevel = 51_u32
  JET_paramDeleteOutOfRangeLogs = 52_u32
  JET_paramAccessDeniedRetryPeriod = 53_u32
  JET_paramEnableIndexChecking = 45_u32
  JET_paramEnableIndexCleanup = 54_u32
  JET_paramDatabasePageSize = 64_u32
  JET_paramDisableCallbacks = 65_u32
  JET_paramLogFileCreateAsynch = 69_u32
  JET_paramErrorToString = 70_u32
  JET_paramZeroDatabaseDuringBackup = 71_u32
  JET_paramUnicodeIndexDefault = 72_u32
  JET_paramRuntimeCallback = 73_u32
  JET_paramCleanupMismatchedLogFiles = 77_u32
  JET_paramRecordUpgradeDirtyLevel = 78_u32
  JET_paramOSSnapshotTimeout = 82_u32
  JET_paramExceptionAction = 98_u32
  JET_paramEventLogCache = 99_u32
  JET_paramCreatePathIfNotExist = 100_u32
  JET_paramPageHintCacheSize = 101_u32
  JET_paramOneDatabasePerSession = 102_u32
  JET_paramMaxInstances = 104_u32
  JET_paramDisablePerfmon = 107_u32
  JET_paramIndexTuplesLengthMin = 110_u32
  JET_paramIndexTuplesLengthMax = 111_u32
  JET_paramIndexTuplesToIndexMax = 112_u32
  JET_paramAlternateDatabaseRecoveryPath = 113_u32
  JET_paramIndexTupleIncrement = 132_u32
  JET_paramIndexTupleStart = 133_u32
  JET_paramKeyMost = 134_u32
  JET_paramLegacyFileNames = 136_u32
  JET_paramEnablePersistedCallbacks = 156_u32
  JET_paramWaypointLatency = 153_u32
  JET_paramDefragmentSequentialBTrees = 160_u32
  JET_paramDefragmentSequentialBTreesDensityCheckFrequency = 161_u32
  JET_paramIOThrottlingTimeQuanta = 162_u32
  JET_paramLVChunkSizeMost = 163_u32
  JET_paramMaxCoalesceReadSize = 164_u32
  JET_paramMaxCoalesceWriteSize = 165_u32
  JET_paramMaxCoalesceReadGapSize = 166_u32
  JET_paramMaxCoalesceWriteGapSize = 167_u32
  JET_paramEnableDBScanInRecovery = 169_u32
  JET_paramDbScanThrottle = 170_u32
  JET_paramDbScanIntervalMinSec = 171_u32
  JET_paramDbScanIntervalMaxSec = 172_u32
  JET_paramCachePriority = 177_u32
  JET_paramMaxTransactionSize = 178_u32
  JET_paramPrereadIOMax = 179_u32
  JET_paramEnableDBScanSerialization = 180_u32
  JET_paramHungIOThreshold = 181_u32
  JET_paramHungIOActions = 182_u32
  JET_paramMinDataForXpress = 183_u32
  JET_paramEnableShrinkDatabase = 184_u32
  JET_paramProcessFriendlyName = 186_u32
  JET_paramDurableCommitCallback = 187_u32
  JET_paramEnableSqm = 188_u32
  JET_paramConfigStoreSpec = 189_u32
  JET_paramUseFlushForWriteDurability = 214_u32
  JET_paramEnableRBS = 215_u32
  JET_paramRBSFilePath = 216_u32
  JET_paramMaxValueInvalid = 217_u32
  JET_sesparamCommitDefault = 4097_u32
  JET_sesparamTransactionLevel = 4099_u32
  JET_sesparamOperationContext = 4100_u32
  JET_sesparamCorrelationID = 4101_u32
  JET_sesparamMaxValueInvalid = 4110_u32
  JET_bitESE98FileNames = 1_u32
  JET_bitEightDotThreeSoftCompat = 2_u32
  JET_bitHungIOEvent = 1_u32
  JET_bitShrinkDatabaseOff = 0_u32
  JET_bitShrinkDatabaseOn = 1_u32
  JET_bitShrinkDatabaseRealtime = 2_u32
  JET_bitShrinkDatabaseTrim = 1_u32
  JET_bitReplayIgnoreMissingDB = 4_u32
  JET_bitRecoveryWithoutUndo = 8_u32
  JET_bitTruncateLogsAfterRecovery = 16_u32
  JET_bitReplayMissingMapEntryDB = 32_u32
  JET_bitLogStreamMustExist = 64_u32
  JET_bitReplayIgnoreLostLogs = 128_u32
  JET_bitKeepDbAttachedAtEndOfRecovery = 4096_u32
  JET_bitTermComplete = 1_u32
  JET_bitTermAbrupt = 2_u32
  JET_bitTermStopBackup = 4_u32
  JET_bitTermDirty = 8_u32
  JET_bitIdleFlushBuffers = 1_u32
  JET_bitIdleCompact = 2_u32
  JET_bitIdleStatus = 4_u32
  JET_bitDbReadOnly = 1_u32
  JET_bitDbExclusive = 2_u32
  JET_bitDbDeleteCorruptIndexes = 16_u32
  JET_bitDbDeleteUnicodeIndexes = 1024_u32
  JET_bitDbUpgrade = 512_u32
  JET_bitDbEnableBackgroundMaintenance = 2048_u32
  JET_bitDbPurgeCacheOnAttach = 4096_u32
  JET_bitForceDetach = 1_u32
  JET_bitDbRecoveryOff = 8_u32
  JET_bitDbShadowingOff = 128_u32
  JET_bitDbOverwriteExisting = 512_u32
  JET_bitBackupIncremental = 1_u32
  JET_bitBackupAtomic = 4_u32
  JET_bitBackupSnapshot = 16_u32
  JET_bitBackupEndNormal = 1_u32
  JET_bitBackupEndAbort = 2_u32
  JET_bitBackupTruncateDone = 256_u32
  JET_bitTableCreateFixedDDL = 1_u32
  JET_bitTableCreateTemplateTable = 2_u32
  JET_bitTableCreateNoFixedVarColumnsInDerivedTables = 4_u32
  JET_bitTableCreateImmutableStructure = 8_u32
  JET_bitColumnFixed = 1_u32
  JET_bitColumnTagged = 2_u32
  JET_bitColumnNotNULL = 4_u32
  JET_bitColumnVersion = 8_u32
  JET_bitColumnAutoincrement = 16_u32
  JET_bitColumnUpdatable = 32_u32
  JET_bitColumnTTKey = 64_u32
  JET_bitColumnTTDescending = 128_u32
  JET_bitColumnMultiValued = 1024_u32
  JET_bitColumnEscrowUpdate = 2048_u32
  JET_bitColumnUnversioned = 4096_u32
  JET_bitColumnMaybeNull = 8192_u32
  JET_bitColumnFinalize = 16384_u32
  JET_bitColumnUserDefinedDefault = 32768_u32
  JET_bitColumnDeleteOnZero = 131072_u32
  JET_bitColumnCompressed = 524288_u32
  JET_bitDeleteColumnIgnoreTemplateColumns = 1_u32
  JET_bitMoveFirst = 0_u32
  JET_bitNoMove = 2_u32
  JET_bitNewKey = 1_u32
  JET_bitStrLimit = 2_u32
  JET_bitSubStrLimit = 4_u32
  JET_bitNormalizedKey = 8_u32
  JET_bitKeyDataZeroLength = 16_u32
  JET_bitFullColumnStartLimit = 256_u32
  JET_bitFullColumnEndLimit = 512_u32
  JET_bitPartialColumnStartLimit = 1024_u32
  JET_bitPartialColumnEndLimit = 2048_u32
  JET_bitRangeInclusive = 1_u32
  JET_bitRangeUpperLimit = 2_u32
  JET_bitRangeInstantDuration = 4_u32
  JET_bitRangeRemove = 8_u32
  JET_bitReadLock = 1_u32
  JET_bitWriteLock = 2_u32
  JET_MoveFirst = 2147483648_u32
  JET_MovePrevious = -1_i32
  JET_MoveLast = 2147483647_u32
  JET_bitMoveKeyNE = 1_u32
  JET_bitSeekEQ = 1_u32
  JET_bitSeekLT = 2_u32
  JET_bitSeekLE = 4_u32
  JET_bitSeekGE = 8_u32
  JET_bitSeekGT = 16_u32
  JET_bitSetIndexRange = 32_u32
  JET_bitCheckUniqueness = 64_u32
  JET_bitBookmarkPermitVirtualCurrency = 1_u32
  JET_bitIndexColumnMustBeNull = 1_u32
  JET_bitIndexColumnMustBeNonNull = 2_u32
  JET_bitRecordInIndex = 1_u32
  JET_bitRecordNotInIndex = 2_u32
  JET_bitIndexUnique = 1_u32
  JET_bitIndexPrimary = 2_u32
  JET_bitIndexDisallowNull = 4_u32
  JET_bitIndexIgnoreNull = 8_u32
  JET_bitIndexIgnoreAnyNull = 32_u32
  JET_bitIndexIgnoreFirstNull = 64_u32
  JET_bitIndexLazyFlush = 128_u32
  JET_bitIndexEmpty = 256_u32
  JET_bitIndexUnversioned = 512_u32
  JET_bitIndexSortNullsHigh = 1024_u32
  JET_bitIndexUnicode = 2048_u32
  JET_bitIndexTuples = 4096_u32
  JET_bitIndexTupleLimits = 8192_u32
  JET_bitIndexCrossProduct = 16384_u32
  JET_bitIndexKeyMost = 32768_u32
  JET_bitIndexDisallowTruncation = 65536_u32
  JET_bitIndexNestedTable = 131072_u32
  JET_bitIndexDotNetGuid = 262144_u32
  JET_bitIndexImmutableStructure = 524288_u32
  JET_bitKeyAscending = 0_u32
  JET_bitKeyDescending = 1_u32
  JET_bitTableDenyWrite = 1_u32
  JET_bitTableDenyRead = 2_u32
  JET_bitTableReadOnly = 4_u32
  JET_bitTableUpdatable = 8_u32
  JET_bitTablePermitDDL = 16_u32
  JET_bitTableNoCache = 32_u32
  JET_bitTablePreread = 64_u32
  JET_bitTableOpportuneRead = 128_u32
  JET_bitTableSequential = 32768_u32
  JET_bitTableClassMask = 2031616_u32
  JET_bitTableClassNone = 0_u32
  JET_bitTableClass1 = 65536_u32
  JET_bitTableClass2 = 131072_u32
  JET_bitTableClass3 = 196608_u32
  JET_bitTableClass4 = 262144_u32
  JET_bitTableClass5 = 327680_u32
  JET_bitTableClass6 = 393216_u32
  JET_bitTableClass7 = 458752_u32
  JET_bitTableClass8 = 524288_u32
  JET_bitTableClass9 = 589824_u32
  JET_bitTableClass10 = 655360_u32
  JET_bitTableClass11 = 720896_u32
  JET_bitTableClass12 = 786432_u32
  JET_bitTableClass13 = 851968_u32
  JET_bitTableClass14 = 917504_u32
  JET_bitTableClass15 = 983040_u32
  JET_bitLSReset = 1_u32
  JET_bitLSCursor = 2_u32
  JET_bitLSTable = 4_u32
  JET_bitPrereadForward = 1_u32
  JET_bitPrereadBackward = 2_u32
  JET_bitPrereadFirstPage = 4_u32
  JET_bitPrereadNormalizedKey = 8_u32
  JET_bitTTIndexed = 1_u32
  JET_bitTTUnique = 2_u32
  JET_bitTTUpdatable = 4_u32
  JET_bitTTScrollable = 8_u32
  JET_bitTTSortNullsHigh = 16_u32
  JET_bitTTForceMaterialization = 32_u32
  JET_bitTTErrorOnDuplicateInsertion = 32_u32
  JET_bitTTForwardOnly = 64_u32
  JET_bitTTIntrinsicLVsOnly = 128_u32
  JET_bitTTDotNetGuid = 256_u32
  JET_bitSetAppendLV = 1_u32
  JET_bitSetOverwriteLV = 4_u32
  JET_bitSetSizeLV = 8_u32
  JET_bitSetZeroLength = 32_u32
  JET_bitSetSeparateLV = 64_u32
  JET_bitSetUniqueMultiValues = 128_u32
  JET_bitSetUniqueNormalizedMultiValues = 256_u32
  JET_bitSetRevertToDefaultValue = 512_u32
  JET_bitSetIntrinsicLV = 1024_u32
  JET_bitSetUncompressed = 65536_u32
  JET_bitSetCompressed = 131072_u32
  JET_bitSetContiguousLV = 262144_u32
  JET_bitSpaceHintsUtilizeParentSpace = 1_u32
  JET_bitCreateHintAppendSequential = 2_u32
  JET_bitCreateHintHotpointSequential = 4_u32
  JET_bitRetrieveHintReserve1 = 8_u32
  JET_bitRetrieveHintTableScanForward = 16_u32
  JET_bitRetrieveHintTableScanBackward = 32_u32
  JET_bitRetrieveHintReserve2 = 64_u32
  JET_bitRetrieveHintReserve3 = 128_u32
  JET_bitDeleteHintTableSequential = 256_u32
  JET_prepInsert = 0_u32
  JET_prepReplace = 2_u32
  JET_prepCancel = 3_u32
  JET_prepReplaceNoLock = 4_u32
  JET_prepInsertCopy = 5_u32
  JET_prepInsertCopyDeleteOriginal = 7_u32
  JET_prepInsertCopyReplaceOriginal = 9_u32
  JET_sqmDisable = 0_u32
  JET_sqmEnable = 1_u32
  JET_sqmFromCEIP = 2_u32
  JET_bitUpdateCheckESE97Compatibility = 1_u32
  JET_bitEscrowNoRollback = 1_u32
  JET_bitRetrieveCopy = 1_u32
  JET_bitRetrieveFromIndex = 2_u32
  JET_bitRetrieveFromPrimaryBookmark = 4_u32
  JET_bitRetrieveTag = 8_u32
  JET_bitRetrieveNull = 16_u32
  JET_bitRetrieveIgnoreDefault = 32_u32
  JET_bitRetrieveTuple = 2048_u32
  JET_bitZeroLength = 1_u32
  JET_bitEnumerateCopy = 1_u32
  JET_bitEnumerateIgnoreDefault = 32_u32
  JET_bitEnumeratePresenceOnly = 131072_u32
  JET_bitEnumerateTaggedOnly = 262144_u32
  JET_bitEnumerateCompressOutput = 524288_u32
  JET_bitEnumerateIgnoreUserDefinedDefault = 1048576_u32
  JET_bitEnumerateInRecordOnly = 2097152_u32
  JET_bitRecordSizeInCopyBuffer = 1_u32
  JET_bitRecordSizeRunningTotal = 2_u32
  JET_bitRecordSizeLocal = 4_u32
  JET_bitTransactionReadOnly = 1_u32
  JET_bitCommitLazyFlush = 1_u32
  JET_bitWaitLastLevel0Commit = 2_u32
  JET_bitWaitAllLevel0Commit = 8_u32
  JET_bitForceNewLog = 16_u32
  JET_bitRollbackAll = 1_u32
  JET_bitIncrementalSnapshot = 1_u32
  JET_bitCopySnapshot = 2_u32
  JET_bitContinueAfterThaw = 4_u32
  JET_bitExplicitPrepare = 8_u32
  JET_bitAllDatabasesSnapshot = 1_u32
  JET_bitAbortSnapshot = 1_u32
  JET_DbInfoFilename = 0_u32
  JET_DbInfoConnect = 1_u32
  JET_DbInfoCountry = 2_u32
  JET_DbInfoLCID = 3_u32
  JET_DbInfoLangid = 3_u32
  JET_DbInfoCp = 4_u32
  JET_DbInfoCollate = 5_u32
  JET_DbInfoOptions = 6_u32
  JET_DbInfoTransactions = 7_u32
  JET_DbInfoVersion = 8_u32
  JET_DbInfoIsam = 9_u32
  JET_DbInfoFilesize = 10_u32
  JET_DbInfoSpaceOwned = 11_u32
  JET_DbInfoSpaceAvailable = 12_u32
  JET_DbInfoUpgrade = 13_u32
  JET_DbInfoMisc = 14_u32
  JET_DbInfoDBInUse = 15_u32
  JET_DbInfoPageSize = 17_u32
  JET_DbInfoFileType = 19_u32
  JET_DbInfoFilesizeOnDisk = 21_u32
  JET_dbstateJustCreated = 1_u32
  JET_dbstateDirtyShutdown = 2_u32
  JET_dbstateCleanShutdown = 3_u32
  JET_dbstateBeingConverted = 4_u32
  JET_dbstateForceDetach = 5_u32
  JET_filetypeUnknown = 0_u32
  JET_filetypeDatabase = 1_u32
  JET_filetypeLog = 3_u32
  JET_filetypeCheckpoint = 4_u32
  JET_filetypeTempDatabase = 5_u32
  JET_filetypeFlushMap = 7_u32
  JET_revertstateNone = 0_u32
  JET_revertstateInProgress = 1_u32
  JET_revertstateCopingLogs = 2_u32
  JET_revertstateCompleted = 3_u32
  JET_bitDeleteAllExistingLogs = 1_u32
  JET_coltypNil = 0_u32
  JET_coltypBit = 1_u32
  JET_coltypUnsignedByte = 2_u32
  JET_coltypShort = 3_u32
  JET_coltypLong = 4_u32
  JET_coltypCurrency = 5_u32
  JET_coltypIEEESingle = 6_u32
  JET_coltypIEEEDouble = 7_u32
  JET_coltypDateTime = 8_u32
  JET_coltypBinary = 9_u32
  JET_coltypText = 10_u32
  JET_coltypLongBinary = 11_u32
  JET_coltypLongText = 12_u32
  JET_coltypMax = 13_u32
  JET_coltypSLV = 13_u32
  JET_coltypUnsignedLong = 14_u32
  JET_coltypLongLong = 15_u32
  JET_coltypGUID = 16_u32
  JET_coltypUnsignedShort = 17_u32
  JET_coltypUnsignedLongLong = 18_u32
  JET_ColInfoGrbitNonDerivedColumnsOnly = 2147483648_u32
  JET_ColInfoGrbitMinimalInfo = 1073741824_u32
  JET_ColInfoGrbitSortByColumnid = 536870912_u32
  JET_objtypNil = 0_u32
  JET_objtypTable = 1_u32
  JET_bitCompactStats = 32_u32
  JET_bitCompactRepair = 64_u32
  JET_snpRepair = 2_u32
  JET_snpCompact = 4_u32
  JET_snpRestore = 8_u32
  JET_snpBackup = 9_u32
  JET_snpUpgrade = 10_u32
  JET_snpScrub = 11_u32
  JET_snpUpgradeRecordFormat = 12_u32
  JET_sntBegin = 5_u32
  JET_sntRequirements = 7_u32
  JET_sntProgress = 0_u32
  JET_sntComplete = 6_u32
  JET_sntFail = 3_u32
  JET_ExceptionMsgBox = 1_u32
  JET_ExceptionNone = 2_u32
  JET_ExceptionFailFast = 4_u32
  JET_OnlineDefragDisable = 0_u32
  JET_OnlineDefragAllOBSOLETE = 1_u32
  JET_OnlineDefragDatabases = 2_u32
  JET_OnlineDefragSpaceTrees = 4_u32
  JET_OnlineDefragAll = 65535_u32
  JET_bitResizeDatabaseOnlyGrow = 1_u32
  JET_bitResizeDatabaseOnlyShrink = 2_u32
  JET_bitStopServiceAll = 0_u32
  JET_bitStopServiceBackgroundUserTasks = 2_u32
  JET_bitStopServiceQuiesceCaches = 4_u32
  JET_bitStopServiceResume = 2147483648_u32
  JET_errSuccess = 0_u32
  JET_wrnNyi = -1_i32
  JET_errRfsFailure = -100_i32
  JET_errRfsNotArmed = -101_i32
  JET_errFileClose = -102_i32
  JET_errOutOfThreads = -103_i32
  JET_errTooManyIO = -105_i32
  JET_errTaskDropped = -106_i32
  JET_errInternalError = -107_i32
  JET_errDisabledFunctionality = -112_i32
  JET_errUnloadableOSFunctionality = -113_i32
  JET_errDatabaseBufferDependenciesCorrupted = -255_i32
  JET_wrnRemainingVersions = 321_u32
  JET_errPreviousVersion = -322_i32
  JET_errPageBoundary = -323_i32
  JET_errKeyBoundary = -324_i32
  JET_errBadPageLink = -327_i32
  JET_errBadBookmark = -328_i32
  JET_errNTSystemCallFailed = -334_i32
  JET_errBadParentPageLink = -338_i32
  JET_errSPAvailExtCacheOutOfSync = -340_i32
  JET_errSPAvailExtCorrupted = -341_i32
  JET_errSPAvailExtCacheOutOfMemory = -342_i32
  JET_errSPOwnExtCorrupted = -343_i32
  JET_errDbTimeCorrupted = -344_i32
  JET_wrnUniqueKey = 345_u32
  JET_errKeyTruncated = -346_i32
  JET_errDatabaseLeakInSpace = -348_i32
  JET_errBadEmptyPage = -351_i32
  Wrnbtnotvisiblerejected = 352_u32
  Wrnbtnotvisibleaccumulated = 353_u32
  JET_errBadLineCount = -354_i32
  JET_errPageTagCorrupted = -357_i32
  JET_errNodeCorrupted = -358_i32
  JET_wrnSeparateLongValue = 406_u32
  JET_errKeyTooBig = -408_i32
  JET_errCannotSeparateIntrinsicLV = -416_i32
  JET_errSeparatedLongValue = -421_i32
  JET_errMustBeSeparateLongValue = -423_i32
  JET_errInvalidPreread = -424_i32
  JET_errInvalidLoggedOperation = -500_i32
  JET_errLogFileCorrupt = -501_i32
  JET_errNoBackupDirectory = -503_i32
  JET_errBackupDirectoryNotEmpty = -504_i32
  JET_errBackupInProgress = -505_i32
  JET_errRestoreInProgress = -506_i32
  JET_errMissingPreviousLogFile = -509_i32
  JET_errLogWriteFail = -510_i32
  JET_errLogDisabledDueToRecoveryFailure = -511_i32
  JET_errCannotLogDuringRecoveryRedo = -512_i32
  JET_errLogGenerationMismatch = -513_i32
  JET_errBadLogVersion = -514_i32
  JET_errInvalidLogSequence = -515_i32
  JET_errLoggingDisabled = -516_i32
  JET_errLogBufferTooSmall = -517_i32
  JET_errLogSequenceEnd = -519_i32
  JET_errNoBackup = -520_i32
  JET_errInvalidBackupSequence = -521_i32
  JET_errBackupNotAllowedYet = -523_i32
  JET_errDeleteBackupFileFail = -524_i32
  JET_errMakeBackupDirectoryFail = -525_i32
  JET_errInvalidBackup = -526_i32
  JET_errRecoveredWithErrors = -527_i32
  JET_errMissingLogFile = -528_i32
  JET_errLogDiskFull = -529_i32
  JET_errBadLogSignature = -530_i32
  JET_errBadDbSignature = -531_i32
  JET_errBadCheckpointSignature = -532_i32
  JET_errCheckpointCorrupt = -533_i32
  JET_errMissingPatchPage = -534_i32
  JET_errBadPatchPage = -535_i32
  JET_errRedoAbruptEnded = -536_i32
  JET_errPatchFileMissing = -538_i32
  JET_errDatabaseLogSetMismatch = -539_i32
  JET_errDatabaseStreamingFileMismatch = -540_i32
  JET_errLogFileSizeMismatch = -541_i32
  JET_errCheckpointFileNotFound = -542_i32
  JET_errRequiredLogFilesMissing = -543_i32
  JET_errSoftRecoveryOnBackupDatabase = -544_i32
  JET_errLogFileSizeMismatchDatabasesConsistent = -545_i32
  JET_errLogSectorSizeMismatch = -546_i32
  JET_errLogSectorSizeMismatchDatabasesConsistent = -547_i32
  JET_errLogSequenceEndDatabasesConsistent = -548_i32
  JET_errStreamingDataNotLogged = -549_i32
  JET_errDatabaseDirtyShutdown = -550_i32
  JET_errDatabaseInconsistent = -550_i32
  JET_errConsistentTimeMismatch = -551_i32
  JET_errDatabasePatchFileMismatch = -552_i32
  JET_errEndingRestoreLogTooLow = -553_i32
  JET_errStartingRestoreLogTooHigh = -554_i32
  JET_errGivenLogFileHasBadSignature = -555_i32
  JET_errGivenLogFileIsNotContiguous = -556_i32
  JET_errMissingRestoreLogFiles = -557_i32
  JET_wrnExistingLogFileHasBadSignature = 558_u32
  JET_wrnExistingLogFileIsNotContiguous = 559_u32
  JET_errMissingFullBackup = -560_i32
  JET_errBadBackupDatabaseSize = -561_i32
  JET_errDatabaseAlreadyUpgraded = -562_i32
  JET_errDatabaseIncompleteUpgrade = -563_i32
  JET_wrnSkipThisRecord = 564_u32
  JET_errMissingCurrentLogFiles = -565_i32
  JET_errDbTimeTooOld = -566_i32
  JET_errDbTimeTooNew = -567_i32
  JET_errMissingFileToBackup = -569_i32
  JET_errLogTornWriteDuringHardRestore = -570_i32
  JET_errLogTornWriteDuringHardRecovery = -571_i32
  JET_errLogCorruptDuringHardRestore = -573_i32
  JET_errLogCorruptDuringHardRecovery = -574_i32
  JET_errMustDisableLoggingForDbUpgrade = -575_i32
  JET_errBadRestoreTargetInstance = -577_i32
  JET_wrnTargetInstanceRunning = 578_u32
  JET_errRecoveredWithoutUndo = -579_i32
  JET_errDatabasesNotFromSameSnapshot = -580_i32
  JET_errSoftRecoveryOnSnapshot = -581_i32
  JET_errCommittedLogFilesMissing = -582_i32
  JET_errSectorSizeNotSupported = -583_i32
  JET_errRecoveredWithoutUndoDatabasesConsistent = -584_i32
  JET_wrnCommittedLogFilesLost = 585_u32
  JET_errCommittedLogFileCorrupt = -586_i32
  JET_wrnCommittedLogFilesRemoved = 587_u32
  JET_wrnFinishWithUndo = 588_u32
  JET_errLogSequenceChecksumMismatch = -590_i32
  JET_wrnDatabaseRepaired = 595_u32
  JET_errPageInitializedMismatch = -596_i32
  JET_errUnicodeTranslationBufferTooSmall = -601_i32
  JET_errUnicodeTranslationFail = -602_i32
  JET_errUnicodeNormalizationNotSupported = -603_i32
  JET_errUnicodeLanguageValidationFailure = -604_i32
  JET_errExistingLogFileHasBadSignature = -610_i32
  JET_errExistingLogFileIsNotContiguous = -611_i32
  JET_errLogReadVerifyFailure = -612_i32
  JET_errCheckpointDepthTooDeep = -614_i32
  JET_errRestoreOfNonBackupDatabase = -615_i32
  JET_errLogFileNotCopied = -616_i32
  JET_errTransactionTooLong = -618_i32
  JET_errEngineFormatVersionNoLongerSupportedTooLow = -619_i32
  JET_errEngineFormatVersionNotYetImplementedTooHigh = -620_i32
  JET_errEngineFormatVersionParamTooLowForRequestedFeature = -621_i32
  JET_errEngineFormatVersionSpecifiedTooLowForLogVersion = -622_i32
  JET_errEngineFormatVersionSpecifiedTooLowForDatabaseVersion = -623_i32
  JET_errBackupAbortByServer = -801_i32
  JET_errInvalidGrbit = -900_i32
  JET_errTermInProgress = -1000_i32
  JET_errFeatureNotAvailable = -1001_i32
  JET_errInvalidName = -1002_i32
  JET_errInvalidParameter = -1003_i32
  JET_wrnColumnNull = 1004_u32
  JET_wrnBufferTruncated = 1006_u32
  JET_wrnDatabaseAttached = 1007_u32
  JET_errDatabaseFileReadOnly = -1008_i32
  JET_wrnSortOverflow = 1009_u32
  JET_errInvalidDatabaseId = -1010_i32
  JET_errOutOfMemory = -1011_i32
  JET_errOutOfDatabaseSpace = -1012_i32
  JET_errOutOfCursors = -1013_i32
  JET_errOutOfBuffers = -1014_i32
  JET_errTooManyIndexes = -1015_i32
  JET_errTooManyKeys = -1016_i32
  JET_errRecordDeleted = -1017_i32
  JET_errReadVerifyFailure = -1018_i32
  JET_errPageNotInitialized = -1019_i32
  JET_errOutOfFileHandles = -1020_i32
  JET_errDiskReadVerificationFailure = -1021_i32
  JET_errDiskIO = -1022_i32
  JET_errInvalidPath = -1023_i32
  JET_errInvalidSystemPath = -1024_i32
  JET_errInvalidLogDirectory = -1025_i32
  JET_errRecordTooBig = -1026_i32
  JET_errTooManyOpenDatabases = -1027_i32
  JET_errInvalidDatabase = -1028_i32
  JET_errNotInitialized = -1029_i32
  JET_errAlreadyInitialized = -1030_i32
  JET_errInitInProgress = -1031_i32
  JET_errFileAccessDenied = -1032_i32
  JET_errBufferTooSmall = -1038_i32
  JET_wrnSeekNotEqual = 1039_u32
  JET_errTooManyColumns = -1040_i32
  JET_errContainerNotEmpty = -1043_i32
  JET_errInvalidFilename = -1044_i32
  JET_errInvalidBookmark = -1045_i32
  JET_errColumnInUse = -1046_i32
  JET_errInvalidBufferSize = -1047_i32
  JET_errColumnNotUpdatable = -1048_i32
  JET_errIndexInUse = -1051_i32
  JET_errLinkNotSupported = -1052_i32
  JET_errNullKeyDisallowed = -1053_i32
  JET_errNotInTransaction = -1054_i32
  JET_wrnNoErrorInfo = 1055_u32
  JET_errMustRollback = -1057_i32
  JET_wrnNoIdleActivity = 1058_u32
  JET_errTooManyActiveUsers = -1059_i32
  JET_errInvalidCountry = -1061_i32
  JET_errInvalidLanguageId = -1062_i32
  JET_errInvalidCodePage = -1063_i32
  JET_errInvalidLCMapStringFlags = -1064_i32
  JET_errVersionStoreEntryTooBig = -1065_i32
  JET_errVersionStoreOutOfMemoryAndCleanupTimedOut = -1066_i32
  JET_wrnNoWriteLock = 1067_u32
  JET_wrnColumnSetNull = 1068_u32
  JET_errVersionStoreOutOfMemory = -1069_i32
  JET_errCannotIndex = -1071_i32
  JET_errRecordNotDeleted = -1072_i32
  JET_errTooManyMempoolEntries = -1073_i32
  JET_errOutOfObjectIDs = -1074_i32
  JET_errOutOfLongValueIDs = -1075_i32
  JET_errOutOfAutoincrementValues = -1076_i32
  JET_errOutOfDbtimeValues = -1077_i32
  JET_errOutOfSequentialIndexValues = -1078_i32
  JET_errRunningInOneInstanceMode = -1080_i32
  JET_errRunningInMultiInstanceMode = -1081_i32
  JET_errSystemParamsAlreadySet = -1082_i32
  JET_errSystemPathInUse = -1083_i32
  JET_errLogFilePathInUse = -1084_i32
  JET_errTempPathInUse = -1085_i32
  JET_errInstanceNameInUse = -1086_i32
  JET_errSystemParameterConflict = -1087_i32
  JET_errInstanceUnavailable = -1090_i32
  JET_errDatabaseUnavailable = -1091_i32
  JET_errInstanceUnavailableDueToFatalLogDiskFull = -1092_i32
  JET_errInvalidSesparamId = -1093_i32
  JET_errTooManyRecords = -1094_i32
  JET_errInvalidDbparamId = -1095_i32
  JET_errOutOfSessions = -1101_i32
  JET_errWriteConflict = -1102_i32
  JET_errTransTooDeep = -1103_i32
  JET_errInvalidSesid = -1104_i32
  JET_errWriteConflictPrimaryIndex = -1105_i32
  JET_errInTransaction = -1108_i32
  JET_errRollbackRequired = -1109_i32
  JET_errTransReadOnly = -1110_i32
  JET_errSessionWriteConflict = -1111_i32
  JET_errRecordTooBigForBackwardCompatibility = -1112_i32
  JET_errCannotMaterializeForwardOnlySort = -1113_i32
  JET_errSesidTableIdMismatch = -1114_i32
  JET_errInvalidInstance = -1115_i32
  JET_errDirtyShutdown = -1116_i32
  JET_errReadPgnoVerifyFailure = -1118_i32
  JET_errReadLostFlushVerifyFailure = -1119_i32
  JET_errFileSystemCorruption = -1121_i32
  JET_wrnShrinkNotPossible = 1122_u32
  JET_errRecoveryVerifyFailure = -1123_i32
  JET_errFilteredMoveNotSupported = -1124_i32
  JET_errDatabaseDuplicate = -1201_i32
  JET_errDatabaseInUse = -1202_i32
  JET_errDatabaseNotFound = -1203_i32
  JET_errDatabaseInvalidName = -1204_i32
  JET_errDatabaseInvalidPages = -1205_i32
  JET_errDatabaseCorrupted = -1206_i32
  JET_errDatabaseLocked = -1207_i32
  JET_errCannotDisableVersioning = -1208_i32
  JET_errInvalidDatabaseVersion = -1209_i32
  JET_errDatabase200Format = -1210_i32
  JET_errDatabase400Format = -1211_i32
  JET_errDatabase500Format = -1212_i32
  JET_errPageSizeMismatch = -1213_i32
  JET_errTooManyInstances = -1214_i32
  JET_errDatabaseSharingViolation = -1215_i32
  JET_errAttachedDatabaseMismatch = -1216_i32
  JET_errDatabaseInvalidPath = -1217_i32
  JET_errDatabaseIdInUse = -1218_i32
  JET_errForceDetachNotAllowed = -1219_i32
  JET_errCatalogCorrupted = -1220_i32
  JET_errPartiallyAttachedDB = -1221_i32
  JET_errDatabaseSignInUse = -1222_i32
  JET_errDatabaseCorruptedNoRepair = -1224_i32
  JET_errInvalidCreateDbVersion = -1225_i32
  JET_errDatabaseNotReady = -1230_i32
  JET_errDatabaseAttachedForRecovery = -1231_i32
  JET_errTransactionsNotReadyDuringRecovery = -1232_i32
  JET_wrnTableEmpty = 1301_u32
  JET_errTableLocked = -1302_i32
  JET_errTableDuplicate = -1303_i32
  JET_errTableInUse = -1304_i32
  JET_errObjectNotFound = -1305_i32
  JET_errDensityInvalid = -1307_i32
  JET_errTableNotEmpty = -1308_i32
  JET_errInvalidTableId = -1310_i32
  JET_errTooManyOpenTables = -1311_i32
  JET_errIllegalOperation = -1312_i32
  JET_errTooManyOpenTablesAndCleanupTimedOut = -1313_i32
  JET_errObjectDuplicate = -1314_i32
  JET_errInvalidObject = -1316_i32
  JET_errCannotDeleteTempTable = -1317_i32
  JET_errCannotDeleteSystemTable = -1318_i32
  JET_errCannotDeleteTemplateTable = -1319_i32
  JET_errExclusiveTableLockRequired = -1322_i32
  JET_errFixedDDL = -1323_i32
  JET_errFixedInheritedDDL = -1324_i32
  JET_errCannotNestDDL = -1325_i32
  JET_errDDLNotInheritable = -1326_i32
  JET_wrnTableInUseBySystem = 1327_u32
  JET_errInvalidSettings = -1328_i32
  JET_errClientRequestToStopJetService = -1329_i32
  JET_errCannotAddFixedVarColumnToDerivedTable = -1330_i32
  JET_errIndexCantBuild = -1401_i32
  JET_errIndexHasPrimary = -1402_i32
  JET_errIndexDuplicate = -1403_i32
  JET_errIndexNotFound = -1404_i32
  JET_errIndexMustStay = -1405_i32
  JET_errIndexInvalidDef = -1406_i32
  JET_errInvalidCreateIndex = -1409_i32
  JET_errTooManyOpenIndexes = -1410_i32
  JET_errMultiValuedIndexViolation = -1411_i32
  JET_errIndexBuildCorrupted = -1412_i32
  JET_errPrimaryIndexCorrupted = -1413_i32
  JET_errSecondaryIndexCorrupted = -1414_i32
  JET_wrnCorruptIndexDeleted = 1415_u32
  JET_errInvalidIndexId = -1416_i32
  JET_wrnPrimaryIndexOutOfDate = 1417_u32
  JET_wrnSecondaryIndexOutOfDate = 1418_u32
  JET_errIndexTuplesSecondaryIndexOnly = -1430_i32
  JET_errIndexTuplesTooManyColumns = -1431_i32
  JET_errIndexTuplesOneColumnOnly = -1431_i32
  JET_errIndexTuplesNonUniqueOnly = -1432_i32
  JET_errIndexTuplesTextBinaryColumnsOnly = -1433_i32
  JET_errIndexTuplesTextColumnsOnly = -1433_i32
  JET_errIndexTuplesVarSegMacNotAllowed = -1434_i32
  JET_errIndexTuplesInvalidLimits = -1435_i32
  JET_errIndexTuplesCannotRetrieveFromIndex = -1436_i32
  JET_errIndexTuplesKeyTooSmall = -1437_i32
  JET_errInvalidLVChunkSize = -1438_i32
  JET_errColumnCannotBeEncrypted = -1439_i32
  JET_errCannotIndexOnEncryptedColumn = -1440_i32
  JET_errColumnLong = -1501_i32
  JET_errColumnNoChunk = -1502_i32
  JET_errColumnDoesNotFit = -1503_i32
  JET_errNullInvalid = -1504_i32
  JET_errColumnIndexed = -1505_i32
  JET_errColumnTooBig = -1506_i32
  JET_errColumnNotFound = -1507_i32
  JET_errColumnDuplicate = -1508_i32
  JET_errMultiValuedColumnMustBeTagged = -1509_i32
  JET_errColumnRedundant = -1510_i32
  JET_errInvalidColumnType = -1511_i32
  JET_wrnColumnMaxTruncated = 1512_u32
  JET_errTaggedNotNULL = -1514_i32
  JET_errNoCurrentIndex = -1515_i32
  JET_errKeyIsMade = -1516_i32
  JET_errBadColumnId = -1517_i32
  JET_errBadItagSequence = -1518_i32
  JET_errColumnInRelationship = -1519_i32
  JET_wrnCopyLongValue = 1520_u32
  JET_errCannotBeTagged = -1521_i32
  JET_errDefaultValueTooBig = -1524_i32
  JET_errMultiValuedDuplicate = -1525_i32
  JET_errLVCorrupted = -1526_i32
  JET_errMultiValuedDuplicateAfterTruncation = -1528_i32
  JET_errDerivedColumnCorruption = -1529_i32
  JET_errInvalidPlaceholderColumn = -1530_i32
  JET_wrnColumnSkipped = 1531_u32
  JET_wrnColumnNotLocal = 1532_u32
  JET_wrnColumnMoreTags = 1533_u32
  JET_wrnColumnTruncated = 1534_u32
  JET_wrnColumnPresent = 1535_u32
  JET_wrnColumnSingleValue = 1536_u32
  JET_wrnColumnDefault = 1537_u32
  JET_errColumnCannotBeCompressed = -1538_i32
  JET_wrnColumnNotInRecord = 1539_u32
  JET_errColumnNoEncryptionKey = -1540_i32
  JET_wrnColumnReference = 1541_u32
  JET_errRecordNotFound = -1601_i32
  JET_errRecordNoCopy = -1602_i32
  JET_errNoCurrentRecord = -1603_i32
  JET_errRecordPrimaryChanged = -1604_i32
  JET_errKeyDuplicate = -1605_i32
  JET_errAlreadyPrepared = -1607_i32
  JET_errKeyNotMade = -1608_i32
  JET_errUpdateNotPrepared = -1609_i32
  JET_wrnDataHasChanged = 1610_u32
  JET_errDataHasChanged = -1611_i32
  JET_wrnKeyChanged = 1618_u32
  JET_errLanguageNotSupported = -1619_i32
  JET_errDecompressionFailed = -1620_i32
  JET_errUpdateMustVersion = -1621_i32
  JET_errDecryptionFailed = -1622_i32
  JET_errEncryptionBadItag = -1623_i32
  JET_errTooManySorts = -1701_i32
  JET_errInvalidOnSort = -1702_i32
  JET_errTempFileOpenError = -1803_i32
  JET_errTooManyAttachedDatabases = -1805_i32
  JET_errDiskFull = -1808_i32
  JET_errPermissionDenied = -1809_i32
  JET_errFileNotFound = -1811_i32
  JET_errFileInvalidType = -1812_i32
  JET_wrnFileOpenReadOnly = 1813_u32
  JET_errFileAlreadyExists = -1814_i32
  JET_errAfterInitialization = -1850_i32
  JET_errLogCorrupted = -1852_i32
  JET_errInvalidOperation = -1906_i32
  JET_errAccessDenied = -1907_i32
  JET_wrnIdleFull = 1908_u32
  JET_errTooManySplits = -1909_i32
  JET_errSessionSharingViolation = -1910_i32
  JET_errEntryPointNotFound = -1911_i32
  JET_errSessionContextAlreadySet = -1912_i32
  JET_errSessionContextNotSetByThisThread = -1913_i32
  JET_errSessionInUse = -1914_i32
  JET_errRecordFormatConversionFailed = -1915_i32
  JET_errOneDatabasePerSession = -1916_i32
  JET_errRollbackError = -1917_i32
  JET_errFlushMapVersionUnsupported = -1918_i32
  JET_errFlushMapDatabaseMismatch = -1919_i32
  JET_errFlushMapUnrecoverable = -1920_i32
  JET_wrnDefragAlreadyRunning = 2000_u32
  JET_wrnDefragNotRunning = 2001_u32
  JET_errDatabaseAlreadyRunningMaintenance = -2004_i32
  JET_wrnCallbackNotRegistered = 2100_u32
  JET_errCallbackFailed = -2101_i32
  JET_errCallbackNotResolved = -2102_i32
  JET_errSpaceHintsInvalid = -2103_i32
  JET_errOSSnapshotInvalidSequence = -2401_i32
  JET_errOSSnapshotTimeOut = -2402_i32
  JET_errOSSnapshotNotAllowed = -2403_i32
  JET_errOSSnapshotInvalidSnapId = -2404_i32
  JET_errLSCallbackNotSpecified = -3000_i32
  JET_errLSAlreadySet = -3001_i32
  JET_errLSNotSet = -3002_i32
  JET_errFileIOSparse = -4000_i32
  JET_errFileIOBeyondEOF = -4001_i32
  JET_errFileIOAbort = -4002_i32
  JET_errFileIORetry = -4003_i32
  JET_errFileIOFail = -4004_i32
  JET_errFileCompressed = -4005_i32
  JET_BASE_NAME_LENGTH = 3_u32
  JET_bitDumpMinimum = 1_u32
  JET_bitDumpMaximum = 2_u32
  JET_bitDumpCacheMinimum = 4_u32
  JET_bitDumpCacheMaximum = 8_u32
  JET_bitDumpCacheIncludeDirtyPages = 16_u32
  JET_bitDumpCacheIncludeCachedPages = 32_u32
  JET_bitDumpCacheIncludeCorruptedPages = 64_u32
  JET_bitDumpCacheNoDecommit = 128_u32

  enum JET_RELOP
    JET_relopEquals = 0_i32
    JET_relopPrefixEquals = 1_i32
    JET_relopNotEquals = 2_i32
    JET_relopLessThanOrEqual = 3_i32
    JET_relopLessThan = 4_i32
    JET_relopGreaterThanOrEqual = 5_i32
    JET_relopGreaterThan = 6_i32
    JET_relopBitmaskEqualsZero = 7_i32
    JET_relopBitmaskNotEqualsZero = 8_i32
  end
  enum JET_ERRCAT
    JET_errcatUnknown = 0_i32
    JET_errcatError = 1_i32
    JET_errcatOperation = 2_i32
    JET_errcatFatal = 3_i32
    JET_errcatIO = 4_i32
    JET_errcatResource = 5_i32
    JET_errcatMemory = 6_i32
    JET_errcatQuota = 7_i32
    JET_errcatDisk = 8_i32
    JET_errcatData = 9_i32
    JET_errcatCorruption = 10_i32
    JET_errcatInconsistent = 11_i32
    JET_errcatFragmentation = 12_i32
    JET_errcatApi = 13_i32
    JET_errcatUsage = 14_i32
    JET_errcatState = 15_i32
    JET_errcatObsolete = 16_i32
    JET_errcatMax = 17_i32
  end
  enum JET_INDEXCHECKING
    JET_IndexCheckingOff = 0_i32
    JET_IndexCheckingOn = 1_i32
    JET_IndexCheckingDeferToOpenTable = 2_i32
    JET_IndexCheckingMax = 3_i32
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_INDEXID
    property cbStruct : UInt32
    property rgbIndexId : UInt8[16]
    def initialize(@cbStruct : UInt32, @rgbIndexId : UInt8[16])
    end
  end
  {% end %}

  @[Extern]
  struct JET_RSTMAP_A
    property szDatabaseName : Win32cr::Foundation::PSTR
    property szNewDatabaseName : Win32cr::Foundation::PSTR
    def initialize(@szDatabaseName : Win32cr::Foundation::PSTR, @szNewDatabaseName : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct JET_RSTMAP_W
    property szDatabaseName : Win32cr::Foundation::PWSTR
    property szNewDatabaseName : Win32cr::Foundation::PWSTR
    def initialize(@szDatabaseName : Win32cr::Foundation::PWSTR, @szNewDatabaseName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct CONVERT_A
    property szOldDll : Win32cr::Foundation::PSTR
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property fFlags : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@fFlags : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@szOldDll : Win32cr::Foundation::PSTR, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CONVERT_W
    property szOldDll : Win32cr::Foundation::PWSTR
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property fFlags : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@fFlags : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@szOldDll : Win32cr::Foundation::PWSTR, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct JET_SNPROG
    property cbStruct : UInt32
    property cunitDone : UInt32
    property cunitTotal : UInt32
    def initialize(@cbStruct : UInt32, @cunitDone : UInt32, @cunitTotal : UInt32)
    end
  end

  @[Extern]
  struct JET_DBINFOUPGRADE
    property cbStruct : UInt32
    property cbFilesizeLow : UInt32
    property cbFilesizeHigh : UInt32
    property cbFreeSpaceRequiredLow : UInt32
    property cbFreeSpaceRequiredHigh : UInt32
    property csecToUpgrade : UInt32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property ulFlags : UInt32
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
      end

    def initialize(@ulFlags : UInt32, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@cbStruct : UInt32, @cbFilesizeLow : UInt32, @cbFilesizeHigh : UInt32, @cbFreeSpaceRequiredLow : UInt32, @cbFreeSpaceRequiredHigh : UInt32, @csecToUpgrade : UInt32, @anonymous : Anonymous_e__Union_)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_OBJECTINFO
    property cbStruct : UInt32
    property objtyp : UInt32
    property dtCreate : Float64
    property dtUpdate : Float64
    property grbit : UInt32
    property flags : UInt32
    property cRecord : UInt32
    property cPage : UInt32
    def initialize(@cbStruct : UInt32, @objtyp : UInt32, @dtCreate : Float64, @dtUpdate : Float64, @grbit : UInt32, @flags : UInt32, @cRecord : UInt32, @cPage : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct JET_OBJECTLIST
    property cbStruct : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cRecord : UInt32
    property columnidcontainername : UInt32
    property columnidobjectname : UInt32
    property columnidobjtyp : UInt32
    property columniddtCreate : UInt32
    property columniddtUpdate : UInt32
    property columnidgrbit : UInt32
    property columnidflags : UInt32
    property columnidcRecord : UInt32
    property columnidcPage : UInt32
    def initialize(@cbStruct : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cRecord : UInt32, @columnidcontainername : UInt32, @columnidobjectname : UInt32, @columnidobjtyp : UInt32, @columniddtCreate : UInt32, @columniddtUpdate : UInt32, @columnidgrbit : UInt32, @columnidflags : UInt32, @columnidcRecord : UInt32, @columnidcPage : UInt32)
    end
  end

  @[Extern]
  struct JET_COLUMNLIST
    property cbStruct : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cRecord : UInt32
    property columnidPresentationOrder : UInt32
    property columnidcolumnname : UInt32
    property columnidcolumnid : UInt32
    property columnidcoltyp : UInt32
    property columnidCountry : UInt32
    property columnidLangid : UInt32
    property columnidCp : UInt32
    property columnidCollate : UInt32
    property columnidcbMax : UInt32
    property columnidgrbit : UInt32
    property columnidDefault : UInt32
    property columnidBaseTableName : UInt32
    property columnidBaseColumnName : UInt32
    property columnidDefinitionName : UInt32
    def initialize(@cbStruct : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cRecord : UInt32, @columnidPresentationOrder : UInt32, @columnidcolumnname : UInt32, @columnidcolumnid : UInt32, @columnidcoltyp : UInt32, @columnidCountry : UInt32, @columnidLangid : UInt32, @columnidCp : UInt32, @columnidCollate : UInt32, @columnidcbMax : UInt32, @columnidgrbit : UInt32, @columnidDefault : UInt32, @columnidBaseTableName : UInt32, @columnidBaseColumnName : UInt32, @columnidDefinitionName : UInt32)
    end
  end

  @[Extern]
  struct JET_COLUMNDEF
    property cbStruct : UInt32
    property columnid : UInt32
    property coltyp : UInt32
    property wCountry : UInt16
    property langid : UInt16
    property cp : UInt16
    property wCollate : UInt16
    property cbMax : UInt32
    property grbit : UInt32
    def initialize(@cbStruct : UInt32, @columnid : UInt32, @coltyp : UInt32, @wCountry : UInt16, @langid : UInt16, @cp : UInt16, @wCollate : UInt16, @cbMax : UInt32, @grbit : UInt32)
    end
  end

  @[Extern]
  struct JET_COLUMNBASE_A
    property cbStruct : UInt32
    property columnid : UInt32
    property coltyp : UInt32
    property wCountry : UInt16
    property langid : UInt16
    property cp : UInt16
    property wFiller : UInt16
    property cbMax : UInt32
    property grbit : UInt32
    property szBaseTableName : Win32cr::Foundation::CHAR[256]
    property szBaseColumnName : Win32cr::Foundation::CHAR[256]
    def initialize(@cbStruct : UInt32, @columnid : UInt32, @coltyp : UInt32, @wCountry : UInt16, @langid : UInt16, @cp : UInt16, @wFiller : UInt16, @cbMax : UInt32, @grbit : UInt32, @szBaseTableName : Win32cr::Foundation::CHAR[256], @szBaseColumnName : Win32cr::Foundation::CHAR[256])
    end
  end

  @[Extern]
  struct JET_COLUMNBASE_W
    property cbStruct : UInt32
    property columnid : UInt32
    property coltyp : UInt32
    property wCountry : UInt16
    property langid : UInt16
    property cp : UInt16
    property wFiller : UInt16
    property cbMax : UInt32
    property grbit : UInt32
    property szBaseTableName : UInt16[256]
    property szBaseColumnName : UInt16[256]
    def initialize(@cbStruct : UInt32, @columnid : UInt32, @coltyp : UInt32, @wCountry : UInt16, @langid : UInt16, @cp : UInt16, @wFiller : UInt16, @cbMax : UInt32, @grbit : UInt32, @szBaseTableName : UInt16[256], @szBaseColumnName : UInt16[256])
    end
  end

  @[Extern]
  struct JET_INDEXLIST
    property cbStruct : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cRecord : UInt32
    property columnidindexname : UInt32
    property columnidgrbitIndex : UInt32
    property columnidcKey : UInt32
    property columnidcEntry : UInt32
    property columnidcPage : UInt32
    property columnidcColumn : UInt32
    property columnidiColumn : UInt32
    property columnidcolumnid : UInt32
    property columnidcoltyp : UInt32
    property columnidCountry : UInt32
    property columnidLangid : UInt32
    property columnidCp : UInt32
    property columnidCollate : UInt32
    property columnidgrbitColumn : UInt32
    property columnidcolumnname : UInt32
    property columnidLCMapFlags : UInt32
    def initialize(@cbStruct : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cRecord : UInt32, @columnidindexname : UInt32, @columnidgrbitIndex : UInt32, @columnidcKey : UInt32, @columnidcEntry : UInt32, @columnidcPage : UInt32, @columnidcColumn : UInt32, @columnidiColumn : UInt32, @columnidcolumnid : UInt32, @columnidcoltyp : UInt32, @columnidCountry : UInt32, @columnidLangid : UInt32, @columnidCp : UInt32, @columnidCollate : UInt32, @columnidgrbitColumn : UInt32, @columnidcolumnname : UInt32, @columnidLCMapFlags : UInt32)
    end
  end

  @[Extern]
  struct JET_COLUMNCREATE_A
    property cbStruct : UInt32
    property szColumnName : Win32cr::Foundation::PSTR
    property coltyp : UInt32
    property cbMax : UInt32
    property grbit : UInt32
    property pvDefault : Void*
    property cbDefault : UInt32
    property cp : UInt32
    property columnid : UInt32
    property err : Int32
    def initialize(@cbStruct : UInt32, @szColumnName : Win32cr::Foundation::PSTR, @coltyp : UInt32, @cbMax : UInt32, @grbit : UInt32, @pvDefault : Void*, @cbDefault : UInt32, @cp : UInt32, @columnid : UInt32, @err : Int32)
    end
  end

  @[Extern]
  struct JET_COLUMNCREATE_W
    property cbStruct : UInt32
    property szColumnName : Win32cr::Foundation::PWSTR
    property coltyp : UInt32
    property cbMax : UInt32
    property grbit : UInt32
    property pvDefault : Void*
    property cbDefault : UInt32
    property cp : UInt32
    property columnid : UInt32
    property err : Int32
    def initialize(@cbStruct : UInt32, @szColumnName : Win32cr::Foundation::PWSTR, @coltyp : UInt32, @cbMax : UInt32, @grbit : UInt32, @pvDefault : Void*, @cbDefault : UInt32, @cp : UInt32, @columnid : UInt32, @err : Int32)
    end
  end

  @[Extern]
  struct JET_USERDEFINEDDEFAULT_A
    property szCallback : Win32cr::Foundation::PSTR
    property pbUserData : UInt8*
    property cbUserData : UInt32
    property szDependantColumns : Win32cr::Foundation::PSTR
    def initialize(@szCallback : Win32cr::Foundation::PSTR, @pbUserData : UInt8*, @cbUserData : UInt32, @szDependantColumns : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct JET_USERDEFINEDDEFAULT_W
    property szCallback : Win32cr::Foundation::PWSTR
    property pbUserData : UInt8*
    property cbUserData : UInt32
    property szDependantColumns : Win32cr::Foundation::PWSTR
    def initialize(@szCallback : Win32cr::Foundation::PWSTR, @pbUserData : UInt8*, @cbUserData : UInt32, @szDependantColumns : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct JET_CONDITIONALCOLUMN_A
    property cbStruct : UInt32
    property szColumnName : Win32cr::Foundation::PSTR
    property grbit : UInt32
    def initialize(@cbStruct : UInt32, @szColumnName : Win32cr::Foundation::PSTR, @grbit : UInt32)
    end
  end

  @[Extern]
  struct JET_CONDITIONALCOLUMN_W
    property cbStruct : UInt32
    property szColumnName : Win32cr::Foundation::PWSTR
    property grbit : UInt32
    def initialize(@cbStruct : UInt32, @szColumnName : Win32cr::Foundation::PWSTR, @grbit : UInt32)
    end
  end

  @[Extern]
  struct JET_UNICODEINDEX
    property lcid : UInt32
    property dwMapFlags : UInt32
    def initialize(@lcid : UInt32, @dwMapFlags : UInt32)
    end
  end

  @[Extern]
  struct JET_UNICODEINDEX2
    property szLocaleName : Win32cr::Foundation::PWSTR
    property dwMapFlags : UInt32
    def initialize(@szLocaleName : Win32cr::Foundation::PWSTR, @dwMapFlags : UInt32)
    end
  end

  @[Extern]
  struct JET_TUPLELIMITS
    property chLengthMin : UInt32
    property chLengthMax : UInt32
    property chToIndexMax : UInt32
    property cchIncrement : UInt32
    property ichStart : UInt32
    def initialize(@chLengthMin : UInt32, @chLengthMax : UInt32, @chToIndexMax : UInt32, @cchIncrement : UInt32, @ichStart : UInt32)
    end
  end

  @[Extern]
  struct JET_SPACEHINTS
    property cbStruct : UInt32
    property ulInitialDensity : UInt32
    property cbInitial : UInt32
    property grbit : UInt32
    property ulMaintDensity : UInt32
    property ulGrowth : UInt32
    property cbMinExtent : UInt32
    property cbMaxExtent : UInt32
    def initialize(@cbStruct : UInt32, @ulInitialDensity : UInt32, @cbInitial : UInt32, @grbit : UInt32, @ulMaintDensity : UInt32, @ulGrowth : UInt32, @cbMinExtent : UInt32, @cbMaxExtent : UInt32)
    end
  end

  @[Extern]
  struct JET_INDEXCREATE_A
    property cbStruct : UInt32
    property szIndexName : Win32cr::Foundation::PSTR
    property szKey : Win32cr::Foundation::PSTR
    property cbKey : UInt32
    property grbit : UInt32
    property ulDensity : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_A*
    property cConditionalColumn : UInt32
    property err : Int32
    property cbKeyMost : UInt32

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property lcid : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*
    def initialize(@lcid : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property cbVarSegMac : UInt32
    property ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*
    def initialize(@cbVarSegMac : UInt32, @ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*)
    end
    end

    def initialize(@cbStruct : UInt32, @szIndexName : Win32cr::Foundation::PSTR, @szKey : Win32cr::Foundation::PSTR, @cbKey : UInt32, @grbit : UInt32, @ulDensity : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_A*, @cConditionalColumn : UInt32, @err : Int32, @cbKeyMost : UInt32)
    end
  end

  @[Extern]
  struct JET_INDEXCREATE_W
    property cbStruct : UInt32
    property szIndexName : Win32cr::Foundation::PWSTR
    property szKey : Win32cr::Foundation::PWSTR
    property cbKey : UInt32
    property grbit : UInt32
    property ulDensity : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_W*
    property cConditionalColumn : UInt32
    property err : Int32
    property cbKeyMost : UInt32

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property lcid : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*
    def initialize(@lcid : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property cbVarSegMac : UInt32
    property ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*
    def initialize(@cbVarSegMac : UInt32, @ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*)
    end
    end

    def initialize(@cbStruct : UInt32, @szIndexName : Win32cr::Foundation::PWSTR, @szKey : Win32cr::Foundation::PWSTR, @cbKey : UInt32, @grbit : UInt32, @ulDensity : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_W*, @cConditionalColumn : UInt32, @err : Int32, @cbKeyMost : UInt32)
    end
  end

  @[Extern]
  struct JET_INDEXCREATE2_A
    property cbStruct : UInt32
    property szIndexName : Win32cr::Foundation::PSTR
    property szKey : Win32cr::Foundation::PSTR
    property cbKey : UInt32
    property grbit : UInt32
    property ulDensity : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_A*
    property cConditionalColumn : UInt32
    property err : Int32
    property cbKeyMost : UInt32
    property pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property lcid : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*
    def initialize(@lcid : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property cbVarSegMac : UInt32
    property ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*
    def initialize(@cbVarSegMac : UInt32, @ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*)
    end
    end

    def initialize(@cbStruct : UInt32, @szIndexName : Win32cr::Foundation::PSTR, @szKey : Win32cr::Foundation::PSTR, @cbKey : UInt32, @grbit : UInt32, @ulDensity : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_A*, @cConditionalColumn : UInt32, @err : Int32, @cbKeyMost : UInt32, @pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*)
    end
  end

  @[Extern]
  struct JET_INDEXCREATE2_W
    property cbStruct : UInt32
    property szIndexName : Win32cr::Foundation::PWSTR
    property szKey : Win32cr::Foundation::PWSTR
    property cbKey : UInt32
    property grbit : UInt32
    property ulDensity : UInt32
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_
    property rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_W*
    property cConditionalColumn : UInt32
    property err : Int32
    property cbKeyMost : UInt32
    property pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property lcid : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*
    def initialize(@lcid : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property cbVarSegMac : UInt32
    property ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*
    def initialize(@cbVarSegMac : UInt32, @ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*)
    end
    end

    def initialize(@cbStruct : UInt32, @szIndexName : Win32cr::Foundation::PWSTR, @szKey : Win32cr::Foundation::PWSTR, @cbKey : UInt32, @grbit : UInt32, @ulDensity : UInt32, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_, @rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_W*, @cConditionalColumn : UInt32, @err : Int32, @cbKeyMost : UInt32, @pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*)
    end
  end

  @[Extern]
  struct JET_INDEXCREATE3_A
    property cbStruct : UInt32
    property szIndexName : Win32cr::Foundation::PSTR
    property szKey : Win32cr::Foundation::PSTR
    property cbKey : UInt32
    property grbit : UInt32
    property ulDensity : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX2*
    property anonymous : Anonymous_e__Union_
    property rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_A*
    property cConditionalColumn : UInt32
    property err : Int32
    property cbKeyMost : UInt32
    property pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property cbVarSegMac : UInt32
    property ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*
    def initialize(@cbVarSegMac : UInt32, @ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*)
    end
    end

    def initialize(@cbStruct : UInt32, @szIndexName : Win32cr::Foundation::PSTR, @szKey : Win32cr::Foundation::PSTR, @cbKey : UInt32, @grbit : UInt32, @ulDensity : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX2*, @anonymous : Anonymous_e__Union_, @rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_A*, @cConditionalColumn : UInt32, @err : Int32, @cbKeyMost : UInt32, @pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*)
    end
  end

  @[Extern]
  struct JET_INDEXCREATE3_W
    property cbStruct : UInt32
    property szIndexName : Win32cr::Foundation::PWSTR
    property szKey : Win32cr::Foundation::PWSTR
    property cbKey : UInt32
    property grbit : UInt32
    property ulDensity : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX2*
    property anonymous : Anonymous_e__Union_
    property rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_W*
    property cConditionalColumn : UInt32
    property err : Int32
    property cbKeyMost : UInt32
    property pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property cbVarSegMac : UInt32
    property ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*
    def initialize(@cbVarSegMac : UInt32, @ptuplelimits : Win32cr::Storage::Jet::JET_TUPLELIMITS*)
    end
    end

    def initialize(@cbStruct : UInt32, @szIndexName : Win32cr::Foundation::PWSTR, @szKey : Win32cr::Foundation::PWSTR, @cbKey : UInt32, @grbit : UInt32, @ulDensity : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX2*, @anonymous : Anonymous_e__Union_, @rgconditionalcolumn : Win32cr::Storage::Jet::JET_CONDITIONALCOLUMN_W*, @cConditionalColumn : UInt32, @err : Int32, @cbKeyMost : UInt32, @pSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*)
    end
  end

  @[Extern]
  struct JET_TABLECREATE_A
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PSTR
    property szTemplateTableName : Win32cr::Foundation::PSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_A*
    property cIndexes : UInt32
    property grbit : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PSTR, @szTemplateTableName : Win32cr::Foundation::PSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_A*, @cIndexes : UInt32, @grbit : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE_W
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PWSTR
    property szTemplateTableName : Win32cr::Foundation::PWSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_W*
    property cIndexes : UInt32
    property grbit : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PWSTR, @szTemplateTableName : Win32cr::Foundation::PWSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_W*, @cIndexes : UInt32, @grbit : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE2_A
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PSTR
    property szTemplateTableName : Win32cr::Foundation::PSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_A*
    property cIndexes : UInt32
    property szCallback : Win32cr::Foundation::PSTR
    property cbtyp : UInt32
    property grbit : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PSTR, @szTemplateTableName : Win32cr::Foundation::PSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_A*, @cIndexes : UInt32, @szCallback : Win32cr::Foundation::PSTR, @cbtyp : UInt32, @grbit : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE2_W
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PWSTR
    property szTemplateTableName : Win32cr::Foundation::PWSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_W*
    property cIndexes : UInt32
    property szCallback : Win32cr::Foundation::PWSTR
    property cbtyp : UInt32
    property grbit : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PWSTR, @szTemplateTableName : Win32cr::Foundation::PWSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_W*, @cIndexes : UInt32, @szCallback : Win32cr::Foundation::PWSTR, @cbtyp : UInt32, @grbit : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE3_A
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PSTR
    property szTemplateTableName : Win32cr::Foundation::PSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_A*
    property cIndexes : UInt32
    property szCallback : Win32cr::Foundation::PSTR
    property cbtyp : UInt32
    property grbit : UInt32
    property pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property cbSeparateLV : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PSTR, @szTemplateTableName : Win32cr::Foundation::PSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_A*, @cIndexes : UInt32, @szCallback : Win32cr::Foundation::PSTR, @cbtyp : UInt32, @grbit : UInt32, @pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @cbSeparateLV : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE3_W
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PWSTR
    property szTemplateTableName : Win32cr::Foundation::PWSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_W*
    property cIndexes : UInt32
    property szCallback : Win32cr::Foundation::PWSTR
    property cbtyp : UInt32
    property grbit : UInt32
    property pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property cbSeparateLV : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PWSTR, @szTemplateTableName : Win32cr::Foundation::PWSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_W*, @cIndexes : UInt32, @szCallback : Win32cr::Foundation::PWSTR, @cbtyp : UInt32, @grbit : UInt32, @pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @cbSeparateLV : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE4_A
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PSTR
    property szTemplateTableName : Win32cr::Foundation::PSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_A*
    property cIndexes : UInt32
    property szCallback : Win32cr::Foundation::PSTR
    property cbtyp : UInt32
    property grbit : UInt32
    property pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property cbSeparateLV : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PSTR, @szTemplateTableName : Win32cr::Foundation::PSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_A*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_A*, @cIndexes : UInt32, @szCallback : Win32cr::Foundation::PSTR, @cbtyp : UInt32, @grbit : UInt32, @pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @cbSeparateLV : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_TABLECREATE4_W
    property cbStruct : UInt32
    property szTableName : Win32cr::Foundation::PWSTR
    property szTemplateTableName : Win32cr::Foundation::PWSTR
    property ulPages : UInt32
    property ulDensity : UInt32
    property rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*
    property cColumns : UInt32
    property rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_W*
    property cIndexes : UInt32
    property szCallback : Win32cr::Foundation::PWSTR
    property cbtyp : UInt32
    property grbit : UInt32
    property pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*
    property cbSeparateLV : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cCreated : UInt32
    def initialize(@cbStruct : UInt32, @szTableName : Win32cr::Foundation::PWSTR, @szTemplateTableName : Win32cr::Foundation::PWSTR, @ulPages : UInt32, @ulDensity : UInt32, @rgcolumncreate : Win32cr::Storage::Jet::JET_COLUMNCREATE_W*, @cColumns : UInt32, @rgindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_W*, @cIndexes : UInt32, @szCallback : Win32cr::Foundation::PWSTR, @cbtyp : UInt32, @grbit : UInt32, @pSeqSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @pLVSpacehints : Win32cr::Storage::Jet::JET_SPACEHINTS*, @cbSeparateLV : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cCreated : UInt32)
    end
  end

  @[Extern]
  struct JET_OPENTEMPORARYTABLE
    property cbStruct : UInt32
    property prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*
    property ccolumn : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*
    property grbit : UInt32
    property prgcolumnid : UInt32*
    property cbKeyMost : UInt32
    property cbVarSegMac : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    def initialize(@cbStruct : UInt32, @prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, @ccolumn : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*, @grbit : UInt32, @prgcolumnid : UInt32*, @cbKeyMost : UInt32, @cbVarSegMac : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID)
    end
  end

  @[Extern]
  struct JET_OPENTEMPORARYTABLE2
    property cbStruct : UInt32
    property prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*
    property ccolumn : UInt32
    property pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX2*
    property grbit : UInt32
    property prgcolumnid : UInt32*
    property cbKeyMost : UInt32
    property cbVarSegMac : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    def initialize(@cbStruct : UInt32, @prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, @ccolumn : UInt32, @pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX2*, @grbit : UInt32, @prgcolumnid : UInt32*, @cbKeyMost : UInt32, @cbVarSegMac : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID)
    end
  end

  @[Extern]
  struct JET_RETINFO
    property cbStruct : UInt32
    property ibLongValue : UInt32
    property itagSequence : UInt32
    property columnidNextTagged : UInt32
    def initialize(@cbStruct : UInt32, @ibLongValue : UInt32, @itagSequence : UInt32, @columnidNextTagged : UInt32)
    end
  end

  @[Extern]
  struct JET_SETINFO
    property cbStruct : UInt32
    property ibLongValue : UInt32
    property itagSequence : UInt32
    def initialize(@cbStruct : UInt32, @ibLongValue : UInt32, @itagSequence : UInt32)
    end
  end

  @[Extern]
  struct JET_RECPOS
    property cbStruct : UInt32
    property centriesLT : UInt32
    property centriesInRange : UInt32
    property centriesTotal : UInt32
    def initialize(@cbStruct : UInt32, @centriesLT : UInt32, @centriesInRange : UInt32, @centriesTotal : UInt32)
    end
  end

  @[Extern]
  struct JET_RECORDLIST
    property cbStruct : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property cRecord : UInt32
    property columnidBookmark : UInt32
    def initialize(@cbStruct : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @cRecord : UInt32, @columnidBookmark : UInt32)
    end
  end

  @[Extern]
  struct JET_INDEXRANGE
    property cbStruct : UInt32
    property tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID
    property grbit : UInt32
    def initialize(@cbStruct : UInt32, @tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, @grbit : UInt32)
    end
  end

  @[Extern]
  struct JET_INDEX_COLUMN
    property columnid : UInt32
    property relop : Win32cr::Storage::Jet::JET_RELOP
    property pv : Void*
    property cb : UInt32
    property grbit : UInt32
    def initialize(@columnid : UInt32, @relop : Win32cr::Storage::Jet::JET_RELOP, @pv : Void*, @cb : UInt32, @grbit : UInt32)
    end
  end

  @[Extern]
  struct JET_INDEX_RANGE
    property rgStartColumns : Win32cr::Storage::Jet::JET_INDEX_COLUMN*
    property cStartColumns : UInt32
    property rgEndColumns : Win32cr::Storage::Jet::JET_INDEX_COLUMN*
    property cEndColumns : UInt32
    def initialize(@rgStartColumns : Win32cr::Storage::Jet::JET_INDEX_COLUMN*, @cStartColumns : UInt32, @rgEndColumns : Win32cr::Storage::Jet::JET_INDEX_COLUMN*, @cEndColumns : UInt32)
    end
  end

  @[Extern]
  struct JET_LOGTIME
    property bSeconds : Win32cr::Foundation::CHAR
    property bMinutes : Win32cr::Foundation::CHAR
    property bHours : Win32cr::Foundation::CHAR
    property bDay : Win32cr::Foundation::CHAR
    property bMonth : Win32cr::Foundation::CHAR
    property bYear : Win32cr::Foundation::CHAR
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property bFiller2 : Win32cr::Foundation::CHAR
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end

    def initialize(@bFiller2 : Win32cr::Foundation::CHAR, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property bFiller1 : Win32cr::Foundation::CHAR
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end

    def initialize(@bFiller1 : Win32cr::Foundation::CHAR, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@bSeconds : Win32cr::Foundation::CHAR, @bMinutes : Win32cr::Foundation::CHAR, @bHours : Win32cr::Foundation::CHAR, @bDay : Win32cr::Foundation::CHAR, @bMonth : Win32cr::Foundation::CHAR, @bYear : Win32cr::Foundation::CHAR, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_)
    end
  end

  @[Extern]
  struct JET_BKLOGTIME
    property bSeconds : Win32cr::Foundation::CHAR
    property bMinutes : Win32cr::Foundation::CHAR
    property bHours : Win32cr::Foundation::CHAR
    property bDay : Win32cr::Foundation::CHAR
    property bMonth : Win32cr::Foundation::CHAR
    property bYear : Win32cr::Foundation::CHAR
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property bFiller2 : Win32cr::Foundation::CHAR
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end

    def initialize(@bFiller2 : Win32cr::Foundation::CHAR, @anonymous : Anonymous_e__Struct_)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property bFiller1 : Win32cr::Foundation::CHAR
    property anonymous : Anonymous_e__Struct_

      # Nested Type Anonymous_e__Struct_
      @[Extern]
      struct Anonymous_e__Struct_
    property _bitfield : UInt8
    def initialize(@_bitfield : UInt8)
    end
      end

    def initialize(@bFiller1 : Win32cr::Foundation::CHAR, @anonymous : Anonymous_e__Struct_)
    end
    end

    def initialize(@bSeconds : Win32cr::Foundation::CHAR, @bMinutes : Win32cr::Foundation::CHAR, @bHours : Win32cr::Foundation::CHAR, @bDay : Win32cr::Foundation::CHAR, @bMonth : Win32cr::Foundation::CHAR, @bYear : Win32cr::Foundation::CHAR, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_)
    end
  end

  @[Extern]
  struct JET_LGPOS
    property ib : UInt16
    property isec : UInt16
    property lGeneration : Int32
    def initialize(@ib : UInt16, @isec : UInt16, @lGeneration : Int32)
    end
  end

  @[Extern]
  struct JET_SIGNATURE
    property ulRandom : UInt32
    property logtimeCreate : Win32cr::Storage::Jet::JET_LOGTIME
    property szComputerName : Win32cr::Foundation::CHAR[16]
    def initialize(@ulRandom : UInt32, @logtimeCreate : Win32cr::Storage::Jet::JET_LOGTIME, @szComputerName : Win32cr::Foundation::CHAR[16])
    end
  end

  @[Extern]
  struct JET_BKINFO
    property lgposMark : Win32cr::Storage::Jet::JET_LGPOS
    property anonymous : Anonymous_e__Union_
    property genLow : UInt32
    property genHigh : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property logtimeMark : Win32cr::Storage::Jet::JET_LOGTIME
    property bklogtimeMark : Win32cr::Storage::Jet::JET_BKLOGTIME
    def initialize(@logtimeMark : Win32cr::Storage::Jet::JET_LOGTIME, @bklogtimeMark : Win32cr::Storage::Jet::JET_BKLOGTIME)
    end
    end

    def initialize(@lgposMark : Win32cr::Storage::Jet::JET_LGPOS, @anonymous : Anonymous_e__Union_, @genLow : UInt32, @genHigh : UInt32)
    end
  end

  @[Extern]
  struct JET_DBINFOMISC
    property ulVersion : UInt32
    property ulUpdate : UInt32
    property signDb : Win32cr::Storage::Jet::JET_SIGNATURE
    property dbstate : UInt32
    property lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME
    property logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposAttach : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposDetach : Win32cr::Storage::Jet::JET_LGPOS
    property signLog : Win32cr::Storage::Jet::JET_SIGNATURE
    property bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO
    property fShadowingDisabled : UInt32
    property fUpgradeDb : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property lSPNumber : Int32
    property cbPageSize : UInt32
    def initialize(@ulVersion : UInt32, @ulUpdate : UInt32, @signDb : Win32cr::Storage::Jet::JET_SIGNATURE, @dbstate : UInt32, @lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS, @logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME, @logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposAttach : Win32cr::Storage::Jet::JET_LGPOS, @logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposDetach : Win32cr::Storage::Jet::JET_LGPOS, @signLog : Win32cr::Storage::Jet::JET_SIGNATURE, @bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO, @fShadowingDisabled : UInt32, @fUpgradeDb : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @lSPNumber : Int32, @cbPageSize : UInt32)
    end
  end

  @[Extern]
  struct JET_DBINFOMISC2
    property ulVersion : UInt32
    property ulUpdate : UInt32
    property signDb : Win32cr::Storage::Jet::JET_SIGNATURE
    property dbstate : UInt32
    property lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME
    property logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposAttach : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposDetach : Win32cr::Storage::Jet::JET_LGPOS
    property signLog : Win32cr::Storage::Jet::JET_SIGNATURE
    property bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO
    property fShadowingDisabled : UInt32
    property fUpgradeDb : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property lSPNumber : Int32
    property cbPageSize : UInt32
    property genMinRequired : UInt32
    property genMaxRequired : UInt32
    property logtimeGenMaxCreate : Win32cr::Storage::Jet::JET_LOGTIME
    property ulRepairCount : UInt32
    property logtimeRepair : Win32cr::Storage::Jet::JET_LOGTIME
    property ulRepairCountOld : UInt32
    property ulECCFixSuccess : UInt32
    property logtimeECCFixSuccess : Win32cr::Storage::Jet::JET_LOGTIME
    property ulECCFixSuccessOld : UInt32
    property ulECCFixFail : UInt32
    property logtimeECCFixFail : Win32cr::Storage::Jet::JET_LOGTIME
    property ulECCFixFailOld : UInt32
    property ulBadChecksum : UInt32
    property logtimeBadChecksum : Win32cr::Storage::Jet::JET_LOGTIME
    property ulBadChecksumOld : UInt32
    def initialize(@ulVersion : UInt32, @ulUpdate : UInt32, @signDb : Win32cr::Storage::Jet::JET_SIGNATURE, @dbstate : UInt32, @lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS, @logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME, @logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposAttach : Win32cr::Storage::Jet::JET_LGPOS, @logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposDetach : Win32cr::Storage::Jet::JET_LGPOS, @signLog : Win32cr::Storage::Jet::JET_SIGNATURE, @bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO, @fShadowingDisabled : UInt32, @fUpgradeDb : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @lSPNumber : Int32, @cbPageSize : UInt32, @genMinRequired : UInt32, @genMaxRequired : UInt32, @logtimeGenMaxCreate : Win32cr::Storage::Jet::JET_LOGTIME, @ulRepairCount : UInt32, @logtimeRepair : Win32cr::Storage::Jet::JET_LOGTIME, @ulRepairCountOld : UInt32, @ulECCFixSuccess : UInt32, @logtimeECCFixSuccess : Win32cr::Storage::Jet::JET_LOGTIME, @ulECCFixSuccessOld : UInt32, @ulECCFixFail : UInt32, @logtimeECCFixFail : Win32cr::Storage::Jet::JET_LOGTIME, @ulECCFixFailOld : UInt32, @ulBadChecksum : UInt32, @logtimeBadChecksum : Win32cr::Storage::Jet::JET_LOGTIME, @ulBadChecksumOld : UInt32)
    end
  end

  @[Extern]
  struct JET_DBINFOMISC3
    property ulVersion : UInt32
    property ulUpdate : UInt32
    property signDb : Win32cr::Storage::Jet::JET_SIGNATURE
    property dbstate : UInt32
    property lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME
    property logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposAttach : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposDetach : Win32cr::Storage::Jet::JET_LGPOS
    property signLog : Win32cr::Storage::Jet::JET_SIGNATURE
    property bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO
    property fShadowingDisabled : UInt32
    property fUpgradeDb : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property lSPNumber : Int32
    property cbPageSize : UInt32
    property genMinRequired : UInt32
    property genMaxRequired : UInt32
    property logtimeGenMaxCreate : Win32cr::Storage::Jet::JET_LOGTIME
    property ulRepairCount : UInt32
    property logtimeRepair : Win32cr::Storage::Jet::JET_LOGTIME
    property ulRepairCountOld : UInt32
    property ulECCFixSuccess : UInt32
    property logtimeECCFixSuccess : Win32cr::Storage::Jet::JET_LOGTIME
    property ulECCFixSuccessOld : UInt32
    property ulECCFixFail : UInt32
    property logtimeECCFixFail : Win32cr::Storage::Jet::JET_LOGTIME
    property ulECCFixFailOld : UInt32
    property ulBadChecksum : UInt32
    property logtimeBadChecksum : Win32cr::Storage::Jet::JET_LOGTIME
    property ulBadChecksumOld : UInt32
    property genCommitted : UInt32
    def initialize(@ulVersion : UInt32, @ulUpdate : UInt32, @signDb : Win32cr::Storage::Jet::JET_SIGNATURE, @dbstate : UInt32, @lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS, @logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME, @logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposAttach : Win32cr::Storage::Jet::JET_LGPOS, @logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposDetach : Win32cr::Storage::Jet::JET_LGPOS, @signLog : Win32cr::Storage::Jet::JET_SIGNATURE, @bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO, @fShadowingDisabled : UInt32, @fUpgradeDb : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @lSPNumber : Int32, @cbPageSize : UInt32, @genMinRequired : UInt32, @genMaxRequired : UInt32, @logtimeGenMaxCreate : Win32cr::Storage::Jet::JET_LOGTIME, @ulRepairCount : UInt32, @logtimeRepair : Win32cr::Storage::Jet::JET_LOGTIME, @ulRepairCountOld : UInt32, @ulECCFixSuccess : UInt32, @logtimeECCFixSuccess : Win32cr::Storage::Jet::JET_LOGTIME, @ulECCFixSuccessOld : UInt32, @ulECCFixFail : UInt32, @logtimeECCFixFail : Win32cr::Storage::Jet::JET_LOGTIME, @ulECCFixFailOld : UInt32, @ulBadChecksum : UInt32, @logtimeBadChecksum : Win32cr::Storage::Jet::JET_LOGTIME, @ulBadChecksumOld : UInt32, @genCommitted : UInt32)
    end
  end

  @[Extern]
  struct JET_DBINFOMISC4
    property ulVersion : UInt32
    property ulUpdate : UInt32
    property signDb : Win32cr::Storage::Jet::JET_SIGNATURE
    property dbstate : UInt32
    property lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME
    property logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposAttach : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME
    property lgposDetach : Win32cr::Storage::Jet::JET_LGPOS
    property signLog : Win32cr::Storage::Jet::JET_SIGNATURE
    property bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO
    property fShadowingDisabled : UInt32
    property fUpgradeDb : UInt32
    property dwMajorVersion : UInt32
    property dwMinorVersion : UInt32
    property dwBuildNumber : UInt32
    property lSPNumber : Int32
    property cbPageSize : UInt32
    property genMinRequired : UInt32
    property genMaxRequired : UInt32
    property logtimeGenMaxCreate : Win32cr::Storage::Jet::JET_LOGTIME
    property ulRepairCount : UInt32
    property logtimeRepair : Win32cr::Storage::Jet::JET_LOGTIME
    property ulRepairCountOld : UInt32
    property ulECCFixSuccess : UInt32
    property logtimeECCFixSuccess : Win32cr::Storage::Jet::JET_LOGTIME
    property ulECCFixSuccessOld : UInt32
    property ulECCFixFail : UInt32
    property logtimeECCFixFail : Win32cr::Storage::Jet::JET_LOGTIME
    property ulECCFixFailOld : UInt32
    property ulBadChecksum : UInt32
    property logtimeBadChecksum : Win32cr::Storage::Jet::JET_LOGTIME
    property ulBadChecksumOld : UInt32
    property genCommitted : UInt32
    property bkinfoCopyPrev : Win32cr::Storage::Jet::JET_BKINFO
    property bkinfoDiffPrev : Win32cr::Storage::Jet::JET_BKINFO
    def initialize(@ulVersion : UInt32, @ulUpdate : UInt32, @signDb : Win32cr::Storage::Jet::JET_SIGNATURE, @dbstate : UInt32, @lgposConsistent : Win32cr::Storage::Jet::JET_LGPOS, @logtimeConsistent : Win32cr::Storage::Jet::JET_LOGTIME, @logtimeAttach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposAttach : Win32cr::Storage::Jet::JET_LGPOS, @logtimeDetach : Win32cr::Storage::Jet::JET_LOGTIME, @lgposDetach : Win32cr::Storage::Jet::JET_LGPOS, @signLog : Win32cr::Storage::Jet::JET_SIGNATURE, @bkinfoFullPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoIncPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoFullCur : Win32cr::Storage::Jet::JET_BKINFO, @fShadowingDisabled : UInt32, @fUpgradeDb : UInt32, @dwMajorVersion : UInt32, @dwMinorVersion : UInt32, @dwBuildNumber : UInt32, @lSPNumber : Int32, @cbPageSize : UInt32, @genMinRequired : UInt32, @genMaxRequired : UInt32, @logtimeGenMaxCreate : Win32cr::Storage::Jet::JET_LOGTIME, @ulRepairCount : UInt32, @logtimeRepair : Win32cr::Storage::Jet::JET_LOGTIME, @ulRepairCountOld : UInt32, @ulECCFixSuccess : UInt32, @logtimeECCFixSuccess : Win32cr::Storage::Jet::JET_LOGTIME, @ulECCFixSuccessOld : UInt32, @ulECCFixFail : UInt32, @logtimeECCFixFail : Win32cr::Storage::Jet::JET_LOGTIME, @ulECCFixFailOld : UInt32, @ulBadChecksum : UInt32, @logtimeBadChecksum : Win32cr::Storage::Jet::JET_LOGTIME, @ulBadChecksumOld : UInt32, @genCommitted : UInt32, @bkinfoCopyPrev : Win32cr::Storage::Jet::JET_BKINFO, @bkinfoDiffPrev : Win32cr::Storage::Jet::JET_BKINFO)
    end
  end

  @[Extern]
  struct JET_THREADSTATS
    property cbStruct : UInt32
    property cPageReferenced : UInt32
    property cPageRead : UInt32
    property cPagePreread : UInt32
    property cPageDirtied : UInt32
    property cPageRedirtied : UInt32
    property cLogRecord : UInt32
    property cbLogRecord : UInt32
    def initialize(@cbStruct : UInt32, @cPageReferenced : UInt32, @cPageRead : UInt32, @cPagePreread : UInt32, @cPageDirtied : UInt32, @cPageRedirtied : UInt32, @cLogRecord : UInt32, @cbLogRecord : UInt32)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_THREADSTATS2
    property cbStruct : UInt32
    property cPageReferenced : UInt32
    property cPageRead : UInt32
    property cPagePreread : UInt32
    property cPageDirtied : UInt32
    property cPageRedirtied : UInt32
    property cLogRecord : UInt32
    property cbLogRecord : UInt32
    property cusecPageCacheMiss : UInt64
    property cPageCacheMiss : UInt32
    def initialize(@cbStruct : UInt32, @cPageReferenced : UInt32, @cPageRead : UInt32, @cPagePreread : UInt32, @cPageDirtied : UInt32, @cPageRedirtied : UInt32, @cLogRecord : UInt32, @cbLogRecord : UInt32, @cusecPageCacheMiss : UInt64, @cPageCacheMiss : UInt32)
    end
  end
  {% end %}

  @[Extern]
  struct JET_RSTINFO_A
    property cbStruct : UInt32
    property rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_A*
    property crstmap : Int32
    property lgposStop : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeStop : Win32cr::Storage::Jet::JET_LOGTIME
    property pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS
    def initialize(@cbStruct : UInt32, @rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_A*, @crstmap : Int32, @lgposStop : Win32cr::Storage::Jet::JET_LGPOS, @logtimeStop : Win32cr::Storage::Jet::JET_LOGTIME, @pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS)
    end
  end

  @[Extern]
  struct JET_RSTINFO_W
    property cbStruct : UInt32
    property rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_W*
    property crstmap : Int32
    property lgposStop : Win32cr::Storage::Jet::JET_LGPOS
    property logtimeStop : Win32cr::Storage::Jet::JET_LOGTIME
    property pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS
    def initialize(@cbStruct : UInt32, @rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_W*, @crstmap : Int32, @lgposStop : Win32cr::Storage::Jet::JET_LGPOS, @logtimeStop : Win32cr::Storage::Jet::JET_LOGTIME, @pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS)
    end
  end

  @[Extern]
  struct JET_ERRINFOBASIC_W
    property cbStruct : UInt32
    property errValue : Int32
    property errcatMostSpecific : Win32cr::Storage::Jet::JET_ERRCAT
    property rgCategoricalHierarchy : UInt8[8]
    property lSourceLine : UInt32
    property rgszSourceFile : UInt16[64]
    def initialize(@cbStruct : UInt32, @errValue : Int32, @errcatMostSpecific : Win32cr::Storage::Jet::JET_ERRCAT, @rgCategoricalHierarchy : UInt8[8], @lSourceLine : UInt32, @rgszSourceFile : UInt16[64])
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_COMMIT_ID
    property signLog : Win32cr::Storage::Jet::JET_SIGNATURE
    property reserved : Int32
    property commitId : Int64
    def initialize(@signLog : Win32cr::Storage::Jet::JET_SIGNATURE, @reserved : Int32, @commitId : Int64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_RBSINFOMISC
    property lRBSGeneration : Int32
    property logtimeCreate : Win32cr::Storage::Jet::JET_LOGTIME
    property logtimeCreatePrevRBS : Win32cr::Storage::Jet::JET_LOGTIME
    property ulMajor : UInt32
    property ulMinor : UInt32
    property cbLogicalFileSize : UInt64
    def initialize(@lRBSGeneration : Int32, @logtimeCreate : Win32cr::Storage::Jet::JET_LOGTIME, @logtimeCreatePrevRBS : Win32cr::Storage::Jet::JET_LOGTIME, @ulMajor : UInt32, @ulMinor : UInt32, @cbLogicalFileSize : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_RBSREVERTINFOMISC
    property lGenMinRevertStart : Int32
    property lGenMaxRevertStart : Int32
    property lGenMinRevertEnd : Int32
    property lGenMaxRevertEnd : Int32
    property logtimeRevertFrom : Win32cr::Storage::Jet::JET_LOGTIME
    property cSecRevert : UInt64
    property cPagesReverted : UInt64
    def initialize(@lGenMinRevertStart : Int32, @lGenMaxRevertStart : Int32, @lGenMinRevertEnd : Int32, @lGenMaxRevertEnd : Int32, @logtimeRevertFrom : Win32cr::Storage::Jet::JET_LOGTIME, @cSecRevert : UInt64, @cPagesReverted : UInt64)
    end
  end
  {% end %}

  @[Extern]
  struct JET_OPERATIONCONTEXT
    property ulUserID : UInt32
    property nOperationID : UInt8
    property nOperationType : UInt8
    property nClientType : UInt8
    property fFlags : UInt8
    def initialize(@ulUserID : UInt32, @nOperationID : UInt8, @nOperationType : UInt8, @nClientType : UInt8, @fFlags : UInt8)
    end
  end

  @[Extern]
  struct JET_SETCOLUMN
    property columnid : UInt32
    property pvData : Void*
    property cbData : UInt32
    property grbit : UInt32
    property ibLongValue : UInt32
    property itagSequence : UInt32
    property err : Int32
    def initialize(@columnid : UInt32, @pvData : Void*, @cbData : UInt32, @grbit : UInt32, @ibLongValue : UInt32, @itagSequence : UInt32, @err : Int32)
    end
  end

  @[Extern]
  struct JET_SETSYSPARAM_A
    property paramid : UInt32
    property lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR
    property sz : Win32cr::Foundation::PSTR
    property err : Int32
    def initialize(@paramid : UInt32, @lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR, @sz : Win32cr::Foundation::PSTR, @err : Int32)
    end
  end

  @[Extern]
  struct JET_SETSYSPARAM_W
    property paramid : UInt32
    property lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR
    property sz : Win32cr::Foundation::PWSTR
    property err : Int32
    def initialize(@paramid : UInt32, @lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR, @sz : Win32cr::Foundation::PWSTR, @err : Int32)
    end
  end

  @[Extern]
  struct JET_RETRIEVECOLUMN
    property columnid : UInt32
    property pvData : Void*
    property cbData : UInt32
    property cbActual : UInt32
    property grbit : UInt32
    property ibLongValue : UInt32
    property itagSequence : UInt32
    property columnidNextTagged : UInt32
    property err : Int32
    def initialize(@columnid : UInt32, @pvData : Void*, @cbData : UInt32, @cbActual : UInt32, @grbit : UInt32, @ibLongValue : UInt32, @itagSequence : UInt32, @columnidNextTagged : UInt32, @err : Int32)
    end
  end

  @[Extern]
  struct JET_ENUMCOLUMNID
    property columnid : UInt32
    property ctagSequence : UInt32
    property rgtagSequence : UInt32*
    def initialize(@columnid : UInt32, @ctagSequence : UInt32, @rgtagSequence : UInt32*)
    end
  end

  @[Extern]
  struct JET_ENUMCOLUMNVALUE
    property itagSequence : UInt32
    property err : Int32
    property cbData : UInt32
    property pvData : Void*
    def initialize(@itagSequence : UInt32, @err : Int32, @cbData : UInt32, @pvData : Void*)
    end
  end

  @[Extern]
  struct JET_ENUMCOLUMN
    property columnid : UInt32
    property err : Int32
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property anonymous1 : Anonymous1_e__Struct_
    property anonymous2 : Anonymous2_e__Struct_

      # Nested Type Anonymous2_e__Struct_
      @[Extern]
      struct Anonymous2_e__Struct_
    property cbData : UInt32
    property pvData : Void*
    def initialize(@cbData : UInt32, @pvData : Void*)
    end
      end


      # Nested Type Anonymous1_e__Struct_
      @[Extern]
      struct Anonymous1_e__Struct_
    property cEnumColumnValue : UInt32
    property rgEnumColumnValue : Win32cr::Storage::Jet::JET_ENUMCOLUMNVALUE*
    def initialize(@cEnumColumnValue : UInt32, @rgEnumColumnValue : Win32cr::Storage::Jet::JET_ENUMCOLUMNVALUE*)
    end
      end

    def initialize(@anonymous1 : Anonymous1_e__Struct_, @anonymous2 : Anonymous2_e__Struct_)
    end
    end

    def initialize(@columnid : UInt32, @err : Int32, @anonymous : Anonymous_e__Union_)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_RECSIZE
    property cbData : UInt64
    property cbLongValueData : UInt64
    property cbOverhead : UInt64
    property cbLongValueOverhead : UInt64
    property cNonTaggedColumns : UInt64
    property cTaggedColumns : UInt64
    property cLongValues : UInt64
    property cMultiValues : UInt64
    def initialize(@cbData : UInt64, @cbLongValueData : UInt64, @cbOverhead : UInt64, @cbLongValueOverhead : UInt64, @cNonTaggedColumns : UInt64, @cTaggedColumns : UInt64, @cLongValues : UInt64, @cMultiValues : UInt64)
    end
  end
  {% end %}

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern]
  struct JET_RECSIZE2
    property cbData : UInt64
    property cbLongValueData : UInt64
    property cbOverhead : UInt64
    property cbLongValueOverhead : UInt64
    property cNonTaggedColumns : UInt64
    property cTaggedColumns : UInt64
    property cLongValues : UInt64
    property cMultiValues : UInt64
    property cCompressedColumns : UInt64
    property cbDataCompressed : UInt64
    property cbLongValueDataCompressed : UInt64
    def initialize(@cbData : UInt64, @cbLongValueData : UInt64, @cbOverhead : UInt64, @cbLongValueOverhead : UInt64, @cNonTaggedColumns : UInt64, @cTaggedColumns : UInt64, @cLongValues : UInt64, @cMultiValues : UInt64, @cCompressedColumns : UInt64, @cbDataCompressed : UInt64, @cbLongValueDataCompressed : UInt64)
    end
  end
  {% end %}

  @[Extern]
  struct JET_LOGINFO_A
    property cbSize : UInt32
    property ulGenLow : UInt32
    property ulGenHigh : UInt32
    property szBaseName : Win32cr::Foundation::CHAR[4]
    def initialize(@cbSize : UInt32, @ulGenLow : UInt32, @ulGenHigh : UInt32, @szBaseName : Win32cr::Foundation::CHAR[4])
    end
  end

  @[Extern]
  struct JET_LOGINFO_W
    property cbSize : UInt32
    property ulGenLow : UInt32
    property ulGenHigh : UInt32
    property szBaseName : UInt16[4]
    def initialize(@cbSize : UInt32, @ulGenLow : UInt32, @ulGenHigh : UInt32, @szBaseName : UInt16[4])
    end
  end

  @[Extern]
  struct JET_INSTANCE_INFO_A
    property hInstanceId : Win32cr::Storage::StructuredStorage::JET_INSTANCE
    property szInstanceName : Win32cr::Foundation::PSTR
    property cDatabases : Win32cr::Storage::StructuredStorage::JET_API_PTR
    property szDatabaseFileName : Int8**
    property szDatabaseDisplayName : Int8**
    property szDatabaseSLVFileName_Obsolete : Int8**
    def initialize(@hInstanceId : Win32cr::Storage::StructuredStorage::JET_INSTANCE, @szInstanceName : Win32cr::Foundation::PSTR, @cDatabases : Win32cr::Storage::StructuredStorage::JET_API_PTR, @szDatabaseFileName : Int8**, @szDatabaseDisplayName : Int8**, @szDatabaseSLVFileName_Obsolete : Int8**)
    end
  end

  @[Extern]
  struct JET_INSTANCE_INFO_W
    property hInstanceId : Win32cr::Storage::StructuredStorage::JET_INSTANCE
    property szInstanceName : Win32cr::Foundation::PWSTR
    property cDatabases : Win32cr::Storage::StructuredStorage::JET_API_PTR
    property szDatabaseFileName : UInt16**
    property szDatabaseDisplayName : UInt16**
    property szDatabaseSLVFileName_Obsolete : UInt16**
    def initialize(@hInstanceId : Win32cr::Storage::StructuredStorage::JET_INSTANCE, @szInstanceName : Win32cr::Foundation::PWSTR, @cDatabases : Win32cr::Storage::StructuredStorage::JET_API_PTR, @szDatabaseFileName : UInt16**, @szDatabaseDisplayName : UInt16**, @szDatabaseSLVFileName_Obsolete : UInt16**)
    end
  end

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_INDEXID
    property cbStruct : UInt32
    property rgbIndexId : UInt8[12]
    def initialize(@cbStruct : UInt32, @rgbIndexId : UInt8[12])
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_OBJECTINFO
    property cbStruct : UInt32
    property objtyp : UInt32
    property dtCreate : Float64
    property dtUpdate : Float64
    property grbit : UInt32
    property flags : UInt32
    property cRecord : UInt32
    property cPage : UInt32
    def initialize(@cbStruct : UInt32, @objtyp : UInt32, @dtCreate : Float64, @dtUpdate : Float64, @grbit : UInt32, @flags : UInt32, @cRecord : UInt32, @cPage : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_THREADSTATS2
    property cbStruct : UInt32
    property cPageReferenced : UInt32
    property cPageRead : UInt32
    property cPagePreread : UInt32
    property cPageDirtied : UInt32
    property cPageRedirtied : UInt32
    property cLogRecord : UInt32
    property cbLogRecord : UInt32
    property cusecPageCacheMiss : UInt64
    property cPageCacheMiss : UInt32
    def initialize(@cbStruct : UInt32, @cPageReferenced : UInt32, @cPageRead : UInt32, @cPagePreread : UInt32, @cPageDirtied : UInt32, @cPageRedirtied : UInt32, @cLogRecord : UInt32, @cbLogRecord : UInt32, @cusecPageCacheMiss : UInt64, @cPageCacheMiss : UInt32)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_COMMIT_ID
    property signLog : Win32cr::Storage::Jet::JET_SIGNATURE
    property reserved : Int32
    property commitId : Int64
    def initialize(@signLog : Win32cr::Storage::Jet::JET_SIGNATURE, @reserved : Int32, @commitId : Int64)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_RBSINFOMISC
    property lRBSGeneration : Int32
    property logtimeCreate : Win32cr::Storage::Jet::JET_LOGTIME
    property logtimeCreatePrevRBS : Win32cr::Storage::Jet::JET_LOGTIME
    property ulMajor : UInt32
    property ulMinor : UInt32
    property cbLogicalFileSize : UInt64
    def initialize(@lRBSGeneration : Int32, @logtimeCreate : Win32cr::Storage::Jet::JET_LOGTIME, @logtimeCreatePrevRBS : Win32cr::Storage::Jet::JET_LOGTIME, @ulMajor : UInt32, @ulMinor : UInt32, @cbLogicalFileSize : UInt64)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_RBSREVERTINFOMISC
    property lGenMinRevertStart : Int32
    property lGenMaxRevertStart : Int32
    property lGenMinRevertEnd : Int32
    property lGenMaxRevertEnd : Int32
    property logtimeRevertFrom : Win32cr::Storage::Jet::JET_LOGTIME
    property cSecRevert : UInt64
    property cPagesReverted : UInt64
    def initialize(@lGenMinRevertStart : Int32, @lGenMaxRevertStart : Int32, @lGenMinRevertEnd : Int32, @lGenMaxRevertEnd : Int32, @logtimeRevertFrom : Win32cr::Storage::Jet::JET_LOGTIME, @cSecRevert : UInt64, @cPagesReverted : UInt64)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_RECSIZE
    property cbData : UInt64
    property cbLongValueData : UInt64
    property cbOverhead : UInt64
    property cbLongValueOverhead : UInt64
    property cNonTaggedColumns : UInt64
    property cTaggedColumns : UInt64
    property cLongValues : UInt64
    property cMultiValues : UInt64
    def initialize(@cbData : UInt64, @cbLongValueData : UInt64, @cbOverhead : UInt64, @cbLongValueOverhead : UInt64, @cNonTaggedColumns : UInt64, @cTaggedColumns : UInt64, @cLongValues : UInt64, @cMultiValues : UInt64)
    end
  end
  {% end %}

  {% if flag?(:i386) %}
  @[Extern]
  struct JET_RECSIZE2
    property cbData : UInt64
    property cbLongValueData : UInt64
    property cbOverhead : UInt64
    property cbLongValueOverhead : UInt64
    property cNonTaggedColumns : UInt64
    property cTaggedColumns : UInt64
    property cLongValues : UInt64
    property cMultiValues : UInt64
    property cCompressedColumns : UInt64
    property cbDataCompressed : UInt64
    property cbLongValueDataCompressed : UInt64
    def initialize(@cbData : UInt64, @cbLongValueData : UInt64, @cbOverhead : UInt64, @cbLongValueOverhead : UInt64, @cNonTaggedColumns : UInt64, @cTaggedColumns : UInt64, @cLongValues : UInt64, @cMultiValues : UInt64, @cCompressedColumns : UInt64, @cbDataCompressed : UInt64, @cbLongValueDataCompressed : UInt64)
    end
  end
  {% end %}

  def jetInit(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*) : Int32
    C.JetInit(pinstance)
  end

  def jetInit2(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, grbit : UInt32) : Int32
    C.JetInit2(pinstance, grbit)
  end

  def jetInit3A(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, prstInfo : Win32cr::Storage::Jet::JET_RSTINFO_A*, grbit : UInt32) : Int32
    C.JetInit3A(pinstance, prstInfo, grbit)
  end

  def jetInit3W(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, prstInfo : Win32cr::Storage::Jet::JET_RSTINFO_W*, grbit : UInt32) : Int32
    C.JetInit3W(pinstance, prstInfo, grbit)
  end

  def jetCreateInstanceA(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : Int8*) : Int32
    C.JetCreateInstanceA(pinstance, szInstanceName)
  end

  def jetCreateInstanceW(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : UInt16*) : Int32
    C.JetCreateInstanceW(pinstance, szInstanceName)
  end

  def jetCreateInstance2A(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : Int8*, szDisplayName : Int8*, grbit : UInt32) : Int32
    C.JetCreateInstance2A(pinstance, szInstanceName, szDisplayName, grbit)
  end

  def jetCreateInstance2W(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : UInt16*, szDisplayName : UInt16*, grbit : UInt32) : Int32
    C.JetCreateInstance2W(pinstance, szInstanceName, szDisplayName, grbit)
  end

  def jetGetInstanceMiscInfo(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetInstanceMiscInfo(instance, pvResult, cbMax, info_level)
  end

  def jetTerm(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32
    C.JetTerm(instance)
  end

  def jetTerm2(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32
    C.JetTerm2(instance, grbit)
  end

  def jetStopService : Int32
    C.JetStopService
  end

  def jetStopServiceInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32
    C.JetStopServiceInstance(instance)
  end

  def jetStopServiceInstance2(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32
    C.JetStopServiceInstance2(instance, grbit)
  end

  def jetStopBackup : Int32
    C.JetStopBackup
  end

  def jetStopBackupInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32
    C.JetStopBackupInstance(instance)
  end

  def jetSetSystemParameterA(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR, szParam : Int8*) : Int32
    C.JetSetSystemParameterA(pinstance, sesid, paramid, lParam, szParam)
  end

  def jetSetSystemParameterW(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR, szParam : UInt16*) : Int32
    C.JetSetSystemParameterW(pinstance, sesid, paramid, lParam, szParam)
  end

  def jetGetSystemParameterA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, plParam : Win32cr::Storage::StructuredStorage::JET_API_PTR*, szParam : Int8*, cbMax : UInt32) : Int32
    C.JetGetSystemParameterA(instance, sesid, paramid, plParam, szParam, cbMax)
  end

  def jetGetSystemParameterW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, plParam : Win32cr::Storage::StructuredStorage::JET_API_PTR*, szParam : UInt16*, cbMax : UInt32) : Int32
    C.JetGetSystemParameterW(instance, sesid, paramid, plParam, szParam, cbMax)
  end

  def jetEnableMultiInstanceA(psetsysparam : Win32cr::Storage::Jet::JET_SETSYSPARAM_A*, csetsysparam : UInt32, pcsetsucceed : UInt32*) : Int32
    C.JetEnableMultiInstanceA(psetsysparam, csetsysparam, pcsetsucceed)
  end

  def jetEnableMultiInstanceW(psetsysparam : Win32cr::Storage::Jet::JET_SETSYSPARAM_W*, csetsysparam : UInt32, pcsetsucceed : UInt32*) : Int32
    C.JetEnableMultiInstanceW(psetsysparam, csetsysparam, pcsetsucceed)
  end

  def jetGetThreadStats(pvResult : Void*, cbMax : UInt32) : Int32
    C.JetGetThreadStats(pvResult, cbMax)
  end

  def jetBeginSessionA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, psesid : Win32cr::Storage::StructuredStorage::JET_SESID*, szUserName : Int8*, szPassword : Int8*) : Int32
    C.JetBeginSessionA(instance, psesid, szUserName, szPassword)
  end

  def jetBeginSessionW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, psesid : Win32cr::Storage::StructuredStorage::JET_SESID*, szUserName : UInt16*, szPassword : UInt16*) : Int32
    C.JetBeginSessionW(instance, psesid, szUserName, szPassword)
  end

  def jetDupSession(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, psesid : Win32cr::Storage::StructuredStorage::JET_SESID*) : Int32
    C.JetDupSession(sesid, psesid)
  end

  def jetEndSession(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32
    C.JetEndSession(sesid, grbit)
  end

  def jetGetVersion(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, pwVersion : UInt32*) : Int32
    C.JetGetVersion(sesid, pwVersion)
  end

  def jetIdle(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32
    C.JetIdle(sesid, grbit)
  end

  def jetCreateDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, szConnect : Int8*, pdbid : UInt32*, grbit : UInt32) : Int32
    C.JetCreateDatabaseA(sesid, szFilename, szConnect, pdbid, grbit)
  end

  def jetCreateDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, szConnect : UInt16*, pdbid : UInt32*, grbit : UInt32) : Int32
    C.JetCreateDatabaseW(sesid, szFilename, szConnect, pdbid, grbit)
  end

  def jetCreateDatabase2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, cpgDatabaseSizeMax : UInt32, pdbid : UInt32*, grbit : UInt32) : Int32
    C.JetCreateDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit)
  end

  def jetCreateDatabase2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, cpgDatabaseSizeMax : UInt32, pdbid : UInt32*, grbit : UInt32) : Int32
    C.JetCreateDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit)
  end

  def jetAttachDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, grbit : UInt32) : Int32
    C.JetAttachDatabaseA(sesid, szFilename, grbit)
  end

  def jetAttachDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, grbit : UInt32) : Int32
    C.JetAttachDatabaseW(sesid, szFilename, grbit)
  end

  def jetAttachDatabase2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, cpgDatabaseSizeMax : UInt32, grbit : UInt32) : Int32
    C.JetAttachDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, grbit)
  end

  def jetAttachDatabase2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, cpgDatabaseSizeMax : UInt32, grbit : UInt32) : Int32
    C.JetAttachDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, grbit)
  end

  def jetDetachDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*) : Int32
    C.JetDetachDatabaseA(sesid, szFilename)
  end

  def jetDetachDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*) : Int32
    C.JetDetachDatabaseW(sesid, szFilename)
  end

  def jetDetachDatabase2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, grbit : UInt32) : Int32
    C.JetDetachDatabase2A(sesid, szFilename, grbit)
  end

  def jetDetachDatabase2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, grbit : UInt32) : Int32
    C.JetDetachDatabase2W(sesid, szFilename, grbit)
  end

  def jetGetObjectInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, objtyp : UInt32, szContainerName : Int8*, szObjectName : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetObjectInfoA(sesid, dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, info_level)
  end

  def jetGetObjectInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, objtyp : UInt32, szContainerName : UInt16*, szObjectName : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetObjectInfoW(sesid, dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, info_level)
  end

  def jetGetTableInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetTableInfoA(sesid, tableid, pvResult, cbMax, info_level)
  end

  def jetGetTableInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetTableInfoW(sesid, tableid, pvResult, cbMax, info_level)
  end

  def jetCreateTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, lPages : UInt32, lDensity : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32
    C.JetCreateTableA(sesid, dbid, szTableName, lPages, lDensity, ptableid)
  end

  def jetCreateTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, lPages : UInt32, lDensity : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32
    C.JetCreateTableW(sesid, dbid, szTableName, lPages, lDensity, ptableid)
  end

  def jetCreateTableColumnIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE_A*) : Int32
    C.JetCreateTableColumnIndexA(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE_W*) : Int32
    C.JetCreateTableColumnIndexW(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndex2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE2_A*) : Int32
    C.JetCreateTableColumnIndex2A(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndex2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE2_W*) : Int32
    C.JetCreateTableColumnIndex2W(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndex3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE3_A*) : Int32
    C.JetCreateTableColumnIndex3A(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndex3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE3_W*) : Int32
    C.JetCreateTableColumnIndex3W(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndex4A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE4_A*) : Int32
    C.JetCreateTableColumnIndex4A(sesid, dbid, ptablecreate)
  end

  def jetCreateTableColumnIndex4W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE4_W*) : Int32
    C.JetCreateTableColumnIndex4W(sesid, dbid, ptablecreate)
  end

  def jetDeleteTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*) : Int32
    C.JetDeleteTableA(sesid, dbid, szTableName)
  end

  def jetDeleteTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*) : Int32
    C.JetDeleteTableW(sesid, dbid, szTableName)
  end

  def jetRenameTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szName : Int8*, szNameNew : Int8*) : Int32
    C.JetRenameTableA(sesid, dbid, szName, szNameNew)
  end

  def jetRenameTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szName : UInt16*, szNameNew : UInt16*) : Int32
    C.JetRenameTableW(sesid, dbid, szName, szNameNew)
  end

  def jetGetTableColumnInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetTableColumnInfoA(sesid, tableid, szColumnName, pvResult, cbMax, info_level)
  end

  def jetGetTableColumnInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetTableColumnInfoW(sesid, tableid, szColumnName, pvResult, cbMax, info_level)
  end

  def jetGetColumnInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pColumnNameOrId : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetColumnInfoA(sesid, dbid, szTableName, pColumnNameOrId, pvResult, cbMax, info_level)
  end

  def jetGetColumnInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pwColumnNameOrId : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetColumnInfoW(sesid, dbid, szTableName, pwColumnNameOrId, pvResult, cbMax, info_level)
  end

  def jetAddColumnA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*, pcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, pvDefault : Void*, cbDefault : UInt32, pcolumnid : UInt32*) : Int32
    C.JetAddColumnA(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid)
  end

  def jetAddColumnW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*, pcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, pvDefault : Void*, cbDefault : UInt32, pcolumnid : UInt32*) : Int32
    C.JetAddColumnW(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid)
  end

  def jetDeleteColumnA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*) : Int32
    C.JetDeleteColumnA(sesid, tableid, szColumnName)
  end

  def jetDeleteColumnW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*) : Int32
    C.JetDeleteColumnW(sesid, tableid, szColumnName)
  end

  def jetDeleteColumn2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*, grbit : UInt32) : Int32
    C.JetDeleteColumn2A(sesid, tableid, szColumnName, grbit)
  end

  def jetDeleteColumn2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*, grbit : UInt32) : Int32
    C.JetDeleteColumn2W(sesid, tableid, szColumnName, grbit)
  end

  def jetRenameColumnA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szName : Int8*, szNameNew : Int8*, grbit : UInt32) : Int32
    C.JetRenameColumnA(sesid, tableid, szName, szNameNew, grbit)
  end

  def jetRenameColumnW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szName : UInt16*, szNameNew : UInt16*, grbit : UInt32) : Int32
    C.JetRenameColumnW(sesid, tableid, szName, szNameNew, grbit)
  end

  def jetSetColumnDefaultValueA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, szColumnName : Int8*, pvData : Void*, cbData : UInt32, grbit : UInt32) : Int32
    C.JetSetColumnDefaultValueA(sesid, dbid, szTableName, szColumnName, pvData, cbData, grbit)
  end

  def jetSetColumnDefaultValueW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, szColumnName : UInt16*, pvData : Void*, cbData : UInt32, grbit : UInt32) : Int32
    C.JetSetColumnDefaultValueW(sesid, dbid, szTableName, szColumnName, pvData, cbData, grbit)
  end

  def jetGetTableIndexInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32
    C.JetGetTableIndexInfoA(sesid, tableid, szIndexName, pvResult, cbResult, info_level)
  end

  def jetGetTableIndexInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32
    C.JetGetTableIndexInfoW(sesid, tableid, szIndexName, pvResult, cbResult, info_level)
  end

  def jetGetIndexInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, szIndexName : Int8*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32
    C.JetGetIndexInfoA(sesid, dbid, szTableName, szIndexName, pvResult, cbResult, info_level)
  end

  def jetGetIndexInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, szIndexName : UInt16*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32
    C.JetGetIndexInfoW(sesid, dbid, szTableName, szIndexName, pvResult, cbResult, info_level)
  end

  def jetCreateIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, grbit : UInt32, szKey : Win32cr::Foundation::PSTR, cbKey : UInt32, lDensity : UInt32) : Int32
    C.JetCreateIndexA(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity)
  end

  def jetCreateIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, grbit : UInt32, szKey : Win32cr::Foundation::PWSTR, cbKey : UInt32, lDensity : UInt32) : Int32
    C.JetCreateIndexW(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity)
  end

  def jetCreateIndex2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_A*, cIndexCreate : UInt32) : Int32
    C.JetCreateIndex2A(sesid, tableid, pindexcreate, cIndexCreate)
  end

  def jetCreateIndex2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_W*, cIndexCreate : UInt32) : Int32
    C.JetCreateIndex2W(sesid, tableid, pindexcreate, cIndexCreate)
  end

  def jetCreateIndex3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_A*, cIndexCreate : UInt32) : Int32
    C.JetCreateIndex3A(sesid, tableid, pindexcreate, cIndexCreate)
  end

  def jetCreateIndex3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_W*, cIndexCreate : UInt32) : Int32
    C.JetCreateIndex3W(sesid, tableid, pindexcreate, cIndexCreate)
  end

  def jetCreateIndex4A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_A*, cIndexCreate : UInt32) : Int32
    C.JetCreateIndex4A(sesid, tableid, pindexcreate, cIndexCreate)
  end

  def jetCreateIndex4W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_W*, cIndexCreate : UInt32) : Int32
    C.JetCreateIndex4W(sesid, tableid, pindexcreate, cIndexCreate)
  end

  def jetDeleteIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*) : Int32
    C.JetDeleteIndexA(sesid, tableid, szIndexName)
  end

  def jetDeleteIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*) : Int32
    C.JetDeleteIndexW(sesid, tableid, szIndexName)
  end

  def jetBeginTransaction(sesid : Win32cr::Storage::StructuredStorage::JET_SESID) : Int32
    C.JetBeginTransaction(sesid)
  end

  def jetBeginTransaction2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32
    C.JetBeginTransaction2(sesid, grbit)
  end

  def jetBeginTransaction3(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, trxid : Int64, grbit : UInt32) : Int32
    C.JetBeginTransaction3(sesid, trxid, grbit)
  end

  def jetCommitTransaction(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32
    C.JetCommitTransaction(sesid, grbit)
  end

  def jetCommitTransaction2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32, cmsecDurableCommit : UInt32, pCommitId : Win32cr::Storage::Jet::JET_COMMIT_ID*) : Int32
    C.JetCommitTransaction2(sesid, grbit, cmsecDurableCommit, pCommitId)
  end

  def jetRollback(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32
    C.JetRollback(sesid, grbit)
  end

  def jetGetDatabaseInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetDatabaseInfoA(sesid, dbid, pvResult, cbMax, info_level)
  end

  def jetGetDatabaseInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetDatabaseInfoW(sesid, dbid, pvResult, cbMax, info_level)
  end

  def jetGetDatabaseFileInfoA(szDatabaseName : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetDatabaseFileInfoA(szDatabaseName, pvResult, cbMax, info_level)
  end

  def jetGetDatabaseFileInfoW(szDatabaseName : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetDatabaseFileInfoW(szDatabaseName, pvResult, cbMax, info_level)
  end

  def jetOpenDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, szConnect : Int8*, pdbid : UInt32*, grbit : UInt32) : Int32
    C.JetOpenDatabaseA(sesid, szFilename, szConnect, pdbid, grbit)
  end

  def jetOpenDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, szConnect : UInt16*, pdbid : UInt32*, grbit : UInt32) : Int32
    C.JetOpenDatabaseW(sesid, szFilename, szConnect, pdbid, grbit)
  end

  def jetCloseDatabase(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, grbit : UInt32) : Int32
    C.JetCloseDatabase(sesid, dbid, grbit)
  end

  def jetOpenTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pvParameters : Void*, cbParameters : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32
    C.JetOpenTableA(sesid, dbid, szTableName, pvParameters, cbParameters, grbit, ptableid)
  end

  def jetOpenTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pvParameters : Void*, cbParameters : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32
    C.JetOpenTableW(sesid, dbid, szTableName, pvParameters, cbParameters, grbit, ptableid)
  end

  def jetSetTableSequential(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32
    C.JetSetTableSequential(sesid, tableid, grbit)
  end

  def jetResetTableSequential(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32
    C.JetResetTableSequential(sesid, tableid, grbit)
  end

  def jetCloseTable(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID) : Int32
    C.JetCloseTable(sesid, tableid)
  end

  def jetDelete(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID) : Int32
    C.JetDelete(sesid, tableid)
  end

  def jetUpdate(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbBookmark : UInt32, pcbActual : UInt32*) : Int32
    C.JetUpdate(sesid, tableid, pvBookmark, cbBookmark, pcbActual)
  end

  def jetUpdate2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbBookmark : UInt32, pcbActual : UInt32*, grbit : UInt32) : Int32
    C.JetUpdate2(sesid, tableid, pvBookmark, cbBookmark, pcbActual, grbit)
  end

  def jetEscrowUpdate(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, columnid : UInt32, pv : Void*, cbMax : UInt32, pvOld : Void*, cbOldMax : UInt32, pcbOldActual : UInt32*, grbit : UInt32) : Int32
    C.JetEscrowUpdate(sesid, tableid, columnid, pv, cbMax, pvOld, cbOldMax, pcbOldActual, grbit)
  end

  def jetRetrieveColumn(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, columnid : UInt32, pvData : Void*, cbData : UInt32, pcbActual : UInt32*, grbit : UInt32, pretinfo : Win32cr::Storage::Jet::JET_RETINFO*) : Int32
    C.JetRetrieveColumn(sesid, tableid, columnid, pvData, cbData, pcbActual, grbit, pretinfo)
  end

  def jetRetrieveColumns(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pretrievecolumn : Win32cr::Storage::Jet::JET_RETRIEVECOLUMN*, cretrievecolumn : UInt32) : Int32
    C.JetRetrieveColumns(sesid, tableid, pretrievecolumn, cretrievecolumn)
  end

  def jetEnumerateColumns(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cEnumColumnId : UInt32, rgEnumColumnId : Win32cr::Storage::Jet::JET_ENUMCOLUMNID*, pcEnumColumn : UInt32*, prgEnumColumn : Win32cr::Storage::Jet::JET_ENUMCOLUMN**, pfnRealloc : Win32cr::Storage::Jet::JET_PFNREALLOC, pvReallocContext : Void*, cbDataMost : UInt32, grbit : UInt32) : Int32
    C.JetEnumerateColumns(sesid, tableid, cEnumColumnId, rgEnumColumnId, pcEnumColumn, prgEnumColumn, pfnRealloc, pvReallocContext, cbDataMost, grbit)
  end

  def jetGetRecordSize(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precsize : Win32cr::Storage::Jet::JET_RECSIZE*, grbit : UInt32) : Int32
    C.JetGetRecordSize(sesid, tableid, precsize, grbit)
  end

  def jetGetRecordSize2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precsize : Win32cr::Storage::Jet::JET_RECSIZE2*, grbit : UInt32) : Int32
    C.JetGetRecordSize2(sesid, tableid, precsize, grbit)
  end

  def jetSetColumn(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, columnid : UInt32, pvData : Void*, cbData : UInt32, grbit : UInt32, psetinfo : Win32cr::Storage::Jet::JET_SETINFO*) : Int32
    C.JetSetColumn(sesid, tableid, columnid, pvData, cbData, grbit, psetinfo)
  end

  def jetSetColumns(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, psetcolumn : Win32cr::Storage::Jet::JET_SETCOLUMN*, csetcolumn : UInt32) : Int32
    C.JetSetColumns(sesid, tableid, psetcolumn, csetcolumn)
  end

  def jetPrepareUpdate(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, prep : UInt32) : Int32
    C.JetPrepareUpdate(sesid, tableid, prep)
  end

  def jetGetRecordPosition(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precpos : Win32cr::Storage::Jet::JET_RECPOS*, cbRecpos : UInt32) : Int32
    C.JetGetRecordPosition(sesid, tableid, precpos, cbRecpos)
  end

  def jetGotoPosition(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precpos : Win32cr::Storage::Jet::JET_RECPOS*) : Int32
    C.JetGotoPosition(sesid, tableid, precpos)
  end

  def jetGetCursorInfo(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32
    C.JetGetCursorInfo(sesid, tableid, pvResult, cbMax, info_level)
  end

  def jetDupCursor(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, grbit : UInt32) : Int32
    C.JetDupCursor(sesid, tableid, ptableid, grbit)
  end

  def jetGetCurrentIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, cbIndexName : UInt32) : Int32
    C.JetGetCurrentIndexA(sesid, tableid, szIndexName, cbIndexName)
  end

  def jetGetCurrentIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, cbIndexName : UInt32) : Int32
    C.JetGetCurrentIndexW(sesid, tableid, szIndexName, cbIndexName)
  end

  def jetSetCurrentIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*) : Int32
    C.JetSetCurrentIndexA(sesid, tableid, szIndexName)
  end

  def jetSetCurrentIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*) : Int32
    C.JetSetCurrentIndexW(sesid, tableid, szIndexName)
  end

  def jetSetCurrentIndex2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, grbit : UInt32) : Int32
    C.JetSetCurrentIndex2A(sesid, tableid, szIndexName, grbit)
  end

  def jetSetCurrentIndex2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, grbit : UInt32) : Int32
    C.JetSetCurrentIndex2W(sesid, tableid, szIndexName, grbit)
  end

  def jetSetCurrentIndex3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, grbit : UInt32, itagSequence : UInt32) : Int32
    C.JetSetCurrentIndex3A(sesid, tableid, szIndexName, grbit, itagSequence)
  end

  def jetSetCurrentIndex3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, grbit : UInt32, itagSequence : UInt32) : Int32
    C.JetSetCurrentIndex3W(sesid, tableid, szIndexName, grbit, itagSequence)
  end

  def jetSetCurrentIndex4A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, pindexid : Win32cr::Storage::Jet::JET_INDEXID*, grbit : UInt32, itagSequence : UInt32) : Int32
    C.JetSetCurrentIndex4A(sesid, tableid, szIndexName, pindexid, grbit, itagSequence)
  end

  def jetSetCurrentIndex4W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, pindexid : Win32cr::Storage::Jet::JET_INDEXID*, grbit : UInt32, itagSequence : UInt32) : Int32
    C.JetSetCurrentIndex4W(sesid, tableid, szIndexName, pindexid, grbit, itagSequence)
  end

  def jetMove(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cRow : Int32, grbit : UInt32) : Int32
    C.JetMove(sesid, tableid, cRow, grbit)
  end

  def jetSetCursorFilter(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, rgColumnFilters : Win32cr::Storage::Jet::JET_INDEX_COLUMN*, cColumnFilters : UInt32, grbit : UInt32) : Int32
    C.JetSetCursorFilter(sesid, tableid, rgColumnFilters, cColumnFilters, grbit)
  end

  def jetGetLock(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32
    C.JetGetLock(sesid, tableid, grbit)
  end

  def jetMakeKey(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvData : Void*, cbData : UInt32, grbit : UInt32) : Int32
    C.JetMakeKey(sesid, tableid, pvData, cbData, grbit)
  end

  def jetSeek(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32
    C.JetSeek(sesid, tableid, grbit)
  end

  def jetPrereadKeys(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, rgpvKeys : Void**, rgcbKeys : UInt32*, ckeys : Int32, pckeysPreread : Int32*, grbit : UInt32) : Int32
    C.JetPrereadKeys(sesid, tableid, rgpvKeys, rgcbKeys, ckeys, pckeysPreread, grbit)
  end

  def jetPrereadIndexRanges(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, rgIndexRanges : Win32cr::Storage::Jet::JET_INDEX_RANGE*, cIndexRanges : UInt32, pcRangesPreread : UInt32*, rgcolumnidPreread : UInt32*, ccolumnidPreread : UInt32, grbit : UInt32) : Int32
    C.JetPrereadIndexRanges(sesid, tableid, rgIndexRanges, cIndexRanges, pcRangesPreread, rgcolumnidPreread, ccolumnidPreread, grbit)
  end

  def jetGetBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetBookmark(sesid, tableid, pvBookmark, cbMax, pcbActual)
  end

  def jetGetSecondaryIndexBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvSecondaryKey : Void*, cbSecondaryKeyMax : UInt32, pcbSecondaryKeyActual : UInt32*, pvPrimaryBookmark : Void*, cbPrimaryBookmarkMax : UInt32, pcbPrimaryBookmarkActual : UInt32*, grbit : UInt32) : Int32
    C.JetGetSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKeyMax, pcbSecondaryKeyActual, pvPrimaryBookmark, cbPrimaryBookmarkMax, pcbPrimaryBookmarkActual, grbit)
  end

  def jetCompactA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseSrc : Int8*, szDatabaseDest : Int8*, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS, pconvert : Win32cr::Storage::Jet::CONVERT_A*, grbit : UInt32) : Int32
    C.JetCompactA(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit)
  end

  def jetCompactW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseSrc : UInt16*, szDatabaseDest : UInt16*, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS, pconvert : Win32cr::Storage::Jet::CONVERT_W*, grbit : UInt32) : Int32
    C.JetCompactW(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit)
  end

  def jetDefragmentA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pcPasses : UInt32*, pcSeconds : UInt32*, grbit : UInt32) : Int32
    C.JetDefragmentA(sesid, dbid, szTableName, pcPasses, pcSeconds, grbit)
  end

  def jetDefragmentW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pcPasses : UInt32*, pcSeconds : UInt32*, grbit : UInt32) : Int32
    C.JetDefragmentW(sesid, dbid, szTableName, pcPasses, pcSeconds, grbit)
  end

  def jetDefragment2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, grbit : UInt32) : Int32
    C.JetDefragment2A(sesid, dbid, szTableName, pcPasses, pcSeconds, callback, grbit)
  end

  def jetDefragment2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, grbit : UInt32) : Int32
    C.JetDefragment2W(sesid, dbid, szTableName, pcPasses, pcSeconds, callback, grbit)
  end

  def jetDefragment3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : Int8*, szTableName : Int8*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, pvContext : Void*, grbit : UInt32) : Int32
    C.JetDefragment3A(sesid, szDatabaseName, szTableName, pcPasses, pcSeconds, callback, pvContext, grbit)
  end

  def jetDefragment3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : UInt16*, szTableName : UInt16*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, pvContext : Void*, grbit : UInt32) : Int32
    C.JetDefragment3W(sesid, szDatabaseName, szTableName, pcPasses, pcSeconds, callback, pvContext, grbit)
  end

  def jetSetDatabaseSizeA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : Int8*, cpg : UInt32, pcpgReal : UInt32*) : Int32
    C.JetSetDatabaseSizeA(sesid, szDatabaseName, cpg, pcpgReal)
  end

  def jetSetDatabaseSizeW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : UInt16*, cpg : UInt32, pcpgReal : UInt32*) : Int32
    C.JetSetDatabaseSizeW(sesid, szDatabaseName, cpg, pcpgReal)
  end

  def jetGrowDatabase(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, cpg : UInt32, pcpgReal : UInt32*) : Int32
    C.JetGrowDatabase(sesid, dbid, cpg, pcpgReal)
  end

  def jetResizeDatabase(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, cpgTarget : UInt32, pcpgActual : UInt32*, grbit : UInt32) : Int32
    C.JetResizeDatabase(sesid, dbid, cpgTarget, pcpgActual, grbit)
  end

  def jetSetSessionContext(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, ulContext : Win32cr::Storage::StructuredStorage::JET_API_PTR) : Int32
    C.JetSetSessionContext(sesid, ulContext)
  end

  def jetResetSessionContext(sesid : Win32cr::Storage::StructuredStorage::JET_SESID) : Int32
    C.JetResetSessionContext(sesid)
  end

  def jetGotoBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbBookmark : UInt32) : Int32
    C.JetGotoBookmark(sesid, tableid, pvBookmark, cbBookmark)
  end

  def jetGotoSecondaryIndexBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvSecondaryKey : Void*, cbSecondaryKey : UInt32, pvPrimaryBookmark : Void*, cbPrimaryBookmark : UInt32, grbit : UInt32) : Int32
    C.JetGotoSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKey, pvPrimaryBookmark, cbPrimaryBookmark, grbit)
  end

  def jetIntersectIndexes(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, rgindexrange : Win32cr::Storage::Jet::JET_INDEXRANGE*, cindexrange : UInt32, precordlist : Win32cr::Storage::Jet::JET_RECORDLIST*, grbit : UInt32) : Int32
    C.JetIntersectIndexes(sesid, rgindexrange, cindexrange, precordlist, grbit)
  end

  def jetComputeStats(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID) : Int32
    C.JetComputeStats(sesid, tableid)
  end

  def jetOpenTempTable(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, ccolumn : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, prgcolumnid : UInt32*) : Int32
    C.JetOpenTempTable(sesid, prgcolumndef, ccolumn, grbit, ptableid, prgcolumnid)
  end

  def jetOpenTempTable2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, ccolumn : UInt32, lcid : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, prgcolumnid : UInt32*) : Int32
    C.JetOpenTempTable2(sesid, prgcolumndef, ccolumn, lcid, grbit, ptableid, prgcolumnid)
  end

  def jetOpenTempTable3(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, ccolumn : UInt32, pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, prgcolumnid : UInt32*) : Int32
    C.JetOpenTempTable3(sesid, prgcolumndef, ccolumn, pidxunicode, grbit, ptableid, prgcolumnid)
  end

  def jetOpenTemporaryTable(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, popentemporarytable : Win32cr::Storage::Jet::JET_OPENTEMPORARYTABLE*) : Int32
    C.JetOpenTemporaryTable(sesid, popentemporarytable)
  end

  def jetOpenTemporaryTable2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, popentemporarytable : Win32cr::Storage::Jet::JET_OPENTEMPORARYTABLE2*) : Int32
    C.JetOpenTemporaryTable2(sesid, popentemporarytable)
  end

  def jetBackupA(szBackupPath : Int8*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetBackupA(szBackupPath, grbit, pfnStatus)
  end

  def jetBackupW(szBackupPath : UInt16*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetBackupW(szBackupPath, grbit, pfnStatus)
  end

  def jetBackupInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szBackupPath : Int8*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetBackupInstanceA(instance, szBackupPath, grbit, pfnStatus)
  end

  def jetBackupInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szBackupPath : UInt16*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetBackupInstanceW(instance, szBackupPath, grbit, pfnStatus)
  end

  def jetRestoreA(szSource : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetRestoreA(szSource, pfn)
  end

  def jetRestoreW(szSource : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetRestoreW(szSource, pfn)
  end

  def jetRestore2A(sz : Int8*, szDest : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetRestore2A(sz, szDest, pfn)
  end

  def jetRestore2W(sz : UInt16*, szDest : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetRestore2W(sz, szDest, pfn)
  end

  def jetRestoreInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sz : Int8*, szDest : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetRestoreInstanceA(instance, sz, szDest, pfn)
  end

  def jetRestoreInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sz : UInt16*, szDest : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetRestoreInstanceW(instance, sz, szDest, pfn)
  end

  def jetSetIndexRange(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableidSrc : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32
    C.JetSetIndexRange(sesid, tableidSrc, grbit)
  end

  def jetIndexRecordCount(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pcrec : UInt32*, crecMax : UInt32) : Int32
    C.JetIndexRecordCount(sesid, tableid, pcrec, crecMax)
  end

  def jetRetrieveKey(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvKey : Void*, cbMax : UInt32, pcbActual : UInt32*, grbit : UInt32) : Int32
    C.JetRetrieveKey(sesid, tableid, pvKey, cbMax, pcbActual, grbit)
  end

  def jetBeginExternalBackup(grbit : UInt32) : Int32
    C.JetBeginExternalBackup(grbit)
  end

  def jetBeginExternalBackupInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32
    C.JetBeginExternalBackupInstance(instance, grbit)
  end

  def jetGetAttachInfoA(szzDatabases : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetAttachInfoA(szzDatabases, cbMax, pcbActual)
  end

  def jetGetAttachInfoW(wszzDatabases : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetAttachInfoW(wszzDatabases, cbMax, pcbActual)
  end

  def jetGetAttachInfoInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzDatabases : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetAttachInfoInstanceA(instance, szzDatabases, cbMax, pcbActual)
  end

  def jetGetAttachInfoInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzDatabases : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetAttachInfoInstanceW(instance, szzDatabases, cbMax, pcbActual)
  end

  def jetOpenFileA(szFileName : Int8*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32
    C.JetOpenFileA(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh)
  end

  def jetOpenFileW(szFileName : UInt16*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32
    C.JetOpenFileW(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh)
  end

  def jetOpenFileInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szFileName : Int8*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32
    C.JetOpenFileInstanceA(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh)
  end

  def jetOpenFileInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szFileName : UInt16*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32
    C.JetOpenFileInstanceW(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh)
  end

  def jetReadFile(hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE, pv : Void*, cb : UInt32, pcbActual : UInt32*) : Int32
    C.JetReadFile(hfFile, pv, cb, pcbActual)
  end

  def jetReadFileInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE, pv : Void*, cb : UInt32, pcbActual : UInt32*) : Int32
    C.JetReadFileInstance(instance, hfFile, pv, cb, pcbActual)
  end

  def jetCloseFile(hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE) : Int32
    C.JetCloseFile(hfFile)
  end

  def jetCloseFileInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE) : Int32
    C.JetCloseFileInstance(instance, hfFile)
  end

  def jetGetLogInfoA(szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetLogInfoA(szzLogs, cbMax, pcbActual)
  end

  def jetGetLogInfoW(szzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetLogInfoW(szzLogs, cbMax, pcbActual)
  end

  def jetGetLogInfoInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual)
  end

  def jetGetLogInfoInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, wszzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual)
  end

  def jetGetLogInfoInstance2A(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_A*) : Int32
    C.JetGetLogInfoInstance2A(instance, szzLogs, cbMax, pcbActual, pLogInfo)
  end

  def jetGetLogInfoInstance2W(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, wszzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_W*) : Int32
    C.JetGetLogInfoInstance2W(instance, wszzLogs, cbMax, pcbActual, pLogInfo)
  end

  def jetGetTruncateLogInfoInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetTruncateLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual)
  end

  def jetGetTruncateLogInfoInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, wszzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32
    C.JetGetTruncateLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual)
  end

  def jetTruncateLog : Int32
    C.JetTruncateLog
  end

  def jetTruncateLogInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32
    C.JetTruncateLogInstance(instance)
  end

  def jetEndExternalBackup : Int32
    C.JetEndExternalBackup
  end

  def jetEndExternalBackupInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32
    C.JetEndExternalBackupInstance(instance)
  end

  def jetEndExternalBackupInstance2(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32
    C.JetEndExternalBackupInstance2(instance, grbit)
  end

  def jetExternalRestoreA(szCheckpointFilePath : Int8*, szLogPath : Int8*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_A*, crstfilemap : Int32, szBackupLogPath : Int8*, genLow : Int32, genHigh : Int32, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetExternalRestoreA(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, pfn)
  end

  def jetExternalRestoreW(szCheckpointFilePath : UInt16*, szLogPath : UInt16*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_W*, crstfilemap : Int32, szBackupLogPath : UInt16*, genLow : Int32, genHigh : Int32, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetExternalRestoreW(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, pfn)
  end

  def jetExternalRestore2A(szCheckpointFilePath : Int8*, szLogPath : Int8*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_A*, crstfilemap : Int32, szBackupLogPath : Int8*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_A*, szTargetInstanceName : Int8*, szTargetInstanceLogPath : Int8*, szTargetInstanceCheckpointPath : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetExternalRestore2A(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, pfn)
  end

  def jetExternalRestore2W(szCheckpointFilePath : UInt16*, szLogPath : UInt16*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_W*, crstfilemap : Int32, szBackupLogPath : UInt16*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_W*, szTargetInstanceName : UInt16*, szTargetInstanceLogPath : UInt16*, szTargetInstanceCheckpointPath : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32
    C.JetExternalRestore2W(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, pfn)
  end

  def jetRegisterCallback(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cbtyp : UInt32, pCallback : Win32cr::Storage::Jet::JET_CALLBACK, pvContext : Void*, phCallbackId : Win32cr::Storage::StructuredStorage::JET_HANDLE*) : Int32
    C.JetRegisterCallback(sesid, tableid, cbtyp, pCallback, pvContext, phCallbackId)
  end

  def jetUnregisterCallback(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cbtyp : UInt32, hCallbackId : Win32cr::Storage::StructuredStorage::JET_HANDLE) : Int32
    C.JetUnregisterCallback(sesid, tableid, cbtyp, hCallbackId)
  end

  def jetGetInstanceInfoA(pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_A**) : Int32
    C.JetGetInstanceInfoA(pcInstanceInfo, paInstanceInfo)
  end

  def jetGetInstanceInfoW(pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_W**) : Int32
    C.JetGetInstanceInfoW(pcInstanceInfo, paInstanceInfo)
  end

  def jetFreeBuffer(pbBuf : Win32cr::Foundation::PSTR) : Int32
    C.JetFreeBuffer(pbBuf)
  end

  def jetSetLS(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, ls : Win32cr::Storage::Jet::JET_LS, grbit : UInt32) : Int32
    C.JetSetLS(sesid, tableid, ls, grbit)
  end

  def jetGetLS(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pls : Win32cr::Storage::Jet::JET_LS*, grbit : UInt32) : Int32
    C.JetGetLS(sesid, tableid, pls, grbit)
  end

  def jetOSSnapshotPrepare(psnapId : Win32cr::Storage::Jet::JET_OSSNAPID*, grbit : UInt32) : Int32
    C.JetOSSnapshotPrepare(psnapId, grbit)
  end

  def jetOSSnapshotPrepareInstance(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32
    C.JetOSSnapshotPrepareInstance(snapId, instance, grbit)
  end

  def jetOSSnapshotFreezeA(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_A**, grbit : UInt32) : Int32
    C.JetOSSnapshotFreezeA(snapId, pcInstanceInfo, paInstanceInfo, grbit)
  end

  def jetOSSnapshotFreezeW(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_W**, grbit : UInt32) : Int32
    C.JetOSSnapshotFreezeW(snapId, pcInstanceInfo, paInstanceInfo, grbit)
  end

  def jetOSSnapshotThaw(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32
    C.JetOSSnapshotThaw(snapId, grbit)
  end

  def jetOSSnapshotAbort(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32
    C.JetOSSnapshotAbort(snapId, grbit)
  end

  def jetOSSnapshotTruncateLog(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32
    C.JetOSSnapshotTruncateLog(snapId, grbit)
  end

  def jetOSSnapshotTruncateLogInstance(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32
    C.JetOSSnapshotTruncateLogInstance(snapId, instance, grbit)
  end

  def jetOSSnapshotGetFreezeInfoA(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_A**, grbit : UInt32) : Int32
    C.JetOSSnapshotGetFreezeInfoA(snapId, pcInstanceInfo, paInstanceInfo, grbit)
  end

  def jetOSSnapshotGetFreezeInfoW(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_W**, grbit : UInt32) : Int32
    C.JetOSSnapshotGetFreezeInfoW(snapId, pcInstanceInfo, paInstanceInfo, grbit)
  end

  def jetOSSnapshotEnd(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32
    C.JetOSSnapshotEnd(snapId, grbit)
  end

  def jetConfigureProcessForCrashDump(grbit : UInt32) : Int32
    C.JetConfigureProcessForCrashDump(grbit)
  end

  def jetGetErrorInfoW(pvContext : Void*, pvResult : Void*, cbMax : UInt32, info_level : UInt32, grbit : UInt32) : Int32
    C.JetGetErrorInfoW(pvContext, pvResult, cbMax, info_level, grbit)
  end

  def jetSetSessionParameter(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, sesparamid : UInt32, pvParam : Void*, cbParam : UInt32) : Int32
    C.JetSetSessionParameter(sesid, sesparamid, pvParam, cbParam)
  end

  def jetGetSessionParameter(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, sesparamid : UInt32, pvParam : Void*, cbParamMax : UInt32, pcbParamActual : UInt32*) : Int32
    C.JetGetSessionParameter(sesid, sesparamid, pvParam, cbParamMax, pcbParamActual)
  end

  @[Link("esent")]
  lib C
    # :nodoc:
    fun JetInit(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*) : Int32

    # :nodoc:
    fun JetInit2(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetInit3A(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, prstInfo : Win32cr::Storage::Jet::JET_RSTINFO_A*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetInit3W(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, prstInfo : Win32cr::Storage::Jet::JET_RSTINFO_W*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCreateInstanceA(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : Int8*) : Int32

    # :nodoc:
    fun JetCreateInstanceW(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : UInt16*) : Int32

    # :nodoc:
    fun JetCreateInstance2A(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : Int8*, szDisplayName : Int8*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCreateInstance2W(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, szInstanceName : UInt16*, szDisplayName : UInt16*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetInstanceMiscInfo(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetTerm(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32

    # :nodoc:
    fun JetTerm2(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32

    # :nodoc:
    fun JetStopService : Int32

    # :nodoc:
    fun JetStopServiceInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32

    # :nodoc:
    fun JetStopServiceInstance2(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32

    # :nodoc:
    fun JetStopBackup : Int32

    # :nodoc:
    fun JetStopBackupInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32

    # :nodoc:
    fun JetSetSystemParameterA(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR, szParam : Int8*) : Int32

    # :nodoc:
    fun JetSetSystemParameterW(pinstance : Win32cr::Storage::StructuredStorage::JET_INSTANCE*, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, lParam : Win32cr::Storage::StructuredStorage::JET_API_PTR, szParam : UInt16*) : Int32

    # :nodoc:
    fun JetGetSystemParameterA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, plParam : Win32cr::Storage::StructuredStorage::JET_API_PTR*, szParam : Int8*, cbMax : UInt32) : Int32

    # :nodoc:
    fun JetGetSystemParameterW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sesid : Win32cr::Storage::StructuredStorage::JET_SESID, paramid : UInt32, plParam : Win32cr::Storage::StructuredStorage::JET_API_PTR*, szParam : UInt16*, cbMax : UInt32) : Int32

    # :nodoc:
    fun JetEnableMultiInstanceA(psetsysparam : Win32cr::Storage::Jet::JET_SETSYSPARAM_A*, csetsysparam : UInt32, pcsetsucceed : UInt32*) : Int32

    # :nodoc:
    fun JetEnableMultiInstanceW(psetsysparam : Win32cr::Storage::Jet::JET_SETSYSPARAM_W*, csetsysparam : UInt32, pcsetsucceed : UInt32*) : Int32

    # :nodoc:
    fun JetGetThreadStats(pvResult : Void*, cbMax : UInt32) : Int32

    # :nodoc:
    fun JetBeginSessionA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, psesid : Win32cr::Storage::StructuredStorage::JET_SESID*, szUserName : Int8*, szPassword : Int8*) : Int32

    # :nodoc:
    fun JetBeginSessionW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, psesid : Win32cr::Storage::StructuredStorage::JET_SESID*, szUserName : UInt16*, szPassword : UInt16*) : Int32

    # :nodoc:
    fun JetDupSession(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, psesid : Win32cr::Storage::StructuredStorage::JET_SESID*) : Int32

    # :nodoc:
    fun JetEndSession(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetVersion(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, pwVersion : UInt32*) : Int32

    # :nodoc:
    fun JetIdle(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCreateDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, szConnect : Int8*, pdbid : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCreateDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, szConnect : UInt16*, pdbid : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCreateDatabase2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, cpgDatabaseSizeMax : UInt32, pdbid : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCreateDatabase2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, cpgDatabaseSizeMax : UInt32, pdbid : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetAttachDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetAttachDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetAttachDatabase2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, cpgDatabaseSizeMax : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetAttachDatabase2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, cpgDatabaseSizeMax : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDetachDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*) : Int32

    # :nodoc:
    fun JetDetachDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*) : Int32

    # :nodoc:
    fun JetDetachDatabase2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDetachDatabase2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetObjectInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, objtyp : UInt32, szContainerName : Int8*, szObjectName : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetObjectInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, objtyp : UInt32, szContainerName : UInt16*, szObjectName : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetTableInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetTableInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetCreateTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, lPages : UInt32, lDensity : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32

    # :nodoc:
    fun JetCreateTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, lPages : UInt32, lDensity : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE_A*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE_W*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndex2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE2_A*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndex2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE2_W*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndex3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE3_A*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndex3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE3_W*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndex4A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE4_A*) : Int32

    # :nodoc:
    fun JetCreateTableColumnIndex4W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, ptablecreate : Win32cr::Storage::Jet::JET_TABLECREATE4_W*) : Int32

    # :nodoc:
    fun JetDeleteTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*) : Int32

    # :nodoc:
    fun JetDeleteTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*) : Int32

    # :nodoc:
    fun JetRenameTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szName : Int8*, szNameNew : Int8*) : Int32

    # :nodoc:
    fun JetRenameTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szName : UInt16*, szNameNew : UInt16*) : Int32

    # :nodoc:
    fun JetGetTableColumnInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetTableColumnInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetColumnInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pColumnNameOrId : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetColumnInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pwColumnNameOrId : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetAddColumnA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*, pcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, pvDefault : Void*, cbDefault : UInt32, pcolumnid : UInt32*) : Int32

    # :nodoc:
    fun JetAddColumnW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*, pcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, pvDefault : Void*, cbDefault : UInt32, pcolumnid : UInt32*) : Int32

    # :nodoc:
    fun JetDeleteColumnA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*) : Int32

    # :nodoc:
    fun JetDeleteColumnW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*) : Int32

    # :nodoc:
    fun JetDeleteColumn2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : Int8*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDeleteColumn2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szColumnName : UInt16*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetRenameColumnA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szName : Int8*, szNameNew : Int8*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetRenameColumnW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szName : UInt16*, szNameNew : UInt16*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetColumnDefaultValueA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, szColumnName : Int8*, pvData : Void*, cbData : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetColumnDefaultValueW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, szColumnName : UInt16*, pvData : Void*, cbData : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetTableIndexInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetTableIndexInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetIndexInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, szIndexName : Int8*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetIndexInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, szIndexName : UInt16*, pvResult : Void*, cbResult : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, grbit : UInt32, szKey : Win32cr::Foundation::PSTR, cbKey : UInt32, lDensity : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, grbit : UInt32, szKey : Win32cr::Foundation::PWSTR, cbKey : UInt32, lDensity : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndex2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_A*, cIndexCreate : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndex2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE_W*, cIndexCreate : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndex3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_A*, cIndexCreate : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndex3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE2_W*, cIndexCreate : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndex4A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_A*, cIndexCreate : UInt32) : Int32

    # :nodoc:
    fun JetCreateIndex4W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pindexcreate : Win32cr::Storage::Jet::JET_INDEXCREATE3_W*, cIndexCreate : UInt32) : Int32

    # :nodoc:
    fun JetDeleteIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*) : Int32

    # :nodoc:
    fun JetDeleteIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*) : Int32

    # :nodoc:
    fun JetBeginTransaction(sesid : Win32cr::Storage::StructuredStorage::JET_SESID) : Int32

    # :nodoc:
    fun JetBeginTransaction2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetBeginTransaction3(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, trxid : Int64, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCommitTransaction(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCommitTransaction2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32, cmsecDurableCommit : UInt32, pCommitId : Win32cr::Storage::Jet::JET_COMMIT_ID*) : Int32

    # :nodoc:
    fun JetRollback(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetDatabaseInfoA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetDatabaseInfoW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetDatabaseFileInfoA(szDatabaseName : Int8*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetGetDatabaseFileInfoW(szDatabaseName : UInt16*, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetOpenDatabaseA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : Int8*, szConnect : Int8*, pdbid : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOpenDatabaseW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szFilename : UInt16*, szConnect : UInt16*, pdbid : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCloseDatabase(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOpenTableA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pvParameters : Void*, cbParameters : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32

    # :nodoc:
    fun JetOpenTableW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pvParameters : Void*, cbParameters : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*) : Int32

    # :nodoc:
    fun JetSetTableSequential(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetResetTableSequential(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCloseTable(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID) : Int32

    # :nodoc:
    fun JetDelete(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID) : Int32

    # :nodoc:
    fun JetUpdate(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbBookmark : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetUpdate2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbBookmark : UInt32, pcbActual : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetEscrowUpdate(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, columnid : UInt32, pv : Void*, cbMax : UInt32, pvOld : Void*, cbOldMax : UInt32, pcbOldActual : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetRetrieveColumn(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, columnid : UInt32, pvData : Void*, cbData : UInt32, pcbActual : UInt32*, grbit : UInt32, pretinfo : Win32cr::Storage::Jet::JET_RETINFO*) : Int32

    # :nodoc:
    fun JetRetrieveColumns(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pretrievecolumn : Win32cr::Storage::Jet::JET_RETRIEVECOLUMN*, cretrievecolumn : UInt32) : Int32

    # :nodoc:
    fun JetEnumerateColumns(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cEnumColumnId : UInt32, rgEnumColumnId : Win32cr::Storage::Jet::JET_ENUMCOLUMNID*, pcEnumColumn : UInt32*, prgEnumColumn : Win32cr::Storage::Jet::JET_ENUMCOLUMN**, pfnRealloc : Win32cr::Storage::Jet::JET_PFNREALLOC, pvReallocContext : Void*, cbDataMost : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetRecordSize(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precsize : Win32cr::Storage::Jet::JET_RECSIZE*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetRecordSize2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precsize : Win32cr::Storage::Jet::JET_RECSIZE2*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetColumn(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, columnid : UInt32, pvData : Void*, cbData : UInt32, grbit : UInt32, psetinfo : Win32cr::Storage::Jet::JET_SETINFO*) : Int32

    # :nodoc:
    fun JetSetColumns(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, psetcolumn : Win32cr::Storage::Jet::JET_SETCOLUMN*, csetcolumn : UInt32) : Int32

    # :nodoc:
    fun JetPrepareUpdate(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, prep : UInt32) : Int32

    # :nodoc:
    fun JetGetRecordPosition(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precpos : Win32cr::Storage::Jet::JET_RECPOS*, cbRecpos : UInt32) : Int32

    # :nodoc:
    fun JetGotoPosition(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, precpos : Win32cr::Storage::Jet::JET_RECPOS*) : Int32

    # :nodoc:
    fun JetGetCursorInfo(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvResult : Void*, cbMax : UInt32, info_level : UInt32) : Int32

    # :nodoc:
    fun JetDupCursor(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetCurrentIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, cbIndexName : UInt32) : Int32

    # :nodoc:
    fun JetGetCurrentIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, cbIndexName : UInt32) : Int32

    # :nodoc:
    fun JetSetCurrentIndexA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*) : Int32

    # :nodoc:
    fun JetSetCurrentIndexW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*) : Int32

    # :nodoc:
    fun JetSetCurrentIndex2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetCurrentIndex2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetCurrentIndex3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, grbit : UInt32, itagSequence : UInt32) : Int32

    # :nodoc:
    fun JetSetCurrentIndex3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, grbit : UInt32, itagSequence : UInt32) : Int32

    # :nodoc:
    fun JetSetCurrentIndex4A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : Int8*, pindexid : Win32cr::Storage::Jet::JET_INDEXID*, grbit : UInt32, itagSequence : UInt32) : Int32

    # :nodoc:
    fun JetSetCurrentIndex4W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, szIndexName : UInt16*, pindexid : Win32cr::Storage::Jet::JET_INDEXID*, grbit : UInt32, itagSequence : UInt32) : Int32

    # :nodoc:
    fun JetMove(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cRow : Int32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetCursorFilter(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, rgColumnFilters : Win32cr::Storage::Jet::JET_INDEX_COLUMN*, cColumnFilters : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetLock(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetMakeKey(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvData : Void*, cbData : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSeek(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetPrereadKeys(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, rgpvKeys : Void**, rgcbKeys : UInt32*, ckeys : Int32, pckeysPreread : Int32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetPrereadIndexRanges(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, rgIndexRanges : Win32cr::Storage::Jet::JET_INDEX_RANGE*, cIndexRanges : UInt32, pcRangesPreread : UInt32*, rgcolumnidPreread : UInt32*, ccolumnidPreread : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetSecondaryIndexBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvSecondaryKey : Void*, cbSecondaryKeyMax : UInt32, pcbSecondaryKeyActual : UInt32*, pvPrimaryBookmark : Void*, cbPrimaryBookmarkMax : UInt32, pcbPrimaryBookmarkActual : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCompactA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseSrc : Int8*, szDatabaseDest : Int8*, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS, pconvert : Win32cr::Storage::Jet::CONVERT_A*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetCompactW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseSrc : UInt16*, szDatabaseDest : UInt16*, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS, pconvert : Win32cr::Storage::Jet::CONVERT_W*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDefragmentA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pcPasses : UInt32*, pcSeconds : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDefragmentW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pcPasses : UInt32*, pcSeconds : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDefragment2A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : Int8*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDefragment2W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, szTableName : UInt16*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDefragment3A(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : Int8*, szTableName : Int8*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, pvContext : Void*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetDefragment3W(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : UInt16*, szTableName : UInt16*, pcPasses : UInt32*, pcSeconds : UInt32*, callback : Win32cr::Storage::Jet::JET_CALLBACK, pvContext : Void*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetDatabaseSizeA(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : Int8*, cpg : UInt32, pcpgReal : UInt32*) : Int32

    # :nodoc:
    fun JetSetDatabaseSizeW(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, szDatabaseName : UInt16*, cpg : UInt32, pcpgReal : UInt32*) : Int32

    # :nodoc:
    fun JetGrowDatabase(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, cpg : UInt32, pcpgReal : UInt32*) : Int32

    # :nodoc:
    fun JetResizeDatabase(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, dbid : UInt32, cpgTarget : UInt32, pcpgActual : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetSessionContext(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, ulContext : Win32cr::Storage::StructuredStorage::JET_API_PTR) : Int32

    # :nodoc:
    fun JetResetSessionContext(sesid : Win32cr::Storage::StructuredStorage::JET_SESID) : Int32

    # :nodoc:
    fun JetGotoBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvBookmark : Void*, cbBookmark : UInt32) : Int32

    # :nodoc:
    fun JetGotoSecondaryIndexBookmark(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvSecondaryKey : Void*, cbSecondaryKey : UInt32, pvPrimaryBookmark : Void*, cbPrimaryBookmark : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetIntersectIndexes(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, rgindexrange : Win32cr::Storage::Jet::JET_INDEXRANGE*, cindexrange : UInt32, precordlist : Win32cr::Storage::Jet::JET_RECORDLIST*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetComputeStats(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID) : Int32

    # :nodoc:
    fun JetOpenTempTable(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, ccolumn : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, prgcolumnid : UInt32*) : Int32

    # :nodoc:
    fun JetOpenTempTable2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, ccolumn : UInt32, lcid : UInt32, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, prgcolumnid : UInt32*) : Int32

    # :nodoc:
    fun JetOpenTempTable3(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, prgcolumndef : Win32cr::Storage::Jet::JET_COLUMNDEF*, ccolumn : UInt32, pidxunicode : Win32cr::Storage::Jet::JET_UNICODEINDEX*, grbit : UInt32, ptableid : Win32cr::Storage::StructuredStorage::JET_TABLEID*, prgcolumnid : UInt32*) : Int32

    # :nodoc:
    fun JetOpenTemporaryTable(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, popentemporarytable : Win32cr::Storage::Jet::JET_OPENTEMPORARYTABLE*) : Int32

    # :nodoc:
    fun JetOpenTemporaryTable2(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, popentemporarytable : Win32cr::Storage::Jet::JET_OPENTEMPORARYTABLE2*) : Int32

    # :nodoc:
    fun JetBackupA(szBackupPath : Int8*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetBackupW(szBackupPath : UInt16*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetBackupInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szBackupPath : Int8*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetBackupInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szBackupPath : UInt16*, grbit : UInt32, pfnStatus : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRestoreA(szSource : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRestoreW(szSource : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRestore2A(sz : Int8*, szDest : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRestore2W(sz : UInt16*, szDest : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRestoreInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sz : Int8*, szDest : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRestoreInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, sz : UInt16*, szDest : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetSetIndexRange(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableidSrc : Win32cr::Storage::StructuredStorage::JET_TABLEID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetIndexRecordCount(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pcrec : UInt32*, crecMax : UInt32) : Int32

    # :nodoc:
    fun JetRetrieveKey(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pvKey : Void*, cbMax : UInt32, pcbActual : UInt32*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetBeginExternalBackup(grbit : UInt32) : Int32

    # :nodoc:
    fun JetBeginExternalBackupInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetAttachInfoA(szzDatabases : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetAttachInfoW(wszzDatabases : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetAttachInfoInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzDatabases : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetAttachInfoInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzDatabases : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetOpenFileA(szFileName : Int8*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32

    # :nodoc:
    fun JetOpenFileW(szFileName : UInt16*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32

    # :nodoc:
    fun JetOpenFileInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szFileName : Int8*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32

    # :nodoc:
    fun JetOpenFileInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szFileName : UInt16*, phfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE*, pulFileSizeLow : UInt32*, pulFileSizeHigh : UInt32*) : Int32

    # :nodoc:
    fun JetReadFile(hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE, pv : Void*, cb : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetReadFileInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE, pv : Void*, cb : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetCloseFile(hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE) : Int32

    # :nodoc:
    fun JetCloseFileInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, hfFile : Win32cr::Storage::StructuredStorage::JET_HANDLE) : Int32

    # :nodoc:
    fun JetGetLogInfoA(szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetLogInfoW(szzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetLogInfoInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetLogInfoInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, wszzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetLogInfoInstance2A(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_A*) : Int32

    # :nodoc:
    fun JetGetLogInfoInstance2W(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, wszzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_W*) : Int32

    # :nodoc:
    fun JetGetTruncateLogInfoInstanceA(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, szzLogs : Int8*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetGetTruncateLogInfoInstanceW(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, wszzLogs : UInt16*, cbMax : UInt32, pcbActual : UInt32*) : Int32

    # :nodoc:
    fun JetTruncateLog : Int32

    # :nodoc:
    fun JetTruncateLogInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32

    # :nodoc:
    fun JetEndExternalBackup : Int32

    # :nodoc:
    fun JetEndExternalBackupInstance(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE) : Int32

    # :nodoc:
    fun JetEndExternalBackupInstance2(instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32

    # :nodoc:
    fun JetExternalRestoreA(szCheckpointFilePath : Int8*, szLogPath : Int8*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_A*, crstfilemap : Int32, szBackupLogPath : Int8*, genLow : Int32, genHigh : Int32, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetExternalRestoreW(szCheckpointFilePath : UInt16*, szLogPath : UInt16*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_W*, crstfilemap : Int32, szBackupLogPath : UInt16*, genLow : Int32, genHigh : Int32, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetExternalRestore2A(szCheckpointFilePath : Int8*, szLogPath : Int8*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_A*, crstfilemap : Int32, szBackupLogPath : Int8*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_A*, szTargetInstanceName : Int8*, szTargetInstanceLogPath : Int8*, szTargetInstanceCheckpointPath : Int8*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetExternalRestore2W(szCheckpointFilePath : UInt16*, szLogPath : UInt16*, rgrstmap : Win32cr::Storage::Jet::JET_RSTMAP_W*, crstfilemap : Int32, szBackupLogPath : UInt16*, pLogInfo : Win32cr::Storage::Jet::JET_LOGINFO_W*, szTargetInstanceName : UInt16*, szTargetInstanceLogPath : UInt16*, szTargetInstanceCheckpointPath : UInt16*, pfn : Win32cr::Storage::Jet::JET_PFNSTATUS) : Int32

    # :nodoc:
    fun JetRegisterCallback(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cbtyp : UInt32, pCallback : Win32cr::Storage::Jet::JET_CALLBACK, pvContext : Void*, phCallbackId : Win32cr::Storage::StructuredStorage::JET_HANDLE*) : Int32

    # :nodoc:
    fun JetUnregisterCallback(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, cbtyp : UInt32, hCallbackId : Win32cr::Storage::StructuredStorage::JET_HANDLE) : Int32

    # :nodoc:
    fun JetGetInstanceInfoA(pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_A**) : Int32

    # :nodoc:
    fun JetGetInstanceInfoW(pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_W**) : Int32

    # :nodoc:
    fun JetFreeBuffer(pbBuf : Win32cr::Foundation::PSTR) : Int32

    # :nodoc:
    fun JetSetLS(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, ls : Win32cr::Storage::Jet::JET_LS, grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetLS(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, tableid : Win32cr::Storage::StructuredStorage::JET_TABLEID, pls : Win32cr::Storage::Jet::JET_LS*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotPrepare(psnapId : Win32cr::Storage::Jet::JET_OSSNAPID*, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotPrepareInstance(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotFreezeA(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_A**, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotFreezeW(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_W**, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotThaw(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotAbort(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotTruncateLog(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotTruncateLogInstance(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, instance : Win32cr::Storage::StructuredStorage::JET_INSTANCE, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotGetFreezeInfoA(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_A**, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotGetFreezeInfoW(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, pcInstanceInfo : UInt32*, paInstanceInfo : Win32cr::Storage::Jet::JET_INSTANCE_INFO_W**, grbit : UInt32) : Int32

    # :nodoc:
    fun JetOSSnapshotEnd(snapId : Win32cr::Storage::Jet::JET_OSSNAPID, grbit : UInt32) : Int32

    # :nodoc:
    fun JetConfigureProcessForCrashDump(grbit : UInt32) : Int32

    # :nodoc:
    fun JetGetErrorInfoW(pvContext : Void*, pvResult : Void*, cbMax : UInt32, info_level : UInt32, grbit : UInt32) : Int32

    # :nodoc:
    fun JetSetSessionParameter(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, sesparamid : UInt32, pvParam : Void*, cbParam : UInt32) : Int32

    # :nodoc:
    fun JetGetSessionParameter(sesid : Win32cr::Storage::StructuredStorage::JET_SESID, sesparamid : UInt32, pvParam : Void*, cbParamMax : UInt32, pcbParamActual : UInt32*) : Int32

  end
end