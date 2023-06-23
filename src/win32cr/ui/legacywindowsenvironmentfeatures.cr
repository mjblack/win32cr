require "../system/com.cr"
require "../foundation.cr"
require "../system/registry.cr"
require "../system/com/structuredstorage.cr"
require "../system/ole.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
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


  enum Reconcilef : Int32
    RECONCILEF_MAYBOTHERUSER = 1
    RECONCILEF_FEEDBACKWINDOWVALID = 2
    RECONCILEF_NORESIDUESOK = 4
    RECONCILEF_OMITSELFRESIDUE = 8
    RECONCILEF_RESUMERECONCILIATION = 16
    RECONCILEF_YOUMAYDOTHEUPDATES = 32
    RECONCILEF_ONLYYOUWERECHANGED = 64
    ALL_RECONCILE_FLAGS = 127
  end


  struct IEmptyVolumeCacheCallBackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scan_progress : UInt64
    purge_progress : UInt64
  end

  IEmptyVolumeCacheCallBack_GUID = "6e793361-73c6-11d0-8469-00aa00442901"
  IID_IEmptyVolumeCacheCallBack = LibC::GUID.new(0x6e793361_u32, 0x73c6_u16, 0x11d0_u16, StaticArray[0x84_u8, 0x69_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x44_u8, 0x29_u8, 0x1_u8])
  struct IEmptyVolumeCacheCallBack
    lpVtbl : IEmptyVolumeCacheCallBackVTbl*
  end

  struct IEmptyVolumeCacheVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_space_used : UInt64
    purge : UInt64
    show_properties : UInt64
    deactivate : UInt64
  end

  IEmptyVolumeCache_GUID = "8fce5227-04da-11d1-a004-00805f8abe06"
  IID_IEmptyVolumeCache = LibC::GUID.new(0x8fce5227_u32, 0x4da_u16, 0x11d1_u16, StaticArray[0xa0_u8, 0x4_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0x8a_u8, 0xbe_u8, 0x6_u8])
  struct IEmptyVolumeCache
    lpVtbl : IEmptyVolumeCacheVTbl*
  end

  struct IEmptyVolumeCache2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    get_space_used : UInt64
    purge : UInt64
    show_properties : UInt64
    deactivate : UInt64
    initialize_ex : UInt64
  end

  IEmptyVolumeCache2_GUID = "02b7e3ba-4db3-11d2-b2d9-00c04f8eec8c"
  IID_IEmptyVolumeCache2 = LibC::GUID.new(0x2b7e3ba_u32, 0x4db3_u16, 0x11d2_u16, StaticArray[0xb2_u8, 0xd9_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0x8e_u8, 0xec_u8, 0x8c_u8])
  struct IEmptyVolumeCache2
    lpVtbl : IEmptyVolumeCache2VTbl*
  end

  struct IReconcileInitiatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_abort_callback : UInt64
    set_progress_feedback : UInt64
  end

  IReconcileInitiator_GUID = "99180161-da16-101a-935c-444553540000"
  IID_IReconcileInitiator = LibC::GUID.new(0x99180161_u32, 0xda16_u16, 0x101a_u16, StaticArray[0x93_u8, 0x5c_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
  struct IReconcileInitiator
    lpVtbl : IReconcileInitiatorVTbl*
  end

  struct IReconcilableObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    reconcile : UInt64
    get_progress_feedback_max_estimate : UInt64
  end

  IReconcilableObject_GUID = "99180162-da16-101a-935c-444553540000"
  IID_IReconcilableObject = LibC::GUID.new(0x99180162_u32, 0xda16_u16, 0x101a_u16, StaticArray[0x93_u8, 0x5c_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
  struct IReconcilableObject
    lpVtbl : IReconcilableObjectVTbl*
  end

  struct IBriefcaseInitiatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_moniker_in_briefcase : UInt64
  end

  IBriefcaseInitiator_GUID = "99180164-da16-101a-935c-444553540000"
  IID_IBriefcaseInitiator = LibC::GUID.new(0x99180164_u32, 0xda16_u16, 0x101a_u16, StaticArray[0x93_u8, 0x5c_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
  struct IBriefcaseInitiator
    lpVtbl : IBriefcaseInitiatorVTbl*
  end

  struct IActiveDesktopPVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_safe_mode : UInt64
    ensure_update_html : UInt64
    set_scheme : UInt64
    get_scheme : UInt64
  end

  IActiveDesktopP_GUID = "52502ee0-ec80-11d0-89ab-00c04fc2972d"
  IID_IActiveDesktopP = LibC::GUID.new(0x52502ee0_u32, 0xec80_u16, 0x11d0_u16, StaticArray[0x89_u8, 0xab_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc2_u8, 0x97_u8, 0x2d_u8])
  struct IActiveDesktopP
    lpVtbl : IActiveDesktopPVTbl*
  end

  struct IADesktopP2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    re_read_wallpaper : UInt64
    get_ad_object_flags : UInt64
    update_all_desktop_subscriptions : UInt64
    make_dynamic_changes : UInt64
  end

  IADesktopP2_GUID = "b22754e2-4574-11d1-9888-006097deacf9"
  IID_IADesktopP2 = LibC::GUID.new(0xb22754e2_u32, 0x4574_u16, 0x11d1_u16, StaticArray[0x98_u8, 0x88_u8, 0x0_u8, 0x60_u8, 0x97_u8, 0xde_u8, 0xac_u8, 0xf9_u8])
  struct IADesktopP2
    lpVtbl : IADesktopP2VTbl*
  end

end
struct LibWin32::IEmptyVolumeCacheCallBack
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scan_progress(dwlspaceused : UInt64, dwflags : UInt32, pcwszstatus : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.scan_progress.unsafe_as(Proc(UInt64, UInt32, LibC::LPWSTR, HRESULT)).call(dwlspaceused, dwflags, pcwszstatus)
  end
  def purge_progress(dwlspacefreed : UInt64, dwlspacetofree : UInt64, dwflags : UInt32, pcwszstatus : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.purge_progress.unsafe_as(Proc(UInt64, UInt64, UInt32, LibC::LPWSTR, HRESULT)).call(dwlspacefreed, dwlspacetofree, dwflags, pcwszstatus)
  end
end
struct LibWin32::IEmptyVolumeCache
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(hkregkey : HKEY, pcwszvolume : LibC::LPWSTR, ppwszdisplayname : LibC::LPWSTR*, ppwszdescription : LibC::LPWSTR*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HKEY, LibC::LPWSTR, LibC::LPWSTR*, LibC::LPWSTR*, UInt32*, HRESULT)).call(hkregkey, pcwszvolume, ppwszdisplayname, ppwszdescription, pdwflags)
  end
  def get_space_used(pdwlspaceused : UInt64*, picb : IEmptyVolumeCacheCallBack) : HRESULT
    @lpVtbl.value.get_space_used.unsafe_as(Proc(UInt64*, IEmptyVolumeCacheCallBack, HRESULT)).call(pdwlspaceused, picb)
  end
  def purge(dwlspacetofree : UInt64, picb : IEmptyVolumeCacheCallBack) : HRESULT
    @lpVtbl.value.purge.unsafe_as(Proc(UInt64, IEmptyVolumeCacheCallBack, HRESULT)).call(dwlspacetofree, picb)
  end
  def show_properties(hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.show_properties.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwnd)
  end
  def deactivate(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::IEmptyVolumeCache2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize(hkregkey : HKEY, pcwszvolume : LibC::LPWSTR, ppwszdisplayname : LibC::LPWSTR*, ppwszdescription : LibC::LPWSTR*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HKEY, LibC::LPWSTR, LibC::LPWSTR*, LibC::LPWSTR*, UInt32*, HRESULT)).call(hkregkey, pcwszvolume, ppwszdisplayname, ppwszdescription, pdwflags)
  end
  def get_space_used(pdwlspaceused : UInt64*, picb : IEmptyVolumeCacheCallBack) : HRESULT
    @lpVtbl.value.get_space_used.unsafe_as(Proc(UInt64*, IEmptyVolumeCacheCallBack, HRESULT)).call(pdwlspaceused, picb)
  end
  def purge(dwlspacetofree : UInt64, picb : IEmptyVolumeCacheCallBack) : HRESULT
    @lpVtbl.value.purge.unsafe_as(Proc(UInt64, IEmptyVolumeCacheCallBack, HRESULT)).call(dwlspacetofree, picb)
  end
  def show_properties(hwnd : LibC::HANDLE) : HRESULT
    @lpVtbl.value.show_properties.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwnd)
  end
  def deactivate(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def initialize_ex(hkregkey : HKEY, pcwszvolume : LibC::LPWSTR, pcwszkeyname : LibC::LPWSTR, ppwszdisplayname : LibC::LPWSTR*, ppwszdescription : LibC::LPWSTR*, ppwszbtntext : LibC::LPWSTR*, pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.initialize_ex.unsafe_as(Proc(HKEY, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, LibC::LPWSTR*, LibC::LPWSTR*, UInt32*, HRESULT)).call(hkregkey, pcwszvolume, pcwszkeyname, ppwszdisplayname, ppwszdescription, ppwszbtntext, pdwflags)
  end
end
struct LibWin32::IReconcileInitiator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_abort_callback(punkforabort : IUnknown) : HRESULT
    @lpVtbl.value.set_abort_callback.unsafe_as(Proc(IUnknown, HRESULT)).call(punkforabort)
  end
  def set_progress_feedback(ulprogress : UInt32, ulprogressmax : UInt32) : HRESULT
    @lpVtbl.value.set_progress_feedback.unsafe_as(Proc(UInt32, UInt32, HRESULT)).call(ulprogress, ulprogressmax)
  end
end
struct LibWin32::IReconcilableObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def reconcile(pinitiator : IReconcileInitiator, dwflags : UInt32, hwndowner : LibC::HANDLE, hwndprogressfeedback : LibC::HANDLE, ulcinput : UInt32, rgpmkotherinput : IMoniker*, ploutindex : Int32*, pstgnewresidues : IStorage, pvreserved : Void*) : HRESULT
    @lpVtbl.value.reconcile.unsafe_as(Proc(IReconcileInitiator, UInt32, LibC::HANDLE, LibC::HANDLE, UInt32, IMoniker*, Int32*, IStorage, Void*, HRESULT)).call(pinitiator, dwflags, hwndowner, hwndprogressfeedback, ulcinput, rgpmkotherinput, ploutindex, pstgnewresidues, pvreserved)
  end
  def get_progress_feedback_max_estimate(pulprogressmax : UInt32*) : HRESULT
    @lpVtbl.value.get_progress_feedback_max_estimate.unsafe_as(Proc(UInt32*, HRESULT)).call(pulprogressmax)
  end
end
struct LibWin32::IBriefcaseInitiator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_moniker_in_briefcase(pmk : IMoniker) : HRESULT
    @lpVtbl.value.is_moniker_in_briefcase.unsafe_as(Proc(IMoniker, HRESULT)).call(pmk)
  end
end
struct LibWin32::IActiveDesktopP
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_safe_mode(dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_safe_mode.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def ensure_update_html : HRESULT
    @lpVtbl.value.ensure_update_html.unsafe_as(Proc(HRESULT)).call
  end
  def set_scheme(pwszschemename : LibC::LPWSTR, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_scheme.unsafe_as(Proc(LibC::LPWSTR, UInt32, HRESULT)).call(pwszschemename, dwflags)
  end
  def get_scheme(pwszschemename : Char*, pdwcchbuffer : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.get_scheme.unsafe_as(Proc(Char*, UInt32*, UInt32, HRESULT)).call(pwszschemename, pdwcchbuffer, dwflags)
  end
end
struct LibWin32::IADesktopP2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def re_read_wallpaper : HRESULT
    @lpVtbl.value.re_read_wallpaper.unsafe_as(Proc(HRESULT)).call
  end
  def get_ad_object_flags(pdwflags : UInt32*, dwmask : UInt32) : HRESULT
    @lpVtbl.value.get_ad_object_flags.unsafe_as(Proc(UInt32*, UInt32, HRESULT)).call(pdwflags, dwmask)
  end
  def update_all_desktop_subscriptions : HRESULT
    @lpVtbl.value.update_all_desktop_subscriptions.unsafe_as(Proc(HRESULT)).call
  end
  def make_dynamic_changes(poleobj : IOleObject) : HRESULT
    @lpVtbl.value.make_dynamic_changes.unsafe_as(Proc(IOleObject, HRESULT)).call(poleobj)
  end
end
