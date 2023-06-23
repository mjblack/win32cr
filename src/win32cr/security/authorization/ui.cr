require "../../foundation.cr"
require "../../security.cr"
require "../../system/com.cr"
require "../../ui/controls.cr"
require "../../security/authorization.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:aclui.dll")]
{% else %}
@[Link("aclui")]
{% end %}
lib LibWin32
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
  SECURITY_OBJECT_ID_OBJECT_SD = 1_u32
  SECURITY_OBJECT_ID_SHARE = 2_u32
  SECURITY_OBJECT_ID_CENTRAL_POLICY = 3_u32
  SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE = 4_u32


  enum SECURITY_INFO_PAGE_FLAGS : UInt32
    SI_ADVANCED = 16
    SI_EDIT_AUDITS = 2
    SI_EDIT_PROPERTIES = 128
  end

  enum SI_OBJECT_INFO_FLAGS : UInt32
    SI_AUDITS_ELEVATION_REQUIRED = 33554432
    SI_DISABLE_DENY_ACE = 2147483648
    SI_EDIT_EFFECTIVE = 131072
    SI_ENABLE_CENTRAL_POLICY = 1073741824
    SI_ENABLE_EDIT_ATTRIBUTE_CONDITION = 536870912
    SI_MAY_WRITE = 268435456
    SI_NO_ADDITIONAL_PERMISSION = 2097152
    SI_OWNER_ELEVATION_REQUIRED = 67108864
    SI_PERMS_ELEVATION_REQUIRED = 16777216
    SI_RESET_DACL = 262144
    SI_RESET_OWNER = 1048576
    SI_RESET_SACL = 524288
    SI_SCOPE_ELEVATION_REQUIRED = 134217728
    SI_VIEW_ONLY = 4194304
  end

  enum SI_PAGE_TYPE : Int32
    SI_PAGE_PERM = 0
    SI_PAGE_ADVPERM = 1
    SI_PAGE_AUDIT = 2
    SI_PAGE_OWNER = 3
    SI_PAGE_EFFECTIVE = 4
    SI_PAGE_TAKEOWNERSHIP = 5
    SI_PAGE_SHARE = 6
  end

  enum SI_PAGE_ACTIVATED : Int32
    SI_SHOW_DEFAULT = 0
    SI_SHOW_PERM_ACTIVATED = 1
    SI_SHOW_AUDIT_ACTIVATED = 2
    SI_SHOW_OWNER_ACTIVATED = 3
    SI_SHOW_EFFECTIVE_ACTIVATED = 4
    SI_SHOW_SHARE_ACTIVATED = 5
    SI_SHOW_CENTRAL_POLICY_ACTIVATED = 6
  end

  struct SI_OBJECT_INFO
    dw_flags : SI_OBJECT_INFO_FLAGS
    h_instance : HINSTANCE
    psz_server_name : LibC::LPWSTR
    psz_object_name : LibC::LPWSTR
    psz_page_title : LibC::LPWSTR
    guid_object_type : Guid
  end
  struct SI_ACCESS
    pguid : Guid*
    mask : UInt32
    psz_name : LibC::LPWSTR
    dw_flags : UInt32
  end
  struct SI_INHERIT_TYPE
    pguid : Guid*
    dw_flags : ACE_FLAGS
    psz_name : LibC::LPWSTR
  end
  struct SID_INFO
    p_sid : PSID
    pwz_common_name : LibC::LPWSTR
    pwz_class : LibC::LPWSTR
    pwz_upn : LibC::LPWSTR
  end
  struct SID_INFO_LIST
    c_items : UInt32
    a_sid_info : SID_INFO[0]*
  end
  struct SECURITY_OBJECT
    pwsz_name : LibC::LPWSTR
    p_data : Void*
    cb_data : UInt32
    p_data2 : Void*
    cb_data2 : UInt32
    id : UInt32
    f_well_known : BOOLEAN
  end
  struct EFFPERM_RESULT_LIST
    f_evaluated : BOOLEAN
    c_object_type_list_length : UInt32
    p_object_type_list : OBJECT_TYPE_LIST*
    p_granted_access_list : UInt32*
  end


  struct ISecurityInformationVTbl
    query_interface : Proc(ISecurityInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityInformation*, UInt32)
    release : Proc(ISecurityInformation*, UInt32)
    get_object_information : Proc(ISecurityInformation*, SI_OBJECT_INFO*, HRESULT)
    get_security : Proc(ISecurityInformation*, OBJECT_SECURITY_INFORMATION, SECURITY_DESCRIPTOR**, LibC::BOOL, HRESULT)
    set_security : Proc(ISecurityInformation*, OBJECT_SECURITY_INFORMATION, SECURITY_DESCRIPTOR*, HRESULT)
    get_access_rights : Proc(ISecurityInformation*, Guid*, SECURITY_INFO_PAGE_FLAGS, SI_ACCESS**, UInt32*, UInt32*, HRESULT)
    map_generic : Proc(ISecurityInformation*, Guid*, UInt8*, UInt32*, HRESULT)
    get_inherit_types : Proc(ISecurityInformation*, SI_INHERIT_TYPE**, UInt32*, HRESULT)
    property_sheet_page_callback : Proc(ISecurityInformation*, LibC::HANDLE, PSPCB_MESSAGE, SI_PAGE_TYPE, HRESULT)
  end

  ISecurityInformation_GUID = "965fc360-16ff-11d0-91cb-00aa00bbb723"
  IID_ISecurityInformation = LibC::GUID.new(0x965fc360_u32, 0x16ff_u16, 0x11d0_u16, StaticArray[0x91_u8, 0xcb_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0xbb_u8, 0xb7_u8, 0x23_u8])
  struct ISecurityInformation
    lpVtbl : ISecurityInformationVTbl*
  end

  struct ISecurityInformation2VTbl
    query_interface : Proc(ISecurityInformation2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityInformation2*, UInt32)
    release : Proc(ISecurityInformation2*, UInt32)
    is_dacl_canonical : Proc(ISecurityInformation2*, ACL*, LibC::BOOL)
    lookup_sids : Proc(ISecurityInformation2*, UInt32, PSID*, IDataObject*, HRESULT)
  end

  ISecurityInformation2_GUID = "c3ccfdb4-6f88-11d2-a3ce-00c04fb1782a"
  IID_ISecurityInformation2 = LibC::GUID.new(0xc3ccfdb4_u32, 0x6f88_u16, 0x11d2_u16, StaticArray[0xa3_u8, 0xce_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb1_u8, 0x78_u8, 0x2a_u8])
  struct ISecurityInformation2
    lpVtbl : ISecurityInformation2VTbl*
  end

  struct IEffectivePermissionVTbl
    query_interface : Proc(IEffectivePermission*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEffectivePermission*, UInt32)
    release : Proc(IEffectivePermission*, UInt32)
    get_effective_permission : Proc(IEffectivePermission*, Guid*, PSID, LibC::LPWSTR, SECURITY_DESCRIPTOR*, OBJECT_TYPE_LIST**, UInt32*, UInt32**, UInt32*, HRESULT)
  end

  IEffectivePermission_GUID = "3853dc76-9f35-407c-88a1-d19344365fbc"
  IID_IEffectivePermission = LibC::GUID.new(0x3853dc76_u32, 0x9f35_u16, 0x407c_u16, StaticArray[0x88_u8, 0xa1_u8, 0xd1_u8, 0x93_u8, 0x44_u8, 0x36_u8, 0x5f_u8, 0xbc_u8])
  struct IEffectivePermission
    lpVtbl : IEffectivePermissionVTbl*
  end

  struct ISecurityObjectTypeInfoVTbl
    query_interface : Proc(ISecurityObjectTypeInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityObjectTypeInfo*, UInt32)
    release : Proc(ISecurityObjectTypeInfo*, UInt32)
    get_inherit_source : Proc(ISecurityObjectTypeInfo*, UInt32, ACL*, INHERITED_FROMA**, HRESULT)
  end

  ISecurityObjectTypeInfo_GUID = "fc3066eb-79ef-444b-9111-d18a75ebf2fa"
  IID_ISecurityObjectTypeInfo = LibC::GUID.new(0xfc3066eb_u32, 0x79ef_u16, 0x444b_u16, StaticArray[0x91_u8, 0x11_u8, 0xd1_u8, 0x8a_u8, 0x75_u8, 0xeb_u8, 0xf2_u8, 0xfa_u8])
  struct ISecurityObjectTypeInfo
    lpVtbl : ISecurityObjectTypeInfoVTbl*
  end

  struct ISecurityInformation3VTbl
    query_interface : Proc(ISecurityInformation3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityInformation3*, UInt32)
    release : Proc(ISecurityInformation3*, UInt32)
    get_full_resource_name : Proc(ISecurityInformation3*, LibC::LPWSTR*, HRESULT)
    open_elevated_editor : Proc(ISecurityInformation3*, LibC::HANDLE, SI_PAGE_TYPE, HRESULT)
  end

  ISecurityInformation3_GUID = "e2cdc9cc-31bd-4f8f-8c8b-b641af516a1a"
  IID_ISecurityInformation3 = LibC::GUID.new(0xe2cdc9cc_u32, 0x31bd_u16, 0x4f8f_u16, StaticArray[0x8c_u8, 0x8b_u8, 0xb6_u8, 0x41_u8, 0xaf_u8, 0x51_u8, 0x6a_u8, 0x1a_u8])
  struct ISecurityInformation3
    lpVtbl : ISecurityInformation3VTbl*
  end

  struct ISecurityInformation4VTbl
    query_interface : Proc(ISecurityInformation4*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityInformation4*, UInt32)
    release : Proc(ISecurityInformation4*, UInt32)
    get_secondary_security : Proc(ISecurityInformation4*, SECURITY_OBJECT**, UInt32*, HRESULT)
  end

  ISecurityInformation4_GUID = "ea961070-cd14-4621-ace4-f63c03e583e4"
  IID_ISecurityInformation4 = LibC::GUID.new(0xea961070_u32, 0xcd14_u16, 0x4621_u16, StaticArray[0xac_u8, 0xe4_u8, 0xf6_u8, 0x3c_u8, 0x3_u8, 0xe5_u8, 0x83_u8, 0xe4_u8])
  struct ISecurityInformation4
    lpVtbl : ISecurityInformation4VTbl*
  end

  struct IEffectivePermission2VTbl
    query_interface : Proc(IEffectivePermission2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEffectivePermission2*, UInt32)
    release : Proc(IEffectivePermission2*, UInt32)
    compute_effective_permission_with_secondary_security : Proc(IEffectivePermission2*, PSID, PSID, LibC::LPWSTR, SECURITY_OBJECT*, UInt32, TOKEN_GROUPS*, AUTHZ_SID_OPERATION*, TOKEN_GROUPS*, AUTHZ_SID_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, EFFPERM_RESULT_LIST*, HRESULT)
  end

  IEffectivePermission2_GUID = "941fabca-dd47-4fca-90bb-b0e10255f20d"
  IID_IEffectivePermission2 = LibC::GUID.new(0x941fabca_u32, 0xdd47_u16, 0x4fca_u16, StaticArray[0x90_u8, 0xbb_u8, 0xb0_u8, 0xe1_u8, 0x2_u8, 0x55_u8, 0xf2_u8, 0xd_u8])
  struct IEffectivePermission2
    lpVtbl : IEffectivePermission2VTbl*
  end


  # Params # psi : ISecurityInformation [In]
  fun CreateSecurityPage(psi : ISecurityInformation) : HPROPSHEETPAGE

  # Params # hwndowner : LibC::HANDLE [In],psi : ISecurityInformation [In]
  fun EditSecurity(hwndowner : LibC::HANDLE, psi : ISecurityInformation) : LibC::BOOL

  # Params # hwndowner : LibC::HANDLE [In],psi : ISecurityInformation [In],usipage : SI_PAGE_TYPE [In]
  fun EditSecurityAdvanced(hwndowner : LibC::HANDLE, psi : ISecurityInformation, usipage : SI_PAGE_TYPE) : HRESULT
end
struct LibWin32::ISecurityInformation
  def query_interface(this : ISecurityInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_object_information(this : ISecurityInformation*, pobjectinfo : SI_OBJECT_INFO*) : HRESULT
    @lpVtbl.value.get_object_information.call(this, pobjectinfo)
  end
  def get_security(this : ISecurityInformation*, requestedinformation : OBJECT_SECURITY_INFORMATION, ppsecuritydescriptor : SECURITY_DESCRIPTOR**, fdefault : LibC::BOOL) : HRESULT
    @lpVtbl.value.get_security.call(this, requestedinformation, ppsecuritydescriptor, fdefault)
  end
  def set_security(this : ISecurityInformation*, securityinformation : OBJECT_SECURITY_INFORMATION, psecuritydescriptor : SECURITY_DESCRIPTOR*) : HRESULT
    @lpVtbl.value.set_security.call(this, securityinformation, psecuritydescriptor)
  end
  def get_access_rights(this : ISecurityInformation*, pguidobjecttype : Guid*, dwflags : SECURITY_INFO_PAGE_FLAGS, ppaccess : SI_ACCESS**, pcaccesses : UInt32*, pidefaultaccess : UInt32*) : HRESULT
    @lpVtbl.value.get_access_rights.call(this, pguidobjecttype, dwflags, ppaccess, pcaccesses, pidefaultaccess)
  end
  def map_generic(this : ISecurityInformation*, pguidobjecttype : Guid*, paceflags : UInt8*, pmask : UInt32*) : HRESULT
    @lpVtbl.value.map_generic.call(this, pguidobjecttype, paceflags, pmask)
  end
  def get_inherit_types(this : ISecurityInformation*, ppinherittypes : SI_INHERIT_TYPE**, pcinherittypes : UInt32*) : HRESULT
    @lpVtbl.value.get_inherit_types.call(this, ppinherittypes, pcinherittypes)
  end
  def property_sheet_page_callback(this : ISecurityInformation*, hwnd : LibC::HANDLE, umsg : PSPCB_MESSAGE, upage : SI_PAGE_TYPE) : HRESULT
    @lpVtbl.value.property_sheet_page_callback.call(this, hwnd, umsg, upage)
  end
end
struct LibWin32::ISecurityInformation2
  def query_interface(this : ISecurityInformation2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityInformation2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityInformation2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def is_dacl_canonical(this : ISecurityInformation2*, pdacl : ACL*) : LibC::BOOL
    @lpVtbl.value.is_dacl_canonical.call(this, pdacl)
  end
  def lookup_sids(this : ISecurityInformation2*, csids : UInt32, rgpsids : PSID*, ppdo : IDataObject*) : HRESULT
    @lpVtbl.value.lookup_sids.call(this, csids, rgpsids, ppdo)
  end
end
struct LibWin32::IEffectivePermission
  def query_interface(this : IEffectivePermission*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEffectivePermission*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEffectivePermission*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_effective_permission(this : IEffectivePermission*, pguidobjecttype : Guid*, pusersid : PSID, pszservername : LibC::LPWSTR, psd : SECURITY_DESCRIPTOR*, ppobjecttypelist : OBJECT_TYPE_LIST**, pcobjecttypelistlength : UInt32*, ppgrantedaccesslist : UInt32**, pcgrantedaccesslistlength : UInt32*) : HRESULT
    @lpVtbl.value.get_effective_permission.call(this, pguidobjecttype, pusersid, pszservername, psd, ppobjecttypelist, pcobjecttypelistlength, ppgrantedaccesslist, pcgrantedaccesslistlength)
  end
end
struct LibWin32::ISecurityObjectTypeInfo
  def query_interface(this : ISecurityObjectTypeInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityObjectTypeInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityObjectTypeInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_inherit_source(this : ISecurityObjectTypeInfo*, si : UInt32, pacl : ACL*, ppinheritarray : INHERITED_FROMA**) : HRESULT
    @lpVtbl.value.get_inherit_source.call(this, si, pacl, ppinheritarray)
  end
end
struct LibWin32::ISecurityInformation3
  def query_interface(this : ISecurityInformation3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityInformation3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityInformation3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_full_resource_name(this : ISecurityInformation3*, ppszresourcename : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_full_resource_name.call(this, ppszresourcename)
  end
  def open_elevated_editor(this : ISecurityInformation3*, hwnd : LibC::HANDLE, upage : SI_PAGE_TYPE) : HRESULT
    @lpVtbl.value.open_elevated_editor.call(this, hwnd, upage)
  end
end
struct LibWin32::ISecurityInformation4
  def query_interface(this : ISecurityInformation4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISecurityInformation4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISecurityInformation4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_secondary_security(this : ISecurityInformation4*, psecurityobjects : SECURITY_OBJECT**, psecurityobjectcount : UInt32*) : HRESULT
    @lpVtbl.value.get_secondary_security.call(this, psecurityobjects, psecurityobjectcount)
  end
end
struct LibWin32::IEffectivePermission2
  def query_interface(this : IEffectivePermission2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IEffectivePermission2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IEffectivePermission2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compute_effective_permission_with_secondary_security(this : IEffectivePermission2*, psid : PSID, pdevicesid : PSID, pszservername : LibC::LPWSTR, psecurityobjects : SECURITY_OBJECT*, dwsecurityobjectcount : UInt32, pusergroups : TOKEN_GROUPS*, pauthzusergroupsoperations : AUTHZ_SID_OPERATION*, pdevicegroups : TOKEN_GROUPS*, pauthzdevicegroupsoperations : AUTHZ_SID_OPERATION*, pauthzuserclaims : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, pauthzuserclaimsoperations : AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, pauthzdeviceclaims : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, pauthzdeviceclaimsoperations : AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, peffpermresultlists : EFFPERM_RESULT_LIST*) : HRESULT
    @lpVtbl.value.compute_effective_permission_with_secondary_security.call(this, psid, pdevicesid, pszservername, psecurityobjects, dwsecurityobjectcount, pusergroups, pauthzusergroupsoperations, pdevicegroups, pauthzdevicegroupsoperations, pauthzuserclaims, pauthzuserclaimsoperations, pauthzdeviceclaims, pauthzdeviceclaimsoperations, peffpermresultlists)
  end
end
