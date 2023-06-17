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

  IWsbApplicationBackupSupport_GUID = "1eff3510-4a27-46ad-b9e0-08332f0f4f6d"
  IID_IWsbApplicationBackupSupport = LibC::GUID.new(0x1eff3510_u32, 0x4a27_u16, 0x46ad_u16, StaticArray[0xb9_u8, 0xe0_u8, 0x8_u8, 0x33_u8, 0x2f_u8, 0xf_u8, 0x4f_u8, 0x6d_u8])
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

  IWsbApplicationRestoreSupport_GUID = "8d3bdb38-4ee8-4718-85f9-c7dbc4ab77aa"
  IID_IWsbApplicationRestoreSupport = LibC::GUID.new(0x8d3bdb38_u32, 0x4ee8_u16, 0x4718_u16, StaticArray[0x85_u8, 0xf9_u8, 0xc7_u8, 0xdb_u8, 0xc4_u8, 0xab_u8, 0x77_u8, 0xaa_u8])
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

  IWsbApplicationAsync_GUID = "0843f6f7-895c-44a6-b0c2-05a5022aa3a1"
  IID_IWsbApplicationAsync = LibC::GUID.new(0x843f6f7_u32, 0x895c_u16, 0x44a6_u16, StaticArray[0xb0_u8, 0xc2_u8, 0x5_u8, 0xa5_u8, 0x2_u8, 0x2a_u8, 0xa3_u8, 0xa1_u8])
  struct IWsbApplicationAsync
    lpVtbl : IWsbApplicationAsyncVTbl*
  end

end
