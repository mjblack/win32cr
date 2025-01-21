require "./../system/win_rt.cr"
require "./../foundation.cr"
require "./../system/com.cr"
require "./../storage/packaging/appx.cr"

module Win32cr::Security::EnterpriseData

  @[Flags]
  enum ENTERPRISE_DATA_POLICIES : UInt32
    ENTERPRISE_POLICY_NONE = 0_u32
    ENTERPRISE_POLICY_ALLOWED = 1_u32
    ENTERPRISE_POLICY_ENLIGHTENED = 2_u32
    ENTERPRISE_POLICY_EXEMPT = 4_u32
  end
  enum SRPHOSTING_TYPE
    SRPHOSTING_TYPE_NONE = 0_i32
    SRPHOSTING_TYPE_WINHTTP = 1_i32
    SRPHOSTING_TYPE_WININET = 2_i32
  end
  enum SRPHOSTING_VERSION
    SRPHOSTING_VERSION1 = 1_i32
  end

  @[Extern]
  record HTHREAD_NETWORK_CONTEXT,
    thread_id : UInt32,
    thread_context : Win32cr::Foundation::HANDLE

  @[Extern]
  record FILE_UNPROTECT_OPTIONS,
    audit : Bool

  @[Extern]
  record IProtectionPolicyManagerInteropVtbl,
    query_interface : Proc(IProtectionPolicyManagerInterop*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProtectionPolicyManagerInterop*, UInt32),
    release : Proc(IProtectionPolicyManagerInterop*, UInt32),
    get_iids : Proc(IProtectionPolicyManagerInterop*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IProtectionPolicyManagerInterop*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IProtectionPolicyManagerInterop*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    request_access_for_window_async : Proc(IProtectionPolicyManagerInterop*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_for_window : Proc(IProtectionPolicyManagerInterop*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4652651d-c1fe-4ba1-9f0a-c0f56596f721")]
  record IProtectionPolicyManagerInterop, lpVtbl : IProtectionPolicyManagerInteropVtbl* do
    GUID = LibC::GUID.new(0x4652651d_u32, 0xc1fe_u16, 0x4ba1_u16, StaticArray[0x9f_u8, 0xa_u8, 0xc0_u8, 0xf5_u8, 0x65_u8, 0x96_u8, 0xf7_u8, 0x21_u8])
    def query_interface(this : IProtectionPolicyManagerInterop*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProtectionPolicyManagerInterop*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProtectionPolicyManagerInterop*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IProtectionPolicyManagerInterop*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IProtectionPolicyManagerInterop*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IProtectionPolicyManagerInterop*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def request_access_for_window_async(this : IProtectionPolicyManagerInterop*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, targetIdentity : Win32cr::System::WinRT::HSTRING, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_for_window_async.call(this, appWindow, sourceIdentity, targetIdentity, riid, asyncOperation)
    end
    def get_for_window(this : IProtectionPolicyManagerInterop*, appWindow : Win32cr::Foundation::HWND, riid : LibC::GUID*, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_for_window.call(this, appWindow, riid, result)
    end

  end

  @[Extern]
  record IProtectionPolicyManagerInterop2Vtbl,
    query_interface : Proc(IProtectionPolicyManagerInterop2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProtectionPolicyManagerInterop2*, UInt32),
    release : Proc(IProtectionPolicyManagerInterop2*, UInt32),
    get_iids : Proc(IProtectionPolicyManagerInterop2*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IProtectionPolicyManagerInterop2*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IProtectionPolicyManagerInterop2*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    request_access_for_app_with_window_async : Proc(IProtectionPolicyManagerInterop2*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_with_auditing_info_for_window_async : Proc(IProtectionPolicyManagerInterop2*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_with_message_for_window_async : Proc(IProtectionPolicyManagerInterop2*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, Void*, Win32cr::System::WinRT::HSTRING, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_for_app_with_auditing_info_for_window_async : Proc(IProtectionPolicyManagerInterop2*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_for_app_with_message_for_window_async : Proc(IProtectionPolicyManagerInterop2*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, Void*, Win32cr::System::WinRT::HSTRING, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("157cfbe4-a78d-4156-b384-61fdac41e686")]
  record IProtectionPolicyManagerInterop2, lpVtbl : IProtectionPolicyManagerInterop2Vtbl* do
    GUID = LibC::GUID.new(0x157cfbe4_u32, 0xa78d_u16, 0x4156_u16, StaticArray[0xb3_u8, 0x84_u8, 0x61_u8, 0xfd_u8, 0xac_u8, 0x41_u8, 0xe6_u8, 0x86_u8])
    def query_interface(this : IProtectionPolicyManagerInterop2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProtectionPolicyManagerInterop2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProtectionPolicyManagerInterop2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IProtectionPolicyManagerInterop2*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IProtectionPolicyManagerInterop2*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IProtectionPolicyManagerInterop2*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def request_access_for_app_with_window_async(this : IProtectionPolicyManagerInterop2*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, appPackageFamilyName : Win32cr::System::WinRT::HSTRING, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_for_app_with_window_async.call(this, appWindow, sourceIdentity, appPackageFamilyName, riid, asyncOperation)
    end
    def request_access_with_auditing_info_for_window_async(this : IProtectionPolicyManagerInterop2*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, targetIdentity : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_with_auditing_info_for_window_async.call(this, appWindow, sourceIdentity, targetIdentity, auditInfoUnk, riid, asyncOperation)
    end
    def request_access_with_message_for_window_async(this : IProtectionPolicyManagerInterop2*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, targetIdentity : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, messageFromApp : Win32cr::System::WinRT::HSTRING, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_with_message_for_window_async.call(this, appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, riid, asyncOperation)
    end
    def request_access_for_app_with_auditing_info_for_window_async(this : IProtectionPolicyManagerInterop2*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, appPackageFamilyName : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_for_app_with_auditing_info_for_window_async.call(this, appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, riid, asyncOperation)
    end
    def request_access_for_app_with_message_for_window_async(this : IProtectionPolicyManagerInterop2*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, appPackageFamilyName : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, messageFromApp : Win32cr::System::WinRT::HSTRING, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_for_app_with_message_for_window_async.call(this, appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, riid, asyncOperation)
    end

  end

  @[Extern]
  record IProtectionPolicyManagerInterop3Vtbl,
    query_interface : Proc(IProtectionPolicyManagerInterop3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProtectionPolicyManagerInterop3*, UInt32),
    release : Proc(IProtectionPolicyManagerInterop3*, UInt32),
    get_iids : Proc(IProtectionPolicyManagerInterop3*, UInt32*, LibC::GUID**, Win32cr::Foundation::HRESULT),
    get_runtime_class_name : Proc(IProtectionPolicyManagerInterop3*, Win32cr::System::WinRT::HSTRING*, Win32cr::Foundation::HRESULT),
    get_trust_level : Proc(IProtectionPolicyManagerInterop3*, Win32cr::System::WinRT::TrustLevel*, Win32cr::Foundation::HRESULT),
    request_access_with_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, Void*, Win32cr::System::WinRT::HSTRING, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_for_app_with_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, Win32cr::Foundation::HWND, Win32cr::System::WinRT::HSTRING, Win32cr::System::WinRT::HSTRING, Void*, Win32cr::System::WinRT::HSTRING, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_to_files_for_app_for_window_async : Proc(IProtectionPolicyManagerInterop3*, Win32cr::Foundation::HWND, Void*, Win32cr::System::WinRT::HSTRING, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_to_files_for_app_with_message_and_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, Win32cr::Foundation::HWND, Void*, Win32cr::System::WinRT::HSTRING, Void*, Win32cr::System::WinRT::HSTRING, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_to_files_for_process_for_window_async : Proc(IProtectionPolicyManagerInterop3*, Win32cr::Foundation::HWND, Void*, UInt32, Void*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    request_access_to_files_for_process_with_message_and_behavior_for_window_async : Proc(IProtectionPolicyManagerInterop3*, Win32cr::Foundation::HWND, Void*, UInt32, Void*, Win32cr::System::WinRT::HSTRING, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c1c03933-b398-4d93-b0fd-2972adf802c2")]
  record IProtectionPolicyManagerInterop3, lpVtbl : IProtectionPolicyManagerInterop3Vtbl* do
    GUID = LibC::GUID.new(0xc1c03933_u32, 0xb398_u16, 0x4d93_u16, StaticArray[0xb0_u8, 0xfd_u8, 0x29_u8, 0x72_u8, 0xad_u8, 0xf8_u8, 0x2_u8, 0xc2_u8])
    def query_interface(this : IProtectionPolicyManagerInterop3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProtectionPolicyManagerInterop3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProtectionPolicyManagerInterop3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_iids(this : IProtectionPolicyManagerInterop3*, iidCount : UInt32*, iids : LibC::GUID**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_iids.call(this, iidCount, iids)
    end
    def get_runtime_class_name(this : IProtectionPolicyManagerInterop3*, className : Win32cr::System::WinRT::HSTRING*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_class_name.call(this, className)
    end
    def get_trust_level(this : IProtectionPolicyManagerInterop3*, trustLevel : Win32cr::System::WinRT::TrustLevel*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_trust_level.call(this, trustLevel)
    end
    def request_access_with_behavior_for_window_async(this : IProtectionPolicyManagerInterop3*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, targetIdentity : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, messageFromApp : Win32cr::System::WinRT::HSTRING, behavior : UInt32, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_with_behavior_for_window_async.call(this, appWindow, sourceIdentity, targetIdentity, auditInfoUnk, messageFromApp, behavior, riid, asyncOperation)
    end
    def request_access_for_app_with_behavior_for_window_async(this : IProtectionPolicyManagerInterop3*, appWindow : Win32cr::Foundation::HWND, sourceIdentity : Win32cr::System::WinRT::HSTRING, appPackageFamilyName : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, messageFromApp : Win32cr::System::WinRT::HSTRING, behavior : UInt32, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_for_app_with_behavior_for_window_async.call(this, appWindow, sourceIdentity, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid, asyncOperation)
    end
    def request_access_to_files_for_app_for_window_async(this : IProtectionPolicyManagerInterop3*, appWindow : Win32cr::Foundation::HWND, sourceItemListUnk : Void*, appPackageFamilyName : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_to_files_for_app_for_window_async.call(this, appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, riid, asyncOperation)
    end
    def request_access_to_files_for_app_with_message_and_behavior_for_window_async(this : IProtectionPolicyManagerInterop3*, appWindow : Win32cr::Foundation::HWND, sourceItemListUnk : Void*, appPackageFamilyName : Win32cr::System::WinRT::HSTRING, auditInfoUnk : Void*, messageFromApp : Win32cr::System::WinRT::HSTRING, behavior : UInt32, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_to_files_for_app_with_message_and_behavior_for_window_async.call(this, appWindow, sourceItemListUnk, appPackageFamilyName, auditInfoUnk, messageFromApp, behavior, riid, asyncOperation)
    end
    def request_access_to_files_for_process_for_window_async(this : IProtectionPolicyManagerInterop3*, appWindow : Win32cr::Foundation::HWND, sourceItemListUnk : Void*, processId : UInt32, auditInfoUnk : Void*, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_to_files_for_process_for_window_async.call(this, appWindow, sourceItemListUnk, processId, auditInfoUnk, riid, asyncOperation)
    end
    def request_access_to_files_for_process_with_message_and_behavior_for_window_async(this : IProtectionPolicyManagerInterop3*, appWindow : Win32cr::Foundation::HWND, sourceItemListUnk : Void*, processId : UInt32, auditInfoUnk : Void*, messageFromApp : Win32cr::System::WinRT::HSTRING, behavior : UInt32, riid : LibC::GUID*, asyncOperation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_access_to_files_for_process_with_message_and_behavior_for_window_async.call(this, appWindow, sourceItemListUnk, processId, auditInfoUnk, messageFromApp, behavior, riid, asyncOperation)
    end

  end

  @[Link("srpapi")]
  @[Link("efswrt")]
  lib C
    fun SrpCreateThreadNetworkContext(enterpriseId : Win32cr::Foundation::PWSTR, threadNetworkContext : Win32cr::Security::EnterpriseData::HTHREAD_NETWORK_CONTEXT*) : Win32cr::Foundation::HRESULT

    fun SrpCloseThreadNetworkContext(threadNetworkContext : Win32cr::Security::EnterpriseData::HTHREAD_NETWORK_CONTEXT*) : Win32cr::Foundation::HRESULT

    fun SrpSetTokenEnterpriseId(tokenHandle : Win32cr::Foundation::HANDLE, enterpriseId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SrpGetEnterpriseIds(tokenHandle : Win32cr::Foundation::HANDLE, numberOfBytes : UInt32*, enterpriseIds : Win32cr::Foundation::PWSTR*, enterpriseIdCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun SrpEnablePermissiveModeFileEncryption(enterpriseId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun SrpDisablePermissiveModeFileEncryption : Win32cr::Foundation::HRESULT

    fun SrpGetEnterprisePolicy(tokenHandle : Win32cr::Foundation::HANDLE, policyFlags : Win32cr::Security::EnterpriseData::ENTERPRISE_DATA_POLICIES*) : Win32cr::Foundation::HRESULT

    fun SrpIsTokenService(token_handle : Win32cr::Foundation::HANDLE, is_token_service : UInt8*) : Win32cr::Foundation::NTSTATUS

    fun SrpDoesPolicyAllowAppExecution(packageId : Win32cr::Storage::Packaging::Appx::PACKAGE_ID*, isAllowed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun SrpHostingInitialize(version : Win32cr::Security::EnterpriseData::SRPHOSTING_VERSION, type__ : Win32cr::Security::EnterpriseData::SRPHOSTING_TYPE, pvData : Void*, cbData : UInt32) : Win32cr::Foundation::HRESULT

    fun SrpHostingTerminate(type__ : Win32cr::Security::EnterpriseData::SRPHOSTING_TYPE) : Void

    fun ProtectFileToEnterpriseIdentity(fileOrFolderPath : Win32cr::Foundation::PWSTR, identity : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun UnprotectFile(fileOrFolderPath : Win32cr::Foundation::PWSTR, options : Win32cr::Security::EnterpriseData::FILE_UNPROTECT_OPTIONS*) : Win32cr::Foundation::HRESULT

  end
end