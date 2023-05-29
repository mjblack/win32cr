require "../storage/structuredstorage.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:esent.dll")]
lib LibWin32
  alias JET_OSSNAPID = LibC::UINT_PTR
  alias JET_LS = LibC::UINT_PTR

  JET_bitConfigStoreReadControlInhibitRead = 1_u32
  JET_bitConfigStoreReadControlDisableAll = 2_u32
  JET_bitConfigStoreReadControlDefault = 0_u32
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

  alias JET_PFNSTATUS = Proc(JET_SESID, UInt32, UInt32, Void*, Int32)
  alias JET_CALLBACK = Proc(JET_SESID, UInt32, JET_TABLEID, UInt32, Void*, Void*, Void*, JET_API_PTR, Int32)
  alias JET_PFNDURABLECOMMITCALLBACK = Proc(JET_INSTANCE, JET_COMMIT_ID*, UInt32, Int32)
  alias JET_PFNREALLOC = Proc(Void*, Void*, UInt32, Void*)


  enum JET_RELOP : Int32
    JET_relopEquals = 0
    JET_relopPrefixEquals = 1
    JET_relopNotEquals = 2
    JET_relopLessThanOrEqual = 3
    JET_relopLessThan = 4
    JET_relopGreaterThanOrEqual = 5
    JET_relopGreaterThan = 6
    JET_relopBitmaskEqualsZero = 7
    JET_relopBitmaskNotEqualsZero = 8
  end

  enum JET_ERRCAT : Int32
    JET_errcatUnknown = 0
    JET_errcatError = 1
    JET_errcatOperation = 2
    JET_errcatFatal = 3
    JET_errcatIO = 4
    JET_errcatResource = 5
    JET_errcatMemory = 6
    JET_errcatQuota = 7
    JET_errcatDisk = 8
    JET_errcatData = 9
    JET_errcatCorruption = 10
    JET_errcatInconsistent = 11
    JET_errcatFragmentation = 12
    JET_errcatApi = 13
    JET_errcatUsage = 14
    JET_errcatState = 15
    JET_errcatObsolete = 16
    JET_errcatMax = 17
  end

  enum JET_INDEXCHECKING : Int32
    JET_IndexCheckingOff = 0
    JET_IndexCheckingOn = 1
    JET_IndexCheckingDeferToOpenTable = 2
    JET_IndexCheckingMax = 3
  end

  union CONVERT_A_Anonymous_e__Union
    f_flags : UInt32
    anonymous : CONVERT_A_Anonymous_e__Union_Anonymous_e__Struct
  end
  union CONVERT_W_Anonymous_e__Union
    f_flags : UInt32
    anonymous : CONVERT_W_Anonymous_e__Union_Anonymous_e__Struct
  end
  union JET_DBINFOUPGRADE_Anonymous_e__Union
    ul_flags : UInt32
    anonymous : JET_DBINFOUPGRADE_Anonymous_e__Union_Anonymous_e__Struct
  end
  union JET_INDEXCREATE_A_Anonymous1_e__Union
    lcid : UInt32
    pidxunicode : JET_UNICODEINDEX*
  end
  union JET_INDEXCREATE_A_Anonymous2_e__Union
    cb_var_seg_mac : UInt32
    ptuplelimits : JET_TUPLELIMITS*
  end
  union JET_INDEXCREATE_W_Anonymous1_e__Union
    lcid : UInt32
    pidxunicode : JET_UNICODEINDEX*
  end
  union JET_INDEXCREATE_W_Anonymous2_e__Union
    cb_var_seg_mac : UInt32
    ptuplelimits : JET_TUPLELIMITS*
  end
  union JET_INDEXCREATE2_A_Anonymous1_e__Union
    lcid : UInt32
    pidxunicode : JET_UNICODEINDEX*
  end
  union JET_INDEXCREATE2_A_Anonymous2_e__Union
    cb_var_seg_mac : UInt32
    ptuplelimits : JET_TUPLELIMITS*
  end
  union JET_INDEXCREATE2_W_Anonymous1_e__Union
    lcid : UInt32
    pidxunicode : JET_UNICODEINDEX*
  end
  union JET_INDEXCREATE2_W_Anonymous2_e__Union
    cb_var_seg_mac : UInt32
    ptuplelimits : JET_TUPLELIMITS*
  end
  union JET_INDEXCREATE3_A_Anonymous_e__Union
    cb_var_seg_mac : UInt32
    ptuplelimits : JET_TUPLELIMITS*
  end
  union JET_INDEXCREATE3_W_Anonymous_e__Union
    cb_var_seg_mac : UInt32
    ptuplelimits : JET_TUPLELIMITS*
  end
  union JET_LOGTIME_Anonymous2_e__Union
    b_filler2 : CHAR
    anonymous : JET_LOGTIME_Anonymous2_e__Union_Anonymous_e__Struct
  end
  union JET_LOGTIME_Anonymous1_e__Union
    b_filler1 : CHAR
    anonymous : JET_LOGTIME_Anonymous1_e__Union_Anonymous_e__Struct
  end
  union JET_BKLOGTIME_Anonymous2_e__Union
    b_filler2 : CHAR
    anonymous : JET_BKLOGTIME_Anonymous2_e__Union_Anonymous_e__Struct
  end
  union JET_BKLOGTIME_Anonymous1_e__Union
    b_filler1 : CHAR
    anonymous : JET_BKLOGTIME_Anonymous1_e__Union_Anonymous_e__Struct
  end
  union JET_BKINFO_Anonymous_e__Union
    logtime_mark : JET_LOGTIME
    bklogtime_mark : JET_BKLOGTIME
  end
  union JET_ENUMCOLUMN_Anonymous_e__Union
    anonymous1 : JET_ENUMCOLUMN_Anonymous_e__Union_Anonymous1_e__Struct
    anonymous2 : JET_ENUMCOLUMN_Anonymous_e__Union_Anonymous2_e__Struct
  end

  struct JET_INDEXID
    cb_struct : UInt32
    rgb_index_id : UInt8[16]*
  end
  struct JET_RSTMAP_A
    sz_database_name : PSTR
    sz_new_database_name : PSTR
  end
  struct JET_RSTMAP_W
    sz_database_name : LibC::LPWSTR
    sz_new_database_name : LibC::LPWSTR
  end
  struct CONVERT_A
    sz_old_dll : PSTR
    anonymous : CONVERT_A_Anonymous_e__Union
  end
  struct CONVERT_A_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct CONVERT_W
    sz_old_dll : LibC::LPWSTR
    anonymous : CONVERT_W_Anonymous_e__Union
  end
  struct CONVERT_W_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct JET_SNPROG
    cb_struct : UInt32
    cunit_done : UInt32
    cunit_total : UInt32
  end
  struct JET_DBINFOUPGRADE
    cb_struct : UInt32
    cb_filesize_low : UInt32
    cb_filesize_high : UInt32
    cb_free_space_required_low : UInt32
    cb_free_space_required_high : UInt32
    csec_to_upgrade : UInt32
    anonymous : JET_DBINFOUPGRADE_Anonymous_e__Union
  end
  struct JET_DBINFOUPGRADE_Anonymous_e__Union_Anonymous_e__Struct
    _bitfield : UInt32
  end
  struct JET_OBJECTINFO
    cb_struct : UInt32
    objtyp : UInt32
    dt_create : Float64
    dt_update : Float64
    grbit : UInt32
    flags : UInt32
    c_record : UInt32
    c_page : UInt32
  end
  struct JET_OBJECTLIST
    cb_struct : UInt32
    tableid : JET_TABLEID
    c_record : UInt32
    columnidcontainername : UInt32
    columnidobjectname : UInt32
    columnidobjtyp : UInt32
    columniddt_create : UInt32
    columniddt_update : UInt32
    columnidgrbit : UInt32
    columnidflags : UInt32
    columnidc_record : UInt32
    columnidc_page : UInt32
  end
  struct JET_COLUMNLIST
    cb_struct : UInt32
    tableid : JET_TABLEID
    c_record : UInt32
    columnid_presentation_order : UInt32
    columnidcolumnname : UInt32
    columnidcolumnid : UInt32
    columnidcoltyp : UInt32
    columnid_country : UInt32
    columnid_langid : UInt32
    columnid_cp : UInt32
    columnid_collate : UInt32
    columnidcb_max : UInt32
    columnidgrbit : UInt32
    columnid_default : UInt32
    columnid_base_table_name : UInt32
    columnid_base_column_name : UInt32
    columnid_definition_name : UInt32
  end
  struct JET_COLUMNDEF
    cb_struct : UInt32
    columnid : UInt32
    coltyp : UInt32
    w_country : UInt16
    langid : UInt16
    cp : UInt16
    w_collate : UInt16
    cb_max : UInt32
    grbit : UInt32
  end
  struct JET_COLUMNBASE_A
    cb_struct : UInt32
    columnid : UInt32
    coltyp : UInt32
    w_country : UInt16
    langid : UInt16
    cp : UInt16
    w_filler : UInt16
    cb_max : UInt32
    grbit : UInt32
    sz_base_table_name : CHAR[256]*
    sz_base_column_name : CHAR[256]*
  end
  struct JET_COLUMNBASE_W
    cb_struct : UInt32
    columnid : UInt32
    coltyp : UInt32
    w_country : UInt16
    langid : UInt16
    cp : UInt16
    w_filler : UInt16
    cb_max : UInt32
    grbit : UInt32
    sz_base_table_name : Char[256]*
    sz_base_column_name : Char[256]*
  end
  struct JET_INDEXLIST
    cb_struct : UInt32
    tableid : JET_TABLEID
    c_record : UInt32
    columnidindexname : UInt32
    columnidgrbit_index : UInt32
    columnidc_key : UInt32
    columnidc_entry : UInt32
    columnidc_page : UInt32
    columnidc_column : UInt32
    columnidi_column : UInt32
    columnidcolumnid : UInt32
    columnidcoltyp : UInt32
    columnid_country : UInt32
    columnid_langid : UInt32
    columnid_cp : UInt32
    columnid_collate : UInt32
    columnidgrbit_column : UInt32
    columnidcolumnname : UInt32
    columnid_lc_map_flags : UInt32
  end
  struct JET_COLUMNCREATE_A
    cb_struct : UInt32
    sz_column_name : PSTR
    coltyp : UInt32
    cb_max : UInt32
    grbit : UInt32
    pv_default : Void*
    cb_default : UInt32
    cp : UInt32
    columnid : UInt32
    err : Int32
  end
  struct JET_COLUMNCREATE_W
    cb_struct : UInt32
    sz_column_name : LibC::LPWSTR
    coltyp : UInt32
    cb_max : UInt32
    grbit : UInt32
    pv_default : Void*
    cb_default : UInt32
    cp : UInt32
    columnid : UInt32
    err : Int32
  end
  struct JET_USERDEFINEDDEFAULT_A
    sz_callback : PSTR
    pb_user_data : UInt8*
    cb_user_data : UInt32
    sz_dependant_columns : PSTR
  end
  struct JET_USERDEFINEDDEFAULT_W
    sz_callback : LibC::LPWSTR
    pb_user_data : UInt8*
    cb_user_data : UInt32
    sz_dependant_columns : LibC::LPWSTR
  end
  struct JET_CONDITIONALCOLUMN_A
    cb_struct : UInt32
    sz_column_name : PSTR
    grbit : UInt32
  end
  struct JET_CONDITIONALCOLUMN_W
    cb_struct : UInt32
    sz_column_name : LibC::LPWSTR
    grbit : UInt32
  end
  struct JET_UNICODEINDEX
    lcid : UInt32
    dw_map_flags : UInt32
  end
  struct JET_UNICODEINDEX2
    sz_locale_name : LibC::LPWSTR
    dw_map_flags : UInt32
  end
  struct JET_TUPLELIMITS
    ch_length_min : UInt32
    ch_length_max : UInt32
    ch_to_index_max : UInt32
    cch_increment : UInt32
    ich_start : UInt32
  end
  struct JET_SPACEHINTS
    cb_struct : UInt32
    ul_initial_density : UInt32
    cb_initial : UInt32
    grbit : UInt32
    ul_maint_density : UInt32
    ul_growth : UInt32
    cb_min_extent : UInt32
    cb_max_extent : UInt32
  end
  struct JET_INDEXCREATE_A
    cb_struct : UInt32
    sz_index_name : PSTR
    sz_key : PSTR
    cb_key : UInt32
    grbit : UInt32
    ul_density : UInt32
    anonymous1 : JET_INDEXCREATE_A_Anonymous1_e__Union
    anonymous2 : JET_INDEXCREATE_A_Anonymous2_e__Union
    rgconditionalcolumn : JET_CONDITIONALCOLUMN_A*
    c_conditional_column : UInt32
    err : Int32
    cb_key_most : UInt32
  end
  struct JET_INDEXCREATE_W
    cb_struct : UInt32
    sz_index_name : LibC::LPWSTR
    sz_key : LibC::LPWSTR
    cb_key : UInt32
    grbit : UInt32
    ul_density : UInt32
    anonymous1 : JET_INDEXCREATE_W_Anonymous1_e__Union
    anonymous2 : JET_INDEXCREATE_W_Anonymous2_e__Union
    rgconditionalcolumn : JET_CONDITIONALCOLUMN_W*
    c_conditional_column : UInt32
    err : Int32
    cb_key_most : UInt32
  end
  struct JET_INDEXCREATE2_A
    cb_struct : UInt32
    sz_index_name : PSTR
    sz_key : PSTR
    cb_key : UInt32
    grbit : UInt32
    ul_density : UInt32
    anonymous1 : JET_INDEXCREATE2_A_Anonymous1_e__Union
    anonymous2 : JET_INDEXCREATE2_A_Anonymous2_e__Union
    rgconditionalcolumn : JET_CONDITIONALCOLUMN_A*
    c_conditional_column : UInt32
    err : Int32
    cb_key_most : UInt32
    p_spacehints : JET_SPACEHINTS*
  end
  struct JET_INDEXCREATE2_W
    cb_struct : UInt32
    sz_index_name : LibC::LPWSTR
    sz_key : LibC::LPWSTR
    cb_key : UInt32
    grbit : UInt32
    ul_density : UInt32
    anonymous1 : JET_INDEXCREATE2_W_Anonymous1_e__Union
    anonymous2 : JET_INDEXCREATE2_W_Anonymous2_e__Union
    rgconditionalcolumn : JET_CONDITIONALCOLUMN_W*
    c_conditional_column : UInt32
    err : Int32
    cb_key_most : UInt32
    p_spacehints : JET_SPACEHINTS*
  end
  struct JET_INDEXCREATE3_A
    cb_struct : UInt32
    sz_index_name : PSTR
    sz_key : PSTR
    cb_key : UInt32
    grbit : UInt32
    ul_density : UInt32
    pidxunicode : JET_UNICODEINDEX2*
    anonymous : JET_INDEXCREATE3_A_Anonymous_e__Union
    rgconditionalcolumn : JET_CONDITIONALCOLUMN_A*
    c_conditional_column : UInt32
    err : Int32
    cb_key_most : UInt32
    p_spacehints : JET_SPACEHINTS*
  end
  struct JET_INDEXCREATE3_W
    cb_struct : UInt32
    sz_index_name : LibC::LPWSTR
    sz_key : LibC::LPWSTR
    cb_key : UInt32
    grbit : UInt32
    ul_density : UInt32
    pidxunicode : JET_UNICODEINDEX2*
    anonymous : JET_INDEXCREATE3_W_Anonymous_e__Union
    rgconditionalcolumn : JET_CONDITIONALCOLUMN_W*
    c_conditional_column : UInt32
    err : Int32
    cb_key_most : UInt32
    p_spacehints : JET_SPACEHINTS*
  end
  struct JET_TABLECREATE_A
    cb_struct : UInt32
    sz_table_name : PSTR
    sz_template_table_name : PSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_A*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE_A*
    c_indexes : UInt32
    grbit : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE_W
    cb_struct : UInt32
    sz_table_name : LibC::LPWSTR
    sz_template_table_name : LibC::LPWSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_W*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE_W*
    c_indexes : UInt32
    grbit : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE2_A
    cb_struct : UInt32
    sz_table_name : PSTR
    sz_template_table_name : PSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_A*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE_A*
    c_indexes : UInt32
    sz_callback : PSTR
    cbtyp : UInt32
    grbit : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE2_W
    cb_struct : UInt32
    sz_table_name : LibC::LPWSTR
    sz_template_table_name : LibC::LPWSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_W*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE_W*
    c_indexes : UInt32
    sz_callback : LibC::LPWSTR
    cbtyp : UInt32
    grbit : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE3_A
    cb_struct : UInt32
    sz_table_name : PSTR
    sz_template_table_name : PSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_A*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE2_A*
    c_indexes : UInt32
    sz_callback : PSTR
    cbtyp : UInt32
    grbit : UInt32
    p_seq_spacehints : JET_SPACEHINTS*
    p_lv_spacehints : JET_SPACEHINTS*
    cb_separate_lv : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE3_W
    cb_struct : UInt32
    sz_table_name : LibC::LPWSTR
    sz_template_table_name : LibC::LPWSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_W*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE2_W*
    c_indexes : UInt32
    sz_callback : LibC::LPWSTR
    cbtyp : UInt32
    grbit : UInt32
    p_seq_spacehints : JET_SPACEHINTS*
    p_lv_spacehints : JET_SPACEHINTS*
    cb_separate_lv : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE4_A
    cb_struct : UInt32
    sz_table_name : PSTR
    sz_template_table_name : PSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_A*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE3_A*
    c_indexes : UInt32
    sz_callback : PSTR
    cbtyp : UInt32
    grbit : UInt32
    p_seq_spacehints : JET_SPACEHINTS*
    p_lv_spacehints : JET_SPACEHINTS*
    cb_separate_lv : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_TABLECREATE4_W
    cb_struct : UInt32
    sz_table_name : LibC::LPWSTR
    sz_template_table_name : LibC::LPWSTR
    ul_pages : UInt32
    ul_density : UInt32
    rgcolumncreate : JET_COLUMNCREATE_W*
    c_columns : UInt32
    rgindexcreate : JET_INDEXCREATE3_W*
    c_indexes : UInt32
    sz_callback : LibC::LPWSTR
    cbtyp : UInt32
    grbit : UInt32
    p_seq_spacehints : JET_SPACEHINTS*
    p_lv_spacehints : JET_SPACEHINTS*
    cb_separate_lv : UInt32
    tableid : JET_TABLEID
    c_created : UInt32
  end
  struct JET_OPENTEMPORARYTABLE
    cb_struct : UInt32
    prgcolumndef : JET_COLUMNDEF*
    ccolumn : UInt32
    pidxunicode : JET_UNICODEINDEX*
    grbit : UInt32
    prgcolumnid : UInt32*
    cb_key_most : UInt32
    cb_var_seg_mac : UInt32
    tableid : JET_TABLEID
  end
  struct JET_OPENTEMPORARYTABLE2
    cb_struct : UInt32
    prgcolumndef : JET_COLUMNDEF*
    ccolumn : UInt32
    pidxunicode : JET_UNICODEINDEX2*
    grbit : UInt32
    prgcolumnid : UInt32*
    cb_key_most : UInt32
    cb_var_seg_mac : UInt32
    tableid : JET_TABLEID
  end
  struct JET_RETINFO
    cb_struct : UInt32
    ib_long_value : UInt32
    itag_sequence : UInt32
    columnid_next_tagged : UInt32
  end
  struct JET_SETINFO
    cb_struct : UInt32
    ib_long_value : UInt32
    itag_sequence : UInt32
  end
  struct JET_RECPOS
    cb_struct : UInt32
    centries_lt : UInt32
    centries_in_range : UInt32
    centries_total : UInt32
  end
  struct JET_RECORDLIST
    cb_struct : UInt32
    tableid : JET_TABLEID
    c_record : UInt32
    columnid_bookmark : UInt32
  end
  struct JET_INDEXRANGE
    cb_struct : UInt32
    tableid : JET_TABLEID
    grbit : UInt32
  end
  struct JET_INDEX_COLUMN
    columnid : UInt32
    relop : JET_RELOP
    pv : Void*
    cb : UInt32
    grbit : UInt32
  end
  struct JET_INDEX_RANGE
    rg_start_columns : JET_INDEX_COLUMN*
    c_start_columns : UInt32
    rg_end_columns : JET_INDEX_COLUMN*
    c_end_columns : UInt32
  end
  struct JET_LOGTIME
    b_seconds : CHAR
    b_minutes : CHAR
    b_hours : CHAR
    b_day : CHAR
    b_month : CHAR
    b_year : CHAR
    anonymous1 : JET_LOGTIME_Anonymous1_e__Union
    anonymous2 : JET_LOGTIME_Anonymous2_e__Union
  end
  struct JET_LOGTIME_Anonymous2_e__Union_Anonymous_e__Struct
    _bitfield : UInt8
  end
  struct JET_LOGTIME_Anonymous1_e__Union_Anonymous_e__Struct
    _bitfield : UInt8
  end
  struct JET_BKLOGTIME
    b_seconds : CHAR
    b_minutes : CHAR
    b_hours : CHAR
    b_day : CHAR
    b_month : CHAR
    b_year : CHAR
    anonymous1 : JET_BKLOGTIME_Anonymous1_e__Union
    anonymous2 : JET_BKLOGTIME_Anonymous2_e__Union
  end
  struct JET_BKLOGTIME_Anonymous2_e__Union_Anonymous_e__Struct
    _bitfield : UInt8
  end
  struct JET_BKLOGTIME_Anonymous1_e__Union_Anonymous_e__Struct
    _bitfield : UInt8
  end
  struct JET_LGPOS
    ib : UInt16
    isec : UInt16
    l_generation : Int32
  end
  struct JET_SIGNATURE
    ul_random : UInt32
    logtime_create : JET_LOGTIME
    sz_computer_name : CHAR[16]*
  end
  struct JET_BKINFO
    lgpos_mark : JET_LGPOS
    anonymous : JET_BKINFO_Anonymous_e__Union
    gen_low : UInt32
    gen_high : UInt32
  end
  struct JET_DBINFOMISC
    ul_version : UInt32
    ul_update : UInt32
    sign_db : JET_SIGNATURE
    dbstate : UInt32
    lgpos_consistent : JET_LGPOS
    logtime_consistent : JET_LOGTIME
    logtime_attach : JET_LOGTIME
    lgpos_attach : JET_LGPOS
    logtime_detach : JET_LOGTIME
    lgpos_detach : JET_LGPOS
    sign_log : JET_SIGNATURE
    bkinfo_full_prev : JET_BKINFO
    bkinfo_inc_prev : JET_BKINFO
    bkinfo_full_cur : JET_BKINFO
    f_shadowing_disabled : UInt32
    f_upgrade_db : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    l_sp_number : Int32
    cb_page_size : UInt32
  end
  struct JET_DBINFOMISC2
    ul_version : UInt32
    ul_update : UInt32
    sign_db : JET_SIGNATURE
    dbstate : UInt32
    lgpos_consistent : JET_LGPOS
    logtime_consistent : JET_LOGTIME
    logtime_attach : JET_LOGTIME
    lgpos_attach : JET_LGPOS
    logtime_detach : JET_LOGTIME
    lgpos_detach : JET_LGPOS
    sign_log : JET_SIGNATURE
    bkinfo_full_prev : JET_BKINFO
    bkinfo_inc_prev : JET_BKINFO
    bkinfo_full_cur : JET_BKINFO
    f_shadowing_disabled : UInt32
    f_upgrade_db : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    l_sp_number : Int32
    cb_page_size : UInt32
    gen_min_required : UInt32
    gen_max_required : UInt32
    logtime_gen_max_create : JET_LOGTIME
    ul_repair_count : UInt32
    logtime_repair : JET_LOGTIME
    ul_repair_count_old : UInt32
    ul_ecc_fix_success : UInt32
    logtime_ecc_fix_success : JET_LOGTIME
    ul_ecc_fix_success_old : UInt32
    ul_ecc_fix_fail : UInt32
    logtime_ecc_fix_fail : JET_LOGTIME
    ul_ecc_fix_fail_old : UInt32
    ul_bad_checksum : UInt32
    logtime_bad_checksum : JET_LOGTIME
    ul_bad_checksum_old : UInt32
  end
  struct JET_DBINFOMISC3
    ul_version : UInt32
    ul_update : UInt32
    sign_db : JET_SIGNATURE
    dbstate : UInt32
    lgpos_consistent : JET_LGPOS
    logtime_consistent : JET_LOGTIME
    logtime_attach : JET_LOGTIME
    lgpos_attach : JET_LGPOS
    logtime_detach : JET_LOGTIME
    lgpos_detach : JET_LGPOS
    sign_log : JET_SIGNATURE
    bkinfo_full_prev : JET_BKINFO
    bkinfo_inc_prev : JET_BKINFO
    bkinfo_full_cur : JET_BKINFO
    f_shadowing_disabled : UInt32
    f_upgrade_db : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    l_sp_number : Int32
    cb_page_size : UInt32
    gen_min_required : UInt32
    gen_max_required : UInt32
    logtime_gen_max_create : JET_LOGTIME
    ul_repair_count : UInt32
    logtime_repair : JET_LOGTIME
    ul_repair_count_old : UInt32
    ul_ecc_fix_success : UInt32
    logtime_ecc_fix_success : JET_LOGTIME
    ul_ecc_fix_success_old : UInt32
    ul_ecc_fix_fail : UInt32
    logtime_ecc_fix_fail : JET_LOGTIME
    ul_ecc_fix_fail_old : UInt32
    ul_bad_checksum : UInt32
    logtime_bad_checksum : JET_LOGTIME
    ul_bad_checksum_old : UInt32
    gen_committed : UInt32
  end
  struct JET_DBINFOMISC4
    ul_version : UInt32
    ul_update : UInt32
    sign_db : JET_SIGNATURE
    dbstate : UInt32
    lgpos_consistent : JET_LGPOS
    logtime_consistent : JET_LOGTIME
    logtime_attach : JET_LOGTIME
    lgpos_attach : JET_LGPOS
    logtime_detach : JET_LOGTIME
    lgpos_detach : JET_LGPOS
    sign_log : JET_SIGNATURE
    bkinfo_full_prev : JET_BKINFO
    bkinfo_inc_prev : JET_BKINFO
    bkinfo_full_cur : JET_BKINFO
    f_shadowing_disabled : UInt32
    f_upgrade_db : UInt32
    dw_major_version : UInt32
    dw_minor_version : UInt32
    dw_build_number : UInt32
    l_sp_number : Int32
    cb_page_size : UInt32
    gen_min_required : UInt32
    gen_max_required : UInt32
    logtime_gen_max_create : JET_LOGTIME
    ul_repair_count : UInt32
    logtime_repair : JET_LOGTIME
    ul_repair_count_old : UInt32
    ul_ecc_fix_success : UInt32
    logtime_ecc_fix_success : JET_LOGTIME
    ul_ecc_fix_success_old : UInt32
    ul_ecc_fix_fail : UInt32
    logtime_ecc_fix_fail : JET_LOGTIME
    ul_ecc_fix_fail_old : UInt32
    ul_bad_checksum : UInt32
    logtime_bad_checksum : JET_LOGTIME
    ul_bad_checksum_old : UInt32
    gen_committed : UInt32
    bkinfo_copy_prev : JET_BKINFO
    bkinfo_diff_prev : JET_BKINFO
  end
  struct JET_THREADSTATS
    cb_struct : UInt32
    c_page_referenced : UInt32
    c_page_read : UInt32
    c_page_preread : UInt32
    c_page_dirtied : UInt32
    c_page_redirtied : UInt32
    c_log_record : UInt32
    cb_log_record : UInt32
  end
  struct JET_THREADSTATS2
    cb_struct : UInt32
    c_page_referenced : UInt32
    c_page_read : UInt32
    c_page_preread : UInt32
    c_page_dirtied : UInt32
    c_page_redirtied : UInt32
    c_log_record : UInt32
    cb_log_record : UInt32
    cusec_page_cache_miss : UInt64
    c_page_cache_miss : UInt32
  end
  struct JET_RSTINFO_A
    cb_struct : UInt32
    rgrstmap : JET_RSTMAP_A*
    crstmap : Int32
    lgpos_stop : JET_LGPOS
    logtime_stop : JET_LOGTIME
    pfn_status : JET_PFNSTATUS
  end
  struct JET_RSTINFO_W
    cb_struct : UInt32
    rgrstmap : JET_RSTMAP_W*
    crstmap : Int32
    lgpos_stop : JET_LGPOS
    logtime_stop : JET_LOGTIME
    pfn_status : JET_PFNSTATUS
  end
  struct JET_ERRINFOBASIC_W
    cb_struct : UInt32
    err_value : Int32
    errcat_most_specific : JET_ERRCAT
    rg_categorical_hierarchy : UInt8[8]*
    l_source_line : UInt32
    rgsz_source_file : Char[64]*
  end
  struct JET_COMMIT_ID
    sign_log : JET_SIGNATURE
    reserved : Int32
    commit_id : Int64
  end
  struct JET_RBSINFOMISC
    l_rbs_generation : Int32
    logtime_create : JET_LOGTIME
    logtime_create_prev_rbs : JET_LOGTIME
    ul_major : UInt32
    ul_minor : UInt32
    cb_logical_file_size : UInt64
  end
  struct JET_RBSREVERTINFOMISC
    l_gen_min_revert_start : Int32
    l_gen_max_revert_start : Int32
    l_gen_min_revert_end : Int32
    l_gen_max_revert_end : Int32
    logtime_revert_from : JET_LOGTIME
    c_sec_revert : UInt64
    c_pages_reverted : UInt64
  end
  struct JET_OPERATIONCONTEXT
    ul_user_id : UInt32
    n_operation_id : UInt8
    n_operation_type : UInt8
    n_client_type : UInt8
    f_flags : UInt8
  end
  struct JET_SETCOLUMN
    columnid : UInt32
    pv_data : Void*
    cb_data : UInt32
    grbit : UInt32
    ib_long_value : UInt32
    itag_sequence : UInt32
    err : Int32
  end
  struct JET_SETSYSPARAM_A
    paramid : UInt32
    l_param : JET_API_PTR
    sz : PSTR
    err : Int32
  end
  struct JET_SETSYSPARAM_W
    paramid : UInt32
    l_param : JET_API_PTR
    sz : LibC::LPWSTR
    err : Int32
  end
  struct JET_RETRIEVECOLUMN
    columnid : UInt32
    pv_data : Void*
    cb_data : UInt32
    cb_actual : UInt32
    grbit : UInt32
    ib_long_value : UInt32
    itag_sequence : UInt32
    columnid_next_tagged : UInt32
    err : Int32
  end
  struct JET_ENUMCOLUMNID
    columnid : UInt32
    ctag_sequence : UInt32
    rgtag_sequence : UInt32*
  end
  struct JET_ENUMCOLUMNVALUE
    itag_sequence : UInt32
    err : Int32
    cb_data : UInt32
    pv_data : Void*
  end
  struct JET_ENUMCOLUMN
    columnid : UInt32
    err : Int32
    anonymous : JET_ENUMCOLUMN_Anonymous_e__Union
  end
  struct JET_ENUMCOLUMN_Anonymous_e__Union_Anonymous2_e__Struct
    cb_data : UInt32
    pv_data : Void*
  end
  struct JET_ENUMCOLUMN_Anonymous_e__Union_Anonymous1_e__Struct
    c_enum_column_value : UInt32
    rg_enum_column_value : JET_ENUMCOLUMNVALUE*
  end
  struct JET_RECSIZE
    cb_data : UInt64
    cb_long_value_data : UInt64
    cb_overhead : UInt64
    cb_long_value_overhead : UInt64
    c_non_tagged_columns : UInt64
    c_tagged_columns : UInt64
    c_long_values : UInt64
    c_multi_values : UInt64
  end
  struct JET_RECSIZE2
    cb_data : UInt64
    cb_long_value_data : UInt64
    cb_overhead : UInt64
    cb_long_value_overhead : UInt64
    c_non_tagged_columns : UInt64
    c_tagged_columns : UInt64
    c_long_values : UInt64
    c_multi_values : UInt64
    c_compressed_columns : UInt64
    cb_data_compressed : UInt64
    cb_long_value_data_compressed : UInt64
  end
  struct JET_LOGINFO_A
    cb_size : UInt32
    ul_gen_low : UInt32
    ul_gen_high : UInt32
    sz_base_name : CHAR[4]*
  end
  struct JET_LOGINFO_W
    cb_size : UInt32
    ul_gen_low : UInt32
    ul_gen_high : UInt32
    sz_base_name : Char[4]*
  end
  struct JET_INSTANCE_INFO_A
    h_instance_id : JET_INSTANCE
    sz_instance_name : PSTR
    c_databases : JET_API_PTR
    sz_database_file_name : Int8**
    sz_database_display_name : Int8**
    sz_database_slv_file_name_obsolete : Int8**
  end
  struct JET_INSTANCE_INFO_W
    h_instance_id : JET_INSTANCE
    sz_instance_name : LibC::LPWSTR
    c_databases : JET_API_PTR
    sz_database_file_name : UInt16**
    sz_database_display_name : UInt16**
    sz_database_slv_file_name_obsolete : UInt16**
  end


  # Params # pinstance : JET_INSTANCE* [In]
  fun JetInit(pinstance : JET_INSTANCE*) : Int32

  # Params # pinstance : JET_INSTANCE* [In],grbit : UInt32 [In]
  fun JetInit2(pinstance : JET_INSTANCE*, grbit : UInt32) : Int32

  # Params # pinstance : JET_INSTANCE* [In],prstinfo : JET_RSTINFO_A* [In],grbit : UInt32 [In]
  fun JetInit3A(pinstance : JET_INSTANCE*, prstinfo : JET_RSTINFO_A*, grbit : UInt32) : Int32

  # Params # pinstance : JET_INSTANCE* [In],prstinfo : JET_RSTINFO_W* [In],grbit : UInt32 [In]
  fun JetInit3W(pinstance : JET_INSTANCE*, prstinfo : JET_RSTINFO_W*, grbit : UInt32) : Int32

  # Params # pinstance : JET_INSTANCE* [In],szinstancename : Int8* [In]
  fun JetCreateInstanceA(pinstance : JET_INSTANCE*, szinstancename : Int8*) : Int32

  # Params # pinstance : JET_INSTANCE* [In],szinstancename : UInt16* [In]
  fun JetCreateInstanceW(pinstance : JET_INSTANCE*, szinstancename : UInt16*) : Int32

  # Params # pinstance : JET_INSTANCE* [In],szinstancename : Int8* [In],szdisplayname : Int8* [In],grbit : UInt32 [In]
  fun JetCreateInstance2A(pinstance : JET_INSTANCE*, szinstancename : Int8*, szdisplayname : Int8*, grbit : UInt32) : Int32

  # Params # pinstance : JET_INSTANCE* [In],szinstancename : UInt16* [In],szdisplayname : UInt16* [In],grbit : UInt32 [In]
  fun JetCreateInstance2W(pinstance : JET_INSTANCE*, szinstancename : UInt16*, szdisplayname : UInt16*, grbit : UInt32) : Int32

  # Params # instance : JET_INSTANCE [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetInstanceMiscInfo(instance : JET_INSTANCE, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # instance : JET_INSTANCE [In]
  fun JetTerm(instance : JET_INSTANCE) : Int32

  # Params # instance : JET_INSTANCE [In],grbit : UInt32 [In]
  fun JetTerm2(instance : JET_INSTANCE, grbit : UInt32) : Int32

  # Params # 
  fun JetStopService : Int32

  # Params # instance : JET_INSTANCE [In]
  fun JetStopServiceInstance(instance : JET_INSTANCE) : Int32

  # Params # instance : JET_INSTANCE [In],grbit : UInt32 [In]
  fun JetStopServiceInstance2(instance : JET_INSTANCE, grbit : UInt32) : Int32

  # Params # 
  fun JetStopBackup : Int32

  # Params # instance : JET_INSTANCE [In]
  fun JetStopBackupInstance(instance : JET_INSTANCE) : Int32

  # Params # pinstance : JET_INSTANCE* [In],sesid : JET_SESID [In],paramid : UInt32 [In],lparam : JET_API_PTR [In],szparam : Int8* [In]
  fun JetSetSystemParameterA(pinstance : JET_INSTANCE*, sesid : JET_SESID, paramid : UInt32, lparam : JET_API_PTR, szparam : Int8*) : Int32

  # Params # pinstance : JET_INSTANCE* [In],sesid : JET_SESID [In],paramid : UInt32 [In],lparam : JET_API_PTR [In],szparam : UInt16* [In]
  fun JetSetSystemParameterW(pinstance : JET_INSTANCE*, sesid : JET_SESID, paramid : UInt32, lparam : JET_API_PTR, szparam : UInt16*) : Int32

  # Params # instance : JET_INSTANCE [In],sesid : JET_SESID [In],paramid : UInt32 [In],plparam : JET_API_PTR* [In],szparam : Int8* [In],cbmax : UInt32 [In]
  fun JetGetSystemParameterA(instance : JET_INSTANCE, sesid : JET_SESID, paramid : UInt32, plparam : JET_API_PTR*, szparam : Int8*, cbmax : UInt32) : Int32

  # Params # instance : JET_INSTANCE [In],sesid : JET_SESID [In],paramid : UInt32 [In],plparam : JET_API_PTR* [In],szparam : UInt16* [In],cbmax : UInt32 [In]
  fun JetGetSystemParameterW(instance : JET_INSTANCE, sesid : JET_SESID, paramid : UInt32, plparam : JET_API_PTR*, szparam : UInt16*, cbmax : UInt32) : Int32

  # Params # psetsysparam : JET_SETSYSPARAM_A* [In],csetsysparam : UInt32 [In],pcsetsucceed : UInt32* [In]
  fun JetEnableMultiInstanceA(psetsysparam : JET_SETSYSPARAM_A*, csetsysparam : UInt32, pcsetsucceed : UInt32*) : Int32

  # Params # psetsysparam : JET_SETSYSPARAM_W* [In],csetsysparam : UInt32 [In],pcsetsucceed : UInt32* [In]
  fun JetEnableMultiInstanceW(psetsysparam : JET_SETSYSPARAM_W*, csetsysparam : UInt32, pcsetsucceed : UInt32*) : Int32

  # Params # pvresult : Void* [In],cbmax : UInt32 [In]
  fun JetGetThreadStats(pvresult : Void*, cbmax : UInt32) : Int32

  # Params # instance : JET_INSTANCE [In],psesid : JET_SESID* [In],szusername : Int8* [In],szpassword : Int8* [In]
  fun JetBeginSessionA(instance : JET_INSTANCE, psesid : JET_SESID*, szusername : Int8*, szpassword : Int8*) : Int32

  # Params # instance : JET_INSTANCE [In],psesid : JET_SESID* [In],szusername : UInt16* [In],szpassword : UInt16* [In]
  fun JetBeginSessionW(instance : JET_INSTANCE, psesid : JET_SESID*, szusername : UInt16*, szpassword : UInt16*) : Int32

  # Params # sesid : JET_SESID [In],psesid : JET_SESID* [In]
  fun JetDupSession(sesid : JET_SESID, psesid : JET_SESID*) : Int32

  # Params # sesid : JET_SESID [In],grbit : UInt32 [In]
  fun JetEndSession(sesid : JET_SESID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],pwversion : UInt32* [In]
  fun JetGetVersion(sesid : JET_SESID, pwversion : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],grbit : UInt32 [In]
  fun JetIdle(sesid : JET_SESID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In],szconnect : Int8* [In],pdbid : UInt32* [In],grbit : UInt32 [In]
  fun JetCreateDatabaseA(sesid : JET_SESID, szfilename : Int8*, szconnect : Int8*, pdbid : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In],szconnect : UInt16* [In],pdbid : UInt32* [In],grbit : UInt32 [In]
  fun JetCreateDatabaseW(sesid : JET_SESID, szfilename : UInt16*, szconnect : UInt16*, pdbid : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In],cpgdatabasesizemax : UInt32 [In],pdbid : UInt32* [In],grbit : UInt32 [In]
  fun JetCreateDatabase2A(sesid : JET_SESID, szfilename : Int8*, cpgdatabasesizemax : UInt32, pdbid : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In],cpgdatabasesizemax : UInt32 [In],pdbid : UInt32* [In],grbit : UInt32 [In]
  fun JetCreateDatabase2W(sesid : JET_SESID, szfilename : UInt16*, cpgdatabasesizemax : UInt32, pdbid : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In],grbit : UInt32 [In]
  fun JetAttachDatabaseA(sesid : JET_SESID, szfilename : Int8*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In],grbit : UInt32 [In]
  fun JetAttachDatabaseW(sesid : JET_SESID, szfilename : UInt16*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In],cpgdatabasesizemax : UInt32 [In],grbit : UInt32 [In]
  fun JetAttachDatabase2A(sesid : JET_SESID, szfilename : Int8*, cpgdatabasesizemax : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In],cpgdatabasesizemax : UInt32 [In],grbit : UInt32 [In]
  fun JetAttachDatabase2W(sesid : JET_SESID, szfilename : UInt16*, cpgdatabasesizemax : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In]
  fun JetDetachDatabaseA(sesid : JET_SESID, szfilename : Int8*) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In]
  fun JetDetachDatabaseW(sesid : JET_SESID, szfilename : UInt16*) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In],grbit : UInt32 [In]
  fun JetDetachDatabase2A(sesid : JET_SESID, szfilename : Int8*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In],grbit : UInt32 [In]
  fun JetDetachDatabase2W(sesid : JET_SESID, szfilename : UInt16*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],objtyp : UInt32 [In],szcontainername : Int8* [In],szobjectname : Int8* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetObjectInfoA(sesid : JET_SESID, dbid : UInt32, objtyp : UInt32, szcontainername : Int8*, szobjectname : Int8*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],objtyp : UInt32 [In],szcontainername : UInt16* [In],szobjectname : UInt16* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetObjectInfoW(sesid : JET_SESID, dbid : UInt32, objtyp : UInt32, szcontainername : UInt16*, szobjectname : UInt16*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetTableInfoA(sesid : JET_SESID, tableid : JET_TABLEID, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetTableInfoW(sesid : JET_SESID, tableid : JET_TABLEID, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],lpages : UInt32 [In],ldensity : UInt32 [In],ptableid : JET_TABLEID* [In]
  fun JetCreateTableA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, lpages : UInt32, ldensity : UInt32, ptableid : JET_TABLEID*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],lpages : UInt32 [In],ldensity : UInt32 [In],ptableid : JET_TABLEID* [In]
  fun JetCreateTableW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, lpages : UInt32, ldensity : UInt32, ptableid : JET_TABLEID*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE_A* [In]
  fun JetCreateTableColumnIndexA(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE_A*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE_W* [In]
  fun JetCreateTableColumnIndexW(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE_W*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE2_A* [In]
  fun JetCreateTableColumnIndex2A(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE2_A*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE2_W* [In]
  fun JetCreateTableColumnIndex2W(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE2_W*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE3_A* [In]
  fun JetCreateTableColumnIndex3A(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE3_A*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE3_W* [In]
  fun JetCreateTableColumnIndex3W(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE3_W*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE4_A* [In]
  fun JetCreateTableColumnIndex4A(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE4_A*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],ptablecreate : JET_TABLECREATE4_W* [In]
  fun JetCreateTableColumnIndex4W(sesid : JET_SESID, dbid : UInt32, ptablecreate : JET_TABLECREATE4_W*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In]
  fun JetDeleteTableA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In]
  fun JetDeleteTableW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],szname : Int8* [In],sznamenew : Int8* [In]
  fun JetRenameTableA(sesid : JET_SESID, dbid : UInt32, szname : Int8*, sznamenew : Int8*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],szname : UInt16* [In],sznamenew : UInt16* [In]
  fun JetRenameTableW(sesid : JET_SESID, dbid : UInt32, szname : UInt16*, sznamenew : UInt16*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : Int8* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetTableColumnInfoA(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : Int8*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : UInt16* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetTableColumnInfoW(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : UInt16*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],pcolumnnameorid : Int8* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetColumnInfoA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, pcolumnnameorid : Int8*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],pwcolumnnameorid : UInt16* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetColumnInfoW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, pwcolumnnameorid : UInt16*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : Int8* [In],pcolumndef : JET_COLUMNDEF* [In],pvdefault : Void* [In],cbdefault : UInt32 [In],pcolumnid : UInt32* [In]
  fun JetAddColumnA(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : Int8*, pcolumndef : JET_COLUMNDEF*, pvdefault : Void*, cbdefault : UInt32, pcolumnid : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : UInt16* [In],pcolumndef : JET_COLUMNDEF* [In],pvdefault : Void* [In],cbdefault : UInt32 [In],pcolumnid : UInt32* [In]
  fun JetAddColumnW(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : UInt16*, pcolumndef : JET_COLUMNDEF*, pvdefault : Void*, cbdefault : UInt32, pcolumnid : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : Int8* [In]
  fun JetDeleteColumnA(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : Int8*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : UInt16* [In]
  fun JetDeleteColumnW(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : UInt16*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : Int8* [In],grbit : UInt32 [In]
  fun JetDeleteColumn2A(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : Int8*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szcolumnname : UInt16* [In],grbit : UInt32 [In]
  fun JetDeleteColumn2W(sesid : JET_SESID, tableid : JET_TABLEID, szcolumnname : UInt16*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szname : Int8* [In],sznamenew : Int8* [In],grbit : UInt32 [In]
  fun JetRenameColumnA(sesid : JET_SESID, tableid : JET_TABLEID, szname : Int8*, sznamenew : Int8*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szname : UInt16* [In],sznamenew : UInt16* [In],grbit : UInt32 [In]
  fun JetRenameColumnW(sesid : JET_SESID, tableid : JET_TABLEID, szname : UInt16*, sznamenew : UInt16*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],szcolumnname : Int8* [In],pvdata : Void* [In],cbdata : UInt32 [In],grbit : UInt32 [In]
  fun JetSetColumnDefaultValueA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, szcolumnname : Int8*, pvdata : Void*, cbdata : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],szcolumnname : UInt16* [In],pvdata : Void* [In],cbdata : UInt32 [In],grbit : UInt32 [In]
  fun JetSetColumnDefaultValueW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, szcolumnname : UInt16*, pvdata : Void*, cbdata : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In],pvresult : Void* [In],cbresult : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetTableIndexInfoA(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*, pvresult : Void*, cbresult : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In],pvresult : Void* [In],cbresult : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetTableIndexInfoW(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*, pvresult : Void*, cbresult : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],szindexname : Int8* [In],pvresult : Void* [In],cbresult : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetIndexInfoA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, szindexname : Int8*, pvresult : Void*, cbresult : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],szindexname : UInt16* [In],pvresult : Void* [In],cbresult : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetIndexInfoW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, szindexname : UInt16*, pvresult : Void*, cbresult : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In],grbit : UInt32 [In],szkey : PSTR [In],cbkey : UInt32 [In],ldensity : UInt32 [In]
  fun JetCreateIndexA(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*, grbit : UInt32, szkey : PSTR, cbkey : UInt32, ldensity : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In],grbit : UInt32 [In],szkey : LibC::LPWSTR [In],cbkey : UInt32 [In],ldensity : UInt32 [In]
  fun JetCreateIndexW(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*, grbit : UInt32, szkey : LibC::LPWSTR, cbkey : UInt32, ldensity : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pindexcreate : JET_INDEXCREATE_A* [In],cindexcreate : UInt32 [In]
  fun JetCreateIndex2A(sesid : JET_SESID, tableid : JET_TABLEID, pindexcreate : JET_INDEXCREATE_A*, cindexcreate : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pindexcreate : JET_INDEXCREATE_W* [In],cindexcreate : UInt32 [In]
  fun JetCreateIndex2W(sesid : JET_SESID, tableid : JET_TABLEID, pindexcreate : JET_INDEXCREATE_W*, cindexcreate : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pindexcreate : JET_INDEXCREATE2_A* [In],cindexcreate : UInt32 [In]
  fun JetCreateIndex3A(sesid : JET_SESID, tableid : JET_TABLEID, pindexcreate : JET_INDEXCREATE2_A*, cindexcreate : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pindexcreate : JET_INDEXCREATE2_W* [In],cindexcreate : UInt32 [In]
  fun JetCreateIndex3W(sesid : JET_SESID, tableid : JET_TABLEID, pindexcreate : JET_INDEXCREATE2_W*, cindexcreate : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pindexcreate : JET_INDEXCREATE3_A* [In],cindexcreate : UInt32 [In]
  fun JetCreateIndex4A(sesid : JET_SESID, tableid : JET_TABLEID, pindexcreate : JET_INDEXCREATE3_A*, cindexcreate : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pindexcreate : JET_INDEXCREATE3_W* [In],cindexcreate : UInt32 [In]
  fun JetCreateIndex4W(sesid : JET_SESID, tableid : JET_TABLEID, pindexcreate : JET_INDEXCREATE3_W*, cindexcreate : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In]
  fun JetDeleteIndexA(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In]
  fun JetDeleteIndexW(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*) : Int32

  # Params # sesid : JET_SESID [In]
  fun JetBeginTransaction(sesid : JET_SESID) : Int32

  # Params # sesid : JET_SESID [In],grbit : UInt32 [In]
  fun JetBeginTransaction2(sesid : JET_SESID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],trxid : Int64 [In],grbit : UInt32 [In]
  fun JetBeginTransaction3(sesid : JET_SESID, trxid : Int64, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],grbit : UInt32 [In]
  fun JetCommitTransaction(sesid : JET_SESID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],grbit : UInt32 [In],cmsecdurablecommit : UInt32 [In],pcommitid : JET_COMMIT_ID* [In]
  fun JetCommitTransaction2(sesid : JET_SESID, grbit : UInt32, cmsecdurablecommit : UInt32, pcommitid : JET_COMMIT_ID*) : Int32

  # Params # sesid : JET_SESID [In],grbit : UInt32 [In]
  fun JetRollback(sesid : JET_SESID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetDatabaseInfoA(sesid : JET_SESID, dbid : UInt32, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetDatabaseInfoW(sesid : JET_SESID, dbid : UInt32, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # szdatabasename : Int8* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetDatabaseFileInfoA(szdatabasename : Int8*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # szdatabasename : UInt16* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetDatabaseFileInfoW(szdatabasename : UInt16*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : Int8* [In],szconnect : Int8* [In],pdbid : UInt32* [In],grbit : UInt32 [In]
  fun JetOpenDatabaseA(sesid : JET_SESID, szfilename : Int8*, szconnect : Int8*, pdbid : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szfilename : UInt16* [In],szconnect : UInt16* [In],pdbid : UInt32* [In],grbit : UInt32 [In]
  fun JetOpenDatabaseW(sesid : JET_SESID, szfilename : UInt16*, szconnect : UInt16*, pdbid : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],grbit : UInt32 [In]
  fun JetCloseDatabase(sesid : JET_SESID, dbid : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],pvparameters : Void* [In],cbparameters : UInt32 [In],grbit : UInt32 [In],ptableid : JET_TABLEID* [In]
  fun JetOpenTableA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, pvparameters : Void*, cbparameters : UInt32, grbit : UInt32, ptableid : JET_TABLEID*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],pvparameters : Void* [In],cbparameters : UInt32 [In],grbit : UInt32 [In],ptableid : JET_TABLEID* [In]
  fun JetOpenTableW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, pvparameters : Void*, cbparameters : UInt32, grbit : UInt32, ptableid : JET_TABLEID*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],grbit : UInt32 [In]
  fun JetSetTableSequential(sesid : JET_SESID, tableid : JET_TABLEID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],grbit : UInt32 [In]
  fun JetResetTableSequential(sesid : JET_SESID, tableid : JET_TABLEID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In]
  fun JetCloseTable(sesid : JET_SESID, tableid : JET_TABLEID) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In]
  fun JetDelete(sesid : JET_SESID, tableid : JET_TABLEID) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvbookmark : Void* [In],cbbookmark : UInt32 [In],pcbactual : UInt32* [In]
  fun JetUpdate(sesid : JET_SESID, tableid : JET_TABLEID, pvbookmark : Void*, cbbookmark : UInt32, pcbactual : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvbookmark : Void* [In],cbbookmark : UInt32 [In],pcbactual : UInt32* [In],grbit : UInt32 [In]
  fun JetUpdate2(sesid : JET_SESID, tableid : JET_TABLEID, pvbookmark : Void*, cbbookmark : UInt32, pcbactual : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],columnid : UInt32 [In],pv : Void* [In],cbmax : UInt32 [In],pvold : Void* [In],cboldmax : UInt32 [In],pcboldactual : UInt32* [In],grbit : UInt32 [In]
  fun JetEscrowUpdate(sesid : JET_SESID, tableid : JET_TABLEID, columnid : UInt32, pv : Void*, cbmax : UInt32, pvold : Void*, cboldmax : UInt32, pcboldactual : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],columnid : UInt32 [In],pvdata : Void* [In],cbdata : UInt32 [In],pcbactual : UInt32* [In],grbit : UInt32 [In],pretinfo : JET_RETINFO* [In]
  fun JetRetrieveColumn(sesid : JET_SESID, tableid : JET_TABLEID, columnid : UInt32, pvdata : Void*, cbdata : UInt32, pcbactual : UInt32*, grbit : UInt32, pretinfo : JET_RETINFO*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pretrievecolumn : JET_RETRIEVECOLUMN* [In],cretrievecolumn : UInt32 [In]
  fun JetRetrieveColumns(sesid : JET_SESID, tableid : JET_TABLEID, pretrievecolumn : JET_RETRIEVECOLUMN*, cretrievecolumn : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],cenumcolumnid : UInt32 [In],rgenumcolumnid : JET_ENUMCOLUMNID* [In],pcenumcolumn : UInt32* [In],prgenumcolumn : JET_ENUMCOLUMN** [In],pfnrealloc : JET_PFNREALLOC [In],pvrealloccontext : Void* [In],cbdatamost : UInt32 [In],grbit : UInt32 [In]
  fun JetEnumerateColumns(sesid : JET_SESID, tableid : JET_TABLEID, cenumcolumnid : UInt32, rgenumcolumnid : JET_ENUMCOLUMNID*, pcenumcolumn : UInt32*, prgenumcolumn : JET_ENUMCOLUMN**, pfnrealloc : JET_PFNREALLOC, pvrealloccontext : Void*, cbdatamost : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],precsize : JET_RECSIZE* [In],grbit : UInt32 [In]
  fun JetGetRecordSize(sesid : JET_SESID, tableid : JET_TABLEID, precsize : JET_RECSIZE*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],precsize : JET_RECSIZE2* [In],grbit : UInt32 [In]
  fun JetGetRecordSize2(sesid : JET_SESID, tableid : JET_TABLEID, precsize : JET_RECSIZE2*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],columnid : UInt32 [In],pvdata : Void* [In],cbdata : UInt32 [In],grbit : UInt32 [In],psetinfo : JET_SETINFO* [In]
  fun JetSetColumn(sesid : JET_SESID, tableid : JET_TABLEID, columnid : UInt32, pvdata : Void*, cbdata : UInt32, grbit : UInt32, psetinfo : JET_SETINFO*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],psetcolumn : JET_SETCOLUMN* [In],csetcolumn : UInt32 [In]
  fun JetSetColumns(sesid : JET_SESID, tableid : JET_TABLEID, psetcolumn : JET_SETCOLUMN*, csetcolumn : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],prep : UInt32 [In]
  fun JetPrepareUpdate(sesid : JET_SESID, tableid : JET_TABLEID, prep : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],precpos : JET_RECPOS* [In],cbrecpos : UInt32 [In]
  fun JetGetRecordPosition(sesid : JET_SESID, tableid : JET_TABLEID, precpos : JET_RECPOS*, cbrecpos : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],precpos : JET_RECPOS* [In]
  fun JetGotoPosition(sesid : JET_SESID, tableid : JET_TABLEID, precpos : JET_RECPOS*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In]
  fun JetGetCursorInfo(sesid : JET_SESID, tableid : JET_TABLEID, pvresult : Void*, cbmax : UInt32, infolevel : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],ptableid : JET_TABLEID* [In],grbit : UInt32 [In]
  fun JetDupCursor(sesid : JET_SESID, tableid : JET_TABLEID, ptableid : JET_TABLEID*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In],cbindexname : UInt32 [In]
  fun JetGetCurrentIndexA(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*, cbindexname : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In],cbindexname : UInt32 [In]
  fun JetGetCurrentIndexW(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*, cbindexname : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In]
  fun JetSetCurrentIndexA(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In]
  fun JetSetCurrentIndexW(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In],grbit : UInt32 [In]
  fun JetSetCurrentIndex2A(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In],grbit : UInt32 [In]
  fun JetSetCurrentIndex2W(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In],grbit : UInt32 [In],itagsequence : UInt32 [In]
  fun JetSetCurrentIndex3A(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*, grbit : UInt32, itagsequence : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In],grbit : UInt32 [In],itagsequence : UInt32 [In]
  fun JetSetCurrentIndex3W(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*, grbit : UInt32, itagsequence : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : Int8* [In],pindexid : JET_INDEXID* [In],grbit : UInt32 [In],itagsequence : UInt32 [In]
  fun JetSetCurrentIndex4A(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : Int8*, pindexid : JET_INDEXID*, grbit : UInt32, itagsequence : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],szindexname : UInt16* [In],pindexid : JET_INDEXID* [In],grbit : UInt32 [In],itagsequence : UInt32 [In]
  fun JetSetCurrentIndex4W(sesid : JET_SESID, tableid : JET_TABLEID, szindexname : UInt16*, pindexid : JET_INDEXID*, grbit : UInt32, itagsequence : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],crow : Int32 [In],grbit : UInt32 [In]
  fun JetMove(sesid : JET_SESID, tableid : JET_TABLEID, crow : Int32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],rgcolumnfilters : JET_INDEX_COLUMN* [In],ccolumnfilters : UInt32 [In],grbit : UInt32 [In]
  fun JetSetCursorFilter(sesid : JET_SESID, tableid : JET_TABLEID, rgcolumnfilters : JET_INDEX_COLUMN*, ccolumnfilters : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],grbit : UInt32 [In]
  fun JetGetLock(sesid : JET_SESID, tableid : JET_TABLEID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvdata : Void* [In],cbdata : UInt32 [In],grbit : UInt32 [In]
  fun JetMakeKey(sesid : JET_SESID, tableid : JET_TABLEID, pvdata : Void*, cbdata : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],grbit : UInt32 [In]
  fun JetSeek(sesid : JET_SESID, tableid : JET_TABLEID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],rgpvkeys : Void** [In],rgcbkeys : UInt32* [In],ckeys : Int32 [In],pckeyspreread : Int32* [In],grbit : UInt32 [In]
  fun JetPrereadKeys(sesid : JET_SESID, tableid : JET_TABLEID, rgpvkeys : Void**, rgcbkeys : UInt32*, ckeys : Int32, pckeyspreread : Int32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],rgindexranges : JET_INDEX_RANGE* [In],cindexranges : UInt32 [In],pcrangespreread : UInt32* [In],rgcolumnidpreread : UInt32* [In],ccolumnidpreread : UInt32 [In],grbit : UInt32 [In]
  fun JetPrereadIndexRanges(sesid : JET_SESID, tableid : JET_TABLEID, rgindexranges : JET_INDEX_RANGE*, cindexranges : UInt32, pcrangespreread : UInt32*, rgcolumnidpreread : UInt32*, ccolumnidpreread : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvbookmark : Void* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetBookmark(sesid : JET_SESID, tableid : JET_TABLEID, pvbookmark : Void*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvsecondarykey : Void* [In],cbsecondarykeymax : UInt32 [In],pcbsecondarykeyactual : UInt32* [In],pvprimarybookmark : Void* [In],cbprimarybookmarkmax : UInt32 [In],pcbprimarybookmarkactual : UInt32* [In],grbit : UInt32 [In]
  fun JetGetSecondaryIndexBookmark(sesid : JET_SESID, tableid : JET_TABLEID, pvsecondarykey : Void*, cbsecondarykeymax : UInt32, pcbsecondarykeyactual : UInt32*, pvprimarybookmark : Void*, cbprimarybookmarkmax : UInt32, pcbprimarybookmarkactual : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szdatabasesrc : Int8* [In],szdatabasedest : Int8* [In],pfnstatus : JET_PFNSTATUS [In],pconvert : CONVERT_A* [In],grbit : UInt32 [In]
  fun JetCompactA(sesid : JET_SESID, szdatabasesrc : Int8*, szdatabasedest : Int8*, pfnstatus : JET_PFNSTATUS, pconvert : CONVERT_A*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szdatabasesrc : UInt16* [In],szdatabasedest : UInt16* [In],pfnstatus : JET_PFNSTATUS [In],pconvert : CONVERT_W* [In],grbit : UInt32 [In]
  fun JetCompactW(sesid : JET_SESID, szdatabasesrc : UInt16*, szdatabasedest : UInt16*, pfnstatus : JET_PFNSTATUS, pconvert : CONVERT_W*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],pcpasses : UInt32* [In],pcseconds : UInt32* [In],grbit : UInt32 [In]
  fun JetDefragmentA(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, pcpasses : UInt32*, pcseconds : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],pcpasses : UInt32* [In],pcseconds : UInt32* [In],grbit : UInt32 [In]
  fun JetDefragmentW(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, pcpasses : UInt32*, pcseconds : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : Int8* [In],pcpasses : UInt32* [In],pcseconds : UInt32* [In],callback : JET_CALLBACK [In],grbit : UInt32 [In]
  fun JetDefragment2A(sesid : JET_SESID, dbid : UInt32, sztablename : Int8*, pcpasses : UInt32*, pcseconds : UInt32*, callback : JET_CALLBACK, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],sztablename : UInt16* [In],pcpasses : UInt32* [In],pcseconds : UInt32* [In],callback : JET_CALLBACK [In],grbit : UInt32 [In]
  fun JetDefragment2W(sesid : JET_SESID, dbid : UInt32, sztablename : UInt16*, pcpasses : UInt32*, pcseconds : UInt32*, callback : JET_CALLBACK, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szdatabasename : Int8* [In],sztablename : Int8* [In],pcpasses : UInt32* [In],pcseconds : UInt32* [In],callback : JET_CALLBACK [In],pvcontext : Void* [In],grbit : UInt32 [In]
  fun JetDefragment3A(sesid : JET_SESID, szdatabasename : Int8*, sztablename : Int8*, pcpasses : UInt32*, pcseconds : UInt32*, callback : JET_CALLBACK, pvcontext : Void*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szdatabasename : UInt16* [In],sztablename : UInt16* [In],pcpasses : UInt32* [In],pcseconds : UInt32* [In],callback : JET_CALLBACK [In],pvcontext : Void* [In],grbit : UInt32 [In]
  fun JetDefragment3W(sesid : JET_SESID, szdatabasename : UInt16*, sztablename : UInt16*, pcpasses : UInt32*, pcseconds : UInt32*, callback : JET_CALLBACK, pvcontext : Void*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],szdatabasename : Int8* [In],cpg : UInt32 [In],pcpgreal : UInt32* [In]
  fun JetSetDatabaseSizeA(sesid : JET_SESID, szdatabasename : Int8*, cpg : UInt32, pcpgreal : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],szdatabasename : UInt16* [In],cpg : UInt32 [In],pcpgreal : UInt32* [In]
  fun JetSetDatabaseSizeW(sesid : JET_SESID, szdatabasename : UInt16*, cpg : UInt32, pcpgreal : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],cpg : UInt32 [In],pcpgreal : UInt32* [In]
  fun JetGrowDatabase(sesid : JET_SESID, dbid : UInt32, cpg : UInt32, pcpgreal : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],dbid : UInt32 [In],cpgtarget : UInt32 [In],pcpgactual : UInt32* [In],grbit : UInt32 [In]
  fun JetResizeDatabase(sesid : JET_SESID, dbid : UInt32, cpgtarget : UInt32, pcpgactual : UInt32*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],ulcontext : JET_API_PTR [In]
  fun JetSetSessionContext(sesid : JET_SESID, ulcontext : JET_API_PTR) : Int32

  # Params # sesid : JET_SESID [In]
  fun JetResetSessionContext(sesid : JET_SESID) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvbookmark : Void* [In],cbbookmark : UInt32 [In]
  fun JetGotoBookmark(sesid : JET_SESID, tableid : JET_TABLEID, pvbookmark : Void*, cbbookmark : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvsecondarykey : Void* [In],cbsecondarykey : UInt32 [In],pvprimarybookmark : Void* [In],cbprimarybookmark : UInt32 [In],grbit : UInt32 [In]
  fun JetGotoSecondaryIndexBookmark(sesid : JET_SESID, tableid : JET_TABLEID, pvsecondarykey : Void*, cbsecondarykey : UInt32, pvprimarybookmark : Void*, cbprimarybookmark : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],rgindexrange : JET_INDEXRANGE* [In],cindexrange : UInt32 [In],precordlist : JET_RECORDLIST* [In],grbit : UInt32 [In]
  fun JetIntersectIndexes(sesid : JET_SESID, rgindexrange : JET_INDEXRANGE*, cindexrange : UInt32, precordlist : JET_RECORDLIST*, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In]
  fun JetComputeStats(sesid : JET_SESID, tableid : JET_TABLEID) : Int32

  # Params # sesid : JET_SESID [In],prgcolumndef : JET_COLUMNDEF* [In],ccolumn : UInt32 [In],grbit : UInt32 [In],ptableid : JET_TABLEID* [In],prgcolumnid : UInt32* [In]
  fun JetOpenTempTable(sesid : JET_SESID, prgcolumndef : JET_COLUMNDEF*, ccolumn : UInt32, grbit : UInt32, ptableid : JET_TABLEID*, prgcolumnid : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],prgcolumndef : JET_COLUMNDEF* [In],ccolumn : UInt32 [In],lcid : UInt32 [In],grbit : UInt32 [In],ptableid : JET_TABLEID* [In],prgcolumnid : UInt32* [In]
  fun JetOpenTempTable2(sesid : JET_SESID, prgcolumndef : JET_COLUMNDEF*, ccolumn : UInt32, lcid : UInt32, grbit : UInt32, ptableid : JET_TABLEID*, prgcolumnid : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],prgcolumndef : JET_COLUMNDEF* [In],ccolumn : UInt32 [In],pidxunicode : JET_UNICODEINDEX* [In],grbit : UInt32 [In],ptableid : JET_TABLEID* [In],prgcolumnid : UInt32* [In]
  fun JetOpenTempTable3(sesid : JET_SESID, prgcolumndef : JET_COLUMNDEF*, ccolumn : UInt32, pidxunicode : JET_UNICODEINDEX*, grbit : UInt32, ptableid : JET_TABLEID*, prgcolumnid : UInt32*) : Int32

  # Params # sesid : JET_SESID [In],popentemporarytable : JET_OPENTEMPORARYTABLE* [In]
  fun JetOpenTemporaryTable(sesid : JET_SESID, popentemporarytable : JET_OPENTEMPORARYTABLE*) : Int32

  # Params # sesid : JET_SESID [In],popentemporarytable : JET_OPENTEMPORARYTABLE2* [In]
  fun JetOpenTemporaryTable2(sesid : JET_SESID, popentemporarytable : JET_OPENTEMPORARYTABLE2*) : Int32

  # Params # szbackuppath : Int8* [In],grbit : UInt32 [In],pfnstatus : JET_PFNSTATUS [In]
  fun JetBackupA(szbackuppath : Int8*, grbit : UInt32, pfnstatus : JET_PFNSTATUS) : Int32

  # Params # szbackuppath : UInt16* [In],grbit : UInt32 [In],pfnstatus : JET_PFNSTATUS [In]
  fun JetBackupW(szbackuppath : UInt16*, grbit : UInt32, pfnstatus : JET_PFNSTATUS) : Int32

  # Params # instance : JET_INSTANCE [In],szbackuppath : Int8* [In],grbit : UInt32 [In],pfnstatus : JET_PFNSTATUS [In]
  fun JetBackupInstanceA(instance : JET_INSTANCE, szbackuppath : Int8*, grbit : UInt32, pfnstatus : JET_PFNSTATUS) : Int32

  # Params # instance : JET_INSTANCE [In],szbackuppath : UInt16* [In],grbit : UInt32 [In],pfnstatus : JET_PFNSTATUS [In]
  fun JetBackupInstanceW(instance : JET_INSTANCE, szbackuppath : UInt16*, grbit : UInt32, pfnstatus : JET_PFNSTATUS) : Int32

  # Params # szsource : Int8* [In],pfn : JET_PFNSTATUS [In]
  fun JetRestoreA(szsource : Int8*, pfn : JET_PFNSTATUS) : Int32

  # Params # szsource : UInt16* [In],pfn : JET_PFNSTATUS [In]
  fun JetRestoreW(szsource : UInt16*, pfn : JET_PFNSTATUS) : Int32

  # Params # sz : Int8* [In],szdest : Int8* [In],pfn : JET_PFNSTATUS [In]
  fun JetRestore2A(sz : Int8*, szdest : Int8*, pfn : JET_PFNSTATUS) : Int32

  # Params # sz : UInt16* [In],szdest : UInt16* [In],pfn : JET_PFNSTATUS [In]
  fun JetRestore2W(sz : UInt16*, szdest : UInt16*, pfn : JET_PFNSTATUS) : Int32

  # Params # instance : JET_INSTANCE [In],sz : Int8* [In],szdest : Int8* [In],pfn : JET_PFNSTATUS [In]
  fun JetRestoreInstanceA(instance : JET_INSTANCE, sz : Int8*, szdest : Int8*, pfn : JET_PFNSTATUS) : Int32

  # Params # instance : JET_INSTANCE [In],sz : UInt16* [In],szdest : UInt16* [In],pfn : JET_PFNSTATUS [In]
  fun JetRestoreInstanceW(instance : JET_INSTANCE, sz : UInt16*, szdest : UInt16*, pfn : JET_PFNSTATUS) : Int32

  # Params # sesid : JET_SESID [In],tableidsrc : JET_TABLEID [In],grbit : UInt32 [In]
  fun JetSetIndexRange(sesid : JET_SESID, tableidsrc : JET_TABLEID, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pcrec : UInt32* [In],crecmax : UInt32 [In]
  fun JetIndexRecordCount(sesid : JET_SESID, tableid : JET_TABLEID, pcrec : UInt32*, crecmax : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pvkey : Void* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In],grbit : UInt32 [In]
  fun JetRetrieveKey(sesid : JET_SESID, tableid : JET_TABLEID, pvkey : Void*, cbmax : UInt32, pcbactual : UInt32*, grbit : UInt32) : Int32

  # Params # grbit : UInt32 [In]
  fun JetBeginExternalBackup(grbit : UInt32) : Int32

  # Params # instance : JET_INSTANCE [In],grbit : UInt32 [In]
  fun JetBeginExternalBackupInstance(instance : JET_INSTANCE, grbit : UInt32) : Int32

  # Params # szzdatabases : Int8* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetAttachInfoA(szzdatabases : Int8*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # wszzdatabases : UInt16* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetAttachInfoW(wszzdatabases : UInt16*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],szzdatabases : Int8* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetAttachInfoInstanceA(instance : JET_INSTANCE, szzdatabases : Int8*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],szzdatabases : UInt16* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetAttachInfoInstanceW(instance : JET_INSTANCE, szzdatabases : UInt16*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # szfilename : Int8* [In],phffile : JET_HANDLE* [In],pulfilesizelow : UInt32* [In],pulfilesizehigh : UInt32* [In]
  fun JetOpenFileA(szfilename : Int8*, phffile : JET_HANDLE*, pulfilesizelow : UInt32*, pulfilesizehigh : UInt32*) : Int32

  # Params # szfilename : UInt16* [In],phffile : JET_HANDLE* [In],pulfilesizelow : UInt32* [In],pulfilesizehigh : UInt32* [In]
  fun JetOpenFileW(szfilename : UInt16*, phffile : JET_HANDLE*, pulfilesizelow : UInt32*, pulfilesizehigh : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],szfilename : Int8* [In],phffile : JET_HANDLE* [In],pulfilesizelow : UInt32* [In],pulfilesizehigh : UInt32* [In]
  fun JetOpenFileInstanceA(instance : JET_INSTANCE, szfilename : Int8*, phffile : JET_HANDLE*, pulfilesizelow : UInt32*, pulfilesizehigh : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],szfilename : UInt16* [In],phffile : JET_HANDLE* [In],pulfilesizelow : UInt32* [In],pulfilesizehigh : UInt32* [In]
  fun JetOpenFileInstanceW(instance : JET_INSTANCE, szfilename : UInt16*, phffile : JET_HANDLE*, pulfilesizelow : UInt32*, pulfilesizehigh : UInt32*) : Int32

  # Params # hffile : JET_HANDLE [In],pv : Void* [In],cb : UInt32 [In],pcbactual : UInt32* [In]
  fun JetReadFile(hffile : JET_HANDLE, pv : Void*, cb : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],hffile : JET_HANDLE [In],pv : Void* [In],cb : UInt32 [In],pcbactual : UInt32* [In]
  fun JetReadFileInstance(instance : JET_INSTANCE, hffile : JET_HANDLE, pv : Void*, cb : UInt32, pcbactual : UInt32*) : Int32

  # Params # hffile : JET_HANDLE [In]
  fun JetCloseFile(hffile : JET_HANDLE) : Int32

  # Params # instance : JET_INSTANCE [In],hffile : JET_HANDLE [In]
  fun JetCloseFileInstance(instance : JET_INSTANCE, hffile : JET_HANDLE) : Int32

  # Params # szzlogs : Int8* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetLogInfoA(szzlogs : Int8*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # szzlogs : UInt16* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetLogInfoW(szzlogs : UInt16*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],szzlogs : Int8* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetLogInfoInstanceA(instance : JET_INSTANCE, szzlogs : Int8*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],wszzlogs : UInt16* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetLogInfoInstanceW(instance : JET_INSTANCE, wszzlogs : UInt16*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],szzlogs : Int8* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In],ploginfo : JET_LOGINFO_A* [In]
  fun JetGetLogInfoInstance2A(instance : JET_INSTANCE, szzlogs : Int8*, cbmax : UInt32, pcbactual : UInt32*, ploginfo : JET_LOGINFO_A*) : Int32

  # Params # instance : JET_INSTANCE [In],wszzlogs : UInt16* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In],ploginfo : JET_LOGINFO_W* [In]
  fun JetGetLogInfoInstance2W(instance : JET_INSTANCE, wszzlogs : UInt16*, cbmax : UInt32, pcbactual : UInt32*, ploginfo : JET_LOGINFO_W*) : Int32

  # Params # instance : JET_INSTANCE [In],szzlogs : Int8* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetTruncateLogInfoInstanceA(instance : JET_INSTANCE, szzlogs : Int8*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # instance : JET_INSTANCE [In],wszzlogs : UInt16* [In],cbmax : UInt32 [In],pcbactual : UInt32* [In]
  fun JetGetTruncateLogInfoInstanceW(instance : JET_INSTANCE, wszzlogs : UInt16*, cbmax : UInt32, pcbactual : UInt32*) : Int32

  # Params # 
  fun JetTruncateLog : Int32

  # Params # instance : JET_INSTANCE [In]
  fun JetTruncateLogInstance(instance : JET_INSTANCE) : Int32

  # Params # 
  fun JetEndExternalBackup : Int32

  # Params # instance : JET_INSTANCE [In]
  fun JetEndExternalBackupInstance(instance : JET_INSTANCE) : Int32

  # Params # instance : JET_INSTANCE [In],grbit : UInt32 [In]
  fun JetEndExternalBackupInstance2(instance : JET_INSTANCE, grbit : UInt32) : Int32

  # Params # szcheckpointfilepath : Int8* [In],szlogpath : Int8* [In],rgrstmap : JET_RSTMAP_A* [In],crstfilemap : Int32 [In],szbackuplogpath : Int8* [In],genlow : Int32 [In],genhigh : Int32 [In],pfn : JET_PFNSTATUS [In]
  fun JetExternalRestoreA(szcheckpointfilepath : Int8*, szlogpath : Int8*, rgrstmap : JET_RSTMAP_A*, crstfilemap : Int32, szbackuplogpath : Int8*, genlow : Int32, genhigh : Int32, pfn : JET_PFNSTATUS) : Int32

  # Params # szcheckpointfilepath : UInt16* [In],szlogpath : UInt16* [In],rgrstmap : JET_RSTMAP_W* [In],crstfilemap : Int32 [In],szbackuplogpath : UInt16* [In],genlow : Int32 [In],genhigh : Int32 [In],pfn : JET_PFNSTATUS [In]
  fun JetExternalRestoreW(szcheckpointfilepath : UInt16*, szlogpath : UInt16*, rgrstmap : JET_RSTMAP_W*, crstfilemap : Int32, szbackuplogpath : UInt16*, genlow : Int32, genhigh : Int32, pfn : JET_PFNSTATUS) : Int32

  # Params # szcheckpointfilepath : Int8* [In],szlogpath : Int8* [In],rgrstmap : JET_RSTMAP_A* [In],crstfilemap : Int32 [In],szbackuplogpath : Int8* [In],ploginfo : JET_LOGINFO_A* [In],sztargetinstancename : Int8* [In],sztargetinstancelogpath : Int8* [In],sztargetinstancecheckpointpath : Int8* [In],pfn : JET_PFNSTATUS [In]
  fun JetExternalRestore2A(szcheckpointfilepath : Int8*, szlogpath : Int8*, rgrstmap : JET_RSTMAP_A*, crstfilemap : Int32, szbackuplogpath : Int8*, ploginfo : JET_LOGINFO_A*, sztargetinstancename : Int8*, sztargetinstancelogpath : Int8*, sztargetinstancecheckpointpath : Int8*, pfn : JET_PFNSTATUS) : Int32

  # Params # szcheckpointfilepath : UInt16* [In],szlogpath : UInt16* [In],rgrstmap : JET_RSTMAP_W* [In],crstfilemap : Int32 [In],szbackuplogpath : UInt16* [In],ploginfo : JET_LOGINFO_W* [In],sztargetinstancename : UInt16* [In],sztargetinstancelogpath : UInt16* [In],sztargetinstancecheckpointpath : UInt16* [In],pfn : JET_PFNSTATUS [In]
  fun JetExternalRestore2W(szcheckpointfilepath : UInt16*, szlogpath : UInt16*, rgrstmap : JET_RSTMAP_W*, crstfilemap : Int32, szbackuplogpath : UInt16*, ploginfo : JET_LOGINFO_W*, sztargetinstancename : UInt16*, sztargetinstancelogpath : UInt16*, sztargetinstancecheckpointpath : UInt16*, pfn : JET_PFNSTATUS) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],cbtyp : UInt32 [In],pcallback : JET_CALLBACK [In],pvcontext : Void* [In],phcallbackid : JET_HANDLE* [In]
  fun JetRegisterCallback(sesid : JET_SESID, tableid : JET_TABLEID, cbtyp : UInt32, pcallback : JET_CALLBACK, pvcontext : Void*, phcallbackid : JET_HANDLE*) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],cbtyp : UInt32 [In],hcallbackid : JET_HANDLE [In]
  fun JetUnregisterCallback(sesid : JET_SESID, tableid : JET_TABLEID, cbtyp : UInt32, hcallbackid : JET_HANDLE) : Int32

  # Params # pcinstanceinfo : UInt32* [In],painstanceinfo : JET_INSTANCE_INFO_A** [In]
  fun JetGetInstanceInfoA(pcinstanceinfo : UInt32*, painstanceinfo : JET_INSTANCE_INFO_A**) : Int32

  # Params # pcinstanceinfo : UInt32* [In],painstanceinfo : JET_INSTANCE_INFO_W** [In]
  fun JetGetInstanceInfoW(pcinstanceinfo : UInt32*, painstanceinfo : JET_INSTANCE_INFO_W**) : Int32

  # Params # pbbuf : PSTR [In]
  fun JetFreeBuffer(pbbuf : PSTR) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],ls : JET_LS [In],grbit : UInt32 [In]
  fun JetSetLS(sesid : JET_SESID, tableid : JET_TABLEID, ls : JET_LS, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],tableid : JET_TABLEID [In],pls : JET_LS* [In],grbit : UInt32 [In]
  fun JetGetLS(sesid : JET_SESID, tableid : JET_TABLEID, pls : JET_LS*, grbit : UInt32) : Int32

  # Params # psnapid : JET_OSSNAPID* [In],grbit : UInt32 [In]
  fun JetOSSnapshotPrepare(psnapid : JET_OSSNAPID*, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],instance : JET_INSTANCE [In],grbit : UInt32 [In]
  fun JetOSSnapshotPrepareInstance(snapid : JET_OSSNAPID, instance : JET_INSTANCE, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],pcinstanceinfo : UInt32* [In],painstanceinfo : JET_INSTANCE_INFO_A** [In],grbit : UInt32 [In]
  fun JetOSSnapshotFreezeA(snapid : JET_OSSNAPID, pcinstanceinfo : UInt32*, painstanceinfo : JET_INSTANCE_INFO_A**, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],pcinstanceinfo : UInt32* [In],painstanceinfo : JET_INSTANCE_INFO_W** [In],grbit : UInt32 [In]
  fun JetOSSnapshotFreezeW(snapid : JET_OSSNAPID, pcinstanceinfo : UInt32*, painstanceinfo : JET_INSTANCE_INFO_W**, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],grbit : UInt32 [In]
  fun JetOSSnapshotThaw(snapid : JET_OSSNAPID, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],grbit : UInt32 [In]
  fun JetOSSnapshotAbort(snapid : JET_OSSNAPID, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],grbit : UInt32 [In]
  fun JetOSSnapshotTruncateLog(snapid : JET_OSSNAPID, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],instance : JET_INSTANCE [In],grbit : UInt32 [In]
  fun JetOSSnapshotTruncateLogInstance(snapid : JET_OSSNAPID, instance : JET_INSTANCE, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],pcinstanceinfo : UInt32* [In],painstanceinfo : JET_INSTANCE_INFO_A** [In],grbit : UInt32 [In]
  fun JetOSSnapshotGetFreezeInfoA(snapid : JET_OSSNAPID, pcinstanceinfo : UInt32*, painstanceinfo : JET_INSTANCE_INFO_A**, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],pcinstanceinfo : UInt32* [In],painstanceinfo : JET_INSTANCE_INFO_W** [In],grbit : UInt32 [In]
  fun JetOSSnapshotGetFreezeInfoW(snapid : JET_OSSNAPID, pcinstanceinfo : UInt32*, painstanceinfo : JET_INSTANCE_INFO_W**, grbit : UInt32) : Int32

  # Params # snapid : JET_OSSNAPID [In],grbit : UInt32 [In]
  fun JetOSSnapshotEnd(snapid : JET_OSSNAPID, grbit : UInt32) : Int32

  # Params # grbit : UInt32 [In]
  fun JetConfigureProcessForCrashDump(grbit : UInt32) : Int32

  # Params # pvcontext : Void* [In],pvresult : Void* [In],cbmax : UInt32 [In],infolevel : UInt32 [In],grbit : UInt32 [In]
  fun JetGetErrorInfoW(pvcontext : Void*, pvresult : Void*, cbmax : UInt32, infolevel : UInt32, grbit : UInt32) : Int32

  # Params # sesid : JET_SESID [In],sesparamid : UInt32 [In],pvparam : Void* [In],cbparam : UInt32 [In]
  fun JetSetSessionParameter(sesid : JET_SESID, sesparamid : UInt32, pvparam : Void*, cbparam : UInt32) : Int32

  # Params # sesid : JET_SESID [In],sesparamid : UInt32 [In],pvparam : Void* [In],cbparammax : UInt32 [In],pcbparamactual : UInt32* [In]
  fun JetGetSessionParameter(sesid : JET_SESID, sesparamid : UInt32, pvparam : Void*, cbparammax : UInt32, pcbparamactual : UInt32*) : Int32
end
