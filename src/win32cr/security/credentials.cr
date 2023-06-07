require "../foundation.cr"
require "../graphics/gdi.cr"
require "../ui/windowsandmessaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:keycredmgr.dll")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
@[Link(ldflags: "/DELAYLOAD:credui.dll")]
@[Link(ldflags: "/DELAYLOAD:winscard.dll")]
@[Link(ldflags: "/DELAYLOAD:scarddlg.dll")]
{% else %}
@[Link("keycredmgr")]
@[Link("advapi32")]
@[Link("credui")]
@[Link("winscard")]
@[Link("scarddlg")]
{% end %}
lib LibWin32
  FILE_DEVICE_SMARTCARD = 49_u32
  GUID_DEVINTERFACE_SMARTCARD_READER = "50dd5230-ba8a-11d1-bf5d-0000f805f530"
  SCARD_ATR_LENGTH = 33_u32
  SCARD_PROTOCOL_UNDEFINED = 0_u32
  SCARD_PROTOCOL_T0 = 1_u32
  SCARD_PROTOCOL_T1 = 2_u32
  SCARD_PROTOCOL_RAW = 65536_u32
  SCARD_PROTOCOL_DEFAULT = 2147483648_u32
  SCARD_PROTOCOL_OPTIMAL = 0_u32
  SCARD_POWER_DOWN = 0_u32
  SCARD_COLD_RESET = 1_u32
  SCARD_WARM_RESET = 2_u32
  MAXIMUM_ATTR_STRING_LENGTH = 32_u32
  MAXIMUM_SMARTCARD_READERS = 10_u32
  SCARD_CLASS_VENDOR_INFO = 1_u32
  SCARD_CLASS_COMMUNICATIONS = 2_u32
  SCARD_CLASS_PROTOCOL = 3_u32
  SCARD_CLASS_POWER_MGMT = 4_u32
  SCARD_CLASS_SECURITY = 5_u32
  SCARD_CLASS_MECHANICAL = 6_u32
  SCARD_CLASS_VENDOR_DEFINED = 7_u32
  SCARD_CLASS_IFD_PROTOCOL = 8_u32
  SCARD_CLASS_ICC_STATE = 9_u32
  SCARD_CLASS_PERF = 32766_u32
  SCARD_CLASS_SYSTEM = 32767_u32
  SCARD_T0_HEADER_LENGTH = 7_u32
  SCARD_T0_CMD_LENGTH = 5_u32
  SCARD_T1_PROLOGUE_LENGTH = 3_u32
  SCARD_T1_EPILOGUE_LENGTH = 2_u32
  SCARD_T1_EPILOGUE_LENGTH_LRC = 1_u32
  SCARD_T1_MAX_IFS = 254_u32
  SCARD_UNKNOWN = 0_u32
  SCARD_ABSENT = 1_u32
  SCARD_PRESENT = 2_u32
  SCARD_SWALLOWED = 3_u32
  SCARD_POWERED = 4_u32
  SCARD_NEGOTIABLE = 5_u32
  SCARD_SPECIFIC = 6_u32
  SCARD_READER_SWALLOWS = 1_u32
  SCARD_READER_EJECTS = 2_u32
  SCARD_READER_CONFISCATES = 4_u32
  SCARD_READER_CONTACTLESS = 8_u32
  SCARD_READER_TYPE_SERIAL = 1_u32
  SCARD_READER_TYPE_PARALELL = 2_u32
  SCARD_READER_TYPE_KEYBOARD = 4_u32
  SCARD_READER_TYPE_SCSI = 8_u32
  SCARD_READER_TYPE_IDE = 16_u32
  SCARD_READER_TYPE_USB = 32_u32
  SCARD_READER_TYPE_PCMCIA = 64_u32
  SCARD_READER_TYPE_TPM = 128_u32
  SCARD_READER_TYPE_NFC = 256_u32
  SCARD_READER_TYPE_UICC = 512_u32
  SCARD_READER_TYPE_NGC = 1024_u32
  SCARD_READER_TYPE_EMBEDDEDSE = 2048_u32
  SCARD_READER_TYPE_VENDOR = 240_u32
  STATUS_LOGON_FAILURE = -1073741715_i32
  STATUS_WRONG_PASSWORD = -1073741718_i32
  STATUS_PASSWORD_EXPIRED = -1073741711_i32
  STATUS_PASSWORD_MUST_CHANGE = -1073741276_i32
  STATUS_ACCESS_DENIED = -1073741790_i32
  STATUS_DOWNGRADE_DETECTED = -1073740920_i32
  STATUS_AUTHENTICATION_FIREWALL_FAILED = -1073740781_i32
  STATUS_ACCOUNT_DISABLED = -1073741710_i32
  STATUS_ACCOUNT_RESTRICTION = -1073741714_i32
  STATUS_ACCOUNT_LOCKED_OUT = -1073741260_i32
  STATUS_ACCOUNT_EXPIRED = -1073741421_i32
  STATUS_LOGON_TYPE_NOT_GRANTED = -1073741477_i32
  STATUS_NO_SUCH_LOGON_SESSION = -1073741729_i32
  STATUS_NO_SUCH_USER = -1073741724_i32
  CRED_MAX_STRING_LENGTH = 256_u32
  CRED_MAX_GENERIC_TARGET_NAME_LENGTH = 32767_u32
  CRED_MAX_TARGETNAME_NAMESPACE_LENGTH = 256_u32
  CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH = 256_u32
  CRED_MAX_VALUE_SIZE = 256_u32
  CRED_MAX_ATTRIBUTES = 64_u32
  CRED_LOGON_TYPES_MASK = 61440_u32
  CRED_TI_SERVER_FORMAT_UNKNOWN = 1_u32
  CRED_TI_DOMAIN_FORMAT_UNKNOWN = 2_u32
  CRED_TI_ONLY_PASSWORD_REQUIRED = 4_u32
  CRED_TI_USERNAME_TARGET = 8_u32
  CRED_TI_CREATE_EXPLICIT_CRED = 16_u32
  CRED_TI_WORKGROUP_MEMBER = 32_u32
  CRED_TI_DNSTREE_IS_DFS_SERVER = 64_u32
  CRED_TI_VALID_FLAGS = 61567_u32
  CERT_HASH_LENGTH = 20_u32
  CREDUI_MAX_MESSAGE_LENGTH = 1024_u32
  CREDUI_MAX_CAPTION_LENGTH = 128_u32
  CREDUI_MAX_GENERIC_TARGET_LENGTH = 32767_u32
  CREDUIWIN_IGNORE_CLOUDAUTHORITY_NAME = 262144_u32
  CREDUIWIN_DOWNLEVEL_HELLO_AS_SMART_CARD = 2147483648_u32
  CRED_PRESERVE_CREDENTIAL_BLOB = 1_u32
  CRED_CACHE_TARGET_INFORMATION = 1_u32
  CRED_ALLOW_NAME_RESOLUTION = 1_u32
  CRED_PROTECT_AS_SELF = 1_u32
  CRED_PROTECT_TO_SYSTEM = 2_u32
  CRED_UNPROTECT_AS_SELF = 1_u32
  CRED_UNPROTECT_ALLOW_TO_SYSTEM = 2_u32
  SCARD_SCOPE_TERMINAL = 1_u32
  SCARD_PROVIDER_PRIMARY = 1_u32
  SCARD_PROVIDER_CSP = 2_u32
  SCARD_PROVIDER_KSP = 3_u32
  SCARD_STATE_UNPOWERED = 1024_u32
  SCARD_SHARE_EXCLUSIVE = 1_u32
  SCARD_SHARE_SHARED = 2_u32
  SCARD_SHARE_DIRECT = 3_u32
  SCARD_LEAVE_CARD = 0_u32
  SCARD_RESET_CARD = 1_u32
  SCARD_UNPOWER_CARD = 2_u32
  SCARD_EJECT_CARD = 3_u32
  SC_DLG_MINIMAL_UI = 1_u32
  SC_DLG_NO_UI = 2_u32
  SC_DLG_FORCE_UI = 4_u32
  SCERR_NOCARDNAME = 16384_u32
  SCERR_NOGUIDS = 32768_u32
  SCARD_AUDIT_CHV_FAILURE = 0_u32
  SCARD_AUDIT_CHV_SUCCESS = 1_u32
  CREDSSP_SERVER_AUTH_NEGOTIATE = 1_u32
  CREDSSP_SERVER_AUTH_CERTIFICATE = 2_u32
  CREDSSP_SERVER_AUTH_LOOPBACK = 4_u32
  SECPKG_ALT_ATTR = 2147483648_u32
  SECPKG_ATTR_C_FULL_IDENT_TOKEN = 2147483781_u32
  CREDSSP_CRED_EX_VERSION = 0_u32
  CREDSSP_FLAG_REDIRECT = 1_u32

  alias LPOCNCONNPROCA = Proc(LibC::UINT_PTR, PSTR, PSTR, Void*, LibC::UINT_PTR)
  alias LPOCNCONNPROCW = Proc(LibC::UINT_PTR, LibC::LPWSTR, LibC::LPWSTR, Void*, LibC::UINT_PTR)
  alias LPOCNCHKPROC = Proc(LibC::UINT_PTR, LibC::UINT_PTR, Void*, LibC::BOOL)
  alias LPOCNDSCPROC = Proc(LibC::UINT_PTR, LibC::UINT_PTR, Void*, Void)


  enum CRED_FLAGS : UInt32
    CRED_FLAGS_PASSWORD_FOR_CERT = 1
    CRED_FLAGS_PROMPT_NOW = 2
    CRED_FLAGS_USERNAME_TARGET = 4
    CRED_FLAGS_OWF_CRED_BLOB = 8
    CRED_FLAGS_REQUIRE_CONFIRMATION = 16
    CRED_FLAGS_WILDCARD_MATCH = 32
    CRED_FLAGS_VSM_PROTECTED = 64
    CRED_FLAGS_NGC_CERT = 128
    CRED_FLAGS_VALID_FLAGS = 61695
    CRED_FLAGS_VALID_INPUT_FLAGS = 61599
  end

  enum CRED_TYPE : UInt32
    CRED_TYPE_GENERIC = 1
    CRED_TYPE_DOMAIN_PASSWORD = 2
    CRED_TYPE_DOMAIN_CERTIFICATE = 3
    CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 4
    CRED_TYPE_GENERIC_CERTIFICATE = 5
    CRED_TYPE_DOMAIN_EXTENDED = 6
    CRED_TYPE_MAXIMUM = 7
    CRED_TYPE_MAXIMUM_EX = 1007
  end

  enum CRED_PERSIST : UInt32
    CRED_PERSIST_NONE = 0
    CRED_PERSIST_SESSION = 1
    CRED_PERSIST_LOCAL_MACHINE = 2
    CRED_PERSIST_ENTERPRISE = 3
  end

  enum CREDUI_FLAGS : UInt32
    CREDUI_FLAGS_ALWAYS_SHOW_UI = 128
    CREDUI_FLAGS_COMPLETE_USERNAME = 2048
    CREDUI_FLAGS_DO_NOT_PERSIST = 2
    CREDUI_FLAGS_EXCLUDE_CERTIFICATES = 8
    CREDUI_FLAGS_EXPECT_CONFIRMATION = 131072
    CREDUI_FLAGS_GENERIC_CREDENTIALS = 262144
    CREDUI_FLAGS_INCORRECT_PASSWORD = 1
    CREDUI_FLAGS_KEEP_USERNAME = 1048576
    CREDUI_FLAGS_PASSWORD_ONLY_OK = 512
    CREDUI_FLAGS_PERSIST = 4096
    CREDUI_FLAGS_REQUEST_ADMINISTRATOR = 4
    CREDUI_FLAGS_REQUIRE_CERTIFICATE = 16
    CREDUI_FLAGS_REQUIRE_SMARTCARD = 256
    CREDUI_FLAGS_SERVER_CREDENTIAL = 16384
    CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX = 64
    CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS = 524288
    CREDUI_FLAGS_VALIDATE_USERNAME = 1024
  end

  enum SCARD_SCOPE : UInt32
    SCARD_SCOPE_USER = 0
    SCARD_SCOPE_SYSTEM = 2
  end

  enum CRED_ENUMERATE_FLAGS : UInt32
    CRED_ENUMERATE_ALL_CREDENTIALS = 1
  end

  enum CREDUIWIN_FLAGS : UInt32
    CREDUIWIN_GENERIC = 1
    CREDUIWIN_CHECKBOX = 2
    CREDUIWIN_AUTHPACKAGE_ONLY = 16
    CREDUIWIN_IN_CRED_ONLY = 32
    CREDUIWIN_ENUMERATE_ADMINS = 256
    CREDUIWIN_ENUMERATE_CURRENT_USER = 512
    CREDUIWIN_SECURE_PROMPT = 4096
    CREDUIWIN_PREPROMPTING = 8192
    CREDUIWIN_PACK_32_WOW = 268435456
  end

  enum SCARD_STATE : UInt32
    SCARD_STATE_UNAWARE = 0
    SCARD_STATE_IGNORE = 1
    SCARD_STATE_UNAVAILABLE = 8
    SCARD_STATE_EMPTY = 16
    SCARD_STATE_PRESENT = 32
    SCARD_STATE_ATRMATCH = 64
    SCARD_STATE_EXCLUSIVE = 128
    SCARD_STATE_INUSE = 256
    SCARD_STATE_MUTE = 512
    SCARD_STATE_CHANGED = 2
    SCARD_STATE_UNKNOWN = 4
  end

  enum CRED_PACK_FLAGS : UInt32
    CRED_PACK_PROTECTED_CREDENTIALS = 1
    CRED_PACK_WOW_BUFFER = 2
    CRED_PACK_GENERIC_CREDENTIALS = 4
    CRED_PACK_ID_PROVIDER_CREDENTIALS = 8
  end

  enum KeyCredentialManagerOperationErrorStates : UInt32
    KeyCredentialManagerOperationErrorStateNone = 0
    KeyCredentialManagerOperationErrorStateDeviceJoinFailure = 1
    KeyCredentialManagerOperationErrorStateTokenFailure = 2
    KeyCredentialManagerOperationErrorStateCertificateFailure = 4
    KeyCredentialManagerOperationErrorStateRemoteSessionFailure = 8
    KeyCredentialManagerOperationErrorStatePolicyFailure = 16
    KeyCredentialManagerOperationErrorStateHardwareFailure = 32
    KeyCredentialManagerOperationErrorStatePinExistsFailure = 64
  end

  enum KeyCredentialManagerOperationType : Int32
    KeyCredentialManagerProvisioning = 0
    KeyCredentialManagerPinChange = 1
    KeyCredentialManagerPinReset = 2
  end

  enum CRED_MARSHAL_TYPE : Int32
    CertCredential = 1
    UsernameTargetCredential = 2
    BinaryBlobCredential = 3
    UsernameForPackedCredentials = 4
    BinaryBlobForSystem = 5
  end

  enum CRED_PROTECTION_TYPE : Int32
    CredUnprotected = 0
    CredUserProtection = 1
    CredTrustedProtection = 2
    CredForSystemProtection = 3
  end

  enum READER_SEL_REQUEST_MATCH_TYPE : Int32
    RSR_MATCH_TYPE_READER_AND_CONTAINER = 1
    RSR_MATCH_TYPE_SERIAL_NUMBER = 2
    RSR_MATCH_TYPE_ALL_CARDS = 3
  end

  enum CREDSPP_SUBMIT_TYPE : Int32
    CredsspPasswordCreds = 2
    CredsspSchannelCreds = 4
    CredsspCertificateCreds = 13
    CredsspSubmitBufferBoth = 50
    CredsspSubmitBufferBothOld = 51
    CredsspCredEx = 100
  end

  union SCARD_T0_REQUEST_Anonymous_e__Union
    cmd_bytes : SCARD_T0_COMMAND
    rgb_header : UInt8[5]*
  end
  union READER_SEL_REQUEST_Anonymous_e__Union
    reader_and_container_parameter : READER_SEL_REQUEST_Anonymous_e__Union_ReaderAndContainerParameter_e__Struct
    serial_number_parameter : READER_SEL_REQUEST_Anonymous_e__Union_SerialNumberParameter_e__Struct
  end

  struct KeyCredentialManagerInfo
    container_id : Guid
  end
  struct SecHandle
    dw_lower : LibC::UINT_PTR
    dw_upper : LibC::UINT_PTR
  end
  struct CREDENTIAL_ATTRIBUTEA
    keyword : PSTR
    flags : UInt32
    value_size : UInt32
    value : UInt8*
  end
  struct CREDENTIAL_ATTRIBUTEW
    keyword : LibC::LPWSTR
    flags : UInt32
    value_size : UInt32
    value : UInt8*
  end
  struct CREDENTIALA
    flags : CRED_FLAGS
    type : CRED_TYPE
    target_name : PSTR
    comment : PSTR
    last_written : FILETIME
    credential_blob_size : UInt32
    credential_blob : UInt8*
    persist : CRED_PERSIST
    attribute_count : UInt32
    attributes : CREDENTIAL_ATTRIBUTEA*
    target_alias : PSTR
    user_name : PSTR
  end
  struct CREDENTIALW
    flags : CRED_FLAGS
    type : CRED_TYPE
    target_name : LibC::LPWSTR
    comment : LibC::LPWSTR
    last_written : FILETIME
    credential_blob_size : UInt32
    credential_blob : UInt8*
    persist : CRED_PERSIST
    attribute_count : UInt32
    attributes : CREDENTIAL_ATTRIBUTEW*
    target_alias : LibC::LPWSTR
    user_name : LibC::LPWSTR
  end
  struct CREDENTIAL_TARGET_INFORMATIONA
    target_name : PSTR
    netbios_server_name : PSTR
    dns_server_name : PSTR
    netbios_domain_name : PSTR
    dns_domain_name : PSTR
    dns_tree_name : PSTR
    package_name : PSTR
    flags : UInt32
    cred_type_count : UInt32
    cred_types : UInt32*
  end
  struct CREDENTIAL_TARGET_INFORMATIONW
    target_name : LibC::LPWSTR
    netbios_server_name : LibC::LPWSTR
    dns_server_name : LibC::LPWSTR
    netbios_domain_name : LibC::LPWSTR
    dns_domain_name : LibC::LPWSTR
    dns_tree_name : LibC::LPWSTR
    package_name : LibC::LPWSTR
    flags : UInt32
    cred_type_count : UInt32
    cred_types : UInt32*
  end
  struct CERT_CREDENTIAL_INFO
    cb_size : UInt32
    rgb_hash_of_cert : UInt8[20]*
  end
  struct USERNAME_TARGET_CREDENTIAL_INFO
    user_name : LibC::LPWSTR
  end
  struct BINARY_BLOB_CREDENTIAL_INFO
    cb_blob : UInt32
    pb_blob : UInt8*
  end
  struct CREDUI_INFOA
    cb_size : UInt32
    hwnd_parent : HANDLE
    psz_message_text : PSTR
    psz_caption_text : PSTR
    hbm_banner : HBITMAP
  end
  struct CREDUI_INFOW
    cb_size : UInt32
    hwnd_parent : HANDLE
    psz_message_text : LibC::LPWSTR
    psz_caption_text : LibC::LPWSTR
    hbm_banner : HBITMAP
  end
  struct SCARD_IO_REQUEST
    dw_protocol : UInt32
    cb_pci_length : UInt32
  end
  struct SCARD_T0_COMMAND
    b_cla : UInt8
    b_ins : UInt8
    b_p1 : UInt8
    b_p2 : UInt8
    b_p3 : UInt8
  end
  struct SCARD_T0_REQUEST
    io_request : SCARD_IO_REQUEST
    b_sw1 : UInt8
    b_sw2 : UInt8
    anonymous : SCARD_T0_REQUEST_Anonymous_e__Union
  end
  struct SCARD_T1_REQUEST
    io_request : SCARD_IO_REQUEST
  end
  struct SCARD_READERSTATEA
    sz_reader : PSTR
    pv_user_data : Void*
    dw_current_state : SCARD_STATE
    dw_event_state : SCARD_STATE
    cb_atr : UInt32
    rgb_atr : UInt8[36]*
  end
  struct SCARD_READERSTATEW
    sz_reader : LibC::LPWSTR
    pv_user_data : Void*
    dw_current_state : SCARD_STATE
    dw_event_state : SCARD_STATE
    cb_atr : UInt32
    rgb_atr : UInt8[36]*
  end
  struct SCARD_ATRMASK
    cb_atr : UInt32
    rgb_atr : UInt8[36]*
    rgb_mask : UInt8[36]*
  end
  struct OPENCARD_SEARCH_CRITERIAA
    dw_struct_size : UInt32
    lpstr_group_names : PSTR
    n_max_group_names : UInt32
    rgguid_interfaces : Guid*
    cguid_interfaces : UInt32
    lpstr_card_names : PSTR
    n_max_card_names : UInt32
    lpfn_check : LPOCNCHKPROC
    lpfn_connect : LPOCNCONNPROCA
    lpfn_disconnect : LPOCNDSCPROC
    pv_user_data : Void*
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
  end
  struct OPENCARD_SEARCH_CRITERIAW
    dw_struct_size : UInt32
    lpstr_group_names : LibC::LPWSTR
    n_max_group_names : UInt32
    rgguid_interfaces : Guid*
    cguid_interfaces : UInt32
    lpstr_card_names : LibC::LPWSTR
    n_max_card_names : UInt32
    lpfn_check : LPOCNCHKPROC
    lpfn_connect : LPOCNCONNPROCW
    lpfn_disconnect : LPOCNDSCPROC
    pv_user_data : Void*
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
  end
  struct OPENCARDNAME_EXA
    dw_struct_size : UInt32
    h_s_card_context : LibC::UINT_PTR
    hwnd_owner : HANDLE
    dw_flags : UInt32
    lpstr_title : PSTR
    lpstr_search_desc : PSTR
    h_icon : HANDLE
    p_open_card_search_criteria : OPENCARD_SEARCH_CRITERIAA*
    lpfn_connect : LPOCNCONNPROCA
    pv_user_data : Void*
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
    lpstr_rdr : PSTR
    n_max_rdr : UInt32
    lpstr_card : PSTR
    n_max_card : UInt32
    dw_active_protocol : UInt32
    h_card_handle : LibC::UINT_PTR
  end
  struct OPENCARDNAME_EXW
    dw_struct_size : UInt32
    h_s_card_context : LibC::UINT_PTR
    hwnd_owner : HANDLE
    dw_flags : UInt32
    lpstr_title : LibC::LPWSTR
    lpstr_search_desc : LibC::LPWSTR
    h_icon : HANDLE
    p_open_card_search_criteria : OPENCARD_SEARCH_CRITERIAW*
    lpfn_connect : LPOCNCONNPROCW
    pv_user_data : Void*
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
    lpstr_rdr : LibC::LPWSTR
    n_max_rdr : UInt32
    lpstr_card : LibC::LPWSTR
    n_max_card : UInt32
    dw_active_protocol : UInt32
    h_card_handle : LibC::UINT_PTR
  end
  struct READER_SEL_REQUEST
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
    match_type : READER_SEL_REQUEST_MATCH_TYPE
    anonymous : READER_SEL_REQUEST_Anonymous_e__Union
  end
  struct READER_SEL_REQUEST_Anonymous_e__Union_ReaderAndContainerParameter_e__Struct
    cb_reader_name_offset : UInt32
    cch_reader_name_length : UInt32
    cb_container_name_offset : UInt32
    cch_container_name_length : UInt32
    dw_desired_card_module_version : UInt32
    dw_csp_flags : UInt32
  end
  struct READER_SEL_REQUEST_Anonymous_e__Union_SerialNumberParameter_e__Struct
    cb_serial_number_offset : UInt32
    cb_serial_number_length : UInt32
    dw_desired_card_module_version : UInt32
  end
  struct READER_SEL_RESPONSE
    cb_reader_name_offset : UInt32
    cch_reader_name_length : UInt32
    cb_card_name_offset : UInt32
    cch_card_name_length : UInt32
  end
  struct OPENCARDNAMEA
    dw_struct_size : UInt32
    hwnd_owner : HANDLE
    h_s_card_context : LibC::UINT_PTR
    lpstr_group_names : PSTR
    n_max_group_names : UInt32
    lpstr_card_names : PSTR
    n_max_card_names : UInt32
    rgguid_interfaces : Guid*
    cguid_interfaces : UInt32
    lpstr_rdr : PSTR
    n_max_rdr : UInt32
    lpstr_card : PSTR
    n_max_card : UInt32
    lpstr_title : PSTR
    dw_flags : UInt32
    pv_user_data : Void*
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
    dw_active_protocol : UInt32
    lpfn_connect : LPOCNCONNPROCA
    lpfn_check : LPOCNCHKPROC
    lpfn_disconnect : LPOCNDSCPROC
    h_card_handle : LibC::UINT_PTR
  end
  struct OPENCARDNAMEW
    dw_struct_size : UInt32
    hwnd_owner : HANDLE
    h_s_card_context : LibC::UINT_PTR
    lpstr_group_names : LibC::LPWSTR
    n_max_group_names : UInt32
    lpstr_card_names : LibC::LPWSTR
    n_max_card_names : UInt32
    rgguid_interfaces : Guid*
    cguid_interfaces : UInt32
    lpstr_rdr : LibC::LPWSTR
    n_max_rdr : UInt32
    lpstr_card : LibC::LPWSTR
    n_max_card : UInt32
    lpstr_title : LibC::LPWSTR
    dw_flags : UInt32
    pv_user_data : Void*
    dw_share_mode : UInt32
    dw_preferred_protocols : UInt32
    dw_active_protocol : UInt32
    lpfn_connect : LPOCNCONNPROCW
    lpfn_check : LPOCNCHKPROC
    lpfn_disconnect : LPOCNDSCPROC
    h_card_handle : LibC::UINT_PTR
  end
  struct SecPkgContext_ClientCreds
    auth_buffer_len : UInt32
    auth_buffer : UInt8*
  end
  struct CREDSSP_CRED
    type : CREDSPP_SUBMIT_TYPE
    p_schannel_cred : Void*
    p_spnego_cred : Void*
  end
  struct CREDSSP_CRED_EX
    type : CREDSPP_SUBMIT_TYPE
    version : UInt32
    flags : UInt32
    reserved : UInt32
    cred : CREDSSP_CRED
  end


  # Params # keycredentialmanageroperationtype : KeyCredentialManagerOperationType [In],isready : LibC::BOOL* [In],keycredentialmanageroperationerrorstates : KeyCredentialManagerOperationErrorStates* [In]
  fun KeyCredentialManagerGetOperationErrorStates(keycredentialmanageroperationtype : KeyCredentialManagerOperationType, isready : LibC::BOOL*, keycredentialmanageroperationerrorstates : KeyCredentialManagerOperationErrorStates*) : HRESULT

  # Params # hwndowner : LibC::HANDLE [In],keycredentialmanageroperationtype : KeyCredentialManagerOperationType [In]
  fun KeyCredentialManagerShowUIOperation(hwndowner : LibC::HANDLE, keycredentialmanageroperationtype : KeyCredentialManagerOperationType) : HRESULT

  # Params # keycredentialmanagerinfo : KeyCredentialManagerInfo** [In]
  fun KeyCredentialManagerGetInformation(keycredentialmanagerinfo : KeyCredentialManagerInfo**) : HRESULT

  # Params # keycredentialmanagerinfo : KeyCredentialManagerInfo* [In]
  fun KeyCredentialManagerFreeInformation(keycredentialmanagerinfo : KeyCredentialManagerInfo*)

  # Params # credential : CREDENTIALW* [In],flags : UInt32 [In]
  fun CredWriteW(credential : CREDENTIALW*, flags : UInt32) : LibC::BOOL

  # Params # credential : CREDENTIALA* [In],flags : UInt32 [In]
  fun CredWriteA(credential : CREDENTIALA*, flags : UInt32) : LibC::BOOL

  # Params # targetname : LibC::LPWSTR [In],type : UInt32 [In],flags : UInt32 [In],credential : CREDENTIALW** [In]
  fun CredReadW(targetname : LibC::LPWSTR, type : UInt32, flags : UInt32, credential : CREDENTIALW**) : LibC::BOOL

  # Params # targetname : PSTR [In],type : UInt32 [In],flags : UInt32 [In],credential : CREDENTIALA** [In]
  fun CredReadA(targetname : PSTR, type : UInt32, flags : UInt32, credential : CREDENTIALA**) : LibC::BOOL

  # Params # filter : LibC::LPWSTR [In],flags : CRED_ENUMERATE_FLAGS [In],count : UInt32* [In],credential : CREDENTIALW*** [In]
  fun CredEnumerateW(filter : LibC::LPWSTR, flags : CRED_ENUMERATE_FLAGS, count : UInt32*, credential : CREDENTIALW***) : LibC::BOOL

  # Params # filter : PSTR [In],flags : CRED_ENUMERATE_FLAGS [In],count : UInt32* [In],credential : CREDENTIALA*** [In]
  fun CredEnumerateA(filter : PSTR, flags : CRED_ENUMERATE_FLAGS, count : UInt32*, credential : CREDENTIALA***) : LibC::BOOL

  # Params # targetinfo : CREDENTIAL_TARGET_INFORMATIONW* [In],credential : CREDENTIALW* [In],flags : UInt32 [In]
  fun CredWriteDomainCredentialsW(targetinfo : CREDENTIAL_TARGET_INFORMATIONW*, credential : CREDENTIALW*, flags : UInt32) : LibC::BOOL

  # Params # targetinfo : CREDENTIAL_TARGET_INFORMATIONA* [In],credential : CREDENTIALA* [In],flags : UInt32 [In]
  fun CredWriteDomainCredentialsA(targetinfo : CREDENTIAL_TARGET_INFORMATIONA*, credential : CREDENTIALA*, flags : UInt32) : LibC::BOOL

  # Params # targetinfo : CREDENTIAL_TARGET_INFORMATIONW* [In],flags : UInt32 [In],count : UInt32* [In],credential : CREDENTIALW*** [In]
  fun CredReadDomainCredentialsW(targetinfo : CREDENTIAL_TARGET_INFORMATIONW*, flags : UInt32, count : UInt32*, credential : CREDENTIALW***) : LibC::BOOL

  # Params # targetinfo : CREDENTIAL_TARGET_INFORMATIONA* [In],flags : UInt32 [In],count : UInt32* [In],credential : CREDENTIALA*** [In]
  fun CredReadDomainCredentialsA(targetinfo : CREDENTIAL_TARGET_INFORMATIONA*, flags : UInt32, count : UInt32*, credential : CREDENTIALA***) : LibC::BOOL

  # Params # targetname : LibC::LPWSTR [In],type : UInt32 [In],flags : UInt32 [In]
  fun CredDeleteW(targetname : LibC::LPWSTR, type : UInt32, flags : UInt32) : LibC::BOOL

  # Params # targetname : PSTR [In],type : UInt32 [In],flags : UInt32 [In]
  fun CredDeleteA(targetname : PSTR, type : UInt32, flags : UInt32) : LibC::BOOL

  # Params # oldtargetname : LibC::LPWSTR [In],newtargetname : LibC::LPWSTR [In],type : UInt32 [In],flags : UInt32 [In]
  fun CredRenameW(oldtargetname : LibC::LPWSTR, newtargetname : LibC::LPWSTR, type : UInt32, flags : UInt32) : LibC::BOOL

  # Params # oldtargetname : PSTR [In],newtargetname : PSTR [In],type : UInt32 [In],flags : UInt32 [In]
  fun CredRenameA(oldtargetname : PSTR, newtargetname : PSTR, type : UInt32, flags : UInt32) : LibC::BOOL

  # Params # targetname : LibC::LPWSTR [In],flags : UInt32 [In],targetinfo : CREDENTIAL_TARGET_INFORMATIONW** [In]
  fun CredGetTargetInfoW(targetname : LibC::LPWSTR, flags : UInt32, targetinfo : CREDENTIAL_TARGET_INFORMATIONW**) : LibC::BOOL

  # Params # targetname : PSTR [In],flags : UInt32 [In],targetinfo : CREDENTIAL_TARGET_INFORMATIONA** [In]
  fun CredGetTargetInfoA(targetname : PSTR, flags : UInt32, targetinfo : CREDENTIAL_TARGET_INFORMATIONA**) : LibC::BOOL

  # Params # credtype : CRED_MARSHAL_TYPE [In],credential : Void* [In],marshaledcredential : LibC::LPWSTR* [In]
  fun CredMarshalCredentialW(credtype : CRED_MARSHAL_TYPE, credential : Void*, marshaledcredential : LibC::LPWSTR*) : LibC::BOOL

  # Params # credtype : CRED_MARSHAL_TYPE [In],credential : Void* [In],marshaledcredential : PSTR* [In]
  fun CredMarshalCredentialA(credtype : CRED_MARSHAL_TYPE, credential : Void*, marshaledcredential : PSTR*) : LibC::BOOL

  # Params # marshaledcredential : LibC::LPWSTR [In],credtype : CRED_MARSHAL_TYPE* [In],credential : Void** [In]
  fun CredUnmarshalCredentialW(marshaledcredential : LibC::LPWSTR, credtype : CRED_MARSHAL_TYPE*, credential : Void**) : LibC::BOOL

  # Params # marshaledcredential : PSTR [In],credtype : CRED_MARSHAL_TYPE* [In],credential : Void** [In]
  fun CredUnmarshalCredentialA(marshaledcredential : PSTR, credtype : CRED_MARSHAL_TYPE*, credential : Void**) : LibC::BOOL

  # Params # marshaledcredential : LibC::LPWSTR [In]
  fun CredIsMarshaledCredentialW(marshaledcredential : LibC::LPWSTR) : LibC::BOOL

  # Params # marshaledcredential : PSTR [In]
  fun CredIsMarshaledCredentialA(marshaledcredential : PSTR) : LibC::BOOL

  # Params # dwflags : CRED_PACK_FLAGS [In],pauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],pszusername : Char* [In],pcchmaxusername : UInt32* [In],pszdomainname : Char* [In],pcchmaxdomainname : UInt32* [In],pszpassword : Char* [In],pcchmaxpassword : UInt32* [In]
  fun CredUnPackAuthenticationBufferW(dwflags : CRED_PACK_FLAGS, pauthbuffer : Void*, cbauthbuffer : UInt32, pszusername : Char*, pcchmaxusername : UInt32*, pszdomainname : Char*, pcchmaxdomainname : UInt32*, pszpassword : Char*, pcchmaxpassword : UInt32*) : LibC::BOOL

  # Params # dwflags : CRED_PACK_FLAGS [In],pauthbuffer : Void* [In],cbauthbuffer : UInt32 [In],pszusername : UInt8* [In],pcchlmaxusername : UInt32* [In],pszdomainname : UInt8* [In],pcchmaxdomainname : UInt32* [In],pszpassword : UInt8* [In],pcchmaxpassword : UInt32* [In]
  fun CredUnPackAuthenticationBufferA(dwflags : CRED_PACK_FLAGS, pauthbuffer : Void*, cbauthbuffer : UInt32, pszusername : UInt8*, pcchlmaxusername : UInt32*, pszdomainname : UInt8*, pcchmaxdomainname : UInt32*, pszpassword : UInt8*, pcchmaxpassword : UInt32*) : LibC::BOOL

  # Params # dwflags : CRED_PACK_FLAGS [In],pszusername : LibC::LPWSTR [In],pszpassword : LibC::LPWSTR [In],ppackedcredentials : UInt8* [In],pcbpackedcredentials : UInt32* [In]
  fun CredPackAuthenticationBufferW(dwflags : CRED_PACK_FLAGS, pszusername : LibC::LPWSTR, pszpassword : LibC::LPWSTR, ppackedcredentials : UInt8*, pcbpackedcredentials : UInt32*) : LibC::BOOL

  # Params # dwflags : CRED_PACK_FLAGS [In],pszusername : PSTR [In],pszpassword : PSTR [In],ppackedcredentials : UInt8* [In],pcbpackedcredentials : UInt32* [In]
  fun CredPackAuthenticationBufferA(dwflags : CRED_PACK_FLAGS, pszusername : PSTR, pszpassword : PSTR, ppackedcredentials : UInt8*, pcbpackedcredentials : UInt32*) : LibC::BOOL

  # Params # fasself : LibC::BOOL [In],pszcredentials : Char* [In],cchcredentials : UInt32 [In],pszprotectedcredentials : Char* [In],pcchmaxchars : UInt32* [In],protectiontype : CRED_PROTECTION_TYPE* [In]
  fun CredProtectW(fasself : LibC::BOOL, pszcredentials : Char*, cchcredentials : UInt32, pszprotectedcredentials : Char*, pcchmaxchars : UInt32*, protectiontype : CRED_PROTECTION_TYPE*) : LibC::BOOL

  # Params # fasself : LibC::BOOL [In],pszcredentials : UInt8* [In],cchcredentials : UInt32 [In],pszprotectedcredentials : UInt8* [In],pcchmaxchars : UInt32* [In],protectiontype : CRED_PROTECTION_TYPE* [In]
  fun CredProtectA(fasself : LibC::BOOL, pszcredentials : UInt8*, cchcredentials : UInt32, pszprotectedcredentials : UInt8*, pcchmaxchars : UInt32*, protectiontype : CRED_PROTECTION_TYPE*) : LibC::BOOL

  # Params # fasself : LibC::BOOL [In],pszprotectedcredentials : Char* [In],cchprotectedcredentials : UInt32 [In],pszcredentials : Char* [In],pcchmaxchars : UInt32* [In]
  fun CredUnprotectW(fasself : LibC::BOOL, pszprotectedcredentials : Char*, cchprotectedcredentials : UInt32, pszcredentials : Char*, pcchmaxchars : UInt32*) : LibC::BOOL

  # Params # fasself : LibC::BOOL [In],pszprotectedcredentials : UInt8* [In],cchprotectedcredentials : UInt32 [In],pszcredentials : UInt8* [In],pcchmaxchars : UInt32* [In]
  fun CredUnprotectA(fasself : LibC::BOOL, pszprotectedcredentials : UInt8*, cchprotectedcredentials : UInt32, pszcredentials : UInt8*, pcchmaxchars : UInt32*) : LibC::BOOL

  # Params # pszprotectedcredentials : LibC::LPWSTR [In],pprotectiontype : CRED_PROTECTION_TYPE* [In]
  fun CredIsProtectedW(pszprotectedcredentials : LibC::LPWSTR, pprotectiontype : CRED_PROTECTION_TYPE*) : LibC::BOOL

  # Params # pszprotectedcredentials : PSTR [In],pprotectiontype : CRED_PROTECTION_TYPE* [In]
  fun CredIsProtectedA(pszprotectedcredentials : PSTR, pprotectiontype : CRED_PROTECTION_TYPE*) : LibC::BOOL

  # Params # targetname : LibC::LPWSTR [In],type : UInt32 [In],flags : UInt32 [In],credential : CREDENTIALW** [In]
  fun CredFindBestCredentialW(targetname : LibC::LPWSTR, type : UInt32, flags : UInt32, credential : CREDENTIALW**) : LibC::BOOL

  # Params # targetname : PSTR [In],type : UInt32 [In],flags : UInt32 [In],credential : CREDENTIALA** [In]
  fun CredFindBestCredentialA(targetname : PSTR, type : UInt32, flags : UInt32, credential : CREDENTIALA**) : LibC::BOOL

  # Params # maximumpersistcount : UInt32 [In],maximumpersist : UInt32* [In]
  fun CredGetSessionTypes(maximumpersistcount : UInt32, maximumpersist : UInt32*) : LibC::BOOL

  # Params # buffer : Void* [In]
  fun CredFree(buffer : Void*)

  # Params # puiinfo : CREDUI_INFOW* [In],psztargetname : LibC::LPWSTR [In],pcontext : SecHandle* [In],dwautherror : UInt32 [In],pszusername : Char* [In],ulusernamebuffersize : UInt32 [In],pszpassword : Char* [In],ulpasswordbuffersize : UInt32 [In],save : LibC::BOOL* [In],dwflags : CREDUI_FLAGS [In]
  fun CredUIPromptForCredentialsW(puiinfo : CREDUI_INFOW*, psztargetname : LibC::LPWSTR, pcontext : SecHandle*, dwautherror : UInt32, pszusername : Char*, ulusernamebuffersize : UInt32, pszpassword : Char*, ulpasswordbuffersize : UInt32, save : LibC::BOOL*, dwflags : CREDUI_FLAGS) : UInt32

  # Params # puiinfo : CREDUI_INFOA* [In],psztargetname : PSTR [In],pcontext : SecHandle* [In],dwautherror : UInt32 [In],pszusername : UInt8* [In],ulusernamebuffersize : UInt32 [In],pszpassword : UInt8* [In],ulpasswordbuffersize : UInt32 [In],save : LibC::BOOL* [In],dwflags : CREDUI_FLAGS [In]
  fun CredUIPromptForCredentialsA(puiinfo : CREDUI_INFOA*, psztargetname : PSTR, pcontext : SecHandle*, dwautherror : UInt32, pszusername : UInt8*, ulusernamebuffersize : UInt32, pszpassword : UInt8*, ulpasswordbuffersize : UInt32, save : LibC::BOOL*, dwflags : CREDUI_FLAGS) : UInt32

  # Params # puiinfo : CREDUI_INFOW* [In],dwautherror : UInt32 [In],pulauthpackage : UInt32* [In],pvinauthbuffer : Void* [In],ulinauthbuffersize : UInt32 [In],ppvoutauthbuffer : Void** [In],puloutauthbuffersize : UInt32* [In],pfsave : LibC::BOOL* [In],dwflags : CREDUIWIN_FLAGS [In]
  fun CredUIPromptForWindowsCredentialsW(puiinfo : CREDUI_INFOW*, dwautherror : UInt32, pulauthpackage : UInt32*, pvinauthbuffer : Void*, ulinauthbuffersize : UInt32, ppvoutauthbuffer : Void**, puloutauthbuffersize : UInt32*, pfsave : LibC::BOOL*, dwflags : CREDUIWIN_FLAGS) : UInt32

  # Params # puiinfo : CREDUI_INFOA* [In],dwautherror : UInt32 [In],pulauthpackage : UInt32* [In],pvinauthbuffer : Void* [In],ulinauthbuffersize : UInt32 [In],ppvoutauthbuffer : Void** [In],puloutauthbuffersize : UInt32* [In],pfsave : LibC::BOOL* [In],dwflags : CREDUIWIN_FLAGS [In]
  fun CredUIPromptForWindowsCredentialsA(puiinfo : CREDUI_INFOA*, dwautherror : UInt32, pulauthpackage : UInt32*, pvinauthbuffer : Void*, ulinauthbuffersize : UInt32, ppvoutauthbuffer : Void**, puloutauthbuffersize : UInt32*, pfsave : LibC::BOOL*, dwflags : CREDUIWIN_FLAGS) : UInt32

  # Params # username : LibC::LPWSTR [In],user : Char* [In],userbuffersize : UInt32 [In],domain : Char* [In],domainbuffersize : UInt32 [In]
  fun CredUIParseUserNameW(username : LibC::LPWSTR, user : Char*, userbuffersize : UInt32, domain : Char*, domainbuffersize : UInt32) : UInt32

  # Params # username : PSTR [In],user : UInt8* [In],userbuffersize : UInt32 [In],domain : UInt8* [In],domainbuffersize : UInt32 [In]
  fun CredUIParseUserNameA(username : PSTR, user : UInt8*, userbuffersize : UInt32, domain : UInt8*, domainbuffersize : UInt32) : UInt32

  # Params # psztargetname : LibC::LPWSTR [In],pcontext : SecHandle* [In],dwautherror : UInt32 [In],username : Char* [In],uluserbuffersize : UInt32 [In],pszpassword : Char* [In],ulpasswordbuffersize : UInt32 [In],pfsave : LibC::BOOL* [In],dwflags : CREDUI_FLAGS [In]
  fun CredUICmdLinePromptForCredentialsW(psztargetname : LibC::LPWSTR, pcontext : SecHandle*, dwautherror : UInt32, username : Char*, uluserbuffersize : UInt32, pszpassword : Char*, ulpasswordbuffersize : UInt32, pfsave : LibC::BOOL*, dwflags : CREDUI_FLAGS) : UInt32

  # Params # psztargetname : PSTR [In],pcontext : SecHandle* [In],dwautherror : UInt32 [In],username : UInt8* [In],uluserbuffersize : UInt32 [In],pszpassword : UInt8* [In],ulpasswordbuffersize : UInt32 [In],pfsave : LibC::BOOL* [In],dwflags : CREDUI_FLAGS [In]
  fun CredUICmdLinePromptForCredentialsA(psztargetname : PSTR, pcontext : SecHandle*, dwautherror : UInt32, username : UInt8*, uluserbuffersize : UInt32, pszpassword : UInt8*, ulpasswordbuffersize : UInt32, pfsave : LibC::BOOL*, dwflags : CREDUI_FLAGS) : UInt32

  # Params # psztargetname : LibC::LPWSTR [In],bconfirm : LibC::BOOL [In]
  fun CredUIConfirmCredentialsW(psztargetname : LibC::LPWSTR, bconfirm : LibC::BOOL) : UInt32

  # Params # psztargetname : PSTR [In],bconfirm : LibC::BOOL [In]
  fun CredUIConfirmCredentialsA(psztargetname : PSTR, bconfirm : LibC::BOOL) : UInt32

  # Params # pszrealm : LibC::LPWSTR [In],pszusername : LibC::LPWSTR [In],pszpassword : LibC::LPWSTR [In],bpersist : LibC::BOOL [In]
  fun CredUIStoreSSOCredW(pszrealm : LibC::LPWSTR, pszusername : LibC::LPWSTR, pszpassword : LibC::LPWSTR, bpersist : LibC::BOOL) : UInt32

  # Params # pszrealm : LibC::LPWSTR [In],ppszusername : LibC::LPWSTR* [In]
  fun CredUIReadSSOCredW(pszrealm : LibC::LPWSTR, ppszusername : LibC::LPWSTR*) : UInt32

  # Params # dwscope : SCARD_SCOPE [In],pvreserved1 : Void* [In],pvreserved2 : Void* [In],phcontext : LibC::UINT_PTR* [In]
  fun SCardEstablishContext(dwscope : SCARD_SCOPE, pvreserved1 : Void*, pvreserved2 : Void*, phcontext : LibC::UINT_PTR*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In]
  fun SCardReleaseContext(hcontext : LibC::UINT_PTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In]
  fun SCardIsValidContext(hcontext : LibC::UINT_PTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],mszgroups : UInt8* [In],pcchgroups : UInt32* [In]
  fun SCardListReaderGroupsA(hcontext : LibC::UINT_PTR, mszgroups : UInt8*, pcchgroups : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],mszgroups : Char* [In],pcchgroups : UInt32* [In]
  fun SCardListReaderGroupsW(hcontext : LibC::UINT_PTR, mszgroups : Char*, pcchgroups : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],mszgroups : PSTR [In],mszreaders : PSTR [In],pcchreaders : UInt32* [In]
  fun SCardListReadersA(hcontext : LibC::UINT_PTR, mszgroups : PSTR, mszreaders : PSTR, pcchreaders : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],mszgroups : LibC::LPWSTR [In],mszreaders : LibC::LPWSTR [In],pcchreaders : UInt32* [In]
  fun SCardListReadersW(hcontext : LibC::UINT_PTR, mszgroups : LibC::LPWSTR, mszreaders : LibC::LPWSTR, pcchreaders : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],pbatr : UInt8* [In],rgquidinterfaces : Guid* [In],cguidinterfacecount : UInt32 [In],mszcards : PSTR [In],pcchcards : UInt32* [In]
  fun SCardListCardsA(hcontext : LibC::UINT_PTR, pbatr : UInt8*, rgquidinterfaces : Guid*, cguidinterfacecount : UInt32, mszcards : PSTR, pcchcards : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],pbatr : UInt8* [In],rgquidinterfaces : Guid* [In],cguidinterfacecount : UInt32 [In],mszcards : LibC::LPWSTR [In],pcchcards : UInt32* [In]
  fun SCardListCardsW(hcontext : LibC::UINT_PTR, pbatr : UInt8*, rgquidinterfaces : Guid*, cguidinterfacecount : UInt32, mszcards : LibC::LPWSTR, pcchcards : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcard : PSTR [In],pguidinterfaces : Guid* [In],pcguidinterfaces : UInt32* [In]
  fun SCardListInterfacesA(hcontext : LibC::UINT_PTR, szcard : PSTR, pguidinterfaces : Guid*, pcguidinterfaces : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcard : LibC::LPWSTR [In],pguidinterfaces : Guid* [In],pcguidinterfaces : UInt32* [In]
  fun SCardListInterfacesW(hcontext : LibC::UINT_PTR, szcard : LibC::LPWSTR, pguidinterfaces : Guid*, pcguidinterfaces : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcard : PSTR [In],pguidproviderid : Guid* [In]
  fun SCardGetProviderIdA(hcontext : LibC::UINT_PTR, szcard : PSTR, pguidproviderid : Guid*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcard : LibC::LPWSTR [In],pguidproviderid : Guid* [In]
  fun SCardGetProviderIdW(hcontext : LibC::UINT_PTR, szcard : LibC::LPWSTR, pguidproviderid : Guid*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : PSTR [In],dwproviderid : UInt32 [In],szprovider : UInt8* [In],pcchprovider : UInt32* [In]
  fun SCardGetCardTypeProviderNameA(hcontext : LibC::UINT_PTR, szcardname : PSTR, dwproviderid : UInt32, szprovider : UInt8*, pcchprovider : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : LibC::LPWSTR [In],dwproviderid : UInt32 [In],szprovider : Char* [In],pcchprovider : UInt32* [In]
  fun SCardGetCardTypeProviderNameW(hcontext : LibC::UINT_PTR, szcardname : LibC::LPWSTR, dwproviderid : UInt32, szprovider : Char*, pcchprovider : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szgroupname : PSTR [In]
  fun SCardIntroduceReaderGroupA(hcontext : LibC::UINT_PTR, szgroupname : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szgroupname : LibC::LPWSTR [In]
  fun SCardIntroduceReaderGroupW(hcontext : LibC::UINT_PTR, szgroupname : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szgroupname : PSTR [In]
  fun SCardForgetReaderGroupA(hcontext : LibC::UINT_PTR, szgroupname : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szgroupname : LibC::LPWSTR [In]
  fun SCardForgetReaderGroupW(hcontext : LibC::UINT_PTR, szgroupname : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In],szdevicename : PSTR [In]
  fun SCardIntroduceReaderA(hcontext : LibC::UINT_PTR, szreadername : PSTR, szdevicename : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In],szdevicename : LibC::LPWSTR [In]
  fun SCardIntroduceReaderW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR, szdevicename : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In]
  fun SCardForgetReaderA(hcontext : LibC::UINT_PTR, szreadername : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In]
  fun SCardForgetReaderW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In],szgroupname : PSTR [In]
  fun SCardAddReaderToGroupA(hcontext : LibC::UINT_PTR, szreadername : PSTR, szgroupname : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In],szgroupname : LibC::LPWSTR [In]
  fun SCardAddReaderToGroupW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR, szgroupname : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In],szgroupname : PSTR [In]
  fun SCardRemoveReaderFromGroupA(hcontext : LibC::UINT_PTR, szreadername : PSTR, szgroupname : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In],szgroupname : LibC::LPWSTR [In]
  fun SCardRemoveReaderFromGroupW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR, szgroupname : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : PSTR [In],pguidprimaryprovider : Guid* [In],rgguidinterfaces : Guid* [In],dwinterfacecount : UInt32 [In],pbatr : UInt8* [In],pbatrmask : UInt8* [In],cbatrlen : UInt32 [In]
  fun SCardIntroduceCardTypeA(hcontext : LibC::UINT_PTR, szcardname : PSTR, pguidprimaryprovider : Guid*, rgguidinterfaces : Guid*, dwinterfacecount : UInt32, pbatr : UInt8*, pbatrmask : UInt8*, cbatrlen : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : LibC::LPWSTR [In],pguidprimaryprovider : Guid* [In],rgguidinterfaces : Guid* [In],dwinterfacecount : UInt32 [In],pbatr : UInt8* [In],pbatrmask : UInt8* [In],cbatrlen : UInt32 [In]
  fun SCardIntroduceCardTypeW(hcontext : LibC::UINT_PTR, szcardname : LibC::LPWSTR, pguidprimaryprovider : Guid*, rgguidinterfaces : Guid*, dwinterfacecount : UInt32, pbatr : UInt8*, pbatrmask : UInt8*, cbatrlen : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : PSTR [In],dwproviderid : UInt32 [In],szprovider : PSTR [In]
  fun SCardSetCardTypeProviderNameA(hcontext : LibC::UINT_PTR, szcardname : PSTR, dwproviderid : UInt32, szprovider : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : LibC::LPWSTR [In],dwproviderid : UInt32 [In],szprovider : LibC::LPWSTR [In]
  fun SCardSetCardTypeProviderNameW(hcontext : LibC::UINT_PTR, szcardname : LibC::LPWSTR, dwproviderid : UInt32, szprovider : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : PSTR [In]
  fun SCardForgetCardTypeA(hcontext : LibC::UINT_PTR, szcardname : PSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szcardname : LibC::LPWSTR [In]
  fun SCardForgetCardTypeW(hcontext : LibC::UINT_PTR, szcardname : LibC::LPWSTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],pvmem : Void* [In]
  fun SCardFreeMemory(hcontext : LibC::UINT_PTR, pvmem : Void*) : Int32

  # Params # 
  fun SCardAccessStartedEvent : LibC::HANDLE

  # Params # 
  fun SCardReleaseStartedEvent

  # Params # hcontext : LibC::UINT_PTR [In],mszcards : PSTR [In],rgreaderstates : SCARD_READERSTATEA* [In],creaders : UInt32 [In]
  fun SCardLocateCardsA(hcontext : LibC::UINT_PTR, mszcards : PSTR, rgreaderstates : SCARD_READERSTATEA*, creaders : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],mszcards : LibC::LPWSTR [In],rgreaderstates : SCARD_READERSTATEW* [In],creaders : UInt32 [In]
  fun SCardLocateCardsW(hcontext : LibC::UINT_PTR, mszcards : LibC::LPWSTR, rgreaderstates : SCARD_READERSTATEW*, creaders : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],rgatrmasks : SCARD_ATRMASK* [In],catrs : UInt32 [In],rgreaderstates : SCARD_READERSTATEA* [In],creaders : UInt32 [In]
  fun SCardLocateCardsByATRA(hcontext : LibC::UINT_PTR, rgatrmasks : SCARD_ATRMASK*, catrs : UInt32, rgreaderstates : SCARD_READERSTATEA*, creaders : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],rgatrmasks : SCARD_ATRMASK* [In],catrs : UInt32 [In],rgreaderstates : SCARD_READERSTATEW* [In],creaders : UInt32 [In]
  fun SCardLocateCardsByATRW(hcontext : LibC::UINT_PTR, rgatrmasks : SCARD_ATRMASK*, catrs : UInt32, rgreaderstates : SCARD_READERSTATEW*, creaders : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],dwtimeout : UInt32 [In],rgreaderstates : SCARD_READERSTATEA* [In],creaders : UInt32 [In]
  fun SCardGetStatusChangeA(hcontext : LibC::UINT_PTR, dwtimeout : UInt32, rgreaderstates : SCARD_READERSTATEA*, creaders : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],dwtimeout : UInt32 [In],rgreaderstates : SCARD_READERSTATEW* [In],creaders : UInt32 [In]
  fun SCardGetStatusChangeW(hcontext : LibC::UINT_PTR, dwtimeout : UInt32, rgreaderstates : SCARD_READERSTATEW*, creaders : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In]
  fun SCardCancel(hcontext : LibC::UINT_PTR) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreader : PSTR [In],dwsharemode : UInt32 [In],dwpreferredprotocols : UInt32 [In],phcard : LibC::UINT_PTR* [In],pdwactiveprotocol : UInt32* [In]
  fun SCardConnectA(hcontext : LibC::UINT_PTR, szreader : PSTR, dwsharemode : UInt32, dwpreferredprotocols : UInt32, phcard : LibC::UINT_PTR*, pdwactiveprotocol : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreader : LibC::LPWSTR [In],dwsharemode : UInt32 [In],dwpreferredprotocols : UInt32 [In],phcard : LibC::UINT_PTR* [In],pdwactiveprotocol : UInt32* [In]
  fun SCardConnectW(hcontext : LibC::UINT_PTR, szreader : LibC::LPWSTR, dwsharemode : UInt32, dwpreferredprotocols : UInt32, phcard : LibC::UINT_PTR*, pdwactiveprotocol : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],dwsharemode : UInt32 [In],dwpreferredprotocols : UInt32 [In],dwinitialization : UInt32 [In],pdwactiveprotocol : UInt32* [In]
  fun SCardReconnect(hcard : LibC::UINT_PTR, dwsharemode : UInt32, dwpreferredprotocols : UInt32, dwinitialization : UInt32, pdwactiveprotocol : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],dwdisposition : UInt32 [In]
  fun SCardDisconnect(hcard : LibC::UINT_PTR, dwdisposition : UInt32) : Int32

  # Params # hcard : LibC::UINT_PTR [In]
  fun SCardBeginTransaction(hcard : LibC::UINT_PTR) : Int32

  # Params # hcard : LibC::UINT_PTR [In],dwdisposition : UInt32 [In]
  fun SCardEndTransaction(hcard : LibC::UINT_PTR, dwdisposition : UInt32) : Int32

  # Params # hcard : LibC::UINT_PTR [In],pdwstate : UInt32* [In],pdwprotocol : UInt32* [In],pbatr : UInt8* [In],pcbatrlen : UInt32* [In]
  fun SCardState(hcard : LibC::UINT_PTR, pdwstate : UInt32*, pdwprotocol : UInt32*, pbatr : UInt8*, pcbatrlen : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],mszreadernames : PSTR [In],pcchreaderlen : UInt32* [In],pdwstate : UInt32* [In],pdwprotocol : UInt32* [In],pbatr : UInt8* [In],pcbatrlen : UInt32* [In]
  fun SCardStatusA(hcard : LibC::UINT_PTR, mszreadernames : PSTR, pcchreaderlen : UInt32*, pdwstate : UInt32*, pdwprotocol : UInt32*, pbatr : UInt8*, pcbatrlen : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],mszreadernames : LibC::LPWSTR [In],pcchreaderlen : UInt32* [In],pdwstate : UInt32* [In],pdwprotocol : UInt32* [In],pbatr : UInt8* [In],pcbatrlen : UInt32* [In]
  fun SCardStatusW(hcard : LibC::UINT_PTR, mszreadernames : LibC::LPWSTR, pcchreaderlen : UInt32*, pdwstate : UInt32*, pdwprotocol : UInt32*, pbatr : UInt8*, pcbatrlen : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],piosendpci : SCARD_IO_REQUEST* [In],pbsendbuffer : UInt8* [In],cbsendlength : UInt32 [In],piorecvpci : SCARD_IO_REQUEST* [In],pbrecvbuffer : UInt8* [In],pcbrecvlength : UInt32* [In]
  fun SCardTransmit(hcard : LibC::UINT_PTR, piosendpci : SCARD_IO_REQUEST*, pbsendbuffer : UInt8*, cbsendlength : UInt32, piorecvpci : SCARD_IO_REQUEST*, pbrecvbuffer : UInt8*, pcbrecvlength : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],pctransmitcount : UInt32* [In]
  fun SCardGetTransmitCount(hcard : LibC::UINT_PTR, pctransmitcount : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],dwcontrolcode : UInt32 [In],lpinbuffer : Void* [In],cbinbuffersize : UInt32 [In],lpoutbuffer : Void* [In],cboutbuffersize : UInt32 [In],lpbytesreturned : UInt32* [In]
  fun SCardControl(hcard : LibC::UINT_PTR, dwcontrolcode : UInt32, lpinbuffer : Void*, cbinbuffersize : UInt32, lpoutbuffer : Void*, cboutbuffersize : UInt32, lpbytesreturned : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],dwattrid : UInt32 [In],pbattr : UInt8* [In],pcbattrlen : UInt32* [In]
  fun SCardGetAttrib(hcard : LibC::UINT_PTR, dwattrid : UInt32, pbattr : UInt8*, pcbattrlen : UInt32*) : Int32

  # Params # hcard : LibC::UINT_PTR [In],dwattrid : UInt32 [In],pbattr : UInt8* [In],cbattrlen : UInt32 [In]
  fun SCardSetAttrib(hcard : LibC::UINT_PTR, dwattrid : UInt32, pbattr : UInt8*, cbattrlen : UInt32) : Int32

  # Params # param0 : OPENCARDNAME_EXA* [In]
  fun SCardUIDlgSelectCardA(param0 : OPENCARDNAME_EXA*) : Int32

  # Params # param0 : OPENCARDNAME_EXW* [In]
  fun SCardUIDlgSelectCardW(param0 : OPENCARDNAME_EXW*) : Int32

  # Params # param0 : OPENCARDNAMEA* [In]
  fun GetOpenCardNameA(param0 : OPENCARDNAMEA*) : Int32

  # Params # param0 : OPENCARDNAMEW* [In]
  fun GetOpenCardNameW(param0 : OPENCARDNAMEW*) : Int32

  # Params # 
  fun SCardDlgExtendedError : Int32

  # Params # hcontext : LibC::UINT_PTR [In],cardidentifier : Guid* [In],freshnesscounter : UInt32 [In],lookupname : PSTR [In],data : UInt8* [In],datalen : UInt32* [In]
  fun SCardReadCacheA(hcontext : LibC::UINT_PTR, cardidentifier : Guid*, freshnesscounter : UInt32, lookupname : PSTR, data : UInt8*, datalen : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],cardidentifier : Guid* [In],freshnesscounter : UInt32 [In],lookupname : LibC::LPWSTR [In],data : UInt8* [In],datalen : UInt32* [In]
  fun SCardReadCacheW(hcontext : LibC::UINT_PTR, cardidentifier : Guid*, freshnesscounter : UInt32, lookupname : LibC::LPWSTR, data : UInt8*, datalen : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],cardidentifier : Guid* [In],freshnesscounter : UInt32 [In],lookupname : PSTR [In],data : UInt8* [In],datalen : UInt32 [In]
  fun SCardWriteCacheA(hcontext : LibC::UINT_PTR, cardidentifier : Guid*, freshnesscounter : UInt32, lookupname : PSTR, data : UInt8*, datalen : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],cardidentifier : Guid* [In],freshnesscounter : UInt32 [In],lookupname : LibC::LPWSTR [In],data : UInt8* [In],datalen : UInt32 [In]
  fun SCardWriteCacheW(hcontext : LibC::UINT_PTR, cardidentifier : Guid*, freshnesscounter : UInt32, lookupname : LibC::LPWSTR, data : UInt8*, datalen : UInt32) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In],pbicon : UInt8* [In],pcbicon : UInt32* [In]
  fun SCardGetReaderIconA(hcontext : LibC::UINT_PTR, szreadername : PSTR, pbicon : UInt8*, pcbicon : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In],pbicon : UInt8* [In],pcbicon : UInt32* [In]
  fun SCardGetReaderIconW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR, pbicon : UInt8*, pcbicon : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In],pdwdevicetypeid : UInt32* [In]
  fun SCardGetDeviceTypeIdA(hcontext : LibC::UINT_PTR, szreadername : PSTR, pdwdevicetypeid : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In],pdwdevicetypeid : UInt32* [In]
  fun SCardGetDeviceTypeIdW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR, pdwdevicetypeid : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : PSTR [In],szdeviceinstanceid : PSTR [In],pcchdeviceinstanceid : UInt32* [In]
  fun SCardGetReaderDeviceInstanceIdA(hcontext : LibC::UINT_PTR, szreadername : PSTR, szdeviceinstanceid : PSTR, pcchdeviceinstanceid : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szreadername : LibC::LPWSTR [In],szdeviceinstanceid : LibC::LPWSTR [In],pcchdeviceinstanceid : UInt32* [In]
  fun SCardGetReaderDeviceInstanceIdW(hcontext : LibC::UINT_PTR, szreadername : LibC::LPWSTR, szdeviceinstanceid : LibC::LPWSTR, pcchdeviceinstanceid : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szdeviceinstanceid : PSTR [In],mszreaders : PSTR [In],pcchreaders : UInt32* [In]
  fun SCardListReadersWithDeviceInstanceIdA(hcontext : LibC::UINT_PTR, szdeviceinstanceid : PSTR, mszreaders : PSTR, pcchreaders : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],szdeviceinstanceid : LibC::LPWSTR [In],mszreaders : LibC::LPWSTR [In],pcchreaders : UInt32* [In]
  fun SCardListReadersWithDeviceInstanceIdW(hcontext : LibC::UINT_PTR, szdeviceinstanceid : LibC::LPWSTR, mszreaders : LibC::LPWSTR, pcchreaders : UInt32*) : Int32

  # Params # hcontext : LibC::UINT_PTR [In],dwevent : UInt32 [In]
  fun SCardAudit(hcontext : LibC::UINT_PTR, dwevent : UInt32) : Int32
end
