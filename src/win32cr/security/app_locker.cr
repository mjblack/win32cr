require "./../foundation.cr"
require "./../security.cr"

module Win32cr::Security::AppLocker
  SAFER_SCOPEID_MACHINE = 1_u32
  SAFER_SCOPEID_USER = 2_u32
  SAFER_LEVELID_FULLYTRUSTED = 262144_u32
  SAFER_LEVELID_NORMALUSER = 131072_u32
  SAFER_LEVELID_CONSTRAINED = 65536_u32
  SAFER_LEVELID_UNTRUSTED = 4096_u32
  SAFER_LEVELID_DISALLOWED = 0_u32
  SAFER_LEVEL_OPEN = 1_u32
  SAFER_MAX_FRIENDLYNAME_SIZE = 256_u32
  SAFER_MAX_DESCRIPTION_SIZE = 256_u32
  SAFER_MAX_HASH_SIZE = 64_u32
  SAFER_CRITERIA_IMAGEPATH = 1_u32
  SAFER_CRITERIA_NOSIGNEDHASH = 2_u32
  SAFER_CRITERIA_IMAGEHASH = 4_u32
  SAFER_CRITERIA_AUTHENTICODE = 8_u32
  SAFER_CRITERIA_URLZONE = 16_u32
  SAFER_CRITERIA_APPX_PACKAGE = 32_u32
  SAFER_CRITERIA_IMAGEPATH_NT = 4096_u32
  SAFER_POLICY_JOBID_MASK = 4278190080_u32
  SAFER_POLICY_JOBID_CONSTRAINED = 67108864_u32
  SAFER_POLICY_JOBID_UNTRUSTED = 50331648_u32
  SAFER_POLICY_ONLY_EXES = 65536_u32
  SAFER_POLICY_SANDBOX_INERT = 131072_u32
  SAFER_POLICY_HASH_DUPLICATE = 262144_u32
  SAFER_POLICY_ONLY_AUDIT = 4096_u32
  SAFER_POLICY_BLOCK_CLIENT_UI = 8192_u32
  SAFER_POLICY_UIFLAGS_MASK = 255_u32
  SAFER_POLICY_UIFLAGS_INFORMATION_PROMPT = 1_u32
  SAFER_POLICY_UIFLAGS_OPTION_PROMPT = 2_u32
  SAFER_POLICY_UIFLAGS_HIDDEN = 4_u32
  SRP_POLICY_EXE = "EXE"
  SRP_POLICY_DLL = "DLL"
  SRP_POLICY_MSI = "MSI"
  SRP_POLICY_SCRIPT = "SCRIPT"
  SRP_POLICY_SHELL = "SHELL"
  SRP_POLICY_NOV2 = "IGNORESRPV2"
  SRP_POLICY_APPX = "APPX"
  SRP_POLICY_WLDPMSI = "WLDPMSI"
  SRP_POLICY_WLDPSCRIPT = "WLDPSCRIPT"
  SRP_POLICY_WLDPCONFIGCI = "WLDPCONFIGCI"
  SRP_POLICY_MANAGEDINSTALLER = "MANAGEDINSTALLER"

  @[Flags]
  enum SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS : UInt32
    SAFER_TOKEN_NULL_IF_EQUAL = 1_u32
    SAFER_TOKEN_COMPARE_ONLY = 2_u32
    SAFER_TOKEN_MAKE_INERT = 4_u32
    SAFER_TOKEN_WANT_FLAGS = 8_u32
  end
  enum SAFER_POLICY_INFO_CLASS
    SaferPolicyLevelList = 1_i32
    SaferPolicyEnableTransparentEnforcement = 2_i32
    SaferPolicyDefaultLevel = 3_i32
    SaferPolicyEvaluateUserScope = 4_i32
    SaferPolicyScopeFlags = 5_i32
    SaferPolicyDefaultLevelFlags = 6_i32
    SaferPolicyAuthenticodeEnabled = 7_i32
  end
  enum SAFER_OBJECT_INFO_CLASS
    SaferObjectLevelId = 1_i32
    SaferObjectScopeId = 2_i32
    SaferObjectFriendlyName = 3_i32
    SaferObjectDescription = 4_i32
    SaferObjectBuiltin = 5_i32
    SaferObjectDisallowed = 6_i32
    SaferObjectDisableMaxPrivilege = 7_i32
    SaferObjectInvertDeletedPrivileges = 8_i32
    SaferObjectDeletedPrivileges = 9_i32
    SaferObjectDefaultOwner = 10_i32
    SaferObjectSidsToDisable = 11_i32
    SaferObjectRestrictedSidsInverted = 12_i32
    SaferObjectRestrictedSidsAdded = 13_i32
    SaferObjectAllIdentificationGuids = 14_i32
    SaferObjectSingleIdentification = 15_i32
    SaferObjectExtendedError = 16_i32
  end
  enum SAFER_IDENTIFICATION_TYPES
    SaferIdentityDefault = 0_i32
    SaferIdentityTypeImageName = 1_i32
    SaferIdentityTypeImageHash = 2_i32
    SaferIdentityTypeUrlZone = 3_i32
    SaferIdentityTypeCertificate = 4_i32
  end

  @[Extern]
  struct SAFER_CODE_PROPERTIES_V1
    property cbSize : UInt32
    property dwCheckFlags : UInt32
    property image_path : Win32cr::Foundation::PWSTR
    property hImageFileHandle : Win32cr::Foundation::HANDLE
    property url_zone_id : UInt32
    property image_hash : UInt8[64]
    property dwImageHashSize : UInt32
    property image_size : Win32cr::Foundation::LARGE_INTEGER
    property hash_algorithm : UInt32
    property pByteBlock : UInt8*
    property hWndParent : Win32cr::Foundation::HWND
    property dwWVTUIChoice : UInt32
    def initialize(@cbSize : UInt32, @dwCheckFlags : UInt32, @image_path : Win32cr::Foundation::PWSTR, @hImageFileHandle : Win32cr::Foundation::HANDLE, @url_zone_id : UInt32, @image_hash : UInt8[64], @dwImageHashSize : UInt32, @image_size : Win32cr::Foundation::LARGE_INTEGER, @hash_algorithm : UInt32, @pByteBlock : UInt8*, @hWndParent : Win32cr::Foundation::HWND, @dwWVTUIChoice : UInt32)
    end
  end

  @[Extern]
  struct SAFER_CODE_PROPERTIES_V2
    property cbSize : UInt32
    property dwCheckFlags : UInt32
    property image_path : Win32cr::Foundation::PWSTR
    property hImageFileHandle : Win32cr::Foundation::HANDLE
    property url_zone_id : UInt32
    property image_hash : UInt8[64]
    property dwImageHashSize : UInt32
    property image_size : Win32cr::Foundation::LARGE_INTEGER
    property hash_algorithm : UInt32
    property pByteBlock : UInt8*
    property hWndParent : Win32cr::Foundation::HWND
    property dwWVTUIChoice : UInt32
    property package_moniker : Win32cr::Foundation::PWSTR
    property package_publisher : Win32cr::Foundation::PWSTR
    property package_name : Win32cr::Foundation::PWSTR
    property package_version : UInt64
    property package_is_framework : Win32cr::Foundation::BOOL
    def initialize(@cbSize : UInt32, @dwCheckFlags : UInt32, @image_path : Win32cr::Foundation::PWSTR, @hImageFileHandle : Win32cr::Foundation::HANDLE, @url_zone_id : UInt32, @image_hash : UInt8[64], @dwImageHashSize : UInt32, @image_size : Win32cr::Foundation::LARGE_INTEGER, @hash_algorithm : UInt32, @pByteBlock : UInt8*, @hWndParent : Win32cr::Foundation::HWND, @dwWVTUIChoice : UInt32, @package_moniker : Win32cr::Foundation::PWSTR, @package_publisher : Win32cr::Foundation::PWSTR, @package_name : Win32cr::Foundation::PWSTR, @package_version : UInt64, @package_is_framework : Win32cr::Foundation::BOOL)
    end
  end

  @[Extern]
  struct SAFER_IDENTIFICATION_HEADER
    property dwIdentificationType : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_TYPES
    property cbStructSize : UInt32
    property identification_guid : LibC::GUID
    property lastModified : Win32cr::Foundation::FILETIME
    def initialize(@dwIdentificationType : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_TYPES, @cbStructSize : UInt32, @identification_guid : LibC::GUID, @lastModified : Win32cr::Foundation::FILETIME)
    end
  end

  @[Extern]
  struct SAFER_PATHNAME_IDENTIFICATION
    property header : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_HEADER
    property description : UInt16[256]
    property image_name : Win32cr::Foundation::PWSTR
    property dwSaferFlags : UInt32
    def initialize(@header : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_HEADER, @description : UInt16[256], @image_name : Win32cr::Foundation::PWSTR, @dwSaferFlags : UInt32)
    end
  end

  @[Extern]
  struct SAFER_HASH_IDENTIFICATION
    property header : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_HEADER
    property description : UInt16[256]
    property friendly_name : UInt16[256]
    property hash_size : UInt32
    property image_hash : UInt8[64]
    property hash_algorithm : UInt32
    property image_size : Win32cr::Foundation::LARGE_INTEGER
    property dwSaferFlags : UInt32
    def initialize(@header : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_HEADER, @description : UInt16[256], @friendly_name : UInt16[256], @hash_size : UInt32, @image_hash : UInt8[64], @hash_algorithm : UInt32, @image_size : Win32cr::Foundation::LARGE_INTEGER, @dwSaferFlags : UInt32)
    end
  end

  @[Extern]
  struct SAFER_HASH_IDENTIFICATION2
    property hashIdentification : Win32cr::Security::AppLocker::SAFER_HASH_IDENTIFICATION
    property hash_size : UInt32
    property image_hash : UInt8[64]
    property hash_algorithm : UInt32
    def initialize(@hashIdentification : Win32cr::Security::AppLocker::SAFER_HASH_IDENTIFICATION, @hash_size : UInt32, @image_hash : UInt8[64], @hash_algorithm : UInt32)
    end
  end

  @[Extern]
  struct SAFER_URLZONE_IDENTIFICATION
    property header : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_HEADER
    property url_zone_id : UInt32
    property dwSaferFlags : UInt32
    def initialize(@header : Win32cr::Security::AppLocker::SAFER_IDENTIFICATION_HEADER, @url_zone_id : UInt32, @dwSaferFlags : UInt32)
    end
  end

  @[Link("advapi32")]
  lib C
    fun SaferGetPolicyInformation(dwScopeId : UInt32, safer_policy_info_class : Win32cr::Security::AppLocker::SAFER_POLICY_INFO_CLASS, info_buffer_size : UInt32, info_buffer : Void*, info_buffer_ret_size : UInt32*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun SaferSetPolicyInformation(dwScopeId : UInt32, safer_policy_info_class : Win32cr::Security::AppLocker::SAFER_POLICY_INFO_CLASS, info_buffer_size : UInt32, info_buffer : Void*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun SaferCreateLevel(dwScopeId : UInt32, dwLevelId : UInt32, open_flags : UInt32, pLevelHandle : Win32cr::Security::SAFER_LEVEL_HANDLE*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun SaferCloseLevel(hLevelHandle : Win32cr::Security::SAFER_LEVEL_HANDLE) : Win32cr::Foundation::BOOL

    fun SaferIdentifyLevel(dwNumProperties : UInt32, pCodeProperties : Win32cr::Security::AppLocker::SAFER_CODE_PROPERTIES_V2*, pLevelHandle : Win32cr::Security::SAFER_LEVEL_HANDLE*, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun SaferComputeTokenFromLevel(level_handle : Win32cr::Security::SAFER_LEVEL_HANDLE, in_access_token : Win32cr::Foundation::HANDLE, out_access_token : Win32cr::Foundation::HANDLE*, dwFlags : Win32cr::Security::AppLocker::SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun SaferGetLevelInformation(level_handle : Win32cr::Security::SAFER_LEVEL_HANDLE, dwInfoType : Win32cr::Security::AppLocker::SAFER_OBJECT_INFO_CLASS, lpQueryBuffer : Void*, dwInBufferSize : UInt32, lpdwOutBufferSize : UInt32*) : Win32cr::Foundation::BOOL

    fun SaferSetLevelInformation(level_handle : Win32cr::Security::SAFER_LEVEL_HANDLE, dwInfoType : Win32cr::Security::AppLocker::SAFER_OBJECT_INFO_CLASS, lpQueryBuffer : Void*, dwInBufferSize : UInt32) : Win32cr::Foundation::BOOL

    fun SaferRecordEventLogEntry(hLevel : Win32cr::Security::SAFER_LEVEL_HANDLE, szTargetPath : Win32cr::Foundation::PWSTR, lpReserved : Void*) : Win32cr::Foundation::BOOL

    fun SaferiIsExecutableFileType(szFullPathname : Win32cr::Foundation::PWSTR, bFromShellExecute : Win32cr::Foundation::BOOLEAN) : Win32cr::Foundation::BOOL

  end
end