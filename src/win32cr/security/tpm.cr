require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  TPMVSC_DEFAULT_ADMIN_ALGORITHM_ID = 130_u32
  CLSID_TpmVirtualSmartCardManager = LibC::GUID.new(0x16a18e86_u32, 0x7f6e_u16, 0x4c20_u16, StaticArray[0xad_u8, 0x89_u8, 0x4f_u8, 0xfc_u8, 0xd_u8, 0xb7_u8, 0xa9_u8, 0x6a_u8])
  CLSID_RemoteTpmVirtualSmartCardManager = LibC::GUID.new(0x152ea2a8_u32, 0x70dc_u16, 0x4c59_u16, StaticArray[0x8b_u8, 0x2a_u8, 0x32_u8, 0xaa_u8, 0x3c_u8, 0xa0_u8, 0xdc_u8, 0xac_u8])


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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    report_progress : UInt64
    report_error : UInt64
  end

  ITpmVirtualSmartCardManagerStatusCallback_GUID = "1a1bb35f-abb8-451c-a1ae-33d98f1bef4a"
  IID_ITpmVirtualSmartCardManagerStatusCallback = LibC::GUID.new(0x1a1bb35f_u32, 0xabb8_u16, 0x451c_u16, StaticArray[0xa1_u8, 0xae_u8, 0x33_u8, 0xd9_u8, 0x8f_u8, 0x1b_u8, 0xef_u8, 0x4a_u8])
  struct ITpmVirtualSmartCardManagerStatusCallback
    lpVtbl : ITpmVirtualSmartCardManagerStatusCallbackVTbl*
  end

  struct ITpmVirtualSmartCardManagerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_virtual_smart_card : UInt64
    destroy_virtual_smart_card : UInt64
  end

  ITpmVirtualSmartCardManager_GUID = "112b1dff-d9dc-41f7-869f-d67fee7cb591"
  IID_ITpmVirtualSmartCardManager = LibC::GUID.new(0x112b1dff_u32, 0xd9dc_u16, 0x41f7_u16, StaticArray[0x86_u8, 0x9f_u8, 0xd6_u8, 0x7f_u8, 0xee_u8, 0x7c_u8, 0xb5_u8, 0x91_u8])
  struct ITpmVirtualSmartCardManager
    lpVtbl : ITpmVirtualSmartCardManagerVTbl*
  end

  struct ITpmVirtualSmartCardManager2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_virtual_smart_card : UInt64
    destroy_virtual_smart_card : UInt64
    create_virtual_smart_card_with_pin_policy : UInt64
  end

  ITpmVirtualSmartCardManager2_GUID = "fdf8a2b9-02de-47f4-bc26-aa85ab5e5267"
  IID_ITpmVirtualSmartCardManager2 = LibC::GUID.new(0xfdf8a2b9_u32, 0x2de_u16, 0x47f4_u16, StaticArray[0xbc_u8, 0x26_u8, 0xaa_u8, 0x85_u8, 0xab_u8, 0x5e_u8, 0x52_u8, 0x67_u8])
  struct ITpmVirtualSmartCardManager2
    lpVtbl : ITpmVirtualSmartCardManager2VTbl*
  end

  struct ITpmVirtualSmartCardManager3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_virtual_smart_card : UInt64
    destroy_virtual_smart_card : UInt64
    create_virtual_smart_card_with_pin_policy : UInt64
    create_virtual_smart_card_with_attestation : UInt64
  end

  ITpmVirtualSmartCardManager3_GUID = "3c745a97-f375-4150-be17-5950f694c699"
  IID_ITpmVirtualSmartCardManager3 = LibC::GUID.new(0x3c745a97_u32, 0xf375_u16, 0x4150_u16, StaticArray[0xbe_u8, 0x17_u8, 0x59_u8, 0x50_u8, 0xf6_u8, 0x94_u8, 0xc6_u8, 0x99_u8])
  struct ITpmVirtualSmartCardManager3
    lpVtbl : ITpmVirtualSmartCardManager3VTbl*
  end

end
struct LibWin32::ITpmVirtualSmartCardManagerStatusCallback
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def report_progress(status : TPMVSCMGR_STATUS) : HRESULT
    @lpVtbl.value.report_progress.unsafe_as(Proc(TPMVSCMGR_STATUS, HRESULT)).call(status)
  end
  def report_error(error : TPMVSCMGR_ERROR) : HRESULT
    @lpVtbl.value.report_error.unsafe_as(Proc(TPMVSCMGR_ERROR, HRESULT)).call(error)
  end
end
struct LibWin32::ITpmVirtualSmartCardManager
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_virtual_smart_card(pszfriendlyname : LibC::LPWSTR, badminalgid : UInt8, pbadminkey : UInt8*, cbadminkey : UInt32, pbadminkcv : UInt8*, cbadminkcv : UInt32, pbpuk : UInt8*, cbpuk : UInt32, pbpin : UInt8*, cbpin : UInt32, fgenerate : LibC::BOOL, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, ppszinstanceid : LibC::LPWSTR*, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.create_virtual_smart_card.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)).call(pszfriendlyname, badminalgid, pbadminkey, cbadminkey, pbadminkcv, cbadminkcv, pbpuk, cbpuk, pbpin, cbpin, fgenerate, pstatuscallback, ppszinstanceid, pfneedreboot)
  end
  def destroy_virtual_smart_card(pszinstanceid : LibC::LPWSTR, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.destroy_virtual_smart_card.unsafe_as(Proc(LibC::LPWSTR, ITpmVirtualSmartCardManagerStatusCallback, LibC::BOOL*, HRESULT)).call(pszinstanceid, pstatuscallback, pfneedreboot)
  end
end
struct LibWin32::ITpmVirtualSmartCardManager2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_virtual_smart_card(pszfriendlyname : LibC::LPWSTR, badminalgid : UInt8, pbadminkey : UInt8*, cbadminkey : UInt32, pbadminkcv : UInt8*, cbadminkcv : UInt32, pbpuk : UInt8*, cbpuk : UInt32, pbpin : UInt8*, cbpin : UInt32, fgenerate : LibC::BOOL, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, ppszinstanceid : LibC::LPWSTR*, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.create_virtual_smart_card.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)).call(pszfriendlyname, badminalgid, pbadminkey, cbadminkey, pbadminkcv, cbadminkcv, pbpuk, cbpuk, pbpin, cbpin, fgenerate, pstatuscallback, ppszinstanceid, pfneedreboot)
  end
  def destroy_virtual_smart_card(pszinstanceid : LibC::LPWSTR, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.destroy_virtual_smart_card.unsafe_as(Proc(LibC::LPWSTR, ITpmVirtualSmartCardManagerStatusCallback, LibC::BOOL*, HRESULT)).call(pszinstanceid, pstatuscallback, pfneedreboot)
  end
  def create_virtual_smart_card_with_pin_policy(pszfriendlyname : LibC::LPWSTR, badminalgid : UInt8, pbadminkey : UInt8*, cbadminkey : UInt32, pbadminkcv : UInt8*, cbadminkcv : UInt32, pbpuk : UInt8*, cbpuk : UInt32, pbpin : UInt8*, cbpin : UInt32, pbpinpolicy : UInt8*, cbpinpolicy : UInt32, fgenerate : LibC::BOOL, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, ppszinstanceid : LibC::LPWSTR*, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.create_virtual_smart_card_with_pin_policy.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)).call(pszfriendlyname, badminalgid, pbadminkey, cbadminkey, pbadminkcv, cbadminkcv, pbpuk, cbpuk, pbpin, cbpin, pbpinpolicy, cbpinpolicy, fgenerate, pstatuscallback, ppszinstanceid, pfneedreboot)
  end
end
struct LibWin32::ITpmVirtualSmartCardManager3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_virtual_smart_card(pszfriendlyname : LibC::LPWSTR, badminalgid : UInt8, pbadminkey : UInt8*, cbadminkey : UInt32, pbadminkcv : UInt8*, cbadminkcv : UInt32, pbpuk : UInt8*, cbpuk : UInt32, pbpin : UInt8*, cbpin : UInt32, fgenerate : LibC::BOOL, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, ppszinstanceid : LibC::LPWSTR*, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.create_virtual_smart_card.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)).call(pszfriendlyname, badminalgid, pbadminkey, cbadminkey, pbadminkcv, cbadminkcv, pbpuk, cbpuk, pbpin, cbpin, fgenerate, pstatuscallback, ppszinstanceid, pfneedreboot)
  end
  def destroy_virtual_smart_card(pszinstanceid : LibC::LPWSTR, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.destroy_virtual_smart_card.unsafe_as(Proc(LibC::LPWSTR, ITpmVirtualSmartCardManagerStatusCallback, LibC::BOOL*, HRESULT)).call(pszinstanceid, pstatuscallback, pfneedreboot)
  end
  def create_virtual_smart_card_with_pin_policy(pszfriendlyname : LibC::LPWSTR, badminalgid : UInt8, pbadminkey : UInt8*, cbadminkey : UInt32, pbadminkcv : UInt8*, cbadminkcv : UInt32, pbpuk : UInt8*, cbpuk : UInt32, pbpin : UInt8*, cbpin : UInt32, pbpinpolicy : UInt8*, cbpinpolicy : UInt32, fgenerate : LibC::BOOL, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, ppszinstanceid : LibC::LPWSTR*, pfneedreboot : LibC::BOOL*) : HRESULT
    @lpVtbl.value.create_virtual_smart_card_with_pin_policy.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, LibC::BOOL*, HRESULT)).call(pszfriendlyname, badminalgid, pbadminkey, cbadminkey, pbadminkcv, cbadminkcv, pbpuk, cbpuk, pbpin, cbpin, pbpinpolicy, cbpinpolicy, fgenerate, pstatuscallback, ppszinstanceid, pfneedreboot)
  end
  def create_virtual_smart_card_with_attestation(pszfriendlyname : LibC::LPWSTR, badminalgid : UInt8, pbadminkey : UInt8*, cbadminkey : UInt32, pbadminkcv : UInt8*, cbadminkcv : UInt32, pbpuk : UInt8*, cbpuk : UInt32, pbpin : UInt8*, cbpin : UInt32, pbpinpolicy : UInt8*, cbpinpolicy : UInt32, attestationtype : TPMVSC_ATTESTATION_TYPE, fgenerate : LibC::BOOL, pstatuscallback : ITpmVirtualSmartCardManagerStatusCallback, ppszinstanceid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.create_virtual_smart_card_with_attestation.unsafe_as(Proc(LibC::LPWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, TPMVSC_ATTESTATION_TYPE, LibC::BOOL, ITpmVirtualSmartCardManagerStatusCallback, LibC::LPWSTR*, HRESULT)).call(pszfriendlyname, badminalgid, pbadminkey, cbadminkey, pbadminkcv, cbadminkcv, pbpuk, cbpuk, pbpin, cbpin, pbpinpolicy, cbpinpolicy, attestationtype, fgenerate, pstatuscallback, ppszinstanceid)
  end
end
