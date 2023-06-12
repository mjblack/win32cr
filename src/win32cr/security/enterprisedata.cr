require "../system/winrt.cr"
require "../foundation.cr"
require "../system/com.cr"
require "../storage/packaging/appx.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:srpapi.dll")]
@[Link(ldflags: "/DELAYLOAD:efswrt.dll")]
{% else %}
@[Link("srpapi")]
@[Link("efswrt")]
{% end %}
lib LibWin32

  enum ENTERPRISE_DATA_POLICIES : UInt32
    ENTERPRISE_POLICY_NONE = 0
    ENTERPRISE_POLICY_ALLOWED = 1
    ENTERPRISE_POLICY_ENLIGHTENED = 2
    ENTERPRISE_POLICY_EXEMPT = 4
  end

  enum SRPHOSTING_TYPE : Int32
    SRPHOSTING_TYPE_NONE = 0
    SRPHOSTING_TYPE_WINHTTP = 1
    SRPHOSTING_TYPE_WININET = 2
  end

  enum SRPHOSTING_VERSION : Int32
    SRPHOSTING_VERSION1 = 1
  end

  struct HTHREAD_NETWORK_CONTEXT
    thread_id : UInt32
    thread_context : LibC::HANDLE
  end
  struct FILE_UNPROTECT_OPTIONS
    audit : Bool
  end


  struct IProtectionPolicyManagerInteropVTbl
    query_interface : Proc(IProtectionPolicyManagerInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProtectionPolicyManagerInterop*, UInt32)
    release : Proc(IProtectionPolicyManagerInterop*, UInt32)
    get_iids : Proc(IProtectionPolicyManagerInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IProtectionPolicyManagerInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IProtectionPolicyManagerInterop*, TrustLevel*, HRESULT)
    request_access_for_window_async : Proc(IProtectionPolicyManagerInterop*, LibC::HANDLE, HSTRING, HSTRING, Guid*, Void**, HRESULT)
    get_for_window : Proc(IProtectionPolicyManagerInterop*, LibC::HANDLE, Guid*, Void**, HRESULT)
  end

  IProtectionPolicyManagerInterop_GUID = LibC::GUID.new("4652651d-c1fe-4ba1-9f0a-c0f56596f721")
  CLSID_IProtectionPolicyManagerInterop = "4652651d-c1fe-4ba1-9f0a-c0f56596f721"
  struct IProtectionPolicyManagerInterop
    lpVtbl : IProtectionPolicyManagerInteropVTbl*
  end

  struct IProtectionPolicyManagerInterop2VTbl
    query_interface : Proc(IProtectionPolicyManagerInterop2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProtectionPolicyManagerInterop2*, UInt32)
    release : Proc(IProtectionPolicyManagerInterop2*, UInt32)
    get_iids : Proc(IProtectionPolicyManagerInterop2*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IProtectionPolicyManagerInterop2*, HSTRING*, HRESULT)
    get_trust_level : Proc(IProtectionPolicyManagerInterop2*, TrustLevel*, HRESULT)
    request_access_for_app_with_window_async : Proc(IProtectionPolicyManagerInterop2*, LibC::HANDLE, HSTRING, HSTRING, Guid*, Void**, HRESULT)
    request_access_with_auditing_info_for_window_async : Proc(IProtectionPolicyManagerInterop2*, LibC::HANDLE, HSTRING, HSTRING, IUnknown, Guid*, Void**, HRESULT)
    request_access_with_message_for_window_async : Proc(IProtectionPolicyManagerInterop2*, LibC::HANDLE, HSTRING, HSTRING, IUnknown, HSTRING, Guid*, Void**, HRESULT)
    request_access_for_app_with_auditing_info_for_window_async : Proc(IProtectionPolicyManagerInterop2*, LibC::HANDLE, HSTRING, HSTRING, IUnknown, Guid*, Void**, HRESULT)
    request_access_for_app_with_message_for_window_async : Proc(IProtectionPolicyManagerInterop2*, LibC::HANDLE, HSTRING, HSTRING, IUnknown, HSTRING, Guid*, Void**, HRESULT)
  end

  IProtectionPolicyManagerInterop2_GUID = LibC::GUID.new("157cfbe4-a78d-4156-b384-61fdac41e686")
  CLSID_IProtectionPolicyManagerInterop2 = "157cfbe4-a78d-4156-b384-61fdac41e686"
  struct IProtectionPolicyManagerInterop2
    lpVtbl : IProtectionPolicyManagerInterop2VTbl*
  end

  struct IProtectionPolicyManagerInterop3VTbl
    query_interface : Proc(IProtectionPolicyManagerInterop3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProtectionPolicyManagerInterop3*, UInt32)
    release : Proc(IProtectionPolicyManagerInterop3*, UInt32)
    get_iids : Proc(IProtectionPolicyManagerInterop3*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IProtectionPolicyManagerInterop3*, HSTRING*, HRESULT)
    get_trust_level : Proc(IProtectionPolicyManagerInterop3*, TrustLevel*, HRESULT)
    request_access_with_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, LibC::HANDLE, HSTRING, HSTRING, IUnknown, HSTRING, UInt32, Guid*, Void**, HRESULT)
    request_access_for_app_with_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, LibC::HANDLE, HSTRING, HSTRING, IUnknown, HSTRING, UInt32, Guid*, Void**, HRESULT)
    request_access_to_files_for_app_for_window_async : Proc(IProtectionPolicyManagerInterop3*, LibC::HANDLE, IUnknown, HSTRING, IUnknown, Guid*, Void**, HRESULT)
    request_access_to_files_for_app_with_message_and_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, LibC::HANDLE, IUnknown, HSTRING, IUnknown, HSTRING, UInt32, Guid*, Void**, HRESULT)
    request_access_to_files_for_process_for_window_async : Proc(IProtectionPolicyManagerInterop3*, LibC::HANDLE, IUnknown, UInt32, IUnknown, Guid*, Void**, HRESULT)
    request_access_to_files_for_process_with_message_and_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, LibC::HANDLE, IUnknown, UInt32, IUnknown, HSTRING, UInt32, Guid*, Void**, HRESULT)
  end

  IProtectionPolicyManagerInterop3_GUID = LibC::GUID.new("c1c03933-b398-4d93-b0fd-2972adf802c2")
  CLSID_IProtectionPolicyManagerInterop3 = "c1c03933-b398-4d93-b0fd-2972adf802c2"
  struct IProtectionPolicyManagerInterop3
    lpVtbl : IProtectionPolicyManagerInterop3VTbl*
  end


  # Params # enterpriseid : LibC::LPWSTR [In],threadnetworkcontext : HTHREAD_NETWORK_CONTEXT* [In]
  fun SrpCreateThreadNetworkContext(enterpriseid : LibC::LPWSTR, threadnetworkcontext : HTHREAD_NETWORK_CONTEXT*) : HRESULT

  # Params # threadnetworkcontext : HTHREAD_NETWORK_CONTEXT* [In]
  fun SrpCloseThreadNetworkContext(threadnetworkcontext : HTHREAD_NETWORK_CONTEXT*) : HRESULT

  # Params # tokenhandle : LibC::HANDLE [In],enterpriseid : LibC::LPWSTR [In]
  fun SrpSetTokenEnterpriseId(tokenhandle : LibC::HANDLE, enterpriseid : LibC::LPWSTR) : HRESULT

  # Params # tokenhandle : LibC::HANDLE [In],numberofbytes : UInt32* [In],enterpriseids : LibC::LPWSTR* [In],enterpriseidcount : UInt32* [In]
  fun SrpGetEnterpriseIds(tokenhandle : LibC::HANDLE, numberofbytes : UInt32*, enterpriseids : LibC::LPWSTR*, enterpriseidcount : UInt32*) : HRESULT

  # Params # enterpriseid : LibC::LPWSTR [In]
  fun SrpEnablePermissiveModeFileEncryption(enterpriseid : LibC::LPWSTR) : HRESULT

  # Params # 
  fun SrpDisablePermissiveModeFileEncryption : HRESULT

  # Params # tokenhandle : LibC::HANDLE [In],policyflags : ENTERPRISE_DATA_POLICIES* [In]
  fun SrpGetEnterprisePolicy(tokenhandle : LibC::HANDLE, policyflags : ENTERPRISE_DATA_POLICIES*) : HRESULT

  # Params # tokenhandle : LibC::HANDLE [In],istokenservice : UInt8* [In]
  fun SrpIsTokenService(tokenhandle : LibC::HANDLE, istokenservice : UInt8*) : NTSTATUS

  # Params # packageid : PACKAGE_ID* [In],isallowed : LibC::BOOL* [In]
  fun SrpDoesPolicyAllowAppExecution(packageid : PACKAGE_ID*, isallowed : LibC::BOOL*) : HRESULT

  # Params # version : SRPHOSTING_VERSION [In],type : SRPHOSTING_TYPE [In],pvdata : Void* [In],cbdata : UInt32 [In]
  fun SrpHostingInitialize(version : SRPHOSTING_VERSION, type : SRPHOSTING_TYPE, pvdata : Void*, cbdata : UInt32) : HRESULT

  # Params # type : SRPHOSTING_TYPE [In]
  fun SrpHostingTerminate(type : SRPHOSTING_TYPE)

  # Params # fileorfolderpath : LibC::LPWSTR [In],identity : LibC::LPWSTR [In]
  fun ProtectFileToEnterpriseIdentity(fileorfolderpath : LibC::LPWSTR, identity : LibC::LPWSTR) : HRESULT

  # Params # fileorfolderpath : LibC::LPWSTR [In],options : FILE_UNPROTECT_OPTIONS* [In]
  fun UnprotectFile(fileorfolderpath : LibC::LPWSTR, options : FILE_UNPROTECT_OPTIONS*) : HRESULT
end
