require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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


  enum FsrmQuotaFlags : Int32
    FsrmQuotaFlags_Enforce = 256
    FsrmQuotaFlags_Disable = 512
    FsrmQuotaFlags_StatusIncomplete = 65536
    FsrmQuotaFlags_StatusRebuilding = 131072
  end

  enum FsrmFileScreenFlags : Int32
    FsrmFileScreenFlags_Enforce = 1
  end

  enum FsrmCollectionState : Int32
    FsrmCollectionState_Fetching = 1
    FsrmCollectionState_Committing = 2
    FsrmCollectionState_Complete = 3
    FsrmCollectionState_Cancelled = 4
  end

  enum FsrmEnumOptions : Int32
    FsrmEnumOptions_None = 0
    FsrmEnumOptions_Asynchronous = 1
    FsrmEnumOptions_CheckRecycleBin = 2
    FsrmEnumOptions_IncludeClusterNodes = 4
    FsrmEnumOptions_IncludeDeprecatedObjects = 8
  end

  enum FsrmCommitOptions : Int32
    FsrmCommitOptions_None = 0
    FsrmCommitOptions_Asynchronous = 1
  end

  enum FsrmTemplateApplyOptions : Int32
    FsrmTemplateApplyOptions_ApplyToDerivedMatching = 1
    FsrmTemplateApplyOptions_ApplyToDerivedAll = 2
  end

  enum FsrmActionType : Int32
    FsrmActionType_Unknown = 0
    FsrmActionType_EventLog = 1
    FsrmActionType_Email = 2
    FsrmActionType_Command = 3
    FsrmActionType_Report = 4
  end

  enum FsrmEventType : Int32
    FsrmEventType_Unknown = 0
    FsrmEventType_Information = 1
    FsrmEventType_Warning = 2
    FsrmEventType_Error = 3
  end

  enum FsrmAccountType : Int32
    FsrmAccountType_Unknown = 0
    FsrmAccountType_NetworkService = 1
    FsrmAccountType_LocalService = 2
    FsrmAccountType_LocalSystem = 3
    FsrmAccountType_InProc = 4
    FsrmAccountType_External = 5
    FsrmAccountType_Automatic = 500
  end

  enum FsrmReportType : Int32
    FsrmReportType_Unknown = 0
    FsrmReportType_LargeFiles = 1
    FsrmReportType_FilesByType = 2
    FsrmReportType_LeastRecentlyAccessed = 3
    FsrmReportType_MostRecentlyAccessed = 4
    FsrmReportType_QuotaUsage = 5
    FsrmReportType_FilesByOwner = 6
    FsrmReportType_ExportReport = 7
    FsrmReportType_DuplicateFiles = 8
    FsrmReportType_FileScreenAudit = 9
    FsrmReportType_FilesByProperty = 10
    FsrmReportType_AutomaticClassification = 11
    FsrmReportType_Expiration = 12
    FsrmReportType_FoldersByProperty = 13
  end

  enum FsrmReportFormat : Int32
    FsrmReportFormat_Unknown = 0
    FsrmReportFormat_DHtml = 1
    FsrmReportFormat_Html = 2
    FsrmReportFormat_Txt = 3
    FsrmReportFormat_Csv = 4
    FsrmReportFormat_Xml = 5
  end

  enum FsrmReportRunningStatus : Int32
    FsrmReportRunningStatus_Unknown = 0
    FsrmReportRunningStatus_NotRunning = 1
    FsrmReportRunningStatus_Queued = 2
    FsrmReportRunningStatus_Running = 3
  end

  enum FsrmReportGenerationContext : Int32
    FsrmReportGenerationContext_Undefined = 1
    FsrmReportGenerationContext_ScheduledReport = 2
    FsrmReportGenerationContext_InteractiveReport = 3
    FsrmReportGenerationContext_IncidentReport = 4
  end

  enum FsrmReportFilter : Int32
    FsrmReportFilter_MinSize = 1
    FsrmReportFilter_MinAgeDays = 2
    FsrmReportFilter_MaxAgeDays = 3
    FsrmReportFilter_MinQuotaUsage = 4
    FsrmReportFilter_FileGroups = 5
    FsrmReportFilter_Owners = 6
    FsrmReportFilter_NamePattern = 7
    FsrmReportFilter_Property = 8
  end

  enum FsrmReportLimit : Int32
    FsrmReportLimit_MaxFiles = 1
    FsrmReportLimit_MaxFileGroups = 2
    FsrmReportLimit_MaxOwners = 3
    FsrmReportLimit_MaxFilesPerFileGroup = 4
    FsrmReportLimit_MaxFilesPerOwner = 5
    FsrmReportLimit_MaxFilesPerDuplGroup = 6
    FsrmReportLimit_MaxDuplicateGroups = 7
    FsrmReportLimit_MaxQuotas = 8
    FsrmReportLimit_MaxFileScreenEvents = 9
    FsrmReportLimit_MaxPropertyValues = 10
    FsrmReportLimit_MaxFilesPerPropertyValue = 11
    FsrmReportLimit_MaxFolders = 12
  end

  enum FsrmPropertyDefinitionType : Int32
    FsrmPropertyDefinitionType_Unknown = 0
    FsrmPropertyDefinitionType_OrderedList = 1
    FsrmPropertyDefinitionType_MultiChoiceList = 2
    FsrmPropertyDefinitionType_SingleChoiceList = 3
    FsrmPropertyDefinitionType_String = 4
    FsrmPropertyDefinitionType_MultiString = 5
    FsrmPropertyDefinitionType_Int = 6
    FsrmPropertyDefinitionType_Bool = 7
    FsrmPropertyDefinitionType_Date = 8
  end

  enum FsrmPropertyDefinitionFlags : Int32
    FsrmPropertyDefinitionFlags_Global = 1
    FsrmPropertyDefinitionFlags_Deprecated = 2
    FsrmPropertyDefinitionFlags_Secure = 4
  end

  enum FsrmPropertyDefinitionAppliesTo : Int32
    FsrmPropertyDefinitionAppliesTo_Files = 1
    FsrmPropertyDefinitionAppliesTo_Folders = 2
  end

  enum FsrmRuleType : Int32
    FsrmRuleType_Unknown = 0
    FsrmRuleType_Classification = 1
    FsrmRuleType_Generic = 2
  end

  enum FsrmRuleFlags : Int32
    FsrmRuleFlags_Disabled = 256
    FsrmRuleFlags_ClearAutomaticallyClassifiedProperty = 1024
    FsrmRuleFlags_ClearManuallyClassifiedProperty = 2048
    FsrmRuleFlags_Invalid = 4096
  end

  enum FsrmClassificationLoggingFlags : Int32
    FsrmClassificationLoggingFlags_None = 0
    FsrmClassificationLoggingFlags_ClassificationsInLogFile = 1
    FsrmClassificationLoggingFlags_ErrorsInLogFile = 2
    FsrmClassificationLoggingFlags_ClassificationsInSystemLog = 4
    FsrmClassificationLoggingFlags_ErrorsInSystemLog = 8
  end

  enum FsrmExecutionOption : Int32
    FsrmExecutionOption_Unknown = 0
    FsrmExecutionOption_EvaluateUnset = 1
    FsrmExecutionOption_ReEvaluate_ConsiderExistingValue = 2
    FsrmExecutionOption_ReEvaluate_IgnoreExistingValue = 3
  end

  enum FsrmStorageModuleCaps : Int32
    FsrmStorageModuleCaps_Unknown = 0
    FsrmStorageModuleCaps_CanGet = 1
    FsrmStorageModuleCaps_CanSet = 2
    FsrmStorageModuleCaps_CanHandleDirectories = 4
    FsrmStorageModuleCaps_CanHandleFiles = 8
  end

  enum FsrmStorageModuleType : Int32
    FsrmStorageModuleType_Unknown = 0
    FsrmStorageModuleType_Cache = 1
    FsrmStorageModuleType_InFile = 2
    FsrmStorageModuleType_Database = 3
    FsrmStorageModuleType_System = 100
  end

  enum FsrmPropertyBagFlags : Int32
    FsrmPropertyBagFlags_UpdatedByClassifier = 1
    FsrmPropertyBagFlags_FailedLoadingProperties = 2
    FsrmPropertyBagFlags_FailedSavingProperties = 4
    FsrmPropertyBagFlags_FailedClassifyingProperties = 8
  end

  enum FsrmPropertyBagField : Int32
    FsrmPropertyBagField_AccessVolume = 0
    FsrmPropertyBagField_VolumeGuidName = 1
  end

  enum FsrmPropertyFlags : Int32
    FsrmPropertyFlags_None = 0
    FsrmPropertyFlags_Orphaned = 1
    FsrmPropertyFlags_RetrievedFromCache = 2
    FsrmPropertyFlags_RetrievedFromStorage = 4
    FsrmPropertyFlags_SetByClassifier = 8
    FsrmPropertyFlags_Deleted = 16
    FsrmPropertyFlags_Reclassified = 32
    FsrmPropertyFlags_AggregationFailed = 64
    FsrmPropertyFlags_Existing = 128
    FsrmPropertyFlags_FailedLoadingProperties = 256
    FsrmPropertyFlags_FailedClassifyingProperties = 512
    FsrmPropertyFlags_FailedSavingProperties = 1024
    FsrmPropertyFlags_Secure = 2048
    FsrmPropertyFlags_PolicyDerived = 4096
    FsrmPropertyFlags_Inherited = 8192
    FsrmPropertyFlags_Manual = 16384
    FsrmPropertyFlags_ExplicitValueDeleted = 32768
    FsrmPropertyFlags_PropertyDeletedFromClear = 65536
    FsrmPropertyFlags_PropertySourceMask = 14
    FsrmPropertyFlags_PersistentMask = 20480
  end

  enum FsrmPipelineModuleType : Int32
    FsrmPipelineModuleType_Unknown = 0
    FsrmPipelineModuleType_Storage = 1
    FsrmPipelineModuleType_Classifier = 2
  end

  enum FsrmGetFilePropertyOptions : Int32
    FsrmGetFilePropertyOptions_None = 0
    FsrmGetFilePropertyOptions_NoRuleEvaluation = 1
    FsrmGetFilePropertyOptions_Persistent = 2
    FsrmGetFilePropertyOptions_FailOnPersistErrors = 4
    FsrmGetFilePropertyOptions_SkipOrphaned = 8
  end

  enum FsrmFileManagementType : Int32
    FsrmFileManagementType_Unknown = 0
    FsrmFileManagementType_Expiration = 1
    FsrmFileManagementType_Custom = 2
    FsrmFileManagementType_Rms = 3
  end

  enum FsrmFileManagementLoggingFlags : Int32
    FsrmFileManagementLoggingFlags_None = 0
    FsrmFileManagementLoggingFlags_Error = 1
    FsrmFileManagementLoggingFlags_Information = 2
    FsrmFileManagementLoggingFlags_Audit = 4
  end

  enum FsrmPropertyConditionType : Int32
    FsrmPropertyConditionType_Unknown = 0
    FsrmPropertyConditionType_Equal = 1
    FsrmPropertyConditionType_NotEqual = 2
    FsrmPropertyConditionType_GreaterThan = 3
    FsrmPropertyConditionType_LessThan = 4
    FsrmPropertyConditionType_Contain = 5
    FsrmPropertyConditionType_Exist = 6
    FsrmPropertyConditionType_NotExist = 7
    FsrmPropertyConditionType_StartWith = 8
    FsrmPropertyConditionType_EndWith = 9
    FsrmPropertyConditionType_ContainedIn = 10
    FsrmPropertyConditionType_PrefixOf = 11
    FsrmPropertyConditionType_SuffixOf = 12
    FsrmPropertyConditionType_MatchesPattern = 13
  end

  enum FsrmFileStreamingMode : Int32
    FsrmFileStreamingMode_Unknown = 0
    FsrmFileStreamingMode_Read = 1
    FsrmFileStreamingMode_Write = 2
  end

  enum FsrmFileStreamingInterfaceType : Int32
    FsrmFileStreamingInterfaceType_Unknown = 0
    FsrmFileStreamingInterfaceType_ILockBytes = 1
    FsrmFileStreamingInterfaceType_IStream = 2
  end

  enum FsrmFileConditionType : Int32
    FsrmFileConditionType_Unknown = 0
    FsrmFileConditionType_Property = 1
  end

  enum FsrmFileSystemPropertyId : Int32
    FsrmFileSystemPropertyId_Undefined = 0
    FsrmFileSystemPropertyId_FileName = 1
    FsrmFileSystemPropertyId_DateCreated = 2
    FsrmFileSystemPropertyId_DateLastAccessed = 3
    FsrmFileSystemPropertyId_DateLastModified = 4
    FsrmFileSystemPropertyId_DateNow = 5
  end

  enum FsrmPropertyValueType : Int32
    FsrmPropertyValueType_Undefined = 0
    FsrmPropertyValueType_Literal = 1
    FsrmPropertyValueType_DateOffset = 2
  end

  enum AdrClientDisplayFlags : Int32
    AdrClientDisplayFlags_AllowEmailRequests = 1
    AdrClientDisplayFlags_ShowDeviceTroubleshooting = 2
  end

  enum AdrEmailFlags : Int32
    AdrEmailFlags_PutDataOwnerOnToLine = 1
    AdrEmailFlags_PutAdminOnToLine = 2
    AdrEmailFlags_IncludeDeviceClaims = 4
    AdrEmailFlags_IncludeUserInfo = 8
    AdrEmailFlags_GenerateEventLog = 16
  end

  enum AdrClientErrorType : Int32
    AdrClientErrorType_Unknown = 0
    AdrClientErrorType_AccessDenied = 1
    AdrClientErrorType_FileNotFound = 2
  end

  enum AdrClientFlags : Int32
    AdrClientFlags_None = 0
    AdrClientFlags_FailForLocalPaths = 1
    AdrClientFlags_FailIfNotSupportedByServer = 2
    AdrClientFlags_FailIfNotDomainJoined = 4
  end


  struct IFsrmObjectVTbl
    query_interface : Proc(IFsrmObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmObject*, UInt32)
    release : Proc(IFsrmObject*, UInt32)
    get_type_info_count : Proc(IFsrmObject*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmObject*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmObject*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmObject*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmObject*, Guid*, HRESULT)
    get_description : Proc(IFsrmObject*, UInt8**, HRESULT)
    put_description : Proc(IFsrmObject*, UInt8*, HRESULT)
    delete : Proc(IFsrmObject*, HRESULT)
    commit : Proc(IFsrmObject*, HRESULT)
  end

  IFsrmObject_GUID = "22bcef93-4a3f-4183-89f9-2f8b8a628aee"
  IID_IFsrmObject = LibC::GUID.new(0x22bcef93_u32, 0x4a3f_u16, 0x4183_u16, StaticArray[0x89_u8, 0xf9_u8, 0x2f_u8, 0x8b_u8, 0x8a_u8, 0x62_u8, 0x8a_u8, 0xee_u8])
  struct IFsrmObject
    lpVtbl : IFsrmObjectVTbl*
  end

  struct IFsrmCollectionVTbl
    query_interface : Proc(IFsrmCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmCollection*, UInt32)
    release : Proc(IFsrmCollection*, UInt32)
    get_type_info_count : Proc(IFsrmCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFsrmCollection*, IUnknown*, HRESULT)
    get_item : Proc(IFsrmCollection*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IFsrmCollection*, Int32*, HRESULT)
    get_state : Proc(IFsrmCollection*, FsrmCollectionState*, HRESULT)
    cancel : Proc(IFsrmCollection*, HRESULT)
    wait_for_completion : Proc(IFsrmCollection*, Int32, Int16*, HRESULT)
    get_by_id : Proc(IFsrmCollection*, Guid, VARIANT*, HRESULT)
  end

  IFsrmCollection_GUID = "f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8"
  IID_IFsrmCollection = LibC::GUID.new(0xf76fbf3b_u32, 0x8ddd_u16, 0x4b42_u16, StaticArray[0xb0_u8, 0x5a_u8, 0xcb_u8, 0x1c_u8, 0x3f_u8, 0xf1_u8, 0xfe_u8, 0xe8_u8])
  struct IFsrmCollection
    lpVtbl : IFsrmCollectionVTbl*
  end

  struct IFsrmMutableCollectionVTbl
    query_interface : Proc(IFsrmMutableCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmMutableCollection*, UInt32)
    release : Proc(IFsrmMutableCollection*, UInt32)
    get_type_info_count : Proc(IFsrmMutableCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmMutableCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmMutableCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmMutableCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFsrmMutableCollection*, IUnknown*, HRESULT)
    get_item : Proc(IFsrmMutableCollection*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IFsrmMutableCollection*, Int32*, HRESULT)
    get_state : Proc(IFsrmMutableCollection*, FsrmCollectionState*, HRESULT)
    cancel : Proc(IFsrmMutableCollection*, HRESULT)
    wait_for_completion : Proc(IFsrmMutableCollection*, Int32, Int16*, HRESULT)
    get_by_id : Proc(IFsrmMutableCollection*, Guid, VARIANT*, HRESULT)
    add : Proc(IFsrmMutableCollection*, VARIANT, HRESULT)
    remove : Proc(IFsrmMutableCollection*, Int32, HRESULT)
    remove_by_id : Proc(IFsrmMutableCollection*, Guid, HRESULT)
    clone : Proc(IFsrmMutableCollection*, IFsrmMutableCollection*, HRESULT)
  end

  IFsrmMutableCollection_GUID = "1bb617b8-3886-49dc-af82-a6c90fa35dda"
  IID_IFsrmMutableCollection = LibC::GUID.new(0x1bb617b8_u32, 0x3886_u16, 0x49dc_u16, StaticArray[0xaf_u8, 0x82_u8, 0xa6_u8, 0xc9_u8, 0xf_u8, 0xa3_u8, 0x5d_u8, 0xda_u8])
  struct IFsrmMutableCollection
    lpVtbl : IFsrmMutableCollectionVTbl*
  end

  struct IFsrmCommittableCollectionVTbl
    query_interface : Proc(IFsrmCommittableCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmCommittableCollection*, UInt32)
    release : Proc(IFsrmCommittableCollection*, UInt32)
    get_type_info_count : Proc(IFsrmCommittableCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmCommittableCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmCommittableCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmCommittableCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IFsrmCommittableCollection*, IUnknown*, HRESULT)
    get_item : Proc(IFsrmCommittableCollection*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IFsrmCommittableCollection*, Int32*, HRESULT)
    get_state : Proc(IFsrmCommittableCollection*, FsrmCollectionState*, HRESULT)
    cancel : Proc(IFsrmCommittableCollection*, HRESULT)
    wait_for_completion : Proc(IFsrmCommittableCollection*, Int32, Int16*, HRESULT)
    get_by_id : Proc(IFsrmCommittableCollection*, Guid, VARIANT*, HRESULT)
    add : Proc(IFsrmCommittableCollection*, VARIANT, HRESULT)
    remove : Proc(IFsrmCommittableCollection*, Int32, HRESULT)
    remove_by_id : Proc(IFsrmCommittableCollection*, Guid, HRESULT)
    clone : Proc(IFsrmCommittableCollection*, IFsrmMutableCollection*, HRESULT)
    commit : Proc(IFsrmCommittableCollection*, FsrmCommitOptions, IFsrmCollection*, HRESULT)
  end

  IFsrmCommittableCollection_GUID = "96deb3b5-8b91-4a2a-9d93-80a35d8aa847"
  IID_IFsrmCommittableCollection = LibC::GUID.new(0x96deb3b5_u32, 0x8b91_u16, 0x4a2a_u16, StaticArray[0x9d_u8, 0x93_u8, 0x80_u8, 0xa3_u8, 0x5d_u8, 0x8a_u8, 0xa8_u8, 0x47_u8])
  struct IFsrmCommittableCollection
    lpVtbl : IFsrmCommittableCollectionVTbl*
  end

  struct IFsrmActionVTbl
    query_interface : Proc(IFsrmAction*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmAction*, UInt32)
    release : Proc(IFsrmAction*, UInt32)
    get_type_info_count : Proc(IFsrmAction*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmAction*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmAction*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmAction*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmAction*, Guid*, HRESULT)
    get_action_type : Proc(IFsrmAction*, FsrmActionType*, HRESULT)
    get_run_limit_interval : Proc(IFsrmAction*, Int32*, HRESULT)
    put_run_limit_interval : Proc(IFsrmAction*, Int32, HRESULT)
    delete : Proc(IFsrmAction*, HRESULT)
  end

  IFsrmAction_GUID = "6cd6408a-ae60-463b-9ef1-e117534d69dc"
  IID_IFsrmAction = LibC::GUID.new(0x6cd6408a_u32, 0xae60_u16, 0x463b_u16, StaticArray[0x9e_u8, 0xf1_u8, 0xe1_u8, 0x17_u8, 0x53_u8, 0x4d_u8, 0x69_u8, 0xdc_u8])
  struct IFsrmAction
    lpVtbl : IFsrmActionVTbl*
  end

  struct IFsrmActionEmailVTbl
    query_interface : Proc(IFsrmActionEmail*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmActionEmail*, UInt32)
    release : Proc(IFsrmActionEmail*, UInt32)
    get_type_info_count : Proc(IFsrmActionEmail*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmActionEmail*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmActionEmail*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmActionEmail*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmActionEmail*, Guid*, HRESULT)
    get_action_type : Proc(IFsrmActionEmail*, FsrmActionType*, HRESULT)
    get_run_limit_interval : Proc(IFsrmActionEmail*, Int32*, HRESULT)
    put_run_limit_interval : Proc(IFsrmActionEmail*, Int32, HRESULT)
    delete : Proc(IFsrmActionEmail*, HRESULT)
    get_mail_from : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_mail_from : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
    get_mail_reply_to : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_mail_reply_to : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
    get_mail_to : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_mail_to : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
    get_mail_cc : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_mail_cc : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
    get_mail_bcc : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_mail_bcc : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
    get_mail_subject : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_mail_subject : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
    get_message_text : Proc(IFsrmActionEmail*, UInt8**, HRESULT)
    put_message_text : Proc(IFsrmActionEmail*, UInt8*, HRESULT)
  end

  IFsrmActionEmail_GUID = "d646567d-26ae-4caa-9f84-4e0aad207fca"
  IID_IFsrmActionEmail = LibC::GUID.new(0xd646567d_u32, 0x26ae_u16, 0x4caa_u16, StaticArray[0x9f_u8, 0x84_u8, 0x4e_u8, 0xa_u8, 0xad_u8, 0x20_u8, 0x7f_u8, 0xca_u8])
  struct IFsrmActionEmail
    lpVtbl : IFsrmActionEmailVTbl*
  end

  struct IFsrmActionEmail2VTbl
    query_interface : Proc(IFsrmActionEmail2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmActionEmail2*, UInt32)
    release : Proc(IFsrmActionEmail2*, UInt32)
    get_type_info_count : Proc(IFsrmActionEmail2*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmActionEmail2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmActionEmail2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmActionEmail2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmActionEmail2*, Guid*, HRESULT)
    get_action_type : Proc(IFsrmActionEmail2*, FsrmActionType*, HRESULT)
    get_run_limit_interval : Proc(IFsrmActionEmail2*, Int32*, HRESULT)
    put_run_limit_interval : Proc(IFsrmActionEmail2*, Int32, HRESULT)
    delete : Proc(IFsrmActionEmail2*, HRESULT)
    get_mail_from : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_mail_from : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_mail_reply_to : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_mail_reply_to : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_mail_to : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_mail_to : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_mail_cc : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_mail_cc : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_mail_bcc : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_mail_bcc : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_mail_subject : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_mail_subject : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_message_text : Proc(IFsrmActionEmail2*, UInt8**, HRESULT)
    put_message_text : Proc(IFsrmActionEmail2*, UInt8*, HRESULT)
    get_attachment_file_list_size : Proc(IFsrmActionEmail2*, Int32*, HRESULT)
    put_attachment_file_list_size : Proc(IFsrmActionEmail2*, Int32, HRESULT)
  end

  IFsrmActionEmail2_GUID = "8276702f-2532-4839-89bf-4872609a2ea4"
  IID_IFsrmActionEmail2 = LibC::GUID.new(0x8276702f_u32, 0x2532_u16, 0x4839_u16, StaticArray[0x89_u8, 0xbf_u8, 0x48_u8, 0x72_u8, 0x60_u8, 0x9a_u8, 0x2e_u8, 0xa4_u8])
  struct IFsrmActionEmail2
    lpVtbl : IFsrmActionEmail2VTbl*
  end

  struct IFsrmActionReportVTbl
    query_interface : Proc(IFsrmActionReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmActionReport*, UInt32)
    release : Proc(IFsrmActionReport*, UInt32)
    get_type_info_count : Proc(IFsrmActionReport*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmActionReport*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmActionReport*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmActionReport*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmActionReport*, Guid*, HRESULT)
    get_action_type : Proc(IFsrmActionReport*, FsrmActionType*, HRESULT)
    get_run_limit_interval : Proc(IFsrmActionReport*, Int32*, HRESULT)
    put_run_limit_interval : Proc(IFsrmActionReport*, Int32, HRESULT)
    delete : Proc(IFsrmActionReport*, HRESULT)
    get_report_types : Proc(IFsrmActionReport*, SAFEARRAY**, HRESULT)
    put_report_types : Proc(IFsrmActionReport*, SAFEARRAY*, HRESULT)
    get_mail_to : Proc(IFsrmActionReport*, UInt8**, HRESULT)
    put_mail_to : Proc(IFsrmActionReport*, UInt8*, HRESULT)
  end

  IFsrmActionReport_GUID = "2dbe63c4-b340-48a0-a5b0-158e07fc567e"
  IID_IFsrmActionReport = LibC::GUID.new(0x2dbe63c4_u32, 0xb340_u16, 0x48a0_u16, StaticArray[0xa5_u8, 0xb0_u8, 0x15_u8, 0x8e_u8, 0x7_u8, 0xfc_u8, 0x56_u8, 0x7e_u8])
  struct IFsrmActionReport
    lpVtbl : IFsrmActionReportVTbl*
  end

  struct IFsrmActionEventLogVTbl
    query_interface : Proc(IFsrmActionEventLog*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmActionEventLog*, UInt32)
    release : Proc(IFsrmActionEventLog*, UInt32)
    get_type_info_count : Proc(IFsrmActionEventLog*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmActionEventLog*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmActionEventLog*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmActionEventLog*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmActionEventLog*, Guid*, HRESULT)
    get_action_type : Proc(IFsrmActionEventLog*, FsrmActionType*, HRESULT)
    get_run_limit_interval : Proc(IFsrmActionEventLog*, Int32*, HRESULT)
    put_run_limit_interval : Proc(IFsrmActionEventLog*, Int32, HRESULT)
    delete : Proc(IFsrmActionEventLog*, HRESULT)
    get_event_type : Proc(IFsrmActionEventLog*, FsrmEventType*, HRESULT)
    put_event_type : Proc(IFsrmActionEventLog*, FsrmEventType, HRESULT)
    get_message_text : Proc(IFsrmActionEventLog*, UInt8**, HRESULT)
    put_message_text : Proc(IFsrmActionEventLog*, UInt8*, HRESULT)
  end

  IFsrmActionEventLog_GUID = "4c8f96c3-5d94-4f37-a4f4-f56ab463546f"
  IID_IFsrmActionEventLog = LibC::GUID.new(0x4c8f96c3_u32, 0x5d94_u16, 0x4f37_u16, StaticArray[0xa4_u8, 0xf4_u8, 0xf5_u8, 0x6a_u8, 0xb4_u8, 0x63_u8, 0x54_u8, 0x6f_u8])
  struct IFsrmActionEventLog
    lpVtbl : IFsrmActionEventLogVTbl*
  end

  struct IFsrmActionCommandVTbl
    query_interface : Proc(IFsrmActionCommand*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmActionCommand*, UInt32)
    release : Proc(IFsrmActionCommand*, UInt32)
    get_type_info_count : Proc(IFsrmActionCommand*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmActionCommand*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmActionCommand*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmActionCommand*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmActionCommand*, Guid*, HRESULT)
    get_action_type : Proc(IFsrmActionCommand*, FsrmActionType*, HRESULT)
    get_run_limit_interval : Proc(IFsrmActionCommand*, Int32*, HRESULT)
    put_run_limit_interval : Proc(IFsrmActionCommand*, Int32, HRESULT)
    delete : Proc(IFsrmActionCommand*, HRESULT)
    get_executable_path : Proc(IFsrmActionCommand*, UInt8**, HRESULT)
    put_executable_path : Proc(IFsrmActionCommand*, UInt8*, HRESULT)
    get_arguments : Proc(IFsrmActionCommand*, UInt8**, HRESULT)
    put_arguments : Proc(IFsrmActionCommand*, UInt8*, HRESULT)
    get_account : Proc(IFsrmActionCommand*, FsrmAccountType*, HRESULT)
    put_account : Proc(IFsrmActionCommand*, FsrmAccountType, HRESULT)
    get_working_directory : Proc(IFsrmActionCommand*, UInt8**, HRESULT)
    put_working_directory : Proc(IFsrmActionCommand*, UInt8*, HRESULT)
    get_monitor_command : Proc(IFsrmActionCommand*, Int16*, HRESULT)
    put_monitor_command : Proc(IFsrmActionCommand*, Int16, HRESULT)
    get_kill_time_out : Proc(IFsrmActionCommand*, Int32*, HRESULT)
    put_kill_time_out : Proc(IFsrmActionCommand*, Int32, HRESULT)
    get_log_result : Proc(IFsrmActionCommand*, Int16*, HRESULT)
    put_log_result : Proc(IFsrmActionCommand*, Int16, HRESULT)
  end

  IFsrmActionCommand_GUID = "12937789-e247-4917-9c20-f3ee9c7ee783"
  IID_IFsrmActionCommand = LibC::GUID.new(0x12937789_u32, 0xe247_u16, 0x4917_u16, StaticArray[0x9c_u8, 0x20_u8, 0xf3_u8, 0xee_u8, 0x9c_u8, 0x7e_u8, 0xe7_u8, 0x83_u8])
  struct IFsrmActionCommand
    lpVtbl : IFsrmActionCommandVTbl*
  end

  struct IFsrmSettingVTbl
    query_interface : Proc(IFsrmSetting*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmSetting*, UInt32)
    release : Proc(IFsrmSetting*, UInt32)
    get_type_info_count : Proc(IFsrmSetting*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmSetting*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmSetting*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmSetting*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_smtp_server : Proc(IFsrmSetting*, UInt8**, HRESULT)
    put_smtp_server : Proc(IFsrmSetting*, UInt8*, HRESULT)
    get_mail_from : Proc(IFsrmSetting*, UInt8**, HRESULT)
    put_mail_from : Proc(IFsrmSetting*, UInt8*, HRESULT)
    get_admin_email : Proc(IFsrmSetting*, UInt8**, HRESULT)
    put_admin_email : Proc(IFsrmSetting*, UInt8*, HRESULT)
    get_disable_command_line : Proc(IFsrmSetting*, Int16*, HRESULT)
    put_disable_command_line : Proc(IFsrmSetting*, Int16, HRESULT)
    get_enable_screening_audit : Proc(IFsrmSetting*, Int16*, HRESULT)
    put_enable_screening_audit : Proc(IFsrmSetting*, Int16, HRESULT)
    email_test : Proc(IFsrmSetting*, UInt8*, HRESULT)
    set_action_run_limit_interval : Proc(IFsrmSetting*, FsrmActionType, Int32, HRESULT)
    get_action_run_limit_interval : Proc(IFsrmSetting*, FsrmActionType, Int32*, HRESULT)
  end

  IFsrmSetting_GUID = "f411d4fd-14be-4260-8c40-03b7c95e608a"
  IID_IFsrmSetting = LibC::GUID.new(0xf411d4fd_u32, 0x14be_u16, 0x4260_u16, StaticArray[0x8c_u8, 0x40_u8, 0x3_u8, 0xb7_u8, 0xc9_u8, 0x5e_u8, 0x60_u8, 0x8a_u8])
  struct IFsrmSetting
    lpVtbl : IFsrmSettingVTbl*
  end

  struct IFsrmPathMapperVTbl
    query_interface : Proc(IFsrmPathMapper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPathMapper*, UInt32)
    release : Proc(IFsrmPathMapper*, UInt32)
    get_type_info_count : Proc(IFsrmPathMapper*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPathMapper*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPathMapper*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPathMapper*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_share_paths_for_local_path : Proc(IFsrmPathMapper*, UInt8*, SAFEARRAY**, HRESULT)
  end

  IFsrmPathMapper_GUID = "6f4dbfff-6920-4821-a6c3-b7e94c1fd60c"
  IID_IFsrmPathMapper = LibC::GUID.new(0x6f4dbfff_u32, 0x6920_u16, 0x4821_u16, StaticArray[0xa6_u8, 0xc3_u8, 0xb7_u8, 0xe9_u8, 0x4c_u8, 0x1f_u8, 0xd6_u8, 0xc_u8])
  struct IFsrmPathMapper
    lpVtbl : IFsrmPathMapperVTbl*
  end

  struct IFsrmExportImportVTbl
    query_interface : Proc(IFsrmExportImport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmExportImport*, UInt32)
    release : Proc(IFsrmExportImport*, UInt32)
    get_type_info_count : Proc(IFsrmExportImport*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmExportImport*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmExportImport*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmExportImport*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    export_file_groups : Proc(IFsrmExportImport*, UInt8*, VARIANT*, UInt8*, HRESULT)
    import_file_groups : Proc(IFsrmExportImport*, UInt8*, VARIANT*, UInt8*, IFsrmCommittableCollection*, HRESULT)
    export_file_screen_templates : Proc(IFsrmExportImport*, UInt8*, VARIANT*, UInt8*, HRESULT)
    import_file_screen_templates : Proc(IFsrmExportImport*, UInt8*, VARIANT*, UInt8*, IFsrmCommittableCollection*, HRESULT)
    export_quota_templates : Proc(IFsrmExportImport*, UInt8*, VARIANT*, UInt8*, HRESULT)
    import_quota_templates : Proc(IFsrmExportImport*, UInt8*, VARIANT*, UInt8*, IFsrmCommittableCollection*, HRESULT)
  end

  IFsrmExportImport_GUID = "efcb0ab1-16c4-4a79-812c-725614c3306b"
  IID_IFsrmExportImport = LibC::GUID.new(0xefcb0ab1_u32, 0x16c4_u16, 0x4a79_u16, StaticArray[0x81_u8, 0x2c_u8, 0x72_u8, 0x56_u8, 0x14_u8, 0xc3_u8, 0x30_u8, 0x6b_u8])
  struct IFsrmExportImport
    lpVtbl : IFsrmExportImportVTbl*
  end

  struct IFsrmDerivedObjectsResultVTbl
    query_interface : Proc(IFsrmDerivedObjectsResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmDerivedObjectsResult*, UInt32)
    release : Proc(IFsrmDerivedObjectsResult*, UInt32)
    get_type_info_count : Proc(IFsrmDerivedObjectsResult*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmDerivedObjectsResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmDerivedObjectsResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmDerivedObjectsResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_derived_objects : Proc(IFsrmDerivedObjectsResult*, IFsrmCollection*, HRESULT)
    get_results : Proc(IFsrmDerivedObjectsResult*, IFsrmCollection*, HRESULT)
  end

  IFsrmDerivedObjectsResult_GUID = "39322a2d-38ee-4d0d-8095-421a80849a82"
  IID_IFsrmDerivedObjectsResult = LibC::GUID.new(0x39322a2d_u32, 0x38ee_u16, 0x4d0d_u16, StaticArray[0x80_u8, 0x95_u8, 0x42_u8, 0x1a_u8, 0x80_u8, 0x84_u8, 0x9a_u8, 0x82_u8])
  struct IFsrmDerivedObjectsResult
    lpVtbl : IFsrmDerivedObjectsResultVTbl*
  end

  struct IFsrmAccessDeniedRemediationClientVTbl
    query_interface : Proc(IFsrmAccessDeniedRemediationClient*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmAccessDeniedRemediationClient*, UInt32)
    release : Proc(IFsrmAccessDeniedRemediationClient*, UInt32)
    get_type_info_count : Proc(IFsrmAccessDeniedRemediationClient*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmAccessDeniedRemediationClient*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmAccessDeniedRemediationClient*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmAccessDeniedRemediationClient*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    show : Proc(IFsrmAccessDeniedRemediationClient*, LibC::UINT_PTR, UInt8*, AdrClientErrorType, Int32, UInt8*, UInt8*, Int32*, HRESULT)
  end

  IFsrmAccessDeniedRemediationClient_GUID = "40002314-590b-45a5-8e1b-8c05da527e52"
  IID_IFsrmAccessDeniedRemediationClient = LibC::GUID.new(0x40002314_u32, 0x590b_u16, 0x45a5_u16, StaticArray[0x8e_u8, 0x1b_u8, 0x8c_u8, 0x5_u8, 0xda_u8, 0x52_u8, 0x7e_u8, 0x52_u8])
  struct IFsrmAccessDeniedRemediationClient
    lpVtbl : IFsrmAccessDeniedRemediationClientVTbl*
  end

  struct IFsrmQuotaBaseVTbl
    query_interface : Proc(IFsrmQuotaBase*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaBase*, UInt32)
    release : Proc(IFsrmQuotaBase*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaBase*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaBase*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaBase*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaBase*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmQuotaBase*, Guid*, HRESULT)
    get_description : Proc(IFsrmQuotaBase*, UInt8**, HRESULT)
    put_description : Proc(IFsrmQuotaBase*, UInt8*, HRESULT)
    delete : Proc(IFsrmQuotaBase*, HRESULT)
    commit : Proc(IFsrmQuotaBase*, HRESULT)
    get_quota_limit : Proc(IFsrmQuotaBase*, VARIANT*, HRESULT)
    put_quota_limit : Proc(IFsrmQuotaBase*, VARIANT, HRESULT)
    get_quota_flags : Proc(IFsrmQuotaBase*, Int32*, HRESULT)
    put_quota_flags : Proc(IFsrmQuotaBase*, Int32, HRESULT)
    get_thresholds : Proc(IFsrmQuotaBase*, SAFEARRAY**, HRESULT)
    add_threshold : Proc(IFsrmQuotaBase*, Int32, HRESULT)
    delete_threshold : Proc(IFsrmQuotaBase*, Int32, HRESULT)
    modify_threshold : Proc(IFsrmQuotaBase*, Int32, Int32, HRESULT)
    create_threshold_action : Proc(IFsrmQuotaBase*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_threshold_actions : Proc(IFsrmQuotaBase*, Int32, IFsrmCollection*, HRESULT)
  end

  IFsrmQuotaBase_GUID = "1568a795-3924-4118-b74b-68d8f0fa5daf"
  IID_IFsrmQuotaBase = LibC::GUID.new(0x1568a795_u32, 0x3924_u16, 0x4118_u16, StaticArray[0xb7_u8, 0x4b_u8, 0x68_u8, 0xd8_u8, 0xf0_u8, 0xfa_u8, 0x5d_u8, 0xaf_u8])
  struct IFsrmQuotaBase
    lpVtbl : IFsrmQuotaBaseVTbl*
  end

  struct IFsrmQuotaObjectVTbl
    query_interface : Proc(IFsrmQuotaObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaObject*, UInt32)
    release : Proc(IFsrmQuotaObject*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaObject*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaObject*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaObject*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaObject*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmQuotaObject*, Guid*, HRESULT)
    get_description : Proc(IFsrmQuotaObject*, UInt8**, HRESULT)
    put_description : Proc(IFsrmQuotaObject*, UInt8*, HRESULT)
    delete : Proc(IFsrmQuotaObject*, HRESULT)
    commit : Proc(IFsrmQuotaObject*, HRESULT)
    get_quota_limit : Proc(IFsrmQuotaObject*, VARIANT*, HRESULT)
    put_quota_limit : Proc(IFsrmQuotaObject*, VARIANT, HRESULT)
    get_quota_flags : Proc(IFsrmQuotaObject*, Int32*, HRESULT)
    put_quota_flags : Proc(IFsrmQuotaObject*, Int32, HRESULT)
    get_thresholds : Proc(IFsrmQuotaObject*, SAFEARRAY**, HRESULT)
    add_threshold : Proc(IFsrmQuotaObject*, Int32, HRESULT)
    delete_threshold : Proc(IFsrmQuotaObject*, Int32, HRESULT)
    modify_threshold : Proc(IFsrmQuotaObject*, Int32, Int32, HRESULT)
    create_threshold_action : Proc(IFsrmQuotaObject*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_threshold_actions : Proc(IFsrmQuotaObject*, Int32, IFsrmCollection*, HRESULT)
    get_path : Proc(IFsrmQuotaObject*, UInt8**, HRESULT)
    get_user_sid : Proc(IFsrmQuotaObject*, UInt8**, HRESULT)
    get_user_account : Proc(IFsrmQuotaObject*, UInt8**, HRESULT)
    get_source_template_name : Proc(IFsrmQuotaObject*, UInt8**, HRESULT)
    get_matches_source_template : Proc(IFsrmQuotaObject*, Int16*, HRESULT)
    apply_template : Proc(IFsrmQuotaObject*, UInt8*, HRESULT)
  end

  IFsrmQuotaObject_GUID = "42dc3511-61d5-48ae-b6dc-59fc00c0a8d6"
  IID_IFsrmQuotaObject = LibC::GUID.new(0x42dc3511_u32, 0x61d5_u16, 0x48ae_u16, StaticArray[0xb6_u8, 0xdc_u8, 0x59_u8, 0xfc_u8, 0x0_u8, 0xc0_u8, 0xa8_u8, 0xd6_u8])
  struct IFsrmQuotaObject
    lpVtbl : IFsrmQuotaObjectVTbl*
  end

  struct IFsrmQuotaVTbl
    query_interface : Proc(IFsrmQuota*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuota*, UInt32)
    release : Proc(IFsrmQuota*, UInt32)
    get_type_info_count : Proc(IFsrmQuota*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuota*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuota*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuota*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmQuota*, Guid*, HRESULT)
    get_description : Proc(IFsrmQuota*, UInt8**, HRESULT)
    put_description : Proc(IFsrmQuota*, UInt8*, HRESULT)
    delete : Proc(IFsrmQuota*, HRESULT)
    commit : Proc(IFsrmQuota*, HRESULT)
    get_quota_limit : Proc(IFsrmQuota*, VARIANT*, HRESULT)
    put_quota_limit : Proc(IFsrmQuota*, VARIANT, HRESULT)
    get_quota_flags : Proc(IFsrmQuota*, Int32*, HRESULT)
    put_quota_flags : Proc(IFsrmQuota*, Int32, HRESULT)
    get_thresholds : Proc(IFsrmQuota*, SAFEARRAY**, HRESULT)
    add_threshold : Proc(IFsrmQuota*, Int32, HRESULT)
    delete_threshold : Proc(IFsrmQuota*, Int32, HRESULT)
    modify_threshold : Proc(IFsrmQuota*, Int32, Int32, HRESULT)
    create_threshold_action : Proc(IFsrmQuota*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_threshold_actions : Proc(IFsrmQuota*, Int32, IFsrmCollection*, HRESULT)
    get_path : Proc(IFsrmQuota*, UInt8**, HRESULT)
    get_user_sid : Proc(IFsrmQuota*, UInt8**, HRESULT)
    get_user_account : Proc(IFsrmQuota*, UInt8**, HRESULT)
    get_source_template_name : Proc(IFsrmQuota*, UInt8**, HRESULT)
    get_matches_source_template : Proc(IFsrmQuota*, Int16*, HRESULT)
    apply_template : Proc(IFsrmQuota*, UInt8*, HRESULT)
    get_quota_used : Proc(IFsrmQuota*, VARIANT*, HRESULT)
    get_quota_peak_usage : Proc(IFsrmQuota*, VARIANT*, HRESULT)
    get_quota_peak_usage_time : Proc(IFsrmQuota*, Float64*, HRESULT)
    reset_peak_usage : Proc(IFsrmQuota*, HRESULT)
    refresh_usage_properties : Proc(IFsrmQuota*, HRESULT)
  end

  IFsrmQuota_GUID = "377f739d-9647-4b8e-97d2-5ffce6d759cd"
  IID_IFsrmQuota = LibC::GUID.new(0x377f739d_u32, 0x9647_u16, 0x4b8e_u16, StaticArray[0x97_u8, 0xd2_u8, 0x5f_u8, 0xfc_u8, 0xe6_u8, 0xd7_u8, 0x59_u8, 0xcd_u8])
  struct IFsrmQuota
    lpVtbl : IFsrmQuotaVTbl*
  end

  struct IFsrmAutoApplyQuotaVTbl
    query_interface : Proc(IFsrmAutoApplyQuota*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmAutoApplyQuota*, UInt32)
    release : Proc(IFsrmAutoApplyQuota*, UInt32)
    get_type_info_count : Proc(IFsrmAutoApplyQuota*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmAutoApplyQuota*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmAutoApplyQuota*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmAutoApplyQuota*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmAutoApplyQuota*, Guid*, HRESULT)
    get_description : Proc(IFsrmAutoApplyQuota*, UInt8**, HRESULT)
    put_description : Proc(IFsrmAutoApplyQuota*, UInt8*, HRESULT)
    delete : Proc(IFsrmAutoApplyQuota*, HRESULT)
    commit : Proc(IFsrmAutoApplyQuota*, HRESULT)
    get_quota_limit : Proc(IFsrmAutoApplyQuota*, VARIANT*, HRESULT)
    put_quota_limit : Proc(IFsrmAutoApplyQuota*, VARIANT, HRESULT)
    get_quota_flags : Proc(IFsrmAutoApplyQuota*, Int32*, HRESULT)
    put_quota_flags : Proc(IFsrmAutoApplyQuota*, Int32, HRESULT)
    get_thresholds : Proc(IFsrmAutoApplyQuota*, SAFEARRAY**, HRESULT)
    add_threshold : Proc(IFsrmAutoApplyQuota*, Int32, HRESULT)
    delete_threshold : Proc(IFsrmAutoApplyQuota*, Int32, HRESULT)
    modify_threshold : Proc(IFsrmAutoApplyQuota*, Int32, Int32, HRESULT)
    create_threshold_action : Proc(IFsrmAutoApplyQuota*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_threshold_actions : Proc(IFsrmAutoApplyQuota*, Int32, IFsrmCollection*, HRESULT)
    get_path : Proc(IFsrmAutoApplyQuota*, UInt8**, HRESULT)
    get_user_sid : Proc(IFsrmAutoApplyQuota*, UInt8**, HRESULT)
    get_user_account : Proc(IFsrmAutoApplyQuota*, UInt8**, HRESULT)
    get_source_template_name : Proc(IFsrmAutoApplyQuota*, UInt8**, HRESULT)
    get_matches_source_template : Proc(IFsrmAutoApplyQuota*, Int16*, HRESULT)
    apply_template : Proc(IFsrmAutoApplyQuota*, UInt8*, HRESULT)
    get_exclude_folders : Proc(IFsrmAutoApplyQuota*, SAFEARRAY**, HRESULT)
    put_exclude_folders : Proc(IFsrmAutoApplyQuota*, SAFEARRAY*, HRESULT)
    commit_and_update_derived : Proc(IFsrmAutoApplyQuota*, FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)
  end

  IFsrmAutoApplyQuota_GUID = "f82e5729-6aba-4740-bfc7-c7f58f75fb7b"
  IID_IFsrmAutoApplyQuota = LibC::GUID.new(0xf82e5729_u32, 0x6aba_u16, 0x4740_u16, StaticArray[0xbf_u8, 0xc7_u8, 0xc7_u8, 0xf5_u8, 0x8f_u8, 0x75_u8, 0xfb_u8, 0x7b_u8])
  struct IFsrmAutoApplyQuota
    lpVtbl : IFsrmAutoApplyQuotaVTbl*
  end

  struct IFsrmQuotaManagerVTbl
    query_interface : Proc(IFsrmQuotaManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaManager*, UInt32)
    release : Proc(IFsrmQuotaManager*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_action_variables : Proc(IFsrmQuotaManager*, SAFEARRAY**, HRESULT)
    get_action_variable_descriptions : Proc(IFsrmQuotaManager*, SAFEARRAY**, HRESULT)
    create_quota : Proc(IFsrmQuotaManager*, UInt8*, IFsrmQuota*, HRESULT)
    create_auto_apply_quota : Proc(IFsrmQuotaManager*, UInt8*, UInt8*, IFsrmAutoApplyQuota*, HRESULT)
    get_quota : Proc(IFsrmQuotaManager*, UInt8*, IFsrmQuota*, HRESULT)
    get_auto_apply_quota : Proc(IFsrmQuotaManager*, UInt8*, IFsrmAutoApplyQuota*, HRESULT)
    get_restrictive_quota : Proc(IFsrmQuotaManager*, UInt8*, IFsrmQuota*, HRESULT)
    enum_quotas : Proc(IFsrmQuotaManager*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    enum_auto_apply_quotas : Proc(IFsrmQuotaManager*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    enum_effective_quotas : Proc(IFsrmQuotaManager*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    scan : Proc(IFsrmQuotaManager*, UInt8*, HRESULT)
    create_quota_collection : Proc(IFsrmQuotaManager*, IFsrmCommittableCollection*, HRESULT)
  end

  IFsrmQuotaManager_GUID = "8bb68c7d-19d8-4ffb-809e-be4fc1734014"
  IID_IFsrmQuotaManager = LibC::GUID.new(0x8bb68c7d_u32, 0x19d8_u16, 0x4ffb_u16, StaticArray[0x80_u8, 0x9e_u8, 0xbe_u8, 0x4f_u8, 0xc1_u8, 0x73_u8, 0x40_u8, 0x14_u8])
  struct IFsrmQuotaManager
    lpVtbl : IFsrmQuotaManagerVTbl*
  end

  struct IFsrmQuotaManagerExVTbl
    query_interface : Proc(IFsrmQuotaManagerEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaManagerEx*, UInt32)
    release : Proc(IFsrmQuotaManagerEx*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaManagerEx*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaManagerEx*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaManagerEx*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaManagerEx*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_action_variables : Proc(IFsrmQuotaManagerEx*, SAFEARRAY**, HRESULT)
    get_action_variable_descriptions : Proc(IFsrmQuotaManagerEx*, SAFEARRAY**, HRESULT)
    create_quota : Proc(IFsrmQuotaManagerEx*, UInt8*, IFsrmQuota*, HRESULT)
    create_auto_apply_quota : Proc(IFsrmQuotaManagerEx*, UInt8*, UInt8*, IFsrmAutoApplyQuota*, HRESULT)
    get_quota : Proc(IFsrmQuotaManagerEx*, UInt8*, IFsrmQuota*, HRESULT)
    get_auto_apply_quota : Proc(IFsrmQuotaManagerEx*, UInt8*, IFsrmAutoApplyQuota*, HRESULT)
    get_restrictive_quota : Proc(IFsrmQuotaManagerEx*, UInt8*, IFsrmQuota*, HRESULT)
    enum_quotas : Proc(IFsrmQuotaManagerEx*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    enum_auto_apply_quotas : Proc(IFsrmQuotaManagerEx*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    enum_effective_quotas : Proc(IFsrmQuotaManagerEx*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    scan : Proc(IFsrmQuotaManagerEx*, UInt8*, HRESULT)
    create_quota_collection : Proc(IFsrmQuotaManagerEx*, IFsrmCommittableCollection*, HRESULT)
    is_affected_by_quota : Proc(IFsrmQuotaManagerEx*, UInt8*, FsrmEnumOptions, Int16*, HRESULT)
  end

  IFsrmQuotaManagerEx_GUID = "4846cb01-d430-494f-abb4-b1054999fb09"
  IID_IFsrmQuotaManagerEx = LibC::GUID.new(0x4846cb01_u32, 0xd430_u16, 0x494f_u16, StaticArray[0xab_u8, 0xb4_u8, 0xb1_u8, 0x5_u8, 0x49_u8, 0x99_u8, 0xfb_u8, 0x9_u8])
  struct IFsrmQuotaManagerEx
    lpVtbl : IFsrmQuotaManagerExVTbl*
  end

  struct IFsrmQuotaTemplateVTbl
    query_interface : Proc(IFsrmQuotaTemplate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaTemplate*, UInt32)
    release : Proc(IFsrmQuotaTemplate*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaTemplate*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaTemplate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaTemplate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaTemplate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmQuotaTemplate*, Guid*, HRESULT)
    get_description : Proc(IFsrmQuotaTemplate*, UInt8**, HRESULT)
    put_description : Proc(IFsrmQuotaTemplate*, UInt8*, HRESULT)
    delete : Proc(IFsrmQuotaTemplate*, HRESULT)
    commit : Proc(IFsrmQuotaTemplate*, HRESULT)
    get_quota_limit : Proc(IFsrmQuotaTemplate*, VARIANT*, HRESULT)
    put_quota_limit : Proc(IFsrmQuotaTemplate*, VARIANT, HRESULT)
    get_quota_flags : Proc(IFsrmQuotaTemplate*, Int32*, HRESULT)
    put_quota_flags : Proc(IFsrmQuotaTemplate*, Int32, HRESULT)
    get_thresholds : Proc(IFsrmQuotaTemplate*, SAFEARRAY**, HRESULT)
    add_threshold : Proc(IFsrmQuotaTemplate*, Int32, HRESULT)
    delete_threshold : Proc(IFsrmQuotaTemplate*, Int32, HRESULT)
    modify_threshold : Proc(IFsrmQuotaTemplate*, Int32, Int32, HRESULT)
    create_threshold_action : Proc(IFsrmQuotaTemplate*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_threshold_actions : Proc(IFsrmQuotaTemplate*, Int32, IFsrmCollection*, HRESULT)
    get_name : Proc(IFsrmQuotaTemplate*, UInt8**, HRESULT)
    put_name : Proc(IFsrmQuotaTemplate*, UInt8*, HRESULT)
    copy_template : Proc(IFsrmQuotaTemplate*, UInt8*, HRESULT)
    commit_and_update_derived : Proc(IFsrmQuotaTemplate*, FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)
  end

  IFsrmQuotaTemplate_GUID = "a2efab31-295e-46bb-b976-e86d58b52e8b"
  IID_IFsrmQuotaTemplate = LibC::GUID.new(0xa2efab31_u32, 0x295e_u16, 0x46bb_u16, StaticArray[0xb9_u8, 0x76_u8, 0xe8_u8, 0x6d_u8, 0x58_u8, 0xb5_u8, 0x2e_u8, 0x8b_u8])
  struct IFsrmQuotaTemplate
    lpVtbl : IFsrmQuotaTemplateVTbl*
  end

  struct IFsrmQuotaTemplateImportedVTbl
    query_interface : Proc(IFsrmQuotaTemplateImported*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaTemplateImported*, UInt32)
    release : Proc(IFsrmQuotaTemplateImported*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaTemplateImported*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaTemplateImported*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaTemplateImported*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaTemplateImported*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmQuotaTemplateImported*, Guid*, HRESULT)
    get_description : Proc(IFsrmQuotaTemplateImported*, UInt8**, HRESULT)
    put_description : Proc(IFsrmQuotaTemplateImported*, UInt8*, HRESULT)
    delete : Proc(IFsrmQuotaTemplateImported*, HRESULT)
    commit : Proc(IFsrmQuotaTemplateImported*, HRESULT)
    get_quota_limit : Proc(IFsrmQuotaTemplateImported*, VARIANT*, HRESULT)
    put_quota_limit : Proc(IFsrmQuotaTemplateImported*, VARIANT, HRESULT)
    get_quota_flags : Proc(IFsrmQuotaTemplateImported*, Int32*, HRESULT)
    put_quota_flags : Proc(IFsrmQuotaTemplateImported*, Int32, HRESULT)
    get_thresholds : Proc(IFsrmQuotaTemplateImported*, SAFEARRAY**, HRESULT)
    add_threshold : Proc(IFsrmQuotaTemplateImported*, Int32, HRESULT)
    delete_threshold : Proc(IFsrmQuotaTemplateImported*, Int32, HRESULT)
    modify_threshold : Proc(IFsrmQuotaTemplateImported*, Int32, Int32, HRESULT)
    create_threshold_action : Proc(IFsrmQuotaTemplateImported*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_threshold_actions : Proc(IFsrmQuotaTemplateImported*, Int32, IFsrmCollection*, HRESULT)
    get_name : Proc(IFsrmQuotaTemplateImported*, UInt8**, HRESULT)
    put_name : Proc(IFsrmQuotaTemplateImported*, UInt8*, HRESULT)
    copy_template : Proc(IFsrmQuotaTemplateImported*, UInt8*, HRESULT)
    commit_and_update_derived : Proc(IFsrmQuotaTemplateImported*, FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)
    get_overwrite_on_commit : Proc(IFsrmQuotaTemplateImported*, Int16*, HRESULT)
    put_overwrite_on_commit : Proc(IFsrmQuotaTemplateImported*, Int16, HRESULT)
  end

  IFsrmQuotaTemplateImported_GUID = "9a2bf113-a329-44cc-809a-5c00fce8da40"
  IID_IFsrmQuotaTemplateImported = LibC::GUID.new(0x9a2bf113_u32, 0xa329_u16, 0x44cc_u16, StaticArray[0x80_u8, 0x9a_u8, 0x5c_u8, 0x0_u8, 0xfc_u8, 0xe8_u8, 0xda_u8, 0x40_u8])
  struct IFsrmQuotaTemplateImported
    lpVtbl : IFsrmQuotaTemplateImportedVTbl*
  end

  struct IFsrmQuotaTemplateManagerVTbl
    query_interface : Proc(IFsrmQuotaTemplateManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmQuotaTemplateManager*, UInt32)
    release : Proc(IFsrmQuotaTemplateManager*, UInt32)
    get_type_info_count : Proc(IFsrmQuotaTemplateManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmQuotaTemplateManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmQuotaTemplateManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmQuotaTemplateManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_template : Proc(IFsrmQuotaTemplateManager*, IFsrmQuotaTemplate*, HRESULT)
    get_template : Proc(IFsrmQuotaTemplateManager*, UInt8*, IFsrmQuotaTemplate*, HRESULT)
    enum_templates : Proc(IFsrmQuotaTemplateManager*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    export_templates : Proc(IFsrmQuotaTemplateManager*, VARIANT*, UInt8**, HRESULT)
    import_templates : Proc(IFsrmQuotaTemplateManager*, UInt8*, VARIANT*, IFsrmCommittableCollection*, HRESULT)
  end

  IFsrmQuotaTemplateManager_GUID = "4173ac41-172d-4d52-963c-fdc7e415f717"
  IID_IFsrmQuotaTemplateManager = LibC::GUID.new(0x4173ac41_u32, 0x172d_u16, 0x4d52_u16, StaticArray[0x96_u8, 0x3c_u8, 0xfd_u8, 0xc7_u8, 0xe4_u8, 0x15_u8, 0xf7_u8, 0x17_u8])
  struct IFsrmQuotaTemplateManager
    lpVtbl : IFsrmQuotaTemplateManagerVTbl*
  end

  struct IFsrmFileGroupVTbl
    query_interface : Proc(IFsrmFileGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileGroup*, UInt32)
    release : Proc(IFsrmFileGroup*, UInt32)
    get_type_info_count : Proc(IFsrmFileGroup*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileGroup*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileGroup*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileGroup*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileGroup*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileGroup*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileGroup*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileGroup*, HRESULT)
    commit : Proc(IFsrmFileGroup*, HRESULT)
    get_name : Proc(IFsrmFileGroup*, UInt8**, HRESULT)
    put_name : Proc(IFsrmFileGroup*, UInt8*, HRESULT)
    get_members : Proc(IFsrmFileGroup*, IFsrmMutableCollection*, HRESULT)
    put_members : Proc(IFsrmFileGroup*, IFsrmMutableCollection, HRESULT)
    get_non_members : Proc(IFsrmFileGroup*, IFsrmMutableCollection*, HRESULT)
    put_non_members : Proc(IFsrmFileGroup*, IFsrmMutableCollection, HRESULT)
  end

  IFsrmFileGroup_GUID = "8dd04909-0e34-4d55-afaa-89e1f1a1bbb9"
  IID_IFsrmFileGroup = LibC::GUID.new(0x8dd04909_u32, 0xe34_u16, 0x4d55_u16, StaticArray[0xaf_u8, 0xaa_u8, 0x89_u8, 0xe1_u8, 0xf1_u8, 0xa1_u8, 0xbb_u8, 0xb9_u8])
  struct IFsrmFileGroup
    lpVtbl : IFsrmFileGroupVTbl*
  end

  struct IFsrmFileGroupImportedVTbl
    query_interface : Proc(IFsrmFileGroupImported*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileGroupImported*, UInt32)
    release : Proc(IFsrmFileGroupImported*, UInt32)
    get_type_info_count : Proc(IFsrmFileGroupImported*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileGroupImported*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileGroupImported*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileGroupImported*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileGroupImported*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileGroupImported*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileGroupImported*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileGroupImported*, HRESULT)
    commit : Proc(IFsrmFileGroupImported*, HRESULT)
    get_name : Proc(IFsrmFileGroupImported*, UInt8**, HRESULT)
    put_name : Proc(IFsrmFileGroupImported*, UInt8*, HRESULT)
    get_members : Proc(IFsrmFileGroupImported*, IFsrmMutableCollection*, HRESULT)
    put_members : Proc(IFsrmFileGroupImported*, IFsrmMutableCollection, HRESULT)
    get_non_members : Proc(IFsrmFileGroupImported*, IFsrmMutableCollection*, HRESULT)
    put_non_members : Proc(IFsrmFileGroupImported*, IFsrmMutableCollection, HRESULT)
    get_overwrite_on_commit : Proc(IFsrmFileGroupImported*, Int16*, HRESULT)
    put_overwrite_on_commit : Proc(IFsrmFileGroupImported*, Int16, HRESULT)
  end

  IFsrmFileGroupImported_GUID = "ad55f10b-5f11-4be7-94ef-d9ee2e470ded"
  IID_IFsrmFileGroupImported = LibC::GUID.new(0xad55f10b_u32, 0x5f11_u16, 0x4be7_u16, StaticArray[0x94_u8, 0xef_u8, 0xd9_u8, 0xee_u8, 0x2e_u8, 0x47_u8, 0xd_u8, 0xed_u8])
  struct IFsrmFileGroupImported
    lpVtbl : IFsrmFileGroupImportedVTbl*
  end

  struct IFsrmFileGroupManagerVTbl
    query_interface : Proc(IFsrmFileGroupManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileGroupManager*, UInt32)
    release : Proc(IFsrmFileGroupManager*, UInt32)
    get_type_info_count : Proc(IFsrmFileGroupManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileGroupManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileGroupManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileGroupManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_file_group : Proc(IFsrmFileGroupManager*, IFsrmFileGroup*, HRESULT)
    get_file_group : Proc(IFsrmFileGroupManager*, UInt8*, IFsrmFileGroup*, HRESULT)
    enum_file_groups : Proc(IFsrmFileGroupManager*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    export_file_groups : Proc(IFsrmFileGroupManager*, VARIANT*, UInt8**, HRESULT)
    import_file_groups : Proc(IFsrmFileGroupManager*, UInt8*, VARIANT*, IFsrmCommittableCollection*, HRESULT)
  end

  IFsrmFileGroupManager_GUID = "426677d5-018c-485c-8a51-20b86d00bdc4"
  IID_IFsrmFileGroupManager = LibC::GUID.new(0x426677d5_u32, 0x18c_u16, 0x485c_u16, StaticArray[0x8a_u8, 0x51_u8, 0x20_u8, 0xb8_u8, 0x6d_u8, 0x0_u8, 0xbd_u8, 0xc4_u8])
  struct IFsrmFileGroupManager
    lpVtbl : IFsrmFileGroupManagerVTbl*
  end

  struct IFsrmFileScreenBaseVTbl
    query_interface : Proc(IFsrmFileScreenBase*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreenBase*, UInt32)
    release : Proc(IFsrmFileScreenBase*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreenBase*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreenBase*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreenBase*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreenBase*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileScreenBase*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileScreenBase*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileScreenBase*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileScreenBase*, HRESULT)
    commit : Proc(IFsrmFileScreenBase*, HRESULT)
    get_blocked_file_groups : Proc(IFsrmFileScreenBase*, IFsrmMutableCollection*, HRESULT)
    put_blocked_file_groups : Proc(IFsrmFileScreenBase*, IFsrmMutableCollection, HRESULT)
    get_file_screen_flags : Proc(IFsrmFileScreenBase*, Int32*, HRESULT)
    put_file_screen_flags : Proc(IFsrmFileScreenBase*, Int32, HRESULT)
    create_action : Proc(IFsrmFileScreenBase*, FsrmActionType, IFsrmAction*, HRESULT)
    enum_actions : Proc(IFsrmFileScreenBase*, IFsrmCollection*, HRESULT)
  end

  IFsrmFileScreenBase_GUID = "f3637e80-5b22-4a2b-a637-bbb642b41cfc"
  IID_IFsrmFileScreenBase = LibC::GUID.new(0xf3637e80_u32, 0x5b22_u16, 0x4a2b_u16, StaticArray[0xa6_u8, 0x37_u8, 0xbb_u8, 0xb6_u8, 0x42_u8, 0xb4_u8, 0x1c_u8, 0xfc_u8])
  struct IFsrmFileScreenBase
    lpVtbl : IFsrmFileScreenBaseVTbl*
  end

  struct IFsrmFileScreenVTbl
    query_interface : Proc(IFsrmFileScreen*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreen*, UInt32)
    release : Proc(IFsrmFileScreen*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreen*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreen*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreen*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreen*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileScreen*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileScreen*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileScreen*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileScreen*, HRESULT)
    commit : Proc(IFsrmFileScreen*, HRESULT)
    get_blocked_file_groups : Proc(IFsrmFileScreen*, IFsrmMutableCollection*, HRESULT)
    put_blocked_file_groups : Proc(IFsrmFileScreen*, IFsrmMutableCollection, HRESULT)
    get_file_screen_flags : Proc(IFsrmFileScreen*, Int32*, HRESULT)
    put_file_screen_flags : Proc(IFsrmFileScreen*, Int32, HRESULT)
    create_action : Proc(IFsrmFileScreen*, FsrmActionType, IFsrmAction*, HRESULT)
    enum_actions : Proc(IFsrmFileScreen*, IFsrmCollection*, HRESULT)
    get_path : Proc(IFsrmFileScreen*, UInt8**, HRESULT)
    get_source_template_name : Proc(IFsrmFileScreen*, UInt8**, HRESULT)
    get_matches_source_template : Proc(IFsrmFileScreen*, Int16*, HRESULT)
    get_user_sid : Proc(IFsrmFileScreen*, UInt8**, HRESULT)
    get_user_account : Proc(IFsrmFileScreen*, UInt8**, HRESULT)
    apply_template : Proc(IFsrmFileScreen*, UInt8*, HRESULT)
  end

  IFsrmFileScreen_GUID = "5f6325d3-ce88-4733-84c1-2d6aefc5ea07"
  IID_IFsrmFileScreen = LibC::GUID.new(0x5f6325d3_u32, 0xce88_u16, 0x4733_u16, StaticArray[0x84_u8, 0xc1_u8, 0x2d_u8, 0x6a_u8, 0xef_u8, 0xc5_u8, 0xea_u8, 0x7_u8])
  struct IFsrmFileScreen
    lpVtbl : IFsrmFileScreenVTbl*
  end

  struct IFsrmFileScreenExceptionVTbl
    query_interface : Proc(IFsrmFileScreenException*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreenException*, UInt32)
    release : Proc(IFsrmFileScreenException*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreenException*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreenException*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreenException*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreenException*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileScreenException*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileScreenException*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileScreenException*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileScreenException*, HRESULT)
    commit : Proc(IFsrmFileScreenException*, HRESULT)
    get_path : Proc(IFsrmFileScreenException*, UInt8**, HRESULT)
    get_allowed_file_groups : Proc(IFsrmFileScreenException*, IFsrmMutableCollection*, HRESULT)
    put_allowed_file_groups : Proc(IFsrmFileScreenException*, IFsrmMutableCollection, HRESULT)
  end

  IFsrmFileScreenException_GUID = "bee7ce02-df77-4515-9389-78f01c5afc1a"
  IID_IFsrmFileScreenException = LibC::GUID.new(0xbee7ce02_u32, 0xdf77_u16, 0x4515_u16, StaticArray[0x93_u8, 0x89_u8, 0x78_u8, 0xf0_u8, 0x1c_u8, 0x5a_u8, 0xfc_u8, 0x1a_u8])
  struct IFsrmFileScreenException
    lpVtbl : IFsrmFileScreenExceptionVTbl*
  end

  struct IFsrmFileScreenManagerVTbl
    query_interface : Proc(IFsrmFileScreenManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreenManager*, UInt32)
    release : Proc(IFsrmFileScreenManager*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreenManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreenManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreenManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreenManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_action_variables : Proc(IFsrmFileScreenManager*, SAFEARRAY**, HRESULT)
    get_action_variable_descriptions : Proc(IFsrmFileScreenManager*, SAFEARRAY**, HRESULT)
    create_file_screen : Proc(IFsrmFileScreenManager*, UInt8*, IFsrmFileScreen*, HRESULT)
    get_file_screen : Proc(IFsrmFileScreenManager*, UInt8*, IFsrmFileScreen*, HRESULT)
    enum_file_screens : Proc(IFsrmFileScreenManager*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    create_file_screen_exception : Proc(IFsrmFileScreenManager*, UInt8*, IFsrmFileScreenException*, HRESULT)
    get_file_screen_exception : Proc(IFsrmFileScreenManager*, UInt8*, IFsrmFileScreenException*, HRESULT)
    enum_file_screen_exceptions : Proc(IFsrmFileScreenManager*, UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    create_file_screen_collection : Proc(IFsrmFileScreenManager*, IFsrmCommittableCollection*, HRESULT)
  end

  IFsrmFileScreenManager_GUID = "ff4fa04e-5a94-4bda-a3a0-d5b4d3c52eba"
  IID_IFsrmFileScreenManager = LibC::GUID.new(0xff4fa04e_u32, 0x5a94_u16, 0x4bda_u16, StaticArray[0xa3_u8, 0xa0_u8, 0xd5_u8, 0xb4_u8, 0xd3_u8, 0xc5_u8, 0x2e_u8, 0xba_u8])
  struct IFsrmFileScreenManager
    lpVtbl : IFsrmFileScreenManagerVTbl*
  end

  struct IFsrmFileScreenTemplateVTbl
    query_interface : Proc(IFsrmFileScreenTemplate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreenTemplate*, UInt32)
    release : Proc(IFsrmFileScreenTemplate*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreenTemplate*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreenTemplate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreenTemplate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreenTemplate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileScreenTemplate*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileScreenTemplate*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileScreenTemplate*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileScreenTemplate*, HRESULT)
    commit : Proc(IFsrmFileScreenTemplate*, HRESULT)
    get_blocked_file_groups : Proc(IFsrmFileScreenTemplate*, IFsrmMutableCollection*, HRESULT)
    put_blocked_file_groups : Proc(IFsrmFileScreenTemplate*, IFsrmMutableCollection, HRESULT)
    get_file_screen_flags : Proc(IFsrmFileScreenTemplate*, Int32*, HRESULT)
    put_file_screen_flags : Proc(IFsrmFileScreenTemplate*, Int32, HRESULT)
    create_action : Proc(IFsrmFileScreenTemplate*, FsrmActionType, IFsrmAction*, HRESULT)
    enum_actions : Proc(IFsrmFileScreenTemplate*, IFsrmCollection*, HRESULT)
    get_name : Proc(IFsrmFileScreenTemplate*, UInt8**, HRESULT)
    put_name : Proc(IFsrmFileScreenTemplate*, UInt8*, HRESULT)
    copy_template : Proc(IFsrmFileScreenTemplate*, UInt8*, HRESULT)
    commit_and_update_derived : Proc(IFsrmFileScreenTemplate*, FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)
  end

  IFsrmFileScreenTemplate_GUID = "205bebf8-dd93-452a-95a6-32b566b35828"
  IID_IFsrmFileScreenTemplate = LibC::GUID.new(0x205bebf8_u32, 0xdd93_u16, 0x452a_u16, StaticArray[0x95_u8, 0xa6_u8, 0x32_u8, 0xb5_u8, 0x66_u8, 0xb3_u8, 0x58_u8, 0x28_u8])
  struct IFsrmFileScreenTemplate
    lpVtbl : IFsrmFileScreenTemplateVTbl*
  end

  struct IFsrmFileScreenTemplateImportedVTbl
    query_interface : Proc(IFsrmFileScreenTemplateImported*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreenTemplateImported*, UInt32)
    release : Proc(IFsrmFileScreenTemplateImported*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreenTemplateImported*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreenTemplateImported*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreenTemplateImported*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreenTemplateImported*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileScreenTemplateImported*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileScreenTemplateImported*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileScreenTemplateImported*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileScreenTemplateImported*, HRESULT)
    commit : Proc(IFsrmFileScreenTemplateImported*, HRESULT)
    get_blocked_file_groups : Proc(IFsrmFileScreenTemplateImported*, IFsrmMutableCollection*, HRESULT)
    put_blocked_file_groups : Proc(IFsrmFileScreenTemplateImported*, IFsrmMutableCollection, HRESULT)
    get_file_screen_flags : Proc(IFsrmFileScreenTemplateImported*, Int32*, HRESULT)
    put_file_screen_flags : Proc(IFsrmFileScreenTemplateImported*, Int32, HRESULT)
    create_action : Proc(IFsrmFileScreenTemplateImported*, FsrmActionType, IFsrmAction*, HRESULT)
    enum_actions : Proc(IFsrmFileScreenTemplateImported*, IFsrmCollection*, HRESULT)
    get_name : Proc(IFsrmFileScreenTemplateImported*, UInt8**, HRESULT)
    put_name : Proc(IFsrmFileScreenTemplateImported*, UInt8*, HRESULT)
    copy_template : Proc(IFsrmFileScreenTemplateImported*, UInt8*, HRESULT)
    commit_and_update_derived : Proc(IFsrmFileScreenTemplateImported*, FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)
    get_overwrite_on_commit : Proc(IFsrmFileScreenTemplateImported*, Int16*, HRESULT)
    put_overwrite_on_commit : Proc(IFsrmFileScreenTemplateImported*, Int16, HRESULT)
  end

  IFsrmFileScreenTemplateImported_GUID = "e1010359-3e5d-4ecd-9fe4-ef48622fdf30"
  IID_IFsrmFileScreenTemplateImported = LibC::GUID.new(0xe1010359_u32, 0x3e5d_u16, 0x4ecd_u16, StaticArray[0x9f_u8, 0xe4_u8, 0xef_u8, 0x48_u8, 0x62_u8, 0x2f_u8, 0xdf_u8, 0x30_u8])
  struct IFsrmFileScreenTemplateImported
    lpVtbl : IFsrmFileScreenTemplateImportedVTbl*
  end

  struct IFsrmFileScreenTemplateManagerVTbl
    query_interface : Proc(IFsrmFileScreenTemplateManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileScreenTemplateManager*, UInt32)
    release : Proc(IFsrmFileScreenTemplateManager*, UInt32)
    get_type_info_count : Proc(IFsrmFileScreenTemplateManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileScreenTemplateManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileScreenTemplateManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileScreenTemplateManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_template : Proc(IFsrmFileScreenTemplateManager*, IFsrmFileScreenTemplate*, HRESULT)
    get_template : Proc(IFsrmFileScreenTemplateManager*, UInt8*, IFsrmFileScreenTemplate*, HRESULT)
    enum_templates : Proc(IFsrmFileScreenTemplateManager*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)
    export_templates : Proc(IFsrmFileScreenTemplateManager*, VARIANT*, UInt8**, HRESULT)
    import_templates : Proc(IFsrmFileScreenTemplateManager*, UInt8*, VARIANT*, IFsrmCommittableCollection*, HRESULT)
  end

  IFsrmFileScreenTemplateManager_GUID = "cfe36cba-1949-4e74-a14f-f1d580ceaf13"
  IID_IFsrmFileScreenTemplateManager = LibC::GUID.new(0xcfe36cba_u32, 0x1949_u16, 0x4e74_u16, StaticArray[0xa1_u8, 0x4f_u8, 0xf1_u8, 0xd5_u8, 0x80_u8, 0xce_u8, 0xaf_u8, 0x13_u8])
  struct IFsrmFileScreenTemplateManager
    lpVtbl : IFsrmFileScreenTemplateManagerVTbl*
  end

  struct IFsrmReportManagerVTbl
    query_interface : Proc(IFsrmReportManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmReportManager*, UInt32)
    release : Proc(IFsrmReportManager*, UInt32)
    get_type_info_count : Proc(IFsrmReportManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmReportManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmReportManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmReportManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    enum_report_jobs : Proc(IFsrmReportManager*, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_report_job : Proc(IFsrmReportManager*, IFsrmReportJob*, HRESULT)
    get_report_job : Proc(IFsrmReportManager*, UInt8*, IFsrmReportJob*, HRESULT)
    get_output_directory : Proc(IFsrmReportManager*, FsrmReportGenerationContext, UInt8**, HRESULT)
    set_output_directory : Proc(IFsrmReportManager*, FsrmReportGenerationContext, UInt8*, HRESULT)
    is_filter_valid_for_report_type : Proc(IFsrmReportManager*, FsrmReportType, FsrmReportFilter, Int16*, HRESULT)
    get_default_filter : Proc(IFsrmReportManager*, FsrmReportType, FsrmReportFilter, VARIANT*, HRESULT)
    set_default_filter : Proc(IFsrmReportManager*, FsrmReportType, FsrmReportFilter, VARIANT, HRESULT)
    get_report_size_limit : Proc(IFsrmReportManager*, FsrmReportLimit, VARIANT*, HRESULT)
    set_report_size_limit : Proc(IFsrmReportManager*, FsrmReportLimit, VARIANT, HRESULT)
  end

  IFsrmReportManager_GUID = "27b899fe-6ffa-4481-a184-d3daade8a02b"
  IID_IFsrmReportManager = LibC::GUID.new(0x27b899fe_u32, 0x6ffa_u16, 0x4481_u16, StaticArray[0xa1_u8, 0x84_u8, 0xd3_u8, 0xda_u8, 0xad_u8, 0xe8_u8, 0xa0_u8, 0x2b_u8])
  struct IFsrmReportManager
    lpVtbl : IFsrmReportManagerVTbl*
  end

  struct IFsrmReportJobVTbl
    query_interface : Proc(IFsrmReportJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmReportJob*, UInt32)
    release : Proc(IFsrmReportJob*, UInt32)
    get_type_info_count : Proc(IFsrmReportJob*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmReportJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmReportJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmReportJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmReportJob*, Guid*, HRESULT)
    get_description : Proc(IFsrmReportJob*, UInt8**, HRESULT)
    put_description : Proc(IFsrmReportJob*, UInt8*, HRESULT)
    delete : Proc(IFsrmReportJob*, HRESULT)
    commit : Proc(IFsrmReportJob*, HRESULT)
    get_task : Proc(IFsrmReportJob*, UInt8**, HRESULT)
    put_task : Proc(IFsrmReportJob*, UInt8*, HRESULT)
    get_namespace_roots : Proc(IFsrmReportJob*, SAFEARRAY**, HRESULT)
    put_namespace_roots : Proc(IFsrmReportJob*, SAFEARRAY*, HRESULT)
    get_formats : Proc(IFsrmReportJob*, SAFEARRAY**, HRESULT)
    put_formats : Proc(IFsrmReportJob*, SAFEARRAY*, HRESULT)
    get_mail_to : Proc(IFsrmReportJob*, UInt8**, HRESULT)
    put_mail_to : Proc(IFsrmReportJob*, UInt8*, HRESULT)
    get_running_status : Proc(IFsrmReportJob*, FsrmReportRunningStatus*, HRESULT)
    get_last_run : Proc(IFsrmReportJob*, Float64*, HRESULT)
    get_last_error : Proc(IFsrmReportJob*, UInt8**, HRESULT)
    get_last_generated_in_directory : Proc(IFsrmReportJob*, UInt8**, HRESULT)
    enum_reports : Proc(IFsrmReportJob*, IFsrmCollection*, HRESULT)
    create_report : Proc(IFsrmReportJob*, FsrmReportType, IFsrmReport*, HRESULT)
    run : Proc(IFsrmReportJob*, FsrmReportGenerationContext, HRESULT)
    wait_for_completion : Proc(IFsrmReportJob*, Int32, Int16*, HRESULT)
    cancel : Proc(IFsrmReportJob*, HRESULT)
  end

  IFsrmReportJob_GUID = "38e87280-715c-4c7d-a280-ea1651a19fef"
  IID_IFsrmReportJob = LibC::GUID.new(0x38e87280_u32, 0x715c_u16, 0x4c7d_u16, StaticArray[0xa2_u8, 0x80_u8, 0xea_u8, 0x16_u8, 0x51_u8, 0xa1_u8, 0x9f_u8, 0xef_u8])
  struct IFsrmReportJob
    lpVtbl : IFsrmReportJobVTbl*
  end

  struct IFsrmReportVTbl
    query_interface : Proc(IFsrmReport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmReport*, UInt32)
    release : Proc(IFsrmReport*, UInt32)
    get_type_info_count : Proc(IFsrmReport*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmReport*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmReport*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmReport*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IFsrmReport*, FsrmReportType*, HRESULT)
    get_name : Proc(IFsrmReport*, UInt8**, HRESULT)
    put_name : Proc(IFsrmReport*, UInt8*, HRESULT)
    get_description : Proc(IFsrmReport*, UInt8**, HRESULT)
    put_description : Proc(IFsrmReport*, UInt8*, HRESULT)
    get_last_generated_file_name_prefix : Proc(IFsrmReport*, UInt8**, HRESULT)
    get_filter : Proc(IFsrmReport*, FsrmReportFilter, VARIANT*, HRESULT)
    set_filter : Proc(IFsrmReport*, FsrmReportFilter, VARIANT, HRESULT)
    delete : Proc(IFsrmReport*, HRESULT)
  end

  IFsrmReport_GUID = "d8cc81d9-46b8-4fa4-bfa5-4aa9dec9b638"
  IID_IFsrmReport = LibC::GUID.new(0xd8cc81d9_u32, 0x46b8_u16, 0x4fa4_u16, StaticArray[0xbf_u8, 0xa5_u8, 0x4a_u8, 0xa9_u8, 0xde_u8, 0xc9_u8, 0xb6_u8, 0x38_u8])
  struct IFsrmReport
    lpVtbl : IFsrmReportVTbl*
  end

  struct IFsrmReportSchedulerVTbl
    query_interface : Proc(IFsrmReportScheduler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmReportScheduler*, UInt32)
    release : Proc(IFsrmReportScheduler*, UInt32)
    get_type_info_count : Proc(IFsrmReportScheduler*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmReportScheduler*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmReportScheduler*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmReportScheduler*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    verify_namespaces : Proc(IFsrmReportScheduler*, VARIANT*, HRESULT)
    create_schedule_task : Proc(IFsrmReportScheduler*, UInt8*, VARIANT*, UInt8*, HRESULT)
    modify_schedule_task : Proc(IFsrmReportScheduler*, UInt8*, VARIANT*, UInt8*, HRESULT)
    delete_schedule_task : Proc(IFsrmReportScheduler*, UInt8*, HRESULT)
  end

  IFsrmReportScheduler_GUID = "6879caf9-6617-4484-8719-71c3d8645f94"
  IID_IFsrmReportScheduler = LibC::GUID.new(0x6879caf9_u32, 0x6617_u16, 0x4484_u16, StaticArray[0x87_u8, 0x19_u8, 0x71_u8, 0xc3_u8, 0xd8_u8, 0x64_u8, 0x5f_u8, 0x94_u8])
  struct IFsrmReportScheduler
    lpVtbl : IFsrmReportSchedulerVTbl*
  end

  struct IFsrmFileManagementJobManagerVTbl
    query_interface : Proc(IFsrmFileManagementJobManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileManagementJobManager*, UInt32)
    release : Proc(IFsrmFileManagementJobManager*, UInt32)
    get_type_info_count : Proc(IFsrmFileManagementJobManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileManagementJobManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileManagementJobManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileManagementJobManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_action_variables : Proc(IFsrmFileManagementJobManager*, SAFEARRAY**, HRESULT)
    get_action_variable_descriptions : Proc(IFsrmFileManagementJobManager*, SAFEARRAY**, HRESULT)
    enum_file_management_jobs : Proc(IFsrmFileManagementJobManager*, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_file_management_job : Proc(IFsrmFileManagementJobManager*, IFsrmFileManagementJob*, HRESULT)
    get_file_management_job : Proc(IFsrmFileManagementJobManager*, UInt8*, IFsrmFileManagementJob*, HRESULT)
  end

  IFsrmFileManagementJobManager_GUID = "ee321ecb-d95e-48e9-907c-c7685a013235"
  IID_IFsrmFileManagementJobManager = LibC::GUID.new(0xee321ecb_u32, 0xd95e_u16, 0x48e9_u16, StaticArray[0x90_u8, 0x7c_u8, 0xc7_u8, 0x68_u8, 0x5a_u8, 0x1_u8, 0x32_u8, 0x35_u8])
  struct IFsrmFileManagementJobManager
    lpVtbl : IFsrmFileManagementJobManagerVTbl*
  end

  struct IFsrmFileManagementJobVTbl
    query_interface : Proc(IFsrmFileManagementJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileManagementJob*, UInt32)
    release : Proc(IFsrmFileManagementJob*, UInt32)
    get_type_info_count : Proc(IFsrmFileManagementJob*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileManagementJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileManagementJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileManagementJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmFileManagementJob*, Guid*, HRESULT)
    get_description : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    put_description : Proc(IFsrmFileManagementJob*, UInt8*, HRESULT)
    delete : Proc(IFsrmFileManagementJob*, HRESULT)
    commit : Proc(IFsrmFileManagementJob*, HRESULT)
    get_name : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    put_name : Proc(IFsrmFileManagementJob*, UInt8*, HRESULT)
    get_namespace_roots : Proc(IFsrmFileManagementJob*, SAFEARRAY**, HRESULT)
    put_namespace_roots : Proc(IFsrmFileManagementJob*, SAFEARRAY*, HRESULT)
    get_enabled : Proc(IFsrmFileManagementJob*, Int16*, HRESULT)
    put_enabled : Proc(IFsrmFileManagementJob*, Int16, HRESULT)
    get_operation_type : Proc(IFsrmFileManagementJob*, FsrmFileManagementType*, HRESULT)
    put_operation_type : Proc(IFsrmFileManagementJob*, FsrmFileManagementType, HRESULT)
    get_expiration_directory : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    put_expiration_directory : Proc(IFsrmFileManagementJob*, UInt8*, HRESULT)
    get_custom_action : Proc(IFsrmFileManagementJob*, IFsrmActionCommand*, HRESULT)
    get_notifications : Proc(IFsrmFileManagementJob*, SAFEARRAY**, HRESULT)
    get_logging : Proc(IFsrmFileManagementJob*, Int32*, HRESULT)
    put_logging : Proc(IFsrmFileManagementJob*, Int32, HRESULT)
    get_report_enabled : Proc(IFsrmFileManagementJob*, Int16*, HRESULT)
    put_report_enabled : Proc(IFsrmFileManagementJob*, Int16, HRESULT)
    get_formats : Proc(IFsrmFileManagementJob*, SAFEARRAY**, HRESULT)
    put_formats : Proc(IFsrmFileManagementJob*, SAFEARRAY*, HRESULT)
    get_mail_to : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    put_mail_to : Proc(IFsrmFileManagementJob*, UInt8*, HRESULT)
    get_days_since_file_created : Proc(IFsrmFileManagementJob*, Int32*, HRESULT)
    put_days_since_file_created : Proc(IFsrmFileManagementJob*, Int32, HRESULT)
    get_days_since_file_last_accessed : Proc(IFsrmFileManagementJob*, Int32*, HRESULT)
    put_days_since_file_last_accessed : Proc(IFsrmFileManagementJob*, Int32, HRESULT)
    get_days_since_file_last_modified : Proc(IFsrmFileManagementJob*, Int32*, HRESULT)
    put_days_since_file_last_modified : Proc(IFsrmFileManagementJob*, Int32, HRESULT)
    get_property_conditions : Proc(IFsrmFileManagementJob*, IFsrmCollection*, HRESULT)
    get_from_date : Proc(IFsrmFileManagementJob*, Float64*, HRESULT)
    put_from_date : Proc(IFsrmFileManagementJob*, Float64, HRESULT)
    get_task : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    put_task : Proc(IFsrmFileManagementJob*, UInt8*, HRESULT)
    get_parameters : Proc(IFsrmFileManagementJob*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmFileManagementJob*, SAFEARRAY*, HRESULT)
    get_running_status : Proc(IFsrmFileManagementJob*, FsrmReportRunningStatus*, HRESULT)
    get_last_error : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    get_last_report_path_without_extension : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    get_last_run : Proc(IFsrmFileManagementJob*, Float64*, HRESULT)
    get_file_name_pattern : Proc(IFsrmFileManagementJob*, UInt8**, HRESULT)
    put_file_name_pattern : Proc(IFsrmFileManagementJob*, UInt8*, HRESULT)
    run : Proc(IFsrmFileManagementJob*, FsrmReportGenerationContext, HRESULT)
    wait_for_completion : Proc(IFsrmFileManagementJob*, Int32, Int16*, HRESULT)
    cancel : Proc(IFsrmFileManagementJob*, HRESULT)
    add_notification : Proc(IFsrmFileManagementJob*, Int32, HRESULT)
    delete_notification : Proc(IFsrmFileManagementJob*, Int32, HRESULT)
    modify_notification : Proc(IFsrmFileManagementJob*, Int32, Int32, HRESULT)
    create_notification_action : Proc(IFsrmFileManagementJob*, Int32, FsrmActionType, IFsrmAction*, HRESULT)
    enum_notification_actions : Proc(IFsrmFileManagementJob*, Int32, IFsrmCollection*, HRESULT)
    create_property_condition : Proc(IFsrmFileManagementJob*, UInt8*, IFsrmPropertyCondition*, HRESULT)
    create_custom_action : Proc(IFsrmFileManagementJob*, IFsrmActionCommand*, HRESULT)
  end

  IFsrmFileManagementJob_GUID = "0770687e-9f36-4d6f-8778-599d188461c9"
  IID_IFsrmFileManagementJob = LibC::GUID.new(0x770687e_u32, 0x9f36_u16, 0x4d6f_u16, StaticArray[0x87_u8, 0x78_u8, 0x59_u8, 0x9d_u8, 0x18_u8, 0x84_u8, 0x61_u8, 0xc9_u8])
  struct IFsrmFileManagementJob
    lpVtbl : IFsrmFileManagementJobVTbl*
  end

  struct IFsrmPropertyConditionVTbl
    query_interface : Proc(IFsrmPropertyCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPropertyCondition*, UInt32)
    release : Proc(IFsrmPropertyCondition*, UInt32)
    get_type_info_count : Proc(IFsrmPropertyCondition*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPropertyCondition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPropertyCondition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPropertyCondition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFsrmPropertyCondition*, UInt8**, HRESULT)
    put_name : Proc(IFsrmPropertyCondition*, UInt8*, HRESULT)
    get_type : Proc(IFsrmPropertyCondition*, FsrmPropertyConditionType*, HRESULT)
    put_type : Proc(IFsrmPropertyCondition*, FsrmPropertyConditionType, HRESULT)
    get_value : Proc(IFsrmPropertyCondition*, UInt8**, HRESULT)
    put_value : Proc(IFsrmPropertyCondition*, UInt8*, HRESULT)
    delete : Proc(IFsrmPropertyCondition*, HRESULT)
  end

  IFsrmPropertyCondition_GUID = "326af66f-2ac0-4f68-bf8c-4759f054fa29"
  IID_IFsrmPropertyCondition = LibC::GUID.new(0x326af66f_u32, 0x2ac0_u16, 0x4f68_u16, StaticArray[0xbf_u8, 0x8c_u8, 0x47_u8, 0x59_u8, 0xf0_u8, 0x54_u8, 0xfa_u8, 0x29_u8])
  struct IFsrmPropertyCondition
    lpVtbl : IFsrmPropertyConditionVTbl*
  end

  struct IFsrmFileConditionVTbl
    query_interface : Proc(IFsrmFileCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileCondition*, UInt32)
    release : Proc(IFsrmFileCondition*, UInt32)
    get_type_info_count : Proc(IFsrmFileCondition*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileCondition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileCondition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileCondition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IFsrmFileCondition*, FsrmFileConditionType*, HRESULT)
    delete : Proc(IFsrmFileCondition*, HRESULT)
  end

  IFsrmFileCondition_GUID = "70684ffc-691a-4a1a-b922-97752e138cc1"
  IID_IFsrmFileCondition = LibC::GUID.new(0x70684ffc_u32, 0x691a_u16, 0x4a1a_u16, StaticArray[0xb9_u8, 0x22_u8, 0x97_u8, 0x75_u8, 0x2e_u8, 0x13_u8, 0x8c_u8, 0xc1_u8])
  struct IFsrmFileCondition
    lpVtbl : IFsrmFileConditionVTbl*
  end

  struct IFsrmFileConditionPropertyVTbl
    query_interface : Proc(IFsrmFileConditionProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmFileConditionProperty*, UInt32)
    release : Proc(IFsrmFileConditionProperty*, UInt32)
    get_type_info_count : Proc(IFsrmFileConditionProperty*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmFileConditionProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmFileConditionProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmFileConditionProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_type : Proc(IFsrmFileConditionProperty*, FsrmFileConditionType*, HRESULT)
    delete : Proc(IFsrmFileConditionProperty*, HRESULT)
    get_property_name : Proc(IFsrmFileConditionProperty*, UInt8**, HRESULT)
    put_property_name : Proc(IFsrmFileConditionProperty*, UInt8*, HRESULT)
    get_property_id : Proc(IFsrmFileConditionProperty*, FsrmFileSystemPropertyId*, HRESULT)
    put_property_id : Proc(IFsrmFileConditionProperty*, FsrmFileSystemPropertyId, HRESULT)
    get_operator : Proc(IFsrmFileConditionProperty*, FsrmPropertyConditionType*, HRESULT)
    put_operator : Proc(IFsrmFileConditionProperty*, FsrmPropertyConditionType, HRESULT)
    get_value_type : Proc(IFsrmFileConditionProperty*, FsrmPropertyValueType*, HRESULT)
    put_value_type : Proc(IFsrmFileConditionProperty*, FsrmPropertyValueType, HRESULT)
    get_value : Proc(IFsrmFileConditionProperty*, VARIANT*, HRESULT)
    put_value : Proc(IFsrmFileConditionProperty*, VARIANT, HRESULT)
  end

  IFsrmFileConditionProperty_GUID = "81926775-b981-4479-988f-da171d627360"
  IID_IFsrmFileConditionProperty = LibC::GUID.new(0x81926775_u32, 0xb981_u16, 0x4479_u16, StaticArray[0x98_u8, 0x8f_u8, 0xda_u8, 0x17_u8, 0x1d_u8, 0x62_u8, 0x73_u8, 0x60_u8])
  struct IFsrmFileConditionProperty
    lpVtbl : IFsrmFileConditionPropertyVTbl*
  end

  struct IFsrmPropertyDefinitionVTbl
    query_interface : Proc(IFsrmPropertyDefinition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPropertyDefinition*, UInt32)
    release : Proc(IFsrmPropertyDefinition*, UInt32)
    get_type_info_count : Proc(IFsrmPropertyDefinition*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPropertyDefinition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPropertyDefinition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPropertyDefinition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmPropertyDefinition*, Guid*, HRESULT)
    get_description : Proc(IFsrmPropertyDefinition*, UInt8**, HRESULT)
    put_description : Proc(IFsrmPropertyDefinition*, UInt8*, HRESULT)
    delete : Proc(IFsrmPropertyDefinition*, HRESULT)
    commit : Proc(IFsrmPropertyDefinition*, HRESULT)
    get_name : Proc(IFsrmPropertyDefinition*, UInt8**, HRESULT)
    put_name : Proc(IFsrmPropertyDefinition*, UInt8*, HRESULT)
    get_type : Proc(IFsrmPropertyDefinition*, FsrmPropertyDefinitionType*, HRESULT)
    put_type : Proc(IFsrmPropertyDefinition*, FsrmPropertyDefinitionType, HRESULT)
    get_possible_values : Proc(IFsrmPropertyDefinition*, SAFEARRAY**, HRESULT)
    put_possible_values : Proc(IFsrmPropertyDefinition*, SAFEARRAY*, HRESULT)
    get_value_descriptions : Proc(IFsrmPropertyDefinition*, SAFEARRAY**, HRESULT)
    put_value_descriptions : Proc(IFsrmPropertyDefinition*, SAFEARRAY*, HRESULT)
    get_parameters : Proc(IFsrmPropertyDefinition*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmPropertyDefinition*, SAFEARRAY*, HRESULT)
  end

  IFsrmPropertyDefinition_GUID = "ede0150f-e9a3-419c-877c-01fe5d24c5d3"
  IID_IFsrmPropertyDefinition = LibC::GUID.new(0xede0150f_u32, 0xe9a3_u16, 0x419c_u16, StaticArray[0x87_u8, 0x7c_u8, 0x1_u8, 0xfe_u8, 0x5d_u8, 0x24_u8, 0xc5_u8, 0xd3_u8])
  struct IFsrmPropertyDefinition
    lpVtbl : IFsrmPropertyDefinitionVTbl*
  end

  struct IFsrmPropertyDefinition2VTbl
    query_interface : Proc(IFsrmPropertyDefinition2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPropertyDefinition2*, UInt32)
    release : Proc(IFsrmPropertyDefinition2*, UInt32)
    get_type_info_count : Proc(IFsrmPropertyDefinition2*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPropertyDefinition2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPropertyDefinition2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPropertyDefinition2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmPropertyDefinition2*, Guid*, HRESULT)
    get_description : Proc(IFsrmPropertyDefinition2*, UInt8**, HRESULT)
    put_description : Proc(IFsrmPropertyDefinition2*, UInt8*, HRESULT)
    delete : Proc(IFsrmPropertyDefinition2*, HRESULT)
    commit : Proc(IFsrmPropertyDefinition2*, HRESULT)
    get_name : Proc(IFsrmPropertyDefinition2*, UInt8**, HRESULT)
    put_name : Proc(IFsrmPropertyDefinition2*, UInt8*, HRESULT)
    get_type : Proc(IFsrmPropertyDefinition2*, FsrmPropertyDefinitionType*, HRESULT)
    put_type : Proc(IFsrmPropertyDefinition2*, FsrmPropertyDefinitionType, HRESULT)
    get_possible_values : Proc(IFsrmPropertyDefinition2*, SAFEARRAY**, HRESULT)
    put_possible_values : Proc(IFsrmPropertyDefinition2*, SAFEARRAY*, HRESULT)
    get_value_descriptions : Proc(IFsrmPropertyDefinition2*, SAFEARRAY**, HRESULT)
    put_value_descriptions : Proc(IFsrmPropertyDefinition2*, SAFEARRAY*, HRESULT)
    get_parameters : Proc(IFsrmPropertyDefinition2*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmPropertyDefinition2*, SAFEARRAY*, HRESULT)
    get_property_definition_flags : Proc(IFsrmPropertyDefinition2*, Int32*, HRESULT)
    get_display_name : Proc(IFsrmPropertyDefinition2*, UInt8**, HRESULT)
    put_display_name : Proc(IFsrmPropertyDefinition2*, UInt8*, HRESULT)
    get_applies_to : Proc(IFsrmPropertyDefinition2*, Int32*, HRESULT)
    get_value_definitions : Proc(IFsrmPropertyDefinition2*, IFsrmCollection*, HRESULT)
  end

  IFsrmPropertyDefinition2_GUID = "47782152-d16c-4229-b4e1-0ddfe308b9f6"
  IID_IFsrmPropertyDefinition2 = LibC::GUID.new(0x47782152_u32, 0xd16c_u16, 0x4229_u16, StaticArray[0xb4_u8, 0xe1_u8, 0xd_u8, 0xdf_u8, 0xe3_u8, 0x8_u8, 0xb9_u8, 0xf6_u8])
  struct IFsrmPropertyDefinition2
    lpVtbl : IFsrmPropertyDefinition2VTbl*
  end

  struct IFsrmPropertyDefinitionValueVTbl
    query_interface : Proc(IFsrmPropertyDefinitionValue*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPropertyDefinitionValue*, UInt32)
    release : Proc(IFsrmPropertyDefinitionValue*, UInt32)
    get_type_info_count : Proc(IFsrmPropertyDefinitionValue*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPropertyDefinitionValue*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPropertyDefinitionValue*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPropertyDefinitionValue*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFsrmPropertyDefinitionValue*, UInt8**, HRESULT)
    get_display_name : Proc(IFsrmPropertyDefinitionValue*, UInt8**, HRESULT)
    get_description : Proc(IFsrmPropertyDefinitionValue*, UInt8**, HRESULT)
    get_unique_id : Proc(IFsrmPropertyDefinitionValue*, UInt8**, HRESULT)
  end

  IFsrmPropertyDefinitionValue_GUID = "e946d148-bd67-4178-8e22-1c44925ed710"
  IID_IFsrmPropertyDefinitionValue = LibC::GUID.new(0xe946d148_u32, 0xbd67_u16, 0x4178_u16, StaticArray[0x8e_u8, 0x22_u8, 0x1c_u8, 0x44_u8, 0x92_u8, 0x5e_u8, 0xd7_u8, 0x10_u8])
  struct IFsrmPropertyDefinitionValue
    lpVtbl : IFsrmPropertyDefinitionValueVTbl*
  end

  struct IFsrmPropertyVTbl
    query_interface : Proc(IFsrmProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmProperty*, UInt32)
    release : Proc(IFsrmProperty*, UInt32)
    get_type_info_count : Proc(IFsrmProperty*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFsrmProperty*, UInt8**, HRESULT)
    get_value : Proc(IFsrmProperty*, UInt8**, HRESULT)
    get_sources : Proc(IFsrmProperty*, SAFEARRAY**, HRESULT)
    get_property_flags : Proc(IFsrmProperty*, Int32*, HRESULT)
  end

  IFsrmProperty_GUID = "4a73fee4-4102-4fcc-9ffb-38614f9ee768"
  IID_IFsrmProperty = LibC::GUID.new(0x4a73fee4_u32, 0x4102_u16, 0x4fcc_u16, StaticArray[0x9f_u8, 0xfb_u8, 0x38_u8, 0x61_u8, 0x4f_u8, 0x9e_u8, 0xe7_u8, 0x68_u8])
  struct IFsrmProperty
    lpVtbl : IFsrmPropertyVTbl*
  end

  struct IFsrmRuleVTbl
    query_interface : Proc(IFsrmRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmRule*, UInt32)
    release : Proc(IFsrmRule*, UInt32)
    get_type_info_count : Proc(IFsrmRule*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmRule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmRule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmRule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmRule*, Guid*, HRESULT)
    get_description : Proc(IFsrmRule*, UInt8**, HRESULT)
    put_description : Proc(IFsrmRule*, UInt8*, HRESULT)
    delete : Proc(IFsrmRule*, HRESULT)
    commit : Proc(IFsrmRule*, HRESULT)
    get_name : Proc(IFsrmRule*, UInt8**, HRESULT)
    put_name : Proc(IFsrmRule*, UInt8*, HRESULT)
    get_rule_type : Proc(IFsrmRule*, FsrmRuleType*, HRESULT)
    get_module_definition_name : Proc(IFsrmRule*, UInt8**, HRESULT)
    put_module_definition_name : Proc(IFsrmRule*, UInt8*, HRESULT)
    get_namespace_roots : Proc(IFsrmRule*, SAFEARRAY**, HRESULT)
    put_namespace_roots : Proc(IFsrmRule*, SAFEARRAY*, HRESULT)
    get_rule_flags : Proc(IFsrmRule*, Int32*, HRESULT)
    put_rule_flags : Proc(IFsrmRule*, Int32, HRESULT)
    get_parameters : Proc(IFsrmRule*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmRule*, SAFEARRAY*, HRESULT)
    get_last_modified : Proc(IFsrmRule*, VARIANT*, HRESULT)
  end

  IFsrmRule_GUID = "cb0df960-16f5-4495-9079-3f9360d831df"
  IID_IFsrmRule = LibC::GUID.new(0xcb0df960_u32, 0x16f5_u16, 0x4495_u16, StaticArray[0x90_u8, 0x79_u8, 0x3f_u8, 0x93_u8, 0x60_u8, 0xd8_u8, 0x31_u8, 0xdf_u8])
  struct IFsrmRule
    lpVtbl : IFsrmRuleVTbl*
  end

  struct IFsrmClassificationRuleVTbl
    query_interface : Proc(IFsrmClassificationRule*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmClassificationRule*, UInt32)
    release : Proc(IFsrmClassificationRule*, UInt32)
    get_type_info_count : Proc(IFsrmClassificationRule*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmClassificationRule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmClassificationRule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmClassificationRule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmClassificationRule*, Guid*, HRESULT)
    get_description : Proc(IFsrmClassificationRule*, UInt8**, HRESULT)
    put_description : Proc(IFsrmClassificationRule*, UInt8*, HRESULT)
    delete : Proc(IFsrmClassificationRule*, HRESULT)
    commit : Proc(IFsrmClassificationRule*, HRESULT)
    get_name : Proc(IFsrmClassificationRule*, UInt8**, HRESULT)
    put_name : Proc(IFsrmClassificationRule*, UInt8*, HRESULT)
    get_rule_type : Proc(IFsrmClassificationRule*, FsrmRuleType*, HRESULT)
    get_module_definition_name : Proc(IFsrmClassificationRule*, UInt8**, HRESULT)
    put_module_definition_name : Proc(IFsrmClassificationRule*, UInt8*, HRESULT)
    get_namespace_roots : Proc(IFsrmClassificationRule*, SAFEARRAY**, HRESULT)
    put_namespace_roots : Proc(IFsrmClassificationRule*, SAFEARRAY*, HRESULT)
    get_rule_flags : Proc(IFsrmClassificationRule*, Int32*, HRESULT)
    put_rule_flags : Proc(IFsrmClassificationRule*, Int32, HRESULT)
    get_parameters : Proc(IFsrmClassificationRule*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmClassificationRule*, SAFEARRAY*, HRESULT)
    get_last_modified : Proc(IFsrmClassificationRule*, VARIANT*, HRESULT)
    get_execution_option : Proc(IFsrmClassificationRule*, FsrmExecutionOption*, HRESULT)
    put_execution_option : Proc(IFsrmClassificationRule*, FsrmExecutionOption, HRESULT)
    get_property_affected : Proc(IFsrmClassificationRule*, UInt8**, HRESULT)
    put_property_affected : Proc(IFsrmClassificationRule*, UInt8*, HRESULT)
    get_value : Proc(IFsrmClassificationRule*, UInt8**, HRESULT)
    put_value : Proc(IFsrmClassificationRule*, UInt8*, HRESULT)
  end

  IFsrmClassificationRule_GUID = "afc052c2-5315-45ab-841b-c6db0e120148"
  IID_IFsrmClassificationRule = LibC::GUID.new(0xafc052c2_u32, 0x5315_u16, 0x45ab_u16, StaticArray[0x84_u8, 0x1b_u8, 0xc6_u8, 0xdb_u8, 0xe_u8, 0x12_u8, 0x1_u8, 0x48_u8])
  struct IFsrmClassificationRule
    lpVtbl : IFsrmClassificationRuleVTbl*
  end

  struct IFsrmPipelineModuleDefinitionVTbl
    query_interface : Proc(IFsrmPipelineModuleDefinition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPipelineModuleDefinition*, UInt32)
    release : Proc(IFsrmPipelineModuleDefinition*, UInt32)
    get_type_info_count : Proc(IFsrmPipelineModuleDefinition*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPipelineModuleDefinition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPipelineModuleDefinition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPipelineModuleDefinition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmPipelineModuleDefinition*, Guid*, HRESULT)
    get_description : Proc(IFsrmPipelineModuleDefinition*, UInt8**, HRESULT)
    put_description : Proc(IFsrmPipelineModuleDefinition*, UInt8*, HRESULT)
    delete : Proc(IFsrmPipelineModuleDefinition*, HRESULT)
    commit : Proc(IFsrmPipelineModuleDefinition*, HRESULT)
    get_module_clsid : Proc(IFsrmPipelineModuleDefinition*, UInt8**, HRESULT)
    put_module_clsid : Proc(IFsrmPipelineModuleDefinition*, UInt8*, HRESULT)
    get_name : Proc(IFsrmPipelineModuleDefinition*, UInt8**, HRESULT)
    put_name : Proc(IFsrmPipelineModuleDefinition*, UInt8*, HRESULT)
    get_company : Proc(IFsrmPipelineModuleDefinition*, UInt8**, HRESULT)
    put_company : Proc(IFsrmPipelineModuleDefinition*, UInt8*, HRESULT)
    get_version : Proc(IFsrmPipelineModuleDefinition*, UInt8**, HRESULT)
    put_version : Proc(IFsrmPipelineModuleDefinition*, UInt8*, HRESULT)
    get_module_type : Proc(IFsrmPipelineModuleDefinition*, FsrmPipelineModuleType*, HRESULT)
    get_enabled : Proc(IFsrmPipelineModuleDefinition*, Int16*, HRESULT)
    put_enabled : Proc(IFsrmPipelineModuleDefinition*, Int16, HRESULT)
    get_needs_file_content : Proc(IFsrmPipelineModuleDefinition*, Int16*, HRESULT)
    put_needs_file_content : Proc(IFsrmPipelineModuleDefinition*, Int16, HRESULT)
    get_account : Proc(IFsrmPipelineModuleDefinition*, FsrmAccountType*, HRESULT)
    put_account : Proc(IFsrmPipelineModuleDefinition*, FsrmAccountType, HRESULT)
    get_supported_extensions : Proc(IFsrmPipelineModuleDefinition*, SAFEARRAY**, HRESULT)
    put_supported_extensions : Proc(IFsrmPipelineModuleDefinition*, SAFEARRAY*, HRESULT)
    get_parameters : Proc(IFsrmPipelineModuleDefinition*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmPipelineModuleDefinition*, SAFEARRAY*, HRESULT)
  end

  IFsrmPipelineModuleDefinition_GUID = "515c1277-2c81-440e-8fcf-367921ed4f59"
  IID_IFsrmPipelineModuleDefinition = LibC::GUID.new(0x515c1277_u32, 0x2c81_u16, 0x440e_u16, StaticArray[0x8f_u8, 0xcf_u8, 0x36_u8, 0x79_u8, 0x21_u8, 0xed_u8, 0x4f_u8, 0x59_u8])
  struct IFsrmPipelineModuleDefinition
    lpVtbl : IFsrmPipelineModuleDefinitionVTbl*
  end

  struct IFsrmClassifierModuleDefinitionVTbl
    query_interface : Proc(IFsrmClassifierModuleDefinition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmClassifierModuleDefinition*, UInt32)
    release : Proc(IFsrmClassifierModuleDefinition*, UInt32)
    get_type_info_count : Proc(IFsrmClassifierModuleDefinition*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmClassifierModuleDefinition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmClassifierModuleDefinition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmClassifierModuleDefinition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmClassifierModuleDefinition*, Guid*, HRESULT)
    get_description : Proc(IFsrmClassifierModuleDefinition*, UInt8**, HRESULT)
    put_description : Proc(IFsrmClassifierModuleDefinition*, UInt8*, HRESULT)
    delete : Proc(IFsrmClassifierModuleDefinition*, HRESULT)
    commit : Proc(IFsrmClassifierModuleDefinition*, HRESULT)
    get_module_clsid : Proc(IFsrmClassifierModuleDefinition*, UInt8**, HRESULT)
    put_module_clsid : Proc(IFsrmClassifierModuleDefinition*, UInt8*, HRESULT)
    get_name : Proc(IFsrmClassifierModuleDefinition*, UInt8**, HRESULT)
    put_name : Proc(IFsrmClassifierModuleDefinition*, UInt8*, HRESULT)
    get_company : Proc(IFsrmClassifierModuleDefinition*, UInt8**, HRESULT)
    put_company : Proc(IFsrmClassifierModuleDefinition*, UInt8*, HRESULT)
    get_version : Proc(IFsrmClassifierModuleDefinition*, UInt8**, HRESULT)
    put_version : Proc(IFsrmClassifierModuleDefinition*, UInt8*, HRESULT)
    get_module_type : Proc(IFsrmClassifierModuleDefinition*, FsrmPipelineModuleType*, HRESULT)
    get_enabled : Proc(IFsrmClassifierModuleDefinition*, Int16*, HRESULT)
    put_enabled : Proc(IFsrmClassifierModuleDefinition*, Int16, HRESULT)
    get_needs_file_content : Proc(IFsrmClassifierModuleDefinition*, Int16*, HRESULT)
    put_needs_file_content : Proc(IFsrmClassifierModuleDefinition*, Int16, HRESULT)
    get_account : Proc(IFsrmClassifierModuleDefinition*, FsrmAccountType*, HRESULT)
    put_account : Proc(IFsrmClassifierModuleDefinition*, FsrmAccountType, HRESULT)
    get_supported_extensions : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY**, HRESULT)
    put_supported_extensions : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY*, HRESULT)
    get_parameters : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY*, HRESULT)
    get_properties_affected : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY**, HRESULT)
    put_properties_affected : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY*, HRESULT)
    get_properties_used : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY**, HRESULT)
    put_properties_used : Proc(IFsrmClassifierModuleDefinition*, SAFEARRAY*, HRESULT)
    get_needs_explicit_value : Proc(IFsrmClassifierModuleDefinition*, Int16*, HRESULT)
    put_needs_explicit_value : Proc(IFsrmClassifierModuleDefinition*, Int16, HRESULT)
  end

  IFsrmClassifierModuleDefinition_GUID = "bb36ea26-6318-4b8c-8592-f72dd602e7a5"
  IID_IFsrmClassifierModuleDefinition = LibC::GUID.new(0xbb36ea26_u32, 0x6318_u16, 0x4b8c_u16, StaticArray[0x85_u8, 0x92_u8, 0xf7_u8, 0x2d_u8, 0xd6_u8, 0x2_u8, 0xe7_u8, 0xa5_u8])
  struct IFsrmClassifierModuleDefinition
    lpVtbl : IFsrmClassifierModuleDefinitionVTbl*
  end

  struct IFsrmStorageModuleDefinitionVTbl
    query_interface : Proc(IFsrmStorageModuleDefinition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmStorageModuleDefinition*, UInt32)
    release : Proc(IFsrmStorageModuleDefinition*, UInt32)
    get_type_info_count : Proc(IFsrmStorageModuleDefinition*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmStorageModuleDefinition*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmStorageModuleDefinition*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmStorageModuleDefinition*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_id : Proc(IFsrmStorageModuleDefinition*, Guid*, HRESULT)
    get_description : Proc(IFsrmStorageModuleDefinition*, UInt8**, HRESULT)
    put_description : Proc(IFsrmStorageModuleDefinition*, UInt8*, HRESULT)
    delete : Proc(IFsrmStorageModuleDefinition*, HRESULT)
    commit : Proc(IFsrmStorageModuleDefinition*, HRESULT)
    get_module_clsid : Proc(IFsrmStorageModuleDefinition*, UInt8**, HRESULT)
    put_module_clsid : Proc(IFsrmStorageModuleDefinition*, UInt8*, HRESULT)
    get_name : Proc(IFsrmStorageModuleDefinition*, UInt8**, HRESULT)
    put_name : Proc(IFsrmStorageModuleDefinition*, UInt8*, HRESULT)
    get_company : Proc(IFsrmStorageModuleDefinition*, UInt8**, HRESULT)
    put_company : Proc(IFsrmStorageModuleDefinition*, UInt8*, HRESULT)
    get_version : Proc(IFsrmStorageModuleDefinition*, UInt8**, HRESULT)
    put_version : Proc(IFsrmStorageModuleDefinition*, UInt8*, HRESULT)
    get_module_type : Proc(IFsrmStorageModuleDefinition*, FsrmPipelineModuleType*, HRESULT)
    get_enabled : Proc(IFsrmStorageModuleDefinition*, Int16*, HRESULT)
    put_enabled : Proc(IFsrmStorageModuleDefinition*, Int16, HRESULT)
    get_needs_file_content : Proc(IFsrmStorageModuleDefinition*, Int16*, HRESULT)
    put_needs_file_content : Proc(IFsrmStorageModuleDefinition*, Int16, HRESULT)
    get_account : Proc(IFsrmStorageModuleDefinition*, FsrmAccountType*, HRESULT)
    put_account : Proc(IFsrmStorageModuleDefinition*, FsrmAccountType, HRESULT)
    get_supported_extensions : Proc(IFsrmStorageModuleDefinition*, SAFEARRAY**, HRESULT)
    put_supported_extensions : Proc(IFsrmStorageModuleDefinition*, SAFEARRAY*, HRESULT)
    get_parameters : Proc(IFsrmStorageModuleDefinition*, SAFEARRAY**, HRESULT)
    put_parameters : Proc(IFsrmStorageModuleDefinition*, SAFEARRAY*, HRESULT)
    get_capabilities : Proc(IFsrmStorageModuleDefinition*, FsrmStorageModuleCaps*, HRESULT)
    put_capabilities : Proc(IFsrmStorageModuleDefinition*, FsrmStorageModuleCaps, HRESULT)
    get_storage_type : Proc(IFsrmStorageModuleDefinition*, FsrmStorageModuleType*, HRESULT)
    put_storage_type : Proc(IFsrmStorageModuleDefinition*, FsrmStorageModuleType, HRESULT)
    get_updates_file_content : Proc(IFsrmStorageModuleDefinition*, Int16*, HRESULT)
    put_updates_file_content : Proc(IFsrmStorageModuleDefinition*, Int16, HRESULT)
  end

  IFsrmStorageModuleDefinition_GUID = "15a81350-497d-4aba-80e9-d4dbcc5521fe"
  IID_IFsrmStorageModuleDefinition = LibC::GUID.new(0x15a81350_u32, 0x497d_u16, 0x4aba_u16, StaticArray[0x80_u8, 0xe9_u8, 0xd4_u8, 0xdb_u8, 0xcc_u8, 0x55_u8, 0x21_u8, 0xfe_u8])
  struct IFsrmStorageModuleDefinition
    lpVtbl : IFsrmStorageModuleDefinitionVTbl*
  end

  struct IFsrmClassificationManagerVTbl
    query_interface : Proc(IFsrmClassificationManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmClassificationManager*, UInt32)
    release : Proc(IFsrmClassificationManager*, UInt32)
    get_type_info_count : Proc(IFsrmClassificationManager*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmClassificationManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmClassificationManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmClassificationManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_classification_report_formats : Proc(IFsrmClassificationManager*, SAFEARRAY**, HRESULT)
    put_classification_report_formats : Proc(IFsrmClassificationManager*, SAFEARRAY*, HRESULT)
    get_logging : Proc(IFsrmClassificationManager*, Int32*, HRESULT)
    put_logging : Proc(IFsrmClassificationManager*, Int32, HRESULT)
    get_classification_report_mail_to : Proc(IFsrmClassificationManager*, UInt8**, HRESULT)
    put_classification_report_mail_to : Proc(IFsrmClassificationManager*, UInt8*, HRESULT)
    get_classification_report_enabled : Proc(IFsrmClassificationManager*, Int16*, HRESULT)
    put_classification_report_enabled : Proc(IFsrmClassificationManager*, Int16, HRESULT)
    get_classification_last_report_path_without_extension : Proc(IFsrmClassificationManager*, UInt8**, HRESULT)
    get_classification_last_error : Proc(IFsrmClassificationManager*, UInt8**, HRESULT)
    get_classification_running_status : Proc(IFsrmClassificationManager*, FsrmReportRunningStatus*, HRESULT)
    enum_property_definitions : Proc(IFsrmClassificationManager*, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_property_definition : Proc(IFsrmClassificationManager*, IFsrmPropertyDefinition*, HRESULT)
    get_property_definition : Proc(IFsrmClassificationManager*, UInt8*, IFsrmPropertyDefinition*, HRESULT)
    enum_rules : Proc(IFsrmClassificationManager*, FsrmRuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_rule : Proc(IFsrmClassificationManager*, FsrmRuleType, IFsrmRule*, HRESULT)
    get_rule : Proc(IFsrmClassificationManager*, UInt8*, FsrmRuleType, IFsrmRule*, HRESULT)
    enum_module_definitions : Proc(IFsrmClassificationManager*, FsrmPipelineModuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_module_definition : Proc(IFsrmClassificationManager*, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)
    get_module_definition : Proc(IFsrmClassificationManager*, UInt8*, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)
    run_classification : Proc(IFsrmClassificationManager*, FsrmReportGenerationContext, UInt8*, HRESULT)
    wait_for_classification_completion : Proc(IFsrmClassificationManager*, Int32, Int16*, HRESULT)
    cancel_classification : Proc(IFsrmClassificationManager*, HRESULT)
    enum_file_properties : Proc(IFsrmClassificationManager*, UInt8*, FsrmGetFilePropertyOptions, IFsrmCollection*, HRESULT)
    get_file_property : Proc(IFsrmClassificationManager*, UInt8*, UInt8*, FsrmGetFilePropertyOptions, IFsrmProperty*, HRESULT)
    set_file_property : Proc(IFsrmClassificationManager*, UInt8*, UInt8*, UInt8*, HRESULT)
    clear_file_property : Proc(IFsrmClassificationManager*, UInt8*, UInt8*, HRESULT)
  end

  IFsrmClassificationManager_GUID = "d2dc89da-ee91-48a0-85d8-cc72a56f7d04"
  IID_IFsrmClassificationManager = LibC::GUID.new(0xd2dc89da_u32, 0xee91_u16, 0x48a0_u16, StaticArray[0x85_u8, 0xd8_u8, 0xcc_u8, 0x72_u8, 0xa5_u8, 0x6f_u8, 0x7d_u8, 0x4_u8])
  struct IFsrmClassificationManager
    lpVtbl : IFsrmClassificationManagerVTbl*
  end

  struct IFsrmClassificationManager2VTbl
    query_interface : Proc(IFsrmClassificationManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmClassificationManager2*, UInt32)
    release : Proc(IFsrmClassificationManager2*, UInt32)
    get_type_info_count : Proc(IFsrmClassificationManager2*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmClassificationManager2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmClassificationManager2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmClassificationManager2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_classification_report_formats : Proc(IFsrmClassificationManager2*, SAFEARRAY**, HRESULT)
    put_classification_report_formats : Proc(IFsrmClassificationManager2*, SAFEARRAY*, HRESULT)
    get_logging : Proc(IFsrmClassificationManager2*, Int32*, HRESULT)
    put_logging : Proc(IFsrmClassificationManager2*, Int32, HRESULT)
    get_classification_report_mail_to : Proc(IFsrmClassificationManager2*, UInt8**, HRESULT)
    put_classification_report_mail_to : Proc(IFsrmClassificationManager2*, UInt8*, HRESULT)
    get_classification_report_enabled : Proc(IFsrmClassificationManager2*, Int16*, HRESULT)
    put_classification_report_enabled : Proc(IFsrmClassificationManager2*, Int16, HRESULT)
    get_classification_last_report_path_without_extension : Proc(IFsrmClassificationManager2*, UInt8**, HRESULT)
    get_classification_last_error : Proc(IFsrmClassificationManager2*, UInt8**, HRESULT)
    get_classification_running_status : Proc(IFsrmClassificationManager2*, FsrmReportRunningStatus*, HRESULT)
    enum_property_definitions : Proc(IFsrmClassificationManager2*, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_property_definition : Proc(IFsrmClassificationManager2*, IFsrmPropertyDefinition*, HRESULT)
    get_property_definition : Proc(IFsrmClassificationManager2*, UInt8*, IFsrmPropertyDefinition*, HRESULT)
    enum_rules : Proc(IFsrmClassificationManager2*, FsrmRuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_rule : Proc(IFsrmClassificationManager2*, FsrmRuleType, IFsrmRule*, HRESULT)
    get_rule : Proc(IFsrmClassificationManager2*, UInt8*, FsrmRuleType, IFsrmRule*, HRESULT)
    enum_module_definitions : Proc(IFsrmClassificationManager2*, FsrmPipelineModuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)
    create_module_definition : Proc(IFsrmClassificationManager2*, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)
    get_module_definition : Proc(IFsrmClassificationManager2*, UInt8*, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)
    run_classification : Proc(IFsrmClassificationManager2*, FsrmReportGenerationContext, UInt8*, HRESULT)
    wait_for_classification_completion : Proc(IFsrmClassificationManager2*, Int32, Int16*, HRESULT)
    cancel_classification : Proc(IFsrmClassificationManager2*, HRESULT)
    enum_file_properties : Proc(IFsrmClassificationManager2*, UInt8*, FsrmGetFilePropertyOptions, IFsrmCollection*, HRESULT)
    get_file_property : Proc(IFsrmClassificationManager2*, UInt8*, UInt8*, FsrmGetFilePropertyOptions, IFsrmProperty*, HRESULT)
    set_file_property : Proc(IFsrmClassificationManager2*, UInt8*, UInt8*, UInt8*, HRESULT)
    clear_file_property : Proc(IFsrmClassificationManager2*, UInt8*, UInt8*, HRESULT)
    classify_files : Proc(IFsrmClassificationManager2*, SAFEARRAY*, SAFEARRAY*, SAFEARRAY*, FsrmGetFilePropertyOptions, HRESULT)
  end

  IFsrmClassificationManager2_GUID = "0004c1c9-127e-4765-ba07-6a3147bca112"
  IID_IFsrmClassificationManager2 = LibC::GUID.new(0x4c1c9_u32, 0x127e_u16, 0x4765_u16, StaticArray[0xba_u8, 0x7_u8, 0x6a_u8, 0x31_u8, 0x47_u8, 0xbc_u8, 0xa1_u8, 0x12_u8])
  struct IFsrmClassificationManager2
    lpVtbl : IFsrmClassificationManager2VTbl*
  end

  struct IFsrmPropertyBagVTbl
    query_interface : Proc(IFsrmPropertyBag*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPropertyBag*, UInt32)
    release : Proc(IFsrmPropertyBag*, UInt32)
    get_type_info_count : Proc(IFsrmPropertyBag*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPropertyBag*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPropertyBag*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPropertyBag*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFsrmPropertyBag*, UInt8**, HRESULT)
    get_relative_path : Proc(IFsrmPropertyBag*, UInt8**, HRESULT)
    get_volume_name : Proc(IFsrmPropertyBag*, UInt8**, HRESULT)
    get_relative_namespace_root : Proc(IFsrmPropertyBag*, UInt8**, HRESULT)
    get_volume_index : Proc(IFsrmPropertyBag*, UInt32*, HRESULT)
    get_file_id : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_parent_directory_id : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_size : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_size_allocated : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_creation_time : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_last_access_time : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_last_modification_time : Proc(IFsrmPropertyBag*, VARIANT*, HRESULT)
    get_attributes : Proc(IFsrmPropertyBag*, UInt32*, HRESULT)
    get_owner_sid : Proc(IFsrmPropertyBag*, UInt8**, HRESULT)
    get_file_property_names : Proc(IFsrmPropertyBag*, SAFEARRAY**, HRESULT)
    get_messages : Proc(IFsrmPropertyBag*, SAFEARRAY**, HRESULT)
    get_property_bag_flags : Proc(IFsrmPropertyBag*, UInt32*, HRESULT)
    get_file_property : Proc(IFsrmPropertyBag*, UInt8*, IFsrmProperty*, HRESULT)
    set_file_property : Proc(IFsrmPropertyBag*, UInt8*, UInt8*, HRESULT)
    add_message : Proc(IFsrmPropertyBag*, UInt8*, HRESULT)
    get_file_stream_interface : Proc(IFsrmPropertyBag*, FsrmFileStreamingMode, FsrmFileStreamingInterfaceType, VARIANT*, HRESULT)
  end

  IFsrmPropertyBag_GUID = "774589d1-d300-4f7a-9a24-f7b766800250"
  IID_IFsrmPropertyBag = LibC::GUID.new(0x774589d1_u32, 0xd300_u16, 0x4f7a_u16, StaticArray[0x9a_u8, 0x24_u8, 0xf7_u8, 0xb7_u8, 0x66_u8, 0x80_u8, 0x2_u8, 0x50_u8])
  struct IFsrmPropertyBag
    lpVtbl : IFsrmPropertyBagVTbl*
  end

  struct IFsrmPropertyBag2VTbl
    query_interface : Proc(IFsrmPropertyBag2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPropertyBag2*, UInt32)
    release : Proc(IFsrmPropertyBag2*, UInt32)
    get_type_info_count : Proc(IFsrmPropertyBag2*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPropertyBag2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPropertyBag2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPropertyBag2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IFsrmPropertyBag2*, UInt8**, HRESULT)
    get_relative_path : Proc(IFsrmPropertyBag2*, UInt8**, HRESULT)
    get_volume_name : Proc(IFsrmPropertyBag2*, UInt8**, HRESULT)
    get_relative_namespace_root : Proc(IFsrmPropertyBag2*, UInt8**, HRESULT)
    get_volume_index : Proc(IFsrmPropertyBag2*, UInt32*, HRESULT)
    get_file_id : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_parent_directory_id : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_size : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_size_allocated : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_creation_time : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_last_access_time : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_last_modification_time : Proc(IFsrmPropertyBag2*, VARIANT*, HRESULT)
    get_attributes : Proc(IFsrmPropertyBag2*, UInt32*, HRESULT)
    get_owner_sid : Proc(IFsrmPropertyBag2*, UInt8**, HRESULT)
    get_file_property_names : Proc(IFsrmPropertyBag2*, SAFEARRAY**, HRESULT)
    get_messages : Proc(IFsrmPropertyBag2*, SAFEARRAY**, HRESULT)
    get_property_bag_flags : Proc(IFsrmPropertyBag2*, UInt32*, HRESULT)
    get_file_property : Proc(IFsrmPropertyBag2*, UInt8*, IFsrmProperty*, HRESULT)
    set_file_property : Proc(IFsrmPropertyBag2*, UInt8*, UInt8*, HRESULT)
    add_message : Proc(IFsrmPropertyBag2*, UInt8*, HRESULT)
    get_file_stream_interface : Proc(IFsrmPropertyBag2*, FsrmFileStreamingMode, FsrmFileStreamingInterfaceType, VARIANT*, HRESULT)
    get_field_value : Proc(IFsrmPropertyBag2*, FsrmPropertyBagField, VARIANT*, HRESULT)
    get_untrusted_in_file_properties : Proc(IFsrmPropertyBag2*, IFsrmCollection*, HRESULT)
  end

  IFsrmPropertyBag2_GUID = "0e46bdbd-2402-4fed-9c30-9266e6eb2cc9"
  IID_IFsrmPropertyBag2 = LibC::GUID.new(0xe46bdbd_u32, 0x2402_u16, 0x4fed_u16, StaticArray[0x9c_u8, 0x30_u8, 0x92_u8, 0x66_u8, 0xe6_u8, 0xeb_u8, 0x2c_u8, 0xc9_u8])
  struct IFsrmPropertyBag2
    lpVtbl : IFsrmPropertyBag2VTbl*
  end

  struct IFsrmPipelineModuleImplementationVTbl
    query_interface : Proc(IFsrmPipelineModuleImplementation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPipelineModuleImplementation*, UInt32)
    release : Proc(IFsrmPipelineModuleImplementation*, UInt32)
    get_type_info_count : Proc(IFsrmPipelineModuleImplementation*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPipelineModuleImplementation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPipelineModuleImplementation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPipelineModuleImplementation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_load : Proc(IFsrmPipelineModuleImplementation*, IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*, HRESULT)
    on_unload : Proc(IFsrmPipelineModuleImplementation*, HRESULT)
  end

  IFsrmPipelineModuleImplementation_GUID = "b7907906-2b02-4cb5-84a9-fdf54613d6cd"
  IID_IFsrmPipelineModuleImplementation = LibC::GUID.new(0xb7907906_u32, 0x2b02_u16, 0x4cb5_u16, StaticArray[0x84_u8, 0xa9_u8, 0xfd_u8, 0xf5_u8, 0x46_u8, 0x13_u8, 0xd6_u8, 0xcd_u8])
  struct IFsrmPipelineModuleImplementation
    lpVtbl : IFsrmPipelineModuleImplementationVTbl*
  end

  struct IFsrmClassifierModuleImplementationVTbl
    query_interface : Proc(IFsrmClassifierModuleImplementation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmClassifierModuleImplementation*, UInt32)
    release : Proc(IFsrmClassifierModuleImplementation*, UInt32)
    get_type_info_count : Proc(IFsrmClassifierModuleImplementation*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmClassifierModuleImplementation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmClassifierModuleImplementation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmClassifierModuleImplementation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_load : Proc(IFsrmClassifierModuleImplementation*, IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*, HRESULT)
    on_unload : Proc(IFsrmClassifierModuleImplementation*, HRESULT)
    get_last_modified : Proc(IFsrmClassifierModuleImplementation*, VARIANT*, HRESULT)
    use_rules_and_definitions : Proc(IFsrmClassifierModuleImplementation*, IFsrmCollection, IFsrmCollection, HRESULT)
    on_begin_file : Proc(IFsrmClassifierModuleImplementation*, IFsrmPropertyBag, SAFEARRAY*, HRESULT)
    does_property_value_apply : Proc(IFsrmClassifierModuleImplementation*, UInt8*, UInt8*, Int16*, Guid, Guid, HRESULT)
    get_property_value_to_apply : Proc(IFsrmClassifierModuleImplementation*, UInt8*, UInt8**, Guid, Guid, HRESULT)
    on_end_file : Proc(IFsrmClassifierModuleImplementation*, HRESULT)
  end

  IFsrmClassifierModuleImplementation_GUID = "4c968fc6-6edb-4051-9c18-73b7291ae106"
  IID_IFsrmClassifierModuleImplementation = LibC::GUID.new(0x4c968fc6_u32, 0x6edb_u16, 0x4051_u16, StaticArray[0x9c_u8, 0x18_u8, 0x73_u8, 0xb7_u8, 0x29_u8, 0x1a_u8, 0xe1_u8, 0x6_u8])
  struct IFsrmClassifierModuleImplementation
    lpVtbl : IFsrmClassifierModuleImplementationVTbl*
  end

  struct IFsrmStorageModuleImplementationVTbl
    query_interface : Proc(IFsrmStorageModuleImplementation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmStorageModuleImplementation*, UInt32)
    release : Proc(IFsrmStorageModuleImplementation*, UInt32)
    get_type_info_count : Proc(IFsrmStorageModuleImplementation*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmStorageModuleImplementation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmStorageModuleImplementation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmStorageModuleImplementation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_load : Proc(IFsrmStorageModuleImplementation*, IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*, HRESULT)
    on_unload : Proc(IFsrmStorageModuleImplementation*, HRESULT)
    use_definitions : Proc(IFsrmStorageModuleImplementation*, IFsrmCollection, HRESULT)
    load_properties : Proc(IFsrmStorageModuleImplementation*, IFsrmPropertyBag, HRESULT)
    save_properties : Proc(IFsrmStorageModuleImplementation*, IFsrmPropertyBag, HRESULT)
  end

  IFsrmStorageModuleImplementation_GUID = "0af4a0da-895a-4e50-8712-a96724bcec64"
  IID_IFsrmStorageModuleImplementation = LibC::GUID.new(0xaf4a0da_u32, 0x895a_u16, 0x4e50_u16, StaticArray[0x87_u8, 0x12_u8, 0xa9_u8, 0x67_u8, 0x24_u8, 0xbc_u8, 0xec_u8, 0x64_u8])
  struct IFsrmStorageModuleImplementation
    lpVtbl : IFsrmStorageModuleImplementationVTbl*
  end

  struct IFsrmPipelineModuleConnectorVTbl
    query_interface : Proc(IFsrmPipelineModuleConnector*, Guid*, Void**, HRESULT)
    add_ref : Proc(IFsrmPipelineModuleConnector*, UInt32)
    release : Proc(IFsrmPipelineModuleConnector*, UInt32)
    get_type_info_count : Proc(IFsrmPipelineModuleConnector*, UInt32*, HRESULT)
    get_type_info : Proc(IFsrmPipelineModuleConnector*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IFsrmPipelineModuleConnector*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IFsrmPipelineModuleConnector*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_module_implementation : Proc(IFsrmPipelineModuleConnector*, IFsrmPipelineModuleImplementation*, HRESULT)
    get_module_name : Proc(IFsrmPipelineModuleConnector*, UInt8**, HRESULT)
    get_hosting_user_account : Proc(IFsrmPipelineModuleConnector*, UInt8**, HRESULT)
    get_hosting_process_pid : Proc(IFsrmPipelineModuleConnector*, Int32*, HRESULT)
    bind : Proc(IFsrmPipelineModuleConnector*, IFsrmPipelineModuleDefinition, IFsrmPipelineModuleImplementation, HRESULT)
  end

  IFsrmPipelineModuleConnector_GUID = "c16014f3-9aa1-46b3-b0a7-ab146eb205f2"
  IID_IFsrmPipelineModuleConnector = LibC::GUID.new(0xc16014f3_u32, 0x9aa1_u16, 0x46b3_u16, StaticArray[0xb0_u8, 0xa7_u8, 0xab_u8, 0x14_u8, 0x6e_u8, 0xb2_u8, 0x5_u8, 0xf2_u8])
  struct IFsrmPipelineModuleConnector
    lpVtbl : IFsrmPipelineModuleConnectorVTbl*
  end

  struct DIFsrmClassificationEventsVTbl
    query_interface : Proc(DIFsrmClassificationEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(DIFsrmClassificationEvents*, UInt32)
    release : Proc(DIFsrmClassificationEvents*, UInt32)
    get_type_info_count : Proc(DIFsrmClassificationEvents*, UInt32*, HRESULT)
    get_type_info : Proc(DIFsrmClassificationEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DIFsrmClassificationEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DIFsrmClassificationEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  DIFsrmClassificationEvents_GUID = "26942db0-dabf-41d8-bbdd-b129a9f70424"
  IID_DIFsrmClassificationEvents = LibC::GUID.new(0x26942db0_u32, 0xdabf_u16, 0x41d8_u16, StaticArray[0xbb_u8, 0xdd_u8, 0xb1_u8, 0x29_u8, 0xa9_u8, 0xf7_u8, 0x4_u8, 0x24_u8])
  struct DIFsrmClassificationEvents
    lpVtbl : DIFsrmClassificationEventsVTbl*
  end

end
struct LibWin32::IFsrmObject
  def query_interface(this : IFsrmObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmObject*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmObject*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmObject*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmObject*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmObject*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmObject*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmObject*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmObject*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmObject*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
end
struct LibWin32::IFsrmCollection
  def query_interface(this : IFsrmCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFsrmCollection*, unknown : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, unknown)
  end
  def get_item(this : IFsrmCollection*, index : Int32, item : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, item)
  end
  def get_count(this : IFsrmCollection*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get_state(this : IFsrmCollection*, state : FsrmCollectionState*) : HRESULT
    @lpVtbl.value.get_state.call(this, state)
  end
  def cancel(this : IFsrmCollection*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def wait_for_completion(this : IFsrmCollection*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.call(this, waitseconds, completed)
  end
  def get_by_id(this : IFsrmCollection*, id : Guid, entry : VARIANT*) : HRESULT
    @lpVtbl.value.get_by_id.call(this, id, entry)
  end
end
struct LibWin32::IFsrmMutableCollection
  def query_interface(this : IFsrmMutableCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmMutableCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmMutableCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmMutableCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmMutableCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmMutableCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmMutableCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFsrmMutableCollection*, unknown : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, unknown)
  end
  def get_item(this : IFsrmMutableCollection*, index : Int32, item : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, item)
  end
  def get_count(this : IFsrmMutableCollection*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get_state(this : IFsrmMutableCollection*, state : FsrmCollectionState*) : HRESULT
    @lpVtbl.value.get_state.call(this, state)
  end
  def cancel(this : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def wait_for_completion(this : IFsrmMutableCollection*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.call(this, waitseconds, completed)
  end
  def get_by_id(this : IFsrmMutableCollection*, id : Guid, entry : VARIANT*) : HRESULT
    @lpVtbl.value.get_by_id.call(this, id, entry)
  end
  def add(this : IFsrmMutableCollection*, item : VARIANT) : HRESULT
    @lpVtbl.value.add.call(this, item)
  end
  def remove(this : IFsrmMutableCollection*, index : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, index)
  end
  def remove_by_id(this : IFsrmMutableCollection*, id : Guid) : HRESULT
    @lpVtbl.value.remove_by_id.call(this, id)
  end
  def clone(this : IFsrmMutableCollection*, collection : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.clone.call(this, collection)
  end
end
struct LibWin32::IFsrmCommittableCollection
  def query_interface(this : IFsrmCommittableCollection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmCommittableCollection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmCommittableCollection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmCommittableCollection*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmCommittableCollection*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmCommittableCollection*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmCommittableCollection*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get__new_enum(this : IFsrmCommittableCollection*, unknown : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.call(this, unknown)
  end
  def get_item(this : IFsrmCommittableCollection*, index : Int32, item : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, item)
  end
  def get_count(this : IFsrmCommittableCollection*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get_state(this : IFsrmCommittableCollection*, state : FsrmCollectionState*) : HRESULT
    @lpVtbl.value.get_state.call(this, state)
  end
  def cancel(this : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def wait_for_completion(this : IFsrmCommittableCollection*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.call(this, waitseconds, completed)
  end
  def get_by_id(this : IFsrmCommittableCollection*, id : Guid, entry : VARIANT*) : HRESULT
    @lpVtbl.value.get_by_id.call(this, id, entry)
  end
  def add(this : IFsrmCommittableCollection*, item : VARIANT) : HRESULT
    @lpVtbl.value.add.call(this, item)
  end
  def remove(this : IFsrmCommittableCollection*, index : Int32) : HRESULT
    @lpVtbl.value.remove.call(this, index)
  end
  def remove_by_id(this : IFsrmCommittableCollection*, id : Guid) : HRESULT
    @lpVtbl.value.remove_by_id.call(this, id)
  end
  def clone(this : IFsrmCommittableCollection*, collection : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.clone.call(this, collection)
  end
  def commit(this : IFsrmCommittableCollection*, options : FsrmCommitOptions, results : IFsrmCollection*) : HRESULT
    @lpVtbl.value.commit.call(this, options, results)
  end
end
struct LibWin32::IFsrmAction
  def query_interface(this : IFsrmAction*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmAction*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmAction*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmAction*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmAction*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmAction*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmAction*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmAction*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_action_type(this : IFsrmAction*, actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.call(this, actiontype)
  end
  def get_run_limit_interval(this : IFsrmAction*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.call(this, minutes)
  end
  def put_run_limit_interval(this : IFsrmAction*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.call(this, minutes)
  end
  def delete(this : IFsrmAction*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IFsrmActionEmail
  def query_interface(this : IFsrmActionEmail*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmActionEmail*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmActionEmail*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmActionEmail*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmActionEmail*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmActionEmail*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmActionEmail*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmActionEmail*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_action_type(this : IFsrmActionEmail*, actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.call(this, actiontype)
  end
  def get_run_limit_interval(this : IFsrmActionEmail*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.call(this, minutes)
  end
  def put_run_limit_interval(this : IFsrmActionEmail*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.call(this, minutes)
  end
  def delete(this : IFsrmActionEmail*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_mail_from(this : IFsrmActionEmail*, mailfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_from.call(this, mailfrom)
  end
  def put_mail_from(this : IFsrmActionEmail*, mailfrom : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_from.call(this, mailfrom)
  end
  def get_mail_reply_to(this : IFsrmActionEmail*, mailreplyto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_reply_to.call(this, mailreplyto)
  end
  def put_mail_reply_to(this : IFsrmActionEmail*, mailreplyto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_reply_to.call(this, mailreplyto)
  end
  def get_mail_to(this : IFsrmActionEmail*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.call(this, mailto)
  end
  def put_mail_to(this : IFsrmActionEmail*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.call(this, mailto)
  end
  def get_mail_cc(this : IFsrmActionEmail*, mailcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_cc.call(this, mailcc)
  end
  def put_mail_cc(this : IFsrmActionEmail*, mailcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_cc.call(this, mailcc)
  end
  def get_mail_bcc(this : IFsrmActionEmail*, mailbcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_bcc.call(this, mailbcc)
  end
  def put_mail_bcc(this : IFsrmActionEmail*, mailbcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_bcc.call(this, mailbcc)
  end
  def get_mail_subject(this : IFsrmActionEmail*, mailsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_subject.call(this, mailsubject)
  end
  def put_mail_subject(this : IFsrmActionEmail*, mailsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_subject.call(this, mailsubject)
  end
  def get_message_text(this : IFsrmActionEmail*, messagetext : UInt8**) : HRESULT
    @lpVtbl.value.get_message_text.call(this, messagetext)
  end
  def put_message_text(this : IFsrmActionEmail*, messagetext : UInt8*) : HRESULT
    @lpVtbl.value.put_message_text.call(this, messagetext)
  end
end
struct LibWin32::IFsrmActionEmail2
  def query_interface(this : IFsrmActionEmail2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmActionEmail2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmActionEmail2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmActionEmail2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmActionEmail2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmActionEmail2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmActionEmail2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmActionEmail2*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_action_type(this : IFsrmActionEmail2*, actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.call(this, actiontype)
  end
  def get_run_limit_interval(this : IFsrmActionEmail2*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.call(this, minutes)
  end
  def put_run_limit_interval(this : IFsrmActionEmail2*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.call(this, minutes)
  end
  def delete(this : IFsrmActionEmail2*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_mail_from(this : IFsrmActionEmail2*, mailfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_from.call(this, mailfrom)
  end
  def put_mail_from(this : IFsrmActionEmail2*, mailfrom : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_from.call(this, mailfrom)
  end
  def get_mail_reply_to(this : IFsrmActionEmail2*, mailreplyto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_reply_to.call(this, mailreplyto)
  end
  def put_mail_reply_to(this : IFsrmActionEmail2*, mailreplyto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_reply_to.call(this, mailreplyto)
  end
  def get_mail_to(this : IFsrmActionEmail2*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.call(this, mailto)
  end
  def put_mail_to(this : IFsrmActionEmail2*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.call(this, mailto)
  end
  def get_mail_cc(this : IFsrmActionEmail2*, mailcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_cc.call(this, mailcc)
  end
  def put_mail_cc(this : IFsrmActionEmail2*, mailcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_cc.call(this, mailcc)
  end
  def get_mail_bcc(this : IFsrmActionEmail2*, mailbcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_bcc.call(this, mailbcc)
  end
  def put_mail_bcc(this : IFsrmActionEmail2*, mailbcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_bcc.call(this, mailbcc)
  end
  def get_mail_subject(this : IFsrmActionEmail2*, mailsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_subject.call(this, mailsubject)
  end
  def put_mail_subject(this : IFsrmActionEmail2*, mailsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_subject.call(this, mailsubject)
  end
  def get_message_text(this : IFsrmActionEmail2*, messagetext : UInt8**) : HRESULT
    @lpVtbl.value.get_message_text.call(this, messagetext)
  end
  def put_message_text(this : IFsrmActionEmail2*, messagetext : UInt8*) : HRESULT
    @lpVtbl.value.put_message_text.call(this, messagetext)
  end
  def get_attachment_file_list_size(this : IFsrmActionEmail2*, attachmentfilelistsize : Int32*) : HRESULT
    @lpVtbl.value.get_attachment_file_list_size.call(this, attachmentfilelistsize)
  end
  def put_attachment_file_list_size(this : IFsrmActionEmail2*, attachmentfilelistsize : Int32) : HRESULT
    @lpVtbl.value.put_attachment_file_list_size.call(this, attachmentfilelistsize)
  end
end
struct LibWin32::IFsrmActionReport
  def query_interface(this : IFsrmActionReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmActionReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmActionReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmActionReport*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmActionReport*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmActionReport*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmActionReport*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmActionReport*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_action_type(this : IFsrmActionReport*, actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.call(this, actiontype)
  end
  def get_run_limit_interval(this : IFsrmActionReport*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.call(this, minutes)
  end
  def put_run_limit_interval(this : IFsrmActionReport*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.call(this, minutes)
  end
  def delete(this : IFsrmActionReport*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_report_types(this : IFsrmActionReport*, reporttypes : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_report_types.call(this, reporttypes)
  end
  def put_report_types(this : IFsrmActionReport*, reporttypes : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_report_types.call(this, reporttypes)
  end
  def get_mail_to(this : IFsrmActionReport*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.call(this, mailto)
  end
  def put_mail_to(this : IFsrmActionReport*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.call(this, mailto)
  end
end
struct LibWin32::IFsrmActionEventLog
  def query_interface(this : IFsrmActionEventLog*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmActionEventLog*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmActionEventLog*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmActionEventLog*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmActionEventLog*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmActionEventLog*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmActionEventLog*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmActionEventLog*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_action_type(this : IFsrmActionEventLog*, actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.call(this, actiontype)
  end
  def get_run_limit_interval(this : IFsrmActionEventLog*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.call(this, minutes)
  end
  def put_run_limit_interval(this : IFsrmActionEventLog*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.call(this, minutes)
  end
  def delete(this : IFsrmActionEventLog*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_event_type(this : IFsrmActionEventLog*, eventtype : FsrmEventType*) : HRESULT
    @lpVtbl.value.get_event_type.call(this, eventtype)
  end
  def put_event_type(this : IFsrmActionEventLog*, eventtype : FsrmEventType) : HRESULT
    @lpVtbl.value.put_event_type.call(this, eventtype)
  end
  def get_message_text(this : IFsrmActionEventLog*, messagetext : UInt8**) : HRESULT
    @lpVtbl.value.get_message_text.call(this, messagetext)
  end
  def put_message_text(this : IFsrmActionEventLog*, messagetext : UInt8*) : HRESULT
    @lpVtbl.value.put_message_text.call(this, messagetext)
  end
end
struct LibWin32::IFsrmActionCommand
  def query_interface(this : IFsrmActionCommand*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmActionCommand*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmActionCommand*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmActionCommand*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmActionCommand*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmActionCommand*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmActionCommand*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmActionCommand*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_action_type(this : IFsrmActionCommand*, actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.call(this, actiontype)
  end
  def get_run_limit_interval(this : IFsrmActionCommand*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.call(this, minutes)
  end
  def put_run_limit_interval(this : IFsrmActionCommand*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.call(this, minutes)
  end
  def delete(this : IFsrmActionCommand*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_executable_path(this : IFsrmActionCommand*, executablepath : UInt8**) : HRESULT
    @lpVtbl.value.get_executable_path.call(this, executablepath)
  end
  def put_executable_path(this : IFsrmActionCommand*, executablepath : UInt8*) : HRESULT
    @lpVtbl.value.put_executable_path.call(this, executablepath)
  end
  def get_arguments(this : IFsrmActionCommand*, arguments : UInt8**) : HRESULT
    @lpVtbl.value.get_arguments.call(this, arguments)
  end
  def put_arguments(this : IFsrmActionCommand*, arguments : UInt8*) : HRESULT
    @lpVtbl.value.put_arguments.call(this, arguments)
  end
  def get_account(this : IFsrmActionCommand*, account : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.call(this, account)
  end
  def put_account(this : IFsrmActionCommand*, account : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.call(this, account)
  end
  def get_working_directory(this : IFsrmActionCommand*, workingdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_working_directory.call(this, workingdirectory)
  end
  def put_working_directory(this : IFsrmActionCommand*, workingdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_working_directory.call(this, workingdirectory)
  end
  def get_monitor_command(this : IFsrmActionCommand*, monitorcommand : Int16*) : HRESULT
    @lpVtbl.value.get_monitor_command.call(this, monitorcommand)
  end
  def put_monitor_command(this : IFsrmActionCommand*, monitorcommand : Int16) : HRESULT
    @lpVtbl.value.put_monitor_command.call(this, monitorcommand)
  end
  def get_kill_time_out(this : IFsrmActionCommand*, minutes : Int32*) : HRESULT
    @lpVtbl.value.get_kill_time_out.call(this, minutes)
  end
  def put_kill_time_out(this : IFsrmActionCommand*, minutes : Int32) : HRESULT
    @lpVtbl.value.put_kill_time_out.call(this, minutes)
  end
  def get_log_result(this : IFsrmActionCommand*, logresults : Int16*) : HRESULT
    @lpVtbl.value.get_log_result.call(this, logresults)
  end
  def put_log_result(this : IFsrmActionCommand*, logresults : Int16) : HRESULT
    @lpVtbl.value.put_log_result.call(this, logresults)
  end
end
struct LibWin32::IFsrmSetting
  def query_interface(this : IFsrmSetting*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmSetting*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmSetting*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmSetting*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmSetting*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmSetting*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmSetting*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_smtp_server(this : IFsrmSetting*, smtpserver : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_server.call(this, smtpserver)
  end
  def put_smtp_server(this : IFsrmSetting*, smtpserver : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_server.call(this, smtpserver)
  end
  def get_mail_from(this : IFsrmSetting*, mailfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_from.call(this, mailfrom)
  end
  def put_mail_from(this : IFsrmSetting*, mailfrom : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_from.call(this, mailfrom)
  end
  def get_admin_email(this : IFsrmSetting*, adminemail : UInt8**) : HRESULT
    @lpVtbl.value.get_admin_email.call(this, adminemail)
  end
  def put_admin_email(this : IFsrmSetting*, adminemail : UInt8*) : HRESULT
    @lpVtbl.value.put_admin_email.call(this, adminemail)
  end
  def get_disable_command_line(this : IFsrmSetting*, disablecommandline : Int16*) : HRESULT
    @lpVtbl.value.get_disable_command_line.call(this, disablecommandline)
  end
  def put_disable_command_line(this : IFsrmSetting*, disablecommandline : Int16) : HRESULT
    @lpVtbl.value.put_disable_command_line.call(this, disablecommandline)
  end
  def get_enable_screening_audit(this : IFsrmSetting*, enablescreeningaudit : Int16*) : HRESULT
    @lpVtbl.value.get_enable_screening_audit.call(this, enablescreeningaudit)
  end
  def put_enable_screening_audit(this : IFsrmSetting*, enablescreeningaudit : Int16) : HRESULT
    @lpVtbl.value.put_enable_screening_audit.call(this, enablescreeningaudit)
  end
  def email_test(this : IFsrmSetting*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.email_test.call(this, mailto)
  end
  def set_action_run_limit_interval(this : IFsrmSetting*, actiontype : FsrmActionType, delaytimeminutes : Int32) : HRESULT
    @lpVtbl.value.set_action_run_limit_interval.call(this, actiontype, delaytimeminutes)
  end
  def get_action_run_limit_interval(this : IFsrmSetting*, actiontype : FsrmActionType, delaytimeminutes : Int32*) : HRESULT
    @lpVtbl.value.get_action_run_limit_interval.call(this, actiontype, delaytimeminutes)
  end
end
struct LibWin32::IFsrmPathMapper
  def query_interface(this : IFsrmPathMapper*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPathMapper*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPathMapper*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPathMapper*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPathMapper*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPathMapper*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPathMapper*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_share_paths_for_local_path(this : IFsrmPathMapper*, localpath : UInt8*, sharepaths : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_share_paths_for_local_path.call(this, localpath, sharepaths)
  end
end
struct LibWin32::IFsrmExportImport
  def query_interface(this : IFsrmExportImport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmExportImport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmExportImport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmExportImport*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmExportImport*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmExportImport*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmExportImport*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def export_file_groups(this : IFsrmExportImport*, filepath : UInt8*, filegroupnamessafearray : VARIANT*, remotehost : UInt8*) : HRESULT
    @lpVtbl.value.export_file_groups.call(this, filepath, filegroupnamessafearray, remotehost)
  end
  def import_file_groups(this : IFsrmExportImport*, filepath : UInt8*, filegroupnamessafearray : VARIANT*, remotehost : UInt8*, filegroups : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_file_groups.call(this, filepath, filegroupnamessafearray, remotehost, filegroups)
  end
  def export_file_screen_templates(this : IFsrmExportImport*, filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*) : HRESULT
    @lpVtbl.value.export_file_screen_templates.call(this, filepath, templatenamessafearray, remotehost)
  end
  def import_file_screen_templates(this : IFsrmExportImport*, filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*, templates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_file_screen_templates.call(this, filepath, templatenamessafearray, remotehost, templates)
  end
  def export_quota_templates(this : IFsrmExportImport*, filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*) : HRESULT
    @lpVtbl.value.export_quota_templates.call(this, filepath, templatenamessafearray, remotehost)
  end
  def import_quota_templates(this : IFsrmExportImport*, filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*, templates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_quota_templates.call(this, filepath, templatenamessafearray, remotehost, templates)
  end
end
struct LibWin32::IFsrmDerivedObjectsResult
  def query_interface(this : IFsrmDerivedObjectsResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmDerivedObjectsResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmDerivedObjectsResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmDerivedObjectsResult*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmDerivedObjectsResult*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmDerivedObjectsResult*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmDerivedObjectsResult*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_derived_objects(this : IFsrmDerivedObjectsResult*, derivedobjects : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_derived_objects.call(this, derivedobjects)
  end
  def get_results(this : IFsrmDerivedObjectsResult*, results : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_results.call(this, results)
  end
end
struct LibWin32::IFsrmAccessDeniedRemediationClient
  def query_interface(this : IFsrmAccessDeniedRemediationClient*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmAccessDeniedRemediationClient*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmAccessDeniedRemediationClient*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmAccessDeniedRemediationClient*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmAccessDeniedRemediationClient*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmAccessDeniedRemediationClient*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmAccessDeniedRemediationClient*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def show(this : IFsrmAccessDeniedRemediationClient*, parentwnd : LibC::UINT_PTR, accesspath : UInt8*, errortype : AdrClientErrorType, flags : Int32, windowtitle : UInt8*, windowmessage : UInt8*, result : Int32*) : HRESULT
    @lpVtbl.value.show.call(this, parentwnd, accesspath, errortype, flags, windowtitle, windowmessage, result)
  end
end
struct LibWin32::IFsrmQuotaBase
  def query_interface(this : IFsrmQuotaBase*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaBase*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaBase*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaBase*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaBase*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaBase*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaBase*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmQuotaBase*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmQuotaBase*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmQuotaBase*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmQuotaBase*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmQuotaBase*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_quota_limit(this : IFsrmQuotaBase*, quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.call(this, quotalimit)
  end
  def put_quota_limit(this : IFsrmQuotaBase*, quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.call(this, quotalimit)
  end
  def get_quota_flags(this : IFsrmQuotaBase*, quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.call(this, quotaflags)
  end
  def put_quota_flags(this : IFsrmQuotaBase*, quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.call(this, quotaflags)
  end
  def get_thresholds(this : IFsrmQuotaBase*, thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.call(this, thresholds)
  end
  def add_threshold(this : IFsrmQuotaBase*, threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.call(this, threshold)
  end
  def delete_threshold(this : IFsrmQuotaBase*, threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.call(this, threshold)
  end
  def modify_threshold(this : IFsrmQuotaBase*, threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.call(this, threshold, newthreshold)
  end
  def create_threshold_action(this : IFsrmQuotaBase*, threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.call(this, threshold, actiontype, action)
  end
  def enum_threshold_actions(this : IFsrmQuotaBase*, threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.call(this, threshold, actions)
  end
end
struct LibWin32::IFsrmQuotaObject
  def query_interface(this : IFsrmQuotaObject*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaObject*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaObject*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaObject*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaObject*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaObject*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaObject*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmQuotaObject*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmQuotaObject*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmQuotaObject*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmQuotaObject*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmQuotaObject*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_quota_limit(this : IFsrmQuotaObject*, quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.call(this, quotalimit)
  end
  def put_quota_limit(this : IFsrmQuotaObject*, quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.call(this, quotalimit)
  end
  def get_quota_flags(this : IFsrmQuotaObject*, quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.call(this, quotaflags)
  end
  def put_quota_flags(this : IFsrmQuotaObject*, quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.call(this, quotaflags)
  end
  def get_thresholds(this : IFsrmQuotaObject*, thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.call(this, thresholds)
  end
  def add_threshold(this : IFsrmQuotaObject*, threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.call(this, threshold)
  end
  def delete_threshold(this : IFsrmQuotaObject*, threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.call(this, threshold)
  end
  def modify_threshold(this : IFsrmQuotaObject*, threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.call(this, threshold, newthreshold)
  end
  def create_threshold_action(this : IFsrmQuotaObject*, threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.call(this, threshold, actiontype, action)
  end
  def enum_threshold_actions(this : IFsrmQuotaObject*, threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.call(this, threshold, actions)
  end
  def get_path(this : IFsrmQuotaObject*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_user_sid(this : IFsrmQuotaObject*, usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.call(this, usersid)
  end
  def get_user_account(this : IFsrmQuotaObject*, useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.call(this, useraccount)
  end
  def get_source_template_name(this : IFsrmQuotaObject*, quotatemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.call(this, quotatemplatename)
  end
  def get_matches_source_template(this : IFsrmQuotaObject*, matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.call(this, matches)
  end
  def apply_template(this : IFsrmQuotaObject*, quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.call(this, quotatemplatename)
  end
end
struct LibWin32::IFsrmQuota
  def query_interface(this : IFsrmQuota*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuota*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuota*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuota*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuota*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuota*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuota*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmQuota*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmQuota*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmQuota*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmQuota*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmQuota*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_quota_limit(this : IFsrmQuota*, quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.call(this, quotalimit)
  end
  def put_quota_limit(this : IFsrmQuota*, quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.call(this, quotalimit)
  end
  def get_quota_flags(this : IFsrmQuota*, quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.call(this, quotaflags)
  end
  def put_quota_flags(this : IFsrmQuota*, quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.call(this, quotaflags)
  end
  def get_thresholds(this : IFsrmQuota*, thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.call(this, thresholds)
  end
  def add_threshold(this : IFsrmQuota*, threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.call(this, threshold)
  end
  def delete_threshold(this : IFsrmQuota*, threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.call(this, threshold)
  end
  def modify_threshold(this : IFsrmQuota*, threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.call(this, threshold, newthreshold)
  end
  def create_threshold_action(this : IFsrmQuota*, threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.call(this, threshold, actiontype, action)
  end
  def enum_threshold_actions(this : IFsrmQuota*, threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.call(this, threshold, actions)
  end
  def get_path(this : IFsrmQuota*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_user_sid(this : IFsrmQuota*, usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.call(this, usersid)
  end
  def get_user_account(this : IFsrmQuota*, useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.call(this, useraccount)
  end
  def get_source_template_name(this : IFsrmQuota*, quotatemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.call(this, quotatemplatename)
  end
  def get_matches_source_template(this : IFsrmQuota*, matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.call(this, matches)
  end
  def apply_template(this : IFsrmQuota*, quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.call(this, quotatemplatename)
  end
  def get_quota_used(this : IFsrmQuota*, used : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_used.call(this, used)
  end
  def get_quota_peak_usage(this : IFsrmQuota*, peakusage : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_peak_usage.call(this, peakusage)
  end
  def get_quota_peak_usage_time(this : IFsrmQuota*, peakusagedatetime : Float64*) : HRESULT
    @lpVtbl.value.get_quota_peak_usage_time.call(this, peakusagedatetime)
  end
  def reset_peak_usage(this : IFsrmQuota*) : HRESULT
    @lpVtbl.value.reset_peak_usage.call(this)
  end
  def refresh_usage_properties(this : IFsrmQuota*) : HRESULT
    @lpVtbl.value.refresh_usage_properties.call(this)
  end
end
struct LibWin32::IFsrmAutoApplyQuota
  def query_interface(this : IFsrmAutoApplyQuota*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmAutoApplyQuota*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmAutoApplyQuota*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmAutoApplyQuota*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmAutoApplyQuota*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmAutoApplyQuota*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmAutoApplyQuota*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmAutoApplyQuota*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmAutoApplyQuota*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmAutoApplyQuota*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_quota_limit(this : IFsrmAutoApplyQuota*, quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.call(this, quotalimit)
  end
  def put_quota_limit(this : IFsrmAutoApplyQuota*, quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.call(this, quotalimit)
  end
  def get_quota_flags(this : IFsrmAutoApplyQuota*, quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.call(this, quotaflags)
  end
  def put_quota_flags(this : IFsrmAutoApplyQuota*, quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.call(this, quotaflags)
  end
  def get_thresholds(this : IFsrmAutoApplyQuota*, thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.call(this, thresholds)
  end
  def add_threshold(this : IFsrmAutoApplyQuota*, threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.call(this, threshold)
  end
  def delete_threshold(this : IFsrmAutoApplyQuota*, threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.call(this, threshold)
  end
  def modify_threshold(this : IFsrmAutoApplyQuota*, threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.call(this, threshold, newthreshold)
  end
  def create_threshold_action(this : IFsrmAutoApplyQuota*, threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.call(this, threshold, actiontype, action)
  end
  def enum_threshold_actions(this : IFsrmAutoApplyQuota*, threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.call(this, threshold, actions)
  end
  def get_path(this : IFsrmAutoApplyQuota*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_user_sid(this : IFsrmAutoApplyQuota*, usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.call(this, usersid)
  end
  def get_user_account(this : IFsrmAutoApplyQuota*, useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.call(this, useraccount)
  end
  def get_source_template_name(this : IFsrmAutoApplyQuota*, quotatemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.call(this, quotatemplatename)
  end
  def get_matches_source_template(this : IFsrmAutoApplyQuota*, matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.call(this, matches)
  end
  def apply_template(this : IFsrmAutoApplyQuota*, quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.call(this, quotatemplatename)
  end
  def get_exclude_folders(this : IFsrmAutoApplyQuota*, folders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_exclude_folders.call(this, folders)
  end
  def put_exclude_folders(this : IFsrmAutoApplyQuota*, folders : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_exclude_folders.call(this, folders)
  end
  def commit_and_update_derived(this : IFsrmAutoApplyQuota*, commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.call(this, commitoptions, applyoptions, derivedobjectsresult)
  end
end
struct LibWin32::IFsrmQuotaManager
  def query_interface(this : IFsrmQuotaManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_action_variables(this : IFsrmQuotaManager*, variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.call(this, variables)
  end
  def get_action_variable_descriptions(this : IFsrmQuotaManager*, descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.call(this, descriptions)
  end
  def create_quota(this : IFsrmQuotaManager*, path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.create_quota.call(this, path, quota)
  end
  def create_auto_apply_quota(this : IFsrmQuotaManager*, quotatemplatename : UInt8*, path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.create_auto_apply_quota.call(this, quotatemplatename, path, quota)
  end
  def get_quota(this : IFsrmQuotaManager*, path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_quota.call(this, path, quota)
  end
  def get_auto_apply_quota(this : IFsrmQuotaManager*, path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.get_auto_apply_quota.call(this, path, quota)
  end
  def get_restrictive_quota(this : IFsrmQuotaManager*, path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_restrictive_quota.call(this, path, quota)
  end
  def enum_quotas(this : IFsrmQuotaManager*, path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_quotas.call(this, path, options, quotas)
  end
  def enum_auto_apply_quotas(this : IFsrmQuotaManager*, path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_auto_apply_quotas.call(this, path, options, quotas)
  end
  def enum_effective_quotas(this : IFsrmQuotaManager*, path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_effective_quotas.call(this, path, options, quotas)
  end
  def scan(this : IFsrmQuotaManager*, strpath : UInt8*) : HRESULT
    @lpVtbl.value.scan.call(this, strpath)
  end
  def create_quota_collection(this : IFsrmQuotaManager*, collection : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.create_quota_collection.call(this, collection)
  end
end
struct LibWin32::IFsrmQuotaManagerEx
  def query_interface(this : IFsrmQuotaManagerEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaManagerEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaManagerEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaManagerEx*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaManagerEx*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaManagerEx*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaManagerEx*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_action_variables(this : IFsrmQuotaManagerEx*, variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.call(this, variables)
  end
  def get_action_variable_descriptions(this : IFsrmQuotaManagerEx*, descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.call(this, descriptions)
  end
  def create_quota(this : IFsrmQuotaManagerEx*, path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.create_quota.call(this, path, quota)
  end
  def create_auto_apply_quota(this : IFsrmQuotaManagerEx*, quotatemplatename : UInt8*, path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.create_auto_apply_quota.call(this, quotatemplatename, path, quota)
  end
  def get_quota(this : IFsrmQuotaManagerEx*, path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_quota.call(this, path, quota)
  end
  def get_auto_apply_quota(this : IFsrmQuotaManagerEx*, path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.get_auto_apply_quota.call(this, path, quota)
  end
  def get_restrictive_quota(this : IFsrmQuotaManagerEx*, path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_restrictive_quota.call(this, path, quota)
  end
  def enum_quotas(this : IFsrmQuotaManagerEx*, path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_quotas.call(this, path, options, quotas)
  end
  def enum_auto_apply_quotas(this : IFsrmQuotaManagerEx*, path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_auto_apply_quotas.call(this, path, options, quotas)
  end
  def enum_effective_quotas(this : IFsrmQuotaManagerEx*, path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_effective_quotas.call(this, path, options, quotas)
  end
  def scan(this : IFsrmQuotaManagerEx*, strpath : UInt8*) : HRESULT
    @lpVtbl.value.scan.call(this, strpath)
  end
  def create_quota_collection(this : IFsrmQuotaManagerEx*, collection : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.create_quota_collection.call(this, collection)
  end
  def is_affected_by_quota(this : IFsrmQuotaManagerEx*, path : UInt8*, options : FsrmEnumOptions, affected : Int16*) : HRESULT
    @lpVtbl.value.is_affected_by_quota.call(this, path, options, affected)
  end
end
struct LibWin32::IFsrmQuotaTemplate
  def query_interface(this : IFsrmQuotaTemplate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaTemplate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaTemplate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaTemplate*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaTemplate*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaTemplate*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaTemplate*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmQuotaTemplate*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmQuotaTemplate*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmQuotaTemplate*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmQuotaTemplate*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmQuotaTemplate*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_quota_limit(this : IFsrmQuotaTemplate*, quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.call(this, quotalimit)
  end
  def put_quota_limit(this : IFsrmQuotaTemplate*, quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.call(this, quotalimit)
  end
  def get_quota_flags(this : IFsrmQuotaTemplate*, quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.call(this, quotaflags)
  end
  def put_quota_flags(this : IFsrmQuotaTemplate*, quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.call(this, quotaflags)
  end
  def get_thresholds(this : IFsrmQuotaTemplate*, thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.call(this, thresholds)
  end
  def add_threshold(this : IFsrmQuotaTemplate*, threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.call(this, threshold)
  end
  def delete_threshold(this : IFsrmQuotaTemplate*, threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.call(this, threshold)
  end
  def modify_threshold(this : IFsrmQuotaTemplate*, threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.call(this, threshold, newthreshold)
  end
  def create_threshold_action(this : IFsrmQuotaTemplate*, threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.call(this, threshold, actiontype, action)
  end
  def enum_threshold_actions(this : IFsrmQuotaTemplate*, threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.call(this, threshold, actions)
  end
  def get_name(this : IFsrmQuotaTemplate*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmQuotaTemplate*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def copy_template(this : IFsrmQuotaTemplate*, quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.call(this, quotatemplatename)
  end
  def commit_and_update_derived(this : IFsrmQuotaTemplate*, commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.call(this, commitoptions, applyoptions, derivedobjectsresult)
  end
end
struct LibWin32::IFsrmQuotaTemplateImported
  def query_interface(this : IFsrmQuotaTemplateImported*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaTemplateImported*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaTemplateImported*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaTemplateImported*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaTemplateImported*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaTemplateImported*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaTemplateImported*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmQuotaTemplateImported*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmQuotaTemplateImported*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmQuotaTemplateImported*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmQuotaTemplateImported*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmQuotaTemplateImported*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_quota_limit(this : IFsrmQuotaTemplateImported*, quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.call(this, quotalimit)
  end
  def put_quota_limit(this : IFsrmQuotaTemplateImported*, quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.call(this, quotalimit)
  end
  def get_quota_flags(this : IFsrmQuotaTemplateImported*, quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.call(this, quotaflags)
  end
  def put_quota_flags(this : IFsrmQuotaTemplateImported*, quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.call(this, quotaflags)
  end
  def get_thresholds(this : IFsrmQuotaTemplateImported*, thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.call(this, thresholds)
  end
  def add_threshold(this : IFsrmQuotaTemplateImported*, threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.call(this, threshold)
  end
  def delete_threshold(this : IFsrmQuotaTemplateImported*, threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.call(this, threshold)
  end
  def modify_threshold(this : IFsrmQuotaTemplateImported*, threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.call(this, threshold, newthreshold)
  end
  def create_threshold_action(this : IFsrmQuotaTemplateImported*, threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.call(this, threshold, actiontype, action)
  end
  def enum_threshold_actions(this : IFsrmQuotaTemplateImported*, threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.call(this, threshold, actions)
  end
  def get_name(this : IFsrmQuotaTemplateImported*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmQuotaTemplateImported*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def copy_template(this : IFsrmQuotaTemplateImported*, quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.call(this, quotatemplatename)
  end
  def commit_and_update_derived(this : IFsrmQuotaTemplateImported*, commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.call(this, commitoptions, applyoptions, derivedobjectsresult)
  end
  def get_overwrite_on_commit(this : IFsrmQuotaTemplateImported*, overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_overwrite_on_commit.call(this, overwrite)
  end
  def put_overwrite_on_commit(this : IFsrmQuotaTemplateImported*, overwrite : Int16) : HRESULT
    @lpVtbl.value.put_overwrite_on_commit.call(this, overwrite)
  end
end
struct LibWin32::IFsrmQuotaTemplateManager
  def query_interface(this : IFsrmQuotaTemplateManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmQuotaTemplateManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmQuotaTemplateManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmQuotaTemplateManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmQuotaTemplateManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmQuotaTemplateManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmQuotaTemplateManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_template(this : IFsrmQuotaTemplateManager*, quotatemplate : IFsrmQuotaTemplate*) : HRESULT
    @lpVtbl.value.create_template.call(this, quotatemplate)
  end
  def get_template(this : IFsrmQuotaTemplateManager*, name : UInt8*, quotatemplate : IFsrmQuotaTemplate*) : HRESULT
    @lpVtbl.value.get_template.call(this, name, quotatemplate)
  end
  def enum_templates(this : IFsrmQuotaTemplateManager*, options : FsrmEnumOptions, quotatemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_templates.call(this, options, quotatemplates)
  end
  def export_templates(this : IFsrmQuotaTemplateManager*, quotatemplatenamesarray : VARIANT*, serializedquotatemplates : UInt8**) : HRESULT
    @lpVtbl.value.export_templates.call(this, quotatemplatenamesarray, serializedquotatemplates)
  end
  def import_templates(this : IFsrmQuotaTemplateManager*, serializedquotatemplates : UInt8*, quotatemplatenamesarray : VARIANT*, quotatemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_templates.call(this, serializedquotatemplates, quotatemplatenamesarray, quotatemplates)
  end
end
struct LibWin32::IFsrmFileGroup
  def query_interface(this : IFsrmFileGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileGroup*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileGroup*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileGroup*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileGroup*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileGroup*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileGroup*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileGroup*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileGroup*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileGroup*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmFileGroup*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmFileGroup*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_members(this : IFsrmFileGroup*, members : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_members.call(this, members)
  end
  def put_members(this : IFsrmFileGroup*, members : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_members.call(this, members)
  end
  def get_non_members(this : IFsrmFileGroup*, nonmembers : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_non_members.call(this, nonmembers)
  end
  def put_non_members(this : IFsrmFileGroup*, nonmembers : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_non_members.call(this, nonmembers)
  end
end
struct LibWin32::IFsrmFileGroupImported
  def query_interface(this : IFsrmFileGroupImported*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileGroupImported*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileGroupImported*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileGroupImported*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileGroupImported*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileGroupImported*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileGroupImported*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileGroupImported*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileGroupImported*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileGroupImported*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileGroupImported*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileGroupImported*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmFileGroupImported*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmFileGroupImported*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_members(this : IFsrmFileGroupImported*, members : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_members.call(this, members)
  end
  def put_members(this : IFsrmFileGroupImported*, members : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_members.call(this, members)
  end
  def get_non_members(this : IFsrmFileGroupImported*, nonmembers : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_non_members.call(this, nonmembers)
  end
  def put_non_members(this : IFsrmFileGroupImported*, nonmembers : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_non_members.call(this, nonmembers)
  end
  def get_overwrite_on_commit(this : IFsrmFileGroupImported*, overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_overwrite_on_commit.call(this, overwrite)
  end
  def put_overwrite_on_commit(this : IFsrmFileGroupImported*, overwrite : Int16) : HRESULT
    @lpVtbl.value.put_overwrite_on_commit.call(this, overwrite)
  end
end
struct LibWin32::IFsrmFileGroupManager
  def query_interface(this : IFsrmFileGroupManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileGroupManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileGroupManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileGroupManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileGroupManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileGroupManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileGroupManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_file_group(this : IFsrmFileGroupManager*, filegroup : IFsrmFileGroup*) : HRESULT
    @lpVtbl.value.create_file_group.call(this, filegroup)
  end
  def get_file_group(this : IFsrmFileGroupManager*, name : UInt8*, filegroup : IFsrmFileGroup*) : HRESULT
    @lpVtbl.value.get_file_group.call(this, name, filegroup)
  end
  def enum_file_groups(this : IFsrmFileGroupManager*, options : FsrmEnumOptions, filegroups : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_file_groups.call(this, options, filegroups)
  end
  def export_file_groups(this : IFsrmFileGroupManager*, filegroupnamesarray : VARIANT*, serializedfilegroups : UInt8**) : HRESULT
    @lpVtbl.value.export_file_groups.call(this, filegroupnamesarray, serializedfilegroups)
  end
  def import_file_groups(this : IFsrmFileGroupManager*, serializedfilegroups : UInt8*, filegroupnamesarray : VARIANT*, filegroups : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_file_groups.call(this, serializedfilegroups, filegroupnamesarray, filegroups)
  end
end
struct LibWin32::IFsrmFileScreenBase
  def query_interface(this : IFsrmFileScreenBase*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreenBase*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreenBase*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreenBase*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreenBase*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreenBase*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreenBase*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileScreenBase*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileScreenBase*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileScreenBase*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileScreenBase*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileScreenBase*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_blocked_file_groups(this : IFsrmFileScreenBase*, blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.call(this, blocklist)
  end
  def put_blocked_file_groups(this : IFsrmFileScreenBase*, blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.call(this, blocklist)
  end
  def get_file_screen_flags(this : IFsrmFileScreenBase*, filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.call(this, filescreenflags)
  end
  def put_file_screen_flags(this : IFsrmFileScreenBase*, filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.call(this, filescreenflags)
  end
  def create_action(this : IFsrmFileScreenBase*, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.call(this, actiontype, action)
  end
  def enum_actions(this : IFsrmFileScreenBase*, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.call(this, actions)
  end
end
struct LibWin32::IFsrmFileScreen
  def query_interface(this : IFsrmFileScreen*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreen*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreen*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreen*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreen*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreen*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreen*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileScreen*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileScreen*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileScreen*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileScreen*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileScreen*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_blocked_file_groups(this : IFsrmFileScreen*, blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.call(this, blocklist)
  end
  def put_blocked_file_groups(this : IFsrmFileScreen*, blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.call(this, blocklist)
  end
  def get_file_screen_flags(this : IFsrmFileScreen*, filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.call(this, filescreenflags)
  end
  def put_file_screen_flags(this : IFsrmFileScreen*, filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.call(this, filescreenflags)
  end
  def create_action(this : IFsrmFileScreen*, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.call(this, actiontype, action)
  end
  def enum_actions(this : IFsrmFileScreen*, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.call(this, actions)
  end
  def get_path(this : IFsrmFileScreen*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_source_template_name(this : IFsrmFileScreen*, filescreentemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.call(this, filescreentemplatename)
  end
  def get_matches_source_template(this : IFsrmFileScreen*, matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.call(this, matches)
  end
  def get_user_sid(this : IFsrmFileScreen*, usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.call(this, usersid)
  end
  def get_user_account(this : IFsrmFileScreen*, useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.call(this, useraccount)
  end
  def apply_template(this : IFsrmFileScreen*, filescreentemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.call(this, filescreentemplatename)
  end
end
struct LibWin32::IFsrmFileScreenException
  def query_interface(this : IFsrmFileScreenException*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreenException*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreenException*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreenException*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreenException*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreenException*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreenException*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileScreenException*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileScreenException*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileScreenException*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileScreenException*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileScreenException*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_path(this : IFsrmFileScreenException*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.call(this, path)
  end
  def get_allowed_file_groups(this : IFsrmFileScreenException*, allowlist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_allowed_file_groups.call(this, allowlist)
  end
  def put_allowed_file_groups(this : IFsrmFileScreenException*, allowlist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_allowed_file_groups.call(this, allowlist)
  end
end
struct LibWin32::IFsrmFileScreenManager
  def query_interface(this : IFsrmFileScreenManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreenManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreenManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreenManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreenManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreenManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreenManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_action_variables(this : IFsrmFileScreenManager*, variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.call(this, variables)
  end
  def get_action_variable_descriptions(this : IFsrmFileScreenManager*, descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.call(this, descriptions)
  end
  def create_file_screen(this : IFsrmFileScreenManager*, path : UInt8*, filescreen : IFsrmFileScreen*) : HRESULT
    @lpVtbl.value.create_file_screen.call(this, path, filescreen)
  end
  def get_file_screen(this : IFsrmFileScreenManager*, path : UInt8*, filescreen : IFsrmFileScreen*) : HRESULT
    @lpVtbl.value.get_file_screen.call(this, path, filescreen)
  end
  def enum_file_screens(this : IFsrmFileScreenManager*, path : UInt8*, options : FsrmEnumOptions, filescreens : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_file_screens.call(this, path, options, filescreens)
  end
  def create_file_screen_exception(this : IFsrmFileScreenManager*, path : UInt8*, filescreenexception : IFsrmFileScreenException*) : HRESULT
    @lpVtbl.value.create_file_screen_exception.call(this, path, filescreenexception)
  end
  def get_file_screen_exception(this : IFsrmFileScreenManager*, path : UInt8*, filescreenexception : IFsrmFileScreenException*) : HRESULT
    @lpVtbl.value.get_file_screen_exception.call(this, path, filescreenexception)
  end
  def enum_file_screen_exceptions(this : IFsrmFileScreenManager*, path : UInt8*, options : FsrmEnumOptions, filescreenexceptions : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_file_screen_exceptions.call(this, path, options, filescreenexceptions)
  end
  def create_file_screen_collection(this : IFsrmFileScreenManager*, collection : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.create_file_screen_collection.call(this, collection)
  end
end
struct LibWin32::IFsrmFileScreenTemplate
  def query_interface(this : IFsrmFileScreenTemplate*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreenTemplate*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreenTemplate*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreenTemplate*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreenTemplate*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreenTemplate*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreenTemplate*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileScreenTemplate*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileScreenTemplate*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileScreenTemplate*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileScreenTemplate*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileScreenTemplate*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_blocked_file_groups(this : IFsrmFileScreenTemplate*, blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.call(this, blocklist)
  end
  def put_blocked_file_groups(this : IFsrmFileScreenTemplate*, blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.call(this, blocklist)
  end
  def get_file_screen_flags(this : IFsrmFileScreenTemplate*, filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.call(this, filescreenflags)
  end
  def put_file_screen_flags(this : IFsrmFileScreenTemplate*, filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.call(this, filescreenflags)
  end
  def create_action(this : IFsrmFileScreenTemplate*, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.call(this, actiontype, action)
  end
  def enum_actions(this : IFsrmFileScreenTemplate*, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.call(this, actions)
  end
  def get_name(this : IFsrmFileScreenTemplate*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmFileScreenTemplate*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def copy_template(this : IFsrmFileScreenTemplate*, filescreentemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.call(this, filescreentemplatename)
  end
  def commit_and_update_derived(this : IFsrmFileScreenTemplate*, commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.call(this, commitoptions, applyoptions, derivedobjectsresult)
  end
end
struct LibWin32::IFsrmFileScreenTemplateImported
  def query_interface(this : IFsrmFileScreenTemplateImported*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreenTemplateImported*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreenTemplateImported*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreenTemplateImported*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreenTemplateImported*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreenTemplateImported*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreenTemplateImported*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileScreenTemplateImported*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileScreenTemplateImported*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileScreenTemplateImported*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileScreenTemplateImported*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileScreenTemplateImported*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_blocked_file_groups(this : IFsrmFileScreenTemplateImported*, blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.call(this, blocklist)
  end
  def put_blocked_file_groups(this : IFsrmFileScreenTemplateImported*, blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.call(this, blocklist)
  end
  def get_file_screen_flags(this : IFsrmFileScreenTemplateImported*, filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.call(this, filescreenflags)
  end
  def put_file_screen_flags(this : IFsrmFileScreenTemplateImported*, filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.call(this, filescreenflags)
  end
  def create_action(this : IFsrmFileScreenTemplateImported*, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.call(this, actiontype, action)
  end
  def enum_actions(this : IFsrmFileScreenTemplateImported*, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.call(this, actions)
  end
  def get_name(this : IFsrmFileScreenTemplateImported*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmFileScreenTemplateImported*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def copy_template(this : IFsrmFileScreenTemplateImported*, filescreentemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.call(this, filescreentemplatename)
  end
  def commit_and_update_derived(this : IFsrmFileScreenTemplateImported*, commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.call(this, commitoptions, applyoptions, derivedobjectsresult)
  end
  def get_overwrite_on_commit(this : IFsrmFileScreenTemplateImported*, overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_overwrite_on_commit.call(this, overwrite)
  end
  def put_overwrite_on_commit(this : IFsrmFileScreenTemplateImported*, overwrite : Int16) : HRESULT
    @lpVtbl.value.put_overwrite_on_commit.call(this, overwrite)
  end
end
struct LibWin32::IFsrmFileScreenTemplateManager
  def query_interface(this : IFsrmFileScreenTemplateManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileScreenTemplateManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileScreenTemplateManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileScreenTemplateManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileScreenTemplateManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileScreenTemplateManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileScreenTemplateManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def create_template(this : IFsrmFileScreenTemplateManager*, filescreentemplate : IFsrmFileScreenTemplate*) : HRESULT
    @lpVtbl.value.create_template.call(this, filescreentemplate)
  end
  def get_template(this : IFsrmFileScreenTemplateManager*, name : UInt8*, filescreentemplate : IFsrmFileScreenTemplate*) : HRESULT
    @lpVtbl.value.get_template.call(this, name, filescreentemplate)
  end
  def enum_templates(this : IFsrmFileScreenTemplateManager*, options : FsrmEnumOptions, filescreentemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_templates.call(this, options, filescreentemplates)
  end
  def export_templates(this : IFsrmFileScreenTemplateManager*, filescreentemplatenamesarray : VARIANT*, serializedfilescreentemplates : UInt8**) : HRESULT
    @lpVtbl.value.export_templates.call(this, filescreentemplatenamesarray, serializedfilescreentemplates)
  end
  def import_templates(this : IFsrmFileScreenTemplateManager*, serializedfilescreentemplates : UInt8*, filescreentemplatenamesarray : VARIANT*, filescreentemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_templates.call(this, serializedfilescreentemplates, filescreentemplatenamesarray, filescreentemplates)
  end
end
struct LibWin32::IFsrmReportManager
  def query_interface(this : IFsrmReportManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmReportManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmReportManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmReportManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmReportManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmReportManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmReportManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def enum_report_jobs(this : IFsrmReportManager*, options : FsrmEnumOptions, reportjobs : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_report_jobs.call(this, options, reportjobs)
  end
  def create_report_job(this : IFsrmReportManager*, reportjob : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.create_report_job.call(this, reportjob)
  end
  def get_report_job(this : IFsrmReportManager*, taskname : UInt8*, reportjob : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.get_report_job.call(this, taskname, reportjob)
  end
  def get_output_directory(this : IFsrmReportManager*, context : FsrmReportGenerationContext, path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_directory.call(this, context, path)
  end
  def set_output_directory(this : IFsrmReportManager*, context : FsrmReportGenerationContext, path : UInt8*) : HRESULT
    @lpVtbl.value.set_output_directory.call(this, context, path)
  end
  def is_filter_valid_for_report_type(this : IFsrmReportManager*, reporttype : FsrmReportType, filter : FsrmReportFilter, valid : Int16*) : HRESULT
    @lpVtbl.value.is_filter_valid_for_report_type.call(this, reporttype, filter, valid)
  end
  def get_default_filter(this : IFsrmReportManager*, reporttype : FsrmReportType, filter : FsrmReportFilter, filtervalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_default_filter.call(this, reporttype, filter, filtervalue)
  end
  def set_default_filter(this : IFsrmReportManager*, reporttype : FsrmReportType, filter : FsrmReportFilter, filtervalue : VARIANT) : HRESULT
    @lpVtbl.value.set_default_filter.call(this, reporttype, filter, filtervalue)
  end
  def get_report_size_limit(this : IFsrmReportManager*, limit : FsrmReportLimit, limitvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_report_size_limit.call(this, limit, limitvalue)
  end
  def set_report_size_limit(this : IFsrmReportManager*, limit : FsrmReportLimit, limitvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_report_size_limit.call(this, limit, limitvalue)
  end
end
struct LibWin32::IFsrmReportJob
  def query_interface(this : IFsrmReportJob*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmReportJob*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmReportJob*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmReportJob*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmReportJob*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmReportJob*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmReportJob*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmReportJob*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmReportJob*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmReportJob*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_task(this : IFsrmReportJob*, taskname : UInt8**) : HRESULT
    @lpVtbl.value.get_task.call(this, taskname)
  end
  def put_task(this : IFsrmReportJob*, taskname : UInt8*) : HRESULT
    @lpVtbl.value.put_task.call(this, taskname)
  end
  def get_namespace_roots(this : IFsrmReportJob*, namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.call(this, namespaceroots)
  end
  def put_namespace_roots(this : IFsrmReportJob*, namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.call(this, namespaceroots)
  end
  def get_formats(this : IFsrmReportJob*, formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_formats.call(this, formats)
  end
  def put_formats(this : IFsrmReportJob*, formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_formats.call(this, formats)
  end
  def get_mail_to(this : IFsrmReportJob*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.call(this, mailto)
  end
  def put_mail_to(this : IFsrmReportJob*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.call(this, mailto)
  end
  def get_running_status(this : IFsrmReportJob*, runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_running_status.call(this, runningstatus)
  end
  def get_last_run(this : IFsrmReportJob*, lastrun : Float64*) : HRESULT
    @lpVtbl.value.get_last_run.call(this, lastrun)
  end
  def get_last_error(this : IFsrmReportJob*, lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_last_error.call(this, lasterror)
  end
  def get_last_generated_in_directory(this : IFsrmReportJob*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_last_generated_in_directory.call(this, path)
  end
  def enum_reports(this : IFsrmReportJob*, reports : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_reports.call(this, reports)
  end
  def create_report(this : IFsrmReportJob*, reporttype : FsrmReportType, report : IFsrmReport*) : HRESULT
    @lpVtbl.value.create_report.call(this, reporttype, report)
  end
  def run(this : IFsrmReportJob*, context : FsrmReportGenerationContext) : HRESULT
    @lpVtbl.value.run.call(this, context)
  end
  def wait_for_completion(this : IFsrmReportJob*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.call(this, waitseconds, completed)
  end
  def cancel(this : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::IFsrmReport
  def query_interface(this : IFsrmReport*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmReport*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmReport*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmReport*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmReport*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmReport*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmReport*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IFsrmReport*, reporttype : FsrmReportType*) : HRESULT
    @lpVtbl.value.get_type.call(this, reporttype)
  end
  def get_name(this : IFsrmReport*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmReport*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_description(this : IFsrmReport*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmReport*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def get_last_generated_file_name_prefix(this : IFsrmReport*, prefix : UInt8**) : HRESULT
    @lpVtbl.value.get_last_generated_file_name_prefix.call(this, prefix)
  end
  def get_filter(this : IFsrmReport*, filter : FsrmReportFilter, filtervalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_filter.call(this, filter, filtervalue)
  end
  def set_filter(this : IFsrmReport*, filter : FsrmReportFilter, filtervalue : VARIANT) : HRESULT
    @lpVtbl.value.set_filter.call(this, filter, filtervalue)
  end
  def delete(this : IFsrmReport*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IFsrmReportScheduler
  def query_interface(this : IFsrmReportScheduler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmReportScheduler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmReportScheduler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmReportScheduler*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmReportScheduler*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmReportScheduler*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmReportScheduler*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def verify_namespaces(this : IFsrmReportScheduler*, namespacessafearray : VARIANT*) : HRESULT
    @lpVtbl.value.verify_namespaces.call(this, namespacessafearray)
  end
  def create_schedule_task(this : IFsrmReportScheduler*, taskname : UInt8*, namespacessafearray : VARIANT*, serializedtask : UInt8*) : HRESULT
    @lpVtbl.value.create_schedule_task.call(this, taskname, namespacessafearray, serializedtask)
  end
  def modify_schedule_task(this : IFsrmReportScheduler*, taskname : UInt8*, namespacessafearray : VARIANT*, serializedtask : UInt8*) : HRESULT
    @lpVtbl.value.modify_schedule_task.call(this, taskname, namespacessafearray, serializedtask)
  end
  def delete_schedule_task(this : IFsrmReportScheduler*, taskname : UInt8*) : HRESULT
    @lpVtbl.value.delete_schedule_task.call(this, taskname)
  end
end
struct LibWin32::IFsrmFileManagementJobManager
  def query_interface(this : IFsrmFileManagementJobManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileManagementJobManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileManagementJobManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileManagementJobManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileManagementJobManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileManagementJobManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileManagementJobManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_action_variables(this : IFsrmFileManagementJobManager*, variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.call(this, variables)
  end
  def get_action_variable_descriptions(this : IFsrmFileManagementJobManager*, descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.call(this, descriptions)
  end
  def enum_file_management_jobs(this : IFsrmFileManagementJobManager*, options : FsrmEnumOptions, filemanagementjobs : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_file_management_jobs.call(this, options, filemanagementjobs)
  end
  def create_file_management_job(this : IFsrmFileManagementJobManager*, filemanagementjob : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.create_file_management_job.call(this, filemanagementjob)
  end
  def get_file_management_job(this : IFsrmFileManagementJobManager*, name : UInt8*, filemanagementjob : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.get_file_management_job.call(this, name, filemanagementjob)
  end
end
struct LibWin32::IFsrmFileManagementJob
  def query_interface(this : IFsrmFileManagementJob*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileManagementJob*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileManagementJob*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileManagementJob*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileManagementJob*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileManagementJob*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileManagementJob*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmFileManagementJob*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmFileManagementJob*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmFileManagementJob*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmFileManagementJob*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmFileManagementJob*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_namespace_roots(this : IFsrmFileManagementJob*, namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.call(this, namespaceroots)
  end
  def put_namespace_roots(this : IFsrmFileManagementJob*, namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.call(this, namespaceroots)
  end
  def get_enabled(this : IFsrmFileManagementJob*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : IFsrmFileManagementJob*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_operation_type(this : IFsrmFileManagementJob*, operationtype : FsrmFileManagementType*) : HRESULT
    @lpVtbl.value.get_operation_type.call(this, operationtype)
  end
  def put_operation_type(this : IFsrmFileManagementJob*, operationtype : FsrmFileManagementType) : HRESULT
    @lpVtbl.value.put_operation_type.call(this, operationtype)
  end
  def get_expiration_directory(this : IFsrmFileManagementJob*, expirationdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_expiration_directory.call(this, expirationdirectory)
  end
  def put_expiration_directory(this : IFsrmFileManagementJob*, expirationdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_expiration_directory.call(this, expirationdirectory)
  end
  def get_custom_action(this : IFsrmFileManagementJob*, action : IFsrmActionCommand*) : HRESULT
    @lpVtbl.value.get_custom_action.call(this, action)
  end
  def get_notifications(this : IFsrmFileManagementJob*, notifications : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_notifications.call(this, notifications)
  end
  def get_logging(this : IFsrmFileManagementJob*, loggingflags : Int32*) : HRESULT
    @lpVtbl.value.get_logging.call(this, loggingflags)
  end
  def put_logging(this : IFsrmFileManagementJob*, loggingflags : Int32) : HRESULT
    @lpVtbl.value.put_logging.call(this, loggingflags)
  end
  def get_report_enabled(this : IFsrmFileManagementJob*, reportenabled : Int16*) : HRESULT
    @lpVtbl.value.get_report_enabled.call(this, reportenabled)
  end
  def put_report_enabled(this : IFsrmFileManagementJob*, reportenabled : Int16) : HRESULT
    @lpVtbl.value.put_report_enabled.call(this, reportenabled)
  end
  def get_formats(this : IFsrmFileManagementJob*, formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_formats.call(this, formats)
  end
  def put_formats(this : IFsrmFileManagementJob*, formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_formats.call(this, formats)
  end
  def get_mail_to(this : IFsrmFileManagementJob*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.call(this, mailto)
  end
  def put_mail_to(this : IFsrmFileManagementJob*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.call(this, mailto)
  end
  def get_days_since_file_created(this : IFsrmFileManagementJob*, dayssincecreation : Int32*) : HRESULT
    @lpVtbl.value.get_days_since_file_created.call(this, dayssincecreation)
  end
  def put_days_since_file_created(this : IFsrmFileManagementJob*, dayssincecreation : Int32) : HRESULT
    @lpVtbl.value.put_days_since_file_created.call(this, dayssincecreation)
  end
  def get_days_since_file_last_accessed(this : IFsrmFileManagementJob*, dayssinceaccess : Int32*) : HRESULT
    @lpVtbl.value.get_days_since_file_last_accessed.call(this, dayssinceaccess)
  end
  def put_days_since_file_last_accessed(this : IFsrmFileManagementJob*, dayssinceaccess : Int32) : HRESULT
    @lpVtbl.value.put_days_since_file_last_accessed.call(this, dayssinceaccess)
  end
  def get_days_since_file_last_modified(this : IFsrmFileManagementJob*, dayssincemodify : Int32*) : HRESULT
    @lpVtbl.value.get_days_since_file_last_modified.call(this, dayssincemodify)
  end
  def put_days_since_file_last_modified(this : IFsrmFileManagementJob*, dayssincemodify : Int32) : HRESULT
    @lpVtbl.value.put_days_since_file_last_modified.call(this, dayssincemodify)
  end
  def get_property_conditions(this : IFsrmFileManagementJob*, propertyconditions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_property_conditions.call(this, propertyconditions)
  end
  def get_from_date(this : IFsrmFileManagementJob*, fromdate : Float64*) : HRESULT
    @lpVtbl.value.get_from_date.call(this, fromdate)
  end
  def put_from_date(this : IFsrmFileManagementJob*, fromdate : Float64) : HRESULT
    @lpVtbl.value.put_from_date.call(this, fromdate)
  end
  def get_task(this : IFsrmFileManagementJob*, taskname : UInt8**) : HRESULT
    @lpVtbl.value.get_task.call(this, taskname)
  end
  def put_task(this : IFsrmFileManagementJob*, taskname : UInt8*) : HRESULT
    @lpVtbl.value.put_task.call(this, taskname)
  end
  def get_parameters(this : IFsrmFileManagementJob*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmFileManagementJob*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
  def get_running_status(this : IFsrmFileManagementJob*, runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_running_status.call(this, runningstatus)
  end
  def get_last_error(this : IFsrmFileManagementJob*, lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_last_error.call(this, lasterror)
  end
  def get_last_report_path_without_extension(this : IFsrmFileManagementJob*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_last_report_path_without_extension.call(this, path)
  end
  def get_last_run(this : IFsrmFileManagementJob*, lastrun : Float64*) : HRESULT
    @lpVtbl.value.get_last_run.call(this, lastrun)
  end
  def get_file_name_pattern(this : IFsrmFileManagementJob*, filenamepattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_pattern.call(this, filenamepattern)
  end
  def put_file_name_pattern(this : IFsrmFileManagementJob*, filenamepattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_pattern.call(this, filenamepattern)
  end
  def run(this : IFsrmFileManagementJob*, context : FsrmReportGenerationContext) : HRESULT
    @lpVtbl.value.run.call(this, context)
  end
  def wait_for_completion(this : IFsrmFileManagementJob*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.call(this, waitseconds, completed)
  end
  def cancel(this : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
  def add_notification(this : IFsrmFileManagementJob*, days : Int32) : HRESULT
    @lpVtbl.value.add_notification.call(this, days)
  end
  def delete_notification(this : IFsrmFileManagementJob*, days : Int32) : HRESULT
    @lpVtbl.value.delete_notification.call(this, days)
  end
  def modify_notification(this : IFsrmFileManagementJob*, days : Int32, newdays : Int32) : HRESULT
    @lpVtbl.value.modify_notification.call(this, days, newdays)
  end
  def create_notification_action(this : IFsrmFileManagementJob*, days : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_notification_action.call(this, days, actiontype, action)
  end
  def enum_notification_actions(this : IFsrmFileManagementJob*, days : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_notification_actions.call(this, days, actions)
  end
  def create_property_condition(this : IFsrmFileManagementJob*, name : UInt8*, propertycondition : IFsrmPropertyCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, name, propertycondition)
  end
  def create_custom_action(this : IFsrmFileManagementJob*, customaction : IFsrmActionCommand*) : HRESULT
    @lpVtbl.value.create_custom_action.call(this, customaction)
  end
end
struct LibWin32::IFsrmPropertyCondition
  def query_interface(this : IFsrmPropertyCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPropertyCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPropertyCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPropertyCondition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPropertyCondition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPropertyCondition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPropertyCondition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFsrmPropertyCondition*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmPropertyCondition*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_type(this : IFsrmPropertyCondition*, type : FsrmPropertyConditionType*) : HRESULT
    @lpVtbl.value.get_type.call(this, type)
  end
  def put_type(this : IFsrmPropertyCondition*, type : FsrmPropertyConditionType) : HRESULT
    @lpVtbl.value.put_type.call(this, type)
  end
  def get_value(this : IFsrmPropertyCondition*, value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, value)
  end
  def put_value(this : IFsrmPropertyCondition*, value : UInt8*) : HRESULT
    @lpVtbl.value.put_value.call(this, value)
  end
  def delete(this : IFsrmPropertyCondition*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IFsrmFileCondition
  def query_interface(this : IFsrmFileCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileCondition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileCondition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileCondition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileCondition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IFsrmFileCondition*, pval : FsrmFileConditionType*) : HRESULT
    @lpVtbl.value.get_type.call(this, pval)
  end
  def delete(this : IFsrmFileCondition*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
end
struct LibWin32::IFsrmFileConditionProperty
  def query_interface(this : IFsrmFileConditionProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmFileConditionProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmFileConditionProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmFileConditionProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmFileConditionProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmFileConditionProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmFileConditionProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_type(this : IFsrmFileConditionProperty*, pval : FsrmFileConditionType*) : HRESULT
    @lpVtbl.value.get_type.call(this, pval)
  end
  def delete(this : IFsrmFileConditionProperty*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def get_property_name(this : IFsrmFileConditionProperty*, pval : UInt8**) : HRESULT
    @lpVtbl.value.get_property_name.call(this, pval)
  end
  def put_property_name(this : IFsrmFileConditionProperty*, newval : UInt8*) : HRESULT
    @lpVtbl.value.put_property_name.call(this, newval)
  end
  def get_property_id(this : IFsrmFileConditionProperty*, pval : FsrmFileSystemPropertyId*) : HRESULT
    @lpVtbl.value.get_property_id.call(this, pval)
  end
  def put_property_id(this : IFsrmFileConditionProperty*, newval : FsrmFileSystemPropertyId) : HRESULT
    @lpVtbl.value.put_property_id.call(this, newval)
  end
  def get_operator(this : IFsrmFileConditionProperty*, pval : FsrmPropertyConditionType*) : HRESULT
    @lpVtbl.value.get_operator.call(this, pval)
  end
  def put_operator(this : IFsrmFileConditionProperty*, newval : FsrmPropertyConditionType) : HRESULT
    @lpVtbl.value.put_operator.call(this, newval)
  end
  def get_value_type(this : IFsrmFileConditionProperty*, pval : FsrmPropertyValueType*) : HRESULT
    @lpVtbl.value.get_value_type.call(this, pval)
  end
  def put_value_type(this : IFsrmFileConditionProperty*, newval : FsrmPropertyValueType) : HRESULT
    @lpVtbl.value.put_value_type.call(this, newval)
  end
  def get_value(this : IFsrmFileConditionProperty*, pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, pval)
  end
  def put_value(this : IFsrmFileConditionProperty*, newval : VARIANT) : HRESULT
    @lpVtbl.value.put_value.call(this, newval)
  end
end
struct LibWin32::IFsrmPropertyDefinition
  def query_interface(this : IFsrmPropertyDefinition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPropertyDefinition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPropertyDefinition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPropertyDefinition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPropertyDefinition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPropertyDefinition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPropertyDefinition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmPropertyDefinition*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmPropertyDefinition*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmPropertyDefinition*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmPropertyDefinition*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmPropertyDefinition*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_type(this : IFsrmPropertyDefinition*, type : FsrmPropertyDefinitionType*) : HRESULT
    @lpVtbl.value.get_type.call(this, type)
  end
  def put_type(this : IFsrmPropertyDefinition*, type : FsrmPropertyDefinitionType) : HRESULT
    @lpVtbl.value.put_type.call(this, type)
  end
  def get_possible_values(this : IFsrmPropertyDefinition*, possiblevalues : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_possible_values.call(this, possiblevalues)
  end
  def put_possible_values(this : IFsrmPropertyDefinition*, possiblevalues : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_possible_values.call(this, possiblevalues)
  end
  def get_value_descriptions(this : IFsrmPropertyDefinition*, valuedescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_value_descriptions.call(this, valuedescriptions)
  end
  def put_value_descriptions(this : IFsrmPropertyDefinition*, valuedescriptions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_value_descriptions.call(this, valuedescriptions)
  end
  def get_parameters(this : IFsrmPropertyDefinition*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmPropertyDefinition*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
end
struct LibWin32::IFsrmPropertyDefinition2
  def query_interface(this : IFsrmPropertyDefinition2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPropertyDefinition2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPropertyDefinition2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPropertyDefinition2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPropertyDefinition2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPropertyDefinition2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPropertyDefinition2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmPropertyDefinition2*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmPropertyDefinition2*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmPropertyDefinition2*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmPropertyDefinition2*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmPropertyDefinition2*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmPropertyDefinition2*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmPropertyDefinition2*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_type(this : IFsrmPropertyDefinition2*, type : FsrmPropertyDefinitionType*) : HRESULT
    @lpVtbl.value.get_type.call(this, type)
  end
  def put_type(this : IFsrmPropertyDefinition2*, type : FsrmPropertyDefinitionType) : HRESULT
    @lpVtbl.value.put_type.call(this, type)
  end
  def get_possible_values(this : IFsrmPropertyDefinition2*, possiblevalues : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_possible_values.call(this, possiblevalues)
  end
  def put_possible_values(this : IFsrmPropertyDefinition2*, possiblevalues : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_possible_values.call(this, possiblevalues)
  end
  def get_value_descriptions(this : IFsrmPropertyDefinition2*, valuedescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_value_descriptions.call(this, valuedescriptions)
  end
  def put_value_descriptions(this : IFsrmPropertyDefinition2*, valuedescriptions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_value_descriptions.call(this, valuedescriptions)
  end
  def get_parameters(this : IFsrmPropertyDefinition2*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmPropertyDefinition2*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
  def get_property_definition_flags(this : IFsrmPropertyDefinition2*, propertydefinitionflags : Int32*) : HRESULT
    @lpVtbl.value.get_property_definition_flags.call(this, propertydefinitionflags)
  end
  def get_display_name(this : IFsrmPropertyDefinition2*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, name)
  end
  def put_display_name(this : IFsrmPropertyDefinition2*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.call(this, name)
  end
  def get_applies_to(this : IFsrmPropertyDefinition2*, appliesto : Int32*) : HRESULT
    @lpVtbl.value.get_applies_to.call(this, appliesto)
  end
  def get_value_definitions(this : IFsrmPropertyDefinition2*, valuedefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_value_definitions.call(this, valuedefinitions)
  end
end
struct LibWin32::IFsrmPropertyDefinitionValue
  def query_interface(this : IFsrmPropertyDefinitionValue*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPropertyDefinitionValue*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPropertyDefinitionValue*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPropertyDefinitionValue*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPropertyDefinitionValue*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPropertyDefinitionValue*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPropertyDefinitionValue*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFsrmPropertyDefinitionValue*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_display_name(this : IFsrmPropertyDefinitionValue*, displayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.call(this, displayname)
  end
  def get_description(this : IFsrmPropertyDefinitionValue*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def get_unique_id(this : IFsrmPropertyDefinitionValue*, uniqueid : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_id.call(this, uniqueid)
  end
end
struct LibWin32::IFsrmProperty
  def query_interface(this : IFsrmProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFsrmProperty*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_value(this : IFsrmProperty*, value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, value)
  end
  def get_sources(this : IFsrmProperty*, sources : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_sources.call(this, sources)
  end
  def get_property_flags(this : IFsrmProperty*, flags : Int32*) : HRESULT
    @lpVtbl.value.get_property_flags.call(this, flags)
  end
end
struct LibWin32::IFsrmRule
  def query_interface(this : IFsrmRule*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmRule*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmRule*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmRule*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmRule*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmRule*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmRule*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmRule*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmRule*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmRule*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmRule*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmRule*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmRule*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmRule*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_rule_type(this : IFsrmRule*, ruletype : FsrmRuleType*) : HRESULT
    @lpVtbl.value.get_rule_type.call(this, ruletype)
  end
  def get_module_definition_name(this : IFsrmRule*, moduledefinitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_module_definition_name.call(this, moduledefinitionname)
  end
  def put_module_definition_name(this : IFsrmRule*, moduledefinitionname : UInt8*) : HRESULT
    @lpVtbl.value.put_module_definition_name.call(this, moduledefinitionname)
  end
  def get_namespace_roots(this : IFsrmRule*, namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.call(this, namespaceroots)
  end
  def put_namespace_roots(this : IFsrmRule*, namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.call(this, namespaceroots)
  end
  def get_rule_flags(this : IFsrmRule*, ruleflags : Int32*) : HRESULT
    @lpVtbl.value.get_rule_flags.call(this, ruleflags)
  end
  def put_rule_flags(this : IFsrmRule*, ruleflags : Int32) : HRESULT
    @lpVtbl.value.put_rule_flags.call(this, ruleflags)
  end
  def get_parameters(this : IFsrmRule*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmRule*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
  def get_last_modified(this : IFsrmRule*, lastmodified : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modified.call(this, lastmodified)
  end
end
struct LibWin32::IFsrmClassificationRule
  def query_interface(this : IFsrmClassificationRule*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmClassificationRule*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmClassificationRule*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmClassificationRule*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmClassificationRule*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmClassificationRule*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmClassificationRule*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmClassificationRule*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmClassificationRule*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmClassificationRule*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmClassificationRule*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmClassificationRule*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_name(this : IFsrmClassificationRule*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmClassificationRule*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_rule_type(this : IFsrmClassificationRule*, ruletype : FsrmRuleType*) : HRESULT
    @lpVtbl.value.get_rule_type.call(this, ruletype)
  end
  def get_module_definition_name(this : IFsrmClassificationRule*, moduledefinitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_module_definition_name.call(this, moduledefinitionname)
  end
  def put_module_definition_name(this : IFsrmClassificationRule*, moduledefinitionname : UInt8*) : HRESULT
    @lpVtbl.value.put_module_definition_name.call(this, moduledefinitionname)
  end
  def get_namespace_roots(this : IFsrmClassificationRule*, namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.call(this, namespaceroots)
  end
  def put_namespace_roots(this : IFsrmClassificationRule*, namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.call(this, namespaceroots)
  end
  def get_rule_flags(this : IFsrmClassificationRule*, ruleflags : Int32*) : HRESULT
    @lpVtbl.value.get_rule_flags.call(this, ruleflags)
  end
  def put_rule_flags(this : IFsrmClassificationRule*, ruleflags : Int32) : HRESULT
    @lpVtbl.value.put_rule_flags.call(this, ruleflags)
  end
  def get_parameters(this : IFsrmClassificationRule*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmClassificationRule*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
  def get_last_modified(this : IFsrmClassificationRule*, lastmodified : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modified.call(this, lastmodified)
  end
  def get_execution_option(this : IFsrmClassificationRule*, executionoption : FsrmExecutionOption*) : HRESULT
    @lpVtbl.value.get_execution_option.call(this, executionoption)
  end
  def put_execution_option(this : IFsrmClassificationRule*, executionoption : FsrmExecutionOption) : HRESULT
    @lpVtbl.value.put_execution_option.call(this, executionoption)
  end
  def get_property_affected(this : IFsrmClassificationRule*, property : UInt8**) : HRESULT
    @lpVtbl.value.get_property_affected.call(this, property)
  end
  def put_property_affected(this : IFsrmClassificationRule*, property : UInt8*) : HRESULT
    @lpVtbl.value.put_property_affected.call(this, property)
  end
  def get_value(this : IFsrmClassificationRule*, value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, value)
  end
  def put_value(this : IFsrmClassificationRule*, value : UInt8*) : HRESULT
    @lpVtbl.value.put_value.call(this, value)
  end
end
struct LibWin32::IFsrmPipelineModuleDefinition
  def query_interface(this : IFsrmPipelineModuleDefinition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPipelineModuleDefinition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPipelineModuleDefinition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPipelineModuleDefinition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPipelineModuleDefinition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPipelineModuleDefinition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPipelineModuleDefinition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmPipelineModuleDefinition*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmPipelineModuleDefinition*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmPipelineModuleDefinition*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_module_clsid(this : IFsrmPipelineModuleDefinition*, moduleclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_module_clsid.call(this, moduleclsid)
  end
  def put_module_clsid(this : IFsrmPipelineModuleDefinition*, moduleclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_module_clsid.call(this, moduleclsid)
  end
  def get_name(this : IFsrmPipelineModuleDefinition*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmPipelineModuleDefinition*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_company(this : IFsrmPipelineModuleDefinition*, company : UInt8**) : HRESULT
    @lpVtbl.value.get_company.call(this, company)
  end
  def put_company(this : IFsrmPipelineModuleDefinition*, company : UInt8*) : HRESULT
    @lpVtbl.value.put_company.call(this, company)
  end
  def get_version(this : IFsrmPipelineModuleDefinition*, version : UInt8**) : HRESULT
    @lpVtbl.value.get_version.call(this, version)
  end
  def put_version(this : IFsrmPipelineModuleDefinition*, version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.call(this, version)
  end
  def get_module_type(this : IFsrmPipelineModuleDefinition*, moduletype : FsrmPipelineModuleType*) : HRESULT
    @lpVtbl.value.get_module_type.call(this, moduletype)
  end
  def get_enabled(this : IFsrmPipelineModuleDefinition*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : IFsrmPipelineModuleDefinition*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_needs_file_content(this : IFsrmPipelineModuleDefinition*, needsfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_needs_file_content.call(this, needsfilecontent)
  end
  def put_needs_file_content(this : IFsrmPipelineModuleDefinition*, needsfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_needs_file_content.call(this, needsfilecontent)
  end
  def get_account(this : IFsrmPipelineModuleDefinition*, retrievalaccount : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.call(this, retrievalaccount)
  end
  def put_account(this : IFsrmPipelineModuleDefinition*, retrievalaccount : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.call(this, retrievalaccount)
  end
  def get_supported_extensions(this : IFsrmPipelineModuleDefinition*, supportedextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_extensions.call(this, supportedextensions)
  end
  def put_supported_extensions(this : IFsrmPipelineModuleDefinition*, supportedextensions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_supported_extensions.call(this, supportedextensions)
  end
  def get_parameters(this : IFsrmPipelineModuleDefinition*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmPipelineModuleDefinition*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
end
struct LibWin32::IFsrmClassifierModuleDefinition
  def query_interface(this : IFsrmClassifierModuleDefinition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmClassifierModuleDefinition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmClassifierModuleDefinition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmClassifierModuleDefinition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmClassifierModuleDefinition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmClassifierModuleDefinition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmClassifierModuleDefinition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmClassifierModuleDefinition*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmClassifierModuleDefinition*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmClassifierModuleDefinition*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmClassifierModuleDefinition*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmClassifierModuleDefinition*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_module_clsid(this : IFsrmClassifierModuleDefinition*, moduleclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_module_clsid.call(this, moduleclsid)
  end
  def put_module_clsid(this : IFsrmClassifierModuleDefinition*, moduleclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_module_clsid.call(this, moduleclsid)
  end
  def get_name(this : IFsrmClassifierModuleDefinition*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmClassifierModuleDefinition*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_company(this : IFsrmClassifierModuleDefinition*, company : UInt8**) : HRESULT
    @lpVtbl.value.get_company.call(this, company)
  end
  def put_company(this : IFsrmClassifierModuleDefinition*, company : UInt8*) : HRESULT
    @lpVtbl.value.put_company.call(this, company)
  end
  def get_version(this : IFsrmClassifierModuleDefinition*, version : UInt8**) : HRESULT
    @lpVtbl.value.get_version.call(this, version)
  end
  def put_version(this : IFsrmClassifierModuleDefinition*, version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.call(this, version)
  end
  def get_module_type(this : IFsrmClassifierModuleDefinition*, moduletype : FsrmPipelineModuleType*) : HRESULT
    @lpVtbl.value.get_module_type.call(this, moduletype)
  end
  def get_enabled(this : IFsrmClassifierModuleDefinition*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : IFsrmClassifierModuleDefinition*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_needs_file_content(this : IFsrmClassifierModuleDefinition*, needsfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_needs_file_content.call(this, needsfilecontent)
  end
  def put_needs_file_content(this : IFsrmClassifierModuleDefinition*, needsfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_needs_file_content.call(this, needsfilecontent)
  end
  def get_account(this : IFsrmClassifierModuleDefinition*, retrievalaccount : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.call(this, retrievalaccount)
  end
  def put_account(this : IFsrmClassifierModuleDefinition*, retrievalaccount : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.call(this, retrievalaccount)
  end
  def get_supported_extensions(this : IFsrmClassifierModuleDefinition*, supportedextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_extensions.call(this, supportedextensions)
  end
  def put_supported_extensions(this : IFsrmClassifierModuleDefinition*, supportedextensions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_supported_extensions.call(this, supportedextensions)
  end
  def get_parameters(this : IFsrmClassifierModuleDefinition*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmClassifierModuleDefinition*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
  def get_properties_affected(this : IFsrmClassifierModuleDefinition*, propertiesaffected : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_properties_affected.call(this, propertiesaffected)
  end
  def put_properties_affected(this : IFsrmClassifierModuleDefinition*, propertiesaffected : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_properties_affected.call(this, propertiesaffected)
  end
  def get_properties_used(this : IFsrmClassifierModuleDefinition*, propertiesused : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_properties_used.call(this, propertiesused)
  end
  def put_properties_used(this : IFsrmClassifierModuleDefinition*, propertiesused : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_properties_used.call(this, propertiesused)
  end
  def get_needs_explicit_value(this : IFsrmClassifierModuleDefinition*, needsexplicitvalue : Int16*) : HRESULT
    @lpVtbl.value.get_needs_explicit_value.call(this, needsexplicitvalue)
  end
  def put_needs_explicit_value(this : IFsrmClassifierModuleDefinition*, needsexplicitvalue : Int16) : HRESULT
    @lpVtbl.value.put_needs_explicit_value.call(this, needsexplicitvalue)
  end
end
struct LibWin32::IFsrmStorageModuleDefinition
  def query_interface(this : IFsrmStorageModuleDefinition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmStorageModuleDefinition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmStorageModuleDefinition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmStorageModuleDefinition*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmStorageModuleDefinition*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmStorageModuleDefinition*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmStorageModuleDefinition*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_id(this : IFsrmStorageModuleDefinition*, id : Guid*) : HRESULT
    @lpVtbl.value.get_id.call(this, id)
  end
  def get_description(this : IFsrmStorageModuleDefinition*, description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, description)
  end
  def put_description(this : IFsrmStorageModuleDefinition*, description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.call(this, description)
  end
  def delete(this : IFsrmStorageModuleDefinition*) : HRESULT
    @lpVtbl.value.delete.call(this)
  end
  def commit(this : IFsrmStorageModuleDefinition*) : HRESULT
    @lpVtbl.value.commit.call(this)
  end
  def get_module_clsid(this : IFsrmStorageModuleDefinition*, moduleclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_module_clsid.call(this, moduleclsid)
  end
  def put_module_clsid(this : IFsrmStorageModuleDefinition*, moduleclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_module_clsid.call(this, moduleclsid)
  end
  def get_name(this : IFsrmStorageModuleDefinition*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def put_name(this : IFsrmStorageModuleDefinition*, name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.call(this, name)
  end
  def get_company(this : IFsrmStorageModuleDefinition*, company : UInt8**) : HRESULT
    @lpVtbl.value.get_company.call(this, company)
  end
  def put_company(this : IFsrmStorageModuleDefinition*, company : UInt8*) : HRESULT
    @lpVtbl.value.put_company.call(this, company)
  end
  def get_version(this : IFsrmStorageModuleDefinition*, version : UInt8**) : HRESULT
    @lpVtbl.value.get_version.call(this, version)
  end
  def put_version(this : IFsrmStorageModuleDefinition*, version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.call(this, version)
  end
  def get_module_type(this : IFsrmStorageModuleDefinition*, moduletype : FsrmPipelineModuleType*) : HRESULT
    @lpVtbl.value.get_module_type.call(this, moduletype)
  end
  def get_enabled(this : IFsrmStorageModuleDefinition*, enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.call(this, enabled)
  end
  def put_enabled(this : IFsrmStorageModuleDefinition*, enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.call(this, enabled)
  end
  def get_needs_file_content(this : IFsrmStorageModuleDefinition*, needsfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_needs_file_content.call(this, needsfilecontent)
  end
  def put_needs_file_content(this : IFsrmStorageModuleDefinition*, needsfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_needs_file_content.call(this, needsfilecontent)
  end
  def get_account(this : IFsrmStorageModuleDefinition*, retrievalaccount : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.call(this, retrievalaccount)
  end
  def put_account(this : IFsrmStorageModuleDefinition*, retrievalaccount : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.call(this, retrievalaccount)
  end
  def get_supported_extensions(this : IFsrmStorageModuleDefinition*, supportedextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_extensions.call(this, supportedextensions)
  end
  def put_supported_extensions(this : IFsrmStorageModuleDefinition*, supportedextensions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_supported_extensions.call(this, supportedextensions)
  end
  def get_parameters(this : IFsrmStorageModuleDefinition*, parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.call(this, parameters)
  end
  def put_parameters(this : IFsrmStorageModuleDefinition*, parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.call(this, parameters)
  end
  def get_capabilities(this : IFsrmStorageModuleDefinition*, capabilities : FsrmStorageModuleCaps*) : HRESULT
    @lpVtbl.value.get_capabilities.call(this, capabilities)
  end
  def put_capabilities(this : IFsrmStorageModuleDefinition*, capabilities : FsrmStorageModuleCaps) : HRESULT
    @lpVtbl.value.put_capabilities.call(this, capabilities)
  end
  def get_storage_type(this : IFsrmStorageModuleDefinition*, storagetype : FsrmStorageModuleType*) : HRESULT
    @lpVtbl.value.get_storage_type.call(this, storagetype)
  end
  def put_storage_type(this : IFsrmStorageModuleDefinition*, storagetype : FsrmStorageModuleType) : HRESULT
    @lpVtbl.value.put_storage_type.call(this, storagetype)
  end
  def get_updates_file_content(this : IFsrmStorageModuleDefinition*, updatesfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_updates_file_content.call(this, updatesfilecontent)
  end
  def put_updates_file_content(this : IFsrmStorageModuleDefinition*, updatesfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_updates_file_content.call(this, updatesfilecontent)
  end
end
struct LibWin32::IFsrmClassificationManager
  def query_interface(this : IFsrmClassificationManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmClassificationManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmClassificationManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmClassificationManager*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmClassificationManager*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmClassificationManager*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmClassificationManager*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_classification_report_formats(this : IFsrmClassificationManager*, formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_classification_report_formats.call(this, formats)
  end
  def put_classification_report_formats(this : IFsrmClassificationManager*, formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_classification_report_formats.call(this, formats)
  end
  def get_logging(this : IFsrmClassificationManager*, logging : Int32*) : HRESULT
    @lpVtbl.value.get_logging.call(this, logging)
  end
  def put_logging(this : IFsrmClassificationManager*, logging : Int32) : HRESULT
    @lpVtbl.value.put_logging.call(this, logging)
  end
  def get_classification_report_mail_to(this : IFsrmClassificationManager*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_report_mail_to.call(this, mailto)
  end
  def put_classification_report_mail_to(this : IFsrmClassificationManager*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_classification_report_mail_to.call(this, mailto)
  end
  def get_classification_report_enabled(this : IFsrmClassificationManager*, reportenabled : Int16*) : HRESULT
    @lpVtbl.value.get_classification_report_enabled.call(this, reportenabled)
  end
  def put_classification_report_enabled(this : IFsrmClassificationManager*, reportenabled : Int16) : HRESULT
    @lpVtbl.value.put_classification_report_enabled.call(this, reportenabled)
  end
  def get_classification_last_report_path_without_extension(this : IFsrmClassificationManager*, lastreportpath : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_report_path_without_extension.call(this, lastreportpath)
  end
  def get_classification_last_error(this : IFsrmClassificationManager*, lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_error.call(this, lasterror)
  end
  def get_classification_running_status(this : IFsrmClassificationManager*, runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_classification_running_status.call(this, runningstatus)
  end
  def enum_property_definitions(this : IFsrmClassificationManager*, options : FsrmEnumOptions, propertydefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_property_definitions.call(this, options, propertydefinitions)
  end
  def create_property_definition(this : IFsrmClassificationManager*, propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.create_property_definition.call(this, propertydefinition)
  end
  def get_property_definition(this : IFsrmClassificationManager*, propertyname : UInt8*, propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.get_property_definition.call(this, propertyname, propertydefinition)
  end
  def enum_rules(this : IFsrmClassificationManager*, ruletype : FsrmRuleType, options : FsrmEnumOptions, rules : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_rules.call(this, ruletype, options, rules)
  end
  def create_rule(this : IFsrmClassificationManager*, ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.create_rule.call(this, ruletype, rule)
  end
  def get_rule(this : IFsrmClassificationManager*, rulename : UInt8*, ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.get_rule.call(this, rulename, ruletype, rule)
  end
  def enum_module_definitions(this : IFsrmClassificationManager*, moduletype : FsrmPipelineModuleType, options : FsrmEnumOptions, moduledefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_module_definitions.call(this, moduletype, options, moduledefinitions)
  end
  def create_module_definition(this : IFsrmClassificationManager*, moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.create_module_definition.call(this, moduletype, moduledefinition)
  end
  def get_module_definition(this : IFsrmClassificationManager*, modulename : UInt8*, moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.get_module_definition.call(this, modulename, moduletype, moduledefinition)
  end
  def run_classification(this : IFsrmClassificationManager*, context : FsrmReportGenerationContext, reserved : UInt8*) : HRESULT
    @lpVtbl.value.run_classification.call(this, context, reserved)
  end
  def wait_for_classification_completion(this : IFsrmClassificationManager*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_classification_completion.call(this, waitseconds, completed)
  end
  def cancel_classification(this : IFsrmClassificationManager*) : HRESULT
    @lpVtbl.value.cancel_classification.call(this)
  end
  def enum_file_properties(this : IFsrmClassificationManager*, filepath : UInt8*, options : FsrmGetFilePropertyOptions, fileproperties : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_file_properties.call(this, filepath, options, fileproperties)
  end
  def get_file_property(this : IFsrmClassificationManager*, filepath : UInt8*, propertyname : UInt8*, options : FsrmGetFilePropertyOptions, property : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.call(this, filepath, propertyname, options, property)
  end
  def set_file_property(this : IFsrmClassificationManager*, filepath : UInt8*, propertyname : UInt8*, propertyvalue : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.call(this, filepath, propertyname, propertyvalue)
  end
  def clear_file_property(this : IFsrmClassificationManager*, filepath : UInt8*, property : UInt8*) : HRESULT
    @lpVtbl.value.clear_file_property.call(this, filepath, property)
  end
end
struct LibWin32::IFsrmClassificationManager2
  def query_interface(this : IFsrmClassificationManager2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmClassificationManager2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmClassificationManager2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmClassificationManager2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmClassificationManager2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmClassificationManager2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmClassificationManager2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_classification_report_formats(this : IFsrmClassificationManager2*, formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_classification_report_formats.call(this, formats)
  end
  def put_classification_report_formats(this : IFsrmClassificationManager2*, formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_classification_report_formats.call(this, formats)
  end
  def get_logging(this : IFsrmClassificationManager2*, logging : Int32*) : HRESULT
    @lpVtbl.value.get_logging.call(this, logging)
  end
  def put_logging(this : IFsrmClassificationManager2*, logging : Int32) : HRESULT
    @lpVtbl.value.put_logging.call(this, logging)
  end
  def get_classification_report_mail_to(this : IFsrmClassificationManager2*, mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_report_mail_to.call(this, mailto)
  end
  def put_classification_report_mail_to(this : IFsrmClassificationManager2*, mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_classification_report_mail_to.call(this, mailto)
  end
  def get_classification_report_enabled(this : IFsrmClassificationManager2*, reportenabled : Int16*) : HRESULT
    @lpVtbl.value.get_classification_report_enabled.call(this, reportenabled)
  end
  def put_classification_report_enabled(this : IFsrmClassificationManager2*, reportenabled : Int16) : HRESULT
    @lpVtbl.value.put_classification_report_enabled.call(this, reportenabled)
  end
  def get_classification_last_report_path_without_extension(this : IFsrmClassificationManager2*, lastreportpath : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_report_path_without_extension.call(this, lastreportpath)
  end
  def get_classification_last_error(this : IFsrmClassificationManager2*, lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_error.call(this, lasterror)
  end
  def get_classification_running_status(this : IFsrmClassificationManager2*, runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_classification_running_status.call(this, runningstatus)
  end
  def enum_property_definitions(this : IFsrmClassificationManager2*, options : FsrmEnumOptions, propertydefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_property_definitions.call(this, options, propertydefinitions)
  end
  def create_property_definition(this : IFsrmClassificationManager2*, propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.create_property_definition.call(this, propertydefinition)
  end
  def get_property_definition(this : IFsrmClassificationManager2*, propertyname : UInt8*, propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.get_property_definition.call(this, propertyname, propertydefinition)
  end
  def enum_rules(this : IFsrmClassificationManager2*, ruletype : FsrmRuleType, options : FsrmEnumOptions, rules : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_rules.call(this, ruletype, options, rules)
  end
  def create_rule(this : IFsrmClassificationManager2*, ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.create_rule.call(this, ruletype, rule)
  end
  def get_rule(this : IFsrmClassificationManager2*, rulename : UInt8*, ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.get_rule.call(this, rulename, ruletype, rule)
  end
  def enum_module_definitions(this : IFsrmClassificationManager2*, moduletype : FsrmPipelineModuleType, options : FsrmEnumOptions, moduledefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_module_definitions.call(this, moduletype, options, moduledefinitions)
  end
  def create_module_definition(this : IFsrmClassificationManager2*, moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.create_module_definition.call(this, moduletype, moduledefinition)
  end
  def get_module_definition(this : IFsrmClassificationManager2*, modulename : UInt8*, moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.get_module_definition.call(this, modulename, moduletype, moduledefinition)
  end
  def run_classification(this : IFsrmClassificationManager2*, context : FsrmReportGenerationContext, reserved : UInt8*) : HRESULT
    @lpVtbl.value.run_classification.call(this, context, reserved)
  end
  def wait_for_classification_completion(this : IFsrmClassificationManager2*, waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_classification_completion.call(this, waitseconds, completed)
  end
  def cancel_classification(this : IFsrmClassificationManager2*) : HRESULT
    @lpVtbl.value.cancel_classification.call(this)
  end
  def enum_file_properties(this : IFsrmClassificationManager2*, filepath : UInt8*, options : FsrmGetFilePropertyOptions, fileproperties : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_file_properties.call(this, filepath, options, fileproperties)
  end
  def get_file_property(this : IFsrmClassificationManager2*, filepath : UInt8*, propertyname : UInt8*, options : FsrmGetFilePropertyOptions, property : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.call(this, filepath, propertyname, options, property)
  end
  def set_file_property(this : IFsrmClassificationManager2*, filepath : UInt8*, propertyname : UInt8*, propertyvalue : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.call(this, filepath, propertyname, propertyvalue)
  end
  def clear_file_property(this : IFsrmClassificationManager2*, filepath : UInt8*, property : UInt8*) : HRESULT
    @lpVtbl.value.clear_file_property.call(this, filepath, property)
  end
  def classify_files(this : IFsrmClassificationManager2*, filepaths : SAFEARRAY*, propertynames : SAFEARRAY*, propertyvalues : SAFEARRAY*, options : FsrmGetFilePropertyOptions) : HRESULT
    @lpVtbl.value.classify_files.call(this, filepaths, propertynames, propertyvalues, options)
  end
end
struct LibWin32::IFsrmPropertyBag
  def query_interface(this : IFsrmPropertyBag*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPropertyBag*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPropertyBag*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPropertyBag*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPropertyBag*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPropertyBag*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPropertyBag*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFsrmPropertyBag*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_relative_path(this : IFsrmPropertyBag*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_path.call(this, path)
  end
  def get_volume_name(this : IFsrmPropertyBag*, volumename : UInt8**) : HRESULT
    @lpVtbl.value.get_volume_name.call(this, volumename)
  end
  def get_relative_namespace_root(this : IFsrmPropertyBag*, relativenamespaceroot : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_namespace_root.call(this, relativenamespaceroot)
  end
  def get_volume_index(this : IFsrmPropertyBag*, volumeid : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_index.call(this, volumeid)
  end
  def get_file_id(this : IFsrmPropertyBag*, fileid : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_id.call(this, fileid)
  end
  def get_parent_directory_id(this : IFsrmPropertyBag*, parentdirectoryid : VARIANT*) : HRESULT
    @lpVtbl.value.get_parent_directory_id.call(this, parentdirectoryid)
  end
  def get_size(this : IFsrmPropertyBag*, size : VARIANT*) : HRESULT
    @lpVtbl.value.get_size.call(this, size)
  end
  def get_size_allocated(this : IFsrmPropertyBag*, sizeallocated : VARIANT*) : HRESULT
    @lpVtbl.value.get_size_allocated.call(this, sizeallocated)
  end
  def get_creation_time(this : IFsrmPropertyBag*, creationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_creation_time.call(this, creationtime)
  end
  def get_last_access_time(this : IFsrmPropertyBag*, lastaccesstime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_access_time.call(this, lastaccesstime)
  end
  def get_last_modification_time(this : IFsrmPropertyBag*, lastmodificationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modification_time.call(this, lastmodificationtime)
  end
  def get_attributes(this : IFsrmPropertyBag*, attributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, attributes)
  end
  def get_owner_sid(this : IFsrmPropertyBag*, ownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.call(this, ownersid)
  end
  def get_file_property_names(this : IFsrmPropertyBag*, filepropertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_file_property_names.call(this, filepropertynames)
  end
  def get_messages(this : IFsrmPropertyBag*, messages : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_messages.call(this, messages)
  end
  def get_property_bag_flags(this : IFsrmPropertyBag*, flags : UInt32*) : HRESULT
    @lpVtbl.value.get_property_bag_flags.call(this, flags)
  end
  def get_file_property(this : IFsrmPropertyBag*, name : UInt8*, fileproperty : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.call(this, name, fileproperty)
  end
  def set_file_property(this : IFsrmPropertyBag*, name : UInt8*, value : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.call(this, name, value)
  end
  def add_message(this : IFsrmPropertyBag*, message : UInt8*) : HRESULT
    @lpVtbl.value.add_message.call(this, message)
  end
  def get_file_stream_interface(this : IFsrmPropertyBag*, accessmode : FsrmFileStreamingMode, interfacetype : FsrmFileStreamingInterfaceType, pstreaminterface : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_stream_interface.call(this, accessmode, interfacetype, pstreaminterface)
  end
end
struct LibWin32::IFsrmPropertyBag2
  def query_interface(this : IFsrmPropertyBag2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPropertyBag2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPropertyBag2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPropertyBag2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPropertyBag2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPropertyBag2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPropertyBag2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IFsrmPropertyBag2*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_relative_path(this : IFsrmPropertyBag2*, path : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_path.call(this, path)
  end
  def get_volume_name(this : IFsrmPropertyBag2*, volumename : UInt8**) : HRESULT
    @lpVtbl.value.get_volume_name.call(this, volumename)
  end
  def get_relative_namespace_root(this : IFsrmPropertyBag2*, relativenamespaceroot : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_namespace_root.call(this, relativenamespaceroot)
  end
  def get_volume_index(this : IFsrmPropertyBag2*, volumeid : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_index.call(this, volumeid)
  end
  def get_file_id(this : IFsrmPropertyBag2*, fileid : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_id.call(this, fileid)
  end
  def get_parent_directory_id(this : IFsrmPropertyBag2*, parentdirectoryid : VARIANT*) : HRESULT
    @lpVtbl.value.get_parent_directory_id.call(this, parentdirectoryid)
  end
  def get_size(this : IFsrmPropertyBag2*, size : VARIANT*) : HRESULT
    @lpVtbl.value.get_size.call(this, size)
  end
  def get_size_allocated(this : IFsrmPropertyBag2*, sizeallocated : VARIANT*) : HRESULT
    @lpVtbl.value.get_size_allocated.call(this, sizeallocated)
  end
  def get_creation_time(this : IFsrmPropertyBag2*, creationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_creation_time.call(this, creationtime)
  end
  def get_last_access_time(this : IFsrmPropertyBag2*, lastaccesstime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_access_time.call(this, lastaccesstime)
  end
  def get_last_modification_time(this : IFsrmPropertyBag2*, lastmodificationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modification_time.call(this, lastmodificationtime)
  end
  def get_attributes(this : IFsrmPropertyBag2*, attributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attributes.call(this, attributes)
  end
  def get_owner_sid(this : IFsrmPropertyBag2*, ownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.call(this, ownersid)
  end
  def get_file_property_names(this : IFsrmPropertyBag2*, filepropertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_file_property_names.call(this, filepropertynames)
  end
  def get_messages(this : IFsrmPropertyBag2*, messages : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_messages.call(this, messages)
  end
  def get_property_bag_flags(this : IFsrmPropertyBag2*, flags : UInt32*) : HRESULT
    @lpVtbl.value.get_property_bag_flags.call(this, flags)
  end
  def get_file_property(this : IFsrmPropertyBag2*, name : UInt8*, fileproperty : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.call(this, name, fileproperty)
  end
  def set_file_property(this : IFsrmPropertyBag2*, name : UInt8*, value : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.call(this, name, value)
  end
  def add_message(this : IFsrmPropertyBag2*, message : UInt8*) : HRESULT
    @lpVtbl.value.add_message.call(this, message)
  end
  def get_file_stream_interface(this : IFsrmPropertyBag2*, accessmode : FsrmFileStreamingMode, interfacetype : FsrmFileStreamingInterfaceType, pstreaminterface : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_stream_interface.call(this, accessmode, interfacetype, pstreaminterface)
  end
  def get_field_value(this : IFsrmPropertyBag2*, field : FsrmPropertyBagField, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_field_value.call(this, field, value)
  end
  def get_untrusted_in_file_properties(this : IFsrmPropertyBag2*, props : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_untrusted_in_file_properties.call(this, props)
  end
end
struct LibWin32::IFsrmPipelineModuleImplementation
  def query_interface(this : IFsrmPipelineModuleImplementation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPipelineModuleImplementation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPipelineModuleImplementation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPipelineModuleImplementation*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPipelineModuleImplementation*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPipelineModuleImplementation*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPipelineModuleImplementation*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_load(this : IFsrmPipelineModuleImplementation*, moduledefinition : IFsrmPipelineModuleDefinition, moduleconnector : IFsrmPipelineModuleConnector*) : HRESULT
    @lpVtbl.value.on_load.call(this, moduledefinition, moduleconnector)
  end
  def on_unload(this : IFsrmPipelineModuleImplementation*) : HRESULT
    @lpVtbl.value.on_unload.call(this)
  end
end
struct LibWin32::IFsrmClassifierModuleImplementation
  def query_interface(this : IFsrmClassifierModuleImplementation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmClassifierModuleImplementation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmClassifierModuleImplementation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmClassifierModuleImplementation*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmClassifierModuleImplementation*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmClassifierModuleImplementation*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmClassifierModuleImplementation*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_load(this : IFsrmClassifierModuleImplementation*, moduledefinition : IFsrmPipelineModuleDefinition, moduleconnector : IFsrmPipelineModuleConnector*) : HRESULT
    @lpVtbl.value.on_load.call(this, moduledefinition, moduleconnector)
  end
  def on_unload(this : IFsrmClassifierModuleImplementation*) : HRESULT
    @lpVtbl.value.on_unload.call(this)
  end
  def get_last_modified(this : IFsrmClassifierModuleImplementation*, lastmodified : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modified.call(this, lastmodified)
  end
  def use_rules_and_definitions(this : IFsrmClassifierModuleImplementation*, rules : IFsrmCollection, propertydefinitions : IFsrmCollection) : HRESULT
    @lpVtbl.value.use_rules_and_definitions.call(this, rules, propertydefinitions)
  end
  def on_begin_file(this : IFsrmClassifierModuleImplementation*, propertybag : IFsrmPropertyBag, arrayruleids : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_begin_file.call(this, propertybag, arrayruleids)
  end
  def does_property_value_apply(this : IFsrmClassifierModuleImplementation*, property : UInt8*, value : UInt8*, applyvalue : Int16*, idrule : Guid, idpropdef : Guid) : HRESULT
    @lpVtbl.value.does_property_value_apply.call(this, property, value, applyvalue, idrule, idpropdef)
  end
  def get_property_value_to_apply(this : IFsrmClassifierModuleImplementation*, property : UInt8*, value : UInt8**, idrule : Guid, idpropdef : Guid) : HRESULT
    @lpVtbl.value.get_property_value_to_apply.call(this, property, value, idrule, idpropdef)
  end
  def on_end_file(this : IFsrmClassifierModuleImplementation*) : HRESULT
    @lpVtbl.value.on_end_file.call(this)
  end
end
struct LibWin32::IFsrmStorageModuleImplementation
  def query_interface(this : IFsrmStorageModuleImplementation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmStorageModuleImplementation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmStorageModuleImplementation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmStorageModuleImplementation*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmStorageModuleImplementation*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmStorageModuleImplementation*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmStorageModuleImplementation*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_load(this : IFsrmStorageModuleImplementation*, moduledefinition : IFsrmPipelineModuleDefinition, moduleconnector : IFsrmPipelineModuleConnector*) : HRESULT
    @lpVtbl.value.on_load.call(this, moduledefinition, moduleconnector)
  end
  def on_unload(this : IFsrmStorageModuleImplementation*) : HRESULT
    @lpVtbl.value.on_unload.call(this)
  end
  def use_definitions(this : IFsrmStorageModuleImplementation*, propertydefinitions : IFsrmCollection) : HRESULT
    @lpVtbl.value.use_definitions.call(this, propertydefinitions)
  end
  def load_properties(this : IFsrmStorageModuleImplementation*, propertybag : IFsrmPropertyBag) : HRESULT
    @lpVtbl.value.load_properties.call(this, propertybag)
  end
  def save_properties(this : IFsrmStorageModuleImplementation*, propertybag : IFsrmPropertyBag) : HRESULT
    @lpVtbl.value.save_properties.call(this, propertybag)
  end
end
struct LibWin32::IFsrmPipelineModuleConnector
  def query_interface(this : IFsrmPipelineModuleConnector*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IFsrmPipelineModuleConnector*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IFsrmPipelineModuleConnector*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IFsrmPipelineModuleConnector*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IFsrmPipelineModuleConnector*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IFsrmPipelineModuleConnector*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IFsrmPipelineModuleConnector*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_module_implementation(this : IFsrmPipelineModuleConnector*, pipelinemoduleimplementation : IFsrmPipelineModuleImplementation*) : HRESULT
    @lpVtbl.value.get_module_implementation.call(this, pipelinemoduleimplementation)
  end
  def get_module_name(this : IFsrmPipelineModuleConnector*, username : UInt8**) : HRESULT
    @lpVtbl.value.get_module_name.call(this, username)
  end
  def get_hosting_user_account(this : IFsrmPipelineModuleConnector*, useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_hosting_user_account.call(this, useraccount)
  end
  def get_hosting_process_pid(this : IFsrmPipelineModuleConnector*, pid : Int32*) : HRESULT
    @lpVtbl.value.get_hosting_process_pid.call(this, pid)
  end
  def bind(this : IFsrmPipelineModuleConnector*, moduledefinition : IFsrmPipelineModuleDefinition, moduleimplementation : IFsrmPipelineModuleImplementation) : HRESULT
    @lpVtbl.value.bind.call(this, moduledefinition, moduleimplementation)
  end
end
struct LibWin32::DIFsrmClassificationEvents
  def query_interface(this : DIFsrmClassificationEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : DIFsrmClassificationEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : DIFsrmClassificationEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : DIFsrmClassificationEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : DIFsrmClassificationEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : DIFsrmClassificationEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : DIFsrmClassificationEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
