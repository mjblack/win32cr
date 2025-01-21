require "./../system/com.cr"
require "./../foundation.cr"
require "./../system/registry.cr"
require "./../system/com/structured_storage.cr"
require "./../system/ole.cr"

module Win32cr::UI::LegacyWindowsEnvironmentFeatures
  EVCF_HASSETTINGS = 1_u32
  EVCF_ENABLEBYDEFAULT = 2_u32
  EVCF_REMOVEFROMLIST = 4_u32
  EVCF_ENABLEBYDEFAULT_AUTO = 8_u32
  EVCF_DONTSHOWIFZERO = 16_u32
  EVCF_SETTINGSMODE = 32_u32
  EVCF_OUTOFDISKSPACE = 64_u32
  EVCF_USERCONSENTOBTAINED = 128_u32
  EVCF_SYSTEMAUTORUN = 256_u32
  EVCCBF_LASTNOTIFICATION = 1_u32
  STATEBITS_FLAT = 1_u32
  REC_S_IDIDTHEUPDATES = 266240_i32
  REC_S_NOTCOMPLETE = 266241_i32
  REC_S_NOTCOMPLETEBUTPROPAGATE = 266242_i32
  REC_E_ABORTED = -2147217408_i32
  REC_E_NOCALLBACK = -2147217407_i32
  REC_E_NORESIDUES = -2147217406_i32
  REC_E_TOODIFFERENT = -2147217405_i32
  REC_E_INEEDTODOTHEUPDATES = -2147217404_i32

  enum Reconcilef_
    RECONCILEF_MAYBOTHERUSER = 1_i32
    RECONCILEF_FEEDBACKWINDOWVALID = 2_i32
    RECONCILEF_NORESIDUESOK = 4_i32
    RECONCILEF_OMITSELFRESIDUE = 8_i32
    RECONCILEF_RESUMERECONCILIATION = 16_i32
    RECONCILEF_YOUMAYDOTHEUPDATES = 32_i32
    RECONCILEF_ONLYYOUWERECHANGED = 64_i32
    ALL_RECONCILE_FLAGS = 127_i32
  end

  @[Extern]
  record IEmptyVolumeCacheCallBackVtbl,
    query_interface : Proc(IEmptyVolumeCacheCallBack*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEmptyVolumeCacheCallBack*, UInt32),
    release : Proc(IEmptyVolumeCacheCallBack*, UInt32),
    scan_progress : Proc(IEmptyVolumeCacheCallBack*, UInt64, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    purge_progress : Proc(IEmptyVolumeCacheCallBack*, UInt64, UInt64, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6e793361-73c6-11d0-8469-00aa00442901")]
  record IEmptyVolumeCacheCallBack, lpVtbl : IEmptyVolumeCacheCallBackVtbl* do
    GUID = LibC::GUID.new(0x6e793361_u32, 0x73c6_u16, 0x11d0_u16, StaticArray[0x84_u8, 0x69_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x29_u8, 0x1_u8])
    def query_interface(this : IEmptyVolumeCacheCallBack*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEmptyVolumeCacheCallBack*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEmptyVolumeCacheCallBack*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scan_progress(this : IEmptyVolumeCacheCallBack*, dwlSpaceUsed : UInt64, dwFlags : UInt32, pcwszStatus : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scan_progress.call(this, dwlSpaceUsed, dwFlags, pcwszStatus)
    end
    def purge_progress(this : IEmptyVolumeCacheCallBack*, dwlSpaceFreed : UInt64, dwlSpaceToFree : UInt64, dwFlags : UInt32, pcwszStatus : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.purge_progress.call(this, dwlSpaceFreed, dwlSpaceToFree, dwFlags, pcwszStatus)
    end

  end

  @[Extern]
  record IEmptyVolumeCacheVtbl,
    query_interface : Proc(IEmptyVolumeCache*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEmptyVolumeCache*, UInt32),
    release : Proc(IEmptyVolumeCache*, UInt32),
    initialize__ : Proc(IEmptyVolumeCache*, Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_space_used : Proc(IEmptyVolumeCache*, UInt64*, Void*, Win32cr::Foundation::HRESULT),
    purge : Proc(IEmptyVolumeCache*, UInt64, Void*, Win32cr::Foundation::HRESULT),
    show_properties : Proc(IEmptyVolumeCache*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IEmptyVolumeCache*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8fce5227-04da-11d1-a004-00805f8abe06")]
  record IEmptyVolumeCache, lpVtbl : IEmptyVolumeCacheVtbl* do
    GUID = LibC::GUID.new(0x8fce5227_u32, 0x4da_u16, 0x11d1_u16, StaticArray[0xa0_u8, 0x4_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x8a_u8, 0xbe_u8, 0x6_u8])
    def query_interface(this : IEmptyVolumeCache*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEmptyVolumeCache*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEmptyVolumeCache*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IEmptyVolumeCache*, hkRegKey : Win32cr::System::Registry::HKEY, pcwszVolume : Win32cr::Foundation::PWSTR, ppwszDisplayName : Win32cr::Foundation::PWSTR*, ppwszDescription : Win32cr::Foundation::PWSTR*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, hkRegKey, pcwszVolume, ppwszDisplayName, ppwszDescription, pdwFlags)
    end
    def get_space_used(this : IEmptyVolumeCache*, pdwlSpaceUsed : UInt64*, picb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_used.call(this, pdwlSpaceUsed, picb)
    end
    def purge(this : IEmptyVolumeCache*, dwlSpaceToFree : UInt64, picb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.purge.call(this, dwlSpaceToFree, picb)
    end
    def show_properties(this : IEmptyVolumeCache*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_properties.call(this, hwnd)
    end
    def deactivate(this : IEmptyVolumeCache*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, pdwFlags)
    end

  end

  @[Extern]
  record IEmptyVolumeCache2Vtbl,
    query_interface : Proc(IEmptyVolumeCache2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEmptyVolumeCache2*, UInt32),
    release : Proc(IEmptyVolumeCache2*, UInt32),
    initialize__ : Proc(IEmptyVolumeCache2*, Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_space_used : Proc(IEmptyVolumeCache2*, UInt64*, Void*, Win32cr::Foundation::HRESULT),
    purge : Proc(IEmptyVolumeCache2*, UInt64, Void*, Win32cr::Foundation::HRESULT),
    show_properties : Proc(IEmptyVolumeCache2*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT),
    deactivate : Proc(IEmptyVolumeCache2*, UInt32*, Win32cr::Foundation::HRESULT),
    initialize_ex : Proc(IEmptyVolumeCache2*, Win32cr::System::Registry::HKEY, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("02b7e3ba-4db3-11d2-b2d9-00c04f8eec8c")]
  record IEmptyVolumeCache2, lpVtbl : IEmptyVolumeCache2Vtbl* do
    GUID = LibC::GUID.new(0x2b7e3ba_u32, 0x4db3_u16, 0x11d2_u16, StaticArray[0xb2_u8, 0xd9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xec_u8, 0x8c_u8])
    def query_interface(this : IEmptyVolumeCache2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEmptyVolumeCache2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEmptyVolumeCache2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IEmptyVolumeCache2*, hkRegKey : Win32cr::System::Registry::HKEY, pcwszVolume : Win32cr::Foundation::PWSTR, ppwszDisplayName : Win32cr::Foundation::PWSTR*, ppwszDescription : Win32cr::Foundation::PWSTR*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, hkRegKey, pcwszVolume, ppwszDisplayName, ppwszDescription, pdwFlags)
    end
    def get_space_used(this : IEmptyVolumeCache2*, pdwlSpaceUsed : UInt64*, picb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_space_used.call(this, pdwlSpaceUsed, picb)
    end
    def purge(this : IEmptyVolumeCache2*, dwlSpaceToFree : UInt64, picb : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.purge.call(this, dwlSpaceToFree, picb)
    end
    def show_properties(this : IEmptyVolumeCache2*, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_properties.call(this, hwnd)
    end
    def deactivate(this : IEmptyVolumeCache2*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this, pdwFlags)
    end
    def initialize_ex(this : IEmptyVolumeCache2*, hkRegKey : Win32cr::System::Registry::HKEY, pcwszVolume : Win32cr::Foundation::PWSTR, pcwszKeyName : Win32cr::Foundation::PWSTR, ppwszDisplayName : Win32cr::Foundation::PWSTR*, ppwszDescription : Win32cr::Foundation::PWSTR*, ppwszBtnText : Win32cr::Foundation::PWSTR*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize_ex.call(this, hkRegKey, pcwszVolume, pcwszKeyName, ppwszDisplayName, ppwszDescription, ppwszBtnText, pdwFlags)
    end

  end

  @[Extern]
  record IReconcileInitiatorVtbl,
    query_interface : Proc(IReconcileInitiator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReconcileInitiator*, UInt32),
    release : Proc(IReconcileInitiator*, UInt32),
    set_abort_callback : Proc(IReconcileInitiator*, Void*, Win32cr::Foundation::HRESULT),
    set_progress_feedback : Proc(IReconcileInitiator*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("99180161-da16-101a-935c-444553540000")]
  record IReconcileInitiator, lpVtbl : IReconcileInitiatorVtbl* do
    GUID = LibC::GUID.new(0x99180161_u32, 0xda16_u16, 0x101a_u16, StaticArray[0x93_u8, 0x5c_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IReconcileInitiator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReconcileInitiator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReconcileInitiator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_abort_callback(this : IReconcileInitiator*, punkForAbort : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_abort_callback.call(this, punkForAbort)
    end
    def set_progress_feedback(this : IReconcileInitiator*, ulProgress : UInt32, ulProgressMax : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_progress_feedback.call(this, ulProgress, ulProgressMax)
    end

  end

  @[Extern]
  record IReconcilableObjectVtbl,
    query_interface : Proc(IReconcilableObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IReconcilableObject*, UInt32),
    release : Proc(IReconcilableObject*, UInt32),
    reconcile : Proc(IReconcilableObject*, Void*, UInt32, Win32cr::Foundation::HWND, Win32cr::Foundation::HWND, UInt32, Void**, Int32*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_progress_feedback_max_estimate : Proc(IReconcilableObject*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("99180162-da16-101a-935c-444553540000")]
  record IReconcilableObject, lpVtbl : IReconcilableObjectVtbl* do
    GUID = LibC::GUID.new(0x99180162_u32, 0xda16_u16, 0x101a_u16, StaticArray[0x93_u8, 0x5c_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IReconcilableObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IReconcilableObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IReconcilableObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reconcile(this : IReconcilableObject*, pInitiator : Void*, dwFlags : UInt32, hwndOwner : Win32cr::Foundation::HWND, hwndProgressFeedback : Win32cr::Foundation::HWND, ulcInput : UInt32, rgpmkOtherInput : Void**, plOutIndex : Int32*, pstgNewResidues : Void*, pvReserved : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconcile.call(this, pInitiator, dwFlags, hwndOwner, hwndProgressFeedback, ulcInput, rgpmkOtherInput, plOutIndex, pstgNewResidues, pvReserved)
    end
    def get_progress_feedback_max_estimate(this : IReconcilableObject*, pulProgressMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_progress_feedback_max_estimate.call(this, pulProgressMax)
    end

  end

  @[Extern]
  record IBriefcaseInitiatorVtbl,
    query_interface : Proc(IBriefcaseInitiator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IBriefcaseInitiator*, UInt32),
    release : Proc(IBriefcaseInitiator*, UInt32),
    is_moniker_in_briefcase : Proc(IBriefcaseInitiator*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("99180164-da16-101a-935c-444553540000")]
  record IBriefcaseInitiator, lpVtbl : IBriefcaseInitiatorVtbl* do
    GUID = LibC::GUID.new(0x99180164_u32, 0xda16_u16, 0x101a_u16, StaticArray[0x93_u8, 0x5c_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IBriefcaseInitiator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IBriefcaseInitiator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IBriefcaseInitiator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_moniker_in_briefcase(this : IBriefcaseInitiator*, pmk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_moniker_in_briefcase.call(this, pmk)
    end

  end

  @[Extern]
  record IActiveDesktopPVtbl,
    query_interface : Proc(IActiveDesktopP*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IActiveDesktopP*, UInt32),
    release : Proc(IActiveDesktopP*, UInt32),
    set_safe_mode : Proc(IActiveDesktopP*, UInt32, Win32cr::Foundation::HRESULT),
    ensure_update_html : Proc(IActiveDesktopP*, Win32cr::Foundation::HRESULT),
    set_scheme : Proc(IActiveDesktopP*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_scheme : Proc(IActiveDesktopP*, UInt16*, UInt32*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("52502ee0-ec80-11d0-89ab-00c04fc2972d")]
  record IActiveDesktopP, lpVtbl : IActiveDesktopPVtbl* do
    GUID = LibC::GUID.new(0x52502ee0_u32, 0xec80_u16, 0x11d0_u16, StaticArray[0x89_u8, 0xab_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0x97_u8, 0x2d_u8])
    def query_interface(this : IActiveDesktopP*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IActiveDesktopP*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IActiveDesktopP*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_safe_mode(this : IActiveDesktopP*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_safe_mode.call(this, dwFlags)
    end
    def ensure_update_html(this : IActiveDesktopP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.ensure_update_html.call(this)
    end
    def set_scheme(this : IActiveDesktopP*, pwszSchemeName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scheme.call(this, pwszSchemeName, dwFlags)
    end
    def get_scheme(this : IActiveDesktopP*, pwszSchemeName : UInt16*, pdwcchBuffer : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_scheme.call(this, pwszSchemeName, pdwcchBuffer, dwFlags)
    end

  end

  @[Extern]
  record IADesktopP2Vtbl,
    query_interface : Proc(IADesktopP2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IADesktopP2*, UInt32),
    release : Proc(IADesktopP2*, UInt32),
    re_read_wallpaper : Proc(IADesktopP2*, Win32cr::Foundation::HRESULT),
    get_ad_object_flags : Proc(IADesktopP2*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    update_all_desktop_subscriptions : Proc(IADesktopP2*, Win32cr::Foundation::HRESULT),
    make_dynamic_changes : Proc(IADesktopP2*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b22754e2-4574-11d1-9888-006097deacf9")]
  record IADesktopP2, lpVtbl : IADesktopP2Vtbl* do
    GUID = LibC::GUID.new(0xb22754e2_u32, 0x4574_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xde_u8, 0xac_u8, 0xf9_u8])
    def query_interface(this : IADesktopP2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IADesktopP2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IADesktopP2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def re_read_wallpaper(this : IADesktopP2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_read_wallpaper.call(this)
    end
    def get_ad_object_flags(this : IADesktopP2*, pdwFlags : UInt32*, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ad_object_flags.call(this, pdwFlags, dwMask)
    end
    def update_all_desktop_subscriptions(this : IADesktopP2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_all_desktop_subscriptions.call(this)
    end
    def make_dynamic_changes(this : IADesktopP2*, pOleObj : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.make_dynamic_changes.call(this, pOleObj)
    end

  end

end