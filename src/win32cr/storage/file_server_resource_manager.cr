require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Storage::FileServerResourceManager
  FSRM_DISPID_FEATURE_MASK = 251658240_u32
  FSRM_DISPID_INTERFACE_A_MASK = 15728640_u32
  FSRM_DISPID_INTERFACE_B_MASK = 983040_u32
  FSRM_DISPID_INTERFACE_C_MASK = 61440_u32
  FSRM_DISPID_INTERFACE_D_MASK = 3840_u32
  FSRM_DISPID_IS_PROPERTY = 128_u32
  FSRM_DISPID_METHOD_NUM_MASK = 127_u32
  FSRM_DISPID_FEATURE_GENERAL = 16777216_u32
  FSRM_DISPID_FEATURE_QUOTA = 33554432_u32
  FSRM_DISPID_FEATURE_FILESCREEN = 50331648_u32
  FSRM_DISPID_FEATURE_REPORTS = 67108864_u32
  FSRM_DISPID_FEATURE_CLASSIFICATION = 83886080_u32
  FSRM_DISPID_FEATURE_PIPELINE = 100663296_u32
  FsrmMaxNumberThresholds = 16_u32
  FsrmMinThresholdValue = 1_u32
  FsrmMaxThresholdValue = 250_u32
  FsrmMinQuotaLimit = 1024_u32
  FsrmMaxExcludeFolders = 32_u32
  FsrmMaxNumberPropertyDefinitions = 100_u32
  MessageSizeLimit = 4096_u32
  FsrmDaysNotSpecified = -1_i32
  FSRM_S_PARTIAL_BATCH = 283396_i32
  FSRM_S_PARTIAL_CLASSIFICATION = 283397_i32
  FSRM_S_CLASSIFICATION_SCAN_FAILURES = 283398_i32
  FSRM_E_NOT_FOUND = -2147200255_i32
  FSRM_E_INVALID_SCHEDULER_ARGUMENT = -2147200254_i32
  FSRM_E_ALREADY_EXISTS = -2147200253_i32
  FSRM_E_PATH_NOT_FOUND = -2147200252_i32
  FSRM_E_INVALID_USER = -2147200251_i32
  FSRM_E_INVALID_PATH = -2147200250_i32
  FSRM_E_INVALID_LIMIT = -2147200249_i32
  FSRM_E_INVALID_NAME = -2147200248_i32
  FSRM_E_FAIL_BATCH = -2147200247_i32
  FSRM_E_INVALID_TEXT = -2147200246_i32
  FSRM_E_INVALID_IMPORT_VERSION = -2147200245_i32
  FSRM_E_OUT_OF_RANGE = -2147200243_i32
  FSRM_E_REQD_PARAM_MISSING = -2147200242_i32
  FSRM_E_INVALID_COMBINATION = -2147200241_i32
  FSRM_E_DUPLICATE_NAME = -2147200240_i32
  FSRM_E_NOT_SUPPORTED = -2147200239_i32
  FSRM_E_DRIVER_NOT_READY = -2147200237_i32
  FSRM_E_INSUFFICIENT_DISK = -2147200236_i32
  FSRM_E_VOLUME_UNSUPPORTED = -2147200235_i32
  FSRM_E_UNEXPECTED = -2147200234_i32
  FSRM_E_INSECURE_PATH = -2147200233_i32
  FSRM_E_INVALID_SMTP_SERVER = -2147200232_i32
  FSRM_E_AUTO_QUOTA = 283419_i32
  FSRM_E_EMAIL_NOT_SENT = -2147200228_i32
  FSRM_E_INVALID_EMAIL_ADDRESS = -2147200226_i32
  FSRM_E_FILE_SYSTEM_CORRUPT = -2147200225_i32
  FSRM_E_LONG_CMDLINE = -2147200224_i32
  FSRM_E_INVALID_FILEGROUP_DEFINITION = -2147200223_i32
  FSRM_E_INVALID_DATASCREEN_DEFINITION = -2147200220_i32
  FSRM_E_INVALID_REPORT_FORMAT = -2147200216_i32
  FSRM_E_INVALID_REPORT_DESC = -2147200215_i32
  FSRM_E_INVALID_FILENAME = -2147200214_i32
  FSRM_E_SHADOW_COPY = -2147200212_i32
  FSRM_E_XML_CORRUPTED = -2147200211_i32
  FSRM_E_CLUSTER_NOT_RUNNING = -2147200210_i32
  FSRM_E_STORE_NOT_INSTALLED = -2147200209_i32
  FSRM_E_NOT_CLUSTER_VOLUME = -2147200208_i32
  FSRM_E_DIFFERENT_CLUSTER_GROUP = -2147200207_i32
  FSRM_E_REPORT_TYPE_ALREADY_EXISTS = -2147200206_i32
  FSRM_E_REPORT_JOB_ALREADY_RUNNING = -2147200205_i32
  FSRM_E_REPORT_GENERATION_ERR = -2147200204_i32
  FSRM_E_REPORT_TASK_TRIGGER = -2147200203_i32
  FSRM_E_LOADING_DISABLED_MODULE = -2147200202_i32
  FSRM_E_CANNOT_AGGREGATE = -2147200201_i32
  FSRM_E_MESSAGE_LIMIT_EXCEEDED = -2147200200_i32
  FSRM_E_OBJECT_IN_USE = -2147200199_i32
  FSRM_E_CANNOT_RENAME_PROPERTY = -2147200198_i32
  FSRM_E_CANNOT_CHANGE_PROPERTY_TYPE = -2147200197_i32
  FSRM_E_MAX_PROPERTY_DEFINITIONS = -2147200196_i32
  FSRM_E_CLASSIFICATION_ALREADY_RUNNING = -2147200195_i32
  FSRM_E_CLASSIFICATION_NOT_RUNNING = -2147200194_i32
  FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_RUNNING = -2147200193_i32
  FSRM_E_FILE_MANAGEMENT_JOB_EXPIRATION = -2147200192_i32
  FSRM_E_FILE_MANAGEMENT_JOB_CUSTOM = -2147200191_i32
  FSRM_E_FILE_MANAGEMENT_JOB_NOTIFICATION = -2147200190_i32
  FSRM_E_FILE_OPEN_ERROR = -2147200189_i32
  FSRM_E_UNSECURE_LINK_TO_HOSTED_MODULE = -2147200188_i32
  FSRM_E_CACHE_INVALID = -2147200187_i32
  FSRM_E_CACHE_MODULE_ALREADY_EXISTS = -2147200186_i32
  FSRM_E_FILE_MANAGEMENT_EXPIRATION_DIR_IN_SCOPE = -2147200185_i32
  FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_EXISTS = -2147200184_i32
  FSRM_E_PROPERTY_DELETED = -2147200183_i32
  FSRM_E_LAST_ACCESS_UPDATE_DISABLED = -2147200176_i32
  FSRM_E_NO_PROPERTY_VALUE = -2147200175_i32
  FSRM_E_INPROC_MODULE_BLOCKED = -2147200174_i32
  FSRM_E_ENUM_PROPERTIES_FAILED = -2147200173_i32
  FSRM_E_SET_PROPERTY_FAILED = -2147200172_i32
  FSRM_E_CANNOT_STORE_PROPERTIES = -2147200171_i32
  FSRM_E_CANNOT_ALLOW_REPARSE_POINT_TAG = -2147200170_i32
  FSRM_E_PARTIAL_CLASSIFICATION_PROPERTY_NOT_FOUND = -2147200169_i32
  FSRM_E_TEXTREADER_NOT_INITIALIZED = -2147200168_i32
  FSRM_E_TEXTREADER_IFILTER_NOT_FOUND = -2147200167_i32
  FSRM_E_PERSIST_PROPERTIES_FAILED_ENCRYPTED = -2147200166_i32
  FSRM_E_TEXTREADER_IFILTER_CLSID_MALFORMED = -2147200160_i32
  FSRM_E_TEXTREADER_STREAM_ERROR = -2147200159_i32
  FSRM_E_TEXTREADER_FILENAME_TOO_LONG = -2147200158_i32
  FSRM_E_INCOMPATIBLE_FORMAT = -2147200157_i32
  FSRM_E_FILE_ENCRYPTED = -2147200156_i32
  FSRM_E_PERSIST_PROPERTIES_FAILED = -2147200155_i32
  FSRM_E_VOLUME_OFFLINE = -2147200154_i32
  FSRM_E_FILE_MANAGEMENT_ACTION_TIMEOUT = -2147200153_i32
  FSRM_E_FILE_MANAGEMENT_ACTION_GET_EXITCODE_FAILED = -2147200152_i32
  FSRM_E_MODULE_INVALID_PARAM = -2147200151_i32
  FSRM_E_MODULE_INITIALIZATION = -2147200150_i32
  FSRM_E_MODULE_SESSION_INITIALIZATION = -2147200149_i32
  FSRM_E_CLASSIFICATION_SCAN_FAIL = -2147200148_i32
  FSRM_E_FILE_MANAGEMENT_JOB_NOT_LEGACY_ACCESSIBLE = -2147200147_i32
  FSRM_E_FILE_MANAGEMENT_JOB_MAX_FILE_CONDITIONS = -2147200146_i32
  FSRM_E_CANNOT_USE_DEPRECATED_PROPERTY = -2147200145_i32
  FSRM_E_SYNC_TASK_TIMEOUT = -2147200144_i32
  FSRM_E_CANNOT_USE_DELETED_PROPERTY = -2147200143_i32
  FSRM_E_INVALID_AD_CLAIM = -2147200142_i32
  FSRM_E_CLASSIFICATION_CANCELED = -2147200141_i32
  FSRM_E_INVALID_FOLDER_PROPERTY_STORE = -2147200140_i32
  FSRM_E_REBUILDING_FODLER_TYPE_INDEX = -2147200139_i32
  FSRM_E_PROPERTY_MUST_APPLY_TO_FILES = -2147200138_i32
  FSRM_E_CLASSIFICATION_TIMEOUT = -2147200137_i32
  FSRM_E_CLASSIFICATION_PARTIAL_BATCH = -2147200136_i32
  FSRM_E_CANNOT_DELETE_SYSTEM_PROPERTY = -2147200135_i32
  FSRM_E_FILE_IN_USE = -2147200134_i32
  FSRM_E_ERROR_NOT_ENABLED = -2147200133_i32
  FSRM_E_CANNOT_CREATE_TEMP_COPY = -2147200132_i32
  FSRM_E_NO_EMAIL_ADDRESS = -2147200131_i32
  FSRM_E_ADR_MAX_EMAILS_SENT = -2147200130_i32
  FSRM_E_PATH_NOT_IN_NAMESPACE = -2147200129_i32
  FSRM_E_RMS_TEMPLATE_NOT_FOUND = -2147200128_i32
  FSRM_E_SECURE_PROPERTIES_NOT_SUPPORTED = -2147200127_i32
  FSRM_E_RMS_NO_PROTECTORS_INSTALLED = -2147200126_i32
  FSRM_E_RMS_NO_PROTECTOR_INSTALLED_FOR_FILE = -2147200125_i32
  FSRM_E_PROPERTY_MUST_APPLY_TO_FOLDERS = -2147200124_i32
  FSRM_E_PROPERTY_MUST_BE_SECURE = -2147200123_i32
  FSRM_E_PROPERTY_MUST_BE_GLOBAL = -2147200122_i32
  FSRM_E_WMI_FAILURE = -2147200121_i32
  FSRM_E_FILE_MANAGEMENT_JOB_RMS = -2147200120_i32
  FSRM_E_SYNC_TASK_HAD_ERRORS = -2147200119_i32
  FSRM_E_ADR_SRV_NOT_SUPPORTED = -2147200112_i32
  FSRM_E_ADR_PATH_IS_LOCAL = -2147200111_i32
  FSRM_E_ADR_NOT_DOMAIN_JOINED = -2147200110_i32
  FSRM_E_CANNOT_REMOVE_READONLY = -2147200109_i32
  FSRM_E_FILE_MANAGEMENT_JOB_INVALID_CONTINUOUS_CONFIG = -2147200108_i32
  FSRM_E_LEGACY_SCHEDULE = -2147200107_i32
  FSRM_E_CSC_PATH_NOT_SUPPORTED = -2147200106_i32
  FSRM_E_EXPIRATION_PATH_NOT_WRITEABLE = -2147200105_i32
  FSRM_E_EXPIRATION_PATH_TOO_LONG = -2147200104_i32
  FSRM_E_EXPIRATION_VOLUME_NOT_NTFS = -2147200103_i32
  FSRM_E_FILE_MANAGEMENT_JOB_DEPRECATED = -2147200102_i32
  FSRM_E_MODULE_TIMEOUT = -2147200101_i32

  CLSID_FsrmSetting = LibC::GUID.new(0xf556d708_u32, 0x6d4d_u16, 0x4594_u16, StaticArray[0x9c_u8, 0x61_u8, 0x7d_u8, 0xbb_u8, 0xd_u8, 0xae_u8, 0x2a_u8, 0x46_u8])

  CLSID_FsrmPathMapper = LibC::GUID.new(0xf3be42bd_u32, 0x8ac2_u16, 0x409e_u16, StaticArray[0xbb_u8, 0xd8_u8, 0xfa_u8, 0xf9_u8, 0xb6_u8, 0xb4_u8, 0x1f_u8, 0xeb_u8])

  CLSID_FsrmExportImport = LibC::GUID.new(0x1482dc37_u32, 0xfae9_u16, 0x4787_u16, StaticArray[0x90_u8, 0x25_u8, 0x8c_u8, 0xe4_u8, 0xe0_u8, 0x24_u8, 0xab_u8, 0x56_u8])

  CLSID_FsrmQuotaManager = LibC::GUID.new(0x90dcab7f_u32, 0x347c_u16, 0x4bfc_u16, StaticArray[0xb5_u8, 0x43_u8, 0x54_u8, 0x3_u8, 0x26_u8, 0x30_u8, 0x5f_u8, 0xbe_u8])

  CLSID_FsrmQuotaTemplateManager = LibC::GUID.new(0x97d3d443_u32, 0x251c_u16, 0x4337_u16, StaticArray[0x81_u8, 0xe7_u8, 0xb3_u8, 0x2e_u8, 0x8f_u8, 0x4e_u8, 0xe6_u8, 0x5e_u8])

  CLSID_FsrmFileGroupManager = LibC::GUID.new(0x8f1363f6_u32, 0x656f_u16, 0x4496_u16, StaticArray[0x92_u8, 0x26_u8, 0x13_u8, 0xae_u8, 0xcb_u8, 0xd7_u8, 0x71_u8, 0x8f_u8])

  CLSID_FsrmFileScreenManager = LibC::GUID.new(0x95941183_u32, 0xdb53_u16, 0x4c5f_u16, StaticArray[0xb3_u8, 0x7b_u8, 0x7d_u8, 0x9_u8, 0x21_u8, 0xcf_u8, 0x9d_u8, 0xc7_u8])

  CLSID_FsrmFileScreenTemplateManager = LibC::GUID.new(0x243111df_u32, 0xe474_u16, 0x46aa_u16, StaticArray[0xa0_u8, 0x54_u8, 0xea_u8, 0xa3_u8, 0x3e_u8, 0xdc_u8, 0x29_u8, 0x2a_u8])

  CLSID_FsrmReportManager = LibC::GUID.new(0x58ef37_u32, 0xaa66_u16, 0x4c48_u16, StaticArray[0xbd_u8, 0x5b_u8, 0x2f_u8, 0xce_u8, 0x43_u8, 0x2a_u8, 0xb0_u8, 0xc8_u8])

  CLSID_FsrmReportScheduler = LibC::GUID.new(0xea25f1b8_u32, 0x1b8d_u16, 0x4290_u16, StaticArray[0x8e_u8, 0xe8_u8, 0xe1_u8, 0x7c_u8, 0x12_u8, 0xc2_u8, 0xfe_u8, 0x20_u8])

  CLSID_FsrmFileManagementJobManager = LibC::GUID.new(0xeb18f9b2_u32, 0x4c3a_u16, 0x4321_u16, StaticArray[0xb2_u8, 0x3_u8, 0x20_u8, 0x51_u8, 0x20_u8, 0xcf_u8, 0xf6_u8, 0x14_u8])

  CLSID_FsrmClassificationManager = LibC::GUID.new(0xb15c0e47_u32, 0xc391_u16, 0x45b9_u16, StaticArray[0x95_u8, 0xc8_u8, 0xeb_u8, 0x59_u8, 0x6c_u8, 0x85_u8, 0x3f_u8, 0x3a_u8])

  CLSID_FsrmPipelineModuleConnector = LibC::GUID.new(0xc7643375_u32, 0x1eb5_u16, 0x44de_u16, StaticArray[0xa0_u8, 0x62_u8, 0x62_u8, 0x35_u8, 0x47_u8, 0xd9_u8, 0x33_u8, 0xbc_u8])

  CLSID_AdSyncTask = LibC::GUID.new(0x2ae64751_u32, 0xb728_u16, 0x4d6b_u16, StaticArray[0x97_u8, 0xa0_u8, 0xb2_u8, 0xda_u8, 0x2e_u8, 0x7d_u8, 0x2a_u8, 0x3b_u8])

  CLSID_FsrmAccessDeniedRemediationClient = LibC::GUID.new(0x100b4fc8_u32, 0x74c1_u16, 0x470f_u16, StaticArray[0xb1_u8, 0xb7_u8, 0xdd_u8, 0x7b_u8, 0x6b_u8, 0xae_u8, 0x79_u8, 0xbd_u8])

  enum FsrmQuotaFlags
    FsrmQuotaFlags_Enforce = 256_i32
    FsrmQuotaFlags_Disable = 512_i32
    FsrmQuotaFlags_StatusIncomplete = 65536_i32
    FsrmQuotaFlags_StatusRebuilding = 131072_i32
  end
  enum FsrmFileScreenFlags
    FsrmFileScreenFlags_Enforce = 1_i32
  end
  enum FsrmCollectionState
    FsrmCollectionState_Fetching = 1_i32
    FsrmCollectionState_Committing = 2_i32
    FsrmCollectionState_Complete = 3_i32
    FsrmCollectionState_Cancelled = 4_i32
  end
  enum FsrmEnumOptions
    FsrmEnumOptions_None = 0_i32
    FsrmEnumOptions_Asynchronous = 1_i32
    FsrmEnumOptions_CheckRecycleBin = 2_i32
    FsrmEnumOptions_IncludeClusterNodes = 4_i32
    FsrmEnumOptions_IncludeDeprecatedObjects = 8_i32
  end
  enum FsrmCommitOptions
    FsrmCommitOptions_None = 0_i32
    FsrmCommitOptions_Asynchronous = 1_i32
  end
  enum FsrmTemplateApplyOptions
    FsrmTemplateApplyOptions_ApplyToDerivedMatching = 1_i32
    FsrmTemplateApplyOptions_ApplyToDerivedAll = 2_i32
  end
  enum FsrmActionType
    FsrmActionType_Unknown = 0_i32
    FsrmActionType_EventLog = 1_i32
    FsrmActionType_Email = 2_i32
    FsrmActionType_Command = 3_i32
    FsrmActionType_Report = 4_i32
  end
  enum FsrmEventType
    FsrmEventType_Unknown = 0_i32
    FsrmEventType_Information = 1_i32
    FsrmEventType_Warning = 2_i32
    FsrmEventType_Error = 3_i32
  end
  enum FsrmAccountType
    FsrmAccountType_Unknown = 0_i32
    FsrmAccountType_NetworkService = 1_i32
    FsrmAccountType_LocalService = 2_i32
    FsrmAccountType_LocalSystem = 3_i32
    FsrmAccountType_InProc = 4_i32
    FsrmAccountType_External = 5_i32
    FsrmAccountType_Automatic = 500_i32
  end
  enum FsrmReportType
    FsrmReportType_Unknown = 0_i32
    FsrmReportType_LargeFiles = 1_i32
    FsrmReportType_FilesByType = 2_i32
    FsrmReportType_LeastRecentlyAccessed = 3_i32
    FsrmReportType_MostRecentlyAccessed = 4_i32
    FsrmReportType_QuotaUsage = 5_i32
    FsrmReportType_FilesByOwner = 6_i32
    FsrmReportType_ExportReport = 7_i32
    FsrmReportType_DuplicateFiles = 8_i32
    FsrmReportType_FileScreenAudit = 9_i32
    FsrmReportType_FilesByProperty = 10_i32
    FsrmReportType_AutomaticClassification = 11_i32
    FsrmReportType_Expiration = 12_i32
    FsrmReportType_FoldersByProperty = 13_i32
  end
  enum FsrmReportFormat
    FsrmReportFormat_Unknown = 0_i32
    FsrmReportFormat_DHtml = 1_i32
    FsrmReportFormat_Html = 2_i32
    FsrmReportFormat_Txt = 3_i32
    FsrmReportFormat_Csv = 4_i32
    FsrmReportFormat_Xml = 5_i32
  end
  enum FsrmReportRunningStatus
    FsrmReportRunningStatus_Unknown = 0_i32
    FsrmReportRunningStatus_NotRunning = 1_i32
    FsrmReportRunningStatus_Queued = 2_i32
    FsrmReportRunningStatus_Running = 3_i32
  end
  enum FsrmReportGenerationContext
    FsrmReportGenerationContext_Undefined = 1_i32
    FsrmReportGenerationContext_ScheduledReport = 2_i32
    FsrmReportGenerationContext_InteractiveReport = 3_i32
    FsrmReportGenerationContext_IncidentReport = 4_i32
  end
  enum FsrmReportFilter
    FsrmReportFilter_MinSize = 1_i32
    FsrmReportFilter_MinAgeDays = 2_i32
    FsrmReportFilter_MaxAgeDays = 3_i32
    FsrmReportFilter_MinQuotaUsage = 4_i32
    FsrmReportFilter_FileGroups = 5_i32
    FsrmReportFilter_Owners = 6_i32
    FsrmReportFilter_NamePattern = 7_i32
    FsrmReportFilter_Property = 8_i32
  end
  enum FsrmReportLimit
    FsrmReportLimit_MaxFiles = 1_i32
    FsrmReportLimit_MaxFileGroups = 2_i32
    FsrmReportLimit_MaxOwners = 3_i32
    FsrmReportLimit_MaxFilesPerFileGroup = 4_i32
    FsrmReportLimit_MaxFilesPerOwner = 5_i32
    FsrmReportLimit_MaxFilesPerDuplGroup = 6_i32
    FsrmReportLimit_MaxDuplicateGroups = 7_i32
    FsrmReportLimit_MaxQuotas = 8_i32
    FsrmReportLimit_MaxFileScreenEvents = 9_i32
    FsrmReportLimit_MaxPropertyValues = 10_i32
    FsrmReportLimit_MaxFilesPerPropertyValue = 11_i32
    FsrmReportLimit_MaxFolders = 12_i32
  end
  enum FsrmPropertyDefinitionType
    FsrmPropertyDefinitionType_Unknown = 0_i32
    FsrmPropertyDefinitionType_OrderedList = 1_i32
    FsrmPropertyDefinitionType_MultiChoiceList = 2_i32
    FsrmPropertyDefinitionType_SingleChoiceList = 3_i32
    FsrmPropertyDefinitionType_String = 4_i32
    FsrmPropertyDefinitionType_MultiString = 5_i32
    FsrmPropertyDefinitionType_Int = 6_i32
    FsrmPropertyDefinitionType_Bool = 7_i32
    FsrmPropertyDefinitionType_Date = 8_i32
  end
  enum FsrmPropertyDefinitionFlags
    FsrmPropertyDefinitionFlags_Global = 1_i32
    FsrmPropertyDefinitionFlags_Deprecated = 2_i32
    FsrmPropertyDefinitionFlags_Secure = 4_i32
  end
  enum FsrmPropertyDefinitionAppliesTo
    FsrmPropertyDefinitionAppliesTo_Files = 1_i32
    FsrmPropertyDefinitionAppliesTo_Folders = 2_i32
  end
  enum FsrmRuleType
    FsrmRuleType_Unknown = 0_i32
    FsrmRuleType_Classification = 1_i32
    FsrmRuleType_Generic = 2_i32
  end
  enum FsrmRuleFlags
    FsrmRuleFlags_Disabled = 256_i32
    FsrmRuleFlags_ClearAutomaticallyClassifiedProperty = 1024_i32
    FsrmRuleFlags_ClearManuallyClassifiedProperty = 2048_i32
    FsrmRuleFlags_Invalid = 4096_i32
  end
  enum FsrmClassificationLoggingFlags
    FsrmClassificationLoggingFlags_None = 0_i32
    FsrmClassificationLoggingFlags_ClassificationsInLogFile = 1_i32
    FsrmClassificationLoggingFlags_ErrorsInLogFile = 2_i32
    FsrmClassificationLoggingFlags_ClassificationsInSystemLog = 4_i32
    FsrmClassificationLoggingFlags_ErrorsInSystemLog = 8_i32
  end
  enum FsrmExecutionOption
    FsrmExecutionOption_Unknown = 0_i32
    FsrmExecutionOption_EvaluateUnset = 1_i32
    FsrmExecutionOption_ReEvaluate_ConsiderExistingValue = 2_i32
    FsrmExecutionOption_ReEvaluate_IgnoreExistingValue = 3_i32
  end
  enum FsrmStorageModuleCaps
    FsrmStorageModuleCaps_Unknown = 0_i32
    FsrmStorageModuleCaps_CanGet = 1_i32
    FsrmStorageModuleCaps_CanSet = 2_i32
    FsrmStorageModuleCaps_CanHandleDirectories = 4_i32
    FsrmStorageModuleCaps_CanHandleFiles = 8_i32
  end
  enum FsrmStorageModuleType
    FsrmStorageModuleType_Unknown = 0_i32
    FsrmStorageModuleType_Cache = 1_i32
    FsrmStorageModuleType_InFile = 2_i32
    FsrmStorageModuleType_Database = 3_i32
    FsrmStorageModuleType_System = 100_i32
  end
  enum FsrmPropertyBagFlags
    FsrmPropertyBagFlags_UpdatedByClassifier = 1_i32
    FsrmPropertyBagFlags_FailedLoadingProperties = 2_i32
    FsrmPropertyBagFlags_FailedSavingProperties = 4_i32
    FsrmPropertyBagFlags_FailedClassifyingProperties = 8_i32
  end
  enum FsrmPropertyBagField
    FsrmPropertyBagField_AccessVolume = 0_i32
    FsrmPropertyBagField_VolumeGuidName = 1_i32
  end
  enum FsrmPropertyFlags
    FsrmPropertyFlags_None = 0_i32
    FsrmPropertyFlags_Orphaned = 1_i32
    FsrmPropertyFlags_RetrievedFromCache = 2_i32
    FsrmPropertyFlags_RetrievedFromStorage = 4_i32
    FsrmPropertyFlags_SetByClassifier = 8_i32
    FsrmPropertyFlags_Deleted = 16_i32
    FsrmPropertyFlags_Reclassified = 32_i32
    FsrmPropertyFlags_AggregationFailed = 64_i32
    FsrmPropertyFlags_Existing = 128_i32
    FsrmPropertyFlags_FailedLoadingProperties = 256_i32
    FsrmPropertyFlags_FailedClassifyingProperties = 512_i32
    FsrmPropertyFlags_FailedSavingProperties = 1024_i32
    FsrmPropertyFlags_Secure = 2048_i32
    FsrmPropertyFlags_PolicyDerived = 4096_i32
    FsrmPropertyFlags_Inherited = 8192_i32
    FsrmPropertyFlags_Manual = 16384_i32
    FsrmPropertyFlags_ExplicitValueDeleted = 32768_i32
    FsrmPropertyFlags_PropertyDeletedFromClear = 65536_i32
    FsrmPropertyFlags_PropertySourceMask = 14_i32
    FsrmPropertyFlags_PersistentMask = 20480_i32
  end
  enum FsrmPipelineModuleType
    FsrmPipelineModuleType_Unknown = 0_i32
    FsrmPipelineModuleType_Storage = 1_i32
    FsrmPipelineModuleType_Classifier = 2_i32
  end
  enum FsrmGetFilePropertyOptions
    FsrmGetFilePropertyOptions_None = 0_i32
    FsrmGetFilePropertyOptions_NoRuleEvaluation = 1_i32
    FsrmGetFilePropertyOptions_Persistent = 2_i32
    FsrmGetFilePropertyOptions_FailOnPersistErrors = 4_i32
    FsrmGetFilePropertyOptions_SkipOrphaned = 8_i32
  end
  enum FsrmFileManagementType
    FsrmFileManagementType_Unknown = 0_i32
    FsrmFileManagementType_Expiration = 1_i32
    FsrmFileManagementType_Custom = 2_i32
    FsrmFileManagementType_Rms = 3_i32
  end
  enum FsrmFileManagementLoggingFlags
    FsrmFileManagementLoggingFlags_None = 0_i32
    FsrmFileManagementLoggingFlags_Error = 1_i32
    FsrmFileManagementLoggingFlags_Information = 2_i32
    FsrmFileManagementLoggingFlags_Audit = 4_i32
  end
  enum FsrmPropertyConditionType
    FsrmPropertyConditionType_Unknown = 0_i32
    FsrmPropertyConditionType_Equal = 1_i32
    FsrmPropertyConditionType_NotEqual = 2_i32
    FsrmPropertyConditionType_GreaterThan = 3_i32
    FsrmPropertyConditionType_LessThan = 4_i32
    FsrmPropertyConditionType_Contain = 5_i32
    FsrmPropertyConditionType_Exist = 6_i32
    FsrmPropertyConditionType_NotExist = 7_i32
    FsrmPropertyConditionType_StartWith = 8_i32
    FsrmPropertyConditionType_EndWith = 9_i32
    FsrmPropertyConditionType_ContainedIn = 10_i32
    FsrmPropertyConditionType_PrefixOf = 11_i32
    FsrmPropertyConditionType_SuffixOf = 12_i32
    FsrmPropertyConditionType_MatchesPattern = 13_i32
  end
  enum FsrmFileStreamingMode
    FsrmFileStreamingMode_Unknown = 0_i32
    FsrmFileStreamingMode_Read = 1_i32
    FsrmFileStreamingMode_Write = 2_i32
  end
  enum FsrmFileStreamingInterfaceType
    FsrmFileStreamingInterfaceType_Unknown = 0_i32
    FsrmFileStreamingInterfaceType_ILockBytes = 1_i32
    FsrmFileStreamingInterfaceType_IStream = 2_i32
  end
  enum FsrmFileConditionType
    FsrmFileConditionType_Unknown = 0_i32
    FsrmFileConditionType_Property = 1_i32
  end
  enum FsrmFileSystemPropertyId
    FsrmFileSystemPropertyId_Undefined = 0_i32
    FsrmFileSystemPropertyId_FileName = 1_i32
    FsrmFileSystemPropertyId_DateCreated = 2_i32
    FsrmFileSystemPropertyId_DateLastAccessed = 3_i32
    FsrmFileSystemPropertyId_DateLastModified = 4_i32
    FsrmFileSystemPropertyId_DateNow = 5_i32
  end
  enum FsrmPropertyValueType
    FsrmPropertyValueType_Undefined = 0_i32
    FsrmPropertyValueType_Literal = 1_i32
    FsrmPropertyValueType_DateOffset = 2_i32
  end
  enum AdrClientDisplayFlags
    AdrClientDisplayFlags_AllowEmailRequests = 1_i32
    AdrClientDisplayFlags_ShowDeviceTroubleshooting = 2_i32
  end
  enum AdrEmailFlags
    AdrEmailFlags_PutDataOwnerOnToLine = 1_i32
    AdrEmailFlags_PutAdminOnToLine = 2_i32
    AdrEmailFlags_IncludeDeviceClaims = 4_i32
    AdrEmailFlags_IncludeUserInfo = 8_i32
    AdrEmailFlags_GenerateEventLog = 16_i32
  end
  enum AdrClientErrorType
    AdrClientErrorType_Unknown = 0_i32
    AdrClientErrorType_AccessDenied = 1_i32
    AdrClientErrorType_FileNotFound = 2_i32
  end
  enum AdrClientFlags
    AdrClientFlags_None = 0_i32
    AdrClientFlags_FailForLocalPaths = 1_i32
    AdrClientFlags_FailIfNotSupportedByServer = 2_i32
    AdrClientFlags_FailIfNotDomainJoined = 4_i32
  end

  @[Extern]
  record IFsrmObjectVtbl,
    query_interface : Proc(IFsrmObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmObject*, UInt32),
    release : Proc(IFsrmObject*, UInt32),
    get_type_info_count : Proc(IFsrmObject*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmObject*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmObject*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmObject*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmObject*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmObject*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmObject*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmObject*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("22bcef93-4a3f-4183-89f9-2f8b8a628aee")]
  record IFsrmObject, lpVtbl : IFsrmObjectVtbl* do
    GUID = LibC::GUID.new(0x22bcef93_u32, 0x4a3f_u16, 0x4183_u16, StaticArray[0x89_u8, 0xf9_u8, 0x2f_u8, 0x8b_u8, 0x8a_u8, 0x62_u8, 0x8a_u8, 0xee_u8])
    def query_interface(this : IFsrmObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmObject*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmObject*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmObject*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmObject*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmObject*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmObject*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmObject*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end

  end

  @[Extern]
  record IFsrmCollectionVtbl,
    query_interface : Proc(IFsrmCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmCollection*, UInt32),
    release : Proc(IFsrmCollection*, UInt32),
    get_type_info_count : Proc(IFsrmCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFsrmCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFsrmCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFsrmCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IFsrmCollection*, Win32cr::Storage::FileServerResourceManager::FsrmCollectionState*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFsrmCollection*, Win32cr::Foundation::HRESULT),
    wait_for_completion : Proc(IFsrmCollection*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    get_by_id : Proc(IFsrmCollection*, LibC::GUID, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8")]
  record IFsrmCollection, lpVtbl : IFsrmCollectionVtbl* do
    GUID = LibC::GUID.new(0xf76fbf3b_u32, 0x8ddd_u16, 0x4b42_u16, StaticArray[0xb0_u8, 0x5a_u8, 0xcb_u8, 0x1c_u8, 0x3f_u8, 0xf1_u8, 0xfe_u8, 0xe8_u8])
    def query_interface(this : IFsrmCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFsrmCollection*, unknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, unknown)
    end
    def get_Item(this : IFsrmCollection*, index : Int32, item : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, item)
    end
    def get_Count(this : IFsrmCollection*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_State(this : IFsrmCollection*, state : Win32cr::Storage::FileServerResourceManager::FsrmCollectionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def cancel(this : IFsrmCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def wait_for_completion(this : IFsrmCollection*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_completion.call(this, waitSeconds, completed)
    end
    def get_by_id(this : IFsrmCollection*, id : LibC::GUID, entry : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_id.call(this, id, entry)
    end

  end

  @[Extern]
  record IFsrmMutableCollectionVtbl,
    query_interface : Proc(IFsrmMutableCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmMutableCollection*, UInt32),
    release : Proc(IFsrmMutableCollection*, UInt32),
    get_type_info_count : Proc(IFsrmMutableCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmMutableCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmMutableCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmMutableCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFsrmMutableCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFsrmMutableCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFsrmMutableCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IFsrmMutableCollection*, Win32cr::Storage::FileServerResourceManager::FsrmCollectionState*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFsrmMutableCollection*, Win32cr::Foundation::HRESULT),
    wait_for_completion : Proc(IFsrmMutableCollection*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    get_by_id : Proc(IFsrmMutableCollection*, LibC::GUID, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add : Proc(IFsrmMutableCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    remove : Proc(IFsrmMutableCollection*, Int32, Win32cr::Foundation::HRESULT),
    remove_by_id : Proc(IFsrmMutableCollection*, LibC::GUID, Win32cr::Foundation::HRESULT),
    clone : Proc(IFsrmMutableCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1bb617b8-3886-49dc-af82-a6c90fa35dda")]
  record IFsrmMutableCollection, lpVtbl : IFsrmMutableCollectionVtbl* do
    GUID = LibC::GUID.new(0x1bb617b8_u32, 0x3886_u16, 0x49dc_u16, StaticArray[0xaf_u8, 0x82_u8, 0xa6_u8, 0xc9_u8, 0xf_u8, 0xa3_u8, 0x5d_u8, 0xda_u8])
    def query_interface(this : IFsrmMutableCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmMutableCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmMutableCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmMutableCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmMutableCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmMutableCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmMutableCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFsrmMutableCollection*, unknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, unknown)
    end
    def get_Item(this : IFsrmMutableCollection*, index : Int32, item : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, item)
    end
    def get_Count(this : IFsrmMutableCollection*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_State(this : IFsrmMutableCollection*, state : Win32cr::Storage::FileServerResourceManager::FsrmCollectionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def cancel(this : IFsrmMutableCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def wait_for_completion(this : IFsrmMutableCollection*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_completion.call(this, waitSeconds, completed)
    end
    def get_by_id(this : IFsrmMutableCollection*, id : LibC::GUID, entry : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_id.call(this, id, entry)
    end
    def add(this : IFsrmMutableCollection*, item : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, item)
    end
    def remove(this : IFsrmMutableCollection*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end
    def remove_by_id(this : IFsrmMutableCollection*, id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_by_id.call(this, id)
    end
    def clone(this : IFsrmMutableCollection*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, collection)
    end

  end

  @[Extern]
  record IFsrmCommittableCollectionVtbl,
    query_interface : Proc(IFsrmCommittableCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmCommittableCollection*, UInt32),
    release : Proc(IFsrmCommittableCollection*, UInt32),
    get_type_info_count : Proc(IFsrmCommittableCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmCommittableCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmCommittableCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmCommittableCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFsrmCommittableCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFsrmCommittableCollection*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFsrmCommittableCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(IFsrmCommittableCollection*, Win32cr::Storage::FileServerResourceManager::FsrmCollectionState*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFsrmCommittableCollection*, Win32cr::Foundation::HRESULT),
    wait_for_completion : Proc(IFsrmCommittableCollection*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    get_by_id : Proc(IFsrmCommittableCollection*, LibC::GUID, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    add : Proc(IFsrmCommittableCollection*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    remove : Proc(IFsrmCommittableCollection*, Int32, Win32cr::Foundation::HRESULT),
    remove_by_id : Proc(IFsrmCommittableCollection*, LibC::GUID, Win32cr::Foundation::HRESULT),
    clone : Proc(IFsrmCommittableCollection*, Void**, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmCommittableCollection*, Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("96deb3b5-8b91-4a2a-9d93-80a35d8aa847")]
  record IFsrmCommittableCollection, lpVtbl : IFsrmCommittableCollectionVtbl* do
    GUID = LibC::GUID.new(0x96deb3b5_u32, 0x8b91_u16, 0x4a2a_u16, StaticArray[0x9d_u8, 0x93_u8, 0x80_u8, 0xa3_u8, 0x5d_u8, 0x8a_u8, 0xa8_u8, 0x47_u8])
    def query_interface(this : IFsrmCommittableCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmCommittableCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmCommittableCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmCommittableCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmCommittableCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmCommittableCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmCommittableCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFsrmCommittableCollection*, unknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, unknown)
    end
    def get_Item(this : IFsrmCommittableCollection*, index : Int32, item : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, item)
    end
    def get_Count(this : IFsrmCommittableCollection*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_State(this : IFsrmCommittableCollection*, state : Win32cr::Storage::FileServerResourceManager::FsrmCollectionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, state)
    end
    def cancel(this : IFsrmCommittableCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def wait_for_completion(this : IFsrmCommittableCollection*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_completion.call(this, waitSeconds, completed)
    end
    def get_by_id(this : IFsrmCommittableCollection*, id : LibC::GUID, entry : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_by_id.call(this, id, entry)
    end
    def add(this : IFsrmCommittableCollection*, item : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, item)
    end
    def remove(this : IFsrmCommittableCollection*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, index)
    end
    def remove_by_id(this : IFsrmCommittableCollection*, id : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_by_id.call(this, id)
    end
    def clone(this : IFsrmCommittableCollection*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, collection)
    end
    def commit(this : IFsrmCommittableCollection*, options : Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, results : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, options, results)
    end

  end

  @[Extern]
  record IFsrmActionVtbl,
    query_interface : Proc(IFsrmAction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmAction*, UInt32),
    release : Proc(IFsrmAction*, UInt32),
    get_type_info_count : Proc(IFsrmAction*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmAction*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmAction*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmAction*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmAction*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_ActionType : Proc(IFsrmAction*, Win32cr::Storage::FileServerResourceManager::FsrmActionType*, Win32cr::Foundation::HRESULT),
    get_RunLimitInterval : Proc(IFsrmAction*, Int32*, Win32cr::Foundation::HRESULT),
    put_RunLimitInterval : Proc(IFsrmAction*, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmAction*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6cd6408a-ae60-463b-9ef1-e117534d69dc")]
  record IFsrmAction, lpVtbl : IFsrmActionVtbl* do
    GUID = LibC::GUID.new(0x6cd6408a_u32, 0xae60_u16, 0x463b_u16, StaticArray[0x9e_u8, 0xf1_u8, 0xe1_u8, 0x17_u8, 0x53_u8, 0x4d_u8, 0x69_u8, 0xdc_u8])
    def query_interface(this : IFsrmAction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmAction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmAction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmAction*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmAction*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmAction*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmAction*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmAction*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_ActionType(this : IFsrmAction*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionType.call(this, actionType)
    end
    def get_RunLimitInterval(this : IFsrmAction*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLimitInterval.call(this, minutes)
    end
    def put_RunLimitInterval(this : IFsrmAction*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLimitInterval.call(this, minutes)
    end
    def delete(this : IFsrmAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IFsrmActionEmailVtbl,
    query_interface : Proc(IFsrmActionEmail*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmActionEmail*, UInt32),
    release : Proc(IFsrmActionEmail*, UInt32),
    get_type_info_count : Proc(IFsrmActionEmail*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmActionEmail*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmActionEmail*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmActionEmail*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmActionEmail*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_ActionType : Proc(IFsrmActionEmail*, Win32cr::Storage::FileServerResourceManager::FsrmActionType*, Win32cr::Foundation::HRESULT),
    get_RunLimitInterval : Proc(IFsrmActionEmail*, Int32*, Win32cr::Foundation::HRESULT),
    put_RunLimitInterval : Proc(IFsrmActionEmail*, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmActionEmail*, Win32cr::Foundation::HRESULT),
    get_MailFrom : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailFrom : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailReplyTo : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailReplyTo : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailTo : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailTo : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailCc : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailCc : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailBcc : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailBcc : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailSubject : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailSubject : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MessageText : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MessageText : Proc(IFsrmActionEmail*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d646567d-26ae-4caa-9f84-4e0aad207fca")]
  record IFsrmActionEmail, lpVtbl : IFsrmActionEmailVtbl* do
    GUID = LibC::GUID.new(0xd646567d_u32, 0x26ae_u16, 0x4caa_u16, StaticArray[0x9f_u8, 0x84_u8, 0x4e_u8, 0xa_u8, 0xad_u8, 0x20_u8, 0x7f_u8, 0xca_u8])
    def query_interface(this : IFsrmActionEmail*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmActionEmail*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmActionEmail*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmActionEmail*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmActionEmail*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmActionEmail*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmActionEmail*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmActionEmail*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_ActionType(this : IFsrmActionEmail*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionType.call(this, actionType)
    end
    def get_RunLimitInterval(this : IFsrmActionEmail*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLimitInterval.call(this, minutes)
    end
    def put_RunLimitInterval(this : IFsrmActionEmail*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLimitInterval.call(this, minutes)
    end
    def delete(this : IFsrmActionEmail*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_MailFrom(this : IFsrmActionEmail*, mailFrom : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailFrom.call(this, mailFrom)
    end
    def put_MailFrom(this : IFsrmActionEmail*, mailFrom : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailFrom.call(this, mailFrom)
    end
    def get_MailReplyTo(this : IFsrmActionEmail*, mailReplyTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailReplyTo.call(this, mailReplyTo)
    end
    def put_MailReplyTo(this : IFsrmActionEmail*, mailReplyTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailReplyTo.call(this, mailReplyTo)
    end
    def get_MailTo(this : IFsrmActionEmail*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailTo.call(this, mailTo)
    end
    def put_MailTo(this : IFsrmActionEmail*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailTo.call(this, mailTo)
    end
    def get_MailCc(this : IFsrmActionEmail*, mailCc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailCc.call(this, mailCc)
    end
    def put_MailCc(this : IFsrmActionEmail*, mailCc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailCc.call(this, mailCc)
    end
    def get_MailBcc(this : IFsrmActionEmail*, mailBcc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailBcc.call(this, mailBcc)
    end
    def put_MailBcc(this : IFsrmActionEmail*, mailBcc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailBcc.call(this, mailBcc)
    end
    def get_MailSubject(this : IFsrmActionEmail*, mailSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailSubject.call(this, mailSubject)
    end
    def put_MailSubject(this : IFsrmActionEmail*, mailSubject : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailSubject.call(this, mailSubject)
    end
    def get_MessageText(this : IFsrmActionEmail*, messageText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageText.call(this, messageText)
    end
    def put_MessageText(this : IFsrmActionEmail*, messageText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MessageText.call(this, messageText)
    end

  end

  @[Extern]
  record IFsrmActionEmail2Vtbl,
    query_interface : Proc(IFsrmActionEmail2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmActionEmail2*, UInt32),
    release : Proc(IFsrmActionEmail2*, UInt32),
    get_type_info_count : Proc(IFsrmActionEmail2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmActionEmail2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmActionEmail2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmActionEmail2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmActionEmail2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_ActionType : Proc(IFsrmActionEmail2*, Win32cr::Storage::FileServerResourceManager::FsrmActionType*, Win32cr::Foundation::HRESULT),
    get_RunLimitInterval : Proc(IFsrmActionEmail2*, Int32*, Win32cr::Foundation::HRESULT),
    put_RunLimitInterval : Proc(IFsrmActionEmail2*, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmActionEmail2*, Win32cr::Foundation::HRESULT),
    get_MailFrom : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailFrom : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailReplyTo : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailReplyTo : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailTo : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailTo : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailCc : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailCc : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailBcc : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailBcc : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailSubject : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailSubject : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MessageText : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MessageText : Proc(IFsrmActionEmail2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AttachmentFileListSize : Proc(IFsrmActionEmail2*, Int32*, Win32cr::Foundation::HRESULT),
    put_AttachmentFileListSize : Proc(IFsrmActionEmail2*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8276702f-2532-4839-89bf-4872609a2ea4")]
  record IFsrmActionEmail2, lpVtbl : IFsrmActionEmail2Vtbl* do
    GUID = LibC::GUID.new(0x8276702f_u32, 0x2532_u16, 0x4839_u16, StaticArray[0x89_u8, 0xbf_u8, 0x48_u8, 0x72_u8, 0x60_u8, 0x9a_u8, 0x2e_u8, 0xa4_u8])
    def query_interface(this : IFsrmActionEmail2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmActionEmail2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmActionEmail2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmActionEmail2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmActionEmail2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmActionEmail2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmActionEmail2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmActionEmail2*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_ActionType(this : IFsrmActionEmail2*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionType.call(this, actionType)
    end
    def get_RunLimitInterval(this : IFsrmActionEmail2*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLimitInterval.call(this, minutes)
    end
    def put_RunLimitInterval(this : IFsrmActionEmail2*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLimitInterval.call(this, minutes)
    end
    def delete(this : IFsrmActionEmail2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_MailFrom(this : IFsrmActionEmail2*, mailFrom : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailFrom.call(this, mailFrom)
    end
    def put_MailFrom(this : IFsrmActionEmail2*, mailFrom : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailFrom.call(this, mailFrom)
    end
    def get_MailReplyTo(this : IFsrmActionEmail2*, mailReplyTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailReplyTo.call(this, mailReplyTo)
    end
    def put_MailReplyTo(this : IFsrmActionEmail2*, mailReplyTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailReplyTo.call(this, mailReplyTo)
    end
    def get_MailTo(this : IFsrmActionEmail2*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailTo.call(this, mailTo)
    end
    def put_MailTo(this : IFsrmActionEmail2*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailTo.call(this, mailTo)
    end
    def get_MailCc(this : IFsrmActionEmail2*, mailCc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailCc.call(this, mailCc)
    end
    def put_MailCc(this : IFsrmActionEmail2*, mailCc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailCc.call(this, mailCc)
    end
    def get_MailBcc(this : IFsrmActionEmail2*, mailBcc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailBcc.call(this, mailBcc)
    end
    def put_MailBcc(this : IFsrmActionEmail2*, mailBcc : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailBcc.call(this, mailBcc)
    end
    def get_MailSubject(this : IFsrmActionEmail2*, mailSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailSubject.call(this, mailSubject)
    end
    def put_MailSubject(this : IFsrmActionEmail2*, mailSubject : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailSubject.call(this, mailSubject)
    end
    def get_MessageText(this : IFsrmActionEmail2*, messageText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageText.call(this, messageText)
    end
    def put_MessageText(this : IFsrmActionEmail2*, messageText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MessageText.call(this, messageText)
    end
    def get_AttachmentFileListSize(this : IFsrmActionEmail2*, attachmentFileListSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachmentFileListSize.call(this, attachmentFileListSize)
    end
    def put_AttachmentFileListSize(this : IFsrmActionEmail2*, attachmentFileListSize : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachmentFileListSize.call(this, attachmentFileListSize)
    end

  end

  @[Extern]
  record IFsrmActionReportVtbl,
    query_interface : Proc(IFsrmActionReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmActionReport*, UInt32),
    release : Proc(IFsrmActionReport*, UInt32),
    get_type_info_count : Proc(IFsrmActionReport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmActionReport*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmActionReport*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmActionReport*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmActionReport*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_ActionType : Proc(IFsrmActionReport*, Win32cr::Storage::FileServerResourceManager::FsrmActionType*, Win32cr::Foundation::HRESULT),
    get_RunLimitInterval : Proc(IFsrmActionReport*, Int32*, Win32cr::Foundation::HRESULT),
    put_RunLimitInterval : Proc(IFsrmActionReport*, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmActionReport*, Win32cr::Foundation::HRESULT),
    get_ReportTypes : Proc(IFsrmActionReport*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ReportTypes : Proc(IFsrmActionReport*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_MailTo : Proc(IFsrmActionReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailTo : Proc(IFsrmActionReport*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2dbe63c4-b340-48a0-a5b0-158e07fc567e")]
  record IFsrmActionReport, lpVtbl : IFsrmActionReportVtbl* do
    GUID = LibC::GUID.new(0x2dbe63c4_u32, 0xb340_u16, 0x48a0_u16, StaticArray[0xa5_u8, 0xb0_u8, 0x15_u8, 0x8e_u8, 0x7_u8, 0xfc_u8, 0x56_u8, 0x7e_u8])
    def query_interface(this : IFsrmActionReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmActionReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmActionReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmActionReport*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmActionReport*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmActionReport*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmActionReport*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmActionReport*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_ActionType(this : IFsrmActionReport*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionType.call(this, actionType)
    end
    def get_RunLimitInterval(this : IFsrmActionReport*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLimitInterval.call(this, minutes)
    end
    def put_RunLimitInterval(this : IFsrmActionReport*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLimitInterval.call(this, minutes)
    end
    def delete(this : IFsrmActionReport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_ReportTypes(this : IFsrmActionReport*, reportTypes : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportTypes.call(this, reportTypes)
    end
    def put_ReportTypes(this : IFsrmActionReport*, reportTypes : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportTypes.call(this, reportTypes)
    end
    def get_MailTo(this : IFsrmActionReport*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailTo.call(this, mailTo)
    end
    def put_MailTo(this : IFsrmActionReport*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailTo.call(this, mailTo)
    end

  end

  @[Extern]
  record IFsrmActionEventLogVtbl,
    query_interface : Proc(IFsrmActionEventLog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmActionEventLog*, UInt32),
    release : Proc(IFsrmActionEventLog*, UInt32),
    get_type_info_count : Proc(IFsrmActionEventLog*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmActionEventLog*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmActionEventLog*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmActionEventLog*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmActionEventLog*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_ActionType : Proc(IFsrmActionEventLog*, Win32cr::Storage::FileServerResourceManager::FsrmActionType*, Win32cr::Foundation::HRESULT),
    get_RunLimitInterval : Proc(IFsrmActionEventLog*, Int32*, Win32cr::Foundation::HRESULT),
    put_RunLimitInterval : Proc(IFsrmActionEventLog*, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmActionEventLog*, Win32cr::Foundation::HRESULT),
    get_EventType : Proc(IFsrmActionEventLog*, Win32cr::Storage::FileServerResourceManager::FsrmEventType*, Win32cr::Foundation::HRESULT),
    put_EventType : Proc(IFsrmActionEventLog*, Win32cr::Storage::FileServerResourceManager::FsrmEventType, Win32cr::Foundation::HRESULT),
    get_MessageText : Proc(IFsrmActionEventLog*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MessageText : Proc(IFsrmActionEventLog*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c8f96c3-5d94-4f37-a4f4-f56ab463546f")]
  record IFsrmActionEventLog, lpVtbl : IFsrmActionEventLogVtbl* do
    GUID = LibC::GUID.new(0x4c8f96c3_u32, 0x5d94_u16, 0x4f37_u16, StaticArray[0xa4_u8, 0xf4_u8, 0xf5_u8, 0x6a_u8, 0xb4_u8, 0x63_u8, 0x54_u8, 0x6f_u8])
    def query_interface(this : IFsrmActionEventLog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmActionEventLog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmActionEventLog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmActionEventLog*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmActionEventLog*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmActionEventLog*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmActionEventLog*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmActionEventLog*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_ActionType(this : IFsrmActionEventLog*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionType.call(this, actionType)
    end
    def get_RunLimitInterval(this : IFsrmActionEventLog*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLimitInterval.call(this, minutes)
    end
    def put_RunLimitInterval(this : IFsrmActionEventLog*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLimitInterval.call(this, minutes)
    end
    def delete(this : IFsrmActionEventLog*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_EventType(this : IFsrmActionEventLog*, eventType : Win32cr::Storage::FileServerResourceManager::FsrmEventType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventType.call(this, eventType)
    end
    def put_EventType(this : IFsrmActionEventLog*, eventType : Win32cr::Storage::FileServerResourceManager::FsrmEventType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventType.call(this, eventType)
    end
    def get_MessageText(this : IFsrmActionEventLog*, messageText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MessageText.call(this, messageText)
    end
    def put_MessageText(this : IFsrmActionEventLog*, messageText : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MessageText.call(this, messageText)
    end

  end

  @[Extern]
  record IFsrmActionCommandVtbl,
    query_interface : Proc(IFsrmActionCommand*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmActionCommand*, UInt32),
    release : Proc(IFsrmActionCommand*, UInt32),
    get_type_info_count : Proc(IFsrmActionCommand*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmActionCommand*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmActionCommand*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmActionCommand*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmActionCommand*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_ActionType : Proc(IFsrmActionCommand*, Win32cr::Storage::FileServerResourceManager::FsrmActionType*, Win32cr::Foundation::HRESULT),
    get_RunLimitInterval : Proc(IFsrmActionCommand*, Int32*, Win32cr::Foundation::HRESULT),
    put_RunLimitInterval : Proc(IFsrmActionCommand*, Int32, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmActionCommand*, Win32cr::Foundation::HRESULT),
    get_ExecutablePath : Proc(IFsrmActionCommand*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExecutablePath : Proc(IFsrmActionCommand*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Arguments : Proc(IFsrmActionCommand*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Arguments : Proc(IFsrmActionCommand*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Account : Proc(IFsrmActionCommand*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType*, Win32cr::Foundation::HRESULT),
    put_Account : Proc(IFsrmActionCommand*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType, Win32cr::Foundation::HRESULT),
    get_WorkingDirectory : Proc(IFsrmActionCommand*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_WorkingDirectory : Proc(IFsrmActionCommand*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MonitorCommand : Proc(IFsrmActionCommand*, Int16*, Win32cr::Foundation::HRESULT),
    put_MonitorCommand : Proc(IFsrmActionCommand*, Int16, Win32cr::Foundation::HRESULT),
    get_KillTimeOut : Proc(IFsrmActionCommand*, Int32*, Win32cr::Foundation::HRESULT),
    put_KillTimeOut : Proc(IFsrmActionCommand*, Int32, Win32cr::Foundation::HRESULT),
    get_LogResult : Proc(IFsrmActionCommand*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogResult : Proc(IFsrmActionCommand*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("12937789-e247-4917-9c20-f3ee9c7ee783")]
  record IFsrmActionCommand, lpVtbl : IFsrmActionCommandVtbl* do
    GUID = LibC::GUID.new(0x12937789_u32, 0xe247_u16, 0x4917_u16, StaticArray[0x9c_u8, 0x20_u8, 0xf3_u8, 0xee_u8, 0x9c_u8, 0x7e_u8, 0xe7_u8, 0x83_u8])
    def query_interface(this : IFsrmActionCommand*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmActionCommand*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmActionCommand*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmActionCommand*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmActionCommand*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmActionCommand*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmActionCommand*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmActionCommand*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_ActionType(this : IFsrmActionCommand*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionType.call(this, actionType)
    end
    def get_RunLimitInterval(this : IFsrmActionCommand*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunLimitInterval.call(this, minutes)
    end
    def put_RunLimitInterval(this : IFsrmActionCommand*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RunLimitInterval.call(this, minutes)
    end
    def delete(this : IFsrmActionCommand*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_ExecutablePath(this : IFsrmActionCommand*, executablePath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutablePath.call(this, executablePath)
    end
    def put_ExecutablePath(this : IFsrmActionCommand*, executablePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutablePath.call(this, executablePath)
    end
    def get_Arguments(this : IFsrmActionCommand*, arguments : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Arguments.call(this, arguments)
    end
    def put_Arguments(this : IFsrmActionCommand*, arguments : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Arguments.call(this, arguments)
    end
    def get_Account(this : IFsrmActionCommand*, account : Win32cr::Storage::FileServerResourceManager::FsrmAccountType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Account.call(this, account)
    end
    def put_Account(this : IFsrmActionCommand*, account : Win32cr::Storage::FileServerResourceManager::FsrmAccountType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Account.call(this, account)
    end
    def get_WorkingDirectory(this : IFsrmActionCommand*, workingDirectory : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WorkingDirectory.call(this, workingDirectory)
    end
    def put_WorkingDirectory(this : IFsrmActionCommand*, workingDirectory : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WorkingDirectory.call(this, workingDirectory)
    end
    def get_MonitorCommand(this : IFsrmActionCommand*, monitorCommand : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MonitorCommand.call(this, monitorCommand)
    end
    def put_MonitorCommand(this : IFsrmActionCommand*, monitorCommand : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MonitorCommand.call(this, monitorCommand)
    end
    def get_KillTimeOut(this : IFsrmActionCommand*, minutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KillTimeOut.call(this, minutes)
    end
    def put_KillTimeOut(this : IFsrmActionCommand*, minutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_KillTimeOut.call(this, minutes)
    end
    def get_LogResult(this : IFsrmActionCommand*, logResults : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogResult.call(this, logResults)
    end
    def put_LogResult(this : IFsrmActionCommand*, logResults : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogResult.call(this, logResults)
    end

  end

  @[Extern]
  record IFsrmSettingVtbl,
    query_interface : Proc(IFsrmSetting*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmSetting*, UInt32),
    release : Proc(IFsrmSetting*, UInt32),
    get_type_info_count : Proc(IFsrmSetting*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmSetting*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmSetting*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmSetting*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SmtpServer : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SmtpServer : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MailFrom : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailFrom : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AdminEmail : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_AdminEmail : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DisableCommandLine : Proc(IFsrmSetting*, Int16*, Win32cr::Foundation::HRESULT),
    put_DisableCommandLine : Proc(IFsrmSetting*, Int16, Win32cr::Foundation::HRESULT),
    get_EnableScreeningAudit : Proc(IFsrmSetting*, Int16*, Win32cr::Foundation::HRESULT),
    put_EnableScreeningAudit : Proc(IFsrmSetting*, Int16, Win32cr::Foundation::HRESULT),
    email_test : Proc(IFsrmSetting*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_action_run_limit_interval : Proc(IFsrmSetting*, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Int32, Win32cr::Foundation::HRESULT),
    get_action_run_limit_interval : Proc(IFsrmSetting*, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f411d4fd-14be-4260-8c40-03b7c95e608a")]
  record IFsrmSetting, lpVtbl : IFsrmSettingVtbl* do
    GUID = LibC::GUID.new(0xf411d4fd_u32, 0x14be_u16, 0x4260_u16, StaticArray[0x8c_u8, 0x40_u8, 0x3_u8, 0xb7_u8, 0xc9_u8, 0x5e_u8, 0x60_u8, 0x8a_u8])
    def query_interface(this : IFsrmSetting*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmSetting*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmSetting*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmSetting*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmSetting*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmSetting*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmSetting*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SmtpServer(this : IFsrmSetting*, smtpServer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SmtpServer.call(this, smtpServer)
    end
    def put_SmtpServer(this : IFsrmSetting*, smtpServer : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SmtpServer.call(this, smtpServer)
    end
    def get_MailFrom(this : IFsrmSetting*, mailFrom : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailFrom.call(this, mailFrom)
    end
    def put_MailFrom(this : IFsrmSetting*, mailFrom : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailFrom.call(this, mailFrom)
    end
    def get_AdminEmail(this : IFsrmSetting*, adminEmail : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AdminEmail.call(this, adminEmail)
    end
    def put_AdminEmail(this : IFsrmSetting*, adminEmail : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AdminEmail.call(this, adminEmail)
    end
    def get_DisableCommandLine(this : IFsrmSetting*, disableCommandLine : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisableCommandLine.call(this, disableCommandLine)
    end
    def put_DisableCommandLine(this : IFsrmSetting*, disableCommandLine : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisableCommandLine.call(this, disableCommandLine)
    end
    def get_EnableScreeningAudit(this : IFsrmSetting*, enableScreeningAudit : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EnableScreeningAudit.call(this, enableScreeningAudit)
    end
    def put_EnableScreeningAudit(this : IFsrmSetting*, enableScreeningAudit : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EnableScreeningAudit.call(this, enableScreeningAudit)
    end
    def email_test(this : IFsrmSetting*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.email_test.call(this, mailTo)
    end
    def set_action_run_limit_interval(this : IFsrmSetting*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, delayTimeMinutes : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_action_run_limit_interval.call(this, actionType, delayTimeMinutes)
    end
    def get_action_run_limit_interval(this : IFsrmSetting*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, delayTimeMinutes : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_action_run_limit_interval.call(this, actionType, delayTimeMinutes)
    end

  end

  @[Extern]
  record IFsrmPathMapperVtbl,
    query_interface : Proc(IFsrmPathMapper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPathMapper*, UInt32),
    release : Proc(IFsrmPathMapper*, UInt32),
    get_type_info_count : Proc(IFsrmPathMapper*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPathMapper*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPathMapper*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPathMapper*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_share_paths_for_local_path : Proc(IFsrmPathMapper*, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6f4dbfff-6920-4821-a6c3-b7e94c1fd60c")]
  record IFsrmPathMapper, lpVtbl : IFsrmPathMapperVtbl* do
    GUID = LibC::GUID.new(0x6f4dbfff_u32, 0x6920_u16, 0x4821_u16, StaticArray[0xa6_u8, 0xc3_u8, 0xb7_u8, 0xe9_u8, 0x4c_u8, 0x1f_u8, 0xd6_u8, 0xc_u8])
    def query_interface(this : IFsrmPathMapper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPathMapper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPathMapper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPathMapper*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPathMapper*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPathMapper*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPathMapper*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_share_paths_for_local_path(this : IFsrmPathMapper*, localPath : Win32cr::Foundation::BSTR, sharePaths : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_share_paths_for_local_path.call(this, localPath, sharePaths)
    end

  end

  @[Extern]
  record IFsrmExportImportVtbl,
    query_interface : Proc(IFsrmExportImport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmExportImport*, UInt32),
    release : Proc(IFsrmExportImport*, UInt32),
    get_type_info_count : Proc(IFsrmExportImport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmExportImport*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmExportImport*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmExportImport*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    export_file_groups : Proc(IFsrmExportImport*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    import_file_groups : Proc(IFsrmExportImport*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    export_file_screen_templates : Proc(IFsrmExportImport*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    import_file_screen_templates : Proc(IFsrmExportImport*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    export_quota_templates : Proc(IFsrmExportImport*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    import_quota_templates : Proc(IFsrmExportImport*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("efcb0ab1-16c4-4a79-812c-725614c3306b")]
  record IFsrmExportImport, lpVtbl : IFsrmExportImportVtbl* do
    GUID = LibC::GUID.new(0xefcb0ab1_u32, 0x16c4_u16, 0x4a79_u16, StaticArray[0x81_u8, 0x2c_u8, 0x72_u8, 0x56_u8, 0x14_u8, 0xc3_u8, 0x30_u8, 0x6b_u8])
    def query_interface(this : IFsrmExportImport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmExportImport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmExportImport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmExportImport*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmExportImport*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmExportImport*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmExportImport*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def export_file_groups(this : IFsrmExportImport*, filePath : Win32cr::Foundation::BSTR, fileGroupNamesSafeArray : Win32cr::System::Com::VARIANT*, remoteHost : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_file_groups.call(this, filePath, fileGroupNamesSafeArray, remoteHost)
    end
    def import_file_groups(this : IFsrmExportImport*, filePath : Win32cr::Foundation::BSTR, fileGroupNamesSafeArray : Win32cr::System::Com::VARIANT*, remoteHost : Win32cr::Foundation::BSTR, fileGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_file_groups.call(this, filePath, fileGroupNamesSafeArray, remoteHost, fileGroups)
    end
    def export_file_screen_templates(this : IFsrmExportImport*, filePath : Win32cr::Foundation::BSTR, templateNamesSafeArray : Win32cr::System::Com::VARIANT*, remoteHost : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_file_screen_templates.call(this, filePath, templateNamesSafeArray, remoteHost)
    end
    def import_file_screen_templates(this : IFsrmExportImport*, filePath : Win32cr::Foundation::BSTR, templateNamesSafeArray : Win32cr::System::Com::VARIANT*, remoteHost : Win32cr::Foundation::BSTR, templates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_file_screen_templates.call(this, filePath, templateNamesSafeArray, remoteHost, templates)
    end
    def export_quota_templates(this : IFsrmExportImport*, filePath : Win32cr::Foundation::BSTR, templateNamesSafeArray : Win32cr::System::Com::VARIANT*, remoteHost : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_quota_templates.call(this, filePath, templateNamesSafeArray, remoteHost)
    end
    def import_quota_templates(this : IFsrmExportImport*, filePath : Win32cr::Foundation::BSTR, templateNamesSafeArray : Win32cr::System::Com::VARIANT*, remoteHost : Win32cr::Foundation::BSTR, templates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_quota_templates.call(this, filePath, templateNamesSafeArray, remoteHost, templates)
    end

  end

  @[Extern]
  record IFsrmDerivedObjectsResultVtbl,
    query_interface : Proc(IFsrmDerivedObjectsResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmDerivedObjectsResult*, UInt32),
    release : Proc(IFsrmDerivedObjectsResult*, UInt32),
    get_type_info_count : Proc(IFsrmDerivedObjectsResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmDerivedObjectsResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmDerivedObjectsResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmDerivedObjectsResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DerivedObjects : Proc(IFsrmDerivedObjectsResult*, Void**, Win32cr::Foundation::HRESULT),
    get_Results : Proc(IFsrmDerivedObjectsResult*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("39322a2d-38ee-4d0d-8095-421a80849a82")]
  record IFsrmDerivedObjectsResult, lpVtbl : IFsrmDerivedObjectsResultVtbl* do
    GUID = LibC::GUID.new(0x39322a2d_u32, 0x38ee_u16, 0x4d0d_u16, StaticArray[0x80_u8, 0x95_u8, 0x42_u8, 0x1a_u8, 0x80_u8, 0x84_u8, 0x9a_u8, 0x82_u8])
    def query_interface(this : IFsrmDerivedObjectsResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmDerivedObjectsResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmDerivedObjectsResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmDerivedObjectsResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmDerivedObjectsResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmDerivedObjectsResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmDerivedObjectsResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DerivedObjects(this : IFsrmDerivedObjectsResult*, derivedObjects : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DerivedObjects.call(this, derivedObjects)
    end
    def get_Results(this : IFsrmDerivedObjectsResult*, results : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Results.call(this, results)
    end

  end

  @[Extern]
  record IFsrmAccessDeniedRemediationClientVtbl,
    query_interface : Proc(IFsrmAccessDeniedRemediationClient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmAccessDeniedRemediationClient*, UInt32),
    release : Proc(IFsrmAccessDeniedRemediationClient*, UInt32),
    get_type_info_count : Proc(IFsrmAccessDeniedRemediationClient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmAccessDeniedRemediationClient*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmAccessDeniedRemediationClient*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmAccessDeniedRemediationClient*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(IFsrmAccessDeniedRemediationClient*, LibC::UIntPtrT, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::AdrClientErrorType, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("40002314-590b-45a5-8e1b-8c05da527e52")]
  record IFsrmAccessDeniedRemediationClient, lpVtbl : IFsrmAccessDeniedRemediationClientVtbl* do
    GUID = LibC::GUID.new(0x40002314_u32, 0x590b_u16, 0x45a5_u16, StaticArray[0x8e_u8, 0x1b_u8, 0x8c_u8, 0x5_u8, 0xda_u8, 0x52_u8, 0x7e_u8, 0x52_u8])
    def query_interface(this : IFsrmAccessDeniedRemediationClient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmAccessDeniedRemediationClient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmAccessDeniedRemediationClient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmAccessDeniedRemediationClient*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmAccessDeniedRemediationClient*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmAccessDeniedRemediationClient*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmAccessDeniedRemediationClient*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def show(this : IFsrmAccessDeniedRemediationClient*, parentWnd : LibC::UIntPtrT, accessPath : Win32cr::Foundation::BSTR, errorType : Win32cr::Storage::FileServerResourceManager::AdrClientErrorType, flags : Int32, windowTitle : Win32cr::Foundation::BSTR, windowMessage : Win32cr::Foundation::BSTR, result : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, parentWnd, accessPath, errorType, flags, windowTitle, windowMessage, result)
    end

  end

  @[Extern]
  record IFsrmQuotaBaseVtbl,
    query_interface : Proc(IFsrmQuotaBase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaBase*, UInt32),
    release : Proc(IFsrmQuotaBase*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaBase*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaBase*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaBase*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaBase*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmQuotaBase*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmQuotaBase*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmQuotaBase*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmQuotaBase*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmQuotaBase*, Win32cr::Foundation::HRESULT),
    get_QuotaLimit : Proc(IFsrmQuotaBase*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_QuotaLimit : Proc(IFsrmQuotaBase*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_QuotaFlags : Proc(IFsrmQuotaBase*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuotaFlags : Proc(IFsrmQuotaBase*, Int32, Win32cr::Foundation::HRESULT),
    get_Thresholds : Proc(IFsrmQuotaBase*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    add_threshold : Proc(IFsrmQuotaBase*, Int32, Win32cr::Foundation::HRESULT),
    delete_threshold : Proc(IFsrmQuotaBase*, Int32, Win32cr::Foundation::HRESULT),
    modify_threshold : Proc(IFsrmQuotaBase*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_threshold_action : Proc(IFsrmQuotaBase*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_threshold_actions : Proc(IFsrmQuotaBase*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1568a795-3924-4118-b74b-68d8f0fa5daf")]
  record IFsrmQuotaBase, lpVtbl : IFsrmQuotaBaseVtbl* do
    GUID = LibC::GUID.new(0x1568a795_u32, 0x3924_u16, 0x4118_u16, StaticArray[0xb7_u8, 0x4b_u8, 0x68_u8, 0xd8_u8, 0xf0_u8, 0xfa_u8, 0x5d_u8, 0xaf_u8])
    def query_interface(this : IFsrmQuotaBase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaBase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaBase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaBase*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaBase*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaBase*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaBase*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmQuotaBase*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmQuotaBase*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmQuotaBase*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmQuotaBase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmQuotaBase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_QuotaLimit(this : IFsrmQuotaBase*, quotaLimit : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaLimit.call(this, quotaLimit)
    end
    def put_QuotaLimit(this : IFsrmQuotaBase*, quotaLimit : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaLimit.call(this, quotaLimit)
    end
    def get_QuotaFlags(this : IFsrmQuotaBase*, quotaFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaFlags.call(this, quotaFlags)
    end
    def put_QuotaFlags(this : IFsrmQuotaBase*, quotaFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaFlags.call(this, quotaFlags)
    end
    def get_Thresholds(this : IFsrmQuotaBase*, thresholds : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Thresholds.call(this, thresholds)
    end
    def add_threshold(this : IFsrmQuotaBase*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_threshold.call(this, threshold)
    end
    def delete_threshold(this : IFsrmQuotaBase*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_threshold.call(this, threshold)
    end
    def modify_threshold(this : IFsrmQuotaBase*, threshold : Int32, newThreshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_threshold.call(this, threshold, newThreshold)
    end
    def create_threshold_action(this : IFsrmQuotaBase*, threshold : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_threshold_action.call(this, threshold, actionType, action)
    end
    def enum_threshold_actions(this : IFsrmQuotaBase*, threshold : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threshold_actions.call(this, threshold, actions)
    end

  end

  @[Extern]
  record IFsrmQuotaObjectVtbl,
    query_interface : Proc(IFsrmQuotaObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaObject*, UInt32),
    release : Proc(IFsrmQuotaObject*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaObject*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaObject*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaObject*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaObject*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmQuotaObject*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmQuotaObject*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmQuotaObject*, Win32cr::Foundation::HRESULT),
    get_QuotaLimit : Proc(IFsrmQuotaObject*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_QuotaLimit : Proc(IFsrmQuotaObject*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_QuotaFlags : Proc(IFsrmQuotaObject*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuotaFlags : Proc(IFsrmQuotaObject*, Int32, Win32cr::Foundation::HRESULT),
    get_Thresholds : Proc(IFsrmQuotaObject*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    add_threshold : Proc(IFsrmQuotaObject*, Int32, Win32cr::Foundation::HRESULT),
    delete_threshold : Proc(IFsrmQuotaObject*, Int32, Win32cr::Foundation::HRESULT),
    modify_threshold : Proc(IFsrmQuotaObject*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_threshold_action : Proc(IFsrmQuotaObject*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_threshold_actions : Proc(IFsrmQuotaObject*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserSid : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SourceTemplateName : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MatchesSourceTemplate : Proc(IFsrmQuotaObject*, Int16*, Win32cr::Foundation::HRESULT),
    apply_template : Proc(IFsrmQuotaObject*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42dc3511-61d5-48ae-b6dc-59fc00c0a8d6")]
  record IFsrmQuotaObject, lpVtbl : IFsrmQuotaObjectVtbl* do
    GUID = LibC::GUID.new(0x42dc3511_u32, 0x61d5_u16, 0x48ae_u16, StaticArray[0xb6_u8, 0xdc_u8, 0x59_u8, 0xfc_u8, 0x0_u8, 0xc0_u8, 0xa8_u8, 0xd6_u8])
    def query_interface(this : IFsrmQuotaObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaObject*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaObject*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaObject*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaObject*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmQuotaObject*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmQuotaObject*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmQuotaObject*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmQuotaObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmQuotaObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_QuotaLimit(this : IFsrmQuotaObject*, quotaLimit : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaLimit.call(this, quotaLimit)
    end
    def put_QuotaLimit(this : IFsrmQuotaObject*, quotaLimit : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaLimit.call(this, quotaLimit)
    end
    def get_QuotaFlags(this : IFsrmQuotaObject*, quotaFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaFlags.call(this, quotaFlags)
    end
    def put_QuotaFlags(this : IFsrmQuotaObject*, quotaFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaFlags.call(this, quotaFlags)
    end
    def get_Thresholds(this : IFsrmQuotaObject*, thresholds : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Thresholds.call(this, thresholds)
    end
    def add_threshold(this : IFsrmQuotaObject*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_threshold.call(this, threshold)
    end
    def delete_threshold(this : IFsrmQuotaObject*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_threshold.call(this, threshold)
    end
    def modify_threshold(this : IFsrmQuotaObject*, threshold : Int32, newThreshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_threshold.call(this, threshold, newThreshold)
    end
    def create_threshold_action(this : IFsrmQuotaObject*, threshold : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_threshold_action.call(this, threshold, actionType, action)
    end
    def enum_threshold_actions(this : IFsrmQuotaObject*, threshold : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threshold_actions.call(this, threshold, actions)
    end
    def get_Path(this : IFsrmQuotaObject*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, path)
    end
    def get_UserSid(this : IFsrmQuotaObject*, userSid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSid.call(this, userSid)
    end
    def get_UserAccount(this : IFsrmQuotaObject*, userAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, userAccount)
    end
    def get_SourceTemplateName(this : IFsrmQuotaObject*, quotaTemplateName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceTemplateName.call(this, quotaTemplateName)
    end
    def get_MatchesSourceTemplate(this : IFsrmQuotaObject*, matches : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MatchesSourceTemplate.call(this, matches)
    end
    def apply_template(this : IFsrmQuotaObject*, quotaTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_template.call(this, quotaTemplateName)
    end

  end

  @[Extern]
  record IFsrmQuotaVtbl,
    query_interface : Proc(IFsrmQuota*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuota*, UInt32),
    release : Proc(IFsrmQuota*, UInt32),
    get_type_info_count : Proc(IFsrmQuota*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuota*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuota*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuota*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmQuota*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmQuota*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmQuota*, Win32cr::Foundation::HRESULT),
    get_QuotaLimit : Proc(IFsrmQuota*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_QuotaLimit : Proc(IFsrmQuota*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_QuotaFlags : Proc(IFsrmQuota*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuotaFlags : Proc(IFsrmQuota*, Int32, Win32cr::Foundation::HRESULT),
    get_Thresholds : Proc(IFsrmQuota*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    add_threshold : Proc(IFsrmQuota*, Int32, Win32cr::Foundation::HRESULT),
    delete_threshold : Proc(IFsrmQuota*, Int32, Win32cr::Foundation::HRESULT),
    modify_threshold : Proc(IFsrmQuota*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_threshold_action : Proc(IFsrmQuota*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_threshold_actions : Proc(IFsrmQuota*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserSid : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SourceTemplateName : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MatchesSourceTemplate : Proc(IFsrmQuota*, Int16*, Win32cr::Foundation::HRESULT),
    apply_template : Proc(IFsrmQuota*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_QuotaUsed : Proc(IFsrmQuota*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_QuotaPeakUsage : Proc(IFsrmQuota*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_QuotaPeakUsageTime : Proc(IFsrmQuota*, Float64*, Win32cr::Foundation::HRESULT),
    reset_peak_usage : Proc(IFsrmQuota*, Win32cr::Foundation::HRESULT),
    refresh_usage_properties : Proc(IFsrmQuota*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("377f739d-9647-4b8e-97d2-5ffce6d759cd")]
  record IFsrmQuota, lpVtbl : IFsrmQuotaVtbl* do
    GUID = LibC::GUID.new(0x377f739d_u32, 0x9647_u16, 0x4b8e_u16, StaticArray[0x97_u8, 0xd2_u8, 0x5f_u8, 0xfc_u8, 0xe6_u8, 0xd7_u8, 0x59_u8, 0xcd_u8])
    def query_interface(this : IFsrmQuota*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuota*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuota*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuota*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuota*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuota*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuota*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmQuota*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmQuota*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmQuota*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmQuota*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmQuota*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_QuotaLimit(this : IFsrmQuota*, quotaLimit : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaLimit.call(this, quotaLimit)
    end
    def put_QuotaLimit(this : IFsrmQuota*, quotaLimit : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaLimit.call(this, quotaLimit)
    end
    def get_QuotaFlags(this : IFsrmQuota*, quotaFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaFlags.call(this, quotaFlags)
    end
    def put_QuotaFlags(this : IFsrmQuota*, quotaFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaFlags.call(this, quotaFlags)
    end
    def get_Thresholds(this : IFsrmQuota*, thresholds : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Thresholds.call(this, thresholds)
    end
    def add_threshold(this : IFsrmQuota*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_threshold.call(this, threshold)
    end
    def delete_threshold(this : IFsrmQuota*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_threshold.call(this, threshold)
    end
    def modify_threshold(this : IFsrmQuota*, threshold : Int32, newThreshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_threshold.call(this, threshold, newThreshold)
    end
    def create_threshold_action(this : IFsrmQuota*, threshold : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_threshold_action.call(this, threshold, actionType, action)
    end
    def enum_threshold_actions(this : IFsrmQuota*, threshold : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threshold_actions.call(this, threshold, actions)
    end
    def get_Path(this : IFsrmQuota*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, path)
    end
    def get_UserSid(this : IFsrmQuota*, userSid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSid.call(this, userSid)
    end
    def get_UserAccount(this : IFsrmQuota*, userAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, userAccount)
    end
    def get_SourceTemplateName(this : IFsrmQuota*, quotaTemplateName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceTemplateName.call(this, quotaTemplateName)
    end
    def get_MatchesSourceTemplate(this : IFsrmQuota*, matches : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MatchesSourceTemplate.call(this, matches)
    end
    def apply_template(this : IFsrmQuota*, quotaTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_template.call(this, quotaTemplateName)
    end
    def get_QuotaUsed(this : IFsrmQuota*, used : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaUsed.call(this, used)
    end
    def get_QuotaPeakUsage(this : IFsrmQuota*, peakUsage : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaPeakUsage.call(this, peakUsage)
    end
    def get_QuotaPeakUsageTime(this : IFsrmQuota*, peakUsageDateTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaPeakUsageTime.call(this, peakUsageDateTime)
    end
    def reset_peak_usage(this : IFsrmQuota*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset_peak_usage.call(this)
    end
    def refresh_usage_properties(this : IFsrmQuota*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_usage_properties.call(this)
    end

  end

  @[Extern]
  record IFsrmAutoApplyQuotaVtbl,
    query_interface : Proc(IFsrmAutoApplyQuota*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmAutoApplyQuota*, UInt32),
    release : Proc(IFsrmAutoApplyQuota*, UInt32),
    get_type_info_count : Proc(IFsrmAutoApplyQuota*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmAutoApplyQuota*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmAutoApplyQuota*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmAutoApplyQuota*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmAutoApplyQuota*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::HRESULT),
    get_QuotaLimit : Proc(IFsrmAutoApplyQuota*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_QuotaLimit : Proc(IFsrmAutoApplyQuota*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_QuotaFlags : Proc(IFsrmAutoApplyQuota*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuotaFlags : Proc(IFsrmAutoApplyQuota*, Int32, Win32cr::Foundation::HRESULT),
    get_Thresholds : Proc(IFsrmAutoApplyQuota*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    add_threshold : Proc(IFsrmAutoApplyQuota*, Int32, Win32cr::Foundation::HRESULT),
    delete_threshold : Proc(IFsrmAutoApplyQuota*, Int32, Win32cr::Foundation::HRESULT),
    modify_threshold : Proc(IFsrmAutoApplyQuota*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_threshold_action : Proc(IFsrmAutoApplyQuota*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_threshold_actions : Proc(IFsrmAutoApplyQuota*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserSid : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SourceTemplateName : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MatchesSourceTemplate : Proc(IFsrmAutoApplyQuota*, Int16*, Win32cr::Foundation::HRESULT),
    apply_template : Proc(IFsrmAutoApplyQuota*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ExcludeFolders : Proc(IFsrmAutoApplyQuota*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ExcludeFolders : Proc(IFsrmAutoApplyQuota*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    commit_and_update_derived : Proc(IFsrmAutoApplyQuota*, Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f82e5729-6aba-4740-bfc7-c7f58f75fb7b")]
  record IFsrmAutoApplyQuota, lpVtbl : IFsrmAutoApplyQuotaVtbl* do
    GUID = LibC::GUID.new(0xf82e5729_u32, 0x6aba_u16, 0x4740_u16, StaticArray[0xbf_u8, 0xc7_u8, 0xc7_u8, 0xf5_u8, 0x8f_u8, 0x75_u8, 0xfb_u8, 0x7b_u8])
    def query_interface(this : IFsrmAutoApplyQuota*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmAutoApplyQuota*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmAutoApplyQuota*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmAutoApplyQuota*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmAutoApplyQuota*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmAutoApplyQuota*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmAutoApplyQuota*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmAutoApplyQuota*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmAutoApplyQuota*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmAutoApplyQuota*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmAutoApplyQuota*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmAutoApplyQuota*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_QuotaLimit(this : IFsrmAutoApplyQuota*, quotaLimit : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaLimit.call(this, quotaLimit)
    end
    def put_QuotaLimit(this : IFsrmAutoApplyQuota*, quotaLimit : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaLimit.call(this, quotaLimit)
    end
    def get_QuotaFlags(this : IFsrmAutoApplyQuota*, quotaFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaFlags.call(this, quotaFlags)
    end
    def put_QuotaFlags(this : IFsrmAutoApplyQuota*, quotaFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaFlags.call(this, quotaFlags)
    end
    def get_Thresholds(this : IFsrmAutoApplyQuota*, thresholds : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Thresholds.call(this, thresholds)
    end
    def add_threshold(this : IFsrmAutoApplyQuota*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_threshold.call(this, threshold)
    end
    def delete_threshold(this : IFsrmAutoApplyQuota*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_threshold.call(this, threshold)
    end
    def modify_threshold(this : IFsrmAutoApplyQuota*, threshold : Int32, newThreshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_threshold.call(this, threshold, newThreshold)
    end
    def create_threshold_action(this : IFsrmAutoApplyQuota*, threshold : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_threshold_action.call(this, threshold, actionType, action)
    end
    def enum_threshold_actions(this : IFsrmAutoApplyQuota*, threshold : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threshold_actions.call(this, threshold, actions)
    end
    def get_Path(this : IFsrmAutoApplyQuota*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, path)
    end
    def get_UserSid(this : IFsrmAutoApplyQuota*, userSid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSid.call(this, userSid)
    end
    def get_UserAccount(this : IFsrmAutoApplyQuota*, userAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, userAccount)
    end
    def get_SourceTemplateName(this : IFsrmAutoApplyQuota*, quotaTemplateName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceTemplateName.call(this, quotaTemplateName)
    end
    def get_MatchesSourceTemplate(this : IFsrmAutoApplyQuota*, matches : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MatchesSourceTemplate.call(this, matches)
    end
    def apply_template(this : IFsrmAutoApplyQuota*, quotaTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_template.call(this, quotaTemplateName)
    end
    def get_ExcludeFolders(this : IFsrmAutoApplyQuota*, folders : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExcludeFolders.call(this, folders)
    end
    def put_ExcludeFolders(this : IFsrmAutoApplyQuota*, folders : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExcludeFolders.call(this, folders)
    end
    def commit_and_update_derived(this : IFsrmAutoApplyQuota*, commitOptions : Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, applyOptions : Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, derivedObjectsResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_and_update_derived.call(this, commitOptions, applyOptions, derivedObjectsResult)
    end

  end

  @[Extern]
  record IFsrmQuotaManagerVtbl,
    query_interface : Proc(IFsrmQuotaManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaManager*, UInt32),
    release : Proc(IFsrmQuotaManager*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ActionVariables : Proc(IFsrmQuotaManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_ActionVariableDescriptions : Proc(IFsrmQuotaManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    create_quota : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_auto_apply_quota : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_quota : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_auto_apply_quota : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_restrictive_quota : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_quotas : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    enum_auto_apply_quotas : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    enum_effective_quotas : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    scan : Proc(IFsrmQuotaManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    create_quota_collection : Proc(IFsrmQuotaManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8bb68c7d-19d8-4ffb-809e-be4fc1734014")]
  record IFsrmQuotaManager, lpVtbl : IFsrmQuotaManagerVtbl* do
    GUID = LibC::GUID.new(0x8bb68c7d_u32, 0x19d8_u16, 0x4ffb_u16, StaticArray[0x80_u8, 0x9e_u8, 0xbe_u8, 0x4f_u8, 0xc1_u8, 0x73_u8, 0x40_u8, 0x14_u8])
    def query_interface(this : IFsrmQuotaManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ActionVariables(this : IFsrmQuotaManager*, variables : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariables.call(this, variables)
    end
    def get_ActionVariableDescriptions(this : IFsrmQuotaManager*, descriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariableDescriptions.call(this, descriptions)
    end
    def create_quota(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_quota.call(this, path, quota)
    end
    def create_auto_apply_quota(this : IFsrmQuotaManager*, quotaTemplateName : Win32cr::Foundation::BSTR, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_auto_apply_quota.call(this, quotaTemplateName, path, quota)
    end
    def get_quota(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_quota.call(this, path, quota)
    end
    def get_auto_apply_quota(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_auto_apply_quota.call(this, path, quota)
    end
    def get_restrictive_quota(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrictive_quota.call(this, path, quota)
    end
    def enum_quotas(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_quotas.call(this, path, options, quotas)
    end
    def enum_auto_apply_quotas(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_auto_apply_quotas.call(this, path, options, quotas)
    end
    def enum_effective_quotas(this : IFsrmQuotaManager*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_effective_quotas.call(this, path, options, quotas)
    end
    def scan(this : IFsrmQuotaManager*, strPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scan.call(this, strPath)
    end
    def create_quota_collection(this : IFsrmQuotaManager*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_quota_collection.call(this, collection)
    end

  end

  @[Extern]
  record IFsrmQuotaManagerExVtbl,
    query_interface : Proc(IFsrmQuotaManagerEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaManagerEx*, UInt32),
    release : Proc(IFsrmQuotaManagerEx*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaManagerEx*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaManagerEx*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaManagerEx*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaManagerEx*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ActionVariables : Proc(IFsrmQuotaManagerEx*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_ActionVariableDescriptions : Proc(IFsrmQuotaManagerEx*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    create_quota : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_auto_apply_quota : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_quota : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_auto_apply_quota : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_restrictive_quota : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_quotas : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    enum_auto_apply_quotas : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    enum_effective_quotas : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    scan : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    create_quota_collection : Proc(IFsrmQuotaManagerEx*, Void**, Win32cr::Foundation::HRESULT),
    is_affected_by_quota : Proc(IFsrmQuotaManagerEx*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4846cb01-d430-494f-abb4-b1054999fb09")]
  record IFsrmQuotaManagerEx, lpVtbl : IFsrmQuotaManagerExVtbl* do
    GUID = LibC::GUID.new(0x4846cb01_u32, 0xd430_u16, 0x494f_u16, StaticArray[0xab_u8, 0xb4_u8, 0xb1_u8, 0x5_u8, 0x49_u8, 0x99_u8, 0xfb_u8, 0x9_u8])
    def query_interface(this : IFsrmQuotaManagerEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaManagerEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaManagerEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaManagerEx*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaManagerEx*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaManagerEx*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaManagerEx*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ActionVariables(this : IFsrmQuotaManagerEx*, variables : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariables.call(this, variables)
    end
    def get_ActionVariableDescriptions(this : IFsrmQuotaManagerEx*, descriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariableDescriptions.call(this, descriptions)
    end
    def create_quota(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_quota.call(this, path, quota)
    end
    def create_auto_apply_quota(this : IFsrmQuotaManagerEx*, quotaTemplateName : Win32cr::Foundation::BSTR, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_auto_apply_quota.call(this, quotaTemplateName, path, quota)
    end
    def get_quota(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_quota.call(this, path, quota)
    end
    def get_auto_apply_quota(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_auto_apply_quota.call(this, path, quota)
    end
    def get_restrictive_quota(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, quota : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrictive_quota.call(this, path, quota)
    end
    def enum_quotas(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_quotas.call(this, path, options, quotas)
    end
    def enum_auto_apply_quotas(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_auto_apply_quotas.call(this, path, options, quotas)
    end
    def enum_effective_quotas(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotas : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_effective_quotas.call(this, path, options, quotas)
    end
    def scan(this : IFsrmQuotaManagerEx*, strPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scan.call(this, strPath)
    end
    def create_quota_collection(this : IFsrmQuotaManagerEx*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_quota_collection.call(this, collection)
    end
    def is_affected_by_quota(this : IFsrmQuotaManagerEx*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, affected : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_affected_by_quota.call(this, path, options, affected)
    end

  end

  @[Extern]
  record IFsrmQuotaTemplateVtbl,
    query_interface : Proc(IFsrmQuotaTemplate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaTemplate*, UInt32),
    release : Proc(IFsrmQuotaTemplate*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaTemplate*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaTemplate*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaTemplate*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaTemplate*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmQuotaTemplate*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::HRESULT),
    get_QuotaLimit : Proc(IFsrmQuotaTemplate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_QuotaLimit : Proc(IFsrmQuotaTemplate*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_QuotaFlags : Proc(IFsrmQuotaTemplate*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuotaFlags : Proc(IFsrmQuotaTemplate*, Int32, Win32cr::Foundation::HRESULT),
    get_Thresholds : Proc(IFsrmQuotaTemplate*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    add_threshold : Proc(IFsrmQuotaTemplate*, Int32, Win32cr::Foundation::HRESULT),
    delete_threshold : Proc(IFsrmQuotaTemplate*, Int32, Win32cr::Foundation::HRESULT),
    modify_threshold : Proc(IFsrmQuotaTemplate*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_threshold_action : Proc(IFsrmQuotaTemplate*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_threshold_actions : Proc(IFsrmQuotaTemplate*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    copy_template : Proc(IFsrmQuotaTemplate*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    commit_and_update_derived : Proc(IFsrmQuotaTemplate*, Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a2efab31-295e-46bb-b976-e86d58b52e8b")]
  record IFsrmQuotaTemplate, lpVtbl : IFsrmQuotaTemplateVtbl* do
    GUID = LibC::GUID.new(0xa2efab31_u32, 0x295e_u16, 0x46bb_u16, StaticArray[0xb9_u8, 0x76_u8, 0xe8_u8, 0x6d_u8, 0x58_u8, 0xb5_u8, 0x2e_u8, 0x8b_u8])
    def query_interface(this : IFsrmQuotaTemplate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaTemplate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaTemplate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaTemplate*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaTemplate*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaTemplate*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaTemplate*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmQuotaTemplate*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmQuotaTemplate*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmQuotaTemplate*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmQuotaTemplate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmQuotaTemplate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_QuotaLimit(this : IFsrmQuotaTemplate*, quotaLimit : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaLimit.call(this, quotaLimit)
    end
    def put_QuotaLimit(this : IFsrmQuotaTemplate*, quotaLimit : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaLimit.call(this, quotaLimit)
    end
    def get_QuotaFlags(this : IFsrmQuotaTemplate*, quotaFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaFlags.call(this, quotaFlags)
    end
    def put_QuotaFlags(this : IFsrmQuotaTemplate*, quotaFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaFlags.call(this, quotaFlags)
    end
    def get_Thresholds(this : IFsrmQuotaTemplate*, thresholds : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Thresholds.call(this, thresholds)
    end
    def add_threshold(this : IFsrmQuotaTemplate*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_threshold.call(this, threshold)
    end
    def delete_threshold(this : IFsrmQuotaTemplate*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_threshold.call(this, threshold)
    end
    def modify_threshold(this : IFsrmQuotaTemplate*, threshold : Int32, newThreshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_threshold.call(this, threshold, newThreshold)
    end
    def create_threshold_action(this : IFsrmQuotaTemplate*, threshold : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_threshold_action.call(this, threshold, actionType, action)
    end
    def enum_threshold_actions(this : IFsrmQuotaTemplate*, threshold : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threshold_actions.call(this, threshold, actions)
    end
    def get_Name(this : IFsrmQuotaTemplate*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmQuotaTemplate*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def copy_template(this : IFsrmQuotaTemplate*, quotaTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_template.call(this, quotaTemplateName)
    end
    def commit_and_update_derived(this : IFsrmQuotaTemplate*, commitOptions : Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, applyOptions : Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, derivedObjectsResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_and_update_derived.call(this, commitOptions, applyOptions, derivedObjectsResult)
    end

  end

  @[Extern]
  record IFsrmQuotaTemplateImportedVtbl,
    query_interface : Proc(IFsrmQuotaTemplateImported*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaTemplateImported*, UInt32),
    release : Proc(IFsrmQuotaTemplateImported*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaTemplateImported*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaTemplateImported*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaTemplateImported*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaTemplateImported*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmQuotaTemplateImported*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::HRESULT),
    get_QuotaLimit : Proc(IFsrmQuotaTemplateImported*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_QuotaLimit : Proc(IFsrmQuotaTemplateImported*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_QuotaFlags : Proc(IFsrmQuotaTemplateImported*, Int32*, Win32cr::Foundation::HRESULT),
    put_QuotaFlags : Proc(IFsrmQuotaTemplateImported*, Int32, Win32cr::Foundation::HRESULT),
    get_Thresholds : Proc(IFsrmQuotaTemplateImported*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    add_threshold : Proc(IFsrmQuotaTemplateImported*, Int32, Win32cr::Foundation::HRESULT),
    delete_threshold : Proc(IFsrmQuotaTemplateImported*, Int32, Win32cr::Foundation::HRESULT),
    modify_threshold : Proc(IFsrmQuotaTemplateImported*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_threshold_action : Proc(IFsrmQuotaTemplateImported*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_threshold_actions : Proc(IFsrmQuotaTemplateImported*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    copy_template : Proc(IFsrmQuotaTemplateImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    commit_and_update_derived : Proc(IFsrmQuotaTemplateImported*, Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, Void**, Win32cr::Foundation::HRESULT),
    get_OverwriteOnCommit : Proc(IFsrmQuotaTemplateImported*, Int16*, Win32cr::Foundation::HRESULT),
    put_OverwriteOnCommit : Proc(IFsrmQuotaTemplateImported*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9a2bf113-a329-44cc-809a-5c00fce8da40")]
  record IFsrmQuotaTemplateImported, lpVtbl : IFsrmQuotaTemplateImportedVtbl* do
    GUID = LibC::GUID.new(0x9a2bf113_u32, 0xa329_u16, 0x44cc_u16, StaticArray[0x80_u8, 0x9a_u8, 0x5c_u8, 0x0_u8, 0xfc_u8, 0xe8_u8, 0xda_u8, 0x40_u8])
    def query_interface(this : IFsrmQuotaTemplateImported*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaTemplateImported*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaTemplateImported*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaTemplateImported*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaTemplateImported*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaTemplateImported*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaTemplateImported*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmQuotaTemplateImported*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmQuotaTemplateImported*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmQuotaTemplateImported*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmQuotaTemplateImported*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmQuotaTemplateImported*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_QuotaLimit(this : IFsrmQuotaTemplateImported*, quotaLimit : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaLimit.call(this, quotaLimit)
    end
    def put_QuotaLimit(this : IFsrmQuotaTemplateImported*, quotaLimit : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaLimit.call(this, quotaLimit)
    end
    def get_QuotaFlags(this : IFsrmQuotaTemplateImported*, quotaFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QuotaFlags.call(this, quotaFlags)
    end
    def put_QuotaFlags(this : IFsrmQuotaTemplateImported*, quotaFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_QuotaFlags.call(this, quotaFlags)
    end
    def get_Thresholds(this : IFsrmQuotaTemplateImported*, thresholds : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Thresholds.call(this, thresholds)
    end
    def add_threshold(this : IFsrmQuotaTemplateImported*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_threshold.call(this, threshold)
    end
    def delete_threshold(this : IFsrmQuotaTemplateImported*, threshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_threshold.call(this, threshold)
    end
    def modify_threshold(this : IFsrmQuotaTemplateImported*, threshold : Int32, newThreshold : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_threshold.call(this, threshold, newThreshold)
    end
    def create_threshold_action(this : IFsrmQuotaTemplateImported*, threshold : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_threshold_action.call(this, threshold, actionType, action)
    end
    def enum_threshold_actions(this : IFsrmQuotaTemplateImported*, threshold : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_threshold_actions.call(this, threshold, actions)
    end
    def get_Name(this : IFsrmQuotaTemplateImported*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmQuotaTemplateImported*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def copy_template(this : IFsrmQuotaTemplateImported*, quotaTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_template.call(this, quotaTemplateName)
    end
    def commit_and_update_derived(this : IFsrmQuotaTemplateImported*, commitOptions : Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, applyOptions : Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, derivedObjectsResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_and_update_derived.call(this, commitOptions, applyOptions, derivedObjectsResult)
    end
    def get_OverwriteOnCommit(this : IFsrmQuotaTemplateImported*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OverwriteOnCommit.call(this, overwrite)
    end
    def put_OverwriteOnCommit(this : IFsrmQuotaTemplateImported*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OverwriteOnCommit.call(this, overwrite)
    end

  end

  @[Extern]
  record IFsrmQuotaTemplateManagerVtbl,
    query_interface : Proc(IFsrmQuotaTemplateManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmQuotaTemplateManager*, UInt32),
    release : Proc(IFsrmQuotaTemplateManager*, UInt32),
    get_type_info_count : Proc(IFsrmQuotaTemplateManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmQuotaTemplateManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmQuotaTemplateManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmQuotaTemplateManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_template : Proc(IFsrmQuotaTemplateManager*, Void**, Win32cr::Foundation::HRESULT),
    get_template : Proc(IFsrmQuotaTemplateManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_templates : Proc(IFsrmQuotaTemplateManager*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    export_templates : Proc(IFsrmQuotaTemplateManager*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    import_templates : Proc(IFsrmQuotaTemplateManager*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4173ac41-172d-4d52-963c-fdc7e415f717")]
  record IFsrmQuotaTemplateManager, lpVtbl : IFsrmQuotaTemplateManagerVtbl* do
    GUID = LibC::GUID.new(0x4173ac41_u32, 0x172d_u16, 0x4d52_u16, StaticArray[0x96_u8, 0x3c_u8, 0xfd_u8, 0xc7_u8, 0xe4_u8, 0x15_u8, 0xf7_u8, 0x17_u8])
    def query_interface(this : IFsrmQuotaTemplateManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmQuotaTemplateManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmQuotaTemplateManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmQuotaTemplateManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmQuotaTemplateManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmQuotaTemplateManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmQuotaTemplateManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_template(this : IFsrmQuotaTemplateManager*, quotaTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_template.call(this, quotaTemplate)
    end
    def get_template(this : IFsrmQuotaTemplateManager*, name : Win32cr::Foundation::BSTR, quotaTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_template.call(this, name, quotaTemplate)
    end
    def enum_templates(this : IFsrmQuotaTemplateManager*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, quotaTemplates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_templates.call(this, options, quotaTemplates)
    end
    def export_templates(this : IFsrmQuotaTemplateManager*, quotaTemplateNamesArray : Win32cr::System::Com::VARIANT*, serializedQuotaTemplates : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_templates.call(this, quotaTemplateNamesArray, serializedQuotaTemplates)
    end
    def import_templates(this : IFsrmQuotaTemplateManager*, serializedQuotaTemplates : Win32cr::Foundation::BSTR, quotaTemplateNamesArray : Win32cr::System::Com::VARIANT*, quotaTemplates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_templates.call(this, serializedQuotaTemplates, quotaTemplateNamesArray, quotaTemplates)
    end

  end

  @[Extern]
  record IFsrmFileGroupVtbl,
    query_interface : Proc(IFsrmFileGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileGroup*, UInt32),
    release : Proc(IFsrmFileGroup*, UInt32),
    get_type_info_count : Proc(IFsrmFileGroup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileGroup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileGroup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileGroup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileGroup*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileGroup*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileGroup*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmFileGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmFileGroup*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IFsrmFileGroup*, Void**, Win32cr::Foundation::HRESULT),
    put_Members : Proc(IFsrmFileGroup*, Void*, Win32cr::Foundation::HRESULT),
    get_NonMembers : Proc(IFsrmFileGroup*, Void**, Win32cr::Foundation::HRESULT),
    put_NonMembers : Proc(IFsrmFileGroup*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8dd04909-0e34-4d55-afaa-89e1f1a1bbb9")]
  record IFsrmFileGroup, lpVtbl : IFsrmFileGroupVtbl* do
    GUID = LibC::GUID.new(0x8dd04909_u32, 0xe34_u16, 0x4d55_u16, StaticArray[0xaf_u8, 0xaa_u8, 0x89_u8, 0xe1_u8, 0xf1_u8, 0xa1_u8, 0xbb_u8, 0xb9_u8])
    def query_interface(this : IFsrmFileGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileGroup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileGroup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileGroup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileGroup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileGroup*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileGroup*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileGroup*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmFileGroup*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmFileGroup*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Members(this : IFsrmFileGroup*, members : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, members)
    end
    def put_Members(this : IFsrmFileGroup*, members : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Members.call(this, members)
    end
    def get_NonMembers(this : IFsrmFileGroup*, nonMembers : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonMembers.call(this, nonMembers)
    end
    def put_NonMembers(this : IFsrmFileGroup*, nonMembers : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NonMembers.call(this, nonMembers)
    end

  end

  @[Extern]
  record IFsrmFileGroupImportedVtbl,
    query_interface : Proc(IFsrmFileGroupImported*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileGroupImported*, UInt32),
    release : Proc(IFsrmFileGroupImported*, UInt32),
    get_type_info_count : Proc(IFsrmFileGroupImported*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileGroupImported*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileGroupImported*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileGroupImported*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileGroupImported*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileGroupImported*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileGroupImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileGroupImported*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileGroupImported*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmFileGroupImported*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmFileGroupImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IFsrmFileGroupImported*, Void**, Win32cr::Foundation::HRESULT),
    put_Members : Proc(IFsrmFileGroupImported*, Void*, Win32cr::Foundation::HRESULT),
    get_NonMembers : Proc(IFsrmFileGroupImported*, Void**, Win32cr::Foundation::HRESULT),
    put_NonMembers : Proc(IFsrmFileGroupImported*, Void*, Win32cr::Foundation::HRESULT),
    get_OverwriteOnCommit : Proc(IFsrmFileGroupImported*, Int16*, Win32cr::Foundation::HRESULT),
    put_OverwriteOnCommit : Proc(IFsrmFileGroupImported*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ad55f10b-5f11-4be7-94ef-d9ee2e470ded")]
  record IFsrmFileGroupImported, lpVtbl : IFsrmFileGroupImportedVtbl* do
    GUID = LibC::GUID.new(0xad55f10b_u32, 0x5f11_u16, 0x4be7_u16, StaticArray[0x94_u8, 0xef_u8, 0xd9_u8, 0xee_u8, 0x2e_u8, 0x47_u8, 0xd_u8, 0xed_u8])
    def query_interface(this : IFsrmFileGroupImported*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileGroupImported*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileGroupImported*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileGroupImported*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileGroupImported*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileGroupImported*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileGroupImported*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileGroupImported*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileGroupImported*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileGroupImported*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileGroupImported*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileGroupImported*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmFileGroupImported*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmFileGroupImported*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Members(this : IFsrmFileGroupImported*, members : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, members)
    end
    def put_Members(this : IFsrmFileGroupImported*, members : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Members.call(this, members)
    end
    def get_NonMembers(this : IFsrmFileGroupImported*, nonMembers : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonMembers.call(this, nonMembers)
    end
    def put_NonMembers(this : IFsrmFileGroupImported*, nonMembers : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NonMembers.call(this, nonMembers)
    end
    def get_OverwriteOnCommit(this : IFsrmFileGroupImported*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OverwriteOnCommit.call(this, overwrite)
    end
    def put_OverwriteOnCommit(this : IFsrmFileGroupImported*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OverwriteOnCommit.call(this, overwrite)
    end

  end

  @[Extern]
  record IFsrmFileGroupManagerVtbl,
    query_interface : Proc(IFsrmFileGroupManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileGroupManager*, UInt32),
    release : Proc(IFsrmFileGroupManager*, UInt32),
    get_type_info_count : Proc(IFsrmFileGroupManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileGroupManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileGroupManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileGroupManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_file_group : Proc(IFsrmFileGroupManager*, Void**, Win32cr::Foundation::HRESULT),
    get_file_group : Proc(IFsrmFileGroupManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_file_groups : Proc(IFsrmFileGroupManager*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    export_file_groups : Proc(IFsrmFileGroupManager*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    import_file_groups : Proc(IFsrmFileGroupManager*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("426677d5-018c-485c-8a51-20b86d00bdc4")]
  record IFsrmFileGroupManager, lpVtbl : IFsrmFileGroupManagerVtbl* do
    GUID = LibC::GUID.new(0x426677d5_u32, 0x18c_u16, 0x485c_u16, StaticArray[0x8a_u8, 0x51_u8, 0x20_u8, 0xb8_u8, 0x6d_u8, 0x0_u8, 0xbd_u8, 0xc4_u8])
    def query_interface(this : IFsrmFileGroupManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileGroupManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileGroupManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileGroupManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileGroupManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileGroupManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileGroupManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_file_group(this : IFsrmFileGroupManager*, fileGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_file_group.call(this, fileGroup)
    end
    def get_file_group(this : IFsrmFileGroupManager*, name : Win32cr::Foundation::BSTR, fileGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_group.call(this, name, fileGroup)
    end
    def enum_file_groups(this : IFsrmFileGroupManager*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, fileGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_file_groups.call(this, options, fileGroups)
    end
    def export_file_groups(this : IFsrmFileGroupManager*, fileGroupNamesArray : Win32cr::System::Com::VARIANT*, serializedFileGroups : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_file_groups.call(this, fileGroupNamesArray, serializedFileGroups)
    end
    def import_file_groups(this : IFsrmFileGroupManager*, serializedFileGroups : Win32cr::Foundation::BSTR, fileGroupNamesArray : Win32cr::System::Com::VARIANT*, fileGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_file_groups.call(this, serializedFileGroups, fileGroupNamesArray, fileGroups)
    end

  end

  @[Extern]
  record IFsrmFileScreenBaseVtbl,
    query_interface : Proc(IFsrmFileScreenBase*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreenBase*, UInt32),
    release : Proc(IFsrmFileScreenBase*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreenBase*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreenBase*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreenBase*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreenBase*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileScreenBase*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileScreenBase*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileScreenBase*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileScreenBase*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileScreenBase*, Win32cr::Foundation::HRESULT),
    get_BlockedFileGroups : Proc(IFsrmFileScreenBase*, Void**, Win32cr::Foundation::HRESULT),
    put_BlockedFileGroups : Proc(IFsrmFileScreenBase*, Void*, Win32cr::Foundation::HRESULT),
    get_FileScreenFlags : Proc(IFsrmFileScreenBase*, Int32*, Win32cr::Foundation::HRESULT),
    put_FileScreenFlags : Proc(IFsrmFileScreenBase*, Int32, Win32cr::Foundation::HRESULT),
    create_action : Proc(IFsrmFileScreenBase*, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_actions : Proc(IFsrmFileScreenBase*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f3637e80-5b22-4a2b-a637-bbb642b41cfc")]
  record IFsrmFileScreenBase, lpVtbl : IFsrmFileScreenBaseVtbl* do
    GUID = LibC::GUID.new(0xf3637e80_u32, 0x5b22_u16, 0x4a2b_u16, StaticArray[0xa6_u8, 0x37_u8, 0xbb_u8, 0xb6_u8, 0x42_u8, 0xb4_u8, 0x1c_u8, 0xfc_u8])
    def query_interface(this : IFsrmFileScreenBase*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreenBase*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreenBase*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreenBase*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreenBase*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreenBase*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreenBase*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileScreenBase*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileScreenBase*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileScreenBase*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileScreenBase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileScreenBase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_BlockedFileGroups(this : IFsrmFileScreenBase*, blockList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockedFileGroups.call(this, blockList)
    end
    def put_BlockedFileGroups(this : IFsrmFileScreenBase*, blockList : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BlockedFileGroups.call(this, blockList)
    end
    def get_FileScreenFlags(this : IFsrmFileScreenBase*, fileScreenFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileScreenFlags.call(this, fileScreenFlags)
    end
    def put_FileScreenFlags(this : IFsrmFileScreenBase*, fileScreenFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileScreenFlags.call(this, fileScreenFlags)
    end
    def create_action(this : IFsrmFileScreenBase*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_action.call(this, actionType, action)
    end
    def enum_actions(this : IFsrmFileScreenBase*, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_actions.call(this, actions)
    end

  end

  @[Extern]
  record IFsrmFileScreenVtbl,
    query_interface : Proc(IFsrmFileScreen*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreen*, UInt32),
    release : Proc(IFsrmFileScreen*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreen*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreen*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreen*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreen*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileScreen*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileScreen*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileScreen*, Win32cr::Foundation::HRESULT),
    get_BlockedFileGroups : Proc(IFsrmFileScreen*, Void**, Win32cr::Foundation::HRESULT),
    put_BlockedFileGroups : Proc(IFsrmFileScreen*, Void*, Win32cr::Foundation::HRESULT),
    get_FileScreenFlags : Proc(IFsrmFileScreen*, Int32*, Win32cr::Foundation::HRESULT),
    put_FileScreenFlags : Proc(IFsrmFileScreen*, Int32, Win32cr::Foundation::HRESULT),
    create_action : Proc(IFsrmFileScreen*, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_actions : Proc(IFsrmFileScreen*, Void**, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SourceTemplateName : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MatchesSourceTemplate : Proc(IFsrmFileScreen*, Int16*, Win32cr::Foundation::HRESULT),
    get_UserSid : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UserAccount : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    apply_template : Proc(IFsrmFileScreen*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5f6325d3-ce88-4733-84c1-2d6aefc5ea07")]
  record IFsrmFileScreen, lpVtbl : IFsrmFileScreenVtbl* do
    GUID = LibC::GUID.new(0x5f6325d3_u32, 0xce88_u16, 0x4733_u16, StaticArray[0x84_u8, 0xc1_u8, 0x2d_u8, 0x6a_u8, 0xef_u8, 0xc5_u8, 0xea_u8, 0x7_u8])
    def query_interface(this : IFsrmFileScreen*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreen*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreen*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreen*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreen*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreen*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreen*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileScreen*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileScreen*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileScreen*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileScreen*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileScreen*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_BlockedFileGroups(this : IFsrmFileScreen*, blockList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockedFileGroups.call(this, blockList)
    end
    def put_BlockedFileGroups(this : IFsrmFileScreen*, blockList : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BlockedFileGroups.call(this, blockList)
    end
    def get_FileScreenFlags(this : IFsrmFileScreen*, fileScreenFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileScreenFlags.call(this, fileScreenFlags)
    end
    def put_FileScreenFlags(this : IFsrmFileScreen*, fileScreenFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileScreenFlags.call(this, fileScreenFlags)
    end
    def create_action(this : IFsrmFileScreen*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_action.call(this, actionType, action)
    end
    def enum_actions(this : IFsrmFileScreen*, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_actions.call(this, actions)
    end
    def get_Path(this : IFsrmFileScreen*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, path)
    end
    def get_SourceTemplateName(this : IFsrmFileScreen*, fileScreenTemplateName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SourceTemplateName.call(this, fileScreenTemplateName)
    end
    def get_MatchesSourceTemplate(this : IFsrmFileScreen*, matches : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MatchesSourceTemplate.call(this, matches)
    end
    def get_UserSid(this : IFsrmFileScreen*, userSid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserSid.call(this, userSid)
    end
    def get_UserAccount(this : IFsrmFileScreen*, userAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserAccount.call(this, userAccount)
    end
    def apply_template(this : IFsrmFileScreen*, fileScreenTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.apply_template.call(this, fileScreenTemplateName)
    end

  end

  @[Extern]
  record IFsrmFileScreenExceptionVtbl,
    query_interface : Proc(IFsrmFileScreenException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreenException*, UInt32),
    release : Proc(IFsrmFileScreenException*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreenException*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreenException*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreenException*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreenException*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileScreenException*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileScreenException*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileScreenException*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileScreenException*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileScreenException*, Win32cr::Foundation::HRESULT),
    get_Path : Proc(IFsrmFileScreenException*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AllowedFileGroups : Proc(IFsrmFileScreenException*, Void**, Win32cr::Foundation::HRESULT),
    put_AllowedFileGroups : Proc(IFsrmFileScreenException*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bee7ce02-df77-4515-9389-78f01c5afc1a")]
  record IFsrmFileScreenException, lpVtbl : IFsrmFileScreenExceptionVtbl* do
    GUID = LibC::GUID.new(0xbee7ce02_u32, 0xdf77_u16, 0x4515_u16, StaticArray[0x93_u8, 0x89_u8, 0x78_u8, 0xf0_u8, 0x1c_u8, 0x5a_u8, 0xfc_u8, 0x1a_u8])
    def query_interface(this : IFsrmFileScreenException*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreenException*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreenException*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreenException*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreenException*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreenException*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreenException*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileScreenException*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileScreenException*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileScreenException*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileScreenException*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileScreenException*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Path(this : IFsrmFileScreenException*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Path.call(this, path)
    end
    def get_AllowedFileGroups(this : IFsrmFileScreenException*, allowList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowedFileGroups.call(this, allowList)
    end
    def put_AllowedFileGroups(this : IFsrmFileScreenException*, allowList : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowedFileGroups.call(this, allowList)
    end

  end

  @[Extern]
  record IFsrmFileScreenManagerVtbl,
    query_interface : Proc(IFsrmFileScreenManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreenManager*, UInt32),
    release : Proc(IFsrmFileScreenManager*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreenManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreenManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreenManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreenManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ActionVariables : Proc(IFsrmFileScreenManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_ActionVariableDescriptions : Proc(IFsrmFileScreenManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    create_file_screen : Proc(IFsrmFileScreenManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_file_screen : Proc(IFsrmFileScreenManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_file_screens : Proc(IFsrmFileScreenManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_file_screen_exception : Proc(IFsrmFileScreenManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_file_screen_exception : Proc(IFsrmFileScreenManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_file_screen_exceptions : Proc(IFsrmFileScreenManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_file_screen_collection : Proc(IFsrmFileScreenManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ff4fa04e-5a94-4bda-a3a0-d5b4d3c52eba")]
  record IFsrmFileScreenManager, lpVtbl : IFsrmFileScreenManagerVtbl* do
    GUID = LibC::GUID.new(0xff4fa04e_u32, 0x5a94_u16, 0x4bda_u16, StaticArray[0xa3_u8, 0xa0_u8, 0xd5_u8, 0xb4_u8, 0xd3_u8, 0xc5_u8, 0x2e_u8, 0xba_u8])
    def query_interface(this : IFsrmFileScreenManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreenManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreenManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreenManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreenManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreenManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreenManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ActionVariables(this : IFsrmFileScreenManager*, variables : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariables.call(this, variables)
    end
    def get_ActionVariableDescriptions(this : IFsrmFileScreenManager*, descriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariableDescriptions.call(this, descriptions)
    end
    def create_file_screen(this : IFsrmFileScreenManager*, path : Win32cr::Foundation::BSTR, fileScreen : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_file_screen.call(this, path, fileScreen)
    end
    def get_file_screen(this : IFsrmFileScreenManager*, path : Win32cr::Foundation::BSTR, fileScreen : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_screen.call(this, path, fileScreen)
    end
    def enum_file_screens(this : IFsrmFileScreenManager*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, fileScreens : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_file_screens.call(this, path, options, fileScreens)
    end
    def create_file_screen_exception(this : IFsrmFileScreenManager*, path : Win32cr::Foundation::BSTR, fileScreenException : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_file_screen_exception.call(this, path, fileScreenException)
    end
    def get_file_screen_exception(this : IFsrmFileScreenManager*, path : Win32cr::Foundation::BSTR, fileScreenException : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_screen_exception.call(this, path, fileScreenException)
    end
    def enum_file_screen_exceptions(this : IFsrmFileScreenManager*, path : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, fileScreenExceptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_file_screen_exceptions.call(this, path, options, fileScreenExceptions)
    end
    def create_file_screen_collection(this : IFsrmFileScreenManager*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_file_screen_collection.call(this, collection)
    end

  end

  @[Extern]
  record IFsrmFileScreenTemplateVtbl,
    query_interface : Proc(IFsrmFileScreenTemplate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreenTemplate*, UInt32),
    release : Proc(IFsrmFileScreenTemplate*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreenTemplate*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreenTemplate*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreenTemplate*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreenTemplate*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileScreenTemplate*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::HRESULT),
    get_BlockedFileGroups : Proc(IFsrmFileScreenTemplate*, Void**, Win32cr::Foundation::HRESULT),
    put_BlockedFileGroups : Proc(IFsrmFileScreenTemplate*, Void*, Win32cr::Foundation::HRESULT),
    get_FileScreenFlags : Proc(IFsrmFileScreenTemplate*, Int32*, Win32cr::Foundation::HRESULT),
    put_FileScreenFlags : Proc(IFsrmFileScreenTemplate*, Int32, Win32cr::Foundation::HRESULT),
    create_action : Proc(IFsrmFileScreenTemplate*, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_actions : Proc(IFsrmFileScreenTemplate*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    copy_template : Proc(IFsrmFileScreenTemplate*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    commit_and_update_derived : Proc(IFsrmFileScreenTemplate*, Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("205bebf8-dd93-452a-95a6-32b566b35828")]
  record IFsrmFileScreenTemplate, lpVtbl : IFsrmFileScreenTemplateVtbl* do
    GUID = LibC::GUID.new(0x205bebf8_u32, 0xdd93_u16, 0x452a_u16, StaticArray[0x95_u8, 0xa6_u8, 0x32_u8, 0xb5_u8, 0x66_u8, 0xb3_u8, 0x58_u8, 0x28_u8])
    def query_interface(this : IFsrmFileScreenTemplate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreenTemplate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreenTemplate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreenTemplate*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreenTemplate*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreenTemplate*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreenTemplate*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileScreenTemplate*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileScreenTemplate*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileScreenTemplate*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileScreenTemplate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileScreenTemplate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_BlockedFileGroups(this : IFsrmFileScreenTemplate*, blockList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockedFileGroups.call(this, blockList)
    end
    def put_BlockedFileGroups(this : IFsrmFileScreenTemplate*, blockList : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BlockedFileGroups.call(this, blockList)
    end
    def get_FileScreenFlags(this : IFsrmFileScreenTemplate*, fileScreenFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileScreenFlags.call(this, fileScreenFlags)
    end
    def put_FileScreenFlags(this : IFsrmFileScreenTemplate*, fileScreenFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileScreenFlags.call(this, fileScreenFlags)
    end
    def create_action(this : IFsrmFileScreenTemplate*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_action.call(this, actionType, action)
    end
    def enum_actions(this : IFsrmFileScreenTemplate*, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_actions.call(this, actions)
    end
    def get_Name(this : IFsrmFileScreenTemplate*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmFileScreenTemplate*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def copy_template(this : IFsrmFileScreenTemplate*, fileScreenTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_template.call(this, fileScreenTemplateName)
    end
    def commit_and_update_derived(this : IFsrmFileScreenTemplate*, commitOptions : Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, applyOptions : Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, derivedObjectsResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_and_update_derived.call(this, commitOptions, applyOptions, derivedObjectsResult)
    end

  end

  @[Extern]
  record IFsrmFileScreenTemplateImportedVtbl,
    query_interface : Proc(IFsrmFileScreenTemplateImported*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreenTemplateImported*, UInt32),
    release : Proc(IFsrmFileScreenTemplateImported*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreenTemplateImported*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreenTemplateImported*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreenTemplateImported*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreenTemplateImported*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileScreenTemplateImported*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::HRESULT),
    get_BlockedFileGroups : Proc(IFsrmFileScreenTemplateImported*, Void**, Win32cr::Foundation::HRESULT),
    put_BlockedFileGroups : Proc(IFsrmFileScreenTemplateImported*, Void*, Win32cr::Foundation::HRESULT),
    get_FileScreenFlags : Proc(IFsrmFileScreenTemplateImported*, Int32*, Win32cr::Foundation::HRESULT),
    put_FileScreenFlags : Proc(IFsrmFileScreenTemplateImported*, Int32, Win32cr::Foundation::HRESULT),
    create_action : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_actions : Proc(IFsrmFileScreenTemplateImported*, Void**, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    copy_template : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    commit_and_update_derived : Proc(IFsrmFileScreenTemplateImported*, Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, Void**, Win32cr::Foundation::HRESULT),
    get_OverwriteOnCommit : Proc(IFsrmFileScreenTemplateImported*, Int16*, Win32cr::Foundation::HRESULT),
    put_OverwriteOnCommit : Proc(IFsrmFileScreenTemplateImported*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1010359-3e5d-4ecd-9fe4-ef48622fdf30")]
  record IFsrmFileScreenTemplateImported, lpVtbl : IFsrmFileScreenTemplateImportedVtbl* do
    GUID = LibC::GUID.new(0xe1010359_u32, 0x3e5d_u16, 0x4ecd_u16, StaticArray[0x9f_u8, 0xe4_u8, 0xef_u8, 0x48_u8, 0x62_u8, 0x2f_u8, 0xdf_u8, 0x30_u8])
    def query_interface(this : IFsrmFileScreenTemplateImported*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreenTemplateImported*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreenTemplateImported*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreenTemplateImported*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreenTemplateImported*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreenTemplateImported*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreenTemplateImported*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileScreenTemplateImported*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileScreenTemplateImported*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileScreenTemplateImported*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileScreenTemplateImported*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileScreenTemplateImported*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_BlockedFileGroups(this : IFsrmFileScreenTemplateImported*, blockList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BlockedFileGroups.call(this, blockList)
    end
    def put_BlockedFileGroups(this : IFsrmFileScreenTemplateImported*, blockList : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BlockedFileGroups.call(this, blockList)
    end
    def get_FileScreenFlags(this : IFsrmFileScreenTemplateImported*, fileScreenFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileScreenFlags.call(this, fileScreenFlags)
    end
    def put_FileScreenFlags(this : IFsrmFileScreenTemplateImported*, fileScreenFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileScreenFlags.call(this, fileScreenFlags)
    end
    def create_action(this : IFsrmFileScreenTemplateImported*, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_action.call(this, actionType, action)
    end
    def enum_actions(this : IFsrmFileScreenTemplateImported*, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_actions.call(this, actions)
    end
    def get_Name(this : IFsrmFileScreenTemplateImported*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmFileScreenTemplateImported*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def copy_template(this : IFsrmFileScreenTemplateImported*, fileScreenTemplateName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_template.call(this, fileScreenTemplateName)
    end
    def commit_and_update_derived(this : IFsrmFileScreenTemplateImported*, commitOptions : Win32cr::Storage::FileServerResourceManager::FsrmCommitOptions, applyOptions : Win32cr::Storage::FileServerResourceManager::FsrmTemplateApplyOptions, derivedObjectsResult : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_and_update_derived.call(this, commitOptions, applyOptions, derivedObjectsResult)
    end
    def get_OverwriteOnCommit(this : IFsrmFileScreenTemplateImported*, overwrite : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OverwriteOnCommit.call(this, overwrite)
    end
    def put_OverwriteOnCommit(this : IFsrmFileScreenTemplateImported*, overwrite : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OverwriteOnCommit.call(this, overwrite)
    end

  end

  @[Extern]
  record IFsrmFileScreenTemplateManagerVtbl,
    query_interface : Proc(IFsrmFileScreenTemplateManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileScreenTemplateManager*, UInt32),
    release : Proc(IFsrmFileScreenTemplateManager*, UInt32),
    get_type_info_count : Proc(IFsrmFileScreenTemplateManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileScreenTemplateManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileScreenTemplateManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileScreenTemplateManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    create_template : Proc(IFsrmFileScreenTemplateManager*, Void**, Win32cr::Foundation::HRESULT),
    get_template : Proc(IFsrmFileScreenTemplateManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_templates : Proc(IFsrmFileScreenTemplateManager*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    export_templates : Proc(IFsrmFileScreenTemplateManager*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    import_templates : Proc(IFsrmFileScreenTemplateManager*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cfe36cba-1949-4e74-a14f-f1d580ceaf13")]
  record IFsrmFileScreenTemplateManager, lpVtbl : IFsrmFileScreenTemplateManagerVtbl* do
    GUID = LibC::GUID.new(0xcfe36cba_u32, 0x1949_u16, 0x4e74_u16, StaticArray[0xa1_u8, 0x4f_u8, 0xf1_u8, 0xd5_u8, 0x80_u8, 0xce_u8, 0xaf_u8, 0x13_u8])
    def query_interface(this : IFsrmFileScreenTemplateManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileScreenTemplateManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileScreenTemplateManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileScreenTemplateManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileScreenTemplateManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileScreenTemplateManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileScreenTemplateManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def create_template(this : IFsrmFileScreenTemplateManager*, fileScreenTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_template.call(this, fileScreenTemplate)
    end
    def get_template(this : IFsrmFileScreenTemplateManager*, name : Win32cr::Foundation::BSTR, fileScreenTemplate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_template.call(this, name, fileScreenTemplate)
    end
    def enum_templates(this : IFsrmFileScreenTemplateManager*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, fileScreenTemplates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_templates.call(this, options, fileScreenTemplates)
    end
    def export_templates(this : IFsrmFileScreenTemplateManager*, fileScreenTemplateNamesArray : Win32cr::System::Com::VARIANT*, serializedFileScreenTemplates : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_templates.call(this, fileScreenTemplateNamesArray, serializedFileScreenTemplates)
    end
    def import_templates(this : IFsrmFileScreenTemplateManager*, serializedFileScreenTemplates : Win32cr::Foundation::BSTR, fileScreenTemplateNamesArray : Win32cr::System::Com::VARIANT*, fileScreenTemplates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_templates.call(this, serializedFileScreenTemplates, fileScreenTemplateNamesArray, fileScreenTemplates)
    end

  end

  @[Extern]
  record IFsrmReportManagerVtbl,
    query_interface : Proc(IFsrmReportManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmReportManager*, UInt32),
    release : Proc(IFsrmReportManager*, UInt32),
    get_type_info_count : Proc(IFsrmReportManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmReportManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmReportManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmReportManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    enum_report_jobs : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_report_job : Proc(IFsrmReportManager*, Void**, Win32cr::Foundation::HRESULT),
    get_report_job : Proc(IFsrmReportManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_output_directory : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_output_directory : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    is_filter_valid_for_report_type : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportType, Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, Int16*, Win32cr::Foundation::HRESULT),
    get_default_filter : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportType, Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_default_filter : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportType, Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_report_size_limit : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportLimit, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_report_size_limit : Proc(IFsrmReportManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportLimit, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("27b899fe-6ffa-4481-a184-d3daade8a02b")]
  record IFsrmReportManager, lpVtbl : IFsrmReportManagerVtbl* do
    GUID = LibC::GUID.new(0x27b899fe_u32, 0x6ffa_u16, 0x4481_u16, StaticArray[0xa1_u8, 0x84_u8, 0xd3_u8, 0xda_u8, 0xad_u8, 0xe8_u8, 0xa0_u8, 0x2b_u8])
    def query_interface(this : IFsrmReportManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmReportManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmReportManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmReportManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmReportManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmReportManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmReportManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def enum_report_jobs(this : IFsrmReportManager*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, reportJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_report_jobs.call(this, options, reportJobs)
    end
    def create_report_job(this : IFsrmReportManager*, reportJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_report_job.call(this, reportJob)
    end
    def get_report_job(this : IFsrmReportManager*, taskName : Win32cr::Foundation::BSTR, reportJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_report_job.call(this, taskName, reportJob)
    end
    def get_output_directory(this : IFsrmReportManager*, context : Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_output_directory.call(this, context, path)
    end
    def set_output_directory(this : IFsrmReportManager*, context : Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, path : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_output_directory.call(this, context, path)
    end
    def is_filter_valid_for_report_type(this : IFsrmReportManager*, reportType : Win32cr::Storage::FileServerResourceManager::FsrmReportType, filter : Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, valid : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_filter_valid_for_report_type.call(this, reportType, filter, valid)
    end
    def get_default_filter(this : IFsrmReportManager*, reportType : Win32cr::Storage::FileServerResourceManager::FsrmReportType, filter : Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, filterValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_filter.call(this, reportType, filter, filterValue)
    end
    def set_default_filter(this : IFsrmReportManager*, reportType : Win32cr::Storage::FileServerResourceManager::FsrmReportType, filter : Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, filterValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_filter.call(this, reportType, filter, filterValue)
    end
    def get_report_size_limit(this : IFsrmReportManager*, limit : Win32cr::Storage::FileServerResourceManager::FsrmReportLimit, limitValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_report_size_limit.call(this, limit, limitValue)
    end
    def set_report_size_limit(this : IFsrmReportManager*, limit : Win32cr::Storage::FileServerResourceManager::FsrmReportLimit, limitValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_report_size_limit.call(this, limit, limitValue)
    end

  end

  @[Extern]
  record IFsrmReportJobVtbl,
    query_interface : Proc(IFsrmReportJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmReportJob*, UInt32),
    release : Proc(IFsrmReportJob*, UInt32),
    get_type_info_count : Proc(IFsrmReportJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmReportJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmReportJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmReportJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmReportJob*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmReportJob*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmReportJob*, Win32cr::Foundation::HRESULT),
    get_Task : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Task : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_NamespaceRoots : Proc(IFsrmReportJob*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_NamespaceRoots : Proc(IFsrmReportJob*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Formats : Proc(IFsrmReportJob*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Formats : Proc(IFsrmReportJob*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_MailTo : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailTo : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RunningStatus : Proc(IFsrmReportJob*, Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*, Win32cr::Foundation::HRESULT),
    get_LastRun : Proc(IFsrmReportJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_LastError : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LastGeneratedInDirectory : Proc(IFsrmReportJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    enum_reports : Proc(IFsrmReportJob*, Void**, Win32cr::Foundation::HRESULT),
    create_report : Proc(IFsrmReportJob*, Win32cr::Storage::FileServerResourceManager::FsrmReportType, Void**, Win32cr::Foundation::HRESULT),
    run : Proc(IFsrmReportJob*, Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, Win32cr::Foundation::HRESULT),
    wait_for_completion : Proc(IFsrmReportJob*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFsrmReportJob*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("38e87280-715c-4c7d-a280-ea1651a19fef")]
  record IFsrmReportJob, lpVtbl : IFsrmReportJobVtbl* do
    GUID = LibC::GUID.new(0x38e87280_u32, 0x715c_u16, 0x4c7d_u16, StaticArray[0xa2_u8, 0x80_u8, 0xea_u8, 0x16_u8, 0x51_u8, 0xa1_u8, 0x9f_u8, 0xef_u8])
    def query_interface(this : IFsrmReportJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmReportJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmReportJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmReportJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmReportJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmReportJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmReportJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmReportJob*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmReportJob*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmReportJob*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmReportJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmReportJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Task(this : IFsrmReportJob*, taskName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Task.call(this, taskName)
    end
    def put_Task(this : IFsrmReportJob*, taskName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Task.call(this, taskName)
    end
    def get_NamespaceRoots(this : IFsrmReportJob*, namespaceRoots : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NamespaceRoots.call(this, namespaceRoots)
    end
    def put_NamespaceRoots(this : IFsrmReportJob*, namespaceRoots : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NamespaceRoots.call(this, namespaceRoots)
    end
    def get_Formats(this : IFsrmReportJob*, formats : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Formats.call(this, formats)
    end
    def put_Formats(this : IFsrmReportJob*, formats : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Formats.call(this, formats)
    end
    def get_MailTo(this : IFsrmReportJob*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailTo.call(this, mailTo)
    end
    def put_MailTo(this : IFsrmReportJob*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailTo.call(this, mailTo)
    end
    def get_RunningStatus(this : IFsrmReportJob*, runningStatus : Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunningStatus.call(this, runningStatus)
    end
    def get_LastRun(this : IFsrmReportJob*, lastRun : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastRun.call(this, lastRun)
    end
    def get_LastError(this : IFsrmReportJob*, lastError : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastError.call(this, lastError)
    end
    def get_LastGeneratedInDirectory(this : IFsrmReportJob*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastGeneratedInDirectory.call(this, path)
    end
    def enum_reports(this : IFsrmReportJob*, reports : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_reports.call(this, reports)
    end
    def create_report(this : IFsrmReportJob*, reportType : Win32cr::Storage::FileServerResourceManager::FsrmReportType, report : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_report.call(this, reportType, report)
    end
    def run(this : IFsrmReportJob*, context : Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this, context)
    end
    def wait_for_completion(this : IFsrmReportJob*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_completion.call(this, waitSeconds, completed)
    end
    def cancel(this : IFsrmReportJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record IFsrmReportVtbl,
    query_interface : Proc(IFsrmReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmReport*, UInt32),
    release : Proc(IFsrmReport*, UInt32),
    get_type_info_count : Proc(IFsrmReport*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmReport*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmReport*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmReport*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IFsrmReport*, Win32cr::Storage::FileServerResourceManager::FsrmReportType*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmReport*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmReport*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_LastGeneratedFileNamePrefix : Proc(IFsrmReport*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_filter : Proc(IFsrmReport*, Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_filter : Proc(IFsrmReport*, Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmReport*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d8cc81d9-46b8-4fa4-bfa5-4aa9dec9b638")]
  record IFsrmReport, lpVtbl : IFsrmReportVtbl* do
    GUID = LibC::GUID.new(0xd8cc81d9_u32, 0x46b8_u16, 0x4fa4_u16, StaticArray[0xbf_u8, 0xa5_u8, 0x4a_u8, 0xa9_u8, 0xde_u8, 0xc9_u8, 0xb6_u8, 0x38_u8])
    def query_interface(this : IFsrmReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmReport*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmReport*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmReport*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmReport*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IFsrmReport*, reportType : Win32cr::Storage::FileServerResourceManager::FsrmReportType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, reportType)
    end
    def get_Name(this : IFsrmReport*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmReport*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Description(this : IFsrmReport*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmReport*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def get_LastGeneratedFileNamePrefix(this : IFsrmReport*, prefix : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastGeneratedFileNamePrefix.call(this, prefix)
    end
    def get_filter(this : IFsrmReport*, filter : Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, filterValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_filter.call(this, filter, filterValue)
    end
    def set_filter(this : IFsrmReport*, filter : Win32cr::Storage::FileServerResourceManager::FsrmReportFilter, filterValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_filter.call(this, filter, filterValue)
    end
    def delete(this : IFsrmReport*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IFsrmReportSchedulerVtbl,
    query_interface : Proc(IFsrmReportScheduler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmReportScheduler*, UInt32),
    release : Proc(IFsrmReportScheduler*, UInt32),
    get_type_info_count : Proc(IFsrmReportScheduler*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmReportScheduler*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmReportScheduler*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmReportScheduler*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    verify_namespaces : Proc(IFsrmReportScheduler*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    create_schedule_task : Proc(IFsrmReportScheduler*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    modify_schedule_task : Proc(IFsrmReportScheduler*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete_schedule_task : Proc(IFsrmReportScheduler*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6879caf9-6617-4484-8719-71c3d8645f94")]
  record IFsrmReportScheduler, lpVtbl : IFsrmReportSchedulerVtbl* do
    GUID = LibC::GUID.new(0x6879caf9_u32, 0x6617_u16, 0x4484_u16, StaticArray[0x87_u8, 0x19_u8, 0x71_u8, 0xc3_u8, 0xd8_u8, 0x64_u8, 0x5f_u8, 0x94_u8])
    def query_interface(this : IFsrmReportScheduler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmReportScheduler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmReportScheduler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmReportScheduler*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmReportScheduler*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmReportScheduler*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmReportScheduler*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def verify_namespaces(this : IFsrmReportScheduler*, namespacesSafeArray : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.verify_namespaces.call(this, namespacesSafeArray)
    end
    def create_schedule_task(this : IFsrmReportScheduler*, taskName : Win32cr::Foundation::BSTR, namespacesSafeArray : Win32cr::System::Com::VARIANT*, serializedTask : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_schedule_task.call(this, taskName, namespacesSafeArray, serializedTask)
    end
    def modify_schedule_task(this : IFsrmReportScheduler*, taskName : Win32cr::Foundation::BSTR, namespacesSafeArray : Win32cr::System::Com::VARIANT*, serializedTask : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_schedule_task.call(this, taskName, namespacesSafeArray, serializedTask)
    end
    def delete_schedule_task(this : IFsrmReportScheduler*, taskName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_schedule_task.call(this, taskName)
    end

  end

  @[Extern]
  record IFsrmFileManagementJobManagerVtbl,
    query_interface : Proc(IFsrmFileManagementJobManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileManagementJobManager*, UInt32),
    release : Proc(IFsrmFileManagementJobManager*, UInt32),
    get_type_info_count : Proc(IFsrmFileManagementJobManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileManagementJobManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileManagementJobManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileManagementJobManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ActionVariables : Proc(IFsrmFileManagementJobManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_ActionVariableDescriptions : Proc(IFsrmFileManagementJobManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    enum_file_management_jobs : Proc(IFsrmFileManagementJobManager*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_file_management_job : Proc(IFsrmFileManagementJobManager*, Void**, Win32cr::Foundation::HRESULT),
    get_file_management_job : Proc(IFsrmFileManagementJobManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ee321ecb-d95e-48e9-907c-c7685a013235")]
  record IFsrmFileManagementJobManager, lpVtbl : IFsrmFileManagementJobManagerVtbl* do
    GUID = LibC::GUID.new(0xee321ecb_u32, 0xd95e_u16, 0x48e9_u16, StaticArray[0x90_u8, 0x7c_u8, 0xc7_u8, 0x68_u8, 0x5a_u8, 0x1_u8, 0x32_u8, 0x35_u8])
    def query_interface(this : IFsrmFileManagementJobManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileManagementJobManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileManagementJobManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileManagementJobManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileManagementJobManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileManagementJobManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileManagementJobManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ActionVariables(this : IFsrmFileManagementJobManager*, variables : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariables.call(this, variables)
    end
    def get_ActionVariableDescriptions(this : IFsrmFileManagementJobManager*, descriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActionVariableDescriptions.call(this, descriptions)
    end
    def enum_file_management_jobs(this : IFsrmFileManagementJobManager*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, fileManagementJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_file_management_jobs.call(this, options, fileManagementJobs)
    end
    def create_file_management_job(this : IFsrmFileManagementJobManager*, fileManagementJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_file_management_job.call(this, fileManagementJob)
    end
    def get_file_management_job(this : IFsrmFileManagementJobManager*, name : Win32cr::Foundation::BSTR, fileManagementJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_management_job.call(this, name, fileManagementJob)
    end

  end

  @[Extern]
  record IFsrmFileManagementJobVtbl,
    query_interface : Proc(IFsrmFileManagementJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileManagementJob*, UInt32),
    release : Proc(IFsrmFileManagementJob*, UInt32),
    get_type_info_count : Proc(IFsrmFileManagementJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileManagementJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileManagementJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileManagementJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmFileManagementJob*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_NamespaceRoots : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_NamespaceRoots : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IFsrmFileManagementJob*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IFsrmFileManagementJob*, Int16, Win32cr::Foundation::HRESULT),
    get_OperationType : Proc(IFsrmFileManagementJob*, Win32cr::Storage::FileServerResourceManager::FsrmFileManagementType*, Win32cr::Foundation::HRESULT),
    put_OperationType : Proc(IFsrmFileManagementJob*, Win32cr::Storage::FileServerResourceManager::FsrmFileManagementType, Win32cr::Foundation::HRESULT),
    get_ExpirationDirectory : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ExpirationDirectory : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CustomAction : Proc(IFsrmFileManagementJob*, Void**, Win32cr::Foundation::HRESULT),
    get_Notifications : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_Logging : Proc(IFsrmFileManagementJob*, Int32*, Win32cr::Foundation::HRESULT),
    put_Logging : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Foundation::HRESULT),
    get_ReportEnabled : Proc(IFsrmFileManagementJob*, Int16*, Win32cr::Foundation::HRESULT),
    put_ReportEnabled : Proc(IFsrmFileManagementJob*, Int16, Win32cr::Foundation::HRESULT),
    get_Formats : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Formats : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_MailTo : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MailTo : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DaysSinceFileCreated : Proc(IFsrmFileManagementJob*, Int32*, Win32cr::Foundation::HRESULT),
    put_DaysSinceFileCreated : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Foundation::HRESULT),
    get_DaysSinceFileLastAccessed : Proc(IFsrmFileManagementJob*, Int32*, Win32cr::Foundation::HRESULT),
    put_DaysSinceFileLastAccessed : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Foundation::HRESULT),
    get_DaysSinceFileLastModified : Proc(IFsrmFileManagementJob*, Int32*, Win32cr::Foundation::HRESULT),
    put_DaysSinceFileLastModified : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Foundation::HRESULT),
    get_PropertyConditions : Proc(IFsrmFileManagementJob*, Void**, Win32cr::Foundation::HRESULT),
    get_FromDate : Proc(IFsrmFileManagementJob*, Float64*, Win32cr::Foundation::HRESULT),
    put_FromDate : Proc(IFsrmFileManagementJob*, Float64, Win32cr::Foundation::HRESULT),
    get_Task : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Task : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmFileManagementJob*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_RunningStatus : Proc(IFsrmFileManagementJob*, Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*, Win32cr::Foundation::HRESULT),
    get_LastError : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LastReportPathWithoutExtension : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_LastRun : Proc(IFsrmFileManagementJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_FileNamePattern : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FileNamePattern : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    run : Proc(IFsrmFileManagementJob*, Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, Win32cr::Foundation::HRESULT),
    wait_for_completion : Proc(IFsrmFileManagementJob*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::HRESULT),
    add_notification : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Foundation::HRESULT),
    delete_notification : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Foundation::HRESULT),
    modify_notification : Proc(IFsrmFileManagementJob*, Int32, Int32, Win32cr::Foundation::HRESULT),
    create_notification_action : Proc(IFsrmFileManagementJob*, Int32, Win32cr::Storage::FileServerResourceManager::FsrmActionType, Void**, Win32cr::Foundation::HRESULT),
    enum_notification_actions : Proc(IFsrmFileManagementJob*, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IFsrmFileManagementJob*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    create_custom_action : Proc(IFsrmFileManagementJob*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0770687e-9f36-4d6f-8778-599d188461c9")]
  record IFsrmFileManagementJob, lpVtbl : IFsrmFileManagementJobVtbl* do
    GUID = LibC::GUID.new(0x770687e_u32, 0x9f36_u16, 0x4d6f_u16, StaticArray[0x87_u8, 0x78_u8, 0x59_u8, 0x9d_u8, 0x18_u8, 0x84_u8, 0x61_u8, 0xc9_u8])
    def query_interface(this : IFsrmFileManagementJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileManagementJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileManagementJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileManagementJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileManagementJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileManagementJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileManagementJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmFileManagementJob*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmFileManagementJob*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmFileManagementJob*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmFileManagementJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmFileManagementJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmFileManagementJob*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmFileManagementJob*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_NamespaceRoots(this : IFsrmFileManagementJob*, namespaceRoots : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NamespaceRoots.call(this, namespaceRoots)
    end
    def put_NamespaceRoots(this : IFsrmFileManagementJob*, namespaceRoots : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NamespaceRoots.call(this, namespaceRoots)
    end
    def get_Enabled(this : IFsrmFileManagementJob*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : IFsrmFileManagementJob*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_OperationType(this : IFsrmFileManagementJob*, operationType : Win32cr::Storage::FileServerResourceManager::FsrmFileManagementType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OperationType.call(this, operationType)
    end
    def put_OperationType(this : IFsrmFileManagementJob*, operationType : Win32cr::Storage::FileServerResourceManager::FsrmFileManagementType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OperationType.call(this, operationType)
    end
    def get_ExpirationDirectory(this : IFsrmFileManagementJob*, expirationDirectory : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExpirationDirectory.call(this, expirationDirectory)
    end
    def put_ExpirationDirectory(this : IFsrmFileManagementJob*, expirationDirectory : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExpirationDirectory.call(this, expirationDirectory)
    end
    def get_CustomAction(this : IFsrmFileManagementJob*, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CustomAction.call(this, action)
    end
    def get_Notifications(this : IFsrmFileManagementJob*, notifications : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Notifications.call(this, notifications)
    end
    def get_Logging(this : IFsrmFileManagementJob*, loggingFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Logging.call(this, loggingFlags)
    end
    def put_Logging(this : IFsrmFileManagementJob*, loggingFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Logging.call(this, loggingFlags)
    end
    def get_ReportEnabled(this : IFsrmFileManagementJob*, reportEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReportEnabled.call(this, reportEnabled)
    end
    def put_ReportEnabled(this : IFsrmFileManagementJob*, reportEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReportEnabled.call(this, reportEnabled)
    end
    def get_Formats(this : IFsrmFileManagementJob*, formats : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Formats.call(this, formats)
    end
    def put_Formats(this : IFsrmFileManagementJob*, formats : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Formats.call(this, formats)
    end
    def get_MailTo(this : IFsrmFileManagementJob*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MailTo.call(this, mailTo)
    end
    def put_MailTo(this : IFsrmFileManagementJob*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MailTo.call(this, mailTo)
    end
    def get_DaysSinceFileCreated(this : IFsrmFileManagementJob*, daysSinceCreation : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysSinceFileCreated.call(this, daysSinceCreation)
    end
    def put_DaysSinceFileCreated(this : IFsrmFileManagementJob*, daysSinceCreation : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysSinceFileCreated.call(this, daysSinceCreation)
    end
    def get_DaysSinceFileLastAccessed(this : IFsrmFileManagementJob*, daysSinceAccess : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysSinceFileLastAccessed.call(this, daysSinceAccess)
    end
    def put_DaysSinceFileLastAccessed(this : IFsrmFileManagementJob*, daysSinceAccess : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysSinceFileLastAccessed.call(this, daysSinceAccess)
    end
    def get_DaysSinceFileLastModified(this : IFsrmFileManagementJob*, daysSinceModify : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DaysSinceFileLastModified.call(this, daysSinceModify)
    end
    def put_DaysSinceFileLastModified(this : IFsrmFileManagementJob*, daysSinceModify : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DaysSinceFileLastModified.call(this, daysSinceModify)
    end
    def get_PropertyConditions(this : IFsrmFileManagementJob*, propertyConditions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyConditions.call(this, propertyConditions)
    end
    def get_FromDate(this : IFsrmFileManagementJob*, fromDate : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FromDate.call(this, fromDate)
    end
    def put_FromDate(this : IFsrmFileManagementJob*, fromDate : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FromDate.call(this, fromDate)
    end
    def get_Task(this : IFsrmFileManagementJob*, taskName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Task.call(this, taskName)
    end
    def put_Task(this : IFsrmFileManagementJob*, taskName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Task.call(this, taskName)
    end
    def get_Parameters(this : IFsrmFileManagementJob*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmFileManagementJob*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end
    def get_RunningStatus(this : IFsrmFileManagementJob*, runningStatus : Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RunningStatus.call(this, runningStatus)
    end
    def get_LastError(this : IFsrmFileManagementJob*, lastError : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastError.call(this, lastError)
    end
    def get_LastReportPathWithoutExtension(this : IFsrmFileManagementJob*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastReportPathWithoutExtension.call(this, path)
    end
    def get_LastRun(this : IFsrmFileManagementJob*, lastRun : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastRun.call(this, lastRun)
    end
    def get_FileNamePattern(this : IFsrmFileManagementJob*, fileNamePattern : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileNamePattern.call(this, fileNamePattern)
    end
    def put_FileNamePattern(this : IFsrmFileManagementJob*, fileNamePattern : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FileNamePattern.call(this, fileNamePattern)
    end
    def run(this : IFsrmFileManagementJob*, context : Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run.call(this, context)
    end
    def wait_for_completion(this : IFsrmFileManagementJob*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_completion.call(this, waitSeconds, completed)
    end
    def cancel(this : IFsrmFileManagementJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def add_notification(this : IFsrmFileManagementJob*, days : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_notification.call(this, days)
    end
    def delete_notification(this : IFsrmFileManagementJob*, days : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_notification.call(this, days)
    end
    def modify_notification(this : IFsrmFileManagementJob*, days : Int32, newDays : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.modify_notification.call(this, days, newDays)
    end
    def create_notification_action(this : IFsrmFileManagementJob*, days : Int32, actionType : Win32cr::Storage::FileServerResourceManager::FsrmActionType, action : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_notification_action.call(this, days, actionType, action)
    end
    def enum_notification_actions(this : IFsrmFileManagementJob*, days : Int32, actions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_notification_actions.call(this, days, actions)
    end
    def create_property_condition(this : IFsrmFileManagementJob*, name : Win32cr::Foundation::BSTR, propertyCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, name, propertyCondition)
    end
    def create_custom_action(this : IFsrmFileManagementJob*, customAction : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_custom_action.call(this, customAction)
    end

  end

  @[Extern]
  record IFsrmPropertyConditionVtbl,
    query_interface : Proc(IFsrmPropertyCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPropertyCondition*, UInt32),
    release : Proc(IFsrmPropertyCondition*, UInt32),
    get_type_info_count : Proc(IFsrmPropertyCondition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPropertyCondition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPropertyCondition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPropertyCondition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPropertyCondition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmPropertyCondition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IFsrmPropertyCondition*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(IFsrmPropertyCondition*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IFsrmPropertyCondition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(IFsrmPropertyCondition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmPropertyCondition*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("326af66f-2ac0-4f68-bf8c-4759f054fa29")]
  record IFsrmPropertyCondition, lpVtbl : IFsrmPropertyConditionVtbl* do
    GUID = LibC::GUID.new(0x326af66f_u32, 0x2ac0_u16, 0x4f68_u16, StaticArray[0xbf_u8, 0x8c_u8, 0x47_u8, 0x59_u8, 0xf0_u8, 0x54_u8, 0xfa_u8, 0x29_u8])
    def query_interface(this : IFsrmPropertyCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPropertyCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPropertyCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPropertyCondition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPropertyCondition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPropertyCondition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPropertyCondition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFsrmPropertyCondition*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmPropertyCondition*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Type(this : IFsrmPropertyCondition*, type__ : Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, type__)
    end
    def put_Type(this : IFsrmPropertyCondition*, type__ : Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, type__)
    end
    def get_Value(this : IFsrmPropertyCondition*, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def put_Value(this : IFsrmPropertyCondition*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, value)
    end
    def delete(this : IFsrmPropertyCondition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IFsrmFileConditionVtbl,
    query_interface : Proc(IFsrmFileCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileCondition*, UInt32),
    release : Proc(IFsrmFileCondition*, UInt32),
    get_type_info_count : Proc(IFsrmFileCondition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileCondition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileCondition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileCondition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IFsrmFileCondition*, Win32cr::Storage::FileServerResourceManager::FsrmFileConditionType*, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileCondition*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70684ffc-691a-4a1a-b922-97752e138cc1")]
  record IFsrmFileCondition, lpVtbl : IFsrmFileConditionVtbl* do
    GUID = LibC::GUID.new(0x70684ffc_u32, 0x691a_u16, 0x4a1a_u16, StaticArray[0xb9_u8, 0x22_u8, 0x97_u8, 0x75_u8, 0x2e_u8, 0x13_u8, 0x8c_u8, 0xc1_u8])
    def query_interface(this : IFsrmFileCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileCondition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileCondition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileCondition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileCondition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IFsrmFileCondition*, pVal : Win32cr::Storage::FileServerResourceManager::FsrmFileConditionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pVal)
    end
    def delete(this : IFsrmFileCondition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IFsrmFileConditionPropertyVtbl,
    query_interface : Proc(IFsrmFileConditionProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmFileConditionProperty*, UInt32),
    release : Proc(IFsrmFileConditionProperty*, UInt32),
    get_type_info_count : Proc(IFsrmFileConditionProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmFileConditionProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmFileConditionProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmFileConditionProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmFileConditionType*, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmFileConditionProperty*, Win32cr::Foundation::HRESULT),
    get_PropertyName : Proc(IFsrmFileConditionProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PropertyName : Proc(IFsrmFileConditionProperty*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PropertyId : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmFileSystemPropertyId*, Win32cr::Foundation::HRESULT),
    put_PropertyId : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmFileSystemPropertyId, Win32cr::Foundation::HRESULT),
    get_Operator : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType*, Win32cr::Foundation::HRESULT),
    put_Operator : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType, Win32cr::Foundation::HRESULT),
    get_ValueType : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyValueType*, Win32cr::Foundation::HRESULT),
    put_ValueType : Proc(IFsrmFileConditionProperty*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyValueType, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IFsrmFileConditionProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(IFsrmFileConditionProperty*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("81926775-b981-4479-988f-da171d627360")]
  record IFsrmFileConditionProperty, lpVtbl : IFsrmFileConditionPropertyVtbl* do
    GUID = LibC::GUID.new(0x81926775_u32, 0xb981_u16, 0x4479_u16, StaticArray[0x98_u8, 0x8f_u8, 0xda_u8, 0x17_u8, 0x1d_u8, 0x62_u8, 0x73_u8, 0x60_u8])
    def query_interface(this : IFsrmFileConditionProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmFileConditionProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmFileConditionProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmFileConditionProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmFileConditionProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmFileConditionProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmFileConditionProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Type(this : IFsrmFileConditionProperty*, pVal : Win32cr::Storage::FileServerResourceManager::FsrmFileConditionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, pVal)
    end
    def delete(this : IFsrmFileConditionProperty*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_PropertyName(this : IFsrmFileConditionProperty*, pVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyName.call(this, pVal)
    end
    def put_PropertyName(this : IFsrmFileConditionProperty*, newVal : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PropertyName.call(this, newVal)
    end
    def get_PropertyId(this : IFsrmFileConditionProperty*, pVal : Win32cr::Storage::FileServerResourceManager::FsrmFileSystemPropertyId*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyId.call(this, pVal)
    end
    def put_PropertyId(this : IFsrmFileConditionProperty*, newVal : Win32cr::Storage::FileServerResourceManager::FsrmFileSystemPropertyId) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PropertyId.call(this, newVal)
    end
    def get_Operator(this : IFsrmFileConditionProperty*, pVal : Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operator.call(this, pVal)
    end
    def put_Operator(this : IFsrmFileConditionProperty*, newVal : Win32cr::Storage::FileServerResourceManager::FsrmPropertyConditionType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Operator.call(this, newVal)
    end
    def get_ValueType(this : IFsrmFileConditionProperty*, pVal : Win32cr::Storage::FileServerResourceManager::FsrmPropertyValueType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueType.call(this, pVal)
    end
    def put_ValueType(this : IFsrmFileConditionProperty*, newVal : Win32cr::Storage::FileServerResourceManager::FsrmPropertyValueType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ValueType.call(this, newVal)
    end
    def get_Value(this : IFsrmFileConditionProperty*, pVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pVal)
    end
    def put_Value(this : IFsrmFileConditionProperty*, newVal : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, newVal)
    end

  end

  @[Extern]
  record IFsrmPropertyDefinitionVtbl,
    query_interface : Proc(IFsrmPropertyDefinition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPropertyDefinition*, UInt32),
    release : Proc(IFsrmPropertyDefinition*, UInt32),
    get_type_info_count : Proc(IFsrmPropertyDefinition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPropertyDefinition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPropertyDefinition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPropertyDefinition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmPropertyDefinition*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmPropertyDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmPropertyDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmPropertyDefinition*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmPropertyDefinition*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPropertyDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmPropertyDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IFsrmPropertyDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(IFsrmPropertyDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType, Win32cr::Foundation::HRESULT),
    get_PossibleValues : Proc(IFsrmPropertyDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_PossibleValues : Proc(IFsrmPropertyDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_ValueDescriptions : Proc(IFsrmPropertyDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ValueDescriptions : Proc(IFsrmPropertyDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmPropertyDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmPropertyDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ede0150f-e9a3-419c-877c-01fe5d24c5d3")]
  record IFsrmPropertyDefinition, lpVtbl : IFsrmPropertyDefinitionVtbl* do
    GUID = LibC::GUID.new(0xede0150f_u32, 0xe9a3_u16, 0x419c_u16, StaticArray[0x87_u8, 0x7c_u8, 0x1_u8, 0xfe_u8, 0x5d_u8, 0x24_u8, 0xc5_u8, 0xd3_u8])
    def query_interface(this : IFsrmPropertyDefinition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPropertyDefinition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPropertyDefinition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPropertyDefinition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPropertyDefinition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPropertyDefinition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPropertyDefinition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmPropertyDefinition*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmPropertyDefinition*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmPropertyDefinition*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmPropertyDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmPropertyDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmPropertyDefinition*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmPropertyDefinition*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Type(this : IFsrmPropertyDefinition*, type__ : Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, type__)
    end
    def put_Type(this : IFsrmPropertyDefinition*, type__ : Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, type__)
    end
    def get_PossibleValues(this : IFsrmPropertyDefinition*, possibleValues : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PossibleValues.call(this, possibleValues)
    end
    def put_PossibleValues(this : IFsrmPropertyDefinition*, possibleValues : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PossibleValues.call(this, possibleValues)
    end
    def get_ValueDescriptions(this : IFsrmPropertyDefinition*, valueDescriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueDescriptions.call(this, valueDescriptions)
    end
    def put_ValueDescriptions(this : IFsrmPropertyDefinition*, valueDescriptions : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ValueDescriptions.call(this, valueDescriptions)
    end
    def get_Parameters(this : IFsrmPropertyDefinition*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmPropertyDefinition*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end

  end

  @[Extern]
  record IFsrmPropertyDefinition2Vtbl,
    query_interface : Proc(IFsrmPropertyDefinition2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPropertyDefinition2*, UInt32),
    release : Proc(IFsrmPropertyDefinition2*, UInt32),
    get_type_info_count : Proc(IFsrmPropertyDefinition2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPropertyDefinition2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPropertyDefinition2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPropertyDefinition2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmPropertyDefinition2*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IFsrmPropertyDefinition2*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType*, Win32cr::Foundation::HRESULT),
    put_Type : Proc(IFsrmPropertyDefinition2*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType, Win32cr::Foundation::HRESULT),
    get_PossibleValues : Proc(IFsrmPropertyDefinition2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_PossibleValues : Proc(IFsrmPropertyDefinition2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_ValueDescriptions : Proc(IFsrmPropertyDefinition2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ValueDescriptions : Proc(IFsrmPropertyDefinition2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmPropertyDefinition2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmPropertyDefinition2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_PropertyDefinitionFlags : Proc(IFsrmPropertyDefinition2*, Int32*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DisplayName : Proc(IFsrmPropertyDefinition2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AppliesTo : Proc(IFsrmPropertyDefinition2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ValueDefinitions : Proc(IFsrmPropertyDefinition2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("47782152-d16c-4229-b4e1-0ddfe308b9f6")]
  record IFsrmPropertyDefinition2, lpVtbl : IFsrmPropertyDefinition2Vtbl* do
    GUID = LibC::GUID.new(0x47782152_u32, 0xd16c_u16, 0x4229_u16, StaticArray[0xb4_u8, 0xe1_u8, 0xd_u8, 0xdf_u8, 0xe3_u8, 0x8_u8, 0xb9_u8, 0xf6_u8])
    def query_interface(this : IFsrmPropertyDefinition2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPropertyDefinition2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPropertyDefinition2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPropertyDefinition2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPropertyDefinition2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPropertyDefinition2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPropertyDefinition2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmPropertyDefinition2*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmPropertyDefinition2*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmPropertyDefinition2*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmPropertyDefinition2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmPropertyDefinition2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmPropertyDefinition2*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmPropertyDefinition2*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Type(this : IFsrmPropertyDefinition2*, type__ : Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, type__)
    end
    def put_Type(this : IFsrmPropertyDefinition2*, type__ : Win32cr::Storage::FileServerResourceManager::FsrmPropertyDefinitionType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Type.call(this, type__)
    end
    def get_PossibleValues(this : IFsrmPropertyDefinition2*, possibleValues : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PossibleValues.call(this, possibleValues)
    end
    def put_PossibleValues(this : IFsrmPropertyDefinition2*, possibleValues : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PossibleValues.call(this, possibleValues)
    end
    def get_ValueDescriptions(this : IFsrmPropertyDefinition2*, valueDescriptions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueDescriptions.call(this, valueDescriptions)
    end
    def put_ValueDescriptions(this : IFsrmPropertyDefinition2*, valueDescriptions : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ValueDescriptions.call(this, valueDescriptions)
    end
    def get_Parameters(this : IFsrmPropertyDefinition2*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmPropertyDefinition2*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end
    def get_PropertyDefinitionFlags(this : IFsrmPropertyDefinition2*, propertyDefinitionFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyDefinitionFlags.call(this, propertyDefinitionFlags)
    end
    def get_DisplayName(this : IFsrmPropertyDefinition2*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, name)
    end
    def put_DisplayName(this : IFsrmPropertyDefinition2*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DisplayName.call(this, name)
    end
    def get_AppliesTo(this : IFsrmPropertyDefinition2*, appliesTo : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AppliesTo.call(this, appliesTo)
    end
    def get_ValueDefinitions(this : IFsrmPropertyDefinition2*, valueDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ValueDefinitions.call(this, valueDefinitions)
    end

  end

  @[Extern]
  record IFsrmPropertyDefinitionValueVtbl,
    query_interface : Proc(IFsrmPropertyDefinitionValue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPropertyDefinitionValue*, UInt32),
    release : Proc(IFsrmPropertyDefinitionValue*, UInt32),
    get_type_info_count : Proc(IFsrmPropertyDefinitionValue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPropertyDefinitionValue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPropertyDefinitionValue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPropertyDefinitionValue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPropertyDefinitionValue*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DisplayName : Proc(IFsrmPropertyDefinitionValue*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmPropertyDefinitionValue*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UniqueID : Proc(IFsrmPropertyDefinitionValue*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e946d148-bd67-4178-8e22-1c44925ed710")]
  record IFsrmPropertyDefinitionValue, lpVtbl : IFsrmPropertyDefinitionValueVtbl* do
    GUID = LibC::GUID.new(0xe946d148_u32, 0xbd67_u16, 0x4178_u16, StaticArray[0x8e_u8, 0x22_u8, 0x1c_u8, 0x44_u8, 0x92_u8, 0x5e_u8, 0xd7_u8, 0x10_u8])
    def query_interface(this : IFsrmPropertyDefinitionValue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPropertyDefinitionValue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPropertyDefinitionValue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPropertyDefinitionValue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPropertyDefinitionValue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPropertyDefinitionValue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPropertyDefinitionValue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFsrmPropertyDefinitionValue*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_DisplayName(this : IFsrmPropertyDefinitionValue*, displayName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DisplayName.call(this, displayName)
    end
    def get_Description(this : IFsrmPropertyDefinitionValue*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def get_UniqueID(this : IFsrmPropertyDefinitionValue*, uniqueID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UniqueID.call(this, uniqueID)
    end

  end

  @[Extern]
  record IFsrmPropertyVtbl,
    query_interface : Proc(IFsrmProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmProperty*, UInt32),
    release : Proc(IFsrmProperty*, UInt32),
    get_type_info_count : Proc(IFsrmProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IFsrmProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Sources : Proc(IFsrmProperty*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_PropertyFlags : Proc(IFsrmProperty*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4a73fee4-4102-4fcc-9ffb-38614f9ee768")]
  record IFsrmProperty, lpVtbl : IFsrmPropertyVtbl* do
    GUID = LibC::GUID.new(0x4a73fee4_u32, 0x4102_u16, 0x4fcc_u16, StaticArray[0x9f_u8, 0xfb_u8, 0x38_u8, 0x61_u8, 0x4f_u8, 0x9e_u8, 0xe7_u8, 0x68_u8])
    def query_interface(this : IFsrmProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFsrmProperty*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Value(this : IFsrmProperty*, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def get_Sources(this : IFsrmProperty*, sources : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sources.call(this, sources)
    end
    def get_PropertyFlags(this : IFsrmProperty*, flags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyFlags.call(this, flags)
    end

  end

  @[Extern]
  record IFsrmRuleVtbl,
    query_interface : Proc(IFsrmRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmRule*, UInt32),
    release : Proc(IFsrmRule*, UInt32),
    get_type_info_count : Proc(IFsrmRule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmRule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmRule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmRule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmRule*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmRule*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmRule*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RuleType : Proc(IFsrmRule*, Win32cr::Storage::FileServerResourceManager::FsrmRuleType*, Win32cr::Foundation::HRESULT),
    get_ModuleDefinitionName : Proc(IFsrmRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ModuleDefinitionName : Proc(IFsrmRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_NamespaceRoots : Proc(IFsrmRule*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_NamespaceRoots : Proc(IFsrmRule*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_RuleFlags : Proc(IFsrmRule*, Int32*, Win32cr::Foundation::HRESULT),
    put_RuleFlags : Proc(IFsrmRule*, Int32, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmRule*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmRule*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_LastModified : Proc(IFsrmRule*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cb0df960-16f5-4495-9079-3f9360d831df")]
  record IFsrmRule, lpVtbl : IFsrmRuleVtbl* do
    GUID = LibC::GUID.new(0xcb0df960_u32, 0x16f5_u16, 0x4495_u16, StaticArray[0x90_u8, 0x79_u8, 0x3f_u8, 0x93_u8, 0x60_u8, 0xd8_u8, 0x31_u8, 0xdf_u8])
    def query_interface(this : IFsrmRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmRule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmRule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmRule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmRule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmRule*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmRule*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmRule*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmRule*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmRule*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_RuleType(this : IFsrmRule*, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RuleType.call(this, ruleType)
    end
    def get_ModuleDefinitionName(this : IFsrmRule*, moduleDefinitionName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleDefinitionName.call(this, moduleDefinitionName)
    end
    def put_ModuleDefinitionName(this : IFsrmRule*, moduleDefinitionName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ModuleDefinitionName.call(this, moduleDefinitionName)
    end
    def get_NamespaceRoots(this : IFsrmRule*, namespaceRoots : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NamespaceRoots.call(this, namespaceRoots)
    end
    def put_NamespaceRoots(this : IFsrmRule*, namespaceRoots : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NamespaceRoots.call(this, namespaceRoots)
    end
    def get_RuleFlags(this : IFsrmRule*, ruleFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RuleFlags.call(this, ruleFlags)
    end
    def put_RuleFlags(this : IFsrmRule*, ruleFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RuleFlags.call(this, ruleFlags)
    end
    def get_Parameters(this : IFsrmRule*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmRule*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end
    def get_LastModified(this : IFsrmRule*, lastModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastModified.call(this, lastModified)
    end

  end

  @[Extern]
  record IFsrmClassificationRuleVtbl,
    query_interface : Proc(IFsrmClassificationRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmClassificationRule*, UInt32),
    release : Proc(IFsrmClassificationRule*, UInt32),
    get_type_info_count : Proc(IFsrmClassificationRule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmClassificationRule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmClassificationRule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmClassificationRule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmClassificationRule*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmClassificationRule*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmClassificationRule*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RuleType : Proc(IFsrmClassificationRule*, Win32cr::Storage::FileServerResourceManager::FsrmRuleType*, Win32cr::Foundation::HRESULT),
    get_ModuleDefinitionName : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ModuleDefinitionName : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_NamespaceRoots : Proc(IFsrmClassificationRule*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_NamespaceRoots : Proc(IFsrmClassificationRule*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_RuleFlags : Proc(IFsrmClassificationRule*, Int32*, Win32cr::Foundation::HRESULT),
    put_RuleFlags : Proc(IFsrmClassificationRule*, Int32, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmClassificationRule*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmClassificationRule*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_LastModified : Proc(IFsrmClassificationRule*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ExecutionOption : Proc(IFsrmClassificationRule*, Win32cr::Storage::FileServerResourceManager::FsrmExecutionOption*, Win32cr::Foundation::HRESULT),
    put_ExecutionOption : Proc(IFsrmClassificationRule*, Win32cr::Storage::FileServerResourceManager::FsrmExecutionOption, Win32cr::Foundation::HRESULT),
    get_PropertyAffected : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PropertyAffected : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(IFsrmClassificationRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("afc052c2-5315-45ab-841b-c6db0e120148")]
  record IFsrmClassificationRule, lpVtbl : IFsrmClassificationRuleVtbl* do
    GUID = LibC::GUID.new(0xafc052c2_u32, 0x5315_u16, 0x45ab_u16, StaticArray[0x84_u8, 0x1b_u8, 0xc6_u8, 0xdb_u8, 0xe_u8, 0x12_u8, 0x1_u8, 0x48_u8])
    def query_interface(this : IFsrmClassificationRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmClassificationRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmClassificationRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmClassificationRule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmClassificationRule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmClassificationRule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmClassificationRule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmClassificationRule*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmClassificationRule*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmClassificationRule*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmClassificationRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmClassificationRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_Name(this : IFsrmClassificationRule*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmClassificationRule*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_RuleType(this : IFsrmClassificationRule*, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RuleType.call(this, ruleType)
    end
    def get_ModuleDefinitionName(this : IFsrmClassificationRule*, moduleDefinitionName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleDefinitionName.call(this, moduleDefinitionName)
    end
    def put_ModuleDefinitionName(this : IFsrmClassificationRule*, moduleDefinitionName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ModuleDefinitionName.call(this, moduleDefinitionName)
    end
    def get_NamespaceRoots(this : IFsrmClassificationRule*, namespaceRoots : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NamespaceRoots.call(this, namespaceRoots)
    end
    def put_NamespaceRoots(this : IFsrmClassificationRule*, namespaceRoots : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NamespaceRoots.call(this, namespaceRoots)
    end
    def get_RuleFlags(this : IFsrmClassificationRule*, ruleFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RuleFlags.call(this, ruleFlags)
    end
    def put_RuleFlags(this : IFsrmClassificationRule*, ruleFlags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RuleFlags.call(this, ruleFlags)
    end
    def get_Parameters(this : IFsrmClassificationRule*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmClassificationRule*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end
    def get_LastModified(this : IFsrmClassificationRule*, lastModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastModified.call(this, lastModified)
    end
    def get_ExecutionOption(this : IFsrmClassificationRule*, executionOption : Win32cr::Storage::FileServerResourceManager::FsrmExecutionOption*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExecutionOption.call(this, executionOption)
    end
    def put_ExecutionOption(this : IFsrmClassificationRule*, executionOption : Win32cr::Storage::FileServerResourceManager::FsrmExecutionOption) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ExecutionOption.call(this, executionOption)
    end
    def get_PropertyAffected(this : IFsrmClassificationRule*, property : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyAffected.call(this, property)
    end
    def put_PropertyAffected(this : IFsrmClassificationRule*, property : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PropertyAffected.call(this, property)
    end
    def get_Value(this : IFsrmClassificationRule*, value : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end
    def put_Value(this : IFsrmClassificationRule*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, value)
    end

  end

  @[Extern]
  record IFsrmPipelineModuleDefinitionVtbl,
    query_interface : Proc(IFsrmPipelineModuleDefinition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPipelineModuleDefinition*, UInt32),
    release : Proc(IFsrmPipelineModuleDefinition*, UInt32),
    get_type_info_count : Proc(IFsrmPipelineModuleDefinition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPipelineModuleDefinition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPipelineModuleDefinition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPipelineModuleDefinition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmPipelineModuleDefinition*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::HRESULT),
    get_ModuleClsid : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ModuleClsid : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Company : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Company : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ModuleType : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IFsrmPipelineModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IFsrmPipelineModuleDefinition*, Int16, Win32cr::Foundation::HRESULT),
    get_NeedsFileContent : Proc(IFsrmPipelineModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_NeedsFileContent : Proc(IFsrmPipelineModuleDefinition*, Int16, Win32cr::Foundation::HRESULT),
    get_Account : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType*, Win32cr::Foundation::HRESULT),
    put_Account : Proc(IFsrmPipelineModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType, Win32cr::Foundation::HRESULT),
    get_SupportedExtensions : Proc(IFsrmPipelineModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_SupportedExtensions : Proc(IFsrmPipelineModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmPipelineModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmPipelineModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("515c1277-2c81-440e-8fcf-367921ed4f59")]
  record IFsrmPipelineModuleDefinition, lpVtbl : IFsrmPipelineModuleDefinitionVtbl* do
    GUID = LibC::GUID.new(0x515c1277_u32, 0x2c81_u16, 0x440e_u16, StaticArray[0x8f_u8, 0xcf_u8, 0x36_u8, 0x79_u8, 0x21_u8, 0xed_u8, 0x4f_u8, 0x59_u8])
    def query_interface(this : IFsrmPipelineModuleDefinition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPipelineModuleDefinition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPipelineModuleDefinition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPipelineModuleDefinition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPipelineModuleDefinition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPipelineModuleDefinition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPipelineModuleDefinition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmPipelineModuleDefinition*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmPipelineModuleDefinition*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmPipelineModuleDefinition*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmPipelineModuleDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmPipelineModuleDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_ModuleClsid(this : IFsrmPipelineModuleDefinition*, moduleClsid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleClsid.call(this, moduleClsid)
    end
    def put_ModuleClsid(this : IFsrmPipelineModuleDefinition*, moduleClsid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ModuleClsid.call(this, moduleClsid)
    end
    def get_Name(this : IFsrmPipelineModuleDefinition*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmPipelineModuleDefinition*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Company(this : IFsrmPipelineModuleDefinition*, company : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Company.call(this, company)
    end
    def put_Company(this : IFsrmPipelineModuleDefinition*, company : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Company.call(this, company)
    end
    def get_Version(this : IFsrmPipelineModuleDefinition*, version : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, version)
    end
    def put_Version(this : IFsrmPipelineModuleDefinition*, version : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, version)
    end
    def get_ModuleType(this : IFsrmPipelineModuleDefinition*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleType.call(this, moduleType)
    end
    def get_Enabled(this : IFsrmPipelineModuleDefinition*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : IFsrmPipelineModuleDefinition*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_NeedsFileContent(this : IFsrmPipelineModuleDefinition*, needsFileContent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NeedsFileContent.call(this, needsFileContent)
    end
    def put_NeedsFileContent(this : IFsrmPipelineModuleDefinition*, needsFileContent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NeedsFileContent.call(this, needsFileContent)
    end
    def get_Account(this : IFsrmPipelineModuleDefinition*, retrievalAccount : Win32cr::Storage::FileServerResourceManager::FsrmAccountType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Account.call(this, retrievalAccount)
    end
    def put_Account(this : IFsrmPipelineModuleDefinition*, retrievalAccount : Win32cr::Storage::FileServerResourceManager::FsrmAccountType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Account.call(this, retrievalAccount)
    end
    def get_SupportedExtensions(this : IFsrmPipelineModuleDefinition*, supportedExtensions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedExtensions.call(this, supportedExtensions)
    end
    def put_SupportedExtensions(this : IFsrmPipelineModuleDefinition*, supportedExtensions : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportedExtensions.call(this, supportedExtensions)
    end
    def get_Parameters(this : IFsrmPipelineModuleDefinition*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmPipelineModuleDefinition*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end

  end

  @[Extern]
  record IFsrmClassifierModuleDefinitionVtbl,
    query_interface : Proc(IFsrmClassifierModuleDefinition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmClassifierModuleDefinition*, UInt32),
    release : Proc(IFsrmClassifierModuleDefinition*, UInt32),
    get_type_info_count : Proc(IFsrmClassifierModuleDefinition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmClassifierModuleDefinition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmClassifierModuleDefinition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmClassifierModuleDefinition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmClassifierModuleDefinition*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::HRESULT),
    get_ModuleClsid : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ModuleClsid : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Company : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Company : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ModuleType : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IFsrmClassifierModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IFsrmClassifierModuleDefinition*, Int16, Win32cr::Foundation::HRESULT),
    get_NeedsFileContent : Proc(IFsrmClassifierModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_NeedsFileContent : Proc(IFsrmClassifierModuleDefinition*, Int16, Win32cr::Foundation::HRESULT),
    get_Account : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType*, Win32cr::Foundation::HRESULT),
    put_Account : Proc(IFsrmClassifierModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType, Win32cr::Foundation::HRESULT),
    get_SupportedExtensions : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_SupportedExtensions : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_PropertiesAffected : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_PropertiesAffected : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_PropertiesUsed : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_PropertiesUsed : Proc(IFsrmClassifierModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_NeedsExplicitValue : Proc(IFsrmClassifierModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_NeedsExplicitValue : Proc(IFsrmClassifierModuleDefinition*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bb36ea26-6318-4b8c-8592-f72dd602e7a5")]
  record IFsrmClassifierModuleDefinition, lpVtbl : IFsrmClassifierModuleDefinitionVtbl* do
    GUID = LibC::GUID.new(0xbb36ea26_u32, 0x6318_u16, 0x4b8c_u16, StaticArray[0x85_u8, 0x92_u8, 0xf7_u8, 0x2d_u8, 0xd6_u8, 0x2_u8, 0xe7_u8, 0xa5_u8])
    def query_interface(this : IFsrmClassifierModuleDefinition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmClassifierModuleDefinition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmClassifierModuleDefinition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmClassifierModuleDefinition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmClassifierModuleDefinition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmClassifierModuleDefinition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmClassifierModuleDefinition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmClassifierModuleDefinition*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmClassifierModuleDefinition*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmClassifierModuleDefinition*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmClassifierModuleDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmClassifierModuleDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_ModuleClsid(this : IFsrmClassifierModuleDefinition*, moduleClsid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleClsid.call(this, moduleClsid)
    end
    def put_ModuleClsid(this : IFsrmClassifierModuleDefinition*, moduleClsid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ModuleClsid.call(this, moduleClsid)
    end
    def get_Name(this : IFsrmClassifierModuleDefinition*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmClassifierModuleDefinition*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Company(this : IFsrmClassifierModuleDefinition*, company : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Company.call(this, company)
    end
    def put_Company(this : IFsrmClassifierModuleDefinition*, company : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Company.call(this, company)
    end
    def get_Version(this : IFsrmClassifierModuleDefinition*, version : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, version)
    end
    def put_Version(this : IFsrmClassifierModuleDefinition*, version : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, version)
    end
    def get_ModuleType(this : IFsrmClassifierModuleDefinition*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleType.call(this, moduleType)
    end
    def get_Enabled(this : IFsrmClassifierModuleDefinition*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : IFsrmClassifierModuleDefinition*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_NeedsFileContent(this : IFsrmClassifierModuleDefinition*, needsFileContent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NeedsFileContent.call(this, needsFileContent)
    end
    def put_NeedsFileContent(this : IFsrmClassifierModuleDefinition*, needsFileContent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NeedsFileContent.call(this, needsFileContent)
    end
    def get_Account(this : IFsrmClassifierModuleDefinition*, retrievalAccount : Win32cr::Storage::FileServerResourceManager::FsrmAccountType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Account.call(this, retrievalAccount)
    end
    def put_Account(this : IFsrmClassifierModuleDefinition*, retrievalAccount : Win32cr::Storage::FileServerResourceManager::FsrmAccountType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Account.call(this, retrievalAccount)
    end
    def get_SupportedExtensions(this : IFsrmClassifierModuleDefinition*, supportedExtensions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedExtensions.call(this, supportedExtensions)
    end
    def put_SupportedExtensions(this : IFsrmClassifierModuleDefinition*, supportedExtensions : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportedExtensions.call(this, supportedExtensions)
    end
    def get_Parameters(this : IFsrmClassifierModuleDefinition*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmClassifierModuleDefinition*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end
    def get_PropertiesAffected(this : IFsrmClassifierModuleDefinition*, propertiesAffected : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertiesAffected.call(this, propertiesAffected)
    end
    def put_PropertiesAffected(this : IFsrmClassifierModuleDefinition*, propertiesAffected : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PropertiesAffected.call(this, propertiesAffected)
    end
    def get_PropertiesUsed(this : IFsrmClassifierModuleDefinition*, propertiesUsed : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertiesUsed.call(this, propertiesUsed)
    end
    def put_PropertiesUsed(this : IFsrmClassifierModuleDefinition*, propertiesUsed : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PropertiesUsed.call(this, propertiesUsed)
    end
    def get_NeedsExplicitValue(this : IFsrmClassifierModuleDefinition*, needsExplicitValue : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NeedsExplicitValue.call(this, needsExplicitValue)
    end
    def put_NeedsExplicitValue(this : IFsrmClassifierModuleDefinition*, needsExplicitValue : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NeedsExplicitValue.call(this, needsExplicitValue)
    end

  end

  @[Extern]
  record IFsrmStorageModuleDefinitionVtbl,
    query_interface : Proc(IFsrmStorageModuleDefinition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmStorageModuleDefinition*, UInt32),
    release : Proc(IFsrmStorageModuleDefinition*, UInt32),
    get_type_info_count : Proc(IFsrmStorageModuleDefinition*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmStorageModuleDefinition*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmStorageModuleDefinition*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmStorageModuleDefinition*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFsrmStorageModuleDefinition*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::HRESULT),
    commit : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::HRESULT),
    get_ModuleClsid : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ModuleClsid : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Company : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Company : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Version : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Version : Proc(IFsrmStorageModuleDefinition*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ModuleType : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType*, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IFsrmStorageModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IFsrmStorageModuleDefinition*, Int16, Win32cr::Foundation::HRESULT),
    get_NeedsFileContent : Proc(IFsrmStorageModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_NeedsFileContent : Proc(IFsrmStorageModuleDefinition*, Int16, Win32cr::Foundation::HRESULT),
    get_Account : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType*, Win32cr::Foundation::HRESULT),
    put_Account : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmAccountType, Win32cr::Foundation::HRESULT),
    get_SupportedExtensions : Proc(IFsrmStorageModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_SupportedExtensions : Proc(IFsrmStorageModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Parameters : Proc(IFsrmStorageModuleDefinition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_Parameters : Proc(IFsrmStorageModuleDefinition*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Capabilities : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleCaps*, Win32cr::Foundation::HRESULT),
    put_Capabilities : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleCaps, Win32cr::Foundation::HRESULT),
    get_StorageType : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleType*, Win32cr::Foundation::HRESULT),
    put_StorageType : Proc(IFsrmStorageModuleDefinition*, Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleType, Win32cr::Foundation::HRESULT),
    get_UpdatesFileContent : Proc(IFsrmStorageModuleDefinition*, Int16*, Win32cr::Foundation::HRESULT),
    put_UpdatesFileContent : Proc(IFsrmStorageModuleDefinition*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("15a81350-497d-4aba-80e9-d4dbcc5521fe")]
  record IFsrmStorageModuleDefinition, lpVtbl : IFsrmStorageModuleDefinitionVtbl* do
    GUID = LibC::GUID.new(0x15a81350_u32, 0x497d_u16, 0x4aba_u16, StaticArray[0x80_u8, 0xe9_u8, 0xd4_u8, 0xdb_u8, 0xcc_u8, 0x55_u8, 0x21_u8, 0xfe_u8])
    def query_interface(this : IFsrmStorageModuleDefinition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmStorageModuleDefinition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmStorageModuleDefinition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmStorageModuleDefinition*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmStorageModuleDefinition*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmStorageModuleDefinition*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmStorageModuleDefinition*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFsrmStorageModuleDefinition*, id : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, id)
    end
    def get_Description(this : IFsrmStorageModuleDefinition*, description : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, description)
    end
    def put_Description(this : IFsrmStorageModuleDefinition*, description : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, description)
    end
    def delete(this : IFsrmStorageModuleDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def commit(this : IFsrmStorageModuleDefinition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def get_ModuleClsid(this : IFsrmStorageModuleDefinition*, moduleClsid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleClsid.call(this, moduleClsid)
    end
    def put_ModuleClsid(this : IFsrmStorageModuleDefinition*, moduleClsid : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ModuleClsid.call(this, moduleClsid)
    end
    def get_Name(this : IFsrmStorageModuleDefinition*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def put_Name(this : IFsrmStorageModuleDefinition*, name : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, name)
    end
    def get_Company(this : IFsrmStorageModuleDefinition*, company : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Company.call(this, company)
    end
    def put_Company(this : IFsrmStorageModuleDefinition*, company : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Company.call(this, company)
    end
    def get_Version(this : IFsrmStorageModuleDefinition*, version : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Version.call(this, version)
    end
    def put_Version(this : IFsrmStorageModuleDefinition*, version : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Version.call(this, version)
    end
    def get_ModuleType(this : IFsrmStorageModuleDefinition*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleType.call(this, moduleType)
    end
    def get_Enabled(this : IFsrmStorageModuleDefinition*, enabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, enabled)
    end
    def put_Enabled(this : IFsrmStorageModuleDefinition*, enabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, enabled)
    end
    def get_NeedsFileContent(this : IFsrmStorageModuleDefinition*, needsFileContent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NeedsFileContent.call(this, needsFileContent)
    end
    def put_NeedsFileContent(this : IFsrmStorageModuleDefinition*, needsFileContent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NeedsFileContent.call(this, needsFileContent)
    end
    def get_Account(this : IFsrmStorageModuleDefinition*, retrievalAccount : Win32cr::Storage::FileServerResourceManager::FsrmAccountType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Account.call(this, retrievalAccount)
    end
    def put_Account(this : IFsrmStorageModuleDefinition*, retrievalAccount : Win32cr::Storage::FileServerResourceManager::FsrmAccountType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Account.call(this, retrievalAccount)
    end
    def get_SupportedExtensions(this : IFsrmStorageModuleDefinition*, supportedExtensions : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedExtensions.call(this, supportedExtensions)
    end
    def put_SupportedExtensions(this : IFsrmStorageModuleDefinition*, supportedExtensions : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SupportedExtensions.call(this, supportedExtensions)
    end
    def get_Parameters(this : IFsrmStorageModuleDefinition*, parameters : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parameters.call(this, parameters)
    end
    def put_Parameters(this : IFsrmStorageModuleDefinition*, parameters : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Parameters.call(this, parameters)
    end
    def get_Capabilities(this : IFsrmStorageModuleDefinition*, capabilities : Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleCaps*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Capabilities.call(this, capabilities)
    end
    def put_Capabilities(this : IFsrmStorageModuleDefinition*, capabilities : Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleCaps) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Capabilities.call(this, capabilities)
    end
    def get_StorageType(this : IFsrmStorageModuleDefinition*, storageType : Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StorageType.call(this, storageType)
    end
    def put_StorageType(this : IFsrmStorageModuleDefinition*, storageType : Win32cr::Storage::FileServerResourceManager::FsrmStorageModuleType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StorageType.call(this, storageType)
    end
    def get_UpdatesFileContent(this : IFsrmStorageModuleDefinition*, updatesFileContent : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdatesFileContent.call(this, updatesFileContent)
    end
    def put_UpdatesFileContent(this : IFsrmStorageModuleDefinition*, updatesFileContent : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UpdatesFileContent.call(this, updatesFileContent)
    end

  end

  @[Extern]
  record IFsrmClassificationManagerVtbl,
    query_interface : Proc(IFsrmClassificationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmClassificationManager*, UInt32),
    release : Proc(IFsrmClassificationManager*, UInt32),
    get_type_info_count : Proc(IFsrmClassificationManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmClassificationManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmClassificationManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmClassificationManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClassificationReportFormats : Proc(IFsrmClassificationManager*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ClassificationReportFormats : Proc(IFsrmClassificationManager*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Logging : Proc(IFsrmClassificationManager*, Int32*, Win32cr::Foundation::HRESULT),
    put_Logging : Proc(IFsrmClassificationManager*, Int32, Win32cr::Foundation::HRESULT),
    get_ClassificationReportMailTo : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClassificationReportMailTo : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ClassificationReportEnabled : Proc(IFsrmClassificationManager*, Int16*, Win32cr::Foundation::HRESULT),
    put_ClassificationReportEnabled : Proc(IFsrmClassificationManager*, Int16, Win32cr::Foundation::HRESULT),
    get_ClassificationLastReportPathWithoutExtension : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClassificationLastError : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClassificationRunningStatus : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*, Win32cr::Foundation::HRESULT),
    enum_property_definitions : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_property_definition : Proc(IFsrmClassificationManager*, Void**, Win32cr::Foundation::HRESULT),
    get_property_definition : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_rules : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmRuleType, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_rule : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmRuleType, Void**, Win32cr::Foundation::HRESULT),
    get_rule : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmRuleType, Void**, Win32cr::Foundation::HRESULT),
    enum_module_definitions : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_module_definition : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, Void**, Win32cr::Foundation::HRESULT),
    get_module_definition : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, Void**, Win32cr::Foundation::HRESULT),
    run_classification : Proc(IFsrmClassificationManager*, Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    wait_for_classification_completion : Proc(IFsrmClassificationManager*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    cancel_classification : Proc(IFsrmClassificationManager*, Win32cr::Foundation::HRESULT),
    enum_file_properties : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, Void**, Win32cr::Foundation::HRESULT),
    get_file_property : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, Void**, Win32cr::Foundation::HRESULT),
    set_file_property : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    clear_file_property : Proc(IFsrmClassificationManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d2dc89da-ee91-48a0-85d8-cc72a56f7d04")]
  record IFsrmClassificationManager, lpVtbl : IFsrmClassificationManagerVtbl* do
    GUID = LibC::GUID.new(0xd2dc89da_u32, 0xee91_u16, 0x48a0_u16, StaticArray[0x85_u8, 0xd8_u8, 0xcc_u8, 0x72_u8, 0xa5_u8, 0x6f_u8, 0x7d_u8, 0x4_u8])
    def query_interface(this : IFsrmClassificationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmClassificationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmClassificationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmClassificationManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmClassificationManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmClassificationManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmClassificationManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClassificationReportFormats(this : IFsrmClassificationManager*, formats : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationReportFormats.call(this, formats)
    end
    def put_ClassificationReportFormats(this : IFsrmClassificationManager*, formats : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassificationReportFormats.call(this, formats)
    end
    def get_Logging(this : IFsrmClassificationManager*, logging : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Logging.call(this, logging)
    end
    def put_Logging(this : IFsrmClassificationManager*, logging : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Logging.call(this, logging)
    end
    def get_ClassificationReportMailTo(this : IFsrmClassificationManager*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationReportMailTo.call(this, mailTo)
    end
    def put_ClassificationReportMailTo(this : IFsrmClassificationManager*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassificationReportMailTo.call(this, mailTo)
    end
    def get_ClassificationReportEnabled(this : IFsrmClassificationManager*, reportEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationReportEnabled.call(this, reportEnabled)
    end
    def put_ClassificationReportEnabled(this : IFsrmClassificationManager*, reportEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassificationReportEnabled.call(this, reportEnabled)
    end
    def get_ClassificationLastReportPathWithoutExtension(this : IFsrmClassificationManager*, lastReportPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationLastReportPathWithoutExtension.call(this, lastReportPath)
    end
    def get_ClassificationLastError(this : IFsrmClassificationManager*, lastError : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationLastError.call(this, lastError)
    end
    def get_ClassificationRunningStatus(this : IFsrmClassificationManager*, runningStatus : Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationRunningStatus.call(this, runningStatus)
    end
    def enum_property_definitions(this : IFsrmClassificationManager*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, propertyDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_property_definitions.call(this, options, propertyDefinitions)
    end
    def create_property_definition(this : IFsrmClassificationManager*, propertyDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_definition.call(this, propertyDefinition)
    end
    def get_property_definition(this : IFsrmClassificationManager*, propertyName : Win32cr::Foundation::BSTR, propertyDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_definition.call(this, propertyName, propertyDefinition)
    end
    def enum_rules(this : IFsrmClassificationManager*, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, rules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_rules.call(this, ruleType, options, rules)
    end
    def create_rule(this : IFsrmClassificationManager*, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rule.call(this, ruleType, rule)
    end
    def get_rule(this : IFsrmClassificationManager*, ruleName : Win32cr::Foundation::BSTR, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rule.call(this, ruleName, ruleType, rule)
    end
    def enum_module_definitions(this : IFsrmClassificationManager*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, moduleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_definitions.call(this, moduleType, options, moduleDefinitions)
    end
    def create_module_definition(this : IFsrmClassificationManager*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, moduleDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_module_definition.call(this, moduleType, moduleDefinition)
    end
    def get_module_definition(this : IFsrmClassificationManager*, moduleName : Win32cr::Foundation::BSTR, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, moduleDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_definition.call(this, moduleName, moduleType, moduleDefinition)
    end
    def run_classification(this : IFsrmClassificationManager*, context : Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, reserved : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_classification.call(this, context, reserved)
    end
    def wait_for_classification_completion(this : IFsrmClassificationManager*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_classification_completion.call(this, waitSeconds, completed)
    end
    def cancel_classification(this : IFsrmClassificationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_classification.call(this)
    end
    def enum_file_properties(this : IFsrmClassificationManager*, filePath : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, fileProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_file_properties.call(this, filePath, options, fileProperties)
    end
    def get_file_property(this : IFsrmClassificationManager*, filePath : Win32cr::Foundation::BSTR, propertyName : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_property.call(this, filePath, propertyName, options, property)
    end
    def set_file_property(this : IFsrmClassificationManager*, filePath : Win32cr::Foundation::BSTR, propertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_property.call(this, filePath, propertyName, propertyValue)
    end
    def clear_file_property(this : IFsrmClassificationManager*, filePath : Win32cr::Foundation::BSTR, property : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_file_property.call(this, filePath, property)
    end

  end

  @[Extern]
  record IFsrmClassificationManager2Vtbl,
    query_interface : Proc(IFsrmClassificationManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmClassificationManager2*, UInt32),
    release : Proc(IFsrmClassificationManager2*, UInt32),
    get_type_info_count : Proc(IFsrmClassificationManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmClassificationManager2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmClassificationManager2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmClassificationManager2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClassificationReportFormats : Proc(IFsrmClassificationManager2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    put_ClassificationReportFormats : Proc(IFsrmClassificationManager2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_Logging : Proc(IFsrmClassificationManager2*, Int32*, Win32cr::Foundation::HRESULT),
    put_Logging : Proc(IFsrmClassificationManager2*, Int32, Win32cr::Foundation::HRESULT),
    get_ClassificationReportMailTo : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClassificationReportMailTo : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ClassificationReportEnabled : Proc(IFsrmClassificationManager2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ClassificationReportEnabled : Proc(IFsrmClassificationManager2*, Int16, Win32cr::Foundation::HRESULT),
    get_ClassificationLastReportPathWithoutExtension : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClassificationLastError : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ClassificationRunningStatus : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*, Win32cr::Foundation::HRESULT),
    enum_property_definitions : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_property_definition : Proc(IFsrmClassificationManager2*, Void**, Win32cr::Foundation::HRESULT),
    get_property_definition : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    enum_rules : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmRuleType, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_rule : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmRuleType, Void**, Win32cr::Foundation::HRESULT),
    get_rule : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmRuleType, Void**, Win32cr::Foundation::HRESULT),
    enum_module_definitions : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, Void**, Win32cr::Foundation::HRESULT),
    create_module_definition : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, Void**, Win32cr::Foundation::HRESULT),
    get_module_definition : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, Void**, Win32cr::Foundation::HRESULT),
    run_classification : Proc(IFsrmClassificationManager2*, Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    wait_for_classification_completion : Proc(IFsrmClassificationManager2*, Int32, Int16*, Win32cr::Foundation::HRESULT),
    cancel_classification : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::HRESULT),
    enum_file_properties : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, Void**, Win32cr::Foundation::HRESULT),
    get_file_property : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, Void**, Win32cr::Foundation::HRESULT),
    set_file_property : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    clear_file_property : Proc(IFsrmClassificationManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    classify_files : Proc(IFsrmClassificationManager2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0004c1c9-127e-4765-ba07-6a3147bca112")]
  record IFsrmClassificationManager2, lpVtbl : IFsrmClassificationManager2Vtbl* do
    GUID = LibC::GUID.new(0x4c1c9_u32, 0x127e_u16, 0x4765_u16, StaticArray[0xba_u8, 0x7_u8, 0x6a_u8, 0x31_u8, 0x47_u8, 0xbc_u8, 0xa1_u8, 0x12_u8])
    def query_interface(this : IFsrmClassificationManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmClassificationManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmClassificationManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmClassificationManager2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmClassificationManager2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmClassificationManager2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmClassificationManager2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClassificationReportFormats(this : IFsrmClassificationManager2*, formats : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationReportFormats.call(this, formats)
    end
    def put_ClassificationReportFormats(this : IFsrmClassificationManager2*, formats : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassificationReportFormats.call(this, formats)
    end
    def get_Logging(this : IFsrmClassificationManager2*, logging : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Logging.call(this, logging)
    end
    def put_Logging(this : IFsrmClassificationManager2*, logging : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Logging.call(this, logging)
    end
    def get_ClassificationReportMailTo(this : IFsrmClassificationManager2*, mailTo : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationReportMailTo.call(this, mailTo)
    end
    def put_ClassificationReportMailTo(this : IFsrmClassificationManager2*, mailTo : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassificationReportMailTo.call(this, mailTo)
    end
    def get_ClassificationReportEnabled(this : IFsrmClassificationManager2*, reportEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationReportEnabled.call(this, reportEnabled)
    end
    def put_ClassificationReportEnabled(this : IFsrmClassificationManager2*, reportEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassificationReportEnabled.call(this, reportEnabled)
    end
    def get_ClassificationLastReportPathWithoutExtension(this : IFsrmClassificationManager2*, lastReportPath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationLastReportPathWithoutExtension.call(this, lastReportPath)
    end
    def get_ClassificationLastError(this : IFsrmClassificationManager2*, lastError : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationLastError.call(this, lastError)
    end
    def get_ClassificationRunningStatus(this : IFsrmClassificationManager2*, runningStatus : Win32cr::Storage::FileServerResourceManager::FsrmReportRunningStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassificationRunningStatus.call(this, runningStatus)
    end
    def enum_property_definitions(this : IFsrmClassificationManager2*, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, propertyDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_property_definitions.call(this, options, propertyDefinitions)
    end
    def create_property_definition(this : IFsrmClassificationManager2*, propertyDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_definition.call(this, propertyDefinition)
    end
    def get_property_definition(this : IFsrmClassificationManager2*, propertyName : Win32cr::Foundation::BSTR, propertyDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_definition.call(this, propertyName, propertyDefinition)
    end
    def enum_rules(this : IFsrmClassificationManager2*, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, rules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_rules.call(this, ruleType, options, rules)
    end
    def create_rule(this : IFsrmClassificationManager2*, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rule.call(this, ruleType, rule)
    end
    def get_rule(this : IFsrmClassificationManager2*, ruleName : Win32cr::Foundation::BSTR, ruleType : Win32cr::Storage::FileServerResourceManager::FsrmRuleType, rule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rule.call(this, ruleName, ruleType, rule)
    end
    def enum_module_definitions(this : IFsrmClassificationManager2*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, options : Win32cr::Storage::FileServerResourceManager::FsrmEnumOptions, moduleDefinitions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_module_definitions.call(this, moduleType, options, moduleDefinitions)
    end
    def create_module_definition(this : IFsrmClassificationManager2*, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, moduleDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_module_definition.call(this, moduleType, moduleDefinition)
    end
    def get_module_definition(this : IFsrmClassificationManager2*, moduleName : Win32cr::Foundation::BSTR, moduleType : Win32cr::Storage::FileServerResourceManager::FsrmPipelineModuleType, moduleDefinition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_module_definition.call(this, moduleName, moduleType, moduleDefinition)
    end
    def run_classification(this : IFsrmClassificationManager2*, context : Win32cr::Storage::FileServerResourceManager::FsrmReportGenerationContext, reserved : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_classification.call(this, context, reserved)
    end
    def wait_for_classification_completion(this : IFsrmClassificationManager2*, waitSeconds : Int32, completed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_classification_completion.call(this, waitSeconds, completed)
    end
    def cancel_classification(this : IFsrmClassificationManager2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_classification.call(this)
    end
    def enum_file_properties(this : IFsrmClassificationManager2*, filePath : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, fileProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_file_properties.call(this, filePath, options, fileProperties)
    end
    def get_file_property(this : IFsrmClassificationManager2*, filePath : Win32cr::Foundation::BSTR, propertyName : Win32cr::Foundation::BSTR, options : Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions, property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_property.call(this, filePath, propertyName, options, property)
    end
    def set_file_property(this : IFsrmClassificationManager2*, filePath : Win32cr::Foundation::BSTR, propertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_property.call(this, filePath, propertyName, propertyValue)
    end
    def clear_file_property(this : IFsrmClassificationManager2*, filePath : Win32cr::Foundation::BSTR, property : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_file_property.call(this, filePath, property)
    end
    def classify_files(this : IFsrmClassificationManager2*, filePaths : Win32cr::System::Com::SAFEARRAY*, propertyNames : Win32cr::System::Com::SAFEARRAY*, propertyValues : Win32cr::System::Com::SAFEARRAY*, options : Win32cr::Storage::FileServerResourceManager::FsrmGetFilePropertyOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.classify_files.call(this, filePaths, propertyNames, propertyValues, options)
    end

  end

  @[Extern]
  record IFsrmPropertyBagVtbl,
    query_interface : Proc(IFsrmPropertyBag*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPropertyBag*, UInt32),
    release : Proc(IFsrmPropertyBag*, UInt32),
    get_type_info_count : Proc(IFsrmPropertyBag*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPropertyBag*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPropertyBag*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPropertyBag*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RelativePath : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_VolumeName : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RelativeNamespaceRoot : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_VolumeIndex : Proc(IFsrmPropertyBag*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FileId : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ParentDirectoryId : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SizeAllocated : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CreationTime : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_LastAccessTime : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_LastModificationTime : Proc(IFsrmPropertyBag*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Attributes : Proc(IFsrmPropertyBag*, UInt32*, Win32cr::Foundation::HRESULT),
    get_OwnerSid : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FilePropertyNames : Proc(IFsrmPropertyBag*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_Messages : Proc(IFsrmPropertyBag*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_PropertyBagFlags : Proc(IFsrmPropertyBag*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_property : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    set_file_property : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_message : Proc(IFsrmPropertyBag*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_file_stream_interface : Proc(IFsrmPropertyBag*, Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingMode, Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingInterfaceType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("774589d1-d300-4f7a-9a24-f7b766800250")]
  record IFsrmPropertyBag, lpVtbl : IFsrmPropertyBagVtbl* do
    GUID = LibC::GUID.new(0x774589d1_u32, 0xd300_u16, 0x4f7a_u16, StaticArray[0x9a_u8, 0x24_u8, 0xf7_u8, 0xb7_u8, 0x66_u8, 0x80_u8, 0x2_u8, 0x50_u8])
    def query_interface(this : IFsrmPropertyBag*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPropertyBag*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPropertyBag*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPropertyBag*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPropertyBag*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPropertyBag*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPropertyBag*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFsrmPropertyBag*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_RelativePath(this : IFsrmPropertyBag*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RelativePath.call(this, path)
    end
    def get_VolumeName(this : IFsrmPropertyBag*, volumeName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeName.call(this, volumeName)
    end
    def get_RelativeNamespaceRoot(this : IFsrmPropertyBag*, relativeNamespaceRoot : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RelativeNamespaceRoot.call(this, relativeNamespaceRoot)
    end
    def get_VolumeIndex(this : IFsrmPropertyBag*, volumeId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeIndex.call(this, volumeId)
    end
    def get_FileId(this : IFsrmPropertyBag*, fileId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileId.call(this, fileId)
    end
    def get_ParentDirectoryId(this : IFsrmPropertyBag*, parentDirectoryId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentDirectoryId.call(this, parentDirectoryId)
    end
    def get_Size(this : IFsrmPropertyBag*, size : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, size)
    end
    def get_SizeAllocated(this : IFsrmPropertyBag*, sizeAllocated : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeAllocated.call(this, sizeAllocated)
    end
    def get_CreationTime(this : IFsrmPropertyBag*, creationTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTime.call(this, creationTime)
    end
    def get_LastAccessTime(this : IFsrmPropertyBag*, lastAccessTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastAccessTime.call(this, lastAccessTime)
    end
    def get_LastModificationTime(this : IFsrmPropertyBag*, lastModificationTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastModificationTime.call(this, lastModificationTime)
    end
    def get_Attributes(this : IFsrmPropertyBag*, attributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attributes.call(this, attributes)
    end
    def get_OwnerSid(this : IFsrmPropertyBag*, ownerSid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerSid.call(this, ownerSid)
    end
    def get_FilePropertyNames(this : IFsrmPropertyBag*, filePropertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FilePropertyNames.call(this, filePropertyNames)
    end
    def get_Messages(this : IFsrmPropertyBag*, messages : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Messages.call(this, messages)
    end
    def get_PropertyBagFlags(this : IFsrmPropertyBag*, flags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyBagFlags.call(this, flags)
    end
    def get_file_property(this : IFsrmPropertyBag*, name : Win32cr::Foundation::BSTR, fileProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_property.call(this, name, fileProperty)
    end
    def set_file_property(this : IFsrmPropertyBag*, name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_property.call(this, name, value)
    end
    def add_message(this : IFsrmPropertyBag*, message : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_message.call(this, message)
    end
    def get_file_stream_interface(this : IFsrmPropertyBag*, accessMode : Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingMode, interfaceType : Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingInterfaceType, pStreamInterface : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_stream_interface.call(this, accessMode, interfaceType, pStreamInterface)
    end

  end

  @[Extern]
  record IFsrmPropertyBag2Vtbl,
    query_interface : Proc(IFsrmPropertyBag2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPropertyBag2*, UInt32),
    release : Proc(IFsrmPropertyBag2*, UInt32),
    get_type_info_count : Proc(IFsrmPropertyBag2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPropertyBag2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPropertyBag2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPropertyBag2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RelativePath : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_VolumeName : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RelativeNamespaceRoot : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_VolumeIndex : Proc(IFsrmPropertyBag2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FileId : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ParentDirectoryId : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_SizeAllocated : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CreationTime : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_LastAccessTime : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_LastModificationTime : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Attributes : Proc(IFsrmPropertyBag2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_OwnerSid : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FilePropertyNames : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_Messages : Proc(IFsrmPropertyBag2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_PropertyBagFlags : Proc(IFsrmPropertyBag2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_file_property : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    set_file_property : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_message : Proc(IFsrmPropertyBag2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_file_stream_interface : Proc(IFsrmPropertyBag2*, Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingMode, Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingInterfaceType, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_field_value : Proc(IFsrmPropertyBag2*, Win32cr::Storage::FileServerResourceManager::FsrmPropertyBagField, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_untrusted_in_file_properties : Proc(IFsrmPropertyBag2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0e46bdbd-2402-4fed-9c30-9266e6eb2cc9")]
  record IFsrmPropertyBag2, lpVtbl : IFsrmPropertyBag2Vtbl* do
    GUID = LibC::GUID.new(0xe46bdbd_u32, 0x2402_u16, 0x4fed_u16, StaticArray[0x9c_u8, 0x30_u8, 0x92_u8, 0x66_u8, 0xe6_u8, 0xeb_u8, 0x2c_u8, 0xc9_u8])
    def query_interface(this : IFsrmPropertyBag2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPropertyBag2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPropertyBag2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPropertyBag2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPropertyBag2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPropertyBag2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPropertyBag2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFsrmPropertyBag2*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_RelativePath(this : IFsrmPropertyBag2*, path : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RelativePath.call(this, path)
    end
    def get_VolumeName(this : IFsrmPropertyBag2*, volumeName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeName.call(this, volumeName)
    end
    def get_RelativeNamespaceRoot(this : IFsrmPropertyBag2*, relativeNamespaceRoot : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RelativeNamespaceRoot.call(this, relativeNamespaceRoot)
    end
    def get_VolumeIndex(this : IFsrmPropertyBag2*, volumeId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VolumeIndex.call(this, volumeId)
    end
    def get_FileId(this : IFsrmPropertyBag2*, fileId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FileId.call(this, fileId)
    end
    def get_ParentDirectoryId(this : IFsrmPropertyBag2*, parentDirectoryId : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentDirectoryId.call(this, parentDirectoryId)
    end
    def get_Size(this : IFsrmPropertyBag2*, size : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, size)
    end
    def get_SizeAllocated(this : IFsrmPropertyBag2*, sizeAllocated : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeAllocated.call(this, sizeAllocated)
    end
    def get_CreationTime(this : IFsrmPropertyBag2*, creationTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CreationTime.call(this, creationTime)
    end
    def get_LastAccessTime(this : IFsrmPropertyBag2*, lastAccessTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastAccessTime.call(this, lastAccessTime)
    end
    def get_LastModificationTime(this : IFsrmPropertyBag2*, lastModificationTime : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastModificationTime.call(this, lastModificationTime)
    end
    def get_Attributes(this : IFsrmPropertyBag2*, attributes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Attributes.call(this, attributes)
    end
    def get_OwnerSid(this : IFsrmPropertyBag2*, ownerSid : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerSid.call(this, ownerSid)
    end
    def get_FilePropertyNames(this : IFsrmPropertyBag2*, filePropertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FilePropertyNames.call(this, filePropertyNames)
    end
    def get_Messages(this : IFsrmPropertyBag2*, messages : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Messages.call(this, messages)
    end
    def get_PropertyBagFlags(this : IFsrmPropertyBag2*, flags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyBagFlags.call(this, flags)
    end
    def get_file_property(this : IFsrmPropertyBag2*, name : Win32cr::Foundation::BSTR, fileProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_property.call(this, name, fileProperty)
    end
    def set_file_property(this : IFsrmPropertyBag2*, name : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_file_property.call(this, name, value)
    end
    def add_message(this : IFsrmPropertyBag2*, message : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_message.call(this, message)
    end
    def get_file_stream_interface(this : IFsrmPropertyBag2*, accessMode : Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingMode, interfaceType : Win32cr::Storage::FileServerResourceManager::FsrmFileStreamingInterfaceType, pStreamInterface : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_file_stream_interface.call(this, accessMode, interfaceType, pStreamInterface)
    end
    def get_field_value(this : IFsrmPropertyBag2*, field : Win32cr::Storage::FileServerResourceManager::FsrmPropertyBagField, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_field_value.call(this, field, value)
    end
    def get_untrusted_in_file_properties(this : IFsrmPropertyBag2*, props : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_untrusted_in_file_properties.call(this, props)
    end

  end

  @[Extern]
  record IFsrmPipelineModuleImplementationVtbl,
    query_interface : Proc(IFsrmPipelineModuleImplementation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPipelineModuleImplementation*, UInt32),
    release : Proc(IFsrmPipelineModuleImplementation*, UInt32),
    get_type_info_count : Proc(IFsrmPipelineModuleImplementation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPipelineModuleImplementation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPipelineModuleImplementation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPipelineModuleImplementation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_load : Proc(IFsrmPipelineModuleImplementation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    on_unload : Proc(IFsrmPipelineModuleImplementation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b7907906-2b02-4cb5-84a9-fdf54613d6cd")]
  record IFsrmPipelineModuleImplementation, lpVtbl : IFsrmPipelineModuleImplementationVtbl* do
    GUID = LibC::GUID.new(0xb7907906_u32, 0x2b02_u16, 0x4cb5_u16, StaticArray[0x84_u8, 0xa9_u8, 0xfd_u8, 0xf5_u8, 0x46_u8, 0x13_u8, 0xd6_u8, 0xcd_u8])
    def query_interface(this : IFsrmPipelineModuleImplementation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPipelineModuleImplementation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPipelineModuleImplementation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPipelineModuleImplementation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPipelineModuleImplementation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPipelineModuleImplementation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPipelineModuleImplementation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_load(this : IFsrmPipelineModuleImplementation*, moduleDefinition : Void*, moduleConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_load.call(this, moduleDefinition, moduleConnector)
    end
    def on_unload(this : IFsrmPipelineModuleImplementation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_unload.call(this)
    end

  end

  @[Extern]
  record IFsrmClassifierModuleImplementationVtbl,
    query_interface : Proc(IFsrmClassifierModuleImplementation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmClassifierModuleImplementation*, UInt32),
    release : Proc(IFsrmClassifierModuleImplementation*, UInt32),
    get_type_info_count : Proc(IFsrmClassifierModuleImplementation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmClassifierModuleImplementation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmClassifierModuleImplementation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmClassifierModuleImplementation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_load : Proc(IFsrmClassifierModuleImplementation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    on_unload : Proc(IFsrmClassifierModuleImplementation*, Win32cr::Foundation::HRESULT),
    get_LastModified : Proc(IFsrmClassifierModuleImplementation*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    use_rules_and_definitions : Proc(IFsrmClassifierModuleImplementation*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_begin_file : Proc(IFsrmClassifierModuleImplementation*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    does_property_value_apply : Proc(IFsrmClassifierModuleImplementation*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16*, LibC::GUID, LibC::GUID, Win32cr::Foundation::HRESULT),
    get_property_value_to_apply : Proc(IFsrmClassifierModuleImplementation*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, LibC::GUID, LibC::GUID, Win32cr::Foundation::HRESULT),
    on_end_file : Proc(IFsrmClassifierModuleImplementation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c968fc6-6edb-4051-9c18-73b7291ae106")]
  record IFsrmClassifierModuleImplementation, lpVtbl : IFsrmClassifierModuleImplementationVtbl* do
    GUID = LibC::GUID.new(0x4c968fc6_u32, 0x6edb_u16, 0x4051_u16, StaticArray[0x9c_u8, 0x18_u8, 0x73_u8, 0xb7_u8, 0x29_u8, 0x1a_u8, 0xe1_u8, 0x6_u8])
    def query_interface(this : IFsrmClassifierModuleImplementation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmClassifierModuleImplementation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmClassifierModuleImplementation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmClassifierModuleImplementation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmClassifierModuleImplementation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmClassifierModuleImplementation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmClassifierModuleImplementation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_load(this : IFsrmClassifierModuleImplementation*, moduleDefinition : Void*, moduleConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_load.call(this, moduleDefinition, moduleConnector)
    end
    def on_unload(this : IFsrmClassifierModuleImplementation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_unload.call(this)
    end
    def get_LastModified(this : IFsrmClassifierModuleImplementation*, lastModified : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastModified.call(this, lastModified)
    end
    def use_rules_and_definitions(this : IFsrmClassifierModuleImplementation*, rules : Void*, propertyDefinitions : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.use_rules_and_definitions.call(this, rules, propertyDefinitions)
    end
    def on_begin_file(this : IFsrmClassifierModuleImplementation*, propertyBag : Void*, arrayRuleIds : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_begin_file.call(this, propertyBag, arrayRuleIds)
    end
    def does_property_value_apply(this : IFsrmClassifierModuleImplementation*, property : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR, applyValue : Int16*, idRule : LibC::GUID, idPropDef : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.does_property_value_apply.call(this, property, value, applyValue, idRule, idPropDef)
    end
    def get_property_value_to_apply(this : IFsrmClassifierModuleImplementation*, property : Win32cr::Foundation::BSTR, value : Win32cr::Foundation::BSTR*, idRule : LibC::GUID, idPropDef : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_value_to_apply.call(this, property, value, idRule, idPropDef)
    end
    def on_end_file(this : IFsrmClassifierModuleImplementation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_file.call(this)
    end

  end

  @[Extern]
  record IFsrmStorageModuleImplementationVtbl,
    query_interface : Proc(IFsrmStorageModuleImplementation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmStorageModuleImplementation*, UInt32),
    release : Proc(IFsrmStorageModuleImplementation*, UInt32),
    get_type_info_count : Proc(IFsrmStorageModuleImplementation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmStorageModuleImplementation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmStorageModuleImplementation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmStorageModuleImplementation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_load : Proc(IFsrmStorageModuleImplementation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    on_unload : Proc(IFsrmStorageModuleImplementation*, Win32cr::Foundation::HRESULT),
    use_definitions : Proc(IFsrmStorageModuleImplementation*, Void*, Win32cr::Foundation::HRESULT),
    load_properties : Proc(IFsrmStorageModuleImplementation*, Void*, Win32cr::Foundation::HRESULT),
    save_properties : Proc(IFsrmStorageModuleImplementation*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0af4a0da-895a-4e50-8712-a96724bcec64")]
  record IFsrmStorageModuleImplementation, lpVtbl : IFsrmStorageModuleImplementationVtbl* do
    GUID = LibC::GUID.new(0xaf4a0da_u32, 0x895a_u16, 0x4e50_u16, StaticArray[0x87_u8, 0x12_u8, 0xa9_u8, 0x67_u8, 0x24_u8, 0xbc_u8, 0xec_u8, 0x64_u8])
    def query_interface(this : IFsrmStorageModuleImplementation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmStorageModuleImplementation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmStorageModuleImplementation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmStorageModuleImplementation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmStorageModuleImplementation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmStorageModuleImplementation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmStorageModuleImplementation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_load(this : IFsrmStorageModuleImplementation*, moduleDefinition : Void*, moduleConnector : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_load.call(this, moduleDefinition, moduleConnector)
    end
    def on_unload(this : IFsrmStorageModuleImplementation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_unload.call(this)
    end
    def use_definitions(this : IFsrmStorageModuleImplementation*, propertyDefinitions : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.use_definitions.call(this, propertyDefinitions)
    end
    def load_properties(this : IFsrmStorageModuleImplementation*, propertyBag : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_properties.call(this, propertyBag)
    end
    def save_properties(this : IFsrmStorageModuleImplementation*, propertyBag : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_properties.call(this, propertyBag)
    end

  end

  @[Extern]
  record IFsrmPipelineModuleConnectorVtbl,
    query_interface : Proc(IFsrmPipelineModuleConnector*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFsrmPipelineModuleConnector*, UInt32),
    release : Proc(IFsrmPipelineModuleConnector*, UInt32),
    get_type_info_count : Proc(IFsrmPipelineModuleConnector*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFsrmPipelineModuleConnector*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFsrmPipelineModuleConnector*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFsrmPipelineModuleConnector*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ModuleImplementation : Proc(IFsrmPipelineModuleConnector*, Void**, Win32cr::Foundation::HRESULT),
    get_ModuleName : Proc(IFsrmPipelineModuleConnector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HostingUserAccount : Proc(IFsrmPipelineModuleConnector*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HostingProcessPid : Proc(IFsrmPipelineModuleConnector*, Int32*, Win32cr::Foundation::HRESULT),
    bind : Proc(IFsrmPipelineModuleConnector*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c16014f3-9aa1-46b3-b0a7-ab146eb205f2")]
  record IFsrmPipelineModuleConnector, lpVtbl : IFsrmPipelineModuleConnectorVtbl* do
    GUID = LibC::GUID.new(0xc16014f3_u32, 0x9aa1_u16, 0x46b3_u16, StaticArray[0xb0_u8, 0xa7_u8, 0xab_u8, 0x14_u8, 0x6e_u8, 0xb2_u8, 0x5_u8, 0xf2_u8])
    def query_interface(this : IFsrmPipelineModuleConnector*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFsrmPipelineModuleConnector*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFsrmPipelineModuleConnector*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFsrmPipelineModuleConnector*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFsrmPipelineModuleConnector*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFsrmPipelineModuleConnector*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFsrmPipelineModuleConnector*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ModuleImplementation(this : IFsrmPipelineModuleConnector*, pipelineModuleImplementation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleImplementation.call(this, pipelineModuleImplementation)
    end
    def get_ModuleName(this : IFsrmPipelineModuleConnector*, userName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ModuleName.call(this, userName)
    end
    def get_HostingUserAccount(this : IFsrmPipelineModuleConnector*, userAccount : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HostingUserAccount.call(this, userAccount)
    end
    def get_HostingProcessPid(this : IFsrmPipelineModuleConnector*, pid : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HostingProcessPid.call(this, pid)
    end
    def bind(this : IFsrmPipelineModuleConnector*, moduleDefinition : Void*, moduleImplementation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.bind.call(this, moduleDefinition, moduleImplementation)
    end

  end

  @[Extern]
  record DIFsrmClassificationEventsVtbl,
    query_interface : Proc(DIFsrmClassificationEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DIFsrmClassificationEvents*, UInt32),
    release : Proc(DIFsrmClassificationEvents*, UInt32),
    get_type_info_count : Proc(DIFsrmClassificationEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DIFsrmClassificationEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DIFsrmClassificationEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DIFsrmClassificationEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("26942db0-dabf-41d8-bbdd-b129a9f70424")]
  record DIFsrmClassificationEvents, lpVtbl : DIFsrmClassificationEventsVtbl* do
    GUID = LibC::GUID.new(0x26942db0_u32, 0xdabf_u16, 0x41d8_u16, StaticArray[0xbb_u8, 0xdd_u8, 0xb1_u8, 0x29_u8, 0xa9_u8, 0xf7_u8, 0x4_u8, 0x24_u8])
    def query_interface(this : DIFsrmClassificationEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DIFsrmClassificationEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DIFsrmClassificationEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DIFsrmClassificationEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DIFsrmClassificationEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DIFsrmClassificationEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DIFsrmClassificationEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

end