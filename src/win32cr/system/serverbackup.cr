require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  WSB_MAX_OB_STATUS_VALUE_TYPE_PAIR = 5_u32
  WSB_MAX_OB_STATUS_ENTRY = 5_u32
  WSBAPP_ASYNC_IN_PROGRESS = 7995396_i32


  enum WSB_OB_STATUS_ENTRY_PAIR_TYPE : Int32
    WSB_OB_ET_UNDEFINED = 0
    WSB_OB_ET_STRING = 1
    WSB_OB_ET_NUMBER = 2
    WSB_OB_ET_DATETIME = 3
    WSB_OB_ET_TIME = 4
    WSB_OB_ET_SIZE = 5
    WSB_OB_ET_MAX = 6
  end

  struct WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR
    m_wsz_ob_status_entry_pair_value : LibC::LPWSTR
    m_ob_status_entry_pair_type : WSB_OB_STATUS_ENTRY_PAIR_TYPE
  end
  struct WSB_OB_STATUS_ENTRY
    m_dw_icon : UInt32
    m_dw_status_entry_name : UInt32
    m_dw_status_entry_value : UInt32
    m_c_value_type_pair : UInt32
    m_rg_value_type_pair : WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR*
  end
  struct WSB_OB_STATUS_INFO
    m_guid_snapin_id : Guid
    m_c_status_entry : UInt32
    m_rg_status_entry : WSB_OB_STATUS_ENTRY*
  end
  struct WSB_OB_REGISTRATION_INFO
    m_wsz_resource_dll : LibC::LPWSTR
    m_guid_snapin_id : Guid
    m_dw_provider_name : UInt32
    m_dw_provider_icon : UInt32
    m_b_supports_remoting : BOOLEAN
  end


  struct IWsbApplicationBackupSupportVTbl
    query_interface : Proc(IWsbApplicationBackupSupport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWsbApplicationBackupSupport*, UInt32)
    release : Proc(IWsbApplicationBackupSupport*, UInt32)
    check_consistency : Proc(IWsbApplicationBackupSupport*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt32, LibC::LPWSTR*, LibC::LPWSTR*, IWsbApplicationAsync*, HRESULT)
  end

  IWsbApplicationBackupSupport_GUID = LibC::GUID.new("1eff3510-4a27-46ad-b9e0-08332f0f4f6d")
  CLSID_IWsbApplicationBackupSupport = "1eff3510-4a27-46ad-b9e0-08332f0f4f6d"
  struct IWsbApplicationBackupSupport
    lpVtbl : IWsbApplicationBackupSupportVTbl*
  end

  struct IWsbApplicationRestoreSupportVTbl
    query_interface : Proc(IWsbApplicationRestoreSupport*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWsbApplicationRestoreSupport*, UInt32)
    release : Proc(IWsbApplicationRestoreSupport*, UInt32)
    pre_restore : Proc(IWsbApplicationRestoreSupport*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, BOOLEAN, HRESULT)
    post_restore : Proc(IWsbApplicationRestoreSupport*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, BOOLEAN, HRESULT)
    order_components : Proc(IWsbApplicationRestoreSupport*, UInt32, LibC::LPWSTR*, LibC::LPWSTR*, LibC::LPWSTR**, LibC::LPWSTR**, HRESULT)
    is_roll_forward_supported : Proc(IWsbApplicationRestoreSupport*, UInt8*, HRESULT)
  end

  IWsbApplicationRestoreSupport_GUID = LibC::GUID.new("8d3bdb38-4ee8-4718-85f9-c7dbc4ab77aa")
  CLSID_IWsbApplicationRestoreSupport = "8d3bdb38-4ee8-4718-85f9-c7dbc4ab77aa"
  struct IWsbApplicationRestoreSupport
    lpVtbl : IWsbApplicationRestoreSupportVTbl*
  end

  struct IWsbApplicationAsyncVTbl
    query_interface : Proc(IWsbApplicationAsync*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWsbApplicationAsync*, UInt32)
    release : Proc(IWsbApplicationAsync*, UInt32)
    query_status : Proc(IWsbApplicationAsync*, HRESULT*, HRESULT)
    abort : Proc(IWsbApplicationAsync*, HRESULT)
  end

  IWsbApplicationAsync_GUID = LibC::GUID.new("0843f6f7-895c-44a6-b0c2-05a5022aa3a1")
  CLSID_IWsbApplicationAsync = "0843f6f7-895c-44a6-b0c2-05a5022aa3a1"
  struct IWsbApplicationAsync
    lpVtbl : IWsbApplicationAsyncVTbl*
  end

end
