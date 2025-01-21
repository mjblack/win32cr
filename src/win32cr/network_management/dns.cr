require "./../foundation.cr"

module Win32cr::NetworkManagement::Dns
  alias DnsContextHandle = LibC::IntPtrT
  alias DNS_PROXY_COMPLETION_ROUTINE = Proc(Void*, Int32, Void)*

  alias PDNS_QUERY_COMPLETION_ROUTINE = Proc(Void*, Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, Void)*

  alias PDNS_SERVICE_BROWSE_CALLBACK = Proc(UInt32, Void*, Win32cr::NetworkManagement::Dns::DNS_RECORDW*, Void)*

  alias PDNS_SERVICE_RESOLVE_COMPLETE = Proc(UInt32, Void*, Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*, Void)*

  alias PDNS_SERVICE_REGISTER_COMPLETE = Proc(UInt32, Void*, Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*, Void)*

  alias PMDNS_QUERY_CALLBACK = Proc(Void*, Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*, Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, Void)*

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

  enum DNS_CONFIG_TYPE
    DnsConfigPrimaryDomainName_W = 0_i32
    DnsConfigPrimaryDomainName_A = 1_i32
    DnsConfigPrimaryDomainName_UTF8 = 2_i32
    DnsConfigAdapterDomainName_W = 3_i32
    DnsConfigAdapterDomainName_A = 4_i32
    DnsConfigAdapterDomainName_UTF8 = 5_i32
    DnsConfigDnsServerList = 6_i32
    DnsConfigSearchList = 7_i32
    DnsConfigAdapterInfo = 8_i32
    DnsConfigPrimaryHostNameRegistrationEnabled = 9_i32
    DnsConfigAdapterHostNameRegistrationEnabled = 10_i32
    DnsConfigAddressRegistrationMaxCount = 11_i32
    DnsConfigHostName_W = 12_i32
    DnsConfigHostName_A = 13_i32
    DnsConfigHostName_UTF8 = 14_i32
    DnsConfigFullHostName_W = 15_i32
    DnsConfigFullHostName_A = 16_i32
    DnsConfigFullHostName_UTF8 = 17_i32
    DnsConfigNameServer = 18_i32
  end
  enum DNS_SECTION
    DnsSectionQuestion = 0_i32
    DnsSectionAnswer = 1_i32
    DnsSectionAuthority = 2_i32
    DnsSectionAddtional = 3_i32
  end
  enum DNS_PROXY_INFORMATION_TYPE
    DNS_PROXY_INFORMATION_DIRECT = 0_i32
    DNS_PROXY_INFORMATION_DEFAULT_SETTINGS = 1_i32
    DNS_PROXY_INFORMATION_PROXY_NAME = 2_i32
    DNS_PROXY_INFORMATION_DOES_NOT_EXIST = 3_i32
  end
  enum DNS_CHARSET
    DnsCharSetUnknown = 0_i32
    DnsCharSetUnicode = 1_i32
    DnsCharSetUtf8 = 2_i32
    DnsCharSetAnsi = 3_i32
  end
  enum DNS_FREE_TYPE
    DnsFreeFlat = 0_i32
    DnsFreeRecordList = 1_i32
    DnsFreeParsedMessageFields = 2_i32
  end
  enum DNS_NAME_FORMAT
    DnsNameDomain = 0_i32
    DnsNameDomainLabel = 1_i32
    DnsNameHostnameFull = 2_i32
    DnsNameHostnameLabel = 3_i32
    DnsNameWildcard = 4_i32
    DnsNameSrvRecord = 5_i32
    DnsNameValidateTld = 6_i32
  end
  enum DNS_CONNECTION_PROXY_TYPE
    DNS_CONNECTION_PROXY_TYPE_NULL = 0_i32
    DNS_CONNECTION_PROXY_TYPE_HTTP = 1_i32
    DNS_CONNECTION_PROXY_TYPE_WAP = 2_i32
    DNS_CONNECTION_PROXY_TYPE_SOCKS4 = 4_i32
    DNS_CONNECTION_PROXY_TYPE_SOCKS5 = 5_i32
  end
  enum DNS_CONNECTION_PROXY_INFO_SWITCH
    DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG = 0_i32
    DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT = 1_i32
    DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD = 2_i32
  end
  enum DNS_CONNECTION_POLICY_TAG
    TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT = 0_i32
    TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER = 1_i32
    TAG_DNS_CONNECTION_POLICY_TAG_WWWPT = 2_i32
  end

  @[Extern]
  record IP4_ARRAY,
    addr_count : UInt32,
    addr_array : UInt32*

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  record IP6_ADDRESS,
    ip6_qword : UInt64[2],
    ip6_dword : UInt32[4],
    ip6_word : UInt16[8],
    ip6_byte : UInt8[16]
  {% end %}

  @[Extern]
  record DNS_ADDR,
    max_sa : Win32cr::Foundation::CHAR[32],
    data : Data_e__Union_ do

    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    record Data_e__Union_,
      dns_addr_user_dword : UInt32[8]

  end

  @[Extern]
  record DNS_ADDR_ARRAY,
    max_count : UInt32,
    addr_count : UInt32,
    tag : UInt32,
    family : UInt16,
    word_reserved : UInt16,
    flags : UInt32,
    match_flag : UInt32,
    reserved1 : UInt32,
    reserved2 : UInt32,
    addr_array : Win32cr::NetworkManagement::Dns::DNS_ADDR*

  @[Extern]
  record DNS_HEADER,
    xid : UInt16,
    _bitfield1 : UInt8,
    _bitfield2 : UInt8,
    question_count : UInt16,
    answer_count : UInt16,
    name_server_count : UInt16,
    additional_count : UInt16

  @[Extern]
  record DNS_HEADER_EXT,
    _bitfield : UInt16,
    chRcode : UInt8,
    chVersion : UInt8

  @[Extern]
  record DNS_WIRE_QUESTION,
    question_type : UInt16,
    question_class : UInt16

  @[Extern]
  record DNS_WIRE_RECORD,
    record_type : UInt16,
    record_class : UInt16,
    time_to_live : UInt32,
    data_length : UInt16

  @[Extern]
  record DNS_A_DATA,
    ip_address : UInt32

  @[Extern]
  record DNS_PTR_DATAW,
    pNameHost : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_PTR_DATAA,
    pNameHost : Win32cr::Foundation::PSTR

  @[Extern]
  record DNS_SOA_DATAW,
    pNamePrimaryServer : Win32cr::Foundation::PWSTR,
    pNameAdministrator : Win32cr::Foundation::PWSTR,
    dwSerialNo : UInt32,
    dwRefresh : UInt32,
    dwRetry : UInt32,
    dwExpire : UInt32,
    dwDefaultTtl : UInt32

  @[Extern]
  record DNS_SOA_DATAA,
    pNamePrimaryServer : Win32cr::Foundation::PSTR,
    pNameAdministrator : Win32cr::Foundation::PSTR,
    dwSerialNo : UInt32,
    dwRefresh : UInt32,
    dwRetry : UInt32,
    dwExpire : UInt32,
    dwDefaultTtl : UInt32

  @[Extern]
  record DNS_MINFO_DATAW,
    pNameMailbox : Win32cr::Foundation::PWSTR,
    pNameErrorsMailbox : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_MINFO_DATAA,
    pNameMailbox : Win32cr::Foundation::PSTR,
    pNameErrorsMailbox : Win32cr::Foundation::PSTR

  @[Extern]
  record DNS_MX_DATAW,
    pNameExchange : Win32cr::Foundation::PWSTR,
    wPreference : UInt16,
    pad : UInt16

  @[Extern]
  record DNS_MX_DATAA,
    pNameExchange : Win32cr::Foundation::PSTR,
    wPreference : UInt16,
    pad : UInt16

  @[Extern]
  record DNS_TXT_DATAW,
    dwStringCount : UInt32,
    pStringArray : Win32cr::Foundation::PWSTR*

  @[Extern]
  record DNS_TXT_DATAA,
    dwStringCount : UInt32,
    pStringArray : Win32cr::Foundation::PSTR*

  @[Extern]
  record DNS_NULL_DATA,
    dwByteCount : UInt32,
    data : UInt8*

  @[Extern]
  record DNS_WKS_DATA,
    ip_address : UInt32,
    chProtocol : UInt8,
    bit_mask : UInt8*

  @[Extern]
  record DNS_AAAA_DATA,
    ip6_address : Win32cr::NetworkManagement::Dns::IP6_ADDRESS

  @[Extern]
  record DNS_SIG_DATAW,
    wTypeCovered : UInt16,
    chAlgorithm : UInt8,
    chLabelCount : UInt8,
    dwOriginalTtl : UInt32,
    dwExpiration : UInt32,
    dwTimeSigned : UInt32,
    wKeyTag : UInt16,
    wSignatureLength : UInt16,
    pNameSigner : Win32cr::Foundation::PWSTR,
    signature : UInt8*

  @[Extern]
  record DNS_SIG_DATAA,
    wTypeCovered : UInt16,
    chAlgorithm : UInt8,
    chLabelCount : UInt8,
    dwOriginalTtl : UInt32,
    dwExpiration : UInt32,
    dwTimeSigned : UInt32,
    wKeyTag : UInt16,
    wSignatureLength : UInt16,
    pNameSigner : Win32cr::Foundation::PSTR,
    signature : UInt8*

  @[Extern]
  record DNS_KEY_DATA,
    wFlags : UInt16,
    chProtocol : UInt8,
    chAlgorithm : UInt8,
    wKeyLength : UInt16,
    wPad : UInt16,
    key : UInt8*

  @[Extern]
  record DNS_DHCID_DATA,
    dwByteCount : UInt32,
    dhcid : UInt8*

  @[Extern]
  record DNS_NSEC_DATAW,
    pNextDomainName : Win32cr::Foundation::PWSTR,
    wTypeBitMapsLength : UInt16,
    wPad : UInt16,
    type_bit_maps : UInt8*

  @[Extern]
  record DNS_NSEC_DATAA,
    pNextDomainName : Win32cr::Foundation::PSTR,
    wTypeBitMapsLength : UInt16,
    wPad : UInt16,
    type_bit_maps : UInt8*

  @[Extern]
  record DNS_NSEC3_DATA,
    chAlgorithm : UInt8,
    bFlags : UInt8,
    wIterations : UInt16,
    bSaltLength : UInt8,
    bHashLength : UInt8,
    wTypeBitMapsLength : UInt16,
    chData : UInt8*

  @[Extern]
  record DNS_NSEC3PARAM_DATA,
    chAlgorithm : UInt8,
    bFlags : UInt8,
    wIterations : UInt16,
    bSaltLength : UInt8,
    bPad : UInt8[3],
    pbSalt : UInt8*

  @[Extern]
  record DNS_TLSA_DATA,
    bCertUsage : UInt8,
    bSelector : UInt8,
    bMatchingType : UInt8,
    bCertificateAssociationDataLength : UInt16,
    bPad : UInt8[3],
    bCertificateAssociationData : UInt8*

  @[Extern]
  record DNS_DS_DATA,
    wKeyTag : UInt16,
    chAlgorithm : UInt8,
    chDigestType : UInt8,
    wDigestLength : UInt16,
    wPad : UInt16,
    digest : UInt8*

  @[Extern]
  record DNS_OPT_DATA,
    wDataLength : UInt16,
    wPad : UInt16,
    data : UInt8*

  @[Extern]
  record DNS_LOC_DATA,
    wVersion : UInt16,
    wSize : UInt16,
    wHorPrec : UInt16,
    wVerPrec : UInt16,
    dwLatitude : UInt32,
    dwLongitude : UInt32,
    dwAltitude : UInt32

  @[Extern]
  record DNS_NXT_DATAW,
    pNameNext : Win32cr::Foundation::PWSTR,
    wNumTypes : UInt16,
    wTypes : UInt16*

  @[Extern]
  record DNS_NXT_DATAA,
    pNameNext : Win32cr::Foundation::PSTR,
    wNumTypes : UInt16,
    wTypes : UInt16*

  @[Extern]
  record DNS_SRV_DATAW,
    pNameTarget : Win32cr::Foundation::PWSTR,
    wPriority : UInt16,
    wWeight : UInt16,
    wPort : UInt16,
    pad : UInt16

  @[Extern]
  record DNS_SRV_DATAA,
    pNameTarget : Win32cr::Foundation::PSTR,
    wPriority : UInt16,
    wWeight : UInt16,
    wPort : UInt16,
    pad : UInt16

  @[Extern]
  record DNS_NAPTR_DATAW,
    wOrder : UInt16,
    wPreference : UInt16,
    pFlags : Win32cr::Foundation::PWSTR,
    pService : Win32cr::Foundation::PWSTR,
    pRegularExpression : Win32cr::Foundation::PWSTR,
    pReplacement : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_NAPTR_DATAA,
    wOrder : UInt16,
    wPreference : UInt16,
    pFlags : Win32cr::Foundation::PSTR,
    pService : Win32cr::Foundation::PSTR,
    pRegularExpression : Win32cr::Foundation::PSTR,
    pReplacement : Win32cr::Foundation::PSTR

  @[Extern]
  record DNS_ATMA_DATA,
    address_type : UInt8,
    address : UInt8[20]

  @[Extern]
  record DNS_TKEY_DATAW,
    pNameAlgorithm : Win32cr::Foundation::PWSTR,
    pAlgorithmPacket : UInt8*,
    pKey : UInt8*,
    pOtherData : UInt8*,
    dwCreateTime : UInt32,
    dwExpireTime : UInt32,
    wMode : UInt16,
    wError : UInt16,
    wKeyLength : UInt16,
    wOtherLength : UInt16,
    cAlgNameLength : UInt8,
    bPacketPointers : Win32cr::Foundation::BOOL

  @[Extern]
  record DNS_TKEY_DATAA,
    pNameAlgorithm : Win32cr::Foundation::PSTR,
    pAlgorithmPacket : UInt8*,
    pKey : UInt8*,
    pOtherData : UInt8*,
    dwCreateTime : UInt32,
    dwExpireTime : UInt32,
    wMode : UInt16,
    wError : UInt16,
    wKeyLength : UInt16,
    wOtherLength : UInt16,
    cAlgNameLength : UInt8,
    bPacketPointers : Win32cr::Foundation::BOOL

  @[Extern]
  record DNS_TSIG_DATAW,
    pNameAlgorithm : Win32cr::Foundation::PWSTR,
    pAlgorithmPacket : UInt8*,
    pSignature : UInt8*,
    pOtherData : UInt8*,
    i64CreateTime : Int64,
    wFudgeTime : UInt16,
    wOriginalXid : UInt16,
    wError : UInt16,
    wSigLength : UInt16,
    wOtherLength : UInt16,
    cAlgNameLength : UInt8,
    bPacketPointers : Win32cr::Foundation::BOOL

  @[Extern]
  record DNS_TSIG_DATAA,
    pNameAlgorithm : Win32cr::Foundation::PSTR,
    pAlgorithmPacket : UInt8*,
    pSignature : UInt8*,
    pOtherData : UInt8*,
    i64CreateTime : Int64,
    wFudgeTime : UInt16,
    wOriginalXid : UInt16,
    wError : UInt16,
    wSigLength : UInt16,
    wOtherLength : UInt16,
    cAlgNameLength : UInt8,
    bPacketPointers : Win32cr::Foundation::BOOL

  @[Extern]
  record DNS_UNKNOWN_DATA,
    dwByteCount : UInt32,
    bData : UInt8*

  @[Extern]
  record DNS_WINS_DATA,
    dwMappingFlag : UInt32,
    dwLookupTimeout : UInt32,
    dwCacheTimeout : UInt32,
    cWinsServerCount : UInt32,
    wins_servers : UInt32*

  @[Extern]
  record DNS_WINSR_DATAW,
    dwMappingFlag : UInt32,
    dwLookupTimeout : UInt32,
    dwCacheTimeout : UInt32,
    pNameResultDomain : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_WINSR_DATAA,
    dwMappingFlag : UInt32,
    dwLookupTimeout : UInt32,
    dwCacheTimeout : UInt32,
    pNameResultDomain : Win32cr::Foundation::PSTR

  @[Extern]
  record DNS_RECORD_FLAGS,
    _bitfield : UInt32

  @[Extern]
  record DNS_RECORDW,
    pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDW*,
    pName : Win32cr::Foundation::PWSTR,
    wType : UInt16,
    wDataLength : UInt16,
    flags : Flags_e__Union_,
    dwTtl : UInt32,
    dwReserved : UInt32,
    data : Data_e__Union_ do

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    record Flags_e__Union_,
      dw : UInt32,
      s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    record Data_e__Union_,
      a : Win32cr::NetworkManagement::Dns::DNS_A_DATA,
      soa : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAW,
      soa_ : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAW,
      ptr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      ptr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      ns : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      ns_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      cname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      cname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      dname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      dname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mb : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mb_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      md : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      md_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mf : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mf_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mg : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mg_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      mr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW,
      minfo : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW,
      minfo_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW,
      rp : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW,
      rp_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW,
      mx : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW,
      mx_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW,
      afsdb : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW,
      afsdb_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW,
      rt : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW,
      rt_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW,
      hinfo : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      hinfo_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      isdn : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      isdn_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      txt : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      txt_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      x25 : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW,
      null : Win32cr::NetworkManagement::Dns::DNS_NULL_DATA,
      wks : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA,
      wks_ : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA,
      aaaa : Win32cr::NetworkManagement::Dns::DNS_AAAA_DATA,
      key : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      key_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      sig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW,
      sig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW,
      atma : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA,
      atma_ : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA,
      nxt : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAW,
      nxt_ : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAW,
      srv : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAW,
      srv_ : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAW,
      naptr : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAW,
      naptr_ : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAW,
      opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA,
      opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA,
      ds : Win32cr::NetworkManagement::Dns::DNS_DS_DATA,
      ds_ : Win32cr::NetworkManagement::Dns::DNS_DS_DATA,
      rrsig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW,
      rrsig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW,
      nsec : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAW,
      nsec_ : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAW,
      dnskey : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      dnskey_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      tkey : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAW,
      tkey_ : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAW,
      tsig : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAW,
      tsig_ : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAW,
      wins : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA,
      wins_ : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA,
      winsr : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW,
      wins_r : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW,
      nbstat : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW,
      nbstat_ : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW,
      dhcid : Win32cr::NetworkManagement::Dns::DNS_DHCID_DATA,
      nsec3 : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA,
      nsec3_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA,
      nsec3_param : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA,
      nsec3_param_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA,
      tlsa : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA,
      tlsa_ : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA,
      unknown : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA,
      unknown_ : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA,
      pDataPtr : UInt8*

  end

  @[Extern]
  record DnsRecordOptW_,
    pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDW*,
    pName : Win32cr::Foundation::PWSTR,
    wType : UInt16,
    wDataLength : UInt16,
    flags : Flags_e__Union_,
    ext_header : Win32cr::NetworkManagement::Dns::DNS_HEADER_EXT,
    wPayloadSize : UInt16,
    wReserved : UInt16,
    data : Data_e__Union_ do

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    record Flags_e__Union_,
      dw : UInt32,
      s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    record Data_e__Union_,
      opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA,
      opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA

  end

  @[Extern]
  record DNS_RECORDA,
    pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDA*,
    pName : Win32cr::Foundation::PSTR,
    wType : UInt16,
    wDataLength : UInt16,
    flags : Flags_e__Union_,
    dwTtl : UInt32,
    dwReserved : UInt32,
    data : Data_e__Union_ do

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    record Flags_e__Union_,
      dw : UInt32,
      s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    record Data_e__Union_,
      a : Win32cr::NetworkManagement::Dns::DNS_A_DATA,
      soa : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAA,
      soa_ : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAA,
      ptr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      ptr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      ns : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      ns_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      cname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      cname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      dname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      dname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mb : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mb_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      md : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      md_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mf : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mf_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mg : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mg_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      mr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA,
      minfo : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA,
      minfo_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA,
      rp : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA,
      rp_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA,
      mx : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA,
      mx_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA,
      afsdb : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA,
      afsdb_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA,
      rt : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA,
      rt_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA,
      hinfo : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      hinfo_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      isdn : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      isdn_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      txt : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      txt_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      x25 : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA,
      null : Win32cr::NetworkManagement::Dns::DNS_NULL_DATA,
      wks : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA,
      wks_ : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA,
      aaaa : Win32cr::NetworkManagement::Dns::DNS_AAAA_DATA,
      key : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      key_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      sig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA,
      sig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA,
      atma : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA,
      atma_ : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA,
      nxt : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAA,
      nxt_ : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAA,
      srv : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAA,
      srv_ : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAA,
      naptr : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAA,
      naptr_ : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAA,
      opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA,
      opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA,
      ds : Win32cr::NetworkManagement::Dns::DNS_DS_DATA,
      ds_ : Win32cr::NetworkManagement::Dns::DNS_DS_DATA,
      rrsig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA,
      rrsig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA,
      nsec : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAA,
      nsec_ : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAA,
      dnskey : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      dnskey_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA,
      tkey : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAA,
      tkey_ : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAA,
      tsig : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAA,
      tsig_ : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAA,
      wins : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA,
      wins_ : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA,
      winsr : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA,
      wins_r : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA,
      nbstat : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA,
      nbstat_ : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA,
      dhcid : Win32cr::NetworkManagement::Dns::DNS_DHCID_DATA,
      nsec3 : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA,
      nsec3_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA,
      nsec3_param : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA,
      nsec3_param_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA,
      tlsa : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA,
      tlsa_ : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA,
      unknown : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA,
      unknown_ : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA,
      pDataPtr : UInt8*

  end

  @[Extern]
  record DnsRecordOptA_,
    pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDA*,
    pName : Win32cr::Foundation::PSTR,
    wType : UInt16,
    wDataLength : UInt16,
    flags : Flags_e__Union_,
    ext_header : Win32cr::NetworkManagement::Dns::DNS_HEADER_EXT,
    wPayloadSize : UInt16,
    wReserved : UInt16,
    data : Data_e__Union_ do

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    record Flags_e__Union_,
      dw : UInt32,
      s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    record Data_e__Union_,
      opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA,
      opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA

  end

  @[Extern]
  record DNS_RRSET,
    pFirstRR : Win32cr::NetworkManagement::Dns::DNS_RECORDA*,
    pLastRR : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

  @[Extern]
  record DNS_PROXY_INFORMATION,
    version : UInt32,
    proxyInformationType : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION_TYPE,
    proxyName : Win32cr::Foundation::PWSTR

  @[Extern]
  record DNS_QUERY_RESULT,
    version : UInt32,
    query_status : Int32,
    query_options : UInt64,
    pQueryRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*,
    reserved : Void*

  @[Extern]
  record DNS_QUERY_REQUEST,
    version : UInt32,
    query_name : Win32cr::Foundation::PWSTR,
    query_type : UInt16,
    query_options : UInt64,
    pDnsServerList : Win32cr::NetworkManagement::Dns::DNS_ADDR_ARRAY*,
    interface_index : UInt32,
    pQueryCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE,
    pQueryContext : Void*

  @[Extern]
  record DNS_QUERY_CANCEL,
    reserved : Win32cr::Foundation::CHAR[32]

  @[Extern]
  record DNS_CUSTOM_SERVER,
    dwServerType : UInt32,
    ullFlags : UInt64,
    anonymous1 : Anonymous1_e__Union_,
    anonymous2 : Anonymous2_e__Union_ do

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    record Anonymous1_e__Union_,
      pwszTemplate : Win32cr::Foundation::PWSTR


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    record Anonymous2_e__Union_,
      max_sa : Win32cr::Foundation::CHAR[32]

  end

  @[Extern]
  record DNS_QUERY_REQUEST3,
    version : UInt32,
    query_name : Win32cr::Foundation::PWSTR,
    query_type : UInt16,
    query_options : UInt64,
    pDnsServerList : Win32cr::NetworkManagement::Dns::DNS_ADDR_ARRAY*,
    interface_index : UInt32,
    pQueryCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE,
    pQueryContext : Void*,
    is_network_query_required : Win32cr::Foundation::BOOL,
    required_network_index : UInt32,
    cCustomServers : UInt32,
    pCustomServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER*

  @[Extern]
  record DNS_APPLICATION_SETTINGS,
    version : UInt32,
    flags : UInt64

  @[Extern]
  record DNS_MESSAGE_BUFFER,
    message_head : Win32cr::NetworkManagement::Dns::DNS_HEADER,
    message_body : Win32cr::Foundation::CHAR*

  @[Extern]
  record DNS_CONNECTION_PROXY_INFO,
    version : UInt32,
    pwszFriendlyName : Win32cr::Foundation::PWSTR,
    flags : UInt32,
    switch : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_SWITCH,
    anonymous : Anonymous_e__Union_ do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      config : DNS_CONNECTION_PROXY_INFO_CONFIG_,
      script : DNS_CONNECTION_PROXY_INFO_SCRIPT_ do

      # Nested Type DNS_CONNECTION_PROXY_INFO_SCRIPT_
      @[Extern]
      record DNS_CONNECTION_PROXY_INFO_SCRIPT_,
        pwszScript : Win32cr::Foundation::PWSTR,
        pwszUsername : Win32cr::Foundation::PWSTR,
        pwszPassword : Win32cr::Foundation::PWSTR


      # Nested Type DNS_CONNECTION_PROXY_INFO_CONFIG_
      @[Extern]
      record DNS_CONNECTION_PROXY_INFO_CONFIG_,
        pwszServer : Win32cr::Foundation::PWSTR,
        pwszUsername : Win32cr::Foundation::PWSTR,
        pwszPassword : Win32cr::Foundation::PWSTR,
        pwszException : Win32cr::Foundation::PWSTR,
        pwszExtraInfo : Win32cr::Foundation::PWSTR,
        port : UInt16

    end

  end

  @[Extern]
  record DNS_CONNECTION_PROXY_INFO_EX,
    proxy_info : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO,
    dwInterfaceIndex : UInt32,
    pwszConnectionName : Win32cr::Foundation::PWSTR,
    fDirectConfiguration : Win32cr::Foundation::BOOL,
    hConnection : Win32cr::Foundation::HANDLE

  @[Extern]
  record DNS_CONNECTION_PROXY_ELEMENT,
    type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE,
    info : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO

  @[Extern]
  record DNS_CONNECTION_PROXY_LIST,
    cProxies : UInt32,
    pProxies : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_ELEMENT*

  @[Extern]
  record DNS_CONNECTION_NAME,
    wszName : UInt16[65]

  @[Extern]
  record DNS_CONNECTION_NAME_LIST,
    cNames : UInt32,
    pNames : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME*

  @[Extern]
  record DNS_CONNECTION_IFINDEX_ENTRY,
    pwszConnectionName : Win32cr::Foundation::PWSTR,
    dwIfIndex : UInt32

  @[Extern]
  record DNS_CONNECTION_IFINDEX_LIST,
    pConnectionIfIndexEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_IFINDEX_ENTRY*,
    nEntries : UInt32

  @[Extern]
  record DNS_CONNECTION_POLICY_ENTRY,
    pwszHost : Win32cr::Foundation::PWSTR,
    pwszAppId : Win32cr::Foundation::PWSTR,
    cbAppSid : UInt32,
    pbAppSid : UInt8*,
    nConnections : UInt32,
    ppwszConnections : Win32cr::Foundation::PWSTR*,
    dwPolicyEntryFlags : UInt32

  @[Extern]
  record DNS_CONNECTION_POLICY_ENTRY_LIST,
    pPolicyEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_ENTRY*,
    nEntries : UInt32

  @[Extern]
  record DNS_SERVICE_INSTANCE,
    pszInstanceName : Win32cr::Foundation::PWSTR,
    pszHostName : Win32cr::Foundation::PWSTR,
    ip4Address : UInt32*,
    ip6Address : Win32cr::NetworkManagement::Dns::IP6_ADDRESS*,
    wPort : UInt16,
    wPriority : UInt16,
    wWeight : UInt16,
    dwPropertyCount : UInt32,
    keys : Win32cr::Foundation::PWSTR*,
    values : Win32cr::Foundation::PWSTR*,
    dwInterfaceIndex : UInt32

  @[Extern]
  record DNS_SERVICE_CANCEL,
    reserved : Void*

  @[Extern]
  record DNS_SERVICE_BROWSE_REQUEST,
    version : UInt32,
    interface_index : UInt32,
    query_name : Win32cr::Foundation::PWSTR,
    anonymous : Anonymous_e__Union_,
    pQueryContext : Void* do

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    record Anonymous_e__Union_,
      pBrowseCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_BROWSE_CALLBACK,
      pBrowseCallbackV2 : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE

  end

  @[Extern]
  record DNS_SERVICE_RESOLVE_REQUEST,
    version : UInt32,
    interface_index : UInt32,
    query_name : Win32cr::Foundation::PWSTR,
    pResolveCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_RESOLVE_COMPLETE,
    pQueryContext : Void*

  @[Extern]
  record DNS_SERVICE_REGISTER_REQUEST,
    version : UInt32,
    interface_index : UInt32,
    pServiceInstance : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*,
    pRegisterCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_REGISTER_COMPLETE,
    pQueryContext : Void*,
    hCredentials : Win32cr::Foundation::HANDLE,
    unicastEnabled : Win32cr::Foundation::BOOL

  @[Extern]
  record MDNS_QUERY_HANDLE,
    nameBuf : UInt16[256],
    wType : UInt16,
    pSubscription : Void*,
    pWnfCallbackParams : Void*,
    stateNameData : UInt32[2]

  @[Extern]
  record MDNS_QUERY_REQUEST,
    version : UInt32,
    ulRefCount : UInt32,
    query : Win32cr::Foundation::PWSTR,
    query_type : UInt16,
    query_options : UInt64,
    interface_index : UInt32,
    pQueryCallback : Win32cr::NetworkManagement::Dns::PMDNS_QUERY_CALLBACK,
    pQueryContext : Void*,
    fAnswerReceived : Win32cr::Foundation::BOOL,
    ulResendCount : UInt32

  {% if flag?(:i386) %}
  @[Extern(union: true)]
  record IP6_ADDRESS,
    ip6_dword : UInt32[4],
    ip6_word : UInt16[8],
    ip6_byte : UInt8[16]
  {% end %}

  @[Link("dnsapi")]
  lib C
    fun DnsQueryConfig(config : Win32cr::NetworkManagement::Dns::DNS_CONFIG_TYPE, flag : UInt32, pwsAdapterName : Win32cr::Foundation::PWSTR, pReserved : Void*, pBuffer : Void*, pBufLen : UInt32*) : Int32

    fun DnsRecordCopyEx(pRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, char_set_in : Win32cr::NetworkManagement::Dns::DNS_CHARSET, char_set_out : Win32cr::NetworkManagement::Dns::DNS_CHARSET) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

    fun DnsRecordSetCopyEx(pRecordSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, char_set_in : Win32cr::NetworkManagement::Dns::DNS_CHARSET, char_set_out : Win32cr::NetworkManagement::Dns::DNS_CHARSET) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

    fun DnsRecordCompare(pRecord1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pRecord2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*) : Win32cr::Foundation::BOOL

    fun DnsRecordSetCompare(pRR1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pRR2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, ppDiff1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, ppDiff2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Win32cr::Foundation::BOOL

    fun DnsRecordSetDetach(pRecordList : Win32cr::NetworkManagement::Dns::DNS_RECORDA*) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

    fun DnsFree(pData : Void*, free_type : Win32cr::NetworkManagement::Dns::DNS_FREE_TYPE) : Void

    fun DnsQuery_A(pszName : Win32cr::Foundation::PSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32

    fun DnsQuery_UTF8(pszName : Win32cr::Foundation::PSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32

    fun DnsQuery_W(pszName : Win32cr::Foundation::PWSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32

    fun DnsQueryEx(pQueryRequest : Win32cr::NetworkManagement::Dns::DNS_QUERY_REQUEST*, pQueryResults : Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_QUERY_CANCEL*) : Int32

    fun DnsCancelQuery(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_QUERY_CANCEL*) : Int32

    fun DnsFreeCustomServers(pcServers : UInt32*, ppServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER**) : Void

    fun DnsGetApplicationSettings(pcServers : UInt32*, ppDefaultServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER**, pSettings : Win32cr::NetworkManagement::Dns::DNS_APPLICATION_SETTINGS*) : UInt32

    fun DnsSetApplicationSettings(cServers : UInt32, pServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER*, pSettings : Win32cr::NetworkManagement::Dns::DNS_APPLICATION_SETTINGS*) : UInt32

    fun DnsAcquireContextHandle_W(credential_flags : UInt32, credentials : Void*, pContext : Win32cr::NetworkManagement::Dns::DnsContextHandle*) : Int32

    fun DnsAcquireContextHandle_A(credential_flags : UInt32, credentials : Void*, pContext : Win32cr::NetworkManagement::Dns::DnsContextHandle*) : Int32

    fun DnsReleaseContextHandle(hContext : Win32cr::Foundation::HANDLE) : Void

    fun DnsModifyRecordsInSet_W(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32

    fun DnsModifyRecordsInSet_A(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32

    fun DnsModifyRecordsInSet_UTF8(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32

    fun DnsReplaceRecordSetW(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32

    fun DnsReplaceRecordSetA(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32

    fun DnsReplaceRecordSetUTF8(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32

    fun DnsValidateName_W(pszName : Win32cr::Foundation::PWSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32

    fun DnsValidateName_A(pszName : Win32cr::Foundation::PSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32

    fun DnsValidateName_UTF8(pszName : Win32cr::Foundation::PSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32

    fun DnsNameCompare_A(pName1 : Win32cr::Foundation::PSTR, pName2 : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    fun DnsNameCompare_W(pName1 : Win32cr::Foundation::PWSTR, pName2 : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun DnsWriteQuestionToBuffer_W(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, pdwBufferSize : UInt32*, pszName : Win32cr::Foundation::PWSTR, wType : UInt16, xid : UInt16, fRecursionDesired : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun DnsWriteQuestionToBuffer_UTF8(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, pdwBufferSize : UInt32*, pszName : Win32cr::Foundation::PSTR, wType : UInt16, xid : UInt16, fRecursionDesired : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun DnsExtractRecordsFromMessage_W(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, wMessageLength : UInt16, ppRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Int32

    fun DnsExtractRecordsFromMessage_UTF8(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, wMessageLength : UInt16, ppRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Int32

    fun DnsGetProxyInformation(hostName : Win32cr::Foundation::PWSTR, proxyInformation : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION*, defaultProxyInformation : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION*, completionRoutine : Win32cr::NetworkManagement::Dns::DNS_PROXY_COMPLETION_ROUTINE, completionContext : Void*) : UInt32

    fun DnsFreeProxyName(proxyName : Win32cr::Foundation::PWSTR) : Void

    fun DnsConnectionGetProxyInfoForHostUrl(pwszHostUrl : Win32cr::Foundation::PWSTR, pSelectionContext : UInt8*, dwSelectionContextLength : UInt32, dwExplicitInterfaceIndex : UInt32, pProxyInfoEx : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_EX*) : UInt32

    fun DnsConnectionFreeProxyInfoEx(pProxyInfoEx : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_EX*) : Void

    fun DnsConnectionGetProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : UInt32

    fun DnsConnectionFreeProxyInfo(pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : Void

    fun DnsConnectionSetProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : UInt32

    fun DnsConnectionDeleteProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE) : UInt32

    fun DnsConnectionGetProxyList(pwszConnectionName : Win32cr::Foundation::PWSTR, pProxyList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_LIST*) : UInt32

    fun DnsConnectionFreeProxyList(pProxyList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_LIST*) : Void

    fun DnsConnectionGetNameList(pNameList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME_LIST*) : UInt32

    fun DnsConnectionFreeNameList(pNameList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME_LIST*) : Void

    fun DnsConnectionUpdateIfIndexTable(pConnectionIfIndexEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_IFINDEX_LIST*) : UInt32

    fun DnsConnectionSetPolicyEntries(policy_entry_tag : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_TAG, pPolicyEntryList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_ENTRY_LIST*) : UInt32

    fun DnsConnectionDeletePolicyEntries(policy_entry_tag : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_TAG) : UInt32

    fun DnsServiceConstructInstance(pServiceName : Win32cr::Foundation::PWSTR, pHostName : Win32cr::Foundation::PWSTR, pIp4 : UInt32*, pIp6 : Win32cr::NetworkManagement::Dns::IP6_ADDRESS*, wPort : UInt16, wPriority : UInt16, wWeight : UInt16, dwPropertiesCount : UInt32, keys : Win32cr::Foundation::PWSTR*, values : Win32cr::Foundation::PWSTR*) : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*

    fun DnsServiceCopyInstance(pOrig : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*) : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*

    fun DnsServiceFreeInstance(pInstance : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*) : Void

    fun DnsServiceBrowse(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_BROWSE_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    fun DnsServiceBrowseCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    fun DnsServiceResolve(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_RESOLVE_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    fun DnsServiceResolveCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    fun DnsServiceRegister(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_REGISTER_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32

    fun DnsServiceDeRegister(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_REGISTER_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32

    fun DnsServiceRegisterCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32

    fun DnsStartMulticastQuery(pQueryRequest : Win32cr::NetworkManagement::Dns::MDNS_QUERY_REQUEST*, pHandle : Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*) : Int32

    fun DnsStopMulticastQuery(pHandle : Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*) : Int32

  end
end