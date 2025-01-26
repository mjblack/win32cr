require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Security::Tpm
  TPMVSC_DEFAULT_ADMIN_ALGORITHM_ID = 130_u32

  CLSID_TpmVirtualSmartCardManager = LibC::GUID.new(0x16a18e86_u32, 0x7f6e_u16, 0x4c20_u16, StaticArray[0xad_u8, 0x89_u8, 0x4f_u8, 0xfc_u8, 0xd_u8, 0xb7_u8, 0xa9_u8, 0x6a_u8])

  CLSID_RemoteTpmVirtualSmartCardManager = LibC::GUID.new(0x152ea2a8_u32, 0x70dc_u16, 0x4c59_u16, StaticArray[0x8b_u8, 0x2a_u8, 0x32_u8, 0xaa_u8, 0x3c_u8, 0xa0_u8, 0xdc_u8, 0xac_u8])

  enum TPMVSC_ATTESTATION_TYPE
    TPMVSC_ATTESTATION_NONE = 0_i32
    TPMVSC_ATTESTATION_AIK_ONLY = 1_i32
    TPMVSC_ATTESTATION_AIK_AND_CERTIFICATE = 2_i32
  end
  enum TPMVSCMGR_STATUS
    TPMVSCMGR_STATUS_VTPMSMARTCARD_INITIALIZING = 0_i32
    TPMVSCMGR_STATUS_VTPMSMARTCARD_CREATING = 1_i32
    TPMVSCMGR_STATUS_VTPMSMARTCARD_DESTROYING = 2_i32
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_INITIALIZING = 3_i32
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_CREATING = 4_i32
    TPMVSCMGR_STATUS_VGIDSSIMULATOR_DESTROYING = 5_i32
    TPMVSCMGR_STATUS_VREADER_INITIALIZING = 6_i32
    TPMVSCMGR_STATUS_VREADER_CREATING = 7_i32
    TPMVSCMGR_STATUS_VREADER_DESTROYING = 8_i32
    TPMVSCMGR_STATUS_GENERATE_WAITING = 9_i32
    TPMVSCMGR_STATUS_GENERATE_AUTHENTICATING = 10_i32
    TPMVSCMGR_STATUS_GENERATE_RUNNING = 11_i32
    TPMVSCMGR_STATUS_CARD_CREATED = 12_i32
    TPMVSCMGR_STATUS_CARD_DESTROYED = 13_i32
  end
  enum TPMVSCMGR_ERROR
    TPMVSCMGR_ERROR_IMPERSONATION = 0_i32
    TPMVSCMGR_ERROR_PIN_COMPLEXITY = 1_i32
    TPMVSCMGR_ERROR_READER_COUNT_LIMIT = 2_i32
    TPMVSCMGR_ERROR_TERMINAL_SERVICES_SESSION = 3_i32
    TPMVSCMGR_ERROR_VTPMSMARTCARD_INITIALIZE = 4_i32
    TPMVSCMGR_ERROR_VTPMSMARTCARD_CREATE = 5_i32
    TPMVSCMGR_ERROR_VTPMSMARTCARD_DESTROY = 6_i32
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_INITIALIZE = 7_i32
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_CREATE = 8_i32
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_DESTROY = 9_i32
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_WRITE_PROPERTY = 10_i32
    TPMVSCMGR_ERROR_VGIDSSIMULATOR_READ_PROPERTY = 11_i32
    TPMVSCMGR_ERROR_VREADER_INITIALIZE = 12_i32
    TPMVSCMGR_ERROR_VREADER_CREATE = 13_i32
    TPMVSCMGR_ERROR_VREADER_DESTROY = 14_i32
    TPMVSCMGR_ERROR_GENERATE_LOCATE_READER = 15_i32
    TPMVSCMGR_ERROR_GENERATE_FILESYSTEM = 16_i32
    TPMVSCMGR_ERROR_CARD_CREATE = 17_i32
    TPMVSCMGR_ERROR_CARD_DESTROY = 18_i32
  end

  @[Extern]
  record ITpmVirtualSmartCardManagerStatusCallbackVtbl,
    query_interface : Proc(ITpmVirtualSmartCardManagerStatusCallback*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITpmVirtualSmartCardManagerStatusCallback*, UInt32),
    release : Proc(ITpmVirtualSmartCardManagerStatusCallback*, UInt32),
    report_progress : Proc(ITpmVirtualSmartCardManagerStatusCallback*, Win32cr::Security::Tpm::TPMVSCMGR_STATUS, Win32cr::Foundation::HRESULT),
    report_error : Proc(ITpmVirtualSmartCardManagerStatusCallback*, Win32cr::Security::Tpm::TPMVSCMGR_ERROR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITpmVirtualSmartCardManagerStatusCallback, lpVtbl : ITpmVirtualSmartCardManagerStatusCallbackVtbl* do
    GUID = LibC::GUID.new(0x1a1bb35f_u32, 0xabb8_u16, 0x451c_u16, StaticArray[0xa1_u8, 0xae_u8, 0x33_u8, 0xd9_u8, 0x8f_u8, 0x1b_u8, 0xef_u8, 0x4a_u8])
    def query_interface(this : ITpmVirtualSmartCardManagerStatusCallback*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITpmVirtualSmartCardManagerStatusCallback*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITpmVirtualSmartCardManagerStatusCallback*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def report_progress(this : ITpmVirtualSmartCardManagerStatusCallback*, status : Win32cr::Security::Tpm::TPMVSCMGR_STATUS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_progress.call(this, status)
    end
    def report_error(this : ITpmVirtualSmartCardManagerStatusCallback*, error : Win32cr::Security::Tpm::TPMVSCMGR_ERROR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.report_error.call(this, error)
    end

  end

  @[Extern]
  record ITpmVirtualSmartCardManagerVtbl,
    query_interface : Proc(ITpmVirtualSmartCardManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITpmVirtualSmartCardManager*, UInt32),
    release : Proc(ITpmVirtualSmartCardManager*, UInt32),
    create_virtual_smart_card : Proc(ITpmVirtualSmartCardManager*, Win32cr::Foundation::PWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    destroy_virtual_smart_card : Proc(ITpmVirtualSmartCardManager*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITpmVirtualSmartCardManager, lpVtbl : ITpmVirtualSmartCardManagerVtbl* do
    GUID = LibC::GUID.new(0x112b1dff_u32, 0xd9dc_u16, 0x41f7_u16, StaticArray[0x86_u8, 0x9f_u8, 0xd6_u8, 0x7f_u8, 0xee_u8, 0x7c_u8, 0xb5_u8, 0x91_u8])
    def query_interface(this : ITpmVirtualSmartCardManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITpmVirtualSmartCardManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITpmVirtualSmartCardManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_virtual_smart_card(this : ITpmVirtualSmartCardManager*, pszFriendlyName : Win32cr::Foundation::PWSTR, bAdminAlgId : UInt8, pbAdminKey : UInt8*, cbAdminKey : UInt32, pbAdminKcv : UInt8*, cbAdminKcv : UInt32, pbPuk : UInt8*, cbPuk : UInt32, pbPin : UInt8*, cbPin : UInt32, fGenerate : Win32cr::Foundation::BOOL, pStatusCallback : Void*, ppszInstanceId : Win32cr::Foundation::PWSTR*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_smart_card.call(this, pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot)
    end
    def destroy_virtual_smart_card(this : ITpmVirtualSmartCardManager*, pszInstanceId : Win32cr::Foundation::PWSTR, pStatusCallback : Void*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_virtual_smart_card.call(this, pszInstanceId, pStatusCallback, pfNeedReboot)
    end

  end

  @[Extern]
  record ITpmVirtualSmartCardManager2Vtbl,
    query_interface : Proc(ITpmVirtualSmartCardManager2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITpmVirtualSmartCardManager2*, UInt32),
    release : Proc(ITpmVirtualSmartCardManager2*, UInt32),
    create_virtual_smart_card : Proc(ITpmVirtualSmartCardManager2*, Win32cr::Foundation::PWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    destroy_virtual_smart_card : Proc(ITpmVirtualSmartCardManager2*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_virtual_smart_card_with_pin_policy : Proc(ITpmVirtualSmartCardManager2*, Win32cr::Foundation::PWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITpmVirtualSmartCardManager2, lpVtbl : ITpmVirtualSmartCardManager2Vtbl* do
    GUID = LibC::GUID.new(0xfdf8a2b9_u32, 0x2de_u16, 0x47f4_u16, StaticArray[0xbc_u8, 0x26_u8, 0xaa_u8, 0x85_u8, 0xab_u8, 0x5e_u8, 0x52_u8, 0x67_u8])
    def query_interface(this : ITpmVirtualSmartCardManager2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITpmVirtualSmartCardManager2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITpmVirtualSmartCardManager2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_virtual_smart_card(this : ITpmVirtualSmartCardManager2*, pszFriendlyName : Win32cr::Foundation::PWSTR, bAdminAlgId : UInt8, pbAdminKey : UInt8*, cbAdminKey : UInt32, pbAdminKcv : UInt8*, cbAdminKcv : UInt32, pbPuk : UInt8*, cbPuk : UInt32, pbPin : UInt8*, cbPin : UInt32, fGenerate : Win32cr::Foundation::BOOL, pStatusCallback : Void*, ppszInstanceId : Win32cr::Foundation::PWSTR*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_smart_card.call(this, pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot)
    end
    def destroy_virtual_smart_card(this : ITpmVirtualSmartCardManager2*, pszInstanceId : Win32cr::Foundation::PWSTR, pStatusCallback : Void*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_virtual_smart_card.call(this, pszInstanceId, pStatusCallback, pfNeedReboot)
    end
    def create_virtual_smart_card_with_pin_policy(this : ITpmVirtualSmartCardManager2*, pszFriendlyName : Win32cr::Foundation::PWSTR, bAdminAlgId : UInt8, pbAdminKey : UInt8*, cbAdminKey : UInt32, pbAdminKcv : UInt8*, cbAdminKcv : UInt32, pbPuk : UInt8*, cbPuk : UInt32, pbPin : UInt8*, cbPin : UInt32, pbPinPolicy : UInt8*, cbPinPolicy : UInt32, fGenerate : Win32cr::Foundation::BOOL, pStatusCallback : Void*, ppszInstanceId : Win32cr::Foundation::PWSTR*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_smart_card_with_pin_policy.call(this, pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot)
    end

  end

  @[Extern]
  record ITpmVirtualSmartCardManager3Vtbl,
    query_interface : Proc(ITpmVirtualSmartCardManager3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITpmVirtualSmartCardManager3*, UInt32),
    release : Proc(ITpmVirtualSmartCardManager3*, UInt32),
    create_virtual_smart_card : Proc(ITpmVirtualSmartCardManager3*, Win32cr::Foundation::PWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    destroy_virtual_smart_card : Proc(ITpmVirtualSmartCardManager3*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_virtual_smart_card_with_pin_policy : Proc(ITpmVirtualSmartCardManager3*, Win32cr::Foundation::PWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_virtual_smart_card_with_attestation : Proc(ITpmVirtualSmartCardManager3*, Win32cr::Foundation::PWSTR, UInt8, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, UInt8*, UInt32, Win32cr::Security::Tpm::TPMVSC_ATTESTATION_TYPE, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITpmVirtualSmartCardManager3, lpVtbl : ITpmVirtualSmartCardManager3Vtbl* do
    GUID = LibC::GUID.new(0x3c745a97_u32, 0xf375_u16, 0x4150_u16, StaticArray[0xbe_u8, 0x17_u8, 0x59_u8, 0x50_u8, 0xf6_u8, 0x94_u8, 0xc6_u8, 0x99_u8])
    def query_interface(this : ITpmVirtualSmartCardManager3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITpmVirtualSmartCardManager3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITpmVirtualSmartCardManager3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_virtual_smart_card(this : ITpmVirtualSmartCardManager3*, pszFriendlyName : Win32cr::Foundation::PWSTR, bAdminAlgId : UInt8, pbAdminKey : UInt8*, cbAdminKey : UInt32, pbAdminKcv : UInt8*, cbAdminKcv : UInt32, pbPuk : UInt8*, cbPuk : UInt32, pbPin : UInt8*, cbPin : UInt32, fGenerate : Win32cr::Foundation::BOOL, pStatusCallback : Void*, ppszInstanceId : Win32cr::Foundation::PWSTR*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_smart_card.call(this, pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot)
    end
    def destroy_virtual_smart_card(this : ITpmVirtualSmartCardManager3*, pszInstanceId : Win32cr::Foundation::PWSTR, pStatusCallback : Void*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destroy_virtual_smart_card.call(this, pszInstanceId, pStatusCallback, pfNeedReboot)
    end
    def create_virtual_smart_card_with_pin_policy(this : ITpmVirtualSmartCardManager3*, pszFriendlyName : Win32cr::Foundation::PWSTR, bAdminAlgId : UInt8, pbAdminKey : UInt8*, cbAdminKey : UInt32, pbAdminKcv : UInt8*, cbAdminKcv : UInt32, pbPuk : UInt8*, cbPuk : UInt32, pbPin : UInt8*, cbPin : UInt32, pbPinPolicy : UInt8*, cbPinPolicy : UInt32, fGenerate : Win32cr::Foundation::BOOL, pStatusCallback : Void*, ppszInstanceId : Win32cr::Foundation::PWSTR*, pfNeedReboot : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_smart_card_with_pin_policy.call(this, pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot)
    end
    def create_virtual_smart_card_with_attestation(this : ITpmVirtualSmartCardManager3*, pszFriendlyName : Win32cr::Foundation::PWSTR, bAdminAlgId : UInt8, pbAdminKey : UInt8*, cbAdminKey : UInt32, pbAdminKcv : UInt8*, cbAdminKcv : UInt32, pbPuk : UInt8*, cbPuk : UInt32, pbPin : UInt8*, cbPin : UInt32, pbPinPolicy : UInt8*, cbPinPolicy : UInt32, attestationType : Win32cr::Security::Tpm::TPMVSC_ATTESTATION_TYPE, fGenerate : Win32cr::Foundation::BOOL, pStatusCallback : Void*, ppszInstanceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_smart_card_with_attestation.call(this, pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, attestationType, fGenerate, pStatusCallback, ppszInstanceId)
    end

  end

end