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
  TPMVSC_DEFAULT_ADMIN_ALGORITHM_ID = 130_u32
  TpmVirtualSmartCardManager = LibC::GUID.new(0x16a18e86_u32, 0x7f6e_u16, 0x4c20_u16, StaticArray[0xad_u8, 0x89_u8, 0x4f_u8, 0xfc_u8, 0xd_u8, 0xb7_u8, 0xa9_u8, 0x6a_u8])
  RemoteTpmVirtualSmartCardManager = LibC::GUID.new(0x152ea2a8_u32, 0x70dc_u16, 0x4c59_u16, StaticArray[0x8b_u8, 0x2a_u8, 0x32_u8, 0xaa_u8, 0x3c_u8, 0xa0_u8, 0xdc_u8, 0xac_u8])


  enum TPMVSC_ATTESTATION_TYPE : Int32
    TPMVSC_ATTESTATION_NONE = 0
    TPMVSC_ATTESTATION_AIK_ONLY = 1
    TPMVSC_ATTESTATION_AIK_AND_CERTIFICATE = 2
  end

  enum TPMVSCMGR_STATUS : Int32
    TPMVSCMGR_STATUS_VTPMSMARTCARD_INITIALIZING = 0
    TPMVSCMGR_STATUS_VTPMSMARTCARD_CREATING = 1
    TPMVSCMGR_STATUS_VTPMSMARTCARD_DESTROYING = 2
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_INITIALIZING = 3
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_CREATING = 4
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_DESTROYING = 5
    TPMVSCMGR_STATUS_VREADER_INITIALIZING = 6
    TPMVSCMGR_STATUS_VREADER_CREATING = 7
    TPMVSCMGR_STATUS_VREADER_DESTROYING = 8
    TPMVSCMGR_STATUS_GENERATE_WAITING = 9
    TPMVSCMGR_STATUS_GENERATE_AUTHENTICATING = 10
    TPMVSCMGR_STATUS_GENERATE_RUNNING = 11
    TPMVSCMGR_STATUS_CARD_CREATED = 12
    TPMVSCMGR_STATUS_CARD_DESTROYED = 13
  end

  enum TPMVSCMGR_ERROR : Int32
    TPMVSCMGR_ERROR_IMPERSONATION = 0
    TPMVSCMGR_ERROR_PIN_COMPLEXITY = 1
    TPMVSCMGR_ERROR_READER_COUNT_LIMIT = 2
    TPMVSCMGR_ERROR_TERMINAL_SERVICES_SESSION = 3
    TPMVSCMGR_ERROR_VTPMSMARTCARD_INITIALIZE = 4
    TPMVSCMGR_ERROR_VTPMSMARTCARD_CREATE = 5
    TPMVSCMGR_ERROR_VTPMSMARTCARD_DESTROY = 6
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_INITIALIZE = 7
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_CREATE = 8
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_DESTROY = 9
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_WRITE_PROPERTY = 10
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_READ_PROPERTY = 11
    TPMVSCMGR_ERROR_VREADER_INITIALIZE = 12
    TPMVSCMGR_ERROR_VREADER_CREATE = 13
    TPMVSCMGR_ERROR_VREADER_DESTROY = 14
    TPMVSCMGR_ERROR_GENERATE_LOCATE_READER = 15
    TPMVSCMGR_ERROR_GENERATE_FILESYSTEM = 16
    TPMVSCMGR_ERROR_CARD_CREATE = 17
    TPMVSCMGR_ERROR_CARD_DESTROY = 18
  end


  struct ITpmVirtualSmartCardManagerStatusCallbackVTbl
    query_interface : Proc(ITpmVirtualSmartCardManagerStatusCallback*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITpmVirtualSmartCardManagerStatusCallback*, UInt32)
    release : Proc(ITpmVirtualSmartCardManagerStatusCallback*, UInt32)
    report_progress : Proc(ITpmVirtualSmartCardManagerStatusCallback*, TPMVSCMGR_STATUS, HRESULT)
    report_error : Proc(ITpmVirtualSmartCardManagerStatusCallback*, TPMVSCMGR_ERROR, HRESULT)
  end

  struct ITpmVirtualSmartCardManagerStatusCallback
    lpVtbl : ITpmVirtualSmartCardManagerStatusCallbackVTbl*
  end

  struct ITpmVirtualSmartCardManagerVTbl
    query_interface : Proc(ITpmVirtualSmartCardManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITpmVirtualSmartCardManager*, UInt32)
    release : Proc(ITpmVirtualSmartCardManager*, UInt32)
    create_virtual_smart_card : Proc(ITpmVirtualSmartCardManager*, LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)
    destroy_virtual_smart_card : Proc(ITpmVirtualSmartCardManager*, LibC::LPWSTR, ITpmVirtualSmartCardManagerStatusCallback, LibC::BOOL*, HRESULT)
  end

  struct ITpmVirtualSmartCardManager
    lpVtbl : ITpmVirtualSmartCardManagerVTbl*
  end

  struct ITpmVirtualSmartCardManager2VTbl
    query_interface : Proc(ITpmVirtualSmartCardManager2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITpmVirtualSmartCardManager2*, UInt32)
    release : Proc(ITpmVirtualSmartCardManager2*, UInt32)
    create_virtual_smart_card : Proc(ITpmVirtualSmartCardManager2*, LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)
    destroy_virtual_smart_card : Proc(ITpmVirtualSmartCardManager2*, LibC::LPWSTR, ITpmVirtualSmartCardManagerStatusCallback, LibC::BOOL*, HRESULT)
    create_virtual_smart_card_with_pin_policy : Proc(ITpmVirtualSmartCardManager2*, LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)
  end

  struct ITpmVirtualSmartCardManager2
    lpVtbl : ITpmVirtualSmartCardManager2VTbl*
  end

  struct ITpmVirtualSmartCardManager3VTbl
    query_interface : Proc(ITpmVirtualSmartCardManager3*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITpmVirtualSmartCardManager3*, UInt32)
    release : Proc(ITpmVirtualSmartCardManager3*, UInt32)
    create_virtual_smart_card : Proc(ITpmVirtualSmartCardManager3*, LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)
    destroy_virtual_smart_card : Proc(ITpmVirtualSmartCardManager3*, LibC::LPWSTR, ITpmVirtualSmartCardManagerStatusCallback, LibC::BOOL*, HRESULT)
    create_virtual_smart_card_with_pin_policy : Proc(ITpmVirtualSmartCardManager3*, LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)
    create_virtual_smart_card_with_attestation : Proc(ITpmVirtualSmartCardManager3*, LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, TPMVSC_ATTESTATION_TYPE, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, HRESULT)
  end

  struct ITpmVirtualSmartCardManager3
    lpVtbl : ITpmVirtualSmartCardManager3VTbl*
  end

end
