require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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
  StringCollection = LibC::GUID.new(0x72c97d74_u32, 0x7c3b_u16, 0x40ae_u16, StaticArray[0xb7_u8, 0x7d_u8, 0xab_u8, 0xdb_u8, 0x22_u8, 0xeb_u8, 0xa6_u8, 0xfb_u8])
  UpdateSearcher = LibC::GUID.new(0xb699e5e8_u32, 0x67ff_u16, 0x4177_u16, StaticArray[0x88_u8, 0xb0_u8, 0x36_u8, 0x84_u8, 0xa3_u8, 0x38_u8, 0x8b_u8, 0xfb_u8])
  WebProxy = LibC::GUID.new(0x650503cf_u32, 0x9108_u16, 0x4ddc_u16, StaticArray[0xa2_u8, 0xce_u8, 0x6c_u8, 0x23_u8, 0x41_u8, 0xe1_u8, 0xc5_u8, 0x82_u8])
  SystemInformation = LibC::GUID.new(0xc01b9ba0_u32, 0xbea7_u16, 0x41ba_u16, StaticArray[0xb6_u8, 0x4_u8, 0xd0_u8, 0xa3_u8, 0x6f_u8, 0x46_u8, 0x91_u8, 0x33_u8])
  WindowsUpdateAgentInfo = LibC::GUID.new(0xc2e88c2f_u32, 0x6f5b_u16, 0x4aaa_u16, StaticArray[0x89_u8, 0x4b_u8, 0x55_u8, 0xc8_u8, 0x47_u8, 0xad_u8, 0x3a_u8, 0x2d_u8])
  AutomaticUpdates = LibC::GUID.new(0xbfe18e9c_u32, 0x6d87_u16, 0x4450_u16, StaticArray[0xb3_u8, 0x7c_u8, 0xe0_u8, 0x2f_u8, 0xb_u8, 0x37_u8, 0x38_u8, 0x3_u8])
  UpdateCollection = LibC::GUID.new(0x13639463_u32, 0xdb_u16, 0x4646_u16, StaticArray[0x80_u8, 0x3d_u8, 0x52_u8, 0x80_u8, 0x26_u8, 0x14_u8, 0xd_u8, 0x88_u8])
  UpdateDownloader = LibC::GUID.new(0x5baf654a_u32, 0x5a07_u16, 0x4264_u16, StaticArray[0xa2_u8, 0x55_u8, 0x9f_u8, 0xf5_u8, 0x4c_u8, 0x71_u8, 0x51_u8, 0xe7_u8])
  UpdateInstaller = LibC::GUID.new(0xd2e0fe7f_u32, 0xd23e_u16, 0x48e1_u16, StaticArray[0x93_u8, 0xc0_u8, 0x6f_u8, 0xa8_u8, 0xcc_u8, 0x34_u8, 0x64_u8, 0x74_u8])
  UpdateSession = LibC::GUID.new(0x4cb43d7f_u32, 0x7eee_u16, 0x4906_u16, StaticArray[0x86_u8, 0x98_u8, 0x60_u8, 0xda_u8, 0x1c_u8, 0x38_u8, 0xf2_u8, 0xfe_u8])
  UpdateServiceManager = LibC::GUID.new(0xf8d253d9_u32, 0x89a4_u16, 0x4daa_u16, StaticArray[0x87_u8, 0xb6_u8, 0x11_u8, 0x68_u8, 0x36_u8, 0x9f_u8, 0xb_u8, 0x21_u8])
  InstallationAgent = LibC::GUID.new(0x317e92fc_u32, 0x1679_u16, 0x46fd_u16, StaticArray[0xa0_u8, 0xb5_u8, 0xf0_u8, 0x89_u8, 0x14_u8, 0xdd_u8, 0x86_u8, 0x23_u8])


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
    query_interface : Proc(IUpdateLockdown*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateLockdown*, UInt32)
    release : Proc(IUpdateLockdown*, UInt32)
    lock_down : Proc(IUpdateLockdown*, Int32, HRESULT)
  end

  IUpdateLockdown_GUID = LibC::GUID.new("a976c28d-75a1-42aa-94ae-8af8b872089a")
  CLSID_IUpdateLockdown = "a976c28d-75a1-42aa-94ae-8af8b872089a"
  struct IUpdateLockdown
    lpVtbl : IUpdateLockdownVTbl*
  end

  struct IStringCollectionVTbl
    query_interface : Proc(IStringCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStringCollection*, UInt32)
    release : Proc(IStringCollection*, UInt32)
    get_type_info_count : Proc(IStringCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IStringCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IStringCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IStringCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IStringCollection*, Int32, UInt8**, HRESULT)
    put_item : Proc(IStringCollection*, Int32, UInt8*, HRESULT)
    get__new_enum : Proc(IStringCollection*, IUnknown*, HRESULT)
    get_count : Proc(IStringCollection*, Int32*, HRESULT)
    get_read_only : Proc(IStringCollection*, Int16*, HRESULT)
    add : Proc(IStringCollection*, UInt8*, Int32*, HRESULT)
    clear : Proc(IStringCollection*, HRESULT)
    copy : Proc(IStringCollection*, IStringCollection*, HRESULT)
    insert : Proc(IStringCollection*, Int32, UInt8*, HRESULT)
    remove_at : Proc(IStringCollection*, Int32, HRESULT)
  end

  IStringCollection_GUID = LibC::GUID.new("eff90582-2ddc-480f-a06d-60f3fbc362c3")
  CLSID_IStringCollection = "eff90582-2ddc-480f-a06d-60f3fbc362c3"
  struct IStringCollection
    lpVtbl : IStringCollectionVTbl*
  end

  struct IWebProxyVTbl
    query_interface : Proc(IWebProxy*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWebProxy*, UInt32)
    release : Proc(IWebProxy*, UInt32)
    get_type_info_count : Proc(IWebProxy*, UInt32*, HRESULT)
    get_type_info : Proc(IWebProxy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWebProxy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWebProxy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_address : Proc(IWebProxy*, UInt8**, HRESULT)
    put_address : Proc(IWebProxy*, UInt8*, HRESULT)
    get_bypass_list : Proc(IWebProxy*, IStringCollection*, HRESULT)
    put_bypass_list : Proc(IWebProxy*, IStringCollection, HRESULT)
    get_bypass_proxy_on_local : Proc(IWebProxy*, Int16*, HRESULT)
    put_bypass_proxy_on_local : Proc(IWebProxy*, Int16, HRESULT)
    get_read_only : Proc(IWebProxy*, Int16*, HRESULT)
    get_user_name : Proc(IWebProxy*, UInt8**, HRESULT)
    put_user_name : Proc(IWebProxy*, UInt8*, HRESULT)
    set_password : Proc(IWebProxy*, UInt8*, HRESULT)
    prompt_for_credentials : Proc(IWebProxy*, IUnknown, UInt8*, HRESULT)
    prompt_for_credentials_from_hwnd : Proc(IWebProxy*, LibC::HANDLE, UInt8*, HRESULT)
    get_auto_detect : Proc(IWebProxy*, Int16*, HRESULT)
    put_auto_detect : Proc(IWebProxy*, Int16, HRESULT)
  end

  IWebProxy_GUID = LibC::GUID.new("174c81fe-aecd-4dae-b8a0-2c6318dd86a8")
  CLSID_IWebProxy = "174c81fe-aecd-4dae-b8a0-2c6318dd86a8"
  struct IWebProxy
    lpVtbl : IWebProxyVTbl*
  end

  struct ISystemInformationVTbl
    query_interface : Proc(ISystemInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISystemInformation*, UInt32)
    release : Proc(ISystemInformation*, UInt32)
    get_type_info_count : Proc(ISystemInformation*, UInt32*, HRESULT)
    get_type_info : Proc(ISystemInformation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISystemInformation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISystemInformation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_oem_hardware_support_link : Proc(ISystemInformation*, UInt8**, HRESULT)
    get_reboot_required : Proc(ISystemInformation*, Int16*, HRESULT)
  end

  ISystemInformation_GUID = LibC::GUID.new("ade87bf7-7b56-4275-8fab-b9b0e591844b")
  CLSID_ISystemInformation = "ade87bf7-7b56-4275-8fab-b9b0e591844b"
  struct ISystemInformation
    lpVtbl : ISystemInformationVTbl*
  end

  struct IWindowsUpdateAgentInfoVTbl
    query_interface : Proc(IWindowsUpdateAgentInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsUpdateAgentInfo*, UInt32)
    release : Proc(IWindowsUpdateAgentInfo*, UInt32)
    get_type_info_count : Proc(IWindowsUpdateAgentInfo*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsUpdateAgentInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsUpdateAgentInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsUpdateAgentInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_info : Proc(IWindowsUpdateAgentInfo*, VARIANT, VARIANT*, HRESULT)
  end

  IWindowsUpdateAgentInfo_GUID = LibC::GUID.new("85713fa1-7796-4fa2-be3b-e2d6124dd373")
  CLSID_IWindowsUpdateAgentInfo = "85713fa1-7796-4fa2-be3b-e2d6124dd373"
  struct IWindowsUpdateAgentInfo
    lpVtbl : IWindowsUpdateAgentInfoVTbl*
  end

  struct IAutomaticUpdatesResultsVTbl
    query_interface : Proc(IAutomaticUpdatesResults*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAutomaticUpdatesResults*, UInt32)
    release : Proc(IAutomaticUpdatesResults*, UInt32)
    get_type_info_count : Proc(IAutomaticUpdatesResults*, UInt32*, HRESULT)
    get_type_info : Proc(IAutomaticUpdatesResults*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAutomaticUpdatesResults*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAutomaticUpdatesResults*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_last_search_success_date : Proc(IAutomaticUpdatesResults*, VARIANT*, HRESULT)
    get_last_installation_success_date : Proc(IAutomaticUpdatesResults*, VARIANT*, HRESULT)
  end

  IAutomaticUpdatesResults_GUID = LibC::GUID.new("e7a4d634-7942-4dd9-a111-82228ba33901")
  CLSID_IAutomaticUpdatesResults = "e7a4d634-7942-4dd9-a111-82228ba33901"
  struct IAutomaticUpdatesResults
    lpVtbl : IAutomaticUpdatesResultsVTbl*
  end

  struct IAutomaticUpdatesSettingsVTbl
    query_interface : Proc(IAutomaticUpdatesSettings*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAutomaticUpdatesSettings*, UInt32)
    release : Proc(IAutomaticUpdatesSettings*, UInt32)
    get_type_info_count : Proc(IAutomaticUpdatesSettings*, UInt32*, HRESULT)
    get_type_info : Proc(IAutomaticUpdatesSettings*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAutomaticUpdatesSettings*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAutomaticUpdatesSettings*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_notification_level : Proc(IAutomaticUpdatesSettings*, AutomaticUpdatesNotificationLevel*, HRESULT)
    put_notification_level : Proc(IAutomaticUpdatesSettings*, AutomaticUpdatesNotificationLevel, HRESULT)
    get_read_only : Proc(IAutomaticUpdatesSettings*, Int16*, HRESULT)
    get_required : Proc(IAutomaticUpdatesSettings*, Int16*, HRESULT)
    get_scheduled_installation_day : Proc(IAutomaticUpdatesSettings*, AutomaticUpdatesScheduledInstallationDay*, HRESULT)
    put_scheduled_installation_day : Proc(IAutomaticUpdatesSettings*, AutomaticUpdatesScheduledInstallationDay, HRESULT)
    get_scheduled_installation_time : Proc(IAutomaticUpdatesSettings*, Int32*, HRESULT)
    put_scheduled_installation_time : Proc(IAutomaticUpdatesSettings*, Int32, HRESULT)
    refresh : Proc(IAutomaticUpdatesSettings*, HRESULT)
    save : Proc(IAutomaticUpdatesSettings*, HRESULT)
  end

  IAutomaticUpdatesSettings_GUID = LibC::GUID.new("2ee48f22-af3c-405f-8970-f71be12ee9a2")
  CLSID_IAutomaticUpdatesSettings = "2ee48f22-af3c-405f-8970-f71be12ee9a2"
  struct IAutomaticUpdatesSettings
    lpVtbl : IAutomaticUpdatesSettingsVTbl*
  end

  struct IAutomaticUpdatesSettings2VTbl
    query_interface : Proc(IAutomaticUpdatesSettings2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAutomaticUpdatesSettings2*, UInt32)
    release : Proc(IAutomaticUpdatesSettings2*, UInt32)
    get_type_info_count : Proc(IAutomaticUpdatesSettings2*, UInt32*, HRESULT)
    get_type_info : Proc(IAutomaticUpdatesSettings2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAutomaticUpdatesSettings2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAutomaticUpdatesSettings2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_notification_level : Proc(IAutomaticUpdatesSettings2*, AutomaticUpdatesNotificationLevel*, HRESULT)
    put_notification_level : Proc(IAutomaticUpdatesSettings2*, AutomaticUpdatesNotificationLevel, HRESULT)
    get_read_only : Proc(IAutomaticUpdatesSettings2*, Int16*, HRESULT)
    get_required : Proc(IAutomaticUpdatesSettings2*, Int16*, HRESULT)
    get_scheduled_installation_day : Proc(IAutomaticUpdatesSettings2*, AutomaticUpdatesScheduledInstallationDay*, HRESULT)
    put_scheduled_installation_day : Proc(IAutomaticUpdatesSettings2*, AutomaticUpdatesScheduledInstallationDay, HRESULT)
    get_scheduled_installation_time : Proc(IAutomaticUpdatesSettings2*, Int32*, HRESULT)
    put_scheduled_installation_time : Proc(IAutomaticUpdatesSettings2*, Int32, HRESULT)
    refresh : Proc(IAutomaticUpdatesSettings2*, HRESULT)
    save : Proc(IAutomaticUpdatesSettings2*, HRESULT)
    get_include_recommended_updates : Proc(IAutomaticUpdatesSettings2*, Int16*, HRESULT)
    put_include_recommended_updates : Proc(IAutomaticUpdatesSettings2*, Int16, HRESULT)
    check_permission : Proc(IAutomaticUpdatesSettings2*, AutomaticUpdatesUserType, AutomaticUpdatesPermissionType, Int16*, HRESULT)
  end

  IAutomaticUpdatesSettings2_GUID = LibC::GUID.new("6abc136a-c3ca-4384-8171-cb2b1e59b8dc")
  CLSID_IAutomaticUpdatesSettings2 = "6abc136a-c3ca-4384-8171-cb2b1e59b8dc"
  struct IAutomaticUpdatesSettings2
    lpVtbl : IAutomaticUpdatesSettings2VTbl*
  end

  struct IAutomaticUpdatesSettings3VTbl
    query_interface : Proc(IAutomaticUpdatesSettings3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAutomaticUpdatesSettings3*, UInt32)
    release : Proc(IAutomaticUpdatesSettings3*, UInt32)
    get_type_info_count : Proc(IAutomaticUpdatesSettings3*, UInt32*, HRESULT)
    get_type_info : Proc(IAutomaticUpdatesSettings3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAutomaticUpdatesSettings3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAutomaticUpdatesSettings3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_notification_level : Proc(IAutomaticUpdatesSettings3*, AutomaticUpdatesNotificationLevel*, HRESULT)
    put_notification_level : Proc(IAutomaticUpdatesSettings3*, AutomaticUpdatesNotificationLevel, HRESULT)
    get_read_only : Proc(IAutomaticUpdatesSettings3*, Int16*, HRESULT)
    get_required : Proc(IAutomaticUpdatesSettings3*, Int16*, HRESULT)
    get_scheduled_installation_day : Proc(IAutomaticUpdatesSettings3*, AutomaticUpdatesScheduledInstallationDay*, HRESULT)
    put_scheduled_installation_day : Proc(IAutomaticUpdatesSettings3*, AutomaticUpdatesScheduledInstallationDay, HRESULT)
    get_scheduled_installation_time : Proc(IAutomaticUpdatesSettings3*, Int32*, HRESULT)
    put_scheduled_installation_time : Proc(IAutomaticUpdatesSettings3*, Int32, HRESULT)
    refresh : Proc(IAutomaticUpdatesSettings3*, HRESULT)
    save : Proc(IAutomaticUpdatesSettings3*, HRESULT)
    get_include_recommended_updates : Proc(IAutomaticUpdatesSettings3*, Int16*, HRESULT)
    put_include_recommended_updates : Proc(IAutomaticUpdatesSettings3*, Int16, HRESULT)
    check_permission : Proc(IAutomaticUpdatesSettings3*, AutomaticUpdatesUserType, AutomaticUpdatesPermissionType, Int16*, HRESULT)
    get_non_administrators_elevated : Proc(IAutomaticUpdatesSettings3*, Int16*, HRESULT)
    put_non_administrators_elevated : Proc(IAutomaticUpdatesSettings3*, Int16, HRESULT)
    get_featured_updates_enabled : Proc(IAutomaticUpdatesSettings3*, Int16*, HRESULT)
    put_featured_updates_enabled : Proc(IAutomaticUpdatesSettings3*, Int16, HRESULT)
  end

  IAutomaticUpdatesSettings3_GUID = LibC::GUID.new("b587f5c3-f57e-485f-bbf5-0d181c5cd0dc")
  CLSID_IAutomaticUpdatesSettings3 = "b587f5c3-f57e-485f-bbf5-0d181c5cd0dc"
  struct IAutomaticUpdatesSettings3
    lpVtbl : IAutomaticUpdatesSettings3VTbl*
  end

  struct IAutomaticUpdatesVTbl
    query_interface : Proc(IAutomaticUpdates*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAutomaticUpdates*, UInt32)
    release : Proc(IAutomaticUpdates*, UInt32)
    get_type_info_count : Proc(IAutomaticUpdates*, UInt32*, HRESULT)
    get_type_info : Proc(IAutomaticUpdates*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAutomaticUpdates*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAutomaticUpdates*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    detect_now : Proc(IAutomaticUpdates*, HRESULT)
    pause : Proc(IAutomaticUpdates*, HRESULT)
    resume : Proc(IAutomaticUpdates*, HRESULT)
    show_settings_dialog : Proc(IAutomaticUpdates*, HRESULT)
    get_settings : Proc(IAutomaticUpdates*, IAutomaticUpdatesSettings*, HRESULT)
    get_service_enabled : Proc(IAutomaticUpdates*, Int16*, HRESULT)
    enable_service : Proc(IAutomaticUpdates*, HRESULT)
  end

  IAutomaticUpdates_GUID = LibC::GUID.new("673425bf-c082-4c7c-bdfd-569464b8e0ce")
  CLSID_IAutomaticUpdates = "673425bf-c082-4c7c-bdfd-569464b8e0ce"
  struct IAutomaticUpdates
    lpVtbl : IAutomaticUpdatesVTbl*
  end

  struct IAutomaticUpdates2VTbl
    query_interface : Proc(IAutomaticUpdates2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAutomaticUpdates2*, UInt32)
    release : Proc(IAutomaticUpdates2*, UInt32)
    get_type_info_count : Proc(IAutomaticUpdates2*, UInt32*, HRESULT)
    get_type_info : Proc(IAutomaticUpdates2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAutomaticUpdates2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAutomaticUpdates2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    detect_now : Proc(IAutomaticUpdates2*, HRESULT)
    pause : Proc(IAutomaticUpdates2*, HRESULT)
    resume : Proc(IAutomaticUpdates2*, HRESULT)
    show_settings_dialog : Proc(IAutomaticUpdates2*, HRESULT)
    get_settings : Proc(IAutomaticUpdates2*, IAutomaticUpdatesSettings*, HRESULT)
    get_service_enabled : Proc(IAutomaticUpdates2*, Int16*, HRESULT)
    enable_service : Proc(IAutomaticUpdates2*, HRESULT)
    get_results : Proc(IAutomaticUpdates2*, IAutomaticUpdatesResults*, HRESULT)
  end

  IAutomaticUpdates2_GUID = LibC::GUID.new("4a2f5c31-cfd9-410e-b7fb-29a653973a0f")
  CLSID_IAutomaticUpdates2 = "4a2f5c31-cfd9-410e-b7fb-29a653973a0f"
  struct IAutomaticUpdates2
    lpVtbl : IAutomaticUpdates2VTbl*
  end

  struct IUpdateIdentityVTbl
    query_interface : Proc(IUpdateIdentity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateIdentity*, UInt32)
    release : Proc(IUpdateIdentity*, UInt32)
    get_type_info_count : Proc(IUpdateIdentity*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateIdentity*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateIdentity*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateIdentity*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_revision_number : Proc(IUpdateIdentity*, Int32*, HRESULT)
    get_update_id : Proc(IUpdateIdentity*, UInt8**, HRESULT)
  end

  IUpdateIdentity_GUID = LibC::GUID.new("46297823-9940-4c09-aed9-cd3ea6d05968")
  CLSID_IUpdateIdentity = "46297823-9940-4c09-aed9-cd3ea6d05968"
  struct IUpdateIdentity
    lpVtbl : IUpdateIdentityVTbl*
  end

  struct IImageInformationVTbl
    query_interface : Proc(IImageInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IImageInformation*, UInt32)
    release : Proc(IImageInformation*, UInt32)
    get_type_info_count : Proc(IImageInformation*, UInt32*, HRESULT)
    get_type_info : Proc(IImageInformation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IImageInformation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IImageInformation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_alt_text : Proc(IImageInformation*, UInt8**, HRESULT)
    get_height : Proc(IImageInformation*, Int32*, HRESULT)
    get_source : Proc(IImageInformation*, UInt8**, HRESULT)
    get_width : Proc(IImageInformation*, Int32*, HRESULT)
  end

  IImageInformation_GUID = LibC::GUID.new("7c907864-346c-4aeb-8f3f-57da289f969f")
  CLSID_IImageInformation = "7c907864-346c-4aeb-8f3f-57da289f969f"
  struct IImageInformation
    lpVtbl : IImageInformationVTbl*
  end

  struct ICategoryVTbl
    query_interface : Proc(ICategory*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICategory*, UInt32)
    release : Proc(ICategory*, UInt32)
    get_type_info_count : Proc(ICategory*, UInt32*, HRESULT)
    get_type_info : Proc(ICategory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICategory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICategory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(ICategory*, UInt8**, HRESULT)
    get_category_id : Proc(ICategory*, UInt8**, HRESULT)
    get_children : Proc(ICategory*, ICategoryCollection*, HRESULT)
    get_description : Proc(ICategory*, UInt8**, HRESULT)
    get_image : Proc(ICategory*, IImageInformation*, HRESULT)
    get_order : Proc(ICategory*, Int32*, HRESULT)
    get_parent : Proc(ICategory*, ICategory*, HRESULT)
    get_type : Proc(ICategory*, UInt8**, HRESULT)
    get_updates : Proc(ICategory*, IUpdateCollection*, HRESULT)
  end

  ICategory_GUID = LibC::GUID.new("81ddc1b8-9d35-47a6-b471-5b80f519223b")
  CLSID_ICategory = "81ddc1b8-9d35-47a6-b471-5b80f519223b"
  struct ICategory
    lpVtbl : ICategoryVTbl*
  end

  struct ICategoryCollectionVTbl
    query_interface : Proc(ICategoryCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICategoryCollection*, UInt32)
    release : Proc(ICategoryCollection*, UInt32)
    get_type_info_count : Proc(ICategoryCollection*, UInt32*, HRESULT)
    get_type_info : Proc(ICategoryCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICategoryCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICategoryCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(ICategoryCollection*, Int32, ICategory*, HRESULT)
    get__new_enum : Proc(ICategoryCollection*, IUnknown*, HRESULT)
    get_count : Proc(ICategoryCollection*, Int32*, HRESULT)
  end

  ICategoryCollection_GUID = LibC::GUID.new("3a56bfb8-576c-43f7-9335-fe4838fd7e37")
  CLSID_ICategoryCollection = "3a56bfb8-576c-43f7-9335-fe4838fd7e37"
  struct ICategoryCollection
    lpVtbl : ICategoryCollectionVTbl*
  end

  struct IInstallationBehaviorVTbl
    query_interface : Proc(IInstallationBehavior*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationBehavior*, UInt32)
    release : Proc(IInstallationBehavior*, UInt32)
    get_type_info_count : Proc(IInstallationBehavior*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationBehavior*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationBehavior*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationBehavior*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_can_request_user_input : Proc(IInstallationBehavior*, Int16*, HRESULT)
    get_impact : Proc(IInstallationBehavior*, InstallationImpact*, HRESULT)
    get_reboot_behavior : Proc(IInstallationBehavior*, InstallationRebootBehavior*, HRESULT)
    get_requires_network_connectivity : Proc(IInstallationBehavior*, Int16*, HRESULT)
  end

  IInstallationBehavior_GUID = LibC::GUID.new("d9a59339-e245-4dbd-9686-4d5763e39624")
  CLSID_IInstallationBehavior = "d9a59339-e245-4dbd-9686-4d5763e39624"
  struct IInstallationBehavior
    lpVtbl : IInstallationBehaviorVTbl*
  end

  struct IUpdateDownloadContentVTbl
    query_interface : Proc(IUpdateDownloadContent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateDownloadContent*, UInt32)
    release : Proc(IUpdateDownloadContent*, UInt32)
    get_type_info_count : Proc(IUpdateDownloadContent*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateDownloadContent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateDownloadContent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateDownloadContent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_download_url : Proc(IUpdateDownloadContent*, UInt8**, HRESULT)
  end

  IUpdateDownloadContent_GUID = LibC::GUID.new("54a2cb2d-9a0c-48b6-8a50-9abb69ee2d02")
  CLSID_IUpdateDownloadContent = "54a2cb2d-9a0c-48b6-8a50-9abb69ee2d02"
  struct IUpdateDownloadContent
    lpVtbl : IUpdateDownloadContentVTbl*
  end

  struct IUpdateDownloadContent2VTbl
    query_interface : Proc(IUpdateDownloadContent2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateDownloadContent2*, UInt32)
    release : Proc(IUpdateDownloadContent2*, UInt32)
    get_type_info_count : Proc(IUpdateDownloadContent2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateDownloadContent2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateDownloadContent2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateDownloadContent2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_download_url : Proc(IUpdateDownloadContent2*, UInt8**, HRESULT)
    get_is_delta_compressed_content : Proc(IUpdateDownloadContent2*, Int16*, HRESULT)
  end

  IUpdateDownloadContent2_GUID = LibC::GUID.new("c97ad11b-f257-420b-9d9f-377f733f6f68")
  CLSID_IUpdateDownloadContent2 = "c97ad11b-f257-420b-9d9f-377f733f6f68"
  struct IUpdateDownloadContent2
    lpVtbl : IUpdateDownloadContent2VTbl*
  end

  struct IUpdateDownloadContentCollectionVTbl
    query_interface : Proc(IUpdateDownloadContentCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateDownloadContentCollection*, UInt32)
    release : Proc(IUpdateDownloadContentCollection*, UInt32)
    get_type_info_count : Proc(IUpdateDownloadContentCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateDownloadContentCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateDownloadContentCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateDownloadContentCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IUpdateDownloadContentCollection*, Int32, IUpdateDownloadContent*, HRESULT)
    get__new_enum : Proc(IUpdateDownloadContentCollection*, IUnknown*, HRESULT)
    get_count : Proc(IUpdateDownloadContentCollection*, Int32*, HRESULT)
  end

  IUpdateDownloadContentCollection_GUID = LibC::GUID.new("bc5513c8-b3b8-4bf7-a4d4-361c0d8c88ba")
  CLSID_IUpdateDownloadContentCollection = "bc5513c8-b3b8-4bf7-a4d4-361c0d8c88ba"
  struct IUpdateDownloadContentCollection
    lpVtbl : IUpdateDownloadContentCollectionVTbl*
  end

  struct IUpdateVTbl
    query_interface : Proc(IUpdate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdate*, UInt32)
    release : Proc(IUpdate*, UInt32)
    get_type_info_count : Proc(IUpdate*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IUpdate*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IUpdate*, Int16*, HRESULT)
    get_bundled_updates : Proc(IUpdate*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IUpdate*, Int16*, HRESULT)
    get_categories : Proc(IUpdate*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IUpdate*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IUpdate*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IUpdate*, Int16*, HRESULT)
    get_description : Proc(IUpdate*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IUpdate*, Int16*, HRESULT)
    get_eula_text : Proc(IUpdate*, UInt8**, HRESULT)
    get_handler_id : Proc(IUpdate*, UInt8**, HRESULT)
    get_identity : Proc(IUpdate*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IUpdate*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IUpdate*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IUpdate*, Int16*, HRESULT)
    get_is_downloaded : Proc(IUpdate*, Int16*, HRESULT)
    get_is_hidden : Proc(IUpdate*, Int16*, HRESULT)
    put_is_hidden : Proc(IUpdate*, Int16, HRESULT)
    get_is_installed : Proc(IUpdate*, Int16*, HRESULT)
    get_is_mandatory : Proc(IUpdate*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IUpdate*, Int16*, HRESULT)
    get_languages : Proc(IUpdate*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IUpdate*, Float64*, HRESULT)
    get_max_download_size : Proc(IUpdate*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IUpdate*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IUpdate*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IUpdate*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IUpdate*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IUpdate*, Int32*, HRESULT)
    get_recommended_memory : Proc(IUpdate*, Int32*, HRESULT)
    get_release_notes : Proc(IUpdate*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IUpdate*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IUpdate*, IStringCollection*, HRESULT)
    get_support_url : Proc(IUpdate*, UInt8**, HRESULT)
    get_type : Proc(IUpdate*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IUpdate*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IUpdate*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IUpdate*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IUpdate*, IStringCollection*, HRESULT)
    accept_eula : Proc(IUpdate*, HRESULT)
    get_deployment_action : Proc(IUpdate*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IUpdate*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IUpdate*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IUpdate*, IUpdateDownloadContentCollection*, HRESULT)
  end

  IUpdate_GUID = LibC::GUID.new("6a92b07a-d821-4682-b423-5c805022cc4d")
  CLSID_IUpdate = "6a92b07a-d821-4682-b423-5c805022cc4d"
  struct IUpdate
    lpVtbl : IUpdateVTbl*
  end

  struct IWindowsDriverUpdateVTbl
    query_interface : Proc(IWindowsDriverUpdate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdate*, UInt32)
    release : Proc(IWindowsDriverUpdate*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdate*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_bundled_updates : Proc(IWindowsDriverUpdate*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_categories : Proc(IWindowsDriverUpdate*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IWindowsDriverUpdate*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_description : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_eula_text : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_handler_id : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_identity : Proc(IWindowsDriverUpdate*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IWindowsDriverUpdate*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IWindowsDriverUpdate*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_is_downloaded : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_is_hidden : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    put_is_hidden : Proc(IWindowsDriverUpdate*, Int16, HRESULT)
    get_is_installed : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_is_mandatory : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IWindowsDriverUpdate*, Int16*, HRESULT)
    get_languages : Proc(IWindowsDriverUpdate*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IWindowsDriverUpdate*, Float64*, HRESULT)
    get_max_download_size : Proc(IWindowsDriverUpdate*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IWindowsDriverUpdate*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IWindowsDriverUpdate*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IWindowsDriverUpdate*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IWindowsDriverUpdate*, Int32*, HRESULT)
    get_recommended_memory : Proc(IWindowsDriverUpdate*, Int32*, HRESULT)
    get_release_notes : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IWindowsDriverUpdate*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IWindowsDriverUpdate*, IStringCollection*, HRESULT)
    get_support_url : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_type : Proc(IWindowsDriverUpdate*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IWindowsDriverUpdate*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IWindowsDriverUpdate*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IWindowsDriverUpdate*, IStringCollection*, HRESULT)
    accept_eula : Proc(IWindowsDriverUpdate*, HRESULT)
    get_deployment_action : Proc(IWindowsDriverUpdate*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IWindowsDriverUpdate*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IWindowsDriverUpdate*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IWindowsDriverUpdate*, IUpdateDownloadContentCollection*, HRESULT)
    get_driver_class : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_driver_hardware_id : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_driver_manufacturer : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_driver_model : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_driver_provider : Proc(IWindowsDriverUpdate*, UInt8**, HRESULT)
    get_driver_ver_date : Proc(IWindowsDriverUpdate*, Float64*, HRESULT)
    get_device_problem_number : Proc(IWindowsDriverUpdate*, Int32*, HRESULT)
    get_device_status : Proc(IWindowsDriverUpdate*, Int32*, HRESULT)
  end

  IWindowsDriverUpdate_GUID = LibC::GUID.new("b383cd1a-5ce9-4504-9f63-764b1236f191")
  CLSID_IWindowsDriverUpdate = "b383cd1a-5ce9-4504-9f63-764b1236f191"
  struct IWindowsDriverUpdate
    lpVtbl : IWindowsDriverUpdateVTbl*
  end

  struct IUpdate2VTbl
    query_interface : Proc(IUpdate2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdate2*, UInt32)
    release : Proc(IUpdate2*, UInt32)
    get_type_info_count : Proc(IUpdate2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdate2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdate2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdate2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IUpdate2*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IUpdate2*, Int16*, HRESULT)
    get_bundled_updates : Proc(IUpdate2*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IUpdate2*, Int16*, HRESULT)
    get_categories : Proc(IUpdate2*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IUpdate2*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IUpdate2*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IUpdate2*, Int16*, HRESULT)
    get_description : Proc(IUpdate2*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IUpdate2*, Int16*, HRESULT)
    get_eula_text : Proc(IUpdate2*, UInt8**, HRESULT)
    get_handler_id : Proc(IUpdate2*, UInt8**, HRESULT)
    get_identity : Proc(IUpdate2*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IUpdate2*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IUpdate2*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IUpdate2*, Int16*, HRESULT)
    get_is_downloaded : Proc(IUpdate2*, Int16*, HRESULT)
    get_is_hidden : Proc(IUpdate2*, Int16*, HRESULT)
    put_is_hidden : Proc(IUpdate2*, Int16, HRESULT)
    get_is_installed : Proc(IUpdate2*, Int16*, HRESULT)
    get_is_mandatory : Proc(IUpdate2*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IUpdate2*, Int16*, HRESULT)
    get_languages : Proc(IUpdate2*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IUpdate2*, Float64*, HRESULT)
    get_max_download_size : Proc(IUpdate2*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IUpdate2*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IUpdate2*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IUpdate2*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IUpdate2*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IUpdate2*, Int32*, HRESULT)
    get_recommended_memory : Proc(IUpdate2*, Int32*, HRESULT)
    get_release_notes : Proc(IUpdate2*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IUpdate2*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IUpdate2*, IStringCollection*, HRESULT)
    get_support_url : Proc(IUpdate2*, UInt8**, HRESULT)
    get_type : Proc(IUpdate2*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IUpdate2*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IUpdate2*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IUpdate2*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IUpdate2*, IStringCollection*, HRESULT)
    accept_eula : Proc(IUpdate2*, HRESULT)
    get_deployment_action : Proc(IUpdate2*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IUpdate2*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IUpdate2*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IUpdate2*, IUpdateDownloadContentCollection*, HRESULT)
    get_reboot_required : Proc(IUpdate2*, Int16*, HRESULT)
    get_is_present : Proc(IUpdate2*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IUpdate2*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IUpdate2*, IStringCollection, HRESULT)
  end

  IUpdate2_GUID = LibC::GUID.new("144fe9b0-d23d-4a8b-8634-fb4457533b7a")
  CLSID_IUpdate2 = "144fe9b0-d23d-4a8b-8634-fb4457533b7a"
  struct IUpdate2
    lpVtbl : IUpdate2VTbl*
  end

  struct IUpdate3VTbl
    query_interface : Proc(IUpdate3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdate3*, UInt32)
    release : Proc(IUpdate3*, UInt32)
    get_type_info_count : Proc(IUpdate3*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdate3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdate3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdate3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IUpdate3*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IUpdate3*, Int16*, HRESULT)
    get_bundled_updates : Proc(IUpdate3*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IUpdate3*, Int16*, HRESULT)
    get_categories : Proc(IUpdate3*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IUpdate3*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IUpdate3*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IUpdate3*, Int16*, HRESULT)
    get_description : Proc(IUpdate3*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IUpdate3*, Int16*, HRESULT)
    get_eula_text : Proc(IUpdate3*, UInt8**, HRESULT)
    get_handler_id : Proc(IUpdate3*, UInt8**, HRESULT)
    get_identity : Proc(IUpdate3*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IUpdate3*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IUpdate3*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IUpdate3*, Int16*, HRESULT)
    get_is_downloaded : Proc(IUpdate3*, Int16*, HRESULT)
    get_is_hidden : Proc(IUpdate3*, Int16*, HRESULT)
    put_is_hidden : Proc(IUpdate3*, Int16, HRESULT)
    get_is_installed : Proc(IUpdate3*, Int16*, HRESULT)
    get_is_mandatory : Proc(IUpdate3*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IUpdate3*, Int16*, HRESULT)
    get_languages : Proc(IUpdate3*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IUpdate3*, Float64*, HRESULT)
    get_max_download_size : Proc(IUpdate3*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IUpdate3*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IUpdate3*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IUpdate3*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IUpdate3*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IUpdate3*, Int32*, HRESULT)
    get_recommended_memory : Proc(IUpdate3*, Int32*, HRESULT)
    get_release_notes : Proc(IUpdate3*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IUpdate3*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IUpdate3*, IStringCollection*, HRESULT)
    get_support_url : Proc(IUpdate3*, UInt8**, HRESULT)
    get_type : Proc(IUpdate3*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IUpdate3*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IUpdate3*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IUpdate3*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IUpdate3*, IStringCollection*, HRESULT)
    accept_eula : Proc(IUpdate3*, HRESULT)
    get_deployment_action : Proc(IUpdate3*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IUpdate3*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IUpdate3*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IUpdate3*, IUpdateDownloadContentCollection*, HRESULT)
    get_reboot_required : Proc(IUpdate3*, Int16*, HRESULT)
    get_is_present : Proc(IUpdate3*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IUpdate3*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IUpdate3*, IStringCollection, HRESULT)
    get_browse_only : Proc(IUpdate3*, Int16*, HRESULT)
  end

  IUpdate3_GUID = LibC::GUID.new("112eda6b-95b3-476f-9d90-aee82c6b8181")
  CLSID_IUpdate3 = "112eda6b-95b3-476f-9d90-aee82c6b8181"
  struct IUpdate3
    lpVtbl : IUpdate3VTbl*
  end

  struct IUpdate4VTbl
    query_interface : Proc(IUpdate4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdate4*, UInt32)
    release : Proc(IUpdate4*, UInt32)
    get_type_info_count : Proc(IUpdate4*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdate4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdate4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdate4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IUpdate4*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IUpdate4*, Int16*, HRESULT)
    get_bundled_updates : Proc(IUpdate4*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IUpdate4*, Int16*, HRESULT)
    get_categories : Proc(IUpdate4*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IUpdate4*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IUpdate4*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IUpdate4*, Int16*, HRESULT)
    get_description : Proc(IUpdate4*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IUpdate4*, Int16*, HRESULT)
    get_eula_text : Proc(IUpdate4*, UInt8**, HRESULT)
    get_handler_id : Proc(IUpdate4*, UInt8**, HRESULT)
    get_identity : Proc(IUpdate4*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IUpdate4*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IUpdate4*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IUpdate4*, Int16*, HRESULT)
    get_is_downloaded : Proc(IUpdate4*, Int16*, HRESULT)
    get_is_hidden : Proc(IUpdate4*, Int16*, HRESULT)
    put_is_hidden : Proc(IUpdate4*, Int16, HRESULT)
    get_is_installed : Proc(IUpdate4*, Int16*, HRESULT)
    get_is_mandatory : Proc(IUpdate4*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IUpdate4*, Int16*, HRESULT)
    get_languages : Proc(IUpdate4*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IUpdate4*, Float64*, HRESULT)
    get_max_download_size : Proc(IUpdate4*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IUpdate4*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IUpdate4*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IUpdate4*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IUpdate4*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IUpdate4*, Int32*, HRESULT)
    get_recommended_memory : Proc(IUpdate4*, Int32*, HRESULT)
    get_release_notes : Proc(IUpdate4*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IUpdate4*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IUpdate4*, IStringCollection*, HRESULT)
    get_support_url : Proc(IUpdate4*, UInt8**, HRESULT)
    get_type : Proc(IUpdate4*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IUpdate4*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IUpdate4*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IUpdate4*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IUpdate4*, IStringCollection*, HRESULT)
    accept_eula : Proc(IUpdate4*, HRESULT)
    get_deployment_action : Proc(IUpdate4*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IUpdate4*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IUpdate4*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IUpdate4*, IUpdateDownloadContentCollection*, HRESULT)
    get_reboot_required : Proc(IUpdate4*, Int16*, HRESULT)
    get_is_present : Proc(IUpdate4*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IUpdate4*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IUpdate4*, IStringCollection, HRESULT)
    get_browse_only : Proc(IUpdate4*, Int16*, HRESULT)
    get_per_user : Proc(IUpdate4*, Int16*, HRESULT)
  end

  IUpdate4_GUID = LibC::GUID.new("27e94b0d-5139-49a2-9a61-93522dc54652")
  CLSID_IUpdate4 = "27e94b0d-5139-49a2-9a61-93522dc54652"
  struct IUpdate4
    lpVtbl : IUpdate4VTbl*
  end

  struct IUpdate5VTbl
    query_interface : Proc(IUpdate5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdate5*, UInt32)
    release : Proc(IUpdate5*, UInt32)
    get_type_info_count : Proc(IUpdate5*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdate5*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdate5*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdate5*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IUpdate5*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IUpdate5*, Int16*, HRESULT)
    get_bundled_updates : Proc(IUpdate5*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IUpdate5*, Int16*, HRESULT)
    get_categories : Proc(IUpdate5*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IUpdate5*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IUpdate5*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IUpdate5*, Int16*, HRESULT)
    get_description : Proc(IUpdate5*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IUpdate5*, Int16*, HRESULT)
    get_eula_text : Proc(IUpdate5*, UInt8**, HRESULT)
    get_handler_id : Proc(IUpdate5*, UInt8**, HRESULT)
    get_identity : Proc(IUpdate5*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IUpdate5*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IUpdate5*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IUpdate5*, Int16*, HRESULT)
    get_is_downloaded : Proc(IUpdate5*, Int16*, HRESULT)
    get_is_hidden : Proc(IUpdate5*, Int16*, HRESULT)
    put_is_hidden : Proc(IUpdate5*, Int16, HRESULT)
    get_is_installed : Proc(IUpdate5*, Int16*, HRESULT)
    get_is_mandatory : Proc(IUpdate5*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IUpdate5*, Int16*, HRESULT)
    get_languages : Proc(IUpdate5*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IUpdate5*, Float64*, HRESULT)
    get_max_download_size : Proc(IUpdate5*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IUpdate5*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IUpdate5*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IUpdate5*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IUpdate5*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IUpdate5*, Int32*, HRESULT)
    get_recommended_memory : Proc(IUpdate5*, Int32*, HRESULT)
    get_release_notes : Proc(IUpdate5*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IUpdate5*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IUpdate5*, IStringCollection*, HRESULT)
    get_support_url : Proc(IUpdate5*, UInt8**, HRESULT)
    get_type : Proc(IUpdate5*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IUpdate5*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IUpdate5*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IUpdate5*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IUpdate5*, IStringCollection*, HRESULT)
    accept_eula : Proc(IUpdate5*, HRESULT)
    get_deployment_action : Proc(IUpdate5*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IUpdate5*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IUpdate5*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IUpdate5*, IUpdateDownloadContentCollection*, HRESULT)
    get_reboot_required : Proc(IUpdate5*, Int16*, HRESULT)
    get_is_present : Proc(IUpdate5*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IUpdate5*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IUpdate5*, IStringCollection, HRESULT)
    get_browse_only : Proc(IUpdate5*, Int16*, HRESULT)
    get_per_user : Proc(IUpdate5*, Int16*, HRESULT)
    get_auto_selection : Proc(IUpdate5*, AutoSelectionMode*, HRESULT)
    get_auto_download : Proc(IUpdate5*, AutoDownloadMode*, HRESULT)
  end

  IUpdate5_GUID = LibC::GUID.new("c1c2f21a-d2f4-4902-b5c6-8a081c19a890")
  CLSID_IUpdate5 = "c1c2f21a-d2f4-4902-b5c6-8a081c19a890"
  struct IUpdate5
    lpVtbl : IUpdate5VTbl*
  end

  struct IWindowsDriverUpdate2VTbl
    query_interface : Proc(IWindowsDriverUpdate2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdate2*, UInt32)
    release : Proc(IWindowsDriverUpdate2*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdate2*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdate2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdate2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdate2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_bundled_updates : Proc(IWindowsDriverUpdate2*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_categories : Proc(IWindowsDriverUpdate2*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IWindowsDriverUpdate2*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_description : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_eula_text : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_handler_id : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_identity : Proc(IWindowsDriverUpdate2*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IWindowsDriverUpdate2*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IWindowsDriverUpdate2*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_is_downloaded : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_is_hidden : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    put_is_hidden : Proc(IWindowsDriverUpdate2*, Int16, HRESULT)
    get_is_installed : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_is_mandatory : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_languages : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IWindowsDriverUpdate2*, Float64*, HRESULT)
    get_max_download_size : Proc(IWindowsDriverUpdate2*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IWindowsDriverUpdate2*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IWindowsDriverUpdate2*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IWindowsDriverUpdate2*, Int32*, HRESULT)
    get_recommended_memory : Proc(IWindowsDriverUpdate2*, Int32*, HRESULT)
    get_release_notes : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    get_support_url : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_type : Proc(IWindowsDriverUpdate2*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IWindowsDriverUpdate2*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    accept_eula : Proc(IWindowsDriverUpdate2*, HRESULT)
    get_deployment_action : Proc(IWindowsDriverUpdate2*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IWindowsDriverUpdate2*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IWindowsDriverUpdate2*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IWindowsDriverUpdate2*, IUpdateDownloadContentCollection*, HRESULT)
    get_driver_class : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_driver_hardware_id : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_driver_manufacturer : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_driver_model : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_driver_provider : Proc(IWindowsDriverUpdate2*, UInt8**, HRESULT)
    get_driver_ver_date : Proc(IWindowsDriverUpdate2*, Float64*, HRESULT)
    get_device_problem_number : Proc(IWindowsDriverUpdate2*, Int32*, HRESULT)
    get_device_status : Proc(IWindowsDriverUpdate2*, Int32*, HRESULT)
    get_reboot_required : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_is_present : Proc(IWindowsDriverUpdate2*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IWindowsDriverUpdate2*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IWindowsDriverUpdate2*, IStringCollection, HRESULT)
  end

  IWindowsDriverUpdate2_GUID = LibC::GUID.new("615c4269-7a48-43bd-96b7-bf6ca27d6c3e")
  CLSID_IWindowsDriverUpdate2 = "615c4269-7a48-43bd-96b7-bf6ca27d6c3e"
  struct IWindowsDriverUpdate2
    lpVtbl : IWindowsDriverUpdate2VTbl*
  end

  struct IWindowsDriverUpdate3VTbl
    query_interface : Proc(IWindowsDriverUpdate3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdate3*, UInt32)
    release : Proc(IWindowsDriverUpdate3*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdate3*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdate3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdate3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdate3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_bundled_updates : Proc(IWindowsDriverUpdate3*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_categories : Proc(IWindowsDriverUpdate3*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IWindowsDriverUpdate3*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_description : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_eula_text : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_handler_id : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_identity : Proc(IWindowsDriverUpdate3*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IWindowsDriverUpdate3*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IWindowsDriverUpdate3*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_is_downloaded : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_is_hidden : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    put_is_hidden : Proc(IWindowsDriverUpdate3*, Int16, HRESULT)
    get_is_installed : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_is_mandatory : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_languages : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IWindowsDriverUpdate3*, Float64*, HRESULT)
    get_max_download_size : Proc(IWindowsDriverUpdate3*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IWindowsDriverUpdate3*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IWindowsDriverUpdate3*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IWindowsDriverUpdate3*, Int32*, HRESULT)
    get_recommended_memory : Proc(IWindowsDriverUpdate3*, Int32*, HRESULT)
    get_release_notes : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    get_support_url : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_type : Proc(IWindowsDriverUpdate3*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IWindowsDriverUpdate3*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    accept_eula : Proc(IWindowsDriverUpdate3*, HRESULT)
    get_deployment_action : Proc(IWindowsDriverUpdate3*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IWindowsDriverUpdate3*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IWindowsDriverUpdate3*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IWindowsDriverUpdate3*, IUpdateDownloadContentCollection*, HRESULT)
    get_driver_class : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_driver_hardware_id : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_driver_manufacturer : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_driver_model : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_driver_provider : Proc(IWindowsDriverUpdate3*, UInt8**, HRESULT)
    get_driver_ver_date : Proc(IWindowsDriverUpdate3*, Float64*, HRESULT)
    get_device_problem_number : Proc(IWindowsDriverUpdate3*, Int32*, HRESULT)
    get_device_status : Proc(IWindowsDriverUpdate3*, Int32*, HRESULT)
    get_reboot_required : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_is_present : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IWindowsDriverUpdate3*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IWindowsDriverUpdate3*, IStringCollection, HRESULT)
    get_browse_only : Proc(IWindowsDriverUpdate3*, Int16*, HRESULT)
  end

  IWindowsDriverUpdate3_GUID = LibC::GUID.new("49ebd502-4a96-41bd-9e3e-4c5057f4250c")
  CLSID_IWindowsDriverUpdate3 = "49ebd502-4a96-41bd-9e3e-4c5057f4250c"
  struct IWindowsDriverUpdate3
    lpVtbl : IWindowsDriverUpdate3VTbl*
  end

  struct IWindowsDriverUpdateEntryVTbl
    query_interface : Proc(IWindowsDriverUpdateEntry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdateEntry*, UInt32)
    release : Proc(IWindowsDriverUpdateEntry*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdateEntry*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdateEntry*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdateEntry*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdateEntry*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_driver_class : Proc(IWindowsDriverUpdateEntry*, UInt8**, HRESULT)
    get_driver_hardware_id : Proc(IWindowsDriverUpdateEntry*, UInt8**, HRESULT)
    get_driver_manufacturer : Proc(IWindowsDriverUpdateEntry*, UInt8**, HRESULT)
    get_driver_model : Proc(IWindowsDriverUpdateEntry*, UInt8**, HRESULT)
    get_driver_provider : Proc(IWindowsDriverUpdateEntry*, UInt8**, HRESULT)
    get_driver_ver_date : Proc(IWindowsDriverUpdateEntry*, Float64*, HRESULT)
    get_device_problem_number : Proc(IWindowsDriverUpdateEntry*, Int32*, HRESULT)
    get_device_status : Proc(IWindowsDriverUpdateEntry*, Int32*, HRESULT)
  end

  IWindowsDriverUpdateEntry_GUID = LibC::GUID.new("ed8bfe40-a60b-42ea-9652-817dfcfa23ec")
  CLSID_IWindowsDriverUpdateEntry = "ed8bfe40-a60b-42ea-9652-817dfcfa23ec"
  struct IWindowsDriverUpdateEntry
    lpVtbl : IWindowsDriverUpdateEntryVTbl*
  end

  struct IWindowsDriverUpdateEntryCollectionVTbl
    query_interface : Proc(IWindowsDriverUpdateEntryCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdateEntryCollection*, UInt32)
    release : Proc(IWindowsDriverUpdateEntryCollection*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdateEntryCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdateEntryCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdateEntryCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdateEntryCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IWindowsDriverUpdateEntryCollection*, Int32, IWindowsDriverUpdateEntry*, HRESULT)
    get__new_enum : Proc(IWindowsDriverUpdateEntryCollection*, IUnknown*, HRESULT)
    get_count : Proc(IWindowsDriverUpdateEntryCollection*, Int32*, HRESULT)
  end

  IWindowsDriverUpdateEntryCollection_GUID = LibC::GUID.new("0d521700-a372-4bef-828b-3d00c10adebd")
  CLSID_IWindowsDriverUpdateEntryCollection = "0d521700-a372-4bef-828b-3d00c10adebd"
  struct IWindowsDriverUpdateEntryCollection
    lpVtbl : IWindowsDriverUpdateEntryCollectionVTbl*
  end

  struct IWindowsDriverUpdate4VTbl
    query_interface : Proc(IWindowsDriverUpdate4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdate4*, UInt32)
    release : Proc(IWindowsDriverUpdate4*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdate4*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdate4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdate4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdate4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_bundled_updates : Proc(IWindowsDriverUpdate4*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_categories : Proc(IWindowsDriverUpdate4*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IWindowsDriverUpdate4*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_description : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_eula_text : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_handler_id : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_identity : Proc(IWindowsDriverUpdate4*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IWindowsDriverUpdate4*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IWindowsDriverUpdate4*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_is_downloaded : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_is_hidden : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    put_is_hidden : Proc(IWindowsDriverUpdate4*, Int16, HRESULT)
    get_is_installed : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_is_mandatory : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_languages : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IWindowsDriverUpdate4*, Float64*, HRESULT)
    get_max_download_size : Proc(IWindowsDriverUpdate4*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IWindowsDriverUpdate4*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IWindowsDriverUpdate4*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IWindowsDriverUpdate4*, Int32*, HRESULT)
    get_recommended_memory : Proc(IWindowsDriverUpdate4*, Int32*, HRESULT)
    get_release_notes : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    get_support_url : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_type : Proc(IWindowsDriverUpdate4*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IWindowsDriverUpdate4*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    accept_eula : Proc(IWindowsDriverUpdate4*, HRESULT)
    get_deployment_action : Proc(IWindowsDriverUpdate4*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IWindowsDriverUpdate4*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IWindowsDriverUpdate4*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IWindowsDriverUpdate4*, IUpdateDownloadContentCollection*, HRESULT)
    get_driver_class : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_driver_hardware_id : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_driver_manufacturer : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_driver_model : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_driver_provider : Proc(IWindowsDriverUpdate4*, UInt8**, HRESULT)
    get_driver_ver_date : Proc(IWindowsDriverUpdate4*, Float64*, HRESULT)
    get_device_problem_number : Proc(IWindowsDriverUpdate4*, Int32*, HRESULT)
    get_device_status : Proc(IWindowsDriverUpdate4*, Int32*, HRESULT)
    get_reboot_required : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_is_present : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IWindowsDriverUpdate4*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IWindowsDriverUpdate4*, IStringCollection, HRESULT)
    get_browse_only : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
    get_windows_driver_update_entries : Proc(IWindowsDriverUpdate4*, IWindowsDriverUpdateEntryCollection*, HRESULT)
    get_per_user : Proc(IWindowsDriverUpdate4*, Int16*, HRESULT)
  end

  IWindowsDriverUpdate4_GUID = LibC::GUID.new("004c6a2b-0c19-4c69-9f5c-a269b2560db9")
  CLSID_IWindowsDriverUpdate4 = "004c6a2b-0c19-4c69-9f5c-a269b2560db9"
  struct IWindowsDriverUpdate4
    lpVtbl : IWindowsDriverUpdate4VTbl*
  end

  struct IWindowsDriverUpdate5VTbl
    query_interface : Proc(IWindowsDriverUpdate5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDriverUpdate5*, UInt32)
    release : Proc(IWindowsDriverUpdate5*, UInt32)
    get_type_info_count : Proc(IWindowsDriverUpdate5*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsDriverUpdate5*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsDriverUpdate5*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsDriverUpdate5*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_title : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_auto_select_on_web_sites : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_bundled_updates : Proc(IWindowsDriverUpdate5*, IUpdateCollection*, HRESULT)
    get_can_require_source : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_categories : Proc(IWindowsDriverUpdate5*, ICategoryCollection*, HRESULT)
    get_deadline : Proc(IWindowsDriverUpdate5*, VARIANT*, HRESULT)
    get_delta_compressed_content_available : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_delta_compressed_content_preferred : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_description : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_eula_accepted : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_eula_text : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_handler_id : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_identity : Proc(IWindowsDriverUpdate5*, IUpdateIdentity*, HRESULT)
    get_image : Proc(IWindowsDriverUpdate5*, IImageInformation*, HRESULT)
    get_installation_behavior : Proc(IWindowsDriverUpdate5*, IInstallationBehavior*, HRESULT)
    get_is_beta : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_is_downloaded : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_is_hidden : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    put_is_hidden : Proc(IWindowsDriverUpdate5*, Int16, HRESULT)
    get_is_installed : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_is_mandatory : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_is_uninstallable : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_languages : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    get_last_deployment_change_time : Proc(IWindowsDriverUpdate5*, Float64*, HRESULT)
    get_max_download_size : Proc(IWindowsDriverUpdate5*, DECIMAL*, HRESULT)
    get_min_download_size : Proc(IWindowsDriverUpdate5*, DECIMAL*, HRESULT)
    get_more_info_urls : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    get_msrc_severity : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_recommended_cpu_speed : Proc(IWindowsDriverUpdate5*, Int32*, HRESULT)
    get_recommended_hard_disk_space : Proc(IWindowsDriverUpdate5*, Int32*, HRESULT)
    get_recommended_memory : Proc(IWindowsDriverUpdate5*, Int32*, HRESULT)
    get_release_notes : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_security_bulletin_i_ds : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    get_superseded_update_i_ds : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    get_support_url : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_type : Proc(IWindowsDriverUpdate5*, UpdateType*, HRESULT)
    get_uninstallation_notes : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_uninstallation_behavior : Proc(IWindowsDriverUpdate5*, IInstallationBehavior*, HRESULT)
    get_uninstallation_steps : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    get_kb_article_i_ds : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    accept_eula : Proc(IWindowsDriverUpdate5*, HRESULT)
    get_deployment_action : Proc(IWindowsDriverUpdate5*, DeploymentAction*, HRESULT)
    copy_from_cache : Proc(IWindowsDriverUpdate5*, UInt8*, Int16, HRESULT)
    get_download_priority : Proc(IWindowsDriverUpdate5*, DownloadPriority*, HRESULT)
    get_download_contents : Proc(IWindowsDriverUpdate5*, IUpdateDownloadContentCollection*, HRESULT)
    get_driver_class : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_driver_hardware_id : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_driver_manufacturer : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_driver_model : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_driver_provider : Proc(IWindowsDriverUpdate5*, UInt8**, HRESULT)
    get_driver_ver_date : Proc(IWindowsDriverUpdate5*, Float64*, HRESULT)
    get_device_problem_number : Proc(IWindowsDriverUpdate5*, Int32*, HRESULT)
    get_device_status : Proc(IWindowsDriverUpdate5*, Int32*, HRESULT)
    get_reboot_required : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_is_present : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_cve_i_ds : Proc(IWindowsDriverUpdate5*, IStringCollection*, HRESULT)
    copy_to_cache : Proc(IWindowsDriverUpdate5*, IStringCollection, HRESULT)
    get_browse_only : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_windows_driver_update_entries : Proc(IWindowsDriverUpdate5*, IWindowsDriverUpdateEntryCollection*, HRESULT)
    get_per_user : Proc(IWindowsDriverUpdate5*, Int16*, HRESULT)
    get_auto_selection : Proc(IWindowsDriverUpdate5*, AutoSelectionMode*, HRESULT)
    get_auto_download : Proc(IWindowsDriverUpdate5*, AutoDownloadMode*, HRESULT)
  end

  IWindowsDriverUpdate5_GUID = LibC::GUID.new("70cf5c82-8642-42bb-9dbc-0cfd263c6c4f")
  CLSID_IWindowsDriverUpdate5 = "70cf5c82-8642-42bb-9dbc-0cfd263c6c4f"
  struct IWindowsDriverUpdate5
    lpVtbl : IWindowsDriverUpdate5VTbl*
  end

  struct IUpdateCollectionVTbl
    query_interface : Proc(IUpdateCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateCollection*, UInt32)
    release : Proc(IUpdateCollection*, UInt32)
    get_type_info_count : Proc(IUpdateCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IUpdateCollection*, Int32, IUpdate*, HRESULT)
    put_item : Proc(IUpdateCollection*, Int32, IUpdate, HRESULT)
    get__new_enum : Proc(IUpdateCollection*, IUnknown*, HRESULT)
    get_count : Proc(IUpdateCollection*, Int32*, HRESULT)
    get_read_only : Proc(IUpdateCollection*, Int16*, HRESULT)
    add : Proc(IUpdateCollection*, IUpdate, Int32*, HRESULT)
    clear : Proc(IUpdateCollection*, HRESULT)
    copy : Proc(IUpdateCollection*, IUpdateCollection*, HRESULT)
    insert : Proc(IUpdateCollection*, Int32, IUpdate, HRESULT)
    remove_at : Proc(IUpdateCollection*, Int32, HRESULT)
  end

  IUpdateCollection_GUID = LibC::GUID.new("07f7438c-7709-4ca5-b518-91279288134e")
  CLSID_IUpdateCollection = "07f7438c-7709-4ca5-b518-91279288134e"
  struct IUpdateCollection
    lpVtbl : IUpdateCollectionVTbl*
  end

  struct IUpdateExceptionVTbl
    query_interface : Proc(IUpdateException*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateException*, UInt32)
    release : Proc(IUpdateException*, UInt32)
    get_type_info_count : Proc(IUpdateException*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateException*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateException*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateException*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_message : Proc(IUpdateException*, UInt8**, HRESULT)
    get_h_result : Proc(IUpdateException*, Int32*, HRESULT)
    get_context : Proc(IUpdateException*, UpdateExceptionContext*, HRESULT)
  end

  IUpdateException_GUID = LibC::GUID.new("a376dd5e-09d4-427f-af7c-fed5b6e1c1d6")
  CLSID_IUpdateException = "a376dd5e-09d4-427f-af7c-fed5b6e1c1d6"
  struct IUpdateException
    lpVtbl : IUpdateExceptionVTbl*
  end

  struct IInvalidProductLicenseExceptionVTbl
    query_interface : Proc(IInvalidProductLicenseException*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInvalidProductLicenseException*, UInt32)
    release : Proc(IInvalidProductLicenseException*, UInt32)
    get_type_info_count : Proc(IInvalidProductLicenseException*, UInt32*, HRESULT)
    get_type_info : Proc(IInvalidProductLicenseException*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInvalidProductLicenseException*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInvalidProductLicenseException*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_message : Proc(IInvalidProductLicenseException*, UInt8**, HRESULT)
    get_h_result : Proc(IInvalidProductLicenseException*, Int32*, HRESULT)
    get_context : Proc(IInvalidProductLicenseException*, UpdateExceptionContext*, HRESULT)
    get_product : Proc(IInvalidProductLicenseException*, UInt8**, HRESULT)
  end

  IInvalidProductLicenseException_GUID = LibC::GUID.new("a37d00f5-7bb0-4953-b414-f9e98326f2e8")
  CLSID_IInvalidProductLicenseException = "a37d00f5-7bb0-4953-b414-f9e98326f2e8"
  struct IInvalidProductLicenseException
    lpVtbl : IInvalidProductLicenseExceptionVTbl*
  end

  struct IUpdateExceptionCollectionVTbl
    query_interface : Proc(IUpdateExceptionCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateExceptionCollection*, UInt32)
    release : Proc(IUpdateExceptionCollection*, UInt32)
    get_type_info_count : Proc(IUpdateExceptionCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateExceptionCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateExceptionCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateExceptionCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IUpdateExceptionCollection*, Int32, IUpdateException*, HRESULT)
    get__new_enum : Proc(IUpdateExceptionCollection*, IUnknown*, HRESULT)
    get_count : Proc(IUpdateExceptionCollection*, Int32*, HRESULT)
  end

  IUpdateExceptionCollection_GUID = LibC::GUID.new("503626a3-8e14-4729-9355-0fe664bd2321")
  CLSID_IUpdateExceptionCollection = "503626a3-8e14-4729-9355-0fe664bd2321"
  struct IUpdateExceptionCollection
    lpVtbl : IUpdateExceptionCollectionVTbl*
  end

  struct ISearchResultVTbl
    query_interface : Proc(ISearchResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISearchResult*, UInt32)
    release : Proc(ISearchResult*, UInt32)
    get_type_info_count : Proc(ISearchResult*, UInt32*, HRESULT)
    get_type_info : Proc(ISearchResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISearchResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISearchResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_result_code : Proc(ISearchResult*, OperationResultCode*, HRESULT)
    get_root_categories : Proc(ISearchResult*, ICategoryCollection*, HRESULT)
    get_updates : Proc(ISearchResult*, IUpdateCollection*, HRESULT)
    get_warnings : Proc(ISearchResult*, IUpdateExceptionCollection*, HRESULT)
  end

  ISearchResult_GUID = LibC::GUID.new("d40cff62-e08c-4498-941a-01e25f0fd33c")
  CLSID_ISearchResult = "d40cff62-e08c-4498-941a-01e25f0fd33c"
  struct ISearchResult
    lpVtbl : ISearchResultVTbl*
  end

  struct ISearchJobVTbl
    query_interface : Proc(ISearchJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISearchJob*, UInt32)
    release : Proc(ISearchJob*, UInt32)
    get_type_info_count : Proc(ISearchJob*, UInt32*, HRESULT)
    get_type_info : Proc(ISearchJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISearchJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISearchJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_async_state : Proc(ISearchJob*, VARIANT*, HRESULT)
    get_is_completed : Proc(ISearchJob*, Int16*, HRESULT)
    clean_up : Proc(ISearchJob*, HRESULT)
    request_abort : Proc(ISearchJob*, HRESULT)
  end

  ISearchJob_GUID = LibC::GUID.new("7366ea16-7a1a-4ea2-b042-973d3e9cd99b")
  CLSID_ISearchJob = "7366ea16-7a1a-4ea2-b042-973d3e9cd99b"
  struct ISearchJob
    lpVtbl : ISearchJobVTbl*
  end

  struct ISearchCompletedCallbackArgsVTbl
    query_interface : Proc(ISearchCompletedCallbackArgs*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISearchCompletedCallbackArgs*, UInt32)
    release : Proc(ISearchCompletedCallbackArgs*, UInt32)
    get_type_info_count : Proc(ISearchCompletedCallbackArgs*, UInt32*, HRESULT)
    get_type_info : Proc(ISearchCompletedCallbackArgs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISearchCompletedCallbackArgs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISearchCompletedCallbackArgs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  ISearchCompletedCallbackArgs_GUID = LibC::GUID.new("a700a634-2850-4c47-938a-9e4b6e5af9a6")
  CLSID_ISearchCompletedCallbackArgs = "a700a634-2850-4c47-938a-9e4b6e5af9a6"
  struct ISearchCompletedCallbackArgs
    lpVtbl : ISearchCompletedCallbackArgsVTbl*
  end

  struct ISearchCompletedCallbackVTbl
    query_interface : Proc(ISearchCompletedCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISearchCompletedCallback*, UInt32)
    release : Proc(ISearchCompletedCallback*, UInt32)
    invoke : Proc(ISearchCompletedCallback*, ISearchJob, ISearchCompletedCallbackArgs, HRESULT)
  end

  ISearchCompletedCallback_GUID = LibC::GUID.new("88aee058-d4b0-4725-a2f1-814a67ae964c")
  CLSID_ISearchCompletedCallback = "88aee058-d4b0-4725-a2f1-814a67ae964c"
  struct ISearchCompletedCallback
    lpVtbl : ISearchCompletedCallbackVTbl*
  end

  struct IUpdateHistoryEntryVTbl
    query_interface : Proc(IUpdateHistoryEntry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateHistoryEntry*, UInt32)
    release : Proc(IUpdateHistoryEntry*, UInt32)
    get_type_info_count : Proc(IUpdateHistoryEntry*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateHistoryEntry*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateHistoryEntry*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateHistoryEntry*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_operation : Proc(IUpdateHistoryEntry*, UpdateOperation*, HRESULT)
    get_result_code : Proc(IUpdateHistoryEntry*, OperationResultCode*, HRESULT)
    get_h_result : Proc(IUpdateHistoryEntry*, Int32*, HRESULT)
    get_date : Proc(IUpdateHistoryEntry*, Float64*, HRESULT)
    get_update_identity : Proc(IUpdateHistoryEntry*, IUpdateIdentity*, HRESULT)
    get_title : Proc(IUpdateHistoryEntry*, UInt8**, HRESULT)
    get_description : Proc(IUpdateHistoryEntry*, UInt8**, HRESULT)
    get_unmapped_result_code : Proc(IUpdateHistoryEntry*, Int32*, HRESULT)
    get_client_application_id : Proc(IUpdateHistoryEntry*, UInt8**, HRESULT)
    get_server_selection : Proc(IUpdateHistoryEntry*, ServerSelection*, HRESULT)
    get_service_id : Proc(IUpdateHistoryEntry*, UInt8**, HRESULT)
    get_uninstallation_steps : Proc(IUpdateHistoryEntry*, IStringCollection*, HRESULT)
    get_uninstallation_notes : Proc(IUpdateHistoryEntry*, UInt8**, HRESULT)
    get_support_url : Proc(IUpdateHistoryEntry*, UInt8**, HRESULT)
  end

  IUpdateHistoryEntry_GUID = LibC::GUID.new("be56a644-af0e-4e0e-a311-c1d8e695cbff")
  CLSID_IUpdateHistoryEntry = "be56a644-af0e-4e0e-a311-c1d8e695cbff"
  struct IUpdateHistoryEntry
    lpVtbl : IUpdateHistoryEntryVTbl*
  end

  struct IUpdateHistoryEntry2VTbl
    query_interface : Proc(IUpdateHistoryEntry2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateHistoryEntry2*, UInt32)
    release : Proc(IUpdateHistoryEntry2*, UInt32)
    get_type_info_count : Proc(IUpdateHistoryEntry2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateHistoryEntry2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateHistoryEntry2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateHistoryEntry2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_operation : Proc(IUpdateHistoryEntry2*, UpdateOperation*, HRESULT)
    get_result_code : Proc(IUpdateHistoryEntry2*, OperationResultCode*, HRESULT)
    get_h_result : Proc(IUpdateHistoryEntry2*, Int32*, HRESULT)
    get_date : Proc(IUpdateHistoryEntry2*, Float64*, HRESULT)
    get_update_identity : Proc(IUpdateHistoryEntry2*, IUpdateIdentity*, HRESULT)
    get_title : Proc(IUpdateHistoryEntry2*, UInt8**, HRESULT)
    get_description : Proc(IUpdateHistoryEntry2*, UInt8**, HRESULT)
    get_unmapped_result_code : Proc(IUpdateHistoryEntry2*, Int32*, HRESULT)
    get_client_application_id : Proc(IUpdateHistoryEntry2*, UInt8**, HRESULT)
    get_server_selection : Proc(IUpdateHistoryEntry2*, ServerSelection*, HRESULT)
    get_service_id : Proc(IUpdateHistoryEntry2*, UInt8**, HRESULT)
    get_uninstallation_steps : Proc(IUpdateHistoryEntry2*, IStringCollection*, HRESULT)
    get_uninstallation_notes : Proc(IUpdateHistoryEntry2*, UInt8**, HRESULT)
    get_support_url : Proc(IUpdateHistoryEntry2*, UInt8**, HRESULT)
    get_categories : Proc(IUpdateHistoryEntry2*, ICategoryCollection*, HRESULT)
  end

  IUpdateHistoryEntry2_GUID = LibC::GUID.new("c2bfb780-4539-4132-ab8c-0a8772013ab6")
  CLSID_IUpdateHistoryEntry2 = "c2bfb780-4539-4132-ab8c-0a8772013ab6"
  struct IUpdateHistoryEntry2
    lpVtbl : IUpdateHistoryEntry2VTbl*
  end

  struct IUpdateHistoryEntryCollectionVTbl
    query_interface : Proc(IUpdateHistoryEntryCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateHistoryEntryCollection*, UInt32)
    release : Proc(IUpdateHistoryEntryCollection*, UInt32)
    get_type_info_count : Proc(IUpdateHistoryEntryCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateHistoryEntryCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateHistoryEntryCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateHistoryEntryCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IUpdateHistoryEntryCollection*, Int32, IUpdateHistoryEntry*, HRESULT)
    get__new_enum : Proc(IUpdateHistoryEntryCollection*, IUnknown*, HRESULT)
    get_count : Proc(IUpdateHistoryEntryCollection*, Int32*, HRESULT)
  end

  IUpdateHistoryEntryCollection_GUID = LibC::GUID.new("a7f04f3c-a290-435b-aadf-a116c3357a5c")
  CLSID_IUpdateHistoryEntryCollection = "a7f04f3c-a290-435b-aadf-a116c3357a5c"
  struct IUpdateHistoryEntryCollection
    lpVtbl : IUpdateHistoryEntryCollectionVTbl*
  end

  struct IUpdateSearcherVTbl
    query_interface : Proc(IUpdateSearcher*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateSearcher*, UInt32)
    release : Proc(IUpdateSearcher*, UInt32)
    get_type_info_count : Proc(IUpdateSearcher*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateSearcher*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateSearcher*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateSearcher*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_can_automatically_upgrade_service : Proc(IUpdateSearcher*, Int16*, HRESULT)
    put_can_automatically_upgrade_service : Proc(IUpdateSearcher*, Int16, HRESULT)
    get_client_application_id : Proc(IUpdateSearcher*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateSearcher*, UInt8*, HRESULT)
    get_include_potentially_superseded_updates : Proc(IUpdateSearcher*, Int16*, HRESULT)
    put_include_potentially_superseded_updates : Proc(IUpdateSearcher*, Int16, HRESULT)
    get_server_selection : Proc(IUpdateSearcher*, ServerSelection*, HRESULT)
    put_server_selection : Proc(IUpdateSearcher*, ServerSelection, HRESULT)
    begin_search : Proc(IUpdateSearcher*, UInt8*, IUnknown, VARIANT, ISearchJob*, HRESULT)
    end_search : Proc(IUpdateSearcher*, ISearchJob, ISearchResult*, HRESULT)
    escape_string : Proc(IUpdateSearcher*, UInt8*, UInt8**, HRESULT)
    query_history : Proc(IUpdateSearcher*, Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)
    search : Proc(IUpdateSearcher*, UInt8*, ISearchResult*, HRESULT)
    get_online : Proc(IUpdateSearcher*, Int16*, HRESULT)
    put_online : Proc(IUpdateSearcher*, Int16, HRESULT)
    get_total_history_count : Proc(IUpdateSearcher*, Int32*, HRESULT)
    get_service_id : Proc(IUpdateSearcher*, UInt8**, HRESULT)
    put_service_id : Proc(IUpdateSearcher*, UInt8*, HRESULT)
  end

  IUpdateSearcher_GUID = LibC::GUID.new("8f45abf1-f9ae-4b95-a933-f0f66e5056ea")
  CLSID_IUpdateSearcher = "8f45abf1-f9ae-4b95-a933-f0f66e5056ea"
  struct IUpdateSearcher
    lpVtbl : IUpdateSearcherVTbl*
  end

  struct IUpdateSearcher2VTbl
    query_interface : Proc(IUpdateSearcher2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateSearcher2*, UInt32)
    release : Proc(IUpdateSearcher2*, UInt32)
    get_type_info_count : Proc(IUpdateSearcher2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateSearcher2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateSearcher2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateSearcher2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_can_automatically_upgrade_service : Proc(IUpdateSearcher2*, Int16*, HRESULT)
    put_can_automatically_upgrade_service : Proc(IUpdateSearcher2*, Int16, HRESULT)
    get_client_application_id : Proc(IUpdateSearcher2*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateSearcher2*, UInt8*, HRESULT)
    get_include_potentially_superseded_updates : Proc(IUpdateSearcher2*, Int16*, HRESULT)
    put_include_potentially_superseded_updates : Proc(IUpdateSearcher2*, Int16, HRESULT)
    get_server_selection : Proc(IUpdateSearcher2*, ServerSelection*, HRESULT)
    put_server_selection : Proc(IUpdateSearcher2*, ServerSelection, HRESULT)
    begin_search : Proc(IUpdateSearcher2*, UInt8*, IUnknown, VARIANT, ISearchJob*, HRESULT)
    end_search : Proc(IUpdateSearcher2*, ISearchJob, ISearchResult*, HRESULT)
    escape_string : Proc(IUpdateSearcher2*, UInt8*, UInt8**, HRESULT)
    query_history : Proc(IUpdateSearcher2*, Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)
    search : Proc(IUpdateSearcher2*, UInt8*, ISearchResult*, HRESULT)
    get_online : Proc(IUpdateSearcher2*, Int16*, HRESULT)
    put_online : Proc(IUpdateSearcher2*, Int16, HRESULT)
    get_total_history_count : Proc(IUpdateSearcher2*, Int32*, HRESULT)
    get_service_id : Proc(IUpdateSearcher2*, UInt8**, HRESULT)
    put_service_id : Proc(IUpdateSearcher2*, UInt8*, HRESULT)
    get_ignore_download_priority : Proc(IUpdateSearcher2*, Int16*, HRESULT)
    put_ignore_download_priority : Proc(IUpdateSearcher2*, Int16, HRESULT)
  end

  IUpdateSearcher2_GUID = LibC::GUID.new("4cbdcb2d-1589-4beb-bd1c-3e582ff0add0")
  CLSID_IUpdateSearcher2 = "4cbdcb2d-1589-4beb-bd1c-3e582ff0add0"
  struct IUpdateSearcher2
    lpVtbl : IUpdateSearcher2VTbl*
  end

  struct IUpdateSearcher3VTbl
    query_interface : Proc(IUpdateSearcher3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateSearcher3*, UInt32)
    release : Proc(IUpdateSearcher3*, UInt32)
    get_type_info_count : Proc(IUpdateSearcher3*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateSearcher3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateSearcher3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateSearcher3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_can_automatically_upgrade_service : Proc(IUpdateSearcher3*, Int16*, HRESULT)
    put_can_automatically_upgrade_service : Proc(IUpdateSearcher3*, Int16, HRESULT)
    get_client_application_id : Proc(IUpdateSearcher3*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateSearcher3*, UInt8*, HRESULT)
    get_include_potentially_superseded_updates : Proc(IUpdateSearcher3*, Int16*, HRESULT)
    put_include_potentially_superseded_updates : Proc(IUpdateSearcher3*, Int16, HRESULT)
    get_server_selection : Proc(IUpdateSearcher3*, ServerSelection*, HRESULT)
    put_server_selection : Proc(IUpdateSearcher3*, ServerSelection, HRESULT)
    begin_search : Proc(IUpdateSearcher3*, UInt8*, IUnknown, VARIANT, ISearchJob*, HRESULT)
    end_search : Proc(IUpdateSearcher3*, ISearchJob, ISearchResult*, HRESULT)
    escape_string : Proc(IUpdateSearcher3*, UInt8*, UInt8**, HRESULT)
    query_history : Proc(IUpdateSearcher3*, Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)
    search : Proc(IUpdateSearcher3*, UInt8*, ISearchResult*, HRESULT)
    get_online : Proc(IUpdateSearcher3*, Int16*, HRESULT)
    put_online : Proc(IUpdateSearcher3*, Int16, HRESULT)
    get_total_history_count : Proc(IUpdateSearcher3*, Int32*, HRESULT)
    get_service_id : Proc(IUpdateSearcher3*, UInt8**, HRESULT)
    put_service_id : Proc(IUpdateSearcher3*, UInt8*, HRESULT)
    get_ignore_download_priority : Proc(IUpdateSearcher3*, Int16*, HRESULT)
    put_ignore_download_priority : Proc(IUpdateSearcher3*, Int16, HRESULT)
    get_search_scope : Proc(IUpdateSearcher3*, SearchScope*, HRESULT)
    put_search_scope : Proc(IUpdateSearcher3*, SearchScope, HRESULT)
  end

  IUpdateSearcher3_GUID = LibC::GUID.new("04c6895d-eaf2-4034-97f3-311de9be413a")
  CLSID_IUpdateSearcher3 = "04c6895d-eaf2-4034-97f3-311de9be413a"
  struct IUpdateSearcher3
    lpVtbl : IUpdateSearcher3VTbl*
  end

  struct IUpdateDownloadResultVTbl
    query_interface : Proc(IUpdateDownloadResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateDownloadResult*, UInt32)
    release : Proc(IUpdateDownloadResult*, UInt32)
    get_type_info_count : Proc(IUpdateDownloadResult*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateDownloadResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateDownloadResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateDownloadResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_result : Proc(IUpdateDownloadResult*, Int32*, HRESULT)
    get_result_code : Proc(IUpdateDownloadResult*, OperationResultCode*, HRESULT)
  end

  IUpdateDownloadResult_GUID = LibC::GUID.new("bf99af76-b575-42ad-8aa4-33cbb5477af1")
  CLSID_IUpdateDownloadResult = "bf99af76-b575-42ad-8aa4-33cbb5477af1"
  struct IUpdateDownloadResult
    lpVtbl : IUpdateDownloadResultVTbl*
  end

  struct IDownloadResultVTbl
    query_interface : Proc(IDownloadResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadResult*, UInt32)
    release : Proc(IDownloadResult*, UInt32)
    get_type_info_count : Proc(IDownloadResult*, UInt32*, HRESULT)
    get_type_info : Proc(IDownloadResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDownloadResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDownloadResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_result : Proc(IDownloadResult*, Int32*, HRESULT)
    get_result_code : Proc(IDownloadResult*, OperationResultCode*, HRESULT)
    get_update_result : Proc(IDownloadResult*, Int32, IUpdateDownloadResult*, HRESULT)
  end

  IDownloadResult_GUID = LibC::GUID.new("daa4fdd0-4727-4dbe-a1e7-745dca317144")
  CLSID_IDownloadResult = "daa4fdd0-4727-4dbe-a1e7-745dca317144"
  struct IDownloadResult
    lpVtbl : IDownloadResultVTbl*
  end

  struct IDownloadProgressVTbl
    query_interface : Proc(IDownloadProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadProgress*, UInt32)
    release : Proc(IDownloadProgress*, UInt32)
    get_type_info_count : Proc(IDownloadProgress*, UInt32*, HRESULT)
    get_type_info : Proc(IDownloadProgress*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDownloadProgress*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDownloadProgress*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_current_update_bytes_downloaded : Proc(IDownloadProgress*, DECIMAL*, HRESULT)
    get_current_update_bytes_to_download : Proc(IDownloadProgress*, DECIMAL*, HRESULT)
    get_current_update_index : Proc(IDownloadProgress*, Int32*, HRESULT)
    get_percent_complete : Proc(IDownloadProgress*, Int32*, HRESULT)
    get_total_bytes_downloaded : Proc(IDownloadProgress*, DECIMAL*, HRESULT)
    get_total_bytes_to_download : Proc(IDownloadProgress*, DECIMAL*, HRESULT)
    get_update_result : Proc(IDownloadProgress*, Int32, IUpdateDownloadResult*, HRESULT)
    get_current_update_download_phase : Proc(IDownloadProgress*, DownloadPhase*, HRESULT)
    get_current_update_percent_complete : Proc(IDownloadProgress*, Int32*, HRESULT)
  end

  IDownloadProgress_GUID = LibC::GUID.new("d31a5bac-f719-4178-9dbb-5e2cb47fd18a")
  CLSID_IDownloadProgress = "d31a5bac-f719-4178-9dbb-5e2cb47fd18a"
  struct IDownloadProgress
    lpVtbl : IDownloadProgressVTbl*
  end

  struct IDownloadJobVTbl
    query_interface : Proc(IDownloadJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadJob*, UInt32)
    release : Proc(IDownloadJob*, UInt32)
    get_type_info_count : Proc(IDownloadJob*, UInt32*, HRESULT)
    get_type_info : Proc(IDownloadJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDownloadJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDownloadJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_async_state : Proc(IDownloadJob*, VARIANT*, HRESULT)
    get_is_completed : Proc(IDownloadJob*, Int16*, HRESULT)
    get_updates : Proc(IDownloadJob*, IUpdateCollection*, HRESULT)
    clean_up : Proc(IDownloadJob*, HRESULT)
    get_progress : Proc(IDownloadJob*, IDownloadProgress*, HRESULT)
    request_abort : Proc(IDownloadJob*, HRESULT)
  end

  IDownloadJob_GUID = LibC::GUID.new("c574de85-7358-43f6-aae8-8697e62d8ba7")
  CLSID_IDownloadJob = "c574de85-7358-43f6-aae8-8697e62d8ba7"
  struct IDownloadJob
    lpVtbl : IDownloadJobVTbl*
  end

  struct IDownloadCompletedCallbackArgsVTbl
    query_interface : Proc(IDownloadCompletedCallbackArgs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadCompletedCallbackArgs*, UInt32)
    release : Proc(IDownloadCompletedCallbackArgs*, UInt32)
    get_type_info_count : Proc(IDownloadCompletedCallbackArgs*, UInt32*, HRESULT)
    get_type_info : Proc(IDownloadCompletedCallbackArgs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDownloadCompletedCallbackArgs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDownloadCompletedCallbackArgs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IDownloadCompletedCallbackArgs_GUID = LibC::GUID.new("fa565b23-498c-47a0-979d-e7d5b1813360")
  CLSID_IDownloadCompletedCallbackArgs = "fa565b23-498c-47a0-979d-e7d5b1813360"
  struct IDownloadCompletedCallbackArgs
    lpVtbl : IDownloadCompletedCallbackArgsVTbl*
  end

  struct IDownloadCompletedCallbackVTbl
    query_interface : Proc(IDownloadCompletedCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadCompletedCallback*, UInt32)
    release : Proc(IDownloadCompletedCallback*, UInt32)
    invoke : Proc(IDownloadCompletedCallback*, IDownloadJob, IDownloadCompletedCallbackArgs, HRESULT)
  end

  IDownloadCompletedCallback_GUID = LibC::GUID.new("77254866-9f5b-4c8e-b9e2-c77a8530d64b")
  CLSID_IDownloadCompletedCallback = "77254866-9f5b-4c8e-b9e2-c77a8530d64b"
  struct IDownloadCompletedCallback
    lpVtbl : IDownloadCompletedCallbackVTbl*
  end

  struct IDownloadProgressChangedCallbackArgsVTbl
    query_interface : Proc(IDownloadProgressChangedCallbackArgs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadProgressChangedCallbackArgs*, UInt32)
    release : Proc(IDownloadProgressChangedCallbackArgs*, UInt32)
    get_type_info_count : Proc(IDownloadProgressChangedCallbackArgs*, UInt32*, HRESULT)
    get_type_info : Proc(IDownloadProgressChangedCallbackArgs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IDownloadProgressChangedCallbackArgs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IDownloadProgressChangedCallbackArgs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_progress : Proc(IDownloadProgressChangedCallbackArgs*, IDownloadProgress*, HRESULT)
  end

  IDownloadProgressChangedCallbackArgs_GUID = LibC::GUID.new("324ff2c6-4981-4b04-9412-57481745ab24")
  CLSID_IDownloadProgressChangedCallbackArgs = "324ff2c6-4981-4b04-9412-57481745ab24"
  struct IDownloadProgressChangedCallbackArgs
    lpVtbl : IDownloadProgressChangedCallbackArgsVTbl*
  end

  struct IDownloadProgressChangedCallbackVTbl
    query_interface : Proc(IDownloadProgressChangedCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDownloadProgressChangedCallback*, UInt32)
    release : Proc(IDownloadProgressChangedCallback*, UInt32)
    invoke : Proc(IDownloadProgressChangedCallback*, IDownloadJob, IDownloadProgressChangedCallbackArgs, HRESULT)
  end

  IDownloadProgressChangedCallback_GUID = LibC::GUID.new("8c3f1cdd-6173-4591-aebd-a56a53ca77c1")
  CLSID_IDownloadProgressChangedCallback = "8c3f1cdd-6173-4591-aebd-a56a53ca77c1"
  struct IDownloadProgressChangedCallback
    lpVtbl : IDownloadProgressChangedCallbackVTbl*
  end

  struct IUpdateDownloaderVTbl
    query_interface : Proc(IUpdateDownloader*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateDownloader*, UInt32)
    release : Proc(IUpdateDownloader*, UInt32)
    get_type_info_count : Proc(IUpdateDownloader*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateDownloader*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateDownloader*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateDownloader*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateDownloader*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateDownloader*, UInt8*, HRESULT)
    get_is_forced : Proc(IUpdateDownloader*, Int16*, HRESULT)
    put_is_forced : Proc(IUpdateDownloader*, Int16, HRESULT)
    get_priority : Proc(IUpdateDownloader*, DownloadPriority*, HRESULT)
    put_priority : Proc(IUpdateDownloader*, DownloadPriority, HRESULT)
    get_updates : Proc(IUpdateDownloader*, IUpdateCollection*, HRESULT)
    put_updates : Proc(IUpdateDownloader*, IUpdateCollection, HRESULT)
    begin_download : Proc(IUpdateDownloader*, IUnknown, IUnknown, VARIANT, IDownloadJob*, HRESULT)
    download : Proc(IUpdateDownloader*, IDownloadResult*, HRESULT)
    end_download : Proc(IUpdateDownloader*, IDownloadJob, IDownloadResult*, HRESULT)
  end

  IUpdateDownloader_GUID = LibC::GUID.new("68f1c6f9-7ecc-4666-a464-247fe12496c3")
  CLSID_IUpdateDownloader = "68f1c6f9-7ecc-4666-a464-247fe12496c3"
  struct IUpdateDownloader
    lpVtbl : IUpdateDownloaderVTbl*
  end

  struct IUpdateInstallationResultVTbl
    query_interface : Proc(IUpdateInstallationResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateInstallationResult*, UInt32)
    release : Proc(IUpdateInstallationResult*, UInt32)
    get_type_info_count : Proc(IUpdateInstallationResult*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateInstallationResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateInstallationResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateInstallationResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_result : Proc(IUpdateInstallationResult*, Int32*, HRESULT)
    get_reboot_required : Proc(IUpdateInstallationResult*, Int16*, HRESULT)
    get_result_code : Proc(IUpdateInstallationResult*, OperationResultCode*, HRESULT)
  end

  IUpdateInstallationResult_GUID = LibC::GUID.new("d940f0f8-3cbb-4fd0-993f-471e7f2328ad")
  CLSID_IUpdateInstallationResult = "d940f0f8-3cbb-4fd0-993f-471e7f2328ad"
  struct IUpdateInstallationResult
    lpVtbl : IUpdateInstallationResultVTbl*
  end

  struct IInstallationResultVTbl
    query_interface : Proc(IInstallationResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationResult*, UInt32)
    release : Proc(IInstallationResult*, UInt32)
    get_type_info_count : Proc(IInstallationResult*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationResult*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationResult*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationResult*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_h_result : Proc(IInstallationResult*, Int32*, HRESULT)
    get_reboot_required : Proc(IInstallationResult*, Int16*, HRESULT)
    get_result_code : Proc(IInstallationResult*, OperationResultCode*, HRESULT)
    get_update_result : Proc(IInstallationResult*, Int32, IUpdateInstallationResult*, HRESULT)
  end

  IInstallationResult_GUID = LibC::GUID.new("a43c56d6-7451-48d4-af96-b6cd2d0d9b7a")
  CLSID_IInstallationResult = "a43c56d6-7451-48d4-af96-b6cd2d0d9b7a"
  struct IInstallationResult
    lpVtbl : IInstallationResultVTbl*
  end

  struct IInstallationProgressVTbl
    query_interface : Proc(IInstallationProgress*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationProgress*, UInt32)
    release : Proc(IInstallationProgress*, UInt32)
    get_type_info_count : Proc(IInstallationProgress*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationProgress*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationProgress*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationProgress*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_current_update_index : Proc(IInstallationProgress*, Int32*, HRESULT)
    get_current_update_percent_complete : Proc(IInstallationProgress*, Int32*, HRESULT)
    get_percent_complete : Proc(IInstallationProgress*, Int32*, HRESULT)
    get_update_result : Proc(IInstallationProgress*, Int32, IUpdateInstallationResult*, HRESULT)
  end

  IInstallationProgress_GUID = LibC::GUID.new("345c8244-43a3-4e32-a368-65f073b76f36")
  CLSID_IInstallationProgress = "345c8244-43a3-4e32-a368-65f073b76f36"
  struct IInstallationProgress
    lpVtbl : IInstallationProgressVTbl*
  end

  struct IInstallationJobVTbl
    query_interface : Proc(IInstallationJob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationJob*, UInt32)
    release : Proc(IInstallationJob*, UInt32)
    get_type_info_count : Proc(IInstallationJob*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationJob*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationJob*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationJob*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_async_state : Proc(IInstallationJob*, VARIANT*, HRESULT)
    get_is_completed : Proc(IInstallationJob*, Int16*, HRESULT)
    get_updates : Proc(IInstallationJob*, IUpdateCollection*, HRESULT)
    clean_up : Proc(IInstallationJob*, HRESULT)
    get_progress : Proc(IInstallationJob*, IInstallationProgress*, HRESULT)
    request_abort : Proc(IInstallationJob*, HRESULT)
  end

  IInstallationJob_GUID = LibC::GUID.new("5c209f0b-bad5-432a-9556-4699bed2638a")
  CLSID_IInstallationJob = "5c209f0b-bad5-432a-9556-4699bed2638a"
  struct IInstallationJob
    lpVtbl : IInstallationJobVTbl*
  end

  struct IInstallationCompletedCallbackArgsVTbl
    query_interface : Proc(IInstallationCompletedCallbackArgs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationCompletedCallbackArgs*, UInt32)
    release : Proc(IInstallationCompletedCallbackArgs*, UInt32)
    get_type_info_count : Proc(IInstallationCompletedCallbackArgs*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationCompletedCallbackArgs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationCompletedCallbackArgs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationCompletedCallbackArgs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  IInstallationCompletedCallbackArgs_GUID = LibC::GUID.new("250e2106-8efb-4705-9653-ef13c581b6a1")
  CLSID_IInstallationCompletedCallbackArgs = "250e2106-8efb-4705-9653-ef13c581b6a1"
  struct IInstallationCompletedCallbackArgs
    lpVtbl : IInstallationCompletedCallbackArgsVTbl*
  end

  struct IInstallationCompletedCallbackVTbl
    query_interface : Proc(IInstallationCompletedCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationCompletedCallback*, UInt32)
    release : Proc(IInstallationCompletedCallback*, UInt32)
    invoke : Proc(IInstallationCompletedCallback*, IInstallationJob, IInstallationCompletedCallbackArgs, HRESULT)
  end

  IInstallationCompletedCallback_GUID = LibC::GUID.new("45f4f6f3-d602-4f98-9a8a-3efa152ad2d3")
  CLSID_IInstallationCompletedCallback = "45f4f6f3-d602-4f98-9a8a-3efa152ad2d3"
  struct IInstallationCompletedCallback
    lpVtbl : IInstallationCompletedCallbackVTbl*
  end

  struct IInstallationProgressChangedCallbackArgsVTbl
    query_interface : Proc(IInstallationProgressChangedCallbackArgs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationProgressChangedCallbackArgs*, UInt32)
    release : Proc(IInstallationProgressChangedCallbackArgs*, UInt32)
    get_type_info_count : Proc(IInstallationProgressChangedCallbackArgs*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationProgressChangedCallbackArgs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationProgressChangedCallbackArgs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationProgressChangedCallbackArgs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_progress : Proc(IInstallationProgressChangedCallbackArgs*, IInstallationProgress*, HRESULT)
  end

  IInstallationProgressChangedCallbackArgs_GUID = LibC::GUID.new("e4f14e1e-689d-4218-a0b9-bc189c484a01")
  CLSID_IInstallationProgressChangedCallbackArgs = "e4f14e1e-689d-4218-a0b9-bc189c484a01"
  struct IInstallationProgressChangedCallbackArgs
    lpVtbl : IInstallationProgressChangedCallbackArgsVTbl*
  end

  struct IInstallationProgressChangedCallbackVTbl
    query_interface : Proc(IInstallationProgressChangedCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationProgressChangedCallback*, UInt32)
    release : Proc(IInstallationProgressChangedCallback*, UInt32)
    invoke : Proc(IInstallationProgressChangedCallback*, IInstallationJob, IInstallationProgressChangedCallbackArgs, HRESULT)
  end

  IInstallationProgressChangedCallback_GUID = LibC::GUID.new("e01402d5-f8da-43ba-a012-38894bd048f1")
  CLSID_IInstallationProgressChangedCallback = "e01402d5-f8da-43ba-a012-38894bd048f1"
  struct IInstallationProgressChangedCallback
    lpVtbl : IInstallationProgressChangedCallbackVTbl*
  end

  struct IUpdateInstallerVTbl
    query_interface : Proc(IUpdateInstaller*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateInstaller*, UInt32)
    release : Proc(IUpdateInstaller*, UInt32)
    get_type_info_count : Proc(IUpdateInstaller*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateInstaller*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateInstaller*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateInstaller*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateInstaller*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateInstaller*, UInt8*, HRESULT)
    get_is_forced : Proc(IUpdateInstaller*, Int16*, HRESULT)
    put_is_forced : Proc(IUpdateInstaller*, Int16, HRESULT)
    get_parent_hwnd : Proc(IUpdateInstaller*, HANDLE*, HRESULT)
    put_parent_hwnd : Proc(IUpdateInstaller*, LibC::HANDLE, HRESULT)
    put_parent_window : Proc(IUpdateInstaller*, IUnknown, HRESULT)
    get_parent_window : Proc(IUpdateInstaller*, IUnknown*, HRESULT)
    get_updates : Proc(IUpdateInstaller*, IUpdateCollection*, HRESULT)
    put_updates : Proc(IUpdateInstaller*, IUpdateCollection, HRESULT)
    begin_install : Proc(IUpdateInstaller*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    begin_uninstall : Proc(IUpdateInstaller*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    end_install : Proc(IUpdateInstaller*, IInstallationJob, IInstallationResult*, HRESULT)
    end_uninstall : Proc(IUpdateInstaller*, IInstallationJob, IInstallationResult*, HRESULT)
    install : Proc(IUpdateInstaller*, IInstallationResult*, HRESULT)
    run_wizard : Proc(IUpdateInstaller*, UInt8*, IInstallationResult*, HRESULT)
    get_is_busy : Proc(IUpdateInstaller*, Int16*, HRESULT)
    uninstall : Proc(IUpdateInstaller*, IInstallationResult*, HRESULT)
    get_allow_source_prompts : Proc(IUpdateInstaller*, Int16*, HRESULT)
    put_allow_source_prompts : Proc(IUpdateInstaller*, Int16, HRESULT)
    get_reboot_required_before_installation : Proc(IUpdateInstaller*, Int16*, HRESULT)
  end

  IUpdateInstaller_GUID = LibC::GUID.new("7b929c68-ccdc-4226-96b1-8724600b54c2")
  CLSID_IUpdateInstaller = "7b929c68-ccdc-4226-96b1-8724600b54c2"
  struct IUpdateInstaller
    lpVtbl : IUpdateInstallerVTbl*
  end

  struct IUpdateInstaller2VTbl
    query_interface : Proc(IUpdateInstaller2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateInstaller2*, UInt32)
    release : Proc(IUpdateInstaller2*, UInt32)
    get_type_info_count : Proc(IUpdateInstaller2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateInstaller2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateInstaller2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateInstaller2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateInstaller2*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateInstaller2*, UInt8*, HRESULT)
    get_is_forced : Proc(IUpdateInstaller2*, Int16*, HRESULT)
    put_is_forced : Proc(IUpdateInstaller2*, Int16, HRESULT)
    get_parent_hwnd : Proc(IUpdateInstaller2*, HANDLE*, HRESULT)
    put_parent_hwnd : Proc(IUpdateInstaller2*, LibC::HANDLE, HRESULT)
    put_parent_window : Proc(IUpdateInstaller2*, IUnknown, HRESULT)
    get_parent_window : Proc(IUpdateInstaller2*, IUnknown*, HRESULT)
    get_updates : Proc(IUpdateInstaller2*, IUpdateCollection*, HRESULT)
    put_updates : Proc(IUpdateInstaller2*, IUpdateCollection, HRESULT)
    begin_install : Proc(IUpdateInstaller2*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    begin_uninstall : Proc(IUpdateInstaller2*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    end_install : Proc(IUpdateInstaller2*, IInstallationJob, IInstallationResult*, HRESULT)
    end_uninstall : Proc(IUpdateInstaller2*, IInstallationJob, IInstallationResult*, HRESULT)
    install : Proc(IUpdateInstaller2*, IInstallationResult*, HRESULT)
    run_wizard : Proc(IUpdateInstaller2*, UInt8*, IInstallationResult*, HRESULT)
    get_is_busy : Proc(IUpdateInstaller2*, Int16*, HRESULT)
    uninstall : Proc(IUpdateInstaller2*, IInstallationResult*, HRESULT)
    get_allow_source_prompts : Proc(IUpdateInstaller2*, Int16*, HRESULT)
    put_allow_source_prompts : Proc(IUpdateInstaller2*, Int16, HRESULT)
    get_reboot_required_before_installation : Proc(IUpdateInstaller2*, Int16*, HRESULT)
    get_force_quiet : Proc(IUpdateInstaller2*, Int16*, HRESULT)
    put_force_quiet : Proc(IUpdateInstaller2*, Int16, HRESULT)
  end

  IUpdateInstaller2_GUID = LibC::GUID.new("3442d4fe-224d-4cee-98cf-30e0c4d229e6")
  CLSID_IUpdateInstaller2 = "3442d4fe-224d-4cee-98cf-30e0c4d229e6"
  struct IUpdateInstaller2
    lpVtbl : IUpdateInstaller2VTbl*
  end

  struct IUpdateInstaller3VTbl
    query_interface : Proc(IUpdateInstaller3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateInstaller3*, UInt32)
    release : Proc(IUpdateInstaller3*, UInt32)
    get_type_info_count : Proc(IUpdateInstaller3*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateInstaller3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateInstaller3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateInstaller3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateInstaller3*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateInstaller3*, UInt8*, HRESULT)
    get_is_forced : Proc(IUpdateInstaller3*, Int16*, HRESULT)
    put_is_forced : Proc(IUpdateInstaller3*, Int16, HRESULT)
    get_parent_hwnd : Proc(IUpdateInstaller3*, HANDLE*, HRESULT)
    put_parent_hwnd : Proc(IUpdateInstaller3*, LibC::HANDLE, HRESULT)
    put_parent_window : Proc(IUpdateInstaller3*, IUnknown, HRESULT)
    get_parent_window : Proc(IUpdateInstaller3*, IUnknown*, HRESULT)
    get_updates : Proc(IUpdateInstaller3*, IUpdateCollection*, HRESULT)
    put_updates : Proc(IUpdateInstaller3*, IUpdateCollection, HRESULT)
    begin_install : Proc(IUpdateInstaller3*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    begin_uninstall : Proc(IUpdateInstaller3*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    end_install : Proc(IUpdateInstaller3*, IInstallationJob, IInstallationResult*, HRESULT)
    end_uninstall : Proc(IUpdateInstaller3*, IInstallationJob, IInstallationResult*, HRESULT)
    install : Proc(IUpdateInstaller3*, IInstallationResult*, HRESULT)
    run_wizard : Proc(IUpdateInstaller3*, UInt8*, IInstallationResult*, HRESULT)
    get_is_busy : Proc(IUpdateInstaller3*, Int16*, HRESULT)
    uninstall : Proc(IUpdateInstaller3*, IInstallationResult*, HRESULT)
    get_allow_source_prompts : Proc(IUpdateInstaller3*, Int16*, HRESULT)
    put_allow_source_prompts : Proc(IUpdateInstaller3*, Int16, HRESULT)
    get_reboot_required_before_installation : Proc(IUpdateInstaller3*, Int16*, HRESULT)
    get_force_quiet : Proc(IUpdateInstaller3*, Int16*, HRESULT)
    put_force_quiet : Proc(IUpdateInstaller3*, Int16, HRESULT)
    get_attempt_close_apps_if_necessary : Proc(IUpdateInstaller3*, Int16*, HRESULT)
    put_attempt_close_apps_if_necessary : Proc(IUpdateInstaller3*, Int16, HRESULT)
  end

  IUpdateInstaller3_GUID = LibC::GUID.new("16d11c35-099a-48d0-8338-5fae64047f8e")
  CLSID_IUpdateInstaller3 = "16d11c35-099a-48d0-8338-5fae64047f8e"
  struct IUpdateInstaller3
    lpVtbl : IUpdateInstaller3VTbl*
  end

  struct IUpdateInstaller4VTbl
    query_interface : Proc(IUpdateInstaller4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateInstaller4*, UInt32)
    release : Proc(IUpdateInstaller4*, UInt32)
    get_type_info_count : Proc(IUpdateInstaller4*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateInstaller4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateInstaller4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateInstaller4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateInstaller4*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateInstaller4*, UInt8*, HRESULT)
    get_is_forced : Proc(IUpdateInstaller4*, Int16*, HRESULT)
    put_is_forced : Proc(IUpdateInstaller4*, Int16, HRESULT)
    get_parent_hwnd : Proc(IUpdateInstaller4*, HANDLE*, HRESULT)
    put_parent_hwnd : Proc(IUpdateInstaller4*, LibC::HANDLE, HRESULT)
    put_parent_window : Proc(IUpdateInstaller4*, IUnknown, HRESULT)
    get_parent_window : Proc(IUpdateInstaller4*, IUnknown*, HRESULT)
    get_updates : Proc(IUpdateInstaller4*, IUpdateCollection*, HRESULT)
    put_updates : Proc(IUpdateInstaller4*, IUpdateCollection, HRESULT)
    begin_install : Proc(IUpdateInstaller4*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    begin_uninstall : Proc(IUpdateInstaller4*, IUnknown, IUnknown, VARIANT, IInstallationJob*, HRESULT)
    end_install : Proc(IUpdateInstaller4*, IInstallationJob, IInstallationResult*, HRESULT)
    end_uninstall : Proc(IUpdateInstaller4*, IInstallationJob, IInstallationResult*, HRESULT)
    install : Proc(IUpdateInstaller4*, IInstallationResult*, HRESULT)
    run_wizard : Proc(IUpdateInstaller4*, UInt8*, IInstallationResult*, HRESULT)
    get_is_busy : Proc(IUpdateInstaller4*, Int16*, HRESULT)
    uninstall : Proc(IUpdateInstaller4*, IInstallationResult*, HRESULT)
    get_allow_source_prompts : Proc(IUpdateInstaller4*, Int16*, HRESULT)
    put_allow_source_prompts : Proc(IUpdateInstaller4*, Int16, HRESULT)
    get_reboot_required_before_installation : Proc(IUpdateInstaller4*, Int16*, HRESULT)
    get_force_quiet : Proc(IUpdateInstaller4*, Int16*, HRESULT)
    put_force_quiet : Proc(IUpdateInstaller4*, Int16, HRESULT)
    get_attempt_close_apps_if_necessary : Proc(IUpdateInstaller4*, Int16*, HRESULT)
    put_attempt_close_apps_if_necessary : Proc(IUpdateInstaller4*, Int16, HRESULT)
    commit : Proc(IUpdateInstaller4*, UInt32, HRESULT)
  end

  IUpdateInstaller4_GUID = LibC::GUID.new("ef8208ea-2304-492d-9109-23813b0958e1")
  CLSID_IUpdateInstaller4 = "ef8208ea-2304-492d-9109-23813b0958e1"
  struct IUpdateInstaller4
    lpVtbl : IUpdateInstaller4VTbl*
  end

  struct IUpdateSessionVTbl
    query_interface : Proc(IUpdateSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateSession*, UInt32)
    release : Proc(IUpdateSession*, UInt32)
    get_type_info_count : Proc(IUpdateSession*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateSession*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateSession*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateSession*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateSession*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateSession*, UInt8*, HRESULT)
    get_read_only : Proc(IUpdateSession*, Int16*, HRESULT)
    get_web_proxy : Proc(IUpdateSession*, IWebProxy*, HRESULT)
    put_web_proxy : Proc(IUpdateSession*, IWebProxy, HRESULT)
    create_update_searcher : Proc(IUpdateSession*, IUpdateSearcher*, HRESULT)
    create_update_downloader : Proc(IUpdateSession*, IUpdateDownloader*, HRESULT)
    create_update_installer : Proc(IUpdateSession*, IUpdateInstaller*, HRESULT)
  end

  IUpdateSession_GUID = LibC::GUID.new("816858a4-260d-4260-933a-2585f1abc76b")
  CLSID_IUpdateSession = "816858a4-260d-4260-933a-2585f1abc76b"
  struct IUpdateSession
    lpVtbl : IUpdateSessionVTbl*
  end

  struct IUpdateSession2VTbl
    query_interface : Proc(IUpdateSession2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateSession2*, UInt32)
    release : Proc(IUpdateSession2*, UInt32)
    get_type_info_count : Proc(IUpdateSession2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateSession2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateSession2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateSession2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateSession2*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateSession2*, UInt8*, HRESULT)
    get_read_only : Proc(IUpdateSession2*, Int16*, HRESULT)
    get_web_proxy : Proc(IUpdateSession2*, IWebProxy*, HRESULT)
    put_web_proxy : Proc(IUpdateSession2*, IWebProxy, HRESULT)
    create_update_searcher : Proc(IUpdateSession2*, IUpdateSearcher*, HRESULT)
    create_update_downloader : Proc(IUpdateSession2*, IUpdateDownloader*, HRESULT)
    create_update_installer : Proc(IUpdateSession2*, IUpdateInstaller*, HRESULT)
    get_user_locale : Proc(IUpdateSession2*, UInt32*, HRESULT)
    put_user_locale : Proc(IUpdateSession2*, UInt32, HRESULT)
  end

  IUpdateSession2_GUID = LibC::GUID.new("91caf7b0-eb23-49ed-9937-c52d817f46f7")
  CLSID_IUpdateSession2 = "91caf7b0-eb23-49ed-9937-c52d817f46f7"
  struct IUpdateSession2
    lpVtbl : IUpdateSession2VTbl*
  end

  struct IUpdateSession3VTbl
    query_interface : Proc(IUpdateSession3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateSession3*, UInt32)
    release : Proc(IUpdateSession3*, UInt32)
    get_type_info_count : Proc(IUpdateSession3*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateSession3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateSession3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateSession3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_client_application_id : Proc(IUpdateSession3*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateSession3*, UInt8*, HRESULT)
    get_read_only : Proc(IUpdateSession3*, Int16*, HRESULT)
    get_web_proxy : Proc(IUpdateSession3*, IWebProxy*, HRESULT)
    put_web_proxy : Proc(IUpdateSession3*, IWebProxy, HRESULT)
    create_update_searcher : Proc(IUpdateSession3*, IUpdateSearcher*, HRESULT)
    create_update_downloader : Proc(IUpdateSession3*, IUpdateDownloader*, HRESULT)
    create_update_installer : Proc(IUpdateSession3*, IUpdateInstaller*, HRESULT)
    get_user_locale : Proc(IUpdateSession3*, UInt32*, HRESULT)
    put_user_locale : Proc(IUpdateSession3*, UInt32, HRESULT)
    create_update_service_manager : Proc(IUpdateSession3*, IUpdateServiceManager2*, HRESULT)
    query_history : Proc(IUpdateSession3*, UInt8*, Int32, Int32, IUpdateHistoryEntryCollection*, HRESULT)
  end

  IUpdateSession3_GUID = LibC::GUID.new("918efd1e-b5d8-4c90-8540-aeb9bdc56f9d")
  CLSID_IUpdateSession3 = "918efd1e-b5d8-4c90-8540-aeb9bdc56f9d"
  struct IUpdateSession3
    lpVtbl : IUpdateSession3VTbl*
  end

  struct IUpdateServiceVTbl
    query_interface : Proc(IUpdateService*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateService*, UInt32)
    release : Proc(IUpdateService*, UInt32)
    get_type_info_count : Proc(IUpdateService*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateService*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateService*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateService*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IUpdateService*, UInt8**, HRESULT)
    get_content_validation_cert : Proc(IUpdateService*, VARIANT*, HRESULT)
    get_expiration_date : Proc(IUpdateService*, Float64*, HRESULT)
    get_is_managed : Proc(IUpdateService*, Int16*, HRESULT)
    get_is_registered_with_au : Proc(IUpdateService*, Int16*, HRESULT)
    get_issue_date : Proc(IUpdateService*, Float64*, HRESULT)
    get_offers_windows_updates : Proc(IUpdateService*, Int16*, HRESULT)
    get_redirect_urls : Proc(IUpdateService*, IStringCollection*, HRESULT)
    get_service_id : Proc(IUpdateService*, UInt8**, HRESULT)
    get_is_scan_package_service : Proc(IUpdateService*, Int16*, HRESULT)
    get_can_register_with_au : Proc(IUpdateService*, Int16*, HRESULT)
    get_service_url : Proc(IUpdateService*, UInt8**, HRESULT)
    get_setup_prefix : Proc(IUpdateService*, UInt8**, HRESULT)
  end

  IUpdateService_GUID = LibC::GUID.new("76b3b17e-aed6-4da5-85f0-83587f81abe3")
  CLSID_IUpdateService = "76b3b17e-aed6-4da5-85f0-83587f81abe3"
  struct IUpdateService
    lpVtbl : IUpdateServiceVTbl*
  end

  struct IUpdateService2VTbl
    query_interface : Proc(IUpdateService2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateService2*, UInt32)
    release : Proc(IUpdateService2*, UInt32)
    get_type_info_count : Proc(IUpdateService2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateService2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateService2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateService2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IUpdateService2*, UInt8**, HRESULT)
    get_content_validation_cert : Proc(IUpdateService2*, VARIANT*, HRESULT)
    get_expiration_date : Proc(IUpdateService2*, Float64*, HRESULT)
    get_is_managed : Proc(IUpdateService2*, Int16*, HRESULT)
    get_is_registered_with_au : Proc(IUpdateService2*, Int16*, HRESULT)
    get_issue_date : Proc(IUpdateService2*, Float64*, HRESULT)
    get_offers_windows_updates : Proc(IUpdateService2*, Int16*, HRESULT)
    get_redirect_urls : Proc(IUpdateService2*, IStringCollection*, HRESULT)
    get_service_id : Proc(IUpdateService2*, UInt8**, HRESULT)
    get_is_scan_package_service : Proc(IUpdateService2*, Int16*, HRESULT)
    get_can_register_with_au : Proc(IUpdateService2*, Int16*, HRESULT)
    get_service_url : Proc(IUpdateService2*, UInt8**, HRESULT)
    get_setup_prefix : Proc(IUpdateService2*, UInt8**, HRESULT)
    get_is_default_au_service : Proc(IUpdateService2*, Int16*, HRESULT)
  end

  IUpdateService2_GUID = LibC::GUID.new("1518b460-6518-4172-940f-c75883b24ceb")
  CLSID_IUpdateService2 = "1518b460-6518-4172-940f-c75883b24ceb"
  struct IUpdateService2
    lpVtbl : IUpdateService2VTbl*
  end

  struct IUpdateServiceCollectionVTbl
    query_interface : Proc(IUpdateServiceCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateServiceCollection*, UInt32)
    release : Proc(IUpdateServiceCollection*, UInt32)
    get_type_info_count : Proc(IUpdateServiceCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateServiceCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateServiceCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateServiceCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IUpdateServiceCollection*, Int32, IUpdateService*, HRESULT)
    get__new_enum : Proc(IUpdateServiceCollection*, IUnknown*, HRESULT)
    get_count : Proc(IUpdateServiceCollection*, Int32*, HRESULT)
  end

  IUpdateServiceCollection_GUID = LibC::GUID.new("9b0353aa-0e52-44ff-b8b0-1f7fa0437f88")
  CLSID_IUpdateServiceCollection = "9b0353aa-0e52-44ff-b8b0-1f7fa0437f88"
  struct IUpdateServiceCollection
    lpVtbl : IUpdateServiceCollectionVTbl*
  end

  struct IUpdateServiceRegistrationVTbl
    query_interface : Proc(IUpdateServiceRegistration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateServiceRegistration*, UInt32)
    release : Proc(IUpdateServiceRegistration*, UInt32)
    get_type_info_count : Proc(IUpdateServiceRegistration*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateServiceRegistration*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateServiceRegistration*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateServiceRegistration*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_registration_state : Proc(IUpdateServiceRegistration*, UpdateServiceRegistrationState*, HRESULT)
    get_service_id : Proc(IUpdateServiceRegistration*, UInt8**, HRESULT)
    get_is_pending_registration_with_au : Proc(IUpdateServiceRegistration*, Int16*, HRESULT)
    get_service : Proc(IUpdateServiceRegistration*, IUpdateService2*, HRESULT)
  end

  IUpdateServiceRegistration_GUID = LibC::GUID.new("dde02280-12b3-4e0b-937b-6747f6acb286")
  CLSID_IUpdateServiceRegistration = "dde02280-12b3-4e0b-937b-6747f6acb286"
  struct IUpdateServiceRegistration
    lpVtbl : IUpdateServiceRegistrationVTbl*
  end

  struct IUpdateServiceManagerVTbl
    query_interface : Proc(IUpdateServiceManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateServiceManager*, UInt32)
    release : Proc(IUpdateServiceManager*, UInt32)
    get_type_info_count : Proc(IUpdateServiceManager*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateServiceManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateServiceManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateServiceManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_services : Proc(IUpdateServiceManager*, IUpdateServiceCollection*, HRESULT)
    add_service : Proc(IUpdateServiceManager*, UInt8*, UInt8*, IUpdateService*, HRESULT)
    register_service_with_au : Proc(IUpdateServiceManager*, UInt8*, HRESULT)
    remove_service : Proc(IUpdateServiceManager*, UInt8*, HRESULT)
    unregister_service_with_au : Proc(IUpdateServiceManager*, UInt8*, HRESULT)
    add_scan_package_service : Proc(IUpdateServiceManager*, UInt8*, UInt8*, Int32, IUpdateService*, HRESULT)
    set_option : Proc(IUpdateServiceManager*, UInt8*, VARIANT, HRESULT)
  end

  IUpdateServiceManager_GUID = LibC::GUID.new("23857e3c-02ba-44a3-9423-b1c900805f37")
  CLSID_IUpdateServiceManager = "23857e3c-02ba-44a3-9423-b1c900805f37"
  struct IUpdateServiceManager
    lpVtbl : IUpdateServiceManagerVTbl*
  end

  struct IUpdateServiceManager2VTbl
    query_interface : Proc(IUpdateServiceManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUpdateServiceManager2*, UInt32)
    release : Proc(IUpdateServiceManager2*, UInt32)
    get_type_info_count : Proc(IUpdateServiceManager2*, UInt32*, HRESULT)
    get_type_info : Proc(IUpdateServiceManager2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IUpdateServiceManager2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IUpdateServiceManager2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_services : Proc(IUpdateServiceManager2*, IUpdateServiceCollection*, HRESULT)
    add_service : Proc(IUpdateServiceManager2*, UInt8*, UInt8*, IUpdateService*, HRESULT)
    register_service_with_au : Proc(IUpdateServiceManager2*, UInt8*, HRESULT)
    remove_service : Proc(IUpdateServiceManager2*, UInt8*, HRESULT)
    unregister_service_with_au : Proc(IUpdateServiceManager2*, UInt8*, HRESULT)
    add_scan_package_service : Proc(IUpdateServiceManager2*, UInt8*, UInt8*, Int32, IUpdateService*, HRESULT)
    set_option : Proc(IUpdateServiceManager2*, UInt8*, VARIANT, HRESULT)
    get_client_application_id : Proc(IUpdateServiceManager2*, UInt8**, HRESULT)
    put_client_application_id : Proc(IUpdateServiceManager2*, UInt8*, HRESULT)
    query_service_registration : Proc(IUpdateServiceManager2*, UInt8*, IUpdateServiceRegistration*, HRESULT)
    add_service2 : Proc(IUpdateServiceManager2*, UInt8*, Int32, UInt8*, IUpdateServiceRegistration*, HRESULT)
  end

  IUpdateServiceManager2_GUID = LibC::GUID.new("0bb8531d-7e8d-424f-986c-a0b8f60a3e7b")
  CLSID_IUpdateServiceManager2 = "0bb8531d-7e8d-424f-986c-a0b8f60a3e7b"
  struct IUpdateServiceManager2
    lpVtbl : IUpdateServiceManager2VTbl*
  end

  struct IInstallationAgentVTbl
    query_interface : Proc(IInstallationAgent*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInstallationAgent*, UInt32)
    release : Proc(IInstallationAgent*, UInt32)
    get_type_info_count : Proc(IInstallationAgent*, UInt32*, HRESULT)
    get_type_info : Proc(IInstallationAgent*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IInstallationAgent*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IInstallationAgent*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    record_installation_result : Proc(IInstallationAgent*, UInt8*, Int32, IStringCollection, HRESULT)
  end

  IInstallationAgent_GUID = LibC::GUID.new("925cbc18-a2ea-4648-bf1c-ec8badcfe20a")
  CLSID_IInstallationAgent = "925cbc18-a2ea-4648-bf1c-ec8badcfe20a"
  struct IInstallationAgent
    lpVtbl : IInstallationAgentVTbl*
  end

end
