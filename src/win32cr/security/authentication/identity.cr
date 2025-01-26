require "./../../foundation.cr"
require "./../../security.cr"
require "./../../system/kernel.cr"
require "./../credentials.cr"
require "./../../system/rpc.cr"
require "./../../system/threading.cr"
require "./../cryptography.cr"
require "./../../system/password_management.cr"
require "./../../system/com.cr"
require "./../../system/windows_programming.cr"

module Win32cr::Security::Authentication::Identity
  alias LsaHandle = LibC::IntPtrT
  alias PSAM_PASSWORD_NOTIFICATION_ROUTINE = Proc(Win32cr::Foundation::UNICODE_STRING*, UInt32, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::NTSTATUS)

  alias PSAM_INIT_NOTIFICATION_ROUTINE = Proc(Win32cr::Foundation::BOOLEAN)

  alias PSAM_PASSWORD_FILTER_ROUTINE = Proc(Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::BOOLEAN)

  alias SEC_GET_KEY_FN = Proc(Void*, Void*, UInt32, Void**, Win32cr::Foundation::HRESULT*, Void)

  alias ACQUIRE_CREDENTIALS_HANDLE_FN_W = Proc(UInt16*, UInt16*, UInt32, Void*, Void*, Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, Void*, Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias ACQUIRE_CREDENTIALS_HANDLE_FN_A = Proc(Int8*, Int8*, UInt32, Void*, Void*, Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, Void*, Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias FREE_CREDENTIALS_HANDLE_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::HRESULT)

  alias ADD_CREDENTIALS_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt16*, UInt16*, UInt32, Void*, Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, Void*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias ADD_CREDENTIALS_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, Int8*, Int8*, UInt32, Void*, Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, Void*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias CHANGE_PASSWORD_FN_W = Proc(UInt16*, UInt16*, UInt16*, UInt16*, UInt16*, Win32cr::Foundation::BOOLEAN, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::HRESULT)

  alias CHANGE_PASSWORD_FN_A = Proc(Int8*, Int8*, Int8*, Int8*, Int8*, Win32cr::Foundation::BOOLEAN, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::HRESULT)

  alias INITIALIZE_SECURITY_CONTEXT_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Credentials::SecHandle*, UInt16*, UInt32, UInt32, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias INITIALIZE_SECURITY_CONTEXT_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Credentials::SecHandle*, Int8*, UInt32, UInt32, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias ACCEPT_SECURITY_CONTEXT_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32, Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::HRESULT)

  alias COMPLETE_AUTH_TOKEN_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::HRESULT)

  alias IMPERSONATE_SECURITY_CONTEXT_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::HRESULT)

  alias REVERT_SECURITY_CONTEXT_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::HRESULT)

  alias QUERY_SECURITY_CONTEXT_TOKEN_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Void**, Win32cr::Foundation::HRESULT)

  alias DELETE_SECURITY_CONTEXT_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::HRESULT)

  alias APPLY_CONTROL_TOKEN_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::HRESULT)

  alias QUERY_CONTEXT_ATTRIBUTES_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, Win32cr::Foundation::HRESULT)

  alias QUERY_CONTEXT_ATTRIBUTES_EX_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias QUERY_CONTEXT_ATTRIBUTES_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, Win32cr::Foundation::HRESULT)

  alias QUERY_CONTEXT_ATTRIBUTES_EX_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias SET_CONTEXT_ATTRIBUTES_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias SET_CONTEXT_ATTRIBUTES_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias QUERY_CREDENTIALS_ATTRIBUTES_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, Win32cr::Foundation::HRESULT)

  alias QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias QUERY_CREDENTIALS_ATTRIBUTES_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, Win32cr::Foundation::HRESULT)

  alias QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias SET_CREDENTIALS_ATTRIBUTES_FN_W = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias SET_CREDENTIALS_ATTRIBUTES_FN_A = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)

  alias FREE_CONTEXT_BUFFER_FN = Proc(Void*, Win32cr::Foundation::HRESULT)

  alias MAKE_SIGNATURE_FN = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Foundation::HRESULT)

  alias VERIFY_SIGNATURE_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias ENCRYPT_MESSAGE_FN = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Foundation::HRESULT)

  alias DECRYPT_MESSAGE_FN = Proc(Win32cr::Security::Credentials::SecHandle*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)

  alias ENUMERATE_SECURITY_PACKAGES_FN_W = Proc(UInt32*, Win32cr::Security::Authentication::Identity::SecPkgInfoW**, Win32cr::Foundation::HRESULT)

  alias ENUMERATE_SECURITY_PACKAGES_FN_A = Proc(UInt32*, Win32cr::Security::Authentication::Identity::SecPkgInfoA**, Win32cr::Foundation::HRESULT)

  alias QUERY_SECURITY_PACKAGE_INFO_FN_W = Proc(UInt16*, Win32cr::Security::Authentication::Identity::SecPkgInfoW**, Win32cr::Foundation::HRESULT)

  alias QUERY_SECURITY_PACKAGE_INFO_FN_A = Proc(Int8*, Win32cr::Security::Authentication::Identity::SecPkgInfoA**, Win32cr::Foundation::HRESULT)

  alias EXPORT_SECURITY_CONTEXT_FN = Proc(Win32cr::Security::Credentials::SecHandle*, UInt32, Win32cr::Security::Authentication::Identity::SecBuffer*, Void**, Win32cr::Foundation::HRESULT)

  alias IMPORT_SECURITY_CONTEXT_FN_W = Proc(UInt16*, Win32cr::Security::Authentication::Identity::SecBuffer*, Void*, Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::HRESULT)

  alias IMPORT_SECURITY_CONTEXT_FN_A = Proc(Int8*, Win32cr::Security::Authentication::Identity::SecBuffer*, Void*, Win32cr::Security::Credentials::SecHandle*, Win32cr::Foundation::HRESULT)

  alias INIT_SECURITY_INTERFACE_A = Proc(Win32cr::Security::Authentication::Identity::SecurityFunctionTableA*)

  alias INIT_SECURITY_INTERFACE_W = Proc(Win32cr::Security::Authentication::Identity::SecurityFunctionTableW*)

  alias PLSA_CREATE_LOGON_SESSION = Proc(Win32cr::Foundation::LUID*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_DELETE_LOGON_SESSION = Proc(Win32cr::Foundation::LUID*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_ADD_CREDENTIAL = Proc(Win32cr::Foundation::LUID*, UInt32, Win32cr::System::Kernel::STRING*, Win32cr::System::Kernel::STRING*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_CREDENTIALS = Proc(Win32cr::Foundation::LUID*, UInt32, UInt32*, Win32cr::Foundation::BOOLEAN, Win32cr::System::Kernel::STRING*, UInt32*, Win32cr::System::Kernel::STRING*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_DELETE_CREDENTIAL = Proc(Win32cr::Foundation::LUID*, UInt32, Win32cr::System::Kernel::STRING*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_ALLOCATE_LSA_HEAP = Proc(UInt32, Void*)

  alias PLSA_FREE_LSA_HEAP = Proc(Void*, Void)

  alias PLSA_ALLOCATE_PRIVATE_HEAP = Proc(LibC::UIntPtrT, Void*)

  alias PLSA_FREE_PRIVATE_HEAP = Proc(Void*, Void)

  alias PLSA_ALLOCATE_CLIENT_BUFFER = Proc(Void**, UInt32, Void**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_FREE_CLIENT_BUFFER = Proc(Void**, Void*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_COPY_TO_CLIENT_BUFFER = Proc(Void**, UInt32, Void*, Void*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_COPY_FROM_CLIENT_BUFFER = Proc(Void**, UInt32, Void*, Void*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_INITIALIZE_PACKAGE = Proc(UInt32, Win32cr::Security::Authentication::Identity::LSA_DISPATCH_TABLE*, Win32cr::System::Kernel::STRING*, Win32cr::System::Kernel::STRING*, Win32cr::System::Kernel::STRING**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_LOGON_USER = Proc(Void**, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Void*, Void*, UInt32, Void**, UInt32*, Win32cr::Foundation::LUID*, Int32*, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE*, Void**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_LOGON_USER_EX = Proc(Void**, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Void*, Void*, UInt32, Void**, UInt32*, Win32cr::Foundation::LUID*, Int32*, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE*, Void**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_CALL_PACKAGE = Proc(Void**, Void*, Void*, UInt32, Void**, UInt32*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_CALL_PACKAGE_PASSTHROUGH = Proc(Void**, Void*, Void*, UInt32, Void**, UInt32*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_LOGON_TERMINATED = Proc(Win32cr::Foundation::LUID*, Void)

  alias PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE = Proc(Win32cr::Foundation::UNICODE_STRING*, Void*, UInt32, UInt32, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Void**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE = Proc(Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::BOOLEAN)

  alias PSAM_CREDENTIAL_UPDATE_FREE_ROUTINE = Proc(Void*, Void)

  alias PSAM_CREDENTIAL_UPDATE_REGISTER_MAPPED_ENTRYPOINTS_ROUTINE = Proc(Win32cr::Security::Authentication::Identity::SAM_REGISTER_MAPPING_TABLE*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CALLBACK_FUNCTION = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_REDIRECTED_LOGON_INIT = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::UNICODE_STRING*, UInt32, Win32cr::Foundation::LUID*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_REDIRECTED_LOGON_CALLBACK = Proc(Win32cr::Foundation::HANDLE, Void*, UInt32, Void**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK = Proc(Win32cr::Foundation::HANDLE, Void)

  alias PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS = Proc(Win32cr::Foundation::HANDLE, UInt8**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS = Proc(Win32cr::Foundation::HANDLE, Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED_ARRAY**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_IMPERSONATE_CLIENT = Proc(Win32cr::Foundation::NTSTATUS)

  alias PLSA_UNLOAD_PACKAGE = Proc(Win32cr::Foundation::NTSTATUS)

  alias PLSA_DUPLICATE_HANDLE = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS = Proc(Win32cr::Foundation::LUID*, UInt32, Void*, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CREATE_THREAD = Proc(Win32cr::Security::SECURITY_ATTRIBUTES*, UInt32, Win32cr::System::Threading::LPTHREAD_START_ROUTINE, Void*, UInt32, UInt32*, Win32cr::Foundation::HANDLE)

  alias PLSA_GET_CLIENT_INFO = Proc(Win32cr::Security::Authentication::Identity::SECPKG_CLIENT_INFO*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_REGISTER_NOTIFICATION = Proc(Win32cr::System::Threading::LPTHREAD_START_ROUTINE, Void*, UInt32, UInt32, UInt32, UInt32, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE)

  alias PLSA_CANCEL_NOTIFICATION = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::NTSTATUS)

  alias PLSA_MAP_BUFFER = Proc(Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CREATE_TOKEN = Proc(Win32cr::Foundation::LUID*, Win32cr::Security::TOKEN_SOURCE*, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE, Void*, Win32cr::Security::TOKEN_GROUPS*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::HANDLE*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CREATE_TOKEN_EX = Proc(Win32cr::Foundation::LUID*, Win32cr::Security::TOKEN_SOURCE*, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE, Void*, Win32cr::Security::TOKEN_GROUPS*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Void*, Win32cr::Security::Authentication::Identity::SECPKG_SESSIONINFO_TYPE, Win32cr::Foundation::HANDLE*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AUDIT_LOGON = Proc(Win32cr::Foundation::NTSTATUS, Win32cr::Foundation::NTSTATUS, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::PSID, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Win32cr::Security::TOKEN_SOURCE*, Win32cr::Foundation::LUID*, Void)

  alias PLSA_CALL_PACKAGE = Proc(Win32cr::Foundation::UNICODE_STRING*, Void*, UInt32, Void**, UInt32*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CALL_PACKAGEEX = Proc(Win32cr::Foundation::UNICODE_STRING*, Void*, Void*, UInt32, Void**, UInt32*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CALL_PACKAGE_PASSTHROUGH = Proc(Win32cr::Foundation::UNICODE_STRING*, Void*, Void*, UInt32, Void**, UInt32*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_CALL_INFO = Proc(Win32cr::Security::Authentication::Identity::SECPKG_CALL_INFO*, Win32cr::Foundation::BOOLEAN)

  alias PLSA_CREATE_SHARED_MEMORY = Proc(UInt32, UInt32, Void*)

  alias PLSA_ALLOCATE_SHARED_MEMORY = Proc(Void*, UInt32, Void*)

  alias PLSA_FREE_SHARED_MEMORY = Proc(Void*, Void*, Void)

  alias PLSA_DELETE_SHARED_MEMORY = Proc(Void*, Win32cr::Foundation::BOOLEAN)

  alias PLSA_GET_APP_MODE_INFO = Proc(UInt32*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::BOOLEAN*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_SET_APP_MODE_INFO = Proc(UInt32, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::NTSTATUS)

  alias PLSA_OPEN_SAM_USER = Proc(Win32cr::Foundation::UNICODE_STRING*, Win32cr::Security::Authentication::Identity::SECPKG_NAME_TYPE, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::BOOLEAN, UInt32, Void**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_USER_CREDENTIALS = Proc(Void*, Void**, UInt32*, Void**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_USER_AUTH_DATA = Proc(Void*, UInt8**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CLOSE_SAM_USER = Proc(Void*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_AUTH_DATA_FOR_USER = Proc(Win32cr::Foundation::UNICODE_STRING*, Win32cr::Security::Authentication::Identity::SECPKG_NAME_TYPE, Win32cr::Foundation::UNICODE_STRING*, UInt8**, UInt32*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CONVERT_AUTH_DATA_TO_TOKEN = Proc(Void*, UInt32, Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, Win32cr::Security::TOKEN_SOURCE*, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::LUID*, Win32cr::Foundation::UNICODE_STRING*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CRACK_SINGLE_NAME = Proc(UInt32, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, UInt32, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AUDIT_ACCOUNT_LOGON = Proc(UInt32, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::NTSTATUS, Win32cr::Foundation::NTSTATUS)

  alias PLSA_CLIENT_CALLBACK = Proc(Win32cr::Foundation::PSTR, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_REGISTER_CALLBACK = Proc(UInt32, Win32cr::Security::Authentication::Identity::PLSA_CALLBACK_FUNCTION, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_EXTENDED_CALL_FLAGS = Proc(UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_UPDATE_PRIMARY_CREDENTIALS = Proc(Win32cr::Security::Authentication::Identity::SECPKG_PRIMARY_CRED*, Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED_ARRAY*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_PROTECT_MEMORY = Proc(Void*, UInt32, Void)

  alias PLSA_OPEN_TOKEN_BY_LOGON_ID = Proc(Win32cr::Foundation::LUID*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN = Proc(UInt8*, UInt32, Void*, UInt8**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_GET_SERVICE_ACCOUNT_PASSWORD = Proc(Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Security::Authentication::Identity::CRED_FETCH, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AUDIT_LOGON_EX = Proc(Win32cr::Foundation::NTSTATUS, Win32cr::Foundation::NTSTATUS, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::PSID, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, Win32cr::Security::TOKEN_SOURCE*, Win32cr::Foundation::LUID*, Void)

  alias PLSA_CHECK_PROTECTED_USER_BY_TOKEN = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOLEAN*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_QUERY_CLIENT_REQUEST = Proc(Void**, UInt32, Void**, Win32cr::Foundation::NTSTATUS)

  alias CredReadFn = Proc(Win32cr::Foundation::LUID*, UInt32, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Security::Authentication::Identity::ENCRYPTED_CREDENTIALW**, Win32cr::Foundation::NTSTATUS)

  alias CredReadDomainCredentialsFn = Proc(Win32cr::Foundation::LUID*, UInt32, Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONW*, UInt32, UInt32*, Win32cr::Security::Authentication::Identity::ENCRYPTED_CREDENTIALW***, Win32cr::Foundation::NTSTATUS)

  alias CredFreeCredentialsFn = Proc(UInt32, Win32cr::Security::Authentication::Identity::ENCRYPTED_CREDENTIALW**, Void)

  alias CredWriteFn = Proc(Win32cr::Foundation::LUID*, UInt32, Win32cr::Security::Authentication::Identity::ENCRYPTED_CREDENTIALW*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias CrediUnmarshalandDecodeStringFn = Proc(Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt8*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_LOCATE_PKG_BY_ID = Proc(UInt32, Void*)

  alias SpInitializeFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SECPKG_PARAMETERS*, Win32cr::Security::Authentication::Identity::LSA_SECPKG_FUNCTION_TABLE*, Win32cr::Foundation::NTSTATUS)

  alias SpShutdownFn = Proc(Win32cr::Foundation::NTSTATUS)

  alias SpGetInfoFn = Proc(Win32cr::Security::Authentication::Identity::SecPkgInfoA*, Win32cr::Foundation::NTSTATUS)

  alias SpGetExtendedInformationFn = Proc(Win32cr::Security::Authentication::Identity::SECPKG_EXTENDED_INFORMATION_CLASS, Win32cr::Security::Authentication::Identity::SECPKG_EXTENDED_INFORMATION**, Win32cr::Foundation::NTSTATUS)

  alias SpSetExtendedInformationFn = Proc(Win32cr::Security::Authentication::Identity::SECPKG_EXTENDED_INFORMATION_CLASS, Win32cr::Security::Authentication::Identity::SECPKG_EXTENDED_INFORMATION*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_LOGON_USER_EX2 = Proc(Void**, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Void*, Void*, UInt32, Void**, UInt32*, Win32cr::Foundation::LUID*, Int32*, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE*, Void**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Security::Authentication::Identity::SECPKG_PRIMARY_CRED*, Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED_ARRAY**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_LOGON_USER_EX3 = Proc(Void**, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Void*, Void*, UInt32, Win32cr::Security::Authentication::Identity::SECPKG_SURROGATE_LOGON*, Void**, UInt32*, Win32cr::Foundation::LUID*, Int32*, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE*, Void**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Foundation::UNICODE_STRING**, Win32cr::Security::Authentication::Identity::SECPKG_PRIMARY_CRED*, Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED_ARRAY**, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_PRE_LOGON_USER_SURROGATE = Proc(Void**, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Void*, Void*, UInt32, Win32cr::Security::Authentication::Identity::SECPKG_SURROGATE_LOGON*, Int32*, Win32cr::Foundation::NTSTATUS)

  alias PLSA_AP_POST_LOGON_USER_SURROGATE = Proc(Void**, Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Void*, Void*, UInt32, Win32cr::Security::Authentication::Identity::SECPKG_SURROGATE_LOGON*, Void*, UInt32, Win32cr::Foundation::LUID*, Win32cr::Foundation::NTSTATUS, Win32cr::Foundation::NTSTATUS, Win32cr::Security::Authentication::Identity::LSA_TOKEN_INFORMATION_TYPE, Void*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Security::Authentication::Identity::SECPKG_PRIMARY_CRED*, Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED_ARRAY*, Win32cr::Foundation::NTSTATUS)

  alias SpAcceptCredentialsFn = Proc(Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Security::Authentication::Identity::SECPKG_PRIMARY_CRED*, Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED*, Win32cr::Foundation::NTSTATUS)

  alias SpAcquireCredentialsHandleFn = Proc(Win32cr::Foundation::UNICODE_STRING*, UInt32, Win32cr::Foundation::LUID*, Void*, Void*, Void*, LibC::UIntPtrT*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::NTSTATUS)

  alias SpFreeCredentialsHandleFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::NTSTATUS)

  alias SpQueryCredentialsAttributesFn = Proc(LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::NTSTATUS)

  alias SpSetCredentialsAttributesFn = Proc(LibC::UIntPtrT, UInt32, Void*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias SpAddCredentialsFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, UInt32, Void*, Void*, Void*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::NTSTATUS)

  alias SpSaveCredentialsFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpGetCredentialsFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpDeleteCredentialsFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpInitLsaModeContextFn = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::UNICODE_STRING*, UInt32, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, LibC::UIntPtrT*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::BOOLEAN*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpDeleteContextFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::NTSTATUS)

  alias SpApplyControlTokenFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::NTSTATUS)

  alias SpAcceptLsaModeContextFn = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32, LibC::UIntPtrT*, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32*, Win32cr::Foundation::LARGE_INTEGER*, Win32cr::Foundation::BOOLEAN*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpGetUserInfoFn = Proc(Win32cr::Foundation::LUID*, UInt32, Win32cr::Security::Authentication::Identity::SECURITY_USER_DATA**, Win32cr::Foundation::NTSTATUS)

  alias SpQueryContextAttributesFn = Proc(LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::NTSTATUS)

  alias SpSetContextAttributesFn = Proc(LibC::UIntPtrT, UInt32, Void*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias SpChangeAccountPasswordFn = Proc(Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::BOOLEAN, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::NTSTATUS)

  alias SpQueryMetaDataFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::UNICODE_STRING*, UInt32, UInt32*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::NTSTATUS)

  alias SpExchangeMetaDataFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::UNICODE_STRING*, UInt32, UInt32, UInt8*, LibC::UIntPtrT*, Win32cr::Foundation::NTSTATUS)

  alias SpGetCredUIContextFn = Proc(LibC::UIntPtrT, LibC::GUID*, UInt32*, UInt8**, Win32cr::Foundation::NTSTATUS)

  alias SpUpdateCredentialsFn = Proc(LibC::UIntPtrT, LibC::GUID*, UInt32, UInt8*, Win32cr::Foundation::NTSTATUS)

  alias SpValidateTargetInfoFn = Proc(Void**, Void*, Void*, UInt32, Win32cr::Security::Authentication::Identity::SECPKG_TARGETINFO*, Win32cr::Foundation::NTSTATUS)

  alias LSA_AP_POST_LOGON_USER = Proc(Win32cr::Security::Authentication::Identity::SECPKG_POST_LOGON_USER_INFO*, Win32cr::Foundation::NTSTATUS)

  alias SpGetRemoteCredGuardLogonBufferFn = Proc(LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::HANDLE*, Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CALLBACK*, Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK*, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias SpGetRemoteCredGuardSupplementalCredsFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::UNICODE_STRING*, Win32cr::Foundation::HANDLE*, Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CALLBACK*, Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK*, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias SpGetTbalSupplementalCredsFn = Proc(Win32cr::Foundation::LUID, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias SpInstanceInitFn = Proc(UInt32, Win32cr::Security::Authentication::Identity::SECPKG_DLL_FUNCTIONS*, Void**, Win32cr::Foundation::NTSTATUS)

  alias SpInitUserModeContextFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpMakeSignatureFn = Proc(LibC::UIntPtrT, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias SpVerifySignatureFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias SpSealMessageFn = Proc(LibC::UIntPtrT, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias SpUnsealMessageFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias SpGetContextTokenFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::NTSTATUS)

  alias SpExportSecurityContextFn = Proc(LibC::UIntPtrT, UInt32, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::NTSTATUS)

  alias SpImportSecurityContextFn = Proc(Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::HANDLE, LibC::UIntPtrT*, Win32cr::Foundation::NTSTATUS)

  alias SpCompleteAuthTokenFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::NTSTATUS)

  alias SpFormatCredentialsFn = Proc(Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Security::Authentication::Identity::SecBuffer*, Win32cr::Foundation::NTSTATUS)

  alias SpMarshallSupplementalCredsFn = Proc(UInt32, UInt8*, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias SpMarshalAttributeDataFn = Proc(UInt32, UInt32, UInt32, UInt8*, UInt32*, UInt8**, Win32cr::Foundation::NTSTATUS)

  alias SpLsaModeInitializeFn = Proc(UInt32, UInt32*, Win32cr::Security::Authentication::Identity::SECPKG_FUNCTION_TABLE**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias SpUserModeInitializeFn = Proc(UInt32, UInt32*, Win32cr::Security::Authentication::Identity::SECPKG_USER_FUNCTION_TABLE**, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias PKSEC_CREATE_CONTEXT_LIST = Proc(Win32cr::Security::Authentication::Identity::KSEC_CONTEXT_TYPE, Void*)

  alias PKSEC_INSERT_LIST_ENTRY = Proc(Void*, Win32cr::Security::Authentication::Identity::KSEC_LIST_ENTRY*, Void)

  alias PKSEC_REFERENCE_LIST_ENTRY = Proc(Win32cr::Security::Authentication::Identity::KSEC_LIST_ENTRY*, UInt32, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::NTSTATUS)

  alias PKSEC_DEREFERENCE_LIST_ENTRY = Proc(Win32cr::Security::Authentication::Identity::KSEC_LIST_ENTRY*, UInt8*, Void)

  alias PKSEC_SERIALIZE_WINNT_AUTH_DATA = Proc(Void*, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA = Proc(Void*, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias PKSEC_LOCATE_PKG_BY_ID = Proc(UInt32, Void*)

  alias KspInitPackageFn = Proc(Win32cr::Security::Authentication::Identity::SECPKG_KERNEL_FUNCTIONS*, Win32cr::Foundation::NTSTATUS)

  alias KspDeleteContextFn = Proc(LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::NTSTATUS)

  alias KspInitContextFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBuffer*, LibC::UIntPtrT*, Win32cr::Foundation::NTSTATUS)

  alias KspMakeSignatureFn = Proc(LibC::UIntPtrT, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias KspVerifySignatureFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias KspSealMessageFn = Proc(LibC::UIntPtrT, UInt32, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, Win32cr::Foundation::NTSTATUS)

  alias KspUnsealMessageFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, UInt32, UInt32*, Win32cr::Foundation::NTSTATUS)

  alias KspGetTokenFn = Proc(LibC::UIntPtrT, Win32cr::Foundation::HANDLE*, Void**, Win32cr::Foundation::NTSTATUS)

  alias KspQueryAttributesFn = Proc(LibC::UIntPtrT, UInt32, Void*, Win32cr::Foundation::NTSTATUS)

  alias KspCompleteTokenFn = Proc(LibC::UIntPtrT, Win32cr::Security::Authentication::Identity::SecBufferDesc*, Win32cr::Foundation::NTSTATUS)

  alias KspMapHandleFn = Proc(LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::NTSTATUS)

  alias KspSetPagingModeFn = Proc(Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::NTSTATUS)

  alias KspSerializeAuthDataFn = Proc(Void*, UInt32*, Void**, Win32cr::Foundation::NTSTATUS)

  alias SSL_EMPTY_CACHE_FN_A = Proc(Win32cr::Foundation::PSTR, UInt32, Win32cr::Foundation::BOOL)

  alias SSL_EMPTY_CACHE_FN_W = Proc(Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL)

  alias SSL_CRACK_CERTIFICATE_FN = Proc(UInt8*, UInt32, Win32cr::Foundation::BOOL, Win32cr::Security::Authentication::Identity::X509Certificate**, Win32cr::Foundation::BOOL)

  alias SSL_FREE_CERTIFICATE_FN = Proc(Win32cr::Security::Authentication::Identity::X509Certificate*, Void)

  alias SslGetServerIdentityFn = Proc(UInt8*, UInt32, UInt8**, UInt32*, UInt32, Win32cr::Foundation::HRESULT)

  alias SslGetExtensionsFn = Proc(UInt8*, UInt32, Win32cr::Security::Authentication::Identity::SCH_EXTENSION_DATA*, UInt8, UInt32*, Win32cr::Security::Authentication::Identity::SchGetExtensionsOptions, Win32cr::Foundation::HRESULT)

  NTLMSP_NAME_A = "NTLM"
  NTLMSP_NAME = "NTLM"
  MICROSOFT_KERBEROS_NAME_A = "Kerberos"
  MICROSOFT_KERBEROS_NAME_W = "Kerberos"
  MICROSOFT_KERBEROS_NAME = "Kerberos"
  NEGOSSP_NAME_W = "Negotiate"
  NEGOSSP_NAME_A = "Negotiate"
  NEGOSSP_NAME = "Negotiate"
  CLOUDAP_NAME_W = "CloudAP"
  ClOUDAP_NAME_A = "CloudAP"
  CLOUDAP_NAME = "CloudAP"
  ISSP_LEVEL = 32_u32
  ISSP_MODE = 1_u32
  SECPKG_FLAG_INTEGRITY = 1_u32
  SECPKG_FLAG_PRIVACY = 2_u32
  SECPKG_FLAG_TOKEN_ONLY = 4_u32
  SECPKG_FLAG_DATAGRAM = 8_u32
  SECPKG_FLAG_CONNECTION = 16_u32
  SECPKG_FLAG_MULTI_REQUIRED = 32_u32
  SECPKG_FLAG_CLIENT_ONLY = 64_u32
  SECPKG_FLAG_EXTENDED_ERROR = 128_u32
  SECPKG_FLAG_IMPERSONATION = 256_u32
  SECPKG_FLAG_ACCEPT_WIN32_NAME = 512_u32
  SECPKG_FLAG_STREAM = 1024_u32
  SECPKG_FLAG_NEGOTIABLE = 2048_u32
  SECPKG_FLAG_GSS_COMPATIBLE = 4096_u32
  SECPKG_FLAG_LOGON = 8192_u32
  SECPKG_FLAG_ASCII_BUFFERS = 16384_u32
  SECPKG_FLAG_FRAGMENT = 32768_u32
  SECPKG_FLAG_MUTUAL_AUTH = 65536_u32
  SECPKG_FLAG_DELEGATION = 131072_u32
  SECPKG_FLAG_READONLY_WITH_CHECKSUM = 262144_u32
  SECPKG_FLAG_RESTRICTED_TOKENS = 524288_u32
  SECPKG_FLAG_NEGO_EXTENDER = 1048576_u32
  SECPKG_FLAG_NEGOTIABLE2 = 2097152_u32
  SECPKG_FLAG_APPCONTAINER_PASSTHROUGH = 4194304_u32
  SECPKG_FLAG_APPCONTAINER_CHECKS = 8388608_u32
  SECPKG_FLAG_CREDENTIAL_ISOLATION_ENABLED = 16777216_u32
  SECPKG_FLAG_APPLY_LOOPBACK = 33554432_u32
  SECPKG_ID_NONE = 65535_u32
  SECPKG_CALLFLAGS_APPCONTAINER = 1_u32
  SECPKG_CALLFLAGS_APPCONTAINER_AUTHCAPABLE = 2_u32
  SECPKG_CALLFLAGS_FORCE_SUPPLIED = 4_u32
  SECPKG_CALLFLAGS_APPCONTAINER_UPNCAPABLE = 8_u32
  SECBUFFER_VERSION = 0_u32
  SECBUFFER_EMPTY = 0_u32
  SECBUFFER_DATA = 1_u32
  SECBUFFER_TOKEN = 2_u32
  SECBUFFER_PKG_PARAMS = 3_u32
  SECBUFFER_MISSING = 4_u32
  SECBUFFER_EXTRA = 5_u32
  SECBUFFER_STREAM_TRAILER = 6_u32
  SECBUFFER_STREAM_HEADER = 7_u32
  SECBUFFER_NEGOTIATION_INFO = 8_u32
  SECBUFFER_PADDING = 9_u32
  SECBUFFER_STREAM = 10_u32
  SECBUFFER_MECHLIST = 11_u32
  SECBUFFER_MECHLIST_SIGNATURE = 12_u32
  SECBUFFER_TARGET = 13_u32
  SECBUFFER_CHANNEL_BINDINGS = 14_u32
  SECBUFFER_CHANGE_PASS_RESPONSE = 15_u32
  SECBUFFER_TARGET_HOST = 16_u32
  SECBUFFER_ALERT = 17_u32
  SECBUFFER_APPLICATION_PROTOCOLS = 18_u32
  SECBUFFER_SRTP_PROTECTION_PROFILES = 19_u32
  SECBUFFER_SRTP_MASTER_KEY_IDENTIFIER = 20_u32
  SECBUFFER_TOKEN_BINDING = 21_u32
  SECBUFFER_PRESHARED_KEY = 22_u32
  SECBUFFER_PRESHARED_KEY_IDENTITY = 23_u32
  SECBUFFER_DTLS_MTU = 24_u32
  SECBUFFER_SEND_GENERIC_TLS_EXTENSION = 25_u32
  SECBUFFER_SUBSCRIBE_GENERIC_TLS_EXTENSION = 26_u32
  SECBUFFER_FLAGS = 27_u32
  SECBUFFER_TRAFFIC_SECRETS = 28_u32
  SECBUFFER_ATTRMASK = 4026531840_u32
  SECBUFFER_READONLY = 2147483648_u32
  SECBUFFER_READONLY_WITH_CHECKSUM = 268435456_u32
  SECBUFFER_RESERVED = 1610612736_u32
  SZ_ALG_MAX_SIZE = 64_u32
  SECURITY_NATIVE_DREP = 16_u32
  SECURITY_NETWORK_DREP = 0_u32
  SECPKG_CRED_BOTH = 3_u32
  SECPKG_CRED_DEFAULT = 4_u32
  SECPKG_CRED_RESERVED = 4026531840_u32
  SECPKG_CRED_AUTOLOGON_RESTRICTED = 16_u32
  SECPKG_CRED_PROCESS_POLICY_ONLY = 32_u32
  ISC_RET_DELEGATE = 1_u32
  ISC_RET_MUTUAL_AUTH = 2_u32
  ISC_RET_REPLAY_DETECT = 4_u32
  ISC_RET_SEQUENCE_DETECT = 8_u32
  ISC_RET_CONFIDENTIALITY = 16_u32
  ISC_RET_USE_SESSION_KEY = 32_u32
  ISC_RET_USED_COLLECTED_CREDS = 64_u32
  ISC_RET_USED_SUPPLIED_CREDS = 128_u32
  ISC_RET_ALLOCATED_MEMORY = 256_u32
  ISC_RET_USED_DCE_STYLE = 512_u32
  ISC_RET_DATAGRAM = 1024_u32
  ISC_RET_CONNECTION = 2048_u32
  ISC_RET_INTERMEDIATE_RETURN = 4096_u32
  ISC_RET_CALL_LEVEL = 8192_u32
  ISC_RET_EXTENDED_ERROR = 16384_u32
  ISC_RET_STREAM = 32768_u32
  ISC_RET_INTEGRITY = 65536_u32
  ISC_RET_IDENTIFY = 131072_u32
  ISC_RET_NULL_SESSION = 262144_u32
  ISC_RET_MANUAL_CRED_VALIDATION = 524288_u32
  ISC_RET_RESERVED1 = 1048576_u32
  ISC_RET_FRAGMENT_ONLY = 2097152_u32
  ISC_RET_FORWARD_CREDENTIALS = 4194304_u32
  ISC_RET_USED_HTTP_STYLE = 16777216_u32
  ISC_RET_NO_ADDITIONAL_TOKEN = 33554432_u32
  ISC_RET_REAUTHENTICATION = 134217728_u32
  ISC_RET_CONFIDENTIALITY_ONLY = 1073741824_u32
  ISC_RET_MESSAGES = 4294967296_u64
  ISC_RET_DEFERRED_CRED_VALIDATION = 8589934592_u64
  ASC_RET_DELEGATE = 1_u32
  ASC_RET_MUTUAL_AUTH = 2_u32
  ASC_RET_REPLAY_DETECT = 4_u32
  ASC_RET_SEQUENCE_DETECT = 8_u32
  ASC_RET_CONFIDENTIALITY = 16_u32
  ASC_RET_USE_SESSION_KEY = 32_u32
  ASC_RET_SESSION_TICKET = 64_u32
  ASC_RET_ALLOCATED_MEMORY = 256_u32
  ASC_RET_USED_DCE_STYLE = 512_u32
  ASC_RET_DATAGRAM = 1024_u32
  ASC_RET_CONNECTION = 2048_u32
  ASC_RET_CALL_LEVEL = 8192_u32
  ASC_RET_THIRD_LEG_FAILED = 16384_u32
  ASC_RET_EXTENDED_ERROR = 32768_u32
  ASC_RET_STREAM = 65536_u32
  ASC_RET_INTEGRITY = 131072_u32
  ASC_RET_LICENSING = 262144_u32
  ASC_RET_IDENTIFY = 524288_u32
  ASC_RET_NULL_SESSION = 1048576_u32
  ASC_RET_ALLOW_NON_USER_LOGONS = 2097152_u32
  ASC_RET_ALLOW_CONTEXT_REPLAY = 4194304_u32
  ASC_RET_FRAGMENT_ONLY = 8388608_u32
  ASC_RET_NO_TOKEN = 16777216_u32
  ASC_RET_NO_ADDITIONAL_TOKEN = 33554432_u32
  ASC_RET_MESSAGES = 4294967296_u64
  SECPKG_CRED_ATTR_NAMES = 1_u32
  SECPKG_CRED_ATTR_SSI_PROVIDER = 2_u32
  SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS = 3_u32
  SECPKG_CRED_ATTR_CERT = 4_u32
  SECPKG_CRED_ATTR_PAC_BYPASS = 5_u32
  KDC_PROXY_SETTINGS_V1 = 1_u32
  KDC_PROXY_SETTINGS_FLAGS_FORCEPROXY = 1_u32
  SECPKG_ATTR_PROTO_INFO = 7_u32
  SECPKG_ATTR_USER_FLAGS = 11_u32
  SECPKG_ATTR_USE_VALIDATED = 15_u32
  SECPKG_ATTR_CREDENTIAL_NAME = 16_u32
  SECPKG_ATTR_TARGET = 19_u32
  SECPKG_ATTR_AUTHENTICATION_ID = 20_u32
  SECPKG_ATTR_LOGOFF_TIME = 21_u32
  SECPKG_ATTR_NEGO_KEYS = 22_u32
  SECPKG_ATTR_PROMPTING_NEEDED = 24_u32
  SECPKG_ATTR_NEGO_PKG_INFO = 31_u32
  SECPKG_ATTR_NEGO_STATUS = 32_u32
  SECPKG_ATTR_CONTEXT_DELETED = 33_u32
  SECPKG_ATTR_APPLICATION_PROTOCOL = 35_u32
  SECPKG_ATTR_NEGOTIATED_TLS_EXTENSIONS = 36_u32
  SECPKG_ATTR_IS_LOOPBACK = 37_u32
  SECPKG_ATTR_NEGO_INFO_FLAG_NO_KERBEROS = 1_u32
  SECPKG_ATTR_NEGO_INFO_FLAG_NO_NTLM = 2_u32
  SECPKG_NEGOTIATION_COMPLETE = 0_u32
  SECPKG_NEGOTIATION_OPTIMISTIC = 1_u32
  SECPKG_NEGOTIATION_IN_PROGRESS = 2_u32
  SECPKG_NEGOTIATION_DIRECT = 3_u32
  SECPKG_NEGOTIATION_TRY_MULTICRED = 4_u32
  MAX_PROTOCOL_ID_SIZE = 255_u32
  SECQOP_WRAP_NO_ENCRYPT = 2147483649_u32
  SECQOP_WRAP_OOB_DATA = 1073741824_u32
  SECURITY_ENTRYPOINT_ANSIW = "InitSecurityInterfaceW"
  SECURITY_ENTRYPOINT_ANSIA = "InitSecurityInterfaceA"
  SECURITY_ENTRYPOINT16 = "INITSECURITYINTERFACEA"
  SECURITY_ENTRYPOINT_ANSI = "InitSecurityInterfaceW"
  SECURITY_ENTRYPOINT = "INITSECURITYINTERFACEA"
  SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION = 1_u32
  SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_2 = 2_u32
  SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_3 = 3_u32
  SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_4 = 4_u32
  SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_5 = 5_u32
  SASL_OPTION_SEND_SIZE = 1_u32
  SASL_OPTION_RECV_SIZE = 2_u32
  SASL_OPTION_AUTHZ_STRING = 3_u32
  SASL_OPTION_AUTHZ_PROCESSING = 4_u32
  SEC_WINNT_AUTH_IDENTITY_VERSION_2 = 513_u32
  SEC_WINNT_AUTH_IDENTITY_VERSION = 512_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED = 16_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED = 32_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED = 64_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_ENCRYPTED = 128_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED = 65536_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_USER = 131072_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_DOMAIN = 262144_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER = 524288_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_USE_MASK = 4278190080_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_SAVE = 2147483648_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER = 2147483648_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED = 1073741824_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_NO_CHECKBOX = 536870912_u32
  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_LOAD = 268435456_u32
  SSPIPFC_CREDPROV_DO_NOT_SAVE = 1_u32
  SSPIPFC_SAVE_CRED_BY_CALLER = 1_u32
  SSPIPFC_NO_CHECKBOX = 2_u32
  SSPIPFC_CREDPROV_DO_NOT_LOAD = 4_u32
  SSPIPFC_USE_CREDUIBROKER = 8_u32
  NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES = 1_u32
  NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO = 2_u32
  NGC_DATA_FLAG_IS_SMARTCARD_DATA = 4_u32
  NGC_DATA_FLAG_IS_CLOUD_TRUST_CRED = 8_u32
  SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON = 1_u32
  SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_PROCESS = 2_u32
  SEC_WINNT_AUTH_IDENTITY_ENCRYPT_FOR_SYSTEM = 4_u32
  SEC_WINNT_AUTH_IDENTITY_MARSHALLED = 4_u32
  SEC_WINNT_AUTH_IDENTITY_ONLY = 8_u32
  SECPKG_OPTIONS_PERMANENT = 1_u32
  LOOKUP_VIEW_LOCAL_INFORMATION = 1_u32
  LOOKUP_TRANSLATE_NAMES = 2048_u32
  SECPKG_ATTR_ISSUER_LIST = 80_u32
  SECPKG_ATTR_REMOTE_CRED = 81_u32
  SECPKG_ATTR_SUPPORTED_ALGS = 86_u32
  SECPKG_ATTR_CIPHER_STRENGTHS = 87_u32
  SECPKG_ATTR_SUPPORTED_PROTOCOLS = 88_u32
  SECPKG_ATTR_MAPPED_CRED_ATTR = 92_u32
  SECPKG_ATTR_REMOTE_CERTIFICATES = 95_u32
  SECPKG_ATTR_CLIENT_CERT_POLICY = 96_u32
  SECPKG_ATTR_CC_POLICY_RESULT = 97_u32
  SECPKG_ATTR_USE_NCRYPT = 98_u32
  SECPKG_ATTR_LOCAL_CERT_INFO = 99_u32
  SECPKG_ATTR_CIPHER_INFO = 100_u32
  SECPKG_ATTR_REMOTE_CERT_CHAIN = 103_u32
  SECPKG_ATTR_UI_INFO = 104_u32
  SECPKG_ATTR_KEYING_MATERIAL = 107_u32
  SECPKG_ATTR_SRTP_PARAMETERS = 108_u32
  SECPKG_ATTR_TOKEN_BINDING = 109_u32
  SECPKG_ATTR_CONNECTION_INFO_EX = 110_u32
  SECPKG_ATTR_KEYING_MATERIAL_TOKEN_BINDING = 111_u32
  SECPKG_ATTR_KEYING_MATERIAL_INPROC = 112_u32
  SECPKG_ATTR_CERT_CHECK_RESULT = 113_u32
  SECPKG_ATTR_CERT_CHECK_RESULT_INPROC = 114_u32
  SECPKG_ATTR_SESSION_TICKET_KEYS = 115_u32
  SESSION_TICKET_INFO_V0 = 0_u32
  SESSION_TICKET_INFO_VERSION = 0_u32
  LSA_MODE_PASSWORD_PROTECTED = 1_i32
  LSA_MODE_INDIVIDUAL_ACCOUNTS = 2_i32
  LSA_MODE_MANDATORY_ACCESS = 4_i32
  LSA_MODE_LOG_FULL = 8_i32
  LSA_MAXIMUM_SID_COUNT = 256_i32
  LSA_MAXIMUM_ENUMERATION_LENGTH = 32000_u32
  LSA_CALL_LICENSE_SERVER = 2147483648_u32
  SE_ADT_OBJECT_ONLY = 1_u32
  SE_MAX_AUDIT_PARAMETERS = 32_u32
  SE_MAX_GENERIC_AUDIT_PARAMETERS = 28_u32
  SE_ADT_PARAMETERS_SELF_RELATIVE = 1_u32
  SE_ADT_PARAMETERS_SEND_TO_LSA = 2_u32
  SE_ADT_PARAMETER_EXTENSIBLE_AUDIT = 4_u32
  SE_ADT_PARAMETER_GENERIC_AUDIT = 8_u32
  SE_ADT_PARAMETER_WRITE_SYNCHRONOUS = 16_u32
  LSA_ADT_SECURITY_SOURCE_NAME = "Microsoft-Windows-Security-Auditing"
  LSA_ADT_LEGACY_SECURITY_SOURCE_NAME = "Security"
  SE_ADT_POLICY_AUDIT_EVENT_TYPE_EX_BEGIN = 100_u32
  POLICY_AUDIT_EVENT_UNCHANGED = 0_i32
  POLICY_AUDIT_EVENT_SUCCESS = 1_i32
  POLICY_AUDIT_EVENT_FAILURE = 2_i32
  POLICY_AUDIT_EVENT_NONE = 4_i32
  LSA_AP_NAME_INITIALIZE_PACKAGE = "LsaApInitializePackage\u0000"
  LSA_AP_NAME_LOGON_USER = "LsaApLogonUser\u0000"
  LSA_AP_NAME_LOGON_USER_EX = "LsaApLogonUserEx\u0000"
  LSA_AP_NAME_CALL_PACKAGE = "LsaApCallPackage\u0000"
  LSA_AP_NAME_LOGON_TERMINATED = "LsaApLogonTerminated\u0000"
  LSA_AP_NAME_CALL_PACKAGE_UNTRUSTED = "LsaApCallPackageUntrusted\u0000"
  LSA_AP_NAME_CALL_PACKAGE_PASSTHROUGH = "LsaApCallPackagePassthrough\u0000"
  POLICY_VIEW_LOCAL_INFORMATION = 1_i32
  POLICY_VIEW_AUDIT_INFORMATION = 2_i32
  POLICY_GET_PRIVATE_INFORMATION = 4_i32
  POLICY_TRUST_ADMIN = 8_i32
  POLICY_CREATE_ACCOUNT = 16_i32
  POLICY_CREATE_SECRET = 32_i32
  POLICY_CREATE_PRIVILEGE = 64_i32
  POLICY_SET_DEFAULT_QUOTA_LIMITS = 128_i32
  POLICY_SET_AUDIT_REQUIREMENTS = 256_i32
  POLICY_AUDIT_LOG_ADMIN = 512_i32
  POLICY_SERVER_ADMIN = 1024_i32
  POLICY_LOOKUP_NAMES = 2048_i32
  POLICY_NOTIFICATION = 4096_i32
  LSA_LOOKUP_ISOLATED_AS_LOCAL = 2147483648_u32
  LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID = 2147483648_u32
  LSA_LOOKUP_PREFER_INTERNET_NAMES = 1073741824_u32
  PER_USER_POLICY_UNCHANGED = 0_u32
  PER_USER_AUDIT_SUCCESS_INCLUDE = 1_u32
  PER_USER_AUDIT_SUCCESS_EXCLUDE = 2_u32
  PER_USER_AUDIT_FAILURE_INCLUDE = 4_u32
  PER_USER_AUDIT_FAILURE_EXCLUDE = 8_u32
  PER_USER_AUDIT_NONE = 16_u32
  POLICY_QOS_SCHANNEL_REQUIRED = 1_u32
  POLICY_QOS_OUTBOUND_INTEGRITY = 2_u32
  POLICY_QOS_OUTBOUND_CONFIDENTIALITY = 4_u32
  POLICY_QOS_INBOUND_INTEGRITY = 8_u32
  POLICY_QOS_INBOUND_CONFIDENTIALITY = 16_u32
  POLICY_QOS_ALLOW_LOCAL_ROOT_CERT_STORE = 32_u32
  POLICY_QOS_RAS_SERVER_ALLOWED = 64_u32
  POLICY_QOS_DHCP_SERVER_ALLOWED = 128_u32
  POLICY_KERBEROS_VALIDATE_CLIENT = 128_u32
  ACCOUNT_VIEW = 1_i32
  ACCOUNT_ADJUST_PRIVILEGES = 2_i32
  ACCOUNT_ADJUST_QUOTAS = 4_i32
  ACCOUNT_ADJUST_SYSTEM_ACCESS = 8_i32
  TRUSTED_QUERY_DOMAIN_NAME = 1_i32
  TRUSTED_QUERY_CONTROLLERS = 2_i32
  TRUSTED_SET_CONTROLLERS = 4_i32
  TRUSTED_QUERY_POSIX = 8_i32
  TRUSTED_SET_POSIX = 16_i32
  TRUSTED_SET_AUTH = 32_i32
  TRUSTED_QUERY_AUTH = 64_i32
  TRUST_ATTRIBUTE_TREE_PARENT = 4194304_u32
  TRUST_ATTRIBUTE_TREE_ROOT = 8388608_u32
  TRUST_ATTRIBUTES_VALID = 4278386687_u32
  TRUST_ATTRIBUTE_QUARANTINED_DOMAIN = 4_u32
  TRUST_ATTRIBUTE_TRUST_USES_RC4_ENCRYPTION = 128_u32
  TRUST_ATTRIBUTE_TRUST_USES_AES_KEYS = 256_u32
  TRUST_ATTRIBUTE_CROSS_ORGANIZATION_NO_TGT_DELEGATION = 512_u32
  TRUST_ATTRIBUTE_PIM_TRUST = 1024_u32
  TRUST_ATTRIBUTE_CROSS_ORGANIZATION_ENABLE_TGT_DELEGATION = 2048_u32
  TRUST_ATTRIBUTES_USER = 4278190080_u32
  LSA_FOREST_TRUST_RECORD_TYPE_UNRECOGNIZED = 2147483648_u32
  LSA_FTRECORD_DISABLED_REASONS = 65535_i32
  LSA_TLN_DISABLED_NEW = 1_i32
  LSA_TLN_DISABLED_ADMIN = 2_i32
  LSA_TLN_DISABLED_CONFLICT = 4_i32
  LSA_SID_DISABLED_ADMIN = 1_i32
  LSA_SID_DISABLED_CONFLICT = 2_i32
  LSA_NB_DISABLED_ADMIN = 4_i32
  LSA_NB_DISABLED_CONFLICT = 8_i32
  MAX_RECORDS_IN_FOREST_TRUST_INFO = 4000_u32
  SECRET_SET_VALUE = 1_i32
  SECRET_QUERY_VALUE = 2_i32
  LSA_GLOBAL_SECRET_PREFIX = "G$"
  LSA_GLOBAL_SECRET_PREFIX_LENGTH = 2_u32
  LSA_LOCAL_SECRET_PREFIX = "L$"
  LSA_LOCAL_SECRET_PREFIX_LENGTH = 2_u32
  LSA_MACHINE_SECRET_PREFIX = "M$"
  LSA_SECRET_MAXIMUM_COUNT = 4096_i32
  LSA_SECRET_MAXIMUM_LENGTH = 512_i32
  MAXIMUM_CAPES_PER_CAP = 127_u32
  CENTRAL_ACCESS_POLICY_OWNER_RIGHTS_PRESENT_FLAG = 1_u32
  CENTRAL_ACCESS_POLICY_STAGED_OWNER_RIGHTS_PRESENT_FLAG = 256_u32
  CENTRAL_ACCESS_POLICY_STAGED_FLAG = 65536_u32
  LSASETCAPS_RELOAD_FLAG = 1_u32
  LSASETCAPS_VALID_FLAG_MASK = 1_u32
  SE_INTERACTIVE_LOGON_NAME = "SeInteractiveLogonRight"
  SE_NETWORK_LOGON_NAME = "SeNetworkLogonRight"
  SE_BATCH_LOGON_NAME = "SeBatchLogonRight"
  SE_SERVICE_LOGON_NAME = "SeServiceLogonRight"
  SE_DENY_INTERACTIVE_LOGON_NAME = "SeDenyInteractiveLogonRight"
  SE_DENY_NETWORK_LOGON_NAME = "SeDenyNetworkLogonRight"
  SE_DENY_BATCH_LOGON_NAME = "SeDenyBatchLogonRight"
  SE_DENY_SERVICE_LOGON_NAME = "SeDenyServiceLogonRight"
  SE_REMOTE_INTERACTIVE_LOGON_NAME = "SeRemoteInteractiveLogonRight"
  SE_DENY_REMOTE_INTERACTIVE_LOGON_NAME = "SeDenyRemoteInteractiveLogonRight"
  NEGOTIATE_MAX_PREFIX = 32_u32
  NEGOTIATE_ALLOW_NTLM = 268435456_u32
  NEGOTIATE_NEG_NTLM = 536870912_u32
  MAX_USER_RECORDS = 1000_u32
  Audit_System_SecurityStateChange = "0cce9210-69ae-11d9-bed3-505054503030"
  Audit_System_SecuritySubsystemExtension = "0cce9211-69ae-11d9-bed3-505054503030"
  Audit_System_Integrity = "0cce9212-69ae-11d9-bed3-505054503030"
  Audit_System_IPSecDriverEvents = "0cce9213-69ae-11d9-bed3-505054503030"
  Audit_System_Others = "0cce9214-69ae-11d9-bed3-505054503030"
  Audit_Logon_Logon = "0cce9215-69ae-11d9-bed3-505054503030"
  Audit_Logon_Logoff = "0cce9216-69ae-11d9-bed3-505054503030"
  Audit_Logon_AccountLockout = "0cce9217-69ae-11d9-bed3-505054503030"
  Audit_Logon_IPSecMainMode = "0cce9218-69ae-11d9-bed3-505054503030"
  Audit_Logon_IPSecQuickMode = "0cce9219-69ae-11d9-bed3-505054503030"
  Audit_Logon_IPSecUserMode = "0cce921a-69ae-11d9-bed3-505054503030"
  Audit_Logon_SpecialLogon = "0cce921b-69ae-11d9-bed3-505054503030"
  Audit_Logon_Others = "0cce921c-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_FileSystem = "0cce921d-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_Registry = "0cce921e-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_Kernel = "0cce921f-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_Sam = "0cce9220-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_CertificationServices = "0cce9221-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_ApplicationGenerated = "0cce9222-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_Handle = "0cce9223-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_Share = "0cce9224-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_FirewallPacketDrops = "0cce9225-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_FirewallConnection = "0cce9226-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_Other = "0cce9227-69ae-11d9-bed3-505054503030"
  Audit_PrivilegeUse_Sensitive = "0cce9228-69ae-11d9-bed3-505054503030"
  Audit_PrivilegeUse_NonSensitive = "0cce9229-69ae-11d9-bed3-505054503030"
  Audit_PrivilegeUse_Others = "0cce922a-69ae-11d9-bed3-505054503030"
  Audit_DetailedTracking_ProcessCreation = "0cce922b-69ae-11d9-bed3-505054503030"
  Audit_DetailedTracking_ProcessTermination = "0cce922c-69ae-11d9-bed3-505054503030"
  Audit_DetailedTracking_DpapiActivity = "0cce922d-69ae-11d9-bed3-505054503030"
  Audit_DetailedTracking_RpcCall = "0cce922e-69ae-11d9-bed3-505054503030"
  Audit_PolicyChange_AuditPolicy = "0cce922f-69ae-11d9-bed3-505054503030"
  Audit_PolicyChange_AuthenticationPolicy = "0cce9230-69ae-11d9-bed3-505054503030"
  Audit_PolicyChange_AuthorizationPolicy = "0cce9231-69ae-11d9-bed3-505054503030"
  Audit_PolicyChange_MpsscvRulePolicy = "0cce9232-69ae-11d9-bed3-505054503030"
  Audit_PolicyChange_WfpIPSecPolicy = "0cce9233-69ae-11d9-bed3-505054503030"
  Audit_PolicyChange_Others = "0cce9234-69ae-11d9-bed3-505054503030"
  Audit_AccountManagement_UserAccount = "0cce9235-69ae-11d9-bed3-505054503030"
  Audit_AccountManagement_ComputerAccount = "0cce9236-69ae-11d9-bed3-505054503030"
  Audit_AccountManagement_SecurityGroup = "0cce9237-69ae-11d9-bed3-505054503030"
  Audit_AccountManagement_DistributionGroup = "0cce9238-69ae-11d9-bed3-505054503030"
  Audit_AccountManagement_ApplicationGroup = "0cce9239-69ae-11d9-bed3-505054503030"
  Audit_AccountManagement_Others = "0cce923a-69ae-11d9-bed3-505054503030"
  Audit_DSAccess_DSAccess = "0cce923b-69ae-11d9-bed3-505054503030"
  Audit_DsAccess_AdAuditChanges = "0cce923c-69ae-11d9-bed3-505054503030"
  Audit_Ds_Replication = "0cce923d-69ae-11d9-bed3-505054503030"
  Audit_Ds_DetailedReplication = "0cce923e-69ae-11d9-bed3-505054503030"
  Audit_AccountLogon_CredentialValidation = "0cce923f-69ae-11d9-bed3-505054503030"
  Audit_AccountLogon_Kerberos = "0cce9240-69ae-11d9-bed3-505054503030"
  Audit_AccountLogon_Others = "0cce9241-69ae-11d9-bed3-505054503030"
  Audit_AccountLogon_KerbCredentialValidation = "0cce9242-69ae-11d9-bed3-505054503030"
  Audit_Logon_NPS = "0cce9243-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_DetailedFileShare = "0cce9244-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_RemovableStorage = "0cce9245-69ae-11d9-bed3-505054503030"
  Audit_ObjectAccess_CbacStaging = "0cce9246-69ae-11d9-bed3-505054503030"
  Audit_Logon_Claims = "0cce9247-69ae-11d9-bed3-505054503030"
  Audit_DetailedTracking_PnpActivity = "0cce9248-69ae-11d9-bed3-505054503030"
  Audit_Logon_Groups = "0cce9249-69ae-11d9-bed3-505054503030"
  Audit_DetailedTracking_TokenRightAdjusted = "0cce924a-69ae-11d9-bed3-505054503030"
  Audit_System = "69979848-797a-11d9-bed3-505054503030"
  Audit_Logon = "69979849-797a-11d9-bed3-505054503030"
  Audit_ObjectAccess = "6997984a-797a-11d9-bed3-505054503030"
  Audit_PrivilegeUse = "6997984b-797a-11d9-bed3-505054503030"
  Audit_DetailedTracking = "6997984c-797a-11d9-bed3-505054503030"
  Audit_PolicyChange = "6997984d-797a-11d9-bed3-505054503030"
  Audit_AccountManagement = "6997984e-797a-11d9-bed3-505054503030"
  Audit_DirectoryServiceAccess = "6997984f-797a-11d9-bed3-505054503030"
  Audit_AccountLogon = "69979850-797a-11d9-bed3-505054503030"
  DOMAIN_NO_LM_OWF_CHANGE = 64_i32
  SAM_PASSWORD_CHANGE_NOTIFY_ROUTINE = "PasswordChangeNotify"
  SAM_INIT_NOTIFICATION_ROUTINE = "InitializeChangeNotify"
  SAM_PASSWORD_FILTER_ROUTINE = "PasswordFilter"
  MSV1_0_PACKAGE_NAME = "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0"
  MSV1_0_PACKAGE_NAMEW = "MICROSOFT_AUTHENTICATION_PACKAGE_V1_0"
  MSV1_0_SUBAUTHENTICATION_KEY = "SYSTEM\\CurrentControlSet\\Control\\Lsa\\MSV1_0"
  MSV1_0_SUBAUTHENTICATION_VALUE = "Auth"
  MSV1_0_CHALLENGE_LENGTH = 8_u32
  MSV1_0_USER_SESSION_KEY_LENGTH = 16_u32
  MSV1_0_LANMAN_SESSION_KEY_LENGTH = 8_u32
  MSV1_0_USE_CLIENT_CHALLENGE = 128_u32
  MSV1_0_DISABLE_PERSONAL_FALLBACK = 4096_u32
  MSV1_0_ALLOW_FORCE_GUEST = 8192_u32
  MSV1_0_CLEARTEXT_PASSWORD_SUPPLIED = 16384_u32
  MSV1_0_USE_DOMAIN_FOR_ROUTING_ONLY = 32768_u32
  MSV1_0_SUBAUTHENTICATION_DLL_EX = 1048576_u32
  MSV1_0_ALLOW_MSVCHAPV2 = 65536_u32
  MSV1_0_S4U2SELF = 131072_u32
  MSV1_0_CHECK_LOGONHOURS_FOR_S4U = 262144_u32
  MSV1_0_INTERNET_DOMAIN = 524288_u32
  MSV1_0_SUBAUTHENTICATION_DLL = 4278190080_u32
  MSV1_0_SUBAUTHENTICATION_DLL_SHIFT = 24_u32
  MSV1_0_MNS_LOGON = 16777216_u32
  MSV1_0_SUBAUTHENTICATION_DLL_RAS = 2_u32
  MSV1_0_SUBAUTHENTICATION_DLL_IIS = 132_u32
  MSV1_0_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 2_u32
  LOGON_NTLMV2_ENABLED = 256_u32
  LOGON_NT_V2 = 2048_u32
  LOGON_LM_V2 = 4096_u32
  LOGON_NTLM_V2 = 8192_u32
  LOGON_OPTIMIZED = 16384_u32
  LOGON_WINLOGON = 32768_u32
  LOGON_PKINIT = 65536_u32
  LOGON_NO_OPTIMIZED = 131072_u32
  LOGON_NO_ELEVATION = 262144_u32
  LOGON_MANAGED_SERVICE = 524288_u32
  MSV1_0_SUBAUTHENTICATION_FLAGS = 4278190080_u32
  LOGON_GRACE_LOGON = 16777216_u32
  MSV1_0_OWF_PASSWORD_LENGTH = 16_u32
  MSV1_0_SHA_PASSWORD_LENGTH = 20_u32
  MSV1_0_CREDENTIAL_KEY_LENGTH = 20_u32
  MSV1_0_CRED_REMOVED = 4_u32
  MSV1_0_CRED_CREDKEY_PRESENT = 8_u32
  MSV1_0_CRED_SHA_PRESENT = 16_u32
  MSV1_0_CRED_VERSION_V2 = 2_u32
  MSV1_0_CRED_VERSION_V3 = 4_u32
  MSV1_0_CRED_VERSION_IUM = 4294901761_u32
  MSV1_0_CRED_VERSION_REMOTE = 4294901762_u32
  MSV1_0_CRED_VERSION_ARSO = 4294901763_u32
  MSV1_0_CRED_VERSION_RESERVED_1 = 4294967294_u32
  MSV1_0_CRED_VERSION_INVALID = 4294967295_u32
  MSV1_0_NTLM3_RESPONSE_LENGTH = 16_u32
  MSV1_0_NTLM3_OWF_LENGTH = 16_u32
  MSV1_0_MAX_NTLM3_LIFE = 1800_u32
  MSV1_0_MAX_AVL_SIZE = 64000_u32
  MSV1_0_AV_FLAG_FORCE_GUEST = 1_u32
  MSV1_0_AV_FLAG_MIC_HANDSHAKE_MESSAGES = 2_u32
  MSV1_0_AV_FLAG_UNVERIFIED_TARGET = 4_u32
  RTL_ENCRYPT_MEMORY_SIZE = 8_u32
  RTL_ENCRYPT_OPTION_CROSS_PROCESS = 1_u32
  RTL_ENCRYPT_OPTION_SAME_LOGON = 2_u32
  RTL_ENCRYPT_OPTION_FOR_SYSTEM = 4_u32
  KERBEROS_VERSION = 5_u32
  KERBEROS_REVISION = 6_u32
  KERB_ETYPE_AES128_CTS_HMAC_SHA1_96 = 17_u32
  KERB_ETYPE_AES256_CTS_HMAC_SHA1_96 = 18_u32
  KERB_ETYPE_RC4_PLAIN2 = -129_i32
  KERB_ETYPE_RC4_LM = -130_i32
  KERB_ETYPE_RC4_SHA = -131_i32
  KERB_ETYPE_DES_PLAIN = -132_i32
  KERB_ETYPE_RC4_HMAC_OLD = -133_i32
  KERB_ETYPE_RC4_PLAIN_OLD = -134_i32
  KERB_ETYPE_RC4_HMAC_OLD_EXP = -135_i32
  KERB_ETYPE_RC4_PLAIN_OLD_EXP = -136_i32
  KERB_ETYPE_RC4_PLAIN = -140_i32
  KERB_ETYPE_RC4_PLAIN_EXP = -141_i32
  KERB_ETYPE_AES128_CTS_HMAC_SHA1_96_PLAIN = -148_i32
  KERB_ETYPE_AES256_CTS_HMAC_SHA1_96_PLAIN = -149_i32
  KERB_ETYPE_DSA_SHA1_CMS = 9_u32
  KERB_ETYPE_RSA_MD5_CMS = 10_u32
  KERB_ETYPE_RSA_SHA1_CMS = 11_u32
  KERB_ETYPE_RC2_CBC_ENV = 12_u32
  KERB_ETYPE_RSA_ENV = 13_u32
  KERB_ETYPE_RSA_ES_OEAP_ENV = 14_u32
  KERB_ETYPE_DES_EDE3_CBC_ENV = 15_u32
  KERB_ETYPE_DSA_SIGN = 8_u32
  KERB_ETYPE_RSA_PRIV = 9_u32
  KERB_ETYPE_RSA_PUB = 10_u32
  KERB_ETYPE_RSA_PUB_MD5 = 11_u32
  KERB_ETYPE_RSA_PUB_SHA1 = 12_u32
  KERB_ETYPE_PKCS7_PUB = 13_u32
  KERB_ETYPE_DES3_CBC_MD5 = 5_u32
  KERB_ETYPE_DES3_CBC_SHA1 = 7_u32
  KERB_ETYPE_DES3_CBC_SHA1_KD = 16_u32
  KERB_ETYPE_DES_CBC_MD5_NT = 20_u32
  KERB_ETYPE_RC4_HMAC_NT_EXP = 24_u32
  KERB_CHECKSUM_NONE = 0_u32
  KERB_CHECKSUM_CRC32 = 1_u32
  KERB_CHECKSUM_MD4 = 2_u32
  KERB_CHECKSUM_KRB_DES_MAC = 4_u32
  KERB_CHECKSUM_KRB_DES_MAC_K = 5_u32
  KERB_CHECKSUM_MD5 = 7_u32
  KERB_CHECKSUM_MD5_DES = 8_u32
  KERB_CHECKSUM_SHA1_NEW = 14_u32
  KERB_CHECKSUM_HMAC_SHA1_96_AES128 = 15_u32
  KERB_CHECKSUM_HMAC_SHA1_96_AES256 = 16_u32
  KERB_CHECKSUM_LM = -130_i32
  KERB_CHECKSUM_SHA1 = -131_i32
  KERB_CHECKSUM_REAL_CRC32 = -132_i32
  KERB_CHECKSUM_DES_MAC = -133_i32
  KERB_CHECKSUM_DES_MAC_MD5 = -134_i32
  KERB_CHECKSUM_MD25 = -135_i32
  KERB_CHECKSUM_RC4_MD5 = -136_i32
  KERB_CHECKSUM_MD5_HMAC = -137_i32
  KERB_CHECKSUM_HMAC_MD5 = -138_i32
  KERB_CHECKSUM_HMAC_SHA1_96_AES128_Ki = -150_i32
  KERB_CHECKSUM_HMAC_SHA1_96_AES256_Ki = -151_i32
  AUTH_REQ_ALLOW_FORWARDABLE = 1_u32
  AUTH_REQ_ALLOW_PROXIABLE = 2_u32
  AUTH_REQ_ALLOW_POSTDATE = 4_u32
  AUTH_REQ_ALLOW_RENEWABLE = 8_u32
  AUTH_REQ_ALLOW_NOADDRESS = 16_u32
  AUTH_REQ_ALLOW_ENC_TKT_IN_SKEY = 32_u32
  AUTH_REQ_ALLOW_VALIDATE = 64_u32
  AUTH_REQ_VALIDATE_CLIENT = 128_u32
  AUTH_REQ_OK_AS_DELEGATE = 256_u32
  AUTH_REQ_PREAUTH_REQUIRED = 512_u32
  AUTH_REQ_TRANSITIVE_TRUST = 1024_u32
  AUTH_REQ_ALLOW_S4U_DELEGATE = 2048_u32
  KERB_TICKET_FLAGS_name_canonicalize = 65536_u32
  KERB_TICKET_FLAGS_cname_in_pa_data = 262144_u32
  KERB_TICKET_FLAGS_enc_pa_rep = 65536_u32
  KRB_NT_UNKNOWN = 0_u32
  KRB_NT_PRINCIPAL = 1_u32
  KRB_NT_PRINCIPAL_AND_ID = -131_i32
  KRB_NT_SRV_INST = 2_u32
  KRB_NT_SRV_INST_AND_ID = -132_i32
  KRB_NT_SRV_HST = 3_u32
  KRB_NT_SRV_XHST = 4_u32
  KRB_NT_UID = 5_u32
  KRB_NT_ENTERPRISE_PRINCIPAL = 10_u32
  KRB_NT_WELLKNOWN = 11_u32
  KRB_NT_ENT_PRINCIPAL_AND_ID = -130_i32
  KRB_NT_MS_PRINCIPAL = -128_i32
  KRB_NT_MS_PRINCIPAL_AND_ID = -129_i32
  KRB_NT_MS_BRANCH_ID = -133_i32
  KRB_NT_X500_PRINCIPAL = 6_u32
  KRB_WELLKNOWN_STRING = "WELLKNOWN"
  KRB_ANONYMOUS_STRING = "ANONYMOUS"
  KERB_WRAP_NO_ENCRYPT = 2147483649_u32
  KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES = 1_u32
  KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO = 2_u32
  KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES = 1_u32
  KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 2_u32
  KERB_CERTIFICATE_S4U_LOGON_FLAG_FAIL_IF_NT_AUTH_POLICY_REQUIRED = 4_u32
  KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY = 8_u32
  KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET = 1_u32
  KERB_LOGON_FLAG_REDIRECTED = 2_u32
  KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 2_u32
  KERB_S4U_LOGON_FLAG_IDENTIFY = 8_u32
  KERB_USE_DEFAULT_TICKET_FLAGS = 0_u32
  KERB_RETRIEVE_TICKET_DEFAULT = 0_u32
  KERB_RETRIEVE_TICKET_DONT_USE_CACHE = 1_u32
  KERB_RETRIEVE_TICKET_USE_CACHE_ONLY = 2_u32
  KERB_RETRIEVE_TICKET_USE_CREDHANDLE = 4_u32
  KERB_RETRIEVE_TICKET_AS_KERB_CRED = 8_u32
  KERB_RETRIEVE_TICKET_WITH_SEC_CRED = 16_u32
  KERB_RETRIEVE_TICKET_CACHE_TICKET = 32_u32
  KERB_RETRIEVE_TICKET_MAX_LIFETIME = 64_u32
  KERB_ETYPE_DEFAULT = 0_u32
  KERB_PURGE_ALL_TICKETS = 1_u32
  KERB_S4U2PROXY_CACHE_ENTRY_INFO_FLAG_NEGATIVE = 1_u32
  KERB_S4U2PROXY_CRED_FLAG_NEGATIVE = 1_u32
  KERB_REFRESH_POLICY_KERBEROS = 1_u32
  KERB_REFRESH_POLICY_KDC = 2_u32
  KERB_CLOUD_KERBEROS_DEBUG_DATA_VERSION = 0_u32
  DS_UNKNOWN_ADDRESS_TYPE = 0_u32
  KERB_SETPASS_USE_LOGONID = 1_u32
  KERB_SETPASS_USE_CREDHANDLE = 2_u32
  KERB_DECRYPT_FLAG_DEFAULT_KEY = 1_u32
  KERB_REFRESH_SCCRED_RELEASE = 0_u32
  KERB_REFRESH_SCCRED_GETTGT = 1_u32
  KERB_TRANSFER_CRED_WITH_TICKETS = 1_u32
  KERB_TRANSFER_CRED_CLEANUP_CREDENTIALS = 2_u32
  KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE_FLAG_DAC_DISABLED = 1_u32
  AUDIT_SET_SYSTEM_POLICY = 1_u32
  AUDIT_QUERY_SYSTEM_POLICY = 2_u32
  AUDIT_SET_USER_POLICY = 4_u32
  AUDIT_QUERY_USER_POLICY = 8_u32
  AUDIT_ENUMERATE_USERS = 16_u32
  AUDIT_SET_MISC_POLICY = 32_u32
  AUDIT_QUERY_MISC_POLICY = 64_u32
  PKU2U_PACKAGE_NAME_A = "pku2u"
  PKU2U_PACKAGE_NAME = "pku2u"
  PKU2U_PACKAGE_NAME_W = "pku2u"
  SAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE = "CredentialUpdateNotify"
  SAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE = "CredentialUpdateRegister"
  SAM_CREDENTIAL_UPDATE_FREE_ROUTINE = "CredentialUpdateFree"
  SAM_CREDENTIAL_UPDATE_REGISTER_MAPPED_ENTRYPOINTS_ROUTINE = "RegisterMappedEntrypoints"
  SECPKG_CLIENT_PROCESS_TERMINATED = 1_u32
  SECPKG_CLIENT_THREAD_TERMINATED = 2_u32
  SECPKG_CALL_KERNEL_MODE = 1_u32
  SECPKG_CALL_ANSI = 2_u32
  SECPKG_CALL_URGENT = 4_u32
  SECPKG_CALL_RECURSIVE = 8_u32
  SECPKG_CALL_IN_PROC = 16_u32
  SECPKG_CALL_CLEANUP = 32_u32
  SECPKG_CALL_WOWCLIENT = 64_u32
  SECPKG_CALL_THREAD_TERM = 128_u32
  SECPKG_CALL_PROCESS_TERM = 256_u32
  SECPKG_CALL_IS_TCB = 512_u32
  SECPKG_CALL_NETWORK_ONLY = 1024_u32
  SECPKG_CALL_WINLOGON = 2048_u32
  SECPKG_CALL_ASYNC_UPDATE = 4096_u32
  SECPKG_CALL_SYSTEM_PROC = 8192_u32
  SECPKG_CALL_NEGO = 16384_u32
  SECPKG_CALL_NEGO_EXTENDER = 32768_u32
  SECPKG_CALL_BUFFER_MARSHAL = 65536_u32
  SECPKG_CALL_UNLOCK = 131072_u32
  SECPKG_CALL_CLOUDAP_CONNECT = 262144_u32
  SECPKG_CALL_WOWX86 = 64_u32
  SECPKG_CALL_WOWA32 = 262144_u32
  SECPKG_CREDENTIAL_VERSION = 201_u32
  SECPKG_CREDENTIAL_FLAGS_CALLER_HAS_TCB = 1_u32
  SECPKG_CREDENTIAL_FLAGS_CREDMAN_CRED = 2_u32
  SECPKG_SURROGATE_LOGON_VERSION_1 = 1_u32
  SECBUFFER_UNMAPPED = 1073741824_u32
  SECBUFFER_KERNEL_MAP = 536870912_u32
  PRIMARY_CRED_CLEAR_PASSWORD = 1_u32
  PRIMARY_CRED_OWF_PASSWORD = 2_u32
  PRIMARY_CRED_UPDATE = 4_u32
  PRIMARY_CRED_CACHED_LOGON = 8_u32
  PRIMARY_CRED_LOGON_NO_TCB = 16_u32
  PRIMARY_CRED_LOGON_LUA = 32_u32
  PRIMARY_CRED_INTERACTIVE_SMARTCARD_LOGON = 64_u32
  PRIMARY_CRED_REFRESH_NEEDED = 128_u32
  PRIMARY_CRED_INTERNET_USER = 256_u32
  PRIMARY_CRED_AUTH_ID = 512_u32
  PRIMARY_CRED_DO_NOT_SPLIT = 1024_u32
  PRIMARY_CRED_PROTECTED_USER = 2048_u32
  PRIMARY_CRED_EX = 4096_u32
  PRIMARY_CRED_TRANSFER = 8192_u32
  PRIMARY_CRED_RESTRICTED_TS = 16384_u32
  PRIMARY_CRED_PACKED_CREDS = 32768_u32
  PRIMARY_CRED_ENTERPRISE_INTERNET_USER = 65536_u32
  PRIMARY_CRED_ENCRYPTED_CREDGUARD_PASSWORD = 131072_u32
  PRIMARY_CRED_CACHED_INTERACTIVE_LOGON = 262144_u32
  PRIMARY_CRED_INTERACTIVE_NGC_LOGON = 524288_u32
  PRIMARY_CRED_INTERACTIVE_FIDO_LOGON = 1048576_u32
  PRIMARY_CRED_ARSO_LOGON = 2097152_u32
  PRIMARY_CRED_SUPPLEMENTAL = 4194304_u32
  PRIMARY_CRED_LOGON_PACKAGE_SHIFT = 24_u32
  PRIMARY_CRED_PACKAGE_MASK = 4278190080_u32
  SECPKG_PRIMARY_CRED_EX_FLAGS_EX_DELEGATION_TOKEN = 1_u32
  MAX_CRED_SIZE = 1024_u32
  SECPKG_STATE_ENCRYPTION_PERMITTED = 1_u32
  SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED = 2_u32
  SECPKG_STATE_DOMAIN_CONTROLLER = 4_u32
  SECPKG_STATE_WORKSTATION = 8_u32
  SECPKG_STATE_STANDALONE = 16_u32
  SECPKG_STATE_CRED_ISOLATION_ENABLED = 32_u32
  SECPKG_STATE_RESERVED_1 = 2147483648_u32
  SECPKG_MAX_OID_LENGTH = 32_u32
  SECPKG_ATTR_SASL_CONTEXT = 65536_u32
  SECPKG_ATTR_THUNK_ALL = 65536_u32
  UNDERSTANDS_LONG_NAMES = 1_u32
  NO_LONG_NAMES = 2_u32
  SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_OPTIMISTIC_LOGON = 1_u32
  SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_CLEANUP_CREDENTIALS = 2_u32
  SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_TO_SSO_SESSION = 4_u32
  NOTIFIER_FLAG_NEW_THREAD = 1_u32
  NOTIFIER_FLAG_ONE_SHOT = 2_u32
  NOTIFIER_FLAG_SECONDS = 2147483648_u32
  NOTIFIER_TYPE_INTERVAL = 1_u32
  NOTIFIER_TYPE_HANDLE_WAIT = 2_u32
  NOTIFIER_TYPE_STATE_CHANGE = 3_u32
  NOTIFIER_TYPE_NOTIFY_EVENT = 4_u32
  NOTIFIER_TYPE_IMMEDIATE = 16_u32
  NOTIFY_CLASS_PACKAGE_CHANGE = 1_u32
  NOTIFY_CLASS_ROLE_CHANGE = 2_u32
  NOTIFY_CLASS_DOMAIN_CHANGE = 3_u32
  NOTIFY_CLASS_REGISTRY_CHANGE = 4_u32
  LSA_QUERY_CLIENT_PRELOGON_SESSION_ID = 1_u32
  CREDP_FLAGS_IN_PROCESS = 1_u32
  CREDP_FLAGS_USE_MIDL_HEAP = 2_u32
  CREDP_FLAGS_DONT_CACHE_TI = 4_u32
  CREDP_FLAGS_CLEAR_PASSWORD = 8_u32
  CREDP_FLAGS_USER_ENCRYPTED_PASSWORD = 16_u32
  CREDP_FLAGS_TRUSTED_CALLER = 32_u32
  CREDP_FLAGS_VALIDATE_PROXY_TARGET = 64_u32
  CRED_MARSHALED_TI_SIZE_SIZE = 12_u32
  LSA_AP_NAME_LOGON_USER_EX2 = "LsaApLogonUserEx2\u0000"
  SP_ACCEPT_CREDENTIALS_NAME = "SpAcceptCredentials\u0000"
  SECPKG_UNICODE_ATTRIBUTE = 2147483648_u32
  SECPKG_ANSI_ATTRIBUTE = 0_u32
  SECPKG_CREDENTIAL_ATTRIBUTE = 0_u32
  SECPKG_LSAMODEINIT_NAME = "SpLsaModeInitialize"
  SECPKG_USERMODEINIT_NAME = "SpUserModeInitialize"
  SECPKG_INTERFACE_VERSION = 65536_u32
  SECPKG_INTERFACE_VERSION_2 = 131072_u32
  SECPKG_INTERFACE_VERSION_3 = 262144_u32
  SECPKG_INTERFACE_VERSION_4 = 524288_u32
  SECPKG_INTERFACE_VERSION_5 = 1048576_u32
  SECPKG_INTERFACE_VERSION_6 = 2097152_u32
  SECPKG_INTERFACE_VERSION_7 = 4194304_u32
  SECPKG_INTERFACE_VERSION_8 = 8388608_u32
  SECPKG_INTERFACE_VERSION_9 = 16777216_u32
  SECPKG_INTERFACE_VERSION_10 = 33554432_u32
  UNISP_NAME_A = "Microsoft Unified Security Protocol Provider"
  UNISP_NAME_W = "Microsoft Unified Security Protocol Provider"
  SSL2SP_NAME_A = "Microsoft SSL 2.0"
  SSL2SP_NAME_W = "Microsoft SSL 2.0"
  SSL3SP_NAME_A = "Microsoft SSL 3.0"
  SSL3SP_NAME_W = "Microsoft SSL 3.0"
  TLS1SP_NAME_A = "Microsoft TLS 1.0"
  TLS1SP_NAME_W = "Microsoft TLS 1.0"
  PCT1SP_NAME_A = "Microsoft PCT 1.0"
  PCT1SP_NAME_W = "Microsoft PCT 1.0"
  SCHANNEL_NAME_A = "Schannel"
  SCHANNEL_NAME_W = "Schannel"
  DEFAULT_TLS_SSP_NAME_A = "Default TLS SSP"
  DEFAULT_TLS_SSP_NAME_W = "Default TLS SSP"
  UNISP_NAME = "Microsoft Unified Security Protocol Provider"
  PCT1SP_NAME = "Microsoft PCT 1.0"
  SSL2SP_NAME = "Microsoft SSL 2.0"
  SSL3SP_NAME = "Microsoft SSL 3.0"
  TLS1SP_NAME = "Microsoft TLS 1.0"
  SCHANNEL_NAME = "Schannel"
  DEFAULT_TLS_SSP_NAME = "Default TLS SSP"
  UNISP_RPC_ID = 14_u32
  RCRED_STATUS_NOCRED = 0_u32
  RCRED_CRED_EXISTS = 1_u32
  RCRED_STATUS_UNKNOWN_ISSUER = 2_u32
  LCRED_STATUS_NOCRED = 0_u32
  LCRED_CRED_EXISTS = 1_u32
  LCRED_STATUS_UNKNOWN_ISSUER = 2_u32
  SECPKGCONTEXT_CONNECTION_INFO_EX_V1 = 1_u32
  SECPKGCONTEXT_CIPHERINFO_V1 = 1_u32
  SSL_SESSION_RECONNECT = 1_u32
  KERN_CONTEXT_CERT_INFO_V1 = 0_u32
  ENABLE_TLS_CLIENT_EARLY_START = 1_u32
  SCH_CRED_V1 = 1_u32
  SCH_CRED_V2 = 2_u32
  SCH_CRED_VERSION = 2_u32
  SCH_CRED_V3 = 3_u32
  SCHANNEL_CRED_VERSION = 4_u32
  SCH_CREDENTIALS_VERSION = 5_u32
  TLS_PARAMS_OPTIONAL = 1_u32
  SCH_CRED_MAX_SUPPORTED_PARAMETERS = 16_u32
  SCH_CRED_MAX_SUPPORTED_ALPN_IDS = 16_u32
  SCH_CRED_MAX_SUPPORTED_CRYPTO_SETTINGS = 16_u32
  SCH_CRED_MAX_SUPPORTED_CHAINING_MODES = 16_u32
  SCH_MAX_EXT_SUBSCRIPTIONS = 2_u32
  SCH_CRED_FORMAT_CERT_CONTEXT = 0_u32
  SCH_CRED_FORMAT_CERT_HASH = 1_u32
  SCH_CRED_FORMAT_CERT_HASH_STORE = 2_u32
  SCH_CRED_MAX_STORE_NAME_SIZE = 128_u32
  SCH_CRED_MAX_SUPPORTED_ALGS = 256_u32
  SCH_CRED_MAX_SUPPORTED_CERTS = 100_u32
  SCH_MACHINE_CERT_HASH = 1_u32
  SCH_CRED_DISABLE_RECONNECTS = 128_u32
  SCH_CRED_RESTRICTED_ROOTS = 8192_u32
  SCH_CRED_REVOCATION_CHECK_CACHE_ONLY = 16384_u32
  SCH_CRED_CACHE_ONLY_URL_RETRIEVAL = 32768_u32
  SCH_CRED_MEMORY_STORE_CERT = 65536_u32
  SCH_CRED_SNI_CREDENTIAL = 524288_u32
  SCH_CRED_SNI_ENABLE_OCSP = 1048576_u32
  SCH_USE_DTLS_ONLY = 16777216_u32
  SCH_ALLOW_NULL_ENCRYPTION = 33554432_u32
  SCH_CRED_DEFERRED_CRED_VALIDATION = 67108864_u32
  SCHANNEL_RENEGOTIATE = 0_u32
  SCHANNEL_SHUTDOWN = 1_u32
  SCHANNEL_ALERT = 2_u32
  SCHANNEL_SESSION = 3_u32
  TLS1_ALERT_CLOSE_NOTIFY = 0_u32
  TLS1_ALERT_UNEXPECTED_MESSAGE = 10_u32
  TLS1_ALERT_BAD_RECORD_MAC = 20_u32
  TLS1_ALERT_DECRYPTION_FAILED = 21_u32
  TLS1_ALERT_RECORD_OVERFLOW = 22_u32
  TLS1_ALERT_DECOMPRESSION_FAIL = 30_u32
  TLS1_ALERT_HANDSHAKE_FAILURE = 40_u32
  TLS1_ALERT_BAD_CERTIFICATE = 42_u32
  TLS1_ALERT_UNSUPPORTED_CERT = 43_u32
  TLS1_ALERT_CERTIFICATE_REVOKED = 44_u32
  TLS1_ALERT_CERTIFICATE_EXPIRED = 45_u32
  TLS1_ALERT_CERTIFICATE_UNKNOWN = 46_u32
  TLS1_ALERT_ILLEGAL_PARAMETER = 47_u32
  TLS1_ALERT_UNKNOWN_CA = 48_u32
  TLS1_ALERT_ACCESS_DENIED = 49_u32
  TLS1_ALERT_DECODE_ERROR = 50_u32
  TLS1_ALERT_DECRYPT_ERROR = 51_u32
  TLS1_ALERT_EXPORT_RESTRICTION = 60_u32
  TLS1_ALERT_PROTOCOL_VERSION = 70_u32
  TLS1_ALERT_INSUFFIENT_SECURITY = 71_u32
  TLS1_ALERT_INTERNAL_ERROR = 80_u32
  TLS1_ALERT_USER_CANCELED = 90_u32
  TLS1_ALERT_NO_RENEGOTIATION = 100_u32
  TLS1_ALERT_UNSUPPORTED_EXT = 110_u32
  TLS1_ALERT_UNKNOWN_PSK_IDENTITY = 115_u32
  TLS1_ALERT_NO_APP_PROTOCOL = 120_u32
  SP_PROT_PCT1_SERVER = 1_u32
  SP_PROT_PCT1_CLIENT = 2_u32
  SP_PROT_SSL2_SERVER = 4_u32
  SP_PROT_SSL2_CLIENT = 8_u32
  SP_PROT_SSL3_SERVER = 16_u32
  SP_PROT_SSL3_CLIENT = 32_u32
  SP_PROT_TLS1_SERVER = 64_u32
  SP_PROT_TLS1_CLIENT = 128_u32
  SP_PROT_UNI_SERVER = 1073741824_u32
  SP_PROT_UNI_CLIENT = 2147483648_u32
  SP_PROT_ALL = 4294967295_u32
  SP_PROT_NONE = 0_u32
  SP_PROT_TLS1_0_SERVER = 64_u32
  SP_PROT_TLS1_0_CLIENT = 128_u32
  SP_PROT_TLS1_1_SERVER = 256_u32
  SP_PROT_TLS1_1_CLIENT = 512_u32
  SP_PROT_TLS1_2_SERVER = 1024_u32
  SP_PROT_TLS1_2_CLIENT = 2048_u32
  SP_PROT_TLS1_3_SERVER = 4096_u32
  SP_PROT_TLS1_3_CLIENT = 8192_u32
  SP_PROT_DTLS_SERVER = 65536_u32
  SP_PROT_DTLS_CLIENT = 131072_u32
  SP_PROT_DTLS1_0_SERVER = 65536_u32
  SP_PROT_DTLS1_0_CLIENT = 131072_u32
  SP_PROT_DTLS1_2_SERVER = 262144_u32
  SP_PROT_DTLS1_2_CLIENT = 524288_u32
  SP_PROT_TLS1_3PLUS_SERVER = 4096_u32
  SP_PROT_TLS1_3PLUS_CLIENT = 8192_u32
  SCHANNEL_SECRET_TYPE_CAPI = 1_u32
  SCHANNEL_SECRET_PRIVKEY = 2_u32
  SCH_CRED_X509_CERTCHAIN = 1_u32
  SCH_CRED_X509_CAPI = 2_u32
  SCH_CRED_CERT_CONTEXT = 3_u32
  SSL_CRACK_CERTIFICATE_NAME = "SslCrackCertificate"
  SSL_FREE_CERTIFICATE_NAME = "SslFreeCertificate"
  SL_INFO_KEY_CHANNEL = "Channel"
  SL_INFO_KEY_NAME = "Name"
  SL_INFO_KEY_AUTHOR = "Author"
  SL_INFO_KEY_DESCRIPTION = "Description"
  SL_INFO_KEY_LICENSOR_URL = "LicensorUrl"
  SL_INFO_KEY_DIGITAL_PID = "DigitalPID"
  SL_INFO_KEY_DIGITAL_PID2 = "DigitalPID2"
  SL_INFO_KEY_PARTIAL_PRODUCT_KEY = "PartialProductKey"
  SL_INFO_KEY_PRODUCT_SKU_ID = "ProductSkuId"
  SL_INFO_KEY_LICENSE_TYPE = "LicenseType"
  SL_INFO_KEY_VERSION = "Version"
  SL_INFO_KEY_SYSTEM_STATE = "SystemState"
  SL_INFO_KEY_ACTIVE_PLUGINS = "ActivePlugins"
  SL_INFO_KEY_SECURE_STORE_ID = "SecureStoreId"
  SL_INFO_KEY_BIOS_PKEY = "BiosProductKey"
  SL_INFO_KEY_BIOS_SLIC_STATE = "BiosSlicState"
  SL_INFO_KEY_BIOS_OA2_MINOR_VERSION = "BiosOA2MinorVersion"
  SL_INFO_KEY_BIOS_PKEY_DESCRIPTION = "BiosProductKeyDescription"
  SL_INFO_KEY_BIOS_PKEY_PKPN = "BiosProductKeyPkPn"
  SL_INFO_KEY_SECURE_PROCESSOR_ACTIVATION_URL = "SPCURL"
  SL_INFO_KEY_RIGHT_ACCOUNT_ACTIVATION_URL = "RACURL"
  SL_INFO_KEY_PRODUCT_KEY_ACTIVATION_URL = "PKCURL"
  SL_INFO_KEY_USE_LICENSE_ACTIVATION_URL = "EULURL"
  SL_INFO_KEY_IS_KMS = "IsKeyManagementService"
  SL_INFO_KEY_KMS_CURRENT_COUNT = "KeyManagementServiceCurrentCount"
  SL_INFO_KEY_KMS_REQUIRED_CLIENT_COUNT = "KeyManagementServiceRequiredClientCount"
  SL_INFO_KEY_KMS_UNLICENSED_REQUESTS = "KeyManagementServiceUnlicensedRequests"
  SL_INFO_KEY_KMS_LICENSED_REQUESTS = "KeyManagementServiceLicensedRequests"
  SL_INFO_KEY_KMS_OOB_GRACE_REQUESTS = "KeyManagementServiceOOBGraceRequests"
  SL_INFO_KEY_KMS_OOT_GRACE_REQUESTS = "KeyManagementServiceOOTGraceRequests"
  SL_INFO_KEY_KMS_NON_GENUINE_GRACE_REQUESTS = "KeyManagementServiceNonGenuineGraceRequests"
  SL_INFO_KEY_KMS_NOTIFICATION_REQUESTS = "KeyManagementServiceNotificationRequests"
  SL_INFO_KEY_KMS_TOTAL_REQUESTS = "KeyManagementServiceTotalRequests"
  SL_INFO_KEY_KMS_FAILED_REQUESTS = "KeyManagementServiceFailedRequests"
  SL_INFO_KEY_IS_PRS = "IsPRS"
  SL_PKEY_MS2005 = "msft:rm/algorithm/pkey/2005"
  SL_PKEY_MS2009 = "msft:rm/algorithm/pkey/2009"
  SL_PKEY_DETECT = "msft:rm/algorithm/pkey/detect"
  SL_EVENT_LICENSING_STATE_CHANGED = "msft:rm/event/licensingstatechanged"
  SL_EVENT_POLICY_CHANGED = "msft:rm/event/policychanged"
  SL_EVENT_USER_NOTIFICATION = "msft:rm/event/usernotification"
  SL_SYSTEM_STATE_REBOOT_POLICY_FOUND = 1_u32
  SL_SYSTEM_STATE_TAMPERED = 2_u32
  SL_REARM_REBOOT_REQUIRED = 1_u32
  SPP_MIGRATION_GATHER_MIGRATABLE_APPS = 1_u32
  SPP_MIGRATION_GATHER_ACTIVATED_WINDOWS_STATE = 2_u32
  SPP_MIGRATION_GATHER_ALL = 4294967295_u32
  SL_PROP_BRT_DATA = "SL_BRT_DATA"
  SL_PROP_BRT_COMMIT = "SL_BRT_COMMIT"
  SL_PROP_GENUINE_RESULT = "SL_GENUINE_RESULT"
  SL_PROP_NONGENUINE_GRACE_FLAG = "SL_NONGENUINE_GRACE_FLAG"
  SL_PROP_GET_GENUINE_AUTHZ = "SL_GET_GENUINE_AUTHZ"
  SL_PROP_GET_GENUINE_SERVER_AUTHZ = "SL_GET_GENUINE_SERVER_AUTHZ"
  SL_PROP_LAST_ACT_ATTEMPT_HRESULT = "SL_LAST_ACT_ATTEMPT_HRESULT"
  SL_PROP_LAST_ACT_ATTEMPT_TIME = "SL_LAST_ACT_ATTEMPT_TIME"
  SL_PROP_LAST_ACT_ATTEMPT_SERVER_FLAGS = "SL_LAST_ACT_ATTEMPT_SERVER_FLAGS"
  SL_PROP_ACTIVATION_VALIDATION_IN_PROGRESS = "SL_ACTIVATION_VALIDATION_IN_PROGRESS"
  SL_POLICY_EVALUATION_MODE_ENABLED = "Security-SPP-EvaluationModeEnabled"
  SL_DEFAULT_MIGRATION_ENCRYPTOR_URI = "msft:spp/migrationencryptor/tokenact/1.0"
  ID_CAP_SLAPI = "slapiQueryLicenseValue"
  USER_ACCOUNT_DISABLED = 1_u32
  USER_HOME_DIRECTORY_REQUIRED = 2_u32
  USER_PASSWORD_NOT_REQUIRED = 4_u32
  USER_TEMP_DUPLICATE_ACCOUNT = 8_u32
  USER_NORMAL_ACCOUNT = 16_u32
  USER_MNS_LOGON_ACCOUNT = 32_u32
  USER_INTERDOMAIN_TRUST_ACCOUNT = 64_u32
  USER_WORKSTATION_TRUST_ACCOUNT = 128_u32
  USER_SERVER_TRUST_ACCOUNT = 256_u32
  USER_DONT_EXPIRE_PASSWORD = 512_u32
  USER_ACCOUNT_AUTO_LOCKED = 1024_u32
  USER_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 2048_u32
  USER_SMARTCARD_REQUIRED = 4096_u32
  USER_TRUSTED_FOR_DELEGATION = 8192_u32
  USER_NOT_DELEGATED = 16384_u32
  USER_USE_DES_KEY_ONLY = 32768_u32
  USER_DONT_REQUIRE_PREAUTH = 65536_u32
  USER_PASSWORD_EXPIRED = 131072_u32
  USER_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 262144_u32
  USER_NO_AUTH_DATA_REQUIRED = 524288_u32
  USER_PARTIAL_SECRETS_ACCOUNT = 1048576_u32
  USER_USE_AES_KEYS = 2097152_u32
  SAM_DAYS_PER_WEEK = 7_u32
  USER_ALL_PARAMETERS = 2097152_u32
  CLEAR_BLOCK_LENGTH = 8_u32
  CYPHER_BLOCK_LENGTH = 8_u32
  MSV1_0_VALIDATION_LOGOFF_TIME = 1_u32
  MSV1_0_VALIDATION_KICKOFF_TIME = 2_u32
  MSV1_0_VALIDATION_LOGON_SERVER = 4_u32
  MSV1_0_VALIDATION_LOGON_DOMAIN = 8_u32
  MSV1_0_VALIDATION_SESSION_KEY = 16_u32
  MSV1_0_VALIDATION_USER_FLAGS = 32_u32
  MSV1_0_VALIDATION_USER_ID = 64_u32
  MSV1_0_SUBAUTH_ACCOUNT_DISABLED = 1_u32
  MSV1_0_SUBAUTH_PASSWORD = 2_u32
  MSV1_0_SUBAUTH_WORKSTATIONS = 4_u32
  MSV1_0_SUBAUTH_LOGON_HOURS = 8_u32
  MSV1_0_SUBAUTH_ACCOUNT_EXPIRY = 16_u32
  MSV1_0_SUBAUTH_PASSWORD_EXPIRY = 32_u32
  MSV1_0_SUBAUTH_ACCOUNT_TYPE = 64_u32
  MSV1_0_SUBAUTH_LOCKOUT = 128_u32
  SL_MDOLLAR_ZONE = 40960_u32
  SL_SERVER_ZONE = 45056_u32
  SL_MSCH_ZONE = 49152_u32
  SL_INTERNAL_ZONE = 57344_u32
  SL_CLIENTAPI_ZONE = 61440_u32
  FACILITY_SL_ITF = 4_u32
  FACILITY_WINDOWS_STORE_ = 63_u32
  SL_E_SRV_INVALID_PUBLISH_LICENSE = -1073434623_i32
  SL_E_SRV_INVALID_PRODUCT_KEY_LICENSE = -1073434622_i32
  SL_E_SRV_INVALID_RIGHTS_ACCOUNT_LICENSE = -1073434621_i32
  SL_E_SRV_INVALID_LICENSE_STRUCTURE = -1073434620_i32
  SL_E_SRV_AUTHORIZATION_FAILED = -1073434619_i32
  SL_E_SRV_INVALID_BINDING = -1073434618_i32
  SL_E_SRV_SERVER_PONG = -1073434617_i32
  SL_E_SRV_INVALID_PAYLOAD = -1073434616_i32
  SL_E_SRV_INVALID_SECURITY_PROCESSOR_LICENSE = -1073434615_i32
  SL_E_SRV_BUSINESS_TOKEN_ENTRY_NOT_FOUND = -1073434608_i32
  SL_E_SRV_CLIENT_CLOCK_OUT_OF_SYNC = -1073434607_i32
  SL_E_SRV_GENERAL_ERROR = -1073434368_i32
  SL_E_CHPA_PRODUCT_KEY_OUT_OF_RANGE = -1073430527_i32
  SL_E_CHPA_INVALID_BINDING = -1073430526_i32
  SL_E_CHPA_PRODUCT_KEY_BLOCKED = -1073430525_i32
  SL_E_CHPA_INVALID_PRODUCT_KEY = -1073430524_i32
  SL_E_CHPA_BINDING_NOT_FOUND = -1073430523_i32
  SL_E_CHPA_BINDING_MAPPING_NOT_FOUND = -1073430522_i32
  SL_E_CHPA_UNSUPPORTED_PRODUCT_KEY = -1073430521_i32
  SL_E_CHPA_MAXIMUM_UNLOCK_EXCEEDED = -1073430520_i32
  SL_E_CHPA_ACTCONFIG_ID_NOT_FOUND = -1073430519_i32
  SL_E_CHPA_INVALID_PRODUCT_DATA_ID = -1073430518_i32
  SL_E_CHPA_INVALID_PRODUCT_DATA = -1073430517_i32
  SL_E_CHPA_SYSTEM_ERROR = -1073430516_i32
  SL_E_CHPA_INVALID_ACTCONFIG_ID = -1073430515_i32
  SL_E_CHPA_INVALID_PRODUCT_KEY_LENGTH = -1073430514_i32
  SL_E_CHPA_INVALID_PRODUCT_KEY_FORMAT = -1073430513_i32
  SL_E_CHPA_INVALID_PRODUCT_KEY_CHAR = -1073430512_i32
  SL_E_CHPA_INVALID_BINDING_URI = -1073430511_i32
  SL_E_CHPA_NETWORK_ERROR = -1073430510_i32
  SL_E_CHPA_DATABASE_ERROR = -1073430509_i32
  SL_E_CHPA_INVALID_ARGUMENT = -1073430508_i32
  SL_E_CHPA_DMAK_LIMIT_EXCEEDED = -1073430496_i32
  SL_E_CHPA_DMAK_EXTENSION_LIMIT_EXCEEDED = -1073430495_i32
  SL_E_CHPA_REISSUANCE_LIMIT_NOT_FOUND = -1073430494_i32
  SL_E_CHPA_OVERRIDE_REQUEST_NOT_FOUND = -1073430493_i32
  SL_E_CHPA_OEM_SLP_COA0 = -1073430506_i32
  SL_E_CHPA_PRODUCT_KEY_BLOCKED_IPLOCATION = -1073430505_i32
  SL_E_CHPA_RESPONSE_NOT_AVAILABLE = -1073430507_i32
  SL_E_CHPA_GENERAL_ERROR = -1073430448_i32
  SL_E_CHPA_TIMEBASED_ACTIVATION_BEFORE_START_DATE = -1073430480_i32
  SL_E_CHPA_TIMEBASED_ACTIVATION_AFTER_END_DATE = -1073430479_i32
  SL_E_CHPA_TIMEBASED_ACTIVATION_NOT_AVAILABLE = -1073430478_i32
  SL_E_CHPA_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED = -1073430477_i32
  SL_E_CHPA_NO_RULES_TO_ACTIVATE = -1073430449_i32
  SL_E_CHPA_DIGITALMARKER_INVALID_BINDING = -1073430447_i32
  SL_E_CHPA_DIGITALMARKER_BINDING_NOT_CONFIGURED = -1073430446_i32
  SL_E_CHPA_DYNAMICALLY_BLOCKED_PRODUCT_KEY = -1073430432_i32
  SL_E_CHPA_MSCH_RESPONSE_NOT_AVAILABLE_VGA = -1073429505_i32
  SL_E_CHPA_BUSINESS_RULE_INPUT_NOT_FOUND = -1073428736_i32
  SL_E_CHPA_NULL_VALUE_FOR_PROPERTY_NAME_OR_ID = -1073428656_i32
  SL_E_CHPA_UNKNOWN_PROPERTY_NAME = -1073428655_i32
  SL_E_CHPA_UNKNOWN_PROPERTY_ID = -1073428654_i32
  SL_E_CHPA_FAILED_TO_UPDATE_PRODUCTKEY_BINDING = -1073428651_i32
  SL_E_CHPA_FAILED_TO_INSERT_PRODUCTKEY_BINDING = -1073428650_i32
  SL_E_CHPA_FAILED_TO_DELETE_PRODUCTKEY_BINDING = -1073428649_i32
  SL_E_CHPA_FAILED_TO_PROCESS_PRODUCT_KEY_BINDINGS_XML = -1073428648_i32
  SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_PROPERTY = -1073428646_i32
  SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_PROPERTY = -1073428645_i32
  SL_E_CHPA_FAILED_TO_DELETE_PRODUCT_KEY_PROPERTY = -1073428644_i32
  SL_E_CHPA_UNKNOWN_PRODUCT_KEY_TYPE = -1073428636_i32
  SL_E_CHPA_PRODUCT_KEY_BEING_USED = -1073428624_i32
  SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_RECORD = -1073428608_i32
  SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_RECORD = -1073428607_i32
  SL_E_INVALID_LICENSE_STATE_BREACH_GRACE = -1073429871_i32
  SL_E_INVALID_LICENSE_STATE_BREACH_GRACE_EXPIRED = -1073429870_i32
  SL_E_INVALID_TEMPLATE_ID = -1073429770_i32
  SL_E_INVALID_XML_BLOB = -1073429766_i32
  SL_E_VALIDATION_BLOB_PARAM_NOT_FOUND = -1073429721_i32
  SL_E_INVALID_CLIENT_TOKEN = -1073429720_i32
  SL_E_INVALID_OFFLINE_BLOB = -1073429719_i32
  SL_E_OFFLINE_VALIDATION_BLOB_PARAM_NOT_FOUND = -1073429718_i32
  SL_E_INVALID_OSVERSION_TEMPLATEID = -1073429717_i32
  SL_E_OFFLINE_GENUINE_BLOB_REVOKED = -1073429716_i32
  SL_E_OFFLINE_GENUINE_BLOB_NOT_FOUND = -1073429715_i32
  SL_E_INVALID_OS_FOR_PRODUCT_KEY = -1073429503_i32
  SL_E_INVALID_FILE_HASH = -1073429343_i32
  SL_E_VALIDATION_BLOCKED_PRODUCT_KEY = -1073429342_i32
  SL_E_MISMATCHED_KEY_TYPES = -1073429340_i32
  SL_E_VALIDATION_INVALID_PRODUCT_KEY = -1073429339_i32
  SL_E_INVALID_OEM_OR_VOLUME_BINDING_DATA = -1073429337_i32
  SL_E_INVALID_LICENSE_STATE = -1073429336_i32
  SL_E_IP_LOCATION_FALIED = -1073429335_i32
  SL_E_SOFTMOD_EXPLOIT_DETECTED = -1073429333_i32
  SL_E_INVALID_TOKEN_DATA = -1073429332_i32
  SL_E_HEALTH_CHECK_FAILED_NEUTRAL_FILES = -1073429331_i32
  SL_E_HEALTH_CHECK_FAILED_MUI_FILES = -1073429330_i32
  SL_E_INVALID_AD_DATA = -1073429329_i32
  SL_E_INVALID_RSDP_COUNT = -1073429328_i32
  SL_E_ENGINE_DETECTED_EXPLOIT = -1073429327_i32
  SL_E_NON_GENUINE_STATUS_LAST = -1073428992_i32
  SL_E_NOTIFICATION_BREACH_DETECTED = -1073429199_i32
  SL_E_NOTIFICATION_GRACE_EXPIRED = -1073429198_i32
  SL_E_NOTIFICATION_OTHER_REASONS = -1073429197_i32
  SL_E_INVALID_CONTEXT = -1073422335_i32
  SL_E_TOKEN_STORE_INVALID_STATE = -1073422334_i32
  SL_E_EVALUATION_FAILED = -1073422333_i32
  SL_E_NOT_EVALUATED = -1073422332_i32
  SL_E_NOT_ACTIVATED = -1073422331_i32
  SL_E_INVALID_GUID = -1073422330_i32
  SL_E_TOKSTO_TOKEN_NOT_FOUND = -1073422329_i32
  SL_E_TOKSTO_NO_PROPERTIES = -1073422328_i32
  SL_E_TOKSTO_NOT_INITIALIZED = -1073422327_i32
  SL_E_TOKSTO_ALREADY_INITIALIZED = -1073422326_i32
  SL_E_TOKSTO_NO_ID_SET = -1073422325_i32
  SL_E_TOKSTO_CANT_CREATE_FILE = -1073422324_i32
  SL_E_TOKSTO_CANT_WRITE_TO_FILE = -1073422323_i32
  SL_E_TOKSTO_CANT_READ_FILE = -1073422322_i32
  SL_E_TOKSTO_CANT_PARSE_PROPERTIES = -1073422321_i32
  SL_E_TOKSTO_PROPERTY_NOT_FOUND = -1073422320_i32
  SL_E_TOKSTO_INVALID_FILE = -1073422319_i32
  SL_E_TOKSTO_CANT_CREATE_MUTEX = -1073422318_i32
  SL_E_TOKSTO_CANT_ACQUIRE_MUTEX = -1073422317_i32
  SL_E_TOKSTO_NO_TOKEN_DATA = -1073422316_i32
  SL_E_EUL_CONSUMPTION_FAILED = -1073422315_i32
  SL_E_PKEY_INVALID_CONFIG = -1073422314_i32
  SL_E_PKEY_INVALID_UNIQUEID = -1073422313_i32
  SL_E_PKEY_INVALID_ALGORITHM = -1073422312_i32
  SL_E_PKEY_INTERNAL_ERROR = -1073422311_i32
  SL_E_LICENSE_INVALID_ADDON_INFO = -1073422310_i32
  SL_E_HWID_ERROR = -1073422309_i32
  SL_E_PKEY_INVALID_KEYCHANGE1 = -1073422308_i32
  SL_E_PKEY_INVALID_KEYCHANGE2 = -1073422307_i32
  SL_E_PKEY_INVALID_KEYCHANGE3 = -1073422306_i32
  SL_E_POLICY_OTHERINFO_MISMATCH = -1073422304_i32
  SL_E_PRODUCT_UNIQUENESS_GROUP_ID_INVALID = -1073422303_i32
  SL_E_SECURE_STORE_ID_MISMATCH = -1073422302_i32
  SL_E_INVALID_RULESET_RULE = -1073422301_i32
  SL_E_INVALID_CONTEXT_DATA = -1073422300_i32
  SL_E_INVALID_HASH = -1073422299_i32
  SL_E_INVALID_USE_OF_ADD_ON_PKEY = -2147164122_i32
  SL_E_WINDOWS_VERSION_MISMATCH = -1073422297_i32
  SL_E_ACTIVATION_IN_PROGRESS = -1073422296_i32
  SL_E_STORE_UPGRADE_TOKEN_REQUIRED = -1073422295_i32
  SL_E_STORE_UPGRADE_TOKEN_WRONG_EDITION = -1073422294_i32
  SL_E_STORE_UPGRADE_TOKEN_WRONG_PID = -1073422293_i32
  SL_E_STORE_UPGRADE_TOKEN_NOT_PRS_SIGNED = -1073422292_i32
  SL_E_STORE_UPGRADE_TOKEN_WRONG_VERSION = -1073422291_i32
  SL_E_STORE_UPGRADE_TOKEN_NOT_AUTHORIZED = -1073422290_i32
  SL_E_SFS_INVALID_FS_VERSION = -2147163903_i32
  SL_E_SFS_INVALID_FD_TABLE = -2147163902_i32
  SL_E_SFS_INVALID_SYNC = -2147163901_i32
  SL_E_SFS_BAD_TOKEN_NAME = -2147163900_i32
  SL_E_SFS_BAD_TOKEN_EXT = -2147163899_i32
  SL_E_SFS_DUPLICATE_TOKEN_NAME = -2147163898_i32
  SL_E_SFS_TOKEN_SIZE_MISMATCH = -2147163897_i32
  SL_E_SFS_INVALID_TOKEN_DATA_HASH = -2147163896_i32
  SL_E_SFS_FILE_READ_ERROR = -2147163895_i32
  SL_E_SFS_FILE_WRITE_ERROR = -2147163894_i32
  SL_E_SFS_INVALID_FILE_POSITION = -2147163893_i32
  SL_E_SFS_NO_ACTIVE_TRANSACTION = -2147163892_i32
  SL_E_SFS_INVALID_FS_HEADER = -2147163891_i32
  SL_E_SFS_INVALID_TOKEN_DESCRIPTOR = -2147163890_i32
  SL_E_INTERNAL_ERROR = -1073418239_i32
  SL_E_RIGHT_NOT_CONSUMED = -1073418238_i32
  SL_E_USE_LICENSE_NOT_INSTALLED = -1073418237_i32
  SL_E_MISMATCHED_PKEY_RANGE = -1073418236_i32
  SL_E_MISMATCHED_PID = -1073418235_i32
  SL_E_EXTERNAL_SIGNATURE_NOT_FOUND = -1073418234_i32
  SL_E_RAC_NOT_AVAILABLE = -1073418233_i32
  SL_E_SPC_NOT_AVAILABLE = -1073418232_i32
  SL_E_GRACE_TIME_EXPIRED = -1073418231_i32
  SL_E_MISMATCHED_APPID = -1073418230_i32
  SL_E_NO_PID_CONFIG_DATA = -1073418229_i32
  SL_I_OOB_GRACE_PERIOD = 1074065420_i32
  SL_I_OOT_GRACE_PERIOD = 1074065421_i32
  SL_E_MISMATCHED_SECURITY_PROCESSOR = -1073418226_i32
  SL_E_OUT_OF_TOLERANCE = -1073418225_i32
  SL_E_INVALID_PKEY = -1073418224_i32
  SL_E_LICENSE_FILE_NOT_INSTALLED = -1073418223_i32
  SL_E_VALUE_NOT_FOUND = -1073418222_i32
  SL_E_RIGHT_NOT_GRANTED = -1073418221_i32
  SL_E_PKEY_NOT_INSTALLED = -1073418220_i32
  SL_E_PRODUCT_SKU_NOT_INSTALLED = -1073418219_i32
  SL_E_NOT_SUPPORTED = -1073418218_i32
  SL_E_PUBLISHING_LICENSE_NOT_INSTALLED = -1073418217_i32
  SL_E_LICENSE_SERVER_URL_NOT_FOUND = -1073418216_i32
  SL_E_INVALID_EVENT_ID = -1073418215_i32
  SL_E_EVENT_NOT_REGISTERED = -1073418214_i32
  SL_E_EVENT_ALREADY_REGISTERED = -1073418213_i32
  SL_E_DECRYPTION_LICENSES_NOT_AVAILABLE = -1073418212_i32
  SL_E_LICENSE_SIGNATURE_VERIFICATION_FAILED = -1073418211_i32
  SL_E_DATATYPE_MISMATCHED = -1073418210_i32
  SL_E_INVALID_LICENSE = -1073418209_i32
  SL_E_INVALID_PACKAGE = -1073418208_i32
  SL_E_VALIDITY_TIME_EXPIRED = -1073418207_i32
  SL_E_LICENSE_AUTHORIZATION_FAILED = -1073418206_i32
  SL_E_LICENSE_DECRYPTION_FAILED = -1073418205_i32
  SL_E_WINDOWS_INVALID_LICENSE_STATE = -1073418204_i32
  SL_E_LUA_ACCESSDENIED = -1073418203_i32
  SL_E_PROXY_KEY_NOT_FOUND = -1073418202_i32
  SL_E_TAMPER_DETECTED = -1073418201_i32
  SL_E_POLICY_CACHE_INVALID = -1073418200_i32
  SL_E_INVALID_RUNNING_MODE = -1073418199_i32
  SL_E_SLP_NOT_SIGNED = -1073418198_i32
  SL_E_CIDIID_INVALID_DATA = -1073418196_i32
  SL_E_CIDIID_INVALID_VERSION = -1073418195_i32
  SL_E_CIDIID_VERSION_NOT_SUPPORTED = -1073418194_i32
  SL_E_CIDIID_INVALID_DATA_LENGTH = -1073418193_i32
  SL_E_CIDIID_NOT_DEPOSITED = -1073418192_i32
  SL_E_CIDIID_MISMATCHED = -1073418191_i32
  SL_E_INVALID_BINDING_BLOB = -1073418190_i32
  SL_E_PRODUCT_KEY_INSTALLATION_NOT_ALLOWED = -1073418189_i32
  SL_E_EUL_NOT_AVAILABLE = -1073418188_i32
  SL_E_VL_NOT_WINDOWS_SLP = -1073418187_i32
  SL_E_VL_NOT_ENOUGH_COUNT = -1073418184_i32
  SL_E_VL_BINDING_SERVICE_NOT_ENABLED = -1073418183_i32
  SL_E_VL_INFO_PRODUCT_USER_RIGHT = 1074065472_i32
  SL_E_VL_KEY_MANAGEMENT_SERVICE_NOT_ACTIVATED = -1073418175_i32
  SL_E_VL_KEY_MANAGEMENT_SERVICE_ID_MISMATCH = -1073418174_i32
  SL_E_PROXY_POLICY_NOT_UPDATED = -1073418169_i32
  SL_E_CIDIID_INVALID_CHECK_DIGITS = -1073418163_i32
  SL_E_LICENSE_MANAGEMENT_DATA_NOT_FOUND = -1073418161_i32
  SL_E_INVALID_PRODUCT_KEY = -1073418160_i32
  SL_E_BLOCKED_PRODUCT_KEY = -1073418159_i32
  SL_E_DUPLICATE_POLICY = -1073418158_i32
  SL_E_MISSING_OVERRIDE_ONLY_ATTRIBUTE = -1073418157_i32
  SL_E_LICENSE_MANAGEMENT_DATA_DUPLICATED = -1073418156_i32
  SL_E_BASE_SKU_NOT_AVAILABLE = -1073418155_i32
  SL_E_VL_MACHINE_NOT_BOUND = -1073418154_i32
  SL_E_SLP_MISSING_ACPI_SLIC = -1073418153_i32
  SL_E_SLP_MISSING_SLP_MARKER = -1073418152_i32
  SL_E_SLP_BAD_FORMAT = -1073418151_i32
  SL_E_INVALID_PACKAGE_VERSION = -1073418144_i32
  SL_E_PKEY_INVALID_UPGRADE = -1073418143_i32
  SL_E_ISSUANCE_LICENSE_NOT_INSTALLED = -1073418142_i32
  SL_E_SLP_OEM_CERT_MISSING = -1073418141_i32
  SL_E_NONGENUINE_GRACE_TIME_EXPIRED = -1073418140_i32
  SL_I_NONGENUINE_GRACE_PERIOD = 1074065509_i32
  SL_E_DEPENDENT_PROPERTY_NOT_SET = -1073418138_i32
  SL_E_NONGENUINE_GRACE_TIME_EXPIRED_2 = -1073418137_i32
  SL_I_NONGENUINE_GRACE_PERIOD_2 = 1074065512_i32
  SL_E_MISMATCHED_PRODUCT_SKU = -1073418135_i32
  SL_E_OPERATION_NOT_ALLOWED = -1073418134_i32
  SL_E_VL_KEY_MANAGEMENT_SERVICE_VM_NOT_SUPPORTED = -1073418133_i32
  SL_E_VL_INVALID_TIMESTAMP = -1073418132_i32
  SL_E_PLUGIN_INVALID_MANIFEST = -1073418127_i32
  SL_E_APPLICATION_POLICIES_MISSING = -1073418126_i32
  SL_E_APPLICATION_POLICIES_NOT_LOADED = -1073418125_i32
  SL_E_VL_BINDING_SERVICE_UNAVAILABLE = -1073418124_i32
  SL_E_SERVICE_STOPPING = -1073418123_i32
  SL_E_PLUGIN_NOT_REGISTERED = -1073418122_i32
  SL_E_AUTHN_WRONG_VERSION = -1073418121_i32
  SL_E_AUTHN_MISMATCHED_KEY = -1073418120_i32
  SL_E_AUTHN_CHALLENGE_NOT_SET = -1073418119_i32
  SL_E_AUTHN_CANT_VERIFY = -1073418118_i32
  SL_E_SERVICE_RUNNING = -1073418117_i32
  SL_E_SLP_INVALID_MARKER_VERSION = -1073418116_i32
  SL_E_INVALID_PRODUCT_KEY_TYPE = -1073418115_i32
  SL_E_CIDIID_MISMATCHED_PKEY = -1073418114_i32
  SL_E_CIDIID_NOT_BOUND = -1073418113_i32
  SL_E_LICENSE_NOT_BOUND = -1073418112_i32
  SL_E_VL_AD_AO_NOT_FOUND = -1073418111_i32
  SL_E_VL_AD_AO_NAME_TOO_LONG = -1073418110_i32
  SL_E_VL_AD_SCHEMA_VERSION_NOT_SUPPORTED = -1073418109_i32
  SL_E_NOT_GENUINE = -1073417728_i32
  SL_E_EDITION_MISMATCHED = -1073417712_i32
  SL_E_HWID_CHANGED = -1073417711_i32
  SL_E_OEM_KEY_EDITION_MISMATCH = -1073417710_i32
  SL_E_NO_PRODUCT_KEY_FOUND = -1073417709_i32
  SL_E_DOWNLEVEL_SETUP_KEY = -1073417708_i32
  SL_E_BIOS_KEY = -1073417707_i32
  SL_E_TKA_CHALLENGE_EXPIRED = -1073417471_i32
  SL_E_TKA_SILENT_ACTIVATION_FAILURE = -1073417470_i32
  SL_E_TKA_INVALID_CERT_CHAIN = -1073417469_i32
  SL_E_TKA_GRANT_NOT_FOUND = -1073417468_i32
  SL_E_TKA_CERT_NOT_FOUND = -1073417467_i32
  SL_E_TKA_INVALID_SKU_ID = -1073417466_i32
  SL_E_TKA_INVALID_BLOB = -1073417465_i32
  SL_E_TKA_TAMPERED_CERT_CHAIN = -1073417464_i32
  SL_E_TKA_CHALLENGE_MISMATCH = -1073417463_i32
  SL_E_TKA_INVALID_CERTIFICATE = -1073417462_i32
  SL_E_TKA_INVALID_SMARTCARD = -1073417461_i32
  SL_E_TKA_FAILED_GRANT_PARSING = -1073417460_i32
  SL_E_TKA_INVALID_THUMBPRINT = -1073417459_i32
  SL_E_TKA_THUMBPRINT_CERT_NOT_FOUND = -1073417458_i32
  SL_E_TKA_CRITERIA_MISMATCH = -1073417457_i32
  SL_E_TKA_TPID_MISMATCH = -1073417456_i32
  SL_E_TKA_SOFT_CERT_DISALLOWED = -1073417455_i32
  SL_E_TKA_SOFT_CERT_INVALID = -1073417454_i32
  SL_E_TKA_CERT_CNG_NOT_AVAILABLE = -1073417453_i32
  SL_I_STORE_BASED_ACTIVATION = 1074066433_i32
  E_RM_UNKNOWN_ERROR = -1073415165_i32
  SL_I_TIMEBASED_VALIDITY_PERIOD = 1074068484_i32
  SL_I_PERPETUAL_OOB_GRACE_PERIOD = 1074068485_i32
  SL_I_TIMEBASED_EXTENDED_GRACE_PERIOD = 1074068486_i32
  SL_E_VALIDITY_PERIOD_EXPIRED = -1073415161_i32
  SL_E_IA_THROTTLE_LIMIT_EXCEEDED = -1073414912_i32
  SL_E_IA_INVALID_VIRTUALIZATION_PLATFORM = -1073414911_i32
  SL_E_IA_PARENT_PARTITION_NOT_ACTIVATED = -1073414910_i32
  SL_E_IA_ID_MISMATCH = -1073414909_i32
  SL_E_IA_MACHINE_NOT_BOUND = -1073414908_i32
  SL_E_TAMPER_RECOVERY_REQUIRES_ACTIVATION = -1073414656_i32
  SL_REMAPPING_SP_PUB_GENERAL_NOT_INITIALIZED = -1073426175_i32
  SL_REMAPPING_SP_STATUS_SYSTEM_TIME_SKEWED = -2147167998_i32
  SL_REMAPPING_SP_STATUS_GENERIC_FAILURE = -1073426173_i32
  SL_REMAPPING_SP_STATUS_INVALIDARG = -1073426172_i32
  SL_REMAPPING_SP_STATUS_ALREADY_EXISTS = -1073426171_i32
  SL_REMAPPING_SP_STATUS_INSUFFICIENT_BUFFER = -1073426169_i32
  SL_REMAPPING_SP_STATUS_INVALIDDATA = -1073426168_i32
  SL_REMAPPING_SP_STATUS_INVALID_SPAPI_CALL = -1073426167_i32
  SL_REMAPPING_SP_STATUS_INVALID_SPAPI_VERSION = -1073426166_i32
  SL_REMAPPING_SP_STATUS_DEBUGGER_DETECTED = -2147167989_i32
  SL_REMAPPING_SP_STATUS_NO_MORE_DATA = -1073426164_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_KEYLENGTH = -1073425919_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCKLENGTH = -1073425918_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHER = -1073425917_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHERMODE = -1073425916_i32
  SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_PROVIDERID = -1073425915_i32
  SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_KEYID = -1073425914_i32
  SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_HASHID = -1073425913_i32
  SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_ATTRIBUTEID = -1073425912_i32
  SL_REMAPPING_SP_PUB_CRYPTO_HASH_FINALIZED = -1073425911_i32
  SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_AVAILABLE = -1073425910_i32
  SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_FOUND = -1073425909_i32
  SL_REMAPPING_SP_PUB_CRYPTO_NOT_BLOCK_ALIGNED = -1073425908_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURELENGTH = -1073425907_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURE = -1073425906_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCK = -1073425905_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_FORMAT = -1073425904_i32
  SL_REMAPPING_SP_PUB_CRYPTO_INVALID_PADDING = -1073425903_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED = -1073425663_i32
  SL_REMAPPING_SP_PUB_TS_REARMED = -1073425662_i32
  SL_REMAPPING_SP_PUB_TS_RECREATED = -1073425661_i32
  SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_NOT_FOUND = -1073425660_i32
  SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_ALREADY_EXISTS = -1073425659_i32
  SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_SIZE_TOO_BIG = -1073425658_i32
  SL_REMAPPING_SP_PUB_TS_MAX_REARM_REACHED = -1073425657_i32
  SL_REMAPPING_SP_PUB_TS_DATA_SIZE_TOO_BIG = -1073425656_i32
  SL_REMAPPING_SP_PUB_TS_INVALID_HW_BINDING = -1073425655_i32
  SL_REMAPPING_SP_PUB_TIMER_ALREADY_EXISTS = -1073425654_i32
  SL_REMAPPING_SP_PUB_TIMER_NOT_FOUND = -1073425653_i32
  SL_REMAPPING_SP_PUB_TIMER_EXPIRED = -1073425652_i32
  SL_REMAPPING_SP_PUB_TIMER_NAME_SIZE_TOO_BIG = -1073425651_i32
  SL_REMAPPING_SP_PUB_TS_FULL = -1073425650_i32
  SL_REMAPPING_SP_PUB_TRUSTED_TIME_OK = 1074057999_i32
  SL_REMAPPING_SP_PUB_TS_ENTRY_READ_ONLY = -1073425648_i32
  SL_REMAPPING_SP_PUB_TIMER_READ_ONLY = -1073425647_i32
  SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_READ_ONLY = -1073425646_i32
  SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_NOT_FOUND = -1073425645_i32
  SL_REMAPPING_SP_PUB_TS_ACCESS_DENIED = -1073425644_i32
  SL_REMAPPING_SP_PUB_TS_NAMESPACE_NOT_FOUND = -1073425643_i32
  SL_REMAPPING_SP_PUB_TS_NAMESPACE_IN_USE = -1073425642_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_LOAD_INVALID = -1073425641_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_GENERATION = -1073425640_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED_INVALID_DATA = -1073425639_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED_NO_DATA = -1073425638_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_BREADCRUMB_MISMATCH = -1073425637_i32
  SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_VERSION_MISMATCH = -1073425636_i32
  SL_REMAPPING_SP_PUB_TAMPER_MODULE_AUTHENTICATION = -1073425407_i32
  SL_REMAPPING_SP_PUB_TAMPER_SECURITY_PROCESSOR_PATCHED = -1073425406_i32
  SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER = -1073425151_i32
  SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER_RESTORE_FAILED = -1073425150_i32
  SL_REMAPPING_SP_PUB_KM_CACHE_IDENTICAL = 1074058753_i32
  SL_REMAPPING_SP_PUB_KM_CACHE_POLICY_CHANGED = 1074058754_i32
  SL_REMAPPING_SP_STATUS_PUSHKEY_CONFLICT = -1073424639_i32
  SL_REMAPPING_SP_PUB_PROXY_SOFT_TAMPER = -1073424638_i32
  SL_REMAPPING_SP_PUB_API_INVALID_LICENSE = -1073426432_i32
  SL_REMAPPING_SP_PUB_API_INVALID_ALGORITHM_TYPE = -1073426423_i32
  SL_REMAPPING_SP_PUB_API_TOO_MANY_LOADED_ENVIRONMENTS = -1073426420_i32
  SL_REMAPPING_SP_PUB_API_BAD_GET_INFO_QUERY = -1073426414_i32
  SL_REMAPPING_SP_PUB_API_INVALID_HANDLE = -1073426388_i32
  SL_REMAPPING_SP_PUB_API_INVALID_KEY_LENGTH = -1073426347_i32
  SL_REMAPPING_SP_PUB_API_NO_AES_PROVIDER = -1073426317_i32
  SL_REMAPPING_SP_PUB_API_HANDLE_NOT_COMMITED = -1073426303_i32
  SL_REMAPPING_MDOLLAR_PRODUCT_KEY_OUT_OF_RANGE = -2143313819_i32
  SL_REMAPPING_MDOLLAR_INVALID_BINDING = -2143313818_i32
  SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED = -2143313817_i32
  SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY = -2143313816_i32
  SL_REMAPPING_MDOLLAR_UNSUPPORTED_PRODUCT_KEY = -2143313812_i32
  SL_REMAPPING_MDOLLAR_MAXIMUM_UNLOCK_EXCEEDED = -2143313807_i32
  SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA_ID = -2143313805_i32
  SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA = -2143313804_i32
  SL_REMAPPING_MDOLLAR_INVALID_ACTCONFIG_ID = -2143313802_i32
  SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_LENGTH = -2143313801_i32
  SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_FORMAT = -2143313800_i32
  SL_REMAPPING_MDOLLAR_INVALID_BINDING_URI = -2143313798_i32
  SL_REMAPPING_MDOLLAR_INVALID_ARGUMENT = -2143313795_i32
  SL_REMAPPING_MDOLLAR_DMAK_LIMIT_EXCEEDED = -2143313793_i32
  SL_REMAPPING_MDOLLAR_DMAK_EXTENSION_LIMIT_EXCEEDED = -2143313792_i32
  SL_REMAPPING_MDOLLAR_OEM_SLP_COA0 = -2143313789_i32
  SL_REMAPPING_MDOLLAR_CIDIID_INVALID_VERSION = -2143313779_i32
  SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA = -2143313778_i32
  SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA_LENGTH = -2143313777_i32
  SL_REMAPPING_MDOLLAR_CIDIID_INVALID_CHECK_DIGITS = -2143313776_i32
  SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_BEFORE_START_DATE = -2143313769_i32
  SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_AFTER_END_DATE = -2143313768_i32
  SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_NOT_AVAILABLE = -2143313767_i32
  SL_REMAPPING_MDOLLAR_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED = -2143313766_i32
  SL_REMAPPING_MDOLLAR_NO_RULES_TO_ACTIVATE = -2143313720_i32
  SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED_IPLOCATION = -2143313717_i32
  SL_REMAPPING_MDOLLAR_DIGITALMARKER_INVALID_BINDING = -2143313709_i32
  SL_REMAPPING_MDOLLAR_DIGITALMARKER_BINDING_NOT_CONFIGURED = -2143313708_i32
  SL_REMAPPING_MDOLLAR_ROT_OVERRIDE_LIMIT_REACHED = -2143313707_i32
  SL_REMAPPING_MDOLLAR_DMAK_OVERRIDE_LIMIT_REACHED = -2143313706_i32
  SL_REMAPPING_MDOLLAR_FREE_OFFER_EXPIRED = -2143312896_i32
  SL_REMAPPING_MDOLLAR_OSR_DONOR_HWID_NO_ENTITLEMENT = -2143310920_i32
  SL_REMAPPING_MDOLLAR_OSR_GENERIC_ERROR = -2143310919_i32
  SL_REMAPPING_MDOLLAR_OSR_NO_ASSOCIATION = -2143310918_i32
  SL_REMAPPING_MDOLLAR_OSR_NOT_ADMIN = -2143310917_i32
  SL_REMAPPING_MDOLLAR_OSR_USER_THROTTLED = -2143310916_i32
  SL_REMAPPING_MDOLLAR_OSR_LICENSE_THROTTLED = -2143310915_i32
  SL_REMAPPING_MDOLLAR_OSR_DEVICE_THROTTLED = -2143310914_i32
  SL_REMAPPING_MDOLLAR_OSR_GP_DISABLED = -2143310913_i32
  SL_REMAPPING_MDOLLAR_OSR_HARDWARE_BLOCKED = -2143310912_i32
  SL_REMAPPING_MDOLLAR_OSR_USER_BLOCKED = -2143310911_i32
  SL_REMAPPING_MDOLLAR_OSR_LICENSE_BLOCKED = -2143310910_i32
  SL_REMAPPING_MDOLLAR_OSR_DEVICE_BLOCKED = -2143310909_i32
  WINDOWS_SLID = "55c92734-d682-4d71-983e-d6ec3f16059f"
  WDIGEST_SP_NAME_A = "WDigest"
  WDIGEST_SP_NAME_W = "WDigest"
  WDIGEST_SP_NAME = "WDigest"

  enum SECPKG_ATTR : UInt32
    SECPKG_ATTR_C_ACCESS_TOKEN = 2147483666_u32
    SECPKG_ATTR_C_FULL_ACCESS_TOKEN = 2147483778_u32
    SECPKG_ATTR_CERT_TRUST_STATUS = 2147483780_u32
    SECPKG_ATTR_CREDS = 2147483776_u32
    SECPKG_ATTR_CREDS_2 = 2147483782_u32
    SECPKG_ATTR_NEGOTIATION_PACKAGE = 2147483777_u32
    SECPKG_ATTR_PACKAGE_INFO = 10_u32
    SECPKG_ATTR_SERVER_AUTH_FLAGS = 2147483779_u32
    SECPKG_ATTR_SIZES = 0_u32
    SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES = 124_u32
    SECPKG_ATTR_APP_DATA = 94_u32
    SECPKG_ATTR_EAP_PRF_INFO = 101_u32
    SECPKG_ATTR_EARLY_START = 105_u32
    SECPKG_ATTR_DTLS_MTU = 34_u32
    SECPKG_ATTR_KEYING_MATERIAL_INFO = 106_u32
    SECPKG_ATTR_ACCESS_TOKEN = 18_u32
    SECPKG_ATTR_AUTHORITY = 6_u32
    SECPKG_ATTR_CLIENT_SPECIFIED_TARGET = 27_u32
    SECPKG_ATTR_CONNECTION_INFO = 90_u32
    SECPKG_ATTR_DCE_INFO = 3_u32
    SECPKG_ATTR_ENDPOINT_BINDINGS = 26_u32
    SECPKG_ATTR_EAP_KEY_BLOCK = 91_u32
    SECPKG_ATTR_FLAGS = 14_u32
    SECPKG_ATTR_ISSUER_LIST_EX = 89_u32
    SECPKG_ATTR_KEY_INFO = 5_u32
    SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS = 30_u32
    SECPKG_ATTR_LIFESPAN = 2_u32
    SECPKG_ATTR_LOCAL_CERT_CONTEXT = 84_u32
    SECPKG_ATTR_LOCAL_CRED = 82_u32
    SECPKG_ATTR_NAMES = 1_u32
    SECPKG_ATTR_NATIVE_NAMES = 13_u32
    SECPKG_ATTR_NEGOTIATION_INFO = 12_u32
    SECPKG_ATTR_PASSWORD_EXPIRY = 8_u32
    SECPKG_ATTR_REMOTE_CERT_CONTEXT = 83_u32
    SECPKG_ATTR_ROOT_STORE = 85_u32
    SECPKG_ATTR_SESSION_KEY = 9_u32
    SECPKG_ATTR_SESSION_INFO = 93_u32
    SECPKG_ATTR_STREAM_SIZES = 4_u32
    SECPKG_ATTR_SUPPORTED_SIGNATURES = 102_u32
    SECPKG_ATTR_TARGET_INFORMATION = 17_u32
    SECPKG_ATTR_UNIQUE_BINDINGS = 25_u32
  end
  enum MSV1_0 : UInt32
    MSV1_0_PASSTHRU = 1_u32
    MSV1_0_GUEST_LOGON = 2_u32
  end
  enum SECPKG_CRED : UInt32
    SECPKG_CRED_INBOUND = 1_u32
    SECPKG_CRED_OUTBOUND = 2_u32
  end
  enum MSV_SUB_AUTHENTICATION_FILTER : UInt32
    LOGON_GUEST = 1_u32
    LOGON_NOENCRYPTION = 2_u32
    LOGON_CACHED_ACCOUNT = 4_u32
    LOGON_USED_LM_PASSWORD = 8_u32
    LOGON_EXTRA_SIDS = 32_u32
    LOGON_SUBAUTH_SESSION_KEY = 64_u32
    LOGON_SERVER_TRUST_ACCOUNT = 128_u32
    LOGON_PROFILE_PATH_RETURNED = 1024_u32
    LOGON_RESOURCE_GROUPS = 512_u32
  end
  @[Flags]
  enum EXPORT_SECURITY_CONTEXT_FLAGS : UInt32
    SECPKG_CONTEXT_EXPORT_RESET_NEW = 1_u32
    SECPKG_CONTEXT_EXPORT_DELETE_OLD = 2_u32
    SECPKG_CONTEXT_EXPORT_TO_KERNEL = 4_u32
  end
  @[Flags]
  enum KERB_TICKET_FLAGS : UInt32
    KERB_TICKET_FLAGS_forwardable = 1073741824_u32
    KERB_TICKET_FLAGS_forwarded = 536870912_u32
    KERB_TICKET_FLAGS_hw_authent = 1048576_u32
    KERB_TICKET_FLAGS_initial = 4194304_u32
    KERB_TICKET_FLAGS_invalid = 16777216_u32
    KERB_TICKET_FLAGS_may_postdate = 67108864_u32
    KERB_TICKET_FLAGS_ok_as_delegate = 262144_u32
    KERB_TICKET_FLAGS_postdated = 33554432_u32
    KERB_TICKET_FLAGS_pre_authent = 2097152_u32
    KERB_TICKET_FLAGS_proxiable = 268435456_u32
    KERB_TICKET_FLAGS_proxy = 134217728_u32
    KERB_TICKET_FLAGS_renewable = 8388608_u32
    KERB_TICKET_FLAGS_reserved = 2147483648_u32
    KERB_TICKET_FLAGS_reserved1 = 1_u32
  end
  enum KERB_ADDRESS_TYPE : UInt32
    DS_INET_ADDRESS = 1_u32
    DS_NETBIOS_ADDRESS = 2_u32
  end
  @[Flags]
  enum SCHANNEL_CRED_FLAGS : UInt32
    SCH_CRED_AUTO_CRED_VALIDATION = 32_u32
    SCH_CRED_CACHE_ONLY_URL_RETRIEVAL_ON_CREATE = 131072_u32
    SCH_DISABLE_RECONNECTS = 128_u32
    SCH_CRED_IGNORE_NO_REVOCATION_CHECK = 2048_u32
    SCH_CRED_IGNORE_REVOCATION_OFFLINE = 4096_u32
    SCH_CRED_MANUAL_CRED_VALIDATION = 8_u32
    SCH_CRED_NO_DEFAULT_CREDS = 16_u32
    SCH_CRED_NO_SERVERNAME_CHECK = 4_u32
    SCH_CRED_NO_SYSTEM_MAPPER = 2_u32
    SCH_CRED_REVOCATION_CHECK_CHAIN = 512_u32
    SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 1024_u32
    SCH_CRED_REVOCATION_CHECK_END_CERT = 256_u32
    SCH_CRED_USE_DEFAULT_CREDS = 64_u32
    SCH_SEND_AUX_RECORD = 2097152_u32
    SCH_SEND_ROOT_CERT = 262144_u32
    SCH_USE_STRONG_CRYPTO = 4194304_u32
    SCH_USE_PRESHAREDKEY_ONLY = 8388608_u32
  end
  @[Flags]
  enum DOMAIN_PASSWORD_PROPERTIES : UInt32
    DOMAIN_PASSWORD_COMPLEX = 1_u32
    DOMAIN_PASSWORD_NO_ANON_CHANGE = 2_u32
    DOMAIN_PASSWORD_NO_CLEAR_CHANGE = 4_u32
    DOMAIN_LOCKOUT_ADMINS = 8_u32
    DOMAIN_PASSWORD_STORE_CLEARTEXT = 16_u32
    DOMAIN_REFUSE_PASSWORD_CHANGE = 32_u32
  end
  enum SCHANNEL_ALERT_TOKEN_ALERT_TYPE : UInt32
    TLS1_ALERT_WARNING = 1_u32
    TLS1_ALERT_FATAL = 2_u32
  end
  enum TRUSTED_DOMAIN_TRUST_TYPE : UInt32
    TRUST_TYPE_DOWNLEVEL = 1_u32
    TRUST_TYPE_UPLEVEL = 2_u32
    TRUST_TYPE_MIT = 3_u32
    TRUST_TYPE_DCE = 4_u32
  end
  @[Flags]
  enum MSV_SUBAUTH_LOGON_PARAMETER_CONTROL : UInt32
    MSV1_0_CLEARTEXT_PASSWORD_ALLOWED = 2_u32
    MSV1_0_UPDATE_LOGON_STATISTICS = 4_u32
    MSV1_0_RETURN_USER_PARAMETERS = 8_u32
    MSV1_0_DONT_TRY_GUEST_ACCOUNT = 16_u32
    MSV1_0_ALLOW_SERVER_TRUST_ACCOUNT = 32_u32
    MSV1_0_RETURN_PASSWORD_EXPIRY = 64_u32
    MSV1_0_ALLOW_WORKSTATION_TRUST_ACCOUNT = 2048_u32
    MSV1_0_TRY_GUEST_ACCOUNT_ONLY = 256_u32
    MSV1_0_RETURN_PROFILE_PATH = 512_u32
    MSV1_0_TRY_SPECIFIED_DOMAIN_ONLY = 1024_u32
  end
  enum KERB_REQUEST_FLAGS : UInt32
    KERB_REQUEST_ADD_CREDENTIAL = 1_u32
    KERB_REQUEST_REPLACE_CREDENTIAL = 2_u32
    KERB_REQUEST_REMOVE_CREDENTIAL = 4_u32
  end
  enum TRUSTED_DOMAIN_TRUST_DIRECTION : UInt32
    TRUST_DIRECTION_DISABLED = 0_u32
    TRUST_DIRECTION_INBOUND = 1_u32
    TRUST_DIRECTION_OUTBOUND = 2_u32
    TRUST_DIRECTION_BIDIRECTIONAL = 3_u32
  end
  @[Flags]
  enum MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS : UInt32
    MSV1_0_CRED_LM_PRESENT = 1_u32
    MSV1_0_CRED_NT_PRESENT = 2_u32
    MSV1_0_CRED_VERSION = 0_u32
  end
  enum SECURITY_PACKAGE_OPTIONS_TYPE : UInt32
    SECPKG_OPTIONS_TYPE_UNKNOWN = 0_u32
    SECPKG_OPTIONS_TYPE_LSA = 1_u32
    SECPKG_OPTIONS_TYPE_SSPI = 2_u32
  end
  enum SCHANNEL_SESSION_TOKEN_FLAGS : UInt32
    SSL_SESSION_ENABLE_RECONNECTS = 1_u32
    SSL_SESSION_DISABLE_RECONNECTS = 2_u32
  end
  enum KERB_CRYPTO_KEY_TYPE
    KERB_ETYPE_DES_CBC_CRC = 1_i32
    KERB_ETYPE_DES_CBC_MD4 = 2_i32
    KERB_ETYPE_DES_CBC_MD5 = 3_i32
    KERB_ETYPE_NULL = 0_i32
    KERB_ETYPE_RC4_HMAC_NT = 23_i32
    KERB_ETYPE_RC4_MD4 = -128_i32
  end
  enum LSA_AUTH_INFORMATION_AUTH_TYPE : UInt32
    TRUST_AUTH_TYPE_NONE = 0_u32
    TRUST_AUTH_TYPE_NT4OWF = 1_u32
    TRUST_AUTH_TYPE_CLEAR = 2_u32
    TRUST_AUTH_TYPE_VERSION = 3_u32
  end
  enum SECPKG_PACKAGE_CHANGE_TYPE : UInt32
    SECPKG_PACKAGE_CHANGE_LOAD = 0_u32
    SECPKG_PACKAGE_CHANGE_UNLOAD = 1_u32
    SECPKG_PACKAGE_CHANGE_SELECT = 2_u32
  end
  enum TRUSTED_DOMAIN_TRUST_ATTRIBUTES : UInt32
    TRUST_ATTRIBUTE_NON_TRANSITIVE = 1_u32
    TRUST_ATTRIBUTE_UPLEVEL_ONLY = 2_u32
    TRUST_ATTRIBUTE_FILTER_SIDS = 4_u32
    TRUST_ATTRIBUTE_FOREST_TRANSITIVE = 8_u32
    TRUST_ATTRIBUTE_CROSS_ORGANIZATION = 16_u32
    TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL = 64_u32
    TRUST_ATTRIBUTE_WITHIN_FOREST = 32_u32
  end
  @[Flags]
  enum ISC_REQ_FLAGS : UInt64
    ISC_REQ_DELEGATE = 1_u64
    ISC_REQ_MUTUAL_AUTH = 2_u64
    ISC_REQ_REPLAY_DETECT = 4_u64
    ISC_REQ_SEQUENCE_DETECT = 8_u64
    ISC_REQ_CONFIDENTIALITY = 16_u64
    ISC_REQ_USE_SESSION_KEY = 32_u64
    ISC_REQ_PROMPT_FOR_CREDS = 64_u64
    ISC_REQ_USE_SUPPLIED_CREDS = 128_u64
    ISC_REQ_ALLOCATE_MEMORY = 256_u64
    ISC_REQ_USE_DCE_STYLE = 512_u64
    ISC_REQ_DATAGRAM = 1024_u64
    ISC_REQ_CONNECTION = 2048_u64
    ISC_REQ_CALL_LEVEL = 4096_u64
    ISC_REQ_FRAGMENT_SUPPLIED = 8192_u64
    ISC_REQ_EXTENDED_ERROR = 16384_u64
    ISC_REQ_STREAM = 32768_u64
    ISC_REQ_INTEGRITY = 65536_u64
    ISC_REQ_IDENTIFY = 131072_u64
    ISC_REQ_NULL_SESSION = 262144_u64
    ISC_REQ_MANUAL_CRED_VALIDATION = 524288_u64
    ISC_REQ_RESERVED1 = 1048576_u64
    ISC_REQ_FRAGMENT_TO_FIT = 2097152_u64
    ISC_REQ_FORWARD_CREDENTIALS = 4194304_u64
    ISC_REQ_NO_INTEGRITY = 8388608_u64
    ISC_REQ_USE_HTTP_STYLE = 16777216_u64
    ISC_REQ_UNVERIFIED_TARGET_NAME = 536870912_u64
    ISC_REQ_CONFIDENTIALITY_ONLY = 1073741824_u64
    ISC_REQ_MESSAGES = 4294967296_u64
    ISC_REQ_DEFERRED_CRED_VALIDATION = 8589934592_u64
  end
  @[Flags]
  enum ASC_REQ_FLAGS : UInt64
    ASC_REQ_DELEGATE = 1_u64
    ASC_REQ_MUTUAL_AUTH = 2_u64
    ASC_REQ_REPLAY_DETECT = 4_u64
    ASC_REQ_SEQUENCE_DETECT = 8_u64
    ASC_REQ_CONFIDENTIALITY = 16_u64
    ASC_REQ_USE_SESSION_KEY = 32_u64
    ASC_REQ_SESSION_TICKET = 64_u64
    ASC_REQ_ALLOCATE_MEMORY = 256_u64
    ASC_REQ_USE_DCE_STYLE = 512_u64
    ASC_REQ_DATAGRAM = 1024_u64
    ASC_REQ_CONNECTION = 2048_u64
    ASC_REQ_CALL_LEVEL = 4096_u64
    ASC_REQ_FRAGMENT_SUPPLIED = 8192_u64
    ASC_REQ_EXTENDED_ERROR = 32768_u64
    ASC_REQ_STREAM = 65536_u64
    ASC_REQ_INTEGRITY = 131072_u64
    ASC_REQ_LICENSING = 262144_u64
    ASC_REQ_IDENTIFY = 524288_u64
    ASC_REQ_ALLOW_NULL_SESSION = 1048576_u64
    ASC_REQ_ALLOW_NON_USER_LOGONS = 2097152_u64
    ASC_REQ_ALLOW_CONTEXT_REPLAY = 4194304_u64
    ASC_REQ_FRAGMENT_TO_FIT = 8388608_u64
    ASC_REQ_NO_TOKEN = 16777216_u64
    ASC_REQ_PROXY_BINDINGS = 67108864_u64
    ASC_REQ_ALLOW_MISSING_BINDINGS = 268435456_u64
    ASC_REQ_MESSAGES = 4294967296_u64
  end
  enum LSA_LOOKUP_DOMAIN_INFO_CLASS
    AccountDomainInformation = 5_i32
    DnsDomainInformation = 12_i32
  end
  enum SECURITY_LOGON_TYPE
    UndefinedLogonType = 0_i32
    Interactive = 2_i32
    Network = 3_i32
    Batch = 4_i32
    Service = 5_i32
    Proxy = 6_i32
    Unlock = 7_i32
    NetworkCleartext = 8_i32
    NewCredentials = 9_i32
    RemoteInteractive = 10_i32
    CachedInteractive = 11_i32
    CachedRemoteInteractive = 12_i32
    CachedUnlock = 13_i32
  end
  enum SE_ADT_PARAMETER_TYPE
    SeAdtParmTypeNone = 0_i32
    SeAdtParmTypeString = 1_i32
    SeAdtParmTypeFileSpec = 2_i32
    SeAdtParmTypeUlong = 3_i32
    SeAdtParmTypeSid = 4_i32
    SeAdtParmTypeLogonId = 5_i32
    SeAdtParmTypeNoLogonId = 6_i32
    SeAdtParmTypeAccessMask = 7_i32
    SeAdtParmTypePrivs = 8_i32
    SeAdtParmTypeObjectTypes = 9_i32
    SeAdtParmTypeHexUlong = 10_i32
    SeAdtParmTypePtr = 11_i32
    SeAdtParmTypeTime = 12_i32
    SeAdtParmTypeGuid = 13_i32
    SeAdtParmTypeLuid = 14_i32
    SeAdtParmTypeHexInt64 = 15_i32
    SeAdtParmTypeStringList = 16_i32
    SeAdtParmTypeSidList = 17_i32
    SeAdtParmTypeDuration = 18_i32
    SeAdtParmTypeUserAccountControl = 19_i32
    SeAdtParmTypeNoUac = 20_i32
    SeAdtParmTypeMessage = 21_i32
    SeAdtParmTypeDateTime = 22_i32
    SeAdtParmTypeSockAddr = 23_i32
    SeAdtParmTypeSD = 24_i32
    SeAdtParmTypeLogonHours = 25_i32
    SeAdtParmTypeLogonIdNoSid = 26_i32
    SeAdtParmTypeUlongNoConv = 27_i32
    SeAdtParmTypeSockAddrNoPort = 28_i32
    SeAdtParmTypeAccessReason = 29_i32
    SeAdtParmTypeStagingReason = 30_i32
    SeAdtParmTypeResourceAttribute = 31_i32
    SeAdtParmTypeClaims = 32_i32
    SeAdtParmTypeLogonIdAsSid = 33_i32
    SeAdtParmTypeMultiSzString = 34_i32
    SeAdtParmTypeLogonIdEx = 35_i32
  end
  enum POLICY_AUDIT_EVENT_TYPE
    AuditCategorySystem = 0_i32
    AuditCategoryLogon = 1_i32
    AuditCategoryObjectAccess = 2_i32
    AuditCategoryPrivilegeUse = 3_i32
    AuditCategoryDetailedTracking = 4_i32
    AuditCategoryPolicyChange = 5_i32
    AuditCategoryAccountManagement = 6_i32
    AuditCategoryDirectoryServiceAccess = 7_i32
    AuditCategoryAccountLogon = 8_i32
  end
  enum POLICY_LSA_SERVER_ROLE
    PolicyServerRoleBackup = 2_i32
    PolicyServerRolePrimary = 3_i32
  end
  enum POLICY_INFORMATION_CLASS
    PolicyAuditLogInformation = 1_i32
    PolicyAuditEventsInformation = 2_i32
    PolicyPrimaryDomainInformation = 3_i32
    PolicyPdAccountInformation = 4_i32
    PolicyAccountDomainInformation = 5_i32
    PolicyLsaServerRoleInformation = 6_i32
    PolicyReplicaSourceInformation = 7_i32
    PolicyDefaultQuotaInformation = 8_i32
    PolicyModificationInformation = 9_i32
    PolicyAuditFullSetInformation = 10_i32
    PolicyAuditFullQueryInformation = 11_i32
    PolicyDnsDomainInformation = 12_i32
    PolicyDnsDomainInformationInt = 13_i32
    PolicyLocalAccountDomainInformation = 14_i32
    PolicyMachineAccountInformation = 15_i32
    PolicyLastEntry = 16_i32
  end
  enum POLICY_DOMAIN_INFORMATION_CLASS
    PolicyDomainEfsInformation = 2_i32
    PolicyDomainKerberosTicketInformation = 3_i32
  end
  enum POLICY_NOTIFICATION_INFORMATION_CLASS
    PolicyNotifyAuditEventsInformation = 1_i32
    PolicyNotifyAccountDomainInformation = 2_i32
    PolicyNotifyServerRoleInformation = 3_i32
    PolicyNotifyDnsDomainInformation = 4_i32
    PolicyNotifyDomainEfsInformation = 5_i32
    PolicyNotifyDomainKerberosTicketInformation = 6_i32
    PolicyNotifyMachineAccountPasswordInformation = 7_i32
    PolicyNotifyGlobalSaclInformation = 8_i32
    PolicyNotifyMax = 9_i32
  end
  enum TRUSTED_INFORMATION_CLASS
    TrustedDomainNameInformation = 1_i32
    TrustedControllersInformation = 2_i32
    TrustedPosixOffsetInformation = 3_i32
    TrustedPasswordInformation = 4_i32
    TrustedDomainInformationBasic = 5_i32
    TrustedDomainInformationEx = 6_i32
    TrustedDomainAuthInformation = 7_i32
    TrustedDomainFullInformation = 8_i32
    TrustedDomainAuthInformationInternal = 9_i32
    TrustedDomainFullInformationInternal = 10_i32
    TrustedDomainInformationEx2Internal = 11_i32
    TrustedDomainFullInformation2Internal = 12_i32
    TrustedDomainSupportedEncryptionTypes = 13_i32
  end
  enum LSA_FOREST_TRUST_RECORD_TYPE
    ForestTrustTopLevelName = 0_i32
    ForestTrustTopLevelNameEx = 1_i32
    ForestTrustDomainInfo = 2_i32
    ForestTrustRecordTypeLast = 2_i32
  end
  enum LSA_FOREST_TRUST_COLLISION_RECORD_TYPE
    CollisionTdo = 0_i32
    CollisionXref = 1_i32
    CollisionOther = 2_i32
  end
  enum NEGOTIATE_MESSAGES
    NegEnumPackagePrefixes = 0_i32
    NegGetCallerName = 1_i32
    NegTransferCredentials = 2_i32
    NegMsgReserved1 = 3_i32
    NegCallPackageMax = 4_i32
  end
  enum MSV1_0_LOGON_SUBMIT_TYPE
    MsV1_0InteractiveLogon = 2_i32
    MsV1_0Lm20Logon = 3_i32
    MsV1_0NetworkLogon = 4_i32
    MsV1_0SubAuthLogon = 5_i32
    MsV1_0WorkstationUnlockLogon = 7_i32
    MsV1_0S4ULogon = 12_i32
    MsV1_0VirtualLogon = 82_i32
    MsV1_0NoElevationLogon = 83_i32
    MsV1_0LuidLogon = 84_i32
  end
  enum MSV1_0_PROFILE_BUFFER_TYPE
    MsV1_0InteractiveProfile = 2_i32
    MsV1_0Lm20LogonProfile = 3_i32
    MsV1_0SmartCardProfile = 4_i32
  end
  enum MSV1_0_CREDENTIAL_KEY_TYPE
    InvalidCredKey = 0_i32
    DeprecatedIUMCredKey = 1_i32
    DomainUserCredKey = 2_i32
    LocalUserCredKey = 3_i32
    ExternallySuppliedCredKey = 4_i32
  end
  enum MSV1_0_AVID
    MsvAvEOL = 0_i32
    MsvAvNbComputerName = 1_i32
    MsvAvNbDomainName = 2_i32
    MsvAvDnsComputerName = 3_i32
    MsvAvDnsDomainName = 4_i32
    MsvAvDnsTreeName = 5_i32
    MsvAvFlags = 6_i32
    MsvAvTimestamp = 7_i32
    MsvAvRestrictions = 8_i32
    MsvAvTargetName = 9_i32
    MsvAvChannelBindings = 10_i32
  end
  enum MSV1_0_PROTOCOL_MESSAGE_TYPE
    MsV1_0Lm20ChallengeRequest = 0_i32
    MsV1_0Lm20GetChallengeResponse = 1_i32
    MsV1_0EnumerateUsers = 2_i32
    MsV1_0GetUserInfo = 3_i32
    MsV1_0ReLogonUsers = 4_i32
    MsV1_0ChangePassword = 5_i32
    MsV1_0ChangeCachedPassword = 6_i32
    MsV1_0GenericPassthrough = 7_i32
    MsV1_0CacheLogon = 8_i32
    MsV1_0SubAuth = 9_i32
    MsV1_0DeriveCredential = 10_i32
    MsV1_0CacheLookup = 11_i32
    MsV1_0SetProcessOption = 12_i32
    MsV1_0ConfigLocalAliases = 13_i32
    MsV1_0ClearCachedCredentials = 14_i32
    MsV1_0LookupToken = 15_i32
    MsV1_0ValidateAuth = 16_i32
    MsV1_0CacheLookupEx = 17_i32
    MsV1_0GetCredentialKey = 18_i32
    MsV1_0SetThreadOption = 19_i32
    MsV1_0DecryptDpapiMasterKey = 20_i32
    MsV1_0GetStrongCredentialKey = 21_i32
    MsV1_0TransferCred = 22_i32
    MsV1_0ProvisionTbal = 23_i32
    MsV1_0DeleteTbalSecrets = 24_i32
  end
  enum KERB_LOGON_SUBMIT_TYPE
    KerbInteractiveLogon = 2_i32
    KerbSmartCardLogon = 6_i32
    KerbWorkstationUnlockLogon = 7_i32
    KerbSmartCardUnlockLogon = 8_i32
    KerbProxyLogon = 9_i32
    KerbTicketLogon = 10_i32
    KerbTicketUnlockLogon = 11_i32
    KerbS4ULogon = 12_i32
    KerbCertificateLogon = 13_i32
    KerbCertificateS4ULogon = 14_i32
    KerbCertificateUnlockLogon = 15_i32
    KerbNoElevationLogon = 83_i32
    KerbLuidLogon = 84_i32
  end
  enum KERB_PROFILE_BUFFER_TYPE
    KerbInteractiveProfile = 2_i32
    KerbSmartCardProfile = 4_i32
    KerbTicketProfile = 6_i32
  end
  enum KERB_PROTOCOL_MESSAGE_TYPE
    KerbDebugRequestMessage = 0_i32
    KerbQueryTicketCacheMessage = 1_i32
    KerbChangeMachinePasswordMessage = 2_i32
    KerbVerifyPacMessage = 3_i32
    KerbRetrieveTicketMessage = 4_i32
    KerbUpdateAddressesMessage = 5_i32
    KerbPurgeTicketCacheMessage = 6_i32
    KerbChangePasswordMessage = 7_i32
    KerbRetrieveEncodedTicketMessage = 8_i32
    KerbDecryptDataMessage = 9_i32
    KerbAddBindingCacheEntryMessage = 10_i32
    KerbSetPasswordMessage = 11_i32
    KerbSetPasswordExMessage = 12_i32
    KerbVerifyCredentialsMessage = 13_i32
    KerbQueryTicketCacheExMessage = 14_i32
    KerbPurgeTicketCacheExMessage = 15_i32
    KerbRefreshSmartcardCredentialsMessage = 16_i32
    KerbAddExtraCredentialsMessage = 17_i32
    KerbQuerySupplementalCredentialsMessage = 18_i32
    KerbTransferCredentialsMessage = 19_i32
    KerbQueryTicketCacheEx2Message = 20_i32
    KerbSubmitTicketMessage = 21_i32
    KerbAddExtraCredentialsExMessage = 22_i32
    KerbQueryKdcProxyCacheMessage = 23_i32
    KerbPurgeKdcProxyCacheMessage = 24_i32
    KerbQueryTicketCacheEx3Message = 25_i32
    KerbCleanupMachinePkinitCredsMessage = 26_i32
    KerbAddBindingCacheEntryExMessage = 27_i32
    KerbQueryBindingCacheMessage = 28_i32
    KerbPurgeBindingCacheMessage = 29_i32
    KerbPinKdcMessage = 30_i32
    KerbUnpinAllKdcsMessage = 31_i32
    KerbQueryDomainExtendedPoliciesMessage = 32_i32
    KerbQueryS4U2ProxyCacheMessage = 33_i32
    KerbRetrieveKeyTabMessage = 34_i32
    KerbRefreshPolicyMessage = 35_i32
    KerbPrintCloudKerberosDebugMessage = 36_i32
  end
  enum KERB_CERTIFICATE_INFO_TYPE
    CertHashInfo = 1_i32
  end
  enum PKU2U_LOGON_SUBMIT_TYPE
    Pku2uCertificateS4ULogon = 14_i32
  end
  enum SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT
    SecApplicationProtocolNegotiationExt_None = 0_i32
    SecApplicationProtocolNegotiationExt_NPN = 1_i32
    SecApplicationProtocolNegotiationExt_ALPN = 2_i32
  end
  enum SEC_TRAFFIC_SECRET_TYPE
    SecTrafficSecret_None = 0_i32
    SecTrafficSecret_Client = 1_i32
    SecTrafficSecret_Server = 2_i32
  end
  enum SECPKG_CRED_CLASS
    SecPkgCredClass_None = 0_i32
    SecPkgCredClass_Ephemeral = 10_i32
    SecPkgCredClass_PersistedGeneric = 20_i32
    SecPkgCredClass_PersistedSpecific = 30_i32
    SecPkgCredClass_Explicit = 40_i32
  end
  enum SECPKG_ATTR_LCT_STATUS
    SecPkgAttrLastClientTokenYes = 0_i32
    SecPkgAttrLastClientTokenNo = 1_i32
    SecPkgAttrLastClientTokenMaybe = 2_i32
  end
  enum SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS
    SecApplicationProtocolNegotiationStatus_None = 0_i32
    SecApplicationProtocolNegotiationStatus_Success = 1_i32
    SecApplicationProtocolNegotiationStatus_SelectedClientOnly = 2_i32
  end
  enum SecDelegationType
    SecFull = 0_i32
    SecService = 1_i32
    SecTree = 2_i32
    SecDirectory = 3_i32
    SecObject = 4_i32
  end
  enum SASL_AUTHZID_STATE
    Sasl_AuthZIDForbidden = 0_i32
    Sasl_AuthZIDProcessed = 1_i32
  end
  enum LSA_TOKEN_INFORMATION_TYPE
    LsaTokenInformationNull = 0_i32
    LsaTokenInformationV1 = 1_i32
    LsaTokenInformationV2 = 2_i32
    LsaTokenInformationV3 = 3_i32
  end
  enum SECPKG_EXTENDED_INFORMATION_CLASS
    SecpkgGssInfo = 1_i32
    SecpkgContextThunks = 2_i32
    SecpkgMutualAuthLevel = 3_i32
    SecpkgWowClientDll = 4_i32
    SecpkgExtraOids = 5_i32
    SecpkgMaxInfo = 6_i32
    SecpkgNego2Info = 7_i32
  end
  enum SECPKG_CALL_PACKAGE_MESSAGE_TYPE
    SecPkgCallPackageMinMessage = 1024_i32
    SecPkgCallPackagePinDcMessage = 1024_i32
    SecPkgCallPackageUnpinAllDcsMessage = 1025_i32
    SecPkgCallPackageTransferCredMessage = 1026_i32
    SecPkgCallPackageMaxMessage = 1026_i32
  end
  enum SECPKG_SESSIONINFO_TYPE
    SecSessionPrimaryCred = 0_i32
  end
  enum SECPKG_NAME_TYPE
    SecNameSamCompatible = 0_i32
    SecNameAlternateId = 1_i32
    SecNameFlat = 2_i32
    SecNameDN = 3_i32
    SecNameSPN = 4_i32
  end
  enum CRED_FETCH
    CredFetchDefault = 0_i32
    CredFetchDPAPI = 1_i32
    CredFetchForced = 2_i32
  end
  enum KSEC_CONTEXT_TYPE
    KSecPaged = 0_i32
    KSecNonPaged = 1_i32
  end
  enum Etlssignaturealgorithm
    TlsSignatureAlgorithm_Anonymous = 0_i32
    TlsSignatureAlgorithm_Rsa = 1_i32
    TlsSignatureAlgorithm_Dsa = 2_i32
    TlsSignatureAlgorithm_Ecdsa = 3_i32
  end
  enum Etlshashalgorithm
    TlsHashAlgorithm_None = 0_i32
    TlsHashAlgorithm_Md5 = 1_i32
    TlsHashAlgorithm_Sha1 = 2_i32
    TlsHashAlgorithm_Sha224 = 3_i32
    TlsHashAlgorithm_Sha256 = 4_i32
    TlsHashAlgorithm_Sha384 = 5_i32
    TlsHashAlgorithm_Sha512 = 6_i32
  end
  @[Flags]
  enum SchGetExtensionsOptions : UInt32
    SCH_EXTENSIONS_OPTIONS_NONE = 0_u32
    SCH_NO_RECORD_HEADER = 1_u32
  end
  enum NETLOGON_LOGON_INFO_CLASS
    NetlogonInteractiveInformation = 1_i32
    NetlogonNetworkInformation = 2_i32
    NetlogonServiceInformation = 3_i32
    NetlogonGenericInformation = 4_i32
    NetlogonInteractiveTransitiveInformation = 5_i32
    NetlogonNetworkTransitiveInformation = 6_i32
    NetlogonServiceTransitiveInformation = 7_i32
  end
  enum TOKENBINDING_TYPE
    TOKENBINDING_TYPE_PROVIDED = 0_i32
    TOKENBINDING_TYPE_REFERRED = 1_i32
  end
  enum TOKENBINDING_EXTENSION_FORMAT
    TOKENBINDING_EXTENSION_FORMAT_UNDEFINED = 0_i32
  end
  enum TOKENBINDING_KEY_PARAMETERS_TYPE
    TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PKCS = 0_i32
    TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PSS = 1_i32
    TOKENBINDING_KEY_PARAMETERS_TYPE_ECDSAP256 = 2_i32
    TOKENBINDING_KEY_PARAMETERS_TYPE_ANYEXISTING = 255_i32
  end
  enum EXTENDED_NAME_FORMAT
    NameUnknown = 0_i32
    NameFullyQualifiedDN = 1_i32
    NameSamCompatible = 2_i32
    NameDisplay = 3_i32
    NameUniqueId = 6_i32
    NameCanonical = 7_i32
    NameUserPrincipal = 8_i32
    NameCanonicalEx = 9_i32
    NameServicePrincipal = 10_i32
    NameDnsDomain = 12_i32
    NameGivenName = 13_i32
    NameSurname = 14_i32
  end
  enum SLDATATYPE : UInt32
    SL_DATA_NONE = 0_u32
    SL_DATA_SZ = 1_u32
    SL_DATA_DWORD = 4_u32
    SL_DATA_BINARY = 3_u32
    SL_DATA_MULTI_SZ = 7_u32
    SL_DATA_SUM = 100_u32
  end
  enum SLIDTYPE
    SL_ID_APPLICATION = 0_i32
    SL_ID_PRODUCT_SKU = 1_i32
    SL_ID_LICENSE_FILE = 2_i32
    SL_ID_LICENSE = 3_i32
    SL_ID_PKEY = 4_i32
    SL_ID_ALL_LICENSES = 5_i32
    SL_ID_ALL_LICENSE_FILES = 6_i32
    SL_ID_STORE_TOKEN = 7_i32
    SL_ID_LAST = 8_i32
  end
  enum SLLICENSINGSTATUS
    SL_LICENSING_STATUS_UNLICENSED = 0_i32
    SL_LICENSING_STATUS_LICENSED = 1_i32
    SL_LICENSING_STATUS_IN_GRACE_PERIOD = 2_i32
    SL_LICENSING_STATUS_NOTIFICATION = 3_i32
    SL_LICENSING_STATUS_LAST = 4_i32
  end
  enum SL_ACTIVATION_TYPE
    SL_ACTIVATION_TYPE_DEFAULT = 0_i32
    SL_ACTIVATION_TYPE_ACTIVE_DIRECTORY = 1_i32
  end
  enum SLREFERRALTYPE
    SL_REFERRALTYPE_SKUID = 0_i32
    SL_REFERRALTYPE_APPID = 1_i32
    SL_REFERRALTYPE_OVERRIDE_SKUID = 2_i32
    SL_REFERRALTYPE_OVERRIDE_APPID = 3_i32
    SL_REFERRALTYPE_BEST_MATCH = 4_i32
  end
  enum SL_GENUINE_STATE
    SL_GEN_STATE_IS_GENUINE = 0_i32
    SL_GEN_STATE_INVALID_LICENSE = 1_i32
    SL_GEN_STATE_TAMPERED = 2_i32
    SL_GEN_STATE_OFFLINE = 3_i32
    SL_GEN_STATE_LAST = 4_i32
  end

  @[Extern]
  struct LSA_TRUST_INFORMATION
    property name : Win32cr::Foundation::UNICODE_STRING
    property sid : Win32cr::Foundation::PSID
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING, @sid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct LSA_REFERENCED_DOMAIN_LIST
    property entries : UInt32
    property domains : Win32cr::Security::Authentication::Identity::LSA_TRUST_INFORMATION*
    def initialize(@entries : UInt32, @domains : Win32cr::Security::Authentication::Identity::LSA_TRUST_INFORMATION*)
    end
  end

  @[Extern]
  struct LSA_TRANSLATED_SID2
    property use : Win32cr::Security::SID_NAME_USE
    property sid : Win32cr::Foundation::PSID
    property domain_index : Int32
    property flags : UInt32
    def initialize(@use : Win32cr::Security::SID_NAME_USE, @sid : Win32cr::Foundation::PSID, @domain_index : Int32, @flags : UInt32)
    end
  end

  @[Extern]
  struct LSA_TRANSLATED_NAME
    property use : Win32cr::Security::SID_NAME_USE
    property name : Win32cr::Foundation::UNICODE_STRING
    property domain_index : Int32
    def initialize(@use : Win32cr::Security::SID_NAME_USE, @name : Win32cr::Foundation::UNICODE_STRING, @domain_index : Int32)
    end
  end

  @[Extern]
  struct POLICY_ACCOUNT_DOMAIN_INFO
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property domain_sid : Win32cr::Foundation::PSID
    def initialize(@domain_name : Win32cr::Foundation::UNICODE_STRING, @domain_sid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct POLICY_DNS_DOMAIN_INFO
    property name : Win32cr::Foundation::UNICODE_STRING
    property dns_domain_name : Win32cr::Foundation::UNICODE_STRING
    property dns_forest_name : Win32cr::Foundation::UNICODE_STRING
    property domain_guid : LibC::GUID
    property sid : Win32cr::Foundation::PSID
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING, @dns_domain_name : Win32cr::Foundation::UNICODE_STRING, @dns_forest_name : Win32cr::Foundation::UNICODE_STRING, @domain_guid : LibC::GUID, @sid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct SE_ADT_OBJECT_TYPE
    property object_type : LibC::GUID
    property flags : UInt16
    property level : UInt16
    property access_mask : UInt32
    def initialize(@object_type : LibC::GUID, @flags : UInt16, @level : UInt16, @access_mask : UInt32)
    end
  end

  @[Extern]
  struct SE_ADT_PARAMETER_ARRAY_ENTRY
    property type__ : Win32cr::Security::Authentication::Identity::SE_ADT_PARAMETER_TYPE
    property length : UInt32
    property data : LibC::UIntPtrT[2]
    property address : Void*
    def initialize(@type__ : Win32cr::Security::Authentication::Identity::SE_ADT_PARAMETER_TYPE, @length : UInt32, @data : LibC::UIntPtrT[2], @address : Void*)
    end
  end

  @[Extern]
  struct SE_ADT_ACCESS_REASON
    property access_mask : UInt32
    property access_reasons : UInt32[32]
    property object_type_index : UInt32
    property access_granted : UInt32
    property security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR
    def initialize(@access_mask : UInt32, @access_reasons : UInt32[32], @object_type_index : UInt32, @access_granted : UInt32, @security_descriptor : Win32cr::Security::PSECURITY_DESCRIPTOR)
    end
  end

  @[Extern]
  struct SE_ADT_CLAIMS
    property length : UInt32
    property claims : Void*
    def initialize(@length : UInt32, @claims : Void*)
    end
  end

  @[Extern]
  struct SE_ADT_PARAMETER_ARRAY
    property category_id : UInt32
    property audit_id : UInt32
    property parameter_count : UInt32
    property length : UInt32
    property flat_sub_category_id : UInt16
    property type__ : UInt16
    property flags : UInt32
    property parameters : Win32cr::Security::Authentication::Identity::SE_ADT_PARAMETER_ARRAY_ENTRY[32]
    def initialize(@category_id : UInt32, @audit_id : UInt32, @parameter_count : UInt32, @length : UInt32, @flat_sub_category_id : UInt16, @type__ : UInt16, @flags : UInt32, @parameters : Win32cr::Security::Authentication::Identity::SE_ADT_PARAMETER_ARRAY_ENTRY[32])
    end
  end

  @[Extern]
  struct SE_ADT_PARAMETER_ARRAY_EX
    property category_id : UInt32
    property audit_id : UInt32
    property version : UInt32
    property parameter_count : UInt32
    property length : UInt32
    property flat_sub_category_id : UInt16
    property type__ : UInt16
    property flags : UInt32
    property parameters : Win32cr::Security::Authentication::Identity::SE_ADT_PARAMETER_ARRAY_ENTRY[32]
    def initialize(@category_id : UInt32, @audit_id : UInt32, @version : UInt32, @parameter_count : UInt32, @length : UInt32, @flat_sub_category_id : UInt16, @type__ : UInt16, @flags : UInt32, @parameters : Win32cr::Security::Authentication::Identity::SE_ADT_PARAMETER_ARRAY_ENTRY[32])
    end
  end

  @[Extern]
  struct LSA_TRANSLATED_SID
    property use : Win32cr::Security::SID_NAME_USE
    property relative_id : UInt32
    property domain_index : Int32
    def initialize(@use : Win32cr::Security::SID_NAME_USE, @relative_id : UInt32, @domain_index : Int32)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_LOG_INFO
    property audit_log_percent_full : UInt32
    property maximum_log_size : UInt32
    property audit_retention_period : Win32cr::Foundation::LARGE_INTEGER
    property audit_log_full_shutdown_in_progress : Win32cr::Foundation::BOOLEAN
    property time_to_shutdown : Win32cr::Foundation::LARGE_INTEGER
    property next_audit_record_id : UInt32
    def initialize(@audit_log_percent_full : UInt32, @maximum_log_size : UInt32, @audit_retention_period : Win32cr::Foundation::LARGE_INTEGER, @audit_log_full_shutdown_in_progress : Win32cr::Foundation::BOOLEAN, @time_to_shutdown : Win32cr::Foundation::LARGE_INTEGER, @next_audit_record_id : UInt32)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_EVENTS_INFO
    property auditing_mode : Win32cr::Foundation::BOOLEAN
    property event_auditing_options : UInt32*
    property maximum_audit_event_count : UInt32
    def initialize(@auditing_mode : Win32cr::Foundation::BOOLEAN, @event_auditing_options : UInt32*, @maximum_audit_event_count : UInt32)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_SUBCATEGORIES_INFO
    property maximum_sub_category_count : UInt32
    property event_auditing_options : UInt32*
    def initialize(@maximum_sub_category_count : UInt32, @event_auditing_options : UInt32*)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_CATEGORIES_INFO
    property maximum_category_count : UInt32
    property sub_categories_info : Win32cr::Security::Authentication::Identity::POLICY_AUDIT_SUBCATEGORIES_INFO*
    def initialize(@maximum_category_count : UInt32, @sub_categories_info : Win32cr::Security::Authentication::Identity::POLICY_AUDIT_SUBCATEGORIES_INFO*)
    end
  end

  @[Extern]
  struct POLICY_PRIMARY_DOMAIN_INFO
    property name : Win32cr::Foundation::UNICODE_STRING
    property sid : Win32cr::Foundation::PSID
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING, @sid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct POLICY_PD_ACCOUNT_INFO
    property name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct POLICY_LSA_SERVER_ROLE_INFO
    property lsa_server_role : Win32cr::Security::Authentication::Identity::POLICY_LSA_SERVER_ROLE
    def initialize(@lsa_server_role : Win32cr::Security::Authentication::Identity::POLICY_LSA_SERVER_ROLE)
    end
  end

  @[Extern]
  struct POLICY_REPLICA_SOURCE_INFO
    property replica_source : Win32cr::Foundation::UNICODE_STRING
    property replica_account_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@replica_source : Win32cr::Foundation::UNICODE_STRING, @replica_account_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct POLICY_DEFAULT_QUOTA_INFO
    property quota_limits : Win32cr::Security::QUOTA_LIMITS
    def initialize(@quota_limits : Win32cr::Security::QUOTA_LIMITS)
    end
  end

  @[Extern]
  struct POLICY_MODIFICATION_INFO
    property modified_id : Win32cr::Foundation::LARGE_INTEGER
    property database_creation_time : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@modified_id : Win32cr::Foundation::LARGE_INTEGER, @database_creation_time : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_FULL_SET_INFO
    property shut_down_on_full : Win32cr::Foundation::BOOLEAN
    def initialize(@shut_down_on_full : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_FULL_QUERY_INFO
    property shut_down_on_full : Win32cr::Foundation::BOOLEAN
    property log_is_full : Win32cr::Foundation::BOOLEAN
    def initialize(@shut_down_on_full : Win32cr::Foundation::BOOLEAN, @log_is_full : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct POLICY_DOMAIN_EFS_INFO
    property info_length : UInt32
    property efs_blob : UInt8*
    def initialize(@info_length : UInt32, @efs_blob : UInt8*)
    end
  end

  @[Extern]
  struct POLICY_DOMAIN_KERBEROS_TICKET_INFO
    property authentication_options : UInt32
    property max_service_ticket_age : Win32cr::Foundation::LARGE_INTEGER
    property max_ticket_age : Win32cr::Foundation::LARGE_INTEGER
    property max_renew_age : Win32cr::Foundation::LARGE_INTEGER
    property max_clock_skew : Win32cr::Foundation::LARGE_INTEGER
    property reserved : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@authentication_options : UInt32, @max_service_ticket_age : Win32cr::Foundation::LARGE_INTEGER, @max_ticket_age : Win32cr::Foundation::LARGE_INTEGER, @max_renew_age : Win32cr::Foundation::LARGE_INTEGER, @max_clock_skew : Win32cr::Foundation::LARGE_INTEGER, @reserved : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct POLICY_MACHINE_ACCT_INFO
    property rid : UInt32
    property sid : Win32cr::Foundation::PSID
    def initialize(@rid : UInt32, @sid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_NAME_INFO
    property name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct TRUSTED_CONTROLLERS_INFO
    property entries : UInt32
    property names : Win32cr::Foundation::UNICODE_STRING*
    def initialize(@entries : UInt32, @names : Win32cr::Foundation::UNICODE_STRING*)
    end
  end

  @[Extern]
  struct TRUSTED_POSIX_OFFSET_INFO
    property offset : UInt32
    def initialize(@offset : UInt32)
    end
  end

  @[Extern]
  struct TRUSTED_PASSWORD_INFO
    property password : Win32cr::Foundation::UNICODE_STRING
    property old_password : Win32cr::Foundation::UNICODE_STRING
    def initialize(@password : Win32cr::Foundation::UNICODE_STRING, @old_password : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_INFORMATION_EX
    property name : Win32cr::Foundation::UNICODE_STRING
    property flat_name : Win32cr::Foundation::UNICODE_STRING
    property sid : Win32cr::Foundation::PSID
    property trust_direction : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_TRUST_DIRECTION
    property trust_type : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_TRUST_TYPE
    property trust_attributes : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_TRUST_ATTRIBUTES
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING, @flat_name : Win32cr::Foundation::UNICODE_STRING, @sid : Win32cr::Foundation::PSID, @trust_direction : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_TRUST_DIRECTION, @trust_type : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_TRUST_TYPE, @trust_attributes : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_TRUST_ATTRIBUTES)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_INFORMATION_EX2
    property name : Win32cr::Foundation::UNICODE_STRING
    property flat_name : Win32cr::Foundation::UNICODE_STRING
    property sid : Win32cr::Foundation::PSID
    property trust_direction : UInt32
    property trust_type : UInt32
    property trust_attributes : UInt32
    property forest_trust_length : UInt32
    property forest_trust_info : UInt8*
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING, @flat_name : Win32cr::Foundation::UNICODE_STRING, @sid : Win32cr::Foundation::PSID, @trust_direction : UInt32, @trust_type : UInt32, @trust_attributes : UInt32, @forest_trust_length : UInt32, @forest_trust_info : UInt8*)
    end
  end

  @[Extern]
  struct LSA_AUTH_INFORMATION
    property last_update_time : Win32cr::Foundation::LARGE_INTEGER
    property auth_type : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION_AUTH_TYPE
    property auth_info_length : UInt32
    property auth_info : UInt8*
    def initialize(@last_update_time : Win32cr::Foundation::LARGE_INTEGER, @auth_type : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION_AUTH_TYPE, @auth_info_length : UInt32, @auth_info : UInt8*)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_AUTH_INFORMATION
    property incoming_auth_infos : UInt32
    property incoming_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*
    property incoming_previous_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*
    property outgoing_auth_infos : UInt32
    property outgoing_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*
    property outgoing_previous_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*
    def initialize(@incoming_auth_infos : UInt32, @incoming_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*, @incoming_previous_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*, @outgoing_auth_infos : UInt32, @outgoing_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*, @outgoing_previous_authentication_information : Win32cr::Security::Authentication::Identity::LSA_AUTH_INFORMATION*)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_FULL_INFORMATION
    property information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_INFORMATION_EX
    property posix_offset : Win32cr::Security::Authentication::Identity::TRUSTED_POSIX_OFFSET_INFO
    property auth_information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_AUTH_INFORMATION
    def initialize(@information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_INFORMATION_EX, @posix_offset : Win32cr::Security::Authentication::Identity::TRUSTED_POSIX_OFFSET_INFO, @auth_information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_AUTH_INFORMATION)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_FULL_INFORMATION2
    property information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_INFORMATION_EX2
    property posix_offset : Win32cr::Security::Authentication::Identity::TRUSTED_POSIX_OFFSET_INFO
    property auth_information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_AUTH_INFORMATION
    def initialize(@information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_INFORMATION_EX2, @posix_offset : Win32cr::Security::Authentication::Identity::TRUSTED_POSIX_OFFSET_INFO, @auth_information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_AUTH_INFORMATION)
    end
  end

  @[Extern]
  struct TRUSTED_DOMAIN_SUPPORTED_ENCRYPTION_TYPES
    property supported_encryption_types : UInt32
    def initialize(@supported_encryption_types : UInt32)
    end
  end

  @[Extern]
  struct LSA_FOREST_TRUST_DOMAIN_INFO
    property sid : Win32cr::Foundation::PSID
    property dns_name : Win32cr::Foundation::UNICODE_STRING
    property netbios_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@sid : Win32cr::Foundation::PSID, @dns_name : Win32cr::Foundation::UNICODE_STRING, @netbios_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct LSA_FOREST_TRUST_BINARY_DATA
    property length : UInt32
    property buffer : UInt8*
    def initialize(@length : UInt32, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct LSA_FOREST_TRUST_RECORD
    property flags : UInt32
    property forest_trust_type : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_RECORD_TYPE
    property time : Win32cr::Foundation::LARGE_INTEGER
    property forest_trust_data : ForestTrustData_e__Union_

    # Nested Type ForestTrustData_e__Union_
    @[Extern(union: true)]
    struct ForestTrustData_e__Union_
    property top_level_name : Win32cr::Foundation::UNICODE_STRING
    property domain_info : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_DOMAIN_INFO
    property data : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_BINARY_DATA
    def initialize(@top_level_name : Win32cr::Foundation::UNICODE_STRING, @domain_info : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_DOMAIN_INFO, @data : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_BINARY_DATA)
    end
    end

    def initialize(@flags : UInt32, @forest_trust_type : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_RECORD_TYPE, @time : Win32cr::Foundation::LARGE_INTEGER, @forest_trust_data : ForestTrustData_e__Union_)
    end
  end

  @[Extern]
  struct LSA_FOREST_TRUST_INFORMATION
    property record_count : UInt32
    property entries : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_RECORD**
    def initialize(@record_count : UInt32, @entries : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_RECORD**)
    end
  end

  @[Extern]
  struct LSA_FOREST_TRUST_COLLISION_RECORD
    property index : UInt32
    property type__ : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_COLLISION_RECORD_TYPE
    property flags : UInt32
    property name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@index : UInt32, @type__ : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_COLLISION_RECORD_TYPE, @flags : UInt32, @name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct LSA_FOREST_TRUST_COLLISION_INFORMATION
    property record_count : UInt32
    property entries : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_COLLISION_RECORD**
    def initialize(@record_count : UInt32, @entries : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_COLLISION_RECORD**)
    end
  end

  @[Extern]
  struct LSA_ENUMERATION_INFORMATION
    property sid : Win32cr::Foundation::PSID
    def initialize(@sid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct LSA_LAST_INTER_LOGON_INFO
    property last_successful_logon : Win32cr::Foundation::LARGE_INTEGER
    property last_failed_logon : Win32cr::Foundation::LARGE_INTEGER
    property failed_attempt_count_since_last_successful_logon : UInt32
    def initialize(@last_successful_logon : Win32cr::Foundation::LARGE_INTEGER, @last_failed_logon : Win32cr::Foundation::LARGE_INTEGER, @failed_attempt_count_since_last_successful_logon : UInt32)
    end
  end

  @[Extern]
  struct SECURITY_LOGON_SESSION_DATA
    property size : UInt32
    property logon_id : Win32cr::Foundation::LUID
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property logon_domain : Win32cr::Foundation::UNICODE_STRING
    property authentication_package : Win32cr::Foundation::UNICODE_STRING
    property logon_type : UInt32
    property session : UInt32
    property sid : Win32cr::Foundation::PSID
    property logon_time : Win32cr::Foundation::LARGE_INTEGER
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property dns_domain_name : Win32cr::Foundation::UNICODE_STRING
    property upn : Win32cr::Foundation::UNICODE_STRING
    property user_flags : UInt32
    property last_logon_info : Win32cr::Security::Authentication::Identity::LSA_LAST_INTER_LOGON_INFO
    property logon_script : Win32cr::Foundation::UNICODE_STRING
    property profile_path : Win32cr::Foundation::UNICODE_STRING
    property home_directory : Win32cr::Foundation::UNICODE_STRING
    property home_directory_drive : Win32cr::Foundation::UNICODE_STRING
    property logoff_time : Win32cr::Foundation::LARGE_INTEGER
    property kick_off_time : Win32cr::Foundation::LARGE_INTEGER
    property password_last_set : Win32cr::Foundation::LARGE_INTEGER
    property password_can_change : Win32cr::Foundation::LARGE_INTEGER
    property password_must_change : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@size : UInt32, @logon_id : Win32cr::Foundation::LUID, @user_name : Win32cr::Foundation::UNICODE_STRING, @logon_domain : Win32cr::Foundation::UNICODE_STRING, @authentication_package : Win32cr::Foundation::UNICODE_STRING, @logon_type : UInt32, @session : UInt32, @sid : Win32cr::Foundation::PSID, @logon_time : Win32cr::Foundation::LARGE_INTEGER, @logon_server : Win32cr::Foundation::UNICODE_STRING, @dns_domain_name : Win32cr::Foundation::UNICODE_STRING, @upn : Win32cr::Foundation::UNICODE_STRING, @user_flags : UInt32, @last_logon_info : Win32cr::Security::Authentication::Identity::LSA_LAST_INTER_LOGON_INFO, @logon_script : Win32cr::Foundation::UNICODE_STRING, @profile_path : Win32cr::Foundation::UNICODE_STRING, @home_directory : Win32cr::Foundation::UNICODE_STRING, @home_directory_drive : Win32cr::Foundation::UNICODE_STRING, @logoff_time : Win32cr::Foundation::LARGE_INTEGER, @kick_off_time : Win32cr::Foundation::LARGE_INTEGER, @password_last_set : Win32cr::Foundation::LARGE_INTEGER, @password_can_change : Win32cr::Foundation::LARGE_INTEGER, @password_must_change : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct CENTRAL_ACCESS_POLICY_ENTRY
    property name : Win32cr::Foundation::UNICODE_STRING
    property description : Win32cr::Foundation::UNICODE_STRING
    property change_id : Win32cr::Foundation::UNICODE_STRING
    property length_applies_to : UInt32
    property applies_to : UInt8*
    property length_sd : UInt32
    property sd : Win32cr::Security::PSECURITY_DESCRIPTOR
    property length_staged_sd : UInt32
    property staged_sd : Win32cr::Security::PSECURITY_DESCRIPTOR
    property flags : UInt32
    def initialize(@name : Win32cr::Foundation::UNICODE_STRING, @description : Win32cr::Foundation::UNICODE_STRING, @change_id : Win32cr::Foundation::UNICODE_STRING, @length_applies_to : UInt32, @applies_to : UInt8*, @length_sd : UInt32, @sd : Win32cr::Security::PSECURITY_DESCRIPTOR, @length_staged_sd : UInt32, @staged_sd : Win32cr::Security::PSECURITY_DESCRIPTOR, @flags : UInt32)
    end
  end

  @[Extern]
  struct CENTRAL_ACCESS_POLICY
    property capid : Win32cr::Foundation::PSID
    property name : Win32cr::Foundation::UNICODE_STRING
    property description : Win32cr::Foundation::UNICODE_STRING
    property change_id : Win32cr::Foundation::UNICODE_STRING
    property flags : UInt32
    property cape_count : UInt32
    property cap_es : Win32cr::Security::Authentication::Identity::CENTRAL_ACCESS_POLICY_ENTRY**
    def initialize(@capid : Win32cr::Foundation::PSID, @name : Win32cr::Foundation::UNICODE_STRING, @description : Win32cr::Foundation::UNICODE_STRING, @change_id : Win32cr::Foundation::UNICODE_STRING, @flags : UInt32, @cape_count : UInt32, @cap_es : Win32cr::Security::Authentication::Identity::CENTRAL_ACCESS_POLICY_ENTRY**)
    end
  end

  @[Extern]
  struct NEGOTIATE_PACKAGE_PREFIX
    property package_id : LibC::UIntPtrT
    property package_data_a : Void*
    property package_data_w : Void*
    property prefix_len : LibC::UIntPtrT
    property prefix : UInt8[32]
    def initialize(@package_id : LibC::UIntPtrT, @package_data_a : Void*, @package_data_w : Void*, @prefix_len : LibC::UIntPtrT, @prefix : UInt8[32])
    end
  end

  @[Extern]
  struct NEGOTIATE_PACKAGE_PREFIXES
    property message_type : UInt32
    property prefix_count : UInt32
    property offset : UInt32
    property pad : UInt32
    def initialize(@message_type : UInt32, @prefix_count : UInt32, @offset : UInt32, @pad : UInt32)
    end
  end

  @[Extern]
  struct NEGOTIATE_CALLER_NAME_REQUEST
    property message_type : UInt32
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : UInt32, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct NEGOTIATE_CALLER_NAME_RESPONSE
    property message_type : UInt32
    property caller_name : Win32cr::Foundation::PWSTR
    def initialize(@message_type : UInt32, @caller_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DOMAIN_PASSWORD_INFORMATION
    property min_password_length : UInt16
    property password_history_length : UInt16
    property password_properties : Win32cr::Security::Authentication::Identity::DOMAIN_PASSWORD_PROPERTIES
    property max_password_age : Win32cr::Foundation::LARGE_INTEGER
    property min_password_age : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@min_password_length : UInt16, @password_history_length : UInt16, @password_properties : Win32cr::Security::Authentication::Identity::DOMAIN_PASSWORD_PROPERTIES, @max_password_age : Win32cr::Foundation::LARGE_INTEGER, @min_password_age : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct MSV1_0_INTERACTIVE_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE, @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @user_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct MSV1_0_INTERACTIVE_PROFILE
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROFILE_BUFFER_TYPE
    property logon_count : UInt16
    property bad_password_count : UInt16
    property logon_time : Win32cr::Foundation::LARGE_INTEGER
    property logoff_time : Win32cr::Foundation::LARGE_INTEGER
    property kick_off_time : Win32cr::Foundation::LARGE_INTEGER
    property password_last_set : Win32cr::Foundation::LARGE_INTEGER
    property password_can_change : Win32cr::Foundation::LARGE_INTEGER
    property password_must_change : Win32cr::Foundation::LARGE_INTEGER
    property logon_script : Win32cr::Foundation::UNICODE_STRING
    property home_directory : Win32cr::Foundation::UNICODE_STRING
    property full_name : Win32cr::Foundation::UNICODE_STRING
    property profile_path : Win32cr::Foundation::UNICODE_STRING
    property home_directory_drive : Win32cr::Foundation::UNICODE_STRING
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property user_flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROFILE_BUFFER_TYPE, @logon_count : UInt16, @bad_password_count : UInt16, @logon_time : Win32cr::Foundation::LARGE_INTEGER, @logoff_time : Win32cr::Foundation::LARGE_INTEGER, @kick_off_time : Win32cr::Foundation::LARGE_INTEGER, @password_last_set : Win32cr::Foundation::LARGE_INTEGER, @password_can_change : Win32cr::Foundation::LARGE_INTEGER, @password_must_change : Win32cr::Foundation::LARGE_INTEGER, @logon_script : Win32cr::Foundation::UNICODE_STRING, @home_directory : Win32cr::Foundation::UNICODE_STRING, @full_name : Win32cr::Foundation::UNICODE_STRING, @profile_path : Win32cr::Foundation::UNICODE_STRING, @home_directory_drive : Win32cr::Foundation::UNICODE_STRING, @logon_server : Win32cr::Foundation::UNICODE_STRING, @user_flags : UInt32)
    end
  end

  @[Extern]
  struct MSV1_0_LM20_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property workstation : Win32cr::Foundation::UNICODE_STRING
    property challenge_to_client : UInt8[8]
    property case_sensitive_challenge_response : Win32cr::System::Kernel::STRING
    property case_insensitive_challenge_response : Win32cr::System::Kernel::STRING
    property parameter_control : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE, @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @user_name : Win32cr::Foundation::UNICODE_STRING, @workstation : Win32cr::Foundation::UNICODE_STRING, @challenge_to_client : UInt8[8], @case_sensitive_challenge_response : Win32cr::System::Kernel::STRING, @case_insensitive_challenge_response : Win32cr::System::Kernel::STRING, @parameter_control : UInt32)
    end
  end

  @[Extern]
  struct MSV1_0_SUBAUTH_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property workstation : Win32cr::Foundation::UNICODE_STRING
    property challenge_to_client : UInt8[8]
    property authentication_info1 : Win32cr::System::Kernel::STRING
    property authentication_info2 : Win32cr::System::Kernel::STRING
    property parameter_control : Win32cr::Security::Authentication::Identity::MSV_SUBAUTH_LOGON_PARAMETER_CONTROL
    property sub_auth_package_id : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE, @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @user_name : Win32cr::Foundation::UNICODE_STRING, @workstation : Win32cr::Foundation::UNICODE_STRING, @challenge_to_client : UInt8[8], @authentication_info1 : Win32cr::System::Kernel::STRING, @authentication_info2 : Win32cr::System::Kernel::STRING, @parameter_control : Win32cr::Security::Authentication::Identity::MSV_SUBAUTH_LOGON_PARAMETER_CONTROL, @sub_auth_package_id : UInt32)
    end
  end

  @[Extern]
  struct MSV1_0_S4U_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE
    property flags : UInt32
    property user_principal_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_LOGON_SUBMIT_TYPE, @flags : UInt32, @user_principal_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct MSV1_0_LM20_LOGON_PROFILE
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROFILE_BUFFER_TYPE
    property kick_off_time : Win32cr::Foundation::LARGE_INTEGER
    property logoff_time : Win32cr::Foundation::LARGE_INTEGER
    property user_flags : Win32cr::Security::Authentication::Identity::MSV_SUB_AUTHENTICATION_FILTER
    property user_session_key : UInt8[16]
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property lanman_session_key : UInt8[8]
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property user_parameters : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROFILE_BUFFER_TYPE, @kick_off_time : Win32cr::Foundation::LARGE_INTEGER, @logoff_time : Win32cr::Foundation::LARGE_INTEGER, @user_flags : Win32cr::Security::Authentication::Identity::MSV_SUB_AUTHENTICATION_FILTER, @user_session_key : UInt8[16], @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @lanman_session_key : UInt8[8], @logon_server : Win32cr::Foundation::UNICODE_STRING, @user_parameters : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct MSV1_0_CREDENTIAL_KEY
    property data : UInt8[20]
    def initialize(@data : UInt8[20])
    end
  end

  @[Extern]
  struct MSV1_0_SUPPLEMENTAL_CREDENTIAL
    property version : UInt32
    property flags : Win32cr::Security::Authentication::Identity::MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS
    property lm_password : UInt8[16]
    property nt_password : UInt8[16]
    def initialize(@version : UInt32, @flags : Win32cr::Security::Authentication::Identity::MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS, @lm_password : UInt8[16], @nt_password : UInt8[16])
    end
  end

  @[Extern]
  struct MSV1_0_SUPPLEMENTAL_CREDENTIAL_V2
    property version : UInt32
    property flags : UInt32
    property nt_password : UInt8[16]
    property credential_key : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY
    def initialize(@version : UInt32, @flags : UInt32, @nt_password : UInt8[16], @credential_key : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY)
    end
  end

  @[Extern]
  struct MSV1_0_SUPPLEMENTAL_CREDENTIAL_V3
    property version : UInt32
    property flags : UInt32
    property credential_key_type : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY_TYPE
    property nt_password : UInt8[16]
    property credential_key : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY
    property sha_password : UInt8[20]
    def initialize(@version : UInt32, @flags : UInt32, @credential_key_type : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY_TYPE, @nt_password : UInt8[16], @credential_key : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY, @sha_password : UInt8[20])
    end
  end

  @[Extern]
  struct MSV1_0_IUM_SUPPLEMENTAL_CREDENTIAL
    property version : UInt32
    property encrypted_creds_size : UInt32
    property encrypted_creds : UInt8*
    def initialize(@version : UInt32, @encrypted_creds_size : UInt32, @encrypted_creds : UInt8*)
    end
  end

  @[Extern]
  struct MSV1_0_REMOTE_SUPPLEMENTAL_CREDENTIAL
    property version : UInt32
    property flags : UInt32
    property credential_key : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY
    property credential_key_type : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY_TYPE
    property encrypted_creds_size : UInt32
    property encrypted_creds : UInt8*
    def initialize(@version : UInt32, @flags : UInt32, @credential_key : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY, @credential_key_type : Win32cr::Security::Authentication::Identity::MSV1_0_CREDENTIAL_KEY_TYPE, @encrypted_creds_size : UInt32, @encrypted_creds : UInt8*)
    end
  end

  @[Extern]
  struct MSV1_0_NTLM3_RESPONSE
    property response : UInt8[16]
    property resp_type : UInt8
    property hi_resp_type : UInt8
    property flags : UInt16
    property msg_word : UInt32
    property time_stamp : UInt64
    property challenge_from_client : UInt8[8]
    property av_pairs_off : UInt32
    property buffer : UInt8*
    def initialize(@response : UInt8[16], @resp_type : UInt8, @hi_resp_type : UInt8, @flags : UInt16, @msg_word : UInt32, @time_stamp : UInt64, @challenge_from_client : UInt8[8], @av_pairs_off : UInt32, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct MSV1_0_AV_PAIR
    property av_id : UInt16
    property av_len : UInt16
    def initialize(@av_id : UInt16, @av_len : UInt16)
    end
  end

  @[Extern]
  struct MSV1_0_CHANGEPASSWORD_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property account_name : Win32cr::Foundation::UNICODE_STRING
    property old_password : Win32cr::Foundation::UNICODE_STRING
    property new_password : Win32cr::Foundation::UNICODE_STRING
    property impersonating : Win32cr::Foundation::BOOLEAN
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE, @domain_name : Win32cr::Foundation::UNICODE_STRING, @account_name : Win32cr::Foundation::UNICODE_STRING, @old_password : Win32cr::Foundation::UNICODE_STRING, @new_password : Win32cr::Foundation::UNICODE_STRING, @impersonating : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct MSV1_0_CHANGEPASSWORD_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE
    property password_info_valid : Win32cr::Foundation::BOOLEAN
    property domain_password_info : Win32cr::Security::Authentication::Identity::DOMAIN_PASSWORD_INFORMATION
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE, @password_info_valid : Win32cr::Foundation::BOOLEAN, @domain_password_info : Win32cr::Security::Authentication::Identity::DOMAIN_PASSWORD_INFORMATION)
    end
  end

  @[Extern]
  struct MSV1_0_PASSTHROUGH_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property package_name : Win32cr::Foundation::UNICODE_STRING
    property data_length : UInt32
    property logon_data : UInt8*
    property pad : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE, @domain_name : Win32cr::Foundation::UNICODE_STRING, @package_name : Win32cr::Foundation::UNICODE_STRING, @data_length : UInt32, @logon_data : UInt8*, @pad : UInt32)
    end
  end

  @[Extern]
  struct MSV1_0_PASSTHROUGH_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE
    property pad : UInt32
    property data_length : UInt32
    property validation_data : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE, @pad : UInt32, @data_length : UInt32, @validation_data : UInt8*)
    end
  end

  @[Extern]
  struct MSV1_0_SUBAUTH_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE
    property sub_auth_package_id : UInt32
    property sub_auth_info_length : UInt32
    property sub_auth_submit_buffer : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE, @sub_auth_package_id : UInt32, @sub_auth_info_length : UInt32, @sub_auth_submit_buffer : UInt8*)
    end
  end

  @[Extern]
  struct MSV1_0_SUBAUTH_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE
    property sub_auth_info_length : UInt32
    property sub_auth_return_buffer : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::MSV1_0_PROTOCOL_MESSAGE_TYPE, @sub_auth_info_length : UInt32, @sub_auth_return_buffer : UInt8*)
    end
  end

  @[Extern]
  struct KERB_INTERACTIVE_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE, @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @user_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_INTERACTIVE_UNLOCK_LOGON
    property logon : Win32cr::Security::Authentication::Identity::KERB_INTERACTIVE_LOGON
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@logon : Win32cr::Security::Authentication::Identity::KERB_INTERACTIVE_LOGON, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_SMART_CARD_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE
    property pin : Win32cr::Foundation::UNICODE_STRING
    property csp_data_length : UInt32
    property csp_data : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE, @pin : Win32cr::Foundation::UNICODE_STRING, @csp_data_length : UInt32, @csp_data : UInt8*)
    end
  end

  @[Extern]
  struct KERB_SMART_CARD_UNLOCK_LOGON
    property logon : Win32cr::Security::Authentication::Identity::KERB_SMART_CARD_LOGON
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@logon : Win32cr::Security::Authentication::Identity::KERB_SMART_CARD_LOGON, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_CERTIFICATE_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property pin : Win32cr::Foundation::UNICODE_STRING
    property flags : UInt32
    property csp_data_length : UInt32
    property csp_data : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE, @domain_name : Win32cr::Foundation::UNICODE_STRING, @user_name : Win32cr::Foundation::UNICODE_STRING, @pin : Win32cr::Foundation::UNICODE_STRING, @flags : UInt32, @csp_data_length : UInt32, @csp_data : UInt8*)
    end
  end

  @[Extern]
  struct KERB_CERTIFICATE_UNLOCK_LOGON
    property logon : Win32cr::Security::Authentication::Identity::KERB_CERTIFICATE_LOGON
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@logon : Win32cr::Security::Authentication::Identity::KERB_CERTIFICATE_LOGON, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_CERTIFICATE_S4U_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE
    property flags : UInt32
    property user_principal_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property certificate_length : UInt32
    property certificate : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE, @flags : UInt32, @user_principal_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @certificate_length : UInt32, @certificate : UInt8*)
    end
  end

  @[Extern]
  struct KERB_TICKET_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE
    property flags : UInt32
    property service_ticket_length : UInt32
    property ticket_granting_ticket_length : UInt32
    property service_ticket : UInt8*
    property ticket_granting_ticket : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE, @flags : UInt32, @service_ticket_length : UInt32, @ticket_granting_ticket_length : UInt32, @service_ticket : UInt8*, @ticket_granting_ticket : UInt8*)
    end
  end

  @[Extern]
  struct KERB_TICKET_UNLOCK_LOGON
    property logon : Win32cr::Security::Authentication::Identity::KERB_TICKET_LOGON
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@logon : Win32cr::Security::Authentication::Identity::KERB_TICKET_LOGON, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_S4U_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE
    property flags : UInt32
    property client_upn : Win32cr::Foundation::UNICODE_STRING
    property client_realm : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_LOGON_SUBMIT_TYPE, @flags : UInt32, @client_upn : Win32cr::Foundation::UNICODE_STRING, @client_realm : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_INTERACTIVE_PROFILE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROFILE_BUFFER_TYPE
    property logon_count : UInt16
    property bad_password_count : UInt16
    property logon_time : Win32cr::Foundation::LARGE_INTEGER
    property logoff_time : Win32cr::Foundation::LARGE_INTEGER
    property kick_off_time : Win32cr::Foundation::LARGE_INTEGER
    property password_last_set : Win32cr::Foundation::LARGE_INTEGER
    property password_can_change : Win32cr::Foundation::LARGE_INTEGER
    property password_must_change : Win32cr::Foundation::LARGE_INTEGER
    property logon_script : Win32cr::Foundation::UNICODE_STRING
    property home_directory : Win32cr::Foundation::UNICODE_STRING
    property full_name : Win32cr::Foundation::UNICODE_STRING
    property profile_path : Win32cr::Foundation::UNICODE_STRING
    property home_directory_drive : Win32cr::Foundation::UNICODE_STRING
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property user_flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROFILE_BUFFER_TYPE, @logon_count : UInt16, @bad_password_count : UInt16, @logon_time : Win32cr::Foundation::LARGE_INTEGER, @logoff_time : Win32cr::Foundation::LARGE_INTEGER, @kick_off_time : Win32cr::Foundation::LARGE_INTEGER, @password_last_set : Win32cr::Foundation::LARGE_INTEGER, @password_can_change : Win32cr::Foundation::LARGE_INTEGER, @password_must_change : Win32cr::Foundation::LARGE_INTEGER, @logon_script : Win32cr::Foundation::UNICODE_STRING, @home_directory : Win32cr::Foundation::UNICODE_STRING, @full_name : Win32cr::Foundation::UNICODE_STRING, @profile_path : Win32cr::Foundation::UNICODE_STRING, @home_directory_drive : Win32cr::Foundation::UNICODE_STRING, @logon_server : Win32cr::Foundation::UNICODE_STRING, @user_flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_SMART_CARD_PROFILE
    property profile : Win32cr::Security::Authentication::Identity::KERB_INTERACTIVE_PROFILE
    property certificate_size : UInt32
    property certificate_data : UInt8*
    def initialize(@profile : Win32cr::Security::Authentication::Identity::KERB_INTERACTIVE_PROFILE, @certificate_size : UInt32, @certificate_data : UInt8*)
    end
  end

  @[Extern]
  struct KERB_CRYPTO_KEY
    property key_type : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY_TYPE
    property length : UInt32
    property value : UInt8*
    def initialize(@key_type : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY_TYPE, @length : UInt32, @value : UInt8*)
    end
  end

  @[Extern]
  struct KERB_CRYPTO_KEY32
    property key_type : Int32
    property length : UInt32
    property offset : UInt32
    def initialize(@key_type : Int32, @length : UInt32, @offset : UInt32)
    end
  end

  @[Extern]
  struct KERB_TICKET_PROFILE
    property profile : Win32cr::Security::Authentication::Identity::KERB_INTERACTIVE_PROFILE
    property session_key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY
    def initialize(@profile : Win32cr::Security::Authentication::Identity::KERB_INTERACTIVE_PROFILE, @session_key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY)
    end
  end

  @[Extern]
  struct KERB_QUERY_TKT_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_TICKET_CACHE_INFO
    property server_name : Win32cr::Foundation::UNICODE_STRING
    property realm_name : Win32cr::Foundation::UNICODE_STRING
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property renew_time : Win32cr::Foundation::LARGE_INTEGER
    property encryption_type : Int32
    property ticket_flags : Win32cr::Security::Authentication::Identity::KERB_TICKET_FLAGS
    def initialize(@server_name : Win32cr::Foundation::UNICODE_STRING, @realm_name : Win32cr::Foundation::UNICODE_STRING, @start_time : Win32cr::Foundation::LARGE_INTEGER, @end_time : Win32cr::Foundation::LARGE_INTEGER, @renew_time : Win32cr::Foundation::LARGE_INTEGER, @encryption_type : Int32, @ticket_flags : Win32cr::Security::Authentication::Identity::KERB_TICKET_FLAGS)
    end
  end

  @[Extern]
  struct KERB_TICKET_CACHE_INFO_EX
    property client_name : Win32cr::Foundation::UNICODE_STRING
    property client_realm : Win32cr::Foundation::UNICODE_STRING
    property server_name : Win32cr::Foundation::UNICODE_STRING
    property server_realm : Win32cr::Foundation::UNICODE_STRING
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property renew_time : Win32cr::Foundation::LARGE_INTEGER
    property encryption_type : Int32
    property ticket_flags : UInt32
    def initialize(@client_name : Win32cr::Foundation::UNICODE_STRING, @client_realm : Win32cr::Foundation::UNICODE_STRING, @server_name : Win32cr::Foundation::UNICODE_STRING, @server_realm : Win32cr::Foundation::UNICODE_STRING, @start_time : Win32cr::Foundation::LARGE_INTEGER, @end_time : Win32cr::Foundation::LARGE_INTEGER, @renew_time : Win32cr::Foundation::LARGE_INTEGER, @encryption_type : Int32, @ticket_flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_TICKET_CACHE_INFO_EX2
    property client_name : Win32cr::Foundation::UNICODE_STRING
    property client_realm : Win32cr::Foundation::UNICODE_STRING
    property server_name : Win32cr::Foundation::UNICODE_STRING
    property server_realm : Win32cr::Foundation::UNICODE_STRING
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property renew_time : Win32cr::Foundation::LARGE_INTEGER
    property encryption_type : Int32
    property ticket_flags : UInt32
    property session_key_type : UInt32
    property branch_id : UInt32
    def initialize(@client_name : Win32cr::Foundation::UNICODE_STRING, @client_realm : Win32cr::Foundation::UNICODE_STRING, @server_name : Win32cr::Foundation::UNICODE_STRING, @server_realm : Win32cr::Foundation::UNICODE_STRING, @start_time : Win32cr::Foundation::LARGE_INTEGER, @end_time : Win32cr::Foundation::LARGE_INTEGER, @renew_time : Win32cr::Foundation::LARGE_INTEGER, @encryption_type : Int32, @ticket_flags : UInt32, @session_key_type : UInt32, @branch_id : UInt32)
    end
  end

  @[Extern]
  struct KERB_TICKET_CACHE_INFO_EX3
    property client_name : Win32cr::Foundation::UNICODE_STRING
    property client_realm : Win32cr::Foundation::UNICODE_STRING
    property server_name : Win32cr::Foundation::UNICODE_STRING
    property server_realm : Win32cr::Foundation::UNICODE_STRING
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property renew_time : Win32cr::Foundation::LARGE_INTEGER
    property encryption_type : Int32
    property ticket_flags : UInt32
    property session_key_type : UInt32
    property branch_id : UInt32
    property cache_flags : UInt32
    property kdc_called : Win32cr::Foundation::UNICODE_STRING
    def initialize(@client_name : Win32cr::Foundation::UNICODE_STRING, @client_realm : Win32cr::Foundation::UNICODE_STRING, @server_name : Win32cr::Foundation::UNICODE_STRING, @server_realm : Win32cr::Foundation::UNICODE_STRING, @start_time : Win32cr::Foundation::LARGE_INTEGER, @end_time : Win32cr::Foundation::LARGE_INTEGER, @renew_time : Win32cr::Foundation::LARGE_INTEGER, @encryption_type : Int32, @ticket_flags : UInt32, @session_key_type : UInt32, @branch_id : UInt32, @cache_flags : UInt32, @kdc_called : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_QUERY_TKT_CACHE_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_tickets : UInt32
    property tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_tickets : UInt32, @tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO*)
    end
  end

  @[Extern]
  struct KERB_QUERY_TKT_CACHE_EX_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_tickets : UInt32
    property tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_tickets : UInt32, @tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX*)
    end
  end

  @[Extern]
  struct KERB_QUERY_TKT_CACHE_EX2_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_tickets : UInt32
    property tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX2*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_tickets : UInt32, @tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX2*)
    end
  end

  @[Extern]
  struct KERB_QUERY_TKT_CACHE_EX3_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_tickets : UInt32
    property tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX3*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_tickets : UInt32, @tickets : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX3*)
    end
  end

  @[Extern]
  struct KERB_AUTH_DATA
    property type__ : UInt32
    property length : UInt32
    property data : UInt8*
    def initialize(@type__ : UInt32, @length : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct KERB_NET_ADDRESS
    property family : UInt32
    property length : UInt32
    property address : Win32cr::Foundation::PSTR
    def initialize(@family : UInt32, @length : UInt32, @address : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct KERB_NET_ADDRESSES
    property number : UInt32
    property addresses : Win32cr::Security::Authentication::Identity::KERB_NET_ADDRESS*
    def initialize(@number : UInt32, @addresses : Win32cr::Security::Authentication::Identity::KERB_NET_ADDRESS*)
    end
  end

  @[Extern]
  struct KERB_EXTERNAL_NAME
    property name_type : Int16
    property name_count : UInt16
    property names : Win32cr::Foundation::UNICODE_STRING*
    def initialize(@name_type : Int16, @name_count : UInt16, @names : Win32cr::Foundation::UNICODE_STRING*)
    end
  end

  @[Extern]
  struct KERB_EXTERNAL_TICKET
    property service_name : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_NAME*
    property target_name : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_NAME*
    property client_name : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_NAME*
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property target_domain_name : Win32cr::Foundation::UNICODE_STRING
    property alt_target_domain_name : Win32cr::Foundation::UNICODE_STRING
    property session_key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY
    property ticket_flags : Win32cr::Security::Authentication::Identity::KERB_TICKET_FLAGS
    property flags : UInt32
    property key_expiration_time : Win32cr::Foundation::LARGE_INTEGER
    property start_time : Win32cr::Foundation::LARGE_INTEGER
    property end_time : Win32cr::Foundation::LARGE_INTEGER
    property renew_until : Win32cr::Foundation::LARGE_INTEGER
    property time_skew : Win32cr::Foundation::LARGE_INTEGER
    property encoded_ticket_size : UInt32
    property encoded_ticket : UInt8*
    def initialize(@service_name : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_NAME*, @target_name : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_NAME*, @client_name : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_NAME*, @domain_name : Win32cr::Foundation::UNICODE_STRING, @target_domain_name : Win32cr::Foundation::UNICODE_STRING, @alt_target_domain_name : Win32cr::Foundation::UNICODE_STRING, @session_key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY, @ticket_flags : Win32cr::Security::Authentication::Identity::KERB_TICKET_FLAGS, @flags : UInt32, @key_expiration_time : Win32cr::Foundation::LARGE_INTEGER, @start_time : Win32cr::Foundation::LARGE_INTEGER, @end_time : Win32cr::Foundation::LARGE_INTEGER, @renew_until : Win32cr::Foundation::LARGE_INTEGER, @time_skew : Win32cr::Foundation::LARGE_INTEGER, @encoded_ticket_size : UInt32, @encoded_ticket : UInt8*)
    end
  end

  @[Extern]
  struct KERB_RETRIEVE_TKT_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property target_name : Win32cr::Foundation::UNICODE_STRING
    property ticket_flags : UInt32
    property cache_options : UInt32
    property encryption_type : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY_TYPE
    property credentials_handle : Win32cr::Security::Credentials::SecHandle
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @target_name : Win32cr::Foundation::UNICODE_STRING, @ticket_flags : UInt32, @cache_options : UInt32, @encryption_type : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY_TYPE, @credentials_handle : Win32cr::Security::Credentials::SecHandle)
    end
  end

  @[Extern]
  struct KERB_RETRIEVE_TKT_RESPONSE
    property ticket : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_TICKET
    def initialize(@ticket : Win32cr::Security::Authentication::Identity::KERB_EXTERNAL_TICKET)
    end
  end

  @[Extern]
  struct KERB_PURGE_TKT_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property server_name : Win32cr::Foundation::UNICODE_STRING
    property realm_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @server_name : Win32cr::Foundation::UNICODE_STRING, @realm_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_PURGE_TKT_CACHE_EX_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property flags : UInt32
    property ticket_template : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @flags : UInt32, @ticket_template : Win32cr::Security::Authentication::Identity::KERB_TICKET_CACHE_INFO_EX)
    end
  end

  @[Extern]
  struct KERB_SUBMIT_TKT_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property flags : UInt32
    property key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY32
    property kerb_cred_size : UInt32
    property kerb_cred_offset : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @flags : UInt32, @key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY32, @kerb_cred_size : UInt32, @kerb_cred_offset : UInt32)
    end
  end

  @[Extern]
  struct KERB_QUERY_KDC_PROXY_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KDC_PROXY_CACHE_ENTRY_DATA
    property since_last_used : UInt64
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property proxy_server_name : Win32cr::Foundation::UNICODE_STRING
    property proxy_server_vdir : Win32cr::Foundation::UNICODE_STRING
    property proxy_server_port : UInt16
    property logon_id : Win32cr::Foundation::LUID
    property cred_user_name : Win32cr::Foundation::UNICODE_STRING
    property cred_domain_name : Win32cr::Foundation::UNICODE_STRING
    property global_cache : Win32cr::Foundation::BOOLEAN
    def initialize(@since_last_used : UInt64, @domain_name : Win32cr::Foundation::UNICODE_STRING, @proxy_server_name : Win32cr::Foundation::UNICODE_STRING, @proxy_server_vdir : Win32cr::Foundation::UNICODE_STRING, @proxy_server_port : UInt16, @logon_id : Win32cr::Foundation::LUID, @cred_user_name : Win32cr::Foundation::UNICODE_STRING, @cred_domain_name : Win32cr::Foundation::UNICODE_STRING, @global_cache : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct KERB_QUERY_KDC_PROXY_CACHE_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_entries : UInt32
    property entries : Win32cr::Security::Authentication::Identity::KDC_PROXY_CACHE_ENTRY_DATA*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_entries : UInt32, @entries : Win32cr::Security::Authentication::Identity::KDC_PROXY_CACHE_ENTRY_DATA*)
    end
  end

  @[Extern]
  struct KERB_PURGE_KDC_PROXY_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_PURGE_KDC_PROXY_CACHE_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_purged : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_purged : UInt32)
    end
  end

  @[Extern]
  struct KERB_S4U2PROXY_CACHE_ENTRY_INFO
    property server_name : Win32cr::Foundation::UNICODE_STRING
    property flags : UInt32
    property last_status : Win32cr::Foundation::NTSTATUS
    property expiry : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@server_name : Win32cr::Foundation::UNICODE_STRING, @flags : UInt32, @last_status : Win32cr::Foundation::NTSTATUS, @expiry : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct KERB_S4U2PROXY_CRED
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property flags : UInt32
    property last_status : Win32cr::Foundation::NTSTATUS
    property expiry : Win32cr::Foundation::LARGE_INTEGER
    property count_of_entries : UInt32
    property entries : Win32cr::Security::Authentication::Identity::KERB_S4U2PROXY_CACHE_ENTRY_INFO*
    def initialize(@user_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @flags : UInt32, @last_status : Win32cr::Foundation::NTSTATUS, @expiry : Win32cr::Foundation::LARGE_INTEGER, @count_of_entries : UInt32, @entries : Win32cr::Security::Authentication::Identity::KERB_S4U2PROXY_CACHE_ENTRY_INFO*)
    end
  end

  @[Extern]
  struct KERB_QUERY_S4U2PROXY_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_QUERY_S4U2PROXY_CACHE_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_creds : UInt32
    property creds : Win32cr::Security::Authentication::Identity::KERB_S4U2PROXY_CRED*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_creds : UInt32, @creds : Win32cr::Security::Authentication::Identity::KERB_S4U2PROXY_CRED*)
    end
  end

  @[Extern]
  struct KERB_RETRIEVE_KEY_TAB_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32, @user_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_RETRIEVE_KEY_TAB_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property key_tab_length : UInt32
    property key_tab : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @key_tab_length : UInt32, @key_tab : UInt8*)
    end
  end

  @[Extern]
  struct KERB_REFRESH_POLICY_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_REFRESH_POLICY_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_CLOUD_KERBEROS_DEBUG_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_CLOUD_KERBEROS_DEBUG_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property version : UInt32
    property length : UInt32
    property data : UInt32*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @version : UInt32, @length : UInt32, @data : UInt32*)
    end
  end

  @[Extern]
  struct KERB_CLOUD_KERBEROS_DEBUG_DATA_V0
    property _bitfield : Int32
    def initialize(@_bitfield : Int32)
    end
  end

  @[Extern]
  struct KERB_CHANGEPASSWORD_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property account_name : Win32cr::Foundation::UNICODE_STRING
    property old_password : Win32cr::Foundation::UNICODE_STRING
    property new_password : Win32cr::Foundation::UNICODE_STRING
    property impersonating : Win32cr::Foundation::BOOLEAN
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @domain_name : Win32cr::Foundation::UNICODE_STRING, @account_name : Win32cr::Foundation::UNICODE_STRING, @old_password : Win32cr::Foundation::UNICODE_STRING, @new_password : Win32cr::Foundation::UNICODE_STRING, @impersonating : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct KERB_SETPASSWORD_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property credentials_handle : Win32cr::Security::Credentials::SecHandle
    property flags : UInt32
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property account_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @credentials_handle : Win32cr::Security::Credentials::SecHandle, @flags : UInt32, @domain_name : Win32cr::Foundation::UNICODE_STRING, @account_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_SETPASSWORD_EX_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property credentials_handle : Win32cr::Security::Credentials::SecHandle
    property flags : UInt32
    property account_realm : Win32cr::Foundation::UNICODE_STRING
    property account_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    property client_realm : Win32cr::Foundation::UNICODE_STRING
    property client_name : Win32cr::Foundation::UNICODE_STRING
    property impersonating : Win32cr::Foundation::BOOLEAN
    property kdc_address : Win32cr::Foundation::UNICODE_STRING
    property kdc_address_type : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @credentials_handle : Win32cr::Security::Credentials::SecHandle, @flags : UInt32, @account_realm : Win32cr::Foundation::UNICODE_STRING, @account_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING, @client_realm : Win32cr::Foundation::UNICODE_STRING, @client_name : Win32cr::Foundation::UNICODE_STRING, @impersonating : Win32cr::Foundation::BOOLEAN, @kdc_address : Win32cr::Foundation::UNICODE_STRING, @kdc_address_type : UInt32)
    end
  end

  @[Extern]
  struct KERB_DECRYPT_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    property flags : UInt32
    property crypto_type : Int32
    property key_usage : Int32
    property key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY
    property encrypted_data_size : UInt32
    property initial_vector_size : UInt32
    property initial_vector : UInt8*
    property encrypted_data : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID, @flags : UInt32, @crypto_type : Int32, @key_usage : Int32, @key : Win32cr::Security::Authentication::Identity::KERB_CRYPTO_KEY, @encrypted_data_size : UInt32, @initial_vector_size : UInt32, @initial_vector : UInt8*, @encrypted_data : UInt8*)
    end
  end

  @[Extern]
  struct KERB_DECRYPT_RESPONSE
    property decrypted_data : UInt8*
    def initialize(@decrypted_data : UInt8*)
    end
  end

  @[Extern]
  struct KERB_ADD_BINDING_CACHE_ENTRY_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property realm_name : Win32cr::Foundation::UNICODE_STRING
    property kdc_address : Win32cr::Foundation::UNICODE_STRING
    property address_type : Win32cr::Security::Authentication::Identity::KERB_ADDRESS_TYPE
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @realm_name : Win32cr::Foundation::UNICODE_STRING, @kdc_address : Win32cr::Foundation::UNICODE_STRING, @address_type : Win32cr::Security::Authentication::Identity::KERB_ADDRESS_TYPE)
    end
  end

  @[Extern]
  struct KERB_REFRESH_SCCRED_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property credential_blob : Win32cr::Foundation::UNICODE_STRING
    property logon_id : Win32cr::Foundation::LUID
    property flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @credential_blob : Win32cr::Foundation::UNICODE_STRING, @logon_id : Win32cr::Foundation::LUID, @flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_ADD_CREDENTIALS_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    property logon_id : Win32cr::Foundation::LUID
    property flags : Win32cr::Security::Authentication::Identity::KERB_REQUEST_FLAGS
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @user_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING, @logon_id : Win32cr::Foundation::LUID, @flags : Win32cr::Security::Authentication::Identity::KERB_REQUEST_FLAGS)
    end
  end

  @[Extern]
  struct KERB_ADD_CREDENTIALS_REQUEST_EX
    property credentials : Win32cr::Security::Authentication::Identity::KERB_ADD_CREDENTIALS_REQUEST
    property principal_name_count : UInt32
    property principal_names : Win32cr::Foundation::UNICODE_STRING*
    def initialize(@credentials : Win32cr::Security::Authentication::Identity::KERB_ADD_CREDENTIALS_REQUEST, @principal_name_count : UInt32, @principal_names : Win32cr::Foundation::UNICODE_STRING*)
    end
  end

  @[Extern]
  struct KERB_TRANSFER_CRED_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property origin_logon_id : Win32cr::Foundation::LUID
    property destination_logon_id : Win32cr::Foundation::LUID
    property flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @origin_logon_id : Win32cr::Foundation::LUID, @destination_logon_id : Win32cr::Foundation::LUID, @flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_CLEANUP_MACHINE_PKINIT_CREDS_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property logon_id : Win32cr::Foundation::LUID
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct KERB_BINDING_CACHE_ENTRY_DATA
    property discovery_time : UInt64
    property realm_name : Win32cr::Foundation::UNICODE_STRING
    property kdc_address : Win32cr::Foundation::UNICODE_STRING
    property address_type : Win32cr::Security::Authentication::Identity::KERB_ADDRESS_TYPE
    property flags : UInt32
    property dc_flags : UInt32
    property cache_flags : UInt32
    property kdc_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@discovery_time : UInt64, @realm_name : Win32cr::Foundation::UNICODE_STRING, @kdc_address : Win32cr::Foundation::UNICODE_STRING, @address_type : Win32cr::Security::Authentication::Identity::KERB_ADDRESS_TYPE, @flags : UInt32, @dc_flags : UInt32, @cache_flags : UInt32, @kdc_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_QUERY_BINDING_CACHE_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property count_of_entries : UInt32
    property entries : Win32cr::Security::Authentication::Identity::KERB_BINDING_CACHE_ENTRY_DATA*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @count_of_entries : UInt32, @entries : Win32cr::Security::Authentication::Identity::KERB_BINDING_CACHE_ENTRY_DATA*)
    end
  end

  @[Extern]
  struct KERB_ADD_BINDING_CACHE_ENTRY_EX_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property realm_name : Win32cr::Foundation::UNICODE_STRING
    property kdc_address : Win32cr::Foundation::UNICODE_STRING
    property address_type : Win32cr::Security::Authentication::Identity::KERB_ADDRESS_TYPE
    property dc_flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @realm_name : Win32cr::Foundation::UNICODE_STRING, @kdc_address : Win32cr::Foundation::UNICODE_STRING, @address_type : Win32cr::Security::Authentication::Identity::KERB_ADDRESS_TYPE, @dc_flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_QUERY_BINDING_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE)
    end
  end

  @[Extern]
  struct KERB_PURGE_BINDING_CACHE_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE)
    end
  end

  @[Extern]
  struct KERB_QUERY_DOMAIN_EXTENDED_POLICIES_REQUEST
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32, @domain_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE
    property message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE
    property flags : UInt32
    property extended_policies : UInt32
    property ds_flags : UInt32
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::KERB_PROTOCOL_MESSAGE_TYPE, @flags : UInt32, @extended_policies : UInt32, @ds_flags : UInt32)
    end
  end

  @[Extern]
  struct KERB_CERTIFICATE_HASHINFO
    property store_name_length : UInt16
    property hash_length : UInt16
    def initialize(@store_name_length : UInt16, @hash_length : UInt16)
    end
  end

  @[Extern]
  struct KERB_CERTIFICATE_INFO
    property cert_info_size : UInt32
    property info_type : UInt32
    def initialize(@cert_info_size : UInt32, @info_type : UInt32)
    end
  end

  @[Extern]
  struct POLICY_AUDIT_SID_ARRAY
    property users_count : UInt32
    property user_sid_array : Win32cr::Foundation::PSID*
    def initialize(@users_count : UInt32, @user_sid_array : Win32cr::Foundation::PSID*)
    end
  end

  @[Extern]
  struct AUDIT_POLICY_INFORMATION
    property audit_sub_category_guid : LibC::GUID
    property auditing_information : UInt32
    property audit_category_guid : LibC::GUID
    def initialize(@audit_sub_category_guid : LibC::GUID, @auditing_information : UInt32, @audit_category_guid : LibC::GUID)
    end
  end

  @[Extern]
  struct PKU2U_CERT_BLOB
    property cert_offset : UInt32
    property cert_length : UInt16
    def initialize(@cert_offset : UInt32, @cert_length : UInt16)
    end
  end

  @[Extern]
  struct PKU2U_CREDUI_CONTEXT
    property version : UInt64
    property cbHeaderLength : UInt16
    property cbStructureLength : UInt32
    property cert_array_count : UInt16
    property cert_array_offset : UInt32
    def initialize(@version : UInt64, @cbHeaderLength : UInt16, @cbStructureLength : UInt32, @cert_array_count : UInt16, @cert_array_offset : UInt32)
    end
  end

  @[Extern]
  struct PKU2U_CERTIFICATE_S4U_LOGON
    property message_type : Win32cr::Security::Authentication::Identity::PKU2U_LOGON_SUBMIT_TYPE
    property flags : UInt32
    property user_principal_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property certificate_length : UInt32
    property certificate : UInt8*
    def initialize(@message_type : Win32cr::Security::Authentication::Identity::PKU2U_LOGON_SUBMIT_TYPE, @flags : UInt32, @user_principal_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @certificate_length : UInt32, @certificate : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgInfoW
    property fCapabilities : UInt32
    property wVersion : UInt16
    property wRPCID : UInt16
    property cbMaxToken : UInt32
    property name : UInt16*
    property comment : UInt16*
    def initialize(@fCapabilities : UInt32, @wVersion : UInt16, @wRPCID : UInt16, @cbMaxToken : UInt32, @name : UInt16*, @comment : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgInfoA
    property fCapabilities : UInt32
    property wVersion : UInt16
    property wRPCID : UInt16
    property cbMaxToken : UInt32
    property name : Int8*
    property comment : Int8*
    def initialize(@fCapabilities : UInt32, @wVersion : UInt16, @wRPCID : UInt16, @cbMaxToken : UInt32, @name : Int8*, @comment : Int8*)
    end
  end

  @[Extern]
  struct SecBuffer
    property cbBuffer : UInt32
    property buffer_type : UInt32
    property pvBuffer : Void*
    def initialize(@cbBuffer : UInt32, @buffer_type : UInt32, @pvBuffer : Void*)
    end
  end

  @[Extern]
  struct SecBufferDesc
    property ulVersion : UInt32
    property cBuffers : UInt32
    property pBuffers : Win32cr::Security::Authentication::Identity::SecBuffer*
    def initialize(@ulVersion : UInt32, @cBuffers : UInt32, @pBuffers : Win32cr::Security::Authentication::Identity::SecBuffer*)
    end
  end

  @[Extern]
  struct SEC_NEGOTIATION_INFO
    property size : UInt32
    property name_length : UInt32
    property name : UInt16*
    property reserved : Void*
    def initialize(@size : UInt32, @name_length : UInt32, @name : UInt16*, @reserved : Void*)
    end
  end

  @[Extern]
  struct SEC_CHANNEL_BINDINGS
    property dwInitiatorAddrType : UInt32
    property cbInitiatorLength : UInt32
    property dwInitiatorOffset : UInt32
    property dwAcceptorAddrType : UInt32
    property cbAcceptorLength : UInt32
    property dwAcceptorOffset : UInt32
    property cbApplicationDataLength : UInt32
    property dwApplicationDataOffset : UInt32
    def initialize(@dwInitiatorAddrType : UInt32, @cbInitiatorLength : UInt32, @dwInitiatorOffset : UInt32, @dwAcceptorAddrType : UInt32, @cbAcceptorLength : UInt32, @dwAcceptorOffset : UInt32, @cbApplicationDataLength : UInt32, @dwApplicationDataOffset : UInt32)
    end
  end

  @[Extern]
  struct SEC_APPLICATION_PROTOCOL_LIST
    property proto_nego_ext : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT
    property protocol_list_size : UInt16
    property protocol_list : UInt8*
    def initialize(@proto_nego_ext : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT, @protocol_list_size : UInt16, @protocol_list : UInt8*)
    end
  end

  @[Extern]
  struct SEC_APPLICATION_PROTOCOLS
    property protocol_lists_size : UInt32
    property protocol_lists : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_LIST*
    def initialize(@protocol_lists_size : UInt32, @protocol_lists : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_LIST*)
    end
  end

  @[Extern]
  struct SEC_SRTP_PROTECTION_PROFILES
    property profiles_size : UInt16
    property profiles_list : UInt16*
    def initialize(@profiles_size : UInt16, @profiles_list : UInt16*)
    end
  end

  @[Extern]
  struct SEC_SRTP_MASTER_KEY_IDENTIFIER
    property master_key_identifier_size : UInt8
    property master_key_identifier : UInt8*
    def initialize(@master_key_identifier_size : UInt8, @master_key_identifier : UInt8*)
    end
  end

  @[Extern]
  struct SEC_TOKEN_BINDING
    property major_version : UInt8
    property minor_version : UInt8
    property key_parameters_size : UInt16
    property key_parameters : UInt8*
    def initialize(@major_version : UInt8, @minor_version : UInt8, @key_parameters_size : UInt16, @key_parameters : UInt8*)
    end
  end

  @[Extern]
  struct SEC_PRESHAREDKEY
    property key_size : UInt16
    property key : UInt8*
    def initialize(@key_size : UInt16, @key : UInt8*)
    end
  end

  @[Extern]
  struct SEC_PRESHAREDKEY_IDENTITY
    property key_identity_size : UInt16
    property key_identity : UInt8*
    def initialize(@key_identity_size : UInt16, @key_identity : UInt8*)
    end
  end

  @[Extern]
  struct SEC_DTLS_MTU
    property path_mtu : UInt16
    def initialize(@path_mtu : UInt16)
    end
  end

  @[Extern]
  struct SEC_FLAGS
    property flags : UInt64
    def initialize(@flags : UInt64)
    end
  end

  @[Extern]
  struct SEC_TRAFFIC_SECRETS
    property symmetric_alg_id : UInt16[64]
    property chaining_mode : UInt16[64]
    property hash_alg_id : UInt16[64]
    property key_size : UInt16
    property iv_size : UInt16
    property msg_sequence_start : UInt16
    property msg_sequence_end : UInt16
    property traffic_secret_type : Win32cr::Security::Authentication::Identity::SEC_TRAFFIC_SECRET_TYPE
    property traffic_secret_size : UInt16
    property traffic_secret : UInt8*
    def initialize(@symmetric_alg_id : UInt16[64], @chaining_mode : UInt16[64], @hash_alg_id : UInt16[64], @key_size : UInt16, @iv_size : UInt16, @msg_sequence_start : UInt16, @msg_sequence_end : UInt16, @traffic_secret_type : Win32cr::Security::Authentication::Identity::SEC_TRAFFIC_SECRET_TYPE, @traffic_secret_size : UInt16, @traffic_secret : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgCredentials_NamesW
    property sUserName : UInt16*
    def initialize(@sUserName : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgCredentials_NamesA
    property sUserName : Int8*
    def initialize(@sUserName : Int8*)
    end
  end

  @[Extern]
  struct SecPkgCredentials_SSIProviderW
    property sProviderName : UInt16*
    property provider_info_length : UInt32
    property provider_info : Win32cr::Foundation::PSTR
    def initialize(@sProviderName : UInt16*, @provider_info_length : UInt32, @provider_info : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SecPkgCredentials_SSIProviderA
    property sProviderName : Int8*
    property provider_info_length : UInt32
    property provider_info : Win32cr::Foundation::PSTR
    def initialize(@sProviderName : Int8*, @provider_info_length : UInt32, @provider_info : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SecPkgCredentials_KdcProxySettingsW
    property version : UInt32
    property flags : UInt32
    property proxy_server_offset : UInt16
    property proxy_server_length : UInt16
    property client_tls_cred_offset : UInt16
    property client_tls_cred_length : UInt16
    def initialize(@version : UInt32, @flags : UInt32, @proxy_server_offset : UInt16, @proxy_server_length : UInt16, @client_tls_cred_offset : UInt16, @client_tls_cred_length : UInt16)
    end
  end

  @[Extern]
  struct SecPkgCredentials_Cert
    property encoded_cert_size : UInt32
    property encoded_cert : UInt8*
    def initialize(@encoded_cert_size : UInt32, @encoded_cert : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_SubjectAttributes
    property attribute_info : Void*
    def initialize(@attribute_info : Void*)
    end
  end

  @[Extern]
  struct SecPkgContext_CredInfo
    property cred_class : Win32cr::Security::Authentication::Identity::SECPKG_CRED_CLASS
    property is_prompting_needed : UInt32
    def initialize(@cred_class : Win32cr::Security::Authentication::Identity::SECPKG_CRED_CLASS, @is_prompting_needed : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_NegoPackageInfo
    property package_mask : UInt32
    def initialize(@package_mask : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_NegoStatus
    property last_status : UInt32
    def initialize(@last_status : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_Sizes
    property cbMaxToken : UInt32
    property cbMaxSignature : UInt32
    property cbBlockSize : UInt32
    property cbSecurityTrailer : UInt32
    def initialize(@cbMaxToken : UInt32, @cbMaxSignature : UInt32, @cbBlockSize : UInt32, @cbSecurityTrailer : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_StreamSizes
    property cbHeader : UInt32
    property cbTrailer : UInt32
    property cbMaximumMessage : UInt32
    property cBuffers : UInt32
    property cbBlockSize : UInt32
    def initialize(@cbHeader : UInt32, @cbTrailer : UInt32, @cbMaximumMessage : UInt32, @cBuffers : UInt32, @cbBlockSize : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_NamesW
    property sUserName : UInt16*
    def initialize(@sUserName : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgContext_LastClientTokenStatus
    property last_client_token_status : Win32cr::Security::Authentication::Identity::SECPKG_ATTR_LCT_STATUS
    def initialize(@last_client_token_status : Win32cr::Security::Authentication::Identity::SECPKG_ATTR_LCT_STATUS)
    end
  end

  @[Extern]
  struct SecPkgContext_NamesA
    property sUserName : Int8*
    def initialize(@sUserName : Int8*)
    end
  end

  @[Extern]
  struct SecPkgContext_Lifespan
    property tsStart : Win32cr::Foundation::LARGE_INTEGER
    property tsExpiry : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@tsStart : Win32cr::Foundation::LARGE_INTEGER, @tsExpiry : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct SecPkgContext_DceInfo
    property authz_svc : UInt32
    property pPac : Void*
    def initialize(@authz_svc : UInt32, @pPac : Void*)
    end
  end

  @[Extern]
  struct SecPkgContext_KeyInfoA
    property sSignatureAlgorithmName : Int8*
    property sEncryptAlgorithmName : Int8*
    property key_size : UInt32
    property signature_algorithm : UInt32
    property encrypt_algorithm : UInt32
    def initialize(@sSignatureAlgorithmName : Int8*, @sEncryptAlgorithmName : Int8*, @key_size : UInt32, @signature_algorithm : UInt32, @encrypt_algorithm : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_KeyInfoW
    property sSignatureAlgorithmName : UInt16*
    property sEncryptAlgorithmName : UInt16*
    property key_size : UInt32
    property signature_algorithm : UInt32
    property encrypt_algorithm : UInt32
    def initialize(@sSignatureAlgorithmName : UInt16*, @sEncryptAlgorithmName : UInt16*, @key_size : UInt32, @signature_algorithm : UInt32, @encrypt_algorithm : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_AuthorityA
    property sAuthorityName : Int8*
    def initialize(@sAuthorityName : Int8*)
    end
  end

  @[Extern]
  struct SecPkgContext_AuthorityW
    property sAuthorityName : UInt16*
    def initialize(@sAuthorityName : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgContext_ProtoInfoA
    property sProtocolName : Int8*
    property majorVersion : UInt32
    property minorVersion : UInt32
    def initialize(@sProtocolName : Int8*, @majorVersion : UInt32, @minorVersion : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_ProtoInfoW
    property sProtocolName : UInt16*
    property majorVersion : UInt32
    property minorVersion : UInt32
    def initialize(@sProtocolName : UInt16*, @majorVersion : UInt32, @minorVersion : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_PasswordExpiry
    property tsPasswordExpires : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@tsPasswordExpires : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct SecPkgContext_LogoffTime
    property tsLogoffTime : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@tsLogoffTime : Win32cr::Foundation::LARGE_INTEGER)
    end
  end

  @[Extern]
  struct SecPkgContext_SessionKey
    property session_key_length : UInt32
    property session_key : UInt8*
    def initialize(@session_key_length : UInt32, @session_key : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_NegoKeys
    property key_type : UInt32
    property key_length : UInt16
    property key_value : UInt8*
    property verify_key_type : UInt32
    property verify_key_length : UInt16
    property verify_key_value : UInt8*
    def initialize(@key_type : UInt32, @key_length : UInt16, @key_value : UInt8*, @verify_key_type : UInt32, @verify_key_length : UInt16, @verify_key_value : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_PackageInfoW
    property package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoW*
    def initialize(@package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoW*)
    end
  end

  @[Extern]
  struct SecPkgContext_PackageInfoA
    property package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoA*
    def initialize(@package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoA*)
    end
  end

  @[Extern]
  struct SecPkgContext_UserFlags
    property user_flags : UInt32
    def initialize(@user_flags : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_Flags
    property flags : UInt32
    def initialize(@flags : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_NegotiationInfoA
    property package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoA*
    property negotiation_state : UInt32
    def initialize(@package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoA*, @negotiation_state : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_NegotiationInfoW
    property package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoW*
    property negotiation_state : UInt32
    def initialize(@package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoW*, @negotiation_state : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_NativeNamesW
    property sClientName : UInt16*
    property sServerName : UInt16*
    def initialize(@sClientName : UInt16*, @sServerName : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgContext_NativeNamesA
    property sClientName : Int8*
    property sServerName : Int8*
    def initialize(@sClientName : Int8*, @sServerName : Int8*)
    end
  end

  @[Extern]
  struct SecPkgContext_CredentialNameW
    property credential_type : UInt32
    property sCredentialName : UInt16*
    def initialize(@credential_type : UInt32, @sCredentialName : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgContext_CredentialNameA
    property credential_type : UInt32
    property sCredentialName : Int8*
    def initialize(@credential_type : UInt32, @sCredentialName : Int8*)
    end
  end

  @[Extern]
  struct SecPkgContext_AccessToken
    property access_token : Void*
    def initialize(@access_token : Void*)
    end
  end

  @[Extern]
  struct SecPkgContext_TargetInformation
    property marshalled_target_info_length : UInt32
    property marshalled_target_info : UInt8*
    def initialize(@marshalled_target_info_length : UInt32, @marshalled_target_info : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_AuthzID
    property authz_id_length : UInt32
    property authz_id : Win32cr::Foundation::PSTR
    def initialize(@authz_id_length : UInt32, @authz_id : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SecPkgContext_Target
    property target_length : UInt32
    property target : Win32cr::Foundation::PSTR
    def initialize(@target_length : UInt32, @target : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SecPkgContext_ClientSpecifiedTarget
    property sTargetName : UInt16*
    def initialize(@sTargetName : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgContext_Bindings
    property bindings_length : UInt32
    property bindings : Win32cr::Security::Authentication::Identity::SEC_CHANNEL_BINDINGS*
    def initialize(@bindings_length : UInt32, @bindings : Win32cr::Security::Authentication::Identity::SEC_CHANNEL_BINDINGS*)
    end
  end

  @[Extern]
  struct SecPkgContext_ApplicationProtocol
    property proto_nego_status : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS
    property proto_nego_ext : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT
    property protocol_id_size : UInt8
    property protocol_id : UInt8[255]
    def initialize(@proto_nego_status : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS, @proto_nego_ext : Win32cr::Security::Authentication::Identity::SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT, @protocol_id_size : UInt8, @protocol_id : UInt8[255])
    end
  end

  @[Extern]
  struct SecPkgContext_NegotiatedTlsExtensions
    property extensions_count : UInt32
    property extensions : UInt16*
    def initialize(@extensions_count : UInt32, @extensions : UInt16*)
    end
  end

  @[Extern]
  struct SECPKG_APP_MODE_INFO
    property user_function : UInt32
    property argument1 : LibC::UIntPtrT
    property argument2 : LibC::UIntPtrT
    property user_data : Win32cr::Security::Authentication::Identity::SecBuffer
    property return_to_lsa : Win32cr::Foundation::BOOLEAN
    def initialize(@user_function : UInt32, @argument1 : LibC::UIntPtrT, @argument2 : LibC::UIntPtrT, @user_data : Win32cr::Security::Authentication::Identity::SecBuffer, @return_to_lsa : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SecurityFunctionTableW
    property dwVersion : UInt32
    property enumerate_security_packages_w : Win32cr::Security::Authentication::Identity::ENUMERATE_SECURITY_PACKAGES_FN_W
    property query_credentials_attributes_w : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_FN_W
    property acquire_credentials_handle_w : Win32cr::Security::Authentication::Identity::ACQUIRE_CREDENTIALS_HANDLE_FN_W
    property free_credentials_handle : Win32cr::Security::Authentication::Identity::FREE_CREDENTIALS_HANDLE_FN
    property reserved2 : Void*
    property initialize_security_context_w : Win32cr::Security::Authentication::Identity::INITIALIZE_SECURITY_CONTEXT_FN_W
    property accept_security_context : Win32cr::Security::Authentication::Identity::ACCEPT_SECURITY_CONTEXT_FN
    property complete_auth_token : Win32cr::Security::Authentication::Identity::COMPLETE_AUTH_TOKEN_FN
    property delete_security_context : Win32cr::Security::Authentication::Identity::DELETE_SECURITY_CONTEXT_FN
    property apply_control_token : Win32cr::Security::Authentication::Identity::APPLY_CONTROL_TOKEN_FN
    property query_context_attributes_w : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_FN_W
    property impersonate_security_context : Win32cr::Security::Authentication::Identity::IMPERSONATE_SECURITY_CONTEXT_FN
    property revert_security_context : Win32cr::Security::Authentication::Identity::REVERT_SECURITY_CONTEXT_FN
    property make_signature : Win32cr::Security::Authentication::Identity::MAKE_SIGNATURE_FN
    property verify_signature : Win32cr::Security::Authentication::Identity::VERIFY_SIGNATURE_FN
    property free_context_buffer : Win32cr::Security::Authentication::Identity::FREE_CONTEXT_BUFFER_FN
    property query_security_package_info_w : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_PACKAGE_INFO_FN_W
    property reserved3 : Void*
    property reserved4 : Void*
    property export_security_context : Win32cr::Security::Authentication::Identity::EXPORT_SECURITY_CONTEXT_FN
    property import_security_context_w : Win32cr::Security::Authentication::Identity::IMPORT_SECURITY_CONTEXT_FN_W
    property add_credentials_w : Win32cr::Security::Authentication::Identity::ADD_CREDENTIALS_FN_W
    property reserved8 : Void*
    property query_security_context_token : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_CONTEXT_TOKEN_FN
    property encrypt_message : Win32cr::Security::Authentication::Identity::ENCRYPT_MESSAGE_FN
    property decrypt_message : Win32cr::Security::Authentication::Identity::DECRYPT_MESSAGE_FN
    property set_context_attributes_w : Win32cr::Security::Authentication::Identity::SET_CONTEXT_ATTRIBUTES_FN_W
    property set_credentials_attributes_w : Win32cr::Security::Authentication::Identity::SET_CREDENTIALS_ATTRIBUTES_FN_W
    property change_account_password_w : Win32cr::Security::Authentication::Identity::CHANGE_PASSWORD_FN_W
    property query_context_attributes_ex_w : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_EX_FN_W
    property query_credentials_attributes_ex_w : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W
    def initialize(@dwVersion : UInt32, @enumerate_security_packages_w : Win32cr::Security::Authentication::Identity::ENUMERATE_SECURITY_PACKAGES_FN_W, @query_credentials_attributes_w : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_FN_W, @acquire_credentials_handle_w : Win32cr::Security::Authentication::Identity::ACQUIRE_CREDENTIALS_HANDLE_FN_W, @free_credentials_handle : Win32cr::Security::Authentication::Identity::FREE_CREDENTIALS_HANDLE_FN, @reserved2 : Void*, @initialize_security_context_w : Win32cr::Security::Authentication::Identity::INITIALIZE_SECURITY_CONTEXT_FN_W, @accept_security_context : Win32cr::Security::Authentication::Identity::ACCEPT_SECURITY_CONTEXT_FN, @complete_auth_token : Win32cr::Security::Authentication::Identity::COMPLETE_AUTH_TOKEN_FN, @delete_security_context : Win32cr::Security::Authentication::Identity::DELETE_SECURITY_CONTEXT_FN, @apply_control_token : Win32cr::Security::Authentication::Identity::APPLY_CONTROL_TOKEN_FN, @query_context_attributes_w : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_FN_W, @impersonate_security_context : Win32cr::Security::Authentication::Identity::IMPERSONATE_SECURITY_CONTEXT_FN, @revert_security_context : Win32cr::Security::Authentication::Identity::REVERT_SECURITY_CONTEXT_FN, @make_signature : Win32cr::Security::Authentication::Identity::MAKE_SIGNATURE_FN, @verify_signature : Win32cr::Security::Authentication::Identity::VERIFY_SIGNATURE_FN, @free_context_buffer : Win32cr::Security::Authentication::Identity::FREE_CONTEXT_BUFFER_FN, @query_security_package_info_w : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_PACKAGE_INFO_FN_W, @reserved3 : Void*, @reserved4 : Void*, @export_security_context : Win32cr::Security::Authentication::Identity::EXPORT_SECURITY_CONTEXT_FN, @import_security_context_w : Win32cr::Security::Authentication::Identity::IMPORT_SECURITY_CONTEXT_FN_W, @add_credentials_w : Win32cr::Security::Authentication::Identity::ADD_CREDENTIALS_FN_W, @reserved8 : Void*, @query_security_context_token : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_CONTEXT_TOKEN_FN, @encrypt_message : Win32cr::Security::Authentication::Identity::ENCRYPT_MESSAGE_FN, @decrypt_message : Win32cr::Security::Authentication::Identity::DECRYPT_MESSAGE_FN, @set_context_attributes_w : Win32cr::Security::Authentication::Identity::SET_CONTEXT_ATTRIBUTES_FN_W, @set_credentials_attributes_w : Win32cr::Security::Authentication::Identity::SET_CREDENTIALS_ATTRIBUTES_FN_W, @change_account_password_w : Win32cr::Security::Authentication::Identity::CHANGE_PASSWORD_FN_W, @query_context_attributes_ex_w : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_EX_FN_W, @query_credentials_attributes_ex_w : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_W)
    end
  end

  @[Extern]
  struct SecurityFunctionTableA
    property dwVersion : UInt32
    property enumerate_security_packages_a : Win32cr::Security::Authentication::Identity::ENUMERATE_SECURITY_PACKAGES_FN_A
    property query_credentials_attributes_a : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_FN_A
    property acquire_credentials_handle_a : Win32cr::Security::Authentication::Identity::ACQUIRE_CREDENTIALS_HANDLE_FN_A
    property free_credentials_handle : Win32cr::Security::Authentication::Identity::FREE_CREDENTIALS_HANDLE_FN
    property reserved2 : Void*
    property initialize_security_context_a : Win32cr::Security::Authentication::Identity::INITIALIZE_SECURITY_CONTEXT_FN_A
    property accept_security_context : Win32cr::Security::Authentication::Identity::ACCEPT_SECURITY_CONTEXT_FN
    property complete_auth_token : Win32cr::Security::Authentication::Identity::COMPLETE_AUTH_TOKEN_FN
    property delete_security_context : Win32cr::Security::Authentication::Identity::DELETE_SECURITY_CONTEXT_FN
    property apply_control_token : Win32cr::Security::Authentication::Identity::APPLY_CONTROL_TOKEN_FN
    property query_context_attributes_a : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_FN_A
    property impersonate_security_context : Win32cr::Security::Authentication::Identity::IMPERSONATE_SECURITY_CONTEXT_FN
    property revert_security_context : Win32cr::Security::Authentication::Identity::REVERT_SECURITY_CONTEXT_FN
    property make_signature : Win32cr::Security::Authentication::Identity::MAKE_SIGNATURE_FN
    property verify_signature : Win32cr::Security::Authentication::Identity::VERIFY_SIGNATURE_FN
    property free_context_buffer : Win32cr::Security::Authentication::Identity::FREE_CONTEXT_BUFFER_FN
    property query_security_package_info_a : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_PACKAGE_INFO_FN_A
    property reserved3 : Void*
    property reserved4 : Void*
    property export_security_context : Win32cr::Security::Authentication::Identity::EXPORT_SECURITY_CONTEXT_FN
    property import_security_context_a : Win32cr::Security::Authentication::Identity::IMPORT_SECURITY_CONTEXT_FN_A
    property add_credentials_a : Win32cr::Security::Authentication::Identity::ADD_CREDENTIALS_FN_A
    property reserved8 : Void*
    property query_security_context_token : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_CONTEXT_TOKEN_FN
    property encrypt_message : Win32cr::Security::Authentication::Identity::ENCRYPT_MESSAGE_FN
    property decrypt_message : Win32cr::Security::Authentication::Identity::DECRYPT_MESSAGE_FN
    property set_context_attributes_a : Win32cr::Security::Authentication::Identity::SET_CONTEXT_ATTRIBUTES_FN_A
    property set_credentials_attributes_a : Win32cr::Security::Authentication::Identity::SET_CREDENTIALS_ATTRIBUTES_FN_A
    property change_account_password_a : Win32cr::Security::Authentication::Identity::CHANGE_PASSWORD_FN_A
    property query_context_attributes_ex_a : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_EX_FN_A
    property query_credentials_attributes_ex_a : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_A
    def initialize(@dwVersion : UInt32, @enumerate_security_packages_a : Win32cr::Security::Authentication::Identity::ENUMERATE_SECURITY_PACKAGES_FN_A, @query_credentials_attributes_a : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_FN_A, @acquire_credentials_handle_a : Win32cr::Security::Authentication::Identity::ACQUIRE_CREDENTIALS_HANDLE_FN_A, @free_credentials_handle : Win32cr::Security::Authentication::Identity::FREE_CREDENTIALS_HANDLE_FN, @reserved2 : Void*, @initialize_security_context_a : Win32cr::Security::Authentication::Identity::INITIALIZE_SECURITY_CONTEXT_FN_A, @accept_security_context : Win32cr::Security::Authentication::Identity::ACCEPT_SECURITY_CONTEXT_FN, @complete_auth_token : Win32cr::Security::Authentication::Identity::COMPLETE_AUTH_TOKEN_FN, @delete_security_context : Win32cr::Security::Authentication::Identity::DELETE_SECURITY_CONTEXT_FN, @apply_control_token : Win32cr::Security::Authentication::Identity::APPLY_CONTROL_TOKEN_FN, @query_context_attributes_a : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_FN_A, @impersonate_security_context : Win32cr::Security::Authentication::Identity::IMPERSONATE_SECURITY_CONTEXT_FN, @revert_security_context : Win32cr::Security::Authentication::Identity::REVERT_SECURITY_CONTEXT_FN, @make_signature : Win32cr::Security::Authentication::Identity::MAKE_SIGNATURE_FN, @verify_signature : Win32cr::Security::Authentication::Identity::VERIFY_SIGNATURE_FN, @free_context_buffer : Win32cr::Security::Authentication::Identity::FREE_CONTEXT_BUFFER_FN, @query_security_package_info_a : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_PACKAGE_INFO_FN_A, @reserved3 : Void*, @reserved4 : Void*, @export_security_context : Win32cr::Security::Authentication::Identity::EXPORT_SECURITY_CONTEXT_FN, @import_security_context_a : Win32cr::Security::Authentication::Identity::IMPORT_SECURITY_CONTEXT_FN_A, @add_credentials_a : Win32cr::Security::Authentication::Identity::ADD_CREDENTIALS_FN_A, @reserved8 : Void*, @query_security_context_token : Win32cr::Security::Authentication::Identity::QUERY_SECURITY_CONTEXT_TOKEN_FN, @encrypt_message : Win32cr::Security::Authentication::Identity::ENCRYPT_MESSAGE_FN, @decrypt_message : Win32cr::Security::Authentication::Identity::DECRYPT_MESSAGE_FN, @set_context_attributes_a : Win32cr::Security::Authentication::Identity::SET_CONTEXT_ATTRIBUTES_FN_A, @set_credentials_attributes_a : Win32cr::Security::Authentication::Identity::SET_CREDENTIALS_ATTRIBUTES_FN_A, @change_account_password_a : Win32cr::Security::Authentication::Identity::CHANGE_PASSWORD_FN_A, @query_context_attributes_ex_a : Win32cr::Security::Authentication::Identity::QUERY_CONTEXT_ATTRIBUTES_EX_FN_A, @query_credentials_attributes_ex_a : Win32cr::Security::Authentication::Identity::QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_A)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY_EX2
    property version : UInt32
    property cbHeaderLength : UInt16
    property cbStructureLength : UInt32
    property user_offset : UInt32
    property user_length : UInt16
    property domain_offset : UInt32
    property domain_length : UInt16
    property packed_credentials_offset : UInt32
    property packed_credentials_length : UInt16
    property flags : UInt32
    property package_list_offset : UInt32
    property package_list_length : UInt16
    def initialize(@version : UInt32, @cbHeaderLength : UInt16, @cbStructureLength : UInt32, @user_offset : UInt32, @user_length : UInt16, @domain_offset : UInt32, @domain_length : UInt16, @packed_credentials_offset : UInt32, @packed_credentials_length : UInt16, @flags : UInt32, @package_list_offset : UInt32, @package_list_length : UInt16)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY_EXW
    property version : UInt32
    property length : UInt32
    property user : UInt16*
    property user_length : UInt32
    property domain : UInt16*
    property domain_length : UInt32
    property password : UInt16*
    property password_length : UInt32
    property flags : UInt32
    property package_list : UInt16*
    property package_list_length : UInt32
    def initialize(@version : UInt32, @length : UInt32, @user : UInt16*, @user_length : UInt32, @domain : UInt16*, @domain_length : UInt32, @password : UInt16*, @password_length : UInt32, @flags : UInt32, @package_list : UInt16*, @package_list_length : UInt32)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY_EXA
    property version : UInt32
    property length : UInt32
    property user : UInt8*
    property user_length : UInt32
    property domain : UInt8*
    property domain_length : UInt32
    property password : UInt8*
    property password_length : UInt32
    property flags : UInt32
    property package_list : UInt8*
    property package_list_length : UInt32
    def initialize(@version : UInt32, @length : UInt32, @user : UInt8*, @user_length : UInt32, @domain : UInt8*, @domain_length : UInt32, @password : UInt8*, @password_length : UInt32, @flags : UInt32, @package_list : UInt8*, @package_list_length : UInt32)
    end
  end

  @[Extern(union: true)]
  struct SEC_WINNT_AUTH_IDENTITY_INFO
    property auth_id_exw : Win32cr::Security::Authentication::Identity::SEC_WINNT_AUTH_IDENTITY_EXW
    property auth_id_exa : Win32cr::Security::Authentication::Identity::SEC_WINNT_AUTH_IDENTITY_EXA
    property auth_id_a : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A
    property auth_id_w : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W
    property auth_id_ex2 : Win32cr::Security::Authentication::Identity::SEC_WINNT_AUTH_IDENTITY_EX2
    def initialize(@auth_id_exw : Win32cr::Security::Authentication::Identity::SEC_WINNT_AUTH_IDENTITY_EXW, @auth_id_exa : Win32cr::Security::Authentication::Identity::SEC_WINNT_AUTH_IDENTITY_EXA, @auth_id_a : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_A, @auth_id_w : Win32cr::System::Rpc::SEC_WINNT_AUTH_IDENTITY_W, @auth_id_ex2 : Win32cr::Security::Authentication::Identity::SEC_WINNT_AUTH_IDENTITY_EX2)
    end
  end

  @[Extern]
  struct SECURITY_PACKAGE_OPTIONS
    property size : UInt32
    property type__ : Win32cr::Security::Authentication::Identity::SECURITY_PACKAGE_OPTIONS_TYPE
    property flags : UInt32
    property signature_size : UInt32
    property signature : Void*
    def initialize(@size : UInt32, @type__ : Win32cr::Security::Authentication::Identity::SECURITY_PACKAGE_OPTIONS_TYPE, @flags : UInt32, @signature_size : UInt32, @signature : Void*)
    end
  end

  @[Extern]
  struct LSA_TOKEN_INFORMATION_NULL
    property expiration_time : Win32cr::Foundation::LARGE_INTEGER
    property groups : Win32cr::Security::TOKEN_GROUPS*
    def initialize(@expiration_time : Win32cr::Foundation::LARGE_INTEGER, @groups : Win32cr::Security::TOKEN_GROUPS*)
    end
  end

  @[Extern]
  struct LSA_TOKEN_INFORMATION_V1
    property expiration_time : Win32cr::Foundation::LARGE_INTEGER
    property user : Win32cr::Security::TOKEN_USER
    property groups : Win32cr::Security::TOKEN_GROUPS*
    property primary_group : Win32cr::Security::TOKEN_PRIMARY_GROUP
    property privileges : Win32cr::Security::TOKEN_PRIVILEGES*
    property owner : Win32cr::Security::TOKEN_OWNER
    property default_dacl : Win32cr::Security::TOKEN_DEFAULT_DACL
    def initialize(@expiration_time : Win32cr::Foundation::LARGE_INTEGER, @user : Win32cr::Security::TOKEN_USER, @groups : Win32cr::Security::TOKEN_GROUPS*, @primary_group : Win32cr::Security::TOKEN_PRIMARY_GROUP, @privileges : Win32cr::Security::TOKEN_PRIVILEGES*, @owner : Win32cr::Security::TOKEN_OWNER, @default_dacl : Win32cr::Security::TOKEN_DEFAULT_DACL)
    end
  end

  @[Extern]
  struct LSA_TOKEN_INFORMATION_V3
    property expiration_time : Win32cr::Foundation::LARGE_INTEGER
    property user : Win32cr::Security::TOKEN_USER
    property groups : Win32cr::Security::TOKEN_GROUPS*
    property primary_group : Win32cr::Security::TOKEN_PRIMARY_GROUP
    property privileges : Win32cr::Security::TOKEN_PRIVILEGES*
    property owner : Win32cr::Security::TOKEN_OWNER
    property default_dacl : Win32cr::Security::TOKEN_DEFAULT_DACL
    property user_claims : Win32cr::Security::TOKEN_USER_CLAIMS
    property device_claims : Win32cr::Security::TOKEN_DEVICE_CLAIMS
    property device_groups : Win32cr::Security::TOKEN_GROUPS*
    def initialize(@expiration_time : Win32cr::Foundation::LARGE_INTEGER, @user : Win32cr::Security::TOKEN_USER, @groups : Win32cr::Security::TOKEN_GROUPS*, @primary_group : Win32cr::Security::TOKEN_PRIMARY_GROUP, @privileges : Win32cr::Security::TOKEN_PRIVILEGES*, @owner : Win32cr::Security::TOKEN_OWNER, @default_dacl : Win32cr::Security::TOKEN_DEFAULT_DACL, @user_claims : Win32cr::Security::TOKEN_USER_CLAIMS, @device_claims : Win32cr::Security::TOKEN_DEVICE_CLAIMS, @device_groups : Win32cr::Security::TOKEN_GROUPS*)
    end
  end

  @[Extern]
  struct LSA_DISPATCH_TABLE
    property create_logon_session : Win32cr::Security::Authentication::Identity::PLSA_CREATE_LOGON_SESSION
    property delete_logon_session : Win32cr::Security::Authentication::Identity::PLSA_DELETE_LOGON_SESSION
    property add_credential : Win32cr::Security::Authentication::Identity::PLSA_ADD_CREDENTIAL
    property get_credentials : Win32cr::Security::Authentication::Identity::PLSA_GET_CREDENTIALS
    property delete_credential : Win32cr::Security::Authentication::Identity::PLSA_DELETE_CREDENTIAL
    property allocate_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP
    property free_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP
    property allocate_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_CLIENT_BUFFER
    property free_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_FREE_CLIENT_BUFFER
    property copy_to_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_TO_CLIENT_BUFFER
    property copy_from_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_FROM_CLIENT_BUFFER
    def initialize(@create_logon_session : Win32cr::Security::Authentication::Identity::PLSA_CREATE_LOGON_SESSION, @delete_logon_session : Win32cr::Security::Authentication::Identity::PLSA_DELETE_LOGON_SESSION, @add_credential : Win32cr::Security::Authentication::Identity::PLSA_ADD_CREDENTIAL, @get_credentials : Win32cr::Security::Authentication::Identity::PLSA_GET_CREDENTIALS, @delete_credential : Win32cr::Security::Authentication::Identity::PLSA_DELETE_CREDENTIAL, @allocate_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP, @free_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP, @allocate_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_CLIENT_BUFFER, @free_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_FREE_CLIENT_BUFFER, @copy_to_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_TO_CLIENT_BUFFER, @copy_from_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_FROM_CLIENT_BUFFER)
    end
  end

  @[Extern]
  struct SAM_REGISTER_MAPPING_ELEMENT
    property original : Win32cr::Foundation::PSTR
    property mapped : Win32cr::Foundation::PSTR
    property continuable : Win32cr::Foundation::BOOLEAN
    def initialize(@original : Win32cr::Foundation::PSTR, @mapped : Win32cr::Foundation::PSTR, @continuable : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct SAM_REGISTER_MAPPING_LIST
    property count : UInt32
    property elements : Win32cr::Security::Authentication::Identity::SAM_REGISTER_MAPPING_ELEMENT*
    def initialize(@count : UInt32, @elements : Win32cr::Security::Authentication::Identity::SAM_REGISTER_MAPPING_ELEMENT*)
    end
  end

  @[Extern]
  struct SAM_REGISTER_MAPPING_TABLE
    property count : UInt32
    property lists : Win32cr::Security::Authentication::Identity::SAM_REGISTER_MAPPING_LIST*
    def initialize(@count : UInt32, @lists : Win32cr::Security::Authentication::Identity::SAM_REGISTER_MAPPING_LIST*)
    end
  end

  @[Extern]
  struct SECPKG_CLIENT_INFO
    property logon_id : Win32cr::Foundation::LUID
    property process_id : UInt32
    property thread_id : UInt32
    property has_tcb_privilege : Win32cr::Foundation::BOOLEAN
    property impersonating : Win32cr::Foundation::BOOLEAN
    property restricted : Win32cr::Foundation::BOOLEAN
    property client_flags : UInt8
    property impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL
    property client_token : Win32cr::Foundation::HANDLE
    def initialize(@logon_id : Win32cr::Foundation::LUID, @process_id : UInt32, @thread_id : UInt32, @has_tcb_privilege : Win32cr::Foundation::BOOLEAN, @impersonating : Win32cr::Foundation::BOOLEAN, @restricted : Win32cr::Foundation::BOOLEAN, @client_flags : UInt8, @impersonation_level : Win32cr::Security::SECURITY_IMPERSONATION_LEVEL, @client_token : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct SECPKG_CALL_INFO
    property process_id : UInt32
    property thread_id : UInt32
    property attributes : UInt32
    property call_count : UInt32
    property mech_oid : Void*
    def initialize(@process_id : UInt32, @thread_id : UInt32, @attributes : UInt32, @call_count : UInt32, @mech_oid : Void*)
    end
  end

  @[Extern]
  struct SECPKG_SUPPLEMENTAL_CRED
    property package_name : Win32cr::Foundation::UNICODE_STRING
    property credential_size : UInt32
    property credentials : UInt8*
    def initialize(@package_name : Win32cr::Foundation::UNICODE_STRING, @credential_size : UInt32, @credentials : UInt8*)
    end
  end

  @[Extern]
  struct SECPKG_BYTE_VECTOR
    property byte_array_offset : UInt32
    property byte_array_length : UInt16
    def initialize(@byte_array_offset : UInt32, @byte_array_length : UInt16)
    end
  end

  @[Extern]
  struct SECPKG_SHORT_VECTOR
    property short_array_offset : UInt32
    property short_array_count : UInt16
    def initialize(@short_array_offset : UInt32, @short_array_count : UInt16)
    end
  end

  @[Extern]
  struct SECPKG_SUPPLIED_CREDENTIAL
    property cbHeaderLength : UInt16
    property cbStructureLength : UInt16
    property user_name : Win32cr::Security::Authentication::Identity::SECPKG_SHORT_VECTOR
    property domain_name : Win32cr::Security::Authentication::Identity::SECPKG_SHORT_VECTOR
    property packed_credentials : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR
    property cred_flags : UInt32
    def initialize(@cbHeaderLength : UInt16, @cbStructureLength : UInt16, @user_name : Win32cr::Security::Authentication::Identity::SECPKG_SHORT_VECTOR, @domain_name : Win32cr::Security::Authentication::Identity::SECPKG_SHORT_VECTOR, @packed_credentials : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR, @cred_flags : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_CREDENTIAL
    property version : UInt64
    property cbHeaderLength : UInt16
    property cbStructureLength : UInt32
    property client_process : UInt32
    property client_thread : UInt32
    property logon_id : Win32cr::Foundation::LUID
    property client_token : Win32cr::Foundation::HANDLE
    property session_id : UInt32
    property modified_id : Win32cr::Foundation::LUID
    property fCredentials : UInt32
    property flags : UInt32
    property principal_name : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR
    property package_list : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR
    property marshaled_supplied_creds : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR
    def initialize(@version : UInt64, @cbHeaderLength : UInt16, @cbStructureLength : UInt32, @client_process : UInt32, @client_thread : UInt32, @logon_id : Win32cr::Foundation::LUID, @client_token : Win32cr::Foundation::HANDLE, @session_id : UInt32, @modified_id : Win32cr::Foundation::LUID, @fCredentials : UInt32, @flags : UInt32, @principal_name : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR, @package_list : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR, @marshaled_supplied_creds : Win32cr::Security::Authentication::Identity::SECPKG_BYTE_VECTOR)
    end
  end

  @[Extern]
  struct SECPKG_SUPPLEMENTAL_CRED_ARRAY
    property credential_count : UInt32
    property credentials : Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED*
    def initialize(@credential_count : UInt32, @credentials : Win32cr::Security::Authentication::Identity::SECPKG_SUPPLEMENTAL_CRED*)
    end
  end

  @[Extern]
  struct SECPKG_SURROGATE_LOGON_ENTRY
    property type__ : LibC::GUID
    property data : Void*
    def initialize(@type__ : LibC::GUID, @data : Void*)
    end
  end

  @[Extern]
  struct SECPKG_SURROGATE_LOGON
    property version : UInt32
    property surrogate_logon_id : Win32cr::Foundation::LUID
    property entry_count : UInt32
    property entries : Win32cr::Security::Authentication::Identity::SECPKG_SURROGATE_LOGON_ENTRY*
    def initialize(@version : UInt32, @surrogate_logon_id : Win32cr::Foundation::LUID, @entry_count : UInt32, @entries : Win32cr::Security::Authentication::Identity::SECPKG_SURROGATE_LOGON_ENTRY*)
    end
  end

  @[Extern]
  struct SECPKG_PRIMARY_CRED
    property logon_id : Win32cr::Foundation::LUID
    property downlevel_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    property old_password : Win32cr::Foundation::UNICODE_STRING
    property user_sid : Win32cr::Foundation::PSID
    property flags : UInt32
    property dns_domain_name : Win32cr::Foundation::UNICODE_STRING
    property upn : Win32cr::Foundation::UNICODE_STRING
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property spare1 : Win32cr::Foundation::UNICODE_STRING
    property spare2 : Win32cr::Foundation::UNICODE_STRING
    property spare3 : Win32cr::Foundation::UNICODE_STRING
    property spare4 : Win32cr::Foundation::UNICODE_STRING
    def initialize(@logon_id : Win32cr::Foundation::LUID, @downlevel_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING, @old_password : Win32cr::Foundation::UNICODE_STRING, @user_sid : Win32cr::Foundation::PSID, @flags : UInt32, @dns_domain_name : Win32cr::Foundation::UNICODE_STRING, @upn : Win32cr::Foundation::UNICODE_STRING, @logon_server : Win32cr::Foundation::UNICODE_STRING, @spare1 : Win32cr::Foundation::UNICODE_STRING, @spare2 : Win32cr::Foundation::UNICODE_STRING, @spare3 : Win32cr::Foundation::UNICODE_STRING, @spare4 : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct SECPKG_PRIMARY_CRED_EX
    property logon_id : Win32cr::Foundation::LUID
    property downlevel_name : Win32cr::Foundation::UNICODE_STRING
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property password : Win32cr::Foundation::UNICODE_STRING
    property old_password : Win32cr::Foundation::UNICODE_STRING
    property user_sid : Win32cr::Foundation::PSID
    property flags : UInt32
    property dns_domain_name : Win32cr::Foundation::UNICODE_STRING
    property upn : Win32cr::Foundation::UNICODE_STRING
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property spare1 : Win32cr::Foundation::UNICODE_STRING
    property spare2 : Win32cr::Foundation::UNICODE_STRING
    property spare3 : Win32cr::Foundation::UNICODE_STRING
    property spare4 : Win32cr::Foundation::UNICODE_STRING
    property package_id : LibC::UIntPtrT
    property prev_logon_id : Win32cr::Foundation::LUID
    property flags_ex : UInt32
    def initialize(@logon_id : Win32cr::Foundation::LUID, @downlevel_name : Win32cr::Foundation::UNICODE_STRING, @domain_name : Win32cr::Foundation::UNICODE_STRING, @password : Win32cr::Foundation::UNICODE_STRING, @old_password : Win32cr::Foundation::UNICODE_STRING, @user_sid : Win32cr::Foundation::PSID, @flags : UInt32, @dns_domain_name : Win32cr::Foundation::UNICODE_STRING, @upn : Win32cr::Foundation::UNICODE_STRING, @logon_server : Win32cr::Foundation::UNICODE_STRING, @spare1 : Win32cr::Foundation::UNICODE_STRING, @spare2 : Win32cr::Foundation::UNICODE_STRING, @spare3 : Win32cr::Foundation::UNICODE_STRING, @spare4 : Win32cr::Foundation::UNICODE_STRING, @package_id : LibC::UIntPtrT, @prev_logon_id : Win32cr::Foundation::LUID, @flags_ex : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_PARAMETERS
    property version : UInt32
    property machine_state : UInt32
    property setup_mode : UInt32
    property domain_sid : Win32cr::Foundation::PSID
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property dns_domain_name : Win32cr::Foundation::UNICODE_STRING
    property domain_guid : LibC::GUID
    def initialize(@version : UInt32, @machine_state : UInt32, @setup_mode : UInt32, @domain_sid : Win32cr::Foundation::PSID, @domain_name : Win32cr::Foundation::UNICODE_STRING, @dns_domain_name : Win32cr::Foundation::UNICODE_STRING, @domain_guid : LibC::GUID)
    end
  end

  @[Extern]
  struct SECPKG_GSS_INFO
    property encoded_id_length : UInt32
    property encoded_id : UInt8[4]
    def initialize(@encoded_id_length : UInt32, @encoded_id : UInt8[4])
    end
  end

  @[Extern]
  struct SECPKG_CONTEXT_THUNKS
    property info_level_count : UInt32
    property levels : UInt32*
    def initialize(@info_level_count : UInt32, @levels : UInt32*)
    end
  end

  @[Extern]
  struct SECPKG_MUTUAL_AUTH_LEVEL
    property mutual_auth_level : UInt32
    def initialize(@mutual_auth_level : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_WOW_CLIENT_DLL
    property wow_client_dll_path : Win32cr::Foundation::UNICODE_STRING
    def initialize(@wow_client_dll_path : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct SECPKG_SERIALIZED_OID
    property oid_length : UInt32
    property oid_attributes : UInt32
    property oid_value : UInt8[32]
    def initialize(@oid_length : UInt32, @oid_attributes : UInt32, @oid_value : UInt8[32])
    end
  end

  @[Extern]
  struct SECPKG_EXTRA_OIDS
    property oid_count : UInt32
    property oids : Win32cr::Security::Authentication::Identity::SECPKG_SERIALIZED_OID*
    def initialize(@oid_count : UInt32, @oids : Win32cr::Security::Authentication::Identity::SECPKG_SERIALIZED_OID*)
    end
  end

  @[Extern]
  struct SECPKG_NEGO2_INFO
    property auth_scheme : UInt8[16]
    property package_flags : UInt32
    def initialize(@auth_scheme : UInt8[16], @package_flags : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_EXTENDED_INFORMATION
    property class__ : Win32cr::Security::Authentication::Identity::SECPKG_EXTENDED_INFORMATION_CLASS
    property info : Info_e__Union_

    # Nested Type Info_e__Union_
    @[Extern(union: true)]
    struct Info_e__Union_
    property gss_info : Win32cr::Security::Authentication::Identity::SECPKG_GSS_INFO
    property context_thunks : Win32cr::Security::Authentication::Identity::SECPKG_CONTEXT_THUNKS
    property mutual_auth_level : Win32cr::Security::Authentication::Identity::SECPKG_MUTUAL_AUTH_LEVEL
    property wow_client_dll : Win32cr::Security::Authentication::Identity::SECPKG_WOW_CLIENT_DLL
    property extra_oids : Win32cr::Security::Authentication::Identity::SECPKG_EXTRA_OIDS
    property nego2_info : Win32cr::Security::Authentication::Identity::SECPKG_NEGO2_INFO
    def initialize(@gss_info : Win32cr::Security::Authentication::Identity::SECPKG_GSS_INFO, @context_thunks : Win32cr::Security::Authentication::Identity::SECPKG_CONTEXT_THUNKS, @mutual_auth_level : Win32cr::Security::Authentication::Identity::SECPKG_MUTUAL_AUTH_LEVEL, @wow_client_dll : Win32cr::Security::Authentication::Identity::SECPKG_WOW_CLIENT_DLL, @extra_oids : Win32cr::Security::Authentication::Identity::SECPKG_EXTRA_OIDS, @nego2_info : Win32cr::Security::Authentication::Identity::SECPKG_NEGO2_INFO)
    end
    end

    def initialize(@class__ : Win32cr::Security::Authentication::Identity::SECPKG_EXTENDED_INFORMATION_CLASS, @info : Info_e__Union_)
    end
  end

  @[Extern]
  struct SECPKG_TARGETINFO
    property domain_sid : Win32cr::Foundation::PSID
    property computer_name : Win32cr::Foundation::PWSTR
    def initialize(@domain_sid : Win32cr::Foundation::PSID, @computer_name : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SecPkgContext_SaslContext
    property sasl_context : Void*
    def initialize(@sasl_context : Void*)
    end
  end

  @[Extern]
  struct SECURITY_USER_DATA
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property pSid : Win32cr::Foundation::PSID
    def initialize(@user_name : Win32cr::Foundation::UNICODE_STRING, @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @logon_server : Win32cr::Foundation::UNICODE_STRING, @pSid : Win32cr::Foundation::PSID)
    end
  end

  @[Extern]
  struct SECPKG_CALL_PACKAGE_PIN_DC_REQUEST
    property message_type : UInt32
    property flags : UInt32
    property domain_name : Win32cr::Foundation::UNICODE_STRING
    property dc_name : Win32cr::Foundation::UNICODE_STRING
    property dc_flags : UInt32
    def initialize(@message_type : UInt32, @flags : UInt32, @domain_name : Win32cr::Foundation::UNICODE_STRING, @dc_name : Win32cr::Foundation::UNICODE_STRING, @dc_flags : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_CALL_PACKAGE_UNPIN_ALL_DCS_REQUEST
    property message_type : UInt32
    property flags : UInt32
    def initialize(@message_type : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST
    property message_type : UInt32
    property origin_logon_id : Win32cr::Foundation::LUID
    property destination_logon_id : Win32cr::Foundation::LUID
    property flags : UInt32
    def initialize(@message_type : UInt32, @origin_logon_id : Win32cr::Foundation::LUID, @destination_logon_id : Win32cr::Foundation::LUID, @flags : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_REDIRECTED_LOGON_BUFFER
    property redirected_logon_guid : LibC::GUID
    property redirected_logon_handle : Win32cr::Foundation::HANDLE
    property init : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_INIT
    property callback : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CALLBACK
    property cleanup_callback : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK
    property get_logon_creds : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS
    property get_supplemental_creds : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS
    def initialize(@redirected_logon_guid : LibC::GUID, @redirected_logon_handle : Win32cr::Foundation::HANDLE, @init : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_INIT, @callback : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CALLBACK, @cleanup_callback : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK, @get_logon_creds : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS, @get_supplemental_creds : Win32cr::Security::Authentication::Identity::PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS)
    end
  end

  @[Extern]
  struct SECPKG_POST_LOGON_USER_INFO
    property flags : UInt32
    property logon_id : Win32cr::Foundation::LUID
    property linked_logon_id : Win32cr::Foundation::LUID
    def initialize(@flags : UInt32, @logon_id : Win32cr::Foundation::LUID, @linked_logon_id : Win32cr::Foundation::LUID)
    end
  end

  @[Extern]
  struct SECPKG_EVENT_PACKAGE_CHANGE
    property change_type : Win32cr::Security::Authentication::Identity::SECPKG_PACKAGE_CHANGE_TYPE
    property package_id : LibC::UIntPtrT
    property package_name : Win32cr::Foundation::UNICODE_STRING
    def initialize(@change_type : Win32cr::Security::Authentication::Identity::SECPKG_PACKAGE_CHANGE_TYPE, @package_id : LibC::UIntPtrT, @package_name : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct SECPKG_EVENT_ROLE_CHANGE
    property previous_role : UInt32
    property new_role : UInt32
    def initialize(@previous_role : UInt32, @new_role : UInt32)
    end
  end

  @[Extern]
  struct SECPKG_EVENT_NOTIFY
    property event_class : UInt32
    property reserved : UInt32
    property event_data_size : UInt32
    property event_data : Void*
    property package_parameter : Void*
    def initialize(@event_class : UInt32, @reserved : UInt32, @event_data_size : UInt32, @event_data : Void*, @package_parameter : Void*)
    end
  end

  @[Extern]
  struct ENCRYPTED_CREDENTIALW
    property cred : Win32cr::Security::Credentials::CREDENTIALW
    property clear_credential_blob_size : UInt32
    def initialize(@cred : Win32cr::Security::Credentials::CREDENTIALW, @clear_credential_blob_size : UInt32)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY32
    property user : UInt32
    property user_length : UInt32
    property domain : UInt32
    property domain_length : UInt32
    property password : UInt32
    property password_length : UInt32
    property flags : UInt32
    def initialize(@user : UInt32, @user_length : UInt32, @domain : UInt32, @domain_length : UInt32, @password : UInt32, @password_length : UInt32, @flags : UInt32)
    end
  end

  @[Extern]
  struct SEC_WINNT_AUTH_IDENTITY_EX32
    property version : UInt32
    property length : UInt32
    property user : UInt32
    property user_length : UInt32
    property domain : UInt32
    property domain_length : UInt32
    property password : UInt32
    property password_length : UInt32
    property flags : UInt32
    property package_list : UInt32
    property package_list_length : UInt32
    def initialize(@version : UInt32, @length : UInt32, @user : UInt32, @user_length : UInt32, @domain : UInt32, @domain_length : UInt32, @password : UInt32, @password_length : UInt32, @flags : UInt32, @package_list : UInt32, @package_list_length : UInt32)
    end
  end

  @[Extern]
  struct LSA_SECPKG_FUNCTION_TABLE
    property create_logon_session : Win32cr::Security::Authentication::Identity::PLSA_CREATE_LOGON_SESSION
    property delete_logon_session : Win32cr::Security::Authentication::Identity::PLSA_DELETE_LOGON_SESSION
    property add_credential : Win32cr::Security::Authentication::Identity::PLSA_ADD_CREDENTIAL
    property get_credentials : Win32cr::Security::Authentication::Identity::PLSA_GET_CREDENTIALS
    property delete_credential : Win32cr::Security::Authentication::Identity::PLSA_DELETE_CREDENTIAL
    property allocate_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP
    property free_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP
    property allocate_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_CLIENT_BUFFER
    property free_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_FREE_CLIENT_BUFFER
    property copy_to_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_TO_CLIENT_BUFFER
    property copy_from_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_FROM_CLIENT_BUFFER
    property impersonate_client : Win32cr::Security::Authentication::Identity::PLSA_IMPERSONATE_CLIENT
    property unload_package : Win32cr::Security::Authentication::Identity::PLSA_UNLOAD_PACKAGE
    property duplicate_handle : Win32cr::Security::Authentication::Identity::PLSA_DUPLICATE_HANDLE
    property save_supplemental_credentials : Win32cr::Security::Authentication::Identity::PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS
    property create_thread : Win32cr::Security::Authentication::Identity::PLSA_CREATE_THREAD
    property get_client_info : Win32cr::Security::Authentication::Identity::PLSA_GET_CLIENT_INFO
    property register_notification : Win32cr::Security::Authentication::Identity::PLSA_REGISTER_NOTIFICATION
    property cancel_notification : Win32cr::Security::Authentication::Identity::PLSA_CANCEL_NOTIFICATION
    property map_buffer : Win32cr::Security::Authentication::Identity::PLSA_MAP_BUFFER
    property create_token : Win32cr::Security::Authentication::Identity::PLSA_CREATE_TOKEN
    property audit_logon : Win32cr::Security::Authentication::Identity::PLSA_AUDIT_LOGON
    property call_package : Win32cr::Security::Authentication::Identity::PLSA_CALL_PACKAGE
    property free_return_buffer : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP
    property get_call_info : Win32cr::Security::Authentication::Identity::PLSA_GET_CALL_INFO
    property call_package_ex : Win32cr::Security::Authentication::Identity::PLSA_CALL_PACKAGEEX
    property create_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_CREATE_SHARED_MEMORY
    property allocate_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_SHARED_MEMORY
    property free_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_FREE_SHARED_MEMORY
    property delete_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_DELETE_SHARED_MEMORY
    property open_sam_user : Win32cr::Security::Authentication::Identity::PLSA_OPEN_SAM_USER
    property get_user_credentials : Win32cr::Security::Authentication::Identity::PLSA_GET_USER_CREDENTIALS
    property get_user_auth_data : Win32cr::Security::Authentication::Identity::PLSA_GET_USER_AUTH_DATA
    property close_sam_user : Win32cr::Security::Authentication::Identity::PLSA_CLOSE_SAM_USER
    property convert_auth_data_to_token : Win32cr::Security::Authentication::Identity::PLSA_CONVERT_AUTH_DATA_TO_TOKEN
    property client_callback : Win32cr::Security::Authentication::Identity::PLSA_CLIENT_CALLBACK
    property update_credentials : Win32cr::Security::Authentication::Identity::PLSA_UPDATE_PRIMARY_CREDENTIALS
    property get_auth_data_for_user : Win32cr::Security::Authentication::Identity::PLSA_GET_AUTH_DATA_FOR_USER
    property crack_single_name : Win32cr::Security::Authentication::Identity::PLSA_CRACK_SINGLE_NAME
    property audit_account_logon : Win32cr::Security::Authentication::Identity::PLSA_AUDIT_ACCOUNT_LOGON
    property call_package_passthrough : Win32cr::Security::Authentication::Identity::PLSA_CALL_PACKAGE_PASSTHROUGH
    property credi_read : Win32cr::Security::Authentication::Identity::CredReadFn
    property credi_read_domain_credentials : Win32cr::Security::Authentication::Identity::CredReadDomainCredentialsFn
    property credi_free_credentials : Win32cr::Security::Authentication::Identity::CredFreeCredentialsFn
    property lsa_protect_memory : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY
    property lsa_unprotect_memory : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY
    property open_token_by_logon_id : Win32cr::Security::Authentication::Identity::PLSA_OPEN_TOKEN_BY_LOGON_ID
    property expand_auth_data_for_domain : Win32cr::Security::Authentication::Identity::PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN
    property allocate_private_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_PRIVATE_HEAP
    property free_private_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_PRIVATE_HEAP
    property create_token_ex : Win32cr::Security::Authentication::Identity::PLSA_CREATE_TOKEN_EX
    property credi_write : Win32cr::Security::Authentication::Identity::CredWriteFn
    property credi_unmarshaland_decode_string : Win32cr::Security::Authentication::Identity::CrediUnmarshalandDecodeStringFn
    property dummy_function6 : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY
    property get_extended_call_flags : Win32cr::Security::Authentication::Identity::PLSA_GET_EXTENDED_CALL_FLAGS
    property duplicate_token_handle : Win32cr::Security::Authentication::Identity::PLSA_DUPLICATE_HANDLE
    property get_service_account_password : Win32cr::Security::Authentication::Identity::PLSA_GET_SERVICE_ACCOUNT_PASSWORD
    property dummy_function7 : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY
    property audit_logon_ex : Win32cr::Security::Authentication::Identity::PLSA_AUDIT_LOGON_EX
    property check_protected_user_by_token : Win32cr::Security::Authentication::Identity::PLSA_CHECK_PROTECTED_USER_BY_TOKEN
    property query_client_request : Win32cr::Security::Authentication::Identity::PLSA_QUERY_CLIENT_REQUEST
    property get_app_mode_info : Win32cr::Security::Authentication::Identity::PLSA_GET_APP_MODE_INFO
    property set_app_mode_info : Win32cr::Security::Authentication::Identity::PLSA_SET_APP_MODE_INFO
    def initialize(@create_logon_session : Win32cr::Security::Authentication::Identity::PLSA_CREATE_LOGON_SESSION, @delete_logon_session : Win32cr::Security::Authentication::Identity::PLSA_DELETE_LOGON_SESSION, @add_credential : Win32cr::Security::Authentication::Identity::PLSA_ADD_CREDENTIAL, @get_credentials : Win32cr::Security::Authentication::Identity::PLSA_GET_CREDENTIALS, @delete_credential : Win32cr::Security::Authentication::Identity::PLSA_DELETE_CREDENTIAL, @allocate_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP, @free_lsa_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP, @allocate_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_CLIENT_BUFFER, @free_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_FREE_CLIENT_BUFFER, @copy_to_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_TO_CLIENT_BUFFER, @copy_from_client_buffer : Win32cr::Security::Authentication::Identity::PLSA_COPY_FROM_CLIENT_BUFFER, @impersonate_client : Win32cr::Security::Authentication::Identity::PLSA_IMPERSONATE_CLIENT, @unload_package : Win32cr::Security::Authentication::Identity::PLSA_UNLOAD_PACKAGE, @duplicate_handle : Win32cr::Security::Authentication::Identity::PLSA_DUPLICATE_HANDLE, @save_supplemental_credentials : Win32cr::Security::Authentication::Identity::PLSA_SAVE_SUPPLEMENTAL_CREDENTIALS, @create_thread : Win32cr::Security::Authentication::Identity::PLSA_CREATE_THREAD, @get_client_info : Win32cr::Security::Authentication::Identity::PLSA_GET_CLIENT_INFO, @register_notification : Win32cr::Security::Authentication::Identity::PLSA_REGISTER_NOTIFICATION, @cancel_notification : Win32cr::Security::Authentication::Identity::PLSA_CANCEL_NOTIFICATION, @map_buffer : Win32cr::Security::Authentication::Identity::PLSA_MAP_BUFFER, @create_token : Win32cr::Security::Authentication::Identity::PLSA_CREATE_TOKEN, @audit_logon : Win32cr::Security::Authentication::Identity::PLSA_AUDIT_LOGON, @call_package : Win32cr::Security::Authentication::Identity::PLSA_CALL_PACKAGE, @free_return_buffer : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP, @get_call_info : Win32cr::Security::Authentication::Identity::PLSA_GET_CALL_INFO, @call_package_ex : Win32cr::Security::Authentication::Identity::PLSA_CALL_PACKAGEEX, @create_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_CREATE_SHARED_MEMORY, @allocate_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_SHARED_MEMORY, @free_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_FREE_SHARED_MEMORY, @delete_shared_memory : Win32cr::Security::Authentication::Identity::PLSA_DELETE_SHARED_MEMORY, @open_sam_user : Win32cr::Security::Authentication::Identity::PLSA_OPEN_SAM_USER, @get_user_credentials : Win32cr::Security::Authentication::Identity::PLSA_GET_USER_CREDENTIALS, @get_user_auth_data : Win32cr::Security::Authentication::Identity::PLSA_GET_USER_AUTH_DATA, @close_sam_user : Win32cr::Security::Authentication::Identity::PLSA_CLOSE_SAM_USER, @convert_auth_data_to_token : Win32cr::Security::Authentication::Identity::PLSA_CONVERT_AUTH_DATA_TO_TOKEN, @client_callback : Win32cr::Security::Authentication::Identity::PLSA_CLIENT_CALLBACK, @update_credentials : Win32cr::Security::Authentication::Identity::PLSA_UPDATE_PRIMARY_CREDENTIALS, @get_auth_data_for_user : Win32cr::Security::Authentication::Identity::PLSA_GET_AUTH_DATA_FOR_USER, @crack_single_name : Win32cr::Security::Authentication::Identity::PLSA_CRACK_SINGLE_NAME, @audit_account_logon : Win32cr::Security::Authentication::Identity::PLSA_AUDIT_ACCOUNT_LOGON, @call_package_passthrough : Win32cr::Security::Authentication::Identity::PLSA_CALL_PACKAGE_PASSTHROUGH, @credi_read : Win32cr::Security::Authentication::Identity::CredReadFn, @credi_read_domain_credentials : Win32cr::Security::Authentication::Identity::CredReadDomainCredentialsFn, @credi_free_credentials : Win32cr::Security::Authentication::Identity::CredFreeCredentialsFn, @lsa_protect_memory : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY, @lsa_unprotect_memory : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY, @open_token_by_logon_id : Win32cr::Security::Authentication::Identity::PLSA_OPEN_TOKEN_BY_LOGON_ID, @expand_auth_data_for_domain : Win32cr::Security::Authentication::Identity::PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN, @allocate_private_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_PRIVATE_HEAP, @free_private_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_PRIVATE_HEAP, @create_token_ex : Win32cr::Security::Authentication::Identity::PLSA_CREATE_TOKEN_EX, @credi_write : Win32cr::Security::Authentication::Identity::CredWriteFn, @credi_unmarshaland_decode_string : Win32cr::Security::Authentication::Identity::CrediUnmarshalandDecodeStringFn, @dummy_function6 : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY, @get_extended_call_flags : Win32cr::Security::Authentication::Identity::PLSA_GET_EXTENDED_CALL_FLAGS, @duplicate_token_handle : Win32cr::Security::Authentication::Identity::PLSA_DUPLICATE_HANDLE, @get_service_account_password : Win32cr::Security::Authentication::Identity::PLSA_GET_SERVICE_ACCOUNT_PASSWORD, @dummy_function7 : Win32cr::Security::Authentication::Identity::PLSA_PROTECT_MEMORY, @audit_logon_ex : Win32cr::Security::Authentication::Identity::PLSA_AUDIT_LOGON_EX, @check_protected_user_by_token : Win32cr::Security::Authentication::Identity::PLSA_CHECK_PROTECTED_USER_BY_TOKEN, @query_client_request : Win32cr::Security::Authentication::Identity::PLSA_QUERY_CLIENT_REQUEST, @get_app_mode_info : Win32cr::Security::Authentication::Identity::PLSA_GET_APP_MODE_INFO, @set_app_mode_info : Win32cr::Security::Authentication::Identity::PLSA_SET_APP_MODE_INFO)
    end
  end

  @[Extern]
  struct SECPKG_DLL_FUNCTIONS
    property allocate_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP
    property free_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP
    property register_callback : Win32cr::Security::Authentication::Identity::PLSA_REGISTER_CALLBACK
    property locate_package_by_id : Win32cr::Security::Authentication::Identity::PLSA_LOCATE_PKG_BY_ID
    def initialize(@allocate_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP, @free_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP, @register_callback : Win32cr::Security::Authentication::Identity::PLSA_REGISTER_CALLBACK, @locate_package_by_id : Win32cr::Security::Authentication::Identity::PLSA_LOCATE_PKG_BY_ID)
    end
  end

  @[Extern]
  struct SECPKG_FUNCTION_TABLE
    property initialize_package : Win32cr::Security::Authentication::Identity::PLSA_AP_INITIALIZE_PACKAGE
    property logon_user_a : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER
    property call_package : Win32cr::Security::Authentication::Identity::PLSA_AP_CALL_PACKAGE
    property logon_terminated : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_TERMINATED
    property call_package_untrusted : Win32cr::Security::Authentication::Identity::PLSA_AP_CALL_PACKAGE
    property call_package_passthrough : Win32cr::Security::Authentication::Identity::PLSA_AP_CALL_PACKAGE_PASSTHROUGH
    property logon_user_ex_a : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER_EX
    property logon_user_ex2 : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER_EX2
    property initialize__ : Win32cr::Security::Authentication::Identity::SpInitializeFn
    property shutdown : Win32cr::Security::Authentication::Identity::SpShutdownFn
    property get_info : Win32cr::Security::Authentication::Identity::SpGetInfoFn
    property accept_credentials : Win32cr::Security::Authentication::Identity::SpAcceptCredentialsFn
    property acquire_credentials_handle_a : Win32cr::Security::Authentication::Identity::SpAcquireCredentialsHandleFn
    property query_credentials_attributes_a : Win32cr::Security::Authentication::Identity::SpQueryCredentialsAttributesFn
    property free_credentials_handle : Win32cr::Security::Authentication::Identity::SpFreeCredentialsHandleFn
    property save_credentials : Win32cr::Security::Authentication::Identity::SpSaveCredentialsFn
    property get_credentials : Win32cr::Security::Authentication::Identity::SpGetCredentialsFn
    property delete_credentials : Win32cr::Security::Authentication::Identity::SpDeleteCredentialsFn
    property init_lsa_mode_context : Win32cr::Security::Authentication::Identity::SpInitLsaModeContextFn
    property accept_lsa_mode_context : Win32cr::Security::Authentication::Identity::SpAcceptLsaModeContextFn
    property delete_context : Win32cr::Security::Authentication::Identity::SpDeleteContextFn
    property apply_control_token : Win32cr::Security::Authentication::Identity::SpApplyControlTokenFn
    property get_user_info : Win32cr::Security::Authentication::Identity::SpGetUserInfoFn
    property get_extended_information : Win32cr::Security::Authentication::Identity::SpGetExtendedInformationFn
    property query_context_attributes_a : Win32cr::Security::Authentication::Identity::SpQueryContextAttributesFn
    property add_credentials_a : Win32cr::Security::Authentication::Identity::SpAddCredentialsFn
    property set_extended_information : Win32cr::Security::Authentication::Identity::SpSetExtendedInformationFn
    property set_context_attributes_a : Win32cr::Security::Authentication::Identity::SpSetContextAttributesFn
    property set_credentials_attributes_a : Win32cr::Security::Authentication::Identity::SpSetCredentialsAttributesFn
    property change_account_password_a : Win32cr::Security::Authentication::Identity::SpChangeAccountPasswordFn
    property query_meta_data : Win32cr::Security::Authentication::Identity::SpQueryMetaDataFn
    property exchange_meta_data : Win32cr::Security::Authentication::Identity::SpExchangeMetaDataFn
    property get_cred_ui_context : Win32cr::Security::Authentication::Identity::SpGetCredUIContextFn
    property update_credentials : Win32cr::Security::Authentication::Identity::SpUpdateCredentialsFn
    property validate_target_info : Win32cr::Security::Authentication::Identity::SpValidateTargetInfoFn
    property post_logon_user : Win32cr::Security::Authentication::Identity::LSA_AP_POST_LOGON_USER
    property get_remote_cred_guard_logon_buffer : Win32cr::Security::Authentication::Identity::SpGetRemoteCredGuardLogonBufferFn
    property get_remote_cred_guard_supplemental_creds : Win32cr::Security::Authentication::Identity::SpGetRemoteCredGuardSupplementalCredsFn
    property get_tbal_supplemental_creds : Win32cr::Security::Authentication::Identity::SpGetTbalSupplementalCredsFn
    property logon_user_ex3 : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER_EX3
    property pre_logon_user_surrogate : Win32cr::Security::Authentication::Identity::PLSA_AP_PRE_LOGON_USER_SURROGATE
    property post_logon_user_surrogate : Win32cr::Security::Authentication::Identity::PLSA_AP_POST_LOGON_USER_SURROGATE
    def initialize(@initialize_package : Win32cr::Security::Authentication::Identity::PLSA_AP_INITIALIZE_PACKAGE, @logon_user_a : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER, @call_package : Win32cr::Security::Authentication::Identity::PLSA_AP_CALL_PACKAGE, @logon_terminated : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_TERMINATED, @call_package_untrusted : Win32cr::Security::Authentication::Identity::PLSA_AP_CALL_PACKAGE, @call_package_passthrough : Win32cr::Security::Authentication::Identity::PLSA_AP_CALL_PACKAGE_PASSTHROUGH, @logon_user_ex_a : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER_EX, @logon_user_ex2 : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER_EX2, @initialize__ : Win32cr::Security::Authentication::Identity::SpInitializeFn, @shutdown : Win32cr::Security::Authentication::Identity::SpShutdownFn, @get_info : Win32cr::Security::Authentication::Identity::SpGetInfoFn, @accept_credentials : Win32cr::Security::Authentication::Identity::SpAcceptCredentialsFn, @acquire_credentials_handle_a : Win32cr::Security::Authentication::Identity::SpAcquireCredentialsHandleFn, @query_credentials_attributes_a : Win32cr::Security::Authentication::Identity::SpQueryCredentialsAttributesFn, @free_credentials_handle : Win32cr::Security::Authentication::Identity::SpFreeCredentialsHandleFn, @save_credentials : Win32cr::Security::Authentication::Identity::SpSaveCredentialsFn, @get_credentials : Win32cr::Security::Authentication::Identity::SpGetCredentialsFn, @delete_credentials : Win32cr::Security::Authentication::Identity::SpDeleteCredentialsFn, @init_lsa_mode_context : Win32cr::Security::Authentication::Identity::SpInitLsaModeContextFn, @accept_lsa_mode_context : Win32cr::Security::Authentication::Identity::SpAcceptLsaModeContextFn, @delete_context : Win32cr::Security::Authentication::Identity::SpDeleteContextFn, @apply_control_token : Win32cr::Security::Authentication::Identity::SpApplyControlTokenFn, @get_user_info : Win32cr::Security::Authentication::Identity::SpGetUserInfoFn, @get_extended_information : Win32cr::Security::Authentication::Identity::SpGetExtendedInformationFn, @query_context_attributes_a : Win32cr::Security::Authentication::Identity::SpQueryContextAttributesFn, @add_credentials_a : Win32cr::Security::Authentication::Identity::SpAddCredentialsFn, @set_extended_information : Win32cr::Security::Authentication::Identity::SpSetExtendedInformationFn, @set_context_attributes_a : Win32cr::Security::Authentication::Identity::SpSetContextAttributesFn, @set_credentials_attributes_a : Win32cr::Security::Authentication::Identity::SpSetCredentialsAttributesFn, @change_account_password_a : Win32cr::Security::Authentication::Identity::SpChangeAccountPasswordFn, @query_meta_data : Win32cr::Security::Authentication::Identity::SpQueryMetaDataFn, @exchange_meta_data : Win32cr::Security::Authentication::Identity::SpExchangeMetaDataFn, @get_cred_ui_context : Win32cr::Security::Authentication::Identity::SpGetCredUIContextFn, @update_credentials : Win32cr::Security::Authentication::Identity::SpUpdateCredentialsFn, @validate_target_info : Win32cr::Security::Authentication::Identity::SpValidateTargetInfoFn, @post_logon_user : Win32cr::Security::Authentication::Identity::LSA_AP_POST_LOGON_USER, @get_remote_cred_guard_logon_buffer : Win32cr::Security::Authentication::Identity::SpGetRemoteCredGuardLogonBufferFn, @get_remote_cred_guard_supplemental_creds : Win32cr::Security::Authentication::Identity::SpGetRemoteCredGuardSupplementalCredsFn, @get_tbal_supplemental_creds : Win32cr::Security::Authentication::Identity::SpGetTbalSupplementalCredsFn, @logon_user_ex3 : Win32cr::Security::Authentication::Identity::PLSA_AP_LOGON_USER_EX3, @pre_logon_user_surrogate : Win32cr::Security::Authentication::Identity::PLSA_AP_PRE_LOGON_USER_SURROGATE, @post_logon_user_surrogate : Win32cr::Security::Authentication::Identity::PLSA_AP_POST_LOGON_USER_SURROGATE)
    end
  end

  @[Extern]
  struct SECPKG_USER_FUNCTION_TABLE
    property instance_init : Win32cr::Security::Authentication::Identity::SpInstanceInitFn
    property init_user_mode_context : Win32cr::Security::Authentication::Identity::SpInitUserModeContextFn
    property make_signature : Win32cr::Security::Authentication::Identity::SpMakeSignatureFn
    property verify_signature : Win32cr::Security::Authentication::Identity::SpVerifySignatureFn
    property seal_message : Win32cr::Security::Authentication::Identity::SpSealMessageFn
    property unseal_message : Win32cr::Security::Authentication::Identity::SpUnsealMessageFn
    property get_context_token : Win32cr::Security::Authentication::Identity::SpGetContextTokenFn
    property query_context_attributes_a : Win32cr::Security::Authentication::Identity::SpQueryContextAttributesFn
    property complete_auth_token : Win32cr::Security::Authentication::Identity::SpCompleteAuthTokenFn
    property delete_user_mode_context : Win32cr::Security::Authentication::Identity::SpDeleteContextFn
    property format_credentials : Win32cr::Security::Authentication::Identity::SpFormatCredentialsFn
    property marshall_supplemental_creds : Win32cr::Security::Authentication::Identity::SpMarshallSupplementalCredsFn
    property export_context : Win32cr::Security::Authentication::Identity::SpExportSecurityContextFn
    property import_context : Win32cr::Security::Authentication::Identity::SpImportSecurityContextFn
    property marshal_attribute_data : Win32cr::Security::Authentication::Identity::SpMarshalAttributeDataFn
    def initialize(@instance_init : Win32cr::Security::Authentication::Identity::SpInstanceInitFn, @init_user_mode_context : Win32cr::Security::Authentication::Identity::SpInitUserModeContextFn, @make_signature : Win32cr::Security::Authentication::Identity::SpMakeSignatureFn, @verify_signature : Win32cr::Security::Authentication::Identity::SpVerifySignatureFn, @seal_message : Win32cr::Security::Authentication::Identity::SpSealMessageFn, @unseal_message : Win32cr::Security::Authentication::Identity::SpUnsealMessageFn, @get_context_token : Win32cr::Security::Authentication::Identity::SpGetContextTokenFn, @query_context_attributes_a : Win32cr::Security::Authentication::Identity::SpQueryContextAttributesFn, @complete_auth_token : Win32cr::Security::Authentication::Identity::SpCompleteAuthTokenFn, @delete_user_mode_context : Win32cr::Security::Authentication::Identity::SpDeleteContextFn, @format_credentials : Win32cr::Security::Authentication::Identity::SpFormatCredentialsFn, @marshall_supplemental_creds : Win32cr::Security::Authentication::Identity::SpMarshallSupplementalCredsFn, @export_context : Win32cr::Security::Authentication::Identity::SpExportSecurityContextFn, @import_context : Win32cr::Security::Authentication::Identity::SpImportSecurityContextFn, @marshal_attribute_data : Win32cr::Security::Authentication::Identity::SpMarshalAttributeDataFn)
    end
  end

  @[Extern]
  struct KSEC_LIST_ENTRY
    property list : Win32cr::System::Kernel::LIST_ENTRY
    property ref_count : Int32
    property signature : UInt32
    property owning_list : Void*
    property reserved : Void*
    def initialize(@list : Win32cr::System::Kernel::LIST_ENTRY, @ref_count : Int32, @signature : UInt32, @owning_list : Void*, @reserved : Void*)
    end
  end

  @[Extern]
  struct SECPKG_KERNEL_FUNCTIONS
    property allocate_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP
    property free_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP
    property create_context_list : Win32cr::Security::Authentication::Identity::PKSEC_CREATE_CONTEXT_LIST
    property insert_list_entry : Win32cr::Security::Authentication::Identity::PKSEC_INSERT_LIST_ENTRY
    property reference_list_entry : Win32cr::Security::Authentication::Identity::PKSEC_REFERENCE_LIST_ENTRY
    property dereference_list_entry : Win32cr::Security::Authentication::Identity::PKSEC_DEREFERENCE_LIST_ENTRY
    property serialize_winnt_auth_data : Win32cr::Security::Authentication::Identity::PKSEC_SERIALIZE_WINNT_AUTH_DATA
    property serialize_schannel_auth_data : Win32cr::Security::Authentication::Identity::PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA
    property locate_package_by_id : Win32cr::Security::Authentication::Identity::PKSEC_LOCATE_PKG_BY_ID
    def initialize(@allocate_heap : Win32cr::Security::Authentication::Identity::PLSA_ALLOCATE_LSA_HEAP, @free_heap : Win32cr::Security::Authentication::Identity::PLSA_FREE_LSA_HEAP, @create_context_list : Win32cr::Security::Authentication::Identity::PKSEC_CREATE_CONTEXT_LIST, @insert_list_entry : Win32cr::Security::Authentication::Identity::PKSEC_INSERT_LIST_ENTRY, @reference_list_entry : Win32cr::Security::Authentication::Identity::PKSEC_REFERENCE_LIST_ENTRY, @dereference_list_entry : Win32cr::Security::Authentication::Identity::PKSEC_DEREFERENCE_LIST_ENTRY, @serialize_winnt_auth_data : Win32cr::Security::Authentication::Identity::PKSEC_SERIALIZE_WINNT_AUTH_DATA, @serialize_schannel_auth_data : Win32cr::Security::Authentication::Identity::PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA, @locate_package_by_id : Win32cr::Security::Authentication::Identity::PKSEC_LOCATE_PKG_BY_ID)
    end
  end

  @[Extern]
  struct SECPKG_KERNEL_FUNCTION_TABLE
    property initialize__ : Win32cr::Security::Authentication::Identity::KspInitPackageFn
    property delete_context : Win32cr::Security::Authentication::Identity::KspDeleteContextFn
    property init_context : Win32cr::Security::Authentication::Identity::KspInitContextFn
    property map_handle : Win32cr::Security::Authentication::Identity::KspMapHandleFn
    property sign : Win32cr::Security::Authentication::Identity::KspMakeSignatureFn
    property verify : Win32cr::Security::Authentication::Identity::KspVerifySignatureFn
    property seal : Win32cr::Security::Authentication::Identity::KspSealMessageFn
    property unseal : Win32cr::Security::Authentication::Identity::KspUnsealMessageFn
    property get_token : Win32cr::Security::Authentication::Identity::KspGetTokenFn
    property query_attributes : Win32cr::Security::Authentication::Identity::KspQueryAttributesFn
    property complete_token : Win32cr::Security::Authentication::Identity::KspCompleteTokenFn
    property export_context : Win32cr::Security::Authentication::Identity::SpExportSecurityContextFn
    property import_context : Win32cr::Security::Authentication::Identity::SpImportSecurityContextFn
    property set_package_paging_mode : Win32cr::Security::Authentication::Identity::KspSetPagingModeFn
    property serialize_auth_data : Win32cr::Security::Authentication::Identity::KspSerializeAuthDataFn
    def initialize(@initialize__ : Win32cr::Security::Authentication::Identity::KspInitPackageFn, @delete_context : Win32cr::Security::Authentication::Identity::KspDeleteContextFn, @init_context : Win32cr::Security::Authentication::Identity::KspInitContextFn, @map_handle : Win32cr::Security::Authentication::Identity::KspMapHandleFn, @sign : Win32cr::Security::Authentication::Identity::KspMakeSignatureFn, @verify : Win32cr::Security::Authentication::Identity::KspVerifySignatureFn, @seal : Win32cr::Security::Authentication::Identity::KspSealMessageFn, @unseal : Win32cr::Security::Authentication::Identity::KspUnsealMessageFn, @get_token : Win32cr::Security::Authentication::Identity::KspGetTokenFn, @query_attributes : Win32cr::Security::Authentication::Identity::KspQueryAttributesFn, @complete_token : Win32cr::Security::Authentication::Identity::KspCompleteTokenFn, @export_context : Win32cr::Security::Authentication::Identity::SpExportSecurityContextFn, @import_context : Win32cr::Security::Authentication::Identity::SpImportSecurityContextFn, @set_package_paging_mode : Win32cr::Security::Authentication::Identity::KspSetPagingModeFn, @serialize_auth_data : Win32cr::Security::Authentication::Identity::KspSerializeAuthDataFn)
    end
  end

  @[Extern]
  struct SecPkgCred_SupportedAlgs
    property cSupportedAlgs : UInt32
    property palgSupportedAlgs : UInt32*
    def initialize(@cSupportedAlgs : UInt32, @palgSupportedAlgs : UInt32*)
    end
  end

  @[Extern]
  struct SecPkgCred_CipherStrengths
    property dwMinimumCipherStrength : UInt32
    property dwMaximumCipherStrength : UInt32
    def initialize(@dwMinimumCipherStrength : UInt32, @dwMaximumCipherStrength : UInt32)
    end
  end

  @[Extern]
  struct SecPkgCred_SupportedProtocols
    property grbitProtocol : UInt32
    def initialize(@grbitProtocol : UInt32)
    end
  end

  @[Extern]
  struct SecPkgCred_ClientCertPolicy
    property dwFlags : UInt32
    property guidPolicyId : LibC::GUID
    property dwCertFlags : UInt32
    property dwUrlRetrievalTimeout : UInt32
    property fCheckRevocationFreshnessTime : Win32cr::Foundation::BOOL
    property dwRevocationFreshnessTime : UInt32
    property fOmitUsageCheck : Win32cr::Foundation::BOOL
    property pwszSslCtlStoreName : Win32cr::Foundation::PWSTR
    property pwszSslCtlIdentifier : Win32cr::Foundation::PWSTR
    def initialize(@dwFlags : UInt32, @guidPolicyId : LibC::GUID, @dwCertFlags : UInt32, @dwUrlRetrievalTimeout : UInt32, @fCheckRevocationFreshnessTime : Win32cr::Foundation::BOOL, @dwRevocationFreshnessTime : UInt32, @fOmitUsageCheck : Win32cr::Foundation::BOOL, @pwszSslCtlStoreName : Win32cr::Foundation::PWSTR, @pwszSslCtlIdentifier : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SecPkgCred_SessionTicketKey
    property ticket_info_version : UInt32
    property key_id : UInt8[16]
    property keying_material : UInt8[64]
    property keying_material_size : UInt8
    def initialize(@ticket_info_version : UInt32, @key_id : UInt8[16], @keying_material : UInt8[64], @keying_material_size : UInt8)
    end
  end

  @[Extern]
  struct SecPkgCred_SessionTicketKeys
    property cSessionTicketKeys : UInt32
    property pSessionTicketKeys : Win32cr::Security::Authentication::Identity::SecPkgCred_SessionTicketKey*
    def initialize(@cSessionTicketKeys : UInt32, @pSessionTicketKeys : Win32cr::Security::Authentication::Identity::SecPkgCred_SessionTicketKey*)
    end
  end

  @[Extern]
  struct SecPkgContext_RemoteCredentialInfo
    property cbCertificateChain : UInt32
    property pbCertificateChain : UInt8*
    property cCertificates : UInt32
    property fFlags : UInt32
    property dwBits : UInt32
    def initialize(@cbCertificateChain : UInt32, @pbCertificateChain : UInt8*, @cCertificates : UInt32, @fFlags : UInt32, @dwBits : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_LocalCredentialInfo
    property cbCertificateChain : UInt32
    property pbCertificateChain : UInt8*
    property cCertificates : UInt32
    property fFlags : UInt32
    property dwBits : UInt32
    def initialize(@cbCertificateChain : UInt32, @pbCertificateChain : UInt8*, @cCertificates : UInt32, @fFlags : UInt32, @dwBits : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_ClientCertPolicyResult
    property dwPolicyResult : Win32cr::Foundation::HRESULT
    property guidPolicyId : LibC::GUID
    def initialize(@dwPolicyResult : Win32cr::Foundation::HRESULT, @guidPolicyId : LibC::GUID)
    end
  end

  @[Extern]
  struct SecPkgContext_IssuerListInfoEx
    property aIssuers : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB*
    property cIssuers : UInt32
    def initialize(@aIssuers : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB*, @cIssuers : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_ConnectionInfo
    property dwProtocol : UInt32
    property aiCipher : UInt32
    property dwCipherStrength : UInt32
    property aiHash : UInt32
    property dwHashStrength : UInt32
    property aiExch : UInt32
    property dwExchStrength : UInt32
    def initialize(@dwProtocol : UInt32, @aiCipher : UInt32, @dwCipherStrength : UInt32, @aiHash : UInt32, @dwHashStrength : UInt32, @aiExch : UInt32, @dwExchStrength : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_ConnectionInfoEx
    property dwVersion : UInt32
    property dwProtocol : UInt32
    property szCipher : UInt16[64]
    property dwCipherStrength : UInt32
    property szHash : UInt16[64]
    property dwHashStrength : UInt32
    property szExchange : UInt16[64]
    property dwExchStrength : UInt32
    def initialize(@dwVersion : UInt32, @dwProtocol : UInt32, @szCipher : UInt16[64], @dwCipherStrength : UInt32, @szHash : UInt16[64], @dwHashStrength : UInt32, @szExchange : UInt16[64], @dwExchStrength : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_CipherInfo
    property dwVersion : UInt32
    property dwProtocol : UInt32
    property dwCipherSuite : UInt32
    property dwBaseCipherSuite : UInt32
    property szCipherSuite : UInt16[64]
    property szCipher : UInt16[64]
    property dwCipherLen : UInt32
    property dwCipherBlockLen : UInt32
    property szHash : UInt16[64]
    property dwHashLen : UInt32
    property szExchange : UInt16[64]
    property dwMinExchangeLen : UInt32
    property dwMaxExchangeLen : UInt32
    property szCertificate : UInt16[64]
    property dwKeyType : UInt32
    def initialize(@dwVersion : UInt32, @dwProtocol : UInt32, @dwCipherSuite : UInt32, @dwBaseCipherSuite : UInt32, @szCipherSuite : UInt16[64], @szCipher : UInt16[64], @dwCipherLen : UInt32, @dwCipherBlockLen : UInt32, @szHash : UInt16[64], @dwHashLen : UInt32, @szExchange : UInt16[64], @dwMinExchangeLen : UInt32, @dwMaxExchangeLen : UInt32, @szCertificate : UInt16[64], @dwKeyType : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_EapKeyBlock
    property rgbKeys : UInt8[128]
    property rgbIVs : UInt8[64]
    def initialize(@rgbKeys : UInt8[128], @rgbIVs : UInt8[64])
    end
  end

  @[Extern]
  struct SecPkgContext_MappedCredAttr
    property dwAttribute : UInt32
    property pvBuffer : Void*
    def initialize(@dwAttribute : UInt32, @pvBuffer : Void*)
    end
  end

  @[Extern]
  struct SecPkgContext_SessionInfo
    property dwFlags : UInt32
    property cbSessionId : UInt32
    property rgbSessionId : UInt8[32]
    def initialize(@dwFlags : UInt32, @cbSessionId : UInt32, @rgbSessionId : UInt8[32])
    end
  end

  @[Extern]
  struct SecPkgContext_SessionAppData
    property dwFlags : UInt32
    property cbAppData : UInt32
    property pbAppData : UInt8*
    def initialize(@dwFlags : UInt32, @cbAppData : UInt32, @pbAppData : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_EapPrfInfo
    property dwVersion : UInt32
    property cbPrfData : UInt32
    property pbPrfData : UInt8*
    def initialize(@dwVersion : UInt32, @cbPrfData : UInt32, @pbPrfData : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_SupportedSignatures
    property cSignatureAndHashAlgorithms : UInt16
    property pSignatureAndHashAlgorithms : UInt16*
    def initialize(@cSignatureAndHashAlgorithms : UInt16, @pSignatureAndHashAlgorithms : UInt16*)
    end
  end

  @[Extern]
  struct SecPkgContext_Certificates
    property cCertificates : UInt32
    property cbCertificateChain : UInt32
    property pbCertificateChain : UInt8*
    def initialize(@cCertificates : UInt32, @cbCertificateChain : UInt32, @pbCertificateChain : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_CertInfo
    property dwVersion : UInt32
    property cbSubjectName : UInt32
    property pwszSubjectName : Win32cr::Foundation::PWSTR
    property cbIssuerName : UInt32
    property pwszIssuerName : Win32cr::Foundation::PWSTR
    property dwKeySize : UInt32
    def initialize(@dwVersion : UInt32, @cbSubjectName : UInt32, @pwszSubjectName : Win32cr::Foundation::PWSTR, @cbIssuerName : UInt32, @pwszIssuerName : Win32cr::Foundation::PWSTR, @dwKeySize : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_UiInfo
    property hParentWindow : Win32cr::Foundation::HWND
    def initialize(@hParentWindow : Win32cr::Foundation::HWND)
    end
  end

  @[Extern]
  struct SecPkgContext_EarlyStart
    property dwEarlyStartFlags : UInt32
    def initialize(@dwEarlyStartFlags : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_KeyingMaterialInfo
    property cbLabel : UInt16
    property pszLabel : Win32cr::Foundation::PSTR
    property cbContextValue : UInt16
    property pbContextValue : UInt8*
    property cbKeyingMaterial : UInt32
    def initialize(@cbLabel : UInt16, @pszLabel : Win32cr::Foundation::PSTR, @cbContextValue : UInt16, @pbContextValue : UInt8*, @cbKeyingMaterial : UInt32)
    end
  end

  @[Extern]
  struct SecPkgContext_KeyingMaterial
    property cbKeyingMaterial : UInt32
    property pbKeyingMaterial : UInt8*
    def initialize(@cbKeyingMaterial : UInt32, @pbKeyingMaterial : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_KeyingMaterial_Inproc
    property cbLabel : UInt16
    property pszLabel : Win32cr::Foundation::PSTR
    property cbContextValue : UInt16
    property pbContextValue : UInt8*
    property cbKeyingMaterial : UInt32
    property pbKeyingMaterial : UInt8*
    def initialize(@cbLabel : UInt16, @pszLabel : Win32cr::Foundation::PSTR, @cbContextValue : UInt16, @pbContextValue : UInt8*, @cbKeyingMaterial : UInt32, @pbKeyingMaterial : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_SrtpParameters
    property protection_profile : UInt16
    property master_key_identifier_size : UInt8
    property master_key_identifier : UInt8*
    def initialize(@protection_profile : UInt16, @master_key_identifier_size : UInt8, @master_key_identifier : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_TokenBinding
    property major_version : UInt8
    property minor_version : UInt8
    property key_parameters_size : UInt16
    property key_parameters : UInt8*
    def initialize(@major_version : UInt8, @minor_version : UInt8, @key_parameters_size : UInt16, @key_parameters : UInt8*)
    end
  end

  @[Extern]
  struct SecPkgContext_CertificateValidationResult
    property dwChainErrorStatus : UInt32
    property hrVerifyChainStatus : Win32cr::Foundation::HRESULT
    def initialize(@dwChainErrorStatus : UInt32, @hrVerifyChainStatus : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct HMAPPER_
    def initialize()
    end
  end

  @[Extern]
  struct SCHANNEL_CRED
    property dwVersion : UInt32
    property cCreds : UInt32
    property paCred : Win32cr::Security::Cryptography::CERT_CONTEXT**
    property hRootStore : Win32cr::Security::Cryptography::HCERTSTORE
    property cMappers : UInt32
    property aphMappers : Win32cr::Security::Authentication::Identity::HMAPPER_**
    property cSupportedAlgs : UInt32
    property palgSupportedAlgs : UInt32*
    property grbitEnabledProtocols : UInt32
    property dwMinimumCipherStrength : UInt32
    property dwMaximumCipherStrength : UInt32
    property dwSessionLifespan : UInt32
    property dwFlags : Win32cr::Security::Authentication::Identity::SCHANNEL_CRED_FLAGS
    property dwCredFormat : UInt32
    def initialize(@dwVersion : UInt32, @cCreds : UInt32, @paCred : Win32cr::Security::Cryptography::CERT_CONTEXT**, @hRootStore : Win32cr::Security::Cryptography::HCERTSTORE, @cMappers : UInt32, @aphMappers : Win32cr::Security::Authentication::Identity::HMAPPER_**, @cSupportedAlgs : UInt32, @palgSupportedAlgs : UInt32*, @grbitEnabledProtocols : UInt32, @dwMinimumCipherStrength : UInt32, @dwMaximumCipherStrength : UInt32, @dwSessionLifespan : UInt32, @dwFlags : Win32cr::Security::Authentication::Identity::SCHANNEL_CRED_FLAGS, @dwCredFormat : UInt32)
    end
  end

  @[Extern]
  struct SEND_GENERIC_TLS_EXTENSION
    property extension_type : UInt16
    property handshake_type : UInt16
    property flags : UInt32
    property buffer_size : UInt16
    property buffer : UInt8*
    def initialize(@extension_type : UInt16, @handshake_type : UInt16, @flags : UInt32, @buffer_size : UInt16, @buffer : UInt8*)
    end
  end

  @[Extern]
  struct TLS_EXTENSION_SUBSCRIPTION
    property extension_type : UInt16
    property handshake_type : UInt16
    def initialize(@extension_type : UInt16, @handshake_type : UInt16)
    end
  end

  @[Extern]
  struct SUBSCRIBE_GENERIC_TLS_EXTENSION
    property flags : UInt32
    property subscriptions_count : UInt32
    property subscriptions : Win32cr::Security::Authentication::Identity::TLS_EXTENSION_SUBSCRIPTION*
    def initialize(@flags : UInt32, @subscriptions_count : UInt32, @subscriptions : Win32cr::Security::Authentication::Identity::TLS_EXTENSION_SUBSCRIPTION*)
    end
  end

  @[Extern]
  struct SCHANNEL_CERT_HASH
    property dwLength : UInt32
    property dwFlags : UInt32
    property hProv : LibC::UIntPtrT
    property sha_hash : UInt8[20]
    def initialize(@dwLength : UInt32, @dwFlags : UInt32, @hProv : LibC::UIntPtrT, @sha_hash : UInt8[20])
    end
  end

  @[Extern]
  struct SCHANNEL_CERT_HASH_STORE
    property dwLength : UInt32
    property dwFlags : UInt32
    property hProv : LibC::UIntPtrT
    property sha_hash : UInt8[20]
    property pwszStoreName : UInt16[128]
    def initialize(@dwLength : UInt32, @dwFlags : UInt32, @hProv : LibC::UIntPtrT, @sha_hash : UInt8[20], @pwszStoreName : UInt16[128])
    end
  end

  @[Extern]
  struct SCHANNEL_ALERT_TOKEN
    property dwTokenType : UInt32
    property dwAlertType : Win32cr::Security::Authentication::Identity::SCHANNEL_ALERT_TOKEN_ALERT_TYPE
    property dwAlertNumber : UInt32
    def initialize(@dwTokenType : UInt32, @dwAlertType : Win32cr::Security::Authentication::Identity::SCHANNEL_ALERT_TOKEN_ALERT_TYPE, @dwAlertNumber : UInt32)
    end
  end

  @[Extern]
  struct SCHANNEL_SESSION_TOKEN
    property dwTokenType : UInt32
    property dwFlags : Win32cr::Security::Authentication::Identity::SCHANNEL_SESSION_TOKEN_FLAGS
    def initialize(@dwTokenType : UInt32, @dwFlags : Win32cr::Security::Authentication::Identity::SCHANNEL_SESSION_TOKEN_FLAGS)
    end
  end

  @[Extern]
  struct SCHANNEL_CLIENT_SIGNATURE
    property cbLength : UInt32
    property aiHash : UInt32
    property cbHash : UInt32
    property hash_value : UInt8[36]
    property cert_thumbprint : UInt8[20]
    def initialize(@cbLength : UInt32, @aiHash : UInt32, @cbHash : UInt32, @hash_value : UInt8[36], @cert_thumbprint : UInt8[20])
    end
  end

  @[Extern]
  struct SSL_CREDENTIAL_CERTIFICATE
    property cbPrivateKey : UInt32
    property pPrivateKey : UInt8*
    property cbCertificate : UInt32
    property pCertificate : UInt8*
    property pszPassword : Win32cr::Foundation::PSTR
    def initialize(@cbPrivateKey : UInt32, @pPrivateKey : UInt8*, @cbCertificate : UInt32, @pCertificate : UInt8*, @pszPassword : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SCH_CRED
    property dwVersion : UInt32
    property cCreds : UInt32
    property paSecret : Void**
    property paPublic : Void**
    property cMappers : UInt32
    property aphMappers : Win32cr::Security::Authentication::Identity::HMAPPER_**
    def initialize(@dwVersion : UInt32, @cCreds : UInt32, @paSecret : Void**, @paPublic : Void**, @cMappers : UInt32, @aphMappers : Win32cr::Security::Authentication::Identity::HMAPPER_**)
    end
  end

  @[Extern]
  struct SCH_CRED_SECRET_CAPI
    property dwType : UInt32
    property hProv : LibC::UIntPtrT
    def initialize(@dwType : UInt32, @hProv : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct SCH_CRED_SECRET_PRIVKEY
    property dwType : UInt32
    property pPrivateKey : UInt8*
    property cbPrivateKey : UInt32
    property pszPassword : Win32cr::Foundation::PSTR
    def initialize(@dwType : UInt32, @pPrivateKey : UInt8*, @cbPrivateKey : UInt32, @pszPassword : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct SCH_CRED_PUBLIC_CERTCHAIN
    property dwType : UInt32
    property cbCertChain : UInt32
    property pCertChain : UInt8*
    def initialize(@dwType : UInt32, @cbCertChain : UInt32, @pCertChain : UInt8*)
    end
  end

  @[Extern]
  struct PctPublicKey
    property type__ : UInt32
    property cbKey : UInt32
    property pKey : UInt8*
    def initialize(@type__ : UInt32, @cbKey : UInt32, @pKey : UInt8*)
    end
  end

  @[Extern]
  struct X509Certificate
    property version : UInt32
    property serial_number : UInt32[4]
    property signature_algorithm : UInt32
    property valid_from : Win32cr::Foundation::FILETIME
    property valid_until : Win32cr::Foundation::FILETIME
    property pszIssuer : Win32cr::Foundation::PSTR
    property pszSubject : Win32cr::Foundation::PSTR
    property pPublicKey : Win32cr::Security::Authentication::Identity::PctPublicKey*
    def initialize(@version : UInt32, @serial_number : UInt32[4], @signature_algorithm : UInt32, @valid_from : Win32cr::Foundation::FILETIME, @valid_until : Win32cr::Foundation::FILETIME, @pszIssuer : Win32cr::Foundation::PSTR, @pszSubject : Win32cr::Foundation::PSTR, @pPublicKey : Win32cr::Security::Authentication::Identity::PctPublicKey*)
    end
  end

  @[Extern]
  struct SCH_EXTENSION_DATA
    property extension_type : UInt16
    property pExtData : UInt8*
    property cbExtData : UInt32
    def initialize(@extension_type : UInt16, @pExtData : UInt8*, @cbExtData : UInt32)
    end
  end

  @[Extern]
  struct LOGON_HOURS
    property units_per_week : UInt16
    property logon_hours : UInt8*
    def initialize(@units_per_week : UInt16, @logon_hours : UInt8*)
    end
  end

  @[Extern]
  struct SR_SECURITY_DESCRIPTOR
    property length : UInt32
    property security_descriptor : UInt8*
    def initialize(@length : UInt32, @security_descriptor : UInt8*)
    end
  end

  @[Extern]
  struct USER_ALL_INFORMATION
    property last_logon : Win32cr::Foundation::LARGE_INTEGER
    property last_logoff : Win32cr::Foundation::LARGE_INTEGER
    property password_last_set : Win32cr::Foundation::LARGE_INTEGER
    property account_expires : Win32cr::Foundation::LARGE_INTEGER
    property password_can_change : Win32cr::Foundation::LARGE_INTEGER
    property password_must_change : Win32cr::Foundation::LARGE_INTEGER
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property full_name : Win32cr::Foundation::UNICODE_STRING
    property home_directory : Win32cr::Foundation::UNICODE_STRING
    property home_directory_drive : Win32cr::Foundation::UNICODE_STRING
    property script_path : Win32cr::Foundation::UNICODE_STRING
    property profile_path : Win32cr::Foundation::UNICODE_STRING
    property admin_comment : Win32cr::Foundation::UNICODE_STRING
    property work_stations : Win32cr::Foundation::UNICODE_STRING
    property user_comment : Win32cr::Foundation::UNICODE_STRING
    property parameters : Win32cr::Foundation::UNICODE_STRING
    property lm_password : Win32cr::Foundation::UNICODE_STRING
    property nt_password : Win32cr::Foundation::UNICODE_STRING
    property private_data : Win32cr::Foundation::UNICODE_STRING
    property security_descriptor : Win32cr::Security::Authentication::Identity::SR_SECURITY_DESCRIPTOR
    property user_id : UInt32
    property primary_group_id : UInt32
    property user_account_control : UInt32
    property which_fields : UInt32
    property logon_hours : Win32cr::Security::Authentication::Identity::LOGON_HOURS
    property bad_password_count : UInt16
    property logon_count : UInt16
    property country_code : UInt16
    property code_page : UInt16
    property lm_password_present : Win32cr::Foundation::BOOLEAN
    property nt_password_present : Win32cr::Foundation::BOOLEAN
    property password_expired : Win32cr::Foundation::BOOLEAN
    property private_data_sensitive : Win32cr::Foundation::BOOLEAN
    def initialize(@last_logon : Win32cr::Foundation::LARGE_INTEGER, @last_logoff : Win32cr::Foundation::LARGE_INTEGER, @password_last_set : Win32cr::Foundation::LARGE_INTEGER, @account_expires : Win32cr::Foundation::LARGE_INTEGER, @password_can_change : Win32cr::Foundation::LARGE_INTEGER, @password_must_change : Win32cr::Foundation::LARGE_INTEGER, @user_name : Win32cr::Foundation::UNICODE_STRING, @full_name : Win32cr::Foundation::UNICODE_STRING, @home_directory : Win32cr::Foundation::UNICODE_STRING, @home_directory_drive : Win32cr::Foundation::UNICODE_STRING, @script_path : Win32cr::Foundation::UNICODE_STRING, @profile_path : Win32cr::Foundation::UNICODE_STRING, @admin_comment : Win32cr::Foundation::UNICODE_STRING, @work_stations : Win32cr::Foundation::UNICODE_STRING, @user_comment : Win32cr::Foundation::UNICODE_STRING, @parameters : Win32cr::Foundation::UNICODE_STRING, @lm_password : Win32cr::Foundation::UNICODE_STRING, @nt_password : Win32cr::Foundation::UNICODE_STRING, @private_data : Win32cr::Foundation::UNICODE_STRING, @security_descriptor : Win32cr::Security::Authentication::Identity::SR_SECURITY_DESCRIPTOR, @user_id : UInt32, @primary_group_id : UInt32, @user_account_control : UInt32, @which_fields : UInt32, @logon_hours : Win32cr::Security::Authentication::Identity::LOGON_HOURS, @bad_password_count : UInt16, @logon_count : UInt16, @country_code : UInt16, @code_page : UInt16, @lm_password_present : Win32cr::Foundation::BOOLEAN, @nt_password_present : Win32cr::Foundation::BOOLEAN, @password_expired : Win32cr::Foundation::BOOLEAN, @private_data_sensitive : Win32cr::Foundation::BOOLEAN)
    end
  end

  @[Extern]
  struct CLEAR_BLOCK
    property data : Win32cr::Foundation::CHAR[8]
    def initialize(@data : Win32cr::Foundation::CHAR[8])
    end
  end

  @[Extern]
  struct USER_SESSION_KEY
    property data : Win32cr::System::PasswordManagement::CYPHER_BLOCK[2]
    def initialize(@data : Win32cr::System::PasswordManagement::CYPHER_BLOCK[2])
    end
  end

  @[Extern]
  struct NETLOGON_LOGON_IDENTITY_INFO
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property parameter_control : UInt32
    property logon_id : Win32cr::Foundation::LARGE_INTEGER
    property user_name : Win32cr::Foundation::UNICODE_STRING
    property workstation : Win32cr::Foundation::UNICODE_STRING
    def initialize(@logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @parameter_control : UInt32, @logon_id : Win32cr::Foundation::LARGE_INTEGER, @user_name : Win32cr::Foundation::UNICODE_STRING, @workstation : Win32cr::Foundation::UNICODE_STRING)
    end
  end

  @[Extern]
  struct NETLOGON_INTERACTIVE_INFO
    property identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO
    property lm_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD
    property nt_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD
    def initialize(@identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO, @lm_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD, @nt_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD)
    end
  end

  @[Extern]
  struct NETLOGON_SERVICE_INFO
    property identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO
    property lm_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD
    property nt_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD
    def initialize(@identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO, @lm_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD, @nt_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD)
    end
  end

  @[Extern]
  struct NETLOGON_NETWORK_INFO
    property identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO
    property lm_challenge : Win32cr::Security::Authentication::Identity::CLEAR_BLOCK
    property nt_challenge_response : Win32cr::System::Kernel::STRING
    property lm_challenge_response : Win32cr::System::Kernel::STRING
    def initialize(@identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO, @lm_challenge : Win32cr::Security::Authentication::Identity::CLEAR_BLOCK, @nt_challenge_response : Win32cr::System::Kernel::STRING, @lm_challenge_response : Win32cr::System::Kernel::STRING)
    end
  end

  @[Extern]
  struct NETLOGON_GENERIC_INFO
    property identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO
    property package_name : Win32cr::Foundation::UNICODE_STRING
    property data_length : UInt32
    property logon_data : UInt8*
    def initialize(@identity : Win32cr::Security::Authentication::Identity::NETLOGON_LOGON_IDENTITY_INFO, @package_name : Win32cr::Foundation::UNICODE_STRING, @data_length : UInt32, @logon_data : UInt8*)
    end
  end

  @[Extern]
  struct MSV1_0_VALIDATION_INFO
    property logoff_time : Win32cr::Foundation::LARGE_INTEGER
    property kickoff_time : Win32cr::Foundation::LARGE_INTEGER
    property logon_server : Win32cr::Foundation::UNICODE_STRING
    property logon_domain_name : Win32cr::Foundation::UNICODE_STRING
    property session_key : Win32cr::Security::Authentication::Identity::USER_SESSION_KEY
    property authoritative : Win32cr::Foundation::BOOLEAN
    property user_flags : UInt32
    property which_fields : UInt32
    property user_id : UInt32
    def initialize(@logoff_time : Win32cr::Foundation::LARGE_INTEGER, @kickoff_time : Win32cr::Foundation::LARGE_INTEGER, @logon_server : Win32cr::Foundation::UNICODE_STRING, @logon_domain_name : Win32cr::Foundation::UNICODE_STRING, @session_key : Win32cr::Security::Authentication::Identity::USER_SESSION_KEY, @authoritative : Win32cr::Foundation::BOOLEAN, @user_flags : UInt32, @which_fields : UInt32, @user_id : UInt32)
    end
  end

  @[Extern]
  struct TOKENBINDING_IDENTIFIER
    property keyType : UInt8
    def initialize(@keyType : UInt8)
    end
  end

  @[Extern]
  struct TOKENBINDING_RESULT_DATA
    property bindingType : Win32cr::Security::Authentication::Identity::TOKENBINDING_TYPE
    property identifierSize : UInt32
    property identifierData : Win32cr::Security::Authentication::Identity::TOKENBINDING_IDENTIFIER*
    property extensionFormat : Win32cr::Security::Authentication::Identity::TOKENBINDING_EXTENSION_FORMAT
    property extensionSize : UInt32
    property extensionData : Void*
    def initialize(@bindingType : Win32cr::Security::Authentication::Identity::TOKENBINDING_TYPE, @identifierSize : UInt32, @identifierData : Win32cr::Security::Authentication::Identity::TOKENBINDING_IDENTIFIER*, @extensionFormat : Win32cr::Security::Authentication::Identity::TOKENBINDING_EXTENSION_FORMAT, @extensionSize : UInt32, @extensionData : Void*)
    end
  end

  @[Extern]
  struct TOKENBINDING_RESULT_LIST
    property resultCount : UInt32
    property resultData : Win32cr::Security::Authentication::Identity::TOKENBINDING_RESULT_DATA*
    def initialize(@resultCount : UInt32, @resultData : Win32cr::Security::Authentication::Identity::TOKENBINDING_RESULT_DATA*)
    end
  end

  @[Extern]
  struct TOKENBINDING_KEY_TYPES
    property keyCount : UInt32
    property keyType : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_PARAMETERS_TYPE*
    def initialize(@keyCount : UInt32, @keyType : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_PARAMETERS_TYPE*)
    end
  end

  @[Extern]
  struct SL_LICENSING_STATUS
    property sku_id : LibC::GUID
    property eStatus : Win32cr::Security::Authentication::Identity::SLLICENSINGSTATUS
    property dwGraceTime : UInt32
    property dwTotalGraceDays : UInt32
    property hrReason : Win32cr::Foundation::HRESULT
    property qwValidityExpiration : UInt64
    def initialize(@sku_id : LibC::GUID, @eStatus : Win32cr::Security::Authentication::Identity::SLLICENSINGSTATUS, @dwGraceTime : UInt32, @dwTotalGraceDays : UInt32, @hrReason : Win32cr::Foundation::HRESULT, @qwValidityExpiration : UInt64)
    end
  end

  @[Extern]
  struct SL_ACTIVATION_INFO_HEADER
    property cbSize : UInt32
    property type__ : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_TYPE
    def initialize(@cbSize : UInt32, @type__ : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_TYPE)
    end
  end

  @[Extern]
  struct SL_AD_ACTIVATION_INFO
    property header : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_INFO_HEADER
    property pwszProductKey : Win32cr::Foundation::PWSTR
    property pwszActivationObjectName : Win32cr::Foundation::PWSTR
    def initialize(@header : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_INFO_HEADER, @pwszProductKey : Win32cr::Foundation::PWSTR, @pwszActivationObjectName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct SL_NONGENUINE_UI_OPTIONS
    property cbSize : UInt32
    property pComponentId : LibC::GUID*
    property hResultUI : Win32cr::Foundation::HRESULT
    def initialize(@cbSize : UInt32, @pComponentId : LibC::GUID*, @hResultUI : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct SL_SYSTEM_POLICY_INFORMATION
    property reserved1 : Void*[2]
    property reserved2 : UInt32[3]
    def initialize(@reserved1 : Void*[2], @reserved2 : UInt32[3])
    end
  end

  @[Extern]
  record ICcgDomainAuthCredentialsVtbl,
    query_interface : Proc(ICcgDomainAuthCredentials*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICcgDomainAuthCredentials*, UInt32),
    release : Proc(ICcgDomainAuthCredentials*, UInt32),
    get_password_credentials : Proc(ICcgDomainAuthCredentials*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICcgDomainAuthCredentials, lpVtbl : ICcgDomainAuthCredentialsVtbl* do
    GUID = LibC::GUID.new(0x6ecda518_u32, 0x2010_u16, 0x4437_u16, StaticArray[0x8b_u8, 0xc3_u8, 0x46_u8, 0xe7_u8, 0x52_u8, 0xb7_u8, 0xb1_u8, 0x72_u8])
    def query_interface(this : ICcgDomainAuthCredentials*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICcgDomainAuthCredentials*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICcgDomainAuthCredentials*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_password_credentials(this : ICcgDomainAuthCredentials*, pluginInput : Win32cr::Foundation::PWSTR, domainName : Win32cr::Foundation::PWSTR*, username : Win32cr::Foundation::PWSTR*, password : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_password_credentials.call(this, pluginInput, domainName, username, password)
    end

  end

  @[Link("secur32")]
  @[Link("advapi32")]
  @[Link("sspicli")]
  @[Link("credui")]
  @[Link("schannel")]
  @[Link("tokenbinding")]
  @[Link("slc")]
  @[Link("slcext")]
  @[Link("slwga")]
  lib C
    fun LsaRegisterLogonProcess(logon_process_name : Win32cr::System::Kernel::STRING*, lsa_handle : Win32cr::Security::Authentication::Identity::LsaHandle*, security_mode : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaLogonUser(lsa_handle : Win32cr::Foundation::HANDLE, origin_name : Win32cr::System::Kernel::STRING*, logon_type : Win32cr::Security::Authentication::Identity::SECURITY_LOGON_TYPE, authentication_package : UInt32, authentication_information : Void*, authentication_information_length : UInt32, local_groups : Win32cr::Security::TOKEN_GROUPS*, source_context : Win32cr::Security::TOKEN_SOURCE*, profile_buffer : Void**, profile_buffer_length : UInt32*, logon_id : Win32cr::Foundation::LUID*, token : Win32cr::Foundation::HANDLE*, quotas : Win32cr::Security::QUOTA_LIMITS*, sub_status : Int32*) : Win32cr::Foundation::NTSTATUS

    fun LsaLookupAuthenticationPackage(lsa_handle : Win32cr::Foundation::HANDLE, package_name : Win32cr::System::Kernel::STRING*, authentication_package : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaFreeReturnBuffer(buffer : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaCallAuthenticationPackage(lsa_handle : Win32cr::Foundation::HANDLE, authentication_package : UInt32, protocol_submit_buffer : Void*, submit_buffer_length : UInt32, protocol_return_buffer : Void**, return_buffer_length : UInt32*, protocol_status : Int32*) : Win32cr::Foundation::NTSTATUS

    fun LsaDeregisterLogonProcess(lsa_handle : Win32cr::Security::Authentication::Identity::LsaHandle) : Win32cr::Foundation::NTSTATUS

    fun LsaConnectUntrusted(lsa_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::NTSTATUS

    fun LsaFreeMemory(buffer : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaClose(object_handle : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaEnumerateLogonSessions(logon_session_count : UInt32*, logon_session_list : Win32cr::Foundation::LUID**) : Win32cr::Foundation::NTSTATUS

    fun LsaGetLogonSessionData(logon_id : Win32cr::Foundation::LUID*, ppLogonSessionData : Win32cr::Security::Authentication::Identity::SECURITY_LOGON_SESSION_DATA**) : Win32cr::Foundation::NTSTATUS

    fun LsaOpenPolicy(system_name : Win32cr::Foundation::UNICODE_STRING*, object_attributes : Win32cr::System::WindowsProgramming::OBJECT_ATTRIBUTES*, desired_access : UInt32, policy_handle : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaSetCAPs(capd_ns : Win32cr::Foundation::UNICODE_STRING*, capdn_count : UInt32, flags : UInt32) : Win32cr::Foundation::NTSTATUS

    fun LsaGetAppliedCAPIDs(system_name : Win32cr::Foundation::UNICODE_STRING*, capi_ds : Win32cr::Foundation::PSID**, capid_count : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaQueryCAPs(capi_ds : Win32cr::Foundation::PSID*, capid_count : UInt32, ca_ps : Win32cr::Security::Authentication::Identity::CENTRAL_ACCESS_POLICY**, cap_count : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaQueryInformationPolicy(policy_handle : Void*, information_class : Win32cr::Security::Authentication::Identity::POLICY_INFORMATION_CLASS, buffer : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaSetInformationPolicy(policy_handle : Void*, information_class : Win32cr::Security::Authentication::Identity::POLICY_INFORMATION_CLASS, buffer : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaQueryDomainInformationPolicy(policy_handle : Void*, information_class : Win32cr::Security::Authentication::Identity::POLICY_DOMAIN_INFORMATION_CLASS, buffer : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaSetDomainInformationPolicy(policy_handle : Void*, information_class : Win32cr::Security::Authentication::Identity::POLICY_DOMAIN_INFORMATION_CLASS, buffer : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaRegisterPolicyChangeNotification(information_class : Win32cr::Security::Authentication::Identity::POLICY_NOTIFICATION_INFORMATION_CLASS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::NTSTATUS

    fun LsaUnregisterPolicyChangeNotification(information_class : Win32cr::Security::Authentication::Identity::POLICY_NOTIFICATION_INFORMATION_CLASS, notification_event_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::NTSTATUS

    fun LsaEnumerateTrustedDomains(policy_handle : Void*, enumeration_context : UInt32*, buffer : Void**, prefered_maximum_length : UInt32, count_returned : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaLookupNames(policy_handle : Void*, count : UInt32, names : Win32cr::Foundation::UNICODE_STRING*, referenced_domains : Win32cr::Security::Authentication::Identity::LSA_REFERENCED_DOMAIN_LIST**, sids : Win32cr::Security::Authentication::Identity::LSA_TRANSLATED_SID**) : Win32cr::Foundation::NTSTATUS

    fun LsaLookupNames2(policy_handle : Void*, flags : UInt32, count : UInt32, names : Win32cr::Foundation::UNICODE_STRING*, referenced_domains : Win32cr::Security::Authentication::Identity::LSA_REFERENCED_DOMAIN_LIST**, sids : Win32cr::Security::Authentication::Identity::LSA_TRANSLATED_SID2**) : Win32cr::Foundation::NTSTATUS

    fun LsaLookupSids(policy_handle : Void*, count : UInt32, sids : Win32cr::Foundation::PSID*, referenced_domains : Win32cr::Security::Authentication::Identity::LSA_REFERENCED_DOMAIN_LIST**, names : Win32cr::Security::Authentication::Identity::LSA_TRANSLATED_NAME**) : Win32cr::Foundation::NTSTATUS

    fun LsaLookupSids2(policy_handle : Void*, lookup_options : UInt32, count : UInt32, sids : Win32cr::Foundation::PSID*, referenced_domains : Win32cr::Security::Authentication::Identity::LSA_REFERENCED_DOMAIN_LIST**, names : Win32cr::Security::Authentication::Identity::LSA_TRANSLATED_NAME**) : Win32cr::Foundation::NTSTATUS

    fun LsaEnumerateAccountsWithUserRight(policy_handle : Void*, user_right : Win32cr::Foundation::UNICODE_STRING*, buffer : Void**, count_returned : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaEnumerateAccountRights(policy_handle : Void*, account_sid : Win32cr::Foundation::PSID, user_rights : Win32cr::Foundation::UNICODE_STRING**, count_of_rights : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaAddAccountRights(policy_handle : Void*, account_sid : Win32cr::Foundation::PSID, user_rights : Win32cr::Foundation::UNICODE_STRING*, count_of_rights : UInt32) : Win32cr::Foundation::NTSTATUS

    fun LsaRemoveAccountRights(policy_handle : Void*, account_sid : Win32cr::Foundation::PSID, all_rights : Win32cr::Foundation::BOOLEAN, user_rights : Win32cr::Foundation::UNICODE_STRING*, count_of_rights : UInt32) : Win32cr::Foundation::NTSTATUS

    fun LsaOpenTrustedDomainByName(policy_handle : Void*, trusted_domain_name : Win32cr::Foundation::UNICODE_STRING*, desired_access : UInt32, trusted_domain_handle : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaQueryTrustedDomainInfo(policy_handle : Void*, trusted_domain_sid : Win32cr::Foundation::PSID, information_class : Win32cr::Security::Authentication::Identity::TRUSTED_INFORMATION_CLASS, buffer : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaSetTrustedDomainInformation(policy_handle : Void*, trusted_domain_sid : Win32cr::Foundation::PSID, information_class : Win32cr::Security::Authentication::Identity::TRUSTED_INFORMATION_CLASS, buffer : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaDeleteTrustedDomain(policy_handle : Void*, trusted_domain_sid : Win32cr::Foundation::PSID) : Win32cr::Foundation::NTSTATUS

    fun LsaQueryTrustedDomainInfoByName(policy_handle : Void*, trusted_domain_name : Win32cr::Foundation::UNICODE_STRING*, information_class : Win32cr::Security::Authentication::Identity::TRUSTED_INFORMATION_CLASS, buffer : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaSetTrustedDomainInfoByName(policy_handle : Void*, trusted_domain_name : Win32cr::Foundation::UNICODE_STRING*, information_class : Win32cr::Security::Authentication::Identity::TRUSTED_INFORMATION_CLASS, buffer : Void*) : Win32cr::Foundation::NTSTATUS

    fun LsaEnumerateTrustedDomainsEx(policy_handle : Void*, enumeration_context : UInt32*, buffer : Void**, prefered_maximum_length : UInt32, count_returned : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun LsaCreateTrustedDomainEx(policy_handle : Void*, trusted_domain_information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_INFORMATION_EX*, authentication_information : Win32cr::Security::Authentication::Identity::TRUSTED_DOMAIN_AUTH_INFORMATION*, desired_access : UInt32, trusted_domain_handle : Void**) : Win32cr::Foundation::NTSTATUS

    fun LsaQueryForestTrustInformation(policy_handle : Void*, trusted_domain_name : Win32cr::Foundation::UNICODE_STRING*, forest_trust_info : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_INFORMATION**) : Win32cr::Foundation::NTSTATUS

    fun LsaSetForestTrustInformation(policy_handle : Void*, trusted_domain_name : Win32cr::Foundation::UNICODE_STRING*, forest_trust_info : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_INFORMATION*, check_only : Win32cr::Foundation::BOOLEAN, collision_info : Win32cr::Security::Authentication::Identity::LSA_FOREST_TRUST_COLLISION_INFORMATION**) : Win32cr::Foundation::NTSTATUS

    fun LsaStorePrivateData(policy_handle : Void*, key_name : Win32cr::Foundation::UNICODE_STRING*, private_data : Win32cr::Foundation::UNICODE_STRING*) : Win32cr::Foundation::NTSTATUS

    fun LsaRetrievePrivateData(policy_handle : Void*, key_name : Win32cr::Foundation::UNICODE_STRING*, private_data : Win32cr::Foundation::UNICODE_STRING**) : Win32cr::Foundation::NTSTATUS

    fun LsaNtStatusToWinError(status : Win32cr::Foundation::NTSTATUS) : UInt32

    fun SystemFunction036(random_buffer : Void*, random_buffer_length : UInt32) : Win32cr::Foundation::BOOLEAN

    fun SystemFunction040(memory : Void*, memory_size : UInt32, option_flags : UInt32) : Win32cr::Foundation::NTSTATUS

    fun SystemFunction041(memory : Void*, memory_size : UInt32, option_flags : UInt32) : Win32cr::Foundation::NTSTATUS

    fun AuditSetSystemPolicy(pAuditPolicy : Win32cr::Security::Authentication::Identity::AUDIT_POLICY_INFORMATION*, dwPolicyCount : UInt32) : Win32cr::Foundation::BOOLEAN

    fun AuditSetPerUserPolicy(pSid : Win32cr::Foundation::PSID, pAuditPolicy : Win32cr::Security::Authentication::Identity::AUDIT_POLICY_INFORMATION*, dwPolicyCount : UInt32) : Win32cr::Foundation::BOOLEAN

    fun AuditQuerySystemPolicy(pSubCategoryGuids : LibC::GUID*, dwPolicyCount : UInt32, ppAuditPolicy : Win32cr::Security::Authentication::Identity::AUDIT_POLICY_INFORMATION**) : Win32cr::Foundation::BOOLEAN

    fun AuditQueryPerUserPolicy(pSid : Win32cr::Foundation::PSID, pSubCategoryGuids : LibC::GUID*, dwPolicyCount : UInt32, ppAuditPolicy : Win32cr::Security::Authentication::Identity::AUDIT_POLICY_INFORMATION**) : Win32cr::Foundation::BOOLEAN

    fun AuditEnumeratePerUserPolicy(ppAuditSidArray : Win32cr::Security::Authentication::Identity::POLICY_AUDIT_SID_ARRAY**) : Win32cr::Foundation::BOOLEAN

    fun AuditComputeEffectivePolicyBySid(pSid : Win32cr::Foundation::PSID, pSubCategoryGuids : LibC::GUID*, dwPolicyCount : UInt32, ppAuditPolicy : Win32cr::Security::Authentication::Identity::AUDIT_POLICY_INFORMATION**) : Win32cr::Foundation::BOOLEAN

    fun AuditComputeEffectivePolicyByToken(hTokenHandle : Win32cr::Foundation::HANDLE, pSubCategoryGuids : LibC::GUID*, dwPolicyCount : UInt32, ppAuditPolicy : Win32cr::Security::Authentication::Identity::AUDIT_POLICY_INFORMATION**) : Win32cr::Foundation::BOOLEAN

    fun AuditEnumerateCategories(ppAuditCategoriesArray : LibC::GUID**, pdwCountReturned : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun AuditEnumerateSubCategories(pAuditCategoryGuid : LibC::GUID*, bRetrieveAllSubCategories : Win32cr::Foundation::BOOLEAN, ppAuditSubCategoriesArray : LibC::GUID**, pdwCountReturned : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun AuditLookupCategoryNameW(pAuditCategoryGuid : LibC::GUID*, ppszCategoryName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::BOOLEAN

    fun AuditLookupCategoryNameA(pAuditCategoryGuid : LibC::GUID*, ppszCategoryName : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOLEAN

    fun AuditLookupSubCategoryNameW(pAuditSubCategoryGuid : LibC::GUID*, ppszSubCategoryName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::BOOLEAN

    fun AuditLookupSubCategoryNameA(pAuditSubCategoryGuid : LibC::GUID*, ppszSubCategoryName : Win32cr::Foundation::PSTR*) : Win32cr::Foundation::BOOLEAN

    fun AuditLookupCategoryIdFromCategoryGuid(pAuditCategoryGuid : LibC::GUID*, pAuditCategoryId : Win32cr::Security::Authentication::Identity::POLICY_AUDIT_EVENT_TYPE*) : Win32cr::Foundation::BOOLEAN

    fun AuditLookupCategoryGuidFromCategoryId(audit_category_id : Win32cr::Security::Authentication::Identity::POLICY_AUDIT_EVENT_TYPE, pAuditCategoryGuid : LibC::GUID*) : Win32cr::Foundation::BOOLEAN

    fun AuditSetSecurity(security_information : UInt32, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::BOOLEAN

    fun AuditQuerySecurity(security_information : UInt32, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*) : Win32cr::Foundation::BOOLEAN

    fun AuditSetGlobalSaclW(object_type_name : Win32cr::Foundation::PWSTR, acl : Win32cr::Security::ACL*) : Win32cr::Foundation::BOOLEAN

    fun AuditSetGlobalSaclA(object_type_name : Win32cr::Foundation::PSTR, acl : Win32cr::Security::ACL*) : Win32cr::Foundation::BOOLEAN

    fun AuditQueryGlobalSaclW(object_type_name : Win32cr::Foundation::PWSTR, acl : Win32cr::Security::ACL**) : Win32cr::Foundation::BOOLEAN

    fun AuditQueryGlobalSaclA(object_type_name : Win32cr::Foundation::PSTR, acl : Win32cr::Security::ACL**) : Win32cr::Foundation::BOOLEAN

    fun AuditFree(buffer : Void*) : Void

    fun AcquireCredentialsHandleW(pszPrincipal : Win32cr::Foundation::PWSTR, pszPackage : Win32cr::Foundation::PWSTR, fCredentialUse : Win32cr::Security::Authentication::Identity::SECPKG_CRED, pvLogonId : Void*, pAuthData : Void*, pGetKeyFn : Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, pvGetKeyArgument : Void*, phCredential : Win32cr::Security::Credentials::SecHandle*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun AcquireCredentialsHandleA(pszPrincipal : Win32cr::Foundation::PSTR, pszPackage : Win32cr::Foundation::PSTR, fCredentialUse : Win32cr::Security::Authentication::Identity::SECPKG_CRED, pvLogonId : Void*, pAuthData : Void*, pGetKeyFn : Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, pvGetKeyArgument : Void*, phCredential : Win32cr::Security::Credentials::SecHandle*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun FreeCredentialsHandle(phCredential : Win32cr::Security::Credentials::SecHandle*) : Win32cr::Foundation::HRESULT

    fun AddCredentialsW(hCredentials : Win32cr::Security::Credentials::SecHandle*, pszPrincipal : Win32cr::Foundation::PWSTR, pszPackage : Win32cr::Foundation::PWSTR, fCredentialUse : UInt32, pAuthData : Void*, pGetKeyFn : Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, pvGetKeyArgument : Void*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun AddCredentialsA(hCredentials : Win32cr::Security::Credentials::SecHandle*, pszPrincipal : Win32cr::Foundation::PSTR, pszPackage : Win32cr::Foundation::PSTR, fCredentialUse : UInt32, pAuthData : Void*, pGetKeyFn : Win32cr::Security::Authentication::Identity::SEC_GET_KEY_FN, pvGetKeyArgument : Void*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun ChangeAccountPasswordW(pszPackageName : UInt16*, pszDomainName : UInt16*, pszAccountName : UInt16*, pszOldPassword : UInt16*, pszNewPassword : UInt16*, bImpersonating : Win32cr::Foundation::BOOLEAN, dwReserved : UInt32, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*) : Win32cr::Foundation::HRESULT

    fun ChangeAccountPasswordA(pszPackageName : Int8*, pszDomainName : Int8*, pszAccountName : Int8*, pszOldPassword : Int8*, pszNewPassword : Int8*, bImpersonating : Win32cr::Foundation::BOOLEAN, dwReserved : UInt32, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*) : Win32cr::Foundation::HRESULT

    fun InitializeSecurityContextW(phCredential : Win32cr::Security::Credentials::SecHandle*, phContext : Win32cr::Security::Credentials::SecHandle*, pszTargetName : UInt16*, fContextReq : Win32cr::Security::Authentication::Identity::ISC_REQ_FLAGS, reserved1 : UInt32, target_data_rep : UInt32, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, reserved2 : UInt32, phNewContext : Win32cr::Security::Credentials::SecHandle*, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, pfContextAttr : UInt32*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun InitializeSecurityContextA(phCredential : Win32cr::Security::Credentials::SecHandle*, phContext : Win32cr::Security::Credentials::SecHandle*, pszTargetName : Int8*, fContextReq : Win32cr::Security::Authentication::Identity::ISC_REQ_FLAGS, reserved1 : UInt32, target_data_rep : UInt32, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, reserved2 : UInt32, phNewContext : Win32cr::Security::Credentials::SecHandle*, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, pfContextAttr : UInt32*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun AcceptSecurityContext(phCredential : Win32cr::Security::Credentials::SecHandle*, phContext : Win32cr::Security::Credentials::SecHandle*, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, fContextReq : Win32cr::Security::Authentication::Identity::ASC_REQ_FLAGS, target_data_rep : UInt32, phNewContext : Win32cr::Security::Credentials::SecHandle*, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, pfContextAttr : UInt32*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun CompleteAuthToken(phContext : Win32cr::Security::Credentials::SecHandle*, pToken : Win32cr::Security::Authentication::Identity::SecBufferDesc*) : Win32cr::Foundation::HRESULT

    fun ImpersonateSecurityContext(phContext : Win32cr::Security::Credentials::SecHandle*) : Win32cr::Foundation::HRESULT

    fun RevertSecurityContext(phContext : Win32cr::Security::Credentials::SecHandle*) : Win32cr::Foundation::HRESULT

    fun QuerySecurityContextToken(phContext : Win32cr::Security::Credentials::SecHandle*, token : Void**) : Win32cr::Foundation::HRESULT

    fun DeleteSecurityContext(phContext : Win32cr::Security::Credentials::SecHandle*) : Win32cr::Foundation::HRESULT

    fun ApplyControlToken(phContext : Win32cr::Security::Credentials::SecHandle*, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*) : Win32cr::Foundation::HRESULT

    fun QueryContextAttributesW(phContext : Win32cr::Security::Credentials::SecHandle*, ulAttribute : Win32cr::Security::Authentication::Identity::SECPKG_ATTR, pBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun QueryContextAttributesExW(phContext : Win32cr::Security::Credentials::SecHandle*, ulAttribute : Win32cr::Security::Authentication::Identity::SECPKG_ATTR, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun QueryContextAttributesA(phContext : Win32cr::Security::Credentials::SecHandle*, ulAttribute : Win32cr::Security::Authentication::Identity::SECPKG_ATTR, pBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun QueryContextAttributesExA(phContext : Win32cr::Security::Credentials::SecHandle*, ulAttribute : Win32cr::Security::Authentication::Identity::SECPKG_ATTR, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun SetContextAttributesW(phContext : Win32cr::Security::Credentials::SecHandle*, ulAttribute : Win32cr::Security::Authentication::Identity::SECPKG_ATTR, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun SetContextAttributesA(phContext : Win32cr::Security::Credentials::SecHandle*, ulAttribute : Win32cr::Security::Authentication::Identity::SECPKG_ATTR, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun QueryCredentialsAttributesW(phCredential : Win32cr::Security::Credentials::SecHandle*, ulAttribute : UInt32, pBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun QueryCredentialsAttributesExW(phCredential : Win32cr::Security::Credentials::SecHandle*, ulAttribute : UInt32, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun QueryCredentialsAttributesA(phCredential : Win32cr::Security::Credentials::SecHandle*, ulAttribute : UInt32, pBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun QueryCredentialsAttributesExA(phCredential : Win32cr::Security::Credentials::SecHandle*, ulAttribute : UInt32, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun SetCredentialsAttributesW(phCredential : Win32cr::Security::Credentials::SecHandle*, ulAttribute : UInt32, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun SetCredentialsAttributesA(phCredential : Win32cr::Security::Credentials::SecHandle*, ulAttribute : UInt32, pBuffer : Void*, cbBuffer : UInt32) : Win32cr::Foundation::HRESULT

    fun FreeContextBuffer(pvContextBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun MakeSignature(phContext : Win32cr::Security::Credentials::SecHandle*, fQOP : UInt32, pMessage : Win32cr::Security::Authentication::Identity::SecBufferDesc*, message_seq_no : UInt32) : Win32cr::Foundation::HRESULT

    fun VerifySignature(phContext : Win32cr::Security::Credentials::SecHandle*, pMessage : Win32cr::Security::Authentication::Identity::SecBufferDesc*, message_seq_no : UInt32, pfQOP : UInt32*) : Win32cr::Foundation::HRESULT

    fun EncryptMessage(phContext : Win32cr::Security::Credentials::SecHandle*, fQOP : UInt32, pMessage : Win32cr::Security::Authentication::Identity::SecBufferDesc*, message_seq_no : UInt32) : Win32cr::Foundation::HRESULT

    fun DecryptMessage(phContext : Win32cr::Security::Credentials::SecHandle*, pMessage : Win32cr::Security::Authentication::Identity::SecBufferDesc*, message_seq_no : UInt32, pfQOP : UInt32*) : Win32cr::Foundation::HRESULT

    fun EnumerateSecurityPackagesW(pcPackages : UInt32*, ppPackageInfo : Win32cr::Security::Authentication::Identity::SecPkgInfoW**) : Win32cr::Foundation::HRESULT

    fun EnumerateSecurityPackagesA(pcPackages : UInt32*, ppPackageInfo : Win32cr::Security::Authentication::Identity::SecPkgInfoA**) : Win32cr::Foundation::HRESULT

    fun QuerySecurityPackageInfoW(pszPackageName : Win32cr::Foundation::PWSTR, ppPackageInfo : Win32cr::Security::Authentication::Identity::SecPkgInfoW**) : Win32cr::Foundation::HRESULT

    fun QuerySecurityPackageInfoA(pszPackageName : Win32cr::Foundation::PSTR, ppPackageInfo : Win32cr::Security::Authentication::Identity::SecPkgInfoA**) : Win32cr::Foundation::HRESULT

    fun ExportSecurityContext(phContext : Win32cr::Security::Credentials::SecHandle*, fFlags : Win32cr::Security::Authentication::Identity::EXPORT_SECURITY_CONTEXT_FLAGS, pPackedContext : Win32cr::Security::Authentication::Identity::SecBuffer*, pToken : Void**) : Win32cr::Foundation::HRESULT

    fun ImportSecurityContextW(pszPackage : Win32cr::Foundation::PWSTR, pPackedContext : Win32cr::Security::Authentication::Identity::SecBuffer*, token : Void*, phContext : Win32cr::Security::Credentials::SecHandle*) : Win32cr::Foundation::HRESULT

    fun ImportSecurityContextA(pszPackage : Win32cr::Foundation::PSTR, pPackedContext : Win32cr::Security::Authentication::Identity::SecBuffer*, token : Void*, phContext : Win32cr::Security::Credentials::SecHandle*) : Win32cr::Foundation::HRESULT

    fun InitSecurityInterfaceA : Win32cr::Security::Authentication::Identity::SecurityFunctionTableA*

    fun InitSecurityInterfaceW : Win32cr::Security::Authentication::Identity::SecurityFunctionTableW*

    fun SaslEnumerateProfilesA(profile_list : Win32cr::Foundation::PSTR*, profile_count : UInt32*) : Win32cr::Foundation::HRESULT

    fun SaslEnumerateProfilesW(profile_list : Win32cr::Foundation::PWSTR*, profile_count : UInt32*) : Win32cr::Foundation::HRESULT

    fun SaslGetProfilePackageA(profile_name : Win32cr::Foundation::PSTR, package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoA**) : Win32cr::Foundation::HRESULT

    fun SaslGetProfilePackageW(profile_name : Win32cr::Foundation::PWSTR, package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoW**) : Win32cr::Foundation::HRESULT

    fun SaslIdentifyPackageA(pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoA**) : Win32cr::Foundation::HRESULT

    fun SaslIdentifyPackageW(pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, package_info : Win32cr::Security::Authentication::Identity::SecPkgInfoW**) : Win32cr::Foundation::HRESULT

    fun SaslInitializeSecurityContextW(phCredential : Win32cr::Security::Credentials::SecHandle*, phContext : Win32cr::Security::Credentials::SecHandle*, pszTargetName : Win32cr::Foundation::PWSTR, fContextReq : Win32cr::Security::Authentication::Identity::ISC_REQ_FLAGS, reserved1 : UInt32, target_data_rep : UInt32, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, reserved2 : UInt32, phNewContext : Win32cr::Security::Credentials::SecHandle*, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, pfContextAttr : UInt32*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun SaslInitializeSecurityContextA(phCredential : Win32cr::Security::Credentials::SecHandle*, phContext : Win32cr::Security::Credentials::SecHandle*, pszTargetName : Win32cr::Foundation::PSTR, fContextReq : Win32cr::Security::Authentication::Identity::ISC_REQ_FLAGS, reserved1 : UInt32, target_data_rep : UInt32, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, reserved2 : UInt32, phNewContext : Win32cr::Security::Credentials::SecHandle*, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, pfContextAttr : UInt32*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun SaslAcceptSecurityContext(phCredential : Win32cr::Security::Credentials::SecHandle*, phContext : Win32cr::Security::Credentials::SecHandle*, pInput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, fContextReq : Win32cr::Security::Authentication::Identity::ASC_REQ_FLAGS, target_data_rep : UInt32, phNewContext : Win32cr::Security::Credentials::SecHandle*, pOutput : Win32cr::Security::Authentication::Identity::SecBufferDesc*, pfContextAttr : UInt32*, ptsExpiry : Win32cr::Foundation::LARGE_INTEGER*) : Win32cr::Foundation::HRESULT

    fun SaslSetContextOption(context_handle : Win32cr::Security::Credentials::SecHandle*, option : UInt32, value : Void*, size : UInt32) : Win32cr::Foundation::HRESULT

    fun SaslGetContextOption(context_handle : Win32cr::Security::Credentials::SecHandle*, option : UInt32, value : Void*, size : UInt32, needed : UInt32*) : Win32cr::Foundation::HRESULT

    fun SspiPromptForCredentialsW(pszTargetName : Win32cr::Foundation::PWSTR, pUiInfo : Void*, dwAuthError : UInt32, pszPackage : Win32cr::Foundation::PWSTR, pInputAuthIdentity : Void*, ppAuthIdentity : Void**, pfSave : Int32*, dwFlags : UInt32) : UInt32

    fun SspiPromptForCredentialsA(pszTargetName : Win32cr::Foundation::PSTR, pUiInfo : Void*, dwAuthError : UInt32, pszPackage : Win32cr::Foundation::PSTR, pInputAuthIdentity : Void*, ppAuthIdentity : Void**, pfSave : Int32*, dwFlags : UInt32) : UInt32

    fun SspiPrepareForCredRead(auth_identity : Void*, pszTargetName : Win32cr::Foundation::PWSTR, pCredmanCredentialType : UInt32*, ppszCredmanTargetName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SspiPrepareForCredWrite(auth_identity : Void*, pszTargetName : Win32cr::Foundation::PWSTR, pCredmanCredentialType : UInt32*, ppszCredmanTargetName : Win32cr::Foundation::PWSTR*, ppszCredmanUserName : Win32cr::Foundation::PWSTR*, ppCredentialBlob : UInt8**, pCredentialBlobSize : UInt32*) : Win32cr::Foundation::HRESULT

    fun SspiEncryptAuthIdentity(auth_data : Void*) : Win32cr::Foundation::HRESULT

    fun SspiEncryptAuthIdentityEx(options : UInt32, auth_data : Void*) : Win32cr::Foundation::HRESULT

    fun SspiDecryptAuthIdentity(encrypted_auth_data : Void*) : Win32cr::Foundation::HRESULT

    fun SspiDecryptAuthIdentityEx(options : UInt32, encrypted_auth_data : Void*) : Win32cr::Foundation::HRESULT

    fun SspiIsAuthIdentityEncrypted(encrypted_auth_data : Void*) : Win32cr::Foundation::BOOLEAN

    fun SspiEncodeAuthIdentityAsStrings(pAuthIdentity : Void*, ppszUserName : Win32cr::Foundation::PWSTR*, ppszDomainName : Win32cr::Foundation::PWSTR*, ppszPackedCredentialsString : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SspiValidateAuthIdentity(auth_data : Void*) : Win32cr::Foundation::HRESULT

    fun SspiCopyAuthIdentity(auth_data : Void*, auth_data_copy : Void**) : Win32cr::Foundation::HRESULT

    fun SspiFreeAuthIdentity(auth_data : Void*) : Void

    fun SspiZeroAuthIdentity(auth_data : Void*) : Void

    fun SspiLocalFree(data_buffer : Void*) : Void

    fun SspiEncodeStringsAsAuthIdentity(pszUserName : Win32cr::Foundation::PWSTR, pszDomainName : Win32cr::Foundation::PWSTR, pszPackedCredentialsString : Win32cr::Foundation::PWSTR, ppAuthIdentity : Void**) : Win32cr::Foundation::HRESULT

    fun SspiCompareAuthIdentities(auth_identity1 : Void*, auth_identity2 : Void*, same_supplied_user : Win32cr::Foundation::BOOLEAN*, same_supplied_identity : Win32cr::Foundation::BOOLEAN*) : Win32cr::Foundation::HRESULT

    fun SspiMarshalAuthIdentity(auth_identity : Void*, auth_identity_length : UInt32*, auth_identity_byte_array : Int8**) : Win32cr::Foundation::HRESULT

    fun SspiUnmarshalAuthIdentity(auth_identity_length : UInt32, auth_identity_byte_array : Win32cr::Foundation::PSTR, ppAuthIdentity : Void**) : Win32cr::Foundation::HRESULT

    fun SspiIsPromptingNeeded(error_or_nt_status : UInt32) : Win32cr::Foundation::BOOLEAN

    fun SspiGetTargetHostName(pszTargetName : Win32cr::Foundation::PWSTR, pszHostName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SspiExcludePackage(auth_identity : Void*, pszPackageName : Win32cr::Foundation::PWSTR, ppNewAuthIdentity : Void**) : Win32cr::Foundation::HRESULT

    fun AddSecurityPackageA(pszPackageName : Win32cr::Foundation::PSTR, pOptions : Win32cr::Security::Authentication::Identity::SECURITY_PACKAGE_OPTIONS*) : Win32cr::Foundation::HRESULT

    fun AddSecurityPackageW(pszPackageName : Win32cr::Foundation::PWSTR, pOptions : Win32cr::Security::Authentication::Identity::SECURITY_PACKAGE_OPTIONS*) : Win32cr::Foundation::HRESULT

    fun DeleteSecurityPackageA(pszPackageName : Win32cr::Foundation::PSTR) : Win32cr::Foundation::HRESULT

    fun DeleteSecurityPackageW(pszPackageName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun CredMarshalTargetInfo(in_target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONW*, buffer : UInt16**, buffer_size : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun CredUnmarshalTargetInfo(buffer : UInt16*, buffer_size : UInt32, ret_target_info : Win32cr::Security::Credentials::CREDENTIAL_TARGET_INFORMATIONW**, ret_actual_size : UInt32*) : Win32cr::Foundation::NTSTATUS

    fun SslEmptyCacheA(pszTargetName : Win32cr::Foundation::PSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun SslEmptyCacheW(pszTargetName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun SslGenerateRandomBits(pRandomData : UInt8*, cRandomData : Int32) : Void

    fun SslCrackCertificate(pbCertificate : UInt8*, cbCertificate : UInt32, dwFlags : UInt32, ppCertificate : Win32cr::Security::Authentication::Identity::X509Certificate**) : Win32cr::Foundation::BOOL

    fun SslFreeCertificate(pCertificate : Win32cr::Security::Authentication::Identity::X509Certificate*) : Void

    fun SslGetMaximumKeySize(reserved : UInt32) : UInt32

    fun SslGetServerIdentity(client_hello : UInt8*, client_hello_size : UInt32, server_identity : UInt8**, server_identity_size : UInt32*, flags : UInt32) : Win32cr::Foundation::HRESULT

    fun SslGetExtensions(clientHello : UInt8*, clientHelloByteSize : UInt32, genericExtensions : Win32cr::Security::Authentication::Identity::SCH_EXTENSION_DATA*, genericExtensionsCount : UInt8, bytesToRead : UInt32*, flags : Win32cr::Security::Authentication::Identity::SchGetExtensionsOptions) : Win32cr::Foundation::HRESULT

    fun TokenBindingGenerateBinding(keyType : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_PARAMETERS_TYPE, targetURL : Win32cr::Foundation::PWSTR, bindingType : Win32cr::Security::Authentication::Identity::TOKENBINDING_TYPE, tlsEKM : Void*, tlsEKMSize : UInt32, extensionFormat : Win32cr::Security::Authentication::Identity::TOKENBINDING_EXTENSION_FORMAT, extensionData : Void*, tokenBinding : Void**, tokenBindingSize : UInt32*, resultData : Win32cr::Security::Authentication::Identity::TOKENBINDING_RESULT_DATA**) : Win32cr::Foundation::HRESULT

    fun TokenBindingGenerateMessage(tokenBindings : Void**, tokenBindingsSize : UInt32*, tokenBindingsCount : UInt32, tokenBindingMessage : Void**, tokenBindingMessageSize : UInt32*) : Win32cr::Foundation::HRESULT

    fun TokenBindingVerifyMessage(tokenBindingMessage : Void*, tokenBindingMessageSize : UInt32, keyType : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_PARAMETERS_TYPE, tlsEKM : Void*, tlsEKMSize : UInt32, resultList : Win32cr::Security::Authentication::Identity::TOKENBINDING_RESULT_LIST**) : Win32cr::Foundation::HRESULT

    fun TokenBindingGetKeyTypesClient(keyTypes : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_TYPES**) : Win32cr::Foundation::HRESULT

    fun TokenBindingGetKeyTypesServer(keyTypes : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_TYPES**) : Win32cr::Foundation::HRESULT

    fun TokenBindingDeleteBinding(targetURL : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun TokenBindingDeleteAllBindings : Win32cr::Foundation::HRESULT

    fun TokenBindingGenerateID(keyType : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_PARAMETERS_TYPE, publicKey : Void*, publicKeySize : UInt32, resultData : Win32cr::Security::Authentication::Identity::TOKENBINDING_RESULT_DATA**) : Win32cr::Foundation::HRESULT

    fun TokenBindingGenerateIDForUri(keyType : Win32cr::Security::Authentication::Identity::TOKENBINDING_KEY_PARAMETERS_TYPE, targetUri : Win32cr::Foundation::PWSTR, resultData : Win32cr::Security::Authentication::Identity::TOKENBINDING_RESULT_DATA**) : Win32cr::Foundation::HRESULT

    fun TokenBindingGetHighestSupportedVersion(majorVersion : UInt8*, minorVersion : UInt8*) : Win32cr::Foundation::HRESULT

    fun GetUserNameExA(name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, lpNameBuffer : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun GetUserNameExW(name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, lpNameBuffer : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun GetComputerObjectNameA(name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, lpNameBuffer : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun GetComputerObjectNameW(name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, lpNameBuffer : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun TranslateNameA(lpAccountName : Win32cr::Foundation::PSTR, account_name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, desired_name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, lpTranslatedName : UInt8*, nSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun TranslateNameW(lpAccountName : Win32cr::Foundation::PWSTR, account_name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, desired_name_format : Win32cr::Security::Authentication::Identity::EXTENDED_NAME_FORMAT, lpTranslatedName : UInt16*, nSize : UInt32*) : Win32cr::Foundation::BOOLEAN

    fun SLOpen(phSLC : Void**) : Win32cr::Foundation::HRESULT

    fun SLClose(hSLC : Void*) : Win32cr::Foundation::HRESULT

    fun SLInstallProofOfPurchase(hSLC : Void*, pwszPKeyAlgorithm : Win32cr::Foundation::PWSTR, pwszPKeyString : Win32cr::Foundation::PWSTR, cbPKeySpecificData : UInt32, pbPKeySpecificData : UInt8*, pPkeyId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLUninstallProofOfPurchase(hSLC : Void*, pPKeyId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLInstallLicense(hSLC : Void*, cbLicenseBlob : UInt32, pbLicenseBlob : UInt8*, pLicenseFileId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLUninstallLicense(hSLC : Void*, pLicenseFileId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLConsumeRight(hSLC : Void*, pAppId : LibC::GUID*, pProductSkuId : LibC::GUID*, pwszRightName : Win32cr::Foundation::PWSTR, pvReserved : Void*) : Win32cr::Foundation::HRESULT

    fun SLGetProductSkuInformation(hSLC : Void*, pProductSkuId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLGetPKeyInformation(hSLC : Void*, pPKeyId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLGetLicenseInformation(hSLC : Void*, pSLLicenseId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLGetLicensingStatusInformation(hSLC : Void*, pAppID : LibC::GUID*, pProductSkuId : LibC::GUID*, pwszRightName : Win32cr::Foundation::PWSTR, pnStatusCount : UInt32*, ppLicensingStatus : Win32cr::Security::Authentication::Identity::SL_LICENSING_STATUS**) : Win32cr::Foundation::HRESULT

    fun SLGetPolicyInformation(hSLC : Void*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLGetPolicyInformationDWORD(hSLC : Void*, pwszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT

    fun SLGetServiceInformation(hSLC : Void*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLGetApplicationInformation(hSLC : Void*, pApplicationId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLActivateProduct(hSLC : Void*, pProductSkuId : LibC::GUID*, cbAppSpecificData : UInt32, pvAppSpecificData : Void*, pActivationInfo : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_INFO_HEADER*, pwszProxyServer : Win32cr::Foundation::PWSTR, wProxyPort : UInt16) : Win32cr::Foundation::HRESULT

    fun SLGetServerStatus(pwszServerURL : Win32cr::Foundation::PWSTR, pwszAcquisitionType : Win32cr::Foundation::PWSTR, pwszProxyServer : Win32cr::Foundation::PWSTR, wProxyPort : UInt16, phrStatus : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT

    fun SLGenerateOfflineInstallationId(hSLC : Void*, pProductSkuId : LibC::GUID*, ppwszInstallationId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SLGenerateOfflineInstallationIdEx(hSLC : Void*, pProductSkuId : LibC::GUID*, pActivationInfo : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_INFO_HEADER*, ppwszInstallationId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SLDepositOfflineConfirmationId(hSLC : Void*, pProductSkuId : LibC::GUID*, pwszInstallationId : Win32cr::Foundation::PWSTR, pwszConfirmationId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SLDepositOfflineConfirmationIdEx(hSLC : Void*, pProductSkuId : LibC::GUID*, pActivationInfo : Win32cr::Security::Authentication::Identity::SL_ACTIVATION_INFO_HEADER*, pwszInstallationId : Win32cr::Foundation::PWSTR, pwszConfirmationId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SLGetPKeyId(hSLC : Void*, pwszPKeyAlgorithm : Win32cr::Foundation::PWSTR, pwszPKeyString : Win32cr::Foundation::PWSTR, cbPKeySpecificData : UInt32, pbPKeySpecificData : UInt8*, pPKeyId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLGetInstalledProductKeyIds(hSLC : Void*, pProductSkuId : LibC::GUID*, pnProductKeyIds : UInt32*, ppProductKeyIds : LibC::GUID**) : Win32cr::Foundation::HRESULT

    fun SLSetCurrentProductKey(hSLC : Void*, pProductSkuId : LibC::GUID*, pProductKeyId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLGetSLIDList(hSLC : Void*, eQueryIdType : Win32cr::Security::Authentication::Identity::SLIDTYPE, pQueryId : LibC::GUID*, eReturnIdType : Win32cr::Security::Authentication::Identity::SLIDTYPE, pnReturnIds : UInt32*, ppReturnIds : LibC::GUID**) : Win32cr::Foundation::HRESULT

    fun SLGetLicenseFileId(hSLC : Void*, cbLicenseBlob : UInt32, pbLicenseBlob : UInt8*, pLicenseFileId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLGetLicense(hSLC : Void*, pLicenseFileId : LibC::GUID*, pcbLicenseFile : UInt32*, ppbLicenseFile : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLFireEvent(hSLC : Void*, pwszEventId : Win32cr::Foundation::PWSTR, pApplicationId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    fun SLRegisterEvent(hSLC : Void*, pwszEventId : Win32cr::Foundation::PWSTR, pApplicationId : LibC::GUID*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun SLUnregisterEvent(hSLC : Void*, pwszEventId : Win32cr::Foundation::PWSTR, pApplicationId : LibC::GUID*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    fun SLGetWindowsInformation(pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLGetWindowsInformationDWORD(pwszValueName : Win32cr::Foundation::PWSTR, pdwValue : UInt32*) : Win32cr::Foundation::HRESULT

    fun SLIsGenuineLocal(pAppId : LibC::GUID*, pGenuineState : Win32cr::Security::Authentication::Identity::SL_GENUINE_STATE*, pUIOptions : Win32cr::Security::Authentication::Identity::SL_NONGENUINE_UI_OPTIONS*) : Win32cr::Foundation::HRESULT

    fun SLAcquireGenuineTicket(ppTicketBlob : Void**, pcbTicketBlob : UInt32*, pwszTemplateId : Win32cr::Foundation::PWSTR, pwszServerUrl : Win32cr::Foundation::PWSTR, pwszClientToken : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SLSetGenuineInformation(pQueryId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, eDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE, cbValue : UInt32, pbValue : UInt8*) : Win32cr::Foundation::HRESULT

    fun SLGetReferralInformation(hSLC : Void*, eReferralType : Win32cr::Security::Authentication::Identity::SLREFERRALTYPE, pSkuOrAppId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, ppwszValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    fun SLGetGenuineInformation(pQueryId : LibC::GUID*, pwszValueName : Win32cr::Foundation::PWSTR, peDataType : Win32cr::Security::Authentication::Identity::SLDATATYPE*, pcbValue : UInt32*, ppbValue : UInt8**) : Win32cr::Foundation::HRESULT

    fun SLQueryLicenseValueFromApp(valueName : Win32cr::Foundation::PWSTR, valueType : UInt32*, dataBuffer : Void*, dataSize : UInt32, resultDataSize : UInt32*) : Win32cr::Foundation::HRESULT

  end
end