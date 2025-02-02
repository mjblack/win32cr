require "./../foundation.cr"

module Win32cr::NetworkManagement::Dns
  extend self
  alias DnsContextHandle = LibC::IntPtrT
  alias DNS_PROXY_COMPLETION_ROUTINE = Proc(Void*, Int32, Void)

  alias PDNS_QUERY_COMPLETION_ROUTINE = Proc(Void*, Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, Void)

  alias PDNS_SERVICE_BROWSE_CALLBACK = Proc(UInt32, Void*, Win32cr::NetworkManagement::Dns::DNS_RECORDW*, Void)

  alias PDNS_SERVICE_RESOLVE_COMPLETE = Proc(UInt32, Void*, Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*, Void)

  alias PDNS_SERVICE_REGISTER_COMPLETE = Proc(UInt32, Void*, Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*, Void)

  alias PMDNS_QUERY_CALLBACK = Proc(Void*, Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*, Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, Void)

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
  struct IP4_ARRAY
    property addr_count : UInt32
    property addr_array : UInt32*
    def initialize(@addr_count : UInt32, @addr_array : UInt32*)
    end
  end

  {% if flag?(:x86_64) || flag?(:arm) %}
  @[Extern(union: true)]
  struct IP6_ADDRESS
    property ip6_qword : UInt64[2]
    property ip6_dword : UInt32[4]
    property ip6_word : UInt16[8]
    property ip6_byte : UInt8[16]
    def initialize(@ip6_qword : UInt64[2], @ip6_dword : UInt32[4], @ip6_word : UInt16[8], @ip6_byte : UInt8[16])
    end
  end
  {% end %}

  @[Extern]
  struct DNS_ADDR
    property max_sa : Win32cr::Foundation::CHAR[32]
    property data : Data_e__Union_

    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    struct Data_e__Union_
    property dns_addr_user_dword : UInt32[8]
    def initialize(@dns_addr_user_dword : UInt32[8])
    end
    end

    def initialize(@max_sa : Win32cr::Foundation::CHAR[32], @data : Data_e__Union_)
    end
  end

  @[Extern]
  struct DNS_ADDR_ARRAY
    property max_count : UInt32
    property addr_count : UInt32
    property tag : UInt32
    property family : UInt16
    property word_reserved : UInt16
    property flags : UInt32
    property match_flag : UInt32
    property reserved1 : UInt32
    property reserved2 : UInt32
    property addr_array : Win32cr::NetworkManagement::Dns::DNS_ADDR*
    def initialize(@max_count : UInt32, @addr_count : UInt32, @tag : UInt32, @family : UInt16, @word_reserved : UInt16, @flags : UInt32, @match_flag : UInt32, @reserved1 : UInt32, @reserved2 : UInt32, @addr_array : Win32cr::NetworkManagement::Dns::DNS_ADDR*)
    end
  end

  @[Extern]
  struct DNS_HEADER
    property xid : UInt16
    property _bitfield1 : UInt8
    property _bitfield2 : UInt8
    property question_count : UInt16
    property answer_count : UInt16
    property name_server_count : UInt16
    property additional_count : UInt16
    def initialize(@xid : UInt16, @_bitfield1 : UInt8, @_bitfield2 : UInt8, @question_count : UInt16, @answer_count : UInt16, @name_server_count : UInt16, @additional_count : UInt16)
    end
  end

  @[Extern]
  struct DNS_HEADER_EXT
    property _bitfield : UInt16
    property chRcode : UInt8
    property chVersion : UInt8
    def initialize(@_bitfield : UInt16, @chRcode : UInt8, @chVersion : UInt8)
    end
  end

  @[Extern]
  struct DNS_WIRE_QUESTION
    property question_type : UInt16
    property question_class : UInt16
    def initialize(@question_type : UInt16, @question_class : UInt16)
    end
  end

  @[Extern]
  struct DNS_WIRE_RECORD
    property record_type : UInt16
    property record_class : UInt16
    property time_to_live : UInt32
    property data_length : UInt16
    def initialize(@record_type : UInt16, @record_class : UInt16, @time_to_live : UInt32, @data_length : UInt16)
    end
  end

  @[Extern]
  struct DNS_A_DATA
    property ip_address : UInt32
    def initialize(@ip_address : UInt32)
    end
  end

  @[Extern]
  struct DNS_PTR_DATAW
    property pNameHost : Win32cr::Foundation::PWSTR
    def initialize(@pNameHost : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DNS_PTR_DATAA
    property pNameHost : Win32cr::Foundation::PSTR
    def initialize(@pNameHost : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct DNS_SOA_DATAW
    property pNamePrimaryServer : Win32cr::Foundation::PWSTR
    property pNameAdministrator : Win32cr::Foundation::PWSTR
    property dwSerialNo : UInt32
    property dwRefresh : UInt32
    property dwRetry : UInt32
    property dwExpire : UInt32
    property dwDefaultTtl : UInt32
    def initialize(@pNamePrimaryServer : Win32cr::Foundation::PWSTR, @pNameAdministrator : Win32cr::Foundation::PWSTR, @dwSerialNo : UInt32, @dwRefresh : UInt32, @dwRetry : UInt32, @dwExpire : UInt32, @dwDefaultTtl : UInt32)
    end
  end

  @[Extern]
  struct DNS_SOA_DATAA
    property pNamePrimaryServer : Win32cr::Foundation::PSTR
    property pNameAdministrator : Win32cr::Foundation::PSTR
    property dwSerialNo : UInt32
    property dwRefresh : UInt32
    property dwRetry : UInt32
    property dwExpire : UInt32
    property dwDefaultTtl : UInt32
    def initialize(@pNamePrimaryServer : Win32cr::Foundation::PSTR, @pNameAdministrator : Win32cr::Foundation::PSTR, @dwSerialNo : UInt32, @dwRefresh : UInt32, @dwRetry : UInt32, @dwExpire : UInt32, @dwDefaultTtl : UInt32)
    end
  end

  @[Extern]
  struct DNS_MINFO_DATAW
    property pNameMailbox : Win32cr::Foundation::PWSTR
    property pNameErrorsMailbox : Win32cr::Foundation::PWSTR
    def initialize(@pNameMailbox : Win32cr::Foundation::PWSTR, @pNameErrorsMailbox : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DNS_MINFO_DATAA
    property pNameMailbox : Win32cr::Foundation::PSTR
    property pNameErrorsMailbox : Win32cr::Foundation::PSTR
    def initialize(@pNameMailbox : Win32cr::Foundation::PSTR, @pNameErrorsMailbox : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct DNS_MX_DATAW
    property pNameExchange : Win32cr::Foundation::PWSTR
    property wPreference : UInt16
    property pad : UInt16
    def initialize(@pNameExchange : Win32cr::Foundation::PWSTR, @wPreference : UInt16, @pad : UInt16)
    end
  end

  @[Extern]
  struct DNS_MX_DATAA
    property pNameExchange : Win32cr::Foundation::PSTR
    property wPreference : UInt16
    property pad : UInt16
    def initialize(@pNameExchange : Win32cr::Foundation::PSTR, @wPreference : UInt16, @pad : UInt16)
    end
  end

  @[Extern]
  struct DNS_TXT_DATAW
    property dwStringCount : UInt32
    property pStringArray : Win32cr::Foundation::PWSTR*
    def initialize(@dwStringCount : UInt32, @pStringArray : Win32cr::Foundation::PWSTR*)
    end
  end

  @[Extern]
  struct DNS_TXT_DATAA
    property dwStringCount : UInt32
    property pStringArray : Win32cr::Foundation::PSTR*
    def initialize(@dwStringCount : UInt32, @pStringArray : Win32cr::Foundation::PSTR*)
    end
  end

  @[Extern]
  struct DNS_NULL_DATA
    property dwByteCount : UInt32
    property data : UInt8*
    def initialize(@dwByteCount : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct DNS_WKS_DATA
    property ip_address : UInt32
    property chProtocol : UInt8
    property bit_mask : UInt8*
    def initialize(@ip_address : UInt32, @chProtocol : UInt8, @bit_mask : UInt8*)
    end
  end

  @[Extern]
  struct DNS_AAAA_DATA
    property ip6_address : Win32cr::NetworkManagement::Dns::IP6_ADDRESS
    def initialize(@ip6_address : Win32cr::NetworkManagement::Dns::IP6_ADDRESS)
    end
  end

  @[Extern]
  struct DNS_SIG_DATAW
    property wTypeCovered : UInt16
    property chAlgorithm : UInt8
    property chLabelCount : UInt8
    property dwOriginalTtl : UInt32
    property dwExpiration : UInt32
    property dwTimeSigned : UInt32
    property wKeyTag : UInt16
    property wSignatureLength : UInt16
    property pNameSigner : Win32cr::Foundation::PWSTR
    property signature : UInt8*
    def initialize(@wTypeCovered : UInt16, @chAlgorithm : UInt8, @chLabelCount : UInt8, @dwOriginalTtl : UInt32, @dwExpiration : UInt32, @dwTimeSigned : UInt32, @wKeyTag : UInt16, @wSignatureLength : UInt16, @pNameSigner : Win32cr::Foundation::PWSTR, @signature : UInt8*)
    end
  end

  @[Extern]
  struct DNS_SIG_DATAA
    property wTypeCovered : UInt16
    property chAlgorithm : UInt8
    property chLabelCount : UInt8
    property dwOriginalTtl : UInt32
    property dwExpiration : UInt32
    property dwTimeSigned : UInt32
    property wKeyTag : UInt16
    property wSignatureLength : UInt16
    property pNameSigner : Win32cr::Foundation::PSTR
    property signature : UInt8*
    def initialize(@wTypeCovered : UInt16, @chAlgorithm : UInt8, @chLabelCount : UInt8, @dwOriginalTtl : UInt32, @dwExpiration : UInt32, @dwTimeSigned : UInt32, @wKeyTag : UInt16, @wSignatureLength : UInt16, @pNameSigner : Win32cr::Foundation::PSTR, @signature : UInt8*)
    end
  end

  @[Extern]
  struct DNS_KEY_DATA
    property wFlags : UInt16
    property chProtocol : UInt8
    property chAlgorithm : UInt8
    property wKeyLength : UInt16
    property wPad : UInt16
    property key : UInt8*
    def initialize(@wFlags : UInt16, @chProtocol : UInt8, @chAlgorithm : UInt8, @wKeyLength : UInt16, @wPad : UInt16, @key : UInt8*)
    end
  end

  @[Extern]
  struct DNS_DHCID_DATA
    property dwByteCount : UInt32
    property dhcid : UInt8*
    def initialize(@dwByteCount : UInt32, @dhcid : UInt8*)
    end
  end

  @[Extern]
  struct DNS_NSEC_DATAW
    property pNextDomainName : Win32cr::Foundation::PWSTR
    property wTypeBitMapsLength : UInt16
    property wPad : UInt16
    property type_bit_maps : UInt8*
    def initialize(@pNextDomainName : Win32cr::Foundation::PWSTR, @wTypeBitMapsLength : UInt16, @wPad : UInt16, @type_bit_maps : UInt8*)
    end
  end

  @[Extern]
  struct DNS_NSEC_DATAA
    property pNextDomainName : Win32cr::Foundation::PSTR
    property wTypeBitMapsLength : UInt16
    property wPad : UInt16
    property type_bit_maps : UInt8*
    def initialize(@pNextDomainName : Win32cr::Foundation::PSTR, @wTypeBitMapsLength : UInt16, @wPad : UInt16, @type_bit_maps : UInt8*)
    end
  end

  @[Extern]
  struct DNS_NSEC3_DATA
    property chAlgorithm : UInt8
    property bFlags : UInt8
    property wIterations : UInt16
    property bSaltLength : UInt8
    property bHashLength : UInt8
    property wTypeBitMapsLength : UInt16
    property chData : UInt8*
    def initialize(@chAlgorithm : UInt8, @bFlags : UInt8, @wIterations : UInt16, @bSaltLength : UInt8, @bHashLength : UInt8, @wTypeBitMapsLength : UInt16, @chData : UInt8*)
    end
  end

  @[Extern]
  struct DNS_NSEC3PARAM_DATA
    property chAlgorithm : UInt8
    property bFlags : UInt8
    property wIterations : UInt16
    property bSaltLength : UInt8
    property bPad : UInt8[3]
    property pbSalt : UInt8*
    def initialize(@chAlgorithm : UInt8, @bFlags : UInt8, @wIterations : UInt16, @bSaltLength : UInt8, @bPad : UInt8[3], @pbSalt : UInt8*)
    end
  end

  @[Extern]
  struct DNS_TLSA_DATA
    property bCertUsage : UInt8
    property bSelector : UInt8
    property bMatchingType : UInt8
    property bCertificateAssociationDataLength : UInt16
    property bPad : UInt8[3]
    property bCertificateAssociationData : UInt8*
    def initialize(@bCertUsage : UInt8, @bSelector : UInt8, @bMatchingType : UInt8, @bCertificateAssociationDataLength : UInt16, @bPad : UInt8[3], @bCertificateAssociationData : UInt8*)
    end
  end

  @[Extern]
  struct DNS_DS_DATA
    property wKeyTag : UInt16
    property chAlgorithm : UInt8
    property chDigestType : UInt8
    property wDigestLength : UInt16
    property wPad : UInt16
    property digest : UInt8*
    def initialize(@wKeyTag : UInt16, @chAlgorithm : UInt8, @chDigestType : UInt8, @wDigestLength : UInt16, @wPad : UInt16, @digest : UInt8*)
    end
  end

  @[Extern]
  struct DNS_OPT_DATA
    property wDataLength : UInt16
    property wPad : UInt16
    property data : UInt8*
    def initialize(@wDataLength : UInt16, @wPad : UInt16, @data : UInt8*)
    end
  end

  @[Extern]
  struct DNS_LOC_DATA
    property wVersion : UInt16
    property wSize : UInt16
    property wHorPrec : UInt16
    property wVerPrec : UInt16
    property dwLatitude : UInt32
    property dwLongitude : UInt32
    property dwAltitude : UInt32
    def initialize(@wVersion : UInt16, @wSize : UInt16, @wHorPrec : UInt16, @wVerPrec : UInt16, @dwLatitude : UInt32, @dwLongitude : UInt32, @dwAltitude : UInt32)
    end
  end

  @[Extern]
  struct DNS_NXT_DATAW
    property pNameNext : Win32cr::Foundation::PWSTR
    property wNumTypes : UInt16
    property wTypes : UInt16*
    def initialize(@pNameNext : Win32cr::Foundation::PWSTR, @wNumTypes : UInt16, @wTypes : UInt16*)
    end
  end

  @[Extern]
  struct DNS_NXT_DATAA
    property pNameNext : Win32cr::Foundation::PSTR
    property wNumTypes : UInt16
    property wTypes : UInt16*
    def initialize(@pNameNext : Win32cr::Foundation::PSTR, @wNumTypes : UInt16, @wTypes : UInt16*)
    end
  end

  @[Extern]
  struct DNS_SRV_DATAW
    property pNameTarget : Win32cr::Foundation::PWSTR
    property wPriority : UInt16
    property wWeight : UInt16
    property wPort : UInt16
    property pad : UInt16
    def initialize(@pNameTarget : Win32cr::Foundation::PWSTR, @wPriority : UInt16, @wWeight : UInt16, @wPort : UInt16, @pad : UInt16)
    end
  end

  @[Extern]
  struct DNS_SRV_DATAA
    property pNameTarget : Win32cr::Foundation::PSTR
    property wPriority : UInt16
    property wWeight : UInt16
    property wPort : UInt16
    property pad : UInt16
    def initialize(@pNameTarget : Win32cr::Foundation::PSTR, @wPriority : UInt16, @wWeight : UInt16, @wPort : UInt16, @pad : UInt16)
    end
  end

  @[Extern]
  struct DNS_NAPTR_DATAW
    property wOrder : UInt16
    property wPreference : UInt16
    property pFlags : Win32cr::Foundation::PWSTR
    property pService : Win32cr::Foundation::PWSTR
    property pRegularExpression : Win32cr::Foundation::PWSTR
    property pReplacement : Win32cr::Foundation::PWSTR
    def initialize(@wOrder : UInt16, @wPreference : UInt16, @pFlags : Win32cr::Foundation::PWSTR, @pService : Win32cr::Foundation::PWSTR, @pRegularExpression : Win32cr::Foundation::PWSTR, @pReplacement : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DNS_NAPTR_DATAA
    property wOrder : UInt16
    property wPreference : UInt16
    property pFlags : Win32cr::Foundation::PSTR
    property pService : Win32cr::Foundation::PSTR
    property pRegularExpression : Win32cr::Foundation::PSTR
    property pReplacement : Win32cr::Foundation::PSTR
    def initialize(@wOrder : UInt16, @wPreference : UInt16, @pFlags : Win32cr::Foundation::PSTR, @pService : Win32cr::Foundation::PSTR, @pRegularExpression : Win32cr::Foundation::PSTR, @pReplacement : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct DNS_ATMA_DATA
    property address_type : UInt8
    property address : UInt8[20]
    def initialize(@address_type : UInt8, @address : UInt8[20])
    end
  end

  @[Extern]
  struct DNS_TKEY_DATAW
    property pNameAlgorithm : Win32cr::Foundation::PWSTR
    property pAlgorithmPacket : UInt8*
    property pKey : UInt8*
    property pOtherData : UInt8*
    property dwCreateTime : UInt32
    property dwExpireTime : UInt32
    property wMode : UInt16
    property wError : UInt16
    property wKeyLength : UInt16
    property wOtherLength : UInt16
    property cAlgNameLength : UInt8
    property bPacketPointers : Win32cr::Foundation::BOOL
    def initialize(@pNameAlgorithm : Win32cr::Foundation::PWSTR, @pAlgorithmPacket : UInt8*, @pKey : UInt8*, @pOtherData : UInt8*, @dwCreateTime : UInt32, @dwExpireTime : UInt32, @wMode : UInt16, @wError : UInt16, @wKeyLength : UInt16, @wOtherLength : UInt16, @cAlgNameLength : UInt8, @bPacketPointers : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DNS_TKEY_DATAA
    property pNameAlgorithm : Win32cr::Foundation::PSTR
    property pAlgorithmPacket : UInt8*
    property pKey : UInt8*
    property pOtherData : UInt8*
    property dwCreateTime : UInt32
    property dwExpireTime : UInt32
    property wMode : UInt16
    property wError : UInt16
    property wKeyLength : UInt16
    property wOtherLength : UInt16
    property cAlgNameLength : UInt8
    property bPacketPointers : Win32cr::Foundation::BOOL
    def initialize(@pNameAlgorithm : Win32cr::Foundation::PSTR, @pAlgorithmPacket : UInt8*, @pKey : UInt8*, @pOtherData : UInt8*, @dwCreateTime : UInt32, @dwExpireTime : UInt32, @wMode : UInt16, @wError : UInt16, @wKeyLength : UInt16, @wOtherLength : UInt16, @cAlgNameLength : UInt8, @bPacketPointers : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DNS_TSIG_DATAW
    property pNameAlgorithm : Win32cr::Foundation::PWSTR
    property pAlgorithmPacket : UInt8*
    property pSignature : UInt8*
    property pOtherData : UInt8*
    property i64CreateTime : Int64
    property wFudgeTime : UInt16
    property wOriginalXid : UInt16
    property wError : UInt16
    property wSigLength : UInt16
    property wOtherLength : UInt16
    property cAlgNameLength : UInt8
    property bPacketPointers : Win32cr::Foundation::BOOL
    def initialize(@pNameAlgorithm : Win32cr::Foundation::PWSTR, @pAlgorithmPacket : UInt8*, @pSignature : UInt8*, @pOtherData : UInt8*, @i64CreateTime : Int64, @wFudgeTime : UInt16, @wOriginalXid : UInt16, @wError : UInt16, @wSigLength : UInt16, @wOtherLength : UInt16, @cAlgNameLength : UInt8, @bPacketPointers : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DNS_TSIG_DATAA
    property pNameAlgorithm : Win32cr::Foundation::PSTR
    property pAlgorithmPacket : UInt8*
    property pSignature : UInt8*
    property pOtherData : UInt8*
    property i64CreateTime : Int64
    property wFudgeTime : UInt16
    property wOriginalXid : UInt16
    property wError : UInt16
    property wSigLength : UInt16
    property wOtherLength : UInt16
    property cAlgNameLength : UInt8
    property bPacketPointers : Win32cr::Foundation::BOOL
    def initialize(@pNameAlgorithm : Win32cr::Foundation::PSTR, @pAlgorithmPacket : UInt8*, @pSignature : UInt8*, @pOtherData : UInt8*, @i64CreateTime : Int64, @wFudgeTime : UInt16, @wOriginalXid : UInt16, @wError : UInt16, @wSigLength : UInt16, @wOtherLength : UInt16, @cAlgNameLength : UInt8, @bPacketPointers : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct DNS_UNKNOWN_DATA
    property dwByteCount : UInt32
    property bData : UInt8*
    def initialize(@dwByteCount : UInt32, @bData : UInt8*)
    end
  end

  @[Extern]
  struct DNS_WINS_DATA
    property dwMappingFlag : UInt32
    property dwLookupTimeout : UInt32
    property dwCacheTimeout : UInt32
    property cWinsServerCount : UInt32
    property wins_servers : UInt32*
    def initialize(@dwMappingFlag : UInt32, @dwLookupTimeout : UInt32, @dwCacheTimeout : UInt32, @cWinsServerCount : UInt32, @wins_servers : UInt32*)
    end
  end

  @[Extern]
  struct DNS_WINSR_DATAW
    property dwMappingFlag : UInt32
    property dwLookupTimeout : UInt32
    property dwCacheTimeout : UInt32
    property pNameResultDomain : Win32cr::Foundation::PWSTR
    def initialize(@dwMappingFlag : UInt32, @dwLookupTimeout : UInt32, @dwCacheTimeout : UInt32, @pNameResultDomain : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DNS_WINSR_DATAA
    property dwMappingFlag : UInt32
    property dwLookupTimeout : UInt32
    property dwCacheTimeout : UInt32
    property pNameResultDomain : Win32cr::Foundation::PSTR
    def initialize(@dwMappingFlag : UInt32, @dwLookupTimeout : UInt32, @dwCacheTimeout : UInt32, @pNameResultDomain : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct DNS_RECORD_FLAGS
    property _bitfield : UInt32
    def initialize(@_bitfield : UInt32)
    end
  end

  @[Extern]
  struct DNS_RECORDW
    property pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDW*
    property pName : Win32cr::Foundation::PWSTR
    property wType : UInt16
    property wDataLength : UInt16
    property flags : Flags_e__Union_
    property dwTtl : UInt32
    property dwReserved : UInt32
    property data : Data_e__Union_

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    struct Flags_e__Union_
    property dw : UInt32
    property s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS
    def initialize(@dw : UInt32, @s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS)
    end
    end


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    struct Data_e__Union_
    property a : Win32cr::NetworkManagement::Dns::DNS_A_DATA
    property soa : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAW
    property soa_ : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAW
    property ptr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property ptr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property ns : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property ns_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property cname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property cname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property dname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property dname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mb : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mb_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property md : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property md_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mf : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mf_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mg : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mg_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property mr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW
    property minfo : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW
    property minfo_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW
    property rp : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW
    property rp_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW
    property mx : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW
    property mx_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW
    property afsdb : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW
    property afsdb_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW
    property rt : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW
    property rt_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW
    property hinfo : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property hinfo_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property isdn : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property isdn_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property txt : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property txt_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property x25 : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW
    property null : Win32cr::NetworkManagement::Dns::DNS_NULL_DATA
    property wks : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA
    property wks_ : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA
    property aaaa : Win32cr::NetworkManagement::Dns::DNS_AAAA_DATA
    property key : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property key_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property sig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW
    property sig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW
    property atma : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA
    property atma_ : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA
    property nxt : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAW
    property nxt_ : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAW
    property srv : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAW
    property srv_ : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAW
    property naptr : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAW
    property naptr_ : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAW
    property opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    property opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    property ds : Win32cr::NetworkManagement::Dns::DNS_DS_DATA
    property ds_ : Win32cr::NetworkManagement::Dns::DNS_DS_DATA
    property rrsig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW
    property rrsig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW
    property nsec : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAW
    property nsec_ : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAW
    property dnskey : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property dnskey_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property tkey : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAW
    property tkey_ : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAW
    property tsig : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAW
    property tsig_ : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAW
    property wins : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA
    property wins_ : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA
    property winsr : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW
    property wins_r : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW
    property nbstat : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW
    property nbstat_ : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW
    property dhcid : Win32cr::NetworkManagement::Dns::DNS_DHCID_DATA
    property nsec3 : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA
    property nsec3_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA
    property nsec3_param : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA
    property nsec3_param_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA
    property tlsa : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA
    property tlsa_ : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA
    property unknown : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA
    property unknown_ : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA
    property pDataPtr : UInt8*
    def initialize(@a : Win32cr::NetworkManagement::Dns::DNS_A_DATA, @soa : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAW, @soa_ : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAW, @ptr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @ptr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @ns : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @ns_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @cname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @cname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @dname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @dname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mb : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mb_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @md : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @md_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mf : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mf_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mg : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mg_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @mr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAW, @minfo : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW, @minfo_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW, @rp : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW, @rp_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAW, @mx : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW, @mx_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW, @afsdb : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW, @afsdb_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW, @rt : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW, @rt_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAW, @hinfo : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @hinfo_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @isdn : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @isdn_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @txt : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @txt_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @x25 : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAW, @null : Win32cr::NetworkManagement::Dns::DNS_NULL_DATA, @wks : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA, @wks_ : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA, @aaaa : Win32cr::NetworkManagement::Dns::DNS_AAAA_DATA, @key : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @key_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @sig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW, @sig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW, @atma : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA, @atma_ : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA, @nxt : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAW, @nxt_ : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAW, @srv : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAW, @srv_ : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAW, @naptr : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAW, @naptr_ : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAW, @opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA, @opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA, @ds : Win32cr::NetworkManagement::Dns::DNS_DS_DATA, @ds_ : Win32cr::NetworkManagement::Dns::DNS_DS_DATA, @rrsig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW, @rrsig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAW, @nsec : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAW, @nsec_ : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAW, @dnskey : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @dnskey_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @tkey : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAW, @tkey_ : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAW, @tsig : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAW, @tsig_ : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAW, @wins : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA, @wins_ : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA, @winsr : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW, @wins_r : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW, @nbstat : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW, @nbstat_ : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAW, @dhcid : Win32cr::NetworkManagement::Dns::DNS_DHCID_DATA, @nsec3 : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA, @nsec3_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA, @nsec3_param : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA, @nsec3_param_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA, @tlsa : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA, @tlsa_ : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA, @unknown : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA, @unknown_ : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA, @pDataPtr : UInt8*)
    end
    end

    def initialize(@pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDW*, @pName : Win32cr::Foundation::PWSTR, @wType : UInt16, @wDataLength : UInt16, @flags : Flags_e__Union_, @dwTtl : UInt32, @dwReserved : UInt32, @data : Data_e__Union_)
    end
  end

  @[Extern]
  struct DnsRecordOptW_
    property pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDW*
    property pName : Win32cr::Foundation::PWSTR
    property wType : UInt16
    property wDataLength : UInt16
    property flags : Flags_e__Union_
    property ext_header : Win32cr::NetworkManagement::Dns::DNS_HEADER_EXT
    property wPayloadSize : UInt16
    property wReserved : UInt16
    property data : Data_e__Union_

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    struct Flags_e__Union_
    property dw : UInt32
    property s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS
    def initialize(@dw : UInt32, @s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS)
    end
    end


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    struct Data_e__Union_
    property opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    property opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    def initialize(@opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA, @opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA)
    end
    end

    def initialize(@pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDW*, @pName : Win32cr::Foundation::PWSTR, @wType : UInt16, @wDataLength : UInt16, @flags : Flags_e__Union_, @ext_header : Win32cr::NetworkManagement::Dns::DNS_HEADER_EXT, @wPayloadSize : UInt16, @wReserved : UInt16, @data : Data_e__Union_)
    end
  end

  @[Extern]
  struct DNS_RECORDA
    property pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    property pName : Win32cr::Foundation::PSTR
    property wType : UInt16
    property wDataLength : UInt16
    property flags : Flags_e__Union_
    property dwTtl : UInt32
    property dwReserved : UInt32
    property data : Data_e__Union_

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    struct Flags_e__Union_
    property dw : UInt32
    property s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS
    def initialize(@dw : UInt32, @s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS)
    end
    end


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    struct Data_e__Union_
    property a : Win32cr::NetworkManagement::Dns::DNS_A_DATA
    property soa : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAA
    property soa_ : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAA
    property ptr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property ptr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property ns : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property ns_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property cname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property cname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property dname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property dname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mb : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mb_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property md : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property md_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mf : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mf_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mg : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mg_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property mr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA
    property minfo : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA
    property minfo_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA
    property rp : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA
    property rp_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA
    property mx : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA
    property mx_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA
    property afsdb : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA
    property afsdb_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA
    property rt : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA
    property rt_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA
    property hinfo : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property hinfo_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property isdn : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property isdn_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property txt : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property txt_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property x25 : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA
    property null : Win32cr::NetworkManagement::Dns::DNS_NULL_DATA
    property wks : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA
    property wks_ : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA
    property aaaa : Win32cr::NetworkManagement::Dns::DNS_AAAA_DATA
    property key : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property key_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property sig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA
    property sig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA
    property atma : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA
    property atma_ : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA
    property nxt : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAA
    property nxt_ : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAA
    property srv : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAA
    property srv_ : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAA
    property naptr : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAA
    property naptr_ : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAA
    property opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    property opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    property ds : Win32cr::NetworkManagement::Dns::DNS_DS_DATA
    property ds_ : Win32cr::NetworkManagement::Dns::DNS_DS_DATA
    property rrsig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA
    property rrsig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA
    property nsec : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAA
    property nsec_ : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAA
    property dnskey : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property dnskey_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA
    property tkey : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAA
    property tkey_ : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAA
    property tsig : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAA
    property tsig_ : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAA
    property wins : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA
    property wins_ : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA
    property winsr : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA
    property wins_r : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA
    property nbstat : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA
    property nbstat_ : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA
    property dhcid : Win32cr::NetworkManagement::Dns::DNS_DHCID_DATA
    property nsec3 : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA
    property nsec3_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA
    property nsec3_param : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA
    property nsec3_param_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA
    property tlsa : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA
    property tlsa_ : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA
    property unknown : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA
    property unknown_ : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA
    property pDataPtr : UInt8*
    def initialize(@a : Win32cr::NetworkManagement::Dns::DNS_A_DATA, @soa : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAA, @soa_ : Win32cr::NetworkManagement::Dns::DNS_SOA_DATAA, @ptr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @ptr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @ns : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @ns_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @cname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @cname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @dname : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @dname_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mb : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mb_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @md : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @md_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mf : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mf_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mg : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mg_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mr : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @mr_ : Win32cr::NetworkManagement::Dns::DNS_PTR_DATAA, @minfo : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA, @minfo_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA, @rp : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA, @rp_ : Win32cr::NetworkManagement::Dns::DNS_MINFO_DATAA, @mx : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA, @mx_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA, @afsdb : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA, @afsdb_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA, @rt : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA, @rt_ : Win32cr::NetworkManagement::Dns::DNS_MX_DATAA, @hinfo : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @hinfo_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @isdn : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @isdn_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @txt : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @txt_ : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @x25 : Win32cr::NetworkManagement::Dns::DNS_TXT_DATAA, @null : Win32cr::NetworkManagement::Dns::DNS_NULL_DATA, @wks : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA, @wks_ : Win32cr::NetworkManagement::Dns::DNS_WKS_DATA, @aaaa : Win32cr::NetworkManagement::Dns::DNS_AAAA_DATA, @key : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @key_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @sig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA, @sig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA, @atma : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA, @atma_ : Win32cr::NetworkManagement::Dns::DNS_ATMA_DATA, @nxt : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAA, @nxt_ : Win32cr::NetworkManagement::Dns::DNS_NXT_DATAA, @srv : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAA, @srv_ : Win32cr::NetworkManagement::Dns::DNS_SRV_DATAA, @naptr : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAA, @naptr_ : Win32cr::NetworkManagement::Dns::DNS_NAPTR_DATAA, @opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA, @opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA, @ds : Win32cr::NetworkManagement::Dns::DNS_DS_DATA, @ds_ : Win32cr::NetworkManagement::Dns::DNS_DS_DATA, @rrsig : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA, @rrsig_ : Win32cr::NetworkManagement::Dns::DNS_SIG_DATAA, @nsec : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAA, @nsec_ : Win32cr::NetworkManagement::Dns::DNS_NSEC_DATAA, @dnskey : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @dnskey_ : Win32cr::NetworkManagement::Dns::DNS_KEY_DATA, @tkey : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAA, @tkey_ : Win32cr::NetworkManagement::Dns::DNS_TKEY_DATAA, @tsig : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAA, @tsig_ : Win32cr::NetworkManagement::Dns::DNS_TSIG_DATAA, @wins : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA, @wins_ : Win32cr::NetworkManagement::Dns::DNS_WINS_DATA, @winsr : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA, @wins_r : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA, @nbstat : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA, @nbstat_ : Win32cr::NetworkManagement::Dns::DNS_WINSR_DATAA, @dhcid : Win32cr::NetworkManagement::Dns::DNS_DHCID_DATA, @nsec3 : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA, @nsec3_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3_DATA, @nsec3_param : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA, @nsec3_param_ : Win32cr::NetworkManagement::Dns::DNS_NSEC3PARAM_DATA, @tlsa : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA, @tlsa_ : Win32cr::NetworkManagement::Dns::DNS_TLSA_DATA, @unknown : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA, @unknown_ : Win32cr::NetworkManagement::Dns::DNS_UNKNOWN_DATA, @pDataPtr : UInt8*)
    end
    end

    def initialize(@pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, @pName : Win32cr::Foundation::PSTR, @wType : UInt16, @wDataLength : UInt16, @flags : Flags_e__Union_, @dwTtl : UInt32, @dwReserved : UInt32, @data : Data_e__Union_)
    end
  end

  @[Extern]
  struct DnsRecordOptA_
    property pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    property pName : Win32cr::Foundation::PSTR
    property wType : UInt16
    property wDataLength : UInt16
    property flags : Flags_e__Union_
    property ext_header : Win32cr::NetworkManagement::Dns::DNS_HEADER_EXT
    property wPayloadSize : UInt16
    property wReserved : UInt16
    property data : Data_e__Union_

    # Nested Type Flags_e__Union_
    @[Extern(union: true)]
    struct Flags_e__Union_
    property dw : UInt32
    property s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS
    def initialize(@dw : UInt32, @s : Win32cr::NetworkManagement::Dns::DNS_RECORD_FLAGS)
    end
    end


    # Nested Type Data_e__Union_
    @[Extern(union: true)]
    struct Data_e__Union_
    property opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    property opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA
    def initialize(@opt : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA, @opt_ : Win32cr::NetworkManagement::Dns::DNS_OPT_DATA)
    end
    end

    def initialize(@pNext : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, @pName : Win32cr::Foundation::PSTR, @wType : UInt16, @wDataLength : UInt16, @flags : Flags_e__Union_, @ext_header : Win32cr::NetworkManagement::Dns::DNS_HEADER_EXT, @wPayloadSize : UInt16, @wReserved : UInt16, @data : Data_e__Union_)
    end
  end

  @[Extern]
  struct DNS_RRSET
    property pFirstRR : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    property pLastRR : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    def initialize(@pFirstRR : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, @pLastRR : Win32cr::NetworkManagement::Dns::DNS_RECORDA*)
    end
  end

  @[Extern]
  struct DNS_PROXY_INFORMATION
    property version : UInt32
    property proxyInformationType : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION_TYPE
    property proxyName : Win32cr::Foundation::PWSTR
    def initialize(@version : UInt32, @proxyInformationType : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION_TYPE, @proxyName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DNS_QUERY_RESULT
    property version : UInt32
    property query_status : Int32
    property query_options : UInt64
    property pQueryRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    property reserved : Void*
    def initialize(@version : UInt32, @query_status : Int32, @query_options : UInt64, @pQueryRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, @reserved : Void*)
    end
  end

  @[Extern]
  struct DNS_QUERY_REQUEST
    property version : UInt32
    property query_name : Win32cr::Foundation::PWSTR
    property query_type : UInt16
    property query_options : UInt64
    property pDnsServerList : Win32cr::NetworkManagement::Dns::DNS_ADDR_ARRAY*
    property interface_index : UInt32
    property pQueryCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE
    property pQueryContext : Void*
    def initialize(@version : UInt32, @query_name : Win32cr::Foundation::PWSTR, @query_type : UInt16, @query_options : UInt64, @pDnsServerList : Win32cr::NetworkManagement::Dns::DNS_ADDR_ARRAY*, @interface_index : UInt32, @pQueryCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE, @pQueryContext : Void*)
    end
  end

  @[Extern]
  struct DNS_QUERY_CANCEL
    property reserved : Win32cr::Foundation::CHAR[32]
    def initialize(@reserved : Win32cr::Foundation::CHAR[32])
    end
  end

  @[Extern]
  struct DNS_CUSTOM_SERVER
    property dwServerType : UInt32
    property ullFlags : UInt64
    property anonymous1 : Anonymous1_e__Union_
    property anonymous2 : Anonymous2_e__Union_

    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property pwszTemplate : Win32cr::Foundation::PWSTR
    def initialize(@pwszTemplate : Win32cr::Foundation::PWSTR)
    end
    end


    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property max_sa : Win32cr::Foundation::CHAR[32]
    def initialize(@max_sa : Win32cr::Foundation::CHAR[32])
    end
    end

    def initialize(@dwServerType : UInt32, @ullFlags : UInt64, @anonymous1 : Anonymous1_e__Union_, @anonymous2 : Anonymous2_e__Union_)
    end
  end

  @[Extern]
  struct DNS_QUERY_REQUEST3
    property version : UInt32
    property query_name : Win32cr::Foundation::PWSTR
    property query_type : UInt16
    property query_options : UInt64
    property pDnsServerList : Win32cr::NetworkManagement::Dns::DNS_ADDR_ARRAY*
    property interface_index : UInt32
    property pQueryCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE
    property pQueryContext : Void*
    property is_network_query_required : Win32cr::Foundation::BOOL
    property required_network_index : UInt32
    property cCustomServers : UInt32
    property pCustomServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER*
    def initialize(@version : UInt32, @query_name : Win32cr::Foundation::PWSTR, @query_type : UInt16, @query_options : UInt64, @pDnsServerList : Win32cr::NetworkManagement::Dns::DNS_ADDR_ARRAY*, @interface_index : UInt32, @pQueryCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE, @pQueryContext : Void*, @is_network_query_required : Win32cr::Foundation::BOOL, @required_network_index : UInt32, @cCustomServers : UInt32, @pCustomServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER*)
    end
  end

  @[Extern]
  struct DNS_APPLICATION_SETTINGS
    property version : UInt32
    property flags : UInt64
    def initialize(@version : UInt32, @flags : UInt64)
    end
  end

  @[Extern]
  struct DNS_MESSAGE_BUFFER
    property message_head : Win32cr::NetworkManagement::Dns::DNS_HEADER
    property message_body : Win32cr::Foundation::CHAR*
    def initialize(@message_head : Win32cr::NetworkManagement::Dns::DNS_HEADER, @message_body : Win32cr::Foundation::CHAR*)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_PROXY_INFO
    property version : UInt32
    property pwszFriendlyName : Win32cr::Foundation::PWSTR
    property flags : UInt32
    property switch : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_SWITCH
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property config : DNS_CONNECTION_PROXY_INFO_CONFIG_
    property script : DNS_CONNECTION_PROXY_INFO_SCRIPT_

      # Nested Type DNS_CONNECTION_PROXY_INFO_SCRIPT_
      @[Extern]
      struct DNS_CONNECTION_PROXY_INFO_SCRIPT_
    property pwszScript : Win32cr::Foundation::PWSTR
    property pwszUsername : Win32cr::Foundation::PWSTR
    property pwszPassword : Win32cr::Foundation::PWSTR
    def initialize(@pwszScript : Win32cr::Foundation::PWSTR, @pwszUsername : Win32cr::Foundation::PWSTR, @pwszPassword : Win32cr::Foundation::PWSTR)
    end
      end


      # Nested Type DNS_CONNECTION_PROXY_INFO_CONFIG_
      @[Extern]
      struct DNS_CONNECTION_PROXY_INFO_CONFIG_
    property pwszServer : Win32cr::Foundation::PWSTR
    property pwszUsername : Win32cr::Foundation::PWSTR
    property pwszPassword : Win32cr::Foundation::PWSTR
    property pwszException : Win32cr::Foundation::PWSTR
    property pwszExtraInfo : Win32cr::Foundation::PWSTR
    property port : UInt16
    def initialize(@pwszServer : Win32cr::Foundation::PWSTR, @pwszUsername : Win32cr::Foundation::PWSTR, @pwszPassword : Win32cr::Foundation::PWSTR, @pwszException : Win32cr::Foundation::PWSTR, @pwszExtraInfo : Win32cr::Foundation::PWSTR, @port : UInt16)
    end
      end

    def initialize(@config : DNS_CONNECTION_PROXY_INFO_CONFIG_, @script : DNS_CONNECTION_PROXY_INFO_SCRIPT_)
    end
    end

    def initialize(@version : UInt32, @pwszFriendlyName : Win32cr::Foundation::PWSTR, @flags : UInt32, @switch : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_SWITCH, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_PROXY_INFO_EX
    property proxy_info : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO
    property dwInterfaceIndex : UInt32
    property pwszConnectionName : Win32cr::Foundation::PWSTR
    property fDirectConfiguration : Win32cr::Foundation::BOOL
    property hConnection : Win32cr::Foundation::HANDLE
    def initialize(@proxy_info : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO, @dwInterfaceIndex : UInt32, @pwszConnectionName : Win32cr::Foundation::PWSTR, @fDirectConfiguration : Win32cr::Foundation::BOOL, @hConnection : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_PROXY_ELEMENT
    property type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE
    property info : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO
    def initialize(@type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, @info : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_PROXY_LIST
    property cProxies : UInt32
    property pProxies : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_ELEMENT*
    def initialize(@cProxies : UInt32, @pProxies : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_ELEMENT*)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_NAME
    property wszName : UInt16[65]
    def initialize(@wszName : UInt16[65])
    end
  end

  @[Extern]
  struct DNS_CONNECTION_NAME_LIST
    property cNames : UInt32
    property pNames : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME*
    def initialize(@cNames : UInt32, @pNames : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME*)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_IFINDEX_ENTRY
    property pwszConnectionName : Win32cr::Foundation::PWSTR
    property dwIfIndex : UInt32
    def initialize(@pwszConnectionName : Win32cr::Foundation::PWSTR, @dwIfIndex : UInt32)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_IFINDEX_LIST
    property pConnectionIfIndexEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_IFINDEX_ENTRY*
    property nEntries : UInt32
    def initialize(@pConnectionIfIndexEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_IFINDEX_ENTRY*, @nEntries : UInt32)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_POLICY_ENTRY
    property pwszHost : Win32cr::Foundation::PWSTR
    property pwszAppId : Win32cr::Foundation::PWSTR
    property cbAppSid : UInt32
    property pbAppSid : UInt8*
    property nConnections : UInt32
    property ppwszConnections : Win32cr::Foundation::PWSTR*
    property dwPolicyEntryFlags : UInt32
    def initialize(@pwszHost : Win32cr::Foundation::PWSTR, @pwszAppId : Win32cr::Foundation::PWSTR, @cbAppSid : UInt32, @pbAppSid : UInt8*, @nConnections : UInt32, @ppwszConnections : Win32cr::Foundation::PWSTR*, @dwPolicyEntryFlags : UInt32)
    end
  end

  @[Extern]
  struct DNS_CONNECTION_POLICY_ENTRY_LIST
    property pPolicyEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_ENTRY*
    property nEntries : UInt32
    def initialize(@pPolicyEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_ENTRY*, @nEntries : UInt32)
    end
  end

  @[Extern]
  struct DNS_SERVICE_INSTANCE
    property pszInstanceName : Win32cr::Foundation::PWSTR
    property pszHostName : Win32cr::Foundation::PWSTR
    property ip4Address : UInt32*
    property ip6Address : Win32cr::NetworkManagement::Dns::IP6_ADDRESS*
    property wPort : UInt16
    property wPriority : UInt16
    property wWeight : UInt16
    property dwPropertyCount : UInt32
    property keys : Win32cr::Foundation::PWSTR*
    property values : Win32cr::Foundation::PWSTR*
    property dwInterfaceIndex : UInt32
    def initialize(@pszInstanceName : Win32cr::Foundation::PWSTR, @pszHostName : Win32cr::Foundation::PWSTR, @ip4Address : UInt32*, @ip6Address : Win32cr::NetworkManagement::Dns::IP6_ADDRESS*, @wPort : UInt16, @wPriority : UInt16, @wWeight : UInt16, @dwPropertyCount : UInt32, @keys : Win32cr::Foundation::PWSTR*, @values : Win32cr::Foundation::PWSTR*, @dwInterfaceIndex : UInt32)
    end
  end

  @[Extern]
  struct DNS_SERVICE_CANCEL
    property reserved : Void*
    def initialize(@reserved : Void*)
    end
  end

  @[Extern]
  struct DNS_SERVICE_BROWSE_REQUEST
    property version : UInt32
    property interface_index : UInt32
    property query_name : Win32cr::Foundation::PWSTR
    property anonymous : Anonymous_e__Union_
    property pQueryContext : Void*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pBrowseCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_BROWSE_CALLBACK
    property pBrowseCallbackV2 : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE
    def initialize(@pBrowseCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_BROWSE_CALLBACK, @pBrowseCallbackV2 : Win32cr::NetworkManagement::Dns::PDNS_QUERY_COMPLETION_ROUTINE)
    end
    end

    def initialize(@version : UInt32, @interface_index : UInt32, @query_name : Win32cr::Foundation::PWSTR, @anonymous : Anonymous_e__Union_, @pQueryContext : Void*)
    end
  end

  @[Extern]
  struct DNS_SERVICE_RESOLVE_REQUEST
    property version : UInt32
    property interface_index : UInt32
    property query_name : Win32cr::Foundation::PWSTR
    property pResolveCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_RESOLVE_COMPLETE
    property pQueryContext : Void*
    def initialize(@version : UInt32, @interface_index : UInt32, @query_name : Win32cr::Foundation::PWSTR, @pResolveCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_RESOLVE_COMPLETE, @pQueryContext : Void*)
    end
  end

  @[Extern]
  struct DNS_SERVICE_REGISTER_REQUEST
    property version : UInt32
    property interface_index : UInt32
    property pServiceInstance : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*
    property pRegisterCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_REGISTER_COMPLETE
    property pQueryContext : Void*
    property hCredentials : Win32cr::Foundation::HANDLE
    property unicastEnabled : Win32cr::Foundation::BOOL
    def initialize(@version : UInt32, @interface_index : UInt32, @pServiceInstance : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*, @pRegisterCompletionCallback : Win32cr::NetworkManagement::Dns::PDNS_SERVICE_REGISTER_COMPLETE, @pQueryContext : Void*, @hCredentials : Win32cr::Foundation::HANDLE, @unicastEnabled : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct MDNS_QUERY_HANDLE
    property nameBuf : UInt16[256]
    property wType : UInt16
    property pSubscription : Void*
    property pWnfCallbackParams : Void*
    property stateNameData : UInt32[2]
    def initialize(@nameBuf : UInt16[256], @wType : UInt16, @pSubscription : Void*, @pWnfCallbackParams : Void*, @stateNameData : UInt32[2])
    end
  end

  @[Extern]
  struct MDNS_QUERY_REQUEST
    property version : UInt32
    property ulRefCount : UInt32
    property query : Win32cr::Foundation::PWSTR
    property query_type : UInt16
    property query_options : UInt64
    property interface_index : UInt32
    property pQueryCallback : Win32cr::NetworkManagement::Dns::PMDNS_QUERY_CALLBACK
    property pQueryContext : Void*
    property fAnswerReceived : Win32cr::Foundation::BOOL
    property ulResendCount : UInt32
    def initialize(@version : UInt32, @ulRefCount : UInt32, @query : Win32cr::Foundation::PWSTR, @query_type : UInt16, @query_options : UInt64, @interface_index : UInt32, @pQueryCallback : Win32cr::NetworkManagement::Dns::PMDNS_QUERY_CALLBACK, @pQueryContext : Void*, @fAnswerReceived : Win32cr::Foundation::BOOL, @ulResendCount : UInt32)
    end
  end

  {% if flag?(:i386) %}
  @[Extern(union: true)]
  struct IP6_ADDRESS
    property ip6_dword : UInt32[4]
    property ip6_word : UInt16[8]
    property ip6_byte : UInt8[16]
    def initialize(@ip6_dword : UInt32[4], @ip6_word : UInt16[8], @ip6_byte : UInt8[16])
    end
  end
  {% end %}

  def dnsQueryConfig(config : Win32cr::NetworkManagement::Dns::DNS_CONFIG_TYPE, flag : UInt32, pwsAdapterName : Win32cr::Foundation::PWSTR, pReserved : Void*, pBuffer : Void*, pBufLen : UInt32*) : Int32
    C.DnsQueryConfig(config, flag, pwsAdapterName, pReserved, pBuffer, pBufLen)
  end

  def dnsRecordCopyEx(pRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, char_set_in : Win32cr::NetworkManagement::Dns::DNS_CHARSET, char_set_out : Win32cr::NetworkManagement::Dns::DNS_CHARSET) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    C.DnsRecordCopyEx(pRecord, char_set_in, char_set_out)
  end

  def dnsRecordSetCopyEx(pRecordSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, char_set_in : Win32cr::NetworkManagement::Dns::DNS_CHARSET, char_set_out : Win32cr::NetworkManagement::Dns::DNS_CHARSET) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    C.DnsRecordSetCopyEx(pRecordSet, char_set_in, char_set_out)
  end

  def dnsRecordCompare(pRecord1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pRecord2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*) : Win32cr::Foundation::BOOL
    C.DnsRecordCompare(pRecord1, pRecord2)
  end

  def dnsRecordSetCompare(pRR1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pRR2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, ppDiff1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, ppDiff2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Win32cr::Foundation::BOOL
    C.DnsRecordSetCompare(pRR1, pRR2, ppDiff1, ppDiff2)
  end

  def dnsRecordSetDetach(pRecordList : Win32cr::NetworkManagement::Dns::DNS_RECORDA*) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*
    C.DnsRecordSetDetach(pRecordList)
  end

  def dnsFree(pData : Void*, free_type : Win32cr::NetworkManagement::Dns::DNS_FREE_TYPE) : Void
    C.DnsFree(pData, free_type)
  end

  def dnsQueryA(pszName : Win32cr::Foundation::PSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32
    C.DnsQuery_A(pszName, wType, options, pExtra, ppQueryResults, pReserved)
  end

  def dnsQueryUTF8(pszName : Win32cr::Foundation::PSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32
    C.DnsQuery_UTF8(pszName, wType, options, pExtra, ppQueryResults, pReserved)
  end

  def dnsQueryW(pszName : Win32cr::Foundation::PWSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32
    C.DnsQuery_W(pszName, wType, options, pExtra, ppQueryResults, pReserved)
  end

  def dnsQueryEx(pQueryRequest : Win32cr::NetworkManagement::Dns::DNS_QUERY_REQUEST*, pQueryResults : Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_QUERY_CANCEL*) : Int32
    C.DnsQueryEx(pQueryRequest, pQueryResults, pCancelHandle)
  end

  def dnsCancelQuery(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_QUERY_CANCEL*) : Int32
    C.DnsCancelQuery(pCancelHandle)
  end

  def dnsFreeCustomServers(pcServers : UInt32*, ppServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER**) : Void
    C.DnsFreeCustomServers(pcServers, ppServers)
  end

  def dnsGetApplicationSettings(pcServers : UInt32*, ppDefaultServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER**, pSettings : Win32cr::NetworkManagement::Dns::DNS_APPLICATION_SETTINGS*) : UInt32
    C.DnsGetApplicationSettings(pcServers, ppDefaultServers, pSettings)
  end

  def dnsSetApplicationSettings(cServers : UInt32, pServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER*, pSettings : Win32cr::NetworkManagement::Dns::DNS_APPLICATION_SETTINGS*) : UInt32
    C.DnsSetApplicationSettings(cServers, pServers, pSettings)
  end

  def dnsAcquireContextHandleW(credential_flags : UInt32, credentials : Void*, pContext : Win32cr::NetworkManagement::Dns::DnsContextHandle*) : Int32
    C.DnsAcquireContextHandle_W(credential_flags, credentials, pContext)
  end

  def dnsAcquireContextHandleA(credential_flags : UInt32, credentials : Void*, pContext : Win32cr::NetworkManagement::Dns::DnsContextHandle*) : Int32
    C.DnsAcquireContextHandle_A(credential_flags, credentials, pContext)
  end

  def dnsReleaseContextHandle(hContext : Win32cr::Foundation::HANDLE) : Void
    C.DnsReleaseContextHandle(hContext)
  end

  def dnsModifyRecordsInSetW(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32
    C.DnsModifyRecordsInSet_W(pAddRecords, pDeleteRecords, options, hCredentials, pExtraList, pReserved)
  end

  def dnsModifyRecordsInSetA(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32
    C.DnsModifyRecordsInSet_A(pAddRecords, pDeleteRecords, options, hCredentials, pExtraList, pReserved)
  end

  def dnsModifyRecordsInSetUTF8(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32
    C.DnsModifyRecordsInSet_UTF8(pAddRecords, pDeleteRecords, options, hCredentials, pExtraList, pReserved)
  end

  def dnsReplaceRecordSetW(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32
    C.DnsReplaceRecordSetW(pReplaceSet, options, hContext, pExtraInfo, pReserved)
  end

  def dnsReplaceRecordSetA(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32
    C.DnsReplaceRecordSetA(pReplaceSet, options, hContext, pExtraInfo, pReserved)
  end

  def dnsReplaceRecordSetUTF8(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32
    C.DnsReplaceRecordSetUTF8(pReplaceSet, options, hContext, pExtraInfo, pReserved)
  end

  def dnsValidateNameW(pszName : Win32cr::Foundation::PWSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32
    C.DnsValidateName_W(pszName, format)
  end

  def dnsValidateNameA(pszName : Win32cr::Foundation::PSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32
    C.DnsValidateName_A(pszName, format)
  end

  def dnsValidateNameUTF8(pszName : Win32cr::Foundation::PSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32
    C.DnsValidateName_UTF8(pszName, format)
  end

  def dnsNameCompareA(pName1 : Win32cr::Foundation::PSTR, pName2 : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL
    C.DnsNameCompare_A(pName1, pName2)
  end

  def dnsNameCompareW(pName1 : Win32cr::Foundation::PWSTR, pName2 : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.DnsNameCompare_W(pName1, pName2)
  end

  def dnsWriteQuestionToBufferW(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, pdwBufferSize : UInt32*, pszName : Win32cr::Foundation::PWSTR, wType : UInt16, xid : UInt16, fRecursionDesired : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.DnsWriteQuestionToBuffer_W(pDnsBuffer, pdwBufferSize, pszName, wType, xid, fRecursionDesired)
  end

  def dnsWriteQuestionToBufferUTF8(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, pdwBufferSize : UInt32*, pszName : Win32cr::Foundation::PSTR, wType : UInt16, xid : UInt16, fRecursionDesired : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.DnsWriteQuestionToBuffer_UTF8(pDnsBuffer, pdwBufferSize, pszName, wType, xid, fRecursionDesired)
  end

  def dnsExtractRecordsFromMessageW(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, wMessageLength : UInt16, ppRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Int32
    C.DnsExtractRecordsFromMessage_W(pDnsBuffer, wMessageLength, ppRecord)
  end

  def dnsExtractRecordsFromMessageUTF8(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, wMessageLength : UInt16, ppRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Int32
    C.DnsExtractRecordsFromMessage_UTF8(pDnsBuffer, wMessageLength, ppRecord)
  end

  def dnsGetProxyInformation(hostName : Win32cr::Foundation::PWSTR, proxyInformation : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION*, defaultProxyInformation : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION*, completionRoutine : Win32cr::NetworkManagement::Dns::DNS_PROXY_COMPLETION_ROUTINE, completionContext : Void*) : UInt32
    C.DnsGetProxyInformation(hostName, proxyInformation, defaultProxyInformation, completionRoutine, completionContext)
  end

  def dnsFreeProxyName(proxyName : Win32cr::Foundation::PWSTR) : Void
    C.DnsFreeProxyName(proxyName)
  end

  def dnsConnectionGetProxyInfoForHostUrl(pwszHostUrl : Win32cr::Foundation::PWSTR, pSelectionContext : UInt8*, dwSelectionContextLength : UInt32, dwExplicitInterfaceIndex : UInt32, pProxyInfoEx : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_EX*) : UInt32
    C.DnsConnectionGetProxyInfoForHostUrl(pwszHostUrl, pSelectionContext, dwSelectionContextLength, dwExplicitInterfaceIndex, pProxyInfoEx)
  end

  def dnsConnectionFreeProxyInfoEx(pProxyInfoEx : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_EX*) : Void
    C.DnsConnectionFreeProxyInfoEx(pProxyInfoEx)
  end

  def dnsConnectionGetProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : UInt32
    C.DnsConnectionGetProxyInfo(pwszConnectionName, type__, pProxyInfo)
  end

  def dnsConnectionFreeProxyInfo(pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : Void
    C.DnsConnectionFreeProxyInfo(pProxyInfo)
  end

  def dnsConnectionSetProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : UInt32
    C.DnsConnectionSetProxyInfo(pwszConnectionName, type__, pProxyInfo)
  end

  def dnsConnectionDeleteProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE) : UInt32
    C.DnsConnectionDeleteProxyInfo(pwszConnectionName, type__)
  end

  def dnsConnectionGetProxyList(pwszConnectionName : Win32cr::Foundation::PWSTR, pProxyList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_LIST*) : UInt32
    C.DnsConnectionGetProxyList(pwszConnectionName, pProxyList)
  end

  def dnsConnectionFreeProxyList(pProxyList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_LIST*) : Void
    C.DnsConnectionFreeProxyList(pProxyList)
  end

  def dnsConnectionGetNameList(pNameList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME_LIST*) : UInt32
    C.DnsConnectionGetNameList(pNameList)
  end

  def dnsConnectionFreeNameList(pNameList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME_LIST*) : Void
    C.DnsConnectionFreeNameList(pNameList)
  end

  def dnsConnectionUpdateIfIndexTable(pConnectionIfIndexEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_IFINDEX_LIST*) : UInt32
    C.DnsConnectionUpdateIfIndexTable(pConnectionIfIndexEntries)
  end

  def dnsConnectionSetPolicyEntries(policy_entry_tag : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_TAG, pPolicyEntryList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_ENTRY_LIST*) : UInt32
    C.DnsConnectionSetPolicyEntries(policy_entry_tag, pPolicyEntryList)
  end

  def dnsConnectionDeletePolicyEntries(policy_entry_tag : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_TAG) : UInt32
    C.DnsConnectionDeletePolicyEntries(policy_entry_tag)
  end

  def dnsServiceConstructInstance(pServiceName : Win32cr::Foundation::PWSTR, pHostName : Win32cr::Foundation::PWSTR, pIp4 : UInt32*, pIp6 : Win32cr::NetworkManagement::Dns::IP6_ADDRESS*, wPort : UInt16, wPriority : UInt16, wWeight : UInt16, dwPropertiesCount : UInt32, keys : Win32cr::Foundation::PWSTR*, values : Win32cr::Foundation::PWSTR*) : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*
    C.DnsServiceConstructInstance(pServiceName, pHostName, pIp4, pIp6, wPort, wPriority, wWeight, dwPropertiesCount, keys, values)
  end

  def dnsServiceCopyInstance(pOrig : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*) : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*
    C.DnsServiceCopyInstance(pOrig)
  end

  def dnsServiceFreeInstance(pInstance : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*) : Void
    C.DnsServiceFreeInstance(pInstance)
  end

  def dnsServiceBrowse(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_BROWSE_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32
    C.DnsServiceBrowse(pRequest, pCancel)
  end

  def dnsServiceBrowseCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32
    C.DnsServiceBrowseCancel(pCancelHandle)
  end

  def dnsServiceResolve(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_RESOLVE_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32
    C.DnsServiceResolve(pRequest, pCancel)
  end

  def dnsServiceResolveCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32
    C.DnsServiceResolveCancel(pCancelHandle)
  end

  def dnsServiceRegister(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_REGISTER_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32
    C.DnsServiceRegister(pRequest, pCancel)
  end

  def dnsServiceDeRegister(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_REGISTER_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32
    C.DnsServiceDeRegister(pRequest, pCancel)
  end

  def dnsServiceRegisterCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32
    C.DnsServiceRegisterCancel(pCancelHandle)
  end

  def dnsStartMulticastQuery(pQueryRequest : Win32cr::NetworkManagement::Dns::MDNS_QUERY_REQUEST*, pHandle : Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*) : Int32
    C.DnsStartMulticastQuery(pQueryRequest, pHandle)
  end

  def dnsStopMulticastQuery(pHandle : Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*) : Int32
    C.DnsStopMulticastQuery(pHandle)
  end

  @[Link("dnsapi")]
  lib C
    # :nodoc:
    fun DnsQueryConfig(config : Win32cr::NetworkManagement::Dns::DNS_CONFIG_TYPE, flag : UInt32, pwsAdapterName : Win32cr::Foundation::PWSTR, pReserved : Void*, pBuffer : Void*, pBufLen : UInt32*) : Int32

    # :nodoc:
    fun DnsRecordCopyEx(pRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, char_set_in : Win32cr::NetworkManagement::Dns::DNS_CHARSET, char_set_out : Win32cr::NetworkManagement::Dns::DNS_CHARSET) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

    # :nodoc:
    fun DnsRecordSetCopyEx(pRecordSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, char_set_in : Win32cr::NetworkManagement::Dns::DNS_CHARSET, char_set_out : Win32cr::NetworkManagement::Dns::DNS_CHARSET) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

    # :nodoc:
    fun DnsRecordCompare(pRecord1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pRecord2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsRecordSetCompare(pRR1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pRR2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, ppDiff1 : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, ppDiff2 : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsRecordSetDetach(pRecordList : Win32cr::NetworkManagement::Dns::DNS_RECORDA*) : Win32cr::NetworkManagement::Dns::DNS_RECORDA*

    # :nodoc:
    fun DnsFree(pData : Void*, free_type : Win32cr::NetworkManagement::Dns::DNS_FREE_TYPE) : Void

    # :nodoc:
    fun DnsQuery_A(pszName : Win32cr::Foundation::PSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32

    # :nodoc:
    fun DnsQuery_UTF8(pszName : Win32cr::Foundation::PSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32

    # :nodoc:
    fun DnsQuery_W(pszName : Win32cr::Foundation::PWSTR, wType : UInt16, options : UInt32, pExtra : Void*, ppQueryResults : Win32cr::NetworkManagement::Dns::DNS_RECORDA**, pReserved : Void**) : Int32

    # :nodoc:
    fun DnsQueryEx(pQueryRequest : Win32cr::NetworkManagement::Dns::DNS_QUERY_REQUEST*, pQueryResults : Win32cr::NetworkManagement::Dns::DNS_QUERY_RESULT*, pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_QUERY_CANCEL*) : Int32

    # :nodoc:
    fun DnsCancelQuery(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_QUERY_CANCEL*) : Int32

    # :nodoc:
    fun DnsFreeCustomServers(pcServers : UInt32*, ppServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER**) : Void

    # :nodoc:
    fun DnsGetApplicationSettings(pcServers : UInt32*, ppDefaultServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER**, pSettings : Win32cr::NetworkManagement::Dns::DNS_APPLICATION_SETTINGS*) : UInt32

    # :nodoc:
    fun DnsSetApplicationSettings(cServers : UInt32, pServers : Win32cr::NetworkManagement::Dns::DNS_CUSTOM_SERVER*, pSettings : Win32cr::NetworkManagement::Dns::DNS_APPLICATION_SETTINGS*) : UInt32

    # :nodoc:
    fun DnsAcquireContextHandle_W(credential_flags : UInt32, credentials : Void*, pContext : Win32cr::NetworkManagement::Dns::DnsContextHandle*) : Int32

    # :nodoc:
    fun DnsAcquireContextHandle_A(credential_flags : UInt32, credentials : Void*, pContext : Win32cr::NetworkManagement::Dns::DnsContextHandle*) : Int32

    # :nodoc:
    fun DnsReleaseContextHandle(hContext : Win32cr::Foundation::HANDLE) : Void

    # :nodoc:
    fun DnsModifyRecordsInSet_W(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32

    # :nodoc:
    fun DnsModifyRecordsInSet_A(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32

    # :nodoc:
    fun DnsModifyRecordsInSet_UTF8(pAddRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, pDeleteRecords : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hCredentials : Win32cr::Foundation::HANDLE, pExtraList : Void*, pReserved : Void*) : Int32

    # :nodoc:
    fun DnsReplaceRecordSetW(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32

    # :nodoc:
    fun DnsReplaceRecordSetA(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32

    # :nodoc:
    fun DnsReplaceRecordSetUTF8(pReplaceSet : Win32cr::NetworkManagement::Dns::DNS_RECORDA*, options : UInt32, hContext : Win32cr::Foundation::HANDLE, pExtraInfo : Void*, pReserved : Void*) : Int32

    # :nodoc:
    fun DnsValidateName_W(pszName : Win32cr::Foundation::PWSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32

    # :nodoc:
    fun DnsValidateName_A(pszName : Win32cr::Foundation::PSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32

    # :nodoc:
    fun DnsValidateName_UTF8(pszName : Win32cr::Foundation::PSTR, format : Win32cr::NetworkManagement::Dns::DNS_NAME_FORMAT) : Int32

    # :nodoc:
    fun DnsNameCompare_A(pName1 : Win32cr::Foundation::PSTR, pName2 : Win32cr::Foundation::PSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsNameCompare_W(pName1 : Win32cr::Foundation::PWSTR, pName2 : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsWriteQuestionToBuffer_W(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, pdwBufferSize : UInt32*, pszName : Win32cr::Foundation::PWSTR, wType : UInt16, xid : UInt16, fRecursionDesired : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsWriteQuestionToBuffer_UTF8(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, pdwBufferSize : UInt32*, pszName : Win32cr::Foundation::PSTR, wType : UInt16, xid : UInt16, fRecursionDesired : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun DnsExtractRecordsFromMessage_W(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, wMessageLength : UInt16, ppRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Int32

    # :nodoc:
    fun DnsExtractRecordsFromMessage_UTF8(pDnsBuffer : Win32cr::NetworkManagement::Dns::DNS_MESSAGE_BUFFER*, wMessageLength : UInt16, ppRecord : Win32cr::NetworkManagement::Dns::DNS_RECORDA**) : Int32

    # :nodoc:
    fun DnsGetProxyInformation(hostName : Win32cr::Foundation::PWSTR, proxyInformation : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION*, defaultProxyInformation : Win32cr::NetworkManagement::Dns::DNS_PROXY_INFORMATION*, completionRoutine : Win32cr::NetworkManagement::Dns::DNS_PROXY_COMPLETION_ROUTINE, completionContext : Void*) : UInt32

    # :nodoc:
    fun DnsFreeProxyName(proxyName : Win32cr::Foundation::PWSTR) : Void

    # :nodoc:
    fun DnsConnectionGetProxyInfoForHostUrl(pwszHostUrl : Win32cr::Foundation::PWSTR, pSelectionContext : UInt8*, dwSelectionContextLength : UInt32, dwExplicitInterfaceIndex : UInt32, pProxyInfoEx : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_EX*) : UInt32

    # :nodoc:
    fun DnsConnectionFreeProxyInfoEx(pProxyInfoEx : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO_EX*) : Void

    # :nodoc:
    fun DnsConnectionGetProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : UInt32

    # :nodoc:
    fun DnsConnectionFreeProxyInfo(pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : Void

    # :nodoc:
    fun DnsConnectionSetProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE, pProxyInfo : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_INFO*) : UInt32

    # :nodoc:
    fun DnsConnectionDeleteProxyInfo(pwszConnectionName : Win32cr::Foundation::PWSTR, type__ : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_TYPE) : UInt32

    # :nodoc:
    fun DnsConnectionGetProxyList(pwszConnectionName : Win32cr::Foundation::PWSTR, pProxyList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_LIST*) : UInt32

    # :nodoc:
    fun DnsConnectionFreeProxyList(pProxyList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_PROXY_LIST*) : Void

    # :nodoc:
    fun DnsConnectionGetNameList(pNameList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME_LIST*) : UInt32

    # :nodoc:
    fun DnsConnectionFreeNameList(pNameList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_NAME_LIST*) : Void

    # :nodoc:
    fun DnsConnectionUpdateIfIndexTable(pConnectionIfIndexEntries : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_IFINDEX_LIST*) : UInt32

    # :nodoc:
    fun DnsConnectionSetPolicyEntries(policy_entry_tag : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_TAG, pPolicyEntryList : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_ENTRY_LIST*) : UInt32

    # :nodoc:
    fun DnsConnectionDeletePolicyEntries(policy_entry_tag : Win32cr::NetworkManagement::Dns::DNS_CONNECTION_POLICY_TAG) : UInt32

    # :nodoc:
    fun DnsServiceConstructInstance(pServiceName : Win32cr::Foundation::PWSTR, pHostName : Win32cr::Foundation::PWSTR, pIp4 : UInt32*, pIp6 : Win32cr::NetworkManagement::Dns::IP6_ADDRESS*, wPort : UInt16, wPriority : UInt16, wWeight : UInt16, dwPropertiesCount : UInt32, keys : Win32cr::Foundation::PWSTR*, values : Win32cr::Foundation::PWSTR*) : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*

    # :nodoc:
    fun DnsServiceCopyInstance(pOrig : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*) : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*

    # :nodoc:
    fun DnsServiceFreeInstance(pInstance : Win32cr::NetworkManagement::Dns::DNS_SERVICE_INSTANCE*) : Void

    # :nodoc:
    fun DnsServiceBrowse(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_BROWSE_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    # :nodoc:
    fun DnsServiceBrowseCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    # :nodoc:
    fun DnsServiceResolve(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_RESOLVE_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    # :nodoc:
    fun DnsServiceResolveCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : Int32

    # :nodoc:
    fun DnsServiceRegister(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_REGISTER_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32

    # :nodoc:
    fun DnsServiceDeRegister(pRequest : Win32cr::NetworkManagement::Dns::DNS_SERVICE_REGISTER_REQUEST*, pCancel : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32

    # :nodoc:
    fun DnsServiceRegisterCancel(pCancelHandle : Win32cr::NetworkManagement::Dns::DNS_SERVICE_CANCEL*) : UInt32

    # :nodoc:
    fun DnsStartMulticastQuery(pQueryRequest : Win32cr::NetworkManagement::Dns::MDNS_QUERY_REQUEST*, pHandle : Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*) : Int32

    # :nodoc:
    fun DnsStopMulticastQuery(pHandle : Win32cr::NetworkManagement::Dns::MDNS_QUERY_HANDLE*) : Int32

  end
end