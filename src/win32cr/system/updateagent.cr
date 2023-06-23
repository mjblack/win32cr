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


  enum AutomaticUpdatesNotificationLevel : Int32
    Aunlnotconfigured = 0
    Aunldisabled = 1
    Aunlnotifybeforedownload = 2
    Aunlnotifybeforeinstallation = 3
    Aunlscheduledinstallation = 4
  end

  enum AutomaticUpdatesScheduledInstallationDay : Int32
    Ausideveryday = 0
    Ausideverysunday = 1
    Ausideverymonday = 2
    Ausideverytuesday = 3
    Ausideverywednesday = 4
    Ausideverythursday = 5
    Ausideveryfriday = 6
    Ausideverysaturday = 7
  end

  enum DownloadPhase : Int32
    Dphinitializing = 1
    Dphdownloading = 2
    Dphverifying = 3
  end

  enum DownloadPriority : Int32
    Dplow = 1
    Dpnormal = 2
    Dphigh = 3
    Dpextrahigh = 4
  end

  enum AutoSelectionMode : Int32
    Asletwindowsupdatedecide = 0
    Asautoselectifdownloaded = 1
    Asneverautoselect = 2
    Asalwaysautoselect = 3
  end

  enum AutoDownloadMode : Int32
    Adletwindowsupdatedecide = 0
    Adneverautodownload = 1
    Adalwaysautodownload = 2
  end

  enum InstallationImpact : Int32
    Iinormal = 0
    Iiminor = 1
    Iirequiresexclusivehandling = 2
  end

  enum InstallationRebootBehavior : Int32
    Irbneverreboots = 0
    Irbalwaysrequiresreboot = 1
    Irbcanrequestreboot = 2
  end

  enum OperationResultCode : Int32
    Orcnotstarted = 0
    Orcinprogress = 1
    Orcsucceeded = 2
    Orcsucceededwitherrors = 3
    Orcfailed = 4
    Orcaborted = 5
  end

  enum ServerSelection : Int32
    Ssdefault = 0
    Ssmanagedserver = 1
    Sswindowsupdate = 2
    Ssothers = 3
  end

  enum UpdateType : Int32
    Utsoftware = 1
    Utdriver = 2
  end

  enum UpdateOperation : Int32
    Uoinstallation = 1
    Uouninstallation = 2
  end

  enum DeploymentAction : Int32
    Danone = 0
    Dainstallation = 1
    Dauninstallation = 2
    Dadetection = 3
    Daoptionalinstallation = 4
  end

  enum UpdateExceptionContext : Int32
    Uecgeneral = 1
    Uecwindowsdriver = 2
    Uecwindowsinstaller = 3
    Uecsearchincomplete = 4
  end

  enum AutomaticUpdatesUserType : Int32
    Auutcurrentuser = 1
    Auutlocaladministrator = 2
  end

  enum AutomaticUpdatesPermissionType : Int32
    Auptsetnotificationlevel = 1
    Auptdisableautomaticupdates = 2
    Auptsetincluderecommendedupdates = 3
    Auptsetfeaturedupdatesenabled = 4
    Auptsetnonadministratorselevated = 5
  end

  enum UpdateServiceRegistrationState : Int32
    Usrsnotregistered = 1
    Usrsregistrationpending = 2
    Usrsregistered = 3
  end

  enum SearchScope : Int32
    Searchscopedefault = 0
    Searchscopemachineonly = 1
    Searchscopecurrentuseronly = 2
    Searchscopemachineandcurrentuser = 3
    Searchscopemachineandallusers = 4
    Searchscopeallusers = 5
  end

  enum UpdateLockdownOption : Int32
    Uloforwebsiteaccess = 1
  end

  enum AddServiceFlag : Int32
    Asfallowpendingregistration = 1
    Asfallowonlineregistration = 2
    Asfregisterservicewithau = 4
  end

  enum UpdateServiceOption : Int32
    Usononvolatileservice = 1
  end


  struct IUpdateLockdownVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    lock_down : UInt64
  end

  IUpdateLockdown_GUID = "a976c28d-75a1-42aa-94ae-8af8b872089a"
  IID_IUpdateLockdown = LibC::GUID.new(0xa976c28d_u32, 0x75a1_u16, 0x42aa_u16, StaticArray[0x94_u8, 0xae_u8, 0x8a_u8, 0xf8_u8, 0xb8_u8, 0x72_u8, 0x8_u8, 0x9a_u8])
  struct IUpdateLockdown
    lpVtbl : IUpdateLockdownVTbl*
  end

  struct IStringCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    put_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
    get_read_only : UInt64
    add : UInt64
    clear : UInt64
    copy : UInt64
    insert : UInt64
    remove_at : UInt64
  end

  IStringCollection_GUID = "eff90582-2ddc-480f-a06d-60f3fbc362c3"
  IID_IStringCollection = LibC::GUID.new(0xeff90582_u32, 0x2ddc_u16, 0x480f_u16, StaticArray[0xa0_u8, 0x6d_u8, 0x60_u8, 0xf3_u8, 0xfb_u8, 0xc3_u8, 0x62_u8, 0xc3_u8])
  struct IStringCollection
    lpVtbl : IStringCollectionVTbl*
  end

  struct IWebProxyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_address : UInt64
    put_address : UInt64
    get_bypass_list : UInt64
    put_bypass_list : UInt64
    get_bypass_proxy_on_local : UInt64
    put_bypass_proxy_on_local : UInt64
    get_read_only : UInt64
    get_user_name : UInt64
    put_user_name : UInt64
    set_password : UInt64
    prompt_for_credentials : UInt64
    prompt_for_credentials_from_hwnd : UInt64
    get_auto_detect : UInt64
    put_auto_detect : UInt64
  end

  IWebProxy_GUID = "174c81fe-aecd-4dae-b8a0-2c6318dd86a8"
  IID_IWebProxy = LibC::GUID.new(0x174c81fe_u32, 0xaecd_u16, 0x4dae_u16, StaticArray[0xb8_u8, 0xa0_u8, 0x2c_u8, 0x63_u8, 0x18_u8, 0xdd_u8, 0x86_u8, 0xa8_u8])
  struct IWebProxy
    lpVtbl : IWebProxyVTbl*
  end

  struct ISystemInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_oem_hardware_support_link : UInt64
    get_reboot_required : UInt64
  end

  ISystemInformation_GUID = "ade87bf7-7b56-4275-8fab-b9b0e591844b"
  IID_ISystemInformation = LibC::GUID.new(0xade87bf7_u32, 0x7b56_u16, 0x4275_u16, StaticArray[0x8f_u8, 0xab_u8, 0xb9_u8, 0xb0_u8, 0xe5_u8, 0x91_u8, 0x84_u8, 0x4b_u8])
  struct ISystemInformation
    lpVtbl : ISystemInformationVTbl*
  end

  struct IWindowsUpdateAgentInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_info : UInt64
  end

  IWindowsUpdateAgentInfo_GUID = "85713fa1-7796-4fa2-be3b-e2d6124dd373"
  IID_IWindowsUpdateAgentInfo = LibC::GUID.new(0x85713fa1_u32, 0x7796_u16, 0x4fa2_u16, StaticArray[0xbe_u8, 0x3b_u8, 0xe2_u8, 0xd6_u8, 0x12_u8, 0x4d_u8, 0xd3_u8, 0x73_u8])
  struct IWindowsUpdateAgentInfo
    lpVtbl : IWindowsUpdateAgentInfoVTbl*
  end

  struct IAutomaticUpdatesResultsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_last_search_success_date : UInt64
    get_last_installation_success_date : UInt64
  end

  IAutomaticUpdatesResults_GUID = "e7a4d634-7942-4dd9-a111-82228ba33901"
  IID_IAutomaticUpdatesResults = LibC::GUID.new(0xe7a4d634_u32, 0x7942_u16, 0x4dd9_u16, StaticArray[0xa1_u8, 0x11_u8, 0x82_u8, 0x22_u8, 0x8b_u8, 0xa3_u8, 0x39_u8, 0x1_u8])
  struct IAutomaticUpdatesResults
    lpVtbl : IAutomaticUpdatesResultsVTbl*
  end

  struct IAutomaticUpdatesSettingsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_notification_level : UInt64
    put_notification_level : UInt64
    get_read_only : UInt64
    get_required : UInt64
    get_scheduled_installation_day : UInt64
    put_scheduled_installation_day : UInt64
    get_scheduled_installation_time : UInt64
    put_scheduled_installation_time : UInt64
    refresh : UInt64
    save : UInt64
  end

  IAutomaticUpdatesSettings_GUID = "2ee48f22-af3c-405f-8970-f71be12ee9a2"
  IID_IAutomaticUpdatesSettings = LibC::GUID.new(0x2ee48f22_u32, 0xaf3c_u16, 0x405f_u16, StaticArray[0x89_u8, 0x70_u8, 0xf7_u8, 0x1b_u8, 0xe1_u8, 0x2e_u8, 0xe9_u8, 0xa2_u8])
  struct IAutomaticUpdatesSettings
    lpVtbl : IAutomaticUpdatesSettingsVTbl*
  end

  struct IAutomaticUpdatesSettings2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_notification_level : UInt64
    put_notification_level : UInt64
    get_read_only : UInt64
    get_required : UInt64
    get_scheduled_installation_day : UInt64
    put_scheduled_installation_day : UInt64
    get_scheduled_installation_time : UInt64
    put_scheduled_installation_time : UInt64
    refresh : UInt64
    save : UInt64
    get_include_recommended_updates : UInt64
    put_include_recommended_updates : UInt64
    check_permission : UInt64
  end

  IAutomaticUpdatesSettings2_GUID = "6abc136a-c3ca-4384-8171-cb2b1e59b8dc"
  IID_IAutomaticUpdatesSettings2 = LibC::GUID.new(0x6abc136a_u32, 0xc3ca_u16, 0x4384_u16, StaticArray[0x81_u8, 0x71_u8, 0xcb_u8, 0x2b_u8, 0x1e_u8, 0x59_u8, 0xb8_u8, 0xdc_u8])
  struct IAutomaticUpdatesSettings2
    lpVtbl : IAutomaticUpdatesSettings2VTbl*
  end

  struct IAutomaticUpdatesSettings3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_notification_level : UInt64
    put_notification_level : UInt64
    get_read_only : UInt64
    get_required : UInt64
    get_scheduled_installation_day : UInt64
    put_scheduled_installation_day : UInt64
    get_scheduled_installation_time : UInt64
    put_scheduled_installation_time : UInt64
    refresh : UInt64
    save : UInt64
    get_include_recommended_updates : UInt64
    put_include_recommended_updates : UInt64
    check_permission : UInt64
    get_non_administrators_elevated : UInt64
    put_non_administrators_elevated : UInt64
    get_featured_updates_enabled : UInt64
    put_featured_updates_enabled : UInt64
  end

  IAutomaticUpdatesSettings3_GUID = "b587f5c3-f57e-485f-bbf5-0d181c5cd0dc"
  IID_IAutomaticUpdatesSettings3 = LibC::GUID.new(0xb587f5c3_u32, 0xf57e_u16, 0x485f_u16, StaticArray[0xbb_u8, 0xf5_u8, 0xd_u8, 0x18_u8, 0x1c_u8, 0x5c_u8, 0xd0_u8, 0xdc_u8])
  struct IAutomaticUpdatesSettings3
    lpVtbl : IAutomaticUpdatesSettings3VTbl*
  end

  struct IAutomaticUpdatesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    detect_now : UInt64
    pause : UInt64
    resume : UInt64
    show_settings_dialog : UInt64
    get_settings : UInt64
    get_service_enabled : UInt64
    enable_service : UInt64
  end

  IAutomaticUpdates_GUID = "673425bf-c082-4c7c-bdfd-569464b8e0ce"
  IID_IAutomaticUpdates = LibC::GUID.new(0x673425bf_u32, 0xc082_u16, 0x4c7c_u16, StaticArray[0xbd_u8, 0xfd_u8, 0x56_u8, 0x94_u8, 0x64_u8, 0xb8_u8, 0xe0_u8, 0xce_u8])
  struct IAutomaticUpdates
    lpVtbl : IAutomaticUpdatesVTbl*
  end

  struct IAutomaticUpdates2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    detect_now : UInt64
    pause : UInt64
    resume : UInt64
    show_settings_dialog : UInt64
    get_settings : UInt64
    get_service_enabled : UInt64
    enable_service : UInt64
    get_results : UInt64
  end

  IAutomaticUpdates2_GUID = "4a2f5c31-cfd9-410e-b7fb-29a653973a0f"
  IID_IAutomaticUpdates2 = LibC::GUID.new(0x4a2f5c31_u32, 0xcfd9_u16, 0x410e_u16, StaticArray[0xb7_u8, 0xfb_u8, 0x29_u8, 0xa6_u8, 0x53_u8, 0x97_u8, 0x3a_u8, 0xf_u8])
  struct IAutomaticUpdates2
    lpVtbl : IAutomaticUpdates2VTbl*
  end

  struct IUpdateIdentityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_revision_number : UInt64
    get_update_id : UInt64
  end

  IUpdateIdentity_GUID = "46297823-9940-4c09-aed9-cd3ea6d05968"
  IID_IUpdateIdentity = LibC::GUID.new(0x46297823_u32, 0x9940_u16, 0x4c09_u16, StaticArray[0xae_u8, 0xd9_u8, 0xcd_u8, 0x3e_u8, 0xa6_u8, 0xd0_u8, 0x59_u8, 0x68_u8])
  struct IUpdateIdentity
    lpVtbl : IUpdateIdentityVTbl*
  end

  struct IImageInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_alt_text : UInt64
    get_height : UInt64
    get_source : UInt64
    get_width : UInt64
  end

  IImageInformation_GUID = "7c907864-346c-4aeb-8f3f-57da289f969f"
  IID_IImageInformation = LibC::GUID.new(0x7c907864_u32, 0x346c_u16, 0x4aeb_u16, StaticArray[0x8f_u8, 0x3f_u8, 0x57_u8, 0xda_u8, 0x28_u8, 0x9f_u8, 0x96_u8, 0x9f_u8])
  struct IImageInformation
    lpVtbl : IImageInformationVTbl*
  end

  struct ICategoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_category_id : UInt64
    get_children : UInt64
    get_description : UInt64
    get_image : UInt64
    get_order : UInt64
    get_parent : UInt64
    get_type : UInt64
    get_updates : UInt64
  end

  ICategory_GUID = "81ddc1b8-9d35-47a6-b471-5b80f519223b"
  IID_ICategory = LibC::GUID.new(0x81ddc1b8_u32, 0x9d35_u16, 0x47a6_u16, StaticArray[0xb4_u8, 0x71_u8, 0x5b_u8, 0x80_u8, 0xf5_u8, 0x19_u8, 0x22_u8, 0x3b_u8])
  struct ICategory
    lpVtbl : ICategoryVTbl*
  end

  struct ICategoryCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  ICategoryCollection_GUID = "3a56bfb8-576c-43f7-9335-fe4838fd7e37"
  IID_ICategoryCollection = LibC::GUID.new(0x3a56bfb8_u32, 0x576c_u16, 0x43f7_u16, StaticArray[0x93_u8, 0x35_u8, 0xfe_u8, 0x48_u8, 0x38_u8, 0xfd_u8, 0x7e_u8, 0x37_u8])
  struct ICategoryCollection
    lpVtbl : ICategoryCollectionVTbl*
  end

  struct IInstallationBehaviorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_can_request_user_input : UInt64
    get_impact : UInt64
    get_reboot_behavior : UInt64
    get_requires_network_connectivity : UInt64
  end

  IInstallationBehavior_GUID = "d9a59339-e245-4dbd-9686-4d5763e39624"
  IID_IInstallationBehavior = LibC::GUID.new(0xd9a59339_u32, 0xe245_u16, 0x4dbd_u16, StaticArray[0x96_u8, 0x86_u8, 0x4d_u8, 0x57_u8, 0x63_u8, 0xe3_u8, 0x96_u8, 0x24_u8])
  struct IInstallationBehavior
    lpVtbl : IInstallationBehaviorVTbl*
  end

  struct IUpdateDownloadContentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_download_url : UInt64
  end

  IUpdateDownloadContent_GUID = "54a2cb2d-9a0c-48b6-8a50-9abb69ee2d02"
  IID_IUpdateDownloadContent = LibC::GUID.new(0x54a2cb2d_u32, 0x9a0c_u16, 0x48b6_u16, StaticArray[0x8a_u8, 0x50_u8, 0x9a_u8, 0xbb_u8, 0x69_u8, 0xee_u8, 0x2d_u8, 0x2_u8])
  struct IUpdateDownloadContent
    lpVtbl : IUpdateDownloadContentVTbl*
  end

  struct IUpdateDownloadContent2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_download_url : UInt64
    get_is_delta_compressed_content : UInt64
  end

  IUpdateDownloadContent2_GUID = "c97ad11b-f257-420b-9d9f-377f733f6f68"
  IID_IUpdateDownloadContent2 = LibC::GUID.new(0xc97ad11b_u32, 0xf257_u16, 0x420b_u16, StaticArray[0x9d_u8, 0x9f_u8, 0x37_u8, 0x7f_u8, 0x73_u8, 0x3f_u8, 0x6f_u8, 0x68_u8])
  struct IUpdateDownloadContent2
    lpVtbl : IUpdateDownloadContent2VTbl*
  end

  struct IUpdateDownloadContentCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  IUpdateDownloadContentCollection_GUID = "bc5513c8-b3b8-4bf7-a4d4-361c0d8c88ba"
  IID_IUpdateDownloadContentCollection = LibC::GUID.new(0xbc5513c8_u32, 0xb3b8_u16, 0x4bf7_u16, StaticArray[0xa4_u8, 0xd4_u8, 0x36_u8, 0x1c_u8, 0xd_u8, 0x8c_u8, 0x88_u8, 0xba_u8])
  struct IUpdateDownloadContentCollection
    lpVtbl : IUpdateDownloadContentCollectionVTbl*
  end

  struct IUpdateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
  end

  IUpdate_GUID = "6a92b07a-d821-4682-b423-5c805022cc4d"
  IID_IUpdate = LibC::GUID.new(0x6a92b07a_u32, 0xd821_u16, 0x4682_u16, StaticArray[0xb4_u8, 0x23_u8, 0x5c_u8, 0x80_u8, 0x50_u8, 0x22_u8, 0xcc_u8, 0x4d_u8])
  struct IUpdate
    lpVtbl : IUpdateVTbl*
  end

  struct IWindowsDriverUpdateVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_driver_class : UInt64
    get_driver_hardware_id : UInt64
    get_driver_manufacturer : UInt64
    get_driver_model : UInt64
    get_driver_provider : UInt64
    get_driver_ver_date : UInt64
    get_device_problem_number : UInt64
    get_device_status : UInt64
  end

  IWindowsDriverUpdate_GUID = "b383cd1a-5ce9-4504-9f63-764b1236f191"
  IID_IWindowsDriverUpdate = LibC::GUID.new(0xb383cd1a_u32, 0x5ce9_u16, 0x4504_u16, StaticArray[0x9f_u8, 0x63_u8, 0x76_u8, 0x4b_u8, 0x12_u8, 0x36_u8, 0xf1_u8, 0x91_u8])
  struct IWindowsDriverUpdate
    lpVtbl : IWindowsDriverUpdateVTbl*
  end

  struct IUpdate2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
  end

  IUpdate2_GUID = "144fe9b0-d23d-4a8b-8634-fb4457533b7a"
  IID_IUpdate2 = LibC::GUID.new(0x144fe9b0_u32, 0xd23d_u16, 0x4a8b_u16, StaticArray[0x86_u8, 0x34_u8, 0xfb_u8, 0x44_u8, 0x57_u8, 0x53_u8, 0x3b_u8, 0x7a_u8])
  struct IUpdate2
    lpVtbl : IUpdate2VTbl*
  end

  struct IUpdate3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
    get_browse_only : UInt64
  end

  IUpdate3_GUID = "112eda6b-95b3-476f-9d90-aee82c6b8181"
  IID_IUpdate3 = LibC::GUID.new(0x112eda6b_u32, 0x95b3_u16, 0x476f_u16, StaticArray[0x9d_u8, 0x90_u8, 0xae_u8, 0xe8_u8, 0x2c_u8, 0x6b_u8, 0x81_u8, 0x81_u8])
  struct IUpdate3
    lpVtbl : IUpdate3VTbl*
  end

  struct IUpdate4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
    get_browse_only : UInt64
    get_per_user : UInt64
  end

  IUpdate4_GUID = "27e94b0d-5139-49a2-9a61-93522dc54652"
  IID_IUpdate4 = LibC::GUID.new(0x27e94b0d_u32, 0x5139_u16, 0x49a2_u16, StaticArray[0x9a_u8, 0x61_u8, 0x93_u8, 0x52_u8, 0x2d_u8, 0xc5_u8, 0x46_u8, 0x52_u8])
  struct IUpdate4
    lpVtbl : IUpdate4VTbl*
  end

  struct IUpdate5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
    get_browse_only : UInt64
    get_per_user : UInt64
    get_auto_selection : UInt64
    get_auto_download : UInt64
  end

  IUpdate5_GUID = "c1c2f21a-d2f4-4902-b5c6-8a081c19a890"
  IID_IUpdate5 = LibC::GUID.new(0xc1c2f21a_u32, 0xd2f4_u16, 0x4902_u16, StaticArray[0xb5_u8, 0xc6_u8, 0x8a_u8, 0x8_u8, 0x1c_u8, 0x19_u8, 0xa8_u8, 0x90_u8])
  struct IUpdate5
    lpVtbl : IUpdate5VTbl*
  end

  struct IWindowsDriverUpdate2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_driver_class : UInt64
    get_driver_hardware_id : UInt64
    get_driver_manufacturer : UInt64
    get_driver_model : UInt64
    get_driver_provider : UInt64
    get_driver_ver_date : UInt64
    get_device_problem_number : UInt64
    get_device_status : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
  end

  IWindowsDriverUpdate2_GUID = "615c4269-7a48-43bd-96b7-bf6ca27d6c3e"
  IID_IWindowsDriverUpdate2 = LibC::GUID.new(0x615c4269_u32, 0x7a48_u16, 0x43bd_u16, StaticArray[0x96_u8, 0xb7_u8, 0xbf_u8, 0x6c_u8, 0xa2_u8, 0x7d_u8, 0x6c_u8, 0x3e_u8])
  struct IWindowsDriverUpdate2
    lpVtbl : IWindowsDriverUpdate2VTbl*
  end

  struct IWindowsDriverUpdate3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_driver_class : UInt64
    get_driver_hardware_id : UInt64
    get_driver_manufacturer : UInt64
    get_driver_model : UInt64
    get_driver_provider : UInt64
    get_driver_ver_date : UInt64
    get_device_problem_number : UInt64
    get_device_status : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
    get_browse_only : UInt64
  end

  IWindowsDriverUpdate3_GUID = "49ebd502-4a96-41bd-9e3e-4c5057f4250c"
  IID_IWindowsDriverUpdate3 = LibC::GUID.new(0x49ebd502_u32, 0x4a96_u16, 0x41bd_u16, StaticArray[0x9e_u8, 0x3e_u8, 0x4c_u8, 0x50_u8, 0x57_u8, 0xf4_u8, 0x25_u8, 0xc_u8])
  struct IWindowsDriverUpdate3
    lpVtbl : IWindowsDriverUpdate3VTbl*
  end

  struct IWindowsDriverUpdateEntryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_driver_class : UInt64
    get_driver_hardware_id : UInt64
    get_driver_manufacturer : UInt64
    get_driver_model : UInt64
    get_driver_provider : UInt64
    get_driver_ver_date : UInt64
    get_device_problem_number : UInt64
    get_device_status : UInt64
  end

  IWindowsDriverUpdateEntry_GUID = "ed8bfe40-a60b-42ea-9652-817dfcfa23ec"
  IID_IWindowsDriverUpdateEntry = LibC::GUID.new(0xed8bfe40_u32, 0xa60b_u16, 0x42ea_u16, StaticArray[0x96_u8, 0x52_u8, 0x81_u8, 0x7d_u8, 0xfc_u8, 0xfa_u8, 0x23_u8, 0xec_u8])
  struct IWindowsDriverUpdateEntry
    lpVtbl : IWindowsDriverUpdateEntryVTbl*
  end

  struct IWindowsDriverUpdateEntryCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  IWindowsDriverUpdateEntryCollection_GUID = "0d521700-a372-4bef-828b-3d00c10adebd"
  IID_IWindowsDriverUpdateEntryCollection = LibC::GUID.new(0xd521700_u32, 0xa372_u16, 0x4bef_u16, StaticArray[0x82_u8, 0x8b_u8, 0x3d_u8, 0x0_u8, 0xc1_u8, 0xa_u8, 0xde_u8, 0xbd_u8])
  struct IWindowsDriverUpdateEntryCollection
    lpVtbl : IWindowsDriverUpdateEntryCollectionVTbl*
  end

  struct IWindowsDriverUpdate4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_driver_class : UInt64
    get_driver_hardware_id : UInt64
    get_driver_manufacturer : UInt64
    get_driver_model : UInt64
    get_driver_provider : UInt64
    get_driver_ver_date : UInt64
    get_device_problem_number : UInt64
    get_device_status : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
    get_browse_only : UInt64
    get_windows_driver_update_entries : UInt64
    get_per_user : UInt64
  end

  IWindowsDriverUpdate4_GUID = "004c6a2b-0c19-4c69-9f5c-a269b2560db9"
  IID_IWindowsDriverUpdate4 = LibC::GUID.new(0x4c6a2b_u32, 0xc19_u16, 0x4c69_u16, StaticArray[0x9f_u8, 0x5c_u8, 0xa2_u8, 0x69_u8, 0xb2_u8, 0x56_u8, 0xd_u8, 0xb9_u8])
  struct IWindowsDriverUpdate4
    lpVtbl : IWindowsDriverUpdate4VTbl*
  end

  struct IWindowsDriverUpdate5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_title : UInt64
    get_auto_select_on_web_sites : UInt64
    get_bundled_updates : UInt64
    get_can_require_source : UInt64
    get_categories : UInt64
    get_deadline : UInt64
    get_delta_compressed_content_available : UInt64
    get_delta_compressed_content_preferred : UInt64
    get_description : UInt64
    get_eula_accepted : UInt64
    get_eula_text : UInt64
    get_handler_id : UInt64
    get_identity : UInt64
    get_image : UInt64
    get_installation_behavior : UInt64
    get_is_beta : UInt64
    get_is_downloaded : UInt64
    get_is_hidden : UInt64
    put_is_hidden : UInt64
    get_is_installed : UInt64
    get_is_mandatory : UInt64
    get_is_uninstallable : UInt64
    get_languages : UInt64
    get_last_deployment_change_time : UInt64
    get_max_download_size : UInt64
    get_min_download_size : UInt64
    get_more_info_urls : UInt64
    get_msrc_severity : UInt64
    get_recommended_cpu_speed : UInt64
    get_recommended_hard_disk_space : UInt64
    get_recommended_memory : UInt64
    get_release_notes : UInt64
    get_security_bulletin_i_ds : UInt64
    get_superseded_update_i_ds : UInt64
    get_support_url : UInt64
    get_type : UInt64
    get_uninstallation_notes : UInt64
    get_uninstallation_behavior : UInt64
    get_uninstallation_steps : UInt64
    get_kb_article_i_ds : UInt64
    accept_eula : UInt64
    get_deployment_action : UInt64
    copy_from_cache : UInt64
    get_download_priority : UInt64
    get_download_contents : UInt64
    get_driver_class : UInt64
    get_driver_hardware_id : UInt64
    get_driver_manufacturer : UInt64
    get_driver_model : UInt64
    get_driver_provider : UInt64
    get_driver_ver_date : UInt64
    get_device_problem_number : UInt64
    get_device_status : UInt64
    get_reboot_required : UInt64
    get_is_present : UInt64
    get_cve_i_ds : UInt64
    copy_to_cache : UInt64
    get_browse_only : UInt64
    get_windows_driver_update_entries : UInt64
    get_per_user : UInt64
    get_auto_selection : UInt64
    get_auto_download : UInt64
  end

  IWindowsDriverUpdate5_GUID = "70cf5c82-8642-42bb-9dbc-0cfd263c6c4f"
  IID_IWindowsDriverUpdate5 = LibC::GUID.new(0x70cf5c82_u32, 0x8642_u16, 0x42bb_u16, StaticArray[0x9d_u8, 0xbc_u8, 0xc_u8, 0xfd_u8, 0x26_u8, 0x3c_u8, 0x6c_u8, 0x4f_u8])
  struct IWindowsDriverUpdate5
    lpVtbl : IWindowsDriverUpdate5VTbl*
  end

  struct IUpdateCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    put_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
    get_read_only : UInt64
    add : UInt64
    clear : UInt64
    copy : UInt64
    insert : UInt64
    remove_at : UInt64
  end

  IUpdateCollection_GUID = "07f7438c-7709-4ca5-b518-91279288134e"
  IID_IUpdateCollection = LibC::GUID.new(0x7f7438c_u32, 0x7709_u16, 0x4ca5_u16, StaticArray[0xb5_u8, 0x18_u8, 0x91_u8, 0x27_u8, 0x92_u8, 0x88_u8, 0x13_u8, 0x4e_u8])
  struct IUpdateCollection
    lpVtbl : IUpdateCollectionVTbl*
  end

  struct IUpdateExceptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_message : UInt64
    get_h_result : UInt64
    get_context : UInt64
  end

  IUpdateException_GUID = "a376dd5e-09d4-427f-af7c-fed5b6e1c1d6"
  IID_IUpdateException = LibC::GUID.new(0xa376dd5e_u32, 0x9d4_u16, 0x427f_u16, StaticArray[0xaf_u8, 0x7c_u8, 0xfe_u8, 0xd5_u8, 0xb6_u8, 0xe1_u8, 0xc1_u8, 0xd6_u8])
  struct IUpdateException
    lpVtbl : IUpdateExceptionVTbl*
  end

  struct IInvalidProductLicenseExceptionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_message : UInt64
    get_h_result : UInt64
    get_context : UInt64
    get_product : UInt64
  end

  IInvalidProductLicenseException_GUID = "a37d00f5-7bb0-4953-b414-f9e98326f2e8"
  IID_IInvalidProductLicenseException = LibC::GUID.new(0xa37d00f5_u32, 0x7bb0_u16, 0x4953_u16, StaticArray[0xb4_u8, 0x14_u8, 0xf9_u8, 0xe9_u8, 0x83_u8, 0x26_u8, 0xf2_u8, 0xe8_u8])
  struct IInvalidProductLicenseException
    lpVtbl : IInvalidProductLicenseExceptionVTbl*
  end

  struct IUpdateExceptionCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  IUpdateExceptionCollection_GUID = "503626a3-8e14-4729-9355-0fe664bd2321"
  IID_IUpdateExceptionCollection = LibC::GUID.new(0x503626a3_u32, 0x8e14_u16, 0x4729_u16, StaticArray[0x93_u8, 0x55_u8, 0xf_u8, 0xe6_u8, 0x64_u8, 0xbd_u8, 0x23_u8, 0x21_u8])
  struct IUpdateExceptionCollection
    lpVtbl : IUpdateExceptionCollectionVTbl*
  end

  struct ISearchResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_result_code : UInt64
    get_root_categories : UInt64
    get_updates : UInt64
    get_warnings : UInt64
  end

  ISearchResult_GUID = "d40cff62-e08c-4498-941a-01e25f0fd33c"
  IID_ISearchResult = LibC::GUID.new(0xd40cff62_u32, 0xe08c_u16, 0x4498_u16, StaticArray[0x94_u8, 0x1a_u8, 0x1_u8, 0xe2_u8, 0x5f_u8, 0xf_u8, 0xd3_u8, 0x3c_u8])
  struct ISearchResult
    lpVtbl : ISearchResultVTbl*
  end

  struct ISearchJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_async_state : UInt64
    get_is_completed : UInt64
    clean_up : UInt64
    request_abort : UInt64
  end

  ISearchJob_GUID = "7366ea16-7a1a-4ea2-b042-973d3e9cd99b"
  IID_ISearchJob = LibC::GUID.new(0x7366ea16_u32, 0x7a1a_u16, 0x4ea2_u16, StaticArray[0xb0_u8, 0x42_u8, 0x97_u8, 0x3d_u8, 0x3e_u8, 0x9c_u8, 0xd9_u8, 0x9b_u8])
  struct ISearchJob
    lpVtbl : ISearchJobVTbl*
  end

  struct ISearchCompletedCallbackArgsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  ISearchCompletedCallbackArgs_GUID = "a700a634-2850-4c47-938a-9e4b6e5af9a6"
  IID_ISearchCompletedCallbackArgs = LibC::GUID.new(0xa700a634_u32, 0x2850_u16, 0x4c47_u16, StaticArray[0x93_u8, 0x8a_u8, 0x9e_u8, 0x4b_u8, 0x6e_u8, 0x5a_u8, 0xf9_u8, 0xa6_u8])
  struct ISearchCompletedCallbackArgs
    lpVtbl : ISearchCompletedCallbackArgsVTbl*
  end

  struct ISearchCompletedCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  ISearchCompletedCallback_GUID = "88aee058-d4b0-4725-a2f1-814a67ae964c"
  IID_ISearchCompletedCallback = LibC::GUID.new(0x88aee058_u32, 0xd4b0_u16, 0x4725_u16, StaticArray[0xa2_u8, 0xf1_u8, 0x81_u8, 0x4a_u8, 0x67_u8, 0xae_u8, 0x96_u8, 0x4c_u8])
  struct ISearchCompletedCallback
    lpVtbl : ISearchCompletedCallbackVTbl*
  end

  struct IUpdateHistoryEntryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_operation : UInt64
    get_result_code : UInt64
    get_h_result : UInt64
    get_date : UInt64
    get_update_identity : UInt64
    get_title : UInt64
    get_description : UInt64
    get_unmapped_result_code : UInt64
    get_client_application_id : UInt64
    get_server_selection : UInt64
    get_service_id : UInt64
    get_uninstallation_steps : UInt64
    get_uninstallation_notes : UInt64
    get_support_url : UInt64
  end

  IUpdateHistoryEntry_GUID = "be56a644-af0e-4e0e-a311-c1d8e695cbff"
  IID_IUpdateHistoryEntry = LibC::GUID.new(0xbe56a644_u32, 0xaf0e_u16, 0x4e0e_u16, StaticArray[0xa3_u8, 0x11_u8, 0xc1_u8, 0xd8_u8, 0xe6_u8, 0x95_u8, 0xcb_u8, 0xff_u8])
  struct IUpdateHistoryEntry
    lpVtbl : IUpdateHistoryEntryVTbl*
  end

  struct IUpdateHistoryEntry2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_operation : UInt64
    get_result_code : UInt64
    get_h_result : UInt64
    get_date : UInt64
    get_update_identity : UInt64
    get_title : UInt64
    get_description : UInt64
    get_unmapped_result_code : UInt64
    get_client_application_id : UInt64
    get_server_selection : UInt64
    get_service_id : UInt64
    get_uninstallation_steps : UInt64
    get_uninstallation_notes : UInt64
    get_support_url : UInt64
    get_categories : UInt64
  end

  IUpdateHistoryEntry2_GUID = "c2bfb780-4539-4132-ab8c-0a8772013ab6"
  IID_IUpdateHistoryEntry2 = LibC::GUID.new(0xc2bfb780_u32, 0x4539_u16, 0x4132_u16, StaticArray[0xab_u8, 0x8c_u8, 0xa_u8, 0x87_u8, 0x72_u8, 0x1_u8, 0x3a_u8, 0xb6_u8])
  struct IUpdateHistoryEntry2
    lpVtbl : IUpdateHistoryEntry2VTbl*
  end

  struct IUpdateHistoryEntryCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  IUpdateHistoryEntryCollection_GUID = "a7f04f3c-a290-435b-aadf-a116c3357a5c"
  IID_IUpdateHistoryEntryCollection = LibC::GUID.new(0xa7f04f3c_u32, 0xa290_u16, 0x435b_u16, StaticArray[0xaa_u8, 0xdf_u8, 0xa1_u8, 0x16_u8, 0xc3_u8, 0x35_u8, 0x7a_u8, 0x5c_u8])
  struct IUpdateHistoryEntryCollection
    lpVtbl : IUpdateHistoryEntryCollectionVTbl*
  end

  struct IUpdateSearcherVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_can_automatically_upgrade_service : UInt64
    put_can_automatically_upgrade_service : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_include_potentially_superseded_updates : UInt64
    put_include_potentially_superseded_updates : UInt64
    get_server_selection : UInt64
    put_server_selection : UInt64
    begin_search : UInt64
    end_search : UInt64
    escape_string : UInt64
    query_history : UInt64
    search : UInt64
    get_online : UInt64
    put_online : UInt64
    get_total_history_count : UInt64
    get_service_id : UInt64
    put_service_id : UInt64
  end

  IUpdateSearcher_GUID = "8f45abf1-f9ae-4b95-a933-f0f66e5056ea"
  IID_IUpdateSearcher = LibC::GUID.new(0x8f45abf1_u32, 0xf9ae_u16, 0x4b95_u16, StaticArray[0xa9_u8, 0x33_u8, 0xf0_u8, 0xf6_u8, 0x6e_u8, 0x50_u8, 0x56_u8, 0xea_u8])
  struct IUpdateSearcher
    lpVtbl : IUpdateSearcherVTbl*
  end

  struct IUpdateSearcher2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_can_automatically_upgrade_service : UInt64
    put_can_automatically_upgrade_service : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_include_potentially_superseded_updates : UInt64
    put_include_potentially_superseded_updates : UInt64
    get_server_selection : UInt64
    put_server_selection : UInt64
    begin_search : UInt64
    end_search : UInt64
    escape_string : UInt64
    query_history : UInt64
    search : UInt64
    get_online : UInt64
    put_online : UInt64
    get_total_history_count : UInt64
    get_service_id : UInt64
    put_service_id : UInt64
    get_ignore_download_priority : UInt64
    put_ignore_download_priority : UInt64
  end

  IUpdateSearcher2_GUID = "4cbdcb2d-1589-4beb-bd1c-3e582ff0add0"
  IID_IUpdateSearcher2 = LibC::GUID.new(0x4cbdcb2d_u32, 0x1589_u16, 0x4beb_u16, StaticArray[0xbd_u8, 0x1c_u8, 0x3e_u8, 0x58_u8, 0x2f_u8, 0xf0_u8, 0xad_u8, 0xd0_u8])
  struct IUpdateSearcher2
    lpVtbl : IUpdateSearcher2VTbl*
  end

  struct IUpdateSearcher3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_can_automatically_upgrade_service : UInt64
    put_can_automatically_upgrade_service : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_include_potentially_superseded_updates : UInt64
    put_include_potentially_superseded_updates : UInt64
    get_server_selection : UInt64
    put_server_selection : UInt64
    begin_search : UInt64
    end_search : UInt64
    escape_string : UInt64
    query_history : UInt64
    search : UInt64
    get_online : UInt64
    put_online : UInt64
    get_total_history_count : UInt64
    get_service_id : UInt64
    put_service_id : UInt64
    get_ignore_download_priority : UInt64
    put_ignore_download_priority : UInt64
    get_search_scope : UInt64
    put_search_scope : UInt64
  end

  IUpdateSearcher3_GUID = "04c6895d-eaf2-4034-97f3-311de9be413a"
  IID_IUpdateSearcher3 = LibC::GUID.new(0x4c6895d_u32, 0xeaf2_u16, 0x4034_u16, StaticArray[0x97_u8, 0xf3_u8, 0x31_u8, 0x1d_u8, 0xe9_u8, 0xbe_u8, 0x41_u8, 0x3a_u8])
  struct IUpdateSearcher3
    lpVtbl : IUpdateSearcher3VTbl*
  end

  struct IUpdateDownloadResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_result : UInt64
    get_result_code : UInt64
  end

  IUpdateDownloadResult_GUID = "bf99af76-b575-42ad-8aa4-33cbb5477af1"
  IID_IUpdateDownloadResult = LibC::GUID.new(0xbf99af76_u32, 0xb575_u16, 0x42ad_u16, StaticArray[0x8a_u8, 0xa4_u8, 0x33_u8, 0xcb_u8, 0xb5_u8, 0x47_u8, 0x7a_u8, 0xf1_u8])
  struct IUpdateDownloadResult
    lpVtbl : IUpdateDownloadResultVTbl*
  end

  struct IDownloadResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_result : UInt64
    get_result_code : UInt64
    get_update_result : UInt64
  end

  IDownloadResult_GUID = "daa4fdd0-4727-4dbe-a1e7-745dca317144"
  IID_IDownloadResult = LibC::GUID.new(0xdaa4fdd0_u32, 0x4727_u16, 0x4dbe_u16, StaticArray[0xa1_u8, 0xe7_u8, 0x74_u8, 0x5d_u8, 0xca_u8, 0x31_u8, 0x71_u8, 0x44_u8])
  struct IDownloadResult
    lpVtbl : IDownloadResultVTbl*
  end

  struct IDownloadProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_current_update_bytes_downloaded : UInt64
    get_current_update_bytes_to_download : UInt64
    get_current_update_index : UInt64
    get_percent_complete : UInt64
    get_total_bytes_downloaded : UInt64
    get_total_bytes_to_download : UInt64
    get_update_result : UInt64
    get_current_update_download_phase : UInt64
    get_current_update_percent_complete : UInt64
  end

  IDownloadProgress_GUID = "d31a5bac-f719-4178-9dbb-5e2cb47fd18a"
  IID_IDownloadProgress = LibC::GUID.new(0xd31a5bac_u32, 0xf719_u16, 0x4178_u16, StaticArray[0x9d_u8, 0xbb_u8, 0x5e_u8, 0x2c_u8, 0xb4_u8, 0x7f_u8, 0xd1_u8, 0x8a_u8])
  struct IDownloadProgress
    lpVtbl : IDownloadProgressVTbl*
  end

  struct IDownloadJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_async_state : UInt64
    get_is_completed : UInt64
    get_updates : UInt64
    clean_up : UInt64
    get_progress : UInt64
    request_abort : UInt64
  end

  IDownloadJob_GUID = "c574de85-7358-43f6-aae8-8697e62d8ba7"
  IID_IDownloadJob = LibC::GUID.new(0xc574de85_u32, 0x7358_u16, 0x43f6_u16, StaticArray[0xaa_u8, 0xe8_u8, 0x86_u8, 0x97_u8, 0xe6_u8, 0x2d_u8, 0x8b_u8, 0xa7_u8])
  struct IDownloadJob
    lpVtbl : IDownloadJobVTbl*
  end

  struct IDownloadCompletedCallbackArgsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IDownloadCompletedCallbackArgs_GUID = "fa565b23-498c-47a0-979d-e7d5b1813360"
  IID_IDownloadCompletedCallbackArgs = LibC::GUID.new(0xfa565b23_u32, 0x498c_u16, 0x47a0_u16, StaticArray[0x97_u8, 0x9d_u8, 0xe7_u8, 0xd5_u8, 0xb1_u8, 0x81_u8, 0x33_u8, 0x60_u8])
  struct IDownloadCompletedCallbackArgs
    lpVtbl : IDownloadCompletedCallbackArgsVTbl*
  end

  struct IDownloadCompletedCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IDownloadCompletedCallback_GUID = "77254866-9f5b-4c8e-b9e2-c77a8530d64b"
  IID_IDownloadCompletedCallback = LibC::GUID.new(0x77254866_u32, 0x9f5b_u16, 0x4c8e_u16, StaticArray[0xb9_u8, 0xe2_u8, 0xc7_u8, 0x7a_u8, 0x85_u8, 0x30_u8, 0xd6_u8, 0x4b_u8])
  struct IDownloadCompletedCallback
    lpVtbl : IDownloadCompletedCallbackVTbl*
  end

  struct IDownloadProgressChangedCallbackArgsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_progress : UInt64
  end

  IDownloadProgressChangedCallbackArgs_GUID = "324ff2c6-4981-4b04-9412-57481745ab24"
  IID_IDownloadProgressChangedCallbackArgs = LibC::GUID.new(0x324ff2c6_u32, 0x4981_u16, 0x4b04_u16, StaticArray[0x94_u8, 0x12_u8, 0x57_u8, 0x48_u8, 0x17_u8, 0x45_u8, 0xab_u8, 0x24_u8])
  struct IDownloadProgressChangedCallbackArgs
    lpVtbl : IDownloadProgressChangedCallbackArgsVTbl*
  end

  struct IDownloadProgressChangedCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IDownloadProgressChangedCallback_GUID = "8c3f1cdd-6173-4591-aebd-a56a53ca77c1"
  IID_IDownloadProgressChangedCallback = LibC::GUID.new(0x8c3f1cdd_u32, 0x6173_u16, 0x4591_u16, StaticArray[0xae_u8, 0xbd_u8, 0xa5_u8, 0x6a_u8, 0x53_u8, 0xca_u8, 0x77_u8, 0xc1_u8])
  struct IDownloadProgressChangedCallback
    lpVtbl : IDownloadProgressChangedCallbackVTbl*
  end

  struct IUpdateDownloaderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_is_forced : UInt64
    put_is_forced : UInt64
    get_priority : UInt64
    put_priority : UInt64
    get_updates : UInt64
    put_updates : UInt64
    begin_download : UInt64
    download : UInt64
    end_download : UInt64
  end

  IUpdateDownloader_GUID = "68f1c6f9-7ecc-4666-a464-247fe12496c3"
  IID_IUpdateDownloader = LibC::GUID.new(0x68f1c6f9_u32, 0x7ecc_u16, 0x4666_u16, StaticArray[0xa4_u8, 0x64_u8, 0x24_u8, 0x7f_u8, 0xe1_u8, 0x24_u8, 0x96_u8, 0xc3_u8])
  struct IUpdateDownloader
    lpVtbl : IUpdateDownloaderVTbl*
  end

  struct IUpdateInstallationResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_result : UInt64
    get_reboot_required : UInt64
    get_result_code : UInt64
  end

  IUpdateInstallationResult_GUID = "d940f0f8-3cbb-4fd0-993f-471e7f2328ad"
  IID_IUpdateInstallationResult = LibC::GUID.new(0xd940f0f8_u32, 0x3cbb_u16, 0x4fd0_u16, StaticArray[0x99_u8, 0x3f_u8, 0x47_u8, 0x1e_u8, 0x7f_u8, 0x23_u8, 0x28_u8, 0xad_u8])
  struct IUpdateInstallationResult
    lpVtbl : IUpdateInstallationResultVTbl*
  end

  struct IInstallationResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_h_result : UInt64
    get_reboot_required : UInt64
    get_result_code : UInt64
    get_update_result : UInt64
  end

  IInstallationResult_GUID = "a43c56d6-7451-48d4-af96-b6cd2d0d9b7a"
  IID_IInstallationResult = LibC::GUID.new(0xa43c56d6_u32, 0x7451_u16, 0x48d4_u16, StaticArray[0xaf_u8, 0x96_u8, 0xb6_u8, 0xcd_u8, 0x2d_u8, 0xd_u8, 0x9b_u8, 0x7a_u8])
  struct IInstallationResult
    lpVtbl : IInstallationResultVTbl*
  end

  struct IInstallationProgressVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_current_update_index : UInt64
    get_current_update_percent_complete : UInt64
    get_percent_complete : UInt64
    get_update_result : UInt64
  end

  IInstallationProgress_GUID = "345c8244-43a3-4e32-a368-65f073b76f36"
  IID_IInstallationProgress = LibC::GUID.new(0x345c8244_u32, 0x43a3_u16, 0x4e32_u16, StaticArray[0xa3_u8, 0x68_u8, 0x65_u8, 0xf0_u8, 0x73_u8, 0xb7_u8, 0x6f_u8, 0x36_u8])
  struct IInstallationProgress
    lpVtbl : IInstallationProgressVTbl*
  end

  struct IInstallationJobVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_async_state : UInt64
    get_is_completed : UInt64
    get_updates : UInt64
    clean_up : UInt64
    get_progress : UInt64
    request_abort : UInt64
  end

  IInstallationJob_GUID = "5c209f0b-bad5-432a-9556-4699bed2638a"
  IID_IInstallationJob = LibC::GUID.new(0x5c209f0b_u32, 0xbad5_u16, 0x432a_u16, StaticArray[0x95_u8, 0x56_u8, 0x46_u8, 0x99_u8, 0xbe_u8, 0xd2_u8, 0x63_u8, 0x8a_u8])
  struct IInstallationJob
    lpVtbl : IInstallationJobVTbl*
  end

  struct IInstallationCompletedCallbackArgsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
  end

  IInstallationCompletedCallbackArgs_GUID = "250e2106-8efb-4705-9653-ef13c581b6a1"
  IID_IInstallationCompletedCallbackArgs = LibC::GUID.new(0x250e2106_u32, 0x8efb_u16, 0x4705_u16, StaticArray[0x96_u8, 0x53_u8, 0xef_u8, 0x13_u8, 0xc5_u8, 0x81_u8, 0xb6_u8, 0xa1_u8])
  struct IInstallationCompletedCallbackArgs
    lpVtbl : IInstallationCompletedCallbackArgsVTbl*
  end

  struct IInstallationCompletedCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IInstallationCompletedCallback_GUID = "45f4f6f3-d602-4f98-9a8a-3efa152ad2d3"
  IID_IInstallationCompletedCallback = LibC::GUID.new(0x45f4f6f3_u32, 0xd602_u16, 0x4f98_u16, StaticArray[0x9a_u8, 0x8a_u8, 0x3e_u8, 0xfa_u8, 0x15_u8, 0x2a_u8, 0xd2_u8, 0xd3_u8])
  struct IInstallationCompletedCallback
    lpVtbl : IInstallationCompletedCallbackVTbl*
  end

  struct IInstallationProgressChangedCallbackArgsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_progress : UInt64
  end

  IInstallationProgressChangedCallbackArgs_GUID = "e4f14e1e-689d-4218-a0b9-bc189c484a01"
  IID_IInstallationProgressChangedCallbackArgs = LibC::GUID.new(0xe4f14e1e_u32, 0x689d_u16, 0x4218_u16, StaticArray[0xa0_u8, 0xb9_u8, 0xbc_u8, 0x18_u8, 0x9c_u8, 0x48_u8, 0x4a_u8, 0x1_u8])
  struct IInstallationProgressChangedCallbackArgs
    lpVtbl : IInstallationProgressChangedCallbackArgsVTbl*
  end

  struct IInstallationProgressChangedCallbackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IInstallationProgressChangedCallback_GUID = "e01402d5-f8da-43ba-a012-38894bd048f1"
  IID_IInstallationProgressChangedCallback = LibC::GUID.new(0xe01402d5_u32, 0xf8da_u16, 0x43ba_u16, StaticArray[0xa0_u8, 0x12_u8, 0x38_u8, 0x89_u8, 0x4b_u8, 0xd0_u8, 0x48_u8, 0xf1_u8])
  struct IInstallationProgressChangedCallback
    lpVtbl : IInstallationProgressChangedCallbackVTbl*
  end

  struct IUpdateInstallerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_is_forced : UInt64
    put_is_forced : UInt64
    get_parent_hwnd : UInt64
    put_parent_hwnd : UInt64
    put_parent_window : UInt64
    get_parent_window : UInt64
    get_updates : UInt64
    put_updates : UInt64
    begin_install : UInt64
    begin_uninstall : UInt64
    end_install : UInt64
    end_uninstall : UInt64
    install : UInt64
    run_wizard : UInt64
    get_is_busy : UInt64
    uninstall : UInt64
    get_allow_source_prompts : UInt64
    put_allow_source_prompts : UInt64
    get_reboot_required_before_installation : UInt64
  end

  IUpdateInstaller_GUID = "7b929c68-ccdc-4226-96b1-8724600b54c2"
  IID_IUpdateInstaller = LibC::GUID.new(0x7b929c68_u32, 0xccdc_u16, 0x4226_u16, StaticArray[0x96_u8, 0xb1_u8, 0x87_u8, 0x24_u8, 0x60_u8, 0xb_u8, 0x54_u8, 0xc2_u8])
  struct IUpdateInstaller
    lpVtbl : IUpdateInstallerVTbl*
  end

  struct IUpdateInstaller2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_is_forced : UInt64
    put_is_forced : UInt64
    get_parent_hwnd : UInt64
    put_parent_hwnd : UInt64
    put_parent_window : UInt64
    get_parent_window : UInt64
    get_updates : UInt64
    put_updates : UInt64
    begin_install : UInt64
    begin_uninstall : UInt64
    end_install : UInt64
    end_uninstall : UInt64
    install : UInt64
    run_wizard : UInt64
    get_is_busy : UInt64
    uninstall : UInt64
    get_allow_source_prompts : UInt64
    put_allow_source_prompts : UInt64
    get_reboot_required_before_installation : UInt64
    get_force_quiet : UInt64
    put_force_quiet : UInt64
  end

  IUpdateInstaller2_GUID = "3442d4fe-224d-4cee-98cf-30e0c4d229e6"
  IID_IUpdateInstaller2 = LibC::GUID.new(0x3442d4fe_u32, 0x224d_u16, 0x4cee_u16, StaticArray[0x98_u8, 0xcf_u8, 0x30_u8, 0xe0_u8, 0xc4_u8, 0xd2_u8, 0x29_u8, 0xe6_u8])
  struct IUpdateInstaller2
    lpVtbl : IUpdateInstaller2VTbl*
  end

  struct IUpdateInstaller3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_is_forced : UInt64
    put_is_forced : UInt64
    get_parent_hwnd : UInt64
    put_parent_hwnd : UInt64
    put_parent_window : UInt64
    get_parent_window : UInt64
    get_updates : UInt64
    put_updates : UInt64
    begin_install : UInt64
    begin_uninstall : UInt64
    end_install : UInt64
    end_uninstall : UInt64
    install : UInt64
    run_wizard : UInt64
    get_is_busy : UInt64
    uninstall : UInt64
    get_allow_source_prompts : UInt64
    put_allow_source_prompts : UInt64
    get_reboot_required_before_installation : UInt64
    get_force_quiet : UInt64
    put_force_quiet : UInt64
    get_attempt_close_apps_if_necessary : UInt64
    put_attempt_close_apps_if_necessary : UInt64
  end

  IUpdateInstaller3_GUID = "16d11c35-099a-48d0-8338-5fae64047f8e"
  IID_IUpdateInstaller3 = LibC::GUID.new(0x16d11c35_u32, 0x99a_u16, 0x48d0_u16, StaticArray[0x83_u8, 0x38_u8, 0x5f_u8, 0xae_u8, 0x64_u8, 0x4_u8, 0x7f_u8, 0x8e_u8])
  struct IUpdateInstaller3
    lpVtbl : IUpdateInstaller3VTbl*
  end

  struct IUpdateInstaller4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_is_forced : UInt64
    put_is_forced : UInt64
    get_parent_hwnd : UInt64
    put_parent_hwnd : UInt64
    put_parent_window : UInt64
    get_parent_window : UInt64
    get_updates : UInt64
    put_updates : UInt64
    begin_install : UInt64
    begin_uninstall : UInt64
    end_install : UInt64
    end_uninstall : UInt64
    install : UInt64
    run_wizard : UInt64
    get_is_busy : UInt64
    uninstall : UInt64
    get_allow_source_prompts : UInt64
    put_allow_source_prompts : UInt64
    get_reboot_required_before_installation : UInt64
    get_force_quiet : UInt64
    put_force_quiet : UInt64
    get_attempt_close_apps_if_necessary : UInt64
    put_attempt_close_apps_if_necessary : UInt64
    commit : UInt64
  end

  IUpdateInstaller4_GUID = "ef8208ea-2304-492d-9109-23813b0958e1"
  IID_IUpdateInstaller4 = LibC::GUID.new(0xef8208ea_u32, 0x2304_u16, 0x492d_u16, StaticArray[0x91_u8, 0x9_u8, 0x23_u8, 0x81_u8, 0x3b_u8, 0x9_u8, 0x58_u8, 0xe1_u8])
  struct IUpdateInstaller4
    lpVtbl : IUpdateInstaller4VTbl*
  end

  struct IUpdateSessionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_read_only : UInt64
    get_web_proxy : UInt64
    put_web_proxy : UInt64
    create_update_searcher : UInt64
    create_update_downloader : UInt64
    create_update_installer : UInt64
  end

  IUpdateSession_GUID = "816858a4-260d-4260-933a-2585f1abc76b"
  IID_IUpdateSession = LibC::GUID.new(0x816858a4_u32, 0x260d_u16, 0x4260_u16, StaticArray[0x93_u8, 0x3a_u8, 0x25_u8, 0x85_u8, 0xf1_u8, 0xab_u8, 0xc7_u8, 0x6b_u8])
  struct IUpdateSession
    lpVtbl : IUpdateSessionVTbl*
  end

  struct IUpdateSession2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_read_only : UInt64
    get_web_proxy : UInt64
    put_web_proxy : UInt64
    create_update_searcher : UInt64
    create_update_downloader : UInt64
    create_update_installer : UInt64
    get_user_locale : UInt64
    put_user_locale : UInt64
  end

  IUpdateSession2_GUID = "91caf7b0-eb23-49ed-9937-c52d817f46f7"
  IID_IUpdateSession2 = LibC::GUID.new(0x91caf7b0_u32, 0xeb23_u16, 0x49ed_u16, StaticArray[0x99_u8, 0x37_u8, 0xc5_u8, 0x2d_u8, 0x81_u8, 0x7f_u8, 0x46_u8, 0xf7_u8])
  struct IUpdateSession2
    lpVtbl : IUpdateSession2VTbl*
  end

  struct IUpdateSession3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    get_read_only : UInt64
    get_web_proxy : UInt64
    put_web_proxy : UInt64
    create_update_searcher : UInt64
    create_update_downloader : UInt64
    create_update_installer : UInt64
    get_user_locale : UInt64
    put_user_locale : UInt64
    create_update_service_manager : UInt64
    query_history : UInt64
  end

  IUpdateSession3_GUID = "918efd1e-b5d8-4c90-8540-aeb9bdc56f9d"
  IID_IUpdateSession3 = LibC::GUID.new(0x918efd1e_u32, 0xb5d8_u16, 0x4c90_u16, StaticArray[0x85_u8, 0x40_u8, 0xae_u8, 0xb9_u8, 0xbd_u8, 0xc5_u8, 0x6f_u8, 0x9d_u8])
  struct IUpdateSession3
    lpVtbl : IUpdateSession3VTbl*
  end

  struct IUpdateServiceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_content_validation_cert : UInt64
    get_expiration_date : UInt64
    get_is_managed : UInt64
    get_is_registered_with_au : UInt64
    get_issue_date : UInt64
    get_offers_windows_updates : UInt64
    get_redirect_urls : UInt64
    get_service_id : UInt64
    get_is_scan_package_service : UInt64
    get_can_register_with_au : UInt64
    get_service_url : UInt64
    get_setup_prefix : UInt64
  end

  IUpdateService_GUID = "76b3b17e-aed6-4da5-85f0-83587f81abe3"
  IID_IUpdateService = LibC::GUID.new(0x76b3b17e_u32, 0xaed6_u16, 0x4da5_u16, StaticArray[0x85_u8, 0xf0_u8, 0x83_u8, 0x58_u8, 0x7f_u8, 0x81_u8, 0xab_u8, 0xe3_u8])
  struct IUpdateService
    lpVtbl : IUpdateServiceVTbl*
  end

  struct IUpdateService2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_content_validation_cert : UInt64
    get_expiration_date : UInt64
    get_is_managed : UInt64
    get_is_registered_with_au : UInt64
    get_issue_date : UInt64
    get_offers_windows_updates : UInt64
    get_redirect_urls : UInt64
    get_service_id : UInt64
    get_is_scan_package_service : UInt64
    get_can_register_with_au : UInt64
    get_service_url : UInt64
    get_setup_prefix : UInt64
    get_is_default_au_service : UInt64
  end

  IUpdateService2_GUID = "1518b460-6518-4172-940f-c75883b24ceb"
  IID_IUpdateService2 = LibC::GUID.new(0x1518b460_u32, 0x6518_u16, 0x4172_u16, StaticArray[0x94_u8, 0xf_u8, 0xc7_u8, 0x58_u8, 0x83_u8, 0xb2_u8, 0x4c_u8, 0xeb_u8])
  struct IUpdateService2
    lpVtbl : IUpdateService2VTbl*
  end

  struct IUpdateServiceCollectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get__new_enum : UInt64
    get_count : UInt64
  end

  IUpdateServiceCollection_GUID = "9b0353aa-0e52-44ff-b8b0-1f7fa0437f88"
  IID_IUpdateServiceCollection = LibC::GUID.new(0x9b0353aa_u32, 0xe52_u16, 0x44ff_u16, StaticArray[0xb8_u8, 0xb0_u8, 0x1f_u8, 0x7f_u8, 0xa0_u8, 0x43_u8, 0x7f_u8, 0x88_u8])
  struct IUpdateServiceCollection
    lpVtbl : IUpdateServiceCollectionVTbl*
  end

  struct IUpdateServiceRegistrationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_registration_state : UInt64
    get_service_id : UInt64
    get_is_pending_registration_with_au : UInt64
    get_service : UInt64
  end

  IUpdateServiceRegistration_GUID = "dde02280-12b3-4e0b-937b-6747f6acb286"
  IID_IUpdateServiceRegistration = LibC::GUID.new(0xdde02280_u32, 0x12b3_u16, 0x4e0b_u16, StaticArray[0x93_u8, 0x7b_u8, 0x67_u8, 0x47_u8, 0xf6_u8, 0xac_u8, 0xb2_u8, 0x86_u8])
  struct IUpdateServiceRegistration
    lpVtbl : IUpdateServiceRegistrationVTbl*
  end

  struct IUpdateServiceManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_services : UInt64
    add_service : UInt64
    register_service_with_au : UInt64
    remove_service : UInt64
    unregister_service_with_au : UInt64
    add_scan_package_service : UInt64
    set_option : UInt64
  end

  IUpdateServiceManager_GUID = "23857e3c-02ba-44a3-9423-b1c900805f37"
  IID_IUpdateServiceManager = LibC::GUID.new(0x23857e3c_u32, 0x2ba_u16, 0x44a3_u16, StaticArray[0x94_u8, 0x23_u8, 0xb1_u8, 0xc9_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x37_u8])
  struct IUpdateServiceManager
    lpVtbl : IUpdateServiceManagerVTbl*
  end

  struct IUpdateServiceManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_services : UInt64
    add_service : UInt64
    register_service_with_au : UInt64
    remove_service : UInt64
    unregister_service_with_au : UInt64
    add_scan_package_service : UInt64
    set_option : UInt64
    get_client_application_id : UInt64
    put_client_application_id : UInt64
    query_service_registration : UInt64
    add_service2 : UInt64
  end

  IUpdateServiceManager2_GUID = "0bb8531d-7e8d-424f-986c-a0b8f60a3e7b"
  IID_IUpdateServiceManager2 = LibC::GUID.new(0xbb8531d_u32, 0x7e8d_u16, 0x424f_u16, StaticArray[0x98_u8, 0x6c_u8, 0xa0_u8, 0xb8_u8, 0xf6_u8, 0xa_u8, 0x3e_u8, 0x7b_u8])
  struct IUpdateServiceManager2
    lpVtbl : IUpdateServiceManager2VTbl*
  end

  struct IInstallationAgentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    record_installation_result : UInt64
  end

  IInstallationAgent_GUID = "925cbc18-a2ea-4648-bf1c-ec8badcfe20a"
  IID_IInstallationAgent = LibC::GUID.new(0x925cbc18_u32, 0xa2ea_u16, 0x4648_u16, StaticArray[0xbf_u8, 0x1c_u8, 0xec_u8, 0x8b_u8, 0xad_u8, 0xcf_u8, 0xe2_u8, 0xa_u8])
  struct IInstallationAgent
    lpVtbl : IInstallationAgentVTbl*
  end

end
struct LibWin32::IUpdateLockdown
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def lock_down(flags : Int32) : HRESULT
    @lpVtbl.value.lock_down.unsafe_as(Proc(Int32, HRESULT)).call(flags)
  end
end
struct LibWin32::IStringCollection
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
  def get_item(index : Int32, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(index, retval)
  end
  def put_item(index : Int32, value : UInt8*) : HRESULT
    @lpVtbl.value.put_item.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(index, value)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def add(value : UInt8*, retval : Int32*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(UInt8*, Int32*, HRESULT)).call(value, retval)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def copy(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def insert(index : Int32, value : UInt8*) : HRESULT
    @lpVtbl.value.insert.unsafe_as(Proc(Int32, UInt8*, HRESULT)).call(index, value)
  end
  def remove_at(index : Int32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
end
struct LibWin32::IWebProxy
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
  def get_address(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_address.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_address(value : UInt8*) : HRESULT
    @lpVtbl.value.put_address.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_bypass_list(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_bypass_list.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def put_bypass_list(value : IStringCollection) : HRESULT
    @lpVtbl.value.put_bypass_list.unsafe_as(Proc(IStringCollection, HRESULT)).call(value)
  end
  def get_bypass_proxy_on_local(retval : Int16*) : HRESULT
    @lpVtbl.value.get_bypass_proxy_on_local.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_bypass_proxy_on_local(value : Int16) : HRESULT
    @lpVtbl.value.put_bypass_proxy_on_local.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_user_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_user_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_user_name(value : UInt8*) : HRESULT
    @lpVtbl.value.put_user_name.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def set_password(value : UInt8*) : HRESULT
    @lpVtbl.value.set_password.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def prompt_for_credentials(parentwindow : IUnknown, title : UInt8*) : HRESULT
    @lpVtbl.value.prompt_for_credentials.unsafe_as(Proc(IUnknown, UInt8*, HRESULT)).call(parentwindow, title)
  end
  def prompt_for_credentials_from_hwnd(parentwindow : LibC::HANDLE, title : UInt8*) : HRESULT
    @lpVtbl.value.prompt_for_credentials_from_hwnd.unsafe_as(Proc(LibC::HANDLE, UInt8*, HRESULT)).call(parentwindow, title)
  end
  def get_auto_detect(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_detect.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_auto_detect(value : Int16) : HRESULT
    @lpVtbl.value.put_auto_detect.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
end
struct LibWin32::ISystemInformation
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
  def get_oem_hardware_support_link(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_oem_hardware_support_link.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsUpdateAgentInfo
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
  def get_info(varinfoidentifier : VARIANT, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(varinfoidentifier, retval)
  end
end
struct LibWin32::IAutomaticUpdatesResults
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
  def get_last_search_success_date(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_search_success_date.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_last_installation_success_date(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_last_installation_success_date.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
end
struct LibWin32::IAutomaticUpdatesSettings
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
  def get_notification_level(retval : AutomaticUpdatesNotificationLevel*) : HRESULT
    @lpVtbl.value.get_notification_level.unsafe_as(Proc(AutomaticUpdatesNotificationLevel*, HRESULT)).call(retval)
  end
  def put_notification_level(value : AutomaticUpdatesNotificationLevel) : HRESULT
    @lpVtbl.value.put_notification_level.unsafe_as(Proc(AutomaticUpdatesNotificationLevel, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_scheduled_installation_day(retval : AutomaticUpdatesScheduledInstallationDay*) : HRESULT
    @lpVtbl.value.get_scheduled_installation_day.unsafe_as(Proc(AutomaticUpdatesScheduledInstallationDay*, HRESULT)).call(retval)
  end
  def put_scheduled_installation_day(value : AutomaticUpdatesScheduledInstallationDay) : HRESULT
    @lpVtbl.value.put_scheduled_installation_day.unsafe_as(Proc(AutomaticUpdatesScheduledInstallationDay, HRESULT)).call(value)
  end
  def get_scheduled_installation_time(retval : Int32*) : HRESULT
    @lpVtbl.value.get_scheduled_installation_time.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def put_scheduled_installation_time(value : Int32) : HRESULT
    @lpVtbl.value.put_scheduled_installation_time.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAutomaticUpdatesSettings2
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
  def get_notification_level(retval : AutomaticUpdatesNotificationLevel*) : HRESULT
    @lpVtbl.value.get_notification_level.unsafe_as(Proc(AutomaticUpdatesNotificationLevel*, HRESULT)).call(retval)
  end
  def put_notification_level(value : AutomaticUpdatesNotificationLevel) : HRESULT
    @lpVtbl.value.put_notification_level.unsafe_as(Proc(AutomaticUpdatesNotificationLevel, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_scheduled_installation_day(retval : AutomaticUpdatesScheduledInstallationDay*) : HRESULT
    @lpVtbl.value.get_scheduled_installation_day.unsafe_as(Proc(AutomaticUpdatesScheduledInstallationDay*, HRESULT)).call(retval)
  end
  def put_scheduled_installation_day(value : AutomaticUpdatesScheduledInstallationDay) : HRESULT
    @lpVtbl.value.put_scheduled_installation_day.unsafe_as(Proc(AutomaticUpdatesScheduledInstallationDay, HRESULT)).call(value)
  end
  def get_scheduled_installation_time(retval : Int32*) : HRESULT
    @lpVtbl.value.get_scheduled_installation_time.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def put_scheduled_installation_time(value : Int32) : HRESULT
    @lpVtbl.value.put_scheduled_installation_time.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_include_recommended_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_include_recommended_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_include_recommended_updates(value : Int16) : HRESULT
    @lpVtbl.value.put_include_recommended_updates.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def check_permission(usertype : AutomaticUpdatesUserType, permissiontype : AutomaticUpdatesPermissionType, userhaspermission : Int16*) : HRESULT
    @lpVtbl.value.check_permission.unsafe_as(Proc(AutomaticUpdatesUserType, AutomaticUpdatesPermissionType, Int16*, HRESULT)).call(usertype, permissiontype, userhaspermission)
  end
end
struct LibWin32::IAutomaticUpdatesSettings3
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
  def get_notification_level(retval : AutomaticUpdatesNotificationLevel*) : HRESULT
    @lpVtbl.value.get_notification_level.unsafe_as(Proc(AutomaticUpdatesNotificationLevel*, HRESULT)).call(retval)
  end
  def put_notification_level(value : AutomaticUpdatesNotificationLevel) : HRESULT
    @lpVtbl.value.put_notification_level.unsafe_as(Proc(AutomaticUpdatesNotificationLevel, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_scheduled_installation_day(retval : AutomaticUpdatesScheduledInstallationDay*) : HRESULT
    @lpVtbl.value.get_scheduled_installation_day.unsafe_as(Proc(AutomaticUpdatesScheduledInstallationDay*, HRESULT)).call(retval)
  end
  def put_scheduled_installation_day(value : AutomaticUpdatesScheduledInstallationDay) : HRESULT
    @lpVtbl.value.put_scheduled_installation_day.unsafe_as(Proc(AutomaticUpdatesScheduledInstallationDay, HRESULT)).call(value)
  end
  def get_scheduled_installation_time(retval : Int32*) : HRESULT
    @lpVtbl.value.get_scheduled_installation_time.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def put_scheduled_installation_time(value : Int32) : HRESULT
    @lpVtbl.value.put_scheduled_installation_time.unsafe_as(Proc(Int32, HRESULT)).call(value)
  end
  def refresh : HRESULT
    @lpVtbl.value.refresh.unsafe_as(Proc(HRESULT)).call
  end
  def save : HRESULT
    @lpVtbl.value.save.unsafe_as(Proc(HRESULT)).call
  end
  def get_include_recommended_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_include_recommended_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_include_recommended_updates(value : Int16) : HRESULT
    @lpVtbl.value.put_include_recommended_updates.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def check_permission(usertype : AutomaticUpdatesUserType, permissiontype : AutomaticUpdatesPermissionType, userhaspermission : Int16*) : HRESULT
    @lpVtbl.value.check_permission.unsafe_as(Proc(AutomaticUpdatesUserType, AutomaticUpdatesPermissionType, Int16*, HRESULT)).call(usertype, permissiontype, userhaspermission)
  end
  def get_non_administrators_elevated(retval : Int16*) : HRESULT
    @lpVtbl.value.get_non_administrators_elevated.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_non_administrators_elevated(value : Int16) : HRESULT
    @lpVtbl.value.put_non_administrators_elevated.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_featured_updates_enabled(retval : Int16*) : HRESULT
    @lpVtbl.value.get_featured_updates_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_featured_updates_enabled(value : Int16) : HRESULT
    @lpVtbl.value.put_featured_updates_enabled.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
end
struct LibWin32::IAutomaticUpdates
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
  def detect_now : HRESULT
    @lpVtbl.value.detect_now.unsafe_as(Proc(HRESULT)).call
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def show_settings_dialog : HRESULT
    @lpVtbl.value.show_settings_dialog.unsafe_as(Proc(HRESULT)).call
  end
  def get_settings(retval : IAutomaticUpdatesSettings*) : HRESULT
    @lpVtbl.value.get_settings.unsafe_as(Proc(IAutomaticUpdatesSettings*, HRESULT)).call(retval)
  end
  def get_service_enabled(retval : Int16*) : HRESULT
    @lpVtbl.value.get_service_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def enable_service : HRESULT
    @lpVtbl.value.enable_service.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAutomaticUpdates2
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
  def detect_now : HRESULT
    @lpVtbl.value.detect_now.unsafe_as(Proc(HRESULT)).call
  end
  def pause : HRESULT
    @lpVtbl.value.pause.unsafe_as(Proc(HRESULT)).call
  end
  def resume : HRESULT
    @lpVtbl.value.resume.unsafe_as(Proc(HRESULT)).call
  end
  def show_settings_dialog : HRESULT
    @lpVtbl.value.show_settings_dialog.unsafe_as(Proc(HRESULT)).call
  end
  def get_settings(retval : IAutomaticUpdatesSettings*) : HRESULT
    @lpVtbl.value.get_settings.unsafe_as(Proc(IAutomaticUpdatesSettings*, HRESULT)).call(retval)
  end
  def get_service_enabled(retval : Int16*) : HRESULT
    @lpVtbl.value.get_service_enabled.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def enable_service : HRESULT
    @lpVtbl.value.enable_service.unsafe_as(Proc(HRESULT)).call
  end
  def get_results(retval : IAutomaticUpdatesResults*) : HRESULT
    @lpVtbl.value.get_results.unsafe_as(Proc(IAutomaticUpdatesResults*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateIdentity
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
  def get_revision_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_revision_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_update_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_update_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IImageInformation
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
  def get_alt_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_alt_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_height(retval : Int32*) : HRESULT
    @lpVtbl.value.get_height.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_source(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_width(retval : Int32*) : HRESULT
    @lpVtbl.value.get_width.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::ICategory
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
  def get_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_category_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_category_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_children(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_order(retval : Int32*) : HRESULT
    @lpVtbl.value.get_order.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_parent(retval : ICategory*) : HRESULT
    @lpVtbl.value.get_parent.unsafe_as(Proc(ICategory*, HRESULT)).call(retval)
  end
  def get_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
end
struct LibWin32::ICategoryCollection
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
  def get_item(index : Int32, retval : ICategory*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, ICategory*, HRESULT)).call(index, retval)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IInstallationBehavior
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
  def get_can_request_user_input(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_request_user_input.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_impact(retval : InstallationImpact*) : HRESULT
    @lpVtbl.value.get_impact.unsafe_as(Proc(InstallationImpact*, HRESULT)).call(retval)
  end
  def get_reboot_behavior(retval : InstallationRebootBehavior*) : HRESULT
    @lpVtbl.value.get_reboot_behavior.unsafe_as(Proc(InstallationRebootBehavior*, HRESULT)).call(retval)
  end
  def get_requires_network_connectivity(retval : Int16*) : HRESULT
    @lpVtbl.value.get_requires_network_connectivity.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateDownloadContent
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
  def get_download_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_download_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateDownloadContent2
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
  def get_download_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_download_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_is_delta_compressed_content(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_delta_compressed_content.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateDownloadContentCollection
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
  def get_item(index : Int32, retval : IUpdateDownloadContent*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IUpdateDownloadContent*, HRESULT)).call(index, retval)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdate
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsDriverUpdate
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_driver_class(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_class.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_hardware_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_hardware_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_manufacturer(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_manufacturer.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_model(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_model.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_provider(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_provider.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_ver_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_driver_ver_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_device_problem_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_problem_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_device_status(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_status.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdate2
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
end
struct LibWin32::IUpdate3
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
  def get_browse_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_browse_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdate4
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
  def get_browse_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_browse_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_per_user(retval : Int16*) : HRESULT
    @lpVtbl.value.get_per_user.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdate5
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
  def get_browse_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_browse_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_per_user(retval : Int16*) : HRESULT
    @lpVtbl.value.get_per_user.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_auto_selection(retval : AutoSelectionMode*) : HRESULT
    @lpVtbl.value.get_auto_selection.unsafe_as(Proc(AutoSelectionMode*, HRESULT)).call(retval)
  end
  def get_auto_download(retval : AutoDownloadMode*) : HRESULT
    @lpVtbl.value.get_auto_download.unsafe_as(Proc(AutoDownloadMode*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsDriverUpdate2
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_driver_class(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_class.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_hardware_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_hardware_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_manufacturer(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_manufacturer.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_model(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_model.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_provider(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_provider.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_ver_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_driver_ver_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_device_problem_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_problem_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_device_status(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_status.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
end
struct LibWin32::IWindowsDriverUpdate3
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_driver_class(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_class.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_hardware_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_hardware_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_manufacturer(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_manufacturer.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_model(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_model.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_provider(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_provider.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_ver_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_driver_ver_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_device_problem_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_problem_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_device_status(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_status.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
  def get_browse_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_browse_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsDriverUpdateEntry
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
  def get_driver_class(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_class.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_hardware_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_hardware_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_manufacturer(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_manufacturer.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_model(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_model.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_provider(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_provider.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_ver_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_driver_ver_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_device_problem_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_problem_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_device_status(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_status.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsDriverUpdateEntryCollection
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
  def get_item(index : Int32, retval : IWindowsDriverUpdateEntry*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IWindowsDriverUpdateEntry*, HRESULT)).call(index, retval)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsDriverUpdate4
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_driver_class(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_class.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_hardware_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_hardware_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_manufacturer(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_manufacturer.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_model(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_model.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_provider(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_provider.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_ver_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_driver_ver_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_device_problem_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_problem_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_device_status(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_status.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
  def get_browse_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_browse_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_windows_driver_update_entries(retval : IWindowsDriverUpdateEntryCollection*) : HRESULT
    @lpVtbl.value.get_windows_driver_update_entries.unsafe_as(Proc(IWindowsDriverUpdateEntryCollection*, HRESULT)).call(retval)
  end
  def get_per_user(retval : Int16*) : HRESULT
    @lpVtbl.value.get_per_user.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IWindowsDriverUpdate5
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
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_auto_select_on_web_sites(retval : Int16*) : HRESULT
    @lpVtbl.value.get_auto_select_on_web_sites.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_bundled_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_bundled_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_can_require_source(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_require_source.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_deadline(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_deadline.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_available(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_available.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_delta_compressed_content_preferred(retval : Int16*) : HRESULT
    @lpVtbl.value.get_delta_compressed_content_preferred.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_eula_accepted(retval : Int16*) : HRESULT
    @lpVtbl.value.get_eula_accepted.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_eula_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_eula_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_handler_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_handler_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_image(retval : IImageInformation*) : HRESULT
    @lpVtbl.value.get_image.unsafe_as(Proc(IImageInformation*, HRESULT)).call(retval)
  end
  def get_installation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_installation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_is_beta(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_beta.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_downloaded(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_downloaded.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_hidden(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_hidden.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_hidden(value : Int16) : HRESULT
    @lpVtbl.value.put_is_hidden.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_is_installed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_installed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_mandatory(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_mandatory.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_uninstallable(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_uninstallable.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_languages(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_languages.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_last_deployment_change_time(retval : Float64*) : HRESULT
    @lpVtbl.value.get_last_deployment_change_time.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_max_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_max_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_min_download_size(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_min_download_size.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_more_info_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_more_info_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_msrc_severity(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_msrc_severity.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_recommended_cpu_speed(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_cpu_speed.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_hard_disk_space(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_hard_disk_space.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_recommended_memory(retval : Int32*) : HRESULT
    @lpVtbl.value.get_recommended_memory.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_release_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_release_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_security_bulletin_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_security_bulletin_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_superseded_update_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_superseded_update_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_type(retval : UpdateType*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(UpdateType*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_behavior(retval : IInstallationBehavior*) : HRESULT
    @lpVtbl.value.get_uninstallation_behavior.unsafe_as(Proc(IInstallationBehavior*, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_kb_article_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_kb_article_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def accept_eula : HRESULT
    @lpVtbl.value.accept_eula.unsafe_as(Proc(HRESULT)).call
  end
  def get_deployment_action(retval : DeploymentAction*) : HRESULT
    @lpVtbl.value.get_deployment_action.unsafe_as(Proc(DeploymentAction*, HRESULT)).call(retval)
  end
  def copy_from_cache(path : UInt8*, toextractcabfiles : Int16) : HRESULT
    @lpVtbl.value.copy_from_cache.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(path, toextractcabfiles)
  end
  def get_download_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_download_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def get_download_contents(retval : IUpdateDownloadContentCollection*) : HRESULT
    @lpVtbl.value.get_download_contents.unsafe_as(Proc(IUpdateDownloadContentCollection*, HRESULT)).call(retval)
  end
  def get_driver_class(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_class.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_hardware_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_hardware_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_manufacturer(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_manufacturer.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_model(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_model.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_provider(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_driver_provider.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_driver_ver_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_driver_ver_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_device_problem_number(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_problem_number.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_device_status(retval : Int32*) : HRESULT
    @lpVtbl.value.get_device_status.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_present(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_present.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_cve_i_ds(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_cve_i_ds.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def copy_to_cache(pfiles : IStringCollection) : HRESULT
    @lpVtbl.value.copy_to_cache.unsafe_as(Proc(IStringCollection, HRESULT)).call(pfiles)
  end
  def get_browse_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_browse_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_windows_driver_update_entries(retval : IWindowsDriverUpdateEntryCollection*) : HRESULT
    @lpVtbl.value.get_windows_driver_update_entries.unsafe_as(Proc(IWindowsDriverUpdateEntryCollection*, HRESULT)).call(retval)
  end
  def get_per_user(retval : Int16*) : HRESULT
    @lpVtbl.value.get_per_user.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_auto_selection(retval : AutoSelectionMode*) : HRESULT
    @lpVtbl.value.get_auto_selection.unsafe_as(Proc(AutoSelectionMode*, HRESULT)).call(retval)
  end
  def get_auto_download(retval : AutoDownloadMode*) : HRESULT
    @lpVtbl.value.get_auto_download.unsafe_as(Proc(AutoDownloadMode*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateCollection
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
  def get_item(index : Int32, retval : IUpdate*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IUpdate*, HRESULT)).call(index, retval)
  end
  def put_item(index : Int32, value : IUpdate) : HRESULT
    @lpVtbl.value.put_item.unsafe_as(Proc(Int32, IUpdate, HRESULT)).call(index, value)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def add(value : IUpdate, retval : Int32*) : HRESULT
    @lpVtbl.value.add.unsafe_as(Proc(IUpdate, Int32*, HRESULT)).call(value, retval)
  end
  def clear : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(HRESULT)).call
  end
  def copy(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.copy.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def insert(index : Int32, value : IUpdate) : HRESULT
    @lpVtbl.value.insert.unsafe_as(Proc(Int32, IUpdate, HRESULT)).call(index, value)
  end
  def remove_at(index : Int32) : HRESULT
    @lpVtbl.value.remove_at.unsafe_as(Proc(Int32, HRESULT)).call(index)
  end
end
struct LibWin32::IUpdateException
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
  def get_message(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_context(retval : UpdateExceptionContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(UpdateExceptionContext*, HRESULT)).call(retval)
  end
end
struct LibWin32::IInvalidProductLicenseException
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
  def get_message(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_message.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_context(retval : UpdateExceptionContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(UpdateExceptionContext*, HRESULT)).call(retval)
  end
  def get_product(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_product.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateExceptionCollection
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
  def get_item(index : Int32, retval : IUpdateException*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IUpdateException*, HRESULT)).call(index, retval)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::ISearchResult
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
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
  def get_root_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_root_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def get_warnings(retval : IUpdateExceptionCollection*) : HRESULT
    @lpVtbl.value.get_warnings.unsafe_as(Proc(IUpdateExceptionCollection*, HRESULT)).call(retval)
  end
end
struct LibWin32::ISearchJob
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
  def get_async_state(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_async_state.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_is_completed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_completed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def clean_up : HRESULT
    @lpVtbl.value.clean_up.unsafe_as(Proc(HRESULT)).call
  end
  def request_abort : HRESULT
    @lpVtbl.value.request_abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISearchCompletedCallbackArgs
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
struct LibWin32::ISearchCompletedCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke(searchjob : ISearchJob, callbackargs : ISearchCompletedCallbackArgs) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(ISearchJob, ISearchCompletedCallbackArgs, HRESULT)).call(searchjob, callbackargs)
  end
end
struct LibWin32::IUpdateHistoryEntry
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
  def get_operation(retval : UpdateOperation*) : HRESULT
    @lpVtbl.value.get_operation.unsafe_as(Proc(UpdateOperation*, HRESULT)).call(retval)
  end
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_update_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_update_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_unmapped_result_code(retval : Int32*) : HRESULT
    @lpVtbl.value.get_unmapped_result_code.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_server_selection(retval : ServerSelection*) : HRESULT
    @lpVtbl.value.get_server_selection.unsafe_as(Proc(ServerSelection*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateHistoryEntry2
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
  def get_operation(retval : UpdateOperation*) : HRESULT
    @lpVtbl.value.get_operation.unsafe_as(Proc(UpdateOperation*, HRESULT)).call(retval)
  end
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_update_identity(retval : IUpdateIdentity*) : HRESULT
    @lpVtbl.value.get_update_identity.unsafe_as(Proc(IUpdateIdentity*, HRESULT)).call(retval)
  end
  def get_title(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_title.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_unmapped_result_code(retval : Int32*) : HRESULT
    @lpVtbl.value.get_unmapped_result_code.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_server_selection(retval : ServerSelection*) : HRESULT
    @lpVtbl.value.get_server_selection.unsafe_as(Proc(ServerSelection*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_uninstallation_steps(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_uninstallation_steps.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_uninstallation_notes(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_uninstallation_notes.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_support_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_support_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_categories(retval : ICategoryCollection*) : HRESULT
    @lpVtbl.value.get_categories.unsafe_as(Proc(ICategoryCollection*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateHistoryEntryCollection
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
  def get_item(index : Int32, retval : IUpdateHistoryEntry*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IUpdateHistoryEntry*, HRESULT)).call(index, retval)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateSearcher
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
  def get_can_automatically_upgrade_service(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_automatically_upgrade_service.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_can_automatically_upgrade_service(value : Int16) : HRESULT
    @lpVtbl.value.put_can_automatically_upgrade_service.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_include_potentially_superseded_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_include_potentially_superseded_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_include_potentially_superseded_updates(value : Int16) : HRESULT
    @lpVtbl.value.put_include_potentially_superseded_updates.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_server_selection(retval : ServerSelection*) : HRESULT
    @lpVtbl.value.get_server_selection.unsafe_as(Proc(ServerSelection*, HRESULT)).call(retval)
  end
  def put_server_selection(value : ServerSelection) : HRESULT
    @lpVtbl.value.put_server_selection.unsafe_as(Proc(ServerSelection, HRESULT)).call(value)
  end
  def begin_search(criteria : UInt8*, oncompleted : IUnknown, state : VARIANT, retval : ISearchJob*) : HRESULT
    @lpVtbl.value.begin_search.unsafe_as(Proc(UInt8*, IUnknown, VARIANT, ISearchJob*, HRESULT)).call(criteria, oncompleted, state, retval)
  end
  def end_search(searchjob : ISearchJob, retval : ISearchResult*) : HRESULT
    @lpVtbl.value.end_search.unsafe_as(Proc(ISearchJob, ISearchResult*, HRESULT)).call(searchjob, retval)
  end
  def escape_string(unescaped : UInt8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.escape_string.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(unescaped, retval)
  end
  def query_history(startindex : Int32, count : Int32, retval : IUpdateHistoryEntryCollection*) : HRESULT
    @lpVtbl.value.query_history.unsafe_as(Proc(Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)).call(startindex, count, retval)
  end
  def search(criteria : UInt8*, retval : ISearchResult*) : HRESULT
    @lpVtbl.value.search.unsafe_as(Proc(UInt8*, ISearchResult*, HRESULT)).call(criteria, retval)
  end
  def get_online(retval : Int16*) : HRESULT
    @lpVtbl.value.get_online.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_online(value : Int16) : HRESULT
    @lpVtbl.value.put_online.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_total_history_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_total_history_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_service_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_service_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
end
struct LibWin32::IUpdateSearcher2
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
  def get_can_automatically_upgrade_service(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_automatically_upgrade_service.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_can_automatically_upgrade_service(value : Int16) : HRESULT
    @lpVtbl.value.put_can_automatically_upgrade_service.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_include_potentially_superseded_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_include_potentially_superseded_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_include_potentially_superseded_updates(value : Int16) : HRESULT
    @lpVtbl.value.put_include_potentially_superseded_updates.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_server_selection(retval : ServerSelection*) : HRESULT
    @lpVtbl.value.get_server_selection.unsafe_as(Proc(ServerSelection*, HRESULT)).call(retval)
  end
  def put_server_selection(value : ServerSelection) : HRESULT
    @lpVtbl.value.put_server_selection.unsafe_as(Proc(ServerSelection, HRESULT)).call(value)
  end
  def begin_search(criteria : UInt8*, oncompleted : IUnknown, state : VARIANT, retval : ISearchJob*) : HRESULT
    @lpVtbl.value.begin_search.unsafe_as(Proc(UInt8*, IUnknown, VARIANT, ISearchJob*, HRESULT)).call(criteria, oncompleted, state, retval)
  end
  def end_search(searchjob : ISearchJob, retval : ISearchResult*) : HRESULT
    @lpVtbl.value.end_search.unsafe_as(Proc(ISearchJob, ISearchResult*, HRESULT)).call(searchjob, retval)
  end
  def escape_string(unescaped : UInt8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.escape_string.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(unescaped, retval)
  end
  def query_history(startindex : Int32, count : Int32, retval : IUpdateHistoryEntryCollection*) : HRESULT
    @lpVtbl.value.query_history.unsafe_as(Proc(Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)).call(startindex, count, retval)
  end
  def search(criteria : UInt8*, retval : ISearchResult*) : HRESULT
    @lpVtbl.value.search.unsafe_as(Proc(UInt8*, ISearchResult*, HRESULT)).call(criteria, retval)
  end
  def get_online(retval : Int16*) : HRESULT
    @lpVtbl.value.get_online.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_online(value : Int16) : HRESULT
    @lpVtbl.value.put_online.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_total_history_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_total_history_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_service_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_service_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_ignore_download_priority(retval : Int16*) : HRESULT
    @lpVtbl.value.get_ignore_download_priority.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_ignore_download_priority(value : Int16) : HRESULT
    @lpVtbl.value.put_ignore_download_priority.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
end
struct LibWin32::IUpdateSearcher3
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
  def get_can_automatically_upgrade_service(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_automatically_upgrade_service.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_can_automatically_upgrade_service(value : Int16) : HRESULT
    @lpVtbl.value.put_can_automatically_upgrade_service.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_include_potentially_superseded_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_include_potentially_superseded_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_include_potentially_superseded_updates(value : Int16) : HRESULT
    @lpVtbl.value.put_include_potentially_superseded_updates.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_server_selection(retval : ServerSelection*) : HRESULT
    @lpVtbl.value.get_server_selection.unsafe_as(Proc(ServerSelection*, HRESULT)).call(retval)
  end
  def put_server_selection(value : ServerSelection) : HRESULT
    @lpVtbl.value.put_server_selection.unsafe_as(Proc(ServerSelection, HRESULT)).call(value)
  end
  def begin_search(criteria : UInt8*, oncompleted : IUnknown, state : VARIANT, retval : ISearchJob*) : HRESULT
    @lpVtbl.value.begin_search.unsafe_as(Proc(UInt8*, IUnknown, VARIANT, ISearchJob*, HRESULT)).call(criteria, oncompleted, state, retval)
  end
  def end_search(searchjob : ISearchJob, retval : ISearchResult*) : HRESULT
    @lpVtbl.value.end_search.unsafe_as(Proc(ISearchJob, ISearchResult*, HRESULT)).call(searchjob, retval)
  end
  def escape_string(unescaped : UInt8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.escape_string.unsafe_as(Proc(UInt8*, UInt8**, HRESULT)).call(unescaped, retval)
  end
  def query_history(startindex : Int32, count : Int32, retval : IUpdateHistoryEntryCollection*) : HRESULT
    @lpVtbl.value.query_history.unsafe_as(Proc(Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)).call(startindex, count, retval)
  end
  def search(criteria : UInt8*, retval : ISearchResult*) : HRESULT
    @lpVtbl.value.search.unsafe_as(Proc(UInt8*, ISearchResult*, HRESULT)).call(criteria, retval)
  end
  def get_online(retval : Int16*) : HRESULT
    @lpVtbl.value.get_online.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_online(value : Int16) : HRESULT
    @lpVtbl.value.put_online.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_total_history_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_total_history_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_service_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_service_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_ignore_download_priority(retval : Int16*) : HRESULT
    @lpVtbl.value.get_ignore_download_priority.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_ignore_download_priority(value : Int16) : HRESULT
    @lpVtbl.value.put_ignore_download_priority.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_search_scope(retval : SearchScope*) : HRESULT
    @lpVtbl.value.get_search_scope.unsafe_as(Proc(SearchScope*, HRESULT)).call(retval)
  end
  def put_search_scope(value : SearchScope) : HRESULT
    @lpVtbl.value.put_search_scope.unsafe_as(Proc(SearchScope, HRESULT)).call(value)
  end
end
struct LibWin32::IUpdateDownloadResult
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
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
end
struct LibWin32::IDownloadResult
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
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
  def get_update_result(updateindex : Int32, retval : IUpdateDownloadResult*) : HRESULT
    @lpVtbl.value.get_update_result.unsafe_as(Proc(Int32, IUpdateDownloadResult*, HRESULT)).call(updateindex, retval)
  end
end
struct LibWin32::IDownloadProgress
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
  def get_current_update_bytes_downloaded(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_current_update_bytes_downloaded.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_current_update_bytes_to_download(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_current_update_bytes_to_download.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_current_update_index(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_update_index.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_percent_complete(retval : Int32*) : HRESULT
    @lpVtbl.value.get_percent_complete.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_total_bytes_downloaded(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_total_bytes_downloaded.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_total_bytes_to_download(retval : DECIMAL*) : HRESULT
    @lpVtbl.value.get_total_bytes_to_download.unsafe_as(Proc(DECIMAL*, HRESULT)).call(retval)
  end
  def get_update_result(updateindex : Int32, retval : IUpdateDownloadResult*) : HRESULT
    @lpVtbl.value.get_update_result.unsafe_as(Proc(Int32, IUpdateDownloadResult*, HRESULT)).call(updateindex, retval)
  end
  def get_current_update_download_phase(retval : DownloadPhase*) : HRESULT
    @lpVtbl.value.get_current_update_download_phase.unsafe_as(Proc(DownloadPhase*, HRESULT)).call(retval)
  end
  def get_current_update_percent_complete(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_update_percent_complete.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IDownloadJob
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
  def get_async_state(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_async_state.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_is_completed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_completed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def clean_up : HRESULT
    @lpVtbl.value.clean_up.unsafe_as(Proc(HRESULT)).call
  end
  def get_progress(retval : IDownloadProgress*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(IDownloadProgress*, HRESULT)).call(retval)
  end
  def request_abort : HRESULT
    @lpVtbl.value.request_abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IDownloadCompletedCallbackArgs
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
struct LibWin32::IDownloadCompletedCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke(downloadjob : IDownloadJob, callbackargs : IDownloadCompletedCallbackArgs) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(IDownloadJob, IDownloadCompletedCallbackArgs, HRESULT)).call(downloadjob, callbackargs)
  end
end
struct LibWin32::IDownloadProgressChangedCallbackArgs
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
  def get_progress(retval : IDownloadProgress*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(IDownloadProgress*, HRESULT)).call(retval)
  end
end
struct LibWin32::IDownloadProgressChangedCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke(downloadjob : IDownloadJob, callbackargs : IDownloadProgressChangedCallbackArgs) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(IDownloadJob, IDownloadProgressChangedCallbackArgs, HRESULT)).call(downloadjob, callbackargs)
  end
end
struct LibWin32::IUpdateDownloader
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_is_forced(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_forced.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_forced(value : Int16) : HRESULT
    @lpVtbl.value.put_is_forced.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_priority(retval : DownloadPriority*) : HRESULT
    @lpVtbl.value.get_priority.unsafe_as(Proc(DownloadPriority*, HRESULT)).call(retval)
  end
  def put_priority(value : DownloadPriority) : HRESULT
    @lpVtbl.value.put_priority.unsafe_as(Proc(DownloadPriority, HRESULT)).call(value)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def put_updates(value : IUpdateCollection) : HRESULT
    @lpVtbl.value.put_updates.unsafe_as(Proc(IUpdateCollection, HRESULT)).call(value)
  end
  def begin_download(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IDownloadJob*) : HRESULT
    @lpVtbl.value.begin_download.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IDownloadJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def download(retval : IDownloadResult*) : HRESULT
    @lpVtbl.value.download.unsafe_as(Proc(IDownloadResult*, HRESULT)).call(retval)
  end
  def end_download(value : IDownloadJob, retval : IDownloadResult*) : HRESULT
    @lpVtbl.value.end_download.unsafe_as(Proc(IDownloadJob, IDownloadResult*, HRESULT)).call(value, retval)
  end
end
struct LibWin32::IUpdateInstallationResult
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
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
end
struct LibWin32::IInstallationResult
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
  def get_h_result(retval : Int32*) : HRESULT
    @lpVtbl.value.get_h_result.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_reboot_required(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_result_code(retval : OperationResultCode*) : HRESULT
    @lpVtbl.value.get_result_code.unsafe_as(Proc(OperationResultCode*, HRESULT)).call(retval)
  end
  def get_update_result(updateindex : Int32, retval : IUpdateInstallationResult*) : HRESULT
    @lpVtbl.value.get_update_result.unsafe_as(Proc(Int32, IUpdateInstallationResult*, HRESULT)).call(updateindex, retval)
  end
end
struct LibWin32::IInstallationProgress
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
  def get_current_update_index(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_update_index.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_update_percent_complete(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_update_percent_complete.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_percent_complete(retval : Int32*) : HRESULT
    @lpVtbl.value.get_percent_complete.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_update_result(updateindex : Int32, retval : IUpdateInstallationResult*) : HRESULT
    @lpVtbl.value.get_update_result.unsafe_as(Proc(Int32, IUpdateInstallationResult*, HRESULT)).call(updateindex, retval)
  end
end
struct LibWin32::IInstallationJob
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
  def get_async_state(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_async_state.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_is_completed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_completed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def clean_up : HRESULT
    @lpVtbl.value.clean_up.unsafe_as(Proc(HRESULT)).call
  end
  def get_progress(retval : IInstallationProgress*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(IInstallationProgress*, HRESULT)).call(retval)
  end
  def request_abort : HRESULT
    @lpVtbl.value.request_abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInstallationCompletedCallbackArgs
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
struct LibWin32::IInstallationCompletedCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke(installationjob : IInstallationJob, callbackargs : IInstallationCompletedCallbackArgs) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(IInstallationJob, IInstallationCompletedCallbackArgs, HRESULT)).call(installationjob, callbackargs)
  end
end
struct LibWin32::IInstallationProgressChangedCallbackArgs
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
  def get_progress(retval : IInstallationProgress*) : HRESULT
    @lpVtbl.value.get_progress.unsafe_as(Proc(IInstallationProgress*, HRESULT)).call(retval)
  end
end
struct LibWin32::IInstallationProgressChangedCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke(installationjob : IInstallationJob, callbackargs : IInstallationProgressChangedCallbackArgs) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(IInstallationJob, IInstallationProgressChangedCallbackArgs, HRESULT)).call(installationjob, callbackargs)
  end
end
struct LibWin32::IUpdateInstaller
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_is_forced(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_forced.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_forced(value : Int16) : HRESULT
    @lpVtbl.value.put_is_forced.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_parent_hwnd(retval : HANDLE*) : HRESULT
    @lpVtbl.value.get_parent_hwnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(retval)
  end
  def put_parent_hwnd(value : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_parent_hwnd.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(value)
  end
  def put_parent_window(value : IUnknown) : HRESULT
    @lpVtbl.value.put_parent_window.unsafe_as(Proc(IUnknown, HRESULT)).call(value)
  end
  def get_parent_window(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get_parent_window.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def put_updates(value : IUpdateCollection) : HRESULT
    @lpVtbl.value.put_updates.unsafe_as(Proc(IUpdateCollection, HRESULT)).call(value)
  end
  def begin_install(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_install.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def begin_uninstall(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_uninstall.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def end_install(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_install.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def end_uninstall(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_uninstall.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def install(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.install.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def run_wizard(dialogtitle : UInt8*, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.run_wizard.unsafe_as(Proc(UInt8*, IInstallationResult*, HRESULT)).call(dialogtitle, retval)
  end
  def get_is_busy(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_busy.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def uninstall(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.uninstall.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def get_allow_source_prompts(retval : Int16*) : HRESULT
    @lpVtbl.value.get_allow_source_prompts.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_allow_source_prompts(value : Int16) : HRESULT
    @lpVtbl.value.put_allow_source_prompts.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_reboot_required_before_installation(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required_before_installation.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateInstaller2
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_is_forced(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_forced.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_forced(value : Int16) : HRESULT
    @lpVtbl.value.put_is_forced.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_parent_hwnd(retval : HANDLE*) : HRESULT
    @lpVtbl.value.get_parent_hwnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(retval)
  end
  def put_parent_hwnd(value : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_parent_hwnd.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(value)
  end
  def put_parent_window(value : IUnknown) : HRESULT
    @lpVtbl.value.put_parent_window.unsafe_as(Proc(IUnknown, HRESULT)).call(value)
  end
  def get_parent_window(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get_parent_window.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def put_updates(value : IUpdateCollection) : HRESULT
    @lpVtbl.value.put_updates.unsafe_as(Proc(IUpdateCollection, HRESULT)).call(value)
  end
  def begin_install(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_install.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def begin_uninstall(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_uninstall.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def end_install(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_install.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def end_uninstall(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_uninstall.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def install(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.install.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def run_wizard(dialogtitle : UInt8*, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.run_wizard.unsafe_as(Proc(UInt8*, IInstallationResult*, HRESULT)).call(dialogtitle, retval)
  end
  def get_is_busy(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_busy.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def uninstall(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.uninstall.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def get_allow_source_prompts(retval : Int16*) : HRESULT
    @lpVtbl.value.get_allow_source_prompts.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_allow_source_prompts(value : Int16) : HRESULT
    @lpVtbl.value.put_allow_source_prompts.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_reboot_required_before_installation(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required_before_installation.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_force_quiet(retval : Int16*) : HRESULT
    @lpVtbl.value.get_force_quiet.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_force_quiet(value : Int16) : HRESULT
    @lpVtbl.value.put_force_quiet.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
end
struct LibWin32::IUpdateInstaller3
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_is_forced(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_forced.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_forced(value : Int16) : HRESULT
    @lpVtbl.value.put_is_forced.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_parent_hwnd(retval : HANDLE*) : HRESULT
    @lpVtbl.value.get_parent_hwnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(retval)
  end
  def put_parent_hwnd(value : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_parent_hwnd.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(value)
  end
  def put_parent_window(value : IUnknown) : HRESULT
    @lpVtbl.value.put_parent_window.unsafe_as(Proc(IUnknown, HRESULT)).call(value)
  end
  def get_parent_window(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get_parent_window.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def put_updates(value : IUpdateCollection) : HRESULT
    @lpVtbl.value.put_updates.unsafe_as(Proc(IUpdateCollection, HRESULT)).call(value)
  end
  def begin_install(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_install.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def begin_uninstall(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_uninstall.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def end_install(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_install.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def end_uninstall(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_uninstall.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def install(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.install.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def run_wizard(dialogtitle : UInt8*, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.run_wizard.unsafe_as(Proc(UInt8*, IInstallationResult*, HRESULT)).call(dialogtitle, retval)
  end
  def get_is_busy(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_busy.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def uninstall(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.uninstall.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def get_allow_source_prompts(retval : Int16*) : HRESULT
    @lpVtbl.value.get_allow_source_prompts.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_allow_source_prompts(value : Int16) : HRESULT
    @lpVtbl.value.put_allow_source_prompts.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_reboot_required_before_installation(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required_before_installation.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_force_quiet(retval : Int16*) : HRESULT
    @lpVtbl.value.get_force_quiet.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_force_quiet(value : Int16) : HRESULT
    @lpVtbl.value.put_force_quiet.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_attempt_close_apps_if_necessary(retval : Int16*) : HRESULT
    @lpVtbl.value.get_attempt_close_apps_if_necessary.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_attempt_close_apps_if_necessary(value : Int16) : HRESULT
    @lpVtbl.value.put_attempt_close_apps_if_necessary.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
end
struct LibWin32::IUpdateInstaller4
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_is_forced(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_forced.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_is_forced(value : Int16) : HRESULT
    @lpVtbl.value.put_is_forced.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_parent_hwnd(retval : HANDLE*) : HRESULT
    @lpVtbl.value.get_parent_hwnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(retval)
  end
  def put_parent_hwnd(value : LibC::HANDLE) : HRESULT
    @lpVtbl.value.put_parent_hwnd.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(value)
  end
  def put_parent_window(value : IUnknown) : HRESULT
    @lpVtbl.value.put_parent_window.unsafe_as(Proc(IUnknown, HRESULT)).call(value)
  end
  def get_parent_window(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get_parent_window.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_updates(retval : IUpdateCollection*) : HRESULT
    @lpVtbl.value.get_updates.unsafe_as(Proc(IUpdateCollection*, HRESULT)).call(retval)
  end
  def put_updates(value : IUpdateCollection) : HRESULT
    @lpVtbl.value.put_updates.unsafe_as(Proc(IUpdateCollection, HRESULT)).call(value)
  end
  def begin_install(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_install.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def begin_uninstall(onprogresschanged : IUnknown, oncompleted : IUnknown, state : VARIANT, retval : IInstallationJob*) : HRESULT
    @lpVtbl.value.begin_uninstall.unsafe_as(Proc(IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)).call(onprogresschanged, oncompleted, state, retval)
  end
  def end_install(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_install.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def end_uninstall(value : IInstallationJob, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.end_uninstall.unsafe_as(Proc(IInstallationJob, IInstallationResult*, HRESULT)).call(value, retval)
  end
  def install(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.install.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def run_wizard(dialogtitle : UInt8*, retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.run_wizard.unsafe_as(Proc(UInt8*, IInstallationResult*, HRESULT)).call(dialogtitle, retval)
  end
  def get_is_busy(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_busy.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def uninstall(retval : IInstallationResult*) : HRESULT
    @lpVtbl.value.uninstall.unsafe_as(Proc(IInstallationResult*, HRESULT)).call(retval)
  end
  def get_allow_source_prompts(retval : Int16*) : HRESULT
    @lpVtbl.value.get_allow_source_prompts.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_allow_source_prompts(value : Int16) : HRESULT
    @lpVtbl.value.put_allow_source_prompts.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_reboot_required_before_installation(retval : Int16*) : HRESULT
    @lpVtbl.value.get_reboot_required_before_installation.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_force_quiet(retval : Int16*) : HRESULT
    @lpVtbl.value.get_force_quiet.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_force_quiet(value : Int16) : HRESULT
    @lpVtbl.value.put_force_quiet.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def get_attempt_close_apps_if_necessary(retval : Int16*) : HRESULT
    @lpVtbl.value.get_attempt_close_apps_if_necessary.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def put_attempt_close_apps_if_necessary(value : Int16) : HRESULT
    @lpVtbl.value.put_attempt_close_apps_if_necessary.unsafe_as(Proc(Int16, HRESULT)).call(value)
  end
  def commit(dwflags : UInt32) : HRESULT
    @lpVtbl.value.commit.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
end
struct LibWin32::IUpdateSession
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_web_proxy(retval : IWebProxy*) : HRESULT
    @lpVtbl.value.get_web_proxy.unsafe_as(Proc(IWebProxy*, HRESULT)).call(retval)
  end
  def put_web_proxy(value : IWebProxy) : HRESULT
    @lpVtbl.value.put_web_proxy.unsafe_as(Proc(IWebProxy, HRESULT)).call(value)
  end
  def create_update_searcher(retval : IUpdateSearcher*) : HRESULT
    @lpVtbl.value.create_update_searcher.unsafe_as(Proc(IUpdateSearcher*, HRESULT)).call(retval)
  end
  def create_update_downloader(retval : IUpdateDownloader*) : HRESULT
    @lpVtbl.value.create_update_downloader.unsafe_as(Proc(IUpdateDownloader*, HRESULT)).call(retval)
  end
  def create_update_installer(retval : IUpdateInstaller*) : HRESULT
    @lpVtbl.value.create_update_installer.unsafe_as(Proc(IUpdateInstaller*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateSession2
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_web_proxy(retval : IWebProxy*) : HRESULT
    @lpVtbl.value.get_web_proxy.unsafe_as(Proc(IWebProxy*, HRESULT)).call(retval)
  end
  def put_web_proxy(value : IWebProxy) : HRESULT
    @lpVtbl.value.put_web_proxy.unsafe_as(Proc(IWebProxy, HRESULT)).call(value)
  end
  def create_update_searcher(retval : IUpdateSearcher*) : HRESULT
    @lpVtbl.value.create_update_searcher.unsafe_as(Proc(IUpdateSearcher*, HRESULT)).call(retval)
  end
  def create_update_downloader(retval : IUpdateDownloader*) : HRESULT
    @lpVtbl.value.create_update_downloader.unsafe_as(Proc(IUpdateDownloader*, HRESULT)).call(retval)
  end
  def create_update_installer(retval : IUpdateInstaller*) : HRESULT
    @lpVtbl.value.create_update_installer.unsafe_as(Proc(IUpdateInstaller*, HRESULT)).call(retval)
  end
  def get_user_locale(retval : UInt32*) : HRESULT
    @lpVtbl.value.get_user_locale.unsafe_as(Proc(UInt32*, HRESULT)).call(retval)
  end
  def put_user_locale(lcid : UInt32) : HRESULT
    @lpVtbl.value.put_user_locale.unsafe_as(Proc(UInt32, HRESULT)).call(lcid)
  end
end
struct LibWin32::IUpdateSession3
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
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def get_read_only(retval : Int16*) : HRESULT
    @lpVtbl.value.get_read_only.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_web_proxy(retval : IWebProxy*) : HRESULT
    @lpVtbl.value.get_web_proxy.unsafe_as(Proc(IWebProxy*, HRESULT)).call(retval)
  end
  def put_web_proxy(value : IWebProxy) : HRESULT
    @lpVtbl.value.put_web_proxy.unsafe_as(Proc(IWebProxy, HRESULT)).call(value)
  end
  def create_update_searcher(retval : IUpdateSearcher*) : HRESULT
    @lpVtbl.value.create_update_searcher.unsafe_as(Proc(IUpdateSearcher*, HRESULT)).call(retval)
  end
  def create_update_downloader(retval : IUpdateDownloader*) : HRESULT
    @lpVtbl.value.create_update_downloader.unsafe_as(Proc(IUpdateDownloader*, HRESULT)).call(retval)
  end
  def create_update_installer(retval : IUpdateInstaller*) : HRESULT
    @lpVtbl.value.create_update_installer.unsafe_as(Proc(IUpdateInstaller*, HRESULT)).call(retval)
  end
  def get_user_locale(retval : UInt32*) : HRESULT
    @lpVtbl.value.get_user_locale.unsafe_as(Proc(UInt32*, HRESULT)).call(retval)
  end
  def put_user_locale(lcid : UInt32) : HRESULT
    @lpVtbl.value.put_user_locale.unsafe_as(Proc(UInt32, HRESULT)).call(lcid)
  end
  def create_update_service_manager(retval : IUpdateServiceManager2*) : HRESULT
    @lpVtbl.value.create_update_service_manager.unsafe_as(Proc(IUpdateServiceManager2*, HRESULT)).call(retval)
  end
  def query_history(criteria : UInt8*, startindex : Int32, count : Int32, retval : IUpdateHistoryEntryCollection*) : HRESULT
    @lpVtbl.value.query_history.unsafe_as(Proc(UInt8*, Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)).call(criteria, startindex, count, retval)
  end
end
struct LibWin32::IUpdateService
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
  def get_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_content_validation_cert(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_content_validation_cert.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_expiration_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_expiration_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_is_managed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_managed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_registered_with_au(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_registered_with_au.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_issue_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_issue_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_offers_windows_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_offers_windows_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_redirect_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_redirect_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_is_scan_package_service(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_scan_package_service.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_can_register_with_au(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_register_with_au.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_service_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_setup_prefix(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_setup_prefix.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateService2
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
  def get_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_content_validation_cert(retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_content_validation_cert.unsafe_as(Proc(VARIANT*, HRESULT)).call(retval)
  end
  def get_expiration_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_expiration_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_is_managed(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_managed.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_is_registered_with_au(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_registered_with_au.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_issue_date(retval : Float64*) : HRESULT
    @lpVtbl.value.get_issue_date.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_offers_windows_updates(retval : Int16*) : HRESULT
    @lpVtbl.value.get_offers_windows_updates.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_redirect_urls(retval : IStringCollection*) : HRESULT
    @lpVtbl.value.get_redirect_urls.unsafe_as(Proc(IStringCollection*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_is_scan_package_service(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_scan_package_service.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_can_register_with_au(retval : Int16*) : HRESULT
    @lpVtbl.value.get_can_register_with_au.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_service_url(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_url.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_setup_prefix(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_setup_prefix.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_is_default_au_service(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_default_au_service.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateServiceCollection
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
  def get_item(index : Int32, retval : IUpdateService*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IUpdateService*, HRESULT)).call(index, retval)
  end
  def get__new_enum(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get__new_enum.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
  def get_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateServiceRegistration
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
  def get_registration_state(retval : UpdateServiceRegistrationState*) : HRESULT
    @lpVtbl.value.get_registration_state.unsafe_as(Proc(UpdateServiceRegistrationState*, HRESULT)).call(retval)
  end
  def get_service_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_service_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_is_pending_registration_with_au(retval : Int16*) : HRESULT
    @lpVtbl.value.get_is_pending_registration_with_au.unsafe_as(Proc(Int16*, HRESULT)).call(retval)
  end
  def get_service(retval : IUpdateService2*) : HRESULT
    @lpVtbl.value.get_service.unsafe_as(Proc(IUpdateService2*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUpdateServiceManager
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
  def get_services(retval : IUpdateServiceCollection*) : HRESULT
    @lpVtbl.value.get_services.unsafe_as(Proc(IUpdateServiceCollection*, HRESULT)).call(retval)
  end
  def add_service(serviceid : UInt8*, authorizationcabpath : UInt8*, retval : IUpdateService*) : HRESULT
    @lpVtbl.value.add_service.unsafe_as(Proc(UInt8*, UInt8*, IUpdateService*, HRESULT)).call(serviceid, authorizationcabpath, retval)
  end
  def register_service_with_au(serviceid : UInt8*) : HRESULT
    @lpVtbl.value.register_service_with_au.unsafe_as(Proc(UInt8*, HRESULT)).call(serviceid)
  end
  def remove_service(serviceid : UInt8*) : HRESULT
    @lpVtbl.value.remove_service.unsafe_as(Proc(UInt8*, HRESULT)).call(serviceid)
  end
  def unregister_service_with_au(serviceid : UInt8*) : HRESULT
    @lpVtbl.value.unregister_service_with_au.unsafe_as(Proc(UInt8*, HRESULT)).call(serviceid)
  end
  def add_scan_package_service(servicename : UInt8*, scanfilelocation : UInt8*, flags : Int32, ppservice : IUpdateService*) : HRESULT
    @lpVtbl.value.add_scan_package_service.unsafe_as(Proc(UInt8*, UInt8*, Int32, IUpdateService*, HRESULT)).call(servicename, scanfilelocation, flags, ppservice)
  end
  def set_option(optionname : UInt8*, optionvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_option.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(optionname, optionvalue)
  end
end
struct LibWin32::IUpdateServiceManager2
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
  def get_services(retval : IUpdateServiceCollection*) : HRESULT
    @lpVtbl.value.get_services.unsafe_as(Proc(IUpdateServiceCollection*, HRESULT)).call(retval)
  end
  def add_service(serviceid : UInt8*, authorizationcabpath : UInt8*, retval : IUpdateService*) : HRESULT
    @lpVtbl.value.add_service.unsafe_as(Proc(UInt8*, UInt8*, IUpdateService*, HRESULT)).call(serviceid, authorizationcabpath, retval)
  end
  def register_service_with_au(serviceid : UInt8*) : HRESULT
    @lpVtbl.value.register_service_with_au.unsafe_as(Proc(UInt8*, HRESULT)).call(serviceid)
  end
  def remove_service(serviceid : UInt8*) : HRESULT
    @lpVtbl.value.remove_service.unsafe_as(Proc(UInt8*, HRESULT)).call(serviceid)
  end
  def unregister_service_with_au(serviceid : UInt8*) : HRESULT
    @lpVtbl.value.unregister_service_with_au.unsafe_as(Proc(UInt8*, HRESULT)).call(serviceid)
  end
  def add_scan_package_service(servicename : UInt8*, scanfilelocation : UInt8*, flags : Int32, ppservice : IUpdateService*) : HRESULT
    @lpVtbl.value.add_scan_package_service.unsafe_as(Proc(UInt8*, UInt8*, Int32, IUpdateService*, HRESULT)).call(servicename, scanfilelocation, flags, ppservice)
  end
  def set_option(optionname : UInt8*, optionvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_option.unsafe_as(Proc(UInt8*, VARIANT, HRESULT)).call(optionname, optionvalue)
  end
  def get_client_application_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_client_application_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def put_client_application_id(value : UInt8*) : HRESULT
    @lpVtbl.value.put_client_application_id.unsafe_as(Proc(UInt8*, HRESULT)).call(value)
  end
  def query_service_registration(serviceid : UInt8*, retval : IUpdateServiceRegistration*) : HRESULT
    @lpVtbl.value.query_service_registration.unsafe_as(Proc(UInt8*, IUpdateServiceRegistration*, HRESULT)).call(serviceid, retval)
  end
  def add_service2(serviceid : UInt8*, flags : Int32, authorizationcabpath : UInt8*, retval : IUpdateServiceRegistration*) : HRESULT
    @lpVtbl.value.add_service2.unsafe_as(Proc(UInt8*, Int32, UInt8*, IUpdateServiceRegistration*, HRESULT)).call(serviceid, flags, authorizationcabpath, retval)
  end
end
struct LibWin32::IInstallationAgent
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
  def record_installation_result(installationresultcookie : UInt8*, hresult : Int32, extendedreportingdata : IStringCollection) : HRESULT
    @lpVtbl.value.record_installation_result.unsafe_as(Proc(UInt8*, Int32, IStringCollection, HRESULT)).call(installationresultcookie, hresult, extendedreportingdata)
  end
end
