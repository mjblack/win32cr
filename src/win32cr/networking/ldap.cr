require "./../foundation.cr"
require "./../security/authentication/identity.cr"
require "./../security/cryptography.cr"

module Win32cr::Networking::Ldap
  alias DBGPRINT = Proc(Win32cr::Foundation::PSTR, UInt32)

  alias QUERYFORCONNECTION = Proc(Win32cr::Networking::Ldap::Ldap*, Win32cr::Networking::Ldap::Ldap*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PSTR, UInt32, Void*, Void*, Win32cr::Networking::Ldap::Ldap**, UInt32)

  alias NOTIFYOFNEWCONNECTION = Proc(Win32cr::Networking::Ldap::Ldap*, Win32cr::Networking::Ldap::Ldap*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PSTR, Win32cr::Networking::Ldap::Ldap*, UInt32, Void*, Void*, UInt32, Win32cr::Foundation::BOOLEAN)

  alias DEREFERENCECONNECTION = Proc(Win32cr::Networking::Ldap::Ldap*, Win32cr::Networking::Ldap::Ldap*, UInt32)

  alias QUERYCLIENTCERT = Proc(Win32cr::Networking::Ldap::Ldap*, Win32cr::Security::Authentication::Identity::SecPkgContext_IssuerListInfoEx*, Win32cr::Security::Cryptography::CERT_CONTEXT**, Win32cr::Foundation::BOOLEAN)

  alias VERIFYSERVERCERT = Proc(Win32cr::Networking::Ldap::Ldap*, Win32cr::Security::Cryptography::CERT_CONTEXT**, Win32cr::Foundation::BOOLEAN)

  LBER_ERROR = -1_i32
  LBER_DEFAULT = -1_i32
  LDAP_UNICODE = 1_u32
  LDAP_PORT = 389_u32
  LDAP_SSL_PORT = 636_u32
  LDAP_GC_PORT = 3268_u32
  LDAP_SSL_GC_PORT = 3269_u32
  LDAP_VERSION1 = 1_u32
  LDAP_VERSION2 = 2_u32
  LDAP_VERSION3 = 3_u32
  LDAP_VERSION = 2_u32
  LDAP_BIND_CMD = 96_i32
  LDAP_UNBIND_CMD = 66_i32
  LDAP_SEARCH_CMD = 99_i32
  LDAP_MODIFY_CMD = 102_i32
  LDAP_ADD_CMD = 104_i32
  LDAP_DELETE_CMD = 74_i32
  LDAP_MODRDN_CMD = 108_i32
  LDAP_COMPARE_CMD = 110_i32
  LDAP_ABANDON_CMD = 80_i32
  LDAP_SESSION_CMD = 113_i32
  LDAP_EXTENDED_CMD = 119_i32
  LDAP_RES_BIND = 97_i32
  LDAP_RES_SEARCH_ENTRY = 100_i32
  LDAP_RES_SEARCH_RESULT = 101_i32
  LDAP_RES_MODIFY = 103_i32
  LDAP_RES_ADD = 105_i32
  LDAP_RES_DELETE = 107_i32
  LDAP_RES_MODRDN = 109_i32
  LDAP_RES_COMPARE = 111_i32
  LDAP_RES_SESSION = 114_i32
  LDAP_RES_REFERRAL = 115_i32
  LDAP_RES_EXTENDED = 120_i32
  LDAP_RES_ANY = -1_i32
  LDAP_INVALID_CMD = 255_u32
  LDAP_INVALID_RES = 255_u32
  LDAP_AUTH_SIMPLE = 128_i32
  LDAP_AUTH_SASL = 131_i32
  LDAP_AUTH_OTHERKIND = 134_i32
  LDAP_FILTER_AND = 160_u32
  LDAP_FILTER_OR = 161_u32
  LDAP_FILTER_NOT = 162_u32
  LDAP_FILTER_EQUALITY = 163_u32
  LDAP_FILTER_SUBSTRINGS = 164_u32
  LDAP_FILTER_GE = 165_u32
  LDAP_FILTER_LE = 166_u32
  LDAP_FILTER_PRESENT = 135_u32
  LDAP_FILTER_APPROX = 168_u32
  LDAP_FILTER_EXTENSIBLE = 169_u32
  LDAP_SUBSTRING_INITIAL = 128_i32
  LDAP_SUBSTRING_ANY = 129_i32
  LDAP_SUBSTRING_FINAL = 130_i32
  LDAP_DEREF_NEVER = 0_u32
  LDAP_DEREF_SEARCHING = 1_u32
  LDAP_DEREF_FINDING = 2_u32
  LDAP_DEREF_ALWAYS = 3_u32
  LDAP_NO_LIMIT = 0_u32
  LDAP_OPT_DNS = 1_u32
  LDAP_OPT_CHASE_REFERRALS = 2_u32
  LDAP_OPT_RETURN_REFS = 4_u32
  LDAP_CONTROL_REFERRALS_W = "1.2.840.113556.1.4.616"
  LDAP_CONTROL_REFERRALS = "1.2.840.113556.1.4.616"
  LDAP_MOD_ADD = 0_u32
  LDAP_MOD_DELETE = 1_u32
  LDAP_MOD_REPLACE = 2_u32
  LDAP_MOD_BVALUES = 128_u32
  LDAP_OPT_API_INFO = 0_u32
  LDAP_OPT_DESC = 1_u32
  LDAP_OPT_DEREF = 2_u32
  LDAP_OPT_SIZELIMIT = 3_u32
  LDAP_OPT_TIMELIMIT = 4_u32
  LDAP_OPT_THREAD_FN_PTRS = 5_u32
  LDAP_OPT_REBIND_FN = 6_u32
  LDAP_OPT_REBIND_ARG = 7_u32
  LDAP_OPT_REFERRALS = 8_u32
  LDAP_OPT_RESTART = 9_u32
  LDAP_OPT_SSL = 10_u32
  LDAP_OPT_IO_FN_PTRS = 11_u32
  LDAP_OPT_CACHE_FN_PTRS = 13_u32
  LDAP_OPT_CACHE_STRATEGY = 14_u32
  LDAP_OPT_CACHE_ENABLE = 15_u32
  LDAP_OPT_REFERRAL_HOP_LIMIT = 16_u32
  LDAP_OPT_PROTOCOL_VERSION = 17_u32
  LDAP_OPT_VERSION = 17_u32
  LDAP_OPT_API_FEATURE_INFO = 21_u32
  LDAP_OPT_HOST_NAME = 48_u32
  LDAP_OPT_ERROR_NUMBER = 49_u32
  LDAP_OPT_ERROR_STRING = 50_u32
  LDAP_OPT_SERVER_ERROR = 51_u32
  LDAP_OPT_SERVER_EXT_ERROR = 52_u32
  LDAP_OPT_HOST_REACHABLE = 62_u32
  LDAP_OPT_PING_KEEP_ALIVE = 54_u32
  LDAP_OPT_PING_WAIT_TIME = 55_u32
  LDAP_OPT_PING_LIMIT = 56_u32
  LDAP_OPT_DNSDOMAIN_NAME = 59_u32
  LDAP_OPT_GETDSNAME_FLAGS = 61_u32
  LDAP_OPT_PROMPT_CREDENTIALS = 63_u32
  LDAP_OPT_AUTO_RECONNECT = 145_u32
  LDAP_OPT_SSPI_FLAGS = 146_u32
  LDAP_OPT_SSL_INFO = 147_u32
  LDAP_OPT_TLS = 10_u32
  LDAP_OPT_TLS_INFO = 147_u32
  LDAP_OPT_SIGN = 149_u32
  LDAP_OPT_ENCRYPT = 150_u32
  LDAP_OPT_SASL_METHOD = 151_u32
  LDAP_OPT_AREC_EXCLUSIVE = 152_u32
  LDAP_OPT_SECURITY_CONTEXT = 153_u32
  LDAP_OPT_ROOTDSE_CACHE = 154_u32
  LDAP_OPT_TCP_KEEPALIVE = 64_u32
  LDAP_OPT_FAST_CONCURRENT_BIND = 65_u32
  LDAP_OPT_SEND_TIMEOUT = 66_u32
  LDAP_OPT_SCH_FLAGS = 67_u32
  LDAP_OPT_SOCKET_BIND_ADDRESSES = 68_u32
  LDAP_CHASE_SUBORDINATE_REFERRALS = 32_u32
  LDAP_CHASE_EXTERNAL_REFERRALS = 64_u32
  LDAP_SCOPE_BASE = 0_u32
  LDAP_SCOPE_ONELEVEL = 1_u32
  LDAP_SCOPE_SUBTREE = 2_u32
  LDAP_MSG_ONE = 0_u32
  LDAP_MSG_ALL = 1_u32
  LDAP_MSG_RECEIVED = 2_u32
  LBER_USE_DER = 1_u32
  LBER_USE_INDEFINITE_LEN = 2_u32
  LBER_TRANSLATE_STRINGS = 4_u32
  LAPI_MAJOR_VER1 = 1_u32
  LAPI_MINOR_VER1 = 1_u32
  LDAP_API_INFO_VERSION = 1_u32
  LDAP_API_VERSION = 2004_u32
  LDAP_VERSION_MIN = 2_u32
  LDAP_VERSION_MAX = 3_u32
  LDAP_VENDOR_NAME = "Microsoft Corporation."
  LDAP_VENDOR_NAME_W = "Microsoft Corporation."
  LDAP_VENDOR_VERSION = 510_u32
  LDAP_FEATURE_INFO_VERSION = 1_u32
  LDAP_SERVER_SORT_OID = "1.2.840.113556.1.4.473"
  LDAP_SERVER_SORT_OID_W = "1.2.840.113556.1.4.473"
  LDAP_SERVER_RESP_SORT_OID = "1.2.840.113556.1.4.474"
  LDAP_SERVER_RESP_SORT_OID_W = "1.2.840.113556.1.4.474"
  LDAP_PAGED_RESULT_OID_STRING = "1.2.840.113556.1.4.319"
  LDAP_PAGED_RESULT_OID_STRING_W = "1.2.840.113556.1.4.319"
  LDAP_CONTROL_VLVREQUEST = "2.16.840.1.113730.3.4.9"
  LDAP_CONTROL_VLVREQUEST_W = "2.16.840.1.113730.3.4.9"
  LDAP_CONTROL_VLVRESPONSE = "2.16.840.1.113730.3.4.10"
  LDAP_CONTROL_VLVRESPONSE_W = "2.16.840.1.113730.3.4.10"
  LDAP_API_FEATURE_VIRTUAL_LIST_VIEW = 1001_u32
  LDAP_VLVINFO_VERSION = 1_u32
  LDAP_START_TLS_OID = "1.3.6.1.4.1.1466.20037"
  LDAP_START_TLS_OID_W = "1.3.6.1.4.1.1466.20037"
  LDAP_TTL_EXTENDED_OP_OID = "1.3.6.1.4.1.1466.101.119.1"
  LDAP_TTL_EXTENDED_OP_OID_W = "1.3.6.1.4.1.1466.101.119.1"
  LDAP_OPT_REFERRAL_CALLBACK = 112_u32
  LDAP_OPT_CLIENT_CERTIFICATE = 128_u32
  LDAP_OPT_SERVER_CERTIFICATE = 129_u32
  LDAP_OPT_REF_DEREF_CONN_PER_MSG = 148_u32
  LDAP_SERVER_FORCE_UPDATE_OID = "1.2.840.113556.1.4.1974"
  LDAP_SERVER_FORCE_UPDATE_OID_W = "1.2.840.113556.1.4.1974"
  LDAP_SERVER_PERMISSIVE_MODIFY_OID = "1.2.840.113556.1.4.1413"
  LDAP_SERVER_PERMISSIVE_MODIFY_OID_W = "1.2.840.113556.1.4.1413"
  LDAP_SERVER_SHOW_DELETED_OID = "1.2.840.113556.1.4.417"
  LDAP_SERVER_SHOW_DELETED_OID_W = "1.2.840.113556.1.4.417"
  LDAP_SERVER_SHOW_RECYCLED_OID = "1.2.840.113556.1.4.2064"
  LDAP_SERVER_SHOW_RECYCLED_OID_W = "1.2.840.113556.1.4.2064"
  LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID = "1.2.840.113556.1.4.2211"
  LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID_W = "1.2.840.113556.1.4.2211"
  LDAP_SERVER_SEARCH_HINTS_OID = "1.2.840.113556.1.4.2206"
  LDAP_SERVER_SEARCH_HINTS_OID_W = "1.2.840.113556.1.4.2206"
  LDAP_SEARCH_HINT_INDEX_ONLY_OID = "1.2.840.113556.1.4.2207"
  LDAP_SEARCH_HINT_INDEX_ONLY_OID_W = "1.2.840.113556.1.4.2207"
  LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID = "1.2.840.113556.1.4.2210"
  LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID_W = "1.2.840.113556.1.4.2210"
  LDAP_SEARCH_HINT_REQUIRED_INDEX_OID = "1.2.840.113556.1.4.2306"
  LDAP_SEARCH_HINT_REQUIRED_INDEX_OID_W = "1.2.840.113556.1.4.2306"
  LDAP_SERVER_UPDATE_STATS_OID = "1.2.840.113556.1.4.2205"
  LDAP_SERVER_UPDATE_STATS_OID_W = "1.2.840.113556.1.4.2205"
  LDAP_UPDATE_STATS_USN_OID = "1.2.840.113556.1.4.2208"
  LDAP_UPDATE_STATS_USN_OID_W = "1.2.840.113556.1.4.2208"
  LDAP_UPDATE_STATS_INVOCATIONID_OID = "1.2.840.113556.1.4.2209"
  LDAP_UPDATE_STATS_INVOCATIONID_OID_W = "1.2.840.113556.1.4.2209"
  LDAP_SERVER_GET_STATS_OID = "1.2.840.113556.1.4.970"
  LDAP_SERVER_GET_STATS_OID_W = "1.2.840.113556.1.4.970"
  LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID = "1.2.840.113556.1.4.2065"
  LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID_W = "1.2.840.113556.1.4.2065"
  LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID = "1.2.840.113556.1.4.2066"
  LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID_W = "1.2.840.113556.1.4.2066"
  LDAP_SERVER_POLICY_HINTS_OID = "1.2.840.113556.1.4.2239"
  LDAP_SERVER_POLICY_HINTS_OID_W = "1.2.840.113556.1.4.2239"
  LDAP_SERVER_RANGE_OPTION_OID = "1.2.840.113556.1.4.802"
  LDAP_SERVER_RANGE_OPTION_OID_W = "1.2.840.113556.1.4.802"
  LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID = "1.2.840.113556.1.4.521"
  LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID_W = "1.2.840.113556.1.4.521"
  LDAP_SERVER_NOTIFICATION_OID = "1.2.840.113556.1.4.528"
  LDAP_SERVER_NOTIFICATION_OID_W = "1.2.840.113556.1.4.528"
  LDAP_SERVER_SHUTDOWN_NOTIFY_OID = "1.2.840.113556.1.4.1907"
  LDAP_SERVER_SHUTDOWN_NOTIFY_OID_W = "1.2.840.113556.1.4.1907"
  LDAP_SERVER_LAZY_COMMIT_OID = "1.2.840.113556.1.4.619"
  LDAP_SERVER_LAZY_COMMIT_OID_W = "1.2.840.113556.1.4.619"
  LDAP_SERVER_SD_FLAGS_OID = "1.2.840.113556.1.4.801"
  LDAP_SERVER_SD_FLAGS_OID_W = "1.2.840.113556.1.4.801"
  LDAP_SERVER_TREE_DELETE_EX_OID = "1.2.840.113556.1.4.2204"
  LDAP_SERVER_TREE_DELETE_EX_OID_W = "1.2.840.113556.1.4.2204"
  LDAP_SERVER_TREE_DELETE_OID = "1.2.840.113556.1.4.805"
  LDAP_SERVER_TREE_DELETE_OID_W = "1.2.840.113556.1.4.805"
  LDAP_SERVER_ASQ_OID = "1.2.840.113556.1.4.1504"
  LDAP_SERVER_ASQ_OID_W = "1.2.840.113556.1.4.1504"
  LDAP_SERVER_DIRSYNC_OID = "1.2.840.113556.1.4.841"
  LDAP_SERVER_DIRSYNC_OID_W = "1.2.840.113556.1.4.841"
  LDAP_SERVER_DIRSYNC_EX_OID = "1.2.840.113556.1.4.2090"
  LDAP_SERVER_DIRSYNC_EX_OID_W = "1.2.840.113556.1.4.2090"
  LDAP_SERVER_EXTENDED_DN_OID = "1.2.840.113556.1.4.529"
  LDAP_SERVER_EXTENDED_DN_OID_W = "1.2.840.113556.1.4.529"
  LDAP_SERVER_VERIFY_NAME_OID = "1.2.840.113556.1.4.1338"
  LDAP_SERVER_VERIFY_NAME_OID_W = "1.2.840.113556.1.4.1338"
  LDAP_SERVER_DOMAIN_SCOPE_OID = "1.2.840.113556.1.4.1339"
  LDAP_SERVER_DOMAIN_SCOPE_OID_W = "1.2.840.113556.1.4.1339"
  LDAP_SERVER_SEARCH_OPTIONS_OID = "1.2.840.113556.1.4.1340"
  LDAP_SERVER_SEARCH_OPTIONS_OID_W = "1.2.840.113556.1.4.1340"
  SERVER_SEARCH_FLAG_DOMAIN_SCOPE = 1_u32
  SERVER_SEARCH_FLAG_PHANTOM_ROOT = 2_u32
  LDAP_SERVER_QUOTA_CONTROL_OID = "1.2.840.113556.1.4.1852"
  LDAP_SERVER_QUOTA_CONTROL_OID_W = "1.2.840.113556.1.4.1852"
  LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID = "1.2.840.113556.1.4.1948"
  LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID_W = "1.2.840.113556.1.4.1948"
  LDAP_SERVER_DN_INPUT_OID = "1.2.840.113556.1.4.2026"
  LDAP_SERVER_DN_INPUT_OID_W = "1.2.840.113556.1.4.2026"
  LDAP_SERVER_SET_OWNER_OID = "1.2.840.113556.1.4.2255"
  LDAP_SERVER_SET_OWNER_OID_W = "1.2.840.113556.1.4.2255"
  LDAP_SERVER_BYPASS_QUOTA_OID = "1.2.840.113556.1.4.2256"
  LDAP_SERVER_BYPASS_QUOTA_OID_W = "1.2.840.113556.1.4.2256"
  LDAP_SERVER_LINK_TTL_OID = "1.2.840.113556.1.4.2309"
  LDAP_SERVER_LINK_TTL_OID_W = "1.2.840.113556.1.4.2309"
  LDAP_OPATT_BECOME_DOM_MASTER = "becomeDomainMaster"
  LDAP_OPATT_BECOME_DOM_MASTER_W = "becomeDomainMaster"
  LDAP_OPATT_BECOME_RID_MASTER = "becomeRidMaster"
  LDAP_OPATT_BECOME_RID_MASTER_W = "becomeRidMaster"
  LDAP_OPATT_BECOME_SCHEMA_MASTER = "becomeSchemaMaster"
  LDAP_OPATT_BECOME_SCHEMA_MASTER_W = "becomeSchemaMaster"
  LDAP_OPATT_RECALC_HIERARCHY = "recalcHierarchy"
  LDAP_OPATT_RECALC_HIERARCHY_W = "recalcHierarchy"
  LDAP_OPATT_SCHEMA_UPDATE_NOW = "schemaUpdateNow"
  LDAP_OPATT_SCHEMA_UPDATE_NOW_W = "schemaUpdateNow"
  LDAP_OPATT_BECOME_PDC = "becomePdc"
  LDAP_OPATT_BECOME_PDC_W = "becomePdc"
  LDAP_OPATT_FIXUP_INHERITANCE = "fixupInheritance"
  LDAP_OPATT_FIXUP_INHERITANCE_W = "fixupInheritance"
  LDAP_OPATT_INVALIDATE_RID_POOL = "invalidateRidPool"
  LDAP_OPATT_INVALIDATE_RID_POOL_W = "invalidateRidPool"
  LDAP_OPATT_ABANDON_REPL = "abandonReplication"
  LDAP_OPATT_ABANDON_REPL_W = "abandonReplication"
  LDAP_OPATT_DO_GARBAGE_COLLECTION = "doGarbageCollection"
  LDAP_OPATT_DO_GARBAGE_COLLECTION_W = "doGarbageCollection"
  LDAP_OPATT_SUBSCHEMA_SUBENTRY = "subschemaSubentry"
  LDAP_OPATT_SUBSCHEMA_SUBENTRY_W = "subschemaSubentry"
  LDAP_OPATT_CURRENT_TIME = "currentTime"
  LDAP_OPATT_CURRENT_TIME_W = "currentTime"
  LDAP_OPATT_SERVER_NAME = "serverName"
  LDAP_OPATT_SERVER_NAME_W = "serverName"
  LDAP_OPATT_NAMING_CONTEXTS = "namingContexts"
  LDAP_OPATT_NAMING_CONTEXTS_W = "namingContexts"
  LDAP_OPATT_DEFAULT_NAMING_CONTEXT = "defaultNamingContext"
  LDAP_OPATT_DEFAULT_NAMING_CONTEXT_W = "defaultNamingContext"
  LDAP_OPATT_SUPPORTED_CONTROL = "supportedControl"
  LDAP_OPATT_SUPPORTED_CONTROL_W = "supportedControl"
  LDAP_OPATT_HIGHEST_COMMITTED_USN = "highestCommitedUSN"
  LDAP_OPATT_HIGHEST_COMMITTED_USN_W = "highestCommitedUSN"
  LDAP_OPATT_SUPPORTED_LDAP_VERSION = "supportedLDAPVersion"
  LDAP_OPATT_SUPPORTED_LDAP_VERSION_W = "supportedLDAPVersion"
  LDAP_OPATT_SUPPORTED_LDAP_POLICIES = "supportedLDAPPolicies"
  LDAP_OPATT_SUPPORTED_LDAP_POLICIES_W = "supportedLDAPPolicies"
  LDAP_OPATT_SCHEMA_NAMING_CONTEXT = "schemaNamingContext"
  LDAP_OPATT_SCHEMA_NAMING_CONTEXT_W = "schemaNamingContext"
  LDAP_OPATT_CONFIG_NAMING_CONTEXT = "configurationNamingContext"
  LDAP_OPATT_CONFIG_NAMING_CONTEXT_W = "configurationNamingContext"
  LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT = "rootDomainNamingContext"
  LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT_W = "rootDomainNamingContext"
  LDAP_OPATT_SUPPORTED_SASL_MECHANISM = "supportedSASLMechanisms"
  LDAP_OPATT_SUPPORTED_SASL_MECHANISM_W = "supportedSASLMechanisms"
  LDAP_OPATT_DNS_HOST_NAME = "dnsHostName"
  LDAP_OPATT_DNS_HOST_NAME_W = "dnsHostName"
  LDAP_OPATT_LDAP_SERVICE_NAME = "ldapServiceName"
  LDAP_OPATT_LDAP_SERVICE_NAME_W = "ldapServiceName"
  LDAP_OPATT_DS_SERVICE_NAME = "dsServiceName"
  LDAP_OPATT_DS_SERVICE_NAME_W = "dsServiceName"
  LDAP_OPATT_SUPPORTED_CAPABILITIES = "supportedCapabilities"
  LDAP_OPATT_SUPPORTED_CAPABILITIES_W = "supportedCapabilities"
  LDAP_CAP_ACTIVE_DIRECTORY_OID = "1.2.840.113556.1.4.800"
  LDAP_CAP_ACTIVE_DIRECTORY_OID_W = "1.2.840.113556.1.4.800"
  LDAP_CAP_ACTIVE_DIRECTORY_V51_OID = "1.2.840.113556.1.4.1670"
  LDAP_CAP_ACTIVE_DIRECTORY_V51_OID_W = "1.2.840.113556.1.4.1670"
  LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID = "1.2.840.113556.1.4.1791"
  LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID_W = "1.2.840.113556.1.4.1791"
  LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID = "1.2.840.113556.1.4.1851"
  LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID_W = "1.2.840.113556.1.4.1851"
  LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID = "1.2.840.113556.1.4.1920"
  LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID_W = "1.2.840.113556.1.4.1920"
  LDAP_CAP_ACTIVE_DIRECTORY_V60_OID = "1.2.840.113556.1.4.1935"
  LDAP_CAP_ACTIVE_DIRECTORY_V60_OID_W = "1.2.840.113556.1.4.1935"
  LDAP_CAP_ACTIVE_DIRECTORY_V61_OID = "1.2.840.113556.1.4.1935"
  LDAP_CAP_ACTIVE_DIRECTORY_V61_OID_W = "1.2.840.113556.1.4.1935"
  LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID = "1.2.840.113556.1.4.2080"
  LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID_W = "1.2.840.113556.1.4.2080"
  LDAP_CAP_ACTIVE_DIRECTORY_W8_OID = "1.2.840.113556.1.4.2237"
  LDAP_CAP_ACTIVE_DIRECTORY_W8_OID_W = "1.2.840.113556.1.4.2237"
  LDAP_MATCHING_RULE_BIT_AND = "1.2.840.113556.1.4.803"
  LDAP_MATCHING_RULE_BIT_AND_W = "1.2.840.113556.1.4.803"
  LDAP_MATCHING_RULE_BIT_OR = "1.2.840.113556.1.4.804"
  LDAP_MATCHING_RULE_BIT_OR_W = "1.2.840.113556.1.4.804"
  LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION = "1.2.840.113556.1.4.1941"
  LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION_W = "1.2.840.113556.1.4.1941"
  LDAP_MATCHING_RULE_DN_BINARY_COMPLEX = "1.2.840.113556.1.4.2253"
  LDAP_MATCHING_RULE_DN_BINARY_COMPLEX_W = "1.2.840.113556.1.4.2253"
  LDAP_SERVER_FAST_BIND_OID = "1.2.840.113556.1.4.1781"
  LDAP_SERVER_FAST_BIND_OID_W = "1.2.840.113556.1.4.1781"
  LDAP_SERVER_WHO_AM_I_OID = "1.3.6.1.4.1.4203.1.11.3"
  LDAP_SERVER_WHO_AM_I_OID_W = "1.3.6.1.4.1.4203.1.11.3"
  LDAP_SERVER_BATCH_REQUEST_OID = "1.2.840.113556.1.4.2212"
  LDAP_SERVER_BATCH_REQUEST_OID_W = "1.2.840.113556.1.4.2212"
  LDAP_DIRSYNC_OBJECT_SECURITY = 1_u32
  LDAP_DIRSYNC_ANCESTORS_FIRST_ORDER = 2048_u32
  LDAP_DIRSYNC_PUBLIC_DATA_ONLY = 8192_u32
  LDAP_DIRSYNC_INCREMENTAL_VALUES = 2147483648_u32
  LDAP_DIRSYNC_ROPAS_DATA_ONLY = 1073741824_u32
  LDAP_POLICYHINT_APPLY_FULLPWDPOLICY = 1_u32

  enum LDAP_RETCODE
    LDAP_SUCCESS = 0_i32
    LDAP_OPERATIONS_ERROR = 1_i32
    LDAP_PROTOCOL_ERROR = 2_i32
    LDAP_TIMELIMIT_EXCEEDED = 3_i32
    LDAP_SIZELIMIT_EXCEEDED = 4_i32
    LDAP_COMPARE_FALSE = 5_i32
    LDAP_COMPARE_TRUE = 6_i32
    LDAP_AUTH_METHOD_NOT_SUPPORTED = 7_i32
    LDAP_STRONG_AUTH_REQUIRED = 8_i32
    LDAP_REFERRAL_V2 = 9_i32
    LDAP_PARTIAL_RESULTS = 9_i32
    LDAP_REFERRAL = 10_i32
    LDAP_ADMIN_LIMIT_EXCEEDED = 11_i32
    LDAP_UNAVAILABLE_CRIT_EXTENSION = 12_i32
    LDAP_CONFIDENTIALITY_REQUIRED = 13_i32
    LDAP_SASL_BIND_IN_PROGRESS = 14_i32
    LDAP_NO_SUCH_ATTRIBUTE = 16_i32
    LDAP_UNDEFINED_TYPE = 17_i32
    LDAP_INAPPROPRIATE_MATCHING = 18_i32
    LDAP_CONSTRAINT_VIOLATION = 19_i32
    LDAP_ATTRIBUTE_OR_VALUE_EXISTS = 20_i32
    LDAP_INVALID_SYNTAX = 21_i32
    LDAP_NO_SUCH_OBJECT = 32_i32
    LDAP_ALIAS_PROBLEM = 33_i32
    LDAP_INVALID_DN_SYNTAX = 34_i32
    LDAP_IS_LEAF = 35_i32
    LDAP_ALIAS_DEREF_PROBLEM = 36_i32
    LDAP_INAPPROPRIATE_AUTH = 48_i32
    LDAP_INVALID_CREDENTIALS = 49_i32
    LDAP_INSUFFICIENT_RIGHTS = 50_i32
    LDAP_BUSY = 51_i32
    LDAP_UNAVAILABLE = 52_i32
    LDAP_UNWILLING_TO_PERFORM = 53_i32
    LDAP_LOOP_DETECT = 54_i32
    LDAP_SORT_CONTROL_MISSING = 60_i32
    LDAP_OFFSET_RANGE_ERROR = 61_i32
    LDAP_NAMING_VIOLATION = 64_i32
    LDAP_OBJECT_CLASS_VIOLATION = 65_i32
    LDAP_NOT_ALLOWED_ON_NONLEAF = 66_i32
    LDAP_NOT_ALLOWED_ON_RDN = 67_i32
    LDAP_ALREADY_EXISTS = 68_i32
    LDAP_NO_OBJECT_CLASS_MODS = 69_i32
    LDAP_RESULTS_TOO_LARGE = 70_i32
    LDAP_AFFECTS_MULTIPLE_DSAS = 71_i32
    LDAP_VIRTUAL_LIST_VIEW_ERROR = 76_i32
    LDAP_OTHER = 80_i32
    LDAP_SERVER_DOWN = 81_i32
    LDAP_LOCAL_ERROR = 82_i32
    LDAP_ENCODING_ERROR = 83_i32
    LDAP_DECODING_ERROR = 84_i32
    LDAP_TIMEOUT = 85_i32
    LDAP_AUTH_UNKNOWN = 86_i32
    LDAP_FILTER_ERROR = 87_i32
    LDAP_USER_CANCELLED = 88_i32
    LDAP_PARAM_ERROR = 89_i32
    LDAP_NO_MEMORY = 90_i32
    LDAP_CONNECT_ERROR = 91_i32
    LDAP_NOT_SUPPORTED = 92_i32
    LDAP_NO_RESULTS_RETURNED = 94_i32
    LDAP_CONTROL_NOT_FOUND = 93_i32
    LDAP_MORE_RESULTS_TO_RETURN = 95_i32
    LDAP_CLIENT_LOOP = 96_i32
    LDAP_REFERRAL_LIMIT_EXCEEDED = 97_i32
  end

  @[Extern]
  struct Ldap
    property ld_sb : Ld_sb_e__struct_
    property ld_host : Win32cr::Foundation::PSTR
    property ld_version : UInt32
    property ld_lberoptions : UInt8
    property ld_deref : UInt32
    property ld_timelimit : UInt32
    property ld_sizelimit : UInt32
    property ld_errno : UInt32
    property ld_matched : Win32cr::Foundation::PSTR
    property ld_error : Win32cr::Foundation::PSTR
    property ld_msgid : UInt32
    property reserved3 : UInt8[25]
    property ld_cldaptries : UInt32
    property ld_cldaptimeout : UInt32
    property ld_refhoplimit : UInt32
    property ld_options : UInt32

    # Nested Type Ld_sb_e__struct_
    @[Extern]
    struct Ld_sb_e__struct_
    property sb_sd : LibC::UIntPtrT
    property reserved1 : UInt8[41]
    property sb_naddr : LibC::UIntPtrT
    property reserved2 : UInt8[24]
    def initialize(@sb_sd : LibC::UIntPtrT, @reserved1 : UInt8[41], @sb_naddr : LibC::UIntPtrT, @reserved2 : UInt8[24])
    end
    end

    def initialize(@ld_sb : Ld_sb_e__struct_, @ld_host : Win32cr::Foundation::PSTR, @ld_version : UInt32, @ld_lberoptions : UInt8, @ld_deref : UInt32, @ld_timelimit : UInt32, @ld_sizelimit : UInt32, @ld_errno : UInt32, @ld_matched : Win32cr::Foundation::PSTR, @ld_error : Win32cr::Foundation::PSTR, @ld_msgid : UInt32, @reserved3 : UInt8[25], @ld_cldaptries : UInt32, @ld_cldaptimeout : UInt32, @ld_refhoplimit : UInt32, @ld_options : UInt32)
    end
  end

  @[Extern]
  struct LDAP_TIMEVAL
    property tv_sec : Int32
    property tv_usec : Int32
    def initialize(@tv_sec : Int32, @tv_usec : Int32)
    end
  end

  @[Extern]
  struct LDAP_BERVAL
    property bv_len : UInt32
    property bv_val : Win32cr::Foundation::PSTR
    def initialize(@bv_len : UInt32, @bv_val : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct LDAPMessage
    property lm_msgid : UInt32
    property lm_msgtype : UInt32
    property lm_ber : Void*
    property lm_chain : Win32cr::Networking::Ldap::LDAPMessage*
    property lm_next : Win32cr::Networking::Ldap::LDAPMessage*
    property lm_time : UInt32
    property connection : Win32cr::Networking::Ldap::Ldap*
    property request : Void*
    property lm_returncode : UInt32
    property lm_referral : UInt16
    property lm_chased : Win32cr::Foundation::BOOLEAN
    property lm_eom : Win32cr::Foundation::BOOLEAN
    property connection_referenced : Win32cr::Foundation::BOOLEAN
    def initialize(@lm_msgid : UInt32, @lm_msgtype : UInt32, @lm_ber : Void*, @lm_chain : Win32cr::Networking::Ldap::LDAPMessage*, @lm_next : Win32cr::Networking::Ldap::LDAPMessage*, @lm_time : UInt32, @connection : Win32cr::Networking::Ldap::Ldap*, @request : Void*, @lm_returncode : UInt32, @lm_referral : UInt16, @lm_chased : Win32cr::Foundation::BOOLEAN, @lm_eom : Win32cr::Foundation::BOOLEAN, @connection_referenced : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct Ldapcontrola
    property ldctl_oid : Win32cr::Foundation::PSTR
    property ldctl_value : Win32cr::Networking::Ldap::LDAP_BERVAL
    property ldctl_iscritical : Win32cr::Foundation::BOOLEAN
    def initialize(@ldctl_oid : Win32cr::Foundation::PSTR, @ldctl_value : Win32cr::Networking::Ldap::LDAP_BERVAL, @ldctl_iscritical : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct Ldapcontrolw
    property ldctl_oid : Win32cr::Foundation::PWSTR
    property ldctl_value : Win32cr::Networking::Ldap::LDAP_BERVAL
    property ldctl_iscritical : Win32cr::Foundation::BOOLEAN
    def initialize(@ldctl_oid : Win32cr::Foundation::PWSTR, @ldctl_value : Win32cr::Networking::Ldap::LDAP_BERVAL, @ldctl_iscritical : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct Ldapmodw
    property mod_op : UInt32
    property mod_type : Win32cr::Foundation::PWSTR
    property mod_vals : Mod_vals_e__union_

    # Nested Type Mod_vals_e__union_
    @[Extern(union: true)]
    struct Mod_vals_e__union_
    property modv_strvals : Win32cr::Foundation::PWSTR*
    property modv_bvals : Win32cr::Networking::Ldap::LDAP_BERVAL**
    def initialize(@modv_strvals : Win32cr::Foundation::PWSTR*, @modv_bvals : Win32cr::Networking::Ldap::LDAP_BERVAL**)
    end
    end

    def initialize(@mod_op : UInt32, @mod_type : Win32cr::Foundation::PWSTR, @mod_vals : Mod_vals_e__union_)
    end
  end

  @[Extern]
  struct Ldapmoda
    property mod_op : UInt32
    property mod_type : Win32cr::Foundation::PSTR
    property mod_vals : Mod_vals_e__union_

    # Nested Type Mod_vals_e__union_
    @[Extern(union: true)]
    struct Mod_vals_e__union_
    property modv_strvals : Win32cr::Foundation::PSTR*
    property modv_bvals : Win32cr::Networking::Ldap::LDAP_BERVAL**
    def initialize(@modv_strvals : Win32cr::Foundation::PSTR*, @modv_bvals : Win32cr::Networking::Ldap::LDAP_BERVAL**)
    end
    end

    def initialize(@mod_op : UInt32, @mod_type : Win32cr::Foundation::PSTR, @mod_vals : Mod_vals_e__union_)
    end
  end

  @[Extern]
  struct Berelement
    property opaque : Win32cr::Foundation::PSTR
    def initialize(@opaque : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct Ldap_version_info
    property lv_size : UInt32
    property lv_major : UInt32
    property lv_minor : UInt32
    def initialize(@lv_size : UInt32, @lv_major : UInt32, @lv_minor : UInt32)
    end
  end

  @[Extern]
  struct Ldapapiinfoa
    property ldapai_info_version : Int32
    property ldapai_api_version : Int32
    property ldapai_protocol_version : Int32
    property ldapai_extensions : Int8**
    property ldapai_vendor_name : Win32cr::Foundation::PSTR
    property ldapai_vendor_version : Int32
    def initialize(@ldapai_info_version : Int32, @ldapai_api_version : Int32, @ldapai_protocol_version : Int32, @ldapai_extensions : Int8**, @ldapai_vendor_name : Win32cr::Foundation::PSTR, @ldapai_vendor_version : Int32)
    end
  end

  @[Extern]
  struct Ldapapiinfow
    property ldapai_info_version : Int32
    property ldapai_api_version : Int32
    property ldapai_protocol_version : Int32
    property ldapai_extensions : Win32cr::Foundation::PWSTR*
    property ldapai_vendor_name : Win32cr::Foundation::PWSTR
    property ldapai_vendor_version : Int32
    def initialize(@ldapai_info_version : Int32, @ldapai_api_version : Int32, @ldapai_protocol_version : Int32, @ldapai_extensions : Win32cr::Foundation::PWSTR*, @ldapai_vendor_name : Win32cr::Foundation::PWSTR, @ldapai_vendor_version : Int32)
    end
  end

  @[Extern]
  struct LDAPAPIFeatureInfoA
    property ldapaif_info_version : Int32
    property ldapaif_name : Win32cr::Foundation::PSTR
    property ldapaif_version : Int32
    def initialize(@ldapaif_info_version : Int32, @ldapaif_name : Win32cr::Foundation::PSTR, @ldapaif_version : Int32)
    end
  end

  @[Extern]
  struct LDAPAPIFeatureInfoW
    property ldapaif_info_version : Int32
    property ldapaif_name : Win32cr::Foundation::PWSTR
    property ldapaif_version : Int32
    def initialize(@ldapaif_info_version : Int32, @ldapaif_name : Win32cr::Foundation::PWSTR, @ldapaif_version : Int32)
    end
  end

  @[Extern]
  struct Ldapsearch
    def initialize()
    end
  end

  @[Extern]
  struct Ldapsortkeyw
    property sk_attrtype : Win32cr::Foundation::PWSTR
    property sk_matchruleoid : Win32cr::Foundation::PWSTR
    property sk_reverseorder : Win32cr::Foundation::BOOLEAN
    def initialize(@sk_attrtype : Win32cr::Foundation::PWSTR, @sk_matchruleoid : Win32cr::Foundation::PWSTR, @sk_reverseorder : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct Ldapsortkeya
    property sk_attrtype : Win32cr::Foundation::PSTR
    property sk_matchruleoid : Win32cr::Foundation::PSTR
    property sk_reverseorder : Win32cr::Foundation::BOOLEAN
    def initialize(@sk_attrtype : Win32cr::Foundation::PSTR, @sk_matchruleoid : Win32cr::Foundation::PSTR, @sk_reverseorder : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct Ldapvlvinfo
    property ldvlv_version : Int32
    property ldvlv_before_count : UInt32
    property ldvlv_after_count : UInt32
    property ldvlv_offset : UInt32
    property ldvlv_count : UInt32
    property ldvlv_attrvalue : Win32cr::Networking::Ldap::LDAP_BERVAL*
    property ldvlv_context : Win32cr::Networking::Ldap::LDAP_BERVAL*
    property ldvlv_extradata : Void*
    def initialize(@ldvlv_version : Int32, @ldvlv_before_count : UInt32, @ldvlv_after_count : UInt32, @ldvlv_offset : UInt32, @ldvlv_count : UInt32, @ldvlv_attrvalue : Win32cr::Networking::Ldap::LDAP_BERVAL*, @ldvlv_context : Win32cr::Networking::Ldap::LDAP_BERVAL*, @ldvlv_extradata : Void*)
    end
  end

  @[Extern]
  struct LDAP_REFERRAL_CALLBACK
    property size_of_callbacks : UInt32
    property query_for_connection : Win32cr::Networking::Ldap::QUERYFORCONNECTION
    property notify_routine : Win32cr::Networking::Ldap::NOTIFYOFNEWCONNECTION
    property dereference_routine : Win32cr::Networking::Ldap::DEREFERENCECONNECTION
    def initialize(@size_of_callbacks : UInt32, @query_for_connection : Win32cr::Networking::Ldap::QUERYFORCONNECTION, @notify_routine : Win32cr::Networking::Ldap::NOTIFYOFNEWCONNECTION, @dereference_routine : Win32cr::Networking::Ldap::DEREFERENCECONNECTION)
    end
  end

  @[Link("wldap32")]
  lib C
    fun ldap_openW(host_name : Win32cr::Foundation::PWSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_openA(host_name : Win32cr::Foundation::PSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_initW(host_name : Win32cr::Foundation::PWSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_initA(host_name : Win32cr::Foundation::PSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_sslinitW(host_name : Win32cr::Foundation::PWSTR, port_number : UInt32, secure : Int32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_sslinitA(host_name : Win32cr::Foundation::PSTR, port_number : UInt32, secure : Int32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_connect(ld : Win32cr::Networking::Ldap::Ldap*, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*) : UInt32

    fun ldap_open(host_name : Win32cr::Foundation::PSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_init(host_name : Win32cr::Foundation::PSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_sslinit(host_name : Win32cr::Foundation::PSTR, port_number : UInt32, secure : Int32) : Win32cr::Networking::Ldap::Ldap*

    fun cldap_openW(host_name : Win32cr::Foundation::PWSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun cldap_openA(host_name : Win32cr::Foundation::PSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun cldap_open(host_name : Win32cr::Foundation::PSTR, port_number : UInt32) : Win32cr::Networking::Ldap::Ldap*

    fun ldap_unbind(ld : Win32cr::Networking::Ldap::Ldap*) : UInt32

    fun ldap_unbind_s(ld : Win32cr::Networking::Ldap::Ldap*) : UInt32

    fun ldap_get_option(ld : Win32cr::Networking::Ldap::Ldap*, option : Int32, outvalue : Void*) : UInt32

    fun ldap_get_optionW(ld : Win32cr::Networking::Ldap::Ldap*, option : Int32, outvalue : Void*) : UInt32

    fun ldap_set_option(ld : Win32cr::Networking::Ldap::Ldap*, option : Int32, invalue : Void*) : UInt32

    fun ldap_set_optionW(ld : Win32cr::Networking::Ldap::Ldap*, option : Int32, invalue : Void*) : UInt32

    fun ldap_simple_bindW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_simple_bindA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, passwd : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_simple_bind_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, passwd : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_simple_bind_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, passwd : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_bindW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, cred : Win32cr::Foundation::PWSTR, method : UInt32) : UInt32

    fun ldap_bindA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, cred : Win32cr::Foundation::PSTR, method : UInt32) : UInt32

    fun ldap_bind_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, cred : Win32cr::Foundation::PWSTR, method : UInt32) : UInt32

    fun ldap_bind_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, cred : Win32cr::Foundation::PSTR, method : UInt32) : UInt32

    fun ldap_sasl_bindA(external_handle : Win32cr::Networking::Ldap::Ldap*, dist_name : Win32cr::Foundation::PSTR, auth_mechanism : Win32cr::Foundation::PSTR, cred : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_ctrls : Win32cr::Networking::Ldap::Ldapcontrola**, client_ctrls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : Int32*) : Int32

    fun ldap_sasl_bindW(external_handle : Win32cr::Networking::Ldap::Ldap*, dist_name : Win32cr::Foundation::PWSTR, auth_mechanism : Win32cr::Foundation::PWSTR, cred : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_ctrls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_ctrls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : Int32*) : Int32

    fun ldap_sasl_bind_sA(external_handle : Win32cr::Networking::Ldap::Ldap*, dist_name : Win32cr::Foundation::PSTR, auth_mechanism : Win32cr::Foundation::PSTR, cred : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_ctrls : Win32cr::Networking::Ldap::Ldapcontrola**, client_ctrls : Win32cr::Networking::Ldap::Ldapcontrola**, server_data : Win32cr::Networking::Ldap::LDAP_BERVAL**) : Int32

    fun ldap_sasl_bind_sW(external_handle : Win32cr::Networking::Ldap::Ldap*, dist_name : Win32cr::Foundation::PWSTR, auth_mechanism : Win32cr::Foundation::PWSTR, cred : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_ctrls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_ctrls : Win32cr::Networking::Ldap::Ldapcontrolw**, server_data : Win32cr::Networking::Ldap::LDAP_BERVAL**) : Int32

    fun ldap_simple_bind(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, passwd : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_simple_bind_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, passwd : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_bind(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, cred : Win32cr::Foundation::PSTR, method : UInt32) : UInt32

    fun ldap_bind_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, cred : Win32cr::Foundation::PSTR, method : UInt32) : UInt32

    fun ldap_searchW(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PWSTR, scope : UInt32, filter : Win32cr::Foundation::PWSTR, attrs : UInt16**, attrsonly : UInt32) : UInt32

    fun ldap_searchA(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32) : UInt32

    fun ldap_search_sW(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PWSTR, scope : UInt32, filter : Win32cr::Foundation::PWSTR, attrs : UInt16**, attrsonly : UInt32, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_sA(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_stW(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PWSTR, scope : UInt32, filter : Win32cr::Foundation::PWSTR, attrs : UInt16**, attrsonly : UInt32, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_stA(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_extW(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PWSTR, scope : UInt32, filter : Win32cr::Foundation::PWSTR, attrs : UInt16**, attrsonly : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, time_limit : UInt32, size_limit : UInt32, message_number : UInt32*) : UInt32

    fun ldap_search_extA(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, time_limit : UInt32, size_limit : UInt32, message_number : UInt32*) : UInt32

    fun ldap_search_ext_sW(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PWSTR, scope : UInt32, filter : Win32cr::Foundation::PWSTR, attrs : UInt16**, attrsonly : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, size_limit : UInt32, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_ext_sA(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, size_limit : UInt32, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32) : UInt32

    fun ldap_search_s(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_st(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_search_ext(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, time_limit : UInt32, size_limit : UInt32, message_number : UInt32*) : UInt32

    fun ldap_search_ext_s(ld : Win32cr::Networking::Ldap::Ldap*, base : Win32cr::Foundation::PSTR, scope : UInt32, filter : Win32cr::Foundation::PSTR, attrs : Int8**, attrsonly : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, size_limit : UInt32, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_check_filterW(ld : Win32cr::Networking::Ldap::Ldap*, search_filter : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_check_filterA(ld : Win32cr::Networking::Ldap::Ldap*, search_filter : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_modifyW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, mods : Win32cr::Networking::Ldap::Ldapmodw**) : UInt32

    fun ldap_modifyA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_modify_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, mods : Win32cr::Networking::Ldap::Ldapmodw**) : UInt32

    fun ldap_modify_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_modify_extW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, mods : Win32cr::Networking::Ldap::Ldapmodw**, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : UInt32*) : UInt32

    fun ldap_modify_extA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_modify_ext_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, mods : Win32cr::Networking::Ldap::Ldapmodw**, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_modify_ext_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_modify(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_modify_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_modify_ext(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_modify_ext_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, mods : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_modrdn2W(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PWSTR, new_distinguished_name : Win32cr::Foundation::PWSTR, delete_old_rdn : Int32) : UInt32

    fun ldap_modrdn2A(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR, delete_old_rdn : Int32) : UInt32

    fun ldap_modrdnW(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PWSTR, new_distinguished_name : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_modrdnA(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_modrdn2_sW(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PWSTR, new_distinguished_name : Win32cr::Foundation::PWSTR, delete_old_rdn : Int32) : UInt32

    fun ldap_modrdn2_sA(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR, delete_old_rdn : Int32) : UInt32

    fun ldap_modrdn_sW(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PWSTR, new_distinguished_name : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_modrdn_sA(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_modrdn2(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR, delete_old_rdn : Int32) : UInt32

    fun ldap_modrdn(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_modrdn2_s(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR, delete_old_rdn : Int32) : UInt32

    fun ldap_modrdn_s(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, new_distinguished_name : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_rename_extW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, new_rdn : Win32cr::Foundation::PWSTR, new_parent : Win32cr::Foundation::PWSTR, delete_old_rdn : Int32, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : UInt32*) : UInt32

    fun ldap_rename_extA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, new_rdn : Win32cr::Foundation::PSTR, new_parent : Win32cr::Foundation::PSTR, delete_old_rdn : Int32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_rename_ext_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, new_rdn : Win32cr::Foundation::PWSTR, new_parent : Win32cr::Foundation::PWSTR, delete_old_rdn : Int32, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_rename_ext_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, new_rdn : Win32cr::Foundation::PSTR, new_parent : Win32cr::Foundation::PSTR, delete_old_rdn : Int32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_rename_ext(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, new_rdn : Win32cr::Foundation::PSTR, new_parent : Win32cr::Foundation::PSTR, delete_old_rdn : Int32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_rename_ext_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, new_rdn : Win32cr::Foundation::PSTR, new_parent : Win32cr::Foundation::PSTR, delete_old_rdn : Int32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_addW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attrs : Win32cr::Networking::Ldap::Ldapmodw**) : UInt32

    fun ldap_addA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_add_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attrs : Win32cr::Networking::Ldap::Ldapmodw**) : UInt32

    fun ldap_add_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_add_extW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attrs : Win32cr::Networking::Ldap::Ldapmodw**, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : UInt32*) : UInt32

    fun ldap_add_extA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_add_ext_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attrs : Win32cr::Networking::Ldap::Ldapmodw**, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_add_ext_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_add(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_add_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**) : UInt32

    fun ldap_add_ext(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_add_ext_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attrs : Win32cr::Networking::Ldap::Ldapmoda**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_compareW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attr : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_compareA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_compare_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attr : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_compare_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_compare(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_compare_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_compare_extW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attr : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : UInt32*) : UInt32

    fun ldap_compare_extA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_compare_ext_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, attr : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_compare_ext_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_compare_ext(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_compare_ext_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, attr : Win32cr::Foundation::PSTR, value : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_deleteW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_deleteA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_delete_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR) : UInt32

    fun ldap_delete_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_delete_extW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : UInt32*) : UInt32

    fun ldap_delete_extA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_delete_ext_sW(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PWSTR, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_delete_ext_sA(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_delete(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_delete_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR) : UInt32

    fun ldap_delete_ext(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_delete_ext_s(ld : Win32cr::Networking::Ldap::Ldap*, dn : Win32cr::Foundation::PSTR, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_abandon(ld : Win32cr::Networking::Ldap::Ldap*, msgid : UInt32) : UInt32

    fun ldap_result(ld : Win32cr::Networking::Ldap::Ldap*, msgid : UInt32, all : UInt32, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, res : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_msgfree(res : Win32cr::Networking::Ldap::LDAPMessage*) : UInt32

    fun ldap_result2error(ld : Win32cr::Networking::Ldap::Ldap*, res : Win32cr::Networking::Ldap::LDAPMessage*, freeit : UInt32) : UInt32

    fun ldap_parse_resultW(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, return_code : UInt32*, matched_d_ns : Win32cr::Foundation::PWSTR*, error_message : Win32cr::Foundation::PWSTR*, referrals : UInt16***, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw***, freeit : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_parse_resultA(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, return_code : UInt32*, matched_d_ns : Win32cr::Foundation::PSTR*, error_message : Win32cr::Foundation::PSTR*, referrals : Int8***, server_controls : Win32cr::Networking::Ldap::Ldapcontrola***, freeit : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_parse_extended_resultA(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, result_oid : Win32cr::Foundation::PSTR*, result_data : Win32cr::Networking::Ldap::LDAP_BERVAL**, freeit : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_parse_extended_resultW(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, result_oid : Win32cr::Foundation::PWSTR*, result_data : Win32cr::Networking::Ldap::LDAP_BERVAL**, freeit : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_controls_freeA(controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_control_freeA(controls : Win32cr::Networking::Ldap::Ldapcontrola*) : UInt32

    fun ldap_controls_freeW(control : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_control_freeW(control : Win32cr::Networking::Ldap::Ldapcontrolw*) : UInt32

    fun ldap_free_controlsW(controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_free_controlsA(controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_parse_result(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, return_code : UInt32*, matched_d_ns : Win32cr::Foundation::PSTR*, error_message : Win32cr::Foundation::PSTR*, referrals : Win32cr::Foundation::PSTR**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola***, freeit : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_controls_free(controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_control_free(control : Win32cr::Networking::Ldap::Ldapcontrola*) : UInt32

    fun ldap_free_controls(controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_err2stringW(err : UInt32) : Win32cr::Foundation::PWSTR

    fun ldap_err2stringA(err : UInt32) : Win32cr::Foundation::PSTR

    fun ldap_err2string(err : UInt32) : Win32cr::Foundation::PSTR

    fun ldap_perror(ld : Win32cr::Networking::Ldap::Ldap*, msg : Win32cr::Foundation::PSTR) : Void

    fun ldap_first_entry(ld : Win32cr::Networking::Ldap::Ldap*, res : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Networking::Ldap::LDAPMessage*

    fun ldap_next_entry(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Networking::Ldap::LDAPMessage*

    fun ldap_count_entries(ld : Win32cr::Networking::Ldap::Ldap*, res : Win32cr::Networking::Ldap::LDAPMessage*) : UInt32

    fun ldap_first_attributeW(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, ptr : Win32cr::Networking::Ldap::Berelement**) : Win32cr::Foundation::PWSTR

    fun ldap_first_attributeA(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, ptr : Win32cr::Networking::Ldap::Berelement**) : Win32cr::Foundation::PSTR

    fun ldap_first_attribute(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, ptr : Win32cr::Networking::Ldap::Berelement**) : Win32cr::Foundation::PSTR

    fun ldap_next_attributeW(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, ptr : Win32cr::Networking::Ldap::Berelement*) : Win32cr::Foundation::PWSTR

    fun ldap_next_attributeA(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, ptr : Win32cr::Networking::Ldap::Berelement*) : Win32cr::Foundation::PSTR

    fun ldap_next_attribute(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, ptr : Win32cr::Networking::Ldap::Berelement*) : Win32cr::Foundation::PSTR

    fun ldap_get_valuesW(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, attr : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR*

    fun ldap_get_valuesA(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, attr : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PSTR*

    fun ldap_get_values(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*, attr : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PSTR*

    fun ldap_get_values_lenW(external_handle : Win32cr::Networking::Ldap::Ldap*, message : Win32cr::Networking::Ldap::LDAPMessage*, attr : Win32cr::Foundation::PWSTR) : Win32cr::Networking::Ldap::LDAP_BERVAL**

    fun ldap_get_values_lenA(external_handle : Win32cr::Networking::Ldap::Ldap*, message : Win32cr::Networking::Ldap::LDAPMessage*, attr : Win32cr::Foundation::PSTR) : Win32cr::Networking::Ldap::LDAP_BERVAL**

    fun ldap_get_values_len(external_handle : Win32cr::Networking::Ldap::Ldap*, message : Win32cr::Networking::Ldap::LDAPMessage*, attr : Win32cr::Foundation::PSTR) : Win32cr::Networking::Ldap::LDAP_BERVAL**

    fun ldap_count_valuesW(vals : Win32cr::Foundation::PWSTR*) : UInt32

    fun ldap_count_valuesA(vals : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_count_values(vals : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_count_values_len(vals : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_value_freeW(vals : Win32cr::Foundation::PWSTR*) : UInt32

    fun ldap_value_freeA(vals : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_value_free(vals : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_value_free_len(vals : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_get_dnW(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Foundation::PWSTR

    fun ldap_get_dnA(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Foundation::PSTR

    fun ldap_get_dn(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Foundation::PSTR

    fun ldap_explode_dnW(dn : Win32cr::Foundation::PWSTR, notypes : UInt32) : Win32cr::Foundation::PWSTR*

    fun ldap_explode_dnA(dn : Win32cr::Foundation::PSTR, notypes : UInt32) : Win32cr::Foundation::PSTR*

    fun ldap_explode_dn(dn : Win32cr::Foundation::PSTR, notypes : UInt32) : Win32cr::Foundation::PSTR*

    fun ldap_dn2ufnW(dn : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::PWSTR

    fun ldap_dn2ufnA(dn : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PSTR

    fun ldap_dn2ufn(dn : Win32cr::Foundation::PSTR) : Win32cr::Foundation::PSTR

    fun ldap_memfreeW(block : Win32cr::Foundation::PWSTR) : Void

    fun ldap_memfreeA(block : Win32cr::Foundation::PSTR) : Void

    fun ber_bvfree(bv : Win32cr::Networking::Ldap::LDAP_BERVAL*) : Void

    fun ldap_memfree(block : Win32cr::Foundation::PSTR) : Void

    fun ldap_ufn2dnW(ufn : Win32cr::Foundation::PWSTR, pDn : Win32cr::Foundation::PWSTR*) : UInt32

    fun ldap_ufn2dnA(ufn : Win32cr::Foundation::PSTR, pDn : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_ufn2dn(ufn : Win32cr::Foundation::PSTR, pDn : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_startup(version : Win32cr::Networking::Ldap::Ldap_version_info*, instance : Win32cr::Foundation::HANDLE*) : UInt32

    fun ldap_cleanup(hInstance : Win32cr::Foundation::HANDLE) : UInt32

    fun ldap_escape_filter_elementW(sourceFilterElement : Win32cr::Foundation::PSTR, sourceLength : UInt32, destFilterElement : Win32cr::Foundation::PWSTR, destLength : UInt32) : UInt32

    fun ldap_escape_filter_elementA(sourceFilterElement : Win32cr::Foundation::PSTR, sourceLength : UInt32, destFilterElement : Win32cr::Foundation::PSTR, destLength : UInt32) : UInt32

    fun ldap_escape_filter_element(sourceFilterElement : Win32cr::Foundation::PSTR, sourceLength : UInt32, destFilterElement : Win32cr::Foundation::PSTR, destLength : UInt32) : UInt32

    fun ldap_set_dbg_flags(new_flags : UInt32) : UInt32

    fun ldap_set_dbg_routine(debug_print_routine : Win32cr::Networking::Ldap::DBGPRINT) : Void

    fun LdapUTF8ToUnicode(lpSrcStr : UInt8*, cchSrc : Int32, lpDestStr : UInt16*, cchDest : Int32) : Int32

    fun LdapUnicodeToUTF8(lpSrcStr : UInt16*, cchSrc : Int32, lpDestStr : UInt8*, cchDest : Int32) : Int32

    fun ldap_create_sort_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeya**, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_create_sort_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeyw**, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_parse_sort_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, control : Win32cr::Networking::Ldap::Ldapcontrola**, result : UInt32*, attribute : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_parse_sort_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, control : Win32cr::Networking::Ldap::Ldapcontrolw**, result : UInt32*, attribute : Win32cr::Foundation::PWSTR*) : UInt32

    fun ldap_create_sort_control(external_handle : Win32cr::Networking::Ldap::Ldap*, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeya**, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_parse_sort_control(external_handle : Win32cr::Networking::Ldap::Ldap*, control : Win32cr::Networking::Ldap::Ldapcontrola**, result : UInt32*, attribute : Win32cr::Foundation::PSTR*) : UInt32

    fun ldap_encode_sort_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeyw**, control : Win32cr::Networking::Ldap::Ldapcontrolw*, criticality : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_encode_sort_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeya**, control : Win32cr::Networking::Ldap::Ldapcontrola*, criticality : Win32cr::Foundation::BOOLEAN) : UInt32

    fun ldap_create_page_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, page_size : UInt32, cookie : Win32cr::Networking::Ldap::LDAP_BERVAL*, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_create_page_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, page_size : UInt32, cookie : Win32cr::Networking::Ldap::LDAP_BERVAL*, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_parse_page_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, total_count : UInt32*, cookie : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_parse_page_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, total_count : UInt32*, cookie : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_create_page_control(external_handle : Win32cr::Networking::Ldap::Ldap*, page_size : UInt32, cookie : Win32cr::Networking::Ldap::LDAP_BERVAL*, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_parse_page_control(external_handle : Win32cr::Networking::Ldap::Ldap*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, total_count : UInt32*, cookie : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_search_init_pageW(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PWSTR, scope_of_search : UInt32, search_filter : Win32cr::Foundation::PWSTR, attribute_list : UInt16**, attributes_only : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, page_time_limit : UInt32, total_size_limit : UInt32, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeyw**) : Win32cr::Networking::Ldap::Ldapsearch*

    fun ldap_search_init_pageA(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, scope_of_search : UInt32, search_filter : Win32cr::Foundation::PSTR, attribute_list : Int8**, attributes_only : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, page_time_limit : UInt32, total_size_limit : UInt32, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeya**) : Win32cr::Networking::Ldap::Ldapsearch*

    fun ldap_search_init_page(external_handle : Win32cr::Networking::Ldap::Ldap*, distinguished_name : Win32cr::Foundation::PSTR, scope_of_search : UInt32, search_filter : Win32cr::Foundation::PSTR, attribute_list : Int8**, attributes_only : UInt32, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, page_time_limit : UInt32, total_size_limit : UInt32, sort_keys : Win32cr::Networking::Ldap::Ldapsortkeya**) : Win32cr::Networking::Ldap::Ldapsearch*

    fun ldap_get_next_page(external_handle : Win32cr::Networking::Ldap::Ldap*, search_handle : Win32cr::Networking::Ldap::Ldapsearch*, page_size : UInt32, message_number : UInt32*) : UInt32

    fun ldap_get_next_page_s(external_handle : Win32cr::Networking::Ldap::Ldap*, search_handle : Win32cr::Networking::Ldap::Ldapsearch*, timeout : Win32cr::Networking::Ldap::LDAP_TIMEVAL*, page_size : UInt32, total_count : UInt32*, results : Win32cr::Networking::Ldap::LDAPMessage**) : UInt32

    fun ldap_get_paged_count(external_handle : Win32cr::Networking::Ldap::Ldap*, search_block : Win32cr::Networking::Ldap::Ldapsearch*, total_count : UInt32*, results : Win32cr::Networking::Ldap::LDAPMessage*) : UInt32

    fun ldap_search_abandon_page(external_handle : Win32cr::Networking::Ldap::Ldap*, search_block : Win32cr::Networking::Ldap::Ldapsearch*) : UInt32

    fun ldap_create_vlv_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, vlv_info : Win32cr::Networking::Ldap::Ldapvlvinfo*, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrolw**) : Int32

    fun ldap_create_vlv_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, vlv_info : Win32cr::Networking::Ldap::Ldapvlvinfo*, is_critical : UInt8, control : Win32cr::Networking::Ldap::Ldapcontrola**) : Int32

    fun ldap_parse_vlv_controlW(external_handle : Win32cr::Networking::Ldap::Ldap*, control : Win32cr::Networking::Ldap::Ldapcontrolw**, target_pos : UInt32*, list_count : UInt32*, context : Win32cr::Networking::Ldap::LDAP_BERVAL**, err_code : Int32*) : Int32

    fun ldap_parse_vlv_controlA(external_handle : Win32cr::Networking::Ldap::Ldap*, control : Win32cr::Networking::Ldap::Ldapcontrola**, target_pos : UInt32*, list_count : UInt32*, context : Win32cr::Networking::Ldap::LDAP_BERVAL**, err_code : Int32*) : Int32

    fun ldap_start_tls_sW(external_handle : Win32cr::Networking::Ldap::Ldap*, server_return_value : UInt32*, result : Win32cr::Networking::Ldap::LDAPMessage**, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**) : UInt32

    fun ldap_start_tls_sA(external_handle : Win32cr::Networking::Ldap::Ldap*, server_return_value : UInt32*, result : Win32cr::Networking::Ldap::LDAPMessage**, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**) : UInt32

    fun ldap_stop_tls_s(external_handle : Win32cr::Networking::Ldap::Ldap*) : Win32cr::Foundation::BOOLEAN

    fun ldap_first_reference(ld : Win32cr::Networking::Ldap::Ldap*, res : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Networking::Ldap::LDAPMessage*

    fun ldap_next_reference(ld : Win32cr::Networking::Ldap::Ldap*, entry : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Networking::Ldap::LDAPMessage*

    fun ldap_count_references(ld : Win32cr::Networking::Ldap::Ldap*, res : Win32cr::Networking::Ldap::LDAPMessage*) : UInt32

    fun ldap_parse_referenceW(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, referrals : Win32cr::Foundation::PWSTR**) : UInt32

    fun ldap_parse_referenceA(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, referrals : Win32cr::Foundation::PSTR**) : UInt32

    fun ldap_parse_reference(connection : Win32cr::Networking::Ldap::Ldap*, result_message : Win32cr::Networking::Ldap::LDAPMessage*, referrals : Win32cr::Foundation::PSTR**) : UInt32

    fun ldap_extended_operationW(ld : Win32cr::Networking::Ldap::Ldap*, oid : Win32cr::Foundation::PWSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, message_number : UInt32*) : UInt32

    fun ldap_extended_operationA(ld : Win32cr::Networking::Ldap::Ldap*, oid : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_extended_operation_sA(external_handle : Win32cr::Networking::Ldap::Ldap*, oid : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, returned_oid : Win32cr::Foundation::PSTR*, returned_data : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_extended_operation_sW(external_handle : Win32cr::Networking::Ldap::Ldap*, oid : Win32cr::Foundation::PWSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, client_controls : Win32cr::Networking::Ldap::Ldapcontrolw**, returned_oid : Win32cr::Foundation::PWSTR*, returned_data : Win32cr::Networking::Ldap::LDAP_BERVAL**) : UInt32

    fun ldap_extended_operation(ld : Win32cr::Networking::Ldap::Ldap*, oid : Win32cr::Foundation::PSTR, data : Win32cr::Networking::Ldap::LDAP_BERVAL*, server_controls : Win32cr::Networking::Ldap::Ldapcontrola**, client_controls : Win32cr::Networking::Ldap::Ldapcontrola**, message_number : UInt32*) : UInt32

    fun ldap_close_extended_op(ld : Win32cr::Networking::Ldap::Ldap*, message_number : UInt32) : UInt32

    fun LdapGetLastError : UInt32

    fun LdapMapErrorToWin32(ldap_error : UInt32) : UInt32

    fun ldap_conn_from_msg(primary_conn : Win32cr::Networking::Ldap::Ldap*, res : Win32cr::Networking::Ldap::LDAPMessage*) : Win32cr::Networking::Ldap::Ldap*

    fun ber_init(pBerVal : Win32cr::Networking::Ldap::LDAP_BERVAL*) : Win32cr::Networking::Ldap::Berelement*

    fun ber_free(pBerElement : Win32cr::Networking::Ldap::Berelement*, fbuf : Int32) : Void

    fun ber_bvecfree(pBerVal : Win32cr::Networking::Ldap::LDAP_BERVAL**) : Void

    fun ber_bvdup(pBerVal : Win32cr::Networking::Ldap::LDAP_BERVAL*) : Win32cr::Networking::Ldap::LDAP_BERVAL*

    fun ber_alloc_t(options : Int32) : Win32cr::Networking::Ldap::Berelement*

    fun ber_skip_tag(pBerElement : Win32cr::Networking::Ldap::Berelement*, pLen : UInt32*) : UInt32

    fun ber_peek_tag(pBerElement : Win32cr::Networking::Ldap::Berelement*, pLen : UInt32*) : UInt32

    fun ber_first_element(pBerElement : Win32cr::Networking::Ldap::Berelement*, pLen : UInt32*, ppOpaque : Win32cr::Foundation::CHAR**) : UInt32

    fun ber_next_element(pBerElement : Win32cr::Networking::Ldap::Berelement*, pLen : UInt32*, opaque : Win32cr::Foundation::PSTR) : UInt32

    fun ber_flatten(pBerElement : Win32cr::Networking::Ldap::Berelement*, pBerVal : Win32cr::Networking::Ldap::LDAP_BERVAL**) : Int32

    fun ber_printf(pBerElement : Win32cr::Networking::Ldap::Berelement*, fmt : Win32cr::Foundation::PSTR) : Int32

    fun ber_scanf(pBerElement : Win32cr::Networking::Ldap::Berelement*, fmt : Win32cr::Foundation::PSTR) : UInt32

  end
end