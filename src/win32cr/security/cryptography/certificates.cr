require "../../system/com.cr"
require "../../foundation.cr"
require "../../security/cryptography.cr"
require "../../security/authentication/identity.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:certadm.dll")]
@[Link(ldflags: "/DELAYLOAD:certpoleng.dll")]
{% else %}
@[Link("certadm")]
@[Link("certpoleng")]
{% end %}
lib LibWin32
  CA_DISP_INCOMPLETE = 0_u32
  CA_DISP_ERROR = 1_u32
  CA_DISP_REVOKED = 2_u32
  CA_DISP_VALID = 3_u32
  CA_DISP_INVALID = 4_u32
  CA_DISP_UNDER_SUBMISSION = 5_u32
  KRA_DISP_EXPIRED = 0_u32
  KRA_DISP_NOTFOUND = 1_u32
  KRA_DISP_REVOKED = 2_u32
  KRA_DISP_VALID = 3_u32
  KRA_DISP_INVALID = 4_u32
  KRA_DISP_UNTRUSTED = 5_u32
  KRA_DISP_NOTLOADED = 6_u32
  CA_ACCESS_MASKROLES = 255_u32
  CA_CRL_BASE = 1_u32
  CA_CRL_DELTA = 2_u32
  CA_CRL_REPUBLISH = 16_u32
  ICF_ALLOWFOREIGN = 65536_u32
  ICF_EXISTINGROW = 131072_u32
  IKF_OVERWRITE = 65536_u32
  CSBACKUP_TYPE_MASK = 3_u32
  CSRESTORE_TYPE_FULL = 1_u32
  CSRESTORE_TYPE_ONLINE = 2_u32
  CSRESTORE_TYPE_CATCHUP = 4_u32
  CSRESTORE_TYPE_MASK = 5_u32
  CSBACKUP_DISABLE_INCREMENTAL = 4294967295_u32
  CSBFT_DIRECTORY = 128_u32
  CSBFT_DATABASE_DIRECTORY = 64_u32
  CSBFT_LOG_DIRECTORY = 32_u32
  CSCONTROL_SHUTDOWN = 1_u64
  CSCONTROL_SUSPEND = 2_u64
  CSCONTROL_RESTART = 3_u64
  CAIF_DSENTRY = 1_u32
  CAIF_SHAREDFOLDERENTRY = 2_u32
  CAIF_REGISTRY = 4_u32
  CAIF_LOCAL = 8_u32
  CAIF_REGISTRYPARENT = 16_u32
  CR_IN_ENCODEANY = 255_u32
  CR_IN_ENCODEMASK = 255_u32
  CR_IN_FORMATANY = 0_u32
  CR_IN_PKCS10 = 256_u32
  CR_IN_KEYGEN = 512_u32
  CR_IN_PKCS7 = 768_u32
  CR_IN_CMC = 1024_u32
  CR_IN_CHALLENGERESPONSE = 1280_u32
  CR_IN_SIGNEDCERTIFICATETIMESTAMPLIST = 1536_u32
  CR_IN_FORMATMASK = 65280_u32
  CR_IN_SCEP = 65536_u32
  CR_IN_RPC = 131072_u32
  CR_IN_HTTP = 196608_u32
  CR_IN_FULLRESPONSE = 262144_u32
  CR_IN_CRLS = 524288_u32
  CR_IN_MACHINE = 1048576_u32
  CR_IN_ROBO = 2097152_u32
  CR_IN_CLIENTIDNONE = 4194304_u32
  CR_IN_CONNECTONLY = 8388608_u32
  CR_IN_RETURNCHALLENGE = 16777216_u32
  CR_IN_SCEPPOST = 33554432_u32
  CR_IN_CERTIFICATETRANSPARENCY = 67108864_u32
  CC_UIPICKCONFIGSKIPLOCALCA = 5_u32
  CR_DISP_REVOKED = 6_u32
  CR_OUT_BASE64REQUESTHEADER = 3_u32
  CR_OUT_HEX = 4_u32
  CR_OUT_HEXASCII = 5_u32
  CR_OUT_BASE64X509CRLHEADER = 9_u32
  CR_OUT_HEXADDR = 10_u32
  CR_OUT_HEXASCIIADDR = 11_u32
  CR_OUT_HEXRAW = 12_u32
  CR_OUT_ENCODEMASK = 255_u32
  CR_OUT_CHAIN = 256_u32
  CR_OUT_CRLS = 512_u32
  CR_OUT_NOCRLF = 1073741824_u32
  CR_OUT_NOCR = 2147483648_u32
  CR_GEMT_DEFAULT = 0_u32
  CR_GEMT_HRESULT_STRING = 1_u32
  CR_GEMT_HTTP_ERROR = 2_u32
  CR_PROP_NONE = 0_u32
  CR_PROP_FILEVERSION = 1_u32
  CR_PROP_PRODUCTVERSION = 2_u32
  CR_PROP_EXITCOUNT = 3_u32
  CR_PROP_EXITDESCRIPTION = 4_u32
  CR_PROP_POLICYDESCRIPTION = 5_u32
  CR_PROP_CANAME = 6_u32
  CR_PROP_SANITIZEDCANAME = 7_u32
  CR_PROP_SHAREDFOLDER = 8_u32
  CR_PROP_PARENTCA = 9_u32
  CR_PROP_CATYPE = 10_u32
  CR_PROP_CASIGCERTCOUNT = 11_u32
  CR_PROP_CASIGCERT = 12_u32
  CR_PROP_CASIGCERTCHAIN = 13_u32
  CR_PROP_CAXCHGCERTCOUNT = 14_u32
  CR_PROP_CAXCHGCERT = 15_u32
  CR_PROP_CAXCHGCERTCHAIN = 16_u32
  CR_PROP_BASECRL = 17_u32
  CR_PROP_DELTACRL = 18_u32
  CR_PROP_CACERTSTATE = 19_u32
  CR_PROP_CRLSTATE = 20_u32
  CR_PROP_CAPROPIDMAX = 21_u32
  CR_PROP_DNSNAME = 22_u32
  CR_PROP_ROLESEPARATIONENABLED = 23_u32
  CR_PROP_KRACERTUSEDCOUNT = 24_u32
  CR_PROP_KRACERTCOUNT = 25_u32
  CR_PROP_KRACERT = 26_u32
  CR_PROP_KRACERTSTATE = 27_u32
  CR_PROP_ADVANCEDSERVER = 28_u32
  CR_PROP_TEMPLATES = 29_u32
  CR_PROP_BASECRLPUBLISHSTATUS = 30_u32
  CR_PROP_DELTACRLPUBLISHSTATUS = 31_u32
  CR_PROP_CASIGCERTCRLCHAIN = 32_u32
  CR_PROP_CAXCHGCERTCRLCHAIN = 33_u32
  CR_PROP_CACERTSTATUSCODE = 34_u32
  CR_PROP_CAFORWARDCROSSCERT = 35_u32
  CR_PROP_CABACKWARDCROSSCERT = 36_u32
  CR_PROP_CAFORWARDCROSSCERTSTATE = 37_u32
  CR_PROP_CABACKWARDCROSSCERTSTATE = 38_u32
  CR_PROP_CACERTVERSION = 39_u32
  CR_PROP_SANITIZEDCASHORTNAME = 40_u32
  CR_PROP_CERTCDPURLS = 41_u32
  CR_PROP_CERTAIAURLS = 42_u32
  CR_PROP_CERTAIAOCSPURLS = 43_u32
  CR_PROP_LOCALENAME = 44_u32
  CR_PROP_SUBJECTTEMPLATE_OIDS = 45_u32
  CR_PROP_SCEPSERVERCERTS = 1000_u32
  CR_PROP_SCEPSERVERCAPABILITIES = 1001_u32
  CR_PROP_SCEPSERVERCERTSCHAIN = 1002_u32
  CR_PROP_SCEPMIN = 1000_u32
  CR_PROP_SCEPMAX = 1002_u32
  FR_PROP_CLAIMCHALLENGE = 22_u32
  EAN_NAMEOBJECTID = 2147483648_u32
  EANR_SUPPRESS_IA5CONVERSION = 2147483648_u32
  CERTENROLL_INDEX_BASE = 0_u32
  EXITEVENT_INVALID = 0_u32
  EXITEVENT_STARTUP = 128_u32
  EXITEVENT_CERTIMPORTED = 512_u32
  ENUMEXT_OBJECTID = 1_u32
  CMM_REFRESHONLY = 1_u32
  CMM_READONLY = 2_u32
  DBSESSIONCOUNTDEFAULT = 100_u32
  DBFLAGS_READONLY = 1_u32
  DBFLAGS_CREATEIFNEEDED = 2_u32
  DBFLAGS_CIRCULARLOGGING = 4_u32
  DBFLAGS_LAZYFLUSH = 8_u32
  DBFLAGS_MAXCACHESIZEX100 = 16_u32
  DBFLAGS_CHECKPOINTDEPTH60MB = 32_u32
  DBFLAGS_LOGBUFFERSLARGE = 64_u32
  DBFLAGS_LOGBUFFERSHUGE = 128_u32
  DBFLAGS_LOGFILESIZE16MB = 256_u32
  DBFLAGS_MULTITHREADTRANSACTIONS = 512_u32
  DBFLAGS_DISABLESNAPSHOTBACKUP = 1024_u32
  DBFLAGS_ENABLEVOLATILEREQUESTS = 2048_u32
  LDAPF_SSLENABLE = 1_u32
  LDAPF_SIGNDISABLE = 2_u32
  CSVER_MAJOR_WIN2K = 1_u32
  CSVER_MINOR_WIN2K = 1_u32
  CSVER_MAJOR_WHISTLER = 2_u32
  CSVER_MINOR_WHISTLER_BETA2 = 1_u32
  CSVER_MINOR_WHISTLER_BETA3 = 2_u32
  CSVER_MAJOR_LONGHORN = 3_u32
  CSVER_MINOR_LONGHORN_BETA1 = 1_u32
  CSVER_MAJOR_WIN7 = 4_u32
  CSVER_MINOR_WIN7 = 1_u32
  CSVER_MAJOR_WIN8 = 5_u32
  CSVER_MINOR_WIN8 = 1_u32
  CSVER_MAJOR_WINBLUE = 6_u32
  CSVER_MINOR_WINBLUE = 1_u32
  CSVER_MAJOR_THRESHOLD = 7_u32
  CSVER_MINOR_THRESHOLD = 1_u32
  CSVER_MAJOR = 7_u32
  CSVER_MINOR = 1_u32
  CCLOCKSKEWMINUTESDEFAULT = 10_u32
  CVIEWAGEMINUTESDEFAULT = 16_u32
  SETUP_SERVER_FLAG = 1_u32
  SETUP_CLIENT_FLAG = 2_u32
  SETUP_SUSPEND_FLAG = 4_u32
  SETUP_REQUEST_FLAG = 8_u32
  SETUP_ONLINE_FLAG = 16_u32
  SETUP_DENIED_FLAG = 32_u32
  SETUP_CREATEDB_FLAG = 64_u32
  SETUP_ATTEMPT_VROOT_CREATE = 128_u32
  SETUP_FORCECRL_FLAG = 256_u32
  SETUP_UPDATE_CAOBJECT_SVRTYPE = 512_u32
  SETUP_SERVER_UPGRADED_FLAG = 1024_u32
  SETUP_W2K_SECURITY_NOT_UPGRADED_FLAG = 2048_u32
  SETUP_SECURITY_CHANGED = 4096_u32
  SETUP_DCOM_SECURITY_UPDATED_FLAG = 8192_u32
  SETUP_SERVER_IS_UP_TO_DATE_FLAG = 16384_u32
  CRLF_DELTA_USE_OLDEST_UNEXPIRED_BASE = 1_u32
  CRLF_DELETE_EXPIRED_CRLS = 2_u32
  CRLF_CRLNUMBER_CRITICAL = 4_u32
  CRLF_REVCHECK_IGNORE_OFFLINE = 8_u32
  CRLF_IGNORE_INVALID_POLICIES = 16_u32
  CRLF_REBUILD_MODIFIED_SUBJECT_ONLY = 32_u32
  CRLF_SAVE_FAILED_CERTS = 64_u32
  CRLF_IGNORE_UNKNOWN_CMC_ATTRIBUTES = 128_u32
  CRLF_IGNORE_CROSS_CERT_TRUST_ERROR = 256_u32
  CRLF_PUBLISH_EXPIRED_CERT_CRLS = 512_u32
  CRLF_ENFORCE_ENROLLMENT_AGENT = 1024_u32
  CRLF_DISABLE_RDN_REORDER = 2048_u32
  CRLF_DISABLE_ROOT_CROSS_CERTS = 4096_u32
  CRLF_LOG_FULL_RESPONSE = 8192_u32
  CRLF_USE_XCHG_CERT_TEMPLATE = 16384_u32
  CRLF_USE_CROSS_CERT_TEMPLATE = 32768_u32
  CRLF_ALLOW_REQUEST_ATTRIBUTE_SUBJECT = 65536_u32
  CRLF_REVCHECK_IGNORE_NOREVCHECK = 131072_u32
  CRLF_PRESERVE_EXPIRED_CA_CERTS = 262144_u32
  CRLF_PRESERVE_REVOKED_CA_CERTS = 524288_u32
  CRLF_DISABLE_CHAIN_VERIFICATION = 1048576_u32
  CRLF_BUILD_ROOTCA_CRLENTRIES_BASEDONKEY = 2097152_u32
  KRAF_ENABLEFOREIGN = 1_u32
  KRAF_SAVEBADREQUESTKEY = 2_u32
  KRAF_ENABLEARCHIVEALL = 4_u32
  KRAF_DISABLEUSEDEFAULTPROVIDER = 8_u32
  IF_LOCKICERTREQUEST = 1_u32
  IF_NOREMOTEICERTREQUEST = 2_u32
  IF_NOLOCALICERTREQUEST = 4_u32
  IF_NORPCICERTREQUEST = 8_u32
  IF_NOREMOTEICERTADMIN = 16_u32
  IF_NOLOCALICERTADMIN = 32_u32
  IF_NOREMOTEICERTADMINBACKUP = 64_u32
  IF_NOLOCALICERTADMINBACKUP = 128_u32
  IF_NOSNAPSHOTBACKUP = 256_u32
  IF_ENFORCEENCRYPTICERTREQUEST = 512_u32
  IF_ENFORCEENCRYPTICERTADMIN = 1024_u32
  IF_ENABLEEXITKEYRETRIEVAL = 2048_u32
  IF_ENABLEADMINASAUDITOR = 4096_u32
  PROCFLG_NONE = 0_u32
  PROCFLG_ENFORCEGOODKEYS = 1_u32
  CSURL_SERVERPUBLISH = 1_u32
  CSURL_ADDTOCERTCDP = 2_u32
  CSURL_ADDTOFRESHESTCRL = 4_u32
  CSURL_ADDTOCRLCDP = 8_u32
  CSURL_PUBLISHRETRY = 16_u32
  CSURL_ADDTOCERTOCSP = 32_u32
  CSURL_SERVERPUBLISHDELTA = 64_u32
  CSURL_ADDTOIDP = 128_u32
  CAPATHLENGTH_INFINITE = 4294967295_u32
  REQDISP_PENDING = 0_u32
  REQDISP_ISSUE = 1_u32
  REQDISP_DENY = 2_u32
  REQDISP_USEREQUESTATTRIBUTE = 3_u32
  REQDISP_MASK = 255_u32
  REQDISP_PENDINGFIRST = 256_u32
  REQDISP_DEFAULT_ENTERPRISE = 1_u32
  REVEXT_CDPLDAPURL_OLD = 1_u32
  REVEXT_CDPHTTPURL_OLD = 2_u32
  REVEXT_CDPFTPURL_OLD = 4_u32
  REVEXT_CDPFILEURL_OLD = 8_u32
  REVEXT_CDPURLMASK_OLD = 255_u32
  REVEXT_CDPENABLE = 256_u32
  REVEXT_ASPENABLE = 512_u32
  REVEXT_DEFAULT_NODS = 256_u32
  REVEXT_DEFAULT_DS = 256_u32
  ISSCERT_LDAPURL_OLD = 1_u32
  ISSCERT_HTTPURL_OLD = 2_u32
  ISSCERT_FTPURL_OLD = 4_u32
  ISSCERT_FILEURL_OLD = 8_u32
  ISSCERT_URLMASK_OLD = 255_u32
  ISSCERT_ENABLE = 256_u32
  ISSCERT_DEFAULT_NODS = 256_u32
  ISSCERT_DEFAULT_DS = 256_u32
  EDITF_ENABLEREQUESTEXTENSIONS = 1_u32
  EDITF_REQUESTEXTENSIONLIST = 2_u32
  EDITF_DISABLEEXTENSIONLIST = 4_u32
  EDITF_ADDOLDKEYUSAGE = 8_u32
  EDITF_ADDOLDCERTTYPE = 16_u32
  EDITF_ATTRIBUTEENDDATE = 32_u32
  EDITF_BASICCONSTRAINTSCRITICAL = 64_u32
  EDITF_BASICCONSTRAINTSCA = 128_u32
  EDITF_ENABLEAKIKEYID = 256_u32
  EDITF_ATTRIBUTECA = 512_u32
  EDITF_IGNOREREQUESTERGROUP = 1024_u32
  EDITF_ENABLEAKIISSUERNAME = 2048_u32
  EDITF_ENABLEAKIISSUERSERIAL = 4096_u32
  EDITF_ENABLEAKICRITICAL = 8192_u32
  EDITF_SERVERUPGRADED = 16384_u32
  EDITF_ATTRIBUTEEKU = 32768_u32
  EDITF_ENABLEDEFAULTSMIME = 65536_u32
  EDITF_EMAILOPTIONAL = 131072_u32
  EDITF_ATTRIBUTESUBJECTALTNAME2 = 262144_u32
  EDITF_ENABLELDAPREFERRALS = 524288_u32
  EDITF_ENABLECHASECLIENTDC = 1048576_u32
  EDITF_AUDITCERTTEMPLATELOAD = 2097152_u32
  EDITF_DISABLEOLDOSCNUPN = 4194304_u32
  EDITF_DISABLELDAPPACKAGELIST = 8388608_u32
  EDITF_ENABLEUPNMAP = 16777216_u32
  EDITF_ENABLEOCSPREVNOCHECK = 33554432_u32
  EDITF_ENABLERENEWONBEHALFOF = 67108864_u32
  EDITF_ENABLEKEYENCIPHERMENTCACERT = 134217728_u32
  EXITPUB_FILE = 1_u32
  EXITPUB_ACTIVEDIRECTORY = 2_u32
  EXITPUB_REMOVEOLDCERTS = 16_u32
  EXITPUB_DEFAULT_ENTERPRISE = 2_u32
  EXITPUB_DEFAULT_STANDALONE = 1_u32
  TP_MACHINEPOLICY = 1_u32
  KR_ENABLE_MACHINE = 1_u32
  KR_ENABLE_USER = 2_u32
  EXTENSION_CRITICAL_FLAG = 1_u32
  EXTENSION_DISABLE_FLAG = 2_u32
  EXTENSION_DELETE_FLAG = 4_u32
  EXTENSION_POLICY_MASK = 65535_u32
  EXTENSION_ORIGIN_REQUEST = 65536_u32
  EXTENSION_ORIGIN_POLICY = 131072_u32
  EXTENSION_ORIGIN_ADMIN = 196608_u32
  EXTENSION_ORIGIN_SERVER = 262144_u32
  EXTENSION_ORIGIN_RENEWALCERT = 327680_u32
  EXTENSION_ORIGIN_IMPORTEDCERT = 393216_u32
  EXTENSION_ORIGIN_PKCS7 = 458752_u32
  EXTENSION_ORIGIN_CMC = 524288_u32
  EXTENSION_ORIGIN_CACERT = 589824_u32
  EXTENSION_ORIGIN_MASK = 983040_u32
  CPF_BASE = 1_u32
  CPF_DELTA = 2_u32
  CPF_COMPLETE = 4_u32
  CPF_SHADOW = 8_u32
  CPF_CASTORE_ERROR = 16_u32
  CPF_BADURL_ERROR = 32_u32
  CPF_MANUAL = 64_u32
  CPF_SIGNATURE_ERROR = 128_u32
  CPF_LDAP_ERROR = 256_u32
  CPF_FILE_ERROR = 512_u32
  CPF_FTP_ERROR = 1024_u32
  CPF_HTTP_ERROR = 2048_u32
  CPF_POSTPONED_BASE_LDAP_ERROR = 4096_u32
  CPF_POSTPONED_BASE_FILE_ERROR = 8192_u32
  PROPTYPE_MASK = 255_u32
  PROPCALLER_SERVER = 256_u32
  PROPCALLER_POLICY = 512_u32
  PROPCALLER_EXIT = 768_u32
  PROPCALLER_ADMIN = 1024_u32
  PROPCALLER_REQUEST = 1280_u32
  PROPCALLER_MASK = 3840_u32
  PROPFLAGS_INDEXED = 65536_u32
  CR_FLG_FORCETELETEX = 1_u32
  CR_FLG_RENEWAL = 2_u32
  CR_FLG_FORCEUTF8 = 4_u32
  CR_FLG_CAXCHGCERT = 8_u32
  CR_FLG_ENROLLONBEHALFOF = 16_u32
  CR_FLG_SUBJECTUNMODIFIED = 32_u32
  CR_FLG_VALIDENCRYPTEDKEYHASH = 64_u32
  CR_FLG_CACROSSCERT = 128_u32
  CR_FLG_ENFORCEUTF8 = 256_u32
  CR_FLG_DEFINEDCACERT = 512_u32
  CR_FLG_CHALLENGEPENDING = 1024_u32
  CR_FLG_CHALLENGESATISFIED = 2048_u32
  CR_FLG_TRUSTONUSE = 4096_u32
  CR_FLG_TRUSTEKCERT = 8192_u32
  CR_FLG_TRUSTEKKEY = 16384_u32
  CR_FLG_PUBLISHERROR = 2147483648_u32
  DB_DISP_ACTIVE = 8_u32
  DB_DISP_PENDING = 9_u32
  DB_DISP_QUEUE_MAX = 9_u32
  DB_DISP_FOREIGN = 12_u32
  DB_DISP_CA_CERT = 15_u32
  DB_DISP_CA_CERT_CHAIN = 16_u32
  DB_DISP_KRA_CERT = 17_u32
  DB_DISP_LOG_MIN = 20_u32
  DB_DISP_ISSUED = 20_u32
  DB_DISP_REVOKED = 21_u32
  DB_DISP_LOG_FAILED_MIN = 30_u32
  DB_DISP_ERROR = 30_u32
  DB_DISP_DENIED = 31_u32
  VR_PENDING = 0_u32
  VR_INSTANT_OK = 1_u32
  VR_INSTANT_BAD = 2_u32
  CV_OUT_HEXRAW = 12_u32
  CV_OUT_ENCODEMASK = 255_u32
  CV_OUT_NOCRLF = 1073741824_u32
  CV_OUT_NOCR = 2147483648_u32
  CVR_SEEK_NONE = 0_u32
  CVR_SEEK_MASK = 255_u32
  CVR_SEEK_NODELTA = 4096_u32
  CVR_SORT_NONE = 0_u32
  CVR_SORT_ASCEND = 1_u32
  CVR_SORT_DESCEND = 2_u32
  CV_COLUMN_EXTENSION_DEFAULT = -4_i32
  CV_COLUMN_ATTRIBUTE_DEFAULT = -5_i32
  CV_COLUMN_CRL_DEFAULT = -6_i32
  CV_COLUMN_LOG_REVOKED_DEFAULT = -7_i32
  CVRC_TABLE_MASK = 61440_u32
  CVRC_TABLE_SHIFT = 12_u32
  CRYPT_ENUM_ALL_PROVIDERS = 1_u32
  XEPR_ENUM_FIRST = -1_i32
  XEPR_DATE = 5_u32
  XEPR_TEMPLATENAME = 6_u32
  XEPR_VERSION = 7_u32
  XEPR_V1TEMPLATENAME = 9_u32
  XEPR_V2TEMPLATEOID = 16_u32
  XEKL_KEYSIZE_DEFAULT = 4_u32
  XECP_STRING_PROPERTY = 1_u32
  XECI_DISABLE = 0_u32
  XECI_XENROLL = 1_u32
  XECI_AUTOENROLL = 2_u32
  XECI_REQWIZARD = 3_u32
  XECI_CERTREQ = 4_u32
  Wszcmm_prop_name = "Name"
  Wszcmm_prop_description = "Description"
  Wszcmm_prop_copyright = "Copyright"
  Wszcmm_prop_filever = "File Version"
  Wszcmm_prop_productver = "Product Version"
  Wszcmm_prop_display_hwnd = "HWND"
  Wszcmm_prop_ismultithreaded = "IsMultiThreaded"
  CCertAdmin = LibC::GUID.new(0x37eabaf0_u32, 0x7fb6_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x17_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertView = LibC::GUID.new(0xa12d0f7a_u32, 0x1e84_u16, 0x11d1_u16, StaticArray[0x9b_u8, 0xd6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x83_u8, 0xfa_u8])
  OCSPPropertyCollection = LibC::GUID.new(0xf935a528_u32, 0xba8a_u16, 0x4dd9_u16, StaticArray[0xba_u8, 0x79_u8, 0xf2_u8, 0x83_u8, 0x27_u8, 0x5c_u8, 0xb2_u8, 0xde_u8])
  OCSPAdmin = LibC::GUID.new(0xd3f73511_u32, 0x92c9_u16, 0x47cb_u16, StaticArray[0x8f_u8, 0xf2_u8, 0x8d_u8, 0x89_u8, 0x1a_u8, 0x7c_u8, 0x4d_u8, 0xe4_u8])
  CCertGetConfig = LibC::GUID.new(0xc6cc49b0_u32, 0xce17_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x33_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertConfig = LibC::GUID.new(0x372fce38_u32, 0x4324_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x10_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertRequest = LibC::GUID.new(0x98aff3f0_u32, 0x5524_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x12_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertServerPolicy = LibC::GUID.new(0xaa000926_u32, 0xffbe_u16, 0x11cf_u16, StaticArray[0x88_u8, 0x0_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertServerExit = LibC::GUID.new(0x4c4a5e40_u32, 0x732c_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x16_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertEncodeStringArray = LibC::GUID.new(0x19a76fe0_u32, 0x7494_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x16_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertEncodeLongArray = LibC::GUID.new(0x4e0680a0_u32, 0xa0a2_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x21_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertEncodeDateArray = LibC::GUID.new(0x301f77b0_u32, 0xa470_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x21_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertEncodeCRLDistInfo = LibC::GUID.new(0x1fa60a0_u32, 0xbbff_u16, 0x11d0_u16, StaticArray[0x88_u8, 0x25_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x3_u8, 0xb8_u8, 0x3c_u8])
  CCertEncodeAltName = LibC::GUID.new(0x1cfc4cda_u32, 0x1271_u16, 0x11d1_u16, StaticArray[0x9b_u8, 0xd4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x83_u8, 0xfa_u8])
  CCertEncodeBitString = LibC::GUID.new(0x6d6b3cd8_u32, 0x1278_u16, 0x11d1_u16, StaticArray[0x9b_u8, 0xd4_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb6_u8, 0x83_u8, 0xfa_u8])
  CObjectId = LibC::GUID.new(0x884e2000_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CObjectIds = LibC::GUID.new(0x884e2001_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CBinaryConverter = LibC::GUID.new(0x884e2002_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX500DistinguishedName = LibC::GUID.new(0x884e2003_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCspInformation = LibC::GUID.new(0x884e2007_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCspInformations = LibC::GUID.new(0x884e2008_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCspStatus = LibC::GUID.new(0x884e2009_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509PublicKey = LibC::GUID.new(0x884e200b_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509PrivateKey = LibC::GUID.new(0x884e200c_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509EndorsementKey = LibC::GUID.new(0x11a25a1d_u32, 0xb9a3_u16, 0x4edd_u16, StaticArray[0xaf_u8, 0x83_u8, 0x3b_u8, 0x59_u8, 0xad_u8, 0xbe_u8, 0xd3_u8, 0x61_u8])
  CX509Extension = LibC::GUID.new(0x884e200d_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509Extensions = LibC::GUID.new(0x884e200e_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionKeyUsage = LibC::GUID.new(0x884e200f_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionEnhancedKeyUsage = LibC::GUID.new(0x884e2010_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionTemplateName = LibC::GUID.new(0x884e2011_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionTemplate = LibC::GUID.new(0x884e2012_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CAlternativeName = LibC::GUID.new(0x884e2013_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CAlternativeNames = LibC::GUID.new(0x884e2014_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionAlternativeNames = LibC::GUID.new(0x884e2015_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionBasicConstraints = LibC::GUID.new(0x884e2016_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionSubjectKeyIdentifier = LibC::GUID.new(0x884e2017_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionAuthorityKeyIdentifier = LibC::GUID.new(0x884e2018_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CSmimeCapability = LibC::GUID.new(0x884e2019_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CSmimeCapabilities = LibC::GUID.new(0x884e201a_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionSmimeCapabilities = LibC::GUID.new(0x884e201b_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CPolicyQualifier = LibC::GUID.new(0x884e201c_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CPolicyQualifiers = LibC::GUID.new(0x884e201d_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertificatePolicy = LibC::GUID.new(0x884e201e_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertificatePolicies = LibC::GUID.new(0x884e201f_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionCertificatePolicies = LibC::GUID.new(0x884e2020_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509ExtensionMSApplicationPolicies = LibC::GUID.new(0x884e2021_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509Attribute = LibC::GUID.new(0x884e2022_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509Attributes = LibC::GUID.new(0x884e2023_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeExtensions = LibC::GUID.new(0x884e2024_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeClientId = LibC::GUID.new(0x884e2025_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeRenewalCertificate = LibC::GUID.new(0x884e2026_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeArchiveKey = LibC::GUID.new(0x884e2027_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeArchiveKeyHash = LibC::GUID.new(0x884e2028_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeOSVersion = LibC::GUID.new(0x884e202a_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509AttributeCspProvider = LibC::GUID.new(0x884e202b_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCryptAttribute = LibC::GUID.new(0x884e202c_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCryptAttributes = LibC::GUID.new(0x884e202d_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertProperty = LibC::GUID.new(0x884e202e_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertProperties = LibC::GUID.new(0x884e202f_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyFriendlyName = LibC::GUID.new(0x884e2030_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyDescription = LibC::GUID.new(0x884e2031_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyAutoEnroll = LibC::GUID.new(0x884e2032_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyRequestOriginator = LibC::GUID.new(0x884e2033_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertySHA1Hash = LibC::GUID.new(0x884e2034_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyKeyProvInfo = LibC::GUID.new(0x884e2036_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyArchived = LibC::GUID.new(0x884e2037_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyBackedUp = LibC::GUID.new(0x884e2038_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyEnrollment = LibC::GUID.new(0x884e2039_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyRenewal = LibC::GUID.new(0x884e203a_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyArchivedKeyHash = LibC::GUID.new(0x884e203b_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertPropertyEnrollmentPolicyServer = LibC::GUID.new(0x884e204c_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CSignerCertificate = LibC::GUID.new(0x884e203d_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509NameValuePair = LibC::GUID.new(0x884e203f_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CCertificateAttestationChallenge = LibC::GUID.new(0x1362ada1_u32, 0xeb60_u16, 0x456a_u16, StaticArray[0xb6_u8, 0xe1_u8, 0x11_u8, 0x80_u8, 0x50_u8, 0xdb_u8, 0x74_u8, 0x1b_u8])
  CX509CertificateRequestPkcs10 = LibC::GUID.new(0x884e2042_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509CertificateRequestCertificate = LibC::GUID.new(0x884e2043_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509CertificateRequestPkcs7 = LibC::GUID.new(0x884e2044_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509CertificateRequestCmc = LibC::GUID.new(0x884e2045_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509Enrollment = LibC::GUID.new(0x884e2046_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509EnrollmentWebClassFactory = LibC::GUID.new(0x884e2049_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509EnrollmentHelper = LibC::GUID.new(0x884e2050_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509MachineEnrollmentFactory = LibC::GUID.new(0x884e2051_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509EnrollmentPolicyActiveDirectory = LibC::GUID.new(0x91f39027_u32, 0x217f_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509EnrollmentPolicyWebService = LibC::GUID.new(0x91f39028_u32, 0x217f_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509PolicyServerListManager = LibC::GUID.new(0x91f39029_u32, 0x217f_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509PolicyServerUrl = LibC::GUID.new(0x91f3902a_u32, 0x217f_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509CertificateTemplateADWritable = LibC::GUID.new(0x8336e323_u32, 0x2e6a_u16, 0x4a04_u16, StaticArray[0x93_u8, 0x7c_u8, 0x54_u8, 0x8f_u8, 0x68_u8, 0x18_u8, 0x39_u8, 0xb3_u8])
  CX509CertificateRevocationListEntry = LibC::GUID.new(0x884e205e_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509CertificateRevocationListEntries = LibC::GUID.new(0x884e205f_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509CertificateRevocationList = LibC::GUID.new(0x884e2060_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509SCEPEnrollment = LibC::GUID.new(0x884e2061_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CX509SCEPEnrollmentHelper = LibC::GUID.new(0x884e2062_u32, 0x217d_u16, 0x11da_u16, StaticArray[0xb2_u8, 0xa4_u8, 0x0_u8, 0xe_u8, 0x7b_u8, 0xbb_u8, 0x2b_u8, 0x9_u8])
  CEnroll2 = LibC::GUID.new(0x127698e4_u32, 0xe730_u16, 0x4e5c_u16, StaticArray[0xa2_u8, 0xb1_u8, 0x21_u8, 0x49_u8, 0xa_u8, 0x70_u8, 0xc8_u8, 0xa1_u8])
  CEnroll = LibC::GUID.new(0x43f8f289_u32, 0x7a20_u16, 0x11d0_u16, StaticArray[0x8f_u8, 0x6_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0x95_u8, 0xe1_u8])

  alias FNCERTSRVISSERVERONLINEW = Proc(LibC::LPWSTR, LibC::BOOL*, HRESULT)
  alias FNCERTSRVBACKUPGETDYNAMICFILELISTW = Proc(Void*, UInt16**, UInt32*, HRESULT)
  alias FNCERTSRVBACKUPPREPAREW = Proc(LibC::LPWSTR, UInt32, UInt32, Void**, HRESULT)
  alias FNCERTSRVBACKUPGETDATABASENAMESW = Proc(Void*, UInt16**, UInt32*, HRESULT)
  alias FNCERTSRVBACKUPOPENFILEW = Proc(Void*, LibC::LPWSTR, UInt32, LARGE_INTEGER*, HRESULT)
  alias FNCERTSRVBACKUPREAD = Proc(Void*, Void*, UInt32, UInt32*, HRESULT)
  alias FNCERTSRVBACKUPCLOSE = Proc(Void*, HRESULT)
  alias FNCERTSRVBACKUPGETBACKUPLOGSW = Proc(Void*, UInt16**, UInt32*, HRESULT)
  alias FNCERTSRVBACKUPTRUNCATELOGS = Proc(Void*, HRESULT)
  alias FNCERTSRVBACKUPEND = Proc(Void*, HRESULT)
  alias FNCERTSRVBACKUPFREE = Proc(Void*, Void)
  alias FNCERTSRVRESTOREGETDATABASELOCATIONSW = Proc(Void*, UInt16**, UInt32*, HRESULT)
  alias FNCERTSRVRESTOREPREPAREW = Proc(LibC::LPWSTR, UInt32, Void**, HRESULT)
  alias FNCERTSRVRESTOREREGISTERW = Proc(Void*, LibC::LPWSTR, LibC::LPWSTR, CSEDB_RSTMAPW*, Int32, LibC::LPWSTR, UInt32, UInt32, HRESULT)
  alias FNCERTSRVRESTOREREGISTERCOMPLETE = Proc(Void*, HRESULT, HRESULT)
  alias FNCERTSRVRESTOREEND = Proc(Void*, HRESULT)
  alias FNCERTSRVSERVERCONTROLW = Proc(LibC::LPWSTR, UInt32, UInt32*, UInt8**, HRESULT)
  alias FNIMPORTPFXTOPROVIDER = Proc(LibC::HANDLE, UInt8*, UInt32, ImportPFXFlags, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32*, CERT_CONTEXT***, HRESULT)
  alias FNIMPORTPFXTOPROVIDERFREEDATA = Proc(UInt32, CERT_CONTEXT**, Void)


  enum CERT_VIEW_COLUMN_INDEX : Int32
    CV_COLUMN_LOG_DEFAULT = -2
    CV_COLUMN_LOG_FAILED_DEFAULT = -3
    CV_COLUMN_QUEUE_DEFAULT = -1
  end

  enum CERT_DELETE_ROW_FLAGS : UInt32
    CDR_EXPIRED = 1
    CDR_REQUEST_LAST_CHANGED = 2
  end

  enum FULL_RESPONSE_PROPERTY_ID : UInt32
    FR_PROP_NONE = 0
    FR_PROP_FULLRESPONSE = 1
    FR_PROP_STATUSINFOCOUNT = 2
    FR_PROP_BODYPARTSTRING = 3
    FR_PROP_STATUS = 4
    FR_PROP_STATUSSTRING = 5
    FR_PROP_OTHERINFOCHOICE = 6
    FR_PROP_FAILINFO = 7
    FR_PROP_PENDINFOTOKEN = 8
    FR_PROP_PENDINFOTIME = 9
    FR_PROP_ISSUEDCERTIFICATEHASH = 10
    FR_PROP_ISSUEDCERTIFICATE = 11
    FR_PROP_ISSUEDCERTIFICATECHAIN = 12
    FR_PROP_ISSUEDCERTIFICATECRLCHAIN = 13
    FR_PROP_ENCRYPTEDKEYHASH = 14
    FR_PROP_FULLRESPONSENOPKCS7 = 15
    FR_PROP_CAEXCHANGECERTIFICATEHASH = 16
    FR_PROP_CAEXCHANGECERTIFICATE = 17
    FR_PROP_CAEXCHANGECERTIFICATECHAIN = 18
    FR_PROP_CAEXCHANGECERTIFICATECRLCHAIN = 19
    FR_PROP_ATTESTATIONCHALLENGE = 20
    FR_PROP_ATTESTATIONPROVIDERNAME = 21
  end

  enum CVRC_COLUMN : UInt32
    CVRC_COLUMN_SCHEMA = 0
    CVRC_COLUMN_RESULT = 1
    CVRC_COLUMN_VALUE = 2
    CVRC_COLUMN_MASK = 4095
  end

  enum CERT_IMPORT_FLAGS : UInt32
    CR_IN_BASE64HEADER = 0
    CR_IN_BASE64 = 1
    CR_IN_BINARY = 2
  end

  enum CERT_GET_CONFIG_FLAGS : UInt32
    CC_DEFAULTCONFIG = 0
    CC_FIRSTCONFIG = 2
    CC_LOCALACTIVECONFIG = 4
    CC_LOCALCONFIG = 3
    CC_UIPICKCONFIG = 1
    CC_UIPICKCONFIGSKIPLOCALCA_ = 5
  end

  enum ENUM_CERT_COLUMN_VALUE_FLAGS : UInt32
    CV_OUT_BASE64 = 1
    CV_OUT_BASE64HEADER = 0
    CV_OUT_BASE64REQUESTHEADER = 3
    CV_OUT_BASE64X509CRLHEADER = 9
    CV_OUT_BINARY = 2
    CV_OUT_HEX = 4
    CV_OUT_HEXADDR = 10
    CV_OUT_HEXASCII = 5
    CV_OUT_HEXASCIIADDR = 11
  end

  enum PENDING_REQUEST_DESIRED_PROPERTY : UInt32
    XEPR_CADNS = 1
    XEPR_CAFRIENDLYNAME = 3
    XEPR_CANAME = 2
    XEPR_HASH = 8
    XEPR_REQUESTID = 4
  end

  enum CERTADMIN_GET_ROLES_FLAGS : UInt32
    CA_ACCESS_ADMIN = 1
    CA_ACCESS_AUDITOR = 4
    CA_ACCESS_ENROLL = 512
    CA_ACCESS_OFFICER = 2
    CA_ACCESS_OPERATOR = 8
    CA_ACCESS_READ = 256
  end

  enum CR_DISP : UInt32
    CR_DISP_DENIED = 2
    CR_DISP_ERROR = 1
    CR_DISP_INCOMPLETE = 0
    CR_DISP_ISSUED = 3
    CR_DISP_ISSUED_OUT_OF_BAND = 4
    CR_DISP_UNDER_SUBMISSION = 5
  end

  enum XEKL_KEYSIZE : UInt32
    XEKL_KEYSIZE_MIN = 1
    XEKL_KEYSIZE_MAX = 2
    XEKL_KEYSIZE_INC = 3
  end

  enum CERT_CREATE_REQUEST_FLAGS : UInt32
    XECR_CMC = 3
    XECR_PKCS10_V1_5 = 4
    XECR_PKCS10_V2_0 = 1
    XECR_PKCS7 = 2
  end

  enum CERT_EXIT_EVENT_MASK : UInt32
    EXITEVENT_CERTDENIED = 4
    EXITEVENT_CERTISSUED = 1
    EXITEVENT_CERTPENDING = 2
    EXITEVENT_CERTRETRIEVEPENDING = 16
    EXITEVENT_CERTREVOKED = 8
    EXITEVENT_CRLISSUED = 32
    EXITEVENT_SHUTDOWN = 64
  end

  enum ADDED_CERT_TYPE : UInt32
    XECT_EXTENSION_V1 = 1
    XECT_EXTENSION_V2 = 2
  end

  enum CVRC_TABLE : UInt32
    CVRC_TABLE_ATTRIBUTES = 16384
    CVRC_TABLE_CRL = 20480
    CVRC_TABLE_EXTENSIONS = 12288
    CVRC_TABLE_REQCERT = 0
  end

  enum CERT_PROPERTY_TYPE : UInt32
    PROPTYPE_BINARY = 3
    PROPTYPE_DATE = 2
    PROPTYPE_LONG = 1
    PROPTYPE_STRING = 4
  end

  enum CERT_ALT_NAME : UInt32
    CERT_ALT_NAME_RFC822_NAME = 2
    CERT_ALT_NAME_DNS_NAME = 3
    CERT_ALT_NAME_URL = 7
    CERT_ALT_NAME_REGISTERED_ID = 9
    CERT_ALT_NAME_DIRECTORY_NAME = 5
    CERT_ALT_NAME_IP_ADDRESS = 8
    CERT_ALT_NAME_OTHER_NAME = 1
  end

  enum CSBACKUP_TYPE : UInt32
    CSBACKUP_TYPE_FULL = 1
    CSBACKUP_TYPE_LOGS_ONLY = 2
  end

  enum XEKL_KEYSPEC : UInt32
    XEKL_KEYSPEC_KEYX = 1
    XEKL_KEYSPEC_SIG = 2
  end

  enum CERT_REQUEST_OUT_TYPE : UInt32
    CR_OUT_BASE64HEADER = 0
    CR_OUT_BASE64 = 1
    CR_OUT_BINARY = 2
  end

  enum CERT_VIEW_SEEK_OPERATOR_FLAGS : UInt32
    CVR_SEEK_EQ = 1
    CVR_SEEK_LE = 4
    CVR_SEEK_LT = 2
    CVR_SEEK_GE = 8
    CVR_SEEK_GT = 16
  end

  enum OCSPSigningFlag : Int32
    OCSP_SF_SILENT = 1
    OCSP_SF_USE_CACERT = 2
    OCSP_SF_ALLOW_SIGNINGCERT_AUTORENEWAL = 4
    OCSP_SF_FORCE_SIGNINGCERT_ISSUER_ISCA = 8
    OCSP_SF_AUTODISCOVER_SIGNINGCERT = 16
    OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT = 32
    OCSP_SF_RESPONDER_ID_KEYHASH = 64
    OCSP_SF_RESPONDER_ID_NAME = 128
    OCSP_SF_ALLOW_NONCE_EXTENSION = 256
    OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT = 512
  end

  enum OCSPRequestFlag : Int32
    OCSP_RF_REJECT_SIGNED_REQUESTS = 1
  end

  enum X509EnrollmentAuthFlags : Int32
    X509AuthNone = 0
    X509AuthAnonymous = 1
    X509AuthKerberos = 2
    X509AuthUsername = 4
    X509AuthCertificate = 8
  end

  enum X509SCEPMessageType : Int32
    SCEPMessageUnknown = -1
    SCEPMessageCertResponse = 3
    SCEPMessagePKCSRequest = 19
    SCEPMessageGetCertInitial = 20
    SCEPMessageGetCert = 21
    SCEPMessageGetCRL = 22
    SCEPMessageClaimChallengeAnswer = 41
  end

  enum X509SCEPDisposition : Int32
    SCEPDispositionUnknown = -1
    SCEPDispositionSuccess = 0
    SCEPDispositionFailure = 2
    SCEPDispositionPending = 3
    SCEPDispositionPendingChallenge = 11
  end

  enum X509SCEPFailInfo : Int32
    SCEPFailUnknown = -1
    SCEPFailBadAlgorithm = 0
    SCEPFailBadMessageCheck = 1
    SCEPFailBadRequest = 2
    SCEPFailBadTime = 3
    SCEPFailBadCertId = 4
  end

  enum CERTENROLL_OBJECTID : Int32
    XCN_OID_NONE = 0
    XCN_OID_RSA = 1
    XCN_OID_PKCS = 2
    XCN_OID_RSA_HASH = 3
    XCN_OID_RSA_ENCRYPT = 4
    XCN_OID_PKCS_1 = 5
    XCN_OID_PKCS_2 = 6
    XCN_OID_PKCS_3 = 7
    XCN_OID_PKCS_4 = 8
    XCN_OID_PKCS_5 = 9
    XCN_OID_PKCS_6 = 10
    XCN_OID_PKCS_7 = 11
    XCN_OID_PKCS_8 = 12
    XCN_OID_PKCS_9 = 13
    XCN_OID_PKCS_10 = 14
    XCN_OID_PKCS_12 = 15
    XCN_OID_RSA_RSA = 16
    XCN_OID_RSA_MD2RSA = 17
    XCN_OID_RSA_MD4RSA = 18
    XCN_OID_RSA_MD5RSA = 19
    XCN_OID_RSA_SHA1RSA = 20
    XCN_OID_RSA_SETOAEP_RSA = 21
    XCN_OID_RSA_DH = 22
    XCN_OID_RSA_data = 23
    XCN_OID_RSA_signedData = 24
    XCN_OID_RSA_envelopedData = 25
    XCN_OID_RSA_signEnvData = 26
    XCN_OID_RSA_digestedData = 27
    XCN_OID_RSA_hashedData = 28
    XCN_OID_RSA_encryptedData = 29
    XCN_OID_RSA_emailAddr = 30
    XCN_OID_RSA_unstructName = 31
    XCN_OID_RSA_contentType = 32
    XCN_OID_RSA_messageDigest = 33
    XCN_OID_RSA_signingTime = 34
    XCN_OID_RSA_counterSign = 35
    XCN_OID_RSA_challengePwd = 36
    XCN_OID_RSA_unstructAddr = 37
    XCN_OID_RSA_extCertAttrs = 38
    XCN_OID_RSA_certExtensions = 39
    XCN_OID_RSA_SMIMECapabilities = 40
    XCN_OID_RSA_preferSignedData = 41
    XCN_OID_RSA_SMIMEalg = 42
    XCN_OID_RSA_SMIMEalgESDH = 43
    XCN_OID_RSA_SMIMEalgCMS3DESwrap = 44
    XCN_OID_RSA_SMIMEalgCMSRC2wrap = 45
    XCN_OID_RSA_MD2 = 46
    XCN_OID_RSA_MD4 = 47
    XCN_OID_RSA_MD5 = 48
    XCN_OID_RSA_RC2CBC = 49
    XCN_OID_RSA_RC4 = 50
    XCN_OID_RSA_DES_EDE3_CBC = 51
    XCN_OID_RSA_RC5_CBCPad = 52
    XCN_OID_ANSI_X942 = 53
    XCN_OID_ANSI_X942_DH = 54
    XCN_OID_X957 = 55
    XCN_OID_X957_DSA = 56
    XCN_OID_X957_SHA1DSA = 57
    XCN_OID_DS = 58
    XCN_OID_DSALG = 59
    XCN_OID_DSALG_CRPT = 60
    XCN_OID_DSALG_HASH = 61
    XCN_OID_DSALG_SIGN = 62
    XCN_OID_DSALG_RSA = 63
    XCN_OID_OIW = 64
    XCN_OID_OIWSEC = 65
    XCN_OID_OIWSEC_md4RSA = 66
    XCN_OID_OIWSEC_md5RSA = 67
    XCN_OID_OIWSEC_md4RSA2 = 68
    XCN_OID_OIWSEC_desECB = 69
    XCN_OID_OIWSEC_desCBC = 70
    XCN_OID_OIWSEC_desOFB = 71
    XCN_OID_OIWSEC_desCFB = 72
    XCN_OID_OIWSEC_desMAC = 73
    XCN_OID_OIWSEC_rsaSign = 74
    XCN_OID_OIWSEC_dsa = 75
    XCN_OID_OIWSEC_shaDSA = 76
    XCN_OID_OIWSEC_mdc2RSA = 77
    XCN_OID_OIWSEC_shaRSA = 78
    XCN_OID_OIWSEC_dhCommMod = 79
    XCN_OID_OIWSEC_desEDE = 80
    XCN_OID_OIWSEC_sha = 81
    XCN_OID_OIWSEC_mdc2 = 82
    XCN_OID_OIWSEC_dsaComm = 83
    XCN_OID_OIWSEC_dsaCommSHA = 84
    XCN_OID_OIWSEC_rsaXchg = 85
    XCN_OID_OIWSEC_keyHashSeal = 86
    XCN_OID_OIWSEC_md2RSASign = 87
    XCN_OID_OIWSEC_md5RSASign = 88
    XCN_OID_OIWSEC_sha1 = 89
    XCN_OID_OIWSEC_dsaSHA1 = 90
    XCN_OID_OIWSEC_dsaCommSHA1 = 91
    XCN_OID_OIWSEC_sha1RSASign = 92
    XCN_OID_OIWDIR = 93
    XCN_OID_OIWDIR_CRPT = 94
    XCN_OID_OIWDIR_HASH = 95
    XCN_OID_OIWDIR_SIGN = 96
    XCN_OID_OIWDIR_md2 = 97
    XCN_OID_OIWDIR_md2RSA = 98
    XCN_OID_INFOSEC = 99
    XCN_OID_INFOSEC_sdnsSignature = 100
    XCN_OID_INFOSEC_mosaicSignature = 101
    XCN_OID_INFOSEC_sdnsConfidentiality = 102
    XCN_OID_INFOSEC_mosaicConfidentiality = 103
    XCN_OID_INFOSEC_sdnsIntegrity = 104
    XCN_OID_INFOSEC_mosaicIntegrity = 105
    XCN_OID_INFOSEC_sdnsTokenProtection = 106
    XCN_OID_INFOSEC_mosaicTokenProtection = 107
    XCN_OID_INFOSEC_sdnsKeyManagement = 108
    XCN_OID_INFOSEC_mosaicKeyManagement = 109
    XCN_OID_INFOSEC_sdnsKMandSig = 110
    XCN_OID_INFOSEC_mosaicKMandSig = 111
    XCN_OID_INFOSEC_SuiteASignature = 112
    XCN_OID_INFOSEC_SuiteAConfidentiality = 113
    XCN_OID_INFOSEC_SuiteAIntegrity = 114
    XCN_OID_INFOSEC_SuiteATokenProtection = 115
    XCN_OID_INFOSEC_SuiteAKeyManagement = 116
    XCN_OID_INFOSEC_SuiteAKMandSig = 117
    XCN_OID_INFOSEC_mosaicUpdatedSig = 118
    XCN_OID_INFOSEC_mosaicKMandUpdSig = 119
    XCN_OID_INFOSEC_mosaicUpdatedInteg = 120
    XCN_OID_COMMON_NAME = 121
    XCN_OID_SUR_NAME = 122
    XCN_OID_DEVICE_SERIAL_NUMBER = 123
    XCN_OID_COUNTRY_NAME = 124
    XCN_OID_LOCALITY_NAME = 125
    XCN_OID_STATE_OR_PROVINCE_NAME = 126
    XCN_OID_STREET_ADDRESS = 127
    XCN_OID_ORGANIZATION_NAME = 128
    XCN_OID_ORGANIZATIONAL_UNIT_NAME = 129
    XCN_OID_TITLE = 130
    XCN_OID_DESCRIPTION = 131
    XCN_OID_SEARCH_GUIDE = 132
    XCN_OID_BUSINESS_CATEGORY = 133
    XCN_OID_POSTAL_ADDRESS = 134
    XCN_OID_POSTAL_CODE = 135
    XCN_OID_POST_OFFICE_BOX = 136
    XCN_OID_PHYSICAL_DELIVERY_OFFICE_NAME = 137
    XCN_OID_TELEPHONE_NUMBER = 138
    XCN_OID_TELEX_NUMBER = 139
    XCN_OID_TELETEXT_TERMINAL_IDENTIFIER = 140
    XCN_OID_FACSIMILE_TELEPHONE_NUMBER = 141
    XCN_OID_X21_ADDRESS = 142
    XCN_OID_INTERNATIONAL_ISDN_NUMBER = 143
    XCN_OID_REGISTERED_ADDRESS = 144
    XCN_OID_DESTINATION_INDICATOR = 145
    XCN_OID_PREFERRED_DELIVERY_METHOD = 146
    XCN_OID_PRESENTATION_ADDRESS = 147
    XCN_OID_SUPPORTED_APPLICATION_CONTEXT = 148
    XCN_OID_MEMBER = 149
    XCN_OID_OWNER = 150
    XCN_OID_ROLE_OCCUPANT = 151
    XCN_OID_SEE_ALSO = 152
    XCN_OID_USER_PASSWORD = 153
    XCN_OID_USER_CERTIFICATE = 154
    XCN_OID_CA_CERTIFICATE = 155
    XCN_OID_AUTHORITY_REVOCATION_LIST = 156
    XCN_OID_CERTIFICATE_REVOCATION_LIST = 157
    XCN_OID_CROSS_CERTIFICATE_PAIR = 158
    XCN_OID_GIVEN_NAME = 159
    XCN_OID_INITIALS = 160
    XCN_OID_DN_QUALIFIER = 161
    XCN_OID_DOMAIN_COMPONENT = 162
    XCN_OID_PKCS_12_FRIENDLY_NAME_ATTR = 163
    XCN_OID_PKCS_12_LOCAL_KEY_ID = 164
    XCN_OID_PKCS_12_KEY_PROVIDER_NAME_ATTR = 165
    XCN_OID_LOCAL_MACHINE_KEYSET = 166
    XCN_OID_PKCS_12_EXTENDED_ATTRIBUTES = 167
    XCN_OID_KEYID_RDN = 168
    XCN_OID_AUTHORITY_KEY_IDENTIFIER = 169
    XCN_OID_KEY_ATTRIBUTES = 170
    XCN_OID_CERT_POLICIES_95 = 171
    XCN_OID_KEY_USAGE_RESTRICTION = 172
    XCN_OID_SUBJECT_ALT_NAME = 173
    XCN_OID_ISSUER_ALT_NAME = 174
    XCN_OID_BASIC_CONSTRAINTS = 175
    XCN_OID_KEY_USAGE = 176
    XCN_OID_PRIVATEKEY_USAGE_PERIOD = 177
    XCN_OID_BASIC_CONSTRAINTS2 = 178
    XCN_OID_CERT_POLICIES = 179
    XCN_OID_ANY_CERT_POLICY = 180
    XCN_OID_AUTHORITY_KEY_IDENTIFIER2 = 181
    XCN_OID_SUBJECT_KEY_IDENTIFIER = 182
    XCN_OID_SUBJECT_ALT_NAME2 = 183
    XCN_OID_ISSUER_ALT_NAME2 = 184
    XCN_OID_CRL_REASON_CODE = 185
    XCN_OID_REASON_CODE_HOLD = 186
    XCN_OID_CRL_DIST_POINTS = 187
    XCN_OID_ENHANCED_KEY_USAGE = 188
    XCN_OID_CRL_NUMBER = 189
    XCN_OID_DELTA_CRL_INDICATOR = 190
    XCN_OID_ISSUING_DIST_POINT = 191
    XCN_OID_FRESHEST_CRL = 192
    XCN_OID_NAME_CONSTRAINTS = 193
    XCN_OID_POLICY_MAPPINGS = 194
    XCN_OID_LEGACY_POLICY_MAPPINGS = 195
    XCN_OID_POLICY_CONSTRAINTS = 196
    XCN_OID_RENEWAL_CERTIFICATE = 197
    XCN_OID_ENROLLMENT_NAME_VALUE_PAIR = 198
    XCN_OID_ENROLLMENT_CSP_PROVIDER = 199
    XCN_OID_OS_VERSION = 200
    XCN_OID_ENROLLMENT_AGENT = 201
    XCN_OID_PKIX = 202
    XCN_OID_PKIX_PE = 203
    XCN_OID_AUTHORITY_INFO_ACCESS = 204
    XCN_OID_BIOMETRIC_EXT = 205
    XCN_OID_LOGOTYPE_EXT = 206
    XCN_OID_CERT_EXTENSIONS = 207
    XCN_OID_NEXT_UPDATE_LOCATION = 208
    XCN_OID_REMOVE_CERTIFICATE = 209
    XCN_OID_CROSS_CERT_DIST_POINTS = 210
    XCN_OID_CTL = 211
    XCN_OID_SORTED_CTL = 212
    XCN_OID_SERIALIZED = 213
    XCN_OID_NT_PRINCIPAL_NAME = 214
    XCN_OID_PRODUCT_UPDATE = 215
    XCN_OID_ANY_APPLICATION_POLICY = 216
    XCN_OID_AUTO_ENROLL_CTL_USAGE = 217
    XCN_OID_ENROLL_CERTTYPE_EXTENSION = 218
    XCN_OID_CERT_MANIFOLD = 219
    XCN_OID_CERTSRV_CA_VERSION = 220
    XCN_OID_CERTSRV_PREVIOUS_CERT_HASH = 221
    XCN_OID_CRL_VIRTUAL_BASE = 222
    XCN_OID_CRL_NEXT_PUBLISH = 223
    XCN_OID_KP_CA_EXCHANGE = 224
    XCN_OID_KP_KEY_RECOVERY_AGENT = 225
    XCN_OID_CERTIFICATE_TEMPLATE = 226
    XCN_OID_ENTERPRISE_OID_ROOT = 227
    XCN_OID_RDN_DUMMY_SIGNER = 228
    XCN_OID_APPLICATION_CERT_POLICIES = 229
    XCN_OID_APPLICATION_POLICY_MAPPINGS = 230
    XCN_OID_APPLICATION_POLICY_CONSTRAINTS = 231
    XCN_OID_ARCHIVED_KEY_ATTR = 232
    XCN_OID_CRL_SELF_CDP = 233
    XCN_OID_REQUIRE_CERT_CHAIN_POLICY = 234
    XCN_OID_ARCHIVED_KEY_CERT_HASH = 235
    XCN_OID_ISSUED_CERT_HASH = 236
    XCN_OID_DS_EMAIL_REPLICATION = 237
    XCN_OID_REQUEST_CLIENT_INFO = 238
    XCN_OID_ENCRYPTED_KEY_HASH = 239
    XCN_OID_CERTSRV_CROSSCA_VERSION = 240
    XCN_OID_NTDS_REPLICATION = 241
    XCN_OID_SUBJECT_DIR_ATTRS = 242
    XCN_OID_PKIX_KP = 243
    XCN_OID_PKIX_KP_SERVER_AUTH = 244
    XCN_OID_PKIX_KP_CLIENT_AUTH = 245
    XCN_OID_PKIX_KP_CODE_SIGNING = 246
    XCN_OID_PKIX_KP_EMAIL_PROTECTION = 247
    XCN_OID_PKIX_KP_IPSEC_END_SYSTEM = 248
    XCN_OID_PKIX_KP_IPSEC_TUNNEL = 249
    XCN_OID_PKIX_KP_IPSEC_USER = 250
    XCN_OID_PKIX_KP_TIMESTAMP_SIGNING = 251
    XCN_OID_PKIX_KP_OCSP_SIGNING = 252
    XCN_OID_PKIX_OCSP_NOCHECK = 253
    XCN_OID_IPSEC_KP_IKE_INTERMEDIATE = 254
    XCN_OID_KP_CTL_USAGE_SIGNING = 255
    XCN_OID_KP_TIME_STAMP_SIGNING = 256
    XCN_OID_SERVER_GATED_CRYPTO = 257
    XCN_OID_SGC_NETSCAPE = 258
    XCN_OID_KP_EFS = 259
    XCN_OID_EFS_RECOVERY = 260
    XCN_OID_WHQL_CRYPTO = 261
    XCN_OID_NT5_CRYPTO = 262
    XCN_OID_OEM_WHQL_CRYPTO = 263
    XCN_OID_EMBEDDED_NT_CRYPTO = 264
    XCN_OID_ROOT_LIST_SIGNER = 265
    XCN_OID_KP_QUALIFIED_SUBORDINATION = 266
    XCN_OID_KP_KEY_RECOVERY = 267
    XCN_OID_KP_DOCUMENT_SIGNING = 268
    XCN_OID_KP_LIFETIME_SIGNING = 269
    XCN_OID_KP_MOBILE_DEVICE_SOFTWARE = 270
    XCN_OID_KP_SMART_DISPLAY = 271
    XCN_OID_KP_CSP_SIGNATURE = 272
    XCN_OID_DRM = 273
    XCN_OID_DRM_INDIVIDUALIZATION = 274
    XCN_OID_LICENSES = 275
    XCN_OID_LICENSE_SERVER = 276
    XCN_OID_KP_SMARTCARD_LOGON = 277
    XCN_OID_YESNO_TRUST_ATTR = 278
    XCN_OID_PKIX_POLICY_QUALIFIER_CPS = 279
    XCN_OID_PKIX_POLICY_QUALIFIER_USERNOTICE = 280
    XCN_OID_CERT_POLICIES_95_QUALIFIER1 = 281
    XCN_OID_PKIX_ACC_DESCR = 282
    XCN_OID_PKIX_OCSP = 283
    XCN_OID_PKIX_CA_ISSUERS = 284
    XCN_OID_VERISIGN_PRIVATE_6_9 = 285
    XCN_OID_VERISIGN_ONSITE_JURISDICTION_HASH = 286
    XCN_OID_VERISIGN_BITSTRING_6_13 = 287
    XCN_OID_VERISIGN_ISS_STRONG_CRYPTO = 288
    XCN_OID_NETSCAPE = 289
    XCN_OID_NETSCAPE_CERT_EXTENSION = 290
    XCN_OID_NETSCAPE_CERT_TYPE = 291
    XCN_OID_NETSCAPE_BASE_URL = 292
    XCN_OID_NETSCAPE_REVOCATION_URL = 293
    XCN_OID_NETSCAPE_CA_REVOCATION_URL = 294
    XCN_OID_NETSCAPE_CERT_RENEWAL_URL = 295
    XCN_OID_NETSCAPE_CA_POLICY_URL = 296
    XCN_OID_NETSCAPE_SSL_SERVER_NAME = 297
    XCN_OID_NETSCAPE_COMMENT = 298
    XCN_OID_NETSCAPE_DATA_TYPE = 299
    XCN_OID_NETSCAPE_CERT_SEQUENCE = 300
    XCN_OID_CT_PKI_DATA = 301
    XCN_OID_CT_PKI_RESPONSE = 302
    XCN_OID_PKIX_NO_SIGNATURE = 303
    XCN_OID_CMC = 304
    XCN_OID_CMC_STATUS_INFO = 305
    XCN_OID_CMC_IDENTIFICATION = 306
    XCN_OID_CMC_IDENTITY_PROOF = 307
    XCN_OID_CMC_DATA_RETURN = 308
    XCN_OID_CMC_TRANSACTION_ID = 309
    XCN_OID_CMC_SENDER_NONCE = 310
    XCN_OID_CMC_RECIPIENT_NONCE = 311
    XCN_OID_CMC_ADD_EXTENSIONS = 312
    XCN_OID_CMC_ENCRYPTED_POP = 313
    XCN_OID_CMC_DECRYPTED_POP = 314
    XCN_OID_CMC_LRA_POP_WITNESS = 315
    XCN_OID_CMC_GET_CERT = 316
    XCN_OID_CMC_GET_CRL = 317
    XCN_OID_CMC_REVOKE_REQUEST = 318
    XCN_OID_CMC_REG_INFO = 319
    XCN_OID_CMC_RESPONSE_INFO = 320
    XCN_OID_CMC_QUERY_PENDING = 321
    XCN_OID_CMC_ID_POP_LINK_RANDOM = 322
    XCN_OID_CMC_ID_POP_LINK_WITNESS = 323
    XCN_OID_CMC_ID_CONFIRM_CERT_ACCEPTANCE = 324
    XCN_OID_CMC_ADD_ATTRIBUTES = 325
    XCN_OID_LOYALTY_OTHER_LOGOTYPE = 326
    XCN_OID_BACKGROUND_OTHER_LOGOTYPE = 327
    XCN_OID_PKIX_OCSP_BASIC_SIGNED_RESPONSE = 328
    XCN_OID_PKCS_7_DATA = 329
    XCN_OID_PKCS_7_SIGNED = 330
    XCN_OID_PKCS_7_ENVELOPED = 331
    XCN_OID_PKCS_7_SIGNEDANDENVELOPED = 332
    XCN_OID_PKCS_7_DIGESTED = 333
    XCN_OID_PKCS_7_ENCRYPTED = 334
    XCN_OID_PKCS_9_CONTENT_TYPE = 335
    XCN_OID_PKCS_9_MESSAGE_DIGEST = 336
    XCN_OID_CERT_PROP_ID_PREFIX = 337
    XCN_OID_CERT_KEY_IDENTIFIER_PROP_ID = 338
    XCN_OID_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = 339
    XCN_OID_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = 340
    XCN_OID_CERT_MD5_HASH_PROP_ID = 341
    XCN_OID_RSA_SHA256RSA = 342
    XCN_OID_RSA_SHA384RSA = 343
    XCN_OID_RSA_SHA512RSA = 344
    XCN_OID_NIST_sha256 = 345
    XCN_OID_NIST_sha384 = 346
    XCN_OID_NIST_sha512 = 347
    XCN_OID_RSA_MGF1 = 348
    XCN_OID_ECC_PUBLIC_KEY = 349
    XCN_OID_ECDSA_SHA1 = 350
    XCN_OID_ECDSA_SPECIFIED = 351
    XCN_OID_ANY_ENHANCED_KEY_USAGE = 352
    XCN_OID_RSA_SSA_PSS = 353
    XCN_OID_ATTR_SUPPORTED_ALGORITHMS = 355
    XCN_OID_ATTR_TPM_SECURITY_ASSERTIONS = 356
    XCN_OID_ATTR_TPM_SPECIFICATION = 357
    XCN_OID_CERT_DISALLOWED_FILETIME_PROP_ID = 358
    XCN_OID_CERT_SIGNATURE_HASH_PROP_ID = 359
    XCN_OID_CERT_STRONG_KEY_OS_1 = 360
    XCN_OID_CERT_STRONG_KEY_OS_CURRENT = 361
    XCN_OID_CERT_STRONG_KEY_OS_PREFIX = 362
    XCN_OID_CERT_STRONG_SIGN_OS_1 = 363
    XCN_OID_CERT_STRONG_SIGN_OS_CURRENT = 364
    XCN_OID_CERT_STRONG_SIGN_OS_PREFIX = 365
    XCN_OID_DH_SINGLE_PASS_STDDH_SHA1_KDF = 366
    XCN_OID_DH_SINGLE_PASS_STDDH_SHA256_KDF = 367
    XCN_OID_DH_SINGLE_PASS_STDDH_SHA384_KDF = 368
    XCN_OID_DISALLOWED_HASH = 369
    XCN_OID_DISALLOWED_LIST = 370
    XCN_OID_ECC_CURVE_P256 = 371
    XCN_OID_ECC_CURVE_P384 = 372
    XCN_OID_ECC_CURVE_P521 = 373
    XCN_OID_ECDSA_SHA256 = 374
    XCN_OID_ECDSA_SHA384 = 375
    XCN_OID_ECDSA_SHA512 = 376
    XCN_OID_ENROLL_CAXCHGCERT_HASH = 377
    XCN_OID_ENROLL_EK_INFO = 378
    XCN_OID_ENROLL_EKPUB_CHALLENGE = 379
    XCN_OID_ENROLL_EKVERIFYCERT = 380
    XCN_OID_ENROLL_EKVERIFYCREDS = 381
    XCN_OID_ENROLL_EKVERIFYKEY = 382
    XCN_OID_EV_RDN_COUNTRY = 383
    XCN_OID_EV_RDN_LOCALE = 384
    XCN_OID_EV_RDN_STATE_OR_PROVINCE = 385
    XCN_OID_INHIBIT_ANY_POLICY = 386
    XCN_OID_INTERNATIONALIZED_EMAIL_ADDRESS = 387
    XCN_OID_KP_KERNEL_MODE_CODE_SIGNING = 388
    XCN_OID_KP_KERNEL_MODE_HAL_EXTENSION_SIGNING = 389
    XCN_OID_KP_KERNEL_MODE_TRUSTED_BOOT_SIGNING = 390
    XCN_OID_KP_TPM_AIK_CERTIFICATE = 391
    XCN_OID_KP_TPM_EK_CERTIFICATE = 392
    XCN_OID_KP_TPM_PLATFORM_CERTIFICATE = 393
    XCN_OID_NIST_AES128_CBC = 394
    XCN_OID_NIST_AES128_WRAP = 395
    XCN_OID_NIST_AES192_CBC = 396
    XCN_OID_NIST_AES192_WRAP = 397
    XCN_OID_NIST_AES256_CBC = 398
    XCN_OID_NIST_AES256_WRAP = 399
    XCN_OID_PKCS_12_PbeIds = 400
    XCN_OID_PKCS_12_pbeWithSHA1And128BitRC2 = 401
    XCN_OID_PKCS_12_pbeWithSHA1And128BitRC4 = 402
    XCN_OID_PKCS_12_pbeWithSHA1And2KeyTripleDES = 403
    XCN_OID_PKCS_12_pbeWithSHA1And3KeyTripleDES = 404
    XCN_OID_PKCS_12_pbeWithSHA1And40BitRC2 = 405
    XCN_OID_PKCS_12_pbeWithSHA1And40BitRC4 = 406
    XCN_OID_PKCS_12_PROTECTED_PASSWORD_SECRET_BAG_TYPE_ID = 407
    XCN_OID_PKINIT_KP_KDC = 408
    XCN_OID_PKIX_CA_REPOSITORY = 409
    XCN_OID_PKIX_OCSP_NONCE = 410
    XCN_OID_PKIX_TIME_STAMPING = 411
    XCN_OID_QC_EU_COMPLIANCE = 412
    XCN_OID_QC_SSCD = 413
    XCN_OID_QC_STATEMENTS_EXT = 414
    XCN_OID_RDN_TPM_MANUFACTURER = 415
    XCN_OID_RDN_TPM_MODEL = 416
    XCN_OID_RDN_TPM_VERSION = 417
    XCN_OID_REVOKED_LIST_SIGNER = 418
    XCN_OID_RFC3161_counterSign = 419
    XCN_OID_ROOT_PROGRAM_AUTO_UPDATE_CA_REVOCATION = 420
    XCN_OID_ROOT_PROGRAM_AUTO_UPDATE_END_REVOCATION = 421
    XCN_OID_ROOT_PROGRAM_FLAGS = 422
    XCN_OID_ROOT_PROGRAM_NO_OCSP_FAILOVER_TO_CRL = 423
    XCN_OID_RSA_PSPECIFIED = 424
    XCN_OID_RSAES_OAEP = 425
    XCN_OID_SUBJECT_INFO_ACCESS = 426
    XCN_OID_TIMESTAMP_TOKEN = 427
    XCN_OID_ENROLL_SCEP_ERROR = 428
    XCN_OIDVerisign_MessageType = 429
    XCN_OIDVerisign_PkiStatus = 430
    XCN_OIDVerisign_FailInfo = 431
    XCN_OIDVerisign_SenderNonce = 432
    XCN_OIDVerisign_RecipientNonce = 433
    XCN_OIDVerisign_TransactionID = 434
    XCN_OID_ENROLL_ATTESTATION_CHALLENGE = 435
    XCN_OID_ENROLL_ATTESTATION_STATEMENT = 436
    XCN_OID_ENROLL_ENCRYPTION_ALGORITHM = 437
    XCN_OID_ENROLL_KSP_NAME = 438
  end

  enum WebSecurityLevel : Int32
    LevelUnsafe = 0
    LevelSafe = 1
  end

  enum EncodingType : Int32
    XCN_CRYPT_STRING_BASE64HEADER = 0
    XCN_CRYPT_STRING_BASE64 = 1
    XCN_CRYPT_STRING_BINARY = 2
    XCN_CRYPT_STRING_BASE64REQUESTHEADER = 3
    XCN_CRYPT_STRING_HEX = 4
    XCN_CRYPT_STRING_HEXASCII = 5
    XCN_CRYPT_STRING_BASE64_ANY = 6
    XCN_CRYPT_STRING_ANY = 7
    XCN_CRYPT_STRING_HEX_ANY = 8
    XCN_CRYPT_STRING_BASE64X509CRLHEADER = 9
    XCN_CRYPT_STRING_HEXADDR = 10
    XCN_CRYPT_STRING_HEXASCIIADDR = 11
    XCN_CRYPT_STRING_HEXRAW = 12
    XCN_CRYPT_STRING_BASE64URI = 13
    XCN_CRYPT_STRING_ENCODEMASK = 255
    XCN_CRYPT_STRING_CHAIN = 256
    XCN_CRYPT_STRING_TEXT = 512
    XCN_CRYPT_STRING_PERCENTESCAPE = 134217728
    XCN_CRYPT_STRING_HASHDATA = 268435456
    XCN_CRYPT_STRING_STRICT = 536870912
    XCN_CRYPT_STRING_NOCRLF = 1073741824
    XCN_CRYPT_STRING_NOCR = -2147483648
  end

  enum PFXExportOptions : Int32
    PFXExportEEOnly = 0
    PFXExportChainNoRoot = 1
    PFXExportChainWithRoot = 2
  end

  enum ObjectIdGroupId : Int32
    XCN_CRYPT_ANY_GROUP_ID = 0
    XCN_CRYPT_HASH_ALG_OID_GROUP_ID = 1
    XCN_CRYPT_ENCRYPT_ALG_OID_GROUP_ID = 2
    XCN_CRYPT_PUBKEY_ALG_OID_GROUP_ID = 3
    XCN_CRYPT_SIGN_ALG_OID_GROUP_ID = 4
    XCN_CRYPT_RDN_ATTR_OID_GROUP_ID = 5
    XCN_CRYPT_EXT_OR_ATTR_OID_GROUP_ID = 6
    XCN_CRYPT_ENHKEY_USAGE_OID_GROUP_ID = 7
    XCN_CRYPT_POLICY_OID_GROUP_ID = 8
    XCN_CRYPT_TEMPLATE_OID_GROUP_ID = 9
    XCN_CRYPT_KDF_OID_GROUP_ID = 10
    XCN_CRYPT_LAST_OID_GROUP_ID = 10
    XCN_CRYPT_FIRST_ALG_OID_GROUP_ID = 1
    XCN_CRYPT_LAST_ALG_OID_GROUP_ID = 4
    XCN_CRYPT_GROUP_ID_MASK = 65535
    XCN_CRYPT_OID_PREFER_CNG_ALGID_FLAG = 1073741824
    XCN_CRYPT_OID_DISABLE_SEARCH_DS_FLAG = -2147483648
    XCN_CRYPT_OID_INFO_OID_GROUP_BIT_LEN_MASK = 268369920
    XCN_CRYPT_OID_INFO_OID_GROUP_BIT_LEN_SHIFT = 16
    XCN_CRYPT_KEY_LENGTH_MASK = 268369920
  end

  enum ObjectIdPublicKeyFlags : Int32
    XCN_CRYPT_OID_INFO_PUBKEY_ANY = 0
    XCN_CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG = -2147483648
    XCN_CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG = 1073741824
  end

  enum AlgorithmFlags : Int32
    AlgorithmFlagsNone = 0
    AlgorithmFlagsWrap = 1
  end

  enum X500NameFlags : Int32
    XCN_CERT_NAME_STR_NONE = 0
    XCN_CERT_SIMPLE_NAME_STR = 1
    XCN_CERT_OID_NAME_STR = 2
    XCN_CERT_X500_NAME_STR = 3
    XCN_CERT_XML_NAME_STR = 4
    XCN_CERT_NAME_STR_SEMICOLON_FLAG = 1073741824
    XCN_CERT_NAME_STR_NO_PLUS_FLAG = 536870912
    XCN_CERT_NAME_STR_NO_QUOTING_FLAG = 268435456
    XCN_CERT_NAME_STR_CRLF_FLAG = 134217728
    XCN_CERT_NAME_STR_COMMA_FLAG = 67108864
    XCN_CERT_NAME_STR_REVERSE_FLAG = 33554432
    XCN_CERT_NAME_STR_FORWARD_FLAG = 16777216
    XCN_CERT_NAME_STR_AMBIGUOUS_SEPARATOR_FLAGS = 1275068416
    XCN_CERT_NAME_STR_DISABLE_IE4_UTF8_FLAG = 65536
    XCN_CERT_NAME_STR_ENABLE_T61_UNICODE_FLAG = 131072
    XCN_CERT_NAME_STR_ENABLE_UTF8_UNICODE_FLAG = 262144
    XCN_CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG = 524288
    XCN_CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG = 1048576
    XCN_CERT_NAME_STR_ENABLE_PUNYCODE_FLAG = 2097152
    XCN_CERT_NAME_STR_DS_ESCAPED = 8388608
  end

  enum X509CertificateEnrollmentContext : Int32
    ContextNone = 0
    ContextUser = 1
    ContextMachine = 2
    ContextAdministratorForceMachine = 3
  end

  enum EnrollmentEnrollStatus : Int32
    Enrolled = 1
    EnrollPended = 2
    EnrollUIDeferredEnrollmentRequired = 4
    EnrollError = 16
    EnrollUnknown = 32
    EnrollSkipped = 64
    EnrollDenied = 256
  end

  enum EnrollmentSelectionStatus : Int32
    SelectedNo = 0
    SelectedYes = 1
  end

  enum EnrollmentDisplayStatus : Int32
    DisplayNo = 0
    DisplayYes = 1
  end

  enum X509ProviderType : Int32
    XCN_PROV_NONE = 0
    XCN_PROV_RSA_FULL = 1
    XCN_PROV_RSA_SIG = 2
    XCN_PROV_DSS = 3
    XCN_PROV_FORTEZZA = 4
    XCN_PROV_MS_EXCHANGE = 5
    XCN_PROV_SSL = 6
    XCN_PROV_RSA_SCHANNEL = 12
    XCN_PROV_DSS_DH = 13
    XCN_PROV_EC_ECDSA_SIG = 14
    XCN_PROV_EC_ECNRA_SIG = 15
    XCN_PROV_EC_ECDSA_FULL = 16
    XCN_PROV_EC_ECNRA_FULL = 17
    XCN_PROV_DH_SCHANNEL = 18
    XCN_PROV_SPYRUS_LYNKS = 20
    XCN_PROV_RNG = 21
    XCN_PROV_INTEL_SEC = 22
    XCN_PROV_REPLACE_OWF = 23
    XCN_PROV_RSA_AES = 24
  end

  enum AlgorithmType : Int32
    XCN_BCRYPT_UNKNOWN_INTERFACE = 0
    XCN_BCRYPT_CIPHER_INTERFACE = 1
    XCN_BCRYPT_HASH_INTERFACE = 2
    XCN_BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 3
    XCN_BCRYPT_SIGNATURE_INTERFACE = 5
    XCN_BCRYPT_SECRET_AGREEMENT_INTERFACE = 4
    XCN_BCRYPT_RNG_INTERFACE = 6
    XCN_BCRYPT_KEY_DERIVATION_INTERFACE = 7
  end

  enum AlgorithmOperationFlags : Int32
    XCN_NCRYPT_NO_OPERATION = 0
    XCN_NCRYPT_CIPHER_OPERATION = 1
    XCN_NCRYPT_HASH_OPERATION = 2
    XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION = 4
    XCN_NCRYPT_SECRET_AGREEMENT_OPERATION = 8
    XCN_NCRYPT_SIGNATURE_OPERATION = 16
    XCN_NCRYPT_RNG_OPERATION = 32
    XCN_NCRYPT_KEY_DERIVATION_OPERATION = 64
    XCN_NCRYPT_ANY_ASYMMETRIC_OPERATION = 28
    XCN_NCRYPT_PREFER_SIGNATURE_ONLY_OPERATION = 2097152
    XCN_NCRYPT_PREFER_NON_SIGNATURE_OPERATION = 4194304
    XCN_NCRYPT_EXACT_MATCH_OPERATION = 8388608
    XCN_NCRYPT_PREFERENCE_MASK_OPERATION = 14680064
  end

  enum X509KeySpec : Int32
    XCN_AT_NONE = 0
    XCN_AT_KEYEXCHANGE = 1
    XCN_AT_SIGNATURE = 2
  end

  enum KeyIdentifierHashAlgorithm : Int32
    SKIHashDefault = 0
    SKIHashSha1 = 1
    SKIHashCapiSha1 = 2
    SKIHashSha256 = 3
    SKIHashHPKP = 5
  end

  enum X509PrivateKeyExportFlags : Int32
    XCN_NCRYPT_ALLOW_EXPORT_NONE = 0
    XCN_NCRYPT_ALLOW_EXPORT_FLAG = 1
    XCN_NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG = 2
    XCN_NCRYPT_ALLOW_ARCHIVING_FLAG = 4
    XCN_NCRYPT_ALLOW_PLAINTEXT_ARCHIVING_FLAG = 8
  end

  enum X509PrivateKeyUsageFlags : Int32
    XCN_NCRYPT_ALLOW_USAGES_NONE = 0
    XCN_NCRYPT_ALLOW_DECRYPT_FLAG = 1
    XCN_NCRYPT_ALLOW_SIGNING_FLAG = 2
    XCN_NCRYPT_ALLOW_KEY_AGREEMENT_FLAG = 4
    XCN_NCRYPT_ALLOW_KEY_IMPORT_FLAG = 8
    XCN_NCRYPT_ALLOW_ALL_USAGES = 16777215
  end

  enum X509PrivateKeyProtection : Int32
    XCN_NCRYPT_UI_NO_PROTECTION_FLAG = 0
    XCN_NCRYPT_UI_PROTECT_KEY_FLAG = 1
    XCN_NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG = 2
    XCN_NCRYPT_UI_FINGERPRINT_PROTECTION_FLAG = 4
    XCN_NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG = 8
  end

  enum X509PrivateKeyVerify : Int32
    VerifyNone = 0
    VerifySilent = 1
    VerifySmartCardNone = 2
    VerifySmartCardSilent = 3
    VerifyAllowUI = 4
  end

  enum X509HardwareKeyUsageFlags : Int32
    XCN_NCRYPT_PCP_NONE = 0
    XCN_NCRYPT_TPM12_PROVIDER = 65536
    XCN_NCRYPT_PCP_SIGNATURE_KEY = 1
    XCN_NCRYPT_PCP_ENCRYPTION_KEY = 2
    XCN_NCRYPT_PCP_GENERIC_KEY = 3
    XCN_NCRYPT_PCP_STORAGE_KEY = 4
    XCN_NCRYPT_PCP_IDENTITY_KEY = 8
  end

  enum X509KeyParametersExportType : Int32
    XCN_CRYPT_OID_USE_CURVE_NONE = 0
    XCN_CRYPT_OID_USE_CURVE_NAME_FOR_ENCODE_FLAG = 536870912
    XCN_CRYPT_OID_USE_CURVE_PARAMETERS_FOR_ENCODE_FLAG = 268435456
  end

  enum X509KeyUsageFlags : Int32
    XCN_CERT_NO_KEY_USAGE = 0
    XCN_CERT_DIGITAL_SIGNATURE_KEY_USAGE = 128
    XCN_CERT_NON_REPUDIATION_KEY_USAGE = 64
    XCN_CERT_KEY_ENCIPHERMENT_KEY_USAGE = 32
    XCN_CERT_DATA_ENCIPHERMENT_KEY_USAGE = 16
    XCN_CERT_KEY_AGREEMENT_KEY_USAGE = 8
    XCN_CERT_KEY_CERT_SIGN_KEY_USAGE = 4
    XCN_CERT_OFFLINE_CRL_SIGN_KEY_USAGE = 2
    XCN_CERT_CRL_SIGN_KEY_USAGE = 2
    XCN_CERT_ENCIPHER_ONLY_KEY_USAGE = 1
    XCN_CERT_DECIPHER_ONLY_KEY_USAGE = 32768
  end

  enum AlternativeNameType : Int32
    XCN_CERT_ALT_NAME_UNKNOWN = 0
    XCN_CERT_ALT_NAME_OTHER_NAME = 1
    XCN_CERT_ALT_NAME_RFC822_NAME = 2
    XCN_CERT_ALT_NAME_DNS_NAME = 3
    XCN_CERT_ALT_NAME_X400_ADDRESS = 4
    XCN_CERT_ALT_NAME_DIRECTORY_NAME = 5
    XCN_CERT_ALT_NAME_EDI_PARTY_NAME = 6
    XCN_CERT_ALT_NAME_URL = 7
    XCN_CERT_ALT_NAME_IP_ADDRESS = 8
    XCN_CERT_ALT_NAME_REGISTERED_ID = 9
    XCN_CERT_ALT_NAME_GUID = 10
    XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME = 11
  end

  enum PolicyQualifierType : Int32
    PolicyQualifierTypeUnknown = 0
    PolicyQualifierTypeUrl = 1
    PolicyQualifierTypeUserNotice = 2
    PolicyQualifierTypeFlags = 3
  end

  enum RequestClientInfoClientId : Int32
    ClientIdNone = 0
    ClientIdXEnroll2003 = 1
    ClientIdAutoEnroll2003 = 2
    ClientIdWizard2003 = 3
    ClientIdCertReq2003 = 4
    ClientIdDefaultRequest = 5
    ClientIdAutoEnroll = 6
    ClientIdRequestWizard = 7
    ClientIdEOBO = 8
    ClientIdCertReq = 9
    ClientIdTest = 10
    ClientIdWinRT = 11
    ClientIdUserStart = 1000
  end

  enum CERTENROLL_PROPERTYID : Int32
    XCN_PROPERTYID_NONE = 0
    XCN_CERT_KEY_PROV_HANDLE_PROP_ID = 1
    XCN_CERT_KEY_PROV_INFO_PROP_ID = 2
    XCN_CERT_SHA1_HASH_PROP_ID = 3
    XCN_CERT_MD5_HASH_PROP_ID = 4
    XCN_CERT_HASH_PROP_ID = 3
    XCN_CERT_KEY_CONTEXT_PROP_ID = 5
    XCN_CERT_KEY_SPEC_PROP_ID = 6
    XCN_CERT_IE30_RESERVED_PROP_ID = 7
    XCN_CERT_PUBKEY_HASH_RESERVED_PROP_ID = 8
    XCN_CERT_ENHKEY_USAGE_PROP_ID = 9
    XCN_CERT_CTL_USAGE_PROP_ID = 9
    XCN_CERT_NEXT_UPDATE_LOCATION_PROP_ID = 10
    XCN_CERT_FRIENDLY_NAME_PROP_ID = 11
    XCN_CERT_PVK_FILE_PROP_ID = 12
    XCN_CERT_DESCRIPTION_PROP_ID = 13
    XCN_CERT_ACCESS_STATE_PROP_ID = 14
    XCN_CERT_SIGNATURE_HASH_PROP_ID = 15
    XCN_CERT_SMART_CARD_DATA_PROP_ID = 16
    XCN_CERT_EFS_PROP_ID = 17
    XCN_CERT_FORTEZZA_DATA_PROP_ID = 18
    XCN_CERT_ARCHIVED_PROP_ID = 19
    XCN_CERT_KEY_IDENTIFIER_PROP_ID = 20
    XCN_CERT_AUTO_ENROLL_PROP_ID = 21
    XCN_CERT_PUBKEY_ALG_PARA_PROP_ID = 22
    XCN_CERT_CROSS_CERT_DIST_POINTS_PROP_ID = 23
    XCN_CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID = 24
    XCN_CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID = 25
    XCN_CERT_ENROLLMENT_PROP_ID = 26
    XCN_CERT_DATE_STAMP_PROP_ID = 27
    XCN_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = 28
    XCN_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = 29
    XCN_CERT_EXTENDED_ERROR_INFO_PROP_ID = 30
    XCN_CERT_RENEWAL_PROP_ID = 64
    XCN_CERT_ARCHIVED_KEY_HASH_PROP_ID = 65
    XCN_CERT_AUTO_ENROLL_RETRY_PROP_ID = 66
    XCN_CERT_AIA_URL_RETRIEVED_PROP_ID = 67
    XCN_CERT_AUTHORITY_INFO_ACCESS_PROP_ID = 68
    XCN_CERT_BACKED_UP_PROP_ID = 69
    XCN_CERT_OCSP_RESPONSE_PROP_ID = 70
    XCN_CERT_REQUEST_ORIGINATOR_PROP_ID = 71
    XCN_CERT_SOURCE_LOCATION_PROP_ID = 72
    XCN_CERT_SOURCE_URL_PROP_ID = 73
    XCN_CERT_NEW_KEY_PROP_ID = 74
    XCN_CERT_OCSP_CACHE_PREFIX_PROP_ID = 75
    XCN_CERT_SMART_CARD_ROOT_INFO_PROP_ID = 76
    XCN_CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID = 77
    XCN_CERT_NCRYPT_KEY_HANDLE_PROP_ID = 78
    XCN_CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID = 79
    XCN_CERT_SUBJECT_INFO_ACCESS_PROP_ID = 80
    XCN_CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 81
    XCN_CERT_CA_DISABLE_CRL_PROP_ID = 82
    XCN_CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID = 83
    XCN_CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID = 84
    XCN_CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 85
    XCN_CERT_SUBJECT_DISABLE_CRL_PROP_ID = 86
    XCN_CERT_CEP_PROP_ID = 87
    XCN_CERT_SIGN_HASH_CNG_ALG_PROP_ID = 89
    XCN_CERT_SCARD_PIN_ID_PROP_ID = 90
    XCN_CERT_SCARD_PIN_INFO_PROP_ID = 91
    XCN_CERT_SUBJECT_PUB_KEY_BIT_LENGTH_PROP_ID = 92
    XCN_CERT_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID = 93
    XCN_CERT_ISSUER_PUB_KEY_BIT_LENGTH_PROP_ID = 94
    XCN_CERT_ISSUER_CHAIN_SIGN_HASH_CNG_ALG_PROP_ID = 95
    XCN_CERT_ISSUER_CHAIN_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID = 96
    XCN_CERT_NO_EXPIRE_NOTIFICATION_PROP_ID = 97
    XCN_CERT_AUTH_ROOT_SHA256_HASH_PROP_ID = 98
    XCN_CERT_NCRYPT_KEY_HANDLE_TRANSFER_PROP_ID = 99
    XCN_CERT_HCRYPTPROV_TRANSFER_PROP_ID = 100
    XCN_CERT_SMART_CARD_READER_PROP_ID = 101
    XCN_CERT_SEND_AS_TRUSTED_ISSUER_PROP_ID = 102
    XCN_CERT_KEY_REPAIR_ATTEMPTED_PROP_ID = 103
    XCN_CERT_DISALLOWED_FILETIME_PROP_ID = 104
    XCN_CERT_ROOT_PROGRAM_CHAIN_POLICIES_PROP_ID = 105
    XCN_CERT_SMART_CARD_READER_NON_REMOVABLE_PROP_ID = 106
    XCN_CERT_SHA256_HASH_PROP_ID = 107
    XCN_CERT_SCEP_SERVER_CERTS_PROP_ID = 108
    XCN_CERT_SCEP_RA_SIGNATURE_CERT_PROP_ID = 109
    XCN_CERT_SCEP_RA_ENCRYPTION_CERT_PROP_ID = 110
    XCN_CERT_SCEP_CA_CERT_PROP_ID = 111
    XCN_CERT_SCEP_SIGNER_CERT_PROP_ID = 112
    XCN_CERT_SCEP_NONCE_PROP_ID = 113
    XCN_CERT_SCEP_ENCRYPT_HASH_CNG_ALG_PROP_ID = 114
    XCN_CERT_SCEP_FLAGS_PROP_ID = 115
    XCN_CERT_SCEP_GUID_PROP_ID = 116
    XCN_CERT_SERIALIZABLE_KEY_CONTEXT_PROP_ID = 117
    XCN_CERT_ISOLATED_KEY_PROP_ID = 118
    XCN_CERT_SERIAL_CHAIN_PROP_ID = 119
    XCN_CERT_KEY_CLASSIFICATION_PROP_ID = 120
    XCN_CERT_DISALLOWED_ENHKEY_USAGE_PROP_ID = 122
    XCN_CERT_NONCOMPLIANT_ROOT_URL_PROP_ID = 123
    XCN_CERT_PIN_SHA256_HASH_PROP_ID = 124
    XCN_CERT_CLR_DELETE_KEY_PROP_ID = 125
    XCN_CERT_NOT_BEFORE_FILETIME_PROP_ID = 126
    XCN_CERT_CERT_NOT_BEFORE_ENHKEY_USAGE_PROP_ID = 127
    XCN_CERT_FIRST_RESERVED_PROP_ID = 128
    XCN_CERT_LAST_RESERVED_PROP_ID = 32767
    XCN_CERT_FIRST_USER_PROP_ID = 32768
    XCN_CERT_LAST_USER_PROP_ID = 65535
    XCN_CERT_STORE_LOCALIZED_NAME_PROP_ID = 4096
  end

  enum EnrollmentPolicyServerPropertyFlags : Int32
    DefaultNone = 0
    DefaultPolicyServer = 1
  end

  enum PolicyServerUrlFlags : Int32
    PsfNone = 0
    PsfLocationGroupPolicy = 1
    PsfLocationRegistry = 2
    PsfUseClientId = 4
    PsfAutoEnrollmentEnabled = 16
    PsfAllowUnTrustedCA = 32
  end

  enum EnrollmentTemplateProperty : Int32
    TemplatePropCommonName = 1
    TemplatePropFriendlyName = 2
    TemplatePropEKUs = 3
    TemplatePropCryptoProviders = 4
    TemplatePropMajorRevision = 5
    TemplatePropDescription = 6
    TemplatePropKeySpec = 7
    TemplatePropSchemaVersion = 8
    TemplatePropMinorRevision = 9
    TemplatePropRASignatureCount = 10
    TemplatePropMinimumKeySize = 11
    TemplatePropOID = 12
    TemplatePropSupersede = 13
    TemplatePropRACertificatePolicies = 14
    TemplatePropRAEKUs = 15
    TemplatePropCertificatePolicies = 16
    TemplatePropV1ApplicationPolicy = 17
    TemplatePropAsymmetricAlgorithm = 18
    TemplatePropKeySecurityDescriptor = 19
    TemplatePropSymmetricAlgorithm = 20
    TemplatePropSymmetricKeyLength = 21
    TemplatePropHashAlgorithm = 22
    TemplatePropKeyUsage = 23
    TemplatePropEnrollmentFlags = 24
    TemplatePropSubjectNameFlags = 25
    TemplatePropPrivateKeyFlags = 26
    TemplatePropGeneralFlags = 27
    TemplatePropSecurityDescriptor = 28
    TemplatePropExtensions = 29
    TemplatePropValidityPeriod = 30
    TemplatePropRenewalPeriod = 31
  end

  enum CommitTemplateFlags : Int32
    CommitFlagSaveTemplateGenerateOID = 1
    CommitFlagSaveTemplateUseCurrentOID = 2
    CommitFlagSaveTemplateOverwrite = 3
    CommitFlagDeleteTemplate = 4
  end

  enum EnrollmentCAProperty : Int32
    CAPropCommonName = 1
    CAPropDistinguishedName = 2
    CAPropSanitizedName = 3
    CAPropSanitizedShortName = 4
    CAPropDNSName = 5
    CAPropCertificateTypes = 6
    CAPropCertificate = 7
    CAPropDescription = 8
    CAPropWebServers = 9
    CAPropSiteName = 10
    CAPropSecurity = 11
    CAPropRenewalOnly = 12
  end

  enum X509EnrollmentPolicyLoadOption : Int32
    LoadOptionDefault = 0
    LoadOptionCacheOnly = 1
    LoadOptionReload = 2
    LoadOptionRegisterForADChanges = 4
  end

  enum EnrollmentPolicyFlags : Int32
    DisableGroupPolicyList = 2
    DisableUserServerList = 4
  end

  enum PolicyServerUrlPropertyID : Int32
    PsPolicyID = 0
    PsFriendlyName = 1
  end

  enum X509EnrollmentPolicyExportFlags : Int32
    ExportTemplates = 1
    ExportOIDs = 2
    ExportCAs = 4
  end

  enum X509RequestType : Int32
    TypeAny = 0
    TypePkcs10 = 1
    TypePkcs7 = 2
    TypeCmc = 3
    TypeCertificate = 4
  end

  enum X509RequestInheritOptions : Int32
    InheritDefault = 0
    InheritNewDefaultKey = 1
    InheritNewSimilarKey = 2
    InheritPrivateKey = 3
    InheritPublicKey = 4
    InheritKeyMask = 15
    InheritNone = 16
    InheritRenewalCertificateFlag = 32
    InheritTemplateFlag = 64
    InheritSubjectFlag = 128
    InheritExtensionsFlag = 256
    InheritSubjectAltNameFlag = 512
    InheritValidityPeriodFlag = 1024
    InheritReserved80000000 = -2147483648
  end

  enum InnerRequestLevel : Int32
    LevelInnermost = 0
    LevelNext = 1
  end

  enum Pkcs10AllowedSignatureTypes : Int32
    AllowedKeySignature = 1
    AllowedNullSignature = 2
  end

  enum KeyAttestationClaimType : Int32
    XCN_NCRYPT_CLAIM_NONE = 0
    XCN_NCRYPT_CLAIM_AUTHORITY_AND_SUBJECT = 3
    XCN_NCRYPT_CLAIM_AUTHORITY_ONLY = 1
    XCN_NCRYPT_CLAIM_SUBJECT_ONLY = 2
    XCN_NCRYPT_CLAIM_UNKNOWN = 4096
  end

  enum InstallResponseRestrictionFlags : Int32
    AllowNone = 0
    AllowNoOutstandingRequest = 1
    AllowUntrustedCertificate = 2
    AllowUntrustedRoot = 4
  end

  enum WebEnrollmentFlags : Int32
    EnrollPrompt = 1
  end

  enum CRLRevocationReason : Int32
    XCN_CRL_REASON_UNSPECIFIED = 0
    XCN_CRL_REASON_KEY_COMPROMISE = 1
    XCN_CRL_REASON_CA_COMPROMISE = 2
    XCN_CRL_REASON_AFFILIATION_CHANGED = 3
    XCN_CRL_REASON_SUPERSEDED = 4
    XCN_CRL_REASON_CESSATION_OF_OPERATION = 5
    XCN_CRL_REASON_CERTIFICATE_HOLD = 6
    XCN_CRL_REASON_REMOVE_FROM_CRL = 8
    XCN_CRL_REASON_PRIVILEGE_WITHDRAWN = 9
    XCN_CRL_REASON_AA_COMPROMISE = 10
  end

  enum X509SCEPProcessMessageFlags : Int32
    SCEPProcessDefault = 0
    SCEPProcessSkipCertInstall = 1
  end

  enum DelayRetryAction : Int32
    DelayRetryUnknown = 0
    DelayRetryNone = 1
    DelayRetryShort = 2
    DelayRetryLong = 3
    DelayRetrySuccess = 4
    DelayRetryPastSuccess = 5
  end

  enum X509CertificateTemplateGeneralFlag : Int32
    GeneralMachineType = 64
    GeneralCA = 128
    GeneralCrossCA = 2048
    GeneralDefault = 65536
    GeneralModified = 131072
    GeneralDonotPersist = 4096
  end

  enum X509CertificateTemplateEnrollmentFlag : Int32
    EnrollmentIncludeSymmetricAlgorithms = 1
    EnrollmentPendAllRequests = 2
    EnrollmentPublishToKRAContainer = 4
    EnrollmentPublishToDS = 8
    EnrollmentAutoEnrollmentCheckUserDSCertificate = 16
    EnrollmentAutoEnrollment = 32
    EnrollmentDomainAuthenticationNotRequired = 128
    EnrollmentPreviousApprovalValidateReenrollment = 64
    EnrollmentUserInteractionRequired = 256
    EnrollmentAddTemplateName = 512
    EnrollmentRemoveInvalidCertificateFromPersonalStore = 1024
    EnrollmentAllowEnrollOnBehalfOf = 2048
    EnrollmentAddOCSPNoCheck = 4096
    EnrollmentReuseKeyOnFullSmartCard = 8192
    EnrollmentNoRevocationInfoInCerts = 16384
    EnrollmentIncludeBasicConstraintsForEECerts = 32768
    EnrollmentPreviousApprovalKeyBasedValidateReenrollment = 65536
    EnrollmentCertificateIssuancePoliciesFromRequest = 131072
    EnrollmentSkipAutoRenewal = 262144
  end

  enum X509CertificateTemplateSubjectNameFlag : Int32
    SubjectNameEnrolleeSupplies = 1
    SubjectNameRequireDirectoryPath = -2147483648
    SubjectNameRequireCommonName = 1073741824
    SubjectNameRequireEmail = 536870912
    SubjectNameRequireDNS = 268435456
    SubjectNameAndAlternativeNameOldCertSupplies = 8
    SubjectAlternativeNameEnrolleeSupplies = 65536
    SubjectAlternativeNameRequireDirectoryGUID = 16777216
    SubjectAlternativeNameRequireUPN = 33554432
    SubjectAlternativeNameRequireEmail = 67108864
    SubjectAlternativeNameRequireSPN = 8388608
    SubjectAlternativeNameRequireDNS = 134217728
    SubjectAlternativeNameRequireDomainDNS = 4194304
  end

  enum X509CertificateTemplatePrivateKeyFlag : Int32
    PrivateKeyRequireArchival = 1
    PrivateKeyExportable = 16
    PrivateKeyRequireStrongKeyProtection = 32
    PrivateKeyRequireAlternateSignatureAlgorithm = 64
    PrivateKeyRequireSameKeyRenewal = 128
    PrivateKeyUseLegacyProvider = 256
    PrivateKeyEKTrustOnUse = 512
    PrivateKeyEKValidateCert = 1024
    PrivateKeyEKValidateKey = 2048
    PrivateKeyAttestNone = 0
    PrivateKeyAttestPreferred = 4096
    PrivateKeyAttestRequired = 8192
    PrivateKeyAttestMask = 12288
    PrivateKeyAttestWithoutPolicy = 16384
    PrivateKeyServerVersionMask = 983040
    PrivateKeyServerVersionShift = 16
    PrivateKeyHelloKspKey = 1048576
    PrivateKeyHelloLogonKey = 2097152
    PrivateKeyClientVersionMask = 251658240
    PrivateKeyClientVersionShift = 24
  end

  enum ImportPFXFlags : Int32
    ImportNone = 0
    ImportMachineContext = 1
    ImportForceOverwrite = 2
    ImportSilent = 4
    ImportSaveProperties = 8
    ImportExportable = 16
    ImportExportableEncrypted = 32
    ImportNoUserProtected = 64
    ImportUserProtected = 128
    ImportUserProtectedHigh = 256
    ImportInstallCertificate = 512
    ImportInstallChain = 1024
    ImportInstallChainAndRoot = 2048
  end

  enum ENUM_CATYPES : Int32
    ENUM_ENTERPRISE_ROOTCA = 0
    ENUM_ENTERPRISE_SUBCA = 1
    ENUM_STANDALONE_ROOTCA = 3
    ENUM_STANDALONE_SUBCA = 4
    ENUM_UNKNOWN_CA = 5
  end

  struct CSEDB_RSTMAPW
    pwsz_database_name : LibC::LPWSTR
    pwsz_new_database_name : LibC::LPWSTR
  end
  struct CERTTRANSBLOB
    cb : UInt32
    pb : UInt8*
  end
  struct CERTVIEWRESTRICTION
    column_index : UInt32
    seek_operator : Int32
    sort_order : Int32
    pb_value : UInt8*
    cb_value : UInt32
  end
  struct CAINFO
    cb_size : UInt32
    ca_type : ENUM_CATYPES
    c_ca_signature_certs : UInt32
    c_ca_exchange_certs : UInt32
    c_exit_modules : UInt32
    l_prop_id_max : Int32
    l_role_separation_enabled : Int32
    c_kra_cert_used_count : UInt32
    c_kra_cert_count : UInt32
    f_advanced_server : UInt32
  end


  struct IEnumCERTVIEWCOLUMNVTbl
    query_interface : Proc(IEnumCERTVIEWCOLUMN*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumCERTVIEWCOLUMN*, UInt32)
    release : Proc(IEnumCERTVIEWCOLUMN*, UInt32)
    get_type_info_count : Proc(IEnumCERTVIEWCOLUMN*, UInt32*, HRESULT)
    get_type_info : Proc(IEnumCERTVIEWCOLUMN*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEnumCERTVIEWCOLUMN*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEnumCERTVIEWCOLUMN*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    next : Proc(IEnumCERTVIEWCOLUMN*, Int32*, HRESULT)
    get_name : Proc(IEnumCERTVIEWCOLUMN*, UInt8**, HRESULT)
    get_display_name : Proc(IEnumCERTVIEWCOLUMN*, UInt8**, HRESULT)
    get_type : Proc(IEnumCERTVIEWCOLUMN*, Int32*, HRESULT)
    is_indexed : Proc(IEnumCERTVIEWCOLUMN*, Int32*, HRESULT)
    get_max_length : Proc(IEnumCERTVIEWCOLUMN*, Int32*, HRESULT)
    get_value : Proc(IEnumCERTVIEWCOLUMN*, ENUM_CERT_COLUMN_VALUE_FLAGS, VARIANT*, HRESULT)
    skip : Proc(IEnumCERTVIEWCOLUMN*, Int32, HRESULT)
    reset : Proc(IEnumCERTVIEWCOLUMN*, HRESULT)
    clone : Proc(IEnumCERTVIEWCOLUMN*, IEnumCERTVIEWCOLUMN*, HRESULT)
  end

  IEnumCERTVIEWCOLUMN_GUID = LibC::GUID.new("9c735be2-57a5-11d1-9bdb-00c04fb683fa")
  CLSID_IEnumCERTVIEWCOLUMN = "9c735be2-57a5-11d1-9bdb-00c04fb683fa"
  struct IEnumCERTVIEWCOLUMN
    lpVtbl : IEnumCERTVIEWCOLUMNVTbl*
  end

  struct IEnumCERTVIEWATTRIBUTEVTbl
    query_interface : Proc(IEnumCERTVIEWATTRIBUTE*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumCERTVIEWATTRIBUTE*, UInt32)
    release : Proc(IEnumCERTVIEWATTRIBUTE*, UInt32)
    get_type_info_count : Proc(IEnumCERTVIEWATTRIBUTE*, UInt32*, HRESULT)
    get_type_info : Proc(IEnumCERTVIEWATTRIBUTE*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEnumCERTVIEWATTRIBUTE*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEnumCERTVIEWATTRIBUTE*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    next : Proc(IEnumCERTVIEWATTRIBUTE*, Int32*, HRESULT)
    get_name : Proc(IEnumCERTVIEWATTRIBUTE*, UInt8**, HRESULT)
    get_value : Proc(IEnumCERTVIEWATTRIBUTE*, UInt8**, HRESULT)
    skip : Proc(IEnumCERTVIEWATTRIBUTE*, Int32, HRESULT)
    reset : Proc(IEnumCERTVIEWATTRIBUTE*, HRESULT)
    clone : Proc(IEnumCERTVIEWATTRIBUTE*, IEnumCERTVIEWATTRIBUTE*, HRESULT)
  end

  IEnumCERTVIEWATTRIBUTE_GUID = LibC::GUID.new("e77db656-7653-11d1-9bde-00c04fb683fa")
  CLSID_IEnumCERTVIEWATTRIBUTE = "e77db656-7653-11d1-9bde-00c04fb683fa"
  struct IEnumCERTVIEWATTRIBUTE
    lpVtbl : IEnumCERTVIEWATTRIBUTEVTbl*
  end

  struct IEnumCERTVIEWEXTENSIONVTbl
    query_interface : Proc(IEnumCERTVIEWEXTENSION*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumCERTVIEWEXTENSION*, UInt32)
    release : Proc(IEnumCERTVIEWEXTENSION*, UInt32)
    get_type_info_count : Proc(IEnumCERTVIEWEXTENSION*, UInt32*, HRESULT)
    get_type_info : Proc(IEnumCERTVIEWEXTENSION*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEnumCERTVIEWEXTENSION*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEnumCERTVIEWEXTENSION*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    next : Proc(IEnumCERTVIEWEXTENSION*, Int32*, HRESULT)
    get_name : Proc(IEnumCERTVIEWEXTENSION*, UInt8**, HRESULT)
    get_flags : Proc(IEnumCERTVIEWEXTENSION*, Int32*, HRESULT)
    get_value : Proc(IEnumCERTVIEWEXTENSION*, CERT_PROPERTY_TYPE, ENUM_CERT_COLUMN_VALUE_FLAGS, VARIANT*, HRESULT)
    skip : Proc(IEnumCERTVIEWEXTENSION*, Int32, HRESULT)
    reset : Proc(IEnumCERTVIEWEXTENSION*, HRESULT)
    clone : Proc(IEnumCERTVIEWEXTENSION*, IEnumCERTVIEWEXTENSION*, HRESULT)
  end

  IEnumCERTVIEWEXTENSION_GUID = LibC::GUID.new("e7dd1466-7653-11d1-9bde-00c04fb683fa")
  CLSID_IEnumCERTVIEWEXTENSION = "e7dd1466-7653-11d1-9bde-00c04fb683fa"
  struct IEnumCERTVIEWEXTENSION
    lpVtbl : IEnumCERTVIEWEXTENSIONVTbl*
  end

  struct IEnumCERTVIEWROWVTbl
    query_interface : Proc(IEnumCERTVIEWROW*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnumCERTVIEWROW*, UInt32)
    release : Proc(IEnumCERTVIEWROW*, UInt32)
    get_type_info_count : Proc(IEnumCERTVIEWROW*, UInt32*, HRESULT)
    get_type_info : Proc(IEnumCERTVIEWROW*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IEnumCERTVIEWROW*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IEnumCERTVIEWROW*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    next : Proc(IEnumCERTVIEWROW*, Int32*, HRESULT)
    enum_cert_view_column : Proc(IEnumCERTVIEWROW*, IEnumCERTVIEWCOLUMN*, HRESULT)
    enum_cert_view_attribute : Proc(IEnumCERTVIEWROW*, Int32, IEnumCERTVIEWATTRIBUTE*, HRESULT)
    enum_cert_view_extension : Proc(IEnumCERTVIEWROW*, Int32, IEnumCERTVIEWEXTENSION*, HRESULT)
    skip : Proc(IEnumCERTVIEWROW*, Int32, HRESULT)
    reset : Proc(IEnumCERTVIEWROW*, HRESULT)
    clone : Proc(IEnumCERTVIEWROW*, IEnumCERTVIEWROW*, HRESULT)
    get_max_index : Proc(IEnumCERTVIEWROW*, Int32*, HRESULT)
  end

  IEnumCERTVIEWROW_GUID = LibC::GUID.new("d1157f4c-5af2-11d1-9bdc-00c04fb683fa")
  CLSID_IEnumCERTVIEWROW = "d1157f4c-5af2-11d1-9bdc-00c04fb683fa"
  struct IEnumCERTVIEWROW
    lpVtbl : IEnumCERTVIEWROWVTbl*
  end

  struct ICertViewVTbl
    query_interface : Proc(ICertView*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertView*, UInt32)
    release : Proc(ICertView*, UInt32)
    get_type_info_count : Proc(ICertView*, UInt32*, HRESULT)
    get_type_info : Proc(ICertView*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertView*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertView*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    open_connection : Proc(ICertView*, UInt8*, HRESULT)
    enum_cert_view_column : Proc(ICertView*, CVRC_COLUMN, IEnumCERTVIEWCOLUMN*, HRESULT)
    get_column_count : Proc(ICertView*, CVRC_COLUMN, Int32*, HRESULT)
    get_column_index : Proc(ICertView*, CVRC_COLUMN, UInt8*, Int32*, HRESULT)
    set_result_column_count : Proc(ICertView*, Int32, HRESULT)
    set_result_column : Proc(ICertView*, Int32, HRESULT)
    set_restriction : Proc(ICertView*, CERT_VIEW_COLUMN_INDEX, CERT_VIEW_SEEK_OPERATOR_FLAGS, Int32, VARIANT*, HRESULT)
    open_view : Proc(ICertView*, IEnumCERTVIEWROW*, HRESULT)
  end

  ICertView_GUID = LibC::GUID.new("c3fac344-1e84-11d1-9bd6-00c04fb683fa")
  CLSID_ICertView = "c3fac344-1e84-11d1-9bd6-00c04fb683fa"
  struct ICertView
    lpVtbl : ICertViewVTbl*
  end

  struct ICertView2VTbl
    query_interface : Proc(ICertView2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertView2*, UInt32)
    release : Proc(ICertView2*, UInt32)
    get_type_info_count : Proc(ICertView2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertView2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertView2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertView2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    open_connection : Proc(ICertView2*, UInt8*, HRESULT)
    enum_cert_view_column : Proc(ICertView2*, CVRC_COLUMN, IEnumCERTVIEWCOLUMN*, HRESULT)
    get_column_count : Proc(ICertView2*, CVRC_COLUMN, Int32*, HRESULT)
    get_column_index : Proc(ICertView2*, CVRC_COLUMN, UInt8*, Int32*, HRESULT)
    set_result_column_count : Proc(ICertView2*, Int32, HRESULT)
    set_result_column : Proc(ICertView2*, Int32, HRESULT)
    set_restriction : Proc(ICertView2*, CERT_VIEW_COLUMN_INDEX, CERT_VIEW_SEEK_OPERATOR_FLAGS, Int32, VARIANT*, HRESULT)
    open_view : Proc(ICertView2*, IEnumCERTVIEWROW*, HRESULT)
    set_table : Proc(ICertView2*, CVRC_TABLE, HRESULT)
  end

  ICertView2_GUID = LibC::GUID.new("d594b282-8851-4b61-9c66-3edadf848863")
  CLSID_ICertView2 = "d594b282-8851-4b61-9c66-3edadf848863"
  struct ICertView2
    lpVtbl : ICertView2VTbl*
  end

  struct ICertAdminVTbl
    query_interface : Proc(ICertAdmin*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertAdmin*, UInt32)
    release : Proc(ICertAdmin*, UInt32)
    get_type_info_count : Proc(ICertAdmin*, UInt32*, HRESULT)
    get_type_info : Proc(ICertAdmin*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertAdmin*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertAdmin*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    is_valid_certificate : Proc(ICertAdmin*, UInt8*, UInt8*, Int32*, HRESULT)
    get_revocation_reason : Proc(ICertAdmin*, Int32*, HRESULT)
    revoke_certificate : Proc(ICertAdmin*, UInt8*, UInt8*, Int32, Float64, HRESULT)
    set_request_attributes : Proc(ICertAdmin*, UInt8*, Int32, UInt8*, HRESULT)
    set_certificate_extension : Proc(ICertAdmin*, UInt8*, Int32, UInt8*, CERT_PROPERTY_TYPE, Int32, VARIANT*, HRESULT)
    deny_request : Proc(ICertAdmin*, UInt8*, Int32, HRESULT)
    resubmit_request : Proc(ICertAdmin*, UInt8*, Int32, Int32*, HRESULT)
    publish_crl : Proc(ICertAdmin*, UInt8*, Float64, HRESULT)
    get_crl : Proc(ICertAdmin*, UInt8*, Int32, UInt8**, HRESULT)
    import_certificate : Proc(ICertAdmin*, UInt8*, UInt8*, CERT_IMPORT_FLAGS, Int32*, HRESULT)
  end

  ICertAdmin_GUID = LibC::GUID.new("34df6950-7fb6-11d0-8817-00a0c903b83c")
  CLSID_ICertAdmin = "34df6950-7fb6-11d0-8817-00a0c903b83c"
  struct ICertAdmin
    lpVtbl : ICertAdminVTbl*
  end

  struct ICertAdmin2VTbl
    query_interface : Proc(ICertAdmin2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertAdmin2*, UInt32)
    release : Proc(ICertAdmin2*, UInt32)
    get_type_info_count : Proc(ICertAdmin2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertAdmin2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertAdmin2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertAdmin2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    is_valid_certificate : Proc(ICertAdmin2*, UInt8*, UInt8*, Int32*, HRESULT)
    get_revocation_reason : Proc(ICertAdmin2*, Int32*, HRESULT)
    revoke_certificate : Proc(ICertAdmin2*, UInt8*, UInt8*, Int32, Float64, HRESULT)
    set_request_attributes : Proc(ICertAdmin2*, UInt8*, Int32, UInt8*, HRESULT)
    set_certificate_extension : Proc(ICertAdmin2*, UInt8*, Int32, UInt8*, CERT_PROPERTY_TYPE, Int32, VARIANT*, HRESULT)
    deny_request : Proc(ICertAdmin2*, UInt8*, Int32, HRESULT)
    resubmit_request : Proc(ICertAdmin2*, UInt8*, Int32, Int32*, HRESULT)
    publish_crl : Proc(ICertAdmin2*, UInt8*, Float64, HRESULT)
    get_crl : Proc(ICertAdmin2*, UInt8*, Int32, UInt8**, HRESULT)
    import_certificate : Proc(ICertAdmin2*, UInt8*, UInt8*, CERT_IMPORT_FLAGS, Int32*, HRESULT)
    publish_cr_ls : Proc(ICertAdmin2*, UInt8*, Float64, Int32, HRESULT)
    get_ca_property : Proc(ICertAdmin2*, UInt8*, Int32, Int32, Int32, Int32, VARIANT*, HRESULT)
    set_ca_property : Proc(ICertAdmin2*, UInt8*, Int32, Int32, CERT_PROPERTY_TYPE, VARIANT*, HRESULT)
    get_ca_property_flags : Proc(ICertAdmin2*, UInt8*, Int32, Int32*, HRESULT)
    get_ca_property_display_name : Proc(ICertAdmin2*, UInt8*, Int32, UInt8**, HRESULT)
    get_archived_key : Proc(ICertAdmin2*, UInt8*, Int32, Int32, UInt8**, HRESULT)
    get_config_entry : Proc(ICertAdmin2*, UInt8*, UInt8*, UInt8*, VARIANT*, HRESULT)
    set_config_entry : Proc(ICertAdmin2*, UInt8*, UInt8*, UInt8*, VARIANT*, HRESULT)
    import_key : Proc(ICertAdmin2*, UInt8*, Int32, UInt8*, CERT_IMPORT_FLAGS, UInt8*, HRESULT)
    get_my_roles : Proc(ICertAdmin2*, UInt8*, CERTADMIN_GET_ROLES_FLAGS*, HRESULT)
    delete_row : Proc(ICertAdmin2*, UInt8*, CERT_DELETE_ROW_FLAGS, Float64, CVRC_TABLE, Int32, Int32*, HRESULT)
  end

  ICertAdmin2_GUID = LibC::GUID.new("f7c3ac41-b8ce-4fb4-aa58-3d1dc0e36b39")
  CLSID_ICertAdmin2 = "f7c3ac41-b8ce-4fb4-aa58-3d1dc0e36b39"
  struct ICertAdmin2
    lpVtbl : ICertAdmin2VTbl*
  end

  struct IOCSPPropertyVTbl
    query_interface : Proc(IOCSPProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOCSPProperty*, UInt32)
    release : Proc(IOCSPProperty*, UInt32)
    get_type_info_count : Proc(IOCSPProperty*, UInt32*, HRESULT)
    get_type_info : Proc(IOCSPProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IOCSPProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IOCSPProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IOCSPProperty*, UInt8**, HRESULT)
    get_value : Proc(IOCSPProperty*, VARIANT*, HRESULT)
    put_value : Proc(IOCSPProperty*, VARIANT, HRESULT)
    get_modified : Proc(IOCSPProperty*, Int16*, HRESULT)
  end

  IOCSPProperty_GUID = LibC::GUID.new("66fb7839-5f04-4c25-ad18-9ff1a8376ee0")
  CLSID_IOCSPProperty = "66fb7839-5f04-4c25-ad18-9ff1a8376ee0"
  struct IOCSPProperty
    lpVtbl : IOCSPPropertyVTbl*
  end

  struct IOCSPPropertyCollectionVTbl
    query_interface : Proc(IOCSPPropertyCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOCSPPropertyCollection*, UInt32)
    release : Proc(IOCSPPropertyCollection*, UInt32)
    get_type_info_count : Proc(IOCSPPropertyCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IOCSPPropertyCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IOCSPPropertyCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IOCSPPropertyCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IOCSPPropertyCollection*, IUnknown*, HRESULT)
    get_item : Proc(IOCSPPropertyCollection*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IOCSPPropertyCollection*, Int32*, HRESULT)
    get_item_by_name : Proc(IOCSPPropertyCollection*, UInt8*, VARIANT*, HRESULT)
    create_property : Proc(IOCSPPropertyCollection*, UInt8*, VARIANT*, IOCSPProperty*, HRESULT)
    delete_property : Proc(IOCSPPropertyCollection*, UInt8*, HRESULT)
    initialize_from_properties : Proc(IOCSPPropertyCollection*, VARIANT*, HRESULT)
    get_all_properties : Proc(IOCSPPropertyCollection*, VARIANT*, HRESULT)
  end

  IOCSPPropertyCollection_GUID = LibC::GUID.new("2597c18d-54e6-4b74-9fa9-a6bfda99cbbe")
  CLSID_IOCSPPropertyCollection = "2597c18d-54e6-4b74-9fa9-a6bfda99cbbe"
  struct IOCSPPropertyCollection
    lpVtbl : IOCSPPropertyCollectionVTbl*
  end

  struct IOCSPCAConfigurationVTbl
    query_interface : Proc(IOCSPCAConfiguration*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOCSPCAConfiguration*, UInt32)
    release : Proc(IOCSPCAConfiguration*, UInt32)
    get_type_info_count : Proc(IOCSPCAConfiguration*, UInt32*, HRESULT)
    get_type_info : Proc(IOCSPCAConfiguration*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IOCSPCAConfiguration*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IOCSPCAConfiguration*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_identifier : Proc(IOCSPCAConfiguration*, UInt8**, HRESULT)
    get_ca_certificate : Proc(IOCSPCAConfiguration*, VARIANT*, HRESULT)
    get_hash_algorithm : Proc(IOCSPCAConfiguration*, UInt8**, HRESULT)
    put_hash_algorithm : Proc(IOCSPCAConfiguration*, UInt8*, HRESULT)
    get_signing_flags : Proc(IOCSPCAConfiguration*, UInt32*, HRESULT)
    put_signing_flags : Proc(IOCSPCAConfiguration*, UInt32, HRESULT)
    get_signing_certificate : Proc(IOCSPCAConfiguration*, VARIANT*, HRESULT)
    put_signing_certificate : Proc(IOCSPCAConfiguration*, VARIANT, HRESULT)
    get_reminder_duration : Proc(IOCSPCAConfiguration*, UInt32*, HRESULT)
    put_reminder_duration : Proc(IOCSPCAConfiguration*, UInt32, HRESULT)
    get_error_code : Proc(IOCSPCAConfiguration*, UInt32*, HRESULT)
    get_csp_name : Proc(IOCSPCAConfiguration*, UInt8**, HRESULT)
    get_key_spec : Proc(IOCSPCAConfiguration*, UInt32*, HRESULT)
    get_provider_clsid : Proc(IOCSPCAConfiguration*, UInt8**, HRESULT)
    put_provider_clsid : Proc(IOCSPCAConfiguration*, UInt8*, HRESULT)
    get_provider_properties : Proc(IOCSPCAConfiguration*, VARIANT*, HRESULT)
    put_provider_properties : Proc(IOCSPCAConfiguration*, VARIANT, HRESULT)
    get_modified : Proc(IOCSPCAConfiguration*, Int16*, HRESULT)
    get_local_revocation_information : Proc(IOCSPCAConfiguration*, VARIANT*, HRESULT)
    put_local_revocation_information : Proc(IOCSPCAConfiguration*, VARIANT, HRESULT)
    get_signing_certificate_template : Proc(IOCSPCAConfiguration*, UInt8**, HRESULT)
    put_signing_certificate_template : Proc(IOCSPCAConfiguration*, UInt8*, HRESULT)
    get_ca_config : Proc(IOCSPCAConfiguration*, UInt8**, HRESULT)
    put_ca_config : Proc(IOCSPCAConfiguration*, UInt8*, HRESULT)
  end

  IOCSPCAConfiguration_GUID = LibC::GUID.new("aec92b40-3d46-433f-87d1-b84d5c1e790d")
  CLSID_IOCSPCAConfiguration = "aec92b40-3d46-433f-87d1-b84d5c1e790d"
  struct IOCSPCAConfiguration
    lpVtbl : IOCSPCAConfigurationVTbl*
  end

  struct IOCSPCAConfigurationCollectionVTbl
    query_interface : Proc(IOCSPCAConfigurationCollection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOCSPCAConfigurationCollection*, UInt32)
    release : Proc(IOCSPCAConfigurationCollection*, UInt32)
    get_type_info_count : Proc(IOCSPCAConfigurationCollection*, UInt32*, HRESULT)
    get_type_info : Proc(IOCSPCAConfigurationCollection*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IOCSPCAConfigurationCollection*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IOCSPCAConfigurationCollection*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get__new_enum : Proc(IOCSPCAConfigurationCollection*, IUnknown*, HRESULT)
    get_item : Proc(IOCSPCAConfigurationCollection*, Int32, VARIANT*, HRESULT)
    get_count : Proc(IOCSPCAConfigurationCollection*, Int32*, HRESULT)
    get_item_by_name : Proc(IOCSPCAConfigurationCollection*, UInt8*, VARIANT*, HRESULT)
    create_ca_configuration : Proc(IOCSPCAConfigurationCollection*, UInt8*, VARIANT, IOCSPCAConfiguration*, HRESULT)
    delete_ca_configuration : Proc(IOCSPCAConfigurationCollection*, UInt8*, HRESULT)
  end

  IOCSPCAConfigurationCollection_GUID = LibC::GUID.new("2bebea0b-5ece-4f28-a91c-86b4bb20f0d3")
  CLSID_IOCSPCAConfigurationCollection = "2bebea0b-5ece-4f28-a91c-86b4bb20f0d3"
  struct IOCSPCAConfigurationCollection
    lpVtbl : IOCSPCAConfigurationCollectionVTbl*
  end

  struct IOCSPAdminVTbl
    query_interface : Proc(IOCSPAdmin*, Guid*, Void**, HRESULT)
    add_ref : Proc(IOCSPAdmin*, UInt32)
    release : Proc(IOCSPAdmin*, UInt32)
    get_type_info_count : Proc(IOCSPAdmin*, UInt32*, HRESULT)
    get_type_info : Proc(IOCSPAdmin*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IOCSPAdmin*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IOCSPAdmin*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_ocsp_service_properties : Proc(IOCSPAdmin*, IOCSPPropertyCollection*, HRESULT)
    get_ocspca_configuration_collection : Proc(IOCSPAdmin*, IOCSPCAConfigurationCollection*, HRESULT)
    get_configuration : Proc(IOCSPAdmin*, UInt8*, Int16, HRESULT)
    set_configuration : Proc(IOCSPAdmin*, UInt8*, Int16, HRESULT)
    get_my_roles : Proc(IOCSPAdmin*, UInt8*, Int32*, HRESULT)
    ping : Proc(IOCSPAdmin*, UInt8*, HRESULT)
    set_security : Proc(IOCSPAdmin*, UInt8*, UInt8*, HRESULT)
    get_security : Proc(IOCSPAdmin*, UInt8*, UInt8**, HRESULT)
    get_signing_certificates : Proc(IOCSPAdmin*, UInt8*, VARIANT*, VARIANT*, HRESULT)
    get_hash_algorithms : Proc(IOCSPAdmin*, UInt8*, UInt8*, VARIANT*, HRESULT)
  end

  IOCSPAdmin_GUID = LibC::GUID.new("322e830d-67db-4fe9-9577-4596d9f09294")
  CLSID_IOCSPAdmin = "322e830d-67db-4fe9-9577-4596d9f09294"
  struct IOCSPAdmin
    lpVtbl : IOCSPAdminVTbl*
  end

  struct ICertServerPolicyVTbl
    query_interface : Proc(ICertServerPolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertServerPolicy*, UInt32)
    release : Proc(ICertServerPolicy*, UInt32)
    get_type_info_count : Proc(ICertServerPolicy*, UInt32*, HRESULT)
    get_type_info : Proc(ICertServerPolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertServerPolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertServerPolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    set_context : Proc(ICertServerPolicy*, Int32, HRESULT)
    get_request_property : Proc(ICertServerPolicy*, UInt8*, Int32, VARIANT*, HRESULT)
    get_request_attribute : Proc(ICertServerPolicy*, UInt8*, UInt8**, HRESULT)
    get_certificate_property : Proc(ICertServerPolicy*, UInt8*, CERT_PROPERTY_TYPE, VARIANT*, HRESULT)
    set_certificate_property : Proc(ICertServerPolicy*, UInt8*, Int32, VARIANT*, HRESULT)
    get_certificate_extension : Proc(ICertServerPolicy*, UInt8*, CERT_PROPERTY_TYPE, VARIANT*, HRESULT)
    get_certificate_extension_flags : Proc(ICertServerPolicy*, Int32*, HRESULT)
    set_certificate_extension : Proc(ICertServerPolicy*, UInt8*, Int32, Int32, VARIANT*, HRESULT)
    enumerate_extensions_setup : Proc(ICertServerPolicy*, Int32, HRESULT)
    enumerate_extensions : Proc(ICertServerPolicy*, UInt8**, HRESULT)
    enumerate_extensions_close : Proc(ICertServerPolicy*, HRESULT)
    enumerate_attributes_setup : Proc(ICertServerPolicy*, Int32, HRESULT)
    enumerate_attributes : Proc(ICertServerPolicy*, UInt8**, HRESULT)
    enumerate_attributes_close : Proc(ICertServerPolicy*, HRESULT)
  end

  ICertServerPolicy_GUID = LibC::GUID.new("aa000922-ffbe-11cf-8800-00a0c903b83c")
  CLSID_ICertServerPolicy = "aa000922-ffbe-11cf-8800-00a0c903b83c"
  struct ICertServerPolicy
    lpVtbl : ICertServerPolicyVTbl*
  end

  struct ICertServerExitVTbl
    query_interface : Proc(ICertServerExit*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertServerExit*, UInt32)
    release : Proc(ICertServerExit*, UInt32)
    get_type_info_count : Proc(ICertServerExit*, UInt32*, HRESULT)
    get_type_info : Proc(ICertServerExit*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertServerExit*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertServerExit*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    set_context : Proc(ICertServerExit*, Int32, HRESULT)
    get_request_property : Proc(ICertServerExit*, UInt8*, Int32, VARIANT*, HRESULT)
    get_request_attribute : Proc(ICertServerExit*, UInt8*, UInt8**, HRESULT)
    get_certificate_property : Proc(ICertServerExit*, UInt8*, Int32, VARIANT*, HRESULT)
    get_certificate_extension : Proc(ICertServerExit*, UInt8*, Int32, VARIANT*, HRESULT)
    get_certificate_extension_flags : Proc(ICertServerExit*, Int32*, HRESULT)
    enumerate_extensions_setup : Proc(ICertServerExit*, Int32, HRESULT)
    enumerate_extensions : Proc(ICertServerExit*, UInt8**, HRESULT)
    enumerate_extensions_close : Proc(ICertServerExit*, HRESULT)
    enumerate_attributes_setup : Proc(ICertServerExit*, Int32, HRESULT)
    enumerate_attributes : Proc(ICertServerExit*, UInt8**, HRESULT)
    enumerate_attributes_close : Proc(ICertServerExit*, HRESULT)
  end

  ICertServerExit_GUID = LibC::GUID.new("4ba9eb90-732c-11d0-8816-00a0c903b83c")
  CLSID_ICertServerExit = "4ba9eb90-732c-11d0-8816-00a0c903b83c"
  struct ICertServerExit
    lpVtbl : ICertServerExitVTbl*
  end

  struct ICertGetConfigVTbl
    query_interface : Proc(ICertGetConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertGetConfig*, UInt32)
    release : Proc(ICertGetConfig*, UInt32)
    get_type_info_count : Proc(ICertGetConfig*, UInt32*, HRESULT)
    get_type_info : Proc(ICertGetConfig*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertGetConfig*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertGetConfig*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_config : Proc(ICertGetConfig*, CERT_GET_CONFIG_FLAGS, UInt8**, HRESULT)
  end

  ICertGetConfig_GUID = LibC::GUID.new("c7ea09c0-ce17-11d0-8833-00a0c903b83c")
  CLSID_ICertGetConfig = "c7ea09c0-ce17-11d0-8833-00a0c903b83c"
  struct ICertGetConfig
    lpVtbl : ICertGetConfigVTbl*
  end

  struct ICertConfigVTbl
    query_interface : Proc(ICertConfig*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertConfig*, UInt32)
    release : Proc(ICertConfig*, UInt32)
    get_type_info_count : Proc(ICertConfig*, UInt32*, HRESULT)
    get_type_info : Proc(ICertConfig*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertConfig*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertConfig*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(ICertConfig*, Int32, Int32*, HRESULT)
    next : Proc(ICertConfig*, Int32*, HRESULT)
    get_field : Proc(ICertConfig*, UInt8*, UInt8**, HRESULT)
    get_config : Proc(ICertConfig*, Int32, UInt8**, HRESULT)
  end

  ICertConfig_GUID = LibC::GUID.new("372fce34-4324-11d0-8810-00a0c903b83c")
  CLSID_ICertConfig = "372fce34-4324-11d0-8810-00a0c903b83c"
  struct ICertConfig
    lpVtbl : ICertConfigVTbl*
  end

  struct ICertConfig2VTbl
    query_interface : Proc(ICertConfig2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertConfig2*, UInt32)
    release : Proc(ICertConfig2*, UInt32)
    get_type_info_count : Proc(ICertConfig2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertConfig2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertConfig2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertConfig2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    reset : Proc(ICertConfig2*, Int32, Int32*, HRESULT)
    next : Proc(ICertConfig2*, Int32*, HRESULT)
    get_field : Proc(ICertConfig2*, UInt8*, UInt8**, HRESULT)
    get_config : Proc(ICertConfig2*, Int32, UInt8**, HRESULT)
    set_shared_folder : Proc(ICertConfig2*, UInt8*, HRESULT)
  end

  ICertConfig2_GUID = LibC::GUID.new("7a18edde-7e78-4163-8ded-78e2c9cee924")
  CLSID_ICertConfig2 = "7a18edde-7e78-4163-8ded-78e2c9cee924"
  struct ICertConfig2
    lpVtbl : ICertConfig2VTbl*
  end

  struct ICertRequestVTbl
    query_interface : Proc(ICertRequest*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertRequest*, UInt32)
    release : Proc(ICertRequest*, UInt32)
    get_type_info_count : Proc(ICertRequest*, UInt32*, HRESULT)
    get_type_info : Proc(ICertRequest*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertRequest*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertRequest*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    submit : Proc(ICertRequest*, Int32, UInt8*, UInt8*, UInt8*, Int32*, HRESULT)
    retrieve_pending : Proc(ICertRequest*, Int32, UInt8*, Int32*, HRESULT)
    get_last_status : Proc(ICertRequest*, Int32*, HRESULT)
    get_request_id : Proc(ICertRequest*, Int32*, HRESULT)
    get_disposition_message : Proc(ICertRequest*, UInt8**, HRESULT)
    get_ca_certificate : Proc(ICertRequest*, Int32, UInt8*, Int32, UInt8**, HRESULT)
    get_certificate : Proc(ICertRequest*, Int32, UInt8**, HRESULT)
  end

  ICertRequest_GUID = LibC::GUID.new("014e4840-5523-11d0-8812-00a0c903b83c")
  CLSID_ICertRequest = "014e4840-5523-11d0-8812-00a0c903b83c"
  struct ICertRequest
    lpVtbl : ICertRequestVTbl*
  end

  struct ICertRequest2VTbl
    query_interface : Proc(ICertRequest2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertRequest2*, UInt32)
    release : Proc(ICertRequest2*, UInt32)
    get_type_info_count : Proc(ICertRequest2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertRequest2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertRequest2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertRequest2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    submit : Proc(ICertRequest2*, Int32, UInt8*, UInt8*, UInt8*, Int32*, HRESULT)
    retrieve_pending : Proc(ICertRequest2*, Int32, UInt8*, Int32*, HRESULT)
    get_last_status : Proc(ICertRequest2*, Int32*, HRESULT)
    get_request_id : Proc(ICertRequest2*, Int32*, HRESULT)
    get_disposition_message : Proc(ICertRequest2*, UInt8**, HRESULT)
    get_ca_certificate : Proc(ICertRequest2*, Int32, UInt8*, Int32, UInt8**, HRESULT)
    get_certificate : Proc(ICertRequest2*, Int32, UInt8**, HRESULT)
    get_issued_certificate : Proc(ICertRequest2*, UInt8*, Int32, UInt8*, CR_DISP*, HRESULT)
    get_error_message_text : Proc(ICertRequest2*, Int32, Int32, UInt8**, HRESULT)
    get_ca_property : Proc(ICertRequest2*, UInt8*, Int32, Int32, Int32, Int32, VARIANT*, HRESULT)
    get_ca_property_flags : Proc(ICertRequest2*, UInt8*, Int32, Int32*, HRESULT)
    get_ca_property_display_name : Proc(ICertRequest2*, UInt8*, Int32, UInt8**, HRESULT)
    get_full_response_property : Proc(ICertRequest2*, FULL_RESPONSE_PROPERTY_ID, Int32, CERT_PROPERTY_TYPE, CERT_REQUEST_OUT_TYPE, VARIANT*, HRESULT)
  end

  ICertRequest2_GUID = LibC::GUID.new("a4772988-4a85-4fa9-824e-b5cf5c16405a")
  CLSID_ICertRequest2 = "a4772988-4a85-4fa9-824e-b5cf5c16405a"
  struct ICertRequest2
    lpVtbl : ICertRequest2VTbl*
  end

  struct ICertRequest3VTbl
    query_interface : Proc(ICertRequest3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertRequest3*, UInt32)
    release : Proc(ICertRequest3*, UInt32)
    get_type_info_count : Proc(ICertRequest3*, UInt32*, HRESULT)
    get_type_info : Proc(ICertRequest3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertRequest3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertRequest3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    submit : Proc(ICertRequest3*, Int32, UInt8*, UInt8*, UInt8*, Int32*, HRESULT)
    retrieve_pending : Proc(ICertRequest3*, Int32, UInt8*, Int32*, HRESULT)
    get_last_status : Proc(ICertRequest3*, Int32*, HRESULT)
    get_request_id : Proc(ICertRequest3*, Int32*, HRESULT)
    get_disposition_message : Proc(ICertRequest3*, UInt8**, HRESULT)
    get_ca_certificate : Proc(ICertRequest3*, Int32, UInt8*, Int32, UInt8**, HRESULT)
    get_certificate : Proc(ICertRequest3*, Int32, UInt8**, HRESULT)
    get_issued_certificate : Proc(ICertRequest3*, UInt8*, Int32, UInt8*, CR_DISP*, HRESULT)
    get_error_message_text : Proc(ICertRequest3*, Int32, Int32, UInt8**, HRESULT)
    get_ca_property : Proc(ICertRequest3*, UInt8*, Int32, Int32, Int32, Int32, VARIANT*, HRESULT)
    get_ca_property_flags : Proc(ICertRequest3*, UInt8*, Int32, Int32*, HRESULT)
    get_ca_property_display_name : Proc(ICertRequest3*, UInt8*, Int32, UInt8**, HRESULT)
    get_full_response_property : Proc(ICertRequest3*, FULL_RESPONSE_PROPERTY_ID, Int32, CERT_PROPERTY_TYPE, CERT_REQUEST_OUT_TYPE, VARIANT*, HRESULT)
    set_credential : Proc(ICertRequest3*, Int32, X509EnrollmentAuthFlags, UInt8*, UInt8*, HRESULT)
    get_request_id_string : Proc(ICertRequest3*, UInt8**, HRESULT)
    get_issued_certificate2 : Proc(ICertRequest3*, UInt8*, UInt8*, UInt8*, CR_DISP*, HRESULT)
    get_refresh_policy : Proc(ICertRequest3*, Int16*, HRESULT)
  end

  ICertRequest3_GUID = LibC::GUID.new("afc8f92b-33a2-4861-bf36-2933b7cd67b3")
  CLSID_ICertRequest3 = "afc8f92b-33a2-4861-bf36-2933b7cd67b3"
  struct ICertRequest3
    lpVtbl : ICertRequest3VTbl*
  end

  struct ICertManageModuleVTbl
    query_interface : Proc(ICertManageModule*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertManageModule*, UInt32)
    release : Proc(ICertManageModule*, UInt32)
    get_type_info_count : Proc(ICertManageModule*, UInt32*, HRESULT)
    get_type_info : Proc(ICertManageModule*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertManageModule*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertManageModule*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_property : Proc(ICertManageModule*, UInt8*, UInt8*, UInt8*, Int32, VARIANT*, HRESULT)
    set_property : Proc(ICertManageModule*, UInt8*, UInt8*, UInt8*, Int32, VARIANT*, HRESULT)
    configure : Proc(ICertManageModule*, UInt8*, UInt8*, Int32, HRESULT)
  end

  ICertManageModule_GUID = LibC::GUID.new("e7d7ad42-bd3d-11d1-9a4d-00c04fc297eb")
  CLSID_ICertManageModule = "e7d7ad42-bd3d-11d1-9a4d-00c04fc297eb"
  struct ICertManageModule
    lpVtbl : ICertManageModuleVTbl*
  end

  struct ICertPolicyVTbl
    query_interface : Proc(ICertPolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPolicy*, UInt32)
    release : Proc(ICertPolicy*, UInt32)
    get_type_info_count : Proc(ICertPolicy*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertPolicy*, UInt8*, HRESULT)
    verify_request : Proc(ICertPolicy*, UInt8*, Int32, Int32, Int32, Int32*, HRESULT)
    get_description : Proc(ICertPolicy*, UInt8**, HRESULT)
    shut_down : Proc(ICertPolicy*, HRESULT)
  end

  ICertPolicy_GUID = LibC::GUID.new("38bb5a00-7636-11d0-b413-00a0c91bbf8c")
  CLSID_ICertPolicy = "38bb5a00-7636-11d0-b413-00a0c91bbf8c"
  struct ICertPolicy
    lpVtbl : ICertPolicyVTbl*
  end

  struct ICertPolicy2VTbl
    query_interface : Proc(ICertPolicy2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPolicy2*, UInt32)
    release : Proc(ICertPolicy2*, UInt32)
    get_type_info_count : Proc(ICertPolicy2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPolicy2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPolicy2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPolicy2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertPolicy2*, UInt8*, HRESULT)
    verify_request : Proc(ICertPolicy2*, UInt8*, Int32, Int32, Int32, Int32*, HRESULT)
    get_description : Proc(ICertPolicy2*, UInt8**, HRESULT)
    shut_down : Proc(ICertPolicy2*, HRESULT)
    get_manage_module : Proc(ICertPolicy2*, ICertManageModule*, HRESULT)
  end

  ICertPolicy2_GUID = LibC::GUID.new("3db4910e-8001-4bf1-aa1b-f43a808317a0")
  CLSID_ICertPolicy2 = "3db4910e-8001-4bf1-aa1b-f43a808317a0"
  struct ICertPolicy2
    lpVtbl : ICertPolicy2VTbl*
  end

  struct INDESPolicyVTbl
    query_interface : Proc(INDESPolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(INDESPolicy*, UInt32)
    release : Proc(INDESPolicy*, UInt32)
    initialize : Proc(INDESPolicy*, HRESULT)
    uninitialize : Proc(INDESPolicy*, HRESULT)
    generate_challenge : Proc(INDESPolicy*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, HRESULT)
    verify_request : Proc(INDESPolicy*, CERTTRANSBLOB*, CERTTRANSBLOB*, LibC::LPWSTR, LibC::LPWSTR, LibC::BOOL*, HRESULT)
    notify : Proc(INDESPolicy*, LibC::LPWSTR, LibC::LPWSTR, X509SCEPDisposition, Int32, CERTTRANSBLOB*, HRESULT)
  end

  INDESPolicy_GUID = LibC::GUID.new("13ca515d-431d-46cc-8c2e-1da269bbd625")
  CLSID_INDESPolicy = "13ca515d-431d-46cc-8c2e-1da269bbd625"
  struct INDESPolicy
    lpVtbl : INDESPolicyVTbl*
  end

  struct IObjectIdVTbl
    query_interface : Proc(IObjectId*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectId*, UInt32)
    release : Proc(IObjectId*, UInt32)
    get_type_info_count : Proc(IObjectId*, UInt32*, HRESULT)
    get_type_info : Proc(IObjectId*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IObjectId*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IObjectId*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_name : Proc(IObjectId*, CERTENROLL_OBJECTID, HRESULT)
    initialize_from_value : Proc(IObjectId*, UInt8*, HRESULT)
    initialize_from_algorithm_name : Proc(IObjectId*, ObjectIdGroupId, ObjectIdPublicKeyFlags, AlgorithmFlags, UInt8*, HRESULT)
    get_name : Proc(IObjectId*, CERTENROLL_OBJECTID*, HRESULT)
    get_friendly_name : Proc(IObjectId*, UInt8**, HRESULT)
    put_friendly_name : Proc(IObjectId*, UInt8*, HRESULT)
    get_value : Proc(IObjectId*, UInt8**, HRESULT)
    get_algorithm_name : Proc(IObjectId*, ObjectIdGroupId, ObjectIdPublicKeyFlags, UInt8**, HRESULT)
  end

  IObjectId_GUID = LibC::GUID.new("728ab300-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IObjectId = "728ab300-217d-11da-b2a4-000e7bbb2b09"
  struct IObjectId
    lpVtbl : IObjectIdVTbl*
  end

  struct IObjectIdsVTbl
    query_interface : Proc(IObjectIds*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectIds*, UInt32)
    release : Proc(IObjectIds*, UInt32)
    get_type_info_count : Proc(IObjectIds*, UInt32*, HRESULT)
    get_type_info : Proc(IObjectIds*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IObjectIds*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IObjectIds*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IObjectIds*, Int32, IObjectId*, HRESULT)
    get_count : Proc(IObjectIds*, Int32*, HRESULT)
    get__new_enum : Proc(IObjectIds*, IUnknown*, HRESULT)
    add : Proc(IObjectIds*, IObjectId, HRESULT)
    remove : Proc(IObjectIds*, Int32, HRESULT)
    clear : Proc(IObjectIds*, HRESULT)
    add_range : Proc(IObjectIds*, IObjectIds, HRESULT)
  end

  IObjectIds_GUID = LibC::GUID.new("728ab301-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IObjectIds = "728ab301-217d-11da-b2a4-000e7bbb2b09"
  struct IObjectIds
    lpVtbl : IObjectIdsVTbl*
  end

  struct IBinaryConverterVTbl
    query_interface : Proc(IBinaryConverter*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBinaryConverter*, UInt32)
    release : Proc(IBinaryConverter*, UInt32)
    get_type_info_count : Proc(IBinaryConverter*, UInt32*, HRESULT)
    get_type_info : Proc(IBinaryConverter*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IBinaryConverter*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IBinaryConverter*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    string_to_string : Proc(IBinaryConverter*, UInt8*, EncodingType, EncodingType, UInt8**, HRESULT)
    variant_byte_array_to_string : Proc(IBinaryConverter*, VARIANT*, EncodingType, UInt8**, HRESULT)
    string_to_variant_byte_array : Proc(IBinaryConverter*, UInt8*, EncodingType, VARIANT*, HRESULT)
  end

  IBinaryConverter_GUID = LibC::GUID.new("728ab302-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IBinaryConverter = "728ab302-217d-11da-b2a4-000e7bbb2b09"
  struct IBinaryConverter
    lpVtbl : IBinaryConverterVTbl*
  end

  struct IBinaryConverter2VTbl
    query_interface : Proc(IBinaryConverter2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBinaryConverter2*, UInt32)
    release : Proc(IBinaryConverter2*, UInt32)
    get_type_info_count : Proc(IBinaryConverter2*, UInt32*, HRESULT)
    get_type_info : Proc(IBinaryConverter2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IBinaryConverter2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IBinaryConverter2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    string_to_string : Proc(IBinaryConverter2*, UInt8*, EncodingType, EncodingType, UInt8**, HRESULT)
    variant_byte_array_to_string : Proc(IBinaryConverter2*, VARIANT*, EncodingType, UInt8**, HRESULT)
    string_to_variant_byte_array : Proc(IBinaryConverter2*, UInt8*, EncodingType, VARIANT*, HRESULT)
    string_array_to_variant_array : Proc(IBinaryConverter2*, VARIANT*, VARIANT*, HRESULT)
    variant_array_to_string_array : Proc(IBinaryConverter2*, VARIANT*, VARIANT*, HRESULT)
  end

  IBinaryConverter2_GUID = LibC::GUID.new("8d7928b4-4e17-428d-9a17-728df00d1b2b")
  CLSID_IBinaryConverter2 = "8d7928b4-4e17-428d-9a17-728df00d1b2b"
  struct IBinaryConverter2
    lpVtbl : IBinaryConverter2VTbl*
  end

  struct IX500DistinguishedNameVTbl
    query_interface : Proc(IX500DistinguishedName*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX500DistinguishedName*, UInt32)
    release : Proc(IX500DistinguishedName*, UInt32)
    get_type_info_count : Proc(IX500DistinguishedName*, UInt32*, HRESULT)
    get_type_info : Proc(IX500DistinguishedName*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX500DistinguishedName*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX500DistinguishedName*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(IX500DistinguishedName*, UInt8*, EncodingType, X500NameFlags, HRESULT)
    encode : Proc(IX500DistinguishedName*, UInt8*, X500NameFlags, HRESULT)
    get_name : Proc(IX500DistinguishedName*, UInt8**, HRESULT)
    get_encoded_name : Proc(IX500DistinguishedName*, EncodingType, UInt8**, HRESULT)
  end

  IX500DistinguishedName_GUID = LibC::GUID.new("728ab303-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX500DistinguishedName = "728ab303-217d-11da-b2a4-000e7bbb2b09"
  struct IX500DistinguishedName
    lpVtbl : IX500DistinguishedNameVTbl*
  end

  struct IX509EnrollmentStatusVTbl
    query_interface : Proc(IX509EnrollmentStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509EnrollmentStatus*, UInt32)
    release : Proc(IX509EnrollmentStatus*, UInt32)
    get_type_info_count : Proc(IX509EnrollmentStatus*, UInt32*, HRESULT)
    get_type_info : Proc(IX509EnrollmentStatus*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509EnrollmentStatus*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509EnrollmentStatus*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    append_text : Proc(IX509EnrollmentStatus*, UInt8*, HRESULT)
    get_text : Proc(IX509EnrollmentStatus*, UInt8**, HRESULT)
    put_text : Proc(IX509EnrollmentStatus*, UInt8*, HRESULT)
    get_selected : Proc(IX509EnrollmentStatus*, EnrollmentSelectionStatus*, HRESULT)
    put_selected : Proc(IX509EnrollmentStatus*, EnrollmentSelectionStatus, HRESULT)
    get_display : Proc(IX509EnrollmentStatus*, EnrollmentDisplayStatus*, HRESULT)
    put_display : Proc(IX509EnrollmentStatus*, EnrollmentDisplayStatus, HRESULT)
    get_status : Proc(IX509EnrollmentStatus*, EnrollmentEnrollStatus*, HRESULT)
    put_status : Proc(IX509EnrollmentStatus*, EnrollmentEnrollStatus, HRESULT)
    get_error : Proc(IX509EnrollmentStatus*, HRESULT*, HRESULT)
    put_error : Proc(IX509EnrollmentStatus*, HRESULT, HRESULT)
    get_error_text : Proc(IX509EnrollmentStatus*, UInt8**, HRESULT)
  end

  IX509EnrollmentStatus_GUID = LibC::GUID.new("728ab304-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509EnrollmentStatus = "728ab304-217d-11da-b2a4-000e7bbb2b09"
  struct IX509EnrollmentStatus
    lpVtbl : IX509EnrollmentStatusVTbl*
  end

  struct ICspAlgorithmVTbl
    query_interface : Proc(ICspAlgorithm*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICspAlgorithm*, UInt32)
    release : Proc(ICspAlgorithm*, UInt32)
    get_type_info_count : Proc(ICspAlgorithm*, UInt32*, HRESULT)
    get_type_info : Proc(ICspAlgorithm*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICspAlgorithm*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICspAlgorithm*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_algorithm_oid : Proc(ICspAlgorithm*, Int32, AlgorithmFlags, IObjectId*, HRESULT)
    get_default_length : Proc(ICspAlgorithm*, Int32*, HRESULT)
    get_increment_length : Proc(ICspAlgorithm*, Int32*, HRESULT)
    get_long_name : Proc(ICspAlgorithm*, UInt8**, HRESULT)
    get_valid : Proc(ICspAlgorithm*, Int16*, HRESULT)
    get_max_length : Proc(ICspAlgorithm*, Int32*, HRESULT)
    get_min_length : Proc(ICspAlgorithm*, Int32*, HRESULT)
    get_name : Proc(ICspAlgorithm*, UInt8**, HRESULT)
    get_type : Proc(ICspAlgorithm*, AlgorithmType*, HRESULT)
    get_operations : Proc(ICspAlgorithm*, AlgorithmOperationFlags*, HRESULT)
  end

  ICspAlgorithm_GUID = LibC::GUID.new("728ab305-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICspAlgorithm = "728ab305-217d-11da-b2a4-000e7bbb2b09"
  struct ICspAlgorithm
    lpVtbl : ICspAlgorithmVTbl*
  end

  struct ICspAlgorithmsVTbl
    query_interface : Proc(ICspAlgorithms*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICspAlgorithms*, UInt32)
    release : Proc(ICspAlgorithms*, UInt32)
    get_type_info_count : Proc(ICspAlgorithms*, UInt32*, HRESULT)
    get_type_info : Proc(ICspAlgorithms*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICspAlgorithms*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICspAlgorithms*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICspAlgorithms*, Int32, ICspAlgorithm*, HRESULT)
    get_count : Proc(ICspAlgorithms*, Int32*, HRESULT)
    get__new_enum : Proc(ICspAlgorithms*, IUnknown*, HRESULT)
    add : Proc(ICspAlgorithms*, ICspAlgorithm, HRESULT)
    remove : Proc(ICspAlgorithms*, Int32, HRESULT)
    clear : Proc(ICspAlgorithms*, HRESULT)
    get_item_by_name : Proc(ICspAlgorithms*, UInt8*, ICspAlgorithm*, HRESULT)
    get_index_by_object_id : Proc(ICspAlgorithms*, IObjectId, Int32*, HRESULT)
  end

  ICspAlgorithms_GUID = LibC::GUID.new("728ab306-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICspAlgorithms = "728ab306-217d-11da-b2a4-000e7bbb2b09"
  struct ICspAlgorithms
    lpVtbl : ICspAlgorithmsVTbl*
  end

  struct ICspInformationVTbl
    query_interface : Proc(ICspInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICspInformation*, UInt32)
    release : Proc(ICspInformation*, UInt32)
    get_type_info_count : Proc(ICspInformation*, UInt32*, HRESULT)
    get_type_info : Proc(ICspInformation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICspInformation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICspInformation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_name : Proc(ICspInformation*, UInt8*, HRESULT)
    initialize_from_type : Proc(ICspInformation*, X509ProviderType, IObjectId, Int16, HRESULT)
    get_csp_algorithms : Proc(ICspInformation*, ICspAlgorithms*, HRESULT)
    get_has_hardware_random_number_generator : Proc(ICspInformation*, Int16*, HRESULT)
    get_is_hardware_device : Proc(ICspInformation*, Int16*, HRESULT)
    get_is_removable : Proc(ICspInformation*, Int16*, HRESULT)
    get_is_software_device : Proc(ICspInformation*, Int16*, HRESULT)
    get_valid : Proc(ICspInformation*, Int16*, HRESULT)
    get_max_key_container_name_length : Proc(ICspInformation*, Int32*, HRESULT)
    get_name : Proc(ICspInformation*, UInt8**, HRESULT)
    get_type : Proc(ICspInformation*, X509ProviderType*, HRESULT)
    get_version : Proc(ICspInformation*, Int32*, HRESULT)
    get_key_spec : Proc(ICspInformation*, X509KeySpec*, HRESULT)
    get_is_smart_card : Proc(ICspInformation*, Int16*, HRESULT)
    get_default_security_descriptor : Proc(ICspInformation*, Int16, UInt8**, HRESULT)
    get_legacy_csp : Proc(ICspInformation*, Int16*, HRESULT)
    get_csp_status_from_operations : Proc(ICspInformation*, IObjectId, AlgorithmOperationFlags, ICspStatus*, HRESULT)
  end

  ICspInformation_GUID = LibC::GUID.new("728ab307-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICspInformation = "728ab307-217d-11da-b2a4-000e7bbb2b09"
  struct ICspInformation
    lpVtbl : ICspInformationVTbl*
  end

  struct ICspInformationsVTbl
    query_interface : Proc(ICspInformations*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICspInformations*, UInt32)
    release : Proc(ICspInformations*, UInt32)
    get_type_info_count : Proc(ICspInformations*, UInt32*, HRESULT)
    get_type_info : Proc(ICspInformations*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICspInformations*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICspInformations*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICspInformations*, Int32, ICspInformation*, HRESULT)
    get_count : Proc(ICspInformations*, Int32*, HRESULT)
    get__new_enum : Proc(ICspInformations*, IUnknown*, HRESULT)
    add : Proc(ICspInformations*, ICspInformation, HRESULT)
    remove : Proc(ICspInformations*, Int32, HRESULT)
    clear : Proc(ICspInformations*, HRESULT)
    add_available_csps : Proc(ICspInformations*, HRESULT)
    get_item_by_name : Proc(ICspInformations*, UInt8*, ICspInformation*, HRESULT)
    get_csp_status_from_provider_name : Proc(ICspInformations*, UInt8*, X509KeySpec, ICspStatus*, HRESULT)
    get_csp_statuses_from_operations : Proc(ICspInformations*, AlgorithmOperationFlags, ICspInformation, ICspStatuses*, HRESULT)
    get_encryption_csp_algorithms : Proc(ICspInformations*, ICspInformation, ICspAlgorithms*, HRESULT)
    get_hash_algorithms : Proc(ICspInformations*, ICspInformation, IObjectIds*, HRESULT)
  end

  ICspInformations_GUID = LibC::GUID.new("728ab308-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICspInformations = "728ab308-217d-11da-b2a4-000e7bbb2b09"
  struct ICspInformations
    lpVtbl : ICspInformationsVTbl*
  end

  struct ICspStatusVTbl
    query_interface : Proc(ICspStatus*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICspStatus*, UInt32)
    release : Proc(ICspStatus*, UInt32)
    get_type_info_count : Proc(ICspStatus*, UInt32*, HRESULT)
    get_type_info : Proc(ICspStatus*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICspStatus*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICspStatus*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICspStatus*, ICspInformation, ICspAlgorithm, HRESULT)
    get_ordinal : Proc(ICspStatus*, Int32*, HRESULT)
    put_ordinal : Proc(ICspStatus*, Int32, HRESULT)
    get_csp_algorithm : Proc(ICspStatus*, ICspAlgorithm*, HRESULT)
    get_csp_information : Proc(ICspStatus*, ICspInformation*, HRESULT)
    get_enrollment_status : Proc(ICspStatus*, IX509EnrollmentStatus*, HRESULT)
    get_display_name : Proc(ICspStatus*, UInt8**, HRESULT)
  end

  ICspStatus_GUID = LibC::GUID.new("728ab309-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICspStatus = "728ab309-217d-11da-b2a4-000e7bbb2b09"
  struct ICspStatus
    lpVtbl : ICspStatusVTbl*
  end

  struct ICspStatusesVTbl
    query_interface : Proc(ICspStatuses*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICspStatuses*, UInt32)
    release : Proc(ICspStatuses*, UInt32)
    get_type_info_count : Proc(ICspStatuses*, UInt32*, HRESULT)
    get_type_info : Proc(ICspStatuses*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICspStatuses*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICspStatuses*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICspStatuses*, Int32, ICspStatus*, HRESULT)
    get_count : Proc(ICspStatuses*, Int32*, HRESULT)
    get__new_enum : Proc(ICspStatuses*, IUnknown*, HRESULT)
    add : Proc(ICspStatuses*, ICspStatus, HRESULT)
    remove : Proc(ICspStatuses*, Int32, HRESULT)
    clear : Proc(ICspStatuses*, HRESULT)
    get_item_by_name : Proc(ICspStatuses*, UInt8*, UInt8*, ICspStatus*, HRESULT)
    get_item_by_ordinal : Proc(ICspStatuses*, Int32, ICspStatus*, HRESULT)
    get_item_by_operations : Proc(ICspStatuses*, UInt8*, UInt8*, AlgorithmOperationFlags, ICspStatus*, HRESULT)
    get_item_by_provider : Proc(ICspStatuses*, ICspStatus, ICspStatus*, HRESULT)
  end

  ICspStatuses_GUID = LibC::GUID.new("728ab30a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICspStatuses = "728ab30a-217d-11da-b2a4-000e7bbb2b09"
  struct ICspStatuses
    lpVtbl : ICspStatusesVTbl*
  end

  struct IX509PublicKeyVTbl
    query_interface : Proc(IX509PublicKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509PublicKey*, UInt32)
    release : Proc(IX509PublicKey*, UInt32)
    get_type_info_count : Proc(IX509PublicKey*, UInt32*, HRESULT)
    get_type_info : Proc(IX509PublicKey*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509PublicKey*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509PublicKey*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509PublicKey*, IObjectId, UInt8*, UInt8*, EncodingType, HRESULT)
    initialize_from_encoded_public_key_info : Proc(IX509PublicKey*, UInt8*, EncodingType, HRESULT)
    get_algorithm : Proc(IX509PublicKey*, IObjectId*, HRESULT)
    get_length : Proc(IX509PublicKey*, Int32*, HRESULT)
    get_encoded_key : Proc(IX509PublicKey*, EncodingType, UInt8**, HRESULT)
    get_encoded_parameters : Proc(IX509PublicKey*, EncodingType, UInt8**, HRESULT)
    compute_key_identifier : Proc(IX509PublicKey*, KeyIdentifierHashAlgorithm, EncodingType, UInt8**, HRESULT)
  end

  IX509PublicKey_GUID = LibC::GUID.new("728ab30b-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509PublicKey = "728ab30b-217d-11da-b2a4-000e7bbb2b09"
  struct IX509PublicKey
    lpVtbl : IX509PublicKeyVTbl*
  end

  struct IX509PrivateKeyVTbl
    query_interface : Proc(IX509PrivateKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509PrivateKey*, UInt32)
    release : Proc(IX509PrivateKey*, UInt32)
    get_type_info_count : Proc(IX509PrivateKey*, UInt32*, HRESULT)
    get_type_info : Proc(IX509PrivateKey*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509PrivateKey*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509PrivateKey*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    open : Proc(IX509PrivateKey*, HRESULT)
    create : Proc(IX509PrivateKey*, HRESULT)
    close : Proc(IX509PrivateKey*, HRESULT)
    delete : Proc(IX509PrivateKey*, HRESULT)
    verify : Proc(IX509PrivateKey*, X509PrivateKeyVerify, HRESULT)
    import : Proc(IX509PrivateKey*, UInt8*, UInt8*, EncodingType, HRESULT)
    export : Proc(IX509PrivateKey*, UInt8*, EncodingType, UInt8**, HRESULT)
    export_public_key : Proc(IX509PrivateKey*, IX509PublicKey*, HRESULT)
    get_container_name : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_container_name : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_container_name_prefix : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_container_name_prefix : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_reader_name : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_reader_name : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_csp_informations : Proc(IX509PrivateKey*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509PrivateKey*, ICspInformations, HRESULT)
    get_csp_status : Proc(IX509PrivateKey*, ICspStatus*, HRESULT)
    put_csp_status : Proc(IX509PrivateKey*, ICspStatus, HRESULT)
    get_provider_name : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_provider_name : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_provider_type : Proc(IX509PrivateKey*, X509ProviderType*, HRESULT)
    put_provider_type : Proc(IX509PrivateKey*, X509ProviderType, HRESULT)
    get_legacy_csp : Proc(IX509PrivateKey*, Int16*, HRESULT)
    put_legacy_csp : Proc(IX509PrivateKey*, Int16, HRESULT)
    get_algorithm : Proc(IX509PrivateKey*, IObjectId*, HRESULT)
    put_algorithm : Proc(IX509PrivateKey*, IObjectId, HRESULT)
    get_key_spec : Proc(IX509PrivateKey*, X509KeySpec*, HRESULT)
    put_key_spec : Proc(IX509PrivateKey*, X509KeySpec, HRESULT)
    get_length : Proc(IX509PrivateKey*, Int32*, HRESULT)
    put_length : Proc(IX509PrivateKey*, Int32, HRESULT)
    get_export_policy : Proc(IX509PrivateKey*, X509PrivateKeyExportFlags*, HRESULT)
    put_export_policy : Proc(IX509PrivateKey*, X509PrivateKeyExportFlags, HRESULT)
    get_key_usage : Proc(IX509PrivateKey*, X509PrivateKeyUsageFlags*, HRESULT)
    put_key_usage : Proc(IX509PrivateKey*, X509PrivateKeyUsageFlags, HRESULT)
    get_key_protection : Proc(IX509PrivateKey*, X509PrivateKeyProtection*, HRESULT)
    put_key_protection : Proc(IX509PrivateKey*, X509PrivateKeyProtection, HRESULT)
    get_machine_context : Proc(IX509PrivateKey*, Int16*, HRESULT)
    put_machine_context : Proc(IX509PrivateKey*, Int16, HRESULT)
    get_security_descriptor : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_security_descriptor : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_certificate : Proc(IX509PrivateKey*, EncodingType, UInt8**, HRESULT)
    put_certificate : Proc(IX509PrivateKey*, EncodingType, UInt8*, HRESULT)
    get_unique_container_name : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    get_opened : Proc(IX509PrivateKey*, Int16*, HRESULT)
    get_default_container : Proc(IX509PrivateKey*, Int16*, HRESULT)
    get_existing : Proc(IX509PrivateKey*, Int16*, HRESULT)
    put_existing : Proc(IX509PrivateKey*, Int16, HRESULT)
    get_silent : Proc(IX509PrivateKey*, Int16*, HRESULT)
    put_silent : Proc(IX509PrivateKey*, Int16, HRESULT)
    get_parent_window : Proc(IX509PrivateKey*, Int32*, HRESULT)
    put_parent_window : Proc(IX509PrivateKey*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    put_pin : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_friendly_name : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_friendly_name : Proc(IX509PrivateKey*, UInt8*, HRESULT)
    get_description : Proc(IX509PrivateKey*, UInt8**, HRESULT)
    put_description : Proc(IX509PrivateKey*, UInt8*, HRESULT)
  end

  IX509PrivateKey_GUID = LibC::GUID.new("728ab30c-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509PrivateKey = "728ab30c-217d-11da-b2a4-000e7bbb2b09"
  struct IX509PrivateKey
    lpVtbl : IX509PrivateKeyVTbl*
  end

  struct IX509PrivateKey2VTbl
    query_interface : Proc(IX509PrivateKey2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509PrivateKey2*, UInt32)
    release : Proc(IX509PrivateKey2*, UInt32)
    get_type_info_count : Proc(IX509PrivateKey2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509PrivateKey2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509PrivateKey2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509PrivateKey2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    open : Proc(IX509PrivateKey2*, HRESULT)
    create : Proc(IX509PrivateKey2*, HRESULT)
    close : Proc(IX509PrivateKey2*, HRESULT)
    delete : Proc(IX509PrivateKey2*, HRESULT)
    verify : Proc(IX509PrivateKey2*, X509PrivateKeyVerify, HRESULT)
    import : Proc(IX509PrivateKey2*, UInt8*, UInt8*, EncodingType, HRESULT)
    export : Proc(IX509PrivateKey2*, UInt8*, EncodingType, UInt8**, HRESULT)
    export_public_key : Proc(IX509PrivateKey2*, IX509PublicKey*, HRESULT)
    get_container_name : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_container_name : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_container_name_prefix : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_container_name_prefix : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_reader_name : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_reader_name : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_csp_informations : Proc(IX509PrivateKey2*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509PrivateKey2*, ICspInformations, HRESULT)
    get_csp_status : Proc(IX509PrivateKey2*, ICspStatus*, HRESULT)
    put_csp_status : Proc(IX509PrivateKey2*, ICspStatus, HRESULT)
    get_provider_name : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_provider_name : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_provider_type : Proc(IX509PrivateKey2*, X509ProviderType*, HRESULT)
    put_provider_type : Proc(IX509PrivateKey2*, X509ProviderType, HRESULT)
    get_legacy_csp : Proc(IX509PrivateKey2*, Int16*, HRESULT)
    put_legacy_csp : Proc(IX509PrivateKey2*, Int16, HRESULT)
    get_algorithm : Proc(IX509PrivateKey2*, IObjectId*, HRESULT)
    put_algorithm : Proc(IX509PrivateKey2*, IObjectId, HRESULT)
    get_key_spec : Proc(IX509PrivateKey2*, X509KeySpec*, HRESULT)
    put_key_spec : Proc(IX509PrivateKey2*, X509KeySpec, HRESULT)
    get_length : Proc(IX509PrivateKey2*, Int32*, HRESULT)
    put_length : Proc(IX509PrivateKey2*, Int32, HRESULT)
    get_export_policy : Proc(IX509PrivateKey2*, X509PrivateKeyExportFlags*, HRESULT)
    put_export_policy : Proc(IX509PrivateKey2*, X509PrivateKeyExportFlags, HRESULT)
    get_key_usage : Proc(IX509PrivateKey2*, X509PrivateKeyUsageFlags*, HRESULT)
    put_key_usage : Proc(IX509PrivateKey2*, X509PrivateKeyUsageFlags, HRESULT)
    get_key_protection : Proc(IX509PrivateKey2*, X509PrivateKeyProtection*, HRESULT)
    put_key_protection : Proc(IX509PrivateKey2*, X509PrivateKeyProtection, HRESULT)
    get_machine_context : Proc(IX509PrivateKey2*, Int16*, HRESULT)
    put_machine_context : Proc(IX509PrivateKey2*, Int16, HRESULT)
    get_security_descriptor : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_security_descriptor : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_certificate : Proc(IX509PrivateKey2*, EncodingType, UInt8**, HRESULT)
    put_certificate : Proc(IX509PrivateKey2*, EncodingType, UInt8*, HRESULT)
    get_unique_container_name : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    get_opened : Proc(IX509PrivateKey2*, Int16*, HRESULT)
    get_default_container : Proc(IX509PrivateKey2*, Int16*, HRESULT)
    get_existing : Proc(IX509PrivateKey2*, Int16*, HRESULT)
    put_existing : Proc(IX509PrivateKey2*, Int16, HRESULT)
    get_silent : Proc(IX509PrivateKey2*, Int16*, HRESULT)
    put_silent : Proc(IX509PrivateKey2*, Int16, HRESULT)
    get_parent_window : Proc(IX509PrivateKey2*, Int32*, HRESULT)
    put_parent_window : Proc(IX509PrivateKey2*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    put_pin : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_friendly_name : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_friendly_name : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_description : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_description : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_hardware_key_usage : Proc(IX509PrivateKey2*, X509HardwareKeyUsageFlags*, HRESULT)
    put_hardware_key_usage : Proc(IX509PrivateKey2*, X509HardwareKeyUsageFlags, HRESULT)
    get_alternate_storage_location : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_alternate_storage_location : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_algorithm_name : Proc(IX509PrivateKey2*, UInt8**, HRESULT)
    put_algorithm_name : Proc(IX509PrivateKey2*, UInt8*, HRESULT)
    get_algorithm_parameters : Proc(IX509PrivateKey2*, EncodingType, UInt8**, HRESULT)
    put_algorithm_parameters : Proc(IX509PrivateKey2*, EncodingType, UInt8*, HRESULT)
    get_parameters_export_type : Proc(IX509PrivateKey2*, X509KeyParametersExportType*, HRESULT)
    put_parameters_export_type : Proc(IX509PrivateKey2*, X509KeyParametersExportType, HRESULT)
  end

  IX509PrivateKey2_GUID = LibC::GUID.new("728ab362-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509PrivateKey2 = "728ab362-217d-11da-b2a4-000e7bbb2b09"
  struct IX509PrivateKey2
    lpVtbl : IX509PrivateKey2VTbl*
  end

  struct IX509EndorsementKeyVTbl
    query_interface : Proc(IX509EndorsementKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509EndorsementKey*, UInt32)
    release : Proc(IX509EndorsementKey*, UInt32)
    get_type_info_count : Proc(IX509EndorsementKey*, UInt32*, HRESULT)
    get_type_info : Proc(IX509EndorsementKey*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509EndorsementKey*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509EndorsementKey*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_provider_name : Proc(IX509EndorsementKey*, UInt8**, HRESULT)
    put_provider_name : Proc(IX509EndorsementKey*, UInt8*, HRESULT)
    get_length : Proc(IX509EndorsementKey*, Int32*, HRESULT)
    get_opened : Proc(IX509EndorsementKey*, Int16*, HRESULT)
    add_certificate : Proc(IX509EndorsementKey*, EncodingType, UInt8*, HRESULT)
    remove_certificate : Proc(IX509EndorsementKey*, EncodingType, UInt8*, HRESULT)
    get_certificate_by_index : Proc(IX509EndorsementKey*, Int16, Int32, EncodingType, UInt8**, HRESULT)
    get_certificate_count : Proc(IX509EndorsementKey*, Int16, Int32*, HRESULT)
    export_public_key : Proc(IX509EndorsementKey*, IX509PublicKey*, HRESULT)
    open : Proc(IX509EndorsementKey*, HRESULT)
    close : Proc(IX509EndorsementKey*, HRESULT)
  end

  IX509EndorsementKey_GUID = LibC::GUID.new("b11cd855-f4c4-4fc6-b710-4422237f09e9")
  CLSID_IX509EndorsementKey = "b11cd855-f4c4-4fc6-b710-4422237f09e9"
  struct IX509EndorsementKey
    lpVtbl : IX509EndorsementKeyVTbl*
  end

  struct IX509ExtensionVTbl
    query_interface : Proc(IX509Extension*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509Extension*, UInt32)
    release : Proc(IX509Extension*, UInt32)
    get_type_info_count : Proc(IX509Extension*, UInt32*, HRESULT)
    get_type_info : Proc(IX509Extension*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509Extension*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509Extension*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509Extension*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509Extension*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509Extension*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509Extension*, Int16*, HRESULT)
    put_critical : Proc(IX509Extension*, Int16, HRESULT)
  end

  IX509Extension_GUID = LibC::GUID.new("728ab30d-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509Extension = "728ab30d-217d-11da-b2a4-000e7bbb2b09"
  struct IX509Extension
    lpVtbl : IX509ExtensionVTbl*
  end

  struct IX509ExtensionsVTbl
    query_interface : Proc(IX509Extensions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509Extensions*, UInt32)
    release : Proc(IX509Extensions*, UInt32)
    get_type_info_count : Proc(IX509Extensions*, UInt32*, HRESULT)
    get_type_info : Proc(IX509Extensions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509Extensions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509Extensions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IX509Extensions*, Int32, IX509Extension*, HRESULT)
    get_count : Proc(IX509Extensions*, Int32*, HRESULT)
    get__new_enum : Proc(IX509Extensions*, IUnknown*, HRESULT)
    add : Proc(IX509Extensions*, IX509Extension, HRESULT)
    remove : Proc(IX509Extensions*, Int32, HRESULT)
    clear : Proc(IX509Extensions*, HRESULT)
    get_index_by_object_id : Proc(IX509Extensions*, IObjectId, Int32*, HRESULT)
    add_range : Proc(IX509Extensions*, IX509Extensions, HRESULT)
  end

  IX509Extensions_GUID = LibC::GUID.new("728ab30e-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509Extensions = "728ab30e-217d-11da-b2a4-000e7bbb2b09"
  struct IX509Extensions
    lpVtbl : IX509ExtensionsVTbl*
  end

  struct IX509ExtensionKeyUsageVTbl
    query_interface : Proc(IX509ExtensionKeyUsage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionKeyUsage*, UInt32)
    release : Proc(IX509ExtensionKeyUsage*, UInt32)
    get_type_info_count : Proc(IX509ExtensionKeyUsage*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionKeyUsage*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionKeyUsage*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionKeyUsage*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionKeyUsage*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionKeyUsage*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionKeyUsage*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionKeyUsage*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionKeyUsage*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionKeyUsage*, X509KeyUsageFlags, HRESULT)
    initialize_decode : Proc(IX509ExtensionKeyUsage*, EncodingType, UInt8*, HRESULT)
    get_key_usage : Proc(IX509ExtensionKeyUsage*, X509KeyUsageFlags*, HRESULT)
  end

  IX509ExtensionKeyUsage_GUID = LibC::GUID.new("728ab30f-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionKeyUsage = "728ab30f-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionKeyUsage
    lpVtbl : IX509ExtensionKeyUsageVTbl*
  end

  struct IX509ExtensionEnhancedKeyUsageVTbl
    query_interface : Proc(IX509ExtensionEnhancedKeyUsage*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionEnhancedKeyUsage*, UInt32)
    release : Proc(IX509ExtensionEnhancedKeyUsage*, UInt32)
    get_type_info_count : Proc(IX509ExtensionEnhancedKeyUsage*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionEnhancedKeyUsage*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionEnhancedKeyUsage*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionEnhancedKeyUsage*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionEnhancedKeyUsage*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionEnhancedKeyUsage*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionEnhancedKeyUsage*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionEnhancedKeyUsage*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionEnhancedKeyUsage*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionEnhancedKeyUsage*, IObjectIds, HRESULT)
    initialize_decode : Proc(IX509ExtensionEnhancedKeyUsage*, EncodingType, UInt8*, HRESULT)
    get_enhanced_key_usage : Proc(IX509ExtensionEnhancedKeyUsage*, IObjectIds*, HRESULT)
  end

  IX509ExtensionEnhancedKeyUsage_GUID = LibC::GUID.new("728ab310-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionEnhancedKeyUsage = "728ab310-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionEnhancedKeyUsage
    lpVtbl : IX509ExtensionEnhancedKeyUsageVTbl*
  end

  struct IX509ExtensionTemplateNameVTbl
    query_interface : Proc(IX509ExtensionTemplateName*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionTemplateName*, UInt32)
    release : Proc(IX509ExtensionTemplateName*, UInt32)
    get_type_info_count : Proc(IX509ExtensionTemplateName*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionTemplateName*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionTemplateName*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionTemplateName*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionTemplateName*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionTemplateName*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionTemplateName*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionTemplateName*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionTemplateName*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionTemplateName*, UInt8*, HRESULT)
    initialize_decode : Proc(IX509ExtensionTemplateName*, EncodingType, UInt8*, HRESULT)
    get_template_name : Proc(IX509ExtensionTemplateName*, UInt8**, HRESULT)
  end

  IX509ExtensionTemplateName_GUID = LibC::GUID.new("728ab311-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionTemplateName = "728ab311-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionTemplateName
    lpVtbl : IX509ExtensionTemplateNameVTbl*
  end

  struct IX509ExtensionTemplateVTbl
    query_interface : Proc(IX509ExtensionTemplate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionTemplate*, UInt32)
    release : Proc(IX509ExtensionTemplate*, UInt32)
    get_type_info_count : Proc(IX509ExtensionTemplate*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionTemplate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionTemplate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionTemplate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionTemplate*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionTemplate*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionTemplate*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionTemplate*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionTemplate*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionTemplate*, IObjectId, Int32, Int32, HRESULT)
    initialize_decode : Proc(IX509ExtensionTemplate*, EncodingType, UInt8*, HRESULT)
    get_template_oid : Proc(IX509ExtensionTemplate*, IObjectId*, HRESULT)
    get_major_version : Proc(IX509ExtensionTemplate*, Int32*, HRESULT)
    get_minor_version : Proc(IX509ExtensionTemplate*, Int32*, HRESULT)
  end

  IX509ExtensionTemplate_GUID = LibC::GUID.new("728ab312-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionTemplate = "728ab312-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionTemplate
    lpVtbl : IX509ExtensionTemplateVTbl*
  end

  struct IAlternativeNameVTbl
    query_interface : Proc(IAlternativeName*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAlternativeName*, UInt32)
    release : Proc(IAlternativeName*, UInt32)
    get_type_info_count : Proc(IAlternativeName*, UInt32*, HRESULT)
    get_type_info : Proc(IAlternativeName*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAlternativeName*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAlternativeName*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_string : Proc(IAlternativeName*, AlternativeNameType, UInt8*, HRESULT)
    initialize_from_raw_data : Proc(IAlternativeName*, AlternativeNameType, EncodingType, UInt8*, HRESULT)
    initialize_from_other_name : Proc(IAlternativeName*, IObjectId, EncodingType, UInt8*, Int16, HRESULT)
    get_type : Proc(IAlternativeName*, AlternativeNameType*, HRESULT)
    get_str_value : Proc(IAlternativeName*, UInt8**, HRESULT)
    get_object_id : Proc(IAlternativeName*, IObjectId*, HRESULT)
    get_raw_data : Proc(IAlternativeName*, EncodingType, UInt8**, HRESULT)
  end

  IAlternativeName_GUID = LibC::GUID.new("728ab313-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IAlternativeName = "728ab313-217d-11da-b2a4-000e7bbb2b09"
  struct IAlternativeName
    lpVtbl : IAlternativeNameVTbl*
  end

  struct IAlternativeNamesVTbl
    query_interface : Proc(IAlternativeNames*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAlternativeNames*, UInt32)
    release : Proc(IAlternativeNames*, UInt32)
    get_type_info_count : Proc(IAlternativeNames*, UInt32*, HRESULT)
    get_type_info : Proc(IAlternativeNames*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAlternativeNames*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAlternativeNames*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IAlternativeNames*, Int32, IAlternativeName*, HRESULT)
    get_count : Proc(IAlternativeNames*, Int32*, HRESULT)
    get__new_enum : Proc(IAlternativeNames*, IUnknown*, HRESULT)
    add : Proc(IAlternativeNames*, IAlternativeName, HRESULT)
    remove : Proc(IAlternativeNames*, Int32, HRESULT)
    clear : Proc(IAlternativeNames*, HRESULT)
  end

  IAlternativeNames_GUID = LibC::GUID.new("728ab314-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IAlternativeNames = "728ab314-217d-11da-b2a4-000e7bbb2b09"
  struct IAlternativeNames
    lpVtbl : IAlternativeNamesVTbl*
  end

  struct IX509ExtensionAlternativeNamesVTbl
    query_interface : Proc(IX509ExtensionAlternativeNames*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionAlternativeNames*, UInt32)
    release : Proc(IX509ExtensionAlternativeNames*, UInt32)
    get_type_info_count : Proc(IX509ExtensionAlternativeNames*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionAlternativeNames*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionAlternativeNames*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionAlternativeNames*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionAlternativeNames*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionAlternativeNames*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionAlternativeNames*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionAlternativeNames*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionAlternativeNames*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionAlternativeNames*, IAlternativeNames, HRESULT)
    initialize_decode : Proc(IX509ExtensionAlternativeNames*, EncodingType, UInt8*, HRESULT)
    get_alternative_names : Proc(IX509ExtensionAlternativeNames*, IAlternativeNames*, HRESULT)
  end

  IX509ExtensionAlternativeNames_GUID = LibC::GUID.new("728ab315-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionAlternativeNames = "728ab315-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionAlternativeNames
    lpVtbl : IX509ExtensionAlternativeNamesVTbl*
  end

  struct IX509ExtensionBasicConstraintsVTbl
    query_interface : Proc(IX509ExtensionBasicConstraints*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionBasicConstraints*, UInt32)
    release : Proc(IX509ExtensionBasicConstraints*, UInt32)
    get_type_info_count : Proc(IX509ExtensionBasicConstraints*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionBasicConstraints*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionBasicConstraints*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionBasicConstraints*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionBasicConstraints*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionBasicConstraints*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionBasicConstraints*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionBasicConstraints*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionBasicConstraints*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionBasicConstraints*, Int16, Int32, HRESULT)
    initialize_decode : Proc(IX509ExtensionBasicConstraints*, EncodingType, UInt8*, HRESULT)
    get_is_ca : Proc(IX509ExtensionBasicConstraints*, Int16*, HRESULT)
    get_path_len_constraint : Proc(IX509ExtensionBasicConstraints*, Int32*, HRESULT)
  end

  IX509ExtensionBasicConstraints_GUID = LibC::GUID.new("728ab316-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionBasicConstraints = "728ab316-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionBasicConstraints
    lpVtbl : IX509ExtensionBasicConstraintsVTbl*
  end

  struct IX509ExtensionSubjectKeyIdentifierVTbl
    query_interface : Proc(IX509ExtensionSubjectKeyIdentifier*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionSubjectKeyIdentifier*, UInt32)
    release : Proc(IX509ExtensionSubjectKeyIdentifier*, UInt32)
    get_type_info_count : Proc(IX509ExtensionSubjectKeyIdentifier*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionSubjectKeyIdentifier*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionSubjectKeyIdentifier*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionSubjectKeyIdentifier*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionSubjectKeyIdentifier*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionSubjectKeyIdentifier*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionSubjectKeyIdentifier*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionSubjectKeyIdentifier*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionSubjectKeyIdentifier*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionSubjectKeyIdentifier*, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(IX509ExtensionSubjectKeyIdentifier*, EncodingType, UInt8*, HRESULT)
    get_subject_key_identifier : Proc(IX509ExtensionSubjectKeyIdentifier*, EncodingType, UInt8**, HRESULT)
  end

  IX509ExtensionSubjectKeyIdentifier_GUID = LibC::GUID.new("728ab317-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionSubjectKeyIdentifier = "728ab317-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionSubjectKeyIdentifier
    lpVtbl : IX509ExtensionSubjectKeyIdentifierVTbl*
  end

  struct IX509ExtensionAuthorityKeyIdentifierVTbl
    query_interface : Proc(IX509ExtensionAuthorityKeyIdentifier*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionAuthorityKeyIdentifier*, UInt32)
    release : Proc(IX509ExtensionAuthorityKeyIdentifier*, UInt32)
    get_type_info_count : Proc(IX509ExtensionAuthorityKeyIdentifier*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionAuthorityKeyIdentifier*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionAuthorityKeyIdentifier*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionAuthorityKeyIdentifier*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionAuthorityKeyIdentifier*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionAuthorityKeyIdentifier*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionAuthorityKeyIdentifier*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionAuthorityKeyIdentifier*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionAuthorityKeyIdentifier*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionAuthorityKeyIdentifier*, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(IX509ExtensionAuthorityKeyIdentifier*, EncodingType, UInt8*, HRESULT)
    get_authority_key_identifier : Proc(IX509ExtensionAuthorityKeyIdentifier*, EncodingType, UInt8**, HRESULT)
  end

  IX509ExtensionAuthorityKeyIdentifier_GUID = LibC::GUID.new("728ab318-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionAuthorityKeyIdentifier = "728ab318-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionAuthorityKeyIdentifier
    lpVtbl : IX509ExtensionAuthorityKeyIdentifierVTbl*
  end

  struct ISmimeCapabilityVTbl
    query_interface : Proc(ISmimeCapability*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISmimeCapability*, UInt32)
    release : Proc(ISmimeCapability*, UInt32)
    get_type_info_count : Proc(ISmimeCapability*, UInt32*, HRESULT)
    get_type_info : Proc(ISmimeCapability*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISmimeCapability*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISmimeCapability*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ISmimeCapability*, IObjectId, Int32, HRESULT)
    get_object_id : Proc(ISmimeCapability*, IObjectId*, HRESULT)
    get_bit_count : Proc(ISmimeCapability*, Int32*, HRESULT)
  end

  ISmimeCapability_GUID = LibC::GUID.new("728ab319-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ISmimeCapability = "728ab319-217d-11da-b2a4-000e7bbb2b09"
  struct ISmimeCapability
    lpVtbl : ISmimeCapabilityVTbl*
  end

  struct ISmimeCapabilitiesVTbl
    query_interface : Proc(ISmimeCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISmimeCapabilities*, UInt32)
    release : Proc(ISmimeCapabilities*, UInt32)
    get_type_info_count : Proc(ISmimeCapabilities*, UInt32*, HRESULT)
    get_type_info : Proc(ISmimeCapabilities*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISmimeCapabilities*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISmimeCapabilities*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ISmimeCapabilities*, Int32, ISmimeCapability*, HRESULT)
    get_count : Proc(ISmimeCapabilities*, Int32*, HRESULT)
    get__new_enum : Proc(ISmimeCapabilities*, IUnknown*, HRESULT)
    add : Proc(ISmimeCapabilities*, ISmimeCapability, HRESULT)
    remove : Proc(ISmimeCapabilities*, Int32, HRESULT)
    clear : Proc(ISmimeCapabilities*, HRESULT)
    add_from_csp : Proc(ISmimeCapabilities*, ICspInformation, HRESULT)
    add_available_smime_capabilities : Proc(ISmimeCapabilities*, Int16, HRESULT)
  end

  ISmimeCapabilities_GUID = LibC::GUID.new("728ab31a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ISmimeCapabilities = "728ab31a-217d-11da-b2a4-000e7bbb2b09"
  struct ISmimeCapabilities
    lpVtbl : ISmimeCapabilitiesVTbl*
  end

  struct IX509ExtensionSmimeCapabilitiesVTbl
    query_interface : Proc(IX509ExtensionSmimeCapabilities*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionSmimeCapabilities*, UInt32)
    release : Proc(IX509ExtensionSmimeCapabilities*, UInt32)
    get_type_info_count : Proc(IX509ExtensionSmimeCapabilities*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionSmimeCapabilities*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionSmimeCapabilities*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionSmimeCapabilities*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionSmimeCapabilities*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionSmimeCapabilities*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionSmimeCapabilities*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionSmimeCapabilities*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionSmimeCapabilities*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionSmimeCapabilities*, ISmimeCapabilities, HRESULT)
    initialize_decode : Proc(IX509ExtensionSmimeCapabilities*, EncodingType, UInt8*, HRESULT)
    get_smime_capabilities : Proc(IX509ExtensionSmimeCapabilities*, ISmimeCapabilities*, HRESULT)
  end

  IX509ExtensionSmimeCapabilities_GUID = LibC::GUID.new("728ab31b-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionSmimeCapabilities = "728ab31b-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionSmimeCapabilities
    lpVtbl : IX509ExtensionSmimeCapabilitiesVTbl*
  end

  struct IPolicyQualifierVTbl
    query_interface : Proc(IPolicyQualifier*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPolicyQualifier*, UInt32)
    release : Proc(IPolicyQualifier*, UInt32)
    get_type_info_count : Proc(IPolicyQualifier*, UInt32*, HRESULT)
    get_type_info : Proc(IPolicyQualifier*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPolicyQualifier*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPolicyQualifier*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_encode : Proc(IPolicyQualifier*, UInt8*, PolicyQualifierType, HRESULT)
    get_object_id : Proc(IPolicyQualifier*, IObjectId*, HRESULT)
    get_qualifier : Proc(IPolicyQualifier*, UInt8**, HRESULT)
    get_type : Proc(IPolicyQualifier*, PolicyQualifierType*, HRESULT)
    get_raw_data : Proc(IPolicyQualifier*, EncodingType, UInt8**, HRESULT)
  end

  IPolicyQualifier_GUID = LibC::GUID.new("728ab31c-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IPolicyQualifier = "728ab31c-217d-11da-b2a4-000e7bbb2b09"
  struct IPolicyQualifier
    lpVtbl : IPolicyQualifierVTbl*
  end

  struct IPolicyQualifiersVTbl
    query_interface : Proc(IPolicyQualifiers*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPolicyQualifiers*, UInt32)
    release : Proc(IPolicyQualifiers*, UInt32)
    get_type_info_count : Proc(IPolicyQualifiers*, UInt32*, HRESULT)
    get_type_info : Proc(IPolicyQualifiers*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPolicyQualifiers*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPolicyQualifiers*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IPolicyQualifiers*, Int32, IPolicyQualifier*, HRESULT)
    get_count : Proc(IPolicyQualifiers*, Int32*, HRESULT)
    get__new_enum : Proc(IPolicyQualifiers*, IUnknown*, HRESULT)
    add : Proc(IPolicyQualifiers*, IPolicyQualifier, HRESULT)
    remove : Proc(IPolicyQualifiers*, Int32, HRESULT)
    clear : Proc(IPolicyQualifiers*, HRESULT)
  end

  IPolicyQualifiers_GUID = LibC::GUID.new("728ab31d-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IPolicyQualifiers = "728ab31d-217d-11da-b2a4-000e7bbb2b09"
  struct IPolicyQualifiers
    lpVtbl : IPolicyQualifiersVTbl*
  end

  struct ICertificatePolicyVTbl
    query_interface : Proc(ICertificatePolicy*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertificatePolicy*, UInt32)
    release : Proc(ICertificatePolicy*, UInt32)
    get_type_info_count : Proc(ICertificatePolicy*, UInt32*, HRESULT)
    get_type_info : Proc(ICertificatePolicy*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertificatePolicy*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertificatePolicy*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertificatePolicy*, IObjectId, HRESULT)
    get_object_id : Proc(ICertificatePolicy*, IObjectId*, HRESULT)
    get_policy_qualifiers : Proc(ICertificatePolicy*, IPolicyQualifiers*, HRESULT)
  end

  ICertificatePolicy_GUID = LibC::GUID.new("728ab31e-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertificatePolicy = "728ab31e-217d-11da-b2a4-000e7bbb2b09"
  struct ICertificatePolicy
    lpVtbl : ICertificatePolicyVTbl*
  end

  struct ICertificatePoliciesVTbl
    query_interface : Proc(ICertificatePolicies*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertificatePolicies*, UInt32)
    release : Proc(ICertificatePolicies*, UInt32)
    get_type_info_count : Proc(ICertificatePolicies*, UInt32*, HRESULT)
    get_type_info : Proc(ICertificatePolicies*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertificatePolicies*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertificatePolicies*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICertificatePolicies*, Int32, ICertificatePolicy*, HRESULT)
    get_count : Proc(ICertificatePolicies*, Int32*, HRESULT)
    get__new_enum : Proc(ICertificatePolicies*, IUnknown*, HRESULT)
    add : Proc(ICertificatePolicies*, ICertificatePolicy, HRESULT)
    remove : Proc(ICertificatePolicies*, Int32, HRESULT)
    clear : Proc(ICertificatePolicies*, HRESULT)
  end

  ICertificatePolicies_GUID = LibC::GUID.new("728ab31f-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertificatePolicies = "728ab31f-217d-11da-b2a4-000e7bbb2b09"
  struct ICertificatePolicies
    lpVtbl : ICertificatePoliciesVTbl*
  end

  struct IX509ExtensionCertificatePoliciesVTbl
    query_interface : Proc(IX509ExtensionCertificatePolicies*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionCertificatePolicies*, UInt32)
    release : Proc(IX509ExtensionCertificatePolicies*, UInt32)
    get_type_info_count : Proc(IX509ExtensionCertificatePolicies*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionCertificatePolicies*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionCertificatePolicies*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionCertificatePolicies*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionCertificatePolicies*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionCertificatePolicies*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionCertificatePolicies*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionCertificatePolicies*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionCertificatePolicies*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionCertificatePolicies*, ICertificatePolicies, HRESULT)
    initialize_decode : Proc(IX509ExtensionCertificatePolicies*, EncodingType, UInt8*, HRESULT)
    get_policies : Proc(IX509ExtensionCertificatePolicies*, ICertificatePolicies*, HRESULT)
  end

  IX509ExtensionCertificatePolicies_GUID = LibC::GUID.new("728ab320-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionCertificatePolicies = "728ab320-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionCertificatePolicies
    lpVtbl : IX509ExtensionCertificatePoliciesVTbl*
  end

  struct IX509ExtensionMSApplicationPoliciesVTbl
    query_interface : Proc(IX509ExtensionMSApplicationPolicies*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509ExtensionMSApplicationPolicies*, UInt32)
    release : Proc(IX509ExtensionMSApplicationPolicies*, UInt32)
    get_type_info_count : Proc(IX509ExtensionMSApplicationPolicies*, UInt32*, HRESULT)
    get_type_info : Proc(IX509ExtensionMSApplicationPolicies*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509ExtensionMSApplicationPolicies*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509ExtensionMSApplicationPolicies*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509ExtensionMSApplicationPolicies*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509ExtensionMSApplicationPolicies*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509ExtensionMSApplicationPolicies*, EncodingType, UInt8**, HRESULT)
    get_critical : Proc(IX509ExtensionMSApplicationPolicies*, Int16*, HRESULT)
    put_critical : Proc(IX509ExtensionMSApplicationPolicies*, Int16, HRESULT)
    initialize_encode : Proc(IX509ExtensionMSApplicationPolicies*, ICertificatePolicies, HRESULT)
    initialize_decode : Proc(IX509ExtensionMSApplicationPolicies*, EncodingType, UInt8*, HRESULT)
    get_policies : Proc(IX509ExtensionMSApplicationPolicies*, ICertificatePolicies*, HRESULT)
  end

  IX509ExtensionMSApplicationPolicies_GUID = LibC::GUID.new("728ab321-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509ExtensionMSApplicationPolicies = "728ab321-217d-11da-b2a4-000e7bbb2b09"
  struct IX509ExtensionMSApplicationPolicies
    lpVtbl : IX509ExtensionMSApplicationPoliciesVTbl*
  end

  struct IX509AttributeVTbl
    query_interface : Proc(IX509Attribute*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509Attribute*, UInt32)
    release : Proc(IX509Attribute*, UInt32)
    get_type_info_count : Proc(IX509Attribute*, UInt32*, HRESULT)
    get_type_info : Proc(IX509Attribute*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509Attribute*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509Attribute*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509Attribute*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509Attribute*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509Attribute*, EncodingType, UInt8**, HRESULT)
  end

  IX509Attribute_GUID = LibC::GUID.new("728ab322-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509Attribute = "728ab322-217d-11da-b2a4-000e7bbb2b09"
  struct IX509Attribute
    lpVtbl : IX509AttributeVTbl*
  end

  struct IX509AttributesVTbl
    query_interface : Proc(IX509Attributes*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509Attributes*, UInt32)
    release : Proc(IX509Attributes*, UInt32)
    get_type_info_count : Proc(IX509Attributes*, UInt32*, HRESULT)
    get_type_info : Proc(IX509Attributes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509Attributes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509Attributes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IX509Attributes*, Int32, IX509Attribute*, HRESULT)
    get_count : Proc(IX509Attributes*, Int32*, HRESULT)
    get__new_enum : Proc(IX509Attributes*, IUnknown*, HRESULT)
    add : Proc(IX509Attributes*, IX509Attribute, HRESULT)
    remove : Proc(IX509Attributes*, Int32, HRESULT)
    clear : Proc(IX509Attributes*, HRESULT)
  end

  IX509Attributes_GUID = LibC::GUID.new("728ab323-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509Attributes = "728ab323-217d-11da-b2a4-000e7bbb2b09"
  struct IX509Attributes
    lpVtbl : IX509AttributesVTbl*
  end

  struct IX509AttributeExtensionsVTbl
    query_interface : Proc(IX509AttributeExtensions*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeExtensions*, UInt32)
    release : Proc(IX509AttributeExtensions*, UInt32)
    get_type_info_count : Proc(IX509AttributeExtensions*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeExtensions*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeExtensions*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeExtensions*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeExtensions*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeExtensions*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeExtensions*, EncodingType, UInt8**, HRESULT)
    initialize_encode : Proc(IX509AttributeExtensions*, IX509Extensions, HRESULT)
    initialize_decode : Proc(IX509AttributeExtensions*, EncodingType, UInt8*, HRESULT)
    get_x509_extensions : Proc(IX509AttributeExtensions*, IX509Extensions*, HRESULT)
  end

  IX509AttributeExtensions_GUID = LibC::GUID.new("728ab324-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeExtensions = "728ab324-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeExtensions
    lpVtbl : IX509AttributeExtensionsVTbl*
  end

  struct IX509AttributeClientIdVTbl
    query_interface : Proc(IX509AttributeClientId*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeClientId*, UInt32)
    release : Proc(IX509AttributeClientId*, UInt32)
    get_type_info_count : Proc(IX509AttributeClientId*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeClientId*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeClientId*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeClientId*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeClientId*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeClientId*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeClientId*, EncodingType, UInt8**, HRESULT)
    initialize_encode : Proc(IX509AttributeClientId*, RequestClientInfoClientId, UInt8*, UInt8*, UInt8*, HRESULT)
    initialize_decode : Proc(IX509AttributeClientId*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509AttributeClientId*, RequestClientInfoClientId*, HRESULT)
    get_machine_dns_name : Proc(IX509AttributeClientId*, UInt8**, HRESULT)
    get_user_sam_name : Proc(IX509AttributeClientId*, UInt8**, HRESULT)
    get_process_name : Proc(IX509AttributeClientId*, UInt8**, HRESULT)
  end

  IX509AttributeClientId_GUID = LibC::GUID.new("728ab325-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeClientId = "728ab325-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeClientId
    lpVtbl : IX509AttributeClientIdVTbl*
  end

  struct IX509AttributeRenewalCertificateVTbl
    query_interface : Proc(IX509AttributeRenewalCertificate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeRenewalCertificate*, UInt32)
    release : Proc(IX509AttributeRenewalCertificate*, UInt32)
    get_type_info_count : Proc(IX509AttributeRenewalCertificate*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeRenewalCertificate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeRenewalCertificate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeRenewalCertificate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeRenewalCertificate*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeRenewalCertificate*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeRenewalCertificate*, EncodingType, UInt8**, HRESULT)
    initialize_encode : Proc(IX509AttributeRenewalCertificate*, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(IX509AttributeRenewalCertificate*, EncodingType, UInt8*, HRESULT)
    get_renewal_certificate : Proc(IX509AttributeRenewalCertificate*, EncodingType, UInt8**, HRESULT)
  end

  IX509AttributeRenewalCertificate_GUID = LibC::GUID.new("728ab326-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeRenewalCertificate = "728ab326-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeRenewalCertificate
    lpVtbl : IX509AttributeRenewalCertificateVTbl*
  end

  struct IX509AttributeArchiveKeyVTbl
    query_interface : Proc(IX509AttributeArchiveKey*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeArchiveKey*, UInt32)
    release : Proc(IX509AttributeArchiveKey*, UInt32)
    get_type_info_count : Proc(IX509AttributeArchiveKey*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeArchiveKey*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeArchiveKey*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeArchiveKey*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeArchiveKey*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeArchiveKey*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeArchiveKey*, EncodingType, UInt8**, HRESULT)
    initialize_encode : Proc(IX509AttributeArchiveKey*, IX509PrivateKey, EncodingType, UInt8*, IObjectId, Int32, HRESULT)
    initialize_decode : Proc(IX509AttributeArchiveKey*, EncodingType, UInt8*, HRESULT)
    get_encrypted_key_blob : Proc(IX509AttributeArchiveKey*, EncodingType, UInt8**, HRESULT)
    get_encryption_algorithm : Proc(IX509AttributeArchiveKey*, IObjectId*, HRESULT)
    get_encryption_strength : Proc(IX509AttributeArchiveKey*, Int32*, HRESULT)
  end

  IX509AttributeArchiveKey_GUID = LibC::GUID.new("728ab327-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeArchiveKey = "728ab327-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeArchiveKey
    lpVtbl : IX509AttributeArchiveKeyVTbl*
  end

  struct IX509AttributeArchiveKeyHashVTbl
    query_interface : Proc(IX509AttributeArchiveKeyHash*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeArchiveKeyHash*, UInt32)
    release : Proc(IX509AttributeArchiveKeyHash*, UInt32)
    get_type_info_count : Proc(IX509AttributeArchiveKeyHash*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeArchiveKeyHash*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeArchiveKeyHash*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeArchiveKeyHash*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeArchiveKeyHash*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeArchiveKeyHash*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeArchiveKeyHash*, EncodingType, UInt8**, HRESULT)
    initialize_encode_from_encrypted_key_blob : Proc(IX509AttributeArchiveKeyHash*, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(IX509AttributeArchiveKeyHash*, EncodingType, UInt8*, HRESULT)
    get_encrypted_key_hash_blob : Proc(IX509AttributeArchiveKeyHash*, EncodingType, UInt8**, HRESULT)
  end

  IX509AttributeArchiveKeyHash_GUID = LibC::GUID.new("728ab328-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeArchiveKeyHash = "728ab328-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeArchiveKeyHash
    lpVtbl : IX509AttributeArchiveKeyHashVTbl*
  end

  struct IX509AttributeOSVersionVTbl
    query_interface : Proc(IX509AttributeOSVersion*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeOSVersion*, UInt32)
    release : Proc(IX509AttributeOSVersion*, UInt32)
    get_type_info_count : Proc(IX509AttributeOSVersion*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeOSVersion*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeOSVersion*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeOSVersion*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeOSVersion*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeOSVersion*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeOSVersion*, EncodingType, UInt8**, HRESULT)
    initialize_encode : Proc(IX509AttributeOSVersion*, UInt8*, HRESULT)
    initialize_decode : Proc(IX509AttributeOSVersion*, EncodingType, UInt8*, HRESULT)
    get_os_version : Proc(IX509AttributeOSVersion*, UInt8**, HRESULT)
  end

  IX509AttributeOSVersion_GUID = LibC::GUID.new("728ab32a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeOSVersion = "728ab32a-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeOSVersion
    lpVtbl : IX509AttributeOSVersionVTbl*
  end

  struct IX509AttributeCspProviderVTbl
    query_interface : Proc(IX509AttributeCspProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509AttributeCspProvider*, UInt32)
    release : Proc(IX509AttributeCspProvider*, UInt32)
    get_type_info_count : Proc(IX509AttributeCspProvider*, UInt32*, HRESULT)
    get_type_info : Proc(IX509AttributeCspProvider*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509AttributeCspProvider*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509AttributeCspProvider*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509AttributeCspProvider*, IObjectId, EncodingType, UInt8*, HRESULT)
    get_object_id : Proc(IX509AttributeCspProvider*, IObjectId*, HRESULT)
    get_raw_data : Proc(IX509AttributeCspProvider*, EncodingType, UInt8**, HRESULT)
    initialize_encode : Proc(IX509AttributeCspProvider*, X509KeySpec, UInt8*, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(IX509AttributeCspProvider*, EncodingType, UInt8*, HRESULT)
    get_key_spec : Proc(IX509AttributeCspProvider*, X509KeySpec*, HRESULT)
    get_provider_name : Proc(IX509AttributeCspProvider*, UInt8**, HRESULT)
    get_signature : Proc(IX509AttributeCspProvider*, EncodingType, UInt8**, HRESULT)
  end

  IX509AttributeCspProvider_GUID = LibC::GUID.new("728ab32b-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509AttributeCspProvider = "728ab32b-217d-11da-b2a4-000e7bbb2b09"
  struct IX509AttributeCspProvider
    lpVtbl : IX509AttributeCspProviderVTbl*
  end

  struct ICryptAttributeVTbl
    query_interface : Proc(ICryptAttribute*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICryptAttribute*, UInt32)
    release : Proc(ICryptAttribute*, UInt32)
    get_type_info_count : Proc(ICryptAttribute*, UInt32*, HRESULT)
    get_type_info : Proc(ICryptAttribute*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICryptAttribute*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICryptAttribute*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_object_id : Proc(ICryptAttribute*, IObjectId, HRESULT)
    initialize_from_values : Proc(ICryptAttribute*, IX509Attributes, HRESULT)
    get_object_id : Proc(ICryptAttribute*, IObjectId*, HRESULT)
    get_values : Proc(ICryptAttribute*, IX509Attributes*, HRESULT)
  end

  ICryptAttribute_GUID = LibC::GUID.new("728ab32c-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICryptAttribute = "728ab32c-217d-11da-b2a4-000e7bbb2b09"
  struct ICryptAttribute
    lpVtbl : ICryptAttributeVTbl*
  end

  struct ICryptAttributesVTbl
    query_interface : Proc(ICryptAttributes*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICryptAttributes*, UInt32)
    release : Proc(ICryptAttributes*, UInt32)
    get_type_info_count : Proc(ICryptAttributes*, UInt32*, HRESULT)
    get_type_info : Proc(ICryptAttributes*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICryptAttributes*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICryptAttributes*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICryptAttributes*, Int32, ICryptAttribute*, HRESULT)
    get_count : Proc(ICryptAttributes*, Int32*, HRESULT)
    get__new_enum : Proc(ICryptAttributes*, IUnknown*, HRESULT)
    add : Proc(ICryptAttributes*, ICryptAttribute, HRESULT)
    remove : Proc(ICryptAttributes*, Int32, HRESULT)
    clear : Proc(ICryptAttributes*, HRESULT)
    get_index_by_object_id : Proc(ICryptAttributes*, IObjectId, Int32*, HRESULT)
    add_range : Proc(ICryptAttributes*, ICryptAttributes, HRESULT)
  end

  ICryptAttributes_GUID = LibC::GUID.new("728ab32d-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICryptAttributes = "728ab32d-217d-11da-b2a4-000e7bbb2b09"
  struct ICryptAttributes
    lpVtbl : ICryptAttributesVTbl*
  end

  struct ICertPropertyVTbl
    query_interface : Proc(ICertProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertProperty*, UInt32)
    release : Proc(ICertProperty*, UInt32)
    get_type_info_count : Proc(ICertProperty*, UInt32*, HRESULT)
    get_type_info : Proc(ICertProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertProperty*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertProperty*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertProperty*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertProperty*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertProperty*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertProperty*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertProperty*, Int16, EncodingType, UInt8*, HRESULT)
  end

  ICertProperty_GUID = LibC::GUID.new("728ab32e-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertProperty = "728ab32e-217d-11da-b2a4-000e7bbb2b09"
  struct ICertProperty
    lpVtbl : ICertPropertyVTbl*
  end

  struct ICertPropertiesVTbl
    query_interface : Proc(ICertProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertProperties*, UInt32)
    release : Proc(ICertProperties*, UInt32)
    get_type_info_count : Proc(ICertProperties*, UInt32*, HRESULT)
    get_type_info : Proc(ICertProperties*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertProperties*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertProperties*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICertProperties*, Int32, ICertProperty*, HRESULT)
    get_count : Proc(ICertProperties*, Int32*, HRESULT)
    get__new_enum : Proc(ICertProperties*, IUnknown*, HRESULT)
    add : Proc(ICertProperties*, ICertProperty, HRESULT)
    remove : Proc(ICertProperties*, Int32, HRESULT)
    clear : Proc(ICertProperties*, HRESULT)
    initialize_from_certificate : Proc(ICertProperties*, Int16, EncodingType, UInt8*, HRESULT)
  end

  ICertProperties_GUID = LibC::GUID.new("728ab32f-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertProperties = "728ab32f-217d-11da-b2a4-000e7bbb2b09"
  struct ICertProperties
    lpVtbl : ICertPropertiesVTbl*
  end

  struct ICertPropertyFriendlyNameVTbl
    query_interface : Proc(ICertPropertyFriendlyName*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyFriendlyName*, UInt32)
    release : Proc(ICertPropertyFriendlyName*, UInt32)
    get_type_info_count : Proc(ICertPropertyFriendlyName*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyFriendlyName*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyFriendlyName*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyFriendlyName*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyFriendlyName*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyFriendlyName*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyFriendlyName*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyFriendlyName*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyFriendlyName*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyFriendlyName*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyFriendlyName*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyFriendlyName*, UInt8*, HRESULT)
    get_friendly_name : Proc(ICertPropertyFriendlyName*, UInt8**, HRESULT)
  end

  ICertPropertyFriendlyName_GUID = LibC::GUID.new("728ab330-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyFriendlyName = "728ab330-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyFriendlyName
    lpVtbl : ICertPropertyFriendlyNameVTbl*
  end

  struct ICertPropertyDescriptionVTbl
    query_interface : Proc(ICertPropertyDescription*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyDescription*, UInt32)
    release : Proc(ICertPropertyDescription*, UInt32)
    get_type_info_count : Proc(ICertPropertyDescription*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyDescription*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyDescription*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyDescription*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyDescription*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyDescription*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyDescription*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyDescription*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyDescription*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyDescription*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyDescription*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyDescription*, UInt8*, HRESULT)
    get_description : Proc(ICertPropertyDescription*, UInt8**, HRESULT)
  end

  ICertPropertyDescription_GUID = LibC::GUID.new("728ab331-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyDescription = "728ab331-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyDescription
    lpVtbl : ICertPropertyDescriptionVTbl*
  end

  struct ICertPropertyAutoEnrollVTbl
    query_interface : Proc(ICertPropertyAutoEnroll*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyAutoEnroll*, UInt32)
    release : Proc(ICertPropertyAutoEnroll*, UInt32)
    get_type_info_count : Proc(ICertPropertyAutoEnroll*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyAutoEnroll*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyAutoEnroll*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyAutoEnroll*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyAutoEnroll*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyAutoEnroll*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyAutoEnroll*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyAutoEnroll*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyAutoEnroll*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyAutoEnroll*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyAutoEnroll*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyAutoEnroll*, UInt8*, HRESULT)
    get_template_name : Proc(ICertPropertyAutoEnroll*, UInt8**, HRESULT)
  end

  ICertPropertyAutoEnroll_GUID = LibC::GUID.new("728ab332-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyAutoEnroll = "728ab332-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyAutoEnroll
    lpVtbl : ICertPropertyAutoEnrollVTbl*
  end

  struct ICertPropertyRequestOriginatorVTbl
    query_interface : Proc(ICertPropertyRequestOriginator*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyRequestOriginator*, UInt32)
    release : Proc(ICertPropertyRequestOriginator*, UInt32)
    get_type_info_count : Proc(ICertPropertyRequestOriginator*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyRequestOriginator*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyRequestOriginator*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyRequestOriginator*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyRequestOriginator*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyRequestOriginator*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyRequestOriginator*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyRequestOriginator*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyRequestOriginator*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyRequestOriginator*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyRequestOriginator*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyRequestOriginator*, UInt8*, HRESULT)
    initialize_from_local_request_originator : Proc(ICertPropertyRequestOriginator*, HRESULT)
    get_request_originator : Proc(ICertPropertyRequestOriginator*, UInt8**, HRESULT)
  end

  ICertPropertyRequestOriginator_GUID = LibC::GUID.new("728ab333-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyRequestOriginator = "728ab333-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyRequestOriginator
    lpVtbl : ICertPropertyRequestOriginatorVTbl*
  end

  struct ICertPropertySHA1HashVTbl
    query_interface : Proc(ICertPropertySHA1Hash*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertySHA1Hash*, UInt32)
    release : Proc(ICertPropertySHA1Hash*, UInt32)
    get_type_info_count : Proc(ICertPropertySHA1Hash*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertySHA1Hash*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertySHA1Hash*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertySHA1Hash*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertySHA1Hash*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertySHA1Hash*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertySHA1Hash*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertySHA1Hash*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertySHA1Hash*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertySHA1Hash*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertySHA1Hash*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertySHA1Hash*, EncodingType, UInt8*, HRESULT)
    get_sha1_hash : Proc(ICertPropertySHA1Hash*, EncodingType, UInt8**, HRESULT)
  end

  ICertPropertySHA1Hash_GUID = LibC::GUID.new("728ab334-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertySHA1Hash = "728ab334-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertySHA1Hash
    lpVtbl : ICertPropertySHA1HashVTbl*
  end

  struct ICertPropertyKeyProvInfoVTbl
    query_interface : Proc(ICertPropertyKeyProvInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyKeyProvInfo*, UInt32)
    release : Proc(ICertPropertyKeyProvInfo*, UInt32)
    get_type_info_count : Proc(ICertPropertyKeyProvInfo*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyKeyProvInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyKeyProvInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyKeyProvInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyKeyProvInfo*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyKeyProvInfo*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyKeyProvInfo*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyKeyProvInfo*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyKeyProvInfo*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyKeyProvInfo*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyKeyProvInfo*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyKeyProvInfo*, IX509PrivateKey, HRESULT)
    get_private_key : Proc(ICertPropertyKeyProvInfo*, IX509PrivateKey*, HRESULT)
  end

  ICertPropertyKeyProvInfo_GUID = LibC::GUID.new("728ab336-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyKeyProvInfo = "728ab336-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyKeyProvInfo
    lpVtbl : ICertPropertyKeyProvInfoVTbl*
  end

  struct ICertPropertyArchivedVTbl
    query_interface : Proc(ICertPropertyArchived*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyArchived*, UInt32)
    release : Proc(ICertPropertyArchived*, UInt32)
    get_type_info_count : Proc(ICertPropertyArchived*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyArchived*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyArchived*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyArchived*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyArchived*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyArchived*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyArchived*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyArchived*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyArchived*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyArchived*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyArchived*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyArchived*, Int16, HRESULT)
    get_archived : Proc(ICertPropertyArchived*, Int16*, HRESULT)
  end

  ICertPropertyArchived_GUID = LibC::GUID.new("728ab337-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyArchived = "728ab337-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyArchived
    lpVtbl : ICertPropertyArchivedVTbl*
  end

  struct ICertPropertyBackedUpVTbl
    query_interface : Proc(ICertPropertyBackedUp*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyBackedUp*, UInt32)
    release : Proc(ICertPropertyBackedUp*, UInt32)
    get_type_info_count : Proc(ICertPropertyBackedUp*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyBackedUp*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyBackedUp*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyBackedUp*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyBackedUp*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyBackedUp*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyBackedUp*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyBackedUp*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyBackedUp*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyBackedUp*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyBackedUp*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_from_current_time : Proc(ICertPropertyBackedUp*, Int16, HRESULT)
    initialize : Proc(ICertPropertyBackedUp*, Int16, Float64, HRESULT)
    get_backed_up_value : Proc(ICertPropertyBackedUp*, Int16*, HRESULT)
    get_backed_up_time : Proc(ICertPropertyBackedUp*, Float64*, HRESULT)
  end

  ICertPropertyBackedUp_GUID = LibC::GUID.new("728ab338-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyBackedUp = "728ab338-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyBackedUp
    lpVtbl : ICertPropertyBackedUpVTbl*
  end

  struct ICertPropertyEnrollmentVTbl
    query_interface : Proc(ICertPropertyEnrollment*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyEnrollment*, UInt32)
    release : Proc(ICertPropertyEnrollment*, UInt32)
    get_type_info_count : Proc(ICertPropertyEnrollment*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyEnrollment*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyEnrollment*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyEnrollment*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyEnrollment*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyEnrollment*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyEnrollment*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyEnrollment*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyEnrollment*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyEnrollment*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyEnrollment*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyEnrollment*, Int32, UInt8*, UInt8*, UInt8*, HRESULT)
    get_request_id : Proc(ICertPropertyEnrollment*, Int32*, HRESULT)
    get_ca_dns_name : Proc(ICertPropertyEnrollment*, UInt8**, HRESULT)
    get_ca_name : Proc(ICertPropertyEnrollment*, UInt8**, HRESULT)
    get_friendly_name : Proc(ICertPropertyEnrollment*, UInt8**, HRESULT)
  end

  ICertPropertyEnrollment_GUID = LibC::GUID.new("728ab339-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyEnrollment = "728ab339-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyEnrollment
    lpVtbl : ICertPropertyEnrollmentVTbl*
  end

  struct ICertPropertyRenewalVTbl
    query_interface : Proc(ICertPropertyRenewal*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyRenewal*, UInt32)
    release : Proc(ICertPropertyRenewal*, UInt32)
    get_type_info_count : Proc(ICertPropertyRenewal*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyRenewal*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyRenewal*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyRenewal*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyRenewal*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyRenewal*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyRenewal*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyRenewal*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyRenewal*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyRenewal*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyRenewal*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyRenewal*, EncodingType, UInt8*, HRESULT)
    initialize_from_certificate_hash : Proc(ICertPropertyRenewal*, Int16, EncodingType, UInt8*, HRESULT)
    get_renewal : Proc(ICertPropertyRenewal*, EncodingType, UInt8**, HRESULT)
  end

  ICertPropertyRenewal_GUID = LibC::GUID.new("728ab33a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyRenewal = "728ab33a-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyRenewal
    lpVtbl : ICertPropertyRenewalVTbl*
  end

  struct ICertPropertyArchivedKeyHashVTbl
    query_interface : Proc(ICertPropertyArchivedKeyHash*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyArchivedKeyHash*, UInt32)
    release : Proc(ICertPropertyArchivedKeyHash*, UInt32)
    get_type_info_count : Proc(ICertPropertyArchivedKeyHash*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyArchivedKeyHash*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyArchivedKeyHash*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyArchivedKeyHash*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyArchivedKeyHash*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyArchivedKeyHash*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyArchivedKeyHash*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyArchivedKeyHash*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyArchivedKeyHash*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyArchivedKeyHash*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyArchivedKeyHash*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyArchivedKeyHash*, EncodingType, UInt8*, HRESULT)
    get_archived_key_hash : Proc(ICertPropertyArchivedKeyHash*, EncodingType, UInt8**, HRESULT)
  end

  ICertPropertyArchivedKeyHash_GUID = LibC::GUID.new("728ab33b-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyArchivedKeyHash = "728ab33b-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyArchivedKeyHash
    lpVtbl : ICertPropertyArchivedKeyHashVTbl*
  end

  struct ICertPropertyEnrollmentPolicyServerVTbl
    query_interface : Proc(ICertPropertyEnrollmentPolicyServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertPropertyEnrollmentPolicyServer*, UInt32)
    release : Proc(ICertPropertyEnrollmentPolicyServer*, UInt32)
    get_type_info_count : Proc(ICertPropertyEnrollmentPolicyServer*, UInt32*, HRESULT)
    get_type_info : Proc(ICertPropertyEnrollmentPolicyServer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertPropertyEnrollmentPolicyServer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertPropertyEnrollmentPolicyServer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize_from_certificate : Proc(ICertPropertyEnrollmentPolicyServer*, Int16, EncodingType, UInt8*, HRESULT)
    initialize_decode : Proc(ICertPropertyEnrollmentPolicyServer*, EncodingType, UInt8*, HRESULT)
    get_property_id : Proc(ICertPropertyEnrollmentPolicyServer*, CERTENROLL_PROPERTYID*, HRESULT)
    put_property_id : Proc(ICertPropertyEnrollmentPolicyServer*, CERTENROLL_PROPERTYID, HRESULT)
    get_raw_data : Proc(ICertPropertyEnrollmentPolicyServer*, EncodingType, UInt8**, HRESULT)
    remove_from_certificate : Proc(ICertPropertyEnrollmentPolicyServer*, Int16, EncodingType, UInt8*, HRESULT)
    set_value_on_certificate : Proc(ICertPropertyEnrollmentPolicyServer*, Int16, EncodingType, UInt8*, HRESULT)
    initialize : Proc(ICertPropertyEnrollmentPolicyServer*, EnrollmentPolicyServerPropertyFlags, X509EnrollmentAuthFlags, X509EnrollmentAuthFlags, PolicyServerUrlFlags, UInt8*, UInt8*, UInt8*, UInt8*, HRESULT)
    get_policy_server_url : Proc(ICertPropertyEnrollmentPolicyServer*, UInt8**, HRESULT)
    get_policy_server_id : Proc(ICertPropertyEnrollmentPolicyServer*, UInt8**, HRESULT)
    get_enrollment_server_url : Proc(ICertPropertyEnrollmentPolicyServer*, UInt8**, HRESULT)
    get_request_id_string : Proc(ICertPropertyEnrollmentPolicyServer*, UInt8**, HRESULT)
    get_property_flags : Proc(ICertPropertyEnrollmentPolicyServer*, EnrollmentPolicyServerPropertyFlags*, HRESULT)
    get_url_flags : Proc(ICertPropertyEnrollmentPolicyServer*, PolicyServerUrlFlags*, HRESULT)
    get_authentication : Proc(ICertPropertyEnrollmentPolicyServer*, X509EnrollmentAuthFlags*, HRESULT)
    get_enrollment_server_authentication : Proc(ICertPropertyEnrollmentPolicyServer*, X509EnrollmentAuthFlags*, HRESULT)
  end

  ICertPropertyEnrollmentPolicyServer_GUID = LibC::GUID.new("728ab34a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ICertPropertyEnrollmentPolicyServer = "728ab34a-217d-11da-b2a4-000e7bbb2b09"
  struct ICertPropertyEnrollmentPolicyServer
    lpVtbl : ICertPropertyEnrollmentPolicyServerVTbl*
  end

  struct IX509SignatureInformationVTbl
    query_interface : Proc(IX509SignatureInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509SignatureInformation*, UInt32)
    release : Proc(IX509SignatureInformation*, UInt32)
    get_type_info_count : Proc(IX509SignatureInformation*, UInt32*, HRESULT)
    get_type_info : Proc(IX509SignatureInformation*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509SignatureInformation*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509SignatureInformation*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_hash_algorithm : Proc(IX509SignatureInformation*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509SignatureInformation*, IObjectId, HRESULT)
    get_public_key_algorithm : Proc(IX509SignatureInformation*, IObjectId*, HRESULT)
    put_public_key_algorithm : Proc(IX509SignatureInformation*, IObjectId, HRESULT)
    get_parameters : Proc(IX509SignatureInformation*, EncodingType, UInt8**, HRESULT)
    put_parameters : Proc(IX509SignatureInformation*, EncodingType, UInt8*, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509SignatureInformation*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509SignatureInformation*, Int16, HRESULT)
    get_alternate_signature_algorithm_set : Proc(IX509SignatureInformation*, Int16*, HRESULT)
    get_null_signed : Proc(IX509SignatureInformation*, Int16*, HRESULT)
    put_null_signed : Proc(IX509SignatureInformation*, Int16, HRESULT)
    get_signature_algorithm : Proc(IX509SignatureInformation*, Int16, Int16, IObjectId*, HRESULT)
    set_default_values : Proc(IX509SignatureInformation*, HRESULT)
  end

  IX509SignatureInformation_GUID = LibC::GUID.new("728ab33c-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509SignatureInformation = "728ab33c-217d-11da-b2a4-000e7bbb2b09"
  struct IX509SignatureInformation
    lpVtbl : IX509SignatureInformationVTbl*
  end

  struct ISignerCertificateVTbl
    query_interface : Proc(ISignerCertificate*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISignerCertificate*, UInt32)
    release : Proc(ISignerCertificate*, UInt32)
    get_type_info_count : Proc(ISignerCertificate*, UInt32*, HRESULT)
    get_type_info : Proc(ISignerCertificate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISignerCertificate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISignerCertificate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ISignerCertificate*, Int16, X509PrivateKeyVerify, EncodingType, UInt8*, HRESULT)
    get_certificate : Proc(ISignerCertificate*, EncodingType, UInt8**, HRESULT)
    get_private_key : Proc(ISignerCertificate*, IX509PrivateKey*, HRESULT)
    get_silent : Proc(ISignerCertificate*, Int16*, HRESULT)
    put_silent : Proc(ISignerCertificate*, Int16, HRESULT)
    get_parent_window : Proc(ISignerCertificate*, Int32*, HRESULT)
    put_parent_window : Proc(ISignerCertificate*, Int32, HRESULT)
    get_ui_context_message : Proc(ISignerCertificate*, UInt8**, HRESULT)
    put_ui_context_message : Proc(ISignerCertificate*, UInt8*, HRESULT)
    put_pin : Proc(ISignerCertificate*, UInt8*, HRESULT)
    get_signature_information : Proc(ISignerCertificate*, IX509SignatureInformation*, HRESULT)
  end

  ISignerCertificate_GUID = LibC::GUID.new("728ab33d-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ISignerCertificate = "728ab33d-217d-11da-b2a4-000e7bbb2b09"
  struct ISignerCertificate
    lpVtbl : ISignerCertificateVTbl*
  end

  struct ISignerCertificatesVTbl
    query_interface : Proc(ISignerCertificates*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISignerCertificates*, UInt32)
    release : Proc(ISignerCertificates*, UInt32)
    get_type_info_count : Proc(ISignerCertificates*, UInt32*, HRESULT)
    get_type_info : Proc(ISignerCertificates*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISignerCertificates*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISignerCertificates*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ISignerCertificates*, Int32, ISignerCertificate*, HRESULT)
    get_count : Proc(ISignerCertificates*, Int32*, HRESULT)
    get__new_enum : Proc(ISignerCertificates*, IUnknown*, HRESULT)
    add : Proc(ISignerCertificates*, ISignerCertificate, HRESULT)
    remove : Proc(ISignerCertificates*, Int32, HRESULT)
    clear : Proc(ISignerCertificates*, HRESULT)
    find : Proc(ISignerCertificates*, ISignerCertificate, Int32*, HRESULT)
  end

  ISignerCertificates_GUID = LibC::GUID.new("728ab33e-217d-11da-b2a4-000e7bbb2b09")
  CLSID_ISignerCertificates = "728ab33e-217d-11da-b2a4-000e7bbb2b09"
  struct ISignerCertificates
    lpVtbl : ISignerCertificatesVTbl*
  end

  struct IX509NameValuePairVTbl
    query_interface : Proc(IX509NameValuePair*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509NameValuePair*, UInt32)
    release : Proc(IX509NameValuePair*, UInt32)
    get_type_info_count : Proc(IX509NameValuePair*, UInt32*, HRESULT)
    get_type_info : Proc(IX509NameValuePair*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509NameValuePair*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509NameValuePair*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509NameValuePair*, UInt8*, UInt8*, HRESULT)
    get_value : Proc(IX509NameValuePair*, UInt8**, HRESULT)
    get_name : Proc(IX509NameValuePair*, UInt8**, HRESULT)
  end

  IX509NameValuePair_GUID = LibC::GUID.new("728ab33f-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509NameValuePair = "728ab33f-217d-11da-b2a4-000e7bbb2b09"
  struct IX509NameValuePair
    lpVtbl : IX509NameValuePairVTbl*
  end

  struct IX509NameValuePairsVTbl
    query_interface : Proc(IX509NameValuePairs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509NameValuePairs*, UInt32)
    release : Proc(IX509NameValuePairs*, UInt32)
    get_type_info_count : Proc(IX509NameValuePairs*, UInt32*, HRESULT)
    get_type_info : Proc(IX509NameValuePairs*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509NameValuePairs*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509NameValuePairs*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IX509NameValuePairs*, Int32, IX509NameValuePair*, HRESULT)
    get_count : Proc(IX509NameValuePairs*, Int32*, HRESULT)
    get__new_enum : Proc(IX509NameValuePairs*, IUnknown*, HRESULT)
    add : Proc(IX509NameValuePairs*, IX509NameValuePair, HRESULT)
    remove : Proc(IX509NameValuePairs*, Int32, HRESULT)
    clear : Proc(IX509NameValuePairs*, HRESULT)
  end

  IX509NameValuePairs_GUID = LibC::GUID.new("728ab340-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509NameValuePairs = "728ab340-217d-11da-b2a4-000e7bbb2b09"
  struct IX509NameValuePairs
    lpVtbl : IX509NameValuePairsVTbl*
  end

  struct IX509CertificateTemplateVTbl
    query_interface : Proc(IX509CertificateTemplate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateTemplate*, UInt32)
    release : Proc(IX509CertificateTemplate*, UInt32)
    get_type_info_count : Proc(IX509CertificateTemplate*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateTemplate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateTemplate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateTemplate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_property : Proc(IX509CertificateTemplate*, EnrollmentTemplateProperty, VARIANT*, HRESULT)
  end

  IX509CertificateTemplate_GUID = LibC::GUID.new("54244a13-555a-4e22-896d-1b0e52f76406")
  CLSID_IX509CertificateTemplate = "54244a13-555a-4e22-896d-1b0e52f76406"
  struct IX509CertificateTemplate
    lpVtbl : IX509CertificateTemplateVTbl*
  end

  struct IX509CertificateTemplatesVTbl
    query_interface : Proc(IX509CertificateTemplates*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateTemplates*, UInt32)
    release : Proc(IX509CertificateTemplates*, UInt32)
    get_type_info_count : Proc(IX509CertificateTemplates*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateTemplates*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateTemplates*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateTemplates*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IX509CertificateTemplates*, Int32, IX509CertificateTemplate*, HRESULT)
    get_count : Proc(IX509CertificateTemplates*, Int32*, HRESULT)
    get__new_enum : Proc(IX509CertificateTemplates*, IUnknown*, HRESULT)
    add : Proc(IX509CertificateTemplates*, IX509CertificateTemplate, HRESULT)
    remove : Proc(IX509CertificateTemplates*, Int32, HRESULT)
    clear : Proc(IX509CertificateTemplates*, HRESULT)
    get_item_by_name : Proc(IX509CertificateTemplates*, UInt8*, IX509CertificateTemplate*, HRESULT)
    get_item_by_oid : Proc(IX509CertificateTemplates*, IObjectId, IX509CertificateTemplate*, HRESULT)
  end

  IX509CertificateTemplates_GUID = LibC::GUID.new("13b79003-2181-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateTemplates = "13b79003-2181-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateTemplates
    lpVtbl : IX509CertificateTemplatesVTbl*
  end

  struct IX509CertificateTemplateWritableVTbl
    query_interface : Proc(IX509CertificateTemplateWritable*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateTemplateWritable*, UInt32)
    release : Proc(IX509CertificateTemplateWritable*, UInt32)
    get_type_info_count : Proc(IX509CertificateTemplateWritable*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateTemplateWritable*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateTemplateWritable*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateTemplateWritable*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateTemplateWritable*, IX509CertificateTemplate, HRESULT)
    commit : Proc(IX509CertificateTemplateWritable*, CommitTemplateFlags, UInt8*, HRESULT)
    get_property : Proc(IX509CertificateTemplateWritable*, EnrollmentTemplateProperty, VARIANT*, HRESULT)
    put_property : Proc(IX509CertificateTemplateWritable*, EnrollmentTemplateProperty, VARIANT, HRESULT)
    get_template : Proc(IX509CertificateTemplateWritable*, IX509CertificateTemplate*, HRESULT)
  end

  IX509CertificateTemplateWritable_GUID = LibC::GUID.new("f49466a7-395a-4e9e-b6e7-32b331600dc0")
  CLSID_IX509CertificateTemplateWritable = "f49466a7-395a-4e9e-b6e7-32b331600dc0"
  struct IX509CertificateTemplateWritable
    lpVtbl : IX509CertificateTemplateWritableVTbl*
  end

  struct ICertificationAuthorityVTbl
    query_interface : Proc(ICertificationAuthority*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertificationAuthority*, UInt32)
    release : Proc(ICertificationAuthority*, UInt32)
    get_type_info_count : Proc(ICertificationAuthority*, UInt32*, HRESULT)
    get_type_info : Proc(ICertificationAuthority*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertificationAuthority*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertificationAuthority*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_property : Proc(ICertificationAuthority*, EnrollmentCAProperty, VARIANT*, HRESULT)
  end

  ICertificationAuthority_GUID = LibC::GUID.new("835d1f61-1e95-4bc8-b4d3-976c42b968f7")
  CLSID_ICertificationAuthority = "835d1f61-1e95-4bc8-b4d3-976c42b968f7"
  struct ICertificationAuthority
    lpVtbl : ICertificationAuthorityVTbl*
  end

  struct ICertificationAuthoritiesVTbl
    query_interface : Proc(ICertificationAuthorities*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertificationAuthorities*, UInt32)
    release : Proc(ICertificationAuthorities*, UInt32)
    get_type_info_count : Proc(ICertificationAuthorities*, UInt32*, HRESULT)
    get_type_info : Proc(ICertificationAuthorities*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertificationAuthorities*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertificationAuthorities*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(ICertificationAuthorities*, Int32, ICertificationAuthority*, HRESULT)
    get_count : Proc(ICertificationAuthorities*, Int32*, HRESULT)
    get__new_enum : Proc(ICertificationAuthorities*, IUnknown*, HRESULT)
    add : Proc(ICertificationAuthorities*, ICertificationAuthority, HRESULT)
    remove : Proc(ICertificationAuthorities*, Int32, HRESULT)
    clear : Proc(ICertificationAuthorities*, HRESULT)
    compute_site_costs : Proc(ICertificationAuthorities*, HRESULT)
    get_item_by_name : Proc(ICertificationAuthorities*, UInt8*, ICertificationAuthority*, HRESULT)
  end

  ICertificationAuthorities_GUID = LibC::GUID.new("13b79005-2181-11da-b2a4-000e7bbb2b09")
  CLSID_ICertificationAuthorities = "13b79005-2181-11da-b2a4-000e7bbb2b09"
  struct ICertificationAuthorities
    lpVtbl : ICertificationAuthoritiesVTbl*
  end

  struct IX509EnrollmentPolicyServerVTbl
    query_interface : Proc(IX509EnrollmentPolicyServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509EnrollmentPolicyServer*, UInt32)
    release : Proc(IX509EnrollmentPolicyServer*, UInt32)
    get_type_info_count : Proc(IX509EnrollmentPolicyServer*, UInt32*, HRESULT)
    get_type_info : Proc(IX509EnrollmentPolicyServer*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509EnrollmentPolicyServer*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509EnrollmentPolicyServer*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509EnrollmentPolicyServer*, UInt8*, UInt8*, X509EnrollmentAuthFlags, Int16, X509CertificateEnrollmentContext, HRESULT)
    load_policy : Proc(IX509EnrollmentPolicyServer*, X509EnrollmentPolicyLoadOption, HRESULT)
    get_templates : Proc(IX509EnrollmentPolicyServer*, IX509CertificateTemplates*, HRESULT)
    get_c_as_for_template : Proc(IX509EnrollmentPolicyServer*, IX509CertificateTemplate, ICertificationAuthorities*, HRESULT)
    get_c_as : Proc(IX509EnrollmentPolicyServer*, ICertificationAuthorities*, HRESULT)
    validate : Proc(IX509EnrollmentPolicyServer*, HRESULT)
    get_custom_oids : Proc(IX509EnrollmentPolicyServer*, IObjectIds*, HRESULT)
    get_next_update_time : Proc(IX509EnrollmentPolicyServer*, Float64*, HRESULT)
    get_last_update_time : Proc(IX509EnrollmentPolicyServer*, Float64*, HRESULT)
    get_policy_server_url : Proc(IX509EnrollmentPolicyServer*, UInt8**, HRESULT)
    get_policy_server_id : Proc(IX509EnrollmentPolicyServer*, UInt8**, HRESULT)
    get_friendly_name : Proc(IX509EnrollmentPolicyServer*, UInt8**, HRESULT)
    get_is_default_cep : Proc(IX509EnrollmentPolicyServer*, Int16*, HRESULT)
    get_use_client_id : Proc(IX509EnrollmentPolicyServer*, Int16*, HRESULT)
    get_allow_un_trusted_ca : Proc(IX509EnrollmentPolicyServer*, Int16*, HRESULT)
    get_cache_path : Proc(IX509EnrollmentPolicyServer*, UInt8**, HRESULT)
    get_cache_dir : Proc(IX509EnrollmentPolicyServer*, UInt8**, HRESULT)
    get_auth_flags : Proc(IX509EnrollmentPolicyServer*, X509EnrollmentAuthFlags*, HRESULT)
    set_credential : Proc(IX509EnrollmentPolicyServer*, Int32, X509EnrollmentAuthFlags, UInt8*, UInt8*, HRESULT)
    query_changes : Proc(IX509EnrollmentPolicyServer*, Int16*, HRESULT)
    initialize_import : Proc(IX509EnrollmentPolicyServer*, VARIANT, HRESULT)
    export : Proc(IX509EnrollmentPolicyServer*, X509EnrollmentPolicyExportFlags, VARIANT*, HRESULT)
    get_cost : Proc(IX509EnrollmentPolicyServer*, UInt32*, HRESULT)
    put_cost : Proc(IX509EnrollmentPolicyServer*, UInt32, HRESULT)
  end

  IX509EnrollmentPolicyServer_GUID = LibC::GUID.new("13b79026-2181-11da-b2a4-000e7bbb2b09")
  CLSID_IX509EnrollmentPolicyServer = "13b79026-2181-11da-b2a4-000e7bbb2b09"
  struct IX509EnrollmentPolicyServer
    lpVtbl : IX509EnrollmentPolicyServerVTbl*
  end

  struct IX509PolicyServerUrlVTbl
    query_interface : Proc(IX509PolicyServerUrl*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509PolicyServerUrl*, UInt32)
    release : Proc(IX509PolicyServerUrl*, UInt32)
    get_type_info_count : Proc(IX509PolicyServerUrl*, UInt32*, HRESULT)
    get_type_info : Proc(IX509PolicyServerUrl*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509PolicyServerUrl*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509PolicyServerUrl*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509PolicyServerUrl*, X509CertificateEnrollmentContext, HRESULT)
    get_url : Proc(IX509PolicyServerUrl*, UInt8**, HRESULT)
    put_url : Proc(IX509PolicyServerUrl*, UInt8*, HRESULT)
    get_default : Proc(IX509PolicyServerUrl*, Int16*, HRESULT)
    put_default : Proc(IX509PolicyServerUrl*, Int16, HRESULT)
    get_flags : Proc(IX509PolicyServerUrl*, PolicyServerUrlFlags*, HRESULT)
    put_flags : Proc(IX509PolicyServerUrl*, PolicyServerUrlFlags, HRESULT)
    get_auth_flags : Proc(IX509PolicyServerUrl*, X509EnrollmentAuthFlags*, HRESULT)
    put_auth_flags : Proc(IX509PolicyServerUrl*, X509EnrollmentAuthFlags, HRESULT)
    get_cost : Proc(IX509PolicyServerUrl*, UInt32*, HRESULT)
    put_cost : Proc(IX509PolicyServerUrl*, UInt32, HRESULT)
    get_string_property : Proc(IX509PolicyServerUrl*, PolicyServerUrlPropertyID, UInt8**, HRESULT)
    set_string_property : Proc(IX509PolicyServerUrl*, PolicyServerUrlPropertyID, UInt8*, HRESULT)
    update_registry : Proc(IX509PolicyServerUrl*, X509CertificateEnrollmentContext, HRESULT)
    remove_from_registry : Proc(IX509PolicyServerUrl*, X509CertificateEnrollmentContext, HRESULT)
  end

  IX509PolicyServerUrl_GUID = LibC::GUID.new("884e204a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509PolicyServerUrl = "884e204a-217d-11da-b2a4-000e7bbb2b09"
  struct IX509PolicyServerUrl
    lpVtbl : IX509PolicyServerUrlVTbl*
  end

  struct IX509PolicyServerListManagerVTbl
    query_interface : Proc(IX509PolicyServerListManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509PolicyServerListManager*, UInt32)
    release : Proc(IX509PolicyServerListManager*, UInt32)
    get_type_info_count : Proc(IX509PolicyServerListManager*, UInt32*, HRESULT)
    get_type_info : Proc(IX509PolicyServerListManager*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509PolicyServerListManager*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509PolicyServerListManager*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IX509PolicyServerListManager*, Int32, IX509PolicyServerUrl*, HRESULT)
    get_count : Proc(IX509PolicyServerListManager*, Int32*, HRESULT)
    get__new_enum : Proc(IX509PolicyServerListManager*, IUnknown*, HRESULT)
    add : Proc(IX509PolicyServerListManager*, IX509PolicyServerUrl, HRESULT)
    remove : Proc(IX509PolicyServerListManager*, Int32, HRESULT)
    clear : Proc(IX509PolicyServerListManager*, HRESULT)
    initialize : Proc(IX509PolicyServerListManager*, X509CertificateEnrollmentContext, PolicyServerUrlFlags, HRESULT)
  end

  IX509PolicyServerListManager_GUID = LibC::GUID.new("884e204b-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509PolicyServerListManager = "884e204b-217d-11da-b2a4-000e7bbb2b09"
  struct IX509PolicyServerListManager
    lpVtbl : IX509PolicyServerListManagerVTbl*
  end

  struct IX509CertificateRequestVTbl
    query_interface : Proc(IX509CertificateRequest*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequest*, UInt32)
    release : Proc(IX509CertificateRequest*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequest*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequest*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequest*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequest*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequest*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequest*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequest*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequest*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequest*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequest*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequest*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequest*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequest*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequest*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequest*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequest*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequest*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequest*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequest*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequest*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequest*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequest*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequest*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequest*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequest*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequest*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequest*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequest*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequest*, EncodingType, UInt8**, HRESULT)
  end

  IX509CertificateRequest_GUID = LibC::GUID.new("728ab341-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequest = "728ab341-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequest
    lpVtbl : IX509CertificateRequestVTbl*
  end

  struct IX509CertificateRequestPkcs10VTbl
    query_interface : Proc(IX509CertificateRequestPkcs10*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestPkcs10*, UInt32)
    release : Proc(IX509CertificateRequestPkcs10*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestPkcs10*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestPkcs10*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestPkcs10*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestPkcs10*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestPkcs10*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestPkcs10*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestPkcs10*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestPkcs10*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestPkcs10*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestPkcs10*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestPkcs10*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestPkcs10*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestPkcs10*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestPkcs10*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestPkcs10*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestPkcs10*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestPkcs10*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestPkcs10*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestPkcs10*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestPkcs10*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestPkcs10*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestPkcs10*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestPkcs10*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestPkcs10*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestPkcs10*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestPkcs10*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_private_key : Proc(IX509CertificateRequestPkcs10*, X509CertificateEnrollmentContext, IX509PrivateKey, UInt8*, HRESULT)
    initialize_from_public_key : Proc(IX509CertificateRequestPkcs10*, X509CertificateEnrollmentContext, IX509PublicKey, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestPkcs10*, X509CertificateEnrollmentContext, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestPkcs10*, UInt8*, EncodingType, HRESULT)
    check_signature : Proc(IX509CertificateRequestPkcs10*, Pkcs10AllowedSignatureTypes, HRESULT)
    is_smart_card : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestPkcs10*, IObjectId*, HRESULT)
    get_public_key : Proc(IX509CertificateRequestPkcs10*, IX509PublicKey*, HRESULT)
    get_private_key : Proc(IX509CertificateRequestPkcs10*, IX509PrivateKey*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    get_reuse_key : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    get_old_certificate : Proc(IX509CertificateRequestPkcs10*, EncodingType, UInt8**, HRESULT)
    get_subject : Proc(IX509CertificateRequestPkcs10*, IX500DistinguishedName*, HRESULT)
    put_subject : Proc(IX509CertificateRequestPkcs10*, IX500DistinguishedName, HRESULT)
    get_csp_statuses : Proc(IX509CertificateRequestPkcs10*, ICspStatuses*, HRESULT)
    get_smime_capabilities : Proc(IX509CertificateRequestPkcs10*, Int16*, HRESULT)
    put_smime_capabilities : Proc(IX509CertificateRequestPkcs10*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestPkcs10*, IX509SignatureInformation*, HRESULT)
    get_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10*, UInt8**, HRESULT)
    put_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10*, UInt8*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestPkcs10*, ICryptAttributes*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestPkcs10*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestPkcs10*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestPkcs10*, IObjectIds*, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRequestPkcs10*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRequestPkcs10*, EncodingType, UInt8**, HRESULT)
    get_csp_statuses2 : Proc(IX509CertificateRequestPkcs10*, X509KeySpec, ICspStatuses*, HRESULT)
  end

  IX509CertificateRequestPkcs10_GUID = LibC::GUID.new("728ab342-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestPkcs10 = "728ab342-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestPkcs10
    lpVtbl : IX509CertificateRequestPkcs10VTbl*
  end

  struct IX509CertificateRequestPkcs10V2VTbl
    query_interface : Proc(IX509CertificateRequestPkcs10V2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestPkcs10V2*, UInt32)
    release : Proc(IX509CertificateRequestPkcs10V2*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestPkcs10V2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestPkcs10V2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestPkcs10V2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestPkcs10V2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestPkcs10V2*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestPkcs10V2*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestPkcs10V2*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestPkcs10V2*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestPkcs10V2*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestPkcs10V2*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestPkcs10V2*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestPkcs10V2*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestPkcs10V2*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestPkcs10V2*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestPkcs10V2*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestPkcs10V2*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestPkcs10V2*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestPkcs10V2*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestPkcs10V2*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestPkcs10V2*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestPkcs10V2*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestPkcs10V2*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10V2*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestPkcs10V2*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_private_key : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, IX509PrivateKey, UInt8*, HRESULT)
    initialize_from_public_key : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, IX509PublicKey, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestPkcs10V2*, UInt8*, EncodingType, HRESULT)
    check_signature : Proc(IX509CertificateRequestPkcs10V2*, Pkcs10AllowedSignatureTypes, HRESULT)
    is_smart_card : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestPkcs10V2*, IObjectId*, HRESULT)
    get_public_key : Proc(IX509CertificateRequestPkcs10V2*, IX509PublicKey*, HRESULT)
    get_private_key : Proc(IX509CertificateRequestPkcs10V2*, IX509PrivateKey*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    get_reuse_key : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    get_old_certificate : Proc(IX509CertificateRequestPkcs10V2*, EncodingType, UInt8**, HRESULT)
    get_subject : Proc(IX509CertificateRequestPkcs10V2*, IX500DistinguishedName*, HRESULT)
    put_subject : Proc(IX509CertificateRequestPkcs10V2*, IX500DistinguishedName, HRESULT)
    get_csp_statuses : Proc(IX509CertificateRequestPkcs10V2*, ICspStatuses*, HRESULT)
    get_smime_capabilities : Proc(IX509CertificateRequestPkcs10V2*, Int16*, HRESULT)
    put_smime_capabilities : Proc(IX509CertificateRequestPkcs10V2*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestPkcs10V2*, IX509SignatureInformation*, HRESULT)
    get_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10V2*, UInt8**, HRESULT)
    put_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10V2*, UInt8*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestPkcs10V2*, ICryptAttributes*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestPkcs10V2*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestPkcs10V2*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestPkcs10V2*, IObjectIds*, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRequestPkcs10V2*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRequestPkcs10V2*, EncodingType, UInt8**, HRESULT)
    get_csp_statuses2 : Proc(IX509CertificateRequestPkcs10V2*, X509KeySpec, ICspStatuses*, HRESULT)
    initialize_from_template : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_private_key_template : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, IX509PrivateKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_public_key_template : Proc(IX509CertificateRequestPkcs10V2*, X509CertificateEnrollmentContext, IX509PublicKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    get_policy_server : Proc(IX509CertificateRequestPkcs10V2*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509CertificateRequestPkcs10V2*, IX509CertificateTemplate*, HRESULT)
  end

  IX509CertificateRequestPkcs10V2_GUID = LibC::GUID.new("728ab35b-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestPkcs10V2 = "728ab35b-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestPkcs10V2
    lpVtbl : IX509CertificateRequestPkcs10V2VTbl*
  end

  struct IX509CertificateRequestPkcs10V3VTbl
    query_interface : Proc(IX509CertificateRequestPkcs10V3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestPkcs10V3*, UInt32)
    release : Proc(IX509CertificateRequestPkcs10V3*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestPkcs10V3*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestPkcs10V3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestPkcs10V3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestPkcs10V3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestPkcs10V3*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestPkcs10V3*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestPkcs10V3*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestPkcs10V3*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestPkcs10V3*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestPkcs10V3*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestPkcs10V3*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestPkcs10V3*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestPkcs10V3*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestPkcs10V3*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestPkcs10V3*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestPkcs10V3*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestPkcs10V3*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestPkcs10V3*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestPkcs10V3*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestPkcs10V3*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10V3*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_private_key : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, IX509PrivateKey, UInt8*, HRESULT)
    initialize_from_public_key : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, IX509PublicKey, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestPkcs10V3*, UInt8*, EncodingType, HRESULT)
    check_signature : Proc(IX509CertificateRequestPkcs10V3*, Pkcs10AllowedSignatureTypes, HRESULT)
    is_smart_card : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestPkcs10V3*, IObjectId*, HRESULT)
    get_public_key : Proc(IX509CertificateRequestPkcs10V3*, IX509PublicKey*, HRESULT)
    get_private_key : Proc(IX509CertificateRequestPkcs10V3*, IX509PrivateKey*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    get_reuse_key : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    get_old_certificate : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8**, HRESULT)
    get_subject : Proc(IX509CertificateRequestPkcs10V3*, IX500DistinguishedName*, HRESULT)
    put_subject : Proc(IX509CertificateRequestPkcs10V3*, IX500DistinguishedName, HRESULT)
    get_csp_statuses : Proc(IX509CertificateRequestPkcs10V3*, ICspStatuses*, HRESULT)
    get_smime_capabilities : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    put_smime_capabilities : Proc(IX509CertificateRequestPkcs10V3*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestPkcs10V3*, IX509SignatureInformation*, HRESULT)
    get_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10V3*, UInt8**, HRESULT)
    put_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10V3*, UInt8*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestPkcs10V3*, ICryptAttributes*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestPkcs10V3*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestPkcs10V3*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestPkcs10V3*, IObjectIds*, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8**, HRESULT)
    get_csp_statuses2 : Proc(IX509CertificateRequestPkcs10V3*, X509KeySpec, ICspStatuses*, HRESULT)
    initialize_from_template : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_private_key_template : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, IX509PrivateKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_public_key_template : Proc(IX509CertificateRequestPkcs10V3*, X509CertificateEnrollmentContext, IX509PublicKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    get_policy_server : Proc(IX509CertificateRequestPkcs10V3*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509CertificateRequestPkcs10V3*, IX509CertificateTemplate*, HRESULT)
    get_attest_private_key : Proc(IX509CertificateRequestPkcs10V3*, Int16*, HRESULT)
    put_attest_private_key : Proc(IX509CertificateRequestPkcs10V3*, Int16, HRESULT)
    get_attestation_encryption_certificate : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8**, HRESULT)
    put_attestation_encryption_certificate : Proc(IX509CertificateRequestPkcs10V3*, EncodingType, UInt8*, HRESULT)
    get_encryption_algorithm : Proc(IX509CertificateRequestPkcs10V3*, IObjectId*, HRESULT)
    put_encryption_algorithm : Proc(IX509CertificateRequestPkcs10V3*, IObjectId, HRESULT)
    get_encryption_strength : Proc(IX509CertificateRequestPkcs10V3*, Int32*, HRESULT)
    put_encryption_strength : Proc(IX509CertificateRequestPkcs10V3*, Int32, HRESULT)
    get_challenge_password : Proc(IX509CertificateRequestPkcs10V3*, UInt8**, HRESULT)
    put_challenge_password : Proc(IX509CertificateRequestPkcs10V3*, UInt8*, HRESULT)
    get_name_value_pairs : Proc(IX509CertificateRequestPkcs10V3*, IX509NameValuePairs*, HRESULT)
  end

  IX509CertificateRequestPkcs10V3_GUID = LibC::GUID.new("54ea9942-3d66-4530-b76e-7c9170d3ec52")
  CLSID_IX509CertificateRequestPkcs10V3 = "54ea9942-3d66-4530-b76e-7c9170d3ec52"
  struct IX509CertificateRequestPkcs10V3
    lpVtbl : IX509CertificateRequestPkcs10V3VTbl*
  end

  struct IX509CertificateRequestPkcs10V4VTbl
    query_interface : Proc(IX509CertificateRequestPkcs10V4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestPkcs10V4*, UInt32)
    release : Proc(IX509CertificateRequestPkcs10V4*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestPkcs10V4*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestPkcs10V4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestPkcs10V4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestPkcs10V4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestPkcs10V4*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestPkcs10V4*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestPkcs10V4*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestPkcs10V4*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestPkcs10V4*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestPkcs10V4*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestPkcs10V4*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestPkcs10V4*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestPkcs10V4*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestPkcs10V4*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestPkcs10V4*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestPkcs10V4*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestPkcs10V4*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestPkcs10V4*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestPkcs10V4*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestPkcs10V4*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs10V4*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_private_key : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, IX509PrivateKey, UInt8*, HRESULT)
    initialize_from_public_key : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, IX509PublicKey, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestPkcs10V4*, UInt8*, EncodingType, HRESULT)
    check_signature : Proc(IX509CertificateRequestPkcs10V4*, Pkcs10AllowedSignatureTypes, HRESULT)
    is_smart_card : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestPkcs10V4*, IObjectId*, HRESULT)
    get_public_key : Proc(IX509CertificateRequestPkcs10V4*, IX509PublicKey*, HRESULT)
    get_private_key : Proc(IX509CertificateRequestPkcs10V4*, IX509PrivateKey*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    get_reuse_key : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    get_old_certificate : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8**, HRESULT)
    get_subject : Proc(IX509CertificateRequestPkcs10V4*, IX500DistinguishedName*, HRESULT)
    put_subject : Proc(IX509CertificateRequestPkcs10V4*, IX500DistinguishedName, HRESULT)
    get_csp_statuses : Proc(IX509CertificateRequestPkcs10V4*, ICspStatuses*, HRESULT)
    get_smime_capabilities : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    put_smime_capabilities : Proc(IX509CertificateRequestPkcs10V4*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestPkcs10V4*, IX509SignatureInformation*, HRESULT)
    get_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10V4*, UInt8**, HRESULT)
    put_key_container_name_prefix : Proc(IX509CertificateRequestPkcs10V4*, UInt8*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestPkcs10V4*, ICryptAttributes*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestPkcs10V4*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestPkcs10V4*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestPkcs10V4*, IObjectIds*, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8**, HRESULT)
    get_csp_statuses2 : Proc(IX509CertificateRequestPkcs10V4*, X509KeySpec, ICspStatuses*, HRESULT)
    initialize_from_template : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_private_key_template : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, IX509PrivateKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_public_key_template : Proc(IX509CertificateRequestPkcs10V4*, X509CertificateEnrollmentContext, IX509PublicKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    get_policy_server : Proc(IX509CertificateRequestPkcs10V4*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509CertificateRequestPkcs10V4*, IX509CertificateTemplate*, HRESULT)
    get_attest_private_key : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    put_attest_private_key : Proc(IX509CertificateRequestPkcs10V4*, Int16, HRESULT)
    get_attestation_encryption_certificate : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8**, HRESULT)
    put_attestation_encryption_certificate : Proc(IX509CertificateRequestPkcs10V4*, EncodingType, UInt8*, HRESULT)
    get_encryption_algorithm : Proc(IX509CertificateRequestPkcs10V4*, IObjectId*, HRESULT)
    put_encryption_algorithm : Proc(IX509CertificateRequestPkcs10V4*, IObjectId, HRESULT)
    get_encryption_strength : Proc(IX509CertificateRequestPkcs10V4*, Int32*, HRESULT)
    put_encryption_strength : Proc(IX509CertificateRequestPkcs10V4*, Int32, HRESULT)
    get_challenge_password : Proc(IX509CertificateRequestPkcs10V4*, UInt8**, HRESULT)
    put_challenge_password : Proc(IX509CertificateRequestPkcs10V4*, UInt8*, HRESULT)
    get_name_value_pairs : Proc(IX509CertificateRequestPkcs10V4*, IX509NameValuePairs*, HRESULT)
    get_claim_type : Proc(IX509CertificateRequestPkcs10V4*, KeyAttestationClaimType*, HRESULT)
    put_claim_type : Proc(IX509CertificateRequestPkcs10V4*, KeyAttestationClaimType, HRESULT)
    get_attest_private_key_preferred : Proc(IX509CertificateRequestPkcs10V4*, Int16*, HRESULT)
    put_attest_private_key_preferred : Proc(IX509CertificateRequestPkcs10V4*, Int16, HRESULT)
  end

  IX509CertificateRequestPkcs10V4_GUID = LibC::GUID.new("728ab363-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestPkcs10V4 = "728ab363-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestPkcs10V4
    lpVtbl : IX509CertificateRequestPkcs10V4VTbl*
  end

  struct IX509CertificateRequestCertificateVTbl
    query_interface : Proc(IX509CertificateRequestCertificate*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestCertificate*, UInt32)
    release : Proc(IX509CertificateRequestCertificate*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestCertificate*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestCertificate*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestCertificate*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestCertificate*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestCertificate*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestCertificate*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestCertificate*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestCertificate*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestCertificate*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestCertificate*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestCertificate*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestCertificate*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestCertificate*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestCertificate*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestCertificate*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestCertificate*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestCertificate*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestCertificate*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestCertificate*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestCertificate*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestCertificate*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestCertificate*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestCertificate*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestCertificate*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_private_key : Proc(IX509CertificateRequestCertificate*, X509CertificateEnrollmentContext, IX509PrivateKey, UInt8*, HRESULT)
    initialize_from_public_key : Proc(IX509CertificateRequestCertificate*, X509CertificateEnrollmentContext, IX509PublicKey, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestCertificate*, X509CertificateEnrollmentContext, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestCertificate*, UInt8*, EncodingType, HRESULT)
    check_signature : Proc(IX509CertificateRequestCertificate*, Pkcs10AllowedSignatureTypes, HRESULT)
    is_smart_card : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestCertificate*, IObjectId*, HRESULT)
    get_public_key : Proc(IX509CertificateRequestCertificate*, IX509PublicKey*, HRESULT)
    get_private_key : Proc(IX509CertificateRequestCertificate*, IX509PrivateKey*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    get_reuse_key : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    get_old_certificate : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8**, HRESULT)
    get_subject : Proc(IX509CertificateRequestCertificate*, IX500DistinguishedName*, HRESULT)
    put_subject : Proc(IX509CertificateRequestCertificate*, IX500DistinguishedName, HRESULT)
    get_csp_statuses : Proc(IX509CertificateRequestCertificate*, ICspStatuses*, HRESULT)
    get_smime_capabilities : Proc(IX509CertificateRequestCertificate*, Int16*, HRESULT)
    put_smime_capabilities : Proc(IX509CertificateRequestCertificate*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestCertificate*, IX509SignatureInformation*, HRESULT)
    get_key_container_name_prefix : Proc(IX509CertificateRequestCertificate*, UInt8**, HRESULT)
    put_key_container_name_prefix : Proc(IX509CertificateRequestCertificate*, UInt8*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestCertificate*, ICryptAttributes*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestCertificate*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestCertificate*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestCertificate*, IObjectIds*, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8**, HRESULT)
    get_csp_statuses2 : Proc(IX509CertificateRequestCertificate*, X509KeySpec, ICspStatuses*, HRESULT)
    check_public_key_signature : Proc(IX509CertificateRequestCertificate*, IX509PublicKey, HRESULT)
    get_issuer : Proc(IX509CertificateRequestCertificate*, IX500DistinguishedName*, HRESULT)
    put_issuer : Proc(IX509CertificateRequestCertificate*, IX500DistinguishedName, HRESULT)
    get_not_before : Proc(IX509CertificateRequestCertificate*, Float64*, HRESULT)
    put_not_before : Proc(IX509CertificateRequestCertificate*, Float64, HRESULT)
    get_not_after : Proc(IX509CertificateRequestCertificate*, Float64*, HRESULT)
    put_not_after : Proc(IX509CertificateRequestCertificate*, Float64, HRESULT)
    get_serial_number : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8**, HRESULT)
    put_serial_number : Proc(IX509CertificateRequestCertificate*, EncodingType, UInt8*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRequestCertificate*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRequestCertificate*, ISignerCertificate, HRESULT)
  end

  IX509CertificateRequestCertificate_GUID = LibC::GUID.new("728ab343-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestCertificate = "728ab343-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestCertificate
    lpVtbl : IX509CertificateRequestCertificateVTbl*
  end

  struct IX509CertificateRequestCertificate2VTbl
    query_interface : Proc(IX509CertificateRequestCertificate2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestCertificate2*, UInt32)
    release : Proc(IX509CertificateRequestCertificate2*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestCertificate2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestCertificate2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestCertificate2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestCertificate2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestCertificate2*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestCertificate2*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestCertificate2*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestCertificate2*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestCertificate2*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestCertificate2*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestCertificate2*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestCertificate2*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestCertificate2*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestCertificate2*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestCertificate2*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestCertificate2*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestCertificate2*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestCertificate2*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestCertificate2*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestCertificate2*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestCertificate2*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_private_key : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, IX509PrivateKey, UInt8*, HRESULT)
    initialize_from_public_key : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, IX509PublicKey, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestCertificate2*, UInt8*, EncodingType, HRESULT)
    check_signature : Proc(IX509CertificateRequestCertificate2*, Pkcs10AllowedSignatureTypes, HRESULT)
    is_smart_card : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestCertificate2*, IObjectId*, HRESULT)
    get_public_key : Proc(IX509CertificateRequestCertificate2*, IX509PublicKey*, HRESULT)
    get_private_key : Proc(IX509CertificateRequestCertificate2*, IX509PrivateKey*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    get_reuse_key : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    get_old_certificate : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8**, HRESULT)
    get_subject : Proc(IX509CertificateRequestCertificate2*, IX500DistinguishedName*, HRESULT)
    put_subject : Proc(IX509CertificateRequestCertificate2*, IX500DistinguishedName, HRESULT)
    get_csp_statuses : Proc(IX509CertificateRequestCertificate2*, ICspStatuses*, HRESULT)
    get_smime_capabilities : Proc(IX509CertificateRequestCertificate2*, Int16*, HRESULT)
    put_smime_capabilities : Proc(IX509CertificateRequestCertificate2*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestCertificate2*, IX509SignatureInformation*, HRESULT)
    get_key_container_name_prefix : Proc(IX509CertificateRequestCertificate2*, UInt8**, HRESULT)
    put_key_container_name_prefix : Proc(IX509CertificateRequestCertificate2*, UInt8*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestCertificate2*, ICryptAttributes*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestCertificate2*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestCertificate2*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestCertificate2*, IObjectIds*, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8**, HRESULT)
    get_csp_statuses2 : Proc(IX509CertificateRequestCertificate2*, X509KeySpec, ICspStatuses*, HRESULT)
    check_public_key_signature : Proc(IX509CertificateRequestCertificate2*, IX509PublicKey, HRESULT)
    get_issuer : Proc(IX509CertificateRequestCertificate2*, IX500DistinguishedName*, HRESULT)
    put_issuer : Proc(IX509CertificateRequestCertificate2*, IX500DistinguishedName, HRESULT)
    get_not_before : Proc(IX509CertificateRequestCertificate2*, Float64*, HRESULT)
    put_not_before : Proc(IX509CertificateRequestCertificate2*, Float64, HRESULT)
    get_not_after : Proc(IX509CertificateRequestCertificate2*, Float64*, HRESULT)
    put_not_after : Proc(IX509CertificateRequestCertificate2*, Float64, HRESULT)
    get_serial_number : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8**, HRESULT)
    put_serial_number : Proc(IX509CertificateRequestCertificate2*, EncodingType, UInt8*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRequestCertificate2*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRequestCertificate2*, ISignerCertificate, HRESULT)
    initialize_from_template : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_private_key_template : Proc(IX509CertificateRequestCertificate2*, X509CertificateEnrollmentContext, IX509PrivateKey, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    get_policy_server : Proc(IX509CertificateRequestCertificate2*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509CertificateRequestCertificate2*, IX509CertificateTemplate*, HRESULT)
  end

  IX509CertificateRequestCertificate2_GUID = LibC::GUID.new("728ab35a-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestCertificate2 = "728ab35a-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestCertificate2
    lpVtbl : IX509CertificateRequestCertificate2VTbl*
  end

  struct IX509CertificateRequestPkcs7VTbl
    query_interface : Proc(IX509CertificateRequestPkcs7*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestPkcs7*, UInt32)
    release : Proc(IX509CertificateRequestPkcs7*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestPkcs7*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestPkcs7*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestPkcs7*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestPkcs7*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestPkcs7*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestPkcs7*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestPkcs7*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestPkcs7*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestPkcs7*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestPkcs7*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestPkcs7*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestPkcs7*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestPkcs7*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestPkcs7*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestPkcs7*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestPkcs7*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestPkcs7*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestPkcs7*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestPkcs7*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestPkcs7*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestPkcs7*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestPkcs7*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestPkcs7*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestPkcs7*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestPkcs7*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestPkcs7*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs7*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs7*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestPkcs7*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestPkcs7*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestPkcs7*, X509CertificateEnrollmentContext, Int16, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_from_inner_request : Proc(IX509CertificateRequestPkcs7*, IX509CertificateRequest, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestPkcs7*, UInt8*, EncodingType, HRESULT)
    get_requester_name : Proc(IX509CertificateRequestPkcs7*, UInt8**, HRESULT)
    put_requester_name : Proc(IX509CertificateRequestPkcs7*, UInt8*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRequestPkcs7*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRequestPkcs7*, ISignerCertificate, HRESULT)
  end

  IX509CertificateRequestPkcs7_GUID = LibC::GUID.new("728ab344-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestPkcs7 = "728ab344-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestPkcs7
    lpVtbl : IX509CertificateRequestPkcs7VTbl*
  end

  struct IX509CertificateRequestPkcs7V2VTbl
    query_interface : Proc(IX509CertificateRequestPkcs7V2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestPkcs7V2*, UInt32)
    release : Proc(IX509CertificateRequestPkcs7V2*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestPkcs7V2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestPkcs7V2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestPkcs7V2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestPkcs7V2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestPkcs7V2*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestPkcs7V2*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestPkcs7V2*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestPkcs7V2*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestPkcs7V2*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestPkcs7V2*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestPkcs7V2*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestPkcs7V2*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestPkcs7V2*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestPkcs7V2*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestPkcs7V2*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestPkcs7V2*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestPkcs7V2*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestPkcs7V2*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestPkcs7V2*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestPkcs7V2*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestPkcs7V2*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestPkcs7V2*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestPkcs7V2*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestPkcs7V2*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestPkcs7V2*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestPkcs7V2*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs7V2*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestPkcs7V2*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestPkcs7V2*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestPkcs7V2*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestPkcs7V2*, X509CertificateEnrollmentContext, Int16, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_from_inner_request : Proc(IX509CertificateRequestPkcs7V2*, IX509CertificateRequest, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestPkcs7V2*, UInt8*, EncodingType, HRESULT)
    get_requester_name : Proc(IX509CertificateRequestPkcs7V2*, UInt8**, HRESULT)
    put_requester_name : Proc(IX509CertificateRequestPkcs7V2*, UInt8*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRequestPkcs7V2*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRequestPkcs7V2*, ISignerCertificate, HRESULT)
    initialize_from_template : Proc(IX509CertificateRequestPkcs7V2*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    get_policy_server : Proc(IX509CertificateRequestPkcs7V2*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509CertificateRequestPkcs7V2*, IX509CertificateTemplate*, HRESULT)
    check_certificate_signature : Proc(IX509CertificateRequestPkcs7V2*, Int16, HRESULT)
  end

  IX509CertificateRequestPkcs7V2_GUID = LibC::GUID.new("728ab35c-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestPkcs7V2 = "728ab35c-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestPkcs7V2
    lpVtbl : IX509CertificateRequestPkcs7V2VTbl*
  end

  struct IX509CertificateRequestCmcVTbl
    query_interface : Proc(IX509CertificateRequestCmc*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestCmc*, UInt32)
    release : Proc(IX509CertificateRequestCmc*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestCmc*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestCmc*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestCmc*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestCmc*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestCmc*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestCmc*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestCmc*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestCmc*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestCmc*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestCmc*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestCmc*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestCmc*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestCmc*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestCmc*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestCmc*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestCmc*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestCmc*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestCmc*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestCmc*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestCmc*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestCmc*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestCmc*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestCmc*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestCmc*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestCmc*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestCmc*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestCmc*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestCmc*, X509CertificateEnrollmentContext, Int16, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_from_inner_request : Proc(IX509CertificateRequestCmc*, IX509CertificateRequest, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestCmc*, UInt8*, EncodingType, HRESULT)
    get_requester_name : Proc(IX509CertificateRequestCmc*, UInt8**, HRESULT)
    put_requester_name : Proc(IX509CertificateRequestCmc*, UInt8*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRequestCmc*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRequestCmc*, ISignerCertificate, HRESULT)
    initialize_from_inner_request_template_name : Proc(IX509CertificateRequestCmc*, IX509CertificateRequest, UInt8*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestCmc*, IObjectId*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestCmc*, Int16*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestCmc*, ICryptAttributes*, HRESULT)
    get_name_value_pairs : Proc(IX509CertificateRequestCmc*, IX509NameValuePairs*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestCmc*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestCmc*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestCmc*, IObjectIds*, HRESULT)
    get_transaction_id : Proc(IX509CertificateRequestCmc*, Int32*, HRESULT)
    put_transaction_id : Proc(IX509CertificateRequestCmc*, Int32, HRESULT)
    get_sender_nonce : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8**, HRESULT)
    put_sender_nonce : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8*, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestCmc*, IX509SignatureInformation*, HRESULT)
    get_archive_private_key : Proc(IX509CertificateRequestCmc*, Int16*, HRESULT)
    put_archive_private_key : Proc(IX509CertificateRequestCmc*, Int16, HRESULT)
    get_key_archival_certificate : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8**, HRESULT)
    put_key_archival_certificate : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8*, HRESULT)
    get_encryption_algorithm : Proc(IX509CertificateRequestCmc*, IObjectId*, HRESULT)
    put_encryption_algorithm : Proc(IX509CertificateRequestCmc*, IObjectId, HRESULT)
    get_encryption_strength : Proc(IX509CertificateRequestCmc*, Int32*, HRESULT)
    put_encryption_strength : Proc(IX509CertificateRequestCmc*, Int32, HRESULT)
    get_encrypted_key_hash : Proc(IX509CertificateRequestCmc*, EncodingType, UInt8**, HRESULT)
    get_signer_certificates : Proc(IX509CertificateRequestCmc*, ISignerCertificates*, HRESULT)
  end

  IX509CertificateRequestCmc_GUID = LibC::GUID.new("728ab345-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestCmc = "728ab345-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestCmc
    lpVtbl : IX509CertificateRequestCmcVTbl*
  end

  struct IX509CertificateRequestCmc2VTbl
    query_interface : Proc(IX509CertificateRequestCmc2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRequestCmc2*, UInt32)
    release : Proc(IX509CertificateRequestCmc2*, UInt32)
    get_type_info_count : Proc(IX509CertificateRequestCmc2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRequestCmc2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRequestCmc2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRequestCmc2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRequestCmc2*, X509CertificateEnrollmentContext, HRESULT)
    encode : Proc(IX509CertificateRequestCmc2*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRequestCmc2*, HRESULT)
    get_inner_request : Proc(IX509CertificateRequestCmc2*, InnerRequestLevel, IX509CertificateRequest*, HRESULT)
    get_type : Proc(IX509CertificateRequestCmc2*, X509RequestType*, HRESULT)
    get_enrollment_context : Proc(IX509CertificateRequestCmc2*, X509CertificateEnrollmentContext*, HRESULT)
    get_silent : Proc(IX509CertificateRequestCmc2*, Int16*, HRESULT)
    put_silent : Proc(IX509CertificateRequestCmc2*, Int16, HRESULT)
    get_parent_window : Proc(IX509CertificateRequestCmc2*, Int32*, HRESULT)
    put_parent_window : Proc(IX509CertificateRequestCmc2*, Int32, HRESULT)
    get_ui_context_message : Proc(IX509CertificateRequestCmc2*, UInt8**, HRESULT)
    put_ui_context_message : Proc(IX509CertificateRequestCmc2*, UInt8*, HRESULT)
    get_suppress_defaults : Proc(IX509CertificateRequestCmc2*, Int16*, HRESULT)
    put_suppress_defaults : Proc(IX509CertificateRequestCmc2*, Int16, HRESULT)
    get_renewal_certificate : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8**, HRESULT)
    put_renewal_certificate : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8*, HRESULT)
    get_client_id : Proc(IX509CertificateRequestCmc2*, RequestClientInfoClientId*, HRESULT)
    put_client_id : Proc(IX509CertificateRequestCmc2*, RequestClientInfoClientId, HRESULT)
    get_csp_informations : Proc(IX509CertificateRequestCmc2*, ICspInformations*, HRESULT)
    put_csp_informations : Proc(IX509CertificateRequestCmc2*, ICspInformations, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRequestCmc2*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRequestCmc2*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRequestCmc2*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRequestCmc2*, Int16, HRESULT)
    get_raw_data : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8**, HRESULT)
    initialize_from_template_name : Proc(IX509CertificateRequestCmc2*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_certificate : Proc(IX509CertificateRequestCmc2*, X509CertificateEnrollmentContext, Int16, UInt8*, EncodingType, X509RequestInheritOptions, HRESULT)
    initialize_from_inner_request : Proc(IX509CertificateRequestCmc2*, IX509CertificateRequest, HRESULT)
    initialize_decode : Proc(IX509CertificateRequestCmc2*, UInt8*, EncodingType, HRESULT)
    get_requester_name : Proc(IX509CertificateRequestCmc2*, UInt8**, HRESULT)
    put_requester_name : Proc(IX509CertificateRequestCmc2*, UInt8*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRequestCmc2*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRequestCmc2*, ISignerCertificate, HRESULT)
    initialize_from_inner_request_template_name : Proc(IX509CertificateRequestCmc2*, IX509CertificateRequest, UInt8*, HRESULT)
    get_template_object_id : Proc(IX509CertificateRequestCmc2*, IObjectId*, HRESULT)
    get_null_signed : Proc(IX509CertificateRequestCmc2*, Int16*, HRESULT)
    get_crypt_attributes : Proc(IX509CertificateRequestCmc2*, ICryptAttributes*, HRESULT)
    get_name_value_pairs : Proc(IX509CertificateRequestCmc2*, IX509NameValuePairs*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRequestCmc2*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRequestCmc2*, IObjectIds*, HRESULT)
    get_suppress_oids : Proc(IX509CertificateRequestCmc2*, IObjectIds*, HRESULT)
    get_transaction_id : Proc(IX509CertificateRequestCmc2*, Int32*, HRESULT)
    put_transaction_id : Proc(IX509CertificateRequestCmc2*, Int32, HRESULT)
    get_sender_nonce : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8**, HRESULT)
    put_sender_nonce : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8*, HRESULT)
    get_signature_information : Proc(IX509CertificateRequestCmc2*, IX509SignatureInformation*, HRESULT)
    get_archive_private_key : Proc(IX509CertificateRequestCmc2*, Int16*, HRESULT)
    put_archive_private_key : Proc(IX509CertificateRequestCmc2*, Int16, HRESULT)
    get_key_archival_certificate : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8**, HRESULT)
    put_key_archival_certificate : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8*, HRESULT)
    get_encryption_algorithm : Proc(IX509CertificateRequestCmc2*, IObjectId*, HRESULT)
    put_encryption_algorithm : Proc(IX509CertificateRequestCmc2*, IObjectId, HRESULT)
    get_encryption_strength : Proc(IX509CertificateRequestCmc2*, Int32*, HRESULT)
    put_encryption_strength : Proc(IX509CertificateRequestCmc2*, Int32, HRESULT)
    get_encrypted_key_hash : Proc(IX509CertificateRequestCmc2*, EncodingType, UInt8**, HRESULT)
    get_signer_certificates : Proc(IX509CertificateRequestCmc2*, ISignerCertificates*, HRESULT)
    initialize_from_template : Proc(IX509CertificateRequestCmc2*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    initialize_from_inner_request_template : Proc(IX509CertificateRequestCmc2*, IX509CertificateRequest, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    get_policy_server : Proc(IX509CertificateRequestCmc2*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509CertificateRequestCmc2*, IX509CertificateTemplate*, HRESULT)
    check_signature : Proc(IX509CertificateRequestCmc2*, Pkcs10AllowedSignatureTypes, HRESULT)
    check_certificate_signature : Proc(IX509CertificateRequestCmc2*, ISignerCertificate, Int16, HRESULT)
  end

  IX509CertificateRequestCmc2_GUID = LibC::GUID.new("728ab35d-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRequestCmc2 = "728ab35d-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRequestCmc2
    lpVtbl : IX509CertificateRequestCmc2VTbl*
  end

  struct IX509EnrollmentVTbl
    query_interface : Proc(IX509Enrollment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509Enrollment*, UInt32)
    release : Proc(IX509Enrollment*, UInt32)
    get_type_info_count : Proc(IX509Enrollment*, UInt32*, HRESULT)
    get_type_info : Proc(IX509Enrollment*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509Enrollment*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509Enrollment*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509Enrollment*, X509CertificateEnrollmentContext, HRESULT)
    initialize_from_template_name : Proc(IX509Enrollment*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_request : Proc(IX509Enrollment*, IX509CertificateRequest, HRESULT)
    create_request : Proc(IX509Enrollment*, EncodingType, UInt8**, HRESULT)
    enroll : Proc(IX509Enrollment*, HRESULT)
    install_response : Proc(IX509Enrollment*, InstallResponseRestrictionFlags, UInt8*, EncodingType, UInt8*, HRESULT)
    create_pfx : Proc(IX509Enrollment*, UInt8*, PFXExportOptions, EncodingType, UInt8**, HRESULT)
    get_request : Proc(IX509Enrollment*, IX509CertificateRequest*, HRESULT)
    get_silent : Proc(IX509Enrollment*, Int16*, HRESULT)
    put_silent : Proc(IX509Enrollment*, Int16, HRESULT)
    get_parent_window : Proc(IX509Enrollment*, Int32*, HRESULT)
    put_parent_window : Proc(IX509Enrollment*, Int32, HRESULT)
    get_name_value_pairs : Proc(IX509Enrollment*, IX509NameValuePairs*, HRESULT)
    get_enrollment_context : Proc(IX509Enrollment*, X509CertificateEnrollmentContext*, HRESULT)
    get_status : Proc(IX509Enrollment*, IX509EnrollmentStatus*, HRESULT)
    get_certificate : Proc(IX509Enrollment*, EncodingType, UInt8**, HRESULT)
    get_response : Proc(IX509Enrollment*, EncodingType, UInt8**, HRESULT)
    get_certificate_friendly_name : Proc(IX509Enrollment*, UInt8**, HRESULT)
    put_certificate_friendly_name : Proc(IX509Enrollment*, UInt8*, HRESULT)
    get_certificate_description : Proc(IX509Enrollment*, UInt8**, HRESULT)
    put_certificate_description : Proc(IX509Enrollment*, UInt8*, HRESULT)
    get_request_id : Proc(IX509Enrollment*, Int32*, HRESULT)
    get_ca_config_string : Proc(IX509Enrollment*, UInt8**, HRESULT)
  end

  IX509Enrollment_GUID = LibC::GUID.new("728ab346-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509Enrollment = "728ab346-217d-11da-b2a4-000e7bbb2b09"
  struct IX509Enrollment
    lpVtbl : IX509EnrollmentVTbl*
  end

  struct IX509Enrollment2VTbl
    query_interface : Proc(IX509Enrollment2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509Enrollment2*, UInt32)
    release : Proc(IX509Enrollment2*, UInt32)
    get_type_info_count : Proc(IX509Enrollment2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509Enrollment2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509Enrollment2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509Enrollment2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509Enrollment2*, X509CertificateEnrollmentContext, HRESULT)
    initialize_from_template_name : Proc(IX509Enrollment2*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    initialize_from_request : Proc(IX509Enrollment2*, IX509CertificateRequest, HRESULT)
    create_request : Proc(IX509Enrollment2*, EncodingType, UInt8**, HRESULT)
    enroll : Proc(IX509Enrollment2*, HRESULT)
    install_response : Proc(IX509Enrollment2*, InstallResponseRestrictionFlags, UInt8*, EncodingType, UInt8*, HRESULT)
    create_pfx : Proc(IX509Enrollment2*, UInt8*, PFXExportOptions, EncodingType, UInt8**, HRESULT)
    get_request : Proc(IX509Enrollment2*, IX509CertificateRequest*, HRESULT)
    get_silent : Proc(IX509Enrollment2*, Int16*, HRESULT)
    put_silent : Proc(IX509Enrollment2*, Int16, HRESULT)
    get_parent_window : Proc(IX509Enrollment2*, Int32*, HRESULT)
    put_parent_window : Proc(IX509Enrollment2*, Int32, HRESULT)
    get_name_value_pairs : Proc(IX509Enrollment2*, IX509NameValuePairs*, HRESULT)
    get_enrollment_context : Proc(IX509Enrollment2*, X509CertificateEnrollmentContext*, HRESULT)
    get_status : Proc(IX509Enrollment2*, IX509EnrollmentStatus*, HRESULT)
    get_certificate : Proc(IX509Enrollment2*, EncodingType, UInt8**, HRESULT)
    get_response : Proc(IX509Enrollment2*, EncodingType, UInt8**, HRESULT)
    get_certificate_friendly_name : Proc(IX509Enrollment2*, UInt8**, HRESULT)
    put_certificate_friendly_name : Proc(IX509Enrollment2*, UInt8*, HRESULT)
    get_certificate_description : Proc(IX509Enrollment2*, UInt8**, HRESULT)
    put_certificate_description : Proc(IX509Enrollment2*, UInt8*, HRESULT)
    get_request_id : Proc(IX509Enrollment2*, Int32*, HRESULT)
    get_ca_config_string : Proc(IX509Enrollment2*, UInt8**, HRESULT)
    initialize_from_template : Proc(IX509Enrollment2*, X509CertificateEnrollmentContext, IX509EnrollmentPolicyServer, IX509CertificateTemplate, HRESULT)
    install_response2 : Proc(IX509Enrollment2*, InstallResponseRestrictionFlags, UInt8*, EncodingType, UInt8*, UInt8*, UInt8*, PolicyServerUrlFlags, X509EnrollmentAuthFlags, HRESULT)
    get_policy_server : Proc(IX509Enrollment2*, IX509EnrollmentPolicyServer*, HRESULT)
    get_template : Proc(IX509Enrollment2*, IX509CertificateTemplate*, HRESULT)
    get_request_id_string : Proc(IX509Enrollment2*, UInt8**, HRESULT)
  end

  IX509Enrollment2_GUID = LibC::GUID.new("728ab350-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509Enrollment2 = "728ab350-217d-11da-b2a4-000e7bbb2b09"
  struct IX509Enrollment2
    lpVtbl : IX509Enrollment2VTbl*
  end

  struct IX509EnrollmentHelperVTbl
    query_interface : Proc(IX509EnrollmentHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509EnrollmentHelper*, UInt32)
    release : Proc(IX509EnrollmentHelper*, UInt32)
    get_type_info_count : Proc(IX509EnrollmentHelper*, UInt32*, HRESULT)
    get_type_info : Proc(IX509EnrollmentHelper*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509EnrollmentHelper*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509EnrollmentHelper*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    add_policy_server : Proc(IX509EnrollmentHelper*, UInt8*, UInt8*, PolicyServerUrlFlags, X509EnrollmentAuthFlags, UInt8*, UInt8*, HRESULT)
    add_enrollment_server : Proc(IX509EnrollmentHelper*, UInt8*, X509EnrollmentAuthFlags, UInt8*, UInt8*, HRESULT)
    enroll : Proc(IX509EnrollmentHelper*, UInt8*, UInt8*, EncodingType, WebEnrollmentFlags, UInt8**, HRESULT)
    initialize : Proc(IX509EnrollmentHelper*, X509CertificateEnrollmentContext, HRESULT)
  end

  IX509EnrollmentHelper_GUID = LibC::GUID.new("728ab351-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509EnrollmentHelper = "728ab351-217d-11da-b2a4-000e7bbb2b09"
  struct IX509EnrollmentHelper
    lpVtbl : IX509EnrollmentHelperVTbl*
  end

  struct IX509EnrollmentWebClassFactoryVTbl
    query_interface : Proc(IX509EnrollmentWebClassFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509EnrollmentWebClassFactory*, UInt32)
    release : Proc(IX509EnrollmentWebClassFactory*, UInt32)
    get_type_info_count : Proc(IX509EnrollmentWebClassFactory*, UInt32*, HRESULT)
    get_type_info : Proc(IX509EnrollmentWebClassFactory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509EnrollmentWebClassFactory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509EnrollmentWebClassFactory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_object : Proc(IX509EnrollmentWebClassFactory*, UInt8*, IUnknown*, HRESULT)
  end

  IX509EnrollmentWebClassFactory_GUID = LibC::GUID.new("728ab349-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509EnrollmentWebClassFactory = "728ab349-217d-11da-b2a4-000e7bbb2b09"
  struct IX509EnrollmentWebClassFactory
    lpVtbl : IX509EnrollmentWebClassFactoryVTbl*
  end

  struct IX509MachineEnrollmentFactoryVTbl
    query_interface : Proc(IX509MachineEnrollmentFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509MachineEnrollmentFactory*, UInt32)
    release : Proc(IX509MachineEnrollmentFactory*, UInt32)
    get_type_info_count : Proc(IX509MachineEnrollmentFactory*, UInt32*, HRESULT)
    get_type_info : Proc(IX509MachineEnrollmentFactory*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509MachineEnrollmentFactory*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509MachineEnrollmentFactory*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_object : Proc(IX509MachineEnrollmentFactory*, UInt8*, IX509EnrollmentHelper*, HRESULT)
  end

  IX509MachineEnrollmentFactory_GUID = LibC::GUID.new("728ab352-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509MachineEnrollmentFactory = "728ab352-217d-11da-b2a4-000e7bbb2b09"
  struct IX509MachineEnrollmentFactory
    lpVtbl : IX509MachineEnrollmentFactoryVTbl*
  end

  struct IX509CertificateRevocationListEntryVTbl
    query_interface : Proc(IX509CertificateRevocationListEntry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRevocationListEntry*, UInt32)
    release : Proc(IX509CertificateRevocationListEntry*, UInt32)
    get_type_info_count : Proc(IX509CertificateRevocationListEntry*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRevocationListEntry*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRevocationListEntry*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRevocationListEntry*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRevocationListEntry*, EncodingType, UInt8*, Float64, HRESULT)
    get_serial_number : Proc(IX509CertificateRevocationListEntry*, EncodingType, UInt8**, HRESULT)
    get_revocation_date : Proc(IX509CertificateRevocationListEntry*, Float64*, HRESULT)
    get_revocation_reason : Proc(IX509CertificateRevocationListEntry*, CRLRevocationReason*, HRESULT)
    put_revocation_reason : Proc(IX509CertificateRevocationListEntry*, CRLRevocationReason, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRevocationListEntry*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRevocationListEntry*, IObjectIds*, HRESULT)
  end

  IX509CertificateRevocationListEntry_GUID = LibC::GUID.new("728ab35e-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRevocationListEntry = "728ab35e-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRevocationListEntry
    lpVtbl : IX509CertificateRevocationListEntryVTbl*
  end

  struct IX509CertificateRevocationListEntriesVTbl
    query_interface : Proc(IX509CertificateRevocationListEntries*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRevocationListEntries*, UInt32)
    release : Proc(IX509CertificateRevocationListEntries*, UInt32)
    get_type_info_count : Proc(IX509CertificateRevocationListEntries*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRevocationListEntries*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRevocationListEntries*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRevocationListEntries*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item_by_index : Proc(IX509CertificateRevocationListEntries*, Int32, IX509CertificateRevocationListEntry*, HRESULT)
    get_count : Proc(IX509CertificateRevocationListEntries*, Int32*, HRESULT)
    get__new_enum : Proc(IX509CertificateRevocationListEntries*, IUnknown*, HRESULT)
    add : Proc(IX509CertificateRevocationListEntries*, IX509CertificateRevocationListEntry, HRESULT)
    remove : Proc(IX509CertificateRevocationListEntries*, Int32, HRESULT)
    clear : Proc(IX509CertificateRevocationListEntries*, HRESULT)
    get_index_by_serial_number : Proc(IX509CertificateRevocationListEntries*, EncodingType, UInt8*, Int32*, HRESULT)
    add_range : Proc(IX509CertificateRevocationListEntries*, IX509CertificateRevocationListEntries, HRESULT)
  end

  IX509CertificateRevocationListEntries_GUID = LibC::GUID.new("728ab35f-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRevocationListEntries = "728ab35f-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRevocationListEntries
    lpVtbl : IX509CertificateRevocationListEntriesVTbl*
  end

  struct IX509CertificateRevocationListVTbl
    query_interface : Proc(IX509CertificateRevocationList*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509CertificateRevocationList*, UInt32)
    release : Proc(IX509CertificateRevocationList*, UInt32)
    get_type_info_count : Proc(IX509CertificateRevocationList*, UInt32*, HRESULT)
    get_type_info : Proc(IX509CertificateRevocationList*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509CertificateRevocationList*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509CertificateRevocationList*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509CertificateRevocationList*, HRESULT)
    initialize_decode : Proc(IX509CertificateRevocationList*, UInt8*, EncodingType, HRESULT)
    encode : Proc(IX509CertificateRevocationList*, HRESULT)
    reset_for_encode : Proc(IX509CertificateRevocationList*, HRESULT)
    check_public_key_signature : Proc(IX509CertificateRevocationList*, IX509PublicKey, HRESULT)
    check_signature : Proc(IX509CertificateRevocationList*, HRESULT)
    get_issuer : Proc(IX509CertificateRevocationList*, IX500DistinguishedName*, HRESULT)
    put_issuer : Proc(IX509CertificateRevocationList*, IX500DistinguishedName, HRESULT)
    get_this_update : Proc(IX509CertificateRevocationList*, Float64*, HRESULT)
    put_this_update : Proc(IX509CertificateRevocationList*, Float64, HRESULT)
    get_next_update : Proc(IX509CertificateRevocationList*, Float64*, HRESULT)
    put_next_update : Proc(IX509CertificateRevocationList*, Float64, HRESULT)
    get_x509_crl_entries : Proc(IX509CertificateRevocationList*, IX509CertificateRevocationListEntries*, HRESULT)
    get_x509_extensions : Proc(IX509CertificateRevocationList*, IX509Extensions*, HRESULT)
    get_critical_extensions : Proc(IX509CertificateRevocationList*, IObjectIds*, HRESULT)
    get_signer_certificate : Proc(IX509CertificateRevocationList*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509CertificateRevocationList*, ISignerCertificate, HRESULT)
    get_crl_number : Proc(IX509CertificateRevocationList*, EncodingType, UInt8**, HRESULT)
    put_crl_number : Proc(IX509CertificateRevocationList*, EncodingType, UInt8*, HRESULT)
    get_ca_version : Proc(IX509CertificateRevocationList*, Int32*, HRESULT)
    put_ca_version : Proc(IX509CertificateRevocationList*, Int32, HRESULT)
    get_base_crl : Proc(IX509CertificateRevocationList*, Int16*, HRESULT)
    get_null_signed : Proc(IX509CertificateRevocationList*, Int16*, HRESULT)
    get_hash_algorithm : Proc(IX509CertificateRevocationList*, IObjectId*, HRESULT)
    put_hash_algorithm : Proc(IX509CertificateRevocationList*, IObjectId, HRESULT)
    get_alternate_signature_algorithm : Proc(IX509CertificateRevocationList*, Int16*, HRESULT)
    put_alternate_signature_algorithm : Proc(IX509CertificateRevocationList*, Int16, HRESULT)
    get_signature_information : Proc(IX509CertificateRevocationList*, IX509SignatureInformation*, HRESULT)
    get_raw_data : Proc(IX509CertificateRevocationList*, EncodingType, UInt8**, HRESULT)
    get_raw_data_to_be_signed : Proc(IX509CertificateRevocationList*, EncodingType, UInt8**, HRESULT)
    get_signature : Proc(IX509CertificateRevocationList*, EncodingType, UInt8**, HRESULT)
  end

  IX509CertificateRevocationList_GUID = LibC::GUID.new("728ab360-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509CertificateRevocationList = "728ab360-217d-11da-b2a4-000e7bbb2b09"
  struct IX509CertificateRevocationList
    lpVtbl : IX509CertificateRevocationListVTbl*
  end

  struct ICertificateAttestationChallengeVTbl
    query_interface : Proc(ICertificateAttestationChallenge*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertificateAttestationChallenge*, UInt32)
    release : Proc(ICertificateAttestationChallenge*, UInt32)
    get_type_info_count : Proc(ICertificateAttestationChallenge*, UInt32*, HRESULT)
    get_type_info : Proc(ICertificateAttestationChallenge*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertificateAttestationChallenge*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertificateAttestationChallenge*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertificateAttestationChallenge*, EncodingType, UInt8*, HRESULT)
    decrypt_challenge : Proc(ICertificateAttestationChallenge*, EncodingType, UInt8**, HRESULT)
    get_request_id : Proc(ICertificateAttestationChallenge*, UInt8**, HRESULT)
  end

  ICertificateAttestationChallenge_GUID = LibC::GUID.new("6f175a7c-4a3a-40ae-9dba-592fd6bbf9b8")
  CLSID_ICertificateAttestationChallenge = "6f175a7c-4a3a-40ae-9dba-592fd6bbf9b8"
  struct ICertificateAttestationChallenge
    lpVtbl : ICertificateAttestationChallengeVTbl*
  end

  struct ICertificateAttestationChallenge2VTbl
    query_interface : Proc(ICertificateAttestationChallenge2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertificateAttestationChallenge2*, UInt32)
    release : Proc(ICertificateAttestationChallenge2*, UInt32)
    get_type_info_count : Proc(ICertificateAttestationChallenge2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertificateAttestationChallenge2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertificateAttestationChallenge2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertificateAttestationChallenge2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertificateAttestationChallenge2*, EncodingType, UInt8*, HRESULT)
    decrypt_challenge : Proc(ICertificateAttestationChallenge2*, EncodingType, UInt8**, HRESULT)
    get_request_id : Proc(ICertificateAttestationChallenge2*, UInt8**, HRESULT)
    put_key_container_name : Proc(ICertificateAttestationChallenge2*, UInt8*, HRESULT)
    put_key_blob : Proc(ICertificateAttestationChallenge2*, EncodingType, UInt8*, HRESULT)
  end

  ICertificateAttestationChallenge2_GUID = LibC::GUID.new("4631334d-e266-47d6-bd79-be53cb2e2753")
  CLSID_ICertificateAttestationChallenge2 = "4631334d-e266-47d6-bd79-be53cb2e2753"
  struct ICertificateAttestationChallenge2
    lpVtbl : ICertificateAttestationChallenge2VTbl*
  end

  struct IX509SCEPEnrollmentVTbl
    query_interface : Proc(IX509SCEPEnrollment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509SCEPEnrollment*, UInt32)
    release : Proc(IX509SCEPEnrollment*, UInt32)
    get_type_info_count : Proc(IX509SCEPEnrollment*, UInt32*, HRESULT)
    get_type_info : Proc(IX509SCEPEnrollment*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509SCEPEnrollment*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509SCEPEnrollment*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509SCEPEnrollment*, IX509CertificateRequestPkcs10, UInt8*, EncodingType, UInt8*, EncodingType, HRESULT)
    initialize_for_pending : Proc(IX509SCEPEnrollment*, X509CertificateEnrollmentContext, HRESULT)
    create_request_message : Proc(IX509SCEPEnrollment*, EncodingType, UInt8**, HRESULT)
    create_retrieve_pending_message : Proc(IX509SCEPEnrollment*, EncodingType, UInt8**, HRESULT)
    create_retrieve_certificate_message : Proc(IX509SCEPEnrollment*, X509CertificateEnrollmentContext, UInt8*, EncodingType, UInt8*, EncodingType, EncodingType, UInt8**, HRESULT)
    process_response_message : Proc(IX509SCEPEnrollment*, UInt8*, EncodingType, X509SCEPDisposition*, HRESULT)
    put_server_capabilities : Proc(IX509SCEPEnrollment*, UInt8*, HRESULT)
    get_fail_info : Proc(IX509SCEPEnrollment*, X509SCEPFailInfo*, HRESULT)
    get_signer_certificate : Proc(IX509SCEPEnrollment*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509SCEPEnrollment*, ISignerCertificate, HRESULT)
    get_old_certificate : Proc(IX509SCEPEnrollment*, ISignerCertificate*, HRESULT)
    put_old_certificate : Proc(IX509SCEPEnrollment*, ISignerCertificate, HRESULT)
    get_transaction_id : Proc(IX509SCEPEnrollment*, EncodingType, UInt8**, HRESULT)
    put_transaction_id : Proc(IX509SCEPEnrollment*, EncodingType, UInt8*, HRESULT)
    get_request : Proc(IX509SCEPEnrollment*, IX509CertificateRequestPkcs10*, HRESULT)
    get_certificate_friendly_name : Proc(IX509SCEPEnrollment*, UInt8**, HRESULT)
    put_certificate_friendly_name : Proc(IX509SCEPEnrollment*, UInt8*, HRESULT)
    get_status : Proc(IX509SCEPEnrollment*, IX509EnrollmentStatus*, HRESULT)
    get_certificate : Proc(IX509SCEPEnrollment*, EncodingType, UInt8**, HRESULT)
    get_silent : Proc(IX509SCEPEnrollment*, Int16*, HRESULT)
    put_silent : Proc(IX509SCEPEnrollment*, Int16, HRESULT)
    delete_request : Proc(IX509SCEPEnrollment*, HRESULT)
  end

  IX509SCEPEnrollment_GUID = LibC::GUID.new("728ab361-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509SCEPEnrollment = "728ab361-217d-11da-b2a4-000e7bbb2b09"
  struct IX509SCEPEnrollment
    lpVtbl : IX509SCEPEnrollmentVTbl*
  end

  struct IX509SCEPEnrollment2VTbl
    query_interface : Proc(IX509SCEPEnrollment2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509SCEPEnrollment2*, UInt32)
    release : Proc(IX509SCEPEnrollment2*, UInt32)
    get_type_info_count : Proc(IX509SCEPEnrollment2*, UInt32*, HRESULT)
    get_type_info : Proc(IX509SCEPEnrollment2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509SCEPEnrollment2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509SCEPEnrollment2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509SCEPEnrollment2*, IX509CertificateRequestPkcs10, UInt8*, EncodingType, UInt8*, EncodingType, HRESULT)
    initialize_for_pending : Proc(IX509SCEPEnrollment2*, X509CertificateEnrollmentContext, HRESULT)
    create_request_message : Proc(IX509SCEPEnrollment2*, EncodingType, UInt8**, HRESULT)
    create_retrieve_pending_message : Proc(IX509SCEPEnrollment2*, EncodingType, UInt8**, HRESULT)
    create_retrieve_certificate_message : Proc(IX509SCEPEnrollment2*, X509CertificateEnrollmentContext, UInt8*, EncodingType, UInt8*, EncodingType, EncodingType, UInt8**, HRESULT)
    process_response_message : Proc(IX509SCEPEnrollment2*, UInt8*, EncodingType, X509SCEPDisposition*, HRESULT)
    put_server_capabilities : Proc(IX509SCEPEnrollment2*, UInt8*, HRESULT)
    get_fail_info : Proc(IX509SCEPEnrollment2*, X509SCEPFailInfo*, HRESULT)
    get_signer_certificate : Proc(IX509SCEPEnrollment2*, ISignerCertificate*, HRESULT)
    put_signer_certificate : Proc(IX509SCEPEnrollment2*, ISignerCertificate, HRESULT)
    get_old_certificate : Proc(IX509SCEPEnrollment2*, ISignerCertificate*, HRESULT)
    put_old_certificate : Proc(IX509SCEPEnrollment2*, ISignerCertificate, HRESULT)
    get_transaction_id : Proc(IX509SCEPEnrollment2*, EncodingType, UInt8**, HRESULT)
    put_transaction_id : Proc(IX509SCEPEnrollment2*, EncodingType, UInt8*, HRESULT)
    get_request : Proc(IX509SCEPEnrollment2*, IX509CertificateRequestPkcs10*, HRESULT)
    get_certificate_friendly_name : Proc(IX509SCEPEnrollment2*, UInt8**, HRESULT)
    put_certificate_friendly_name : Proc(IX509SCEPEnrollment2*, UInt8*, HRESULT)
    get_status : Proc(IX509SCEPEnrollment2*, IX509EnrollmentStatus*, HRESULT)
    get_certificate : Proc(IX509SCEPEnrollment2*, EncodingType, UInt8**, HRESULT)
    get_silent : Proc(IX509SCEPEnrollment2*, Int16*, HRESULT)
    put_silent : Proc(IX509SCEPEnrollment2*, Int16, HRESULT)
    delete_request : Proc(IX509SCEPEnrollment2*, HRESULT)
    create_challenge_answer_message : Proc(IX509SCEPEnrollment2*, EncodingType, UInt8**, HRESULT)
    process_response_message2 : Proc(IX509SCEPEnrollment2*, X509SCEPProcessMessageFlags, UInt8*, EncodingType, X509SCEPDisposition*, HRESULT)
    get_result_message_text : Proc(IX509SCEPEnrollment2*, UInt8**, HRESULT)
    get_delay_retry : Proc(IX509SCEPEnrollment2*, DelayRetryAction*, HRESULT)
    get_activity_id : Proc(IX509SCEPEnrollment2*, UInt8**, HRESULT)
    put_activity_id : Proc(IX509SCEPEnrollment2*, UInt8*, HRESULT)
  end

  IX509SCEPEnrollment2_GUID = LibC::GUID.new("728ab364-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509SCEPEnrollment2 = "728ab364-217d-11da-b2a4-000e7bbb2b09"
  struct IX509SCEPEnrollment2
    lpVtbl : IX509SCEPEnrollment2VTbl*
  end

  struct IX509SCEPEnrollmentHelperVTbl
    query_interface : Proc(IX509SCEPEnrollmentHelper*, Guid*, Void**, HRESULT)
    add_ref : Proc(IX509SCEPEnrollmentHelper*, UInt32)
    release : Proc(IX509SCEPEnrollmentHelper*, UInt32)
    get_type_info_count : Proc(IX509SCEPEnrollmentHelper*, UInt32*, HRESULT)
    get_type_info : Proc(IX509SCEPEnrollmentHelper*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IX509SCEPEnrollmentHelper*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IX509SCEPEnrollmentHelper*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(IX509SCEPEnrollmentHelper*, UInt8*, UInt8*, IX509CertificateRequestPkcs10, UInt8*, HRESULT)
    initialize_for_pending : Proc(IX509SCEPEnrollmentHelper*, UInt8*, UInt8*, X509CertificateEnrollmentContext, UInt8*, HRESULT)
    enroll : Proc(IX509SCEPEnrollmentHelper*, X509SCEPProcessMessageFlags, X509SCEPDisposition*, HRESULT)
    fetch_pending : Proc(IX509SCEPEnrollmentHelper*, X509SCEPProcessMessageFlags, X509SCEPDisposition*, HRESULT)
    get_x509_scep_enrollment : Proc(IX509SCEPEnrollmentHelper*, IX509SCEPEnrollment*, HRESULT)
    get_result_message_text : Proc(IX509SCEPEnrollmentHelper*, UInt8**, HRESULT)
  end

  IX509SCEPEnrollmentHelper_GUID = LibC::GUID.new("728ab365-217d-11da-b2a4-000e7bbb2b09")
  CLSID_IX509SCEPEnrollmentHelper = "728ab365-217d-11da-b2a4-000e7bbb2b09"
  struct IX509SCEPEnrollmentHelper
    lpVtbl : IX509SCEPEnrollmentHelperVTbl*
  end

  struct ICertEncodeStringArrayVTbl
    query_interface : Proc(ICertEncodeStringArray*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeStringArray*, UInt32)
    release : Proc(ICertEncodeStringArray*, UInt32)
    get_type_info_count : Proc(ICertEncodeStringArray*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeStringArray*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeStringArray*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeStringArray*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeStringArray*, UInt8*, HRESULT)
    get_string_type : Proc(ICertEncodeStringArray*, Int32*, HRESULT)
    get_count : Proc(ICertEncodeStringArray*, Int32*, HRESULT)
    get_value : Proc(ICertEncodeStringArray*, Int32, UInt8**, HRESULT)
    reset : Proc(ICertEncodeStringArray*, Int32, CERT_RDN_ATTR_VALUE_TYPE, HRESULT)
    set_value : Proc(ICertEncodeStringArray*, Int32, UInt8*, HRESULT)
    encode : Proc(ICertEncodeStringArray*, UInt8**, HRESULT)
  end

  ICertEncodeStringArray_GUID = LibC::GUID.new("12a88820-7494-11d0-8816-00a0c903b83c")
  CLSID_ICertEncodeStringArray = "12a88820-7494-11d0-8816-00a0c903b83c"
  struct ICertEncodeStringArray
    lpVtbl : ICertEncodeStringArrayVTbl*
  end

  struct ICertEncodeStringArray2VTbl
    query_interface : Proc(ICertEncodeStringArray2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeStringArray2*, UInt32)
    release : Proc(ICertEncodeStringArray2*, UInt32)
    get_type_info_count : Proc(ICertEncodeStringArray2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeStringArray2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeStringArray2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeStringArray2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeStringArray2*, UInt8*, HRESULT)
    get_string_type : Proc(ICertEncodeStringArray2*, Int32*, HRESULT)
    get_count : Proc(ICertEncodeStringArray2*, Int32*, HRESULT)
    get_value : Proc(ICertEncodeStringArray2*, Int32, UInt8**, HRESULT)
    reset : Proc(ICertEncodeStringArray2*, Int32, CERT_RDN_ATTR_VALUE_TYPE, HRESULT)
    set_value : Proc(ICertEncodeStringArray2*, Int32, UInt8*, HRESULT)
    encode : Proc(ICertEncodeStringArray2*, UInt8**, HRESULT)
    decode_blob : Proc(ICertEncodeStringArray2*, UInt8*, EncodingType, HRESULT)
    encode_blob : Proc(ICertEncodeStringArray2*, EncodingType, UInt8**, HRESULT)
  end

  ICertEncodeStringArray2_GUID = LibC::GUID.new("9c680d93-9b7d-4e95-9018-4ffe10ba5ada")
  CLSID_ICertEncodeStringArray2 = "9c680d93-9b7d-4e95-9018-4ffe10ba5ada"
  struct ICertEncodeStringArray2
    lpVtbl : ICertEncodeStringArray2VTbl*
  end

  struct ICertEncodeLongArrayVTbl
    query_interface : Proc(ICertEncodeLongArray*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeLongArray*, UInt32)
    release : Proc(ICertEncodeLongArray*, UInt32)
    get_type_info_count : Proc(ICertEncodeLongArray*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeLongArray*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeLongArray*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeLongArray*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeLongArray*, UInt8*, HRESULT)
    get_count : Proc(ICertEncodeLongArray*, Int32*, HRESULT)
    get_value : Proc(ICertEncodeLongArray*, Int32, Int32*, HRESULT)
    reset : Proc(ICertEncodeLongArray*, Int32, HRESULT)
    set_value : Proc(ICertEncodeLongArray*, Int32, Int32, HRESULT)
    encode : Proc(ICertEncodeLongArray*, UInt8**, HRESULT)
  end

  ICertEncodeLongArray_GUID = LibC::GUID.new("15e2f230-a0a2-11d0-8821-00a0c903b83c")
  CLSID_ICertEncodeLongArray = "15e2f230-a0a2-11d0-8821-00a0c903b83c"
  struct ICertEncodeLongArray
    lpVtbl : ICertEncodeLongArrayVTbl*
  end

  struct ICertEncodeLongArray2VTbl
    query_interface : Proc(ICertEncodeLongArray2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeLongArray2*, UInt32)
    release : Proc(ICertEncodeLongArray2*, UInt32)
    get_type_info_count : Proc(ICertEncodeLongArray2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeLongArray2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeLongArray2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeLongArray2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeLongArray2*, UInt8*, HRESULT)
    get_count : Proc(ICertEncodeLongArray2*, Int32*, HRESULT)
    get_value : Proc(ICertEncodeLongArray2*, Int32, Int32*, HRESULT)
    reset : Proc(ICertEncodeLongArray2*, Int32, HRESULT)
    set_value : Proc(ICertEncodeLongArray2*, Int32, Int32, HRESULT)
    encode : Proc(ICertEncodeLongArray2*, UInt8**, HRESULT)
    decode_blob : Proc(ICertEncodeLongArray2*, UInt8*, EncodingType, HRESULT)
    encode_blob : Proc(ICertEncodeLongArray2*, EncodingType, UInt8**, HRESULT)
  end

  ICertEncodeLongArray2_GUID = LibC::GUID.new("4efde84a-bd9b-4fc2-a108-c347d478840f")
  CLSID_ICertEncodeLongArray2 = "4efde84a-bd9b-4fc2-a108-c347d478840f"
  struct ICertEncodeLongArray2
    lpVtbl : ICertEncodeLongArray2VTbl*
  end

  struct ICertEncodeDateArrayVTbl
    query_interface : Proc(ICertEncodeDateArray*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeDateArray*, UInt32)
    release : Proc(ICertEncodeDateArray*, UInt32)
    get_type_info_count : Proc(ICertEncodeDateArray*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeDateArray*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeDateArray*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeDateArray*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeDateArray*, UInt8*, HRESULT)
    get_count : Proc(ICertEncodeDateArray*, Int32*, HRESULT)
    get_value : Proc(ICertEncodeDateArray*, Int32, Float64*, HRESULT)
    reset : Proc(ICertEncodeDateArray*, Int32, HRESULT)
    set_value : Proc(ICertEncodeDateArray*, Int32, Float64, HRESULT)
    encode : Proc(ICertEncodeDateArray*, UInt8**, HRESULT)
  end

  ICertEncodeDateArray_GUID = LibC::GUID.new("2f9469a0-a470-11d0-8821-00a0c903b83c")
  CLSID_ICertEncodeDateArray = "2f9469a0-a470-11d0-8821-00a0c903b83c"
  struct ICertEncodeDateArray
    lpVtbl : ICertEncodeDateArrayVTbl*
  end

  struct ICertEncodeDateArray2VTbl
    query_interface : Proc(ICertEncodeDateArray2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeDateArray2*, UInt32)
    release : Proc(ICertEncodeDateArray2*, UInt32)
    get_type_info_count : Proc(ICertEncodeDateArray2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeDateArray2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeDateArray2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeDateArray2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeDateArray2*, UInt8*, HRESULT)
    get_count : Proc(ICertEncodeDateArray2*, Int32*, HRESULT)
    get_value : Proc(ICertEncodeDateArray2*, Int32, Float64*, HRESULT)
    reset : Proc(ICertEncodeDateArray2*, Int32, HRESULT)
    set_value : Proc(ICertEncodeDateArray2*, Int32, Float64, HRESULT)
    encode : Proc(ICertEncodeDateArray2*, UInt8**, HRESULT)
    decode_blob : Proc(ICertEncodeDateArray2*, UInt8*, EncodingType, HRESULT)
    encode_blob : Proc(ICertEncodeDateArray2*, EncodingType, UInt8**, HRESULT)
  end

  ICertEncodeDateArray2_GUID = LibC::GUID.new("99a4edb5-2b8e-448d-bf95-bba8d7789dc8")
  CLSID_ICertEncodeDateArray2 = "99a4edb5-2b8e-448d-bf95-bba8d7789dc8"
  struct ICertEncodeDateArray2
    lpVtbl : ICertEncodeDateArray2VTbl*
  end

  struct ICertEncodeCRLDistInfoVTbl
    query_interface : Proc(ICertEncodeCRLDistInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeCRLDistInfo*, UInt32)
    release : Proc(ICertEncodeCRLDistInfo*, UInt32)
    get_type_info_count : Proc(ICertEncodeCRLDistInfo*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeCRLDistInfo*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeCRLDistInfo*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeCRLDistInfo*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeCRLDistInfo*, UInt8*, HRESULT)
    get_dist_point_count : Proc(ICertEncodeCRLDistInfo*, Int32*, HRESULT)
    get_name_count : Proc(ICertEncodeCRLDistInfo*, Int32, Int32*, HRESULT)
    get_name_choice : Proc(ICertEncodeCRLDistInfo*, Int32, Int32, Int32*, HRESULT)
    get_name : Proc(ICertEncodeCRLDistInfo*, Int32, Int32, UInt8**, HRESULT)
    reset : Proc(ICertEncodeCRLDistInfo*, Int32, HRESULT)
    set_name_count : Proc(ICertEncodeCRLDistInfo*, Int32, Int32, HRESULT)
    set_name_entry : Proc(ICertEncodeCRLDistInfo*, Int32, Int32, CERT_ALT_NAME, UInt8*, HRESULT)
    encode : Proc(ICertEncodeCRLDistInfo*, UInt8**, HRESULT)
  end

  ICertEncodeCRLDistInfo_GUID = LibC::GUID.new("01958640-bbff-11d0-8825-00a0c903b83c")
  CLSID_ICertEncodeCRLDistInfo = "01958640-bbff-11d0-8825-00a0c903b83c"
  struct ICertEncodeCRLDistInfo
    lpVtbl : ICertEncodeCRLDistInfoVTbl*
  end

  struct ICertEncodeCRLDistInfo2VTbl
    query_interface : Proc(ICertEncodeCRLDistInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeCRLDistInfo2*, UInt32)
    release : Proc(ICertEncodeCRLDistInfo2*, UInt32)
    get_type_info_count : Proc(ICertEncodeCRLDistInfo2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeCRLDistInfo2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeCRLDistInfo2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeCRLDistInfo2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeCRLDistInfo2*, UInt8*, HRESULT)
    get_dist_point_count : Proc(ICertEncodeCRLDistInfo2*, Int32*, HRESULT)
    get_name_count : Proc(ICertEncodeCRLDistInfo2*, Int32, Int32*, HRESULT)
    get_name_choice : Proc(ICertEncodeCRLDistInfo2*, Int32, Int32, Int32*, HRESULT)
    get_name : Proc(ICertEncodeCRLDistInfo2*, Int32, Int32, UInt8**, HRESULT)
    reset : Proc(ICertEncodeCRLDistInfo2*, Int32, HRESULT)
    set_name_count : Proc(ICertEncodeCRLDistInfo2*, Int32, Int32, HRESULT)
    set_name_entry : Proc(ICertEncodeCRLDistInfo2*, Int32, Int32, CERT_ALT_NAME, UInt8*, HRESULT)
    encode : Proc(ICertEncodeCRLDistInfo2*, UInt8**, HRESULT)
    decode_blob : Proc(ICertEncodeCRLDistInfo2*, UInt8*, EncodingType, HRESULT)
    encode_blob : Proc(ICertEncodeCRLDistInfo2*, EncodingType, UInt8**, HRESULT)
  end

  ICertEncodeCRLDistInfo2_GUID = LibC::GUID.new("b4275d4b-3e30-446f-ad36-09d03120b078")
  CLSID_ICertEncodeCRLDistInfo2 = "b4275d4b-3e30-446f-ad36-09d03120b078"
  struct ICertEncodeCRLDistInfo2
    lpVtbl : ICertEncodeCRLDistInfo2VTbl*
  end

  struct ICertEncodeAltNameVTbl
    query_interface : Proc(ICertEncodeAltName*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeAltName*, UInt32)
    release : Proc(ICertEncodeAltName*, UInt32)
    get_type_info_count : Proc(ICertEncodeAltName*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeAltName*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeAltName*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeAltName*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeAltName*, UInt8*, HRESULT)
    get_name_count : Proc(ICertEncodeAltName*, Int32*, HRESULT)
    get_name_choice : Proc(ICertEncodeAltName*, Int32, Int32*, HRESULT)
    get_name : Proc(ICertEncodeAltName*, Int32, UInt8**, HRESULT)
    reset : Proc(ICertEncodeAltName*, Int32, HRESULT)
    set_name_entry : Proc(ICertEncodeAltName*, Int32, CERT_ALT_NAME, UInt8*, HRESULT)
    encode : Proc(ICertEncodeAltName*, UInt8**, HRESULT)
  end

  ICertEncodeAltName_GUID = LibC::GUID.new("1c9a8c70-1271-11d1-9bd4-00c04fb683fa")
  CLSID_ICertEncodeAltName = "1c9a8c70-1271-11d1-9bd4-00c04fb683fa"
  struct ICertEncodeAltName
    lpVtbl : ICertEncodeAltNameVTbl*
  end

  struct ICertEncodeAltName2VTbl
    query_interface : Proc(ICertEncodeAltName2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeAltName2*, UInt32)
    release : Proc(ICertEncodeAltName2*, UInt32)
    get_type_info_count : Proc(ICertEncodeAltName2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeAltName2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeAltName2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeAltName2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeAltName2*, UInt8*, HRESULT)
    get_name_count : Proc(ICertEncodeAltName2*, Int32*, HRESULT)
    get_name_choice : Proc(ICertEncodeAltName2*, Int32, Int32*, HRESULT)
    get_name : Proc(ICertEncodeAltName2*, Int32, UInt8**, HRESULT)
    reset : Proc(ICertEncodeAltName2*, Int32, HRESULT)
    set_name_entry : Proc(ICertEncodeAltName2*, Int32, CERT_ALT_NAME, UInt8*, HRESULT)
    encode : Proc(ICertEncodeAltName2*, UInt8**, HRESULT)
    decode_blob : Proc(ICertEncodeAltName2*, UInt8*, EncodingType, HRESULT)
    encode_blob : Proc(ICertEncodeAltName2*, EncodingType, UInt8**, HRESULT)
    get_name_blob : Proc(ICertEncodeAltName2*, Int32, EncodingType, UInt8**, HRESULT)
    set_name_entry_blob : Proc(ICertEncodeAltName2*, Int32, Int32, UInt8*, EncodingType, HRESULT)
  end

  ICertEncodeAltName2_GUID = LibC::GUID.new("f67fe177-5ef1-4535-b4ce-29df15e2e0c3")
  CLSID_ICertEncodeAltName2 = "f67fe177-5ef1-4535-b4ce-29df15e2e0c3"
  struct ICertEncodeAltName2
    lpVtbl : ICertEncodeAltName2VTbl*
  end

  struct ICertEncodeBitStringVTbl
    query_interface : Proc(ICertEncodeBitString*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeBitString*, UInt32)
    release : Proc(ICertEncodeBitString*, UInt32)
    get_type_info_count : Proc(ICertEncodeBitString*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeBitString*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeBitString*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeBitString*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeBitString*, UInt8*, HRESULT)
    get_bit_count : Proc(ICertEncodeBitString*, Int32*, HRESULT)
    get_bit_string : Proc(ICertEncodeBitString*, UInt8**, HRESULT)
    encode : Proc(ICertEncodeBitString*, Int32, UInt8*, UInt8**, HRESULT)
  end

  ICertEncodeBitString_GUID = LibC::GUID.new("6db525be-1278-11d1-9bd4-00c04fb683fa")
  CLSID_ICertEncodeBitString = "6db525be-1278-11d1-9bd4-00c04fb683fa"
  struct ICertEncodeBitString
    lpVtbl : ICertEncodeBitStringVTbl*
  end

  struct ICertEncodeBitString2VTbl
    query_interface : Proc(ICertEncodeBitString2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertEncodeBitString2*, UInt32)
    release : Proc(ICertEncodeBitString2*, UInt32)
    get_type_info_count : Proc(ICertEncodeBitString2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertEncodeBitString2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertEncodeBitString2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertEncodeBitString2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    decode : Proc(ICertEncodeBitString2*, UInt8*, HRESULT)
    get_bit_count : Proc(ICertEncodeBitString2*, Int32*, HRESULT)
    get_bit_string : Proc(ICertEncodeBitString2*, UInt8**, HRESULT)
    encode : Proc(ICertEncodeBitString2*, Int32, UInt8*, UInt8**, HRESULT)
    decode_blob : Proc(ICertEncodeBitString2*, UInt8*, EncodingType, HRESULT)
    encode_blob : Proc(ICertEncodeBitString2*, Int32, UInt8*, EncodingType, EncodingType, UInt8**, HRESULT)
    get_bit_string_blob : Proc(ICertEncodeBitString2*, EncodingType, UInt8**, HRESULT)
  end

  ICertEncodeBitString2_GUID = LibC::GUID.new("e070d6e7-23ef-4dd2-8242-ebd9c928cb30")
  CLSID_ICertEncodeBitString2 = "e070d6e7-23ef-4dd2-8242-ebd9c928cb30"
  struct ICertEncodeBitString2
    lpVtbl : ICertEncodeBitString2VTbl*
  end

  struct ICertExitVTbl
    query_interface : Proc(ICertExit*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertExit*, UInt32)
    release : Proc(ICertExit*, UInt32)
    get_type_info_count : Proc(ICertExit*, UInt32*, HRESULT)
    get_type_info : Proc(ICertExit*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertExit*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertExit*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertExit*, UInt8*, CERT_EXIT_EVENT_MASK*, HRESULT)
    notify : Proc(ICertExit*, Int32, Int32, HRESULT)
    get_description : Proc(ICertExit*, UInt8**, HRESULT)
  end

  ICertExit_GUID = LibC::GUID.new("e19ae1a0-7364-11d0-8816-00a0c903b83c")
  CLSID_ICertExit = "e19ae1a0-7364-11d0-8816-00a0c903b83c"
  struct ICertExit
    lpVtbl : ICertExitVTbl*
  end

  struct ICertExit2VTbl
    query_interface : Proc(ICertExit2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertExit2*, UInt32)
    release : Proc(ICertExit2*, UInt32)
    get_type_info_count : Proc(ICertExit2*, UInt32*, HRESULT)
    get_type_info : Proc(ICertExit2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICertExit2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICertExit2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    initialize : Proc(ICertExit2*, UInt8*, CERT_EXIT_EVENT_MASK*, HRESULT)
    notify : Proc(ICertExit2*, Int32, Int32, HRESULT)
    get_description : Proc(ICertExit2*, UInt8**, HRESULT)
    get_manage_module : Proc(ICertExit2*, ICertManageModule*, HRESULT)
  end

  ICertExit2_GUID = LibC::GUID.new("0abf484b-d049-464d-a7ed-552e7529b0ff")
  CLSID_ICertExit2 = "0abf484b-d049-464d-a7ed-552e7529b0ff"
  struct ICertExit2
    lpVtbl : ICertExit2VTbl*
  end

  struct ICEnrollVTbl
    query_interface : Proc(ICEnroll*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICEnroll*, UInt32)
    release : Proc(ICEnroll*, UInt32)
    get_type_info_count : Proc(ICEnroll*, UInt32*, HRESULT)
    get_type_info : Proc(ICEnroll*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICEnroll*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICEnroll*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_file_pkcs10 : Proc(ICEnroll*, UInt8*, UInt8*, UInt8*, HRESULT)
    accept_file_pkcs7 : Proc(ICEnroll*, UInt8*, HRESULT)
    create_pkcs10 : Proc(ICEnroll*, UInt8*, UInt8*, UInt8**, HRESULT)
    accept_pkcs7 : Proc(ICEnroll*, UInt8*, HRESULT)
    get_cert_from_pkcs7 : Proc(ICEnroll*, UInt8*, UInt8**, HRESULT)
    enum_providers : Proc(ICEnroll*, Int32, Int32, UInt8**, HRESULT)
    enum_containers : Proc(ICEnroll*, Int32, UInt8**, HRESULT)
    free_request_info : Proc(ICEnroll*, UInt8*, HRESULT)
    get_my_store_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_my_store_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_my_store_type : Proc(ICEnroll*, UInt8**, HRESULT)
    put_my_store_type : Proc(ICEnroll*, UInt8*, HRESULT)
    get_my_store_flags : Proc(ICEnroll*, Int32*, HRESULT)
    put_my_store_flags : Proc(ICEnroll*, Int32, HRESULT)
    get_ca_store_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_ca_store_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_ca_store_type : Proc(ICEnroll*, UInt8**, HRESULT)
    put_ca_store_type : Proc(ICEnroll*, UInt8*, HRESULT)
    get_ca_store_flags : Proc(ICEnroll*, Int32*, HRESULT)
    put_ca_store_flags : Proc(ICEnroll*, Int32, HRESULT)
    get_root_store_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_root_store_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_root_store_type : Proc(ICEnroll*, UInt8**, HRESULT)
    put_root_store_type : Proc(ICEnroll*, UInt8*, HRESULT)
    get_root_store_flags : Proc(ICEnroll*, Int32*, HRESULT)
    put_root_store_flags : Proc(ICEnroll*, Int32, HRESULT)
    get_request_store_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_request_store_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_request_store_type : Proc(ICEnroll*, UInt8**, HRESULT)
    put_request_store_type : Proc(ICEnroll*, UInt8*, HRESULT)
    get_request_store_flags : Proc(ICEnroll*, Int32*, HRESULT)
    put_request_store_flags : Proc(ICEnroll*, Int32, HRESULT)
    get_container_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_container_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_provider_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_provider_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_provider_type : Proc(ICEnroll*, Int32*, HRESULT)
    put_provider_type : Proc(ICEnroll*, Int32, HRESULT)
    get_key_spec : Proc(ICEnroll*, Int32*, HRESULT)
    put_key_spec : Proc(ICEnroll*, Int32, HRESULT)
    get_provider_flags : Proc(ICEnroll*, Int32*, HRESULT)
    put_provider_flags : Proc(ICEnroll*, Int32, HRESULT)
    get_use_existing_key_set : Proc(ICEnroll*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(ICEnroll*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(ICEnroll*, Int32*, HRESULT)
    put_gen_key_flags : Proc(ICEnroll*, Int32, HRESULT)
    get_delete_request_cert : Proc(ICEnroll*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(ICEnroll*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(ICEnroll*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(ICEnroll*, LibC::BOOL, HRESULT)
    get_spc_file_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_spc_file_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_pvk_file_name : Proc(ICEnroll*, UInt8**, HRESULT)
    put_pvk_file_name : Proc(ICEnroll*, UInt8*, HRESULT)
    get_hash_algorithm : Proc(ICEnroll*, UInt8**, HRESULT)
    put_hash_algorithm : Proc(ICEnroll*, UInt8*, HRESULT)
  end

  ICEnroll_GUID = LibC::GUID.new("43f8f288-7a20-11d0-8f06-00c04fc295e1")
  CLSID_ICEnroll = "43f8f288-7a20-11d0-8f06-00c04fc295e1"
  struct ICEnroll
    lpVtbl : ICEnrollVTbl*
  end

  struct ICEnroll2VTbl
    query_interface : Proc(ICEnroll2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICEnroll2*, UInt32)
    release : Proc(ICEnroll2*, UInt32)
    get_type_info_count : Proc(ICEnroll2*, UInt32*, HRESULT)
    get_type_info : Proc(ICEnroll2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICEnroll2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICEnroll2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_file_pkcs10 : Proc(ICEnroll2*, UInt8*, UInt8*, UInt8*, HRESULT)
    accept_file_pkcs7 : Proc(ICEnroll2*, UInt8*, HRESULT)
    create_pkcs10 : Proc(ICEnroll2*, UInt8*, UInt8*, UInt8**, HRESULT)
    accept_pkcs7 : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_cert_from_pkcs7 : Proc(ICEnroll2*, UInt8*, UInt8**, HRESULT)
    enum_providers : Proc(ICEnroll2*, Int32, Int32, UInt8**, HRESULT)
    enum_containers : Proc(ICEnroll2*, Int32, UInt8**, HRESULT)
    free_request_info : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_my_store_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_my_store_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_my_store_type : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_my_store_type : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_my_store_flags : Proc(ICEnroll2*, Int32*, HRESULT)
    put_my_store_flags : Proc(ICEnroll2*, Int32, HRESULT)
    get_ca_store_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_ca_store_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_ca_store_type : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_ca_store_type : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_ca_store_flags : Proc(ICEnroll2*, Int32*, HRESULT)
    put_ca_store_flags : Proc(ICEnroll2*, Int32, HRESULT)
    get_root_store_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_root_store_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_root_store_type : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_root_store_type : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_root_store_flags : Proc(ICEnroll2*, Int32*, HRESULT)
    put_root_store_flags : Proc(ICEnroll2*, Int32, HRESULT)
    get_request_store_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_request_store_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_request_store_type : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_request_store_type : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_request_store_flags : Proc(ICEnroll2*, Int32*, HRESULT)
    put_request_store_flags : Proc(ICEnroll2*, Int32, HRESULT)
    get_container_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_container_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_provider_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_provider_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_provider_type : Proc(ICEnroll2*, Int32*, HRESULT)
    put_provider_type : Proc(ICEnroll2*, Int32, HRESULT)
    get_key_spec : Proc(ICEnroll2*, Int32*, HRESULT)
    put_key_spec : Proc(ICEnroll2*, Int32, HRESULT)
    get_provider_flags : Proc(ICEnroll2*, Int32*, HRESULT)
    put_provider_flags : Proc(ICEnroll2*, Int32, HRESULT)
    get_use_existing_key_set : Proc(ICEnroll2*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(ICEnroll2*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(ICEnroll2*, Int32*, HRESULT)
    put_gen_key_flags : Proc(ICEnroll2*, Int32, HRESULT)
    get_delete_request_cert : Proc(ICEnroll2*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(ICEnroll2*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(ICEnroll2*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(ICEnroll2*, LibC::BOOL, HRESULT)
    get_spc_file_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_spc_file_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_pvk_file_name : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_pvk_file_name : Proc(ICEnroll2*, UInt8*, HRESULT)
    get_hash_algorithm : Proc(ICEnroll2*, UInt8**, HRESULT)
    put_hash_algorithm : Proc(ICEnroll2*, UInt8*, HRESULT)
    add_cert_type_to_request : Proc(ICEnroll2*, UInt8*, HRESULT)
    add_name_value_pair_to_signature : Proc(ICEnroll2*, UInt8*, UInt8*, HRESULT)
    get_write_cert_to_user_ds : Proc(ICEnroll2*, LibC::BOOL*, HRESULT)
    put_write_cert_to_user_ds : Proc(ICEnroll2*, LibC::BOOL, HRESULT)
    get_enable_t61_dn_encoding : Proc(ICEnroll2*, LibC::BOOL*, HRESULT)
    put_enable_t61_dn_encoding : Proc(ICEnroll2*, LibC::BOOL, HRESULT)
  end

  ICEnroll2_GUID = LibC::GUID.new("704ca730-c90b-11d1-9bec-00c04fc295e1")
  CLSID_ICEnroll2 = "704ca730-c90b-11d1-9bec-00c04fc295e1"
  struct ICEnroll2
    lpVtbl : ICEnroll2VTbl*
  end

  struct ICEnroll3VTbl
    query_interface : Proc(ICEnroll3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICEnroll3*, UInt32)
    release : Proc(ICEnroll3*, UInt32)
    get_type_info_count : Proc(ICEnroll3*, UInt32*, HRESULT)
    get_type_info : Proc(ICEnroll3*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICEnroll3*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICEnroll3*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_file_pkcs10 : Proc(ICEnroll3*, UInt8*, UInt8*, UInt8*, HRESULT)
    accept_file_pkcs7 : Proc(ICEnroll3*, UInt8*, HRESULT)
    create_pkcs10 : Proc(ICEnroll3*, UInt8*, UInt8*, UInt8**, HRESULT)
    accept_pkcs7 : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_cert_from_pkcs7 : Proc(ICEnroll3*, UInt8*, UInt8**, HRESULT)
    enum_providers : Proc(ICEnroll3*, Int32, Int32, UInt8**, HRESULT)
    enum_containers : Proc(ICEnroll3*, Int32, UInt8**, HRESULT)
    free_request_info : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_my_store_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_my_store_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_my_store_type : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_my_store_type : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_my_store_flags : Proc(ICEnroll3*, Int32*, HRESULT)
    put_my_store_flags : Proc(ICEnroll3*, Int32, HRESULT)
    get_ca_store_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_ca_store_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_ca_store_type : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_ca_store_type : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_ca_store_flags : Proc(ICEnroll3*, Int32*, HRESULT)
    put_ca_store_flags : Proc(ICEnroll3*, Int32, HRESULT)
    get_root_store_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_root_store_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_root_store_type : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_root_store_type : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_root_store_flags : Proc(ICEnroll3*, Int32*, HRESULT)
    put_root_store_flags : Proc(ICEnroll3*, Int32, HRESULT)
    get_request_store_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_request_store_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_request_store_type : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_request_store_type : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_request_store_flags : Proc(ICEnroll3*, Int32*, HRESULT)
    put_request_store_flags : Proc(ICEnroll3*, Int32, HRESULT)
    get_container_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_container_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_provider_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_provider_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_provider_type : Proc(ICEnroll3*, Int32*, HRESULT)
    put_provider_type : Proc(ICEnroll3*, Int32, HRESULT)
    get_key_spec : Proc(ICEnroll3*, Int32*, HRESULT)
    put_key_spec : Proc(ICEnroll3*, Int32, HRESULT)
    get_provider_flags : Proc(ICEnroll3*, Int32*, HRESULT)
    put_provider_flags : Proc(ICEnroll3*, Int32, HRESULT)
    get_use_existing_key_set : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(ICEnroll3*, Int32*, HRESULT)
    put_gen_key_flags : Proc(ICEnroll3*, Int32, HRESULT)
    get_delete_request_cert : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_spc_file_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_spc_file_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_pvk_file_name : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_pvk_file_name : Proc(ICEnroll3*, UInt8*, HRESULT)
    get_hash_algorithm : Proc(ICEnroll3*, UInt8**, HRESULT)
    put_hash_algorithm : Proc(ICEnroll3*, UInt8*, HRESULT)
    add_cert_type_to_request : Proc(ICEnroll3*, UInt8*, HRESULT)
    add_name_value_pair_to_signature : Proc(ICEnroll3*, UInt8*, UInt8*, HRESULT)
    get_write_cert_to_user_ds : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_write_cert_to_user_ds : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_enable_t61_dn_encoding : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_enable_t61_dn_encoding : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    install_pkcs7 : Proc(ICEnroll3*, UInt8*, HRESULT)
    reset : Proc(ICEnroll3*, HRESULT)
    get_supported_key_spec : Proc(ICEnroll3*, Int32*, HRESULT)
    get_key_len : Proc(ICEnroll3*, LibC::BOOL, LibC::BOOL, Int32*, HRESULT)
    enum_algs : Proc(ICEnroll3*, Int32, Int32, Int32*, HRESULT)
    get_alg_name : Proc(ICEnroll3*, Int32, UInt8**, HRESULT)
    put_reuse_hardware_key_if_unable_to_gen_new : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_reuse_hardware_key_if_unable_to_gen_new : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_hash_alg_id : Proc(ICEnroll3*, Int32, HRESULT)
    get_hash_alg_id : Proc(ICEnroll3*, Int32*, HRESULT)
    put_limit_exchange_key_to_encipherment : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_limit_exchange_key_to_encipherment : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
    put_enable_smime_capabilities : Proc(ICEnroll3*, LibC::BOOL, HRESULT)
    get_enable_smime_capabilities : Proc(ICEnroll3*, LibC::BOOL*, HRESULT)
  end

  ICEnroll3_GUID = LibC::GUID.new("c28c2d95-b7de-11d2-a421-00c04f79fe8e")
  CLSID_ICEnroll3 = "c28c2d95-b7de-11d2-a421-00c04f79fe8e"
  struct ICEnroll3
    lpVtbl : ICEnroll3VTbl*
  end

  struct ICEnroll4VTbl
    query_interface : Proc(ICEnroll4*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICEnroll4*, UInt32)
    release : Proc(ICEnroll4*, UInt32)
    get_type_info_count : Proc(ICEnroll4*, UInt32*, HRESULT)
    get_type_info : Proc(ICEnroll4*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICEnroll4*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICEnroll4*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    create_file_pkcs10 : Proc(ICEnroll4*, UInt8*, UInt8*, UInt8*, HRESULT)
    accept_file_pkcs7 : Proc(ICEnroll4*, UInt8*, HRESULT)
    create_pkcs10 : Proc(ICEnroll4*, UInt8*, UInt8*, UInt8**, HRESULT)
    accept_pkcs7 : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_cert_from_pkcs7 : Proc(ICEnroll4*, UInt8*, UInt8**, HRESULT)
    enum_providers : Proc(ICEnroll4*, Int32, Int32, UInt8**, HRESULT)
    enum_containers : Proc(ICEnroll4*, Int32, UInt8**, HRESULT)
    free_request_info : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_my_store_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_my_store_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_my_store_type : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_my_store_type : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_my_store_flags : Proc(ICEnroll4*, Int32*, HRESULT)
    put_my_store_flags : Proc(ICEnroll4*, Int32, HRESULT)
    get_ca_store_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_ca_store_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_ca_store_type : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_ca_store_type : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_ca_store_flags : Proc(ICEnroll4*, Int32*, HRESULT)
    put_ca_store_flags : Proc(ICEnroll4*, Int32, HRESULT)
    get_root_store_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_root_store_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_root_store_type : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_root_store_type : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_root_store_flags : Proc(ICEnroll4*, Int32*, HRESULT)
    put_root_store_flags : Proc(ICEnroll4*, Int32, HRESULT)
    get_request_store_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_request_store_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_request_store_type : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_request_store_type : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_request_store_flags : Proc(ICEnroll4*, Int32*, HRESULT)
    put_request_store_flags : Proc(ICEnroll4*, Int32, HRESULT)
    get_container_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_container_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_provider_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_provider_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_provider_type : Proc(ICEnroll4*, Int32*, HRESULT)
    put_provider_type : Proc(ICEnroll4*, Int32, HRESULT)
    get_key_spec : Proc(ICEnroll4*, Int32*, HRESULT)
    put_key_spec : Proc(ICEnroll4*, Int32, HRESULT)
    get_provider_flags : Proc(ICEnroll4*, Int32*, HRESULT)
    put_provider_flags : Proc(ICEnroll4*, Int32, HRESULT)
    get_use_existing_key_set : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(ICEnroll4*, Int32*, HRESULT)
    put_gen_key_flags : Proc(ICEnroll4*, Int32, HRESULT)
    get_delete_request_cert : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_spc_file_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_spc_file_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_pvk_file_name : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_pvk_file_name : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_hash_algorithm : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_hash_algorithm : Proc(ICEnroll4*, UInt8*, HRESULT)
    add_cert_type_to_request : Proc(ICEnroll4*, UInt8*, HRESULT)
    add_name_value_pair_to_signature : Proc(ICEnroll4*, UInt8*, UInt8*, HRESULT)
    get_write_cert_to_user_ds : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_write_cert_to_user_ds : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_enable_t61_dn_encoding : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_enable_t61_dn_encoding : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    install_pkcs7 : Proc(ICEnroll4*, UInt8*, HRESULT)
    reset : Proc(ICEnroll4*, HRESULT)
    get_supported_key_spec : Proc(ICEnroll4*, Int32*, HRESULT)
    get_key_len : Proc(ICEnroll4*, LibC::BOOL, LibC::BOOL, Int32*, HRESULT)
    enum_algs : Proc(ICEnroll4*, Int32, Int32, Int32*, HRESULT)
    get_alg_name : Proc(ICEnroll4*, Int32, UInt8**, HRESULT)
    put_reuse_hardware_key_if_unable_to_gen_new : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_reuse_hardware_key_if_unable_to_gen_new : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_hash_alg_id : Proc(ICEnroll4*, Int32, HRESULT)
    get_hash_alg_id : Proc(ICEnroll4*, Int32*, HRESULT)
    put_limit_exchange_key_to_encipherment : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_limit_exchange_key_to_encipherment : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_enable_smime_capabilities : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_enable_smime_capabilities : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
    put_private_key_archive_certificate : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_private_key_archive_certificate : Proc(ICEnroll4*, UInt8**, HRESULT)
    put_thumb_print : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_thumb_print : Proc(ICEnroll4*, UInt8**, HRESULT)
    binary_to_string : Proc(ICEnroll4*, Int32, UInt8*, UInt8**, HRESULT)
    string_to_binary : Proc(ICEnroll4*, Int32, UInt8*, UInt8**, HRESULT)
    add_extension_to_request : Proc(ICEnroll4*, Int32, UInt8*, UInt8*, HRESULT)
    add_attribute_to_request : Proc(ICEnroll4*, Int32, UInt8*, UInt8*, HRESULT)
    add_name_value_pair_to_request : Proc(ICEnroll4*, Int32, UInt8*, UInt8*, HRESULT)
    reset_extensions : Proc(ICEnroll4*, HRESULT)
    reset_attributes : Proc(ICEnroll4*, HRESULT)
    create_request : Proc(ICEnroll4*, CERT_CREATE_REQUEST_FLAGS, UInt8*, UInt8*, UInt8**, HRESULT)
    create_file_request : Proc(ICEnroll4*, CERT_CREATE_REQUEST_FLAGS, UInt8*, UInt8*, UInt8*, HRESULT)
    accept_response : Proc(ICEnroll4*, UInt8*, HRESULT)
    accept_file_response : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_cert_from_response : Proc(ICEnroll4*, UInt8*, UInt8**, HRESULT)
    get_cert_from_file_response : Proc(ICEnroll4*, UInt8*, UInt8**, HRESULT)
    create_pfx : Proc(ICEnroll4*, UInt8*, UInt8**, HRESULT)
    create_file_pfx : Proc(ICEnroll4*, UInt8*, UInt8*, HRESULT)
    set_pending_request_info : Proc(ICEnroll4*, Int32, UInt8*, UInt8*, UInt8*, HRESULT)
    enum_pending_request : Proc(ICEnroll4*, Int32, PENDING_REQUEST_DESIRED_PROPERTY, VARIANT*, HRESULT)
    remove_pending_request : Proc(ICEnroll4*, UInt8*, HRESULT)
    get_key_len_ex : Proc(ICEnroll4*, XEKL_KEYSIZE, XEKL_KEYSPEC, Int32*, HRESULT)
    install_pkcs7_ex : Proc(ICEnroll4*, UInt8*, Int32*, HRESULT)
    add_cert_type_to_request_ex : Proc(ICEnroll4*, ADDED_CERT_TYPE, UInt8*, Int32, LibC::BOOL, Int32, HRESULT)
    get_provider_type2 : Proc(ICEnroll4*, UInt8*, Int32*, HRESULT)
    put_signer_certificate : Proc(ICEnroll4*, UInt8*, HRESULT)
    put_client_id : Proc(ICEnroll4*, Int32, HRESULT)
    get_client_id : Proc(ICEnroll4*, Int32*, HRESULT)
    add_blob_property_to_certificate : Proc(ICEnroll4*, Int32, Int32, UInt8*, HRESULT)
    reset_blob_properties : Proc(ICEnroll4*, HRESULT)
    put_include_subject_key_id : Proc(ICEnroll4*, LibC::BOOL, HRESULT)
    get_include_subject_key_id : Proc(ICEnroll4*, LibC::BOOL*, HRESULT)
  end

  ICEnroll4_GUID = LibC::GUID.new("c1f1188a-2eb5-4a80-841b-7e729a356d90")
  CLSID_ICEnroll4 = "c1f1188a-2eb5-4a80-841b-7e729a356d90"
  struct ICEnroll4
    lpVtbl : ICEnroll4VTbl*
  end

  struct IEnrollVTbl
    query_interface : Proc(IEnroll*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnroll*, UInt32)
    release : Proc(IEnroll*, UInt32)
    create_file_pkcs10_w_str : Proc(IEnroll*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    accept_file_pkcs7_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    create_pkcs10_w_str : Proc(IEnroll*, LibC::LPWSTR, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    accept_pkcs7_blob : Proc(IEnroll*, CRYPTOAPI_BLOB*, HRESULT)
    get_cert_context_from_pkcs7 : Proc(IEnroll*, CRYPTOAPI_BLOB*, CERT_CONTEXT**)
    get_my_store : Proc(IEnroll*, Void**)
    get_ca_store : Proc(IEnroll*, Void**)
    get_rooth_store : Proc(IEnroll*, Void**)
    enum_providers_w_str : Proc(IEnroll*, Int32, Int32, LibC::LPWSTR*, HRESULT)
    enum_containers_w_str : Proc(IEnroll*, Int32, LibC::LPWSTR*, HRESULT)
    free_request_info_blob : Proc(IEnroll*, CRYPTOAPI_BLOB, HRESULT)
    get_my_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_my_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_my_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_my_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_my_store_flags : Proc(IEnroll*, Int32*, HRESULT)
    put_my_store_flags : Proc(IEnroll*, Int32, HRESULT)
    get_ca_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_ca_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_ca_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_ca_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_ca_store_flags : Proc(IEnroll*, Int32*, HRESULT)
    put_ca_store_flags : Proc(IEnroll*, Int32, HRESULT)
    get_root_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_root_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_root_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_root_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_root_store_flags : Proc(IEnroll*, Int32*, HRESULT)
    put_root_store_flags : Proc(IEnroll*, Int32, HRESULT)
    get_request_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_request_store_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_request_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_request_store_type_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_request_store_flags : Proc(IEnroll*, Int32*, HRESULT)
    put_request_store_flags : Proc(IEnroll*, Int32, HRESULT)
    get_container_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_container_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_provider_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_provider_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_provider_type : Proc(IEnroll*, Int32*, HRESULT)
    put_provider_type : Proc(IEnroll*, Int32, HRESULT)
    get_key_spec : Proc(IEnroll*, Int32*, HRESULT)
    put_key_spec : Proc(IEnroll*, Int32, HRESULT)
    get_provider_flags : Proc(IEnroll*, Int32*, HRESULT)
    put_provider_flags : Proc(IEnroll*, Int32, HRESULT)
    get_use_existing_key_set : Proc(IEnroll*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(IEnroll*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(IEnroll*, Int32*, HRESULT)
    put_gen_key_flags : Proc(IEnroll*, Int32, HRESULT)
    get_delete_request_cert : Proc(IEnroll*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(IEnroll*, LibC::BOOL, HRESULT)
    get_write_cert_to_user_ds : Proc(IEnroll*, LibC::BOOL*, HRESULT)
    put_write_cert_to_user_ds : Proc(IEnroll*, LibC::BOOL, HRESULT)
    get_enable_t61_dn_encoding : Proc(IEnroll*, LibC::BOOL*, HRESULT)
    put_enable_t61_dn_encoding : Proc(IEnroll*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(IEnroll*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(IEnroll*, LibC::BOOL, HRESULT)
    get_spc_file_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_spc_file_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_pvk_file_name_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_pvk_file_name_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_hash_algorithm_w_str : Proc(IEnroll*, LibC::LPWSTR*, HRESULT)
    put_hash_algorithm_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    get_renewal_certificate : Proc(IEnroll*, CERT_CONTEXT**, HRESULT)
    put_renewal_certificate : Proc(IEnroll*, CERT_CONTEXT*, HRESULT)
    add_cert_type_to_request_w_str : Proc(IEnroll*, LibC::LPWSTR, HRESULT)
    add_name_value_pair_to_signature_w_str : Proc(IEnroll*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_extensions_to_request : Proc(IEnroll*, CERT_EXTENSIONS*, HRESULT)
    add_authenticated_attributes_to_pkcs7_request : Proc(IEnroll*, CRYPT_ATTRIBUTES*, HRESULT)
    create_pkcs7_request_from_request : Proc(IEnroll*, CRYPTOAPI_BLOB*, CERT_CONTEXT*, CRYPTOAPI_BLOB*, HRESULT)
  end

  IEnroll_GUID = LibC::GUID.new("acaa7838-4585-11d1-ab57-00c04fc295e1")
  CLSID_IEnroll = "acaa7838-4585-11d1-ab57-00c04fc295e1"
  struct IEnroll
    lpVtbl : IEnrollVTbl*
  end

  struct IEnroll2VTbl
    query_interface : Proc(IEnroll2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnroll2*, UInt32)
    release : Proc(IEnroll2*, UInt32)
    create_file_pkcs10_w_str : Proc(IEnroll2*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    accept_file_pkcs7_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    create_pkcs10_w_str : Proc(IEnroll2*, LibC::LPWSTR, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    accept_pkcs7_blob : Proc(IEnroll2*, CRYPTOAPI_BLOB*, HRESULT)
    get_cert_context_from_pkcs7 : Proc(IEnroll2*, CRYPTOAPI_BLOB*, CERT_CONTEXT**)
    get_my_store : Proc(IEnroll2*, Void**)
    get_ca_store : Proc(IEnroll2*, Void**)
    get_rooth_store : Proc(IEnroll2*, Void**)
    enum_providers_w_str : Proc(IEnroll2*, Int32, Int32, LibC::LPWSTR*, HRESULT)
    enum_containers_w_str : Proc(IEnroll2*, Int32, LibC::LPWSTR*, HRESULT)
    free_request_info_blob : Proc(IEnroll2*, CRYPTOAPI_BLOB, HRESULT)
    get_my_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_my_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_my_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_my_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_my_store_flags : Proc(IEnroll2*, Int32*, HRESULT)
    put_my_store_flags : Proc(IEnroll2*, Int32, HRESULT)
    get_ca_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_ca_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_ca_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_ca_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_ca_store_flags : Proc(IEnroll2*, Int32*, HRESULT)
    put_ca_store_flags : Proc(IEnroll2*, Int32, HRESULT)
    get_root_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_root_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_root_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_root_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_root_store_flags : Proc(IEnroll2*, Int32*, HRESULT)
    put_root_store_flags : Proc(IEnroll2*, Int32, HRESULT)
    get_request_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_request_store_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_request_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_request_store_type_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_request_store_flags : Proc(IEnroll2*, Int32*, HRESULT)
    put_request_store_flags : Proc(IEnroll2*, Int32, HRESULT)
    get_container_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_container_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_provider_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_provider_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_provider_type : Proc(IEnroll2*, Int32*, HRESULT)
    put_provider_type : Proc(IEnroll2*, Int32, HRESULT)
    get_key_spec : Proc(IEnroll2*, Int32*, HRESULT)
    put_key_spec : Proc(IEnroll2*, Int32, HRESULT)
    get_provider_flags : Proc(IEnroll2*, Int32*, HRESULT)
    put_provider_flags : Proc(IEnroll2*, Int32, HRESULT)
    get_use_existing_key_set : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(IEnroll2*, Int32*, HRESULT)
    put_gen_key_flags : Proc(IEnroll2*, Int32, HRESULT)
    get_delete_request_cert : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_write_cert_to_user_ds : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_write_cert_to_user_ds : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_enable_t61_dn_encoding : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_enable_t61_dn_encoding : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_spc_file_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_spc_file_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_pvk_file_name_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_pvk_file_name_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_hash_algorithm_w_str : Proc(IEnroll2*, LibC::LPWSTR*, HRESULT)
    put_hash_algorithm_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    get_renewal_certificate : Proc(IEnroll2*, CERT_CONTEXT**, HRESULT)
    put_renewal_certificate : Proc(IEnroll2*, CERT_CONTEXT*, HRESULT)
    add_cert_type_to_request_w_str : Proc(IEnroll2*, LibC::LPWSTR, HRESULT)
    add_name_value_pair_to_signature_w_str : Proc(IEnroll2*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_extensions_to_request : Proc(IEnroll2*, CERT_EXTENSIONS*, HRESULT)
    add_authenticated_attributes_to_pkcs7_request : Proc(IEnroll2*, CRYPT_ATTRIBUTES*, HRESULT)
    create_pkcs7_request_from_request : Proc(IEnroll2*, CRYPTOAPI_BLOB*, CERT_CONTEXT*, CRYPTOAPI_BLOB*, HRESULT)
    install_pkcs7_blob : Proc(IEnroll2*, CRYPTOAPI_BLOB*, HRESULT)
    reset : Proc(IEnroll2*, HRESULT)
    get_supported_key_spec : Proc(IEnroll2*, Int32*, HRESULT)
    get_key_len : Proc(IEnroll2*, LibC::BOOL, LibC::BOOL, Int32*, HRESULT)
    enum_algs : Proc(IEnroll2*, Int32, Int32, Int32*, HRESULT)
    get_alg_name_w_str : Proc(IEnroll2*, Int32, LibC::LPWSTR*, HRESULT)
    put_reuse_hardware_key_if_unable_to_gen_new : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_reuse_hardware_key_if_unable_to_gen_new : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_hash_alg_id : Proc(IEnroll2*, Int32, HRESULT)
    get_hash_alg_id : Proc(IEnroll2*, Int32*, HRESULT)
    set_h_store_my : Proc(IEnroll2*, Void*, HRESULT)
    set_h_store_ca : Proc(IEnroll2*, Void*, HRESULT)
    set_h_store_root : Proc(IEnroll2*, Void*, HRESULT)
    set_h_store_request : Proc(IEnroll2*, Void*, HRESULT)
    put_limit_exchange_key_to_encipherment : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_limit_exchange_key_to_encipherment : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
    put_enable_smime_capabilities : Proc(IEnroll2*, LibC::BOOL, HRESULT)
    get_enable_smime_capabilities : Proc(IEnroll2*, LibC::BOOL*, HRESULT)
  end

  IEnroll2_GUID = LibC::GUID.new("c080e199-b7df-11d2-a421-00c04f79fe8e")
  CLSID_IEnroll2 = "c080e199-b7df-11d2-a421-00c04f79fe8e"
  struct IEnroll2
    lpVtbl : IEnroll2VTbl*
  end

  struct IEnroll4VTbl
    query_interface : Proc(IEnroll4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEnroll4*, UInt32)
    release : Proc(IEnroll4*, UInt32)
    create_file_pkcs10_w_str : Proc(IEnroll4*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    accept_file_pkcs7_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    create_pkcs10_w_str : Proc(IEnroll4*, LibC::LPWSTR, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    accept_pkcs7_blob : Proc(IEnroll4*, CRYPTOAPI_BLOB*, HRESULT)
    get_cert_context_from_pkcs7 : Proc(IEnroll4*, CRYPTOAPI_BLOB*, CERT_CONTEXT**)
    get_my_store : Proc(IEnroll4*, Void**)
    get_ca_store : Proc(IEnroll4*, Void**)
    get_rooth_store : Proc(IEnroll4*, Void**)
    enum_providers_w_str : Proc(IEnroll4*, Int32, Int32, LibC::LPWSTR*, HRESULT)
    enum_containers_w_str : Proc(IEnroll4*, Int32, LibC::LPWSTR*, HRESULT)
    free_request_info_blob : Proc(IEnroll4*, CRYPTOAPI_BLOB, HRESULT)
    get_my_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_my_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_my_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_my_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_my_store_flags : Proc(IEnroll4*, Int32*, HRESULT)
    put_my_store_flags : Proc(IEnroll4*, Int32, HRESULT)
    get_ca_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_ca_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_ca_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_ca_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_ca_store_flags : Proc(IEnroll4*, Int32*, HRESULT)
    put_ca_store_flags : Proc(IEnroll4*, Int32, HRESULT)
    get_root_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_root_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_root_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_root_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_root_store_flags : Proc(IEnroll4*, Int32*, HRESULT)
    put_root_store_flags : Proc(IEnroll4*, Int32, HRESULT)
    get_request_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_request_store_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_request_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_request_store_type_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_request_store_flags : Proc(IEnroll4*, Int32*, HRESULT)
    put_request_store_flags : Proc(IEnroll4*, Int32, HRESULT)
    get_container_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_container_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_provider_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_provider_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_provider_type : Proc(IEnroll4*, Int32*, HRESULT)
    put_provider_type : Proc(IEnroll4*, Int32, HRESULT)
    get_key_spec : Proc(IEnroll4*, Int32*, HRESULT)
    put_key_spec : Proc(IEnroll4*, Int32, HRESULT)
    get_provider_flags : Proc(IEnroll4*, Int32*, HRESULT)
    put_provider_flags : Proc(IEnroll4*, Int32, HRESULT)
    get_use_existing_key_set : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_use_existing_key_set : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_gen_key_flags : Proc(IEnroll4*, Int32*, HRESULT)
    put_gen_key_flags : Proc(IEnroll4*, Int32, HRESULT)
    get_delete_request_cert : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_delete_request_cert : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_write_cert_to_user_ds : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_write_cert_to_user_ds : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_enable_t61_dn_encoding : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_enable_t61_dn_encoding : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_write_cert_to_csp : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_write_cert_to_csp : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_spc_file_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_spc_file_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_pvk_file_name_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_pvk_file_name_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_hash_algorithm_w_str : Proc(IEnroll4*, LibC::LPWSTR*, HRESULT)
    put_hash_algorithm_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_renewal_certificate : Proc(IEnroll4*, CERT_CONTEXT**, HRESULT)
    put_renewal_certificate : Proc(IEnroll4*, CERT_CONTEXT*, HRESULT)
    add_cert_type_to_request_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    add_name_value_pair_to_signature_w_str : Proc(IEnroll4*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    add_extensions_to_request : Proc(IEnroll4*, CERT_EXTENSIONS*, HRESULT)
    add_authenticated_attributes_to_pkcs7_request : Proc(IEnroll4*, CRYPT_ATTRIBUTES*, HRESULT)
    create_pkcs7_request_from_request : Proc(IEnroll4*, CRYPTOAPI_BLOB*, CERT_CONTEXT*, CRYPTOAPI_BLOB*, HRESULT)
    install_pkcs7_blob : Proc(IEnroll4*, CRYPTOAPI_BLOB*, HRESULT)
    reset : Proc(IEnroll4*, HRESULT)
    get_supported_key_spec : Proc(IEnroll4*, Int32*, HRESULT)
    get_key_len : Proc(IEnroll4*, LibC::BOOL, LibC::BOOL, Int32*, HRESULT)
    enum_algs : Proc(IEnroll4*, Int32, Int32, Int32*, HRESULT)
    get_alg_name_w_str : Proc(IEnroll4*, Int32, LibC::LPWSTR*, HRESULT)
    put_reuse_hardware_key_if_unable_to_gen_new : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_reuse_hardware_key_if_unable_to_gen_new : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_hash_alg_id : Proc(IEnroll4*, Int32, HRESULT)
    get_hash_alg_id : Proc(IEnroll4*, Int32*, HRESULT)
    set_h_store_my : Proc(IEnroll4*, Void*, HRESULT)
    set_h_store_ca : Proc(IEnroll4*, Void*, HRESULT)
    set_h_store_root : Proc(IEnroll4*, Void*, HRESULT)
    set_h_store_request : Proc(IEnroll4*, Void*, HRESULT)
    put_limit_exchange_key_to_encipherment : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_limit_exchange_key_to_encipherment : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_enable_smime_capabilities : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_enable_smime_capabilities : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
    put_thumb_print_w_str : Proc(IEnroll4*, CRYPTOAPI_BLOB, HRESULT)
    get_thumb_print_w_str : Proc(IEnroll4*, CRYPTOAPI_BLOB*, HRESULT)
    set_private_key_archive_certificate : Proc(IEnroll4*, CERT_CONTEXT*, HRESULT)
    get_private_key_archive_certificate : Proc(IEnroll4*, CERT_CONTEXT**)
    binary_blob_to_string : Proc(IEnroll4*, Int32, CRYPTOAPI_BLOB*, LibC::LPWSTR*, HRESULT)
    string_to_binary_blob : Proc(IEnroll4*, Int32, LibC::LPWSTR, CRYPTOAPI_BLOB*, Int32*, Int32*, HRESULT)
    add_extension_to_request_w_str : Proc(IEnroll4*, Int32, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    add_attribute_to_request_w_str : Proc(IEnroll4*, Int32, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    add_name_value_pair_to_request_w_str : Proc(IEnroll4*, Int32, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    reset_extensions : Proc(IEnroll4*, HRESULT)
    reset_attributes : Proc(IEnroll4*, HRESULT)
    create_request_w_str : Proc(IEnroll4*, CERT_CREATE_REQUEST_FLAGS, LibC::LPWSTR, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    create_file_request_w_str : Proc(IEnroll4*, CERT_CREATE_REQUEST_FLAGS, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    accept_response_blob : Proc(IEnroll4*, CRYPTOAPI_BLOB*, HRESULT)
    accept_file_response_w_str : Proc(IEnroll4*, LibC::LPWSTR, HRESULT)
    get_cert_context_from_response_blob : Proc(IEnroll4*, CRYPTOAPI_BLOB*, CERT_CONTEXT**, HRESULT)
    get_cert_context_from_file_response_w_str : Proc(IEnroll4*, LibC::LPWSTR, CERT_CONTEXT**, HRESULT)
    create_pfxw_str : Proc(IEnroll4*, LibC::LPWSTR, CRYPTOAPI_BLOB*, HRESULT)
    create_file_pfxw_str : Proc(IEnroll4*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    set_pending_request_info_w_str : Proc(IEnroll4*, Int32, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    enum_pending_request_w_str : Proc(IEnroll4*, Int32, PENDING_REQUEST_DESIRED_PROPERTY, Void*, HRESULT)
    remove_pending_request_w_str : Proc(IEnroll4*, CRYPTOAPI_BLOB, HRESULT)
    get_key_len_ex : Proc(IEnroll4*, XEKL_KEYSIZE, XEKL_KEYSPEC, Int32*, HRESULT)
    install_pkcs7_blob_ex : Proc(IEnroll4*, CRYPTOAPI_BLOB*, Int32*, HRESULT)
    add_cert_type_to_request_w_str_ex : Proc(IEnroll4*, ADDED_CERT_TYPE, LibC::LPWSTR, Int32, LibC::BOOL, Int32, HRESULT)
    get_provider_type_w_str : Proc(IEnroll4*, LibC::LPWSTR, Int32*, HRESULT)
    add_blob_property_to_certificate_w_str : Proc(IEnroll4*, Int32, Int32, CRYPTOAPI_BLOB*, HRESULT)
    set_signer_certificate : Proc(IEnroll4*, CERT_CONTEXT*, HRESULT)
    put_client_id : Proc(IEnroll4*, Int32, HRESULT)
    get_client_id : Proc(IEnroll4*, Int32*, HRESULT)
    put_include_subject_key_id : Proc(IEnroll4*, LibC::BOOL, HRESULT)
    get_include_subject_key_id : Proc(IEnroll4*, LibC::BOOL*, HRESULT)
  end

  IEnroll4_GUID = LibC::GUID.new("f8053fe5-78f4-448f-a0db-41d61b73446b")
  CLSID_IEnroll4 = "f8053fe5-78f4-448f-a0db-41d61b73446b"
  struct IEnroll4
    lpVtbl : IEnroll4VTbl*
  end

  struct ICertRequestDVTbl
    query_interface : Proc(ICertRequestD*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertRequestD*, UInt32)
    release : Proc(ICertRequestD*, UInt32)
    request : Proc(ICertRequestD*, UInt32, LibC::LPWSTR, UInt32*, UInt32*, LibC::LPWSTR, CERTTRANSBLOB*, CERTTRANSBLOB*, CERTTRANSBLOB*, CERTTRANSBLOB*, HRESULT)
    get_ca_cert : Proc(ICertRequestD*, UInt32, LibC::LPWSTR, CERTTRANSBLOB*, HRESULT)
    ping : Proc(ICertRequestD*, LibC::LPWSTR, HRESULT)
  end

  ICertRequestD_GUID = LibC::GUID.new("d99e6e70-fc88-11d0-b498-00a0c90312f3")
  CLSID_ICertRequestD = "d99e6e70-fc88-11d0-b498-00a0c90312f3"
  struct ICertRequestD
    lpVtbl : ICertRequestDVTbl*
  end

  struct ICertRequestD2VTbl
    query_interface : Proc(ICertRequestD2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICertRequestD2*, UInt32)
    release : Proc(ICertRequestD2*, UInt32)
    request : Proc(ICertRequestD2*, UInt32, LibC::LPWSTR, UInt32*, UInt32*, LibC::LPWSTR, CERTTRANSBLOB*, CERTTRANSBLOB*, CERTTRANSBLOB*, CERTTRANSBLOB*, HRESULT)
    get_ca_cert : Proc(ICertRequestD2*, UInt32, LibC::LPWSTR, CERTTRANSBLOB*, HRESULT)
    ping : Proc(ICertRequestD2*, LibC::LPWSTR, HRESULT)
    request2 : Proc(ICertRequestD2*, LibC::LPWSTR, UInt32, LibC::LPWSTR, UInt32*, UInt32*, LibC::LPWSTR, CERTTRANSBLOB*, CERTTRANSBLOB*, CERTTRANSBLOB*, CERTTRANSBLOB*, HRESULT)
    get_ca_property : Proc(ICertRequestD2*, LibC::LPWSTR, Int32, Int32, Int32, CERTTRANSBLOB*, HRESULT)
    get_ca_property_info : Proc(ICertRequestD2*, LibC::LPWSTR, Int32*, CERTTRANSBLOB*, HRESULT)
    ping2 : Proc(ICertRequestD2*, LibC::LPWSTR, HRESULT)
  end

  ICertRequestD2_GUID = LibC::GUID.new("5422fd3a-d4b8-4cef-a12e-e87d4ca22e90")
  CLSID_ICertRequestD2 = "5422fd3a-d4b8-4cef-a12e-e87d4ca22e90"
  struct ICertRequestD2
    lpVtbl : ICertRequestD2VTbl*
  end


  # Params # pwszservername : LibC::LPWSTR [In],pfserveronline : LibC::BOOL* [In]
  fun CertSrvIsServerOnlineW(pwszservername : LibC::LPWSTR, pfserveronline : LibC::BOOL*) : HRESULT

  # Params # hbc : Void* [In],ppwszzfilelist : LibC::LPWSTR* [In],pcbsize : UInt32* [In]
  fun CertSrvBackupGetDynamicFileListW(hbc : Void*, ppwszzfilelist : LibC::LPWSTR*, pcbsize : UInt32*) : HRESULT

  # Params # pwszservername : LibC::LPWSTR [In],grbitjet : UInt32 [In],dwbackupflags : CSBACKUP_TYPE [In],phbc : Void** [In]
  fun CertSrvBackupPrepareW(pwszservername : LibC::LPWSTR, grbitjet : UInt32, dwbackupflags : CSBACKUP_TYPE, phbc : Void**) : HRESULT

  # Params # hbc : Void* [In],ppwszzattachmentinformation : LibC::LPWSTR* [In],pcbsize : UInt32* [In]
  fun CertSrvBackupGetDatabaseNamesW(hbc : Void*, ppwszzattachmentinformation : LibC::LPWSTR*, pcbsize : UInt32*) : HRESULT

  # Params # hbc : Void* [In],pwszattachmentname : LibC::LPWSTR [In],cbreadhintsize : UInt32 [In],plifilesize : LARGE_INTEGER* [In]
  fun CertSrvBackupOpenFileW(hbc : Void*, pwszattachmentname : LibC::LPWSTR, cbreadhintsize : UInt32, plifilesize : LARGE_INTEGER*) : HRESULT

  # Params # hbc : Void* [In],pvbuffer : Void* [In],cbbuffer : UInt32 [In],pcbread : UInt32* [In]
  fun CertSrvBackupRead(hbc : Void*, pvbuffer : Void*, cbbuffer : UInt32, pcbread : UInt32*) : HRESULT

  # Params # hbc : Void* [In]
  fun CertSrvBackupClose(hbc : Void*) : HRESULT

  # Params # hbc : Void* [In],ppwszzbackuplogfiles : LibC::LPWSTR* [In],pcbsize : UInt32* [In]
  fun CertSrvBackupGetBackupLogsW(hbc : Void*, ppwszzbackuplogfiles : LibC::LPWSTR*, pcbsize : UInt32*) : HRESULT

  # Params # hbc : Void* [In]
  fun CertSrvBackupTruncateLogs(hbc : Void*) : HRESULT

  # Params # hbc : Void* [In]
  fun CertSrvBackupEnd(hbc : Void*) : HRESULT

  # Params # pv : Void* [In]
  fun CertSrvBackupFree(pv : Void*)

  # Params # hbc : Void* [In],ppwszzdatabaselocationlist : LibC::LPWSTR* [In],pcbsize : UInt32* [In]
  fun CertSrvRestoreGetDatabaseLocationsW(hbc : Void*, ppwszzdatabaselocationlist : LibC::LPWSTR*, pcbsize : UInt32*) : HRESULT

  # Params # pwszservername : LibC::LPWSTR [In],dwrestoreflags : UInt32 [In],phbc : Void** [In]
  fun CertSrvRestorePrepareW(pwszservername : LibC::LPWSTR, dwrestoreflags : UInt32, phbc : Void**) : HRESULT

  # Params # hbc : Void* [In],pwszcheckpointfilepath : LibC::LPWSTR [In],pwszlogpath : LibC::LPWSTR [In],rgrstmap : CSEDB_RSTMAPW* [In],crstmap : Int32 [In],pwszbackuplogpath : LibC::LPWSTR [In],genlow : UInt32 [In],genhigh : UInt32 [In]
  fun CertSrvRestoreRegisterW(hbc : Void*, pwszcheckpointfilepath : LibC::LPWSTR, pwszlogpath : LibC::LPWSTR, rgrstmap : CSEDB_RSTMAPW*, crstmap : Int32, pwszbackuplogpath : LibC::LPWSTR, genlow : UInt32, genhigh : UInt32) : HRESULT

  # Params # hbc : Void* [In],pwszcheckpointfilepath : LibC::LPWSTR [In],pwszlogpath : LibC::LPWSTR [In],rgrstmap : CSEDB_RSTMAPW* [In],crstmap : Int32 [In],pwszbackuplogpath : LibC::LPWSTR [In],genlow : UInt32 [In],genhigh : UInt32 [In]
  fun CertSrvRestoreRegisterThroughFile(hbc : Void*, pwszcheckpointfilepath : LibC::LPWSTR, pwszlogpath : LibC::LPWSTR, rgrstmap : CSEDB_RSTMAPW*, crstmap : Int32, pwszbackuplogpath : LibC::LPWSTR, genlow : UInt32, genhigh : UInt32) : HRESULT

  # Params # hbc : Void* [In],hrrestorestate : HRESULT [In]
  fun CertSrvRestoreRegisterComplete(hbc : Void*, hrrestorestate : HRESULT) : HRESULT

  # Params # hbc : Void* [In]
  fun CertSrvRestoreEnd(hbc : Void*) : HRESULT

  # Params # pwszservername : LibC::LPWSTR [In],dwcontrolflags : UInt32 [In],pcbout : UInt32* [In],ppbout : UInt8** [In]
  fun CertSrvServerControlW(pwszservername : LibC::LPWSTR, dwcontrolflags : UInt32, pcbout : UInt32*, ppbout : UInt8**) : HRESULT

  # Params # ptargetname : UNICODE_STRING* [In],ccriteria : UInt32 [In],rgpcriteria : CERT_SELECT_CRITERIA* [In],pptrustedissuers : SecPkgContext_IssuerListInfoEx** [In]
  fun PstGetTrustAnchors(ptargetname : UNICODE_STRING*, ccriteria : UInt32, rgpcriteria : CERT_SELECT_CRITERIA*, pptrustedissuers : SecPkgContext_IssuerListInfoEx**) : NTSTATUS

  # Params # ptargetname : UNICODE_STRING* [In],ccriteria : UInt32 [In],rgpcriteria : CERT_SELECT_CRITERIA* [In],pcertcontext : CERT_CONTEXT* [In],pptrustedissuers : SecPkgContext_IssuerListInfoEx** [In]
  fun PstGetTrustAnchorsEx(ptargetname : UNICODE_STRING*, ccriteria : UInt32, rgpcriteria : CERT_SELECT_CRITERIA*, pcertcontext : CERT_CONTEXT*, pptrustedissuers : SecPkgContext_IssuerListInfoEx**) : NTSTATUS

  # Params # pcert : CERT_CONTEXT* [In],ptrustedissuers : SecPkgContext_IssuerListInfoEx* [In],ppcertchaincontext : CERT_CHAIN_CONTEXT** [In]
  fun PstGetCertificateChain(pcert : CERT_CONTEXT*, ptrustedissuers : SecPkgContext_IssuerListInfoEx*, ppcertchaincontext : CERT_CHAIN_CONTEXT**) : NTSTATUS

  # Params # ptargetname : UNICODE_STRING* [In],ccriteria : UInt32 [In],rgpcriteria : CERT_SELECT_CRITERIA* [In],bisclient : LibC::BOOL [In],pdwcertchaincontextcount : UInt32* [In],ppcertchaincontexts : CERT_CHAIN_CONTEXT*** [In]
  fun PstGetCertificates(ptargetname : UNICODE_STRING*, ccriteria : UInt32, rgpcriteria : CERT_SELECT_CRITERIA*, bisclient : LibC::BOOL, pdwcertchaincontextcount : UInt32*, ppcertchaincontexts : CERT_CHAIN_CONTEXT***) : NTSTATUS

  # Params # pcert : CERT_CONTEXT* [In]
  fun PstAcquirePrivateKey(pcert : CERT_CONTEXT*) : NTSTATUS

  # Params # ptargetname : UNICODE_STRING* [In],bisclient : LibC::BOOL [In],prequestedissuancepolicy : CERT_USAGE_MATCH* [In],phadditionalcertstore : Void** [In],pcert : CERT_CONTEXT* [In],pprovguid : Guid* [In]
  fun PstValidate(ptargetname : UNICODE_STRING*, bisclient : LibC::BOOL, prequestedissuancepolicy : CERT_USAGE_MATCH*, phadditionalcertstore : Void**, pcert : CERT_CONTEXT*, pprovguid : Guid*) : NTSTATUS

  # Params # pcert : CERT_CONTEXT* [In],ptokeninformationtype : LSA_TOKEN_INFORMATION_TYPE* [In],pptokeninformation : Void** [In]
  fun PstMapCertificate(pcert : CERT_CONTEXT*, ptokeninformationtype : LSA_TOKEN_INFORMATION_TYPE*, pptokeninformation : Void**) : NTSTATUS

  # Params # pcertcontext : CERT_CONTEXT* [In],username : UNICODE_STRING* [In]
  fun PstGetUserNameForCertificate(pcertcontext : CERT_CONTEXT*, username : UNICODE_STRING*) : NTSTATUS
end
