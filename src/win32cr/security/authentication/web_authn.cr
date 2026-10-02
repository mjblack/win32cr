require "./../../foundation.cr"
require "./../../system/com.cr"

module Win32cr::Security::Authentication::WebAuthn
  extend self
  alias EXPERIMENTAL_WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK = Proc(Void*, Void)

  alias WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK = Proc(Void*, Void)

  WEBAUTHN_API_VERSION_1 = 1_u32
  WEBAUTHN_API_VERSION_2 = 2_u32
  WEBAUTHN_API_VERSION_3 = 3_u32
  WEBAUTHN_API_VERSION_4 = 4_u32
  WEBAUTHN_API_VERSION_5 = 5_u32
  WEBAUTHN_API_VERSION_6 = 6_u32
  WEBAUTHN_API_VERSION_7 = 7_u32
  WEBAUTHN_API_VERSION_8 = 8_u32
  WEBAUTHN_API_VERSION_9 = 9_u32
  WEBAUTHN_API_CURRENT_VERSION = 9_u32
  WEBAUTHN_RP_ENTITY_INFORMATION_VERSION_1 = 1_u32
  WEBAUTHN_RP_ENTITY_INFORMATION_CURRENT_VERSION = 1_u32
  WEBAUTHN_MAX_USER_ID_LENGTH = 64_u32
  WEBAUTHN_USER_ENTITY_INFORMATION_VERSION_1 = 1_u32
  WEBAUTHN_USER_ENTITY_INFORMATION_CURRENT_VERSION = 1_u32
  WEBAUTHN_HASH_ALGORITHM_SHA_256 = "SHA-256"
  WEBAUTHN_HASH_ALGORITHM_SHA_384 = "SHA-384"
  WEBAUTHN_HASH_ALGORITHM_SHA_512 = "SHA-512"
  WEBAUTHN_CLIENT_DATA_CURRENT_VERSION = 1_u32
  WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY = "public-key"
  WEBAUTHN_COSE_ALGORITHM_ECDSA_P256_WITH_SHA256 = -7_i32
  WEBAUTHN_COSE_ALGORITHM_ECDSA_P384_WITH_SHA384 = -35_i32
  WEBAUTHN_COSE_ALGORITHM_ECDSA_P521_WITH_SHA512 = -36_i32
  WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA256 = -257_i32
  WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA384 = -258_i32
  WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA512 = -259_i32
  WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA256 = -37_i32
  WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA384 = -38_i32
  WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA512 = -39_i32
  WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION = 1_u32
  WEBAUTHN_CREDENTIAL_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAP_TRANSPORT_USB = 1_u32
  WEBAUTHN_CTAP_TRANSPORT_NFC = 2_u32
  WEBAUTHN_CTAP_TRANSPORT_BLE = 4_u32
  WEBAUTHN_CTAP_TRANSPORT_TEST = 8_u32
  WEBAUTHN_CTAP_TRANSPORT_INTERNAL = 16_u32
  WEBAUTHN_CTAP_TRANSPORT_HYBRID = 32_u32
  WEBAUTHN_CTAP_TRANSPORT_SMART_CARD = 64_u32
  WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK = 127_u32
  WEBAUTHN_CTAP_TRANSPORT_USB_STRING = "usb"
  WEBAUTHN_CTAP_TRANSPORT_NFC_STRING = "nfc"
  WEBAUTHN_CTAP_TRANSPORT_BLE_STRING = "ble"
  WEBAUTHN_CTAP_TRANSPORT_SMART_CARD_STRING = "smart-card"
  WEBAUTHN_CTAP_TRANSPORT_HYBRID_STRING = "hybrid"
  WEBAUTHN_CTAP_TRANSPORT_INTERNAL_STRING = "internal"
  WEBAUTHN_CREDENTIAL_EX_CURRENT_VERSION = 1_u32
  CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_VERSION_1 = 1_u32
  CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_CURRENT_VERSION = 1_u32
  WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_VERSION_1 = 1_u32
  WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_CURRENT_VERSION = 1_u32
  WEBAUTHN_AUTHENTICATOR_DETAILS_VERSION_1 = 1_u32
  WEBAUTHN_AUTHENTICATOR_DETAILS_CURRENT_VERSION = 1_u32
  WEBAUTHN_CREDENTIAL_DETAILS_VERSION_1 = 1_u32
  WEBAUTHN_CREDENTIAL_DETAILS_VERSION_2 = 2_u32
  WEBAUTHN_CREDENTIAL_DETAILS_VERSION_3 = 3_u32
  WEBAUTHN_CREDENTIAL_DETAILS_VERSION_4 = 4_u32
  WEBAUTHN_CREDENTIAL_DETAILS_CURRENT_VERSION = 4_u32
  WEBAUTHN_GET_CREDENTIALS_OPTIONS_VERSION_1 = 1_u32
  WEBAUTHN_GET_CREDENTIALS_OPTIONS_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAP_ONE_HMAC_SECRET_LENGTH = 32_u32
  WEBAUTHN_EXTENSIONS_IDENTIFIER_HMAC_SECRET = "hmac-secret"
  WEBAUTHN_USER_VERIFICATION_ANY = 0_u32
  WEBAUTHN_USER_VERIFICATION_OPTIONAL = 1_u32
  WEBAUTHN_USER_VERIFICATION_OPTIONAL_WITH_CREDENTIAL_ID_LIST = 2_u32
  WEBAUTHN_USER_VERIFICATION_REQUIRED = 3_u32
  WEBAUTHN_EXTENSIONS_IDENTIFIER_CRED_PROTECT = "credProtect"
  WEBAUTHN_EXTENSIONS_IDENTIFIER_CRED_BLOB = "credBlob"
  WEBAUTHN_EXTENSIONS_IDENTIFIER_MIN_PIN_LENGTH = "minPinLength"
  WEBAUTHN_AUTHENTICATOR_ATTACHMENT_ANY = 0_u32
  WEBAUTHN_AUTHENTICATOR_ATTACHMENT_PLATFORM = 1_u32
  WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM = 2_u32
  WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM_U2F_V2 = 3_u32
  WEBAUTHN_USER_VERIFICATION_REQUIREMENT_ANY = 0_u32
  WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED = 1_u32
  WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED = 2_u32
  WEBAUTHN_USER_VERIFICATION_REQUIREMENT_DISCOURAGED = 3_u32
  WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_ANY = 0_u32
  WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_NONE = 1_u32
  WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_INDIRECT = 2_u32
  WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT = 3_u32
  WEBAUTHN_ENTERPRISE_ATTESTATION_NONE = 0_u32
  WEBAUTHN_ENTERPRISE_ATTESTATION_VENDOR_FACILITATED = 1_u32
  WEBAUTHN_ENTERPRISE_ATTESTATION_PLATFORM_MANAGED = 2_u32
  WEBAUTHN_LARGE_BLOB_SUPPORT_NONE = 0_u32
  WEBAUTHN_LARGE_BLOB_SUPPORT_REQUIRED = 1_u32
  WEBAUTHN_LARGE_BLOB_SUPPORT_PREFERRED = 2_u32
  WEBAUTHN_CREDENTIAL_HINT_SECURITY_KEY = "security-key"
  WEBAUTHN_CREDENTIAL_HINT_CLIENT_DEVICE = "client-device"
  WEBAUTHN_CREDENTIAL_HINT_HYBRID = "hybrid"
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_1 = 1_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_2 = 2_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_3 = 3_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_4 = 4_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_5 = 5_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_6 = 6_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_7 = 7_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_8 = 8_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_9 = 9_u32
  WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_CURRENT_VERSION = 9_u32
  WEBAUTHN_CRED_LARGE_BLOB_OPERATION_NONE = 0_u32
  WEBAUTHN_CRED_LARGE_BLOB_OPERATION_GET = 1_u32
  WEBAUTHN_CRED_LARGE_BLOB_OPERATION_SET = 2_u32
  WEBAUTHN_CRED_LARGE_BLOB_OPERATION_DELETE = 3_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_1 = 1_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_2 = 2_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_3 = 3_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_4 = 4_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_5 = 5_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_6 = 6_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_7 = 7_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_8 = 8_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_9 = 9_u32
  WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_CURRENT_VERSION = 9_u32
  WEBAUTHN_AUTHENTICATOR_HMAC_SECRET_VALUES_FLAG = 1048576_u32
  WEBAUTHN_ATTESTATION_DECODE_NONE = 0_u32
  WEBAUTHN_ATTESTATION_DECODE_COMMON = 1_u32
  WEBAUTHN_ATTESTATION_VER_TPM_2_0 = "2.0"
  WEBAUTHN_COMMON_ATTESTATION_CURRENT_VERSION = 1_u32
  WEBAUTHN_ATTESTATION_TYPE_PACKED = "packed"
  WEBAUTHN_ATTESTATION_TYPE_U2F = "fido-u2f"
  WEBAUTHN_ATTESTATION_TYPE_TPM = "tpm"
  WEBAUTHN_ATTESTATION_TYPE_NONE = "none"
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_1 = 1_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_2 = 2_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_3 = 3_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_4 = 4_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_5 = 5_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_6 = 6_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_7 = 7_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_8 = 8_u32
  WEBAUTHN_CREDENTIAL_ATTESTATION_CURRENT_VERSION = 8_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_NONE = 0_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_SUCCESS = 1_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_SUPPORTED = 2_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_DATA = 3_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_PARAMETER = 4_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_FOUND = 5_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_MULTIPLE_CREDENTIALS = 6_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_LACK_OF_SPACE = 7_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_PLATFORM_ERROR = 8_u32
  WEBAUTHN_CRED_LARGE_BLOB_STATUS_AUTHENTICATOR_ERROR = 9_u32
  WEBAUTHN_ASSERTION_VERSION_1 = 1_u32
  WEBAUTHN_ASSERTION_VERSION_2 = 2_u32
  WEBAUTHN_ASSERTION_VERSION_3 = 3_u32
  WEBAUTHN_ASSERTION_VERSION_4 = 4_u32
  WEBAUTHN_ASSERTION_VERSION_5 = 5_u32
  WEBAUTHN_ASSERTION_VERSION_6 = 6_u32
  WEBAUTHN_ASSERTION_CURRENT_VERSION = 6_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 = 1_u32
  EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 = 1_u32
  WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 = 1_u32
  WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 = 1_u32
  WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 = 1_u32
  WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION = 1_u32
  WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 = 1_u32
  WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION = 1_u32

  enum EXPERIMENTAL_PLUGIN_AUTHENTICATOR_STATE
    PluginAuthenticatorState_Unknown = 0_i32
    PluginAuthenticatorState_Disabled = 1_i32
    PluginAuthenticatorState_Enabled = 2_i32
  end
  enum EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE
    PerformUv = 1_i32
    GetUvCount = 2_i32
    GetPubKey = 3_i32
  end
  enum AUTHENTICATOR_STATE
    AuthenticatorState_Disabled = 0_i32
    AuthenticatorState_Enabled = 1_i32
  end
  enum WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE
    PerformUserVerification = 1_i32
    GetUserVerificationCount = 2_i32
    GetPublicKey = 3_i32
  end
  enum WEBAUTHN_PLUGIN_REQUEST_TYPE
    WEBAUTHN_PLUGIN_REQUEST_TYPE_CTAP2_CBOR = 1_i32
  end
  enum PLUGIN_LOCK_STATUS
    PluginLocked = 0_i32
    PluginUnlocked = 1_i32
  end

  @[Extern]
  struct WEBAUTHN_RP_ENTITY_INFORMATION
    property dwVersion : UInt32
    property pwszId : Win32cr::Foundation::PWSTR
    property pwszName : Win32cr::Foundation::PWSTR
    property pwszIcon : Win32cr::Foundation::PWSTR
    def initialize(@dwVersion : UInt32, @pwszId : Win32cr::Foundation::PWSTR, @pwszName : Win32cr::Foundation::PWSTR, @pwszIcon : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_USER_ENTITY_INFORMATION
    property dwVersion : UInt32
    property cbId : UInt32
    property pbId : UInt8*
    property pwszName : Win32cr::Foundation::PWSTR
    property pwszIcon : Win32cr::Foundation::PWSTR
    property pwszDisplayName : Win32cr::Foundation::PWSTR
    def initialize(@dwVersion : UInt32, @cbId : UInt32, @pbId : UInt8*, @pwszName : Win32cr::Foundation::PWSTR, @pwszIcon : Win32cr::Foundation::PWSTR, @pwszDisplayName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_CLIENT_DATA
    property dwVersion : UInt32
    property cbClientDataJSON : UInt32
    property pbClientDataJSON : UInt8*
    property pwszHashAlgId : Win32cr::Foundation::PWSTR
    def initialize(@dwVersion : UInt32, @cbClientDataJSON : UInt32, @pbClientDataJSON : UInt8*, @pwszHashAlgId : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_COSE_CREDENTIAL_PARAMETER
    property dwVersion : UInt32
    property pwszCredentialType : Win32cr::Foundation::PWSTR
    property lAlg : Int32
    def initialize(@dwVersion : UInt32, @pwszCredentialType : Win32cr::Foundation::PWSTR, @lAlg : Int32)
    end
  end

  @[Extern]
  struct WEBAUTHN_COSE_CREDENTIAL_PARAMETERS
    property cCredentialParameters : UInt32
    property pCredentialParameters : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETER*
    def initialize(@cCredentialParameters : UInt32, @pCredentialParameters : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETER*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIAL
    property dwVersion : UInt32
    property cbId : UInt32
    property pbId : UInt8*
    property pwszCredentialType : Win32cr::Foundation::PWSTR
    def initialize(@dwVersion : UInt32, @cbId : UInt32, @pbId : UInt8*, @pwszCredentialType : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIALS
    property cCredentials : UInt32
    property pCredentials : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL*
    def initialize(@cCredentials : UInt32, @pCredentials : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIAL_EX
    property dwVersion : UInt32
    property cbId : UInt32
    property pbId : UInt8*
    property pwszCredentialType : Win32cr::Foundation::PWSTR
    property dwTransports : UInt32
    def initialize(@dwVersion : UInt32, @cbId : UInt32, @pbId : UInt8*, @pwszCredentialType : Win32cr::Foundation::PWSTR, @dwTransports : UInt32)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIAL_LIST
    property cCredentials : UInt32
    property ppCredentials : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_EX**
    def initialize(@cCredentials : UInt32, @ppCredentials : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_EX**)
    end
  end

  @[Extern]
  struct CTAPCBOR_HYBRID_STORAGE_LINKED_DATA
    property dwVersion : UInt32
    property cbContactId : UInt32
    property pbContactId : UInt8*
    property cbLinkId : UInt32
    property pbLinkId : UInt8*
    property cbLinkSecret : UInt32
    property pbLinkSecret : UInt8*
    property cbPublicKey : UInt32
    property pbPublicKey : UInt8*
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property wEncodedTunnelServerDomain : UInt16
    def initialize(@dwVersion : UInt32, @cbContactId : UInt32, @pbContactId : UInt8*, @cbLinkId : UInt32, @pbLinkId : UInt8*, @cbLinkSecret : UInt32, @pbLinkSecret : UInt8*, @cbPublicKey : UInt32, @pbPublicKey : UInt8*, @pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @wEncodedTunnelServerDomain : UInt16)
    end
  end

  @[Extern]
  struct WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS
    property dwVersion : UInt32
    def initialize(@dwVersion : UInt32)
    end
  end

  @[Extern]
  struct WEBAUTHN_AUTHENTICATOR_DETAILS
    property dwVersion : UInt32
    property cbAuthenticatorId : UInt32
    property pbAuthenticatorId : UInt8*
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property cbAuthenticatorLogo : UInt32
    property pbAuthenticatorLogo : UInt8*
    property bLocked : Win32cr::Foundation::BOOL
    def initialize(@dwVersion : UInt32, @cbAuthenticatorId : UInt32, @pbAuthenticatorId : UInt8*, @pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @cbAuthenticatorLogo : UInt32, @pbAuthenticatorLogo : UInt8*, @bLocked : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WEBAUTHN_AUTHENTICATOR_DETAILS_LIST
    property cAuthenticatorDetails : UInt32
    property ppAuthenticatorDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS**
    def initialize(@cAuthenticatorDetails : UInt32, @ppAuthenticatorDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS**)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIAL_DETAILS
    property dwVersion : UInt32
    property cbCredentialID : UInt32
    property pbCredentialID : UInt8*
    property pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*
    property pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*
    property bRemovable : Win32cr::Foundation::BOOL
    property bBackedUp : Win32cr::Foundation::BOOL
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property cbAuthenticatorLogo : UInt32
    property pbAuthenticatorLogo : UInt8*
    property bThirdPartyPayment : Win32cr::Foundation::BOOL
    property dwTransports : UInt32
    def initialize(@dwVersion : UInt32, @cbCredentialID : UInt32, @pbCredentialID : UInt8*, @pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*, @pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, @bRemovable : Win32cr::Foundation::BOOL, @bBackedUp : Win32cr::Foundation::BOOL, @pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @cbAuthenticatorLogo : UInt32, @pbAuthenticatorLogo : UInt8*, @bThirdPartyPayment : Win32cr::Foundation::BOOL, @dwTransports : UInt32)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIAL_DETAILS_LIST
    property cCredentialDetails : UInt32
    property ppCredentialDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_DETAILS**
    def initialize(@cCredentialDetails : UInt32, @ppCredentialDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_DETAILS**)
    end
  end

  @[Extern]
  struct WEBAUTHN_GET_CREDENTIALS_OPTIONS
    property dwVersion : UInt32
    property pwszRpId : Win32cr::Foundation::PWSTR
    property bBrowserInPrivateMode : Win32cr::Foundation::BOOL
    def initialize(@dwVersion : UInt32, @pwszRpId : Win32cr::Foundation::PWSTR, @bBrowserInPrivateMode : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WEBAUTHN_HMAC_SECRET_SALT
    property cbFirst : UInt32
    property pbFirst : UInt8*
    property cbSecond : UInt32
    property pbSecond : UInt8*
    def initialize(@cbFirst : UInt32, @pbFirst : UInt8*, @cbSecond : UInt32, @pbSecond : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT
    property cbCredID : UInt32
    property pbCredID : UInt8*
    property pHmacSecretSalt : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*
    def initialize(@cbCredID : UInt32, @pbCredID : UInt8*, @pHmacSecretSalt : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*)
    end
  end

  @[Extern]
  struct WEBAUTHN_HMAC_SECRET_SALT_VALUES
    property pGlobalHmacSalt : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*
    property cCredWithHmacSecretSaltList : UInt32
    property pCredWithHmacSecretSaltList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT*
    def initialize(@pGlobalHmacSalt : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*, @cCredWithHmacSecretSaltList : UInt32, @pCredWithHmacSecretSaltList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CRED_PROTECT_EXTENSION_IN
    property dwCredProtect : UInt32
    property bRequireCredProtect : Win32cr::Foundation::BOOL
    def initialize(@dwCredProtect : UInt32, @bRequireCredProtect : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct WEBAUTHN_CRED_BLOB_EXTENSION
    property cbCredBlob : UInt32
    property pbCredBlob : UInt8*
    def initialize(@cbCredBlob : UInt32, @pbCredBlob : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_EXTENSION
    property pwszExtensionIdentifier : Win32cr::Foundation::PWSTR
    property cbExtension : UInt32
    property pvExtension : Void*
    def initialize(@pwszExtensionIdentifier : Win32cr::Foundation::PWSTR, @cbExtension : UInt32, @pvExtension : Void*)
    end
  end

  @[Extern]
  struct WEBAUTHN_EXTENSIONS
    property cExtensions : UInt32
    property pExtensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSION*
    def initialize(@cExtensions : UInt32, @pExtensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSION*)
    end
  end

  @[Extern]
  struct WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS
    property dwVersion : UInt32
    property dwTimeoutMilliseconds : UInt32
    property credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIALS
    property extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS
    property dwAuthenticatorAttachment : UInt32
    property bRequireResidentKey : Win32cr::Foundation::BOOL
    property dwUserVerificationRequirement : UInt32
    property dwAttestationConveyancePreference : UInt32
    property dwFlags : UInt32
    property pCancellationId : LibC::GUID*
    property pExcludeCredentialList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST*
    property dwEnterpriseAttestation : UInt32
    property dwLargeBlobSupport : UInt32
    property bPreferResidentKey : Win32cr::Foundation::BOOL
    property bBrowserInPrivateMode : Win32cr::Foundation::BOOL
    property bEnablePrf : Win32cr::Foundation::BOOL
    property pLinkedDevice : Win32cr::Security::Authentication::WebAuthn::CTAPCBOR_HYBRID_STORAGE_LINKED_DATA*
    property cbJsonExt : UInt32
    property pbJsonExt : UInt8*
    property pPRFGlobalEval : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*
    property cCredentialHints : UInt32
    property ppwszCredentialHints : Win32cr::Foundation::PWSTR*
    property bThirdPartyPayment : Win32cr::Foundation::BOOL
    property pwszRemoteWebOrigin : Win32cr::Foundation::PWSTR
    property cbPublicKeyCredentialCreationOptionsJSON : UInt32
    property pbPublicKeyCredentialCreationOptionsJSON : UInt8*
    property cbAuthenticatorId : UInt32
    property pbAuthenticatorId : UInt8*
    def initialize(@dwVersion : UInt32, @dwTimeoutMilliseconds : UInt32, @credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIALS, @extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS, @dwAuthenticatorAttachment : UInt32, @bRequireResidentKey : Win32cr::Foundation::BOOL, @dwUserVerificationRequirement : UInt32, @dwAttestationConveyancePreference : UInt32, @dwFlags : UInt32, @pCancellationId : LibC::GUID*, @pExcludeCredentialList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST*, @dwEnterpriseAttestation : UInt32, @dwLargeBlobSupport : UInt32, @bPreferResidentKey : Win32cr::Foundation::BOOL, @bBrowserInPrivateMode : Win32cr::Foundation::BOOL, @bEnablePrf : Win32cr::Foundation::BOOL, @pLinkedDevice : Win32cr::Security::Authentication::WebAuthn::CTAPCBOR_HYBRID_STORAGE_LINKED_DATA*, @cbJsonExt : UInt32, @pbJsonExt : UInt8*, @pPRFGlobalEval : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*, @cCredentialHints : UInt32, @ppwszCredentialHints : Win32cr::Foundation::PWSTR*, @bThirdPartyPayment : Win32cr::Foundation::BOOL, @pwszRemoteWebOrigin : Win32cr::Foundation::PWSTR, @cbPublicKeyCredentialCreationOptionsJSON : UInt32, @pbPublicKeyCredentialCreationOptionsJSON : UInt8*, @cbAuthenticatorId : UInt32, @pbAuthenticatorId : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS
    property dwVersion : UInt32
    property dwTimeoutMilliseconds : UInt32
    property credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIALS
    property extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS
    property dwAuthenticatorAttachment : UInt32
    property dwUserVerificationRequirement : UInt32
    property dwFlags : UInt32
    property pwszU2fAppId : Win32cr::Foundation::PWSTR
    property pbU2fAppId : Win32cr::Foundation::BOOL*
    property pCancellationId : LibC::GUID*
    property pAllowCredentialList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST*
    property dwCredLargeBlobOperation : UInt32
    property cbCredLargeBlob : UInt32
    property pbCredLargeBlob : UInt8*
    property pHmacSecretSaltValues : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT_VALUES*
    property bBrowserInPrivateMode : Win32cr::Foundation::BOOL
    property pLinkedDevice : Win32cr::Security::Authentication::WebAuthn::CTAPCBOR_HYBRID_STORAGE_LINKED_DATA*
    property bAutoFill : Win32cr::Foundation::BOOL
    property cbJsonExt : UInt32
    property pbJsonExt : UInt8*
    property cCredentialHints : UInt32
    property ppwszCredentialHints : Win32cr::Foundation::PWSTR*
    property pwszRemoteWebOrigin : Win32cr::Foundation::PWSTR
    property cbPublicKeyCredentialRequestOptionsJSON : UInt32
    property pbPublicKeyCredentialRequestOptionsJSON : UInt8*
    property cbAuthenticatorId : UInt32
    property pbAuthenticatorId : UInt8*
    def initialize(@dwVersion : UInt32, @dwTimeoutMilliseconds : UInt32, @credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIALS, @extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS, @dwAuthenticatorAttachment : UInt32, @dwUserVerificationRequirement : UInt32, @dwFlags : UInt32, @pwszU2fAppId : Win32cr::Foundation::PWSTR, @pbU2fAppId : Win32cr::Foundation::BOOL*, @pCancellationId : LibC::GUID*, @pAllowCredentialList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST*, @dwCredLargeBlobOperation : UInt32, @cbCredLargeBlob : UInt32, @pbCredLargeBlob : UInt8*, @pHmacSecretSaltValues : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT_VALUES*, @bBrowserInPrivateMode : Win32cr::Foundation::BOOL, @pLinkedDevice : Win32cr::Security::Authentication::WebAuthn::CTAPCBOR_HYBRID_STORAGE_LINKED_DATA*, @bAutoFill : Win32cr::Foundation::BOOL, @cbJsonExt : UInt32, @pbJsonExt : UInt8*, @cCredentialHints : UInt32, @ppwszCredentialHints : Win32cr::Foundation::PWSTR*, @pwszRemoteWebOrigin : Win32cr::Foundation::PWSTR, @cbPublicKeyCredentialRequestOptionsJSON : UInt32, @pbPublicKeyCredentialRequestOptionsJSON : UInt8*, @cbAuthenticatorId : UInt32, @pbAuthenticatorId : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_X5C
    property cbData : UInt32
    property pbData : UInt8*
    def initialize(@cbData : UInt32, @pbData : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_COMMON_ATTESTATION
    property dwVersion : UInt32
    property pwszAlg : Win32cr::Foundation::PWSTR
    property lAlg : Int32
    property cbSignature : UInt32
    property pbSignature : UInt8*
    property cX5c : UInt32
    property pX5c : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_X5C*
    property pwszVer : Win32cr::Foundation::PWSTR
    property cbCertInfo : UInt32
    property pbCertInfo : UInt8*
    property cbPubArea : UInt32
    property pbPubArea : UInt8*
    def initialize(@dwVersion : UInt32, @pwszAlg : Win32cr::Foundation::PWSTR, @lAlg : Int32, @cbSignature : UInt32, @pbSignature : UInt8*, @cX5c : UInt32, @pX5c : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_X5C*, @pwszVer : Win32cr::Foundation::PWSTR, @cbCertInfo : UInt32, @pbCertInfo : UInt8*, @cbPubArea : UInt32, @pbPubArea : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CREDENTIAL_ATTESTATION
    property dwVersion : UInt32
    property pwszFormatType : Win32cr::Foundation::PWSTR
    property cbAuthenticatorData : UInt32
    property pbAuthenticatorData : UInt8*
    property cbAttestation : UInt32
    property pbAttestation : UInt8*
    property dwAttestationDecodeType : UInt32
    property pvAttestationDecode : Void*
    property cbAttestationObject : UInt32
    property pbAttestationObject : UInt8*
    property cbCredentialId : UInt32
    property pbCredentialId : UInt8*
    property extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS
    property dwUsedTransport : UInt32
    property bEpAtt : Win32cr::Foundation::BOOL
    property bLargeBlobSupported : Win32cr::Foundation::BOOL
    property bResidentKey : Win32cr::Foundation::BOOL
    property bPrfEnabled : Win32cr::Foundation::BOOL
    property cbUnsignedExtensionOutputs : UInt32
    property pbUnsignedExtensionOutputs : UInt8*
    property pHmacSecret : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*
    property bThirdPartyPayment : Win32cr::Foundation::BOOL
    property dwTransports : UInt32
    property cbClientDataJSON : UInt32
    property pbClientDataJSON : UInt8*
    property cbRegistrationResponseJSON : UInt32
    property pbRegistrationResponseJSON : UInt8*
    def initialize(@dwVersion : UInt32, @pwszFormatType : Win32cr::Foundation::PWSTR, @cbAuthenticatorData : UInt32, @pbAuthenticatorData : UInt8*, @cbAttestation : UInt32, @pbAttestation : UInt8*, @dwAttestationDecodeType : UInt32, @pvAttestationDecode : Void*, @cbAttestationObject : UInt32, @pbAttestationObject : UInt8*, @cbCredentialId : UInt32, @pbCredentialId : UInt8*, @extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS, @dwUsedTransport : UInt32, @bEpAtt : Win32cr::Foundation::BOOL, @bLargeBlobSupported : Win32cr::Foundation::BOOL, @bResidentKey : Win32cr::Foundation::BOOL, @bPrfEnabled : Win32cr::Foundation::BOOL, @cbUnsignedExtensionOutputs : UInt32, @pbUnsignedExtensionOutputs : UInt8*, @pHmacSecret : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*, @bThirdPartyPayment : Win32cr::Foundation::BOOL, @dwTransports : UInt32, @cbClientDataJSON : UInt32, @pbClientDataJSON : UInt8*, @cbRegistrationResponseJSON : UInt32, @pbRegistrationResponseJSON : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_ASSERTION
    property dwVersion : UInt32
    property cbAuthenticatorData : UInt32
    property pbAuthenticatorData : UInt8*
    property cbSignature : UInt32
    property pbSignature : UInt8*
    property credential : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL
    property cbUserId : UInt32
    property pbUserId : UInt8*
    property extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS
    property cbCredLargeBlob : UInt32
    property pbCredLargeBlob : UInt8*
    property dwCredLargeBlobStatus : UInt32
    property pHmacSecret : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*
    property dwUsedTransport : UInt32
    property cbUnsignedExtensionOutputs : UInt32
    property pbUnsignedExtensionOutputs : UInt8*
    property cbClientDataJSON : UInt32
    property pbClientDataJSON : UInt8*
    property cbAuthenticationResponseJSON : UInt32
    property pbAuthenticationResponseJSON : UInt8*
    def initialize(@dwVersion : UInt32, @cbAuthenticatorData : UInt32, @pbAuthenticatorData : UInt8*, @cbSignature : UInt32, @pbSignature : UInt8*, @credential : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL, @cbUserId : UInt32, @pbUserId : UInt8*, @extensions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_EXTENSIONS, @cbCredLargeBlob : UInt32, @pbCredLargeBlob : UInt8*, @dwCredLargeBlobStatus : UInt32, @pHmacSecret : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_HMAC_SECRET_SALT*, @dwUsedTransport : UInt32, @cbUnsignedExtensionOutputs : UInt32, @pbUnsignedExtensionOutputs : UInt8*, @cbClientDataJSON : UInt32, @pbClientDataJSON : UInt8*, @cbAuthenticationResponseJSON : UInt32, @pbAuthenticationResponseJSON : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property pwszPluginClsId : Win32cr::Foundation::PWSTR
    property pwszPluginRpId : Win32cr::Foundation::PWSTR
    property pwszLightThemeLogo : Win32cr::Foundation::PWSTR
    property pwszDarkThemeLogo : Win32cr::Foundation::PWSTR
    property cbAuthenticatorInfo : UInt32
    property pbAuthenticatorInfo : UInt8*
    def initialize(@pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @pwszPluginClsId : Win32cr::Foundation::PWSTR, @pwszPluginRpId : Win32cr::Foundation::PWSTR, @pwszLightThemeLogo : Win32cr::Foundation::PWSTR, @pwszDarkThemeLogo : Win32cr::Foundation::PWSTR, @cbAuthenticatorInfo : UInt32, @pbAuthenticatorInfo : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE
    property cbOpSignPubKey : UInt32
    property pbOpSignPubKey : UInt8*
    def initialize(@cbOpSignPubKey : UInt32, @pbOpSignPubKey : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property pwszPluginClsId : Win32cr::Foundation::PWSTR
    property pwszNewPluginClsId : Win32cr::Foundation::PWSTR
    property pwszLightThemeLogo : Win32cr::Foundation::PWSTR
    property pwszDarkThemeLogo : Win32cr::Foundation::PWSTR
    property cbAuthenticatorInfo : UInt32
    property pbAuthenticatorInfo : UInt8*
    def initialize(@pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @pwszPluginClsId : Win32cr::Foundation::PWSTR, @pwszNewPluginClsId : Win32cr::Foundation::PWSTR, @pwszLightThemeLogo : Win32cr::Foundation::PWSTR, @pwszDarkThemeLogo : Win32cr::Foundation::PWSTR, @cbAuthenticatorInfo : UInt32, @pbAuthenticatorInfo : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS
    property cbCredentialId : UInt32
    property pbCredentialId : UInt8*
    property pwszRpId : Win32cr::Foundation::PWSTR
    property pwszRpName : Win32cr::Foundation::PWSTR
    property cbUserId : UInt32
    property pbUserId : UInt8*
    property pwszUserName : Win32cr::Foundation::PWSTR
    property pwszUserDisplayName : Win32cr::Foundation::PWSTR
    def initialize(@cbCredentialId : UInt32, @pbCredentialId : UInt8*, @pwszRpId : Win32cr::Foundation::PWSTR, @pwszRpName : Win32cr::Foundation::PWSTR, @cbUserId : UInt32, @pbUserId : UInt8*, @pwszUserName : Win32cr::Foundation::PWSTR, @pwszUserDisplayName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS_LIST
    property pwszPluginClsId : Win32cr::Foundation::PWSTR
    property cCredentialDetails : UInt32
    property pCredentialDetails : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS**
    def initialize(@pwszPluginClsId : Win32cr::Foundation::PWSTR, @cCredentialDetails : UInt32, @pCredentialDetails : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS**)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV
    property hwnd : Win32cr::Foundation::HWND
    property transactionId : LibC::GUID*
    property type__ : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE
    property pwszUsername : Win32cr::Foundation::PWSTR
    property pwszContext : Win32cr::Foundation::PWSTR
    def initialize(@hwnd : Win32cr::Foundation::HWND, @transactionId : LibC::GUID*, @type__ : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE, @pwszUsername : Win32cr::Foundation::PWSTR, @pwszContext : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_RESPONSE
    property cbResponse : UInt32
    property pbResponse : UInt8*
    def initialize(@cbResponse : UInt32, @pbResponse : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS
    property dwVersion : UInt32
    property lUp : Int32
    property lUv : Int32
    property lRequireResidentKey : Int32
    def initialize(@dwVersion : UInt32, @lUp : Int32, @lUv : Int32, @lRequireResidentKey : Int32)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY
    property dwVersion : UInt32
    property lKty : Int32
    property lAlg : Int32
    property lCrv : Int32
    property cbX : UInt32
    property pbX : UInt8*
    property cbY : UInt32
    property pbY : UInt8*
    def initialize(@dwVersion : UInt32, @lKty : Int32, @lAlg : Int32, @lCrv : Int32, @cbX : UInt32, @pbX : UInt8*, @cbY : UInt32, @pbY : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION
    property dwVersion : UInt32
    property pKeyAgreement : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY*
    property cbEncryptedSalt : UInt32
    property pbEncryptedSalt : UInt8*
    property cbSaltAuth : UInt32
    property pbSaltAuth : UInt8*
    def initialize(@dwVersion : UInt32, @pKeyAgreement : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY*, @cbEncryptedSalt : UInt32, @pbEncryptedSalt : UInt8*, @cbSaltAuth : UInt32, @pbSaltAuth : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST
    property dwVersion : UInt32
    property cbRpId : UInt32
    property pbRpId : UInt8*
    property cbClientDataHash : UInt32
    property pbClientDataHash : UInt8*
    property pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*
    property pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*
    property web_auth_n_credential_parameters : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETERS
    property credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST
    property cbCborExtensionsMap : UInt32
    property pbCborExtensionsMap : UInt8*
    property pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*
    property fEmptyPinAuth : Win32cr::Foundation::BOOL
    property cbPinAuth : UInt32
    property pbPinAuth : UInt8*
    property lHmacSecretExt : Int32
    property pHmacSecretMcExtension : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*
    property lPrfExt : Int32
    property cbHmacSecretSaltValues : UInt32
    property pbHmacSecretSaltValues : UInt8*
    property dwCredProtect : UInt32
    property dwPinProtocol : UInt32
    property dwEnterpriseAttestation : UInt32
    property cbCredBlobExt : UInt32
    property pbCredBlobExt : UInt8*
    property lLargeBlobKeyExt : Int32
    property dwLargeBlobSupport : UInt32
    property lMinPinLengthExt : Int32
    property cbJsonExt : UInt32
    property pbJsonExt : UInt8*
    def initialize(@dwVersion : UInt32, @cbRpId : UInt32, @pbRpId : UInt8*, @cbClientDataHash : UInt32, @pbClientDataHash : UInt8*, @pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*, @pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, @web_auth_n_credential_parameters : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETERS, @credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST, @cbCborExtensionsMap : UInt32, @pbCborExtensionsMap : UInt8*, @pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*, @fEmptyPinAuth : Win32cr::Foundation::BOOL, @cbPinAuth : UInt32, @pbPinAuth : UInt8*, @lHmacSecretExt : Int32, @pHmacSecretMcExtension : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*, @lPrfExt : Int32, @cbHmacSecretSaltValues : UInt32, @pbHmacSecretSaltValues : UInt8*, @dwCredProtect : UInt32, @dwPinProtocol : UInt32, @dwEnterpriseAttestation : UInt32, @cbCredBlobExt : UInt32, @pbCredBlobExt : UInt8*, @lLargeBlobKeyExt : Int32, @dwLargeBlobSupport : UInt32, @lMinPinLengthExt : Int32, @cbJsonExt : UInt32, @pbJsonExt : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST
    property dwVersion : UInt32
    property pwszRpId : Win32cr::Foundation::PWSTR
    property cbRpId : UInt32
    property pbRpId : UInt8*
    property cbClientDataHash : UInt32
    property pbClientDataHash : UInt8*
    property credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST
    property cbCborExtensionsMap : UInt32
    property pbCborExtensionsMap : UInt8*
    property pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*
    property fEmptyPinAuth : Win32cr::Foundation::BOOL
    property cbPinAuth : UInt32
    property pbPinAuth : UInt8*
    property pHmacSaltExtension : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*
    property cbHmacSecretSaltValues : UInt32
    property pbHmacSecretSaltValues : UInt8*
    property dwPinProtocol : UInt32
    property lCredBlobExt : Int32
    property lLargeBlobKeyExt : Int32
    property dwCredLargeBlobOperation : UInt32
    property cbCredLargeBlobCompressed : UInt32
    property pbCredLargeBlobCompressed : UInt8*
    property dwCredLargeBlobOriginalSize : UInt32
    property cbJsonExt : UInt32
    property pbJsonExt : UInt8*
    def initialize(@dwVersion : UInt32, @pwszRpId : Win32cr::Foundation::PWSTR, @cbRpId : UInt32, @pbRpId : UInt8*, @cbClientDataHash : UInt32, @pbClientDataHash : UInt8*, @credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST, @cbCborExtensionsMap : UInt32, @pbCborExtensionsMap : UInt8*, @pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*, @fEmptyPinAuth : Win32cr::Foundation::BOOL, @cbPinAuth : UInt32, @pbPinAuth : UInt8*, @pHmacSaltExtension : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*, @cbHmacSecretSaltValues : UInt32, @pbHmacSecretSaltValues : UInt8*, @dwPinProtocol : UInt32, @lCredBlobExt : Int32, @lLargeBlobKeyExt : Int32, @dwCredLargeBlobOperation : UInt32, @cbCredLargeBlobCompressed : UInt32, @pbCredLargeBlobCompressed : UInt8*, @dwCredLargeBlobOriginalSize : UInt32, @cbJsonExt : UInt32, @pbJsonExt : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE
    property web_auth_n_assertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION
    property pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*
    property dwNumberOfCredentials : UInt32
    property lUserSelected : Int32
    property cbLargeBlobKey : UInt32
    property pbLargeBlobKey : UInt8*
    property cbUnsignedExtensionOutputs : UInt32
    property pbUnsignedExtensionOutputs : UInt8*
    def initialize(@web_auth_n_assertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION, @pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, @dwNumberOfCredentials : UInt32, @lUserSelected : Int32, @cbLargeBlobKey : UInt32, @pbLargeBlobKey : UInt8*, @cbUnsignedExtensionOutputs : UInt32, @pbUnsignedExtensionOutputs : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property rclsid : LibC::GUID*
    property pwszPluginRpId : Win32cr::Foundation::PWSTR
    property pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR
    property pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR
    property cbAuthenticatorInfo : UInt32
    property pbAuthenticatorInfo : UInt8*
    property cSupportedRpIds : UInt32
    property ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*
    def initialize(@pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @rclsid : LibC::GUID*, @pwszPluginRpId : Win32cr::Foundation::PWSTR, @pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR, @pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR, @cbAuthenticatorInfo : UInt32, @pbAuthenticatorInfo : UInt8*, @cSupportedRpIds : UInt32, @ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS_2
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property pClsid : LibC::GUID*
    property pwszPluginRpId : Win32cr::Foundation::PWSTR
    property pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR
    property pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR
    property cbAuthenticatorInfo : UInt32
    property pbAuthenticatorInfo : UInt8*
    property cSupportedRpIds : UInt32
    property ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*
    property pwszUserVerificationKeyName : Win32cr::Foundation::PWSTR
    def initialize(@pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @pClsid : LibC::GUID*, @pwszPluginRpId : Win32cr::Foundation::PWSTR, @pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR, @pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR, @cbAuthenticatorInfo : UInt32, @pbAuthenticatorInfo : UInt8*, @cSupportedRpIds : UInt32, @ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*, @pwszUserVerificationKeyName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE
    property cbOpSignPubKey : UInt32
    property pbOpSignPubKey : UInt8*
    def initialize(@cbOpSignPubKey : UInt32, @pbOpSignPubKey : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property rclsid : LibC::GUID*
    property rclsidNew : LibC::GUID*
    property pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR
    property pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR
    property cbAuthenticatorInfo : UInt32
    property pbAuthenticatorInfo : UInt8*
    property cSupportedRpIds : UInt32
    property ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*
    def initialize(@pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @rclsid : LibC::GUID*, @rclsidNew : LibC::GUID*, @pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR, @pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR, @cbAuthenticatorInfo : UInt32, @pbAuthenticatorInfo : UInt8*, @cSupportedRpIds : UInt32, @ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS_2
    property pwszAuthenticatorName : Win32cr::Foundation::PWSTR
    property pClsid : LibC::GUID*
    property pClsidNew : LibC::GUID*
    property pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR
    property pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR
    property cbAuthenticatorInfo : UInt32
    property pbAuthenticatorInfo : UInt8*
    property cSupportedRpIds : UInt32
    property ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*
    property pwszUserVerificationKeyName : Win32cr::Foundation::PWSTR
    def initialize(@pwszAuthenticatorName : Win32cr::Foundation::PWSTR, @pClsid : LibC::GUID*, @pClsidNew : LibC::GUID*, @pwszLightThemeLogoSvg : Win32cr::Foundation::PWSTR, @pwszDarkThemeLogoSvg : Win32cr::Foundation::PWSTR, @cbAuthenticatorInfo : UInt32, @pbAuthenticatorInfo : UInt8*, @cSupportedRpIds : UInt32, @ppwszSupportedRpIds : Win32cr::Foundation::PWSTR*, @pwszUserVerificationKeyName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS
    property cbCredentialId : UInt32
    property pbCredentialId : UInt8*
    property pwszRpId : Win32cr::Foundation::PWSTR
    property pwszRpName : Win32cr::Foundation::PWSTR
    property cbUserId : UInt32
    property pbUserId : UInt8*
    property pwszUserName : Win32cr::Foundation::PWSTR
    property pwszUserDisplayName : Win32cr::Foundation::PWSTR
    def initialize(@cbCredentialId : UInt32, @pbCredentialId : UInt8*, @pwszRpId : Win32cr::Foundation::PWSTR, @pwszRpName : Win32cr::Foundation::PWSTR, @cbUserId : UInt32, @pbUserId : UInt8*, @pwszUserName : Win32cr::Foundation::PWSTR, @pwszUserDisplayName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST
    property hwnd : Win32cr::Foundation::HWND
    property rguidTransactionId : LibC::GUID*
    property pwszUsername : Win32cr::Foundation::PWSTR
    property pwszDisplayHint : Win32cr::Foundation::PWSTR
    def initialize(@hwnd : Win32cr::Foundation::HWND, @rguidTransactionId : LibC::GUID*, @pwszUsername : Win32cr::Foundation::PWSTR, @pwszDisplayHint : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST_2
    property hwnd : Win32cr::Foundation::HWND
    property pGuidTransactionId : LibC::GUID*
    property pwszUsername : Win32cr::Foundation::PWSTR
    property pwszDisplayHint : Win32cr::Foundation::PWSTR
    property cbBufferToSign : UInt32
    property pbBufferToSign : UInt8*
    def initialize(@hwnd : Win32cr::Foundation::HWND, @pGuidTransactionId : LibC::GUID*, @pwszUsername : Win32cr::Foundation::PWSTR, @pwszDisplayHint : Win32cr::Foundation::PWSTR, @cbBufferToSign : UInt32, @pbBufferToSign : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS
    property dwVersion : UInt32
    property lUp : Int32
    property lUv : Int32
    property lRequireResidentKey : Int32
    def initialize(@dwVersion : UInt32, @lUp : Int32, @lUv : Int32, @lRequireResidentKey : Int32)
    end
  end

  @[Extern]
  struct WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY
    property dwVersion : UInt32
    property lKty : Int32
    property lAlg : Int32
    property lCrv : Int32
    property cbX : UInt32
    property pbX : UInt8*
    property cbY : UInt32
    property pbY : UInt8*
    def initialize(@dwVersion : UInt32, @lKty : Int32, @lAlg : Int32, @lCrv : Int32, @cbX : UInt32, @pbX : UInt8*, @cbY : UInt32, @pbY : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION
    property dwVersion : UInt32
    property pKeyAgreement : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY*
    property cbEncryptedSalt : UInt32
    property pbEncryptedSalt : UInt8*
    property cbSaltAuth : UInt32
    property pbSaltAuth : UInt8*
    def initialize(@dwVersion : UInt32, @pKeyAgreement : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY*, @cbEncryptedSalt : UInt32, @pbEncryptedSalt : UInt8*, @cbSaltAuth : UInt32, @pbSaltAuth : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST
    property dwVersion : UInt32
    property cbRpId : UInt32
    property pbRpId : UInt8*
    property cbClientDataHash : UInt32
    property pbClientDataHash : UInt8*
    property pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*
    property pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*
    property web_auth_n_credential_parameters : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETERS
    property credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST
    property cbCborExtensionsMap : UInt32
    property pbCborExtensionsMap : UInt8*
    property pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*
    property fEmptyPinAuth : Win32cr::Foundation::BOOL
    property cbPinAuth : UInt32
    property pbPinAuth : UInt8*
    property lHmacSecretExt : Int32
    property pHmacSecretMcExtension : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*
    property lPrfExt : Int32
    property cbHmacSecretSaltValues : UInt32
    property pbHmacSecretSaltValues : UInt8*
    property dwCredProtect : UInt32
    property dwPinProtocol : UInt32
    property dwEnterpriseAttestation : UInt32
    property cbCredBlobExt : UInt32
    property pbCredBlobExt : UInt8*
    property lLargeBlobKeyExt : Int32
    property dwLargeBlobSupport : UInt32
    property lMinPinLengthExt : Int32
    property cbJsonExt : UInt32
    property pbJsonExt : UInt8*
    def initialize(@dwVersion : UInt32, @cbRpId : UInt32, @pbRpId : UInt8*, @cbClientDataHash : UInt32, @pbClientDataHash : UInt8*, @pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*, @pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, @web_auth_n_credential_parameters : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETERS, @credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST, @cbCborExtensionsMap : UInt32, @pbCborExtensionsMap : UInt8*, @pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*, @fEmptyPinAuth : Win32cr::Foundation::BOOL, @cbPinAuth : UInt32, @pbPinAuth : UInt8*, @lHmacSecretExt : Int32, @pHmacSecretMcExtension : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*, @lPrfExt : Int32, @cbHmacSecretSaltValues : UInt32, @pbHmacSecretSaltValues : UInt8*, @dwCredProtect : UInt32, @dwPinProtocol : UInt32, @dwEnterpriseAttestation : UInt32, @cbCredBlobExt : UInt32, @pbCredBlobExt : UInt8*, @lLargeBlobKeyExt : Int32, @dwLargeBlobSupport : UInt32, @lMinPinLengthExt : Int32, @cbJsonExt : UInt32, @pbJsonExt : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST
    property dwVersion : UInt32
    property pwszRpId : Win32cr::Foundation::PWSTR
    property cbRpId : UInt32
    property pbRpId : UInt8*
    property cbClientDataHash : UInt32
    property pbClientDataHash : UInt8*
    property credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST
    property cbCborExtensionsMap : UInt32
    property pbCborExtensionsMap : UInt8*
    property pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*
    property fEmptyPinAuth : Win32cr::Foundation::BOOL
    property cbPinAuth : UInt32
    property pbPinAuth : UInt8*
    property pHmacSaltExtension : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*
    property cbHmacSecretSaltValues : UInt32
    property pbHmacSecretSaltValues : UInt8*
    property dwPinProtocol : UInt32
    property lCredBlobExt : Int32
    property lLargeBlobKeyExt : Int32
    property dwCredLargeBlobOperation : UInt32
    property cbCredLargeBlobCompressed : UInt32
    property pbCredLargeBlobCompressed : UInt8*
    property dwCredLargeBlobOriginalSize : UInt32
    property cbJsonExt : UInt32
    property pbJsonExt : UInt8*
    def initialize(@dwVersion : UInt32, @pwszRpId : Win32cr::Foundation::PWSTR, @cbRpId : UInt32, @pbRpId : UInt8*, @cbClientDataHash : UInt32, @pbClientDataHash : UInt8*, @credential_list : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_LIST, @cbCborExtensionsMap : UInt32, @pbCborExtensionsMap : UInt8*, @pAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS*, @fEmptyPinAuth : Win32cr::Foundation::BOOL, @cbPinAuth : UInt32, @pbPinAuth : UInt8*, @pHmacSaltExtension : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION*, @cbHmacSecretSaltValues : UInt32, @pbHmacSecretSaltValues : UInt8*, @dwPinProtocol : UInt32, @lCredBlobExt : Int32, @lLargeBlobKeyExt : Int32, @dwCredLargeBlobOperation : UInt32, @cbCredLargeBlobCompressed : UInt32, @pbCredLargeBlobCompressed : UInt8*, @dwCredLargeBlobOriginalSize : UInt32, @cbJsonExt : UInt32, @pbJsonExt : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE
    property web_auth_n_assertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION
    property pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*
    property dwNumberOfCredentials : UInt32
    property lUserSelected : Int32
    property cbLargeBlobKey : UInt32
    property pbLargeBlobKey : UInt8*
    property cbUnsignedExtensionOutputs : UInt32
    property pbUnsignedExtensionOutputs : UInt8*
    def initialize(@web_auth_n_assertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION, @pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, @dwNumberOfCredentials : UInt32, @lUserSelected : Int32, @cbLargeBlobKey : UInt32, @pbLargeBlobKey : UInt8*, @cbUnsignedExtensionOutputs : UInt32, @pbUnsignedExtensionOutputs : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST
    property hWnd : Win32cr::Foundation::HWND
    property transactionId : LibC::GUID
    property cbRequestSignature : UInt32
    property pbRequestSignature : UInt8*
    property cbEncodedRequest : UInt32
    property pbEncodedRequest : UInt8*
    def initialize(@hWnd : Win32cr::Foundation::HWND, @transactionId : LibC::GUID, @cbRequestSignature : UInt32, @pbRequestSignature : UInt8*, @cbEncodedRequest : UInt32, @pbEncodedRequest : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_OPERATION_REQUEST
    property hWnd : Win32cr::Foundation::HWND
    property transactionId : LibC::GUID
    property cbRequestSignature : UInt32
    property pbRequestSignature : UInt8*
    property requestType : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_REQUEST_TYPE
    property cbEncodedRequest : UInt32
    property pbEncodedRequest : UInt8*
    def initialize(@hWnd : Win32cr::Foundation::HWND, @transactionId : LibC::GUID, @cbRequestSignature : UInt32, @pbRequestSignature : UInt8*, @requestType : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_REQUEST_TYPE, @cbEncodedRequest : UInt32, @pbEncodedRequest : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE
    property cbEncodedResponse : UInt32
    property pbEncodedResponse : UInt8*
    def initialize(@cbEncodedResponse : UInt32, @pbEncodedResponse : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_OPERATION_RESPONSE
    property cbEncodedResponse : UInt32
    property pbEncodedResponse : UInt8*
    def initialize(@cbEncodedResponse : UInt32, @pbEncodedResponse : UInt8*)
    end
  end

  @[Extern]
  struct EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST
    property transactionId : LibC::GUID
    property cbRequestSignature : UInt32
    property pbRequestSignature : UInt8*
    def initialize(@transactionId : LibC::GUID, @cbRequestSignature : UInt32, @pbRequestSignature : UInt8*)
    end
  end

  @[Extern]
  struct WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST
    property transactionId : LibC::GUID
    property cbRequestSignature : UInt32
    property pbRequestSignature : UInt8*
    def initialize(@transactionId : LibC::GUID, @cbRequestSignature : UInt32, @pbRequestSignature : UInt8*)
    end
  end

  @[Extern]

  record EXPERIMENTAL_IPluginAuthenticatorVtable,
    query_interface : Proc(EXPERIMENTAL_IPluginAuthenticator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(EXPERIMENTAL_IPluginAuthenticator*, UInt32),
    release : Proc(EXPERIMENTAL_IPluginAuthenticator*, UInt32),
    experimental_plugin_make_credential : Proc(EXPERIMENTAL_IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST*, Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE**, Win32cr::Foundation::HRESULT),
    experimental_plugin_get_assertion : Proc(EXPERIMENTAL_IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST*, Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE**, Win32cr::Foundation::HRESULT),
    experimental_plugin_cancel_operation : Proc(EXPERIMENTAL_IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record EXPERIMENTAL_IPluginAuthenticator, lpVtbl : EXPERIMENTAL_IPluginAuthenticatorVtable* do
    GUID = LibC::GUID.new(0xe6466e9a_u32, 0xb2f3_u16, 0x47c5_u16, StaticArray[0xb8_u8, 0x8d_u8, 0x89_u8, 0xbc_u8, 0x14_u8, 0xa8_u8, 0xd9_u8, 0x98_u8])
    def query_interface(this : EXPERIMENTAL_IPluginAuthenticator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : EXPERIMENTAL_IPluginAuthenticator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : EXPERIMENTAL_IPluginAuthenticator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def experimental_plugin_make_credential(this : EXPERIMENTAL_IPluginAuthenticator*, request : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST*, response : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.experimental_plugin_make_credential.call(this, request, response)
    end
    def experimental_plugin_get_assertion(this : EXPERIMENTAL_IPluginAuthenticator*, request : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST*, response : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.experimental_plugin_get_assertion.call(this, request, response)
    end
    def experimental_plugin_cancel_operation(this : EXPERIMENTAL_IPluginAuthenticator*, request : Win32cr::Security::Authentication::WebAuthn::EXPERIMENTAL_WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.experimental_plugin_cancel_operation.call(this, request)
    end

  end

  @[Extern]

  record IPluginAuthenticatorVtable,
    query_interface : Proc(IPluginAuthenticator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPluginAuthenticator*, UInt32),
    release : Proc(IPluginAuthenticator*, UInt32),
    make_credential : Proc(IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_REQUEST*, Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_RESPONSE*, Win32cr::Foundation::HRESULT),
    get_assertion : Proc(IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_REQUEST*, Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_RESPONSE*, Win32cr::Foundation::HRESULT),
    cancel_operation : Proc(IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST*, Win32cr::Foundation::HRESULT),
    get_lock_status : Proc(IPluginAuthenticator*, Win32cr::Security::Authentication::WebAuthn::PLUGIN_LOCK_STATUS*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IPluginAuthenticator, lpVtbl : IPluginAuthenticatorVtable* do
    GUID = LibC::GUID.new(0xd26bcf6f_u32, 0xb54c_u16, 0x43ff_u16, StaticArray[0x9f_u8, 0x6_u8, 0xd5_u8, 0xbf_u8, 0x14_u8, 0x86_u8, 0x25_u8, 0xf7_u8])
    def query_interface(this : IPluginAuthenticator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPluginAuthenticator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPluginAuthenticator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def make_credential(this : IPluginAuthenticator*, request : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_REQUEST*, response : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_credential.call(this, request, response)
    end
    def get_assertion(this : IPluginAuthenticator*, request : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_REQUEST*, response : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_OPERATION_RESPONSE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_assertion.call(this, request, response)
    end
    def cancel_operation(this : IPluginAuthenticator*, request : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel_operation.call(this, request)
    end
    def get_lock_status(this : IPluginAuthenticator*, lockStatus : Win32cr::Security::Authentication::WebAuthn::PLUGIN_LOCK_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_lock_status.call(this, lockStatus)
    end

  end

  def webAuthNGetApiVersionNumber : UInt32
    {% if !flag?(:docs) %}
    C.WebAuthNGetApiVersionNumber
    {% end %}
  end

  def webAuthNIsUserVerifyingPlatformAuthenticatorAvailable(pbIsUserVerifyingPlatformAuthenticatorAvailable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable(pbIsUserVerifyingPlatformAuthenticatorAvailable)
    {% end %}
  end

  def webAuthNAuthenticatorMakeCredential(hWnd : Win32cr::Foundation::HWND, pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*, pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, pPubKeyCredParams : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETERS*, pWebAuthNClientData : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CLIENT_DATA*, pWebAuthNMakeCredentialOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS*, ppWebAuthNCredentialAttestation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_ATTESTATION**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNAuthenticatorMakeCredential(hWnd, pRpInformation, pUserInformation, pPubKeyCredParams, pWebAuthNClientData, pWebAuthNMakeCredentialOptions, ppWebAuthNCredentialAttestation)
    {% end %}
  end

  def webAuthNAuthenticatorGetAssertion(hWnd : Win32cr::Foundation::HWND, pwszRpId : Win32cr::Foundation::PWSTR, pWebAuthNClientData : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CLIENT_DATA*, pWebAuthNGetAssertionOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS*, ppWebAuthNAssertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNAuthenticatorGetAssertion(hWnd, pwszRpId, pWebAuthNClientData, pWebAuthNGetAssertionOptions, ppWebAuthNAssertion)
    {% end %}
  end

  def webAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_ATTESTATION*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation)
    {% end %}
  end

  def webAuthNFreeAssertion(pWebAuthNAssertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNFreeAssertion(pWebAuthNAssertion)
    {% end %}
  end

  def webAuthNGetCancellationId(pCancellationId : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNGetCancellationId(pCancellationId)
    {% end %}
  end

  def webAuthNCancelCurrentOperation(pCancellationId : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNCancelCurrentOperation(pCancellationId)
    {% end %}
  end

  def webAuthNGetPlatformCredentialList(pGetCredentialsOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_GET_CREDENTIALS_OPTIONS*, ppCredentialDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_DETAILS_LIST**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNGetPlatformCredentialList(pGetCredentialsOptions, ppCredentialDetailsList)
    {% end %}
  end

  def webAuthNFreePlatformCredentialList(pCredentialDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_DETAILS_LIST*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNFreePlatformCredentialList(pCredentialDetailsList)
    {% end %}
  end

  def webAuthNDeletePlatformCredential(cbCredentialId : UInt32, pbCredentialId : UInt8*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNDeletePlatformCredential(cbCredentialId, pbCredentialId)
    {% end %}
  end

  def webAuthNGetAuthenticatorList(pWebAuthNGetAuthenticatorListOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS*, ppAuthenticatorDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS_LIST**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNGetAuthenticatorList(pWebAuthNGetAuthenticatorListOptions, ppAuthenticatorDetailsList)
    {% end %}
  end

  def webAuthNFreeAuthenticatorList(pAuthenticatorDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS_LIST*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNFreeAuthenticatorList(pAuthenticatorDetailsList)
    {% end %}
  end

  def webAuthNGetErrorName(hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::PWSTR
    {% if !flag?(:docs) %}
    C.WebAuthNGetErrorName(hr)
    {% end %}
  end

  def webAuthNGetW3CExceptionDOMError(hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNGetW3CExceptionDOMError(hr)
    {% end %}
  end

  def webAuthNPluginGetAuthenticatorState(rclsid : LibC::GUID*, pluginAuthenticatorState : Win32cr::Security::Authentication::WebAuthn::AUTHENTICATOR_STATE*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginGetAuthenticatorState(rclsid, pluginAuthenticatorState)
    {% end %}
  end

  def webAuthNPluginAddAuthenticator(pPluginAddAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS*, ppPluginAddAuthenticatorResponse : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginAddAuthenticator(pPluginAddAuthenticatorOptions, ppPluginAddAuthenticatorResponse)
    {% end %}
  end

  def webAuthNPluginFreeAddAuthenticatorResponse(pPluginAddAuthenticatorResponse : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNPluginFreeAddAuthenticatorResponse(pPluginAddAuthenticatorResponse)
    {% end %}
  end

  def webAuthNPluginRemoveAuthenticator(rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginRemoveAuthenticator(rclsid)
    {% end %}
  end

  def webAuthNPluginUpdateAuthenticatorDetails(pPluginUpdateAuthenticatorDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginUpdateAuthenticatorDetails(pPluginUpdateAuthenticatorDetails)
    {% end %}
  end

  def webAuthNPluginAuthenticatorAddCredentials(rclsid : LibC::GUID*, cCredentialDetails : UInt32, pCredentialDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginAuthenticatorAddCredentials(rclsid, cCredentialDetails, pCredentialDetails)
    {% end %}
  end

  def webAuthNPluginAuthenticatorRemoveCredentials(rclsid : LibC::GUID*, cCredentialDetails : UInt32, pCredentialDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginAuthenticatorRemoveCredentials(rclsid, cCredentialDetails, pCredentialDetails)
    {% end %}
  end

  def webAuthNPluginAuthenticatorRemoveAllCredentials(rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginAuthenticatorRemoveAllCredentials(rclsid)
    {% end %}
  end

  def webAuthNPluginAuthenticatorGetAllCredentials(rclsid : LibC::GUID*, pcCredentialDetails : UInt32*, ppCredentialDetailsArray : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginAuthenticatorGetAllCredentials(rclsid, pcCredentialDetails, ppCredentialDetailsArray)
    {% end %}
  end

  def webAuthNPluginAuthenticatorFreeCredentialDetailsArray(cCredentialDetails : UInt32, pCredentialDetailsArray : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNPluginAuthenticatorFreeCredentialDetailsArray(cCredentialDetails, pCredentialDetailsArray)
    {% end %}
  end

  def webAuthNPluginPerformUserVerification(pPluginUserVerification : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST*, pcbResponse : UInt32*, ppbResponse : UInt8**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginPerformUserVerification(pPluginUserVerification, pcbResponse, ppbResponse)
    {% end %}
  end

  def webAuthNPluginFreeUserVerificationResponse(ppbResponse : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNPluginFreeUserVerificationResponse(ppbResponse)
    {% end %}
  end

  def webAuthNPluginGetUserVerificationCount(rclsid : LibC::GUID*, pdwVerificationCount : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginGetUserVerificationCount(rclsid, pdwVerificationCount)
    {% end %}
  end

  def webAuthNPluginGetUserVerificationPublicKey(rclsid : LibC::GUID*, pcbPublicKey : UInt32*, ppbPublicKey : UInt8**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginGetUserVerificationPublicKey(rclsid, pcbPublicKey, ppbPublicKey)
    {% end %}
  end

  def webAuthNPluginGetOperationSigningPublicKey(rclsid : LibC::GUID*, pcbOpSignPubKey : UInt32*, ppbOpSignPubKey : UInt8**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginGetOperationSigningPublicKey(rclsid, pcbOpSignPubKey, ppbOpSignPubKey)
    {% end %}
  end

  def webAuthNPluginFreePublicKeyResponse(pbOpSignPubKey : UInt8*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNPluginFreePublicKeyResponse(pbOpSignPubKey)
    {% end %}
  end

  def webAuthNEncodeMakeCredentialResponse(pCredentialAttestation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_ATTESTATION*, pcbResp : UInt32*, ppbResp : UInt8**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNEncodeMakeCredentialResponse(pCredentialAttestation, pcbResp, ppbResp)
    {% end %}
  end

  def webAuthNDecodeMakeCredentialRequest(cbEncoded : UInt32, pbEncoded : UInt8*, ppMakeCredentialRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNDecodeMakeCredentialRequest(cbEncoded, pbEncoded, ppMakeCredentialRequest)
    {% end %}
  end

  def webAuthNFreeDecodedMakeCredentialRequest(pMakeCredentialRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNFreeDecodedMakeCredentialRequest(pMakeCredentialRequest)
    {% end %}
  end

  def webAuthNDecodeGetAssertionRequest(cbEncoded : UInt32, pbEncoded : UInt8*, ppGetAssertionRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNDecodeGetAssertionRequest(cbEncoded, pbEncoded, ppGetAssertionRequest)
    {% end %}
  end

  def webAuthNFreeDecodedGetAssertionRequest(pGetAssertionRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST*) : Void
    {% if !flag?(:docs) %}
    C.WebAuthNFreeDecodedGetAssertionRequest(pGetAssertionRequest)
    {% end %}
  end

  def webAuthNEncodeGetAssertionResponse(pGetAssertionResponse : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE*, pcbResp : UInt32*, ppbResp : UInt8**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNEncodeGetAssertionResponse(pGetAssertionResponse, pcbResp, ppbResp)
    {% end %}
  end

  def webAuthNPluginRegisterStatusChangeCallback(callback : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK, context : Void*, rclsid : LibC::GUID*, pdwRegister : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginRegisterStatusChangeCallback(callback, context, rclsid, pdwRegister)
    {% end %}
  end

  def webAuthNPluginUnregisterStatusChangeCallback(pdwRegister : UInt32*) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.WebAuthNPluginUnregisterStatusChangeCallback(pdwRegister)
    {% end %}
  end

  @[Link("webauthn")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun WebAuthNGetApiVersionNumber : UInt32

    # :nodoc:
    fun WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable(pbIsUserVerifyingPlatformAuthenticatorAvailable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNAuthenticatorMakeCredential(hWnd : Win32cr::Foundation::HWND, pRpInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_RP_ENTITY_INFORMATION*, pUserInformation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_USER_ENTITY_INFORMATION*, pPubKeyCredParams : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_COSE_CREDENTIAL_PARAMETERS*, pWebAuthNClientData : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CLIENT_DATA*, pWebAuthNMakeCredentialOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS*, ppWebAuthNCredentialAttestation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_ATTESTATION**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNAuthenticatorGetAssertion(hWnd : Win32cr::Foundation::HWND, pwszRpId : Win32cr::Foundation::PWSTR, pWebAuthNClientData : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CLIENT_DATA*, pWebAuthNGetAssertionOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS*, ppWebAuthNAssertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_ATTESTATION*) : Void

    # :nodoc:
    fun WebAuthNFreeAssertion(pWebAuthNAssertion : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_ASSERTION*) : Void

    # :nodoc:
    fun WebAuthNGetCancellationId(pCancellationId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNCancelCurrentOperation(pCancellationId : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNGetPlatformCredentialList(pGetCredentialsOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_GET_CREDENTIALS_OPTIONS*, ppCredentialDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_DETAILS_LIST**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNFreePlatformCredentialList(pCredentialDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_DETAILS_LIST*) : Void

    # :nodoc:
    fun WebAuthNDeletePlatformCredential(cbCredentialId : UInt32, pbCredentialId : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNGetAuthenticatorList(pWebAuthNGetAuthenticatorListOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS*, ppAuthenticatorDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS_LIST**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNFreeAuthenticatorList(pAuthenticatorDetailsList : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_AUTHENTICATOR_DETAILS_LIST*) : Void

    # :nodoc:
    fun WebAuthNGetErrorName(hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::PWSTR

    # :nodoc:
    fun WebAuthNGetW3CExceptionDOMError(hr : Win32cr::Foundation::HRESULT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginGetAuthenticatorState(rclsid : LibC::GUID*, pluginAuthenticatorState : Win32cr::Security::Authentication::WebAuthn::AUTHENTICATOR_STATE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginAddAuthenticator(pPluginAddAuthenticatorOptions : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS*, ppPluginAddAuthenticatorResponse : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginFreeAddAuthenticatorResponse(pPluginAddAuthenticatorResponse : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE*) : Void

    # :nodoc:
    fun WebAuthNPluginRemoveAuthenticator(rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginUpdateAuthenticatorDetails(pPluginUpdateAuthenticatorDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginAuthenticatorAddCredentials(rclsid : LibC::GUID*, cCredentialDetails : UInt32, pCredentialDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginAuthenticatorRemoveCredentials(rclsid : LibC::GUID*, cCredentialDetails : UInt32, pCredentialDetails : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginAuthenticatorRemoveAllCredentials(rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginAuthenticatorGetAllCredentials(rclsid : LibC::GUID*, pcCredentialDetails : UInt32*, ppCredentialDetailsArray : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginAuthenticatorFreeCredentialDetailsArray(cCredentialDetails : UInt32, pCredentialDetailsArray : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS*) : Void

    # :nodoc:
    fun WebAuthNPluginPerformUserVerification(pPluginUserVerification : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST*, pcbResponse : UInt32*, ppbResponse : UInt8**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginFreeUserVerificationResponse(ppbResponse : UInt8*) : Void

    # :nodoc:
    fun WebAuthNPluginGetUserVerificationCount(rclsid : LibC::GUID*, pdwVerificationCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginGetUserVerificationPublicKey(rclsid : LibC::GUID*, pcbPublicKey : UInt32*, ppbPublicKey : UInt8**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginGetOperationSigningPublicKey(rclsid : LibC::GUID*, pcbOpSignPubKey : UInt32*, ppbOpSignPubKey : UInt8**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginFreePublicKeyResponse(pbOpSignPubKey : UInt8*) : Void

    # :nodoc:
    fun WebAuthNEncodeMakeCredentialResponse(pCredentialAttestation : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CREDENTIAL_ATTESTATION*, pcbResp : UInt32*, ppbResp : UInt8**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNDecodeMakeCredentialRequest(cbEncoded : UInt32, pbEncoded : UInt8*, ppMakeCredentialRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNFreeDecodedMakeCredentialRequest(pMakeCredentialRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST*) : Void

    # :nodoc:
    fun WebAuthNDecodeGetAssertionRequest(cbEncoded : UInt32, pbEncoded : UInt8*, ppGetAssertionRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNFreeDecodedGetAssertionRequest(pGetAssertionRequest : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST*) : Void

    # :nodoc:
    fun WebAuthNEncodeGetAssertionResponse(pGetAssertionResponse : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE*, pcbResp : UInt32*, ppbResp : UInt8**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginRegisterStatusChangeCallback(callback : Win32cr::Security::Authentication::WebAuthn::WEBAUTHN_PLUGIN_STATUS_CHANGE_CALLBACK, context : Void*, rclsid : LibC::GUID*, pdwRegister : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WebAuthNPluginUnregisterStatusChangeCallback(pdwRegister : UInt32*) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end