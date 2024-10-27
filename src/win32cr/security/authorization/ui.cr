require "./../../foundation.cr"
require "./../../security.cr"
require "./../../system/com.cr"
require "./../../ui/controls.cr"
require "./../authorization.cr"

module Win32cr::Security::Authorization::UI
  SI_EDIT_PERMS = 0_i32
  SI_EDIT_OWNER = 1_i32
  SI_CONTAINER = 4_i32
  SI_READONLY = 8_i32
  SI_RESET = 32_i32
  SI_OWNER_READONLY = 64_i32
  SI_OWNER_RECURSE = 256_i32
  SI_NO_ACL_PROTECT = 512_i32
  SI_NO_TREE_APPLY = 1024_i32
  SI_PAGE_TITLE = 2048_i32
  SI_SERVER_IS_DC = 4096_i32
  SI_RESET_DACL_TREE = 16384_i32
  SI_RESET_SACL_TREE = 32768_i32
  SI_OBJECT_GUID = 65536_i32
  SI_ACCESS_SPECIFIC = 65536_i32
  SI_ACCESS_GENERAL = 131072_i32
  SI_ACCESS_CONTAINER = 262144_i32
  SI_ACCESS_PROPERTY = 524288_i32
  DOBJ_RES_CONT = 1_i32
  DOBJ_RES_ROOT = 2_i32
  DOBJ_VOL_NTACLS = 4_i32
  DOBJ_COND_NTACLS = 8_i32
  DOBJ_RIBBON_LAUNCH = 16_i32
  CFSTR_ACLUI_SID_INFO_LIST = "CFSTR_ACLUI_SID_INFO_LIST"
  SECURITY_OBJECT_ID_OBJECT_SD = 1_u32
  SECURITY_OBJECT_ID_SHARE = 2_u32
  SECURITY_OBJECT_ID_CENTRAL_POLICY = 3_u32
  SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE = 4_u32

  @[Flags]
  enum SECURITY_INFO_PAGE_FLAGS : UInt32
    SI_ADVANCED = 16_u32
    SI_EDIT_AUDITS = 2_u32
    SI_EDIT_PROPERTIES = 128_u32
  end
  @[Flags]
  enum SI_OBJECT_INFO_FLAGS : UInt32
    SI_AUDITS_ELEVATION_REQUIRED = 33554432_u32
    SI_DISABLE_DENY_ACE = 2147483648_u32
    SI_EDIT_EFFECTIVE = 131072_u32
    SI_ENABLE_CENTRAL_POLICY = 1073741824_u32
    SI_ENABLE_EDIT_ATTRIBUTE_CONDITION = 536870912_u32
    SI_MAY_WRITE = 268435456_u32
    SI_NO_ADDITIONAL_PERMISSION = 2097152_u32
    SI_OWNER_ELEVATION_REQUIRED = 67108864_u32
    SI_PERMS_ELEVATION_REQUIRED = 16777216_u32
    SI_RESET_DACL = 262144_u32
    SI_RESET_OWNER = 1048576_u32
    SI_RESET_SACL = 524288_u32
    SI_SCOPE_ELEVATION_REQUIRED = 134217728_u32
    SI_VIEW_ONLY = 4194304_u32
  end
  enum SI_PAGE_TYPE
    SI_PAGE_PERM = 0_i32
    SI_PAGE_ADVPERM = 1_i32
    SI_PAGE_AUDIT = 2_i32
    SI_PAGE_OWNER = 3_i32
    SI_PAGE_EFFECTIVE = 4_i32
    SI_PAGE_TAKEOWNERSHIP = 5_i32
    SI_PAGE_SHARE = 6_i32
  end
  enum SI_PAGE_ACTIVATED
    SI_SHOW_DEFAULT = 0_i32
    SI_SHOW_PERM_ACTIVATED = 1_i32
    SI_SHOW_AUDIT_ACTIVATED = 2_i32
    SI_SHOW_OWNER_ACTIVATED = 3_i32
    SI_SHOW_EFFECTIVE_ACTIVATED = 4_i32
    SI_SHOW_SHARE_ACTIVATED = 5_i32
    SI_SHOW_CENTRAL_POLICY_ACTIVATED = 6_i32
  end

  @[Extern]
  record SI_OBJECT_INFO,
    dwFlags : Win32cr::Security::Authorization::UI::SI_OBJECT_INFO_FLAGS,
    hInstance : Win32cr::Foundation::HINSTANCE,
    pszServerName : Win32cr::Foundation::PWSTR,
    pszObjectName : Win32cr::Foundation::PWSTR,
    pszPageTitle : Win32cr::Foundation::PWSTR,
    guidObjectType : LibC::GUID

  @[Extern]
  record SI_ACCESS,
    pguid : LibC::GUID*,
    mask : UInt32,
    pszName : Win32cr::Foundation::PWSTR,
    dwFlags : UInt32

  @[Extern]
  record SI_INHERIT_TYPE,
    pguid : LibC::GUID*,
    dwFlags : Win32cr::Security::ACE_FLAGS,
    pszName : Win32cr::Foundation::PWSTR

  @[Extern]
  record SID_INFO,
    pSid : Win32cr::Foundation::PSID,
    pwzCommonName : Win32cr::Foundation::PWSTR,
    pwzClass : Win32cr::Foundation::PWSTR,
    pwzUPN : Win32cr::Foundation::PWSTR

  @[Extern]
  record SID_INFO_LIST,
    cItems : UInt32,
    aSidInfo : Win32cr::Security::Authorization::UI::SID_INFO*

  @[Extern]
  record SECURITY_OBJECT,
    pwszName : Win32cr::Foundation::PWSTR,
    pData : Void*,
    cbData : UInt32,
    pData2 : Void*,
    cbData2 : UInt32,
    id : UInt32,
    fWellKnown : Win32cr::Foundation::BOOLEAN

  @[Extern]
  record EFFPERM_RESULT_LIST,
    fEvaluated : Win32cr::Foundation::BOOLEAN,
    cObjectTypeListLength : UInt32,
    pObjectTypeList : Win32cr::Security::OBJECT_TYPE_LIST*,
    pGrantedAccessList : UInt32*

  @[Extern]
  record ISecurityInformationVtbl,
    query_interface : Proc(ISecurityInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityInformation*, UInt32),
    release : Proc(ISecurityInformation*, UInt32),
    get_object_information : Proc(ISecurityInformation*, Win32cr::Security::Authorization::UI::SI_OBJECT_INFO*, Win32cr::Foundation::HRESULT),
    get_security : Proc(ISecurityInformation*, Win32cr::Security::OBJECT_SECURITY_INFORMATION, Win32cr::Security::PSECURITY_DESCRIPTOR*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_security : Proc(ISecurityInformation*, Win32cr::Security::OBJECT_SECURITY_INFORMATION, Win32cr::Security::PSECURITY_DESCRIPTOR, Win32cr::Foundation::HRESULT),
    get_access_rights : Proc(ISecurityInformation*, LibC::GUID*, Win32cr::Security::Authorization::UI::SECURITY_INFO_PAGE_FLAGS, Win32cr::Security::Authorization::UI::SI_ACCESS**, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    map_generic : Proc(ISecurityInformation*, LibC::GUID*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    get_inherit_types : Proc(ISecurityInformation*, Win32cr::Security::Authorization::UI::SI_INHERIT_TYPE**, UInt32*, Win32cr::Foundation::HRESULT),
    property_sheet_page_callback : Proc(ISecurityInformation*, Win32cr::Foundation::HWND, Win32cr::UI::Controls::PSPCB_MESSAGE, Win32cr::Security::Authorization::UI::SI_PAGE_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("965fc360-16ff-11d0-91cb-00aa00bbb723")]
  record ISecurityInformation, lpVtbl : ISecurityInformationVtbl* do
    GUID = LibC::GUID.new(0x965fc360_u32, 0x16ff_u16, 0x11d0_u16, StaticArray[0x91_u8, 0xcb_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbb_u8, 0xb7_u8, 0x23_u8])
    def query_interface(this : ISecurityInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_object_information(this : ISecurityInformation*, pObjectInfo : Win32cr::Security::Authorization::UI::SI_OBJECT_INFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_information.call(this, pObjectInfo)
    end
    def get_security(this : ISecurityInformation*, requested_information : Win32cr::Security::OBJECT_SECURITY_INFORMATION, ppSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR*, fDefault : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_security.call(this, requested_information, ppSecurityDescriptor, fDefault)
    end
    def set_security(this : ISecurityInformation*, security_information : Win32cr::Security::OBJECT_SECURITY_INFORMATION, pSecurityDescriptor : Win32cr::Security::PSECURITY_DESCRIPTOR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_security.call(this, security_information, pSecurityDescriptor)
    end
    def get_access_rights(this : ISecurityInformation*, pguidObjectType : LibC::GUID*, dwFlags : Win32cr::Security::Authorization::UI::SECURITY_INFO_PAGE_FLAGS, ppAccess : Win32cr::Security::Authorization::UI::SI_ACCESS**, pcAccesses : UInt32*, piDefaultAccess : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_access_rights.call(this, pguidObjectType, dwFlags, ppAccess, pcAccesses, piDefaultAccess)
    end
    def map_generic(this : ISecurityInformation*, pguidObjectType : LibC::GUID*, pAceFlags : UInt8*, pMask : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.map_generic.call(this, pguidObjectType, pAceFlags, pMask)
    end
    def get_inherit_types(this : ISecurityInformation*, ppInheritTypes : Win32cr::Security::Authorization::UI::SI_INHERIT_TYPE**, pcInheritTypes : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inherit_types.call(this, ppInheritTypes, pcInheritTypes)
    end
    def property_sheet_page_callback(this : ISecurityInformation*, hwnd : Win32cr::Foundation::HWND, uMsg : Win32cr::UI::Controls::PSPCB_MESSAGE, uPage : Win32cr::Security::Authorization::UI::SI_PAGE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.property_sheet_page_callback.call(this, hwnd, uMsg, uPage)
    end

  end

  @[Extern]
  record ISecurityInformation2Vtbl,
    query_interface : Proc(ISecurityInformation2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityInformation2*, UInt32),
    release : Proc(ISecurityInformation2*, UInt32),
    is_dacl_canonical : Proc(ISecurityInformation2*, Win32cr::Security::ACL*, Win32cr::Foundation::BOOL),
    lookup_sids : Proc(ISecurityInformation2*, UInt32, Win32cr::Foundation::PSID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c3ccfdb4-6f88-11d2-a3ce-00c04fb1782a")]
  record ISecurityInformation2, lpVtbl : ISecurityInformation2Vtbl* do
    GUID = LibC::GUID.new(0xc3ccfdb4_u32, 0x6f88_u16, 0x11d2_u16, StaticArray[0xa3_u8, 0xce_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb1_u8, 0x78_u8, 0x2a_u8])
    def query_interface(this : ISecurityInformation2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityInformation2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityInformation2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_dacl_canonical(this : ISecurityInformation2*, pDacl : Win32cr::Security::ACL*) : Win32cr::Foundation::BOOL
      @lpVtbl.try &.value.is_dacl_canonical.call(this, pDacl)
    end
    def lookup_sids(this : ISecurityInformation2*, cSids : UInt32, rgpSids : Win32cr::Foundation::PSID*, ppdo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_sids.call(this, cSids, rgpSids, ppdo)
    end

  end

  @[Extern]
  record IEffectivePermissionVtbl,
    query_interface : Proc(IEffectivePermission*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEffectivePermission*, UInt32),
    release : Proc(IEffectivePermission*, UInt32),
    get_effective_permission : Proc(IEffectivePermission*, LibC::GUID*, Win32cr::Foundation::PSID, Win32cr::Foundation::PWSTR, Win32cr::Security::PSECURITY_DESCRIPTOR, Win32cr::Security::OBJECT_TYPE_LIST**, UInt32*, UInt32**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3853dc76-9f35-407c-88a1-d19344365fbc")]
  record IEffectivePermission, lpVtbl : IEffectivePermissionVtbl* do
    GUID = LibC::GUID.new(0x3853dc76_u32, 0x9f35_u16, 0x407c_u16, StaticArray[0x88_u8, 0xa1_u8, 0xd1_u8, 0x93_u8, 0x44_u8, 0x36_u8, 0x5f_u8, 0xbc_u8])
    def query_interface(this : IEffectivePermission*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEffectivePermission*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEffectivePermission*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_effective_permission(this : IEffectivePermission*, pguidObjectType : LibC::GUID*, pUserSid : Win32cr::Foundation::PSID, pszServerName : Win32cr::Foundation::PWSTR, pSD : Win32cr::Security::PSECURITY_DESCRIPTOR, ppObjectTypeList : Win32cr::Security::OBJECT_TYPE_LIST**, pcObjectTypeListLength : UInt32*, ppGrantedAccessList : UInt32**, pcGrantedAccessListLength : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_effective_permission.call(this, pguidObjectType, pUserSid, pszServerName, pSD, ppObjectTypeList, pcObjectTypeListLength, ppGrantedAccessList, pcGrantedAccessListLength)
    end

  end

  @[Extern]
  record ISecurityObjectTypeInfoVtbl,
    query_interface : Proc(ISecurityObjectTypeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityObjectTypeInfo*, UInt32),
    release : Proc(ISecurityObjectTypeInfo*, UInt32),
    get_inherit_source : Proc(ISecurityObjectTypeInfo*, UInt32, Win32cr::Security::ACL*, Win32cr::Security::Authorization::INHERITED_FROMA**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fc3066eb-79ef-444b-9111-d18a75ebf2fa")]
  record ISecurityObjectTypeInfo, lpVtbl : ISecurityObjectTypeInfoVtbl* do
    GUID = LibC::GUID.new(0xfc3066eb_u32, 0x79ef_u16, 0x444b_u16, StaticArray[0x91_u8, 0x11_u8, 0xd1_u8, 0x8a_u8, 0x75_u8, 0xeb_u8, 0xf2_u8, 0xfa_u8])
    def query_interface(this : ISecurityObjectTypeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityObjectTypeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityObjectTypeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_inherit_source(this : ISecurityObjectTypeInfo*, si : UInt32, pACL : Win32cr::Security::ACL*, ppInheritArray : Win32cr::Security::Authorization::INHERITED_FROMA**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_inherit_source.call(this, si, pACL, ppInheritArray)
    end

  end

  @[Extern]
  record ISecurityInformation3Vtbl,
    query_interface : Proc(ISecurityInformation3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityInformation3*, UInt32),
    release : Proc(ISecurityInformation3*, UInt32),
    get_full_resource_name : Proc(ISecurityInformation3*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    open_elevated_editor : Proc(ISecurityInformation3*, Win32cr::Foundation::HWND, Win32cr::Security::Authorization::UI::SI_PAGE_TYPE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e2cdc9cc-31bd-4f8f-8c8b-b641af516a1a")]
  record ISecurityInformation3, lpVtbl : ISecurityInformation3Vtbl* do
    GUID = LibC::GUID.new(0xe2cdc9cc_u32, 0x31bd_u16, 0x4f8f_u16, StaticArray[0x8c_u8, 0x8b_u8, 0xb6_u8, 0x41_u8, 0xaf_u8, 0x51_u8, 0x6a_u8, 0x1a_u8])
    def query_interface(this : ISecurityInformation3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityInformation3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityInformation3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_full_resource_name(this : ISecurityInformation3*, ppszResourceName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_full_resource_name.call(this, ppszResourceName)
    end
    def open_elevated_editor(this : ISecurityInformation3*, hWnd : Win32cr::Foundation::HWND, uPage : Win32cr::Security::Authorization::UI::SI_PAGE_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_elevated_editor.call(this, hWnd, uPage)
    end

  end

  @[Extern]
  record ISecurityInformation4Vtbl,
    query_interface : Proc(ISecurityInformation4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISecurityInformation4*, UInt32),
    release : Proc(ISecurityInformation4*, UInt32),
    get_secondary_security : Proc(ISecurityInformation4*, Win32cr::Security::Authorization::UI::SECURITY_OBJECT**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea961070-cd14-4621-ace4-f63c03e583e4")]
  record ISecurityInformation4, lpVtbl : ISecurityInformation4Vtbl* do
    GUID = LibC::GUID.new(0xea961070_u32, 0xcd14_u16, 0x4621_u16, StaticArray[0xac_u8, 0xe4_u8, 0xf6_u8, 0x3c_u8, 0x3_u8, 0xe5_u8, 0x83_u8, 0xe4_u8])
    def query_interface(this : ISecurityInformation4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISecurityInformation4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISecurityInformation4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_secondary_security(this : ISecurityInformation4*, pSecurityObjects : Win32cr::Security::Authorization::UI::SECURITY_OBJECT**, pSecurityObjectCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_secondary_security.call(this, pSecurityObjects, pSecurityObjectCount)
    end

  end

  @[Extern]
  record IEffectivePermission2Vtbl,
    query_interface : Proc(IEffectivePermission2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEffectivePermission2*, UInt32),
    release : Proc(IEffectivePermission2*, UInt32),
    compute_effective_permission_with_secondary_security : Proc(IEffectivePermission2*, Win32cr::Foundation::PSID, Win32cr::Foundation::PSID, Win32cr::Foundation::PWSTR, Win32cr::Security::Authorization::UI::SECURITY_OBJECT*, UInt32, Win32cr::Security::TOKEN_GROUPS*, Win32cr::Security::Authorization::AUTHZ_SID_OPERATION*, Win32cr::Security::TOKEN_GROUPS*, Win32cr::Security::Authorization::AUTHZ_SID_OPERATION*, Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, Win32cr::Security::Authorization::UI::EFFPERM_RESULT_LIST*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("941fabca-dd47-4fca-90bb-b0e10255f20d")]
  record IEffectivePermission2, lpVtbl : IEffectivePermission2Vtbl* do
    GUID = LibC::GUID.new(0x941fabca_u32, 0xdd47_u16, 0x4fca_u16, StaticArray[0x90_u8, 0xbb_u8, 0xb0_u8, 0xe1_u8, 0x2_u8, 0x55_u8, 0xf2_u8, 0xd_u8])
    def query_interface(this : IEffectivePermission2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEffectivePermission2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEffectivePermission2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compute_effective_permission_with_secondary_security(this : IEffectivePermission2*, pSid : Win32cr::Foundation::PSID, pDeviceSid : Win32cr::Foundation::PSID, pszServerName : Win32cr::Foundation::PWSTR, pSecurityObjects : Win32cr::Security::Authorization::UI::SECURITY_OBJECT*, dwSecurityObjectCount : UInt32, pUserGroups : Win32cr::Security::TOKEN_GROUPS*, pAuthzUserGroupsOperations : Win32cr::Security::Authorization::AUTHZ_SID_OPERATION*, pDeviceGroups : Win32cr::Security::TOKEN_GROUPS*, pAuthzDeviceGroupsOperations : Win32cr::Security::Authorization::AUTHZ_SID_OPERATION*, pAuthzUserClaims : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, pAuthzUserClaimsOperations : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pAuthzDeviceClaims : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, pAuthzDeviceClaimsOperations : Win32cr::Security::Authorization::AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pEffpermResultLists : Win32cr::Security::Authorization::UI::EFFPERM_RESULT_LIST*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compute_effective_permission_with_secondary_security.call(this, pSid, pDeviceSid, pszServerName, pSecurityObjects, dwSecurityObjectCount, pUserGroups, pAuthzUserGroupsOperations, pDeviceGroups, pAuthzDeviceGroupsOperations, pAuthzUserClaims, pAuthzUserClaimsOperations, pAuthzDeviceClaims, pAuthzDeviceClaimsOperations, pEffpermResultLists)
    end

  end

  @[Link("aclui")]
  lib C
    fun CreateSecurityPage(psi : Void*) : Win32cr::UI::Controls::HPROPSHEETPAGE

    fun EditSecurity(hwndOwner : Win32cr::Foundation::HWND, psi : Void*) : Win32cr::Foundation::BOOL

    fun EditSecurityAdvanced(hwndOwner : Win32cr::Foundation::HWND, psi : Void*, uSIPage : Win32cr::Security::Authorization::UI::SI_PAGE_TYPE) : Win32cr::Foundation::HRESULT

  end
end