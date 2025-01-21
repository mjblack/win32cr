require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::UpdateAgent
  LIBID_WUApiLib = "b596cc9f-56e5-419e-a622-e01bb457431e"
  UPDATE_LOCKDOWN_WEBSITE_ACCESS = 1_u32
  WU_S_SERVICE_STOP = 2359297_i32
  WU_S_SELFUPDATE = 2359298_i32
  WU_S_UPDATE_ERROR = 2359299_i32
  WU_S_MARKED_FOR_DISCONNECT = 2359300_i32
  WU_S_REBOOT_REQUIRED = 2359301_i32
  WU_S_ALREADY_INSTALLED = 2359302_i32
  WU_S_ALREADY_UNINSTALLED = 2359303_i32
  WU_S_ALREADY_DOWNLOADED = 2359304_i32
  WU_S_SOME_UPDATES_SKIPPED_ON_BATTERY = 2359305_i32
  WU_S_ALREADY_REVERTED = 2359306_i32
  WU_S_SEARCH_CRITERIA_NOT_SUPPORTED = 2359312_i32
  WU_S_UH_INSTALLSTILLPENDING = 2367509_i32
  WU_S_UH_DOWNLOAD_SIZE_CALCULATED = 2367510_i32
  WU_S_SIH_NOOP = 2379777_i32
  WU_S_DM_ALREADYDOWNLOADING = 2383873_i32
  WU_S_METADATA_SKIPPED_BY_ENFORCEMENTMODE = 2388225_i32
  WU_S_METADATA_IGNORED_SIGNATURE_VERIFICATION = 2388226_i32
  WU_S_SEARCH_LOAD_SHEDDING = 2392065_i32
  WU_E_NO_SERVICE = -2145124351_i32
  WU_E_MAX_CAPACITY_REACHED = -2145124350_i32
  WU_E_UNKNOWN_ID = -2145124349_i32
  WU_E_NOT_INITIALIZED = -2145124348_i32
  WU_E_RANGEOVERLAP = -2145124347_i32
  WU_E_TOOMANYRANGES = -2145124346_i32
  WU_E_INVALIDINDEX = -2145124345_i32
  WU_E_ITEMNOTFOUND = -2145124344_i32
  WU_E_OPERATIONINPROGRESS = -2145124343_i32
  WU_E_COULDNOTCANCEL = -2145124342_i32
  WU_E_CALL_CANCELLED = -2145124341_i32
  WU_E_NOOP = -2145124340_i32
  WU_E_XML_MISSINGDATA = -2145124339_i32
  WU_E_XML_INVALID = -2145124338_i32
  WU_E_CYCLE_DETECTED = -2145124337_i32
  WU_E_TOO_DEEP_RELATION = -2145124336_i32
  WU_E_INVALID_RELATIONSHIP = -2145124335_i32
  WU_E_REG_VALUE_INVALID = -2145124334_i32
  WU_E_DUPLICATE_ITEM = -2145124333_i32
  WU_E_INVALID_INSTALL_REQUESTED = -2145124332_i32
  WU_E_INSTALL_NOT_ALLOWED = -2145124330_i32
  WU_E_NOT_APPLICABLE = -2145124329_i32
  WU_E_NO_USERTOKEN = -2145124328_i32
  WU_E_EXCLUSIVE_INSTALL_CONFLICT = -2145124327_i32
  WU_E_POLICY_NOT_SET = -2145124326_i32
  WU_E_SELFUPDATE_IN_PROGRESS = -2145124325_i32
  WU_E_INVALID_UPDATE = -2145124323_i32
  WU_E_SERVICE_STOP = -2145124322_i32
  WU_E_NO_CONNECTION = -2145124321_i32
  WU_E_NO_INTERACTIVE_USER = -2145124320_i32
  WU_E_TIME_OUT = -2145124319_i32
  WU_E_ALL_UPDATES_FAILED = -2145124318_i32
  WU_E_EULAS_DECLINED = -2145124317_i32
  WU_E_NO_UPDATE = -2145124316_i32
  WU_E_USER_ACCESS_DISABLED = -2145124315_i32
  WU_E_INVALID_UPDATE_TYPE = -2145124314_i32
  WU_E_URL_TOO_LONG = -2145124313_i32
  WU_E_UNINSTALL_NOT_ALLOWED = -2145124312_i32
  WU_E_INVALID_PRODUCT_LICENSE = -2145124311_i32
  WU_E_MISSING_HANDLER = -2145124310_i32
  WU_E_LEGACYSERVER = -2145124309_i32
  WU_E_BIN_SOURCE_ABSENT = -2145124308_i32
  WU_E_SOURCE_ABSENT = -2145124307_i32
  WU_E_WU_DISABLED = -2145124306_i32
  WU_E_CALL_CANCELLED_BY_POLICY = -2145124305_i32
  WU_E_INVALID_PROXY_SERVER = -2145124304_i32
  WU_E_INVALID_FILE = -2145124303_i32
  WU_E_INVALID_CRITERIA = -2145124302_i32
  WU_E_EULA_UNAVAILABLE = -2145124301_i32
  WU_E_DOWNLOAD_FAILED = -2145124300_i32
  WU_E_UPDATE_NOT_PROCESSED = -2145124299_i32
  WU_E_INVALID_OPERATION = -2145124298_i32
  WU_E_NOT_SUPPORTED = -2145124297_i32
  WU_E_WINHTTP_INVALID_FILE = -2145124296_i32
  WU_E_TOO_MANY_RESYNC = -2145124295_i32
  WU_E_NO_SERVER_CORE_SUPPORT = -2145124288_i32
  WU_E_SYSPREP_IN_PROGRESS = -2145124287_i32
  WU_E_UNKNOWN_SERVICE = -2145124286_i32
  WU_E_NO_UI_SUPPORT = -2145124285_i32
  WU_E_PER_MACHINE_UPDATE_ACCESS_DENIED = -2145124284_i32
  WU_E_UNSUPPORTED_SEARCHSCOPE = -2145124283_i32
  WU_E_BAD_FILE_URL = -2145124282_i32
  WU_E_REVERT_NOT_ALLOWED = -2145124281_i32
  WU_E_INVALID_NOTIFICATION_INFO = -2145124280_i32
  WU_E_OUTOFRANGE = -2145124279_i32
  WU_E_SETUP_IN_PROGRESS = -2145124278_i32
  WU_E_ORPHANED_DOWNLOAD_JOB = -2145124277_i32
  WU_E_LOW_BATTERY = -2145124276_i32
  WU_E_INFRASTRUCTUREFILE_INVALID_FORMAT = -2145124275_i32
  WU_E_INFRASTRUCTUREFILE_REQUIRES_SSL = -2145124274_i32
  WU_E_IDLESHUTDOWN_OPCOUNT_DISCOVERY = -2145124273_i32
  WU_E_IDLESHUTDOWN_OPCOUNT_SEARCH = -2145124272_i32
  WU_E_IDLESHUTDOWN_OPCOUNT_DOWNLOAD = -2145124271_i32
  WU_E_IDLESHUTDOWN_OPCOUNT_INSTALL = -2145124270_i32
  WU_E_IDLESHUTDOWN_OPCOUNT_OTHER = -2145124269_i32
  WU_E_INTERACTIVE_CALL_CANCELLED = -2145124268_i32
  WU_E_AU_CALL_CANCELLED = -2145124267_i32
  WU_E_SYSTEM_UNSUPPORTED = -2145124266_i32
  WU_E_NO_SUCH_HANDLER_PLUGIN = -2145124265_i32
  WU_E_INVALID_SERIALIZATION_VERSION = -2145124264_i32
  WU_E_NETWORK_COST_EXCEEDS_POLICY = -2145124263_i32
  WU_E_CALL_CANCELLED_BY_HIDE = -2145124262_i32
  WU_E_CALL_CANCELLED_BY_INVALID = -2145124261_i32
  WU_E_INVALID_VOLUMEID = -2145124260_i32
  WU_E_UNRECOGNIZED_VOLUMEID = -2145124259_i32
  WU_E_EXTENDEDERROR_NOTSET = -2145124258_i32
  WU_E_EXTENDEDERROR_FAILED = -2145124257_i32
  WU_E_IDLESHUTDOWN_OPCOUNT_SERVICEREGISTRATION = -2145124256_i32
  WU_E_FILETRUST_SHA2SIGNATURE_MISSING = -2145124255_i32
  WU_E_UPDATE_NOT_APPROVED = -2145124254_i32
  WU_E_CALL_CANCELLED_BY_INTERACTIVE_SEARCH = -2145124253_i32
  WU_E_INSTALL_JOB_RESUME_NOT_ALLOWED = -2145124252_i32
  WU_E_INSTALL_JOB_NOT_SUSPENDED = -2145124251_i32
  WU_E_INSTALL_USERCONTEXT_ACCESSDENIED = -2145124250_i32
  WU_E_UNEXPECTED = -2145120257_i32
  WU_E_MSI_WRONG_VERSION = -2145120255_i32
  WU_E_MSI_NOT_CONFIGURED = -2145120254_i32
  WU_E_MSP_DISABLED = -2145120253_i32
  WU_E_MSI_WRONG_APP_CONTEXT = -2145120252_i32
  WU_E_MSI_NOT_PRESENT = -2145120251_i32
  WU_E_MSP_UNEXPECTED = -2145116161_i32
  WU_E_PT_SOAPCLIENT_BASE = -2145107968_i32
  WU_E_PT_SOAPCLIENT_INITIALIZE = -2145107967_i32
  WU_E_PT_SOAPCLIENT_OUTOFMEMORY = -2145107966_i32
  WU_E_PT_SOAPCLIENT_GENERATE = -2145107965_i32
  WU_E_PT_SOAPCLIENT_CONNECT = -2145107964_i32
  WU_E_PT_SOAPCLIENT_SEND = -2145107963_i32
  WU_E_PT_SOAPCLIENT_SERVER = -2145107962_i32
  WU_E_PT_SOAPCLIENT_SOAPFAULT = -2145107961_i32
  WU_E_PT_SOAPCLIENT_PARSEFAULT = -2145107960_i32
  WU_E_PT_SOAPCLIENT_READ = -2145107959_i32
  WU_E_PT_SOAPCLIENT_PARSE = -2145107958_i32
  WU_E_PT_SOAP_VERSION = -2145107957_i32
  WU_E_PT_SOAP_MUST_UNDERSTAND = -2145107956_i32
  WU_E_PT_SOAP_CLIENT = -2145107955_i32
  WU_E_PT_SOAP_SERVER = -2145107954_i32
  WU_E_PT_WMI_ERROR = -2145107953_i32
  WU_E_PT_EXCEEDED_MAX_SERVER_TRIPS = -2145107952_i32
  WU_E_PT_SUS_SERVER_NOT_SET = -2145107951_i32
  WU_E_PT_DOUBLE_INITIALIZATION = -2145107950_i32
  WU_E_PT_INVALID_COMPUTER_NAME = -2145107949_i32
  WU_E_PT_REFRESH_CACHE_REQUIRED = -2145107947_i32
  WU_E_PT_HTTP_STATUS_BAD_REQUEST = -2145107946_i32
  WU_E_PT_HTTP_STATUS_DENIED = -2145107945_i32
  WU_E_PT_HTTP_STATUS_FORBIDDEN = -2145107944_i32
  WU_E_PT_HTTP_STATUS_NOT_FOUND = -2145107943_i32
  WU_E_PT_HTTP_STATUS_BAD_METHOD = -2145107942_i32
  WU_E_PT_HTTP_STATUS_PROXY_AUTH_REQ = -2145107941_i32
  WU_E_PT_HTTP_STATUS_REQUEST_TIMEOUT = -2145107940_i32
  WU_E_PT_HTTP_STATUS_CONFLICT = -2145107939_i32
  WU_E_PT_HTTP_STATUS_GONE = -2145107938_i32
  WU_E_PT_HTTP_STATUS_SERVER_ERROR = -2145107937_i32
  WU_E_PT_HTTP_STATUS_NOT_SUPPORTED = -2145107936_i32
  WU_E_PT_HTTP_STATUS_BAD_GATEWAY = -2145107935_i32
  WU_E_PT_HTTP_STATUS_SERVICE_UNAVAIL = -2145107934_i32
  WU_E_PT_HTTP_STATUS_GATEWAY_TIMEOUT = -2145107933_i32
  WU_E_PT_HTTP_STATUS_VERSION_NOT_SUP = -2145107932_i32
  WU_E_PT_FILE_LOCATIONS_CHANGED = -2145107931_i32
  WU_E_PT_REGISTRATION_NOT_SUPPORTED = -2145107930_i32
  WU_E_PT_NO_AUTH_PLUGINS_REQUESTED = -2145107929_i32
  WU_E_PT_NO_AUTH_COOKIES_CREATED = -2145107928_i32
  WU_E_PT_INVALID_CONFIG_PROP = -2145107927_i32
  WU_E_PT_CONFIG_PROP_MISSING = -2145107926_i32
  WU_E_PT_HTTP_STATUS_NOT_MAPPED = -2145107925_i32
  WU_E_PT_WINHTTP_NAME_NOT_RESOLVED = -2145107924_i32
  WU_E_PT_LOAD_SHEDDING = -2145107923_i32
  WU_E_PT_SAME_REDIR_ID = -2145103827_i32
  WU_E_PT_NO_MANAGED_RECOVER = -2145103826_i32
  WU_E_PT_ECP_SUCCEEDED_WITH_ERRORS = -2145107921_i32
  WU_E_PT_ECP_INIT_FAILED = -2145107920_i32
  WU_E_PT_ECP_INVALID_FILE_FORMAT = -2145107919_i32
  WU_E_PT_ECP_INVALID_METADATA = -2145107918_i32
  WU_E_PT_ECP_FAILURE_TO_EXTRACT_DIGEST = -2145107917_i32
  WU_E_PT_ECP_FAILURE_TO_DECOMPRESS_CAB_FILE = -2145107916_i32
  WU_E_PT_ECP_FILE_LOCATION_ERROR = -2145107915_i32
  WU_E_PT_CATALOG_SYNC_REQUIRED = -2145123274_i32
  WU_E_PT_SECURITY_VERIFICATION_FAILURE = -2145123273_i32
  WU_E_PT_ENDPOINT_UNREACHABLE = -2145123272_i32
  WU_E_PT_INVALID_FORMAT = -2145123271_i32
  WU_E_PT_INVALID_URL = -2145123270_i32
  WU_E_PT_NWS_NOT_LOADED = -2145123269_i32
  WU_E_PT_PROXY_AUTH_SCHEME_NOT_SUPPORTED = -2145123268_i32
  WU_E_SERVICEPROP_NOTAVAIL = -2145123267_i32
  WU_E_PT_ENDPOINT_REFRESH_REQUIRED = -2145123266_i32
  WU_E_PT_ENDPOINTURL_NOTAVAIL = -2145123265_i32
  WU_E_PT_ENDPOINT_DISCONNECTED = -2145123264_i32
  WU_E_PT_INVALID_OPERATION = -2145123263_i32
  WU_E_PT_OBJECT_FAULTED = -2145123262_i32
  WU_E_PT_NUMERIC_OVERFLOW = -2145123261_i32
  WU_E_PT_OPERATION_ABORTED = -2145123260_i32
  WU_E_PT_OPERATION_ABANDONED = -2145123259_i32
  WU_E_PT_QUOTA_EXCEEDED = -2145123258_i32
  WU_E_PT_NO_TRANSLATION_AVAILABLE = -2145123257_i32
  WU_E_PT_ADDRESS_IN_USE = -2145123256_i32
  WU_E_PT_ADDRESS_NOT_AVAILABLE = -2145123255_i32
  WU_E_PT_OTHER = -2145123254_i32
  WU_E_PT_SECURITY_SYSTEM_FAILURE = -2145123253_i32
  WU_E_PT_UNEXPECTED = -2145103873_i32
  WU_E_REDIRECTOR_LOAD_XML = -2145103871_i32
  WU_E_REDIRECTOR_S_FALSE = -2145103870_i32
  WU_E_REDIRECTOR_ID_SMALLER = -2145103869_i32
  WU_E_REDIRECTOR_UNKNOWN_SERVICE = -2145103868_i32
  WU_E_REDIRECTOR_UNSUPPORTED_CONTENTTYPE = -2145103867_i32
  WU_E_REDIRECTOR_INVALID_RESPONSE = -2145103866_i32
  WU_E_REDIRECTOR_ATTRPROVIDER_EXCEEDED_MAX_NAMEVALUE = -2145103864_i32
  WU_E_REDIRECTOR_ATTRPROVIDER_INVALID_NAME = -2145103863_i32
  WU_E_REDIRECTOR_ATTRPROVIDER_INVALID_VALUE = -2145103862_i32
  WU_E_REDIRECTOR_SLS_GENERIC_ERROR = -2145103861_i32
  WU_E_REDIRECTOR_CONNECT_POLICY = -2145103860_i32
  WU_E_REDIRECTOR_ONLINE_DISALLOWED = -2145103859_i32
  WU_E_REDIRECTOR_UNEXPECTED = -2145103617_i32
  WU_E_SIH_VERIFY_DOWNLOAD_ENGINE = -2145103615_i32
  WU_E_SIH_VERIFY_DOWNLOAD_PAYLOAD = -2145103614_i32
  WU_E_SIH_VERIFY_STAGE_ENGINE = -2145103613_i32
  WU_E_SIH_VERIFY_STAGE_PAYLOAD = -2145103612_i32
  WU_E_SIH_ACTION_NOT_FOUND = -2145103611_i32
  WU_E_SIH_SLS_PARSE = -2145103610_i32
  WU_E_SIH_INVALIDHASH = -2145103609_i32
  WU_E_SIH_NO_ENGINE = -2145103608_i32
  WU_E_SIH_POST_REBOOT_INSTALL_FAILED = -2145103607_i32
  WU_E_SIH_POST_REBOOT_NO_CACHED_SLS_RESPONSE = -2145103606_i32
  WU_E_SIH_PARSE = -2145103605_i32
  WU_E_SIH_SECURITY = -2145103604_i32
  WU_E_SIH_PPL = -2145103603_i32
  WU_E_SIH_POLICY = -2145103602_i32
  WU_E_SIH_STDEXCEPTION = -2145103601_i32
  WU_E_SIH_NONSTDEXCEPTION = -2145103600_i32
  WU_E_SIH_ENGINE_EXCEPTION = -2145103599_i32
  WU_E_SIH_BLOCKED_FOR_PLATFORM = -2145103598_i32
  WU_E_SIH_ANOTHER_INSTANCE_RUNNING = -2145103597_i32
  WU_E_SIH_DNSRESILIENCY_OFF = -2145103596_i32
  WU_E_SIH_UNEXPECTED = -2145103361_i32
  WU_E_DRV_PRUNED = -2145075199_i32
  WU_E_DRV_NOPROP_OR_LEGACY = -2145075198_i32
  WU_E_DRV_REG_MISMATCH = -2145075197_i32
  WU_E_DRV_NO_METADATA = -2145075196_i32
  WU_E_DRV_MISSING_ATTRIBUTE = -2145075195_i32
  WU_E_DRV_SYNC_FAILED = -2145075194_i32
  WU_E_DRV_NO_PRINTER_CONTENT = -2145075193_i32
  WU_E_DRV_DEVICE_PROBLEM = -2145075192_i32
  WU_E_DRV_UNEXPECTED = -2145071105_i32
  WU_E_DS_SHUTDOWN = -2145091584_i32
  WU_E_DS_INUSE = -2145091583_i32
  WU_E_DS_INVALID = -2145091582_i32
  WU_E_DS_TABLEMISSING = -2145091581_i32
  WU_E_DS_TABLEINCORRECT = -2145091580_i32
  WU_E_DS_INVALIDTABLENAME = -2145091579_i32
  WU_E_DS_BADVERSION = -2145091578_i32
  WU_E_DS_NODATA = -2145091577_i32
  WU_E_DS_MISSINGDATA = -2145091576_i32
  WU_E_DS_MISSINGREF = -2145091575_i32
  WU_E_DS_UNKNOWNHANDLER = -2145091574_i32
  WU_E_DS_CANTDELETE = -2145091573_i32
  WU_E_DS_LOCKTIMEOUTEXPIRED = -2145091572_i32
  WU_E_DS_NOCATEGORIES = -2145091571_i32
  WU_E_DS_ROWEXISTS = -2145091570_i32
  WU_E_DS_STOREFILELOCKED = -2145091569_i32
  WU_E_DS_CANNOTREGISTER = -2145091568_i32
  WU_E_DS_UNABLETOSTART = -2145091567_i32
  WU_E_DS_DUPLICATEUPDATEID = -2145091565_i32
  WU_E_DS_UNKNOWNSERVICE = -2145091564_i32
  WU_E_DS_SERVICEEXPIRED = -2145091563_i32
  WU_E_DS_DECLINENOTALLOWED = -2145091562_i32
  WU_E_DS_TABLESESSIONMISMATCH = -2145091561_i32
  WU_E_DS_SESSIONLOCKMISMATCH = -2145091560_i32
  WU_E_DS_NEEDWINDOWSSERVICE = -2145091559_i32
  WU_E_DS_INVALIDOPERATION = -2145091558_i32
  WU_E_DS_SCHEMAMISMATCH = -2145091557_i32
  WU_E_DS_RESETREQUIRED = -2145091556_i32
  WU_E_DS_IMPERSONATED = -2145091555_i32
  WU_E_DS_DATANOTAVAILABLE = -2145091554_i32
  WU_E_DS_DATANOTLOADED = -2145091553_i32
  WU_E_DS_NODATA_NOSUCHREVISION = -2145091552_i32
  WU_E_DS_NODATA_NOSUCHUPDATE = -2145091551_i32
  WU_E_DS_NODATA_EULA = -2145091550_i32
  WU_E_DS_NODATA_SERVICE = -2145091549_i32
  WU_E_DS_NODATA_COOKIE = -2145091548_i32
  WU_E_DS_NODATA_TIMER = -2145091547_i32
  WU_E_DS_NODATA_CCR = -2145091546_i32
  WU_E_DS_NODATA_FILE = -2145091545_i32
  WU_E_DS_NODATA_DOWNLOADJOB = -2145091544_i32
  WU_E_DS_NODATA_TMI = -2145091543_i32
  WU_E_DS_UNEXPECTED = -2145087489_i32
  WU_E_INVENTORY_PARSEFAILED = -2145087487_i32
  WU_E_INVENTORY_GET_INVENTORY_TYPE_FAILED = -2145087486_i32
  WU_E_INVENTORY_RESULT_UPLOAD_FAILED = -2145087485_i32
  WU_E_INVENTORY_UNEXPECTED = -2145087484_i32
  WU_E_INVENTORY_WMI_ERROR = -2145087483_i32
  WU_E_AU_NOSERVICE = -2145083392_i32
  WU_E_AU_NONLEGACYSERVER = -2145083390_i32
  WU_E_AU_LEGACYCLIENTDISABLED = -2145083389_i32
  WU_E_AU_PAUSED = -2145083388_i32
  WU_E_AU_NO_REGISTERED_SERVICE = -2145083387_i32
  WU_E_AU_DETECT_SVCID_MISMATCH = -2145083386_i32
  WU_E_REBOOT_IN_PROGRESS = -2145083385_i32
  WU_E_AU_OOBE_IN_PROGRESS = -2145083384_i32
  WU_E_AU_UNEXPECTED = -2145079297_i32
  WU_E_UH_REMOTEUNAVAILABLE = -2145116160_i32
  WU_E_UH_LOCALONLY = -2145116159_i32
  WU_E_UH_UNKNOWNHANDLER = -2145116158_i32
  WU_E_UH_REMOTEALREADYACTIVE = -2145116157_i32
  WU_E_UH_DOESNOTSUPPORTACTION = -2145116156_i32
  WU_E_UH_WRONGHANDLER = -2145116155_i32
  WU_E_UH_INVALIDMETADATA = -2145116154_i32
  WU_E_UH_INSTALLERHUNG = -2145116153_i32
  WU_E_UH_OPERATIONCANCELLED = -2145116152_i32
  WU_E_UH_BADHANDLERXML = -2145116151_i32
  WU_E_UH_CANREQUIREINPUT = -2145116150_i32
  WU_E_UH_INSTALLERFAILURE = -2145116149_i32
  WU_E_UH_FALLBACKTOSELFCONTAINED = -2145116148_i32
  WU_E_UH_NEEDANOTHERDOWNLOAD = -2145116147_i32
  WU_E_UH_NOTIFYFAILURE = -2145116146_i32
  WU_E_UH_INCONSISTENT_FILE_NAMES = -2145116145_i32
  WU_E_UH_FALLBACKERROR = -2145116144_i32
  WU_E_UH_TOOMANYDOWNLOADREQUESTS = -2145116143_i32
  WU_E_UH_UNEXPECTEDCBSRESPONSE = -2145116142_i32
  WU_E_UH_BADCBSPACKAGEID = -2145116141_i32
  WU_E_UH_POSTREBOOTSTILLPENDING = -2145116140_i32
  WU_E_UH_POSTREBOOTRESULTUNKNOWN = -2145116139_i32
  WU_E_UH_POSTREBOOTUNEXPECTEDSTATE = -2145116138_i32
  WU_E_UH_NEW_SERVICING_STACK_REQUIRED = -2145116137_i32
  WU_E_UH_CALLED_BACK_FAILURE = -2145116136_i32
  WU_E_UH_CUSTOMINSTALLER_INVALID_SIGNATURE = -2145116135_i32
  WU_E_UH_UNSUPPORTED_INSTALLCONTEXT = -2145116134_i32
  WU_E_UH_INVALID_TARGETSESSION = -2145116133_i32
  WU_E_UH_DECRYPTFAILURE = -2145116132_i32
  WU_E_UH_HANDLER_DISABLEDUNTILREBOOT = -2145116131_i32
  WU_E_UH_APPX_NOT_PRESENT = -2145116130_i32
  WU_E_UH_NOTREADYTOCOMMIT = -2145116129_i32
  WU_E_UH_APPX_INVALID_PACKAGE_VOLUME = -2145116128_i32
  WU_E_UH_APPX_DEFAULT_PACKAGE_VOLUME_UNAVAILABLE = -2145116127_i32
  WU_E_UH_APPX_INSTALLED_PACKAGE_VOLUME_UNAVAILABLE = -2145116126_i32
  WU_E_UH_APPX_PACKAGE_FAMILY_NOT_FOUND = -2145116125_i32
  WU_E_UH_APPX_SYSTEM_VOLUME_NOT_FOUND = -2145116124_i32
  WU_E_UH_UNEXPECTED = -2145112065_i32
  WU_E_DM_URLNOTAVAILABLE = -2145099775_i32
  WU_E_DM_INCORRECTFILEHASH = -2145099774_i32
  WU_E_DM_UNKNOWNALGORITHM = -2145099773_i32
  WU_E_DM_NEEDDOWNLOADREQUEST = -2145099772_i32
  WU_E_DM_NONETWORK = -2145099771_i32
  WU_E_DM_WRONGBITSVERSION = -2145099770_i32
  WU_E_DM_NOTDOWNLOADED = -2145099769_i32
  WU_E_DM_FAILTOCONNECTTOBITS = -2145099768_i32
  WU_E_DM_BITSTRANSFERERROR = -2145099767_i32
  WU_E_DM_DOWNLOADLOCATIONCHANGED = -2145099766_i32
  WU_E_DM_CONTENTCHANGED = -2145099765_i32
  WU_E_DM_DOWNLOADLIMITEDBYUPDATESIZE = -2145099764_i32
  WU_E_DM_UNAUTHORIZED = -2145099762_i32
  WU_E_DM_BG_ERROR_TOKEN_REQUIRED = -2145099761_i32
  WU_E_DM_DOWNLOADSANDBOXNOTFOUND = -2145099760_i32
  WU_E_DM_DOWNLOADFILEPATHUNKNOWN = -2145099759_i32
  WU_E_DM_DOWNLOADFILEMISSING = -2145099758_i32
  WU_E_DM_UPDATEREMOVED = -2145099757_i32
  WU_E_DM_READRANGEFAILED = -2145099756_i32
  WU_E_DM_UNAUTHORIZED_NO_USER = -2145099754_i32
  WU_E_DM_UNAUTHORIZED_LOCAL_USER = -2145099753_i32
  WU_E_DM_UNAUTHORIZED_DOMAIN_USER = -2145099752_i32
  WU_E_DM_UNAUTHORIZED_MSA_USER = -2145099751_i32
  WU_E_DM_FALLINGBACKTOBITS = -2145099750_i32
  WU_E_DM_DOWNLOAD_VOLUME_CONFLICT = -2145099749_i32
  WU_E_DM_SANDBOX_HASH_MISMATCH = -2145099748_i32
  WU_E_DM_HARDRESERVEID_CONFLICT = -2145099747_i32
  WU_E_DM_DOSVC_REQUIRED = -2145099746_i32
  WU_E_DM_UNEXPECTED = -2145095681_i32
  WU_E_SETUP_INVALID_INFDATA = -2145071103_i32
  WU_E_SETUP_INVALID_IDENTDATA = -2145071102_i32
  WU_E_SETUP_ALREADY_INITIALIZED = -2145071101_i32
  WU_E_SETUP_NOT_INITIALIZED = -2145071100_i32
  WU_E_SETUP_SOURCE_VERSION_MISMATCH = -2145071099_i32
  WU_E_SETUP_TARGET_VERSION_GREATER = -2145071098_i32
  WU_E_SETUP_REGISTRATION_FAILED = -2145071097_i32
  WU_E_SELFUPDATE_SKIP_ON_FAILURE = -2145071096_i32
  WU_E_SETUP_SKIP_UPDATE = -2145071095_i32
  WU_E_SETUP_UNSUPPORTED_CONFIGURATION = -2145071094_i32
  WU_E_SETUP_BLOCKED_CONFIGURATION = -2145071093_i32
  WU_E_SETUP_REBOOT_TO_FIX = -2145071092_i32
  WU_E_SETUP_ALREADYRUNNING = -2145071091_i32
  WU_E_SETUP_REBOOTREQUIRED = -2145071090_i32
  WU_E_SETUP_HANDLER_EXEC_FAILURE = -2145071089_i32
  WU_E_SETUP_INVALID_REGISTRY_DATA = -2145071088_i32
  WU_E_SELFUPDATE_REQUIRED = -2145071087_i32
  WU_E_SELFUPDATE_REQUIRED_ADMIN = -2145071086_i32
  WU_E_SETUP_WRONG_SERVER_VERSION = -2145071085_i32
  WU_E_SETUP_DEFERRABLE_REBOOT_PENDING = -2145071084_i32
  WU_E_SETUP_NON_DEFERRABLE_REBOOT_PENDING = -2145071083_i32
  WU_E_SETUP_FAIL = -2145071082_i32
  WU_E_SETUP_UNEXPECTED = -2145067009_i32
  WU_E_EE_UNKNOWN_EXPRESSION = -2145067007_i32
  WU_E_EE_INVALID_EXPRESSION = -2145067006_i32
  WU_E_EE_MISSING_METADATA = -2145067005_i32
  WU_E_EE_INVALID_VERSION = -2145067004_i32
  WU_E_EE_NOT_INITIALIZED = -2145067003_i32
  WU_E_EE_INVALID_ATTRIBUTEDATA = -2145067002_i32
  WU_E_EE_CLUSTER_ERROR = -2145067001_i32
  WU_E_EE_UNEXPECTED = -2145062913_i32
  WU_E_INSTALLATION_RESULTS_UNKNOWN_VERSION = -2145112063_i32
  WU_E_INSTALLATION_RESULTS_INVALID_DATA = -2145112062_i32
  WU_E_INSTALLATION_RESULTS_NOT_FOUND = -2145112061_i32
  WU_E_TRAYICON_FAILURE = -2145112060_i32
  WU_E_NON_UI_MODE = -2145107971_i32
  WU_E_WUCLTUI_UNSUPPORTED_VERSION = -2145107970_i32
  WU_E_AUCLIENT_UNEXPECTED = -2145107969_i32
  WU_E_REPORTER_EVENTCACHECORRUPT = -2145062911_i32
  WU_E_REPORTER_EVENTNAMESPACEPARSEFAILED = -2145062910_i32
  WU_E_INVALID_EVENT = -2145062909_i32
  WU_E_SERVER_BUSY = -2145062908_i32
  WU_E_CALLBACK_COOKIE_NOT_FOUND = -2145062907_i32
  WU_E_REPORTER_UNEXPECTED = -2145058817_i32
  WU_E_OL_INVALID_SCANFILE = -2145095679_i32
  WU_E_OL_NEWCLIENT_REQUIRED = -2145095678_i32
  WU_E_INVALID_EVENT_PAYLOAD = -2145095677_i32
  WU_E_INVALID_EVENT_PAYLOADSIZE = -2145095676_i32
  WU_E_SERVICE_NOT_REGISTERED = -2145095675_i32
  WU_E_OL_UNEXPECTED = -2145091585_i32
  WU_E_METADATA_NOOP = -2145095424_i32
  WU_E_METADATA_CONFIG_INVALID_BINARY_ENCODING = -2145095423_i32
  WU_E_METADATA_FETCH_CONFIG = -2145095422_i32
  WU_E_METADATA_INVALID_PARAMETER = -2145095420_i32
  WU_E_METADATA_UNEXPECTED = -2145095419_i32
  WU_E_METADATA_NO_VERIFICATION_DATA = -2145095418_i32
  WU_E_METADATA_BAD_FRAGMENTSIGNING_CONFIG = -2145095417_i32
  WU_E_METADATA_FAILURE_PROCESSING_FRAGMENTSIGNING_CONFIG = -2145095416_i32
  WU_E_METADATA_XML_MISSING = -2145095392_i32
  WU_E_METADATA_XML_FRAGMENTSIGNING_MISSING = -2145095391_i32
  WU_E_METADATA_XML_MODE_MISSING = -2145095390_i32
  WU_E_METADATA_XML_MODE_INVALID = -2145095389_i32
  WU_E_METADATA_XML_VALIDITY_INVALID = -2145095388_i32
  WU_E_METADATA_XML_LEAFCERT_MISSING = -2145095387_i32
  WU_E_METADATA_XML_INTERMEDIATECERT_MISSING = -2145095386_i32
  WU_E_METADATA_XML_LEAFCERT_ID_MISSING = -2145095385_i32
  WU_E_METADATA_XML_BASE64CERDATA_MISSING = -2145095384_i32
  WU_E_METADATA_BAD_SIGNATURE = -2145095360_i32
  WU_E_METADATA_UNSUPPORTED_HASH_ALG = -2145095359_i32
  WU_E_METADATA_SIGNATURE_VERIFY_FAILED = -2145095358_i32
  WU_E_METADATATRUST_CERTIFICATECHAIN_VERIFICATION = -2145095344_i32
  WU_E_METADATATRUST_UNTRUSTED_CERTIFICATECHAIN = -2145095343_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_MISSING = -2145095328_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_VERIFICATION_FAILED = -2145095327_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_UNTRUSTED = -2145095326_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_VALIDITY_WINDOW = -2145095325_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_SIGNATURE = -2145095324_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_CERTCHAIN = -2145095323_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_REFRESHONLINE = -2145095322_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_ALL_BAD = -2145095321_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_NODATA = -2145095320_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_CACHELOOKUP = -2145095319_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_VALIDITYWINDOW_UNEXPECTED = -2145095298_i32
  WU_E_METADATA_TIMESTAMP_TOKEN_UNEXPECTED = -2145095297_i32
  WU_E_METADATA_CERT_MISSING = -2145095296_i32
  WU_E_METADATA_LEAFCERT_BAD_TRANSPORT_ENCODING = -2145095295_i32
  WU_E_METADATA_INTCERT_BAD_TRANSPORT_ENCODING = -2145095294_i32
  WU_E_METADATA_CERT_UNTRUSTED = -2145095293_i32
  WU_E_WUTASK_INPROGRESS = -2145079295_i32
  WU_E_WUTASK_STATUS_DISABLED = -2145079294_i32
  WU_E_WUTASK_NOT_STARTED = -2145079293_i32
  WU_E_WUTASK_RETRY = -2145079292_i32
  WU_E_WUTASK_CANCELINSTALL_DISALLOWED = -2145079291_i32
  WU_E_UNKNOWN_HARDWARECAPABILITY = -2145079039_i32
  WU_E_BAD_XML_HARDWARECAPABILITY = -2145079038_i32
  WU_E_WMI_NOT_SUPPORTED = -2145079037_i32
  WU_E_UPDATE_MERGE_NOT_ALLOWED = -2145079036_i32
  WU_E_SKIPPED_UPDATE_INSTALLATION = -2145079035_i32
  WU_E_SLS_INVALID_REVISION = -2145078783_i32
  WU_E_FILETRUST_DUALSIGNATURE_RSA = -2145078527_i32
  WU_E_FILETRUST_DUALSIGNATURE_ECC = -2145078526_i32
  WU_E_TRUST_SUBJECT_NOT_TRUSTED = -2145078525_i32
  WU_E_TRUST_PROVIDER_UNKNOWN = -2145078524_i32

  CLSID_StringCollection = LibC::GUID.new(0x72c97d74_u32, 0x7c3b_u16, 0x40ae_u16, StaticArray[0xb7_u8, 0x7d_u8, 0xab_u8, 0xdb_u8, 0x22_u8, 0xeb_u8, 0xa6_u8, 0xfb_u8])

  CLSID_UpdateSearcher = LibC::GUID.new(0xb699e5e8_u32, 0x67ff_u16, 0x4177_u16, StaticArray[0x88_u8, 0xb0_u8, 0x36_u8, 0x84_u8, 0xa3_u8, 0x38_u8, 0x8b_u8, 0xfb_u8])

  CLSID_WebProxy = LibC::GUID.new(0x650503cf_u32, 0x9108_u16, 0x4ddc_u16, StaticArray[0xa2_u8, 0xce_u8, 0x6c_u8, 0x23_u8, 0x41_u8, 0xe1_u8, 0xc5_u8, 0x82_u8])

  CLSID_SystemInformation = LibC::GUID.new(0xc01b9ba0_u32, 0xbea7_u16, 0x41ba_u16, StaticArray[0xb6_u8, 0x4_u8, 0xd0_u8, 0xa3_u8, 0x6f_u8, 0x46_u8, 0x91_u8, 0x33_u8])

  CLSID_WindowsUpdateAgentInfo = LibC::GUID.new(0xc2e88c2f_u32, 0x6f5b_u16, 0x4aaa_u16, StaticArray[0x89_u8, 0x4b_u8, 0x55_u8, 0xc8_u8, 0x47_u8, 0xad_u8, 0x3a_u8, 0x2d_u8])

  CLSID_AutomaticUpdates = LibC::GUID.new(0xbfe18e9c_u32, 0x6d87_u16, 0x4450_u16, StaticArray[0xb3_u8, 0x7c_u8, 0xe0_u8, 0x2f_u8, 0xb_u8, 0x37_u8, 0x38_u8, 0x3_u8])

  CLSID_UpdateCollection = LibC::GUID.new(0x13639463_u32, 0xdb_u16, 0x4646_u16, StaticArray[0x80_u8, 0x3d_u8, 0x52_u8, 0x80_u8, 0x26_u8, 0x14_u8, 0xd_u8, 0x88_u8])

  CLSID_UpdateDownloader = LibC::GUID.new(0x5baf654a_u32, 0x5a07_u16, 0x4264_u16, StaticArray[0xa2_u8, 0x55_u8, 0x9f_u8, 0xf5_u8, 0x4c_u8, 0x71_u8, 0x51_u8, 0xe7_u8])

  CLSID_UpdateInstaller = LibC::GUID.new(0xd2e0fe7f_u32, 0xd23e_u16, 0x48e1_u16, StaticArray[0x93_u8, 0xc0_u8, 0x6f_u8, 0xa8_u8, 0xcc_u8, 0x34_u8, 0x64_u8, 0x74_u8])

  CLSID_UpdateSession = LibC::GUID.new(0x4cb43d7f_u32, 0x7eee_u16, 0x4906_u16, StaticArray[0x86_u8, 0x98_u8, 0x60_u8, 0xda_u8, 0x1c_u8, 0x38_u8, 0xf2_u8, 0xfe_u8])

  CLSID_UpdateServiceManager = LibC::GUID.new(0xf8d253d9_u32, 0x89a4_u16, 0x4daa_u16, StaticArray[0x87_u8, 0xb6_u8, 0x11_u8, 0x68_u8, 0x36_u8, 0x9f_u8, 0xb_u8, 0x21_u8])

  CLSID_InstallationAgent = LibC::GUID.new(0x317e92fc_u32, 0x1679_u16, 0x46fd_u16, StaticArray[0xa0_u8, 0xb5_u8, 0xf0_u8, 0x89_u8, 0x14_u8, 0xdd_u8, 0x86_u8, 0x23_u8])

  enum AutomaticUpdatesNotificationLevel
    Aunlnotconfigured = 0_i32
    Aunldisabled = 1_i32
    Aunlnotifybeforedownload = 2_i32
    Aunlnotifybeforeinstallation = 3_i32
    Aunlscheduledinstallation = 4_i32
  end
  enum AutomaticUpdatesScheduledInstallationDay
    Ausideveryday = 0_i32
    Ausideverysunday = 1_i32
    Ausideverymonday = 2_i32
    Ausideverytuesday = 3_i32
    Ausideverywednesday = 4_i32
    Ausideverythursday = 5_i32
    Ausideveryfriday = 6_i32
    Ausideverysaturday = 7_i32
  end
  enum DownloadPhase
    Dphinitializing = 1_i32
    Dphdownloading = 2_i32
    Dphverifying = 3_i32
  end
  enum DownloadPriority
    Dplow = 1_i32
    Dpnormal = 2_i32
    Dphigh = 3_i32
    Dpextrahigh = 4_i32
  end
  enum AutoSelectionMode
    Asletwindowsupdatedecide = 0_i32
    Asautoselectifdownloaded = 1_i32
    Asneverautoselect = 2_i32
    Asalwaysautoselect = 3_i32
  end
  enum AutoDownloadMode
    Adletwindowsupdatedecide = 0_i32
    Adneverautodownload = 1_i32
    Adalwaysautodownload = 2_i32
  end
  enum InstallationImpact
    Iinormal = 0_i32
    Iiminor = 1_i32
    Iirequiresexclusivehandling = 2_i32
  end
  enum InstallationRebootBehavior
    Irbneverreboots = 0_i32
    Irbalwaysrequiresreboot = 1_i32
    Irbcanrequestreboot = 2_i32
  end
  enum OperationResultCode
    Orcnotstarted = 0_i32
    Orcinprogress = 1_i32
    Orcsucceeded = 2_i32
    Orcsucceededwitherrors = 3_i32
    Orcfailed = 4_i32
    Orcaborted = 5_i32
  end
  enum ServerSelection
    Ssdefault = 0_i32
    Ssmanagedserver = 1_i32
    Sswindowsupdate = 2_i32
    Ssothers = 3_i32
  end
  enum UpdateType
    Utsoftware = 1_i32
    Utdriver = 2_i32
  end
  enum UpdateOperation
    Uoinstallation = 1_i32
    Uouninstallation = 2_i32
  end
  enum DeploymentAction
    Danone = 0_i32
    Dainstallation = 1_i32
    Dauninstallation = 2_i32
    Dadetection = 3_i32
    Daoptionalinstallation = 4_i32
  end
  enum UpdateExceptionContext
    Uecgeneral = 1_i32
    Uecwindowsdriver = 2_i32
    Uecwindowsinstaller = 3_i32
    Uecsearchincomplete = 4_i32
  end
  enum AutomaticUpdatesUserType
    Auutcurrentuser = 1_i32
    Auutlocaladministrator = 2_i32
  end
  enum AutomaticUpdatesPermissionType
    Auptsetnotificationlevel = 1_i32
    Auptdisableautomaticupdates = 2_i32
    Auptsetincluderecommendedupdates = 3_i32
    Auptsetfeaturedupdatesenabled = 4_i32
    Auptsetnonadministratorselevated = 5_i32
  end
  enum UpdateServiceRegistrationState
    Usrsnotregistered = 1_i32
    Usrsregistrationpending = 2_i32
    Usrsregistered = 3_i32
  end
  enum SearchScope
    Searchscopedefault = 0_i32
    Searchscopemachineonly = 1_i32
    Searchscopecurrentuseronly = 2_i32
    Searchscopemachineandcurrentuser = 3_i32
    Searchscopemachineandallusers = 4_i32
    Searchscopeallusers = 5_i32
  end
  enum UpdateLockdownOption
    Uloforwebsiteaccess = 1_i32
  end
  enum AddServiceFlag
    Asfallowpendingregistration = 1_i32
    Asfallowonlineregistration = 2_i32
    Asfregisterservicewithau = 4_i32
  end
  enum UpdateServiceOption
    Usononvolatileservice = 1_i32
  end

  @[Extern]
  record IUpdateLockdownVtbl,
    query_interface : Proc(IUpdateLockdown*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateLockdown*, UInt32),
    release : Proc(IUpdateLockdown*, UInt32),
    lock_down : Proc(IUpdateLockdown*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a976c28d-75a1-42aa-94ae-8af8b872089a")]
  record IUpdateLockdown, lpVtbl : IUpdateLockdownVtbl* do
    GUID = LibC::GUID.new(0xa976c28d_u32, 0x75a1_u16, 0x42aa_u16, StaticArray[0x94_u8, 0xae_u8, 0x8a_u8, 0xf8_u8, 0xb8_u8, 0x72_u8, 0x8_u8, 0x9a_u8])
    def query_interface(this : IUpdateLockdown*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateLockdown*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateLockdown*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def lock_down(this : IUpdateLockdown*, flags : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_down.call(this, flags)
    end

  end

  @[Extern]
  record IStringCollectionVtbl,
    query_interface : Proc(IStringCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStringCollection*, UInt32),
    release : Proc(IStringCollection*, UInt32),
    get_type_info_count : Proc(IStringCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IStringCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IStringCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IStringCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IStringCollection*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Item : Proc(IStringCollection*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IStringCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IStringCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IStringCollection*, Int16*, Win32cr::Foundation::HRESULT),
    add : Proc(IStringCollection*, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    clear : Proc(IStringCollection*, Win32cr::Foundation::HRESULT),
    copy : Proc(IStringCollection*, Void**, Win32cr::Foundation::HRESULT),
    insert : Proc(IStringCollection*, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IStringCollection*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eff90582-2ddc-480f-a06d-60f3fbc362c3")]
  record IStringCollection, lpVtbl : IStringCollectionVtbl* do
    GUID = LibC::GUID.new(0xeff90582_u32, 0x2ddc_u16, 0x480f_u16, StaticArray[0xa0_u8, 0x6d_u8, 0x60_u8, 0xf3_u8, 0xfb_u8, 0xc3_u8, 0x62_u8, 0xc3_u8])
    def query_interface(this : IStringCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStringCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStringCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IStringCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IStringCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IStringCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IStringCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IStringCollection*, index : Int32, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def put_Item(this : IStringCollection*, index : Int32, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Item.call(this, index, value)
    end
    def get__NewEnum(this : IStringCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IStringCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end
    def get_ReadOnly(this : IStringCollection*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def add(this : IStringCollection*, value : Win32cr::Foundation::BSTR, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, value, retval)
    end
    def clear(this : IStringCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def copy(this : IStringCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, retval)
    end
    def insert(this : IStringCollection*, index : Int32, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, index, value)
    end
    def remove_at(this : IStringCollection*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end

  end

  @[Extern]
  record IWebProxyVtbl,
    query_interface : Proc(IWebProxy*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWebProxy*, UInt32),
    release : Proc(IWebProxy*, UInt32),
    get_type_info_count : Proc(IWebProxy*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWebProxy*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWebProxy*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWebProxy*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Address : Proc(IWebProxy*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Address : Proc(IWebProxy*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_BypassList : Proc(IWebProxy*, Void**, Win32cr::Foundation::HRESULT),
    put_BypassList : Proc(IWebProxy*, Void*, Win32cr::Foundation::HRESULT),
    get_BypassProxyOnLocal : Proc(IWebProxy*, Int16*, Win32cr::Foundation::HRESULT),
    put_BypassProxyOnLocal : Proc(IWebProxy*, Int16, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IWebProxy*, Int16*, Win32cr::Foundation::HRESULT),
    get_UserName : Proc(IWebProxy*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_UserName : Proc(IWebProxy*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_password : Proc(IWebProxy*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    prompt_for_credentials : Proc(IWebProxy*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    prompt_for_credentials_from_hwnd : Proc(IWebProxy*, Win32cr::Foundation::HWND, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AutoDetect : Proc(IWebProxy*, Int16*, Win32cr::Foundation::HRESULT),
    put_AutoDetect : Proc(IWebProxy*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("174c81fe-aecd-4dae-b8a0-2c6318dd86a8")]
  record IWebProxy, lpVtbl : IWebProxyVtbl* do
    GUID = LibC::GUID.new(0x174c81fe_u32, 0xaecd_u16, 0x4dae_u16, StaticArray[0xb8_u8, 0xa0_u8, 0x2c_u8, 0x63_u8, 0x18_u8, 0xdd_u8, 0x86_u8, 0xa8_u8])
    def query_interface(this : IWebProxy*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWebProxy*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWebProxy*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWebProxy*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWebProxy*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWebProxy*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWebProxy*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Address(this : IWebProxy*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Address.call(this, retval)
    end
    def put_Address(this : IWebProxy*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Address.call(this, value)
    end
    def get_BypassList(this : IWebProxy*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BypassList.call(this, retval)
    end
    def put_BypassList(this : IWebProxy*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BypassList.call(this, value)
    end
    def get_BypassProxyOnLocal(this : IWebProxy*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BypassProxyOnLocal.call(this, retval)
    end
    def put_BypassProxyOnLocal(this : IWebProxy*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BypassProxyOnLocal.call(this, value)
    end
    def get_ReadOnly(this : IWebProxy*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_UserName(this : IWebProxy*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserName.call(this, retval)
    end
    def put_UserName(this : IWebProxy*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserName.call(this, value)
    end
    def set_password(this : IWebProxy*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_password.call(this, value)
    end
    def prompt_for_credentials(this : IWebProxy*, parentWindow : Void*, title : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prompt_for_credentials.call(this, parentWindow, title)
    end
    def prompt_for_credentials_from_hwnd(this : IWebProxy*, parentWindow : Win32cr::Foundation::HWND, title : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prompt_for_credentials_from_hwnd.call(this, parentWindow, title)
    end
    def get_AutoDetect(this : IWebProxy*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoDetect.call(this, retval)
    end
    def put_AutoDetect(this : IWebProxy*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoDetect.call(this, value)
    end

  end

  @[Extern]
  record ISystemInformationVtbl,
    query_interface : Proc(ISystemInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISystemInformation*, UInt32),
    release : Proc(ISystemInformation*, UInt32),
    get_type_info_count : Proc(ISystemInformation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISystemInformation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISystemInformation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISystemInformation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_OemHardwareSupportLink : Proc(ISystemInformation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(ISystemInformation*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ade87bf7-7b56-4275-8fab-b9b0e591844b")]
  record ISystemInformation, lpVtbl : ISystemInformationVtbl* do
    GUID = LibC::GUID.new(0xade87bf7_u32, 0x7b56_u16, 0x4275_u16, StaticArray[0x8f_u8, 0xab_u8, 0xb9_u8, 0xb0_u8, 0xe5_u8, 0x91_u8, 0x84_u8, 0x4b_u8])
    def query_interface(this : ISystemInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISystemInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISystemInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISystemInformation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISystemInformation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISystemInformation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISystemInformation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_OemHardwareSupportLink(this : ISystemInformation*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OemHardwareSupportLink.call(this, retval)
    end
    def get_RebootRequired(this : ISystemInformation*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsUpdateAgentInfoVtbl,
    query_interface : Proc(IWindowsUpdateAgentInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsUpdateAgentInfo*, UInt32),
    release : Proc(IWindowsUpdateAgentInfo*, UInt32),
    get_type_info_count : Proc(IWindowsUpdateAgentInfo*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsUpdateAgentInfo*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsUpdateAgentInfo*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsUpdateAgentInfo*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_info : Proc(IWindowsUpdateAgentInfo*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85713fa1-7796-4fa2-be3b-e2d6124dd373")]
  record IWindowsUpdateAgentInfo, lpVtbl : IWindowsUpdateAgentInfoVtbl* do
    GUID = LibC::GUID.new(0x85713fa1_u32, 0x7796_u16, 0x4fa2_u16, StaticArray[0xbe_u8, 0x3b_u8, 0xe2_u8, 0xd6_u8, 0x12_u8, 0x4d_u8, 0xd3_u8, 0x73_u8])
    def query_interface(this : IWindowsUpdateAgentInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsUpdateAgentInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsUpdateAgentInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsUpdateAgentInfo*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsUpdateAgentInfo*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsUpdateAgentInfo*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsUpdateAgentInfo*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_info(this : IWindowsUpdateAgentInfo*, varInfoIdentifier : Win32cr::System::Com::VARIANT, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, varInfoIdentifier, retval)
    end

  end

  @[Extern]
  record IAutomaticUpdatesResultsVtbl,
    query_interface : Proc(IAutomaticUpdatesResults*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAutomaticUpdatesResults*, UInt32),
    release : Proc(IAutomaticUpdatesResults*, UInt32),
    get_type_info_count : Proc(IAutomaticUpdatesResults*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAutomaticUpdatesResults*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAutomaticUpdatesResults*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAutomaticUpdatesResults*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LastSearchSuccessDate : Proc(IAutomaticUpdatesResults*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_LastInstallationSuccessDate : Proc(IAutomaticUpdatesResults*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e7a4d634-7942-4dd9-a111-82228ba33901")]
  record IAutomaticUpdatesResults, lpVtbl : IAutomaticUpdatesResultsVtbl* do
    GUID = LibC::GUID.new(0xe7a4d634_u32, 0x7942_u16, 0x4dd9_u16, StaticArray[0xa1_u8, 0x11_u8, 0x82_u8, 0x22_u8, 0x8b_u8, 0xa3_u8, 0x39_u8, 0x1_u8])
    def query_interface(this : IAutomaticUpdatesResults*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAutomaticUpdatesResults*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAutomaticUpdatesResults*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAutomaticUpdatesResults*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAutomaticUpdatesResults*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAutomaticUpdatesResults*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAutomaticUpdatesResults*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_LastSearchSuccessDate(this : IAutomaticUpdatesResults*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastSearchSuccessDate.call(this, retval)
    end
    def get_LastInstallationSuccessDate(this : IAutomaticUpdatesResults*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastInstallationSuccessDate.call(this, retval)
    end

  end

  @[Extern]
  record IAutomaticUpdatesSettingsVtbl,
    query_interface : Proc(IAutomaticUpdatesSettings*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAutomaticUpdatesSettings*, UInt32),
    release : Proc(IAutomaticUpdatesSettings*, UInt32),
    get_type_info_count : Proc(IAutomaticUpdatesSettings*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAutomaticUpdatesSettings*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAutomaticUpdatesSettings*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAutomaticUpdatesSettings*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NotificationLevel : Proc(IAutomaticUpdatesSettings*, Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel*, Win32cr::Foundation::HRESULT),
    put_NotificationLevel : Proc(IAutomaticUpdatesSettings*, Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IAutomaticUpdatesSettings*, Int16*, Win32cr::Foundation::HRESULT),
    get_Required : Proc(IAutomaticUpdatesSettings*, Int16*, Win32cr::Foundation::HRESULT),
    get_ScheduledInstallationDay : Proc(IAutomaticUpdatesSettings*, Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay*, Win32cr::Foundation::HRESULT),
    put_ScheduledInstallationDay : Proc(IAutomaticUpdatesSettings*, Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay, Win32cr::Foundation::HRESULT),
    get_ScheduledInstallationTime : Proc(IAutomaticUpdatesSettings*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScheduledInstallationTime : Proc(IAutomaticUpdatesSettings*, Int32, Win32cr::Foundation::HRESULT),
    refresh : Proc(IAutomaticUpdatesSettings*, Win32cr::Foundation::HRESULT),
    save : Proc(IAutomaticUpdatesSettings*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2ee48f22-af3c-405f-8970-f71be12ee9a2")]
  record IAutomaticUpdatesSettings, lpVtbl : IAutomaticUpdatesSettingsVtbl* do
    GUID = LibC::GUID.new(0x2ee48f22_u32, 0xaf3c_u16, 0x405f_u16, StaticArray[0x89_u8, 0x70_u8, 0xf7_u8, 0x1b_u8, 0xe1_u8, 0x2e_u8, 0xe9_u8, 0xa2_u8])
    def query_interface(this : IAutomaticUpdatesSettings*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAutomaticUpdatesSettings*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAutomaticUpdatesSettings*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAutomaticUpdatesSettings*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAutomaticUpdatesSettings*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAutomaticUpdatesSettings*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAutomaticUpdatesSettings*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_NotificationLevel(this : IAutomaticUpdatesSettings*, retval : Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NotificationLevel.call(this, retval)
    end
    def put_NotificationLevel(this : IAutomaticUpdatesSettings*, value : Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NotificationLevel.call(this, value)
    end
    def get_ReadOnly(this : IAutomaticUpdatesSettings*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_Required(this : IAutomaticUpdatesSettings*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Required.call(this, retval)
    end
    def get_ScheduledInstallationDay(this : IAutomaticUpdatesSettings*, retval : Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledInstallationDay.call(this, retval)
    end
    def put_ScheduledInstallationDay(this : IAutomaticUpdatesSettings*, value : Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduledInstallationDay.call(this, value)
    end
    def get_ScheduledInstallationTime(this : IAutomaticUpdatesSettings*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledInstallationTime.call(this, retval)
    end
    def put_ScheduledInstallationTime(this : IAutomaticUpdatesSettings*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduledInstallationTime.call(this, value)
    end
    def refresh(this : IAutomaticUpdatesSettings*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IAutomaticUpdatesSettings*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end

  end

  @[Extern]
  record IAutomaticUpdatesSettings2Vtbl,
    query_interface : Proc(IAutomaticUpdatesSettings2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAutomaticUpdatesSettings2*, UInt32),
    release : Proc(IAutomaticUpdatesSettings2*, UInt32),
    get_type_info_count : Proc(IAutomaticUpdatesSettings2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAutomaticUpdatesSettings2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAutomaticUpdatesSettings2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAutomaticUpdatesSettings2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NotificationLevel : Proc(IAutomaticUpdatesSettings2*, Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel*, Win32cr::Foundation::HRESULT),
    put_NotificationLevel : Proc(IAutomaticUpdatesSettings2*, Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IAutomaticUpdatesSettings2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Required : Proc(IAutomaticUpdatesSettings2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ScheduledInstallationDay : Proc(IAutomaticUpdatesSettings2*, Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay*, Win32cr::Foundation::HRESULT),
    put_ScheduledInstallationDay : Proc(IAutomaticUpdatesSettings2*, Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay, Win32cr::Foundation::HRESULT),
    get_ScheduledInstallationTime : Proc(IAutomaticUpdatesSettings2*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScheduledInstallationTime : Proc(IAutomaticUpdatesSettings2*, Int32, Win32cr::Foundation::HRESULT),
    refresh : Proc(IAutomaticUpdatesSettings2*, Win32cr::Foundation::HRESULT),
    save : Proc(IAutomaticUpdatesSettings2*, Win32cr::Foundation::HRESULT),
    get_IncludeRecommendedUpdates : Proc(IAutomaticUpdatesSettings2*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncludeRecommendedUpdates : Proc(IAutomaticUpdatesSettings2*, Int16, Win32cr::Foundation::HRESULT),
    check_permission : Proc(IAutomaticUpdatesSettings2*, Win32cr::System::UpdateAgent::AutomaticUpdatesUserType, Win32cr::System::UpdateAgent::AutomaticUpdatesPermissionType, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6abc136a-c3ca-4384-8171-cb2b1e59b8dc")]
  record IAutomaticUpdatesSettings2, lpVtbl : IAutomaticUpdatesSettings2Vtbl* do
    GUID = LibC::GUID.new(0x6abc136a_u32, 0xc3ca_u16, 0x4384_u16, StaticArray[0x81_u8, 0x71_u8, 0xcb_u8, 0x2b_u8, 0x1e_u8, 0x59_u8, 0xb8_u8, 0xdc_u8])
    def query_interface(this : IAutomaticUpdatesSettings2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAutomaticUpdatesSettings2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAutomaticUpdatesSettings2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAutomaticUpdatesSettings2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAutomaticUpdatesSettings2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAutomaticUpdatesSettings2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAutomaticUpdatesSettings2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_NotificationLevel(this : IAutomaticUpdatesSettings2*, retval : Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NotificationLevel.call(this, retval)
    end
    def put_NotificationLevel(this : IAutomaticUpdatesSettings2*, value : Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NotificationLevel.call(this, value)
    end
    def get_ReadOnly(this : IAutomaticUpdatesSettings2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_Required(this : IAutomaticUpdatesSettings2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Required.call(this, retval)
    end
    def get_ScheduledInstallationDay(this : IAutomaticUpdatesSettings2*, retval : Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledInstallationDay.call(this, retval)
    end
    def put_ScheduledInstallationDay(this : IAutomaticUpdatesSettings2*, value : Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduledInstallationDay.call(this, value)
    end
    def get_ScheduledInstallationTime(this : IAutomaticUpdatesSettings2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledInstallationTime.call(this, retval)
    end
    def put_ScheduledInstallationTime(this : IAutomaticUpdatesSettings2*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduledInstallationTime.call(this, value)
    end
    def refresh(this : IAutomaticUpdatesSettings2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IAutomaticUpdatesSettings2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_IncludeRecommendedUpdates(this : IAutomaticUpdatesSettings2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludeRecommendedUpdates.call(this, retval)
    end
    def put_IncludeRecommendedUpdates(this : IAutomaticUpdatesSettings2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludeRecommendedUpdates.call(this, value)
    end
    def check_permission(this : IAutomaticUpdatesSettings2*, userType : Win32cr::System::UpdateAgent::AutomaticUpdatesUserType, permissionType : Win32cr::System::UpdateAgent::AutomaticUpdatesPermissionType, userHasPermission : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_permission.call(this, userType, permissionType, userHasPermission)
    end

  end

  @[Extern]
  record IAutomaticUpdatesSettings3Vtbl,
    query_interface : Proc(IAutomaticUpdatesSettings3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAutomaticUpdatesSettings3*, UInt32),
    release : Proc(IAutomaticUpdatesSettings3*, UInt32),
    get_type_info_count : Proc(IAutomaticUpdatesSettings3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAutomaticUpdatesSettings3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAutomaticUpdatesSettings3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAutomaticUpdatesSettings3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_NotificationLevel : Proc(IAutomaticUpdatesSettings3*, Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel*, Win32cr::Foundation::HRESULT),
    put_NotificationLevel : Proc(IAutomaticUpdatesSettings3*, Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IAutomaticUpdatesSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Required : Proc(IAutomaticUpdatesSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    get_ScheduledInstallationDay : Proc(IAutomaticUpdatesSettings3*, Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay*, Win32cr::Foundation::HRESULT),
    put_ScheduledInstallationDay : Proc(IAutomaticUpdatesSettings3*, Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay, Win32cr::Foundation::HRESULT),
    get_ScheduledInstallationTime : Proc(IAutomaticUpdatesSettings3*, Int32*, Win32cr::Foundation::HRESULT),
    put_ScheduledInstallationTime : Proc(IAutomaticUpdatesSettings3*, Int32, Win32cr::Foundation::HRESULT),
    refresh : Proc(IAutomaticUpdatesSettings3*, Win32cr::Foundation::HRESULT),
    save : Proc(IAutomaticUpdatesSettings3*, Win32cr::Foundation::HRESULT),
    get_IncludeRecommendedUpdates : Proc(IAutomaticUpdatesSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncludeRecommendedUpdates : Proc(IAutomaticUpdatesSettings3*, Int16, Win32cr::Foundation::HRESULT),
    check_permission : Proc(IAutomaticUpdatesSettings3*, Win32cr::System::UpdateAgent::AutomaticUpdatesUserType, Win32cr::System::UpdateAgent::AutomaticUpdatesPermissionType, Int16*, Win32cr::Foundation::HRESULT),
    get_NonAdministratorsElevated : Proc(IAutomaticUpdatesSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_NonAdministratorsElevated : Proc(IAutomaticUpdatesSettings3*, Int16, Win32cr::Foundation::HRESULT),
    get_FeaturedUpdatesEnabled : Proc(IAutomaticUpdatesSettings3*, Int16*, Win32cr::Foundation::HRESULT),
    put_FeaturedUpdatesEnabled : Proc(IAutomaticUpdatesSettings3*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b587f5c3-f57e-485f-bbf5-0d181c5cd0dc")]
  record IAutomaticUpdatesSettings3, lpVtbl : IAutomaticUpdatesSettings3Vtbl* do
    GUID = LibC::GUID.new(0xb587f5c3_u32, 0xf57e_u16, 0x485f_u16, StaticArray[0xbb_u8, 0xf5_u8, 0xd_u8, 0x18_u8, 0x1c_u8, 0x5c_u8, 0xd0_u8, 0xdc_u8])
    def query_interface(this : IAutomaticUpdatesSettings3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAutomaticUpdatesSettings3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAutomaticUpdatesSettings3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAutomaticUpdatesSettings3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAutomaticUpdatesSettings3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAutomaticUpdatesSettings3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAutomaticUpdatesSettings3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_NotificationLevel(this : IAutomaticUpdatesSettings3*, retval : Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NotificationLevel.call(this, retval)
    end
    def put_NotificationLevel(this : IAutomaticUpdatesSettings3*, value : Win32cr::System::UpdateAgent::AutomaticUpdatesNotificationLevel) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NotificationLevel.call(this, value)
    end
    def get_ReadOnly(this : IAutomaticUpdatesSettings3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_Required(this : IAutomaticUpdatesSettings3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Required.call(this, retval)
    end
    def get_ScheduledInstallationDay(this : IAutomaticUpdatesSettings3*, retval : Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledInstallationDay.call(this, retval)
    end
    def put_ScheduledInstallationDay(this : IAutomaticUpdatesSettings3*, value : Win32cr::System::UpdateAgent::AutomaticUpdatesScheduledInstallationDay) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduledInstallationDay.call(this, value)
    end
    def get_ScheduledInstallationTime(this : IAutomaticUpdatesSettings3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledInstallationTime.call(this, retval)
    end
    def put_ScheduledInstallationTime(this : IAutomaticUpdatesSettings3*, value : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduledInstallationTime.call(this, value)
    end
    def refresh(this : IAutomaticUpdatesSettings3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IAutomaticUpdatesSettings3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_IncludeRecommendedUpdates(this : IAutomaticUpdatesSettings3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludeRecommendedUpdates.call(this, retval)
    end
    def put_IncludeRecommendedUpdates(this : IAutomaticUpdatesSettings3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludeRecommendedUpdates.call(this, value)
    end
    def check_permission(this : IAutomaticUpdatesSettings3*, userType : Win32cr::System::UpdateAgent::AutomaticUpdatesUserType, permissionType : Win32cr::System::UpdateAgent::AutomaticUpdatesPermissionType, userHasPermission : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_permission.call(this, userType, permissionType, userHasPermission)
    end
    def get_NonAdministratorsElevated(this : IAutomaticUpdatesSettings3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NonAdministratorsElevated.call(this, retval)
    end
    def put_NonAdministratorsElevated(this : IAutomaticUpdatesSettings3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NonAdministratorsElevated.call(this, value)
    end
    def get_FeaturedUpdatesEnabled(this : IAutomaticUpdatesSettings3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FeaturedUpdatesEnabled.call(this, retval)
    end
    def put_FeaturedUpdatesEnabled(this : IAutomaticUpdatesSettings3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FeaturedUpdatesEnabled.call(this, value)
    end

  end

  @[Extern]
  record IAutomaticUpdatesVtbl,
    query_interface : Proc(IAutomaticUpdates*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAutomaticUpdates*, UInt32),
    release : Proc(IAutomaticUpdates*, UInt32),
    get_type_info_count : Proc(IAutomaticUpdates*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAutomaticUpdates*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAutomaticUpdates*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAutomaticUpdates*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    detect_now : Proc(IAutomaticUpdates*, Win32cr::Foundation::HRESULT),
    pause : Proc(IAutomaticUpdates*, Win32cr::Foundation::HRESULT),
    resume : Proc(IAutomaticUpdates*, Win32cr::Foundation::HRESULT),
    show_settings_dialog : Proc(IAutomaticUpdates*, Win32cr::Foundation::HRESULT),
    get_Settings : Proc(IAutomaticUpdates*, Void**, Win32cr::Foundation::HRESULT),
    get_ServiceEnabled : Proc(IAutomaticUpdates*, Int16*, Win32cr::Foundation::HRESULT),
    enable_service : Proc(IAutomaticUpdates*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("673425bf-c082-4c7c-bdfd-569464b8e0ce")]
  record IAutomaticUpdates, lpVtbl : IAutomaticUpdatesVtbl* do
    GUID = LibC::GUID.new(0x673425bf_u32, 0xc082_u16, 0x4c7c_u16, StaticArray[0xbd_u8, 0xfd_u8, 0x56_u8, 0x94_u8, 0x64_u8, 0xb8_u8, 0xe0_u8, 0xce_u8])
    def query_interface(this : IAutomaticUpdates*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAutomaticUpdates*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAutomaticUpdates*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAutomaticUpdates*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAutomaticUpdates*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAutomaticUpdates*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAutomaticUpdates*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def detect_now(this : IAutomaticUpdates*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detect_now.call(this)
    end
    def pause(this : IAutomaticUpdates*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IAutomaticUpdates*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def show_settings_dialog(this : IAutomaticUpdates*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_settings_dialog.call(this)
    end
    def get_Settings(this : IAutomaticUpdates*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Settings.call(this, retval)
    end
    def get_ServiceEnabled(this : IAutomaticUpdates*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceEnabled.call(this, retval)
    end
    def enable_service(this : IAutomaticUpdates*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_service.call(this)
    end

  end

  @[Extern]
  record IAutomaticUpdates2Vtbl,
    query_interface : Proc(IAutomaticUpdates2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAutomaticUpdates2*, UInt32),
    release : Proc(IAutomaticUpdates2*, UInt32),
    get_type_info_count : Proc(IAutomaticUpdates2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAutomaticUpdates2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAutomaticUpdates2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAutomaticUpdates2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    detect_now : Proc(IAutomaticUpdates2*, Win32cr::Foundation::HRESULT),
    pause : Proc(IAutomaticUpdates2*, Win32cr::Foundation::HRESULT),
    resume : Proc(IAutomaticUpdates2*, Win32cr::Foundation::HRESULT),
    show_settings_dialog : Proc(IAutomaticUpdates2*, Win32cr::Foundation::HRESULT),
    get_Settings : Proc(IAutomaticUpdates2*, Void**, Win32cr::Foundation::HRESULT),
    get_ServiceEnabled : Proc(IAutomaticUpdates2*, Int16*, Win32cr::Foundation::HRESULT),
    enable_service : Proc(IAutomaticUpdates2*, Win32cr::Foundation::HRESULT),
    get_Results : Proc(IAutomaticUpdates2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4a2f5c31-cfd9-410e-b7fb-29a653973a0f")]
  record IAutomaticUpdates2, lpVtbl : IAutomaticUpdates2Vtbl* do
    GUID = LibC::GUID.new(0x4a2f5c31_u32, 0xcfd9_u16, 0x410e_u16, StaticArray[0xb7_u8, 0xfb_u8, 0x29_u8, 0xa6_u8, 0x53_u8, 0x97_u8, 0x3a_u8, 0xf_u8])
    def query_interface(this : IAutomaticUpdates2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAutomaticUpdates2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAutomaticUpdates2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAutomaticUpdates2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAutomaticUpdates2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAutomaticUpdates2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAutomaticUpdates2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def detect_now(this : IAutomaticUpdates2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.detect_now.call(this)
    end
    def pause(this : IAutomaticUpdates2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IAutomaticUpdates2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def show_settings_dialog(this : IAutomaticUpdates2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_settings_dialog.call(this)
    end
    def get_Settings(this : IAutomaticUpdates2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Settings.call(this, retval)
    end
    def get_ServiceEnabled(this : IAutomaticUpdates2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceEnabled.call(this, retval)
    end
    def enable_service(this : IAutomaticUpdates2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_service.call(this)
    end
    def get_Results(this : IAutomaticUpdates2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Results.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateIdentityVtbl,
    query_interface : Proc(IUpdateIdentity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateIdentity*, UInt32),
    release : Proc(IUpdateIdentity*, UInt32),
    get_type_info_count : Proc(IUpdateIdentity*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateIdentity*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateIdentity*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateIdentity*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RevisionNumber : Proc(IUpdateIdentity*, Int32*, Win32cr::Foundation::HRESULT),
    get_UpdateID : Proc(IUpdateIdentity*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("46297823-9940-4c09-aed9-cd3ea6d05968")]
  record IUpdateIdentity, lpVtbl : IUpdateIdentityVtbl* do
    GUID = LibC::GUID.new(0x46297823_u32, 0x9940_u16, 0x4c09_u16, StaticArray[0xae_u8, 0xd9_u8, 0xcd_u8, 0x3e_u8, 0xa6_u8, 0xd0_u8, 0x59_u8, 0x68_u8])
    def query_interface(this : IUpdateIdentity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateIdentity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateIdentity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateIdentity*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateIdentity*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateIdentity*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateIdentity*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RevisionNumber(this : IUpdateIdentity*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RevisionNumber.call(this, retval)
    end
    def get_UpdateID(this : IUpdateIdentity*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdateID.call(this, retval)
    end

  end

  @[Extern]
  record IImageInformationVtbl,
    query_interface : Proc(IImageInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IImageInformation*, UInt32),
    release : Proc(IImageInformation*, UInt32),
    get_type_info_count : Proc(IImageInformation*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IImageInformation*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IImageInformation*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IImageInformation*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AltText : Proc(IImageInformation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Height : Proc(IImageInformation*, Int32*, Win32cr::Foundation::HRESULT),
    get_Source : Proc(IImageInformation*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Width : Proc(IImageInformation*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7c907864-346c-4aeb-8f3f-57da289f969f")]
  record IImageInformation, lpVtbl : IImageInformationVtbl* do
    GUID = LibC::GUID.new(0x7c907864_u32, 0x346c_u16, 0x4aeb_u16, StaticArray[0x8f_u8, 0x3f_u8, 0x57_u8, 0xda_u8, 0x28_u8, 0x9f_u8, 0x96_u8, 0x9f_u8])
    def query_interface(this : IImageInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IImageInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IImageInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IImageInformation*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IImageInformation*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IImageInformation*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IImageInformation*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AltText(this : IImageInformation*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AltText.call(this, retval)
    end
    def get_Height(this : IImageInformation*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Height.call(this, retval)
    end
    def get_Source(this : IImageInformation*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Source.call(this, retval)
    end
    def get_Width(this : IImageInformation*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Width.call(this, retval)
    end

  end

  @[Extern]
  record ICategoryVtbl,
    query_interface : Proc(ICategory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICategory*, UInt32),
    release : Proc(ICategory*, UInt32),
    get_type_info_count : Proc(ICategory*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICategory*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICategory*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICategory*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ICategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CategoryID : Proc(ICategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Children : Proc(ICategory*, Void**, Win32cr::Foundation::HRESULT),
    get_Description : Proc(ICategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Image : Proc(ICategory*, Void**, Win32cr::Foundation::HRESULT),
    get_Order : Proc(ICategory*, Int32*, Win32cr::Foundation::HRESULT),
    get_Parent : Proc(ICategory*, Void**, Win32cr::Foundation::HRESULT),
    get_Type : Proc(ICategory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(ICategory*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("81ddc1b8-9d35-47a6-b471-5b80f519223b")]
  record ICategory, lpVtbl : ICategoryVtbl* do
    GUID = LibC::GUID.new(0x81ddc1b8_u32, 0x9d35_u16, 0x47a6_u16, StaticArray[0xb4_u8, 0x71_u8, 0x5b_u8, 0x80_u8, 0xf5_u8, 0x19_u8, 0x22_u8, 0x3b_u8])
    def query_interface(this : ICategory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICategory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICategory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICategory*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICategory*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICategory*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICategory*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : ICategory*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, retval)
    end
    def get_CategoryID(this : ICategory*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CategoryID.call(this, retval)
    end
    def get_Children(this : ICategory*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Children.call(this, retval)
    end
    def get_Description(this : ICategory*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_Image(this : ICategory*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_Order(this : ICategory*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Order.call(this, retval)
    end
    def get_Parent(this : ICategory*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Parent.call(this, retval)
    end
    def get_Type(this : ICategory*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_Updates(this : ICategory*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end

  end

  @[Extern]
  record ICategoryCollectionVtbl,
    query_interface : Proc(ICategoryCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICategoryCollection*, UInt32),
    release : Proc(ICategoryCollection*, UInt32),
    get_type_info_count : Proc(ICategoryCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICategoryCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICategoryCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICategoryCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(ICategoryCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(ICategoryCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(ICategoryCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3a56bfb8-576c-43f7-9335-fe4838fd7e37")]
  record ICategoryCollection, lpVtbl : ICategoryCollectionVtbl* do
    GUID = LibC::GUID.new(0x3a56bfb8_u32, 0x576c_u16, 0x43f7_u16, StaticArray[0x93_u8, 0x35_u8, 0xfe_u8, 0x48_u8, 0x38_u8, 0xfd_u8, 0x7e_u8, 0x37_u8])
    def query_interface(this : ICategoryCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICategoryCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICategoryCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICategoryCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICategoryCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICategoryCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICategoryCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : ICategoryCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def get__NewEnum(this : ICategoryCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : ICategoryCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end

  end

  @[Extern]
  record IInstallationBehaviorVtbl,
    query_interface : Proc(IInstallationBehavior*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationBehavior*, UInt32),
    release : Proc(IInstallationBehavior*, UInt32),
    get_type_info_count : Proc(IInstallationBehavior*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationBehavior*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationBehavior*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationBehavior*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CanRequestUserInput : Proc(IInstallationBehavior*, Int16*, Win32cr::Foundation::HRESULT),
    get_Impact : Proc(IInstallationBehavior*, Win32cr::System::UpdateAgent::InstallationImpact*, Win32cr::Foundation::HRESULT),
    get_RebootBehavior : Proc(IInstallationBehavior*, Win32cr::System::UpdateAgent::InstallationRebootBehavior*, Win32cr::Foundation::HRESULT),
    get_RequiresNetworkConnectivity : Proc(IInstallationBehavior*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d9a59339-e245-4dbd-9686-4d5763e39624")]
  record IInstallationBehavior, lpVtbl : IInstallationBehaviorVtbl* do
    GUID = LibC::GUID.new(0xd9a59339_u32, 0xe245_u16, 0x4dbd_u16, StaticArray[0x96_u8, 0x86_u8, 0x4d_u8, 0x57_u8, 0x63_u8, 0xe3_u8, 0x96_u8, 0x24_u8])
    def query_interface(this : IInstallationBehavior*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationBehavior*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationBehavior*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationBehavior*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationBehavior*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationBehavior*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationBehavior*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CanRequestUserInput(this : IInstallationBehavior*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequestUserInput.call(this, retval)
    end
    def get_Impact(this : IInstallationBehavior*, retval : Win32cr::System::UpdateAgent::InstallationImpact*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Impact.call(this, retval)
    end
    def get_RebootBehavior(this : IInstallationBehavior*, retval : Win32cr::System::UpdateAgent::InstallationRebootBehavior*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootBehavior.call(this, retval)
    end
    def get_RequiresNetworkConnectivity(this : IInstallationBehavior*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RequiresNetworkConnectivity.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateDownloadContentVtbl,
    query_interface : Proc(IUpdateDownloadContent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateDownloadContent*, UInt32),
    release : Proc(IUpdateDownloadContent*, UInt32),
    get_type_info_count : Proc(IUpdateDownloadContent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateDownloadContent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateDownloadContent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateDownloadContent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DownloadUrl : Proc(IUpdateDownloadContent*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("54a2cb2d-9a0c-48b6-8a50-9abb69ee2d02")]
  record IUpdateDownloadContent, lpVtbl : IUpdateDownloadContentVtbl* do
    GUID = LibC::GUID.new(0x54a2cb2d_u32, 0x9a0c_u16, 0x48b6_u16, StaticArray[0x8a_u8, 0x50_u8, 0x9a_u8, 0xbb_u8, 0x69_u8, 0xee_u8, 0x2d_u8, 0x2_u8])
    def query_interface(this : IUpdateDownloadContent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateDownloadContent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateDownloadContent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateDownloadContent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateDownloadContent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateDownloadContent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateDownloadContent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DownloadUrl(this : IUpdateDownloadContent*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadUrl.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateDownloadContent2Vtbl,
    query_interface : Proc(IUpdateDownloadContent2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateDownloadContent2*, UInt32),
    release : Proc(IUpdateDownloadContent2*, UInt32),
    get_type_info_count : Proc(IUpdateDownloadContent2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateDownloadContent2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateDownloadContent2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateDownloadContent2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DownloadUrl : Proc(IUpdateDownloadContent2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsDeltaCompressedContent : Proc(IUpdateDownloadContent2*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c97ad11b-f257-420b-9d9f-377f733f6f68")]
  record IUpdateDownloadContent2, lpVtbl : IUpdateDownloadContent2Vtbl* do
    GUID = LibC::GUID.new(0xc97ad11b_u32, 0xf257_u16, 0x420b_u16, StaticArray[0x9d_u8, 0x9f_u8, 0x37_u8, 0x7f_u8, 0x73_u8, 0x3f_u8, 0x6f_u8, 0x68_u8])
    def query_interface(this : IUpdateDownloadContent2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateDownloadContent2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateDownloadContent2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateDownloadContent2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateDownloadContent2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateDownloadContent2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateDownloadContent2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DownloadUrl(this : IUpdateDownloadContent2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadUrl.call(this, retval)
    end
    def get_IsDeltaCompressedContent(this : IUpdateDownloadContent2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDeltaCompressedContent.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateDownloadContentCollectionVtbl,
    query_interface : Proc(IUpdateDownloadContentCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateDownloadContentCollection*, UInt32),
    release : Proc(IUpdateDownloadContentCollection*, UInt32),
    get_type_info_count : Proc(IUpdateDownloadContentCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateDownloadContentCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateDownloadContentCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateDownloadContentCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUpdateDownloadContentCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUpdateDownloadContentCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUpdateDownloadContentCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bc5513c8-b3b8-4bf7-a4d4-361c0d8c88ba")]
  record IUpdateDownloadContentCollection, lpVtbl : IUpdateDownloadContentCollectionVtbl* do
    GUID = LibC::GUID.new(0xbc5513c8_u32, 0xb3b8_u16, 0x4bf7_u16, StaticArray[0xa4_u8, 0xd4_u8, 0x36_u8, 0x1c_u8, 0xd_u8, 0x8c_u8, 0x88_u8, 0xba_u8])
    def query_interface(this : IUpdateDownloadContentCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateDownloadContentCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateDownloadContentCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateDownloadContentCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateDownloadContentCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateDownloadContentCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateDownloadContentCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IUpdateDownloadContentCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def get__NewEnum(this : IUpdateDownloadContentCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IUpdateDownloadContentCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateVtbl,
    query_interface : Proc(IUpdate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdate*, UInt32),
    release : Proc(IUpdate*, UInt32),
    get_type_info_count : Proc(IUpdate*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdate*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdate*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdate*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IUpdate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IUpdate*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IUpdate*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IUpdate*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IUpdate*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IUpdate*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IUpdate*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IUpdate*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IUpdate*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IUpdate*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IUpdate*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6a92b07a-d821-4682-b423-5c805022cc4d")]
  record IUpdate, lpVtbl : IUpdateVtbl* do
    GUID = LibC::GUID.new(0x6a92b07a_u32, 0xd821_u16, 0x4682_u16, StaticArray[0xb4_u8, 0x23_u8, 0x5c_u8, 0x80_u8, 0x50_u8, 0x22_u8, 0xcc_u8, 0x4d_u8])
    def query_interface(this : IUpdate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdate*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdate*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdate*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdate*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IUpdate*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IUpdate*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IUpdate*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IUpdate*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IUpdate*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IUpdate*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IUpdate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IUpdate*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IUpdate*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IUpdate*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsDriverUpdateVtbl,
    query_interface : Proc(IWindowsDriverUpdate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdate*, UInt32),
    release : Proc(IWindowsDriverUpdate*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdate*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdate*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdate*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdate*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IWindowsDriverUpdate*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IWindowsDriverUpdate*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IWindowsDriverUpdate*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IWindowsDriverUpdate*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IWindowsDriverUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IWindowsDriverUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IWindowsDriverUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWindowsDriverUpdate*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IWindowsDriverUpdate*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IWindowsDriverUpdate*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IWindowsDriverUpdate*, Void**, Win32cr::Foundation::HRESULT),
    get_DriverClass : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverHardwareID : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverManufacturer : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverModel : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverProvider : Proc(IWindowsDriverUpdate*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverVerDate : Proc(IWindowsDriverUpdate*, Float64*, Win32cr::Foundation::HRESULT),
    get_DeviceProblemNumber : Proc(IWindowsDriverUpdate*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceStatus : Proc(IWindowsDriverUpdate*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b383cd1a-5ce9-4504-9f63-764b1236f191")]
  record IWindowsDriverUpdate, lpVtbl : IWindowsDriverUpdateVtbl* do
    GUID = LibC::GUID.new(0xb383cd1a_u32, 0x5ce9_u16, 0x4504_u16, StaticArray[0x9f_u8, 0x63_u8, 0x76_u8, 0x4b_u8, 0x12_u8, 0x36_u8, 0xf1_u8, 0x91_u8])
    def query_interface(this : IWindowsDriverUpdate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdate*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdate*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdate*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdate*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IWindowsDriverUpdate*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IWindowsDriverUpdate*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IWindowsDriverUpdate*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IWindowsDriverUpdate*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IWindowsDriverUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IWindowsDriverUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IWindowsDriverUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IWindowsDriverUpdate*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IWindowsDriverUpdate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IWindowsDriverUpdate*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IWindowsDriverUpdate*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IWindowsDriverUpdate*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IWindowsDriverUpdate*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_DriverClass(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverClass.call(this, retval)
    end
    def get_DriverHardwareID(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverHardwareID.call(this, retval)
    end
    def get_DriverManufacturer(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverManufacturer.call(this, retval)
    end
    def get_DriverModel(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverModel.call(this, retval)
    end
    def get_DriverProvider(this : IWindowsDriverUpdate*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProvider.call(this, retval)
    end
    def get_DriverVerDate(this : IWindowsDriverUpdate*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverVerDate.call(this, retval)
    end
    def get_DeviceProblemNumber(this : IWindowsDriverUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceProblemNumber.call(this, retval)
    end
    def get_DeviceStatus(this : IWindowsDriverUpdate*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceStatus.call(this, retval)
    end

  end

  @[Extern]
  record IUpdate2Vtbl,
    query_interface : Proc(IUpdate2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdate2*, UInt32),
    release : Proc(IUpdate2*, UInt32),
    get_type_info_count : Proc(IUpdate2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdate2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdate2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdate2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IUpdate2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IUpdate2*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IUpdate2*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IUpdate2*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IUpdate2*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IUpdate2*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IUpdate2*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IUpdate2*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IUpdate2*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IUpdate2*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IUpdate2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("144fe9b0-d23d-4a8b-8634-fb4457533b7a")]
  record IUpdate2, lpVtbl : IUpdate2Vtbl* do
    GUID = LibC::GUID.new(0x144fe9b0_u32, 0xd23d_u16, 0x4a8b_u16, StaticArray[0x86_u8, 0x34_u8, 0xfb_u8, 0x44_u8, 0x57_u8, 0x53_u8, 0x3b_u8, 0x7a_u8])
    def query_interface(this : IUpdate2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdate2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdate2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdate2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdate2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdate2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdate2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IUpdate2*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IUpdate2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IUpdate2*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IUpdate2*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IUpdate2*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IUpdate2*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IUpdate2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IUpdate2*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IUpdate2*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IUpdate2*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_RebootRequired(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IUpdate2*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end

  end

  @[Extern]
  record IUpdate3Vtbl,
    query_interface : Proc(IUpdate3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdate3*, UInt32),
    release : Proc(IUpdate3*, UInt32),
    get_type_info_count : Proc(IUpdate3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdate3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdate3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdate3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IUpdate3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IUpdate3*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IUpdate3*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IUpdate3*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IUpdate3*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IUpdate3*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IUpdate3*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IUpdate3*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IUpdate3*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IUpdate3*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IUpdate3*, Void*, Win32cr::Foundation::HRESULT),
    get_BrowseOnly : Proc(IUpdate3*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("112eda6b-95b3-476f-9d90-aee82c6b8181")]
  record IUpdate3, lpVtbl : IUpdate3Vtbl* do
    GUID = LibC::GUID.new(0x112eda6b_u32, 0x95b3_u16, 0x476f_u16, StaticArray[0x9d_u8, 0x90_u8, 0xae_u8, 0xe8_u8, 0x2c_u8, 0x6b_u8, 0x81_u8, 0x81_u8])
    def query_interface(this : IUpdate3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdate3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdate3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdate3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdate3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdate3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdate3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IUpdate3*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IUpdate3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IUpdate3*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IUpdate3*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IUpdate3*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IUpdate3*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IUpdate3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IUpdate3*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IUpdate3*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IUpdate3*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_RebootRequired(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IUpdate3*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end
    def get_BrowseOnly(this : IUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrowseOnly.call(this, retval)
    end

  end

  @[Extern]
  record IUpdate4Vtbl,
    query_interface : Proc(IUpdate4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdate4*, UInt32),
    release : Proc(IUpdate4*, UInt32),
    get_type_info_count : Proc(IUpdate4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdate4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdate4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdate4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IUpdate4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IUpdate4*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IUpdate4*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IUpdate4*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IUpdate4*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IUpdate4*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IUpdate4*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IUpdate4*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IUpdate4*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IUpdate4*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IUpdate4*, Void*, Win32cr::Foundation::HRESULT),
    get_BrowseOnly : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_PerUser : Proc(IUpdate4*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("27e94b0d-5139-49a2-9a61-93522dc54652")]
  record IUpdate4, lpVtbl : IUpdate4Vtbl* do
    GUID = LibC::GUID.new(0x27e94b0d_u32, 0x5139_u16, 0x49a2_u16, StaticArray[0x9a_u8, 0x61_u8, 0x93_u8, 0x52_u8, 0x2d_u8, 0xc5_u8, 0x46_u8, 0x52_u8])
    def query_interface(this : IUpdate4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdate4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdate4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdate4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdate4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdate4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdate4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IUpdate4*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IUpdate4*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IUpdate4*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IUpdate4*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IUpdate4*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IUpdate4*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IUpdate4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IUpdate4*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IUpdate4*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IUpdate4*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_RebootRequired(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IUpdate4*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end
    def get_BrowseOnly(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrowseOnly.call(this, retval)
    end
    def get_PerUser(this : IUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PerUser.call(this, retval)
    end

  end

  @[Extern]
  record IUpdate5Vtbl,
    query_interface : Proc(IUpdate5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdate5*, UInt32),
    release : Proc(IUpdate5*, UInt32),
    get_type_info_count : Proc(IUpdate5*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdate5*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdate5*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdate5*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IUpdate5*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IUpdate5*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IUpdate5*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IUpdate5*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IUpdate5*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IUpdate5*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IUpdate5*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IUpdate5*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IUpdate5*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IUpdate5*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IUpdate5*, Void*, Win32cr::Foundation::HRESULT),
    get_BrowseOnly : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_PerUser : Proc(IUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_AutoSelection : Proc(IUpdate5*, Win32cr::System::UpdateAgent::AutoSelectionMode*, Win32cr::Foundation::HRESULT),
    get_AutoDownload : Proc(IUpdate5*, Win32cr::System::UpdateAgent::AutoDownloadMode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c1c2f21a-d2f4-4902-b5c6-8a081c19a890")]
  record IUpdate5, lpVtbl : IUpdate5Vtbl* do
    GUID = LibC::GUID.new(0xc1c2f21a_u32, 0xd2f4_u16, 0x4902_u16, StaticArray[0xb5_u8, 0xc6_u8, 0x8a_u8, 0x8_u8, 0x1c_u8, 0x19_u8, 0xa8_u8, 0x90_u8])
    def query_interface(this : IUpdate5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdate5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdate5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdate5*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdate5*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdate5*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdate5*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IUpdate5*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IUpdate5*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IUpdate5*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IUpdate5*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IUpdate5*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IUpdate5*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IUpdate5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IUpdate5*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IUpdate5*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IUpdate5*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_RebootRequired(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IUpdate5*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end
    def get_BrowseOnly(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrowseOnly.call(this, retval)
    end
    def get_PerUser(this : IUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PerUser.call(this, retval)
    end
    def get_AutoSelection(this : IUpdate5*, retval : Win32cr::System::UpdateAgent::AutoSelectionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelection.call(this, retval)
    end
    def get_AutoDownload(this : IUpdate5*, retval : Win32cr::System::UpdateAgent::AutoDownloadMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoDownload.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsDriverUpdate2Vtbl,
    query_interface : Proc(IWindowsDriverUpdate2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdate2*, UInt32),
    release : Proc(IWindowsDriverUpdate2*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdate2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdate2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdate2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdate2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IWindowsDriverUpdate2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IWindowsDriverUpdate2*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IWindowsDriverUpdate2*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IWindowsDriverUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IWindowsDriverUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IWindowsDriverUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWindowsDriverUpdate2*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IWindowsDriverUpdate2*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IWindowsDriverUpdate2*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    get_DriverClass : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverHardwareID : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverManufacturer : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverModel : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverProvider : Proc(IWindowsDriverUpdate2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverVerDate : Proc(IWindowsDriverUpdate2*, Float64*, Win32cr::Foundation::HRESULT),
    get_DeviceProblemNumber : Proc(IWindowsDriverUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceStatus : Proc(IWindowsDriverUpdate2*, Int32*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IWindowsDriverUpdate2*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IWindowsDriverUpdate2*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IWindowsDriverUpdate2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("615c4269-7a48-43bd-96b7-bf6ca27d6c3e")]
  record IWindowsDriverUpdate2, lpVtbl : IWindowsDriverUpdate2Vtbl* do
    GUID = LibC::GUID.new(0x615c4269_u32, 0x7a48_u16, 0x43bd_u16, StaticArray[0x96_u8, 0xb7_u8, 0xbf_u8, 0x6c_u8, 0xa2_u8, 0x7d_u8, 0x6c_u8, 0x3e_u8])
    def query_interface(this : IWindowsDriverUpdate2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdate2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdate2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdate2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdate2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdate2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdate2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IWindowsDriverUpdate2*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IWindowsDriverUpdate2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IWindowsDriverUpdate2*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IWindowsDriverUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IWindowsDriverUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IWindowsDriverUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IWindowsDriverUpdate2*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IWindowsDriverUpdate2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IWindowsDriverUpdate2*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IWindowsDriverUpdate2*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IWindowsDriverUpdate2*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_DriverClass(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverClass.call(this, retval)
    end
    def get_DriverHardwareID(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverHardwareID.call(this, retval)
    end
    def get_DriverManufacturer(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverManufacturer.call(this, retval)
    end
    def get_DriverModel(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverModel.call(this, retval)
    end
    def get_DriverProvider(this : IWindowsDriverUpdate2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProvider.call(this, retval)
    end
    def get_DriverVerDate(this : IWindowsDriverUpdate2*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverVerDate.call(this, retval)
    end
    def get_DeviceProblemNumber(this : IWindowsDriverUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceProblemNumber.call(this, retval)
    end
    def get_DeviceStatus(this : IWindowsDriverUpdate2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceStatus.call(this, retval)
    end
    def get_RebootRequired(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IWindowsDriverUpdate2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IWindowsDriverUpdate2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IWindowsDriverUpdate2*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end

  end

  @[Extern]
  record IWindowsDriverUpdate3Vtbl,
    query_interface : Proc(IWindowsDriverUpdate3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdate3*, UInt32),
    release : Proc(IWindowsDriverUpdate3*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdate3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdate3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdate3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdate3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IWindowsDriverUpdate3*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IWindowsDriverUpdate3*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IWindowsDriverUpdate3*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IWindowsDriverUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IWindowsDriverUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IWindowsDriverUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWindowsDriverUpdate3*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IWindowsDriverUpdate3*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IWindowsDriverUpdate3*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    get_DriverClass : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverHardwareID : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverManufacturer : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverModel : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverProvider : Proc(IWindowsDriverUpdate3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverVerDate : Proc(IWindowsDriverUpdate3*, Float64*, Win32cr::Foundation::HRESULT),
    get_DeviceProblemNumber : Proc(IWindowsDriverUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceStatus : Proc(IWindowsDriverUpdate3*, Int32*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IWindowsDriverUpdate3*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IWindowsDriverUpdate3*, Void*, Win32cr::Foundation::HRESULT),
    get_BrowseOnly : Proc(IWindowsDriverUpdate3*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("49ebd502-4a96-41bd-9e3e-4c5057f4250c")]
  record IWindowsDriverUpdate3, lpVtbl : IWindowsDriverUpdate3Vtbl* do
    GUID = LibC::GUID.new(0x49ebd502_u32, 0x4a96_u16, 0x41bd_u16, StaticArray[0x9e_u8, 0x3e_u8, 0x4c_u8, 0x50_u8, 0x57_u8, 0xf4_u8, 0x25_u8, 0xc_u8])
    def query_interface(this : IWindowsDriverUpdate3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdate3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdate3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdate3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdate3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdate3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdate3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IWindowsDriverUpdate3*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IWindowsDriverUpdate3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IWindowsDriverUpdate3*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IWindowsDriverUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IWindowsDriverUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IWindowsDriverUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IWindowsDriverUpdate3*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IWindowsDriverUpdate3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IWindowsDriverUpdate3*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IWindowsDriverUpdate3*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IWindowsDriverUpdate3*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_DriverClass(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverClass.call(this, retval)
    end
    def get_DriverHardwareID(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverHardwareID.call(this, retval)
    end
    def get_DriverManufacturer(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverManufacturer.call(this, retval)
    end
    def get_DriverModel(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverModel.call(this, retval)
    end
    def get_DriverProvider(this : IWindowsDriverUpdate3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProvider.call(this, retval)
    end
    def get_DriverVerDate(this : IWindowsDriverUpdate3*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverVerDate.call(this, retval)
    end
    def get_DeviceProblemNumber(this : IWindowsDriverUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceProblemNumber.call(this, retval)
    end
    def get_DeviceStatus(this : IWindowsDriverUpdate3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceStatus.call(this, retval)
    end
    def get_RebootRequired(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IWindowsDriverUpdate3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IWindowsDriverUpdate3*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end
    def get_BrowseOnly(this : IWindowsDriverUpdate3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrowseOnly.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsDriverUpdateEntryVtbl,
    query_interface : Proc(IWindowsDriverUpdateEntry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdateEntry*, UInt32),
    release : Proc(IWindowsDriverUpdateEntry*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdateEntry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdateEntry*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdateEntry*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdateEntry*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DriverClass : Proc(IWindowsDriverUpdateEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverHardwareID : Proc(IWindowsDriverUpdateEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverManufacturer : Proc(IWindowsDriverUpdateEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverModel : Proc(IWindowsDriverUpdateEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverProvider : Proc(IWindowsDriverUpdateEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverVerDate : Proc(IWindowsDriverUpdateEntry*, Float64*, Win32cr::Foundation::HRESULT),
    get_DeviceProblemNumber : Proc(IWindowsDriverUpdateEntry*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceStatus : Proc(IWindowsDriverUpdateEntry*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ed8bfe40-a60b-42ea-9652-817dfcfa23ec")]
  record IWindowsDriverUpdateEntry, lpVtbl : IWindowsDriverUpdateEntryVtbl* do
    GUID = LibC::GUID.new(0xed8bfe40_u32, 0xa60b_u16, 0x42ea_u16, StaticArray[0x96_u8, 0x52_u8, 0x81_u8, 0x7d_u8, 0xfc_u8, 0xfa_u8, 0x23_u8, 0xec_u8])
    def query_interface(this : IWindowsDriverUpdateEntry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdateEntry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdateEntry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdateEntry*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdateEntry*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdateEntry*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdateEntry*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DriverClass(this : IWindowsDriverUpdateEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverClass.call(this, retval)
    end
    def get_DriverHardwareID(this : IWindowsDriverUpdateEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverHardwareID.call(this, retval)
    end
    def get_DriverManufacturer(this : IWindowsDriverUpdateEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverManufacturer.call(this, retval)
    end
    def get_DriverModel(this : IWindowsDriverUpdateEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverModel.call(this, retval)
    end
    def get_DriverProvider(this : IWindowsDriverUpdateEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProvider.call(this, retval)
    end
    def get_DriverVerDate(this : IWindowsDriverUpdateEntry*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverVerDate.call(this, retval)
    end
    def get_DeviceProblemNumber(this : IWindowsDriverUpdateEntry*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceProblemNumber.call(this, retval)
    end
    def get_DeviceStatus(this : IWindowsDriverUpdateEntry*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceStatus.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsDriverUpdateEntryCollectionVtbl,
    query_interface : Proc(IWindowsDriverUpdateEntryCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdateEntryCollection*, UInt32),
    release : Proc(IWindowsDriverUpdateEntryCollection*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdateEntryCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdateEntryCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdateEntryCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdateEntryCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IWindowsDriverUpdateEntryCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IWindowsDriverUpdateEntryCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IWindowsDriverUpdateEntryCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0d521700-a372-4bef-828b-3d00c10adebd")]
  record IWindowsDriverUpdateEntryCollection, lpVtbl : IWindowsDriverUpdateEntryCollectionVtbl* do
    GUID = LibC::GUID.new(0xd521700_u32, 0xa372_u16, 0x4bef_u16, StaticArray[0x82_u8, 0x8b_u8, 0x3d_u8, 0x0_u8, 0xc1_u8, 0xa_u8, 0xde_u8, 0xbd_u8])
    def query_interface(this : IWindowsDriverUpdateEntryCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdateEntryCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdateEntryCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdateEntryCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdateEntryCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdateEntryCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdateEntryCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IWindowsDriverUpdateEntryCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def get__NewEnum(this : IWindowsDriverUpdateEntryCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IWindowsDriverUpdateEntryCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsDriverUpdate4Vtbl,
    query_interface : Proc(IWindowsDriverUpdate4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdate4*, UInt32),
    release : Proc(IWindowsDriverUpdate4*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdate4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdate4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdate4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdate4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IWindowsDriverUpdate4*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IWindowsDriverUpdate4*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IWindowsDriverUpdate4*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IWindowsDriverUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IWindowsDriverUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IWindowsDriverUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWindowsDriverUpdate4*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IWindowsDriverUpdate4*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IWindowsDriverUpdate4*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_DriverClass : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverHardwareID : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverManufacturer : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverModel : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverProvider : Proc(IWindowsDriverUpdate4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverVerDate : Proc(IWindowsDriverUpdate4*, Float64*, Win32cr::Foundation::HRESULT),
    get_DeviceProblemNumber : Proc(IWindowsDriverUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceStatus : Proc(IWindowsDriverUpdate4*, Int32*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IWindowsDriverUpdate4*, Void*, Win32cr::Foundation::HRESULT),
    get_BrowseOnly : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT),
    get_WindowsDriverUpdateEntries : Proc(IWindowsDriverUpdate4*, Void**, Win32cr::Foundation::HRESULT),
    get_PerUser : Proc(IWindowsDriverUpdate4*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("004c6a2b-0c19-4c69-9f5c-a269b2560db9")]
  record IWindowsDriverUpdate4, lpVtbl : IWindowsDriverUpdate4Vtbl* do
    GUID = LibC::GUID.new(0x4c6a2b_u32, 0xc19_u16, 0x4c69_u16, StaticArray[0x9f_u8, 0x5c_u8, 0xa2_u8, 0x69_u8, 0xb2_u8, 0x56_u8, 0xd_u8, 0xb9_u8])
    def query_interface(this : IWindowsDriverUpdate4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdate4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdate4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdate4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdate4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdate4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdate4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IWindowsDriverUpdate4*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IWindowsDriverUpdate4*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IWindowsDriverUpdate4*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IWindowsDriverUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IWindowsDriverUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IWindowsDriverUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IWindowsDriverUpdate4*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IWindowsDriverUpdate4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IWindowsDriverUpdate4*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IWindowsDriverUpdate4*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IWindowsDriverUpdate4*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_DriverClass(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverClass.call(this, retval)
    end
    def get_DriverHardwareID(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverHardwareID.call(this, retval)
    end
    def get_DriverManufacturer(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverManufacturer.call(this, retval)
    end
    def get_DriverModel(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverModel.call(this, retval)
    end
    def get_DriverProvider(this : IWindowsDriverUpdate4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProvider.call(this, retval)
    end
    def get_DriverVerDate(this : IWindowsDriverUpdate4*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverVerDate.call(this, retval)
    end
    def get_DeviceProblemNumber(this : IWindowsDriverUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceProblemNumber.call(this, retval)
    end
    def get_DeviceStatus(this : IWindowsDriverUpdate4*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceStatus.call(this, retval)
    end
    def get_RebootRequired(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IWindowsDriverUpdate4*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end
    def get_BrowseOnly(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrowseOnly.call(this, retval)
    end
    def get_WindowsDriverUpdateEntries(this : IWindowsDriverUpdate4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowsDriverUpdateEntries.call(this, retval)
    end
    def get_PerUser(this : IWindowsDriverUpdate4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PerUser.call(this, retval)
    end

  end

  @[Extern]
  record IWindowsDriverUpdate5Vtbl,
    query_interface : Proc(IWindowsDriverUpdate5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsDriverUpdate5*, UInt32),
    release : Proc(IWindowsDriverUpdate5*, UInt32),
    get_type_info_count : Proc(IWindowsDriverUpdate5*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsDriverUpdate5*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsDriverUpdate5*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsDriverUpdate5*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AutoSelectOnWebSites : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_BundledUpdates : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_CanRequireSource : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_Deadline : Proc(IWindowsDriverUpdate5*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentAvailable : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_DeltaCompressedContentPreferred : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_EulaAccepted : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_EulaText : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HandlerID : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Identity : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_Image : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_InstallationBehavior : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_IsBeta : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsDownloaded : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsHidden : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsHidden : Proc(IWindowsDriverUpdate5*, Int16, Win32cr::Foundation::HRESULT),
    get_IsInstalled : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsMandatory : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsUninstallable : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_Languages : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_LastDeploymentChangeTime : Proc(IWindowsDriverUpdate5*, Float64*, Win32cr::Foundation::HRESULT),
    get_MaxDownloadSize : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MinDownloadSize : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_MoreInfoUrls : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_MsrcSeverity : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RecommendedCpuSpeed : Proc(IWindowsDriverUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedHardDiskSpace : Proc(IWindowsDriverUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_RecommendedMemory : Proc(IWindowsDriverUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReleaseNotes : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SecurityBulletinIDs : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_SupersededUpdateIDs : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Type : Proc(IWindowsDriverUpdate5*, Win32cr::System::UpdateAgent::UpdateType*, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationBehavior : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_KBArticleIDs : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    accept_eula : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::HRESULT),
    get_DeploymentAction : Proc(IWindowsDriverUpdate5*, Win32cr::System::UpdateAgent::DeploymentAction*, Win32cr::Foundation::HRESULT),
    copy_from_cache : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_DownloadPriority : Proc(IWindowsDriverUpdate5*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    get_DownloadContents : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_DriverClass : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverHardwareID : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverManufacturer : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverModel : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverProvider : Proc(IWindowsDriverUpdate5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DriverVerDate : Proc(IWindowsDriverUpdate5*, Float64*, Win32cr::Foundation::HRESULT),
    get_DeviceProblemNumber : Proc(IWindowsDriverUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceStatus : Proc(IWindowsDriverUpdate5*, Int32*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsPresent : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_CveIDs : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    copy_to_cache : Proc(IWindowsDriverUpdate5*, Void*, Win32cr::Foundation::HRESULT),
    get_BrowseOnly : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_WindowsDriverUpdateEntries : Proc(IWindowsDriverUpdate5*, Void**, Win32cr::Foundation::HRESULT),
    get_PerUser : Proc(IWindowsDriverUpdate5*, Int16*, Win32cr::Foundation::HRESULT),
    get_AutoSelection : Proc(IWindowsDriverUpdate5*, Win32cr::System::UpdateAgent::AutoSelectionMode*, Win32cr::Foundation::HRESULT),
    get_AutoDownload : Proc(IWindowsDriverUpdate5*, Win32cr::System::UpdateAgent::AutoDownloadMode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70cf5c82-8642-42bb-9dbc-0cfd263c6c4f")]
  record IWindowsDriverUpdate5, lpVtbl : IWindowsDriverUpdate5Vtbl* do
    GUID = LibC::GUID.new(0x70cf5c82_u32, 0x8642_u16, 0x42bb_u16, StaticArray[0x9d_u8, 0xbc_u8, 0xc_u8, 0xfd_u8, 0x26_u8, 0x3c_u8, 0x6c_u8, 0x4f_u8])
    def query_interface(this : IWindowsDriverUpdate5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsDriverUpdate5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsDriverUpdate5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsDriverUpdate5*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsDriverUpdate5*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsDriverUpdate5*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsDriverUpdate5*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Title(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_AutoSelectOnWebSites(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelectOnWebSites.call(this, retval)
    end
    def get_BundledUpdates(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BundledUpdates.call(this, retval)
    end
    def get_CanRequireSource(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRequireSource.call(this, retval)
    end
    def get_Categories(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end
    def get_Deadline(this : IWindowsDriverUpdate5*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Deadline.call(this, retval)
    end
    def get_DeltaCompressedContentAvailable(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentAvailable.call(this, retval)
    end
    def get_DeltaCompressedContentPreferred(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeltaCompressedContentPreferred.call(this, retval)
    end
    def get_Description(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_EulaAccepted(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaAccepted.call(this, retval)
    end
    def get_EulaText(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EulaText.call(this, retval)
    end
    def get_HandlerID(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HandlerID.call(this, retval)
    end
    def get_Identity(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Identity.call(this, retval)
    end
    def get_Image(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Image.call(this, retval)
    end
    def get_InstallationBehavior(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InstallationBehavior.call(this, retval)
    end
    def get_IsBeta(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBeta.call(this, retval)
    end
    def get_IsDownloaded(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDownloaded.call(this, retval)
    end
    def get_IsHidden(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsHidden.call(this, retval)
    end
    def put_IsHidden(this : IWindowsDriverUpdate5*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsHidden.call(this, value)
    end
    def get_IsInstalled(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsInstalled.call(this, retval)
    end
    def get_IsMandatory(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMandatory.call(this, retval)
    end
    def get_IsUninstallable(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsUninstallable.call(this, retval)
    end
    def get_Languages(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Languages.call(this, retval)
    end
    def get_LastDeploymentChangeTime(this : IWindowsDriverUpdate5*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastDeploymentChangeTime.call(this, retval)
    end
    def get_MaxDownloadSize(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MaxDownloadSize.call(this, retval)
    end
    def get_MinDownloadSize(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinDownloadSize.call(this, retval)
    end
    def get_MoreInfoUrls(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MoreInfoUrls.call(this, retval)
    end
    def get_MsrcSeverity(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MsrcSeverity.call(this, retval)
    end
    def get_RecommendedCpuSpeed(this : IWindowsDriverUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedCpuSpeed.call(this, retval)
    end
    def get_RecommendedHardDiskSpace(this : IWindowsDriverUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedHardDiskSpace.call(this, retval)
    end
    def get_RecommendedMemory(this : IWindowsDriverUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RecommendedMemory.call(this, retval)
    end
    def get_ReleaseNotes(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReleaseNotes.call(this, retval)
    end
    def get_SecurityBulletinIDs(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SecurityBulletinIDs.call(this, retval)
    end
    def get_SupersededUpdateIDs(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupersededUpdateIDs.call(this, retval)
    end
    def get_SupportUrl(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Type(this : IWindowsDriverUpdate5*, retval : Win32cr::System::UpdateAgent::UpdateType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Type.call(this, retval)
    end
    def get_UninstallationNotes(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_UninstallationBehavior(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationBehavior.call(this, retval)
    end
    def get_UninstallationSteps(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_KBArticleIDs(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KBArticleIDs.call(this, retval)
    end
    def accept_eula(this : IWindowsDriverUpdate5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accept_eula.call(this)
    end
    def get_DeploymentAction(this : IWindowsDriverUpdate5*, retval : Win32cr::System::UpdateAgent::DeploymentAction*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeploymentAction.call(this, retval)
    end
    def copy_from_cache(this : IWindowsDriverUpdate5*, path : Win32cr::Foundation::BSTR, toExtractCabFiles : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_from_cache.call(this, path, toExtractCabFiles)
    end
    def get_DownloadPriority(this : IWindowsDriverUpdate5*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadPriority.call(this, retval)
    end
    def get_DownloadContents(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DownloadContents.call(this, retval)
    end
    def get_DriverClass(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverClass.call(this, retval)
    end
    def get_DriverHardwareID(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverHardwareID.call(this, retval)
    end
    def get_DriverManufacturer(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverManufacturer.call(this, retval)
    end
    def get_DriverModel(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverModel.call(this, retval)
    end
    def get_DriverProvider(this : IWindowsDriverUpdate5*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverProvider.call(this, retval)
    end
    def get_DriverVerDate(this : IWindowsDriverUpdate5*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DriverVerDate.call(this, retval)
    end
    def get_DeviceProblemNumber(this : IWindowsDriverUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceProblemNumber.call(this, retval)
    end
    def get_DeviceStatus(this : IWindowsDriverUpdate5*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceStatus.call(this, retval)
    end
    def get_RebootRequired(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_IsPresent(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPresent.call(this, retval)
    end
    def get_CveIDs(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CveIDs.call(this, retval)
    end
    def copy_to_cache(this : IWindowsDriverUpdate5*, pFiles : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_to_cache.call(this, pFiles)
    end
    def get_BrowseOnly(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BrowseOnly.call(this, retval)
    end
    def get_WindowsDriverUpdateEntries(this : IWindowsDriverUpdate5*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowsDriverUpdateEntries.call(this, retval)
    end
    def get_PerUser(this : IWindowsDriverUpdate5*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PerUser.call(this, retval)
    end
    def get_AutoSelection(this : IWindowsDriverUpdate5*, retval : Win32cr::System::UpdateAgent::AutoSelectionMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSelection.call(this, retval)
    end
    def get_AutoDownload(this : IWindowsDriverUpdate5*, retval : Win32cr::System::UpdateAgent::AutoDownloadMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoDownload.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateCollectionVtbl,
    query_interface : Proc(IUpdateCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateCollection*, UInt32),
    release : Proc(IUpdateCollection*, UInt32),
    get_type_info_count : Proc(IUpdateCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUpdateCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    put_Item : Proc(IUpdateCollection*, Int32, Void*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUpdateCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUpdateCollection*, Int32*, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IUpdateCollection*, Int16*, Win32cr::Foundation::HRESULT),
    add : Proc(IUpdateCollection*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    clear : Proc(IUpdateCollection*, Win32cr::Foundation::HRESULT),
    copy : Proc(IUpdateCollection*, Void**, Win32cr::Foundation::HRESULT),
    insert : Proc(IUpdateCollection*, Int32, Void*, Win32cr::Foundation::HRESULT),
    remove_at : Proc(IUpdateCollection*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("07f7438c-7709-4ca5-b518-91279288134e")]
  record IUpdateCollection, lpVtbl : IUpdateCollectionVtbl* do
    GUID = LibC::GUID.new(0x7f7438c_u32, 0x7709_u16, 0x4ca5_u16, StaticArray[0xb5_u8, 0x18_u8, 0x91_u8, 0x27_u8, 0x92_u8, 0x88_u8, 0x13_u8, 0x4e_u8])
    def query_interface(this : IUpdateCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IUpdateCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def put_Item(this : IUpdateCollection*, index : Int32, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Item.call(this, index, value)
    end
    def get__NewEnum(this : IUpdateCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IUpdateCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end
    def get_ReadOnly(this : IUpdateCollection*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def add(this : IUpdateCollection*, value : Void*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, value, retval)
    end
    def clear(this : IUpdateCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this)
    end
    def copy(this : IUpdateCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy.call(this, retval)
    end
    def insert(this : IUpdateCollection*, index : Int32, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert.call(this, index, value)
    end
    def remove_at(this : IUpdateCollection*, index : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_at.call(this, index)
    end

  end

  @[Extern]
  record IUpdateExceptionVtbl,
    query_interface : Proc(IUpdateException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateException*, UInt32),
    release : Proc(IUpdateException*, UInt32),
    get_type_info_count : Proc(IUpdateException*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateException*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateException*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateException*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IUpdateException*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IUpdateException*, Int32*, Win32cr::Foundation::HRESULT),
    get_Context : Proc(IUpdateException*, Win32cr::System::UpdateAgent::UpdateExceptionContext*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a376dd5e-09d4-427f-af7c-fed5b6e1c1d6")]
  record IUpdateException, lpVtbl : IUpdateExceptionVtbl* do
    GUID = LibC::GUID.new(0xa376dd5e_u32, 0x9d4_u16, 0x427f_u16, StaticArray[0xaf_u8, 0x7c_u8, 0xfe_u8, 0xd5_u8, 0xb6_u8, 0xe1_u8, 0xc1_u8, 0xd6_u8])
    def query_interface(this : IUpdateException*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateException*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateException*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateException*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateException*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateException*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateException*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Message(this : IUpdateException*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, retval)
    end
    def get_HResult(this : IUpdateException*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_Context(this : IUpdateException*, retval : Win32cr::System::UpdateAgent::UpdateExceptionContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Context.call(this, retval)
    end

  end

  @[Extern]
  record IInvalidProductLicenseExceptionVtbl,
    query_interface : Proc(IInvalidProductLicenseException*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInvalidProductLicenseException*, UInt32),
    release : Proc(IInvalidProductLicenseException*, UInt32),
    get_type_info_count : Proc(IInvalidProductLicenseException*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInvalidProductLicenseException*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInvalidProductLicenseException*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInvalidProductLicenseException*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IInvalidProductLicenseException*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IInvalidProductLicenseException*, Int32*, Win32cr::Foundation::HRESULT),
    get_Context : Proc(IInvalidProductLicenseException*, Win32cr::System::UpdateAgent::UpdateExceptionContext*, Win32cr::Foundation::HRESULT),
    get_Product : Proc(IInvalidProductLicenseException*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a37d00f5-7bb0-4953-b414-f9e98326f2e8")]
  record IInvalidProductLicenseException, lpVtbl : IInvalidProductLicenseExceptionVtbl* do
    GUID = LibC::GUID.new(0xa37d00f5_u32, 0x7bb0_u16, 0x4953_u16, StaticArray[0xb4_u8, 0x14_u8, 0xf9_u8, 0xe9_u8, 0x83_u8, 0x26_u8, 0xf2_u8, 0xe8_u8])
    def query_interface(this : IInvalidProductLicenseException*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInvalidProductLicenseException*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInvalidProductLicenseException*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInvalidProductLicenseException*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInvalidProductLicenseException*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInvalidProductLicenseException*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInvalidProductLicenseException*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Message(this : IInvalidProductLicenseException*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, retval)
    end
    def get_HResult(this : IInvalidProductLicenseException*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_Context(this : IInvalidProductLicenseException*, retval : Win32cr::System::UpdateAgent::UpdateExceptionContext*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Context.call(this, retval)
    end
    def get_Product(this : IInvalidProductLicenseException*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Product.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateExceptionCollectionVtbl,
    query_interface : Proc(IUpdateExceptionCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateExceptionCollection*, UInt32),
    release : Proc(IUpdateExceptionCollection*, UInt32),
    get_type_info_count : Proc(IUpdateExceptionCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateExceptionCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateExceptionCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateExceptionCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUpdateExceptionCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUpdateExceptionCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUpdateExceptionCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("503626a3-8e14-4729-9355-0fe664bd2321")]
  record IUpdateExceptionCollection, lpVtbl : IUpdateExceptionCollectionVtbl* do
    GUID = LibC::GUID.new(0x503626a3_u32, 0x8e14_u16, 0x4729_u16, StaticArray[0x93_u8, 0x55_u8, 0xf_u8, 0xe6_u8, 0x64_u8, 0xbd_u8, 0x23_u8, 0x21_u8])
    def query_interface(this : IUpdateExceptionCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateExceptionCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateExceptionCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateExceptionCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateExceptionCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateExceptionCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateExceptionCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IUpdateExceptionCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def get__NewEnum(this : IUpdateExceptionCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IUpdateExceptionCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end

  end

  @[Extern]
  record ISearchResultVtbl,
    query_interface : Proc(ISearchResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISearchResult*, UInt32),
    release : Proc(ISearchResult*, UInt32),
    get_type_info_count : Proc(ISearchResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISearchResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISearchResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISearchResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(ISearchResult*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT),
    get_RootCategories : Proc(ISearchResult*, Void**, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(ISearchResult*, Void**, Win32cr::Foundation::HRESULT),
    get_Warnings : Proc(ISearchResult*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d40cff62-e08c-4498-941a-01e25f0fd33c")]
  record ISearchResult, lpVtbl : ISearchResultVtbl* do
    GUID = LibC::GUID.new(0xd40cff62_u32, 0xe08c_u16, 0x4498_u16, StaticArray[0x94_u8, 0x1a_u8, 0x1_u8, 0xe2_u8, 0x5f_u8, 0xf_u8, 0xd3_u8, 0x3c_u8])
    def query_interface(this : ISearchResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISearchResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISearchResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISearchResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISearchResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISearchResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISearchResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ResultCode(this : ISearchResult*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end
    def get_RootCategories(this : ISearchResult*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RootCategories.call(this, retval)
    end
    def get_Updates(this : ISearchResult*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def get_Warnings(this : ISearchResult*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Warnings.call(this, retval)
    end

  end

  @[Extern]
  record ISearchJobVtbl,
    query_interface : Proc(ISearchJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISearchJob*, UInt32),
    release : Proc(ISearchJob*, UInt32),
    get_type_info_count : Proc(ISearchJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISearchJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISearchJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISearchJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AsyncState : Proc(ISearchJob*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsCompleted : Proc(ISearchJob*, Int16*, Win32cr::Foundation::HRESULT),
    clean_up : Proc(ISearchJob*, Win32cr::Foundation::HRESULT),
    request_abort : Proc(ISearchJob*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7366ea16-7a1a-4ea2-b042-973d3e9cd99b")]
  record ISearchJob, lpVtbl : ISearchJobVtbl* do
    GUID = LibC::GUID.new(0x7366ea16_u32, 0x7a1a_u16, 0x4ea2_u16, StaticArray[0xb0_u8, 0x42_u8, 0x97_u8, 0x3d_u8, 0x3e_u8, 0x9c_u8, 0xd9_u8, 0x9b_u8])
    def query_interface(this : ISearchJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISearchJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISearchJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISearchJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISearchJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISearchJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISearchJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AsyncState(this : ISearchJob*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AsyncState.call(this, retval)
    end
    def get_IsCompleted(this : ISearchJob*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsCompleted.call(this, retval)
    end
    def clean_up(this : ISearchJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clean_up.call(this)
    end
    def request_abort(this : ISearchJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_abort.call(this)
    end

  end

  @[Extern]
  record ISearchCompletedCallbackArgsVtbl,
    query_interface : Proc(ISearchCompletedCallbackArgs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISearchCompletedCallbackArgs*, UInt32),
    release : Proc(ISearchCompletedCallbackArgs*, UInt32),
    get_type_info_count : Proc(ISearchCompletedCallbackArgs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISearchCompletedCallbackArgs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISearchCompletedCallbackArgs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISearchCompletedCallbackArgs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a700a634-2850-4c47-938a-9e4b6e5af9a6")]
  record ISearchCompletedCallbackArgs, lpVtbl : ISearchCompletedCallbackArgsVtbl* do
    GUID = LibC::GUID.new(0xa700a634_u32, 0x2850_u16, 0x4c47_u16, StaticArray[0x93_u8, 0x8a_u8, 0x9e_u8, 0x4b_u8, 0x6e_u8, 0x5a_u8, 0xf9_u8, 0xa6_u8])
    def query_interface(this : ISearchCompletedCallbackArgs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISearchCompletedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISearchCompletedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISearchCompletedCallbackArgs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISearchCompletedCallbackArgs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISearchCompletedCallbackArgs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISearchCompletedCallbackArgs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record ISearchCompletedCallbackVtbl,
    query_interface : Proc(ISearchCompletedCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISearchCompletedCallback*, UInt32),
    release : Proc(ISearchCompletedCallback*, UInt32),
    invoke : Proc(ISearchCompletedCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("88aee058-d4b0-4725-a2f1-814a67ae964c")]
  record ISearchCompletedCallback, lpVtbl : ISearchCompletedCallbackVtbl* do
    GUID = LibC::GUID.new(0x88aee058_u32, 0xd4b0_u16, 0x4725_u16, StaticArray[0xa2_u8, 0xf1_u8, 0x81_u8, 0x4a_u8, 0x67_u8, 0xae_u8, 0x96_u8, 0x4c_u8])
    def query_interface(this : ISearchCompletedCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISearchCompletedCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISearchCompletedCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : ISearchCompletedCallback*, searchJob : Void*, callbackArgs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, searchJob, callbackArgs)
    end

  end

  @[Extern]
  record IUpdateHistoryEntryVtbl,
    query_interface : Proc(IUpdateHistoryEntry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateHistoryEntry*, UInt32),
    release : Proc(IUpdateHistoryEntry*, UInt32),
    get_type_info_count : Proc(IUpdateHistoryEntry*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateHistoryEntry*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateHistoryEntry*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateHistoryEntry*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Operation : Proc(IUpdateHistoryEntry*, Win32cr::System::UpdateAgent::UpdateOperation*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(IUpdateHistoryEntry*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IUpdateHistoryEntry*, Int32*, Win32cr::Foundation::HRESULT),
    get_Date : Proc(IUpdateHistoryEntry*, Float64*, Win32cr::Foundation::HRESULT),
    get_UpdateIdentity : Proc(IUpdateHistoryEntry*, Void**, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdateHistoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdateHistoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UnmappedResultCode : Proc(IUpdateHistoryEntry*, Int32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateHistoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServerSelection : Proc(IUpdateHistoryEntry*, Win32cr::System::UpdateAgent::ServerSelection*, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateHistoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdateHistoryEntry*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdateHistoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdateHistoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("be56a644-af0e-4e0e-a311-c1d8e695cbff")]
  record IUpdateHistoryEntry, lpVtbl : IUpdateHistoryEntryVtbl* do
    GUID = LibC::GUID.new(0xbe56a644_u32, 0xaf0e_u16, 0x4e0e_u16, StaticArray[0xa3_u8, 0x11_u8, 0xc1_u8, 0xd8_u8, 0xe6_u8, 0x95_u8, 0xcb_u8, 0xff_u8])
    def query_interface(this : IUpdateHistoryEntry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateHistoryEntry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateHistoryEntry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateHistoryEntry*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateHistoryEntry*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateHistoryEntry*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateHistoryEntry*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Operation(this : IUpdateHistoryEntry*, retval : Win32cr::System::UpdateAgent::UpdateOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operation.call(this, retval)
    end
    def get_ResultCode(this : IUpdateHistoryEntry*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end
    def get_HResult(this : IUpdateHistoryEntry*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_Date(this : IUpdateHistoryEntry*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Date.call(this, retval)
    end
    def get_UpdateIdentity(this : IUpdateHistoryEntry*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdateIdentity.call(this, retval)
    end
    def get_Title(this : IUpdateHistoryEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_Description(this : IUpdateHistoryEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_UnmappedResultCode(this : IUpdateHistoryEntry*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UnmappedResultCode.call(this, retval)
    end
    def get_ClientApplicationID(this : IUpdateHistoryEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def get_ServerSelection(this : IUpdateHistoryEntry*, retval : Win32cr::System::UpdateAgent::ServerSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerSelection.call(this, retval)
    end
    def get_ServiceID(this : IUpdateHistoryEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdateHistoryEntry*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdateHistoryEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_SupportUrl(this : IUpdateHistoryEntry*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateHistoryEntry2Vtbl,
    query_interface : Proc(IUpdateHistoryEntry2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateHistoryEntry2*, UInt32),
    release : Proc(IUpdateHistoryEntry2*, UInt32),
    get_type_info_count : Proc(IUpdateHistoryEntry2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateHistoryEntry2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateHistoryEntry2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateHistoryEntry2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Operation : Proc(IUpdateHistoryEntry2*, Win32cr::System::UpdateAgent::UpdateOperation*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(IUpdateHistoryEntry2*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IUpdateHistoryEntry2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Date : Proc(IUpdateHistoryEntry2*, Float64*, Win32cr::Foundation::HRESULT),
    get_UpdateIdentity : Proc(IUpdateHistoryEntry2*, Void**, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IUpdateHistoryEntry2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IUpdateHistoryEntry2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UnmappedResultCode : Proc(IUpdateHistoryEntry2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateHistoryEntry2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ServerSelection : Proc(IUpdateHistoryEntry2*, Win32cr::System::UpdateAgent::ServerSelection*, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateHistoryEntry2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UninstallationSteps : Proc(IUpdateHistoryEntry2*, Void**, Win32cr::Foundation::HRESULT),
    get_UninstallationNotes : Proc(IUpdateHistoryEntry2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SupportUrl : Proc(IUpdateHistoryEntry2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Categories : Proc(IUpdateHistoryEntry2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c2bfb780-4539-4132-ab8c-0a8772013ab6")]
  record IUpdateHistoryEntry2, lpVtbl : IUpdateHistoryEntry2Vtbl* do
    GUID = LibC::GUID.new(0xc2bfb780_u32, 0x4539_u16, 0x4132_u16, StaticArray[0xab_u8, 0x8c_u8, 0xa_u8, 0x87_u8, 0x72_u8, 0x1_u8, 0x3a_u8, 0xb6_u8])
    def query_interface(this : IUpdateHistoryEntry2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateHistoryEntry2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateHistoryEntry2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateHistoryEntry2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateHistoryEntry2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateHistoryEntry2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateHistoryEntry2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Operation(this : IUpdateHistoryEntry2*, retval : Win32cr::System::UpdateAgent::UpdateOperation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Operation.call(this, retval)
    end
    def get_ResultCode(this : IUpdateHistoryEntry2*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end
    def get_HResult(this : IUpdateHistoryEntry2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_Date(this : IUpdateHistoryEntry2*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Date.call(this, retval)
    end
    def get_UpdateIdentity(this : IUpdateHistoryEntry2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UpdateIdentity.call(this, retval)
    end
    def get_Title(this : IUpdateHistoryEntry2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, retval)
    end
    def get_Description(this : IUpdateHistoryEntry2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, retval)
    end
    def get_UnmappedResultCode(this : IUpdateHistoryEntry2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UnmappedResultCode.call(this, retval)
    end
    def get_ClientApplicationID(this : IUpdateHistoryEntry2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def get_ServerSelection(this : IUpdateHistoryEntry2*, retval : Win32cr::System::UpdateAgent::ServerSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerSelection.call(this, retval)
    end
    def get_ServiceID(this : IUpdateHistoryEntry2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def get_UninstallationSteps(this : IUpdateHistoryEntry2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationSteps.call(this, retval)
    end
    def get_UninstallationNotes(this : IUpdateHistoryEntry2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UninstallationNotes.call(this, retval)
    end
    def get_SupportUrl(this : IUpdateHistoryEntry2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportUrl.call(this, retval)
    end
    def get_Categories(this : IUpdateHistoryEntry2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Categories.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateHistoryEntryCollectionVtbl,
    query_interface : Proc(IUpdateHistoryEntryCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateHistoryEntryCollection*, UInt32),
    release : Proc(IUpdateHistoryEntryCollection*, UInt32),
    get_type_info_count : Proc(IUpdateHistoryEntryCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateHistoryEntryCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateHistoryEntryCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateHistoryEntryCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUpdateHistoryEntryCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUpdateHistoryEntryCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUpdateHistoryEntryCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a7f04f3c-a290-435b-aadf-a116c3357a5c")]
  record IUpdateHistoryEntryCollection, lpVtbl : IUpdateHistoryEntryCollectionVtbl* do
    GUID = LibC::GUID.new(0xa7f04f3c_u32, 0xa290_u16, 0x435b_u16, StaticArray[0xaa_u8, 0xdf_u8, 0xa1_u8, 0x16_u8, 0xc3_u8, 0x35_u8, 0x7a_u8, 0x5c_u8])
    def query_interface(this : IUpdateHistoryEntryCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateHistoryEntryCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateHistoryEntryCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateHistoryEntryCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateHistoryEntryCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateHistoryEntryCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateHistoryEntryCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IUpdateHistoryEntryCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def get__NewEnum(this : IUpdateHistoryEntryCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IUpdateHistoryEntryCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateSearcherVtbl,
    query_interface : Proc(IUpdateSearcher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateSearcher*, UInt32),
    release : Proc(IUpdateSearcher*, UInt32),
    get_type_info_count : Proc(IUpdateSearcher*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateSearcher*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateSearcher*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateSearcher*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CanAutomaticallyUpgradeService : Proc(IUpdateSearcher*, Int16*, Win32cr::Foundation::HRESULT),
    put_CanAutomaticallyUpgradeService : Proc(IUpdateSearcher*, Int16, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IncludePotentiallySupersededUpdates : Proc(IUpdateSearcher*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncludePotentiallySupersededUpdates : Proc(IUpdateSearcher*, Int16, Win32cr::Foundation::HRESULT),
    get_ServerSelection : Proc(IUpdateSearcher*, Win32cr::System::UpdateAgent::ServerSelection*, Win32cr::Foundation::HRESULT),
    put_ServerSelection : Proc(IUpdateSearcher*, Win32cr::System::UpdateAgent::ServerSelection, Win32cr::Foundation::HRESULT),
    begin_search : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_search : Proc(IUpdateSearcher*, Void*, Void**, Win32cr::Foundation::HRESULT),
    escape_string : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_history : Proc(IUpdateSearcher*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    search : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Online : Proc(IUpdateSearcher*, Int16*, Win32cr::Foundation::HRESULT),
    put_Online : Proc(IUpdateSearcher*, Int16, Win32cr::Foundation::HRESULT),
    get_total_history_count : Proc(IUpdateSearcher*, Int32*, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceID : Proc(IUpdateSearcher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8f45abf1-f9ae-4b95-a933-f0f66e5056ea")]
  record IUpdateSearcher, lpVtbl : IUpdateSearcherVtbl* do
    GUID = LibC::GUID.new(0x8f45abf1_u32, 0xf9ae_u16, 0x4b95_u16, StaticArray[0xa9_u8, 0x33_u8, 0xf0_u8, 0xf6_u8, 0x6e_u8, 0x50_u8, 0x56_u8, 0xea_u8])
    def query_interface(this : IUpdateSearcher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateSearcher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateSearcher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateSearcher*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateSearcher*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateSearcher*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateSearcher*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CanAutomaticallyUpgradeService(this : IUpdateSearcher*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanAutomaticallyUpgradeService.call(this, retval)
    end
    def put_CanAutomaticallyUpgradeService(this : IUpdateSearcher*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CanAutomaticallyUpgradeService.call(this, value)
    end
    def get_ClientApplicationID(this : IUpdateSearcher*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateSearcher*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IncludePotentiallySupersededUpdates(this : IUpdateSearcher*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludePotentiallySupersededUpdates.call(this, retval)
    end
    def put_IncludePotentiallySupersededUpdates(this : IUpdateSearcher*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludePotentiallySupersededUpdates.call(this, value)
    end
    def get_ServerSelection(this : IUpdateSearcher*, retval : Win32cr::System::UpdateAgent::ServerSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerSelection.call(this, retval)
    end
    def put_ServerSelection(this : IUpdateSearcher*, value : Win32cr::System::UpdateAgent::ServerSelection) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServerSelection.call(this, value)
    end
    def begin_search(this : IUpdateSearcher*, criteria : Win32cr::Foundation::BSTR, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_search.call(this, criteria, onCompleted, state, retval)
    end
    def end_search(this : IUpdateSearcher*, searchJob : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_search.call(this, searchJob, retval)
    end
    def escape_string(this : IUpdateSearcher*, unescaped : Win32cr::Foundation::BSTR, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_string.call(this, unescaped, retval)
    end
    def query_history(this : IUpdateSearcher*, startIndex : Int32, count : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_history.call(this, startIndex, count, retval)
    end
    def search(this : IUpdateSearcher*, criteria : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search.call(this, criteria, retval)
    end
    def get_Online(this : IUpdateSearcher*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Online.call(this, retval)
    end
    def put_Online(this : IUpdateSearcher*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Online.call(this, value)
    end
    def get_total_history_count(this : IUpdateSearcher*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_history_count.call(this, retval)
    end
    def get_ServiceID(this : IUpdateSearcher*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def put_ServiceID(this : IUpdateSearcher*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceID.call(this, value)
    end

  end

  @[Extern]
  record IUpdateSearcher2Vtbl,
    query_interface : Proc(IUpdateSearcher2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateSearcher2*, UInt32),
    release : Proc(IUpdateSearcher2*, UInt32),
    get_type_info_count : Proc(IUpdateSearcher2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateSearcher2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateSearcher2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateSearcher2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CanAutomaticallyUpgradeService : Proc(IUpdateSearcher2*, Int16*, Win32cr::Foundation::HRESULT),
    put_CanAutomaticallyUpgradeService : Proc(IUpdateSearcher2*, Int16, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IncludePotentiallySupersededUpdates : Proc(IUpdateSearcher2*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncludePotentiallySupersededUpdates : Proc(IUpdateSearcher2*, Int16, Win32cr::Foundation::HRESULT),
    get_ServerSelection : Proc(IUpdateSearcher2*, Win32cr::System::UpdateAgent::ServerSelection*, Win32cr::Foundation::HRESULT),
    put_ServerSelection : Proc(IUpdateSearcher2*, Win32cr::System::UpdateAgent::ServerSelection, Win32cr::Foundation::HRESULT),
    begin_search : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_search : Proc(IUpdateSearcher2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    escape_string : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_history : Proc(IUpdateSearcher2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    search : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Online : Proc(IUpdateSearcher2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Online : Proc(IUpdateSearcher2*, Int16, Win32cr::Foundation::HRESULT),
    get_total_history_count : Proc(IUpdateSearcher2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceID : Proc(IUpdateSearcher2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IgnoreDownloadPriority : Proc(IUpdateSearcher2*, Int16*, Win32cr::Foundation::HRESULT),
    put_IgnoreDownloadPriority : Proc(IUpdateSearcher2*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4cbdcb2d-1589-4beb-bd1c-3e582ff0add0")]
  record IUpdateSearcher2, lpVtbl : IUpdateSearcher2Vtbl* do
    GUID = LibC::GUID.new(0x4cbdcb2d_u32, 0x1589_u16, 0x4beb_u16, StaticArray[0xbd_u8, 0x1c_u8, 0x3e_u8, 0x58_u8, 0x2f_u8, 0xf0_u8, 0xad_u8, 0xd0_u8])
    def query_interface(this : IUpdateSearcher2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateSearcher2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateSearcher2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateSearcher2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateSearcher2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateSearcher2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateSearcher2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CanAutomaticallyUpgradeService(this : IUpdateSearcher2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanAutomaticallyUpgradeService.call(this, retval)
    end
    def put_CanAutomaticallyUpgradeService(this : IUpdateSearcher2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CanAutomaticallyUpgradeService.call(this, value)
    end
    def get_ClientApplicationID(this : IUpdateSearcher2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateSearcher2*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IncludePotentiallySupersededUpdates(this : IUpdateSearcher2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludePotentiallySupersededUpdates.call(this, retval)
    end
    def put_IncludePotentiallySupersededUpdates(this : IUpdateSearcher2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludePotentiallySupersededUpdates.call(this, value)
    end
    def get_ServerSelection(this : IUpdateSearcher2*, retval : Win32cr::System::UpdateAgent::ServerSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerSelection.call(this, retval)
    end
    def put_ServerSelection(this : IUpdateSearcher2*, value : Win32cr::System::UpdateAgent::ServerSelection) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServerSelection.call(this, value)
    end
    def begin_search(this : IUpdateSearcher2*, criteria : Win32cr::Foundation::BSTR, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_search.call(this, criteria, onCompleted, state, retval)
    end
    def end_search(this : IUpdateSearcher2*, searchJob : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_search.call(this, searchJob, retval)
    end
    def escape_string(this : IUpdateSearcher2*, unescaped : Win32cr::Foundation::BSTR, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_string.call(this, unescaped, retval)
    end
    def query_history(this : IUpdateSearcher2*, startIndex : Int32, count : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_history.call(this, startIndex, count, retval)
    end
    def search(this : IUpdateSearcher2*, criteria : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search.call(this, criteria, retval)
    end
    def get_Online(this : IUpdateSearcher2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Online.call(this, retval)
    end
    def put_Online(this : IUpdateSearcher2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Online.call(this, value)
    end
    def get_total_history_count(this : IUpdateSearcher2*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_history_count.call(this, retval)
    end
    def get_ServiceID(this : IUpdateSearcher2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def put_ServiceID(this : IUpdateSearcher2*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceID.call(this, value)
    end
    def get_IgnoreDownloadPriority(this : IUpdateSearcher2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IgnoreDownloadPriority.call(this, retval)
    end
    def put_IgnoreDownloadPriority(this : IUpdateSearcher2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IgnoreDownloadPriority.call(this, value)
    end

  end

  @[Extern]
  record IUpdateSearcher3Vtbl,
    query_interface : Proc(IUpdateSearcher3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateSearcher3*, UInt32),
    release : Proc(IUpdateSearcher3*, UInt32),
    get_type_info_count : Proc(IUpdateSearcher3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateSearcher3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateSearcher3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateSearcher3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CanAutomaticallyUpgradeService : Proc(IUpdateSearcher3*, Int16*, Win32cr::Foundation::HRESULT),
    put_CanAutomaticallyUpgradeService : Proc(IUpdateSearcher3*, Int16, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IncludePotentiallySupersededUpdates : Proc(IUpdateSearcher3*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncludePotentiallySupersededUpdates : Proc(IUpdateSearcher3*, Int16, Win32cr::Foundation::HRESULT),
    get_ServerSelection : Proc(IUpdateSearcher3*, Win32cr::System::UpdateAgent::ServerSelection*, Win32cr::Foundation::HRESULT),
    put_ServerSelection : Proc(IUpdateSearcher3*, Win32cr::System::UpdateAgent::ServerSelection, Win32cr::Foundation::HRESULT),
    begin_search : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_search : Proc(IUpdateSearcher3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    escape_string : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_history : Proc(IUpdateSearcher3*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    search : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Online : Proc(IUpdateSearcher3*, Int16*, Win32cr::Foundation::HRESULT),
    put_Online : Proc(IUpdateSearcher3*, Int16, Win32cr::Foundation::HRESULT),
    get_total_history_count : Proc(IUpdateSearcher3*, Int32*, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ServiceID : Proc(IUpdateSearcher3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IgnoreDownloadPriority : Proc(IUpdateSearcher3*, Int16*, Win32cr::Foundation::HRESULT),
    put_IgnoreDownloadPriority : Proc(IUpdateSearcher3*, Int16, Win32cr::Foundation::HRESULT),
    get_SearchScope : Proc(IUpdateSearcher3*, Win32cr::System::UpdateAgent::SearchScope*, Win32cr::Foundation::HRESULT),
    put_SearchScope : Proc(IUpdateSearcher3*, Win32cr::System::UpdateAgent::SearchScope, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("04c6895d-eaf2-4034-97f3-311de9be413a")]
  record IUpdateSearcher3, lpVtbl : IUpdateSearcher3Vtbl* do
    GUID = LibC::GUID.new(0x4c6895d_u32, 0xeaf2_u16, 0x4034_u16, StaticArray[0x97_u8, 0xf3_u8, 0x31_u8, 0x1d_u8, 0xe9_u8, 0xbe_u8, 0x41_u8, 0x3a_u8])
    def query_interface(this : IUpdateSearcher3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateSearcher3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateSearcher3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateSearcher3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateSearcher3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateSearcher3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateSearcher3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CanAutomaticallyUpgradeService(this : IUpdateSearcher3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanAutomaticallyUpgradeService.call(this, retval)
    end
    def put_CanAutomaticallyUpgradeService(this : IUpdateSearcher3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CanAutomaticallyUpgradeService.call(this, value)
    end
    def get_ClientApplicationID(this : IUpdateSearcher3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateSearcher3*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IncludePotentiallySupersededUpdates(this : IUpdateSearcher3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncludePotentiallySupersededUpdates.call(this, retval)
    end
    def put_IncludePotentiallySupersededUpdates(this : IUpdateSearcher3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncludePotentiallySupersededUpdates.call(this, value)
    end
    def get_ServerSelection(this : IUpdateSearcher3*, retval : Win32cr::System::UpdateAgent::ServerSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerSelection.call(this, retval)
    end
    def put_ServerSelection(this : IUpdateSearcher3*, value : Win32cr::System::UpdateAgent::ServerSelection) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServerSelection.call(this, value)
    end
    def begin_search(this : IUpdateSearcher3*, criteria : Win32cr::Foundation::BSTR, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_search.call(this, criteria, onCompleted, state, retval)
    end
    def end_search(this : IUpdateSearcher3*, searchJob : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_search.call(this, searchJob, retval)
    end
    def escape_string(this : IUpdateSearcher3*, unescaped : Win32cr::Foundation::BSTR, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape_string.call(this, unescaped, retval)
    end
    def query_history(this : IUpdateSearcher3*, startIndex : Int32, count : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_history.call(this, startIndex, count, retval)
    end
    def search(this : IUpdateSearcher3*, criteria : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.search.call(this, criteria, retval)
    end
    def get_Online(this : IUpdateSearcher3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Online.call(this, retval)
    end
    def put_Online(this : IUpdateSearcher3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Online.call(this, value)
    end
    def get_total_history_count(this : IUpdateSearcher3*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_total_history_count.call(this, retval)
    end
    def get_ServiceID(this : IUpdateSearcher3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def put_ServiceID(this : IUpdateSearcher3*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServiceID.call(this, value)
    end
    def get_IgnoreDownloadPriority(this : IUpdateSearcher3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IgnoreDownloadPriority.call(this, retval)
    end
    def put_IgnoreDownloadPriority(this : IUpdateSearcher3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IgnoreDownloadPriority.call(this, value)
    end
    def get_SearchScope(this : IUpdateSearcher3*, retval : Win32cr::System::UpdateAgent::SearchScope*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SearchScope.call(this, retval)
    end
    def put_SearchScope(this : IUpdateSearcher3*, value : Win32cr::System::UpdateAgent::SearchScope) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SearchScope.call(this, value)
    end

  end

  @[Extern]
  record IUpdateDownloadResultVtbl,
    query_interface : Proc(IUpdateDownloadResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateDownloadResult*, UInt32),
    release : Proc(IUpdateDownloadResult*, UInt32),
    get_type_info_count : Proc(IUpdateDownloadResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateDownloadResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateDownloadResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateDownloadResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IUpdateDownloadResult*, Int32*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(IUpdateDownloadResult*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bf99af76-b575-42ad-8aa4-33cbb5477af1")]
  record IUpdateDownloadResult, lpVtbl : IUpdateDownloadResultVtbl* do
    GUID = LibC::GUID.new(0xbf99af76_u32, 0xb575_u16, 0x42ad_u16, StaticArray[0x8a_u8, 0xa4_u8, 0x33_u8, 0xcb_u8, 0xb5_u8, 0x47_u8, 0x7a_u8, 0xf1_u8])
    def query_interface(this : IUpdateDownloadResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateDownloadResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateDownloadResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateDownloadResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateDownloadResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateDownloadResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateDownloadResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_HResult(this : IUpdateDownloadResult*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_ResultCode(this : IUpdateDownloadResult*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end

  end

  @[Extern]
  record IDownloadResultVtbl,
    query_interface : Proc(IDownloadResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadResult*, UInt32),
    release : Proc(IDownloadResult*, UInt32),
    get_type_info_count : Proc(IDownloadResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDownloadResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDownloadResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDownloadResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IDownloadResult*, Int32*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(IDownloadResult*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT),
    get_update_result : Proc(IDownloadResult*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("daa4fdd0-4727-4dbe-a1e7-745dca317144")]
  record IDownloadResult, lpVtbl : IDownloadResultVtbl* do
    GUID = LibC::GUID.new(0xdaa4fdd0_u32, 0x4727_u16, 0x4dbe_u16, StaticArray[0xa1_u8, 0xe7_u8, 0x74_u8, 0x5d_u8, 0xca_u8, 0x31_u8, 0x71_u8, 0x44_u8])
    def query_interface(this : IDownloadResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDownloadResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDownloadResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDownloadResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDownloadResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_HResult(this : IDownloadResult*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_ResultCode(this : IDownloadResult*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end
    def get_update_result(this : IDownloadResult*, updateIndex : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_result.call(this, updateIndex, retval)
    end

  end

  @[Extern]
  record IDownloadProgressVtbl,
    query_interface : Proc(IDownloadProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadProgress*, UInt32),
    release : Proc(IDownloadProgress*, UInt32),
    get_type_info_count : Proc(IDownloadProgress*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDownloadProgress*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDownloadProgress*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDownloadProgress*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentUpdateBytesDownloaded : Proc(IDownloadProgress*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_CurrentUpdateBytesToDownload : Proc(IDownloadProgress*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_CurrentUpdateIndex : Proc(IDownloadProgress*, Int32*, Win32cr::Foundation::HRESULT),
    get_PercentComplete : Proc(IDownloadProgress*, Int32*, Win32cr::Foundation::HRESULT),
    get_TotalBytesDownloaded : Proc(IDownloadProgress*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_TotalBytesToDownload : Proc(IDownloadProgress*, Win32cr::Foundation::DECIMAL*, Win32cr::Foundation::HRESULT),
    get_update_result : Proc(IDownloadProgress*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentUpdateDownloadPhase : Proc(IDownloadProgress*, Win32cr::System::UpdateAgent::DownloadPhase*, Win32cr::Foundation::HRESULT),
    get_CurrentUpdatePercentComplete : Proc(IDownloadProgress*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d31a5bac-f719-4178-9dbb-5e2cb47fd18a")]
  record IDownloadProgress, lpVtbl : IDownloadProgressVtbl* do
    GUID = LibC::GUID.new(0xd31a5bac_u32, 0xf719_u16, 0x4178_u16, StaticArray[0x9d_u8, 0xbb_u8, 0x5e_u8, 0x2c_u8, 0xb4_u8, 0x7f_u8, 0xd1_u8, 0x8a_u8])
    def query_interface(this : IDownloadProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDownloadProgress*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDownloadProgress*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDownloadProgress*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDownloadProgress*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CurrentUpdateBytesDownloaded(this : IDownloadProgress*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdateBytesDownloaded.call(this, retval)
    end
    def get_CurrentUpdateBytesToDownload(this : IDownloadProgress*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdateBytesToDownload.call(this, retval)
    end
    def get_CurrentUpdateIndex(this : IDownloadProgress*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdateIndex.call(this, retval)
    end
    def get_PercentComplete(this : IDownloadProgress*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PercentComplete.call(this, retval)
    end
    def get_TotalBytesDownloaded(this : IDownloadProgress*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TotalBytesDownloaded.call(this, retval)
    end
    def get_TotalBytesToDownload(this : IDownloadProgress*, retval : Win32cr::Foundation::DECIMAL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TotalBytesToDownload.call(this, retval)
    end
    def get_update_result(this : IDownloadProgress*, updateIndex : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_result.call(this, updateIndex, retval)
    end
    def get_CurrentUpdateDownloadPhase(this : IDownloadProgress*, retval : Win32cr::System::UpdateAgent::DownloadPhase*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdateDownloadPhase.call(this, retval)
    end
    def get_CurrentUpdatePercentComplete(this : IDownloadProgress*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdatePercentComplete.call(this, retval)
    end

  end

  @[Extern]
  record IDownloadJobVtbl,
    query_interface : Proc(IDownloadJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadJob*, UInt32),
    release : Proc(IDownloadJob*, UInt32),
    get_type_info_count : Proc(IDownloadJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDownloadJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDownloadJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDownloadJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AsyncState : Proc(IDownloadJob*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsCompleted : Proc(IDownloadJob*, Int16*, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IDownloadJob*, Void**, Win32cr::Foundation::HRESULT),
    clean_up : Proc(IDownloadJob*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IDownloadJob*, Void**, Win32cr::Foundation::HRESULT),
    request_abort : Proc(IDownloadJob*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c574de85-7358-43f6-aae8-8697e62d8ba7")]
  record IDownloadJob, lpVtbl : IDownloadJobVtbl* do
    GUID = LibC::GUID.new(0xc574de85_u32, 0x7358_u16, 0x43f6_u16, StaticArray[0xaa_u8, 0xe8_u8, 0x86_u8, 0x97_u8, 0xe6_u8, 0x2d_u8, 0x8b_u8, 0xa7_u8])
    def query_interface(this : IDownloadJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDownloadJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDownloadJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDownloadJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDownloadJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AsyncState(this : IDownloadJob*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AsyncState.call(this, retval)
    end
    def get_IsCompleted(this : IDownloadJob*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsCompleted.call(this, retval)
    end
    def get_Updates(this : IDownloadJob*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def clean_up(this : IDownloadJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clean_up.call(this)
    end
    def get_progress(this : IDownloadJob*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, retval)
    end
    def request_abort(this : IDownloadJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_abort.call(this)
    end

  end

  @[Extern]
  record IDownloadCompletedCallbackArgsVtbl,
    query_interface : Proc(IDownloadCompletedCallbackArgs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadCompletedCallbackArgs*, UInt32),
    release : Proc(IDownloadCompletedCallbackArgs*, UInt32),
    get_type_info_count : Proc(IDownloadCompletedCallbackArgs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDownloadCompletedCallbackArgs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDownloadCompletedCallbackArgs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDownloadCompletedCallbackArgs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fa565b23-498c-47a0-979d-e7d5b1813360")]
  record IDownloadCompletedCallbackArgs, lpVtbl : IDownloadCompletedCallbackArgsVtbl* do
    GUID = LibC::GUID.new(0xfa565b23_u32, 0x498c_u16, 0x47a0_u16, StaticArray[0x97_u8, 0x9d_u8, 0xe7_u8, 0xd5_u8, 0xb1_u8, 0x81_u8, 0x33_u8, 0x60_u8])
    def query_interface(this : IDownloadCompletedCallbackArgs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadCompletedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadCompletedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDownloadCompletedCallbackArgs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDownloadCompletedCallbackArgs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDownloadCompletedCallbackArgs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDownloadCompletedCallbackArgs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IDownloadCompletedCallbackVtbl,
    query_interface : Proc(IDownloadCompletedCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadCompletedCallback*, UInt32),
    release : Proc(IDownloadCompletedCallback*, UInt32),
    invoke : Proc(IDownloadCompletedCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("77254866-9f5b-4c8e-b9e2-c77a8530d64b")]
  record IDownloadCompletedCallback, lpVtbl : IDownloadCompletedCallbackVtbl* do
    GUID = LibC::GUID.new(0x77254866_u32, 0x9f5b_u16, 0x4c8e_u16, StaticArray[0xb9_u8, 0xe2_u8, 0xc7_u8, 0x7a_u8, 0x85_u8, 0x30_u8, 0xd6_u8, 0x4b_u8])
    def query_interface(this : IDownloadCompletedCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadCompletedCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadCompletedCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IDownloadCompletedCallback*, downloadJob : Void*, callbackArgs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, downloadJob, callbackArgs)
    end

  end

  @[Extern]
  record IDownloadProgressChangedCallbackArgsVtbl,
    query_interface : Proc(IDownloadProgressChangedCallbackArgs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadProgressChangedCallbackArgs*, UInt32),
    release : Proc(IDownloadProgressChangedCallbackArgs*, UInt32),
    get_type_info_count : Proc(IDownloadProgressChangedCallbackArgs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IDownloadProgressChangedCallbackArgs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IDownloadProgressChangedCallbackArgs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IDownloadProgressChangedCallbackArgs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Progress : Proc(IDownloadProgressChangedCallbackArgs*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("324ff2c6-4981-4b04-9412-57481745ab24")]
  record IDownloadProgressChangedCallbackArgs, lpVtbl : IDownloadProgressChangedCallbackArgsVtbl* do
    GUID = LibC::GUID.new(0x324ff2c6_u32, 0x4981_u16, 0x4b04_u16, StaticArray[0x94_u8, 0x12_u8, 0x57_u8, 0x48_u8, 0x17_u8, 0x45_u8, 0xab_u8, 0x24_u8])
    def query_interface(this : IDownloadProgressChangedCallbackArgs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadProgressChangedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadProgressChangedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IDownloadProgressChangedCallbackArgs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IDownloadProgressChangedCallbackArgs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IDownloadProgressChangedCallbackArgs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IDownloadProgressChangedCallbackArgs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Progress(this : IDownloadProgressChangedCallbackArgs*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Progress.call(this, retval)
    end

  end

  @[Extern]
  record IDownloadProgressChangedCallbackVtbl,
    query_interface : Proc(IDownloadProgressChangedCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDownloadProgressChangedCallback*, UInt32),
    release : Proc(IDownloadProgressChangedCallback*, UInt32),
    invoke : Proc(IDownloadProgressChangedCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8c3f1cdd-6173-4591-aebd-a56a53ca77c1")]
  record IDownloadProgressChangedCallback, lpVtbl : IDownloadProgressChangedCallbackVtbl* do
    GUID = LibC::GUID.new(0x8c3f1cdd_u32, 0x6173_u16, 0x4591_u16, StaticArray[0xae_u8, 0xbd_u8, 0xa5_u8, 0x6a_u8, 0x53_u8, 0xca_u8, 0x77_u8, 0xc1_u8])
    def query_interface(this : IDownloadProgressChangedCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDownloadProgressChangedCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDownloadProgressChangedCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IDownloadProgressChangedCallback*, downloadJob : Void*, callbackArgs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, downloadJob, callbackArgs)
    end

  end

  @[Extern]
  record IUpdateDownloaderVtbl,
    query_interface : Proc(IUpdateDownloader*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateDownloader*, UInt32),
    release : Proc(IUpdateDownloader*, UInt32),
    get_type_info_count : Proc(IUpdateDownloader*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateDownloader*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateDownloader*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateDownloader*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateDownloader*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateDownloader*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsForced : Proc(IUpdateDownloader*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsForced : Proc(IUpdateDownloader*, Int16, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IUpdateDownloader*, Win32cr::System::UpdateAgent::DownloadPriority*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IUpdateDownloader*, Win32cr::System::UpdateAgent::DownloadPriority, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IUpdateDownloader*, Void**, Win32cr::Foundation::HRESULT),
    put_Updates : Proc(IUpdateDownloader*, Void*, Win32cr::Foundation::HRESULT),
    begin_download : Proc(IUpdateDownloader*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    download : Proc(IUpdateDownloader*, Void**, Win32cr::Foundation::HRESULT),
    end_download : Proc(IUpdateDownloader*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("68f1c6f9-7ecc-4666-a464-247fe12496c3")]
  record IUpdateDownloader, lpVtbl : IUpdateDownloaderVtbl* do
    GUID = LibC::GUID.new(0x68f1c6f9_u32, 0x7ecc_u16, 0x4666_u16, StaticArray[0xa4_u8, 0x64_u8, 0x24_u8, 0x7f_u8, 0xe1_u8, 0x24_u8, 0x96_u8, 0xc3_u8])
    def query_interface(this : IUpdateDownloader*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateDownloader*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateDownloader*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateDownloader*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateDownloader*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateDownloader*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateDownloader*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateDownloader*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateDownloader*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IsForced(this : IUpdateDownloader*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsForced.call(this, retval)
    end
    def put_IsForced(this : IUpdateDownloader*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsForced.call(this, value)
    end
    def get_Priority(this : IUpdateDownloader*, retval : Win32cr::System::UpdateAgent::DownloadPriority*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, retval)
    end
    def put_Priority(this : IUpdateDownloader*, value : Win32cr::System::UpdateAgent::DownloadPriority) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, value)
    end
    def get_Updates(this : IUpdateDownloader*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def put_Updates(this : IUpdateDownloader*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Updates.call(this, value)
    end
    def begin_download(this : IUpdateDownloader*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_download.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def download(this : IUpdateDownloader*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.download.call(this, retval)
    end
    def end_download(this : IUpdateDownloader*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_download.call(this, value, retval)
    end

  end

  @[Extern]
  record IUpdateInstallationResultVtbl,
    query_interface : Proc(IUpdateInstallationResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateInstallationResult*, UInt32),
    release : Proc(IUpdateInstallationResult*, UInt32),
    get_type_info_count : Proc(IUpdateInstallationResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateInstallationResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateInstallationResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateInstallationResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IUpdateInstallationResult*, Int32*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IUpdateInstallationResult*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(IUpdateInstallationResult*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d940f0f8-3cbb-4fd0-993f-471e7f2328ad")]
  record IUpdateInstallationResult, lpVtbl : IUpdateInstallationResultVtbl* do
    GUID = LibC::GUID.new(0xd940f0f8_u32, 0x3cbb_u16, 0x4fd0_u16, StaticArray[0x99_u8, 0x3f_u8, 0x47_u8, 0x1e_u8, 0x7f_u8, 0x23_u8, 0x28_u8, 0xad_u8])
    def query_interface(this : IUpdateInstallationResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateInstallationResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateInstallationResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateInstallationResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateInstallationResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateInstallationResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateInstallationResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_HResult(this : IUpdateInstallationResult*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_RebootRequired(this : IUpdateInstallationResult*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_ResultCode(this : IUpdateInstallationResult*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end

  end

  @[Extern]
  record IInstallationResultVtbl,
    query_interface : Proc(IInstallationResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationResult*, UInt32),
    release : Proc(IInstallationResult*, UInt32),
    get_type_info_count : Proc(IInstallationResult*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationResult*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationResult*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationResult*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_HResult : Proc(IInstallationResult*, Int32*, Win32cr::Foundation::HRESULT),
    get_RebootRequired : Proc(IInstallationResult*, Int16*, Win32cr::Foundation::HRESULT),
    get_ResultCode : Proc(IInstallationResult*, Win32cr::System::UpdateAgent::OperationResultCode*, Win32cr::Foundation::HRESULT),
    get_update_result : Proc(IInstallationResult*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a43c56d6-7451-48d4-af96-b6cd2d0d9b7a")]
  record IInstallationResult, lpVtbl : IInstallationResultVtbl* do
    GUID = LibC::GUID.new(0xa43c56d6_u32, 0x7451_u16, 0x48d4_u16, StaticArray[0xaf_u8, 0x96_u8, 0xb6_u8, 0xcd_u8, 0x2d_u8, 0xd_u8, 0x9b_u8, 0x7a_u8])
    def query_interface(this : IInstallationResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationResult*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationResult*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationResult*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationResult*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_HResult(this : IInstallationResult*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HResult.call(this, retval)
    end
    def get_RebootRequired(this : IInstallationResult*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequired.call(this, retval)
    end
    def get_ResultCode(this : IInstallationResult*, retval : Win32cr::System::UpdateAgent::OperationResultCode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ResultCode.call(this, retval)
    end
    def get_update_result(this : IInstallationResult*, updateIndex : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_result.call(this, updateIndex, retval)
    end

  end

  @[Extern]
  record IInstallationProgressVtbl,
    query_interface : Proc(IInstallationProgress*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationProgress*, UInt32),
    release : Proc(IInstallationProgress*, UInt32),
    get_type_info_count : Proc(IInstallationProgress*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationProgress*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationProgress*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationProgress*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentUpdateIndex : Proc(IInstallationProgress*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentUpdatePercentComplete : Proc(IInstallationProgress*, Int32*, Win32cr::Foundation::HRESULT),
    get_PercentComplete : Proc(IInstallationProgress*, Int32*, Win32cr::Foundation::HRESULT),
    get_update_result : Proc(IInstallationProgress*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("345c8244-43a3-4e32-a368-65f073b76f36")]
  record IInstallationProgress, lpVtbl : IInstallationProgressVtbl* do
    GUID = LibC::GUID.new(0x345c8244_u32, 0x43a3_u16, 0x4e32_u16, StaticArray[0xa3_u8, 0x68_u8, 0x65_u8, 0xf0_u8, 0x73_u8, 0xb7_u8, 0x6f_u8, 0x36_u8])
    def query_interface(this : IInstallationProgress*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationProgress*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationProgress*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationProgress*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationProgress*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationProgress*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationProgress*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CurrentUpdateIndex(this : IInstallationProgress*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdateIndex.call(this, retval)
    end
    def get_CurrentUpdatePercentComplete(this : IInstallationProgress*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentUpdatePercentComplete.call(this, retval)
    end
    def get_PercentComplete(this : IInstallationProgress*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PercentComplete.call(this, retval)
    end
    def get_update_result(this : IInstallationProgress*, updateIndex : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_update_result.call(this, updateIndex, retval)
    end

  end

  @[Extern]
  record IInstallationJobVtbl,
    query_interface : Proc(IInstallationJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationJob*, UInt32),
    release : Proc(IInstallationJob*, UInt32),
    get_type_info_count : Proc(IInstallationJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AsyncState : Proc(IInstallationJob*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_IsCompleted : Proc(IInstallationJob*, Int16*, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IInstallationJob*, Void**, Win32cr::Foundation::HRESULT),
    clean_up : Proc(IInstallationJob*, Win32cr::Foundation::HRESULT),
    get_progress : Proc(IInstallationJob*, Void**, Win32cr::Foundation::HRESULT),
    request_abort : Proc(IInstallationJob*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c209f0b-bad5-432a-9556-4699bed2638a")]
  record IInstallationJob, lpVtbl : IInstallationJobVtbl* do
    GUID = LibC::GUID.new(0x5c209f0b_u32, 0xbad5_u16, 0x432a_u16, StaticArray[0x95_u8, 0x56_u8, 0x46_u8, 0x99_u8, 0xbe_u8, 0xd2_u8, 0x63_u8, 0x8a_u8])
    def query_interface(this : IInstallationJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AsyncState(this : IInstallationJob*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AsyncState.call(this, retval)
    end
    def get_IsCompleted(this : IInstallationJob*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsCompleted.call(this, retval)
    end
    def get_Updates(this : IInstallationJob*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def clean_up(this : IInstallationJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clean_up.call(this)
    end
    def get_progress(this : IInstallationJob*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress.call(this, retval)
    end
    def request_abort(this : IInstallationJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_abort.call(this)
    end

  end

  @[Extern]
  record IInstallationCompletedCallbackArgsVtbl,
    query_interface : Proc(IInstallationCompletedCallbackArgs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationCompletedCallbackArgs*, UInt32),
    release : Proc(IInstallationCompletedCallbackArgs*, UInt32),
    get_type_info_count : Proc(IInstallationCompletedCallbackArgs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationCompletedCallbackArgs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationCompletedCallbackArgs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationCompletedCallbackArgs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("250e2106-8efb-4705-9653-ef13c581b6a1")]
  record IInstallationCompletedCallbackArgs, lpVtbl : IInstallationCompletedCallbackArgsVtbl* do
    GUID = LibC::GUID.new(0x250e2106_u32, 0x8efb_u16, 0x4705_u16, StaticArray[0x96_u8, 0x53_u8, 0xef_u8, 0x13_u8, 0xc5_u8, 0x81_u8, 0xb6_u8, 0xa1_u8])
    def query_interface(this : IInstallationCompletedCallbackArgs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationCompletedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationCompletedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationCompletedCallbackArgs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationCompletedCallbackArgs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationCompletedCallbackArgs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationCompletedCallbackArgs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IInstallationCompletedCallbackVtbl,
    query_interface : Proc(IInstallationCompletedCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationCompletedCallback*, UInt32),
    release : Proc(IInstallationCompletedCallback*, UInt32),
    invoke : Proc(IInstallationCompletedCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45f4f6f3-d602-4f98-9a8a-3efa152ad2d3")]
  record IInstallationCompletedCallback, lpVtbl : IInstallationCompletedCallbackVtbl* do
    GUID = LibC::GUID.new(0x45f4f6f3_u32, 0xd602_u16, 0x4f98_u16, StaticArray[0x9a_u8, 0x8a_u8, 0x3e_u8, 0xfa_u8, 0x15_u8, 0x2a_u8, 0xd2_u8, 0xd3_u8])
    def query_interface(this : IInstallationCompletedCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationCompletedCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationCompletedCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IInstallationCompletedCallback*, installationJob : Void*, callbackArgs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, installationJob, callbackArgs)
    end

  end

  @[Extern]
  record IInstallationProgressChangedCallbackArgsVtbl,
    query_interface : Proc(IInstallationProgressChangedCallbackArgs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationProgressChangedCallbackArgs*, UInt32),
    release : Proc(IInstallationProgressChangedCallbackArgs*, UInt32),
    get_type_info_count : Proc(IInstallationProgressChangedCallbackArgs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationProgressChangedCallbackArgs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationProgressChangedCallbackArgs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationProgressChangedCallbackArgs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Progress : Proc(IInstallationProgressChangedCallbackArgs*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e4f14e1e-689d-4218-a0b9-bc189c484a01")]
  record IInstallationProgressChangedCallbackArgs, lpVtbl : IInstallationProgressChangedCallbackArgsVtbl* do
    GUID = LibC::GUID.new(0xe4f14e1e_u32, 0x689d_u16, 0x4218_u16, StaticArray[0xa0_u8, 0xb9_u8, 0xbc_u8, 0x18_u8, 0x9c_u8, 0x48_u8, 0x4a_u8, 0x1_u8])
    def query_interface(this : IInstallationProgressChangedCallbackArgs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationProgressChangedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationProgressChangedCallbackArgs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationProgressChangedCallbackArgs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationProgressChangedCallbackArgs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationProgressChangedCallbackArgs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationProgressChangedCallbackArgs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Progress(this : IInstallationProgressChangedCallbackArgs*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Progress.call(this, retval)
    end

  end

  @[Extern]
  record IInstallationProgressChangedCallbackVtbl,
    query_interface : Proc(IInstallationProgressChangedCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationProgressChangedCallback*, UInt32),
    release : Proc(IInstallationProgressChangedCallback*, UInt32),
    invoke : Proc(IInstallationProgressChangedCallback*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e01402d5-f8da-43ba-a012-38894bd048f1")]
  record IInstallationProgressChangedCallback, lpVtbl : IInstallationProgressChangedCallbackVtbl* do
    GUID = LibC::GUID.new(0xe01402d5_u32, 0xf8da_u16, 0x43ba_u16, StaticArray[0xa0_u8, 0x12_u8, 0x38_u8, 0x89_u8, 0x4b_u8, 0xd0_u8, 0x48_u8, 0xf1_u8])
    def query_interface(this : IInstallationProgressChangedCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationProgressChangedCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationProgressChangedCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IInstallationProgressChangedCallback*, installationJob : Void*, callbackArgs : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this, installationJob, callbackArgs)
    end

  end

  @[Extern]
  record IUpdateInstallerVtbl,
    query_interface : Proc(IUpdateInstaller*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateInstaller*, UInt32),
    release : Proc(IUpdateInstaller*, UInt32),
    get_type_info_count : Proc(IUpdateInstaller*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateInstaller*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateInstaller*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateInstaller*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateInstaller*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateInstaller*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsForced : Proc(IUpdateInstaller*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsForced : Proc(IUpdateInstaller*, Int16, Win32cr::Foundation::HRESULT),
    get_ParentHwnd : Proc(IUpdateInstaller*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    put_ParentHwnd : Proc(IUpdateInstaller*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    put_ParentWindow : Proc(IUpdateInstaller*, Void*, Win32cr::Foundation::HRESULT),
    get_ParentWindow : Proc(IUpdateInstaller*, Void**, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IUpdateInstaller*, Void**, Win32cr::Foundation::HRESULT),
    put_Updates : Proc(IUpdateInstaller*, Void*, Win32cr::Foundation::HRESULT),
    begin_install : Proc(IUpdateInstaller*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    begin_uninstall : Proc(IUpdateInstaller*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_install : Proc(IUpdateInstaller*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_uninstall : Proc(IUpdateInstaller*, Void*, Void**, Win32cr::Foundation::HRESULT),
    install : Proc(IUpdateInstaller*, Void**, Win32cr::Foundation::HRESULT),
    run_wizard : Proc(IUpdateInstaller*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_IsBusy : Proc(IUpdateInstaller*, Int16*, Win32cr::Foundation::HRESULT),
    uninstall : Proc(IUpdateInstaller*, Void**, Win32cr::Foundation::HRESULT),
    get_AllowSourcePrompts : Proc(IUpdateInstaller*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowSourcePrompts : Proc(IUpdateInstaller*, Int16, Win32cr::Foundation::HRESULT),
    get_RebootRequiredBeforeInstallation : Proc(IUpdateInstaller*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7b929c68-ccdc-4226-96b1-8724600b54c2")]
  record IUpdateInstaller, lpVtbl : IUpdateInstallerVtbl* do
    GUID = LibC::GUID.new(0x7b929c68_u32, 0xccdc_u16, 0x4226_u16, StaticArray[0x96_u8, 0xb1_u8, 0x87_u8, 0x24_u8, 0x60_u8, 0xb_u8, 0x54_u8, 0xc2_u8])
    def query_interface(this : IUpdateInstaller*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateInstaller*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateInstaller*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateInstaller*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateInstaller*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateInstaller*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateInstaller*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateInstaller*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateInstaller*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IsForced(this : IUpdateInstaller*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsForced.call(this, retval)
    end
    def put_IsForced(this : IUpdateInstaller*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsForced.call(this, value)
    end
    def get_ParentHwnd(this : IUpdateInstaller*, retval : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentHwnd.call(this, retval)
    end
    def put_ParentHwnd(this : IUpdateInstaller*, value : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentHwnd.call(this, value)
    end
    def put_ParentWindow(this : IUpdateInstaller*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentWindow.call(this, value)
    end
    def get_ParentWindow(this : IUpdateInstaller*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentWindow.call(this, retval)
    end
    def get_Updates(this : IUpdateInstaller*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def put_Updates(this : IUpdateInstaller*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Updates.call(this, value)
    end
    def begin_install(this : IUpdateInstaller*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_install.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def begin_uninstall(this : IUpdateInstaller*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_uninstall.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def end_install(this : IUpdateInstaller*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_install.call(this, value, retval)
    end
    def end_uninstall(this : IUpdateInstaller*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_uninstall.call(this, value, retval)
    end
    def install(this : IUpdateInstaller*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install.call(this, retval)
    end
    def run_wizard(this : IUpdateInstaller*, dialogTitle : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_wizard.call(this, dialogTitle, retval)
    end
    def get_IsBusy(this : IUpdateInstaller*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBusy.call(this, retval)
    end
    def uninstall(this : IUpdateInstaller*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninstall.call(this, retval)
    end
    def get_AllowSourcePrompts(this : IUpdateInstaller*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowSourcePrompts.call(this, retval)
    end
    def put_AllowSourcePrompts(this : IUpdateInstaller*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowSourcePrompts.call(this, value)
    end
    def get_RebootRequiredBeforeInstallation(this : IUpdateInstaller*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequiredBeforeInstallation.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateInstaller2Vtbl,
    query_interface : Proc(IUpdateInstaller2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateInstaller2*, UInt32),
    release : Proc(IUpdateInstaller2*, UInt32),
    get_type_info_count : Proc(IUpdateInstaller2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateInstaller2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateInstaller2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateInstaller2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateInstaller2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateInstaller2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsForced : Proc(IUpdateInstaller2*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsForced : Proc(IUpdateInstaller2*, Int16, Win32cr::Foundation::HRESULT),
    get_ParentHwnd : Proc(IUpdateInstaller2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    put_ParentHwnd : Proc(IUpdateInstaller2*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    put_ParentWindow : Proc(IUpdateInstaller2*, Void*, Win32cr::Foundation::HRESULT),
    get_ParentWindow : Proc(IUpdateInstaller2*, Void**, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IUpdateInstaller2*, Void**, Win32cr::Foundation::HRESULT),
    put_Updates : Proc(IUpdateInstaller2*, Void*, Win32cr::Foundation::HRESULT),
    begin_install : Proc(IUpdateInstaller2*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    begin_uninstall : Proc(IUpdateInstaller2*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_install : Proc(IUpdateInstaller2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_uninstall : Proc(IUpdateInstaller2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    install : Proc(IUpdateInstaller2*, Void**, Win32cr::Foundation::HRESULT),
    run_wizard : Proc(IUpdateInstaller2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_IsBusy : Proc(IUpdateInstaller2*, Int16*, Win32cr::Foundation::HRESULT),
    uninstall : Proc(IUpdateInstaller2*, Void**, Win32cr::Foundation::HRESULT),
    get_AllowSourcePrompts : Proc(IUpdateInstaller2*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowSourcePrompts : Proc(IUpdateInstaller2*, Int16, Win32cr::Foundation::HRESULT),
    get_RebootRequiredBeforeInstallation : Proc(IUpdateInstaller2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ForceQuiet : Proc(IUpdateInstaller2*, Int16*, Win32cr::Foundation::HRESULT),
    put_ForceQuiet : Proc(IUpdateInstaller2*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3442d4fe-224d-4cee-98cf-30e0c4d229e6")]
  record IUpdateInstaller2, lpVtbl : IUpdateInstaller2Vtbl* do
    GUID = LibC::GUID.new(0x3442d4fe_u32, 0x224d_u16, 0x4cee_u16, StaticArray[0x98_u8, 0xcf_u8, 0x30_u8, 0xe0_u8, 0xc4_u8, 0xd2_u8, 0x29_u8, 0xe6_u8])
    def query_interface(this : IUpdateInstaller2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateInstaller2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateInstaller2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateInstaller2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateInstaller2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateInstaller2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateInstaller2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateInstaller2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateInstaller2*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IsForced(this : IUpdateInstaller2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsForced.call(this, retval)
    end
    def put_IsForced(this : IUpdateInstaller2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsForced.call(this, value)
    end
    def get_ParentHwnd(this : IUpdateInstaller2*, retval : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentHwnd.call(this, retval)
    end
    def put_ParentHwnd(this : IUpdateInstaller2*, value : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentHwnd.call(this, value)
    end
    def put_ParentWindow(this : IUpdateInstaller2*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentWindow.call(this, value)
    end
    def get_ParentWindow(this : IUpdateInstaller2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentWindow.call(this, retval)
    end
    def get_Updates(this : IUpdateInstaller2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def put_Updates(this : IUpdateInstaller2*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Updates.call(this, value)
    end
    def begin_install(this : IUpdateInstaller2*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_install.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def begin_uninstall(this : IUpdateInstaller2*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_uninstall.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def end_install(this : IUpdateInstaller2*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_install.call(this, value, retval)
    end
    def end_uninstall(this : IUpdateInstaller2*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_uninstall.call(this, value, retval)
    end
    def install(this : IUpdateInstaller2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install.call(this, retval)
    end
    def run_wizard(this : IUpdateInstaller2*, dialogTitle : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_wizard.call(this, dialogTitle, retval)
    end
    def get_IsBusy(this : IUpdateInstaller2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBusy.call(this, retval)
    end
    def uninstall(this : IUpdateInstaller2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninstall.call(this, retval)
    end
    def get_AllowSourcePrompts(this : IUpdateInstaller2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowSourcePrompts.call(this, retval)
    end
    def put_AllowSourcePrompts(this : IUpdateInstaller2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowSourcePrompts.call(this, value)
    end
    def get_RebootRequiredBeforeInstallation(this : IUpdateInstaller2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequiredBeforeInstallation.call(this, retval)
    end
    def get_ForceQuiet(this : IUpdateInstaller2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForceQuiet.call(this, retval)
    end
    def put_ForceQuiet(this : IUpdateInstaller2*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ForceQuiet.call(this, value)
    end

  end

  @[Extern]
  record IUpdateInstaller3Vtbl,
    query_interface : Proc(IUpdateInstaller3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateInstaller3*, UInt32),
    release : Proc(IUpdateInstaller3*, UInt32),
    get_type_info_count : Proc(IUpdateInstaller3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateInstaller3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateInstaller3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateInstaller3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateInstaller3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateInstaller3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsForced : Proc(IUpdateInstaller3*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsForced : Proc(IUpdateInstaller3*, Int16, Win32cr::Foundation::HRESULT),
    get_ParentHwnd : Proc(IUpdateInstaller3*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    put_ParentHwnd : Proc(IUpdateInstaller3*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    put_ParentWindow : Proc(IUpdateInstaller3*, Void*, Win32cr::Foundation::HRESULT),
    get_ParentWindow : Proc(IUpdateInstaller3*, Void**, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IUpdateInstaller3*, Void**, Win32cr::Foundation::HRESULT),
    put_Updates : Proc(IUpdateInstaller3*, Void*, Win32cr::Foundation::HRESULT),
    begin_install : Proc(IUpdateInstaller3*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    begin_uninstall : Proc(IUpdateInstaller3*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_install : Proc(IUpdateInstaller3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_uninstall : Proc(IUpdateInstaller3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    install : Proc(IUpdateInstaller3*, Void**, Win32cr::Foundation::HRESULT),
    run_wizard : Proc(IUpdateInstaller3*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_IsBusy : Proc(IUpdateInstaller3*, Int16*, Win32cr::Foundation::HRESULT),
    uninstall : Proc(IUpdateInstaller3*, Void**, Win32cr::Foundation::HRESULT),
    get_AllowSourcePrompts : Proc(IUpdateInstaller3*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowSourcePrompts : Proc(IUpdateInstaller3*, Int16, Win32cr::Foundation::HRESULT),
    get_RebootRequiredBeforeInstallation : Proc(IUpdateInstaller3*, Int16*, Win32cr::Foundation::HRESULT),
    get_ForceQuiet : Proc(IUpdateInstaller3*, Int16*, Win32cr::Foundation::HRESULT),
    put_ForceQuiet : Proc(IUpdateInstaller3*, Int16, Win32cr::Foundation::HRESULT),
    get_AttemptCloseAppsIfNecessary : Proc(IUpdateInstaller3*, Int16*, Win32cr::Foundation::HRESULT),
    put_AttemptCloseAppsIfNecessary : Proc(IUpdateInstaller3*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("16d11c35-099a-48d0-8338-5fae64047f8e")]
  record IUpdateInstaller3, lpVtbl : IUpdateInstaller3Vtbl* do
    GUID = LibC::GUID.new(0x16d11c35_u32, 0x99a_u16, 0x48d0_u16, StaticArray[0x83_u8, 0x38_u8, 0x5f_u8, 0xae_u8, 0x64_u8, 0x4_u8, 0x7f_u8, 0x8e_u8])
    def query_interface(this : IUpdateInstaller3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateInstaller3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateInstaller3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateInstaller3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateInstaller3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateInstaller3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateInstaller3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateInstaller3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateInstaller3*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IsForced(this : IUpdateInstaller3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsForced.call(this, retval)
    end
    def put_IsForced(this : IUpdateInstaller3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsForced.call(this, value)
    end
    def get_ParentHwnd(this : IUpdateInstaller3*, retval : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentHwnd.call(this, retval)
    end
    def put_ParentHwnd(this : IUpdateInstaller3*, value : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentHwnd.call(this, value)
    end
    def put_ParentWindow(this : IUpdateInstaller3*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentWindow.call(this, value)
    end
    def get_ParentWindow(this : IUpdateInstaller3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentWindow.call(this, retval)
    end
    def get_Updates(this : IUpdateInstaller3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def put_Updates(this : IUpdateInstaller3*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Updates.call(this, value)
    end
    def begin_install(this : IUpdateInstaller3*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_install.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def begin_uninstall(this : IUpdateInstaller3*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_uninstall.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def end_install(this : IUpdateInstaller3*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_install.call(this, value, retval)
    end
    def end_uninstall(this : IUpdateInstaller3*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_uninstall.call(this, value, retval)
    end
    def install(this : IUpdateInstaller3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install.call(this, retval)
    end
    def run_wizard(this : IUpdateInstaller3*, dialogTitle : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_wizard.call(this, dialogTitle, retval)
    end
    def get_IsBusy(this : IUpdateInstaller3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBusy.call(this, retval)
    end
    def uninstall(this : IUpdateInstaller3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninstall.call(this, retval)
    end
    def get_AllowSourcePrompts(this : IUpdateInstaller3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowSourcePrompts.call(this, retval)
    end
    def put_AllowSourcePrompts(this : IUpdateInstaller3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowSourcePrompts.call(this, value)
    end
    def get_RebootRequiredBeforeInstallation(this : IUpdateInstaller3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequiredBeforeInstallation.call(this, retval)
    end
    def get_ForceQuiet(this : IUpdateInstaller3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForceQuiet.call(this, retval)
    end
    def put_ForceQuiet(this : IUpdateInstaller3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ForceQuiet.call(this, value)
    end
    def get_AttemptCloseAppsIfNecessary(this : IUpdateInstaller3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttemptCloseAppsIfNecessary.call(this, retval)
    end
    def put_AttemptCloseAppsIfNecessary(this : IUpdateInstaller3*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttemptCloseAppsIfNecessary.call(this, value)
    end

  end

  @[Extern]
  record IUpdateInstaller4Vtbl,
    query_interface : Proc(IUpdateInstaller4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateInstaller4*, UInt32),
    release : Proc(IUpdateInstaller4*, UInt32),
    get_type_info_count : Proc(IUpdateInstaller4*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateInstaller4*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateInstaller4*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateInstaller4*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateInstaller4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateInstaller4*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_IsForced : Proc(IUpdateInstaller4*, Int16*, Win32cr::Foundation::HRESULT),
    put_IsForced : Proc(IUpdateInstaller4*, Int16, Win32cr::Foundation::HRESULT),
    get_ParentHwnd : Proc(IUpdateInstaller4*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    put_ParentHwnd : Proc(IUpdateInstaller4*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    put_ParentWindow : Proc(IUpdateInstaller4*, Void*, Win32cr::Foundation::HRESULT),
    get_ParentWindow : Proc(IUpdateInstaller4*, Void**, Win32cr::Foundation::HRESULT),
    get_Updates : Proc(IUpdateInstaller4*, Void**, Win32cr::Foundation::HRESULT),
    put_Updates : Proc(IUpdateInstaller4*, Void*, Win32cr::Foundation::HRESULT),
    begin_install : Proc(IUpdateInstaller4*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    begin_uninstall : Proc(IUpdateInstaller4*, Void*, Void*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    end_install : Proc(IUpdateInstaller4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    end_uninstall : Proc(IUpdateInstaller4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    install : Proc(IUpdateInstaller4*, Void**, Win32cr::Foundation::HRESULT),
    run_wizard : Proc(IUpdateInstaller4*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_IsBusy : Proc(IUpdateInstaller4*, Int16*, Win32cr::Foundation::HRESULT),
    uninstall : Proc(IUpdateInstaller4*, Void**, Win32cr::Foundation::HRESULT),
    get_AllowSourcePrompts : Proc(IUpdateInstaller4*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowSourcePrompts : Proc(IUpdateInstaller4*, Int16, Win32cr::Foundation::HRESULT),
    get_RebootRequiredBeforeInstallation : Proc(IUpdateInstaller4*, Int16*, Win32cr::Foundation::HRESULT),
    get_ForceQuiet : Proc(IUpdateInstaller4*, Int16*, Win32cr::Foundation::HRESULT),
    put_ForceQuiet : Proc(IUpdateInstaller4*, Int16, Win32cr::Foundation::HRESULT),
    get_AttemptCloseAppsIfNecessary : Proc(IUpdateInstaller4*, Int16*, Win32cr::Foundation::HRESULT),
    put_AttemptCloseAppsIfNecessary : Proc(IUpdateInstaller4*, Int16, Win32cr::Foundation::HRESULT),
    commit : Proc(IUpdateInstaller4*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ef8208ea-2304-492d-9109-23813b0958e1")]
  record IUpdateInstaller4, lpVtbl : IUpdateInstaller4Vtbl* do
    GUID = LibC::GUID.new(0xef8208ea_u32, 0x2304_u16, 0x492d_u16, StaticArray[0x91_u8, 0x9_u8, 0x23_u8, 0x81_u8, 0x3b_u8, 0x9_u8, 0x58_u8, 0xe1_u8])
    def query_interface(this : IUpdateInstaller4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateInstaller4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateInstaller4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateInstaller4*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateInstaller4*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateInstaller4*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateInstaller4*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateInstaller4*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateInstaller4*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_IsForced(this : IUpdateInstaller4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsForced.call(this, retval)
    end
    def put_IsForced(this : IUpdateInstaller4*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsForced.call(this, value)
    end
    def get_ParentHwnd(this : IUpdateInstaller4*, retval : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentHwnd.call(this, retval)
    end
    def put_ParentHwnd(this : IUpdateInstaller4*, value : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentHwnd.call(this, value)
    end
    def put_ParentWindow(this : IUpdateInstaller4*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ParentWindow.call(this, value)
    end
    def get_ParentWindow(this : IUpdateInstaller4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ParentWindow.call(this, retval)
    end
    def get_Updates(this : IUpdateInstaller4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Updates.call(this, retval)
    end
    def put_Updates(this : IUpdateInstaller4*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Updates.call(this, value)
    end
    def begin_install(this : IUpdateInstaller4*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_install.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def begin_uninstall(this : IUpdateInstaller4*, onProgressChanged : Void*, onCompleted : Void*, state : Win32cr::System::Com::VARIANT, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_uninstall.call(this, onProgressChanged, onCompleted, state, retval)
    end
    def end_install(this : IUpdateInstaller4*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_install.call(this, value, retval)
    end
    def end_uninstall(this : IUpdateInstaller4*, value : Void*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_uninstall.call(this, value, retval)
    end
    def install(this : IUpdateInstaller4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install.call(this, retval)
    end
    def run_wizard(this : IUpdateInstaller4*, dialogTitle : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.run_wizard.call(this, dialogTitle, retval)
    end
    def get_IsBusy(this : IUpdateInstaller4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsBusy.call(this, retval)
    end
    def uninstall(this : IUpdateInstaller4*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninstall.call(this, retval)
    end
    def get_AllowSourcePrompts(this : IUpdateInstaller4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowSourcePrompts.call(this, retval)
    end
    def put_AllowSourcePrompts(this : IUpdateInstaller4*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowSourcePrompts.call(this, value)
    end
    def get_RebootRequiredBeforeInstallation(this : IUpdateInstaller4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RebootRequiredBeforeInstallation.call(this, retval)
    end
    def get_ForceQuiet(this : IUpdateInstaller4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ForceQuiet.call(this, retval)
    end
    def put_ForceQuiet(this : IUpdateInstaller4*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ForceQuiet.call(this, value)
    end
    def get_AttemptCloseAppsIfNecessary(this : IUpdateInstaller4*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttemptCloseAppsIfNecessary.call(this, retval)
    end
    def put_AttemptCloseAppsIfNecessary(this : IUpdateInstaller4*, value : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttemptCloseAppsIfNecessary.call(this, value)
    end
    def commit(this : IUpdateInstaller4*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this, dwFlags)
    end

  end

  @[Extern]
  record IUpdateSessionVtbl,
    query_interface : Proc(IUpdateSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateSession*, UInt32),
    release : Proc(IUpdateSession*, UInt32),
    get_type_info_count : Proc(IUpdateSession*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateSession*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateSession*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateSession*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IUpdateSession*, Int16*, Win32cr::Foundation::HRESULT),
    get_WebProxy : Proc(IUpdateSession*, Void**, Win32cr::Foundation::HRESULT),
    put_WebProxy : Proc(IUpdateSession*, Void*, Win32cr::Foundation::HRESULT),
    create_update_searcher : Proc(IUpdateSession*, Void**, Win32cr::Foundation::HRESULT),
    create_update_downloader : Proc(IUpdateSession*, Void**, Win32cr::Foundation::HRESULT),
    create_update_installer : Proc(IUpdateSession*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("816858a4-260d-4260-933a-2585f1abc76b")]
  record IUpdateSession, lpVtbl : IUpdateSessionVtbl* do
    GUID = LibC::GUID.new(0x816858a4_u32, 0x260d_u16, 0x4260_u16, StaticArray[0x93_u8, 0x3a_u8, 0x25_u8, 0x85_u8, 0xf1_u8, 0xab_u8, 0xc7_u8, 0x6b_u8])
    def query_interface(this : IUpdateSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateSession*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateSession*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateSession*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateSession*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateSession*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateSession*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_ReadOnly(this : IUpdateSession*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_WebProxy(this : IUpdateSession*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WebProxy.call(this, retval)
    end
    def put_WebProxy(this : IUpdateSession*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WebProxy.call(this, value)
    end
    def create_update_searcher(this : IUpdateSession*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_searcher.call(this, retval)
    end
    def create_update_downloader(this : IUpdateSession*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_downloader.call(this, retval)
    end
    def create_update_installer(this : IUpdateSession*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_installer.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateSession2Vtbl,
    query_interface : Proc(IUpdateSession2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateSession2*, UInt32),
    release : Proc(IUpdateSession2*, UInt32),
    get_type_info_count : Proc(IUpdateSession2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateSession2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateSession2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateSession2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateSession2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateSession2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IUpdateSession2*, Int16*, Win32cr::Foundation::HRESULT),
    get_WebProxy : Proc(IUpdateSession2*, Void**, Win32cr::Foundation::HRESULT),
    put_WebProxy : Proc(IUpdateSession2*, Void*, Win32cr::Foundation::HRESULT),
    create_update_searcher : Proc(IUpdateSession2*, Void**, Win32cr::Foundation::HRESULT),
    create_update_downloader : Proc(IUpdateSession2*, Void**, Win32cr::Foundation::HRESULT),
    create_update_installer : Proc(IUpdateSession2*, Void**, Win32cr::Foundation::HRESULT),
    get_UserLocale : Proc(IUpdateSession2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_UserLocale : Proc(IUpdateSession2*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("91caf7b0-eb23-49ed-9937-c52d817f46f7")]
  record IUpdateSession2, lpVtbl : IUpdateSession2Vtbl* do
    GUID = LibC::GUID.new(0x91caf7b0_u32, 0xeb23_u16, 0x49ed_u16, StaticArray[0x99_u8, 0x37_u8, 0xc5_u8, 0x2d_u8, 0x81_u8, 0x7f_u8, 0x46_u8, 0xf7_u8])
    def query_interface(this : IUpdateSession2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateSession2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateSession2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateSession2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateSession2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateSession2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateSession2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateSession2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateSession2*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_ReadOnly(this : IUpdateSession2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_WebProxy(this : IUpdateSession2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WebProxy.call(this, retval)
    end
    def put_WebProxy(this : IUpdateSession2*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WebProxy.call(this, value)
    end
    def create_update_searcher(this : IUpdateSession2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_searcher.call(this, retval)
    end
    def create_update_downloader(this : IUpdateSession2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_downloader.call(this, retval)
    end
    def create_update_installer(this : IUpdateSession2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_installer.call(this, retval)
    end
    def get_UserLocale(this : IUpdateSession2*, retval : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserLocale.call(this, retval)
    end
    def put_UserLocale(this : IUpdateSession2*, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserLocale.call(this, lcid)
    end

  end

  @[Extern]
  record IUpdateSession3Vtbl,
    query_interface : Proc(IUpdateSession3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateSession3*, UInt32),
    release : Proc(IUpdateSession3*, UInt32),
    get_type_info_count : Proc(IUpdateSession3*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateSession3*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateSession3*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateSession3*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateSession3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateSession3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ReadOnly : Proc(IUpdateSession3*, Int16*, Win32cr::Foundation::HRESULT),
    get_WebProxy : Proc(IUpdateSession3*, Void**, Win32cr::Foundation::HRESULT),
    put_WebProxy : Proc(IUpdateSession3*, Void*, Win32cr::Foundation::HRESULT),
    create_update_searcher : Proc(IUpdateSession3*, Void**, Win32cr::Foundation::HRESULT),
    create_update_downloader : Proc(IUpdateSession3*, Void**, Win32cr::Foundation::HRESULT),
    create_update_installer : Proc(IUpdateSession3*, Void**, Win32cr::Foundation::HRESULT),
    get_UserLocale : Proc(IUpdateSession3*, UInt32*, Win32cr::Foundation::HRESULT),
    put_UserLocale : Proc(IUpdateSession3*, UInt32, Win32cr::Foundation::HRESULT),
    create_update_service_manager : Proc(IUpdateSession3*, Void**, Win32cr::Foundation::HRESULT),
    query_history : Proc(IUpdateSession3*, Win32cr::Foundation::BSTR, Int32, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("918efd1e-b5d8-4c90-8540-aeb9bdc56f9d")]
  record IUpdateSession3, lpVtbl : IUpdateSession3Vtbl* do
    GUID = LibC::GUID.new(0x918efd1e_u32, 0xb5d8_u16, 0x4c90_u16, StaticArray[0x85_u8, 0x40_u8, 0xae_u8, 0xb9_u8, 0xbd_u8, 0xc5_u8, 0x6f_u8, 0x9d_u8])
    def query_interface(this : IUpdateSession3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateSession3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateSession3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateSession3*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateSession3*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateSession3*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateSession3*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_ClientApplicationID(this : IUpdateSession3*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateSession3*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def get_ReadOnly(this : IUpdateSession3*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReadOnly.call(this, retval)
    end
    def get_WebProxy(this : IUpdateSession3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WebProxy.call(this, retval)
    end
    def put_WebProxy(this : IUpdateSession3*, value : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_WebProxy.call(this, value)
    end
    def create_update_searcher(this : IUpdateSession3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_searcher.call(this, retval)
    end
    def create_update_downloader(this : IUpdateSession3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_downloader.call(this, retval)
    end
    def create_update_installer(this : IUpdateSession3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_installer.call(this, retval)
    end
    def get_UserLocale(this : IUpdateSession3*, retval : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UserLocale.call(this, retval)
    end
    def put_UserLocale(this : IUpdateSession3*, lcid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UserLocale.call(this, lcid)
    end
    def create_update_service_manager(this : IUpdateSession3*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_update_service_manager.call(this, retval)
    end
    def query_history(this : IUpdateSession3*, criteria : Win32cr::Foundation::BSTR, startIndex : Int32, count : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_history.call(this, criteria, startIndex, count, retval)
    end

  end

  @[Extern]
  record IUpdateServiceVtbl,
    query_interface : Proc(IUpdateService*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateService*, UInt32),
    release : Proc(IUpdateService*, UInt32),
    get_type_info_count : Proc(IUpdateService*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateService*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateService*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateService*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IUpdateService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ContentValidationCert : Proc(IUpdateService*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ExpirationDate : Proc(IUpdateService*, Float64*, Win32cr::Foundation::HRESULT),
    get_IsManaged : Proc(IUpdateService*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsRegisteredWithAU : Proc(IUpdateService*, Int16*, Win32cr::Foundation::HRESULT),
    get_IssueDate : Proc(IUpdateService*, Float64*, Win32cr::Foundation::HRESULT),
    get_OffersWindowsUpdates : Proc(IUpdateService*, Int16*, Win32cr::Foundation::HRESULT),
    get_RedirectUrls : Proc(IUpdateService*, Void**, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsScanPackageService : Proc(IUpdateService*, Int16*, Win32cr::Foundation::HRESULT),
    get_CanRegisterWithAU : Proc(IUpdateService*, Int16*, Win32cr::Foundation::HRESULT),
    get_ServiceUrl : Proc(IUpdateService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SetupPrefix : Proc(IUpdateService*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("76b3b17e-aed6-4da5-85f0-83587f81abe3")]
  record IUpdateService, lpVtbl : IUpdateServiceVtbl* do
    GUID = LibC::GUID.new(0x76b3b17e_u32, 0xaed6_u16, 0x4da5_u16, StaticArray[0x85_u8, 0xf0_u8, 0x83_u8, 0x58_u8, 0x7f_u8, 0x81_u8, 0xab_u8, 0xe3_u8])
    def query_interface(this : IUpdateService*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateService*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateService*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateService*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateService*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateService*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateService*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IUpdateService*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, retval)
    end
    def get_ContentValidationCert(this : IUpdateService*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentValidationCert.call(this, retval)
    end
    def get_ExpirationDate(this : IUpdateService*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExpirationDate.call(this, retval)
    end
    def get_IsManaged(this : IUpdateService*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsManaged.call(this, retval)
    end
    def get_IsRegisteredWithAU(this : IUpdateService*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRegisteredWithAU.call(this, retval)
    end
    def get_IssueDate(this : IUpdateService*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IssueDate.call(this, retval)
    end
    def get_OffersWindowsUpdates(this : IUpdateService*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OffersWindowsUpdates.call(this, retval)
    end
    def get_RedirectUrls(this : IUpdateService*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RedirectUrls.call(this, retval)
    end
    def get_ServiceID(this : IUpdateService*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def get_IsScanPackageService(this : IUpdateService*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsScanPackageService.call(this, retval)
    end
    def get_CanRegisterWithAU(this : IUpdateService*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRegisterWithAU.call(this, retval)
    end
    def get_ServiceUrl(this : IUpdateService*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceUrl.call(this, retval)
    end
    def get_SetupPrefix(this : IUpdateService*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SetupPrefix.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateService2Vtbl,
    query_interface : Proc(IUpdateService2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateService2*, UInt32),
    release : Proc(IUpdateService2*, UInt32),
    get_type_info_count : Proc(IUpdateService2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateService2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateService2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateService2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IUpdateService2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ContentValidationCert : Proc(IUpdateService2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_ExpirationDate : Proc(IUpdateService2*, Float64*, Win32cr::Foundation::HRESULT),
    get_IsManaged : Proc(IUpdateService2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IsRegisteredWithAU : Proc(IUpdateService2*, Int16*, Win32cr::Foundation::HRESULT),
    get_IssueDate : Proc(IUpdateService2*, Float64*, Win32cr::Foundation::HRESULT),
    get_OffersWindowsUpdates : Proc(IUpdateService2*, Int16*, Win32cr::Foundation::HRESULT),
    get_RedirectUrls : Proc(IUpdateService2*, Void**, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateService2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsScanPackageService : Proc(IUpdateService2*, Int16*, Win32cr::Foundation::HRESULT),
    get_CanRegisterWithAU : Proc(IUpdateService2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ServiceUrl : Proc(IUpdateService2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_SetupPrefix : Proc(IUpdateService2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsDefaultAUService : Proc(IUpdateService2*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1518b460-6518-4172-940f-c75883b24ceb")]
  record IUpdateService2, lpVtbl : IUpdateService2Vtbl* do
    GUID = LibC::GUID.new(0x1518b460_u32, 0x6518_u16, 0x4172_u16, StaticArray[0x94_u8, 0xf_u8, 0xc7_u8, 0x58_u8, 0x83_u8, 0xb2_u8, 0x4c_u8, 0xeb_u8])
    def query_interface(this : IUpdateService2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateService2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateService2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateService2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateService2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateService2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateService2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IUpdateService2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, retval)
    end
    def get_ContentValidationCert(this : IUpdateService2*, retval : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentValidationCert.call(this, retval)
    end
    def get_ExpirationDate(this : IUpdateService2*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExpirationDate.call(this, retval)
    end
    def get_IsManaged(this : IUpdateService2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsManaged.call(this, retval)
    end
    def get_IsRegisteredWithAU(this : IUpdateService2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsRegisteredWithAU.call(this, retval)
    end
    def get_IssueDate(this : IUpdateService2*, retval : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IssueDate.call(this, retval)
    end
    def get_OffersWindowsUpdates(this : IUpdateService2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OffersWindowsUpdates.call(this, retval)
    end
    def get_RedirectUrls(this : IUpdateService2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RedirectUrls.call(this, retval)
    end
    def get_ServiceID(this : IUpdateService2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def get_IsScanPackageService(this : IUpdateService2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsScanPackageService.call(this, retval)
    end
    def get_CanRegisterWithAU(this : IUpdateService2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRegisterWithAU.call(this, retval)
    end
    def get_ServiceUrl(this : IUpdateService2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceUrl.call(this, retval)
    end
    def get_SetupPrefix(this : IUpdateService2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SetupPrefix.call(this, retval)
    end
    def get_IsDefaultAUService(this : IUpdateService2*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsDefaultAUService.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateServiceCollectionVtbl,
    query_interface : Proc(IUpdateServiceCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateServiceCollection*, UInt32),
    release : Proc(IUpdateServiceCollection*, UInt32),
    get_type_info_count : Proc(IUpdateServiceCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateServiceCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateServiceCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateServiceCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IUpdateServiceCollection*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IUpdateServiceCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IUpdateServiceCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9b0353aa-0e52-44ff-b8b0-1f7fa0437f88")]
  record IUpdateServiceCollection, lpVtbl : IUpdateServiceCollectionVtbl* do
    GUID = LibC::GUID.new(0x9b0353aa_u32, 0xe52_u16, 0x44ff_u16, StaticArray[0xb8_u8, 0xb0_u8, 0x1f_u8, 0x7f_u8, 0xa0_u8, 0x43_u8, 0x7f_u8, 0x88_u8])
    def query_interface(this : IUpdateServiceCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateServiceCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateServiceCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateServiceCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateServiceCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateServiceCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateServiceCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IUpdateServiceCollection*, index : Int32, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, retval)
    end
    def get__NewEnum(this : IUpdateServiceCollection*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, retval)
    end
    def get_Count(this : IUpdateServiceCollection*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateServiceRegistrationVtbl,
    query_interface : Proc(IUpdateServiceRegistration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateServiceRegistration*, UInt32),
    release : Proc(IUpdateServiceRegistration*, UInt32),
    get_type_info_count : Proc(IUpdateServiceRegistration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateServiceRegistration*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateServiceRegistration*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateServiceRegistration*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_RegistrationState : Proc(IUpdateServiceRegistration*, Win32cr::System::UpdateAgent::UpdateServiceRegistrationState*, Win32cr::Foundation::HRESULT),
    get_ServiceID : Proc(IUpdateServiceRegistration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsPendingRegistrationWithAU : Proc(IUpdateServiceRegistration*, Int16*, Win32cr::Foundation::HRESULT),
    get_Service : Proc(IUpdateServiceRegistration*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dde02280-12b3-4e0b-937b-6747f6acb286")]
  record IUpdateServiceRegistration, lpVtbl : IUpdateServiceRegistrationVtbl* do
    GUID = LibC::GUID.new(0xdde02280_u32, 0x12b3_u16, 0x4e0b_u16, StaticArray[0x93_u8, 0x7b_u8, 0x67_u8, 0x47_u8, 0xf6_u8, 0xac_u8, 0xb2_u8, 0x86_u8])
    def query_interface(this : IUpdateServiceRegistration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateServiceRegistration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateServiceRegistration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateServiceRegistration*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateServiceRegistration*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateServiceRegistration*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateServiceRegistration*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_RegistrationState(this : IUpdateServiceRegistration*, retval : Win32cr::System::UpdateAgent::UpdateServiceRegistrationState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegistrationState.call(this, retval)
    end
    def get_ServiceID(this : IUpdateServiceRegistration*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServiceID.call(this, retval)
    end
    def get_IsPendingRegistrationWithAU(this : IUpdateServiceRegistration*, retval : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsPendingRegistrationWithAU.call(this, retval)
    end
    def get_Service(this : IUpdateServiceRegistration*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Service.call(this, retval)
    end

  end

  @[Extern]
  record IUpdateServiceManagerVtbl,
    query_interface : Proc(IUpdateServiceManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateServiceManager*, UInt32),
    release : Proc(IUpdateServiceManager*, UInt32),
    get_type_info_count : Proc(IUpdateServiceManager*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateServiceManager*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateServiceManager*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateServiceManager*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Services : Proc(IUpdateServiceManager*, Void**, Win32cr::Foundation::HRESULT),
    add_service : Proc(IUpdateServiceManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    register_service_with_au : Proc(IUpdateServiceManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_service : Proc(IUpdateServiceManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    unregister_service_with_au : Proc(IUpdateServiceManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_scan_package_service : Proc(IUpdateServiceManager*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    set_option : Proc(IUpdateServiceManager*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("23857e3c-02ba-44a3-9423-b1c900805f37")]
  record IUpdateServiceManager, lpVtbl : IUpdateServiceManagerVtbl* do
    GUID = LibC::GUID.new(0x23857e3c_u32, 0x2ba_u16, 0x44a3_u16, StaticArray[0x94_u8, 0x23_u8, 0xb1_u8, 0xc9_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x37_u8])
    def query_interface(this : IUpdateServiceManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateServiceManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateServiceManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateServiceManager*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateServiceManager*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateServiceManager*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateServiceManager*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Services(this : IUpdateServiceManager*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Services.call(this, retval)
    end
    def add_service(this : IUpdateServiceManager*, serviceID : Win32cr::Foundation::BSTR, authorizationCabPath : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_service.call(this, serviceID, authorizationCabPath, retval)
    end
    def register_service_with_au(this : IUpdateServiceManager*, serviceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_service_with_au.call(this, serviceID)
    end
    def remove_service(this : IUpdateServiceManager*, serviceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_service.call(this, serviceID)
    end
    def unregister_service_with_au(this : IUpdateServiceManager*, serviceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_service_with_au.call(this, serviceID)
    end
    def add_scan_package_service(this : IUpdateServiceManager*, serviceName : Win32cr::Foundation::BSTR, scanFileLocation : Win32cr::Foundation::BSTR, flags : Int32, ppService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_scan_package_service.call(this, serviceName, scanFileLocation, flags, ppService)
    end
    def set_option(this : IUpdateServiceManager*, optionName : Win32cr::Foundation::BSTR, optionValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_option.call(this, optionName, optionValue)
    end

  end

  @[Extern]
  record IUpdateServiceManager2Vtbl,
    query_interface : Proc(IUpdateServiceManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUpdateServiceManager2*, UInt32),
    release : Proc(IUpdateServiceManager2*, UInt32),
    get_type_info_count : Proc(IUpdateServiceManager2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IUpdateServiceManager2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IUpdateServiceManager2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IUpdateServiceManager2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Services : Proc(IUpdateServiceManager2*, Void**, Win32cr::Foundation::HRESULT),
    add_service : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    register_service_with_au : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove_service : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    unregister_service_with_au : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    add_scan_package_service : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT),
    set_option : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_ClientApplicationID : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ClientApplicationID : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    query_service_registration : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_service2 : Proc(IUpdateServiceManager2*, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0bb8531d-7e8d-424f-986c-a0b8f60a3e7b")]
  record IUpdateServiceManager2, lpVtbl : IUpdateServiceManager2Vtbl* do
    GUID = LibC::GUID.new(0xbb8531d_u32, 0x7e8d_u16, 0x424f_u16, StaticArray[0x98_u8, 0x6c_u8, 0xa0_u8, 0xb8_u8, 0xf6_u8, 0xa_u8, 0x3e_u8, 0x7b_u8])
    def query_interface(this : IUpdateServiceManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUpdateServiceManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUpdateServiceManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IUpdateServiceManager2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IUpdateServiceManager2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IUpdateServiceManager2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IUpdateServiceManager2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Services(this : IUpdateServiceManager2*, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Services.call(this, retval)
    end
    def add_service(this : IUpdateServiceManager2*, serviceID : Win32cr::Foundation::BSTR, authorizationCabPath : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_service.call(this, serviceID, authorizationCabPath, retval)
    end
    def register_service_with_au(this : IUpdateServiceManager2*, serviceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_service_with_au.call(this, serviceID)
    end
    def remove_service(this : IUpdateServiceManager2*, serviceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_service.call(this, serviceID)
    end
    def unregister_service_with_au(this : IUpdateServiceManager2*, serviceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_service_with_au.call(this, serviceID)
    end
    def add_scan_package_service(this : IUpdateServiceManager2*, serviceName : Win32cr::Foundation::BSTR, scanFileLocation : Win32cr::Foundation::BSTR, flags : Int32, ppService : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_scan_package_service.call(this, serviceName, scanFileLocation, flags, ppService)
    end
    def set_option(this : IUpdateServiceManager2*, optionName : Win32cr::Foundation::BSTR, optionValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_option.call(this, optionName, optionValue)
    end
    def get_ClientApplicationID(this : IUpdateServiceManager2*, retval : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClientApplicationID.call(this, retval)
    end
    def put_ClientApplicationID(this : IUpdateServiceManager2*, value : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClientApplicationID.call(this, value)
    end
    def query_service_registration(this : IUpdateServiceManager2*, serviceID : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_service_registration.call(this, serviceID, retval)
    end
    def add_service2(this : IUpdateServiceManager2*, serviceID : Win32cr::Foundation::BSTR, flags : Int32, authorizationCabPath : Win32cr::Foundation::BSTR, retval : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_service2.call(this, serviceID, flags, authorizationCabPath, retval)
    end

  end

  @[Extern]
  record IInstallationAgentVtbl,
    query_interface : Proc(IInstallationAgent*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInstallationAgent*, UInt32),
    release : Proc(IInstallationAgent*, UInt32),
    get_type_info_count : Proc(IInstallationAgent*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IInstallationAgent*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IInstallationAgent*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IInstallationAgent*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    record_installation_result : Proc(IInstallationAgent*, Win32cr::Foundation::BSTR, Int32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("925cbc18-a2ea-4648-bf1c-ec8badcfe20a")]
  record IInstallationAgent, lpVtbl : IInstallationAgentVtbl* do
    GUID = LibC::GUID.new(0x925cbc18_u32, 0xa2ea_u16, 0x4648_u16, StaticArray[0xbf_u8, 0x1c_u8, 0xec_u8, 0x8b_u8, 0xad_u8, 0xcf_u8, 0xe2_u8, 0xa_u8])
    def query_interface(this : IInstallationAgent*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInstallationAgent*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInstallationAgent*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IInstallationAgent*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IInstallationAgent*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IInstallationAgent*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IInstallationAgent*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def record_installation_result(this : IInstallationAgent*, installationResultCookie : Win32cr::Foundation::BSTR, hresult : Int32, extendedReportingData : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.record_installation_result.call(this, installationResultCookie, hresult, extendedReportingData)
    end

  end

end