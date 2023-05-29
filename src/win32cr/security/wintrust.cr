require "../foundation.cr"
require "../security/cryptography.cr"
require "../security/cryptography/sip.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:wintrust.dll")]
lib LibWin32
  WINTRUST_MAX_HEADER_BYTES_TO_MAP_DEFAULT = 10485760_u32
  WINTRUST_MAX_HASH_BYTES_TO_MAP_DEFAULT = 1048576_u32
  WSS_VERIFY_SEALING = 4_u32
  WSS_INPUT_FLAG_MASK = 7_u32
  WSS_OUT_SEALING_STATUS_VERIFIED = 2147483648_u32
  WSS_OUT_HAS_SEALING_INTENT = 1073741824_u32
  WSS_OUT_FILE_SUPPORTS_SEAL = 536870912_u32
  WSS_OUTPUT_FLAG_MASK = 3758096384_u32
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
  WSS_OBJTRUST_SUPPORT = 1_u32
  WSS_SIGTRUST_SUPPORT = 2_u32
  WSS_CERTTRUST_SUPPORT = 4_u32
  WT_CURRENT_VERSION = 512_u32
  WT_ADD_ACTION_ID_RET_RESULT_FLAG = 1_u32
  SPC_UUID_LENGTH = 16_u32
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

  alias PFN_CPD_MEM_ALLOC = Proc(UInt32, Void*)
  alias PFN_CPD_MEM_FREE = Proc(Void*, Void)
  alias PFN_CPD_ADD_STORE = Proc(CRYPT_PROVIDER_DATA*, Void*, LibC::BOOL)
  alias PFN_CPD_ADD_SGNR = Proc(CRYPT_PROVIDER_DATA*, LibC::BOOL, UInt32, CRYPT_PROVIDER_SGNR*, LibC::BOOL)
  alias PFN_CPD_ADD_CERT = Proc(CRYPT_PROVIDER_DATA*, UInt32, LibC::BOOL, UInt32, CERT_CONTEXT*, LibC::BOOL)
  alias PFN_CPD_ADD_PRIVDATA = Proc(CRYPT_PROVIDER_DATA*, CRYPT_PROVIDER_PRIVDATA*, LibC::BOOL)
  alias PFN_PROVIDER_INIT_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_OBJTRUST_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_SIGTRUST_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_CERTTRUST_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_FINALPOLICY_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_TESTFINALPOLICY_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_CLEANUP_CALL = Proc(CRYPT_PROVIDER_DATA*, HRESULT)
  alias PFN_PROVIDER_CERTCHKPOLICY_CALL = Proc(CRYPT_PROVIDER_DATA*, UInt32, LibC::BOOL, UInt32, LibC::BOOL)
  alias PFN_PROVUI_CALL = Proc(LibC::HANDLE, CRYPT_PROVIDER_DATA*, LibC::BOOL)
  alias PFN_ALLOCANDFILLDEFUSAGE = Proc(PSTR, CRYPT_PROVIDER_DEFUSAGE*, LibC::BOOL)
  alias PFN_FREEDEFUSAGE = Proc(PSTR, CRYPT_PROVIDER_DEFUSAGE*, LibC::BOOL)
  alias PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK = Proc(CRYPT_PROVIDER_DATA*, UInt32, UInt32, UInt32, WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO**, Void*, HRESULT)


  enum WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION : UInt32
    DWACTION_ALLOCANDFILL = 1
    DWACTION_FREE = 2
  end

  enum WINTRUST_POLICY_FLAGS : UInt32
    WTPF_TRUSTTEST = 32
    WTPF_TESTCANBEVALID = 128
    WTPF_IGNOREEXPIRATION = 256
    WTPF_IGNOREREVOKATION = 512
    WTPF_OFFLINEOK_IND = 1024
    WTPF_OFFLINEOK_COM = 2048
    WTPF_OFFLINEOKNBU_IND = 4096
    WTPF_OFFLINEOKNBU_COM = 8192
    WTPF_VERIFY_V1_OFF = 65536
    WTPF_IGNOREREVOCATIONONTS = 131072
    WTPF_ALLOWONLYPERTRUST = 262144
  end

  enum WINTRUST_DATA_UICHOICE : UInt32
    WTD_UI_ALL = 1
    WTD_UI_NONE = 2
    WTD_UI_NOBAD = 3
    WTD_UI_NOGOOD = 4
  end

  enum WINTRUST_SIGNATURE_SETTINGS_FLAGS : UInt32
    WSS_VERIFY_SPECIFIC = 1
    WSS_GET_SECONDARY_SIG_COUNT = 2
  end

  enum WINTRUST_DATA_STATE_ACTION : UInt32
    WTD_STATEACTION_IGNORE = 0
    WTD_STATEACTION_VERIFY = 1
    WTD_STATEACTION_CLOSE = 2
    WTD_STATEACTION_AUTO_CACHE = 3
    WTD_STATEACTION_AUTO_CACHE_FLUSH = 4
  end

  enum WINTRUST_DATA_UNION_CHOICE : UInt32
    WTD_CHOICE_FILE = 1
    WTD_CHOICE_CATALOG = 2
    WTD_CHOICE_BLOB = 3
    WTD_CHOICE_SIGNER = 4
    WTD_CHOICE_CERT = 5
  end

  enum WINTRUST_DATA_REVOCATION_CHECKS : UInt32
    WTD_REVOKE_NONE = 0
    WTD_REVOKE_WHOLECHAIN = 1
  end

  enum WINTRUST_DATA_UICONTEXT : UInt32
    WTD_UICONTEXT_EXECUTE = 0
    WTD_UICONTEXT_INSTALL = 1
  end

  union WINTRUST_DATA_Anonymous_e__Union
    p_file : WINTRUST_FILE_INFO*
    p_catalog : WINTRUST_CATALOG_INFO*
    p_blob : WINTRUST_BLOB_INFO*
    p_sgnr : WINTRUST_SGNR_INFO*
    p_cert : WINTRUST_CERT_INFO*
  end
  union CRYPT_PROVIDER_DATA_Anonymous_e__Union
    p_pd_sip : PROVDATA_SIP*
  end
  union SPC_LINK_Anonymous_e__Union
    pwsz_url : LibC::LPWSTR
    moniker : SPC_SERIALIZED_OBJECT
    pwsz_file : LibC::LPWSTR
  end
  union WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO_Anonymous_e__Union
    cb_struct : UInt32
    cb_size : UInt32
  end
  union WTD_GENERIC_CHAIN_POLICY_CREATE_INFO_Anonymous_e__Union
    cb_struct : UInt32
    cb_size : UInt32
  end
  union WTD_GENERIC_CHAIN_POLICY_DATA_Anonymous_e__Union
    cb_struct : UInt32
    cb_size : UInt32
  end

  struct WINTRUST_DATA
    cb_struct : UInt32
    p_policy_callback_data : Void*
    p_sip_client_data : Void*
    dw_ui_choice : WINTRUST_DATA_UICHOICE
    fdw_revocation_checks : WINTRUST_DATA_REVOCATION_CHECKS
    dw_union_choice : WINTRUST_DATA_UNION_CHOICE
    anonymous : WINTRUST_DATA_Anonymous_e__Union
    dw_state_action : WINTRUST_DATA_STATE_ACTION
    h_wvt_state_data : LibC::HANDLE
    pwsz_url_reference : LibC::LPWSTR
    dw_prov_flags : UInt32
    dw_ui_context : WINTRUST_DATA_UICONTEXT
    p_signature_settings : WINTRUST_SIGNATURE_SETTINGS*
  end
  struct WINTRUST_SIGNATURE_SETTINGS
    cb_struct : UInt32
    dw_index : UInt32
    dw_flags : WINTRUST_SIGNATURE_SETTINGS_FLAGS
    c_secondary_sigs : UInt32
    dw_verified_sig_index : UInt32
    p_crypto_policy : CERT_STRONG_SIGN_PARA*
  end
  struct WINTRUST_FILE_INFO
    cb_struct : UInt32
    pcwsz_file_path : LibC::LPWSTR
    h_file : LibC::HANDLE
    pg_known_subject : Guid*
  end
  struct WINTRUST_CATALOG_INFO
    cb_struct : UInt32
    dw_catalog_version : UInt32
    pcwsz_catalog_file_path : LibC::LPWSTR
    pcwsz_member_tag : LibC::LPWSTR
    pcwsz_member_file_path : LibC::LPWSTR
    h_member_file : LibC::HANDLE
    pb_calculated_file_hash : UInt8*
    cb_calculated_file_hash : UInt32
    pc_catalog_context : CTL_CONTEXT*
    h_cat_admin : LibC::IntPtrT
  end
  struct WINTRUST_BLOB_INFO
    cb_struct : UInt32
    g_subject : Guid
    pcwsz_display_name : LibC::LPWSTR
    cb_mem_object : UInt32
    pb_mem_object : UInt8*
    cb_mem_signed_msg : UInt32
    pb_mem_signed_msg : UInt8*
  end
  struct WINTRUST_SGNR_INFO
    cb_struct : UInt32
    pcwsz_display_name : LibC::LPWSTR
    ps_signer_info : CMSG_SIGNER_INFO*
    ch_stores : UInt32
    pah_stores : Void**
  end
  struct WINTRUST_CERT_INFO
    cb_struct : UInt32
    pcwsz_display_name : LibC::LPWSTR
    ps_cert_context : CERT_CONTEXT*
    ch_stores : UInt32
    pah_stores : Void**
    dw_flags : UInt32
    psft_verify_as_of : FILETIME*
  end
  struct CRYPT_PROVIDER_DATA
    cb_struct : UInt32
    p_wintrust_data : WINTRUST_DATA*
    f_opened_file : LibC::BOOL
    h_wnd_parent : HANDLE
    pg_action_id : Guid*
    h_prov : LibC::UINT_PTR
    dw_error : UInt32
    dw_reg_security_settings : UInt32
    dw_reg_policy_settings : UInt32
    ps_pfns : CRYPT_PROVIDER_FUNCTIONS*
    cdw_trust_step_errors : UInt32
    padw_trust_step_errors : UInt32*
    ch_stores : UInt32
    pah_stores : Void**
    dw_encoding : UInt32
    h_msg : Void*
    cs_signers : UInt32
    pas_signers : CRYPT_PROVIDER_SGNR*
    cs_prov_priv_data : UInt32
    pas_prov_priv_data : CRYPT_PROVIDER_PRIVDATA*
    dw_subject_choice : UInt32
    anonymous : CRYPT_PROVIDER_DATA_Anonymous_e__Union
    psz_usage_oid : PSTR
    f_recall_with_state : LibC::BOOL
    sft_system_time : FILETIME
    psz_ctl_signer_usage_oid : PSTR
    dw_prov_flags : UInt32
    dw_final_error : UInt32
    p_request_usage : CERT_USAGE_MATCH*
    dw_trust_pub_settings : UInt32
    dw_ui_state_flags : UInt32
    p_sig_state : CRYPT_PROVIDER_SIGSTATE*
    p_sig_settings : WINTRUST_SIGNATURE_SETTINGS*
  end
  struct CRYPT_PROVIDER_SIGSTATE
    cb_struct : UInt32
    rh_secondary_sigs : Void**
    h_primary_sig : Void*
    f_first_attempt_made : LibC::BOOL
    f_no_more_sigs : LibC::BOOL
    c_secondary_sigs : UInt32
    dw_current_index : UInt32
    f_support_multi_sig : LibC::BOOL
    dw_crypto_policy_support : UInt32
    i_attempt_count : UInt32
    f_checked_sealing : LibC::BOOL
    p_sealing_signature : SEALING_SIGNATURE_ATTRIBUTE*
  end
  struct CRYPT_PROVIDER_FUNCTIONS
    cb_struct : UInt32
    pfn_alloc : PFN_CPD_MEM_ALLOC
    pfn_free : PFN_CPD_MEM_FREE
    pfn_add_store2_chain : PFN_CPD_ADD_STORE
    pfn_add_sgnr2_chain : PFN_CPD_ADD_SGNR
    pfn_add_cert2_chain : PFN_CPD_ADD_CERT
    pfn_add_priv_data2_chain : PFN_CPD_ADD_PRIVDATA
    pfn_initialize : PFN_PROVIDER_INIT_CALL
    pfn_object_trust : PFN_PROVIDER_OBJTRUST_CALL
    pfn_signature_trust : PFN_PROVIDER_SIGTRUST_CALL
    pfn_certificate_trust : PFN_PROVIDER_CERTTRUST_CALL
    pfn_final_policy : PFN_PROVIDER_FINALPOLICY_CALL
    pfn_cert_check_policy : PFN_PROVIDER_CERTCHKPOLICY_CALL
    pfn_test_final_policy : PFN_PROVIDER_TESTFINALPOLICY_CALL
    ps_u_ipfns : CRYPT_PROVUI_FUNCS*
    pfn_cleanup_policy : PFN_PROVIDER_CLEANUP_CALL
  end
  struct CRYPT_PROVUI_FUNCS
    cb_struct : UInt32
    ps_ui_data : CRYPT_PROVUI_DATA*
    pfn_on_more_info_click : PFN_PROVUI_CALL
    pfn_on_more_info_click_default : PFN_PROVUI_CALL
    pfn_on_advanced_click : PFN_PROVUI_CALL
    pfn_on_advanced_click_default : PFN_PROVUI_CALL
  end
  struct CRYPT_PROVUI_DATA
    cb_struct : UInt32
    dw_final_error : UInt32
    p_yes_button_text : LibC::LPWSTR
    p_no_button_text : LibC::LPWSTR
    p_more_info_button_text : LibC::LPWSTR
    p_advanced_link_text : LibC::LPWSTR
    p_copy_action_text : LibC::LPWSTR
    p_copy_action_text_no_ts : LibC::LPWSTR
    p_copy_action_text_not_signed : LibC::LPWSTR
  end
  struct CRYPT_PROVIDER_SGNR
    cb_struct : UInt32
    sft_verify_as_of : FILETIME
    cs_cert_chain : UInt32
    pas_cert_chain : CRYPT_PROVIDER_CERT*
    dw_signer_type : UInt32
    ps_signer : CMSG_SIGNER_INFO*
    dw_error : UInt32
    cs_counter_signers : UInt32
    pas_counter_signers : CRYPT_PROVIDER_SGNR*
    p_chain_context : CERT_CHAIN_CONTEXT*
  end
  struct CRYPT_PROVIDER_CERT
    cb_struct : UInt32
    p_cert : CERT_CONTEXT*
    f_commercial : LibC::BOOL
    f_trusted_root : LibC::BOOL
    f_self_signed : LibC::BOOL
    f_test_cert : LibC::BOOL
    dw_revoked_reason : UInt32
    dw_confidence : UInt32
    dw_error : UInt32
    p_trust_list_context : CTL_CONTEXT*
    f_trust_list_signer_cert : LibC::BOOL
    p_ctl_context : CTL_CONTEXT*
    dw_ctl_error : UInt32
    f_is_cyclic : LibC::BOOL
    p_chain_element : CERT_CHAIN_ELEMENT*
  end
  struct CRYPT_PROVIDER_PRIVDATA
    cb_struct : UInt32
    g_provider_id : Guid
    cb_prov_data : UInt32
    pv_prov_data : Void*
  end
  struct PROVDATA_SIP
    cb_struct : UInt32
    g_subject : Guid
    p_sip : SIP_DISPATCH_INFO*
    p_cat_sip : SIP_DISPATCH_INFO*
    ps_sip_subject_info : SIP_SUBJECTINFO*
    ps_sip_cat_subject_info : SIP_SUBJECTINFO*
    ps_indirect_data : SIP_INDIRECT_DATA*
  end
  struct CRYPT_TRUST_REG_ENTRY
    cb_struct : UInt32
    pwsz_dll_name : LibC::LPWSTR
    pwsz_function_name : LibC::LPWSTR
  end
  struct CRYPT_REGISTER_ACTIONID
    cb_struct : UInt32
    s_init_provider : CRYPT_TRUST_REG_ENTRY
    s_object_provider : CRYPT_TRUST_REG_ENTRY
    s_signature_provider : CRYPT_TRUST_REG_ENTRY
    s_certificate_provider : CRYPT_TRUST_REG_ENTRY
    s_certificate_policy_provider : CRYPT_TRUST_REG_ENTRY
    s_final_policy_provider : CRYPT_TRUST_REG_ENTRY
    s_test_policy_provider : CRYPT_TRUST_REG_ENTRY
    s_cleanup_provider : CRYPT_TRUST_REG_ENTRY
  end
  struct CRYPT_PROVIDER_REGDEFUSAGE
    cb_struct : UInt32
    pg_action_id : Guid*
    pwsz_dll_name : LibC::LPWSTR
    pwsz_load_callback_data_function_name : PSTR
    pwsz_free_callback_data_function_name : PSTR
  end
  struct CRYPT_PROVIDER_DEFUSAGE
    cb_struct : UInt32
    g_action_id : Guid
    p_def_policy_callback_data : Void*
    p_def_sip_client_data : Void*
  end
  struct SPC_SERIALIZED_OBJECT
    class_id : UInt8[16]*
    serialized_data : CRYPTOAPI_BLOB
  end
  struct SPC_SIGINFO
    dw_sip_version : UInt32
    g_sip_guid : Guid
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
    dw_reserved3 : UInt32
    dw_reserved4 : UInt32
    dw_reserved5 : UInt32
  end
  struct SPC_LINK
    dw_link_choice : UInt32
    anonymous : SPC_LINK_Anonymous_e__Union
  end
  struct SPC_PE_IMAGE_DATA
    flags : CRYPT_BIT_BLOB
    p_file : SPC_LINK*
  end
  struct SPC_INDIRECT_DATA_CONTENT
    data : CRYPT_ATTRIBUTE_TYPE_VALUE
    digest_algorithm : CRYPT_ALGORITHM_IDENTIFIER
    digest : CRYPTOAPI_BLOB
  end
  struct SPC_FINANCIAL_CRITERIA
    f_financial_info_available : LibC::BOOL
    f_meets_criteria : LibC::BOOL
  end
  struct SPC_IMAGE
    p_image_link : SPC_LINK*
    bitmap : CRYPTOAPI_BLOB
    metafile : CRYPTOAPI_BLOB
    enhanced_metafile : CRYPTOAPI_BLOB
    gif_file : CRYPTOAPI_BLOB
  end
  struct SPC_SP_AGENCY_INFO
    p_policy_information : SPC_LINK*
    pwsz_policy_display_text : LibC::LPWSTR
    p_logo_image : SPC_IMAGE*
    p_logo_link : SPC_LINK*
  end
  struct SPC_STATEMENT_TYPE
    c_key_purpose_id : UInt32
    rgpsz_key_purpose_id : PSTR*
  end
  struct SPC_SP_OPUS_INFO
    pwsz_program_name : LibC::LPWSTR
    p_more_info : SPC_LINK*
    p_publisher_info : SPC_LINK*
  end
  struct CAT_NAMEVALUE
    pwsz_tag : LibC::LPWSTR
    fdw_flags : UInt32
    value : CRYPTOAPI_BLOB
  end
  struct CAT_MEMBERINFO
    pwsz_subj_guid : LibC::LPWSTR
    dw_cert_version : UInt32
  end
  struct CAT_MEMBERINFO2
    subject_guid : Guid
    dw_cert_version : UInt32
  end
  struct INTENT_TO_SEAL_ATTRIBUTE
    version : UInt32
    seal : BOOLEAN
  end
  struct SEALING_SIGNATURE_ATTRIBUTE
    version : UInt32
    signer_index : UInt32
    signature_algorithm : CRYPT_ALGORITHM_IDENTIFIER
    encrypted_digest : CRYPTOAPI_BLOB
  end
  struct SEALING_TIMESTAMP_ATTRIBUTE
    version : UInt32
    signer_index : UInt32
    seal_time_stamp_token : CRYPTOAPI_BLOB
  end
  struct WIN_CERTIFICATE
    dw_length : UInt32
    w_revision : UInt16
    w_certificate_type : UInt16
    b_certificate : UInt8[0]*
  end
  struct WIN_TRUST_ACTDATA_CONTEXT_WITH_SUBJECT
    h_client_token : LibC::HANDLE
    subject_type : Guid*
    subject : Void*
  end
  struct WIN_TRUST_ACTDATA_SUBJECT_ONLY
    subject_type : Guid*
    subject : Void*
  end
  struct WIN_TRUST_SUBJECT_FILE
    h_file : LibC::HANDLE
    lp_path : LibC::LPWSTR
  end
  struct WIN_TRUST_SUBJECT_FILE_AND_DISPLAY
    h_file : LibC::HANDLE
    lp_path : LibC::LPWSTR
    lp_display_name : LibC::LPWSTR
  end
  struct WIN_SPUB_TRUSTED_PUBLISHER_DATA
    h_client_token : LibC::HANDLE
    lp_certificate : WIN_CERTIFICATE*
  end
  struct WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO
    anonymous : WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO_Anonymous_e__Union
    p_chain_context : CERT_CHAIN_CONTEXT*
    dw_signer_type : UInt32
    p_msg_signer_info : CMSG_SIGNER_INFO*
    dw_error : UInt32
    c_counter_signer : UInt32
    rgp_counter_signer : WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO**
  end
  struct WTD_GENERIC_CHAIN_POLICY_CREATE_INFO
    anonymous : WTD_GENERIC_CHAIN_POLICY_CREATE_INFO_Anonymous_e__Union
    h_chain_engine : HCERTCHAINENGINE
    p_chain_para : CERT_CHAIN_PARA*
    dw_flags : UInt32
    pv_reserved : Void*
  end
  struct WTD_GENERIC_CHAIN_POLICY_DATA
    anonymous : WTD_GENERIC_CHAIN_POLICY_DATA_Anonymous_e__Union
    p_signer_chain_info : WTD_GENERIC_CHAIN_POLICY_CREATE_INFO*
    p_counter_signer_chain_info : WTD_GENERIC_CHAIN_POLICY_CREATE_INFO*
    pfn_policy_callback : PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK
    pv_policy_arg : Void*
  end
  struct DRIVER_VER_MAJORMINOR
    dw_major : UInt32
    dw_minor : UInt32
  end
  struct DRIVER_VER_INFO
    cb_struct : UInt32
    dw_reserved1 : LibC::UINT_PTR
    dw_reserved2 : LibC::UINT_PTR
    dw_platform : UInt32
    dw_version : UInt32
    wsz_version : Char[260]*
    wsz_signed_by : Char[260]*
    pc_signer_cert_context : CERT_CONTEXT*
    s_os_version_low : DRIVER_VER_MAJORMINOR
    s_os_version_high : DRIVER_VER_MAJORMINOR
    dw_build_number_low : UInt32
    dw_build_number_high : UInt32
  end
  struct CONFIG_CI_PROV_INFO_RESULT
    hr : HRESULT
    dw_result : UInt32
    dw_policy_index : UInt32
    f_is_explicit_deny : BOOLEAN
  end
  struct CONFIG_CI_PROV_INFO
    cb_size : UInt32
    dw_policies : UInt32
    p_policies : CRYPTOAPI_BLOB*
    result : CONFIG_CI_PROV_INFO_RESULT
    dw_scenario : UInt32
  end


  # Params # hwnd : LibC::HANDLE [In],pgactionid : Guid* [In],pwvtdata : Void* [In]
  fun WinVerifyTrust(hwnd : LibC::HANDLE, pgactionid : Guid*, pwvtdata : Void*) : Int32

  # Params # hwnd : LibC::HANDLE [In],pgactionid : Guid* [In],pwintrustdata : WINTRUST_DATA* [In]
  fun WinVerifyTrustEx(hwnd : LibC::HANDLE, pgactionid : Guid*, pwintrustdata : WINTRUST_DATA*) : Int32

  # Params # pdwpolicyflags : WINTRUST_POLICY_FLAGS* [In]
  fun WintrustGetRegPolicyFlags(pdwpolicyflags : WINTRUST_POLICY_FLAGS*)

  # Params # dwpolicyflags : WINTRUST_POLICY_FLAGS [In]
  fun WintrustSetRegPolicyFlags(dwpolicyflags : WINTRUST_POLICY_FLAGS) : LibC::BOOL

  # Params # pgactionid : Guid* [In],fdwflags : UInt32 [In],psprovinfo : CRYPT_REGISTER_ACTIONID* [In]
  fun WintrustAddActionID(pgactionid : Guid*, fdwflags : UInt32, psprovinfo : CRYPT_REGISTER_ACTIONID*) : LibC::BOOL

  # Params # pgactionid : Guid* [In]
  fun WintrustRemoveActionID(pgactionid : Guid*) : LibC::BOOL

  # Params # pgactionid : Guid* [In],ppfns : CRYPT_PROVIDER_FUNCTIONS* [In]
  fun WintrustLoadFunctionPointers(pgactionid : Guid*, ppfns : CRYPT_PROVIDER_FUNCTIONS*) : LibC::BOOL

  # Params # pszusageoid : PSTR [In],psdefusage : CRYPT_PROVIDER_REGDEFUSAGE* [In]
  fun WintrustAddDefaultForUsage(pszusageoid : PSTR, psdefusage : CRYPT_PROVIDER_REGDEFUSAGE*) : LibC::BOOL

  # Params # dwaction : WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION [In],pszusageoid : PSTR [In],psusage : CRYPT_PROVIDER_DEFUSAGE* [In]
  fun WintrustGetDefaultForUsage(dwaction : WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION, pszusageoid : PSTR, psusage : CRYPT_PROVIDER_DEFUSAGE*) : LibC::BOOL

  # Params # pprovdata : CRYPT_PROVIDER_DATA* [In],idxsigner : UInt32 [In],fcountersigner : LibC::BOOL [In],idxcountersigner : UInt32 [In]
  fun WTHelperGetProvSignerFromChain(pprovdata : CRYPT_PROVIDER_DATA*, idxsigner : UInt32, fcountersigner : LibC::BOOL, idxcountersigner : UInt32) : CRYPT_PROVIDER_SGNR*

  # Params # psgnr : CRYPT_PROVIDER_SGNR* [In],idxcert : UInt32 [In]
  fun WTHelperGetProvCertFromChain(psgnr : CRYPT_PROVIDER_SGNR*, idxcert : UInt32) : CRYPT_PROVIDER_CERT*

  # Params # hstatedata : LibC::HANDLE [In]
  fun WTHelperProvDataFromStateData(hstatedata : LibC::HANDLE) : CRYPT_PROVIDER_DATA*

  # Params # pprovdata : CRYPT_PROVIDER_DATA* [In],pgproviderid : Guid* [In]
  fun WTHelperGetProvPrivateDataFromChain(pprovdata : CRYPT_PROVIDER_DATA*, pgproviderid : Guid*) : CRYPT_PROVIDER_PRIVDATA*

  # Params # dwencoding : UInt32 [In],pcert : CERT_INFO* [In]
  fun WTHelperCertIsSelfSigned(dwencoding : UInt32, pcert : CERT_INFO*) : LibC::BOOL

  # Params # pprovdata : CRYPT_PROVIDER_DATA* [In]
  fun WTHelperCertCheckValidSignature(pprovdata : CRYPT_PROVIDER_DATA*) : HRESULT

  # Params # hwndparent : LibC::HANDLE [In],dwflags : UInt32 [In],pvreserved : Void** [In]
  fun OpenPersonalTrustDBDialogEx(hwndparent : LibC::HANDLE, dwflags : UInt32, pvreserved : Void**) : LibC::BOOL

  # Params # hwndparent : LibC::HANDLE [In]
  fun OpenPersonalTrustDBDialog(hwndparent : LibC::HANDLE) : LibC::BOOL

  # Params # fincludepepagehashes : LibC::BOOL [In]
  fun WintrustSetDefaultIncludePEPageHashes(fincludepepagehashes : LibC::BOOL)
end
