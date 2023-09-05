require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dnsapi.dll")]
{% else %}
@[Link("dnsapi")]
{% end %}
lib LibWin32
  alias DnsContextHandle = LibC::IntPtrT

  SIZEOF_IP4_ADDRESS = 4_u32
  IP4_ADDRESS_STRING_LENGTH = 16_u32
  IP4_ADDRESS_STRING_BUFFER_LENGTH = 16_u32
  DNS_ADDR_MAX_SOCKADDR_LENGTH = 32_u32
  IP6_ADDRESS_STRING_LENGTH = 65_u32
  IP6_ADDRESS_STRING_BUFFER_LENGTH = 65_u32
  DNS_ADDRESS_STRING_LENGTH = 65_u32
  DNS_PORT_HOST_ORDER = 53_u32
  DNS_PORT_NET_ORDER = 13568_u32
  DNS_RFC_MAX_UDP_PACKET_LENGTH = 512_u32
  DNS_MAX_NAME_LENGTH = 255_u32
  DNS_MAX_LABEL_LENGTH = 63_u32
  DNS_MAX_NAME_BUFFER_LENGTH = 256_u32
  DNS_MAX_LABEL_BUFFER_LENGTH = 64_u32
  DNS_MAX_IP4_REVERSE_NAME_LENGTH = 31_u32
  DNS_MAX_IP6_REVERSE_NAME_LENGTH = 75_u32
  DNS_MAX_REVERSE_NAME_LENGTH = 75_u32
  DNS_MAX_IP4_REVERSE_NAME_BUFFER_LENGTH = 31_u32
  DNS_MAX_IP6_REVERSE_NAME_BUFFER_LENGTH = 75_u32
  DNS_MAX_REVERSE_NAME_BUFFER_LENGTH = 75_u32
  DNS_MAX_TEXT_STRING_LENGTH = 255_u32
  DNS_COMPRESSED_QUESTION_NAME = 49164_u32
  DNS_OPCODE_QUERY = 0_u32
  DNS_OPCODE_IQUERY = 1_u32
  DNS_OPCODE_SERVER_STATUS = 2_u32
  DNS_OPCODE_UNKNOWN = 3_u32
  DNS_OPCODE_NOTIFY = 4_u32
  DNS_OPCODE_UPDATE = 5_u32
  DNS_RCODE_NOERROR = 0_u32
  DNS_RCODE_FORMERR = 1_u32
  DNS_RCODE_SERVFAIL = 2_u32
  DNS_RCODE_NXDOMAIN = 3_u32
  DNS_RCODE_NOTIMPL = 4_u32
  DNS_RCODE_REFUSED = 5_u32
  DNS_RCODE_YXDOMAIN = 6_u32
  DNS_RCODE_YXRRSET = 7_u32
  DNS_RCODE_NXRRSET = 8_u32
  DNS_RCODE_NOTAUTH = 9_u32
  DNS_RCODE_NOTZONE = 10_u32
  DNS_RCODE_MAX = 15_u32
  DNS_RCODE_BADVERS = 16_u32
  DNS_RCODE_BADSIG = 16_u32
  DNS_RCODE_BADKEY = 17_u32
  DNS_RCODE_BADTIME = 18_u32
  DNS_RCODE_NO_ERROR = 0_u32
  DNS_RCODE_FORMAT_ERROR = 1_u32
  DNS_RCODE_SERVER_FAILURE = 2_u32
  DNS_RCODE_NAME_ERROR = 3_u32
  DNS_RCODE_NOT_IMPLEMENTED = 4_u32
  DNS_CLASS_INTERNET = 1_u32
  DNS_CLASS_CSNET = 2_u32
  DNS_CLASS_CHAOS = 3_u32
  DNS_CLASS_HESIOD = 4_u32
  DNS_CLASS_NONE = 254_u32
  DNS_CLASS_ALL = 255_u32
  DNS_CLASS_ANY = 255_u32
  DNS_CLASS_UNICAST_RESPONSE = 32768_u32
  DNS_RCLASS_INTERNET = 256_u32
  DNS_RCLASS_CSNET = 512_u32
  DNS_RCLASS_CHAOS = 768_u32
  DNS_RCLASS_HESIOD = 1024_u32
  DNS_RCLASS_NONE = 65024_u32
  DNS_RCLASS_ALL = 65280_u32
  DNS_RCLASS_ANY = 65280_u32
  DNS_RCLASS_UNICAST_RESPONSE = 128_u32
  DNS_TYPE_ZERO = 0_u32
  DNS_TYPE_A = 1_u32
  DNS_TYPE_NS = 2_u32
  DNS_TYPE_MD = 3_u32
  DNS_TYPE_MF = 4_u32
  DNS_TYPE_CNAME = 5_u32
  DNS_TYPE_SOA = 6_u32
  DNS_TYPE_MB = 7_u32
  DNS_TYPE_MG = 8_u32
  DNS_TYPE_MR = 9_u32
  DNS_TYPE_NULL = 10_u32
  DNS_TYPE_WKS = 11_u32
  DNS_TYPE_PTR = 12_u32
  DNS_TYPE_HINFO = 13_u32
  DNS_TYPE_MINFO = 14_u32
  DNS_TYPE_MX = 15_u32
  DNS_TYPE_TEXT = 16_u32
  DNS_TYPE_RP = 17_u32
  DNS_TYPE_AFSDB = 18_u32
  DNS_TYPE_X25 = 19_u32
  DNS_TYPE_ISDN = 20_u32
  DNS_TYPE_RT = 21_u32
  DNS_TYPE_NSAP = 22_u32
  DNS_TYPE_NSAPPTR = 23_u32
  DNS_TYPE_SIG = 24_u32
  DNS_TYPE_KEY = 25_u32
  DNS_TYPE_PX = 26_u32
  DNS_TYPE_GPOS = 27_u32
  DNS_TYPE_AAAA = 28_u32
  DNS_TYPE_LOC = 29_u32
  DNS_TYPE_NXT = 30_u32
  DNS_TYPE_EID = 31_u32
  DNS_TYPE_NIMLOC = 32_u32
  DNS_TYPE_SRV = 33_u32
  DNS_TYPE_ATMA = 34_u32
  DNS_TYPE_NAPTR = 35_u32
  DNS_TYPE_KX = 36_u32
  DNS_TYPE_CERT = 37_u32
  DNS_TYPE_A6 = 38_u32
  DNS_TYPE_DNAME = 39_u32
  DNS_TYPE_SINK = 40_u32
  DNS_TYPE_OPT = 41_u32
  DNS_TYPE_DS = 43_u32
  DNS_TYPE_RRSIG = 46_u32
  DNS_TYPE_NSEC = 47_u32
  DNS_TYPE_DNSKEY = 48_u32
  DNS_TYPE_DHCID = 49_u32
  DNS_TYPE_NSEC3 = 50_u32
  DNS_TYPE_NSEC3PARAM = 51_u32
  DNS_TYPE_TLSA = 52_u32
  DNS_TYPE_UINFO = 100_u32
  DNS_TYPE_UID = 101_u32
  DNS_TYPE_GID = 102_u32
  DNS_TYPE_UNSPEC = 103_u32
  DNS_TYPE_ADDRS = 248_u32
  DNS_TYPE_TKEY = 249_u32
  DNS_TYPE_TSIG = 250_u32
  DNS_TYPE_IXFR = 251_u32
  DNS_TYPE_AXFR = 252_u32
  DNS_TYPE_MAILB = 253_u32
  DNS_TYPE_MAILA = 254_u32
  DNS_TYPE_ALL = 255_u32
  DNS_TYPE_ANY = 255_u32
  DNS_TYPE_WINS = 65281_u32
  DNS_TYPE_WINSR = 65282_u32
  DNS_TYPE_NBSTAT = 65282_u32
  DNS_RTYPE_A = 256_u32
  DNS_RTYPE_NS = 512_u32
  DNS_RTYPE_MD = 768_u32
  DNS_RTYPE_MF = 1024_u32
  DNS_RTYPE_CNAME = 1280_u32
  DNS_RTYPE_SOA = 1536_u32
  DNS_RTYPE_MB = 1792_u32
  DNS_RTYPE_MG = 2048_u32
  DNS_RTYPE_MR = 2304_u32
  DNS_RTYPE_NULL = 2560_u32
  DNS_RTYPE_WKS = 2816_u32
  DNS_RTYPE_PTR = 3072_u32
  DNS_RTYPE_HINFO = 3328_u32
  DNS_RTYPE_MINFO = 3584_u32
  DNS_RTYPE_MX = 3840_u32
  DNS_RTYPE_TEXT = 4096_u32
  DNS_RTYPE_RP = 4352_u32
  DNS_RTYPE_AFSDB = 4608_u32
  DNS_RTYPE_X25 = 4864_u32
  DNS_RTYPE_ISDN = 5120_u32
  DNS_RTYPE_RT = 5376_u32
  DNS_RTYPE_NSAP = 5632_u32
  DNS_RTYPE_NSAPPTR = 5888_u32
  DNS_RTYPE_SIG = 6144_u32
  DNS_RTYPE_KEY = 6400_u32
  DNS_RTYPE_PX = 6656_u32
  DNS_RTYPE_GPOS = 6912_u32
  DNS_RTYPE_AAAA = 7168_u32
  DNS_RTYPE_LOC = 7424_u32
  DNS_RTYPE_NXT = 7680_u32
  DNS_RTYPE_EID = 7936_u32
  DNS_RTYPE_NIMLOC = 8192_u32
  DNS_RTYPE_SRV = 8448_u32
  DNS_RTYPE_ATMA = 8704_u32
  DNS_RTYPE_NAPTR = 8960_u32
  DNS_RTYPE_KX = 9216_u32
  DNS_RTYPE_CERT = 9472_u32
  DNS_RTYPE_A6 = 9728_u32
  DNS_RTYPE_DNAME = 9984_u32
  DNS_RTYPE_SINK = 10240_u32
  DNS_RTYPE_OPT = 10496_u32
  DNS_RTYPE_DS = 11008_u32
  DNS_RTYPE_RRSIG = 11776_u32
  DNS_RTYPE_NSEC = 12032_u32
  DNS_RTYPE_DNSKEY = 12288_u32
  DNS_RTYPE_DHCID = 12544_u32
  DNS_RTYPE_NSEC3 = 12800_u32
  DNS_RTYPE_NSEC3PARAM = 13056_u32
  DNS_RTYPE_TLSA = 13312_u32
  DNS_RTYPE_UINFO = 25600_u32
  DNS_RTYPE_UID = 25856_u32
  DNS_RTYPE_GID = 26112_u32
  DNS_RTYPE_UNSPEC = 26368_u32
  DNS_RTYPE_TKEY = 63744_u32
  DNS_RTYPE_TSIG = 64000_u32
  DNS_RTYPE_IXFR = 64256_u32
  DNS_RTYPE_AXFR = 64512_u32
  DNS_RTYPE_MAILB = 64768_u32
  DNS_RTYPE_MAILA = 65024_u32
  DNS_RTYPE_ALL = 65280_u32
  DNS_RTYPE_ANY = 65280_u32
  DNS_RTYPE_WINS = 511_u32
  DNS_RTYPE_WINSR = 767_u32
  DNS_ATMA_FORMAT_E164 = 1_u32
  DNS_ATMA_FORMAT_AESA = 2_u32
  DNS_ATMA_MAX_ADDR_LENGTH = 20_u32
  DNS_ATMA_AESA_ADDR_LENGTH = 20_u32
  DNS_ATMA_MAX_RECORD_LENGTH = 21_u32
  DNSSEC_ALGORITHM_RSAMD5 = 1_u32
  DNSSEC_ALGORITHM_RSASHA1 = 5_u32
  DNSSEC_ALGORITHM_RSASHA1_NSEC3 = 7_u32
  DNSSEC_ALGORITHM_RSASHA256 = 8_u32
  DNSSEC_ALGORITHM_RSASHA512 = 10_u32
  DNSSEC_ALGORITHM_ECDSAP256_SHA256 = 13_u32
  DNSSEC_ALGORITHM_ECDSAP384_SHA384 = 14_u32
  DNSSEC_ALGORITHM_NULL = 253_u32
  DNSSEC_ALGORITHM_PRIVATE = 254_u32
  DNSSEC_DIGEST_ALGORITHM_SHA1 = 1_u32
  DNSSEC_DIGEST_ALGORITHM_SHA256 = 2_u32
  DNSSEC_DIGEST_ALGORITHM_SHA384 = 4_u32
  DNSSEC_PROTOCOL_NONE = 0_u32
  DNSSEC_PROTOCOL_TLS = 1_u32
  DNSSEC_PROTOCOL_EMAIL = 2_u32
  DNSSEC_PROTOCOL_DNSSEC = 3_u32
  DNSSEC_PROTOCOL_IPSEC = 4_u32
  DNSSEC_KEY_FLAG_NOAUTH = 1_u32
  DNSSEC_KEY_FLAG_NOCONF = 2_u32
  DNSSEC_KEY_FLAG_FLAG2 = 4_u32
  DNSSEC_KEY_FLAG_EXTEND = 8_u32
  DNSSEC_KEY_FLAG_FLAG4 = 16_u32
  DNSSEC_KEY_FLAG_FLAG5 = 32_u32
  DNSSEC_KEY_FLAG_USER = 0_u32
  DNSSEC_KEY_FLAG_ZONE = 64_u32
  DNSSEC_KEY_FLAG_HOST = 128_u32
  DNSSEC_KEY_FLAG_NTPE3 = 192_u32
  DNSSEC_KEY_FLAG_FLAG8 = 256_u32
  DNSSEC_KEY_FLAG_FLAG9 = 512_u32
  DNSSEC_KEY_FLAG_FLAG10 = 1024_u32
  DNSSEC_KEY_FLAG_FLAG11 = 2048_u32
  DNSSEC_KEY_FLAG_SIG0 = 0_u32
  DNSSEC_KEY_FLAG_SIG1 = 4096_u32
  DNSSEC_KEY_FLAG_SIG2 = 8192_u32
  DNSSEC_KEY_FLAG_SIG3 = 12288_u32
  DNSSEC_KEY_FLAG_SIG4 = 16384_u32
  DNSSEC_KEY_FLAG_SIG5 = 20480_u32
  DNSSEC_KEY_FLAG_SIG6 = 24576_u32
  DNSSEC_KEY_FLAG_SIG7 = 28672_u32
  DNSSEC_KEY_FLAG_SIG8 = 32768_u32
  DNSSEC_KEY_FLAG_SIG9 = 36864_u32
  DNSSEC_KEY_FLAG_SIG10 = 40960_u32
  DNSSEC_KEY_FLAG_SIG11 = 45056_u32
  DNSSEC_KEY_FLAG_SIG12 = 49152_u32
  DNSSEC_KEY_FLAG_SIG13 = 53248_u32
  DNSSEC_KEY_FLAG_SIG14 = 57344_u32
  DNSSEC_KEY_FLAG_SIG15 = 61440_u32
  DNS_TKEY_MODE_SERVER_ASSIGN = 1_u32
  DNS_TKEY_MODE_DIFFIE_HELLMAN = 2_u32
  DNS_TKEY_MODE_GSS = 3_u32
  DNS_TKEY_MODE_RESOLVER_ASSIGN = 4_u32
  DNS_WINS_FLAG_SCOPE = 2147483648_u32
  DNS_WINS_FLAG_LOCAL = 65536_u32
  DNS_CONFIG_FLAG_ALLOC = 1_u32
  DNSREC_SECTION = 3_u32
  DNSREC_QUESTION = 0_u32
  DNSREC_ANSWER = 1_u32
  DNSREC_AUTHORITY = 2_u32
  DNSREC_ADDITIONAL = 3_u32
  DNSREC_ZONE = 0_u32
  DNSREC_PREREQ = 1_u32
  DNSREC_UPDATE = 2_u32
  DNSREC_DELETE = 4_u32
  DNSREC_NOEXIST = 4_u32
  DNS_QUERY_STANDARD = 0_u32
  DNS_QUERY_ACCEPT_TRUNCATED_RESPONSE = 1_u32
  DNS_QUERY_USE_TCP_ONLY = 2_u32
  DNS_QUERY_NO_RECURSION = 4_u32
  DNS_QUERY_BYPASS_CACHE = 8_u32
  DNS_QUERY_NO_WIRE_QUERY = 16_u32
  DNS_QUERY_NO_LOCAL_NAME = 32_u32
  DNS_QUERY_NO_HOSTS_FILE = 64_u32
  DNS_QUERY_NO_NETBT = 128_u32
  DNS_QUERY_WIRE_ONLY = 256_u32
  DNS_QUERY_RETURN_MESSAGE = 512_u32
  DNS_QUERY_MULTICAST_ONLY = 1024_u32
  DNS_QUERY_NO_MULTICAST = 2048_u32
  DNS_QUERY_TREAT_AS_FQDN = 4096_u32
  DNS_QUERY_ADDRCONFIG = 8192_u32
  DNS_QUERY_DUAL_ADDR = 16384_u32
  DNS_QUERY_DONT_RESET_TTL_VALUES = 1048576_u32
  DNS_QUERY_DISABLE_IDN_ENCODING = 2097152_u32
  DNS_QUERY_APPEND_MULTILABEL = 8388608_u32
  DNS_QUERY_DNSSEC_OK = 16777216_u32
  DNS_QUERY_DNSSEC_CHECKING_DISABLED = 33554432_u32
  DNS_QUERY_RESERVED = 4026531840_u32
  DNS_QUERY_CACHE_ONLY = 16_u32
  DNS_QUERY_REQUEST_VERSION1 = 1_u32
  DNS_QUERY_REQUEST_VERSION2 = 2_u32
  DNS_QUERY_RESULTS_VERSION1 = 1_u32
  DNS_QUERY_REQUEST_VERSION3 = 3_u32
  DNS_CUSTOM_SERVER_TYPE_UDP = 1_u32
  DNS_CUSTOM_SERVER_TYPE_DOH = 2_u32
  DNS_CUSTOM_SERVER_UDP_FALLBACK = 1_u32
  DNS_APP_SETTINGS_VERSION1 = 1_u32
  DNS_APP_SETTINGS_EXCLUSIVE_SERVERS = 1_u32
  DNS_UPDATE_SECURITY_USE_DEFAULT = 0_u32
  DNS_UPDATE_SECURITY_OFF = 16_u32
  DNS_UPDATE_SECURITY_ON = 32_u32
  DNS_UPDATE_SECURITY_ONLY = 256_u32
  DNS_UPDATE_CACHE_SECURITY_CONTEXT = 512_u32
  DNS_UPDATE_TEST_USE_LOCAL_SYS_ACCT = 1024_u32
  DNS_UPDATE_FORCE_SECURITY_NEGO = 2048_u32
  DNS_UPDATE_TRY_ALL_MASTER_SERVERS = 4096_u32
  DNS_UPDATE_SKIP_NO_UPDATE_ADAPTERS = 8192_u32
  DNS_UPDATE_REMOTE_SERVER = 16384_u32
  DNS_UPDATE_RESERVED = 4294901760_u32
  DNS_VALSVR_ERROR_INVALID_ADDR = 1_u32
  DNS_VALSVR_ERROR_INVALID_NAME = 2_u32
  DNS_VALSVR_ERROR_UNREACHABLE = 3_u32
  DNS_VALSVR_ERROR_NO_RESPONSE = 4_u32
  DNS_VALSVR_ERROR_NO_AUTH = 5_u32
  DNS_VALSVR_ERROR_REFUSED = 6_u32
  DNS_VALSVR_ERROR_NO_TCP = 16_u32
  DNS_VALSVR_ERROR_UNKNOWN = 255_u32
  DNS_CONNECTION_NAME_MAX_LENGTH = 64_u32
  DNS_CONNECTION_PROXY_INFO_CURRENT_VERSION = 1_u32
  DNS_CONNECTION_PROXY_INFO_SERVER_MAX_LENGTH = 256_u32
  DNS_CONNECTION_PROXY_INFO_FRIENDLY_NAME_MAX_LENGTH = 64_u32
  DNS_CONNECTION_PROXY_INFO_USERNAME_MAX_LENGTH = 128_u32
  DNS_CONNECTION_PROXY_INFO_PASSWORD_MAX_LENGTH = 128_u32
  DNS_CONNECTION_PROXY_INFO_EXCEPTION_MAX_LENGTH = 1024_u32
  DNS_CONNECTION_PROXY_INFO_EXTRA_INFO_MAX_LENGTH = 1024_u32
  DNS_CONNECTION_PROXY_INFO_FLAG_DISABLED = 1_u32
  DNS_CONNECTION_PROXY_INFO_FLAG_BYPASSLOCAL = 2_u32
  DNS_CONNECTION_POLICY_ENTRY_ONDEMAND = 1_u32

  alias DNS_PROXY_COMPLETION_ROUTINE = Proc(Void*, Int32, Void)
  alias PDNS_QUERY_COMPLETION_ROUTINE = Proc(Void*, DNS_QUERY_RESULT*, Void)
  alias PDNS_SERVICE_BROWSE_CALLBACK = Proc(UInt32, Void*, DNS_RECORDA*, Void)
  alias PDNS_SERVICE_RESOLVE_COMPLETE = Proc(UInt32, Void*, DNS_SERVICE_INSTANCE*, Void)
  alias PDNS_SERVICE_REGISTER_COMPLETE = Proc(UInt32, Void*, DNS_SERVICE_INSTANCE*, Void)
  alias PMDNS_QUERY_CALLBACK = Proc(Void*, MDNS_QUERY_HANDLE*, DNS_QUERY_RESULT*, Void)


  enum DNS_CONFIG_TYPE : Int32
    DnsConfigPrimaryDomainName_W = 0
    DnsConfigPrimaryDomainName_A = 1
    DnsConfigPrimaryDomainName_UTF8 = 2
    DnsConfigAdapterDomainName_W = 3
    DnsConfigAdapterDomainName_A = 4
    DnsConfigAdapterDomainName_UTF8 = 5
    DnsConfigDnsServerList = 6
    DnsConfigSearchList = 7
    DnsConfigAdapterInfo = 8
    DnsConfigPrimaryHostNameRegistrationEnabled = 9
    DnsConfigAdapterHostNameRegistrationEnabled = 10
    DnsConfigAddressRegistrationMaxCount = 11
    DnsConfigHostName_W = 12
    DnsConfigHostName_A = 13
    DnsConfigHostName_UTF8 = 14
    DnsConfigFullHostName_W = 15
    DnsConfigFullHostName_A = 16
    DnsConfigFullHostName_UTF8 = 17
    DnsConfigNameServer = 18
  end

  enum DNS_SECTION : Int32
    DnsSectionQuestion = 0
    DnsSectionAnswer = 1
    DnsSectionAuthority = 2
    DnsSectionAddtional = 3
  end

  enum DNS_PROXY_INFORMATION_TYPE : Int32
    DNS_PROXY_INFORMATION_DIRECT = 0
    DNS_PROXY_INFORMATION_DEFAULT_SETTINGS = 1
    DNS_PROXY_INFORMATION_PROXY_NAME = 2
    DNS_PROXY_INFORMATION_DOES_NOT_EXIST = 3
  end

  enum DNS_CHARSET : Int32
    DnsCharSetUnknown = 0
    DnsCharSetUnicode = 1
    DnsCharSetUtf8 = 2
    DnsCharSetAnsi = 3
  end

  enum DNS_FREE_TYPE : Int32
    DnsFreeFlat = 0
    DnsFreeRecordList = 1
    DnsFreeParsedMessageFields = 2
  end

  enum DNS_NAME_FORMAT : Int32
    DnsNameDomain = 0
    DnsNameDomainLabel = 1
    DnsNameHostnameFull = 2
    DnsNameHostnameLabel = 3
    DnsNameWildcard = 4
    DnsNameSrvRecord = 5
    DnsNameValidateTld = 6
  end

  enum DNS_CONNECTION_PROXY_TYPE : Int32
    DNS_CONNECTION_PROXY_TYPE_NULL = 0
    DNS_CONNECTION_PROXY_TYPE_HTTP = 1
    DNS_CONNECTION_PROXY_TYPE_WAP = 2
    DNS_CONNECTION_PROXY_TYPE_SOCKS4 = 4
    DNS_CONNECTION_PROXY_TYPE_SOCKS5 = 5
  end

  enum DNS_CONNECTION_PROXY_INFO_SWITCH : Int32
    DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG = 0
    DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT = 1
    DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD = 2
  end

  enum DNS_CONNECTION_POLICY_TAG : Int32
    TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT = 0
    TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER = 1
    TAG_DNS_CONNECTION_POLICY_TAG_WWWPT = 2
  end

  union IP6_ADDRESS
    ip6_qword : UInt64[2]*
    ip6_dword : UInt32[4]*
    ip6_word : UInt16[8]*
    ip6_byte : UInt8[16]*
  end
  union DNS_ADDR_Data_e__Union
    dns_addr_user_dword : UInt32[8]*
  end
  union DNS_RECORDW_Flags_e__Union
    dw : UInt32
    s : DNS_RECORD_FLAGS
  end
  union DNS_RECORDW_Data_e__Union
    a : DNS_A_DATA
    _soa : DNS_SOA_DATAW
    soa : DNS_SOA_DATAW
    _ptr : DNS_PTR_DATAW
    ptr : DNS_PTR_DATAW
    _ns : DNS_PTR_DATAW
    ns : DNS_PTR_DATAW
    _cname : DNS_PTR_DATAW
    cname : DNS_PTR_DATAW
    _dname : DNS_PTR_DATAW
    dname : DNS_PTR_DATAW
    _mb : DNS_PTR_DATAW
    mb : DNS_PTR_DATAW
    _md : DNS_PTR_DATAW
    md : DNS_PTR_DATAW
    _mf : DNS_PTR_DATAW
    mf : DNS_PTR_DATAW
    _mg : DNS_PTR_DATAW
    mg : DNS_PTR_DATAW
    _mr : DNS_PTR_DATAW
    mr : DNS_PTR_DATAW
    _minfo : DNS_MINFO_DATAW
    minfo : DNS_MINFO_DATAW
    _rp : DNS_MINFO_DATAW
    rp : DNS_MINFO_DATAW
    _mx : DNS_MX_DATAW
    mx : DNS_MX_DATAW
    _afsdb : DNS_MX_DATAW
    afsdb : DNS_MX_DATAW
    _rt : DNS_MX_DATAW
    rt : DNS_MX_DATAW
    _hinfo : DNS_TXT_DATAW
    hinfo : DNS_TXT_DATAW
    _isdn : DNS_TXT_DATAW
    isdn : DNS_TXT_DATAW
    _txt : DNS_TXT_DATAW
    txt : DNS_TXT_DATAW
    x25 : DNS_TXT_DATAW
    null : DNS_NULL_DATA
    _wks : DNS_WKS_DATA
    wks : DNS_WKS_DATA
    aaaa : DNS_AAAA_DATA
    _key : DNS_KEY_DATA
    key : DNS_KEY_DATA
    _sig : DNS_SIG_DATAW
    sig : DNS_SIG_DATAW
    _atma : DNS_ATMA_DATA
    atma : DNS_ATMA_DATA
    _nxt : DNS_NXT_DATAW
    nxt : DNS_NXT_DATAW
    _srv : DNS_SRV_DATAW
    srv : DNS_SRV_DATAW
    _naptr : DNS_NAPTR_DATAW
    naptr : DNS_NAPTR_DATAW
    _opt : DNS_OPT_DATA
    opt : DNS_OPT_DATA
    _ds : DNS_DS_DATA
    ds : DNS_DS_DATA
    _rrsig : DNS_SIG_DATAW
    rrsig : DNS_SIG_DATAW
    _nsec : DNS_NSEC_DATAW
    nsec : DNS_NSEC_DATAW
    _dnskey : DNS_KEY_DATA
    dnskey : DNS_KEY_DATA
    _tkey : DNS_TKEY_DATAW
    tkey : DNS_TKEY_DATAW
    _tsig : DNS_TSIG_DATAW
    tsig : DNS_TSIG_DATAW
    _wins : DNS_WINS_DATA
    wins : DNS_WINS_DATA
    winsr : DNS_WINSR_DATAW
    wins_r : DNS_WINSR_DATAW
    _nbstat : DNS_WINSR_DATAW
    nbstat : DNS_WINSR_DATAW
    dhcid : DNS_DHCID_DATA
    _nsec3 : DNS_NSEC3_DATA
    nsec3 : DNS_NSEC3_DATA
    _nsec3_param : DNS_NSEC3PARAM_DATA
    nsec3_param : DNS_NSEC3PARAM_DATA
    _tlsa : DNS_TLSA_DATA
    tlsa : DNS_TLSA_DATA
    _unknown : DNS_UNKNOWN_DATA
    unknown : DNS_UNKNOWN_DATA
    p_data_ptr : UInt8*
  end
  union DnsRecordOptW_Flags_e__Union
    dw : UInt32
    s : DNS_RECORD_FLAGS
  end
  union DnsRecordOptW_Data_e__Union
    _opt : DNS_OPT_DATA
    opt : DNS_OPT_DATA
  end
  union DNS_RECORDA_Flags_e__Union
    dw : UInt32
    s : DNS_RECORD_FLAGS
  end
  union DNS_RECORDA_Data_e__Union
    a : DNS_A_DATA
    _soa : DNS_SOA_DATAA
    soa : DNS_SOA_DATAA
    _ptr : DNS_PTR_DATAA
    ptr : DNS_PTR_DATAA
    _ns : DNS_PTR_DATAA
    ns : DNS_PTR_DATAA
    _cname : DNS_PTR_DATAA
    cname : DNS_PTR_DATAA
    _dname : DNS_PTR_DATAA
    dname : DNS_PTR_DATAA
    _mb : DNS_PTR_DATAA
    mb : DNS_PTR_DATAA
    _md : DNS_PTR_DATAA
    md : DNS_PTR_DATAA
    _mf : DNS_PTR_DATAA
    mf : DNS_PTR_DATAA
    _mg : DNS_PTR_DATAA
    mg : DNS_PTR_DATAA
    _mr : DNS_PTR_DATAA
    mr : DNS_PTR_DATAA
    _minfo : DNS_MINFO_DATAA
    minfo : DNS_MINFO_DATAA
    _rp : DNS_MINFO_DATAA
    rp : DNS_MINFO_DATAA
    _mx : DNS_MX_DATAA
    mx : DNS_MX_DATAA
    _afsdb : DNS_MX_DATAA
    afsdb : DNS_MX_DATAA
    _rt : DNS_MX_DATAA
    rt : DNS_MX_DATAA
    _hinfo : DNS_TXT_DATAA
    hinfo : DNS_TXT_DATAA
    _isdn : DNS_TXT_DATAA
    isdn : DNS_TXT_DATAA
    _txt : DNS_TXT_DATAA
    txt : DNS_TXT_DATAA
    x25 : DNS_TXT_DATAA
    null : DNS_NULL_DATA
    _wks : DNS_WKS_DATA
    wks : DNS_WKS_DATA
    aaaa : DNS_AAAA_DATA
    _key : DNS_KEY_DATA
    key : DNS_KEY_DATA
    _sig : DNS_SIG_DATAA
    sig : DNS_SIG_DATAA
    _atma : DNS_ATMA_DATA
    atma : DNS_ATMA_DATA
    _nxt : DNS_NXT_DATAA
    nxt : DNS_NXT_DATAA
    _srv : DNS_SRV_DATAA
    srv : DNS_SRV_DATAA
    _naptr : DNS_NAPTR_DATAA
    naptr : DNS_NAPTR_DATAA
    _opt : DNS_OPT_DATA
    opt : DNS_OPT_DATA
    _ds : DNS_DS_DATA
    ds : DNS_DS_DATA
    _rrsig : DNS_SIG_DATAA
    rrsig : DNS_SIG_DATAA
    _nsec : DNS_NSEC_DATAA
    nsec : DNS_NSEC_DATAA
    _dnskey : DNS_KEY_DATA
    dnskey : DNS_KEY_DATA
    _tkey : DNS_TKEY_DATAA
    tkey : DNS_TKEY_DATAA
    _tsig : DNS_TSIG_DATAA
    tsig : DNS_TSIG_DATAA
    _wins : DNS_WINS_DATA
    wins : DNS_WINS_DATA
    winsr : DNS_WINSR_DATAA
    wins_r : DNS_WINSR_DATAA
    _nbstat : DNS_WINSR_DATAA
    nbstat : DNS_WINSR_DATAA
    dhcid : DNS_DHCID_DATA
    _nsec3 : DNS_NSEC3_DATA
    nsec3 : DNS_NSEC3_DATA
    _nsec3_param : DNS_NSEC3PARAM_DATA
    nsec3_param : DNS_NSEC3PARAM_DATA
    _tlsa : DNS_TLSA_DATA
    tlsa : DNS_TLSA_DATA
    _unknown : DNS_UNKNOWN_DATA
    unknown : DNS_UNKNOWN_DATA
    p_data_ptr : UInt8*
  end
  union DnsRecordOptA_Flags_e__Union
    dw : UInt32
    s : DNS_RECORD_FLAGS
  end
  union DnsRecordOptA_Data_e__Union
    _opt : DNS_OPT_DATA
    opt : DNS_OPT_DATA
  end
  union DNS_CUSTOM_SERVER_Anonymous1_e__Union
    pwsz_template : LibC::LPWSTR
  end
  union DNS_CUSTOM_SERVER_Anonymous2_e__Union
    max_sa : CHAR[32]*
  end
  union DNS_CONNECTION_PROXY_INFO_Anonymous_e__Union
    config : DNS_CONNECTION_PROXY_INFO_Anonymous_e__Union_DNS_CONNECTION_PROXY_INFO_CONFIG
    script : DNS_CONNECTION_PROXY_INFO_Anonymous_e__Union_DNS_CONNECTION_PROXY_INFO_SCRIPT
  end
  union DNS_SERVICE_BROWSE_REQUEST_Anonymous_e__Union
    p_browse_callback : PDNS_SERVICE_BROWSE_CALLBACK
    p_browse_callback_v2 : PDNS_QUERY_COMPLETION_ROUTINE
  end

  struct IP4_ARRAY
    addr_count : UInt32
    addr_array : UInt32[0]*
  end
  struct DNS_ADDR
    max_sa : CHAR[32]*
    data : DNS_ADDR_Data_e__Union
  end
  struct DNS_ADDR_ARRAY
    max_count : UInt32
    addr_count : UInt32
    tag : UInt32
    family : UInt16
    word_reserved : UInt16
    flags : UInt32
    match_flag : UInt32
    reserved1 : UInt32
    reserved2 : UInt32
    addr_array : DNS_ADDR[0]*
  end
  struct DNS_HEADER
    xid : UInt16
    _bitfield1 : UInt8
    _bitfield2 : UInt8
    question_count : UInt16
    answer_count : UInt16
    name_server_count : UInt16
    additional_count : UInt16
  end
  struct DNS_HEADER_EXT
    _bitfield : UInt16
    ch_rcode : UInt8
    ch_version : UInt8
  end
  struct DNS_WIRE_QUESTION
    question_type : UInt16
    question_class : UInt16
  end
  struct DNS_WIRE_RECORD
    record_type : UInt16
    record_class : UInt16
    time_to_live : UInt32
    data_length : UInt16
  end
  struct DNS_A_DATA
    ip_address : UInt32
  end
  struct DNS_PTR_DATAW
    p_name_host : LibC::LPWSTR
  end
  struct DNS_PTR_DATAA
    p_name_host : PSTR
  end
  struct DNS_SOA_DATAW
    p_name_primary_server : LibC::LPWSTR
    p_name_administrator : LibC::LPWSTR
    dw_serial_no : UInt32
    dw_refresh : UInt32
    dw_retry : UInt32
    dw_expire : UInt32
    dw_default_ttl : UInt32
  end
  struct DNS_SOA_DATAA
    p_name_primary_server : PSTR
    p_name_administrator : PSTR
    dw_serial_no : UInt32
    dw_refresh : UInt32
    dw_retry : UInt32
    dw_expire : UInt32
    dw_default_ttl : UInt32
  end
  struct DNS_MINFO_DATAW
    p_name_mailbox : LibC::LPWSTR
    p_name_errors_mailbox : LibC::LPWSTR
  end
  struct DNS_MINFO_DATAA
    p_name_mailbox : PSTR
    p_name_errors_mailbox : PSTR
  end
  struct DNS_MX_DATAW
    p_name_exchange : LibC::LPWSTR
    w_preference : UInt16
    pad : UInt16
  end
  struct DNS_MX_DATAA
    p_name_exchange : PSTR
    w_preference : UInt16
    pad : UInt16
  end
  struct DNS_TXT_DATAW
    dw_string_count : UInt32
    p_string_array : LibC::LPWSTR[0]*
  end
  struct DNS_TXT_DATAA
    dw_string_count : UInt32
    p_string_array : PSTR[0]*
  end
  struct DNS_NULL_DATA
    dw_byte_count : UInt32
    data : UInt8[0]*
  end
  struct DNS_WKS_DATA
    ip_address : UInt32
    ch_protocol : UInt8
    bit_mask : UInt8[0]*
  end
  struct DNS_AAAA_DATA
    ip6_address : IP6_ADDRESS
  end
  struct DNS_SIG_DATAW
    w_type_covered : UInt16
    ch_algorithm : UInt8
    ch_label_count : UInt8
    dw_original_ttl : UInt32
    dw_expiration : UInt32
    dw_time_signed : UInt32
    w_key_tag : UInt16
    w_signature_length : UInt16
    p_name_signer : LibC::LPWSTR
    signature : UInt8[0]*
  end
  struct DNS_SIG_DATAA
    w_type_covered : UInt16
    ch_algorithm : UInt8
    ch_label_count : UInt8
    dw_original_ttl : UInt32
    dw_expiration : UInt32
    dw_time_signed : UInt32
    w_key_tag : UInt16
    w_signature_length : UInt16
    p_name_signer : PSTR
    signature : UInt8[0]*
  end
  struct DNS_KEY_DATA
    w_flags : UInt16
    ch_protocol : UInt8
    ch_algorithm : UInt8
    w_key_length : UInt16
    w_pad : UInt16
    key : UInt8[0]*
  end
  struct DNS_DHCID_DATA
    dw_byte_count : UInt32
    dhcid : UInt8[0]*
  end
  struct DNS_NSEC_DATAW
    p_next_domain_name : LibC::LPWSTR
    w_type_bit_maps_length : UInt16
    w_pad : UInt16
    type_bit_maps : UInt8[0]*
  end
  struct DNS_NSEC_DATAA
    p_next_domain_name : PSTR
    w_type_bit_maps_length : UInt16
    w_pad : UInt16
    type_bit_maps : UInt8[0]*
  end
  struct DNS_NSEC3_DATA
    ch_algorithm : UInt8
    b_flags : UInt8
    w_iterations : UInt16
    b_salt_length : UInt8
    b_hash_length : UInt8
    w_type_bit_maps_length : UInt16
    ch_data : UInt8[0]*
  end
  struct DNS_NSEC3PARAM_DATA
    ch_algorithm : UInt8
    b_flags : UInt8
    w_iterations : UInt16
    b_salt_length : UInt8
    b_pad : UInt8[3]*
    pb_salt : UInt8[0]*
  end
  struct DNS_TLSA_DATA
    b_cert_usage : UInt8
    b_selector : UInt8
    b_matching_type : UInt8
    b_certificate_association_data_length : UInt16
    b_pad : UInt8[3]*
    b_certificate_association_data : UInt8[0]*
  end
  struct DNS_DS_DATA
    w_key_tag : UInt16
    ch_algorithm : UInt8
    ch_digest_type : UInt8
    w_digest_length : UInt16
    w_pad : UInt16
    digest : UInt8[0]*
  end
  struct DNS_OPT_DATA
    w_data_length : UInt16
    w_pad : UInt16
    data : UInt8[0]*
  end
  struct DNS_LOC_DATA
    w_version : UInt16
    w_size : UInt16
    w_hor_prec : UInt16
    w_ver_prec : UInt16
    dw_latitude : UInt32
    dw_longitude : UInt32
    dw_altitude : UInt32
  end
  struct DNS_NXT_DATAW
    p_name_next : LibC::LPWSTR
    w_num_types : UInt16
    w_types : UInt16[0]*
  end
  struct DNS_NXT_DATAA
    p_name_next : PSTR
    w_num_types : UInt16
    w_types : UInt16[0]*
  end
  struct DNS_SRV_DATAW
    p_name_target : LibC::LPWSTR
    w_priority : UInt16
    w_weight : UInt16
    w_port : UInt16
    pad : UInt16
  end
  struct DNS_SRV_DATAA
    p_name_target : PSTR
    w_priority : UInt16
    w_weight : UInt16
    w_port : UInt16
    pad : UInt16
  end
  struct DNS_NAPTR_DATAW
    w_order : UInt16
    w_preference : UInt16
    p_flags : LibC::LPWSTR
    p_service : LibC::LPWSTR
    p_regular_expression : LibC::LPWSTR
    p_replacement : LibC::LPWSTR
  end
  struct DNS_NAPTR_DATAA
    w_order : UInt16
    w_preference : UInt16
    p_flags : PSTR
    p_service : PSTR
    p_regular_expression : PSTR
    p_replacement : PSTR
  end
  struct DNS_ATMA_DATA
    address_type : UInt8
    address : UInt8[20]*
  end
  struct DNS_TKEY_DATAW
    p_name_algorithm : LibC::LPWSTR
    p_algorithm_packet : UInt8*
    p_key : UInt8*
    p_other_data : UInt8*
    dw_create_time : UInt32
    dw_expire_time : UInt32
    w_mode : UInt16
    w_error : UInt16
    w_key_length : UInt16
    w_other_length : UInt16
    c_alg_name_length : UInt8
    b_packet_pointers : LibC::BOOL
  end
  struct DNS_TKEY_DATAA
    p_name_algorithm : PSTR
    p_algorithm_packet : UInt8*
    p_key : UInt8*
    p_other_data : UInt8*
    dw_create_time : UInt32
    dw_expire_time : UInt32
    w_mode : UInt16
    w_error : UInt16
    w_key_length : UInt16
    w_other_length : UInt16
    c_alg_name_length : UInt8
    b_packet_pointers : LibC::BOOL
  end
  struct DNS_TSIG_DATAW
    p_name_algorithm : LibC::LPWSTR
    p_algorithm_packet : UInt8*
    p_signature : UInt8*
    p_other_data : UInt8*
    i64_create_time : Int64
    w_fudge_time : UInt16
    w_original_xid : UInt16
    w_error : UInt16
    w_sig_length : UInt16
    w_other_length : UInt16
    c_alg_name_length : UInt8
    b_packet_pointers : LibC::BOOL
  end
  struct DNS_TSIG_DATAA
    p_name_algorithm : PSTR
    p_algorithm_packet : UInt8*
    p_signature : UInt8*
    p_other_data : UInt8*
    i64_create_time : Int64
    w_fudge_time : UInt16
    w_original_xid : UInt16
    w_error : UInt16
    w_sig_length : UInt16
    w_other_length : UInt16
    c_alg_name_length : UInt8
    b_packet_pointers : LibC::BOOL
  end
  struct DNS_UNKNOWN_DATA
    dw_byte_count : UInt32
    b_data : UInt8[0]*
  end
  struct DNS_WINS_DATA
    dw_mapping_flag : UInt32
    dw_lookup_timeout : UInt32
    dw_cache_timeout : UInt32
    c_wins_server_count : UInt32
    wins_servers : UInt32[0]*
  end
  struct DNS_WINSR_DATAW
    dw_mapping_flag : UInt32
    dw_lookup_timeout : UInt32
    dw_cache_timeout : UInt32
    p_name_result_domain : LibC::LPWSTR
  end
  struct DNS_WINSR_DATAA
    dw_mapping_flag : UInt32
    dw_lookup_timeout : UInt32
    dw_cache_timeout : UInt32
    p_name_result_domain : PSTR
  end
  struct DNS_RECORD_FLAGS
    _bitfield : UInt32
  end
  struct DNS_RECORDW
    p_next : DNS_RECORDW*
    p_name : LibC::LPWSTR
    w_type : UInt16
    w_data_length : UInt16
    flags : DNS_RECORDW_Flags_e__Union
    dw_ttl : UInt32
    dw_reserved : UInt32
    data : DNS_RECORDW_Data_e__Union
  end
  struct DnsRecordOptW
    p_next : DNS_RECORDW*
    p_name : LibC::LPWSTR
    w_type : UInt16
    w_data_length : UInt16
    flags : DnsRecordOptW_Flags_e__Union
    ext_header : DNS_HEADER_EXT
    w_payload_size : UInt16
    w_reserved : UInt16
    data : DnsRecordOptW_Data_e__Union
  end
  struct DNS_RECORDA
    p_next : DNS_RECORDA*
    p_name : PSTR
    w_type : UInt16
    w_data_length : UInt16
    flags : DNS_RECORDA_Flags_e__Union
    dw_ttl : UInt32
    dw_reserved : UInt32
    data : DNS_RECORDA_Data_e__Union
  end
  struct DnsRecordOptA
    p_next : DNS_RECORDA*
    p_name : PSTR
    w_type : UInt16
    w_data_length : UInt16
    flags : DnsRecordOptA_Flags_e__Union
    ext_header : DNS_HEADER_EXT
    w_payload_size : UInt16
    w_reserved : UInt16
    data : DnsRecordOptA_Data_e__Union
  end
  struct DNS_RRSET
    p_first_rr : DNS_RECORDA*
    p_last_rr : DNS_RECORDA*
  end
  struct DNS_PROXY_INFORMATION
    version : UInt32
    proxy_information_type : DNS_PROXY_INFORMATION_TYPE
    proxy_name : LibC::LPWSTR
  end
  struct DNS_QUERY_RESULT
    version : UInt32
    query_status : Int32
    query_options : UInt64
    p_query_records : DNS_RECORDA*
    reserved : Void*
  end
  struct DNS_QUERY_REQUEST
    version : UInt32
    query_name : LibC::LPWSTR
    query_type : UInt16
    query_options : UInt64
    p_dns_server_list : DNS_ADDR_ARRAY*
    interface_index : UInt32
    p_query_completion_callback : PDNS_QUERY_COMPLETION_ROUTINE
    p_query_context : Void*
  end
  struct DNS_QUERY_CANCEL
    reserved : CHAR[32]*
  end
  struct DNS_CUSTOM_SERVER
    dw_server_type : UInt32
    ull_flags : UInt64
    anonymous1 : DNS_CUSTOM_SERVER_Anonymous1_e__Union
    anonymous2 : DNS_CUSTOM_SERVER_Anonymous2_e__Union
  end
  struct DNS_QUERY_REQUEST3
    version : UInt32
    query_name : LibC::LPWSTR
    query_type : UInt16
    query_options : UInt64
    p_dns_server_list : DNS_ADDR_ARRAY*
    interface_index : UInt32
    p_query_completion_callback : PDNS_QUERY_COMPLETION_ROUTINE
    p_query_context : Void*
    is_network_query_required : LibC::BOOL
    required_network_index : UInt32
    c_custom_servers : UInt32
    p_custom_servers : DNS_CUSTOM_SERVER*
  end
  struct DNS_APPLICATION_SETTINGS
    version : UInt32
    flags : UInt64
  end
  struct DNS_MESSAGE_BUFFER
    message_head : DNS_HEADER
    message_body : CHAR[0]*
  end
  struct DNS_CONNECTION_PROXY_INFO
    version : UInt32
    pwsz_friendly_name : LibC::LPWSTR
    flags : UInt32
    switch : DNS_CONNECTION_PROXY_INFO_SWITCH
    anonymous : DNS_CONNECTION_PROXY_INFO_Anonymous_e__Union
  end
  struct DNS_CONNECTION_PROXY_INFO_Anonymous_e__Union_DNS_CONNECTION_PROXY_INFO_SCRIPT
    pwsz_script : LibC::LPWSTR
    pwsz_username : LibC::LPWSTR
    pwsz_password : LibC::LPWSTR
  end
  struct DNS_CONNECTION_PROXY_INFO_Anonymous_e__Union_DNS_CONNECTION_PROXY_INFO_CONFIG
    pwsz_server : LibC::LPWSTR
    pwsz_username : LibC::LPWSTR
    pwsz_password : LibC::LPWSTR
    pwsz_exception : LibC::LPWSTR
    pwsz_extra_info : LibC::LPWSTR
    port : UInt16
  end
  struct DNS_CONNECTION_PROXY_INFO_EX
    proxy_info : DNS_CONNECTION_PROXY_INFO
    dw_interface_index : UInt32
    pwsz_connection_name : LibC::LPWSTR
    f_direct_configuration : LibC::BOOL
    h_connection : LibC::HANDLE
  end
  struct DNS_CONNECTION_PROXY_ELEMENT
    type : DNS_CONNECTION_PROXY_TYPE
    info : DNS_CONNECTION_PROXY_INFO
  end
  struct DNS_CONNECTION_PROXY_LIST
    c_proxies : UInt32
    p_proxies : DNS_CONNECTION_PROXY_ELEMENT*
  end
  struct DNS_CONNECTION_NAME
    wsz_name : Char[65]*
  end
  struct DNS_CONNECTION_NAME_LIST
    c_names : UInt32
    p_names : DNS_CONNECTION_NAME*
  end
  struct DNS_CONNECTION_IFINDEX_ENTRY
    pwsz_connection_name : LibC::LPWSTR
    dw_if_index : UInt32
  end
  struct DNS_CONNECTION_IFINDEX_LIST
    p_connection_if_index_entries : DNS_CONNECTION_IFINDEX_ENTRY*
    n_entries : UInt32
  end
  struct DNS_CONNECTION_POLICY_ENTRY
    pwsz_host : LibC::LPWSTR
    pwsz_app_id : LibC::LPWSTR
    cb_app_sid : UInt32
    pb_app_sid : UInt8*
    n_connections : UInt32
    ppwsz_connections : LibC::LPWSTR*
    dw_policy_entry_flags : UInt32
  end
  struct DNS_CONNECTION_POLICY_ENTRY_LIST
    p_policy_entries : DNS_CONNECTION_POLICY_ENTRY*
    n_entries : UInt32
  end
  struct DNS_SERVICE_INSTANCE
    psz_instance_name : LibC::LPWSTR
    psz_host_name : LibC::LPWSTR
    ip4_address : UInt32*
    ip6_address : IP6_ADDRESS*
    w_port : UInt16
    w_priority : UInt16
    w_weight : UInt16
    dw_property_count : UInt32
    keys : LibC::LPWSTR*
    values : LibC::LPWSTR*
    dw_interface_index : UInt32
  end
  struct DNS_SERVICE_CANCEL
    reserved : Void*
  end
  struct DNS_SERVICE_BROWSE_REQUEST
    version : UInt32
    interface_index : UInt32
    query_name : LibC::LPWSTR
    anonymous : DNS_SERVICE_BROWSE_REQUEST_Anonymous_e__Union
    p_query_context : Void*
  end
  struct DNS_SERVICE_RESOLVE_REQUEST
    version : UInt32
    interface_index : UInt32
    query_name : LibC::LPWSTR
    p_resolve_completion_callback : PDNS_SERVICE_RESOLVE_COMPLETE
    p_query_context : Void*
  end
  struct DNS_SERVICE_REGISTER_REQUEST
    version : UInt32
    interface_index : UInt32
    p_service_instance : DNS_SERVICE_INSTANCE*
    p_register_completion_callback : PDNS_SERVICE_REGISTER_COMPLETE
    p_query_context : Void*
    h_credentials : LibC::HANDLE
    unicast_enabled : LibC::BOOL
  end
  struct MDNS_QUERY_HANDLE
    name_buf : Char[256]*
    w_type : UInt16
    p_subscription : Void*
    p_wnf_callback_params : Void*
    state_name_data : UInt32[2]*
  end
  struct MDNS_QUERY_REQUEST
    version : UInt32
    ul_ref_count : UInt32
    query : LibC::LPWSTR
    query_type : UInt16
    query_options : UInt64
    interface_index : UInt32
    p_query_callback : PMDNS_QUERY_CALLBACK
    p_query_context : Void*
    f_answer_received : LibC::BOOL
    ul_resend_count : UInt32
  end


  # Params # config : DNS_CONFIG_TYPE [In],flag : UInt32 [In],pwsadaptername : LibC::LPWSTR [In],preserved : Void* [In],pbuffer : Void* [In],pbuflen : UInt32* [In]
  fun DnsQueryConfig(config : DNS_CONFIG_TYPE, flag : UInt32, pwsadaptername : LibC::LPWSTR, preserved : Void*, pbuffer : Void*, pbuflen : UInt32*) : Int32

  # Params # precord : DNS_RECORDA* [In],charsetin : DNS_CHARSET [In],charsetout : DNS_CHARSET [In]
  fun DnsRecordCopyEx(precord : DNS_RECORDA*, charsetin : DNS_CHARSET, charsetout : DNS_CHARSET) : DNS_RECORDA*

  # Params # precordset : DNS_RECORDA* [In],charsetin : DNS_CHARSET [In],charsetout : DNS_CHARSET [In]
  fun DnsRecordSetCopyEx(precordset : DNS_RECORDA*, charsetin : DNS_CHARSET, charsetout : DNS_CHARSET) : DNS_RECORDA*

  # Params # precord1 : DNS_RECORDA* [In],precord2 : DNS_RECORDA* [In]
  fun DnsRecordCompare(precord1 : DNS_RECORDA*, precord2 : DNS_RECORDA*) : LibC::BOOL

  # Params # prr1 : DNS_RECORDA* [In],prr2 : DNS_RECORDA* [In],ppdiff1 : DNS_RECORDA** [In],ppdiff2 : DNS_RECORDA** [In]
  fun DnsRecordSetCompare(prr1 : DNS_RECORDA*, prr2 : DNS_RECORDA*, ppdiff1 : DNS_RECORDA**, ppdiff2 : DNS_RECORDA**) : LibC::BOOL

  # Params # precordlist : DNS_RECORDA* [In]
  fun DnsRecordSetDetach(precordlist : DNS_RECORDA*) : DNS_RECORDA*

  # Params # pdata : Void* [In],freetype : DNS_FREE_TYPE [In]
  fun DnsFree(pdata : Void*, freetype : DNS_FREE_TYPE) : Void

  # Params # pszname : PSTR [In],wtype : UInt16 [In],options : UInt32 [In],pextra : Void* [In],ppqueryresults : DNS_RECORDA** [In],preserved : Void** [In]
  fun DnsQuery_A(pszname : PSTR, wtype : UInt16, options : UInt32, pextra : Void*, ppqueryresults : DNS_RECORDA**, preserved : Void**) : Int32

  # Params # pszname : PSTR [In],wtype : UInt16 [In],options : UInt32 [In],pextra : Void* [In],ppqueryresults : DNS_RECORDA** [In],preserved : Void** [In]
  fun DnsQuery_UTF8(pszname : PSTR, wtype : UInt16, options : UInt32, pextra : Void*, ppqueryresults : DNS_RECORDA**, preserved : Void**) : Int32

  # Params # pszname : LibC::LPWSTR [In],wtype : UInt16 [In],options : UInt32 [In],pextra : Void* [In],ppqueryresults : DNS_RECORDA** [In],preserved : Void** [In]
  fun DnsQuery_W(pszname : LibC::LPWSTR, wtype : UInt16, options : UInt32, pextra : Void*, ppqueryresults : DNS_RECORDA**, preserved : Void**) : Int32

  # Params # pqueryrequest : DNS_QUERY_REQUEST* [In],pqueryresults : DNS_QUERY_RESULT* [In],pcancelhandle : DNS_QUERY_CANCEL* [In]
  fun DnsQueryEx(pqueryrequest : DNS_QUERY_REQUEST*, pqueryresults : DNS_QUERY_RESULT*, pcancelhandle : DNS_QUERY_CANCEL*) : Int32

  # Params # pcancelhandle : DNS_QUERY_CANCEL* [In]
  fun DnsCancelQuery(pcancelhandle : DNS_QUERY_CANCEL*) : Int32

  # Params # pcservers : UInt32* [In],ppservers : DNS_CUSTOM_SERVER** [In]
  fun DnsFreeCustomServers(pcservers : UInt32*, ppservers : DNS_CUSTOM_SERVER**) : Void

  # Params # pcservers : UInt32* [In],ppdefaultservers : DNS_CUSTOM_SERVER** [In],psettings : DNS_APPLICATION_SETTINGS* [In]
  fun DnsGetApplicationSettings(pcservers : UInt32*, ppdefaultservers : DNS_CUSTOM_SERVER**, psettings : DNS_APPLICATION_SETTINGS*) : UInt32

  # Params # cservers : UInt32 [In],pservers : DNS_CUSTOM_SERVER* [In],psettings : DNS_APPLICATION_SETTINGS* [In]
  fun DnsSetApplicationSettings(cservers : UInt32, pservers : DNS_CUSTOM_SERVER*, psettings : DNS_APPLICATION_SETTINGS*) : UInt32

  # Params # credentialflags : UInt32 [In],credentials : Void* [In],pcontext : DnsContextHandle* [In]
  fun DnsAcquireContextHandle_W(credentialflags : UInt32, credentials : Void*, pcontext : DnsContextHandle*) : Int32

  # Params # credentialflags : UInt32 [In],credentials : Void* [In],pcontext : DnsContextHandle* [In]
  fun DnsAcquireContextHandle_A(credentialflags : UInt32, credentials : Void*, pcontext : DnsContextHandle*) : Int32

  # Params # hcontext : LibC::HANDLE [In]
  fun DnsReleaseContextHandle(hcontext : LibC::HANDLE) : Void

  # Params # paddrecords : DNS_RECORDA* [In],pdeleterecords : DNS_RECORDA* [In],options : UInt32 [In],hcredentials : LibC::HANDLE [In],pextralist : Void* [In],preserved : Void* [In]
  fun DnsModifyRecordsInSet_W(paddrecords : DNS_RECORDA*, pdeleterecords : DNS_RECORDA*, options : UInt32, hcredentials : LibC::HANDLE, pextralist : Void*, preserved : Void*) : Int32

  # Params # paddrecords : DNS_RECORDA* [In],pdeleterecords : DNS_RECORDA* [In],options : UInt32 [In],hcredentials : LibC::HANDLE [In],pextralist : Void* [In],preserved : Void* [In]
  fun DnsModifyRecordsInSet_A(paddrecords : DNS_RECORDA*, pdeleterecords : DNS_RECORDA*, options : UInt32, hcredentials : LibC::HANDLE, pextralist : Void*, preserved : Void*) : Int32

  # Params # paddrecords : DNS_RECORDA* [In],pdeleterecords : DNS_RECORDA* [In],options : UInt32 [In],hcredentials : LibC::HANDLE [In],pextralist : Void* [In],preserved : Void* [In]
  fun DnsModifyRecordsInSet_UTF8(paddrecords : DNS_RECORDA*, pdeleterecords : DNS_RECORDA*, options : UInt32, hcredentials : LibC::HANDLE, pextralist : Void*, preserved : Void*) : Int32

  # Params # preplaceset : DNS_RECORDA* [In],options : UInt32 [In],hcontext : LibC::HANDLE [In],pextrainfo : Void* [In],preserved : Void* [In]
  fun DnsReplaceRecordSetW(preplaceset : DNS_RECORDA*, options : UInt32, hcontext : LibC::HANDLE, pextrainfo : Void*, preserved : Void*) : Int32

  # Params # preplaceset : DNS_RECORDA* [In],options : UInt32 [In],hcontext : LibC::HANDLE [In],pextrainfo : Void* [In],preserved : Void* [In]
  fun DnsReplaceRecordSetA(preplaceset : DNS_RECORDA*, options : UInt32, hcontext : LibC::HANDLE, pextrainfo : Void*, preserved : Void*) : Int32

  # Params # preplaceset : DNS_RECORDA* [In],options : UInt32 [In],hcontext : LibC::HANDLE [In],pextrainfo : Void* [In],preserved : Void* [In]
  fun DnsReplaceRecordSetUTF8(preplaceset : DNS_RECORDA*, options : UInt32, hcontext : LibC::HANDLE, pextrainfo : Void*, preserved : Void*) : Int32

  # Params # pszname : LibC::LPWSTR [In],format : DNS_NAME_FORMAT [In]
  fun DnsValidateName_W(pszname : LibC::LPWSTR, format : DNS_NAME_FORMAT) : Int32

  # Params # pszname : PSTR [In],format : DNS_NAME_FORMAT [In]
  fun DnsValidateName_A(pszname : PSTR, format : DNS_NAME_FORMAT) : Int32

  # Params # pszname : PSTR [In],format : DNS_NAME_FORMAT [In]
  fun DnsValidateName_UTF8(pszname : PSTR, format : DNS_NAME_FORMAT) : Int32

  # Params # pname1 : PSTR [In],pname2 : PSTR [In]
  fun DnsNameCompare_A(pname1 : PSTR, pname2 : PSTR) : LibC::BOOL

  # Params # pname1 : LibC::LPWSTR [In],pname2 : LibC::LPWSTR [In]
  fun DnsNameCompare_W(pname1 : LibC::LPWSTR, pname2 : LibC::LPWSTR) : LibC::BOOL

  # Params # pdnsbuffer : DNS_MESSAGE_BUFFER* [In],pdwbuffersize : UInt32* [In],pszname : LibC::LPWSTR [In],wtype : UInt16 [In],xid : UInt16 [In],frecursiondesired : LibC::BOOL [In]
  fun DnsWriteQuestionToBuffer_W(pdnsbuffer : DNS_MESSAGE_BUFFER*, pdwbuffersize : UInt32*, pszname : LibC::LPWSTR, wtype : UInt16, xid : UInt16, frecursiondesired : LibC::BOOL) : LibC::BOOL

  # Params # pdnsbuffer : DNS_MESSAGE_BUFFER* [In],pdwbuffersize : UInt32* [In],pszname : PSTR [In],wtype : UInt16 [In],xid : UInt16 [In],frecursiondesired : LibC::BOOL [In]
  fun DnsWriteQuestionToBuffer_UTF8(pdnsbuffer : DNS_MESSAGE_BUFFER*, pdwbuffersize : UInt32*, pszname : PSTR, wtype : UInt16, xid : UInt16, frecursiondesired : LibC::BOOL) : LibC::BOOL

  # Params # pdnsbuffer : DNS_MESSAGE_BUFFER* [In],wmessagelength : UInt16 [In],pprecord : DNS_RECORDA** [In]
  fun DnsExtractRecordsFromMessage_W(pdnsbuffer : DNS_MESSAGE_BUFFER*, wmessagelength : UInt16, pprecord : DNS_RECORDA**) : Int32

  # Params # pdnsbuffer : DNS_MESSAGE_BUFFER* [In],wmessagelength : UInt16 [In],pprecord : DNS_RECORDA** [In]
  fun DnsExtractRecordsFromMessage_UTF8(pdnsbuffer : DNS_MESSAGE_BUFFER*, wmessagelength : UInt16, pprecord : DNS_RECORDA**) : Int32

  # Params # hostname : LibC::LPWSTR [In],proxyinformation : DNS_PROXY_INFORMATION* [In],defaultproxyinformation : DNS_PROXY_INFORMATION* [In],completionroutine : DNS_PROXY_COMPLETION_ROUTINE [In],completioncontext : Void* [In]
  fun DnsGetProxyInformation(hostname : LibC::LPWSTR, proxyinformation : DNS_PROXY_INFORMATION*, defaultproxyinformation : DNS_PROXY_INFORMATION*, completionroutine : DNS_PROXY_COMPLETION_ROUTINE, completioncontext : Void*) : UInt32

  # Params # proxyname : LibC::LPWSTR [In]
  fun DnsFreeProxyName(proxyname : LibC::LPWSTR) : Void

  # Params # pwszhosturl : LibC::LPWSTR [In],pselectioncontext : UInt8* [In],dwselectioncontextlength : UInt32 [In],dwexplicitinterfaceindex : UInt32 [In],pproxyinfoex : DNS_CONNECTION_PROXY_INFO_EX* [In]
  fun DnsConnectionGetProxyInfoForHostUrl(pwszhosturl : LibC::LPWSTR, pselectioncontext : UInt8*, dwselectioncontextlength : UInt32, dwexplicitinterfaceindex : UInt32, pproxyinfoex : DNS_CONNECTION_PROXY_INFO_EX*) : UInt32

  # Params # pproxyinfoex : DNS_CONNECTION_PROXY_INFO_EX* [In]
  fun DnsConnectionFreeProxyInfoEx(pproxyinfoex : DNS_CONNECTION_PROXY_INFO_EX*) : Void

  # Params # pwszconnectionname : LibC::LPWSTR [In],type : DNS_CONNECTION_PROXY_TYPE [In],pproxyinfo : DNS_CONNECTION_PROXY_INFO* [In]
  fun DnsConnectionGetProxyInfo(pwszconnectionname : LibC::LPWSTR, type : DNS_CONNECTION_PROXY_TYPE, pproxyinfo : DNS_CONNECTION_PROXY_INFO*) : UInt32

  # Params # pproxyinfo : DNS_CONNECTION_PROXY_INFO* [In]
  fun DnsConnectionFreeProxyInfo(pproxyinfo : DNS_CONNECTION_PROXY_INFO*) : Void

  # Params # pwszconnectionname : LibC::LPWSTR [In],type : DNS_CONNECTION_PROXY_TYPE [In],pproxyinfo : DNS_CONNECTION_PROXY_INFO* [In]
  fun DnsConnectionSetProxyInfo(pwszconnectionname : LibC::LPWSTR, type : DNS_CONNECTION_PROXY_TYPE, pproxyinfo : DNS_CONNECTION_PROXY_INFO*) : UInt32

  # Params # pwszconnectionname : LibC::LPWSTR [In],type : DNS_CONNECTION_PROXY_TYPE [In]
  fun DnsConnectionDeleteProxyInfo(pwszconnectionname : LibC::LPWSTR, type : DNS_CONNECTION_PROXY_TYPE) : UInt32

  # Params # pwszconnectionname : LibC::LPWSTR [In],pproxylist : DNS_CONNECTION_PROXY_LIST* [In]
  fun DnsConnectionGetProxyList(pwszconnectionname : LibC::LPWSTR, pproxylist : DNS_CONNECTION_PROXY_LIST*) : UInt32

  # Params # pproxylist : DNS_CONNECTION_PROXY_LIST* [In]
  fun DnsConnectionFreeProxyList(pproxylist : DNS_CONNECTION_PROXY_LIST*) : Void

  # Params # pnamelist : DNS_CONNECTION_NAME_LIST* [In]
  fun DnsConnectionGetNameList(pnamelist : DNS_CONNECTION_NAME_LIST*) : UInt32

  # Params # pnamelist : DNS_CONNECTION_NAME_LIST* [In]
  fun DnsConnectionFreeNameList(pnamelist : DNS_CONNECTION_NAME_LIST*) : Void

  # Params # pconnectionifindexentries : DNS_CONNECTION_IFINDEX_LIST* [In]
  fun DnsConnectionUpdateIfIndexTable(pconnectionifindexentries : DNS_CONNECTION_IFINDEX_LIST*) : UInt32

  # Params # policyentrytag : DNS_CONNECTION_POLICY_TAG [In],ppolicyentrylist : DNS_CONNECTION_POLICY_ENTRY_LIST* [In]
  fun DnsConnectionSetPolicyEntries(policyentrytag : DNS_CONNECTION_POLICY_TAG, ppolicyentrylist : DNS_CONNECTION_POLICY_ENTRY_LIST*) : UInt32

  # Params # policyentrytag : DNS_CONNECTION_POLICY_TAG [In]
  fun DnsConnectionDeletePolicyEntries(policyentrytag : DNS_CONNECTION_POLICY_TAG) : UInt32

  # Params # pservicename : LibC::LPWSTR [In],phostname : LibC::LPWSTR [In],pip4 : UInt32* [In],pip6 : IP6_ADDRESS* [In],wport : UInt16 [In],wpriority : UInt16 [In],wweight : UInt16 [In],dwpropertiescount : UInt32 [In],keys : LibC::LPWSTR* [In],values : LibC::LPWSTR* [In]
  fun DnsServiceConstructInstance(pservicename : LibC::LPWSTR, phostname : LibC::LPWSTR, pip4 : UInt32*, pip6 : IP6_ADDRESS*, wport : UInt16, wpriority : UInt16, wweight : UInt16, dwpropertiescount : UInt32, keys : LibC::LPWSTR*, values : LibC::LPWSTR*) : DNS_SERVICE_INSTANCE*

  # Params # porig : DNS_SERVICE_INSTANCE* [In]
  fun DnsServiceCopyInstance(porig : DNS_SERVICE_INSTANCE*) : DNS_SERVICE_INSTANCE*

  # Params # pinstance : DNS_SERVICE_INSTANCE* [In]
  fun DnsServiceFreeInstance(pinstance : DNS_SERVICE_INSTANCE*) : Void

  # Params # prequest : DNS_SERVICE_BROWSE_REQUEST* [In],pcancel : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceBrowse(prequest : DNS_SERVICE_BROWSE_REQUEST*, pcancel : DNS_SERVICE_CANCEL*) : Int32

  # Params # pcancelhandle : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceBrowseCancel(pcancelhandle : DNS_SERVICE_CANCEL*) : Int32

  # Params # prequest : DNS_SERVICE_RESOLVE_REQUEST* [In],pcancel : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceResolve(prequest : DNS_SERVICE_RESOLVE_REQUEST*, pcancel : DNS_SERVICE_CANCEL*) : Int32

  # Params # pcancelhandle : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceResolveCancel(pcancelhandle : DNS_SERVICE_CANCEL*) : Int32

  # Params # prequest : DNS_SERVICE_REGISTER_REQUEST* [In],pcancel : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceRegister(prequest : DNS_SERVICE_REGISTER_REQUEST*, pcancel : DNS_SERVICE_CANCEL*) : UInt32

  # Params # prequest : DNS_SERVICE_REGISTER_REQUEST* [In],pcancel : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceDeRegister(prequest : DNS_SERVICE_REGISTER_REQUEST*, pcancel : DNS_SERVICE_CANCEL*) : UInt32

  # Params # pcancelhandle : DNS_SERVICE_CANCEL* [In]
  fun DnsServiceRegisterCancel(pcancelhandle : DNS_SERVICE_CANCEL*) : UInt32

  # Params # pqueryrequest : MDNS_QUERY_REQUEST* [In],phandle : MDNS_QUERY_HANDLE* [In]
  fun DnsStartMulticastQuery(pqueryrequest : MDNS_QUERY_REQUEST*, phandle : MDNS_QUERY_HANDLE*) : Int32

  # Params # phandle : MDNS_QUERY_HANDLE* [In]
  fun DnsStopMulticastQuery(phandle : MDNS_QUERY_HANDLE*) : Int32
end
