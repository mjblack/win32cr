require "../../foundation.cr"
require "../../security/cryptography.cr"
require "../../ui/controls.cr"
require "../../security/wintrust.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:cryptui.dll")]
{% else %}
@[Link("cryptui")]
{% end %}
lib LibWin32
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

  alias PFNCMFILTERPROC = Proc(CERT_CONTEXT*, LPARAM, UInt32, UInt32, LibC::BOOL)
  alias PFNCMHOOKPROC = Proc(LibC::HANDLE, UInt32, LibC::UINT_PTR, LPARAM, UInt32)
  alias PFNTRUSTHELPER = Proc(CERT_CONTEXT*, LPARAM, LibC::BOOL, UInt8*, HRESULT)
  alias PFNCFILTERPROC = Proc(CERT_CONTEXT*, LibC::BOOL*, Void*, LibC::BOOL)


  enum CRYPTUI_WIZ_FLAGS : UInt32
    CRYPTUI_WIZ_NO_UI = 1
    CRYPTUI_WIZ_IGNORE_NO_UI_FLAG_FOR_CSPS = 2
    CRYPTUI_WIZ_NO_UI_EXCEPT_CSP = 3
    CRYPTUI_WIZ_IMPORT_ALLOW_CERT = 131072
    CRYPTUI_WIZ_IMPORT_ALLOW_CRL = 262144
    CRYPTUI_WIZ_IMPORT_ALLOW_CTL = 524288
    CRYPTUI_WIZ_IMPORT_NO_CHANGE_DEST_STORE = 65536
    CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE = 1048576
    CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER = 2097152
    CRYPTUI_WIZ_IMPORT_REMOTE_DEST_STORE = 4194304
    CRYPTUI_WIZ_EXPORT_PRIVATE_KEY = 256
    CRYPTUI_WIZ_EXPORT_NO_DELETE_PRIVATE_KEY = 512
  end

  enum CRYPTUI_VIEWCERTIFICATE_FLAGS : UInt32
    CRYPTUI_HIDE_HIERARCHYPAGE = 1
    CRYPTUI_HIDE_DETAILPAGE = 2
    CRYPTUI_DISABLE_EDITPROPERTIES = 4
    CRYPTUI_ENABLE_EDITPROPERTIES = 8
    CRYPTUI_DISABLE_ADDTOSTORE = 16
    CRYPTUI_ENABLE_ADDTOSTORE = 32
    CRYPTUI_ACCEPT_DECLINE_STYLE = 64
    CRYPTUI_IGNORE_UNTRUSTED_ROOT = 128
    CRYPTUI_DONT_OPEN_STORES = 256
    CRYPTUI_ONLY_OPEN_ROOT_STORE = 512
    CRYPTUI_WARN_UNTRUSTED_ROOT = 1024
    CRYPTUI_ENABLE_REVOCATION_CHECKING = 2048
    CRYPTUI_WARN_REMOTE_TRUST = 4096
    CRYPTUI_DISABLE_EXPORT = 8192
    CRYPTUI_ENABLE_REVOCATION_CHECK_END_CERT = 16384
    CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN = 32768
    CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 2048
    CRYPTUI_DISABLE_HTMLLINK = 65536
    CRYPTUI_DISABLE_ISSUERSTATEMENT = 131072
    CRYPTUI_CACHE_ONLY_URL_RETRIEVAL = 262144
  end

  enum CERT_SELECT_STRUCT_FLAGS : UInt32
    CSS_HIDE_PROPERTIES = 1
    CSS_ENABLEHOOK = 2
    CSS_ALLOWMULTISELECT = 4
    CSS_SHOW_HELP = 16
    CSS_ENABLETEMPLATE = 32
    CSS_ENABLETEMPLATEHANDLE = 64
  end

  enum CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION : UInt32
    CRYPTUI_WIZ_IMPORT_SUBJECT_FILE = 1
    CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT = 2
    CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT = 3
    CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT = 4
    CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE = 5
  end

  enum CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_BLOB = 2
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_FILE = 1
    CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_NONE = 0
  end

  enum CRYPTUI_WIZ_DIGITAL_SIGN : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_CERT = 1
    CRYPTUI_WIZ_DIGITAL_SIGN_STORE = 2
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK = 3
    CRYPTUI_WIZ_DIGITAL_SIGN_NONE = 0
  end

  enum CRYPTUI_WIZ_EXPORT_SUBJECT : UInt32
    CRYPTUI_WIZ_EXPORT_CERT_CONTEXT = 1
    CRYPTUI_WIZ_EXPORT_CTL_CONTEXT = 2
    CRYPTUI_WIZ_EXPORT_CRL_CONTEXT = 3
    CRYPTUI_WIZ_EXPORT_CERT_STORE = 4
    CRYPTUI_WIZ_EXPORT_CERT_STORE_CERTIFICATES_ONLY = 5
  end

  enum CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_COMMERCIAL = 1
    CRYPTUI_WIZ_DIGITAL_SIGN_INDIVIDUAL = 2
  end

  enum CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE = 1
    CRYPTUI_WIZ_DIGITAL_SIGN_PVK_PROV = 2
  end

  enum CERT_VIEWPROPERTIES_STRUCT_FLAGS : UInt32
    CM_ENABLEHOOK = 1
    CM_SHOW_HELP = 2
    CM_SHOW_HELPICON = 4
    CM_ENABLETEMPLATE = 8
    CM_HIDE_ADVANCEPAGE = 16
    CM_HIDE_TRUSTPAGE = 32
    CM_NO_NAMECHANGE = 64
    CM_NO_EDITTRUST = 128
    CM_HIDE_DETAILPAGE = 256
    CM_ADD_CERT_STORES = 512
  end

  enum CRYPTUI_WIZ_EXPORT_FORMAT : UInt32
    CRYPTUI_WIZ_EXPORT_FORMAT_DER = 1
    CRYPTUI_WIZ_EXPORT_FORMAT_PFX = 2
    CRYPTUI_WIZ_EXPORT_FORMAT_PKCS7 = 3
    CRYPTUI_WIZ_EXPORT_FORMAT_BASE64 = 4
    CRYPTUI_WIZ_EXPORT_FORMAT_CRL = 6
    CRYPTUI_WIZ_EXPORT_FORMAT_CTL = 7
  end

  enum CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE : UInt32
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN = 1
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN_NO_ROOT = 2
    CRYPTUI_WIZ_DIGITAL_SIGN_ADD_NONE = 0
  end

  enum CTL_MODIFY_REQUEST_OPERATION : UInt32
    CTL_MODIFY_REQUEST_ADD_TRUSTED = 3
    CTL_MODIFY_REQUEST_ADD_NOT_TRUSTED = 1
    CTL_MODIFY_REQUEST_REMOVE = 2
  end

  union CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_Anonymous_e__Union
    p_pvk_file_info : CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO*
    p_pvk_prov_info : CRYPT_KEY_PROV_INFO*
  end
  union CRYPTUI_WIZ_DIGITAL_SIGN_INFO_Anonymous2_e__Union
    p_signing_cert_context : CERT_CONTEXT*
    p_signing_cert_store : CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO*
    p_signing_cert_pvk_info : CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO*
  end
  union CRYPTUI_WIZ_DIGITAL_SIGN_INFO_Anonymous1_e__Union
    pwsz_file_name : LibC::LPWSTR
    p_sign_blob_info : CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO*
  end
  union CRYPTUI_VIEWCERTIFICATE_STRUCTW_Anonymous_e__Union
    p_crypt_provider_data : CRYPT_PROVIDER_DATA*
    h_wvt_state_data : LibC::HANDLE
  end
  union CRYPTUI_VIEWCERTIFICATE_STRUCTA_Anonymous_e__Union
    p_crypt_provider_data : CRYPT_PROVIDER_DATA*
    h_wvt_state_data : LibC::HANDLE
  end
  union CRYPTUI_WIZ_EXPORT_INFO_Anonymous_e__Union
    p_cert_context : CERT_CONTEXT*
    p_ctl_context : CTL_CONTEXT*
    p_crl_context : CRL_CONTEXT*
    h_cert_store : Void*
  end
  union CRYPTUI_WIZ_IMPORT_SRC_INFO_Anonymous_e__Union
    pwsz_file_name : LibC::LPWSTR
    p_cert_context : CERT_CONTEXT*
    p_ctl_context : CTL_CONTEXT*
    p_crl_context : CRL_CONTEXT*
    h_cert_store : Void*
  end

  struct CERT_SELECT_STRUCT_A
    dw_size : UInt32
    hwnd_parent : HANDLE
    h_instance : HINSTANCE
    p_template_name : PSTR
    dw_flags : CERT_SELECT_STRUCT_FLAGS
    sz_title : PSTR
    c_cert_store : UInt32
    array_cert_store : Void**
    sz_purpose_oid : PSTR
    c_cert_context : UInt32
    array_cert_context : CERT_CONTEXT**
    l_cust_data : LPARAM
    pfn_hook : PFNCMHOOKPROC
    pfn_filter : PFNCMFILTERPROC
    sz_help_file_name : PSTR
    dw_help_id : UInt32
    hprov : LibC::UINT_PTR
  end
  struct CERT_SELECT_STRUCT_W
    dw_size : UInt32
    hwnd_parent : HANDLE
    h_instance : HINSTANCE
    p_template_name : LibC::LPWSTR
    dw_flags : CERT_SELECT_STRUCT_FLAGS
    sz_title : LibC::LPWSTR
    c_cert_store : UInt32
    array_cert_store : Void**
    sz_purpose_oid : PSTR
    c_cert_context : UInt32
    array_cert_context : CERT_CONTEXT**
    l_cust_data : LPARAM
    pfn_hook : PFNCMHOOKPROC
    pfn_filter : PFNCMFILTERPROC
    sz_help_file_name : LibC::LPWSTR
    dw_help_id : UInt32
    hprov : LibC::UINT_PTR
  end
  struct CERT_VIEWPROPERTIES_STRUCT_A
    dw_size : UInt32
    hwnd_parent : HANDLE
    h_instance : HINSTANCE
    dw_flags : CERT_VIEWPROPERTIES_STRUCT_FLAGS
    sz_title : PSTR
    p_cert_context : CERT_CONTEXT*
    array_purposes : PSTR*
    c_array_purposes : UInt32
    c_root_stores : UInt32
    rghstore_roots : Void**
    c_stores : UInt32
    rghstore_c_as : Void**
    c_trust_stores : UInt32
    rghstore_trust : Void**
    hprov : LibC::UINT_PTR
    l_cust_data : LPARAM
    dw_pad : UInt32
    sz_help_file_name : PSTR
    dw_help_id : UInt32
    n_start_page : UInt32
    c_array_prop_sheet_pages : UInt32
    array_prop_sheet_pages : PROPSHEETPAGEA*
  end
  struct CERT_VIEWPROPERTIES_STRUCT_W
    dw_size : UInt32
    hwnd_parent : HANDLE
    h_instance : HINSTANCE
    dw_flags : CERT_VIEWPROPERTIES_STRUCT_FLAGS
    sz_title : LibC::LPWSTR
    p_cert_context : CERT_CONTEXT*
    array_purposes : PSTR*
    c_array_purposes : UInt32
    c_root_stores : UInt32
    rghstore_roots : Void**
    c_stores : UInt32
    rghstore_c_as : Void**
    c_trust_stores : UInt32
    rghstore_trust : Void**
    hprov : LibC::UINT_PTR
    l_cust_data : LPARAM
    dw_pad : UInt32
    sz_help_file_name : LibC::LPWSTR
    dw_help_id : UInt32
    n_start_page : UInt32
    c_array_prop_sheet_pages : UInt32
    array_prop_sheet_pages : PROPSHEETPAGEA*
  end
  struct CMOID
    sz_extension_oid : PSTR
    dw_test_operation : UInt32
    pb_test_data : UInt8*
    cb_test_data : UInt32
  end
  struct CMFLTR
    dw_size : UInt32
    c_extension_checks : UInt32
    array_extension_checks : CMOID*
    dw_checking_flags : UInt32
  end
  struct CERT_VERIFY_CERTIFICATE_TRUST
    cb_size : UInt32
    pccert : CERT_CONTEXT*
    dw_flags : UInt32
    dw_ignore_err : UInt32
    pdw_errors : UInt32*
    psz_usage_oid : PSTR
    hprov : LibC::UINT_PTR
    c_root_stores : UInt32
    rghstore_roots : Void**
    c_stores : UInt32
    rghstore_c_as : Void**
    c_trust_stores : UInt32
    rghstore_trust : Void**
    l_cust_data : LPARAM
    pfn_trust_helper : PFNTRUSTHELPER
    pc_chain : UInt32*
    prg_chain : CERT_CONTEXT***
    prgdw_errors : UInt32**
    prgpb_trust_info : CRYPTOAPI_BLOB**
  end
  struct CTL_MODIFY_REQUEST
    pccert : CERT_CONTEXT*
    dw_operation : CTL_MODIFY_REQUEST_OPERATION
    dw_error : UInt32
  end
  struct CERT_SELECTUI_INPUT
    h_store : Void*
    prgp_chain : CERT_CHAIN_CONTEXT**
    c_chain : UInt32
  end
  struct CRYPTUI_CERT_MGR_STRUCT
    dw_size : UInt32
    hwnd_parent : HANDLE
    dw_flags : UInt32
    pwsz_title : LibC::LPWSTR
    psz_init_usage_oid : PSTR
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO
    dw_size : UInt32
    p_guid_subject : Guid*
    cb_blob : UInt32
    pb_blob : UInt8*
    pwsz_display_name : LibC::LPWSTR
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO
    dw_size : UInt32
    c_cert_store : UInt32
    rgh_cert_store : Void**
    p_filter_callback : PFNCFILTERPROC
    pv_callback_data : Void*
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO
    dw_size : UInt32
    pwsz_pvk_file_name : LibC::LPWSTR
    pwsz_prov_name : LibC::LPWSTR
    dw_prov_type : UInt32
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO
    dw_size : UInt32
    pwsz_signing_cert_file_name : LibC::LPWSTR
    dw_pvk_choice : CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION
    anonymous : CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_Anonymous_e__Union
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO
    dw_size : UInt32
    dw_attr_flags : CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE
    pwsz_description : LibC::LPWSTR
    pwsz_more_info_location : LibC::LPWSTR
    psz_hash_alg : PSTR
    pwsz_signing_cert_display_string : LibC::LPWSTR
    h_additional_cert_store : Void*
    ps_authenticated : CRYPT_ATTRIBUTES*
    ps_unauthenticated : CRYPT_ATTRIBUTES*
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_INFO
    dw_size : UInt32
    dw_subject_choice : CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT
    anonymous1 : CRYPTUI_WIZ_DIGITAL_SIGN_INFO_Anonymous1_e__Union
    dw_signing_cert_choice : CRYPTUI_WIZ_DIGITAL_SIGN
    anonymous2 : CRYPTUI_WIZ_DIGITAL_SIGN_INFO_Anonymous2_e__Union
    pwsz_timestamp_url : LibC::LPWSTR
    dw_additional_cert_choice : CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE
    p_sign_ext_info : CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO*
  end
  struct CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT
    dw_size : UInt32
    cb_blob : UInt32
    pb_blob : UInt8*
  end
  struct CRYPTUI_INITDIALOG_STRUCT
    l_param : LPARAM
    p_cert_context : CERT_CONTEXT*
  end
  struct CRYPTUI_VIEWCERTIFICATE_STRUCTW
    dw_size : UInt32
    hwnd_parent : HANDLE
    dw_flags : CRYPTUI_VIEWCERTIFICATE_FLAGS
    sz_title : LibC::LPWSTR
    p_cert_context : CERT_CONTEXT*
    rgsz_purposes : PSTR*
    c_purposes : UInt32
    anonymous : CRYPTUI_VIEWCERTIFICATE_STRUCTW_Anonymous_e__Union
    fp_crypt_provider_data_trusted_usage : LibC::BOOL
    idx_signer : UInt32
    idx_cert : UInt32
    f_counter_signer : LibC::BOOL
    idx_counter_signer : UInt32
    c_stores : UInt32
    rgh_stores : Void**
    c_prop_sheet_pages : UInt32
    rg_prop_sheet_pages : PROPSHEETPAGEW*
    n_start_page : UInt32
  end
  struct CRYPTUI_VIEWCERTIFICATE_STRUCTA
    dw_size : UInt32
    hwnd_parent : HANDLE
    dw_flags : CRYPTUI_VIEWCERTIFICATE_FLAGS
    sz_title : PSTR
    p_cert_context : CERT_CONTEXT*
    rgsz_purposes : PSTR*
    c_purposes : UInt32
    anonymous : CRYPTUI_VIEWCERTIFICATE_STRUCTA_Anonymous_e__Union
    fp_crypt_provider_data_trusted_usage : LibC::BOOL
    idx_signer : UInt32
    idx_cert : UInt32
    f_counter_signer : LibC::BOOL
    idx_counter_signer : UInt32
    c_stores : UInt32
    rgh_stores : Void**
    c_prop_sheet_pages : UInt32
    rg_prop_sheet_pages : PROPSHEETPAGEA*
    n_start_page : UInt32
  end
  struct CRYPTUI_WIZ_EXPORT_INFO
    dw_size : UInt32
    pwsz_export_file_name : LibC::LPWSTR
    dw_subject_choice : CRYPTUI_WIZ_EXPORT_SUBJECT
    anonymous : CRYPTUI_WIZ_EXPORT_INFO_Anonymous_e__Union
    c_stores : UInt32
    rgh_stores : Void**
  end
  struct CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO
    dw_size : UInt32
    dw_export_format : CRYPTUI_WIZ_EXPORT_FORMAT
    f_export_chain : LibC::BOOL
    f_export_private_keys : LibC::BOOL
    pwsz_password : LibC::LPWSTR
    f_strong_encryption : LibC::BOOL
  end
  struct CRYPTUI_WIZ_IMPORT_SRC_INFO
    dw_size : UInt32
    dw_subject_choice : CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION
    anonymous : CRYPTUI_WIZ_IMPORT_SRC_INFO_Anonymous_e__Union
    dw_flags : CRYPT_KEY_FLAGS
    pwsz_password : LibC::LPWSTR
  end


  # Params # dwcontexttype : UInt32 [In],pvcontext : Void* [In],hwnd : LibC::HANDLE [In],pwsztitle : LibC::LPWSTR [In],dwflags : UInt32 [In],pvreserved : Void* [In]
  fun CryptUIDlgViewContext(dwcontexttype : UInt32, pvcontext : Void*, hwnd : LibC::HANDLE, pwsztitle : LibC::LPWSTR, dwflags : UInt32, pvreserved : Void*) : LibC::BOOL

  # Params # hcertstore : Void* [In],hwnd : LibC::HANDLE [In],pwsztitle : LibC::LPWSTR [In],pwszdisplaystring : LibC::LPWSTR [In],dwdontusecolumn : UInt32 [In],dwflags : UInt32 [In],pvreserved : Void* [In]
  fun CryptUIDlgSelectCertificateFromStore(hcertstore : Void*, hwnd : LibC::HANDLE, pwsztitle : LibC::LPWSTR, pwszdisplaystring : LibC::LPWSTR, dwdontusecolumn : UInt32, dwflags : UInt32, pvreserved : Void*) : CERT_CONTEXT*

  # Params # pcsi : CERT_SELECTUI_INPUT* [In],ppoutbuffer : Void** [In],puloutbuffersize : UInt32* [In]
  fun CertSelectionGetSerializedBlob(pcsi : CERT_SELECTUI_INPUT*, ppoutbuffer : Void**, puloutbuffersize : UInt32*) : HRESULT

  # Params # pcryptuicertmgr : CRYPTUI_CERT_MGR_STRUCT* [In]
  fun CryptUIDlgCertMgr(pcryptuicertmgr : CRYPTUI_CERT_MGR_STRUCT*) : LibC::BOOL

  # Params # dwflags : UInt32 [In],hwndparent : LibC::HANDLE [In],pwszwizardtitle : LibC::LPWSTR [In],pdigitalsigninfo : CRYPTUI_WIZ_DIGITAL_SIGN_INFO* [In],ppsigncontext : CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT** [In]
  fun CryptUIWizDigitalSign(dwflags : UInt32, hwndparent : LibC::HANDLE, pwszwizardtitle : LibC::LPWSTR, pdigitalsigninfo : CRYPTUI_WIZ_DIGITAL_SIGN_INFO*, ppsigncontext : CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT**) : LibC::BOOL

  # Params # psigncontext : CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT* [In]
  fun CryptUIWizFreeDigitalSignContext(psigncontext : CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT*) : LibC::BOOL

  # Params # pcertviewinfo : CRYPTUI_VIEWCERTIFICATE_STRUCTW* [In],pfpropertieschanged : LibC::BOOL* [In]
  fun CryptUIDlgViewCertificateW(pcertviewinfo : CRYPTUI_VIEWCERTIFICATE_STRUCTW*, pfpropertieschanged : LibC::BOOL*) : LibC::BOOL

  # Params # pcertviewinfo : CRYPTUI_VIEWCERTIFICATE_STRUCTA* [In],pfpropertieschanged : LibC::BOOL* [In]
  fun CryptUIDlgViewCertificateA(pcertviewinfo : CRYPTUI_VIEWCERTIFICATE_STRUCTA*, pfpropertieschanged : LibC::BOOL*) : LibC::BOOL

  # Params # dwflags : CRYPTUI_WIZ_FLAGS [In],hwndparent : LibC::HANDLE [In],pwszwizardtitle : LibC::LPWSTR [In],pexportinfo : CRYPTUI_WIZ_EXPORT_INFO* [In],pvoid : Void* [In]
  fun CryptUIWizExport(dwflags : CRYPTUI_WIZ_FLAGS, hwndparent : LibC::HANDLE, pwszwizardtitle : LibC::LPWSTR, pexportinfo : CRYPTUI_WIZ_EXPORT_INFO*, pvoid : Void*) : LibC::BOOL

  # Params # dwflags : CRYPTUI_WIZ_FLAGS [In],hwndparent : LibC::HANDLE [In],pwszwizardtitle : LibC::LPWSTR [In],pimportsrc : CRYPTUI_WIZ_IMPORT_SRC_INFO* [In],hdestcertstore : Void* [In]
  fun CryptUIWizImport(dwflags : CRYPTUI_WIZ_FLAGS, hwndparent : LibC::HANDLE, pwszwizardtitle : LibC::LPWSTR, pimportsrc : CRYPTUI_WIZ_IMPORT_SRC_INFO*, hdestcertstore : Void*) : LibC::BOOL
end
