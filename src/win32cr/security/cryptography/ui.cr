require "./../cryptography.cr"
require "./../../foundation.cr"
require "./../../ui/controls.cr"
require "./../win_trust.cr"

module Win32cr::Security::Cryptography::UI
  extend self
  alias PFNCMFILTERPROC = Proc(Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Foundation::LPARAM, UInt32, UInt32, Win32cr::Foundation::BOOL)

  alias PFNCMHOOKPROC = Proc(Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, UInt32)

  alias PFNTRUSTHELPER = Proc(Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL, UInt8*, Win32cr::Foundation::HRESULT)

  alias PFNCFILTERPROC = Proc(Win32cr::Security::Cryptography::CERT_CONTEXT*, Win32cr::Foundation::BOOL*, Void*, Win32cr::Foundation::BOOL)

  CRYTPDLG_FLAGS_MASK = 4278190080_u32
  CRYPTDLG_REVOCATION_DEFAULT = 0_u32
  CRYPTDLG_REVOCATION_ONLINE = 2147483648_u32
  CRYPTDLG_REVOCATION_CACHE = 1073741824_u32
  CRYPTDLG_REVOCATION_NONE = 536870912_u32
  CRYPTDLG_CACHE_ONLY_URL_RETRIEVAL = 268435456_u32
  CRYPTDLG_DISABLE_AIA = 134217728_u32
  CRYPTDLG_POLICY_MASK = 65535_u32
  POLICY_IGNORE_NON_CRITICAL_BC = 1_u32
  CRYPTDLG_ACTION_MASK = 4294901760_u32
  ACTION_REVOCATION_DEFAULT_ONLINE = 65536_u32
  ACTION_REVOCATION_DEFAULT_CACHE = 131072_u32
  CERT_DISPWELL_SELECT = 1_u32
  CERT_DISPWELL_TRUST_CA_CERT = 2_u32
  CERT_DISPWELL_TRUST_LEAF_CERT = 3_u32
  CERT_DISPWELL_TRUST_ADD_CA_CERT = 4_u32
  CERT_DISPWELL_TRUST_ADD_LEAF_CERT = 5_u32
  CERT_DISPWELL_DISTRUST_CA_CERT = 6_u32
  CERT_DISPWELL_DISTRUST_LEAF_CERT = 7_u32
  CERT_DISPWELL_DISTRUST_ADD_CA_CERT = 8_u32
  CERT_DISPWELL_DISTRUST_ADD_LEAF_CERT = 9_u32
  CSS_SELECTCERT_MASK = 16777215_u32
  SELCERT_PROPERTIES = 100_u32
  SELCERT_FINEPRINT = 101_u32
  SELCERT_CERTLIST = 102_u32
  SELCERT_ISSUED_TO = 103_u32
  SELCERT_VALIDITY = 104_u32
  SELCERT_ALGORITHM = 105_u32
  SELCERT_SERIAL_NUM = 106_u32
  SELCERT_THUMBPRINT = 107_u32
  CM_VIEWFLAGS_MASK = 16777215_u32
  CERTVIEW_CRYPTUI_LPARAM = 8388608_u32
  CERT_FILTER_OP_EXISTS = 1_u32
  CERT_FILTER_OP_NOT_EXISTS = 2_u32
  CERT_FILTER_OP_EQUALITY = 3_u32
  CERT_FILTER_INCLUDE_V1_CERTS = 1_u32
  CERT_FILTER_VALID_TIME_RANGE = 2_u32
  CERT_FILTER_VALID_SIGNATURE = 4_u32
  CERT_FILTER_LEAF_CERTS_ONLY = 8_u32
  CERT_FILTER_ISSUER_CERTS_ONLY = 16_u32
  CERT_FILTER_KEY_EXISTS = 32_u32
  Szcert_certificate_action_verify = "{7801ebd0-cf4b-11d0-851f-0060979387ea}"
  CERT_VALIDITY_BEFORE_START = 1_u32
  CERT_VALIDITY_AFTER_END = 2_u32
  CERT_VALIDITY_SIGNATURE_FAILS = 4_u32
  CERT_VALIDITY_CERTIFICATE_REVOKED = 8_u32
  CERT_VALIDITY_KEY_USAGE_EXT_FAILURE = 16_u32
  CERT_VALIDITY_EXTENDED_USAGE_FAILURE = 32_u32
  CERT_VALIDITY_NAME_CONSTRAINTS_FAILURE = 64_u32
  CERT_VALIDITY_UNKNOWN_CRITICAL_EXTENSION = 128_u32
  CERT_VALIDITY_ISSUER_INVALID = 256_u32
  CERT_VALIDITY_OTHER_EXTENSION_FAILURE = 512_u32
  CERT_VALIDITY_PERIOD_NESTING_FAILURE = 1024_u32
  CERT_VALIDITY_OTHER_ERROR = 2048_u32
  CERT_VALIDITY_ISSUER_DISTRUST = 33554432_u32
  CERT_VALIDITY_EXPLICITLY_DISTRUSTED = 16777216_u32
  CERT_VALIDITY_NO_ISSUER_CERT_FOUND = 268435456_u32
  CERT_VALIDITY_NO_CRL_FOUND = 536870912_u32
  CERT_VALIDITY_CRL_OUT_OF_DATE = 1073741824_u32
  CERT_VALIDITY_NO_TRUST_DATA = 2147483648_u32
  CERT_VALIDITY_MASK_TRUST = 4294901760_u32
  CERT_VALIDITY_MASK_VALIDITY = 65535_u32
  CERT_TRUST_MASK = 16777215_u32
  CERT_TRUST_DO_FULL_SEARCH = 1_u32
  CERT_TRUST_PERMIT_MISSING_CRLS = 2_u32
  CERT_TRUST_DO_FULL_TRUST = 5_u32
  CERT_CREDENTIAL_PROVIDER_ID = -509_i32
  CRYPTUI_SELECT_ISSUEDTO_COLUMN = 1_u64
  CRYPTUI_SELECT_ISSUEDBY_COLUMN = 2_u64
  CRYPTUI_SELECT_INTENDEDUSE_COLUMN = 4_u64
  CRYPTUI_SELECT_FRIENDLYNAME_COLUMN = 8_u64
  CRYPTUI_SELECT_LOCATION_COLUMN = 16_u64
  CRYPTUI_SELECT_EXPIRATION_COLUMN = 32_u64
  CRYPTUI_CERT_MGR_TAB_MASK = 15_u32
  CRYPTUI_CERT_MGR_PUBLISHER_TAB = 4_u32
  CRYPTUI_CERT_MGR_SINGLE_TAB_FLAG = 32768_u32
  CRYPTUI_WIZ_DIGITAL_SIGN_EXCLUDE_PAGE_HASHES = 2_u32
  CRYPTUI_WIZ_DIGITAL_SIGN_INCLUDE_PAGE_HASHES = 4_u32
  CRYPTUI_WIZ_EXPORT_FORMAT_SERIALIZED_CERT_STORE = 5_u32

  @[Flags]
  enum CRYPTUI_WIZ_FLAGS : UInt32
    CRYPTUI_WIZ_NO_UI = 1_u32
    CRYPTUI_WIZ_IGNORE_NO_UI_FLAG_FOR_CSPS = 2_u32
    CRYPTUI_WIZ_NO_UI_EXCEPT_CSP = 3_u32
    CRYPTUI_WIZ_IMPORT_ALLOW_CERT = 131072_u32
    CRYPTUI_WIZ_IMPORT_ALLOW_CRL = 262144_u32
    CRYPTUI_WIZ_IMPORT_ALLOW_CTL = 524288_u32
    CRYPTUI_WIZ_IMPORT_NO_CHANGE_DEST_STORE = 65536_u32
    CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE = 1048576_u32
    CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER = 2097152_u32
    CRYPTUI_WIZ_IMPORT_REMOTE_DEST_STORE = 4194304_u32
    CRYPTUI_WIZ_EXPORT_PRIVATE_KEY = 256_u32
    CRYPTUI_WIZ_EXPORT_NO_DELETE_PRIVATE_KEY = 512_u32
  end
  @[Flags]
  enum CRYPTUI_VIEWCERTIFICATE_FLAGS : UInt32
    CRYPTUI_HIDE_HIERARCHYPAGE = 1_u32
    CRYPTUI_HIDE_DETAILPAGE = 2_u32
    CRYPTUI_DISABLE_EDITPROPERTIES = 4_u32
    CRYPTUI_ENABLE_EDITPROPERTIES = 8_u32
    CRYPTUI_DISABLE_ADDTOSTORE = 16_u32
    CRYPTUI_ENABLE_ADDTOSTORE = 32_u32
    CRYPTUI_ACCEPT_DECLINE_STYLE = 64_u32
    CRYPTUI_IGNORE_UNTRUSTED_ROOT = 128_u32
    CRYPTUI_DONT_OPEN_STORES = 256_u32
    CRYPTUI_ONLY_OPEN_ROOT_STORE = 512_u32
    CRYPTUI_WARN_UNTRUSTED_ROOT = 1024_u32
    CRYPTUI_ENABLE_REVOCATION_CHECKING = 2048_u32
    CRYPTUI_WARN_REMOTE_TRUST = 4096_u32
    CRYPTUI_DISABLE_EXPORT = 8192_u32
    CRYPTUI_ENABLE_REVOCATION_CHECK_END_CERT = 16384_u32
    CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN = 32768_u32
    CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 2048_u32
    CRYPTUI_DISABLE_HTMLLINK = 65536_u32
    CRYPTUI_DISABLE_ISSUERSTATEMENT = 131072_u32
    CRYPTUI_CACHE_ONLY_URL_RETRIEVAL = 262144_u32
  end
  @[Flags]
  enum CERT_SELECT_STRUCT_FLAGS : UInt32
    CSS_HIDE_PROPERTIES = 1_u32
    CSS_ENABLEHOOK = 2_u32
    CSS_ALLOWMULTISELECT = 4_u32
    CSS_SHOW_HELP = 16_u32
    CSS_ENABLETEMPLATE = 32_u32
    CSS_ENABLETEMPLATEHANDLE = 64_u32
  end
  enum CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION : UInt32
    CRYPTUI_WIZ_IMPORT_SUBJECT_FILE = 1_u32
    CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT = 2_u32
    CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT = 3_u32
    CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT = 4_u32
    CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE = 5_u32
  end
  enum CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_BLOB = 2_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_FILE = 1_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_NONE = 0_u32
  end
  enum CRYPTUI_WIZ_DIGITAL_SIGN : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_CERT = 1_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_STORE = 2_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK = 3_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_NONE = 0_u32
  end
  enum CRYPTUI_WIZ_EXPORT_SUBJECT : UInt32
    CRYPTUI_WIZ_EXPORT_CERT_CONTEXT = 1_u32
    CRYPTUI_WIZ_EXPORT_CTL_CONTEXT = 2_u32
    CRYPTUI_WIZ_EXPORT_CRL_CONTEXT = 3_u32
    CRYPTUI_WIZ_EXPORT_CERT_STORE = 4_u32
    CRYPTUI_WIZ_EXPORT_CERT_STORE_CERTIFICATES_ONLY = 5_u32
  end
  enum CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_COMMERCIAL = 1_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_INDIVIDUAL = 2_u32
  end
  enum CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE = 1_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_PROV = 2_u32
  end
  @[Flags]
  enum CERT_VIEWPROPERTIES_STRUCT_FLAGS : UInt32
    CM_ENABLEHOOK = 1_u32
    CM_SHOW_HELP = 2_u32
    CM_SHOW_HELPICON = 4_u32
    CM_ENABLETEMPLATE = 8_u32
    CM_HIDE_ADVANCEPAGE = 16_u32
    CM_HIDE_TRUSTPAGE = 32_u32
    CM_NO_NAMECHANGE = 64_u32
    CM_NO_EDITTRUST = 128_u32
    CM_HIDE_DETAILPAGE = 256_u32
    CM_ADD_CERT_STORES = 512_u32
  end
  enum CRYPTUI_WIZ_EXPORT_FORMAT : UInt32
    CRYPTUI_WIZ_EXPORT_FORMAT_DER = 1_u32
    CRYPTUI_WIZ_EXPORT_FORMAT_PFX = 2_u32
    CRYPTUI_WIZ_EXPORT_FORMAT_PKCS7 = 3_u32
    CRYPTUI_WIZ_EXPORT_FORMAT_BASE64 = 4_u32
    CRYPTUI_WIZ_EXPORT_FORMAT_CRL = 6_u32
    CRYPTUI_WIZ_EXPORT_FORMAT_CTL = 7_u32
  end
  enum CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN = 1_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN_NO_ROOT = 2_u32
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_NONE = 0_u32
  end
  enum CTL_MODIFY_REQUEST_OPERATION : UInt32
    CTL_MODIFY_REQUEST_ADD_TRUSTED = 3_u32
    CTL_MODIFY_REQUEST_ADD_NOT_TRUSTED = 1_u32
    CTL_MODIFY_REQUEST_REMOVE = 2_u32
  end

  @[Extern]
  struct CERT_SELECT_STRUCT_A
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property hInstance : Win32cr::Foundation::HINSTANCE
    property pTemplateName : Win32cr::Foundation::PSTR
    property dwFlags : Win32cr::Security::Cryptography::UI::CERT_SELECT_STRUCT_FLAGS
    property szTitle : Win32cr::Foundation::PSTR
    property cCertStore : UInt32
    property arrayCertStore : Win32cr::Security::Cryptography::HCERTSTORE*
    property szPurposeOid : Win32cr::Foundation::PSTR
    property cCertContext : UInt32
    property arrayCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT**
    property lCustData : Win32cr::Foundation::LPARAM
    property pfnHook : Win32cr::Security::Cryptography::UI::PFNCMHOOKPROC
    property pfnFilter : Win32cr::Security::Cryptography::UI::PFNCMFILTERPROC
    property szHelpFileName : Win32cr::Foundation::PSTR
    property dwHelpId : UInt32
    property hprov : LibC::UIntPtrT
    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @hInstance : Win32cr::Foundation::HINSTANCE, @pTemplateName : Win32cr::Foundation::PSTR, @dwFlags : Win32cr::Security::Cryptography::UI::CERT_SELECT_STRUCT_FLAGS, @szTitle : Win32cr::Foundation::PSTR, @cCertStore : UInt32, @arrayCertStore : Win32cr::Security::Cryptography::HCERTSTORE*, @szPurposeOid : Win32cr::Foundation::PSTR, @cCertContext : UInt32, @arrayCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT**, @lCustData : Win32cr::Foundation::LPARAM, @pfnHook : Win32cr::Security::Cryptography::UI::PFNCMHOOKPROC, @pfnFilter : Win32cr::Security::Cryptography::UI::PFNCMFILTERPROC, @szHelpFileName : Win32cr::Foundation::PSTR, @dwHelpId : UInt32, @hprov : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct CERT_SELECT_STRUCT_W
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property hInstance : Win32cr::Foundation::HINSTANCE
    property pTemplateName : Win32cr::Foundation::PWSTR
    property dwFlags : Win32cr::Security::Cryptography::UI::CERT_SELECT_STRUCT_FLAGS
    property szTitle : Win32cr::Foundation::PWSTR
    property cCertStore : UInt32
    property arrayCertStore : Win32cr::Security::Cryptography::HCERTSTORE*
    property szPurposeOid : Win32cr::Foundation::PSTR
    property cCertContext : UInt32
    property arrayCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT**
    property lCustData : Win32cr::Foundation::LPARAM
    property pfnHook : Win32cr::Security::Cryptography::UI::PFNCMHOOKPROC
    property pfnFilter : Win32cr::Security::Cryptography::UI::PFNCMFILTERPROC
    property szHelpFileName : Win32cr::Foundation::PWSTR
    property dwHelpId : UInt32
    property hprov : LibC::UIntPtrT
    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @hInstance : Win32cr::Foundation::HINSTANCE, @pTemplateName : Win32cr::Foundation::PWSTR, @dwFlags : Win32cr::Security::Cryptography::UI::CERT_SELECT_STRUCT_FLAGS, @szTitle : Win32cr::Foundation::PWSTR, @cCertStore : UInt32, @arrayCertStore : Win32cr::Security::Cryptography::HCERTSTORE*, @szPurposeOid : Win32cr::Foundation::PSTR, @cCertContext : UInt32, @arrayCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT**, @lCustData : Win32cr::Foundation::LPARAM, @pfnHook : Win32cr::Security::Cryptography::UI::PFNCMHOOKPROC, @pfnFilter : Win32cr::Security::Cryptography::UI::PFNCMFILTERPROC, @szHelpFileName : Win32cr::Foundation::PWSTR, @dwHelpId : UInt32, @hprov : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct CERT_VIEWPROPERTIES_STRUCT_A
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property hInstance : Win32cr::Foundation::HINSTANCE
    property dwFlags : Win32cr::Security::Cryptography::UI::CERT_VIEWPROPERTIES_STRUCT_FLAGS
    property szTitle : Win32cr::Foundation::PSTR
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property arrayPurposes : Win32cr::Foundation::PSTR*
    property cArrayPurposes : UInt32
    property cRootStores : UInt32
    property rghstoreRoots : Win32cr::Security::Cryptography::HCERTSTORE*
    property cStores : UInt32
    property rghstoreCAs : Win32cr::Security::Cryptography::HCERTSTORE*
    property cTrustStores : UInt32
    property rghstoreTrust : Win32cr::Security::Cryptography::HCERTSTORE*
    property hprov : LibC::UIntPtrT
    property lCustData : Win32cr::Foundation::LPARAM
    property dwPad : UInt32
    property szHelpFileName : Win32cr::Foundation::PSTR
    property dwHelpId : UInt32
    property nStartPage : UInt32
    property cArrayPropSheetPages : UInt32
    property arrayPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEA*
    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @hInstance : Win32cr::Foundation::HINSTANCE, @dwFlags : Win32cr::Security::Cryptography::UI::CERT_VIEWPROPERTIES_STRUCT_FLAGS, @szTitle : Win32cr::Foundation::PSTR, @pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @arrayPurposes : Win32cr::Foundation::PSTR*, @cArrayPurposes : UInt32, @cRootStores : UInt32, @rghstoreRoots : Win32cr::Security::Cryptography::HCERTSTORE*, @cStores : UInt32, @rghstoreCAs : Win32cr::Security::Cryptography::HCERTSTORE*, @cTrustStores : UInt32, @rghstoreTrust : Win32cr::Security::Cryptography::HCERTSTORE*, @hprov : LibC::UIntPtrT, @lCustData : Win32cr::Foundation::LPARAM, @dwPad : UInt32, @szHelpFileName : Win32cr::Foundation::PSTR, @dwHelpId : UInt32, @nStartPage : UInt32, @cArrayPropSheetPages : UInt32, @arrayPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEA*)
    end
  end

  @[Extern]
  struct CERT_VIEWPROPERTIES_STRUCT_W
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property hInstance : Win32cr::Foundation::HINSTANCE
    property dwFlags : Win32cr::Security::Cryptography::UI::CERT_VIEWPROPERTIES_STRUCT_FLAGS
    property szTitle : Win32cr::Foundation::PWSTR
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property arrayPurposes : Win32cr::Foundation::PSTR*
    property cArrayPurposes : UInt32
    property cRootStores : UInt32
    property rghstoreRoots : Win32cr::Security::Cryptography::HCERTSTORE*
    property cStores : UInt32
    property rghstoreCAs : Win32cr::Security::Cryptography::HCERTSTORE*
    property cTrustStores : UInt32
    property rghstoreTrust : Win32cr::Security::Cryptography::HCERTSTORE*
    property hprov : LibC::UIntPtrT
    property lCustData : Win32cr::Foundation::LPARAM
    property dwPad : UInt32
    property szHelpFileName : Win32cr::Foundation::PWSTR
    property dwHelpId : UInt32
    property nStartPage : UInt32
    property cArrayPropSheetPages : UInt32
    property arrayPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEA*
    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @hInstance : Win32cr::Foundation::HINSTANCE, @dwFlags : Win32cr::Security::Cryptography::UI::CERT_VIEWPROPERTIES_STRUCT_FLAGS, @szTitle : Win32cr::Foundation::PWSTR, @pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @arrayPurposes : Win32cr::Foundation::PSTR*, @cArrayPurposes : UInt32, @cRootStores : UInt32, @rghstoreRoots : Win32cr::Security::Cryptography::HCERTSTORE*, @cStores : UInt32, @rghstoreCAs : Win32cr::Security::Cryptography::HCERTSTORE*, @cTrustStores : UInt32, @rghstoreTrust : Win32cr::Security::Cryptography::HCERTSTORE*, @hprov : LibC::UIntPtrT, @lCustData : Win32cr::Foundation::LPARAM, @dwPad : UInt32, @szHelpFileName : Win32cr::Foundation::PWSTR, @dwHelpId : UInt32, @nStartPage : UInt32, @cArrayPropSheetPages : UInt32, @arrayPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEA*)
    end
  end

  @[Extern]
  struct CMOID
    property szExtensionOID : Win32cr::Foundation::PSTR
    property dwTestOperation : UInt32
    property pbTestData : UInt8*
    property cbTestData : UInt32
    def initialize(@szExtensionOID : Win32cr::Foundation::PSTR, @dwTestOperation : UInt32, @pbTestData : UInt8*, @cbTestData : UInt32)
    end
  end

  @[Extern]
  struct CMFLTR
    property dwSize : UInt32
    property cExtensionChecks : UInt32
    property arrayExtensionChecks : Win32cr::Security::Cryptography::UI::CMOID*
    property dwCheckingFlags : UInt32
    def initialize(@dwSize : UInt32, @cExtensionChecks : UInt32, @arrayExtensionChecks : Win32cr::Security::Cryptography::UI::CMOID*, @dwCheckingFlags : UInt32)
    end
  end

  @[Extern]
  struct CERT_VERIFY_CERTIFICATE_TRUST
    property cbSize : UInt32
    property pccert : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property dwFlags : UInt32
    property dwIgnoreErr : UInt32
    property pdwErrors : UInt32*
    property pszUsageOid : Win32cr::Foundation::PSTR
    property hprov : LibC::UIntPtrT
    property cRootStores : UInt32
    property rghstoreRoots : Win32cr::Security::Cryptography::HCERTSTORE*
    property cStores : UInt32
    property rghstoreCAs : Win32cr::Security::Cryptography::HCERTSTORE*
    property cTrustStores : UInt32
    property rghstoreTrust : Win32cr::Security::Cryptography::HCERTSTORE*
    property lCustData : Win32cr::Foundation::LPARAM
    property pfnTrustHelper : Win32cr::Security::Cryptography::UI::PFNTRUSTHELPER
    property pcChain : UInt32*
    property prgChain : Win32cr::Security::Cryptography::CERT_CONTEXT***
    property prgdwErrors : UInt32**
    property prgpbTrustInfo : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB**
    def initialize(@cbSize : UInt32, @pccert : Win32cr::Security::Cryptography::CERT_CONTEXT*, @dwFlags : UInt32, @dwIgnoreErr : UInt32, @pdwErrors : UInt32*, @pszUsageOid : Win32cr::Foundation::PSTR, @hprov : LibC::UIntPtrT, @cRootStores : UInt32, @rghstoreRoots : Win32cr::Security::Cryptography::HCERTSTORE*, @cStores : UInt32, @rghstoreCAs : Win32cr::Security::Cryptography::HCERTSTORE*, @cTrustStores : UInt32, @rghstoreTrust : Win32cr::Security::Cryptography::HCERTSTORE*, @lCustData : Win32cr::Foundation::LPARAM, @pfnTrustHelper : Win32cr::Security::Cryptography::UI::PFNTRUSTHELPER, @pcChain : UInt32*, @prgChain : Win32cr::Security::Cryptography::CERT_CONTEXT***, @prgdwErrors : UInt32**, @prgpbTrustInfo : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB**)
    end
  end

  @[Extern]
  struct CTL_MODIFY_REQUEST
    property pccert : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property dwOperation : Win32cr::Security::Cryptography::UI::CTL_MODIFY_REQUEST_OPERATION
    property dwError : UInt32
    def initialize(@pccert : Win32cr::Security::Cryptography::CERT_CONTEXT*, @dwOperation : Win32cr::Security::Cryptography::UI::CTL_MODIFY_REQUEST_OPERATION, @dwError : UInt32)
    end
  end

  @[Extern]
  struct CERT_SELECTUI_INPUT
    property hStore : Win32cr::Security::Cryptography::HCERTSTORE
    property prgpChain : Win32cr::Security::Cryptography::CERT_CHAIN_CONTEXT**
    property cChain : UInt32
    def initialize(@hStore : Win32cr::Security::Cryptography::HCERTSTORE, @prgpChain : Win32cr::Security::Cryptography::CERT_CHAIN_CONTEXT**, @cChain : UInt32)
    end
  end

  @[Extern]
  struct CRYPTUI_CERT_MGR_STRUCT
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property dwFlags : UInt32
    property pwszTitle : Win32cr::Foundation::PWSTR
    property pszInitUsageOID : Win32cr::Foundation::PSTR
    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @dwFlags : UInt32, @pwszTitle : Win32cr::Foundation::PWSTR, @pszInitUsageOID : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO
    property dwSize : UInt32
    property pGuidSubject : LibC::GUID*
    property cbBlob : UInt32
    property pbBlob : UInt8*
    property pwszDisplayName : Win32cr::Foundation::PWSTR
    def initialize(@dwSize : UInt32, @pGuidSubject : LibC::GUID*, @cbBlob : UInt32, @pbBlob : UInt8*, @pwszDisplayName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO
    property dwSize : UInt32
    property cCertStore : UInt32
    property rghCertStore : Win32cr::Security::Cryptography::HCERTSTORE*
    property pFilterCallback : Win32cr::Security::Cryptography::UI::PFNCFILTERPROC
    property pvCallbackData : Void*
    def initialize(@dwSize : UInt32, @cCertStore : UInt32, @rghCertStore : Win32cr::Security::Cryptography::HCERTSTORE*, @pFilterCallback : Win32cr::Security::Cryptography::UI::PFNCFILTERPROC, @pvCallbackData : Void*)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO
    property dwSize : UInt32
    property pwszPvkFileName : Win32cr::Foundation::PWSTR
    property pwszProvName : Win32cr::Foundation::PWSTR
    property dwProvType : UInt32
    def initialize(@dwSize : UInt32, @pwszPvkFileName : Win32cr::Foundation::PWSTR, @pwszProvName : Win32cr::Foundation::PWSTR, @dwProvType : UInt32)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO
    property dwSize : UInt32
    property pwszSigningCertFileName : Win32cr::Foundation::PWSTR
    property dwPvkChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION
    property anonymous : Anonymous_e__Union_

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pPvkFileInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO*
    property pPvkProvInfo : Win32cr::Security::Cryptography::CRYPT_KEY_PROV_INFO*
    def initialize(@pPvkFileInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO*, @pPvkProvInfo : Win32cr::Security::Cryptography::CRYPT_KEY_PROV_INFO*)
    end
    end

    def initialize(@dwSize : UInt32, @pwszSigningCertFileName : Win32cr::Foundation::PWSTR, @dwPvkChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION, @anonymous : Anonymous_e__Union_)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO
    property dwSize : UInt32
    property dwAttrFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE
    property pwszDescription : Win32cr::Foundation::PWSTR
    property pwszMoreInfoLocation : Win32cr::Foundation::PWSTR
    property pszHashAlg : Win32cr::Foundation::PSTR
    property pwszSigningCertDisplayString : Win32cr::Foundation::PWSTR
    property hAdditionalCertStore : Win32cr::Security::Cryptography::HCERTSTORE
    property psAuthenticated : Win32cr::Security::Cryptography::CRYPT_ATTRIBUTES*
    property psUnauthenticated : Win32cr::Security::Cryptography::CRYPT_ATTRIBUTES*
    def initialize(@dwSize : UInt32, @dwAttrFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE, @pwszDescription : Win32cr::Foundation::PWSTR, @pwszMoreInfoLocation : Win32cr::Foundation::PWSTR, @pszHashAlg : Win32cr::Foundation::PSTR, @pwszSigningCertDisplayString : Win32cr::Foundation::PWSTR, @hAdditionalCertStore : Win32cr::Security::Cryptography::HCERTSTORE, @psAuthenticated : Win32cr::Security::Cryptography::CRYPT_ATTRIBUTES*, @psUnauthenticated : Win32cr::Security::Cryptography::CRYPT_ATTRIBUTES*)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_INFO
    property dwSize : UInt32
    property dwSubjectChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT
    property anonymous1 : Anonymous1_e__Union_
    property dwSigningCertChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN
    property anonymous2 : Anonymous2_e__Union_
    property pwszTimestampURL : Win32cr::Foundation::PWSTR
    property dwAdditionalCertChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE
    property pSignExtInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO*

    # Nested Type Anonymous2_e__Union_
    @[Extern(union: true)]
    struct Anonymous2_e__Union_
    property pSigningCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property pSigningCertStore : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO*
    property pSigningCertPvkInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO*
    def initialize(@pSigningCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @pSigningCertStore : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO*, @pSigningCertPvkInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO*)
    end
    end


    # Nested Type Anonymous1_e__Union_
    @[Extern(union: true)]
    struct Anonymous1_e__Union_
    property pwszFileName : Win32cr::Foundation::PWSTR
    property pSignBlobInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO*
    def initialize(@pwszFileName : Win32cr::Foundation::PWSTR, @pSignBlobInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO*)
    end
    end

    def initialize(@dwSize : UInt32, @dwSubjectChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT, @anonymous1 : Anonymous1_e__Union_, @dwSigningCertChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN, @anonymous2 : Anonymous2_e__Union_, @pwszTimestampURL : Win32cr::Foundation::PWSTR, @dwAdditionalCertChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE, @pSignExtInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO*)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT
    property dwSize : UInt32
    property cbBlob : UInt32
    property pbBlob : UInt8*
    def initialize(@dwSize : UInt32, @cbBlob : UInt32, @pbBlob : UInt8*)
    end
  end

  @[Extern]
  struct CRYPTUI_INITDIALOG_STRUCT
    property lParam : Win32cr::Foundation::LPARAM
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    def initialize(@lParam : Win32cr::Foundation::LPARAM, @pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*)
    end
  end

  @[Extern]
  struct CRYPTUI_VIEWCERTIFICATE_STRUCTW
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_FLAGS
    property szTitle : Win32cr::Foundation::PWSTR
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property rgszPurposes : Win32cr::Foundation::PSTR*
    property cPurposes : UInt32
    property anonymous : Anonymous_e__Union_
    property fpCryptProviderDataTrustedUsage : Win32cr::Foundation::BOOL
    property idxSigner : UInt32
    property idxCert : UInt32
    property fCounterSigner : Win32cr::Foundation::BOOL
    property idxCounterSigner : UInt32
    property cStores : UInt32
    property rghStores : Win32cr::Security::Cryptography::HCERTSTORE*
    property cPropSheetPages : UInt32
    property rgPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEW*
    property nStartPage : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pCryptProviderData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*
    property hWVTStateData : Win32cr::Foundation::HANDLE
    def initialize(@pCryptProviderData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, @hWVTStateData : Win32cr::Foundation::HANDLE)
    end
    end

    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_FLAGS, @szTitle : Win32cr::Foundation::PWSTR, @pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @rgszPurposes : Win32cr::Foundation::PSTR*, @cPurposes : UInt32, @anonymous : Anonymous_e__Union_, @fpCryptProviderDataTrustedUsage : Win32cr::Foundation::BOOL, @idxSigner : UInt32, @idxCert : UInt32, @fCounterSigner : Win32cr::Foundation::BOOL, @idxCounterSigner : UInt32, @cStores : UInt32, @rghStores : Win32cr::Security::Cryptography::HCERTSTORE*, @cPropSheetPages : UInt32, @rgPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEW*, @nStartPage : UInt32)
    end
  end

  @[Extern]
  struct CRYPTUI_VIEWCERTIFICATE_STRUCTA
    property dwSize : UInt32
    property hwndParent : Win32cr::Foundation::HWND
    property dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_FLAGS
    property szTitle : Win32cr::Foundation::PSTR
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property rgszPurposes : Win32cr::Foundation::PSTR*
    property cPurposes : UInt32
    property anonymous : Anonymous_e__Union_
    property fpCryptProviderDataTrustedUsage : Win32cr::Foundation::BOOL
    property idxSigner : UInt32
    property idxCert : UInt32
    property fCounterSigner : Win32cr::Foundation::BOOL
    property idxCounterSigner : UInt32
    property cStores : UInt32
    property rghStores : Win32cr::Security::Cryptography::HCERTSTORE*
    property cPropSheetPages : UInt32
    property rgPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEA*
    property nStartPage : UInt32

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pCryptProviderData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*
    property hWVTStateData : Win32cr::Foundation::HANDLE
    def initialize(@pCryptProviderData : Win32cr::Security::WinTrust::CRYPT_PROVIDER_DATA*, @hWVTStateData : Win32cr::Foundation::HANDLE)
    end
    end

    def initialize(@dwSize : UInt32, @hwndParent : Win32cr::Foundation::HWND, @dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_FLAGS, @szTitle : Win32cr::Foundation::PSTR, @pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @rgszPurposes : Win32cr::Foundation::PSTR*, @cPurposes : UInt32, @anonymous : Anonymous_e__Union_, @fpCryptProviderDataTrustedUsage : Win32cr::Foundation::BOOL, @idxSigner : UInt32, @idxCert : UInt32, @fCounterSigner : Win32cr::Foundation::BOOL, @idxCounterSigner : UInt32, @cStores : UInt32, @rghStores : Win32cr::Security::Cryptography::HCERTSTORE*, @cPropSheetPages : UInt32, @rgPropSheetPages : Win32cr::UI::Controls::PROPSHEETPAGEA*, @nStartPage : UInt32)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_EXPORT_INFO
    property dwSize : UInt32
    property pwszExportFileName : Win32cr::Foundation::PWSTR
    property dwSubjectChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_EXPORT_SUBJECT
    property anonymous : Anonymous_e__Union_
    property cStores : UInt32
    property rghStores : Win32cr::Security::Cryptography::HCERTSTORE*

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property pCTLContext : Win32cr::Security::Cryptography::CTL_CONTEXT*
    property pCRLContext : Win32cr::Security::Cryptography::CRL_CONTEXT*
    property hCertStore : Win32cr::Security::Cryptography::HCERTSTORE
    def initialize(@pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @pCTLContext : Win32cr::Security::Cryptography::CTL_CONTEXT*, @pCRLContext : Win32cr::Security::Cryptography::CRL_CONTEXT*, @hCertStore : Win32cr::Security::Cryptography::HCERTSTORE)
    end
    end

    def initialize(@dwSize : UInt32, @pwszExportFileName : Win32cr::Foundation::PWSTR, @dwSubjectChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_EXPORT_SUBJECT, @anonymous : Anonymous_e__Union_, @cStores : UInt32, @rghStores : Win32cr::Security::Cryptography::HCERTSTORE*)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO
    property dwSize : UInt32
    property dwExportFormat : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_EXPORT_FORMAT
    property fExportChain : Win32cr::Foundation::BOOL
    property fExportPrivateKeys : Win32cr::Foundation::BOOL
    property pwszPassword : Win32cr::Foundation::PWSTR
    property fStrongEncryption : Win32cr::Foundation::BOOL
    def initialize(@dwSize : UInt32, @dwExportFormat : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_EXPORT_FORMAT, @fExportChain : Win32cr::Foundation::BOOL, @fExportPrivateKeys : Win32cr::Foundation::BOOL, @pwszPassword : Win32cr::Foundation::PWSTR, @fStrongEncryption : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct CRYPTUI_WIZ_IMPORT_SRC_INFO
    property dwSize : UInt32
    property dwSubjectChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION
    property anonymous : Anonymous_e__Union_
    property dwFlags : Win32cr::Security::Cryptography::CRYPT_KEY_FLAGS
    property pwszPassword : Win32cr::Foundation::PWSTR

    # Nested Type Anonymous_e__Union_
    @[Extern(union: true)]
    struct Anonymous_e__Union_
    property pwszFileName : Win32cr::Foundation::PWSTR
    property pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*
    property pCTLContext : Win32cr::Security::Cryptography::CTL_CONTEXT*
    property pCRLContext : Win32cr::Security::Cryptography::CRL_CONTEXT*
    property hCertStore : Win32cr::Security::Cryptography::HCERTSTORE
    def initialize(@pwszFileName : Win32cr::Foundation::PWSTR, @pCertContext : Win32cr::Security::Cryptography::CERT_CONTEXT*, @pCTLContext : Win32cr::Security::Cryptography::CTL_CONTEXT*, @pCRLContext : Win32cr::Security::Cryptography::CRL_CONTEXT*, @hCertStore : Win32cr::Security::Cryptography::HCERTSTORE)
    end
    end

    def initialize(@dwSize : UInt32, @dwSubjectChoice : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION, @anonymous : Anonymous_e__Union_, @dwFlags : Win32cr::Security::Cryptography::CRYPT_KEY_FLAGS, @pwszPassword : Win32cr::Foundation::PWSTR)
    end
  end

  def cryptUIDlgViewContext(dwContextType : UInt32, pvContext : Void*, hwnd : Win32cr::Foundation::HWND, pwszTitle : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Foundation::BOOL
    C.CryptUIDlgViewContext(dwContextType, pvContext, hwnd, pwszTitle, dwFlags, pvReserved)
  end

  def cryptUIDlgSelectCertificateFromStore(hCertStore : Win32cr::Security::Cryptography::HCERTSTORE, hwnd : Win32cr::Foundation::HWND, pwszTitle : Win32cr::Foundation::PWSTR, pwszDisplayString : Win32cr::Foundation::PWSTR, dwDontUseColumn : UInt32, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Security::Cryptography::CERT_CONTEXT*
    C.CryptUIDlgSelectCertificateFromStore(hCertStore, hwnd, pwszTitle, pwszDisplayString, dwDontUseColumn, dwFlags, pvReserved)
  end

  def certSelectionGetSerializedBlob(pcsi : Win32cr::Security::Cryptography::UI::CERT_SELECTUI_INPUT*, ppOutBuffer : Void**, pulOutBufferSize : UInt32*) : Win32cr::Foundation::HRESULT
    C.CertSelectionGetSerializedBlob(pcsi, ppOutBuffer, pulOutBufferSize)
  end

  def cryptUIDlgCertMgr(pCryptUICertMgr : Win32cr::Security::Cryptography::UI::CRYPTUI_CERT_MGR_STRUCT*) : Win32cr::Foundation::BOOL
    C.CryptUIDlgCertMgr(pCryptUICertMgr)
  end

  def cryptUIWizDigitalSign(dwFlags : UInt32, hwndParent : Win32cr::Foundation::HWND, pwszWizardTitle : Win32cr::Foundation::PWSTR, pDigitalSignInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_INFO*, ppSignContext : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT**) : Win32cr::Foundation::BOOL
    C.CryptUIWizDigitalSign(dwFlags, hwndParent, pwszWizardTitle, pDigitalSignInfo, ppSignContext)
  end

  def cryptUIWizFreeDigitalSignContext(pSignContext : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT*) : Win32cr::Foundation::BOOL
    C.CryptUIWizFreeDigitalSignContext(pSignContext)
  end

  def cryptUIDlgViewCertificateW(pCertViewInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_STRUCTW*, pfPropertiesChanged : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.CryptUIDlgViewCertificateW(pCertViewInfo, pfPropertiesChanged)
  end

  def cryptUIDlgViewCertificateA(pCertViewInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_STRUCTA*, pfPropertiesChanged : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL
    C.CryptUIDlgViewCertificateA(pCertViewInfo, pfPropertiesChanged)
  end

  def cryptUIWizExport(dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_FLAGS, hwndParent : Win32cr::Foundation::HWND, pwszWizardTitle : Win32cr::Foundation::PWSTR, pExportInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_EXPORT_INFO*, pvoid : Void*) : Win32cr::Foundation::BOOL
    C.CryptUIWizExport(dwFlags, hwndParent, pwszWizardTitle, pExportInfo, pvoid)
  end

  def cryptUIWizImport(dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_FLAGS, hwndParent : Win32cr::Foundation::HWND, pwszWizardTitle : Win32cr::Foundation::PWSTR, pImportSrc : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_IMPORT_SRC_INFO*, hDestCertStore : Win32cr::Security::Cryptography::HCERTSTORE) : Win32cr::Foundation::BOOL
    C.CryptUIWizImport(dwFlags, hwndParent, pwszWizardTitle, pImportSrc, hDestCertStore)
  end

  @[Link("cryptui")]
  lib C
    # :nodoc:
    fun CryptUIDlgViewContext(dwContextType : UInt32, pvContext : Void*, hwnd : Win32cr::Foundation::HWND, pwszTitle : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIDlgSelectCertificateFromStore(hCertStore : Win32cr::Security::Cryptography::HCERTSTORE, hwnd : Win32cr::Foundation::HWND, pwszTitle : Win32cr::Foundation::PWSTR, pwszDisplayString : Win32cr::Foundation::PWSTR, dwDontUseColumn : UInt32, dwFlags : UInt32, pvReserved : Void*) : Win32cr::Security::Cryptography::CERT_CONTEXT*

    # :nodoc:
    fun CertSelectionGetSerializedBlob(pcsi : Win32cr::Security::Cryptography::UI::CERT_SELECTUI_INPUT*, ppOutBuffer : Void**, pulOutBufferSize : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CryptUIDlgCertMgr(pCryptUICertMgr : Win32cr::Security::Cryptography::UI::CRYPTUI_CERT_MGR_STRUCT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIWizDigitalSign(dwFlags : UInt32, hwndParent : Win32cr::Foundation::HWND, pwszWizardTitle : Win32cr::Foundation::PWSTR, pDigitalSignInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_INFO*, ppSignContext : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT**) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIWizFreeDigitalSignContext(pSignContext : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIDlgViewCertificateW(pCertViewInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_STRUCTW*, pfPropertiesChanged : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIDlgViewCertificateA(pCertViewInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_VIEWCERTIFICATE_STRUCTA*, pfPropertiesChanged : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIWizExport(dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_FLAGS, hwndParent : Win32cr::Foundation::HWND, pwszWizardTitle : Win32cr::Foundation::PWSTR, pExportInfo : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_EXPORT_INFO*, pvoid : Void*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptUIWizImport(dwFlags : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_FLAGS, hwndParent : Win32cr::Foundation::HWND, pwszWizardTitle : Win32cr::Foundation::PWSTR, pImportSrc : Win32cr::Security::Cryptography::UI::CRYPTUI_WIZ_IMPORT_SRC_INFO*, hDestCertStore : Win32cr::Security::Cryptography::HCERTSTORE) : Win32cr::Foundation::BOOL

  end
end