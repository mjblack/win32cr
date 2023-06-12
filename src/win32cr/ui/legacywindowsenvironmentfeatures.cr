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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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
    query_interface : Proc(IEmptyVolumeCacheCallBack*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEmptyVolumeCacheCallBack*, UInt32)
    release : Proc(IEmptyVolumeCacheCallBack*, UInt32)
    scan_progress : Proc(IEmptyVolumeCacheCallBack*, UInt64, UInt32, LibC::LPWSTR, HRESULT)
    purge_progress : Proc(IEmptyVolumeCacheCallBack*, UInt64, UInt64, UInt32, LibC::LPWSTR, HRESULT)
  end

  IEmptyVolumeCacheCallBack_GUID = LibC::GUID.new("6e793361-73c6-11d0-8469-00aa00442901")
  CLSID_IEmptyVolumeCacheCallBack = "6e793361-73c6-11d0-8469-00aa00442901"
  struct IEmptyVolumeCacheCallBack
    lpVtbl : IEmptyVolumeCacheCallBackVTbl*
  end

  struct IEmptyVolumeCacheVTbl
    query_interface : Proc(IEmptyVolumeCache*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEmptyVolumeCache*, UInt32)
    release : Proc(IEmptyVolumeCache*, UInt32)
    initialize : Proc(IEmptyVolumeCache*, HKEY, LibC::LPWSTR, LibC::LPWSTR*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_space_used : Proc(IEmptyVolumeCache*, UInt64*, IEmptyVolumeCacheCallBack, HRESULT)
    purge : Proc(IEmptyVolumeCache*, UInt64, IEmptyVolumeCacheCallBack, HRESULT)
    show_properties : Proc(IEmptyVolumeCache*, LibC::HANDLE, HRESULT)
    deactivate : Proc(IEmptyVolumeCache*, UInt32*, HRESULT)
  end

  IEmptyVolumeCache_GUID = LibC::GUID.new("8fce5227-04da-11d1-a004-00805f8abe06")
  CLSID_IEmptyVolumeCache = "8fce5227-04da-11d1-a004-00805f8abe06"
  struct IEmptyVolumeCache
    lpVtbl : IEmptyVolumeCacheVTbl*
  end

  struct IEmptyVolumeCache2VTbl
    query_interface : Proc(IEmptyVolumeCache2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IEmptyVolumeCache2*, UInt32)
    release : Proc(IEmptyVolumeCache2*, UInt32)
    initialize : Proc(IEmptyVolumeCache2*, HKEY, LibC::LPWSTR, LibC::LPWSTR*, LibC::LPWSTR*, UInt32*, HRESULT)
    get_space_used : Proc(IEmptyVolumeCache2*, UInt64*, IEmptyVolumeCacheCallBack, HRESULT)
    purge : Proc(IEmptyVolumeCache2*, UInt64, IEmptyVolumeCacheCallBack, HRESULT)
    show_properties : Proc(IEmptyVolumeCache2*, LibC::HANDLE, HRESULT)
    deactivate : Proc(IEmptyVolumeCache2*, UInt32*, HRESULT)
    initialize_ex : Proc(IEmptyVolumeCache2*, HKEY, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, LibC::LPWSTR*, LibC::LPWSTR*, UInt32*, HRESULT)
  end

  IEmptyVolumeCache2_GUID = LibC::GUID.new("02b7e3ba-4db3-11d2-b2d9-00c04f8eec8c")
  CLSID_IEmptyVolumeCache2 = "02b7e3ba-4db3-11d2-b2d9-00c04f8eec8c"
  struct IEmptyVolumeCache2
    lpVtbl : IEmptyVolumeCache2VTbl*
  end

  struct IReconcileInitiatorVTbl
    query_interface : Proc(IReconcileInitiator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReconcileInitiator*, UInt32)
    release : Proc(IReconcileInitiator*, UInt32)
    set_abort_callback : Proc(IReconcileInitiator*, IUnknown, HRESULT)
    set_progress_feedback : Proc(IReconcileInitiator*, UInt32, UInt32, HRESULT)
  end

  IReconcileInitiator_GUID = LibC::GUID.new("99180161-da16-101a-935c-444553540000")
  CLSID_IReconcileInitiator = "99180161-da16-101a-935c-444553540000"
  struct IReconcileInitiator
    lpVtbl : IReconcileInitiatorVTbl*
  end

  struct IReconcilableObjectVTbl
    query_interface : Proc(IReconcilableObject*, Guid*, Void**, HRESULT)
    add_ref : Proc(IReconcilableObject*, UInt32)
    release : Proc(IReconcilableObject*, UInt32)
    reconcile : Proc(IReconcilableObject*, IReconcileInitiator, UInt32, LibC::HANDLE, LibC::HANDLE, UInt32, IMoniker*, Int32*, IStorage, Void*, HRESULT)
    get_progress_feedback_max_estimate : Proc(IReconcilableObject*, UInt32*, HRESULT)
  end

  IReconcilableObject_GUID = LibC::GUID.new("99180162-da16-101a-935c-444553540000")
  CLSID_IReconcilableObject = "99180162-da16-101a-935c-444553540000"
  struct IReconcilableObject
    lpVtbl : IReconcilableObjectVTbl*
  end

  struct IBriefcaseInitiatorVTbl
    query_interface : Proc(IBriefcaseInitiator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IBriefcaseInitiator*, UInt32)
    release : Proc(IBriefcaseInitiator*, UInt32)
    is_moniker_in_briefcase : Proc(IBriefcaseInitiator*, IMoniker, HRESULT)
  end

  IBriefcaseInitiator_GUID = LibC::GUID.new("99180164-da16-101a-935c-444553540000")
  CLSID_IBriefcaseInitiator = "99180164-da16-101a-935c-444553540000"
  struct IBriefcaseInitiator
    lpVtbl : IBriefcaseInitiatorVTbl*
  end

  struct IActiveDesktopPVTbl
    query_interface : Proc(IActiveDesktopP*, Guid*, Void**, HRESULT)
    add_ref : Proc(IActiveDesktopP*, UInt32)
    release : Proc(IActiveDesktopP*, UInt32)
    set_safe_mode : Proc(IActiveDesktopP*, UInt32, HRESULT)
    ensure_update_html : Proc(IActiveDesktopP*, HRESULT)
    set_scheme : Proc(IActiveDesktopP*, LibC::LPWSTR, UInt32, HRESULT)
    get_scheme : Proc(IActiveDesktopP*, Char*, UInt32*, UInt32, HRESULT)
  end

  IActiveDesktopP_GUID = LibC::GUID.new("52502ee0-ec80-11d0-89ab-00c04fc2972d")
  CLSID_IActiveDesktopP = "52502ee0-ec80-11d0-89ab-00c04fc2972d"
  struct IActiveDesktopP
    lpVtbl : IActiveDesktopPVTbl*
  end

  struct IADesktopP2VTbl
    query_interface : Proc(IADesktopP2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IADesktopP2*, UInt32)
    release : Proc(IADesktopP2*, UInt32)
    re_read_wallpaper : Proc(IADesktopP2*, HRESULT)
    get_ad_object_flags : Proc(IADesktopP2*, UInt32*, UInt32, HRESULT)
    update_all_desktop_subscriptions : Proc(IADesktopP2*, HRESULT)
    make_dynamic_changes : Proc(IADesktopP2*, IOleObject, HRESULT)
  end

  IADesktopP2_GUID = LibC::GUID.new("b22754e2-4574-11d1-9888-006097deacf9")
  CLSID_IADesktopP2 = "b22754e2-4574-11d1-9888-006097deacf9"
  struct IADesktopP2
    lpVtbl : IADesktopP2VTbl*
  end

end
