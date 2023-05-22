require "../../foundation.cr"
require "../../security.cr"
require "../../system/com.cr"
require "../../ui/controls.cr"
require "../../security/authorization.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:aclui.dll")]
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

  struct ISecurityInformation2
    lpVtbl : ISecurityInformation2VTbl*
  end

  struct IEffectivePermissionVTbl
    query_interface : Proc(IEffectivePermission*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEffectivePermission*, UInt32)
    release : Proc(IEffectivePermission*, UInt32)
    get_effective_permission : Proc(IEffectivePermission*, Guid*, PSID, LibC::LPWSTR, SECURITY_DESCRIPTOR*, OBJECT_TYPE_LIST**, UInt32*, UInt32**, UInt32*, HRESULT)
  end

  struct IEffectivePermission
    lpVtbl : IEffectivePermissionVTbl*
  end

  struct ISecurityObjectTypeInfoVTbl
    query_interface : Proc(ISecurityObjectTypeInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityObjectTypeInfo*, UInt32)
    release : Proc(ISecurityObjectTypeInfo*, UInt32)
    get_inherit_source : Proc(ISecurityObjectTypeInfo*, UInt32, ACL*, INHERITED_FROMA**, HRESULT)
  end

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

  struct ISecurityInformation3
    lpVtbl : ISecurityInformation3VTbl*
  end

  struct ISecurityInformation4VTbl
    query_interface : Proc(ISecurityInformation4*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISecurityInformation4*, UInt32)
    release : Proc(ISecurityInformation4*, UInt32)
    get_secondary_security : Proc(ISecurityInformation4*, SECURITY_OBJECT**, UInt32*, HRESULT)
  end

  struct ISecurityInformation4
    lpVtbl : ISecurityInformation4VTbl*
  end

  struct IEffectivePermission2VTbl
    query_interface : Proc(IEffectivePermission2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEffectivePermission2*, UInt32)
    release : Proc(IEffectivePermission2*, UInt32)
    compute_effective_permission_with_secondary_security : Proc(IEffectivePermission2*, PSID, PSID, LibC::LPWSTR, SECURITY_OBJECT*, UInt32, TOKEN_GROUPS*, AUTHZ_SID_OPERATION*, TOKEN_GROUPS*, AUTHZ_SID_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, AUTHZ_SECURITY_ATTRIBUTES_INFORMATION*, AUTHZ_SECURITY_ATTRIBUTE_OPERATION*, EFFPERM_RESULT_LIST*, HRESULT)
  end

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
