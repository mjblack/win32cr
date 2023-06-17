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