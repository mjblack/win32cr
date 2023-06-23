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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
  end

  IFsrmObject_GUID = "22bcef93-4a3f-4183-89f9-2f8b8a628aee"
  IID_IFsrmObject = LibC::GUID.new(0x22bcef93_u32, 0x4a3f_u16, 0x4183_u16, StaticArray[0x89_u8, 0xf9_u8, 0x2f_u8, 0x8b_u8, 0x8a_u8, 0x62_u8, 0x8a_u8, 0xee_u8])
  struct IFsrmObject
    lpVtbl : IFsrmObjectVTbl*
  end

  struct IFsrmCollectionVTbl
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
    get_state : UInt64
    cancel : UInt64
    wait_for_completion : UInt64
    get_by_id : UInt64
  end

  IFsrmCollection_GUID = "f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8"
  IID_IFsrmCollection = LibC::GUID.new(0xf76fbf3b_u32, 0x8ddd_u16, 0x4b42_u16, StaticArray[0xb0_u8, 0x5a_u8, 0xcb_u8, 0x1c_u8, 0x3f_u8, 0xf1_u8, 0xfe_u8, 0xe8_u8])
  struct IFsrmCollection
    lpVtbl : IFsrmCollectionVTbl*
  end

  struct IFsrmMutableCollectionVTbl
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
    get_state : UInt64
    cancel : UInt64
    wait_for_completion : UInt64
    get_by_id : UInt64
    add : UInt64
    remove : UInt64
    remove_by_id : UInt64
    clone : UInt64
  end

  IFsrmMutableCollection_GUID = "1bb617b8-3886-49dc-af82-a6c90fa35dda"
  IID_IFsrmMutableCollection = LibC::GUID.new(0x1bb617b8_u32, 0x3886_u16, 0x49dc_u16, StaticArray[0xaf_u8, 0x82_u8, 0xa6_u8, 0xc9_u8, 0xf_u8, 0xa3_u8, 0x5d_u8, 0xda_u8])
  struct IFsrmMutableCollection
    lpVtbl : IFsrmMutableCollectionVTbl*
  end

  struct IFsrmCommittableCollectionVTbl
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
    get_state : UInt64
    cancel : UInt64
    wait_for_completion : UInt64
    get_by_id : UInt64
    add : UInt64
    remove : UInt64
    remove_by_id : UInt64
    clone : UInt64
    commit : UInt64
  end

  IFsrmCommittableCollection_GUID = "96deb3b5-8b91-4a2a-9d93-80a35d8aa847"
  IID_IFsrmCommittableCollection = LibC::GUID.new(0x96deb3b5_u32, 0x8b91_u16, 0x4a2a_u16, StaticArray[0x9d_u8, 0x93_u8, 0x80_u8, 0xa3_u8, 0x5d_u8, 0x8a_u8, 0xa8_u8, 0x47_u8])
  struct IFsrmCommittableCollection
    lpVtbl : IFsrmCommittableCollectionVTbl*
  end

  struct IFsrmActionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_action_type : UInt64
    get_run_limit_interval : UInt64
    put_run_limit_interval : UInt64
    delete : UInt64
  end

  IFsrmAction_GUID = "6cd6408a-ae60-463b-9ef1-e117534d69dc"
  IID_IFsrmAction = LibC::GUID.new(0x6cd6408a_u32, 0xae60_u16, 0x463b_u16, StaticArray[0x9e_u8, 0xf1_u8, 0xe1_u8, 0x17_u8, 0x53_u8, 0x4d_u8, 0x69_u8, 0xdc_u8])
  struct IFsrmAction
    lpVtbl : IFsrmActionVTbl*
  end

  struct IFsrmActionEmailVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_action_type : UInt64
    get_run_limit_interval : UInt64
    put_run_limit_interval : UInt64
    delete : UInt64
    get_mail_from : UInt64
    put_mail_from : UInt64
    get_mail_reply_to : UInt64
    put_mail_reply_to : UInt64
    get_mail_to : UInt64
    put_mail_to : UInt64
    get_mail_cc : UInt64
    put_mail_cc : UInt64
    get_mail_bcc : UInt64
    put_mail_bcc : UInt64
    get_mail_subject : UInt64
    put_mail_subject : UInt64
    get_message_text : UInt64
    put_message_text : UInt64
  end

  IFsrmActionEmail_GUID = "d646567d-26ae-4caa-9f84-4e0aad207fca"
  IID_IFsrmActionEmail = LibC::GUID.new(0xd646567d_u32, 0x26ae_u16, 0x4caa_u16, StaticArray[0x9f_u8, 0x84_u8, 0x4e_u8, 0xa_u8, 0xad_u8, 0x20_u8, 0x7f_u8, 0xca_u8])
  struct IFsrmActionEmail
    lpVtbl : IFsrmActionEmailVTbl*
  end

  struct IFsrmActionEmail2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_action_type : UInt64
    get_run_limit_interval : UInt64
    put_run_limit_interval : UInt64
    delete : UInt64
    get_mail_from : UInt64
    put_mail_from : UInt64
    get_mail_reply_to : UInt64
    put_mail_reply_to : UInt64
    get_mail_to : UInt64
    put_mail_to : UInt64
    get_mail_cc : UInt64
    put_mail_cc : UInt64
    get_mail_bcc : UInt64
    put_mail_bcc : UInt64
    get_mail_subject : UInt64
    put_mail_subject : UInt64
    get_message_text : UInt64
    put_message_text : UInt64
    get_attachment_file_list_size : UInt64
    put_attachment_file_list_size : UInt64
  end

  IFsrmActionEmail2_GUID = "8276702f-2532-4839-89bf-4872609a2ea4"
  IID_IFsrmActionEmail2 = LibC::GUID.new(0x8276702f_u32, 0x2532_u16, 0x4839_u16, StaticArray[0x89_u8, 0xbf_u8, 0x48_u8, 0x72_u8, 0x60_u8, 0x9a_u8, 0x2e_u8, 0xa4_u8])
  struct IFsrmActionEmail2
    lpVtbl : IFsrmActionEmail2VTbl*
  end

  struct IFsrmActionReportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_action_type : UInt64
    get_run_limit_interval : UInt64
    put_run_limit_interval : UInt64
    delete : UInt64
    get_report_types : UInt64
    put_report_types : UInt64
    get_mail_to : UInt64
    put_mail_to : UInt64
  end

  IFsrmActionReport_GUID = "2dbe63c4-b340-48a0-a5b0-158e07fc567e"
  IID_IFsrmActionReport = LibC::GUID.new(0x2dbe63c4_u32, 0xb340_u16, 0x48a0_u16, StaticArray[0xa5_u8, 0xb0_u8, 0x15_u8, 0x8e_u8, 0x7_u8, 0xfc_u8, 0x56_u8, 0x7e_u8])
  struct IFsrmActionReport
    lpVtbl : IFsrmActionReportVTbl*
  end

  struct IFsrmActionEventLogVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_action_type : UInt64
    get_run_limit_interval : UInt64
    put_run_limit_interval : UInt64
    delete : UInt64
    get_event_type : UInt64
    put_event_type : UInt64
    get_message_text : UInt64
    put_message_text : UInt64
  end

  IFsrmActionEventLog_GUID = "4c8f96c3-5d94-4f37-a4f4-f56ab463546f"
  IID_IFsrmActionEventLog = LibC::GUID.new(0x4c8f96c3_u32, 0x5d94_u16, 0x4f37_u16, StaticArray[0xa4_u8, 0xf4_u8, 0xf5_u8, 0x6a_u8, 0xb4_u8, 0x63_u8, 0x54_u8, 0x6f_u8])
  struct IFsrmActionEventLog
    lpVtbl : IFsrmActionEventLogVTbl*
  end

  struct IFsrmActionCommandVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_action_type : UInt64
    get_run_limit_interval : UInt64
    put_run_limit_interval : UInt64
    delete : UInt64
    get_executable_path : UInt64
    put_executable_path : UInt64
    get_arguments : UInt64
    put_arguments : UInt64
    get_account : UInt64
    put_account : UInt64
    get_working_directory : UInt64
    put_working_directory : UInt64
    get_monitor_command : UInt64
    put_monitor_command : UInt64
    get_kill_time_out : UInt64
    put_kill_time_out : UInt64
    get_log_result : UInt64
    put_log_result : UInt64
  end

  IFsrmActionCommand_GUID = "12937789-e247-4917-9c20-f3ee9c7ee783"
  IID_IFsrmActionCommand = LibC::GUID.new(0x12937789_u32, 0xe247_u16, 0x4917_u16, StaticArray[0x9c_u8, 0x20_u8, 0xf3_u8, 0xee_u8, 0x9c_u8, 0x7e_u8, 0xe7_u8, 0x83_u8])
  struct IFsrmActionCommand
    lpVtbl : IFsrmActionCommandVTbl*
  end

  struct IFsrmSettingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_smtp_server : UInt64
    put_smtp_server : UInt64
    get_mail_from : UInt64
    put_mail_from : UInt64
    get_admin_email : UInt64
    put_admin_email : UInt64
    get_disable_command_line : UInt64
    put_disable_command_line : UInt64
    get_enable_screening_audit : UInt64
    put_enable_screening_audit : UInt64
    email_test : UInt64
    set_action_run_limit_interval : UInt64
    get_action_run_limit_interval : UInt64
  end

  IFsrmSetting_GUID = "f411d4fd-14be-4260-8c40-03b7c95e608a"
  IID_IFsrmSetting = LibC::GUID.new(0xf411d4fd_u32, 0x14be_u16, 0x4260_u16, StaticArray[0x8c_u8, 0x40_u8, 0x3_u8, 0xb7_u8, 0xc9_u8, 0x5e_u8, 0x60_u8, 0x8a_u8])
  struct IFsrmSetting
    lpVtbl : IFsrmSettingVTbl*
  end

  struct IFsrmPathMapperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_share_paths_for_local_path : UInt64
  end

  IFsrmPathMapper_GUID = "6f4dbfff-6920-4821-a6c3-b7e94c1fd60c"
  IID_IFsrmPathMapper = LibC::GUID.new(0x6f4dbfff_u32, 0x6920_u16, 0x4821_u16, StaticArray[0xa6_u8, 0xc3_u8, 0xb7_u8, 0xe9_u8, 0x4c_u8, 0x1f_u8, 0xd6_u8, 0xc_u8])
  struct IFsrmPathMapper
    lpVtbl : IFsrmPathMapperVTbl*
  end

  struct IFsrmExportImportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    export_file_groups : UInt64
    import_file_groups : UInt64
    export_file_screen_templates : UInt64
    import_file_screen_templates : UInt64
    export_quota_templates : UInt64
    import_quota_templates : UInt64
  end

  IFsrmExportImport_GUID = "efcb0ab1-16c4-4a79-812c-725614c3306b"
  IID_IFsrmExportImport = LibC::GUID.new(0xefcb0ab1_u32, 0x16c4_u16, 0x4a79_u16, StaticArray[0x81_u8, 0x2c_u8, 0x72_u8, 0x56_u8, 0x14_u8, 0xc3_u8, 0x30_u8, 0x6b_u8])
  struct IFsrmExportImport
    lpVtbl : IFsrmExportImportVTbl*
  end

  struct IFsrmDerivedObjectsResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_derived_objects : UInt64
    get_results : UInt64
  end

  IFsrmDerivedObjectsResult_GUID = "39322a2d-38ee-4d0d-8095-421a80849a82"
  IID_IFsrmDerivedObjectsResult = LibC::GUID.new(0x39322a2d_u32, 0x38ee_u16, 0x4d0d_u16, StaticArray[0x80_u8, 0x95_u8, 0x42_u8, 0x1a_u8, 0x80_u8, 0x84_u8, 0x9a_u8, 0x82_u8])
  struct IFsrmDerivedObjectsResult
    lpVtbl : IFsrmDerivedObjectsResultVTbl*
  end

  struct IFsrmAccessDeniedRemediationClientVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    show : UInt64
  end

  IFsrmAccessDeniedRemediationClient_GUID = "40002314-590b-45a5-8e1b-8c05da527e52"
  IID_IFsrmAccessDeniedRemediationClient = LibC::GUID.new(0x40002314_u32, 0x590b_u16, 0x45a5_u16, StaticArray[0x8e_u8, 0x1b_u8, 0x8c_u8, 0x5_u8, 0xda_u8, 0x52_u8, 0x7e_u8, 0x52_u8])
  struct IFsrmAccessDeniedRemediationClient
    lpVtbl : IFsrmAccessDeniedRemediationClientVTbl*
  end

  struct IFsrmQuotaBaseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_quota_limit : UInt64
    put_quota_limit : UInt64
    get_quota_flags : UInt64
    put_quota_flags : UInt64
    get_thresholds : UInt64
    add_threshold : UInt64
    delete_threshold : UInt64
    modify_threshold : UInt64
    create_threshold_action : UInt64
    enum_threshold_actions : UInt64
  end

  IFsrmQuotaBase_GUID = "1568a795-3924-4118-b74b-68d8f0fa5daf"
  IID_IFsrmQuotaBase = LibC::GUID.new(0x1568a795_u32, 0x3924_u16, 0x4118_u16, StaticArray[0xb7_u8, 0x4b_u8, 0x68_u8, 0xd8_u8, 0xf0_u8, 0xfa_u8, 0x5d_u8, 0xaf_u8])
  struct IFsrmQuotaBase
    lpVtbl : IFsrmQuotaBaseVTbl*
  end

  struct IFsrmQuotaObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_quota_limit : UInt64
    put_quota_limit : UInt64
    get_quota_flags : UInt64
    put_quota_flags : UInt64
    get_thresholds : UInt64
    add_threshold : UInt64
    delete_threshold : UInt64
    modify_threshold : UInt64
    create_threshold_action : UInt64
    enum_threshold_actions : UInt64
    get_path : UInt64
    get_user_sid : UInt64
    get_user_account : UInt64
    get_source_template_name : UInt64
    get_matches_source_template : UInt64
    apply_template : UInt64
  end

  IFsrmQuotaObject_GUID = "42dc3511-61d5-48ae-b6dc-59fc00c0a8d6"
  IID_IFsrmQuotaObject = LibC::GUID.new(0x42dc3511_u32, 0x61d5_u16, 0x48ae_u16, StaticArray[0xb6_u8, 0xdc_u8, 0x59_u8, 0xfc_u8, 0x0_u8, 0xc0_u8, 0xa8_u8, 0xd6_u8])
  struct IFsrmQuotaObject
    lpVtbl : IFsrmQuotaObjectVTbl*
  end

  struct IFsrmQuotaVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_quota_limit : UInt64
    put_quota_limit : UInt64
    get_quota_flags : UInt64
    put_quota_flags : UInt64
    get_thresholds : UInt64
    add_threshold : UInt64
    delete_threshold : UInt64
    modify_threshold : UInt64
    create_threshold_action : UInt64
    enum_threshold_actions : UInt64
    get_path : UInt64
    get_user_sid : UInt64
    get_user_account : UInt64
    get_source_template_name : UInt64
    get_matches_source_template : UInt64
    apply_template : UInt64
    get_quota_used : UInt64
    get_quota_peak_usage : UInt64
    get_quota_peak_usage_time : UInt64
    reset_peak_usage : UInt64
    refresh_usage_properties : UInt64
  end

  IFsrmQuota_GUID = "377f739d-9647-4b8e-97d2-5ffce6d759cd"
  IID_IFsrmQuota = LibC::GUID.new(0x377f739d_u32, 0x9647_u16, 0x4b8e_u16, StaticArray[0x97_u8, 0xd2_u8, 0x5f_u8, 0xfc_u8, 0xe6_u8, 0xd7_u8, 0x59_u8, 0xcd_u8])
  struct IFsrmQuota
    lpVtbl : IFsrmQuotaVTbl*
  end

  struct IFsrmAutoApplyQuotaVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_quota_limit : UInt64
    put_quota_limit : UInt64
    get_quota_flags : UInt64
    put_quota_flags : UInt64
    get_thresholds : UInt64
    add_threshold : UInt64
    delete_threshold : UInt64
    modify_threshold : UInt64
    create_threshold_action : UInt64
    enum_threshold_actions : UInt64
    get_path : UInt64
    get_user_sid : UInt64
    get_user_account : UInt64
    get_source_template_name : UInt64
    get_matches_source_template : UInt64
    apply_template : UInt64
    get_exclude_folders : UInt64
    put_exclude_folders : UInt64
    commit_and_update_derived : UInt64
  end

  IFsrmAutoApplyQuota_GUID = "f82e5729-6aba-4740-bfc7-c7f58f75fb7b"
  IID_IFsrmAutoApplyQuota = LibC::GUID.new(0xf82e5729_u32, 0x6aba_u16, 0x4740_u16, StaticArray[0xbf_u8, 0xc7_u8, 0xc7_u8, 0xf5_u8, 0x8f_u8, 0x75_u8, 0xfb_u8, 0x7b_u8])
  struct IFsrmAutoApplyQuota
    lpVtbl : IFsrmAutoApplyQuotaVTbl*
  end

  struct IFsrmQuotaManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_action_variables : UInt64
    get_action_variable_descriptions : UInt64
    create_quota : UInt64
    create_auto_apply_quota : UInt64
    get_quota : UInt64
    get_auto_apply_quota : UInt64
    get_restrictive_quota : UInt64
    enum_quotas : UInt64
    enum_auto_apply_quotas : UInt64
    enum_effective_quotas : UInt64
    scan : UInt64
    create_quota_collection : UInt64
  end

  IFsrmQuotaManager_GUID = "8bb68c7d-19d8-4ffb-809e-be4fc1734014"
  IID_IFsrmQuotaManager = LibC::GUID.new(0x8bb68c7d_u32, 0x19d8_u16, 0x4ffb_u16, StaticArray[0x80_u8, 0x9e_u8, 0xbe_u8, 0x4f_u8, 0xc1_u8, 0x73_u8, 0x40_u8, 0x14_u8])
  struct IFsrmQuotaManager
    lpVtbl : IFsrmQuotaManagerVTbl*
  end

  struct IFsrmQuotaManagerExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_action_variables : UInt64
    get_action_variable_descriptions : UInt64
    create_quota : UInt64
    create_auto_apply_quota : UInt64
    get_quota : UInt64
    get_auto_apply_quota : UInt64
    get_restrictive_quota : UInt64
    enum_quotas : UInt64
    enum_auto_apply_quotas : UInt64
    enum_effective_quotas : UInt64
    scan : UInt64
    create_quota_collection : UInt64
    is_affected_by_quota : UInt64
  end

  IFsrmQuotaManagerEx_GUID = "4846cb01-d430-494f-abb4-b1054999fb09"
  IID_IFsrmQuotaManagerEx = LibC::GUID.new(0x4846cb01_u32, 0xd430_u16, 0x494f_u16, StaticArray[0xab_u8, 0xb4_u8, 0xb1_u8, 0x5_u8, 0x49_u8, 0x99_u8, 0xfb_u8, 0x9_u8])
  struct IFsrmQuotaManagerEx
    lpVtbl : IFsrmQuotaManagerExVTbl*
  end

  struct IFsrmQuotaTemplateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_quota_limit : UInt64
    put_quota_limit : UInt64
    get_quota_flags : UInt64
    put_quota_flags : UInt64
    get_thresholds : UInt64
    add_threshold : UInt64
    delete_threshold : UInt64
    modify_threshold : UInt64
    create_threshold_action : UInt64
    enum_threshold_actions : UInt64
    get_name : UInt64
    put_name : UInt64
    copy_template : UInt64
    commit_and_update_derived : UInt64
  end

  IFsrmQuotaTemplate_GUID = "a2efab31-295e-46bb-b976-e86d58b52e8b"
  IID_IFsrmQuotaTemplate = LibC::GUID.new(0xa2efab31_u32, 0x295e_u16, 0x46bb_u16, StaticArray[0xb9_u8, 0x76_u8, 0xe8_u8, 0x6d_u8, 0x58_u8, 0xb5_u8, 0x2e_u8, 0x8b_u8])
  struct IFsrmQuotaTemplate
    lpVtbl : IFsrmQuotaTemplateVTbl*
  end

  struct IFsrmQuotaTemplateImportedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_quota_limit : UInt64
    put_quota_limit : UInt64
    get_quota_flags : UInt64
    put_quota_flags : UInt64
    get_thresholds : UInt64
    add_threshold : UInt64
    delete_threshold : UInt64
    modify_threshold : UInt64
    create_threshold_action : UInt64
    enum_threshold_actions : UInt64
    get_name : UInt64
    put_name : UInt64
    copy_template : UInt64
    commit_and_update_derived : UInt64
    get_overwrite_on_commit : UInt64
    put_overwrite_on_commit : UInt64
  end

  IFsrmQuotaTemplateImported_GUID = "9a2bf113-a329-44cc-809a-5c00fce8da40"
  IID_IFsrmQuotaTemplateImported = LibC::GUID.new(0x9a2bf113_u32, 0xa329_u16, 0x44cc_u16, StaticArray[0x80_u8, 0x9a_u8, 0x5c_u8, 0x0_u8, 0xfc_u8, 0xe8_u8, 0xda_u8, 0x40_u8])
  struct IFsrmQuotaTemplateImported
    lpVtbl : IFsrmQuotaTemplateImportedVTbl*
  end

  struct IFsrmQuotaTemplateManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_template : UInt64
    get_template : UInt64
    enum_templates : UInt64
    export_templates : UInt64
    import_templates : UInt64
  end

  IFsrmQuotaTemplateManager_GUID = "4173ac41-172d-4d52-963c-fdc7e415f717"
  IID_IFsrmQuotaTemplateManager = LibC::GUID.new(0x4173ac41_u32, 0x172d_u16, 0x4d52_u16, StaticArray[0x96_u8, 0x3c_u8, 0xfd_u8, 0xc7_u8, 0xe4_u8, 0x15_u8, 0xf7_u8, 0x17_u8])
  struct IFsrmQuotaTemplateManager
    lpVtbl : IFsrmQuotaTemplateManagerVTbl*
  end

  struct IFsrmFileGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_members : UInt64
    put_members : UInt64
    get_non_members : UInt64
    put_non_members : UInt64
  end

  IFsrmFileGroup_GUID = "8dd04909-0e34-4d55-afaa-89e1f1a1bbb9"
  IID_IFsrmFileGroup = LibC::GUID.new(0x8dd04909_u32, 0xe34_u16, 0x4d55_u16, StaticArray[0xaf_u8, 0xaa_u8, 0x89_u8, 0xe1_u8, 0xf1_u8, 0xa1_u8, 0xbb_u8, 0xb9_u8])
  struct IFsrmFileGroup
    lpVtbl : IFsrmFileGroupVTbl*
  end

  struct IFsrmFileGroupImportedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_members : UInt64
    put_members : UInt64
    get_non_members : UInt64
    put_non_members : UInt64
    get_overwrite_on_commit : UInt64
    put_overwrite_on_commit : UInt64
  end

  IFsrmFileGroupImported_GUID = "ad55f10b-5f11-4be7-94ef-d9ee2e470ded"
  IID_IFsrmFileGroupImported = LibC::GUID.new(0xad55f10b_u32, 0x5f11_u16, 0x4be7_u16, StaticArray[0x94_u8, 0xef_u8, 0xd9_u8, 0xee_u8, 0x2e_u8, 0x47_u8, 0xd_u8, 0xed_u8])
  struct IFsrmFileGroupImported
    lpVtbl : IFsrmFileGroupImportedVTbl*
  end

  struct IFsrmFileGroupManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_file_group : UInt64
    get_file_group : UInt64
    enum_file_groups : UInt64
    export_file_groups : UInt64
    import_file_groups : UInt64
  end

  IFsrmFileGroupManager_GUID = "426677d5-018c-485c-8a51-20b86d00bdc4"
  IID_IFsrmFileGroupManager = LibC::GUID.new(0x426677d5_u32, 0x18c_u16, 0x485c_u16, StaticArray[0x8a_u8, 0x51_u8, 0x20_u8, 0xb8_u8, 0x6d_u8, 0x0_u8, 0xbd_u8, 0xc4_u8])
  struct IFsrmFileGroupManager
    lpVtbl : IFsrmFileGroupManagerVTbl*
  end

  struct IFsrmFileScreenBaseVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_blocked_file_groups : UInt64
    put_blocked_file_groups : UInt64
    get_file_screen_flags : UInt64
    put_file_screen_flags : UInt64
    create_action : UInt64
    enum_actions : UInt64
  end

  IFsrmFileScreenBase_GUID = "f3637e80-5b22-4a2b-a637-bbb642b41cfc"
  IID_IFsrmFileScreenBase = LibC::GUID.new(0xf3637e80_u32, 0x5b22_u16, 0x4a2b_u16, StaticArray[0xa6_u8, 0x37_u8, 0xbb_u8, 0xb6_u8, 0x42_u8, 0xb4_u8, 0x1c_u8, 0xfc_u8])
  struct IFsrmFileScreenBase
    lpVtbl : IFsrmFileScreenBaseVTbl*
  end

  struct IFsrmFileScreenVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_blocked_file_groups : UInt64
    put_blocked_file_groups : UInt64
    get_file_screen_flags : UInt64
    put_file_screen_flags : UInt64
    create_action : UInt64
    enum_actions : UInt64
    get_path : UInt64
    get_source_template_name : UInt64
    get_matches_source_template : UInt64
    get_user_sid : UInt64
    get_user_account : UInt64
    apply_template : UInt64
  end

  IFsrmFileScreen_GUID = "5f6325d3-ce88-4733-84c1-2d6aefc5ea07"
  IID_IFsrmFileScreen = LibC::GUID.new(0x5f6325d3_u32, 0xce88_u16, 0x4733_u16, StaticArray[0x84_u8, 0xc1_u8, 0x2d_u8, 0x6a_u8, 0xef_u8, 0xc5_u8, 0xea_u8, 0x7_u8])
  struct IFsrmFileScreen
    lpVtbl : IFsrmFileScreenVTbl*
  end

  struct IFsrmFileScreenExceptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_path : UInt64
    get_allowed_file_groups : UInt64
    put_allowed_file_groups : UInt64
  end

  IFsrmFileScreenException_GUID = "bee7ce02-df77-4515-9389-78f01c5afc1a"
  IID_IFsrmFileScreenException = LibC::GUID.new(0xbee7ce02_u32, 0xdf77_u16, 0x4515_u16, StaticArray[0x93_u8, 0x89_u8, 0x78_u8, 0xf0_u8, 0x1c_u8, 0x5a_u8, 0xfc_u8, 0x1a_u8])
  struct IFsrmFileScreenException
    lpVtbl : IFsrmFileScreenExceptionVTbl*
  end

  struct IFsrmFileScreenManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_action_variables : UInt64
    get_action_variable_descriptions : UInt64
    create_file_screen : UInt64
    get_file_screen : UInt64
    enum_file_screens : UInt64
    create_file_screen_exception : UInt64
    get_file_screen_exception : UInt64
    enum_file_screen_exceptions : UInt64
    create_file_screen_collection : UInt64
  end

  IFsrmFileScreenManager_GUID = "ff4fa04e-5a94-4bda-a3a0-d5b4d3c52eba"
  IID_IFsrmFileScreenManager = LibC::GUID.new(0xff4fa04e_u32, 0x5a94_u16, 0x4bda_u16, StaticArray[0xa3_u8, 0xa0_u8, 0xd5_u8, 0xb4_u8, 0xd3_u8, 0xc5_u8, 0x2e_u8, 0xba_u8])
  struct IFsrmFileScreenManager
    lpVtbl : IFsrmFileScreenManagerVTbl*
  end

  struct IFsrmFileScreenTemplateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_blocked_file_groups : UInt64
    put_blocked_file_groups : UInt64
    get_file_screen_flags : UInt64
    put_file_screen_flags : UInt64
    create_action : UInt64
    enum_actions : UInt64
    get_name : UInt64
    put_name : UInt64
    copy_template : UInt64
    commit_and_update_derived : UInt64
  end

  IFsrmFileScreenTemplate_GUID = "205bebf8-dd93-452a-95a6-32b566b35828"
  IID_IFsrmFileScreenTemplate = LibC::GUID.new(0x205bebf8_u32, 0xdd93_u16, 0x452a_u16, StaticArray[0x95_u8, 0xa6_u8, 0x32_u8, 0xb5_u8, 0x66_u8, 0xb3_u8, 0x58_u8, 0x28_u8])
  struct IFsrmFileScreenTemplate
    lpVtbl : IFsrmFileScreenTemplateVTbl*
  end

  struct IFsrmFileScreenTemplateImportedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_blocked_file_groups : UInt64
    put_blocked_file_groups : UInt64
    get_file_screen_flags : UInt64
    put_file_screen_flags : UInt64
    create_action : UInt64
    enum_actions : UInt64
    get_name : UInt64
    put_name : UInt64
    copy_template : UInt64
    commit_and_update_derived : UInt64
    get_overwrite_on_commit : UInt64
    put_overwrite_on_commit : UInt64
  end

  IFsrmFileScreenTemplateImported_GUID = "e1010359-3e5d-4ecd-9fe4-ef48622fdf30"
  IID_IFsrmFileScreenTemplateImported = LibC::GUID.new(0xe1010359_u32, 0x3e5d_u16, 0x4ecd_u16, StaticArray[0x9f_u8, 0xe4_u8, 0xef_u8, 0x48_u8, 0x62_u8, 0x2f_u8, 0xdf_u8, 0x30_u8])
  struct IFsrmFileScreenTemplateImported
    lpVtbl : IFsrmFileScreenTemplateImportedVTbl*
  end

  struct IFsrmFileScreenTemplateManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    create_template : UInt64
    get_template : UInt64
    enum_templates : UInt64
    export_templates : UInt64
    import_templates : UInt64
  end

  IFsrmFileScreenTemplateManager_GUID = "cfe36cba-1949-4e74-a14f-f1d580ceaf13"
  IID_IFsrmFileScreenTemplateManager = LibC::GUID.new(0xcfe36cba_u32, 0x1949_u16, 0x4e74_u16, StaticArray[0xa1_u8, 0x4f_u8, 0xf1_u8, 0xd5_u8, 0x80_u8, 0xce_u8, 0xaf_u8, 0x13_u8])
  struct IFsrmFileScreenTemplateManager
    lpVtbl : IFsrmFileScreenTemplateManagerVTbl*
  end

  struct IFsrmReportManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    enum_report_jobs : UInt64
    create_report_job : UInt64
    get_report_job : UInt64
    get_output_directory : UInt64
    set_output_directory : UInt64
    is_filter_valid_for_report_type : UInt64
    get_default_filter : UInt64
    set_default_filter : UInt64
    get_report_size_limit : UInt64
    set_report_size_limit : UInt64
  end

  IFsrmReportManager_GUID = "27b899fe-6ffa-4481-a184-d3daade8a02b"
  IID_IFsrmReportManager = LibC::GUID.new(0x27b899fe_u32, 0x6ffa_u16, 0x4481_u16, StaticArray[0xa1_u8, 0x84_u8, 0xd3_u8, 0xda_u8, 0xad_u8, 0xe8_u8, 0xa0_u8, 0x2b_u8])
  struct IFsrmReportManager
    lpVtbl : IFsrmReportManagerVTbl*
  end

  struct IFsrmReportJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_task : UInt64
    put_task : UInt64
    get_namespace_roots : UInt64
    put_namespace_roots : UInt64
    get_formats : UInt64
    put_formats : UInt64
    get_mail_to : UInt64
    put_mail_to : UInt64
    get_running_status : UInt64
    get_last_run : UInt64
    get_last_error : UInt64
    get_last_generated_in_directory : UInt64
    enum_reports : UInt64
    create_report : UInt64
    run : UInt64
    wait_for_completion : UInt64
    cancel : UInt64
  end

  IFsrmReportJob_GUID = "38e87280-715c-4c7d-a280-ea1651a19fef"
  IID_IFsrmReportJob = LibC::GUID.new(0x38e87280_u32, 0x715c_u16, 0x4c7d_u16, StaticArray[0xa2_u8, 0x80_u8, 0xea_u8, 0x16_u8, 0x51_u8, 0xa1_u8, 0x9f_u8, 0xef_u8])
  struct IFsrmReportJob
    lpVtbl : IFsrmReportJobVTbl*
  end

  struct IFsrmReportVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    get_name : UInt64
    put_name : UInt64
    get_description : UInt64
    put_description : UInt64
    get_last_generated_file_name_prefix : UInt64
    get_filter : UInt64
    set_filter : UInt64
    delete : UInt64
  end

  IFsrmReport_GUID = "d8cc81d9-46b8-4fa4-bfa5-4aa9dec9b638"
  IID_IFsrmReport = LibC::GUID.new(0xd8cc81d9_u32, 0x46b8_u16, 0x4fa4_u16, StaticArray[0xbf_u8, 0xa5_u8, 0x4a_u8, 0xa9_u8, 0xde_u8, 0xc9_u8, 0xb6_u8, 0x38_u8])
  struct IFsrmReport
    lpVtbl : IFsrmReportVTbl*
  end

  struct IFsrmReportSchedulerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    verify_namespaces : UInt64
    create_schedule_task : UInt64
    modify_schedule_task : UInt64
    delete_schedule_task : UInt64
  end

  IFsrmReportScheduler_GUID = "6879caf9-6617-4484-8719-71c3d8645f94"
  IID_IFsrmReportScheduler = LibC::GUID.new(0x6879caf9_u32, 0x6617_u16, 0x4484_u16, StaticArray[0x87_u8, 0x19_u8, 0x71_u8, 0xc3_u8, 0xd8_u8, 0x64_u8, 0x5f_u8, 0x94_u8])
  struct IFsrmReportScheduler
    lpVtbl : IFsrmReportSchedulerVTbl*
  end

  struct IFsrmFileManagementJobManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_action_variables : UInt64
    get_action_variable_descriptions : UInt64
    enum_file_management_jobs : UInt64
    create_file_management_job : UInt64
    get_file_management_job : UInt64
  end

  IFsrmFileManagementJobManager_GUID = "ee321ecb-d95e-48e9-907c-c7685a013235"
  IID_IFsrmFileManagementJobManager = LibC::GUID.new(0xee321ecb_u32, 0xd95e_u16, 0x48e9_u16, StaticArray[0x90_u8, 0x7c_u8, 0xc7_u8, 0x68_u8, 0x5a_u8, 0x1_u8, 0x32_u8, 0x35_u8])
  struct IFsrmFileManagementJobManager
    lpVtbl : IFsrmFileManagementJobManagerVTbl*
  end

  struct IFsrmFileManagementJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_namespace_roots : UInt64
    put_namespace_roots : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_operation_type : UInt64
    put_operation_type : UInt64
    get_expiration_directory : UInt64
    put_expiration_directory : UInt64
    get_custom_action : UInt64
    get_notifications : UInt64
    get_logging : UInt64
    put_logging : UInt64
    get_report_enabled : UInt64
    put_report_enabled : UInt64
    get_formats : UInt64
    put_formats : UInt64
    get_mail_to : UInt64
    put_mail_to : UInt64
    get_days_since_file_created : UInt64
    put_days_since_file_created : UInt64
    get_days_since_file_last_accessed : UInt64
    put_days_since_file_last_accessed : UInt64
    get_days_since_file_last_modified : UInt64
    put_days_since_file_last_modified : UInt64
    get_property_conditions : UInt64
    get_from_date : UInt64
    put_from_date : UInt64
    get_task : UInt64
    put_task : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
    get_running_status : UInt64
    get_last_error : UInt64
    get_last_report_path_without_extension : UInt64
    get_last_run : UInt64
    get_file_name_pattern : UInt64
    put_file_name_pattern : UInt64
    run : UInt64
    wait_for_completion : UInt64
    cancel : UInt64
    add_notification : UInt64
    delete_notification : UInt64
    modify_notification : UInt64
    create_notification_action : UInt64
    enum_notification_actions : UInt64
    create_property_condition : UInt64
    create_custom_action : UInt64
  end

  IFsrmFileManagementJob_GUID = "0770687e-9f36-4d6f-8778-599d188461c9"
  IID_IFsrmFileManagementJob = LibC::GUID.new(0x770687e_u32, 0x9f36_u16, 0x4d6f_u16, StaticArray[0x87_u8, 0x78_u8, 0x59_u8, 0x9d_u8, 0x18_u8, 0x84_u8, 0x61_u8, 0xc9_u8])
  struct IFsrmFileManagementJob
    lpVtbl : IFsrmFileManagementJobVTbl*
  end

  struct IFsrmPropertyConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    put_name : UInt64
    get_type : UInt64
    put_type : UInt64
    get_value : UInt64
    put_value : UInt64
    delete : UInt64
  end

  IFsrmPropertyCondition_GUID = "326af66f-2ac0-4f68-bf8c-4759f054fa29"
  IID_IFsrmPropertyCondition = LibC::GUID.new(0x326af66f_u32, 0x2ac0_u16, 0x4f68_u16, StaticArray[0xbf_u8, 0x8c_u8, 0x47_u8, 0x59_u8, 0xf0_u8, 0x54_u8, 0xfa_u8, 0x29_u8])
  struct IFsrmPropertyCondition
    lpVtbl : IFsrmPropertyConditionVTbl*
  end

  struct IFsrmFileConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    delete : UInt64
  end

  IFsrmFileCondition_GUID = "70684ffc-691a-4a1a-b922-97752e138cc1"
  IID_IFsrmFileCondition = LibC::GUID.new(0x70684ffc_u32, 0x691a_u16, 0x4a1a_u16, StaticArray[0xb9_u8, 0x22_u8, 0x97_u8, 0x75_u8, 0x2e_u8, 0x13_u8, 0x8c_u8, 0xc1_u8])
  struct IFsrmFileCondition
    lpVtbl : IFsrmFileConditionVTbl*
  end

  struct IFsrmFileConditionPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_type : UInt64
    delete : UInt64
    get_property_name : UInt64
    put_property_name : UInt64
    get_property_id : UInt64
    put_property_id : UInt64
    get_operator : UInt64
    put_operator : UInt64
    get_value_type : UInt64
    put_value_type : UInt64
    get_value : UInt64
    put_value : UInt64
  end

  IFsrmFileConditionProperty_GUID = "81926775-b981-4479-988f-da171d627360"
  IID_IFsrmFileConditionProperty = LibC::GUID.new(0x81926775_u32, 0xb981_u16, 0x4479_u16, StaticArray[0x98_u8, 0x8f_u8, 0xda_u8, 0x17_u8, 0x1d_u8, 0x62_u8, 0x73_u8, 0x60_u8])
  struct IFsrmFileConditionProperty
    lpVtbl : IFsrmFileConditionPropertyVTbl*
  end

  struct IFsrmPropertyDefinitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_type : UInt64
    put_type : UInt64
    get_possible_values : UInt64
    put_possible_values : UInt64
    get_value_descriptions : UInt64
    put_value_descriptions : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
  end

  IFsrmPropertyDefinition_GUID = "ede0150f-e9a3-419c-877c-01fe5d24c5d3"
  IID_IFsrmPropertyDefinition = LibC::GUID.new(0xede0150f_u32, 0xe9a3_u16, 0x419c_u16, StaticArray[0x87_u8, 0x7c_u8, 0x1_u8, 0xfe_u8, 0x5d_u8, 0x24_u8, 0xc5_u8, 0xd3_u8])
  struct IFsrmPropertyDefinition
    lpVtbl : IFsrmPropertyDefinitionVTbl*
  end

  struct IFsrmPropertyDefinition2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_type : UInt64
    put_type : UInt64
    get_possible_values : UInt64
    put_possible_values : UInt64
    get_value_descriptions : UInt64
    put_value_descriptions : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
    get_property_definition_flags : UInt64
    get_display_name : UInt64
    put_display_name : UInt64
    get_applies_to : UInt64
    get_value_definitions : UInt64
  end

  IFsrmPropertyDefinition2_GUID = "47782152-d16c-4229-b4e1-0ddfe308b9f6"
  IID_IFsrmPropertyDefinition2 = LibC::GUID.new(0x47782152_u32, 0xd16c_u16, 0x4229_u16, StaticArray[0xb4_u8, 0xe1_u8, 0xd_u8, 0xdf_u8, 0xe3_u8, 0x8_u8, 0xb9_u8, 0xf6_u8])
  struct IFsrmPropertyDefinition2
    lpVtbl : IFsrmPropertyDefinition2VTbl*
  end

  struct IFsrmPropertyDefinitionValueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_display_name : UInt64
    get_description : UInt64
    get_unique_id : UInt64
  end

  IFsrmPropertyDefinitionValue_GUID = "e946d148-bd67-4178-8e22-1c44925ed710"
  IID_IFsrmPropertyDefinitionValue = LibC::GUID.new(0xe946d148_u32, 0xbd67_u16, 0x4178_u16, StaticArray[0x8e_u8, 0x22_u8, 0x1c_u8, 0x44_u8, 0x92_u8, 0x5e_u8, 0xd7_u8, 0x10_u8])
  struct IFsrmPropertyDefinitionValue
    lpVtbl : IFsrmPropertyDefinitionValueVTbl*
  end

  struct IFsrmPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_value : UInt64
    get_sources : UInt64
    get_property_flags : UInt64
  end

  IFsrmProperty_GUID = "4a73fee4-4102-4fcc-9ffb-38614f9ee768"
  IID_IFsrmProperty = LibC::GUID.new(0x4a73fee4_u32, 0x4102_u16, 0x4fcc_u16, StaticArray[0x9f_u8, 0xfb_u8, 0x38_u8, 0x61_u8, 0x4f_u8, 0x9e_u8, 0xe7_u8, 0x68_u8])
  struct IFsrmProperty
    lpVtbl : IFsrmPropertyVTbl*
  end

  struct IFsrmRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_rule_type : UInt64
    get_module_definition_name : UInt64
    put_module_definition_name : UInt64
    get_namespace_roots : UInt64
    put_namespace_roots : UInt64
    get_rule_flags : UInt64
    put_rule_flags : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
    get_last_modified : UInt64
  end

  IFsrmRule_GUID = "cb0df960-16f5-4495-9079-3f9360d831df"
  IID_IFsrmRule = LibC::GUID.new(0xcb0df960_u32, 0x16f5_u16, 0x4495_u16, StaticArray[0x90_u8, 0x79_u8, 0x3f_u8, 0x93_u8, 0x60_u8, 0xd8_u8, 0x31_u8, 0xdf_u8])
  struct IFsrmRule
    lpVtbl : IFsrmRuleVTbl*
  end

  struct IFsrmClassificationRuleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_name : UInt64
    put_name : UInt64
    get_rule_type : UInt64
    get_module_definition_name : UInt64
    put_module_definition_name : UInt64
    get_namespace_roots : UInt64
    put_namespace_roots : UInt64
    get_rule_flags : UInt64
    put_rule_flags : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
    get_last_modified : UInt64
    get_execution_option : UInt64
    put_execution_option : UInt64
    get_property_affected : UInt64
    put_property_affected : UInt64
    get_value : UInt64
    put_value : UInt64
  end

  IFsrmClassificationRule_GUID = "afc052c2-5315-45ab-841b-c6db0e120148"
  IID_IFsrmClassificationRule = LibC::GUID.new(0xafc052c2_u32, 0x5315_u16, 0x45ab_u16, StaticArray[0x84_u8, 0x1b_u8, 0xc6_u8, 0xdb_u8, 0xe_u8, 0x12_u8, 0x1_u8, 0x48_u8])
  struct IFsrmClassificationRule
    lpVtbl : IFsrmClassificationRuleVTbl*
  end

  struct IFsrmPipelineModuleDefinitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_module_clsid : UInt64
    put_module_clsid : UInt64
    get_name : UInt64
    put_name : UInt64
    get_company : UInt64
    put_company : UInt64
    get_version : UInt64
    put_version : UInt64
    get_module_type : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_needs_file_content : UInt64
    put_needs_file_content : UInt64
    get_account : UInt64
    put_account : UInt64
    get_supported_extensions : UInt64
    put_supported_extensions : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
  end

  IFsrmPipelineModuleDefinition_GUID = "515c1277-2c81-440e-8fcf-367921ed4f59"
  IID_IFsrmPipelineModuleDefinition = LibC::GUID.new(0x515c1277_u32, 0x2c81_u16, 0x440e_u16, StaticArray[0x8f_u8, 0xcf_u8, 0x36_u8, 0x79_u8, 0x21_u8, 0xed_u8, 0x4f_u8, 0x59_u8])
  struct IFsrmPipelineModuleDefinition
    lpVtbl : IFsrmPipelineModuleDefinitionVTbl*
  end

  struct IFsrmClassifierModuleDefinitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_module_clsid : UInt64
    put_module_clsid : UInt64
    get_name : UInt64
    put_name : UInt64
    get_company : UInt64
    put_company : UInt64
    get_version : UInt64
    put_version : UInt64
    get_module_type : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_needs_file_content : UInt64
    put_needs_file_content : UInt64
    get_account : UInt64
    put_account : UInt64
    get_supported_extensions : UInt64
    put_supported_extensions : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
    get_properties_affected : UInt64
    put_properties_affected : UInt64
    get_properties_used : UInt64
    put_properties_used : UInt64
    get_needs_explicit_value : UInt64
    put_needs_explicit_value : UInt64
  end

  IFsrmClassifierModuleDefinition_GUID = "bb36ea26-6318-4b8c-8592-f72dd602e7a5"
  IID_IFsrmClassifierModuleDefinition = LibC::GUID.new(0xbb36ea26_u32, 0x6318_u16, 0x4b8c_u16, StaticArray[0x85_u8, 0x92_u8, 0xf7_u8, 0x2d_u8, 0xd6_u8, 0x2_u8, 0xe7_u8, 0xa5_u8])
  struct IFsrmClassifierModuleDefinition
    lpVtbl : IFsrmClassifierModuleDefinitionVTbl*
  end

  struct IFsrmStorageModuleDefinitionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_id : UInt64
    get_description : UInt64
    put_description : UInt64
    delete : UInt64
    commit : UInt64
    get_module_clsid : UInt64
    put_module_clsid : UInt64
    get_name : UInt64
    put_name : UInt64
    get_company : UInt64
    put_company : UInt64
    get_version : UInt64
    put_version : UInt64
    get_module_type : UInt64
    get_enabled : UInt64
    put_enabled : UInt64
    get_needs_file_content : UInt64
    put_needs_file_content : UInt64
    get_account : UInt64
    put_account : UInt64
    get_supported_extensions : UInt64
    put_supported_extensions : UInt64
    get_parameters : UInt64
    put_parameters : UInt64
    get_capabilities : UInt64
    put_capabilities : UInt64
    get_storage_type : UInt64
    put_storage_type : UInt64
    get_updates_file_content : UInt64
    put_updates_file_content : UInt64
  end

  IFsrmStorageModuleDefinition_GUID = "15a81350-497d-4aba-80e9-d4dbcc5521fe"
  IID_IFsrmStorageModuleDefinition = LibC::GUID.new(0x15a81350_u32, 0x497d_u16, 0x4aba_u16, StaticArray[0x80_u8, 0xe9_u8, 0xd4_u8, 0xdb_u8, 0xcc_u8, 0x55_u8, 0x21_u8, 0xfe_u8])
  struct IFsrmStorageModuleDefinition
    lpVtbl : IFsrmStorageModuleDefinitionVTbl*
  end

  struct IFsrmClassificationManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_classification_report_formats : UInt64
    put_classification_report_formats : UInt64
    get_logging : UInt64
    put_logging : UInt64
    get_classification_report_mail_to : UInt64
    put_classification_report_mail_to : UInt64
    get_classification_report_enabled : UInt64
    put_classification_report_enabled : UInt64
    get_classification_last_report_path_without_extension : UInt64
    get_classification_last_error : UInt64
    get_classification_running_status : UInt64
    enum_property_definitions : UInt64
    create_property_definition : UInt64
    get_property_definition : UInt64
    enum_rules : UInt64
    create_rule : UInt64
    get_rule : UInt64
    enum_module_definitions : UInt64
    create_module_definition : UInt64
    get_module_definition : UInt64
    run_classification : UInt64
    wait_for_classification_completion : UInt64
    cancel_classification : UInt64
    enum_file_properties : UInt64
    get_file_property : UInt64
    set_file_property : UInt64
    clear_file_property : UInt64
  end

  IFsrmClassificationManager_GUID = "d2dc89da-ee91-48a0-85d8-cc72a56f7d04"
  IID_IFsrmClassificationManager = LibC::GUID.new(0xd2dc89da_u32, 0xee91_u16, 0x48a0_u16, StaticArray[0x85_u8, 0xd8_u8, 0xcc_u8, 0x72_u8, 0xa5_u8, 0x6f_u8, 0x7d_u8, 0x4_u8])
  struct IFsrmClassificationManager
    lpVtbl : IFsrmClassificationManagerVTbl*
  end

  struct IFsrmClassificationManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_classification_report_formats : UInt64
    put_classification_report_formats : UInt64
    get_logging : UInt64
    put_logging : UInt64
    get_classification_report_mail_to : UInt64
    put_classification_report_mail_to : UInt64
    get_classification_report_enabled : UInt64
    put_classification_report_enabled : UInt64
    get_classification_last_report_path_without_extension : UInt64
    get_classification_last_error : UInt64
    get_classification_running_status : UInt64
    enum_property_definitions : UInt64
    create_property_definition : UInt64
    get_property_definition : UInt64
    enum_rules : UInt64
    create_rule : UInt64
    get_rule : UInt64
    enum_module_definitions : UInt64
    create_module_definition : UInt64
    get_module_definition : UInt64
    run_classification : UInt64
    wait_for_classification_completion : UInt64
    cancel_classification : UInt64
    enum_file_properties : UInt64
    get_file_property : UInt64
    set_file_property : UInt64
    clear_file_property : UInt64
    classify_files : UInt64
  end

  IFsrmClassificationManager2_GUID = "0004c1c9-127e-4765-ba07-6a3147bca112"
  IID_IFsrmClassificationManager2 = LibC::GUID.new(0x4c1c9_u32, 0x127e_u16, 0x4765_u16, StaticArray[0xba_u8, 0x7_u8, 0x6a_u8, 0x31_u8, 0x47_u8, 0xbc_u8, 0xa1_u8, 0x12_u8])
  struct IFsrmClassificationManager2
    lpVtbl : IFsrmClassificationManager2VTbl*
  end

  struct IFsrmPropertyBagVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_relative_path : UInt64
    get_volume_name : UInt64
    get_relative_namespace_root : UInt64
    get_volume_index : UInt64
    get_file_id : UInt64
    get_parent_directory_id : UInt64
    get_size : UInt64
    get_size_allocated : UInt64
    get_creation_time : UInt64
    get_last_access_time : UInt64
    get_last_modification_time : UInt64
    get_attributes : UInt64
    get_owner_sid : UInt64
    get_file_property_names : UInt64
    get_messages : UInt64
    get_property_bag_flags : UInt64
    get_file_property : UInt64
    set_file_property : UInt64
    add_message : UInt64
    get_file_stream_interface : UInt64
  end

  IFsrmPropertyBag_GUID = "774589d1-d300-4f7a-9a24-f7b766800250"
  IID_IFsrmPropertyBag = LibC::GUID.new(0x774589d1_u32, 0xd300_u16, 0x4f7a_u16, StaticArray[0x9a_u8, 0x24_u8, 0xf7_u8, 0xb7_u8, 0x66_u8, 0x80_u8, 0x2_u8, 0x50_u8])
  struct IFsrmPropertyBag
    lpVtbl : IFsrmPropertyBagVTbl*
  end

  struct IFsrmPropertyBag2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_relative_path : UInt64
    get_volume_name : UInt64
    get_relative_namespace_root : UInt64
    get_volume_index : UInt64
    get_file_id : UInt64
    get_parent_directory_id : UInt64
    get_size : UInt64
    get_size_allocated : UInt64
    get_creation_time : UInt64
    get_last_access_time : UInt64
    get_last_modification_time : UInt64
    get_attributes : UInt64
    get_owner_sid : UInt64
    get_file_property_names : UInt64
    get_messages : UInt64
    get_property_bag_flags : UInt64
    get_file_property : UInt64
    set_file_property : UInt64
    add_message : UInt64
    get_file_stream_interface : UInt64
    get_field_value : UInt64
    get_untrusted_in_file_properties : UInt64
  end

  IFsrmPropertyBag2_GUID = "0e46bdbd-2402-4fed-9c30-9266e6eb2cc9"
  IID_IFsrmPropertyBag2 = LibC::GUID.new(0xe46bdbd_u32, 0x2402_u16, 0x4fed_u16, StaticArray[0x9c_u8, 0x30_u8, 0x92_u8, 0x66_u8, 0xe6_u8, 0xeb_u8, 0x2c_u8, 0xc9_u8])
  struct IFsrmPropertyBag2
    lpVtbl : IFsrmPropertyBag2VTbl*
  end

  struct IFsrmPipelineModuleImplementationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_load : UInt64
    on_unload : UInt64
  end

  IFsrmPipelineModuleImplementation_GUID = "b7907906-2b02-4cb5-84a9-fdf54613d6cd"
  IID_IFsrmPipelineModuleImplementation = LibC::GUID.new(0xb7907906_u32, 0x2b02_u16, 0x4cb5_u16, StaticArray[0x84_u8, 0xa9_u8, 0xfd_u8, 0xf5_u8, 0x46_u8, 0x13_u8, 0xd6_u8, 0xcd_u8])
  struct IFsrmPipelineModuleImplementation
    lpVtbl : IFsrmPipelineModuleImplementationVTbl*
  end

  struct IFsrmClassifierModuleImplementationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_load : UInt64
    on_unload : UInt64
    get_last_modified : UInt64
    use_rules_and_definitions : UInt64
    on_begin_file : UInt64
    does_property_value_apply : UInt64
    get_property_value_to_apply : UInt64
    on_end_file : UInt64
  end

  IFsrmClassifierModuleImplementation_GUID = "4c968fc6-6edb-4051-9c18-73b7291ae106"
  IID_IFsrmClassifierModuleImplementation = LibC::GUID.new(0x4c968fc6_u32, 0x6edb_u16, 0x4051_u16, StaticArray[0x9c_u8, 0x18_u8, 0x73_u8, 0xb7_u8, 0x29_u8, 0x1a_u8, 0xe1_u8, 0x6_u8])
  struct IFsrmClassifierModuleImplementation
    lpVtbl : IFsrmClassifierModuleImplementationVTbl*
  end

  struct IFsrmStorageModuleImplementationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_load : UInt64
    on_unload : UInt64
    use_definitions : UInt64
    load_properties : UInt64
    save_properties : UInt64
  end

  IFsrmStorageModuleImplementation_GUID = "0af4a0da-895a-4e50-8712-a96724bcec64"
  IID_IFsrmStorageModuleImplementation = LibC::GUID.new(0xaf4a0da_u32, 0x895a_u16, 0x4e50_u16, StaticArray[0x87_u8, 0x12_u8, 0xa9_u8, 0x67_u8, 0x24_u8, 0xbc_u8, 0xec_u8, 0x64_u8])
  struct IFsrmStorageModuleImplementation
    lpVtbl : IFsrmStorageModuleImplementationVTbl*
  end

  struct IFsrmPipelineModuleConnectorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_module_implementation : UInt64
    get_module_name : UInt64
    get_hosting_user_account : UInt64
    get_hosting_process_pid : UInt64
    bind : UInt64
  end

  IFsrmPipelineModuleConnector_GUID = "c16014f3-9aa1-46b3-b0a7-ab146eb205f2"
  IID_IFsrmPipelineModuleConnector = LibC::GUID.new(0xc16014f3_u32, 0x9aa1_u16, 0x46b3_u16, StaticArray[0xb0_u8, 0xa7_u8, 0xab_u8, 0x14_u8, 0x6e_u8, 0xb2_u8, 0x5_u8, 0xf2_u8])
  struct IFsrmPipelineModuleConnector
    lpVtbl : IFsrmPipelineModuleConnectorVTbl*
  end

  struct DIFsrmClassificationEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  DIFsrmClassificationEvents_GUID = "26942db0-dabf-41d8-bbdd-b129a9f70424"
  IID_DIFsrmClassificationEvents = LibC::GUID.new(0x26942db0_u32, 0xdabf_u16, 0x41d8_u16, StaticArray[0xbb_u8, 0xdd_u8, 0xb1_u8, 0x29_u8, 0xa9_u8, 0xf7_u8, 0x4_u8, 0x24_u8])
  struct DIFsrmClassificationEvents
    lpVtbl : DIFsrmClassificationEventsVTbl*
  end

end
struct LibWin32::IFsrmObject
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmCollection
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
  def get__new_enum(unknown : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(unknown)
  end
  def get_item(index : Int32, item : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(index, item)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def get_state(state : FsrmCollectionState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(FsrmCollectionState*, HRESULT)).call(state)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def get_by_id(id : Guid, entry : VARIANT*) : HRESULT
    @lpVtbl.value.get_by_id.unsafe_as(Proc(Guid, VARIANT*, HRESULT)).call(id, entry)
  end
end
struct LibWin32::IFsrmMutableCollection
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
  def get__new_enum(unknown : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(unknown)
  end
  def get_item(index : Int32, item : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(index, item)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def get_state(state : FsrmCollectionState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(FsrmCollectionState*, HRESULT)).call(state)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def get_by_id(id : Guid, entry : VARIANT*) : HRESULT
    @lpVtbl.value.get_by_id.unsafe_as(Proc(Guid, VARIANT*, HRESULT)).call(id, entry)
  end
  def add(item : VARIANT) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(VARIANT, HRESULT)).call(item)
  end
  def remove(index : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def remove_by_id(id : Guid) : HRESULT
    @lpVtbl.value.remove_by_id.unsafe_as(Proc(Guid, HRESULT)).call(id)
  end
  def clone(collection : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(collection)
  end
end
struct LibWin32::IFsrmCommittableCollection
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
  def get__new_enum(unknown : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(unknown)
  end
  def get_item(index : Int32, item : VARIANT*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(index, item)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def get_state(state : FsrmCollectionState*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(FsrmCollectionState*, HRESULT)).call(state)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def get_by_id(id : Guid, entry : VARIANT*) : HRESULT
    @lpVtbl.value.get_by_id.unsafe_as(Proc(Guid, VARIANT*, HRESULT)).call(id, entry)
  end
  def add(item : VARIANT) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(VARIANT, HRESULT)).call(item)
  end
  def remove(index : Int32) : HRESULT
    @lpVtbl.value.remove.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
  def remove_by_id(id : Guid) : HRESULT
    @lpVtbl.value.remove_by_id.unsafe_as(Proc(Guid, HRESULT)).call(id)
  end
  def clone(collection : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(collection)
  end
  def commit(options : FsrmCommitOptions, results : IFsrmCollection*) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(FsrmCommitOptions, IFsrmCollection*, HRESULT)).call(options, results)
  end
end
struct LibWin32::IFsrmAction
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_action_type(actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.unsafe_as(Proc(FsrmActionType*, HRESULT)).call(actiontype)
  end
  def get_run_limit_interval(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_run_limit_interval(minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmActionEmail
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_action_type(actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.unsafe_as(Proc(FsrmActionType*, HRESULT)).call(actiontype)
  end
  def get_run_limit_interval(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_run_limit_interval(minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_mail_from(mailfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_from.unsafe_as(Proc(UInt8**, HRESULT)).call(mailfrom)
  end
  def put_mail_from(mailfrom : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_from.unsafe_as(Proc(UInt8*, HRESULT)).call(mailfrom)
  end
  def get_mail_reply_to(mailreplyto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_reply_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailreplyto)
  end
  def put_mail_reply_to(mailreplyto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_reply_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailreplyto)
  end
  def get_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def get_mail_cc(mailcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_cc.unsafe_as(Proc(UInt8**, HRESULT)).call(mailcc)
  end
  def put_mail_cc(mailcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_cc.unsafe_as(Proc(UInt8*, HRESULT)).call(mailcc)
  end
  def get_mail_bcc(mailbcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_bcc.unsafe_as(Proc(UInt8**, HRESULT)).call(mailbcc)
  end
  def put_mail_bcc(mailbcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_bcc.unsafe_as(Proc(UInt8*, HRESULT)).call(mailbcc)
  end
  def get_mail_subject(mailsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(mailsubject)
  end
  def put_mail_subject(mailsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_subject.unsafe_as(Proc(UInt8*, HRESULT)).call(mailsubject)
  end
  def get_message_text(messagetext : UInt8**) : HRESULT
    @lpVtbl.value.get_message_text.unsafe_as(Proc(UInt8**, HRESULT)).call(messagetext)
  end
  def put_message_text(messagetext : UInt8*) : HRESULT
    @lpVtbl.value.put_message_text.unsafe_as(Proc(UInt8*, HRESULT)).call(messagetext)
  end
end
struct LibWin32::IFsrmActionEmail2
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_action_type(actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.unsafe_as(Proc(FsrmActionType*, HRESULT)).call(actiontype)
  end
  def get_run_limit_interval(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_run_limit_interval(minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_mail_from(mailfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_from.unsafe_as(Proc(UInt8**, HRESULT)).call(mailfrom)
  end
  def put_mail_from(mailfrom : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_from.unsafe_as(Proc(UInt8*, HRESULT)).call(mailfrom)
  end
  def get_mail_reply_to(mailreplyto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_reply_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailreplyto)
  end
  def put_mail_reply_to(mailreplyto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_reply_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailreplyto)
  end
  def get_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def get_mail_cc(mailcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_cc.unsafe_as(Proc(UInt8**, HRESULT)).call(mailcc)
  end
  def put_mail_cc(mailcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_cc.unsafe_as(Proc(UInt8*, HRESULT)).call(mailcc)
  end
  def get_mail_bcc(mailbcc : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_bcc.unsafe_as(Proc(UInt8**, HRESULT)).call(mailbcc)
  end
  def put_mail_bcc(mailbcc : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_bcc.unsafe_as(Proc(UInt8*, HRESULT)).call(mailbcc)
  end
  def get_mail_subject(mailsubject : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_subject.unsafe_as(Proc(UInt8**, HRESULT)).call(mailsubject)
  end
  def put_mail_subject(mailsubject : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_subject.unsafe_as(Proc(UInt8*, HRESULT)).call(mailsubject)
  end
  def get_message_text(messagetext : UInt8**) : HRESULT
    @lpVtbl.value.get_message_text.unsafe_as(Proc(UInt8**, HRESULT)).call(messagetext)
  end
  def put_message_text(messagetext : UInt8*) : HRESULT
    @lpVtbl.value.put_message_text.unsafe_as(Proc(UInt8*, HRESULT)).call(messagetext)
  end
  def get_attachment_file_list_size(attachmentfilelistsize : Int32*) : HRESULT
    @lpVtbl.value.get_attachment_file_list_size.unsafe_as(Proc(Int32*, HRESULT)).call(attachmentfilelistsize)
  end
  def put_attachment_file_list_size(attachmentfilelistsize : Int32) : HRESULT
    @lpVtbl.value.put_attachment_file_list_size.unsafe_as(Proc(Int32, HRESULT)).call(attachmentfilelistsize)
  end
end
struct LibWin32::IFsrmActionReport
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_action_type(actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.unsafe_as(Proc(FsrmActionType*, HRESULT)).call(actiontype)
  end
  def get_run_limit_interval(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_run_limit_interval(minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_report_types(reporttypes : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_report_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(reporttypes)
  end
  def put_report_types(reporttypes : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_report_types.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(reporttypes)
  end
  def get_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
end
struct LibWin32::IFsrmActionEventLog
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_action_type(actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.unsafe_as(Proc(FsrmActionType*, HRESULT)).call(actiontype)
  end
  def get_run_limit_interval(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_run_limit_interval(minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_event_type(eventtype : FsrmEventType*) : HRESULT
    @lpVtbl.value.get_event_type.unsafe_as(Proc(FsrmEventType*, HRESULT)).call(eventtype)
  end
  def put_event_type(eventtype : FsrmEventType) : HRESULT
    @lpVtbl.value.put_event_type.unsafe_as(Proc(FsrmEventType, HRESULT)).call(eventtype)
  end
  def get_message_text(messagetext : UInt8**) : HRESULT
    @lpVtbl.value.get_message_text.unsafe_as(Proc(UInt8**, HRESULT)).call(messagetext)
  end
  def put_message_text(messagetext : UInt8*) : HRESULT
    @lpVtbl.value.put_message_text.unsafe_as(Proc(UInt8*, HRESULT)).call(messagetext)
  end
end
struct LibWin32::IFsrmActionCommand
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_action_type(actiontype : FsrmActionType*) : HRESULT
    @lpVtbl.value.get_action_type.unsafe_as(Proc(FsrmActionType*, HRESULT)).call(actiontype)
  end
  def get_run_limit_interval(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_run_limit_interval.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_run_limit_interval(minutes : Int32) : HRESULT
    @lpVtbl.value.put_run_limit_interval.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_executable_path(executablepath : UInt8**) : HRESULT
    @lpVtbl.value.get_executable_path.unsafe_as(Proc(UInt8**, HRESULT)).call(executablepath)
  end
  def put_executable_path(executablepath : UInt8*) : HRESULT
    @lpVtbl.value.put_executable_path.unsafe_as(Proc(UInt8*, HRESULT)).call(executablepath)
  end
  def get_arguments(arguments : UInt8**) : HRESULT
    @lpVtbl.value.get_arguments.unsafe_as(Proc(UInt8**, HRESULT)).call(arguments)
  end
  def put_arguments(arguments : UInt8*) : HRESULT
    @lpVtbl.value.put_arguments.unsafe_as(Proc(UInt8*, HRESULT)).call(arguments)
  end
  def get_account(account : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.unsafe_as(Proc(FsrmAccountType*, HRESULT)).call(account)
  end
  def put_account(account : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.unsafe_as(Proc(FsrmAccountType, HRESULT)).call(account)
  end
  def get_working_directory(workingdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_working_directory.unsafe_as(Proc(UInt8**, HRESULT)).call(workingdirectory)
  end
  def put_working_directory(workingdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_working_directory.unsafe_as(Proc(UInt8*, HRESULT)).call(workingdirectory)
  end
  def get_monitor_command(monitorcommand : Int16*) : HRESULT
    @lpVtbl.value.get_monitor_command.unsafe_as(Proc(Int16*, HRESULT)).call(monitorcommand)
  end
  def put_monitor_command(monitorcommand : Int16) : HRESULT
    @lpVtbl.value.put_monitor_command.unsafe_as(Proc(Int16, HRESULT)).call(monitorcommand)
  end
  def get_kill_time_out(minutes : Int32*) : HRESULT
    @lpVtbl.value.get_kill_time_out.unsafe_as(Proc(Int32*, HRESULT)).call(minutes)
  end
  def put_kill_time_out(minutes : Int32) : HRESULT
    @lpVtbl.value.put_kill_time_out.unsafe_as(Proc(Int32, HRESULT)).call(minutes)
  end
  def get_log_result(logresults : Int16*) : HRESULT
    @lpVtbl.value.get_log_result.unsafe_as(Proc(Int16*, HRESULT)).call(logresults)
  end
  def put_log_result(logresults : Int16) : HRESULT
    @lpVtbl.value.put_log_result.unsafe_as(Proc(Int16, HRESULT)).call(logresults)
  end
end
struct LibWin32::IFsrmSetting
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
  def get_smtp_server(smtpserver : UInt8**) : HRESULT
    @lpVtbl.value.get_smtp_server.unsafe_as(Proc(UInt8**, HRESULT)).call(smtpserver)
  end
  def put_smtp_server(smtpserver : UInt8*) : HRESULT
    @lpVtbl.value.put_smtp_server.unsafe_as(Proc(UInt8*, HRESULT)).call(smtpserver)
  end
  def get_mail_from(mailfrom : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_from.unsafe_as(Proc(UInt8**, HRESULT)).call(mailfrom)
  end
  def put_mail_from(mailfrom : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_from.unsafe_as(Proc(UInt8*, HRESULT)).call(mailfrom)
  end
  def get_admin_email(adminemail : UInt8**) : HRESULT
    @lpVtbl.value.get_admin_email.unsafe_as(Proc(UInt8**, HRESULT)).call(adminemail)
  end
  def put_admin_email(adminemail : UInt8*) : HRESULT
    @lpVtbl.value.put_admin_email.unsafe_as(Proc(UInt8*, HRESULT)).call(adminemail)
  end
  def get_disable_command_line(disablecommandline : Int16*) : HRESULT
    @lpVtbl.value.get_disable_command_line.unsafe_as(Proc(Int16*, HRESULT)).call(disablecommandline)
  end
  def put_disable_command_line(disablecommandline : Int16) : HRESULT
    @lpVtbl.value.put_disable_command_line.unsafe_as(Proc(Int16, HRESULT)).call(disablecommandline)
  end
  def get_enable_screening_audit(enablescreeningaudit : Int16*) : HRESULT
    @lpVtbl.value.get_enable_screening_audit.unsafe_as(Proc(Int16*, HRESULT)).call(enablescreeningaudit)
  end
  def put_enable_screening_audit(enablescreeningaudit : Int16) : HRESULT
    @lpVtbl.value.put_enable_screening_audit.unsafe_as(Proc(Int16, HRESULT)).call(enablescreeningaudit)
  end
  def email_test(mailto : UInt8*) : HRESULT
    @lpVtbl.value.email_test.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def set_action_run_limit_interval(actiontype : FsrmActionType, delaytimeminutes : Int32) : HRESULT
    @lpVtbl.value.set_action_run_limit_interval.unsafe_as(Proc(FsrmActionType, Int32, HRESULT)).call(actiontype, delaytimeminutes)
  end
  def get_action_run_limit_interval(actiontype : FsrmActionType, delaytimeminutes : Int32*) : HRESULT
    @lpVtbl.value.get_action_run_limit_interval.unsafe_as(Proc(FsrmActionType, Int32*, HRESULT)).call(actiontype, delaytimeminutes)
  end
end
struct LibWin32::IFsrmPathMapper
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
  def get_share_paths_for_local_path(localpath : UInt8*, sharepaths : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_share_paths_for_local_path.unsafe_as(Proc(UInt8*, SAFEARRAY**, HRESULT)).call(localpath, sharepaths)
  end
end
struct LibWin32::IFsrmExportImport
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
  def export_file_groups(filepath : UInt8*, filegroupnamessafearray : VARIANT*, remotehost : UInt8*) : HRESULT
    @lpVtbl.value.export_file_groups.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(filepath, filegroupnamessafearray, remotehost)
  end
  def import_file_groups(filepath : UInt8*, filegroupnamessafearray : VARIANT*, remotehost : UInt8*, filegroups : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_file_groups.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, IFsrmCommittableCollection*, HRESULT)).call(filepath, filegroupnamessafearray, remotehost, filegroups)
  end
  def export_file_screen_templates(filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*) : HRESULT
    @lpVtbl.value.export_file_screen_templates.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(filepath, templatenamessafearray, remotehost)
  end
  def import_file_screen_templates(filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*, templates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_file_screen_templates.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, IFsrmCommittableCollection*, HRESULT)).call(filepath, templatenamessafearray, remotehost, templates)
  end
  def export_quota_templates(filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*) : HRESULT
    @lpVtbl.value.export_quota_templates.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(filepath, templatenamessafearray, remotehost)
  end
  def import_quota_templates(filepath : UInt8*, templatenamessafearray : VARIANT*, remotehost : UInt8*, templates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_quota_templates.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, IFsrmCommittableCollection*, HRESULT)).call(filepath, templatenamessafearray, remotehost, templates)
  end
end
struct LibWin32::IFsrmDerivedObjectsResult
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
  def get_derived_objects(derivedobjects : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_derived_objects.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(derivedobjects)
  end
  def get_results(results : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_results.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(results)
  end
end
struct LibWin32::IFsrmAccessDeniedRemediationClient
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
  def show(parentwnd : LibC::UINT_PTR, accesspath : UInt8*, errortype : AdrClientErrorType, flags : Int32, windowtitle : UInt8*, windowmessage : UInt8*, result : Int32*) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::UINT_PTR, UInt8*, AdrClientErrorType, Int32, UInt8*, UInt8*, Int32*, HRESULT)).call(parentwnd, accesspath, errortype, flags, windowtitle, windowmessage, result)
  end
end
struct LibWin32::IFsrmQuotaBase
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_quota_limit(quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.unsafe_as(Proc(VARIANT*, HRESULT)).call(quotalimit)
  end
  def put_quota_limit(quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.unsafe_as(Proc(VARIANT, HRESULT)).call(quotalimit)
  end
  def get_quota_flags(quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.unsafe_as(Proc(Int32*, HRESULT)).call(quotaflags)
  end
  def put_quota_flags(quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.unsafe_as(Proc(Int32, HRESULT)).call(quotaflags)
  end
  def get_thresholds(thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(thresholds)
  end
  def add_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def delete_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def modify_threshold(threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.unsafe_as(Proc(Int32, Int32, HRESULT)).call(threshold, newthreshold)
  end
  def create_threshold_action(threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(threshold, actiontype, action)
  end
  def enum_threshold_actions(threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(threshold, actions)
  end
end
struct LibWin32::IFsrmQuotaObject
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_quota_limit(quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.unsafe_as(Proc(VARIANT*, HRESULT)).call(quotalimit)
  end
  def put_quota_limit(quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.unsafe_as(Proc(VARIANT, HRESULT)).call(quotalimit)
  end
  def get_quota_flags(quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.unsafe_as(Proc(Int32*, HRESULT)).call(quotaflags)
  end
  def put_quota_flags(quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.unsafe_as(Proc(Int32, HRESULT)).call(quotaflags)
  end
  def get_thresholds(thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(thresholds)
  end
  def add_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def delete_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def modify_threshold(threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.unsafe_as(Proc(Int32, Int32, HRESULT)).call(threshold, newthreshold)
  end
  def create_threshold_action(threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(threshold, actiontype, action)
  end
  def enum_threshold_actions(threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(threshold, actions)
  end
  def get_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_user_sid(usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(usersid)
  end
  def get_user_account(useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(useraccount)
  end
  def get_source_template_name(quotatemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.unsafe_as(Proc(UInt8**, HRESULT)).call(quotatemplatename)
  end
  def get_matches_source_template(matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.unsafe_as(Proc(Int16*, HRESULT)).call(matches)
  end
  def apply_template(quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.unsafe_as(Proc(UInt8*, HRESULT)).call(quotatemplatename)
  end
end
struct LibWin32::IFsrmQuota
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_quota_limit(quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.unsafe_as(Proc(VARIANT*, HRESULT)).call(quotalimit)
  end
  def put_quota_limit(quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.unsafe_as(Proc(VARIANT, HRESULT)).call(quotalimit)
  end
  def get_quota_flags(quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.unsafe_as(Proc(Int32*, HRESULT)).call(quotaflags)
  end
  def put_quota_flags(quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.unsafe_as(Proc(Int32, HRESULT)).call(quotaflags)
  end
  def get_thresholds(thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(thresholds)
  end
  def add_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def delete_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def modify_threshold(threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.unsafe_as(Proc(Int32, Int32, HRESULT)).call(threshold, newthreshold)
  end
  def create_threshold_action(threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(threshold, actiontype, action)
  end
  def enum_threshold_actions(threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(threshold, actions)
  end
  def get_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_user_sid(usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(usersid)
  end
  def get_user_account(useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(useraccount)
  end
  def get_source_template_name(quotatemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.unsafe_as(Proc(UInt8**, HRESULT)).call(quotatemplatename)
  end
  def get_matches_source_template(matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.unsafe_as(Proc(Int16*, HRESULT)).call(matches)
  end
  def apply_template(quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.unsafe_as(Proc(UInt8*, HRESULT)).call(quotatemplatename)
  end
  def get_quota_used(used : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_used.unsafe_as(Proc(VARIANT*, HRESULT)).call(used)
  end
  def get_quota_peak_usage(peakusage : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_peak_usage.unsafe_as(Proc(VARIANT*, HRESULT)).call(peakusage)
  end
  def get_quota_peak_usage_time(peakusagedatetime : Float64*) : HRESULT
    @lpVtbl.value.get_quota_peak_usage_time.unsafe_as(Proc(Float64*, HRESULT)).call(peakusagedatetime)
  end
  def reset_peak_usage : HRESULT
    @lpVtbl.value.reset_peak_usage.unsafe_as(Proc(HRESULT)).call
  end
  def refresh_usage_properties : HRESULT
    @lpVtbl.value.refresh_usage_properties.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmAutoApplyQuota
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_quota_limit(quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.unsafe_as(Proc(VARIANT*, HRESULT)).call(quotalimit)
  end
  def put_quota_limit(quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.unsafe_as(Proc(VARIANT, HRESULT)).call(quotalimit)
  end
  def get_quota_flags(quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.unsafe_as(Proc(Int32*, HRESULT)).call(quotaflags)
  end
  def put_quota_flags(quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.unsafe_as(Proc(Int32, HRESULT)).call(quotaflags)
  end
  def get_thresholds(thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(thresholds)
  end
  def add_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def delete_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def modify_threshold(threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.unsafe_as(Proc(Int32, Int32, HRESULT)).call(threshold, newthreshold)
  end
  def create_threshold_action(threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(threshold, actiontype, action)
  end
  def enum_threshold_actions(threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(threshold, actions)
  end
  def get_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_user_sid(usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(usersid)
  end
  def get_user_account(useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(useraccount)
  end
  def get_source_template_name(quotatemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.unsafe_as(Proc(UInt8**, HRESULT)).call(quotatemplatename)
  end
  def get_matches_source_template(matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.unsafe_as(Proc(Int16*, HRESULT)).call(matches)
  end
  def apply_template(quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.unsafe_as(Proc(UInt8*, HRESULT)).call(quotatemplatename)
  end
  def get_exclude_folders(folders : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_exclude_folders.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(folders)
  end
  def put_exclude_folders(folders : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_exclude_folders.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(folders)
  end
  def commit_and_update_derived(commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.unsafe_as(Proc(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)).call(commitoptions, applyoptions, derivedobjectsresult)
  end
end
struct LibWin32::IFsrmQuotaManager
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
  def get_action_variables(variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(variables)
  end
  def get_action_variable_descriptions(descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(descriptions)
  end
  def create_quota(path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.create_quota.unsafe_as(Proc(UInt8*, IFsrmQuota*, HRESULT)).call(path, quota)
  end
  def create_auto_apply_quota(quotatemplatename : UInt8*, path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.create_auto_apply_quota.unsafe_as(Proc(UInt8*, UInt8*, IFsrmAutoApplyQuota*, HRESULT)).call(quotatemplatename, path, quota)
  end
  def get_quota(path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_quota.unsafe_as(Proc(UInt8*, IFsrmQuota*, HRESULT)).call(path, quota)
  end
  def get_auto_apply_quota(path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.get_auto_apply_quota.unsafe_as(Proc(UInt8*, IFsrmAutoApplyQuota*, HRESULT)).call(path, quota)
  end
  def get_restrictive_quota(path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_restrictive_quota.unsafe_as(Proc(UInt8*, IFsrmQuota*, HRESULT)).call(path, quota)
  end
  def enum_quotas(path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_quotas.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, quotas)
  end
  def enum_auto_apply_quotas(path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_auto_apply_quotas.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, quotas)
  end
  def enum_effective_quotas(path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_effective_quotas.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, quotas)
  end
  def scan(strpath : UInt8*) : HRESULT
    @lpVtbl.value.scan.unsafe_as(Proc(UInt8*, HRESULT)).call(strpath)
  end
  def create_quota_collection(collection : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.create_quota_collection.unsafe_as(Proc(IFsrmCommittableCollection*, HRESULT)).call(collection)
  end
end
struct LibWin32::IFsrmQuotaManagerEx
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
  def get_action_variables(variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(variables)
  end
  def get_action_variable_descriptions(descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(descriptions)
  end
  def create_quota(path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.create_quota.unsafe_as(Proc(UInt8*, IFsrmQuota*, HRESULT)).call(path, quota)
  end
  def create_auto_apply_quota(quotatemplatename : UInt8*, path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.create_auto_apply_quota.unsafe_as(Proc(UInt8*, UInt8*, IFsrmAutoApplyQuota*, HRESULT)).call(quotatemplatename, path, quota)
  end
  def get_quota(path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_quota.unsafe_as(Proc(UInt8*, IFsrmQuota*, HRESULT)).call(path, quota)
  end
  def get_auto_apply_quota(path : UInt8*, quota : IFsrmAutoApplyQuota*) : HRESULT
    @lpVtbl.value.get_auto_apply_quota.unsafe_as(Proc(UInt8*, IFsrmAutoApplyQuota*, HRESULT)).call(path, quota)
  end
  def get_restrictive_quota(path : UInt8*, quota : IFsrmQuota*) : HRESULT
    @lpVtbl.value.get_restrictive_quota.unsafe_as(Proc(UInt8*, IFsrmQuota*, HRESULT)).call(path, quota)
  end
  def enum_quotas(path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_quotas.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, quotas)
  end
  def enum_auto_apply_quotas(path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_auto_apply_quotas.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, quotas)
  end
  def enum_effective_quotas(path : UInt8*, options : FsrmEnumOptions, quotas : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_effective_quotas.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, quotas)
  end
  def scan(strpath : UInt8*) : HRESULT
    @lpVtbl.value.scan.unsafe_as(Proc(UInt8*, HRESULT)).call(strpath)
  end
  def create_quota_collection(collection : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.create_quota_collection.unsafe_as(Proc(IFsrmCommittableCollection*, HRESULT)).call(collection)
  end
  def is_affected_by_quota(path : UInt8*, options : FsrmEnumOptions, affected : Int16*) : HRESULT
    @lpVtbl.value.is_affected_by_quota.unsafe_as(Proc(UInt8*, FsrmEnumOptions, Int16*, HRESULT)).call(path, options, affected)
  end
end
struct LibWin32::IFsrmQuotaTemplate
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_quota_limit(quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.unsafe_as(Proc(VARIANT*, HRESULT)).call(quotalimit)
  end
  def put_quota_limit(quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.unsafe_as(Proc(VARIANT, HRESULT)).call(quotalimit)
  end
  def get_quota_flags(quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.unsafe_as(Proc(Int32*, HRESULT)).call(quotaflags)
  end
  def put_quota_flags(quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.unsafe_as(Proc(Int32, HRESULT)).call(quotaflags)
  end
  def get_thresholds(thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(thresholds)
  end
  def add_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def delete_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def modify_threshold(threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.unsafe_as(Proc(Int32, Int32, HRESULT)).call(threshold, newthreshold)
  end
  def create_threshold_action(threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(threshold, actiontype, action)
  end
  def enum_threshold_actions(threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(threshold, actions)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def copy_template(quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.unsafe_as(Proc(UInt8*, HRESULT)).call(quotatemplatename)
  end
  def commit_and_update_derived(commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.unsafe_as(Proc(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)).call(commitoptions, applyoptions, derivedobjectsresult)
  end
end
struct LibWin32::IFsrmQuotaTemplateImported
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_quota_limit(quotalimit : VARIANT*) : HRESULT
    @lpVtbl.value.get_quota_limit.unsafe_as(Proc(VARIANT*, HRESULT)).call(quotalimit)
  end
  def put_quota_limit(quotalimit : VARIANT) : HRESULT
    @lpVtbl.value.put_quota_limit.unsafe_as(Proc(VARIANT, HRESULT)).call(quotalimit)
  end
  def get_quota_flags(quotaflags : Int32*) : HRESULT
    @lpVtbl.value.get_quota_flags.unsafe_as(Proc(Int32*, HRESULT)).call(quotaflags)
  end
  def put_quota_flags(quotaflags : Int32) : HRESULT
    @lpVtbl.value.put_quota_flags.unsafe_as(Proc(Int32, HRESULT)).call(quotaflags)
  end
  def get_thresholds(thresholds : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_thresholds.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(thresholds)
  end
  def add_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.add_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def delete_threshold(threshold : Int32) : HRESULT
    @lpVtbl.value.delete_threshold.unsafe_as(Proc(Int32, HRESULT)).call(threshold)
  end
  def modify_threshold(threshold : Int32, newthreshold : Int32) : HRESULT
    @lpVtbl.value.modify_threshold.unsafe_as(Proc(Int32, Int32, HRESULT)).call(threshold, newthreshold)
  end
  def create_threshold_action(threshold : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_threshold_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(threshold, actiontype, action)
  end
  def enum_threshold_actions(threshold : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_threshold_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(threshold, actions)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def copy_template(quotatemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.unsafe_as(Proc(UInt8*, HRESULT)).call(quotatemplatename)
  end
  def commit_and_update_derived(commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.unsafe_as(Proc(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)).call(commitoptions, applyoptions, derivedobjectsresult)
  end
  def get_overwrite_on_commit(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_overwrite_on_commit.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_overwrite_on_commit(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_overwrite_on_commit.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
end
struct LibWin32::IFsrmQuotaTemplateManager
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
  def create_template(quotatemplate : IFsrmQuotaTemplate*) : HRESULT
    @lpVtbl.value.create_template.unsafe_as(Proc(IFsrmQuotaTemplate*, HRESULT)).call(quotatemplate)
  end
  def get_template(name : UInt8*, quotatemplate : IFsrmQuotaTemplate*) : HRESULT
    @lpVtbl.value.get_template.unsafe_as(Proc(UInt8*, IFsrmQuotaTemplate*, HRESULT)).call(name, quotatemplate)
  end
  def enum_templates(options : FsrmEnumOptions, quotatemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_templates.unsafe_as(Proc(FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(options, quotatemplates)
  end
  def export_templates(quotatemplatenamesarray : VARIANT*, serializedquotatemplates : UInt8**) : HRESULT
    @lpVtbl.value.export_templates.unsafe_as(Proc(VARIANT*, UInt8**, HRESULT)).call(quotatemplatenamesarray, serializedquotatemplates)
  end
  def import_templates(serializedquotatemplates : UInt8*, quotatemplatenamesarray : VARIANT*, quotatemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_templates.unsafe_as(Proc(UInt8*, VARIANT*, IFsrmCommittableCollection*, HRESULT)).call(serializedquotatemplates, quotatemplatenamesarray, quotatemplates)
  end
end
struct LibWin32::IFsrmFileGroup
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_members(members : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_members.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(members)
  end
  def put_members(members : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_members.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(members)
  end
  def get_non_members(nonmembers : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_non_members.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(nonmembers)
  end
  def put_non_members(nonmembers : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_non_members.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(nonmembers)
  end
end
struct LibWin32::IFsrmFileGroupImported
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_members(members : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_members.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(members)
  end
  def put_members(members : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_members.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(members)
  end
  def get_non_members(nonmembers : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_non_members.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(nonmembers)
  end
  def put_non_members(nonmembers : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_non_members.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(nonmembers)
  end
  def get_overwrite_on_commit(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_overwrite_on_commit.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_overwrite_on_commit(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_overwrite_on_commit.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
end
struct LibWin32::IFsrmFileGroupManager
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
  def create_file_group(filegroup : IFsrmFileGroup*) : HRESULT
    @lpVtbl.value.create_file_group.unsafe_as(Proc(IFsrmFileGroup*, HRESULT)).call(filegroup)
  end
  def get_file_group(name : UInt8*, filegroup : IFsrmFileGroup*) : HRESULT
    @lpVtbl.value.get_file_group.unsafe_as(Proc(UInt8*, IFsrmFileGroup*, HRESULT)).call(name, filegroup)
  end
  def enum_file_groups(options : FsrmEnumOptions, filegroups : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_file_groups.unsafe_as(Proc(FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(options, filegroups)
  end
  def export_file_groups(filegroupnamesarray : VARIANT*, serializedfilegroups : UInt8**) : HRESULT
    @lpVtbl.value.export_file_groups.unsafe_as(Proc(VARIANT*, UInt8**, HRESULT)).call(filegroupnamesarray, serializedfilegroups)
  end
  def import_file_groups(serializedfilegroups : UInt8*, filegroupnamesarray : VARIANT*, filegroups : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_file_groups.unsafe_as(Proc(UInt8*, VARIANT*, IFsrmCommittableCollection*, HRESULT)).call(serializedfilegroups, filegroupnamesarray, filegroups)
  end
end
struct LibWin32::IFsrmFileScreenBase
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_blocked_file_groups(blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(blocklist)
  end
  def put_blocked_file_groups(blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(blocklist)
  end
  def get_file_screen_flags(filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.unsafe_as(Proc(Int32*, HRESULT)).call(filescreenflags)
  end
  def put_file_screen_flags(filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.unsafe_as(Proc(Int32, HRESULT)).call(filescreenflags)
  end
  def create_action(actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.unsafe_as(Proc(FsrmActionType, IFsrmAction*, HRESULT)).call(actiontype, action)
  end
  def enum_actions(actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(actions)
  end
end
struct LibWin32::IFsrmFileScreen
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_blocked_file_groups(blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(blocklist)
  end
  def put_blocked_file_groups(blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(blocklist)
  end
  def get_file_screen_flags(filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.unsafe_as(Proc(Int32*, HRESULT)).call(filescreenflags)
  end
  def put_file_screen_flags(filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.unsafe_as(Proc(Int32, HRESULT)).call(filescreenflags)
  end
  def create_action(actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.unsafe_as(Proc(FsrmActionType, IFsrmAction*, HRESULT)).call(actiontype, action)
  end
  def enum_actions(actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(actions)
  end
  def get_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_source_template_name(filescreentemplatename : UInt8**) : HRESULT
    @lpVtbl.value.get_source_template_name.unsafe_as(Proc(UInt8**, HRESULT)).call(filescreentemplatename)
  end
  def get_matches_source_template(matches : Int16*) : HRESULT
    @lpVtbl.value.get_matches_source_template.unsafe_as(Proc(Int16*, HRESULT)).call(matches)
  end
  def get_user_sid(usersid : UInt8**) : HRESULT
    @lpVtbl.value.get_user_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(usersid)
  end
  def get_user_account(useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(useraccount)
  end
  def apply_template(filescreentemplatename : UInt8*) : HRESULT
    @lpVtbl.value.apply_template.unsafe_as(Proc(UInt8*, HRESULT)).call(filescreentemplatename)
  end
end
struct LibWin32::IFsrmFileScreenException
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_allowed_file_groups(allowlist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_allowed_file_groups.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(allowlist)
  end
  def put_allowed_file_groups(allowlist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_allowed_file_groups.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(allowlist)
  end
end
struct LibWin32::IFsrmFileScreenManager
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
  def get_action_variables(variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(variables)
  end
  def get_action_variable_descriptions(descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(descriptions)
  end
  def create_file_screen(path : UInt8*, filescreen : IFsrmFileScreen*) : HRESULT
    @lpVtbl.value.create_file_screen.unsafe_as(Proc(UInt8*, IFsrmFileScreen*, HRESULT)).call(path, filescreen)
  end
  def get_file_screen(path : UInt8*, filescreen : IFsrmFileScreen*) : HRESULT
    @lpVtbl.value.get_file_screen.unsafe_as(Proc(UInt8*, IFsrmFileScreen*, HRESULT)).call(path, filescreen)
  end
  def enum_file_screens(path : UInt8*, options : FsrmEnumOptions, filescreens : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_file_screens.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, filescreens)
  end
  def create_file_screen_exception(path : UInt8*, filescreenexception : IFsrmFileScreenException*) : HRESULT
    @lpVtbl.value.create_file_screen_exception.unsafe_as(Proc(UInt8*, IFsrmFileScreenException*, HRESULT)).call(path, filescreenexception)
  end
  def get_file_screen_exception(path : UInt8*, filescreenexception : IFsrmFileScreenException*) : HRESULT
    @lpVtbl.value.get_file_screen_exception.unsafe_as(Proc(UInt8*, IFsrmFileScreenException*, HRESULT)).call(path, filescreenexception)
  end
  def enum_file_screen_exceptions(path : UInt8*, options : FsrmEnumOptions, filescreenexceptions : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_file_screen_exceptions.unsafe_as(Proc(UInt8*, FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(path, options, filescreenexceptions)
  end
  def create_file_screen_collection(collection : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.create_file_screen_collection.unsafe_as(Proc(IFsrmCommittableCollection*, HRESULT)).call(collection)
  end
end
struct LibWin32::IFsrmFileScreenTemplate
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_blocked_file_groups(blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(blocklist)
  end
  def put_blocked_file_groups(blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(blocklist)
  end
  def get_file_screen_flags(filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.unsafe_as(Proc(Int32*, HRESULT)).call(filescreenflags)
  end
  def put_file_screen_flags(filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.unsafe_as(Proc(Int32, HRESULT)).call(filescreenflags)
  end
  def create_action(actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.unsafe_as(Proc(FsrmActionType, IFsrmAction*, HRESULT)).call(actiontype, action)
  end
  def enum_actions(actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(actions)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def copy_template(filescreentemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.unsafe_as(Proc(UInt8*, HRESULT)).call(filescreentemplatename)
  end
  def commit_and_update_derived(commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.unsafe_as(Proc(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)).call(commitoptions, applyoptions, derivedobjectsresult)
  end
end
struct LibWin32::IFsrmFileScreenTemplateImported
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_blocked_file_groups(blocklist : IFsrmMutableCollection*) : HRESULT
    @lpVtbl.value.get_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection*, HRESULT)).call(blocklist)
  end
  def put_blocked_file_groups(blocklist : IFsrmMutableCollection) : HRESULT
    @lpVtbl.value.put_blocked_file_groups.unsafe_as(Proc(IFsrmMutableCollection, HRESULT)).call(blocklist)
  end
  def get_file_screen_flags(filescreenflags : Int32*) : HRESULT
    @lpVtbl.value.get_file_screen_flags.unsafe_as(Proc(Int32*, HRESULT)).call(filescreenflags)
  end
  def put_file_screen_flags(filescreenflags : Int32) : HRESULT
    @lpVtbl.value.put_file_screen_flags.unsafe_as(Proc(Int32, HRESULT)).call(filescreenflags)
  end
  def create_action(actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_action.unsafe_as(Proc(FsrmActionType, IFsrmAction*, HRESULT)).call(actiontype, action)
  end
  def enum_actions(actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_actions.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(actions)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def copy_template(filescreentemplatename : UInt8*) : HRESULT
    @lpVtbl.value.copy_template.unsafe_as(Proc(UInt8*, HRESULT)).call(filescreentemplatename)
  end
  def commit_and_update_derived(commitoptions : FsrmCommitOptions, applyoptions : FsrmTemplateApplyOptions, derivedobjectsresult : IFsrmDerivedObjectsResult*) : HRESULT
    @lpVtbl.value.commit_and_update_derived.unsafe_as(Proc(FsrmCommitOptions, FsrmTemplateApplyOptions, IFsrmDerivedObjectsResult*, HRESULT)).call(commitoptions, applyoptions, derivedobjectsresult)
  end
  def get_overwrite_on_commit(overwrite : Int16*) : HRESULT
    @lpVtbl.value.get_overwrite_on_commit.unsafe_as(Proc(Int16*, HRESULT)).call(overwrite)
  end
  def put_overwrite_on_commit(overwrite : Int16) : HRESULT
    @lpVtbl.value.put_overwrite_on_commit.unsafe_as(Proc(Int16, HRESULT)).call(overwrite)
  end
end
struct LibWin32::IFsrmFileScreenTemplateManager
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
  def create_template(filescreentemplate : IFsrmFileScreenTemplate*) : HRESULT
    @lpVtbl.value.create_template.unsafe_as(Proc(IFsrmFileScreenTemplate*, HRESULT)).call(filescreentemplate)
  end
  def get_template(name : UInt8*, filescreentemplate : IFsrmFileScreenTemplate*) : HRESULT
    @lpVtbl.value.get_template.unsafe_as(Proc(UInt8*, IFsrmFileScreenTemplate*, HRESULT)).call(name, filescreentemplate)
  end
  def enum_templates(options : FsrmEnumOptions, filescreentemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.enum_templates.unsafe_as(Proc(FsrmEnumOptions, IFsrmCommittableCollection*, HRESULT)).call(options, filescreentemplates)
  end
  def export_templates(filescreentemplatenamesarray : VARIANT*, serializedfilescreentemplates : UInt8**) : HRESULT
    @lpVtbl.value.export_templates.unsafe_as(Proc(VARIANT*, UInt8**, HRESULT)).call(filescreentemplatenamesarray, serializedfilescreentemplates)
  end
  def import_templates(serializedfilescreentemplates : UInt8*, filescreentemplatenamesarray : VARIANT*, filescreentemplates : IFsrmCommittableCollection*) : HRESULT
    @lpVtbl.value.import_templates.unsafe_as(Proc(UInt8*, VARIANT*, IFsrmCommittableCollection*, HRESULT)).call(serializedfilescreentemplates, filescreentemplatenamesarray, filescreentemplates)
  end
end
struct LibWin32::IFsrmReportManager
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
  def enum_report_jobs(options : FsrmEnumOptions, reportjobs : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_report_jobs.unsafe_as(Proc(FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(options, reportjobs)
  end
  def create_report_job(reportjob : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.create_report_job.unsafe_as(Proc(IFsrmReportJob*, HRESULT)).call(reportjob)
  end
  def get_report_job(taskname : UInt8*, reportjob : IFsrmReportJob*) : HRESULT
    @lpVtbl.value.get_report_job.unsafe_as(Proc(UInt8*, IFsrmReportJob*, HRESULT)).call(taskname, reportjob)
  end
  def get_output_directory(context : FsrmReportGenerationContext, path : UInt8**) : HRESULT
    @lpVtbl.value.get_output_directory.unsafe_as(Proc(FsrmReportGenerationContext, UInt8**, HRESULT)).call(context, path)
  end
  def set_output_directory(context : FsrmReportGenerationContext, path : UInt8*) : HRESULT
    @lpVtbl.value.set_output_directory.unsafe_as(Proc(FsrmReportGenerationContext, UInt8*, HRESULT)).call(context, path)
  end
  def is_filter_valid_for_report_type(reporttype : FsrmReportType, filter : FsrmReportFilter, valid : Int16*) : HRESULT
    @lpVtbl.value.is_filter_valid_for_report_type.unsafe_as(Proc(FsrmReportType, FsrmReportFilter, Int16*, HRESULT)).call(reporttype, filter, valid)
  end
  def get_default_filter(reporttype : FsrmReportType, filter : FsrmReportFilter, filtervalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_default_filter.unsafe_as(Proc(FsrmReportType, FsrmReportFilter, VARIANT*, HRESULT)).call(reporttype, filter, filtervalue)
  end
  def set_default_filter(reporttype : FsrmReportType, filter : FsrmReportFilter, filtervalue : VARIANT) : HRESULT
    @lpVtbl.value.set_default_filter.unsafe_as(Proc(FsrmReportType, FsrmReportFilter, VARIANT, HRESULT)).call(reporttype, filter, filtervalue)
  end
  def get_report_size_limit(limit : FsrmReportLimit, limitvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_report_size_limit.unsafe_as(Proc(FsrmReportLimit, VARIANT*, HRESULT)).call(limit, limitvalue)
  end
  def set_report_size_limit(limit : FsrmReportLimit, limitvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_report_size_limit.unsafe_as(Proc(FsrmReportLimit, VARIANT, HRESULT)).call(limit, limitvalue)
  end
end
struct LibWin32::IFsrmReportJob
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_task(taskname : UInt8**) : HRESULT
    @lpVtbl.value.get_task.unsafe_as(Proc(UInt8**, HRESULT)).call(taskname)
  end
  def put_task(taskname : UInt8*) : HRESULT
    @lpVtbl.value.put_task.unsafe_as(Proc(UInt8*, HRESULT)).call(taskname)
  end
  def get_namespace_roots(namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(namespaceroots)
  end
  def put_namespace_roots(namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(namespaceroots)
  end
  def get_formats(formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_formats.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(formats)
  end
  def put_formats(formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_formats.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(formats)
  end
  def get_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def get_running_status(runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_running_status.unsafe_as(Proc(FsrmReportRunningStatus*, HRESULT)).call(runningstatus)
  end
  def get_last_run(lastrun : Float64*) : HRESULT
    @lpVtbl.value.get_last_run.unsafe_as(Proc(Float64*, HRESULT)).call(lastrun)
  end
  def get_last_error(lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(UInt8**, HRESULT)).call(lasterror)
  end
  def get_last_generated_in_directory(path : UInt8**) : HRESULT
    @lpVtbl.value.get_last_generated_in_directory.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def enum_reports(reports : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_reports.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(reports)
  end
  def create_report(reporttype : FsrmReportType, report : IFsrmReport*) : HRESULT
    @lpVtbl.value.create_report.unsafe_as(Proc(FsrmReportType, IFsrmReport*, HRESULT)).call(reporttype, report)
  end
  def run(context : FsrmReportGenerationContext) : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(FsrmReportGenerationContext, HRESULT)).call(context)
  end
  def wait_for_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmReport
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
  def get_type(reporttype : FsrmReportType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(FsrmReportType*, HRESULT)).call(reporttype)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def get_last_generated_file_name_prefix(prefix : UInt8**) : HRESULT
    @lpVtbl.value.get_last_generated_file_name_prefix.unsafe_as(Proc(UInt8**, HRESULT)).call(prefix)
  end
  def get_filter(filter : FsrmReportFilter, filtervalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_filter.unsafe_as(Proc(FsrmReportFilter, VARIANT*, HRESULT)).call(filter, filtervalue)
  end
  def set_filter(filter : FsrmReportFilter, filtervalue : VARIANT) : HRESULT
    @lpVtbl.value.set_filter.unsafe_as(Proc(FsrmReportFilter, VARIANT, HRESULT)).call(filter, filtervalue)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmReportScheduler
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
  def verify_namespaces(namespacessafearray : VARIANT*) : HRESULT
    @lpVtbl.value.verify_namespaces.unsafe_as(Proc(VARIANT*, HRESULT)).call(namespacessafearray)
  end
  def create_schedule_task(taskname : UInt8*, namespacessafearray : VARIANT*, serializedtask : UInt8*) : HRESULT
    @lpVtbl.value.create_schedule_task.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(taskname, namespacessafearray, serializedtask)
  end
  def modify_schedule_task(taskname : UInt8*, namespacessafearray : VARIANT*, serializedtask : UInt8*) : HRESULT
    @lpVtbl.value.modify_schedule_task.unsafe_as(Proc(UInt8*, VARIANT*, UInt8*, HRESULT)).call(taskname, namespacessafearray, serializedtask)
  end
  def delete_schedule_task(taskname : UInt8*) : HRESULT
    @lpVtbl.value.delete_schedule_task.unsafe_as(Proc(UInt8*, HRESULT)).call(taskname)
  end
end
struct LibWin32::IFsrmFileManagementJobManager
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
  def get_action_variables(variables : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variables.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(variables)
  end
  def get_action_variable_descriptions(descriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_action_variable_descriptions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(descriptions)
  end
  def enum_file_management_jobs(options : FsrmEnumOptions, filemanagementjobs : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_file_management_jobs.unsafe_as(Proc(FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(options, filemanagementjobs)
  end
  def create_file_management_job(filemanagementjob : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.create_file_management_job.unsafe_as(Proc(IFsrmFileManagementJob*, HRESULT)).call(filemanagementjob)
  end
  def get_file_management_job(name : UInt8*, filemanagementjob : IFsrmFileManagementJob*) : HRESULT
    @lpVtbl.value.get_file_management_job.unsafe_as(Proc(UInt8*, IFsrmFileManagementJob*, HRESULT)).call(name, filemanagementjob)
  end
end
struct LibWin32::IFsrmFileManagementJob
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_namespace_roots(namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(namespaceroots)
  end
  def put_namespace_roots(namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(namespaceroots)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_operation_type(operationtype : FsrmFileManagementType*) : HRESULT
    @lpVtbl.value.get_operation_type.unsafe_as(Proc(FsrmFileManagementType*, HRESULT)).call(operationtype)
  end
  def put_operation_type(operationtype : FsrmFileManagementType) : HRESULT
    @lpVtbl.value.put_operation_type.unsafe_as(Proc(FsrmFileManagementType, HRESULT)).call(operationtype)
  end
  def get_expiration_directory(expirationdirectory : UInt8**) : HRESULT
    @lpVtbl.value.get_expiration_directory.unsafe_as(Proc(UInt8**, HRESULT)).call(expirationdirectory)
  end
  def put_expiration_directory(expirationdirectory : UInt8*) : HRESULT
    @lpVtbl.value.put_expiration_directory.unsafe_as(Proc(UInt8*, HRESULT)).call(expirationdirectory)
  end
  def get_custom_action(action : IFsrmActionCommand*) : HRESULT
    @lpVtbl.value.get_custom_action.unsafe_as(Proc(IFsrmActionCommand*, HRESULT)).call(action)
  end
  def get_notifications(notifications : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_notifications.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(notifications)
  end
  def get_logging(loggingflags : Int32*) : HRESULT
    @lpVtbl.value.get_logging.unsafe_as(Proc(Int32*, HRESULT)).call(loggingflags)
  end
  def put_logging(loggingflags : Int32) : HRESULT
    @lpVtbl.value.put_logging.unsafe_as(Proc(Int32, HRESULT)).call(loggingflags)
  end
  def get_report_enabled(reportenabled : Int16*) : HRESULT
    @lpVtbl.value.get_report_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(reportenabled)
  end
  def put_report_enabled(reportenabled : Int16) : HRESULT
    @lpVtbl.value.put_report_enabled.unsafe_as(Proc(Int16, HRESULT)).call(reportenabled)
  end
  def get_formats(formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_formats.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(formats)
  end
  def put_formats(formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_formats.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(formats)
  end
  def get_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def get_days_since_file_created(dayssincecreation : Int32*) : HRESULT
    @lpVtbl.value.get_days_since_file_created.unsafe_as(Proc(Int32*, HRESULT)).call(dayssincecreation)
  end
  def put_days_since_file_created(dayssincecreation : Int32) : HRESULT
    @lpVtbl.value.put_days_since_file_created.unsafe_as(Proc(Int32, HRESULT)).call(dayssincecreation)
  end
  def get_days_since_file_last_accessed(dayssinceaccess : Int32*) : HRESULT
    @lpVtbl.value.get_days_since_file_last_accessed.unsafe_as(Proc(Int32*, HRESULT)).call(dayssinceaccess)
  end
  def put_days_since_file_last_accessed(dayssinceaccess : Int32) : HRESULT
    @lpVtbl.value.put_days_since_file_last_accessed.unsafe_as(Proc(Int32, HRESULT)).call(dayssinceaccess)
  end
  def get_days_since_file_last_modified(dayssincemodify : Int32*) : HRESULT
    @lpVtbl.value.get_days_since_file_last_modified.unsafe_as(Proc(Int32*, HRESULT)).call(dayssincemodify)
  end
  def put_days_since_file_last_modified(dayssincemodify : Int32) : HRESULT
    @lpVtbl.value.put_days_since_file_last_modified.unsafe_as(Proc(Int32, HRESULT)).call(dayssincemodify)
  end
  def get_property_conditions(propertyconditions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_property_conditions.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(propertyconditions)
  end
  def get_from_date(fromdate : Float64*) : HRESULT
    @lpVtbl.value.get_from_date.unsafe_as(Proc(Float64*, HRESULT)).call(fromdate)
  end
  def put_from_date(fromdate : Float64) : HRESULT
    @lpVtbl.value.put_from_date.unsafe_as(Proc(Float64, HRESULT)).call(fromdate)
  end
  def get_task(taskname : UInt8**) : HRESULT
    @lpVtbl.value.get_task.unsafe_as(Proc(UInt8**, HRESULT)).call(taskname)
  end
  def put_task(taskname : UInt8*) : HRESULT
    @lpVtbl.value.put_task.unsafe_as(Proc(UInt8*, HRESULT)).call(taskname)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
  def get_running_status(runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_running_status.unsafe_as(Proc(FsrmReportRunningStatus*, HRESULT)).call(runningstatus)
  end
  def get_last_error(lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_last_error.unsafe_as(Proc(UInt8**, HRESULT)).call(lasterror)
  end
  def get_last_report_path_without_extension(path : UInt8**) : HRESULT
    @lpVtbl.value.get_last_report_path_without_extension.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_last_run(lastrun : Float64*) : HRESULT
    @lpVtbl.value.get_last_run.unsafe_as(Proc(Float64*, HRESULT)).call(lastrun)
  end
  def get_file_name_pattern(filenamepattern : UInt8**) : HRESULT
    @lpVtbl.value.get_file_name_pattern.unsafe_as(Proc(UInt8**, HRESULT)).call(filenamepattern)
  end
  def put_file_name_pattern(filenamepattern : UInt8*) : HRESULT
    @lpVtbl.value.put_file_name_pattern.unsafe_as(Proc(UInt8*, HRESULT)).call(filenamepattern)
  end
  def run(context : FsrmReportGenerationContext) : HRESULT
    @lpVtbl.value.run.unsafe_as(Proc(FsrmReportGenerationContext, HRESULT)).call(context)
  end
  def wait_for_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
  def add_notification(days : Int32) : HRESULT
    @lpVtbl.value.add_notification.unsafe_as(Proc(Int32, HRESULT)).call(days)
  end
  def delete_notification(days : Int32) : HRESULT
    @lpVtbl.value.delete_notification.unsafe_as(Proc(Int32, HRESULT)).call(days)
  end
  def modify_notification(days : Int32, newdays : Int32) : HRESULT
    @lpVtbl.value.modify_notification.unsafe_as(Proc(Int32, Int32, HRESULT)).call(days, newdays)
  end
  def create_notification_action(days : Int32, actiontype : FsrmActionType, action : IFsrmAction*) : HRESULT
    @lpVtbl.value.create_notification_action.unsafe_as(Proc(Int32, FsrmActionType, IFsrmAction*, HRESULT)).call(days, actiontype, action)
  end
  def enum_notification_actions(days : Int32, actions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_notification_actions.unsafe_as(Proc(Int32, IFsrmCollection*, HRESULT)).call(days, actions)
  end
  def create_property_condition(name : UInt8*, propertycondition : IFsrmPropertyCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(UInt8*, IFsrmPropertyCondition*, HRESULT)).call(name, propertycondition)
  end
  def create_custom_action(customaction : IFsrmActionCommand*) : HRESULT
    @lpVtbl.value.create_custom_action.unsafe_as(Proc(IFsrmActionCommand*, HRESULT)).call(customaction)
  end
end
struct LibWin32::IFsrmPropertyCondition
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
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_type(type : FsrmPropertyConditionType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(FsrmPropertyConditionType*, HRESULT)).call(type)
  end
  def put_type(type : FsrmPropertyConditionType) : HRESULT
    @lpVtbl.value.put_type.unsafe_as(Proc(FsrmPropertyConditionType, HRESULT)).call(type)
  end
  def get_value(value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(value)
  end
  def put_value(value : UInt8*) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmFileCondition
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
  def get_type(pval : FsrmFileConditionType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(FsrmFileConditionType*, HRESULT)).call(pval)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmFileConditionProperty
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
  def get_type(pval : FsrmFileConditionType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(FsrmFileConditionType*, HRESULT)).call(pval)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def get_property_name(pval : UInt8**) : HRESULT
    @lpVtbl.value.get_property_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pval)
  end
  def put_property_name(newval : UInt8*) : HRESULT
    @lpVtbl.value.put_property_name.unsafe_as(Proc(UInt8*, HRESULT)).call(newval)
  end
  def get_property_id(pval : FsrmFileSystemPropertyId*) : HRESULT
    @lpVtbl.value.get_property_id.unsafe_as(Proc(FsrmFileSystemPropertyId*, HRESULT)).call(pval)
  end
  def put_property_id(newval : FsrmFileSystemPropertyId) : HRESULT
    @lpVtbl.value.put_property_id.unsafe_as(Proc(FsrmFileSystemPropertyId, HRESULT)).call(newval)
  end
  def get_operator(pval : FsrmPropertyConditionType*) : HRESULT
    @lpVtbl.value.get_operator.unsafe_as(Proc(FsrmPropertyConditionType*, HRESULT)).call(pval)
  end
  def put_operator(newval : FsrmPropertyConditionType) : HRESULT
    @lpVtbl.value.put_operator.unsafe_as(Proc(FsrmPropertyConditionType, HRESULT)).call(newval)
  end
  def get_value_type(pval : FsrmPropertyValueType*) : HRESULT
    @lpVtbl.value.get_value_type.unsafe_as(Proc(FsrmPropertyValueType*, HRESULT)).call(pval)
  end
  def put_value_type(newval : FsrmPropertyValueType) : HRESULT
    @lpVtbl.value.put_value_type.unsafe_as(Proc(FsrmPropertyValueType, HRESULT)).call(newval)
  end
  def get_value(pval : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(pval)
  end
  def put_value(newval : VARIANT) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(VARIANT, HRESULT)).call(newval)
  end
end
struct LibWin32::IFsrmPropertyDefinition
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_type(type : FsrmPropertyDefinitionType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(FsrmPropertyDefinitionType*, HRESULT)).call(type)
  end
  def put_type(type : FsrmPropertyDefinitionType) : HRESULT
    @lpVtbl.value.put_type.unsafe_as(Proc(FsrmPropertyDefinitionType, HRESULT)).call(type)
  end
  def get_possible_values(possiblevalues : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_possible_values.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(possiblevalues)
  end
  def put_possible_values(possiblevalues : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_possible_values.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(possiblevalues)
  end
  def get_value_descriptions(valuedescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_value_descriptions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(valuedescriptions)
  end
  def put_value_descriptions(valuedescriptions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_value_descriptions.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(valuedescriptions)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
end
struct LibWin32::IFsrmPropertyDefinition2
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_type(type : FsrmPropertyDefinitionType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(FsrmPropertyDefinitionType*, HRESULT)).call(type)
  end
  def put_type(type : FsrmPropertyDefinitionType) : HRESULT
    @lpVtbl.value.put_type.unsafe_as(Proc(FsrmPropertyDefinitionType, HRESULT)).call(type)
  end
  def get_possible_values(possiblevalues : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_possible_values.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(possiblevalues)
  end
  def put_possible_values(possiblevalues : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_possible_values.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(possiblevalues)
  end
  def get_value_descriptions(valuedescriptions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_value_descriptions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(valuedescriptions)
  end
  def put_value_descriptions(valuedescriptions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_value_descriptions.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(valuedescriptions)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
  def get_property_definition_flags(propertydefinitionflags : Int32*) : HRESULT
    @lpVtbl.value.get_property_definition_flags.unsafe_as(Proc(Int32*, HRESULT)).call(propertydefinitionflags)
  end
  def get_display_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_display_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_display_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_applies_to(appliesto : Int32*) : HRESULT
    @lpVtbl.value.get_applies_to.unsafe_as(Proc(Int32*, HRESULT)).call(appliesto)
  end
  def get_value_definitions(valuedefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_value_definitions.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(valuedefinitions)
  end
end
struct LibWin32::IFsrmPropertyDefinitionValue
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
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_display_name(displayname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(displayname)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def get_unique_id(uniqueid : UInt8**) : HRESULT
    @lpVtbl.value.get_unique_id.unsafe_as(Proc(UInt8**, HRESULT)).call(uniqueid)
  end
end
struct LibWin32::IFsrmProperty
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
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_value(value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(value)
  end
  def get_sources(sources : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_sources.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(sources)
  end
  def get_property_flags(flags : Int32*) : HRESULT
    @lpVtbl.value.get_property_flags.unsafe_as(Proc(Int32*, HRESULT)).call(flags)
  end
end
struct LibWin32::IFsrmRule
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_rule_type(ruletype : FsrmRuleType*) : HRESULT
    @lpVtbl.value.get_rule_type.unsafe_as(Proc(FsrmRuleType*, HRESULT)).call(ruletype)
  end
  def get_module_definition_name(moduledefinitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_module_definition_name.unsafe_as(Proc(UInt8**, HRESULT)).call(moduledefinitionname)
  end
  def put_module_definition_name(moduledefinitionname : UInt8*) : HRESULT
    @lpVtbl.value.put_module_definition_name.unsafe_as(Proc(UInt8*, HRESULT)).call(moduledefinitionname)
  end
  def get_namespace_roots(namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(namespaceroots)
  end
  def put_namespace_roots(namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(namespaceroots)
  end
  def get_rule_flags(ruleflags : Int32*) : HRESULT
    @lpVtbl.value.get_rule_flags.unsafe_as(Proc(Int32*, HRESULT)).call(ruleflags)
  end
  def put_rule_flags(ruleflags : Int32) : HRESULT
    @lpVtbl.value.put_rule_flags.unsafe_as(Proc(Int32, HRESULT)).call(ruleflags)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
  def get_last_modified(lastmodified : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modified.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastmodified)
  end
end
struct LibWin32::IFsrmClassificationRule
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_rule_type(ruletype : FsrmRuleType*) : HRESULT
    @lpVtbl.value.get_rule_type.unsafe_as(Proc(FsrmRuleType*, HRESULT)).call(ruletype)
  end
  def get_module_definition_name(moduledefinitionname : UInt8**) : HRESULT
    @lpVtbl.value.get_module_definition_name.unsafe_as(Proc(UInt8**, HRESULT)).call(moduledefinitionname)
  end
  def put_module_definition_name(moduledefinitionname : UInt8*) : HRESULT
    @lpVtbl.value.put_module_definition_name.unsafe_as(Proc(UInt8*, HRESULT)).call(moduledefinitionname)
  end
  def get_namespace_roots(namespaceroots : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_namespace_roots.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(namespaceroots)
  end
  def put_namespace_roots(namespaceroots : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_namespace_roots.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(namespaceroots)
  end
  def get_rule_flags(ruleflags : Int32*) : HRESULT
    @lpVtbl.value.get_rule_flags.unsafe_as(Proc(Int32*, HRESULT)).call(ruleflags)
  end
  def put_rule_flags(ruleflags : Int32) : HRESULT
    @lpVtbl.value.put_rule_flags.unsafe_as(Proc(Int32, HRESULT)).call(ruleflags)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
  def get_last_modified(lastmodified : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modified.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastmodified)
  end
  def get_execution_option(executionoption : FsrmExecutionOption*) : HRESULT
    @lpVtbl.value.get_execution_option.unsafe_as(Proc(FsrmExecutionOption*, HRESULT)).call(executionoption)
  end
  def put_execution_option(executionoption : FsrmExecutionOption) : HRESULT
    @lpVtbl.value.put_execution_option.unsafe_as(Proc(FsrmExecutionOption, HRESULT)).call(executionoption)
  end
  def get_property_affected(property : UInt8**) : HRESULT
    @lpVtbl.value.get_property_affected.unsafe_as(Proc(UInt8**, HRESULT)).call(property)
  end
  def put_property_affected(property : UInt8*) : HRESULT
    @lpVtbl.value.put_property_affected.unsafe_as(Proc(UInt8*, HRESULT)).call(property)
  end
  def get_value(value : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(value)
  end
  def put_value(value : UInt8*) : HRESULT
    @lpVtbl.value.put_value.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
end
struct LibWin32::IFsrmPipelineModuleDefinition
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_module_clsid(moduleclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_module_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(moduleclsid)
  end
  def put_module_clsid(moduleclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_module_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(moduleclsid)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_company(company : UInt8**) : HRESULT
    @lpVtbl.value.get_company.unsafe_as(Proc(UInt8**, HRESULT)).call(company)
  end
  def put_company(company : UInt8*) : HRESULT
    @lpVtbl.value.put_company.unsafe_as(Proc(UInt8*, HRESULT)).call(company)
  end
  def get_version(version : UInt8**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt8**, HRESULT)).call(version)
  end
  def put_version(version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.unsafe_as(Proc(UInt8*, HRESULT)).call(version)
  end
  def get_module_type(moduletype : FsrmPipelineModuleType*) : HRESULT
    @lpVtbl.value.get_module_type.unsafe_as(Proc(FsrmPipelineModuleType*, HRESULT)).call(moduletype)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_needs_file_content(needsfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_needs_file_content.unsafe_as(Proc(Int16*, HRESULT)).call(needsfilecontent)
  end
  def put_needs_file_content(needsfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_needs_file_content.unsafe_as(Proc(Int16, HRESULT)).call(needsfilecontent)
  end
  def get_account(retrievalaccount : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.unsafe_as(Proc(FsrmAccountType*, HRESULT)).call(retrievalaccount)
  end
  def put_account(retrievalaccount : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.unsafe_as(Proc(FsrmAccountType, HRESULT)).call(retrievalaccount)
  end
  def get_supported_extensions(supportedextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_extensions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(supportedextensions)
  end
  def put_supported_extensions(supportedextensions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_supported_extensions.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(supportedextensions)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
end
struct LibWin32::IFsrmClassifierModuleDefinition
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_module_clsid(moduleclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_module_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(moduleclsid)
  end
  def put_module_clsid(moduleclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_module_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(moduleclsid)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_company(company : UInt8**) : HRESULT
    @lpVtbl.value.get_company.unsafe_as(Proc(UInt8**, HRESULT)).call(company)
  end
  def put_company(company : UInt8*) : HRESULT
    @lpVtbl.value.put_company.unsafe_as(Proc(UInt8*, HRESULT)).call(company)
  end
  def get_version(version : UInt8**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt8**, HRESULT)).call(version)
  end
  def put_version(version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.unsafe_as(Proc(UInt8*, HRESULT)).call(version)
  end
  def get_module_type(moduletype : FsrmPipelineModuleType*) : HRESULT
    @lpVtbl.value.get_module_type.unsafe_as(Proc(FsrmPipelineModuleType*, HRESULT)).call(moduletype)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_needs_file_content(needsfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_needs_file_content.unsafe_as(Proc(Int16*, HRESULT)).call(needsfilecontent)
  end
  def put_needs_file_content(needsfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_needs_file_content.unsafe_as(Proc(Int16, HRESULT)).call(needsfilecontent)
  end
  def get_account(retrievalaccount : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.unsafe_as(Proc(FsrmAccountType*, HRESULT)).call(retrievalaccount)
  end
  def put_account(retrievalaccount : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.unsafe_as(Proc(FsrmAccountType, HRESULT)).call(retrievalaccount)
  end
  def get_supported_extensions(supportedextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_extensions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(supportedextensions)
  end
  def put_supported_extensions(supportedextensions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_supported_extensions.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(supportedextensions)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
  def get_properties_affected(propertiesaffected : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_properties_affected.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(propertiesaffected)
  end
  def put_properties_affected(propertiesaffected : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_properties_affected.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(propertiesaffected)
  end
  def get_properties_used(propertiesused : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_properties_used.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(propertiesused)
  end
  def put_properties_used(propertiesused : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_properties_used.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(propertiesused)
  end
  def get_needs_explicit_value(needsexplicitvalue : Int16*) : HRESULT
    @lpVtbl.value.get_needs_explicit_value.unsafe_as(Proc(Int16*, HRESULT)).call(needsexplicitvalue)
  end
  def put_needs_explicit_value(needsexplicitvalue : Int16) : HRESULT
    @lpVtbl.value.put_needs_explicit_value.unsafe_as(Proc(Int16, HRESULT)).call(needsexplicitvalue)
  end
end
struct LibWin32::IFsrmStorageModuleDefinition
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
  def get_id(id : Guid*) : HRESULT
    @lpVtbl.value.get_id.unsafe_as(Proc(Guid*, HRESULT)).call(id)
  end
  def get_description(description : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(description)
  end
  def put_description(description : UInt8*) : HRESULT
    @lpVtbl.value.put_description.unsafe_as(Proc(UInt8*, HRESULT)).call(description)
  end
  def delete : HRESULT
    @lpVtbl.value.delete.unsafe_as(Proc(HRESULT)).call
  end
  def commit : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(HRESULT)).call
  end
  def get_module_clsid(moduleclsid : UInt8**) : HRESULT
    @lpVtbl.value.get_module_clsid.unsafe_as(Proc(UInt8**, HRESULT)).call(moduleclsid)
  end
  def put_module_clsid(moduleclsid : UInt8*) : HRESULT
    @lpVtbl.value.put_module_clsid.unsafe_as(Proc(UInt8*, HRESULT)).call(moduleclsid)
  end
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def put_name(name : UInt8*) : HRESULT
    @lpVtbl.value.put_name.unsafe_as(Proc(UInt8*, HRESULT)).call(name)
  end
  def get_company(company : UInt8**) : HRESULT
    @lpVtbl.value.get_company.unsafe_as(Proc(UInt8**, HRESULT)).call(company)
  end
  def put_company(company : UInt8*) : HRESULT
    @lpVtbl.value.put_company.unsafe_as(Proc(UInt8*, HRESULT)).call(company)
  end
  def get_version(version : UInt8**) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt8**, HRESULT)).call(version)
  end
  def put_version(version : UInt8*) : HRESULT
    @lpVtbl.value.put_version.unsafe_as(Proc(UInt8*, HRESULT)).call(version)
  end
  def get_module_type(moduletype : FsrmPipelineModuleType*) : HRESULT
    @lpVtbl.value.get_module_type.unsafe_as(Proc(FsrmPipelineModuleType*, HRESULT)).call(moduletype)
  end
  def get_enabled(enabled : Int16*) : HRESULT
    @lpVtbl.value.get_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(enabled)
  end
  def put_enabled(enabled : Int16) : HRESULT
    @lpVtbl.value.put_enabled.unsafe_as(Proc(Int16, HRESULT)).call(enabled)
  end
  def get_needs_file_content(needsfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_needs_file_content.unsafe_as(Proc(Int16*, HRESULT)).call(needsfilecontent)
  end
  def put_needs_file_content(needsfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_needs_file_content.unsafe_as(Proc(Int16, HRESULT)).call(needsfilecontent)
  end
  def get_account(retrievalaccount : FsrmAccountType*) : HRESULT
    @lpVtbl.value.get_account.unsafe_as(Proc(FsrmAccountType*, HRESULT)).call(retrievalaccount)
  end
  def put_account(retrievalaccount : FsrmAccountType) : HRESULT
    @lpVtbl.value.put_account.unsafe_as(Proc(FsrmAccountType, HRESULT)).call(retrievalaccount)
  end
  def get_supported_extensions(supportedextensions : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_extensions.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(supportedextensions)
  end
  def put_supported_extensions(supportedextensions : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_supported_extensions.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(supportedextensions)
  end
  def get_parameters(parameters : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_parameters.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(parameters)
  end
  def put_parameters(parameters : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_parameters.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(parameters)
  end
  def get_capabilities(capabilities : FsrmStorageModuleCaps*) : HRESULT
    @lpVtbl.value.get_capabilities.unsafe_as(Proc(FsrmStorageModuleCaps*, HRESULT)).call(capabilities)
  end
  def put_capabilities(capabilities : FsrmStorageModuleCaps) : HRESULT
    @lpVtbl.value.put_capabilities.unsafe_as(Proc(FsrmStorageModuleCaps, HRESULT)).call(capabilities)
  end
  def get_storage_type(storagetype : FsrmStorageModuleType*) : HRESULT
    @lpVtbl.value.get_storage_type.unsafe_as(Proc(FsrmStorageModuleType*, HRESULT)).call(storagetype)
  end
  def put_storage_type(storagetype : FsrmStorageModuleType) : HRESULT
    @lpVtbl.value.put_storage_type.unsafe_as(Proc(FsrmStorageModuleType, HRESULT)).call(storagetype)
  end
  def get_updates_file_content(updatesfilecontent : Int16*) : HRESULT
    @lpVtbl.value.get_updates_file_content.unsafe_as(Proc(Int16*, HRESULT)).call(updatesfilecontent)
  end
  def put_updates_file_content(updatesfilecontent : Int16) : HRESULT
    @lpVtbl.value.put_updates_file_content.unsafe_as(Proc(Int16, HRESULT)).call(updatesfilecontent)
  end
end
struct LibWin32::IFsrmClassificationManager
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
  def get_classification_report_formats(formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_classification_report_formats.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(formats)
  end
  def put_classification_report_formats(formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_classification_report_formats.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(formats)
  end
  def get_logging(logging : Int32*) : HRESULT
    @lpVtbl.value.get_logging.unsafe_as(Proc(Int32*, HRESULT)).call(logging)
  end
  def put_logging(logging : Int32) : HRESULT
    @lpVtbl.value.put_logging.unsafe_as(Proc(Int32, HRESULT)).call(logging)
  end
  def get_classification_report_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_report_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_classification_report_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_classification_report_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def get_classification_report_enabled(reportenabled : Int16*) : HRESULT
    @lpVtbl.value.get_classification_report_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(reportenabled)
  end
  def put_classification_report_enabled(reportenabled : Int16) : HRESULT
    @lpVtbl.value.put_classification_report_enabled.unsafe_as(Proc(Int16, HRESULT)).call(reportenabled)
  end
  def get_classification_last_report_path_without_extension(lastreportpath : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_report_path_without_extension.unsafe_as(Proc(UInt8**, HRESULT)).call(lastreportpath)
  end
  def get_classification_last_error(lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_error.unsafe_as(Proc(UInt8**, HRESULT)).call(lasterror)
  end
  def get_classification_running_status(runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_classification_running_status.unsafe_as(Proc(FsrmReportRunningStatus*, HRESULT)).call(runningstatus)
  end
  def enum_property_definitions(options : FsrmEnumOptions, propertydefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_property_definitions.unsafe_as(Proc(FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(options, propertydefinitions)
  end
  def create_property_definition(propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.create_property_definition.unsafe_as(Proc(IFsrmPropertyDefinition*, HRESULT)).call(propertydefinition)
  end
  def get_property_definition(propertyname : UInt8*, propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.get_property_definition.unsafe_as(Proc(UInt8*, IFsrmPropertyDefinition*, HRESULT)).call(propertyname, propertydefinition)
  end
  def enum_rules(ruletype : FsrmRuleType, options : FsrmEnumOptions, rules : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_rules.unsafe_as(Proc(FsrmRuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(ruletype, options, rules)
  end
  def create_rule(ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.create_rule.unsafe_as(Proc(FsrmRuleType, IFsrmRule*, HRESULT)).call(ruletype, rule)
  end
  def get_rule(rulename : UInt8*, ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(UInt8*, FsrmRuleType, IFsrmRule*, HRESULT)).call(rulename, ruletype, rule)
  end
  def enum_module_definitions(moduletype : FsrmPipelineModuleType, options : FsrmEnumOptions, moduledefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_module_definitions.unsafe_as(Proc(FsrmPipelineModuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(moduletype, options, moduledefinitions)
  end
  def create_module_definition(moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.create_module_definition.unsafe_as(Proc(FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)).call(moduletype, moduledefinition)
  end
  def get_module_definition(modulename : UInt8*, moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.get_module_definition.unsafe_as(Proc(UInt8*, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)).call(modulename, moduletype, moduledefinition)
  end
  def run_classification(context : FsrmReportGenerationContext, reserved : UInt8*) : HRESULT
    @lpVtbl.value.run_classification.unsafe_as(Proc(FsrmReportGenerationContext, UInt8*, HRESULT)).call(context, reserved)
  end
  def wait_for_classification_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_classification_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def cancel_classification : HRESULT
    @lpVtbl.value.cancel_classification.unsafe_as(Proc(HRESULT)).call
  end
  def enum_file_properties(filepath : UInt8*, options : FsrmGetFilePropertyOptions, fileproperties : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_file_properties.unsafe_as(Proc(UInt8*, FsrmGetFilePropertyOptions, IFsrmCollection*, HRESULT)).call(filepath, options, fileproperties)
  end
  def get_file_property(filepath : UInt8*, propertyname : UInt8*, options : FsrmGetFilePropertyOptions, property : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.unsafe_as(Proc(UInt8*, UInt8*, FsrmGetFilePropertyOptions, IFsrmProperty*, HRESULT)).call(filepath, propertyname, options, property)
  end
  def set_file_property(filepath : UInt8*, propertyname : UInt8*, propertyvalue : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(filepath, propertyname, propertyvalue)
  end
  def clear_file_property(filepath : UInt8*, property : UInt8*) : HRESULT
    @lpVtbl.value.clear_file_property.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(filepath, property)
  end
end
struct LibWin32::IFsrmClassificationManager2
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
  def get_classification_report_formats(formats : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_classification_report_formats.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(formats)
  end
  def put_classification_report_formats(formats : SAFEARRAY*) : HRESULT
    @lpVtbl.value.put_classification_report_formats.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(formats)
  end
  def get_logging(logging : Int32*) : HRESULT
    @lpVtbl.value.get_logging.unsafe_as(Proc(Int32*, HRESULT)).call(logging)
  end
  def put_logging(logging : Int32) : HRESULT
    @lpVtbl.value.put_logging.unsafe_as(Proc(Int32, HRESULT)).call(logging)
  end
  def get_classification_report_mail_to(mailto : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_report_mail_to.unsafe_as(Proc(UInt8**, HRESULT)).call(mailto)
  end
  def put_classification_report_mail_to(mailto : UInt8*) : HRESULT
    @lpVtbl.value.put_classification_report_mail_to.unsafe_as(Proc(UInt8*, HRESULT)).call(mailto)
  end
  def get_classification_report_enabled(reportenabled : Int16*) : HRESULT
    @lpVtbl.value.get_classification_report_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(reportenabled)
  end
  def put_classification_report_enabled(reportenabled : Int16) : HRESULT
    @lpVtbl.value.put_classification_report_enabled.unsafe_as(Proc(Int16, HRESULT)).call(reportenabled)
  end
  def get_classification_last_report_path_without_extension(lastreportpath : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_report_path_without_extension.unsafe_as(Proc(UInt8**, HRESULT)).call(lastreportpath)
  end
  def get_classification_last_error(lasterror : UInt8**) : HRESULT
    @lpVtbl.value.get_classification_last_error.unsafe_as(Proc(UInt8**, HRESULT)).call(lasterror)
  end
  def get_classification_running_status(runningstatus : FsrmReportRunningStatus*) : HRESULT
    @lpVtbl.value.get_classification_running_status.unsafe_as(Proc(FsrmReportRunningStatus*, HRESULT)).call(runningstatus)
  end
  def enum_property_definitions(options : FsrmEnumOptions, propertydefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_property_definitions.unsafe_as(Proc(FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(options, propertydefinitions)
  end
  def create_property_definition(propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.create_property_definition.unsafe_as(Proc(IFsrmPropertyDefinition*, HRESULT)).call(propertydefinition)
  end
  def get_property_definition(propertyname : UInt8*, propertydefinition : IFsrmPropertyDefinition*) : HRESULT
    @lpVtbl.value.get_property_definition.unsafe_as(Proc(UInt8*, IFsrmPropertyDefinition*, HRESULT)).call(propertyname, propertydefinition)
  end
  def enum_rules(ruletype : FsrmRuleType, options : FsrmEnumOptions, rules : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_rules.unsafe_as(Proc(FsrmRuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(ruletype, options, rules)
  end
  def create_rule(ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.create_rule.unsafe_as(Proc(FsrmRuleType, IFsrmRule*, HRESULT)).call(ruletype, rule)
  end
  def get_rule(rulename : UInt8*, ruletype : FsrmRuleType, rule : IFsrmRule*) : HRESULT
    @lpVtbl.value.get_rule.unsafe_as(Proc(UInt8*, FsrmRuleType, IFsrmRule*, HRESULT)).call(rulename, ruletype, rule)
  end
  def enum_module_definitions(moduletype : FsrmPipelineModuleType, options : FsrmEnumOptions, moduledefinitions : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_module_definitions.unsafe_as(Proc(FsrmPipelineModuleType, FsrmEnumOptions, IFsrmCollection*, HRESULT)).call(moduletype, options, moduledefinitions)
  end
  def create_module_definition(moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.create_module_definition.unsafe_as(Proc(FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)).call(moduletype, moduledefinition)
  end
  def get_module_definition(modulename : UInt8*, moduletype : FsrmPipelineModuleType, moduledefinition : IFsrmPipelineModuleDefinition*) : HRESULT
    @lpVtbl.value.get_module_definition.unsafe_as(Proc(UInt8*, FsrmPipelineModuleType, IFsrmPipelineModuleDefinition*, HRESULT)).call(modulename, moduletype, moduledefinition)
  end
  def run_classification(context : FsrmReportGenerationContext, reserved : UInt8*) : HRESULT
    @lpVtbl.value.run_classification.unsafe_as(Proc(FsrmReportGenerationContext, UInt8*, HRESULT)).call(context, reserved)
  end
  def wait_for_classification_completion(waitseconds : Int32, completed : Int16*) : HRESULT
    @lpVtbl.value.wait_for_classification_completion.unsafe_as(Proc(Int32, Int16*, HRESULT)).call(waitseconds, completed)
  end
  def cancel_classification : HRESULT
    @lpVtbl.value.cancel_classification.unsafe_as(Proc(HRESULT)).call
  end
  def enum_file_properties(filepath : UInt8*, options : FsrmGetFilePropertyOptions, fileproperties : IFsrmCollection*) : HRESULT
    @lpVtbl.value.enum_file_properties.unsafe_as(Proc(UInt8*, FsrmGetFilePropertyOptions, IFsrmCollection*, HRESULT)).call(filepath, options, fileproperties)
  end
  def get_file_property(filepath : UInt8*, propertyname : UInt8*, options : FsrmGetFilePropertyOptions, property : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.unsafe_as(Proc(UInt8*, UInt8*, FsrmGetFilePropertyOptions, IFsrmProperty*, HRESULT)).call(filepath, propertyname, options, property)
  end
  def set_file_property(filepath : UInt8*, propertyname : UInt8*, propertyvalue : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(filepath, propertyname, propertyvalue)
  end
  def clear_file_property(filepath : UInt8*, property : UInt8*) : HRESULT
    @lpVtbl.value.clear_file_property.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(filepath, property)
  end
  def classify_files(filepaths : SAFEARRAY*, propertynames : SAFEARRAY*, propertyvalues : SAFEARRAY*, options : FsrmGetFilePropertyOptions) : HRESULT
    @lpVtbl.value.classify_files.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, SAFEARRAY*, FsrmGetFilePropertyOptions, HRESULT)).call(filepaths, propertynames, propertyvalues, options)
  end
end
struct LibWin32::IFsrmPropertyBag
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
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_relative_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_volume_name(volumename : UInt8**) : HRESULT
    @lpVtbl.value.get_volume_name.unsafe_as(Proc(UInt8**, HRESULT)).call(volumename)
  end
  def get_relative_namespace_root(relativenamespaceroot : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_namespace_root.unsafe_as(Proc(UInt8**, HRESULT)).call(relativenamespaceroot)
  end
  def get_volume_index(volumeid : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_index.unsafe_as(Proc(UInt32*, HRESULT)).call(volumeid)
  end
  def get_file_id(fileid : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(fileid)
  end
  def get_parent_directory_id(parentdirectoryid : VARIANT*) : HRESULT
    @lpVtbl.value.get_parent_directory_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(parentdirectoryid)
  end
  def get_size(size : VARIANT*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(VARIANT*, HRESULT)).call(size)
  end
  def get_size_allocated(sizeallocated : VARIANT*) : HRESULT
    @lpVtbl.value.get_size_allocated.unsafe_as(Proc(VARIANT*, HRESULT)).call(sizeallocated)
  end
  def get_creation_time(creationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_creation_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(creationtime)
  end
  def get_last_access_time(lastaccesstime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_access_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastaccesstime)
  end
  def get_last_modification_time(lastmodificationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modification_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastmodificationtime)
  end
  def get_attributes(attributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, HRESULT)).call(attributes)
  end
  def get_owner_sid(ownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(ownersid)
  end
  def get_file_property_names(filepropertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_file_property_names.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(filepropertynames)
  end
  def get_messages(messages : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_messages.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(messages)
  end
  def get_property_bag_flags(flags : UInt32*) : HRESULT
    @lpVtbl.value.get_property_bag_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(flags)
  end
  def get_file_property(name : UInt8*, fileproperty : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.unsafe_as(Proc(UInt8*, IFsrmProperty*, HRESULT)).call(name, fileproperty)
  end
  def set_file_property(name : UInt8*, value : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(name, value)
  end
  def add_message(message : UInt8*) : HRESULT
    @lpVtbl.value.add_message.unsafe_as(Proc(UInt8*, HRESULT)).call(message)
  end
  def get_file_stream_interface(accessmode : FsrmFileStreamingMode, interfacetype : FsrmFileStreamingInterfaceType, pstreaminterface : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_stream_interface.unsafe_as(Proc(FsrmFileStreamingMode, FsrmFileStreamingInterfaceType, VARIANT*, HRESULT)).call(accessmode, interfacetype, pstreaminterface)
  end
end
struct LibWin32::IFsrmPropertyBag2
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
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_relative_path(path : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_path.unsafe_as(Proc(UInt8**, HRESULT)).call(path)
  end
  def get_volume_name(volumename : UInt8**) : HRESULT
    @lpVtbl.value.get_volume_name.unsafe_as(Proc(UInt8**, HRESULT)).call(volumename)
  end
  def get_relative_namespace_root(relativenamespaceroot : UInt8**) : HRESULT
    @lpVtbl.value.get_relative_namespace_root.unsafe_as(Proc(UInt8**, HRESULT)).call(relativenamespaceroot)
  end
  def get_volume_index(volumeid : UInt32*) : HRESULT
    @lpVtbl.value.get_volume_index.unsafe_as(Proc(UInt32*, HRESULT)).call(volumeid)
  end
  def get_file_id(fileid : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(fileid)
  end
  def get_parent_directory_id(parentdirectoryid : VARIANT*) : HRESULT
    @lpVtbl.value.get_parent_directory_id.unsafe_as(Proc(VARIANT*, HRESULT)).call(parentdirectoryid)
  end
  def get_size(size : VARIANT*) : HRESULT
    @lpVtbl.value.get_size.unsafe_as(Proc(VARIANT*, HRESULT)).call(size)
  end
  def get_size_allocated(sizeallocated : VARIANT*) : HRESULT
    @lpVtbl.value.get_size_allocated.unsafe_as(Proc(VARIANT*, HRESULT)).call(sizeallocated)
  end
  def get_creation_time(creationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_creation_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(creationtime)
  end
  def get_last_access_time(lastaccesstime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_access_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastaccesstime)
  end
  def get_last_modification_time(lastmodificationtime : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modification_time.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastmodificationtime)
  end
  def get_attributes(attributes : UInt32*) : HRESULT
    @lpVtbl.value.get_attributes.unsafe_as(Proc(UInt32*, HRESULT)).call(attributes)
  end
  def get_owner_sid(ownersid : UInt8**) : HRESULT
    @lpVtbl.value.get_owner_sid.unsafe_as(Proc(UInt8**, HRESULT)).call(ownersid)
  end
  def get_file_property_names(filepropertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_file_property_names.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(filepropertynames)
  end
  def get_messages(messages : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_messages.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(messages)
  end
  def get_property_bag_flags(flags : UInt32*) : HRESULT
    @lpVtbl.value.get_property_bag_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(flags)
  end
  def get_file_property(name : UInt8*, fileproperty : IFsrmProperty*) : HRESULT
    @lpVtbl.value.get_file_property.unsafe_as(Proc(UInt8*, IFsrmProperty*, HRESULT)).call(name, fileproperty)
  end
  def set_file_property(name : UInt8*, value : UInt8*) : HRESULT
    @lpVtbl.value.set_file_property.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(name, value)
  end
  def add_message(message : UInt8*) : HRESULT
    @lpVtbl.value.add_message.unsafe_as(Proc(UInt8*, HRESULT)).call(message)
  end
  def get_file_stream_interface(accessmode : FsrmFileStreamingMode, interfacetype : FsrmFileStreamingInterfaceType, pstreaminterface : VARIANT*) : HRESULT
    @lpVtbl.value.get_file_stream_interface.unsafe_as(Proc(FsrmFileStreamingMode, FsrmFileStreamingInterfaceType, VARIANT*, HRESULT)).call(accessmode, interfacetype, pstreaminterface)
  end
  def get_field_value(field : FsrmPropertyBagField, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_field_value.unsafe_as(Proc(FsrmPropertyBagField, VARIANT*, HRESULT)).call(field, value)
  end
  def get_untrusted_in_file_properties(props : IFsrmCollection*) : HRESULT
    @lpVtbl.value.get_untrusted_in_file_properties.unsafe_as(Proc(IFsrmCollection*, HRESULT)).call(props)
  end
end
struct LibWin32::IFsrmPipelineModuleImplementation
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
  def on_load(moduledefinition : IFsrmPipelineModuleDefinition, moduleconnector : IFsrmPipelineModuleConnector*) : HRESULT
    @lpVtbl.value.on_load.unsafe_as(Proc(IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*, HRESULT)).call(moduledefinition, moduleconnector)
  end
  def on_unload : HRESULT
    @lpVtbl.value.on_unload.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmClassifierModuleImplementation
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
  def on_load(moduledefinition : IFsrmPipelineModuleDefinition, moduleconnector : IFsrmPipelineModuleConnector*) : HRESULT
    @lpVtbl.value.on_load.unsafe_as(Proc(IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*, HRESULT)).call(moduledefinition, moduleconnector)
  end
  def on_unload : HRESULT
    @lpVtbl.value.on_unload.unsafe_as(Proc(HRESULT)).call
  end
  def get_last_modified(lastmodified : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_modified.unsafe_as(Proc(VARIANT*, HRESULT)).call(lastmodified)
  end
  def use_rules_and_definitions(rules : IFsrmCollection, propertydefinitions : IFsrmCollection) : HRESULT
    @lpVtbl.value.use_rules_and_definitions.unsafe_as(Proc(IFsrmCollection, IFsrmCollection, HRESULT)).call(rules, propertydefinitions)
  end
  def on_begin_file(propertybag : IFsrmPropertyBag, arrayruleids : SAFEARRAY*) : HRESULT
    @lpVtbl.value.on_begin_file.unsafe_as(Proc(IFsrmPropertyBag, SAFEARRAY*, HRESULT)).call(propertybag, arrayruleids)
  end
  def does_property_value_apply(property : UInt8*, value : UInt8*, applyvalue : Int16*, idrule : Guid, idpropdef : Guid) : HRESULT
    @lpVtbl.value.does_property_value_apply.unsafe_as(Proc(UInt8*, UInt8*, Int16*, Guid, Guid, HRESULT)).call(property, value, applyvalue, idrule, idpropdef)
  end
  def get_property_value_to_apply(property : UInt8*, value : UInt8**, idrule : Guid, idpropdef : Guid) : HRESULT
    @lpVtbl.value.get_property_value_to_apply.unsafe_as(Proc(UInt8*, UInt8**, Guid, Guid, HRESULT)).call(property, value, idrule, idpropdef)
  end
  def on_end_file : HRESULT
    @lpVtbl.value.on_end_file.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IFsrmStorageModuleImplementation
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
  def on_load(moduledefinition : IFsrmPipelineModuleDefinition, moduleconnector : IFsrmPipelineModuleConnector*) : HRESULT
    @lpVtbl.value.on_load.unsafe_as(Proc(IFsrmPipelineModuleDefinition, IFsrmPipelineModuleConnector*, HRESULT)).call(moduledefinition, moduleconnector)
  end
  def on_unload : HRESULT
    @lpVtbl.value.on_unload.unsafe_as(Proc(HRESULT)).call
  end
  def use_definitions(propertydefinitions : IFsrmCollection) : HRESULT
    @lpVtbl.value.use_definitions.unsafe_as(Proc(IFsrmCollection, HRESULT)).call(propertydefinitions)
  end
  def load_properties(propertybag : IFsrmPropertyBag) : HRESULT
    @lpVtbl.value.load_properties.unsafe_as(Proc(IFsrmPropertyBag, HRESULT)).call(propertybag)
  end
  def save_properties(propertybag : IFsrmPropertyBag) : HRESULT
    @lpVtbl.value.save_properties.unsafe_as(Proc(IFsrmPropertyBag, HRESULT)).call(propertybag)
  end
end
struct LibWin32::IFsrmPipelineModuleConnector
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
  def get_module_implementation(pipelinemoduleimplementation : IFsrmPipelineModuleImplementation*) : HRESULT
    @lpVtbl.value.get_module_implementation.unsafe_as(Proc(IFsrmPipelineModuleImplementation*, HRESULT)).call(pipelinemoduleimplementation)
  end
  def get_module_name(username : UInt8**) : HRESULT
    @lpVtbl.value.get_module_name.unsafe_as(Proc(UInt8**, HRESULT)).call(username)
  end
  def get_hosting_user_account(useraccount : UInt8**) : HRESULT
    @lpVtbl.value.get_hosting_user_account.unsafe_as(Proc(UInt8**, HRESULT)).call(useraccount)
  end
  def get_hosting_process_pid(pid : Int32*) : HRESULT
    @lpVtbl.value.get_hosting_process_pid.unsafe_as(Proc(Int32*, HRESULT)).call(pid)
  end
  def bind(moduledefinition : IFsrmPipelineModuleDefinition, moduleimplementation : IFsrmPipelineModuleImplementation) : HRESULT
    @lpVtbl.value.bind.unsafe_as(Proc(IFsrmPipelineModuleDefinition, IFsrmPipelineModuleImplementation, HRESULT)).call(moduledefinition, moduleimplementation)
  end
end
struct LibWin32::DIFsrmClassificationEvents
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
end
