require "./../foundation.cr"
require "./cryptography.cr"
require "./cryptography/sip.cr"

module Win32cr::Security::WinTrust
  alias PFN_CPD_MEM_ALLOC = Proc(UInt32, Void*)*

  alias PFN_CPD_MEM_FREE = Proc(Void*, Void)*

  alias PFN_CPD_ADD_STORE = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Security::Cryptography::HCERTSTORE, Win32cr::Foundation::BOOL)*

  alias PFN_CPD_ADD_SGNR = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::BOOL, UInt32, Win32cr::Security::WinTrust::CRYPT_PROVIDER_SGNR*, Win32cr::Foundation::BOOL)*

  alias PFN_CPD_ADD_CERT = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, UInt32, Win32cr::Foundation::BOOL, UInt32, Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Foundation::BOOL)*

  alias PFN_CPD_ADD_PRIVDATA = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Security::WinTrust::CRYPT_PROVIDER_PRIVDATA*, Win32cr::Foundation::BOOL)*

  alias PFN_PROVIDER_INIT_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_OBJTRUST_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_SIGTRUST_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_CERTTRUST_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_FINALPOLICY_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_TESTFINALPOLICY_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_CLEANUP_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::HRESULT)*

  alias PFN_PROVIDER_CERTCHKPOLICY_CALL = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, UInt32, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::BOOL)*

  alias PFN_PROVUI_CALL = Proc(Win32cr::Foundation::HWND, Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, Win32cr::Foundation::BOOL)*

  alias PFN_ALLOCANDFILLDEFUSAGE = Proc(Win32cr::Foundation::PSTR, Win32cr::Security::WinTrust::CRYPT_PROVIDER_DEFUSAGE*, Win32cr::Foundation::BOOL)*

  alias PFN_FREEDEFUSAGE = Proc(Win32cr::Foundation::PSTR, Win32cr::Security::WinTrust::CRYPT_PROVIDER_DEFUSAGE*, Win32cr::Foundation::BOOL)*

  alias PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK = Proc(Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, UInt32, UInt32, UInt32, Win32cr::Security::WinTrust::WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO**, Void*, Win32cr::Foundation::HRESULT)*

  WINTRUST_CONFIG_REGPATH = "Software\\Microsoft\\Cryptography\\Wintrust\\Config"
  WINTRUST_MAX_HEADER_BYTES_TO_MAP_VALUE_NAME = "MaxHeaderBytesToMap"
  WINTRUST_MAX_HEADER_BYTES_TO_MAP_DEFAULT = 10485760_u32
  WINTRUST_MAX_HASH_BYTES_TO_MAP_VALUE_NAME = "MaxHashBytesToMap"
  WINTRUST_MAX_HASH_BYTES_TO_MAP_DEFAULT = 1048576_u32
  WTD_PROV_FLAGS_MASK = 65535_u32
  WTD_CODE_INTEGRITY_DRIVER_MODE = 32768_u32
  WSS_VERIFY_SEALING = 4_u32
  WSS_INPUT_FLAG_MASK = 7_u32
  WSS_OUT_SEALING_STATUS_VERIFIED = 2147483648_u32
  WSS_OUT_HAS_SEALING_INTENT = 1073741824_u32
  WSS_OUT_FILE_SUPPORTS_SEAL = 536870912_u32
  WSS_OUTPUT_FLAG_MASK = 3758096384_u32
  WTCI_DONT_OPEN_STORES = 1_u32
  WTCI_OPEN_ONLY_ROOT = 2_u32
  WTCI_USE_LOCAL_MACHINE = 4_u32
  TRUSTERROR_STEP_WVTPARAMS = 0_u32
  TRUSTERROR_STEP_FILEIO = 2_u32
  TRUSTERROR_STEP_SIP = 3_u32
  TRUSTERROR_STEP_SIPSUBJINFO = 5_u32
  TRUSTERROR_STEP_CATALOGFILE = 6_u32
  TRUSTERROR_STEP_CERTSTORE = 7_u32
  TRUSTERROR_STEP_MESSAGE = 8_u32
  TRUSTERROR_STEP_MSG_SIGNERCOUNT = 9_u32
  TRUSTERROR_STEP_MSG_INNERCNTTYPE = 10_u32
  TRUSTERROR_STEP_MSG_INNERCNT = 11_u32
  TRUSTERROR_STEP_MSG_STORE = 12_u32
  TRUSTERROR_STEP_MSG_SIGNERINFO = 13_u32
  TRUSTERROR_STEP_MSG_SIGNERCERT = 14_u32
  TRUSTERROR_STEP_MSG_CERTCHAIN = 15_u32
  TRUSTERROR_STEP_MSG_COUNTERSIGINFO = 16_u32
  TRUSTERROR_STEP_MSG_COUNTERSIGCERT = 17_u32
  TRUSTERROR_STEP_VERIFY_MSGHASH = 18_u32
  TRUSTERROR_STEP_VERIFY_MSGINDIRECTDATA = 19_u32
  TRUSTERROR_STEP_FINAL_WVTINIT = 30_u32
  TRUSTERROR_STEP_FINAL_INITPROV = 31_u32
  TRUSTERROR_STEP_FINAL_OBJPROV = 32_u32
  TRUSTERROR_STEP_FINAL_SIGPROV = 33_u32
  TRUSTERROR_STEP_FINAL_CERTPROV = 34_u32
  TRUSTERROR_STEP_FINAL_CERTCHKPROV = 35_u32
  TRUSTERROR_STEP_FINAL_POLICYPROV = 36_u32
  TRUSTERROR_STEP_FINAL_UIPROV = 37_u32
  TRUSTERROR_MAX_STEPS = 38_u32
  CPD_CHOICE_SIP = 1_u32
  CPD_USE_NT5_CHAIN_FLAG = 2147483648_u32
  CPD_REVOCATION_CHECK_NONE = 65536_u32
  CPD_REVOCATION_CHECK_END_CERT = 131072_u32
  CPD_REVOCATION_CHECK_CHAIN = 262144_u32
  CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 524288_u32
  CPD_RETURN_LOWER_QUALITY_CHAINS = 1048576_u32
  CPD_UISTATE_MODE_PROMPT = 0_u32
  CPD_UISTATE_MODE_BLOCK = 1_u32
  CPD_UISTATE_MODE_ALLOW = 2_u32
  CPD_UISTATE_MODE_MASK = 3_u32
  WSS_OBJTRUST_SUPPORT = 1_u32
  WSS_SIGTRUST_SUPPORT = 2_u32
  WSS_CERTTRUST_SUPPORT = 4_u32
  SGNR_TYPE_TIMESTAMP = 16_u32
  CERT_CONFIDENCE_SIG = 268435456_u32
  CERT_CONFIDENCE_TIME = 16777216_u32
  CERT_CONFIDENCE_TIMENEST = 1048576_u32
  CERT_CONFIDENCE_AUTHIDEXT = 65536_u32
  CERT_CONFIDENCE_HYGIENE = 4096_u32
  CERT_CONFIDENCE_HIGHEST = 286330880_u32
  WT_CURRENT_VERSION = 512_u32
  WT_PROVIDER_DLL_NAME = "WINTRUST.DLL"
  WT_PROVIDER_CERTTRUST_FUNCTION = "WintrustCertificateTrust"
  WT_ADD_ACTION_ID_RET_RESULT_FLAG = 1_u32
  Szoid_trusted_codesigning_ca_list = "1.3.6.1.4.1.311.2.2.1"
  Szoid_trusted_client_auth_ca_list = "1.3.6.1.4.1.311.2.2.2"
  Szoid_trusted_server_auth_ca_list = "1.3.6.1.4.1.311.2.2.3"
  SPC_COMMON_NAME_OBJID = "2.5.4.3"
  SPC_TIME_STAMP_REQUEST_OBJID = "1.3.6.1.4.1.311.3.2.1"
  SPC_INDIRECT_DATA_OBJID = "1.3.6.1.4.1.311.2.1.4"
  SPC_SP_AGENCY_INFO_OBJID = "1.3.6.1.4.1.311.2.1.10"
  SPC_STATEMENT_TYPE_OBJID = "1.3.6.1.4.1.311.2.1.11"
  SPC_SP_OPUS_INFO_OBJID = "1.3.6.1.4.1.311.2.1.12"
  SPC_CERT_EXTENSIONS_OBJID = "1.3.6.1.4.1.311.2.1.14"
  SPC_PE_IMAGE_DATA_OBJID = "1.3.6.1.4.1.311.2.1.15"
  SPC_RAW_FILE_DATA_OBJID = "1.3.6.1.4.1.311.2.1.18"
  SPC_STRUCTURED_STORAGE_DATA_OBJID = "1.3.6.1.4.1.311.2.1.19"
  SPC_JAVA_CLASS_DATA_OBJID = "1.3.6.1.4.1.311.2.1.20"
  SPC_INDIVIDUAL_SP_KEY_PURPOSE_OBJID = "1.3.6.1.4.1.311.2.1.21"
  SPC_COMMERCIAL_SP_KEY_PURPOSE_OBJID = "1.3.6.1.4.1.311.2.1.22"
  SPC_CAB_DATA_OBJID = "1.3.6.1.4.1.311.2.1.25"
  SPC_GLUE_RDN_OBJID = "1.3.6.1.4.1.311.2.1.25"
  SPC_MINIMAL_CRITERIA_OBJID = "1.3.6.1.4.1.311.2.1.26"
  SPC_FINANCIAL_CRITERIA_OBJID = "1.3.6.1.4.1.311.2.1.27"
  SPC_LINK_OBJID = "1.3.6.1.4.1.311.2.1.28"
  SPC_SIGINFO_OBJID = "1.3.6.1.4.1.311.2.1.30"
  SPC_PE_IMAGE_PAGE_HASHES_V1_OBJID = "1.3.6.1.4.1.311.2.3.1"
  SPC_PE_IMAGE_PAGE_HASHES_V2_OBJID = "1.3.6.1.4.1.311.2.3.2"
  Szoid_nested_signature = "1.3.6.1.4.1.311.2.4.1"
  Szoid_intent_to_seal = "1.3.6.1.4.1.311.2.4.2"
  Szoid_sealing_signature = "1.3.6.1.4.1.311.2.4.3"
  Szoid_sealing_timestamp = "1.3.6.1.4.1.311.2.4.4"
  Szoid_enhanced_hash = "1.3.6.1.4.1.311.2.5.1"
  SPC_RELAXED_PE_MARKER_CHECK_OBJID = "1.3.6.1.4.1.311.2.6.1"
  SPC_ENCRYPTED_DIGEST_RETRY_COUNT_OBJID = "1.3.6.1.4.1.311.2.6.2"
  Szoid_pkcs_9_sequence_number = "1.2.840.113549.1.9.25.4"
  CAT_NAMEVALUE_OBJID = "1.3.6.1.4.1.311.12.2.1"
  CAT_MEMBERINFO_OBJID = "1.3.6.1.4.1.311.12.2.2"
  CAT_MEMBERINFO2_OBJID = "1.3.6.1.4.1.311.12.2.3"
  SPC_WINDOWS_HELLO_COMPATIBILITY_OBJID = "1.3.6.1.4.1.311.10.41.1"
  SPC_NATURAL_AUTH_PLUGIN_OBJID = "1.3.6.1.4.1.311.96.1.1"
  SPC_SP_AGENCY_INFO_STRUCT = 2000_i32
  SPC_MINIMAL_CRITERIA_STRUCT = 2001_i32
  SPC_FINANCIAL_CRITERIA_STRUCT = 2002_i32
  SPC_INDIRECT_DATA_CONTENT_STRUCT = 2003_i32
  SPC_PE_IMAGE_DATA_STRUCT = 2004_i32
  SPC_LINK_STRUCT = 2005_i32
  SPC_STATEMENT_TYPE_STRUCT = 2006_i32
  SPC_SP_OPUS_INFO_STRUCT = 2007_i32
  SPC_CAB_DATA_STRUCT = 2008_i32
  SPC_JAVA_CLASS_DATA_STRUCT = 2009_i32
  INTENT_TO_SEAL_ATTRIBUTE_STRUCT = 2010_i32
  SEALING_SIGNATURE_ATTRIBUTE_STRUCT = 2011_i32
  SEALING_TIMESTAMP_ATTRIBUTE_STRUCT = 2012_i32
  SPC_SIGINFO_STRUCT = 2130_i32
  CAT_NAMEVALUE_STRUCT = 2221_i32
  CAT_MEMBERINFO_STRUCT = 2222_i32
  CAT_MEMBERINFO2_STRUCT = 2223_i32
  SPC_UUID_LENGTH = 16_u32
  SPC_URL_LINK_CHOICE = 1_u32
  SPC_MONIKER_LINK_CHOICE = 2_u32
  SPC_FILE_LINK_CHOICE = 3_u32
  WIN_CERT_REVISION_1_0 = 256_u32
  WIN_CERT_REVISION_2_0 = 512_u32
  WIN_CERT_TYPE_X509 = 1_u32
  WIN_CERT_TYPE_PKCS_SIGNED_DATA = 2_u32
  WIN_CERT_TYPE_RESERVED_1 = 3_u32
  WIN_CERT_TYPE_TS_STACK_SIGNED = 4_u32
  WT_TRUSTDBDIALOG_NO_UI_FLAG = 1_u32
  WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG = 2_u32
  WT_TRUSTDBDIALOG_WRITE_LEGACY_REG_FLAG = 256_u32
  WT_TRUSTDBDIALOG_WRITE_IEAK_STORE_FLAG = 512_u32
  SP_POLICY_PROVIDER_DLL_NAME = "WINTRUST.DLL"
  SP_INIT_FUNCTION = "SoftpubInitialize"
  SP_OBJTRUST_FUNCTION = "SoftpubLoadMessage"
  SP_SIGTRUST_FUNCTION = "SoftpubLoadSignature"
  SP_CHKCERT_FUNCTION = "SoftpubCheckCert"
  SP_FINALPOLICY_FUNCTION = "SoftpubAuthenticode"
  SP_CLEANUPPOLICY_FUNCTION = "SoftpubCleanup"
  SP_TESTDUMPPOLICY_FUNCTION_TEST = "SoftpubDumpStructure"
  SP_GENERIC_CERT_INIT_FUNCTION = "SoftpubDefCertInit"
  GENERIC_CHAIN_FINALPOLICY_FUNCTION = "GenericChainFinalProv"
  GENERIC_CHAIN_CERTTRUST_FUNCTION = "GenericChainCertificateTrust"
  HTTPS_FINALPOLICY_FUNCTION = "HTTPSFinalProv"
  HTTPS_CHKCERT_FUNCTION = "HTTPSCheckCertProv"
  HTTPS_CERTTRUST_FUNCTION = "HTTPSCertificateTrust"
  OFFICE_POLICY_PROVIDER_DLL_NAME = "WINTRUST.DLL"
  OFFICE_INITPROV_FUNCTION = "OfficeInitializePolicy"
  OFFICE_CLEANUPPOLICY_FUNCTION = "OfficeCleanupPolicy"
  DRIVER_INITPROV_FUNCTION = "DriverInitializePolicy"
  DRIVER_FINALPOLPROV_FUNCTION = "DriverFinalPolicy"
  DRIVER_CLEANUPPOLICY_FUNCTION = "DriverCleanupPolicy"
  CCPI_RESULT_ALLOW = 1_u32
  CCPI_RESULT_DENY = 2_u32
  CCPI_RESULT_AUDIT = 3_u32

  enum WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION : UInt32
    DWACTION_ALLOCANDFILL = 1_u32
    DWACTION_FREE = 2_u32
  end
  @[Flags]
  enum WINTRUST_POLICY_FLAGS : UInt32
    WTPF_TRUSTTEST = 32_u32
    WTPF_TESTCANBEVALID = 128_u32
    WTPF_IGNOREEXPIRATION = 256_u32
    WTPF_IGNOREREVOKATION = 512_u32
    WTPF_OFFLINEOK_IND = 1024_u32
    WTPF_OFFLINEOK_COM = 2048_u32
    WTPF_OFFLINEOKNBU_IND = 4096_u32
    WTPF_OFFLINEOKNBU_COM = 8192_u32
    WTPF_VERIFY_V1_OFF = 65536_u32
    WTPF_IGNOREREVOCATIONONTS = 131072_u32
    WTPF_ALLOWONLYPERTRUST = 262144_u32
  end
  @[Flags]
  enum WINTRUST_DATA_PROVIDER_FLAGS : UInt32
    WTD_USE_IE4_TRUST_FLAG = 1_u32
    WTD_NO_IE4_CHAIN_FLAG = 2_u32
    WTD_NO_POLICY_USAGE_FLAG = 4_u32
    WTD_REVOCATION_CHECK_NONE = 16_u32
    WTD_REVOCATION_CHECK_END_CERT = 32_u32
    WTD_REVOCATION_CHECK_CHAIN = 64_u32
    WTD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 128_u32
    WTD_SAFER_FLAG = 256_u32
    WTD_HASH_ONLY_FLAG = 512_u32
    WTD_USE_DEFAULT_OSVER_CHECK = 1024_u32
    WTD_LIFETIME_SIGNING_FLAG = 2048_u32
    WTD_CACHE_ONLY_URL_RETRIEVAL = 4096_u32
    WTD_DISABLE_MD2_MD4 = 8192_u32
    WTD_MOTW = 16384_u32
  end
  enum WINTRUST_DATA_UICHOICE : UInt32
    WTD_UI_ALL = 1_u32
    WTD_UI_NONE = 2_u32
    WTD_UI_NOBAD = 3_u32
    WTD_UI_NOGOOD = 4_u32
  end
  enum WINTRUST_SIGNATURE_SETTINGS_FLAGS : UInt32
    WSS_VERIFY_SPECIFIC = 1_u32
    WSS_GET_SECONDARY_SIG_COUNT = 2_u32
  end
  enum WINTRUST_DATA_STATE_ACTION : UInt32
    WTD_STATEACTION_IGNORE = 0_u32
    WTD_STATEACTION_VERIFY = 1_u32
    WTD_STATEACTION_CLOSE = 2_u32
    WTD_STATEACTION_AUTO_CACHE = 3_u32
    WTD_STATEACTION_AUTO_CACHE_FLUSH = 4_u32
  end
  enum WINTRUST_DATA_UNION_CHOICE : UInt32
    WTD_CHOICE_FILE = 1_u32
    WTD_CHOICE_CATALOG = 2_u32
    WTD_CHOICE_BLOB = 3_u32
    WTD_CHOICE_SIGNER = 4_u32
    WTD_CHOICE_CERT = 5_u32
  end
  enum WINTRUST_DATA_REVOCATION_CHECKS : UInt32
    WTD_REVOKE_NONE = 0_u32
    WTD_REVOKE_WHOLECHAIN = 1_u32
  end
  enum WINTRUST_DATA_UICONTEXT : UInt32
    WTD_UICONTEXT_EXECUTE = 0_u32
    WTD_UICONTEXT_INSTALL = 1_u32
  end

  @[Extern]
  record WINTRUST_DATA,
    cbStruct : UInt32,
    pPolicyCallbackData : Void*,
    pSIPClientData : Void*,
    dwUIChoice : Win32cr::Security::WinTrust::WINTRUST_DATA_UICHOICE,
    fdwRevocationChecks : Win32cr::Security::WinTrust::WINTRUST_DATA_REVOCATION_CHECKS,
    dwUnionChoice : Win32cr::Security::WinTrust::WINTRUST_DATA_UNION_CHOICE,
    anonymous : Anonymous_e__Union,
    dwStateAction : Win32cr::Security::WinTrust::WINTRUST_DATA_STATE_ACTION,
    hWVTStateData : Win32cr::Foundation::HANDLE,
    pwszURLReference : Win32cr::Foundation::PWSTR,
    dwProvFlags : Win32cr::Security::WinTrust::WINTRUST_DATA_PROVIDER_FLAGS,
    dwUIContext : Win32cr::Security::WinTrust::WINTRUST_DATA_UICONTEXT,
    pSignatureSettings : Win32cr::Security::WinTrust::WINTRUST_SIGNATURE_SETTINGS* do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      pFile : Win32cr::Security::WinTrust::WINTRUST_FILE_INFO*,
      pCatalog : Win32cr::Security::WinTrust::WINTRUST_CATALOG_INFO*,
      pBlob : Win32cr::Security::WinTrust::WINTRUST_BLOB_INFO*,
      pSgnr : Win32cr::Security::WinTrust::WINTRUST_SGNR_INFO*,
      pCert : Win32cr::Security::WinTrust::WINTRUST_CERT_INFO*

  end

  @[Extern]
  record WINTRUST_SIGNATURE_SETTINGS,
    cbStruct : UInt32,
    dwIndex : UInt32,
    dwFlags : Win32cr::Security::WinTrust::WINTRUST_SIGNATURE_SETTINGS_FLAGS,
    cSecondarySigs : UInt32,
    dwVerifiedSigIndex : UInt32,
    pCryptoPolicy : Win32cr::Security::Cryptography::CERT_STRONG_SIGN_PARA*

  @[Extern]
  record WINTRUST_FILE_INFO,
    cbStruct : UInt32,
    pcwszFilePath : Win32cr::Foundation::PWSTR,
    hFile : Win32cr::Foundation::HANDLE,
    pgKnownSubject : LibC::GUID*

  @[Extern]
  record WINTRUST_CATALOG_INFO,
    cbStruct : UInt32,
    dwCatalogVersion : UInt32,
    pcwszCatalogFilePath : Win32cr::Foundation::PWSTR,
    pcwszMemberTag : Win32cr::Foundation::PWSTR,
    pcwszMemberFilePath : Win32cr::Foundation::PWSTR,
    hMemberFile : Win32cr::Foundation::HANDLE,
    pbCalculatedFileHash : UInt8*,
    cbCalculatedFileHash : UInt32,
    pcCatalogContext : Win32cr::Security::Cryptography::CTL_CONTEXT*,
    hCatAdmin : LibC::IntPtrT

  @[Extern]
  record WINTRUST_BLOB_INFO,
    cbStruct : UInt32,
    gSubject : LibC::GUID,
    pcwszDisplayName : Win32cr::Foundation::PWSTR,
    cbMemObject : UInt32,
    pbMemObject : UInt8*,
    cbMemSignedMsg : UInt32,
    pbMemSignedMsg : UInt8*

  @[Extern]
  record WINTRUST_SGNR_INFO,
    cbStruct : UInt32,
    pcwszDisplayName : Win32cr::Foundation::PWSTR,
    psSignerInfo : Win32cr::Security::Cryptography::CMSG_SIGNER_INFO*,
    chStores : UInt32,
    pahStores : Win32cr::Security::Cryptography::HCERTSTORE*

  @[Extern]
  record WINTRUST_CERT_INFO,
    cbStruct : UInt32,
    pcwszDisplayName : Win32cr::Foundation::PWSTR,
    psCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*,
    chStores : UInt32,
    pahStores : Win32cr::Security::Cryptography::HCERTSTORE*,
    dwFlags : UInt32,
    psftVerifyAsOf : Win32cr::Foundation::FILETIME*

  @[Extern]
  record CRYPT_PROVIDER_DATA,
    cbStruct : UInt32,
    pWintrustData : Win32cr::Security::WinTrust::WINTRUST_DATA*,
    fOpenedFile : Win32cr::Foundation::BOOL,
    hWndParent : Win32cr::Foundation::HWND,
    pgActionID : LibC::GUID*,
    hProv : LibC::UIntPtrT,
    dwError : UInt32,
    dwRegSecuritySettings : UInt32,
    dwRegPolicySettings : UInt32,
    psPfns : Win32cr::Security::WinTrust::CRYPT_PROVIDER_FUNCTIONS*,
    cdwTrustStepErrors : UInt32,
    padwTrustStepErrors : UInt32*,
    chStores : UInt32,
    pahStores : Win32cr::Security::Cryptography::HCERTSTORE*,
    dwEncoding : UInt32,
    hMsg : Void*,
    csSigners : UInt32,
    pasSigners : Win32cr::Security::WinTrust::CRYPT_PROVIDER_SGNR*,
    csProvPrivData : UInt32,
    pasProvPrivData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_PRIVDATA*,
    dwSubjectChoice : UInt32,
    anonymous : Anonymous_e__Union,
    pszUsageOID : Win32cr::Foundation::PSTR,
    fRecallWithState : Win32cr::Foundation::BOOL,
    sftSystemTime : Win32cr::Foundation::FILETIME,
    pszCTLSignerUsageOID : Win32cr::Foundation::PSTR,
    dwProvFlags : UInt32,
    dwFinalError : UInt32,
    pRequestUsage : Win32cr::Security::Cryptography::CERT_USAGE_MATCH*,
    dwTrustPubSettings : UInt32,
    dwUIStateFlags : UInt32,
    pSigState : Win32cr::Security::WinTrust::CRYPT_PROVIDER_SIGSTATE*,
    pSigSettings : Win32cr::Security::WinTrust::WINTRUST_SIGNATURE_SETTINGS* do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      pPDSip : Win32cr::Security::WinTrust::PROVDATA_SIP*

  end

  @[Extern]
  record CRYPT_PROVIDER_SIGSTATE,
    cbStruct : UInt32,
    rhSecondarySigs : Void**,
    hPrimarySig : Void*,
    fFirstAttemptMade : Win32cr::Foundation::BOOL,
    fNoMoreSigs : Win32cr::Foundation::BOOL,
    cSecondarySigs : UInt32,
    dwCurrentIndex : UInt32,
    fSupportMultiSig : Win32cr::Foundation::BOOL,
    dwCryptoPolicySupport : UInt32,
    iAttemptCount : UInt32,
    fCheckedSealing : Win32cr::Foundation::BOOL,
    pSealingSignature : Win32cr::Security::WinTrust::SEALING_SIGNATURE_ATTRIBUTE*

  @[Extern]
  record CRYPT_PROVIDER_FUNCTIONS,
    cbStruct : UInt32,
    pfnAlloc : Win32cr::Security::WinTrust::PFN_CPD_MEM_ALLOC,
    pfnFree : Win32cr::Security::WinTrust::PFN_CPD_MEM_FREE,
    pfnAddStore2Chain : Win32cr::Security::WinTrust::PFN_CPD_ADD_STORE,
    pfnAddSgnr2Chain : Win32cr::Security::WinTrust::PFN_CPD_ADD_SGNR,
    pfnAddCert2Chain : Win32cr::Security::WinTrust::PFN_CPD_ADD_CERT,
    pfnAddPrivData2Chain : Win32cr::Security::WinTrust::PFN_CPD_ADD_PRIVDATA,
    pfnInitialize : Win32cr::Security::WinTrust::PFN_PROVIDER_INIT_CALL,
    pfnObjectTrust : Win32cr::Security::WinTrust::PFN_PROVIDER_OBJTRUST_CALL,
    pfnSignatureTrust : Win32cr::Security::WinTrust::PFN_PROVIDER_SIGTRUST_CALL,
    pfnCertificateTrust : Win32cr::Security::WinTrust::PFN_PROVIDER_CERTTRUST_CALL,
    pfnFinalPolicy : Win32cr::Security::WinTrust::PFN_PROVIDER_FINALPOLICY_CALL,
    pfnCertCheckPolicy : Win32cr::Security::WinTrust::PFN_PROVIDER_CERTCHKPOLICY_CALL,
    pfnTestFinalPolicy : Win32cr::Security::WinTrust::PFN_PROVIDER_TESTFINALPOLICY_CALL,
    psUIpfns : Win32cr::Security::WinTrust::CRYPT_PROVUI_FUNCS*,
    pfnCleanupPolicy : Win32cr::Security::WinTrust::PFN_PROVIDER_CLEANUP_CALL

  @[Extern]
  record CRYPT_PROVUI_FUNCS,
    cbStruct : UInt32,
    psUIData : Win32cr::Security::WinTrust::CRYPT_PROVUI_DATA*,
    pfnOnMoreInfoClick : Win32cr::Security::WinTrust::PFN_PROVUI_CALL,
    pfnOnMoreInfoClickDefault : Win32cr::Security::WinTrust::PFN_PROVUI_CALL,
    pfnOnAdvancedClick : Win32cr::Security::WinTrust::PFN_PROVUI_CALL,
    pfnOnAdvancedClickDefault : Win32cr::Security::WinTrust::PFN_PROVUI_CALL

  @[Extern]
  record CRYPT_PROVUI_DATA,
    cbStruct : UInt32,
    dwFinalError : UInt32,
    pYesButtonText : Win32cr::Foundation::PWSTR,
    pNoButtonText : Win32cr::Foundation::PWSTR,
    pMoreInfoButtonText : Win32cr::Foundation::PWSTR,
    pAdvancedLinkText : Win32cr::Foundation::PWSTR,
    pCopyActionText : Win32cr::Foundation::PWSTR,
    pCopyActionTextNoTS : Win32cr::Foundation::PWSTR,
    pCopyActionTextNotSigned : Win32cr::Foundation::PWSTR

  @[Extern]
  record CRYPT_PROVIDER_SGNR,
    cbStruct : UInt32,
    sftVerifyAsOf : Win32cr::Foundation::FILETIME,
    csCertChain : UInt32,
    pasCertChain : Win32cr::Security::WinTrust::CRYPT_PROVIDER_CERT*,
    dwSignerType : UInt32,
    psSigner : Win32cr::Security::Cryptography::CMSG_SIGNER_INFO*,
    dwError : UInt32,
    csCounterSigners : UInt32,
    pasCounterSigners : Win32cr::Security::WinTrust::CRYPT_PROVIDER_SGNR*,
    pChainContext : Win32cr::Security::Cryptography::CERT_CHAIN_CONTEXT*

  @[Extern]
  record CRYPT_PROVIDER_CERT,
    cbStruct : UInt32,
    pCert : Win32cr::Security::Cryptography::CERT_CONTEXT*,
    fCommercial : Win32cr::Foundation::BOOL,
    fTrustedRoot : Win32cr::Foundation::BOOL,
    fSelfSigned : Win32cr::Foundation::BOOL,
    fTestCert : Win32cr::Foundation::BOOL,
    dwRevokedReason : UInt32,
    dwConfidence : UInt32,
    dwError : UInt32,
    pTrustListContext : Win32cr::Security::Cryptography::CTL_CONTEXT*,
    fTrustListSignerCert : Win32cr::Foundation::BOOL,
    pCtlContext : Win32cr::Security::Cryptography::CTL_CONTEXT*,
    dwCtlError : UInt32,
    fIsCyclic : Win32cr::Foundation::BOOL,
    pChainElement : Win32cr::Security::Cryptography::CERT_CHAIN_ELEMENT*

  @[Extern]
  record CRYPT_PROVIDER_PRIVDATA,
    cbStruct : UInt32,
    gProviderID : LibC::GUID,
    cbProvData : UInt32,
    pvProvData : Void*

  @[Extern]
  record PROVDATA_SIP,
    cbStruct : UInt32,
    gSubject : LibC::GUID,
    pSip : Win32cr::Security::Cryptography::Sip::SIP_DISPATCH_INFO*,
    pCATSip : Win32cr::Security::Cryptography::Sip::SIP_DISPATCH_INFO*,
    psSipSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*,
    psSipCATSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*,
    psIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*

  @[Extern]
  record CRYPT_TRUST_REG_ENTRY,
    cbStruct : UInt32,
    pwszDLLName : Win32cr::Foundation::PWSTR,
    pwszFunctionName : Win32cr::Foundation::PWSTR

  @[Extern]
  record CRYPT_REGISTER_ACTIONID,
    cbStruct : UInt32,
    sInitProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sObjectProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sSignatureProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sCertificateProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sCertificatePolicyProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sFinalPolicyProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sTestPolicyProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY,
    sCleanupProvider : Win32cr::Security::WinTrust::CRYPT_TRUST_REG_ENTRY

  @[Extern]
  record CRYPT_PROVIDER_REGDEFUSAGE,
    cbStruct : UInt32,
    pgActionID : LibC::GUID*,
    pwszDllName : Win32cr::Foundation::PWSTR,
    pwszLoadCallbackDataFunctionName : Win32cr::Foundation::PSTR,
    pwszFreeCallbackDataFunctionName : Win32cr::Foundation::PSTR

  @[Extern]
  record CRYPT_PROVIDER_DEFUSAGE,
    cbStruct : UInt32,
    gActionID : LibC::GUID,
    pDefPolicyCallbackData : Void*,
    pDefSIPClientData : Void*

  @[Extern]
  record SPC_SERIALIZED_OBJECT,
    class_id : UInt8[16],
    serialized_data : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record SPC_SIGINFO,
    dwSipVersion : UInt32,
    gSIPGuid : LibC::GUID,
    dwReserved1 : UInt32,
    dwReserved2 : UInt32,
    dwReserved3 : UInt32,
    dwReserved4 : UInt32,
    dwReserved5 : UInt32

  @[Extern]
  record SPC_LINK,
    dwLinkChoice : UInt32,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      pwszUrl : Win32cr::Foundation::PWSTR,
      moniker : Win32cr::Security::WinTrust::SPC_SERIALIZED_OBJECT,
      pwszFile : Win32cr::Foundation::PWSTR

  end

  @[Extern]
  record SPC_PE_IMAGE_DATA,
    flags : Win32cr::Security::Cryptography::CRYPT_BIT_BLOB,
    pFile : Win32cr::Security::WinTrust::SPC_LINK*

  @[Extern]
  record SPC_INDIRECT_DATA_CONTENT,
    data : Win32cr::Security::Cryptography::CRYPT_ATTRIBUTE_TYPE_VALUE,
    digest_algorithm : Win32cr::Security::Cryptography::CRYPT_ALGORITHM_IDENTIFIER,
    digest : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record SPC_FINANCIAL_CRITERIA,
    fFinancialInfoAvailable : Win32cr::Foundation::BOOL,
    fMeetsCriteria : Win32cr::Foundation::BOOL

  @[Extern]
  record SPC_IMAGE,
    pImageLink : Win32cr::Security::WinTrust::SPC_LINK*,
    bitmap : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB,
    metafile : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB,
    enhanced_metafile : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB,
    gif_file : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record SPC_SP_AGENCY_INFO,
    pPolicyInformation : Win32cr::Security::WinTrust::SPC_LINK*,
    pwszPolicyDisplayText : Win32cr::Foundation::PWSTR,
    pLogoImage : Win32cr::Security::WinTrust::SPC_IMAGE*,
    pLogoLink : Win32cr::Security::WinTrust::SPC_LINK*

  @[Extern]
  record SPC_STATEMENT_TYPE,
    cKeyPurposeId : UInt32,
    rgpszKeyPurposeId : Win32cr::Foundation::PSTR*

  @[Extern]
  record SPC_SP_OPUS_INFO,
    pwszProgramName : Win32cr::Foundation::PWSTR,
    pMoreInfo : Win32cr::Security::WinTrust::SPC_LINK*,
    pPublisherInfo : Win32cr::Security::WinTrust::SPC_LINK*

  @[Extern]
  record CAT_NAMEVALUE,
    pwszTag : Win32cr::Foundation::PWSTR,
    fdwFlags : UInt32,
    value : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record CAT_MEMBERINFO,
    pwszSubjGuid : Win32cr::Foundation::PWSTR,
    dwCertVersion : UInt32

  @[Extern]
  record CAT_MEMBERINFO2,
    subject_guid : LibC::GUID,
    dwCertVersion : UInt32

  @[Extern]
  record INTENT_TO_SEAL_ATTRIBUTE,
    version : UInt32,
    seal : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record SEALING_SIGNATURE_ATTRIBUTE,
    version : UInt32,
    signerIndex : UInt32,
    signatureAlgorithm : Win32cr::Security::Cryptography::CRYPT_ALGORITHM_IDENTIFIER,
    encryptedDigest : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record SEALING_TIMESTAMP_ATTRIBUTE,
    version : UInt32,
    signerIndex : UInt32,
    sealTimeStampToken : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record WIN_CERTIFICATE,
    dwLength : UInt32,
    wRevision : UInt16,
    wCertificateType : UInt16,
    bCertificate : UInt8*

  @[Extern]
  record WIN_TRUST_ACTDATA_CONTEXT_WITH_SUBJECT,
    hClientToken : Win32cr::Foundation::HANDLE,
    subject_type : LibC::GUID*,
    subject : Void*

  @[Extern]
  record WIN_TRUST_ACTDATA_SUBJECT_ONLY,
    subject_type : LibC::GUID*,
    subject : Void*

  @[Extern]
  record WIN_TRUST_SUBJECT_FILE,
    hFile : Win32cr::Foundation::HANDLE,
    lpPath : Win32cr::Foundation::PWSTR

  @[Extern]
  record WIN_TRUST_SUBJECT_FILE_AND_DISPLAY,
    hFile : Win32cr::Foundation::HANDLE,
    lpPath : Win32cr::Foundation::PWSTR,
    lpDisplayName : Win32cr::Foundation::PWSTR

  @[Extern]
  record WIN_SPUB_TRUSTED_PUBLISHER_DATA,
    hClientToken : Win32cr::Foundation::HANDLE,
    lpCertificate : Win32cr::Security::WinTrust::WIN_CERTIFICATE*

  @[Extern]
  record WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO,
    anonymous : Anonymous_e__Union,
    pChainContext : Win32cr::Security::Cryptography::CERT_CHAIN_CONTEXT*,
    dwSignerType : UInt32,
    pMsgSignerInfo : Win32cr::Security::Cryptography::CMSG_SIGNER_INFO*,
    dwError : UInt32,
    cCounterSigner : UInt32,
    rgpCounterSigner : Win32cr::Security::WinTrust::WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO** do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      cbStruct : UInt32,
      cbSize : UInt32

  end

  @[Extern]
  record WTD_GENERIC_CHAIN_POLICY_CREATE_INFO,
    anonymous : Anonymous_e__Union,
    hChainEngine : Win32cr::Security::Cryptography::HCERTCHAINENGINE,
    pChainPara : Win32cr::Security::Cryptography::CERT_CHAIN_PARA*,
    dwFlags : UInt32,
    pvReserved : Void* do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      cbStruct : UInt32,
      cbSize : UInt32

  end

  @[Extern]
  record WTD_GENERIC_CHAIN_POLICY_DATA,
    anonymous : Anonymous_e__Union,
    pSignerChainInfo : Win32cr::Security::WinTrust::WTD_GENERIC_CHAIN_POLICY_CREATE_INFO*,
    pCounterSignerChainInfo : Win32cr::Security::WinTrust::WTD_GENERIC_CHAIN_POLICY_CREATE_INFO*,
    pfnPolicyCallback : Win32cr::Security::WinTrust::PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK,
    pvPolicyArg : Void* do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      cbStruct : UInt32,
      cbSize : UInt32

  end

  @[Extern]
  record DRIVER_VER_MAJORMINOR,
    dwMajor : UInt32,
    dwMinor : UInt32

  @[Extern]
  record DRIVER_VER_INFO,
    cbStruct : UInt32,
    dwReserved1 : LibC::UIntPtrT,
    dwReserved2 : LibC::UIntPtrT,
    dwPlatform : UInt32,
    dwVersion : UInt32,
    wszVersion : UInt16[260],
    wszSignedBy : UInt16[260],
    pcSignerCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*,
    sOSVersionLow : Win32cr::Security::WinTrust::DRIVER_VER_MAJORMINOR,
    sOSVersionHigh : Win32cr::Security::WinTrust::DRIVER_VER_MAJORMINOR,
    dwBuildNumberLow : UInt32,
    dwBuildNumberHigh : UInt32

  @[Extern]
  record CONFIG_CI_PROV_INFO_RESULT,
    hr : Win32cr::Foundation::HRESULT,
    dwResult : UInt32,
    dwPolicyIndex : UInt32,
    fIsExplicitDeny : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record CONFIG_CI_PROV_INFO,
    cbSize : UInt32,
    dwPolicies : UInt32,
    pPolicies : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB*,
    result : Win32cr::Security::WinTrust::CONFIG_CI_PROV_INFO_RESULT,
    dwScenario : UInt32

  @[Link("wintrust")]
  lib C
    fun WinVerifyTrust(hwnd : Win32cr::Foundation::HWND, pgActionID : LibC::GUID*, pWVTData : Void*) : Int32

    fun WinVerifyTrustEx(hwnd : Win32cr::Foundation::HWND, pgActionID : LibC::GUID*, pWinTrustData : Win32cr::Security::WinTrust::WINTRUST_DATA*) : Int32

    fun WintrustGetRegPolicyFlags(pdwPolicyFlags : Win32cr::Security::WinTrust::WINTRUST_POLICY_FLAGS*) : Void

    fun WintrustSetRegPolicyFlags(dwPolicyFlags : Win32cr::Security::WinTrust::WINTRUST_POLICY_FLAGS) : Win32cr::Foundation::BOOL

    fun WintrustAddActionID(pgActionID : LibC::GUID*, fdwFlags : UInt32, psProvInfo : Win32cr::Security::WinTrust::CRYPT_REGISTER_ACTIONID*) : Win32cr::Foundation::BOOL

    fun WintrustRemoveActionID(pgActionID : LibC::GUID*) : Win32cr::Foundation::BOOL

    fun WintrustLoadFunctionPointers(pgActionID : LibC::GUID*, pPfns : Win32cr::Security::WinTrust::CRYPT_PROVIDER_FUNCTIONS*) : Win32cr::Foundation::BOOL

    fun WintrustAddDefaultForUsage(pszUsageOID : Win32cr::Foundation::PSTR, psDefUsage : Win32cr::Security::WinTrust::CRYPT_PROVIDER_REGDEFUSAGE*) : Win32cr::Foundation::BOOL

    fun WintrustGetDefaultForUsage(dwAction : Win32cr::Security::WinTrust::WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION, pszUsageOID : Win32cr::Foundation::PSTR, psUsage : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DEFUSAGE*) : Win32cr::Foundation::BOOL

    fun WTHelperGetProvSignerFromChain(pProvData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, idxSigner : UInt32, fCounterSigner : Win32cr::Foundation::BOOL, idxCounterSigner : UInt32) : Win32cr::Security::WinTrust::CRYPT_PROVIDER_SGNR*

    fun WTHelperGetProvCertFromChain(pSgnr : Win32cr::Security::WinTrust::CRYPT_PROVIDER_SGNR*, idxCert : UInt32) : Win32cr::Security::WinTrust::CRYPT_PROVIDER_CERT*

    fun WTHelperProvDataFromStateData(hStateData : Win32cr::Foundation::HANDLE) : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*

    fun WTHelperGetProvPrivateDataFromChain(pProvData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, pgProviderID : LibC::GUID*) : Win32cr::Security::WinTrust::CRYPT_PROVIDER_PRIVDATA*

    fun WTHelperCertIsSelfSigned(dwEncoding : UInt32, pCert : Win32cr::Security::Cryptography::CERT_INFO*) : Win32cr::Foundation::BOOL

    fun WTHelperCertCheckValidSignature(pProvData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*) : Win32cr::Foundation::HRESULT

    fun OpenPersonalTrustDBDialogEx(hwndParent : Win32cr::Foundation::HWND, dwFlags : UInt32, pvReserved : Void**) : Win32cr::Foundation::BOOL

    fun OpenPersonalTrustDBDialog(hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun WintrustSetDefaultIncludePEPageHashes(fIncludePEPageHashes : Win32cr::Foundation::BOOL) : Void

  end
end