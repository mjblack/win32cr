require "../foundation.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
{% else %}
@[Link("advapi32")]
{% end %}
lib LibWin32
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


  enum SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS : UInt32
    SAFER_TOKEN_NULL_IF_EQUAL = 1
    SAFER_TOKEN_COMPARE_ONLY = 2
    SAFER_TOKEN_MAKE_INERT = 4
    SAFER_TOKEN_WANT_FLAGS = 8
  end

  enum SAFER_POLICY_INFO_CLASS : Int32
    SaferPolicyLevelList = 1
    SaferPolicyEnableTransparentEnforcement = 2
    SaferPolicyDefaultLevel = 3
    SaferPolicyEvaluateUserScope = 4
    SaferPolicyScopeFlags = 5
    SaferPolicyDefaultLevelFlags = 6
    SaferPolicyAuthenticodeEnabled = 7
  end

  enum SAFER_OBJECT_INFO_CLASS : Int32
    SaferObjectLevelId = 1
    SaferObjectScopeId = 2
    SaferObjectFriendlyName = 3
    SaferObjectDescription = 4
    SaferObjectBuiltin = 5
    SaferObjectDisallowed = 6
    SaferObjectDisableMaxPrivilege = 7
    SaferObjectInvertDeletedPrivileges = 8
    SaferObjectDeletedPrivileges = 9
    SaferObjectDefaultOwner = 10
    SaferObjectSidsToDisable = 11
    SaferObjectRestrictedSidsInverted = 12
    SaferObjectRestrictedSidsAdded = 13
    SaferObjectAllIdentificationGuids = 14
    SaferObjectSingleIdentification = 15
    SaferObjectExtendedError = 16
  end

  enum SAFER_IDENTIFICATION_TYPES : Int32
    SaferIdentityDefault = 0
    SaferIdentityTypeImageName = 1
    SaferIdentityTypeImageHash = 2
    SaferIdentityTypeUrlZone = 3
    SaferIdentityTypeCertificate = 4
  end

  struct SAFER_CODE_PROPERTIES_V1
    cb_size : UInt32
    dw_check_flags : UInt32
    image_path : LibC::LPWSTR
    h_image_file_handle : LibC::HANDLE
    url_zone_id : UInt32
    image_hash : UInt8[64]*
    dw_image_hash_size : UInt32
    image_size : LARGE_INTEGER
    hash_algorithm : UInt32
    p_byte_block : UInt8*
    h_wnd_parent : HANDLE
    dw_wvtui_choice : UInt32
  end
  struct SAFER_CODE_PROPERTIES_V2
    cb_size : UInt32
    dw_check_flags : UInt32
    image_path : LibC::LPWSTR
    h_image_file_handle : LibC::HANDLE
    url_zone_id : UInt32
    image_hash : UInt8[64]*
    dw_image_hash_size : UInt32
    image_size : LARGE_INTEGER
    hash_algorithm : UInt32
    p_byte_block : UInt8*
    h_wnd_parent : HANDLE
    dw_wvtui_choice : UInt32
    package_moniker : LibC::LPWSTR
    package_publisher : LibC::LPWSTR
    package_name : LibC::LPWSTR
    package_version : UInt64
    package_is_framework : LibC::BOOL
  end
  struct SAFER_IDENTIFICATION_HEADER
    dw_identification_type : SAFER_IDENTIFICATION_TYPES
    cb_struct_size : UInt32
    identification_guid : Guid
    last_modified : FILETIME
  end
  struct SAFER_PATHNAME_IDENTIFICATION
    header : SAFER_IDENTIFICATION_HEADER
    description : Char[256]*
    image_name : LibC::LPWSTR
    dw_safer_flags : UInt32
  end
  struct SAFER_HASH_IDENTIFICATION
    header : SAFER_IDENTIFICATION_HEADER
    description : Char[256]*
    friendly_name : Char[256]*
    hash_size : UInt32
    image_hash : UInt8[64]*
    hash_algorithm : UInt32
    image_size : LARGE_INTEGER
    dw_safer_flags : UInt32
  end
  struct SAFER_HASH_IDENTIFICATION2
    hash_identification : SAFER_HASH_IDENTIFICATION
    hash_size : UInt32
    image_hash : UInt8[64]*
    hash_algorithm : UInt32
  end
  struct SAFER_URLZONE_IDENTIFICATION
    header : SAFER_IDENTIFICATION_HEADER
    url_zone_id : UInt32
    dw_safer_flags : UInt32
  end


  # Params # dwscopeid : UInt32 [In],saferpolicyinfoclass : SAFER_POLICY_INFO_CLASS [In],infobuffersize : UInt32 [In],infobuffer : Void* [In],infobufferretsize : UInt32* [In],lpreserved : Void* [In]
  fun SaferGetPolicyInformation(dwscopeid : UInt32, saferpolicyinfoclass : SAFER_POLICY_INFO_CLASS, infobuffersize : UInt32, infobuffer : Void*, infobufferretsize : UInt32*, lpreserved : Void*) : LibC::BOOL

  # Params # dwscopeid : UInt32 [In],saferpolicyinfoclass : SAFER_POLICY_INFO_CLASS [In],infobuffersize : UInt32 [In],infobuffer : Void* [In],lpreserved : Void* [In]
  fun SaferSetPolicyInformation(dwscopeid : UInt32, saferpolicyinfoclass : SAFER_POLICY_INFO_CLASS, infobuffersize : UInt32, infobuffer : Void*, lpreserved : Void*) : LibC::BOOL

  # Params # dwscopeid : UInt32 [In],dwlevelid : UInt32 [In],openflags : UInt32 [In],plevelhandle : SAFER_LEVEL_HANDLE* [In],lpreserved : Void* [In]
  fun SaferCreateLevel(dwscopeid : UInt32, dwlevelid : UInt32, openflags : UInt32, plevelhandle : SAFER_LEVEL_HANDLE*, lpreserved : Void*) : LibC::BOOL

  # Params # hlevelhandle : SAFER_LEVEL_HANDLE [In]
  fun SaferCloseLevel(hlevelhandle : SAFER_LEVEL_HANDLE) : LibC::BOOL

  # Params # dwnumproperties : UInt32 [In],pcodeproperties : SAFER_CODE_PROPERTIES_V2* [In],plevelhandle : SAFER_LEVEL_HANDLE* [In],lpreserved : Void* [In]
  fun SaferIdentifyLevel(dwnumproperties : UInt32, pcodeproperties : SAFER_CODE_PROPERTIES_V2*, plevelhandle : SAFER_LEVEL_HANDLE*, lpreserved : Void*) : LibC::BOOL

  # Params # levelhandle : SAFER_LEVEL_HANDLE [In],inaccesstoken : LibC::HANDLE [In],outaccesstoken : LibC::HANDLE* [In],dwflags : SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS [In],lpreserved : Void* [In]
  fun SaferComputeTokenFromLevel(levelhandle : SAFER_LEVEL_HANDLE, inaccesstoken : LibC::HANDLE, outaccesstoken : LibC::HANDLE*, dwflags : SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS, lpreserved : Void*) : LibC::BOOL

  # Params # levelhandle : SAFER_LEVEL_HANDLE [In],dwinfotype : SAFER_OBJECT_INFO_CLASS [In],lpquerybuffer : Void* [In],dwinbuffersize : UInt32 [In],lpdwoutbuffersize : UInt32* [In]
  fun SaferGetLevelInformation(levelhandle : SAFER_LEVEL_HANDLE, dwinfotype : SAFER_OBJECT_INFO_CLASS, lpquerybuffer : Void*, dwinbuffersize : UInt32, lpdwoutbuffersize : UInt32*) : LibC::BOOL

  # Params # levelhandle : SAFER_LEVEL_HANDLE [In],dwinfotype : SAFER_OBJECT_INFO_CLASS [In],lpquerybuffer : Void* [In],dwinbuffersize : UInt32 [In]
  fun SaferSetLevelInformation(levelhandle : SAFER_LEVEL_HANDLE, dwinfotype : SAFER_OBJECT_INFO_CLASS, lpquerybuffer : Void*, dwinbuffersize : UInt32) : LibC::BOOL

  # Params # hlevel : SAFER_LEVEL_HANDLE [In],sztargetpath : LibC::LPWSTR [In],lpreserved : Void* [In]
  fun SaferRecordEventLogEntry(hlevel : SAFER_LEVEL_HANDLE, sztargetpath : LibC::LPWSTR, lpreserved : Void*) : LibC::BOOL

  # Params # szfullpathname : LibC::LPWSTR [In],bfromshellexecute : BOOLEAN [In]
  fun SaferiIsExecutableFileType(szfullpathname : LibC::LPWSTR, bfromshellexecute : BOOLEAN) : LibC::BOOL
end
